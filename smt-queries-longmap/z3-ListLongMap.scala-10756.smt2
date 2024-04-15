; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125764 () Bool)

(assert start!125764)

(declare-fun res!1000008 () Bool)

(declare-fun e!826227 () Bool)

(assert (=> start!125764 (=> (not res!1000008) (not e!826227))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125764 (= res!1000008 (validMask!0 mask!2687))))

(assert (=> start!125764 e!826227))

(assert (=> start!125764 true))

(declare-datatypes ((array!99076 0))(
  ( (array!99077 (arr!47824 (Array (_ BitVec 32) (_ BitVec 64))) (size!48376 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99076)

(declare-fun array_inv!37057 (array!99076) Bool)

(assert (=> start!125764 (array_inv!37057 a!2862)))

(declare-fun b!1472222 () Bool)

(declare-fun res!1000010 () Bool)

(assert (=> b!1472222 (=> (not res!1000010) (not e!826227))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472222 (= res!1000010 (validKeyInArray!0 (select (arr!47824 a!2862) j!93)))))

(declare-fun b!1472223 () Bool)

(declare-fun res!1000005 () Bool)

(declare-fun e!826229 () Bool)

(assert (=> b!1472223 (=> (not res!1000005) (not e!826229))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472223 (= res!1000005 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472224 () Bool)

(declare-fun res!1000013 () Bool)

(assert (=> b!1472224 (=> (not res!1000013) (not e!826227))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472224 (= res!1000013 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48376 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48376 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48376 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472225 () Bool)

(declare-fun res!1000015 () Bool)

(assert (=> b!1472225 (=> (not res!1000015) (not e!826227))))

(assert (=> b!1472225 (= res!1000015 (and (= (size!48376 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48376 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48376 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472226 () Bool)

(declare-fun res!1000009 () Bool)

(declare-fun e!826230 () Bool)

(assert (=> b!1472226 (=> (not res!1000009) (not e!826230))))

(declare-datatypes ((SeekEntryResult!12089 0))(
  ( (MissingZero!12089 (index!50748 (_ BitVec 32))) (Found!12089 (index!50749 (_ BitVec 32))) (Intermediate!12089 (undefined!12901 Bool) (index!50750 (_ BitVec 32)) (x!132327 (_ BitVec 32))) (Undefined!12089) (MissingVacant!12089 (index!50751 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99076 (_ BitVec 32)) SeekEntryResult!12089)

(assert (=> b!1472226 (= res!1000009 (= (seekEntryOrOpen!0 (select (arr!47824 a!2862) j!93) a!2862 mask!2687) (Found!12089 j!93)))))

(declare-fun b!1472227 () Bool)

(declare-fun res!1000011 () Bool)

(declare-fun e!826225 () Bool)

(assert (=> b!1472227 (=> (not res!1000011) (not e!826225))))

(declare-fun lt!643335 () SeekEntryResult!12089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99076 (_ BitVec 32)) SeekEntryResult!12089)

(assert (=> b!1472227 (= res!1000011 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47824 a!2862) j!93) a!2862 mask!2687) lt!643335))))

(declare-fun b!1472228 () Bool)

(declare-fun res!1000016 () Bool)

(assert (=> b!1472228 (=> (not res!1000016) (not e!826227))))

(declare-datatypes ((List!34403 0))(
  ( (Nil!34400) (Cons!34399 (h!35755 (_ BitVec 64)) (t!49089 List!34403)) )
))
(declare-fun arrayNoDuplicates!0 (array!99076 (_ BitVec 32) List!34403) Bool)

(assert (=> b!1472228 (= res!1000016 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34400))))

(declare-fun b!1472229 () Bool)

(declare-fun e!826224 () Bool)

(assert (=> b!1472229 (= e!826224 e!826225)))

(declare-fun res!1000012 () Bool)

(assert (=> b!1472229 (=> (not res!1000012) (not e!826225))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472229 (= res!1000012 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47824 a!2862) j!93) mask!2687) (select (arr!47824 a!2862) j!93) a!2862 mask!2687) lt!643335))))

(assert (=> b!1472229 (= lt!643335 (Intermediate!12089 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472230 () Bool)

(declare-fun res!1000014 () Bool)

(assert (=> b!1472230 (=> (not res!1000014) (not e!826229))))

(declare-fun e!826226 () Bool)

(assert (=> b!1472230 (= res!1000014 e!826226)))

(declare-fun c!135625 () Bool)

(assert (=> b!1472230 (= c!135625 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!643332 () array!99076)

(declare-fun lt!643333 () (_ BitVec 64))

(declare-fun b!1472231 () Bool)

(declare-fun lt!643334 () SeekEntryResult!12089)

(assert (=> b!1472231 (= e!826226 (= lt!643334 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643333 lt!643332 mask!2687)))))

(declare-fun b!1472232 () Bool)

(declare-fun res!1000017 () Bool)

(assert (=> b!1472232 (=> (not res!1000017) (not e!826227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99076 (_ BitVec 32)) Bool)

(assert (=> b!1472232 (= res!1000017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472233 () Bool)

(assert (=> b!1472233 (= e!826225 e!826229)))

(declare-fun res!1000007 () Bool)

(assert (=> b!1472233 (=> (not res!1000007) (not e!826229))))

(assert (=> b!1472233 (= res!1000007 (= lt!643334 (Intermediate!12089 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472233 (= lt!643334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643333 mask!2687) lt!643333 lt!643332 mask!2687))))

(assert (=> b!1472233 (= lt!643333 (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472234 () Bool)

(assert (=> b!1472234 (= e!826229 (not true))))

(assert (=> b!1472234 e!826230))

(declare-fun res!1000018 () Bool)

(assert (=> b!1472234 (=> (not res!1000018) (not e!826230))))

(assert (=> b!1472234 (= res!1000018 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49359 0))(
  ( (Unit!49360) )
))
(declare-fun lt!643331 () Unit!49359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49359)

(assert (=> b!1472234 (= lt!643331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472235 () Bool)

(assert (=> b!1472235 (= e!826230 (or (= (select (arr!47824 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47824 a!2862) intermediateBeforeIndex!19) (select (arr!47824 a!2862) j!93))))))

(declare-fun b!1472236 () Bool)

(declare-fun res!1000004 () Bool)

(assert (=> b!1472236 (=> (not res!1000004) (not e!826227))))

(assert (=> b!1472236 (= res!1000004 (validKeyInArray!0 (select (arr!47824 a!2862) i!1006)))))

(declare-fun b!1472237 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99076 (_ BitVec 32)) SeekEntryResult!12089)

(assert (=> b!1472237 (= e!826226 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643333 lt!643332 mask!2687) (seekEntryOrOpen!0 lt!643333 lt!643332 mask!2687)))))

(declare-fun b!1472238 () Bool)

(assert (=> b!1472238 (= e!826227 e!826224)))

(declare-fun res!1000006 () Bool)

(assert (=> b!1472238 (=> (not res!1000006) (not e!826224))))

(assert (=> b!1472238 (= res!1000006 (= (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472238 (= lt!643332 (array!99077 (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48376 a!2862)))))

(assert (= (and start!125764 res!1000008) b!1472225))

(assert (= (and b!1472225 res!1000015) b!1472236))

(assert (= (and b!1472236 res!1000004) b!1472222))

(assert (= (and b!1472222 res!1000010) b!1472232))

(assert (= (and b!1472232 res!1000017) b!1472228))

(assert (= (and b!1472228 res!1000016) b!1472224))

(assert (= (and b!1472224 res!1000013) b!1472238))

(assert (= (and b!1472238 res!1000006) b!1472229))

(assert (= (and b!1472229 res!1000012) b!1472227))

(assert (= (and b!1472227 res!1000011) b!1472233))

(assert (= (and b!1472233 res!1000007) b!1472230))

(assert (= (and b!1472230 c!135625) b!1472231))

(assert (= (and b!1472230 (not c!135625)) b!1472237))

(assert (= (and b!1472230 res!1000014) b!1472223))

(assert (= (and b!1472223 res!1000005) b!1472234))

(assert (= (and b!1472234 res!1000018) b!1472226))

(assert (= (and b!1472226 res!1000009) b!1472235))

(declare-fun m!1358457 () Bool)

(assert (=> b!1472228 m!1358457))

(declare-fun m!1358459 () Bool)

(assert (=> b!1472237 m!1358459))

(declare-fun m!1358461 () Bool)

(assert (=> b!1472237 m!1358461))

(declare-fun m!1358463 () Bool)

(assert (=> b!1472234 m!1358463))

(declare-fun m!1358465 () Bool)

(assert (=> b!1472234 m!1358465))

(declare-fun m!1358467 () Bool)

(assert (=> b!1472231 m!1358467))

(declare-fun m!1358469 () Bool)

(assert (=> b!1472227 m!1358469))

(assert (=> b!1472227 m!1358469))

(declare-fun m!1358471 () Bool)

(assert (=> b!1472227 m!1358471))

(declare-fun m!1358473 () Bool)

(assert (=> b!1472235 m!1358473))

(assert (=> b!1472235 m!1358469))

(assert (=> b!1472229 m!1358469))

(assert (=> b!1472229 m!1358469))

(declare-fun m!1358475 () Bool)

(assert (=> b!1472229 m!1358475))

(assert (=> b!1472229 m!1358475))

(assert (=> b!1472229 m!1358469))

(declare-fun m!1358477 () Bool)

(assert (=> b!1472229 m!1358477))

(declare-fun m!1358479 () Bool)

(assert (=> b!1472232 m!1358479))

(assert (=> b!1472226 m!1358469))

(assert (=> b!1472226 m!1358469))

(declare-fun m!1358481 () Bool)

(assert (=> b!1472226 m!1358481))

(declare-fun m!1358483 () Bool)

(assert (=> start!125764 m!1358483))

(declare-fun m!1358485 () Bool)

(assert (=> start!125764 m!1358485))

(declare-fun m!1358487 () Bool)

(assert (=> b!1472238 m!1358487))

(declare-fun m!1358489 () Bool)

(assert (=> b!1472238 m!1358489))

(declare-fun m!1358491 () Bool)

(assert (=> b!1472233 m!1358491))

(assert (=> b!1472233 m!1358491))

(declare-fun m!1358493 () Bool)

(assert (=> b!1472233 m!1358493))

(assert (=> b!1472233 m!1358487))

(declare-fun m!1358495 () Bool)

(assert (=> b!1472233 m!1358495))

(declare-fun m!1358497 () Bool)

(assert (=> b!1472236 m!1358497))

(assert (=> b!1472236 m!1358497))

(declare-fun m!1358499 () Bool)

(assert (=> b!1472236 m!1358499))

(assert (=> b!1472222 m!1358469))

(assert (=> b!1472222 m!1358469))

(declare-fun m!1358501 () Bool)

(assert (=> b!1472222 m!1358501))

(check-sat (not b!1472229) (not b!1472231) (not b!1472234) (not b!1472237) (not b!1472227) (not start!125764) (not b!1472222) (not b!1472233) (not b!1472232) (not b!1472226) (not b!1472228) (not b!1472236))
(check-sat)
