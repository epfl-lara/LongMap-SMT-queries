; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!652 () Bool)

(assert start!652)

(declare-fun b_free!125 () Bool)

(declare-fun b_next!125 () Bool)

(assert (=> start!652 (= b_free!125 (not b_next!125))))

(declare-fun tp!592 () Bool)

(declare-fun b_and!263 () Bool)

(assert (=> start!652 (= tp!592 b_and!263)))

(declare-fun b!4278 () Bool)

(declare-fun e!2248 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4278 (= e!2248 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4279 () Bool)

(declare-fun e!2247 () Bool)

(assert (=> b!4279 (= e!2247 (not true))))

(assert (=> b!4279 e!2248))

(declare-fun c!200 () Bool)

(assert (=> b!4279 (= c!200 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!447 0))(
  ( (V!448 (val!107 Int)) )
))
(declare-datatypes ((ValueCell!85 0))(
  ( (ValueCellFull!85 (v!1194 V!447)) (EmptyCell!85) )
))
(declare-datatypes ((array!337 0))(
  ( (array!338 (arr!161 (Array (_ BitVec 32) ValueCell!85)) (size!223 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!337)

(declare-fun minValue!1434 () V!447)

(declare-datatypes ((array!339 0))(
  ( (array!340 (arr!162 (Array (_ BitVec 32) (_ BitVec 64))) (size!224 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!339)

(declare-datatypes ((Unit!33 0))(
  ( (Unit!34) )
))
(declare-fun lt!588 () Unit!33)

(declare-fun zeroValue!1434 () V!447)

(declare-fun lemmaKeyInListMapIsInArray!6 (array!339 array!337 (_ BitVec 32) (_ BitVec 32) V!447 V!447 (_ BitVec 64) Int) Unit!33)

(assert (=> b!4279 (= lt!588 (lemmaKeyInListMapIsInArray!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!4280 () Bool)

(declare-fun res!5645 () Bool)

(assert (=> b!4280 (=> (not res!5645) (not e!2247))))

(assert (=> b!4280 (= res!5645 (and (= (size!223 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!224 _keys!1806) (size!223 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4281 () Bool)

(declare-fun res!5648 () Bool)

(assert (=> b!4281 (=> (not res!5648) (not e!2247))))

(declare-datatypes ((tuple2!90 0))(
  ( (tuple2!91 (_1!45 (_ BitVec 64)) (_2!45 V!447)) )
))
(declare-datatypes ((List!100 0))(
  ( (Nil!97) (Cons!96 (h!662 tuple2!90) (t!2227 List!100)) )
))
(declare-datatypes ((ListLongMap!95 0))(
  ( (ListLongMap!96 (toList!63 List!100)) )
))
(declare-fun contains!33 (ListLongMap!95 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!22 (array!339 array!337 (_ BitVec 32) (_ BitVec 32) V!447 V!447 (_ BitVec 32) Int) ListLongMap!95)

(assert (=> b!4281 (= res!5648 (contains!33 (getCurrentListMap!22 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4282 () Bool)

(declare-fun res!5646 () Bool)

(assert (=> b!4282 (=> (not res!5646) (not e!2247))))

(declare-datatypes ((List!101 0))(
  ( (Nil!98) (Cons!97 (h!663 (_ BitVec 64)) (t!2228 List!101)) )
))
(declare-fun arrayNoDuplicates!0 (array!339 (_ BitVec 32) List!101) Bool)

(assert (=> b!4282 (= res!5646 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!98))))

(declare-fun res!5649 () Bool)

(assert (=> start!652 (=> (not res!5649) (not e!2247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!652 (= res!5649 (validMask!0 mask!2250))))

(assert (=> start!652 e!2247))

(assert (=> start!652 tp!592))

(assert (=> start!652 true))

(declare-fun e!2249 () Bool)

(declare-fun array_inv!117 (array!337) Bool)

(assert (=> start!652 (and (array_inv!117 _values!1492) e!2249)))

(declare-fun tp_is_empty!203 () Bool)

(assert (=> start!652 tp_is_empty!203))

(declare-fun array_inv!118 (array!339) Bool)

(assert (=> start!652 (array_inv!118 _keys!1806)))

(declare-fun b!4283 () Bool)

(declare-fun res!5650 () Bool)

(assert (=> b!4283 (=> (not res!5650) (not e!2247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4283 (= res!5650 (validKeyInArray!0 k!1278))))

(declare-fun b!4284 () Bool)

(declare-fun arrayContainsKey!0 (array!339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4284 (= e!2248 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!263 () Bool)

(declare-fun mapRes!263 () Bool)

(declare-fun tp!593 () Bool)

(declare-fun e!2246 () Bool)

(assert (=> mapNonEmpty!263 (= mapRes!263 (and tp!593 e!2246))))

(declare-fun mapValue!263 () ValueCell!85)

(declare-fun mapRest!263 () (Array (_ BitVec 32) ValueCell!85))

(declare-fun mapKey!263 () (_ BitVec 32))

(assert (=> mapNonEmpty!263 (= (arr!161 _values!1492) (store mapRest!263 mapKey!263 mapValue!263))))

(declare-fun b!4285 () Bool)

(assert (=> b!4285 (= e!2246 tp_is_empty!203)))

(declare-fun b!4286 () Bool)

(declare-fun e!2244 () Bool)

(assert (=> b!4286 (= e!2244 tp_is_empty!203)))

(declare-fun mapIsEmpty!263 () Bool)

(assert (=> mapIsEmpty!263 mapRes!263))

(declare-fun b!4287 () Bool)

(declare-fun res!5647 () Bool)

(assert (=> b!4287 (=> (not res!5647) (not e!2247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!339 (_ BitVec 32)) Bool)

(assert (=> b!4287 (= res!5647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4288 () Bool)

(assert (=> b!4288 (= e!2249 (and e!2244 mapRes!263))))

(declare-fun condMapEmpty!263 () Bool)

(declare-fun mapDefault!263 () ValueCell!85)

