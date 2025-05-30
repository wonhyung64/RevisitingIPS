import torch
import torch.nn as nn


class MF(nn.Module):
    """
    Matrix Factorization
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int):
        super(MF, self).__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.user_embedding = nn.Embedding(self.num_users, self.embedding_k)
        self.item_embedding = nn.Embedding(self.num_items, self.embedding_k)

    def forward(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        user_embed = self.user_embedding(user_idx)
        item_embed = self.item_embedding(item_idx)
        out = torch.sum(user_embed.mul(item_embed), 1).unsqueeze(-1)
        return out, user_embed, item_embed


class NCF(nn.Module):
    """
    Neural Collaborative Filtering
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int, depth:int=0):
        super(NCF, self).__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.depth = depth
        self.user_embedding = nn.Embedding(self.num_users, self.embedding_k)
        self.item_embedding = nn.Embedding(self.num_items, self.embedding_k)
        layers_y1 = [nn.Linear(self.embedding_k*2, self.embedding_k), nn.ReLU()]
        for _ in range(self.depth):
            layers_y1.append(nn.Linear(self.embedding_k, self.embedding_k))
            layers_y1.append(nn.ReLU())
        layers_y1.append(nn.Linear(self.embedding_k, 1, bias=False))
        self.y1 = nn.Sequential(*layers_y1)

    def forward(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        user_embed = self.user_embedding(user_idx)
        item_embed = self.item_embedding(item_idx)
        z_embed = torch.cat([user_embed, item_embed], axis=1)
        out = self.y1(z_embed)
        return out, user_embed, item_embed


class LinearCF(nn.Module):
    """
    Linear Collaborative Filtering
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int):
        super(LinearCF, self).__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.user_embedding = nn.Embedding(self.num_users, self.embedding_k)
        self.item_embedding = nn.Embedding(self.num_items, self.embedding_k)
        self.linear_1 = nn.Linear(self.embedding_k*2, 1, bias=True)

    def forward(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        user_embed = self.user_embedding(user_idx)
        item_embed = self.item_embedding(item_idx)
        z_embed = torch.cat([user_embed, item_embed], axis=1)
        out = self.linear_1(z_embed)
        return out, user_embed, item_embed


class SharedNCF(nn.Module):
    """
    Neural Collaborative Filtering with Embedding Sharing
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int, depth:int=0):
        super(SharedNCF, self).__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.depth = depth
        self.user_embedding = nn.Embedding(self.num_users, self.embedding_k)
        self.item_embedding = nn.Embedding(self.num_items, self.embedding_k)
        self.ctr = nn.Sequential(
            nn.Linear(self.embedding_k*2, self.embedding_k),
            nn.ReLU(),
            nn.Linear(self.embedding_k, 1, bias=False),
        )
        layers_y1 = [nn.Linear(self.embedding_k*2, self.embedding_k), nn.ReLU()]
        for _ in range(self.depth):
            layers_y1.append(nn.Linear(self.embedding_k, self.embedding_k))
            layers_y1.append(nn.ReLU())
        layers_y1.append(nn.Linear(self.embedding_k, 1, bias=False))
        self.y1 = nn.Sequential(*layers_y1)

    def forward(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        user_embed = self.user_embedding(user_idx)
        item_embed = self.item_embedding(item_idx)
        z_embed = torch.cat([user_embed, item_embed], axis=1)
        ctr = self.ctr(z_embed)
        cvr = self.y1(z_embed)
        ctcvr = torch.mul(nn.Sigmoid()(ctr), nn.Sigmoid()(cvr))
        return cvr, ctr, ctcvr


class SharedMF(nn.Module):
    """
    Matrix Factorization with Embedding Sharing
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int):
        super(SharedMF, self).__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.user_embedding = nn.Embedding(self.num_users, self.embedding_k)
        self.item_embedding = nn.Embedding(self.num_items, self.embedding_k)
        self.ctr = nn.Sequential(
            nn.Linear(self.embedding_k*2, self.embedding_k),
            nn.ReLU(),
            nn.Linear(self.embedding_k, 1, bias=False),
        )

    def forward(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        user_embed = self.user_embedding(user_idx)
        item_embed = self.item_embedding(item_idx)
        z_embed = torch.cat([user_embed, item_embed], axis=1)
        ctr = self.ctr(z_embed)
        cvr = torch.sum(user_embed.mul(item_embed), 1).unsqueeze(-1)
        ctcvr = torch.mul(nn.Sigmoid()(ctr), nn.Sigmoid()(cvr))
        return cvr, ctr, ctcvr


class IpsV2(nn.Module):
    """
    IPS-V2 with Neural Collaborative Filtering
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int=4, depth:int=0, *args, **kwargs):
        super().__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.depth = depth
        self.prediction_model = NCF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, depth=self.depth, *args, **kwargs)       
        self.propensity_model = LinearCF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, *args, **kwargs)


