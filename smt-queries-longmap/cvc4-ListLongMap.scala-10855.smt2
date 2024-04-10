; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127112 () Bool)

(assert start!127112)

(declare-fun b!1494034 () Bool)

(declare-fun res!1016461 () Bool)

(declare-fun e!836890 () Bool)

(assert (=> b!1494034 (=> (not res!1016461) (not e!836890))))

(declare-fun e!836894 () Bool)

(assert (=> b!1494034 (= res!1016461 e!836894)))

(declare-fun c!138321 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494034 (= c!138321 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494035 () Bool)

(declare-fun res!1016457 () Bool)

(declare-fun e!836891 () Bool)

(assert (=> b!1494035 (=> (not res!1016457) (not e!836891))))

(declare-datatypes ((array!99759 0))(
  ( (array!99760 (arr!48148 (Array (_ BitVec 32) (_ BitVec 64))) (size!48698 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99759)

(declare-datatypes ((List!34649 0))(
  ( (Nil!34646) (Cons!34645 (h!36034 (_ BitVec 64)) (t!49343 List!34649)) )
))
(declare-fun arrayNoDuplicates!0 (array!99759 (_ BitVec 32) List!34649) Bool)

(assert (=> b!1494035 (= res!1016457 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34646))))

(declare-fun b!1494036 () Bool)

(declare-fun res!1016463 () Bool)

(assert (=> b!1494036 (=> (not res!1016463) (not e!836891))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99759 (_ BitVec 32)) Bool)

(assert (=> b!1494036 (= res!1016463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494037 () Bool)

(declare-fun e!836897 () Bool)

(assert (=> b!1494037 (= e!836890 (not e!836897))))

(declare-fun res!1016453 () Bool)

(assert (=> b!1494037 (=> res!1016453 e!836897)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494037 (= res!1016453 (or (and (= (select (arr!48148 a!2862) index!646) (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48148 a!2862) index!646) (select (arr!48148 a!2862) j!93))) (= (select (arr!48148 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836892 () Bool)

(assert (=> b!1494037 e!836892))

(declare-fun res!1016462 () Bool)

(assert (=> b!1494037 (=> (not res!1016462) (not e!836892))))

(assert (=> b!1494037 (= res!1016462 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50116 0))(
  ( (Unit!50117) )
))
(declare-fun lt!651227 () Unit!50116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50116)

(assert (=> b!1494037 (= lt!651227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494038 () Bool)

(declare-fun res!1016465 () Bool)

(assert (=> b!1494038 (=> (not res!1016465) (not e!836891))))

(assert (=> b!1494038 (= res!1016465 (and (= (size!48698 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48698 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48698 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494039 () Bool)

(assert (=> b!1494039 (= e!836897 true)))

(declare-fun lt!651225 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494039 (= lt!651225 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!651223 () array!99759)

(declare-fun lt!651224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12388 0))(
  ( (MissingZero!12388 (index!51944 (_ BitVec 32))) (Found!12388 (index!51945 (_ BitVec 32))) (Intermediate!12388 (undefined!13200 Bool) (index!51946 (_ BitVec 32)) (x!133540 (_ BitVec 32))) (Undefined!12388) (MissingVacant!12388 (index!51947 (_ BitVec 32))) )
))
(declare-fun lt!651228 () SeekEntryResult!12388)

(declare-fun b!1494040 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99759 (_ BitVec 32)) SeekEntryResult!12388)

(assert (=> b!1494040 (= e!836894 (= lt!651228 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651224 lt!651223 mask!2687)))))

(declare-fun b!1494041 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99759 (_ BitVec 32)) SeekEntryResult!12388)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99759 (_ BitVec 32)) SeekEntryResult!12388)

(assert (=> b!1494041 (= e!836894 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651224 lt!651223 mask!2687) (seekEntryOrOpen!0 lt!651224 lt!651223 mask!2687)))))

(declare-fun b!1494042 () Bool)

(declare-fun res!1016464 () Bool)

(assert (=> b!1494042 (=> (not res!1016464) (not e!836890))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494042 (= res!1016464 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494043 () Bool)

(declare-fun res!1016460 () Bool)

(assert (=> b!1494043 (=> (not res!1016460) (not e!836891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494043 (= res!1016460 (validKeyInArray!0 (select (arr!48148 a!2862) i!1006)))))

(declare-fun b!1494044 () Bool)

(declare-fun e!836893 () Bool)

(assert (=> b!1494044 (= e!836891 e!836893)))

(declare-fun res!1016466 () Bool)

(assert (=> b!1494044 (=> (not res!1016466) (not e!836893))))

(assert (=> b!1494044 (= res!1016466 (= (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494044 (= lt!651223 (array!99760 (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48698 a!2862)))))

(declare-fun b!1494045 () Bool)

(declare-fun res!1016459 () Bool)

(declare-fun e!836895 () Bool)

(assert (=> b!1494045 (=> (not res!1016459) (not e!836895))))

(declare-fun lt!651226 () SeekEntryResult!12388)

(assert (=> b!1494045 (= res!1016459 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!651226))))

(declare-fun b!1494046 () Bool)

(assert (=> b!1494046 (= e!836895 e!836890)))

(declare-fun res!1016456 () Bool)

(assert (=> b!1494046 (=> (not res!1016456) (not e!836890))))

(assert (=> b!1494046 (= res!1016456 (= lt!651228 (Intermediate!12388 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494046 (= lt!651228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651224 mask!2687) lt!651224 lt!651223 mask!2687))))

(assert (=> b!1494046 (= lt!651224 (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494047 () Bool)

(assert (=> b!1494047 (= e!836893 e!836895)))

(declare-fun res!1016458 () Bool)

(assert (=> b!1494047 (=> (not res!1016458) (not e!836895))))

(assert (=> b!1494047 (= res!1016458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48148 a!2862) j!93) mask!2687) (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!651226))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1494047 (= lt!651226 (Intermediate!12388 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494048 () Bool)

(declare-fun res!1016455 () Bool)

(assert (=> b!1494048 (=> (not res!1016455) (not e!836892))))

(assert (=> b!1494048 (= res!1016455 (= (seekEntryOrOpen!0 (select (arr!48148 a!2862) j!93) a!2862 mask!2687) (Found!12388 j!93)))))

(declare-fun b!1494049 () Bool)

(declare-fun res!1016454 () Bool)

(assert (=> b!1494049 (=> (not res!1016454) (not e!836891))))

(assert (=> b!1494049 (= res!1016454 (validKeyInArray!0 (select (arr!48148 a!2862) j!93)))))

(declare-fun b!1494050 () Bool)

(assert (=> b!1494050 (= e!836892 (or (= (select (arr!48148 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48148 a!2862) intermediateBeforeIndex!19) (select (arr!48148 a!2862) j!93))))))

(declare-fun b!1494051 () Bool)

(declare-fun res!1016467 () Bool)

(assert (=> b!1494051 (=> (not res!1016467) (not e!836891))))

(assert (=> b!1494051 (= res!1016467 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48698 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48698 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48698 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1016452 () Bool)

(assert (=> start!127112 (=> (not res!1016452) (not e!836891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127112 (= res!1016452 (validMask!0 mask!2687))))

(assert (=> start!127112 e!836891))

(assert (=> start!127112 true))

(declare-fun array_inv!37176 (array!99759) Bool)

(assert (=> start!127112 (array_inv!37176 a!2862)))

(assert (= (and start!127112 res!1016452) b!1494038))

(assert (= (and b!1494038 res!1016465) b!1494043))

(assert (= (and b!1494043 res!1016460) b!1494049))

(assert (= (and b!1494049 res!1016454) b!1494036))

(assert (= (and b!1494036 res!1016463) b!1494035))

(assert (= (and b!1494035 res!1016457) b!1494051))

(assert (= (and b!1494051 res!1016467) b!1494044))

(assert (= (and b!1494044 res!1016466) b!1494047))

(assert (= (and b!1494047 res!1016458) b!1494045))

(assert (= (and b!1494045 res!1016459) b!1494046))

(assert (= (and b!1494046 res!1016456) b!1494034))

(assert (= (and b!1494034 c!138321) b!1494040))

(assert (= (and b!1494034 (not c!138321)) b!1494041))

(assert (= (and b!1494034 res!1016461) b!1494042))

(assert (= (and b!1494042 res!1016464) b!1494037))

(assert (= (and b!1494037 res!1016462) b!1494048))

(assert (= (and b!1494048 res!1016455) b!1494050))

(assert (= (and b!1494037 (not res!1016453)) b!1494039))

(declare-fun m!1377795 () Bool)

(assert (=> b!1494043 m!1377795))

(assert (=> b!1494043 m!1377795))

(declare-fun m!1377797 () Bool)

(assert (=> b!1494043 m!1377797))

(declare-fun m!1377799 () Bool)

(assert (=> start!127112 m!1377799))

(declare-fun m!1377801 () Bool)

(assert (=> start!127112 m!1377801))

(declare-fun m!1377803 () Bool)

(assert (=> b!1494044 m!1377803))

(declare-fun m!1377805 () Bool)

(assert (=> b!1494044 m!1377805))

(declare-fun m!1377807 () Bool)

(assert (=> b!1494040 m!1377807))

(declare-fun m!1377809 () Bool)

(assert (=> b!1494045 m!1377809))

(assert (=> b!1494045 m!1377809))

(declare-fun m!1377811 () Bool)

(assert (=> b!1494045 m!1377811))

(declare-fun m!1377813 () Bool)

(assert (=> b!1494036 m!1377813))

(assert (=> b!1494047 m!1377809))

(assert (=> b!1494047 m!1377809))

(declare-fun m!1377815 () Bool)

(assert (=> b!1494047 m!1377815))

(assert (=> b!1494047 m!1377815))

(assert (=> b!1494047 m!1377809))

(declare-fun m!1377817 () Bool)

(assert (=> b!1494047 m!1377817))

(assert (=> b!1494048 m!1377809))

(assert (=> b!1494048 m!1377809))

(declare-fun m!1377819 () Bool)

(assert (=> b!1494048 m!1377819))

(declare-fun m!1377821 () Bool)

(assert (=> b!1494046 m!1377821))

(assert (=> b!1494046 m!1377821))

(declare-fun m!1377823 () Bool)

(assert (=> b!1494046 m!1377823))

(assert (=> b!1494046 m!1377803))

(declare-fun m!1377825 () Bool)

(assert (=> b!1494046 m!1377825))

(declare-fun m!1377827 () Bool)

(assert (=> b!1494050 m!1377827))

(assert (=> b!1494050 m!1377809))

(declare-fun m!1377829 () Bool)

(assert (=> b!1494035 m!1377829))

(assert (=> b!1494049 m!1377809))

(assert (=> b!1494049 m!1377809))

(declare-fun m!1377831 () Bool)

(assert (=> b!1494049 m!1377831))

(declare-fun m!1377833 () Bool)

(assert (=> b!1494039 m!1377833))

(declare-fun m!1377835 () Bool)

(assert (=> b!1494041 m!1377835))

(declare-fun m!1377837 () Bool)

(assert (=> b!1494041 m!1377837))

(declare-fun m!1377839 () Bool)

(assert (=> b!1494037 m!1377839))

(assert (=> b!1494037 m!1377803))

(declare-fun m!1377841 () Bool)

(assert (=> b!1494037 m!1377841))

(declare-fun m!1377843 () Bool)

(assert (=> b!1494037 m!1377843))

(declare-fun m!1377845 () Bool)

(assert (=> b!1494037 m!1377845))

(assert (=> b!1494037 m!1377809))

(push 1)

(assert (not b!1494045))

(assert (not b!1494040))

(assert (not b!1494035))

(assert (not b!1494037))

(assert (not b!1494049))

(assert (not b!1494039))

(assert (not b!1494046))

(assert (not b!1494043))

(assert (not b!1494047))

(assert (not start!127112))

(assert (not b!1494036))

(assert (not b!1494041))

(assert (not b!1494048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

