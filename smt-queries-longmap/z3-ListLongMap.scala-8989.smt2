; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108696 () Bool)

(assert start!108696)

(declare-fun b_free!28209 () Bool)

(declare-fun b_next!28209 () Bool)

(assert (=> start!108696 (= b_free!28209 (not b_next!28209))))

(declare-fun tp!99742 () Bool)

(declare-fun b_and!46275 () Bool)

(assert (=> start!108696 (= tp!99742 b_and!46275)))

(declare-fun b!1283200 () Bool)

(declare-fun res!852370 () Bool)

(declare-fun e!733127 () Bool)

(assert (=> b!1283200 (=> (not res!852370) (not e!733127))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84760 0))(
  ( (array!84761 (arr!40882 (Array (_ BitVec 32) (_ BitVec 64))) (size!41432 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84760)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1283200 (= res!852370 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41432 _keys!1741))))))

(declare-fun res!852372 () Bool)

(assert (=> start!108696 (=> (not res!852372) (not e!733127))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108696 (= res!852372 (validMask!0 mask!2175))))

(assert (=> start!108696 e!733127))

(declare-fun tp_is_empty!33849 () Bool)

(assert (=> start!108696 tp_is_empty!33849))

(assert (=> start!108696 true))

(declare-datatypes ((V!50235 0))(
  ( (V!50236 (val!16999 Int)) )
))
(declare-datatypes ((ValueCell!16026 0))(
  ( (ValueCellFull!16026 (v!19601 V!50235)) (EmptyCell!16026) )
))
(declare-datatypes ((array!84762 0))(
  ( (array!84763 (arr!40883 (Array (_ BitVec 32) ValueCell!16026)) (size!41433 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84762)

(declare-fun e!733126 () Bool)

(declare-fun array_inv!31013 (array!84762) Bool)

(assert (=> start!108696 (and (array_inv!31013 _values!1445) e!733126)))

(declare-fun array_inv!31014 (array!84760) Bool)

(assert (=> start!108696 (array_inv!31014 _keys!1741)))

(assert (=> start!108696 tp!99742))

(declare-fun mapNonEmpty!52331 () Bool)

(declare-fun mapRes!52331 () Bool)

(declare-fun tp!99743 () Bool)

(declare-fun e!733130 () Bool)

(assert (=> mapNonEmpty!52331 (= mapRes!52331 (and tp!99743 e!733130))))

(declare-fun mapKey!52331 () (_ BitVec 32))

(declare-fun mapValue!52331 () ValueCell!16026)

(declare-fun mapRest!52331 () (Array (_ BitVec 32) ValueCell!16026))

(assert (=> mapNonEmpty!52331 (= (arr!40883 _values!1445) (store mapRest!52331 mapKey!52331 mapValue!52331))))

(declare-fun b!1283201 () Bool)

(assert (=> b!1283201 (= e!733130 tp_is_empty!33849)))

(declare-fun b!1283202 () Bool)

(declare-fun res!852367 () Bool)

(assert (=> b!1283202 (=> (not res!852367) (not e!733127))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283202 (= res!852367 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283203 () Bool)

(declare-fun e!733129 () Bool)

(assert (=> b!1283203 (= e!733129 tp_is_empty!33849)))

(declare-fun b!1283204 () Bool)

(declare-fun res!852374 () Bool)

(assert (=> b!1283204 (=> (not res!852374) (not e!733127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283204 (= res!852374 (validKeyInArray!0 (select (arr!40882 _keys!1741) from!2144)))))

(declare-fun b!1283205 () Bool)

(declare-fun res!852369 () Bool)

(assert (=> b!1283205 (=> (not res!852369) (not e!733127))))

(assert (=> b!1283205 (= res!852369 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41432 _keys!1741))))))

(declare-fun mapIsEmpty!52331 () Bool)

(assert (=> mapIsEmpty!52331 mapRes!52331))

(declare-fun b!1283206 () Bool)

(assert (=> b!1283206 (= e!733127 (not true))))

(declare-datatypes ((tuple2!21768 0))(
  ( (tuple2!21769 (_1!10895 (_ BitVec 64)) (_2!10895 V!50235)) )
))
(declare-datatypes ((List!28965 0))(
  ( (Nil!28962) (Cons!28961 (h!30170 tuple2!21768) (t!42509 List!28965)) )
))
(declare-datatypes ((ListLongMap!19425 0))(
  ( (ListLongMap!19426 (toList!9728 List!28965)) )
))
(declare-fun lt!576615 () ListLongMap!19425)

(declare-fun contains!7845 (ListLongMap!19425 (_ BitVec 64)) Bool)

(assert (=> b!1283206 (contains!7845 lt!576615 k0!1205)))

(declare-fun minValue!1387 () V!50235)

(declare-datatypes ((Unit!42467 0))(
  ( (Unit!42468) )
))
(declare-fun lt!576616 () Unit!42467)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!4 ((_ BitVec 64) (_ BitVec 64) V!50235 ListLongMap!19425) Unit!42467)

(assert (=> b!1283206 (= lt!576616 (lemmaInListMapAfterAddingDiffThenInBefore!4 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576615))))

(declare-fun zeroValue!1387 () V!50235)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4280 (ListLongMap!19425 tuple2!21768) ListLongMap!19425)

(declare-fun getCurrentListMapNoExtraKeys!5910 (array!84760 array!84762 (_ BitVec 32) (_ BitVec 32) V!50235 V!50235 (_ BitVec 32) Int) ListLongMap!19425)

(assert (=> b!1283206 (= lt!576615 (+!4280 (getCurrentListMapNoExtraKeys!5910 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283207 () Bool)

(declare-fun res!852375 () Bool)

(assert (=> b!1283207 (=> (not res!852375) (not e!733127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84760 (_ BitVec 32)) Bool)

(assert (=> b!1283207 (= res!852375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283208 () Bool)

(declare-fun res!852371 () Bool)

(assert (=> b!1283208 (=> (not res!852371) (not e!733127))))

(declare-datatypes ((List!28966 0))(
  ( (Nil!28963) (Cons!28962 (h!30171 (_ BitVec 64)) (t!42510 List!28966)) )
))
(declare-fun arrayNoDuplicates!0 (array!84760 (_ BitVec 32) List!28966) Bool)

(assert (=> b!1283208 (= res!852371 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28963))))

(declare-fun b!1283209 () Bool)

(declare-fun res!852373 () Bool)

(assert (=> b!1283209 (=> (not res!852373) (not e!733127))))

(assert (=> b!1283209 (= res!852373 (and (= (size!41433 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41432 _keys!1741) (size!41433 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283210 () Bool)

(assert (=> b!1283210 (= e!733126 (and e!733129 mapRes!52331))))

(declare-fun condMapEmpty!52331 () Bool)

(declare-fun mapDefault!52331 () ValueCell!16026)

(assert (=> b!1283210 (= condMapEmpty!52331 (= (arr!40883 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16026)) mapDefault!52331)))))

(declare-fun b!1283211 () Bool)

(declare-fun res!852368 () Bool)

(assert (=> b!1283211 (=> (not res!852368) (not e!733127))))

(declare-fun getCurrentListMap!4812 (array!84760 array!84762 (_ BitVec 32) (_ BitVec 32) V!50235 V!50235 (_ BitVec 32) Int) ListLongMap!19425)

(assert (=> b!1283211 (= res!852368 (contains!7845 (getCurrentListMap!4812 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108696 res!852372) b!1283209))

(assert (= (and b!1283209 res!852373) b!1283207))

(assert (= (and b!1283207 res!852375) b!1283208))

(assert (= (and b!1283208 res!852371) b!1283205))

(assert (= (and b!1283205 res!852369) b!1283211))

(assert (= (and b!1283211 res!852368) b!1283200))

(assert (= (and b!1283200 res!852370) b!1283204))

(assert (= (and b!1283204 res!852374) b!1283202))

(assert (= (and b!1283202 res!852367) b!1283206))

(assert (= (and b!1283210 condMapEmpty!52331) mapIsEmpty!52331))

(assert (= (and b!1283210 (not condMapEmpty!52331)) mapNonEmpty!52331))

(get-info :version)

(assert (= (and mapNonEmpty!52331 ((_ is ValueCellFull!16026) mapValue!52331)) b!1283201))

(assert (= (and b!1283210 ((_ is ValueCellFull!16026) mapDefault!52331)) b!1283203))

(assert (= start!108696 b!1283210))

(declare-fun m!1177177 () Bool)

(assert (=> b!1283208 m!1177177))

(declare-fun m!1177179 () Bool)

(assert (=> mapNonEmpty!52331 m!1177179))

(declare-fun m!1177181 () Bool)

(assert (=> start!108696 m!1177181))

(declare-fun m!1177183 () Bool)

(assert (=> start!108696 m!1177183))

(declare-fun m!1177185 () Bool)

(assert (=> start!108696 m!1177185))

(declare-fun m!1177187 () Bool)

(assert (=> b!1283206 m!1177187))

(declare-fun m!1177189 () Bool)

(assert (=> b!1283206 m!1177189))

(declare-fun m!1177191 () Bool)

(assert (=> b!1283206 m!1177191))

(assert (=> b!1283206 m!1177191))

(declare-fun m!1177193 () Bool)

(assert (=> b!1283206 m!1177193))

(declare-fun m!1177195 () Bool)

(assert (=> b!1283207 m!1177195))

(declare-fun m!1177197 () Bool)

(assert (=> b!1283204 m!1177197))

(assert (=> b!1283204 m!1177197))

(declare-fun m!1177199 () Bool)

(assert (=> b!1283204 m!1177199))

(declare-fun m!1177201 () Bool)

(assert (=> b!1283211 m!1177201))

(assert (=> b!1283211 m!1177201))

(declare-fun m!1177203 () Bool)

(assert (=> b!1283211 m!1177203))

(check-sat (not b!1283208) (not b!1283207) (not start!108696) (not mapNonEmpty!52331) (not b!1283206) (not b_next!28209) (not b!1283211) (not b!1283204) b_and!46275 tp_is_empty!33849)
(check-sat b_and!46275 (not b_next!28209))
