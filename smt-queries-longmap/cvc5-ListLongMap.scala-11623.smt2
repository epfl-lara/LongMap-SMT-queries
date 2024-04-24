; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136046 () Bool)

(assert start!136046)

(declare-fun res!1076715 () Bool)

(declare-fun e!879652 () Bool)

(assert (=> start!136046 (=> (not res!1076715) (not e!879652))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136046 (= res!1076715 (validMask!0 mask!898))))

(assert (=> start!136046 e!879652))

(assert (=> start!136046 true))

(declare-datatypes ((array!105414 0))(
  ( (array!105415 (arr!50844 (Array (_ BitVec 32) (_ BitVec 64))) (size!51395 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105414)

(declare-fun array_inv!39799 (array!105414) Bool)

(assert (=> start!136046 (array_inv!39799 _keys!605)))

(declare-fun b!1576996 () Bool)

(declare-fun res!1076716 () Bool)

(assert (=> b!1576996 (=> (not res!1076716) (not e!879652))))

(assert (=> b!1576996 (= res!1076716 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51395 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576997 () Bool)

(declare-fun res!1076717 () Bool)

(assert (=> b!1576997 (=> (not res!1076717) (not e!879652))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576997 (= res!1076717 (validKeyInArray!0 k!761))))

(declare-fun b!1576998 () Bool)

(assert (=> b!1576998 (= e!879652 false)))

(declare-datatypes ((SeekEntryResult!13603 0))(
  ( (MissingZero!13603 (index!56810 (_ BitVec 32))) (Found!13603 (index!56811 (_ BitVec 32))) (Intermediate!13603 (undefined!14415 Bool) (index!56812 (_ BitVec 32)) (x!141964 (_ BitVec 32))) (Undefined!13603) (MissingVacant!13603 (index!56813 (_ BitVec 32))) )
))
(declare-fun lt!675765 () SeekEntryResult!13603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105414 (_ BitVec 32)) SeekEntryResult!13603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576998 (= lt!675765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136046 res!1076715) b!1576996))

(assert (= (and b!1576996 res!1076716) b!1576997))

(assert (= (and b!1576997 res!1076717) b!1576998))

(declare-fun m!1450043 () Bool)

(assert (=> start!136046 m!1450043))

(declare-fun m!1450045 () Bool)

(assert (=> start!136046 m!1450045))

(declare-fun m!1450047 () Bool)

(assert (=> b!1576997 m!1450047))

(declare-fun m!1450049 () Bool)

(assert (=> b!1576998 m!1450049))

(assert (=> b!1576998 m!1450049))

(declare-fun m!1450051 () Bool)

(assert (=> b!1576998 m!1450051))

(push 1)

(assert (not b!1576997))

(assert (not start!136046))

(assert (not b!1576998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

