; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37266 () Bool)

(assert start!37266)

(declare-fun b_free!8393 () Bool)

(declare-fun b_next!8393 () Bool)

(assert (=> start!37266 (= b_free!8393 (not b_next!8393))))

(declare-fun tp!29894 () Bool)

(declare-fun b_and!15635 () Bool)

(assert (=> start!37266 (= tp!29894 b_and!15635)))

(declare-fun b!377286 () Bool)

(declare-fun res!213433 () Bool)

(declare-fun e!229711 () Bool)

(assert (=> b!377286 (=> (not res!213433) (not e!229711))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377286 (= res!213433 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15126 () Bool)

(declare-fun mapRes!15126 () Bool)

(declare-fun tp!29895 () Bool)

(declare-fun e!229712 () Bool)

(assert (=> mapNonEmpty!15126 (= mapRes!15126 (and tp!29895 e!229712))))

(declare-datatypes ((V!13159 0))(
  ( (V!13160 (val!4565 Int)) )
))
(declare-datatypes ((ValueCell!4177 0))(
  ( (ValueCellFull!4177 (v!6762 V!13159)) (EmptyCell!4177) )
))
(declare-datatypes ((array!22011 0))(
  ( (array!22012 (arr!10474 (Array (_ BitVec 32) ValueCell!4177)) (size!10826 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22011)

(declare-fun mapKey!15126 () (_ BitVec 32))

(declare-fun mapRest!15126 () (Array (_ BitVec 32) ValueCell!4177))

(declare-fun mapValue!15126 () ValueCell!4177)

(assert (=> mapNonEmpty!15126 (= (arr!10474 _values!506) (store mapRest!15126 mapKey!15126 mapValue!15126))))

(declare-fun b!377287 () Bool)

(declare-fun e!229714 () Bool)

(assert (=> b!377287 (= e!229714 true)))

(declare-datatypes ((tuple2!6084 0))(
  ( (tuple2!6085 (_1!3053 (_ BitVec 64)) (_2!3053 V!13159)) )
))
(declare-datatypes ((List!5925 0))(
  ( (Nil!5922) (Cons!5921 (h!6777 tuple2!6084) (t!11075 List!5925)) )
))
(declare-datatypes ((ListLongMap!4997 0))(
  ( (ListLongMap!4998 (toList!2514 List!5925)) )
))
(declare-fun lt!175372 () ListLongMap!4997)

(declare-fun lt!175371 () ListLongMap!4997)

(declare-fun lt!175368 () tuple2!6084)

(declare-fun +!860 (ListLongMap!4997 tuple2!6084) ListLongMap!4997)

(assert (=> b!377287 (= lt!175372 (+!860 lt!175371 lt!175368))))

(declare-fun v!373 () V!13159)

(declare-fun lt!175365 () ListLongMap!4997)

(declare-datatypes ((Unit!11624 0))(
  ( (Unit!11625) )
))
(declare-fun lt!175362 () Unit!11624)

(declare-fun zeroValue!472 () V!13159)

(declare-fun addCommutativeForDiffKeys!270 (ListLongMap!4997 (_ BitVec 64) V!13159 (_ BitVec 64) V!13159) Unit!11624)

(assert (=> b!377287 (= lt!175362 (addCommutativeForDiffKeys!270 lt!175365 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377288 () Bool)

(declare-fun e!229718 () Bool)

(assert (=> b!377288 (= e!229711 e!229718)))

(declare-fun res!213432 () Bool)

(assert (=> b!377288 (=> (not res!213432) (not e!229718))))

(declare-datatypes ((array!22013 0))(
  ( (array!22014 (arr!10475 (Array (_ BitVec 32) (_ BitVec 64))) (size!10827 (_ BitVec 32))) )
))
(declare-fun lt!175364 () array!22013)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22013 (_ BitVec 32)) Bool)

(assert (=> b!377288 (= res!213432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175364 mask!970))))

(declare-fun _keys!658 () array!22013)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377288 (= lt!175364 (array!22014 (store (arr!10475 _keys!658) i!548 k!778) (size!10827 _keys!658)))))

(declare-fun mapIsEmpty!15126 () Bool)

(assert (=> mapIsEmpty!15126 mapRes!15126))

(declare-fun b!377289 () Bool)

(declare-fun res!213426 () Bool)

(assert (=> b!377289 (=> (not res!213426) (not e!229711))))

(assert (=> b!377289 (= res!213426 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10827 _keys!658))))))

(declare-fun b!377290 () Bool)

(declare-fun res!213434 () Bool)

(assert (=> b!377290 (=> (not res!213434) (not e!229711))))

(declare-datatypes ((List!5926 0))(
  ( (Nil!5923) (Cons!5922 (h!6778 (_ BitVec 64)) (t!11076 List!5926)) )
))
(declare-fun arrayNoDuplicates!0 (array!22013 (_ BitVec 32) List!5926) Bool)

(assert (=> b!377290 (= res!213434 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5923))))

(declare-fun b!377292 () Bool)

(declare-fun res!213430 () Bool)

(assert (=> b!377292 (=> (not res!213430) (not e!229718))))

