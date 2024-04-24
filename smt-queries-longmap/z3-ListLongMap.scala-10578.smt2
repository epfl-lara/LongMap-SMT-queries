; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124824 () Bool)

(assert start!124824)

(declare-fun b!1444173 () Bool)

(declare-fun e!813985 () Bool)

(declare-fun e!813990 () Bool)

(assert (=> b!1444173 (= e!813985 e!813990)))

(declare-fun res!975525 () Bool)

(assert (=> b!1444173 (=> (not res!975525) (not e!813990))))

(declare-datatypes ((SeekEntryResult!11517 0))(
  ( (MissingZero!11517 (index!48460 (_ BitVec 32))) (Found!11517 (index!48461 (_ BitVec 32))) (Intermediate!11517 (undefined!12329 Bool) (index!48462 (_ BitVec 32)) (x!130342 (_ BitVec 32))) (Undefined!11517) (MissingVacant!11517 (index!48463 (_ BitVec 32))) )
))
(declare-fun lt!634161 () SeekEntryResult!11517)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444173 (= res!975525 (= lt!634161 (Intermediate!11517 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98167 0))(
  ( (array!98168 (arr!47368 (Array (_ BitVec 32) (_ BitVec 64))) (size!47919 (_ BitVec 32))) )
))
(declare-fun lt!634158 () array!98167)

(declare-fun lt!634160 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98167 (_ BitVec 32)) SeekEntryResult!11517)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444173 (= lt!634161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634160 mask!2687) lt!634160 lt!634158 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98167)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444173 (= lt!634160 (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444175 () Bool)

(declare-fun res!975521 () Bool)

(declare-fun e!813988 () Bool)

(assert (=> b!1444175 (=> (not res!975521) (not e!813988))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98167 (_ BitVec 32)) SeekEntryResult!11517)

(assert (=> b!1444175 (= res!975521 (= (seekEntryOrOpen!0 (select (arr!47368 a!2862) j!93) a!2862 mask!2687) (Found!11517 j!93)))))

(declare-fun b!1444176 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444176 (= e!813988 (or (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) (select (arr!47368 a!2862) j!93))))))

(declare-fun b!1444177 () Bool)

(declare-fun res!975523 () Bool)

(declare-fun e!813989 () Bool)

