; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136040 () Bool)

(assert start!136040)

(declare-fun res!1076688 () Bool)

(declare-fun e!879634 () Bool)

(assert (=> start!136040 (=> (not res!1076688) (not e!879634))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136040 (= res!1076688 (validMask!0 mask!898))))

(assert (=> start!136040 e!879634))

(assert (=> start!136040 true))

(declare-datatypes ((array!105408 0))(
  ( (array!105409 (arr!50841 (Array (_ BitVec 32) (_ BitVec 64))) (size!51392 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105408)

(declare-fun array_inv!39796 (array!105408) Bool)

(assert (=> start!136040 (array_inv!39796 _keys!605)))

(declare-fun b!1576969 () Bool)

(declare-fun res!1076690 () Bool)

(assert (=> b!1576969 (=> (not res!1076690) (not e!879634))))

(assert (=> b!1576969 (= res!1076690 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51392 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576970 () Bool)

(declare-fun res!1076689 () Bool)

(assert (=> b!1576970 (=> (not res!1076689) (not e!879634))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576970 (= res!1076689 (validKeyInArray!0 k!761))))

(declare-fun b!1576971 () Bool)

(assert (=> b!1576971 (= e!879634 false)))

(declare-fun lt!675756 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576971 (= lt!675756 (toIndex!0 k!761 mask!898))))

(assert (= (and start!136040 res!1076688) b!1576969))

(assert (= (and b!1576969 res!1076690) b!1576970))

(assert (= (and b!1576970 res!1076689) b!1576971))

(declare-fun m!1450015 () Bool)

(assert (=> start!136040 m!1450015))

(declare-fun m!1450017 () Bool)

(assert (=> start!136040 m!1450017))

(declare-fun m!1450019 () Bool)

(assert (=> b!1576970 m!1450019))

(declare-fun m!1450021 () Bool)

(assert (=> b!1576971 m!1450021))

(push 1)

(assert (not b!1576970))

(assert (not start!136040))

(assert (not b!1576971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

