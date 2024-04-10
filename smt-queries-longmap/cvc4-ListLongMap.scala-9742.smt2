; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115440 () Bool)

(assert start!115440)

(declare-fun b!1365064 () Bool)

(declare-fun res!908644 () Bool)

(declare-fun e!774126 () Bool)

(assert (=> b!1365064 (=> (not res!908644) (not e!774126))))

(declare-datatypes ((List!31877 0))(
  ( (Nil!31874) (Cons!31873 (h!33082 (_ BitVec 64)) (t!46571 List!31877)) )
))
(declare-fun newAcc!98 () List!31877)

(declare-fun contains!9559 (List!31877 (_ BitVec 64)) Bool)

(assert (=> b!1365064 (= res!908644 (not (contains!9559 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365065 () Bool)

(declare-fun res!908639 () Bool)

(assert (=> b!1365065 (=> (not res!908639) (not e!774126))))

(assert (=> b!1365065 (= res!908639 (not (contains!9559 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365066 () Bool)

(assert (=> b!1365066 (= e!774126 false)))

(declare-datatypes ((Unit!45055 0))(
  ( (Unit!45056) )
))
(declare-fun lt!601183 () Unit!45055)

(declare-fun acc!866 () List!31877)

(declare-fun noDuplicateSubseq!148 (List!31877 List!31877) Unit!45055)

(assert (=> b!1365066 (= lt!601183 (noDuplicateSubseq!148 newAcc!98 acc!866))))

(declare-fun b!1365067 () Bool)

(declare-fun res!908641 () Bool)

(assert (=> b!1365067 (=> (not res!908641) (not e!774126))))

(assert (=> b!1365067 (= res!908641 (not (contains!9559 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908640 () Bool)

(assert (=> start!115440 (=> (not res!908640) (not e!774126))))

(declare-datatypes ((array!92761 0))(
  ( (array!92762 (arr!44809 (Array (_ BitVec 32) (_ BitVec 64))) (size!45359 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92761)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115440 (= res!908640 (and (bvslt (size!45359 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45359 a!3861))))))

(assert (=> start!115440 e!774126))

(declare-fun array_inv!33837 (array!92761) Bool)

(assert (=> start!115440 (array_inv!33837 a!3861)))

(assert (=> start!115440 true))

(declare-fun b!1365068 () Bool)

(declare-fun res!908638 () Bool)

(assert (=> b!1365068 (=> (not res!908638) (not e!774126))))

(assert (=> b!1365068 (= res!908638 (not (contains!9559 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365069 () Bool)

(declare-fun res!908642 () Bool)

(assert (=> b!1365069 (=> (not res!908642) (not e!774126))))

(declare-fun noDuplicate!2416 (List!31877) Bool)

(assert (=> b!1365069 (= res!908642 (noDuplicate!2416 acc!866))))

(declare-fun b!1365070 () Bool)

(declare-fun res!908643 () Bool)

(assert (=> b!1365070 (=> (not res!908643) (not e!774126))))

(declare-fun subseq!961 (List!31877 List!31877) Bool)

(assert (=> b!1365070 (= res!908643 (subseq!961 newAcc!98 acc!866))))

(assert (= (and start!115440 res!908640) b!1365069))

(assert (= (and b!1365069 res!908642) b!1365068))

(assert (= (and b!1365068 res!908638) b!1365067))

(assert (= (and b!1365067 res!908641) b!1365064))

(assert (= (and b!1365064 res!908644) b!1365065))

(assert (= (and b!1365065 res!908639) b!1365070))

(assert (= (and b!1365070 res!908643) b!1365066))

(declare-fun m!1249725 () Bool)

(assert (=> b!1365070 m!1249725))

(declare-fun m!1249727 () Bool)

(assert (=> b!1365067 m!1249727))

(declare-fun m!1249729 () Bool)

(assert (=> b!1365066 m!1249729))

(declare-fun m!1249731 () Bool)

(assert (=> b!1365068 m!1249731))

(declare-fun m!1249733 () Bool)

(assert (=> b!1365065 m!1249733))

(declare-fun m!1249735 () Bool)

(assert (=> b!1365069 m!1249735))

(declare-fun m!1249737 () Bool)

(assert (=> start!115440 m!1249737))

(declare-fun m!1249739 () Bool)

(assert (=> b!1365064 m!1249739))

(push 1)

(assert (not b!1365070))

(assert (not b!1365064))

(assert (not start!115440))

(assert (not b!1365065))

(assert (not b!1365069))

(assert (not b!1365066))

(assert (not b!1365067))

(assert (not b!1365068))

(check-sat)

(pop 1)

