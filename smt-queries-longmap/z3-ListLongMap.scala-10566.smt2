; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124536 () Bool)

(assert start!124536)

(declare-fun b!1441221 () Bool)

(declare-fun e!812474 () Bool)

(declare-fun e!812473 () Bool)

(assert (=> b!1441221 (= e!812474 e!812473)))

(declare-fun res!973602 () Bool)

(assert (=> b!1441221 (=> (not res!973602) (not e!812473))))

(declare-datatypes ((SeekEntryResult!11532 0))(
  ( (MissingZero!11532 (index!48520 (_ BitVec 32))) (Found!11532 (index!48521 (_ BitVec 32))) (Intermediate!11532 (undefined!12344 Bool) (index!48522 (_ BitVec 32)) (x!130237 (_ BitVec 32))) (Undefined!11532) (MissingVacant!11532 (index!48523 (_ BitVec 32))) )
))
(declare-fun lt!633159 () SeekEntryResult!11532)

(declare-datatypes ((array!97984 0))(
  ( (array!97985 (arr!47280 (Array (_ BitVec 32) (_ BitVec 64))) (size!47830 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97984)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97984 (_ BitVec 32)) SeekEntryResult!11532)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441221 (= res!973602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47280 a!2862) j!93) mask!2687) (select (arr!47280 a!2862) j!93) a!2862 mask!2687) lt!633159))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441221 (= lt!633159 (Intermediate!11532 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441222 () Bool)

(declare-fun res!973605 () Bool)

(assert (=> b!1441222 (=> (not res!973605) (not e!812473))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441222 (= res!973605 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47280 a!2862) j!93) a!2862 mask!2687) lt!633159))))

(declare-fun b!1441223 () Bool)

(declare-fun res!973610 () Bool)

(declare-fun e!812472 () Bool)

(assert (=> b!1441223 (=> (not res!973610) (not e!812472))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441223 (= res!973610 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47830 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47830 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47830 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!633155 () array!97984)

(declare-fun e!812469 () Bool)

(declare-fun lt!633158 () (_ BitVec 64))

(declare-fun b!1441224 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97984 (_ BitVec 32)) SeekEntryResult!11532)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97984 (_ BitVec 32)) SeekEntryResult!11532)

(assert (=> b!1441224 (= e!812469 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633158 lt!633155 mask!2687) (seekEntryOrOpen!0 lt!633158 lt!633155 mask!2687))))))

(declare-fun b!1441225 () Bool)

(declare-fun e!812470 () Bool)

(assert (=> b!1441225 (= e!812473 e!812470)))

(declare-fun res!973604 () Bool)

(assert (=> b!1441225 (=> (not res!973604) (not e!812470))))

(declare-fun lt!633156 () SeekEntryResult!11532)

