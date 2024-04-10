; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135084 () Bool)

(assert start!135084)

(declare-fun res!1074542 () Bool)

(declare-fun e!876955 () Bool)

(assert (=> start!135084 (=> (not res!1074542) (not e!876955))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135084 (= res!1074542 (validMask!0 mask!889))))

(assert (=> start!135084 e!876955))

(assert (=> start!135084 true))

(declare-datatypes ((array!105046 0))(
  ( (array!105047 (arr!50685 (Array (_ BitVec 32) (_ BitVec 64))) (size!51235 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105046)

(declare-fun array_inv!39412 (array!105046) Bool)

(assert (=> start!135084 (array_inv!39412 _keys!600)))

(declare-fun b!1572679 () Bool)

(declare-fun res!1074541 () Bool)

(assert (=> b!1572679 (=> (not res!1074541) (not e!876955))))

(assert (=> b!1572679 (= res!1074541 (= (size!51235 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572680 () Bool)

(declare-fun res!1074543 () Bool)

(assert (=> b!1572680 (=> (not res!1074543) (not e!876955))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572680 (= res!1074543 (validKeyInArray!0 k!754))))

(declare-fun b!1572681 () Bool)

(assert (=> b!1572681 (= e!876955 false)))

(declare-datatypes ((SeekEntryResult!13598 0))(
  ( (MissingZero!13598 (index!56790 (_ BitVec 32))) (Found!13598 (index!56791 (_ BitVec 32))) (Intermediate!13598 (undefined!14410 Bool) (index!56792 (_ BitVec 32)) (x!141568 (_ BitVec 32))) (Undefined!13598) (MissingVacant!13598 (index!56793 (_ BitVec 32))) )
))
(declare-fun lt!674083 () SeekEntryResult!13598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105046 (_ BitVec 32)) SeekEntryResult!13598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572681 (= lt!674083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135084 res!1074542) b!1572679))

(assert (= (and b!1572679 res!1074541) b!1572680))

(assert (= (and b!1572680 res!1074543) b!1572681))

(declare-fun m!1446351 () Bool)

(assert (=> start!135084 m!1446351))

(declare-fun m!1446353 () Bool)

(assert (=> start!135084 m!1446353))

(declare-fun m!1446355 () Bool)

(assert (=> b!1572680 m!1446355))

(declare-fun m!1446357 () Bool)

(assert (=> b!1572681 m!1446357))

(assert (=> b!1572681 m!1446357))

(declare-fun m!1446359 () Bool)

(assert (=> b!1572681 m!1446359))

(push 1)

(assert (not b!1572681))

(assert (not start!135084))

(assert (not b!1572680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

