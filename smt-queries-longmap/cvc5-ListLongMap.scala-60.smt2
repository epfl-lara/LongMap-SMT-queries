; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!892 () Bool)

(assert start!892)

(declare-fun b_free!265 () Bool)

(declare-fun b_next!265 () Bool)

(assert (=> start!892 (= b_free!265 (not b_next!265))))

(declare-fun tp!1028 () Bool)

(declare-fun b_and!413 () Bool)

(assert (=> start!892 (= tp!1028 b_and!413)))

(declare-fun b!7428 () Bool)

(declare-fun e!4125 () Bool)

(assert (=> b!7428 (= e!4125 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!635 0))(
  ( (V!636 (val!177 Int)) )
))
(declare-fun minValue!1434 () V!635)

(declare-fun lt!1536 () Bool)

(declare-datatypes ((array!619 0))(
  ( (array!620 (arr!297 (Array (_ BitVec 32) (_ BitVec 64))) (size!359 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!619)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!635)

(declare-datatypes ((ValueCell!155 0))(
  ( (ValueCellFull!155 (v!1269 V!635)) (EmptyCell!155) )
))
(declare-datatypes ((array!621 0))(
  ( (array!622 (arr!298 (Array (_ BitVec 32) ValueCell!155)) (size!360 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!621)

(declare-datatypes ((tuple2!190 0))(
  ( (tuple2!191 (_1!95 (_ BitVec 64)) (_2!95 V!635)) )
))
(declare-datatypes ((List!200 0))(
  ( (Nil!197) (Cons!196 (h!762 tuple2!190) (t!2337 List!200)) )
))
(declare-datatypes ((ListLongMap!195 0))(
  ( (ListLongMap!196 (toList!113 List!200)) )
))
(declare-fun contains!88 (ListLongMap!195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!72 (array!619 array!621 (_ BitVec 32) (_ BitVec 32) V!635 V!635 (_ BitVec 32) Int) ListLongMap!195)

(assert (=> b!7428 (= lt!1536 (contains!88 (getCurrentListMap!72 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun mapNonEmpty!488 () Bool)

(declare-fun mapRes!488 () Bool)

(declare-fun tp!1027 () Bool)

(declare-fun e!4124 () Bool)

(assert (=> mapNonEmpty!488 (= mapRes!488 (and tp!1027 e!4124))))

(declare-fun mapRest!488 () (Array (_ BitVec 32) ValueCell!155))

(declare-fun mapValue!488 () ValueCell!155)

(declare-fun mapKey!488 () (_ BitVec 32))

(assert (=> mapNonEmpty!488 (= (arr!298 _values!1492) (store mapRest!488 mapKey!488 mapValue!488))))

(declare-fun b!7429 () Bool)

(declare-fun e!4123 () Bool)

(declare-fun e!4126 () Bool)

(assert (=> b!7429 (= e!4123 (and e!4126 mapRes!488))))

(declare-fun condMapEmpty!488 () Bool)

(declare-fun mapDefault!488 () ValueCell!155)

