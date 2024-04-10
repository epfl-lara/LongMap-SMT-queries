; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127344 () Bool)

(assert start!127344)

(declare-fun b!1496464 () Bool)

(declare-fun res!1017816 () Bool)

(declare-fun e!838167 () Bool)

(assert (=> b!1496464 (=> (not res!1017816) (not e!838167))))

(declare-datatypes ((array!99806 0))(
  ( (array!99807 (arr!48167 (Array (_ BitVec 32) (_ BitVec 64))) (size!48717 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99806)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99806 (_ BitVec 32)) Bool)

(assert (=> b!1496464 (= res!1017816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!838165 () Bool)

(declare-fun b!1496465 () Bool)

(declare-fun lt!652106 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!652105 () array!99806)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12407 0))(
  ( (MissingZero!12407 (index!52020 (_ BitVec 32))) (Found!12407 (index!52021 (_ BitVec 32))) (Intermediate!12407 (undefined!13219 Bool) (index!52022 (_ BitVec 32)) (x!133649 (_ BitVec 32))) (Undefined!12407) (MissingVacant!12407 (index!52023 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99806 (_ BitVec 32)) SeekEntryResult!12407)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99806 (_ BitVec 32)) SeekEntryResult!12407)

(assert (=> b!1496465 (= e!838165 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652106 lt!652105 mask!2687) (seekEntryOrOpen!0 lt!652106 lt!652105 mask!2687)))))

(declare-fun b!1496466 () Bool)

(declare-fun res!1017803 () Bool)

(assert (=> b!1496466 (=> (not res!1017803) (not e!838167))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496466 (= res!1017803 (validKeyInArray!0 (select (arr!48167 a!2862) i!1006)))))

(declare-fun b!1496467 () Bool)

(declare-fun res!1017813 () Bool)

(declare-fun e!838164 () Bool)

(assert (=> b!1496467 (=> res!1017813 e!838164)))

(declare-fun e!838168 () Bool)

(assert (=> b!1496467 (= res!1017813 e!838168)))