(assert (=> b!1441225 (= res!973604 (= lt!633156 (Intermediate!11532 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441225 (= lt!633156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633158 mask!2687) lt!633158 lt!633155 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441225 (= lt!633158 (select (store (arr!47280 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441226 () Bool)

(assert (=> b!1441226 (= e!812470 false)))

(declare-fun lt!633157 () Bool)

(assert (=> b!1441226 (= lt!633157 e!812469)))

(declare-fun c!133320 () Bool)

(assert (=> b!1441226 (= c!133320 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441228 () Bool)

(declare-fun res!973603 () Bool)

(assert (=> b!1441228 (=> (not res!973603) (not e!812472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441228 (= res!973603 (validKeyInArray!0 (select (arr!47280 a!2862) i!1006)))))

(declare-fun b!1441229 () Bool)

(declare-fun res!973607 () Bool)

(assert (=> b!1441229 (=> (not res!973607) (not e!812472))))

(assert (=> b!1441229 (= res!973607 (validKeyInArray!0 (select (arr!47280 a!2862) j!93)))))

(declare-fun b!1441230 () Bool)

(assert (=> b!1441230 (= e!812472 e!812474)))

(declare-fun res!973608 () Bool)

(assert (=> b!1441230 (=> (not res!973608) (not e!812474))))

(assert (=> b!1441230 (= res!973608 (= (select (store (arr!47280 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441230 (= lt!633155 (array!97985 (store (arr!47280 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47830 a!2862)))))

(declare-fun b!1441231 () Bool)

(declare-fun res!973606 () Bool)

(assert (=> b!1441231 (=> (not res!973606) (not e!812472))))

(assert (=> b!1441231 (= res!973606 (and (= (size!47830 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47830 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47830 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441232 () Bool)

(assert (=> b!1441232 (= e!812469 (not (= lt!633156 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633158 lt!633155 mask!2687))))))

(declare-fun b!1441233 () Bool)

(declare-fun res!973612 () Bool)

(assert (=> b!1441233 (=> (not res!973612) (not e!812472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97984 (_ BitVec 32)) Bool)

(assert (=> b!1441233 (= res!973612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441227 () Bool)

(declare-fun res!973611 () Bool)

(assert (=> b!1441227 (=> (not res!973611) (not e!812472))))

(declare-datatypes ((List!33781 0))(
  ( (Nil!33778) (Cons!33777 (h!35127 (_ BitVec 64)) (t!48475 List!33781)) )
))
(declare-fun arrayNoDuplicates!0 (array!97984 (_ BitVec 32) List!33781) Bool)

(assert (=> b!1441227 (= res!973611 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33778))))

(declare-fun res!973609 () Bool)

(assert (=> start!124536 (=> (not res!973609) (not e!812472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124536 (= res!973609 (validMask!0 mask!2687))))

(assert (=> start!124536 e!812472))

(assert (=> start!124536 true))

(declare-fun array_inv!36308 (array!97984) Bool)

(assert (=> start!124536 (array_inv!36308 a!2862)))

(assert (= (and start!124536 res!973609) b!1441231))

(assert (= (and b!1441231 res!973606) b!1441228))

(assert (= (and b!1441228 res!973603) b!1441229))

(assert (= (and b!1441229 res!973607) b!1441233))

(assert (= (and b!1441233 res!973612) b!1441227))

(assert (= (and b!1441227 res!973611) b!1441223))

(assert (= (and b!1441223 res!973610) b!1441230))

(assert (= (and b!1441230 res!973608) b!1441221))

(assert (= (and b!1441221 res!973602) b!1441222))

(assert (= (and b!1441222 res!973605) b!1441225))

(assert (= (and b!1441225 res!973604) b!1441226))

(assert (= (and b!1441226 c!133320) b!1441232))

(assert (= (and b!1441226 (not c!133320)) b!1441224))

(declare-fun m!1330449 () Bool)

(assert (=> b!1441229 m!1330449))

(assert (=> b!1441229 m!1330449))

(declare-fun m!1330451 () Bool)

(assert (=> b!1441229 m!1330451))

(declare-fun m!1330453 () Bool)

(assert (=> b!1441230 m!1330453))

(declare-fun m!1330455 () Bool)

(assert (=> b!1441230 m!1330455))

(declare-fun m!1330457 () Bool)

(assert (=> b!1441224 m!1330457))

(declare-fun m!1330459 () Bool)

(assert (=> b!1441224 m!1330459))

(declare-fun m!1330461 () Bool)

(assert (=> b!1441225 m!1330461))

(assert (=> b!1441225 m!1330461))

(declare-fun m!1330463 () Bool)

(assert (=> b!1441225 m!1330463))

(assert (=> b!1441225 m!1330453))

(declare-fun m!1330465 () Bool)

(assert (=> b!1441225 m!1330465))

(declare-fun m!1330467 () Bool)

(assert (=> b!1441233 m!1330467))

(declare-fun m!1330469 () Bool)

(assert (=> b!1441228 m!1330469))

(assert (=> b!1441228 m!1330469))

(declare-fun m!1330471 () Bool)

(assert (=> b!1441228 m!1330471))

(assert (=> b!1441221 m!1330449))

(assert (=> b!1441221 m!1330449))

(declare-fun m!1330473 () Bool)

(assert (=> b!1441221 m!1330473))

(assert (=> b!1441221 m!1330473))

(assert (=> b!1441221 m!1330449))

(declare-fun m!1330475 () Bool)

(assert (=> b!1441221 m!1330475))

(declare-fun m!1330477 () Bool)

(assert (=> start!124536 m!1330477))

(declare-fun m!1330479 () Bool)

(assert (=> start!124536 m!1330479))

(assert (=> b!1441222 m!1330449))

(assert (=> b!1441222 m!1330449))

(declare-fun m!1330481 () Bool)

(assert (=> b!1441222 m!1330481))

(declare-fun m!1330483 () Bool)

(assert (=> b!1441227 m!1330483))

(declare-fun m!1330485 () Bool)

(assert (=> b!1441232 m!1330485))

(check-sat (not b!1441232) (not b!1441228) (not b!1441222) (not b!1441229) (not b!1441221) (not b!1441233) (not b!1441225) (not b!1441224) (not b!1441227) (not start!124536))
(check-sat)
