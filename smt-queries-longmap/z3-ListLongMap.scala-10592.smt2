; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124908 () Bool)

(assert start!124908)

(declare-fun res!977482 () Bool)

(declare-fun e!814924 () Bool)

(assert (=> start!124908 (=> (not res!977482) (not e!814924))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124908 (= res!977482 (validMask!0 mask!2687))))

(assert (=> start!124908 e!814924))

(assert (=> start!124908 true))

(declare-datatypes ((array!98251 0))(
  ( (array!98252 (arr!47410 (Array (_ BitVec 32) (_ BitVec 64))) (size!47961 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98251)

(declare-fun array_inv!36691 (array!98251) Bool)

(assert (=> start!124908 (array_inv!36691 a!2862)))

(declare-fun b!1446378 () Bool)

(declare-fun res!977483 () Bool)

(declare-fun e!814926 () Bool)

(assert (=> b!1446378 (=> (not res!977483) (not e!814926))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446378 (= res!977483 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446379 () Bool)

(declare-fun res!977474 () Bool)

(declare-fun e!814925 () Bool)

(assert (=> b!1446379 (=> (not res!977474) (not e!814925))))

(declare-datatypes ((SeekEntryResult!11559 0))(
  ( (MissingZero!11559 (index!48628 (_ BitVec 32))) (Found!11559 (index!48629 (_ BitVec 32))) (Intermediate!11559 (undefined!12371 Bool) (index!48630 (_ BitVec 32)) (x!130496 (_ BitVec 32))) (Undefined!11559) (MissingVacant!11559 (index!48631 (_ BitVec 32))) )
))
(declare-fun lt!634860 () SeekEntryResult!11559)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98251 (_ BitVec 32)) SeekEntryResult!11559)

(assert (=> b!1446379 (= res!977474 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47410 a!2862) j!93) a!2862 mask!2687) lt!634860))))

(declare-fun b!1446380 () Bool)

(declare-fun res!977477 () Bool)

(assert (=> b!1446380 (=> (not res!977477) (not e!814926))))

(declare-fun e!814921 () Bool)

(assert (=> b!1446380 (= res!977477 e!814921)))

