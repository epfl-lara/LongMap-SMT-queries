; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116662 () Bool)

(assert start!116662)

(declare-fun b!1375158 () Bool)

(declare-fun res!918225 () Bool)

(declare-fun e!779020 () Bool)

(assert (=> b!1375158 (=> (not res!918225) (not e!779020))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375158 (= res!918225 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1375159 () Bool)

(declare-fun e!779018 () Bool)

(assert (=> b!1375159 (= e!779018 true)))

(declare-fun lt!604168 () (_ BitVec 32))

(declare-fun lt!604164 () (_ BitVec 32))

(declare-datatypes ((array!93331 0))(
  ( (array!93332 (arr!45069 (Array (_ BitVec 32) (_ BitVec 64))) (size!45619 (_ BitVec 32))) )
))
(declare-fun lt!604163 () array!93331)

(declare-fun a!4142 () array!93331)

(declare-fun arrayCountValidKeys!0 (array!93331 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375159 (= (bvadd lt!604168 lt!604164) (arrayCountValidKeys!0 lt!604163 #b00000000000000000000000000000000 (size!45619 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45527 0))(
  ( (Unit!45528) )
))
(declare-fun lt!604160 () Unit!45527)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45527)

(assert (=> b!1375159 (= lt!604160 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604163 #b00000000000000000000000000000000 (size!45619 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375160 () Bool)

(assert (=> b!1375160 (= e!779020 (not e!779018))))

(declare-fun res!918224 () Bool)

(assert (=> b!1375160 (=> res!918224 e!779018)))

(assert (=> b!1375160 (= res!918224 (or (bvslt (size!45619 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604161 () (_ BitVec 32))

(declare-fun lt!604167 () (_ BitVec 32))

(assert (=> b!1375160 (= (bvadd lt!604161 lt!604167) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45619 a!4142)))))

(declare-fun lt!604165 () Unit!45527)

(assert (=> b!1375160 (= lt!604165 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45619 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375160 (= lt!604164 lt!604167)))

(assert (=> b!1375160 (= lt!604167 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45619 a!4142)))))

(assert (=> b!1375160 (= lt!604164 (arrayCountValidKeys!0 lt!604163 (bvadd #b00000000000000000000000000000001 i!1457) (size!45619 a!4142)))))

(declare-fun lt!604162 () Unit!45527)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45527)

(assert (=> b!1375160 (= lt!604162 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375160 (= lt!604168 (bvsub lt!604161 #b00000000000000000000000000000001))))

(assert (=> b!1375160 (= lt!604168 (arrayCountValidKeys!0 lt!604163 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375160 (= lt!604161 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375160 (= lt!604163 (array!93332 (store (arr!45069 a!4142) i!1457 k0!2959) (size!45619 a!4142)))))

(declare-fun lt!604166 () Unit!45527)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45527)

(assert (=> b!1375160 (= lt!604166 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1375161 () Bool)

(declare-fun res!918226 () Bool)

(assert (=> b!1375161 (=> (not res!918226) (not e!779020))))

(assert (=> b!1375161 (= res!918226 (bvslt (size!45619 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375162 () Bool)

(declare-fun res!918222 () Bool)

(assert (=> b!1375162 (=> (not res!918222) (not e!779020))))

(assert (=> b!1375162 (= res!918222 (validKeyInArray!0 (select (arr!45069 a!4142) i!1457)))))

(declare-fun res!918223 () Bool)

(assert (=> start!116662 (=> (not res!918223) (not e!779020))))

(assert (=> start!116662 (= res!918223 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45619 a!4142))))))

(assert (=> start!116662 e!779020))

(assert (=> start!116662 true))

(declare-fun array_inv!34097 (array!93331) Bool)

(assert (=> start!116662 (array_inv!34097 a!4142)))

(assert (= (and start!116662 res!918223) b!1375162))

(assert (= (and b!1375162 res!918222) b!1375158))

(assert (= (and b!1375158 res!918225) b!1375161))

(assert (= (and b!1375161 res!918226) b!1375160))

(assert (= (and b!1375160 (not res!918224)) b!1375159))

(declare-fun m!1258897 () Bool)

(assert (=> b!1375162 m!1258897))

(assert (=> b!1375162 m!1258897))

(declare-fun m!1258899 () Bool)

(assert (=> b!1375162 m!1258899))

(declare-fun m!1258901 () Bool)

(assert (=> b!1375158 m!1258901))

(declare-fun m!1258903 () Bool)

(assert (=> start!116662 m!1258903))

(declare-fun m!1258905 () Bool)

(assert (=> b!1375160 m!1258905))

(declare-fun m!1258907 () Bool)

(assert (=> b!1375160 m!1258907))

(declare-fun m!1258909 () Bool)

(assert (=> b!1375160 m!1258909))

(declare-fun m!1258911 () Bool)

(assert (=> b!1375160 m!1258911))

(declare-fun m!1258913 () Bool)

(assert (=> b!1375160 m!1258913))

(declare-fun m!1258915 () Bool)

(assert (=> b!1375160 m!1258915))

(declare-fun m!1258917 () Bool)

(assert (=> b!1375160 m!1258917))

(declare-fun m!1258919 () Bool)

(assert (=> b!1375160 m!1258919))

(declare-fun m!1258921 () Bool)

(assert (=> b!1375160 m!1258921))

(declare-fun m!1258923 () Bool)

(assert (=> b!1375159 m!1258923))

(declare-fun m!1258925 () Bool)

(assert (=> b!1375159 m!1258925))

(check-sat (not b!1375160) (not b!1375162) (not b!1375159) (not start!116662) (not b!1375158))
