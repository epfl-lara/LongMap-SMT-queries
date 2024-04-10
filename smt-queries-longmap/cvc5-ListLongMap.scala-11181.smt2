; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130718 () Bool)

(assert start!130718)

(declare-fun res!1050169 () Bool)

(declare-fun e!854134 () Bool)

(assert (=> start!130718 (=> (not res!1050169) (not e!854134))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130718 (= res!1050169 (validMask!0 mask!2480))))

(assert (=> start!130718 e!854134))

(assert (=> start!130718 true))

(declare-datatypes ((array!101816 0))(
  ( (array!101817 (arr!49124 (Array (_ BitVec 32) (_ BitVec 64))) (size!49674 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101816)

(declare-fun array_inv!38152 (array!101816) Bool)

(assert (=> start!130718 (array_inv!38152 a!2792)))

(declare-fun b!1533079 () Bool)

(declare-fun res!1050166 () Bool)

(assert (=> b!1533079 (=> (not res!1050166) (not e!854134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101816 (_ BitVec 32)) Bool)

(assert (=> b!1533079 (= res!1050166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533080 () Bool)

(declare-fun res!1050168 () Bool)

(assert (=> b!1533080 (=> (not res!1050168) (not e!854134))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533080 (= res!1050168 (validKeyInArray!0 (select (arr!49124 a!2792) i!951)))))

(declare-fun b!1533081 () Bool)

(declare-fun res!1050165 () Bool)

(assert (=> b!1533081 (=> (not res!1050165) (not e!854134))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533081 (= res!1050165 (validKeyInArray!0 (select (arr!49124 a!2792) j!64)))))

(declare-fun b!1533082 () Bool)

(declare-fun res!1050167 () Bool)

(assert (=> b!1533082 (=> (not res!1050167) (not e!854134))))

(assert (=> b!1533082 (= res!1050167 (and (= (size!49674 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49674 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49674 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533083 () Bool)

(assert (=> b!1533083 (= e!854134 false)))

(declare-fun lt!663769 () Bool)

(declare-datatypes ((List!35598 0))(
  ( (Nil!35595) (Cons!35594 (h!37039 (_ BitVec 64)) (t!50292 List!35598)) )
))
(declare-fun arrayNoDuplicates!0 (array!101816 (_ BitVec 32) List!35598) Bool)

(assert (=> b!1533083 (= lt!663769 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35595))))

(assert (= (and start!130718 res!1050169) b!1533082))

(assert (= (and b!1533082 res!1050167) b!1533080))

(assert (= (and b!1533080 res!1050168) b!1533081))

(assert (= (and b!1533081 res!1050165) b!1533079))

(assert (= (and b!1533079 res!1050166) b!1533083))

(declare-fun m!1415793 () Bool)

(assert (=> b!1533081 m!1415793))

(assert (=> b!1533081 m!1415793))

(declare-fun m!1415795 () Bool)

(assert (=> b!1533081 m!1415795))

(declare-fun m!1415797 () Bool)

(assert (=> b!1533083 m!1415797))

(declare-fun m!1415799 () Bool)

(assert (=> start!130718 m!1415799))

(declare-fun m!1415801 () Bool)

(assert (=> start!130718 m!1415801))

(declare-fun m!1415803 () Bool)

(assert (=> b!1533079 m!1415803))

(declare-fun m!1415805 () Bool)

(assert (=> b!1533080 m!1415805))

(assert (=> b!1533080 m!1415805))

(declare-fun m!1415807 () Bool)

(assert (=> b!1533080 m!1415807))

(push 1)

(assert (not b!1533081))

(assert (not start!130718))

(assert (not b!1533080))

(assert (not b!1533079))

(assert (not b!1533083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

