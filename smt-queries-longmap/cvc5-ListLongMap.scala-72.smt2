; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!986 () Bool)

(assert start!986)

(declare-fun b_free!337 () Bool)

(declare-fun b_next!337 () Bool)

(assert (=> start!986 (= b_free!337 (not b_next!337))))

(declare-fun tp!1247 () Bool)

(declare-fun b_and!487 () Bool)

(assert (=> start!986 (= tp!1247 b_and!487)))

(declare-fun b!8456 () Bool)

(declare-fun res!7972 () Bool)

(declare-fun e!4811 () Bool)

(assert (=> b!8456 (=> (not res!7972) (not e!4811))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!731 0))(
  ( (V!732 (val!213 Int)) )
))
(declare-datatypes ((ValueCell!191 0))(
  ( (ValueCellFull!191 (v!1306 V!731)) (EmptyCell!191) )
))
(declare-datatypes ((array!761 0))(
  ( (array!762 (arr!367 (Array (_ BitVec 32) ValueCell!191)) (size!429 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!761)

(declare-fun minValue!1434 () V!731)

(declare-datatypes ((array!763 0))(
  ( (array!764 (arr!368 (Array (_ BitVec 32) (_ BitVec 64))) (size!430 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!763)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!731)

(declare-datatypes ((tuple2!242 0))(
  ( (tuple2!243 (_1!121 (_ BitVec 64)) (_2!121 V!731)) )
))
(declare-datatypes ((List!253 0))(
  ( (Nil!250) (Cons!249 (h!815 tuple2!242) (t!2392 List!253)) )
))
(declare-datatypes ((ListLongMap!247 0))(
  ( (ListLongMap!248 (toList!139 List!253)) )
))
(declare-fun contains!115 (ListLongMap!247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!98 (array!763 array!761 (_ BitVec 32) (_ BitVec 32) V!731 V!731 (_ BitVec 32) Int) ListLongMap!247)

(assert (=> b!8456 (= res!7972 (contains!115 (getCurrentListMap!98 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8457 () Bool)

(declare-fun res!7975 () Bool)

(assert (=> b!8457 (=> (not res!7975) (not e!4811))))

(assert (=> b!8457 (= res!7975 (and (= (size!429 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!430 _keys!1806) (size!429 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8458 () Bool)

(declare-fun e!4810 () Bool)

(declare-fun tp_is_empty!415 () Bool)

(assert (=> b!8458 (= e!4810 tp_is_empty!415)))

(declare-fun mapNonEmpty!599 () Bool)

(declare-fun mapRes!599 () Bool)

(declare-fun tp!1246 () Bool)

(declare-fun e!4808 () Bool)

(assert (=> mapNonEmpty!599 (= mapRes!599 (and tp!1246 e!4808))))

(declare-fun mapRest!599 () (Array (_ BitVec 32) ValueCell!191))

(declare-fun mapValue!599 () ValueCell!191)

(declare-fun mapKey!599 () (_ BitVec 32))

(assert (=> mapNonEmpty!599 (= (arr!367 _values!1492) (store mapRest!599 mapKey!599 mapValue!599))))

(declare-fun b!8459 () Bool)

(declare-fun e!4807 () Bool)

(assert (=> b!8459 (= e!4807 (and e!4810 mapRes!599))))

(declare-fun condMapEmpty!599 () Bool)

(declare-fun mapDefault!599 () ValueCell!191)

