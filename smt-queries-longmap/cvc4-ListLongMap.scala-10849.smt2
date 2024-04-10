; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127010 () Bool)

(assert start!127010)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1492681 () Bool)

(declare-fun e!836233 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650736 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99720 0))(
  ( (array!99721 (arr!48130 (Array (_ BitVec 32) (_ BitVec 64))) (size!48680 (_ BitVec 32))) )
))
(declare-fun lt!650732 () array!99720)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12370 0))(
  ( (MissingZero!12370 (index!51872 (_ BitVec 32))) (Found!12370 (index!51873 (_ BitVec 32))) (Intermediate!12370 (undefined!13182 Bool) (index!51874 (_ BitVec 32)) (x!133462 (_ BitVec 32))) (Undefined!12370) (MissingVacant!12370 (index!51875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99720 (_ BitVec 32)) SeekEntryResult!12370)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99720 (_ BitVec 32)) SeekEntryResult!12370)

(assert (=> b!1492681 (= e!836233 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650736 lt!650732 mask!2687) (seekEntryOrOpen!0 lt!650736 lt!650732 mask!2687)))))

(declare-fun b!1492682 () Bool)

(declare-fun e!836240 () Bool)

(declare-fun e!836235 () Bool)

(assert (=> b!1492682 (= e!836240 e!836235)))

(declare-fun res!1015480 () Bool)

