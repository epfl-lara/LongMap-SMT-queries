; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125576 () Bool)

(assert start!125576)

(declare-datatypes ((array!99024 0))(
  ( (array!99025 (arr!47800 (Array (_ BitVec 32) (_ BitVec 64))) (size!48350 (_ BitVec 32))) )
))
(declare-fun lt!642532 () array!99024)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824920 () Bool)

(declare-fun lt!642531 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1469358 () Bool)

(declare-datatypes ((SeekEntryResult!12040 0))(
  ( (MissingZero!12040 (index!50552 (_ BitVec 32))) (Found!12040 (index!50553 (_ BitVec 32))) (Intermediate!12040 (undefined!12852 Bool) (index!50554 (_ BitVec 32)) (x!132129 (_ BitVec 32))) (Undefined!12040) (MissingVacant!12040 (index!50555 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99024 (_ BitVec 32)) SeekEntryResult!12040)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99024 (_ BitVec 32)) SeekEntryResult!12040)

(assert (=> b!1469358 (= e!824920 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642531 lt!642532 mask!2687) (seekEntryOrOpen!0 lt!642531 lt!642532 mask!2687))))))

(declare-fun lt!642533 () SeekEntryResult!12040)

(declare-fun b!1469359 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99024 (_ BitVec 32)) SeekEntryResult!12040)

(assert (=> b!1469359 (= e!824920 (not (= lt!642533 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642531 lt!642532 mask!2687))))))

(declare-fun res!997871 () Bool)

(declare-fun e!824919 () Bool)

