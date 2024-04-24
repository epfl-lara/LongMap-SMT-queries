; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136196 () Bool)

(assert start!136196)

(declare-fun res!1077075 () Bool)

(declare-fun e!879968 () Bool)

(assert (=> start!136196 (=> (not res!1077075) (not e!879968))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136196 (= res!1077075 (validMask!0 mask!898))))

(assert (=> start!136196 e!879968))

(assert (=> start!136196 true))

(declare-datatypes ((array!105483 0))(
  ( (array!105484 (arr!50874 (Array (_ BitVec 32) (_ BitVec 64))) (size!51425 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105483)

(declare-fun array_inv!39829 (array!105483) Bool)

(assert (=> start!136196 (array_inv!39829 _keys!605)))

(declare-fun b!1577509 () Bool)

(declare-fun res!1077076 () Bool)

(assert (=> b!1577509 (=> (not res!1077076) (not e!879968))))

(assert (=> b!1577509 (= res!1077076 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51425 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577510 () Bool)

(declare-fun res!1077077 () Bool)

(assert (=> b!1577510 (=> (not res!1077077) (not e!879968))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577510 (= res!1077077 (validKeyInArray!0 k!761))))

(declare-fun b!1577511 () Bool)

(assert (=> b!1577511 (= e!879968 false)))

(declare-datatypes ((SeekEntryResult!13633 0))(
  ( (MissingZero!13633 (index!56930 (_ BitVec 32))) (Found!13633 (index!56931 (_ BitVec 32))) (Intermediate!13633 (undefined!14445 Bool) (index!56932 (_ BitVec 32)) (x!142092 (_ BitVec 32))) (Undefined!13633) (MissingVacant!13633 (index!56933 (_ BitVec 32))) )
))
(declare-fun lt!675963 () SeekEntryResult!13633)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105483 (_ BitVec 32)) SeekEntryResult!13633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577511 (= lt!675963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136196 res!1077075) b!1577509))

(assert (= (and b!1577509 res!1077076) b!1577510))

(assert (= (and b!1577510 res!1077077) b!1577511))

(declare-fun m!1450433 () Bool)

(assert (=> start!136196 m!1450433))

(declare-fun m!1450435 () Bool)

(assert (=> start!136196 m!1450435))

(declare-fun m!1450437 () Bool)

(assert (=> b!1577510 m!1450437))

(declare-fun m!1450439 () Bool)

(assert (=> b!1577511 m!1450439))

(assert (=> b!1577511 m!1450439))

(declare-fun m!1450441 () Bool)

(assert (=> b!1577511 m!1450441))

(push 1)

(assert (not start!136196))

(assert (not b!1577511))

(assert (not b!1577510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

