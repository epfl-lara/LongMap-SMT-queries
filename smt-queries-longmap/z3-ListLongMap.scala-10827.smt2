; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126692 () Bool)

(assert start!126692)

(declare-fun b!1487436 () Bool)

(declare-fun res!1011633 () Bool)

(declare-fun e!833753 () Bool)

(assert (=> b!1487436 (=> (not res!1011633) (not e!833753))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99526 0))(
  ( (array!99527 (arr!48037 (Array (_ BitVec 32) (_ BitVec 64))) (size!48589 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99526)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1487436 (= res!1011633 (or (= (select (arr!48037 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48037 a!2862) intermediateBeforeIndex!19) (select (arr!48037 a!2862) j!93))))))

(declare-fun b!1487437 () Bool)

(declare-fun res!1011639 () Bool)

(declare-fun e!833747 () Bool)

(assert (=> b!1487437 (=> (not res!1011639) (not e!833747))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99526 (_ BitVec 32)) Bool)

(assert (=> b!1487437 (= res!1011639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487438 () Bool)

(declare-fun res!1011649 () Bool)

(assert (=> b!1487438 (=> (not res!1011649) (not e!833747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487438 (= res!1011649 (validKeyInArray!0 (select (arr!48037 a!2862) j!93)))))

(declare-fun b!1487439 () Bool)

(declare-fun e!833749 () Bool)

(declare-fun e!833751 () Bool)

(assert (=> b!1487439 (= e!833749 e!833751)))

(declare-fun res!1011630 () Bool)

(assert (=> b!1487439 (=> (not res!1011630) (not e!833751))))

(declare-datatypes ((SeekEntryResult!12302 0))(
  ( (MissingZero!12302 (index!51600 (_ BitVec 32))) (Found!12302 (index!51601 (_ BitVec 32))) (Intermediate!12302 (undefined!13114 Bool) (index!51602 (_ BitVec 32)) (x!133187 (_ BitVec 32))) (Undefined!12302) (MissingVacant!12302 (index!51603 (_ BitVec 32))) )
))
(declare-fun lt!648661 () SeekEntryResult!12302)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487439 (= res!1011630 (= lt!648661 (Intermediate!12302 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648655 () (_ BitVec 64))

(declare-fun lt!648660 () array!99526)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99526 (_ BitVec 32)) SeekEntryResult!12302)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487439 (= lt!648661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648655 mask!2687) lt!648655 lt!648660 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487439 (= lt!648655 (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487440 () Bool)

(declare-fun res!1011647 () Bool)

(assert (=> b!1487440 (=> (not res!1011647) (not e!833751))))

(declare-fun e!833748 () Bool)

(assert (=> b!1487440 (= res!1011647 e!833748)))

(declare-fun c!137431 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1487440 (= c!137431 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487441 () Bool)

(declare-fun res!1011631 () Bool)

(assert (=> b!1487441 (=> (not res!1011631) (not e!833747))))

(assert (=> b!1487441 (= res!1011631 (validKeyInArray!0 (select (arr!48037 a!2862) i!1006)))))

(declare-fun b!1487442 () Bool)

(declare-fun res!1011637 () Bool)

(assert (=> b!1487442 (=> (not res!1011637) (not e!833749))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648662 () SeekEntryResult!12302)

(assert (=> b!1487442 (= res!1011637 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48037 a!2862) j!93) a!2862 mask!2687) lt!648662))))

(declare-fun b!1487443 () Bool)

(declare-fun e!833756 () Bool)

(assert (=> b!1487443 (= e!833751 (not e!833756))))

(declare-fun res!1011635 () Bool)

(assert (=> b!1487443 (=> res!1011635 e!833756)))

(assert (=> b!1487443 (= res!1011635 (or (and (= (select (arr!48037 a!2862) index!646) (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48037 a!2862) index!646) (select (arr!48037 a!2862) j!93))) (= (select (arr!48037 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487443 e!833753))

(declare-fun res!1011644 () Bool)

(assert (=> b!1487443 (=> (not res!1011644) (not e!833753))))

(assert (=> b!1487443 (= res!1011644 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49785 0))(
  ( (Unit!49786) )
))
(declare-fun lt!648659 () Unit!49785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49785)

(assert (=> b!1487443 (= lt!648659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1011636 () Bool)

(assert (=> start!126692 (=> (not res!1011636) (not e!833747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126692 (= res!1011636 (validMask!0 mask!2687))))

(assert (=> start!126692 e!833747))

(assert (=> start!126692 true))

(declare-fun array_inv!37270 (array!99526) Bool)

(assert (=> start!126692 (array_inv!37270 a!2862)))

(declare-fun b!1487444 () Bool)

(declare-fun e!833754 () Bool)

(declare-fun e!833752 () Bool)

(assert (=> b!1487444 (= e!833754 e!833752)))

(declare-fun res!1011642 () Bool)

(assert (=> b!1487444 (=> (not res!1011642) (not e!833752))))

(declare-fun lt!648658 () (_ BitVec 64))

(assert (=> b!1487444 (= res!1011642 (and (= index!646 intermediateAfterIndex!19) (= lt!648658 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487445 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99526 (_ BitVec 32)) SeekEntryResult!12302)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99526 (_ BitVec 32)) SeekEntryResult!12302)

(assert (=> b!1487445 (= e!833748 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648655 lt!648660 mask!2687) (seekEntryOrOpen!0 lt!648655 lt!648660 mask!2687)))))

(declare-fun b!1487446 () Bool)

(assert (=> b!1487446 (= e!833752 (= (seekEntryOrOpen!0 lt!648655 lt!648660 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648655 lt!648660 mask!2687)))))

(declare-fun b!1487447 () Bool)

(declare-fun e!833746 () Bool)

(assert (=> b!1487447 (= e!833747 e!833746)))

(declare-fun res!1011643 () Bool)

(assert (=> b!1487447 (=> (not res!1011643) (not e!833746))))

(assert (=> b!1487447 (= res!1011643 (= (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487447 (= lt!648660 (array!99527 (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48589 a!2862)))))

(declare-fun b!1487448 () Bool)

(declare-fun e!833750 () Bool)

(assert (=> b!1487448 (= e!833756 e!833750)))

(declare-fun res!1011648 () Bool)

(assert (=> b!1487448 (=> res!1011648 e!833750)))

(declare-fun lt!648657 () (_ BitVec 32))

(assert (=> b!1487448 (= res!1011648 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648657 #b00000000000000000000000000000000) (bvsge lt!648657 (size!48589 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487448 (= lt!648657 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487449 () Bool)

(assert (=> b!1487449 (= e!833750 true)))

(declare-fun lt!648656 () SeekEntryResult!12302)

(assert (=> b!1487449 (= lt!648656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648657 (select (arr!48037 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487450 () Bool)

(declare-fun res!1011634 () Bool)

(assert (=> b!1487450 (=> (not res!1011634) (not e!833747))))

(declare-datatypes ((List!34616 0))(
  ( (Nil!34613) (Cons!34612 (h!35992 (_ BitVec 64)) (t!49302 List!34616)) )
))
(declare-fun arrayNoDuplicates!0 (array!99526 (_ BitVec 32) List!34616) Bool)

(assert (=> b!1487450 (= res!1011634 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34613))))

(declare-fun b!1487451 () Bool)

(assert (=> b!1487451 (= e!833753 e!833754)))

(declare-fun res!1011640 () Bool)

(assert (=> b!1487451 (=> res!1011640 e!833754)))

(assert (=> b!1487451 (= res!1011640 (or (and (= (select (arr!48037 a!2862) index!646) lt!648658) (= (select (arr!48037 a!2862) index!646) (select (arr!48037 a!2862) j!93))) (= (select (arr!48037 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487451 (= lt!648658 (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487452 () Bool)

(assert (=> b!1487452 (= e!833748 (= lt!648661 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648655 lt!648660 mask!2687)))))

(declare-fun b!1487453 () Bool)

(declare-fun res!1011632 () Bool)

(assert (=> b!1487453 (=> (not res!1011632) (not e!833753))))

(assert (=> b!1487453 (= res!1011632 (= (seekEntryOrOpen!0 (select (arr!48037 a!2862) j!93) a!2862 mask!2687) (Found!12302 j!93)))))

(declare-fun b!1487454 () Bool)

(declare-fun res!1011646 () Bool)

(assert (=> b!1487454 (=> (not res!1011646) (not e!833747))))

(assert (=> b!1487454 (= res!1011646 (and (= (size!48589 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48589 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48589 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487455 () Bool)

(assert (=> b!1487455 (= e!833746 e!833749)))

(declare-fun res!1011638 () Bool)

(assert (=> b!1487455 (=> (not res!1011638) (not e!833749))))

(assert (=> b!1487455 (= res!1011638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48037 a!2862) j!93) mask!2687) (select (arr!48037 a!2862) j!93) a!2862 mask!2687) lt!648662))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487455 (= lt!648662 (Intermediate!12302 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487456 () Bool)

(declare-fun res!1011641 () Bool)

(assert (=> b!1487456 (=> (not res!1011641) (not e!833747))))

(assert (=> b!1487456 (= res!1011641 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48589 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48589 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48589 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487457 () Bool)

(declare-fun res!1011645 () Bool)

(assert (=> b!1487457 (=> (not res!1011645) (not e!833751))))

(assert (=> b!1487457 (= res!1011645 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126692 res!1011636) b!1487454))

(assert (= (and b!1487454 res!1011646) b!1487441))

(assert (= (and b!1487441 res!1011631) b!1487438))

(assert (= (and b!1487438 res!1011649) b!1487437))

(assert (= (and b!1487437 res!1011639) b!1487450))

(assert (= (and b!1487450 res!1011634) b!1487456))

(assert (= (and b!1487456 res!1011641) b!1487447))

(assert (= (and b!1487447 res!1011643) b!1487455))

(assert (= (and b!1487455 res!1011638) b!1487442))

(assert (= (and b!1487442 res!1011637) b!1487439))

(assert (= (and b!1487439 res!1011630) b!1487440))

(assert (= (and b!1487440 c!137431) b!1487452))

(assert (= (and b!1487440 (not c!137431)) b!1487445))

(assert (= (and b!1487440 res!1011647) b!1487457))

(assert (= (and b!1487457 res!1011645) b!1487443))

(assert (= (and b!1487443 res!1011644) b!1487453))

(assert (= (and b!1487453 res!1011632) b!1487436))

(assert (= (and b!1487436 res!1011633) b!1487451))

(assert (= (and b!1487451 (not res!1011640)) b!1487444))

(assert (= (and b!1487444 res!1011642) b!1487446))

(assert (= (and b!1487443 (not res!1011635)) b!1487448))

(assert (= (and b!1487448 (not res!1011648)) b!1487449))

(declare-fun m!1371459 () Bool)

(assert (=> b!1487442 m!1371459))

(assert (=> b!1487442 m!1371459))

(declare-fun m!1371461 () Bool)

(assert (=> b!1487442 m!1371461))

(assert (=> b!1487455 m!1371459))

(assert (=> b!1487455 m!1371459))

(declare-fun m!1371463 () Bool)

(assert (=> b!1487455 m!1371463))

(assert (=> b!1487455 m!1371463))

(assert (=> b!1487455 m!1371459))

(declare-fun m!1371465 () Bool)

(assert (=> b!1487455 m!1371465))

(declare-fun m!1371467 () Bool)

(assert (=> b!1487451 m!1371467))

(assert (=> b!1487451 m!1371459))

(declare-fun m!1371469 () Bool)

(assert (=> b!1487451 m!1371469))

(declare-fun m!1371471 () Bool)

(assert (=> b!1487451 m!1371471))

(declare-fun m!1371473 () Bool)

(assert (=> start!126692 m!1371473))

(declare-fun m!1371475 () Bool)

(assert (=> start!126692 m!1371475))

(declare-fun m!1371477 () Bool)

(assert (=> b!1487441 m!1371477))

(assert (=> b!1487441 m!1371477))

(declare-fun m!1371479 () Bool)

(assert (=> b!1487441 m!1371479))

(declare-fun m!1371481 () Bool)

(assert (=> b!1487448 m!1371481))

(declare-fun m!1371483 () Bool)

(assert (=> b!1487437 m!1371483))

(assert (=> b!1487449 m!1371459))

(assert (=> b!1487449 m!1371459))

(declare-fun m!1371485 () Bool)

(assert (=> b!1487449 m!1371485))

(declare-fun m!1371487 () Bool)

(assert (=> b!1487439 m!1371487))

(assert (=> b!1487439 m!1371487))

(declare-fun m!1371489 () Bool)

(assert (=> b!1487439 m!1371489))

(assert (=> b!1487439 m!1371469))

(declare-fun m!1371491 () Bool)

(assert (=> b!1487439 m!1371491))

(declare-fun m!1371493 () Bool)

(assert (=> b!1487443 m!1371493))

(assert (=> b!1487443 m!1371469))

(assert (=> b!1487443 m!1371471))

(assert (=> b!1487443 m!1371467))

(declare-fun m!1371495 () Bool)

(assert (=> b!1487443 m!1371495))

(assert (=> b!1487443 m!1371459))

(assert (=> b!1487447 m!1371469))

(declare-fun m!1371497 () Bool)

(assert (=> b!1487447 m!1371497))

(assert (=> b!1487453 m!1371459))

(assert (=> b!1487453 m!1371459))

(declare-fun m!1371499 () Bool)

(assert (=> b!1487453 m!1371499))

(declare-fun m!1371501 () Bool)

(assert (=> b!1487446 m!1371501))

(declare-fun m!1371503 () Bool)

(assert (=> b!1487446 m!1371503))

(declare-fun m!1371505 () Bool)

(assert (=> b!1487436 m!1371505))

(assert (=> b!1487436 m!1371459))

(declare-fun m!1371507 () Bool)

(assert (=> b!1487450 m!1371507))

(declare-fun m!1371509 () Bool)

(assert (=> b!1487452 m!1371509))

(assert (=> b!1487445 m!1371503))

(assert (=> b!1487445 m!1371501))

(assert (=> b!1487438 m!1371459))

(assert (=> b!1487438 m!1371459))

(declare-fun m!1371511 () Bool)

(assert (=> b!1487438 m!1371511))

(check-sat (not b!1487452) (not b!1487438) (not b!1487455) (not b!1487445) (not b!1487453) (not start!126692) (not b!1487443) (not b!1487439) (not b!1487442) (not b!1487441) (not b!1487437) (not b!1487448) (not b!1487450) (not b!1487449) (not b!1487446))
(check-sat)