(assert (=> b!1444177 (=> (not res!975523) (not e!813989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98167 (_ BitVec 32)) Bool)

(assert (=> b!1444177 (= res!975523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444178 () Bool)

(declare-fun res!975529 () Bool)

(assert (=> b!1444178 (=> (not res!975529) (not e!813989))))

(assert (=> b!1444178 (= res!975529 (and (= (size!47919 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47919 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47919 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1444179 () Bool)

(declare-fun e!813987 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1444179 (= e!813987 (= lt!634161 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634160 lt!634158 mask!2687)))))

(declare-fun b!1444180 () Bool)

(assert (=> b!1444180 (= e!813990 (not (or (not (= (select (arr!47368 a!2862) index!646) (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47368 a!2862) index!646) (select (arr!47368 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1444180 e!813988))

(declare-fun res!975533 () Bool)

(assert (=> b!1444180 (=> (not res!975533) (not e!813988))))

(assert (=> b!1444180 (= res!975533 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48563 0))(
  ( (Unit!48564) )
))
(declare-fun lt!634162 () Unit!48563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48563)

(assert (=> b!1444180 (= lt!634162 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444181 () Bool)

(declare-fun res!975531 () Bool)

(assert (=> b!1444181 (=> (not res!975531) (not e!813989))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444181 (= res!975531 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47919 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47919 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47919 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444182 () Bool)

(declare-fun res!975530 () Bool)

(assert (=> b!1444182 (=> (not res!975530) (not e!813990))))

(assert (=> b!1444182 (= res!975530 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444183 () Bool)

(declare-fun res!975524 () Bool)

(assert (=> b!1444183 (=> (not res!975524) (not e!813989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444183 (= res!975524 (validKeyInArray!0 (select (arr!47368 a!2862) i!1006)))))

(declare-fun b!1444184 () Bool)

(declare-fun e!813986 () Bool)

(assert (=> b!1444184 (= e!813989 e!813986)))

(declare-fun res!975520 () Bool)

(assert (=> b!1444184 (=> (not res!975520) (not e!813986))))

(assert (=> b!1444184 (= res!975520 (= (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444184 (= lt!634158 (array!98168 (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47919 a!2862)))))

(declare-fun b!1444185 () Bool)

(declare-fun res!975522 () Bool)

(assert (=> b!1444185 (=> (not res!975522) (not e!813985))))

(declare-fun lt!634159 () SeekEntryResult!11517)

(assert (=> b!1444185 (= res!975522 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47368 a!2862) j!93) a!2862 mask!2687) lt!634159))))

(declare-fun b!1444186 () Bool)

(declare-fun res!975526 () Bool)

(assert (=> b!1444186 (=> (not res!975526) (not e!813990))))

(assert (=> b!1444186 (= res!975526 e!813987)))

(declare-fun c!133846 () Bool)

(assert (=> b!1444186 (= c!133846 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444187 () Bool)

(declare-fun res!975527 () Bool)

(assert (=> b!1444187 (=> (not res!975527) (not e!813989))))

(assert (=> b!1444187 (= res!975527 (validKeyInArray!0 (select (arr!47368 a!2862) j!93)))))

(declare-fun b!1444174 () Bool)

(declare-fun res!975519 () Bool)

(assert (=> b!1444174 (=> (not res!975519) (not e!813989))))

(declare-datatypes ((List!33856 0))(
  ( (Nil!33853) (Cons!33852 (h!35213 (_ BitVec 64)) (t!48542 List!33856)) )
))
(declare-fun arrayNoDuplicates!0 (array!98167 (_ BitVec 32) List!33856) Bool)

(assert (=> b!1444174 (= res!975519 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33853))))

(declare-fun res!975532 () Bool)

(assert (=> start!124824 (=> (not res!975532) (not e!813989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124824 (= res!975532 (validMask!0 mask!2687))))

(assert (=> start!124824 e!813989))

(assert (=> start!124824 true))

(declare-fun array_inv!36649 (array!98167) Bool)

(assert (=> start!124824 (array_inv!36649 a!2862)))

(declare-fun b!1444188 () Bool)

(assert (=> b!1444188 (= e!813986 e!813985)))

(declare-fun res!975528 () Bool)

(assert (=> b!1444188 (=> (not res!975528) (not e!813985))))

(assert (=> b!1444188 (= res!975528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47368 a!2862) j!93) mask!2687) (select (arr!47368 a!2862) j!93) a!2862 mask!2687) lt!634159))))

(assert (=> b!1444188 (= lt!634159 (Intermediate!11517 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444189 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98167 (_ BitVec 32)) SeekEntryResult!11517)

(assert (=> b!1444189 (= e!813987 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634160 lt!634158 mask!2687) (seekEntryOrOpen!0 lt!634160 lt!634158 mask!2687)))))

(assert (= (and start!124824 res!975532) b!1444178))

(assert (= (and b!1444178 res!975529) b!1444183))

(assert (= (and b!1444183 res!975524) b!1444187))

(assert (= (and b!1444187 res!975527) b!1444177))

(assert (= (and b!1444177 res!975523) b!1444174))

(assert (= (and b!1444174 res!975519) b!1444181))

(assert (= (and b!1444181 res!975531) b!1444184))

(assert (= (and b!1444184 res!975520) b!1444188))

(assert (= (and b!1444188 res!975528) b!1444185))

(assert (= (and b!1444185 res!975522) b!1444173))

(assert (= (and b!1444173 res!975525) b!1444186))

(assert (= (and b!1444186 c!133846) b!1444179))

(assert (= (and b!1444186 (not c!133846)) b!1444189))

(assert (= (and b!1444186 res!975526) b!1444182))

(assert (= (and b!1444182 res!975530) b!1444180))

(assert (= (and b!1444180 res!975533) b!1444175))

(assert (= (and b!1444175 res!975521) b!1444176))

(declare-fun m!1333399 () Bool)

(assert (=> b!1444183 m!1333399))

(assert (=> b!1444183 m!1333399))

(declare-fun m!1333401 () Bool)

(assert (=> b!1444183 m!1333401))

(declare-fun m!1333403 () Bool)

(assert (=> b!1444175 m!1333403))

(assert (=> b!1444175 m!1333403))

(declare-fun m!1333405 () Bool)

(assert (=> b!1444175 m!1333405))

(assert (=> b!1444187 m!1333403))

(assert (=> b!1444187 m!1333403))

(declare-fun m!1333407 () Bool)

(assert (=> b!1444187 m!1333407))

(assert (=> b!1444185 m!1333403))

(assert (=> b!1444185 m!1333403))

(declare-fun m!1333409 () Bool)

(assert (=> b!1444185 m!1333409))

(declare-fun m!1333411 () Bool)

(assert (=> b!1444189 m!1333411))

(declare-fun m!1333413 () Bool)

(assert (=> b!1444189 m!1333413))

(declare-fun m!1333415 () Bool)

(assert (=> b!1444174 m!1333415))

(declare-fun m!1333417 () Bool)

(assert (=> b!1444177 m!1333417))

(declare-fun m!1333419 () Bool)

(assert (=> b!1444176 m!1333419))

(assert (=> b!1444176 m!1333403))

(declare-fun m!1333421 () Bool)

(assert (=> b!1444173 m!1333421))

(assert (=> b!1444173 m!1333421))

(declare-fun m!1333423 () Bool)

(assert (=> b!1444173 m!1333423))

(declare-fun m!1333425 () Bool)

(assert (=> b!1444173 m!1333425))

(declare-fun m!1333427 () Bool)

(assert (=> b!1444173 m!1333427))

(assert (=> b!1444184 m!1333425))

(declare-fun m!1333429 () Bool)

(assert (=> b!1444184 m!1333429))

(declare-fun m!1333431 () Bool)

(assert (=> b!1444179 m!1333431))

(assert (=> b!1444188 m!1333403))

(assert (=> b!1444188 m!1333403))

(declare-fun m!1333433 () Bool)

(assert (=> b!1444188 m!1333433))

(assert (=> b!1444188 m!1333433))

(assert (=> b!1444188 m!1333403))

(declare-fun m!1333435 () Bool)

(assert (=> b!1444188 m!1333435))

(declare-fun m!1333437 () Bool)

(assert (=> start!124824 m!1333437))

(declare-fun m!1333439 () Bool)

(assert (=> start!124824 m!1333439))

(declare-fun m!1333441 () Bool)

(assert (=> b!1444180 m!1333441))

(assert (=> b!1444180 m!1333425))

(declare-fun m!1333443 () Bool)

(assert (=> b!1444180 m!1333443))

(declare-fun m!1333445 () Bool)

(assert (=> b!1444180 m!1333445))

(declare-fun m!1333447 () Bool)

(assert (=> b!1444180 m!1333447))

(assert (=> b!1444180 m!1333403))

(check-sat (not b!1444185) (not b!1444177) (not b!1444189) (not b!1444175) (not b!1444173) (not b!1444188) (not start!124824) (not b!1444179) (not b!1444183) (not b!1444187) (not b!1444180) (not b!1444174))
(check-sat)
