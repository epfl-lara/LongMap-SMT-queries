; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43376 () Bool)

(assert start!43376)

(declare-fun b_free!12217 () Bool)

(declare-fun b_next!12217 () Bool)

(assert (=> start!43376 (= b_free!12217 (not b_next!12217))))

(declare-fun tp!42928 () Bool)

(declare-fun b_and!20983 () Bool)

(assert (=> start!43376 (= tp!42928 b_and!20983)))

(declare-fun b!480731 () Bool)

(declare-fun res!286706 () Bool)

(declare-fun e!282848 () Bool)

(assert (=> b!480731 (=> (not res!286706) (not e!282848))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19377 0))(
  ( (V!19378 (val!6912 Int)) )
))
(declare-fun minValue!1458 () V!19377)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19377)

(declare-datatypes ((ValueCell!6503 0))(
  ( (ValueCellFull!6503 (v!9204 V!19377)) (EmptyCell!6503) )
))
(declare-datatypes ((array!31108 0))(
  ( (array!31109 (arr!14958 (Array (_ BitVec 32) ValueCell!6503)) (size!15316 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31108)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31110 0))(
  ( (array!31111 (arr!14959 (Array (_ BitVec 32) (_ BitVec 64))) (size!15317 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31110)

(declare-datatypes ((tuple2!8986 0))(
  ( (tuple2!8987 (_1!4504 (_ BitVec 64)) (_2!4504 V!19377)) )
))
(declare-datatypes ((List!9055 0))(
  ( (Nil!9052) (Cons!9051 (h!9907 tuple2!8986) (t!15257 List!9055)) )
))
(declare-datatypes ((ListLongMap!7901 0))(
  ( (ListLongMap!7902 (toList!3966 List!9055)) )
))
(declare-fun contains!2596 (ListLongMap!7901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2280 (array!31110 array!31108 (_ BitVec 32) (_ BitVec 32) V!19377 V!19377 (_ BitVec 32) Int) ListLongMap!7901)

(assert (=> b!480731 (= res!286706 (contains!2596 (getCurrentListMap!2280 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22297 () Bool)

(declare-fun mapRes!22297 () Bool)

(declare-fun tp!42927 () Bool)

(declare-fun e!282850 () Bool)

(assert (=> mapNonEmpty!22297 (= mapRes!22297 (and tp!42927 e!282850))))

(declare-fun mapValue!22297 () ValueCell!6503)

(declare-fun mapRest!22297 () (Array (_ BitVec 32) ValueCell!6503))

(declare-fun mapKey!22297 () (_ BitVec 32))

(assert (=> mapNonEmpty!22297 (= (arr!14958 _values!1516) (store mapRest!22297 mapKey!22297 mapValue!22297))))

(declare-fun b!480732 () Bool)

(declare-fun e!282849 () Bool)

(assert (=> b!480732 (= e!282849 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480733 () Bool)

(declare-fun res!286702 () Bool)

(assert (=> b!480733 (=> (not res!286702) (not e!282848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480733 (= res!286702 (validKeyInArray!0 k0!1332))))

(declare-fun b!480734 () Bool)

(declare-fun e!282847 () Bool)

(declare-fun tp_is_empty!13729 () Bool)

(assert (=> b!480734 (= e!282847 tp_is_empty!13729)))

(declare-fun b!480736 () Bool)

(declare-fun res!286701 () Bool)

(assert (=> b!480736 (=> (not res!286701) (not e!282848))))

(assert (=> b!480736 (= res!286701 (and (= (size!15316 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15317 _keys!1874) (size!15316 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480737 () Bool)

(assert (=> b!480737 (= e!282848 (not (= (size!15317 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218238 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31110 (_ BitVec 32)) Bool)

(assert (=> b!480737 (arrayForallSeekEntryOrOpenFound!0 lt!218238 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14069 0))(
  ( (Unit!14070) )
))
(declare-fun lt!218239 () Unit!14069)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14069)

(assert (=> b!480737 (= lt!218239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218238))))

(declare-fun arrayScanForKey!0 (array!31110 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480737 (= lt!218238 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480737 e!282849))

(declare-fun c!57784 () Bool)

(assert (=> b!480737 (= c!57784 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218237 () Unit!14069)

(declare-fun lemmaKeyInListMapIsInArray!128 (array!31110 array!31108 (_ BitVec 32) (_ BitVec 32) V!19377 V!19377 (_ BitVec 64) Int) Unit!14069)

(assert (=> b!480737 (= lt!218237 (lemmaKeyInListMapIsInArray!128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480738 () Bool)

(declare-fun arrayContainsKey!0 (array!31110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480738 (= e!282849 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!286705 () Bool)

(assert (=> start!43376 (=> (not res!286705) (not e!282848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43376 (= res!286705 (validMask!0 mask!2352))))

(assert (=> start!43376 e!282848))

(assert (=> start!43376 true))

(assert (=> start!43376 tp_is_empty!13729))

(declare-fun e!282852 () Bool)

(declare-fun array_inv!10862 (array!31108) Bool)

(assert (=> start!43376 (and (array_inv!10862 _values!1516) e!282852)))

(assert (=> start!43376 tp!42928))

(declare-fun array_inv!10863 (array!31110) Bool)

(assert (=> start!43376 (array_inv!10863 _keys!1874)))

(declare-fun b!480735 () Bool)

(declare-fun res!286703 () Bool)

(assert (=> b!480735 (=> (not res!286703) (not e!282848))))

(assert (=> b!480735 (= res!286703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480739 () Bool)

(declare-fun res!286704 () Bool)

(assert (=> b!480739 (=> (not res!286704) (not e!282848))))

(declare-datatypes ((List!9056 0))(
  ( (Nil!9053) (Cons!9052 (h!9908 (_ BitVec 64)) (t!15258 List!9056)) )
))
(declare-fun arrayNoDuplicates!0 (array!31110 (_ BitVec 32) List!9056) Bool)

(assert (=> b!480739 (= res!286704 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9053))))

(declare-fun b!480740 () Bool)

(assert (=> b!480740 (= e!282852 (and e!282847 mapRes!22297))))

(declare-fun condMapEmpty!22297 () Bool)

(declare-fun mapDefault!22297 () ValueCell!6503)

(assert (=> b!480740 (= condMapEmpty!22297 (= (arr!14958 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6503)) mapDefault!22297)))))

(declare-fun b!480741 () Bool)

(assert (=> b!480741 (= e!282850 tp_is_empty!13729)))

(declare-fun mapIsEmpty!22297 () Bool)

(assert (=> mapIsEmpty!22297 mapRes!22297))

(assert (= (and start!43376 res!286705) b!480736))

(assert (= (and b!480736 res!286701) b!480735))

(assert (= (and b!480735 res!286703) b!480739))

(assert (= (and b!480739 res!286704) b!480731))

(assert (= (and b!480731 res!286706) b!480733))

(assert (= (and b!480733 res!286702) b!480737))

(assert (= (and b!480737 c!57784) b!480738))

(assert (= (and b!480737 (not c!57784)) b!480732))

(assert (= (and b!480740 condMapEmpty!22297) mapIsEmpty!22297))

(assert (= (and b!480740 (not condMapEmpty!22297)) mapNonEmpty!22297))

(get-info :version)

(assert (= (and mapNonEmpty!22297 ((_ is ValueCellFull!6503) mapValue!22297)) b!480741))

(assert (= (and b!480740 ((_ is ValueCellFull!6503) mapDefault!22297)) b!480734))

(assert (= start!43376 b!480740))

(declare-fun m!462541 () Bool)

(assert (=> b!480731 m!462541))

(assert (=> b!480731 m!462541))

(declare-fun m!462543 () Bool)

(assert (=> b!480731 m!462543))

(declare-fun m!462545 () Bool)

(assert (=> b!480737 m!462545))

(declare-fun m!462547 () Bool)

(assert (=> b!480737 m!462547))

(declare-fun m!462549 () Bool)

(assert (=> b!480737 m!462549))

(declare-fun m!462551 () Bool)

(assert (=> b!480737 m!462551))

(declare-fun m!462553 () Bool)

(assert (=> b!480738 m!462553))

(declare-fun m!462555 () Bool)

(assert (=> b!480739 m!462555))

(declare-fun m!462557 () Bool)

(assert (=> start!43376 m!462557))

(declare-fun m!462559 () Bool)

(assert (=> start!43376 m!462559))

(declare-fun m!462561 () Bool)

(assert (=> start!43376 m!462561))

(declare-fun m!462563 () Bool)

(assert (=> b!480733 m!462563))

(declare-fun m!462565 () Bool)

(assert (=> mapNonEmpty!22297 m!462565))

(declare-fun m!462567 () Bool)

(assert (=> b!480735 m!462567))

(check-sat (not b!480739) (not mapNonEmpty!22297) tp_is_empty!13729 (not b!480738) (not b!480733) (not b!480737) b_and!20983 (not b_next!12217) (not start!43376) (not b!480735) (not b!480731))
(check-sat b_and!20983 (not b_next!12217))
