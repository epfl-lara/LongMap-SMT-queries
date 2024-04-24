; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126666 () Bool)

(assert start!126666)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647499 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12171 0))(
  ( (MissingZero!12171 (index!51076 (_ BitVec 32))) (Found!12171 (index!51077 (_ BitVec 32))) (Intermediate!12171 (undefined!12983 Bool) (index!51078 (_ BitVec 32)) (x!132847 (_ BitVec 32))) (Undefined!12171) (MissingVacant!12171 (index!51079 (_ BitVec 32))) )
))
(declare-fun lt!647498 () SeekEntryResult!12171)

(declare-fun e!832055 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99523 0))(
  ( (array!99524 (arr!48034 (Array (_ BitVec 32) (_ BitVec 64))) (size!48585 (_ BitVec 32))) )
))
(declare-fun lt!647500 () array!99523)

(declare-fun b!1483428 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99523 (_ BitVec 32)) SeekEntryResult!12171)

(assert (=> b!1483428 (= e!832055 (= lt!647498 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647499 lt!647500 mask!2687)))))

(declare-fun b!1483429 () Bool)

(declare-fun e!832057 () Bool)

(declare-fun e!832058 () Bool)

(assert (=> b!1483429 (= e!832057 e!832058)))

(declare-fun res!1007636 () Bool)

