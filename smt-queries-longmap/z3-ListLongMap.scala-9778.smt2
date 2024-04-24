; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116098 () Bool)

(assert start!116098)

(declare-fun b!1371049 () Bool)

(declare-fun res!913730 () Bool)

(declare-fun e!776753 () Bool)

(assert (=> b!1371049 (=> (not res!913730) (not e!776753))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93103 0))(
  ( (array!93104 (arr!44968 (Array (_ BitVec 32) (_ BitVec 64))) (size!45519 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93103)

(assert (=> b!1371049 (= res!913730 (bvslt from!3239 (size!45519 a!3861)))))

(declare-fun b!1371050 () Bool)

(declare-fun res!913737 () Bool)

(declare-fun e!776754 () Bool)

(assert (=> b!1371050 (=> (not res!913737) (not e!776754))))

(declare-datatypes ((List!32023 0))(
  ( (Nil!32020) (Cons!32019 (h!33237 (_ BitVec 64)) (t!46709 List!32023)) )
))
(declare-fun acc!866 () List!32023)

(declare-fun contains!9708 (List!32023 (_ BitVec 64)) Bool)

(assert (=> b!1371050 (= res!913737 (not (contains!9708 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371051 () Bool)

(declare-fun res!913734 () Bool)

(assert (=> b!1371051 (=> (not res!913734) (not e!776754))))

(declare-fun noDuplicate!2539 (List!32023) Bool)

(assert (=> b!1371051 (= res!913734 (noDuplicate!2539 acc!866))))

(declare-fun b!1371052 () Bool)

(declare-fun res!913735 () Bool)

(assert (=> b!1371052 (=> (not res!913735) (not e!776753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371052 (= res!913735 (validKeyInArray!0 (select (arr!44968 a!3861) from!3239)))))

(declare-fun b!1371053 () Bool)

(declare-fun res!913729 () Bool)

(assert (=> b!1371053 (=> (not res!913729) (not e!776754))))

(declare-fun newAcc!98 () List!32023)

(assert (=> b!1371053 (= res!913729 (not (contains!9708 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371054 () Bool)

(declare-fun res!913732 () Bool)

(assert (=> b!1371054 (=> (not res!913732) (not e!776754))))

(declare-fun subseq!1067 (List!32023 List!32023) Bool)

(assert (=> b!1371054 (= res!913732 (subseq!1067 newAcc!98 acc!866))))

(declare-fun b!1371055 () Bool)

(assert (=> b!1371055 (= e!776754 e!776753)))

(declare-fun res!913728 () Bool)

(assert (=> b!1371055 (=> (not res!913728) (not e!776753))))

(declare-fun arrayNoDuplicates!0 (array!93103 (_ BitVec 32) List!32023) Bool)

(assert (=> b!1371055 (= res!913728 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45206 0))(
  ( (Unit!45207) )
))
(declare-fun lt!602811 () Unit!45206)

(declare-fun noDuplicateSubseq!254 (List!32023 List!32023) Unit!45206)

(assert (=> b!1371055 (= lt!602811 (noDuplicateSubseq!254 newAcc!98 acc!866))))

(declare-fun res!913736 () Bool)

(assert (=> start!116098 (=> (not res!913736) (not e!776754))))

(assert (=> start!116098 (= res!913736 (and (bvslt (size!45519 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45519 a!3861))))))

(assert (=> start!116098 e!776754))

(declare-fun array_inv!34249 (array!93103) Bool)

(assert (=> start!116098 (array_inv!34249 a!3861)))

(assert (=> start!116098 true))

(declare-fun b!1371056 () Bool)

(declare-fun res!913733 () Bool)

(assert (=> b!1371056 (=> (not res!913733) (not e!776754))))

(assert (=> b!1371056 (= res!913733 (not (contains!9708 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371057 () Bool)

(declare-fun res!913731 () Bool)

(assert (=> b!1371057 (=> (not res!913731) (not e!776754))))

(assert (=> b!1371057 (= res!913731 (not (contains!9708 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371058 () Bool)

(assert (=> b!1371058 (= e!776753 false)))

(declare-fun lt!602810 () Bool)

(assert (=> b!1371058 (= lt!602810 (contains!9708 acc!866 (select (arr!44968 a!3861) from!3239)))))

(assert (= (and start!116098 res!913736) b!1371051))

(assert (= (and b!1371051 res!913734) b!1371050))

(assert (= (and b!1371050 res!913737) b!1371056))

(assert (= (and b!1371056 res!913733) b!1371057))

(assert (= (and b!1371057 res!913731) b!1371053))

(assert (= (and b!1371053 res!913729) b!1371054))

(assert (= (and b!1371054 res!913732) b!1371055))

(assert (= (and b!1371055 res!913728) b!1371049))

(assert (= (and b!1371049 res!913730) b!1371052))

(assert (= (and b!1371052 res!913735) b!1371058))

(declare-fun m!1255069 () Bool)

(assert (=> b!1371052 m!1255069))

(assert (=> b!1371052 m!1255069))

(declare-fun m!1255071 () Bool)

(assert (=> b!1371052 m!1255071))

(declare-fun m!1255073 () Bool)

(assert (=> b!1371051 m!1255073))

(declare-fun m!1255075 () Bool)

(assert (=> b!1371055 m!1255075))

(declare-fun m!1255077 () Bool)

(assert (=> b!1371055 m!1255077))

(declare-fun m!1255079 () Bool)

(assert (=> b!1371053 m!1255079))

(declare-fun m!1255081 () Bool)

(assert (=> b!1371056 m!1255081))

(declare-fun m!1255083 () Bool)

(assert (=> start!116098 m!1255083))

(declare-fun m!1255085 () Bool)

(assert (=> b!1371057 m!1255085))

(assert (=> b!1371058 m!1255069))

(assert (=> b!1371058 m!1255069))

(declare-fun m!1255087 () Bool)

(assert (=> b!1371058 m!1255087))

(declare-fun m!1255089 () Bool)

(assert (=> b!1371050 m!1255089))

(declare-fun m!1255091 () Bool)

(assert (=> b!1371054 m!1255091))

(check-sat (not b!1371054) (not b!1371050) (not b!1371057) (not b!1371058) (not b!1371052) (not b!1371053) (not b!1371056) (not b!1371055) (not b!1371051) (not start!116098))
(check-sat)
