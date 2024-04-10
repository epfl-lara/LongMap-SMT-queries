; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38156 () Bool)

(assert start!38156)

(declare-fun b_free!9037 () Bool)

(declare-fun b_next!9037 () Bool)

(assert (=> start!38156 (= b_free!9037 (not b_next!9037))))

(declare-fun tp!31893 () Bool)

(declare-fun b_and!16399 () Bool)

(assert (=> start!38156 (= tp!31893 b_and!16399)))

(declare-fun mapIsEmpty!16158 () Bool)

(declare-fun mapRes!16158 () Bool)

(assert (=> mapIsEmpty!16158 mapRes!16158))

(declare-fun b!393340 () Bool)

(declare-fun e!238159 () Bool)

(declare-fun tp_is_empty!9709 () Bool)

(assert (=> b!393340 (= e!238159 tp_is_empty!9709)))

(declare-fun b!393342 () Bool)

(declare-fun e!238156 () Bool)

(assert (=> b!393342 (= e!238156 tp_is_empty!9709)))

(declare-fun b!393343 () Bool)

(declare-fun res!225356 () Bool)

(declare-fun e!238157 () Bool)

(assert (=> b!393343 (=> (not res!225356) (not e!238157))))

(declare-datatypes ((array!23323 0))(
  ( (array!23324 (arr!11120 (Array (_ BitVec 32) (_ BitVec 64))) (size!11472 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23323)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23323 (_ BitVec 32)) Bool)

(assert (=> b!393343 (= res!225356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393344 () Bool)

(declare-fun res!225359 () Bool)

(assert (=> b!393344 (=> (not res!225359) (not e!238157))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393344 (= res!225359 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11472 _keys!658))))))

(declare-fun b!393345 () Bool)

(declare-fun res!225354 () Bool)

(assert (=> b!393345 (=> (not res!225354) (not e!238157))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393345 (= res!225354 (validKeyInArray!0 k!778))))

(declare-fun b!393346 () Bool)

(declare-fun res!225351 () Bool)

(assert (=> b!393346 (=> (not res!225351) (not e!238157))))

(declare-datatypes ((List!6463 0))(
  ( (Nil!6460) (Cons!6459 (h!7315 (_ BitVec 64)) (t!11633 List!6463)) )
))
(declare-fun arrayNoDuplicates!0 (array!23323 (_ BitVec 32) List!6463) Bool)

(assert (=> b!393346 (= res!225351 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6460))))

(declare-fun b!393347 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun lt!186136 () Bool)

(declare-datatypes ((V!14051 0))(
  ( (V!14052 (val!4899 Int)) )
))
(declare-datatypes ((tuple2!6610 0))(
  ( (tuple2!6611 (_1!3316 (_ BitVec 64)) (_2!3316 V!14051)) )
))
(declare-datatypes ((List!6464 0))(
  ( (Nil!6461) (Cons!6460 (h!7316 tuple2!6610) (t!11634 List!6464)) )
))
(declare-datatypes ((ListLongMap!5523 0))(
  ( (ListLongMap!5524 (toList!2777 List!6464)) )
))
(declare-fun lt!186139 () ListLongMap!5523)

(declare-fun e!238155 () Bool)

(declare-fun lt!186142 () ListLongMap!5523)

(assert (=> b!393347 (= e!238155 (not (or (and (not lt!186136) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186136) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186136) (= lt!186142 lt!186139))))))

