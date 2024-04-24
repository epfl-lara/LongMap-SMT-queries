; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124322 () Bool)

(assert start!124322)

(declare-fun b!1438027 () Bool)

(declare-fun res!970091 () Bool)

(declare-fun e!811569 () Bool)

(assert (=> b!1438027 (=> (not res!970091) (not e!811569))))

(declare-datatypes ((array!97821 0))(
  ( (array!97822 (arr!47201 (Array (_ BitVec 32) (_ BitVec 64))) (size!47752 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97821)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438027 (= res!970091 (validKeyInArray!0 (select (arr!47201 a!2862) j!93)))))

(declare-fun b!1438028 () Bool)

(declare-fun res!970085 () Bool)

(assert (=> b!1438028 (=> (not res!970085) (not e!811569))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97821 (_ BitVec 32)) Bool)

(assert (=> b!1438028 (= res!970085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438029 () Bool)

(assert (=> b!1438029 (= e!811569 false)))

(declare-fun lt!632677 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438029 (= lt!632677 (toIndex!0 (select (arr!47201 a!2862) j!93) mask!2687))))

(declare-fun b!1438030 () Bool)

(declare-fun res!970088 () Bool)

(assert (=> b!1438030 (=> (not res!970088) (not e!811569))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438030 (= res!970088 (validKeyInArray!0 (select (arr!47201 a!2862) i!1006)))))

(declare-fun res!970087 () Bool)

(assert (=> start!124322 (=> (not res!970087) (not e!811569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124322 (= res!970087 (validMask!0 mask!2687))))

(assert (=> start!124322 e!811569))

(assert (=> start!124322 true))

(declare-fun array_inv!36482 (array!97821) Bool)

(assert (=> start!124322 (array_inv!36482 a!2862)))

(declare-fun b!1438031 () Bool)

(declare-fun res!970090 () Bool)

(assert (=> b!1438031 (=> (not res!970090) (not e!811569))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438031 (= res!970090 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47752 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47752 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47752 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47201 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438032 () Bool)

(declare-fun res!970089 () Bool)

(assert (=> b!1438032 (=> (not res!970089) (not e!811569))))

(declare-datatypes ((List!33689 0))(
  ( (Nil!33686) (Cons!33685 (h!35034 (_ BitVec 64)) (t!48375 List!33689)) )
))
(declare-fun arrayNoDuplicates!0 (array!97821 (_ BitVec 32) List!33689) Bool)

(assert (=> b!1438032 (= res!970089 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33686))))

(declare-fun b!1438033 () Bool)

(declare-fun res!970086 () Bool)

(assert (=> b!1438033 (=> (not res!970086) (not e!811569))))

(assert (=> b!1438033 (= res!970086 (and (= (size!47752 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47752 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47752 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124322 res!970087) b!1438033))

(assert (= (and b!1438033 res!970086) b!1438030))

(assert (= (and b!1438030 res!970088) b!1438027))

(assert (= (and b!1438027 res!970091) b!1438028))

(assert (= (and b!1438028 res!970085) b!1438032))

(assert (= (and b!1438032 res!970089) b!1438031))

(assert (= (and b!1438031 res!970090) b!1438029))

(declare-fun m!1327427 () Bool)

(assert (=> b!1438028 m!1327427))

(declare-fun m!1327429 () Bool)

(assert (=> b!1438029 m!1327429))

(assert (=> b!1438029 m!1327429))

(declare-fun m!1327431 () Bool)

(assert (=> b!1438029 m!1327431))

(declare-fun m!1327433 () Bool)

(assert (=> start!124322 m!1327433))

(declare-fun m!1327435 () Bool)

(assert (=> start!124322 m!1327435))

(declare-fun m!1327437 () Bool)

(assert (=> b!1438030 m!1327437))

(assert (=> b!1438030 m!1327437))

(declare-fun m!1327439 () Bool)

(assert (=> b!1438030 m!1327439))

(assert (=> b!1438027 m!1327429))

(assert (=> b!1438027 m!1327429))

(declare-fun m!1327441 () Bool)

(assert (=> b!1438027 m!1327441))

(declare-fun m!1327443 () Bool)

(assert (=> b!1438031 m!1327443))

(declare-fun m!1327445 () Bool)

(assert (=> b!1438031 m!1327445))

(declare-fun m!1327447 () Bool)

(assert (=> b!1438032 m!1327447))

(push 1)

(assert (not start!124322))

(assert (not b!1438027))

(assert (not b!1438030))

(assert (not b!1438028))

(assert (not b!1438032))

(assert (not b!1438029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

