; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135772 () Bool)

(assert start!135772)

(declare-fun res!1076217 () Bool)

(declare-fun e!878459 () Bool)

(assert (=> start!135772 (=> (not res!1076217) (not e!878459))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135772 (= res!1076217 (validMask!0 mask!898))))

(assert (=> start!135772 e!878459))

(assert (=> start!135772 true))

(declare-datatypes ((array!105358 0))(
  ( (array!105359 (arr!50820 (Array (_ BitVec 32) (_ BitVec 64))) (size!51370 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105358)

(declare-fun array_inv!39547 (array!105358) Bool)

(assert (=> start!135772 (array_inv!39547 _keys!605)))

(declare-fun b!1575073 () Bool)

(declare-fun res!1076215 () Bool)

(assert (=> b!1575073 (=> (not res!1076215) (not e!878459))))

(assert (=> b!1575073 (= res!1076215 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51370 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575074 () Bool)

(declare-fun res!1076216 () Bool)

(assert (=> b!1575074 (=> (not res!1076216) (not e!878459))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575074 (= res!1076216 (validKeyInArray!0 k!761))))

(declare-fun b!1575075 () Bool)

(assert (=> b!1575075 (= e!878459 false)))

(declare-datatypes ((SeekEntryResult!13685 0))(
  ( (MissingZero!13685 (index!57138 (_ BitVec 32))) (Found!13685 (index!57139 (_ BitVec 32))) (Intermediate!13685 (undefined!14497 Bool) (index!57140 (_ BitVec 32)) (x!142093 (_ BitVec 32))) (Undefined!13685) (MissingVacant!13685 (index!57141 (_ BitVec 32))) )
))
(declare-fun lt!675055 () SeekEntryResult!13685)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105358 (_ BitVec 32)) SeekEntryResult!13685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575075 (= lt!675055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135772 res!1076217) b!1575073))

(assert (= (and b!1575073 res!1076215) b!1575074))

(assert (= (and b!1575074 res!1076216) b!1575075))

(declare-fun m!1448175 () Bool)

(assert (=> start!135772 m!1448175))

(declare-fun m!1448177 () Bool)

(assert (=> start!135772 m!1448177))

(declare-fun m!1448179 () Bool)

(assert (=> b!1575074 m!1448179))

(declare-fun m!1448181 () Bool)

(assert (=> b!1575075 m!1448181))

(assert (=> b!1575075 m!1448181))

(declare-fun m!1448183 () Bool)

(assert (=> b!1575075 m!1448183))

(push 1)

(assert (not b!1575074))

(assert (not b!1575075))

