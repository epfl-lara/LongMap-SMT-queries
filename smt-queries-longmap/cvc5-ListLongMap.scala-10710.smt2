; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125398 () Bool)

(assert start!125398)

(declare-fun b!1466607 () Bool)

(declare-fun e!823923 () Bool)

(declare-fun e!823924 () Bool)

(assert (=> b!1466607 (= e!823923 e!823924)))

(declare-fun res!995293 () Bool)

(assert (=> b!1466607 (=> (not res!995293) (not e!823924))))

(declare-datatypes ((SeekEntryResult!11963 0))(
  ( (MissingZero!11963 (index!50244 (_ BitVec 32))) (Found!11963 (index!50245 (_ BitVec 32))) (Intermediate!11963 (undefined!12775 Bool) (index!50246 (_ BitVec 32)) (x!131820 (_ BitVec 32))) (Undefined!11963) (MissingVacant!11963 (index!50247 (_ BitVec 32))) )
))
(declare-fun lt!641819 () SeekEntryResult!11963)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466607 (= res!995293 (= lt!641819 (Intermediate!11963 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98846 0))(
  ( (array!98847 (arr!47711 (Array (_ BitVec 32) (_ BitVec 64))) (size!48261 (_ BitVec 32))) )
))
(declare-fun lt!641813 () array!98846)

(declare-fun lt!641818 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98846 (_ BitVec 32)) SeekEntryResult!11963)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466607 (= lt!641819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641818 mask!2687) lt!641818 lt!641813 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98846)

