; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122966 () Bool)

(assert start!122966)

(declare-fun b!1423464 () Bool)

(declare-fun res!958027 () Bool)

(declare-fun e!804885 () Bool)

(assert (=> b!1423464 (=> (not res!958027) (not e!804885))))

(declare-fun lt!627022 () (_ BitVec 64))

(declare-datatypes ((array!97202 0))(
  ( (array!97203 (arr!46915 (Array (_ BitVec 32) (_ BitVec 64))) (size!47466 (_ BitVec 32))) )
))
(declare-fun lt!627020 () array!97202)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11102 0))(
  ( (MissingZero!11102 (index!46800 (_ BitVec 32))) (Found!11102 (index!46801 (_ BitVec 32))) (Intermediate!11102 (undefined!11914 Bool) (index!46802 (_ BitVec 32)) (x!128609 (_ BitVec 32))) (Undefined!11102) (MissingVacant!11102 (index!46803 (_ BitVec 32))) )
))
(declare-fun lt!627026 () SeekEntryResult!11102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97202 (_ BitVec 32)) SeekEntryResult!11102)

(assert (=> b!1423464 (= res!958027 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627022 lt!627020 mask!2608) lt!627026))))

(declare-fun b!1423465 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97202)

(declare-fun e!804881 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97202 (_ BitVec 32)) SeekEntryResult!11102)

(assert (=> b!1423465 (= e!804881 (= (seekEntryOrOpen!0 (select (arr!46915 a!2831) j!81) a!2831 mask!2608) (Found!11102 j!81)))))

(declare-fun b!1423466 () Bool)

(declare-fun e!804887 () Bool)

(assert (=> b!1423466 (= e!804887 e!804885)))

(declare-fun res!958016 () Bool)

(assert (=> b!1423466 (=> (not res!958016) (not e!804885))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423466 (= res!958016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627022 mask!2608) lt!627022 lt!627020 mask!2608) lt!627026))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423466 (= lt!627026 (Intermediate!11102 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423466 (= lt!627022 (select (store (arr!46915 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423466 (= lt!627020 (array!97203 (store (arr!46915 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47466 a!2831)))))

(declare-fun res!958015 () Bool)

(declare-fun e!804882 () Bool)

(assert (=> start!122966 (=> (not res!958015) (not e!804882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122966 (= res!958015 (validMask!0 mask!2608))))

(assert (=> start!122966 e!804882))

(assert (=> start!122966 true))

(declare-fun array_inv!36196 (array!97202) Bool)

(assert (=> start!122966 (array_inv!36196 a!2831)))

(declare-fun b!1423467 () Bool)

(declare-fun res!958014 () Bool)

(assert (=> b!1423467 (=> (not res!958014) (not e!804882))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423467 (= res!958014 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47466 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47466 a!2831))))))

(declare-fun b!1423468 () Bool)

(declare-fun res!958019 () Bool)

(declare-fun e!804886 () Bool)

(assert (=> b!1423468 (=> res!958019 e!804886)))

(declare-fun lt!627023 () SeekEntryResult!11102)

(declare-fun lt!627021 () (_ BitVec 32))

(assert (=> b!1423468 (= res!958019 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627021 (select (arr!46915 a!2831) j!81) a!2831 mask!2608) lt!627023)))))

(declare-fun b!1423469 () Bool)

(declare-fun res!958022 () Bool)

(assert (=> b!1423469 (=> (not res!958022) (not e!804885))))

(assert (=> b!1423469 (= res!958022 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46915 a!2831) j!81) a!2831 mask!2608) lt!627023))))

(declare-fun b!1423470 () Bool)

(declare-fun res!958018 () Bool)

