; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135484 () Bool)

(assert start!135484)

(declare-fun res!1075347 () Bool)

(declare-fun e!878429 () Bool)

(assert (=> start!135484 (=> (not res!1075347) (not e!878429))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135484 (= res!1075347 (validMask!0 mask!889))))

(assert (=> start!135484 e!878429))

(assert (=> start!135484 true))

(declare-datatypes ((array!105156 0))(
  ( (array!105157 (arr!50733 (Array (_ BitVec 32) (_ BitVec 64))) (size!51284 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105156)

(declare-fun array_inv!39688 (array!105156) Bool)

(assert (=> start!135484 (array_inv!39688 _keys!600)))

(declare-fun b!1575061 () Bool)

(declare-fun res!1075349 () Bool)

(assert (=> b!1575061 (=> (not res!1075349) (not e!878429))))

(assert (=> b!1575061 (= res!1075349 (= (size!51284 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575062 () Bool)

(declare-fun res!1075348 () Bool)

(assert (=> b!1575062 (=> (not res!1075348) (not e!878429))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575062 (= res!1075348 (validKeyInArray!0 k!754))))

(declare-fun b!1575063 () Bool)

(assert (=> b!1575063 (= e!878429 false)))

(declare-datatypes ((SeekEntryResult!13540 0))(
  ( (MissingZero!13540 (index!56558 (_ BitVec 32))) (Found!13540 (index!56559 (_ BitVec 32))) (Intermediate!13540 (undefined!14352 Bool) (index!56560 (_ BitVec 32)) (x!141545 (_ BitVec 32))) (Undefined!13540) (MissingVacant!13540 (index!56561 (_ BitVec 32))) )
))
(declare-fun lt!674973 () SeekEntryResult!13540)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105156 (_ BitVec 32)) SeekEntryResult!13540)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575063 (= lt!674973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135484 res!1075347) b!1575061))

(assert (= (and b!1575061 res!1075349) b!1575062))

(assert (= (and b!1575062 res!1075348) b!1575063))

(declare-fun m!1448549 () Bool)

(assert (=> start!135484 m!1448549))

(declare-fun m!1448551 () Bool)

(assert (=> start!135484 m!1448551))

(declare-fun m!1448553 () Bool)

(assert (=> b!1575062 m!1448553))

(declare-fun m!1448555 () Bool)

(assert (=> b!1575063 m!1448555))

(assert (=> b!1575063 m!1448555))

(declare-fun m!1448557 () Bool)

(assert (=> b!1575063 m!1448557))

(push 1)

(assert (not start!135484))

(assert (not b!1575063))

(assert (not b!1575062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

