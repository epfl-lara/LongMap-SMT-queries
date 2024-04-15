; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122768 () Bool)

(assert start!122768)

(declare-fun b!1423086 () Bool)

(declare-fun res!958582 () Bool)

(declare-fun e!804424 () Bool)

(assert (=> b!1423086 (=> (not res!958582) (not e!804424))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97086 0))(
  ( (array!97087 (arr!46861 (Array (_ BitVec 32) (_ BitVec 64))) (size!47413 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97086)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423086 (= res!958582 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47413 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47413 a!2831))))))

(declare-fun res!958584 () Bool)

(assert (=> start!122768 (=> (not res!958584) (not e!804424))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122768 (= res!958584 (validMask!0 mask!2608))))

(assert (=> start!122768 e!804424))

(assert (=> start!122768 true))

(declare-fun array_inv!36094 (array!97086) Bool)

(assert (=> start!122768 (array_inv!36094 a!2831)))

(declare-fun b!1423087 () Bool)

(declare-fun e!804422 () Bool)

(assert (=> b!1423087 (= e!804424 e!804422)))

(declare-fun res!958581 () Bool)

(assert (=> b!1423087 (=> (not res!958581) (not e!804422))))

(declare-datatypes ((SeekEntryResult!11173 0))(
  ( (MissingZero!11173 (index!47084 (_ BitVec 32))) (Found!11173 (index!47085 (_ BitVec 32))) (Intermediate!11173 (undefined!11985 Bool) (index!47086 (_ BitVec 32)) (x!128716 (_ BitVec 32))) (Undefined!11173) (MissingVacant!11173 (index!47087 (_ BitVec 32))) )
))
(declare-fun lt!626808 () SeekEntryResult!11173)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97086 (_ BitVec 32)) SeekEntryResult!11173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423087 (= res!958581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46861 a!2831) j!81) mask!2608) (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626808))))

