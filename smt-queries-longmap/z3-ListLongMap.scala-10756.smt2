; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126072 () Bool)

(assert start!126072)

(declare-fun b!1474125 () Bool)

(declare-fun res!1000696 () Bool)

(declare-fun e!827409 () Bool)

(assert (=> b!1474125 (=> (not res!1000696) (not e!827409))))

(declare-datatypes ((array!99244 0))(
  ( (array!99245 (arr!47902 (Array (_ BitVec 32) (_ BitVec 64))) (size!48453 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99244)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474125 (= res!1000696 (validKeyInArray!0 (select (arr!47902 a!2862) j!93)))))

(declare-fun b!1474126 () Bool)

(declare-fun e!827408 () Bool)

(declare-fun e!827406 () Bool)

(assert (=> b!1474126 (= e!827408 e!827406)))

(declare-fun res!1000692 () Bool)

(assert (=> b!1474126 (=> (not res!1000692) (not e!827406))))

(declare-datatypes ((SeekEntryResult!12039 0))(
  ( (MissingZero!12039 (index!50548 (_ BitVec 32))) (Found!12039 (index!50549 (_ BitVec 32))) (Intermediate!12039 (undefined!12851 Bool) (index!50550 (_ BitVec 32)) (x!132315 (_ BitVec 32))) (Undefined!12039) (MissingVacant!12039 (index!50551 (_ BitVec 32))) )
))
(declare-fun lt!644202 () SeekEntryResult!12039)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12039)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474126 (= res!1000692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47902 a!2862) j!93) mask!2687) (select (arr!47902 a!2862) j!93) a!2862 mask!2687) lt!644202))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474126 (= lt!644202 (Intermediate!12039 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474127 () Bool)

(declare-fun e!827404 () Bool)

(assert (=> b!1474127 (= e!827404 (or (= (select (arr!47902 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47902 a!2862) intermediateBeforeIndex!19) (select (arr!47902 a!2862) j!93))))))

(declare-fun b!1474128 () Bool)

(declare-fun res!1000703 () Bool)

(assert (=> b!1474128 (=> (not res!1000703) (not e!827409))))

(declare-datatypes ((List!34390 0))(
  ( (Nil!34387) (Cons!34386 (h!35756 (_ BitVec 64)) (t!49076 List!34390)) )
))
(declare-fun arrayNoDuplicates!0 (array!99244 (_ BitVec 32) List!34390) Bool)

(assert (=> b!1474128 (= res!1000703 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34387))))

(declare-fun b!1474129 () Bool)

(declare-fun res!1000693 () Bool)

