; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136034 () Bool)

(assert start!136034)

(declare-fun res!1076662 () Bool)

(declare-fun e!879617 () Bool)

(assert (=> start!136034 (=> (not res!1076662) (not e!879617))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136034 (= res!1076662 (validMask!0 mask!898))))

(assert (=> start!136034 e!879617))

(assert (=> start!136034 true))

(declare-datatypes ((array!105402 0))(
  ( (array!105403 (arr!50838 (Array (_ BitVec 32) (_ BitVec 64))) (size!51389 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105402)

(declare-fun array_inv!39793 (array!105402) Bool)

(assert (=> start!136034 (array_inv!39793 _keys!605)))

(declare-fun b!1576942 () Bool)

(declare-fun res!1076661 () Bool)

(assert (=> b!1576942 (=> (not res!1076661) (not e!879617))))

(assert (=> b!1576942 (= res!1076661 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51389 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576943 () Bool)

(declare-fun res!1076663 () Bool)

(assert (=> b!1576943 (=> (not res!1076663) (not e!879617))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576943 (= res!1076663 (validKeyInArray!0 k!761))))

(declare-fun b!1576944 () Bool)

(assert (=> b!1576944 (= e!879617 false)))

(declare-fun lt!675747 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576944 (= lt!675747 (toIndex!0 k!761 mask!898))))

(assert (= (and start!136034 res!1076662) b!1576942))

(assert (= (and b!1576942 res!1076661) b!1576943))

(assert (= (and b!1576943 res!1076663) b!1576944))

(declare-fun m!1449991 () Bool)

(assert (=> start!136034 m!1449991))

(declare-fun m!1449993 () Bool)

(assert (=> start!136034 m!1449993))

(declare-fun m!1449995 () Bool)

(assert (=> b!1576943 m!1449995))

(declare-fun m!1449997 () Bool)

(assert (=> b!1576944 m!1449997))

(push 1)

(assert (not start!136034))

(assert (not b!1576944))

(assert (not b!1576943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

