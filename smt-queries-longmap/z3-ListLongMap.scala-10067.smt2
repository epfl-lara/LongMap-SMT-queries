; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118538 () Bool)

(assert start!118538)

(declare-fun b!1385847 () Bool)

(declare-fun e!785180 () Bool)

(assert (=> b!1385847 (= e!785180 false)))

(declare-fun lt!609330 () Bool)

(declare-datatypes ((array!94814 0))(
  ( (array!94815 (arr!45783 (Array (_ BitVec 32) (_ BitVec 64))) (size!46333 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94814)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94814 (_ BitVec 32)) Bool)

(assert (=> b!1385847 (= lt!609330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385844 () Bool)

(declare-fun res!927095 () Bool)

(assert (=> b!1385844 (=> (not res!927095) (not e!785180))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385844 (= res!927095 (and (= (size!46333 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46333 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46333 a!2938))))))

(declare-fun b!1385846 () Bool)

(declare-fun res!927097 () Bool)

(assert (=> b!1385846 (=> (not res!927097) (not e!785180))))

(declare-datatypes ((List!32311 0))(
  ( (Nil!32308) (Cons!32307 (h!33516 (_ BitVec 64)) (t!47005 List!32311)) )
))
(declare-fun arrayNoDuplicates!0 (array!94814 (_ BitVec 32) List!32311) Bool)

(assert (=> b!1385846 (= res!927097 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32308))))

(declare-fun b!1385845 () Bool)

(declare-fun res!927096 () Bool)

(assert (=> b!1385845 (=> (not res!927096) (not e!785180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385845 (= res!927096 (validKeyInArray!0 (select (arr!45783 a!2938) i!1065)))))

(declare-fun res!927094 () Bool)

(assert (=> start!118538 (=> (not res!927094) (not e!785180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118538 (= res!927094 (validMask!0 mask!2987))))

(assert (=> start!118538 e!785180))

(assert (=> start!118538 true))

(declare-fun array_inv!34811 (array!94814) Bool)

(assert (=> start!118538 (array_inv!34811 a!2938)))

(assert (= (and start!118538 res!927094) b!1385844))

(assert (= (and b!1385844 res!927095) b!1385845))

(assert (= (and b!1385845 res!927096) b!1385846))

(assert (= (and b!1385846 res!927097) b!1385847))

(declare-fun m!1271121 () Bool)

(assert (=> b!1385847 m!1271121))

(declare-fun m!1271123 () Bool)

(assert (=> b!1385846 m!1271123))

(declare-fun m!1271125 () Bool)

(assert (=> b!1385845 m!1271125))

(assert (=> b!1385845 m!1271125))

(declare-fun m!1271127 () Bool)

(assert (=> b!1385845 m!1271127))

(declare-fun m!1271129 () Bool)

(assert (=> start!118538 m!1271129))

(declare-fun m!1271131 () Bool)

(assert (=> start!118538 m!1271131))

(check-sat (not b!1385845) (not b!1385846) (not start!118538) (not b!1385847))
