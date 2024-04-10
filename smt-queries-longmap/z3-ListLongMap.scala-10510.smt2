; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123878 () Bool)

(assert start!123878)

(declare-fun b!1435655 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97622 0))(
  ( (array!97623 (arr!47112 (Array (_ BitVec 32) (_ BitVec 64))) (size!47662 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97622)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun e!810220 () Bool)

(declare-datatypes ((SeekEntryResult!11391 0))(
  ( (MissingZero!11391 (index!47956 (_ BitVec 32))) (Found!11391 (index!47957 (_ BitVec 32))) (Intermediate!11391 (undefined!12203 Bool) (index!47958 (_ BitVec 32)) (x!129621 (_ BitVec 32))) (Undefined!11391) (MissingVacant!11391 (index!47959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97622 (_ BitVec 32)) SeekEntryResult!11391)

(assert (=> b!1435655 (= e!810220 (= (seekEntryOrOpen!0 (select (arr!47112 a!2831) j!81) a!2831 mask!2608) (Found!11391 j!81)))))

(declare-fun b!1435656 () Bool)

(declare-fun res!968675 () Bool)

(declare-fun e!810222 () Bool)

(assert (=> b!1435656 (=> (not res!968675) (not e!810222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97622 (_ BitVec 32)) Bool)

(assert (=> b!1435656 (= res!968675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435657 () Bool)

(declare-fun res!968667 () Bool)

(declare-fun e!810221 () Bool)

(assert (=> b!1435657 (=> (not res!968667) (not e!810221))))

(declare-fun lt!631968 () SeekEntryResult!11391)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97622 (_ BitVec 32)) SeekEntryResult!11391)

(assert (=> b!1435657 (= res!968667 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47112 a!2831) j!81) a!2831 mask!2608) lt!631968))))

(declare-fun b!1435658 () Bool)

(declare-fun res!968673 () Bool)

(assert (=> b!1435658 (=> (not res!968673) (not e!810222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435658 (= res!968673 (validKeyInArray!0 (select (arr!47112 a!2831) j!81)))))

(declare-fun b!1435659 () Bool)

(declare-fun res!968666 () Bool)

(assert (=> b!1435659 (=> (not res!968666) (not e!810222))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1435659 (= res!968666 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47662 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47662 a!2831))))))

(declare-fun b!1435660 () Bool)

(declare-fun e!810219 () Bool)

(declare-fun e!810223 () Bool)

(assert (=> b!1435660 (= e!810219 e!810223)))

(declare-fun res!968671 () Bool)

(assert (=> b!1435660 (=> res!968671 e!810223)))

(declare-fun lt!631967 () (_ BitVec 32))

(assert (=> b!1435660 (= res!968671 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631967 #b00000000000000000000000000000000) (bvsge lt!631967 (size!47662 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435660 (= lt!631967 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435661 () Bool)

(declare-fun res!968665 () Bool)

(assert (=> b!1435661 (=> (not res!968665) (not e!810221))))

(declare-fun lt!631971 () array!97622)

(declare-fun lt!631966 () (_ BitVec 64))

(declare-fun lt!631965 () SeekEntryResult!11391)

(assert (=> b!1435661 (= res!968665 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631966 lt!631971 mask!2608) lt!631965))))

(declare-fun b!1435662 () Bool)

(declare-fun res!968672 () Bool)

(assert (=> b!1435662 (=> (not res!968672) (not e!810222))))

(declare-datatypes ((List!33622 0))(
  ( (Nil!33619) (Cons!33618 (h!34953 (_ BitVec 64)) (t!48316 List!33622)) )
))
(declare-fun arrayNoDuplicates!0 (array!97622 (_ BitVec 32) List!33622) Bool)

(assert (=> b!1435662 (= res!968672 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33619))))

(declare-fun b!1435663 () Bool)

(assert (=> b!1435663 (= e!810223 true)))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435663 (and (not undefinedAfter!5) (= intermediateAfterIndex!13 i!982) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))

(declare-datatypes ((Unit!48528 0))(
  ( (Unit!48529) )
))
(declare-fun lt!631969 () Unit!48528)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!97622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!48528)