(assert (=> b!1423470 (=> (not res!958018) (not e!804882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423470 (= res!958018 (validKeyInArray!0 (select (arr!46915 a!2831) j!81)))))

(declare-fun b!1423471 () Bool)

(declare-fun res!958020 () Bool)

(assert (=> b!1423471 (=> (not res!958020) (not e!804885))))

(assert (=> b!1423471 (= res!958020 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423472 () Bool)

(declare-fun e!804883 () Bool)

(assert (=> b!1423472 (= e!804885 (not e!804883))))

(declare-fun res!958017 () Bool)

(assert (=> b!1423472 (=> res!958017 e!804883)))

(assert (=> b!1423472 (= res!958017 (or (= (select (arr!46915 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46915 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46915 a!2831) index!585) (select (arr!46915 a!2831) j!81)) (= (select (store (arr!46915 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423472 e!804881))

(declare-fun res!958024 () Bool)

(assert (=> b!1423472 (=> (not res!958024) (not e!804881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97202 (_ BitVec 32)) Bool)

(assert (=> b!1423472 (= res!958024 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48071 0))(
  ( (Unit!48072) )
))
(declare-fun lt!627025 () Unit!48071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48071)

(assert (=> b!1423472 (= lt!627025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423473 () Bool)

(declare-fun res!958013 () Bool)

(assert (=> b!1423473 (=> (not res!958013) (not e!804882))))

(assert (=> b!1423473 (= res!958013 (validKeyInArray!0 (select (arr!46915 a!2831) i!982)))))

(declare-fun b!1423474 () Bool)

(assert (=> b!1423474 (= e!804883 e!804886)))

(declare-fun res!958021 () Bool)

(assert (=> b!1423474 (=> res!958021 e!804886)))

(assert (=> b!1423474 (= res!958021 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627021 #b00000000000000000000000000000000) (bvsge lt!627021 (size!47466 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423474 (= lt!627021 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1423475 () Bool)

(declare-fun res!958025 () Bool)

(assert (=> b!1423475 (=> (not res!958025) (not e!804882))))

(assert (=> b!1423475 (= res!958025 (and (= (size!47466 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47466 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47466 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423476 () Bool)

(assert (=> b!1423476 (= e!804886 true)))

(declare-fun lt!627024 () SeekEntryResult!11102)

(assert (=> b!1423476 (= lt!627024 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627021 lt!627022 lt!627020 mask!2608))))

(declare-fun b!1423477 () Bool)

(declare-fun res!958023 () Bool)

(assert (=> b!1423477 (=> (not res!958023) (not e!804882))))

(assert (=> b!1423477 (= res!958023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423478 () Bool)

(assert (=> b!1423478 (= e!804882 e!804887)))

(declare-fun res!958026 () Bool)

(assert (=> b!1423478 (=> (not res!958026) (not e!804887))))

(assert (=> b!1423478 (= res!958026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46915 a!2831) j!81) mask!2608) (select (arr!46915 a!2831) j!81) a!2831 mask!2608) lt!627023))))

(assert (=> b!1423478 (= lt!627023 (Intermediate!11102 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423479 () Bool)

(declare-fun res!958012 () Bool)

(assert (=> b!1423479 (=> (not res!958012) (not e!804882))))

(declare-datatypes ((List!33412 0))(
  ( (Nil!33409) (Cons!33408 (h!34721 (_ BitVec 64)) (t!48098 List!33412)) )
))
(declare-fun arrayNoDuplicates!0 (array!97202 (_ BitVec 32) List!33412) Bool)

(assert (=> b!1423479 (= res!958012 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33409))))

(assert (= (and start!122966 res!958015) b!1423475))

(assert (= (and b!1423475 res!958025) b!1423473))

(assert (= (and b!1423473 res!958013) b!1423470))

(assert (= (and b!1423470 res!958018) b!1423477))

(assert (= (and b!1423477 res!958023) b!1423479))

(assert (= (and b!1423479 res!958012) b!1423467))

(assert (= (and b!1423467 res!958014) b!1423478))

(assert (= (and b!1423478 res!958026) b!1423466))

(assert (= (and b!1423466 res!958016) b!1423469))

(assert (= (and b!1423469 res!958022) b!1423464))

(assert (= (and b!1423464 res!958027) b!1423471))

(assert (= (and b!1423471 res!958020) b!1423472))

(assert (= (and b!1423472 res!958024) b!1423465))

(assert (= (and b!1423472 (not res!958017)) b!1423474))

(assert (= (and b!1423474 (not res!958021)) b!1423468))

(assert (= (and b!1423468 (not res!958019)) b!1423476))

(declare-fun m!1314129 () Bool)

(assert (=> b!1423468 m!1314129))

(assert (=> b!1423468 m!1314129))

(declare-fun m!1314131 () Bool)

(assert (=> b!1423468 m!1314131))

(declare-fun m!1314133 () Bool)

(assert (=> start!122966 m!1314133))

(declare-fun m!1314135 () Bool)

(assert (=> start!122966 m!1314135))

(declare-fun m!1314137 () Bool)

(assert (=> b!1423474 m!1314137))

(declare-fun m!1314139 () Bool)

(assert (=> b!1423477 m!1314139))

(assert (=> b!1423469 m!1314129))

(assert (=> b!1423469 m!1314129))

(declare-fun m!1314141 () Bool)

(assert (=> b!1423469 m!1314141))

(assert (=> b!1423470 m!1314129))

(assert (=> b!1423470 m!1314129))

(declare-fun m!1314143 () Bool)

(assert (=> b!1423470 m!1314143))

(declare-fun m!1314145 () Bool)

(assert (=> b!1423473 m!1314145))

(assert (=> b!1423473 m!1314145))

(declare-fun m!1314147 () Bool)

(assert (=> b!1423473 m!1314147))

(declare-fun m!1314149 () Bool)

(assert (=> b!1423466 m!1314149))

(assert (=> b!1423466 m!1314149))

(declare-fun m!1314151 () Bool)

(assert (=> b!1423466 m!1314151))

(declare-fun m!1314153 () Bool)

(assert (=> b!1423466 m!1314153))

(declare-fun m!1314155 () Bool)

(assert (=> b!1423466 m!1314155))

(declare-fun m!1314157 () Bool)

(assert (=> b!1423464 m!1314157))

(declare-fun m!1314159 () Bool)

(assert (=> b!1423479 m!1314159))

(assert (=> b!1423478 m!1314129))

(assert (=> b!1423478 m!1314129))

(declare-fun m!1314161 () Bool)

(assert (=> b!1423478 m!1314161))

(assert (=> b!1423478 m!1314161))

(assert (=> b!1423478 m!1314129))

(declare-fun m!1314163 () Bool)

(assert (=> b!1423478 m!1314163))

(assert (=> b!1423472 m!1314153))

(declare-fun m!1314165 () Bool)

(assert (=> b!1423472 m!1314165))

(declare-fun m!1314167 () Bool)

(assert (=> b!1423472 m!1314167))

(declare-fun m!1314169 () Bool)

(assert (=> b!1423472 m!1314169))

(assert (=> b!1423472 m!1314129))

(declare-fun m!1314171 () Bool)

(assert (=> b!1423472 m!1314171))

(assert (=> b!1423465 m!1314129))

(assert (=> b!1423465 m!1314129))

(declare-fun m!1314173 () Bool)

(assert (=> b!1423465 m!1314173))

(declare-fun m!1314175 () Bool)

(assert (=> b!1423476 m!1314175))

(check-sat (not b!1423472) (not b!1423476) (not start!122966) (not b!1423473) (not b!1423468) (not b!1423465) (not b!1423469) (not b!1423479) (not b!1423474) (not b!1423477) (not b!1423470) (not b!1423478) (not b!1423464) (not b!1423466))
(check-sat)
