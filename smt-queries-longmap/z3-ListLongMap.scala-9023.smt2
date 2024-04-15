; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108898 () Bool)

(assert start!108898)

(declare-fun b_free!28411 () Bool)

(declare-fun b_next!28411 () Bool)

(assert (=> start!108898 (= b_free!28411 (not b_next!28411))))

(declare-fun tp!100349 () Bool)

(declare-fun b_and!46465 () Bool)

(assert (=> start!108898 (= tp!100349 b_and!46465)))

(declare-fun b!1286295 () Bool)

(declare-datatypes ((Unit!42368 0))(
  ( (Unit!42369) )
))
(declare-fun e!734685 () Unit!42368)

(declare-fun lt!577038 () Unit!42368)

(assert (=> b!1286295 (= e!734685 lt!577038)))

(declare-datatypes ((V!50505 0))(
  ( (V!50506 (val!17100 Int)) )
))
(declare-datatypes ((tuple2!21992 0))(
  ( (tuple2!21993 (_1!11007 (_ BitVec 64)) (_2!11007 V!50505)) )
))
(declare-datatypes ((List!29168 0))(
  ( (Nil!29165) (Cons!29164 (h!30373 tuple2!21992) (t!42712 List!29168)) )
))
(declare-datatypes ((ListLongMap!19649 0))(
  ( (ListLongMap!19650 (toList!9840 List!29168)) )
))
(declare-fun lt!577036 () ListLongMap!19649)

(declare-fun call!62884 () ListLongMap!19649)

(assert (=> b!1286295 (= lt!577036 call!62884)))

(declare-fun lt!577029 () ListLongMap!19649)

(declare-fun zeroValue!1387 () V!50505)

(declare-fun +!4354 (ListLongMap!19649 tuple2!21992) ListLongMap!19649)

