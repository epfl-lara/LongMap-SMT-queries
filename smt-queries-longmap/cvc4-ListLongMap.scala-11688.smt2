; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136712 () Bool)

(assert start!136712)

(declare-fun b!1578467 () Bool)

(declare-fun res!1078458 () Bool)

(declare-fun e!880420 () Bool)

(assert (=> b!1578467 (=> (not res!1078458) (not e!880420))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105747 0))(
  ( (array!105748 (arr!50985 (Array (_ BitVec 32) (_ BitVec 64))) (size!51535 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105747)

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1578467 (= res!1078458 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50985 _keys!614) ee!18) k!772)) (not (= (select (arr!50985 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578465 () Bool)

(declare-fun res!1078459 () Bool)

(assert (=> b!1578465 (=> (not res!1078459) (not e!880420))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1578465 (= res!1078459 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51535 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50985 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578466 () Bool)

(declare-fun res!1078460 () Bool)

(assert (=> b!1578466 (=> (not res!1078460) (not e!880420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578466 (= res!1078460 (validKeyInArray!0 k!772))))

(declare-fun res!1078461 () Bool)

(assert (=> start!136712 (=> (not res!1078461) (not e!880420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136712 (= res!1078461 (validMask!0 mask!918))))

(assert (=> start!136712 e!880420))

(assert (=> start!136712 true))

(declare-fun array_inv!39712 (array!105747) Bool)

(assert (=> start!136712 (array_inv!39712 _keys!614)))

(declare-datatypes ((SeekEntryResult!13772 0))(
  ( (MissingZero!13772 (index!57486 (_ BitVec 32))) (Found!13772 (index!57487 (_ BitVec 32))) (Intermediate!13772 (undefined!14584 Bool) (index!57488 (_ BitVec 32)) (x!142746 (_ BitVec 32))) (Undefined!13772) (MissingVacant!13772 (index!57489 (_ BitVec 32))) )
))
(declare-fun lt!676270 () SeekEntryResult!13772)

(declare-fun b!1578468 () Bool)

(assert (=> b!1578468 (= e!880420 (and (not (is-Undefined!13772 lt!676270)) (ite (is-Found!13772 lt!676270) (not (= (select (arr!50985 _keys!614) (index!57487 lt!676270)) k!772)) (or (not (is-MissingVacant!13772 lt!676270)) (not (= (index!57489 lt!676270) vacantSpotIndex!10)) (not (= (select (arr!50985 _keys!614) (index!57489 lt!676270)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105747 (_ BitVec 32)) SeekEntryResult!13772)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578468 (= lt!676270 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(assert (= (and start!136712 res!1078461) b!1578465))

(assert (= (and b!1578465 res!1078459) b!1578466))

(assert (= (and b!1578466 res!1078460) b!1578467))

(assert (= (and b!1578467 res!1078458) b!1578468))

(declare-fun m!1450573 () Bool)

(assert (=> b!1578466 m!1450573))

(declare-fun m!1450575 () Bool)

(assert (=> b!1578468 m!1450575))

(declare-fun m!1450577 () Bool)

(assert (=> b!1578468 m!1450577))

(declare-fun m!1450579 () Bool)

(assert (=> b!1578468 m!1450579))

(assert (=> b!1578468 m!1450579))

(declare-fun m!1450581 () Bool)

(assert (=> b!1578468 m!1450581))

(declare-fun m!1450583 () Bool)

(assert (=> start!136712 m!1450583))

(declare-fun m!1450585 () Bool)

(assert (=> start!136712 m!1450585))

(declare-fun m!1450587 () Bool)

(assert (=> b!1578467 m!1450587))

(declare-fun m!1450589 () Bool)

(assert (=> b!1578465 m!1450589))

(push 1)

(assert (not start!136712))

(assert (not b!1578466))

(assert (not b!1578468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

