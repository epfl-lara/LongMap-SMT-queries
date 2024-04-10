; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125582 () Bool)

(assert start!125582)

(declare-fun b!1469475 () Bool)

(declare-fun res!997972 () Bool)

(declare-fun e!824973 () Bool)

(assert (=> b!1469475 (=> (not res!997972) (not e!824973))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99030 0))(
  ( (array!99031 (arr!47803 (Array (_ BitVec 32) (_ BitVec 64))) (size!48353 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99030)

(assert (=> b!1469475 (= res!997972 (and (= (size!48353 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48353 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48353 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469476 () Bool)

(declare-fun res!997971 () Bool)

(assert (=> b!1469476 (=> (not res!997971) (not e!824973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469476 (= res!997971 (validKeyInArray!0 (select (arr!47803 a!2862) i!1006)))))

(declare-fun b!1469477 () Bool)

(declare-fun res!997968 () Bool)

(assert (=> b!1469477 (=> (not res!997968) (not e!824973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99030 (_ BitVec 32)) Bool)

(assert (=> b!1469477 (= res!997968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469478 () Bool)

(declare-fun e!824971 () Bool)

(declare-fun e!824974 () Bool)

(assert (=> b!1469478 (= e!824971 e!824974)))

(declare-fun res!997963 () Bool)

(assert (=> b!1469478 (=> (not res!997963) (not e!824974))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12043 0))(
  ( (MissingZero!12043 (index!50564 (_ BitVec 32))) (Found!12043 (index!50565 (_ BitVec 32))) (Intermediate!12043 (undefined!12855 Bool) (index!50566 (_ BitVec 32)) (x!132140 (_ BitVec 32))) (Undefined!12043) (MissingVacant!12043 (index!50567 (_ BitVec 32))) )
))
(declare-fun lt!642579 () SeekEntryResult!12043)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469478 (= res!997963 (= lt!642579 (Intermediate!12043 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642575 () (_ BitVec 64))

(declare-fun lt!642576 () array!99030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99030 (_ BitVec 32)) SeekEntryResult!12043)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469478 (= lt!642579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642575 mask!2687) lt!642575 lt!642576 mask!2687))))

(assert (=> b!1469478 (= lt!642575 (select (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469479 () Bool)

(declare-fun e!824970 () Bool)

(assert (=> b!1469479 (= e!824970 e!824971)))

(declare-fun res!997970 () Bool)

(assert (=> b!1469479 (=> (not res!997970) (not e!824971))))

(declare-fun lt!642578 () SeekEntryResult!12043)

(assert (=> b!1469479 (= res!997970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642578))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469479 (= lt!642578 (Intermediate!12043 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469480 () Bool)

(declare-fun res!997962 () Bool)

(assert (=> b!1469480 (=> (not res!997962) (not e!824973))))

(assert (=> b!1469480 (= res!997962 (validKeyInArray!0 (select (arr!47803 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824972 () Bool)

(declare-fun b!1469481 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469481 (= e!824972 (not (= lt!642579 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642575 lt!642576 mask!2687))))))

(declare-fun b!1469482 () Bool)

(assert (=> b!1469482 (= e!824973 e!824970)))

(declare-fun res!997969 () Bool)

(assert (=> b!1469482 (=> (not res!997969) (not e!824970))))

(assert (=> b!1469482 (= res!997969 (= (select (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469482 (= lt!642576 (array!99031 (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48353 a!2862)))))

(declare-fun b!1469483 () Bool)

(assert (=> b!1469483 (= e!824974 false)))

(declare-fun lt!642577 () Bool)

(assert (=> b!1469483 (= lt!642577 e!824972)))

(declare-fun c!135267 () Bool)

(assert (=> b!1469483 (= c!135267 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469484 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99030 (_ BitVec 32)) SeekEntryResult!12043)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99030 (_ BitVec 32)) SeekEntryResult!12043)

(assert (=> b!1469484 (= e!824972 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642575 lt!642576 mask!2687) (seekEntryOrOpen!0 lt!642575 lt!642576 mask!2687))))))

(declare-fun b!1469485 () Bool)

(declare-fun res!997966 () Bool)

(assert (=> b!1469485 (=> (not res!997966) (not e!824973))))

(assert (=> b!1469485 (= res!997966 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48353 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48353 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48353 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469487 () Bool)

(declare-fun res!997964 () Bool)

(assert (=> b!1469487 (=> (not res!997964) (not e!824973))))

(declare-datatypes ((List!34304 0))(
  ( (Nil!34301) (Cons!34300 (h!35650 (_ BitVec 64)) (t!48998 List!34304)) )
))
(declare-fun arrayNoDuplicates!0 (array!99030 (_ BitVec 32) List!34304) Bool)

(assert (=> b!1469487 (= res!997964 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34301))))

(declare-fun b!1469486 () Bool)

(declare-fun res!997965 () Bool)

(assert (=> b!1469486 (=> (not res!997965) (not e!824971))))

(assert (=> b!1469486 (= res!997965 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642578))))

(declare-fun res!997967 () Bool)

(assert (=> start!125582 (=> (not res!997967) (not e!824973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125582 (= res!997967 (validMask!0 mask!2687))))

(assert (=> start!125582 e!824973))

(assert (=> start!125582 true))

(declare-fun array_inv!36831 (array!99030) Bool)

(assert (=> start!125582 (array_inv!36831 a!2862)))

(assert (= (and start!125582 res!997967) b!1469475))

(assert (= (and b!1469475 res!997972) b!1469476))

(assert (= (and b!1469476 res!997971) b!1469480))

(assert (= (and b!1469480 res!997962) b!1469477))

(assert (= (and b!1469477 res!997968) b!1469487))

(assert (= (and b!1469487 res!997964) b!1469485))

(assert (= (and b!1469485 res!997966) b!1469482))

(assert (= (and b!1469482 res!997969) b!1469479))

(assert (= (and b!1469479 res!997970) b!1469486))

(assert (= (and b!1469486 res!997965) b!1469478))

(assert (= (and b!1469478 res!997963) b!1469483))

(assert (= (and b!1469483 c!135267) b!1469481))

(assert (= (and b!1469483 (not c!135267)) b!1469484))

(declare-fun m!1356653 () Bool)

(assert (=> b!1469478 m!1356653))

(assert (=> b!1469478 m!1356653))

(declare-fun m!1356655 () Bool)

(assert (=> b!1469478 m!1356655))

(declare-fun m!1356657 () Bool)

(assert (=> b!1469478 m!1356657))

(declare-fun m!1356659 () Bool)

(assert (=> b!1469478 m!1356659))

(declare-fun m!1356661 () Bool)

(assert (=> b!1469484 m!1356661))

(declare-fun m!1356663 () Bool)

(assert (=> b!1469484 m!1356663))

(declare-fun m!1356665 () Bool)

(assert (=> b!1469476 m!1356665))

(assert (=> b!1469476 m!1356665))

(declare-fun m!1356667 () Bool)

(assert (=> b!1469476 m!1356667))

(assert (=> b!1469482 m!1356657))

(declare-fun m!1356669 () Bool)

(assert (=> b!1469482 m!1356669))

(declare-fun m!1356671 () Bool)

(assert (=> b!1469477 m!1356671))

(declare-fun m!1356673 () Bool)

(assert (=> start!125582 m!1356673))

(declare-fun m!1356675 () Bool)

(assert (=> start!125582 m!1356675))

(declare-fun m!1356677 () Bool)

(assert (=> b!1469487 m!1356677))

(declare-fun m!1356679 () Bool)

(assert (=> b!1469480 m!1356679))

(assert (=> b!1469480 m!1356679))

(declare-fun m!1356681 () Bool)

(assert (=> b!1469480 m!1356681))

(assert (=> b!1469486 m!1356679))

(assert (=> b!1469486 m!1356679))

(declare-fun m!1356683 () Bool)

(assert (=> b!1469486 m!1356683))

(assert (=> b!1469479 m!1356679))

(assert (=> b!1469479 m!1356679))

(declare-fun m!1356685 () Bool)

(assert (=> b!1469479 m!1356685))

(assert (=> b!1469479 m!1356685))

(assert (=> b!1469479 m!1356679))

(declare-fun m!1356687 () Bool)

(assert (=> b!1469479 m!1356687))

(declare-fun m!1356689 () Bool)

(assert (=> b!1469481 m!1356689))

(push 1)

(assert (not b!1469486))

(assert (not b!1469481))

(assert (not b!1469484))

(assert (not b!1469477))

