; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128786 () Bool)

(assert start!128786)

(declare-fun b!1509039 () Bool)

(declare-fun res!1028945 () Bool)

(declare-fun e!842969 () Bool)

(assert (=> b!1509039 (=> (not res!1028945) (not e!842969))))

(declare-datatypes ((array!100642 0))(
  ( (array!100643 (arr!48558 (Array (_ BitVec 32) (_ BitVec 64))) (size!49108 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100642)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509039 (= res!1028945 (validKeyInArray!0 (select (arr!48558 a!2804) i!961)))))

(declare-fun b!1509040 () Bool)

(declare-fun res!1028947 () Bool)

(assert (=> b!1509040 (=> (not res!1028947) (not e!842969))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1509040 (= res!1028947 (validKeyInArray!0 (select (arr!48558 a!2804) j!70)))))

(declare-fun b!1509041 () Bool)

(declare-fun res!1028948 () Bool)

(assert (=> b!1509041 (=> (not res!1028948) (not e!842969))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100642 (_ BitVec 32)) Bool)

(assert (=> b!1509041 (= res!1028948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509042 () Bool)

(declare-fun res!1028950 () Bool)

(assert (=> b!1509042 (=> (not res!1028950) (not e!842969))))

(assert (=> b!1509042 (= res!1028950 (and (= (size!49108 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49108 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49108 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509043 () Bool)

(declare-fun res!1028943 () Bool)

(declare-fun e!842970 () Bool)

(assert (=> b!1509043 (=> (not res!1028943) (not e!842970))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12729 0))(
  ( (MissingZero!12729 (index!53311 (_ BitVec 32))) (Found!12729 (index!53312 (_ BitVec 32))) (Intermediate!12729 (undefined!13541 Bool) (index!53313 (_ BitVec 32)) (x!135071 (_ BitVec 32))) (Undefined!12729) (MissingVacant!12729 (index!53314 (_ BitVec 32))) )
))
(declare-fun lt!654795 () SeekEntryResult!12729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100642 (_ BitVec 32)) SeekEntryResult!12729)

(assert (=> b!1509043 (= res!1028943 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48558 a!2804) j!70) a!2804 mask!2512) lt!654795))))

(declare-fun res!1028944 () Bool)

(assert (=> start!128786 (=> (not res!1028944) (not e!842969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128786 (= res!1028944 (validMask!0 mask!2512))))

(assert (=> start!128786 e!842969))

(assert (=> start!128786 true))

(declare-fun array_inv!37586 (array!100642) Bool)

(assert (=> start!128786 (array_inv!37586 a!2804)))

(declare-fun b!1509044 () Bool)

(declare-fun res!1028942 () Bool)

(assert (=> b!1509044 (=> (not res!1028942) (not e!842969))))

(declare-datatypes ((List!35041 0))(
  ( (Nil!35038) (Cons!35037 (h!36449 (_ BitVec 64)) (t!49735 List!35041)) )
))
(declare-fun arrayNoDuplicates!0 (array!100642 (_ BitVec 32) List!35041) Bool)

(assert (=> b!1509044 (= res!1028942 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35038))))

(declare-fun b!1509045 () Bool)

(assert (=> b!1509045 (= e!842970 false)))

(declare-fun lt!654796 () SeekEntryResult!12729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509045 (= lt!654796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48558 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48558 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100643 (store (arr!48558 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49108 a!2804)) mask!2512))))

(declare-fun b!1509046 () Bool)

(declare-fun res!1028949 () Bool)

(assert (=> b!1509046 (=> (not res!1028949) (not e!842969))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509046 (= res!1028949 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49108 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49108 a!2804))))))

(declare-fun b!1509047 () Bool)

(assert (=> b!1509047 (= e!842969 e!842970)))

(declare-fun res!1028946 () Bool)

(assert (=> b!1509047 (=> (not res!1028946) (not e!842970))))

(assert (=> b!1509047 (= res!1028946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48558 a!2804) j!70) mask!2512) (select (arr!48558 a!2804) j!70) a!2804 mask!2512) lt!654795))))

(assert (=> b!1509047 (= lt!654795 (Intermediate!12729 false resIndex!21 resX!21))))

(assert (= (and start!128786 res!1028944) b!1509042))

(assert (= (and b!1509042 res!1028950) b!1509039))

(assert (= (and b!1509039 res!1028945) b!1509040))

(assert (= (and b!1509040 res!1028947) b!1509041))

(assert (= (and b!1509041 res!1028948) b!1509044))

(assert (= (and b!1509044 res!1028942) b!1509046))

(assert (= (and b!1509046 res!1028949) b!1509047))

(assert (= (and b!1509047 res!1028946) b!1509043))

(assert (= (and b!1509043 res!1028943) b!1509045))

(declare-fun m!1391473 () Bool)

(assert (=> b!1509047 m!1391473))

(assert (=> b!1509047 m!1391473))

(declare-fun m!1391475 () Bool)

(assert (=> b!1509047 m!1391475))

(assert (=> b!1509047 m!1391475))

(assert (=> b!1509047 m!1391473))

(declare-fun m!1391477 () Bool)

(assert (=> b!1509047 m!1391477))

(assert (=> b!1509040 m!1391473))

(assert (=> b!1509040 m!1391473))

(declare-fun m!1391479 () Bool)

(assert (=> b!1509040 m!1391479))

(declare-fun m!1391481 () Bool)

(assert (=> b!1509041 m!1391481))

(declare-fun m!1391483 () Bool)

(assert (=> b!1509044 m!1391483))

(declare-fun m!1391485 () Bool)

(assert (=> b!1509045 m!1391485))

(declare-fun m!1391487 () Bool)

(assert (=> b!1509045 m!1391487))

(assert (=> b!1509045 m!1391487))

(declare-fun m!1391489 () Bool)

(assert (=> b!1509045 m!1391489))

(assert (=> b!1509045 m!1391489))

(assert (=> b!1509045 m!1391487))

(declare-fun m!1391491 () Bool)

(assert (=> b!1509045 m!1391491))

(declare-fun m!1391493 () Bool)

(assert (=> start!128786 m!1391493))

(declare-fun m!1391495 () Bool)

(assert (=> start!128786 m!1391495))

(assert (=> b!1509043 m!1391473))

(assert (=> b!1509043 m!1391473))

(declare-fun m!1391497 () Bool)

(assert (=> b!1509043 m!1391497))

(declare-fun m!1391499 () Bool)

(assert (=> b!1509039 m!1391499))

(assert (=> b!1509039 m!1391499))

(declare-fun m!1391501 () Bool)

(assert (=> b!1509039 m!1391501))

(check-sat (not b!1509045) (not b!1509040) (not b!1509043) (not b!1509041) (not start!128786) (not b!1509047) (not b!1509044) (not b!1509039))
(check-sat)
