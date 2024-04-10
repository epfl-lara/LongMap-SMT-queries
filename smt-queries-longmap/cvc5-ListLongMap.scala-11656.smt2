; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136318 () Bool)

(assert start!136318)

(declare-fun b!1577019 () Bool)

(declare-fun res!1077284 () Bool)

(declare-fun e!879626 () Bool)

(assert (=> b!1577019 (=> (not res!1077284) (not e!879626))))

(declare-fun x!458 () (_ BitVec 32))

(declare-datatypes ((array!105530 0))(
  ( (array!105531 (arr!50887 (Array (_ BitVec 32) (_ BitVec 64))) (size!51437 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105530)

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577019 (= res!1077284 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51437 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577020 () Bool)

(declare-fun res!1077285 () Bool)

(assert (=> b!1577020 (=> (not res!1077285) (not e!879626))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577020 (= res!1077285 (validKeyInArray!0 k!768))))

(declare-fun b!1577022 () Bool)

(assert (=> b!1577022 (= e!879626 false)))

(declare-fun lt!675913 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577022 (= lt!675913 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577021 () Bool)

(declare-fun res!1077282 () Bool)

(assert (=> b!1577021 (=> (not res!1077282) (not e!879626))))

(assert (=> b!1577021 (= res!1077282 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50887 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50887 _keys!610) ee!12) (select (arr!50887 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077283 () Bool)

(assert (=> start!136318 (=> (not res!1077283) (not e!879626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136318 (= res!1077283 (validMask!0 mask!910))))

(assert (=> start!136318 e!879626))

(assert (=> start!136318 true))

(declare-fun array_inv!39614 (array!105530) Bool)

(assert (=> start!136318 (array_inv!39614 _keys!610)))

(assert (= (and start!136318 res!1077283) b!1577019))

(assert (= (and b!1577019 res!1077284) b!1577020))

(assert (= (and b!1577020 res!1077285) b!1577021))

(assert (= (and b!1577021 res!1077282) b!1577022))

(declare-fun m!1449355 () Bool)

(assert (=> b!1577020 m!1449355))

(declare-fun m!1449357 () Bool)

(assert (=> b!1577022 m!1449357))

(declare-fun m!1449359 () Bool)

(assert (=> b!1577021 m!1449359))

(declare-fun m!1449361 () Bool)

(assert (=> start!136318 m!1449361))

(declare-fun m!1449363 () Bool)

(assert (=> start!136318 m!1449363))

(push 1)

(assert (not b!1577022))

(assert (not start!136318))

(assert (not b!1577020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

