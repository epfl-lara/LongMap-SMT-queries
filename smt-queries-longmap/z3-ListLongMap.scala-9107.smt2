; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109428 () Bool)

(assert start!109428)

(declare-fun b_free!28917 () Bool)

(declare-fun b_next!28917 () Bool)

(assert (=> start!109428 (= b_free!28917 (not b_next!28917))))

(declare-fun tp!101870 () Bool)

(declare-fun b_and!47007 () Bool)

(assert (=> start!109428 (= tp!101870 b_and!47007)))

(declare-fun b!1295627 () Bool)

(declare-fun e!739232 () Bool)

(assert (=> b!1295627 (= e!739232 true)))

(declare-datatypes ((V!51179 0))(
  ( (V!51180 (val!17353 Int)) )
))
(declare-datatypes ((tuple2!22348 0))(
  ( (tuple2!22349 (_1!11185 (_ BitVec 64)) (_2!11185 V!51179)) )
))
(declare-datatypes ((List!29489 0))(
  ( (Nil!29486) (Cons!29485 (h!30694 tuple2!22348) (t!43053 List!29489)) )
))
(declare-datatypes ((ListLongMap!20005 0))(
  ( (ListLongMap!20006 (toList!10018 List!29489)) )
))
(declare-fun lt!579945 () ListLongMap!20005)

(declare-fun minValue!1387 () V!51179)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8136 (ListLongMap!20005 (_ BitVec 64)) Bool)

(declare-fun +!4423 (ListLongMap!20005 tuple2!22348) ListLongMap!20005)

