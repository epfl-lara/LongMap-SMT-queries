; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136990 () Bool)

(assert start!136990)

(declare-fun res!1078806 () Bool)

(declare-fun e!881620 () Bool)

(assert (=> start!136990 (=> (not res!1078806) (not e!881620))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136990 (= res!1078806 (validMask!0 mask!918))))

(assert (=> start!136990 e!881620))

(assert (=> start!136990 true))

(declare-datatypes ((array!105773 0))(
  ( (array!105774 (arr!50992 (Array (_ BitVec 32) (_ BitVec 64))) (size!51543 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105773)

(declare-fun array_inv!39947 (array!105773) Bool)

(assert (=> start!136990 (array_inv!39947 _keys!614)))

(declare-fun b!1580335 () Bool)

(declare-fun res!1078808 () Bool)

(assert (=> b!1580335 (=> (not res!1078808) (not e!881620))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580335 (= res!1078808 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51543 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50992 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580336 () Bool)

(declare-fun res!1078807 () Bool)

(assert (=> b!1580336 (=> (not res!1078807) (not e!881620))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580336 (= res!1078807 (validKeyInArray!0 k0!772))))

(declare-fun b!1580337 () Bool)

(assert (=> b!1580337 (= e!881620 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50992 _keys!614) ee!18) k0!772)) (not (= (select (arr!50992 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 x!466) #b00000000000000000000000000000000)))))

(assert (= (and start!136990 res!1078806) b!1580335))

(assert (= (and b!1580335 res!1078808) b!1580336))

(assert (= (and b!1580336 res!1078807) b!1580337))

(declare-fun m!1452249 () Bool)

(assert (=> start!136990 m!1452249))

(declare-fun m!1452251 () Bool)

(assert (=> start!136990 m!1452251))

(declare-fun m!1452253 () Bool)

(assert (=> b!1580335 m!1452253))

(declare-fun m!1452255 () Bool)

(assert (=> b!1580336 m!1452255))

(declare-fun m!1452257 () Bool)

(assert (=> b!1580337 m!1452257))

(check-sat (not b!1580336) (not start!136990))
(check-sat)
