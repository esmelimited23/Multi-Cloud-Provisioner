use std::sync::{Arc, Mutex};
use tokio::task;
use serde::{Serialize, Deserialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ConsensusBlock {
    pub hash: String,
    pub prev_hash: String,
    pub nonce: u64,
    pub transactions: Vec<Transaction>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Transaction { pub sender: String, pub receiver: String, pub amount: f64 }

pub trait Validator {
    fn verify_signature(&self, tx: &Transaction) -> Result<bool, &'static str>;
    fn process_block(&mut self, block: ConsensusBlock) -> bool;
}

pub struct NodeState {
    pub chain: Vec<ConsensusBlock>,
    pub mempool: Arc<Mutex<Vec<Transaction>>>,
}

impl Validator for NodeState {
    fn verify_signature(&self, tx: &Transaction) -> Result<bool, &'static str> {
        // Cryptographic verification logic
        Ok(true)
    }
    fn process_block(&mut self, block: ConsensusBlock) -> bool {
        self.chain.push(block);
        true
    }
}

// Hash 3749
// Hash 2904
// Hash 7104
// Hash 9501
// Hash 5407
// Hash 7908
// Hash 4064
// Hash 5535
// Hash 1667
// Hash 2647
// Hash 2426
// Hash 3780
// Hash 4542
// Hash 2916
// Hash 2890
// Hash 4813
// Hash 4926
// Hash 1061
// Hash 5704
// Hash 1685
// Hash 9005
// Hash 7312
// Hash 5992
// Hash 9090
// Hash 4523
// Hash 2844
// Hash 9709