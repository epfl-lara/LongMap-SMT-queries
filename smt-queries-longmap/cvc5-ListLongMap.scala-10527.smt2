; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124106 () Bool)

(assert start!124106)

(declare-fun b!1436858 () Bool)

(declare-fun res!969859 () Bool)

(declare-fun e!810711 () Bool)

(assert (=> b!1436858 (=> (not res!969859) (not e!810711))))

(declare-datatypes ((array!97688 0))(
  ( (array!97689 (arr!47139 (Array (_ BitVec 32) (_ BitVec 64))) (size!47691 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97688)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436858 (= res!969859 (validKeyInArray!0 (select (arr!47139 a!2862) j!93)))))

(declare-fun res!969860 () Bool)

(assert (=> start!124106 (=> (not res!969860) (not e!810711))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124106 (= res!969860 (validMask!0 mask!2687))))

(assert (=> start!124106 e!810711))

(assert (=> start!124106 true))

(declare-fun array_inv!36372 (array!97688) Bool)

(assert (=> start!124106 (array_inv!36372 a!2862)))

(declare-fun b!1436859 () Bool)

(declare-fun res!969862 () Bool)

(assert (=> b!1436859 (=> (not res!969862) (not e!810711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97688 (_ BitVec 32)) Bool)

(assert (=> b!1436859 (= res!969862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436860 () Bool)

(declare-fun res!969858 () Bool)

(assert (=> b!1436860 (=> (not res!969858) (not e!810711))))

(declare-datatypes ((List!33718 0))(
  ( (Nil!33715) (Cons!33714 (h!35052 (_ BitVec 64)) (t!48404 List!33718)) )
))
(declare-fun arrayNoDuplicates!0 (array!97688 (_ BitVec 32) List!33718) Bool)

(assert (=> b!1436860 (= res!969858 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33715))))

(declare-fun b!1436861 () Bool)

(declare-fun res!969861 () Bool)

(assert (=> b!1436861 (=> (not res!969861) (not e!810711))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436861 (= res!969861 (validKeyInArray!0 (select (arr!47139 a!2862) i!1006)))))

(declare-fun b!1436862 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1436862 (= e!810711 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1436863 () Bool)

(declare-fun res!969863 () Bool)

(assert (=> b!1436863 (=> (not res!969863) (not e!810711))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436863 (= res!969863 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47691 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47691 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47691 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436864 () Bool)

(declare-fun res!969865 () Bool)

(assert (=> b!1436864 (=> (not res!969865) (not e!810711))))

(declare-datatypes ((SeekEntryResult!11416 0))(
  ( (MissingZero!11416 (index!48056 (_ BitVec 32))) (Found!11416 (index!48057 (_ BitVec 32))) (Intermediate!11416 (undefined!12228 Bool) (index!48058 (_ BitVec 32)) (x!129780 (_ BitVec 32))) (Undefined!11416) (MissingVacant!11416 (index!48059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97688 (_ BitVec 32)) SeekEntryResult!11416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436864 (= res!969865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47139 a!2862) j!93) mask!2687) (select (arr!47139 a!2862) j!93) a!2862 mask!2687) (Intermediate!11416 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1436865 () Bool)

(declare-fun res!969864 () Bool)

(assert (=> b!1436865 (=> (not res!969864) (not e!810711))))

(assert (=> b!1436865 (= res!969864 (and (= (size!47691 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47691 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47691 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124106 res!969860) b!1436865))

(assert (= (and b!1436865 res!969864) b!1436861))

(assert (= (and b!1436861 res!969861) b!1436858))

(assert (= (and b!1436858 res!969859) b!1436859))

(assert (= (and b!1436859 res!969862) b!1436860))

(assert (= (and b!1436860 res!969858) b!1436863))

(assert (= (and b!1436863 res!969863) b!1436864))

(assert (= (and b!1436864 res!969865) b!1436862))

(declare-fun m!1325685 () Bool)

(assert (=> b!1436861 m!1325685))

(assert (=> b!1436861 m!1325685))

(declare-fun m!1325687 () Bool)

(assert (=> b!1436861 m!1325687))

(declare-fun m!1325689 () Bool)

(assert (=> b!1436864 m!1325689))

(assert (=> b!1436864 m!1325689))

(declare-fun m!1325691 () Bool)

(assert (=> b!1436864 m!1325691))

(assert (=> b!1436864 m!1325691))

(assert (=> b!1436864 m!1325689))

(declare-fun m!1325693 () Bool)

(assert (=> b!1436864 m!1325693))

(assert (=> b!1436858 m!1325689))

(assert (=> b!1436858 m!1325689))

(declare-fun m!1325695 () Bool)

(assert (=> b!1436858 m!1325695))

(declare-fun m!1325697 () Bool)

(assert (=> b!1436863 m!1325697))

(declare-fun m!1325699 () Bool)

(assert (=> b!1436863 m!1325699))

(declare-fun m!1325701 () Bool)

(assert (=> start!124106 m!1325701))

(declare-fun m!1325703 () Bool)

(assert (=> start!124106 m!1325703))

(declare-fun m!1325705 () Bool)

(assert (=> b!1436859 m!1325705))

(declare-fun m!1325707 () Bool)

(assert (=> b!1436860 m!1325707))

(push 1)

(assert (not b!1436858))

(assert (not b!1436860))

(assert (not start!124106))

(assert (not b!1436861))

(assert (not b!1436859))

(assert (not b!1436864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

