; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137080 () Bool)

(assert start!137080)

(declare-fun res!1079158 () Bool)

(declare-fun e!881819 () Bool)

(assert (=> start!137080 (=> (not res!1079158) (not e!881819))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137080 (= res!1079158 (validMask!0 mask!918))))

(assert (=> start!137080 e!881819))

(assert (=> start!137080 true))

(declare-datatypes ((array!105842 0))(
  ( (array!105843 (arr!51025 (Array (_ BitVec 32) (_ BitVec 64))) (size!51576 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105842)

(declare-fun array_inv!39980 (array!105842) Bool)

(assert (=> start!137080 (array_inv!39980 _keys!614)))

(declare-fun b!1580686 () Bool)

(declare-fun res!1079159 () Bool)

(assert (=> b!1580686 (=> (not res!1079159) (not e!881819))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580686 (= res!1079159 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51576 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51025 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580687 () Bool)

(declare-fun res!1079157 () Bool)

(assert (=> b!1580687 (=> (not res!1079157) (not e!881819))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580687 (= res!1079157 (validKeyInArray!0 k0!772))))

(declare-fun b!1580688 () Bool)

(assert (=> b!1580688 (= e!881819 (bvsge ee!18 (size!51576 _keys!614)))))

(assert (= (and start!137080 res!1079158) b!1580686))

(assert (= (and b!1580686 res!1079159) b!1580687))

(assert (= (and b!1580687 res!1079157) b!1580688))

(declare-fun m!1452609 () Bool)

(assert (=> start!137080 m!1452609))

(declare-fun m!1452611 () Bool)

(assert (=> start!137080 m!1452611))

(declare-fun m!1452613 () Bool)

(assert (=> b!1580686 m!1452613))

(declare-fun m!1452615 () Bool)

(assert (=> b!1580687 m!1452615))

(check-sat (not start!137080) (not b!1580687))
(check-sat)
