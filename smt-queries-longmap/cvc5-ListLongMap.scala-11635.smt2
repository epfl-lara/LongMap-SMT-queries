; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135746 () Bool)

(assert start!135746)

(declare-fun res!1076142 () Bool)

(declare-fun e!878296 () Bool)

(assert (=> start!135746 (=> (not res!1076142) (not e!878296))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135746 (= res!1076142 (validMask!0 mask!898))))

(assert (=> start!135746 e!878296))

(assert (=> start!135746 true))

(declare-datatypes ((array!105300 0))(
  ( (array!105301 (arr!50791 (Array (_ BitVec 32) (_ BitVec 64))) (size!51343 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105300)

(declare-fun array_inv!39727 (array!105300) Bool)

(assert (=> start!135746 (array_inv!39727 _keys!605)))

(declare-fun b!1574814 () Bool)

(declare-fun res!1076141 () Bool)

(assert (=> b!1574814 (=> (not res!1076141) (not e!878296))))

(assert (=> b!1574814 (= res!1076141 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51343 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574815 () Bool)

(declare-fun res!1076140 () Bool)

(assert (=> b!1574815 (=> (not res!1076140) (not e!878296))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574815 (= res!1076140 (validKeyInArray!0 k!761))))

(declare-fun b!1574816 () Bool)

(assert (=> b!1574816 (= e!878296 false)))

(declare-datatypes ((SeekEntryResult!13691 0))(
  ( (MissingZero!13691 (index!57162 (_ BitVec 32))) (Found!13691 (index!57163 (_ BitVec 32))) (Intermediate!13691 (undefined!14503 Bool) (index!57164 (_ BitVec 32)) (x!142110 (_ BitVec 32))) (Undefined!13691) (MissingVacant!13691 (index!57165 (_ BitVec 32))) )
))
(declare-fun lt!674787 () SeekEntryResult!13691)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105300 (_ BitVec 32)) SeekEntryResult!13691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574816 (= lt!674787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135746 res!1076142) b!1574814))

(assert (= (and b!1574814 res!1076141) b!1574815))

(assert (= (and b!1574815 res!1076140) b!1574816))

(declare-fun m!1447343 () Bool)

(assert (=> start!135746 m!1447343))

(declare-fun m!1447345 () Bool)

(assert (=> start!135746 m!1447345))

(declare-fun m!1447347 () Bool)

(assert (=> b!1574815 m!1447347))

(declare-fun m!1447349 () Bool)

(assert (=> b!1574816 m!1447349))

(assert (=> b!1574816 m!1447349))

(declare-fun m!1447351 () Bool)

(assert (=> b!1574816 m!1447351))

(push 1)

(assert (not b!1574815))

(assert (not start!135746))

(assert (not b!1574816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

