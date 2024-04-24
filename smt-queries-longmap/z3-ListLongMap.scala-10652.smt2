; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125268 () Bool)

(assert start!125268)

(declare-datatypes ((SeekEntryResult!11739 0))(
  ( (MissingZero!11739 (index!49348 (_ BitVec 32))) (Found!11739 (index!49349 (_ BitVec 32))) (Intermediate!11739 (undefined!12551 Bool) (index!49350 (_ BitVec 32)) (x!131156 (_ BitVec 32))) (Undefined!11739) (MissingVacant!11739 (index!49351 (_ BitVec 32))) )
))
(declare-fun lt!638378 () SeekEntryResult!11739)

(declare-datatypes ((array!98611 0))(
  ( (array!98612 (arr!47590 (Array (_ BitVec 32) (_ BitVec 64))) (size!48141 (_ BitVec 32))) )
))
(declare-fun lt!638382 () array!98611)

(declare-fun b!1456621 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638377 () (_ BitVec 64))

(declare-fun e!819755 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98611 (_ BitVec 32)) SeekEntryResult!11739)

(assert (=> b!1456621 (= e!819755 (= lt!638378 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638377 lt!638382 mask!2687)))))

(declare-fun b!1456622 () Bool)

(declare-fun res!986502 () Bool)

(declare-fun e!819752 () Bool)

(assert (=> b!1456622 (=> (not res!986502) (not e!819752))))

(declare-fun lt!638376 () SeekEntryResult!11739)

(declare-fun a!2862 () array!98611)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1456622 (= res!986502 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!638376))))

(declare-fun b!1456623 () Bool)

(declare-fun res!986501 () Bool)

(declare-fun e!819758 () Bool)

(assert (=> b!1456623 (=> (not res!986501) (not e!819758))))

(assert (=> b!1456623 (= res!986501 e!819755)))

(declare-fun c!134586 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456623 (= c!134586 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456624 () Bool)

(declare-fun res!986495 () Bool)

(declare-fun e!819759 () Bool)

(assert (=> b!1456624 (=> (not res!986495) (not e!819759))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1456624 (= res!986495 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48141 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48141 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48141 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456625 () Bool)

(declare-fun lt!638380 () (_ BitVec 32))

(declare-fun e!819757 () Bool)

(declare-fun lt!638379 () SeekEntryResult!11739)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98611 (_ BitVec 32)) SeekEntryResult!11739)

(assert (=> b!1456625 (= e!819757 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638380 intermediateAfterIndex!19 lt!638377 lt!638382 mask!2687) lt!638379)))))

(declare-fun b!1456626 () Bool)

(declare-fun e!819754 () Bool)

(assert (=> b!1456626 (= e!819759 e!819754)))

(declare-fun res!986499 () Bool)

