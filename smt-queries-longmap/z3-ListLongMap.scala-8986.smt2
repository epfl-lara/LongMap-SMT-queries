; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108676 () Bool)

(assert start!108676)

(declare-fun b_free!28189 () Bool)

(declare-fun b_next!28189 () Bool)

(assert (=> start!108676 (= b_free!28189 (not b_next!28189))))

(declare-fun tp!99683 () Bool)

(declare-fun b_and!46237 () Bool)

(assert (=> start!108676 (= tp!99683 b_and!46237)))

(declare-fun b!1282776 () Bool)

(declare-fun res!852077 () Bool)

(declare-fun e!732948 () Bool)

(assert (=> b!1282776 (=> (not res!852077) (not e!732948))))

(declare-datatypes ((array!84621 0))(
  ( (array!84622 (arr!40813 (Array (_ BitVec 32) (_ BitVec 64))) (size!41365 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84621)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84621 (_ BitVec 32)) Bool)

(assert (=> b!1282776 (= res!852077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282777 () Bool)

(assert (=> b!1282777 (= e!732948 false)))

(declare-datatypes ((V!50209 0))(
  ( (V!50210 (val!16989 Int)) )
))
(declare-fun minValue!1387 () V!50209)

(declare-fun zeroValue!1387 () V!50209)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16016 0))(
  ( (ValueCellFull!16016 (v!19590 V!50209)) (EmptyCell!16016) )
))
(declare-datatypes ((array!84623 0))(
  ( (array!84624 (arr!40814 (Array (_ BitVec 32) ValueCell!16016)) (size!41366 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84623)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!576393 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21820 0))(
  ( (tuple2!21821 (_1!10921 (_ BitVec 64)) (_2!10921 V!50209)) )
))
(declare-datatypes ((List!29008 0))(
  ( (Nil!29005) (Cons!29004 (h!30213 tuple2!21820) (t!42544 List!29008)) )
))
(declare-datatypes ((ListLongMap!19477 0))(
  ( (ListLongMap!19478 (toList!9754 List!29008)) )
))
(declare-fun contains!7801 (ListLongMap!19477 (_ BitVec 64)) Bool)

(declare-fun +!4312 (ListLongMap!19477 tuple2!21820) ListLongMap!19477)

(declare-fun getCurrentListMapNoExtraKeys!5943 (array!84621 array!84623 (_ BitVec 32) (_ BitVec 32) V!50209 V!50209 (_ BitVec 32) Int) ListLongMap!19477)

(assert (=> b!1282777 (= lt!576393 (contains!7801 (+!4312 (+!4312 (getCurrentListMapNoExtraKeys!5943 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun res!852073 () Bool)

(assert (=> start!108676 (=> (not res!852073) (not e!732948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108676 (= res!852073 (validMask!0 mask!2175))))

(assert (=> start!108676 e!732948))

(declare-fun tp_is_empty!33829 () Bool)

(assert (=> start!108676 tp_is_empty!33829))

(assert (=> start!108676 true))

(declare-fun e!732951 () Bool)

(declare-fun array_inv!31117 (array!84623) Bool)

(assert (=> start!108676 (and (array_inv!31117 _values!1445) e!732951)))

(declare-fun array_inv!31118 (array!84621) Bool)

(assert (=> start!108676 (array_inv!31118 _keys!1741)))

(assert (=> start!108676 tp!99683))

(declare-fun mapIsEmpty!52301 () Bool)

(declare-fun mapRes!52301 () Bool)

(assert (=> mapIsEmpty!52301 mapRes!52301))

(declare-fun b!1282778 () Bool)

(declare-fun res!852076 () Bool)

(assert (=> b!1282778 (=> (not res!852076) (not e!732948))))

(assert (=> b!1282778 (= res!852076 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1282779 () Bool)

(declare-fun e!732947 () Bool)

(assert (=> b!1282779 (= e!732947 tp_is_empty!33829)))

(declare-fun b!1282780 () Bool)

(assert (=> b!1282780 (= e!732951 (and e!732947 mapRes!52301))))

(declare-fun condMapEmpty!52301 () Bool)

(declare-fun mapDefault!52301 () ValueCell!16016)

(assert (=> b!1282780 (= condMapEmpty!52301 (= (arr!40814 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16016)) mapDefault!52301)))))

(declare-fun b!1282781 () Bool)

(declare-fun res!852071 () Bool)

(assert (=> b!1282781 (=> (not res!852071) (not e!732948))))

(declare-datatypes ((List!29009 0))(
  ( (Nil!29006) (Cons!29005 (h!30214 (_ BitVec 64)) (t!42545 List!29009)) )
))
(declare-fun arrayNoDuplicates!0 (array!84621 (_ BitVec 32) List!29009) Bool)

(assert (=> b!1282781 (= res!852071 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29006))))

(declare-fun b!1282782 () Bool)

(declare-fun res!852078 () Bool)

(assert (=> b!1282782 (=> (not res!852078) (not e!732948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282782 (= res!852078 (validKeyInArray!0 (select (arr!40813 _keys!1741) from!2144)))))

(declare-fun b!1282783 () Bool)

(declare-fun res!852075 () Bool)

(assert (=> b!1282783 (=> (not res!852075) (not e!732948))))

(assert (=> b!1282783 (= res!852075 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41365 _keys!1741))))))

(declare-fun b!1282784 () Bool)

(declare-fun res!852072 () Bool)

(assert (=> b!1282784 (=> (not res!852072) (not e!732948))))

(declare-fun getCurrentListMap!4728 (array!84621 array!84623 (_ BitVec 32) (_ BitVec 32) V!50209 V!50209 (_ BitVec 32) Int) ListLongMap!19477)

(assert (=> b!1282784 (= res!852072 (contains!7801 (getCurrentListMap!4728 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282785 () Bool)

(declare-fun res!852074 () Bool)

(assert (=> b!1282785 (=> (not res!852074) (not e!732948))))

(assert (=> b!1282785 (= res!852074 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41365 _keys!1741))))))

(declare-fun b!1282786 () Bool)

(declare-fun e!732949 () Bool)

(assert (=> b!1282786 (= e!732949 tp_is_empty!33829)))

(declare-fun b!1282787 () Bool)

(declare-fun res!852070 () Bool)

(assert (=> b!1282787 (=> (not res!852070) (not e!732948))))

(assert (=> b!1282787 (= res!852070 (and (= (size!41366 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41365 _keys!1741) (size!41366 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52301 () Bool)

(declare-fun tp!99684 () Bool)

(assert (=> mapNonEmpty!52301 (= mapRes!52301 (and tp!99684 e!732949))))

(declare-fun mapValue!52301 () ValueCell!16016)

(declare-fun mapKey!52301 () (_ BitVec 32))

(declare-fun mapRest!52301 () (Array (_ BitVec 32) ValueCell!16016))

(assert (=> mapNonEmpty!52301 (= (arr!40814 _values!1445) (store mapRest!52301 mapKey!52301 mapValue!52301))))

(assert (= (and start!108676 res!852073) b!1282787))

(assert (= (and b!1282787 res!852070) b!1282776))

(assert (= (and b!1282776 res!852077) b!1282781))

(assert (= (and b!1282781 res!852071) b!1282783))

(assert (= (and b!1282783 res!852075) b!1282784))

(assert (= (and b!1282784 res!852072) b!1282785))

(assert (= (and b!1282785 res!852074) b!1282782))

(assert (= (and b!1282782 res!852078) b!1282778))

(assert (= (and b!1282778 res!852076) b!1282777))

(assert (= (and b!1282780 condMapEmpty!52301) mapIsEmpty!52301))

(assert (= (and b!1282780 (not condMapEmpty!52301)) mapNonEmpty!52301))

(get-info :version)

(assert (= (and mapNonEmpty!52301 ((_ is ValueCellFull!16016) mapValue!52301)) b!1282786))

(assert (= (and b!1282780 ((_ is ValueCellFull!16016) mapDefault!52301)) b!1282779))

(assert (= start!108676 b!1282780))

(declare-fun m!1176397 () Bool)

(assert (=> b!1282782 m!1176397))

(assert (=> b!1282782 m!1176397))

(declare-fun m!1176399 () Bool)

(assert (=> b!1282782 m!1176399))

(declare-fun m!1176401 () Bool)

(assert (=> b!1282781 m!1176401))

(declare-fun m!1176403 () Bool)

(assert (=> start!108676 m!1176403))

(declare-fun m!1176405 () Bool)

(assert (=> start!108676 m!1176405))

(declare-fun m!1176407 () Bool)

(assert (=> start!108676 m!1176407))

(declare-fun m!1176409 () Bool)

(assert (=> b!1282776 m!1176409))

(declare-fun m!1176411 () Bool)

(assert (=> b!1282777 m!1176411))

(assert (=> b!1282777 m!1176411))

(declare-fun m!1176413 () Bool)

(assert (=> b!1282777 m!1176413))

(assert (=> b!1282777 m!1176413))

(declare-fun m!1176415 () Bool)

(assert (=> b!1282777 m!1176415))

(assert (=> b!1282777 m!1176415))

(declare-fun m!1176417 () Bool)

(assert (=> b!1282777 m!1176417))

(declare-fun m!1176419 () Bool)

(assert (=> b!1282784 m!1176419))

(assert (=> b!1282784 m!1176419))

(declare-fun m!1176421 () Bool)

(assert (=> b!1282784 m!1176421))

(declare-fun m!1176423 () Bool)

(assert (=> mapNonEmpty!52301 m!1176423))

(check-sat (not mapNonEmpty!52301) (not b!1282784) tp_is_empty!33829 (not b_next!28189) b_and!46237 (not b!1282776) (not start!108676) (not b!1282777) (not b!1282782) (not b!1282781))
(check-sat b_and!46237 (not b_next!28189))