class IpsV2MF(nn.Module):
    """
    IPS-V2 with Matrix Factorization
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int=4, *args, **kwargs):
        super().__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.prediction_model = MF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, *args, **kwargs)       
        self.propensity_model = LinearCF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, *args, **kwargs)


class NCF_AKBIPS_Exp(nn.Module):
    """
    AKB-IPS with Neural Collaborative Filtering
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int=4, dataset_name:str="coat", depth:int=0, *args, **kwargs):
        super().__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.depth = depth
        self.W = nn.Embedding(self.num_users, self.embedding_k)
        self.H = nn.Embedding(self.num_items, self.embedding_k)
        self.prediction_model = NCF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, depth=self.depth, *args, **kwargs)
        self.weight_model = MF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, *args, **kwargs)
        if dataset_name == "coat":
            self.epsilon = nn.Parameter(torch.rand(1,4096)) 
        elif dataset_name == "yahoo_r3":
            self.epsilon = nn.Parameter(torch.rand(1,8192)) 

    def get_embedding(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        U_emb = self.W(user_idx)
        V_emb = self.H(item_idx)
        feature = torch.cat([U_emb ,V_emb ],dim=1)  
        f_min = torch.min(feature)
        f_max = torch.max(feature)
        feature = feature - f_min / (f_max - f_min)                
        feature = feature/feature.shape[1]
        return feature

    def exp_kernel(self, x, y, gamma:float=0.1):
        Euclidean_distances = abs(torch.cdist(y,x))
        return torch.exp(-Euclidean_distances * gamma)


class MF_AKBIPS_Exp(nn.Module):
    """
    AKB-IPS with Matrix Facotrization
    """
    def __init__(self, num_users:int, num_items:int, embedding_k:int=4, dataset_name:str="coat", *args, **kwargs):
        super().__init__()
        self.num_users = num_users
        self.num_items = num_items
        self.embedding_k = embedding_k
        self.W = nn.Embedding(self.num_users, self.embedding_k)
        self.H = nn.Embedding(self.num_items, self.embedding_k)
        self.prediction_model = MF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, *args, **kwargs)
        self.weight_model = MF(
            num_users=self.num_users, num_items=self.num_items, embedding_k=self.embedding_k, *args, **kwargs)
        if dataset_name == "coat":
            self.epsilon = nn.Parameter(torch.rand(1,4096)) 
        elif dataset_name == "yahoo_r3":
            self.epsilon = nn.Parameter(torch.rand(1,8192)) 

    def get_embedding(self, x):
        user_idx = x[:,0]
        item_idx = x[:,1]
        U_emb = self.W(user_idx)
        V_emb = self.H(item_idx)
        feature = torch.cat([U_emb ,V_emb ],dim=1)  
        f_min = torch.min(feature)
        f_max = torch.max(feature)
        feature = feature - f_min / (f_max - f_min)                
        feature = feature/feature.shape[1]
        return feature

    def exp_kernel(self, x, y, gamma:float=0.1):
        Euclidean_distances = abs(torch.cdist(y,x))
        return torch.exp(-Euclidean_distances * gamma)
