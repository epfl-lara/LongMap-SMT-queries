; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136202 () Bool)

(assert start!136202)

(declare-fun res!1077103 () Bool)

(declare-fun e!879986 () Bool)

(assert (=> start!136202 (=> (not res!1077103) (not e!879986))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136202 (= res!1077103 (validMask!0 mask!898))))

(assert (=> start!136202 e!879986))

(assert (=> start!136202 true))

(declare-datatypes ((array!105489 0))(
  ( (array!105490 (arr!50877 (Array (_ BitVec 32) (_ BitVec 64))) (size!51428 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105489)

(declare-fun array_inv!39832 (array!105489) Bool)

(assert (=> start!136202 (array_inv!39832 _keys!605)))

(declare-fun b!1577536 () Bool)

(declare-fun res!1077102 () Bool)

(assert (=> b!1577536 (=> (not res!1077102) (not e!879986))))

(assert (=> b!1577536 (= res!1077102 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51428 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577537 () Bool)

(declare-fun res!1077104 () Bool)

(assert (=> b!1577537 (=> (not res!1077104) (not e!879986))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577537 (= res!1077104 (validKeyInArray!0 k!761))))

(declare-fun b!1577538 () Bool)

(assert (=> b!1577538 (= e!879986 false)))

(declare-datatypes ((SeekEntryResult!13636 0))(
  ( (MissingZero!13636 (index!56942 (_ BitVec 32))) (Found!13636 (index!56943 (_ BitVec 32))) (Intermediate!13636 (undefined!14448 Bool) (index!56944 (_ BitVec 32)) (x!142103 (_ BitVec 32))) (Undefined!13636) (MissingVacant!13636 (index!56945 (_ BitVec 32))) )
))
(declare-fun lt!675972 () SeekEntryResult!13636)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105489 (_ BitVec 32)) SeekEntryResult!13636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577538 (= lt!675972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136202 res!1077103) b!1577536))

(assert (= (and b!1577536 res!1077102) b!1577537))

(assert (= (and b!1577537 res!1077104) b!1577538))

(declare-fun m!1450463 () Bool)

(assert (=> start!136202 m!1450463))

(declare-fun m!1450465 () Bool)

(assert (=> start!136202 m!1450465))

(declare-fun m!1450467 () Bool)

(assert (=> b!1577537 m!1450467))

(declare-fun m!1450469 () Bool)

(assert (=> b!1577538 m!1450469))

(assert (=> b!1577538 m!1450469))

(declare-fun m!1450471 () Bool)

(assert (=> b!1577538 m!1450471))

(push 1)

(assert (not b!1577537))

(assert (not start!136202))

(assert (not b!1577538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