(assert (=> b!1492682 (=> (not res!1015480) (not e!836235))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!650734 () SeekEntryResult!12370)

(assert (=> b!1492682 (= res!1015480 (= lt!650734 (Intermediate!12370 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99720 (_ BitVec 32)) SeekEntryResult!12370)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492682 (= lt!650734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650736 mask!2687) lt!650736 lt!650732 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99720)

(assert (=> b!1492682 (= lt!650736 (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492683 () Bool)

(declare-fun res!1015495 () Bool)

(declare-fun e!836236 () Bool)

(assert (=> b!1492683 (=> (not res!1015495) (not e!836236))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492683 (= res!1015495 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48680 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48680 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48680 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1015488 () Bool)

(assert (=> start!127010 (=> (not res!1015488) (not e!836236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127010 (= res!1015488 (validMask!0 mask!2687))))

(assert (=> start!127010 e!836236))

(assert (=> start!127010 true))

(declare-fun array_inv!37158 (array!99720) Bool)

(assert (=> start!127010 (array_inv!37158 a!2862)))

(declare-fun b!1492684 () Bool)

(declare-fun e!836239 () Bool)

(assert (=> b!1492684 (= e!836236 e!836239)))

(declare-fun res!1015494 () Bool)

(assert (=> b!1492684 (=> (not res!1015494) (not e!836239))))

(assert (=> b!1492684 (= res!1015494 (= (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492684 (= lt!650732 (array!99721 (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48680 a!2862)))))

(declare-fun b!1492685 () Bool)

(declare-fun res!1015491 () Bool)

(assert (=> b!1492685 (=> (not res!1015491) (not e!836236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492685 (= res!1015491 (validKeyInArray!0 (select (arr!48130 a!2862) i!1006)))))

(declare-fun b!1492686 () Bool)

(declare-fun res!1015493 () Bool)

(assert (=> b!1492686 (=> (not res!1015493) (not e!836235))))

(assert (=> b!1492686 (= res!1015493 e!836233)))

(declare-fun c!138129 () Bool)

(assert (=> b!1492686 (= c!138129 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492687 () Bool)

(declare-fun res!1015485 () Bool)

(assert (=> b!1492687 (=> (not res!1015485) (not e!836236))))

(assert (=> b!1492687 (= res!1015485 (validKeyInArray!0 (select (arr!48130 a!2862) j!93)))))

(declare-fun b!1492688 () Bool)

(declare-fun res!1015487 () Bool)

(assert (=> b!1492688 (=> (not res!1015487) (not e!836235))))

(assert (=> b!1492688 (= res!1015487 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492689 () Bool)

(declare-fun res!1015489 () Bool)

(assert (=> b!1492689 (=> (not res!1015489) (not e!836236))))

(assert (=> b!1492689 (= res!1015489 (and (= (size!48680 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48680 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48680 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492690 () Bool)

(assert (=> b!1492690 (= e!836233 (= lt!650734 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650736 lt!650732 mask!2687)))))

(declare-fun b!1492691 () Bool)

(declare-fun e!836234 () Bool)

(assert (=> b!1492691 (= e!836235 (not e!836234))))

(declare-fun res!1015484 () Bool)

(assert (=> b!1492691 (=> res!1015484 e!836234)))

(assert (=> b!1492691 (= res!1015484 (or (and (= (select (arr!48130 a!2862) index!646) (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48130 a!2862) index!646) (select (arr!48130 a!2862) j!93))) (= (select (arr!48130 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836238 () Bool)

(assert (=> b!1492691 e!836238))

(declare-fun res!1015481 () Bool)

(assert (=> b!1492691 (=> (not res!1015481) (not e!836238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99720 (_ BitVec 32)) Bool)

(assert (=> b!1492691 (= res!1015481 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50080 0))(
  ( (Unit!50081) )
))
(declare-fun lt!650733 () Unit!50080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50080)

(assert (=> b!1492691 (= lt!650733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492692 () Bool)

(declare-fun res!1015490 () Bool)

(assert (=> b!1492692 (=> (not res!1015490) (not e!836236))))

(assert (=> b!1492692 (= res!1015490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492693 () Bool)

(declare-fun res!1015482 () Bool)

(assert (=> b!1492693 (=> (not res!1015482) (not e!836238))))

(assert (=> b!1492693 (= res!1015482 (= (seekEntryOrOpen!0 (select (arr!48130 a!2862) j!93) a!2862 mask!2687) (Found!12370 j!93)))))

(declare-fun b!1492694 () Bool)

(declare-fun res!1015492 () Bool)

(assert (=> b!1492694 (=> (not res!1015492) (not e!836236))))

(declare-datatypes ((List!34631 0))(
  ( (Nil!34628) (Cons!34627 (h!36013 (_ BitVec 64)) (t!49325 List!34631)) )
))
(declare-fun arrayNoDuplicates!0 (array!99720 (_ BitVec 32) List!34631) Bool)

(assert (=> b!1492694 (= res!1015492 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34628))))

(declare-fun b!1492695 () Bool)

(assert (=> b!1492695 (= e!836238 (or (= (select (arr!48130 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48130 a!2862) intermediateBeforeIndex!19) (select (arr!48130 a!2862) j!93))))))

(declare-fun b!1492696 () Bool)

(assert (=> b!1492696 (= e!836234 true)))

(declare-fun lt!650735 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492696 (= lt!650735 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492697 () Bool)

(declare-fun res!1015486 () Bool)

(assert (=> b!1492697 (=> (not res!1015486) (not e!836240))))

(declare-fun lt!650731 () SeekEntryResult!12370)

(assert (=> b!1492697 (= res!1015486 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!650731))))

(declare-fun b!1492698 () Bool)

(assert (=> b!1492698 (= e!836239 e!836240)))

(declare-fun res!1015483 () Bool)

(assert (=> b!1492698 (=> (not res!1015483) (not e!836240))))

(assert (=> b!1492698 (= res!1015483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48130 a!2862) j!93) mask!2687) (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!650731))))

(assert (=> b!1492698 (= lt!650731 (Intermediate!12370 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!127010 res!1015488) b!1492689))

(assert (= (and b!1492689 res!1015489) b!1492685))

(assert (= (and b!1492685 res!1015491) b!1492687))

(assert (= (and b!1492687 res!1015485) b!1492692))

(assert (= (and b!1492692 res!1015490) b!1492694))

(assert (= (and b!1492694 res!1015492) b!1492683))

(assert (= (and b!1492683 res!1015495) b!1492684))

(assert (= (and b!1492684 res!1015494) b!1492698))

(assert (= (and b!1492698 res!1015483) b!1492697))

(assert (= (and b!1492697 res!1015486) b!1492682))

(assert (= (and b!1492682 res!1015480) b!1492686))

(assert (= (and b!1492686 c!138129) b!1492690))

(assert (= (and b!1492686 (not c!138129)) b!1492681))

(assert (= (and b!1492686 res!1015493) b!1492688))

(assert (= (and b!1492688 res!1015487) b!1492691))

(assert (= (and b!1492691 res!1015481) b!1492693))

(assert (= (and b!1492693 res!1015482) b!1492695))

(assert (= (and b!1492691 (not res!1015484)) b!1492696))

(declare-fun m!1376625 () Bool)

(assert (=> b!1492692 m!1376625))

(declare-fun m!1376627 () Bool)

(assert (=> b!1492695 m!1376627))

(declare-fun m!1376629 () Bool)

(assert (=> b!1492695 m!1376629))

(declare-fun m!1376631 () Bool)

(assert (=> start!127010 m!1376631))

(declare-fun m!1376633 () Bool)

(assert (=> start!127010 m!1376633))

(declare-fun m!1376635 () Bool)

(assert (=> b!1492696 m!1376635))

(declare-fun m!1376637 () Bool)

(assert (=> b!1492694 m!1376637))

(declare-fun m!1376639 () Bool)

(assert (=> b!1492685 m!1376639))

(assert (=> b!1492685 m!1376639))

(declare-fun m!1376641 () Bool)

(assert (=> b!1492685 m!1376641))

(declare-fun m!1376643 () Bool)

(assert (=> b!1492690 m!1376643))

(declare-fun m!1376645 () Bool)

(assert (=> b!1492681 m!1376645))

(declare-fun m!1376647 () Bool)

(assert (=> b!1492681 m!1376647))

(assert (=> b!1492687 m!1376629))

(assert (=> b!1492687 m!1376629))

(declare-fun m!1376649 () Bool)

(assert (=> b!1492687 m!1376649))

(declare-fun m!1376651 () Bool)

(assert (=> b!1492684 m!1376651))

(declare-fun m!1376653 () Bool)

(assert (=> b!1492684 m!1376653))

(assert (=> b!1492697 m!1376629))

(assert (=> b!1492697 m!1376629))

(declare-fun m!1376655 () Bool)

(assert (=> b!1492697 m!1376655))

(declare-fun m!1376657 () Bool)

(assert (=> b!1492691 m!1376657))

(assert (=> b!1492691 m!1376651))

(declare-fun m!1376659 () Bool)

(assert (=> b!1492691 m!1376659))

(declare-fun m!1376661 () Bool)

(assert (=> b!1492691 m!1376661))

(declare-fun m!1376663 () Bool)

(assert (=> b!1492691 m!1376663))

(assert (=> b!1492691 m!1376629))

(assert (=> b!1492693 m!1376629))

(assert (=> b!1492693 m!1376629))

(declare-fun m!1376665 () Bool)

(assert (=> b!1492693 m!1376665))

(assert (=> b!1492698 m!1376629))

(assert (=> b!1492698 m!1376629))

(declare-fun m!1376667 () Bool)

(assert (=> b!1492698 m!1376667))

(assert (=> b!1492698 m!1376667))

(assert (=> b!1492698 m!1376629))

(declare-fun m!1376669 () Bool)

(assert (=> b!1492698 m!1376669))

(declare-fun m!1376671 () Bool)

(assert (=> b!1492682 m!1376671))

(assert (=> b!1492682 m!1376671))

(declare-fun m!1376673 () Bool)

(assert (=> b!1492682 m!1376673))

(assert (=> b!1492682 m!1376651))

(declare-fun m!1376675 () Bool)

(assert (=> b!1492682 m!1376675))

(push 1)

