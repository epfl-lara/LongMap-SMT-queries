; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122972 () Bool)

(assert start!122972)

(declare-fun b!1423608 () Bool)

(declare-fun res!958160 () Bool)

(declare-fun e!804945 () Bool)

(assert (=> b!1423608 (=> (not res!958160) (not e!804945))))

(declare-datatypes ((array!97208 0))(
  ( (array!97209 (arr!46918 (Array (_ BitVec 32) (_ BitVec 64))) (size!47469 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97208)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423608 (= res!958160 (validKeyInArray!0 (select (arr!46918 a!2831) j!81)))))

(declare-fun b!1423609 () Bool)

(declare-fun e!804948 () Bool)

(declare-fun e!804946 () Bool)

(assert (=> b!1423609 (= e!804948 (not e!804946))))

(declare-fun res!958169 () Bool)

(assert (=> b!1423609 (=> res!958169 e!804946)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423609 (= res!958169 (or (= (select (arr!46918 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46918 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46918 a!2831) index!585) (select (arr!46918 a!2831) j!81)) (= (select (store (arr!46918 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804944 () Bool)

(assert (=> b!1423609 e!804944))

(declare-fun res!958163 () Bool)

(assert (=> b!1423609 (=> (not res!958163) (not e!804944))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97208 (_ BitVec 32)) Bool)

(assert (=> b!1423609 (= res!958163 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48077 0))(
  ( (Unit!48078) )
))
(declare-fun lt!627083 () Unit!48077)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48077)

(assert (=> b!1423609 (= lt!627083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423610 () Bool)

(declare-fun res!958162 () Bool)

(assert (=> b!1423610 (=> (not res!958162) (not e!804945))))

(declare-datatypes ((List!33415 0))(
  ( (Nil!33412) (Cons!33411 (h!34724 (_ BitVec 64)) (t!48101 List!33415)) )
))
(declare-fun arrayNoDuplicates!0 (array!97208 (_ BitVec 32) List!33415) Bool)

(assert (=> b!1423610 (= res!958162 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33412))))

(declare-fun b!1423611 () Bool)

(declare-fun e!804949 () Bool)

(assert (=> b!1423611 (= e!804946 e!804949)))

(declare-fun res!958158 () Bool)

(assert (=> b!1423611 (=> res!958158 e!804949)))

(declare-fun lt!627089 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1423611 (= res!958158 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627089 #b00000000000000000000000000000000) (bvsge lt!627089 (size!47469 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423611 (= lt!627089 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1423612 () Bool)

(declare-fun res!958156 () Bool)

(assert (=> b!1423612 (=> (not res!958156) (not e!804945))))

(assert (=> b!1423612 (= res!958156 (and (= (size!47469 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47469 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47469 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423613 () Bool)

(declare-fun e!804950 () Bool)

(assert (=> b!1423613 (= e!804950 e!804948)))

(declare-fun res!958168 () Bool)

(assert (=> b!1423613 (=> (not res!958168) (not e!804948))))

(declare-fun lt!627087 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11105 0))(
  ( (MissingZero!11105 (index!46812 (_ BitVec 32))) (Found!11105 (index!46813 (_ BitVec 32))) (Intermediate!11105 (undefined!11917 Bool) (index!46814 (_ BitVec 32)) (x!128620 (_ BitVec 32))) (Undefined!11105) (MissingVacant!11105 (index!46815 (_ BitVec 32))) )
))
(declare-fun lt!627084 () SeekEntryResult!11105)

(declare-fun lt!627088 () array!97208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97208 (_ BitVec 32)) SeekEntryResult!11105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423613 (= res!958168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627087 mask!2608) lt!627087 lt!627088 mask!2608) lt!627084))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423613 (= lt!627084 (Intermediate!11105 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423613 (= lt!627087 (select (store (arr!46918 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423613 (= lt!627088 (array!97209 (store (arr!46918 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47469 a!2831)))))

(declare-fun b!1423614 () Bool)

(declare-fun res!958170 () Bool)

(assert (=> b!1423614 (=> (not res!958170) (not e!804945))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423614 (= res!958170 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47469 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47469 a!2831))))))

(declare-fun b!1423615 () Bool)

(declare-fun res!958161 () Bool)

(assert (=> b!1423615 (=> (not res!958161) (not e!804948))))

(declare-fun lt!627085 () SeekEntryResult!11105)

(assert (=> b!1423615 (= res!958161 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46918 a!2831) j!81) a!2831 mask!2608) lt!627085))))

(declare-fun b!1423616 () Bool)

(assert (=> b!1423616 (= e!804949 true)))

(declare-fun lt!627086 () SeekEntryResult!11105)

(assert (=> b!1423616 (= lt!627086 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627089 lt!627087 lt!627088 mask!2608))))

(declare-fun b!1423617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97208 (_ BitVec 32)) SeekEntryResult!11105)

(assert (=> b!1423617 (= e!804944 (= (seekEntryOrOpen!0 (select (arr!46918 a!2831) j!81) a!2831 mask!2608) (Found!11105 j!81)))))

(declare-fun b!1423619 () Bool)

(declare-fun res!958167 () Bool)

(assert (=> b!1423619 (=> (not res!958167) (not e!804945))))

(assert (=> b!1423619 (= res!958167 (validKeyInArray!0 (select (arr!46918 a!2831) i!982)))))

(declare-fun b!1423620 () Bool)

(assert (=> b!1423620 (= e!804945 e!804950)))

(declare-fun res!958166 () Bool)

(assert (=> b!1423620 (=> (not res!958166) (not e!804950))))

(assert (=> b!1423620 (= res!958166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46918 a!2831) j!81) mask!2608) (select (arr!46918 a!2831) j!81) a!2831 mask!2608) lt!627085))))

(assert (=> b!1423620 (= lt!627085 (Intermediate!11105 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423621 () Bool)

(declare-fun res!958165 () Bool)

(assert (=> b!1423621 (=> (not res!958165) (not e!804948))))

(assert (=> b!1423621 (= res!958165 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627087 lt!627088 mask!2608) lt!627084))))

(declare-fun res!958159 () Bool)

(assert (=> start!122972 (=> (not res!958159) (not e!804945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122972 (= res!958159 (validMask!0 mask!2608))))

(assert (=> start!122972 e!804945))

(assert (=> start!122972 true))

(declare-fun array_inv!36199 (array!97208) Bool)

(assert (=> start!122972 (array_inv!36199 a!2831)))

(declare-fun b!1423618 () Bool)

(declare-fun res!958164 () Bool)

(assert (=> b!1423618 (=> res!958164 e!804949)))

(assert (=> b!1423618 (= res!958164 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627089 (select (arr!46918 a!2831) j!81) a!2831 mask!2608) lt!627085)))))

(declare-fun b!1423622 () Bool)

(declare-fun res!958157 () Bool)

(assert (=> b!1423622 (=> (not res!958157) (not e!804945))))

(assert (=> b!1423622 (= res!958157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423623 () Bool)

(declare-fun res!958171 () Bool)

(assert (=> b!1423623 (=> (not res!958171) (not e!804948))))

(assert (=> b!1423623 (= res!958171 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122972 res!958159) b!1423612))

(assert (= (and b!1423612 res!958156) b!1423619))

(assert (= (and b!1423619 res!958167) b!1423608))

(assert (= (and b!1423608 res!958160) b!1423622))

(assert (= (and b!1423622 res!958157) b!1423610))

(assert (= (and b!1423610 res!958162) b!1423614))

(assert (= (and b!1423614 res!958170) b!1423620))

(assert (= (and b!1423620 res!958166) b!1423613))

(assert (= (and b!1423613 res!958168) b!1423615))

(assert (= (and b!1423615 res!958161) b!1423621))

(assert (= (and b!1423621 res!958165) b!1423623))

(assert (= (and b!1423623 res!958171) b!1423609))

(assert (= (and b!1423609 res!958163) b!1423617))

(assert (= (and b!1423609 (not res!958169)) b!1423611))

(assert (= (and b!1423611 (not res!958158)) b!1423618))

(assert (= (and b!1423618 (not res!958164)) b!1423616))

(declare-fun m!1314273 () Bool)

(assert (=> start!122972 m!1314273))

(declare-fun m!1314275 () Bool)

(assert (=> start!122972 m!1314275))

(declare-fun m!1314277 () Bool)

(assert (=> b!1423608 m!1314277))

(assert (=> b!1423608 m!1314277))

(declare-fun m!1314279 () Bool)

(assert (=> b!1423608 m!1314279))

(declare-fun m!1314281 () Bool)

(assert (=> b!1423619 m!1314281))

(assert (=> b!1423619 m!1314281))

(declare-fun m!1314283 () Bool)

(assert (=> b!1423619 m!1314283))

(assert (=> b!1423615 m!1314277))

(assert (=> b!1423615 m!1314277))

(declare-fun m!1314285 () Bool)

(assert (=> b!1423615 m!1314285))

(declare-fun m!1314287 () Bool)

(assert (=> b!1423621 m!1314287))

(declare-fun m!1314289 () Bool)

(assert (=> b!1423611 m!1314289))

(declare-fun m!1314291 () Bool)

(assert (=> b!1423613 m!1314291))

(assert (=> b!1423613 m!1314291))

(declare-fun m!1314293 () Bool)

(assert (=> b!1423613 m!1314293))

(declare-fun m!1314295 () Bool)

(assert (=> b!1423613 m!1314295))

(declare-fun m!1314297 () Bool)

(assert (=> b!1423613 m!1314297))

(assert (=> b!1423618 m!1314277))

(assert (=> b!1423618 m!1314277))

(declare-fun m!1314299 () Bool)

(assert (=> b!1423618 m!1314299))

(assert (=> b!1423609 m!1314295))

(declare-fun m!1314301 () Bool)

(assert (=> b!1423609 m!1314301))

(declare-fun m!1314303 () Bool)

(assert (=> b!1423609 m!1314303))

(declare-fun m!1314305 () Bool)

(assert (=> b!1423609 m!1314305))

(assert (=> b!1423609 m!1314277))

(declare-fun m!1314307 () Bool)

(assert (=> b!1423609 m!1314307))

(assert (=> b!1423620 m!1314277))

(assert (=> b!1423620 m!1314277))

(declare-fun m!1314309 () Bool)

(assert (=> b!1423620 m!1314309))

(assert (=> b!1423620 m!1314309))

(assert (=> b!1423620 m!1314277))

(declare-fun m!1314311 () Bool)

(assert (=> b!1423620 m!1314311))

(assert (=> b!1423617 m!1314277))

(assert (=> b!1423617 m!1314277))

(declare-fun m!1314313 () Bool)

(assert (=> b!1423617 m!1314313))

(declare-fun m!1314315 () Bool)

(assert (=> b!1423622 m!1314315))

(declare-fun m!1314317 () Bool)

(assert (=> b!1423610 m!1314317))

(declare-fun m!1314319 () Bool)

(assert (=> b!1423616 m!1314319))

(check-sat (not b!1423618) (not b!1423617) (not b!1423609) (not b!1423621) (not b!1423620) (not b!1423611) (not b!1423610) (not b!1423615) (not b!1423622) (not b!1423616) (not b!1423608) (not b!1423613) (not start!122972) (not b!1423619))
(check-sat)
