; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110158 () Bool)

(assert start!110158)

(declare-fun b_free!29281 () Bool)

(declare-fun b_next!29281 () Bool)

(assert (=> start!110158 (= b_free!29281 (not b_next!29281))))

(declare-fun tp!103001 () Bool)

(declare-fun b_and!47443 () Bool)

(assert (=> start!110158 (= tp!103001 b_and!47443)))

(declare-fun b!1304202 () Bool)

(declare-fun res!866174 () Bool)

(declare-fun e!743929 () Bool)

(assert (=> b!1304202 (=> (not res!866174) (not e!743929))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86763 0))(
  ( (array!86764 (arr!41871 (Array (_ BitVec 32) (_ BitVec 64))) (size!42423 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86763)

(assert (=> b!1304202 (= res!866174 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42423 _keys!1741))))))

(declare-fun b!1304203 () Bool)

(declare-fun res!866176 () Bool)

(assert (=> b!1304203 (=> (not res!866176) (not e!743929))))

(assert (=> b!1304203 (= res!866176 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42423 _keys!1741))))))

(declare-fun b!1304204 () Bool)

(declare-fun e!743931 () Bool)

(declare-fun tp_is_empty!34921 () Bool)

(assert (=> b!1304204 (= e!743931 tp_is_empty!34921)))

(declare-fun b!1304205 () Bool)

(declare-fun e!743927 () Bool)

(declare-fun mapRes!53981 () Bool)

(assert (=> b!1304205 (= e!743927 (and e!743931 mapRes!53981))))

(declare-fun condMapEmpty!53981 () Bool)

