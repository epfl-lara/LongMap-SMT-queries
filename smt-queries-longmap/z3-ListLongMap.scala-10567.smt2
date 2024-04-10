; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124542 () Bool)

(assert start!124542)

(declare-fun b!1441338 () Bool)

(declare-fun res!973708 () Bool)

(declare-fun e!812528 () Bool)

(assert (=> b!1441338 (=> (not res!973708) (not e!812528))))

(declare-datatypes ((array!97990 0))(
  ( (array!97991 (arr!47283 (Array (_ BitVec 32) (_ BitVec 64))) (size!47833 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97990)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441338 (= res!973708 (validKeyInArray!0 (select (arr!47283 a!2862) j!93)))))

(declare-fun b!1441339 () Bool)

(declare-fun e!812525 () Bool)

(declare-fun e!812526 () Bool)

(assert (=> b!1441339 (= e!812525 e!812526)))

(declare-fun res!973709 () Bool)

(assert (=> b!1441339 (=> (not res!973709) (not e!812526))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11535 0))(
  ( (MissingZero!11535 (index!48532 (_ BitVec 32))) (Found!11535 (index!48533 (_ BitVec 32))) (Intermediate!11535 (undefined!12347 Bool) (index!48534 (_ BitVec 32)) (x!130248 (_ BitVec 32))) (Undefined!11535) (MissingVacant!11535 (index!48535 (_ BitVec 32))) )
))
(declare-fun lt!633202 () SeekEntryResult!11535)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441339 (= res!973709 (= lt!633202 (Intermediate!11535 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633201 () array!97990)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633203 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97990 (_ BitVec 32)) SeekEntryResult!11535)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441339 (= lt!633202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633203 mask!2687) lt!633203 lt!633201 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441339 (= lt!633203 (select (store (arr!47283 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1441340 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!812524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97990 (_ BitVec 32)) SeekEntryResult!11535)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97990 (_ BitVec 32)) SeekEntryResult!11535)

(assert (=> b!1441340 (= e!812524 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633203 lt!633201 mask!2687) (seekEntryOrOpen!0 lt!633203 lt!633201 mask!2687))))))

(declare-fun res!973702 () Bool)

(assert (=> start!124542 (=> (not res!973702) (not e!812528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124542 (= res!973702 (validMask!0 mask!2687))))

(assert (=> start!124542 e!812528))

(assert (=> start!124542 true))

(declare-fun array_inv!36311 (array!97990) Bool)

(assert (=> start!124542 (array_inv!36311 a!2862)))

(declare-fun b!1441341 () Bool)

(declare-fun e!812527 () Bool)

(assert (=> b!1441341 (= e!812527 e!812525)))

(declare-fun res!973711 () Bool)

(assert (=> b!1441341 (=> (not res!973711) (not e!812525))))

(declare-fun lt!633204 () SeekEntryResult!11535)

(assert (=> b!1441341 (= res!973711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47283 a!2862) j!93) mask!2687) (select (arr!47283 a!2862) j!93) a!2862 mask!2687) lt!633204))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441341 (= lt!633204 (Intermediate!11535 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441342 () Bool)

(assert (=> b!1441342 (= e!812524 (not (= lt!633202 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633203 lt!633201 mask!2687))))))

(declare-fun b!1441343 () Bool)

(assert (=> b!1441343 (= e!812526 false)))

(declare-fun lt!633200 () Bool)

(assert (=> b!1441343 (= lt!633200 e!812524)))

(declare-fun c!133329 () Bool)

