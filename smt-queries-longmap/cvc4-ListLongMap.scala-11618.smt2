; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135990 () Bool)

(assert start!135990)

(declare-fun res!1076569 () Bool)

(declare-fun e!879557 () Bool)

(assert (=> start!135990 (=> (not res!1076569) (not e!879557))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135990 (= res!1076569 (validMask!0 mask!898))))

(assert (=> start!135990 e!879557))

(assert (=> start!135990 true))

(declare-datatypes ((array!105379 0))(
  ( (array!105380 (arr!50828 (Array (_ BitVec 32) (_ BitVec 64))) (size!51379 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105379)

(declare-fun array_inv!39783 (array!105379) Bool)

(assert (=> start!135990 (array_inv!39783 _keys!605)))

(declare-fun b!1576852 () Bool)

(declare-fun res!1076568 () Bool)

(assert (=> b!1576852 (=> (not res!1076568) (not e!879557))))

(assert (=> b!1576852 (= res!1076568 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51379 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576853 () Bool)

(declare-fun res!1076570 () Bool)

(assert (=> b!1576853 (=> (not res!1076570) (not e!879557))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576853 (= res!1076570 (validKeyInArray!0 k!761))))

(declare-fun b!1576854 () Bool)

(assert (=> b!1576854 (= e!879557 false)))

(declare-fun lt!675699 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576854 (= lt!675699 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135990 res!1076569) b!1576852))

(assert (= (and b!1576852 res!1076568) b!1576853))

(assert (= (and b!1576853 res!1076570) b!1576854))

(declare-fun m!1449911 () Bool)

(assert (=> start!135990 m!1449911))

(declare-fun m!1449913 () Bool)

(assert (=> start!135990 m!1449913))

(declare-fun m!1449915 () Bool)

(assert (=> b!1576853 m!1449915))

(declare-fun m!1449917 () Bool)

(assert (=> b!1576854 m!1449917))

(push 1)

(assert (not b!1576854))

(assert (not b!1576853))

(assert (not start!135990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

