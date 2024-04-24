; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137074 () Bool)

(assert start!137074)

(declare-fun res!1079130 () Bool)

(declare-fun e!881800 () Bool)

(assert (=> start!137074 (=> (not res!1079130) (not e!881800))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137074 (= res!1079130 (validMask!0 mask!918))))

(assert (=> start!137074 e!881800))

(assert (=> start!137074 true))

(declare-datatypes ((array!105836 0))(
  ( (array!105837 (arr!51022 (Array (_ BitVec 32) (_ BitVec 64))) (size!51573 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105836)

(declare-fun array_inv!39977 (array!105836) Bool)

(assert (=> start!137074 (array_inv!39977 _keys!614)))

(declare-fun b!1580659 () Bool)

(declare-fun res!1079131 () Bool)

(assert (=> b!1580659 (=> (not res!1079131) (not e!881800))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580659 (= res!1079131 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51573 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51022 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580660 () Bool)

(declare-fun res!1079132 () Bool)

(assert (=> b!1580660 (=> (not res!1079132) (not e!881800))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580660 (= res!1079132 (validKeyInArray!0 k0!772))))

(declare-fun b!1580661 () Bool)

(assert (=> b!1580661 (= e!881800 (bvslt (bvsub #b01111111111111111111111111111111 x!466) #b00000000000000000000000000000000))))

(assert (= (and start!137074 res!1079130) b!1580659))

(assert (= (and b!1580659 res!1079131) b!1580660))

(assert (= (and b!1580660 res!1079132) b!1580661))

(declare-fun m!1452585 () Bool)

(assert (=> start!137074 m!1452585))

(declare-fun m!1452587 () Bool)

(assert (=> start!137074 m!1452587))

(declare-fun m!1452589 () Bool)

(assert (=> b!1580659 m!1452589))

(declare-fun m!1452591 () Bool)

(assert (=> b!1580660 m!1452591))

(check-sat (not b!1580660) (not start!137074))
(check-sat)
