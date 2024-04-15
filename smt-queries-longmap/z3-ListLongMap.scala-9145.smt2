; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109690 () Bool)

(assert start!109690)

(declare-fun b_free!29143 () Bool)

(declare-fun b_next!29143 () Bool)

(assert (=> start!109690 (= b_free!29143 (not b_next!29143))))

(declare-fun tp!102554 () Bool)

(declare-fun b_and!47221 () Bool)

(assert (=> start!109690 (= tp!102554 b_and!47221)))

(declare-fun b!1299200 () Bool)

(declare-fun res!863408 () Bool)

(declare-fun e!741202 () Bool)

(assert (=> b!1299200 (=> (not res!863408) (not e!741202))))

(declare-datatypes ((array!86471 0))(
  ( (array!86472 (arr!41735 (Array (_ BitVec 32) (_ BitVec 64))) (size!42287 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86471)

(declare-datatypes ((List!29692 0))(
  ( (Nil!29689) (Cons!29688 (h!30897 (_ BitVec 64)) (t!43252 List!29692)) )
))
(declare-fun arrayNoDuplicates!0 (array!86471 (_ BitVec 32) List!29692) Bool)

(assert (=> b!1299200 (= res!863408 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29689))))

(declare-fun b!1299201 () Bool)

(declare-fun res!863404 () Bool)

(assert (=> b!1299201 (=> (not res!863404) (not e!741202))))

(declare-datatypes ((V!51481 0))(
  ( (V!51482 (val!17466 Int)) )
))
(declare-fun minValue!1387 () V!51481)

(declare-fun zeroValue!1387 () V!51481)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16493 0))(
  ( (ValueCellFull!16493 (v!20070 V!51481)) (EmptyCell!16493) )
))
(declare-datatypes ((array!86473 0))(
  ( (array!86474 (arr!41736 (Array (_ BitVec 32) ValueCell!16493)) (size!42288 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86473)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22572 0))(
  ( (tuple2!22573 (_1!11297 (_ BitVec 64)) (_2!11297 V!51481)) )
))
(declare-datatypes ((List!29693 0))(
  ( (Nil!29690) (Cons!29689 (h!30898 tuple2!22572) (t!43253 List!29693)) )
))
(declare-datatypes ((ListLongMap!20229 0))(
  ( (ListLongMap!20230 (toList!10130 List!29693)) )
))
(declare-fun contains!8180 (ListLongMap!20229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5046 (array!86471 array!86473 (_ BitVec 32) (_ BitVec 32) V!51481 V!51481 (_ BitVec 32) Int) ListLongMap!20229)

(assert (=> b!1299201 (= res!863404 (contains!8180 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299202 () Bool)

(declare-fun res!863403 () Bool)

(assert (=> b!1299202 (=> (not res!863403) (not e!741202))))

(assert (=> b!1299202 (= res!863403 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42287 _keys!1741))))))

(declare-fun b!1299203 () Bool)

(declare-fun res!863405 () Bool)

(assert (=> b!1299203 (=> (not res!863405) (not e!741202))))

(assert (=> b!1299203 (= res!863405 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42287 _keys!1741))))))

(declare-fun b!1299204 () Bool)

(declare-fun +!4476 (ListLongMap!20229 tuple2!22572) ListLongMap!20229)

(declare-fun getCurrentListMapNoExtraKeys!6107 (array!86471 array!86473 (_ BitVec 32) (_ BitVec 32) V!51481 V!51481 (_ BitVec 32) Int) ListLongMap!20229)

