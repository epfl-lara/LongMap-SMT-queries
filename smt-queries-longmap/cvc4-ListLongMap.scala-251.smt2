; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4192 () Bool)

(assert start!4192)

(declare-fun b_free!1097 () Bool)

(declare-fun b_next!1097 () Bool)

(assert (=> start!4192 (= b_free!1097 (not b_next!1097))))

(declare-fun tp!4710 () Bool)

(declare-fun b_and!1907 () Bool)

(assert (=> start!4192 (= tp!4710 b_and!1907)))

(declare-fun b!31827 () Bool)

(declare-fun e!20291 () Bool)

(declare-fun tp_is_empty!1451 () Bool)

(assert (=> b!31827 (= e!20291 tp_is_empty!1451)))

(declare-fun mapIsEmpty!1705 () Bool)

(declare-fun mapRes!1705 () Bool)

(assert (=> mapIsEmpty!1705 mapRes!1705))

(declare-fun b!31828 () Bool)

(declare-fun res!19309 () Bool)

(declare-fun e!20293 () Bool)

(assert (=> b!31828 (=> (not res!19309) (not e!20293))))

(declare-datatypes ((array!2117 0))(
  ( (array!2118 (arr!1012 (Array (_ BitVec 32) (_ BitVec 64))) (size!1113 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2117)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31828 (= res!19309 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1705 () Bool)

(declare-fun tp!4711 () Bool)

(declare-fun e!20292 () Bool)

(assert (=> mapNonEmpty!1705 (= mapRes!1705 (and tp!4711 e!20292))))

(declare-fun mapKey!1705 () (_ BitVec 32))

(declare-datatypes ((V!1759 0))(
  ( (V!1760 (val!752 Int)) )
))
(declare-datatypes ((ValueCell!526 0))(
  ( (ValueCellFull!526 (v!1841 V!1759)) (EmptyCell!526) )
))
(declare-datatypes ((array!2119 0))(
  ( (array!2120 (arr!1013 (Array (_ BitVec 32) ValueCell!526)) (size!1114 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2119)

(declare-fun mapRest!1705 () (Array (_ BitVec 32) ValueCell!526))

(declare-fun mapValue!1705 () ValueCell!526)

(assert (=> mapNonEmpty!1705 (= (arr!1013 _values!1501) (store mapRest!1705 mapKey!1705 mapValue!1705))))

(declare-fun b!31829 () Bool)

(declare-fun res!19313 () Bool)

(assert (=> b!31829 (=> (not res!19313) (not e!20293))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31829 (= res!19313 (and (= (size!1114 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1113 _keys!1833) (size!1114 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31830 () Bool)

(declare-fun res!19310 () Bool)

(assert (=> b!31830 (=> (not res!19310) (not e!20293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31830 (= res!19310 (validKeyInArray!0 k!1304))))

(declare-fun b!31831 () Bool)

(declare-fun e!20290 () Bool)

(assert (=> b!31831 (= e!20290 (and e!20291 mapRes!1705))))

(declare-fun condMapEmpty!1705 () Bool)

(declare-fun mapDefault!1705 () ValueCell!526)

