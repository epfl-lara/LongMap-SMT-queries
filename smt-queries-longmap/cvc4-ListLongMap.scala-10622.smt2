; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124874 () Bool)

(assert start!124874)

(declare-fun b!1450163 () Bool)

(declare-fun e!816606 () Bool)

(declare-fun e!816613 () Bool)

(assert (=> b!1450163 (= e!816606 e!816613)))

(declare-fun res!981547 () Bool)

(assert (=> b!1450163 (=> res!981547 e!816613)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98322 0))(
  ( (array!98323 (arr!47449 (Array (_ BitVec 32) (_ BitVec 64))) (size!47999 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98322)

(assert (=> b!1450163 (= res!981547 (or (and (= (select (arr!47449 a!2862) index!646) (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47449 a!2862) index!646) (select (arr!47449 a!2862) j!93))) (not (= (select (arr!47449 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450164 () Bool)

(declare-fun res!981546 () Bool)

(declare-fun e!816607 () Bool)

(assert (=> b!1450164 (=> (not res!981546) (not e!816607))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98322 (_ BitVec 32)) Bool)

(assert (=> b!1450164 (= res!981546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450165 () Bool)

(declare-fun res!981534 () Bool)

(assert (=> b!1450165 (=> (not res!981534) (not e!816607))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450165 (= res!981534 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47999 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47999 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47999 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!636188 () (_ BitVec 64))

(declare-fun b!1450166 () Bool)

(declare-fun lt!636185 () array!98322)

(declare-fun e!816611 () Bool)

(declare-datatypes ((SeekEntryResult!11701 0))(
  ( (MissingZero!11701 (index!49196 (_ BitVec 32))) (Found!11701 (index!49197 (_ BitVec 32))) (Intermediate!11701 (undefined!12513 Bool) (index!49198 (_ BitVec 32)) (x!130854 (_ BitVec 32))) (Undefined!11701) (MissingVacant!11701 (index!49199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98322 (_ BitVec 32)) SeekEntryResult!11701)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98322 (_ BitVec 32)) SeekEntryResult!11701)

(assert (=> b!1450166 (= e!816611 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636188 lt!636185 mask!2687) (seekEntryOrOpen!0 lt!636188 lt!636185 mask!2687)))))

(declare-fun b!1450167 () Bool)

(declare-fun e!816610 () Bool)

(assert (=> b!1450167 (= e!816613 e!816610)))

(declare-fun res!981539 () Bool)

(assert (=> b!1450167 (=> (not res!981539) (not e!816610))))

(declare-fun lt!636189 () SeekEntryResult!11701)

(assert (=> b!1450167 (= res!981539 (= lt!636189 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47449 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450168 () Bool)

(declare-fun res!981533 () Bool)

(assert (=> b!1450168 (=> (not res!981533) (not e!816607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450168 (= res!981533 (validKeyInArray!0 (select (arr!47449 a!2862) i!1006)))))

(declare-fun lt!636184 () SeekEntryResult!11701)

(declare-fun b!1450169 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98322 (_ BitVec 32)) SeekEntryResult!11701)

(assert (=> b!1450169 (= e!816611 (= lt!636184 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636188 lt!636185 mask!2687)))))

(declare-fun b!1450170 () Bool)

(assert (=> b!1450170 (= e!816610 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450171 () Bool)

(declare-fun res!981536 () Bool)

(declare-fun e!816609 () Bool)

(assert (=> b!1450171 (=> (not res!981536) (not e!816609))))

(assert (=> b!1450171 (= res!981536 e!816611)))

(declare-fun c!133827 () Bool)

(assert (=> b!1450171 (= c!133827 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450173 () Bool)

(declare-fun res!981545 () Bool)

(declare-fun e!816608 () Bool)

(assert (=> b!1450173 (=> (not res!981545) (not e!816608))))

(declare-fun lt!636182 () SeekEntryResult!11701)

(assert (=> b!1450173 (= res!981545 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!636182))))

(declare-fun b!1450174 () Bool)

(declare-fun res!981538 () Bool)

(assert (=> b!1450174 (=> (not res!981538) (not e!816607))))

(assert (=> b!1450174 (= res!981538 (and (= (size!47999 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47999 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47999 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450175 () Bool)

(declare-fun e!816612 () Bool)

(assert (=> b!1450175 (= e!816609 (not e!816612))))

(declare-fun res!981543 () Bool)

(assert (=> b!1450175 (=> res!981543 e!816612)))

(assert (=> b!1450175 (= res!981543 (or (and (= (select (arr!47449 a!2862) index!646) (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47449 a!2862) index!646) (select (arr!47449 a!2862) j!93))) (not (= (select (arr!47449 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450175 e!816606))

(declare-fun res!981544 () Bool)

(assert (=> b!1450175 (=> (not res!981544) (not e!816606))))

(declare-fun lt!636187 () SeekEntryResult!11701)

(assert (=> b!1450175 (= res!981544 (and (= lt!636189 lt!636187) (or (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) (select (arr!47449 a!2862) j!93)))))))

(assert (=> b!1450175 (= lt!636187 (Found!11701 j!93))))

(assert (=> b!1450175 (= lt!636189 (seekEntryOrOpen!0 (select (arr!47449 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450175 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48898 0))(
  ( (Unit!48899) )
))
(declare-fun lt!636186 () Unit!48898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48898)

(assert (=> b!1450175 (= lt!636186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450176 () Bool)

(declare-fun res!981537 () Bool)

(assert (=> b!1450176 (=> (not res!981537) (not e!816607))))

(declare-datatypes ((List!33950 0))(
  ( (Nil!33947) (Cons!33946 (h!35296 (_ BitVec 64)) (t!48644 List!33950)) )
))
(declare-fun arrayNoDuplicates!0 (array!98322 (_ BitVec 32) List!33950) Bool)

(assert (=> b!1450176 (= res!981537 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33947))))

(declare-fun b!1450177 () Bool)

(declare-fun e!816605 () Bool)

(assert (=> b!1450177 (= e!816607 e!816605)))

(declare-fun res!981540 () Bool)

(assert (=> b!1450177 (=> (not res!981540) (not e!816605))))

(assert (=> b!1450177 (= res!981540 (= (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450177 (= lt!636185 (array!98323 (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47999 a!2862)))))

(declare-fun b!1450178 () Bool)

(declare-fun res!981541 () Bool)

(assert (=> b!1450178 (=> res!981541 e!816612)))

(assert (=> b!1450178 (= res!981541 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!636187)))))

(declare-fun b!1450179 () Bool)

(declare-fun res!981532 () Bool)

(assert (=> b!1450179 (=> (not res!981532) (not e!816607))))

(assert (=> b!1450179 (= res!981532 (validKeyInArray!0 (select (arr!47449 a!2862) j!93)))))

(declare-fun res!981531 () Bool)

(assert (=> start!124874 (=> (not res!981531) (not e!816607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124874 (= res!981531 (validMask!0 mask!2687))))

(assert (=> start!124874 e!816607))

(assert (=> start!124874 true))

(declare-fun array_inv!36477 (array!98322) Bool)

(assert (=> start!124874 (array_inv!36477 a!2862)))

(declare-fun b!1450172 () Bool)

(assert (=> b!1450172 (= e!816612 true)))

(assert (=> b!1450172 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636188 lt!636185 mask!2687) lt!636187)))

(declare-fun lt!636183 () Unit!48898)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48898)

(assert (=> b!1450172 (= lt!636183 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450180 () Bool)

(assert (=> b!1450180 (= e!816608 e!816609)))

(declare-fun res!981542 () Bool)

(assert (=> b!1450180 (=> (not res!981542) (not e!816609))))

(assert (=> b!1450180 (= res!981542 (= lt!636184 (Intermediate!11701 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450180 (= lt!636184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636188 mask!2687) lt!636188 lt!636185 mask!2687))))

(assert (=> b!1450180 (= lt!636188 (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450181 () Bool)

(assert (=> b!1450181 (= e!816605 e!816608)))

(declare-fun res!981535 () Bool)

(assert (=> b!1450181 (=> (not res!981535) (not e!816608))))

(assert (=> b!1450181 (= res!981535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47449 a!2862) j!93) mask!2687) (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!636182))))

(assert (=> b!1450181 (= lt!636182 (Intermediate!11701 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450182 () Bool)

(declare-fun res!981530 () Bool)

(assert (=> b!1450182 (=> (not res!981530) (not e!816609))))

(assert (=> b!1450182 (= res!981530 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124874 res!981531) b!1450174))

(assert (= (and b!1450174 res!981538) b!1450168))

(assert (= (and b!1450168 res!981533) b!1450179))

(assert (= (and b!1450179 res!981532) b!1450164))

(assert (= (and b!1450164 res!981546) b!1450176))

(assert (= (and b!1450176 res!981537) b!1450165))

(assert (= (and b!1450165 res!981534) b!1450177))

(assert (= (and b!1450177 res!981540) b!1450181))

(assert (= (and b!1450181 res!981535) b!1450173))

(assert (= (and b!1450173 res!981545) b!1450180))

(assert (= (and b!1450180 res!981542) b!1450171))

(assert (= (and b!1450171 c!133827) b!1450169))

(assert (= (and b!1450171 (not c!133827)) b!1450166))

(assert (= (and b!1450171 res!981536) b!1450182))

(assert (= (and b!1450182 res!981530) b!1450175))

(assert (= (and b!1450175 res!981544) b!1450163))

(assert (= (and b!1450163 (not res!981547)) b!1450167))

(assert (= (and b!1450167 res!981539) b!1450170))

(assert (= (and b!1450175 (not res!981543)) b!1450178))

(assert (= (and b!1450178 (not res!981541)) b!1450172))

(declare-fun m!1338827 () Bool)

(assert (=> b!1450178 m!1338827))

(assert (=> b!1450178 m!1338827))

(declare-fun m!1338829 () Bool)

(assert (=> b!1450178 m!1338829))

(assert (=> b!1450181 m!1338827))

(assert (=> b!1450181 m!1338827))

(declare-fun m!1338831 () Bool)

(assert (=> b!1450181 m!1338831))

(assert (=> b!1450181 m!1338831))

(assert (=> b!1450181 m!1338827))

(declare-fun m!1338833 () Bool)

(assert (=> b!1450181 m!1338833))

(declare-fun m!1338835 () Bool)

(assert (=> b!1450172 m!1338835))

(declare-fun m!1338837 () Bool)

(assert (=> b!1450172 m!1338837))

(declare-fun m!1338839 () Bool)

(assert (=> b!1450177 m!1338839))

(declare-fun m!1338841 () Bool)

(assert (=> b!1450177 m!1338841))

(declare-fun m!1338843 () Bool)

(assert (=> b!1450169 m!1338843))

(declare-fun m!1338845 () Bool)

(assert (=> b!1450163 m!1338845))

(assert (=> b!1450163 m!1338839))

(declare-fun m!1338847 () Bool)

(assert (=> b!1450163 m!1338847))

(assert (=> b!1450163 m!1338827))

(assert (=> b!1450167 m!1338827))

(assert (=> b!1450167 m!1338827))

(declare-fun m!1338849 () Bool)

(assert (=> b!1450167 m!1338849))

(declare-fun m!1338851 () Bool)

(assert (=> b!1450164 m!1338851))

(assert (=> b!1450173 m!1338827))

(assert (=> b!1450173 m!1338827))

(declare-fun m!1338853 () Bool)

(assert (=> b!1450173 m!1338853))

(declare-fun m!1338855 () Bool)

(assert (=> b!1450180 m!1338855))

(assert (=> b!1450180 m!1338855))

(declare-fun m!1338857 () Bool)

(assert (=> b!1450180 m!1338857))

(assert (=> b!1450180 m!1338839))

(declare-fun m!1338859 () Bool)

(assert (=> b!1450180 m!1338859))

(declare-fun m!1338861 () Bool)

(assert (=> b!1450176 m!1338861))

(assert (=> b!1450179 m!1338827))

(assert (=> b!1450179 m!1338827))

(declare-fun m!1338863 () Bool)

(assert (=> b!1450179 m!1338863))

(assert (=> b!1450166 m!1338835))

(declare-fun m!1338865 () Bool)

(assert (=> b!1450166 m!1338865))

(declare-fun m!1338867 () Bool)

(assert (=> b!1450175 m!1338867))

(assert (=> b!1450175 m!1338839))

(declare-fun m!1338869 () Bool)

(assert (=> b!1450175 m!1338869))

(assert (=> b!1450175 m!1338847))

(assert (=> b!1450175 m!1338845))

(assert (=> b!1450175 m!1338827))

(declare-fun m!1338871 () Bool)

(assert (=> b!1450175 m!1338871))

(declare-fun m!1338873 () Bool)

(assert (=> b!1450175 m!1338873))

(assert (=> b!1450175 m!1338827))

(declare-fun m!1338875 () Bool)

(assert (=> b!1450168 m!1338875))

(assert (=> b!1450168 m!1338875))

(declare-fun m!1338877 () Bool)

(assert (=> b!1450168 m!1338877))

(declare-fun m!1338879 () Bool)

(assert (=> start!124874 m!1338879))

(declare-fun m!1338881 () Bool)

(assert (=> start!124874 m!1338881))

(push 1)