(assert (=> b!1474129 (=> (not res!1000693) (not e!827409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99244 (_ BitVec 32)) Bool)

(assert (=> b!1474129 (= res!1000693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1000695 () Bool)

(assert (=> start!126072 (=> (not res!1000695) (not e!827409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126072 (= res!1000695 (validMask!0 mask!2687))))

(assert (=> start!126072 e!827409))

(assert (=> start!126072 true))

(declare-fun array_inv!37183 (array!99244) Bool)

(assert (=> start!126072 (array_inv!37183 a!2862)))

(declare-fun b!1474130 () Bool)

(declare-fun res!1000697 () Bool)

(assert (=> b!1474130 (=> (not res!1000697) (not e!827406))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1474130 (= res!1000697 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47902 a!2862) j!93) a!2862 mask!2687) lt!644202))))

(declare-fun b!1474131 () Bool)

(declare-fun res!1000701 () Bool)

(assert (=> b!1474131 (=> (not res!1000701) (not e!827409))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474131 (= res!1000701 (and (= (size!48453 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48453 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48453 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474132 () Bool)

(declare-fun res!1000700 () Bool)

(assert (=> b!1474132 (=> (not res!1000700) (not e!827409))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474132 (= res!1000700 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48453 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48453 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48453 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474133 () Bool)

(declare-fun res!1000702 () Bool)

(assert (=> b!1474133 (=> (not res!1000702) (not e!827404))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12039)

(assert (=> b!1474133 (= res!1000702 (= (seekEntryOrOpen!0 (select (arr!47902 a!2862) j!93) a!2862 mask!2687) (Found!12039 j!93)))))

(declare-fun b!1474134 () Bool)

(declare-fun e!827403 () Bool)

(assert (=> b!1474134 (= e!827406 e!827403)))

(declare-fun res!1000706 () Bool)

(assert (=> b!1474134 (=> (not res!1000706) (not e!827403))))

(declare-fun lt!644206 () SeekEntryResult!12039)

(assert (=> b!1474134 (= res!1000706 (= lt!644206 (Intermediate!12039 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644203 () array!99244)

(declare-fun lt!644204 () (_ BitVec 64))

(assert (=> b!1474134 (= lt!644206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644204 mask!2687) lt!644204 lt!644203 mask!2687))))

(assert (=> b!1474134 (= lt!644204 (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474135 () Bool)

(assert (=> b!1474135 (= e!827409 e!827408)))

(declare-fun res!1000694 () Bool)

(assert (=> b!1474135 (=> (not res!1000694) (not e!827408))))

(assert (=> b!1474135 (= res!1000694 (= (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474135 (= lt!644203 (array!99245 (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48453 a!2862)))))

(declare-fun b!1474136 () Bool)

(declare-fun res!1000698 () Bool)

(assert (=> b!1474136 (=> (not res!1000698) (not e!827409))))

(assert (=> b!1474136 (= res!1000698 (validKeyInArray!0 (select (arr!47902 a!2862) i!1006)))))

(declare-fun b!1474137 () Bool)

(declare-fun res!1000704 () Bool)

(assert (=> b!1474137 (=> (not res!1000704) (not e!827403))))

(assert (=> b!1474137 (= res!1000704 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474138 () Bool)

(declare-fun res!1000699 () Bool)

(assert (=> b!1474138 (=> (not res!1000699) (not e!827403))))

(declare-fun e!827407 () Bool)

(assert (=> b!1474138 (= res!1000699 e!827407)))

(declare-fun c!136240 () Bool)

(assert (=> b!1474138 (= c!136240 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474139 () Bool)

(assert (=> b!1474139 (= e!827407 (= lt!644206 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644204 lt!644203 mask!2687)))))

(declare-fun b!1474140 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12039)

(assert (=> b!1474140 (= e!827407 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644204 lt!644203 mask!2687) (seekEntryOrOpen!0 lt!644204 lt!644203 mask!2687)))))

(declare-fun b!1474141 () Bool)

(assert (=> b!1474141 (= e!827403 (not true))))

(assert (=> b!1474141 e!827404))

(declare-fun res!1000705 () Bool)

(assert (=> b!1474141 (=> (not res!1000705) (not e!827404))))

(assert (=> b!1474141 (= res!1000705 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49451 0))(
  ( (Unit!49452) )
))
(declare-fun lt!644205 () Unit!49451)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49451)

(assert (=> b!1474141 (= lt!644205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126072 res!1000695) b!1474131))

(assert (= (and b!1474131 res!1000701) b!1474136))

(assert (= (and b!1474136 res!1000698) b!1474125))

(assert (= (and b!1474125 res!1000696) b!1474129))

(assert (= (and b!1474129 res!1000693) b!1474128))

(assert (= (and b!1474128 res!1000703) b!1474132))

(assert (= (and b!1474132 res!1000700) b!1474135))

(assert (= (and b!1474135 res!1000694) b!1474126))

(assert (= (and b!1474126 res!1000692) b!1474130))

(assert (= (and b!1474130 res!1000697) b!1474134))

(assert (= (and b!1474134 res!1000706) b!1474138))

(assert (= (and b!1474138 c!136240) b!1474139))

(assert (= (and b!1474138 (not c!136240)) b!1474140))

(assert (= (and b!1474138 res!1000699) b!1474137))

(assert (= (and b!1474137 res!1000704) b!1474141))

(assert (= (and b!1474141 res!1000705) b!1474133))

(assert (= (and b!1474133 res!1000702) b!1474127))

(declare-fun m!1360819 () Bool)

(assert (=> b!1474135 m!1360819))

(declare-fun m!1360821 () Bool)

(assert (=> b!1474135 m!1360821))

(declare-fun m!1360823 () Bool)

(assert (=> start!126072 m!1360823))

(declare-fun m!1360825 () Bool)

(assert (=> start!126072 m!1360825))

(declare-fun m!1360827 () Bool)

(assert (=> b!1474128 m!1360827))

(declare-fun m!1360829 () Bool)

(assert (=> b!1474141 m!1360829))

(declare-fun m!1360831 () Bool)

(assert (=> b!1474141 m!1360831))

(declare-fun m!1360833 () Bool)

(assert (=> b!1474140 m!1360833))

(declare-fun m!1360835 () Bool)

(assert (=> b!1474140 m!1360835))

(declare-fun m!1360837 () Bool)

(assert (=> b!1474134 m!1360837))

(assert (=> b!1474134 m!1360837))

(declare-fun m!1360839 () Bool)

(assert (=> b!1474134 m!1360839))

(assert (=> b!1474134 m!1360819))

(declare-fun m!1360841 () Bool)

(assert (=> b!1474134 m!1360841))

(declare-fun m!1360843 () Bool)

(assert (=> b!1474139 m!1360843))

(declare-fun m!1360845 () Bool)

(assert (=> b!1474126 m!1360845))

(assert (=> b!1474126 m!1360845))

(declare-fun m!1360847 () Bool)

(assert (=> b!1474126 m!1360847))

(assert (=> b!1474126 m!1360847))

(assert (=> b!1474126 m!1360845))

(declare-fun m!1360849 () Bool)

(assert (=> b!1474126 m!1360849))

(assert (=> b!1474130 m!1360845))

(assert (=> b!1474130 m!1360845))

(declare-fun m!1360851 () Bool)

(assert (=> b!1474130 m!1360851))

(assert (=> b!1474133 m!1360845))

(assert (=> b!1474133 m!1360845))

(declare-fun m!1360853 () Bool)

(assert (=> b!1474133 m!1360853))

(declare-fun m!1360855 () Bool)

(assert (=> b!1474127 m!1360855))

(assert (=> b!1474127 m!1360845))

(assert (=> b!1474125 m!1360845))

(assert (=> b!1474125 m!1360845))

(declare-fun m!1360857 () Bool)

(assert (=> b!1474125 m!1360857))

(declare-fun m!1360859 () Bool)

(assert (=> b!1474136 m!1360859))

(assert (=> b!1474136 m!1360859))

(declare-fun m!1360861 () Bool)

(assert (=> b!1474136 m!1360861))

(declare-fun m!1360863 () Bool)

(assert (=> b!1474129 m!1360863))

(check-sat (not start!126072) (not b!1474133) (not b!1474140) (not b!1474134) (not b!1474139) (not b!1474136) (not b!1474141) (not b!1474130) (not b!1474128) (not b!1474126) (not b!1474125) (not b!1474129))
(check-sat)
