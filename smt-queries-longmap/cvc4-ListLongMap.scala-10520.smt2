; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124274 () Bool)

(assert start!124274)

(declare-fun b!1437820 () Bool)

(declare-fun res!969915 () Bool)

(declare-fun e!811470 () Bool)

(assert (=> b!1437820 (=> (not res!969915) (not e!811470))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97806 0))(
  ( (array!97807 (arr!47195 (Array (_ BitVec 32) (_ BitVec 64))) (size!47746 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97806)

(assert (=> b!1437820 (= res!969915 (and (= (size!47746 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47746 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47746 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437821 () Bool)

(declare-fun res!969912 () Bool)

(assert (=> b!1437821 (=> (not res!969912) (not e!811470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437821 (= res!969912 (validKeyInArray!0 (select (arr!47195 a!2862) j!93)))))

(declare-fun b!1437822 () Bool)

(declare-fun res!969917 () Bool)

(assert (=> b!1437822 (=> (not res!969917) (not e!811470))))

(assert (=> b!1437822 (= res!969917 (validKeyInArray!0 (select (arr!47195 a!2862) i!1006)))))

(declare-fun b!1437823 () Bool)

(declare-fun res!969914 () Bool)

(assert (=> b!1437823 (=> (not res!969914) (not e!811470))))

(declare-datatypes ((List!33683 0))(
  ( (Nil!33680) (Cons!33679 (h!35025 (_ BitVec 64)) (t!48369 List!33683)) )
))
(declare-fun arrayNoDuplicates!0 (array!97806 (_ BitVec 32) List!33683) Bool)

(assert (=> b!1437823 (= res!969914 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33680))))

(declare-fun b!1437824 () Bool)

(declare-fun res!969911 () Bool)

(assert (=> b!1437824 (=> (not res!969911) (not e!811470))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437824 (= res!969911 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47746 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47746 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47746 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47195 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437825 () Bool)

(declare-fun res!969916 () Bool)

(assert (=> b!1437825 (=> (not res!969916) (not e!811470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97806 (_ BitVec 32)) Bool)

(assert (=> b!1437825 (= res!969916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437826 () Bool)

(assert (=> b!1437826 (= e!811470 false)))

(declare-fun lt!632614 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437826 (= lt!632614 (toIndex!0 (select (arr!47195 a!2862) j!93) mask!2687))))

(declare-fun res!969913 () Bool)

(assert (=> start!124274 (=> (not res!969913) (not e!811470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124274 (= res!969913 (validMask!0 mask!2687))))

(assert (=> start!124274 e!811470))

(assert (=> start!124274 true))

(declare-fun array_inv!36476 (array!97806) Bool)

(assert (=> start!124274 (array_inv!36476 a!2862)))

(assert (= (and start!124274 res!969913) b!1437820))

(assert (= (and b!1437820 res!969915) b!1437822))

(assert (= (and b!1437822 res!969917) b!1437821))

(assert (= (and b!1437821 res!969912) b!1437825))

(assert (= (and b!1437825 res!969916) b!1437823))

(assert (= (and b!1437823 res!969914) b!1437824))

(assert (= (and b!1437824 res!969911) b!1437826))

(declare-fun m!1327247 () Bool)

(assert (=> b!1437821 m!1327247))

(assert (=> b!1437821 m!1327247))

(declare-fun m!1327249 () Bool)

(assert (=> b!1437821 m!1327249))

(declare-fun m!1327251 () Bool)

(assert (=> start!124274 m!1327251))

(declare-fun m!1327253 () Bool)

(assert (=> start!124274 m!1327253))

(declare-fun m!1327255 () Bool)

(assert (=> b!1437825 m!1327255))

(declare-fun m!1327257 () Bool)

(assert (=> b!1437823 m!1327257))

(declare-fun m!1327259 () Bool)

(assert (=> b!1437822 m!1327259))

(assert (=> b!1437822 m!1327259))

(declare-fun m!1327261 () Bool)

(assert (=> b!1437822 m!1327261))

(declare-fun m!1327263 () Bool)

(assert (=> b!1437824 m!1327263))

(declare-fun m!1327265 () Bool)

(assert (=> b!1437824 m!1327265))

(assert (=> b!1437826 m!1327247))

(assert (=> b!1437826 m!1327247))

(declare-fun m!1327267 () Bool)

(assert (=> b!1437826 m!1327267))

(push 1)

(assert (not b!1437823))

(assert (not b!1437825))

(assert (not b!1437821))

(assert (not start!124274))

(assert (not b!1437826))

(assert (not b!1437822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

