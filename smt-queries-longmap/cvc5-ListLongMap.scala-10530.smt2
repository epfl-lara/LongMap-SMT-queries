; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124150 () Bool)

(assert start!124150)

(declare-fun b!1437205 () Bool)

(declare-fun res!970090 () Bool)

(declare-fun e!810872 () Bool)

(assert (=> b!1437205 (=> (not res!970090) (not e!810872))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97754 0))(
  ( (array!97755 (arr!47171 (Array (_ BitVec 32) (_ BitVec 64))) (size!47721 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97754)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11423 0))(
  ( (MissingZero!11423 (index!48084 (_ BitVec 32))) (Found!11423 (index!48085 (_ BitVec 32))) (Intermediate!11423 (undefined!12235 Bool) (index!48086 (_ BitVec 32)) (x!129816 (_ BitVec 32))) (Undefined!11423) (MissingVacant!11423 (index!48087 (_ BitVec 32))) )
))
(declare-fun lt!632250 () SeekEntryResult!11423)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97754 (_ BitVec 32)) SeekEntryResult!11423)

(assert (=> b!1437205 (= res!970090 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47171 a!2862) j!93) a!2862 mask!2687) lt!632250))))

(declare-fun b!1437206 () Bool)

(declare-fun res!970089 () Bool)

(declare-fun e!810870 () Bool)

(assert (=> b!1437206 (=> (not res!970089) (not e!810870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97754 (_ BitVec 32)) Bool)

(assert (=> b!1437206 (= res!970089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437207 () Bool)

(assert (=> b!1437207 (= e!810872 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1437208 () Bool)

(declare-fun res!970096 () Bool)

(assert (=> b!1437208 (=> (not res!970096) (not e!810870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437208 (= res!970096 (validKeyInArray!0 (select (arr!47171 a!2862) j!93)))))

(declare-fun b!1437209 () Bool)

(declare-fun res!970088 () Bool)

(assert (=> b!1437209 (=> (not res!970088) (not e!810870))))

(declare-datatypes ((List!33672 0))(
  ( (Nil!33669) (Cons!33668 (h!35006 (_ BitVec 64)) (t!48366 List!33672)) )
))
(declare-fun arrayNoDuplicates!0 (array!97754 (_ BitVec 32) List!33672) Bool)

(assert (=> b!1437209 (= res!970088 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33669))))

(declare-fun b!1437210 () Bool)

(assert (=> b!1437210 (= e!810870 e!810872)))

(declare-fun res!970091 () Bool)

(assert (=> b!1437210 (=> (not res!970091) (not e!810872))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437210 (= res!970091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47171 a!2862) j!93) mask!2687) (select (arr!47171 a!2862) j!93) a!2862 mask!2687) lt!632250))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437210 (= lt!632250 (Intermediate!11423 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!970094 () Bool)

(assert (=> start!124150 (=> (not res!970094) (not e!810870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124150 (= res!970094 (validMask!0 mask!2687))))

(assert (=> start!124150 e!810870))

(assert (=> start!124150 true))

(declare-fun array_inv!36199 (array!97754) Bool)

(assert (=> start!124150 (array_inv!36199 a!2862)))

(declare-fun b!1437211 () Bool)

(declare-fun res!970093 () Bool)

(assert (=> b!1437211 (=> (not res!970093) (not e!810870))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437211 (= res!970093 (and (= (size!47721 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47721 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47721 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437212 () Bool)

(declare-fun res!970095 () Bool)

(assert (=> b!1437212 (=> (not res!970095) (not e!810870))))

(assert (=> b!1437212 (= res!970095 (validKeyInArray!0 (select (arr!47171 a!2862) i!1006)))))

(declare-fun b!1437213 () Bool)

(declare-fun res!970092 () Bool)

(assert (=> b!1437213 (=> (not res!970092) (not e!810870))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437213 (= res!970092 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47721 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47721 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47721 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47171 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124150 res!970094) b!1437211))

(assert (= (and b!1437211 res!970093) b!1437212))

(assert (= (and b!1437212 res!970095) b!1437208))

(assert (= (and b!1437208 res!970096) b!1437206))

(assert (= (and b!1437206 res!970089) b!1437209))

(assert (= (and b!1437209 res!970088) b!1437213))

(assert (= (and b!1437213 res!970092) b!1437210))

(assert (= (and b!1437210 res!970091) b!1437205))

(assert (= (and b!1437205 res!970090) b!1437207))

(declare-fun m!1326529 () Bool)

(assert (=> b!1437213 m!1326529))

(declare-fun m!1326531 () Bool)

(assert (=> b!1437213 m!1326531))

(declare-fun m!1326533 () Bool)

(assert (=> b!1437210 m!1326533))

(assert (=> b!1437210 m!1326533))

(declare-fun m!1326535 () Bool)

(assert (=> b!1437210 m!1326535))

(assert (=> b!1437210 m!1326535))

(assert (=> b!1437210 m!1326533))

(declare-fun m!1326537 () Bool)

(assert (=> b!1437210 m!1326537))

(declare-fun m!1326539 () Bool)

(assert (=> b!1437212 m!1326539))

(assert (=> b!1437212 m!1326539))

(declare-fun m!1326541 () Bool)

(assert (=> b!1437212 m!1326541))

(assert (=> b!1437208 m!1326533))

(assert (=> b!1437208 m!1326533))

(declare-fun m!1326543 () Bool)

(assert (=> b!1437208 m!1326543))

(assert (=> b!1437205 m!1326533))

(assert (=> b!1437205 m!1326533))

(declare-fun m!1326545 () Bool)

(assert (=> b!1437205 m!1326545))

(declare-fun m!1326547 () Bool)

(assert (=> start!124150 m!1326547))

(declare-fun m!1326549 () Bool)

(assert (=> start!124150 m!1326549))

(declare-fun m!1326551 () Bool)

(assert (=> b!1437206 m!1326551))

(declare-fun m!1326553 () Bool)

(assert (=> b!1437209 m!1326553))

(push 1)

(assert (not b!1437210))

(assert (not b!1437212))

