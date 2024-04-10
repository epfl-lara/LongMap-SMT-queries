; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135786 () Bool)

(assert start!135786)

(declare-fun res!1076279 () Bool)

(declare-fun e!878501 () Bool)

(assert (=> start!135786 (=> (not res!1076279) (not e!878501))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135786 (= res!1076279 (validMask!0 mask!898))))

(assert (=> start!135786 e!878501))

(assert (=> start!135786 true))

(declare-datatypes ((array!105372 0))(
  ( (array!105373 (arr!50827 (Array (_ BitVec 32) (_ BitVec 64))) (size!51377 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105372)

(declare-fun array_inv!39554 (array!105372) Bool)

(assert (=> start!135786 (array_inv!39554 _keys!605)))

(declare-fun b!1575136 () Bool)

(declare-fun res!1076280 () Bool)

(assert (=> b!1575136 (=> (not res!1076280) (not e!878501))))

(assert (=> b!1575136 (= res!1076280 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51377 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575137 () Bool)

(declare-fun res!1076278 () Bool)

(assert (=> b!1575137 (=> (not res!1076278) (not e!878501))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575137 (= res!1076278 (validKeyInArray!0 k!761))))

(declare-fun b!1575138 () Bool)

(assert (=> b!1575138 (= e!878501 false)))

(declare-datatypes ((SeekEntryResult!13692 0))(
  ( (MissingZero!13692 (index!57166 (_ BitVec 32))) (Found!13692 (index!57167 (_ BitVec 32))) (Intermediate!13692 (undefined!14504 Bool) (index!57168 (_ BitVec 32)) (x!142124 (_ BitVec 32))) (Undefined!13692) (MissingVacant!13692 (index!57169 (_ BitVec 32))) )
))
(declare-fun lt!675076 () SeekEntryResult!13692)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105372 (_ BitVec 32)) SeekEntryResult!13692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575138 (= lt!675076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135786 res!1076279) b!1575136))

(assert (= (and b!1575136 res!1076280) b!1575137))

(assert (= (and b!1575137 res!1076278) b!1575138))

(declare-fun m!1448245 () Bool)

(assert (=> start!135786 m!1448245))

(declare-fun m!1448247 () Bool)

(assert (=> start!135786 m!1448247))

(declare-fun m!1448249 () Bool)

(assert (=> b!1575137 m!1448249))

(declare-fun m!1448251 () Bool)

(assert (=> b!1575138 m!1448251))

(assert (=> b!1575138 m!1448251))

(declare-fun m!1448253 () Bool)

(assert (=> b!1575138 m!1448253))

(push 1)

(assert (not b!1575138))

(assert (not start!135786))

(assert (not b!1575137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

