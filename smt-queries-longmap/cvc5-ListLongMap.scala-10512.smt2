; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123888 () Bool)

(assert start!123888)

(declare-fun b!1435769 () Bool)

(declare-fun res!968778 () Bool)

(declare-fun e!810269 () Bool)

(assert (=> b!1435769 (=> (not res!968778) (not e!810269))))

(declare-datatypes ((array!97632 0))(
  ( (array!97633 (arr!47117 (Array (_ BitVec 32) (_ BitVec 64))) (size!47667 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97632)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435769 (= res!968778 (validKeyInArray!0 (select (arr!47117 a!2862) i!1006)))))

(declare-fun res!968775 () Bool)

(assert (=> start!123888 (=> (not res!968775) (not e!810269))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123888 (= res!968775 (validMask!0 mask!2687))))

(assert (=> start!123888 e!810269))

(assert (=> start!123888 true))

(declare-fun array_inv!36145 (array!97632) Bool)

(assert (=> start!123888 (array_inv!36145 a!2862)))

(declare-fun b!1435770 () Bool)

(declare-fun res!968777 () Bool)

(assert (=> b!1435770 (=> (not res!968777) (not e!810269))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1435770 (= res!968777 (validKeyInArray!0 (select (arr!47117 a!2862) j!93)))))

(declare-fun b!1435771 () Bool)

(declare-fun res!968776 () Bool)

(assert (=> b!1435771 (=> (not res!968776) (not e!810269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97632 (_ BitVec 32)) Bool)

(assert (=> b!1435771 (= res!968776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435772 () Bool)

(declare-fun res!968779 () Bool)

(assert (=> b!1435772 (=> (not res!968779) (not e!810269))))

(assert (=> b!1435772 (= res!968779 (and (= (size!47667 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47667 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47667 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435773 () Bool)

(assert (=> b!1435773 (= e!810269 (bvsgt #b00000000000000000000000000000000 (size!47667 a!2862)))))

(assert (= (and start!123888 res!968775) b!1435772))

(assert (= (and b!1435772 res!968779) b!1435769))

(assert (= (and b!1435769 res!968778) b!1435770))

(assert (= (and b!1435770 res!968777) b!1435771))

(assert (= (and b!1435771 res!968776) b!1435773))

(declare-fun m!1325139 () Bool)

(assert (=> b!1435769 m!1325139))

(assert (=> b!1435769 m!1325139))

(declare-fun m!1325141 () Bool)

(assert (=> b!1435769 m!1325141))

(declare-fun m!1325143 () Bool)

(assert (=> start!123888 m!1325143))

(declare-fun m!1325145 () Bool)

(assert (=> start!123888 m!1325145))

(declare-fun m!1325147 () Bool)

(assert (=> b!1435770 m!1325147))

(assert (=> b!1435770 m!1325147))

(declare-fun m!1325149 () Bool)

(assert (=> b!1435770 m!1325149))

(declare-fun m!1325151 () Bool)

(assert (=> b!1435771 m!1325151))

(push 1)

(assert (not b!1435771))

