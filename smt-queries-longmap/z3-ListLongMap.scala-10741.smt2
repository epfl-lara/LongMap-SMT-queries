; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125862 () Bool)

(assert start!125862)

(declare-fun b!1471224 () Bool)

(declare-fun res!998616 () Bool)

(declare-fun e!826054 () Bool)

(assert (=> b!1471224 (=> (not res!998616) (not e!826054))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99148 0))(
  ( (array!99149 (arr!47857 (Array (_ BitVec 32) (_ BitVec 64))) (size!48408 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99148)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11994 0))(
  ( (MissingZero!11994 (index!50368 (_ BitVec 32))) (Found!11994 (index!50369 (_ BitVec 32))) (Intermediate!11994 (undefined!12806 Bool) (index!50370 (_ BitVec 32)) (x!132132 (_ BitVec 32))) (Undefined!11994) (MissingVacant!11994 (index!50371 (_ BitVec 32))) )
))
(declare-fun lt!643227 () SeekEntryResult!11994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99148 (_ BitVec 32)) SeekEntryResult!11994)

(assert (=> b!1471224 (= res!998616 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47857 a!2862) j!93) a!2862 mask!2687) lt!643227))))

(declare-fun b!1471226 () Bool)

(declare-fun e!826051 () Bool)

(assert (=> b!1471226 (= e!826051 e!826054)))

(declare-fun res!998618 () Bool)