(assert (=> start!125576 (=> (not res!997871) (not e!824919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125576 (= res!997871 (validMask!0 mask!2687))))

(assert (=> start!125576 e!824919))

(assert (=> start!125576 true))

(declare-fun a!2862 () array!99024)

(declare-fun array_inv!36828 (array!99024) Bool)

(assert (=> start!125576 (array_inv!36828 a!2862)))

(declare-fun b!1469360 () Bool)

(declare-fun res!997872 () Bool)

(assert (=> b!1469360 (=> (not res!997872) (not e!824919))))

(declare-datatypes ((List!34301 0))(
  ( (Nil!34298) (Cons!34297 (h!35647 (_ BitVec 64)) (t!48995 List!34301)) )
))
(declare-fun arrayNoDuplicates!0 (array!99024 (_ BitVec 32) List!34301) Bool)

(assert (=> b!1469360 (= res!997872 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34298))))

(declare-fun b!1469361 () Bool)

(declare-fun res!997873 () Bool)

(assert (=> b!1469361 (=> (not res!997873) (not e!824919))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469361 (= res!997873 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48350 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48350 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48350 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469362 () Bool)

(declare-fun res!997865 () Bool)

(assert (=> b!1469362 (=> (not res!997865) (not e!824919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99024 (_ BitVec 32)) Bool)

(assert (=> b!1469362 (= res!997865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469363 () Bool)

(declare-fun res!997863 () Bool)

(declare-fun e!824921 () Bool)

(assert (=> b!1469363 (=> (not res!997863) (not e!824921))))

(declare-fun lt!642534 () SeekEntryResult!12040)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469363 (= res!997863 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47800 a!2862) j!93) a!2862 mask!2687) lt!642534))))

(declare-fun b!1469364 () Bool)

(declare-fun e!824917 () Bool)

(assert (=> b!1469364 (= e!824921 e!824917)))

(declare-fun res!997867 () Bool)

(assert (=> b!1469364 (=> (not res!997867) (not e!824917))))

(assert (=> b!1469364 (= res!997867 (= lt!642533 (Intermediate!12040 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469364 (= lt!642533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642531 mask!2687) lt!642531 lt!642532 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469364 (= lt!642531 (select (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469365 () Bool)

(declare-fun res!997868 () Bool)

(assert (=> b!1469365 (=> (not res!997868) (not e!824919))))

(assert (=> b!1469365 (= res!997868 (and (= (size!48350 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48350 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48350 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469366 () Bool)

(declare-fun e!824916 () Bool)

(assert (=> b!1469366 (= e!824916 e!824921)))

(declare-fun res!997866 () Bool)

(assert (=> b!1469366 (=> (not res!997866) (not e!824921))))

(assert (=> b!1469366 (= res!997866 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47800 a!2862) j!93) mask!2687) (select (arr!47800 a!2862) j!93) a!2862 mask!2687) lt!642534))))

(assert (=> b!1469366 (= lt!642534 (Intermediate!12040 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469367 () Bool)

(declare-fun res!997864 () Bool)

(assert (=> b!1469367 (=> (not res!997864) (not e!824919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469367 (= res!997864 (validKeyInArray!0 (select (arr!47800 a!2862) i!1006)))))

(declare-fun b!1469368 () Bool)

(assert (=> b!1469368 (= e!824919 e!824916)))

(declare-fun res!997870 () Bool)

(assert (=> b!1469368 (=> (not res!997870) (not e!824916))))

(assert (=> b!1469368 (= res!997870 (= (select (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469368 (= lt!642532 (array!99025 (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48350 a!2862)))))

(declare-fun b!1469369 () Bool)

(assert (=> b!1469369 (= e!824917 false)))

(declare-fun lt!642530 () Bool)

(assert (=> b!1469369 (= lt!642530 e!824920)))

(declare-fun c!135258 () Bool)

(assert (=> b!1469369 (= c!135258 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469370 () Bool)

(declare-fun res!997869 () Bool)

(assert (=> b!1469370 (=> (not res!997869) (not e!824919))))

(assert (=> b!1469370 (= res!997869 (validKeyInArray!0 (select (arr!47800 a!2862) j!93)))))

(assert (= (and start!125576 res!997871) b!1469365))

(assert (= (and b!1469365 res!997868) b!1469367))

(assert (= (and b!1469367 res!997864) b!1469370))

(assert (= (and b!1469370 res!997869) b!1469362))

(assert (= (and b!1469362 res!997865) b!1469360))

(assert (= (and b!1469360 res!997872) b!1469361))

(assert (= (and b!1469361 res!997873) b!1469368))

(assert (= (and b!1469368 res!997870) b!1469366))

(assert (= (and b!1469366 res!997866) b!1469363))

(assert (= (and b!1469363 res!997863) b!1469364))

(assert (= (and b!1469364 res!997867) b!1469369))

(assert (= (and b!1469369 c!135258) b!1469359))

(assert (= (and b!1469369 (not c!135258)) b!1469358))

(declare-fun m!1356539 () Bool)

(assert (=> b!1469364 m!1356539))

(assert (=> b!1469364 m!1356539))

(declare-fun m!1356541 () Bool)

(assert (=> b!1469364 m!1356541))

(declare-fun m!1356543 () Bool)

(assert (=> b!1469364 m!1356543))

(declare-fun m!1356545 () Bool)

(assert (=> b!1469364 m!1356545))

(declare-fun m!1356547 () Bool)

(assert (=> b!1469359 m!1356547))

(declare-fun m!1356549 () Bool)

(assert (=> start!125576 m!1356549))

(declare-fun m!1356551 () Bool)

(assert (=> start!125576 m!1356551))

(declare-fun m!1356553 () Bool)

(assert (=> b!1469366 m!1356553))

(assert (=> b!1469366 m!1356553))

(declare-fun m!1356555 () Bool)

(assert (=> b!1469366 m!1356555))

(assert (=> b!1469366 m!1356555))

(assert (=> b!1469366 m!1356553))

(declare-fun m!1356557 () Bool)

(assert (=> b!1469366 m!1356557))

(assert (=> b!1469363 m!1356553))

(assert (=> b!1469363 m!1356553))

(declare-fun m!1356559 () Bool)

(assert (=> b!1469363 m!1356559))

(declare-fun m!1356561 () Bool)

(assert (=> b!1469362 m!1356561))

(declare-fun m!1356563 () Bool)

(assert (=> b!1469360 m!1356563))

(assert (=> b!1469370 m!1356553))

(assert (=> b!1469370 m!1356553))

(declare-fun m!1356565 () Bool)

(assert (=> b!1469370 m!1356565))

(declare-fun m!1356567 () Bool)

(assert (=> b!1469367 m!1356567))

(assert (=> b!1469367 m!1356567))

(declare-fun m!1356569 () Bool)

(assert (=> b!1469367 m!1356569))

(declare-fun m!1356571 () Bool)

(assert (=> b!1469358 m!1356571))

(declare-fun m!1356573 () Bool)

(assert (=> b!1469358 m!1356573))

(assert (=> b!1469368 m!1356543))

(declare-fun m!1356575 () Bool)

(assert (=> b!1469368 m!1356575))

(push 1)

(assert (not b!1469363))

(assert (not b!1469364))

(assert (not b!1469370))

(assert (not start!125576))

