; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116510 () Bool)

(assert start!116510)

(declare-fun b!1374136 () Bool)

(declare-fun res!916626 () Bool)

(declare-fun e!778548 () Bool)

(assert (=> b!1374136 (=> (not res!916626) (not e!778548))))

(declare-datatypes ((List!32070 0))(
  ( (Nil!32067) (Cons!32066 (h!33284 (_ BitVec 64)) (t!46756 List!32070)) )
))
(declare-fun newAcc!98 () List!32070)

(declare-fun contains!9755 (List!32070 (_ BitVec 64)) Bool)

(assert (=> b!1374136 (= res!916626 (not (contains!9755 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374137 () Bool)

(declare-fun res!916628 () Bool)

(assert (=> b!1374137 (=> (not res!916628) (not e!778548))))

(declare-fun acc!866 () List!32070)

(declare-fun noDuplicate!2586 (List!32070) Bool)

(assert (=> b!1374137 (= res!916628 (noDuplicate!2586 acc!866))))

(declare-fun b!1374138 () Bool)

(declare-fun res!916627 () Bool)

(assert (=> b!1374138 (=> (not res!916627) (not e!778548))))

(assert (=> b!1374138 (= res!916627 (not (contains!9755 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374140 () Bool)

(declare-fun res!916625 () Bool)

(assert (=> b!1374140 (=> (not res!916625) (not e!778548))))

(assert (=> b!1374140 (= res!916625 (not (contains!9755 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374139 () Bool)

(assert (=> b!1374139 (= e!778548 false)))

(declare-datatypes ((array!93218 0))(
  ( (array!93219 (arr!45015 (Array (_ BitVec 32) (_ BitVec 64))) (size!45566 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93218)

(declare-fun lt!603429 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93218 (_ BitVec 32) List!32070) Bool)

(assert (=> b!1374139 (= lt!603429 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45300 0))(
  ( (Unit!45301) )
))
(declare-fun lt!603428 () Unit!45300)

(declare-fun noDuplicateSubseq!301 (List!32070 List!32070) Unit!45300)

(assert (=> b!1374139 (= lt!603428 (noDuplicateSubseq!301 newAcc!98 acc!866))))

(declare-fun res!916629 () Bool)

(assert (=> start!116510 (=> (not res!916629) (not e!778548))))

(assert (=> start!116510 (= res!916629 (and (bvslt (size!45566 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45566 a!3861))))))

(assert (=> start!116510 e!778548))

(declare-fun array_inv!34296 (array!93218) Bool)

(assert (=> start!116510 (array_inv!34296 a!3861)))

(assert (=> start!116510 true))

(declare-fun b!1374141 () Bool)

(declare-fun res!916623 () Bool)

(assert (=> b!1374141 (=> (not res!916623) (not e!778548))))

(declare-fun subseq!1114 (List!32070 List!32070) Bool)

(assert (=> b!1374141 (= res!916623 (subseq!1114 newAcc!98 acc!866))))

(declare-fun b!1374142 () Bool)

(declare-fun res!916624 () Bool)

(assert (=> b!1374142 (=> (not res!916624) (not e!778548))))

(assert (=> b!1374142 (= res!916624 (not (contains!9755 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116510 res!916629) b!1374137))

(assert (= (and b!1374137 res!916628) b!1374140))

(assert (= (and b!1374140 res!916625) b!1374142))

(assert (= (and b!1374142 res!916624) b!1374138))

(assert (= (and b!1374138 res!916627) b!1374136))

(assert (= (and b!1374136 res!916626) b!1374141))

(assert (= (and b!1374141 res!916623) b!1374139))

(declare-fun m!1257811 () Bool)

(assert (=> b!1374141 m!1257811))

(declare-fun m!1257813 () Bool)

(assert (=> b!1374139 m!1257813))

(declare-fun m!1257815 () Bool)

(assert (=> b!1374139 m!1257815))

(declare-fun m!1257817 () Bool)

(assert (=> b!1374137 m!1257817))

(declare-fun m!1257819 () Bool)

(assert (=> b!1374142 m!1257819))

(declare-fun m!1257821 () Bool)

(assert (=> b!1374136 m!1257821))

(declare-fun m!1257823 () Bool)

(assert (=> start!116510 m!1257823))

(declare-fun m!1257825 () Bool)

(assert (=> b!1374140 m!1257825))

(declare-fun m!1257827 () Bool)

(assert (=> b!1374138 m!1257827))

(push 1)

(assert (not b!1374142))

(assert (not b!1374140))

(assert (not b!1374136))

(assert (not b!1374141))

(assert (not b!1374138))

(assert (not b!1374137))

(assert (not b!1374139))

(assert (not start!116510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

