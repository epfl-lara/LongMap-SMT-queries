; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136670 () Bool)

(assert start!136670)

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13769 0))(
  ( (MissingZero!13769 (index!57474 (_ BitVec 32))) (Found!13769 (index!57475 (_ BitVec 32))) (Intermediate!13769 (undefined!14581 Bool) (index!57476 (_ BitVec 32)) (x!142730 (_ BitVec 32))) (Undefined!13769) (MissingVacant!13769 (index!57477 (_ BitVec 32))) )
))
(declare-fun lt!675975 () SeekEntryResult!13769)

(declare-fun e!880204 () Bool)

(declare-fun b!1578119 () Bool)

(declare-datatypes ((array!105672 0))(
  ( (array!105673 (arr!50947 (Array (_ BitVec 32) (_ BitVec 64))) (size!51499 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105672)

(assert (=> b!1578119 (= e!880204 (and (not (is-Undefined!13769 lt!675975)) (not (is-Found!13769 lt!675975)) (is-MissingVacant!13769 lt!675975) (= (index!57477 lt!675975) vacantSpotIndex!10) (or (bvslt (index!57477 lt!675975) #b00000000000000000000000000000000) (bvsge (index!57477 lt!675975) (size!51499 _keys!614)))))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105672 (_ BitVec 32)) SeekEntryResult!13769)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578119 (= lt!675975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1578118 () Bool)

(declare-fun res!1078295 () Bool)

(assert (=> b!1578118 (=> (not res!1078295) (not e!880204))))

(assert (=> b!1578118 (= res!1078295 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50947 _keys!614) ee!18) k!772)) (not (= (select (arr!50947 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578116 () Bool)

(declare-fun res!1078296 () Bool)

(assert (=> b!1578116 (=> (not res!1078296) (not e!880204))))

(assert (=> b!1578116 (= res!1078296 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51499 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50947 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578117 () Bool)

(declare-fun res!1078293 () Bool)

(assert (=> b!1578117 (=> (not res!1078293) (not e!880204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578117 (= res!1078293 (validKeyInArray!0 k!772))))

(declare-fun res!1078294 () Bool)

(assert (=> start!136670 (=> (not res!1078294) (not e!880204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136670 (= res!1078294 (validMask!0 mask!918))))

(assert (=> start!136670 e!880204))

(assert (=> start!136670 true))

(declare-fun array_inv!39883 (array!105672) Bool)

(assert (=> start!136670 (array_inv!39883 _keys!614)))

(assert (= (and start!136670 res!1078294) b!1578116))

(assert (= (and b!1578116 res!1078296) b!1578117))

(assert (= (and b!1578117 res!1078293) b!1578118))

(assert (= (and b!1578118 res!1078295) b!1578119))

(declare-fun m!1449631 () Bool)

(assert (=> b!1578119 m!1449631))

(assert (=> b!1578119 m!1449631))

(declare-fun m!1449633 () Bool)

(assert (=> b!1578119 m!1449633))

(declare-fun m!1449635 () Bool)

(assert (=> b!1578118 m!1449635))

(declare-fun m!1449637 () Bool)

(assert (=> b!1578116 m!1449637))

(declare-fun m!1449639 () Bool)

(assert (=> b!1578117 m!1449639))

(declare-fun m!1449641 () Bool)

(assert (=> start!136670 m!1449641))

(declare-fun m!1449643 () Bool)

(assert (=> start!136670 m!1449643))

(push 1)

(assert (not b!1578119))

(assert (not start!136670))

(assert (not b!1578117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

