; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136412 () Bool)

(assert start!136412)

(declare-fun b!1577394 () Bool)

(declare-fun res!1077658 () Bool)

(declare-fun e!879836 () Bool)

(assert (=> b!1577394 (=> (not res!1077658) (not e!879836))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105603 0))(
  ( (array!105604 (arr!50922 (Array (_ BitVec 32) (_ BitVec 64))) (size!51472 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105603)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577394 (= res!1077658 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51472 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577397 () Bool)

(assert (=> b!1577397 (= e!879836 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!458)) (bvsub #b01111111111111111111111111111110 x!458)))))

(declare-fun lt!675982 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577397 (= lt!675982 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077657 () Bool)

(assert (=> start!136412 (=> (not res!1077657) (not e!879836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136412 (= res!1077657 (validMask!0 mask!910))))

(assert (=> start!136412 e!879836))

(assert (=> start!136412 true))

(declare-fun array_inv!39649 (array!105603) Bool)

(assert (=> start!136412 (array_inv!39649 _keys!610)))

(declare-fun b!1577395 () Bool)

(declare-fun res!1077659 () Bool)

(assert (=> b!1577395 (=> (not res!1077659) (not e!879836))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577395 (= res!1077659 (validKeyInArray!0 k!768))))

(declare-fun b!1577396 () Bool)

(declare-fun res!1077660 () Bool)

(assert (=> b!1577396 (=> (not res!1077660) (not e!879836))))

(assert (=> b!1577396 (= res!1077660 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50922 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50922 _keys!610) ee!12) (select (arr!50922 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136412 res!1077657) b!1577394))

(assert (= (and b!1577394 res!1077658) b!1577395))

(assert (= (and b!1577395 res!1077659) b!1577396))

(assert (= (and b!1577396 res!1077660) b!1577397))

(declare-fun m!1449675 () Bool)

(assert (=> b!1577397 m!1449675))

(declare-fun m!1449677 () Bool)

(assert (=> start!136412 m!1449677))

(declare-fun m!1449679 () Bool)

(assert (=> start!136412 m!1449679))

(declare-fun m!1449681 () Bool)

(assert (=> b!1577395 m!1449681))

(declare-fun m!1449683 () Bool)

(assert (=> b!1577396 m!1449683))

(push 1)

(assert (not b!1577395))

(assert (not start!136412))

(assert (not b!1577397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

