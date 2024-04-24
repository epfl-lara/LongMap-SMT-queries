; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37482 () Bool)

(assert start!37482)

(declare-fun b_free!8623 () Bool)

(declare-fun b_next!8623 () Bool)

(assert (=> start!37482 (= b_free!8623 (not b_next!8623))))

(declare-fun tp!30584 () Bool)

(declare-fun b_and!15879 () Bool)

(assert (=> start!37482 (= tp!30584 b_and!15879)))

(declare-fun b!382311 () Bool)

(declare-fun res!217461 () Bool)

(declare-fun e!232335 () Bool)

(assert (=> b!382311 (=> (not res!217461) (not e!232335))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22440 0))(
  ( (array!22441 (arr!10688 (Array (_ BitVec 32) (_ BitVec 64))) (size!11040 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22440)

(assert (=> b!382311 (= res!217461 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11040 _keys!658))))))

(declare-fun b!382312 () Bool)

(declare-fun e!232334 () Bool)

(declare-fun tp_is_empty!9271 () Bool)

(assert (=> b!382312 (= e!232334 tp_is_empty!9271)))

(declare-fun b!382313 () Bool)

(declare-fun res!217462 () Bool)

(assert (=> b!382313 (=> (not res!217462) (not e!232335))))

(declare-datatypes ((List!6004 0))(
  ( (Nil!6001) (Cons!6000 (h!6856 (_ BitVec 64)) (t!11146 List!6004)) )
))
(declare-fun arrayNoDuplicates!0 (array!22440 (_ BitVec 32) List!6004) Bool)

(assert (=> b!382313 (= res!217462 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6001))))

(declare-fun b!382315 () Bool)

(declare-fun e!232329 () Bool)

(declare-fun mapRes!15471 () Bool)

(assert (=> b!382315 (= e!232329 (and e!232334 mapRes!15471))))

(declare-fun condMapEmpty!15471 () Bool)

