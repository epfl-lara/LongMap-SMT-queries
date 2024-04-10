; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122790 () Bool)

(assert start!122790)

(declare-fun b!1423599 () Bool)

(declare-fun e!804647 () Bool)

(declare-fun e!804650 () Bool)

(assert (=> b!1423599 (= e!804647 e!804650)))

(declare-fun res!959038 () Bool)

(assert (=> b!1423599 (=> res!959038 e!804650)))

(declare-fun lt!627187 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97155 0))(
  ( (array!97156 (arr!46895 (Array (_ BitVec 32) (_ BitVec 64))) (size!47445 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97155)

(assert (=> b!1423599 (= res!959038 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627187 #b00000000000000000000000000000000) (bvsge lt!627187 (size!47445 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423599 (= lt!627187 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423600 () Bool)

(assert (=> b!1423600 (= e!804650 true)))

(declare-datatypes ((SeekEntryResult!11180 0))(
  ( (MissingZero!11180 (index!47112 (_ BitVec 32))) (Found!11180 (index!47113 (_ BitVec 32))) (Intermediate!11180 (undefined!11992 Bool) (index!47114 (_ BitVec 32)) (x!128750 (_ BitVec 32))) (Undefined!11180) (MissingVacant!11180 (index!47115 (_ BitVec 32))) )
))
(declare-fun lt!627189 () SeekEntryResult!11180)

(declare-fun lt!627185 () (_ BitVec 64))

(declare-fun lt!627183 () array!97155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97155 (_ BitVec 32)) SeekEntryResult!11180)

(assert (=> b!1423600 (= lt!627189 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627187 lt!627185 lt!627183 mask!2608))))

(declare-fun b!1423601 () Bool)

(declare-fun res!959040 () Bool)

(declare-fun e!804648 () Bool)

(assert (=> b!1423601 (=> (not res!959040) (not e!804648))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423601 (= res!959040 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47445 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47445 a!2831))))))

(declare-fun b!1423602 () Bool)

(declare-fun res!959041 () Bool)

(assert (=> b!1423602 (=> (not res!959041) (not e!804648))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423602 (= res!959041 (and (= (size!47445 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47445 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47445 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423604 () Bool)

(declare-fun e!804652 () Bool)

(assert (=> b!1423604 (= e!804652 (not e!804647))))

(declare-fun res!959047 () Bool)

(assert (=> b!1423604 (=> res!959047 e!804647)))

(assert (=> b!1423604 (= res!959047 (or (= (select (arr!46895 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46895 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46895 a!2831) index!585) (select (arr!46895 a!2831) j!81)) (= (select (store (arr!46895 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804651 () Bool)

(assert (=> b!1423604 e!804651))

(declare-fun res!959034 () Bool)

(assert (=> b!1423604 (=> (not res!959034) (not e!804651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97155 (_ BitVec 32)) Bool)

(assert (=> b!1423604 (= res!959034 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48196 0))(
  ( (Unit!48197) )
))
(declare-fun lt!627186 () Unit!48196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48196)

(assert (=> b!1423604 (= lt!627186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423605 () Bool)

(declare-fun res!959045 () Bool)

(assert (=> b!1423605 (=> (not res!959045) (not e!804648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423605 (= res!959045 (validKeyInArray!0 (select (arr!46895 a!2831) j!81)))))

(declare-fun b!1423606 () Bool)

(declare-fun res!959032 () Bool)

(assert (=> b!1423606 (=> (not res!959032) (not e!804648))))

(declare-datatypes ((List!33405 0))(
  ( (Nil!33402) (Cons!33401 (h!34703 (_ BitVec 64)) (t!48099 List!33405)) )
))
(declare-fun arrayNoDuplicates!0 (array!97155 (_ BitVec 32) List!33405) Bool)

(assert (=> b!1423606 (= res!959032 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33402))))

(declare-fun b!1423607 () Bool)

(declare-fun e!804649 () Bool)

(assert (=> b!1423607 (= e!804649 e!804652)))

(declare-fun res!959043 () Bool)

(assert (=> b!1423607 (=> (not res!959043) (not e!804652))))

(declare-fun lt!627188 () SeekEntryResult!11180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423607 (= res!959043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627185 mask!2608) lt!627185 lt!627183 mask!2608) lt!627188))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423607 (= lt!627188 (Intermediate!11180 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423607 (= lt!627185 (select (store (arr!46895 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423607 (= lt!627183 (array!97156 (store (arr!46895 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47445 a!2831)))))

(declare-fun b!1423608 () Bool)

(declare-fun res!959046 () Bool)

(assert (=> b!1423608 (=> (not res!959046) (not e!804648))))

(assert (=> b!1423608 (= res!959046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423609 () Bool)

(assert (=> b!1423609 (= e!804648 e!804649)))

(declare-fun res!959044 () Bool)

(assert (=> b!1423609 (=> (not res!959044) (not e!804649))))

(declare-fun lt!627184 () SeekEntryResult!11180)

(assert (=> b!1423609 (= res!959044 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46895 a!2831) j!81) mask!2608) (select (arr!46895 a!2831) j!81) a!2831 mask!2608) lt!627184))))

(assert (=> b!1423609 (= lt!627184 (Intermediate!11180 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423610 () Bool)

(declare-fun res!959036 () Bool)

(assert (=> b!1423610 (=> (not res!959036) (not e!804652))))

(assert (=> b!1423610 (= res!959036 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46895 a!2831) j!81) a!2831 mask!2608) lt!627184))))

(declare-fun b!1423611 () Bool)

(declare-fun res!959042 () Bool)

(assert (=> b!1423611 (=> (not res!959042) (not e!804648))))

(assert (=> b!1423611 (= res!959042 (validKeyInArray!0 (select (arr!46895 a!2831) i!982)))))

(declare-fun b!1423612 () Bool)

(declare-fun res!959033 () Bool)

(assert (=> b!1423612 (=> (not res!959033) (not e!804652))))

(assert (=> b!1423612 (= res!959033 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627185 lt!627183 mask!2608) lt!627188))))

(declare-fun b!1423603 () Bool)

(declare-fun res!959035 () Bool)

(assert (=> b!1423603 (=> res!959035 e!804650)))

(assert (=> b!1423603 (= res!959035 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627187 (select (arr!46895 a!2831) j!81) a!2831 mask!2608) lt!627184)))))

(declare-fun res!959039 () Bool)

(assert (=> start!122790 (=> (not res!959039) (not e!804648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122790 (= res!959039 (validMask!0 mask!2608))))

(assert (=> start!122790 e!804648))

(assert (=> start!122790 true))

(declare-fun array_inv!35923 (array!97155) Bool)

(assert (=> start!122790 (array_inv!35923 a!2831)))

(declare-fun b!1423613 () Bool)

(declare-fun res!959037 () Bool)

(assert (=> b!1423613 (=> (not res!959037) (not e!804652))))

(assert (=> b!1423613 (= res!959037 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423614 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97155 (_ BitVec 32)) SeekEntryResult!11180)

(assert (=> b!1423614 (= e!804651 (= (seekEntryOrOpen!0 (select (arr!46895 a!2831) j!81) a!2831 mask!2608) (Found!11180 j!81)))))

(assert (= (and start!122790 res!959039) b!1423602))

(assert (= (and b!1423602 res!959041) b!1423611))

(assert (= (and b!1423611 res!959042) b!1423605))

(assert (= (and b!1423605 res!959045) b!1423608))

(assert (= (and b!1423608 res!959046) b!1423606))

(assert (= (and b!1423606 res!959032) b!1423601))

(assert (= (and b!1423601 res!959040) b!1423609))

(assert (= (and b!1423609 res!959044) b!1423607))

(assert (= (and b!1423607 res!959043) b!1423610))

(assert (= (and b!1423610 res!959036) b!1423612))

(assert (= (and b!1423612 res!959033) b!1423613))

(assert (= (and b!1423613 res!959037) b!1423604))

(assert (= (and b!1423604 res!959034) b!1423614))

(assert (= (and b!1423604 (not res!959047)) b!1423599))

(assert (= (and b!1423599 (not res!959038)) b!1423603))

(assert (= (and b!1423603 (not res!959035)) b!1423600))

(declare-fun m!1314147 () Bool)

(assert (=> b!1423609 m!1314147))

(assert (=> b!1423609 m!1314147))

(declare-fun m!1314149 () Bool)

(assert (=> b!1423609 m!1314149))

(assert (=> b!1423609 m!1314149))

(assert (=> b!1423609 m!1314147))

(declare-fun m!1314151 () Bool)

(assert (=> b!1423609 m!1314151))

(assert (=> b!1423603 m!1314147))

(assert (=> b!1423603 m!1314147))

(declare-fun m!1314153 () Bool)

(assert (=> b!1423603 m!1314153))

(assert (=> b!1423610 m!1314147))

(assert (=> b!1423610 m!1314147))

(declare-fun m!1314155 () Bool)

(assert (=> b!1423610 m!1314155))

(declare-fun m!1314157 () Bool)

(assert (=> b!1423604 m!1314157))

(declare-fun m!1314159 () Bool)

(assert (=> b!1423604 m!1314159))

(declare-fun m!1314161 () Bool)

(assert (=> b!1423604 m!1314161))

(declare-fun m!1314163 () Bool)

(assert (=> b!1423604 m!1314163))

(assert (=> b!1423604 m!1314147))

(declare-fun m!1314165 () Bool)

(assert (=> b!1423604 m!1314165))

(declare-fun m!1314167 () Bool)

(assert (=> b!1423612 m!1314167))

(declare-fun m!1314169 () Bool)

(assert (=> b!1423607 m!1314169))

(assert (=> b!1423607 m!1314169))

(declare-fun m!1314171 () Bool)

(assert (=> b!1423607 m!1314171))

(assert (=> b!1423607 m!1314157))

(declare-fun m!1314173 () Bool)

(assert (=> b!1423607 m!1314173))

(declare-fun m!1314175 () Bool)

(assert (=> b!1423599 m!1314175))

(assert (=> b!1423614 m!1314147))

(assert (=> b!1423614 m!1314147))

(declare-fun m!1314177 () Bool)

(assert (=> b!1423614 m!1314177))

(declare-fun m!1314179 () Bool)

(assert (=> b!1423608 m!1314179))

(declare-fun m!1314181 () Bool)

(assert (=> b!1423600 m!1314181))

(declare-fun m!1314183 () Bool)

(assert (=> b!1423606 m!1314183))

(assert (=> b!1423605 m!1314147))

(assert (=> b!1423605 m!1314147))

(declare-fun m!1314185 () Bool)

(assert (=> b!1423605 m!1314185))

(declare-fun m!1314187 () Bool)

(assert (=> start!122790 m!1314187))

(declare-fun m!1314189 () Bool)

(assert (=> start!122790 m!1314189))

(declare-fun m!1314191 () Bool)

(assert (=> b!1423611 m!1314191))

(assert (=> b!1423611 m!1314191))

(declare-fun m!1314193 () Bool)

(assert (=> b!1423611 m!1314193))

(push 1)

