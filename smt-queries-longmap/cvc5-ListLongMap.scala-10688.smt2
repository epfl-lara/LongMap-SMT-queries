; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125266 () Bool)

(assert start!125266)

(declare-fun b!1462251 () Bool)

(declare-fun res!991728 () Bool)

(declare-fun e!821983 () Bool)

(assert (=> b!1462251 (=> (not res!991728) (not e!821983))))

(declare-datatypes ((array!98714 0))(
  ( (array!98715 (arr!47645 (Array (_ BitVec 32) (_ BitVec 64))) (size!48195 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98714)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11897 0))(
  ( (MissingZero!11897 (index!49980 (_ BitVec 32))) (Found!11897 (index!49981 (_ BitVec 32))) (Intermediate!11897 (undefined!12709 Bool) (index!49982 (_ BitVec 32)) (x!131578 (_ BitVec 32))) (Undefined!11897) (MissingVacant!11897 (index!49983 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98714 (_ BitVec 32)) SeekEntryResult!11897)

(assert (=> b!1462251 (= res!991728 (= (seekEntryOrOpen!0 (select (arr!47645 a!2862) j!93) a!2862 mask!2687) (Found!11897 j!93)))))

(declare-fun b!1462252 () Bool)

(declare-fun res!991732 () Bool)

(declare-fun e!821984 () Bool)

(assert (=> b!1462252 (=> res!991732 e!821984)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640391 () SeekEntryResult!11897)

(declare-fun lt!640389 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98714 (_ BitVec 32)) SeekEntryResult!11897)

(assert (=> b!1462252 (= res!991732 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640389 (select (arr!47645 a!2862) j!93) a!2862 mask!2687) lt!640391)))))

(declare-fun b!1462253 () Bool)

(declare-fun res!991727 () Bool)

(declare-fun e!821987 () Bool)

(assert (=> b!1462253 (=> (not res!991727) (not e!821987))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462253 (= res!991727 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48195 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48195 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48195 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462254 () Bool)

(declare-fun res!991721 () Bool)

(assert (=> b!1462254 (=> (not res!991721) (not e!821987))))

(declare-datatypes ((List!34146 0))(
  ( (Nil!34143) (Cons!34142 (h!35492 (_ BitVec 64)) (t!48840 List!34146)) )
))
(declare-fun arrayNoDuplicates!0 (array!98714 (_ BitVec 32) List!34146) Bool)

(assert (=> b!1462254 (= res!991721 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34143))))

(declare-fun b!1462255 () Bool)

(declare-fun res!991733 () Bool)

(assert (=> b!1462255 (=> (not res!991733) (not e!821987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462255 (= res!991733 (validKeyInArray!0 (select (arr!47645 a!2862) j!93)))))

(declare-fun b!1462256 () Bool)

(declare-fun e!821981 () Bool)

(assert (=> b!1462256 (= e!821981 e!821984)))

(declare-fun res!991720 () Bool)

(assert (=> b!1462256 (=> res!991720 e!821984)))

(assert (=> b!1462256 (= res!991720 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640389 #b00000000000000000000000000000000) (bvsge lt!640389 (size!48195 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462256 (= lt!640389 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462257 () Bool)

(declare-fun res!991730 () Bool)

(assert (=> b!1462257 (=> (not res!991730) (not e!821987))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462257 (= res!991730 (and (= (size!48195 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48195 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48195 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!640392 () array!98714)

(declare-fun b!1462259 () Bool)

(declare-fun lt!640393 () SeekEntryResult!11897)

(declare-fun lt!640395 () (_ BitVec 64))

(declare-fun e!821982 () Bool)

(assert (=> b!1462259 (= e!821982 (not (= lt!640393 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640389 lt!640395 lt!640392 mask!2687))))))

(declare-fun b!1462260 () Bool)

(declare-fun e!821986 () Bool)

(declare-fun e!821989 () Bool)

(assert (=> b!1462260 (= e!821986 e!821989)))

(declare-fun res!991725 () Bool)

(assert (=> b!1462260 (=> (not res!991725) (not e!821989))))

(assert (=> b!1462260 (= res!991725 (= lt!640393 (Intermediate!11897 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462260 (= lt!640393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640395 mask!2687) lt!640395 lt!640392 mask!2687))))

(assert (=> b!1462260 (= lt!640395 (select (store (arr!47645 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462261 () Bool)

(assert (=> b!1462261 (= e!821983 (or (= (select (arr!47645 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47645 a!2862) intermediateBeforeIndex!19) (select (arr!47645 a!2862) j!93))))))

(declare-fun b!1462262 () Bool)

(declare-fun res!991726 () Bool)

(assert (=> b!1462262 (=> (not res!991726) (not e!821989))))

(declare-fun e!821990 () Bool)

(assert (=> b!1462262 (= res!991726 e!821990)))

(declare-fun c!134777 () Bool)

(assert (=> b!1462262 (= c!134777 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462263 () Bool)

(declare-fun res!991723 () Bool)

(assert (=> b!1462263 (=> (not res!991723) (not e!821987))))

(assert (=> b!1462263 (= res!991723 (validKeyInArray!0 (select (arr!47645 a!2862) i!1006)))))

(declare-fun b!1462264 () Bool)

(assert (=> b!1462264 (= e!821989 (not e!821981))))

(declare-fun res!991718 () Bool)

(assert (=> b!1462264 (=> res!991718 e!821981)))

(assert (=> b!1462264 (= res!991718 (or (and (= (select (arr!47645 a!2862) index!646) (select (store (arr!47645 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47645 a!2862) index!646) (select (arr!47645 a!2862) j!93))) (= (select (arr!47645 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462264 e!821983))

(declare-fun res!991731 () Bool)

(assert (=> b!1462264 (=> (not res!991731) (not e!821983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98714 (_ BitVec 32)) Bool)

(assert (=> b!1462264 (= res!991731 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49290 0))(
  ( (Unit!49291) )
))
(declare-fun lt!640394 () Unit!49290)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49290)

(assert (=> b!1462264 (= lt!640394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462265 () Bool)

(declare-fun res!991729 () Bool)

(assert (=> b!1462265 (=> (not res!991729) (not e!821987))))

(assert (=> b!1462265 (= res!991729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462266 () Bool)

(assert (=> b!1462266 (= e!821984 true)))

(declare-fun lt!640390 () Bool)

(assert (=> b!1462266 (= lt!640390 e!821982)))

(declare-fun c!134778 () Bool)

(assert (=> b!1462266 (= c!134778 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462267 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98714 (_ BitVec 32)) SeekEntryResult!11897)

(assert (=> b!1462267 (= e!821990 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640395 lt!640392 mask!2687) (seekEntryOrOpen!0 lt!640395 lt!640392 mask!2687)))))

(declare-fun res!991734 () Bool)

(assert (=> start!125266 (=> (not res!991734) (not e!821987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125266 (= res!991734 (validMask!0 mask!2687))))

(assert (=> start!125266 e!821987))

(assert (=> start!125266 true))

(declare-fun array_inv!36673 (array!98714) Bool)

(assert (=> start!125266 (array_inv!36673 a!2862)))

(declare-fun b!1462258 () Bool)

(assert (=> b!1462258 (= e!821982 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640389 intermediateAfterIndex!19 lt!640395 lt!640392 mask!2687) (seekEntryOrOpen!0 lt!640395 lt!640392 mask!2687))))))

(declare-fun b!1462268 () Bool)

(declare-fun e!821988 () Bool)

(assert (=> b!1462268 (= e!821988 e!821986)))

(declare-fun res!991724 () Bool)

(assert (=> b!1462268 (=> (not res!991724) (not e!821986))))

(assert (=> b!1462268 (= res!991724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47645 a!2862) j!93) mask!2687) (select (arr!47645 a!2862) j!93) a!2862 mask!2687) lt!640391))))

(assert (=> b!1462268 (= lt!640391 (Intermediate!11897 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462269 () Bool)

(assert (=> b!1462269 (= e!821987 e!821988)))

(declare-fun res!991735 () Bool)

(assert (=> b!1462269 (=> (not res!991735) (not e!821988))))

(assert (=> b!1462269 (= res!991735 (= (select (store (arr!47645 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462269 (= lt!640392 (array!98715 (store (arr!47645 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48195 a!2862)))))

(declare-fun b!1462270 () Bool)

(assert (=> b!1462270 (= e!821990 (= lt!640393 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640395 lt!640392 mask!2687)))))

(declare-fun b!1462271 () Bool)

(declare-fun res!991722 () Bool)

(assert (=> b!1462271 (=> (not res!991722) (not e!821989))))

(assert (=> b!1462271 (= res!991722 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462272 () Bool)

(declare-fun res!991719 () Bool)

(assert (=> b!1462272 (=> (not res!991719) (not e!821986))))

(assert (=> b!1462272 (= res!991719 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47645 a!2862) j!93) a!2862 mask!2687) lt!640391))))

(assert (= (and start!125266 res!991734) b!1462257))

(assert (= (and b!1462257 res!991730) b!1462263))

(assert (= (and b!1462263 res!991723) b!1462255))

(assert (= (and b!1462255 res!991733) b!1462265))

(assert (= (and b!1462265 res!991729) b!1462254))

(assert (= (and b!1462254 res!991721) b!1462253))

(assert (= (and b!1462253 res!991727) b!1462269))

(assert (= (and b!1462269 res!991735) b!1462268))

(assert (= (and b!1462268 res!991724) b!1462272))

(assert (= (and b!1462272 res!991719) b!1462260))

(assert (= (and b!1462260 res!991725) b!1462262))

(assert (= (and b!1462262 c!134777) b!1462270))

(assert (= (and b!1462262 (not c!134777)) b!1462267))

(assert (= (and b!1462262 res!991726) b!1462271))

(assert (= (and b!1462271 res!991722) b!1462264))

(assert (= (and b!1462264 res!991731) b!1462251))

(assert (= (and b!1462251 res!991728) b!1462261))

(assert (= (and b!1462264 (not res!991718)) b!1462256))

(assert (= (and b!1462256 (not res!991720)) b!1462252))

(assert (= (and b!1462252 (not res!991732)) b!1462266))

(assert (= (and b!1462266 c!134778) b!1462259))

(assert (= (and b!1462266 (not c!134778)) b!1462258))

(declare-fun m!1349731 () Bool)

(assert (=> b!1462272 m!1349731))

(assert (=> b!1462272 m!1349731))

(declare-fun m!1349733 () Bool)

(assert (=> b!1462272 m!1349733))

(declare-fun m!1349735 () Bool)

(assert (=> b!1462264 m!1349735))

(declare-fun m!1349737 () Bool)

(assert (=> b!1462264 m!1349737))

(declare-fun m!1349739 () Bool)

(assert (=> b!1462264 m!1349739))

(declare-fun m!1349741 () Bool)

(assert (=> b!1462264 m!1349741))

(declare-fun m!1349743 () Bool)

(assert (=> b!1462264 m!1349743))

(assert (=> b!1462264 m!1349731))

(assert (=> b!1462255 m!1349731))

(assert (=> b!1462255 m!1349731))

(declare-fun m!1349745 () Bool)

(assert (=> b!1462255 m!1349745))

(declare-fun m!1349747 () Bool)

(assert (=> b!1462254 m!1349747))

(declare-fun m!1349749 () Bool)

(assert (=> b!1462270 m!1349749))

(declare-fun m!1349751 () Bool)

(assert (=> b!1462260 m!1349751))

(assert (=> b!1462260 m!1349751))

(declare-fun m!1349753 () Bool)

(assert (=> b!1462260 m!1349753))

(assert (=> b!1462260 m!1349737))

(declare-fun m!1349755 () Bool)

(assert (=> b!1462260 m!1349755))

(declare-fun m!1349757 () Bool)

(assert (=> b!1462258 m!1349757))

(declare-fun m!1349759 () Bool)

(assert (=> b!1462258 m!1349759))

(declare-fun m!1349761 () Bool)

(assert (=> b!1462259 m!1349761))

(assert (=> b!1462268 m!1349731))

(assert (=> b!1462268 m!1349731))

(declare-fun m!1349763 () Bool)

(assert (=> b!1462268 m!1349763))

(assert (=> b!1462268 m!1349763))

(assert (=> b!1462268 m!1349731))

(declare-fun m!1349765 () Bool)

(assert (=> b!1462268 m!1349765))

(assert (=> b!1462252 m!1349731))

(assert (=> b!1462252 m!1349731))

(declare-fun m!1349767 () Bool)

(assert (=> b!1462252 m!1349767))

(declare-fun m!1349769 () Bool)

(assert (=> start!125266 m!1349769))

(declare-fun m!1349771 () Bool)

(assert (=> start!125266 m!1349771))

(declare-fun m!1349773 () Bool)

(assert (=> b!1462265 m!1349773))

(declare-fun m!1349775 () Bool)

(assert (=> b!1462261 m!1349775))

(assert (=> b!1462261 m!1349731))

(declare-fun m!1349777 () Bool)

(assert (=> b!1462256 m!1349777))

(declare-fun m!1349779 () Bool)

(assert (=> b!1462263 m!1349779))

(assert (=> b!1462263 m!1349779))

(declare-fun m!1349781 () Bool)

(assert (=> b!1462263 m!1349781))

(assert (=> b!1462269 m!1349737))

(declare-fun m!1349783 () Bool)

(assert (=> b!1462269 m!1349783))

(assert (=> b!1462251 m!1349731))

(assert (=> b!1462251 m!1349731))

(declare-fun m!1349785 () Bool)

(assert (=> b!1462251 m!1349785))

(declare-fun m!1349787 () Bool)

(assert (=> b!1462267 m!1349787))

(assert (=> b!1462267 m!1349759))

(push 1)

