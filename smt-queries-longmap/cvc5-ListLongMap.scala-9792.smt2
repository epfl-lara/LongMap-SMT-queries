; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116504 () Bool)

(assert start!116504)

(declare-fun b!1374073 () Bool)

(declare-fun e!778531 () Bool)

(assert (=> b!1374073 (= e!778531 false)))

(declare-datatypes ((array!93212 0))(
  ( (array!93213 (arr!45012 (Array (_ BitVec 32) (_ BitVec 64))) (size!45563 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93212)

(declare-fun lt!603410 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32067 0))(
  ( (Nil!32064) (Cons!32063 (h!33281 (_ BitVec 64)) (t!46753 List!32067)) )
))
(declare-fun acc!866 () List!32067)

(declare-fun arrayNoDuplicates!0 (array!93212 (_ BitVec 32) List!32067) Bool)

(assert (=> b!1374073 (= lt!603410 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45294 0))(
  ( (Unit!45295) )
))
(declare-fun lt!603411 () Unit!45294)

(declare-fun newAcc!98 () List!32067)

(declare-fun noDuplicateSubseq!298 (List!32067 List!32067) Unit!45294)

(assert (=> b!1374073 (= lt!603411 (noDuplicateSubseq!298 newAcc!98 acc!866))))

(declare-fun b!1374074 () Bool)

(declare-fun res!916561 () Bool)

(assert (=> b!1374074 (=> (not res!916561) (not e!778531))))

(declare-fun contains!9752 (List!32067 (_ BitVec 64)) Bool)

(assert (=> b!1374074 (= res!916561 (not (contains!9752 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374075 () Bool)

(declare-fun res!916566 () Bool)

(assert (=> b!1374075 (=> (not res!916566) (not e!778531))))

(assert (=> b!1374075 (= res!916566 (not (contains!9752 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374076 () Bool)

(declare-fun res!916560 () Bool)

(assert (=> b!1374076 (=> (not res!916560) (not e!778531))))

(declare-fun subseq!1111 (List!32067 List!32067) Bool)

(assert (=> b!1374076 (= res!916560 (subseq!1111 newAcc!98 acc!866))))

(declare-fun res!916563 () Bool)

(assert (=> start!116504 (=> (not res!916563) (not e!778531))))

(assert (=> start!116504 (= res!916563 (and (bvslt (size!45563 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45563 a!3861))))))

(assert (=> start!116504 e!778531))

(declare-fun array_inv!34293 (array!93212) Bool)

(assert (=> start!116504 (array_inv!34293 a!3861)))

(assert (=> start!116504 true))

(declare-fun b!1374077 () Bool)

(declare-fun res!916562 () Bool)

(assert (=> b!1374077 (=> (not res!916562) (not e!778531))))

(assert (=> b!1374077 (= res!916562 (not (contains!9752 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374078 () Bool)

(declare-fun res!916565 () Bool)

(assert (=> b!1374078 (=> (not res!916565) (not e!778531))))

(declare-fun noDuplicate!2583 (List!32067) Bool)

(assert (=> b!1374078 (= res!916565 (noDuplicate!2583 acc!866))))

(declare-fun b!1374079 () Bool)

(declare-fun res!916564 () Bool)

(assert (=> b!1374079 (=> (not res!916564) (not e!778531))))

(assert (=> b!1374079 (= res!916564 (not (contains!9752 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116504 res!916563) b!1374078))

(assert (= (and b!1374078 res!916565) b!1374077))

(assert (= (and b!1374077 res!916562) b!1374074))

(assert (= (and b!1374074 res!916561) b!1374075))

(assert (= (and b!1374075 res!916566) b!1374079))

(assert (= (and b!1374079 res!916564) b!1374076))

(assert (= (and b!1374076 res!916560) b!1374073))

(declare-fun m!1257757 () Bool)

(assert (=> b!1374076 m!1257757))

(declare-fun m!1257759 () Bool)

(assert (=> b!1374079 m!1257759))

(declare-fun m!1257761 () Bool)

(assert (=> b!1374073 m!1257761))

(declare-fun m!1257763 () Bool)

(assert (=> b!1374073 m!1257763))

(declare-fun m!1257765 () Bool)

(assert (=> start!116504 m!1257765))

(declare-fun m!1257767 () Bool)

(assert (=> b!1374074 m!1257767))

(declare-fun m!1257769 () Bool)

(assert (=> b!1374075 m!1257769))

(declare-fun m!1257771 () Bool)

(assert (=> b!1374077 m!1257771))

(declare-fun m!1257773 () Bool)

(assert (=> b!1374078 m!1257773))

(push 1)

(assert (not b!1374076))

(assert (not b!1374073))

(assert (not b!1374079))

(assert (not start!116504))

(assert (not b!1374075))

(assert (not b!1374074))

(assert (not b!1374077))

(assert (not b!1374078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

