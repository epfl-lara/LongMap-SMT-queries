; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125338 () Bool)

(assert start!125338)

(declare-fun b!1465422 () Bool)

(declare-fun e!823395 () Bool)

(assert (=> b!1465422 (= e!823395 true)))

(declare-fun lt!641232 () Bool)

(declare-fun e!823399 () Bool)

(assert (=> b!1465422 (= lt!641232 e!823399)))

(declare-fun c!135027 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465422 (= c!135027 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465423 () Bool)

(declare-fun e!823396 () Bool)

(declare-fun e!823404 () Bool)

(assert (=> b!1465423 (= e!823396 e!823404)))

(declare-fun res!994394 () Bool)

(assert (=> b!1465423 (=> (not res!994394) (not e!823404))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98764 0))(
  ( (array!98765 (arr!47671 (Array (_ BitVec 32) (_ BitVec 64))) (size!48223 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98764)

(assert (=> b!1465423 (= res!994394 (= (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641228 () array!98764)

(assert (=> b!1465423 (= lt!641228 (array!98765 (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48223 a!2862)))))

(declare-fun b!1465424 () Bool)

(declare-fun lt!641230 () (_ BitVec 32))

(declare-fun lt!641226 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11948 0))(
  ( (MissingZero!11948 (index!50184 (_ BitVec 32))) (Found!11948 (index!50185 (_ BitVec 32))) (Intermediate!11948 (undefined!12760 Bool) (index!50186 (_ BitVec 32)) (x!131760 (_ BitVec 32))) (Undefined!11948) (MissingVacant!11948 (index!50187 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98764 (_ BitVec 32)) SeekEntryResult!11948)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98764 (_ BitVec 32)) SeekEntryResult!11948)

(assert (=> b!1465424 (= e!823399 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641230 intermediateAfterIndex!19 lt!641226 lt!641228 mask!2687) (seekEntryOrOpen!0 lt!641226 lt!641228 mask!2687))))))

(declare-fun b!1465425 () Bool)

(declare-fun res!994411 () Bool)

(assert (=> b!1465425 (=> (not res!994411) (not e!823396))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465425 (= res!994411 (and (= (size!48223 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48223 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48223 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!994395 () Bool)

(assert (=> start!125338 (=> (not res!994395) (not e!823396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125338 (= res!994395 (validMask!0 mask!2687))))

(assert (=> start!125338 e!823396))

(assert (=> start!125338 true))

(declare-fun array_inv!36904 (array!98764) Bool)

(assert (=> start!125338 (array_inv!36904 a!2862)))

(declare-fun b!1465426 () Bool)

(declare-fun lt!641227 () SeekEntryResult!11948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98764 (_ BitVec 32)) SeekEntryResult!11948)

(assert (=> b!1465426 (= e!823399 (not (= lt!641227 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641230 lt!641226 lt!641228 mask!2687))))))

(declare-fun b!1465427 () Bool)

(declare-fun e!823397 () Bool)

(assert (=> b!1465427 (= e!823404 e!823397)))

(declare-fun res!994402 () Bool)

(assert (=> b!1465427 (=> (not res!994402) (not e!823397))))

(declare-fun lt!641229 () SeekEntryResult!11948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465427 (= res!994402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47671 a!2862) j!93) mask!2687) (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!641229))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465427 (= lt!641229 (Intermediate!11948 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465428 () Bool)

(declare-fun res!994396 () Bool)

(assert (=> b!1465428 (=> (not res!994396) (not e!823397))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1465428 (= res!994396 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!641229))))

(declare-fun b!1465429 () Bool)

(declare-fun res!994401 () Bool)

(declare-fun e!823401 () Bool)

(assert (=> b!1465429 (=> (not res!994401) (not e!823401))))

(assert (=> b!1465429 (= res!994401 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465430 () Bool)

(declare-fun res!994406 () Bool)

(assert (=> b!1465430 (=> (not res!994406) (not e!823396))))

(assert (=> b!1465430 (= res!994406 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48223 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48223 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48223 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!823398 () Bool)

(declare-fun b!1465431 () Bool)

(assert (=> b!1465431 (= e!823398 (= lt!641227 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641226 lt!641228 mask!2687)))))

(declare-fun b!1465432 () Bool)

(declare-fun res!994398 () Bool)

(assert (=> b!1465432 (=> (not res!994398) (not e!823396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465432 (= res!994398 (validKeyInArray!0 (select (arr!47671 a!2862) i!1006)))))

(declare-fun b!1465433 () Bool)

(declare-fun e!823403 () Bool)

(assert (=> b!1465433 (= e!823403 e!823395)))

(declare-fun res!994408 () Bool)

(assert (=> b!1465433 (=> res!994408 e!823395)))

(assert (=> b!1465433 (= res!994408 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641230 #b00000000000000000000000000000000) (bvsge lt!641230 (size!48223 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465433 (= lt!641230 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465434 () Bool)

(declare-fun res!994400 () Bool)

(assert (=> b!1465434 (=> (not res!994400) (not e!823396))))

(assert (=> b!1465434 (= res!994400 (validKeyInArray!0 (select (arr!47671 a!2862) j!93)))))

(declare-fun b!1465435 () Bool)

(declare-fun res!994405 () Bool)

(assert (=> b!1465435 (=> res!994405 e!823395)))

(assert (=> b!1465435 (= res!994405 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641230 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!641229)))))

(declare-fun b!1465436 () Bool)

(declare-fun res!994397 () Bool)

(assert (=> b!1465436 (=> (not res!994397) (not e!823396))))

(declare-datatypes ((List!34250 0))(
  ( (Nil!34247) (Cons!34246 (h!35596 (_ BitVec 64)) (t!48936 List!34250)) )
))
(declare-fun arrayNoDuplicates!0 (array!98764 (_ BitVec 32) List!34250) Bool)

(assert (=> b!1465436 (= res!994397 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34247))))

(declare-fun e!823402 () Bool)

(declare-fun b!1465437 () Bool)

(assert (=> b!1465437 (= e!823402 (or (= (select (arr!47671 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47671 a!2862) intermediateBeforeIndex!19) (select (arr!47671 a!2862) j!93))))))

(declare-fun b!1465438 () Bool)

(declare-fun res!994407 () Bool)

(assert (=> b!1465438 (=> (not res!994407) (not e!823402))))

(assert (=> b!1465438 (= res!994407 (= (seekEntryOrOpen!0 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) (Found!11948 j!93)))))

(declare-fun b!1465439 () Bool)

(declare-fun res!994410 () Bool)

(assert (=> b!1465439 (=> (not res!994410) (not e!823396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98764 (_ BitVec 32)) Bool)

(assert (=> b!1465439 (= res!994410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465440 () Bool)

(assert (=> b!1465440 (= e!823398 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641226 lt!641228 mask!2687) (seekEntryOrOpen!0 lt!641226 lt!641228 mask!2687)))))

(declare-fun b!1465441 () Bool)

(assert (=> b!1465441 (= e!823397 e!823401)))

(declare-fun res!994403 () Bool)

(assert (=> b!1465441 (=> (not res!994403) (not e!823401))))

(assert (=> b!1465441 (= res!994403 (= lt!641227 (Intermediate!11948 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465441 (= lt!641227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641226 mask!2687) lt!641226 lt!641228 mask!2687))))

(assert (=> b!1465441 (= lt!641226 (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465442 () Bool)

(declare-fun res!994409 () Bool)

(assert (=> b!1465442 (=> (not res!994409) (not e!823401))))

(assert (=> b!1465442 (= res!994409 e!823398)))

(declare-fun c!135028 () Bool)

(assert (=> b!1465442 (= c!135028 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465443 () Bool)

(assert (=> b!1465443 (= e!823401 (not e!823403))))

(declare-fun res!994404 () Bool)

(assert (=> b!1465443 (=> res!994404 e!823403)))

(assert (=> b!1465443 (= res!994404 (or (and (= (select (arr!47671 a!2862) index!646) (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47671 a!2862) index!646) (select (arr!47671 a!2862) j!93))) (= (select (arr!47671 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465443 e!823402))

(declare-fun res!994399 () Bool)

(assert (=> b!1465443 (=> (not res!994399) (not e!823402))))

(assert (=> b!1465443 (= res!994399 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49233 0))(
  ( (Unit!49234) )
))
(declare-fun lt!641231 () Unit!49233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49233)

(assert (=> b!1465443 (= lt!641231 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125338 res!994395) b!1465425))

(assert (= (and b!1465425 res!994411) b!1465432))

(assert (= (and b!1465432 res!994398) b!1465434))

(assert (= (and b!1465434 res!994400) b!1465439))

(assert (= (and b!1465439 res!994410) b!1465436))

(assert (= (and b!1465436 res!994397) b!1465430))

(assert (= (and b!1465430 res!994406) b!1465423))

(assert (= (and b!1465423 res!994394) b!1465427))

(assert (= (and b!1465427 res!994402) b!1465428))

(assert (= (and b!1465428 res!994396) b!1465441))

(assert (= (and b!1465441 res!994403) b!1465442))

(assert (= (and b!1465442 c!135028) b!1465431))

(assert (= (and b!1465442 (not c!135028)) b!1465440))

(assert (= (and b!1465442 res!994409) b!1465429))

(assert (= (and b!1465429 res!994401) b!1465443))

(assert (= (and b!1465443 res!994399) b!1465438))

(assert (= (and b!1465438 res!994407) b!1465437))

(assert (= (and b!1465443 (not res!994404)) b!1465433))

(assert (= (and b!1465433 (not res!994408)) b!1465435))

(assert (= (and b!1465435 (not res!994405)) b!1465422))

(assert (= (and b!1465422 c!135027) b!1465426))

(assert (= (and b!1465422 (not c!135027)) b!1465424))

(declare-fun m!1352013 () Bool)

(assert (=> b!1465440 m!1352013))

(declare-fun m!1352015 () Bool)

(assert (=> b!1465440 m!1352015))

(declare-fun m!1352017 () Bool)

(assert (=> b!1465431 m!1352017))

(declare-fun m!1352019 () Bool)

(assert (=> b!1465441 m!1352019))

(assert (=> b!1465441 m!1352019))

(declare-fun m!1352021 () Bool)

(assert (=> b!1465441 m!1352021))

(declare-fun m!1352023 () Bool)

(assert (=> b!1465441 m!1352023))

(declare-fun m!1352025 () Bool)

(assert (=> b!1465441 m!1352025))

(declare-fun m!1352027 () Bool)

(assert (=> b!1465424 m!1352027))

(assert (=> b!1465424 m!1352015))

(declare-fun m!1352029 () Bool)

(assert (=> b!1465438 m!1352029))

(assert (=> b!1465438 m!1352029))

(declare-fun m!1352031 () Bool)

(assert (=> b!1465438 m!1352031))

(declare-fun m!1352033 () Bool)

(assert (=> b!1465426 m!1352033))

(declare-fun m!1352035 () Bool)

(assert (=> b!1465432 m!1352035))

(assert (=> b!1465432 m!1352035))

(declare-fun m!1352037 () Bool)

(assert (=> b!1465432 m!1352037))

(declare-fun m!1352039 () Bool)

(assert (=> b!1465437 m!1352039))

(assert (=> b!1465437 m!1352029))

(assert (=> b!1465427 m!1352029))

(assert (=> b!1465427 m!1352029))

(declare-fun m!1352041 () Bool)

(assert (=> b!1465427 m!1352041))

(assert (=> b!1465427 m!1352041))

(assert (=> b!1465427 m!1352029))

(declare-fun m!1352043 () Bool)

(assert (=> b!1465427 m!1352043))

(declare-fun m!1352045 () Bool)

(assert (=> b!1465443 m!1352045))

(assert (=> b!1465443 m!1352023))

(declare-fun m!1352047 () Bool)

(assert (=> b!1465443 m!1352047))

(declare-fun m!1352049 () Bool)

(assert (=> b!1465443 m!1352049))

(declare-fun m!1352051 () Bool)

(assert (=> b!1465443 m!1352051))

(assert (=> b!1465443 m!1352029))

(assert (=> b!1465428 m!1352029))

(assert (=> b!1465428 m!1352029))

(declare-fun m!1352053 () Bool)

(assert (=> b!1465428 m!1352053))

(assert (=> b!1465435 m!1352029))

(assert (=> b!1465435 m!1352029))

(declare-fun m!1352055 () Bool)

(assert (=> b!1465435 m!1352055))

(declare-fun m!1352057 () Bool)

(assert (=> b!1465439 m!1352057))

(declare-fun m!1352059 () Bool)

(assert (=> start!125338 m!1352059))

(declare-fun m!1352061 () Bool)

(assert (=> start!125338 m!1352061))

(declare-fun m!1352063 () Bool)

(assert (=> b!1465433 m!1352063))

(declare-fun m!1352065 () Bool)

(assert (=> b!1465436 m!1352065))

(assert (=> b!1465423 m!1352023))

(declare-fun m!1352067 () Bool)

(assert (=> b!1465423 m!1352067))

(assert (=> b!1465434 m!1352029))

(assert (=> b!1465434 m!1352029))

(declare-fun m!1352069 () Bool)

(assert (=> b!1465434 m!1352069))

(check-sat (not b!1465428) (not b!1465427) (not b!1465441) (not b!1465432) (not b!1465434) (not b!1465438) (not b!1465424) (not b!1465435) (not b!1465431) (not b!1465433) (not b!1465426) (not b!1465440) (not b!1465443) (not b!1465439) (not start!125338) (not b!1465436))
(check-sat)
