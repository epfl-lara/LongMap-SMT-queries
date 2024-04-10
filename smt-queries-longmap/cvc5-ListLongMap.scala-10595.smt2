; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124708 () Bool)

(assert start!124708)

(declare-fun b!1445510 () Bool)

(declare-fun res!977377 () Bool)

(declare-fun e!814276 () Bool)

(assert (=> b!1445510 (=> (not res!977377) (not e!814276))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445510 (= res!977377 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445511 () Bool)

(declare-fun res!977387 () Bool)

(declare-fun e!814274 () Bool)

(assert (=> b!1445511 (=> (not res!977387) (not e!814274))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98156 0))(
  ( (array!98157 (arr!47366 (Array (_ BitVec 32) (_ BitVec 64))) (size!47916 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98156)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445511 (= res!977387 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47916 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47916 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47916 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445512 () Bool)

(declare-fun e!814271 () Bool)

(assert (=> b!1445512 (= e!814274 e!814271)))

(declare-fun res!977382 () Bool)

(assert (=> b!1445512 (=> (not res!977382) (not e!814271))))

(assert (=> b!1445512 (= res!977382 (= (select (store (arr!47366 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634520 () array!98156)

(assert (=> b!1445512 (= lt!634520 (array!98157 (store (arr!47366 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47916 a!2862)))))

(declare-fun b!1445513 () Bool)

(assert (=> b!1445513 (= e!814276 (not true))))

(declare-fun e!814272 () Bool)

(assert (=> b!1445513 e!814272))

(declare-fun res!977384 () Bool)

(assert (=> b!1445513 (=> (not res!977384) (not e!814272))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98156 (_ BitVec 32)) Bool)

(assert (=> b!1445513 (= res!977384 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48732 0))(
  ( (Unit!48733) )
))
(declare-fun lt!634521 () Unit!48732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48732)

(assert (=> b!1445513 (= lt!634521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445514 () Bool)

(declare-fun res!977379 () Bool)

(assert (=> b!1445514 (=> (not res!977379) (not e!814274))))

(assert (=> b!1445514 (= res!977379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445515 () Bool)

(declare-fun res!977385 () Bool)

(assert (=> b!1445515 (=> (not res!977385) (not e!814274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445515 (= res!977385 (validKeyInArray!0 (select (arr!47366 a!2862) i!1006)))))

(declare-fun b!1445516 () Bool)

(declare-fun e!814273 () Bool)

(assert (=> b!1445516 (= e!814273 e!814276)))

(declare-fun res!977389 () Bool)

(assert (=> b!1445516 (=> (not res!977389) (not e!814276))))

(declare-datatypes ((SeekEntryResult!11618 0))(
  ( (MissingZero!11618 (index!48864 (_ BitVec 32))) (Found!11618 (index!48865 (_ BitVec 32))) (Intermediate!11618 (undefined!12430 Bool) (index!48866 (_ BitVec 32)) (x!130555 (_ BitVec 32))) (Undefined!11618) (MissingVacant!11618 (index!48867 (_ BitVec 32))) )
))
(declare-fun lt!634519 () SeekEntryResult!11618)

(assert (=> b!1445516 (= res!977389 (= lt!634519 (Intermediate!11618 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634517 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98156 (_ BitVec 32)) SeekEntryResult!11618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445516 (= lt!634519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634517 mask!2687) lt!634517 lt!634520 mask!2687))))

(assert (=> b!1445516 (= lt!634517 (select (store (arr!47366 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445517 () Bool)

(assert (=> b!1445517 (= e!814272 (or (= (select (arr!47366 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47366 a!2862) intermediateBeforeIndex!19) (select (arr!47366 a!2862) j!93))))))

(declare-fun b!1445518 () Bool)

(declare-fun res!977383 () Bool)

(assert (=> b!1445518 (=> (not res!977383) (not e!814274))))

(declare-datatypes ((List!33867 0))(
  ( (Nil!33864) (Cons!33863 (h!35213 (_ BitVec 64)) (t!48561 List!33867)) )
))
(declare-fun arrayNoDuplicates!0 (array!98156 (_ BitVec 32) List!33867) Bool)

(assert (=> b!1445518 (= res!977383 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33864))))

(declare-fun e!814275 () Bool)

(declare-fun b!1445519 () Bool)

(assert (=> b!1445519 (= e!814275 (= lt!634519 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634517 lt!634520 mask!2687)))))

(declare-fun b!1445520 () Bool)

(assert (=> b!1445520 (= e!814271 e!814273)))

(declare-fun res!977375 () Bool)

(assert (=> b!1445520 (=> (not res!977375) (not e!814273))))

(declare-fun lt!634518 () SeekEntryResult!11618)

(assert (=> b!1445520 (= res!977375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47366 a!2862) j!93) mask!2687) (select (arr!47366 a!2862) j!93) a!2862 mask!2687) lt!634518))))

(assert (=> b!1445520 (= lt!634518 (Intermediate!11618 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445521 () Bool)

(declare-fun res!977386 () Bool)

(assert (=> b!1445521 (=> (not res!977386) (not e!814273))))

(assert (=> b!1445521 (= res!977386 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47366 a!2862) j!93) a!2862 mask!2687) lt!634518))))

(declare-fun b!1445522 () Bool)

(declare-fun res!977376 () Bool)

(assert (=> b!1445522 (=> (not res!977376) (not e!814274))))

(assert (=> b!1445522 (= res!977376 (validKeyInArray!0 (select (arr!47366 a!2862) j!93)))))

(declare-fun res!977378 () Bool)

(assert (=> start!124708 (=> (not res!977378) (not e!814274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124708 (= res!977378 (validMask!0 mask!2687))))

(assert (=> start!124708 e!814274))

(assert (=> start!124708 true))

(declare-fun array_inv!36394 (array!98156) Bool)

(assert (=> start!124708 (array_inv!36394 a!2862)))

(declare-fun b!1445523 () Bool)

(declare-fun res!977381 () Bool)

(assert (=> b!1445523 (=> (not res!977381) (not e!814276))))

(assert (=> b!1445523 (= res!977381 e!814275)))

(declare-fun c!133578 () Bool)

(assert (=> b!1445523 (= c!133578 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445524 () Bool)

(declare-fun res!977380 () Bool)

(assert (=> b!1445524 (=> (not res!977380) (not e!814274))))

(assert (=> b!1445524 (= res!977380 (and (= (size!47916 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47916 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47916 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445525 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98156 (_ BitVec 32)) SeekEntryResult!11618)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98156 (_ BitVec 32)) SeekEntryResult!11618)

(assert (=> b!1445525 (= e!814275 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634517 lt!634520 mask!2687) (seekEntryOrOpen!0 lt!634517 lt!634520 mask!2687)))))

(declare-fun b!1445526 () Bool)

(declare-fun res!977388 () Bool)

(assert (=> b!1445526 (=> (not res!977388) (not e!814272))))

(assert (=> b!1445526 (= res!977388 (= (seekEntryOrOpen!0 (select (arr!47366 a!2862) j!93) a!2862 mask!2687) (Found!11618 j!93)))))

(assert (= (and start!124708 res!977378) b!1445524))

(assert (= (and b!1445524 res!977380) b!1445515))

(assert (= (and b!1445515 res!977385) b!1445522))

(assert (= (and b!1445522 res!977376) b!1445514))

(assert (= (and b!1445514 res!977379) b!1445518))

(assert (= (and b!1445518 res!977383) b!1445511))

(assert (= (and b!1445511 res!977387) b!1445512))

(assert (= (and b!1445512 res!977382) b!1445520))

(assert (= (and b!1445520 res!977375) b!1445521))

(assert (= (and b!1445521 res!977386) b!1445516))

(assert (= (and b!1445516 res!977389) b!1445523))

(assert (= (and b!1445523 c!133578) b!1445519))

(assert (= (and b!1445523 (not c!133578)) b!1445525))

(assert (= (and b!1445523 res!977381) b!1445510))

(assert (= (and b!1445510 res!977377) b!1445513))

(assert (= (and b!1445513 res!977384) b!1445526))

(assert (= (and b!1445526 res!977388) b!1445517))

(declare-fun m!1334461 () Bool)

(assert (=> b!1445521 m!1334461))

(assert (=> b!1445521 m!1334461))

(declare-fun m!1334463 () Bool)

(assert (=> b!1445521 m!1334463))

(declare-fun m!1334465 () Bool)

(assert (=> b!1445516 m!1334465))

(assert (=> b!1445516 m!1334465))

(declare-fun m!1334467 () Bool)

(assert (=> b!1445516 m!1334467))

(declare-fun m!1334469 () Bool)

(assert (=> b!1445516 m!1334469))

(declare-fun m!1334471 () Bool)

(assert (=> b!1445516 m!1334471))

(assert (=> b!1445522 m!1334461))

(assert (=> b!1445522 m!1334461))

(declare-fun m!1334473 () Bool)

(assert (=> b!1445522 m!1334473))

(declare-fun m!1334475 () Bool)

(assert (=> b!1445517 m!1334475))

(assert (=> b!1445517 m!1334461))

(declare-fun m!1334477 () Bool)

(assert (=> b!1445514 m!1334477))

(assert (=> b!1445512 m!1334469))

(declare-fun m!1334479 () Bool)

(assert (=> b!1445512 m!1334479))

(assert (=> b!1445526 m!1334461))

(assert (=> b!1445526 m!1334461))

(declare-fun m!1334481 () Bool)

(assert (=> b!1445526 m!1334481))

(declare-fun m!1334483 () Bool)

(assert (=> b!1445515 m!1334483))

(assert (=> b!1445515 m!1334483))

(declare-fun m!1334485 () Bool)

(assert (=> b!1445515 m!1334485))

(declare-fun m!1334487 () Bool)

(assert (=> start!124708 m!1334487))

(declare-fun m!1334489 () Bool)

(assert (=> start!124708 m!1334489))

(declare-fun m!1334491 () Bool)

(assert (=> b!1445513 m!1334491))

(declare-fun m!1334493 () Bool)

(assert (=> b!1445513 m!1334493))

(declare-fun m!1334495 () Bool)

(assert (=> b!1445519 m!1334495))

(declare-fun m!1334497 () Bool)

(assert (=> b!1445525 m!1334497))

(declare-fun m!1334499 () Bool)

(assert (=> b!1445525 m!1334499))

(declare-fun m!1334501 () Bool)

(assert (=> b!1445518 m!1334501))

(assert (=> b!1445520 m!1334461))

(assert (=> b!1445520 m!1334461))

(declare-fun m!1334503 () Bool)

(assert (=> b!1445520 m!1334503))

(assert (=> b!1445520 m!1334503))

(assert (=> b!1445520 m!1334461))

(declare-fun m!1334505 () Bool)

(assert (=> b!1445520 m!1334505))

(push 1)