(assert (=> b!1423087 (= lt!626808 (Intermediate!11173 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423088 () Bool)

(declare-fun res!958574 () Bool)

(assert (=> b!1423088 (=> (not res!958574) (not e!804424))))

(declare-datatypes ((List!33449 0))(
  ( (Nil!33446) (Cons!33445 (h!34747 (_ BitVec 64)) (t!48135 List!33449)) )
))
(declare-fun arrayNoDuplicates!0 (array!97086 (_ BitVec 32) List!33449) Bool)

(assert (=> b!1423088 (= res!958574 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33446))))

(declare-fun b!1423089 () Bool)

(declare-fun res!958578 () Bool)

(assert (=> b!1423089 (=> (not res!958578) (not e!804424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423089 (= res!958578 (validKeyInArray!0 (select (arr!46861 a!2831) j!81)))))

(declare-fun b!1423090 () Bool)

(declare-fun e!804425 () Bool)

(declare-fun e!804423 () Bool)

(assert (=> b!1423090 (= e!804425 (not e!804423))))

(declare-fun res!958577 () Bool)

(assert (=> b!1423090 (=> res!958577 e!804423)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423090 (= res!958577 (or (= (select (arr!46861 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46861 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46861 a!2831) index!585) (select (arr!46861 a!2831) j!81)) (= (select (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804421 () Bool)

(assert (=> b!1423090 e!804421))

(declare-fun res!958580 () Bool)

(assert (=> b!1423090 (=> (not res!958580) (not e!804421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97086 (_ BitVec 32)) Bool)

(assert (=> b!1423090 (= res!958580 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48021 0))(
  ( (Unit!48022) )
))
(declare-fun lt!626805 () Unit!48021)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48021)

(assert (=> b!1423090 (= lt!626805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423091 () Bool)

(declare-fun e!804419 () Bool)

(assert (=> b!1423091 (= e!804423 e!804419)))

(declare-fun res!958575 () Bool)

(assert (=> b!1423091 (=> res!958575 e!804419)))

(declare-fun lt!626806 () (_ BitVec 32))

(assert (=> b!1423091 (= res!958575 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626806 #b00000000000000000000000000000000) (bvsge lt!626806 (size!47413 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423091 (= lt!626806 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423092 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97086 (_ BitVec 32)) SeekEntryResult!11173)

(assert (=> b!1423092 (= e!804421 (= (seekEntryOrOpen!0 (select (arr!46861 a!2831) j!81) a!2831 mask!2608) (Found!11173 j!81)))))

(declare-fun b!1423093 () Bool)

(declare-fun res!958576 () Bool)

(assert (=> b!1423093 (=> (not res!958576) (not e!804424))))

(assert (=> b!1423093 (= res!958576 (and (= (size!47413 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47413 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47413 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423094 () Bool)

(assert (=> b!1423094 (= e!804422 e!804425)))

(declare-fun res!958570 () Bool)

(assert (=> b!1423094 (=> (not res!958570) (not e!804425))))

(declare-fun lt!626810 () array!97086)

(declare-fun lt!626807 () SeekEntryResult!11173)

(declare-fun lt!626809 () (_ BitVec 64))

(assert (=> b!1423094 (= res!958570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626809 mask!2608) lt!626809 lt!626810 mask!2608) lt!626807))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423094 (= lt!626807 (Intermediate!11173 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423094 (= lt!626809 (select (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423094 (= lt!626810 (array!97087 (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47413 a!2831)))))

(declare-fun b!1423095 () Bool)

(declare-fun res!958579 () Bool)

(assert (=> b!1423095 (=> res!958579 e!804419)))

(assert (=> b!1423095 (= res!958579 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626806 (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626808)))))

(declare-fun b!1423096 () Bool)

(declare-fun res!958571 () Bool)

(assert (=> b!1423096 (=> (not res!958571) (not e!804425))))

(assert (=> b!1423096 (= res!958571 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626808))))

(declare-fun b!1423097 () Bool)

(declare-fun res!958572 () Bool)

(assert (=> b!1423097 (=> (not res!958572) (not e!804424))))

(assert (=> b!1423097 (= res!958572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423098 () Bool)

(declare-fun res!958583 () Bool)

(assert (=> b!1423098 (=> (not res!958583) (not e!804425))))

(assert (=> b!1423098 (= res!958583 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423099 () Bool)

(declare-fun res!958573 () Bool)

(assert (=> b!1423099 (=> (not res!958573) (not e!804425))))

(assert (=> b!1423099 (= res!958573 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626809 lt!626810 mask!2608) lt!626807))))

(declare-fun b!1423100 () Bool)

(declare-fun res!958585 () Bool)

(assert (=> b!1423100 (=> (not res!958585) (not e!804424))))

(assert (=> b!1423100 (= res!958585 (validKeyInArray!0 (select (arr!46861 a!2831) i!982)))))

(declare-fun b!1423101 () Bool)

(assert (=> b!1423101 (= e!804419 true)))

(declare-fun lt!626804 () SeekEntryResult!11173)

(assert (=> b!1423101 (= lt!626804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626806 lt!626809 lt!626810 mask!2608))))

(assert (= (and start!122768 res!958584) b!1423093))

(assert (= (and b!1423093 res!958576) b!1423100))

(assert (= (and b!1423100 res!958585) b!1423089))

(assert (= (and b!1423089 res!958578) b!1423097))

(assert (= (and b!1423097 res!958572) b!1423088))

(assert (= (and b!1423088 res!958574) b!1423086))

(assert (= (and b!1423086 res!958582) b!1423087))

(assert (= (and b!1423087 res!958581) b!1423094))

(assert (= (and b!1423094 res!958570) b!1423096))

(assert (= (and b!1423096 res!958571) b!1423099))

(assert (= (and b!1423099 res!958573) b!1423098))

(assert (= (and b!1423098 res!958583) b!1423090))

(assert (= (and b!1423090 res!958580) b!1423092))

(assert (= (and b!1423090 (not res!958577)) b!1423091))

(assert (= (and b!1423091 (not res!958575)) b!1423095))

(assert (= (and b!1423095 (not res!958579)) b!1423101))

(declare-fun m!1313163 () Bool)

(assert (=> b!1423087 m!1313163))

(assert (=> b!1423087 m!1313163))

(declare-fun m!1313165 () Bool)

(assert (=> b!1423087 m!1313165))

(assert (=> b!1423087 m!1313165))

(assert (=> b!1423087 m!1313163))

(declare-fun m!1313167 () Bool)

(assert (=> b!1423087 m!1313167))

(assert (=> b!1423095 m!1313163))

(assert (=> b!1423095 m!1313163))

(declare-fun m!1313169 () Bool)

(assert (=> b!1423095 m!1313169))

(assert (=> b!1423092 m!1313163))

(assert (=> b!1423092 m!1313163))

(declare-fun m!1313171 () Bool)

(assert (=> b!1423092 m!1313171))

(declare-fun m!1313173 () Bool)

(assert (=> b!1423094 m!1313173))

(assert (=> b!1423094 m!1313173))

(declare-fun m!1313175 () Bool)

(assert (=> b!1423094 m!1313175))

(declare-fun m!1313177 () Bool)

(assert (=> b!1423094 m!1313177))

(declare-fun m!1313179 () Bool)

(assert (=> b!1423094 m!1313179))

(assert (=> b!1423089 m!1313163))

(assert (=> b!1423089 m!1313163))

(declare-fun m!1313181 () Bool)

(assert (=> b!1423089 m!1313181))

(declare-fun m!1313183 () Bool)

(assert (=> b!1423097 m!1313183))

(declare-fun m!1313185 () Bool)

(assert (=> b!1423101 m!1313185))

(assert (=> b!1423090 m!1313177))

(declare-fun m!1313187 () Bool)

(assert (=> b!1423090 m!1313187))

(declare-fun m!1313189 () Bool)

(assert (=> b!1423090 m!1313189))

(declare-fun m!1313191 () Bool)

(assert (=> b!1423090 m!1313191))

(assert (=> b!1423090 m!1313163))

(declare-fun m!1313193 () Bool)

(assert (=> b!1423090 m!1313193))

(declare-fun m!1313195 () Bool)

(assert (=> b!1423088 m!1313195))

(declare-fun m!1313197 () Bool)

(assert (=> b!1423100 m!1313197))

(assert (=> b!1423100 m!1313197))

(declare-fun m!1313199 () Bool)

(assert (=> b!1423100 m!1313199))

(assert (=> b!1423096 m!1313163))

(assert (=> b!1423096 m!1313163))

(declare-fun m!1313201 () Bool)

(assert (=> b!1423096 m!1313201))

(declare-fun m!1313203 () Bool)

(assert (=> b!1423099 m!1313203))

(declare-fun m!1313205 () Bool)

(assert (=> b!1423091 m!1313205))

(declare-fun m!1313207 () Bool)

(assert (=> start!122768 m!1313207))

(declare-fun m!1313209 () Bool)

(assert (=> start!122768 m!1313209))

(check-sat (not b!1423097) (not b!1423091) (not b!1423087) (not b!1423095) (not b!1423101) (not b!1423088) (not b!1423089) (not b!1423094) (not b!1423096) (not b!1423100) (not b!1423099) (not b!1423090) (not start!122768) (not b!1423092))
(check-sat)
