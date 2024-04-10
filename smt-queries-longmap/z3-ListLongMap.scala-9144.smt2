; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109686 () Bool)

(assert start!109686)

(declare-fun b_free!29139 () Bool)

(declare-fun b_next!29139 () Bool)

(assert (=> start!109686 (= b_free!29139 (not b_next!29139))))

(declare-fun tp!102541 () Bool)

(declare-fun b_and!47235 () Bool)

(assert (=> start!109686 (= tp!102541 b_and!47235)))

(declare-fun mapNonEmpty!53735 () Bool)

(declare-fun mapRes!53735 () Bool)

(declare-fun tp!102542 () Bool)

(declare-fun e!741199 () Bool)

(assert (=> mapNonEmpty!53735 (= mapRes!53735 (and tp!102542 e!741199))))

(declare-datatypes ((V!51475 0))(
  ( (V!51476 (val!17464 Int)) )
))
(declare-datatypes ((ValueCell!16491 0))(
  ( (ValueCellFull!16491 (v!20069 V!51475)) (EmptyCell!16491) )
))
(declare-fun mapValue!53735 () ValueCell!16491)

(declare-fun mapKey!53735 () (_ BitVec 32))

(declare-fun mapRest!53735 () (Array (_ BitVec 32) ValueCell!16491))

(declare-datatypes ((array!86566 0))(
  ( (array!86567 (arr!41782 (Array (_ BitVec 32) ValueCell!16491)) (size!42332 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86566)

(assert (=> mapNonEmpty!53735 (= (arr!41782 _values!1445) (store mapRest!53735 mapKey!53735 mapValue!53735))))

(declare-fun b!1299208 () Bool)

(declare-fun tp_is_empty!34779 () Bool)

(assert (=> b!1299208 (= e!741199 tp_is_empty!34779)))

(declare-fun b!1299209 () Bool)

(declare-fun res!863393 () Bool)

(declare-fun e!741198 () Bool)

(assert (=> b!1299209 (=> (not res!863393) (not e!741198))))

(declare-datatypes ((array!86568 0))(
  ( (array!86569 (arr!41783 (Array (_ BitVec 32) (_ BitVec 64))) (size!42333 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86568)

(declare-datatypes ((List!29654 0))(
  ( (Nil!29651) (Cons!29650 (h!30859 (_ BitVec 64)) (t!43222 List!29654)) )
))
(declare-fun arrayNoDuplicates!0 (array!86568 (_ BitVec 32) List!29654) Bool)

(assert (=> b!1299209 (= res!863393 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29651))))

(declare-fun res!863392 () Bool)

(assert (=> start!109686 (=> (not res!863392) (not e!741198))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109686 (= res!863392 (validMask!0 mask!2175))))

(assert (=> start!109686 e!741198))

(assert (=> start!109686 tp_is_empty!34779))

(assert (=> start!109686 true))

(declare-fun e!741200 () Bool)

(declare-fun array_inv!31621 (array!86566) Bool)

(assert (=> start!109686 (and (array_inv!31621 _values!1445) e!741200)))

(declare-fun array_inv!31622 (array!86568) Bool)

(assert (=> start!109686 (array_inv!31622 _keys!1741)))

(assert (=> start!109686 tp!102541))

(declare-fun b!1299210 () Bool)

(declare-fun e!741202 () Bool)

(assert (=> b!1299210 (= e!741202 tp_is_empty!34779)))

(declare-fun b!1299211 () Bool)

(assert (=> b!1299211 (= e!741198 false)))

(declare-fun minValue!1387 () V!51475)

(declare-fun zeroValue!1387 () V!51475)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580960 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22524 0))(
  ( (tuple2!22525 (_1!11273 (_ BitVec 64)) (_2!11273 V!51475)) )
))
(declare-datatypes ((List!29655 0))(
  ( (Nil!29652) (Cons!29651 (h!30860 tuple2!22524) (t!43223 List!29655)) )
))
(declare-datatypes ((ListLongMap!20181 0))(
  ( (ListLongMap!20182 (toList!10106 List!29655)) )
))
(declare-fun contains!8226 (ListLongMap!20181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5135 (array!86568 array!86566 (_ BitVec 32) (_ BitVec 32) V!51475 V!51475 (_ BitVec 32) Int) ListLongMap!20181)

(assert (=> b!1299211 (= lt!580960 (contains!8226 (getCurrentListMap!5135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299212 () Bool)

(declare-fun res!863394 () Bool)

(assert (=> b!1299212 (=> (not res!863394) (not e!741198))))

(assert (=> b!1299212 (= res!863394 (and (= (size!42332 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42333 _keys!1741) (size!42332 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299213 () Bool)

(assert (=> b!1299213 (= e!741200 (and e!741202 mapRes!53735))))

(declare-fun condMapEmpty!53735 () Bool)

(declare-fun mapDefault!53735 () ValueCell!16491)

(assert (=> b!1299213 (= condMapEmpty!53735 (= (arr!41782 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16491)) mapDefault!53735)))))

(declare-fun b!1299214 () Bool)

(declare-fun res!863390 () Bool)

(assert (=> b!1299214 (=> (not res!863390) (not e!741198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86568 (_ BitVec 32)) Bool)

(assert (=> b!1299214 (= res!863390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53735 () Bool)

(assert (=> mapIsEmpty!53735 mapRes!53735))

(declare-fun b!1299215 () Bool)

(declare-fun res!863391 () Bool)

(assert (=> b!1299215 (=> (not res!863391) (not e!741198))))

(assert (=> b!1299215 (= res!863391 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42333 _keys!1741))))))

(assert (= (and start!109686 res!863392) b!1299212))

(assert (= (and b!1299212 res!863394) b!1299214))

(assert (= (and b!1299214 res!863390) b!1299209))

(assert (= (and b!1299209 res!863393) b!1299215))

(assert (= (and b!1299215 res!863391) b!1299211))

(assert (= (and b!1299213 condMapEmpty!53735) mapIsEmpty!53735))

(assert (= (and b!1299213 (not condMapEmpty!53735)) mapNonEmpty!53735))

(get-info :version)

(assert (= (and mapNonEmpty!53735 ((_ is ValueCellFull!16491) mapValue!53735)) b!1299208))

(assert (= (and b!1299213 ((_ is ValueCellFull!16491) mapDefault!53735)) b!1299210))

(assert (= start!109686 b!1299213))

(declare-fun m!1190435 () Bool)

(assert (=> mapNonEmpty!53735 m!1190435))

(declare-fun m!1190437 () Bool)

(assert (=> b!1299209 m!1190437))

(declare-fun m!1190439 () Bool)

(assert (=> b!1299211 m!1190439))

(assert (=> b!1299211 m!1190439))

(declare-fun m!1190441 () Bool)

(assert (=> b!1299211 m!1190441))

(declare-fun m!1190443 () Bool)

(assert (=> start!109686 m!1190443))

(declare-fun m!1190445 () Bool)

(assert (=> start!109686 m!1190445))

(declare-fun m!1190447 () Bool)

(assert (=> start!109686 m!1190447))

(declare-fun m!1190449 () Bool)

(assert (=> b!1299214 m!1190449))

(check-sat (not b_next!29139) tp_is_empty!34779 (not b!1299209) b_and!47235 (not mapNonEmpty!53735) (not start!109686) (not b!1299214) (not b!1299211))
(check-sat b_and!47235 (not b_next!29139))
