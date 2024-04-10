; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124528 () Bool)

(assert start!124528)

(declare-fun b!1441065 () Bool)

(declare-fun e!812398 () Bool)

(declare-fun e!812402 () Bool)

(assert (=> b!1441065 (= e!812398 e!812402)))

(declare-fun res!973478 () Bool)

(assert (=> b!1441065 (=> (not res!973478) (not e!812402))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11528 0))(
  ( (MissingZero!11528 (index!48504 (_ BitVec 32))) (Found!11528 (index!48505 (_ BitVec 32))) (Intermediate!11528 (undefined!12340 Bool) (index!48506 (_ BitVec 32)) (x!130225 (_ BitVec 32))) (Undefined!11528) (MissingVacant!11528 (index!48507 (_ BitVec 32))) )
))
(declare-fun lt!633099 () SeekEntryResult!11528)

(assert (=> b!1441065 (= res!973478 (= lt!633099 (Intermediate!11528 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!97976 0))(
  ( (array!97977 (arr!47276 (Array (_ BitVec 32) (_ BitVec 64))) (size!47826 (_ BitVec 32))) )
))
(declare-fun lt!633095 () array!97976)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633096 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97976 (_ BitVec 32)) SeekEntryResult!11528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441065 (= lt!633099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633096 mask!2687) lt!633096 lt!633095 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!97976)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441065 (= lt!633096 (select (store (arr!47276 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441066 () Bool)

(declare-fun res!973480 () Bool)

(declare-fun e!812399 () Bool)

(assert (=> b!1441066 (=> (not res!973480) (not e!812399))))

(assert (=> b!1441066 (= res!973480 (and (= (size!47826 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47826 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47826 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441067 () Bool)

(declare-fun res!973474 () Bool)

(assert (=> b!1441067 (=> (not res!973474) (not e!812399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441067 (= res!973474 (validKeyInArray!0 (select (arr!47276 a!2862) i!1006)))))

(declare-fun b!1441068 () Bool)

(declare-fun res!973476 () Bool)

(assert (=> b!1441068 (=> (not res!973476) (not e!812398))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!633098 () SeekEntryResult!11528)

(assert (=> b!1441068 (= res!973476 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47276 a!2862) j!93) a!2862 mask!2687) lt!633098))))

(declare-fun b!1441069 () Bool)

(declare-fun res!973473 () Bool)

(assert (=> b!1441069 (=> (not res!973473) (not e!812399))))

(declare-datatypes ((List!33777 0))(
  ( (Nil!33774) (Cons!33773 (h!35123 (_ BitVec 64)) (t!48471 List!33777)) )
))
(declare-fun arrayNoDuplicates!0 (array!97976 (_ BitVec 32) List!33777) Bool)

(assert (=> b!1441069 (= res!973473 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33774))))

(declare-fun b!1441070 () Bool)

(declare-fun res!973470 () Bool)

(assert (=> b!1441070 (=> (not res!973470) (not e!812399))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441070 (= res!973470 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47826 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47826 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47826 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441071 () Bool)

(declare-fun res!973479 () Bool)

(assert (=> b!1441071 (=> (not res!973479) (not e!812399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97976 (_ BitVec 32)) Bool)

(assert (=> b!1441071 (= res!973479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441072 () Bool)

(declare-fun e!812397 () Bool)

(assert (=> b!1441072 (= e!812397 (not (= lt!633099 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633096 lt!633095 mask!2687))))))

(declare-fun res!973472 () Bool)

(assert (=> start!124528 (=> (not res!973472) (not e!812399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124528 (= res!973472 (validMask!0 mask!2687))))

(assert (=> start!124528 e!812399))

(assert (=> start!124528 true))

(declare-fun array_inv!36304 (array!97976) Bool)

(assert (=> start!124528 (array_inv!36304 a!2862)))

(declare-fun b!1441073 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97976 (_ BitVec 32)) SeekEntryResult!11528)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97976 (_ BitVec 32)) SeekEntryResult!11528)

(assert (=> b!1441073 (= e!812397 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633096 lt!633095 mask!2687) (seekEntryOrOpen!0 lt!633096 lt!633095 mask!2687))))))

(declare-fun b!1441074 () Bool)

(declare-fun e!812400 () Bool)

(assert (=> b!1441074 (= e!812400 e!812398)))

(declare-fun res!973475 () Bool)

(assert (=> b!1441074 (=> (not res!973475) (not e!812398))))

(assert (=> b!1441074 (= res!973475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47276 a!2862) j!93) mask!2687) (select (arr!47276 a!2862) j!93) a!2862 mask!2687) lt!633098))))

(assert (=> b!1441074 (= lt!633098 (Intermediate!11528 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441075 () Bool)

(declare-fun res!973477 () Bool)

(assert (=> b!1441075 (=> (not res!973477) (not e!812399))))

(assert (=> b!1441075 (= res!973477 (validKeyInArray!0 (select (arr!47276 a!2862) j!93)))))

(declare-fun b!1441076 () Bool)

(assert (=> b!1441076 (= e!812402 false)))

(declare-fun lt!633097 () Bool)

(assert (=> b!1441076 (= lt!633097 e!812397)))

(declare-fun c!133308 () Bool)

(assert (=> b!1441076 (= c!133308 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441077 () Bool)

(assert (=> b!1441077 (= e!812399 e!812400)))

(declare-fun res!973471 () Bool)

(assert (=> b!1441077 (=> (not res!973471) (not e!812400))))

(assert (=> b!1441077 (= res!973471 (= (select (store (arr!47276 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441077 (= lt!633095 (array!97977 (store (arr!47276 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47826 a!2862)))))

(assert (= (and start!124528 res!973472) b!1441066))

(assert (= (and b!1441066 res!973480) b!1441067))

(assert (= (and b!1441067 res!973474) b!1441075))

(assert (= (and b!1441075 res!973477) b!1441071))

(assert (= (and b!1441071 res!973479) b!1441069))

(assert (= (and b!1441069 res!973473) b!1441070))

(assert (= (and b!1441070 res!973470) b!1441077))

(assert (= (and b!1441077 res!973471) b!1441074))

(assert (= (and b!1441074 res!973475) b!1441068))

(assert (= (and b!1441068 res!973476) b!1441065))

(assert (= (and b!1441065 res!973478) b!1441076))

(assert (= (and b!1441076 c!133308) b!1441072))

(assert (= (and b!1441076 (not c!133308)) b!1441073))

(declare-fun m!1330297 () Bool)

(assert (=> b!1441072 m!1330297))

(declare-fun m!1330299 () Bool)

(assert (=> b!1441065 m!1330299))

(assert (=> b!1441065 m!1330299))

(declare-fun m!1330301 () Bool)

(assert (=> b!1441065 m!1330301))

(declare-fun m!1330303 () Bool)

(assert (=> b!1441065 m!1330303))

(declare-fun m!1330305 () Bool)

(assert (=> b!1441065 m!1330305))

(declare-fun m!1330307 () Bool)

(assert (=> b!1441075 m!1330307))

(assert (=> b!1441075 m!1330307))

(declare-fun m!1330309 () Bool)

(assert (=> b!1441075 m!1330309))

(declare-fun m!1330311 () Bool)

(assert (=> b!1441069 m!1330311))

(declare-fun m!1330313 () Bool)

(assert (=> b!1441073 m!1330313))

(declare-fun m!1330315 () Bool)

(assert (=> b!1441073 m!1330315))

(declare-fun m!1330317 () Bool)

(assert (=> b!1441071 m!1330317))

(declare-fun m!1330319 () Bool)

(assert (=> start!124528 m!1330319))

(declare-fun m!1330321 () Bool)

(assert (=> start!124528 m!1330321))

(declare-fun m!1330323 () Bool)

(assert (=> b!1441067 m!1330323))

(assert (=> b!1441067 m!1330323))

(declare-fun m!1330325 () Bool)

(assert (=> b!1441067 m!1330325))

(assert (=> b!1441068 m!1330307))

(assert (=> b!1441068 m!1330307))

(declare-fun m!1330327 () Bool)

(assert (=> b!1441068 m!1330327))

(assert (=> b!1441077 m!1330303))

(declare-fun m!1330329 () Bool)

(assert (=> b!1441077 m!1330329))

(assert (=> b!1441074 m!1330307))

(assert (=> b!1441074 m!1330307))

(declare-fun m!1330331 () Bool)

(assert (=> b!1441074 m!1330331))

(assert (=> b!1441074 m!1330331))

(assert (=> b!1441074 m!1330307))

(declare-fun m!1330333 () Bool)

(assert (=> b!1441074 m!1330333))

(push 1)