(assert (=> b!1441343 (= c!133329 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441344 () Bool)

(declare-fun res!973707 () Bool)

(assert (=> b!1441344 (=> (not res!973707) (not e!812528))))

(assert (=> b!1441344 (= res!973707 (validKeyInArray!0 (select (arr!47283 a!2862) i!1006)))))

(declare-fun b!1441345 () Bool)

(declare-fun res!973710 () Bool)

(assert (=> b!1441345 (=> (not res!973710) (not e!812528))))

(assert (=> b!1441345 (= res!973710 (and (= (size!47833 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47833 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47833 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441346 () Bool)

(declare-fun res!973704 () Bool)

(assert (=> b!1441346 (=> (not res!973704) (not e!812528))))

(assert (=> b!1441346 (= res!973704 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47833 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47833 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47833 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441347 () Bool)

(declare-fun res!973703 () Bool)

(assert (=> b!1441347 (=> (not res!973703) (not e!812528))))

(declare-datatypes ((List!33784 0))(
  ( (Nil!33781) (Cons!33780 (h!35130 (_ BitVec 64)) (t!48478 List!33784)) )
))
(declare-fun arrayNoDuplicates!0 (array!97990 (_ BitVec 32) List!33784) Bool)

(assert (=> b!1441347 (= res!973703 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33781))))

(declare-fun b!1441348 () Bool)

(assert (=> b!1441348 (= e!812528 e!812527)))

(declare-fun res!973701 () Bool)

(assert (=> b!1441348 (=> (not res!973701) (not e!812527))))

(assert (=> b!1441348 (= res!973701 (= (select (store (arr!47283 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441348 (= lt!633201 (array!97991 (store (arr!47283 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47833 a!2862)))))

(declare-fun b!1441349 () Bool)

(declare-fun res!973705 () Bool)

(assert (=> b!1441349 (=> (not res!973705) (not e!812528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97990 (_ BitVec 32)) Bool)

(assert (=> b!1441349 (= res!973705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441350 () Bool)

(declare-fun res!973706 () Bool)

(assert (=> b!1441350 (=> (not res!973706) (not e!812525))))

(assert (=> b!1441350 (= res!973706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47283 a!2862) j!93) a!2862 mask!2687) lt!633204))))

(assert (= (and start!124542 res!973702) b!1441345))

(assert (= (and b!1441345 res!973710) b!1441344))

(assert (= (and b!1441344 res!973707) b!1441338))

(assert (= (and b!1441338 res!973708) b!1441349))

(assert (= (and b!1441349 res!973705) b!1441347))

(assert (= (and b!1441347 res!973703) b!1441346))

(assert (= (and b!1441346 res!973704) b!1441348))

(assert (= (and b!1441348 res!973701) b!1441341))

(assert (= (and b!1441341 res!973711) b!1441350))

(assert (= (and b!1441350 res!973706) b!1441339))

(assert (= (and b!1441339 res!973709) b!1441343))

(assert (= (and b!1441343 c!133329) b!1441342))

(assert (= (and b!1441343 (not c!133329)) b!1441340))

(declare-fun m!1330563 () Bool)

(assert (=> b!1441350 m!1330563))

(assert (=> b!1441350 m!1330563))

(declare-fun m!1330565 () Bool)

(assert (=> b!1441350 m!1330565))

(declare-fun m!1330567 () Bool)

(assert (=> b!1441347 m!1330567))

(assert (=> b!1441341 m!1330563))

(assert (=> b!1441341 m!1330563))

(declare-fun m!1330569 () Bool)

(assert (=> b!1441341 m!1330569))

(assert (=> b!1441341 m!1330569))

(assert (=> b!1441341 m!1330563))

(declare-fun m!1330571 () Bool)

(assert (=> b!1441341 m!1330571))

(declare-fun m!1330573 () Bool)

(assert (=> start!124542 m!1330573))

(declare-fun m!1330575 () Bool)

(assert (=> start!124542 m!1330575))

(declare-fun m!1330577 () Bool)

(assert (=> b!1441349 m!1330577))

(declare-fun m!1330579 () Bool)

(assert (=> b!1441340 m!1330579))

(declare-fun m!1330581 () Bool)

(assert (=> b!1441340 m!1330581))

(assert (=> b!1441338 m!1330563))

(assert (=> b!1441338 m!1330563))

(declare-fun m!1330583 () Bool)

(assert (=> b!1441338 m!1330583))

(declare-fun m!1330585 () Bool)

(assert (=> b!1441339 m!1330585))

(assert (=> b!1441339 m!1330585))

(declare-fun m!1330587 () Bool)

(assert (=> b!1441339 m!1330587))

(declare-fun m!1330589 () Bool)

(assert (=> b!1441339 m!1330589))

(declare-fun m!1330591 () Bool)

(assert (=> b!1441339 m!1330591))

(assert (=> b!1441348 m!1330589))

(declare-fun m!1330593 () Bool)

(assert (=> b!1441348 m!1330593))

(declare-fun m!1330595 () Bool)

(assert (=> b!1441344 m!1330595))

(assert (=> b!1441344 m!1330595))

(declare-fun m!1330597 () Bool)

(assert (=> b!1441344 m!1330597))

(declare-fun m!1330599 () Bool)

(assert (=> b!1441342 m!1330599))

(check-sat (not b!1441349) (not b!1441347) (not b!1441350) (not b!1441339) (not b!1441342) (not b!1441338) (not b!1441341) (not start!124542) (not b!1441344) (not b!1441340))
(check-sat)
