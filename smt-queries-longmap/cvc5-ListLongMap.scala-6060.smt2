; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78424 () Bool)

(assert start!78424)

(declare-fun mapNonEmpty!30525 () Bool)

(declare-fun mapRes!30525 () Bool)

(declare-fun tp!58592 () Bool)

(declare-fun e!513236 () Bool)

(assert (=> mapNonEmpty!30525 (= mapRes!30525 (and tp!58592 e!513236))))

(declare-datatypes ((V!30551 0))(
  ( (V!30552 (val!9645 Int)) )
))
(declare-datatypes ((ValueCell!9113 0))(
  ( (ValueCellFull!9113 (v!12162 V!30551)) (EmptyCell!9113) )
))
(declare-fun mapRest!30525 () (Array (_ BitVec 32) ValueCell!9113))

(declare-fun mapValue!30525 () ValueCell!9113)

(declare-datatypes ((array!54370 0))(
  ( (array!54371 (arr!26135 (Array (_ BitVec 32) ValueCell!9113)) (size!26594 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54370)

(declare-fun mapKey!30525 () (_ BitVec 32))

(assert (=> mapNonEmpty!30525 (= (arr!26135 _values!1231) (store mapRest!30525 mapKey!30525 mapValue!30525))))

(declare-fun b!914774 () Bool)

(declare-fun tp_is_empty!19189 () Bool)

(assert (=> b!914774 (= e!513236 tp_is_empty!19189)))

(declare-fun e!513233 () Bool)

(declare-datatypes ((array!54372 0))(
  ( (array!54373 (arr!26136 (Array (_ BitVec 32) (_ BitVec 64))) (size!26595 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54372)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun b!914775 () Bool)

(assert (=> b!914775 (= e!513233 (and (= (size!26594 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26595 _keys!1487) (size!26594 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (= (size!26595 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)) (bvsgt #b00000000000000000000000000000000 (size!26595 _keys!1487))))))

(declare-fun res!616874 () Bool)

(assert (=> start!78424 (=> (not res!616874) (not e!513233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78424 (= res!616874 (validMask!0 mask!1881))))

(assert (=> start!78424 e!513233))

(assert (=> start!78424 true))

(declare-fun e!513234 () Bool)

(declare-fun array_inv!20410 (array!54370) Bool)

(assert (=> start!78424 (and (array_inv!20410 _values!1231) e!513234)))

(declare-fun array_inv!20411 (array!54372) Bool)

(assert (=> start!78424 (array_inv!20411 _keys!1487)))

(declare-fun b!914776 () Bool)

(declare-fun e!513232 () Bool)

(assert (=> b!914776 (= e!513232 tp_is_empty!19189)))

(declare-fun b!914777 () Bool)

(assert (=> b!914777 (= e!513234 (and e!513232 mapRes!30525))))

(declare-fun condMapEmpty!30525 () Bool)

(declare-fun mapDefault!30525 () ValueCell!9113)

