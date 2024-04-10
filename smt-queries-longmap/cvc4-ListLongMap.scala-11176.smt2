; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130692 () Bool)

(assert start!130692)

(declare-fun b!1532866 () Bool)

(declare-fun e!854055 () Bool)

(assert (=> b!1532866 (= e!854055 false)))

(declare-fun lt!663748 () Bool)

(declare-datatypes ((array!101790 0))(
  ( (array!101791 (arr!49111 (Array (_ BitVec 32) (_ BitVec 64))) (size!49661 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101790)

(declare-datatypes ((List!35585 0))(
  ( (Nil!35582) (Cons!35581 (h!37026 (_ BitVec 64)) (t!50279 List!35585)) )
))
(declare-fun arrayNoDuplicates!0 (array!101790 (_ BitVec 32) List!35585) Bool)

(assert (=> b!1532866 (= lt!663748 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35582))))

(declare-fun b!1532867 () Bool)

(declare-fun res!1049953 () Bool)

(assert (=> b!1532867 (=> (not res!1049953) (not e!854055))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101790 (_ BitVec 32)) Bool)

(assert (=> b!1532867 (= res!1049953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1049956 () Bool)

(assert (=> start!130692 (=> (not res!1049956) (not e!854055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130692 (= res!1049956 (validMask!0 mask!2480))))

(assert (=> start!130692 e!854055))

(assert (=> start!130692 true))

(declare-fun array_inv!38139 (array!101790) Bool)

(assert (=> start!130692 (array_inv!38139 a!2792)))

(declare-fun b!1532868 () Bool)

(declare-fun res!1049952 () Bool)

(assert (=> b!1532868 (=> (not res!1049952) (not e!854055))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532868 (= res!1049952 (and (= (size!49661 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49661 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49661 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532869 () Bool)

(declare-fun res!1049954 () Bool)

(assert (=> b!1532869 (=> (not res!1049954) (not e!854055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532869 (= res!1049954 (validKeyInArray!0 (select (arr!49111 a!2792) i!951)))))

(declare-fun b!1532870 () Bool)

(declare-fun res!1049955 () Bool)

(assert (=> b!1532870 (=> (not res!1049955) (not e!854055))))

(assert (=> b!1532870 (= res!1049955 (validKeyInArray!0 (select (arr!49111 a!2792) j!64)))))

(assert (= (and start!130692 res!1049956) b!1532868))

(assert (= (and b!1532868 res!1049952) b!1532869))

(assert (= (and b!1532869 res!1049954) b!1532870))

(assert (= (and b!1532870 res!1049955) b!1532867))

(assert (= (and b!1532867 res!1049953) b!1532866))

(declare-fun m!1415573 () Bool)

(assert (=> b!1532869 m!1415573))

(assert (=> b!1532869 m!1415573))

(declare-fun m!1415575 () Bool)

(assert (=> b!1532869 m!1415575))

(declare-fun m!1415577 () Bool)

(assert (=> b!1532867 m!1415577))

(declare-fun m!1415579 () Bool)

(assert (=> b!1532866 m!1415579))

(declare-fun m!1415581 () Bool)

(assert (=> start!130692 m!1415581))

(declare-fun m!1415583 () Bool)

(assert (=> start!130692 m!1415583))

(declare-fun m!1415585 () Bool)

(assert (=> b!1532870 m!1415585))

(assert (=> b!1532870 m!1415585))

(declare-fun m!1415587 () Bool)

(assert (=> b!1532870 m!1415587))

(push 1)

(assert (not start!130692))

(assert (not b!1532867))

(assert (not b!1532869))

(assert (not b!1532866))

(assert (not b!1532870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

