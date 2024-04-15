; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125104 () Bool)

(assert start!125104)

(declare-datatypes ((array!98530 0))(
  ( (array!98531 (arr!47554 (Array (_ BitVec 32) (_ BitVec 64))) (size!48106 (_ BitVec 32))) )
))
(declare-fun lt!638678 () array!98530)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!820063 () Bool)

(declare-fun b!1457871 () Bool)

(declare-datatypes ((SeekEntryResult!11831 0))(
  ( (MissingZero!11831 (index!49716 (_ BitVec 32))) (Found!11831 (index!49717 (_ BitVec 32))) (Intermediate!11831 (undefined!12643 Bool) (index!49718 (_ BitVec 32)) (x!131331 (_ BitVec 32))) (Undefined!11831) (MissingVacant!11831 (index!49719 (_ BitVec 32))) )
))
(declare-fun lt!638673 () SeekEntryResult!11831)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638672 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98530 (_ BitVec 32)) SeekEntryResult!11831)

(assert (=> b!1457871 (= e!820063 (= lt!638673 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638672 lt!638678 mask!2687)))))

(declare-fun b!1457872 () Bool)

(declare-fun res!988180 () Bool)

(declare-fun e!820059 () Bool)

(assert (=> b!1457872 (=> (not res!988180) (not e!820059))))

(declare-fun a!2862 () array!98530)

(declare-datatypes ((List!34133 0))(
  ( (Nil!34130) (Cons!34129 (h!35479 (_ BitVec 64)) (t!48819 List!34133)) )
))
(declare-fun arrayNoDuplicates!0 (array!98530 (_ BitVec 32) List!34133) Bool)

(assert (=> b!1457872 (= res!988180 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34130))))

(declare-fun b!1457873 () Bool)

(declare-fun res!988186 () Bool)

