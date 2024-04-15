; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43376 () Bool)

(assert start!43376)

(declare-fun b_free!12217 () Bool)

(declare-fun b_next!12217 () Bool)

(assert (=> start!43376 (= b_free!12217 (not b_next!12217))))

(declare-fun tp!42927 () Bool)

(declare-fun b_and!20947 () Bool)

(assert (=> start!43376 (= tp!42927 b_and!20947)))

(declare-fun b!480521 () Bool)

(declare-fun res!286580 () Bool)

(declare-fun e!282717 () Bool)

(assert (=> b!480521 (=> (not res!286580) (not e!282717))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480521 (= res!286580 (validKeyInArray!0 k0!1332))))

(declare-fun b!480522 () Bool)

(declare-fun e!282713 () Bool)

(declare-datatypes ((array!31119 0))(
  ( (array!31120 (arr!14964 (Array (_ BitVec 32) (_ BitVec 64))) (size!15323 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31119)

(declare-fun arrayContainsKey!0 (array!31119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480522 (= e!282713 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480523 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480523 (= e!282713 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480524 () Bool)

(declare-fun e!282714 () Bool)

(declare-fun tp_is_empty!13729 () Bool)

(assert (=> b!480524 (= e!282714 tp_is_empty!13729)))

(declare-fun b!480525 () Bool)

(declare-fun res!286581 () Bool)

(assert (=> b!480525 (=> (not res!286581) (not e!282717))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31119 (_ BitVec 32)) Bool)

(assert (=> b!480525 (= res!286581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22297 () Bool)

(declare-fun mapRes!22297 () Bool)

(assert (=> mapIsEmpty!22297 mapRes!22297))

(declare-fun b!480527 () Bool)

(declare-fun res!286579 () Bool)

(assert (=> b!480527 (=> (not res!286579) (not e!282717))))

(declare-datatypes ((V!19377 0))(
  ( (V!19378 (val!6912 Int)) )
))
(declare-datatypes ((ValueCell!6503 0))(
  ( (ValueCellFull!6503 (v!9197 V!19377)) (EmptyCell!6503) )
))
(declare-datatypes ((array!31121 0))(
  ( (array!31122 (arr!14965 (Array (_ BitVec 32) ValueCell!6503)) (size!15324 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31121)

(assert (=> b!480527 (= res!286579 (and (= (size!15324 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15323 _keys!1874) (size!15324 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480528 () Bool)

(declare-fun e!282712 () Bool)

(assert (=> b!480528 (= e!282712 tp_is_empty!13729)))

(declare-fun mapNonEmpty!22297 () Bool)

(declare-fun tp!42928 () Bool)

(assert (=> mapNonEmpty!22297 (= mapRes!22297 (and tp!42928 e!282712))))

(declare-fun mapRest!22297 () (Array (_ BitVec 32) ValueCell!6503))

(declare-fun mapKey!22297 () (_ BitVec 32))

(declare-fun mapValue!22297 () ValueCell!6503)

(assert (=> mapNonEmpty!22297 (= (arr!14965 _values!1516) (store mapRest!22297 mapKey!22297 mapValue!22297))))

(declare-fun res!286582 () Bool)

(assert (=> start!43376 (=> (not res!286582) (not e!282717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43376 (= res!286582 (validMask!0 mask!2352))))

(assert (=> start!43376 e!282717))

(assert (=> start!43376 true))

(assert (=> start!43376 tp_is_empty!13729))

(declare-fun e!282716 () Bool)

(declare-fun array_inv!10886 (array!31121) Bool)

(assert (=> start!43376 (and (array_inv!10886 _values!1516) e!282716)))

(assert (=> start!43376 tp!42927))

(declare-fun array_inv!10887 (array!31119) Bool)

(assert (=> start!43376 (array_inv!10887 _keys!1874)))

(declare-fun b!480526 () Bool)

(declare-fun res!286583 () Bool)

(assert (=> b!480526 (=> (not res!286583) (not e!282717))))

(declare-fun minValue!1458 () V!19377)

(declare-fun zeroValue!1458 () V!19377)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9122 0))(
  ( (tuple2!9123 (_1!4572 (_ BitVec 64)) (_2!4572 V!19377)) )
))
(declare-datatypes ((List!9185 0))(
  ( (Nil!9182) (Cons!9181 (h!10037 tuple2!9122) (t!15386 List!9185)) )
))
(declare-datatypes ((ListLongMap!8025 0))(
  ( (ListLongMap!8026 (toList!4028 List!9185)) )
))
(declare-fun contains!2605 (ListLongMap!8025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2281 (array!31119 array!31121 (_ BitVec 32) (_ BitVec 32) V!19377 V!19377 (_ BitVec 32) Int) ListLongMap!8025)

(assert (=> b!480526 (= res!286583 (contains!2605 (getCurrentListMap!2281 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480529 () Bool)

(declare-fun res!286584 () Bool)

(assert (=> b!480529 (=> (not res!286584) (not e!282717))))

(declare-datatypes ((List!9186 0))(
  ( (Nil!9183) (Cons!9182 (h!10038 (_ BitVec 64)) (t!15387 List!9186)) )
))
(declare-fun arrayNoDuplicates!0 (array!31119 (_ BitVec 32) List!9186) Bool)

(assert (=> b!480529 (= res!286584 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9183))))

(declare-fun b!480530 () Bool)

(assert (=> b!480530 (= e!282716 (and e!282714 mapRes!22297))))

(declare-fun condMapEmpty!22297 () Bool)

(declare-fun mapDefault!22297 () ValueCell!6503)

(assert (=> b!480530 (= condMapEmpty!22297 (= (arr!14965 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6503)) mapDefault!22297)))))

(declare-fun b!480531 () Bool)

(assert (=> b!480531 (= e!282717 (not (= (size!15323 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!217993 () (_ BitVec 32))

(assert (=> b!480531 (arrayForallSeekEntryOrOpenFound!0 lt!217993 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14084 0))(
  ( (Unit!14085) )
))
(declare-fun lt!217991 () Unit!14084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14084)

(assert (=> b!480531 (= lt!217991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!217993))))

(declare-fun arrayScanForKey!0 (array!31119 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480531 (= lt!217993 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480531 e!282713))

(declare-fun c!57740 () Bool)

(assert (=> b!480531 (= c!57740 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!217992 () Unit!14084)

(declare-fun lemmaKeyInListMapIsInArray!131 (array!31119 array!31121 (_ BitVec 32) (_ BitVec 32) V!19377 V!19377 (_ BitVec 64) Int) Unit!14084)

(assert (=> b!480531 (= lt!217992 (lemmaKeyInListMapIsInArray!131 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43376 res!286582) b!480527))

(assert (= (and b!480527 res!286579) b!480525))

(assert (= (and b!480525 res!286581) b!480529))

(assert (= (and b!480529 res!286584) b!480526))

(assert (= (and b!480526 res!286583) b!480521))

(assert (= (and b!480521 res!286580) b!480531))

(assert (= (and b!480531 c!57740) b!480522))

(assert (= (and b!480531 (not c!57740)) b!480523))

(assert (= (and b!480530 condMapEmpty!22297) mapIsEmpty!22297))

(assert (= (and b!480530 (not condMapEmpty!22297)) mapNonEmpty!22297))

(get-info :version)

(assert (= (and mapNonEmpty!22297 ((_ is ValueCellFull!6503) mapValue!22297)) b!480528))

(assert (= (and b!480530 ((_ is ValueCellFull!6503) mapDefault!22297)) b!480524))

(assert (= start!43376 b!480530))

(declare-fun m!461625 () Bool)

(assert (=> b!480526 m!461625))

(assert (=> b!480526 m!461625))

(declare-fun m!461627 () Bool)

(assert (=> b!480526 m!461627))

(declare-fun m!461629 () Bool)

(assert (=> b!480531 m!461629))

(declare-fun m!461631 () Bool)

(assert (=> b!480531 m!461631))

(declare-fun m!461633 () Bool)

(assert (=> b!480531 m!461633))

(declare-fun m!461635 () Bool)

(assert (=> b!480531 m!461635))

(declare-fun m!461637 () Bool)

(assert (=> mapNonEmpty!22297 m!461637))

(declare-fun m!461639 () Bool)

(assert (=> b!480521 m!461639))

(declare-fun m!461641 () Bool)

(assert (=> start!43376 m!461641))

(declare-fun m!461643 () Bool)

(assert (=> start!43376 m!461643))

(declare-fun m!461645 () Bool)

(assert (=> start!43376 m!461645))

(declare-fun m!461647 () Bool)

(assert (=> b!480525 m!461647))

(declare-fun m!461649 () Bool)

(assert (=> b!480529 m!461649))

(declare-fun m!461651 () Bool)

(assert (=> b!480522 m!461651))

(check-sat (not mapNonEmpty!22297) (not b!480521) (not b!480531) tp_is_empty!13729 (not start!43376) (not b!480526) (not b!480525) (not b!480522) b_and!20947 (not b!480529) (not b_next!12217))
(check-sat b_and!20947 (not b_next!12217))