(assert (=> b!1435663 (= lt!631969 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2831 i!982 j!81 (bvadd #b00000000000000000000000000000001 x!605) lt!631967 intermediateBeforeX!13 intermediateBeforeIndex!13 intermediateAfterX!13 intermediateAfterIndex!13 undefinedAfter!5 mask!2608))))

(declare-fun b!1435664 () Bool)

(declare-fun res!968664 () Bool)

(assert (=> b!1435664 (=> (not res!968664) (not e!810222))))

(assert (=> b!1435664 (= res!968664 (and (= (size!47662 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47662 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47662 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435666 () Bool)

(declare-fun res!968676 () Bool)

(assert (=> b!1435666 (=> res!968676 e!810223)))

(assert (=> b!1435666 (= res!968676 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631967 lt!631966 lt!631971 mask!2608) lt!631965)))))

(declare-fun b!1435667 () Bool)

(declare-fun res!968677 () Bool)

(assert (=> b!1435667 (=> (not res!968677) (not e!810221))))

(assert (=> b!1435667 (= res!968677 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435668 () Bool)

(declare-fun e!810224 () Bool)

(assert (=> b!1435668 (= e!810222 e!810224)))

(declare-fun res!968662 () Bool)

(assert (=> b!1435668 (=> (not res!968662) (not e!810224))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435668 (= res!968662 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47112 a!2831) j!81) mask!2608) (select (arr!47112 a!2831) j!81) a!2831 mask!2608) lt!631968))))

(assert (=> b!1435668 (= lt!631968 (Intermediate!11391 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435669 () Bool)

(declare-fun res!968668 () Bool)

(assert (=> b!1435669 (=> res!968668 e!810223)))

(assert (=> b!1435669 (= res!968668 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631967 (select (arr!47112 a!2831) j!81) a!2831 mask!2608) lt!631968)))))

(declare-fun b!1435670 () Bool)

(assert (=> b!1435670 (= e!810221 (not e!810219))))

(declare-fun res!968674 () Bool)

(assert (=> b!1435670 (=> res!968674 e!810219)))

(assert (=> b!1435670 (= res!968674 (or (= (select (arr!47112 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47112 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47112 a!2831) index!585) (select (arr!47112 a!2831) j!81)) (= (select (store (arr!47112 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435670 e!810220))

(declare-fun res!968669 () Bool)

(assert (=> b!1435670 (=> (not res!968669) (not e!810220))))

(assert (=> b!1435670 (= res!968669 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-fun lt!631970 () Unit!48528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48528)

(assert (=> b!1435670 (= lt!631970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435671 () Bool)

(assert (=> b!1435671 (= e!810224 e!810221)))

(declare-fun res!968670 () Bool)

(assert (=> b!1435671 (=> (not res!968670) (not e!810221))))

(assert (=> b!1435671 (= res!968670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631966 mask!2608) lt!631966 lt!631971 mask!2608) lt!631965))))

(assert (=> b!1435671 (= lt!631965 (Intermediate!11391 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435671 (= lt!631966 (select (store (arr!47112 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435671 (= lt!631971 (array!97623 (store (arr!47112 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47662 a!2831)))))

(declare-fun b!1435665 () Bool)

(declare-fun res!968663 () Bool)

(assert (=> b!1435665 (=> (not res!968663) (not e!810222))))

(assert (=> b!1435665 (= res!968663 (validKeyInArray!0 (select (arr!47112 a!2831) i!982)))))

(declare-fun res!968661 () Bool)

(assert (=> start!123878 (=> (not res!968661) (not e!810222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123878 (= res!968661 (validMask!0 mask!2608))))

(assert (=> start!123878 e!810222))

(assert (=> start!123878 true))

(declare-fun array_inv!36140 (array!97622) Bool)

(assert (=> start!123878 (array_inv!36140 a!2831)))

(assert (= (and start!123878 res!968661) b!1435664))

(assert (= (and b!1435664 res!968664) b!1435665))

(assert (= (and b!1435665 res!968663) b!1435658))

(assert (= (and b!1435658 res!968673) b!1435656))

(assert (= (and b!1435656 res!968675) b!1435662))

(assert (= (and b!1435662 res!968672) b!1435659))

(assert (= (and b!1435659 res!968666) b!1435668))

(assert (= (and b!1435668 res!968662) b!1435671))

(assert (= (and b!1435671 res!968670) b!1435657))

(assert (= (and b!1435657 res!968667) b!1435661))

(assert (= (and b!1435661 res!968665) b!1435667))

(assert (= (and b!1435667 res!968677) b!1435670))

(assert (= (and b!1435670 res!968669) b!1435655))

(assert (= (and b!1435670 (not res!968674)) b!1435660))

(assert (= (and b!1435660 (not res!968671)) b!1435669))

(assert (= (and b!1435669 (not res!968668)) b!1435666))

(assert (= (and b!1435666 (not res!968676)) b!1435663))

(declare-fun m!1325003 () Bool)

(assert (=> b!1435661 m!1325003))

(declare-fun m!1325005 () Bool)

(assert (=> b!1435669 m!1325005))

(assert (=> b!1435669 m!1325005))

(declare-fun m!1325007 () Bool)

(assert (=> b!1435669 m!1325007))

(declare-fun m!1325009 () Bool)

(assert (=> b!1435662 m!1325009))

(declare-fun m!1325011 () Bool)

(assert (=> b!1435670 m!1325011))

(declare-fun m!1325013 () Bool)

(assert (=> b!1435670 m!1325013))

(declare-fun m!1325015 () Bool)

(assert (=> b!1435670 m!1325015))

(declare-fun m!1325017 () Bool)

(assert (=> b!1435670 m!1325017))

(assert (=> b!1435670 m!1325005))

(declare-fun m!1325019 () Bool)

(assert (=> b!1435670 m!1325019))

(declare-fun m!1325021 () Bool)

(assert (=> b!1435660 m!1325021))

(assert (=> b!1435668 m!1325005))

(assert (=> b!1435668 m!1325005))

(declare-fun m!1325023 () Bool)

(assert (=> b!1435668 m!1325023))

(assert (=> b!1435668 m!1325023))

(assert (=> b!1435668 m!1325005))

(declare-fun m!1325025 () Bool)

(assert (=> b!1435668 m!1325025))

(declare-fun m!1325027 () Bool)

(assert (=> b!1435663 m!1325027))

(declare-fun m!1325029 () Bool)

(assert (=> start!123878 m!1325029))

(declare-fun m!1325031 () Bool)

(assert (=> start!123878 m!1325031))

(declare-fun m!1325033 () Bool)

(assert (=> b!1435665 m!1325033))

(assert (=> b!1435665 m!1325033))

(declare-fun m!1325035 () Bool)

(assert (=> b!1435665 m!1325035))

(declare-fun m!1325037 () Bool)

(assert (=> b!1435671 m!1325037))

(assert (=> b!1435671 m!1325037))

(declare-fun m!1325039 () Bool)

(assert (=> b!1435671 m!1325039))

(assert (=> b!1435671 m!1325011))

(declare-fun m!1325041 () Bool)

(assert (=> b!1435671 m!1325041))

(assert (=> b!1435655 m!1325005))

(assert (=> b!1435655 m!1325005))

(declare-fun m!1325043 () Bool)

(assert (=> b!1435655 m!1325043))

(declare-fun m!1325045 () Bool)

(assert (=> b!1435656 m!1325045))

(assert (=> b!1435658 m!1325005))

(assert (=> b!1435658 m!1325005))

(declare-fun m!1325047 () Bool)

(assert (=> b!1435658 m!1325047))

(assert (=> b!1435657 m!1325005))

(assert (=> b!1435657 m!1325005))

(declare-fun m!1325049 () Bool)

(assert (=> b!1435657 m!1325049))

(declare-fun m!1325051 () Bool)

(assert (=> b!1435666 m!1325051))

(check-sat (not start!123878) (not b!1435666) (not b!1435655) (not b!1435671) (not b!1435665) (not b!1435669) (not b!1435670) (not b!1435662) (not b!1435661) (not b!1435658) (not b!1435656) (not b!1435660) (not b!1435668) (not b!1435663) (not b!1435657))
(check-sat)
