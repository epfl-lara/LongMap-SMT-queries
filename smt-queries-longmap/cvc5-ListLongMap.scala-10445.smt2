; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122832 () Bool)

(assert start!122832)

(declare-fun b!1424607 () Bool)

(declare-fun res!960047 () Bool)

(declare-fun e!805091 () Bool)

(assert (=> b!1424607 (=> (not res!960047) (not e!805091))))

(declare-fun lt!627626 () (_ BitVec 64))

(declare-datatypes ((array!97197 0))(
  ( (array!97198 (arr!46916 (Array (_ BitVec 32) (_ BitVec 64))) (size!47466 (_ BitVec 32))) )
))
(declare-fun lt!627625 () array!97197)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11201 0))(
  ( (MissingZero!11201 (index!47196 (_ BitVec 32))) (Found!11201 (index!47197 (_ BitVec 32))) (Intermediate!11201 (undefined!12013 Bool) (index!47198 (_ BitVec 32)) (x!128827 (_ BitVec 32))) (Undefined!11201) (MissingVacant!11201 (index!47199 (_ BitVec 32))) )
))
(declare-fun lt!627628 () SeekEntryResult!11201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97197 (_ BitVec 32)) SeekEntryResult!11201)

(assert (=> b!1424607 (= res!960047 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627626 lt!627625 mask!2608) lt!627628))))

(declare-fun b!1424608 () Bool)

(declare-fun res!960049 () Bool)

(declare-fun e!805094 () Bool)

