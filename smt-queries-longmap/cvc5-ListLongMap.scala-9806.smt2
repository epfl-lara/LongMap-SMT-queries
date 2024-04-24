; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116714 () Bool)

(assert start!116714)

(declare-fun res!917831 () Bool)

(declare-fun e!779293 () Bool)

(assert (=> start!116714 (=> (not res!917831) (not e!779293))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93305 0))(
  ( (array!93306 (arr!45054 (Array (_ BitVec 32) (_ BitVec 64))) (size!45605 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93305)

(assert (=> start!116714 (= res!917831 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45605 a!4142))))))

(assert (=> start!116714 e!779293))

(assert (=> start!116714 true))

(declare-fun array_inv!34335 (array!93305) Bool)

(assert (=> start!116714 (array_inv!34335 a!4142)))

(declare-fun b!1375428 () Bool)

(declare-fun e!779292 () Bool)

(assert (=> b!1375428 (= e!779292 true)))

(declare-fun lt!603742 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375428 (= lt!603742 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603743 () (_ BitVec 32))

(declare-fun lt!603744 () array!93305)

(assert (=> b!1375428 (= lt!603743 (arrayCountValidKeys!0 lt!603744 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375429 () Bool)

(declare-fun res!917832 () Bool)

(assert (=> b!1375429 (=> (not res!917832) (not e!779293))))

(assert (=> b!1375429 (= res!917832 (bvslt (size!45605 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375430 () Bool)

(assert (=> b!1375430 (= e!779293 (not e!779292))))

(declare-fun res!917834 () Bool)

(assert (=> b!1375430 (=> res!917834 e!779292)))

(assert (=> b!1375430 (= res!917834 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1375430 (= (arrayCountValidKeys!0 lt!603744 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375430 (= lt!603744 (array!93306 (store (arr!45054 a!4142) i!1457 k!2959) (size!45605 a!4142)))))

(declare-datatypes ((Unit!45342 0))(
  ( (Unit!45343) )
))
(declare-fun lt!603741 () Unit!45342)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45342)

(assert (=> b!1375430 (= lt!603741 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375431 () Bool)

(declare-fun res!917833 () Bool)

(assert (=> b!1375431 (=> (not res!917833) (not e!779293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375431 (= res!917833 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375432 () Bool)

(declare-fun res!917835 () Bool)

(assert (=> b!1375432 (=> (not res!917835) (not e!779293))))

(assert (=> b!1375432 (= res!917835 (validKeyInArray!0 (select (arr!45054 a!4142) i!1457)))))

(assert (= (and start!116714 res!917831) b!1375432))

(assert (= (and b!1375432 res!917835) b!1375431))

(assert (= (and b!1375431 res!917833) b!1375429))

(assert (= (and b!1375429 res!917832) b!1375430))

(assert (= (and b!1375430 (not res!917834)) b!1375428))

(declare-fun m!1258949 () Bool)

(assert (=> b!1375432 m!1258949))

(assert (=> b!1375432 m!1258949))

(declare-fun m!1258951 () Bool)

(assert (=> b!1375432 m!1258951))

(declare-fun m!1258953 () Bool)

(assert (=> b!1375431 m!1258953))

(declare-fun m!1258955 () Bool)

(assert (=> b!1375430 m!1258955))

(declare-fun m!1258957 () Bool)

(assert (=> b!1375430 m!1258957))

(declare-fun m!1258959 () Bool)

(assert (=> b!1375430 m!1258959))

(declare-fun m!1258961 () Bool)

(assert (=> b!1375430 m!1258961))

(declare-fun m!1258963 () Bool)

(assert (=> b!1375428 m!1258963))

(declare-fun m!1258965 () Bool)

(assert (=> b!1375428 m!1258965))

(declare-fun m!1258967 () Bool)

(assert (=> start!116714 m!1258967))

(push 1)

(assert (not b!1375431))

(assert (not b!1375430))

(assert (not b!1375432))

(assert (not start!116714))

(assert (not b!1375428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

