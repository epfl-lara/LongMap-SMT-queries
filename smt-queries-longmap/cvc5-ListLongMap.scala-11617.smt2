; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135986 () Bool)

(assert start!135986)

(declare-fun res!1076552 () Bool)

(declare-fun e!879544 () Bool)

(assert (=> start!135986 (=> (not res!1076552) (not e!879544))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135986 (= res!1076552 (validMask!0 mask!898))))

(assert (=> start!135986 e!879544))

(assert (=> start!135986 true))

(declare-datatypes ((array!105375 0))(
  ( (array!105376 (arr!50826 (Array (_ BitVec 32) (_ BitVec 64))) (size!51377 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105375)

(declare-fun array_inv!39781 (array!105375) Bool)

(assert (=> start!135986 (array_inv!39781 _keys!605)))

(declare-fun b!1576834 () Bool)

(declare-fun res!1076551 () Bool)

(assert (=> b!1576834 (=> (not res!1076551) (not e!879544))))

(assert (=> b!1576834 (= res!1076551 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51377 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576835 () Bool)

(declare-fun res!1076550 () Bool)

(assert (=> b!1576835 (=> (not res!1076550) (not e!879544))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576835 (= res!1076550 (validKeyInArray!0 k!761))))

(declare-fun b!1576836 () Bool)

(assert (=> b!1576836 (= e!879544 false)))

(declare-fun lt!675693 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576836 (= lt!675693 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135986 res!1076552) b!1576834))

(assert (= (and b!1576834 res!1076551) b!1576835))

(assert (= (and b!1576835 res!1076550) b!1576836))

(declare-fun m!1449895 () Bool)

(assert (=> start!135986 m!1449895))

(declare-fun m!1449897 () Bool)

(assert (=> start!135986 m!1449897))

(declare-fun m!1449899 () Bool)

(assert (=> b!1576835 m!1449899))

(declare-fun m!1449901 () Bool)

(assert (=> b!1576836 m!1449901))

(push 1)

(assert (not b!1576835))

(assert (not b!1576836))

(assert (not start!135986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

