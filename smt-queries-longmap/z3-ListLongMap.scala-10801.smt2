; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126672 () Bool)

(assert start!126672)

(declare-fun b!1483581 () Bool)

(declare-fun e!832117 () Bool)

(declare-fun e!832120 () Bool)

(assert (=> b!1483581 (= e!832117 e!832120)))

(declare-fun res!1007762 () Bool)

(assert (=> b!1483581 (=> (not res!1007762) (not e!832120))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99529 0))(
  ( (array!99530 (arr!48037 (Array (_ BitVec 32) (_ BitVec 64))) (size!48588 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99529)

(assert (=> b!1483581 (= res!1007762 (= (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647541 () array!99529)

(assert (=> b!1483581 (= lt!647541 (array!99530 (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48588 a!2862)))))

(declare-fun b!1483582 () Bool)

(declare-fun res!1007770 () Bool)

(assert (=> b!1483582 (=> (not res!1007770) (not e!832117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483582 (= res!1007770 (validKeyInArray!0 (select (arr!48037 a!2862) i!1006)))))

(declare-fun b!1483583 () Bool)

(declare-fun e!832116 () Bool)

(assert (=> b!1483583 (= e!832116 (not true))))

(declare-fun e!832119 () Bool)

(assert (=> b!1483583 e!832119))

(declare-fun res!1007765 () Bool)

(assert (=> b!1483583 (=> (not res!1007765) (not e!832119))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99529 (_ BitVec 32)) Bool)

(assert (=> b!1483583 (= res!1007765 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49721 0))(
  ( (Unit!49722) )
))
(declare-fun lt!647544 () Unit!49721)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49721)

(assert (=> b!1483583 (= lt!647544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483584 () Bool)

(declare-fun res!1007764 () Bool)

(assert (=> b!1483584 (=> (not res!1007764) (not e!832117))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1483584 (= res!1007764 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48588 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48588 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48588 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483585 () Bool)

(declare-fun res!1007769 () Bool)

(assert (=> b!1483585 (=> (not res!1007769) (not e!832116))))

(assert (=> b!1483585 (= res!1007769 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483586 () Bool)

(declare-fun res!1007759 () Bool)

(assert (=> b!1483586 (=> (not res!1007759) (not e!832117))))

(assert (=> b!1483586 (= res!1007759 (validKeyInArray!0 (select (arr!48037 a!2862) j!93)))))

(declare-fun e!832122 () Bool)

(declare-fun lt!647542 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12174 0))(
  ( (MissingZero!12174 (index!51088 (_ BitVec 32))) (Found!12174 (index!51089 (_ BitVec 32))) (Intermediate!12174 (undefined!12986 Bool) (index!51090 (_ BitVec 32)) (x!132858 (_ BitVec 32))) (Undefined!12174) (MissingVacant!12174 (index!51091 (_ BitVec 32))) )
))
(declare-fun lt!647545 () SeekEntryResult!12174)

(declare-fun b!1483587 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99529 (_ BitVec 32)) SeekEntryResult!12174)

(assert (=> b!1483587 (= e!832122 (= lt!647545 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647542 lt!647541 mask!2687)))))

(declare-fun b!1483588 () Bool)

(declare-fun res!1007768 () Bool)

(declare-fun e!832118 () Bool)

(assert (=> b!1483588 (=> (not res!1007768) (not e!832118))))

(declare-fun lt!647543 () SeekEntryResult!12174)

(assert (=> b!1483588 (= res!1007768 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48037 a!2862) j!93) a!2862 mask!2687) lt!647543))))

(declare-fun res!1007758 () Bool)

(assert (=> start!126672 (=> (not res!1007758) (not e!832117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126672 (= res!1007758 (validMask!0 mask!2687))))

(assert (=> start!126672 e!832117))

(assert (=> start!126672 true))

(declare-fun array_inv!37318 (array!99529) Bool)

(assert (=> start!126672 (array_inv!37318 a!2862)))

(declare-fun b!1483589 () Bool)

(assert (=> b!1483589 (= e!832120 e!832118)))

(declare-fun res!1007757 () Bool)

(assert (=> b!1483589 (=> (not res!1007757) (not e!832118))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483589 (= res!1007757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48037 a!2862) j!93) mask!2687) (select (arr!48037 a!2862) j!93) a!2862 mask!2687) lt!647543))))

(assert (=> b!1483589 (= lt!647543 (Intermediate!12174 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483590 () Bool)

(declare-fun res!1007763 () Bool)

(assert (=> b!1483590 (=> (not res!1007763) (not e!832117))))

(declare-datatypes ((List!34525 0))(
  ( (Nil!34522) (Cons!34521 (h!35906 (_ BitVec 64)) (t!49211 List!34525)) )
))
(declare-fun arrayNoDuplicates!0 (array!99529 (_ BitVec 32) List!34525) Bool)

(assert (=> b!1483590 (= res!1007763 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34522))))

(declare-fun b!1483591 () Bool)

(declare-fun res!1007771 () Bool)

(assert (=> b!1483591 (=> (not res!1007771) (not e!832117))))

(assert (=> b!1483591 (= res!1007771 (and (= (size!48588 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48588 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48588 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483592 () Bool)

(declare-fun res!1007760 () Bool)

(assert (=> b!1483592 (=> (not res!1007760) (not e!832117))))

(assert (=> b!1483592 (= res!1007760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483593 () Bool)

(declare-fun res!1007766 () Bool)

(assert (=> b!1483593 (=> (not res!1007766) (not e!832116))))

(assert (=> b!1483593 (= res!1007766 e!832122)))

(declare-fun c!137443 () Bool)

(assert (=> b!1483593 (= c!137443 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483594 () Bool)

(assert (=> b!1483594 (= e!832118 e!832116)))

(declare-fun res!1007767 () Bool)

(assert (=> b!1483594 (=> (not res!1007767) (not e!832116))))

(assert (=> b!1483594 (= res!1007767 (= lt!647545 (Intermediate!12174 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483594 (= lt!647545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647542 mask!2687) lt!647542 lt!647541 mask!2687))))

(assert (=> b!1483594 (= lt!647542 (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483595 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99529 (_ BitVec 32)) SeekEntryResult!12174)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99529 (_ BitVec 32)) SeekEntryResult!12174)

(assert (=> b!1483595 (= e!832122 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647542 lt!647541 mask!2687) (seekEntryOrOpen!0 lt!647542 lt!647541 mask!2687)))))

(declare-fun b!1483596 () Bool)

(assert (=> b!1483596 (= e!832119 (and (or (= (select (arr!48037 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48037 a!2862) intermediateBeforeIndex!19) (select (arr!48037 a!2862) j!93))) (or (and (= (select (arr!48037 a!2862) index!646) (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48037 a!2862) index!646) (select (arr!48037 a!2862) j!93))) (= (select (arr!48037 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1483597 () Bool)

(declare-fun res!1007761 () Bool)

(assert (=> b!1483597 (=> (not res!1007761) (not e!832119))))

(assert (=> b!1483597 (= res!1007761 (= (seekEntryOrOpen!0 (select (arr!48037 a!2862) j!93) a!2862 mask!2687) (Found!12174 j!93)))))

(assert (= (and start!126672 res!1007758) b!1483591))

(assert (= (and b!1483591 res!1007771) b!1483582))

(assert (= (and b!1483582 res!1007770) b!1483586))

(assert (= (and b!1483586 res!1007759) b!1483592))

(assert (= (and b!1483592 res!1007760) b!1483590))

(assert (= (and b!1483590 res!1007763) b!1483584))

(assert (= (and b!1483584 res!1007764) b!1483581))

(assert (= (and b!1483581 res!1007762) b!1483589))

(assert (= (and b!1483589 res!1007757) b!1483588))

(assert (= (and b!1483588 res!1007768) b!1483594))

(assert (= (and b!1483594 res!1007767) b!1483593))

(assert (= (and b!1483593 c!137443) b!1483587))

(assert (= (and b!1483593 (not c!137443)) b!1483595))

(assert (= (and b!1483593 res!1007766) b!1483585))

(assert (= (and b!1483585 res!1007769) b!1483583))

(assert (= (and b!1483583 res!1007765) b!1483597))

(assert (= (and b!1483597 res!1007761) b!1483596))

(declare-fun m!1369291 () Bool)

(assert (=> b!1483589 m!1369291))

(assert (=> b!1483589 m!1369291))

(declare-fun m!1369293 () Bool)

(assert (=> b!1483589 m!1369293))

(assert (=> b!1483589 m!1369293))

(assert (=> b!1483589 m!1369291))

(declare-fun m!1369295 () Bool)

(assert (=> b!1483589 m!1369295))

(assert (=> b!1483586 m!1369291))

(assert (=> b!1483586 m!1369291))

(declare-fun m!1369297 () Bool)

(assert (=> b!1483586 m!1369297))

(declare-fun m!1369299 () Bool)

(assert (=> b!1483590 m!1369299))

(declare-fun m!1369301 () Bool)

(assert (=> b!1483596 m!1369301))

(declare-fun m!1369303 () Bool)

(assert (=> b!1483596 m!1369303))

(declare-fun m!1369305 () Bool)

(assert (=> b!1483596 m!1369305))

(declare-fun m!1369307 () Bool)

(assert (=> b!1483596 m!1369307))

(assert (=> b!1483596 m!1369291))

(declare-fun m!1369309 () Bool)

(assert (=> b!1483595 m!1369309))

(declare-fun m!1369311 () Bool)

(assert (=> b!1483595 m!1369311))

(assert (=> b!1483597 m!1369291))

(assert (=> b!1483597 m!1369291))

(declare-fun m!1369313 () Bool)

(assert (=> b!1483597 m!1369313))

(declare-fun m!1369315 () Bool)

(assert (=> start!126672 m!1369315))

(declare-fun m!1369317 () Bool)

(assert (=> start!126672 m!1369317))

(assert (=> b!1483581 m!1369301))

(declare-fun m!1369319 () Bool)

(assert (=> b!1483581 m!1369319))

(declare-fun m!1369321 () Bool)

(assert (=> b!1483583 m!1369321))

(declare-fun m!1369323 () Bool)

(assert (=> b!1483583 m!1369323))

(declare-fun m!1369325 () Bool)

(assert (=> b!1483594 m!1369325))

(assert (=> b!1483594 m!1369325))

(declare-fun m!1369327 () Bool)

(assert (=> b!1483594 m!1369327))

(assert (=> b!1483594 m!1369301))

(declare-fun m!1369329 () Bool)

(assert (=> b!1483594 m!1369329))

(declare-fun m!1369331 () Bool)

(assert (=> b!1483592 m!1369331))

(assert (=> b!1483588 m!1369291))

(assert (=> b!1483588 m!1369291))

(declare-fun m!1369333 () Bool)

(assert (=> b!1483588 m!1369333))

(declare-fun m!1369335 () Bool)

(assert (=> b!1483582 m!1369335))

(assert (=> b!1483582 m!1369335))

(declare-fun m!1369337 () Bool)

(assert (=> b!1483582 m!1369337))

(declare-fun m!1369339 () Bool)

(assert (=> b!1483587 m!1369339))

(check-sat (not b!1483595) (not start!126672) (not b!1483583) (not b!1483594) (not b!1483597) (not b!1483582) (not b!1483587) (not b!1483589) (not b!1483590) (not b!1483592) (not b!1483586) (not b!1483588))
(check-sat)
