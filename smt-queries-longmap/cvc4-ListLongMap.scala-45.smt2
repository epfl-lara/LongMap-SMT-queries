; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!786 () Bool)

(assert start!786)

(declare-fun b_free!179 () Bool)

(declare-fun b_next!179 () Bool)

(assert (=> start!786 (= b_free!179 (not b_next!179))))

(declare-fun tp!767 () Bool)

(declare-fun b_and!325 () Bool)

(assert (=> start!786 (= tp!767 b_and!325)))

(declare-fun mapNonEmpty!356 () Bool)

(declare-fun mapRes!356 () Bool)

(declare-fun tp!766 () Bool)

(declare-fun e!3093 () Bool)

(assert (=> mapNonEmpty!356 (= mapRes!356 (and tp!766 e!3093))))

(declare-datatypes ((V!519 0))(
  ( (V!520 (val!134 Int)) )
))
(declare-datatypes ((ValueCell!112 0))(
  ( (ValueCellFull!112 (v!1225 V!519)) (EmptyCell!112) )
))
(declare-fun mapValue!356 () ValueCell!112)

(declare-datatypes ((array!451 0))(
  ( (array!452 (arr!214 (Array (_ BitVec 32) ValueCell!112)) (size!276 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!451)

(declare-fun mapKey!356 () (_ BitVec 32))

(declare-fun mapRest!356 () (Array (_ BitVec 32) ValueCell!112))

(assert (=> mapNonEmpty!356 (= (arr!214 _values!1492) (store mapRest!356 mapKey!356 mapValue!356))))

(declare-fun b!5689 () Bool)

(declare-fun e!3092 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5689 (= e!3092 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5690 () Bool)

(declare-fun tp_is_empty!257 () Bool)

(assert (=> b!5690 (= e!3093 tp_is_empty!257)))

(declare-fun b!5691 () Bool)

(declare-fun res!6375 () Bool)

(declare-fun e!3091 () Bool)

(assert (=> b!5691 (=> (not res!6375) (not e!3091))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!453 0))(
  ( (array!454 (arr!215 (Array (_ BitVec 32) (_ BitVec 64))) (size!277 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!453)

(assert (=> b!5691 (= res!6375 (and (= (size!276 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!277 _keys!1806) (size!276 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5692 () Bool)

(declare-fun arrayContainsKey!0 (array!453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5692 (= e!3092 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5693 () Bool)

(declare-fun e!3090 () Bool)

(assert (=> b!5693 (= e!3090 tp_is_empty!257)))

(declare-fun b!5694 () Bool)

(declare-fun res!6374 () Bool)

(assert (=> b!5694 (=> (not res!6374) (not e!3091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5694 (= res!6374 (validKeyInArray!0 k!1278))))

(declare-fun b!5695 () Bool)

(declare-fun res!6370 () Bool)

(assert (=> b!5695 (=> (not res!6370) (not e!3091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!453 (_ BitVec 32)) Bool)

(assert (=> b!5695 (= res!6370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!356 () Bool)

(assert (=> mapIsEmpty!356 mapRes!356))

(declare-fun b!5696 () Bool)

(declare-fun res!6371 () Bool)

(assert (=> b!5696 (=> (not res!6371) (not e!3091))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!519)

(declare-fun zeroValue!1434 () V!519)

(declare-datatypes ((tuple2!132 0))(
  ( (tuple2!133 (_1!66 (_ BitVec 64)) (_2!66 V!519)) )
))
(declare-datatypes ((List!145 0))(
  ( (Nil!142) (Cons!141 (h!707 tuple2!132) (t!2280 List!145)) )
))
(declare-datatypes ((ListLongMap!137 0))(
  ( (ListLongMap!138 (toList!84 List!145)) )
))
(declare-fun contains!58 (ListLongMap!137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!43 (array!453 array!451 (_ BitVec 32) (_ BitVec 32) V!519 V!519 (_ BitVec 32) Int) ListLongMap!137)

(assert (=> b!5696 (= res!6371 (contains!58 (getCurrentListMap!43 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5697 () Bool)

(declare-fun e!3095 () Bool)

(assert (=> b!5697 (= e!3091 (not e!3095))))

(declare-fun res!6376 () Bool)

(assert (=> b!5697 (=> res!6376 e!3095)))

(assert (=> b!5697 (= res!6376 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5697 e!3092))

(declare-fun c!401 () Bool)

(assert (=> b!5697 (= c!401 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!81 0))(
  ( (Unit!82) )
))
(declare-fun lt!1037 () Unit!81)

(declare-fun lemmaKeyInListMapIsInArray!26 (array!453 array!451 (_ BitVec 32) (_ BitVec 32) V!519 V!519 (_ BitVec 64) Int) Unit!81)

(assert (=> b!5697 (= lt!1037 (lemmaKeyInListMapIsInArray!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!5688 () Bool)

(declare-fun e!3094 () Bool)

(assert (=> b!5688 (= e!3094 (and e!3090 mapRes!356))))

(declare-fun condMapEmpty!356 () Bool)

(declare-fun mapDefault!356 () ValueCell!112)

