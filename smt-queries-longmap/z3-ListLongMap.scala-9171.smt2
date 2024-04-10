; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110254 () Bool)

(assert start!110254)

(declare-fun b_free!29301 () Bool)

(declare-fun b_next!29301 () Bool)

(assert (=> start!110254 (= b_free!29301 (not b_next!29301))))

(declare-fun tp!103068 () Bool)

(declare-fun b_and!47497 () Bool)

(assert (=> start!110254 (= tp!103068 b_and!47497)))

(declare-fun b!1305102 () Bool)

(declare-fun e!744451 () Bool)

(assert (=> b!1305102 (= e!744451 true)))

(declare-datatypes ((V!51691 0))(
  ( (V!51692 (val!17545 Int)) )
))
(declare-datatypes ((tuple2!22648 0))(
  ( (tuple2!22649 (_1!11335 (_ BitVec 64)) (_2!11335 V!51691)) )
))
(declare-datatypes ((List!29768 0))(
  ( (Nil!29765) (Cons!29764 (h!30973 tuple2!22648) (t!43370 List!29768)) )
))
(declare-datatypes ((ListLongMap!20305 0))(
  ( (ListLongMap!20306 (toList!10168 List!29768)) )
))
(declare-fun lt!584196 () ListLongMap!20305)

(declare-fun minValue!1387 () V!51691)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8312 (ListLongMap!20305 (_ BitVec 64)) Bool)

(declare-fun +!4489 (ListLongMap!20305 tuple2!22648) ListLongMap!20305)

