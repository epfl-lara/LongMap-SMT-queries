; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127128 () Bool)

(assert start!127128)

(declare-fun b!1491370 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99739 0))(
  ( (array!99740 (arr!48136 (Array (_ BitVec 32) (_ BitVec 64))) (size!48687 (_ BitVec 32))) )
))
(declare-fun lt!650279 () array!99739)

(declare-fun lt!650280 () (_ BitVec 64))

(declare-fun e!835922 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12273 0))(
  ( (MissingZero!12273 (index!51484 (_ BitVec 32))) (Found!12273 (index!51485 (_ BitVec 32))) (Intermediate!12273 (undefined!13085 Bool) (index!51486 (_ BitVec 32)) (x!133266 (_ BitVec 32))) (Undefined!12273) (MissingVacant!12273 (index!51487 (_ BitVec 32))) )
))
(declare-fun lt!650287 () SeekEntryResult!12273)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12273)

(assert (=> b!1491370 (= e!835922 (= lt!650287 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650280 lt!650279 mask!2687)))))

(declare-fun b!1491371 () Bool)

(declare-fun res!1013676 () Bool)

(declare-fun e!835918 () Bool)

(assert (=> b!1491371 (=> res!1013676 e!835918)))

(declare-fun lt!650286 () (_ BitVec 32))

(declare-fun a!2862 () array!99739)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!650284 () SeekEntryResult!12273)

(assert (=> b!1491371 (= res!1013676 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650286 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650284)))))

(declare-fun b!1491372 () Bool)

(declare-fun e!835923 () Bool)

(declare-fun e!835924 () Bool)

(assert (=> b!1491372 (= e!835923 e!835924)))

(declare-fun res!1013691 () Bool)

