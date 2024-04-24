; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125190 () Bool)

(assert start!125190)

(declare-fun b!1454147 () Bool)

(declare-fun res!984407 () Bool)

(declare-fun e!818637 () Bool)

(assert (=> b!1454147 (=> (not res!984407) (not e!818637))))

(declare-datatypes ((array!98533 0))(
  ( (array!98534 (arr!47551 (Array (_ BitVec 32) (_ BitVec 64))) (size!48102 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98533)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454147 (= res!984407 (validKeyInArray!0 (select (arr!47551 a!2862) i!1006)))))

(declare-fun b!1454148 () Bool)

(declare-fun e!818635 () Bool)

(declare-fun e!818630 () Bool)

(assert (=> b!1454148 (= e!818635 e!818630)))

(declare-fun res!984406 () Bool)

(assert (=> b!1454148 (=> (not res!984406) (not e!818630))))

(declare-datatypes ((SeekEntryResult!11700 0))(
  ( (MissingZero!11700 (index!49192 (_ BitVec 32))) (Found!11700 (index!49193 (_ BitVec 32))) (Intermediate!11700 (undefined!12512 Bool) (index!49194 (_ BitVec 32)) (x!131013 (_ BitVec 32))) (Undefined!11700) (MissingVacant!11700 (index!49195 (_ BitVec 32))) )
))
(declare-fun lt!637537 () SeekEntryResult!11700)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98533 (_ BitVec 32)) SeekEntryResult!11700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454148 (= res!984406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47551 a!2862) j!93) mask!2687) (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!637537))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454148 (= lt!637537 (Intermediate!11700 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454149 () Bool)

(declare-fun res!984400 () Bool)

(assert (=> b!1454149 (=> (not res!984400) (not e!818637))))

(assert (=> b!1454149 (= res!984400 (validKeyInArray!0 (select (arr!47551 a!2862) j!93)))))

(declare-fun b!1454150 () Bool)

(declare-fun res!984395 () Bool)

(declare-fun e!818636 () Bool)

(assert (=> b!1454150 (=> (not res!984395) (not e!818636))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98533 (_ BitVec 32)) SeekEntryResult!11700)

(assert (=> b!1454150 (= res!984395 (= (seekEntryOrOpen!0 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) (Found!11700 j!93)))))

(declare-fun b!1454151 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637536 () (_ BitVec 64))

(declare-fun e!818632 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637535 () array!98533)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98533 (_ BitVec 32)) SeekEntryResult!11700)

(assert (=> b!1454151 (= e!818632 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637536 lt!637535 mask!2687) (seekEntryOrOpen!0 lt!637536 lt!637535 mask!2687)))))

(declare-fun b!1454152 () Bool)

(declare-fun res!984408 () Bool)

(assert (=> b!1454152 (=> (not res!984408) (not e!818630))))

(assert (=> b!1454152 (= res!984408 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!637537))))

(declare-fun b!1454153 () Bool)

(declare-fun e!818634 () Bool)

(assert (=> b!1454153 (= e!818634 (validKeyInArray!0 lt!637536))))

(declare-fun res!984409 () Bool)

(assert (=> start!125190 (=> (not res!984409) (not e!818637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125190 (= res!984409 (validMask!0 mask!2687))))

(assert (=> start!125190 e!818637))

(assert (=> start!125190 true))

(declare-fun array_inv!36832 (array!98533) Bool)

(assert (=> start!125190 (array_inv!36832 a!2862)))

(declare-fun b!1454154 () Bool)

(declare-fun lt!637533 () SeekEntryResult!11700)

(assert (=> b!1454154 (= e!818632 (= lt!637533 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637536 lt!637535 mask!2687)))))

(declare-fun b!1454155 () Bool)

(declare-fun res!984403 () Bool)

(assert (=> b!1454155 (=> (not res!984403) (not e!818637))))

(declare-datatypes ((List!34039 0))(
  ( (Nil!34036) (Cons!34035 (h!35396 (_ BitVec 64)) (t!48725 List!34039)) )
))
(declare-fun arrayNoDuplicates!0 (array!98533 (_ BitVec 32) List!34039) Bool)

(assert (=> b!1454155 (= res!984403 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34036))))