(assert (=> b!1457873 (=> (not res!988186) (not e!820059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98530 (_ BitVec 32)) Bool)

(assert (=> b!1457873 (= res!988186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457874 () Bool)

(declare-fun e!820056 () Bool)

(declare-fun e!820060 () Bool)

(assert (=> b!1457874 (= e!820056 (not e!820060))))

(declare-fun res!988175 () Bool)

(assert (=> b!1457874 (=> res!988175 e!820060)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457874 (= res!988175 (or (and (= (select (arr!47554 a!2862) index!646) (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47554 a!2862) index!646) (select (arr!47554 a!2862) j!93))) (= (select (arr!47554 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820065 () Bool)

(assert (=> b!1457874 e!820065))

(declare-fun res!988192 () Bool)

(assert (=> b!1457874 (=> (not res!988192) (not e!820065))))

(assert (=> b!1457874 (= res!988192 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48999 0))(
  ( (Unit!49000) )
))
(declare-fun lt!638675 () Unit!48999)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48999)

(assert (=> b!1457874 (= lt!638675 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457875 () Bool)

(declare-fun e!820057 () Bool)

(assert (=> b!1457875 (= e!820060 e!820057)))

(declare-fun res!988178 () Bool)

(assert (=> b!1457875 (=> res!988178 e!820057)))

(declare-fun lt!638679 () (_ BitVec 32))

(assert (=> b!1457875 (= res!988178 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638679 #b00000000000000000000000000000000) (bvsge lt!638679 (size!48106 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457875 (= lt!638679 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638674 () SeekEntryResult!11831)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98530 (_ BitVec 32)) SeekEntryResult!11831)

(assert (=> b!1457875 (= lt!638674 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638672 lt!638678 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98530 (_ BitVec 32)) SeekEntryResult!11831)

(assert (=> b!1457875 (= lt!638674 (seekEntryOrOpen!0 lt!638672 lt!638678 mask!2687))))

(declare-fun b!1457876 () Bool)

(assert (=> b!1457876 (= e!820057 true)))

(declare-fun lt!638676 () Bool)

(declare-fun e!820062 () Bool)

(assert (=> b!1457876 (= lt!638676 e!820062)))

(declare-fun c!134361 () Bool)

(assert (=> b!1457876 (= c!134361 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457877 () Bool)

(declare-fun res!988190 () Bool)

(assert (=> b!1457877 (=> (not res!988190) (not e!820056))))

(assert (=> b!1457877 (= res!988190 e!820063)))

(declare-fun c!134362 () Bool)

(assert (=> b!1457877 (= c!134362 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457878 () Bool)

(declare-fun res!988187 () Bool)

(declare-fun e!820058 () Bool)

(assert (=> b!1457878 (=> (not res!988187) (not e!820058))))

(declare-fun lt!638677 () SeekEntryResult!11831)

(assert (=> b!1457878 (= res!988187 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!638677))))

(declare-fun b!1457879 () Bool)

(assert (=> b!1457879 (= e!820062 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638679 intermediateAfterIndex!19 lt!638672 lt!638678 mask!2687) lt!638674)))))

(declare-fun b!1457880 () Bool)

(assert (=> b!1457880 (= e!820063 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638672 lt!638678 mask!2687) (seekEntryOrOpen!0 lt!638672 lt!638678 mask!2687)))))

(declare-fun b!1457882 () Bool)

(assert (=> b!1457882 (= e!820058 e!820056)))

(declare-fun res!988182 () Bool)

(assert (=> b!1457882 (=> (not res!988182) (not e!820056))))

(assert (=> b!1457882 (= res!988182 (= lt!638673 (Intermediate!11831 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457882 (= lt!638673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638672 mask!2687) lt!638672 lt!638678 mask!2687))))

(assert (=> b!1457882 (= lt!638672 (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457883 () Bool)

(assert (=> b!1457883 (= e!820062 (not (= lt!638673 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638679 lt!638672 lt!638678 mask!2687))))))

(declare-fun b!1457884 () Bool)

(declare-fun res!988176 () Bool)

(assert (=> b!1457884 (=> (not res!988176) (not e!820059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457884 (= res!988176 (validKeyInArray!0 (select (arr!47554 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1457885 () Bool)

(assert (=> b!1457885 (= e!820065 (and (or (= (select (arr!47554 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47554 a!2862) intermediateBeforeIndex!19) (select (arr!47554 a!2862) j!93))) (let ((bdg!53395 (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47554 a!2862) index!646) bdg!53395) (= (select (arr!47554 a!2862) index!646) (select (arr!47554 a!2862) j!93))) (= (select (arr!47554 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53395 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457886 () Bool)

(declare-fun e!820061 () Bool)

(assert (=> b!1457886 (= e!820059 e!820061)))

(declare-fun res!988188 () Bool)

(assert (=> b!1457886 (=> (not res!988188) (not e!820061))))

(assert (=> b!1457886 (= res!988188 (= (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457886 (= lt!638678 (array!98531 (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48106 a!2862)))))

(declare-fun b!1457887 () Bool)

(declare-fun res!988191 () Bool)

(assert (=> b!1457887 (=> res!988191 e!820057)))

(assert (=> b!1457887 (= res!988191 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638679 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!638677)))))

(declare-fun b!1457888 () Bool)

(declare-fun res!988183 () Bool)

(assert (=> b!1457888 (=> (not res!988183) (not e!820059))))

(assert (=> b!1457888 (= res!988183 (validKeyInArray!0 (select (arr!47554 a!2862) j!93)))))

(declare-fun b!1457889 () Bool)

(declare-fun res!988185 () Bool)

(assert (=> b!1457889 (=> (not res!988185) (not e!820056))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457889 (= res!988185 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457890 () Bool)

(declare-fun res!988184 () Bool)

(assert (=> b!1457890 (=> (not res!988184) (not e!820059))))

(assert (=> b!1457890 (= res!988184 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48106 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48106 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48106 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457881 () Bool)

(declare-fun res!988177 () Bool)

(assert (=> b!1457881 (=> (not res!988177) (not e!820059))))

(assert (=> b!1457881 (= res!988177 (and (= (size!48106 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48106 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48106 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!988189 () Bool)

(assert (=> start!125104 (=> (not res!988189) (not e!820059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125104 (= res!988189 (validMask!0 mask!2687))))

(assert (=> start!125104 e!820059))

(assert (=> start!125104 true))

(declare-fun array_inv!36787 (array!98530) Bool)

(assert (=> start!125104 (array_inv!36787 a!2862)))

(declare-fun b!1457891 () Bool)

(assert (=> b!1457891 (= e!820061 e!820058)))

(declare-fun res!988179 () Bool)

(assert (=> b!1457891 (=> (not res!988179) (not e!820058))))

(assert (=> b!1457891 (= res!988179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47554 a!2862) j!93) mask!2687) (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!638677))))

(assert (=> b!1457891 (= lt!638677 (Intermediate!11831 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457892 () Bool)

(declare-fun res!988181 () Bool)

(assert (=> b!1457892 (=> (not res!988181) (not e!820065))))

(assert (=> b!1457892 (= res!988181 (= (seekEntryOrOpen!0 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) (Found!11831 j!93)))))

(assert (= (and start!125104 res!988189) b!1457881))

(assert (= (and b!1457881 res!988177) b!1457884))

(assert (= (and b!1457884 res!988176) b!1457888))

(assert (= (and b!1457888 res!988183) b!1457873))

(assert (= (and b!1457873 res!988186) b!1457872))

(assert (= (and b!1457872 res!988180) b!1457890))

(assert (= (and b!1457890 res!988184) b!1457886))

(assert (= (and b!1457886 res!988188) b!1457891))

(assert (= (and b!1457891 res!988179) b!1457878))

(assert (= (and b!1457878 res!988187) b!1457882))

(assert (= (and b!1457882 res!988182) b!1457877))

(assert (= (and b!1457877 c!134362) b!1457871))

(assert (= (and b!1457877 (not c!134362)) b!1457880))

(assert (= (and b!1457877 res!988190) b!1457889))

(assert (= (and b!1457889 res!988185) b!1457874))

(assert (= (and b!1457874 res!988192) b!1457892))

(assert (= (and b!1457892 res!988181) b!1457885))

(assert (= (and b!1457874 (not res!988175)) b!1457875))

(assert (= (and b!1457875 (not res!988178)) b!1457887))

(assert (= (and b!1457887 (not res!988191)) b!1457876))

(assert (= (and b!1457876 c!134361) b!1457883))

(assert (= (and b!1457876 (not c!134361)) b!1457879))

(declare-fun m!1345293 () Bool)

(assert (=> b!1457886 m!1345293))

(declare-fun m!1345295 () Bool)

(assert (=> b!1457886 m!1345295))

(declare-fun m!1345297 () Bool)

(assert (=> b!1457888 m!1345297))

(assert (=> b!1457888 m!1345297))

(declare-fun m!1345299 () Bool)

(assert (=> b!1457888 m!1345299))

(declare-fun m!1345301 () Bool)

(assert (=> b!1457875 m!1345301))

(declare-fun m!1345303 () Bool)

(assert (=> b!1457875 m!1345303))

(declare-fun m!1345305 () Bool)

(assert (=> b!1457875 m!1345305))

(assert (=> b!1457891 m!1345297))

(assert (=> b!1457891 m!1345297))

(declare-fun m!1345307 () Bool)

(assert (=> b!1457891 m!1345307))

(assert (=> b!1457891 m!1345307))

(assert (=> b!1457891 m!1345297))

(declare-fun m!1345309 () Bool)

(assert (=> b!1457891 m!1345309))

(assert (=> b!1457885 m!1345293))

(declare-fun m!1345311 () Bool)

(assert (=> b!1457885 m!1345311))

(declare-fun m!1345313 () Bool)

(assert (=> b!1457885 m!1345313))

(declare-fun m!1345315 () Bool)

(assert (=> b!1457885 m!1345315))

(assert (=> b!1457885 m!1345297))

(declare-fun m!1345317 () Bool)

(assert (=> b!1457884 m!1345317))

(assert (=> b!1457884 m!1345317))

(declare-fun m!1345319 () Bool)

(assert (=> b!1457884 m!1345319))

(declare-fun m!1345321 () Bool)

(assert (=> b!1457872 m!1345321))

(declare-fun m!1345323 () Bool)

(assert (=> b!1457883 m!1345323))

(assert (=> b!1457887 m!1345297))

(assert (=> b!1457887 m!1345297))

(declare-fun m!1345325 () Bool)

(assert (=> b!1457887 m!1345325))

(declare-fun m!1345327 () Bool)

(assert (=> b!1457879 m!1345327))

(declare-fun m!1345329 () Bool)

(assert (=> b!1457882 m!1345329))

(assert (=> b!1457882 m!1345329))

(declare-fun m!1345331 () Bool)

(assert (=> b!1457882 m!1345331))

(assert (=> b!1457882 m!1345293))

(declare-fun m!1345333 () Bool)

(assert (=> b!1457882 m!1345333))

(declare-fun m!1345335 () Bool)

(assert (=> b!1457873 m!1345335))

(assert (=> b!1457892 m!1345297))

(assert (=> b!1457892 m!1345297))

(declare-fun m!1345337 () Bool)

(assert (=> b!1457892 m!1345337))

(assert (=> b!1457880 m!1345303))

(assert (=> b!1457880 m!1345305))

(assert (=> b!1457878 m!1345297))

(assert (=> b!1457878 m!1345297))

(declare-fun m!1345339 () Bool)

(assert (=> b!1457878 m!1345339))

(declare-fun m!1345341 () Bool)

(assert (=> b!1457874 m!1345341))

(assert (=> b!1457874 m!1345293))

(assert (=> b!1457874 m!1345313))

(assert (=> b!1457874 m!1345315))

(declare-fun m!1345343 () Bool)

(assert (=> b!1457874 m!1345343))

(assert (=> b!1457874 m!1345297))

(declare-fun m!1345345 () Bool)

(assert (=> b!1457871 m!1345345))

(declare-fun m!1345347 () Bool)

(assert (=> start!125104 m!1345347))

(declare-fun m!1345349 () Bool)

(assert (=> start!125104 m!1345349))

(check-sat (not start!125104) (not b!1457878) (not b!1457891) (not b!1457871) (not b!1457884) (not b!1457883) (not b!1457874) (not b!1457875) (not b!1457892) (not b!1457873) (not b!1457872) (not b!1457879) (not b!1457882) (not b!1457888) (not b!1457880) (not b!1457887))
(check-sat)
