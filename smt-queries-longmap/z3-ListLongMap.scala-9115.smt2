; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109474 () Bool)

(assert start!109474)

(declare-fun b_free!28963 () Bool)

(declare-fun b_next!28963 () Bool)

(assert (=> start!109474 (= b_free!28963 (not b_next!28963))))

(declare-fun tp!102008 () Bool)

(declare-fun b_and!47035 () Bool)

(assert (=> start!109474 (= tp!102008 b_and!47035)))

(declare-fun b!1296518 () Bool)

(declare-fun e!739665 () Bool)

(declare-fun e!739667 () Bool)

(declare-fun mapRes!53465 () Bool)

(assert (=> b!1296518 (= e!739665 (and e!739667 mapRes!53465))))

(declare-fun condMapEmpty!53465 () Bool)

(declare-datatypes ((V!51241 0))(
  ( (V!51242 (val!17376 Int)) )
))
(declare-datatypes ((ValueCell!16403 0))(
  ( (ValueCellFull!16403 (v!19978 V!51241)) (EmptyCell!16403) )
))
(declare-datatypes ((array!86117 0))(
  ( (array!86118 (arr!41560 (Array (_ BitVec 32) ValueCell!16403)) (size!42112 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86117)

(declare-fun mapDefault!53465 () ValueCell!16403)

(assert (=> b!1296518 (= condMapEmpty!53465 (= (arr!41560 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16403)) mapDefault!53465)))))

(declare-fun b!1296519 () Bool)

(declare-fun res!861677 () Bool)

(declare-fun e!739666 () Bool)

(assert (=> b!1296519 (=> (not res!861677) (not e!739666))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86119 0))(
  ( (array!86120 (arr!41561 (Array (_ BitVec 32) (_ BitVec 64))) (size!42113 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86119)

(assert (=> b!1296519 (= res!861677 (and (= (size!42112 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42113 _keys!1741) (size!42112 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296520 () Bool)

(declare-fun res!861679 () Bool)

(assert (=> b!1296520 (=> (not res!861679) (not e!739666))))

(declare-datatypes ((List!29569 0))(
  ( (Nil!29566) (Cons!29565 (h!30774 (_ BitVec 64)) (t!43125 List!29569)) )
))
(declare-fun arrayNoDuplicates!0 (array!86119 (_ BitVec 32) List!29569) Bool)

(assert (=> b!1296520 (= res!861679 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29566))))

(declare-fun res!861680 () Bool)

(assert (=> start!109474 (=> (not res!861680) (not e!739666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109474 (= res!861680 (validMask!0 mask!2175))))

(assert (=> start!109474 e!739666))

(declare-fun tp_is_empty!34603 () Bool)

(assert (=> start!109474 tp_is_empty!34603))

(assert (=> start!109474 true))

(declare-fun array_inv!31621 (array!86117) Bool)

(assert (=> start!109474 (and (array_inv!31621 _values!1445) e!739665)))

(declare-fun array_inv!31622 (array!86119) Bool)

(assert (=> start!109474 (array_inv!31622 _keys!1741)))

(assert (=> start!109474 tp!102008))

(declare-fun b!1296521 () Bool)

(assert (=> b!1296521 (= e!739667 tp_is_empty!34603)))

(declare-fun mapIsEmpty!53465 () Bool)

(assert (=> mapIsEmpty!53465 mapRes!53465))

(declare-fun b!1296522 () Bool)

(declare-fun res!861681 () Bool)

(assert (=> b!1296522 (=> (not res!861681) (not e!739666))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296522 (= res!861681 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42113 _keys!1741))))))

(declare-fun b!1296523 () Bool)

(assert (=> b!1296523 (= e!739666 false)))

(declare-fun minValue!1387 () V!51241)

(declare-fun zeroValue!1387 () V!51241)

(declare-fun lt!580321 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22442 0))(
  ( (tuple2!22443 (_1!11232 (_ BitVec 64)) (_2!11232 V!51241)) )
))
(declare-datatypes ((List!29570 0))(
  ( (Nil!29567) (Cons!29566 (h!30775 tuple2!22442) (t!43126 List!29570)) )
))
(declare-datatypes ((ListLongMap!20099 0))(
  ( (ListLongMap!20100 (toList!10065 List!29570)) )
))
(declare-fun contains!8113 (ListLongMap!20099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4981 (array!86119 array!86117 (_ BitVec 32) (_ BitVec 32) V!51241 V!51241 (_ BitVec 32) Int) ListLongMap!20099)

(assert (=> b!1296523 (= lt!580321 (contains!8113 (getCurrentListMap!4981 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53465 () Bool)

(declare-fun tp!102009 () Bool)

(declare-fun e!739664 () Bool)

(assert (=> mapNonEmpty!53465 (= mapRes!53465 (and tp!102009 e!739664))))

(declare-fun mapKey!53465 () (_ BitVec 32))

(declare-fun mapRest!53465 () (Array (_ BitVec 32) ValueCell!16403))

(declare-fun mapValue!53465 () ValueCell!16403)

(assert (=> mapNonEmpty!53465 (= (arr!41560 _values!1445) (store mapRest!53465 mapKey!53465 mapValue!53465))))

(declare-fun b!1296524 () Bool)

(assert (=> b!1296524 (= e!739664 tp_is_empty!34603)))

(declare-fun b!1296525 () Bool)

(declare-fun res!861678 () Bool)

(assert (=> b!1296525 (=> (not res!861678) (not e!739666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86119 (_ BitVec 32)) Bool)

(assert (=> b!1296525 (= res!861678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109474 res!861680) b!1296519))

(assert (= (and b!1296519 res!861677) b!1296525))

(assert (= (and b!1296525 res!861678) b!1296520))

(assert (= (and b!1296520 res!861679) b!1296522))

(assert (= (and b!1296522 res!861681) b!1296523))

(assert (= (and b!1296518 condMapEmpty!53465) mapIsEmpty!53465))

(assert (= (and b!1296518 (not condMapEmpty!53465)) mapNonEmpty!53465))

(get-info :version)

(assert (= (and mapNonEmpty!53465 ((_ is ValueCellFull!16403) mapValue!53465)) b!1296524))

(assert (= (and b!1296518 ((_ is ValueCellFull!16403) mapDefault!53465)) b!1296521))

(assert (= start!109474 b!1296518))

(declare-fun m!1187967 () Bool)

(assert (=> b!1296523 m!1187967))

(assert (=> b!1296523 m!1187967))

(declare-fun m!1187969 () Bool)

(assert (=> b!1296523 m!1187969))

(declare-fun m!1187971 () Bool)

(assert (=> b!1296520 m!1187971))

(declare-fun m!1187973 () Bool)

(assert (=> start!109474 m!1187973))

(declare-fun m!1187975 () Bool)

(assert (=> start!109474 m!1187975))

(declare-fun m!1187977 () Bool)

(assert (=> start!109474 m!1187977))

(declare-fun m!1187979 () Bool)

(assert (=> mapNonEmpty!53465 m!1187979))

(declare-fun m!1187981 () Bool)

(assert (=> b!1296525 m!1187981))

(check-sat (not b!1296523) (not mapNonEmpty!53465) (not start!109474) (not b!1296520) tp_is_empty!34603 (not b!1296525) b_and!47035 (not b_next!28963))
(check-sat b_and!47035 (not b_next!28963))
