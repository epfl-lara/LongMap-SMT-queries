; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78742 () Bool)

(assert start!78742)

(declare-fun b_free!16955 () Bool)

(declare-fun b_next!16955 () Bool)

(assert (=> start!78742 (= b_free!16955 (not b_next!16955))))

(declare-fun tp!59306 () Bool)

(declare-fun b_and!27647 () Bool)

(assert (=> start!78742 (= tp!59306 b_and!27647)))

(declare-fun b!918657 () Bool)

(declare-fun e!515688 () Bool)

(declare-fun e!515691 () Bool)

(assert (=> b!918657 (= e!515688 e!515691)))

(declare-fun res!619398 () Bool)

(assert (=> b!918657 (=> (not res!619398) (not e!515691))))

(declare-fun lt!412334 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918657 (= res!619398 (validKeyInArray!0 lt!412334))))

(declare-datatypes ((array!54910 0))(
  ( (array!54911 (arr!26400 (Array (_ BitVec 32) (_ BitVec 64))) (size!26859 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54910)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918657 (= lt!412334 (select (arr!26400 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918658 () Bool)

(declare-fun e!515690 () Bool)

(declare-fun tp_is_empty!19463 () Bool)

(assert (=> b!918658 (= e!515690 tp_is_empty!19463)))

(declare-fun res!619392 () Bool)

(declare-fun e!515686 () Bool)

(assert (=> start!78742 (=> (not res!619392) (not e!515686))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78742 (= res!619392 (validMask!0 mask!1881))))

(assert (=> start!78742 e!515686))

(assert (=> start!78742 true))

(assert (=> start!78742 tp_is_empty!19463))

(declare-datatypes ((V!30915 0))(
  ( (V!30916 (val!9782 Int)) )
))
(declare-datatypes ((ValueCell!9250 0))(
  ( (ValueCellFull!9250 (v!12300 V!30915)) (EmptyCell!9250) )
))
(declare-datatypes ((array!54912 0))(
  ( (array!54913 (arr!26401 (Array (_ BitVec 32) ValueCell!9250)) (size!26860 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54912)

(declare-fun e!515689 () Bool)

(declare-fun array_inv!20580 (array!54912) Bool)

(assert (=> start!78742 (and (array_inv!20580 _values!1231) e!515689)))

(assert (=> start!78742 tp!59306))

(declare-fun array_inv!20581 (array!54910) Bool)

(assert (=> start!78742 (array_inv!20581 _keys!1487)))

(declare-fun b!918659 () Bool)

(declare-fun res!619393 () Bool)

(assert (=> b!918659 (=> (not res!619393) (not e!515688))))

(assert (=> b!918659 (= res!619393 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!30951 () Bool)

(declare-fun mapRes!30951 () Bool)

(declare-fun tp!59305 () Bool)

(assert (=> mapNonEmpty!30951 (= mapRes!30951 (and tp!59305 e!515690))))

(declare-fun mapValue!30951 () ValueCell!9250)

(declare-fun mapRest!30951 () (Array (_ BitVec 32) ValueCell!9250))

(declare-fun mapKey!30951 () (_ BitVec 32))

(assert (=> mapNonEmpty!30951 (= (arr!26401 _values!1231) (store mapRest!30951 mapKey!30951 mapValue!30951))))

(declare-fun b!918660 () Bool)

(declare-fun e!515687 () Bool)

(assert (=> b!918660 (= e!515689 (and e!515687 mapRes!30951))))

(declare-fun condMapEmpty!30951 () Bool)

(declare-fun mapDefault!30951 () ValueCell!9250)

