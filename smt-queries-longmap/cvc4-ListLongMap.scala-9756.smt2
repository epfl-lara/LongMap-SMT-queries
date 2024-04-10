; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115620 () Bool)

(assert start!115620)

(declare-fun b!1367308 () Bool)

(declare-fun res!910837 () Bool)

(declare-fun e!774919 () Bool)

(assert (=> b!1367308 (=> (not res!910837) (not e!774919))))

(declare-datatypes ((array!92851 0))(
  ( (array!92852 (arr!44851 (Array (_ BitVec 32) (_ BitVec 64))) (size!45401 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92851)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367308 (= res!910837 (validKeyInArray!0 (select (arr!44851 a!3861) from!3239)))))

(declare-fun b!1367309 () Bool)

(declare-fun res!910843 () Bool)

(declare-fun e!774917 () Bool)

(assert (=> b!1367309 (=> (not res!910843) (not e!774917))))

(declare-datatypes ((List!31919 0))(
  ( (Nil!31916) (Cons!31915 (h!33124 (_ BitVec 64)) (t!46613 List!31919)) )
))
(declare-fun acc!866 () List!31919)

(declare-fun contains!9601 (List!31919 (_ BitVec 64)) Bool)

(assert (=> b!1367309 (= res!910843 (not (contains!9601 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367310 () Bool)

(declare-fun res!910838 () Bool)

(assert (=> b!1367310 (=> (not res!910838) (not e!774919))))

(assert (=> b!1367310 (= res!910838 (bvslt from!3239 (size!45401 a!3861)))))

(declare-fun b!1367311 () Bool)

(declare-fun res!910835 () Bool)

(assert (=> b!1367311 (=> (not res!910835) (not e!774917))))

(declare-fun newAcc!98 () List!31919)

(declare-fun subseq!1003 (List!31919 List!31919) Bool)

(assert (=> b!1367311 (= res!910835 (subseq!1003 newAcc!98 acc!866))))

(declare-fun b!1367312 () Bool)

(declare-fun res!910839 () Bool)

(assert (=> b!1367312 (=> (not res!910839) (not e!774917))))

(assert (=> b!1367312 (= res!910839 (not (contains!9601 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910836 () Bool)

(assert (=> start!115620 (=> (not res!910836) (not e!774917))))

(assert (=> start!115620 (= res!910836 (and (bvslt (size!45401 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45401 a!3861))))))

(assert (=> start!115620 e!774917))

(declare-fun array_inv!33879 (array!92851) Bool)

(assert (=> start!115620 (array_inv!33879 a!3861)))

(assert (=> start!115620 true))

(declare-fun b!1367313 () Bool)

(assert (=> b!1367313 (= e!774919 false)))

(declare-fun lt!601867 () Bool)

(assert (=> b!1367313 (= lt!601867 (contains!9601 acc!866 (select (arr!44851 a!3861) from!3239)))))

(declare-fun b!1367314 () Bool)

(declare-fun res!910834 () Bool)

(assert (=> b!1367314 (=> (not res!910834) (not e!774917))))

(assert (=> b!1367314 (= res!910834 (not (contains!9601 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367315 () Bool)

(declare-fun res!910841 () Bool)

(assert (=> b!1367315 (=> (not res!910841) (not e!774917))))

(assert (=> b!1367315 (= res!910841 (not (contains!9601 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367316 () Bool)

(assert (=> b!1367316 (= e!774917 e!774919)))

(declare-fun res!910840 () Bool)

(assert (=> b!1367316 (=> (not res!910840) (not e!774919))))

(declare-fun arrayNoDuplicates!0 (array!92851 (_ BitVec 32) List!31919) Bool)

(assert (=> b!1367316 (= res!910840 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45139 0))(
  ( (Unit!45140) )
))
(declare-fun lt!601866 () Unit!45139)

(declare-fun noDuplicateSubseq!190 (List!31919 List!31919) Unit!45139)

(assert (=> b!1367316 (= lt!601866 (noDuplicateSubseq!190 newAcc!98 acc!866))))

(declare-fun b!1367317 () Bool)

(declare-fun res!910842 () Bool)

(assert (=> b!1367317 (=> (not res!910842) (not e!774917))))

(declare-fun noDuplicate!2458 (List!31919) Bool)

(assert (=> b!1367317 (= res!910842 (noDuplicate!2458 acc!866))))

(assert (= (and start!115620 res!910836) b!1367317))

(assert (= (and b!1367317 res!910842) b!1367314))

(assert (= (and b!1367314 res!910834) b!1367309))

(assert (= (and b!1367309 res!910843) b!1367312))

(assert (= (and b!1367312 res!910839) b!1367315))

(assert (= (and b!1367315 res!910841) b!1367311))

(assert (= (and b!1367311 res!910835) b!1367316))

(assert (= (and b!1367316 res!910840) b!1367310))

(assert (= (and b!1367310 res!910838) b!1367308))

(assert (= (and b!1367308 res!910837) b!1367313))

(declare-fun m!1251559 () Bool)

(assert (=> b!1367308 m!1251559))

(assert (=> b!1367308 m!1251559))

(declare-fun m!1251561 () Bool)

(assert (=> b!1367308 m!1251561))

(declare-fun m!1251563 () Bool)

(assert (=> b!1367315 m!1251563))

(declare-fun m!1251565 () Bool)

(assert (=> b!1367317 m!1251565))

(declare-fun m!1251567 () Bool)

(assert (=> start!115620 m!1251567))

(declare-fun m!1251569 () Bool)

(assert (=> b!1367316 m!1251569))

(declare-fun m!1251571 () Bool)

(assert (=> b!1367316 m!1251571))

(declare-fun m!1251573 () Bool)

(assert (=> b!1367314 m!1251573))

(declare-fun m!1251575 () Bool)

(assert (=> b!1367309 m!1251575))

(declare-fun m!1251577 () Bool)

(assert (=> b!1367312 m!1251577))

(declare-fun m!1251579 () Bool)

(assert (=> b!1367311 m!1251579))

(assert (=> b!1367313 m!1251559))

(assert (=> b!1367313 m!1251559))

(declare-fun m!1251581 () Bool)

(assert (=> b!1367313 m!1251581))

(push 1)

(assert (not b!1367315))

