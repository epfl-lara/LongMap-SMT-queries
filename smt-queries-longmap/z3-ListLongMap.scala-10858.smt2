; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127142 () Bool)

(assert start!127142)

(declare-fun b!1494462 () Bool)

(declare-fun res!1016775 () Bool)

(declare-fun e!837081 () Bool)

(assert (=> b!1494462 (=> (not res!1016775) (not e!837081))))

(declare-datatypes ((array!99724 0))(
  ( (array!99725 (arr!48130 (Array (_ BitVec 32) (_ BitVec 64))) (size!48682 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99724)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12395 0))(
  ( (MissingZero!12395 (index!51972 (_ BitVec 32))) (Found!12395 (index!51973 (_ BitVec 32))) (Intermediate!12395 (undefined!13207 Bool) (index!51974 (_ BitVec 32)) (x!133576 (_ BitVec 32))) (Undefined!12395) (MissingVacant!12395 (index!51975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99724 (_ BitVec 32)) SeekEntryResult!12395)

(assert (=> b!1494462 (= res!1016775 (= (seekEntryOrOpen!0 (select (arr!48130 a!2862) j!93) a!2862 mask!2687) (Found!12395 j!93)))))

(declare-fun b!1494463 () Bool)

(declare-fun e!837089 () Bool)

(declare-fun e!837086 () Bool)

(assert (=> b!1494463 (= e!837089 e!837086)))

(declare-fun res!1016773 () Bool)

(assert (=> b!1494463 (=> (not res!1016773) (not e!837086))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!651227 () SeekEntryResult!12395)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1494463 (= res!1016773 (= lt!651227 (Intermediate!12395 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651226 () (_ BitVec 64))

(declare-fun lt!651222 () array!99724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99724 (_ BitVec 32)) SeekEntryResult!12395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494463 (= lt!651227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651226 mask!2687) lt!651226 lt!651222 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494463 (= lt!651226 (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494464 () Bool)

(declare-fun e!837083 () Bool)

(assert (=> b!1494464 (= e!837083 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!651221 () SeekEntryResult!12395)

(declare-fun lt!651223 () (_ BitVec 32))

(assert (=> b!1494464 (= lt!651221 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651223 (select (arr!48130 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494465 () Bool)

(declare-fun res!1016786 () Bool)

(assert (=> b!1494465 (=> (not res!1016786) (not e!837086))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494465 (= res!1016786 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1494466 () Bool)

(declare-fun e!837084 () Bool)

(assert (=> b!1494466 (= e!837084 (= lt!651227 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651226 lt!651222 mask!2687)))))

(declare-fun b!1494467 () Bool)

(declare-fun e!837088 () Bool)

(declare-fun e!837085 () Bool)

(assert (=> b!1494467 (= e!837088 e!837085)))

(declare-fun res!1016772 () Bool)

(assert (=> b!1494467 (=> (not res!1016772) (not e!837085))))

(assert (=> b!1494467 (= res!1016772 (= (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494467 (= lt!651222 (array!99725 (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48682 a!2862)))))

(declare-fun b!1494468 () Bool)

(declare-fun res!1016783 () Bool)

(assert (=> b!1494468 (=> (not res!1016783) (not e!837088))))

(declare-datatypes ((List!34709 0))(
  ( (Nil!34706) (Cons!34705 (h!36097 (_ BitVec 64)) (t!49395 List!34709)) )
))
(declare-fun arrayNoDuplicates!0 (array!99724 (_ BitVec 32) List!34709) Bool)

(assert (=> b!1494468 (= res!1016783 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34706))))

(declare-fun b!1494469 () Bool)

(declare-fun res!1016785 () Bool)

(assert (=> b!1494469 (=> (not res!1016785) (not e!837088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99724 (_ BitVec 32)) Bool)

(assert (=> b!1494469 (= res!1016785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494470 () Bool)

(declare-fun res!1016780 () Bool)

(assert (=> b!1494470 (=> (not res!1016780) (not e!837088))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1494470 (= res!1016780 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48682 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48682 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48682 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494471 () Bool)

(declare-fun e!837082 () Bool)

(assert (=> b!1494471 (= e!837082 e!837083)))

(declare-fun res!1016777 () Bool)

(assert (=> b!1494471 (=> res!1016777 e!837083)))

(assert (=> b!1494471 (= res!1016777 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651223 #b00000000000000000000000000000000) (bvsge lt!651223 (size!48682 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494471 (= lt!651223 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494472 () Bool)

(declare-fun res!1016779 () Bool)

(assert (=> b!1494472 (=> (not res!1016779) (not e!837088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494472 (= res!1016779 (validKeyInArray!0 (select (arr!48130 a!2862) j!93)))))

(declare-fun b!1494473 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99724 (_ BitVec 32)) SeekEntryResult!12395)

(assert (=> b!1494473 (= e!837084 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651226 lt!651222 mask!2687) (seekEntryOrOpen!0 lt!651226 lt!651222 mask!2687)))))

(declare-fun b!1494474 () Bool)

(assert (=> b!1494474 (= e!837081 (or (= (select (arr!48130 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48130 a!2862) intermediateBeforeIndex!19) (select (arr!48130 a!2862) j!93))))))

(declare-fun b!1494475 () Bool)

(declare-fun res!1016784 () Bool)

(assert (=> b!1494475 (=> (not res!1016784) (not e!837088))))

(assert (=> b!1494475 (= res!1016784 (validKeyInArray!0 (select (arr!48130 a!2862) i!1006)))))

(declare-fun b!1494476 () Bool)

(declare-fun res!1016782 () Bool)

(assert (=> b!1494476 (=> (not res!1016782) (not e!837088))))

(assert (=> b!1494476 (= res!1016782 (and (= (size!48682 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48682 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48682 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494477 () Bool)

(declare-fun res!1016781 () Bool)

(assert (=> b!1494477 (=> (not res!1016781) (not e!837086))))

(assert (=> b!1494477 (= res!1016781 e!837084)))

(declare-fun c!138379 () Bool)

(assert (=> b!1494477 (= c!138379 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494478 () Bool)

(assert (=> b!1494478 (= e!837085 e!837089)))

(declare-fun res!1016788 () Bool)

(assert (=> b!1494478 (=> (not res!1016788) (not e!837089))))

(declare-fun lt!651225 () SeekEntryResult!12395)

(assert (=> b!1494478 (= res!1016788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48130 a!2862) j!93) mask!2687) (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!651225))))

(assert (=> b!1494478 (= lt!651225 (Intermediate!12395 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1016778 () Bool)

(assert (=> start!127142 (=> (not res!1016778) (not e!837088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127142 (= res!1016778 (validMask!0 mask!2687))))

(assert (=> start!127142 e!837088))

(assert (=> start!127142 true))

(declare-fun array_inv!37363 (array!99724) Bool)

(assert (=> start!127142 (array_inv!37363 a!2862)))

(declare-fun b!1494479 () Bool)

(assert (=> b!1494479 (= e!837086 (not e!837082))))

(declare-fun res!1016787 () Bool)

(assert (=> b!1494479 (=> res!1016787 e!837082)))

(assert (=> b!1494479 (= res!1016787 (or (and (= (select (arr!48130 a!2862) index!646) (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48130 a!2862) index!646) (select (arr!48130 a!2862) j!93))) (= (select (arr!48130 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494479 e!837081))

(declare-fun res!1016776 () Bool)

(assert (=> b!1494479 (=> (not res!1016776) (not e!837081))))

(assert (=> b!1494479 (= res!1016776 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49971 0))(
  ( (Unit!49972) )
))
(declare-fun lt!651224 () Unit!49971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49971)

(assert (=> b!1494479 (= lt!651224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494480 () Bool)

(declare-fun res!1016774 () Bool)

(assert (=> b!1494480 (=> (not res!1016774) (not e!837089))))

(assert (=> b!1494480 (= res!1016774 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!651225))))

(assert (= (and start!127142 res!1016778) b!1494476))

(assert (= (and b!1494476 res!1016782) b!1494475))

(assert (= (and b!1494475 res!1016784) b!1494472))

(assert (= (and b!1494472 res!1016779) b!1494469))

(assert (= (and b!1494469 res!1016785) b!1494468))

(assert (= (and b!1494468 res!1016783) b!1494470))

(assert (= (and b!1494470 res!1016780) b!1494467))

(assert (= (and b!1494467 res!1016772) b!1494478))

(assert (= (and b!1494478 res!1016788) b!1494480))

(assert (= (and b!1494480 res!1016774) b!1494463))

(assert (= (and b!1494463 res!1016773) b!1494477))

(assert (= (and b!1494477 c!138379) b!1494466))

(assert (= (and b!1494477 (not c!138379)) b!1494473))

(assert (= (and b!1494477 res!1016781) b!1494465))

(assert (= (and b!1494465 res!1016786) b!1494479))

(assert (= (and b!1494479 res!1016776) b!1494462))

(assert (= (and b!1494462 res!1016775) b!1494474))

(assert (= (and b!1494479 (not res!1016787)) b!1494471))

(assert (= (and b!1494471 (not res!1016777)) b!1494464))

(declare-fun m!1377519 () Bool)

(assert (=> b!1494472 m!1377519))

(assert (=> b!1494472 m!1377519))

(declare-fun m!1377521 () Bool)

(assert (=> b!1494472 m!1377521))

(declare-fun m!1377523 () Bool)

(assert (=> b!1494468 m!1377523))

(assert (=> b!1494478 m!1377519))

(assert (=> b!1494478 m!1377519))

(declare-fun m!1377525 () Bool)

(assert (=> b!1494478 m!1377525))

(assert (=> b!1494478 m!1377525))

(assert (=> b!1494478 m!1377519))

(declare-fun m!1377527 () Bool)

(assert (=> b!1494478 m!1377527))

(declare-fun m!1377529 () Bool)

(assert (=> b!1494467 m!1377529))

(declare-fun m!1377531 () Bool)

(assert (=> b!1494467 m!1377531))

(declare-fun m!1377533 () Bool)

(assert (=> b!1494474 m!1377533))

(assert (=> b!1494474 m!1377519))

(declare-fun m!1377535 () Bool)

(assert (=> b!1494463 m!1377535))

(assert (=> b!1494463 m!1377535))

(declare-fun m!1377537 () Bool)

(assert (=> b!1494463 m!1377537))

(assert (=> b!1494463 m!1377529))

(declare-fun m!1377539 () Bool)

(assert (=> b!1494463 m!1377539))

(assert (=> b!1494462 m!1377519))

(assert (=> b!1494462 m!1377519))

(declare-fun m!1377541 () Bool)

(assert (=> b!1494462 m!1377541))

(declare-fun m!1377543 () Bool)

(assert (=> b!1494473 m!1377543))

(declare-fun m!1377545 () Bool)

(assert (=> b!1494473 m!1377545))

(declare-fun m!1377547 () Bool)

(assert (=> b!1494466 m!1377547))

(declare-fun m!1377549 () Bool)

(assert (=> b!1494471 m!1377549))

(declare-fun m!1377551 () Bool)

(assert (=> start!127142 m!1377551))

(declare-fun m!1377553 () Bool)

(assert (=> start!127142 m!1377553))

(assert (=> b!1494464 m!1377519))

(assert (=> b!1494464 m!1377519))

(declare-fun m!1377555 () Bool)

(assert (=> b!1494464 m!1377555))

(declare-fun m!1377557 () Bool)

(assert (=> b!1494469 m!1377557))

(assert (=> b!1494480 m!1377519))

(assert (=> b!1494480 m!1377519))

(declare-fun m!1377559 () Bool)

(assert (=> b!1494480 m!1377559))

(declare-fun m!1377561 () Bool)

(assert (=> b!1494479 m!1377561))

(assert (=> b!1494479 m!1377529))

(declare-fun m!1377563 () Bool)

(assert (=> b!1494479 m!1377563))

(declare-fun m!1377565 () Bool)

(assert (=> b!1494479 m!1377565))

(declare-fun m!1377567 () Bool)

(assert (=> b!1494479 m!1377567))

(assert (=> b!1494479 m!1377519))

(declare-fun m!1377569 () Bool)

(assert (=> b!1494475 m!1377569))

(assert (=> b!1494475 m!1377569))

(declare-fun m!1377571 () Bool)

(assert (=> b!1494475 m!1377571))

(check-sat (not b!1494473) (not b!1494479) (not b!1494466) (not b!1494464) (not b!1494468) (not start!127142) (not b!1494469) (not b!1494471) (not b!1494463) (not b!1494472) (not b!1494480) (not b!1494478) (not b!1494462) (not b!1494475))
(check-sat)
