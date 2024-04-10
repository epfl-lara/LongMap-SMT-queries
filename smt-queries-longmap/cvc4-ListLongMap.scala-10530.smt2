; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124154 () Bool)

(assert start!124154)

(declare-fun b!1437259 () Bool)

(declare-fun e!810889 () Bool)

(declare-fun e!810888 () Bool)

(assert (=> b!1437259 (= e!810889 e!810888)))

(declare-fun res!970148 () Bool)

(assert (=> b!1437259 (=> (not res!970148) (not e!810888))))

(declare-datatypes ((array!97758 0))(
  ( (array!97759 (arr!47173 (Array (_ BitVec 32) (_ BitVec 64))) (size!47723 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97758)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11425 0))(
  ( (MissingZero!11425 (index!48092 (_ BitVec 32))) (Found!11425 (index!48093 (_ BitVec 32))) (Intermediate!11425 (undefined!12237 Bool) (index!48094 (_ BitVec 32)) (x!129818 (_ BitVec 32))) (Undefined!11425) (MissingVacant!11425 (index!48095 (_ BitVec 32))) )
))
(declare-fun lt!632256 () SeekEntryResult!11425)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97758 (_ BitVec 32)) SeekEntryResult!11425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437259 (= res!970148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) (select (arr!47173 a!2862) j!93) a!2862 mask!2687) lt!632256))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437259 (= lt!632256 (Intermediate!11425 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!970146 () Bool)

(assert (=> start!124154 (=> (not res!970146) (not e!810889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124154 (= res!970146 (validMask!0 mask!2687))))

(assert (=> start!124154 e!810889))

(assert (=> start!124154 true))

(declare-fun array_inv!36201 (array!97758) Bool)

(assert (=> start!124154 (array_inv!36201 a!2862)))

(declare-fun b!1437260 () Bool)

(declare-fun res!970147 () Bool)

(assert (=> b!1437260 (=> (not res!970147) (not e!810889))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437260 (= res!970147 (and (= (size!47723 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47723 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47723 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437261 () Bool)

(declare-fun res!970143 () Bool)

(assert (=> b!1437261 (=> (not res!970143) (not e!810889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437261 (= res!970143 (validKeyInArray!0 (select (arr!47173 a!2862) i!1006)))))

(declare-fun b!1437262 () Bool)

(declare-fun res!970150 () Bool)

(assert (=> b!1437262 (=> (not res!970150) (not e!810888))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437262 (= res!970150 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47173 a!2862) j!93) a!2862 mask!2687) lt!632256))))

(declare-fun b!1437263 () Bool)

(declare-fun res!970145 () Bool)

(assert (=> b!1437263 (=> (not res!970145) (not e!810889))))

(declare-datatypes ((List!33674 0))(
  ( (Nil!33671) (Cons!33670 (h!35008 (_ BitVec 64)) (t!48368 List!33674)) )
))
(declare-fun arrayNoDuplicates!0 (array!97758 (_ BitVec 32) List!33674) Bool)

(assert (=> b!1437263 (= res!970145 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33671))))

(declare-fun b!1437264 () Bool)

(declare-fun res!970149 () Bool)

(assert (=> b!1437264 (=> (not res!970149) (not e!810889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97758 (_ BitVec 32)) Bool)

(assert (=> b!1437264 (= res!970149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437265 () Bool)

(declare-fun res!970142 () Bool)

(assert (=> b!1437265 (=> (not res!970142) (not e!810889))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437265 (= res!970142 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47723 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47723 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47723 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437266 () Bool)

(assert (=> b!1437266 (= e!810888 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1437267 () Bool)

(declare-fun res!970144 () Bool)

(assert (=> b!1437267 (=> (not res!970144) (not e!810889))))

(assert (=> b!1437267 (= res!970144 (validKeyInArray!0 (select (arr!47173 a!2862) j!93)))))

(assert (= (and start!124154 res!970146) b!1437260))

(assert (= (and b!1437260 res!970147) b!1437261))

(assert (= (and b!1437261 res!970143) b!1437267))

(assert (= (and b!1437267 res!970144) b!1437264))

(assert (= (and b!1437264 res!970149) b!1437263))

(assert (= (and b!1437263 res!970145) b!1437265))

(assert (= (and b!1437265 res!970142) b!1437259))

(assert (= (and b!1437259 res!970148) b!1437262))

(assert (= (and b!1437262 res!970150) b!1437266))

(declare-fun m!1326581 () Bool)

(assert (=> b!1437267 m!1326581))

(assert (=> b!1437267 m!1326581))

(declare-fun m!1326583 () Bool)

(assert (=> b!1437267 m!1326583))

(declare-fun m!1326585 () Bool)

(assert (=> start!124154 m!1326585))

(declare-fun m!1326587 () Bool)

(assert (=> start!124154 m!1326587))

(declare-fun m!1326589 () Bool)

(assert (=> b!1437265 m!1326589))

(declare-fun m!1326591 () Bool)

(assert (=> b!1437265 m!1326591))

(assert (=> b!1437259 m!1326581))

(assert (=> b!1437259 m!1326581))

(declare-fun m!1326593 () Bool)

(assert (=> b!1437259 m!1326593))

(assert (=> b!1437259 m!1326593))

(assert (=> b!1437259 m!1326581))

(declare-fun m!1326595 () Bool)

(assert (=> b!1437259 m!1326595))

(declare-fun m!1326597 () Bool)

(assert (=> b!1437264 m!1326597))

(declare-fun m!1326599 () Bool)

(assert (=> b!1437261 m!1326599))

(assert (=> b!1437261 m!1326599))

(declare-fun m!1326601 () Bool)

(assert (=> b!1437261 m!1326601))

(declare-fun m!1326603 () Bool)

(assert (=> b!1437263 m!1326603))

(assert (=> b!1437262 m!1326581))

(assert (=> b!1437262 m!1326581))

(declare-fun m!1326605 () Bool)

(assert (=> b!1437262 m!1326605))

(push 1)

(assert (not b!1437267))

(assert (not b!1437264))

(assert (not start!124154))

(assert (not b!1437259))

(assert (not b!1437261))

(assert (not b!1437262))

(assert (not b!1437263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