(assert (=> b!1299204 (= e!741202 (not (contains!8180 (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))))

(declare-fun b!1299205 () Bool)

(declare-fun e!741201 () Bool)

(declare-fun tp_is_empty!34783 () Bool)

(assert (=> b!1299205 (= e!741201 tp_is_empty!34783)))

(declare-fun res!863407 () Bool)

(assert (=> start!109690 (=> (not res!863407) (not e!741202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109690 (= res!863407 (validMask!0 mask!2175))))

(assert (=> start!109690 e!741202))

(assert (=> start!109690 tp_is_empty!34783))

(assert (=> start!109690 true))

(declare-fun e!741203 () Bool)

(declare-fun array_inv!31745 (array!86473) Bool)

(assert (=> start!109690 (and (array_inv!31745 _values!1445) e!741203)))

(declare-fun array_inv!31746 (array!86471) Bool)

(assert (=> start!109690 (array_inv!31746 _keys!1741)))

(assert (=> start!109690 tp!102554))

(declare-fun mapNonEmpty!53741 () Bool)

(declare-fun mapRes!53741 () Bool)

(declare-fun tp!102555 () Bool)

(declare-fun e!741199 () Bool)

(assert (=> mapNonEmpty!53741 (= mapRes!53741 (and tp!102555 e!741199))))

(declare-fun mapKey!53741 () (_ BitVec 32))

(declare-fun mapRest!53741 () (Array (_ BitVec 32) ValueCell!16493))

(declare-fun mapValue!53741 () ValueCell!16493)

(assert (=> mapNonEmpty!53741 (= (arr!41736 _values!1445) (store mapRest!53741 mapKey!53741 mapValue!53741))))

(declare-fun b!1299206 () Bool)

(declare-fun res!863406 () Bool)

(assert (=> b!1299206 (=> (not res!863406) (not e!741202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299206 (= res!863406 (validKeyInArray!0 (select (arr!41735 _keys!1741) from!2144)))))

(declare-fun b!1299207 () Bool)

(assert (=> b!1299207 (= e!741203 (and e!741201 mapRes!53741))))

(declare-fun condMapEmpty!53741 () Bool)

(declare-fun mapDefault!53741 () ValueCell!16493)

(assert (=> b!1299207 (= condMapEmpty!53741 (= (arr!41736 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16493)) mapDefault!53741)))))

(declare-fun b!1299208 () Bool)

(assert (=> b!1299208 (= e!741199 tp_is_empty!34783)))

(declare-fun b!1299209 () Bool)

(declare-fun res!863409 () Bool)

(assert (=> b!1299209 (=> (not res!863409) (not e!741202))))

(assert (=> b!1299209 (= res!863409 (and (= (size!42288 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42287 _keys!1741) (size!42288 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53741 () Bool)

(assert (=> mapIsEmpty!53741 mapRes!53741))

(declare-fun b!1299210 () Bool)

(declare-fun res!863402 () Bool)

(assert (=> b!1299210 (=> (not res!863402) (not e!741202))))

(assert (=> b!1299210 (= res!863402 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299211 () Bool)

(declare-fun res!863401 () Bool)

(assert (=> b!1299211 (=> (not res!863401) (not e!741202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86471 (_ BitVec 32)) Bool)

(assert (=> b!1299211 (= res!863401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109690 res!863407) b!1299209))

(assert (= (and b!1299209 res!863409) b!1299211))

(assert (= (and b!1299211 res!863401) b!1299200))

(assert (= (and b!1299200 res!863408) b!1299203))

(assert (= (and b!1299203 res!863405) b!1299201))

(assert (= (and b!1299201 res!863404) b!1299202))

(assert (= (and b!1299202 res!863403) b!1299206))

(assert (= (and b!1299206 res!863406) b!1299210))

(assert (= (and b!1299210 res!863402) b!1299204))

(assert (= (and b!1299207 condMapEmpty!53741) mapIsEmpty!53741))

(assert (= (and b!1299207 (not condMapEmpty!53741)) mapNonEmpty!53741))

(get-info :version)

(assert (= (and mapNonEmpty!53741 ((_ is ValueCellFull!16493) mapValue!53741)) b!1299208))

(assert (= (and b!1299207 ((_ is ValueCellFull!16493) mapDefault!53741)) b!1299205))

(assert (= start!109690 b!1299207))

(declare-fun m!1189967 () Bool)

(assert (=> mapNonEmpty!53741 m!1189967))

(declare-fun m!1189969 () Bool)

(assert (=> b!1299211 m!1189969))

(declare-fun m!1189971 () Bool)

(assert (=> b!1299206 m!1189971))

(assert (=> b!1299206 m!1189971))

(declare-fun m!1189973 () Bool)

(assert (=> b!1299206 m!1189973))

(declare-fun m!1189975 () Bool)

(assert (=> b!1299201 m!1189975))

(assert (=> b!1299201 m!1189975))

(declare-fun m!1189977 () Bool)

(assert (=> b!1299201 m!1189977))

(declare-fun m!1189979 () Bool)

(assert (=> start!109690 m!1189979))

(declare-fun m!1189981 () Bool)

(assert (=> start!109690 m!1189981))

(declare-fun m!1189983 () Bool)

(assert (=> start!109690 m!1189983))

(declare-fun m!1189985 () Bool)

(assert (=> b!1299200 m!1189985))

(declare-fun m!1189987 () Bool)

(assert (=> b!1299204 m!1189987))

(assert (=> b!1299204 m!1189987))

(declare-fun m!1189989 () Bool)

(assert (=> b!1299204 m!1189989))

(assert (=> b!1299204 m!1189989))

(declare-fun m!1189991 () Bool)

(assert (=> b!1299204 m!1189991))

(assert (=> b!1299204 m!1189991))

(declare-fun m!1189993 () Bool)

(assert (=> b!1299204 m!1189993))

(check-sat (not b!1299200) (not mapNonEmpty!53741) (not b!1299204) (not b!1299206) (not start!109690) (not b!1299211) b_and!47221 (not b!1299201) tp_is_empty!34783 (not b_next!29143))
(check-sat b_and!47221 (not b_next!29143))
(get-model)

(declare-fun d!140987 () Bool)

(assert (=> d!140987 (= (validKeyInArray!0 (select (arr!41735 _keys!1741) from!2144)) (and (not (= (select (arr!41735 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41735 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299206 d!140987))

(declare-fun d!140989 () Bool)

(declare-fun e!741239 () Bool)

(assert (=> d!140989 e!741239))

(declare-fun res!863466 () Bool)

(assert (=> d!140989 (=> res!863466 e!741239)))

(declare-fun lt!580797 () Bool)

(assert (=> d!140989 (= res!863466 (not lt!580797))))

(declare-fun lt!580795 () Bool)

(assert (=> d!140989 (= lt!580797 lt!580795)))

(declare-datatypes ((Unit!42858 0))(
  ( (Unit!42859) )
))
(declare-fun lt!580796 () Unit!42858)

(declare-fun e!741238 () Unit!42858)

(assert (=> d!140989 (= lt!580796 e!741238)))

(declare-fun c!124465 () Bool)

(assert (=> d!140989 (= c!124465 lt!580795)))

(declare-fun containsKey!717 (List!29693 (_ BitVec 64)) Bool)

(assert (=> d!140989 (= lt!580795 (containsKey!717 (toList!10130 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140989 (= (contains!8180 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!580797)))

(declare-fun b!1299290 () Bool)

(declare-fun lt!580794 () Unit!42858)

(assert (=> b!1299290 (= e!741238 lt!580794)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!464 (List!29693 (_ BitVec 64)) Unit!42858)

(assert (=> b!1299290 (= lt!580794 (lemmaContainsKeyImpliesGetValueByKeyDefined!464 (toList!10130 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!751 0))(
  ( (Some!750 (v!20073 V!51481)) (None!749) )
))
(declare-fun isDefined!507 (Option!751) Bool)

(declare-fun getValueByKey!700 (List!29693 (_ BitVec 64)) Option!751)

(assert (=> b!1299290 (isDefined!507 (getValueByKey!700 (toList!10130 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1299291 () Bool)

(declare-fun Unit!42860 () Unit!42858)

(assert (=> b!1299291 (= e!741238 Unit!42860)))

(declare-fun b!1299292 () Bool)

(assert (=> b!1299292 (= e!741239 (isDefined!507 (getValueByKey!700 (toList!10130 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140989 c!124465) b!1299290))

(assert (= (and d!140989 (not c!124465)) b!1299291))

(assert (= (and d!140989 (not res!863466)) b!1299292))

(declare-fun m!1190051 () Bool)

(assert (=> d!140989 m!1190051))

(declare-fun m!1190053 () Bool)

(assert (=> b!1299290 m!1190053))

(declare-fun m!1190055 () Bool)

(assert (=> b!1299290 m!1190055))

(assert (=> b!1299290 m!1190055))

(declare-fun m!1190057 () Bool)

(assert (=> b!1299290 m!1190057))

(assert (=> b!1299292 m!1190055))

(assert (=> b!1299292 m!1190055))

(assert (=> b!1299292 m!1190057))

(assert (=> b!1299201 d!140989))

(declare-fun b!1299335 () Bool)

(declare-fun res!863489 () Bool)

(declare-fun e!741269 () Bool)

(assert (=> b!1299335 (=> (not res!863489) (not e!741269))))

(declare-fun e!741272 () Bool)

(assert (=> b!1299335 (= res!863489 e!741272)))

(declare-fun res!863491 () Bool)

(assert (=> b!1299335 (=> res!863491 e!741272)))

(declare-fun e!741270 () Bool)

(assert (=> b!1299335 (= res!863491 (not e!741270))))

(declare-fun res!863485 () Bool)

(assert (=> b!1299335 (=> (not res!863485) (not e!741270))))

(assert (=> b!1299335 (= res!863485 (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun d!140991 () Bool)

(assert (=> d!140991 e!741269))

(declare-fun res!863493 () Bool)

(assert (=> d!140991 (=> (not res!863493) (not e!741269))))

(assert (=> d!140991 (= res!863493 (or (bvsge from!2144 (size!42287 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42287 _keys!1741)))))))

(declare-fun lt!580849 () ListLongMap!20229)

(declare-fun lt!580860 () ListLongMap!20229)

(assert (=> d!140991 (= lt!580849 lt!580860)))

(declare-fun lt!580844 () Unit!42858)

(declare-fun e!741278 () Unit!42858)

(assert (=> d!140991 (= lt!580844 e!741278)))

(declare-fun c!124479 () Bool)

(declare-fun e!741275 () Bool)

(assert (=> d!140991 (= c!124479 e!741275)))

(declare-fun res!863492 () Bool)

(assert (=> d!140991 (=> (not res!863492) (not e!741275))))

(assert (=> d!140991 (= res!863492 (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun e!741273 () ListLongMap!20229)

(assert (=> d!140991 (= lt!580860 e!741273)))

(declare-fun c!124480 () Bool)

(assert (=> d!140991 (= c!124480 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140991 (validMask!0 mask!2175)))

(assert (=> d!140991 (= (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!580849)))

(declare-fun bm!63563 () Bool)

(declare-fun call!63571 () ListLongMap!20229)

(declare-fun call!63567 () ListLongMap!20229)

(assert (=> bm!63563 (= call!63571 call!63567)))

(declare-fun bm!63564 () Bool)

(assert (=> bm!63564 (= call!63567 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1299336 () Bool)

(declare-fun call!63572 () ListLongMap!20229)

(assert (=> b!1299336 (= e!741273 (+!4476 call!63572 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1299337 () Bool)

(declare-fun e!741266 () Bool)

(declare-fun apply!1007 (ListLongMap!20229 (_ BitVec 64)) V!51481)

(assert (=> b!1299337 (= e!741266 (= (apply!1007 lt!580849 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun e!741267 () Bool)

(declare-fun b!1299338 () Bool)

(declare-fun get!21107 (ValueCell!16493 V!51481) V!51481)

(declare-fun dynLambda!3442 (Int (_ BitVec 64)) V!51481)

(assert (=> b!1299338 (= e!741267 (= (apply!1007 lt!580849 (select (arr!41735 _keys!1741) from!2144)) (get!21107 (select (arr!41736 _values!1445) from!2144) (dynLambda!3442 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42288 _values!1445)))))

(assert (=> b!1299338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun b!1299339 () Bool)

(declare-fun res!863488 () Bool)

(assert (=> b!1299339 (=> (not res!863488) (not e!741269))))

(declare-fun e!741274 () Bool)

(assert (=> b!1299339 (= res!863488 e!741274)))

(declare-fun c!124478 () Bool)

(assert (=> b!1299339 (= c!124478 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1299340 () Bool)

(assert (=> b!1299340 (= e!741274 e!741266)))

(declare-fun res!863490 () Bool)

(declare-fun call!63570 () Bool)

(assert (=> b!1299340 (= res!863490 call!63570)))

(assert (=> b!1299340 (=> (not res!863490) (not e!741266))))

(declare-fun b!1299341 () Bool)

(assert (=> b!1299341 (= e!741275 (validKeyInArray!0 (select (arr!41735 _keys!1741) from!2144)))))

(declare-fun bm!63565 () Bool)

(assert (=> bm!63565 (= call!63570 (contains!8180 lt!580849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63566 () Bool)

(declare-fun call!63566 () Bool)

(assert (=> bm!63566 (= call!63566 (contains!8180 lt!580849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299342 () Bool)

(assert (=> b!1299342 (= e!741272 e!741267)))

(declare-fun res!863486 () Bool)

(assert (=> b!1299342 (=> (not res!863486) (not e!741267))))

(assert (=> b!1299342 (= res!863486 (contains!8180 lt!580849 (select (arr!41735 _keys!1741) from!2144)))))

(assert (=> b!1299342 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun b!1299343 () Bool)

(declare-fun e!741277 () ListLongMap!20229)

(declare-fun call!63568 () ListLongMap!20229)

(assert (=> b!1299343 (= e!741277 call!63568)))

(declare-fun b!1299344 () Bool)

(declare-fun Unit!42861 () Unit!42858)

(assert (=> b!1299344 (= e!741278 Unit!42861)))

(declare-fun bm!63567 () Bool)

(assert (=> bm!63567 (= call!63568 call!63572)))

(declare-fun bm!63568 () Bool)

(declare-fun call!63569 () ListLongMap!20229)

(declare-fun c!124482 () Bool)

(assert (=> bm!63568 (= call!63572 (+!4476 (ite c!124480 call!63567 (ite c!124482 call!63571 call!63569)) (ite (or c!124480 c!124482) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1299345 () Bool)

(declare-fun e!741271 () Bool)

(declare-fun e!741268 () Bool)

(assert (=> b!1299345 (= e!741271 e!741268)))

(declare-fun res!863487 () Bool)

(assert (=> b!1299345 (= res!863487 call!63566)))

(assert (=> b!1299345 (=> (not res!863487) (not e!741268))))

(declare-fun b!1299346 () Bool)

(declare-fun e!741276 () ListLongMap!20229)

(assert (=> b!1299346 (= e!741276 call!63569)))

(declare-fun b!1299347 () Bool)

(assert (=> b!1299347 (= e!741271 (not call!63566))))

(declare-fun b!1299348 () Bool)

(assert (=> b!1299348 (= e!741269 e!741271)))

(declare-fun c!124481 () Bool)

(assert (=> b!1299348 (= c!124481 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1299349 () Bool)

(declare-fun c!124483 () Bool)

(assert (=> b!1299349 (= c!124483 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1299349 (= e!741277 e!741276)))

(declare-fun b!1299350 () Bool)

(assert (=> b!1299350 (= e!741276 call!63568)))

(declare-fun b!1299351 () Bool)

(declare-fun lt!580853 () Unit!42858)

(assert (=> b!1299351 (= e!741278 lt!580853)))

(declare-fun lt!580856 () ListLongMap!20229)

(assert (=> b!1299351 (= lt!580856 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580848 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580845 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580845 (select (arr!41735 _keys!1741) from!2144))))

(declare-fun lt!580842 () Unit!42858)

(declare-fun addStillContains!1102 (ListLongMap!20229 (_ BitVec 64) V!51481 (_ BitVec 64)) Unit!42858)

(assert (=> b!1299351 (= lt!580842 (addStillContains!1102 lt!580856 lt!580848 zeroValue!1387 lt!580845))))

(assert (=> b!1299351 (contains!8180 (+!4476 lt!580856 (tuple2!22573 lt!580848 zeroValue!1387)) lt!580845)))

(declare-fun lt!580847 () Unit!42858)

(assert (=> b!1299351 (= lt!580847 lt!580842)))

(declare-fun lt!580863 () ListLongMap!20229)

(assert (=> b!1299351 (= lt!580863 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580850 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580850 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580857 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580857 (select (arr!41735 _keys!1741) from!2144))))

(declare-fun lt!580855 () Unit!42858)

(declare-fun addApplyDifferent!545 (ListLongMap!20229 (_ BitVec 64) V!51481 (_ BitVec 64)) Unit!42858)

(assert (=> b!1299351 (= lt!580855 (addApplyDifferent!545 lt!580863 lt!580850 minValue!1387 lt!580857))))

(assert (=> b!1299351 (= (apply!1007 (+!4476 lt!580863 (tuple2!22573 lt!580850 minValue!1387)) lt!580857) (apply!1007 lt!580863 lt!580857))))

(declare-fun lt!580861 () Unit!42858)

(assert (=> b!1299351 (= lt!580861 lt!580855)))

(declare-fun lt!580852 () ListLongMap!20229)

(assert (=> b!1299351 (= lt!580852 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580851 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580854 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580854 (select (arr!41735 _keys!1741) from!2144))))

(declare-fun lt!580846 () Unit!42858)

(assert (=> b!1299351 (= lt!580846 (addApplyDifferent!545 lt!580852 lt!580851 zeroValue!1387 lt!580854))))

(assert (=> b!1299351 (= (apply!1007 (+!4476 lt!580852 (tuple2!22573 lt!580851 zeroValue!1387)) lt!580854) (apply!1007 lt!580852 lt!580854))))

(declare-fun lt!580843 () Unit!42858)

(assert (=> b!1299351 (= lt!580843 lt!580846)))

(declare-fun lt!580858 () ListLongMap!20229)

(assert (=> b!1299351 (= lt!580858 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580859 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580859 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580862 () (_ BitVec 64))

(assert (=> b!1299351 (= lt!580862 (select (arr!41735 _keys!1741) from!2144))))

(assert (=> b!1299351 (= lt!580853 (addApplyDifferent!545 lt!580858 lt!580859 minValue!1387 lt!580862))))

(assert (=> b!1299351 (= (apply!1007 (+!4476 lt!580858 (tuple2!22573 lt!580859 minValue!1387)) lt!580862) (apply!1007 lt!580858 lt!580862))))

(declare-fun b!1299352 () Bool)

(assert (=> b!1299352 (= e!741273 e!741277)))

(assert (=> b!1299352 (= c!124482 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63569 () Bool)

(assert (=> bm!63569 (= call!63569 call!63571)))

(declare-fun b!1299353 () Bool)

(assert (=> b!1299353 (= e!741268 (= (apply!1007 lt!580849 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1299354 () Bool)

(assert (=> b!1299354 (= e!741274 (not call!63570))))

(declare-fun b!1299355 () Bool)

(assert (=> b!1299355 (= e!741270 (validKeyInArray!0 (select (arr!41735 _keys!1741) from!2144)))))

(assert (= (and d!140991 c!124480) b!1299336))

(assert (= (and d!140991 (not c!124480)) b!1299352))

(assert (= (and b!1299352 c!124482) b!1299343))

(assert (= (and b!1299352 (not c!124482)) b!1299349))

(assert (= (and b!1299349 c!124483) b!1299350))

(assert (= (and b!1299349 (not c!124483)) b!1299346))

(assert (= (or b!1299350 b!1299346) bm!63569))

(assert (= (or b!1299343 bm!63569) bm!63563))

(assert (= (or b!1299343 b!1299350) bm!63567))

(assert (= (or b!1299336 bm!63563) bm!63564))

(assert (= (or b!1299336 bm!63567) bm!63568))

(assert (= (and d!140991 res!863492) b!1299341))

(assert (= (and d!140991 c!124479) b!1299351))

(assert (= (and d!140991 (not c!124479)) b!1299344))

(assert (= (and d!140991 res!863493) b!1299335))

(assert (= (and b!1299335 res!863485) b!1299355))

(assert (= (and b!1299335 (not res!863491)) b!1299342))

(assert (= (and b!1299342 res!863486) b!1299338))

(assert (= (and b!1299335 res!863489) b!1299339))

(assert (= (and b!1299339 c!124478) b!1299340))

(assert (= (and b!1299339 (not c!124478)) b!1299354))

(assert (= (and b!1299340 res!863490) b!1299337))

(assert (= (or b!1299340 b!1299354) bm!63565))

(assert (= (and b!1299339 res!863488) b!1299348))

(assert (= (and b!1299348 c!124481) b!1299345))

(assert (= (and b!1299348 (not c!124481)) b!1299347))

(assert (= (and b!1299345 res!863487) b!1299353))

(assert (= (or b!1299345 b!1299347) bm!63566))

(declare-fun b_lambda!23139 () Bool)

(assert (=> (not b_lambda!23139) (not b!1299338)))

(declare-fun t!43258 () Bool)

(declare-fun tb!11365 () Bool)

(assert (=> (and start!109690 (= defaultEntry!1448 defaultEntry!1448) t!43258) tb!11365))

(declare-fun result!23743 () Bool)

(assert (=> tb!11365 (= result!23743 tp_is_empty!34783)))

(assert (=> b!1299338 t!43258))

(declare-fun b_and!47227 () Bool)

(assert (= b_and!47221 (and (=> t!43258 result!23743) b_and!47227)))

(assert (=> b!1299341 m!1189971))

(assert (=> b!1299341 m!1189971))

(assert (=> b!1299341 m!1189973))

(declare-fun m!1190059 () Bool)

(assert (=> b!1299338 m!1190059))

(declare-fun m!1190061 () Bool)

(assert (=> b!1299338 m!1190061))

(assert (=> b!1299338 m!1190059))

(declare-fun m!1190063 () Bool)

(assert (=> b!1299338 m!1190063))

(assert (=> b!1299338 m!1189971))

(declare-fun m!1190065 () Bool)

(assert (=> b!1299338 m!1190065))

(assert (=> b!1299338 m!1190061))

(assert (=> b!1299338 m!1189971))

(declare-fun m!1190067 () Bool)

(assert (=> bm!63566 m!1190067))

(assert (=> b!1299355 m!1189971))

(assert (=> b!1299355 m!1189971))

(assert (=> b!1299355 m!1189973))

(declare-fun m!1190069 () Bool)

(assert (=> b!1299337 m!1190069))

(declare-fun m!1190071 () Bool)

(assert (=> b!1299336 m!1190071))

(assert (=> b!1299342 m!1189971))

(assert (=> b!1299342 m!1189971))

(declare-fun m!1190073 () Bool)

(assert (=> b!1299342 m!1190073))

(declare-fun m!1190075 () Bool)

(assert (=> b!1299353 m!1190075))

(declare-fun m!1190077 () Bool)

(assert (=> bm!63568 m!1190077))

(assert (=> d!140991 m!1189979))

(declare-fun m!1190079 () Bool)

(assert (=> bm!63565 m!1190079))

(declare-fun m!1190081 () Bool)

(assert (=> b!1299351 m!1190081))

(declare-fun m!1190083 () Bool)

(assert (=> b!1299351 m!1190083))

(declare-fun m!1190085 () Bool)

(assert (=> b!1299351 m!1190085))

(declare-fun m!1190087 () Bool)

(assert (=> b!1299351 m!1190087))

(assert (=> b!1299351 m!1190085))

(declare-fun m!1190089 () Bool)

(assert (=> b!1299351 m!1190089))

(declare-fun m!1190091 () Bool)

(assert (=> b!1299351 m!1190091))

(declare-fun m!1190093 () Bool)

(assert (=> b!1299351 m!1190093))

(declare-fun m!1190095 () Bool)

(assert (=> b!1299351 m!1190095))

(declare-fun m!1190097 () Bool)

(assert (=> b!1299351 m!1190097))

(assert (=> b!1299351 m!1189987))

(declare-fun m!1190099 () Bool)

(assert (=> b!1299351 m!1190099))

(assert (=> b!1299351 m!1190081))

(declare-fun m!1190101 () Bool)

(assert (=> b!1299351 m!1190101))

(declare-fun m!1190103 () Bool)

(assert (=> b!1299351 m!1190103))

(declare-fun m!1190105 () Bool)

(assert (=> b!1299351 m!1190105))

(declare-fun m!1190107 () Bool)

(assert (=> b!1299351 m!1190107))

(assert (=> b!1299351 m!1190089))

(declare-fun m!1190109 () Bool)

(assert (=> b!1299351 m!1190109))

(assert (=> b!1299351 m!1189971))

(assert (=> b!1299351 m!1190093))

(assert (=> bm!63564 m!1189987))

(assert (=> b!1299201 d!140991))

(declare-fun bm!63572 () Bool)

(declare-fun call!63575 () Bool)

(assert (=> bm!63572 (= call!63575 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1299366 () Bool)

(declare-fun e!741286 () Bool)

(declare-fun e!741285 () Bool)

(assert (=> b!1299366 (= e!741286 e!741285)))

(declare-fun c!124486 () Bool)

(assert (=> b!1299366 (= c!124486 (validKeyInArray!0 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299367 () Bool)

(assert (=> b!1299367 (= e!741285 call!63575)))

(declare-fun b!1299368 () Bool)

(declare-fun e!741287 () Bool)

(assert (=> b!1299368 (= e!741287 call!63575)))

(declare-fun d!140993 () Bool)

(declare-fun res!863498 () Bool)

(assert (=> d!140993 (=> res!863498 e!741286)))

(assert (=> d!140993 (= res!863498 (bvsge #b00000000000000000000000000000000 (size!42287 _keys!1741)))))

(assert (=> d!140993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741286)))

(declare-fun b!1299369 () Bool)

(assert (=> b!1299369 (= e!741285 e!741287)))

(declare-fun lt!580870 () (_ BitVec 64))

(assert (=> b!1299369 (= lt!580870 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!580872 () Unit!42858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86471 (_ BitVec 64) (_ BitVec 32)) Unit!42858)

(assert (=> b!1299369 (= lt!580872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580870 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1299369 (arrayContainsKey!0 _keys!1741 lt!580870 #b00000000000000000000000000000000)))

(declare-fun lt!580871 () Unit!42858)

(assert (=> b!1299369 (= lt!580871 lt!580872)))

(declare-fun res!863499 () Bool)

(declare-datatypes ((SeekEntryResult!10016 0))(
  ( (MissingZero!10016 (index!42435 (_ BitVec 32))) (Found!10016 (index!42436 (_ BitVec 32))) (Intermediate!10016 (undefined!10828 Bool) (index!42437 (_ BitVec 32)) (x!115426 (_ BitVec 32))) (Undefined!10016) (MissingVacant!10016 (index!42438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86471 (_ BitVec 32)) SeekEntryResult!10016)

(assert (=> b!1299369 (= res!863499 (= (seekEntryOrOpen!0 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10016 #b00000000000000000000000000000000)))))

(assert (=> b!1299369 (=> (not res!863499) (not e!741287))))

(assert (= (and d!140993 (not res!863498)) b!1299366))

(assert (= (and b!1299366 c!124486) b!1299369))

(assert (= (and b!1299366 (not c!124486)) b!1299367))

(assert (= (and b!1299369 res!863499) b!1299368))

(assert (= (or b!1299368 b!1299367) bm!63572))

(declare-fun m!1190111 () Bool)

(assert (=> bm!63572 m!1190111))

(declare-fun m!1190113 () Bool)

(assert (=> b!1299366 m!1190113))

(assert (=> b!1299366 m!1190113))

(declare-fun m!1190115 () Bool)

(assert (=> b!1299366 m!1190115))

(assert (=> b!1299369 m!1190113))

(declare-fun m!1190117 () Bool)

(assert (=> b!1299369 m!1190117))

(declare-fun m!1190119 () Bool)

(assert (=> b!1299369 m!1190119))

(assert (=> b!1299369 m!1190113))

(declare-fun m!1190121 () Bool)

(assert (=> b!1299369 m!1190121))

(assert (=> b!1299211 d!140993))

(declare-fun d!140995 () Bool)

(assert (=> d!140995 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109690 d!140995))

(declare-fun d!140997 () Bool)

(assert (=> d!140997 (= (array_inv!31745 _values!1445) (bvsge (size!42288 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109690 d!140997))

(declare-fun d!140999 () Bool)

(assert (=> d!140999 (= (array_inv!31746 _keys!1741) (bvsge (size!42287 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109690 d!140999))

(declare-fun d!141001 () Bool)

(declare-fun e!741289 () Bool)

(assert (=> d!141001 e!741289))

(declare-fun res!863500 () Bool)

(assert (=> d!141001 (=> res!863500 e!741289)))

(declare-fun lt!580876 () Bool)

(assert (=> d!141001 (= res!863500 (not lt!580876))))

(declare-fun lt!580874 () Bool)

(assert (=> d!141001 (= lt!580876 lt!580874)))

(declare-fun lt!580875 () Unit!42858)

(declare-fun e!741288 () Unit!42858)

(assert (=> d!141001 (= lt!580875 e!741288)))

(declare-fun c!124487 () Bool)

(assert (=> d!141001 (= c!124487 lt!580874)))

(assert (=> d!141001 (= lt!580874 (containsKey!717 (toList!10130 (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141001 (= (contains!8180 (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!580876)))

(declare-fun b!1299370 () Bool)

(declare-fun lt!580873 () Unit!42858)

(assert (=> b!1299370 (= e!741288 lt!580873)))

(assert (=> b!1299370 (= lt!580873 (lemmaContainsKeyImpliesGetValueByKeyDefined!464 (toList!10130 (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1299370 (isDefined!507 (getValueByKey!700 (toList!10130 (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1299371 () Bool)

(declare-fun Unit!42862 () Unit!42858)

(assert (=> b!1299371 (= e!741288 Unit!42862)))

(declare-fun b!1299372 () Bool)

(assert (=> b!1299372 (= e!741289 (isDefined!507 (getValueByKey!700 (toList!10130 (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141001 c!124487) b!1299370))

(assert (= (and d!141001 (not c!124487)) b!1299371))

(assert (= (and d!141001 (not res!863500)) b!1299372))

(declare-fun m!1190123 () Bool)

(assert (=> d!141001 m!1190123))

(declare-fun m!1190125 () Bool)

(assert (=> b!1299370 m!1190125))

(declare-fun m!1190127 () Bool)

(assert (=> b!1299370 m!1190127))

(assert (=> b!1299370 m!1190127))

(declare-fun m!1190129 () Bool)

(assert (=> b!1299370 m!1190129))

(assert (=> b!1299372 m!1190127))

(assert (=> b!1299372 m!1190127))

(assert (=> b!1299372 m!1190129))

(assert (=> b!1299204 d!141001))

(declare-fun d!141003 () Bool)

(declare-fun e!741292 () Bool)

(assert (=> d!141003 e!741292))

(declare-fun res!863506 () Bool)

(assert (=> d!141003 (=> (not res!863506) (not e!741292))))

(declare-fun lt!580886 () ListLongMap!20229)

(assert (=> d!141003 (= res!863506 (contains!8180 lt!580886 (_1!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!580888 () List!29693)

(assert (=> d!141003 (= lt!580886 (ListLongMap!20230 lt!580888))))

(declare-fun lt!580885 () Unit!42858)

(declare-fun lt!580887 () Unit!42858)

(assert (=> d!141003 (= lt!580885 lt!580887)))

(assert (=> d!141003 (= (getValueByKey!700 lt!580888 (_1!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!750 (_2!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!344 (List!29693 (_ BitVec 64) V!51481) Unit!42858)

(assert (=> d!141003 (= lt!580887 (lemmaContainsTupThenGetReturnValue!344 lt!580888 (_1!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!473 (List!29693 (_ BitVec 64) V!51481) List!29693)

(assert (=> d!141003 (= lt!580888 (insertStrictlySorted!473 (toList!10130 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (_1!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141003 (= (+!4476 (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!580886)))

(declare-fun b!1299377 () Bool)

(declare-fun res!863505 () Bool)

(assert (=> b!1299377 (=> (not res!863505) (not e!741292))))

(assert (=> b!1299377 (= res!863505 (= (getValueByKey!700 (toList!10130 lt!580886) (_1!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!750 (_2!11297 (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1299378 () Bool)

(declare-fun contains!8183 (List!29693 tuple2!22572) Bool)

(assert (=> b!1299378 (= e!741292 (contains!8183 (toList!10130 lt!580886) (tuple2!22573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141003 res!863506) b!1299377))

(assert (= (and b!1299377 res!863505) b!1299378))

(declare-fun m!1190131 () Bool)

(assert (=> d!141003 m!1190131))

(declare-fun m!1190133 () Bool)

(assert (=> d!141003 m!1190133))

(declare-fun m!1190135 () Bool)

(assert (=> d!141003 m!1190135))

(declare-fun m!1190137 () Bool)

(assert (=> d!141003 m!1190137))

(declare-fun m!1190139 () Bool)

(assert (=> b!1299377 m!1190139))

(declare-fun m!1190141 () Bool)

(assert (=> b!1299378 m!1190141))

(assert (=> b!1299204 d!141003))

(declare-fun d!141005 () Bool)

(declare-fun e!741293 () Bool)

(assert (=> d!141005 e!741293))

(declare-fun res!863508 () Bool)

(assert (=> d!141005 (=> (not res!863508) (not e!741293))))

(declare-fun lt!580890 () ListLongMap!20229)

(assert (=> d!141005 (= res!863508 (contains!8180 lt!580890 (_1!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!580892 () List!29693)

(assert (=> d!141005 (= lt!580890 (ListLongMap!20230 lt!580892))))

(declare-fun lt!580889 () Unit!42858)

(declare-fun lt!580891 () Unit!42858)

(assert (=> d!141005 (= lt!580889 lt!580891)))

(assert (=> d!141005 (= (getValueByKey!700 lt!580892 (_1!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!750 (_2!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141005 (= lt!580891 (lemmaContainsTupThenGetReturnValue!344 lt!580892 (_1!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141005 (= lt!580892 (insertStrictlySorted!473 (toList!10130 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141005 (= (+!4476 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!580890)))

(declare-fun b!1299379 () Bool)

(declare-fun res!863507 () Bool)

(assert (=> b!1299379 (=> (not res!863507) (not e!741293))))

(assert (=> b!1299379 (= res!863507 (= (getValueByKey!700 (toList!10130 lt!580890) (_1!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!750 (_2!11297 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1299380 () Bool)

(assert (=> b!1299380 (= e!741293 (contains!8183 (toList!10130 lt!580890) (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141005 res!863508) b!1299379))

(assert (= (and b!1299379 res!863507) b!1299380))

(declare-fun m!1190143 () Bool)

(assert (=> d!141005 m!1190143))

(declare-fun m!1190145 () Bool)

(assert (=> d!141005 m!1190145))

(declare-fun m!1190147 () Bool)

(assert (=> d!141005 m!1190147))

(declare-fun m!1190149 () Bool)

(assert (=> d!141005 m!1190149))

(declare-fun m!1190151 () Bool)

(assert (=> b!1299379 m!1190151))

(declare-fun m!1190153 () Bool)

(assert (=> b!1299380 m!1190153))

(assert (=> b!1299204 d!141005))

(declare-fun b!1299405 () Bool)

(declare-fun res!863518 () Bool)

(declare-fun e!741309 () Bool)

(assert (=> b!1299405 (=> (not res!863518) (not e!741309))))

(declare-fun lt!580910 () ListLongMap!20229)

(assert (=> b!1299405 (= res!863518 (not (contains!8180 lt!580910 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1299406 () Bool)

(declare-fun e!741314 () Bool)

(assert (=> b!1299406 (= e!741314 (validKeyInArray!0 (select (arr!41735 _keys!1741) from!2144)))))

(assert (=> b!1299406 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1299407 () Bool)

(declare-fun e!741310 () Bool)

(assert (=> b!1299407 (= e!741309 e!741310)))

(declare-fun c!124496 () Bool)

(assert (=> b!1299407 (= c!124496 e!741314)))

(declare-fun res!863520 () Bool)

(assert (=> b!1299407 (=> (not res!863520) (not e!741314))))

(assert (=> b!1299407 (= res!863520 (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun b!1299408 () Bool)

(declare-fun e!741313 () Bool)

(assert (=> b!1299408 (= e!741310 e!741313)))

(declare-fun c!124497 () Bool)

(assert (=> b!1299408 (= c!124497 (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun b!1299409 () Bool)

(declare-fun e!741311 () ListLongMap!20229)

(assert (=> b!1299409 (= e!741311 (ListLongMap!20230 Nil!29690))))

(declare-fun b!1299410 () Bool)

(assert (=> b!1299410 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42287 _keys!1741)))))

(assert (=> b!1299410 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42288 _values!1445)))))

(declare-fun e!741312 () Bool)

(assert (=> b!1299410 (= e!741312 (= (apply!1007 lt!580910 (select (arr!41735 _keys!1741) from!2144)) (get!21107 (select (arr!41736 _values!1445) from!2144) (dynLambda!3442 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!63578 () ListLongMap!20229)

(declare-fun bm!63575 () Bool)

(assert (=> bm!63575 (= call!63578 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1299411 () Bool)

(declare-fun e!741308 () ListLongMap!20229)

(assert (=> b!1299411 (= e!741308 call!63578)))

(declare-fun b!1299412 () Bool)

(assert (=> b!1299412 (= e!741311 e!741308)))

(declare-fun c!124499 () Bool)

(assert (=> b!1299412 (= c!124499 (validKeyInArray!0 (select (arr!41735 _keys!1741) from!2144)))))

(declare-fun d!141007 () Bool)

(assert (=> d!141007 e!741309))

(declare-fun res!863517 () Bool)

(assert (=> d!141007 (=> (not res!863517) (not e!741309))))

(assert (=> d!141007 (= res!863517 (not (contains!8180 lt!580910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141007 (= lt!580910 e!741311)))

(declare-fun c!124498 () Bool)

(assert (=> d!141007 (= c!124498 (bvsge from!2144 (size!42287 _keys!1741)))))

(assert (=> d!141007 (validMask!0 mask!2175)))

(assert (=> d!141007 (= (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!580910)))

(declare-fun b!1299413 () Bool)

(declare-fun lt!580913 () Unit!42858)

(declare-fun lt!580907 () Unit!42858)

(assert (=> b!1299413 (= lt!580913 lt!580907)))

(declare-fun lt!580911 () V!51481)

(declare-fun lt!580908 () (_ BitVec 64))

(declare-fun lt!580909 () ListLongMap!20229)

(declare-fun lt!580912 () (_ BitVec 64))

(assert (=> b!1299413 (not (contains!8180 (+!4476 lt!580909 (tuple2!22573 lt!580908 lt!580911)) lt!580912))))

(declare-fun addStillNotContains!450 (ListLongMap!20229 (_ BitVec 64) V!51481 (_ BitVec 64)) Unit!42858)

(assert (=> b!1299413 (= lt!580907 (addStillNotContains!450 lt!580909 lt!580908 lt!580911 lt!580912))))

(assert (=> b!1299413 (= lt!580912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1299413 (= lt!580911 (get!21107 (select (arr!41736 _values!1445) from!2144) (dynLambda!3442 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1299413 (= lt!580908 (select (arr!41735 _keys!1741) from!2144))))

(assert (=> b!1299413 (= lt!580909 call!63578)))

(assert (=> b!1299413 (= e!741308 (+!4476 call!63578 (tuple2!22573 (select (arr!41735 _keys!1741) from!2144) (get!21107 (select (arr!41736 _values!1445) from!2144) (dynLambda!3442 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1299414 () Bool)

(declare-fun isEmpty!1056 (ListLongMap!20229) Bool)

(assert (=> b!1299414 (= e!741313 (isEmpty!1056 lt!580910))))

(declare-fun b!1299415 () Bool)

(assert (=> b!1299415 (= e!741310 e!741312)))

(assert (=> b!1299415 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42287 _keys!1741)))))

(declare-fun res!863519 () Bool)

(assert (=> b!1299415 (= res!863519 (contains!8180 lt!580910 (select (arr!41735 _keys!1741) from!2144)))))

(assert (=> b!1299415 (=> (not res!863519) (not e!741312))))

(declare-fun b!1299416 () Bool)

(assert (=> b!1299416 (= e!741313 (= lt!580910 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(assert (= (and d!141007 c!124498) b!1299409))

(assert (= (and d!141007 (not c!124498)) b!1299412))

(assert (= (and b!1299412 c!124499) b!1299413))

(assert (= (and b!1299412 (not c!124499)) b!1299411))

(assert (= (or b!1299413 b!1299411) bm!63575))

(assert (= (and d!141007 res!863517) b!1299405))

(assert (= (and b!1299405 res!863518) b!1299407))

(assert (= (and b!1299407 res!863520) b!1299406))

(assert (= (and b!1299407 c!124496) b!1299415))

(assert (= (and b!1299407 (not c!124496)) b!1299408))

(assert (= (and b!1299415 res!863519) b!1299410))

(assert (= (and b!1299408 c!124497) b!1299416))

(assert (= (and b!1299408 (not c!124497)) b!1299414))

(declare-fun b_lambda!23141 () Bool)

(assert (=> (not b_lambda!23141) (not b!1299410)))

(assert (=> b!1299410 t!43258))

(declare-fun b_and!47229 () Bool)

(assert (= b_and!47227 (and (=> t!43258 result!23743) b_and!47229)))

(declare-fun b_lambda!23143 () Bool)

(assert (=> (not b_lambda!23143) (not b!1299413)))

(assert (=> b!1299413 t!43258))

(declare-fun b_and!47231 () Bool)

(assert (= b_and!47229 (and (=> t!43258 result!23743) b_and!47231)))

(declare-fun m!1190155 () Bool)

(assert (=> d!141007 m!1190155))

(assert (=> d!141007 m!1189979))

(assert (=> b!1299410 m!1190059))

(assert (=> b!1299410 m!1190061))

(assert (=> b!1299410 m!1190059))

(assert (=> b!1299410 m!1190063))

(assert (=> b!1299410 m!1189971))

(assert (=> b!1299410 m!1190061))

(assert (=> b!1299410 m!1189971))

(declare-fun m!1190157 () Bool)

(assert (=> b!1299410 m!1190157))

(declare-fun m!1190159 () Bool)

(assert (=> b!1299416 m!1190159))

(declare-fun m!1190161 () Bool)

(assert (=> b!1299414 m!1190161))

(declare-fun m!1190163 () Bool)

(assert (=> b!1299413 m!1190163))

(declare-fun m!1190165 () Bool)

(assert (=> b!1299413 m!1190165))

(assert (=> b!1299413 m!1190059))

(assert (=> b!1299413 m!1190061))

(assert (=> b!1299413 m!1190059))

(assert (=> b!1299413 m!1190063))

(assert (=> b!1299413 m!1190061))

(assert (=> b!1299413 m!1189971))

(declare-fun m!1190167 () Bool)

(assert (=> b!1299413 m!1190167))

(declare-fun m!1190169 () Bool)

(assert (=> b!1299413 m!1190169))

(assert (=> b!1299413 m!1190163))

(assert (=> b!1299406 m!1189971))

(assert (=> b!1299406 m!1189971))

(assert (=> b!1299406 m!1189973))

(assert (=> b!1299412 m!1189971))

(assert (=> b!1299412 m!1189971))

(assert (=> b!1299412 m!1189973))

(assert (=> b!1299415 m!1189971))

(assert (=> b!1299415 m!1189971))

(declare-fun m!1190171 () Bool)

(assert (=> b!1299415 m!1190171))

(declare-fun m!1190173 () Bool)

(assert (=> b!1299405 m!1190173))

(assert (=> bm!63575 m!1190159))

(assert (=> b!1299204 d!141007))

(declare-fun b!1299427 () Bool)

(declare-fun e!741326 () Bool)

(declare-fun call!63581 () Bool)

(assert (=> b!1299427 (= e!741326 call!63581)))

(declare-fun b!1299428 () Bool)

(declare-fun e!741324 () Bool)

(assert (=> b!1299428 (= e!741324 e!741326)))

(declare-fun c!124502 () Bool)

(assert (=> b!1299428 (= c!124502 (validKeyInArray!0 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141009 () Bool)

(declare-fun res!863528 () Bool)

(declare-fun e!741323 () Bool)

(assert (=> d!141009 (=> res!863528 e!741323)))

(assert (=> d!141009 (= res!863528 (bvsge #b00000000000000000000000000000000 (size!42287 _keys!1741)))))

(assert (=> d!141009 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29689) e!741323)))

(declare-fun bm!63578 () Bool)

(assert (=> bm!63578 (= call!63581 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124502 (Cons!29688 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000) Nil!29689) Nil!29689)))))

(declare-fun b!1299429 () Bool)

(assert (=> b!1299429 (= e!741326 call!63581)))

(declare-fun b!1299430 () Bool)

(assert (=> b!1299430 (= e!741323 e!741324)))

(declare-fun res!863527 () Bool)

(assert (=> b!1299430 (=> (not res!863527) (not e!741324))))

(declare-fun e!741325 () Bool)

(assert (=> b!1299430 (= res!863527 (not e!741325))))

(declare-fun res!863529 () Bool)

(assert (=> b!1299430 (=> (not res!863529) (not e!741325))))

(assert (=> b!1299430 (= res!863529 (validKeyInArray!0 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299431 () Bool)

(declare-fun contains!8184 (List!29692 (_ BitVec 64)) Bool)

(assert (=> b!1299431 (= e!741325 (contains!8184 Nil!29689 (select (arr!41735 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141009 (not res!863528)) b!1299430))

(assert (= (and b!1299430 res!863529) b!1299431))

(assert (= (and b!1299430 res!863527) b!1299428))

(assert (= (and b!1299428 c!124502) b!1299427))

(assert (= (and b!1299428 (not c!124502)) b!1299429))

(assert (= (or b!1299427 b!1299429) bm!63578))

(assert (=> b!1299428 m!1190113))

(assert (=> b!1299428 m!1190113))

(assert (=> b!1299428 m!1190115))

(assert (=> bm!63578 m!1190113))

(declare-fun m!1190175 () Bool)

(assert (=> bm!63578 m!1190175))

(assert (=> b!1299430 m!1190113))

(assert (=> b!1299430 m!1190113))

(assert (=> b!1299430 m!1190115))

(assert (=> b!1299431 m!1190113))

(assert (=> b!1299431 m!1190113))

(declare-fun m!1190177 () Bool)

(assert (=> b!1299431 m!1190177))

(assert (=> b!1299200 d!141009))

(declare-fun b!1299439 () Bool)

(declare-fun e!741332 () Bool)

(assert (=> b!1299439 (= e!741332 tp_is_empty!34783)))

(declare-fun mapNonEmpty!53750 () Bool)

(declare-fun mapRes!53750 () Bool)

(declare-fun tp!102570 () Bool)

(declare-fun e!741331 () Bool)

(assert (=> mapNonEmpty!53750 (= mapRes!53750 (and tp!102570 e!741331))))

(declare-fun mapValue!53750 () ValueCell!16493)

(declare-fun mapRest!53750 () (Array (_ BitVec 32) ValueCell!16493))

(declare-fun mapKey!53750 () (_ BitVec 32))

(assert (=> mapNonEmpty!53750 (= mapRest!53741 (store mapRest!53750 mapKey!53750 mapValue!53750))))

(declare-fun condMapEmpty!53750 () Bool)

(declare-fun mapDefault!53750 () ValueCell!16493)

(assert (=> mapNonEmpty!53741 (= condMapEmpty!53750 (= mapRest!53741 ((as const (Array (_ BitVec 32) ValueCell!16493)) mapDefault!53750)))))

(assert (=> mapNonEmpty!53741 (= tp!102555 (and e!741332 mapRes!53750))))

(declare-fun mapIsEmpty!53750 () Bool)

(assert (=> mapIsEmpty!53750 mapRes!53750))

(declare-fun b!1299438 () Bool)

(assert (=> b!1299438 (= e!741331 tp_is_empty!34783)))

(assert (= (and mapNonEmpty!53741 condMapEmpty!53750) mapIsEmpty!53750))

(assert (= (and mapNonEmpty!53741 (not condMapEmpty!53750)) mapNonEmpty!53750))

(assert (= (and mapNonEmpty!53750 ((_ is ValueCellFull!16493) mapValue!53750)) b!1299438))

(assert (= (and mapNonEmpty!53741 ((_ is ValueCellFull!16493) mapDefault!53750)) b!1299439))

(declare-fun m!1190179 () Bool)

(assert (=> mapNonEmpty!53750 m!1190179))

(declare-fun b_lambda!23145 () Bool)

(assert (= b_lambda!23143 (or (and start!109690 b_free!29143) b_lambda!23145)))

(declare-fun b_lambda!23147 () Bool)

(assert (= b_lambda!23141 (or (and start!109690 b_free!29143) b_lambda!23147)))

(declare-fun b_lambda!23149 () Bool)

(assert (= b_lambda!23139 (or (and start!109690 b_free!29143) b_lambda!23149)))

(check-sat (not b!1299337) (not d!141005) (not b!1299377) (not b!1299405) (not b!1299336) (not b!1299380) (not b!1299431) (not b!1299292) (not bm!63566) (not bm!63565) (not b!1299342) (not b!1299406) (not b!1299372) (not b!1299366) (not b!1299370) (not b!1299412) (not b!1299341) (not b!1299415) (not bm!63575) (not b!1299351) (not bm!63578) (not b!1299353) (not b_lambda!23145) (not mapNonEmpty!53750) (not b!1299338) (not d!141007) (not b!1299430) (not bm!63572) (not b!1299414) (not b!1299355) (not b_lambda!23149) (not b!1299410) (not b_lambda!23147) (not b!1299378) (not b!1299413) (not bm!63568) (not d!141003) (not d!141001) (not d!140989) (not b_next!29143) tp_is_empty!34783 (not d!140991) (not b!1299290) (not b!1299369) (not b!1299416) b_and!47231 (not b!1299428) (not b!1299379) (not bm!63564))
(check-sat b_and!47231 (not b_next!29143))
