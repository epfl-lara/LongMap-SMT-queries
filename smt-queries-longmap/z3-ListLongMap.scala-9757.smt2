; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115612 () Bool)

(assert start!115612)

(declare-fun b!1367266 () Bool)

(declare-fun res!910840 () Bool)

(declare-fun e!774892 () Bool)

(assert (=> b!1367266 (=> (not res!910840) (not e!774892))))

(declare-datatypes ((List!31973 0))(
  ( (Nil!31970) (Cons!31969 (h!33178 (_ BitVec 64)) (t!46659 List!31973)) )
))
(declare-fun newAcc!98 () List!31973)

(declare-fun contains!9566 (List!31973 (_ BitVec 64)) Bool)

(assert (=> b!1367266 (= res!910840 (not (contains!9566 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367267 () Bool)

(declare-fun e!774894 () Bool)

(assert (=> b!1367267 (= e!774894 false)))

(declare-datatypes ((array!92802 0))(
  ( (array!92803 (arr!44827 (Array (_ BitVec 32) (_ BitVec 64))) (size!45379 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92802)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!601686 () Bool)

(declare-fun acc!866 () List!31973)

(assert (=> b!1367267 (= lt!601686 (contains!9566 acc!866 (select (arr!44827 a!3861) from!3239)))))

(declare-fun b!1367268 () Bool)

(declare-fun res!910843 () Bool)

(assert (=> b!1367268 (=> (not res!910843) (not e!774892))))

(assert (=> b!1367268 (= res!910843 (not (contains!9566 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367269 () Bool)

(declare-fun res!910835 () Bool)

(assert (=> b!1367269 (=> (not res!910835) (not e!774892))))

(assert (=> b!1367269 (= res!910835 (not (contains!9566 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367270 () Bool)

(declare-fun res!910836 () Bool)

(assert (=> b!1367270 (=> (not res!910836) (not e!774892))))

(declare-fun noDuplicate!2481 (List!31973) Bool)

(assert (=> b!1367270 (= res!910836 (noDuplicate!2481 acc!866))))

(declare-fun b!1367271 () Bool)

(declare-fun res!910841 () Bool)

(assert (=> b!1367271 (=> (not res!910841) (not e!774894))))

(assert (=> b!1367271 (= res!910841 (bvslt from!3239 (size!45379 a!3861)))))

(declare-fun b!1367272 () Bool)

(declare-fun res!910842 () Bool)

(assert (=> b!1367272 (=> (not res!910842) (not e!774892))))

(assert (=> b!1367272 (= res!910842 (not (contains!9566 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367273 () Bool)

(declare-fun res!910844 () Bool)

(assert (=> b!1367273 (=> (not res!910844) (not e!774892))))

(declare-fun subseq!1004 (List!31973 List!31973) Bool)

(assert (=> b!1367273 (= res!910844 (subseq!1004 newAcc!98 acc!866))))

(declare-fun res!910837 () Bool)

(assert (=> start!115612 (=> (not res!910837) (not e!774892))))

(assert (=> start!115612 (= res!910837 (and (bvslt (size!45379 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45379 a!3861))))))

(assert (=> start!115612 e!774892))

(declare-fun array_inv!34060 (array!92802) Bool)

(assert (=> start!115612 (array_inv!34060 a!3861)))

(assert (=> start!115612 true))

(declare-fun b!1367274 () Bool)

(declare-fun res!910839 () Bool)

(assert (=> b!1367274 (=> (not res!910839) (not e!774894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367274 (= res!910839 (validKeyInArray!0 (select (arr!44827 a!3861) from!3239)))))

(declare-fun b!1367275 () Bool)

(assert (=> b!1367275 (= e!774892 e!774894)))

(declare-fun res!910838 () Bool)

(assert (=> b!1367275 (=> (not res!910838) (not e!774894))))

(declare-fun arrayNoDuplicates!0 (array!92802 (_ BitVec 32) List!31973) Bool)

(assert (=> b!1367275 (= res!910838 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44982 0))(
  ( (Unit!44983) )
))
(declare-fun lt!601685 () Unit!44982)

(declare-fun noDuplicateSubseq!191 (List!31973 List!31973) Unit!44982)

(assert (=> b!1367275 (= lt!601685 (noDuplicateSubseq!191 newAcc!98 acc!866))))

(assert (= (and start!115612 res!910837) b!1367270))

(assert (= (and b!1367270 res!910836) b!1367268))

(assert (= (and b!1367268 res!910843) b!1367272))

(assert (= (and b!1367272 res!910842) b!1367269))

(assert (= (and b!1367269 res!910835) b!1367266))

(assert (= (and b!1367266 res!910840) b!1367273))

(assert (= (and b!1367273 res!910844) b!1367275))

(assert (= (and b!1367275 res!910838) b!1367271))

(assert (= (and b!1367271 res!910841) b!1367274))

(assert (= (and b!1367274 res!910839) b!1367267))

(declare-fun m!1251057 () Bool)

(assert (=> start!115612 m!1251057))

(declare-fun m!1251059 () Bool)

(assert (=> b!1367269 m!1251059))

(declare-fun m!1251061 () Bool)

(assert (=> b!1367268 m!1251061))

(declare-fun m!1251063 () Bool)

(assert (=> b!1367270 m!1251063))

(declare-fun m!1251065 () Bool)

(assert (=> b!1367274 m!1251065))

(assert (=> b!1367274 m!1251065))

(declare-fun m!1251067 () Bool)

(assert (=> b!1367274 m!1251067))

(declare-fun m!1251069 () Bool)

(assert (=> b!1367266 m!1251069))

(declare-fun m!1251071 () Bool)

(assert (=> b!1367272 m!1251071))

(declare-fun m!1251073 () Bool)

(assert (=> b!1367275 m!1251073))

(declare-fun m!1251075 () Bool)

(assert (=> b!1367275 m!1251075))

(declare-fun m!1251077 () Bool)

(assert (=> b!1367273 m!1251077))

(assert (=> b!1367267 m!1251065))

(assert (=> b!1367267 m!1251065))

(declare-fun m!1251079 () Bool)

(assert (=> b!1367267 m!1251079))

(check-sat (not b!1367275) (not b!1367266) (not b!1367273) (not b!1367270) (not b!1367274) (not b!1367272) (not start!115612) (not b!1367267) (not b!1367268) (not b!1367269))
(check-sat)