(assert (=> b!377292 (= res!213430 (arrayNoDuplicates!0 lt!175364 #b00000000000000000000000000000000 Nil!5923))))

(declare-fun b!377293 () Bool)

(declare-fun res!213427 () Bool)

(assert (=> b!377293 (=> (not res!213427) (not e!229711))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377293 (= res!213427 (and (= (size!10826 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10827 _keys!658) (size!10826 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377294 () Bool)

(declare-fun e!229715 () Bool)

(assert (=> b!377294 (= e!229718 (not e!229715))))

(declare-fun res!213424 () Bool)

(assert (=> b!377294 (=> res!213424 e!229715)))

(assert (=> b!377294 (= res!213424 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!175369 () ListLongMap!4997)

(declare-fun minValue!472 () V!13159)

(declare-fun getCurrentListMap!1945 (array!22013 array!22011 (_ BitVec 32) (_ BitVec 32) V!13159 V!13159 (_ BitVec 32) Int) ListLongMap!4997)

(assert (=> b!377294 (= lt!175369 (getCurrentListMap!1945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175373 () array!22011)

(declare-fun lt!175374 () ListLongMap!4997)

(assert (=> b!377294 (= lt!175374 (getCurrentListMap!1945 lt!175364 lt!175373 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175363 () ListLongMap!4997)

(declare-fun lt!175370 () ListLongMap!4997)

(assert (=> b!377294 (and (= lt!175363 lt!175370) (= lt!175370 lt!175363))))

(assert (=> b!377294 (= lt!175370 (+!860 lt!175365 lt!175368))))

(assert (=> b!377294 (= lt!175368 (tuple2!6085 k!778 v!373))))

(declare-fun lt!175367 () Unit!11624)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!103 (array!22013 array!22011 (_ BitVec 32) (_ BitVec 32) V!13159 V!13159 (_ BitVec 32) (_ BitVec 64) V!13159 (_ BitVec 32) Int) Unit!11624)

(assert (=> b!377294 (= lt!175367 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!103 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!779 (array!22013 array!22011 (_ BitVec 32) (_ BitVec 32) V!13159 V!13159 (_ BitVec 32) Int) ListLongMap!4997)

(assert (=> b!377294 (= lt!175363 (getCurrentListMapNoExtraKeys!779 lt!175364 lt!175373 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377294 (= lt!175373 (array!22012 (store (arr!10474 _values!506) i!548 (ValueCellFull!4177 v!373)) (size!10826 _values!506)))))

(assert (=> b!377294 (= lt!175365 (getCurrentListMapNoExtraKeys!779 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377295 () Bool)

(declare-fun res!213428 () Bool)

(assert (=> b!377295 (=> (not res!213428) (not e!229711))))

(declare-fun arrayContainsKey!0 (array!22013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377295 (= res!213428 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377296 () Bool)

(declare-fun tp_is_empty!9041 () Bool)

(assert (=> b!377296 (= e!229712 tp_is_empty!9041)))

(declare-fun b!377291 () Bool)

(assert (=> b!377291 (= e!229715 e!229714)))

(declare-fun res!213423 () Bool)

(assert (=> b!377291 (=> res!213423 e!229714)))

(assert (=> b!377291 (= res!213423 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377291 (= lt!175374 lt!175372)))

(declare-fun lt!175366 () tuple2!6084)

(assert (=> b!377291 (= lt!175372 (+!860 lt!175370 lt!175366))))

(assert (=> b!377291 (= lt!175369 lt!175371)))

(assert (=> b!377291 (= lt!175371 (+!860 lt!175365 lt!175366))))

(assert (=> b!377291 (= lt!175374 (+!860 lt!175363 lt!175366))))

(assert (=> b!377291 (= lt!175366 (tuple2!6085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!213425 () Bool)

(assert (=> start!37266 (=> (not res!213425) (not e!229711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37266 (= res!213425 (validMask!0 mask!970))))

(assert (=> start!37266 e!229711))

(declare-fun e!229713 () Bool)

(declare-fun array_inv!7720 (array!22011) Bool)

(assert (=> start!37266 (and (array_inv!7720 _values!506) e!229713)))

(assert (=> start!37266 tp!29894))

(assert (=> start!37266 true))

(assert (=> start!37266 tp_is_empty!9041))

(declare-fun array_inv!7721 (array!22013) Bool)

(assert (=> start!37266 (array_inv!7721 _keys!658)))

(declare-fun b!377297 () Bool)

(declare-fun res!213429 () Bool)

(assert (=> b!377297 (=> (not res!213429) (not e!229711))))

(assert (=> b!377297 (= res!213429 (or (= (select (arr!10475 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10475 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377298 () Bool)

(declare-fun e!229717 () Bool)

(assert (=> b!377298 (= e!229717 tp_is_empty!9041)))

(declare-fun b!377299 () Bool)

(declare-fun res!213431 () Bool)

(assert (=> b!377299 (=> (not res!213431) (not e!229711))))

(assert (=> b!377299 (= res!213431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377300 () Bool)

(assert (=> b!377300 (= e!229713 (and e!229717 mapRes!15126))))

(declare-fun condMapEmpty!15126 () Bool)

(declare-fun mapDefault!15126 () ValueCell!4177)