(assert (=> b!1305102 (not (contains!8312 (+!4489 lt!584196 (tuple2!22649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!43220 0))(
  ( (Unit!43221) )
))
(declare-fun lt!584195 () Unit!43220)

(declare-fun addStillNotContains!486 (ListLongMap!20305 (_ BitVec 64) V!51691 (_ BitVec 64)) Unit!43220)

(assert (=> b!1305102 (= lt!584195 (addStillNotContains!486 lt!584196 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51691)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16572 0))(
  ( (ValueCellFull!16572 (v!20167 V!51691)) (EmptyCell!16572) )
))
(declare-datatypes ((array!86898 0))(
  ( (array!86899 (arr!41936 (Array (_ BitVec 32) ValueCell!16572)) (size!42486 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86898)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86900 0))(
  ( (array!86901 (arr!41937 (Array (_ BitVec 32) (_ BitVec 64))) (size!42487 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86900)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6125 (array!86900 array!86898 (_ BitVec 32) (_ BitVec 32) V!51691 V!51691 (_ BitVec 32) Int) ListLongMap!20305)

(assert (=> b!1305102 (= lt!584196 (getCurrentListMapNoExtraKeys!6125 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305103 () Bool)

(declare-fun res!866682 () Bool)

(declare-fun e!744452 () Bool)

(assert (=> b!1305103 (=> (not res!866682) (not e!744452))))

(assert (=> b!1305103 (= res!866682 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42487 _keys!1741))))))

(declare-fun b!1305104 () Bool)

(declare-fun res!866680 () Bool)

(assert (=> b!1305104 (=> (not res!866680) (not e!744452))))

(assert (=> b!1305104 (= res!866680 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42487 _keys!1741))))))

(declare-fun b!1305105 () Bool)

(declare-fun res!866679 () Bool)

(assert (=> b!1305105 (=> (not res!866679) (not e!744452))))

(declare-fun getCurrentListMap!5185 (array!86900 array!86898 (_ BitVec 32) (_ BitVec 32) V!51691 V!51691 (_ BitVec 32) Int) ListLongMap!20305)

(assert (=> b!1305105 (= res!866679 (contains!8312 (getCurrentListMap!5185 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305106 () Bool)

(declare-fun res!866677 () Bool)

(assert (=> b!1305106 (=> (not res!866677) (not e!744452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305106 (= res!866677 (not (validKeyInArray!0 (select (arr!41937 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!54018 () Bool)

(declare-fun mapRes!54018 () Bool)

(assert (=> mapIsEmpty!54018 mapRes!54018))

(declare-fun b!1305107 () Bool)

(declare-fun res!866683 () Bool)

(assert (=> b!1305107 (=> (not res!866683) (not e!744452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86900 (_ BitVec 32)) Bool)

(assert (=> b!1305107 (= res!866683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1305109 () Bool)

(assert (=> b!1305109 (= e!744452 (not e!744451))))

(declare-fun res!866684 () Bool)

(assert (=> b!1305109 (=> res!866684 e!744451)))

(assert (=> b!1305109 (= res!866684 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1305109 (not (contains!8312 (ListLongMap!20306 Nil!29765) k0!1205))))

(declare-fun lt!584194 () Unit!43220)

(declare-fun emptyContainsNothing!231 ((_ BitVec 64)) Unit!43220)

(assert (=> b!1305109 (= lt!584194 (emptyContainsNothing!231 k0!1205))))

(declare-fun b!1305110 () Bool)

(declare-fun e!744448 () Bool)

(declare-fun e!744450 () Bool)

(assert (=> b!1305110 (= e!744448 (and e!744450 mapRes!54018))))

(declare-fun condMapEmpty!54018 () Bool)

(declare-fun mapDefault!54018 () ValueCell!16572)

(assert (=> b!1305110 (= condMapEmpty!54018 (= (arr!41936 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16572)) mapDefault!54018)))))

(declare-fun mapNonEmpty!54018 () Bool)

(declare-fun tp!103067 () Bool)

(declare-fun e!744447 () Bool)

(assert (=> mapNonEmpty!54018 (= mapRes!54018 (and tp!103067 e!744447))))

(declare-fun mapValue!54018 () ValueCell!16572)

(declare-fun mapRest!54018 () (Array (_ BitVec 32) ValueCell!16572))

(declare-fun mapKey!54018 () (_ BitVec 32))

(assert (=> mapNonEmpty!54018 (= (arr!41936 _values!1445) (store mapRest!54018 mapKey!54018 mapValue!54018))))

(declare-fun b!1305111 () Bool)

(declare-fun tp_is_empty!34941 () Bool)

(assert (=> b!1305111 (= e!744447 tp_is_empty!34941)))

(declare-fun b!1305112 () Bool)

(assert (=> b!1305112 (= e!744450 tp_is_empty!34941)))

(declare-fun b!1305113 () Bool)

(declare-fun res!866676 () Bool)

(assert (=> b!1305113 (=> (not res!866676) (not e!744452))))

(declare-datatypes ((List!29769 0))(
  ( (Nil!29766) (Cons!29765 (h!30974 (_ BitVec 64)) (t!43371 List!29769)) )
))
(declare-fun arrayNoDuplicates!0 (array!86900 (_ BitVec 32) List!29769) Bool)

(assert (=> b!1305113 (= res!866676 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29766))))

(declare-fun b!1305108 () Bool)

(declare-fun res!866681 () Bool)

(assert (=> b!1305108 (=> (not res!866681) (not e!744452))))

(assert (=> b!1305108 (= res!866681 (and (= (size!42486 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42487 _keys!1741) (size!42486 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!866678 () Bool)

(assert (=> start!110254 (=> (not res!866678) (not e!744452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110254 (= res!866678 (validMask!0 mask!2175))))

(assert (=> start!110254 e!744452))

(assert (=> start!110254 tp_is_empty!34941))

(assert (=> start!110254 true))

(declare-fun array_inv!31709 (array!86898) Bool)

(assert (=> start!110254 (and (array_inv!31709 _values!1445) e!744448)))

(declare-fun array_inv!31710 (array!86900) Bool)

(assert (=> start!110254 (array_inv!31710 _keys!1741)))

(assert (=> start!110254 tp!103068))

(assert (= (and start!110254 res!866678) b!1305108))

(assert (= (and b!1305108 res!866681) b!1305107))

(assert (= (and b!1305107 res!866683) b!1305113))

(assert (= (and b!1305113 res!866676) b!1305104))

(assert (= (and b!1305104 res!866680) b!1305105))

(assert (= (and b!1305105 res!866679) b!1305103))

(assert (= (and b!1305103 res!866682) b!1305106))

(assert (= (and b!1305106 res!866677) b!1305109))

(assert (= (and b!1305109 (not res!866684)) b!1305102))

(assert (= (and b!1305110 condMapEmpty!54018) mapIsEmpty!54018))

(assert (= (and b!1305110 (not condMapEmpty!54018)) mapNonEmpty!54018))

(get-info :version)

(assert (= (and mapNonEmpty!54018 ((_ is ValueCellFull!16572) mapValue!54018)) b!1305111))

(assert (= (and b!1305110 ((_ is ValueCellFull!16572) mapDefault!54018)) b!1305112))

(assert (= start!110254 b!1305110))

(declare-fun m!1196131 () Bool)

(assert (=> b!1305105 m!1196131))

(assert (=> b!1305105 m!1196131))

(declare-fun m!1196133 () Bool)

(assert (=> b!1305105 m!1196133))

(declare-fun m!1196135 () Bool)

(assert (=> b!1305102 m!1196135))

(assert (=> b!1305102 m!1196135))

(declare-fun m!1196137 () Bool)

(assert (=> b!1305102 m!1196137))

(declare-fun m!1196139 () Bool)

(assert (=> b!1305102 m!1196139))

(declare-fun m!1196141 () Bool)

(assert (=> b!1305102 m!1196141))

(declare-fun m!1196143 () Bool)

(assert (=> start!110254 m!1196143))

(declare-fun m!1196145 () Bool)

(assert (=> start!110254 m!1196145))

(declare-fun m!1196147 () Bool)

(assert (=> start!110254 m!1196147))

(declare-fun m!1196149 () Bool)

(assert (=> b!1305113 m!1196149))

(declare-fun m!1196151 () Bool)

(assert (=> mapNonEmpty!54018 m!1196151))

(declare-fun m!1196153 () Bool)

(assert (=> b!1305107 m!1196153))

(declare-fun m!1196155 () Bool)

(assert (=> b!1305106 m!1196155))

(assert (=> b!1305106 m!1196155))

(declare-fun m!1196157 () Bool)

(assert (=> b!1305106 m!1196157))

(declare-fun m!1196159 () Bool)

(assert (=> b!1305109 m!1196159))

(declare-fun m!1196161 () Bool)

(assert (=> b!1305109 m!1196161))

(check-sat (not mapNonEmpty!54018) (not b!1305107) tp_is_empty!34941 (not b!1305109) (not b!1305106) (not b!1305105) b_and!47497 (not b!1305113) (not start!110254) (not b_next!29301) (not b!1305102))
(check-sat b_and!47497 (not b_next!29301))
