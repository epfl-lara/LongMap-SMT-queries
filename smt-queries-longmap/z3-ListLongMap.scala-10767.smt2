; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126198 () Bool)

(assert start!126198)

(declare-fun b!1476225 () Bool)

(declare-fun res!1002327 () Bool)

(declare-fun e!828366 () Bool)

(assert (=> b!1476225 (=> (not res!1002327) (not e!828366))))

(declare-fun e!828370 () Bool)

(assert (=> b!1476225 (= res!1002327 e!828370)))

(declare-fun c!136477 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476225 (= c!136477 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476226 () Bool)

(declare-datatypes ((array!99313 0))(
  ( (array!99314 (arr!47935 (Array (_ BitVec 32) (_ BitVec 64))) (size!48486 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99313)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!828368 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1476226 (= e!828368 (or (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) (select (arr!47935 a!2862) j!93))))))

(declare-fun b!1476227 () Bool)

(declare-fun e!828372 () Bool)

(declare-fun e!828371 () Bool)

(assert (=> b!1476227 (= e!828372 e!828371)))

(declare-fun res!1002324 () Bool)

(assert (=> b!1476227 (=> (not res!1002324) (not e!828371))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476227 (= res!1002324 (= (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644910 () array!99313)

(assert (=> b!1476227 (= lt!644910 (array!99314 (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48486 a!2862)))))

(declare-fun b!1476228 () Bool)

(declare-fun res!1002321 () Bool)

(assert (=> b!1476228 (=> (not res!1002321) (not e!828366))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476228 (= res!1002321 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1002325 () Bool)

(assert (=> start!126198 (=> (not res!1002325) (not e!828372))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126198 (= res!1002325 (validMask!0 mask!2687))))

(assert (=> start!126198 e!828372))

(assert (=> start!126198 true))

(declare-fun array_inv!37216 (array!99313) Bool)

(assert (=> start!126198 (array_inv!37216 a!2862)))

(declare-fun b!1476229 () Bool)

(declare-fun res!1002331 () Bool)

(assert (=> b!1476229 (=> (not res!1002331) (not e!828372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476229 (= res!1002331 (validKeyInArray!0 (select (arr!47935 a!2862) i!1006)))))

(declare-fun b!1476230 () Bool)

(declare-fun res!1002334 () Bool)

(assert (=> b!1476230 (=> (not res!1002334) (not e!828372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99313 (_ BitVec 32)) Bool)

(assert (=> b!1476230 (= res!1002334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476231 () Bool)

(declare-fun res!1002328 () Bool)

(assert (=> b!1476231 (=> (not res!1002328) (not e!828372))))

(assert (=> b!1476231 (= res!1002328 (validKeyInArray!0 (select (arr!47935 a!2862) j!93)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644914 () (_ BitVec 64))

(declare-fun b!1476232 () Bool)

(declare-datatypes ((SeekEntryResult!12072 0))(
  ( (MissingZero!12072 (index!50680 (_ BitVec 32))) (Found!12072 (index!50681 (_ BitVec 32))) (Intermediate!12072 (undefined!12884 Bool) (index!50682 (_ BitVec 32)) (x!132445 (_ BitVec 32))) (Undefined!12072) (MissingVacant!12072 (index!50683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99313 (_ BitVec 32)) SeekEntryResult!12072)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99313 (_ BitVec 32)) SeekEntryResult!12072)

(assert (=> b!1476232 (= e!828370 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644914 lt!644910 mask!2687) (seekEntryOrOpen!0 lt!644914 lt!644910 mask!2687)))))

(declare-fun b!1476233 () Bool)

(declare-fun lt!644912 () SeekEntryResult!12072)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99313 (_ BitVec 32)) SeekEntryResult!12072)

(assert (=> b!1476233 (= e!828370 (= lt!644912 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644914 lt!644910 mask!2687)))))

(declare-fun b!1476234 () Bool)

(declare-fun res!1002322 () Bool)

(assert (=> b!1476234 (=> (not res!1002322) (not e!828372))))

(assert (=> b!1476234 (= res!1002322 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48486 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48486 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48486 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476235 () Bool)

(declare-fun res!1002326 () Bool)

(assert (=> b!1476235 (=> (not res!1002326) (not e!828368))))

(assert (=> b!1476235 (= res!1002326 (= (seekEntryOrOpen!0 (select (arr!47935 a!2862) j!93) a!2862 mask!2687) (Found!12072 j!93)))))

(declare-fun b!1476236 () Bool)

(declare-fun res!1002330 () Bool)

(assert (=> b!1476236 (=> (not res!1002330) (not e!828372))))

(declare-datatypes ((List!34423 0))(
  ( (Nil!34420) (Cons!34419 (h!35792 (_ BitVec 64)) (t!49109 List!34423)) )
))
(declare-fun arrayNoDuplicates!0 (array!99313 (_ BitVec 32) List!34423) Bool)

(assert (=> b!1476236 (= res!1002330 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34420))))

(declare-fun b!1476237 () Bool)

(declare-fun res!1002335 () Bool)

(declare-fun e!828369 () Bool)

(assert (=> b!1476237 (=> (not res!1002335) (not e!828369))))

(declare-fun lt!644913 () SeekEntryResult!12072)

(assert (=> b!1476237 (= res!1002335 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!644913))))

(declare-fun b!1476238 () Bool)

(assert (=> b!1476238 (= e!828371 e!828369)))

(declare-fun res!1002333 () Bool)

(assert (=> b!1476238 (=> (not res!1002333) (not e!828369))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476238 (= res!1002333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47935 a!2862) j!93) mask!2687) (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!644913))))

(assert (=> b!1476238 (= lt!644913 (Intermediate!12072 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476239 () Bool)

(assert (=> b!1476239 (= e!828369 e!828366)))

(declare-fun res!1002323 () Bool)

(assert (=> b!1476239 (=> (not res!1002323) (not e!828366))))

(assert (=> b!1476239 (= res!1002323 (= lt!644912 (Intermediate!12072 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1476239 (= lt!644912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644914 mask!2687) lt!644914 lt!644910 mask!2687))))

(assert (=> b!1476239 (= lt!644914 (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476240 () Bool)

(declare-fun res!1002329 () Bool)

(assert (=> b!1476240 (=> (not res!1002329) (not e!828372))))

(assert (=> b!1476240 (= res!1002329 (and (= (size!48486 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48486 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48486 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476241 () Bool)

(assert (=> b!1476241 (= e!828366 (not true))))

(assert (=> b!1476241 e!828368))

(declare-fun res!1002332 () Bool)

(assert (=> b!1476241 (=> (not res!1002332) (not e!828368))))

(assert (=> b!1476241 (= res!1002332 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49517 0))(
  ( (Unit!49518) )
))
(declare-fun lt!644911 () Unit!49517)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49517)

(assert (=> b!1476241 (= lt!644911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126198 res!1002325) b!1476240))

(assert (= (and b!1476240 res!1002329) b!1476229))

(assert (= (and b!1476229 res!1002331) b!1476231))

(assert (= (and b!1476231 res!1002328) b!1476230))

(assert (= (and b!1476230 res!1002334) b!1476236))

(assert (= (and b!1476236 res!1002330) b!1476234))

(assert (= (and b!1476234 res!1002322) b!1476227))

(assert (= (and b!1476227 res!1002324) b!1476238))

(assert (= (and b!1476238 res!1002333) b!1476237))

(assert (= (and b!1476237 res!1002335) b!1476239))

(assert (= (and b!1476239 res!1002323) b!1476225))

(assert (= (and b!1476225 c!136477) b!1476233))

(assert (= (and b!1476225 (not c!136477)) b!1476232))

(assert (= (and b!1476225 res!1002327) b!1476228))

(assert (= (and b!1476228 res!1002321) b!1476241))

(assert (= (and b!1476241 res!1002332) b!1476235))

(assert (= (and b!1476235 res!1002326) b!1476226))

(declare-fun m!1362643 () Bool)

(assert (=> b!1476235 m!1362643))

(assert (=> b!1476235 m!1362643))

(declare-fun m!1362645 () Bool)

(assert (=> b!1476235 m!1362645))

(declare-fun m!1362647 () Bool)

(assert (=> b!1476239 m!1362647))

(assert (=> b!1476239 m!1362647))

(declare-fun m!1362649 () Bool)

(assert (=> b!1476239 m!1362649))

(declare-fun m!1362651 () Bool)

(assert (=> b!1476239 m!1362651))

(declare-fun m!1362653 () Bool)

(assert (=> b!1476239 m!1362653))

(declare-fun m!1362655 () Bool)

(assert (=> b!1476236 m!1362655))

(declare-fun m!1362657 () Bool)

(assert (=> b!1476230 m!1362657))

(assert (=> b!1476237 m!1362643))

(assert (=> b!1476237 m!1362643))

(declare-fun m!1362659 () Bool)

(assert (=> b!1476237 m!1362659))

(declare-fun m!1362661 () Bool)

(assert (=> start!126198 m!1362661))

(declare-fun m!1362663 () Bool)

(assert (=> start!126198 m!1362663))

(assert (=> b!1476231 m!1362643))

(assert (=> b!1476231 m!1362643))

(declare-fun m!1362665 () Bool)

(assert (=> b!1476231 m!1362665))

(declare-fun m!1362667 () Bool)

(assert (=> b!1476241 m!1362667))

(declare-fun m!1362669 () Bool)

(assert (=> b!1476241 m!1362669))

(assert (=> b!1476227 m!1362651))

(declare-fun m!1362671 () Bool)

(assert (=> b!1476227 m!1362671))

(declare-fun m!1362673 () Bool)

(assert (=> b!1476226 m!1362673))

(assert (=> b!1476226 m!1362643))

(declare-fun m!1362675 () Bool)

(assert (=> b!1476229 m!1362675))

(assert (=> b!1476229 m!1362675))

(declare-fun m!1362677 () Bool)

(assert (=> b!1476229 m!1362677))

(declare-fun m!1362679 () Bool)

(assert (=> b!1476232 m!1362679))

(declare-fun m!1362681 () Bool)

(assert (=> b!1476232 m!1362681))

(assert (=> b!1476238 m!1362643))

(assert (=> b!1476238 m!1362643))

(declare-fun m!1362683 () Bool)

(assert (=> b!1476238 m!1362683))

(assert (=> b!1476238 m!1362683))

(assert (=> b!1476238 m!1362643))

(declare-fun m!1362685 () Bool)

(assert (=> b!1476238 m!1362685))

(declare-fun m!1362687 () Bool)

(assert (=> b!1476233 m!1362687))

(check-sat (not b!1476231) (not b!1476241) (not b!1476233) (not b!1476229) (not b!1476237) (not b!1476232) (not b!1476235) (not b!1476236) (not b!1476239) (not b!1476238) (not start!126198) (not b!1476230))
(check-sat)
