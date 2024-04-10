; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37496 () Bool)

(assert start!37496)

(declare-fun b_free!8623 () Bool)

(declare-fun b_next!8623 () Bool)

(assert (=> start!37496 (= b_free!8623 (not b_next!8623))))

(declare-fun tp!30584 () Bool)

(declare-fun b_and!15865 () Bool)

(assert (=> start!37496 (= tp!30584 b_and!15865)))

(declare-fun b!382361 () Bool)

(declare-fun res!217462 () Bool)

(declare-fun e!232363 () Bool)

(assert (=> b!382361 (=> (not res!217462) (not e!232363))))

(declare-datatypes ((array!22451 0))(
  ( (array!22452 (arr!10694 (Array (_ BitVec 32) (_ BitVec 64))) (size!11046 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22451)

(declare-datatypes ((List!6123 0))(
  ( (Nil!6120) (Cons!6119 (h!6975 (_ BitVec 64)) (t!11273 List!6123)) )
))
(declare-fun arrayNoDuplicates!0 (array!22451 (_ BitVec 32) List!6123) Bool)

(assert (=> b!382361 (= res!217462 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6120))))

(declare-fun b!382362 () Bool)

(declare-fun e!232365 () Bool)

(assert (=> b!382362 (= e!232363 e!232365)))

(declare-fun res!217469 () Bool)

(assert (=> b!382362 (=> (not res!217469) (not e!232365))))

(declare-fun lt!179377 () array!22451)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22451 (_ BitVec 32)) Bool)

(assert (=> b!382362 (= res!217469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179377 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382362 (= lt!179377 (array!22452 (store (arr!10694 _keys!658) i!548 k!778) (size!11046 _keys!658)))))

(declare-fun b!382363 () Bool)

(declare-fun e!232364 () Bool)

(assert (=> b!382363 (= e!232364 true)))

(declare-datatypes ((V!13467 0))(
  ( (V!13468 (val!4680 Int)) )
))
(declare-datatypes ((tuple2!6292 0))(
  ( (tuple2!6293 (_1!3157 (_ BitVec 64)) (_2!3157 V!13467)) )
))
(declare-datatypes ((List!6124 0))(
  ( (Nil!6121) (Cons!6120 (h!6976 tuple2!6292) (t!11274 List!6124)) )
))
(declare-datatypes ((ListLongMap!5205 0))(
  ( (ListLongMap!5206 (toList!2618 List!6124)) )
))
(declare-fun lt!179372 () ListLongMap!5205)

(declare-fun lt!179376 () ListLongMap!5205)

(assert (=> b!382363 (= lt!179372 lt!179376)))

(declare-fun b!382364 () Bool)

(declare-fun res!217470 () Bool)

(assert (=> b!382364 (=> (not res!217470) (not e!232363))))

(assert (=> b!382364 (= res!217470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382365 () Bool)

(declare-fun e!232367 () Bool)

(declare-fun tp_is_empty!9271 () Bool)

(assert (=> b!382365 (= e!232367 tp_is_empty!9271)))

(declare-fun b!382366 () Bool)

(declare-fun res!217466 () Bool)

(assert (=> b!382366 (=> (not res!217466) (not e!232363))))

(assert (=> b!382366 (= res!217466 (or (= (select (arr!10694 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10694 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382367 () Bool)

(declare-fun res!217465 () Bool)

(assert (=> b!382367 (=> (not res!217465) (not e!232363))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4292 0))(
  ( (ValueCellFull!4292 (v!6877 V!13467)) (EmptyCell!4292) )
))
(declare-datatypes ((array!22453 0))(
  ( (array!22454 (arr!10695 (Array (_ BitVec 32) ValueCell!4292)) (size!11047 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22453)

(assert (=> b!382367 (= res!217465 (and (= (size!11047 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11046 _keys!658) (size!11047 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382368 () Bool)

(declare-fun res!217472 () Bool)

(assert (=> b!382368 (=> (not res!217472) (not e!232363))))

(assert (=> b!382368 (= res!217472 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11046 _keys!658))))))

(declare-fun b!382369 () Bool)

(declare-fun res!217467 () Bool)

(assert (=> b!382369 (=> (not res!217467) (not e!232363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382369 (= res!217467 (validKeyInArray!0 k!778))))

(declare-fun res!217471 () Bool)

(assert (=> start!37496 (=> (not res!217471) (not e!232363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37496 (= res!217471 (validMask!0 mask!970))))

(assert (=> start!37496 e!232363))

(declare-fun e!232362 () Bool)

(declare-fun array_inv!7874 (array!22453) Bool)

(assert (=> start!37496 (and (array_inv!7874 _values!506) e!232362)))

(assert (=> start!37496 tp!30584))

(assert (=> start!37496 true))

(assert (=> start!37496 tp_is_empty!9271))

(declare-fun array_inv!7875 (array!22451) Bool)

(assert (=> start!37496 (array_inv!7875 _keys!658)))

(declare-fun b!382360 () Bool)

(assert (=> b!382360 (= e!232365 (not e!232364))))

(declare-fun res!217464 () Bool)

(assert (=> b!382360 (=> res!217464 e!232364)))

(declare-fun lt!179371 () Bool)

(assert (=> b!382360 (= res!217464 (or (and (not lt!179371) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179371) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179371)))))

(assert (=> b!382360 (= lt!179371 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179374 () ListLongMap!5205)

(declare-fun zeroValue!472 () V!13467)

(declare-fun minValue!472 () V!13467)

(declare-fun getCurrentListMap!2024 (array!22451 array!22453 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) Int) ListLongMap!5205)

(assert (=> b!382360 (= lt!179374 (getCurrentListMap!2024 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179378 () array!22453)

(assert (=> b!382360 (= lt!179372 (getCurrentListMap!2024 lt!179377 lt!179378 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179379 () ListLongMap!5205)

(assert (=> b!382360 (and (= lt!179376 lt!179379) (= lt!179379 lt!179376))))

(declare-fun v!373 () V!13467)

(declare-fun lt!179373 () ListLongMap!5205)

(declare-fun +!954 (ListLongMap!5205 tuple2!6292) ListLongMap!5205)

(assert (=> b!382360 (= lt!179379 (+!954 lt!179373 (tuple2!6293 k!778 v!373)))))

(declare-datatypes ((Unit!11802 0))(
  ( (Unit!11803) )
))
(declare-fun lt!179375 () Unit!11802)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!182 (array!22451 array!22453 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) (_ BitVec 64) V!13467 (_ BitVec 32) Int) Unit!11802)

(assert (=> b!382360 (= lt!179375 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!182 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!858 (array!22451 array!22453 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) Int) ListLongMap!5205)

(assert (=> b!382360 (= lt!179376 (getCurrentListMapNoExtraKeys!858 lt!179377 lt!179378 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382360 (= lt!179378 (array!22454 (store (arr!10695 _values!506) i!548 (ValueCellFull!4292 v!373)) (size!11047 _values!506)))))

(assert (=> b!382360 (= lt!179373 (getCurrentListMapNoExtraKeys!858 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15471 () Bool)

(declare-fun mapRes!15471 () Bool)

(assert (=> mapIsEmpty!15471 mapRes!15471))

(declare-fun b!382370 () Bool)

(declare-fun res!217468 () Bool)

(assert (=> b!382370 (=> (not res!217468) (not e!232363))))

(declare-fun arrayContainsKey!0 (array!22451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382370 (= res!217468 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382371 () Bool)

(declare-fun e!232366 () Bool)

(assert (=> b!382371 (= e!232366 tp_is_empty!9271)))

(declare-fun mapNonEmpty!15471 () Bool)

(declare-fun tp!30585 () Bool)

(assert (=> mapNonEmpty!15471 (= mapRes!15471 (and tp!30585 e!232366))))

(declare-fun mapKey!15471 () (_ BitVec 32))

(declare-fun mapRest!15471 () (Array (_ BitVec 32) ValueCell!4292))

(declare-fun mapValue!15471 () ValueCell!4292)

(assert (=> mapNonEmpty!15471 (= (arr!10695 _values!506) (store mapRest!15471 mapKey!15471 mapValue!15471))))

(declare-fun b!382372 () Bool)

(declare-fun res!217463 () Bool)

(assert (=> b!382372 (=> (not res!217463) (not e!232365))))

(assert (=> b!382372 (= res!217463 (arrayNoDuplicates!0 lt!179377 #b00000000000000000000000000000000 Nil!6120))))

(declare-fun b!382373 () Bool)

(assert (=> b!382373 (= e!232362 (and e!232367 mapRes!15471))))

(declare-fun condMapEmpty!15471 () Bool)

(declare-fun mapDefault!15471 () ValueCell!4292)