(assert (=> b!1471226 (=> (not res!998618) (not e!826054))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471226 (= res!998618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47857 a!2862) j!93) mask!2687) (select (arr!47857 a!2862) j!93) a!2862 mask!2687) lt!643227))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471226 (= lt!643227 (Intermediate!11994 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!826056 () Bool)

(declare-fun b!1471227 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471227 (= e!826056 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsgt #b00000000000000000000000000000000 (size!48408 a!2862))))))

(declare-fun b!1471228 () Bool)

(declare-fun res!998609 () Bool)

(declare-fun e!826055 () Bool)

(assert (=> b!1471228 (=> (not res!998609) (not e!826055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471228 (= res!998609 (validKeyInArray!0 (select (arr!47857 a!2862) j!93)))))

(declare-fun b!1471229 () Bool)

(declare-fun res!998612 () Bool)

(assert (=> b!1471229 (=> (not res!998612) (not e!826056))))

(declare-fun e!826053 () Bool)

(assert (=> b!1471229 (= res!998612 e!826053)))

(declare-fun c!135829 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471229 (= c!135829 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471230 () Bool)

(declare-fun res!998611 () Bool)

(assert (=> b!1471230 (=> (not res!998611) (not e!826055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99148 (_ BitVec 32)) Bool)

(assert (=> b!1471230 (= res!998611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471231 () Bool)

(assert (=> b!1471231 (= e!826055 e!826051)))

(declare-fun res!998613 () Bool)

(assert (=> b!1471231 (=> (not res!998613) (not e!826051))))

(assert (=> b!1471231 (= res!998613 (= (select (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643226 () array!99148)

(assert (=> b!1471231 (= lt!643226 (array!99149 (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48408 a!2862)))))

(declare-fun b!1471232 () Bool)

(declare-fun res!998614 () Bool)

(assert (=> b!1471232 (=> (not res!998614) (not e!826055))))

(assert (=> b!1471232 (= res!998614 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48408 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48408 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48408 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471233 () Bool)

(declare-fun lt!643228 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99148 (_ BitVec 32)) SeekEntryResult!11994)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99148 (_ BitVec 32)) SeekEntryResult!11994)

(assert (=> b!1471233 (= e!826053 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643228 lt!643226 mask!2687) (seekEntryOrOpen!0 lt!643228 lt!643226 mask!2687)))))

(declare-fun b!1471234 () Bool)

(declare-fun res!998608 () Bool)

(assert (=> b!1471234 (=> (not res!998608) (not e!826055))))

(declare-datatypes ((List!34345 0))(
  ( (Nil!34342) (Cons!34341 (h!35705 (_ BitVec 64)) (t!49031 List!34345)) )
))
(declare-fun arrayNoDuplicates!0 (array!99148 (_ BitVec 32) List!34345) Bool)

(assert (=> b!1471234 (= res!998608 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34342))))

(declare-fun b!1471235 () Bool)

(declare-fun res!998617 () Bool)

(assert (=> b!1471235 (=> (not res!998617) (not e!826055))))

(assert (=> b!1471235 (= res!998617 (validKeyInArray!0 (select (arr!47857 a!2862) i!1006)))))

(declare-fun lt!643225 () SeekEntryResult!11994)

(declare-fun b!1471236 () Bool)

(assert (=> b!1471236 (= e!826053 (= lt!643225 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643228 lt!643226 mask!2687)))))

(declare-fun b!1471237 () Bool)

(declare-fun res!998610 () Bool)

(assert (=> b!1471237 (=> (not res!998610) (not e!826055))))

(assert (=> b!1471237 (= res!998610 (and (= (size!48408 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48408 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48408 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471225 () Bool)

(assert (=> b!1471225 (= e!826054 e!826056)))

(declare-fun res!998615 () Bool)

(assert (=> b!1471225 (=> (not res!998615) (not e!826056))))

(assert (=> b!1471225 (= res!998615 (= lt!643225 (Intermediate!11994 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471225 (= lt!643225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643228 mask!2687) lt!643228 lt!643226 mask!2687))))

(assert (=> b!1471225 (= lt!643228 (select (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!998607 () Bool)

(assert (=> start!125862 (=> (not res!998607) (not e!826055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125862 (= res!998607 (validMask!0 mask!2687))))

(assert (=> start!125862 e!826055))

(assert (=> start!125862 true))

(declare-fun array_inv!37138 (array!99148) Bool)

(assert (=> start!125862 (array_inv!37138 a!2862)))

(assert (= (and start!125862 res!998607) b!1471237))

(assert (= (and b!1471237 res!998610) b!1471235))

(assert (= (and b!1471235 res!998617) b!1471228))

(assert (= (and b!1471228 res!998609) b!1471230))

(assert (= (and b!1471230 res!998611) b!1471234))

(assert (= (and b!1471234 res!998608) b!1471232))

(assert (= (and b!1471232 res!998614) b!1471231))

(assert (= (and b!1471231 res!998613) b!1471226))

(assert (= (and b!1471226 res!998618) b!1471224))

(assert (= (and b!1471224 res!998616) b!1471225))

(assert (= (and b!1471225 res!998615) b!1471229))

(assert (= (and b!1471229 c!135829) b!1471236))

(assert (= (and b!1471229 (not c!135829)) b!1471233))

(assert (= (and b!1471229 res!998612) b!1471227))

(declare-fun m!1358377 () Bool)

(assert (=> b!1471235 m!1358377))

(assert (=> b!1471235 m!1358377))

(declare-fun m!1358379 () Bool)

(assert (=> b!1471235 m!1358379))

(declare-fun m!1358381 () Bool)

(assert (=> b!1471228 m!1358381))

(assert (=> b!1471228 m!1358381))

(declare-fun m!1358383 () Bool)

(assert (=> b!1471228 m!1358383))

(declare-fun m!1358385 () Bool)

(assert (=> b!1471236 m!1358385))

(declare-fun m!1358387 () Bool)

(assert (=> b!1471233 m!1358387))

(declare-fun m!1358389 () Bool)

(assert (=> b!1471233 m!1358389))

(declare-fun m!1358391 () Bool)

(assert (=> b!1471225 m!1358391))

(assert (=> b!1471225 m!1358391))

(declare-fun m!1358393 () Bool)

(assert (=> b!1471225 m!1358393))

(declare-fun m!1358395 () Bool)

(assert (=> b!1471225 m!1358395))

(declare-fun m!1358397 () Bool)

(assert (=> b!1471225 m!1358397))

(declare-fun m!1358399 () Bool)

(assert (=> b!1471230 m!1358399))

(assert (=> b!1471226 m!1358381))

(assert (=> b!1471226 m!1358381))

(declare-fun m!1358401 () Bool)

(assert (=> b!1471226 m!1358401))

(assert (=> b!1471226 m!1358401))

(assert (=> b!1471226 m!1358381))

(declare-fun m!1358403 () Bool)

(assert (=> b!1471226 m!1358403))

(declare-fun m!1358405 () Bool)

(assert (=> start!125862 m!1358405))

(declare-fun m!1358407 () Bool)

(assert (=> start!125862 m!1358407))

(declare-fun m!1358409 () Bool)

(assert (=> b!1471234 m!1358409))

(assert (=> b!1471231 m!1358395))

(declare-fun m!1358411 () Bool)

(assert (=> b!1471231 m!1358411))

(assert (=> b!1471224 m!1358381))

(assert (=> b!1471224 m!1358381))

(declare-fun m!1358413 () Bool)

(assert (=> b!1471224 m!1358413))

(check-sat (not start!125862) (not b!1471224) (not b!1471236) (not b!1471235) (not b!1471228) (not b!1471230) (not b!1471234) (not b!1471225) (not b!1471226) (not b!1471233))
(check-sat)