(declare-fun c!133972 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446380 (= c!133972 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446381 () Bool)

(declare-fun e!814920 () Bool)

(assert (=> b!1446381 (= e!814920 e!814925)))

(declare-fun res!977472 () Bool)

(assert (=> b!1446381 (=> (not res!977472) (not e!814925))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446381 (= res!977472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47410 a!2862) j!93) mask!2687) (select (arr!47410 a!2862) j!93) a!2862 mask!2687) lt!634860))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446381 (= lt!634860 (Intermediate!11559 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446382 () Bool)

(declare-fun res!977479 () Bool)

(assert (=> b!1446382 (=> (not res!977479) (not e!814924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446382 (= res!977479 (validKeyInArray!0 (select (arr!47410 a!2862) j!93)))))

(declare-fun b!1446383 () Bool)

(declare-fun res!977478 () Bool)

(assert (=> b!1446383 (=> (not res!977478) (not e!814924))))

(assert (=> b!1446383 (= res!977478 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47961 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47961 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47961 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446384 () Bool)

(declare-fun res!977481 () Bool)

(assert (=> b!1446384 (=> (not res!977481) (not e!814924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98251 (_ BitVec 32)) Bool)

(assert (=> b!1446384 (= res!977481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446385 () Bool)

(assert (=> b!1446385 (= e!814926 (not true))))

(declare-fun e!814922 () Bool)

(assert (=> b!1446385 e!814922))

(declare-fun res!977486 () Bool)

(assert (=> b!1446385 (=> (not res!977486) (not e!814922))))

(assert (=> b!1446385 (= res!977486 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48647 0))(
  ( (Unit!48648) )
))
(declare-fun lt!634864 () Unit!48647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48647)

(assert (=> b!1446385 (= lt!634864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446386 () Bool)

(declare-fun res!977476 () Bool)

(assert (=> b!1446386 (=> (not res!977476) (not e!814924))))

(assert (=> b!1446386 (= res!977476 (and (= (size!47961 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47961 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47961 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446387 () Bool)

(declare-fun lt!634863 () (_ BitVec 64))

(declare-fun lt!634861 () array!98251)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98251 (_ BitVec 32)) SeekEntryResult!11559)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98251 (_ BitVec 32)) SeekEntryResult!11559)

(assert (=> b!1446387 (= e!814921 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634863 lt!634861 mask!2687) (seekEntryOrOpen!0 lt!634863 lt!634861 mask!2687)))))

(declare-fun b!1446388 () Bool)

(declare-fun res!977480 () Bool)

(assert (=> b!1446388 (=> (not res!977480) (not e!814924))))

(assert (=> b!1446388 (= res!977480 (validKeyInArray!0 (select (arr!47410 a!2862) i!1006)))))

(declare-fun b!1446389 () Bool)

(assert (=> b!1446389 (= e!814922 (or (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) (select (arr!47410 a!2862) j!93))))))

(declare-fun lt!634862 () SeekEntryResult!11559)

(declare-fun b!1446390 () Bool)

(assert (=> b!1446390 (= e!814921 (= lt!634862 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634863 lt!634861 mask!2687)))))

(declare-fun b!1446391 () Bool)

(assert (=> b!1446391 (= e!814925 e!814926)))

(declare-fun res!977485 () Bool)

(assert (=> b!1446391 (=> (not res!977485) (not e!814926))))

(assert (=> b!1446391 (= res!977485 (= lt!634862 (Intermediate!11559 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446391 (= lt!634862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634863 mask!2687) lt!634863 lt!634861 mask!2687))))

(assert (=> b!1446391 (= lt!634863 (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446392 () Bool)

(assert (=> b!1446392 (= e!814924 e!814920)))

(declare-fun res!977475 () Bool)

(assert (=> b!1446392 (=> (not res!977475) (not e!814920))))

(assert (=> b!1446392 (= res!977475 (= (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446392 (= lt!634861 (array!98252 (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47961 a!2862)))))

(declare-fun b!1446393 () Bool)

(declare-fun res!977484 () Bool)

(assert (=> b!1446393 (=> (not res!977484) (not e!814924))))

(declare-datatypes ((List!33898 0))(
  ( (Nil!33895) (Cons!33894 (h!35255 (_ BitVec 64)) (t!48584 List!33898)) )
))
(declare-fun arrayNoDuplicates!0 (array!98251 (_ BitVec 32) List!33898) Bool)

(assert (=> b!1446393 (= res!977484 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33895))))

(declare-fun b!1446394 () Bool)

(declare-fun res!977473 () Bool)

(assert (=> b!1446394 (=> (not res!977473) (not e!814922))))

(assert (=> b!1446394 (= res!977473 (= (seekEntryOrOpen!0 (select (arr!47410 a!2862) j!93) a!2862 mask!2687) (Found!11559 j!93)))))

(assert (= (and start!124908 res!977482) b!1446386))

(assert (= (and b!1446386 res!977476) b!1446388))

(assert (= (and b!1446388 res!977480) b!1446382))

(assert (= (and b!1446382 res!977479) b!1446384))

(assert (= (and b!1446384 res!977481) b!1446393))

(assert (= (and b!1446393 res!977484) b!1446383))

(assert (= (and b!1446383 res!977478) b!1446392))

(assert (= (and b!1446392 res!977475) b!1446381))

(assert (= (and b!1446381 res!977472) b!1446379))

(assert (= (and b!1446379 res!977474) b!1446391))

(assert (= (and b!1446391 res!977485) b!1446380))

(assert (= (and b!1446380 c!133972) b!1446390))

(assert (= (and b!1446380 (not c!133972)) b!1446387))

(assert (= (and b!1446380 res!977477) b!1446378))

(assert (= (and b!1446378 res!977483) b!1446385))

(assert (= (and b!1446385 res!977486) b!1446394))

(assert (= (and b!1446394 res!977473) b!1446389))

(declare-fun m!1335475 () Bool)

(assert (=> b!1446391 m!1335475))

(assert (=> b!1446391 m!1335475))

(declare-fun m!1335477 () Bool)

(assert (=> b!1446391 m!1335477))

(declare-fun m!1335479 () Bool)

(assert (=> b!1446391 m!1335479))

(declare-fun m!1335481 () Bool)

(assert (=> b!1446391 m!1335481))

(declare-fun m!1335483 () Bool)

(assert (=> b!1446388 m!1335483))

(assert (=> b!1446388 m!1335483))

(declare-fun m!1335485 () Bool)

(assert (=> b!1446388 m!1335485))

(declare-fun m!1335487 () Bool)

(assert (=> b!1446393 m!1335487))

(assert (=> b!1446392 m!1335479))

(declare-fun m!1335489 () Bool)

(assert (=> b!1446392 m!1335489))

(declare-fun m!1335491 () Bool)

(assert (=> b!1446381 m!1335491))

(assert (=> b!1446381 m!1335491))

(declare-fun m!1335493 () Bool)

(assert (=> b!1446381 m!1335493))

(assert (=> b!1446381 m!1335493))

(assert (=> b!1446381 m!1335491))

(declare-fun m!1335495 () Bool)

(assert (=> b!1446381 m!1335495))

(declare-fun m!1335497 () Bool)

(assert (=> b!1446387 m!1335497))

(declare-fun m!1335499 () Bool)

(assert (=> b!1446387 m!1335499))

(declare-fun m!1335501 () Bool)

(assert (=> b!1446389 m!1335501))

(assert (=> b!1446389 m!1335491))

(declare-fun m!1335503 () Bool)

(assert (=> b!1446384 m!1335503))

(declare-fun m!1335505 () Bool)

(assert (=> b!1446385 m!1335505))

(declare-fun m!1335507 () Bool)

(assert (=> b!1446385 m!1335507))

(assert (=> b!1446382 m!1335491))

(assert (=> b!1446382 m!1335491))

(declare-fun m!1335509 () Bool)

(assert (=> b!1446382 m!1335509))

(assert (=> b!1446379 m!1335491))

(assert (=> b!1446379 m!1335491))

(declare-fun m!1335511 () Bool)

(assert (=> b!1446379 m!1335511))

(assert (=> b!1446394 m!1335491))

(assert (=> b!1446394 m!1335491))

(declare-fun m!1335513 () Bool)

(assert (=> b!1446394 m!1335513))

(declare-fun m!1335515 () Bool)

(assert (=> b!1446390 m!1335515))

(declare-fun m!1335517 () Bool)

(assert (=> start!124908 m!1335517))

(declare-fun m!1335519 () Bool)

(assert (=> start!124908 m!1335519))

(check-sat (not b!1446388) (not start!124908) (not b!1446381) (not b!1446379) (not b!1446384) (not b!1446391) (not b!1446382) (not b!1446390) (not b!1446394) (not b!1446387) (not b!1446385) (not b!1446393))
(check-sat)
