; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121118 () Bool)

(assert start!121118)

(declare-fun res!945974 () Bool)

(declare-fun e!797006 () Bool)

(assert (=> start!121118 (=> (not res!945974) (not e!797006))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121118 (= res!945974 (validMask!0 mask!2840))))

(assert (=> start!121118 e!797006))

(assert (=> start!121118 true))

(declare-datatypes ((array!96272 0))(
  ( (array!96273 (arr!46479 (Array (_ BitVec 32) (_ BitVec 64))) (size!47029 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96272)

(declare-fun array_inv!35507 (array!96272) Bool)

(assert (=> start!121118 (array_inv!35507 a!2901)))

(declare-fun b!1408249 () Bool)

(declare-fun res!945976 () Bool)

(assert (=> b!1408249 (=> (not res!945976) (not e!797006))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408249 (= res!945976 (validKeyInArray!0 (select (arr!46479 a!2901) i!1037)))))

(declare-fun b!1408250 () Bool)

(declare-fun res!945971 () Bool)

(assert (=> b!1408250 (=> (not res!945971) (not e!797006))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408250 (= res!945971 (and (= (size!47029 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47029 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47029 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408251 () Bool)

(declare-fun res!945975 () Bool)

(assert (=> b!1408251 (=> (not res!945975) (not e!797006))))

(declare-datatypes ((List!32998 0))(
  ( (Nil!32995) (Cons!32994 (h!34257 (_ BitVec 64)) (t!47692 List!32998)) )
))
(declare-fun arrayNoDuplicates!0 (array!96272 (_ BitVec 32) List!32998) Bool)

(assert (=> b!1408251 (= res!945975 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32995))))

(declare-fun b!1408252 () Bool)

(declare-fun res!945977 () Bool)

(assert (=> b!1408252 (=> (not res!945977) (not e!797006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96272 (_ BitVec 32)) Bool)

(assert (=> b!1408252 (= res!945977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408253 () Bool)

(declare-fun e!797007 () Bool)

(assert (=> b!1408253 (= e!797006 (not e!797007))))

(declare-fun res!945972 () Bool)

(assert (=> b!1408253 (=> res!945972 e!797007)))

(declare-datatypes ((SeekEntryResult!10790 0))(
  ( (MissingZero!10790 (index!45537 (_ BitVec 32))) (Found!10790 (index!45538 (_ BitVec 32))) (Intermediate!10790 (undefined!11602 Bool) (index!45539 (_ BitVec 32)) (x!127143 (_ BitVec 32))) (Undefined!10790) (MissingVacant!10790 (index!45540 (_ BitVec 32))) )
))
(declare-fun lt!620231 () SeekEntryResult!10790)

(get-info :version)

(assert (=> b!1408253 (= res!945972 (or (not ((_ is Intermediate!10790) lt!620231)) (undefined!11602 lt!620231)))))

(declare-fun lt!620230 () SeekEntryResult!10790)

(assert (=> b!1408253 (= lt!620230 (Found!10790 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96272 (_ BitVec 32)) SeekEntryResult!10790)

(assert (=> b!1408253 (= lt!620230 (seekEntryOrOpen!0 (select (arr!46479 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408253 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47554 0))(
  ( (Unit!47555) )
))
(declare-fun lt!620233 () Unit!47554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47554)

(assert (=> b!1408253 (= lt!620233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620234 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96272 (_ BitVec 32)) SeekEntryResult!10790)

(assert (=> b!1408253 (= lt!620231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620234 (select (arr!46479 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408253 (= lt!620234 (toIndex!0 (select (arr!46479 a!2901) j!112) mask!2840))))

(declare-fun b!1408254 () Bool)

(declare-fun res!945973 () Bool)

(declare-fun e!797009 () Bool)

(assert (=> b!1408254 (=> res!945973 e!797009)))

(assert (=> b!1408254 (= res!945973 (or (bvslt (x!127143 lt!620231) #b00000000000000000000000000000000) (bvsgt (x!127143 lt!620231) #b01111111111111111111111111111110) (bvslt lt!620234 #b00000000000000000000000000000000) (bvsge lt!620234 (size!47029 a!2901)) (bvslt (index!45539 lt!620231) #b00000000000000000000000000000000) (bvsge (index!45539 lt!620231) (size!47029 a!2901)) (not (= lt!620231 (Intermediate!10790 false (index!45539 lt!620231) (x!127143 lt!620231))))))))

(declare-fun b!1408255 () Bool)

(declare-fun res!945979 () Bool)

(assert (=> b!1408255 (=> (not res!945979) (not e!797006))))

(assert (=> b!1408255 (= res!945979 (validKeyInArray!0 (select (arr!46479 a!2901) j!112)))))

(declare-fun b!1408256 () Bool)

(assert (=> b!1408256 (= e!797009 true)))

(declare-fun lt!620235 () array!96272)

(declare-fun lt!620229 () (_ BitVec 64))

(assert (=> b!1408256 (= lt!620230 (seekEntryOrOpen!0 lt!620229 lt!620235 mask!2840))))

(declare-fun lt!620232 () Unit!47554)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47554)

(assert (=> b!1408256 (= lt!620232 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620234 (x!127143 lt!620231) (index!45539 lt!620231) mask!2840))))

(declare-fun b!1408257 () Bool)

(assert (=> b!1408257 (= e!797007 e!797009)))

(declare-fun res!945978 () Bool)

(assert (=> b!1408257 (=> res!945978 e!797009)))

(assert (=> b!1408257 (= res!945978 (not (= lt!620231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620229 mask!2840) lt!620229 lt!620235 mask!2840))))))

(assert (=> b!1408257 (= lt!620229 (select (store (arr!46479 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408257 (= lt!620235 (array!96273 (store (arr!46479 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47029 a!2901)))))

(assert (= (and start!121118 res!945974) b!1408250))

(assert (= (and b!1408250 res!945971) b!1408249))

(assert (= (and b!1408249 res!945976) b!1408255))

(assert (= (and b!1408255 res!945979) b!1408252))

(assert (= (and b!1408252 res!945977) b!1408251))

(assert (= (and b!1408251 res!945975) b!1408253))

(assert (= (and b!1408253 (not res!945972)) b!1408257))

(assert (= (and b!1408257 (not res!945978)) b!1408254))

(assert (= (and b!1408254 (not res!945973)) b!1408256))

(declare-fun m!1297469 () Bool)

(assert (=> b!1408255 m!1297469))

(assert (=> b!1408255 m!1297469))

(declare-fun m!1297471 () Bool)

(assert (=> b!1408255 m!1297471))

(declare-fun m!1297473 () Bool)

(assert (=> b!1408257 m!1297473))

(assert (=> b!1408257 m!1297473))

(declare-fun m!1297475 () Bool)

(assert (=> b!1408257 m!1297475))

(declare-fun m!1297477 () Bool)

(assert (=> b!1408257 m!1297477))

(declare-fun m!1297479 () Bool)

(assert (=> b!1408257 m!1297479))

(declare-fun m!1297481 () Bool)

(assert (=> b!1408251 m!1297481))

(declare-fun m!1297483 () Bool)

(assert (=> b!1408249 m!1297483))

(assert (=> b!1408249 m!1297483))

(declare-fun m!1297485 () Bool)

(assert (=> b!1408249 m!1297485))

(assert (=> b!1408253 m!1297469))

(declare-fun m!1297487 () Bool)

(assert (=> b!1408253 m!1297487))

(assert (=> b!1408253 m!1297469))

(assert (=> b!1408253 m!1297469))

(declare-fun m!1297489 () Bool)

(assert (=> b!1408253 m!1297489))

(declare-fun m!1297491 () Bool)

(assert (=> b!1408253 m!1297491))

(assert (=> b!1408253 m!1297469))

(declare-fun m!1297493 () Bool)

(assert (=> b!1408253 m!1297493))

(declare-fun m!1297495 () Bool)

(assert (=> b!1408253 m!1297495))

(declare-fun m!1297497 () Bool)

(assert (=> start!121118 m!1297497))

(declare-fun m!1297499 () Bool)

(assert (=> start!121118 m!1297499))

(declare-fun m!1297501 () Bool)

(assert (=> b!1408256 m!1297501))

(declare-fun m!1297503 () Bool)

(assert (=> b!1408256 m!1297503))

(declare-fun m!1297505 () Bool)

(assert (=> b!1408252 m!1297505))

(check-sat (not b!1408253) (not b!1408257) (not b!1408255) (not b!1408256) (not b!1408249) (not b!1408252) (not start!121118) (not b!1408251))
(check-sat)
