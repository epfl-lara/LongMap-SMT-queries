; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125260 () Bool)

(assert start!125260)

(declare-fun b!1462848 () Bool)

(declare-fun e!822225 () Bool)

(declare-fun e!822232 () Bool)

(assert (=> b!1462848 (= e!822225 e!822232)))

(declare-fun res!992304 () Bool)

(assert (=> b!1462848 (=> (not res!992304) (not e!822232))))

(declare-datatypes ((SeekEntryResult!11909 0))(
  ( (MissingZero!11909 (index!50028 (_ BitVec 32))) (Found!11909 (index!50029 (_ BitVec 32))) (Intermediate!11909 (undefined!12721 Bool) (index!50030 (_ BitVec 32)) (x!131617 (_ BitVec 32))) (Undefined!11909) (MissingVacant!11909 (index!50031 (_ BitVec 32))) )
))
(declare-fun lt!640408 () SeekEntryResult!11909)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462848 (= res!992304 (= lt!640408 (Intermediate!11909 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640413 () (_ BitVec 64))

(declare-datatypes ((array!98686 0))(
  ( (array!98687 (arr!47632 (Array (_ BitVec 32) (_ BitVec 64))) (size!48184 (_ BitVec 32))) )
))
(declare-fun lt!640410 () array!98686)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98686 (_ BitVec 32)) SeekEntryResult!11909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462848 (= lt!640408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640413 mask!2687) lt!640413 lt!640410 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98686)