(assert (=> b!1456626 (=> (not res!986499) (not e!819754))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456626 (= res!986499 (= (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456626 (= lt!638382 (array!98612 (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48141 a!2862)))))

(declare-fun b!1456627 () Bool)

(declare-fun res!986503 () Bool)

(assert (=> b!1456627 (=> (not res!986503) (not e!819759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98611 (_ BitVec 32)) Bool)

(assert (=> b!1456627 (= res!986503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456628 () Bool)

(declare-fun e!819753 () Bool)

(assert (=> b!1456628 (= e!819753 true)))

(declare-fun lt!638383 () Bool)

(assert (=> b!1456628 (= lt!638383 e!819757)))

(declare-fun c!134587 () Bool)

(assert (=> b!1456628 (= c!134587 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456630 () Bool)

(declare-fun e!819750 () Bool)

(assert (=> b!1456630 (= e!819750 e!819753)))

(declare-fun res!986504 () Bool)

(assert (=> b!1456630 (=> res!986504 e!819753)))

(assert (=> b!1456630 (= res!986504 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638380 #b00000000000000000000000000000000) (bvsge lt!638380 (size!48141 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456630 (= lt!638380 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1456630 (= lt!638379 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638377 lt!638382 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98611 (_ BitVec 32)) SeekEntryResult!11739)

(assert (=> b!1456630 (= lt!638379 (seekEntryOrOpen!0 lt!638377 lt!638382 mask!2687))))

(declare-fun b!1456631 () Bool)

(declare-fun res!986494 () Bool)

(assert (=> b!1456631 (=> (not res!986494) (not e!819759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456631 (= res!986494 (validKeyInArray!0 (select (arr!47590 a!2862) j!93)))))

(declare-fun b!1456632 () Bool)

(declare-fun res!986491 () Bool)

(assert (=> b!1456632 (=> (not res!986491) (not e!819759))))

(assert (=> b!1456632 (= res!986491 (validKeyInArray!0 (select (arr!47590 a!2862) i!1006)))))

(declare-fun b!1456633 () Bool)

(declare-fun res!986487 () Bool)

(assert (=> b!1456633 (=> (not res!986487) (not e!819758))))

(assert (=> b!1456633 (= res!986487 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456634 () Bool)

(declare-fun res!986493 () Bool)

(assert (=> b!1456634 (=> (not res!986493) (not e!819759))))

(declare-datatypes ((List!34078 0))(
  ( (Nil!34075) (Cons!34074 (h!35435 (_ BitVec 64)) (t!48764 List!34078)) )
))
(declare-fun arrayNoDuplicates!0 (array!98611 (_ BitVec 32) List!34078) Bool)

(assert (=> b!1456634 (= res!986493 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34075))))

(declare-fun b!1456635 () Bool)

(declare-fun res!986498 () Bool)

(assert (=> b!1456635 (=> res!986498 e!819753)))

(assert (=> b!1456635 (= res!986498 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638380 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!638376)))))

(declare-fun b!1456636 () Bool)

(assert (=> b!1456636 (= e!819758 (not e!819750))))

(declare-fun res!986488 () Bool)

(assert (=> b!1456636 (=> res!986488 e!819750)))

(assert (=> b!1456636 (= res!986488 (or (and (= (select (arr!47590 a!2862) index!646) (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47590 a!2862) index!646) (select (arr!47590 a!2862) j!93))) (= (select (arr!47590 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819751 () Bool)

(assert (=> b!1456636 e!819751))

(declare-fun res!986496 () Bool)

(assert (=> b!1456636 (=> (not res!986496) (not e!819751))))

(assert (=> b!1456636 (= res!986496 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49007 0))(
  ( (Unit!49008) )
))
(declare-fun lt!638381 () Unit!49007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49007)

(assert (=> b!1456636 (= lt!638381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456637 () Bool)

(assert (=> b!1456637 (= e!819752 e!819758)))

(declare-fun res!986497 () Bool)

(assert (=> b!1456637 (=> (not res!986497) (not e!819758))))

(assert (=> b!1456637 (= res!986497 (= lt!638378 (Intermediate!11739 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456637 (= lt!638378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638377 mask!2687) lt!638377 lt!638382 mask!2687))))

(assert (=> b!1456637 (= lt!638377 (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456638 () Bool)

(assert (=> b!1456638 (= e!819755 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638377 lt!638382 mask!2687) (seekEntryOrOpen!0 lt!638377 lt!638382 mask!2687)))))

(declare-fun b!1456629 () Bool)

(assert (=> b!1456629 (= e!819757 (not (= lt!638378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638380 lt!638377 lt!638382 mask!2687))))))

(declare-fun res!986490 () Bool)

(assert (=> start!125268 (=> (not res!986490) (not e!819759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125268 (= res!986490 (validMask!0 mask!2687))))

(assert (=> start!125268 e!819759))

(assert (=> start!125268 true))

(declare-fun array_inv!36871 (array!98611) Bool)

(assert (=> start!125268 (array_inv!36871 a!2862)))

(declare-fun b!1456639 () Bool)

(assert (=> b!1456639 (= e!819754 e!819752)))

(declare-fun res!986500 () Bool)

(assert (=> b!1456639 (=> (not res!986500) (not e!819752))))

(assert (=> b!1456639 (= res!986500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47590 a!2862) j!93) mask!2687) (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!638376))))

(assert (=> b!1456639 (= lt!638376 (Intermediate!11739 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456640 () Bool)

(declare-fun res!986492 () Bool)

(assert (=> b!1456640 (=> (not res!986492) (not e!819751))))

(assert (=> b!1456640 (= res!986492 (= (seekEntryOrOpen!0 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) (Found!11739 j!93)))))

(declare-fun b!1456641 () Bool)

(assert (=> b!1456641 (= e!819751 (and (or (= (select (arr!47590 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47590 a!2862) intermediateBeforeIndex!19) (select (arr!47590 a!2862) j!93))) (let ((bdg!53144 (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47590 a!2862) index!646) bdg!53144) (= (select (arr!47590 a!2862) index!646) (select (arr!47590 a!2862) j!93))) (= (select (arr!47590 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53144 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456642 () Bool)

(declare-fun res!986489 () Bool)

(assert (=> b!1456642 (=> (not res!986489) (not e!819759))))

(assert (=> b!1456642 (= res!986489 (and (= (size!48141 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48141 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48141 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125268 res!986490) b!1456642))

(assert (= (and b!1456642 res!986489) b!1456632))

(assert (= (and b!1456632 res!986491) b!1456631))

(assert (= (and b!1456631 res!986494) b!1456627))

(assert (= (and b!1456627 res!986503) b!1456634))

(assert (= (and b!1456634 res!986493) b!1456624))

(assert (= (and b!1456624 res!986495) b!1456626))

(assert (= (and b!1456626 res!986499) b!1456639))

(assert (= (and b!1456639 res!986500) b!1456622))

(assert (= (and b!1456622 res!986502) b!1456637))

(assert (= (and b!1456637 res!986497) b!1456623))

(assert (= (and b!1456623 c!134586) b!1456621))

(assert (= (and b!1456623 (not c!134586)) b!1456638))

(assert (= (and b!1456623 res!986501) b!1456633))

(assert (= (and b!1456633 res!986487) b!1456636))

(assert (= (and b!1456636 res!986496) b!1456640))

(assert (= (and b!1456640 res!986492) b!1456641))

(assert (= (and b!1456636 (not res!986488)) b!1456630))

(assert (= (and b!1456630 (not res!986504)) b!1456635))

(assert (= (and b!1456635 (not res!986498)) b!1456628))

(assert (= (and b!1456628 c!134587) b!1456629))

(assert (= (and b!1456628 (not c!134587)) b!1456625))

(declare-fun m!1344973 () Bool)

(assert (=> b!1456641 m!1344973))

(declare-fun m!1344975 () Bool)

(assert (=> b!1456641 m!1344975))

(declare-fun m!1344977 () Bool)

(assert (=> b!1456641 m!1344977))

(declare-fun m!1344979 () Bool)

(assert (=> b!1456641 m!1344979))

(declare-fun m!1344981 () Bool)

(assert (=> b!1456641 m!1344981))

(declare-fun m!1344983 () Bool)

(assert (=> b!1456637 m!1344983))

(assert (=> b!1456637 m!1344983))

(declare-fun m!1344985 () Bool)

(assert (=> b!1456637 m!1344985))

(assert (=> b!1456637 m!1344973))

(declare-fun m!1344987 () Bool)

(assert (=> b!1456637 m!1344987))

(assert (=> b!1456635 m!1344981))

(assert (=> b!1456635 m!1344981))

(declare-fun m!1344989 () Bool)

(assert (=> b!1456635 m!1344989))

(declare-fun m!1344991 () Bool)

(assert (=> b!1456629 m!1344991))

(declare-fun m!1344993 () Bool)

(assert (=> b!1456630 m!1344993))

(declare-fun m!1344995 () Bool)

(assert (=> b!1456630 m!1344995))

(declare-fun m!1344997 () Bool)

(assert (=> b!1456630 m!1344997))

(assert (=> b!1456626 m!1344973))

(declare-fun m!1344999 () Bool)

(assert (=> b!1456626 m!1344999))

(declare-fun m!1345001 () Bool)

(assert (=> b!1456636 m!1345001))

(assert (=> b!1456636 m!1344973))

(assert (=> b!1456636 m!1344977))

(assert (=> b!1456636 m!1344979))

(declare-fun m!1345003 () Bool)

(assert (=> b!1456636 m!1345003))

(assert (=> b!1456636 m!1344981))

(assert (=> b!1456640 m!1344981))

(assert (=> b!1456640 m!1344981))

(declare-fun m!1345005 () Bool)

(assert (=> b!1456640 m!1345005))

(declare-fun m!1345007 () Bool)

(assert (=> b!1456634 m!1345007))

(assert (=> b!1456638 m!1344995))

(assert (=> b!1456638 m!1344997))

(declare-fun m!1345009 () Bool)

(assert (=> b!1456621 m!1345009))

(assert (=> b!1456639 m!1344981))

(assert (=> b!1456639 m!1344981))

(declare-fun m!1345011 () Bool)

(assert (=> b!1456639 m!1345011))

(assert (=> b!1456639 m!1345011))

(assert (=> b!1456639 m!1344981))

(declare-fun m!1345013 () Bool)

(assert (=> b!1456639 m!1345013))

(assert (=> b!1456631 m!1344981))

(assert (=> b!1456631 m!1344981))

(declare-fun m!1345015 () Bool)

(assert (=> b!1456631 m!1345015))

(declare-fun m!1345017 () Bool)

(assert (=> b!1456632 m!1345017))

(assert (=> b!1456632 m!1345017))

(declare-fun m!1345019 () Bool)

(assert (=> b!1456632 m!1345019))

(declare-fun m!1345021 () Bool)

(assert (=> b!1456627 m!1345021))

(declare-fun m!1345023 () Bool)

(assert (=> b!1456625 m!1345023))

(assert (=> b!1456622 m!1344981))

(assert (=> b!1456622 m!1344981))

(declare-fun m!1345025 () Bool)

(assert (=> b!1456622 m!1345025))

(declare-fun m!1345027 () Bool)

(assert (=> start!125268 m!1345027))

(declare-fun m!1345029 () Bool)

(assert (=> start!125268 m!1345029))

(check-sat (not b!1456636) (not b!1456637) (not b!1456630) (not b!1456635) (not start!125268) (not b!1456631) (not b!1456632) (not b!1456640) (not b!1456622) (not b!1456629) (not b!1456634) (not b!1456621) (not b!1456639) (not b!1456627) (not b!1456625) (not b!1456638))
(check-sat)
