; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130714 () Bool)

(assert start!130714)

(declare-fun b!1533049 () Bool)

(declare-fun res!1050138 () Bool)

(declare-fun e!854122 () Bool)

(assert (=> b!1533049 (=> (not res!1050138) (not e!854122))))

(declare-datatypes ((array!101812 0))(
  ( (array!101813 (arr!49122 (Array (_ BitVec 32) (_ BitVec 64))) (size!49672 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101812)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533049 (= res!1050138 (validKeyInArray!0 (select (arr!49122 a!2792) j!64)))))

(declare-fun b!1533050 () Bool)

(declare-fun res!1050135 () Bool)

(assert (=> b!1533050 (=> (not res!1050135) (not e!854122))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533050 (= res!1050135 (and (= (size!49672 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49672 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49672 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533052 () Bool)

(declare-fun res!1050139 () Bool)

(assert (=> b!1533052 (=> (not res!1050139) (not e!854122))))

(assert (=> b!1533052 (= res!1050139 (validKeyInArray!0 (select (arr!49122 a!2792) i!951)))))

(declare-fun b!1533053 () Bool)

(declare-fun res!1050137 () Bool)

(assert (=> b!1533053 (=> (not res!1050137) (not e!854122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101812 (_ BitVec 32)) Bool)

(assert (=> b!1533053 (= res!1050137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050136 () Bool)

(assert (=> start!130714 (=> (not res!1050136) (not e!854122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130714 (= res!1050136 (validMask!0 mask!2480))))

(assert (=> start!130714 e!854122))

(assert (=> start!130714 true))

(declare-fun array_inv!38150 (array!101812) Bool)

(assert (=> start!130714 (array_inv!38150 a!2792)))

(declare-fun b!1533051 () Bool)

(assert (=> b!1533051 (= e!854122 false)))

(declare-fun lt!663763 () Bool)

(declare-datatypes ((List!35596 0))(
  ( (Nil!35593) (Cons!35592 (h!37037 (_ BitVec 64)) (t!50290 List!35596)) )
))
(declare-fun arrayNoDuplicates!0 (array!101812 (_ BitVec 32) List!35596) Bool)

(assert (=> b!1533051 (= lt!663763 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35593))))

(assert (= (and start!130714 res!1050136) b!1533050))

(assert (= (and b!1533050 res!1050135) b!1533052))

(assert (= (and b!1533052 res!1050139) b!1533049))

(assert (= (and b!1533049 res!1050138) b!1533053))

(assert (= (and b!1533053 res!1050137) b!1533051))

(declare-fun m!1415761 () Bool)

(assert (=> b!1533051 m!1415761))

(declare-fun m!1415763 () Bool)

(assert (=> start!130714 m!1415763))

(declare-fun m!1415765 () Bool)

(assert (=> start!130714 m!1415765))

(declare-fun m!1415767 () Bool)

(assert (=> b!1533052 m!1415767))

(assert (=> b!1533052 m!1415767))

(declare-fun m!1415769 () Bool)

(assert (=> b!1533052 m!1415769))

(declare-fun m!1415771 () Bool)

(assert (=> b!1533049 m!1415771))

(assert (=> b!1533049 m!1415771))

(declare-fun m!1415773 () Bool)

(assert (=> b!1533049 m!1415773))

(declare-fun m!1415775 () Bool)

(assert (=> b!1533053 m!1415775))

(check-sat (not b!1533052) (not b!1533053) (not start!130714) (not b!1533049) (not b!1533051))
