; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137092 () Bool)

(assert start!137092)

(declare-fun res!1079212 () Bool)

(declare-fun e!881855 () Bool)

(assert (=> start!137092 (=> (not res!1079212) (not e!881855))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137092 (= res!1079212 (validMask!0 mask!918))))

(assert (=> start!137092 e!881855))

(assert (=> start!137092 true))

(declare-datatypes ((array!105854 0))(
  ( (array!105855 (arr!51031 (Array (_ BitVec 32) (_ BitVec 64))) (size!51582 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105854)

(declare-fun array_inv!39986 (array!105854) Bool)

(assert (=> start!137092 (array_inv!39986 _keys!614)))

(declare-fun b!1580740 () Bool)

(declare-fun res!1079213 () Bool)

(assert (=> b!1580740 (=> (not res!1079213) (not e!881855))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580740 (= res!1079213 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51582 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51031 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580741 () Bool)

(declare-fun res!1079211 () Bool)

(assert (=> b!1580741 (=> (not res!1079211) (not e!881855))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580741 (= res!1079211 (validKeyInArray!0 k0!772))))

(declare-fun b!1580742 () Bool)

(assert (=> b!1580742 (= e!881855 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51031 _keys!614) ee!18) k0!772)) (= (select (arr!51031 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!10 (size!51582 _keys!614))))))

(assert (= (and start!137092 res!1079212) b!1580740))

(assert (= (and b!1580740 res!1079213) b!1580741))

(assert (= (and b!1580741 res!1079211) b!1580742))

(declare-fun m!1452663 () Bool)

(assert (=> start!137092 m!1452663))

(declare-fun m!1452665 () Bool)

(assert (=> start!137092 m!1452665))

(declare-fun m!1452667 () Bool)

(assert (=> b!1580740 m!1452667))

(declare-fun m!1452669 () Bool)

(assert (=> b!1580741 m!1452669))

(declare-fun m!1452671 () Bool)

(assert (=> b!1580742 m!1452671))

(check-sat (not start!137092) (not b!1580741))
(check-sat)
