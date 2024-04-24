; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110028 () Bool)

(assert start!110028)

(declare-fun b_free!29197 () Bool)

(declare-fun b_next!29197 () Bool)

(assert (=> start!110028 (= b_free!29197 (not b_next!29197))))

(declare-fun tp!102724 () Bool)

(declare-fun b_and!47313 () Bool)

(assert (=> start!110028 (= tp!102724 b_and!47313)))

(declare-fun mapIsEmpty!53831 () Bool)

(declare-fun mapRes!53831 () Bool)

(assert (=> mapIsEmpty!53831 mapRes!53831))

(declare-fun b!1302060 () Bool)

(declare-fun res!864864 () Bool)

(declare-fun e!742813 () Bool)

(assert (=> b!1302060 (=> (not res!864864) (not e!742813))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86725 0))(
  ( (array!86726 (arr!41854 (Array (_ BitVec 32) (_ BitVec 64))) (size!42405 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86725)

(assert (=> b!1302060 (= res!864864 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42405 _keys!1741))))))

(declare-fun bm!63789 () Bool)

(declare-datatypes ((V!51553 0))(
  ( (V!51554 (val!17493 Int)) )
))
(declare-datatypes ((tuple2!22580 0))(
  ( (tuple2!22581 (_1!11301 (_ BitVec 64)) (_2!11301 V!51553)) )
))
(declare-datatypes ((List!29735 0))(
  ( (Nil!29732) (Cons!29731 (h!30949 tuple2!22580) (t!43301 List!29735)) )
))
(declare-datatypes ((ListLongMap!20245 0))(
  ( (ListLongMap!20246 (toList!10138 List!29735)) )
))
(declare-fun call!63797 () ListLongMap!20245)

(declare-fun call!63796 () ListLongMap!20245)

(assert (=> bm!63789 (= call!63797 call!63796)))

(declare-fun b!1302061 () Bool)

(declare-datatypes ((Unit!43014 0))(
  ( (Unit!43015) )
))
(declare-fun e!742808 () Unit!43014)

(declare-fun lt!582009 () Unit!43014)

(assert (=> b!1302061 (= e!742808 lt!582009)))

(declare-fun lt!582014 () ListLongMap!20245)

(assert (=> b!1302061 (= lt!582014 call!63796)))

(declare-fun lt!582012 () ListLongMap!20245)

(declare-fun zeroValue!1387 () V!51553)

(declare-fun +!4506 (ListLongMap!20245 tuple2!22580) ListLongMap!20245)

