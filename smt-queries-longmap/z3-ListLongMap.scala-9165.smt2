; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110066 () Bool)

(assert start!110066)

(declare-fun b_free!29265 () Bool)

(declare-fun b_next!29265 () Bool)

(assert (=> start!110066 (= b_free!29265 (not b_next!29265))))

(declare-fun tp!102945 () Bool)

(declare-fun b_and!47429 () Bool)

(assert (=> start!110066 (= tp!102945 b_and!47429)))

(declare-fun b!1303514 () Bool)

(declare-fun res!865780 () Bool)

(declare-fun e!743512 () Bool)

(assert (=> b!1303514 (=> (not res!865780) (not e!743512))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51643 0))(
  ( (V!51644 (val!17527 Int)) )
))
(declare-datatypes ((ValueCell!16554 0))(
  ( (ValueCellFull!16554 (v!20143 V!51643)) (EmptyCell!16554) )
))
(declare-datatypes ((array!86822 0))(
  ( (array!86823 (arr!41902 (Array (_ BitVec 32) ValueCell!16554)) (size!42452 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86822)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86824 0))(
  ( (array!86825 (arr!41903 (Array (_ BitVec 32) (_ BitVec 64))) (size!42453 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86824)

(assert (=> b!1303514 (= res!865780 (and (= (size!42452 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42453 _keys!1741) (size!42452 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53950 () Bool)

(declare-fun mapRes!53950 () Bool)

(declare-fun tp!102946 () Bool)

(declare-fun e!743510 () Bool)

(assert (=> mapNonEmpty!53950 (= mapRes!53950 (and tp!102946 e!743510))))

(declare-fun mapKey!53950 () (_ BitVec 32))

(declare-fun mapValue!53950 () ValueCell!16554)

(declare-fun mapRest!53950 () (Array (_ BitVec 32) ValueCell!16554))

(assert (=> mapNonEmpty!53950 (= (arr!41902 _values!1445) (store mapRest!53950 mapKey!53950 mapValue!53950))))

(declare-fun res!865782 () Bool)

(assert (=> start!110066 (=> (not res!865782) (not e!743512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110066 (= res!865782 (validMask!0 mask!2175))))

(assert (=> start!110066 e!743512))

(declare-fun tp_is_empty!34905 () Bool)

(assert (=> start!110066 tp_is_empty!34905))

(assert (=> start!110066 true))

(declare-fun e!743507 () Bool)

(declare-fun array_inv!31689 (array!86822) Bool)

(assert (=> start!110066 (and (array_inv!31689 _values!1445) e!743507)))

(declare-fun array_inv!31690 (array!86824) Bool)

(assert (=> start!110066 (array_inv!31690 _keys!1741)))

(assert (=> start!110066 tp!102945))

(declare-fun b!1303515 () Bool)

(declare-fun res!865774 () Bool)

(assert (=> b!1303515 (=> (not res!865774) (not e!743512))))

(declare-datatypes ((List!29743 0))(
  ( (Nil!29740) (Cons!29739 (h!30948 (_ BitVec 64)) (t!43337 List!29743)) )
))
(declare-fun arrayNoDuplicates!0 (array!86824 (_ BitVec 32) List!29743) Bool)

(assert (=> b!1303515 (= res!865774 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29740))))

(declare-fun b!1303516 () Bool)

(declare-fun e!743511 () Bool)

(assert (=> b!1303516 (= e!743507 (and e!743511 mapRes!53950))))

(declare-fun condMapEmpty!53950 () Bool)

(declare-fun mapDefault!53950 () ValueCell!16554)

(assert (=> b!1303516 (= condMapEmpty!53950 (= (arr!41902 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16554)) mapDefault!53950)))))

(declare-fun b!1303517 () Bool)

(assert (=> b!1303517 (= e!743510 tp_is_empty!34905)))

(declare-fun b!1303518 () Bool)

(declare-fun res!865779 () Bool)

(assert (=> b!1303518 (=> (not res!865779) (not e!743512))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1303518 (= res!865779 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42453 _keys!1741))))))

(declare-fun b!1303519 () Bool)

(declare-fun e!743509 () Bool)

(assert (=> b!1303519 (= e!743509 true)))

(assert (=> b!1303519 false))

(declare-fun minValue!1387 () V!51643)

(declare-datatypes ((Unit!43160 0))(
  ( (Unit!43161) )
))
(declare-fun lt!583328 () Unit!43160)

(declare-datatypes ((tuple2!22618 0))(
  ( (tuple2!22619 (_1!11320 (_ BitVec 64)) (_2!11320 V!51643)) )
))
(declare-datatypes ((List!29744 0))(
  ( (Nil!29741) (Cons!29740 (h!30949 tuple2!22618) (t!43338 List!29744)) )
))
(declare-datatypes ((ListLongMap!20275 0))(
  ( (ListLongMap!20276 (toList!10153 List!29744)) )
))
(declare-fun lt!583325 () ListLongMap!20275)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!91 ((_ BitVec 64) (_ BitVec 64) V!51643 ListLongMap!20275) Unit!43160)

(assert (=> b!1303519 (= lt!583328 (lemmaInListMapAfterAddingDiffThenInBefore!91 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583325))))

(declare-fun lt!583329 () ListLongMap!20275)

(declare-fun contains!8289 (ListLongMap!20275 (_ BitVec 64)) Bool)

(declare-fun +!4478 (ListLongMap!20275 tuple2!22618) ListLongMap!20275)

(assert (=> b!1303519 (not (contains!8289 (+!4478 lt!583329 (tuple2!22619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583324 () Unit!43160)

(declare-fun addStillNotContains!475 (ListLongMap!20275 (_ BitVec 64) V!51643 (_ BitVec 64)) Unit!43160)

(assert (=> b!1303519 (= lt!583324 (addStillNotContains!475 lt!583329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303519 (not (contains!8289 lt!583325 k0!1205))))

(declare-fun zeroValue!1387 () V!51643)

(assert (=> b!1303519 (= lt!583325 (+!4478 lt!583329 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583326 () Unit!43160)

(assert (=> b!1303519 (= lt!583326 (addStillNotContains!475 lt!583329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6111 (array!86824 array!86822 (_ BitVec 32) (_ BitVec 32) V!51643 V!51643 (_ BitVec 32) Int) ListLongMap!20275)

(assert (=> b!1303519 (= lt!583329 (getCurrentListMapNoExtraKeys!6111 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303520 () Bool)

(assert (=> b!1303520 (= e!743511 tp_is_empty!34905)))

(declare-fun b!1303521 () Bool)

(declare-fun res!865776 () Bool)

(assert (=> b!1303521 (=> (not res!865776) (not e!743512))))

(declare-fun getCurrentListMap!5174 (array!86824 array!86822 (_ BitVec 32) (_ BitVec 32) V!51643 V!51643 (_ BitVec 32) Int) ListLongMap!20275)

(assert (=> b!1303521 (= res!865776 (contains!8289 (getCurrentListMap!5174 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303522 () Bool)

(declare-fun res!865777 () Bool)

(assert (=> b!1303522 (=> (not res!865777) (not e!743512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86824 (_ BitVec 32)) Bool)

(assert (=> b!1303522 (= res!865777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303523 () Bool)

(declare-fun res!865775 () Bool)

(assert (=> b!1303523 (=> (not res!865775) (not e!743512))))

(assert (=> b!1303523 (= res!865775 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42453 _keys!1741))))))

(declare-fun b!1303524 () Bool)

(assert (=> b!1303524 (= e!743512 (not e!743509))))

(declare-fun res!865781 () Bool)

(assert (=> b!1303524 (=> res!865781 e!743509)))

(assert (=> b!1303524 (= res!865781 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1303524 (not (contains!8289 (ListLongMap!20276 Nil!29741) k0!1205))))

(declare-fun lt!583327 () Unit!43160)

(declare-fun emptyContainsNothing!217 ((_ BitVec 64)) Unit!43160)

(assert (=> b!1303524 (= lt!583327 (emptyContainsNothing!217 k0!1205))))

(declare-fun mapIsEmpty!53950 () Bool)

(assert (=> mapIsEmpty!53950 mapRes!53950))

(declare-fun b!1303525 () Bool)

(declare-fun res!865778 () Bool)

(assert (=> b!1303525 (=> (not res!865778) (not e!743512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303525 (= res!865778 (not (validKeyInArray!0 (select (arr!41903 _keys!1741) from!2144))))))

(assert (= (and start!110066 res!865782) b!1303514))

(assert (= (and b!1303514 res!865780) b!1303522))

(assert (= (and b!1303522 res!865777) b!1303515))

(assert (= (and b!1303515 res!865774) b!1303523))

(assert (= (and b!1303523 res!865775) b!1303521))

(assert (= (and b!1303521 res!865776) b!1303518))

(assert (= (and b!1303518 res!865779) b!1303525))

(assert (= (and b!1303525 res!865778) b!1303524))

(assert (= (and b!1303524 (not res!865781)) b!1303519))

(assert (= (and b!1303516 condMapEmpty!53950) mapIsEmpty!53950))

(assert (= (and b!1303516 (not condMapEmpty!53950)) mapNonEmpty!53950))

(get-info :version)

(assert (= (and mapNonEmpty!53950 ((_ is ValueCellFull!16554) mapValue!53950)) b!1303517))

(assert (= (and b!1303516 ((_ is ValueCellFull!16554) mapDefault!53950)) b!1303520))

(assert (= start!110066 b!1303516))

(declare-fun m!1194431 () Bool)

(assert (=> b!1303521 m!1194431))

(assert (=> b!1303521 m!1194431))

(declare-fun m!1194433 () Bool)

(assert (=> b!1303521 m!1194433))

(declare-fun m!1194435 () Bool)

(assert (=> mapNonEmpty!53950 m!1194435))

(declare-fun m!1194437 () Bool)

(assert (=> b!1303515 m!1194437))

(declare-fun m!1194439 () Bool)

(assert (=> b!1303524 m!1194439))

(declare-fun m!1194441 () Bool)

(assert (=> b!1303524 m!1194441))

(declare-fun m!1194443 () Bool)

(assert (=> b!1303522 m!1194443))

(declare-fun m!1194445 () Bool)

(assert (=> start!110066 m!1194445))

(declare-fun m!1194447 () Bool)

(assert (=> start!110066 m!1194447))

(declare-fun m!1194449 () Bool)

(assert (=> start!110066 m!1194449))

(declare-fun m!1194451 () Bool)

(assert (=> b!1303519 m!1194451))

(declare-fun m!1194453 () Bool)

(assert (=> b!1303519 m!1194453))

(declare-fun m!1194455 () Bool)

(assert (=> b!1303519 m!1194455))

(declare-fun m!1194457 () Bool)

(assert (=> b!1303519 m!1194457))

(declare-fun m!1194459 () Bool)

(assert (=> b!1303519 m!1194459))

(declare-fun m!1194461 () Bool)

(assert (=> b!1303519 m!1194461))

(declare-fun m!1194463 () Bool)

(assert (=> b!1303519 m!1194463))

(assert (=> b!1303519 m!1194457))

(declare-fun m!1194465 () Bool)

(assert (=> b!1303519 m!1194465))

(declare-fun m!1194467 () Bool)

(assert (=> b!1303525 m!1194467))

(assert (=> b!1303525 m!1194467))

(declare-fun m!1194469 () Bool)

(assert (=> b!1303525 m!1194469))

(check-sat (not start!110066) b_and!47429 (not b!1303524) (not b!1303519) (not b_next!29265) (not b!1303525) (not b!1303522) (not mapNonEmpty!53950) (not b!1303515) (not b!1303521) tp_is_empty!34905)
(check-sat b_and!47429 (not b_next!29265))
