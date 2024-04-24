; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108900 () Bool)

(assert start!108900)

(declare-fun b_free!28189 () Bool)

(declare-fun b_next!28189 () Bool)

(assert (=> start!108900 (= b_free!28189 (not b_next!28189))))

(declare-fun tp!99682 () Bool)

(declare-fun b_and!46257 () Bool)

(assert (=> start!108900 (= tp!99682 b_and!46257)))

(declare-fun b!1284146 () Bool)

(declare-fun e!733825 () Bool)

(assert (=> b!1284146 (= e!733825 false)))

(declare-datatypes ((V!50209 0))(
  ( (V!50210 (val!16989 Int)) )
))
(declare-fun minValue!1387 () V!50209)

(declare-fun zeroValue!1387 () V!50209)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577055 () Bool)

(declare-datatypes ((ValueCell!16016 0))(
  ( (ValueCellFull!16016 (v!19586 V!50209)) (EmptyCell!16016) )
))
(declare-datatypes ((array!84753 0))(
  ( (array!84754 (arr!40874 (Array (_ BitVec 32) ValueCell!16016)) (size!41425 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84753)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84755 0))(
  ( (array!84756 (arr!40875 (Array (_ BitVec 32) (_ BitVec 64))) (size!41426 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84755)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21770 0))(
  ( (tuple2!21771 (_1!10896 (_ BitVec 64)) (_2!10896 V!50209)) )
))
(declare-datatypes ((List!28982 0))(
  ( (Nil!28979) (Cons!28978 (h!30196 tuple2!21770) (t!42518 List!28982)) )
))
(declare-datatypes ((ListLongMap!19435 0))(
  ( (ListLongMap!19436 (toList!9733 List!28982)) )
))
(declare-fun contains!7864 (ListLongMap!19435 (_ BitVec 64)) Bool)

(declare-fun +!4320 (ListLongMap!19435 tuple2!21770) ListLongMap!19435)

(declare-fun getCurrentListMapNoExtraKeys!5952 (array!84755 array!84753 (_ BitVec 32) (_ BitVec 32) V!50209 V!50209 (_ BitVec 32) Int) ListLongMap!19435)

(assert (=> b!1284146 (= lt!577055 (contains!7864 (+!4320 (+!4320 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun mapIsEmpty!52301 () Bool)

(declare-fun mapRes!52301 () Bool)

(assert (=> mapIsEmpty!52301 mapRes!52301))

(declare-fun b!1284147 () Bool)

(declare-fun res!852625 () Bool)

(assert (=> b!1284147 (=> (not res!852625) (not e!733825))))

(declare-fun getCurrentListMap!4802 (array!84755 array!84753 (_ BitVec 32) (_ BitVec 32) V!50209 V!50209 (_ BitVec 32) Int) ListLongMap!19435)

(assert (=> b!1284147 (= res!852625 (contains!7864 (getCurrentListMap!4802 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284148 () Bool)

(declare-fun res!852620 () Bool)

(assert (=> b!1284148 (=> (not res!852620) (not e!733825))))

(assert (=> b!1284148 (= res!852620 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41426 _keys!1741))))))

(declare-fun b!1284149 () Bool)

(declare-fun res!852621 () Bool)

(assert (=> b!1284149 (=> (not res!852621) (not e!733825))))

(assert (=> b!1284149 (= res!852621 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41426 _keys!1741))))))

(declare-fun b!1284150 () Bool)

(declare-fun res!852619 () Bool)

(assert (=> b!1284150 (=> (not res!852619) (not e!733825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84755 (_ BitVec 32)) Bool)

(assert (=> b!1284150 (= res!852619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284151 () Bool)

(declare-fun res!852617 () Bool)

(assert (=> b!1284151 (=> (not res!852617) (not e!733825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284151 (= res!852617 (validKeyInArray!0 (select (arr!40875 _keys!1741) from!2144)))))

(declare-fun b!1284152 () Bool)

(declare-fun e!733824 () Bool)

(declare-fun e!733826 () Bool)

(assert (=> b!1284152 (= e!733824 (and e!733826 mapRes!52301))))

(declare-fun condMapEmpty!52301 () Bool)

(declare-fun mapDefault!52301 () ValueCell!16016)

(assert (=> b!1284152 (= condMapEmpty!52301 (= (arr!40874 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16016)) mapDefault!52301)))))

(declare-fun b!1284145 () Bool)

(declare-fun res!852618 () Bool)

(assert (=> b!1284145 (=> (not res!852618) (not e!733825))))

(assert (=> b!1284145 (= res!852618 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!852624 () Bool)

(assert (=> start!108900 (=> (not res!852624) (not e!733825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108900 (= res!852624 (validMask!0 mask!2175))))

(assert (=> start!108900 e!733825))

(declare-fun tp_is_empty!33829 () Bool)

(assert (=> start!108900 tp_is_empty!33829))

(assert (=> start!108900 true))

(declare-fun array_inv!31217 (array!84753) Bool)

(assert (=> start!108900 (and (array_inv!31217 _values!1445) e!733824)))

(declare-fun array_inv!31218 (array!84755) Bool)

(assert (=> start!108900 (array_inv!31218 _keys!1741)))

(assert (=> start!108900 tp!99682))

(declare-fun b!1284153 () Bool)

(declare-fun e!733823 () Bool)

(assert (=> b!1284153 (= e!733823 tp_is_empty!33829)))

(declare-fun b!1284154 () Bool)

(declare-fun res!852623 () Bool)

(assert (=> b!1284154 (=> (not res!852623) (not e!733825))))

(declare-datatypes ((List!28983 0))(
  ( (Nil!28980) (Cons!28979 (h!30197 (_ BitVec 64)) (t!42519 List!28983)) )
))
(declare-fun arrayNoDuplicates!0 (array!84755 (_ BitVec 32) List!28983) Bool)

(assert (=> b!1284154 (= res!852623 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28980))))

(declare-fun b!1284155 () Bool)

(declare-fun res!852622 () Bool)

(assert (=> b!1284155 (=> (not res!852622) (not e!733825))))

(assert (=> b!1284155 (= res!852622 (and (= (size!41425 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41426 _keys!1741) (size!41425 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284156 () Bool)

(assert (=> b!1284156 (= e!733826 tp_is_empty!33829)))

(declare-fun mapNonEmpty!52301 () Bool)

(declare-fun tp!99683 () Bool)

(assert (=> mapNonEmpty!52301 (= mapRes!52301 (and tp!99683 e!733823))))

(declare-fun mapKey!52301 () (_ BitVec 32))

(declare-fun mapRest!52301 () (Array (_ BitVec 32) ValueCell!16016))

(declare-fun mapValue!52301 () ValueCell!16016)

(assert (=> mapNonEmpty!52301 (= (arr!40874 _values!1445) (store mapRest!52301 mapKey!52301 mapValue!52301))))

(assert (= (and start!108900 res!852624) b!1284155))

(assert (= (and b!1284155 res!852622) b!1284150))

(assert (= (and b!1284150 res!852619) b!1284154))

(assert (= (and b!1284154 res!852623) b!1284149))

(assert (= (and b!1284149 res!852621) b!1284147))

(assert (= (and b!1284147 res!852625) b!1284148))

(assert (= (and b!1284148 res!852620) b!1284151))

(assert (= (and b!1284151 res!852617) b!1284145))

(assert (= (and b!1284145 res!852618) b!1284146))

(assert (= (and b!1284152 condMapEmpty!52301) mapIsEmpty!52301))

(assert (= (and b!1284152 (not condMapEmpty!52301)) mapNonEmpty!52301))

(get-info :version)

(assert (= (and mapNonEmpty!52301 ((_ is ValueCellFull!16016) mapValue!52301)) b!1284153))

(assert (= (and b!1284152 ((_ is ValueCellFull!16016) mapDefault!52301)) b!1284156))

(assert (= start!108900 b!1284152))

(declare-fun m!1178509 () Bool)

(assert (=> b!1284150 m!1178509))

(declare-fun m!1178511 () Bool)

(assert (=> b!1284154 m!1178511))

(declare-fun m!1178513 () Bool)

(assert (=> start!108900 m!1178513))

(declare-fun m!1178515 () Bool)

(assert (=> start!108900 m!1178515))

(declare-fun m!1178517 () Bool)

(assert (=> start!108900 m!1178517))

(declare-fun m!1178519 () Bool)

(assert (=> b!1284147 m!1178519))

(assert (=> b!1284147 m!1178519))

(declare-fun m!1178521 () Bool)

(assert (=> b!1284147 m!1178521))

(declare-fun m!1178523 () Bool)

(assert (=> mapNonEmpty!52301 m!1178523))

(declare-fun m!1178525 () Bool)

(assert (=> b!1284151 m!1178525))

(assert (=> b!1284151 m!1178525))

(declare-fun m!1178527 () Bool)

(assert (=> b!1284151 m!1178527))

(declare-fun m!1178529 () Bool)

(assert (=> b!1284146 m!1178529))

(assert (=> b!1284146 m!1178529))

(declare-fun m!1178531 () Bool)

(assert (=> b!1284146 m!1178531))

(assert (=> b!1284146 m!1178531))

(declare-fun m!1178533 () Bool)

(assert (=> b!1284146 m!1178533))

(assert (=> b!1284146 m!1178533))

(declare-fun m!1178535 () Bool)

(assert (=> b!1284146 m!1178535))

(check-sat tp_is_empty!33829 (not b!1284150) (not mapNonEmpty!52301) (not start!108900) (not b_next!28189) (not b!1284147) b_and!46257 (not b!1284151) (not b!1284154) (not b!1284146))
(check-sat b_and!46257 (not b_next!28189))