(assert (=> b!1491372 (=> (not res!1013691) (not e!835924))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491372 (= res!1013691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650284))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491372 (= lt!650284 (Intermediate!12273 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491373 () Bool)

(declare-fun res!1013693 () Bool)

(declare-fun e!835920 () Bool)

(assert (=> b!1491373 (=> (not res!1013693) (not e!835920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99739 (_ BitVec 32)) Bool)

(assert (=> b!1491373 (= res!1013693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491374 () Bool)

(declare-fun res!1013680 () Bool)

(assert (=> b!1491374 (=> (not res!1013680) (not e!835924))))

(assert (=> b!1491374 (= res!1013680 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650284))))

(declare-fun b!1491375 () Bool)

(declare-fun res!1013689 () Bool)

(assert (=> b!1491375 (=> res!1013689 e!835918)))

(assert (=> b!1491375 (= res!1013689 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1491376 () Bool)

(declare-fun e!835919 () Bool)

(declare-fun e!835921 () Bool)

(assert (=> b!1491376 (= e!835919 (not e!835921))))

(declare-fun res!1013679 () Bool)

(assert (=> b!1491376 (=> res!1013679 e!835921)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491376 (= res!1013679 (or (and (= (select (arr!48136 a!2862) index!646) (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48136 a!2862) index!646) (select (arr!48136 a!2862) j!93))) (= (select (arr!48136 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!650281 () SeekEntryResult!12273)

(assert (=> b!1491376 (and (= lt!650281 (Found!12273 j!93)) (or (= (select (arr!48136 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48136 a!2862) intermediateBeforeIndex!19) (select (arr!48136 a!2862) j!93))) (let ((bdg!54739 (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48136 a!2862) index!646) bdg!54739) (= (select (arr!48136 a!2862) index!646) (select (arr!48136 a!2862) j!93))) (= (select (arr!48136 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54739 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12273)

(assert (=> b!1491376 (= lt!650281 (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1491376 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49919 0))(
  ( (Unit!49920) )
))
(declare-fun lt!650285 () Unit!49919)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49919)

(assert (=> b!1491376 (= lt!650285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491377 () Bool)

(declare-fun res!1013681 () Bool)

(assert (=> b!1491377 (=> res!1013681 e!835918)))

(declare-fun e!835926 () Bool)

(assert (=> b!1491377 (= res!1013681 e!835926)))

(declare-fun c!138384 () Bool)

(assert (=> b!1491377 (= c!138384 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1491378 () Bool)

(declare-fun res!1013687 () Bool)

(assert (=> b!1491378 (=> (not res!1013687) (not e!835920))))

(assert (=> b!1491378 (= res!1013687 (and (= (size!48687 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48687 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48687 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491379 () Bool)

(declare-fun res!1013688 () Bool)

(assert (=> b!1491379 (=> (not res!1013688) (not e!835920))))

(assert (=> b!1491379 (= res!1013688 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48687 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48687 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48687 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491380 () Bool)

(declare-fun res!1013690 () Bool)

(assert (=> b!1491380 (=> (not res!1013690) (not e!835919))))

(assert (=> b!1491380 (= res!1013690 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491382 () Bool)

(declare-fun lt!650283 () SeekEntryResult!12273)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12273)

(assert (=> b!1491382 (= e!835926 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650286 intermediateAfterIndex!19 lt!650280 lt!650279 mask!2687) lt!650283)))))

(declare-fun b!1491383 () Bool)

(declare-fun res!1013678 () Bool)

(assert (=> b!1491383 (=> (not res!1013678) (not e!835920))))

(declare-datatypes ((List!34624 0))(
  ( (Nil!34621) (Cons!34620 (h!36017 (_ BitVec 64)) (t!49310 List!34624)) )
))
(declare-fun arrayNoDuplicates!0 (array!99739 (_ BitVec 32) List!34624) Bool)

(assert (=> b!1491383 (= res!1013678 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34621))))

(declare-fun b!1491384 () Bool)

(declare-fun res!1013686 () Bool)

(assert (=> b!1491384 (=> (not res!1013686) (not e!835919))))

(assert (=> b!1491384 (= res!1013686 e!835922)))

(declare-fun c!138385 () Bool)

(assert (=> b!1491384 (= c!138385 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491385 () Bool)

(assert (=> b!1491385 (= e!835920 e!835923)))

(declare-fun res!1013682 () Bool)

(assert (=> b!1491385 (=> (not res!1013682) (not e!835923))))

(assert (=> b!1491385 (= res!1013682 (= (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491385 (= lt!650279 (array!99740 (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48687 a!2862)))))

(declare-fun b!1491386 () Bool)

(assert (=> b!1491386 (= e!835924 e!835919)))

(declare-fun res!1013677 () Bool)

(assert (=> b!1491386 (=> (not res!1013677) (not e!835919))))

(assert (=> b!1491386 (= res!1013677 (= lt!650287 (Intermediate!12273 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491386 (= lt!650287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650280 mask!2687) lt!650280 lt!650279 mask!2687))))

(assert (=> b!1491386 (= lt!650280 (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491387 () Bool)

(assert (=> b!1491387 (= e!835922 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650280 lt!650279 mask!2687) (seekEntryOrOpen!0 lt!650280 lt!650279 mask!2687)))))

(declare-fun b!1491388 () Bool)

(assert (=> b!1491388 (= e!835918 true)))

(assert (=> b!1491388 (= lt!650281 lt!650283)))

(declare-fun lt!650282 () Unit!49919)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49919)

(assert (=> b!1491388 (= lt!650282 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!650286 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1491389 () Bool)

(declare-fun res!1013685 () Bool)

(assert (=> b!1491389 (=> (not res!1013685) (not e!835920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491389 (= res!1013685 (validKeyInArray!0 (select (arr!48136 a!2862) i!1006)))))

(declare-fun b!1491390 () Bool)

(declare-fun res!1013692 () Bool)

(assert (=> b!1491390 (=> (not res!1013692) (not e!835920))))

(assert (=> b!1491390 (= res!1013692 (validKeyInArray!0 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1491391 () Bool)

(assert (=> b!1491391 (= e!835921 e!835918)))

(declare-fun res!1013683 () Bool)

(assert (=> b!1491391 (=> res!1013683 e!835918)))

(assert (=> b!1491391 (= res!1013683 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650286 #b00000000000000000000000000000000) (bvsge lt!650286 (size!48687 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491391 (= lt!650286 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1491391 (= lt!650283 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650280 lt!650279 mask!2687))))

(assert (=> b!1491391 (= lt!650283 (seekEntryOrOpen!0 lt!650280 lt!650279 mask!2687))))

(declare-fun b!1491381 () Bool)

(assert (=> b!1491381 (= e!835926 (not (= lt!650287 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650286 lt!650280 lt!650279 mask!2687))))))

(declare-fun res!1013684 () Bool)

(assert (=> start!127128 (=> (not res!1013684) (not e!835920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127128 (= res!1013684 (validMask!0 mask!2687))))

(assert (=> start!127128 e!835920))

(assert (=> start!127128 true))

(declare-fun array_inv!37417 (array!99739) Bool)

(assert (=> start!127128 (array_inv!37417 a!2862)))

(assert (= (and start!127128 res!1013684) b!1491378))

(assert (= (and b!1491378 res!1013687) b!1491389))

(assert (= (and b!1491389 res!1013685) b!1491390))

(assert (= (and b!1491390 res!1013692) b!1491373))

(assert (= (and b!1491373 res!1013693) b!1491383))

(assert (= (and b!1491383 res!1013678) b!1491379))

(assert (= (and b!1491379 res!1013688) b!1491385))

(assert (= (and b!1491385 res!1013682) b!1491372))

(assert (= (and b!1491372 res!1013691) b!1491374))

(assert (= (and b!1491374 res!1013680) b!1491386))

(assert (= (and b!1491386 res!1013677) b!1491384))

(assert (= (and b!1491384 c!138385) b!1491370))

(assert (= (and b!1491384 (not c!138385)) b!1491387))

(assert (= (and b!1491384 res!1013686) b!1491380))

(assert (= (and b!1491380 res!1013690) b!1491376))

(assert (= (and b!1491376 (not res!1013679)) b!1491391))

(assert (= (and b!1491391 (not res!1013683)) b!1491371))

(assert (= (and b!1491371 (not res!1013676)) b!1491377))

(assert (= (and b!1491377 c!138384) b!1491381))

(assert (= (and b!1491377 (not c!138384)) b!1491382))

(assert (= (and b!1491377 (not res!1013681)) b!1491375))

(assert (= (and b!1491375 (not res!1013689)) b!1491388))

(declare-fun m!1375579 () Bool)

(assert (=> b!1491382 m!1375579))

(declare-fun m!1375581 () Bool)

(assert (=> b!1491386 m!1375581))

(assert (=> b!1491386 m!1375581))

(declare-fun m!1375583 () Bool)

(assert (=> b!1491386 m!1375583))

(declare-fun m!1375585 () Bool)

(assert (=> b!1491386 m!1375585))

(declare-fun m!1375587 () Bool)

(assert (=> b!1491386 m!1375587))

(declare-fun m!1375589 () Bool)

(assert (=> b!1491376 m!1375589))

(assert (=> b!1491376 m!1375585))

(declare-fun m!1375591 () Bool)

(assert (=> b!1491376 m!1375591))

(declare-fun m!1375593 () Bool)

(assert (=> b!1491376 m!1375593))

(declare-fun m!1375595 () Bool)

(assert (=> b!1491376 m!1375595))

(declare-fun m!1375597 () Bool)

(assert (=> b!1491376 m!1375597))

(declare-fun m!1375599 () Bool)

(assert (=> b!1491376 m!1375599))

(declare-fun m!1375601 () Bool)

(assert (=> b!1491376 m!1375601))

(assert (=> b!1491376 m!1375597))

(declare-fun m!1375603 () Bool)

(assert (=> b!1491383 m!1375603))

(declare-fun m!1375605 () Bool)

(assert (=> start!127128 m!1375605))

(declare-fun m!1375607 () Bool)

(assert (=> start!127128 m!1375607))

(declare-fun m!1375609 () Bool)

(assert (=> b!1491388 m!1375609))

(assert (=> b!1491385 m!1375585))

(declare-fun m!1375611 () Bool)

(assert (=> b!1491385 m!1375611))

(declare-fun m!1375613 () Bool)

(assert (=> b!1491391 m!1375613))

(declare-fun m!1375615 () Bool)

(assert (=> b!1491391 m!1375615))

(declare-fun m!1375617 () Bool)

(assert (=> b!1491391 m!1375617))

(assert (=> b!1491371 m!1375597))

(assert (=> b!1491371 m!1375597))

(declare-fun m!1375619 () Bool)

(assert (=> b!1491371 m!1375619))

(assert (=> b!1491372 m!1375597))

(assert (=> b!1491372 m!1375597))

(declare-fun m!1375621 () Bool)

(assert (=> b!1491372 m!1375621))

(assert (=> b!1491372 m!1375621))

(assert (=> b!1491372 m!1375597))

(declare-fun m!1375623 () Bool)

(assert (=> b!1491372 m!1375623))

(declare-fun m!1375625 () Bool)

(assert (=> b!1491381 m!1375625))

(assert (=> b!1491390 m!1375597))

(assert (=> b!1491390 m!1375597))

(declare-fun m!1375627 () Bool)

(assert (=> b!1491390 m!1375627))

(declare-fun m!1375629 () Bool)

(assert (=> b!1491370 m!1375629))

(assert (=> b!1491387 m!1375615))

(assert (=> b!1491387 m!1375617))

(declare-fun m!1375631 () Bool)

(assert (=> b!1491389 m!1375631))

(assert (=> b!1491389 m!1375631))

(declare-fun m!1375633 () Bool)

(assert (=> b!1491389 m!1375633))

(assert (=> b!1491374 m!1375597))

(assert (=> b!1491374 m!1375597))

(declare-fun m!1375635 () Bool)

(assert (=> b!1491374 m!1375635))

(declare-fun m!1375637 () Bool)

(assert (=> b!1491373 m!1375637))

(check-sat (not b!1491381) (not b!1491370) (not b!1491373) (not b!1491388) (not b!1491389) (not b!1491382) (not b!1491387) (not b!1491386) (not b!1491371) (not b!1491374) (not b!1491376) (not b!1491391) (not start!127128) (not b!1491390) (not b!1491383) (not b!1491372))
(check-sat)