(declare-fun c!138866 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496467 (= c!138866 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496468 () Bool)

(declare-fun e!838166 () Bool)

(assert (=> b!1496468 (= e!838166 e!838164)))

(declare-fun res!1017819 () Bool)

(assert (=> b!1496468 (=> res!1017819 e!838164)))

(declare-fun lt!652103 () (_ BitVec 32))

(assert (=> b!1496468 (= res!1017819 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652103 #b00000000000000000000000000000000) (bvsge lt!652103 (size!48717 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496468 (= lt!652103 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496469 () Bool)

(declare-fun lt!652104 () SeekEntryResult!12407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99806 (_ BitVec 32)) SeekEntryResult!12407)

(assert (=> b!1496469 (= e!838165 (= lt!652104 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652106 lt!652105 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!838161 () Bool)

(declare-fun b!1496470 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496470 (= e!838161 (or (= (select (arr!48167 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48167 a!2862) intermediateBeforeIndex!19) (select (arr!48167 a!2862) j!93))))))

(declare-fun b!1496471 () Bool)

(declare-fun res!1017805 () Bool)

(declare-fun e!838159 () Bool)

(assert (=> b!1496471 (=> (not res!1017805) (not e!838159))))

(assert (=> b!1496471 (= res!1017805 e!838165)))

(declare-fun c!138865 () Bool)

(assert (=> b!1496471 (= c!138865 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496472 () Bool)

(declare-fun res!1017807 () Bool)

(assert (=> b!1496472 (=> (not res!1017807) (not e!838167))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496472 (= res!1017807 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48717 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48717 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48717 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496473 () Bool)

(assert (=> b!1496473 (= e!838168 (not (= lt!652104 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 lt!652106 lt!652105 mask!2687))))))

(declare-fun b!1496474 () Bool)

(declare-fun res!1017817 () Bool)

(assert (=> b!1496474 (=> (not res!1017817) (not e!838161))))

(assert (=> b!1496474 (= res!1017817 (= (seekEntryOrOpen!0 (select (arr!48167 a!2862) j!93) a!2862 mask!2687) (Found!12407 j!93)))))

(declare-fun b!1496475 () Bool)

(declare-fun res!1017802 () Bool)

(assert (=> b!1496475 (=> (not res!1017802) (not e!838159))))

(assert (=> b!1496475 (= res!1017802 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496476 () Bool)

(declare-fun e!838162 () Bool)

(declare-fun e!838163 () Bool)

(assert (=> b!1496476 (= e!838162 e!838163)))

(declare-fun res!1017815 () Bool)

(assert (=> b!1496476 (=> (not res!1017815) (not e!838163))))

(declare-fun lt!652108 () SeekEntryResult!12407)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496476 (= res!1017815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48167 a!2862) j!93) mask!2687) (select (arr!48167 a!2862) j!93) a!2862 mask!2687) lt!652108))))

(assert (=> b!1496476 (= lt!652108 (Intermediate!12407 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496477 () Bool)

(declare-fun res!1017810 () Bool)

(assert (=> b!1496477 (=> (not res!1017810) (not e!838167))))

(assert (=> b!1496477 (= res!1017810 (and (= (size!48717 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48717 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48717 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496479 () Bool)

(assert (=> b!1496479 (= e!838163 e!838159)))

(declare-fun res!1017811 () Bool)

(assert (=> b!1496479 (=> (not res!1017811) (not e!838159))))

(assert (=> b!1496479 (= res!1017811 (= lt!652104 (Intermediate!12407 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496479 (= lt!652104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652106 mask!2687) lt!652106 lt!652105 mask!2687))))

(assert (=> b!1496479 (= lt!652106 (select (store (arr!48167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496480 () Bool)

(assert (=> b!1496480 (= e!838168 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 intermediateAfterIndex!19 lt!652106 lt!652105 mask!2687) (seekEntryOrOpen!0 lt!652106 lt!652105 mask!2687))))))

(declare-fun b!1496481 () Bool)

(declare-fun res!1017808 () Bool)

(assert (=> b!1496481 (=> (not res!1017808) (not e!838167))))

(declare-datatypes ((List!34668 0))(
  ( (Nil!34665) (Cons!34664 (h!36061 (_ BitVec 64)) (t!49362 List!34668)) )
))
(declare-fun arrayNoDuplicates!0 (array!99806 (_ BitVec 32) List!34668) Bool)

(assert (=> b!1496481 (= res!1017808 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34665))))

(declare-fun b!1496482 () Bool)

(declare-fun res!1017818 () Bool)

(assert (=> b!1496482 (=> res!1017818 e!838164)))

(assert (=> b!1496482 (= res!1017818 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 (select (arr!48167 a!2862) j!93) a!2862 mask!2687) lt!652108)))))

(declare-fun b!1496483 () Bool)

(assert (=> b!1496483 (= e!838167 e!838162)))

(declare-fun res!1017812 () Bool)

(assert (=> b!1496483 (=> (not res!1017812) (not e!838162))))

(assert (=> b!1496483 (= res!1017812 (= (select (store (arr!48167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496483 (= lt!652105 (array!99807 (store (arr!48167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48717 a!2862)))))

(declare-fun b!1496484 () Bool)

(assert (=> b!1496484 (= e!838159 (not e!838166))))

(declare-fun res!1017804 () Bool)

(assert (=> b!1496484 (=> res!1017804 e!838166)))

(assert (=> b!1496484 (= res!1017804 (or (and (= (select (arr!48167 a!2862) index!646) (select (store (arr!48167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48167 a!2862) index!646) (select (arr!48167 a!2862) j!93))) (= (select (arr!48167 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496484 e!838161))

(declare-fun res!1017809 () Bool)

(assert (=> b!1496484 (=> (not res!1017809) (not e!838161))))

(assert (=> b!1496484 (= res!1017809 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50154 0))(
  ( (Unit!50155) )
))
(declare-fun lt!652107 () Unit!50154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50154)

(assert (=> b!1496484 (= lt!652107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496485 () Bool)

(assert (=> b!1496485 (= e!838164 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1496486 () Bool)

(declare-fun res!1017820 () Bool)

(assert (=> b!1496486 (=> (not res!1017820) (not e!838167))))

(assert (=> b!1496486 (= res!1017820 (validKeyInArray!0 (select (arr!48167 a!2862) j!93)))))

(declare-fun res!1017814 () Bool)

(assert (=> start!127344 (=> (not res!1017814) (not e!838167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127344 (= res!1017814 (validMask!0 mask!2687))))

(assert (=> start!127344 e!838167))

(assert (=> start!127344 true))

(declare-fun array_inv!37195 (array!99806) Bool)

(assert (=> start!127344 (array_inv!37195 a!2862)))

(declare-fun b!1496478 () Bool)

(declare-fun res!1017806 () Bool)

(assert (=> b!1496478 (=> (not res!1017806) (not e!838163))))

(assert (=> b!1496478 (= res!1017806 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48167 a!2862) j!93) a!2862 mask!2687) lt!652108))))

(assert (= (and start!127344 res!1017814) b!1496477))

(assert (= (and b!1496477 res!1017810) b!1496466))

(assert (= (and b!1496466 res!1017803) b!1496486))

(assert (= (and b!1496486 res!1017820) b!1496464))

(assert (= (and b!1496464 res!1017816) b!1496481))

(assert (= (and b!1496481 res!1017808) b!1496472))

(assert (= (and b!1496472 res!1017807) b!1496483))

(assert (= (and b!1496483 res!1017812) b!1496476))

(assert (= (and b!1496476 res!1017815) b!1496478))

(assert (= (and b!1496478 res!1017806) b!1496479))

(assert (= (and b!1496479 res!1017811) b!1496471))

(assert (= (and b!1496471 c!138865) b!1496469))

(assert (= (and b!1496471 (not c!138865)) b!1496465))

(assert (= (and b!1496471 res!1017805) b!1496475))

(assert (= (and b!1496475 res!1017802) b!1496484))

(assert (= (and b!1496484 res!1017809) b!1496474))

(assert (= (and b!1496474 res!1017817) b!1496470))

(assert (= (and b!1496484 (not res!1017804)) b!1496468))

(assert (= (and b!1496468 (not res!1017819)) b!1496482))

(assert (= (and b!1496482 (not res!1017818)) b!1496467))

(assert (= (and b!1496467 c!138866) b!1496473))

(assert (= (and b!1496467 (not c!138866)) b!1496480))

(assert (= (and b!1496467 (not res!1017813)) b!1496485))

(declare-fun m!1379641 () Bool)

(assert (=> b!1496468 m!1379641))

(declare-fun m!1379643 () Bool)

(assert (=> b!1496480 m!1379643))

(declare-fun m!1379645 () Bool)

(assert (=> b!1496480 m!1379645))

(declare-fun m!1379647 () Bool)

(assert (=> b!1496464 m!1379647))

(declare-fun m!1379649 () Bool)

(assert (=> b!1496465 m!1379649))

(assert (=> b!1496465 m!1379645))

(declare-fun m!1379651 () Bool)

(assert (=> b!1496478 m!1379651))

(assert (=> b!1496478 m!1379651))

(declare-fun m!1379653 () Bool)

(assert (=> b!1496478 m!1379653))

(declare-fun m!1379655 () Bool)

(assert (=> b!1496481 m!1379655))

(declare-fun m!1379657 () Bool)

(assert (=> b!1496469 m!1379657))

(assert (=> b!1496474 m!1379651))

(assert (=> b!1496474 m!1379651))

(declare-fun m!1379659 () Bool)

(assert (=> b!1496474 m!1379659))

(declare-fun m!1379661 () Bool)

(assert (=> b!1496484 m!1379661))

(declare-fun m!1379663 () Bool)

(assert (=> b!1496484 m!1379663))

(declare-fun m!1379665 () Bool)

(assert (=> b!1496484 m!1379665))

(declare-fun m!1379667 () Bool)

(assert (=> b!1496484 m!1379667))

(declare-fun m!1379669 () Bool)

(assert (=> b!1496484 m!1379669))

(assert (=> b!1496484 m!1379651))

(assert (=> b!1496483 m!1379663))

(declare-fun m!1379671 () Bool)

(assert (=> b!1496483 m!1379671))

(declare-fun m!1379673 () Bool)

(assert (=> b!1496479 m!1379673))

(assert (=> b!1496479 m!1379673))

(declare-fun m!1379675 () Bool)

(assert (=> b!1496479 m!1379675))

(assert (=> b!1496479 m!1379663))

(declare-fun m!1379677 () Bool)

(assert (=> b!1496479 m!1379677))

(declare-fun m!1379679 () Bool)

(assert (=> b!1496473 m!1379679))

(assert (=> b!1496476 m!1379651))

(assert (=> b!1496476 m!1379651))

(declare-fun m!1379681 () Bool)

(assert (=> b!1496476 m!1379681))

(assert (=> b!1496476 m!1379681))

(assert (=> b!1496476 m!1379651))

(declare-fun m!1379683 () Bool)

(assert (=> b!1496476 m!1379683))

(assert (=> b!1496482 m!1379651))

(assert (=> b!1496482 m!1379651))

(declare-fun m!1379685 () Bool)

(assert (=> b!1496482 m!1379685))

(declare-fun m!1379687 () Bool)

(assert (=> b!1496470 m!1379687))

(assert (=> b!1496470 m!1379651))

(declare-fun m!1379689 () Bool)

(assert (=> b!1496466 m!1379689))

(assert (=> b!1496466 m!1379689))

(declare-fun m!1379691 () Bool)

(assert (=> b!1496466 m!1379691))

(declare-fun m!1379693 () Bool)

(assert (=> start!127344 m!1379693))

(declare-fun m!1379695 () Bool)

(assert (=> start!127344 m!1379695))

(assert (=> b!1496486 m!1379651))

(assert (=> b!1496486 m!1379651))

(declare-fun m!1379697 () Bool)

(assert (=> b!1496486 m!1379697))

(push 1)

(assert (not b!1496473))

(assert (not b!1496484))

(assert (not start!127344))

(assert (not b!1496482))

(assert (not b!1496478))

(assert (not b!1496476))

(assert (not b!1496464))

(assert (not b!1496469))

(assert (not b!1496486))

(assert (not b!1496481))

(assert (not b!1496468))

(assert (not b!1496465))

(assert (not b!1496466))

(assert (not b!1496474))

(assert (not b!1496480))

(assert (not b!1496479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

