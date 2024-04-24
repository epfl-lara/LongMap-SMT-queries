; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115696 () Bool)

(assert start!115696)

(declare-fun b!1367216 () Bool)

(declare-fun e!775160 () Bool)

(declare-fun e!775161 () Bool)

(assert (=> b!1367216 (= e!775160 e!775161)))

(declare-fun res!910020 () Bool)

(assert (=> b!1367216 (=> (not res!910020) (not e!775161))))

(declare-datatypes ((array!92908 0))(
  ( (array!92909 (arr!44878 (Array (_ BitVec 32) (_ BitVec 64))) (size!45429 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92908)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31933 0))(
  ( (Nil!31930) (Cons!31929 (h!33147 (_ BitVec 64)) (t!46619 List!31933)) )
))
(declare-fun acc!866 () List!31933)

(declare-fun arrayNoDuplicates!0 (array!92908 (_ BitVec 32) List!31933) Bool)

(assert (=> b!1367216 (= res!910020 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45026 0))(
  ( (Unit!45027) )
))
(declare-fun lt!601897 () Unit!45026)

(declare-fun newAcc!98 () List!31933)

(declare-fun noDuplicateSubseq!164 (List!31933 List!31933) Unit!45026)

(assert (=> b!1367216 (= lt!601897 (noDuplicateSubseq!164 newAcc!98 acc!866))))

(declare-fun b!1367217 () Bool)

(declare-fun res!910011 () Bool)

(assert (=> b!1367217 (=> (not res!910011) (not e!775160))))

(declare-fun contains!9618 (List!31933 (_ BitVec 64)) Bool)

(assert (=> b!1367217 (= res!910011 (not (contains!9618 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910010 () Bool)

(assert (=> start!115696 (=> (not res!910010) (not e!775160))))

(assert (=> start!115696 (= res!910010 (and (bvslt (size!45429 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45429 a!3861))))))

(assert (=> start!115696 e!775160))

(declare-fun array_inv!34159 (array!92908) Bool)

(assert (=> start!115696 (array_inv!34159 a!3861)))

(assert (=> start!115696 true))

(declare-fun b!1367218 () Bool)

(declare-fun res!910016 () Bool)

(assert (=> b!1367218 (=> (not res!910016) (not e!775160))))

(declare-fun noDuplicate!2449 (List!31933) Bool)

(assert (=> b!1367218 (= res!910016 (noDuplicate!2449 acc!866))))

(declare-fun b!1367219 () Bool)

(declare-fun e!775162 () Bool)

(assert (=> b!1367219 (= e!775161 e!775162)))

(declare-fun res!910021 () Bool)

(assert (=> b!1367219 (=> (not res!910021) (not e!775162))))

(assert (=> b!1367219 (= res!910021 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun lt!601895 () List!31933)

(assert (=> b!1367219 (= lt!601895 (Cons!31929 (select (arr!44878 a!3861) from!3239) newAcc!98))))

(declare-fun lt!601899 () List!31933)

(assert (=> b!1367219 (= lt!601899 (Cons!31929 (select (arr!44878 a!3861) from!3239) acc!866))))

(declare-fun b!1367220 () Bool)

(declare-fun res!910015 () Bool)

(assert (=> b!1367220 (=> (not res!910015) (not e!775160))))

(assert (=> b!1367220 (= res!910015 (not (contains!9618 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367221 () Bool)

(declare-fun res!910009 () Bool)

(assert (=> b!1367221 (=> (not res!910009) (not e!775162))))

(assert (=> b!1367221 (= res!910009 (noDuplicate!2449 lt!601899))))

(declare-fun b!1367222 () Bool)

(declare-fun res!910013 () Bool)

(assert (=> b!1367222 (=> (not res!910013) (not e!775162))))

(assert (=> b!1367222 (= res!910013 (not (contains!9618 lt!601899 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367223 () Bool)

(declare-fun res!910024 () Bool)

(assert (=> b!1367223 (=> (not res!910024) (not e!775160))))

(assert (=> b!1367223 (= res!910024 (not (contains!9618 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367224 () Bool)

(declare-fun res!910019 () Bool)

(assert (=> b!1367224 (=> (not res!910019) (not e!775160))))

(assert (=> b!1367224 (= res!910019 (not (contains!9618 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367225 () Bool)

(declare-fun res!910018 () Bool)

(assert (=> b!1367225 (=> (not res!910018) (not e!775162))))

(assert (=> b!1367225 (= res!910018 (not (contains!9618 lt!601895 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367226 () Bool)

(declare-fun res!910025 () Bool)

(assert (=> b!1367226 (=> (not res!910025) (not e!775161))))

(assert (=> b!1367226 (= res!910025 (bvslt from!3239 (size!45429 a!3861)))))

(declare-fun b!1367227 () Bool)

(declare-fun res!910022 () Bool)

(assert (=> b!1367227 (=> (not res!910022) (not e!775162))))

(assert (=> b!1367227 (= res!910022 (not (contains!9618 lt!601899 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367228 () Bool)

(declare-fun res!910023 () Bool)

(assert (=> b!1367228 (=> (not res!910023) (not e!775161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367228 (= res!910023 (validKeyInArray!0 (select (arr!44878 a!3861) from!3239)))))

(declare-fun b!1367229 () Bool)

(assert (=> b!1367229 (= e!775162 false)))

(declare-fun lt!601896 () Bool)

(assert (=> b!1367229 (= lt!601896 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601899))))

(declare-fun lt!601898 () Unit!45026)

(assert (=> b!1367229 (= lt!601898 (noDuplicateSubseq!164 lt!601895 lt!601899))))

(declare-fun b!1367230 () Bool)

(declare-fun res!910014 () Bool)

(assert (=> b!1367230 (=> (not res!910014) (not e!775161))))

(assert (=> b!1367230 (= res!910014 (not (contains!9618 acc!866 (select (arr!44878 a!3861) from!3239))))))

(declare-fun b!1367231 () Bool)

(declare-fun res!910017 () Bool)

(assert (=> b!1367231 (=> (not res!910017) (not e!775160))))

(declare-fun subseq!977 (List!31933 List!31933) Bool)

(assert (=> b!1367231 (= res!910017 (subseq!977 newAcc!98 acc!866))))

(declare-fun b!1367232 () Bool)

(declare-fun res!910026 () Bool)

(assert (=> b!1367232 (=> (not res!910026) (not e!775162))))

(assert (=> b!1367232 (= res!910026 (subseq!977 lt!601895 lt!601899))))

(declare-fun b!1367233 () Bool)

(declare-fun res!910012 () Bool)

(assert (=> b!1367233 (=> (not res!910012) (not e!775162))))

(assert (=> b!1367233 (= res!910012 (not (contains!9618 lt!601895 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115696 res!910010) b!1367218))

(assert (= (and b!1367218 res!910016) b!1367224))

(assert (= (and b!1367224 res!910019) b!1367223))

(assert (= (and b!1367223 res!910024) b!1367217))

(assert (= (and b!1367217 res!910011) b!1367220))

(assert (= (and b!1367220 res!910015) b!1367231))

(assert (= (and b!1367231 res!910017) b!1367216))

(assert (= (and b!1367216 res!910020) b!1367226))

(assert (= (and b!1367226 res!910025) b!1367228))

(assert (= (and b!1367228 res!910023) b!1367230))

(assert (= (and b!1367230 res!910014) b!1367219))

(assert (= (and b!1367219 res!910021) b!1367221))

(assert (= (and b!1367221 res!910009) b!1367227))

(assert (= (and b!1367227 res!910022) b!1367222))

(assert (= (and b!1367222 res!910013) b!1367233))

(assert (= (and b!1367233 res!910012) b!1367225))

(assert (= (and b!1367225 res!910018) b!1367232))

(assert (= (and b!1367232 res!910026) b!1367229))

(declare-fun m!1251937 () Bool)

(assert (=> start!115696 m!1251937))

(declare-fun m!1251939 () Bool)

(assert (=> b!1367219 m!1251939))

(declare-fun m!1251941 () Bool)

(assert (=> b!1367221 m!1251941))

(declare-fun m!1251943 () Bool)

(assert (=> b!1367231 m!1251943))

(declare-fun m!1251945 () Bool)

(assert (=> b!1367232 m!1251945))

(declare-fun m!1251947 () Bool)

(assert (=> b!1367216 m!1251947))

(declare-fun m!1251949 () Bool)

(assert (=> b!1367216 m!1251949))

(declare-fun m!1251951 () Bool)

(assert (=> b!1367220 m!1251951))

(declare-fun m!1251953 () Bool)

(assert (=> b!1367223 m!1251953))

(assert (=> b!1367230 m!1251939))

(assert (=> b!1367230 m!1251939))

(declare-fun m!1251955 () Bool)

(assert (=> b!1367230 m!1251955))

(declare-fun m!1251957 () Bool)

(assert (=> b!1367229 m!1251957))

(declare-fun m!1251959 () Bool)

(assert (=> b!1367229 m!1251959))

(declare-fun m!1251961 () Bool)

(assert (=> b!1367222 m!1251961))

(declare-fun m!1251963 () Bool)

(assert (=> b!1367233 m!1251963))

(assert (=> b!1367228 m!1251939))

(assert (=> b!1367228 m!1251939))

(declare-fun m!1251965 () Bool)

(assert (=> b!1367228 m!1251965))

(declare-fun m!1251967 () Bool)

(assert (=> b!1367217 m!1251967))

(declare-fun m!1251969 () Bool)

(assert (=> b!1367225 m!1251969))

(declare-fun m!1251971 () Bool)

(assert (=> b!1367218 m!1251971))

(declare-fun m!1251973 () Bool)

(assert (=> b!1367227 m!1251973))

(declare-fun m!1251975 () Bool)

(assert (=> b!1367224 m!1251975))

(check-sat (not b!1367231) (not b!1367216) (not b!1367233) (not b!1367221) (not b!1367218) (not b!1367225) (not b!1367222) (not b!1367229) (not b!1367220) (not b!1367228) (not b!1367232) (not b!1367230) (not start!115696) (not b!1367223) (not b!1367227) (not b!1367224) (not b!1367217))
(check-sat)
