; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125522 () Bool)

(assert start!125522)

(declare-fun b!1468561 () Bool)

(declare-fun res!997100 () Bool)

(declare-fun e!824623 () Bool)

(assert (=> b!1468561 (=> (not res!997100) (not e!824623))))

(declare-datatypes ((array!98970 0))(
  ( (array!98971 (arr!47773 (Array (_ BitVec 32) (_ BitVec 64))) (size!48323 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98970)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468561 (= res!997100 (validKeyInArray!0 (select (arr!47773 a!2862) i!1006)))))

(declare-fun b!1468562 () Bool)

(declare-fun e!824622 () Bool)

(assert (=> b!1468562 (= e!824623 e!824622)))

(declare-fun res!997105 () Bool)

(assert (=> b!1468562 (=> (not res!997105) (not e!824622))))

(declare-datatypes ((SeekEntryResult!12013 0))(
  ( (MissingZero!12013 (index!50444 (_ BitVec 32))) (Found!12013 (index!50445 (_ BitVec 32))) (Intermediate!12013 (undefined!12825 Bool) (index!50446 (_ BitVec 32)) (x!132030 (_ BitVec 32))) (Undefined!12013) (MissingVacant!12013 (index!50447 (_ BitVec 32))) )
))
(declare-fun lt!642318 () SeekEntryResult!12013)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98970 (_ BitVec 32)) SeekEntryResult!12013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468562 (= res!997105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47773 a!2862) j!93) mask!2687) (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642318))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468562 (= lt!642318 (Intermediate!12013 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468563 () Bool)

(declare-fun res!997102 () Bool)

(assert (=> b!1468563 (=> (not res!997102) (not e!824623))))

(assert (=> b!1468563 (= res!997102 (validKeyInArray!0 (select (arr!47773 a!2862) j!93)))))

(declare-fun b!1468564 () Bool)

(declare-fun res!997108 () Bool)

(assert (=> b!1468564 (=> (not res!997108) (not e!824623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98970 (_ BitVec 32)) Bool)

(assert (=> b!1468564 (= res!997108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468565 () Bool)

(declare-fun res!997107 () Bool)

(assert (=> b!1468565 (=> (not res!997107) (not e!824623))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468565 (= res!997107 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48323 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48323 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48323 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468566 () Bool)

(declare-fun res!997106 () Bool)

(assert (=> b!1468566 (=> (not res!997106) (not e!824623))))

(assert (=> b!1468566 (= res!997106 (and (= (size!48323 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48323 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48323 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997104 () Bool)

(assert (=> start!125522 (=> (not res!997104) (not e!824623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125522 (= res!997104 (validMask!0 mask!2687))))

(assert (=> start!125522 e!824623))

(assert (=> start!125522 true))

(declare-fun array_inv!36801 (array!98970) Bool)

(assert (=> start!125522 (array_inv!36801 a!2862)))

(declare-fun b!1468567 () Bool)

(declare-fun res!997101 () Bool)

(assert (=> b!1468567 (=> (not res!997101) (not e!824623))))

(declare-datatypes ((List!34274 0))(
  ( (Nil!34271) (Cons!34270 (h!35620 (_ BitVec 64)) (t!48968 List!34274)) )
))
(declare-fun arrayNoDuplicates!0 (array!98970 (_ BitVec 32) List!34274) Bool)

(assert (=> b!1468567 (= res!997101 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34271))))

(declare-fun b!1468568 () Bool)

(declare-fun res!997103 () Bool)

(assert (=> b!1468568 (=> (not res!997103) (not e!824622))))

(assert (=> b!1468568 (= res!997103 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642318))))

(declare-fun b!1468569 () Bool)

(assert (=> b!1468569 (= e!824622 false)))

(declare-fun lt!642317 () SeekEntryResult!12013)

(assert (=> b!1468569 (= lt!642317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98971 (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48323 a!2862)) mask!2687))))

(assert (= (and start!125522 res!997104) b!1468566))

(assert (= (and b!1468566 res!997106) b!1468561))

(assert (= (and b!1468561 res!997100) b!1468563))

(assert (= (and b!1468563 res!997102) b!1468564))

(assert (= (and b!1468564 res!997108) b!1468567))

(assert (= (and b!1468567 res!997101) b!1468565))

(assert (= (and b!1468565 res!997107) b!1468562))

(assert (= (and b!1468562 res!997105) b!1468568))

(assert (= (and b!1468568 res!997103) b!1468569))

(declare-fun m!1355645 () Bool)

(assert (=> b!1468568 m!1355645))

(assert (=> b!1468568 m!1355645))

(declare-fun m!1355647 () Bool)

(assert (=> b!1468568 m!1355647))

(declare-fun m!1355649 () Bool)

(assert (=> b!1468561 m!1355649))

(assert (=> b!1468561 m!1355649))

(declare-fun m!1355651 () Bool)

(assert (=> b!1468561 m!1355651))

(declare-fun m!1355653 () Bool)

(assert (=> b!1468565 m!1355653))

(declare-fun m!1355655 () Bool)

(assert (=> b!1468565 m!1355655))

(assert (=> b!1468562 m!1355645))

(assert (=> b!1468562 m!1355645))

(declare-fun m!1355657 () Bool)

(assert (=> b!1468562 m!1355657))

(assert (=> b!1468562 m!1355657))

(assert (=> b!1468562 m!1355645))

(declare-fun m!1355659 () Bool)

(assert (=> b!1468562 m!1355659))

(declare-fun m!1355661 () Bool)

(assert (=> b!1468567 m!1355661))

(declare-fun m!1355663 () Bool)

(assert (=> start!125522 m!1355663))

(declare-fun m!1355665 () Bool)

(assert (=> start!125522 m!1355665))

(assert (=> b!1468569 m!1355653))

(declare-fun m!1355667 () Bool)

(assert (=> b!1468569 m!1355667))

(assert (=> b!1468569 m!1355667))

(declare-fun m!1355669 () Bool)

(assert (=> b!1468569 m!1355669))

(assert (=> b!1468569 m!1355669))

(assert (=> b!1468569 m!1355667))

(declare-fun m!1355671 () Bool)

(assert (=> b!1468569 m!1355671))

(assert (=> b!1468563 m!1355645))

(assert (=> b!1468563 m!1355645))

(declare-fun m!1355673 () Bool)

(assert (=> b!1468563 m!1355673))

(declare-fun m!1355675 () Bool)

(assert (=> b!1468564 m!1355675))

(push 1)

(assert (not b!1468564))

(assert (not b!1468569))

(assert (not b!1468567))

(assert (not b!1468562))

(assert (not start!125522))

(assert (not b!1468568))

(assert (not b!1468563))

