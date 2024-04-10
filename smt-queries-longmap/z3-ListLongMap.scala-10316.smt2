; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121220 () Bool)

(assert start!121220)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96374 0))(
  ( (array!96375 (arr!46530 (Array (_ BitVec 32) (_ BitVec 64))) (size!47080 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96374)

(declare-fun b!1409486 () Bool)

(declare-fun e!797620 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10841 0))(
  ( (MissingZero!10841 (index!45741 (_ BitVec 32))) (Found!10841 (index!45742 (_ BitVec 32))) (Intermediate!10841 (undefined!11653 Bool) (index!45743 (_ BitVec 32)) (x!127330 (_ BitVec 32))) (Undefined!10841) (MissingVacant!10841 (index!45744 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96374 (_ BitVec 32)) SeekEntryResult!10841)

(assert (=> b!1409486 (= e!797620 (= (seekEntryOrOpen!0 (select (arr!46530 a!2901) j!112) a!2901 mask!2840) (Found!10841 j!112)))))

(declare-fun b!1409487 () Bool)

(declare-fun res!947208 () Bool)

(declare-fun e!797618 () Bool)

(assert (=> b!1409487 (=> (not res!947208) (not e!797618))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409487 (= res!947208 (and (= (size!47080 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47080 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47080 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409488 () Bool)

(declare-fun res!947214 () Bool)

(assert (=> b!1409488 (=> (not res!947214) (not e!797618))))

(declare-datatypes ((List!33049 0))(
  ( (Nil!33046) (Cons!33045 (h!34308 (_ BitVec 64)) (t!47743 List!33049)) )
))
(declare-fun arrayNoDuplicates!0 (array!96374 (_ BitVec 32) List!33049) Bool)

(assert (=> b!1409488 (= res!947214 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33046))))

(declare-fun res!947211 () Bool)

(assert (=> start!121220 (=> (not res!947211) (not e!797618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121220 (= res!947211 (validMask!0 mask!2840))))

(assert (=> start!121220 e!797618))

(assert (=> start!121220 true))

(declare-fun array_inv!35558 (array!96374) Bool)

(assert (=> start!121220 (array_inv!35558 a!2901)))

(declare-fun b!1409489 () Bool)

(declare-fun e!797619 () Bool)

(assert (=> b!1409489 (= e!797619 true)))

(declare-fun lt!620741 () SeekEntryResult!10841)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96374 (_ BitVec 32)) SeekEntryResult!10841)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409489 (= lt!620741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46530 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46530 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96375 (store (arr!46530 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47080 a!2901)) mask!2840))))

(declare-fun b!1409490 () Bool)

(assert (=> b!1409490 (= e!797618 (not e!797619))))

(declare-fun res!947209 () Bool)

(assert (=> b!1409490 (=> res!947209 e!797619)))

(declare-fun lt!620742 () SeekEntryResult!10841)

(get-info :version)

(assert (=> b!1409490 (= res!947209 (or (not ((_ is Intermediate!10841) lt!620742)) (undefined!11653 lt!620742)))))

(assert (=> b!1409490 e!797620))

(declare-fun res!947210 () Bool)

(assert (=> b!1409490 (=> (not res!947210) (not e!797620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96374 (_ BitVec 32)) Bool)

(assert (=> b!1409490 (= res!947210 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47656 0))(
  ( (Unit!47657) )
))
(declare-fun lt!620740 () Unit!47656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47656)

(assert (=> b!1409490 (= lt!620740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409490 (= lt!620742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46530 a!2901) j!112) mask!2840) (select (arr!46530 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409491 () Bool)

(declare-fun res!947213 () Bool)

(assert (=> b!1409491 (=> (not res!947213) (not e!797618))))

(assert (=> b!1409491 (= res!947213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409492 () Bool)

(declare-fun res!947212 () Bool)

(assert (=> b!1409492 (=> (not res!947212) (not e!797618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409492 (= res!947212 (validKeyInArray!0 (select (arr!46530 a!2901) i!1037)))))

(declare-fun b!1409493 () Bool)

(declare-fun res!947215 () Bool)

(assert (=> b!1409493 (=> (not res!947215) (not e!797618))))

(assert (=> b!1409493 (= res!947215 (validKeyInArray!0 (select (arr!46530 a!2901) j!112)))))

(assert (= (and start!121220 res!947211) b!1409487))

(assert (= (and b!1409487 res!947208) b!1409492))

(assert (= (and b!1409492 res!947212) b!1409493))

(assert (= (and b!1409493 res!947215) b!1409491))

(assert (= (and b!1409491 res!947213) b!1409488))

(assert (= (and b!1409488 res!947214) b!1409490))

(assert (= (and b!1409490 res!947210) b!1409486))

(assert (= (and b!1409490 (not res!947209)) b!1409489))

(declare-fun m!1299223 () Bool)

(assert (=> b!1409486 m!1299223))

(assert (=> b!1409486 m!1299223))

(declare-fun m!1299225 () Bool)

(assert (=> b!1409486 m!1299225))

(assert (=> b!1409493 m!1299223))

(assert (=> b!1409493 m!1299223))

(declare-fun m!1299227 () Bool)

(assert (=> b!1409493 m!1299227))

(declare-fun m!1299229 () Bool)

(assert (=> b!1409488 m!1299229))

(declare-fun m!1299231 () Bool)

(assert (=> start!121220 m!1299231))

(declare-fun m!1299233 () Bool)

(assert (=> start!121220 m!1299233))

(declare-fun m!1299235 () Bool)

(assert (=> b!1409491 m!1299235))

(declare-fun m!1299237 () Bool)

(assert (=> b!1409489 m!1299237))

(declare-fun m!1299239 () Bool)

(assert (=> b!1409489 m!1299239))

(assert (=> b!1409489 m!1299239))

(declare-fun m!1299241 () Bool)

(assert (=> b!1409489 m!1299241))

(assert (=> b!1409489 m!1299241))

(assert (=> b!1409489 m!1299239))

(declare-fun m!1299243 () Bool)

(assert (=> b!1409489 m!1299243))

(assert (=> b!1409490 m!1299223))

(declare-fun m!1299245 () Bool)

(assert (=> b!1409490 m!1299245))

(assert (=> b!1409490 m!1299223))

(declare-fun m!1299247 () Bool)

(assert (=> b!1409490 m!1299247))

(assert (=> b!1409490 m!1299245))

(assert (=> b!1409490 m!1299223))

(declare-fun m!1299249 () Bool)

(assert (=> b!1409490 m!1299249))

(declare-fun m!1299251 () Bool)

(assert (=> b!1409490 m!1299251))

(declare-fun m!1299253 () Bool)

(assert (=> b!1409492 m!1299253))

(assert (=> b!1409492 m!1299253))

(declare-fun m!1299255 () Bool)

(assert (=> b!1409492 m!1299255))

(check-sat (not b!1409493) (not start!121220) (not b!1409488) (not b!1409490) (not b!1409489) (not b!1409486) (not b!1409492) (not b!1409491))
