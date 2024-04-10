; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126854 () Bool)

(assert start!126854)

(declare-fun b!1489794 () Bool)

(declare-fun res!1013184 () Bool)

(declare-fun e!834912 () Bool)

(assert (=> b!1489794 (=> res!1013184 e!834912)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12325 0))(
  ( (MissingZero!12325 (index!51692 (_ BitVec 32))) (Found!12325 (index!51693 (_ BitVec 32))) (Intermediate!12325 (undefined!13137 Bool) (index!51694 (_ BitVec 32)) (x!133285 (_ BitVec 32))) (Undefined!12325) (MissingVacant!12325 (index!51695 (_ BitVec 32))) )
))
(declare-fun lt!649698 () SeekEntryResult!12325)

(declare-fun lt!649704 () (_ BitVec 32))

(declare-datatypes ((array!99627 0))(
  ( (array!99628 (arr!48085 (Array (_ BitVec 32) (_ BitVec 64))) (size!48635 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99627)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99627 (_ BitVec 32)) SeekEntryResult!12325)

(assert (=> b!1489794 (= res!1013184 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649704 (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!649698)))))

(declare-fun b!1489795 () Bool)

(declare-fun e!834913 () Bool)

(declare-fun e!834911 () Bool)

(assert (=> b!1489795 (= e!834913 e!834911)))

(declare-fun res!1013178 () Bool)

(assert (=> b!1489795 (=> (not res!1013178) (not e!834911))))

(declare-fun lt!649696 () SeekEntryResult!12325)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489795 (= res!1013178 (= lt!649696 (Intermediate!12325 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649703 () array!99627)

(declare-fun lt!649701 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489795 (= lt!649696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649701 mask!2687) lt!649701 lt!649703 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489795 (= lt!649701 (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489796 () Bool)

(declare-fun lt!649702 () SeekEntryResult!12325)

(declare-fun e!834916 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99627 (_ BitVec 32)) SeekEntryResult!12325)

(assert (=> b!1489796 (= e!834916 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649704 intermediateAfterIndex!19 lt!649701 lt!649703 mask!2687) lt!649702)))))

(declare-fun b!1489797 () Bool)

(declare-fun e!834910 () Bool)

(assert (=> b!1489797 (= e!834911 (not e!834910))))

(declare-fun res!1013176 () Bool)

(assert (=> b!1489797 (=> res!1013176 e!834910)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1489797 (= res!1013176 (or (and (= (select (arr!48085 a!2862) index!646) (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48085 a!2862) index!646) (select (arr!48085 a!2862) j!93))) (= (select (arr!48085 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!649699 () SeekEntryResult!12325)

(assert (=> b!1489797 (and (= lt!649699 (Found!12325 j!93)) (or (= (select (arr!48085 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48085 a!2862) intermediateBeforeIndex!19) (select (arr!48085 a!2862) j!93))) (let ((bdg!54742 (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48085 a!2862) index!646) bdg!54742) (= (select (arr!48085 a!2862) index!646) (select (arr!48085 a!2862) j!93))) (= (select (arr!48085 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54742 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99627 (_ BitVec 32)) SeekEntryResult!12325)

(assert (=> b!1489797 (= lt!649699 (seekEntryOrOpen!0 (select (arr!48085 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99627 (_ BitVec 32)) Bool)

(assert (=> b!1489797 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49990 0))(
  ( (Unit!49991) )
))
(declare-fun lt!649697 () Unit!49990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49990)

(assert (=> b!1489797 (= lt!649697 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489798 () Bool)

(assert (=> b!1489798 (= e!834910 e!834912)))

(declare-fun res!1013189 () Bool)

(assert (=> b!1489798 (=> res!1013189 e!834912)))

(assert (=> b!1489798 (= res!1013189 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649704 #b00000000000000000000000000000000) (bvsge lt!649704 (size!48635 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489798 (= lt!649704 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489798 (= lt!649702 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649701 lt!649703 mask!2687))))

(assert (=> b!1489798 (= lt!649702 (seekEntryOrOpen!0 lt!649701 lt!649703 mask!2687))))

(declare-fun b!1489799 () Bool)

(declare-fun e!834914 () Bool)

(assert (=> b!1489799 (= e!834914 (= lt!649696 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649701 lt!649703 mask!2687)))))

(declare-fun b!1489800 () Bool)

(declare-fun res!1013174 () Bool)

(declare-fun e!834909 () Bool)

(assert (=> b!1489800 (=> (not res!1013174) (not e!834909))))

(assert (=> b!1489800 (= res!1013174 (and (= (size!48635 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48635 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48635 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489801 () Bool)

(declare-fun res!1013188 () Bool)

(assert (=> b!1489801 (=> (not res!1013188) (not e!834909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489801 (= res!1013188 (validKeyInArray!0 (select (arr!48085 a!2862) j!93)))))

(declare-fun b!1489802 () Bool)

(declare-fun e!834917 () Bool)

(assert (=> b!1489802 (= e!834909 e!834917)))

(declare-fun res!1013190 () Bool)

(assert (=> b!1489802 (=> (not res!1013190) (not e!834917))))

(assert (=> b!1489802 (= res!1013190 (= (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489802 (= lt!649703 (array!99628 (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48635 a!2862)))))

(declare-fun b!1489803 () Bool)

(declare-fun res!1013186 () Bool)

(assert (=> b!1489803 (=> res!1013186 e!834912)))

(assert (=> b!1489803 (= res!1013186 e!834916)))

(declare-fun c!137838 () Bool)

(assert (=> b!1489803 (= c!137838 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!1013177 () Bool)

(assert (=> start!126854 (=> (not res!1013177) (not e!834909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126854 (= res!1013177 (validMask!0 mask!2687))))

(assert (=> start!126854 e!834909))

(assert (=> start!126854 true))

(declare-fun array_inv!37113 (array!99627) Bool)

(assert (=> start!126854 (array_inv!37113 a!2862)))

(declare-fun b!1489804 () Bool)

(assert (=> b!1489804 (= e!834916 (not (= lt!649696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649704 lt!649701 lt!649703 mask!2687))))))

(declare-fun b!1489805 () Bool)

(declare-fun res!1013191 () Bool)

(assert (=> b!1489805 (=> (not res!1013191) (not e!834909))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489805 (= res!1013191 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48635 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48635 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48635 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489806 () Bool)

(declare-fun res!1013175 () Bool)

(assert (=> b!1489806 (=> (not res!1013175) (not e!834911))))

(assert (=> b!1489806 (= res!1013175 e!834914)))

(declare-fun c!137837 () Bool)

(assert (=> b!1489806 (= c!137837 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489807 () Bool)

(declare-fun res!1013180 () Bool)

(assert (=> b!1489807 (=> (not res!1013180) (not e!834909))))

(assert (=> b!1489807 (= res!1013180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489808 () Bool)

(declare-fun res!1013182 () Bool)

(assert (=> b!1489808 (=> (not res!1013182) (not e!834909))))

(assert (=> b!1489808 (= res!1013182 (validKeyInArray!0 (select (arr!48085 a!2862) i!1006)))))

(declare-fun b!1489809 () Bool)

(declare-fun res!1013187 () Bool)

(assert (=> b!1489809 (=> (not res!1013187) (not e!834913))))

(assert (=> b!1489809 (= res!1013187 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!649698))))

(declare-fun b!1489810 () Bool)

(assert (=> b!1489810 (= e!834917 e!834913)))

(declare-fun res!1013185 () Bool)

(assert (=> b!1489810 (=> (not res!1013185) (not e!834913))))

(assert (=> b!1489810 (= res!1013185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48085 a!2862) j!93) mask!2687) (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!649698))))

(assert (=> b!1489810 (= lt!649698 (Intermediate!12325 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489811 () Bool)

(declare-fun res!1013179 () Bool)

(assert (=> b!1489811 (=> res!1013179 e!834912)))

(assert (=> b!1489811 (= res!1013179 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489812 () Bool)

(assert (=> b!1489812 (= e!834914 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649701 lt!649703 mask!2687) (seekEntryOrOpen!0 lt!649701 lt!649703 mask!2687)))))

(declare-fun b!1489813 () Bool)

(declare-fun res!1013181 () Bool)

(assert (=> b!1489813 (=> (not res!1013181) (not e!834911))))

(assert (=> b!1489813 (= res!1013181 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489814 () Bool)

(declare-fun res!1013183 () Bool)

(assert (=> b!1489814 (=> (not res!1013183) (not e!834909))))

(declare-datatypes ((List!34586 0))(
  ( (Nil!34583) (Cons!34582 (h!35965 (_ BitVec 64)) (t!49280 List!34586)) )
))
(declare-fun arrayNoDuplicates!0 (array!99627 (_ BitVec 32) List!34586) Bool)

(assert (=> b!1489814 (= res!1013183 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34583))))

(declare-fun b!1489815 () Bool)

(assert (=> b!1489815 (= e!834912 true)))

(assert (=> b!1489815 (= lt!649699 lt!649702)))

(declare-fun lt!649700 () Unit!49990)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49990)

(assert (=> b!1489815 (= lt!649700 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649704 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!126854 res!1013177) b!1489800))

(assert (= (and b!1489800 res!1013174) b!1489808))

(assert (= (and b!1489808 res!1013182) b!1489801))

(assert (= (and b!1489801 res!1013188) b!1489807))

(assert (= (and b!1489807 res!1013180) b!1489814))

(assert (= (and b!1489814 res!1013183) b!1489805))

(assert (= (and b!1489805 res!1013191) b!1489802))

(assert (= (and b!1489802 res!1013190) b!1489810))

(assert (= (and b!1489810 res!1013185) b!1489809))

(assert (= (and b!1489809 res!1013187) b!1489795))

(assert (= (and b!1489795 res!1013178) b!1489806))

(assert (= (and b!1489806 c!137837) b!1489799))

(assert (= (and b!1489806 (not c!137837)) b!1489812))

(assert (= (and b!1489806 res!1013175) b!1489813))

(assert (= (and b!1489813 res!1013181) b!1489797))

(assert (= (and b!1489797 (not res!1013176)) b!1489798))

(assert (= (and b!1489798 (not res!1013189)) b!1489794))

(assert (= (and b!1489794 (not res!1013184)) b!1489803))

(assert (= (and b!1489803 c!137838) b!1489804))

(assert (= (and b!1489803 (not c!137838)) b!1489796))

(assert (= (and b!1489803 (not res!1013186)) b!1489811))

(assert (= (and b!1489811 (not res!1013179)) b!1489815))

(declare-fun m!1373995 () Bool)

(assert (=> b!1489794 m!1373995))

(assert (=> b!1489794 m!1373995))

(declare-fun m!1373997 () Bool)

(assert (=> b!1489794 m!1373997))

(declare-fun m!1373999 () Bool)

(assert (=> b!1489799 m!1373999))

(declare-fun m!1374001 () Bool)

(assert (=> start!126854 m!1374001))

(declare-fun m!1374003 () Bool)

(assert (=> start!126854 m!1374003))

(declare-fun m!1374005 () Bool)

(assert (=> b!1489807 m!1374005))

(declare-fun m!1374007 () Bool)

(assert (=> b!1489796 m!1374007))

(declare-fun m!1374009 () Bool)

(assert (=> b!1489797 m!1374009))

(declare-fun m!1374011 () Bool)

(assert (=> b!1489797 m!1374011))

(declare-fun m!1374013 () Bool)

(assert (=> b!1489797 m!1374013))

(declare-fun m!1374015 () Bool)

(assert (=> b!1489797 m!1374015))

(declare-fun m!1374017 () Bool)

(assert (=> b!1489797 m!1374017))

(assert (=> b!1489797 m!1373995))

(declare-fun m!1374019 () Bool)

(assert (=> b!1489797 m!1374019))

(declare-fun m!1374021 () Bool)

(assert (=> b!1489797 m!1374021))

(assert (=> b!1489797 m!1373995))

(declare-fun m!1374023 () Bool)

(assert (=> b!1489815 m!1374023))

(declare-fun m!1374025 () Bool)

(assert (=> b!1489798 m!1374025))

(declare-fun m!1374027 () Bool)

(assert (=> b!1489798 m!1374027))

(declare-fun m!1374029 () Bool)

(assert (=> b!1489798 m!1374029))

(assert (=> b!1489802 m!1374011))

(declare-fun m!1374031 () Bool)

(assert (=> b!1489802 m!1374031))

(assert (=> b!1489809 m!1373995))

(assert (=> b!1489809 m!1373995))

(declare-fun m!1374033 () Bool)

(assert (=> b!1489809 m!1374033))

(declare-fun m!1374035 () Bool)

(assert (=> b!1489808 m!1374035))

(assert (=> b!1489808 m!1374035))

(declare-fun m!1374037 () Bool)

(assert (=> b!1489808 m!1374037))

(assert (=> b!1489801 m!1373995))

(assert (=> b!1489801 m!1373995))

(declare-fun m!1374039 () Bool)

(assert (=> b!1489801 m!1374039))

(assert (=> b!1489810 m!1373995))

(assert (=> b!1489810 m!1373995))

(declare-fun m!1374041 () Bool)

(assert (=> b!1489810 m!1374041))

(assert (=> b!1489810 m!1374041))

(assert (=> b!1489810 m!1373995))

(declare-fun m!1374043 () Bool)

(assert (=> b!1489810 m!1374043))

(declare-fun m!1374045 () Bool)

(assert (=> b!1489814 m!1374045))

(assert (=> b!1489812 m!1374027))

(assert (=> b!1489812 m!1374029))

(declare-fun m!1374047 () Bool)

(assert (=> b!1489804 m!1374047))

(declare-fun m!1374049 () Bool)

(assert (=> b!1489795 m!1374049))

(assert (=> b!1489795 m!1374049))

(declare-fun m!1374051 () Bool)

(assert (=> b!1489795 m!1374051))

(assert (=> b!1489795 m!1374011))

(declare-fun m!1374053 () Bool)

(assert (=> b!1489795 m!1374053))

(push 1)

