; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124852 () Bool)

(assert start!124852)

(declare-fun b!1450208 () Bool)

(declare-fun res!981682 () Bool)

(declare-fun e!816609 () Bool)

(assert (=> b!1450208 (=> (not res!981682) (not e!816609))))

(declare-fun e!816618 () Bool)

(assert (=> b!1450208 (= res!981682 e!816618)))

(declare-fun c!133783 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450208 (= c!133783 (bvsle x!665 intermediateAfterX!19))))

(declare-datatypes ((SeekEntryResult!11705 0))(
  ( (MissingZero!11705 (index!49212 (_ BitVec 32))) (Found!11705 (index!49213 (_ BitVec 32))) (Intermediate!11705 (undefined!12517 Bool) (index!49214 (_ BitVec 32)) (x!130869 (_ BitVec 32))) (Undefined!11705) (MissingVacant!11705 (index!49215 (_ BitVec 32))) )
))
(declare-fun lt!636051 () SeekEntryResult!11705)

(declare-fun lt!636046 () (_ BitVec 64))

(declare-fun b!1450209 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98278 0))(
  ( (array!98279 (arr!47428 (Array (_ BitVec 32) (_ BitVec 64))) (size!47980 (_ BitVec 32))) )
))
(declare-fun lt!636045 () array!98278)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98278 (_ BitVec 32)) SeekEntryResult!11705)

(assert (=> b!1450209 (= e!816618 (= lt!636051 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636046 lt!636045 mask!2687)))))

(declare-fun b!1450210 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98278 (_ BitVec 32)) SeekEntryResult!11705)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98278 (_ BitVec 32)) SeekEntryResult!11705)

(assert (=> b!1450210 (= e!816618 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636046 lt!636045 mask!2687) (seekEntryOrOpen!0 lt!636046 lt!636045 mask!2687)))))

(declare-fun b!1450212 () Bool)

(declare-fun e!816612 () Bool)

(assert (=> b!1450212 (= e!816612 true)))

(declare-fun lt!636047 () SeekEntryResult!11705)

(assert (=> b!1450212 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636046 lt!636045 mask!2687) lt!636047)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!48747 0))(
  ( (Unit!48748) )
))
(declare-fun lt!636050 () Unit!48747)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98278)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48747)