(assert (=> b!393347 (= lt!186136 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!186135 () ListLongMap!5523)

(declare-datatypes ((ValueCell!4511 0))(
  ( (ValueCellFull!4511 (v!7136 V!14051)) (EmptyCell!4511) )
))
(declare-datatypes ((array!23325 0))(
  ( (array!23326 (arr!11121 (Array (_ BitVec 32) ValueCell!4511)) (size!11473 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23325)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14051)

(declare-fun minValue!472 () V!14051)

(declare-fun getCurrentListMap!2118 (array!23323 array!23325 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) Int) ListLongMap!5523)

(assert (=> b!393347 (= lt!186135 (getCurrentListMap!2118 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186137 () array!23323)

(declare-fun lt!186140 () array!23325)

(assert (=> b!393347 (= lt!186142 (getCurrentListMap!2118 lt!186137 lt!186140 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186141 () ListLongMap!5523)

(assert (=> b!393347 (and (= lt!186139 lt!186141) (= lt!186141 lt!186139))))

(declare-fun v!373 () V!14051)

(declare-fun lt!186134 () ListLongMap!5523)

(declare-fun +!1072 (ListLongMap!5523 tuple2!6610) ListLongMap!5523)

(assert (=> b!393347 (= lt!186141 (+!1072 lt!186134 (tuple2!6611 k!778 v!373)))))

(declare-datatypes ((Unit!12030 0))(
  ( (Unit!12031) )
))
(declare-fun lt!186138 () Unit!12030)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!282 (array!23323 array!23325 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) (_ BitVec 64) V!14051 (_ BitVec 32) Int) Unit!12030)

(assert (=> b!393347 (= lt!186138 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!282 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!998 (array!23323 array!23325 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) Int) ListLongMap!5523)

(assert (=> b!393347 (= lt!186139 (getCurrentListMapNoExtraKeys!998 lt!186137 lt!186140 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393347 (= lt!186140 (array!23326 (store (arr!11121 _values!506) i!548 (ValueCellFull!4511 v!373)) (size!11473 _values!506)))))

(assert (=> b!393347 (= lt!186134 (getCurrentListMapNoExtraKeys!998 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!16158 () Bool)

(declare-fun tp!31892 () Bool)

(assert (=> mapNonEmpty!16158 (= mapRes!16158 (and tp!31892 e!238156))))

(declare-fun mapRest!16158 () (Array (_ BitVec 32) ValueCell!4511))

(declare-fun mapKey!16158 () (_ BitVec 32))

(declare-fun mapValue!16158 () ValueCell!4511)

(assert (=> mapNonEmpty!16158 (= (arr!11121 _values!506) (store mapRest!16158 mapKey!16158 mapValue!16158))))

(declare-fun b!393348 () Bool)

(declare-fun res!225357 () Bool)

(assert (=> b!393348 (=> (not res!225357) (not e!238157))))

(declare-fun arrayContainsKey!0 (array!23323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393348 (= res!225357 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393349 () Bool)

(assert (=> b!393349 (= e!238157 e!238155)))

(declare-fun res!225353 () Bool)

(assert (=> b!393349 (=> (not res!225353) (not e!238155))))

(assert (=> b!393349 (= res!225353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186137 mask!970))))

(assert (=> b!393349 (= lt!186137 (array!23324 (store (arr!11120 _keys!658) i!548 k!778) (size!11472 _keys!658)))))

(declare-fun b!393350 () Bool)

(declare-fun res!225358 () Bool)

(assert (=> b!393350 (=> (not res!225358) (not e!238155))))

(assert (=> b!393350 (= res!225358 (arrayNoDuplicates!0 lt!186137 #b00000000000000000000000000000000 Nil!6460))))

(declare-fun res!225355 () Bool)

(assert (=> start!38156 (=> (not res!225355) (not e!238157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38156 (= res!225355 (validMask!0 mask!970))))

(assert (=> start!38156 e!238157))

(declare-fun e!238154 () Bool)

(declare-fun array_inv!8166 (array!23325) Bool)

(assert (=> start!38156 (and (array_inv!8166 _values!506) e!238154)))

(assert (=> start!38156 tp!31893))

(assert (=> start!38156 true))

(assert (=> start!38156 tp_is_empty!9709))

(declare-fun array_inv!8167 (array!23323) Bool)

(assert (=> start!38156 (array_inv!8167 _keys!658)))

(declare-fun b!393341 () Bool)

(assert (=> b!393341 (= e!238154 (and e!238159 mapRes!16158))))

(declare-fun condMapEmpty!16158 () Bool)

(declare-fun mapDefault!16158 () ValueCell!4511)

