; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37096 () Bool)

(assert start!37096)

(declare-fun b_free!8223 () Bool)

(declare-fun b_next!8223 () Bool)

(assert (=> start!37096 (= b_free!8223 (not b_next!8223))))

(declare-fun tp!29385 () Bool)

(declare-fun b_and!15465 () Bool)

(assert (=> start!37096 (= tp!29385 b_and!15465)))

(declare-fun b!373452 () Bool)

(declare-fun res!210363 () Bool)

(declare-fun e!227678 () Bool)

(assert (=> b!373452 (=> (not res!210363) (not e!227678))))

(declare-datatypes ((array!21683 0))(
  ( (array!21684 (arr!10310 (Array (_ BitVec 32) (_ BitVec 64))) (size!10662 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21683)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373452 (= res!210363 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!210358 () Bool)

(assert (=> start!37096 (=> (not res!210358) (not e!227678))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37096 (= res!210358 (validMask!0 mask!970))))

(assert (=> start!37096 e!227678))

(declare-datatypes ((V!12933 0))(
  ( (V!12934 (val!4480 Int)) )
))
(declare-datatypes ((ValueCell!4092 0))(
  ( (ValueCellFull!4092 (v!6677 V!12933)) (EmptyCell!4092) )
))
(declare-datatypes ((array!21685 0))(
  ( (array!21686 (arr!10311 (Array (_ BitVec 32) ValueCell!4092)) (size!10663 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21685)

(declare-fun e!227676 () Bool)

(declare-fun array_inv!7598 (array!21685) Bool)

(assert (=> start!37096 (and (array_inv!7598 _values!506) e!227676)))

(assert (=> start!37096 tp!29385))

(assert (=> start!37096 true))

(declare-fun tp_is_empty!8871 () Bool)

(assert (=> start!37096 tp_is_empty!8871))

(declare-fun array_inv!7599 (array!21683) Bool)

(assert (=> start!37096 (array_inv!7599 _keys!658)))

(declare-fun b!373453 () Bool)

(declare-fun res!210361 () Bool)

(declare-fun e!227674 () Bool)

(assert (=> b!373453 (=> (not res!210361) (not e!227674))))

(declare-fun lt!171506 () array!21683)

(declare-datatypes ((List!5793 0))(
  ( (Nil!5790) (Cons!5789 (h!6645 (_ BitVec 64)) (t!10943 List!5793)) )
))
(declare-fun arrayNoDuplicates!0 (array!21683 (_ BitVec 32) List!5793) Bool)

(assert (=> b!373453 (= res!210361 (arrayNoDuplicates!0 lt!171506 #b00000000000000000000000000000000 Nil!5790))))

(declare-fun b!373454 () Bool)

(declare-fun res!210365 () Bool)

(assert (=> b!373454 (=> (not res!210365) (not e!227678))))

(assert (=> b!373454 (= res!210365 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5790))))

(declare-fun b!373455 () Bool)

(declare-fun e!227671 () Bool)

(assert (=> b!373455 (= e!227674 (not e!227671))))

(declare-fun res!210355 () Bool)

(assert (=> b!373455 (=> res!210355 e!227671)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373455 (= res!210355 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!472 () V!12933)

(declare-datatypes ((tuple2!5948 0))(
  ( (tuple2!5949 (_1!2985 (_ BitVec 64)) (_2!2985 V!12933)) )
))
(declare-datatypes ((List!5794 0))(
  ( (Nil!5791) (Cons!5790 (h!6646 tuple2!5948) (t!10944 List!5794)) )
))
(declare-datatypes ((ListLongMap!4861 0))(
  ( (ListLongMap!4862 (toList!2446 List!5794)) )
))
(declare-fun lt!171500 () ListLongMap!4861)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12933)

(declare-fun getCurrentListMap!1887 (array!21683 array!21685 (_ BitVec 32) (_ BitVec 32) V!12933 V!12933 (_ BitVec 32) Int) ListLongMap!4861)

(assert (=> b!373455 (= lt!171500 (getCurrentListMap!1887 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171498 () array!21685)

(declare-fun lt!171493 () ListLongMap!4861)

(assert (=> b!373455 (= lt!171493 (getCurrentListMap!1887 lt!171506 lt!171498 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171496 () ListLongMap!4861)

(declare-fun lt!171502 () ListLongMap!4861)

(assert (=> b!373455 (and (= lt!171496 lt!171502) (= lt!171502 lt!171496))))

(declare-fun lt!171492 () ListLongMap!4861)

(declare-fun lt!171505 () tuple2!5948)

(declare-fun +!792 (ListLongMap!4861 tuple2!5948) ListLongMap!4861)

(assert (=> b!373455 (= lt!171502 (+!792 lt!171492 lt!171505))))

(declare-fun v!373 () V!12933)

(assert (=> b!373455 (= lt!171505 (tuple2!5949 k0!778 v!373))))

(declare-datatypes ((Unit!11490 0))(
  ( (Unit!11491) )
))
(declare-fun lt!171497 () Unit!11490)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!45 (array!21683 array!21685 (_ BitVec 32) (_ BitVec 32) V!12933 V!12933 (_ BitVec 32) (_ BitVec 64) V!12933 (_ BitVec 32) Int) Unit!11490)

(assert (=> b!373455 (= lt!171497 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!45 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!721 (array!21683 array!21685 (_ BitVec 32) (_ BitVec 32) V!12933 V!12933 (_ BitVec 32) Int) ListLongMap!4861)

(assert (=> b!373455 (= lt!171496 (getCurrentListMapNoExtraKeys!721 lt!171506 lt!171498 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373455 (= lt!171498 (array!21686 (store (arr!10311 _values!506) i!548 (ValueCellFull!4092 v!373)) (size!10663 _values!506)))))

(assert (=> b!373455 (= lt!171492 (getCurrentListMapNoExtraKeys!721 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373456 () Bool)

(declare-fun res!210362 () Bool)

(assert (=> b!373456 (=> (not res!210362) (not e!227678))))

(assert (=> b!373456 (= res!210362 (or (= (select (arr!10310 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10310 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373457 () Bool)

(declare-fun e!227675 () Bool)

(declare-fun mapRes!14871 () Bool)

(assert (=> b!373457 (= e!227676 (and e!227675 mapRes!14871))))

(declare-fun condMapEmpty!14871 () Bool)

(declare-fun mapDefault!14871 () ValueCell!4092)

(assert (=> b!373457 (= condMapEmpty!14871 (= (arr!10311 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4092)) mapDefault!14871)))))

(declare-fun b!373458 () Bool)

(assert (=> b!373458 (= e!227675 tp_is_empty!8871)))

(declare-fun b!373459 () Bool)

(declare-fun res!210356 () Bool)

(assert (=> b!373459 (=> (not res!210356) (not e!227678))))

(assert (=> b!373459 (= res!210356 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10662 _keys!658))))))

(declare-fun mapIsEmpty!14871 () Bool)

(assert (=> mapIsEmpty!14871 mapRes!14871))

(declare-fun b!373460 () Bool)

(declare-fun res!210357 () Bool)

(assert (=> b!373460 (=> (not res!210357) (not e!227678))))

(assert (=> b!373460 (= res!210357 (and (= (size!10663 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10662 _keys!658) (size!10663 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373461 () Bool)

(assert (=> b!373461 (= e!227678 e!227674)))

(declare-fun res!210364 () Bool)

(assert (=> b!373461 (=> (not res!210364) (not e!227674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21683 (_ BitVec 32)) Bool)

(assert (=> b!373461 (= res!210364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171506 mask!970))))

(assert (=> b!373461 (= lt!171506 (array!21684 (store (arr!10310 _keys!658) i!548 k0!778) (size!10662 _keys!658)))))

(declare-fun b!373462 () Bool)

(declare-fun e!227673 () Bool)

(assert (=> b!373462 (= e!227673 true)))

(declare-fun lt!171495 () tuple2!5948)

(declare-fun lt!171491 () ListLongMap!4861)

(declare-fun lt!171494 () ListLongMap!4861)

(assert (=> b!373462 (= (+!792 lt!171494 lt!171495) (+!792 lt!171491 lt!171505))))

(declare-fun lt!171499 () Unit!11490)

(declare-fun lt!171507 () ListLongMap!4861)

(declare-fun addCommutativeForDiffKeys!217 (ListLongMap!4861 (_ BitVec 64) V!12933 (_ BitVec 64) V!12933) Unit!11490)

(assert (=> b!373462 (= lt!171499 (addCommutativeForDiffKeys!217 lt!171507 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373463 () Bool)

(declare-fun res!210354 () Bool)

(assert (=> b!373463 (=> (not res!210354) (not e!227678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373463 (= res!210354 (validKeyInArray!0 k0!778))))

(declare-fun b!373464 () Bool)

(assert (=> b!373464 (= e!227671 e!227673)))

(declare-fun res!210360 () Bool)

(assert (=> b!373464 (=> res!210360 e!227673)))

(assert (=> b!373464 (= res!210360 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171504 () ListLongMap!4861)

(assert (=> b!373464 (= lt!171504 lt!171494)))

(assert (=> b!373464 (= lt!171494 (+!792 lt!171507 lt!171505))))

(declare-fun lt!171501 () Unit!11490)

(assert (=> b!373464 (= lt!171501 (addCommutativeForDiffKeys!217 lt!171492 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373464 (= lt!171493 (+!792 lt!171504 lt!171495))))

(declare-fun lt!171503 () tuple2!5948)

(assert (=> b!373464 (= lt!171504 (+!792 lt!171502 lt!171503))))

(assert (=> b!373464 (= lt!171500 lt!171491)))

(assert (=> b!373464 (= lt!171491 (+!792 lt!171507 lt!171495))))

(assert (=> b!373464 (= lt!171507 (+!792 lt!171492 lt!171503))))

(assert (=> b!373464 (= lt!171493 (+!792 (+!792 lt!171496 lt!171503) lt!171495))))

(assert (=> b!373464 (= lt!171495 (tuple2!5949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373464 (= lt!171503 (tuple2!5949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14871 () Bool)

(declare-fun tp!29384 () Bool)

(declare-fun e!227672 () Bool)

(assert (=> mapNonEmpty!14871 (= mapRes!14871 (and tp!29384 e!227672))))

(declare-fun mapRest!14871 () (Array (_ BitVec 32) ValueCell!4092))

(declare-fun mapKey!14871 () (_ BitVec 32))

(declare-fun mapValue!14871 () ValueCell!4092)

(assert (=> mapNonEmpty!14871 (= (arr!10311 _values!506) (store mapRest!14871 mapKey!14871 mapValue!14871))))

(declare-fun b!373465 () Bool)

(declare-fun res!210359 () Bool)

(assert (=> b!373465 (=> (not res!210359) (not e!227678))))

(assert (=> b!373465 (= res!210359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373466 () Bool)

(assert (=> b!373466 (= e!227672 tp_is_empty!8871)))

(assert (= (and start!37096 res!210358) b!373460))

(assert (= (and b!373460 res!210357) b!373465))

(assert (= (and b!373465 res!210359) b!373454))

(assert (= (and b!373454 res!210365) b!373459))

(assert (= (and b!373459 res!210356) b!373463))

(assert (= (and b!373463 res!210354) b!373456))

(assert (= (and b!373456 res!210362) b!373452))

(assert (= (and b!373452 res!210363) b!373461))

(assert (= (and b!373461 res!210364) b!373453))

(assert (= (and b!373453 res!210361) b!373455))

(assert (= (and b!373455 (not res!210355)) b!373464))

(assert (= (and b!373464 (not res!210360)) b!373462))

(assert (= (and b!373457 condMapEmpty!14871) mapIsEmpty!14871))

(assert (= (and b!373457 (not condMapEmpty!14871)) mapNonEmpty!14871))

(get-info :version)

(assert (= (and mapNonEmpty!14871 ((_ is ValueCellFull!4092) mapValue!14871)) b!373466))

(assert (= (and b!373457 ((_ is ValueCellFull!4092) mapDefault!14871)) b!373458))

(assert (= start!37096 b!373457))

(declare-fun m!369375 () Bool)

(assert (=> b!373453 m!369375))

(declare-fun m!369377 () Bool)

(assert (=> b!373454 m!369377))

(declare-fun m!369379 () Bool)

(assert (=> b!373456 m!369379))

(declare-fun m!369381 () Bool)

(assert (=> b!373462 m!369381))

(declare-fun m!369383 () Bool)

(assert (=> b!373462 m!369383))

(declare-fun m!369385 () Bool)

(assert (=> b!373462 m!369385))

(declare-fun m!369387 () Bool)

(assert (=> b!373452 m!369387))

(declare-fun m!369389 () Bool)

(assert (=> b!373463 m!369389))

(declare-fun m!369391 () Bool)

(assert (=> start!37096 m!369391))

(declare-fun m!369393 () Bool)

(assert (=> start!37096 m!369393))

(declare-fun m!369395 () Bool)

(assert (=> start!37096 m!369395))

(declare-fun m!369397 () Bool)

(assert (=> b!373464 m!369397))

(declare-fun m!369399 () Bool)

(assert (=> b!373464 m!369399))

(declare-fun m!369401 () Bool)

(assert (=> b!373464 m!369401))

(assert (=> b!373464 m!369397))

(declare-fun m!369403 () Bool)

(assert (=> b!373464 m!369403))

(declare-fun m!369405 () Bool)

(assert (=> b!373464 m!369405))

(declare-fun m!369407 () Bool)

(assert (=> b!373464 m!369407))

(declare-fun m!369409 () Bool)

(assert (=> b!373464 m!369409))

(declare-fun m!369411 () Bool)

(assert (=> b!373464 m!369411))

(declare-fun m!369413 () Bool)

(assert (=> b!373455 m!369413))

(declare-fun m!369415 () Bool)

(assert (=> b!373455 m!369415))

(declare-fun m!369417 () Bool)

(assert (=> b!373455 m!369417))

(declare-fun m!369419 () Bool)

(assert (=> b!373455 m!369419))

(declare-fun m!369421 () Bool)

(assert (=> b!373455 m!369421))

(declare-fun m!369423 () Bool)

(assert (=> b!373455 m!369423))

(declare-fun m!369425 () Bool)

(assert (=> b!373455 m!369425))

(declare-fun m!369427 () Bool)

(assert (=> mapNonEmpty!14871 m!369427))

(declare-fun m!369429 () Bool)

(assert (=> b!373461 m!369429))

(declare-fun m!369431 () Bool)

(assert (=> b!373461 m!369431))

(declare-fun m!369433 () Bool)

(assert (=> b!373465 m!369433))

(check-sat (not b!373465) (not b_next!8223) (not b!373462) b_and!15465 tp_is_empty!8871 (not b!373452) (not b!373461) (not b!373463) (not b!373464) (not b!373454) (not start!37096) (not b!373455) (not b!373453) (not mapNonEmpty!14871))
(check-sat b_and!15465 (not b_next!8223))
