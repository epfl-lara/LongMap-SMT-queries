; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116110 () Bool)

(assert start!116110)

(declare-fun b!1371238 () Bool)

(declare-fun res!913924 () Bool)

(declare-fun e!776808 () Bool)

(assert (=> b!1371238 (=> (not res!913924) (not e!776808))))

(declare-datatypes ((List!32029 0))(
  ( (Nil!32026) (Cons!32025 (h!33243 (_ BitVec 64)) (t!46715 List!32029)) )
))
(declare-fun newAcc!98 () List!32029)

(declare-fun acc!866 () List!32029)

(declare-fun subseq!1073 (List!32029 List!32029) Bool)

(assert (=> b!1371238 (= res!913924 (subseq!1073 newAcc!98 acc!866))))

(declare-fun b!1371239 () Bool)

(declare-fun res!913925 () Bool)

(assert (=> b!1371239 (=> (not res!913925) (not e!776808))))

(declare-fun contains!9714 (List!32029 (_ BitVec 64)) Bool)

(assert (=> b!1371239 (= res!913925 (not (contains!9714 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371240 () Bool)

(declare-fun res!913926 () Bool)

(declare-fun e!776809 () Bool)

(assert (=> b!1371240 (=> (not res!913926) (not e!776809))))

(declare-datatypes ((array!93115 0))(
  ( (array!93116 (arr!44974 (Array (_ BitVec 32) (_ BitVec 64))) (size!45525 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93115)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371240 (= res!913926 (validKeyInArray!0 (select (arr!44974 a!3861) from!3239)))))

(declare-fun b!1371241 () Bool)

(declare-fun res!913921 () Bool)

(assert (=> b!1371241 (=> (not res!913921) (not e!776808))))

(declare-fun noDuplicate!2545 (List!32029) Bool)

(assert (=> b!1371241 (= res!913921 (noDuplicate!2545 acc!866))))

(declare-fun b!1371242 () Bool)

(declare-fun res!913922 () Bool)

(assert (=> b!1371242 (=> (not res!913922) (not e!776809))))

(assert (=> b!1371242 (= res!913922 (bvslt from!3239 (size!45525 a!3861)))))

(declare-fun b!1371243 () Bool)

(declare-fun res!913920 () Bool)

(assert (=> b!1371243 (=> (not res!913920) (not e!776808))))

(assert (=> b!1371243 (= res!913920 (not (contains!9714 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371245 () Bool)

(declare-fun res!913917 () Bool)

(assert (=> b!1371245 (=> (not res!913917) (not e!776808))))

(assert (=> b!1371245 (= res!913917 (not (contains!9714 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371246 () Bool)

(assert (=> b!1371246 (= e!776808 e!776809)))

(declare-fun res!913918 () Bool)

(assert (=> b!1371246 (=> (not res!913918) (not e!776809))))

(declare-fun arrayNoDuplicates!0 (array!93115 (_ BitVec 32) List!32029) Bool)

(assert (=> b!1371246 (= res!913918 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45218 0))(
  ( (Unit!45219) )
))
(declare-fun lt!602837 () Unit!45218)

(declare-fun noDuplicateSubseq!260 (List!32029 List!32029) Unit!45218)

(assert (=> b!1371246 (= lt!602837 (noDuplicateSubseq!260 newAcc!98 acc!866))))

(declare-fun b!1371247 () Bool)

(assert (=> b!1371247 (= e!776809 false)))

(declare-fun lt!602838 () Bool)

(assert (=> b!1371247 (= lt!602838 (contains!9714 acc!866 (select (arr!44974 a!3861) from!3239)))))

(declare-fun b!1371244 () Bool)

(declare-fun res!913923 () Bool)

(assert (=> b!1371244 (=> (not res!913923) (not e!776808))))

(assert (=> b!1371244 (= res!913923 (not (contains!9714 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913919 () Bool)

(assert (=> start!116110 (=> (not res!913919) (not e!776808))))

(assert (=> start!116110 (= res!913919 (and (bvslt (size!45525 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45525 a!3861))))))

(assert (=> start!116110 e!776808))

(declare-fun array_inv!34255 (array!93115) Bool)

(assert (=> start!116110 (array_inv!34255 a!3861)))

(assert (=> start!116110 true))

(assert (= (and start!116110 res!913919) b!1371241))

(assert (= (and b!1371241 res!913921) b!1371245))

(assert (= (and b!1371245 res!913917) b!1371243))

(assert (= (and b!1371243 res!913920) b!1371239))

(assert (= (and b!1371239 res!913925) b!1371244))

(assert (= (and b!1371244 res!913923) b!1371238))

(assert (= (and b!1371238 res!913924) b!1371246))

(assert (= (and b!1371246 res!913918) b!1371242))

(assert (= (and b!1371242 res!913922) b!1371240))

(assert (= (and b!1371240 res!913926) b!1371247))

(declare-fun m!1255213 () Bool)

(assert (=> b!1371245 m!1255213))

(declare-fun m!1255215 () Bool)

(assert (=> b!1371246 m!1255215))

(declare-fun m!1255217 () Bool)

(assert (=> b!1371246 m!1255217))

(declare-fun m!1255219 () Bool)

(assert (=> b!1371240 m!1255219))

(assert (=> b!1371240 m!1255219))

(declare-fun m!1255221 () Bool)

(assert (=> b!1371240 m!1255221))

(declare-fun m!1255223 () Bool)

(assert (=> start!116110 m!1255223))

(declare-fun m!1255225 () Bool)

(assert (=> b!1371241 m!1255225))

(assert (=> b!1371247 m!1255219))

(assert (=> b!1371247 m!1255219))

(declare-fun m!1255227 () Bool)

(assert (=> b!1371247 m!1255227))

(declare-fun m!1255229 () Bool)

(assert (=> b!1371238 m!1255229))

(declare-fun m!1255231 () Bool)

(assert (=> b!1371243 m!1255231))

(declare-fun m!1255233 () Bool)

(assert (=> b!1371239 m!1255233))

(declare-fun m!1255235 () Bool)

(assert (=> b!1371244 m!1255235))

(check-sat (not b!1371244) (not b!1371238) (not start!116110) (not b!1371245) (not b!1371240) (not b!1371239) (not b!1371246) (not b!1371243) (not b!1371247) (not b!1371241))
(check-sat)
