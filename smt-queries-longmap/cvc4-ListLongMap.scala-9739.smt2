; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115422 () Bool)

(assert start!115422)

(declare-fun res!908452 () Bool)

(declare-fun e!774073 () Bool)

(assert (=> start!115422 (=> (not res!908452) (not e!774073))))

(declare-datatypes ((array!92743 0))(
  ( (array!92744 (arr!44800 (Array (_ BitVec 32) (_ BitVec 64))) (size!45350 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92743)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115422 (= res!908452 (and (bvslt (size!45350 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45350 a!3861))))))

(assert (=> start!115422 e!774073))

(declare-fun array_inv!33828 (array!92743) Bool)

(assert (=> start!115422 (array_inv!33828 a!3861)))

(assert (=> start!115422 true))

(declare-fun b!1364875 () Bool)

(assert (=> b!1364875 (= e!774073 false)))

(declare-datatypes ((Unit!45037 0))(
  ( (Unit!45038) )
))
(declare-fun lt!601156 () Unit!45037)

(declare-datatypes ((List!31868 0))(
  ( (Nil!31865) (Cons!31864 (h!33073 (_ BitVec 64)) (t!46562 List!31868)) )
))
(declare-fun newAcc!98 () List!31868)

(declare-fun acc!866 () List!31868)

(declare-fun noDuplicateSubseq!139 (List!31868 List!31868) Unit!45037)

(assert (=> b!1364875 (= lt!601156 (noDuplicateSubseq!139 newAcc!98 acc!866))))

(declare-fun b!1364876 () Bool)

(declare-fun res!908454 () Bool)

(assert (=> b!1364876 (=> (not res!908454) (not e!774073))))

(declare-fun contains!9550 (List!31868 (_ BitVec 64)) Bool)

(assert (=> b!1364876 (= res!908454 (not (contains!9550 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364877 () Bool)

(declare-fun res!908449 () Bool)

(assert (=> b!1364877 (=> (not res!908449) (not e!774073))))

(declare-fun noDuplicate!2407 (List!31868) Bool)

(assert (=> b!1364877 (= res!908449 (noDuplicate!2407 acc!866))))

(declare-fun b!1364878 () Bool)

(declare-fun res!908455 () Bool)

(assert (=> b!1364878 (=> (not res!908455) (not e!774073))))

(declare-fun subseq!952 (List!31868 List!31868) Bool)

(assert (=> b!1364878 (= res!908455 (subseq!952 newAcc!98 acc!866))))

(declare-fun b!1364879 () Bool)

(declare-fun res!908450 () Bool)

(assert (=> b!1364879 (=> (not res!908450) (not e!774073))))

(assert (=> b!1364879 (= res!908450 (not (contains!9550 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364880 () Bool)

(declare-fun res!908451 () Bool)

(assert (=> b!1364880 (=> (not res!908451) (not e!774073))))

(assert (=> b!1364880 (= res!908451 (not (contains!9550 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364881 () Bool)

(declare-fun res!908453 () Bool)

(assert (=> b!1364881 (=> (not res!908453) (not e!774073))))

(assert (=> b!1364881 (= res!908453 (not (contains!9550 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115422 res!908452) b!1364877))

(assert (= (and b!1364877 res!908449) b!1364879))

(assert (= (and b!1364879 res!908450) b!1364880))

(assert (= (and b!1364880 res!908451) b!1364876))

(assert (= (and b!1364876 res!908454) b!1364881))

(assert (= (and b!1364881 res!908453) b!1364878))

(assert (= (and b!1364878 res!908455) b!1364875))

(declare-fun m!1249581 () Bool)

(assert (=> b!1364879 m!1249581))

(declare-fun m!1249583 () Bool)

(assert (=> b!1364875 m!1249583))

(declare-fun m!1249585 () Bool)

(assert (=> b!1364881 m!1249585))

(declare-fun m!1249587 () Bool)

(assert (=> b!1364876 m!1249587))

(declare-fun m!1249589 () Bool)

(assert (=> b!1364877 m!1249589))

(declare-fun m!1249591 () Bool)

(assert (=> b!1364878 m!1249591))

(declare-fun m!1249593 () Bool)

(assert (=> b!1364880 m!1249593))

(declare-fun m!1249595 () Bool)

(assert (=> start!115422 m!1249595))

(push 1)

(assert (not b!1364875))

(assert (not b!1364876))

(assert (not b!1364880))

(assert (not b!1364879))

(assert (not b!1364877))

(assert (not b!1364881))

(assert (not b!1364878))

(assert (not start!115422))

(check-sat)

