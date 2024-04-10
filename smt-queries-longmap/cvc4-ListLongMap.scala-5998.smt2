; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77844 () Bool)

(assert start!77844)

(declare-fun b_free!16403 () Bool)

(declare-fun b_next!16403 () Bool)

(assert (=> start!77844 (= b_free!16403 (not b_next!16403))))

(declare-fun tp!57474 () Bool)

(declare-fun b_and!26963 () Bool)

(assert (=> start!77844 (= tp!57474 b_and!26963)))

(declare-fun b!908924 () Bool)

(declare-fun e!509437 () Bool)

(declare-fun tp_is_empty!18821 () Bool)

(assert (=> b!908924 (= e!509437 tp_is_empty!18821)))

(declare-fun b!908925 () Bool)

(declare-fun e!509432 () Bool)

(assert (=> b!908925 (= e!509432 tp_is_empty!18821)))

(declare-fun mapNonEmpty!29947 () Bool)

(declare-fun mapRes!29947 () Bool)

(declare-fun tp!57473 () Bool)

(assert (=> mapNonEmpty!29947 (= mapRes!29947 (and tp!57473 e!509432))))

(declare-datatypes ((V!30059 0))(
  ( (V!30060 (val!9461 Int)) )
))
(declare-datatypes ((ValueCell!8929 0))(
  ( (ValueCellFull!8929 (v!11968 V!30059)) (EmptyCell!8929) )
))
(declare-fun mapValue!29947 () ValueCell!8929)

(declare-fun mapKey!29947 () (_ BitVec 32))

(declare-fun mapRest!29947 () (Array (_ BitVec 32) ValueCell!8929))

(declare-datatypes ((array!53670 0))(
  ( (array!53671 (arr!25793 (Array (_ BitVec 32) ValueCell!8929)) (size!26252 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53670)

(assert (=> mapNonEmpty!29947 (= (arr!25793 _values!1152) (store mapRest!29947 mapKey!29947 mapValue!29947))))

(declare-fun b!908926 () Bool)

(declare-fun res!613503 () Bool)

(declare-fun e!509438 () Bool)

(assert (=> b!908926 (=> (not res!613503) (not e!509438))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53672 0))(
  ( (array!53673 (arr!25794 (Array (_ BitVec 32) (_ BitVec 64))) (size!26253 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53672)

(assert (=> b!908926 (= res!613503 (and (= (size!26252 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26253 _keys!1386) (size!26252 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908927 () Bool)

(declare-fun e!509436 () Bool)

(assert (=> b!908927 (= e!509436 (and e!509437 mapRes!29947))))

(declare-fun condMapEmpty!29947 () Bool)

(declare-fun mapDefault!29947 () ValueCell!8929)

