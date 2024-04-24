; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115654 () Bool)

(assert start!115654)

(declare-fun res!909052 () Bool)

(declare-fun e!774940 () Bool)

(assert (=> start!115654 (=> (not res!909052) (not e!774940))))

(declare-datatypes ((array!92866 0))(
  ( (array!92867 (arr!44857 (Array (_ BitVec 32) (_ BitVec 64))) (size!45408 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92866)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115654 (= res!909052 (and (bvslt (size!45408 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45408 a!3861))))))

(assert (=> start!115654 e!774940))

(declare-fun array_inv!34138 (array!92866) Bool)

(assert (=> start!115654 (array_inv!34138 a!3861)))

(assert (=> start!115654 true))

(declare-fun b!1366258 () Bool)

(declare-fun res!909056 () Bool)

(assert (=> b!1366258 (=> (not res!909056) (not e!774940))))

(declare-datatypes ((List!31912 0))(
  ( (Nil!31909) (Cons!31908 (h!33126 (_ BitVec 64)) (t!46598 List!31912)) )
))
(declare-fun newAcc!98 () List!31912)

(declare-fun contains!9597 (List!31912 (_ BitVec 64)) Bool)

(assert (=> b!1366258 (= res!909056 (not (contains!9597 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366259 () Bool)

(declare-fun res!909054 () Bool)

(assert (=> b!1366259 (=> (not res!909054) (not e!774940))))

(assert (=> b!1366259 (= res!909054 (not (contains!9597 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366260 () Bool)

(declare-fun res!909053 () Bool)

(assert (=> b!1366260 (=> (not res!909053) (not e!774940))))

(declare-fun acc!866 () List!31912)

(assert (=> b!1366260 (= res!909053 (not (contains!9597 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366261 () Bool)

(declare-fun res!909051 () Bool)

(assert (=> b!1366261 (=> (not res!909051) (not e!774940))))

(assert (=> b!1366261 (= res!909051 (not (contains!9597 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366262 () Bool)

(assert (=> b!1366262 (= e!774940 false)))

(declare-datatypes ((Unit!44984 0))(
  ( (Unit!44985) )
))
(declare-fun lt!601644 () Unit!44984)

(declare-fun noDuplicateSubseq!143 (List!31912 List!31912) Unit!44984)

(assert (=> b!1366262 (= lt!601644 (noDuplicateSubseq!143 newAcc!98 acc!866))))

(declare-fun b!1366263 () Bool)

(declare-fun res!909057 () Bool)

(assert (=> b!1366263 (=> (not res!909057) (not e!774940))))

(declare-fun noDuplicate!2428 (List!31912) Bool)

(assert (=> b!1366263 (= res!909057 (noDuplicate!2428 acc!866))))

(declare-fun b!1366264 () Bool)

(declare-fun res!909055 () Bool)

(assert (=> b!1366264 (=> (not res!909055) (not e!774940))))

(declare-fun subseq!956 (List!31912 List!31912) Bool)

(assert (=> b!1366264 (= res!909055 (subseq!956 newAcc!98 acc!866))))

(assert (= (and start!115654 res!909052) b!1366263))

(assert (= (and b!1366263 res!909057) b!1366261))

(assert (= (and b!1366261 res!909051) b!1366260))

(assert (= (and b!1366260 res!909053) b!1366258))

(assert (= (and b!1366258 res!909056) b!1366259))

(assert (= (and b!1366259 res!909054) b!1366264))

(assert (= (and b!1366264 res!909055) b!1366262))

(declare-fun m!1251241 () Bool)

(assert (=> start!115654 m!1251241))

(declare-fun m!1251243 () Bool)

(assert (=> b!1366264 m!1251243))

(declare-fun m!1251245 () Bool)

(assert (=> b!1366262 m!1251245))

(declare-fun m!1251247 () Bool)

(assert (=> b!1366259 m!1251247))

(declare-fun m!1251249 () Bool)

(assert (=> b!1366258 m!1251249))

(declare-fun m!1251251 () Bool)

(assert (=> b!1366260 m!1251251))

(declare-fun m!1251253 () Bool)

(assert (=> b!1366263 m!1251253))

(declare-fun m!1251255 () Bool)

(assert (=> b!1366261 m!1251255))

(check-sat (not b!1366260) (not start!115654) (not b!1366261) (not b!1366264) (not b!1366259) (not b!1366263) (not b!1366258) (not b!1366262))
(check-sat)
