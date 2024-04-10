; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1048 () Bool)

(assert start!1048)

(declare-fun b_free!377 () Bool)

(declare-fun b_next!377 () Bool)

(assert (=> start!1048 (= b_free!377 (not b_next!377))))

(declare-fun tp!1369 () Bool)

(declare-fun b_and!529 () Bool)

(assert (=> start!1048 (= tp!1369 b_and!529)))

(declare-fun b!9311 () Bool)

(declare-fun e!5318 () Bool)

(declare-fun tp_is_empty!455 () Bool)

(assert (=> b!9311 (= e!5318 tp_is_empty!455)))

(declare-fun b!9312 () Bool)

(declare-fun res!8451 () Bool)

(declare-fun e!5323 () Bool)

(assert (=> b!9312 (=> (not res!8451) (not e!5323))))

(declare-datatypes ((array!839 0))(
  ( (array!840 (arr!405 (Array (_ BitVec 32) (_ BitVec 64))) (size!467 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!839)

(declare-datatypes ((List!283 0))(
  ( (Nil!280) (Cons!279 (h!845 (_ BitVec 64)) (t!2424 List!283)) )
))
(declare-fun arrayNoDuplicates!0 (array!839 (_ BitVec 32) List!283) Bool)

(assert (=> b!9312 (= res!8451 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!280))))

(declare-fun mapNonEmpty!662 () Bool)

(declare-fun mapRes!662 () Bool)

(declare-fun tp!1370 () Bool)

(assert (=> mapNonEmpty!662 (= mapRes!662 (and tp!1370 e!5318))))

(declare-datatypes ((V!783 0))(
  ( (V!784 (val!233 Int)) )
))
(declare-datatypes ((ValueCell!211 0))(
  ( (ValueCellFull!211 (v!1327 V!783)) (EmptyCell!211) )
))
(declare-fun mapValue!662 () ValueCell!211)

(declare-datatypes ((array!841 0))(
  ( (array!842 (arr!406 (Array (_ BitVec 32) ValueCell!211)) (size!468 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!841)

(declare-fun mapRest!662 () (Array (_ BitVec 32) ValueCell!211))

(declare-fun mapKey!662 () (_ BitVec 32))

(assert (=> mapNonEmpty!662 (= (arr!406 _values!1492) (store mapRest!662 mapKey!662 mapValue!662))))

(declare-fun b!9313 () Bool)

(declare-fun e!5320 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9313 (= e!5320 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!9314 () Bool)

(declare-fun e!5322 () Bool)

(declare-fun e!5321 () Bool)

(assert (=> b!9314 (= e!5322 (and e!5321 mapRes!662))))

(declare-fun condMapEmpty!662 () Bool)

(declare-fun mapDefault!662 () ValueCell!211)

