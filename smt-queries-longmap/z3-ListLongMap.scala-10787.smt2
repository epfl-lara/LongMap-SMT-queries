; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126498 () Bool)

(assert start!126498)

(declare-fun b!1480628 () Bool)

(declare-fun res!1005491 () Bool)

(declare-fun e!830652 () Bool)

(assert (=> b!1480628 (=> (not res!1005491) (not e!830652))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12132 0))(
  ( (MissingZero!12132 (index!50920 (_ BitVec 32))) (Found!12132 (index!50921 (_ BitVec 32))) (Intermediate!12132 (undefined!12944 Bool) (index!50922 (_ BitVec 32)) (x!132692 (_ BitVec 32))) (Undefined!12132) (MissingVacant!12132 (index!50923 (_ BitVec 32))) )
))
(declare-fun lt!646482 () SeekEntryResult!12132)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99442 0))(
  ( (array!99443 (arr!47995 (Array (_ BitVec 32) (_ BitVec 64))) (size!48546 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99442)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99442 (_ BitVec 32)) SeekEntryResult!12132)

(assert (=> b!1480628 (= res!1005491 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47995 a!2862) j!93) a!2862 mask!2687) lt!646482))))

(declare-fun b!1480629 () Bool)

(declare-fun res!1005499 () Bool)

(declare-fun e!830651 () Bool)

(assert (=> b!1480629 (=> (not res!1005499) (not e!830651))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480629 (= res!1005499 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480630 () Bool)

(declare-fun res!1005502 () Bool)

(declare-fun e!830648 () Bool)

(assert (=> b!1480630 (=> (not res!1005502) (not e!830648))))

(assert (=> b!1480630 (= res!1005502 (and (= (size!48546 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48546 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48546 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480631 () Bool)

(declare-fun e!830654 () Bool)

(assert (=> b!1480631 (= e!830654 e!830652)))

(declare-fun res!1005506 () Bool)

(assert (=> b!1480631 (=> (not res!1005506) (not e!830652))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480631 (= res!1005506 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47995 a!2862) j!93) mask!2687) (select (arr!47995 a!2862) j!93) a!2862 mask!2687) lt!646482))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1480631 (= lt!646482 (Intermediate!12132 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480632 () Bool)

(declare-fun lt!646483 () array!99442)

(declare-fun lt!646481 () (_ BitVec 64))

(declare-fun e!830649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99442 (_ BitVec 32)) SeekEntryResult!12132)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99442 (_ BitVec 32)) SeekEntryResult!12132)

(assert (=> b!1480632 (= e!830649 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646481 lt!646483 mask!2687) (seekEntryOrOpen!0 lt!646481 lt!646483 mask!2687)))))

(declare-fun b!1480633 () Bool)

(declare-fun res!1005501 () Bool)

(assert (=> b!1480633 (=> (not res!1005501) (not e!830651))))

(assert (=> b!1480633 (= res!1005501 e!830649)))

