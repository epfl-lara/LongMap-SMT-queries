; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43526 () Bool)

(assert start!43526)

(declare-fun b_free!12319 () Bool)

(declare-fun b_next!12319 () Bool)

(assert (=> start!43526 (= b_free!12319 (not b_next!12319))))

(declare-fun tp!43239 () Bool)

(declare-fun b_and!21089 () Bool)

(assert (=> start!43526 (= tp!43239 b_and!21089)))

(declare-fun b!482352 () Bool)

(declare-fun e!283863 () Bool)

(declare-fun tp_is_empty!13831 () Bool)

(assert (=> b!482352 (= e!283863 tp_is_empty!13831)))

(declare-fun b!482353 () Bool)

(declare-fun res!287567 () Bool)

(declare-fun e!283862 () Bool)

(assert (=> b!482353 (=> (not res!287567) (not e!283862))))

(declare-datatypes ((array!31308 0))(
  ( (array!31309 (arr!15056 (Array (_ BitVec 32) (_ BitVec 64))) (size!15414 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31308)

(declare-datatypes ((List!9124 0))(
  ( (Nil!9121) (Cons!9120 (h!9976 (_ BitVec 64)) (t!15330 List!9124)) )
))
(declare-fun arrayNoDuplicates!0 (array!31308 (_ BitVec 32) List!9124) Bool)

(assert (=> b!482353 (= res!287567 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9121))))

(declare-fun mapIsEmpty!22456 () Bool)

(declare-fun mapRes!22456 () Bool)

(assert (=> mapIsEmpty!22456 mapRes!22456))

(declare-fun b!482354 () Bool)

(declare-fun res!287566 () Bool)

(assert (=> b!482354 (=> (not res!287566) (not e!283862))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19513 0))(
  ( (V!19514 (val!6963 Int)) )
))
(declare-datatypes ((ValueCell!6554 0))(
  ( (ValueCellFull!6554 (v!9257 V!19513)) (EmptyCell!6554) )
))
(declare-datatypes ((array!31310 0))(
  ( (array!31311 (arr!15057 (Array (_ BitVec 32) ValueCell!6554)) (size!15415 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31310)

(assert (=> b!482354 (= res!287566 (and (= (size!15415 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15414 _keys!1874) (size!15415 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482355 () Bool)

(declare-fun res!287563 () Bool)

(assert (=> b!482355 (=> (not res!287563) (not e!283862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31308 (_ BitVec 32)) Bool)

(assert (=> b!482355 (= res!287563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482356 () Bool)

(declare-fun res!287564 () Bool)

(assert (=> b!482356 (=> (not res!287564) (not e!283862))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482356 (= res!287564 (validKeyInArray!0 k0!1332))))

(declare-fun mapNonEmpty!22456 () Bool)

(declare-fun tp!43240 () Bool)

(declare-fun e!283858 () Bool)

(assert (=> mapNonEmpty!22456 (= mapRes!22456 (and tp!43240 e!283858))))

(declare-fun mapRest!22456 () (Array (_ BitVec 32) ValueCell!6554))

(declare-fun mapKey!22456 () (_ BitVec 32))

(declare-fun mapValue!22456 () ValueCell!6554)

(assert (=> mapNonEmpty!22456 (= (arr!15057 _values!1516) (store mapRest!22456 mapKey!22456 mapValue!22456))))

(declare-fun b!482357 () Bool)

(assert (=> b!482357 (= e!283858 tp_is_empty!13831)))

(declare-fun b!482358 () Bool)

(declare-fun res!287565 () Bool)

(assert (=> b!482358 (=> (not res!287565) (not e!283862))))

(declare-fun minValue!1458 () V!19513)

(declare-fun zeroValue!1458 () V!19513)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9056 0))(
  ( (tuple2!9057 (_1!4539 (_ BitVec 64)) (_2!4539 V!19513)) )
))
(declare-datatypes ((List!9125 0))(
  ( (Nil!9122) (Cons!9121 (h!9977 tuple2!9056) (t!15331 List!9125)) )
))
(declare-datatypes ((ListLongMap!7971 0))(
  ( (ListLongMap!7972 (toList!4001 List!9125)) )
))
(declare-fun contains!2633 (ListLongMap!7971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2315 (array!31308 array!31310 (_ BitVec 32) (_ BitVec 32) V!19513 V!19513 (_ BitVec 32) Int) ListLongMap!7971)

(assert (=> b!482358 (= res!287565 (contains!2633 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482359 () Bool)

(declare-fun e!283860 () Bool)

(assert (=> b!482359 (= e!283860 (and e!283863 mapRes!22456))))

(declare-fun condMapEmpty!22456 () Bool)

(declare-fun mapDefault!22456 () ValueCell!6554)

(assert (=> b!482359 (= condMapEmpty!22456 (= (arr!15057 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6554)) mapDefault!22456)))))

(declare-fun b!482360 () Bool)

(assert (=> b!482360 (= e!283862 (not true))))

(declare-fun lt!218731 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31308 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482360 (= lt!218731 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283859 () Bool)

(assert (=> b!482360 e!283859))

(declare-fun c!57924 () Bool)

(assert (=> b!482360 (= c!57924 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14103 0))(
  ( (Unit!14104) )
))
(declare-fun lt!218730 () Unit!14103)

(declare-fun lemmaKeyInListMapIsInArray!143 (array!31308 array!31310 (_ BitVec 32) (_ BitVec 32) V!19513 V!19513 (_ BitVec 64) Int) Unit!14103)

(assert (=> b!482360 (= lt!218730 (lemmaKeyInListMapIsInArray!143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482361 () Bool)

(declare-fun arrayContainsKey!0 (array!31308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482361 (= e!283859 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!287568 () Bool)

(assert (=> start!43526 (=> (not res!287568) (not e!283862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43526 (= res!287568 (validMask!0 mask!2352))))

(assert (=> start!43526 e!283862))

(assert (=> start!43526 true))

(assert (=> start!43526 tp_is_empty!13831))

(declare-fun array_inv!10932 (array!31310) Bool)

(assert (=> start!43526 (and (array_inv!10932 _values!1516) e!283860)))

(assert (=> start!43526 tp!43239))

(declare-fun array_inv!10933 (array!31308) Bool)

(assert (=> start!43526 (array_inv!10933 _keys!1874)))

(declare-fun b!482362 () Bool)

(assert (=> b!482362 (= e!283859 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!43526 res!287568) b!482354))

(assert (= (and b!482354 res!287566) b!482355))

(assert (= (and b!482355 res!287563) b!482353))

(assert (= (and b!482353 res!287567) b!482358))

(assert (= (and b!482358 res!287565) b!482356))

(assert (= (and b!482356 res!287564) b!482360))

(assert (= (and b!482360 c!57924) b!482361))

(assert (= (and b!482360 (not c!57924)) b!482362))

(assert (= (and b!482359 condMapEmpty!22456) mapIsEmpty!22456))

(assert (= (and b!482359 (not condMapEmpty!22456)) mapNonEmpty!22456))

(get-info :version)

(assert (= (and mapNonEmpty!22456 ((_ is ValueCellFull!6554) mapValue!22456)) b!482357))

(assert (= (and b!482359 ((_ is ValueCellFull!6554) mapDefault!22456)) b!482352))

(assert (= start!43526 b!482359))

(declare-fun m!463849 () Bool)

(assert (=> b!482358 m!463849))

(assert (=> b!482358 m!463849))

(declare-fun m!463851 () Bool)

(assert (=> b!482358 m!463851))

(declare-fun m!463853 () Bool)

(assert (=> b!482355 m!463853))

(declare-fun m!463855 () Bool)

(assert (=> mapNonEmpty!22456 m!463855))

(declare-fun m!463857 () Bool)

(assert (=> b!482353 m!463857))

(declare-fun m!463859 () Bool)

(assert (=> b!482360 m!463859))

(declare-fun m!463861 () Bool)

(assert (=> b!482360 m!463861))

(declare-fun m!463863 () Bool)

(assert (=> b!482356 m!463863))

(declare-fun m!463865 () Bool)

(assert (=> b!482361 m!463865))

(declare-fun m!463867 () Bool)

(assert (=> start!43526 m!463867))

(declare-fun m!463869 () Bool)

(assert (=> start!43526 m!463869))

(declare-fun m!463871 () Bool)

(assert (=> start!43526 m!463871))

(check-sat (not b_next!12319) (not b!482355) (not b!482361) (not b!482356) (not b!482358) (not mapNonEmpty!22456) (not start!43526) (not b!482360) b_and!21089 (not b!482353) tp_is_empty!13831)
(check-sat b_and!21089 (not b_next!12319))
