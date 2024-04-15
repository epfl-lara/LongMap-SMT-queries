; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135536 () Bool)

(assert start!135536)

(declare-fun res!1075616 () Bool)

(declare-fun e!877873 () Bool)

(assert (=> start!135536 (=> (not res!1075616) (not e!877873))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135536 (= res!1075616 (validMask!0 mask!898))))

(assert (=> start!135536 e!877873))

(assert (=> start!135536 true))

(declare-datatypes ((array!105192 0))(
  ( (array!105193 (arr!50743 (Array (_ BitVec 32) (_ BitVec 64))) (size!51295 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105192)

(declare-fun array_inv!39679 (array!105192) Bool)

(assert (=> start!135536 (array_inv!39679 _keys!605)))

(declare-fun b!1574139 () Bool)

(declare-fun res!1075615 () Bool)

(assert (=> b!1574139 (=> (not res!1075615) (not e!877873))))

(assert (=> b!1574139 (= res!1075615 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51295 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574140 () Bool)

(declare-fun res!1075617 () Bool)

(assert (=> b!1574140 (=> (not res!1075617) (not e!877873))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574140 (= res!1075617 (validKeyInArray!0 k!761))))

(declare-fun b!1574141 () Bool)

(assert (=> b!1574141 (= e!877873 false)))

(declare-fun lt!674517 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574141 (= lt!674517 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135536 res!1075616) b!1574139))

(assert (= (and b!1574139 res!1075615) b!1574140))

(assert (= (and b!1574140 res!1075617) b!1574141))

(declare-fun m!1446793 () Bool)

(assert (=> start!135536 m!1446793))

(declare-fun m!1446795 () Bool)

(assert (=> start!135536 m!1446795))

(declare-fun m!1446797 () Bool)

(assert (=> b!1574140 m!1446797))

(declare-fun m!1446799 () Bool)

(assert (=> b!1574141 m!1446799))

(push 1)

(assert (not b!1574140))

(assert (not start!135536))

(assert (not b!1574141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

