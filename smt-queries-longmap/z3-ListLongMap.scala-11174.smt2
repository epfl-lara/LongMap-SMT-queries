; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130678 () Bool)

(assert start!130678)

(declare-fun res!1049842 () Bool)

(declare-fun e!854014 () Bool)

(assert (=> start!130678 (=> (not res!1049842) (not e!854014))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130678 (= res!1049842 (validMask!0 mask!2480))))

(assert (=> start!130678 e!854014))

(assert (=> start!130678 true))

(declare-datatypes ((array!101776 0))(
  ( (array!101777 (arr!49104 (Array (_ BitVec 32) (_ BitVec 64))) (size!49654 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101776)

(declare-fun array_inv!38132 (array!101776) Bool)

(assert (=> start!130678 (array_inv!38132 a!2792)))

(declare-fun b!1532752 () Bool)

(assert (=> b!1532752 (= e!854014 false)))

(declare-fun lt!663736 () Bool)

(declare-datatypes ((List!35578 0))(
  ( (Nil!35575) (Cons!35574 (h!37019 (_ BitVec 64)) (t!50272 List!35578)) )
))
(declare-fun arrayNoDuplicates!0 (array!101776 (_ BitVec 32) List!35578) Bool)

(assert (=> b!1532752 (= lt!663736 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35575))))

(declare-fun b!1532753 () Bool)

(declare-fun res!1049840 () Bool)

(assert (=> b!1532753 (=> (not res!1049840) (not e!854014))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532753 (= res!1049840 (and (= (size!49654 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49654 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49654 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532754 () Bool)

(declare-fun res!1049838 () Bool)

(assert (=> b!1532754 (=> (not res!1049838) (not e!854014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532754 (= res!1049838 (validKeyInArray!0 (select (arr!49104 a!2792) i!951)))))

(declare-fun b!1532755 () Bool)

(declare-fun res!1049839 () Bool)

(assert (=> b!1532755 (=> (not res!1049839) (not e!854014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101776 (_ BitVec 32)) Bool)

(assert (=> b!1532755 (= res!1049839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532756 () Bool)

(declare-fun res!1049841 () Bool)

(assert (=> b!1532756 (=> (not res!1049841) (not e!854014))))

(assert (=> b!1532756 (= res!1049841 (validKeyInArray!0 (select (arr!49104 a!2792) j!64)))))

(assert (= (and start!130678 res!1049842) b!1532753))

(assert (= (and b!1532753 res!1049840) b!1532754))

(assert (= (and b!1532754 res!1049838) b!1532756))

(assert (= (and b!1532756 res!1049841) b!1532755))

(assert (= (and b!1532755 res!1049839) b!1532752))

(declare-fun m!1415455 () Bool)

(assert (=> start!130678 m!1415455))

(declare-fun m!1415457 () Bool)

(assert (=> start!130678 m!1415457))

(declare-fun m!1415459 () Bool)

(assert (=> b!1532755 m!1415459))

(declare-fun m!1415461 () Bool)

(assert (=> b!1532752 m!1415461))

(declare-fun m!1415463 () Bool)

(assert (=> b!1532754 m!1415463))

(assert (=> b!1532754 m!1415463))

(declare-fun m!1415465 () Bool)

(assert (=> b!1532754 m!1415465))

(declare-fun m!1415467 () Bool)

(assert (=> b!1532756 m!1415467))

(assert (=> b!1532756 m!1415467))

(declare-fun m!1415469 () Bool)

(assert (=> b!1532756 m!1415469))

(check-sat (not b!1532752) (not b!1532754) (not b!1532755) (not b!1532756) (not start!130678))