(assert (=> b!1462848 (= lt!640413 (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!822226 () Bool)

(declare-fun b!1462849 () Bool)

(assert (=> b!1462849 (= e!822226 (or (= (select (arr!47632 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47632 a!2862) intermediateBeforeIndex!19) (select (arr!47632 a!2862) j!93))))))

(declare-fun b!1462850 () Bool)

(declare-fun res!992289 () Bool)

(declare-fun e!822228 () Bool)

(assert (=> b!1462850 (=> (not res!992289) (not e!822228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462850 (= res!992289 (validKeyInArray!0 (select (arr!47632 a!2862) j!93)))))

(declare-fun b!1462851 () Bool)

(declare-fun e!822233 () Bool)

(declare-fun e!822231 () Bool)

(assert (=> b!1462851 (= e!822233 e!822231)))

(declare-fun res!992301 () Bool)

(assert (=> b!1462851 (=> res!992301 e!822231)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640407 () (_ BitVec 32))

(assert (=> b!1462851 (= res!992301 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640407 #b00000000000000000000000000000000) (bvsge lt!640407 (size!48184 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462851 (= lt!640407 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462853 () Bool)

(declare-fun e!822229 () Bool)

(assert (=> b!1462853 (= e!822229 (not (= lt!640408 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640407 lt!640413 lt!640410 mask!2687))))))

(declare-fun b!1462854 () Bool)

(declare-fun e!822230 () Bool)

(assert (=> b!1462854 (= e!822230 e!822225)))

(declare-fun res!992294 () Bool)

(assert (=> b!1462854 (=> (not res!992294) (not e!822225))))

(declare-fun lt!640409 () SeekEntryResult!11909)

(assert (=> b!1462854 (= res!992294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47632 a!2862) j!93) mask!2687) (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!640409))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462854 (= lt!640409 (Intermediate!11909 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462855 () Bool)

(declare-fun res!992302 () Bool)

(assert (=> b!1462855 (=> (not res!992302) (not e!822228))))

(assert (=> b!1462855 (= res!992302 (and (= (size!48184 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48184 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48184 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462856 () Bool)

(assert (=> b!1462856 (= e!822228 e!822230)))

(declare-fun res!992295 () Bool)

(assert (=> b!1462856 (=> (not res!992295) (not e!822230))))

(assert (=> b!1462856 (= res!992295 (= (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462856 (= lt!640410 (array!98687 (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48184 a!2862)))))

(declare-fun b!1462857 () Bool)

(declare-fun res!992288 () Bool)

(assert (=> b!1462857 (=> (not res!992288) (not e!822226))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98686 (_ BitVec 32)) SeekEntryResult!11909)

(assert (=> b!1462857 (= res!992288 (= (seekEntryOrOpen!0 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) (Found!11909 j!93)))))

(declare-fun b!1462858 () Bool)

(declare-fun res!992293 () Bool)

(assert (=> b!1462858 (=> (not res!992293) (not e!822228))))

(assert (=> b!1462858 (= res!992293 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48184 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48184 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48184 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462859 () Bool)

(declare-fun res!992303 () Bool)

(assert (=> b!1462859 (=> (not res!992303) (not e!822225))))

(assert (=> b!1462859 (= res!992303 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!640409))))

(declare-fun b!1462860 () Bool)

(declare-fun res!992291 () Bool)

(assert (=> b!1462860 (=> (not res!992291) (not e!822228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98686 (_ BitVec 32)) Bool)

(assert (=> b!1462860 (= res!992291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462861 () Bool)

(declare-fun res!992297 () Bool)

(assert (=> b!1462861 (=> (not res!992297) (not e!822228))))

(assert (=> b!1462861 (= res!992297 (validKeyInArray!0 (select (arr!47632 a!2862) i!1006)))))

(declare-fun res!992305 () Bool)

(assert (=> start!125260 (=> (not res!992305) (not e!822228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125260 (= res!992305 (validMask!0 mask!2687))))

(assert (=> start!125260 e!822228))

(assert (=> start!125260 true))

(declare-fun array_inv!36865 (array!98686) Bool)

(assert (=> start!125260 (array_inv!36865 a!2862)))

(declare-fun b!1462852 () Bool)

(declare-fun e!822227 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98686 (_ BitVec 32)) SeekEntryResult!11909)

(assert (=> b!1462852 (= e!822227 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640413 lt!640410 mask!2687) (seekEntryOrOpen!0 lt!640413 lt!640410 mask!2687)))))

(declare-fun b!1462862 () Bool)

(declare-fun res!992296 () Bool)

(assert (=> b!1462862 (=> (not res!992296) (not e!822232))))

(assert (=> b!1462862 (= res!992296 e!822227)))

(declare-fun c!134794 () Bool)

(assert (=> b!1462862 (= c!134794 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462863 () Bool)

(declare-fun res!992300 () Bool)

(assert (=> b!1462863 (=> (not res!992300) (not e!822232))))

(assert (=> b!1462863 (= res!992300 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462864 () Bool)

(assert (=> b!1462864 (= e!822227 (= lt!640408 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640413 lt!640410 mask!2687)))))

(declare-fun b!1462865 () Bool)

(assert (=> b!1462865 (= e!822229 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640407 intermediateAfterIndex!19 lt!640413 lt!640410 mask!2687) (seekEntryOrOpen!0 lt!640413 lt!640410 mask!2687))))))

(declare-fun b!1462866 () Bool)

(declare-fun res!992292 () Bool)

(assert (=> b!1462866 (=> (not res!992292) (not e!822228))))

(declare-datatypes ((List!34211 0))(
  ( (Nil!34208) (Cons!34207 (h!35557 (_ BitVec 64)) (t!48897 List!34211)) )
))
(declare-fun arrayNoDuplicates!0 (array!98686 (_ BitVec 32) List!34211) Bool)

(assert (=> b!1462866 (= res!992292 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34208))))

(declare-fun b!1462867 () Bool)

(assert (=> b!1462867 (= e!822231 true)))

(declare-fun lt!640411 () Bool)

(assert (=> b!1462867 (= lt!640411 e!822229)))

(declare-fun c!134793 () Bool)

(assert (=> b!1462867 (= c!134793 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462868 () Bool)

(assert (=> b!1462868 (= e!822232 (not e!822233))))

(declare-fun res!992298 () Bool)

(assert (=> b!1462868 (=> res!992298 e!822233)))

(assert (=> b!1462868 (= res!992298 (or (and (= (select (arr!47632 a!2862) index!646) (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47632 a!2862) index!646) (select (arr!47632 a!2862) j!93))) (= (select (arr!47632 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462868 e!822226))

(declare-fun res!992290 () Bool)

(assert (=> b!1462868 (=> (not res!992290) (not e!822226))))

(assert (=> b!1462868 (= res!992290 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49155 0))(
  ( (Unit!49156) )
))
(declare-fun lt!640412 () Unit!49155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49155)

(assert (=> b!1462868 (= lt!640412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462869 () Bool)

(declare-fun res!992299 () Bool)

(assert (=> b!1462869 (=> res!992299 e!822231)))

(assert (=> b!1462869 (= res!992299 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640407 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!640409)))))

(assert (= (and start!125260 res!992305) b!1462855))

(assert (= (and b!1462855 res!992302) b!1462861))

(assert (= (and b!1462861 res!992297) b!1462850))

(assert (= (and b!1462850 res!992289) b!1462860))

(assert (= (and b!1462860 res!992291) b!1462866))

(assert (= (and b!1462866 res!992292) b!1462858))

(assert (= (and b!1462858 res!992293) b!1462856))

(assert (= (and b!1462856 res!992295) b!1462854))

(assert (= (and b!1462854 res!992294) b!1462859))

(assert (= (and b!1462859 res!992303) b!1462848))

(assert (= (and b!1462848 res!992304) b!1462862))

(assert (= (and b!1462862 c!134794) b!1462864))

(assert (= (and b!1462862 (not c!134794)) b!1462852))

(assert (= (and b!1462862 res!992296) b!1462863))

(assert (= (and b!1462863 res!992300) b!1462868))

(assert (= (and b!1462868 res!992290) b!1462857))

(assert (= (and b!1462857 res!992288) b!1462849))

(assert (= (and b!1462868 (not res!992298)) b!1462851))

(assert (= (and b!1462851 (not res!992301)) b!1462869))

(assert (= (and b!1462869 (not res!992299)) b!1462867))

(assert (= (and b!1462867 c!134793) b!1462853))

(assert (= (and b!1462867 (not c!134793)) b!1462865))

(declare-fun m!1349751 () Bool)

(assert (=> b!1462853 m!1349751))

(declare-fun m!1349753 () Bool)

(assert (=> b!1462848 m!1349753))

(assert (=> b!1462848 m!1349753))

(declare-fun m!1349755 () Bool)

(assert (=> b!1462848 m!1349755))

(declare-fun m!1349757 () Bool)

(assert (=> b!1462848 m!1349757))

(declare-fun m!1349759 () Bool)

(assert (=> b!1462848 m!1349759))

(declare-fun m!1349761 () Bool)

(assert (=> b!1462852 m!1349761))

(declare-fun m!1349763 () Bool)

(assert (=> b!1462852 m!1349763))

(declare-fun m!1349765 () Bool)

(assert (=> b!1462865 m!1349765))

(assert (=> b!1462865 m!1349763))

(declare-fun m!1349767 () Bool)

(assert (=> start!125260 m!1349767))

(declare-fun m!1349769 () Bool)

(assert (=> start!125260 m!1349769))

(declare-fun m!1349771 () Bool)

(assert (=> b!1462854 m!1349771))

(assert (=> b!1462854 m!1349771))

(declare-fun m!1349773 () Bool)

(assert (=> b!1462854 m!1349773))

(assert (=> b!1462854 m!1349773))

(assert (=> b!1462854 m!1349771))

(declare-fun m!1349775 () Bool)

(assert (=> b!1462854 m!1349775))

(assert (=> b!1462856 m!1349757))

(declare-fun m!1349777 () Bool)

(assert (=> b!1462856 m!1349777))

(declare-fun m!1349779 () Bool)

(assert (=> b!1462864 m!1349779))

(declare-fun m!1349781 () Bool)

(assert (=> b!1462849 m!1349781))

(assert (=> b!1462849 m!1349771))

(assert (=> b!1462857 m!1349771))

(assert (=> b!1462857 m!1349771))

(declare-fun m!1349783 () Bool)

(assert (=> b!1462857 m!1349783))

(assert (=> b!1462850 m!1349771))

(assert (=> b!1462850 m!1349771))

(declare-fun m!1349785 () Bool)

(assert (=> b!1462850 m!1349785))

(declare-fun m!1349787 () Bool)

(assert (=> b!1462868 m!1349787))

(assert (=> b!1462868 m!1349757))

(declare-fun m!1349789 () Bool)

(assert (=> b!1462868 m!1349789))

(declare-fun m!1349791 () Bool)

(assert (=> b!1462868 m!1349791))

(declare-fun m!1349793 () Bool)

(assert (=> b!1462868 m!1349793))

(assert (=> b!1462868 m!1349771))

(declare-fun m!1349795 () Bool)

(assert (=> b!1462866 m!1349795))

(assert (=> b!1462869 m!1349771))

(assert (=> b!1462869 m!1349771))

(declare-fun m!1349797 () Bool)

(assert (=> b!1462869 m!1349797))

(declare-fun m!1349799 () Bool)

(assert (=> b!1462851 m!1349799))

(assert (=> b!1462859 m!1349771))

(assert (=> b!1462859 m!1349771))

(declare-fun m!1349801 () Bool)

(assert (=> b!1462859 m!1349801))

(declare-fun m!1349803 () Bool)

(assert (=> b!1462860 m!1349803))

(declare-fun m!1349805 () Bool)

(assert (=> b!1462861 m!1349805))

(assert (=> b!1462861 m!1349805))

(declare-fun m!1349807 () Bool)

(assert (=> b!1462861 m!1349807))

(check-sat (not b!1462852) (not b!1462866) (not b!1462850) (not b!1462869) (not b!1462848) (not b!1462859) (not b!1462861) (not b!1462864) (not b!1462857) (not b!1462865) (not b!1462854) (not b!1462853) (not start!125260) (not b!1462868) (not b!1462851) (not b!1462860))
(check-sat)
