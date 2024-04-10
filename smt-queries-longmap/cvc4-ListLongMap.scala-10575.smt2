; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124592 () Bool)

(assert start!124592)

(declare-fun b!1442489 () Bool)

(declare-fun res!974707 () Bool)

(declare-fun e!812999 () Bool)

(assert (=> b!1442489 (=> (not res!974707) (not e!812999))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442489 (= res!974707 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442490 () Bool)

(declare-fun res!974709 () Bool)

(declare-fun e!813000 () Bool)

(assert (=> b!1442490 (=> (not res!974709) (not e!813000))))

(declare-datatypes ((array!98040 0))(
  ( (array!98041 (arr!47308 (Array (_ BitVec 32) (_ BitVec 64))) (size!47858 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98040)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11560 0))(
  ( (MissingZero!11560 (index!48632 (_ BitVec 32))) (Found!11560 (index!48633 (_ BitVec 32))) (Intermediate!11560 (undefined!12372 Bool) (index!48634 (_ BitVec 32)) (x!130337 (_ BitVec 32))) (Undefined!11560) (MissingVacant!11560 (index!48635 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98040 (_ BitVec 32)) SeekEntryResult!11560)

(assert (=> b!1442490 (= res!974709 (= (seekEntryOrOpen!0 (select (arr!47308 a!2862) j!93) a!2862 mask!2687) (Found!11560 j!93)))))

(declare-fun b!1442491 () Bool)

(declare-fun res!974702 () Bool)

(declare-fun e!813003 () Bool)

(assert (=> b!1442491 (=> (not res!974702) (not e!813003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98040 (_ BitVec 32)) Bool)

(assert (=> b!1442491 (= res!974702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442492 () Bool)

(declare-fun res!974713 () Bool)

(assert (=> b!1442492 (=> (not res!974713) (not e!813003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442492 (= res!974713 (validKeyInArray!0 (select (arr!47308 a!2862) i!1006)))))

(declare-fun b!1442493 () Bool)

(declare-fun e!813002 () Bool)

(assert (=> b!1442493 (= e!813002 e!812999)))

(declare-fun res!974710 () Bool)

(assert (=> b!1442493 (=> (not res!974710) (not e!812999))))

(declare-fun lt!633578 () SeekEntryResult!11560)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442493 (= res!974710 (= lt!633578 (Intermediate!11560 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633577 () (_ BitVec 64))

(declare-fun lt!633576 () array!98040)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98040 (_ BitVec 32)) SeekEntryResult!11560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442493 (= lt!633578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633577 mask!2687) lt!633577 lt!633576 mask!2687))))

(assert (=> b!1442493 (= lt!633577 (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442494 () Bool)

(declare-fun res!974711 () Bool)

(assert (=> b!1442494 (=> (not res!974711) (not e!813002))))

(declare-fun lt!633579 () SeekEntryResult!11560)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1442494 (= res!974711 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47308 a!2862) j!93) a!2862 mask!2687) lt!633579))))

(declare-fun b!1442495 () Bool)

(declare-fun e!813001 () Bool)

(assert (=> b!1442495 (= e!813003 e!813001)))

(declare-fun res!974708 () Bool)

(assert (=> b!1442495 (=> (not res!974708) (not e!813001))))

(assert (=> b!1442495 (= res!974708 (= (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442495 (= lt!633576 (array!98041 (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47858 a!2862)))))

(declare-fun b!1442496 () Bool)

(declare-fun res!974706 () Bool)

(assert (=> b!1442496 (=> (not res!974706) (not e!812999))))

(declare-fun e!813005 () Bool)

(assert (=> b!1442496 (= res!974706 e!813005)))

(declare-fun c!133404 () Bool)

(assert (=> b!1442496 (= c!133404 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442497 () Bool)

(assert (=> b!1442497 (= e!813001 e!813002)))

(declare-fun res!974705 () Bool)

(assert (=> b!1442497 (=> (not res!974705) (not e!813002))))

(assert (=> b!1442497 (= res!974705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47308 a!2862) j!93) mask!2687) (select (arr!47308 a!2862) j!93) a!2862 mask!2687) lt!633579))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442497 (= lt!633579 (Intermediate!11560 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442498 () Bool)

(declare-fun res!974716 () Bool)

(assert (=> b!1442498 (=> (not res!974716) (not e!813003))))

(assert (=> b!1442498 (= res!974716 (and (= (size!47858 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47858 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47858 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442499 () Bool)

(assert (=> b!1442499 (= e!813000 (or (= (select (arr!47308 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47308 a!2862) intermediateBeforeIndex!19) (select (arr!47308 a!2862) j!93))))))

(declare-fun b!1442501 () Bool)

(declare-fun res!974703 () Bool)

(assert (=> b!1442501 (=> (not res!974703) (not e!813003))))

(assert (=> b!1442501 (= res!974703 (validKeyInArray!0 (select (arr!47308 a!2862) j!93)))))

(declare-fun b!1442502 () Bool)

(declare-fun res!974714 () Bool)

(assert (=> b!1442502 (=> (not res!974714) (not e!813003))))

(declare-datatypes ((List!33809 0))(
  ( (Nil!33806) (Cons!33805 (h!35155 (_ BitVec 64)) (t!48503 List!33809)) )
))
(declare-fun arrayNoDuplicates!0 (array!98040 (_ BitVec 32) List!33809) Bool)

(assert (=> b!1442502 (= res!974714 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33806))))

(declare-fun b!1442503 () Bool)

(declare-fun res!974715 () Bool)

(assert (=> b!1442503 (=> (not res!974715) (not e!813003))))

(assert (=> b!1442503 (= res!974715 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47858 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47858 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47858 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442504 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98040 (_ BitVec 32)) SeekEntryResult!11560)

(assert (=> b!1442504 (= e!813005 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633577 lt!633576 mask!2687) (seekEntryOrOpen!0 lt!633577 lt!633576 mask!2687)))))

(declare-fun b!1442505 () Bool)

(assert (=> b!1442505 (= e!812999 (not true))))

(assert (=> b!1442505 e!813000))

(declare-fun res!974712 () Bool)

(assert (=> b!1442505 (=> (not res!974712) (not e!813000))))

(assert (=> b!1442505 (= res!974712 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48616 0))(
  ( (Unit!48617) )
))
(declare-fun lt!633575 () Unit!48616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48616)

(assert (=> b!1442505 (= lt!633575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!974704 () Bool)

(assert (=> start!124592 (=> (not res!974704) (not e!813003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124592 (= res!974704 (validMask!0 mask!2687))))

(assert (=> start!124592 e!813003))

(assert (=> start!124592 true))

(declare-fun array_inv!36336 (array!98040) Bool)

(assert (=> start!124592 (array_inv!36336 a!2862)))

(declare-fun b!1442500 () Bool)

(assert (=> b!1442500 (= e!813005 (= lt!633578 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633577 lt!633576 mask!2687)))))

(assert (= (and start!124592 res!974704) b!1442498))

(assert (= (and b!1442498 res!974716) b!1442492))

(assert (= (and b!1442492 res!974713) b!1442501))

(assert (= (and b!1442501 res!974703) b!1442491))

(assert (= (and b!1442491 res!974702) b!1442502))

(assert (= (and b!1442502 res!974714) b!1442503))

(assert (= (and b!1442503 res!974715) b!1442495))

(assert (= (and b!1442495 res!974708) b!1442497))

(assert (= (and b!1442497 res!974705) b!1442494))

(assert (= (and b!1442494 res!974711) b!1442493))

(assert (= (and b!1442493 res!974710) b!1442496))

(assert (= (and b!1442496 c!133404) b!1442500))

(assert (= (and b!1442496 (not c!133404)) b!1442504))

(assert (= (and b!1442496 res!974706) b!1442489))

(assert (= (and b!1442489 res!974707) b!1442505))

(assert (= (and b!1442505 res!974712) b!1442490))

(assert (= (and b!1442490 res!974709) b!1442499))

(declare-fun m!1331637 () Bool)

(assert (=> b!1442499 m!1331637))

(declare-fun m!1331639 () Bool)

(assert (=> b!1442499 m!1331639))

(assert (=> b!1442497 m!1331639))

(assert (=> b!1442497 m!1331639))

(declare-fun m!1331641 () Bool)

(assert (=> b!1442497 m!1331641))

(assert (=> b!1442497 m!1331641))

(assert (=> b!1442497 m!1331639))

(declare-fun m!1331643 () Bool)

(assert (=> b!1442497 m!1331643))

(declare-fun m!1331645 () Bool)

(assert (=> b!1442504 m!1331645))

(declare-fun m!1331647 () Bool)

(assert (=> b!1442504 m!1331647))

(assert (=> b!1442494 m!1331639))

(assert (=> b!1442494 m!1331639))

(declare-fun m!1331649 () Bool)

(assert (=> b!1442494 m!1331649))

(declare-fun m!1331651 () Bool)

(assert (=> start!124592 m!1331651))

(declare-fun m!1331653 () Bool)

(assert (=> start!124592 m!1331653))

(assert (=> b!1442501 m!1331639))

(assert (=> b!1442501 m!1331639))

(declare-fun m!1331655 () Bool)

(assert (=> b!1442501 m!1331655))

(declare-fun m!1331657 () Bool)

(assert (=> b!1442502 m!1331657))

(assert (=> b!1442490 m!1331639))

(assert (=> b!1442490 m!1331639))

(declare-fun m!1331659 () Bool)

(assert (=> b!1442490 m!1331659))

(declare-fun m!1331661 () Bool)

(assert (=> b!1442491 m!1331661))

(declare-fun m!1331663 () Bool)

(assert (=> b!1442500 m!1331663))

(declare-fun m!1331665 () Bool)

(assert (=> b!1442493 m!1331665))

(assert (=> b!1442493 m!1331665))

(declare-fun m!1331667 () Bool)

(assert (=> b!1442493 m!1331667))

(declare-fun m!1331669 () Bool)

(assert (=> b!1442493 m!1331669))

(declare-fun m!1331671 () Bool)

(assert (=> b!1442493 m!1331671))

(declare-fun m!1331673 () Bool)

(assert (=> b!1442505 m!1331673))

(declare-fun m!1331675 () Bool)

(assert (=> b!1442505 m!1331675))

(declare-fun m!1331677 () Bool)

(assert (=> b!1442492 m!1331677))

(assert (=> b!1442492 m!1331677))

(declare-fun m!1331679 () Bool)

(assert (=> b!1442492 m!1331679))

(assert (=> b!1442495 m!1331669))

(declare-fun m!1331681 () Bool)

(assert (=> b!1442495 m!1331681))

(push 1)

