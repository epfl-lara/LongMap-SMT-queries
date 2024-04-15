; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135530 () Bool)

(assert start!135530)

(declare-fun res!1075589 () Bool)

(declare-fun e!877856 () Bool)

(assert (=> start!135530 (=> (not res!1075589) (not e!877856))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135530 (= res!1075589 (validMask!0 mask!898))))

(assert (=> start!135530 e!877856))

(assert (=> start!135530 true))

(declare-datatypes ((array!105186 0))(
  ( (array!105187 (arr!50740 (Array (_ BitVec 32) (_ BitVec 64))) (size!51292 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105186)

(declare-fun array_inv!39676 (array!105186) Bool)

(assert (=> start!135530 (array_inv!39676 _keys!605)))

(declare-fun b!1574112 () Bool)

(declare-fun res!1075590 () Bool)

(assert (=> b!1574112 (=> (not res!1075590) (not e!877856))))

(assert (=> b!1574112 (= res!1075590 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51292 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574113 () Bool)

(declare-fun res!1075588 () Bool)

(assert (=> b!1574113 (=> (not res!1075588) (not e!877856))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574113 (= res!1075588 (validKeyInArray!0 k!761))))

(declare-fun b!1574114 () Bool)

(assert (=> b!1574114 (= e!877856 false)))

(declare-fun lt!674508 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574114 (= lt!674508 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135530 res!1075589) b!1574112))

(assert (= (and b!1574112 res!1075590) b!1574113))

(assert (= (and b!1574113 res!1075588) b!1574114))

(declare-fun m!1446769 () Bool)

(assert (=> start!135530 m!1446769))

(declare-fun m!1446771 () Bool)

(assert (=> start!135530 m!1446771))

(declare-fun m!1446773 () Bool)

(assert (=> b!1574113 m!1446773))

(declare-fun m!1446775 () Bool)

(assert (=> b!1574114 m!1446775))

(push 1)

(assert (not start!135530))

(assert (not b!1574114))

(assert (not b!1574113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

