; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118544 () Bool)

(assert start!118544)

(declare-fun b!1385881 () Bool)

(declare-fun res!927132 () Bool)

(declare-fun e!785198 () Bool)

(assert (=> b!1385881 (=> (not res!927132) (not e!785198))))

(declare-datatypes ((array!94820 0))(
  ( (array!94821 (arr!45786 (Array (_ BitVec 32) (_ BitVec 64))) (size!46336 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94820)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385881 (= res!927132 (validKeyInArray!0 (select (arr!45786 a!2938) i!1065)))))

(declare-fun res!927130 () Bool)

(assert (=> start!118544 (=> (not res!927130) (not e!785198))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118544 (= res!927130 (validMask!0 mask!2987))))

(assert (=> start!118544 e!785198))

(assert (=> start!118544 true))

(declare-fun array_inv!34814 (array!94820) Bool)

(assert (=> start!118544 (array_inv!34814 a!2938)))

(declare-fun b!1385882 () Bool)

(declare-fun res!927133 () Bool)

(assert (=> b!1385882 (=> (not res!927133) (not e!785198))))

(declare-datatypes ((List!32314 0))(
  ( (Nil!32311) (Cons!32310 (h!33519 (_ BitVec 64)) (t!47008 List!32314)) )
))
(declare-fun arrayNoDuplicates!0 (array!94820 (_ BitVec 32) List!32314) Bool)

(assert (=> b!1385882 (= res!927133 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32311))))

(declare-fun b!1385883 () Bool)

(assert (=> b!1385883 (= e!785198 false)))

(declare-fun lt!609339 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94820 (_ BitVec 32)) Bool)

(assert (=> b!1385883 (= lt!609339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385880 () Bool)

(declare-fun res!927131 () Bool)

(assert (=> b!1385880 (=> (not res!927131) (not e!785198))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385880 (= res!927131 (and (= (size!46336 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46336 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46336 a!2938))))))

(assert (= (and start!118544 res!927130) b!1385880))

(assert (= (and b!1385880 res!927131) b!1385881))

(assert (= (and b!1385881 res!927132) b!1385882))

(assert (= (and b!1385882 res!927133) b!1385883))

(declare-fun m!1271157 () Bool)

(assert (=> b!1385881 m!1271157))

(assert (=> b!1385881 m!1271157))

(declare-fun m!1271159 () Bool)

(assert (=> b!1385881 m!1271159))

(declare-fun m!1271161 () Bool)

(assert (=> start!118544 m!1271161))

(declare-fun m!1271163 () Bool)

(assert (=> start!118544 m!1271163))

(declare-fun m!1271165 () Bool)

(assert (=> b!1385882 m!1271165))

(declare-fun m!1271167 () Bool)

(assert (=> b!1385883 m!1271167))

(check-sat (not b!1385883) (not b!1385882) (not start!118544) (not b!1385881))
