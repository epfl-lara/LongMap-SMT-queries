; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115678 () Bool)

(assert start!115678)

(declare-fun b!1367718 () Bool)

(declare-fun res!911232 () Bool)

(declare-fun e!775137 () Bool)

(assert (=> b!1367718 (=> (not res!911232) (not e!775137))))

(declare-datatypes ((List!31927 0))(
  ( (Nil!31924) (Cons!31923 (h!33132 (_ BitVec 64)) (t!46621 List!31927)) )
))
(declare-fun newAcc!98 () List!31927)

(declare-fun contains!9609 (List!31927 (_ BitVec 64)) Bool)

(assert (=> b!1367718 (= res!911232 (not (contains!9609 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367720 () Bool)

(declare-fun res!911236 () Bool)

(assert (=> b!1367720 (=> (not res!911236) (not e!775137))))

(declare-fun acc!866 () List!31927)

(declare-fun noDuplicate!2466 (List!31927) Bool)

(assert (=> b!1367720 (= res!911236 (noDuplicate!2466 acc!866))))

(declare-fun b!1367721 () Bool)

(declare-fun e!775138 () Bool)

(assert (=> b!1367721 (= e!775138 false)))

(declare-fun lt!601936 () Bool)

(assert (=> b!1367721 (= lt!601936 (noDuplicate!2466 newAcc!98))))

(declare-fun b!1367722 () Bool)

(declare-fun res!911229 () Bool)

(assert (=> b!1367722 (=> (not res!911229) (not e!775137))))

(assert (=> b!1367722 (= res!911229 (not (contains!9609 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367723 () Bool)

(declare-fun res!911234 () Bool)

(assert (=> b!1367723 (=> (not res!911234) (not e!775137))))

(declare-fun subseq!1011 (List!31927 List!31927) Bool)

(assert (=> b!1367723 (= res!911234 (subseq!1011 newAcc!98 acc!866))))

(declare-fun b!1367724 () Bool)

(declare-fun res!911235 () Bool)

(assert (=> b!1367724 (=> (not res!911235) (not e!775138))))

(declare-datatypes ((array!92870 0))(
  ( (array!92871 (arr!44859 (Array (_ BitVec 32) (_ BitVec 64))) (size!45409 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92870)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1367724 (= res!911235 (contains!9609 acc!866 (select (arr!44859 a!3861) from!3239)))))

(declare-fun res!911230 () Bool)

(assert (=> start!115678 (=> (not res!911230) (not e!775137))))

(assert (=> start!115678 (= res!911230 (and (bvslt (size!45409 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45409 a!3861))))))

(assert (=> start!115678 e!775137))

(declare-fun array_inv!33887 (array!92870) Bool)

(assert (=> start!115678 (array_inv!33887 a!3861)))

(assert (=> start!115678 true))

(declare-fun b!1367719 () Bool)

(declare-fun res!911233 () Bool)

(assert (=> b!1367719 (=> (not res!911233) (not e!775137))))

(assert (=> b!1367719 (= res!911233 (not (contains!9609 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367725 () Bool)

(declare-fun res!911228 () Bool)

(assert (=> b!1367725 (=> (not res!911228) (not e!775137))))

(assert (=> b!1367725 (= res!911228 (not (contains!9609 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367726 () Bool)

(declare-fun res!911226 () Bool)

(assert (=> b!1367726 (=> (not res!911226) (not e!775138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367726 (= res!911226 (validKeyInArray!0 (select (arr!44859 a!3861) from!3239)))))

(declare-fun b!1367727 () Bool)

(assert (=> b!1367727 (= e!775137 e!775138)))

(declare-fun res!911231 () Bool)

(assert (=> b!1367727 (=> (not res!911231) (not e!775138))))

(declare-fun arrayNoDuplicates!0 (array!92870 (_ BitVec 32) List!31927) Bool)

(assert (=> b!1367727 (= res!911231 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45155 0))(
  ( (Unit!45156) )
))
(declare-fun lt!601935 () Unit!45155)

(declare-fun noDuplicateSubseq!198 (List!31927 List!31927) Unit!45155)

(assert (=> b!1367727 (= lt!601935 (noDuplicateSubseq!198 newAcc!98 acc!866))))

(declare-fun b!1367728 () Bool)

(declare-fun res!911227 () Bool)

(assert (=> b!1367728 (=> (not res!911227) (not e!775138))))

(assert (=> b!1367728 (= res!911227 (bvslt from!3239 (size!45409 a!3861)))))

(assert (= (and start!115678 res!911230) b!1367720))

(assert (= (and b!1367720 res!911236) b!1367725))

(assert (= (and b!1367725 res!911228) b!1367722))

(assert (= (and b!1367722 res!911229) b!1367719))

(assert (= (and b!1367719 res!911233) b!1367718))

(assert (= (and b!1367718 res!911232) b!1367723))

(assert (= (and b!1367723 res!911234) b!1367727))

(assert (= (and b!1367727 res!911231) b!1367728))

(assert (= (and b!1367728 res!911227) b!1367726))

(assert (= (and b!1367726 res!911226) b!1367724))

(assert (= (and b!1367724 res!911235) b!1367721))

(declare-fun m!1251879 () Bool)

(assert (=> b!1367725 m!1251879))

(declare-fun m!1251881 () Bool)

(assert (=> b!1367719 m!1251881))

(declare-fun m!1251883 () Bool)

(assert (=> b!1367722 m!1251883))

(declare-fun m!1251885 () Bool)

(assert (=> b!1367720 m!1251885))

(declare-fun m!1251887 () Bool)

(assert (=> b!1367727 m!1251887))

(declare-fun m!1251889 () Bool)

(assert (=> b!1367727 m!1251889))

(declare-fun m!1251891 () Bool)

(assert (=> start!115678 m!1251891))

(declare-fun m!1251893 () Bool)

(assert (=> b!1367726 m!1251893))

(assert (=> b!1367726 m!1251893))

(declare-fun m!1251895 () Bool)

(assert (=> b!1367726 m!1251895))

(assert (=> b!1367724 m!1251893))

(assert (=> b!1367724 m!1251893))

(declare-fun m!1251897 () Bool)

(assert (=> b!1367724 m!1251897))

(declare-fun m!1251899 () Bool)

(assert (=> b!1367721 m!1251899))

(declare-fun m!1251901 () Bool)

(assert (=> b!1367718 m!1251901))

(declare-fun m!1251903 () Bool)

(assert (=> b!1367723 m!1251903))

(check-sat (not b!1367718) (not b!1367726) (not b!1367727) (not b!1367725) (not b!1367722) (not b!1367724) (not start!115678) (not b!1367720) (not b!1367719) (not b!1367721) (not b!1367723))
(check-sat)
