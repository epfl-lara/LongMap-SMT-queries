; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102644 () Bool)

(assert start!102644)

(declare-fun b!1233875 () Bool)

(declare-fun e!699902 () Bool)

(declare-datatypes ((array!79534 0))(
  ( (array!79535 (arr!38376 (Array (_ BitVec 32) (_ BitVec 64))) (size!38912 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79534)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27149 0))(
  ( (Nil!27146) (Cons!27145 (h!28354 (_ BitVec 64)) (t!40612 List!27149)) )
))
(declare-fun arrayNoDuplicates!0 (array!79534 (_ BitVec 32) List!27149) Bool)

(assert (=> b!1233875 (= e!699902 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27145 (select (arr!38376 a!3806) from!3184) Nil!27146)))))

(declare-fun b!1233876 () Bool)

(declare-fun res!822057 () Bool)

(declare-fun e!699903 () Bool)

(assert (=> b!1233876 (=> (not res!822057) (not e!699903))))

(declare-fun acc!823 () List!27149)

(declare-fun contains!7211 (List!27149 (_ BitVec 64)) Bool)

(assert (=> b!1233876 (= res!822057 (not (contains!7211 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233877 () Bool)

(declare-fun res!822062 () Bool)

(assert (=> b!1233877 (=> (not res!822062) (not e!699903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233877 (= res!822062 (validKeyInArray!0 (select (arr!38376 a!3806) from!3184)))))

(declare-fun b!1233878 () Bool)

(declare-fun res!822056 () Bool)

(assert (=> b!1233878 (=> (not res!822056) (not e!699903))))

(assert (=> b!1233878 (= res!822056 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233879 () Bool)

(declare-fun res!822064 () Bool)

(assert (=> b!1233879 (=> (not res!822064) (not e!699903))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1233879 (= res!822064 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233880 () Bool)

(assert (=> b!1233880 (= e!699903 (not true))))

(declare-fun arrayContainsKey!0 (array!79534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233880 (not (arrayContainsKey!0 a!3806 (select (arr!38376 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40858 0))(
  ( (Unit!40859) )
))
(declare-fun lt!559763 () Unit!40858)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79534 (_ BitVec 32) (_ BitVec 64) List!27149) Unit!40858)

(assert (=> b!1233880 (= lt!559763 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38376 a!3806) from!3184) (Cons!27145 (select (arr!38376 a!3806) from!3184) Nil!27146)))))

(assert (=> b!1233880 e!699902))

(declare-fun res!822059 () Bool)

(assert (=> b!1233880 (=> (not res!822059) (not e!699902))))

(assert (=> b!1233880 (= res!822059 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27146))))

(declare-fun lt!559762 () Unit!40858)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79534 List!27149 List!27149 (_ BitVec 32)) Unit!40858)

(assert (=> b!1233880 (= lt!559762 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27146 from!3184))))

(assert (=> b!1233880 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27145 (select (arr!38376 a!3806) from!3184) acc!823))))

(declare-fun b!1233881 () Bool)

(declare-fun res!822063 () Bool)

(assert (=> b!1233881 (=> (not res!822063) (not e!699903))))

(assert (=> b!1233881 (= res!822063 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233882 () Bool)

(declare-fun res!822055 () Bool)

(assert (=> b!1233882 (=> (not res!822055) (not e!699903))))

(assert (=> b!1233882 (= res!822055 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38912 a!3806)) (bvslt from!3184 (size!38912 a!3806))))))

(declare-fun b!1233883 () Bool)

(declare-fun res!822061 () Bool)

(assert (=> b!1233883 (=> (not res!822061) (not e!699903))))

(declare-fun noDuplicate!1808 (List!27149) Bool)

(assert (=> b!1233883 (= res!822061 (noDuplicate!1808 acc!823))))

(declare-fun b!1233884 () Bool)

(declare-fun res!822058 () Bool)

(assert (=> b!1233884 (=> (not res!822058) (not e!699903))))

(assert (=> b!1233884 (= res!822058 (not (contains!7211 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822060 () Bool)

(assert (=> start!102644 (=> (not res!822060) (not e!699903))))

(assert (=> start!102644 (= res!822060 (bvslt (size!38912 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102644 e!699903))

(declare-fun array_inv!29224 (array!79534) Bool)

(assert (=> start!102644 (array_inv!29224 a!3806)))

(assert (=> start!102644 true))

(assert (= (and start!102644 res!822060) b!1233879))

(assert (= (and b!1233879 res!822064) b!1233882))

(assert (= (and b!1233882 res!822055) b!1233883))

(assert (= (and b!1233883 res!822061) b!1233884))

(assert (= (and b!1233884 res!822058) b!1233876))

(assert (= (and b!1233876 res!822057) b!1233881))

(assert (= (and b!1233881 res!822063) b!1233878))

(assert (= (and b!1233878 res!822056) b!1233877))

(assert (= (and b!1233877 res!822062) b!1233880))

(assert (= (and b!1233880 res!822059) b!1233875))

(declare-fun m!1137931 () Bool)

(assert (=> b!1233876 m!1137931))

(declare-fun m!1137933 () Bool)

(assert (=> b!1233877 m!1137933))

(assert (=> b!1233877 m!1137933))

(declare-fun m!1137935 () Bool)

(assert (=> b!1233877 m!1137935))

(declare-fun m!1137937 () Bool)

(assert (=> b!1233880 m!1137937))

(declare-fun m!1137939 () Bool)

(assert (=> b!1233880 m!1137939))

(assert (=> b!1233880 m!1137933))

(declare-fun m!1137941 () Bool)

(assert (=> b!1233880 m!1137941))

(assert (=> b!1233880 m!1137933))

(declare-fun m!1137943 () Bool)

(assert (=> b!1233880 m!1137943))

(assert (=> b!1233880 m!1137933))

(declare-fun m!1137945 () Bool)

(assert (=> b!1233880 m!1137945))

(declare-fun m!1137947 () Bool)

(assert (=> b!1233883 m!1137947))

(declare-fun m!1137949 () Bool)

(assert (=> b!1233884 m!1137949))

(declare-fun m!1137951 () Bool)

(assert (=> b!1233878 m!1137951))

(declare-fun m!1137953 () Bool)

(assert (=> start!102644 m!1137953))

(declare-fun m!1137955 () Bool)

(assert (=> b!1233879 m!1137955))

(assert (=> b!1233875 m!1137933))

(declare-fun m!1137957 () Bool)

(assert (=> b!1233875 m!1137957))

(declare-fun m!1137959 () Bool)

(assert (=> b!1233881 m!1137959))

(check-sat (not b!1233876) (not b!1233879) (not b!1233878) (not start!102644) (not b!1233880) (not b!1233883) (not b!1233877) (not b!1233884) (not b!1233875) (not b!1233881))
