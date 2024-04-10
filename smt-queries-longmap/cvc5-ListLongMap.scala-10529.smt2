; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124144 () Bool)

(assert start!124144)

(declare-fun b!1437138 () Bool)

(declare-fun res!970023 () Bool)

(declare-fun e!810850 () Bool)

(assert (=> b!1437138 (=> (not res!970023) (not e!810850))))

(declare-datatypes ((array!97748 0))(
  ( (array!97749 (arr!47168 (Array (_ BitVec 32) (_ BitVec 64))) (size!47718 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97748)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97748 (_ BitVec 32)) Bool)

(assert (=> b!1437138 (= res!970023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437139 () Bool)

(declare-fun res!970021 () Bool)

(assert (=> b!1437139 (=> (not res!970021) (not e!810850))))

(declare-datatypes ((List!33669 0))(
  ( (Nil!33666) (Cons!33665 (h!35003 (_ BitVec 64)) (t!48363 List!33669)) )
))
(declare-fun arrayNoDuplicates!0 (array!97748 (_ BitVec 32) List!33669) Bool)

(assert (=> b!1437139 (= res!970021 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33666))))

(declare-fun b!1437140 () Bool)

(declare-fun res!970024 () Bool)

(assert (=> b!1437140 (=> (not res!970024) (not e!810850))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437140 (= res!970024 (validKeyInArray!0 (select (arr!47168 a!2862) j!93)))))

(declare-fun b!1437141 () Bool)

(declare-fun res!970022 () Bool)

(assert (=> b!1437141 (=> (not res!970022) (not e!810850))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437141 (= res!970022 (and (= (size!47718 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47718 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47718 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!970027 () Bool)

(assert (=> start!124144 (=> (not res!970027) (not e!810850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124144 (= res!970027 (validMask!0 mask!2687))))

(assert (=> start!124144 e!810850))

(assert (=> start!124144 true))

(declare-fun array_inv!36196 (array!97748) Bool)

(assert (=> start!124144 (array_inv!36196 a!2862)))

(declare-fun b!1437142 () Bool)

(declare-fun res!970026 () Bool)

(assert (=> b!1437142 (=> (not res!970026) (not e!810850))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1437142 (= res!970026 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47718 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47718 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47718 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47168 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437143 () Bool)

(assert (=> b!1437143 (= e!810850 false)))

(declare-datatypes ((SeekEntryResult!11420 0))(
  ( (MissingZero!11420 (index!48072 (_ BitVec 32))) (Found!11420 (index!48073 (_ BitVec 32))) (Intermediate!11420 (undefined!12232 Bool) (index!48074 (_ BitVec 32)) (x!129805 (_ BitVec 32))) (Undefined!11420) (MissingVacant!11420 (index!48075 (_ BitVec 32))) )
))
(declare-fun lt!632241 () SeekEntryResult!11420)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97748 (_ BitVec 32)) SeekEntryResult!11420)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437143 (= lt!632241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47168 a!2862) j!93) mask!2687) (select (arr!47168 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437144 () Bool)

(declare-fun res!970025 () Bool)

(assert (=> b!1437144 (=> (not res!970025) (not e!810850))))

(assert (=> b!1437144 (= res!970025 (validKeyInArray!0 (select (arr!47168 a!2862) i!1006)))))

(assert (= (and start!124144 res!970027) b!1437141))

(assert (= (and b!1437141 res!970022) b!1437144))

(assert (= (and b!1437144 res!970025) b!1437140))

(assert (= (and b!1437140 res!970024) b!1437138))

(assert (= (and b!1437138 res!970023) b!1437139))

(assert (= (and b!1437139 res!970021) b!1437142))

(assert (= (and b!1437142 res!970026) b!1437143))

(declare-fun m!1326457 () Bool)

(assert (=> start!124144 m!1326457))

(declare-fun m!1326459 () Bool)

(assert (=> start!124144 m!1326459))

(declare-fun m!1326461 () Bool)

(assert (=> b!1437143 m!1326461))

(assert (=> b!1437143 m!1326461))

(declare-fun m!1326463 () Bool)

(assert (=> b!1437143 m!1326463))

(assert (=> b!1437143 m!1326463))

(assert (=> b!1437143 m!1326461))

(declare-fun m!1326465 () Bool)

(assert (=> b!1437143 m!1326465))

(assert (=> b!1437140 m!1326461))

(assert (=> b!1437140 m!1326461))

(declare-fun m!1326467 () Bool)

(assert (=> b!1437140 m!1326467))

(declare-fun m!1326469 () Bool)

(assert (=> b!1437138 m!1326469))

(declare-fun m!1326471 () Bool)

(assert (=> b!1437139 m!1326471))

(declare-fun m!1326473 () Bool)

(assert (=> b!1437142 m!1326473))

(declare-fun m!1326475 () Bool)

(assert (=> b!1437142 m!1326475))

(declare-fun m!1326477 () Bool)

(assert (=> b!1437144 m!1326477))

(assert (=> b!1437144 m!1326477))

(declare-fun m!1326479 () Bool)

(assert (=> b!1437144 m!1326479))

(push 1)

(assert (not b!1437143))

(assert (not start!124144))

(assert (not b!1437139))

(assert (not b!1437140))

(assert (not b!1437144))

(assert (not b!1437138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