(assert (=> b!1450212 (= lt!636050 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450213 () Bool)

(declare-fun res!981671 () Bool)

(declare-fun e!816616 () Bool)

(assert (=> b!1450213 (=> (not res!981671) (not e!816616))))

(assert (=> b!1450213 (= res!981671 (and (= (size!47980 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47980 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47980 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450214 () Bool)

(declare-fun e!816611 () Bool)

(assert (=> b!1450214 (= e!816616 e!816611)))

(declare-fun res!981674 () Bool)

(assert (=> b!1450214 (=> (not res!981674) (not e!816611))))

(assert (=> b!1450214 (= res!981674 (= (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450214 (= lt!636045 (array!98279 (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47980 a!2862)))))

(declare-fun b!1450215 () Bool)

(declare-fun e!816610 () Bool)

(declare-fun e!816613 () Bool)

(assert (=> b!1450215 (= e!816610 e!816613)))

(declare-fun res!981684 () Bool)

(assert (=> b!1450215 (=> (not res!981684) (not e!816613))))

(declare-fun lt!636048 () SeekEntryResult!11705)

(assert (=> b!1450215 (= res!981684 (= lt!636048 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47428 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1450216 () Bool)

(assert (=> b!1450216 (= e!816613 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450217 () Bool)

(declare-fun res!981669 () Bool)

(assert (=> b!1450217 (=> (not res!981669) (not e!816616))))

(declare-datatypes ((List!34007 0))(
  ( (Nil!34004) (Cons!34003 (h!35353 (_ BitVec 64)) (t!48693 List!34007)) )
))
(declare-fun arrayNoDuplicates!0 (array!98278 (_ BitVec 32) List!34007) Bool)

(assert (=> b!1450217 (= res!981669 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34004))))

(declare-fun b!1450218 () Bool)

(declare-fun res!981668 () Bool)

(assert (=> b!1450218 (=> (not res!981668) (not e!816616))))

(assert (=> b!1450218 (= res!981668 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47980 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47980 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47980 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450219 () Bool)

(declare-fun e!816617 () Bool)

(assert (=> b!1450219 (= e!816617 e!816609)))

(declare-fun res!981680 () Bool)

(assert (=> b!1450219 (=> (not res!981680) (not e!816609))))

(assert (=> b!1450219 (= res!981680 (= lt!636051 (Intermediate!11705 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450219 (= lt!636051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636046 mask!2687) lt!636046 lt!636045 mask!2687))))

(assert (=> b!1450219 (= lt!636046 (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450220 () Bool)

(assert (=> b!1450220 (= e!816609 (not e!816612))))

(declare-fun res!981672 () Bool)

(assert (=> b!1450220 (=> res!981672 e!816612)))

(assert (=> b!1450220 (= res!981672 (or (and (= (select (arr!47428 a!2862) index!646) (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47428 a!2862) index!646) (select (arr!47428 a!2862) j!93))) (not (= (select (arr!47428 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816614 () Bool)

(assert (=> b!1450220 e!816614))

(declare-fun res!981676 () Bool)

(assert (=> b!1450220 (=> (not res!981676) (not e!816614))))

(assert (=> b!1450220 (= res!981676 (and (= lt!636048 lt!636047) (or (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) (select (arr!47428 a!2862) j!93)))))))

(assert (=> b!1450220 (= lt!636047 (Found!11705 j!93))))

(assert (=> b!1450220 (= lt!636048 (seekEntryOrOpen!0 (select (arr!47428 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98278 (_ BitVec 32)) Bool)

(assert (=> b!1450220 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636044 () Unit!48747)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48747)

(assert (=> b!1450220 (= lt!636044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450221 () Bool)

(declare-fun res!981681 () Bool)

(assert (=> b!1450221 (=> (not res!981681) (not e!816609))))

(assert (=> b!1450221 (= res!981681 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450222 () Bool)

(assert (=> b!1450222 (= e!816611 e!816617)))

(declare-fun res!981670 () Bool)

(assert (=> b!1450222 (=> (not res!981670) (not e!816617))))

(declare-fun lt!636049 () SeekEntryResult!11705)

(assert (=> b!1450222 (= res!981670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47428 a!2862) j!93) mask!2687) (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!636049))))

(assert (=> b!1450222 (= lt!636049 (Intermediate!11705 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450223 () Bool)

(declare-fun res!981675 () Bool)

(assert (=> b!1450223 (=> (not res!981675) (not e!816617))))

(assert (=> b!1450223 (= res!981675 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!636049))))

(declare-fun b!1450224 () Bool)

(declare-fun res!981677 () Bool)

(assert (=> b!1450224 (=> (not res!981677) (not e!816616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450224 (= res!981677 (validKeyInArray!0 (select (arr!47428 a!2862) i!1006)))))

(declare-fun res!981679 () Bool)

(assert (=> start!124852 (=> (not res!981679) (not e!816616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124852 (= res!981679 (validMask!0 mask!2687))))

(assert (=> start!124852 e!816616))

(assert (=> start!124852 true))

(declare-fun array_inv!36661 (array!98278) Bool)

(assert (=> start!124852 (array_inv!36661 a!2862)))

(declare-fun b!1450211 () Bool)

(declare-fun res!981683 () Bool)

(assert (=> b!1450211 (=> (not res!981683) (not e!816616))))

(assert (=> b!1450211 (= res!981683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450225 () Bool)

(declare-fun res!981673 () Bool)

(assert (=> b!1450225 (=> (not res!981673) (not e!816616))))

(assert (=> b!1450225 (= res!981673 (validKeyInArray!0 (select (arr!47428 a!2862) j!93)))))

(declare-fun b!1450226 () Bool)

(declare-fun res!981685 () Bool)

(assert (=> b!1450226 (=> res!981685 e!816612)))

(assert (=> b!1450226 (= res!981685 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!636047)))))

(declare-fun b!1450227 () Bool)

(assert (=> b!1450227 (= e!816614 e!816610)))

(declare-fun res!981678 () Bool)

(assert (=> b!1450227 (=> res!981678 e!816610)))

(assert (=> b!1450227 (= res!981678 (or (and (= (select (arr!47428 a!2862) index!646) (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47428 a!2862) index!646) (select (arr!47428 a!2862) j!93))) (not (= (select (arr!47428 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!124852 res!981679) b!1450213))

(assert (= (and b!1450213 res!981671) b!1450224))

(assert (= (and b!1450224 res!981677) b!1450225))

(assert (= (and b!1450225 res!981673) b!1450211))

(assert (= (and b!1450211 res!981683) b!1450217))

(assert (= (and b!1450217 res!981669) b!1450218))

(assert (= (and b!1450218 res!981668) b!1450214))

(assert (= (and b!1450214 res!981674) b!1450222))

(assert (= (and b!1450222 res!981670) b!1450223))

(assert (= (and b!1450223 res!981675) b!1450219))

(assert (= (and b!1450219 res!981680) b!1450208))

(assert (= (and b!1450208 c!133783) b!1450209))

(assert (= (and b!1450208 (not c!133783)) b!1450210))

(assert (= (and b!1450208 res!981682) b!1450221))

(assert (= (and b!1450221 res!981681) b!1450220))

(assert (= (and b!1450220 res!981676) b!1450227))

(assert (= (and b!1450227 (not res!981678)) b!1450215))

(assert (= (and b!1450215 res!981684) b!1450216))

(assert (= (and b!1450220 (not res!981672)) b!1450226))

(assert (= (and b!1450226 (not res!981685)) b!1450212))

(declare-fun m!1338375 () Bool)

(assert (=> b!1450210 m!1338375))

(declare-fun m!1338377 () Bool)

(assert (=> b!1450210 m!1338377))

(declare-fun m!1338379 () Bool)

(assert (=> b!1450217 m!1338379))

(declare-fun m!1338381 () Bool)

(assert (=> b!1450214 m!1338381))

(declare-fun m!1338383 () Bool)

(assert (=> b!1450214 m!1338383))

(declare-fun m!1338385 () Bool)

(assert (=> b!1450223 m!1338385))

(assert (=> b!1450223 m!1338385))

(declare-fun m!1338387 () Bool)

(assert (=> b!1450223 m!1338387))

(declare-fun m!1338389 () Bool)

(assert (=> b!1450227 m!1338389))

(assert (=> b!1450227 m!1338381))

(declare-fun m!1338391 () Bool)

(assert (=> b!1450227 m!1338391))

(assert (=> b!1450227 m!1338385))

(assert (=> b!1450212 m!1338375))

(declare-fun m!1338393 () Bool)

(assert (=> b!1450212 m!1338393))

(declare-fun m!1338395 () Bool)

(assert (=> start!124852 m!1338395))

(declare-fun m!1338397 () Bool)

(assert (=> start!124852 m!1338397))

(assert (=> b!1450226 m!1338385))

(assert (=> b!1450226 m!1338385))

(declare-fun m!1338399 () Bool)

(assert (=> b!1450226 m!1338399))

(declare-fun m!1338401 () Bool)

(assert (=> b!1450209 m!1338401))

(assert (=> b!1450222 m!1338385))

(assert (=> b!1450222 m!1338385))

(declare-fun m!1338403 () Bool)

(assert (=> b!1450222 m!1338403))

(assert (=> b!1450222 m!1338403))

(assert (=> b!1450222 m!1338385))

(declare-fun m!1338405 () Bool)

(assert (=> b!1450222 m!1338405))

(assert (=> b!1450215 m!1338385))

(assert (=> b!1450215 m!1338385))

(declare-fun m!1338407 () Bool)

(assert (=> b!1450215 m!1338407))

(declare-fun m!1338409 () Bool)

(assert (=> b!1450211 m!1338409))

(declare-fun m!1338411 () Bool)

(assert (=> b!1450224 m!1338411))

(assert (=> b!1450224 m!1338411))

(declare-fun m!1338413 () Bool)

(assert (=> b!1450224 m!1338413))

(declare-fun m!1338415 () Bool)

(assert (=> b!1450219 m!1338415))

(assert (=> b!1450219 m!1338415))

(declare-fun m!1338417 () Bool)

(assert (=> b!1450219 m!1338417))

(assert (=> b!1450219 m!1338381))

(declare-fun m!1338419 () Bool)

(assert (=> b!1450219 m!1338419))

(assert (=> b!1450225 m!1338385))

(assert (=> b!1450225 m!1338385))

(declare-fun m!1338421 () Bool)

(assert (=> b!1450225 m!1338421))

(declare-fun m!1338423 () Bool)

(assert (=> b!1450220 m!1338423))

(assert (=> b!1450220 m!1338381))

(declare-fun m!1338425 () Bool)

(assert (=> b!1450220 m!1338425))

(assert (=> b!1450220 m!1338391))

(assert (=> b!1450220 m!1338389))

(assert (=> b!1450220 m!1338385))

(declare-fun m!1338427 () Bool)

(assert (=> b!1450220 m!1338427))

(declare-fun m!1338429 () Bool)

(assert (=> b!1450220 m!1338429))

(assert (=> b!1450220 m!1338385))

(check-sat (not b!1450211) (not b!1450222) (not b!1450212) (not b!1450209) (not start!124852) (not b!1450224) (not b!1450220) (not b!1450225) (not b!1450217) (not b!1450215) (not b!1450226) (not b!1450223) (not b!1450210) (not b!1450219))
(check-sat)
