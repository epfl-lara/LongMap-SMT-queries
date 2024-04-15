; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136606 () Bool)

(assert start!136606)

(declare-fun res!1078116 () Bool)

(declare-fun e!880075 () Bool)

(assert (=> start!136606 (=> (not res!1078116) (not e!880075))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136606 (= res!1078116 (validMask!0 mask!918))))

(assert (=> start!136606 e!880075))

(assert (=> start!136606 true))

(declare-datatypes ((array!105635 0))(
  ( (array!105636 (arr!50930 (Array (_ BitVec 32) (_ BitVec 64))) (size!51482 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105635)

(declare-fun array_inv!39866 (array!105635) Bool)

(assert (=> start!136606 (array_inv!39866 _keys!614)))

(declare-fun b!1577883 () Bool)

(declare-fun res!1078115 () Bool)

(assert (=> b!1577883 (=> (not res!1078115) (not e!880075))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577883 (= res!1078115 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51482 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50930 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577884 () Bool)

(declare-fun res!1078114 () Bool)

(assert (=> b!1577884 (=> (not res!1078114) (not e!880075))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577884 (= res!1078114 (validKeyInArray!0 k0!772))))

(declare-fun b!1577885 () Bool)

(assert (=> b!1577885 (= e!880075 (bvsge ee!18 (size!51482 _keys!614)))))

(assert (= (and start!136606 res!1078116) b!1577883))

(assert (= (and b!1577883 res!1078115) b!1577884))

(assert (= (and b!1577884 res!1078114) b!1577885))

(declare-fun m!1449405 () Bool)

(assert (=> start!136606 m!1449405))

(declare-fun m!1449407 () Bool)

(assert (=> start!136606 m!1449407))

(declare-fun m!1449409 () Bool)

(assert (=> b!1577883 m!1449409))

(declare-fun m!1449411 () Bool)

(assert (=> b!1577884 m!1449411))

(check-sat (not start!136606) (not b!1577884))
(check-sat)
