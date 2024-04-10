; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125234 () Bool)

(assert start!125234)

(declare-fun b!1461195 () Bool)

(declare-fun res!990857 () Bool)

(declare-fun e!821503 () Bool)

(assert (=> b!1461195 (=> res!990857 e!821503)))

(declare-fun lt!640059 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11881 0))(
  ( (MissingZero!11881 (index!49916 (_ BitVec 32))) (Found!11881 (index!49917 (_ BitVec 32))) (Intermediate!11881 (undefined!12693 Bool) (index!49918 (_ BitVec 32)) (x!131514 (_ BitVec 32))) (Undefined!11881) (MissingVacant!11881 (index!49919 (_ BitVec 32))) )
))
(declare-fun lt!640058 () SeekEntryResult!11881)

(declare-datatypes ((array!98682 0))(
  ( (array!98683 (arr!47629 (Array (_ BitVec 32) (_ BitVec 64))) (size!48179 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98682)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98682 (_ BitVec 32)) SeekEntryResult!11881)

(assert (=> b!1461195 (= res!990857 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640059 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!640058)))))

(declare-fun res!990867 () Bool)

(declare-fun e!821505 () Bool)

(assert (=> start!125234 (=> (not res!990867) (not e!821505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125234 (= res!990867 (validMask!0 mask!2687))))

(assert (=> start!125234 e!821505))

(assert (=> start!125234 true))

(declare-fun array_inv!36657 (array!98682) Bool)

(assert (=> start!125234 (array_inv!36657 a!2862)))

(declare-fun b!1461196 () Bool)

(declare-fun res!990870 () Bool)

(assert (=> b!1461196 (=> (not res!990870) (not e!821505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98682 (_ BitVec 32)) Bool)

(assert (=> b!1461196 (= res!990870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461197 () Bool)

(declare-fun res!990856 () Bool)

(assert (=> b!1461197 (=> (not res!990856) (not e!821505))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461197 (= res!990856 (validKeyInArray!0 (select (arr!47629 a!2862) i!1006)))))

(declare-fun b!1461198 () Bool)

(declare-fun e!821507 () Bool)

(declare-fun e!821502 () Bool)

(assert (=> b!1461198 (= e!821507 e!821502)))

(declare-fun res!990858 () Bool)

(assert (=> b!1461198 (=> (not res!990858) (not e!821502))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461198 (= res!990858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47629 a!2862) j!93) mask!2687) (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!640058))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461198 (= lt!640058 (Intermediate!11881 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461199 () Bool)

(assert (=> b!1461199 (= e!821505 e!821507)))

(declare-fun res!990868 () Bool)

(assert (=> b!1461199 (=> (not res!990868) (not e!821507))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461199 (= res!990868 (= (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640055 () array!98682)

(assert (=> b!1461199 (= lt!640055 (array!98683 (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48179 a!2862)))))

(declare-fun lt!640053 () SeekEntryResult!11881)

(declare-fun lt!640054 () (_ BitVec 64))

(declare-fun e!821501 () Bool)

(declare-fun b!1461200 () Bool)

(assert (=> b!1461200 (= e!821501 (not (= lt!640053 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640059 lt!640054 lt!640055 mask!2687))))))

(declare-fun b!1461201 () Bool)

(declare-fun e!821508 () Bool)

(assert (=> b!1461201 (= e!821502 e!821508)))

(declare-fun res!990860 () Bool)

(assert (=> b!1461201 (=> (not res!990860) (not e!821508))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461201 (= res!990860 (= lt!640053 (Intermediate!11881 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461201 (= lt!640053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640054 mask!2687) lt!640054 lt!640055 mask!2687))))

(assert (=> b!1461201 (= lt!640054 (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461202 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98682 (_ BitVec 32)) SeekEntryResult!11881)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98682 (_ BitVec 32)) SeekEntryResult!11881)

(assert (=> b!1461202 (= e!821501 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640059 intermediateAfterIndex!19 lt!640054 lt!640055 mask!2687) (seekEntryOrOpen!0 lt!640054 lt!640055 mask!2687))))))

(declare-fun b!1461203 () Bool)

(declare-fun res!990871 () Bool)

(assert (=> b!1461203 (=> (not res!990871) (not e!821505))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1461203 (= res!990871 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48179 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48179 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48179 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!821509 () Bool)

(declare-fun b!1461204 () Bool)

(assert (=> b!1461204 (= e!821509 (or (= (select (arr!47629 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47629 a!2862) intermediateBeforeIndex!19) (select (arr!47629 a!2862) j!93))))))

(declare-fun b!1461205 () Bool)

(declare-fun res!990865 () Bool)

(assert (=> b!1461205 (=> (not res!990865) (not e!821505))))

(assert (=> b!1461205 (= res!990865 (validKeyInArray!0 (select (arr!47629 a!2862) j!93)))))

(declare-fun e!821510 () Bool)

(declare-fun b!1461206 () Bool)

(assert (=> b!1461206 (= e!821510 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640054 lt!640055 mask!2687) (seekEntryOrOpen!0 lt!640054 lt!640055 mask!2687)))))

(declare-fun b!1461207 () Bool)

(assert (=> b!1461207 (= e!821510 (= lt!640053 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640054 lt!640055 mask!2687)))))

(declare-fun b!1461208 () Bool)

(declare-fun e!821506 () Bool)

(assert (=> b!1461208 (= e!821506 e!821503)))

(declare-fun res!990864 () Bool)

(assert (=> b!1461208 (=> res!990864 e!821503)))

(assert (=> b!1461208 (= res!990864 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640059 #b00000000000000000000000000000000) (bvsge lt!640059 (size!48179 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461208 (= lt!640059 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461209 () Bool)

(declare-fun res!990855 () Bool)

(assert (=> b!1461209 (=> (not res!990855) (not e!821505))))

(declare-datatypes ((List!34130 0))(
  ( (Nil!34127) (Cons!34126 (h!35476 (_ BitVec 64)) (t!48824 List!34130)) )
))
(declare-fun arrayNoDuplicates!0 (array!98682 (_ BitVec 32) List!34130) Bool)

(assert (=> b!1461209 (= res!990855 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34127))))

(declare-fun b!1461210 () Bool)

(assert (=> b!1461210 (= e!821508 (not e!821506))))

(declare-fun res!990866 () Bool)

(assert (=> b!1461210 (=> res!990866 e!821506)))

(assert (=> b!1461210 (= res!990866 (or (and (= (select (arr!47629 a!2862) index!646) (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47629 a!2862) index!646) (select (arr!47629 a!2862) j!93))) (= (select (arr!47629 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461210 e!821509))

(declare-fun res!990859 () Bool)

(assert (=> b!1461210 (=> (not res!990859) (not e!821509))))

(assert (=> b!1461210 (= res!990859 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49258 0))(
  ( (Unit!49259) )
))
(declare-fun lt!640057 () Unit!49258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49258)

(assert (=> b!1461210 (= lt!640057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461211 () Bool)

(declare-fun res!990862 () Bool)

(assert (=> b!1461211 (=> (not res!990862) (not e!821502))))

(assert (=> b!1461211 (= res!990862 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!640058))))

(declare-fun b!1461212 () Bool)

(assert (=> b!1461212 (= e!821503 true)))

(declare-fun lt!640056 () Bool)

(assert (=> b!1461212 (= lt!640056 e!821501)))

(declare-fun c!134681 () Bool)

(assert (=> b!1461212 (= c!134681 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461213 () Bool)

(declare-fun res!990854 () Bool)

(assert (=> b!1461213 (=> (not res!990854) (not e!821509))))

(assert (=> b!1461213 (= res!990854 (= (seekEntryOrOpen!0 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) (Found!11881 j!93)))))

(declare-fun b!1461214 () Bool)

(declare-fun res!990869 () Bool)

(assert (=> b!1461214 (=> (not res!990869) (not e!821508))))

(assert (=> b!1461214 (= res!990869 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461215 () Bool)

(declare-fun res!990861 () Bool)

(assert (=> b!1461215 (=> (not res!990861) (not e!821508))))

(assert (=> b!1461215 (= res!990861 e!821510)))

(declare-fun c!134682 () Bool)

(assert (=> b!1461215 (= c!134682 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461216 () Bool)

(declare-fun res!990863 () Bool)

(assert (=> b!1461216 (=> (not res!990863) (not e!821505))))

(assert (=> b!1461216 (= res!990863 (and (= (size!48179 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48179 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48179 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125234 res!990867) b!1461216))

(assert (= (and b!1461216 res!990863) b!1461197))

(assert (= (and b!1461197 res!990856) b!1461205))

(assert (= (and b!1461205 res!990865) b!1461196))

(assert (= (and b!1461196 res!990870) b!1461209))

(assert (= (and b!1461209 res!990855) b!1461203))

(assert (= (and b!1461203 res!990871) b!1461199))

(assert (= (and b!1461199 res!990868) b!1461198))

(assert (= (and b!1461198 res!990858) b!1461211))

(assert (= (and b!1461211 res!990862) b!1461201))

(assert (= (and b!1461201 res!990860) b!1461215))

(assert (= (and b!1461215 c!134682) b!1461207))

(assert (= (and b!1461215 (not c!134682)) b!1461206))

(assert (= (and b!1461215 res!990861) b!1461214))

(assert (= (and b!1461214 res!990869) b!1461210))

(assert (= (and b!1461210 res!990859) b!1461213))

(assert (= (and b!1461213 res!990854) b!1461204))

(assert (= (and b!1461210 (not res!990866)) b!1461208))

(assert (= (and b!1461208 (not res!990864)) b!1461195))

(assert (= (and b!1461195 (not res!990857)) b!1461212))

(assert (= (and b!1461212 c!134681) b!1461200))

(assert (= (and b!1461212 (not c!134681)) b!1461202))

(declare-fun m!1348803 () Bool)

(assert (=> b!1461198 m!1348803))

(assert (=> b!1461198 m!1348803))

(declare-fun m!1348805 () Bool)

(assert (=> b!1461198 m!1348805))

(assert (=> b!1461198 m!1348805))

(assert (=> b!1461198 m!1348803))

(declare-fun m!1348807 () Bool)

(assert (=> b!1461198 m!1348807))

(assert (=> b!1461195 m!1348803))

(assert (=> b!1461195 m!1348803))

(declare-fun m!1348809 () Bool)

(assert (=> b!1461195 m!1348809))

(declare-fun m!1348811 () Bool)

(assert (=> b!1461204 m!1348811))

(assert (=> b!1461204 m!1348803))

(declare-fun m!1348813 () Bool)

(assert (=> b!1461201 m!1348813))

(assert (=> b!1461201 m!1348813))

(declare-fun m!1348815 () Bool)

(assert (=> b!1461201 m!1348815))

(declare-fun m!1348817 () Bool)

(assert (=> b!1461201 m!1348817))

(declare-fun m!1348819 () Bool)

(assert (=> b!1461201 m!1348819))

(declare-fun m!1348821 () Bool)

(assert (=> start!125234 m!1348821))

(declare-fun m!1348823 () Bool)

(assert (=> start!125234 m!1348823))

(declare-fun m!1348825 () Bool)

(assert (=> b!1461210 m!1348825))

(assert (=> b!1461210 m!1348817))

(declare-fun m!1348827 () Bool)

(assert (=> b!1461210 m!1348827))

(declare-fun m!1348829 () Bool)

(assert (=> b!1461210 m!1348829))

(declare-fun m!1348831 () Bool)

(assert (=> b!1461210 m!1348831))

(assert (=> b!1461210 m!1348803))

(declare-fun m!1348833 () Bool)

(assert (=> b!1461207 m!1348833))

(assert (=> b!1461213 m!1348803))

(assert (=> b!1461213 m!1348803))

(declare-fun m!1348835 () Bool)

(assert (=> b!1461213 m!1348835))

(declare-fun m!1348837 () Bool)

(assert (=> b!1461196 m!1348837))

(declare-fun m!1348839 () Bool)

(assert (=> b!1461197 m!1348839))

(assert (=> b!1461197 m!1348839))

(declare-fun m!1348841 () Bool)

(assert (=> b!1461197 m!1348841))

(assert (=> b!1461199 m!1348817))

(declare-fun m!1348843 () Bool)

(assert (=> b!1461199 m!1348843))

(assert (=> b!1461205 m!1348803))

(assert (=> b!1461205 m!1348803))

(declare-fun m!1348845 () Bool)

(assert (=> b!1461205 m!1348845))

(declare-fun m!1348847 () Bool)

(assert (=> b!1461202 m!1348847))

(declare-fun m!1348849 () Bool)

(assert (=> b!1461202 m!1348849))

(declare-fun m!1348851 () Bool)

(assert (=> b!1461208 m!1348851))

(assert (=> b!1461211 m!1348803))

(assert (=> b!1461211 m!1348803))

(declare-fun m!1348853 () Bool)

(assert (=> b!1461211 m!1348853))

(declare-fun m!1348855 () Bool)

(assert (=> b!1461209 m!1348855))

(declare-fun m!1348857 () Bool)

(assert (=> b!1461206 m!1348857))

(assert (=> b!1461206 m!1348849))

(declare-fun m!1348859 () Bool)

(assert (=> b!1461200 m!1348859))

(push 1)

