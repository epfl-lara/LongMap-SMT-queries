; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135780 () Bool)

(assert start!135780)

(declare-fun res!1076253 () Bool)

(declare-fun e!878483 () Bool)

(assert (=> start!135780 (=> (not res!1076253) (not e!878483))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135780 (= res!1076253 (validMask!0 mask!898))))

(assert (=> start!135780 e!878483))

(assert (=> start!135780 true))

(declare-datatypes ((array!105366 0))(
  ( (array!105367 (arr!50824 (Array (_ BitVec 32) (_ BitVec 64))) (size!51374 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105366)

(declare-fun array_inv!39551 (array!105366) Bool)

(assert (=> start!135780 (array_inv!39551 _keys!605)))

(declare-fun b!1575109 () Bool)

(declare-fun res!1076252 () Bool)

(assert (=> b!1575109 (=> (not res!1076252) (not e!878483))))

(assert (=> b!1575109 (= res!1076252 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51374 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575110 () Bool)

(declare-fun res!1076251 () Bool)

(assert (=> b!1575110 (=> (not res!1076251) (not e!878483))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575110 (= res!1076251 (validKeyInArray!0 k!761))))

(declare-fun b!1575111 () Bool)

(assert (=> b!1575111 (= e!878483 false)))

(declare-datatypes ((SeekEntryResult!13689 0))(
  ( (MissingZero!13689 (index!57154 (_ BitVec 32))) (Found!13689 (index!57155 (_ BitVec 32))) (Intermediate!13689 (undefined!14501 Bool) (index!57156 (_ BitVec 32)) (x!142113 (_ BitVec 32))) (Undefined!13689) (MissingVacant!13689 (index!57157 (_ BitVec 32))) )
))
(declare-fun lt!675067 () SeekEntryResult!13689)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105366 (_ BitVec 32)) SeekEntryResult!13689)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575111 (= lt!675067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135780 res!1076253) b!1575109))

(assert (= (and b!1575109 res!1076252) b!1575110))

(assert (= (and b!1575110 res!1076251) b!1575111))

(declare-fun m!1448215 () Bool)

(assert (=> start!135780 m!1448215))

(declare-fun m!1448217 () Bool)

(assert (=> start!135780 m!1448217))

(declare-fun m!1448219 () Bool)

(assert (=> b!1575110 m!1448219))

(declare-fun m!1448221 () Bool)

(assert (=> b!1575111 m!1448221))

(assert (=> b!1575111 m!1448221))

(declare-fun m!1448223 () Bool)

(assert (=> b!1575111 m!1448223))

(push 1)

(assert (not start!135780))

(assert (not b!1575110))

(assert (not b!1575111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

