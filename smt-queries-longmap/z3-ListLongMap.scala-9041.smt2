; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109030 () Bool)

(assert start!109030)

(declare-fun b_free!28519 () Bool)

(declare-fun b_next!28519 () Bool)

(assert (=> start!109030 (= b_free!28519 (not b_next!28519))))

(declare-fun tp!100676 () Bool)

(declare-fun b_and!46591 () Bool)

(assert (=> start!109030 (= tp!100676 b_and!46591)))

(declare-fun b!1288561 () Bool)

(declare-fun e!735778 () Bool)

(declare-fun e!735780 () Bool)

(declare-fun mapRes!52799 () Bool)

(assert (=> b!1288561 (= e!735778 (and e!735780 mapRes!52799))))

(declare-fun condMapEmpty!52799 () Bool)

(declare-datatypes ((V!50649 0))(
  ( (V!50650 (val!17154 Int)) )
))
(declare-datatypes ((ValueCell!16181 0))(
  ( (ValueCellFull!16181 (v!19756 V!50649)) (EmptyCell!16181) )
))
(declare-datatypes ((array!85251 0))(
  ( (array!85252 (arr!41127 (Array (_ BitVec 32) ValueCell!16181)) (size!41679 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85251)

(declare-fun mapDefault!52799 () ValueCell!16181)

(assert (=> b!1288561 (= condMapEmpty!52799 (= (arr!41127 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16181)) mapDefault!52799)))))

(declare-fun mapIsEmpty!52799 () Bool)

(assert (=> mapIsEmpty!52799 mapRes!52799))

(declare-fun b!1288562 () Bool)

(declare-fun res!855886 () Bool)

(declare-fun e!735783 () Bool)

(assert (=> b!1288562 (=> (not res!855886) (not e!735783))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85253 0))(
  ( (array!85254 (arr!41128 (Array (_ BitVec 32) (_ BitVec 64))) (size!41680 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85253)

(assert (=> b!1288562 (= res!855886 (and (= (size!41679 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41680 _keys!1741) (size!41679 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288563 () Bool)

(declare-fun e!735782 () Bool)

(declare-fun tp_is_empty!34159 () Bool)

(assert (=> b!1288563 (= e!735782 tp_is_empty!34159)))

(declare-fun b!1288565 () Bool)

(declare-fun res!855887 () Bool)

(assert (=> b!1288565 (=> (not res!855887) (not e!735783))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1288565 (= res!855887 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41680 _keys!1741))))))

(declare-fun b!1288566 () Bool)

(declare-fun res!855881 () Bool)

(assert (=> b!1288566 (=> (not res!855881) (not e!735783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85253 (_ BitVec 32)) Bool)

(assert (=> b!1288566 (= res!855881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288567 () Bool)

(declare-fun res!855884 () Bool)

(assert (=> b!1288567 (=> (not res!855884) (not e!735783))))

(declare-datatypes ((List!29243 0))(
  ( (Nil!29240) (Cons!29239 (h!30448 (_ BitVec 64)) (t!42799 List!29243)) )
))
(declare-fun arrayNoDuplicates!0 (array!85253 (_ BitVec 32) List!29243) Bool)

(assert (=> b!1288567 (= res!855884 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29240))))

(declare-fun b!1288568 () Bool)

(declare-fun e!735779 () Bool)

(assert (=> b!1288568 (= e!735779 true)))

(declare-datatypes ((tuple2!22076 0))(
  ( (tuple2!22077 (_1!11049 (_ BitVec 64)) (_2!11049 V!50649)) )
))
(declare-datatypes ((List!29244 0))(
  ( (Nil!29241) (Cons!29240 (h!30449 tuple2!22076) (t!42800 List!29244)) )
))
(declare-datatypes ((ListLongMap!19733 0))(
  ( (ListLongMap!19734 (toList!9882 List!29244)) )
))
(declare-fun lt!577859 () ListLongMap!19733)

(declare-fun zeroValue!1387 () V!50649)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7930 (ListLongMap!19733 (_ BitVec 64)) Bool)

(declare-fun +!4371 (ListLongMap!19733 tuple2!22076) ListLongMap!19733)

(assert (=> b!1288568 (not (contains!7930 (+!4371 lt!577859 (tuple2!22077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42468 0))(
  ( (Unit!42469) )
))
(declare-fun lt!577861 () Unit!42468)

(declare-fun addStillNotContains!348 (ListLongMap!19733 (_ BitVec 64) V!50649 (_ BitVec 64)) Unit!42468)

(assert (=> b!1288568 (= lt!577861 (addStillNotContains!348 lt!577859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50649)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6002 (array!85253 array!85251 (_ BitVec 32) (_ BitVec 32) V!50649 V!50649 (_ BitVec 32) Int) ListLongMap!19733)

(assert (=> b!1288568 (= lt!577859 (getCurrentListMapNoExtraKeys!6002 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288569 () Bool)

(declare-fun res!855882 () Bool)

(assert (=> b!1288569 (=> (not res!855882) (not e!735783))))

(assert (=> b!1288569 (= res!855882 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41680 _keys!1741))))))

(declare-fun res!855880 () Bool)

(assert (=> start!109030 (=> (not res!855880) (not e!735783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109030 (= res!855880 (validMask!0 mask!2175))))

(assert (=> start!109030 e!735783))

(assert (=> start!109030 tp_is_empty!34159))

(assert (=> start!109030 true))

(declare-fun array_inv!31341 (array!85251) Bool)

(assert (=> start!109030 (and (array_inv!31341 _values!1445) e!735778)))

(declare-fun array_inv!31342 (array!85253) Bool)

(assert (=> start!109030 (array_inv!31342 _keys!1741)))

(assert (=> start!109030 tp!100676))

(declare-fun b!1288564 () Bool)

(declare-fun res!855883 () Bool)

(assert (=> b!1288564 (=> (not res!855883) (not e!735783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288564 (= res!855883 (not (validKeyInArray!0 (select (arr!41128 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52799 () Bool)

(declare-fun tp!100677 () Bool)

(assert (=> mapNonEmpty!52799 (= mapRes!52799 (and tp!100677 e!735782))))

(declare-fun mapValue!52799 () ValueCell!16181)

(declare-fun mapRest!52799 () (Array (_ BitVec 32) ValueCell!16181))

(declare-fun mapKey!52799 () (_ BitVec 32))

(assert (=> mapNonEmpty!52799 (= (arr!41127 _values!1445) (store mapRest!52799 mapKey!52799 mapValue!52799))))

(declare-fun b!1288570 () Bool)

(assert (=> b!1288570 (= e!735783 (not e!735779))))

(declare-fun res!855885 () Bool)

(assert (=> b!1288570 (=> res!855885 e!735779)))

(assert (=> b!1288570 (= res!855885 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288570 (not (contains!7930 (ListLongMap!19734 Nil!29241) k0!1205))))

(declare-fun lt!577860 () Unit!42468)

(declare-fun emptyContainsNothing!39 ((_ BitVec 64)) Unit!42468)

(assert (=> b!1288570 (= lt!577860 (emptyContainsNothing!39 k0!1205))))

(declare-fun b!1288571 () Bool)

(declare-fun res!855888 () Bool)

(assert (=> b!1288571 (=> (not res!855888) (not e!735783))))

(declare-fun getCurrentListMap!4837 (array!85253 array!85251 (_ BitVec 32) (_ BitVec 32) V!50649 V!50649 (_ BitVec 32) Int) ListLongMap!19733)

(assert (=> b!1288571 (= res!855888 (contains!7930 (getCurrentListMap!4837 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288572 () Bool)

(assert (=> b!1288572 (= e!735780 tp_is_empty!34159)))

(assert (= (and start!109030 res!855880) b!1288562))

(assert (= (and b!1288562 res!855886) b!1288566))

(assert (= (and b!1288566 res!855881) b!1288567))

(assert (= (and b!1288567 res!855884) b!1288565))

(assert (= (and b!1288565 res!855887) b!1288571))

(assert (= (and b!1288571 res!855888) b!1288569))

(assert (= (and b!1288569 res!855882) b!1288564))

(assert (= (and b!1288564 res!855883) b!1288570))

(assert (= (and b!1288570 (not res!855885)) b!1288568))

(assert (= (and b!1288561 condMapEmpty!52799) mapIsEmpty!52799))

(assert (= (and b!1288561 (not condMapEmpty!52799)) mapNonEmpty!52799))

(get-info :version)

(assert (= (and mapNonEmpty!52799 ((_ is ValueCellFull!16181) mapValue!52799)) b!1288563))

(assert (= (and b!1288561 ((_ is ValueCellFull!16181) mapDefault!52799)) b!1288572))

(assert (= start!109030 b!1288561))

(declare-fun m!1180719 () Bool)

(assert (=> b!1288564 m!1180719))

(assert (=> b!1288564 m!1180719))

(declare-fun m!1180721 () Bool)

(assert (=> b!1288564 m!1180721))

(declare-fun m!1180723 () Bool)

(assert (=> b!1288566 m!1180723))

(declare-fun m!1180725 () Bool)

(assert (=> b!1288571 m!1180725))

(assert (=> b!1288571 m!1180725))

(declare-fun m!1180727 () Bool)

(assert (=> b!1288571 m!1180727))

(declare-fun m!1180729 () Bool)

(assert (=> b!1288570 m!1180729))

(declare-fun m!1180731 () Bool)

(assert (=> b!1288570 m!1180731))

(declare-fun m!1180733 () Bool)

(assert (=> mapNonEmpty!52799 m!1180733))

(declare-fun m!1180735 () Bool)

(assert (=> b!1288568 m!1180735))

(assert (=> b!1288568 m!1180735))

(declare-fun m!1180737 () Bool)

(assert (=> b!1288568 m!1180737))

(declare-fun m!1180739 () Bool)

(assert (=> b!1288568 m!1180739))

(declare-fun m!1180741 () Bool)

(assert (=> b!1288568 m!1180741))

(declare-fun m!1180743 () Bool)

(assert (=> b!1288567 m!1180743))

(declare-fun m!1180745 () Bool)

(assert (=> start!109030 m!1180745))

(declare-fun m!1180747 () Bool)

(assert (=> start!109030 m!1180747))

(declare-fun m!1180749 () Bool)

(assert (=> start!109030 m!1180749))

(check-sat (not mapNonEmpty!52799) (not b!1288567) (not b_next!28519) (not b!1288568) (not b!1288566) (not start!109030) tp_is_empty!34159 (not b!1288570) (not b!1288564) (not b!1288571) b_and!46591)
(check-sat b_and!46591 (not b_next!28519))
