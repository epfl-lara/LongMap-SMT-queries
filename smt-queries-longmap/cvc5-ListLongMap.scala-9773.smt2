; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115808 () Bool)

(assert start!115808)

(declare-fun res!912722 () Bool)

(declare-fun e!775660 () Bool)

(assert (=> start!115808 (=> (not res!912722) (not e!775660))))

(declare-datatypes ((array!92955 0))(
  ( (array!92956 (arr!44900 (Array (_ BitVec 32) (_ BitVec 64))) (size!45450 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92955)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115808 (= res!912722 (and (bvslt (size!45450 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45450 a!3861))))))

(assert (=> start!115808 e!775660))

(declare-fun array_inv!33928 (array!92955) Bool)

(assert (=> start!115808 (array_inv!33928 a!3861)))

(assert (=> start!115808 true))

(declare-fun b!1369243 () Bool)

(declare-fun res!912727 () Bool)

(assert (=> b!1369243 (=> (not res!912727) (not e!775660))))

(declare-datatypes ((List!31968 0))(
  ( (Nil!31965) (Cons!31964 (h!33173 (_ BitVec 64)) (t!46662 List!31968)) )
))
(declare-fun acc!866 () List!31968)

(declare-fun contains!9650 (List!31968 (_ BitVec 64)) Bool)

(assert (=> b!1369243 (= res!912727 (not (contains!9650 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369244 () Bool)

(declare-fun res!912726 () Bool)

(assert (=> b!1369244 (=> (not res!912726) (not e!775660))))

(declare-fun noDuplicate!2507 (List!31968) Bool)

(assert (=> b!1369244 (= res!912726 (noDuplicate!2507 acc!866))))

(declare-fun b!1369245 () Bool)

(declare-fun res!912725 () Bool)

(assert (=> b!1369245 (=> (not res!912725) (not e!775660))))

(declare-fun newAcc!98 () List!31968)

(assert (=> b!1369245 (= res!912725 (not (contains!9650 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369246 () Bool)

(declare-fun res!912723 () Bool)

(assert (=> b!1369246 (=> (not res!912723) (not e!775660))))

(declare-fun subseq!1052 (List!31968 List!31968) Bool)

(assert (=> b!1369246 (= res!912723 (subseq!1052 newAcc!98 acc!866))))

(declare-fun b!1369247 () Bool)

(assert (=> b!1369247 (= e!775660 false)))

(declare-fun lt!602227 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92955 (_ BitVec 32) List!31968) Bool)

(assert (=> b!1369247 (= lt!602227 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45237 0))(
  ( (Unit!45238) )
))
(declare-fun lt!602226 () Unit!45237)

(declare-fun noDuplicateSubseq!239 (List!31968 List!31968) Unit!45237)

(assert (=> b!1369247 (= lt!602226 (noDuplicateSubseq!239 newAcc!98 acc!866))))

(declare-fun b!1369248 () Bool)

(declare-fun res!912724 () Bool)

(assert (=> b!1369248 (=> (not res!912724) (not e!775660))))

(assert (=> b!1369248 (= res!912724 (not (contains!9650 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369249 () Bool)

(declare-fun res!912721 () Bool)

(assert (=> b!1369249 (=> (not res!912721) (not e!775660))))

(assert (=> b!1369249 (= res!912721 (not (contains!9650 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115808 res!912722) b!1369244))

(assert (= (and b!1369244 res!912726) b!1369248))

(assert (= (and b!1369248 res!912724) b!1369243))

(assert (= (and b!1369243 res!912727) b!1369245))

(assert (= (and b!1369245 res!912725) b!1369249))

(assert (= (and b!1369249 res!912721) b!1369246))

(assert (= (and b!1369246 res!912723) b!1369247))

(declare-fun m!1253065 () Bool)

(assert (=> start!115808 m!1253065))

(declare-fun m!1253067 () Bool)

(assert (=> b!1369246 m!1253067))

(declare-fun m!1253069 () Bool)

(assert (=> b!1369245 m!1253069))

(declare-fun m!1253071 () Bool)

(assert (=> b!1369243 m!1253071))

(declare-fun m!1253073 () Bool)

(assert (=> b!1369249 m!1253073))

(declare-fun m!1253075 () Bool)

(assert (=> b!1369248 m!1253075))

(declare-fun m!1253077 () Bool)

(assert (=> b!1369244 m!1253077))

(declare-fun m!1253079 () Bool)

(assert (=> b!1369247 m!1253079))

(declare-fun m!1253081 () Bool)

(assert (=> b!1369247 m!1253081))

(push 1)

(assert (not b!1369246))

(assert (not b!1369248))

(assert (not b!1369249))

(assert (not b!1369245))

(assert (not b!1369244))

(assert (not start!115808))

(assert (not b!1369243))

(assert (not b!1369247))

(check-sat)

(pop 1)

