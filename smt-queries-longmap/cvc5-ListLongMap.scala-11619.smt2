; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135998 () Bool)

(assert start!135998)

(declare-fun res!1076605 () Bool)

(declare-fun e!879580 () Bool)

(assert (=> start!135998 (=> (not res!1076605) (not e!879580))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135998 (= res!1076605 (validMask!0 mask!898))))

(assert (=> start!135998 e!879580))

(assert (=> start!135998 true))

(declare-datatypes ((array!105387 0))(
  ( (array!105388 (arr!50832 (Array (_ BitVec 32) (_ BitVec 64))) (size!51383 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105387)

(declare-fun array_inv!39787 (array!105387) Bool)

(assert (=> start!135998 (array_inv!39787 _keys!605)))

(declare-fun b!1576888 () Bool)

(declare-fun res!1076606 () Bool)

(assert (=> b!1576888 (=> (not res!1076606) (not e!879580))))

(assert (=> b!1576888 (= res!1076606 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51383 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576889 () Bool)

(declare-fun res!1076604 () Bool)

(assert (=> b!1576889 (=> (not res!1076604) (not e!879580))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576889 (= res!1076604 (validKeyInArray!0 k!761))))

(declare-fun b!1576890 () Bool)

(assert (=> b!1576890 (= e!879580 false)))

(declare-fun lt!675711 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576890 (= lt!675711 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135998 res!1076605) b!1576888))

(assert (= (and b!1576888 res!1076606) b!1576889))

(assert (= (and b!1576889 res!1076604) b!1576890))

(declare-fun m!1449943 () Bool)

(assert (=> start!135998 m!1449943))

(declare-fun m!1449945 () Bool)

(assert (=> start!135998 m!1449945))

(declare-fun m!1449947 () Bool)

(assert (=> b!1576889 m!1449947))

(declare-fun m!1449949 () Bool)

(assert (=> b!1576890 m!1449949))

(push 1)

(assert (not b!1576889))

(assert (not b!1576890))

(assert (not start!135998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