(assert (=> b!1483429 (=> (not res!1007636) (not e!832058))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99523)

(assert (=> b!1483429 (= res!1007636 (= (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483429 (= lt!647500 (array!99524 (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48585 a!2862)))))

(declare-fun b!1483430 () Bool)

(declare-fun res!1007627 () Bool)

(declare-fun e!832053 () Bool)

(assert (=> b!1483430 (=> (not res!1007627) (not e!832053))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99523 (_ BitVec 32)) SeekEntryResult!12171)

(assert (=> b!1483430 (= res!1007627 (= (seekEntryOrOpen!0 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) (Found!12171 j!93)))))

(declare-fun b!1483431 () Bool)

(declare-fun res!1007635 () Bool)

(assert (=> b!1483431 (=> (not res!1007635) (not e!832057))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483431 (= res!1007635 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48585 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48585 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48585 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483432 () Bool)

(declare-fun e!832056 () Bool)

(assert (=> b!1483432 (= e!832056 (not true))))

(assert (=> b!1483432 e!832053))

(declare-fun res!1007628 () Bool)

(assert (=> b!1483432 (=> (not res!1007628) (not e!832053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99523 (_ BitVec 32)) Bool)

(assert (=> b!1483432 (= res!1007628 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49715 0))(
  ( (Unit!49716) )
))
(declare-fun lt!647497 () Unit!49715)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49715)

(assert (=> b!1483432 (= lt!647497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483433 () Bool)

(declare-fun e!832059 () Bool)

(assert (=> b!1483433 (= e!832058 e!832059)))

(declare-fun res!1007622 () Bool)

(assert (=> b!1483433 (=> (not res!1007622) (not e!832059))))

(declare-fun lt!647496 () SeekEntryResult!12171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483433 (= res!1007622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!647496))))

(assert (=> b!1483433 (= lt!647496 (Intermediate!12171 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1007632 () Bool)

(assert (=> start!126666 (=> (not res!1007632) (not e!832057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126666 (= res!1007632 (validMask!0 mask!2687))))

(assert (=> start!126666 e!832057))

(assert (=> start!126666 true))

(declare-fun array_inv!37315 (array!99523) Bool)

(assert (=> start!126666 (array_inv!37315 a!2862)))

(declare-fun b!1483434 () Bool)

(declare-fun res!1007634 () Bool)

(assert (=> b!1483434 (=> (not res!1007634) (not e!832057))))

(assert (=> b!1483434 (= res!1007634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483435 () Bool)

(declare-fun res!1007631 () Bool)

(assert (=> b!1483435 (=> (not res!1007631) (not e!832057))))

(assert (=> b!1483435 (= res!1007631 (and (= (size!48585 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48585 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48585 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483436 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99523 (_ BitVec 32)) SeekEntryResult!12171)

(assert (=> b!1483436 (= e!832055 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647499 lt!647500 mask!2687) (seekEntryOrOpen!0 lt!647499 lt!647500 mask!2687)))))

(declare-fun b!1483437 () Bool)

(declare-fun res!1007624 () Bool)

(assert (=> b!1483437 (=> (not res!1007624) (not e!832056))))

(assert (=> b!1483437 (= res!1007624 e!832055)))

(declare-fun c!137434 () Bool)

(assert (=> b!1483437 (= c!137434 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483438 () Bool)

(assert (=> b!1483438 (= e!832053 (and (or (= (select (arr!48034 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48034 a!2862) intermediateBeforeIndex!19) (select (arr!48034 a!2862) j!93))) (or (and (= (select (arr!48034 a!2862) index!646) (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48034 a!2862) index!646) (select (arr!48034 a!2862) j!93))) (= (select (arr!48034 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1483439 () Bool)

(declare-fun res!1007623 () Bool)

(assert (=> b!1483439 (=> (not res!1007623) (not e!832057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483439 (= res!1007623 (validKeyInArray!0 (select (arr!48034 a!2862) j!93)))))

(declare-fun b!1483440 () Bool)

(declare-fun res!1007629 () Bool)

(assert (=> b!1483440 (=> (not res!1007629) (not e!832057))))

(assert (=> b!1483440 (= res!1007629 (validKeyInArray!0 (select (arr!48034 a!2862) i!1006)))))

(declare-fun b!1483441 () Bool)

(assert (=> b!1483441 (= e!832059 e!832056)))

(declare-fun res!1007633 () Bool)

(assert (=> b!1483441 (=> (not res!1007633) (not e!832056))))

(assert (=> b!1483441 (= res!1007633 (= lt!647498 (Intermediate!12171 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483441 (= lt!647498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647499 mask!2687) lt!647499 lt!647500 mask!2687))))

(assert (=> b!1483441 (= lt!647499 (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483442 () Bool)

(declare-fun res!1007626 () Bool)

(assert (=> b!1483442 (=> (not res!1007626) (not e!832059))))

(assert (=> b!1483442 (= res!1007626 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!647496))))

(declare-fun b!1483443 () Bool)

(declare-fun res!1007630 () Bool)

(assert (=> b!1483443 (=> (not res!1007630) (not e!832056))))

(assert (=> b!1483443 (= res!1007630 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483444 () Bool)

(declare-fun res!1007625 () Bool)

(assert (=> b!1483444 (=> (not res!1007625) (not e!832057))))

(declare-datatypes ((List!34522 0))(
  ( (Nil!34519) (Cons!34518 (h!35903 (_ BitVec 64)) (t!49208 List!34522)) )
))
(declare-fun arrayNoDuplicates!0 (array!99523 (_ BitVec 32) List!34522) Bool)

(assert (=> b!1483444 (= res!1007625 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34519))))

(assert (= (and start!126666 res!1007632) b!1483435))

(assert (= (and b!1483435 res!1007631) b!1483440))

(assert (= (and b!1483440 res!1007629) b!1483439))

(assert (= (and b!1483439 res!1007623) b!1483434))

(assert (= (and b!1483434 res!1007634) b!1483444))

(assert (= (and b!1483444 res!1007625) b!1483431))

(assert (= (and b!1483431 res!1007635) b!1483429))

(assert (= (and b!1483429 res!1007636) b!1483433))

(assert (= (and b!1483433 res!1007622) b!1483442))

(assert (= (and b!1483442 res!1007626) b!1483441))

(assert (= (and b!1483441 res!1007633) b!1483437))

(assert (= (and b!1483437 c!137434) b!1483428))

(assert (= (and b!1483437 (not c!137434)) b!1483436))

(assert (= (and b!1483437 res!1007624) b!1483443))

(assert (= (and b!1483443 res!1007630) b!1483432))

(assert (= (and b!1483432 res!1007628) b!1483430))

(assert (= (and b!1483430 res!1007627) b!1483438))

(declare-fun m!1369141 () Bool)

(assert (=> b!1483429 m!1369141))

(declare-fun m!1369143 () Bool)

(assert (=> b!1483429 m!1369143))

(declare-fun m!1369145 () Bool)

(assert (=> b!1483444 m!1369145))

(declare-fun m!1369147 () Bool)

(assert (=> start!126666 m!1369147))

(declare-fun m!1369149 () Bool)

(assert (=> start!126666 m!1369149))

(declare-fun m!1369151 () Bool)

(assert (=> b!1483432 m!1369151))

(declare-fun m!1369153 () Bool)

(assert (=> b!1483432 m!1369153))

(declare-fun m!1369155 () Bool)

(assert (=> b!1483434 m!1369155))

(declare-fun m!1369157 () Bool)

(assert (=> b!1483430 m!1369157))

(assert (=> b!1483430 m!1369157))

(declare-fun m!1369159 () Bool)

(assert (=> b!1483430 m!1369159))

(assert (=> b!1483439 m!1369157))

(assert (=> b!1483439 m!1369157))

(declare-fun m!1369161 () Bool)

(assert (=> b!1483439 m!1369161))

(declare-fun m!1369163 () Bool)

(assert (=> b!1483441 m!1369163))

(assert (=> b!1483441 m!1369163))

(declare-fun m!1369165 () Bool)

(assert (=> b!1483441 m!1369165))

(assert (=> b!1483441 m!1369141))

(declare-fun m!1369167 () Bool)

(assert (=> b!1483441 m!1369167))

(assert (=> b!1483433 m!1369157))

(assert (=> b!1483433 m!1369157))

(declare-fun m!1369169 () Bool)

(assert (=> b!1483433 m!1369169))

(assert (=> b!1483433 m!1369169))

(assert (=> b!1483433 m!1369157))

(declare-fun m!1369171 () Bool)

(assert (=> b!1483433 m!1369171))

(declare-fun m!1369173 () Bool)

(assert (=> b!1483440 m!1369173))

(assert (=> b!1483440 m!1369173))

(declare-fun m!1369175 () Bool)

(assert (=> b!1483440 m!1369175))

(declare-fun m!1369177 () Bool)

(assert (=> b!1483428 m!1369177))

(declare-fun m!1369179 () Bool)

(assert (=> b!1483436 m!1369179))

(declare-fun m!1369181 () Bool)

(assert (=> b!1483436 m!1369181))

(assert (=> b!1483442 m!1369157))

(assert (=> b!1483442 m!1369157))

(declare-fun m!1369183 () Bool)

(assert (=> b!1483442 m!1369183))

(assert (=> b!1483438 m!1369141))

(declare-fun m!1369185 () Bool)

(assert (=> b!1483438 m!1369185))

(declare-fun m!1369187 () Bool)

(assert (=> b!1483438 m!1369187))

(declare-fun m!1369189 () Bool)

(assert (=> b!1483438 m!1369189))

(assert (=> b!1483438 m!1369157))

(check-sat (not b!1483430) (not b!1483433) (not b!1483442) (not b!1483444) (not b!1483441) (not b!1483432) (not start!126666) (not b!1483436) (not b!1483434) (not b!1483439) (not b!1483440) (not b!1483428))
(check-sat)