(declare-fun c!137098 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480633 (= c!137098 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1005498 () Bool)

(assert (=> start!126498 (=> (not res!1005498) (not e!830648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126498 (= res!1005498 (validMask!0 mask!2687))))

(assert (=> start!126498 e!830648))

(assert (=> start!126498 true))

(declare-fun array_inv!37276 (array!99442) Bool)

(assert (=> start!126498 (array_inv!37276 a!2862)))

(declare-fun b!1480634 () Bool)

(declare-fun res!1005504 () Bool)

(assert (=> b!1480634 (=> (not res!1005504) (not e!830648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480634 (= res!1005504 (validKeyInArray!0 (select (arr!47995 a!2862) j!93)))))

(declare-fun b!1480635 () Bool)

(declare-fun e!830653 () Bool)

(assert (=> b!1480635 (= e!830653 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480636 () Bool)

(declare-fun res!1005500 () Bool)

(assert (=> b!1480636 (=> (not res!1005500) (not e!830648))))

(assert (=> b!1480636 (= res!1005500 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48546 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48546 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48546 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480637 () Bool)

(assert (=> b!1480637 (= e!830651 (not true))))

(declare-fun e!830650 () Bool)

(assert (=> b!1480637 e!830650))

(declare-fun res!1005492 () Bool)

(assert (=> b!1480637 (=> (not res!1005492) (not e!830650))))

(declare-fun lt!646479 () SeekEntryResult!12132)

(assert (=> b!1480637 (= res!1005492 (and (= lt!646479 (Found!12132 j!93)) (or (= (select (arr!47995 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47995 a!2862) intermediateBeforeIndex!19) (select (arr!47995 a!2862) j!93)))))))

(assert (=> b!1480637 (= lt!646479 (seekEntryOrOpen!0 (select (arr!47995 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99442 (_ BitVec 32)) Bool)

(assert (=> b!1480637 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49637 0))(
  ( (Unit!49638) )
))
(declare-fun lt!646478 () Unit!49637)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49637)

(assert (=> b!1480637 (= lt!646478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480638 () Bool)

(assert (=> b!1480638 (= e!830648 e!830654)))

(declare-fun res!1005503 () Bool)

(assert (=> b!1480638 (=> (not res!1005503) (not e!830654))))

(assert (=> b!1480638 (= res!1005503 (= (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480638 (= lt!646483 (array!99443 (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48546 a!2862)))))

(declare-fun b!1480639 () Bool)

(declare-fun res!1005505 () Bool)

(assert (=> b!1480639 (=> (not res!1005505) (not e!830648))))

(assert (=> b!1480639 (= res!1005505 (validKeyInArray!0 (select (arr!47995 a!2862) i!1006)))))

(declare-fun b!1480640 () Bool)

(assert (=> b!1480640 (= e!830652 e!830651)))

(declare-fun res!1005495 () Bool)

(assert (=> b!1480640 (=> (not res!1005495) (not e!830651))))

(declare-fun lt!646480 () SeekEntryResult!12132)

(assert (=> b!1480640 (= res!1005495 (= lt!646480 (Intermediate!12132 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480640 (= lt!646480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646481 mask!2687) lt!646481 lt!646483 mask!2687))))

(assert (=> b!1480640 (= lt!646481 (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480641 () Bool)

(declare-fun e!830655 () Bool)

(assert (=> b!1480641 (= e!830650 e!830655)))

(declare-fun res!1005497 () Bool)

(assert (=> b!1480641 (=> res!1005497 e!830655)))

(assert (=> b!1480641 (= res!1005497 (or (and (= (select (arr!47995 a!2862) index!646) (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47995 a!2862) index!646) (select (arr!47995 a!2862) j!93))) (not (= (select (arr!47995 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480642 () Bool)

(assert (=> b!1480642 (= e!830655 e!830653)))

(declare-fun res!1005496 () Bool)

(assert (=> b!1480642 (=> (not res!1005496) (not e!830653))))

(assert (=> b!1480642 (= res!1005496 (= lt!646479 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47995 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480643 () Bool)

(declare-fun res!1005494 () Bool)

(assert (=> b!1480643 (=> (not res!1005494) (not e!830648))))

(declare-datatypes ((List!34483 0))(
  ( (Nil!34480) (Cons!34479 (h!35861 (_ BitVec 64)) (t!49169 List!34483)) )
))
(declare-fun arrayNoDuplicates!0 (array!99442 (_ BitVec 32) List!34483) Bool)

(assert (=> b!1480643 (= res!1005494 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34480))))

(declare-fun b!1480644 () Bool)

(assert (=> b!1480644 (= e!830649 (= lt!646480 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646481 lt!646483 mask!2687)))))

(declare-fun b!1480645 () Bool)

(declare-fun res!1005493 () Bool)

(assert (=> b!1480645 (=> (not res!1005493) (not e!830648))))

(assert (=> b!1480645 (= res!1005493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126498 res!1005498) b!1480630))

(assert (= (and b!1480630 res!1005502) b!1480639))

(assert (= (and b!1480639 res!1005505) b!1480634))

(assert (= (and b!1480634 res!1005504) b!1480645))

(assert (= (and b!1480645 res!1005493) b!1480643))

(assert (= (and b!1480643 res!1005494) b!1480636))

(assert (= (and b!1480636 res!1005500) b!1480638))

(assert (= (and b!1480638 res!1005503) b!1480631))

(assert (= (and b!1480631 res!1005506) b!1480628))

(assert (= (and b!1480628 res!1005491) b!1480640))

(assert (= (and b!1480640 res!1005495) b!1480633))

(assert (= (and b!1480633 c!137098) b!1480644))

(assert (= (and b!1480633 (not c!137098)) b!1480632))

(assert (= (and b!1480633 res!1005501) b!1480629))

(assert (= (and b!1480629 res!1005499) b!1480637))

(assert (= (and b!1480637 res!1005492) b!1480641))

(assert (= (and b!1480641 (not res!1005497)) b!1480642))

(assert (= (and b!1480642 res!1005496) b!1480635))

(declare-fun m!1366501 () Bool)

(assert (=> b!1480628 m!1366501))

(assert (=> b!1480628 m!1366501))

(declare-fun m!1366503 () Bool)

(assert (=> b!1480628 m!1366503))

(declare-fun m!1366505 () Bool)

(assert (=> b!1480641 m!1366505))

(declare-fun m!1366507 () Bool)

(assert (=> b!1480641 m!1366507))

(declare-fun m!1366509 () Bool)

(assert (=> b!1480641 m!1366509))

(assert (=> b!1480641 m!1366501))

(declare-fun m!1366511 () Bool)

(assert (=> b!1480640 m!1366511))

(assert (=> b!1480640 m!1366511))

(declare-fun m!1366513 () Bool)

(assert (=> b!1480640 m!1366513))

(assert (=> b!1480640 m!1366507))

(declare-fun m!1366515 () Bool)

(assert (=> b!1480640 m!1366515))

(declare-fun m!1366517 () Bool)

(assert (=> b!1480644 m!1366517))

(declare-fun m!1366519 () Bool)

(assert (=> b!1480639 m!1366519))

(assert (=> b!1480639 m!1366519))

(declare-fun m!1366521 () Bool)

(assert (=> b!1480639 m!1366521))

(declare-fun m!1366523 () Bool)

(assert (=> b!1480632 m!1366523))

(declare-fun m!1366525 () Bool)

(assert (=> b!1480632 m!1366525))

(declare-fun m!1366527 () Bool)

(assert (=> b!1480637 m!1366527))

(declare-fun m!1366529 () Bool)

(assert (=> b!1480637 m!1366529))

(assert (=> b!1480637 m!1366501))

(declare-fun m!1366531 () Bool)

(assert (=> b!1480637 m!1366531))

(declare-fun m!1366533 () Bool)

(assert (=> b!1480637 m!1366533))

(assert (=> b!1480637 m!1366501))

(declare-fun m!1366535 () Bool)

(assert (=> start!126498 m!1366535))

(declare-fun m!1366537 () Bool)

(assert (=> start!126498 m!1366537))

(assert (=> b!1480634 m!1366501))

(assert (=> b!1480634 m!1366501))

(declare-fun m!1366539 () Bool)

(assert (=> b!1480634 m!1366539))

(assert (=> b!1480638 m!1366507))

(declare-fun m!1366541 () Bool)

(assert (=> b!1480638 m!1366541))

(declare-fun m!1366543 () Bool)

(assert (=> b!1480643 m!1366543))

(assert (=> b!1480642 m!1366501))

(assert (=> b!1480642 m!1366501))

(declare-fun m!1366545 () Bool)

(assert (=> b!1480642 m!1366545))

(assert (=> b!1480631 m!1366501))

(assert (=> b!1480631 m!1366501))

(declare-fun m!1366547 () Bool)

(assert (=> b!1480631 m!1366547))

(assert (=> b!1480631 m!1366547))

(assert (=> b!1480631 m!1366501))

(declare-fun m!1366549 () Bool)

(assert (=> b!1480631 m!1366549))

(declare-fun m!1366551 () Bool)

(assert (=> b!1480645 m!1366551))

(check-sat (not start!126498) (not b!1480645) (not b!1480643) (not b!1480631) (not b!1480644) (not b!1480634) (not b!1480640) (not b!1480628) (not b!1480637) (not b!1480642) (not b!1480632) (not b!1480639))
(check-sat)
