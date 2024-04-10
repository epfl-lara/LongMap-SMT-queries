; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115430 () Bool)

(assert start!115430)

(declare-fun b!1364959 () Bool)

(declare-fun res!908539 () Bool)

(declare-fun e!774097 () Bool)

(assert (=> b!1364959 (=> (not res!908539) (not e!774097))))

(declare-datatypes ((List!31872 0))(
  ( (Nil!31869) (Cons!31868 (h!33077 (_ BitVec 64)) (t!46566 List!31872)) )
))
(declare-fun acc!866 () List!31872)

(declare-fun noDuplicate!2411 (List!31872) Bool)

(assert (=> b!1364959 (= res!908539 (noDuplicate!2411 acc!866))))

(declare-fun b!1364960 () Bool)

(declare-fun res!908538 () Bool)

(assert (=> b!1364960 (=> (not res!908538) (not e!774097))))

(declare-fun newAcc!98 () List!31872)

(declare-fun contains!9554 (List!31872 (_ BitVec 64)) Bool)

(assert (=> b!1364960 (= res!908538 (not (contains!9554 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364961 () Bool)

(assert (=> b!1364961 (= e!774097 false)))

(declare-datatypes ((Unit!45045 0))(
  ( (Unit!45046) )
))
(declare-fun lt!601168 () Unit!45045)

(declare-fun noDuplicateSubseq!143 (List!31872 List!31872) Unit!45045)

(assert (=> b!1364961 (= lt!601168 (noDuplicateSubseq!143 newAcc!98 acc!866))))

(declare-fun b!1364962 () Bool)

(declare-fun res!908535 () Bool)

(assert (=> b!1364962 (=> (not res!908535) (not e!774097))))

(assert (=> b!1364962 (= res!908535 (not (contains!9554 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364963 () Bool)

(declare-fun res!908537 () Bool)

(assert (=> b!1364963 (=> (not res!908537) (not e!774097))))

(declare-fun subseq!956 (List!31872 List!31872) Bool)

(assert (=> b!1364963 (= res!908537 (subseq!956 newAcc!98 acc!866))))

(declare-fun b!1364964 () Bool)

(declare-fun res!908536 () Bool)

(assert (=> b!1364964 (=> (not res!908536) (not e!774097))))

(assert (=> b!1364964 (= res!908536 (not (contains!9554 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908533 () Bool)

(assert (=> start!115430 (=> (not res!908533) (not e!774097))))

(declare-datatypes ((array!92751 0))(
  ( (array!92752 (arr!44804 (Array (_ BitVec 32) (_ BitVec 64))) (size!45354 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92751)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115430 (= res!908533 (and (bvslt (size!45354 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45354 a!3861))))))

(assert (=> start!115430 e!774097))

(declare-fun array_inv!33832 (array!92751) Bool)

(assert (=> start!115430 (array_inv!33832 a!3861)))

(assert (=> start!115430 true))

(declare-fun b!1364965 () Bool)

(declare-fun res!908534 () Bool)

(assert (=> b!1364965 (=> (not res!908534) (not e!774097))))

(assert (=> b!1364965 (= res!908534 (not (contains!9554 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115430 res!908533) b!1364959))

(assert (= (and b!1364959 res!908539) b!1364962))

(assert (= (and b!1364962 res!908535) b!1364965))

(assert (= (and b!1364965 res!908534) b!1364964))

(assert (= (and b!1364964 res!908536) b!1364960))

(assert (= (and b!1364960 res!908538) b!1364963))

(assert (= (and b!1364963 res!908537) b!1364961))

(declare-fun m!1249645 () Bool)

(assert (=> b!1364960 m!1249645))

(declare-fun m!1249647 () Bool)

(assert (=> b!1364961 m!1249647))

(declare-fun m!1249649 () Bool)

(assert (=> b!1364963 m!1249649))

(declare-fun m!1249651 () Bool)

(assert (=> start!115430 m!1249651))

(declare-fun m!1249653 () Bool)

(assert (=> b!1364959 m!1249653))

(declare-fun m!1249655 () Bool)

(assert (=> b!1364962 m!1249655))

(declare-fun m!1249657 () Bool)

(assert (=> b!1364964 m!1249657))

(declare-fun m!1249659 () Bool)

(assert (=> b!1364965 m!1249659))

(push 1)

(assert (not b!1364962))

(assert (not b!1364964))

(assert (not start!115430))

(assert (not b!1364965))

(assert (not b!1364961))

(assert (not b!1364963))

(assert (not b!1364959))

(assert (not b!1364960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

