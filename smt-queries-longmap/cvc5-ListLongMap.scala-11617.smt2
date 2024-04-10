; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135558 () Bool)

(assert start!135558)

(declare-fun res!1075673 () Bool)

(declare-fun e!878024 () Bool)

(assert (=> start!135558 (=> (not res!1075673) (not e!878024))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135558 (= res!1075673 (validMask!0 mask!898))))

(assert (=> start!135558 e!878024))

(assert (=> start!135558 true))

(declare-datatypes ((array!105246 0))(
  ( (array!105247 (arr!50770 (Array (_ BitVec 32) (_ BitVec 64))) (size!51320 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105246)

(declare-fun array_inv!39497 (array!105246) Bool)

(assert (=> start!135558 (array_inv!39497 _keys!605)))

(declare-fun b!1574380 () Bool)

(declare-fun res!1075674 () Bool)

(assert (=> b!1574380 (=> (not res!1075674) (not e!878024))))

(assert (=> b!1574380 (= res!1075674 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51320 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574381 () Bool)

(declare-fun res!1075672 () Bool)

(assert (=> b!1574381 (=> (not res!1075672) (not e!878024))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574381 (= res!1075672 (validKeyInArray!0 k!761))))

(declare-fun b!1574382 () Bool)

(assert (=> b!1574382 (= e!878024 false)))

(declare-fun lt!674779 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574382 (= lt!674779 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135558 res!1075673) b!1574380))

(assert (= (and b!1574380 res!1075674) b!1574381))

(assert (= (and b!1574381 res!1075672) b!1574382))

(declare-fun m!1447621 () Bool)

(assert (=> start!135558 m!1447621))

(declare-fun m!1447623 () Bool)

(assert (=> start!135558 m!1447623))

(declare-fun m!1447625 () Bool)

(assert (=> b!1574381 m!1447625))

(declare-fun m!1447627 () Bool)

(assert (=> b!1574382 m!1447627))

(push 1)

(assert (not b!1574381))

(assert (not start!135558))

(assert (not b!1574382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

