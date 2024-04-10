; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123646 () Bool)

(assert start!123646)

(declare-fun b!1433468 () Bool)

(declare-fun res!967144 () Bool)

(declare-fun e!809100 () Bool)

(assert (=> b!1433468 (=> (not res!967144) (not e!809100))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97561 0))(
  ( (array!97562 (arr!47086 (Array (_ BitVec 32) (_ BitVec 64))) (size!47636 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97561)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433468 (= res!967144 (and (= (size!47636 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47636 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47636 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433469 () Bool)

(declare-fun e!809098 () Bool)

(assert (=> b!1433469 (= e!809100 e!809098)))

(declare-fun res!967134 () Bool)

(assert (=> b!1433469 (=> (not res!967134) (not e!809098))))

(declare-datatypes ((SeekEntryResult!11365 0))(
  ( (MissingZero!11365 (index!47852 (_ BitVec 32))) (Found!11365 (index!47853 (_ BitVec 32))) (Intermediate!11365 (undefined!12177 Bool) (index!47854 (_ BitVec 32)) (x!129496 (_ BitVec 32))) (Undefined!11365) (MissingVacant!11365 (index!47855 (_ BitVec 32))) )
))
(declare-fun lt!631046 () SeekEntryResult!11365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97561 (_ BitVec 32)) SeekEntryResult!11365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433469 (= res!967134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47086 a!2831) j!81) mask!2608) (select (arr!47086 a!2831) j!81) a!2831 mask!2608) lt!631046))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433469 (= lt!631046 (Intermediate!11365 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433471 () Bool)

(declare-fun e!809099 () Bool)

(assert (=> b!1433471 (= e!809099 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!631045 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433471 (= lt!631045 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433472 () Bool)

(declare-fun e!809101 () Bool)

(assert (=> b!1433472 (= e!809101 (not e!809099))))

(declare-fun res!967133 () Bool)

(assert (=> b!1433472 (=> res!967133 e!809099)))

(assert (=> b!1433472 (= res!967133 (or (= (select (arr!47086 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47086 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47086 a!2831) index!585) (select (arr!47086 a!2831) j!81)) (= (select (store (arr!47086 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809097 () Bool)

(assert (=> b!1433472 e!809097))

(declare-fun res!967141 () Bool)

(assert (=> b!1433472 (=> (not res!967141) (not e!809097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97561 (_ BitVec 32)) Bool)

(assert (=> b!1433472 (= res!967141 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48476 0))(
  ( (Unit!48477) )
))
(declare-fun lt!631047 () Unit!48476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48476)

(assert (=> b!1433472 (= lt!631047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433473 () Bool)

(declare-fun res!967132 () Bool)

(assert (=> b!1433473 (=> (not res!967132) (not e!809100))))

(assert (=> b!1433473 (= res!967132 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47636 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47636 a!2831))))))

(declare-fun b!1433474 () Bool)

(declare-fun res!967138 () Bool)

(assert (=> b!1433474 (=> (not res!967138) (not e!809100))))

(assert (=> b!1433474 (= res!967138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433475 () Bool)

(declare-fun res!967142 () Bool)

(assert (=> b!1433475 (=> (not res!967142) (not e!809100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433475 (= res!967142 (validKeyInArray!0 (select (arr!47086 a!2831) i!982)))))

(declare-fun b!1433476 () Bool)

(assert (=> b!1433476 (= e!809098 e!809101)))

(declare-fun res!967140 () Bool)

(assert (=> b!1433476 (=> (not res!967140) (not e!809101))))

(declare-fun lt!631042 () (_ BitVec 64))

(declare-fun lt!631044 () array!97561)

(declare-fun lt!631043 () SeekEntryResult!11365)

(assert (=> b!1433476 (= res!967140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631042 mask!2608) lt!631042 lt!631044 mask!2608) lt!631043))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1433476 (= lt!631043 (Intermediate!11365 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433476 (= lt!631042 (select (store (arr!47086 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433476 (= lt!631044 (array!97562 (store (arr!47086 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47636 a!2831)))))

(declare-fun b!1433477 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97561 (_ BitVec 32)) SeekEntryResult!11365)

(assert (=> b!1433477 (= e!809097 (= (seekEntryOrOpen!0 (select (arr!47086 a!2831) j!81) a!2831 mask!2608) (Found!11365 j!81)))))

(declare-fun b!1433478 () Bool)

(declare-fun res!967137 () Bool)

(assert (=> b!1433478 (=> (not res!967137) (not e!809100))))

(assert (=> b!1433478 (= res!967137 (validKeyInArray!0 (select (arr!47086 a!2831) j!81)))))

(declare-fun b!1433479 () Bool)

(declare-fun res!967143 () Bool)

(assert (=> b!1433479 (=> (not res!967143) (not e!809101))))

(assert (=> b!1433479 (= res!967143 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47086 a!2831) j!81) a!2831 mask!2608) lt!631046))))

(declare-fun b!1433470 () Bool)

(declare-fun res!967139 () Bool)

(assert (=> b!1433470 (=> (not res!967139) (not e!809100))))

(declare-datatypes ((List!33596 0))(
  ( (Nil!33593) (Cons!33592 (h!34918 (_ BitVec 64)) (t!48290 List!33596)) )
))
(declare-fun arrayNoDuplicates!0 (array!97561 (_ BitVec 32) List!33596) Bool)

(assert (=> b!1433470 (= res!967139 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33593))))

(declare-fun res!967135 () Bool)

(assert (=> start!123646 (=> (not res!967135) (not e!809100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123646 (= res!967135 (validMask!0 mask!2608))))

(assert (=> start!123646 e!809100))

(assert (=> start!123646 true))

(declare-fun array_inv!36114 (array!97561) Bool)

(assert (=> start!123646 (array_inv!36114 a!2831)))

(declare-fun b!1433480 () Bool)

(declare-fun res!967131 () Bool)

(assert (=> b!1433480 (=> (not res!967131) (not e!809101))))

(assert (=> b!1433480 (= res!967131 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433481 () Bool)

(declare-fun res!967136 () Bool)

(assert (=> b!1433481 (=> (not res!967136) (not e!809101))))

(assert (=> b!1433481 (= res!967136 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631042 lt!631044 mask!2608) lt!631043))))

(assert (= (and start!123646 res!967135) b!1433468))

(assert (= (and b!1433468 res!967144) b!1433475))

(assert (= (and b!1433475 res!967142) b!1433478))

(assert (= (and b!1433478 res!967137) b!1433474))

(assert (= (and b!1433474 res!967138) b!1433470))

(assert (= (and b!1433470 res!967139) b!1433473))

(assert (= (and b!1433473 res!967132) b!1433469))

(assert (= (and b!1433469 res!967134) b!1433476))

(assert (= (and b!1433476 res!967140) b!1433479))

(assert (= (and b!1433479 res!967143) b!1433481))

(assert (= (and b!1433481 res!967136) b!1433480))

(assert (= (and b!1433480 res!967131) b!1433472))

(assert (= (and b!1433472 res!967141) b!1433477))

(assert (= (and b!1433472 (not res!967133)) b!1433471))

(declare-fun m!1323187 () Bool)

(assert (=> b!1433478 m!1323187))

(assert (=> b!1433478 m!1323187))

(declare-fun m!1323189 () Bool)

(assert (=> b!1433478 m!1323189))

(declare-fun m!1323191 () Bool)

(assert (=> start!123646 m!1323191))

(declare-fun m!1323193 () Bool)

(assert (=> start!123646 m!1323193))

(assert (=> b!1433477 m!1323187))

(assert (=> b!1433477 m!1323187))

(declare-fun m!1323195 () Bool)

(assert (=> b!1433477 m!1323195))

(assert (=> b!1433479 m!1323187))

(assert (=> b!1433479 m!1323187))

(declare-fun m!1323197 () Bool)

(assert (=> b!1433479 m!1323197))

(declare-fun m!1323199 () Bool)

(assert (=> b!1433470 m!1323199))

(declare-fun m!1323201 () Bool)

(assert (=> b!1433471 m!1323201))

(declare-fun m!1323203 () Bool)

(assert (=> b!1433476 m!1323203))

(assert (=> b!1433476 m!1323203))

(declare-fun m!1323205 () Bool)

(assert (=> b!1433476 m!1323205))

(declare-fun m!1323207 () Bool)

(assert (=> b!1433476 m!1323207))

(declare-fun m!1323209 () Bool)

(assert (=> b!1433476 m!1323209))

(declare-fun m!1323211 () Bool)

(assert (=> b!1433475 m!1323211))

(assert (=> b!1433475 m!1323211))

(declare-fun m!1323213 () Bool)

(assert (=> b!1433475 m!1323213))

(declare-fun m!1323215 () Bool)

(assert (=> b!1433481 m!1323215))

(assert (=> b!1433472 m!1323207))

(declare-fun m!1323217 () Bool)

(assert (=> b!1433472 m!1323217))

(declare-fun m!1323219 () Bool)

(assert (=> b!1433472 m!1323219))

(declare-fun m!1323221 () Bool)

(assert (=> b!1433472 m!1323221))

(assert (=> b!1433472 m!1323187))

(declare-fun m!1323223 () Bool)

(assert (=> b!1433472 m!1323223))

(assert (=> b!1433469 m!1323187))

(assert (=> b!1433469 m!1323187))

(declare-fun m!1323225 () Bool)

(assert (=> b!1433469 m!1323225))

(assert (=> b!1433469 m!1323225))

(assert (=> b!1433469 m!1323187))

(declare-fun m!1323227 () Bool)

(assert (=> b!1433469 m!1323227))

(declare-fun m!1323229 () Bool)

(assert (=> b!1433474 m!1323229))

(push 1)