(assert (=> b!1424608 (=> (not res!960049) (not e!805094))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun a!2831 () array!97197)

(assert (=> b!1424608 (= res!960049 (and (= (size!47466 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47466 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47466 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424609 () Bool)

(declare-fun res!960051 () Bool)

(assert (=> b!1424609 (=> (not res!960051) (not e!805094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97197 (_ BitVec 32)) Bool)

(assert (=> b!1424609 (= res!960051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424610 () Bool)

(declare-fun e!805090 () Bool)

(assert (=> b!1424610 (= e!805094 e!805090)))

(declare-fun res!960050 () Bool)

(assert (=> b!1424610 (=> (not res!960050) (not e!805090))))

(declare-fun lt!627629 () SeekEntryResult!11201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424610 (= res!960050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46916 a!2831) j!81) mask!2608) (select (arr!46916 a!2831) j!81) a!2831 mask!2608) lt!627629))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424610 (= lt!627629 (Intermediate!11201 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424611 () Bool)

(declare-fun res!960040 () Bool)

(assert (=> b!1424611 (=> (not res!960040) (not e!805094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424611 (= res!960040 (validKeyInArray!0 (select (arr!46916 a!2831) i!982)))))

(declare-fun b!1424612 () Bool)

(declare-fun res!960041 () Bool)

(declare-fun e!805092 () Bool)

(assert (=> b!1424612 (=> res!960041 e!805092)))

(declare-fun lt!627624 () (_ BitVec 32))

(assert (=> b!1424612 (= res!960041 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627624 (select (arr!46916 a!2831) j!81) a!2831 mask!2608) lt!627629)))))

(declare-fun b!1424613 () Bool)

(declare-fun res!960053 () Bool)

(assert (=> b!1424613 (=> (not res!960053) (not e!805091))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424613 (= res!960053 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424614 () Bool)

(declare-fun res!960054 () Bool)

(assert (=> b!1424614 (=> (not res!960054) (not e!805094))))

(assert (=> b!1424614 (= res!960054 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47466 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47466 a!2831))))))

(declare-fun b!1424615 () Bool)

(assert (=> b!1424615 (= e!805092 true)))

(declare-fun lt!627630 () SeekEntryResult!11201)

(assert (=> b!1424615 (= lt!627630 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627624 lt!627626 lt!627625 mask!2608))))

(declare-fun b!1424617 () Bool)

(declare-fun e!805093 () Bool)

(assert (=> b!1424617 (= e!805093 e!805092)))

(declare-fun res!960045 () Bool)

(assert (=> b!1424617 (=> res!960045 e!805092)))

(assert (=> b!1424617 (= res!960045 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627624 #b00000000000000000000000000000000) (bvsge lt!627624 (size!47466 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424617 (= lt!627624 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424618 () Bool)

(declare-fun e!805088 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97197 (_ BitVec 32)) SeekEntryResult!11201)

(assert (=> b!1424618 (= e!805088 (= (seekEntryOrOpen!0 (select (arr!46916 a!2831) j!81) a!2831 mask!2608) (Found!11201 j!81)))))

(declare-fun b!1424619 () Bool)

(declare-fun res!960055 () Bool)

(assert (=> b!1424619 (=> (not res!960055) (not e!805094))))

(assert (=> b!1424619 (= res!960055 (validKeyInArray!0 (select (arr!46916 a!2831) j!81)))))

(declare-fun b!1424620 () Bool)

(assert (=> b!1424620 (= e!805091 (not e!805093))))

(declare-fun res!960046 () Bool)

(assert (=> b!1424620 (=> res!960046 e!805093)))

(assert (=> b!1424620 (= res!960046 (or (= (select (arr!46916 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46916 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46916 a!2831) index!585) (select (arr!46916 a!2831) j!81)) (= (select (store (arr!46916 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424620 e!805088))

(declare-fun res!960048 () Bool)

(assert (=> b!1424620 (=> (not res!960048) (not e!805088))))

(assert (=> b!1424620 (= res!960048 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48238 0))(
  ( (Unit!48239) )
))
(declare-fun lt!627627 () Unit!48238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48238)

(assert (=> b!1424620 (= lt!627627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424621 () Bool)

(declare-fun res!960043 () Bool)

(assert (=> b!1424621 (=> (not res!960043) (not e!805091))))

(assert (=> b!1424621 (= res!960043 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46916 a!2831) j!81) a!2831 mask!2608) lt!627629))))

(declare-fun b!1424622 () Bool)

(declare-fun res!960044 () Bool)

(assert (=> b!1424622 (=> (not res!960044) (not e!805094))))

(declare-datatypes ((List!33426 0))(
  ( (Nil!33423) (Cons!33422 (h!34724 (_ BitVec 64)) (t!48120 List!33426)) )
))
(declare-fun arrayNoDuplicates!0 (array!97197 (_ BitVec 32) List!33426) Bool)

(assert (=> b!1424622 (= res!960044 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33423))))

(declare-fun b!1424616 () Bool)

(assert (=> b!1424616 (= e!805090 e!805091)))

(declare-fun res!960052 () Bool)

(assert (=> b!1424616 (=> (not res!960052) (not e!805091))))

(assert (=> b!1424616 (= res!960052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627626 mask!2608) lt!627626 lt!627625 mask!2608) lt!627628))))

(assert (=> b!1424616 (= lt!627628 (Intermediate!11201 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424616 (= lt!627626 (select (store (arr!46916 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424616 (= lt!627625 (array!97198 (store (arr!46916 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47466 a!2831)))))

(declare-fun res!960042 () Bool)

(assert (=> start!122832 (=> (not res!960042) (not e!805094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122832 (= res!960042 (validMask!0 mask!2608))))

(assert (=> start!122832 e!805094))

(assert (=> start!122832 true))

(declare-fun array_inv!35944 (array!97197) Bool)

(assert (=> start!122832 (array_inv!35944 a!2831)))

(assert (= (and start!122832 res!960042) b!1424608))

(assert (= (and b!1424608 res!960049) b!1424611))

(assert (= (and b!1424611 res!960040) b!1424619))

(assert (= (and b!1424619 res!960055) b!1424609))

(assert (= (and b!1424609 res!960051) b!1424622))

(assert (= (and b!1424622 res!960044) b!1424614))

(assert (= (and b!1424614 res!960054) b!1424610))

(assert (= (and b!1424610 res!960050) b!1424616))

(assert (= (and b!1424616 res!960052) b!1424621))

(assert (= (and b!1424621 res!960043) b!1424607))

(assert (= (and b!1424607 res!960047) b!1424613))

(assert (= (and b!1424613 res!960053) b!1424620))

(assert (= (and b!1424620 res!960048) b!1424618))

(assert (= (and b!1424620 (not res!960046)) b!1424617))

(assert (= (and b!1424617 (not res!960045)) b!1424612))

(assert (= (and b!1424612 (not res!960041)) b!1424615))

(declare-fun m!1315155 () Bool)

(assert (=> start!122832 m!1315155))

(declare-fun m!1315157 () Bool)

(assert (=> start!122832 m!1315157))

(declare-fun m!1315159 () Bool)

(assert (=> b!1424618 m!1315159))

(assert (=> b!1424618 m!1315159))

(declare-fun m!1315161 () Bool)

(assert (=> b!1424618 m!1315161))

(declare-fun m!1315163 () Bool)

(assert (=> b!1424622 m!1315163))

(declare-fun m!1315165 () Bool)

(assert (=> b!1424611 m!1315165))

(assert (=> b!1424611 m!1315165))

(declare-fun m!1315167 () Bool)

(assert (=> b!1424611 m!1315167))

(assert (=> b!1424612 m!1315159))

(assert (=> b!1424612 m!1315159))

(declare-fun m!1315169 () Bool)

(assert (=> b!1424612 m!1315169))

(declare-fun m!1315171 () Bool)

(assert (=> b!1424616 m!1315171))

(assert (=> b!1424616 m!1315171))

(declare-fun m!1315173 () Bool)

(assert (=> b!1424616 m!1315173))

(declare-fun m!1315175 () Bool)

(assert (=> b!1424616 m!1315175))

(declare-fun m!1315177 () Bool)

(assert (=> b!1424616 m!1315177))

(assert (=> b!1424619 m!1315159))

(assert (=> b!1424619 m!1315159))

(declare-fun m!1315179 () Bool)

(assert (=> b!1424619 m!1315179))

(declare-fun m!1315181 () Bool)

(assert (=> b!1424617 m!1315181))

(declare-fun m!1315183 () Bool)

(assert (=> b!1424607 m!1315183))

(assert (=> b!1424610 m!1315159))

(assert (=> b!1424610 m!1315159))

(declare-fun m!1315185 () Bool)

(assert (=> b!1424610 m!1315185))

(assert (=> b!1424610 m!1315185))

(assert (=> b!1424610 m!1315159))

(declare-fun m!1315187 () Bool)

(assert (=> b!1424610 m!1315187))

(assert (=> b!1424621 m!1315159))

(assert (=> b!1424621 m!1315159))

(declare-fun m!1315189 () Bool)

(assert (=> b!1424621 m!1315189))

(declare-fun m!1315191 () Bool)

(assert (=> b!1424615 m!1315191))

(declare-fun m!1315193 () Bool)

(assert (=> b!1424609 m!1315193))

(assert (=> b!1424620 m!1315175))

(declare-fun m!1315195 () Bool)

(assert (=> b!1424620 m!1315195))

(declare-fun m!1315197 () Bool)

(assert (=> b!1424620 m!1315197))

(declare-fun m!1315199 () Bool)

(assert (=> b!1424620 m!1315199))

(assert (=> b!1424620 m!1315159))

(declare-fun m!1315201 () Bool)

(assert (=> b!1424620 m!1315201))

(push 1)

