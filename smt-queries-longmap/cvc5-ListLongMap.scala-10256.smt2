; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120588 () Bool)

(assert start!120588)

(declare-fun b!1404079 () Bool)

(declare-fun res!942590 () Bool)

(declare-fun e!794920 () Bool)

(assert (=> b!1404079 (=> (not res!942590) (not e!794920))))

(declare-datatypes ((array!95997 0))(
  ( (array!95998 (arr!46349 (Array (_ BitVec 32) (_ BitVec 64))) (size!46899 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95997)

(declare-datatypes ((List!32868 0))(
  ( (Nil!32865) (Cons!32864 (h!34112 (_ BitVec 64)) (t!47562 List!32868)) )
))
(declare-fun arrayNoDuplicates!0 (array!95997 (_ BitVec 32) List!32868) Bool)

(assert (=> b!1404079 (= res!942590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32865))))

(declare-fun b!1404080 () Bool)

(declare-fun res!942595 () Bool)

(assert (=> b!1404080 (=> (not res!942595) (not e!794920))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404080 (= res!942595 (validKeyInArray!0 (select (arr!46349 a!2901) i!1037)))))

(declare-fun b!1404081 () Bool)

(declare-fun res!942591 () Bool)

(assert (=> b!1404081 (=> (not res!942591) (not e!794920))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95997 (_ BitVec 32)) Bool)

(assert (=> b!1404081 (= res!942591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404082 () Bool)

(declare-fun res!942592 () Bool)

(assert (=> b!1404082 (=> (not res!942592) (not e!794920))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404082 (= res!942592 (and (= (size!46899 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46899 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46899 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942594 () Bool)

(assert (=> start!120588 (=> (not res!942594) (not e!794920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120588 (= res!942594 (validMask!0 mask!2840))))

(assert (=> start!120588 e!794920))

(assert (=> start!120588 true))

(declare-fun array_inv!35377 (array!95997) Bool)

(assert (=> start!120588 (array_inv!35377 a!2901)))

(declare-fun b!1404083 () Bool)

(assert (=> b!1404083 (= e!794920 false)))

(declare-fun lt!618585 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404083 (= lt!618585 (toIndex!0 (select (arr!46349 a!2901) j!112) mask!2840))))

(declare-fun b!1404084 () Bool)

(declare-fun res!942593 () Bool)

(assert (=> b!1404084 (=> (not res!942593) (not e!794920))))

(assert (=> b!1404084 (= res!942593 (validKeyInArray!0 (select (arr!46349 a!2901) j!112)))))

(assert (= (and start!120588 res!942594) b!1404082))

(assert (= (and b!1404082 res!942592) b!1404080))

(assert (= (and b!1404080 res!942595) b!1404084))

(assert (= (and b!1404084 res!942593) b!1404081))

(assert (= (and b!1404081 res!942591) b!1404079))

(assert (= (and b!1404079 res!942590) b!1404083))

(declare-fun m!1292883 () Bool)

(assert (=> start!120588 m!1292883))

(declare-fun m!1292885 () Bool)

(assert (=> start!120588 m!1292885))

(declare-fun m!1292887 () Bool)

(assert (=> b!1404079 m!1292887))

(declare-fun m!1292889 () Bool)

(assert (=> b!1404080 m!1292889))

(assert (=> b!1404080 m!1292889))

(declare-fun m!1292891 () Bool)

(assert (=> b!1404080 m!1292891))

(declare-fun m!1292893 () Bool)

(assert (=> b!1404084 m!1292893))

(assert (=> b!1404084 m!1292893))

(declare-fun m!1292895 () Bool)

(assert (=> b!1404084 m!1292895))

(declare-fun m!1292897 () Bool)

(assert (=> b!1404081 m!1292897))

(assert (=> b!1404083 m!1292893))

(assert (=> b!1404083 m!1292893))

(declare-fun m!1292899 () Bool)

(assert (=> b!1404083 m!1292899))

(push 1)

(assert (not b!1404084))

(assert (not b!1404079))

(assert (not b!1404081))

(assert (not start!120588))

(assert (not b!1404080))

(assert (not b!1404083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

