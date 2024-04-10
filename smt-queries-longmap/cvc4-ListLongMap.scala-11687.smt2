; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136706 () Bool)

(assert start!136706)

(declare-fun b!1578431 () Bool)

(declare-fun res!1078424 () Bool)

(declare-fun e!880403 () Bool)

(assert (=> b!1578431 (=> (not res!1078424) (not e!880403))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105741 0))(
  ( (array!105742 (arr!50982 (Array (_ BitVec 32) (_ BitVec 64))) (size!51532 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105741)

(assert (=> b!1578431 (= res!1078424 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50982 _keys!614) ee!18) k!772)) (not (= (select (arr!50982 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578430 () Bool)

(declare-fun res!1078423 () Bool)

(assert (=> b!1578430 (=> (not res!1078423) (not e!880403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578430 (= res!1078423 (validKeyInArray!0 k!772))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun b!1578432 () Bool)

(declare-datatypes ((SeekEntryResult!13769 0))(
  ( (MissingZero!13769 (index!57474 (_ BitVec 32))) (Found!13769 (index!57475 (_ BitVec 32))) (Intermediate!13769 (undefined!14581 Bool) (index!57476 (_ BitVec 32)) (x!142735 (_ BitVec 32))) (Undefined!13769) (MissingVacant!13769 (index!57477 (_ BitVec 32))) )
))
(declare-fun lt!676261 () SeekEntryResult!13769)

(assert (=> b!1578432 (= e!880403 (and (not (is-Undefined!13769 lt!676261)) (not (is-Found!13769 lt!676261)) (is-MissingVacant!13769 lt!676261) (= (index!57477 lt!676261) vacantSpotIndex!10) (or (bvslt (index!57477 lt!676261) #b00000000000000000000000000000000) (bvsge (index!57477 lt!676261) (size!51532 _keys!614)))))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105741 (_ BitVec 32)) SeekEntryResult!13769)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578432 (= lt!676261 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun res!1078422 () Bool)

(assert (=> start!136706 (=> (not res!1078422) (not e!880403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136706 (= res!1078422 (validMask!0 mask!918))))

(assert (=> start!136706 e!880403))

(assert (=> start!136706 true))

(declare-fun array_inv!39709 (array!105741) Bool)

(assert (=> start!136706 (array_inv!39709 _keys!614)))

(declare-fun b!1578429 () Bool)

(declare-fun res!1078425 () Bool)

(assert (=> b!1578429 (=> (not res!1078425) (not e!880403))))

(assert (=> b!1578429 (= res!1078425 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51532 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50982 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136706 res!1078422) b!1578429))

(assert (= (and b!1578429 res!1078425) b!1578430))

(assert (= (and b!1578430 res!1078423) b!1578431))

(assert (= (and b!1578431 res!1078424) b!1578432))

(declare-fun m!1450523 () Bool)

(assert (=> b!1578429 m!1450523))

(declare-fun m!1450525 () Bool)

(assert (=> start!136706 m!1450525))

(declare-fun m!1450527 () Bool)

(assert (=> start!136706 m!1450527))

(declare-fun m!1450529 () Bool)

(assert (=> b!1578430 m!1450529))

(declare-fun m!1450531 () Bool)

(assert (=> b!1578431 m!1450531))

(declare-fun m!1450533 () Bool)

(assert (=> b!1578432 m!1450533))

(assert (=> b!1578432 m!1450533))

(declare-fun m!1450535 () Bool)

(assert (=> b!1578432 m!1450535))

(push 1)

(assert (not b!1578432))

(assert (not b!1578430))

(assert (not start!136706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

