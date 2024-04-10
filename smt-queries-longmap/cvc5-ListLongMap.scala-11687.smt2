; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136702 () Bool)

(assert start!136702)

(declare-fun b!1578407 () Bool)

(declare-fun res!1078400 () Bool)

(declare-fun e!880391 () Bool)

(assert (=> b!1578407 (=> (not res!1078400) (not e!880391))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105737 0))(
  ( (array!105738 (arr!50980 (Array (_ BitVec 32) (_ BitVec 64))) (size!51530 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105737)

(assert (=> b!1578407 (= res!1078400 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50980 _keys!614) ee!18) k!772)) (not (= (select (arr!50980 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578406 () Bool)

(declare-fun res!1078398 () Bool)

(assert (=> b!1578406 (=> (not res!1078398) (not e!880391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578406 (= res!1078398 (validKeyInArray!0 k!772))))

(declare-fun b!1578405 () Bool)

(declare-fun res!1078399 () Bool)

(assert (=> b!1578405 (=> (not res!1078399) (not e!880391))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1578405 (= res!1078399 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51530 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50980 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1078401 () Bool)

(assert (=> start!136702 (=> (not res!1078401) (not e!880391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136702 (= res!1078401 (validMask!0 mask!918))))

(assert (=> start!136702 e!880391))

(assert (=> start!136702 true))

(declare-fun array_inv!39707 (array!105737) Bool)

(assert (=> start!136702 (array_inv!39707 _keys!614)))

(declare-datatypes ((SeekEntryResult!13767 0))(
  ( (MissingZero!13767 (index!57466 (_ BitVec 32))) (Found!13767 (index!57467 (_ BitVec 32))) (Intermediate!13767 (undefined!14579 Bool) (index!57468 (_ BitVec 32)) (x!142733 (_ BitVec 32))) (Undefined!13767) (MissingVacant!13767 (index!57469 (_ BitVec 32))) )
))
(declare-fun lt!676255 () SeekEntryResult!13767)

(declare-fun b!1578408 () Bool)

(assert (=> b!1578408 (= e!880391 (and (not (is-Undefined!13767 lt!676255)) (not (is-Found!13767 lt!676255)) (is-MissingVacant!13767 lt!676255) (= (index!57469 lt!676255) vacantSpotIndex!10) (or (bvslt (index!57469 lt!676255) #b00000000000000000000000000000000) (bvsge (index!57469 lt!676255) (size!51530 _keys!614)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105737 (_ BitVec 32)) SeekEntryResult!13767)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578408 (= lt!676255 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(assert (= (and start!136702 res!1078401) b!1578405))

(assert (= (and b!1578405 res!1078399) b!1578406))

(assert (= (and b!1578406 res!1078398) b!1578407))

(assert (= (and b!1578407 res!1078400) b!1578408))

(declare-fun m!1450495 () Bool)

(assert (=> b!1578406 m!1450495))

(declare-fun m!1450497 () Bool)

(assert (=> b!1578405 m!1450497))

(declare-fun m!1450499 () Bool)

(assert (=> b!1578407 m!1450499))

(declare-fun m!1450501 () Bool)

(assert (=> start!136702 m!1450501))

(declare-fun m!1450503 () Bool)

(assert (=> start!136702 m!1450503))

(declare-fun m!1450505 () Bool)

(assert (=> b!1578408 m!1450505))

(assert (=> b!1578408 m!1450505))

(declare-fun m!1450507 () Bool)

(assert (=> b!1578408 m!1450507))

(push 1)

(assert (not b!1578408))

(assert (not b!1578406))

(assert (not start!136702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

