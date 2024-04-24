; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37080 () Bool)

(assert start!37080)

(declare-fun b_free!8221 () Bool)

(declare-fun b_next!8221 () Bool)

(assert (=> start!37080 (= b_free!8221 (not b_next!8221))))

(declare-fun tp!29379 () Bool)

(declare-fun b_and!15477 () Bool)

(assert (=> start!37080 (= tp!29379 b_and!15477)))

(declare-fun b!373358 () Bool)

(declare-fun e!227620 () Bool)

(declare-fun e!227615 () Bool)

(declare-fun mapRes!14868 () Bool)

(assert (=> b!373358 (= e!227620 (and e!227615 mapRes!14868))))

(declare-fun condMapEmpty!14868 () Bool)

(declare-datatypes ((V!12931 0))(
  ( (V!12932 (val!4479 Int)) )
))
(declare-datatypes ((ValueCell!4091 0))(
  ( (ValueCellFull!4091 (v!6677 V!12931)) (EmptyCell!4091) )
))
(declare-datatypes ((array!21660 0))(
  ( (array!21661 (arr!10298 (Array (_ BitVec 32) ValueCell!4091)) (size!10650 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21660)

(declare-fun mapDefault!14868 () ValueCell!4091)

(assert (=> b!373358 (= condMapEmpty!14868 (= (arr!10298 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4091)) mapDefault!14868)))))

(declare-fun mapIsEmpty!14868 () Bool)

(assert (=> mapIsEmpty!14868 mapRes!14868))

(declare-fun b!373360 () Bool)

(declare-fun tp_is_empty!8869 () Bool)

(assert (=> b!373360 (= e!227615 tp_is_empty!8869)))

(declare-fun b!373361 () Bool)

(declare-fun res!210320 () Bool)

(declare-fun e!227619 () Bool)

(assert (=> b!373361 (=> (not res!210320) (not e!227619))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373361 (= res!210320 (validKeyInArray!0 k0!778))))

(declare-fun b!373362 () Bool)

(declare-fun res!210322 () Bool)

(assert (=> b!373362 (=> (not res!210322) (not e!227619))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21662 0))(
  ( (array!21663 (arr!10299 (Array (_ BitVec 32) (_ BitVec 64))) (size!10651 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21662)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373362 (= res!210322 (and (= (size!10650 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10651 _keys!658) (size!10650 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373363 () Bool)

(declare-fun res!210319 () Bool)

(assert (=> b!373363 (=> (not res!210319) (not e!227619))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373363 (= res!210319 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10651 _keys!658))))))

(declare-fun b!373364 () Bool)

(declare-fun e!227621 () Bool)

(declare-fun e!227622 () Bool)

(assert (=> b!373364 (= e!227621 e!227622)))

(declare-fun res!210318 () Bool)

(assert (=> b!373364 (=> res!210318 e!227622)))

(assert (=> b!373364 (= res!210318 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5850 0))(
  ( (tuple2!5851 (_1!2936 (_ BitVec 64)) (_2!2936 V!12931)) )
))
(declare-datatypes ((List!5694 0))(
  ( (Nil!5691) (Cons!5690 (h!6546 tuple2!5850) (t!10836 List!5694)) )
))
(declare-datatypes ((ListLongMap!4765 0))(
  ( (ListLongMap!4766 (toList!2398 List!5694)) )
))
(declare-fun lt!171466 () ListLongMap!4765)

(declare-fun lt!171463 () ListLongMap!4765)

(assert (=> b!373364 (= lt!171466 lt!171463)))

(declare-fun lt!171462 () ListLongMap!4765)

(declare-fun lt!171475 () tuple2!5850)

(declare-fun +!794 (ListLongMap!4765 tuple2!5850) ListLongMap!4765)

(assert (=> b!373364 (= lt!171463 (+!794 lt!171462 lt!171475))))

(declare-fun v!373 () V!12931)

(declare-datatypes ((Unit!11477 0))(
  ( (Unit!11478) )
))
(declare-fun lt!171472 () Unit!11477)

(declare-fun lt!171459 () ListLongMap!4765)

(declare-fun zeroValue!472 () V!12931)

(declare-fun addCommutativeForDiffKeys!223 (ListLongMap!4765 (_ BitVec 64) V!12931 (_ BitVec 64) V!12931) Unit!11477)

(assert (=> b!373364 (= lt!171472 (addCommutativeForDiffKeys!223 lt!171459 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171470 () ListLongMap!4765)

(declare-fun lt!171468 () tuple2!5850)

(assert (=> b!373364 (= lt!171470 (+!794 lt!171466 lt!171468))))

(declare-fun lt!171465 () ListLongMap!4765)

(declare-fun lt!171467 () tuple2!5850)

(assert (=> b!373364 (= lt!171466 (+!794 lt!171465 lt!171467))))

(declare-fun lt!171474 () ListLongMap!4765)

(declare-fun lt!171469 () ListLongMap!4765)

(assert (=> b!373364 (= lt!171474 lt!171469)))

(assert (=> b!373364 (= lt!171469 (+!794 lt!171462 lt!171468))))

(assert (=> b!373364 (= lt!171462 (+!794 lt!171459 lt!171467))))

(declare-fun lt!171460 () ListLongMap!4765)

(assert (=> b!373364 (= lt!171470 (+!794 (+!794 lt!171460 lt!171467) lt!171468))))

(declare-fun minValue!472 () V!12931)

(assert (=> b!373364 (= lt!171468 (tuple2!5851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373364 (= lt!171467 (tuple2!5851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373365 () Bool)

(declare-fun res!210324 () Bool)

(declare-fun e!227618 () Bool)

(assert (=> b!373365 (=> (not res!210324) (not e!227618))))

(declare-fun lt!171464 () array!21662)

(declare-datatypes ((List!5695 0))(
  ( (Nil!5692) (Cons!5691 (h!6547 (_ BitVec 64)) (t!10837 List!5695)) )
))
(declare-fun arrayNoDuplicates!0 (array!21662 (_ BitVec 32) List!5695) Bool)

(assert (=> b!373365 (= res!210324 (arrayNoDuplicates!0 lt!171464 #b00000000000000000000000000000000 Nil!5692))))

(declare-fun b!373366 () Bool)

(declare-fun res!210323 () Bool)

(assert (=> b!373366 (=> (not res!210323) (not e!227619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21662 (_ BitVec 32)) Bool)

(assert (=> b!373366 (= res!210323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373367 () Bool)

(declare-fun res!210326 () Bool)

(assert (=> b!373367 (=> (not res!210326) (not e!227619))))

(declare-fun arrayContainsKey!0 (array!21662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373367 (= res!210326 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373368 () Bool)

(assert (=> b!373368 (= e!227622 true)))

(assert (=> b!373368 (= (+!794 lt!171463 lt!171468) (+!794 lt!171469 lt!171475))))

(declare-fun lt!171471 () Unit!11477)

(assert (=> b!373368 (= lt!171471 (addCommutativeForDiffKeys!223 lt!171462 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!14868 () Bool)

(declare-fun tp!29378 () Bool)

(declare-fun e!227616 () Bool)

(assert (=> mapNonEmpty!14868 (= mapRes!14868 (and tp!29378 e!227616))))

(declare-fun mapKey!14868 () (_ BitVec 32))

(declare-fun mapRest!14868 () (Array (_ BitVec 32) ValueCell!4091))

(declare-fun mapValue!14868 () ValueCell!4091)

(assert (=> mapNonEmpty!14868 (= (arr!10298 _values!506) (store mapRest!14868 mapKey!14868 mapValue!14868))))

(declare-fun b!373359 () Bool)

(assert (=> b!373359 (= e!227618 (not e!227621))))

(declare-fun res!210316 () Bool)

(assert (=> b!373359 (=> res!210316 e!227621)))

(assert (=> b!373359 (= res!210316 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1859 (array!21662 array!21660 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) Int) ListLongMap!4765)

(assert (=> b!373359 (= lt!171474 (getCurrentListMap!1859 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171461 () array!21660)

(assert (=> b!373359 (= lt!171470 (getCurrentListMap!1859 lt!171464 lt!171461 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373359 (and (= lt!171460 lt!171465) (= lt!171465 lt!171460))))

(assert (=> b!373359 (= lt!171465 (+!794 lt!171459 lt!171475))))

(assert (=> b!373359 (= lt!171475 (tuple2!5851 k0!778 v!373))))

(declare-fun lt!171473 () Unit!11477)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!46 (array!21662 array!21660 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) (_ BitVec 64) V!12931 (_ BitVec 32) Int) Unit!11477)

(assert (=> b!373359 (= lt!171473 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!46 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!706 (array!21662 array!21660 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) Int) ListLongMap!4765)

(assert (=> b!373359 (= lt!171460 (getCurrentListMapNoExtraKeys!706 lt!171464 lt!171461 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373359 (= lt!171461 (array!21661 (store (arr!10298 _values!506) i!548 (ValueCellFull!4091 v!373)) (size!10650 _values!506)))))

(assert (=> b!373359 (= lt!171459 (getCurrentListMapNoExtraKeys!706 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!210315 () Bool)

(assert (=> start!37080 (=> (not res!210315) (not e!227619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37080 (= res!210315 (validMask!0 mask!970))))

(assert (=> start!37080 e!227619))

(declare-fun array_inv!7646 (array!21660) Bool)

(assert (=> start!37080 (and (array_inv!7646 _values!506) e!227620)))

(assert (=> start!37080 tp!29379))

(assert (=> start!37080 true))

(assert (=> start!37080 tp_is_empty!8869))

(declare-fun array_inv!7647 (array!21662) Bool)

(assert (=> start!37080 (array_inv!7647 _keys!658)))

(declare-fun b!373369 () Bool)

(assert (=> b!373369 (= e!227619 e!227618)))

(declare-fun res!210321 () Bool)

(assert (=> b!373369 (=> (not res!210321) (not e!227618))))

(assert (=> b!373369 (= res!210321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171464 mask!970))))

(assert (=> b!373369 (= lt!171464 (array!21663 (store (arr!10299 _keys!658) i!548 k0!778) (size!10651 _keys!658)))))

(declare-fun b!373370 () Bool)

(declare-fun res!210325 () Bool)

(assert (=> b!373370 (=> (not res!210325) (not e!227619))))

(assert (=> b!373370 (= res!210325 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5692))))

(declare-fun b!373371 () Bool)

(assert (=> b!373371 (= e!227616 tp_is_empty!8869)))

(declare-fun b!373372 () Bool)

(declare-fun res!210317 () Bool)

(assert (=> b!373372 (=> (not res!210317) (not e!227619))))

(assert (=> b!373372 (= res!210317 (or (= (select (arr!10299 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10299 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37080 res!210315) b!373362))

(assert (= (and b!373362 res!210322) b!373366))

(assert (= (and b!373366 res!210323) b!373370))

(assert (= (and b!373370 res!210325) b!373363))

(assert (= (and b!373363 res!210319) b!373361))

(assert (= (and b!373361 res!210320) b!373372))

(assert (= (and b!373372 res!210317) b!373367))

(assert (= (and b!373367 res!210326) b!373369))

(assert (= (and b!373369 res!210321) b!373365))

(assert (= (and b!373365 res!210324) b!373359))

(assert (= (and b!373359 (not res!210316)) b!373364))

(assert (= (and b!373364 (not res!210318)) b!373368))

(assert (= (and b!373358 condMapEmpty!14868) mapIsEmpty!14868))

(assert (= (and b!373358 (not condMapEmpty!14868)) mapNonEmpty!14868))

(get-info :version)

(assert (= (and mapNonEmpty!14868 ((_ is ValueCellFull!4091) mapValue!14868)) b!373371))

(assert (= (and b!373358 ((_ is ValueCellFull!4091) mapDefault!14868)) b!373360))

(assert (= start!37080 b!373358))

(declare-fun m!369545 () Bool)

(assert (=> mapNonEmpty!14868 m!369545))

(declare-fun m!369547 () Bool)

(assert (=> b!373370 m!369547))

(declare-fun m!369549 () Bool)

(assert (=> b!373361 m!369549))

(declare-fun m!369551 () Bool)

(assert (=> b!373368 m!369551))

(declare-fun m!369553 () Bool)

(assert (=> b!373368 m!369553))

(declare-fun m!369555 () Bool)

(assert (=> b!373368 m!369555))

(declare-fun m!369557 () Bool)

(assert (=> b!373366 m!369557))

(declare-fun m!369559 () Bool)

(assert (=> b!373359 m!369559))

(declare-fun m!369561 () Bool)

(assert (=> b!373359 m!369561))

(declare-fun m!369563 () Bool)

(assert (=> b!373359 m!369563))

(declare-fun m!369565 () Bool)

(assert (=> b!373359 m!369565))

(declare-fun m!369567 () Bool)

(assert (=> b!373359 m!369567))

(declare-fun m!369569 () Bool)

(assert (=> b!373359 m!369569))

(declare-fun m!369571 () Bool)

(assert (=> b!373359 m!369571))

(declare-fun m!369573 () Bool)

(assert (=> b!373364 m!369573))

(declare-fun m!369575 () Bool)

(assert (=> b!373364 m!369575))

(declare-fun m!369577 () Bool)

(assert (=> b!373364 m!369577))

(declare-fun m!369579 () Bool)

(assert (=> b!373364 m!369579))

(declare-fun m!369581 () Bool)

(assert (=> b!373364 m!369581))

(declare-fun m!369583 () Bool)

(assert (=> b!373364 m!369583))

(declare-fun m!369585 () Bool)

(assert (=> b!373364 m!369585))

(declare-fun m!369587 () Bool)

(assert (=> b!373364 m!369587))

(assert (=> b!373364 m!369573))

(declare-fun m!369589 () Bool)

(assert (=> b!373369 m!369589))

(declare-fun m!369591 () Bool)

(assert (=> b!373369 m!369591))

(declare-fun m!369593 () Bool)

(assert (=> start!37080 m!369593))

(declare-fun m!369595 () Bool)

(assert (=> start!37080 m!369595))

(declare-fun m!369597 () Bool)

(assert (=> start!37080 m!369597))

(declare-fun m!369599 () Bool)

(assert (=> b!373372 m!369599))

(declare-fun m!369601 () Bool)

(assert (=> b!373367 m!369601))

(declare-fun m!369603 () Bool)

(assert (=> b!373365 m!369603))

(check-sat (not b!373366) (not b!373365) (not b!373367) (not mapNonEmpty!14868) (not b!373364) (not b!373361) (not b!373370) (not start!37080) (not b_next!8221) b_and!15477 tp_is_empty!8869 (not b!373359) (not b!373369) (not b!373368))
(check-sat b_and!15477 (not b_next!8221))