(declare-datatypes ((V!51665 0))(
  ( (V!51666 (val!17535 Int)) )
))
(declare-datatypes ((ValueCell!16562 0))(
  ( (ValueCellFull!16562 (v!20153 V!51665)) (EmptyCell!16562) )
))
(declare-datatypes ((array!86765 0))(
  ( (array!86766 (arr!41872 (Array (_ BitVec 32) ValueCell!16562)) (size!42424 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86765)

(declare-fun mapDefault!53981 () ValueCell!16562)

(assert (=> b!1304205 (= condMapEmpty!53981 (= (arr!41872 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16562)) mapDefault!53981)))))

(declare-fun mapIsEmpty!53981 () Bool)

(assert (=> mapIsEmpty!53981 mapRes!53981))

(declare-fun res!866173 () Bool)

(assert (=> start!110158 (=> (not res!866173) (not e!743929))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110158 (= res!866173 (validMask!0 mask!2175))))

(assert (=> start!110158 e!743929))

(assert (=> start!110158 tp_is_empty!34921))

(assert (=> start!110158 true))

(declare-fun array_inv!31849 (array!86765) Bool)

(assert (=> start!110158 (and (array_inv!31849 _values!1445) e!743927)))

(declare-fun array_inv!31850 (array!86763) Bool)

(assert (=> start!110158 (array_inv!31850 _keys!1741)))

(assert (=> start!110158 tp!103001))

(declare-fun b!1304206 () Bool)

(declare-fun res!866170 () Bool)

(assert (=> b!1304206 (=> (not res!866170) (not e!743929))))

(declare-fun minValue!1387 () V!51665)

(declare-fun zeroValue!1387 () V!51665)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22694 0))(
  ( (tuple2!22695 (_1!11358 (_ BitVec 64)) (_2!11358 V!51665)) )
))
(declare-datatypes ((List!29800 0))(
  ( (Nil!29797) (Cons!29796 (h!31005 tuple2!22694) (t!43390 List!29800)) )
))
(declare-datatypes ((ListLongMap!20351 0))(
  ( (ListLongMap!20352 (toList!10191 List!29800)) )
))
(declare-fun contains!8259 (ListLongMap!20351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5092 (array!86763 array!86765 (_ BitVec 32) (_ BitVec 32) V!51665 V!51665 (_ BitVec 32) Int) ListLongMap!20351)

(assert (=> b!1304206 (= res!866170 (contains!8259 (getCurrentListMap!5092 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53981 () Bool)

(declare-fun tp!103002 () Bool)

(declare-fun e!743926 () Bool)

(assert (=> mapNonEmpty!53981 (= mapRes!53981 (and tp!103002 e!743926))))

(declare-fun mapRest!53981 () (Array (_ BitVec 32) ValueCell!16562))

(declare-fun mapValue!53981 () ValueCell!16562)

(declare-fun mapKey!53981 () (_ BitVec 32))

(assert (=> mapNonEmpty!53981 (= (arr!41872 _values!1445) (store mapRest!53981 mapKey!53981 mapValue!53981))))

(declare-fun b!1304207 () Bool)

(declare-fun res!866171 () Bool)

(assert (=> b!1304207 (=> (not res!866171) (not e!743929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86763 (_ BitVec 32)) Bool)

(assert (=> b!1304207 (= res!866171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304208 () Bool)

(declare-fun e!743930 () Bool)

(assert (=> b!1304208 (= e!743930 true)))

(declare-fun lt!583571 () ListLongMap!20351)

(declare-fun +!4517 (ListLongMap!20351 tuple2!22694) ListLongMap!20351)

(assert (=> b!1304208 (not (contains!8259 (+!4517 lt!583571 (tuple2!22695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!43031 0))(
  ( (Unit!43032) )
))
(declare-fun lt!583572 () Unit!43031)

(declare-fun addStillNotContains!470 (ListLongMap!20351 (_ BitVec 64) V!51665 (_ BitVec 64)) Unit!43031)

(assert (=> b!1304208 (= lt!583572 (addStillNotContains!470 lt!583571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6151 (array!86763 array!86765 (_ BitVec 32) (_ BitVec 32) V!51665 V!51665 (_ BitVec 32) Int) ListLongMap!20351)

(assert (=> b!1304208 (= lt!583571 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304209 () Bool)

(declare-fun res!866175 () Bool)

(assert (=> b!1304209 (=> (not res!866175) (not e!743929))))

(declare-datatypes ((List!29801 0))(
  ( (Nil!29798) (Cons!29797 (h!31006 (_ BitVec 64)) (t!43391 List!29801)) )
))
(declare-fun arrayNoDuplicates!0 (array!86763 (_ BitVec 32) List!29801) Bool)

(assert (=> b!1304209 (= res!866175 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29798))))

(declare-fun b!1304210 () Bool)

(declare-fun res!866169 () Bool)

(assert (=> b!1304210 (=> (not res!866169) (not e!743929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304210 (= res!866169 (not (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144))))))

(declare-fun b!1304211 () Bool)

(assert (=> b!1304211 (= e!743926 tp_is_empty!34921)))

(declare-fun b!1304212 () Bool)

(declare-fun res!866177 () Bool)

(assert (=> b!1304212 (=> (not res!866177) (not e!743929))))

(assert (=> b!1304212 (= res!866177 (and (= (size!42424 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42423 _keys!1741) (size!42424 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304213 () Bool)

(assert (=> b!1304213 (= e!743929 (not e!743930))))

(declare-fun res!866172 () Bool)

(assert (=> b!1304213 (=> res!866172 e!743930)))

(assert (=> b!1304213 (= res!866172 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304213 (not (contains!8259 (ListLongMap!20352 Nil!29797) k0!1205))))

(declare-fun lt!583570 () Unit!43031)

(declare-fun emptyContainsNothing!219 ((_ BitVec 64)) Unit!43031)

(assert (=> b!1304213 (= lt!583570 (emptyContainsNothing!219 k0!1205))))

(assert (= (and start!110158 res!866173) b!1304212))

(assert (= (and b!1304212 res!866177) b!1304207))

(assert (= (and b!1304207 res!866171) b!1304209))

(assert (= (and b!1304209 res!866175) b!1304203))

(assert (= (and b!1304203 res!866176) b!1304206))

(assert (= (and b!1304206 res!866170) b!1304202))

(assert (= (and b!1304202 res!866174) b!1304210))

(assert (= (and b!1304210 res!866169) b!1304213))

(assert (= (and b!1304213 (not res!866172)) b!1304208))

(assert (= (and b!1304205 condMapEmpty!53981) mapIsEmpty!53981))

(assert (= (and b!1304205 (not condMapEmpty!53981)) mapNonEmpty!53981))

(get-info :version)

(assert (= (and mapNonEmpty!53981 ((_ is ValueCellFull!16562) mapValue!53981)) b!1304211))

(assert (= (and b!1304205 ((_ is ValueCellFull!16562) mapDefault!53981)) b!1304204))

(assert (= start!110158 b!1304205))

(declare-fun m!1194741 () Bool)

(assert (=> start!110158 m!1194741))

(declare-fun m!1194743 () Bool)

(assert (=> start!110158 m!1194743))

(declare-fun m!1194745 () Bool)

(assert (=> start!110158 m!1194745))

(declare-fun m!1194747 () Bool)

(assert (=> b!1304209 m!1194747))

(declare-fun m!1194749 () Bool)

(assert (=> mapNonEmpty!53981 m!1194749))

(declare-fun m!1194751 () Bool)

(assert (=> b!1304206 m!1194751))

(assert (=> b!1304206 m!1194751))

(declare-fun m!1194753 () Bool)

(assert (=> b!1304206 m!1194753))

(declare-fun m!1194755 () Bool)

(assert (=> b!1304208 m!1194755))

(assert (=> b!1304208 m!1194755))

(declare-fun m!1194757 () Bool)

(assert (=> b!1304208 m!1194757))

(declare-fun m!1194759 () Bool)

(assert (=> b!1304208 m!1194759))

(declare-fun m!1194761 () Bool)

(assert (=> b!1304208 m!1194761))

(declare-fun m!1194763 () Bool)

(assert (=> b!1304207 m!1194763))

(declare-fun m!1194765 () Bool)

(assert (=> b!1304213 m!1194765))

(declare-fun m!1194767 () Bool)

(assert (=> b!1304213 m!1194767))

(declare-fun m!1194769 () Bool)

(assert (=> b!1304210 m!1194769))

(assert (=> b!1304210 m!1194769))

(declare-fun m!1194771 () Bool)

(assert (=> b!1304210 m!1194771))

(check-sat (not b_next!29281) (not start!110158) (not b!1304213) (not b!1304206) (not b!1304207) (not b!1304209) b_and!47443 (not b!1304208) (not mapNonEmpty!53981) (not b!1304210) tp_is_empty!34921)
(check-sat b_and!47443 (not b_next!29281))
