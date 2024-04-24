; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43352 () Bool)

(assert start!43352)

(declare-fun b_free!12193 () Bool)

(declare-fun b_next!12193 () Bool)

(assert (=> start!43352 (= b_free!12193 (not b_next!12193))))

(declare-fun tp!42856 () Bool)

(declare-fun b_and!20959 () Bool)

(assert (=> start!43352 (= tp!42856 b_and!20959)))

(declare-fun b!480335 () Bool)

(declare-fun e!282635 () Bool)

(declare-fun tp_is_empty!13705 () Bool)

(assert (=> b!480335 (= e!282635 tp_is_empty!13705)))

(declare-fun b!480336 () Bool)

(declare-fun res!286490 () Bool)

(declare-fun e!282631 () Bool)

(assert (=> b!480336 (=> (not res!286490) (not e!282631))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19345 0))(
  ( (V!19346 (val!6900 Int)) )
))
(declare-fun minValue!1458 () V!19345)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19345)

(declare-datatypes ((ValueCell!6491 0))(
  ( (ValueCellFull!6491 (v!9192 V!19345)) (EmptyCell!6491) )
))
(declare-datatypes ((array!31066 0))(
  ( (array!31067 (arr!14937 (Array (_ BitVec 32) ValueCell!6491)) (size!15295 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31066)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31068 0))(
  ( (array!31069 (arr!14938 (Array (_ BitVec 32) (_ BitVec 64))) (size!15296 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31068)

(declare-datatypes ((tuple2!8974 0))(
  ( (tuple2!8975 (_1!4498 (_ BitVec 64)) (_2!4498 V!19345)) )
))
(declare-datatypes ((List!9044 0))(
  ( (Nil!9041) (Cons!9040 (h!9896 tuple2!8974) (t!15246 List!9044)) )
))
(declare-datatypes ((ListLongMap!7889 0))(
  ( (ListLongMap!7890 (toList!3960 List!9044)) )
))
(declare-fun contains!2590 (ListLongMap!7889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2274 (array!31068 array!31066 (_ BitVec 32) (_ BitVec 32) V!19345 V!19345 (_ BitVec 32) Int) ListLongMap!7889)

(assert (=> b!480336 (= res!286490 (contains!2590 (getCurrentListMap!2274 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480337 () Bool)

(declare-fun res!286487 () Bool)

(assert (=> b!480337 (=> (not res!286487) (not e!282631))))

(assert (=> b!480337 (= res!286487 (and (= (size!15295 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15296 _keys!1874) (size!15295 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480338 () Bool)

(declare-fun e!282633 () Bool)

(declare-fun mapRes!22261 () Bool)

(assert (=> b!480338 (= e!282633 (and e!282635 mapRes!22261))))

(declare-fun condMapEmpty!22261 () Bool)

(declare-fun mapDefault!22261 () ValueCell!6491)

(assert (=> b!480338 (= condMapEmpty!22261 (= (arr!14937 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6491)) mapDefault!22261)))))

(declare-fun mapNonEmpty!22261 () Bool)

(declare-fun tp!42855 () Bool)

(declare-fun e!282632 () Bool)

(assert (=> mapNonEmpty!22261 (= mapRes!22261 (and tp!42855 e!282632))))

(declare-fun mapKey!22261 () (_ BitVec 32))

(declare-fun mapRest!22261 () (Array (_ BitVec 32) ValueCell!6491))

(declare-fun mapValue!22261 () ValueCell!6491)

(assert (=> mapNonEmpty!22261 (= (arr!14937 _values!1516) (store mapRest!22261 mapKey!22261 mapValue!22261))))

(declare-fun b!480339 () Bool)

(declare-fun res!286486 () Bool)

(assert (=> b!480339 (=> (not res!286486) (not e!282631))))

(declare-datatypes ((List!9045 0))(
  ( (Nil!9042) (Cons!9041 (h!9897 (_ BitVec 64)) (t!15247 List!9045)) )
))
(declare-fun arrayNoDuplicates!0 (array!31068 (_ BitVec 32) List!9045) Bool)

(assert (=> b!480339 (= res!286486 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9042))))

(declare-fun b!480340 () Bool)

(declare-fun e!282634 () Bool)

(assert (=> b!480340 (= e!282634 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480341 () Bool)

(declare-fun arrayContainsKey!0 (array!31068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480341 (= e!282634 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!286485 () Bool)

(assert (=> start!43352 (=> (not res!286485) (not e!282631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43352 (= res!286485 (validMask!0 mask!2352))))

(assert (=> start!43352 e!282631))

(assert (=> start!43352 true))

(assert (=> start!43352 tp_is_empty!13705))

(declare-fun array_inv!10848 (array!31066) Bool)

(assert (=> start!43352 (and (array_inv!10848 _values!1516) e!282633)))

(assert (=> start!43352 tp!42856))

(declare-fun array_inv!10849 (array!31068) Bool)

(assert (=> start!43352 (array_inv!10849 _keys!1874)))

(declare-fun mapIsEmpty!22261 () Bool)

(assert (=> mapIsEmpty!22261 mapRes!22261))

(declare-fun b!480342 () Bool)

(assert (=> b!480342 (= e!282632 tp_is_empty!13705)))

(declare-fun b!480343 () Bool)

(assert (=> b!480343 (= e!282631 (not true))))

(declare-fun lt!218154 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31068 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480343 (= lt!218154 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480343 e!282634))

(declare-fun c!57748 () Bool)

(assert (=> b!480343 (= c!57748 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14055 0))(
  ( (Unit!14056) )
))
(declare-fun lt!218155 () Unit!14055)

(declare-fun lemmaKeyInListMapIsInArray!121 (array!31068 array!31066 (_ BitVec 32) (_ BitVec 32) V!19345 V!19345 (_ BitVec 64) Int) Unit!14055)

(assert (=> b!480343 (= lt!218155 (lemmaKeyInListMapIsInArray!121 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480344 () Bool)

(declare-fun res!286489 () Bool)

(assert (=> b!480344 (=> (not res!286489) (not e!282631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480344 (= res!286489 (validKeyInArray!0 k0!1332))))

(declare-fun b!480345 () Bool)

(declare-fun res!286488 () Bool)

(assert (=> b!480345 (=> (not res!286488) (not e!282631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31068 (_ BitVec 32)) Bool)

(assert (=> b!480345 (= res!286488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43352 res!286485) b!480337))

(assert (= (and b!480337 res!286487) b!480345))

(assert (= (and b!480345 res!286488) b!480339))

(assert (= (and b!480339 res!286486) b!480336))

(assert (= (and b!480336 res!286490) b!480344))

(assert (= (and b!480344 res!286489) b!480343))

(assert (= (and b!480343 c!57748) b!480341))

(assert (= (and b!480343 (not c!57748)) b!480340))

(assert (= (and b!480338 condMapEmpty!22261) mapIsEmpty!22261))

(assert (= (and b!480338 (not condMapEmpty!22261)) mapNonEmpty!22261))

(get-info :version)

(assert (= (and mapNonEmpty!22261 ((_ is ValueCellFull!6491) mapValue!22261)) b!480342))

(assert (= (and b!480338 ((_ is ValueCellFull!6491) mapDefault!22261)) b!480335))

(assert (= start!43352 b!480338))

(declare-fun m!462241 () Bool)

(assert (=> b!480341 m!462241))

(declare-fun m!462243 () Bool)

(assert (=> b!480345 m!462243))

(declare-fun m!462245 () Bool)

(assert (=> b!480344 m!462245))

(declare-fun m!462247 () Bool)

(assert (=> mapNonEmpty!22261 m!462247))

(declare-fun m!462249 () Bool)

(assert (=> b!480339 m!462249))

(declare-fun m!462251 () Bool)

(assert (=> start!43352 m!462251))

(declare-fun m!462253 () Bool)

(assert (=> start!43352 m!462253))

(declare-fun m!462255 () Bool)

(assert (=> start!43352 m!462255))

(declare-fun m!462257 () Bool)

(assert (=> b!480336 m!462257))

(assert (=> b!480336 m!462257))

(declare-fun m!462259 () Bool)

(assert (=> b!480336 m!462259))

(declare-fun m!462261 () Bool)

(assert (=> b!480343 m!462261))

(declare-fun m!462263 () Bool)

(assert (=> b!480343 m!462263))

(check-sat (not mapNonEmpty!22261) (not b!480339) tp_is_empty!13705 (not b!480344) (not b!480343) (not b!480336) (not start!43352) (not b!480345) b_and!20959 (not b_next!12193) (not b!480341))
(check-sat b_and!20959 (not b_next!12193))
