; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124264 () Bool)

(assert start!124264)

(declare-fun b!1437715 () Bool)

(declare-fun res!969808 () Bool)

(declare-fun e!811440 () Bool)

(assert (=> b!1437715 (=> (not res!969808) (not e!811440))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97796 0))(
  ( (array!97797 (arr!47190 (Array (_ BitVec 32) (_ BitVec 64))) (size!47741 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97796)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1437715 (= res!969808 (and (= (size!47741 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47741 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47741 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437716 () Bool)

(assert (=> b!1437716 (= e!811440 false)))

(declare-fun lt!632599 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437716 (= lt!632599 (toIndex!0 (select (arr!47190 a!2862) j!93) mask!2687))))

(declare-fun b!1437717 () Bool)

(declare-fun res!969812 () Bool)

(assert (=> b!1437717 (=> (not res!969812) (not e!811440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97796 (_ BitVec 32)) Bool)

(assert (=> b!1437717 (= res!969812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437718 () Bool)

(declare-fun res!969810 () Bool)

(assert (=> b!1437718 (=> (not res!969810) (not e!811440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437718 (= res!969810 (validKeyInArray!0 (select (arr!47190 a!2862) j!93)))))

(declare-fun b!1437719 () Bool)

(declare-fun res!969806 () Bool)

(assert (=> b!1437719 (=> (not res!969806) (not e!811440))))

(declare-datatypes ((List!33678 0))(
  ( (Nil!33675) (Cons!33674 (h!35020 (_ BitVec 64)) (t!48364 List!33678)) )
))
(declare-fun arrayNoDuplicates!0 (array!97796 (_ BitVec 32) List!33678) Bool)

(assert (=> b!1437719 (= res!969806 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33675))))

(declare-fun b!1437720 () Bool)

(declare-fun res!969809 () Bool)

(assert (=> b!1437720 (=> (not res!969809) (not e!811440))))

(assert (=> b!1437720 (= res!969809 (validKeyInArray!0 (select (arr!47190 a!2862) i!1006)))))

(declare-fun res!969811 () Bool)

(assert (=> start!124264 (=> (not res!969811) (not e!811440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124264 (= res!969811 (validMask!0 mask!2687))))

(assert (=> start!124264 e!811440))

(assert (=> start!124264 true))

(declare-fun array_inv!36471 (array!97796) Bool)

(assert (=> start!124264 (array_inv!36471 a!2862)))

(declare-fun b!1437721 () Bool)

(declare-fun res!969807 () Bool)

(assert (=> b!1437721 (=> (not res!969807) (not e!811440))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437721 (= res!969807 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47741 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47741 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47741 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124264 res!969811) b!1437715))

(assert (= (and b!1437715 res!969808) b!1437720))

(assert (= (and b!1437720 res!969809) b!1437718))

(assert (= (and b!1437718 res!969810) b!1437717))

(assert (= (and b!1437717 res!969812) b!1437719))

(assert (= (and b!1437719 res!969806) b!1437721))

(assert (= (and b!1437721 res!969807) b!1437716))

(declare-fun m!1327137 () Bool)

(assert (=> b!1437718 m!1327137))

(assert (=> b!1437718 m!1327137))

(declare-fun m!1327139 () Bool)

(assert (=> b!1437718 m!1327139))

(assert (=> b!1437716 m!1327137))

(assert (=> b!1437716 m!1327137))

(declare-fun m!1327141 () Bool)

(assert (=> b!1437716 m!1327141))

(declare-fun m!1327143 () Bool)

(assert (=> b!1437721 m!1327143))

(declare-fun m!1327145 () Bool)

(assert (=> b!1437721 m!1327145))

(declare-fun m!1327147 () Bool)

(assert (=> start!124264 m!1327147))

(declare-fun m!1327149 () Bool)

(assert (=> start!124264 m!1327149))

(declare-fun m!1327151 () Bool)

(assert (=> b!1437717 m!1327151))

(declare-fun m!1327153 () Bool)

(assert (=> b!1437719 m!1327153))

(declare-fun m!1327155 () Bool)

(assert (=> b!1437720 m!1327155))

(assert (=> b!1437720 m!1327155))

(declare-fun m!1327157 () Bool)

(assert (=> b!1437720 m!1327157))

(push 1)

(assert (not b!1437716))

(assert (not b!1437717))

(assert (not b!1437719))

(assert (not start!124264))

(assert (not b!1437718))

(assert (not b!1437720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

