; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115676 () Bool)

(assert start!115676)

(declare-fun b!1367685 () Bool)

(declare-fun e!775127 () Bool)

(declare-fun e!775129 () Bool)

(assert (=> b!1367685 (= e!775127 e!775129)))

(declare-fun res!911201 () Bool)

(assert (=> b!1367685 (=> (not res!911201) (not e!775129))))

(declare-datatypes ((array!92868 0))(
  ( (array!92869 (arr!44858 (Array (_ BitVec 32) (_ BitVec 64))) (size!45408 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92868)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31926 0))(
  ( (Nil!31923) (Cons!31922 (h!33131 (_ BitVec 64)) (t!46620 List!31926)) )
))
(declare-fun acc!866 () List!31926)

(declare-fun arrayNoDuplicates!0 (array!92868 (_ BitVec 32) List!31926) Bool)

(assert (=> b!1367685 (= res!911201 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45153 0))(
  ( (Unit!45154) )
))
(declare-fun lt!601930 () Unit!45153)

(declare-fun newAcc!98 () List!31926)

(declare-fun noDuplicateSubseq!197 (List!31926 List!31926) Unit!45153)

(assert (=> b!1367685 (= lt!601930 (noDuplicateSubseq!197 newAcc!98 acc!866))))

(declare-fun b!1367686 () Bool)

(declare-fun res!911196 () Bool)

(assert (=> b!1367686 (=> (not res!911196) (not e!775127))))

(declare-fun contains!9608 (List!31926 (_ BitVec 64)) Bool)

(assert (=> b!1367686 (= res!911196 (not (contains!9608 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911200 () Bool)

(assert (=> start!115676 (=> (not res!911200) (not e!775127))))

(assert (=> start!115676 (= res!911200 (and (bvslt (size!45408 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45408 a!3861))))))

(assert (=> start!115676 e!775127))

(declare-fun array_inv!33886 (array!92868) Bool)

(assert (=> start!115676 (array_inv!33886 a!3861)))

(assert (=> start!115676 true))

(declare-fun b!1367687 () Bool)

(declare-fun res!911195 () Bool)

(assert (=> b!1367687 (=> (not res!911195) (not e!775127))))

(assert (=> b!1367687 (= res!911195 (not (contains!9608 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367688 () Bool)

(declare-fun res!911197 () Bool)

(assert (=> b!1367688 (=> (not res!911197) (not e!775129))))

(assert (=> b!1367688 (= res!911197 (contains!9608 acc!866 (select (arr!44858 a!3861) from!3239)))))

(declare-fun b!1367689 () Bool)

(declare-fun res!911193 () Bool)

(assert (=> b!1367689 (=> (not res!911193) (not e!775127))))

(assert (=> b!1367689 (= res!911193 (not (contains!9608 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367690 () Bool)

(declare-fun res!911199 () Bool)

(assert (=> b!1367690 (=> (not res!911199) (not e!775127))))

(declare-fun noDuplicate!2465 (List!31926) Bool)

(assert (=> b!1367690 (= res!911199 (noDuplicate!2465 acc!866))))

(declare-fun b!1367691 () Bool)

(assert (=> b!1367691 (= e!775129 false)))

(declare-fun lt!601929 () Bool)

(assert (=> b!1367691 (= lt!601929 (noDuplicate!2465 newAcc!98))))

(declare-fun b!1367692 () Bool)

(declare-fun res!911202 () Bool)

(assert (=> b!1367692 (=> (not res!911202) (not e!775129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367692 (= res!911202 (validKeyInArray!0 (select (arr!44858 a!3861) from!3239)))))

(declare-fun b!1367693 () Bool)

(declare-fun res!911203 () Bool)

(assert (=> b!1367693 (=> (not res!911203) (not e!775127))))

(assert (=> b!1367693 (= res!911203 (not (contains!9608 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367694 () Bool)

(declare-fun res!911198 () Bool)

(assert (=> b!1367694 (=> (not res!911198) (not e!775129))))

(assert (=> b!1367694 (= res!911198 (bvslt from!3239 (size!45408 a!3861)))))

(declare-fun b!1367695 () Bool)

(declare-fun res!911194 () Bool)

(assert (=> b!1367695 (=> (not res!911194) (not e!775127))))

(declare-fun subseq!1010 (List!31926 List!31926) Bool)

(assert (=> b!1367695 (= res!911194 (subseq!1010 newAcc!98 acc!866))))

(assert (= (and start!115676 res!911200) b!1367690))

(assert (= (and b!1367690 res!911199) b!1367686))

(assert (= (and b!1367686 res!911196) b!1367687))

(assert (= (and b!1367687 res!911195) b!1367689))

(assert (= (and b!1367689 res!911193) b!1367693))

(assert (= (and b!1367693 res!911203) b!1367695))

(assert (= (and b!1367695 res!911194) b!1367685))

(assert (= (and b!1367685 res!911201) b!1367694))

(assert (= (and b!1367694 res!911198) b!1367692))

(assert (= (and b!1367692 res!911202) b!1367688))

(assert (= (and b!1367688 res!911197) b!1367691))

(declare-fun m!1251853 () Bool)

(assert (=> b!1367689 m!1251853))

(declare-fun m!1251855 () Bool)

(assert (=> start!115676 m!1251855))

(declare-fun m!1251857 () Bool)

(assert (=> b!1367690 m!1251857))

(declare-fun m!1251859 () Bool)

(assert (=> b!1367695 m!1251859))

(declare-fun m!1251861 () Bool)

(assert (=> b!1367691 m!1251861))

(declare-fun m!1251863 () Bool)

(assert (=> b!1367685 m!1251863))

(declare-fun m!1251865 () Bool)

(assert (=> b!1367685 m!1251865))

(declare-fun m!1251867 () Bool)

(assert (=> b!1367686 m!1251867))

(declare-fun m!1251869 () Bool)

(assert (=> b!1367687 m!1251869))

(declare-fun m!1251871 () Bool)

(assert (=> b!1367693 m!1251871))

(declare-fun m!1251873 () Bool)

(assert (=> b!1367692 m!1251873))

(assert (=> b!1367692 m!1251873))

(declare-fun m!1251875 () Bool)

(assert (=> b!1367692 m!1251875))

(assert (=> b!1367688 m!1251873))

(assert (=> b!1367688 m!1251873))

(declare-fun m!1251877 () Bool)

(assert (=> b!1367688 m!1251877))

(push 1)

