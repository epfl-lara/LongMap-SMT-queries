; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136612 () Bool)

(assert start!136612)

(declare-fun res!1078142 () Bool)

(declare-fun e!880094 () Bool)

(assert (=> start!136612 (=> (not res!1078142) (not e!880094))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136612 (= res!1078142 (validMask!0 mask!918))))

(assert (=> start!136612 e!880094))

(assert (=> start!136612 true))

(declare-datatypes ((array!105641 0))(
  ( (array!105642 (arr!50933 (Array (_ BitVec 32) (_ BitVec 64))) (size!51485 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105641)

(declare-fun array_inv!39869 (array!105641) Bool)

(assert (=> start!136612 (array_inv!39869 _keys!614)))

(declare-fun b!1577910 () Bool)

(declare-fun res!1078141 () Bool)

(assert (=> b!1577910 (=> (not res!1078141) (not e!880094))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577910 (= res!1078141 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51485 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50933 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577911 () Bool)

(declare-fun res!1078143 () Bool)

(assert (=> b!1577911 (=> (not res!1078143) (not e!880094))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577911 (= res!1078143 (validKeyInArray!0 k0!772))))

(declare-fun b!1577912 () Bool)

(assert (=> b!1577912 (= e!880094 (and (bvslt x!466 #b01111111111111111111111111111110) (= (select (arr!50933 _keys!614) ee!18) k0!772) (bvsge ee!18 (size!51485 _keys!614))))))

(assert (= (and start!136612 res!1078142) b!1577910))

(assert (= (and b!1577910 res!1078141) b!1577911))

(assert (= (and b!1577911 res!1078143) b!1577912))

(declare-fun m!1449429 () Bool)

(assert (=> start!136612 m!1449429))

(declare-fun m!1449431 () Bool)

(assert (=> start!136612 m!1449431))

(declare-fun m!1449433 () Bool)

(assert (=> b!1577910 m!1449433))

(declare-fun m!1449435 () Bool)

(assert (=> b!1577911 m!1449435))

(declare-fun m!1449437 () Bool)

(assert (=> b!1577912 m!1449437))

(check-sat (not start!136612) (not b!1577911))
(check-sat)
