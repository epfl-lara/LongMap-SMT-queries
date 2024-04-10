; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130700 () Bool)

(assert start!130700)

(declare-fun res!1050025 () Bool)

(declare-fun e!854079 () Bool)

(assert (=> start!130700 (=> (not res!1050025) (not e!854079))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130700 (= res!1050025 (validMask!0 mask!2480))))

(assert (=> start!130700 e!854079))

(assert (=> start!130700 true))

(declare-datatypes ((array!101798 0))(
  ( (array!101799 (arr!49115 (Array (_ BitVec 32) (_ BitVec 64))) (size!49665 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101798)

(declare-fun array_inv!38143 (array!101798) Bool)

(assert (=> start!130700 (array_inv!38143 a!2792)))

(declare-fun b!1532935 () Bool)

(assert (=> b!1532935 (= e!854079 false)))

(declare-fun lt!663751 () Bool)

(declare-datatypes ((List!35589 0))(
  ( (Nil!35586) (Cons!35585 (h!37030 (_ BitVec 64)) (t!50283 List!35589)) )
))
(declare-fun arrayNoDuplicates!0 (array!101798 (_ BitVec 32) List!35589) Bool)

(assert (=> b!1532935 (= lt!663751 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35586))))

(declare-fun b!1532936 () Bool)

(declare-fun res!1050023 () Bool)

(assert (=> b!1532936 (=> (not res!1050023) (not e!854079))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532936 (= res!1050023 (and (= (size!49665 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49665 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49665 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532937 () Bool)

(declare-fun res!1050022 () Bool)

(assert (=> b!1532937 (=> (not res!1050022) (not e!854079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101798 (_ BitVec 32)) Bool)

(assert (=> b!1532937 (= res!1050022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532938 () Bool)

(declare-fun res!1050024 () Bool)

(assert (=> b!1532938 (=> (not res!1050024) (not e!854079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532938 (= res!1050024 (validKeyInArray!0 (select (arr!49115 a!2792) i!951)))))

(declare-fun b!1532939 () Bool)

(declare-fun res!1050021 () Bool)

(assert (=> b!1532939 (=> (not res!1050021) (not e!854079))))

(assert (=> b!1532939 (= res!1050021 (validKeyInArray!0 (select (arr!49115 a!2792) j!64)))))

(assert (= (and start!130700 res!1050025) b!1532936))

(assert (= (and b!1532936 res!1050023) b!1532938))

(assert (= (and b!1532938 res!1050024) b!1532939))

(assert (= (and b!1532939 res!1050021) b!1532937))

(assert (= (and b!1532937 res!1050022) b!1532935))

(declare-fun m!1415643 () Bool)

(assert (=> b!1532938 m!1415643))

(assert (=> b!1532938 m!1415643))

(declare-fun m!1415645 () Bool)

(assert (=> b!1532938 m!1415645))

(declare-fun m!1415647 () Bool)

(assert (=> start!130700 m!1415647))

(declare-fun m!1415649 () Bool)

(assert (=> start!130700 m!1415649))

(declare-fun m!1415651 () Bool)

(assert (=> b!1532939 m!1415651))

(assert (=> b!1532939 m!1415651))

(declare-fun m!1415653 () Bool)

(assert (=> b!1532939 m!1415653))

(declare-fun m!1415655 () Bool)

(assert (=> b!1532937 m!1415655))

(declare-fun m!1415657 () Bool)

(assert (=> b!1532935 m!1415657))

(push 1)

(assert (not b!1532939))

(assert (not start!130700))

(assert (not b!1532938))

(assert (not b!1532935))

(assert (not b!1532937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