(assert (=> b!1302061 (= lt!582012 (+!4506 lt!582014 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!51553)

(declare-fun lt!582010 () Unit!43014)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!81 ((_ BitVec 64) (_ BitVec 64) V!51553 ListLongMap!20245) Unit!43014)

(assert (=> b!1302061 (= lt!582010 (lemmaInListMapAfterAddingDiffThenInBefore!81 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582012))))

(declare-fun contains!8276 (ListLongMap!20245 (_ BitVec 64)) Bool)

(assert (=> b!1302061 (contains!8276 lt!582012 k0!1205)))

(declare-fun call!63795 () Unit!43014)

(assert (=> b!1302061 (= lt!582009 call!63795)))

(declare-fun call!63792 () Bool)

(assert (=> b!1302061 call!63792))

(declare-fun res!864862 () Bool)

(assert (=> start!110028 (=> (not res!864862) (not e!742813))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110028 (= res!864862 (validMask!0 mask!2175))))

(assert (=> start!110028 e!742813))

(declare-fun tp_is_empty!34837 () Bool)

(assert (=> start!110028 tp_is_empty!34837))

(assert (=> start!110028 true))

(declare-datatypes ((ValueCell!16520 0))(
  ( (ValueCellFull!16520 (v!20096 V!51553)) (EmptyCell!16520) )
))
(declare-datatypes ((array!86727 0))(
  ( (array!86728 (arr!41855 (Array (_ BitVec 32) ValueCell!16520)) (size!42406 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86727)

(declare-fun e!742815 () Bool)

(declare-fun array_inv!31907 (array!86727) Bool)

(assert (=> start!110028 (and (array_inv!31907 _values!1445) e!742815)))

(declare-fun array_inv!31908 (array!86725) Bool)

(assert (=> start!110028 (array_inv!31908 _keys!1741)))

(assert (=> start!110028 tp!102724))

(declare-fun b!1302062 () Bool)

(declare-fun res!864860 () Bool)

(assert (=> b!1302062 (=> (not res!864860) (not e!742813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302062 (= res!864860 (validKeyInArray!0 (select (arr!41854 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!53831 () Bool)

(declare-fun tp!102725 () Bool)

(declare-fun e!742809 () Bool)

(assert (=> mapNonEmpty!53831 (= mapRes!53831 (and tp!102725 e!742809))))

(declare-fun mapRest!53831 () (Array (_ BitVec 32) ValueCell!16520))

(declare-fun mapKey!53831 () (_ BitVec 32))

(declare-fun mapValue!53831 () ValueCell!16520)

(assert (=> mapNonEmpty!53831 (= (arr!41855 _values!1445) (store mapRest!53831 mapKey!53831 mapValue!53831))))

(declare-fun bm!63790 () Bool)

(declare-fun lt!582008 () ListLongMap!20245)

(declare-fun c!125032 () Bool)

(declare-fun lt!582011 () ListLongMap!20245)

(declare-fun c!125033 () Bool)

(assert (=> bm!63790 (= call!63792 (contains!8276 (ite c!125032 lt!582014 (ite c!125033 lt!582008 lt!582011)) k0!1205))))

(declare-fun b!1302063 () Bool)

(declare-fun res!864866 () Bool)

(assert (=> b!1302063 (=> (not res!864866) (not e!742813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86725 (_ BitVec 32)) Bool)

(assert (=> b!1302063 (= res!864866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302064 () Bool)

(declare-fun c!125034 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!582017 () Bool)

(assert (=> b!1302064 (= c!125034 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582017))))

(declare-fun e!742812 () Unit!43014)

(declare-fun e!742810 () Unit!43014)

(assert (=> b!1302064 (= e!742812 e!742810)))

(declare-fun bm!63791 () Bool)

(assert (=> bm!63791 (= call!63795 (lemmaInListMapAfterAddingDiffThenInBefore!81 k0!1205 (ite (or c!125032 c!125033) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125032 c!125033) zeroValue!1387 minValue!1387) (ite c!125032 lt!582014 (ite c!125033 lt!582008 lt!582011))))))

(declare-fun b!1302065 () Bool)

(declare-fun res!864865 () Bool)

(assert (=> b!1302065 (=> (not res!864865) (not e!742813))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5153 (array!86725 array!86727 (_ BitVec 32) (_ BitVec 32) V!51553 V!51553 (_ BitVec 32) Int) ListLongMap!20245)

(assert (=> b!1302065 (= res!864865 (contains!8276 (getCurrentListMap!5153 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302066 () Bool)

(declare-fun e!742814 () Bool)

(assert (=> b!1302066 (= e!742814 tp_is_empty!34837)))

(declare-fun b!1302067 () Bool)

(declare-fun lt!582016 () Unit!43014)

(assert (=> b!1302067 (= e!742810 lt!582016)))

(assert (=> b!1302067 (= lt!582011 call!63797)))

(declare-fun call!63794 () Unit!43014)

(assert (=> b!1302067 (= lt!582016 call!63794)))

(declare-fun call!63793 () Bool)

(assert (=> b!1302067 call!63793))

(declare-fun b!1302068 () Bool)

(declare-fun Unit!43016 () Unit!43014)

(assert (=> b!1302068 (= e!742810 Unit!43016)))

(declare-fun b!1302069 () Bool)

(declare-fun res!864867 () Bool)

(assert (=> b!1302069 (=> (not res!864867) (not e!742813))))

(assert (=> b!1302069 (= res!864867 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42405 _keys!1741))))))

(declare-fun b!1302070 () Bool)

(assert (=> b!1302070 (= e!742808 e!742812)))

(assert (=> b!1302070 (= c!125033 (and (not lt!582017) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63792 () Bool)

(assert (=> bm!63792 (= call!63793 call!63792)))

(declare-fun b!1302071 () Bool)

(declare-fun res!864861 () Bool)

(assert (=> b!1302071 (=> (not res!864861) (not e!742813))))

(declare-datatypes ((List!29736 0))(
  ( (Nil!29733) (Cons!29732 (h!30950 (_ BitVec 64)) (t!43302 List!29736)) )
))
(declare-fun arrayNoDuplicates!0 (array!86725 (_ BitVec 32) List!29736) Bool)

(assert (=> b!1302071 (= res!864861 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29733))))

(declare-fun b!1302072 () Bool)

(assert (=> b!1302072 (= e!742815 (and e!742814 mapRes!53831))))

(declare-fun condMapEmpty!53831 () Bool)

(declare-fun mapDefault!53831 () ValueCell!16520)

(assert (=> b!1302072 (= condMapEmpty!53831 (= (arr!41855 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16520)) mapDefault!53831)))))

(declare-fun b!1302073 () Bool)

(assert (=> b!1302073 (= e!742809 tp_is_empty!34837)))

(declare-fun b!1302074 () Bool)

(assert (=> b!1302074 (= e!742813 (not true))))

(assert (=> b!1302074 (not (contains!8276 (ListLongMap!20246 Nil!29732) k0!1205))))

(declare-fun lt!582015 () Unit!43014)

(declare-fun emptyContainsNothing!199 ((_ BitVec 64)) Unit!43014)

(assert (=> b!1302074 (= lt!582015 (emptyContainsNothing!199 k0!1205))))

(declare-fun lt!582018 () Unit!43014)

(assert (=> b!1302074 (= lt!582018 e!742808)))

(assert (=> b!1302074 (= c!125032 (and (not lt!582017) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1302074 (= lt!582017 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1302075 () Bool)

(assert (=> b!1302075 call!63793))

(declare-fun lt!582013 () Unit!43014)

(assert (=> b!1302075 (= lt!582013 call!63794)))

(assert (=> b!1302075 (= lt!582008 call!63797)))

(assert (=> b!1302075 (= e!742812 lt!582013)))

(declare-fun bm!63793 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6145 (array!86725 array!86727 (_ BitVec 32) (_ BitVec 32) V!51553 V!51553 (_ BitVec 32) Int) ListLongMap!20245)

(assert (=> bm!63793 (= call!63796 (getCurrentListMapNoExtraKeys!6145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302076 () Bool)

(declare-fun res!864863 () Bool)

(assert (=> b!1302076 (=> (not res!864863) (not e!742813))))

(assert (=> b!1302076 (= res!864863 (and (= (size!42406 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42405 _keys!1741) (size!42406 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63794 () Bool)

(assert (=> bm!63794 (= call!63794 call!63795)))

(assert (= (and start!110028 res!864862) b!1302076))

(assert (= (and b!1302076 res!864863) b!1302063))

(assert (= (and b!1302063 res!864866) b!1302071))

(assert (= (and b!1302071 res!864861) b!1302069))

(assert (= (and b!1302069 res!864867) b!1302065))

(assert (= (and b!1302065 res!864865) b!1302060))

(assert (= (and b!1302060 res!864864) b!1302062))

(assert (= (and b!1302062 res!864860) b!1302074))

(assert (= (and b!1302074 c!125032) b!1302061))

(assert (= (and b!1302074 (not c!125032)) b!1302070))

(assert (= (and b!1302070 c!125033) b!1302075))

(assert (= (and b!1302070 (not c!125033)) b!1302064))

(assert (= (and b!1302064 c!125034) b!1302067))

(assert (= (and b!1302064 (not c!125034)) b!1302068))

(assert (= (or b!1302075 b!1302067) bm!63789))

(assert (= (or b!1302075 b!1302067) bm!63794))

(assert (= (or b!1302075 b!1302067) bm!63792))

(assert (= (or b!1302061 bm!63789) bm!63793))

(assert (= (or b!1302061 bm!63794) bm!63791))

(assert (= (or b!1302061 bm!63792) bm!63790))

(assert (= (and b!1302072 condMapEmpty!53831) mapIsEmpty!53831))

(assert (= (and b!1302072 (not condMapEmpty!53831)) mapNonEmpty!53831))

(get-info :version)

(assert (= (and mapNonEmpty!53831 ((_ is ValueCellFull!16520) mapValue!53831)) b!1302073))

(assert (= (and b!1302072 ((_ is ValueCellFull!16520) mapDefault!53831)) b!1302066))

(assert (= start!110028 b!1302072))

(declare-fun m!1193207 () Bool)

(assert (=> mapNonEmpty!53831 m!1193207))

(declare-fun m!1193209 () Bool)

(assert (=> b!1302071 m!1193209))

(declare-fun m!1193211 () Bool)

(assert (=> b!1302062 m!1193211))

(assert (=> b!1302062 m!1193211))

(declare-fun m!1193213 () Bool)

(assert (=> b!1302062 m!1193213))

(declare-fun m!1193215 () Bool)

(assert (=> b!1302074 m!1193215))

(declare-fun m!1193217 () Bool)

(assert (=> b!1302074 m!1193217))

(declare-fun m!1193219 () Bool)

(assert (=> b!1302065 m!1193219))

(assert (=> b!1302065 m!1193219))

(declare-fun m!1193221 () Bool)

(assert (=> b!1302065 m!1193221))

(declare-fun m!1193223 () Bool)

(assert (=> start!110028 m!1193223))

(declare-fun m!1193225 () Bool)

(assert (=> start!110028 m!1193225))

(declare-fun m!1193227 () Bool)

(assert (=> start!110028 m!1193227))

(declare-fun m!1193229 () Bool)

(assert (=> bm!63791 m!1193229))

(declare-fun m!1193231 () Bool)

(assert (=> bm!63793 m!1193231))

(declare-fun m!1193233 () Bool)

(assert (=> b!1302063 m!1193233))

(declare-fun m!1193235 () Bool)

(assert (=> bm!63790 m!1193235))

(declare-fun m!1193237 () Bool)

(assert (=> b!1302061 m!1193237))

(declare-fun m!1193239 () Bool)

(assert (=> b!1302061 m!1193239))

(declare-fun m!1193241 () Bool)

(assert (=> b!1302061 m!1193241))

(check-sat (not b_next!29197) b_and!47313 tp_is_empty!34837 (not b!1302061) (not b!1302071) (not b!1302074) (not bm!63791) (not start!110028) (not b!1302065) (not bm!63793) (not b!1302063) (not b!1302062) (not bm!63790) (not mapNonEmpty!53831))
(check-sat b_and!47313 (not b_next!29197))