(assert (=> b!1466607 (= lt!641818 (select (store (arr!47711 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466608 () Bool)

(declare-fun res!995294 () Bool)

(declare-fun e!823929 () Bool)

(assert (=> b!1466608 (=> (not res!995294) (not e!823929))))

(assert (=> b!1466608 (= res!995294 (and (= (size!48261 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48261 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48261 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466609 () Bool)

(declare-fun res!995283 () Bool)

(declare-fun e!823928 () Bool)

(assert (=> b!1466609 (=> res!995283 e!823928)))

(declare-fun lt!641814 () SeekEntryResult!11963)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641816 () (_ BitVec 32))

(assert (=> b!1466609 (= res!995283 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641816 (select (arr!47711 a!2862) j!93) a!2862 mask!2687) lt!641814)))))

(declare-fun e!823926 () Bool)

(declare-fun b!1466610 () Bool)

(assert (=> b!1466610 (= e!823926 (not (= lt!641819 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641816 lt!641818 lt!641813 mask!2687))))))

(declare-fun b!1466611 () Bool)

(declare-fun e!823930 () Bool)

(assert (=> b!1466611 (= e!823929 e!823930)))

(declare-fun res!995299 () Bool)

(assert (=> b!1466611 (=> (not res!995299) (not e!823930))))

(assert (=> b!1466611 (= res!995299 (= (select (store (arr!47711 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466611 (= lt!641813 (array!98847 (store (arr!47711 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48261 a!2862)))))

(declare-fun b!1466612 () Bool)

(assert (=> b!1466612 (= e!823930 e!823923)))

(declare-fun res!995292 () Bool)

(assert (=> b!1466612 (=> (not res!995292) (not e!823923))))

(assert (=> b!1466612 (= res!995292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47711 a!2862) j!93) mask!2687) (select (arr!47711 a!2862) j!93) a!2862 mask!2687) lt!641814))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466612 (= lt!641814 (Intermediate!11963 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1466613 () Bool)

(declare-fun e!823925 () Bool)

(assert (=> b!1466613 (= e!823925 (= lt!641819 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641818 lt!641813 mask!2687)))))

(declare-fun res!995289 () Bool)

(assert (=> start!125398 (=> (not res!995289) (not e!823929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125398 (= res!995289 (validMask!0 mask!2687))))

(assert (=> start!125398 e!823929))

(assert (=> start!125398 true))

(declare-fun array_inv!36739 (array!98846) Bool)

(assert (=> start!125398 (array_inv!36739 a!2862)))

(declare-fun b!1466614 () Bool)

(declare-fun res!995285 () Bool)

(assert (=> b!1466614 (=> (not res!995285) (not e!823929))))

(declare-datatypes ((List!34212 0))(
  ( (Nil!34209) (Cons!34208 (h!35558 (_ BitVec 64)) (t!48906 List!34212)) )
))
(declare-fun arrayNoDuplicates!0 (array!98846 (_ BitVec 32) List!34212) Bool)

(assert (=> b!1466614 (= res!995285 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34209))))

(declare-fun b!1466615 () Bool)

(declare-fun res!995290 () Bool)

(assert (=> b!1466615 (=> (not res!995290) (not e!823929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466615 (= res!995290 (validKeyInArray!0 (select (arr!47711 a!2862) i!1006)))))

(declare-fun b!1466616 () Bool)

(declare-fun res!995297 () Bool)

(assert (=> b!1466616 (=> (not res!995297) (not e!823929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98846 (_ BitVec 32)) Bool)

(assert (=> b!1466616 (= res!995297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466617 () Bool)

(declare-fun e!823927 () Bool)

(assert (=> b!1466617 (= e!823924 (not e!823927))))

(declare-fun res!995298 () Bool)

(assert (=> b!1466617 (=> res!995298 e!823927)))

(assert (=> b!1466617 (= res!995298 (or (and (= (select (arr!47711 a!2862) index!646) (select (store (arr!47711 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47711 a!2862) index!646) (select (arr!47711 a!2862) j!93))) (= (select (arr!47711 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641815 () SeekEntryResult!11963)

(assert (=> b!1466617 (and (= lt!641815 (Found!11963 j!93)) (or (= (select (arr!47711 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47711 a!2862) intermediateBeforeIndex!19) (select (arr!47711 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98846 (_ BitVec 32)) SeekEntryResult!11963)

(assert (=> b!1466617 (= lt!641815 (seekEntryOrOpen!0 (select (arr!47711 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466617 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49422 0))(
  ( (Unit!49423) )
))
(declare-fun lt!641817 () Unit!49422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49422)

(assert (=> b!1466617 (= lt!641817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466618 () Bool)

(assert (=> b!1466618 (= e!823928 true)))

(assert (=> b!1466618 (= lt!641815 (seekEntryOrOpen!0 lt!641818 lt!641813 mask!2687))))

(declare-fun lt!641820 () Unit!49422)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49422)

(assert (=> b!1466618 (= lt!641820 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641816 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466619 () Bool)

(declare-fun res!995282 () Bool)

(assert (=> b!1466619 (=> (not res!995282) (not e!823924))))

(assert (=> b!1466619 (= res!995282 e!823925)))

(declare-fun c!135174 () Bool)

(assert (=> b!1466619 (= c!135174 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466620 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98846 (_ BitVec 32)) SeekEntryResult!11963)

(assert (=> b!1466620 (= e!823925 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641818 lt!641813 mask!2687) (seekEntryOrOpen!0 lt!641818 lt!641813 mask!2687)))))

(declare-fun b!1466621 () Bool)

(declare-fun res!995288 () Bool)

(assert (=> b!1466621 (=> (not res!995288) (not e!823929))))

(assert (=> b!1466621 (= res!995288 (validKeyInArray!0 (select (arr!47711 a!2862) j!93)))))

(declare-fun b!1466622 () Bool)

(assert (=> b!1466622 (= e!823926 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641816 intermediateAfterIndex!19 lt!641818 lt!641813 mask!2687) (seekEntryOrOpen!0 lt!641818 lt!641813 mask!2687))))))

(declare-fun b!1466623 () Bool)

(declare-fun res!995295 () Bool)

(assert (=> b!1466623 (=> (not res!995295) (not e!823923))))

(assert (=> b!1466623 (= res!995295 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47711 a!2862) j!93) a!2862 mask!2687) lt!641814))))

(declare-fun b!1466624 () Bool)

(declare-fun res!995296 () Bool)

(assert (=> b!1466624 (=> (not res!995296) (not e!823929))))

(assert (=> b!1466624 (= res!995296 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48261 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48261 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48261 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466625 () Bool)

(declare-fun res!995287 () Bool)

(assert (=> b!1466625 (=> res!995287 e!823928)))

(assert (=> b!1466625 (= res!995287 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466626 () Bool)

(assert (=> b!1466626 (= e!823927 e!823928)))

(declare-fun res!995291 () Bool)

(assert (=> b!1466626 (=> res!995291 e!823928)))

(assert (=> b!1466626 (= res!995291 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641816 #b00000000000000000000000000000000) (bvsge lt!641816 (size!48261 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466626 (= lt!641816 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466627 () Bool)

(declare-fun res!995286 () Bool)

(assert (=> b!1466627 (=> res!995286 e!823928)))

(assert (=> b!1466627 (= res!995286 e!823926)))

(declare-fun c!135173 () Bool)

(assert (=> b!1466627 (= c!135173 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466628 () Bool)

(declare-fun res!995284 () Bool)

(assert (=> b!1466628 (=> (not res!995284) (not e!823924))))

(assert (=> b!1466628 (= res!995284 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125398 res!995289) b!1466608))

(assert (= (and b!1466608 res!995294) b!1466615))

(assert (= (and b!1466615 res!995290) b!1466621))

(assert (= (and b!1466621 res!995288) b!1466616))

(assert (= (and b!1466616 res!995297) b!1466614))

(assert (= (and b!1466614 res!995285) b!1466624))

(assert (= (and b!1466624 res!995296) b!1466611))

(assert (= (and b!1466611 res!995299) b!1466612))

(assert (= (and b!1466612 res!995292) b!1466623))

(assert (= (and b!1466623 res!995295) b!1466607))

(assert (= (and b!1466607 res!995293) b!1466619))

(assert (= (and b!1466619 c!135174) b!1466613))

(assert (= (and b!1466619 (not c!135174)) b!1466620))

(assert (= (and b!1466619 res!995282) b!1466628))

(assert (= (and b!1466628 res!995284) b!1466617))

(assert (= (and b!1466617 (not res!995298)) b!1466626))

(assert (= (and b!1466626 (not res!995291)) b!1466609))

(assert (= (and b!1466609 (not res!995283)) b!1466627))

(assert (= (and b!1466627 c!135173) b!1466610))

(assert (= (and b!1466627 (not c!135173)) b!1466622))

(assert (= (and b!1466627 (not res!995286)) b!1466625))

(assert (= (and b!1466625 (not res!995287)) b!1466618))

(declare-fun m!1353583 () Bool)

(assert (=> b!1466618 m!1353583))

(declare-fun m!1353585 () Bool)

(assert (=> b!1466618 m!1353585))

(declare-fun m!1353587 () Bool)

(assert (=> b!1466615 m!1353587))

(assert (=> b!1466615 m!1353587))

(declare-fun m!1353589 () Bool)

(assert (=> b!1466615 m!1353589))

(declare-fun m!1353591 () Bool)

(assert (=> b!1466616 m!1353591))

(declare-fun m!1353593 () Bool)

(assert (=> b!1466621 m!1353593))

(assert (=> b!1466621 m!1353593))

(declare-fun m!1353595 () Bool)

(assert (=> b!1466621 m!1353595))

(declare-fun m!1353597 () Bool)

(assert (=> b!1466620 m!1353597))

(assert (=> b!1466620 m!1353583))

(declare-fun m!1353599 () Bool)

(assert (=> b!1466617 m!1353599))

(declare-fun m!1353601 () Bool)

(assert (=> b!1466617 m!1353601))

(declare-fun m!1353603 () Bool)

(assert (=> b!1466617 m!1353603))

(declare-fun m!1353605 () Bool)

(assert (=> b!1466617 m!1353605))

(declare-fun m!1353607 () Bool)

(assert (=> b!1466617 m!1353607))

(assert (=> b!1466617 m!1353593))

(declare-fun m!1353609 () Bool)

(assert (=> b!1466617 m!1353609))

(declare-fun m!1353611 () Bool)

(assert (=> b!1466617 m!1353611))

(assert (=> b!1466617 m!1353593))

(declare-fun m!1353613 () Bool)

(assert (=> b!1466614 m!1353613))

(declare-fun m!1353615 () Bool)

(assert (=> b!1466607 m!1353615))

(assert (=> b!1466607 m!1353615))

(declare-fun m!1353617 () Bool)

(assert (=> b!1466607 m!1353617))

(assert (=> b!1466607 m!1353601))

(declare-fun m!1353619 () Bool)

(assert (=> b!1466607 m!1353619))

(assert (=> b!1466611 m!1353601))

(declare-fun m!1353621 () Bool)

(assert (=> b!1466611 m!1353621))

(declare-fun m!1353623 () Bool)

(assert (=> b!1466622 m!1353623))

(assert (=> b!1466622 m!1353583))

(declare-fun m!1353625 () Bool)

(assert (=> b!1466626 m!1353625))

(declare-fun m!1353627 () Bool)

(assert (=> b!1466610 m!1353627))

(declare-fun m!1353629 () Bool)

(assert (=> start!125398 m!1353629))

(declare-fun m!1353631 () Bool)

(assert (=> start!125398 m!1353631))

(assert (=> b!1466612 m!1353593))

(assert (=> b!1466612 m!1353593))

(declare-fun m!1353633 () Bool)

(assert (=> b!1466612 m!1353633))

(assert (=> b!1466612 m!1353633))

(assert (=> b!1466612 m!1353593))

(declare-fun m!1353635 () Bool)

(assert (=> b!1466612 m!1353635))

(declare-fun m!1353637 () Bool)

(assert (=> b!1466613 m!1353637))

(assert (=> b!1466609 m!1353593))

(assert (=> b!1466609 m!1353593))

(declare-fun m!1353639 () Bool)

(assert (=> b!1466609 m!1353639))

(assert (=> b!1466623 m!1353593))

(assert (=> b!1466623 m!1353593))

(declare-fun m!1353641 () Bool)

(assert (=> b!1466623 m!1353641))

(push 1)