(assert (=> b!1286295 (= lt!577029 (+!4354 lt!577036 (tuple2!21993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577034 () Unit!42368)

(declare-fun call!62883 () Unit!42368)

(assert (=> b!1286295 (= lt!577034 call!62883)))

(declare-fun call!62881 () Bool)

(assert (=> b!1286295 call!62881))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!32 ((_ BitVec 64) (_ BitVec 64) V!50505 ListLongMap!19649) Unit!42368)

(assert (=> b!1286295 (= lt!577038 (lemmaInListMapAfterAddingDiffThenInBefore!32 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577036))))

(declare-fun contains!7886 (ListLongMap!19649 (_ BitVec 64)) Bool)

(assert (=> b!1286295 (contains!7886 lt!577036 k0!1205)))

(declare-fun minValue!1387 () V!50505)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16127 0))(
  ( (ValueCellFull!16127 (v!19701 V!50505)) (EmptyCell!16127) )
))
(declare-datatypes ((array!85045 0))(
  ( (array!85046 (arr!41025 (Array (_ BitVec 32) ValueCell!16127)) (size!41577 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85045)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85047 0))(
  ( (array!85048 (arr!41026 (Array (_ BitVec 32) (_ BitVec 64))) (size!41578 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85047)

(declare-fun bm!62876 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5985 (array!85047 array!85045 (_ BitVec 32) (_ BitVec 32) V!50505 V!50505 (_ BitVec 32) Int) ListLongMap!19649)

(assert (=> bm!62876 (= call!62884 (getCurrentListMapNoExtraKeys!5985 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!62877 () Bool)

(declare-fun call!62882 () Unit!42368)

(assert (=> bm!62877 (= call!62882 call!62883)))

(declare-fun b!1286296 () Bool)

(declare-fun e!734689 () Bool)

(declare-fun tp_is_empty!34051 () Bool)

(assert (=> b!1286296 (= e!734689 tp_is_empty!34051)))

(declare-fun res!854471 () Bool)

(declare-fun e!734690 () Bool)

(assert (=> start!108898 (=> (not res!854471) (not e!734690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108898 (= res!854471 (validMask!0 mask!2175))))

(assert (=> start!108898 e!734690))

(assert (=> start!108898 tp_is_empty!34051))

(assert (=> start!108898 true))

(declare-fun e!734687 () Bool)

(declare-fun array_inv!31269 (array!85045) Bool)

(assert (=> start!108898 (and (array_inv!31269 _values!1445) e!734687)))

(declare-fun array_inv!31270 (array!85047) Bool)

(assert (=> start!108898 (array_inv!31270 _keys!1741)))

(assert (=> start!108898 tp!100349))

(declare-fun b!1286297 () Bool)

(declare-fun e!734683 () Bool)

(assert (=> b!1286297 (= e!734683 true)))

(declare-fun lt!577041 () V!50505)

(assert (=> b!1286297 (not (contains!7886 (+!4354 (ListLongMap!19650 Nil!29165) (tuple2!21993 (select (arr!41026 _keys!1741) from!2144) lt!577041)) k0!1205))))

(declare-fun lt!577030 () Unit!42368)

(declare-fun addStillNotContains!338 (ListLongMap!19649 (_ BitVec 64) V!50505 (_ BitVec 64)) Unit!42368)

(assert (=> b!1286297 (= lt!577030 (addStillNotContains!338 (ListLongMap!19650 Nil!29165) (select (arr!41026 _keys!1741) from!2144) lt!577041 k0!1205))))

(declare-fun get!20857 (ValueCell!16127 V!50505) V!50505)

(declare-fun dynLambda!3436 (Int (_ BitVec 64)) V!50505)

(assert (=> b!1286297 (= lt!577041 (get!20857 (select (arr!41025 _values!1445) from!2144) (dynLambda!3436 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1286298 () Bool)

(declare-fun e!734684 () Unit!42368)

(assert (=> b!1286298 (= e!734685 e!734684)))

(declare-fun c!124149 () Bool)

(declare-fun lt!577037 () Bool)

(assert (=> b!1286298 (= c!124149 (and (not lt!577037) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286299 () Bool)

(declare-fun res!854468 () Bool)

(assert (=> b!1286299 (=> (not res!854468) (not e!734690))))

(declare-datatypes ((List!29169 0))(
  ( (Nil!29166) (Cons!29165 (h!30374 (_ BitVec 64)) (t!42713 List!29169)) )
))
(declare-fun arrayNoDuplicates!0 (array!85047 (_ BitVec 32) List!29169) Bool)

(assert (=> b!1286299 (= res!854468 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29166))))

(declare-fun lt!577040 () ListLongMap!19649)

(declare-fun lt!577033 () ListLongMap!19649)

(declare-fun bm!62878 () Bool)

(declare-fun c!124148 () Bool)

(assert (=> bm!62878 (= call!62881 (contains!7886 (ite c!124148 lt!577029 (ite c!124149 lt!577040 lt!577033)) k0!1205))))

(declare-fun b!1286300 () Bool)

(declare-fun res!854466 () Bool)

(assert (=> b!1286300 (=> (not res!854466) (not e!734690))))

(assert (=> b!1286300 (= res!854466 (and (= (size!41577 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41578 _keys!1741) (size!41577 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52634 () Bool)

(declare-fun mapRes!52634 () Bool)

(declare-fun tp!100350 () Bool)

(assert (=> mapNonEmpty!52634 (= mapRes!52634 (and tp!100350 e!734689))))

(declare-fun mapKey!52634 () (_ BitVec 32))

(declare-fun mapRest!52634 () (Array (_ BitVec 32) ValueCell!16127))

(declare-fun mapValue!52634 () ValueCell!16127)

(assert (=> mapNonEmpty!52634 (= (arr!41025 _values!1445) (store mapRest!52634 mapKey!52634 mapValue!52634))))

(declare-fun b!1286301 () Bool)

(declare-fun res!854470 () Bool)

(assert (=> b!1286301 (=> (not res!854470) (not e!734690))))

(declare-fun getCurrentListMap!4807 (array!85047 array!85045 (_ BitVec 32) (_ BitVec 32) V!50505 V!50505 (_ BitVec 32) Int) ListLongMap!19649)

(assert (=> b!1286301 (= res!854470 (contains!7886 (getCurrentListMap!4807 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52634 () Bool)

(assert (=> mapIsEmpty!52634 mapRes!52634))

(declare-fun b!1286302 () Bool)

(declare-fun res!854464 () Bool)

(assert (=> b!1286302 (=> (not res!854464) (not e!734690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286302 (= res!854464 (validKeyInArray!0 (select (arr!41026 _keys!1741) from!2144)))))

(declare-fun bm!62879 () Bool)

(assert (=> bm!62879 (= call!62883 (lemmaInListMapAfterAddingDiffThenInBefore!32 k0!1205 (ite c!124148 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124149 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124148 minValue!1387 (ite c!124149 zeroValue!1387 minValue!1387)) (ite c!124148 lt!577029 (ite c!124149 lt!577040 lt!577033))))))

(declare-fun b!1286303 () Bool)

(declare-fun e!734686 () Unit!42368)

(declare-fun Unit!42370 () Unit!42368)

(assert (=> b!1286303 (= e!734686 Unit!42370)))

(declare-fun b!1286304 () Bool)

(declare-fun c!124147 () Bool)

(assert (=> b!1286304 (= c!124147 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577037))))

(assert (=> b!1286304 (= e!734684 e!734686)))

(declare-fun b!1286305 () Bool)

(declare-fun e!734691 () Bool)

(assert (=> b!1286305 (= e!734687 (and e!734691 mapRes!52634))))

(declare-fun condMapEmpty!52634 () Bool)

(declare-fun mapDefault!52634 () ValueCell!16127)

(assert (=> b!1286305 (= condMapEmpty!52634 (= (arr!41025 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16127)) mapDefault!52634)))))

(declare-fun b!1286306 () Bool)

(declare-fun lt!577035 () Unit!42368)

(assert (=> b!1286306 (= e!734686 lt!577035)))

(declare-fun call!62879 () ListLongMap!19649)

(assert (=> b!1286306 (= lt!577033 call!62879)))

(assert (=> b!1286306 (= lt!577035 call!62882)))

(declare-fun call!62880 () Bool)

(assert (=> b!1286306 call!62880))

(declare-fun bm!62880 () Bool)

(assert (=> bm!62880 (= call!62880 call!62881)))

(declare-fun bm!62881 () Bool)

(assert (=> bm!62881 (= call!62879 call!62884)))

(declare-fun b!1286307 () Bool)

(declare-fun res!854465 () Bool)

(assert (=> b!1286307 (=> (not res!854465) (not e!734690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85047 (_ BitVec 32)) Bool)

(assert (=> b!1286307 (= res!854465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286308 () Bool)

(declare-fun res!854469 () Bool)

(assert (=> b!1286308 (=> (not res!854469) (not e!734690))))

(assert (=> b!1286308 (= res!854469 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41578 _keys!1741))))))

(declare-fun b!1286309 () Bool)

(assert (=> b!1286309 call!62880))

(declare-fun lt!577031 () Unit!42368)

(assert (=> b!1286309 (= lt!577031 call!62882)))

(assert (=> b!1286309 (= lt!577040 call!62879)))

(assert (=> b!1286309 (= e!734684 lt!577031)))

(declare-fun b!1286310 () Bool)

(declare-fun res!854467 () Bool)

(assert (=> b!1286310 (=> (not res!854467) (not e!734690))))

(assert (=> b!1286310 (= res!854467 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41578 _keys!1741))))))

(declare-fun b!1286311 () Bool)

(assert (=> b!1286311 (= e!734690 (not e!734683))))

(declare-fun res!854472 () Bool)

(assert (=> b!1286311 (=> res!854472 e!734683)))

(assert (=> b!1286311 (= res!854472 (= k0!1205 (select (arr!41026 _keys!1741) from!2144)))))

(assert (=> b!1286311 (not (contains!7886 (ListLongMap!19650 Nil!29165) k0!1205))))

(declare-fun lt!577039 () Unit!42368)

(declare-fun emptyContainsNothing!4 ((_ BitVec 64)) Unit!42368)

(assert (=> b!1286311 (= lt!577039 (emptyContainsNothing!4 k0!1205))))

(declare-fun lt!577032 () Unit!42368)

(assert (=> b!1286311 (= lt!577032 e!734685)))

(assert (=> b!1286311 (= c!124148 (and (not lt!577037) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286311 (= lt!577037 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286312 () Bool)

(assert (=> b!1286312 (= e!734691 tp_is_empty!34051)))

(assert (= (and start!108898 res!854471) b!1286300))

(assert (= (and b!1286300 res!854466) b!1286307))

(assert (= (and b!1286307 res!854465) b!1286299))

(assert (= (and b!1286299 res!854468) b!1286308))

(assert (= (and b!1286308 res!854469) b!1286301))

(assert (= (and b!1286301 res!854470) b!1286310))

(assert (= (and b!1286310 res!854467) b!1286302))

(assert (= (and b!1286302 res!854464) b!1286311))

(assert (= (and b!1286311 c!124148) b!1286295))

(assert (= (and b!1286311 (not c!124148)) b!1286298))

(assert (= (and b!1286298 c!124149) b!1286309))

(assert (= (and b!1286298 (not c!124149)) b!1286304))

(assert (= (and b!1286304 c!124147) b!1286306))

(assert (= (and b!1286304 (not c!124147)) b!1286303))

(assert (= (or b!1286309 b!1286306) bm!62881))

(assert (= (or b!1286309 b!1286306) bm!62877))

(assert (= (or b!1286309 b!1286306) bm!62880))

(assert (= (or b!1286295 bm!62881) bm!62876))

(assert (= (or b!1286295 bm!62877) bm!62879))

(assert (= (or b!1286295 bm!62880) bm!62878))

(assert (= (and b!1286311 (not res!854472)) b!1286297))

(assert (= (and b!1286305 condMapEmpty!52634) mapIsEmpty!52634))

(assert (= (and b!1286305 (not condMapEmpty!52634)) mapNonEmpty!52634))

(get-info :version)

(assert (= (and mapNonEmpty!52634 ((_ is ValueCellFull!16127) mapValue!52634)) b!1286296))

(assert (= (and b!1286305 ((_ is ValueCellFull!16127) mapDefault!52634)) b!1286312))

(assert (= start!108898 b!1286305))

(declare-fun b_lambda!23103 () Bool)

(assert (=> (not b_lambda!23103) (not b!1286297)))

(declare-fun t!42711 () Bool)

(declare-fun tb!11347 () Bool)

(assert (=> (and start!108898 (= defaultEntry!1448 defaultEntry!1448) t!42711) tb!11347))

(declare-fun result!23701 () Bool)

(assert (=> tb!11347 (= result!23701 tp_is_empty!34051)))

(assert (=> b!1286297 t!42711))

(declare-fun b_and!46467 () Bool)

(assert (= b_and!46465 (and (=> t!42711 result!23701) b_and!46467)))

(declare-fun m!1178941 () Bool)

(assert (=> start!108898 m!1178941))

(declare-fun m!1178943 () Bool)

(assert (=> start!108898 m!1178943))

(declare-fun m!1178945 () Bool)

(assert (=> start!108898 m!1178945))

(declare-fun m!1178947 () Bool)

(assert (=> b!1286311 m!1178947))

(declare-fun m!1178949 () Bool)

(assert (=> b!1286311 m!1178949))

(declare-fun m!1178951 () Bool)

(assert (=> b!1286311 m!1178951))

(declare-fun m!1178953 () Bool)

(assert (=> bm!62878 m!1178953))

(declare-fun m!1178955 () Bool)

(assert (=> mapNonEmpty!52634 m!1178955))

(declare-fun m!1178957 () Bool)

(assert (=> b!1286295 m!1178957))

(declare-fun m!1178959 () Bool)

(assert (=> b!1286295 m!1178959))

(declare-fun m!1178961 () Bool)

(assert (=> b!1286295 m!1178961))

(assert (=> b!1286297 m!1178947))

(declare-fun m!1178963 () Bool)

(assert (=> b!1286297 m!1178963))

(declare-fun m!1178965 () Bool)

(assert (=> b!1286297 m!1178965))

(declare-fun m!1178967 () Bool)

(assert (=> b!1286297 m!1178967))

(declare-fun m!1178969 () Bool)

(assert (=> b!1286297 m!1178969))

(assert (=> b!1286297 m!1178967))

(assert (=> b!1286297 m!1178965))

(declare-fun m!1178971 () Bool)

(assert (=> b!1286297 m!1178971))

(assert (=> b!1286297 m!1178969))

(declare-fun m!1178973 () Bool)

(assert (=> b!1286297 m!1178973))

(assert (=> b!1286297 m!1178947))

(declare-fun m!1178975 () Bool)

(assert (=> b!1286307 m!1178975))

(declare-fun m!1178977 () Bool)

(assert (=> b!1286299 m!1178977))

(assert (=> b!1286302 m!1178947))

(assert (=> b!1286302 m!1178947))

(declare-fun m!1178979 () Bool)

(assert (=> b!1286302 m!1178979))

(declare-fun m!1178981 () Bool)

(assert (=> bm!62876 m!1178981))

(declare-fun m!1178983 () Bool)

(assert (=> bm!62879 m!1178983))

(declare-fun m!1178985 () Bool)

(assert (=> b!1286301 m!1178985))

(assert (=> b!1286301 m!1178985))

(declare-fun m!1178987 () Bool)

(assert (=> b!1286301 m!1178987))

(check-sat (not b!1286301) (not start!108898) (not b!1286302) (not b!1286297) (not b_next!28411) (not bm!62878) (not b_lambda!23103) (not b!1286299) (not b!1286295) (not b!1286307) b_and!46467 (not bm!62879) (not mapNonEmpty!52634) (not b!1286311) (not bm!62876) tp_is_empty!34051)
(check-sat b_and!46467 (not b_next!28411))
