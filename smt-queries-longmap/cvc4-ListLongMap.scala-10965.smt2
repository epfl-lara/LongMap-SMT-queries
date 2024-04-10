; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128422 () Bool)

(assert start!128422)

(declare-fun b!1506215 () Bool)

(declare-fun res!1026577 () Bool)

(declare-fun e!841804 () Bool)

(assert (=> b!1506215 (=> (not res!1026577) (not e!841804))))

(declare-datatypes ((array!100467 0))(
  ( (array!100468 (arr!48478 (Array (_ BitVec 32) (_ BitVec 64))) (size!49028 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100467)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506215 (= res!1026577 (validKeyInArray!0 (select (arr!48478 a!2804) i!961)))))

(declare-fun b!1506216 () Bool)

(declare-fun res!1026576 () Bool)

(assert (=> b!1506216 (=> (not res!1026576) (not e!841804))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506216 (= res!1026576 (validKeyInArray!0 (select (arr!48478 a!2804) j!70)))))

(declare-fun b!1506217 () Bool)

(assert (=> b!1506217 (= e!841804 false)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!654169 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506217 (= lt!654169 (toIndex!0 (select (arr!48478 a!2804) j!70) mask!2512))))

(declare-fun b!1506218 () Bool)

(declare-fun res!1026573 () Bool)

(assert (=> b!1506218 (=> (not res!1026573) (not e!841804))))

(assert (=> b!1506218 (= res!1026573 (and (= (size!49028 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49028 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49028 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026575 () Bool)

(assert (=> start!128422 (=> (not res!1026575) (not e!841804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128422 (= res!1026575 (validMask!0 mask!2512))))

(assert (=> start!128422 e!841804))

(assert (=> start!128422 true))

(declare-fun array_inv!37506 (array!100467) Bool)

(assert (=> start!128422 (array_inv!37506 a!2804)))

(declare-fun b!1506219 () Bool)

(declare-fun res!1026571 () Bool)

(assert (=> b!1506219 (=> (not res!1026571) (not e!841804))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506219 (= res!1026571 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49028 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49028 a!2804))))))

(declare-fun b!1506220 () Bool)

(declare-fun res!1026572 () Bool)

(assert (=> b!1506220 (=> (not res!1026572) (not e!841804))))

(declare-datatypes ((List!34961 0))(
  ( (Nil!34958) (Cons!34957 (h!36354 (_ BitVec 64)) (t!49655 List!34961)) )
))
(declare-fun arrayNoDuplicates!0 (array!100467 (_ BitVec 32) List!34961) Bool)

(assert (=> b!1506220 (= res!1026572 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34958))))

(declare-fun b!1506221 () Bool)

(declare-fun res!1026574 () Bool)

(assert (=> b!1506221 (=> (not res!1026574) (not e!841804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100467 (_ BitVec 32)) Bool)

(assert (=> b!1506221 (= res!1026574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128422 res!1026575) b!1506218))

(assert (= (and b!1506218 res!1026573) b!1506215))

(assert (= (and b!1506215 res!1026577) b!1506216))

(assert (= (and b!1506216 res!1026576) b!1506221))

(assert (= (and b!1506221 res!1026574) b!1506220))

(assert (= (and b!1506220 res!1026572) b!1506219))

(assert (= (and b!1506219 res!1026571) b!1506217))

(declare-fun m!1389211 () Bool)

(assert (=> start!128422 m!1389211))

(declare-fun m!1389213 () Bool)

(assert (=> start!128422 m!1389213))

(declare-fun m!1389215 () Bool)

(assert (=> b!1506220 m!1389215))

(declare-fun m!1389217 () Bool)

(assert (=> b!1506217 m!1389217))

(assert (=> b!1506217 m!1389217))

(declare-fun m!1389219 () Bool)

(assert (=> b!1506217 m!1389219))

(declare-fun m!1389221 () Bool)

(assert (=> b!1506221 m!1389221))

(assert (=> b!1506216 m!1389217))

(assert (=> b!1506216 m!1389217))

(declare-fun m!1389223 () Bool)

(assert (=> b!1506216 m!1389223))

(declare-fun m!1389225 () Bool)

(assert (=> b!1506215 m!1389225))

(assert (=> b!1506215 m!1389225))

(declare-fun m!1389227 () Bool)

(assert (=> b!1506215 m!1389227))

(push 1)

(assert (not start!128422))

(assert (not b!1506216))

(assert (not b!1506217))

(assert (not b!1506215))

(assert (not b!1506221))

(assert (not b!1506220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