(assert (=> b!1295627 (not (contains!8136 (+!4423 lt!579945 (tuple2!22349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42914 0))(
  ( (Unit!42915) )
))
(declare-fun lt!579947 () Unit!42914)

(declare-fun addStillNotContains!441 (ListLongMap!20005 (_ BitVec 64) V!51179 (_ BitVec 64)) Unit!42914)

(assert (=> b!1295627 (= lt!579947 (addStillNotContains!441 lt!579945 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51179)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16380 0))(
  ( (ValueCellFull!16380 (v!19956 V!51179)) (EmptyCell!16380) )
))
(declare-datatypes ((array!86134 0))(
  ( (array!86135 (arr!41568 (Array (_ BitVec 32) ValueCell!16380)) (size!42118 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86134)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86136 0))(
  ( (array!86137 (arr!41569 (Array (_ BitVec 32) (_ BitVec 64))) (size!42119 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86136)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6056 (array!86136 array!86134 (_ BitVec 32) (_ BitVec 32) V!51179 V!51179 (_ BitVec 32) Int) ListLongMap!20005)

(assert (=> b!1295627 (= lt!579945 (getCurrentListMapNoExtraKeys!6056 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53396 () Bool)

(declare-fun mapRes!53396 () Bool)

(declare-fun tp!101869 () Bool)

(declare-fun e!739228 () Bool)

(assert (=> mapNonEmpty!53396 (= mapRes!53396 (and tp!101869 e!739228))))

(declare-fun mapKey!53396 () (_ BitVec 32))

(declare-fun mapRest!53396 () (Array (_ BitVec 32) ValueCell!16380))

(declare-fun mapValue!53396 () ValueCell!16380)

(assert (=> mapNonEmpty!53396 (= (arr!41568 _values!1445) (store mapRest!53396 mapKey!53396 mapValue!53396))))

(declare-fun b!1295628 () Bool)

(declare-fun res!861125 () Bool)

(declare-fun e!739231 () Bool)

(assert (=> b!1295628 (=> (not res!861125) (not e!739231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86136 (_ BitVec 32)) Bool)

(assert (=> b!1295628 (= res!861125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295629 () Bool)

(declare-fun res!861118 () Bool)

(assert (=> b!1295629 (=> (not res!861118) (not e!739231))))

(assert (=> b!1295629 (= res!861118 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42119 _keys!1741))))))

(declare-fun b!1295630 () Bool)

(declare-fun tp_is_empty!34557 () Bool)

(assert (=> b!1295630 (= e!739228 tp_is_empty!34557)))

(declare-fun b!1295631 () Bool)

(assert (=> b!1295631 (= e!739231 (not e!739232))))

(declare-fun res!861120 () Bool)

(assert (=> b!1295631 (=> res!861120 e!739232)))

(assert (=> b!1295631 (= res!861120 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295631 (not (contains!8136 (ListLongMap!20006 Nil!29486) k0!1205))))

(declare-fun lt!579946 () Unit!42914)

(declare-fun emptyContainsNothing!176 ((_ BitVec 64)) Unit!42914)

(assert (=> b!1295631 (= lt!579946 (emptyContainsNothing!176 k0!1205))))

(declare-fun b!1295632 () Bool)

(declare-fun res!861126 () Bool)

(assert (=> b!1295632 (=> (not res!861126) (not e!739231))))

(assert (=> b!1295632 (= res!861126 (and (= (size!42118 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42119 _keys!1741) (size!42118 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295633 () Bool)

(declare-fun e!739227 () Bool)

(declare-fun e!739229 () Bool)

(assert (=> b!1295633 (= e!739227 (and e!739229 mapRes!53396))))

(declare-fun condMapEmpty!53396 () Bool)

(declare-fun mapDefault!53396 () ValueCell!16380)

(assert (=> b!1295633 (= condMapEmpty!53396 (= (arr!41568 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16380)) mapDefault!53396)))))

(declare-fun res!861121 () Bool)

(assert (=> start!109428 (=> (not res!861121) (not e!739231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109428 (= res!861121 (validMask!0 mask!2175))))

(assert (=> start!109428 e!739231))

(assert (=> start!109428 tp_is_empty!34557))

(assert (=> start!109428 true))

(declare-fun array_inv!31471 (array!86134) Bool)

(assert (=> start!109428 (and (array_inv!31471 _values!1445) e!739227)))

(declare-fun array_inv!31472 (array!86136) Bool)

(assert (=> start!109428 (array_inv!31472 _keys!1741)))

(assert (=> start!109428 tp!101870))

(declare-fun b!1295634 () Bool)

(declare-fun res!861119 () Bool)

(assert (=> b!1295634 (=> (not res!861119) (not e!739231))))

(declare-fun getCurrentListMap!5052 (array!86136 array!86134 (_ BitVec 32) (_ BitVec 32) V!51179 V!51179 (_ BitVec 32) Int) ListLongMap!20005)

(assert (=> b!1295634 (= res!861119 (contains!8136 (getCurrentListMap!5052 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295635 () Bool)

(declare-fun res!861123 () Bool)

(assert (=> b!1295635 (=> (not res!861123) (not e!739231))))

(assert (=> b!1295635 (= res!861123 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42119 _keys!1741))))))

(declare-fun b!1295636 () Bool)

(declare-fun res!861122 () Bool)

(assert (=> b!1295636 (=> (not res!861122) (not e!739231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295636 (= res!861122 (not (validKeyInArray!0 (select (arr!41569 _keys!1741) from!2144))))))

(declare-fun b!1295637 () Bool)

(declare-fun res!861124 () Bool)

(assert (=> b!1295637 (=> (not res!861124) (not e!739231))))

(declare-datatypes ((List!29490 0))(
  ( (Nil!29487) (Cons!29486 (h!30695 (_ BitVec 64)) (t!43054 List!29490)) )
))
(declare-fun arrayNoDuplicates!0 (array!86136 (_ BitVec 32) List!29490) Bool)

(assert (=> b!1295637 (= res!861124 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29487))))

(declare-fun mapIsEmpty!53396 () Bool)

(assert (=> mapIsEmpty!53396 mapRes!53396))

(declare-fun b!1295638 () Bool)

(assert (=> b!1295638 (= e!739229 tp_is_empty!34557)))

(assert (= (and start!109428 res!861121) b!1295632))

(assert (= (and b!1295632 res!861126) b!1295628))

(assert (= (and b!1295628 res!861125) b!1295637))

(assert (= (and b!1295637 res!861124) b!1295635))

(assert (= (and b!1295635 res!861123) b!1295634))

(assert (= (and b!1295634 res!861119) b!1295629))

(assert (= (and b!1295629 res!861118) b!1295636))

(assert (= (and b!1295636 res!861122) b!1295631))

(assert (= (and b!1295631 (not res!861120)) b!1295627))

(assert (= (and b!1295633 condMapEmpty!53396) mapIsEmpty!53396))

(assert (= (and b!1295633 (not condMapEmpty!53396)) mapNonEmpty!53396))

(get-info :version)

(assert (= (and mapNonEmpty!53396 ((_ is ValueCellFull!16380) mapValue!53396)) b!1295630))

(assert (= (and b!1295633 ((_ is ValueCellFull!16380) mapDefault!53396)) b!1295638))

(assert (= start!109428 b!1295633))

(declare-fun m!1187623 () Bool)

(assert (=> b!1295627 m!1187623))

(assert (=> b!1295627 m!1187623))

(declare-fun m!1187625 () Bool)

(assert (=> b!1295627 m!1187625))

(declare-fun m!1187627 () Bool)

(assert (=> b!1295627 m!1187627))

(declare-fun m!1187629 () Bool)

(assert (=> b!1295627 m!1187629))

(declare-fun m!1187631 () Bool)

(assert (=> mapNonEmpty!53396 m!1187631))

(declare-fun m!1187633 () Bool)

(assert (=> b!1295636 m!1187633))

(assert (=> b!1295636 m!1187633))

(declare-fun m!1187635 () Bool)

(assert (=> b!1295636 m!1187635))

(declare-fun m!1187637 () Bool)

(assert (=> b!1295628 m!1187637))

(declare-fun m!1187639 () Bool)

(assert (=> b!1295634 m!1187639))

(assert (=> b!1295634 m!1187639))

(declare-fun m!1187641 () Bool)

(assert (=> b!1295634 m!1187641))

(declare-fun m!1187643 () Bool)

(assert (=> start!109428 m!1187643))

(declare-fun m!1187645 () Bool)

(assert (=> start!109428 m!1187645))

(declare-fun m!1187647 () Bool)

(assert (=> start!109428 m!1187647))

(declare-fun m!1187649 () Bool)

(assert (=> b!1295631 m!1187649))

(declare-fun m!1187651 () Bool)

(assert (=> b!1295631 m!1187651))

(declare-fun m!1187653 () Bool)

(assert (=> b!1295637 m!1187653))

(check-sat b_and!47007 (not b!1295634) (not b_next!28917) (not b!1295637) tp_is_empty!34557 (not b!1295628) (not start!109428) (not mapNonEmpty!53396) (not b!1295631) (not b!1295627) (not b!1295636))
(check-sat b_and!47007 (not b_next!28917))
