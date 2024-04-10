; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116290 () Bool)

(assert start!116290)

(declare-fun b!1372879 () Bool)

(declare-fun res!916150 () Bool)

(declare-fun e!777717 () Bool)

(assert (=> b!1372879 (=> (not res!916150) (not e!777717))))

(declare-datatypes ((List!32032 0))(
  ( (Nil!32029) (Cons!32028 (h!33237 (_ BitVec 64)) (t!46726 List!32032)) )
))
(declare-fun newAcc!98 () List!32032)

(declare-fun acc!866 () List!32032)

(declare-fun subseq!1116 (List!32032 List!32032) Bool)

(assert (=> b!1372879 (= res!916150 (subseq!1116 newAcc!98 acc!866))))

(declare-fun res!916149 () Bool)

(assert (=> start!116290 (=> (not res!916149) (not e!777717))))

(declare-datatypes ((array!93107 0))(
  ( (array!93108 (arr!44964 (Array (_ BitVec 32) (_ BitVec 64))) (size!45514 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93107)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116290 (= res!916149 (and (bvslt (size!45514 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45514 a!3861))))))

(assert (=> start!116290 e!777717))

(declare-fun array_inv!33992 (array!93107) Bool)

(assert (=> start!116290 (array_inv!33992 a!3861)))

(assert (=> start!116290 true))

(declare-fun b!1372880 () Bool)

(declare-fun res!916153 () Bool)

(assert (=> b!1372880 (=> (not res!916153) (not e!777717))))

(declare-fun noDuplicate!2571 (List!32032) Bool)

(assert (=> b!1372880 (= res!916153 (noDuplicate!2571 acc!866))))

(declare-fun b!1372881 () Bool)

(assert (=> b!1372881 (= e!777717 false)))

(declare-fun lt!602964 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93107 (_ BitVec 32) List!32032) Bool)

(assert (=> b!1372881 (= lt!602964 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45365 0))(
  ( (Unit!45366) )
))
(declare-fun lt!602965 () Unit!45365)

(declare-fun noDuplicateSubseq!303 (List!32032 List!32032) Unit!45365)

(assert (=> b!1372881 (= lt!602965 (noDuplicateSubseq!303 newAcc!98 acc!866))))

(declare-fun b!1372882 () Bool)

(declare-fun res!916151 () Bool)

(assert (=> b!1372882 (=> (not res!916151) (not e!777717))))

(declare-fun contains!9714 (List!32032 (_ BitVec 64)) Bool)

(assert (=> b!1372882 (= res!916151 (not (contains!9714 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372883 () Bool)

(declare-fun res!916148 () Bool)

(assert (=> b!1372883 (=> (not res!916148) (not e!777717))))

(assert (=> b!1372883 (= res!916148 (not (contains!9714 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372884 () Bool)

(declare-fun res!916152 () Bool)

(assert (=> b!1372884 (=> (not res!916152) (not e!777717))))

(assert (=> b!1372884 (= res!916152 (not (contains!9714 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372885 () Bool)

(declare-fun res!916147 () Bool)

(assert (=> b!1372885 (=> (not res!916147) (not e!777717))))

(assert (=> b!1372885 (= res!916147 (not (contains!9714 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116290 res!916149) b!1372880))

(assert (= (and b!1372880 res!916153) b!1372885))

(assert (= (and b!1372885 res!916147) b!1372883))

(assert (= (and b!1372883 res!916148) b!1372882))

(assert (= (and b!1372882 res!916151) b!1372884))

(assert (= (and b!1372884 res!916152) b!1372879))

(assert (= (and b!1372879 res!916150) b!1372881))

(declare-fun m!1256251 () Bool)

(assert (=> b!1372880 m!1256251))

(declare-fun m!1256253 () Bool)

(assert (=> b!1372885 m!1256253))

(declare-fun m!1256255 () Bool)

(assert (=> b!1372881 m!1256255))

(declare-fun m!1256257 () Bool)

(assert (=> b!1372881 m!1256257))

(declare-fun m!1256259 () Bool)

(assert (=> start!116290 m!1256259))

(declare-fun m!1256261 () Bool)

(assert (=> b!1372884 m!1256261))

(declare-fun m!1256263 () Bool)

(assert (=> b!1372882 m!1256263))

(declare-fun m!1256265 () Bool)

(assert (=> b!1372879 m!1256265))

(declare-fun m!1256267 () Bool)

(assert (=> b!1372883 m!1256267))

(check-sat (not b!1372883) (not b!1372882) (not b!1372880) (not b!1372885) (not b!1372884) (not start!116290) (not b!1372879) (not b!1372881))
(check-sat)