(declare-datatypes ((V!13467 0))(
  ( (V!13468 (val!4680 Int)) )
))
(declare-datatypes ((ValueCell!4292 0))(
  ( (ValueCellFull!4292 (v!6878 V!13467)) (EmptyCell!4292) )
))
(declare-datatypes ((array!22442 0))(
  ( (array!22443 (arr!10689 (Array (_ BitVec 32) ValueCell!4292)) (size!11041 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22442)

(declare-fun mapDefault!15471 () ValueCell!4292)

(assert (=> b!382315 (= condMapEmpty!15471 (= (arr!10689 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4292)) mapDefault!15471)))))

(declare-fun mapNonEmpty!15471 () Bool)

(declare-fun tp!30585 () Bool)

(declare-fun e!232331 () Bool)

(assert (=> mapNonEmpty!15471 (= mapRes!15471 (and tp!30585 e!232331))))

(declare-fun mapKey!15471 () (_ BitVec 32))

(declare-fun mapValue!15471 () ValueCell!4292)

(declare-fun mapRest!15471 () (Array (_ BitVec 32) ValueCell!4292))

(assert (=> mapNonEmpty!15471 (= (arr!10689 _values!506) (store mapRest!15471 mapKey!15471 mapValue!15471))))

(declare-fun b!382316 () Bool)

(declare-fun res!217460 () Bool)

(assert (=> b!382316 (=> (not res!217460) (not e!232335))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382316 (= res!217460 (and (= (size!11041 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11040 _keys!658) (size!11041 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382317 () Bool)

(declare-fun e!232333 () Bool)

(declare-fun e!232330 () Bool)

(assert (=> b!382317 (= e!232333 (not e!232330))))

(declare-fun res!217465 () Bool)

(assert (=> b!382317 (=> res!217465 e!232330)))

(declare-fun lt!179390 () Bool)

(assert (=> b!382317 (= res!217465 (or (and (not lt!179390) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179390) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179390)))))

(assert (=> b!382317 (= lt!179390 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6168 0))(
  ( (tuple2!6169 (_1!3095 (_ BitVec 64)) (_2!3095 V!13467)) )
))
(declare-datatypes ((List!6005 0))(
  ( (Nil!6002) (Cons!6001 (h!6857 tuple2!6168) (t!11147 List!6005)) )
))
(declare-datatypes ((ListLongMap!5083 0))(
  ( (ListLongMap!5084 (toList!2557 List!6005)) )
))
(declare-fun lt!179397 () ListLongMap!5083)

(declare-fun zeroValue!472 () V!13467)

(declare-fun minValue!472 () V!13467)

(declare-fun getCurrentListMap!1993 (array!22440 array!22442 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) Int) ListLongMap!5083)

(assert (=> b!382317 (= lt!179397 (getCurrentListMap!1993 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179393 () ListLongMap!5083)

(declare-fun lt!179396 () array!22442)

(declare-fun lt!179395 () array!22440)

(assert (=> b!382317 (= lt!179393 (getCurrentListMap!1993 lt!179395 lt!179396 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179392 () ListLongMap!5083)

(declare-fun lt!179391 () ListLongMap!5083)

(assert (=> b!382317 (and (= lt!179392 lt!179391) (= lt!179391 lt!179392))))

(declare-fun v!373 () V!13467)

(declare-fun lt!179394 () ListLongMap!5083)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!951 (ListLongMap!5083 tuple2!6168) ListLongMap!5083)

(assert (=> b!382317 (= lt!179391 (+!951 lt!179394 (tuple2!6169 k0!778 v!373)))))

(declare-datatypes ((Unit!11781 0))(
  ( (Unit!11782) )
))
(declare-fun lt!179398 () Unit!11781)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!180 (array!22440 array!22442 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) (_ BitVec 64) V!13467 (_ BitVec 32) Int) Unit!11781)

(assert (=> b!382317 (= lt!179398 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!180 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!840 (array!22440 array!22442 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) Int) ListLongMap!5083)

(assert (=> b!382317 (= lt!179392 (getCurrentListMapNoExtraKeys!840 lt!179395 lt!179396 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382317 (= lt!179396 (array!22443 (store (arr!10689 _values!506) i!548 (ValueCellFull!4292 v!373)) (size!11041 _values!506)))))

(assert (=> b!382317 (= lt!179394 (getCurrentListMapNoExtraKeys!840 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382318 () Bool)

(declare-fun res!217468 () Bool)

(assert (=> b!382318 (=> (not res!217468) (not e!232333))))

(assert (=> b!382318 (= res!217468 (arrayNoDuplicates!0 lt!179395 #b00000000000000000000000000000000 Nil!6001))))

(declare-fun b!382319 () Bool)

(assert (=> b!382319 (= e!232331 tp_is_empty!9271)))

(declare-fun mapIsEmpty!15471 () Bool)

(assert (=> mapIsEmpty!15471 mapRes!15471))

(declare-fun b!382320 () Bool)

(declare-fun res!217467 () Bool)

(assert (=> b!382320 (=> (not res!217467) (not e!232335))))

(declare-fun arrayContainsKey!0 (array!22440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382320 (= res!217467 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382321 () Bool)

(declare-fun res!217464 () Bool)

(assert (=> b!382321 (=> (not res!217464) (not e!232335))))

(assert (=> b!382321 (= res!217464 (or (= (select (arr!10688 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10688 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382322 () Bool)

(assert (=> b!382322 (= e!232330 true)))

(assert (=> b!382322 (= lt!179393 lt!179392)))

(declare-fun b!382314 () Bool)

(declare-fun res!217469 () Bool)

(assert (=> b!382314 (=> (not res!217469) (not e!232335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22440 (_ BitVec 32)) Bool)

(assert (=> b!382314 (= res!217469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!217463 () Bool)

(assert (=> start!37482 (=> (not res!217463) (not e!232335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37482 (= res!217463 (validMask!0 mask!970))))

(assert (=> start!37482 e!232335))

(declare-fun array_inv!7912 (array!22442) Bool)

(assert (=> start!37482 (and (array_inv!7912 _values!506) e!232329)))

(assert (=> start!37482 tp!30584))

(assert (=> start!37482 true))

(assert (=> start!37482 tp_is_empty!9271))

(declare-fun array_inv!7913 (array!22440) Bool)

(assert (=> start!37482 (array_inv!7913 _keys!658)))

(declare-fun b!382323 () Bool)

(declare-fun res!217466 () Bool)

(assert (=> b!382323 (=> (not res!217466) (not e!232335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382323 (= res!217466 (validKeyInArray!0 k0!778))))

(declare-fun b!382324 () Bool)

(assert (=> b!382324 (= e!232335 e!232333)))

(declare-fun res!217459 () Bool)

(assert (=> b!382324 (=> (not res!217459) (not e!232333))))

(assert (=> b!382324 (= res!217459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179395 mask!970))))

(assert (=> b!382324 (= lt!179395 (array!22441 (store (arr!10688 _keys!658) i!548 k0!778) (size!11040 _keys!658)))))

(assert (= (and start!37482 res!217463) b!382316))

(assert (= (and b!382316 res!217460) b!382314))

(assert (= (and b!382314 res!217469) b!382313))

(assert (= (and b!382313 res!217462) b!382311))

(assert (= (and b!382311 res!217461) b!382323))

(assert (= (and b!382323 res!217466) b!382321))

(assert (= (and b!382321 res!217464) b!382320))

(assert (= (and b!382320 res!217467) b!382324))

(assert (= (and b!382324 res!217459) b!382318))

(assert (= (and b!382318 res!217468) b!382317))

(assert (= (and b!382317 (not res!217465)) b!382322))

(assert (= (and b!382315 condMapEmpty!15471) mapIsEmpty!15471))

(assert (= (and b!382315 (not condMapEmpty!15471)) mapNonEmpty!15471))

(get-info :version)

(assert (= (and mapNonEmpty!15471 ((_ is ValueCellFull!4292) mapValue!15471)) b!382319))

(assert (= (and b!382315 ((_ is ValueCellFull!4292) mapDefault!15471)) b!382312))

(assert (= start!37482 b!382315))

(declare-fun m!379421 () Bool)

(assert (=> b!382313 m!379421))

(declare-fun m!379423 () Bool)

(assert (=> b!382318 m!379423))

(declare-fun m!379425 () Bool)

(assert (=> b!382317 m!379425))

(declare-fun m!379427 () Bool)

(assert (=> b!382317 m!379427))

(declare-fun m!379429 () Bool)

(assert (=> b!382317 m!379429))

(declare-fun m!379431 () Bool)

(assert (=> b!382317 m!379431))

(declare-fun m!379433 () Bool)

(assert (=> b!382317 m!379433))

(declare-fun m!379435 () Bool)

(assert (=> b!382317 m!379435))

(declare-fun m!379437 () Bool)

(assert (=> b!382317 m!379437))

(declare-fun m!379439 () Bool)

(assert (=> b!382314 m!379439))

(declare-fun m!379441 () Bool)

(assert (=> b!382321 m!379441))

(declare-fun m!379443 () Bool)

(assert (=> start!37482 m!379443))

(declare-fun m!379445 () Bool)

(assert (=> start!37482 m!379445))

(declare-fun m!379447 () Bool)

(assert (=> start!37482 m!379447))

(declare-fun m!379449 () Bool)

(assert (=> mapNonEmpty!15471 m!379449))

(declare-fun m!379451 () Bool)

(assert (=> b!382323 m!379451))

(declare-fun m!379453 () Bool)

(assert (=> b!382320 m!379453))

(declare-fun m!379455 () Bool)

(assert (=> b!382324 m!379455))

(declare-fun m!379457 () Bool)

(assert (=> b!382324 m!379457))

(check-sat (not b!382320) (not start!37482) tp_is_empty!9271 (not mapNonEmpty!15471) (not b!382324) b_and!15879 (not b!382313) (not b!382323) (not b!382314) (not b_next!8623) (not b!382317) (not b!382318))
(check-sat b_and!15879 (not b_next!8623))
