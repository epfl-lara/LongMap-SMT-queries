; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116542 () Bool)

(assert start!116542)

(declare-fun b!1374501 () Bool)

(declare-fun e!778665 () Bool)

(declare-fun e!778664 () Bool)

(assert (=> b!1374501 (= e!778665 (not e!778664))))

(declare-fun res!917685 () Bool)

(assert (=> b!1374501 (=> res!917685 e!778664)))

(declare-datatypes ((array!93242 0))(
  ( (array!93243 (arr!45027 (Array (_ BitVec 32) (_ BitVec 64))) (size!45577 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93242)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374501 (= res!917685 (or (bvslt (size!45577 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603665 () (_ BitVec 32))

(declare-fun lt!603672 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93242 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374501 (= (bvadd lt!603665 lt!603672) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45577 a!4142)))))

(declare-datatypes ((Unit!45455 0))(
  ( (Unit!45456) )
))
(declare-fun lt!603671 () Unit!45455)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45455)

(assert (=> b!1374501 (= lt!603671 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45577 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603667 () (_ BitVec 32))

(assert (=> b!1374501 (= lt!603667 lt!603672)))

(assert (=> b!1374501 (= lt!603672 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45577 a!4142)))))

(declare-fun lt!603668 () array!93242)

(assert (=> b!1374501 (= lt!603667 (arrayCountValidKeys!0 lt!603668 (bvadd #b00000000000000000000000000000001 i!1457) (size!45577 a!4142)))))

(declare-fun lt!603669 () Unit!45455)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45455)

(assert (=> b!1374501 (= lt!603669 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603673 () (_ BitVec 32))

(assert (=> b!1374501 (= lt!603673 (bvsub lt!603665 #b00000000000000000000000000000001))))

(assert (=> b!1374501 (= lt!603673 (arrayCountValidKeys!0 lt!603668 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374501 (= lt!603665 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374501 (= lt!603668 (array!93243 (store (arr!45027 a!4142) i!1457 k0!2959) (size!45577 a!4142)))))

(declare-fun lt!603666 () Unit!45455)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45455)

(assert (=> b!1374501 (= lt!603666 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374502 () Bool)

(assert (=> b!1374502 (= e!778664 true)))

(assert (=> b!1374502 (= (bvadd lt!603673 lt!603667) (arrayCountValidKeys!0 lt!603668 #b00000000000000000000000000000000 (size!45577 a!4142)))))

(declare-fun lt!603670 () Unit!45455)

(assert (=> b!1374502 (= lt!603670 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603668 #b00000000000000000000000000000000 (size!45577 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374503 () Bool)

(declare-fun res!917689 () Bool)

(assert (=> b!1374503 (=> (not res!917689) (not e!778665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374503 (= res!917689 (validKeyInArray!0 (select (arr!45027 a!4142) i!1457)))))

(declare-fun b!1374504 () Bool)

(declare-fun res!917687 () Bool)

(assert (=> b!1374504 (=> (not res!917687) (not e!778665))))

(assert (=> b!1374504 (= res!917687 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374505 () Bool)

(declare-fun res!917688 () Bool)

(assert (=> b!1374505 (=> (not res!917688) (not e!778665))))

(assert (=> b!1374505 (= res!917688 (bvslt (size!45577 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917686 () Bool)

(assert (=> start!116542 (=> (not res!917686) (not e!778665))))

(assert (=> start!116542 (= res!917686 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45577 a!4142))))))

(assert (=> start!116542 e!778665))

(assert (=> start!116542 true))

(declare-fun array_inv!34055 (array!93242) Bool)

(assert (=> start!116542 (array_inv!34055 a!4142)))

(assert (= (and start!116542 res!917686) b!1374503))

(assert (= (and b!1374503 res!917689) b!1374504))

(assert (= (and b!1374504 res!917687) b!1374505))

(assert (= (and b!1374505 res!917688) b!1374501))

(assert (= (and b!1374501 (not res!917685)) b!1374502))

(declare-fun m!1257937 () Bool)

(assert (=> b!1374501 m!1257937))

(declare-fun m!1257939 () Bool)

(assert (=> b!1374501 m!1257939))

(declare-fun m!1257941 () Bool)

(assert (=> b!1374501 m!1257941))

(declare-fun m!1257943 () Bool)

(assert (=> b!1374501 m!1257943))

(declare-fun m!1257945 () Bool)

(assert (=> b!1374501 m!1257945))

(declare-fun m!1257947 () Bool)

(assert (=> b!1374501 m!1257947))

(declare-fun m!1257949 () Bool)

(assert (=> b!1374501 m!1257949))

(declare-fun m!1257951 () Bool)

(assert (=> b!1374501 m!1257951))

(declare-fun m!1257953 () Bool)

(assert (=> b!1374501 m!1257953))

(declare-fun m!1257955 () Bool)

(assert (=> b!1374502 m!1257955))

(declare-fun m!1257957 () Bool)

(assert (=> b!1374502 m!1257957))

(declare-fun m!1257959 () Bool)

(assert (=> b!1374503 m!1257959))

(assert (=> b!1374503 m!1257959))

(declare-fun m!1257961 () Bool)

(assert (=> b!1374503 m!1257961))

(declare-fun m!1257963 () Bool)

(assert (=> b!1374504 m!1257963))

(declare-fun m!1257965 () Bool)

(assert (=> start!116542 m!1257965))

(check-sat (not start!116542) (not b!1374502) (not b!1374503) (not b!1374501) (not b!1374504))
