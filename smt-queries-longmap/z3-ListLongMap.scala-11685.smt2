; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137086 () Bool)

(assert start!137086)

(declare-fun res!1079186 () Bool)

(declare-fun e!881837 () Bool)

(assert (=> start!137086 (=> (not res!1079186) (not e!881837))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137086 (= res!1079186 (validMask!0 mask!918))))

(assert (=> start!137086 e!881837))

(assert (=> start!137086 true))

(declare-datatypes ((array!105848 0))(
  ( (array!105849 (arr!51028 (Array (_ BitVec 32) (_ BitVec 64))) (size!51579 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105848)

(declare-fun array_inv!39983 (array!105848) Bool)

(assert (=> start!137086 (array_inv!39983 _keys!614)))

(declare-fun b!1580713 () Bool)

(declare-fun res!1079184 () Bool)

(assert (=> b!1580713 (=> (not res!1079184) (not e!881837))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580713 (= res!1079184 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51579 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51028 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580714 () Bool)

(declare-fun res!1079185 () Bool)

(assert (=> b!1580714 (=> (not res!1079185) (not e!881837))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580714 (= res!1079185 (validKeyInArray!0 k0!772))))

(declare-fun b!1580715 () Bool)

(assert (=> b!1580715 (= e!881837 (and (bvslt x!466 #b01111111111111111111111111111110) (= (select (arr!51028 _keys!614) ee!18) k0!772) (bvsge ee!18 (size!51579 _keys!614))))))

(assert (= (and start!137086 res!1079186) b!1580713))

(assert (= (and b!1580713 res!1079184) b!1580714))

(assert (= (and b!1580714 res!1079185) b!1580715))

(declare-fun m!1452633 () Bool)

(assert (=> start!137086 m!1452633))

(declare-fun m!1452635 () Bool)

(assert (=> start!137086 m!1452635))

(declare-fun m!1452637 () Bool)

(assert (=> b!1580713 m!1452637))

(declare-fun m!1452639 () Bool)

(assert (=> b!1580714 m!1452639))

(declare-fun m!1452641 () Bool)

(assert (=> b!1580715 m!1452641))

(check-sat (not start!137086) (not b!1580714))
(check-sat)