(declare-fun b!1454156 () Bool)

(declare-fun e!818633 () Bool)

(assert (=> b!1454156 (= e!818633 (not e!818634))))

(declare-fun res!984398 () Bool)

(assert (=> b!1454156 (=> res!984398 e!818634)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454156 (= res!984398 (or (and (= (select (arr!47551 a!2862) index!646) (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47551 a!2862) index!646) (select (arr!47551 a!2862) j!93))) (= (select (arr!47551 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (=> b!1454156 e!818636))

(declare-fun res!984397 () Bool)

(assert (=> b!1454156 (=> (not res!984397) (not e!818636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98533 (_ BitVec 32)) Bool)

(assert (=> b!1454156 (= res!984397 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48929 0))(
  ( (Unit!48930) )
))
(declare-fun lt!637534 () Unit!48929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48929)

(assert (=> b!1454156 (= lt!637534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454157 () Bool)

(declare-fun res!984396 () Bool)

(assert (=> b!1454157 (=> (not res!984396) (not e!818633))))

(assert (=> b!1454157 (= res!984396 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454158 () Bool)

(declare-fun res!984410 () Bool)

(assert (=> b!1454158 (=> (not res!984410) (not e!818637))))

(assert (=> b!1454158 (= res!984410 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48102 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48102 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48102 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454159 () Bool)

(assert (=> b!1454159 (= e!818637 e!818635)))

(declare-fun res!984402 () Bool)

(assert (=> b!1454159 (=> (not res!984402) (not e!818635))))

(assert (=> b!1454159 (= res!984402 (= (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454159 (= lt!637535 (array!98534 (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48102 a!2862)))))

(declare-fun b!1454160 () Bool)

(declare-fun res!984401 () Bool)

(assert (=> b!1454160 (=> (not res!984401) (not e!818637))))

(assert (=> b!1454160 (= res!984401 (and (= (size!48102 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48102 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48102 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454161 () Bool)

(assert (=> b!1454161 (= e!818630 e!818633)))

(declare-fun res!984405 () Bool)

(assert (=> b!1454161 (=> (not res!984405) (not e!818633))))

(assert (=> b!1454161 (= res!984405 (= lt!637533 (Intermediate!11700 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454161 (= lt!637533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637536 mask!2687) lt!637536 lt!637535 mask!2687))))

(assert (=> b!1454161 (= lt!637536 (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454162 () Bool)

(declare-fun res!984399 () Bool)

(assert (=> b!1454162 (=> (not res!984399) (not e!818637))))

(assert (=> b!1454162 (= res!984399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454163 () Bool)

(declare-fun res!984404 () Bool)

(assert (=> b!1454163 (=> (not res!984404) (not e!818633))))

(assert (=> b!1454163 (= res!984404 e!818632)))

(declare-fun c!134395 () Bool)

(assert (=> b!1454163 (= c!134395 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454164 () Bool)

(assert (=> b!1454164 (= e!818636 (and (or (= (select (arr!47551 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47551 a!2862) intermediateBeforeIndex!19) (select (arr!47551 a!2862) j!93))) (or (and (= (select (arr!47551 a!2862) index!646) (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47551 a!2862) index!646) (select (arr!47551 a!2862) j!93))) (= (select (arr!47551 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!125190 res!984409) b!1454160))

(assert (= (and b!1454160 res!984401) b!1454147))

(assert (= (and b!1454147 res!984407) b!1454149))

(assert (= (and b!1454149 res!984400) b!1454162))

(assert (= (and b!1454162 res!984399) b!1454155))

(assert (= (and b!1454155 res!984403) b!1454158))

(assert (= (and b!1454158 res!984410) b!1454159))

(assert (= (and b!1454159 res!984402) b!1454148))

(assert (= (and b!1454148 res!984406) b!1454152))

(assert (= (and b!1454152 res!984408) b!1454161))

(assert (= (and b!1454161 res!984405) b!1454163))

(assert (= (and b!1454163 c!134395) b!1454154))

(assert (= (and b!1454163 (not c!134395)) b!1454151))

(assert (= (and b!1454163 res!984404) b!1454157))

(assert (= (and b!1454157 res!984396) b!1454156))

(assert (= (and b!1454156 res!984397) b!1454150))

(assert (= (and b!1454150 res!984395) b!1454164))

(assert (= (and b!1454156 (not res!984398)) b!1454153))

(declare-fun m!1342825 () Bool)

(assert (=> b!1454147 m!1342825))

(assert (=> b!1454147 m!1342825))

(declare-fun m!1342827 () Bool)

(assert (=> b!1454147 m!1342827))

(declare-fun m!1342829 () Bool)

(assert (=> b!1454151 m!1342829))

(declare-fun m!1342831 () Bool)

(assert (=> b!1454151 m!1342831))

(declare-fun m!1342833 () Bool)

(assert (=> b!1454164 m!1342833))

(declare-fun m!1342835 () Bool)

(assert (=> b!1454164 m!1342835))

(declare-fun m!1342837 () Bool)

(assert (=> b!1454164 m!1342837))

(declare-fun m!1342839 () Bool)

(assert (=> b!1454164 m!1342839))

(declare-fun m!1342841 () Bool)

(assert (=> b!1454164 m!1342841))

(assert (=> b!1454149 m!1342841))

(assert (=> b!1454149 m!1342841))

(declare-fun m!1342843 () Bool)

(assert (=> b!1454149 m!1342843))

(declare-fun m!1342845 () Bool)

(assert (=> b!1454153 m!1342845))

(declare-fun m!1342847 () Bool)

(assert (=> b!1454162 m!1342847))

(assert (=> b!1454159 m!1342833))

(declare-fun m!1342849 () Bool)

(assert (=> b!1454159 m!1342849))

(assert (=> b!1454148 m!1342841))

(assert (=> b!1454148 m!1342841))

(declare-fun m!1342851 () Bool)

(assert (=> b!1454148 m!1342851))

(assert (=> b!1454148 m!1342851))

(assert (=> b!1454148 m!1342841))

(declare-fun m!1342853 () Bool)

(assert (=> b!1454148 m!1342853))

(declare-fun m!1342855 () Bool)

(assert (=> b!1454155 m!1342855))

(declare-fun m!1342857 () Bool)

(assert (=> start!125190 m!1342857))

(declare-fun m!1342859 () Bool)

(assert (=> start!125190 m!1342859))

(declare-fun m!1342861 () Bool)

(assert (=> b!1454156 m!1342861))

(assert (=> b!1454156 m!1342833))

(assert (=> b!1454156 m!1342837))

(assert (=> b!1454156 m!1342839))

(declare-fun m!1342863 () Bool)

(assert (=> b!1454156 m!1342863))

(assert (=> b!1454156 m!1342841))

(declare-fun m!1342865 () Bool)

(assert (=> b!1454161 m!1342865))

(assert (=> b!1454161 m!1342865))

(declare-fun m!1342867 () Bool)

(assert (=> b!1454161 m!1342867))

(assert (=> b!1454161 m!1342833))

(declare-fun m!1342869 () Bool)

(assert (=> b!1454161 m!1342869))

(assert (=> b!1454152 m!1342841))

(assert (=> b!1454152 m!1342841))

(declare-fun m!1342871 () Bool)

(assert (=> b!1454152 m!1342871))

(assert (=> b!1454150 m!1342841))

(assert (=> b!1454150 m!1342841))

(declare-fun m!1342873 () Bool)

(assert (=> b!1454150 m!1342873))

(declare-fun m!1342875 () Bool)

(assert (=> b!1454154 m!1342875))

(check-sat (not b!1454152) (not b!1454153) (not b!1454162) (not b!1454161) (not b!1454148) (not b!1454156) (not b!1454147) (not b!1454155) (not b!1454151) (not b!1454150) (not start!125190) (not b!1454149) (not b!1454154))
(check-sat)
