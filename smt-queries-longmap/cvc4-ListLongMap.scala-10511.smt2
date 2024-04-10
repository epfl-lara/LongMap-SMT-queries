; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123886 () Bool)

(assert start!123886)

(declare-fun b!1435758 () Bool)

(declare-fun e!810262 () Bool)

(declare-datatypes ((array!97630 0))(
  ( (array!97631 (arr!47116 (Array (_ BitVec 32) (_ BitVec 64))) (size!47666 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97630)

(assert (=> b!1435758 (= e!810262 (bvsgt #b00000000000000000000000000000000 (size!47666 a!2862)))))

(declare-fun res!968761 () Bool)

(assert (=> start!123886 (=> (not res!968761) (not e!810262))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123886 (= res!968761 (validMask!0 mask!2687))))

(assert (=> start!123886 e!810262))

(assert (=> start!123886 true))

(declare-fun array_inv!36144 (array!97630) Bool)

(assert (=> start!123886 (array_inv!36144 a!2862)))

(declare-fun b!1435757 () Bool)

(declare-fun res!968764 () Bool)

(assert (=> b!1435757 (=> (not res!968764) (not e!810262))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435757 (= res!968764 (validKeyInArray!0 (select (arr!47116 a!2862) j!93)))))

(declare-fun b!1435756 () Bool)

(declare-fun res!968762 () Bool)

(assert (=> b!1435756 (=> (not res!968762) (not e!810262))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435756 (= res!968762 (validKeyInArray!0 (select (arr!47116 a!2862) i!1006)))))

(declare-fun b!1435755 () Bool)

(declare-fun res!968763 () Bool)

(assert (=> b!1435755 (=> (not res!968763) (not e!810262))))

(assert (=> b!1435755 (= res!968763 (and (= (size!47666 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47666 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47666 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!123886 res!968761) b!1435755))

(assert (= (and b!1435755 res!968763) b!1435756))

(assert (= (and b!1435756 res!968762) b!1435757))

(assert (= (and b!1435757 res!968764) b!1435758))

(declare-fun m!1325127 () Bool)

(assert (=> start!123886 m!1325127))

(declare-fun m!1325129 () Bool)

(assert (=> start!123886 m!1325129))

(declare-fun m!1325131 () Bool)

(assert (=> b!1435757 m!1325131))

(assert (=> b!1435757 m!1325131))

(declare-fun m!1325133 () Bool)

(assert (=> b!1435757 m!1325133))

(declare-fun m!1325135 () Bool)

(assert (=> b!1435756 m!1325135))

(assert (=> b!1435756 m!1325135))

(declare-fun m!1325137 () Bool)

(assert (=> b!1435756 m!1325137))

(push 1)

(assert (not b!1435757))

(assert (not start!123886))

(assert (not b!1435756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

