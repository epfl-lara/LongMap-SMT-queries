; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108624 () Bool)

(assert start!108624)

(declare-fun b_free!28137 () Bool)

(declare-fun b_next!28137 () Bool)

(assert (=> start!108624 (= b_free!28137 (not b_next!28137))))

(declare-fun tp!99527 () Bool)

(declare-fun b_and!46203 () Bool)

(assert (=> start!108624 (= tp!99527 b_and!46203)))

(declare-fun b!1282182 () Bool)

(declare-fun e!732588 () Bool)

(declare-fun e!732589 () Bool)

(declare-fun mapRes!52223 () Bool)

(assert (=> b!1282182 (= e!732588 (and e!732589 mapRes!52223))))

(declare-fun condMapEmpty!52223 () Bool)

(declare-datatypes ((V!50139 0))(
  ( (V!50140 (val!16963 Int)) )
))
(declare-datatypes ((ValueCell!15990 0))(
  ( (ValueCellFull!15990 (v!19565 V!50139)) (EmptyCell!15990) )
))
(declare-datatypes ((array!84624 0))(
  ( (array!84625 (arr!40814 (Array (_ BitVec 32) ValueCell!15990)) (size!41364 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84624)

(declare-fun mapDefault!52223 () ValueCell!15990)

(assert (=> b!1282182 (= condMapEmpty!52223 (= (arr!40814 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15990)) mapDefault!52223)))))

(declare-fun b!1282183 () Bool)

(declare-fun e!732587 () Bool)

(declare-fun tp_is_empty!33777 () Bool)

(assert (=> b!1282183 (= e!732587 tp_is_empty!33777)))

(declare-fun mapIsEmpty!52223 () Bool)

(assert (=> mapIsEmpty!52223 mapRes!52223))

(declare-fun b!1282184 () Bool)

(declare-fun e!732590 () Bool)

(assert (=> b!1282184 (= e!732590 false)))

(declare-fun minValue!1387 () V!50139)

(declare-fun zeroValue!1387 () V!50139)

(declare-fun lt!576502 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84626 0))(
  ( (array!84627 (arr!40815 (Array (_ BitVec 32) (_ BitVec 64))) (size!41365 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84626)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21720 0))(
  ( (tuple2!21721 (_1!10871 (_ BitVec 64)) (_2!10871 V!50139)) )
))
(declare-datatypes ((List!28913 0))(
  ( (Nil!28910) (Cons!28909 (h!30118 tuple2!21720) (t!42457 List!28913)) )
))
(declare-datatypes ((ListLongMap!19377 0))(
  ( (ListLongMap!19378 (toList!9704 List!28913)) )
))
(declare-fun contains!7821 (ListLongMap!19377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4788 (array!84626 array!84624 (_ BitVec 32) (_ BitVec 32) V!50139 V!50139 (_ BitVec 32) Int) ListLongMap!19377)

(assert (=> b!1282184 (= lt!576502 (contains!7821 (getCurrentListMap!4788 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282185 () Bool)

(declare-fun res!851674 () Bool)

(assert (=> b!1282185 (=> (not res!851674) (not e!732590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84626 (_ BitVec 32)) Bool)

(assert (=> b!1282185 (= res!851674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52223 () Bool)

(declare-fun tp!99526 () Bool)

(assert (=> mapNonEmpty!52223 (= mapRes!52223 (and tp!99526 e!732587))))

(declare-fun mapRest!52223 () (Array (_ BitVec 32) ValueCell!15990))

(declare-fun mapKey!52223 () (_ BitVec 32))

(declare-fun mapValue!52223 () ValueCell!15990)

(assert (=> mapNonEmpty!52223 (= (arr!40814 _values!1445) (store mapRest!52223 mapKey!52223 mapValue!52223))))

(declare-fun b!1282186 () Bool)

(declare-fun res!851672 () Bool)

(assert (=> b!1282186 (=> (not res!851672) (not e!732590))))

(assert (=> b!1282186 (= res!851672 (and (= (size!41364 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41365 _keys!1741) (size!41364 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282187 () Bool)

(declare-fun res!851675 () Bool)

(assert (=> b!1282187 (=> (not res!851675) (not e!732590))))

(declare-datatypes ((List!28914 0))(
  ( (Nil!28911) (Cons!28910 (h!30119 (_ BitVec 64)) (t!42458 List!28914)) )
))
(declare-fun arrayNoDuplicates!0 (array!84626 (_ BitVec 32) List!28914) Bool)

(assert (=> b!1282187 (= res!851675 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28911))))

(declare-fun b!1282188 () Bool)

(declare-fun res!851676 () Bool)

(assert (=> b!1282188 (=> (not res!851676) (not e!732590))))

(assert (=> b!1282188 (= res!851676 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41365 _keys!1741))))))

(declare-fun b!1282181 () Bool)

(assert (=> b!1282181 (= e!732589 tp_is_empty!33777)))

(declare-fun res!851673 () Bool)

(assert (=> start!108624 (=> (not res!851673) (not e!732590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108624 (= res!851673 (validMask!0 mask!2175))))

(assert (=> start!108624 e!732590))

(assert (=> start!108624 tp_is_empty!33777))

(assert (=> start!108624 true))

(declare-fun array_inv!30967 (array!84624) Bool)

(assert (=> start!108624 (and (array_inv!30967 _values!1445) e!732588)))

(declare-fun array_inv!30968 (array!84626) Bool)

(assert (=> start!108624 (array_inv!30968 _keys!1741)))

(assert (=> start!108624 tp!99527))

(assert (= (and start!108624 res!851673) b!1282186))

(assert (= (and b!1282186 res!851672) b!1282185))

(assert (= (and b!1282185 res!851674) b!1282187))

(assert (= (and b!1282187 res!851675) b!1282188))

(assert (= (and b!1282188 res!851676) b!1282184))

(assert (= (and b!1282182 condMapEmpty!52223) mapIsEmpty!52223))

(assert (= (and b!1282182 (not condMapEmpty!52223)) mapNonEmpty!52223))

(get-info :version)

(assert (= (and mapNonEmpty!52223 ((_ is ValueCellFull!15990) mapValue!52223)) b!1282183))

(assert (= (and b!1282182 ((_ is ValueCellFull!15990) mapDefault!52223)) b!1282181))

(assert (= start!108624 b!1282182))

(declare-fun m!1176469 () Bool)

(assert (=> start!108624 m!1176469))

(declare-fun m!1176471 () Bool)

(assert (=> start!108624 m!1176471))

(declare-fun m!1176473 () Bool)

(assert (=> start!108624 m!1176473))

(declare-fun m!1176475 () Bool)

(assert (=> b!1282184 m!1176475))

(assert (=> b!1282184 m!1176475))

(declare-fun m!1176477 () Bool)

(assert (=> b!1282184 m!1176477))

(declare-fun m!1176479 () Bool)

(assert (=> b!1282187 m!1176479))

(declare-fun m!1176481 () Bool)

(assert (=> b!1282185 m!1176481))

(declare-fun m!1176483 () Bool)

(assert (=> mapNonEmpty!52223 m!1176483))

(check-sat (not mapNonEmpty!52223) (not b!1282184) (not b!1282185) (not start!108624) (not b_next!28137) (not b!1282187) b_and!46203 tp_is_empty!33777)
(check-sat b_and!46203 (not b_next!28137))
