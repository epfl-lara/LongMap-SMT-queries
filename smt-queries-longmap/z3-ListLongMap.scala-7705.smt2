; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96762 () Bool)

(assert start!96762)

(declare-fun b_free!23157 () Bool)

(declare-fun b_next!23157 () Bool)

(assert (=> start!96762 (= b_free!23157 (not b_next!23157))))

(declare-fun tp!81419 () Bool)

(declare-fun b_and!37075 () Bool)

(assert (=> start!96762 (= tp!81419 b_and!37075)))

(declare-fun b!1100729 () Bool)

(declare-fun res!734528 () Bool)

(declare-fun e!628260 () Bool)

(assert (=> b!1100729 (=> (not res!734528) (not e!628260))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71333 0))(
  ( (array!71334 (arr!34331 (Array (_ BitVec 32) (_ BitVec 64))) (size!34867 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71333)

(assert (=> b!1100729 (= res!734528 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34867 _keys!1070))))))

(declare-datatypes ((V!41403 0))(
  ( (V!41404 (val!13660 Int)) )
))
(declare-fun minValue!831 () V!41403)

(declare-datatypes ((tuple2!17370 0))(
  ( (tuple2!17371 (_1!8696 (_ BitVec 64)) (_2!8696 V!41403)) )
))
(declare-datatypes ((List!23985 0))(
  ( (Nil!23982) (Cons!23981 (h!25190 tuple2!17370) (t!34188 List!23985)) )
))
(declare-datatypes ((ListLongMap!15339 0))(
  ( (ListLongMap!15340 (toList!7685 List!23985)) )
))
(declare-fun lt!493299 () ListLongMap!15339)

(declare-fun lt!493305 () ListLongMap!15339)

(declare-fun e!628255 () Bool)

(declare-fun b!1100730 () Bool)

(declare-fun +!3390 (ListLongMap!15339 tuple2!17370) ListLongMap!15339)

(assert (=> b!1100730 (= e!628255 (= lt!493305 (+!3390 lt!493299 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun mapNonEmpty!42592 () Bool)

(declare-fun mapRes!42592 () Bool)

(declare-fun tp!81418 () Bool)

(declare-fun e!628259 () Bool)

(assert (=> mapNonEmpty!42592 (= mapRes!42592 (and tp!81418 e!628259))))

(declare-datatypes ((ValueCell!12894 0))(
  ( (ValueCellFull!12894 (v!16288 V!41403)) (EmptyCell!12894) )
))
(declare-fun mapValue!42592 () ValueCell!12894)

(declare-datatypes ((array!71335 0))(
  ( (array!71336 (arr!34332 (Array (_ BitVec 32) ValueCell!12894)) (size!34868 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71335)

(declare-fun mapRest!42592 () (Array (_ BitVec 32) ValueCell!12894))

(declare-fun mapKey!42592 () (_ BitVec 32))

(assert (=> mapNonEmpty!42592 (= (arr!34332 _values!874) (store mapRest!42592 mapKey!42592 mapValue!42592))))

(declare-fun b!1100731 () Bool)

(declare-fun res!734536 () Bool)

(assert (=> b!1100731 (=> (not res!734536) (not e!628260))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100731 (= res!734536 (validKeyInArray!0 k0!904))))

(declare-fun b!1100732 () Bool)

(declare-fun e!628256 () Bool)

(declare-fun e!628254 () Bool)

(assert (=> b!1100732 (= e!628256 (and e!628254 mapRes!42592))))

(declare-fun condMapEmpty!42592 () Bool)

(declare-fun mapDefault!42592 () ValueCell!12894)

(assert (=> b!1100732 (= condMapEmpty!42592 (= (arr!34332 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12894)) mapDefault!42592)))))

(declare-fun mapIsEmpty!42592 () Bool)

(assert (=> mapIsEmpty!42592 mapRes!42592))

(declare-fun res!734534 () Bool)

(assert (=> start!96762 (=> (not res!734534) (not e!628260))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96762 (= res!734534 (validMask!0 mask!1414))))

(assert (=> start!96762 e!628260))

(assert (=> start!96762 tp!81419))

(assert (=> start!96762 true))

(declare-fun tp_is_empty!27207 () Bool)

(assert (=> start!96762 tp_is_empty!27207))

(declare-fun array_inv!26444 (array!71333) Bool)

(assert (=> start!96762 (array_inv!26444 _keys!1070)))

(declare-fun array_inv!26445 (array!71335) Bool)

(assert (=> start!96762 (and (array_inv!26445 _values!874) e!628256)))

(declare-fun b!1100733 () Bool)

(declare-fun res!734530 () Bool)

(assert (=> b!1100733 (=> (not res!734530) (not e!628260))))

(declare-datatypes ((List!23986 0))(
  ( (Nil!23983) (Cons!23982 (h!25191 (_ BitVec 64)) (t!34189 List!23986)) )
))
(declare-fun arrayNoDuplicates!0 (array!71333 (_ BitVec 32) List!23986) Bool)

(assert (=> b!1100733 (= res!734530 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23983))))

(declare-fun b!1100734 () Bool)

(declare-fun res!734529 () Bool)

(assert (=> b!1100734 (=> (not res!734529) (not e!628260))))

(assert (=> b!1100734 (= res!734529 (= (select (arr!34331 _keys!1070) i!650) k0!904))))

(declare-fun b!1100735 () Bool)

(assert (=> b!1100735 (= e!628254 tp_is_empty!27207)))

(declare-fun b!1100736 () Bool)

(declare-fun res!734531 () Bool)

(assert (=> b!1100736 (=> (not res!734531) (not e!628260))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100736 (= res!734531 (and (= (size!34868 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34867 _keys!1070) (size!34868 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100737 () Bool)

(assert (=> b!1100737 (= e!628259 tp_is_empty!27207)))

(declare-fun b!1100738 () Bool)

(declare-fun e!628257 () Bool)

(assert (=> b!1100738 (= e!628257 (not e!628255))))

(declare-fun res!734535 () Bool)

(assert (=> b!1100738 (=> res!734535 e!628255)))

(assert (=> b!1100738 (= res!734535 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!493303 () ListLongMap!15339)

(declare-fun zeroValue!831 () V!41403)

(declare-fun getCurrentListMap!4392 (array!71333 array!71335 (_ BitVec 32) (_ BitVec 32) V!41403 V!41403 (_ BitVec 32) Int) ListLongMap!15339)

(assert (=> b!1100738 (= lt!493303 (getCurrentListMap!4392 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493301 () array!71333)

(declare-fun lt!493300 () array!71335)

(assert (=> b!1100738 (= lt!493305 (getCurrentListMap!4392 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493302 () ListLongMap!15339)

(assert (=> b!1100738 (and (= lt!493299 lt!493302) (= lt!493302 lt!493299))))

(declare-fun lt!493298 () ListLongMap!15339)

(declare-fun -!970 (ListLongMap!15339 (_ BitVec 64)) ListLongMap!15339)

(assert (=> b!1100738 (= lt!493302 (-!970 lt!493298 k0!904))))

(declare-datatypes ((Unit!36186 0))(
  ( (Unit!36187) )
))
(declare-fun lt!493297 () Unit!36186)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!218 (array!71333 array!71335 (_ BitVec 32) (_ BitVec 32) V!41403 V!41403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36186)

(assert (=> b!1100738 (= lt!493297 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!218 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4188 (array!71333 array!71335 (_ BitVec 32) (_ BitVec 32) V!41403 V!41403 (_ BitVec 32) Int) ListLongMap!15339)

(assert (=> b!1100738 (= lt!493299 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2323 (Int (_ BitVec 64)) V!41403)

(assert (=> b!1100738 (= lt!493300 (array!71336 (store (arr!34332 _values!874) i!650 (ValueCellFull!12894 (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34868 _values!874)))))

(assert (=> b!1100738 (= lt!493298 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100738 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493304 () Unit!36186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71333 (_ BitVec 64) (_ BitVec 32)) Unit!36186)

(assert (=> b!1100738 (= lt!493304 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100739 () Bool)

(declare-fun res!734532 () Bool)

(assert (=> b!1100739 (=> (not res!734532) (not e!628257))))

(assert (=> b!1100739 (= res!734532 (arrayNoDuplicates!0 lt!493301 #b00000000000000000000000000000000 Nil!23983))))

(declare-fun b!1100740 () Bool)

(assert (=> b!1100740 (= e!628260 e!628257)))

(declare-fun res!734533 () Bool)

(assert (=> b!1100740 (=> (not res!734533) (not e!628257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71333 (_ BitVec 32)) Bool)

(assert (=> b!1100740 (= res!734533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493301 mask!1414))))

(assert (=> b!1100740 (= lt!493301 (array!71334 (store (arr!34331 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34867 _keys!1070)))))

(declare-fun b!1100741 () Bool)

(declare-fun res!734537 () Bool)

(assert (=> b!1100741 (=> (not res!734537) (not e!628260))))

(assert (=> b!1100741 (= res!734537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96762 res!734534) b!1100736))

(assert (= (and b!1100736 res!734531) b!1100741))

(assert (= (and b!1100741 res!734537) b!1100733))

(assert (= (and b!1100733 res!734530) b!1100729))

(assert (= (and b!1100729 res!734528) b!1100731))

(assert (= (and b!1100731 res!734536) b!1100734))

(assert (= (and b!1100734 res!734529) b!1100740))

(assert (= (and b!1100740 res!734533) b!1100739))

(assert (= (and b!1100739 res!734532) b!1100738))

(assert (= (and b!1100738 (not res!734535)) b!1100730))

(assert (= (and b!1100732 condMapEmpty!42592) mapIsEmpty!42592))

(assert (= (and b!1100732 (not condMapEmpty!42592)) mapNonEmpty!42592))

(get-info :version)

(assert (= (and mapNonEmpty!42592 ((_ is ValueCellFull!12894) mapValue!42592)) b!1100737))

(assert (= (and b!1100732 ((_ is ValueCellFull!12894) mapDefault!42592)) b!1100735))

(assert (= start!96762 b!1100732))

(declare-fun b_lambda!18025 () Bool)

(assert (=> (not b_lambda!18025) (not b!1100738)))

(declare-fun t!34187 () Bool)

(declare-fun tb!8023 () Bool)

(assert (=> (and start!96762 (= defaultEntry!882 defaultEntry!882) t!34187) tb!8023))

(declare-fun result!16583 () Bool)

(assert (=> tb!8023 (= result!16583 tp_is_empty!27207)))

(assert (=> b!1100738 t!34187))

(declare-fun b_and!37077 () Bool)

(assert (= b_and!37075 (and (=> t!34187 result!16583) b_and!37077)))

(declare-fun m!1020855 () Bool)

(assert (=> b!1100738 m!1020855))

(declare-fun m!1020857 () Bool)

(assert (=> b!1100738 m!1020857))

(declare-fun m!1020859 () Bool)

(assert (=> b!1100738 m!1020859))

(declare-fun m!1020861 () Bool)

(assert (=> b!1100738 m!1020861))

(declare-fun m!1020863 () Bool)

(assert (=> b!1100738 m!1020863))

(declare-fun m!1020865 () Bool)

(assert (=> b!1100738 m!1020865))

(declare-fun m!1020867 () Bool)

(assert (=> b!1100738 m!1020867))

(declare-fun m!1020869 () Bool)

(assert (=> b!1100738 m!1020869))

(declare-fun m!1020871 () Bool)

(assert (=> b!1100738 m!1020871))

(declare-fun m!1020873 () Bool)

(assert (=> b!1100738 m!1020873))

(declare-fun m!1020875 () Bool)

(assert (=> start!96762 m!1020875))

(declare-fun m!1020877 () Bool)

(assert (=> start!96762 m!1020877))

(declare-fun m!1020879 () Bool)

(assert (=> start!96762 m!1020879))

(declare-fun m!1020881 () Bool)

(assert (=> b!1100740 m!1020881))

(declare-fun m!1020883 () Bool)

(assert (=> b!1100740 m!1020883))

(declare-fun m!1020885 () Bool)

(assert (=> b!1100730 m!1020885))

(declare-fun m!1020887 () Bool)

(assert (=> mapNonEmpty!42592 m!1020887))

(declare-fun m!1020889 () Bool)

(assert (=> b!1100733 m!1020889))

(declare-fun m!1020891 () Bool)

(assert (=> b!1100739 m!1020891))

(declare-fun m!1020893 () Bool)

(assert (=> b!1100734 m!1020893))

(declare-fun m!1020895 () Bool)

(assert (=> b!1100741 m!1020895))

(declare-fun m!1020897 () Bool)

(assert (=> b!1100731 m!1020897))

(check-sat (not b!1100731) (not b!1100738) (not b!1100739) (not mapNonEmpty!42592) (not b!1100741) (not start!96762) (not b_next!23157) (not b!1100730) (not b!1100740) (not b_lambda!18025) b_and!37077 tp_is_empty!27207 (not b!1100733))
(check-sat b_and!37077 (not b_next!23157))
(get-model)

(declare-fun b_lambda!18029 () Bool)

(assert (= b_lambda!18025 (or (and start!96762 b_free!23157) b_lambda!18029)))

(check-sat (not b!1100731) (not b!1100738) (not b!1100739) (not mapNonEmpty!42592) (not b!1100741) (not start!96762) (not b_next!23157) (not b!1100730) (not b!1100740) b_and!37077 tp_is_empty!27207 (not b_lambda!18029) (not b!1100733))
(check-sat b_and!37077 (not b_next!23157))
(get-model)

(declare-fun d!130599 () Bool)

(declare-fun e!628284 () Bool)

(assert (=> d!130599 e!628284))

(declare-fun res!734573 () Bool)

(assert (=> d!130599 (=> (not res!734573) (not e!628284))))

(declare-fun lt!493342 () ListLongMap!15339)

(declare-fun contains!6398 (ListLongMap!15339 (_ BitVec 64)) Bool)

(assert (=> d!130599 (= res!734573 (contains!6398 lt!493342 (_1!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lt!493341 () List!23985)

(assert (=> d!130599 (= lt!493342 (ListLongMap!15340 lt!493341))))

(declare-fun lt!493343 () Unit!36186)

(declare-fun lt!493344 () Unit!36186)

(assert (=> d!130599 (= lt!493343 lt!493344)))

(declare-datatypes ((Option!676 0))(
  ( (Some!675 (v!16290 V!41403)) (None!674) )
))
(declare-fun getValueByKey!625 (List!23985 (_ BitVec 64)) Option!676)

(assert (=> d!130599 (= (getValueByKey!625 lt!493341 (_1!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!675 (_2!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!302 (List!23985 (_ BitVec 64) V!41403) Unit!36186)

(assert (=> d!130599 (= lt!493344 (lemmaContainsTupThenGetReturnValue!302 lt!493341 (_1!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun insertStrictlySorted!395 (List!23985 (_ BitVec 64) V!41403) List!23985)

(assert (=> d!130599 (= lt!493341 (insertStrictlySorted!395 (toList!7685 lt!493299) (_1!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (=> d!130599 (= (+!3390 lt!493299 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) lt!493342)))

(declare-fun b!1100789 () Bool)

(declare-fun res!734572 () Bool)

(assert (=> b!1100789 (=> (not res!734572) (not e!628284))))

(assert (=> b!1100789 (= res!734572 (= (getValueByKey!625 (toList!7685 lt!493342) (_1!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!675 (_2!8696 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))))

(declare-fun b!1100790 () Bool)

(declare-fun contains!6399 (List!23985 tuple2!17370) Bool)

(assert (=> b!1100790 (= e!628284 (contains!6399 (toList!7685 lt!493342) (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(assert (= (and d!130599 res!734573) b!1100789))

(assert (= (and b!1100789 res!734572) b!1100790))

(declare-fun m!1020943 () Bool)

(assert (=> d!130599 m!1020943))

(declare-fun m!1020945 () Bool)

(assert (=> d!130599 m!1020945))

(declare-fun m!1020947 () Bool)

(assert (=> d!130599 m!1020947))

(declare-fun m!1020949 () Bool)

(assert (=> d!130599 m!1020949))

(declare-fun m!1020951 () Bool)

(assert (=> b!1100789 m!1020951))

(declare-fun m!1020953 () Bool)

(assert (=> b!1100790 m!1020953))

(assert (=> b!1100730 d!130599))

(declare-fun d!130601 () Bool)

(declare-fun res!734580 () Bool)

(declare-fun e!628296 () Bool)

(assert (=> d!130601 (=> res!734580 e!628296)))

(assert (=> d!130601 (= res!734580 (bvsge #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(assert (=> d!130601 (= (arrayNoDuplicates!0 lt!493301 #b00000000000000000000000000000000 Nil!23983) e!628296)))

(declare-fun b!1100801 () Bool)

(declare-fun e!628294 () Bool)

(declare-fun call!46089 () Bool)

(assert (=> b!1100801 (= e!628294 call!46089)))

(declare-fun b!1100802 () Bool)

(declare-fun e!628295 () Bool)

(assert (=> b!1100802 (= e!628295 e!628294)))

(declare-fun c!108718 () Bool)

(assert (=> b!1100802 (= c!108718 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(declare-fun b!1100803 () Bool)

(assert (=> b!1100803 (= e!628294 call!46089)))

(declare-fun b!1100804 () Bool)

(declare-fun e!628293 () Bool)

(declare-fun contains!6400 (List!23986 (_ BitVec 64)) Bool)

(assert (=> b!1100804 (= e!628293 (contains!6400 Nil!23983 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(declare-fun b!1100805 () Bool)

(assert (=> b!1100805 (= e!628296 e!628295)))

(declare-fun res!734582 () Bool)

(assert (=> b!1100805 (=> (not res!734582) (not e!628295))))

(assert (=> b!1100805 (= res!734582 (not e!628293))))

(declare-fun res!734581 () Bool)

(assert (=> b!1100805 (=> (not res!734581) (not e!628293))))

(assert (=> b!1100805 (= res!734581 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(declare-fun bm!46086 () Bool)

(assert (=> bm!46086 (= call!46089 (arrayNoDuplicates!0 lt!493301 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108718 (Cons!23982 (select (arr!34331 lt!493301) #b00000000000000000000000000000000) Nil!23983) Nil!23983)))))

(assert (= (and d!130601 (not res!734580)) b!1100805))

(assert (= (and b!1100805 res!734581) b!1100804))

(assert (= (and b!1100805 res!734582) b!1100802))

(assert (= (and b!1100802 c!108718) b!1100803))

(assert (= (and b!1100802 (not c!108718)) b!1100801))

(assert (= (or b!1100803 b!1100801) bm!46086))

(declare-fun m!1020955 () Bool)

(assert (=> b!1100802 m!1020955))

(assert (=> b!1100802 m!1020955))

(declare-fun m!1020957 () Bool)

(assert (=> b!1100802 m!1020957))

(assert (=> b!1100804 m!1020955))

(assert (=> b!1100804 m!1020955))

(declare-fun m!1020959 () Bool)

(assert (=> b!1100804 m!1020959))

(assert (=> b!1100805 m!1020955))

(assert (=> b!1100805 m!1020955))

(assert (=> b!1100805 m!1020957))

(assert (=> bm!46086 m!1020955))

(declare-fun m!1020961 () Bool)

(assert (=> bm!46086 m!1020961))

(assert (=> b!1100739 d!130601))

(declare-fun bm!46101 () Bool)

(declare-fun call!46106 () ListLongMap!15339)

(declare-fun call!46105 () ListLongMap!15339)

(assert (=> bm!46101 (= call!46106 call!46105)))

(declare-fun b!1100848 () Bool)

(declare-fun e!628332 () Bool)

(declare-fun call!46108 () Bool)

(assert (=> b!1100848 (= e!628332 (not call!46108))))

(declare-fun b!1100849 () Bool)

(declare-fun e!628330 () ListLongMap!15339)

(declare-fun call!46107 () ListLongMap!15339)

(assert (=> b!1100849 (= e!628330 (+!3390 call!46107 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100851 () Bool)

(declare-fun e!628331 () Bool)

(assert (=> b!1100851 (= e!628332 e!628331)))

(declare-fun res!734605 () Bool)

(assert (=> b!1100851 (= res!734605 call!46108)))

(assert (=> b!1100851 (=> (not res!734605) (not e!628331))))

(declare-fun b!1100852 () Bool)

(declare-fun e!628333 () ListLongMap!15339)

(declare-fun call!46104 () ListLongMap!15339)

(assert (=> b!1100852 (= e!628333 call!46104)))

(declare-fun b!1100853 () Bool)

(declare-fun lt!493410 () ListLongMap!15339)

(declare-fun apply!950 (ListLongMap!15339 (_ BitVec 64)) V!41403)

(assert (=> b!1100853 (= e!628331 (= (apply!950 lt!493410 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100854 () Bool)

(declare-fun e!628334 () Bool)

(declare-fun call!46110 () Bool)

(assert (=> b!1100854 (= e!628334 (not call!46110))))

(declare-fun bm!46102 () Bool)

(assert (=> bm!46102 (= call!46104 call!46107)))

(declare-fun b!1100855 () Bool)

(declare-fun res!734604 () Bool)

(declare-fun e!628324 () Bool)

(assert (=> b!1100855 (=> (not res!734604) (not e!628324))))

(assert (=> b!1100855 (= res!734604 e!628332)))

(declare-fun c!108731 () Bool)

(assert (=> b!1100855 (= c!108731 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100856 () Bool)

(declare-fun e!628325 () Bool)

(assert (=> b!1100856 (= e!628334 e!628325)))

(declare-fun res!734602 () Bool)

(assert (=> b!1100856 (= res!734602 call!46110)))

(assert (=> b!1100856 (=> (not res!734602) (not e!628325))))

(declare-fun b!1100857 () Bool)

(declare-fun res!734609 () Bool)

(assert (=> b!1100857 (=> (not res!734609) (not e!628324))))

(declare-fun e!628323 () Bool)

(assert (=> b!1100857 (= res!734609 e!628323)))

(declare-fun res!734601 () Bool)

(assert (=> b!1100857 (=> res!734601 e!628323)))

(declare-fun e!628328 () Bool)

(assert (=> b!1100857 (= res!734601 (not e!628328))))

(declare-fun res!734608 () Bool)

(assert (=> b!1100857 (=> (not res!734608) (not e!628328))))

(assert (=> b!1100857 (= res!734608 (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(declare-fun b!1100858 () Bool)

(declare-fun e!628327 () ListLongMap!15339)

(assert (=> b!1100858 (= e!628327 call!46104)))

(declare-fun b!1100859 () Bool)

(declare-fun e!628335 () Unit!36186)

(declare-fun Unit!36188 () Unit!36186)

(assert (=> b!1100859 (= e!628335 Unit!36188)))

(declare-fun bm!46103 () Bool)

(assert (=> bm!46103 (= call!46110 (contains!6398 lt!493410 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100860 () Bool)

(assert (=> b!1100860 (= e!628330 e!628327)))

(declare-fun c!108734 () Bool)

(assert (=> b!1100860 (= c!108734 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100861 () Bool)

(declare-fun c!108736 () Bool)

(assert (=> b!1100861 (= c!108736 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100861 (= e!628327 e!628333)))

(declare-fun b!1100862 () Bool)

(declare-fun call!46109 () ListLongMap!15339)

(assert (=> b!1100862 (= e!628333 call!46109)))

(declare-fun b!1100863 () Bool)

(assert (=> b!1100863 (= e!628325 (= (apply!950 lt!493410 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun d!130603 () Bool)

(assert (=> d!130603 e!628324))

(declare-fun res!734606 () Bool)

(assert (=> d!130603 (=> (not res!734606) (not e!628324))))

(assert (=> d!130603 (= res!734606 (or (bvsge #b00000000000000000000000000000000 (size!34867 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))))

(declare-fun lt!493395 () ListLongMap!15339)

(assert (=> d!130603 (= lt!493410 lt!493395)))

(declare-fun lt!493396 () Unit!36186)

(assert (=> d!130603 (= lt!493396 e!628335)))

(declare-fun c!108732 () Bool)

(declare-fun e!628326 () Bool)

(assert (=> d!130603 (= c!108732 e!628326)))

(declare-fun res!734607 () Bool)

(assert (=> d!130603 (=> (not res!734607) (not e!628326))))

(assert (=> d!130603 (= res!734607 (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(assert (=> d!130603 (= lt!493395 e!628330)))

(declare-fun c!108733 () Bool)

(assert (=> d!130603 (= c!108733 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130603 (validMask!0 mask!1414)))

(assert (=> d!130603 (= (getCurrentListMap!4392 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493410)))

(declare-fun b!1100850 () Bool)

(declare-fun e!628329 () Bool)

(assert (=> b!1100850 (= e!628323 e!628329)))

(declare-fun res!734603 () Bool)

(assert (=> b!1100850 (=> (not res!734603) (not e!628329))))

(assert (=> b!1100850 (= res!734603 (contains!6398 lt!493410 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(declare-fun bm!46104 () Bool)

(assert (=> bm!46104 (= call!46108 (contains!6398 lt!493410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46105 () Bool)

(assert (=> bm!46105 (= call!46107 (+!3390 (ite c!108733 call!46105 (ite c!108734 call!46106 call!46109)) (ite (or c!108733 c!108734) (tuple2!17371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100864 () Bool)

(assert (=> b!1100864 (= e!628324 e!628334)))

(declare-fun c!108735 () Bool)

(assert (=> b!1100864 (= c!108735 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100865 () Bool)

(declare-fun lt!493402 () Unit!36186)

(assert (=> b!1100865 (= e!628335 lt!493402)))

(declare-fun lt!493399 () ListLongMap!15339)

(assert (=> b!1100865 (= lt!493399 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493406 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493390 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493390 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493407 () Unit!36186)

(declare-fun addStillContains!663 (ListLongMap!15339 (_ BitVec 64) V!41403 (_ BitVec 64)) Unit!36186)

(assert (=> b!1100865 (= lt!493407 (addStillContains!663 lt!493399 lt!493406 zeroValue!831 lt!493390))))

(assert (=> b!1100865 (contains!6398 (+!3390 lt!493399 (tuple2!17371 lt!493406 zeroValue!831)) lt!493390)))

(declare-fun lt!493393 () Unit!36186)

(assert (=> b!1100865 (= lt!493393 lt!493407)))

(declare-fun lt!493400 () ListLongMap!15339)

(assert (=> b!1100865 (= lt!493400 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493397 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493397 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493409 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493409 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493389 () Unit!36186)

(declare-fun addApplyDifferent!523 (ListLongMap!15339 (_ BitVec 64) V!41403 (_ BitVec 64)) Unit!36186)

(assert (=> b!1100865 (= lt!493389 (addApplyDifferent!523 lt!493400 lt!493397 minValue!831 lt!493409))))

(assert (=> b!1100865 (= (apply!950 (+!3390 lt!493400 (tuple2!17371 lt!493397 minValue!831)) lt!493409) (apply!950 lt!493400 lt!493409))))

(declare-fun lt!493392 () Unit!36186)

(assert (=> b!1100865 (= lt!493392 lt!493389)))

(declare-fun lt!493404 () ListLongMap!15339)

(assert (=> b!1100865 (= lt!493404 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493394 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493401 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493401 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493408 () Unit!36186)

(assert (=> b!1100865 (= lt!493408 (addApplyDifferent!523 lt!493404 lt!493394 zeroValue!831 lt!493401))))

(assert (=> b!1100865 (= (apply!950 (+!3390 lt!493404 (tuple2!17371 lt!493394 zeroValue!831)) lt!493401) (apply!950 lt!493404 lt!493401))))

(declare-fun lt!493398 () Unit!36186)

(assert (=> b!1100865 (= lt!493398 lt!493408)))

(declare-fun lt!493405 () ListLongMap!15339)

(assert (=> b!1100865 (= lt!493405 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493391 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493391 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493403 () (_ BitVec 64))

(assert (=> b!1100865 (= lt!493403 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100865 (= lt!493402 (addApplyDifferent!523 lt!493405 lt!493391 minValue!831 lt!493403))))

(assert (=> b!1100865 (= (apply!950 (+!3390 lt!493405 (tuple2!17371 lt!493391 minValue!831)) lt!493403) (apply!950 lt!493405 lt!493403))))

(declare-fun bm!46106 () Bool)

(assert (=> bm!46106 (= call!46105 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46107 () Bool)

(assert (=> bm!46107 (= call!46109 call!46106)))

(declare-fun b!1100866 () Bool)

(declare-fun get!17648 (ValueCell!12894 V!41403) V!41403)

(assert (=> b!1100866 (= e!628329 (= (apply!950 lt!493410 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)) (get!17648 (select (arr!34332 _values!874) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34868 _values!874)))))

(assert (=> b!1100866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(declare-fun b!1100867 () Bool)

(assert (=> b!1100867 (= e!628326 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100868 () Bool)

(assert (=> b!1100868 (= e!628328 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130603 c!108733) b!1100849))

(assert (= (and d!130603 (not c!108733)) b!1100860))

(assert (= (and b!1100860 c!108734) b!1100858))

(assert (= (and b!1100860 (not c!108734)) b!1100861))

(assert (= (and b!1100861 c!108736) b!1100852))

(assert (= (and b!1100861 (not c!108736)) b!1100862))

(assert (= (or b!1100852 b!1100862) bm!46107))

(assert (= (or b!1100858 bm!46107) bm!46101))

(assert (= (or b!1100858 b!1100852) bm!46102))

(assert (= (or b!1100849 bm!46101) bm!46106))

(assert (= (or b!1100849 bm!46102) bm!46105))

(assert (= (and d!130603 res!734607) b!1100867))

(assert (= (and d!130603 c!108732) b!1100865))

(assert (= (and d!130603 (not c!108732)) b!1100859))

(assert (= (and d!130603 res!734606) b!1100857))

(assert (= (and b!1100857 res!734608) b!1100868))

(assert (= (and b!1100857 (not res!734601)) b!1100850))

(assert (= (and b!1100850 res!734603) b!1100866))

(assert (= (and b!1100857 res!734609) b!1100855))

(assert (= (and b!1100855 c!108731) b!1100851))

(assert (= (and b!1100855 (not c!108731)) b!1100848))

(assert (= (and b!1100851 res!734605) b!1100853))

(assert (= (or b!1100851 b!1100848) bm!46104))

(assert (= (and b!1100855 res!734604) b!1100864))

(assert (= (and b!1100864 c!108735) b!1100856))

(assert (= (and b!1100864 (not c!108735)) b!1100854))

(assert (= (and b!1100856 res!734602) b!1100863))

(assert (= (or b!1100856 b!1100854) bm!46103))

(declare-fun b_lambda!18031 () Bool)

(assert (=> (not b_lambda!18031) (not b!1100866)))

(assert (=> b!1100866 t!34187))

(declare-fun b_and!37083 () Bool)

(assert (= b_and!37077 (and (=> t!34187 result!16583) b_and!37083)))

(declare-fun m!1020963 () Bool)

(assert (=> b!1100850 m!1020963))

(assert (=> b!1100850 m!1020963))

(declare-fun m!1020965 () Bool)

(assert (=> b!1100850 m!1020965))

(declare-fun m!1020967 () Bool)

(assert (=> b!1100849 m!1020967))

(declare-fun m!1020969 () Bool)

(assert (=> b!1100865 m!1020969))

(declare-fun m!1020971 () Bool)

(assert (=> b!1100865 m!1020971))

(declare-fun m!1020973 () Bool)

(assert (=> b!1100865 m!1020973))

(declare-fun m!1020975 () Bool)

(assert (=> b!1100865 m!1020975))

(assert (=> b!1100865 m!1020865))

(declare-fun m!1020977 () Bool)

(assert (=> b!1100865 m!1020977))

(assert (=> b!1100865 m!1020969))

(declare-fun m!1020979 () Bool)

(assert (=> b!1100865 m!1020979))

(declare-fun m!1020981 () Bool)

(assert (=> b!1100865 m!1020981))

(declare-fun m!1020983 () Bool)

(assert (=> b!1100865 m!1020983))

(assert (=> b!1100865 m!1020971))

(declare-fun m!1020985 () Bool)

(assert (=> b!1100865 m!1020985))

(declare-fun m!1020987 () Bool)

(assert (=> b!1100865 m!1020987))

(declare-fun m!1020989 () Bool)

(assert (=> b!1100865 m!1020989))

(assert (=> b!1100865 m!1020975))

(declare-fun m!1020991 () Bool)

(assert (=> b!1100865 m!1020991))

(assert (=> b!1100865 m!1020963))

(declare-fun m!1020993 () Bool)

(assert (=> b!1100865 m!1020993))

(declare-fun m!1020995 () Bool)

(assert (=> b!1100865 m!1020995))

(declare-fun m!1020997 () Bool)

(assert (=> b!1100865 m!1020997))

(assert (=> b!1100865 m!1020993))

(assert (=> b!1100866 m!1020963))

(declare-fun m!1020999 () Bool)

(assert (=> b!1100866 m!1020999))

(assert (=> b!1100866 m!1020855))

(declare-fun m!1021001 () Bool)

(assert (=> b!1100866 m!1021001))

(assert (=> b!1100866 m!1020963))

(declare-fun m!1021003 () Bool)

(assert (=> b!1100866 m!1021003))

(assert (=> b!1100866 m!1020855))

(assert (=> b!1100866 m!1020999))

(declare-fun m!1021005 () Bool)

(assert (=> bm!46103 m!1021005))

(assert (=> b!1100867 m!1020963))

(assert (=> b!1100867 m!1020963))

(declare-fun m!1021007 () Bool)

(assert (=> b!1100867 m!1021007))

(declare-fun m!1021009 () Bool)

(assert (=> b!1100863 m!1021009))

(declare-fun m!1021011 () Bool)

(assert (=> bm!46105 m!1021011))

(assert (=> d!130603 m!1020875))

(declare-fun m!1021013 () Bool)

(assert (=> b!1100853 m!1021013))

(assert (=> b!1100868 m!1020963))

(assert (=> b!1100868 m!1020963))

(assert (=> b!1100868 m!1021007))

(declare-fun m!1021015 () Bool)

(assert (=> bm!46104 m!1021015))

(assert (=> bm!46106 m!1020865))

(assert (=> b!1100738 d!130603))

(declare-fun bm!46108 () Bool)

(declare-fun call!46113 () ListLongMap!15339)

(declare-fun call!46112 () ListLongMap!15339)

(assert (=> bm!46108 (= call!46113 call!46112)))

(declare-fun b!1100869 () Bool)

(declare-fun e!628345 () Bool)

(declare-fun call!46115 () Bool)

(assert (=> b!1100869 (= e!628345 (not call!46115))))

(declare-fun b!1100870 () Bool)

(declare-fun e!628343 () ListLongMap!15339)

(declare-fun call!46114 () ListLongMap!15339)

(assert (=> b!1100870 (= e!628343 (+!3390 call!46114 (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100872 () Bool)

(declare-fun e!628344 () Bool)

(assert (=> b!1100872 (= e!628345 e!628344)))

(declare-fun res!734614 () Bool)

(assert (=> b!1100872 (= res!734614 call!46115)))

(assert (=> b!1100872 (=> (not res!734614) (not e!628344))))

(declare-fun b!1100873 () Bool)

(declare-fun e!628346 () ListLongMap!15339)

(declare-fun call!46111 () ListLongMap!15339)

(assert (=> b!1100873 (= e!628346 call!46111)))

(declare-fun b!1100874 () Bool)

(declare-fun lt!493432 () ListLongMap!15339)

(assert (=> b!1100874 (= e!628344 (= (apply!950 lt!493432 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100875 () Bool)

(declare-fun e!628347 () Bool)

(declare-fun call!46117 () Bool)

(assert (=> b!1100875 (= e!628347 (not call!46117))))

(declare-fun bm!46109 () Bool)

(assert (=> bm!46109 (= call!46111 call!46114)))

(declare-fun b!1100876 () Bool)

(declare-fun res!734613 () Bool)

(declare-fun e!628337 () Bool)

(assert (=> b!1100876 (=> (not res!734613) (not e!628337))))

(assert (=> b!1100876 (= res!734613 e!628345)))

(declare-fun c!108737 () Bool)

(assert (=> b!1100876 (= c!108737 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100877 () Bool)

(declare-fun e!628338 () Bool)

(assert (=> b!1100877 (= e!628347 e!628338)))

(declare-fun res!734611 () Bool)

(assert (=> b!1100877 (= res!734611 call!46117)))

(assert (=> b!1100877 (=> (not res!734611) (not e!628338))))

(declare-fun b!1100878 () Bool)

(declare-fun res!734618 () Bool)

(assert (=> b!1100878 (=> (not res!734618) (not e!628337))))

(declare-fun e!628336 () Bool)

(assert (=> b!1100878 (= res!734618 e!628336)))

(declare-fun res!734610 () Bool)

(assert (=> b!1100878 (=> res!734610 e!628336)))

(declare-fun e!628341 () Bool)

(assert (=> b!1100878 (= res!734610 (not e!628341))))

(declare-fun res!734617 () Bool)

(assert (=> b!1100878 (=> (not res!734617) (not e!628341))))

(assert (=> b!1100878 (= res!734617 (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(declare-fun b!1100879 () Bool)

(declare-fun e!628340 () ListLongMap!15339)

(assert (=> b!1100879 (= e!628340 call!46111)))

(declare-fun b!1100880 () Bool)

(declare-fun e!628348 () Unit!36186)

(declare-fun Unit!36189 () Unit!36186)

(assert (=> b!1100880 (= e!628348 Unit!36189)))

(declare-fun bm!46110 () Bool)

(assert (=> bm!46110 (= call!46117 (contains!6398 lt!493432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100881 () Bool)

(assert (=> b!1100881 (= e!628343 e!628340)))

(declare-fun c!108740 () Bool)

(assert (=> b!1100881 (= c!108740 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100882 () Bool)

(declare-fun c!108742 () Bool)

(assert (=> b!1100882 (= c!108742 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100882 (= e!628340 e!628346)))

(declare-fun b!1100883 () Bool)

(declare-fun call!46116 () ListLongMap!15339)

(assert (=> b!1100883 (= e!628346 call!46116)))

(declare-fun b!1100884 () Bool)

(assert (=> b!1100884 (= e!628338 (= (apply!950 lt!493432 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun d!130605 () Bool)

(assert (=> d!130605 e!628337))

(declare-fun res!734615 () Bool)

(assert (=> d!130605 (=> (not res!734615) (not e!628337))))

(assert (=> d!130605 (= res!734615 (or (bvsge #b00000000000000000000000000000000 (size!34867 lt!493301)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))))

(declare-fun lt!493417 () ListLongMap!15339)

(assert (=> d!130605 (= lt!493432 lt!493417)))

(declare-fun lt!493418 () Unit!36186)

(assert (=> d!130605 (= lt!493418 e!628348)))

(declare-fun c!108738 () Bool)

(declare-fun e!628339 () Bool)

(assert (=> d!130605 (= c!108738 e!628339)))

(declare-fun res!734616 () Bool)

(assert (=> d!130605 (=> (not res!734616) (not e!628339))))

(assert (=> d!130605 (= res!734616 (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(assert (=> d!130605 (= lt!493417 e!628343)))

(declare-fun c!108739 () Bool)

(assert (=> d!130605 (= c!108739 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130605 (validMask!0 mask!1414)))

(assert (=> d!130605 (= (getCurrentListMap!4392 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493432)))

(declare-fun b!1100871 () Bool)

(declare-fun e!628342 () Bool)

(assert (=> b!1100871 (= e!628336 e!628342)))

(declare-fun res!734612 () Bool)

(assert (=> b!1100871 (=> (not res!734612) (not e!628342))))

(assert (=> b!1100871 (= res!734612 (contains!6398 lt!493432 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(assert (=> b!1100871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(declare-fun bm!46111 () Bool)

(assert (=> bm!46111 (= call!46115 (contains!6398 lt!493432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46112 () Bool)

(assert (=> bm!46112 (= call!46114 (+!3390 (ite c!108739 call!46112 (ite c!108740 call!46113 call!46116)) (ite (or c!108739 c!108740) (tuple2!17371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100885 () Bool)

(assert (=> b!1100885 (= e!628337 e!628347)))

(declare-fun c!108741 () Bool)

(assert (=> b!1100885 (= c!108741 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100886 () Bool)

(declare-fun lt!493424 () Unit!36186)

(assert (=> b!1100886 (= e!628348 lt!493424)))

(declare-fun lt!493421 () ListLongMap!15339)

(assert (=> b!1100886 (= lt!493421 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493428 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493412 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493412 (select (arr!34331 lt!493301) #b00000000000000000000000000000000))))

(declare-fun lt!493429 () Unit!36186)

(assert (=> b!1100886 (= lt!493429 (addStillContains!663 lt!493421 lt!493428 zeroValue!831 lt!493412))))

(assert (=> b!1100886 (contains!6398 (+!3390 lt!493421 (tuple2!17371 lt!493428 zeroValue!831)) lt!493412)))

(declare-fun lt!493415 () Unit!36186)

(assert (=> b!1100886 (= lt!493415 lt!493429)))

(declare-fun lt!493422 () ListLongMap!15339)

(assert (=> b!1100886 (= lt!493422 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493419 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493419 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493431 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493431 (select (arr!34331 lt!493301) #b00000000000000000000000000000000))))

(declare-fun lt!493411 () Unit!36186)

(assert (=> b!1100886 (= lt!493411 (addApplyDifferent!523 lt!493422 lt!493419 minValue!831 lt!493431))))

(assert (=> b!1100886 (= (apply!950 (+!3390 lt!493422 (tuple2!17371 lt!493419 minValue!831)) lt!493431) (apply!950 lt!493422 lt!493431))))

(declare-fun lt!493414 () Unit!36186)

(assert (=> b!1100886 (= lt!493414 lt!493411)))

(declare-fun lt!493426 () ListLongMap!15339)

(assert (=> b!1100886 (= lt!493426 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493416 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493423 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493423 (select (arr!34331 lt!493301) #b00000000000000000000000000000000))))

(declare-fun lt!493430 () Unit!36186)

(assert (=> b!1100886 (= lt!493430 (addApplyDifferent!523 lt!493426 lt!493416 zeroValue!831 lt!493423))))

(assert (=> b!1100886 (= (apply!950 (+!3390 lt!493426 (tuple2!17371 lt!493416 zeroValue!831)) lt!493423) (apply!950 lt!493426 lt!493423))))

(declare-fun lt!493420 () Unit!36186)

(assert (=> b!1100886 (= lt!493420 lt!493430)))

(declare-fun lt!493427 () ListLongMap!15339)

(assert (=> b!1100886 (= lt!493427 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493413 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493413 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493425 () (_ BitVec 64))

(assert (=> b!1100886 (= lt!493425 (select (arr!34331 lt!493301) #b00000000000000000000000000000000))))

(assert (=> b!1100886 (= lt!493424 (addApplyDifferent!523 lt!493427 lt!493413 minValue!831 lt!493425))))

(assert (=> b!1100886 (= (apply!950 (+!3390 lt!493427 (tuple2!17371 lt!493413 minValue!831)) lt!493425) (apply!950 lt!493427 lt!493425))))

(declare-fun bm!46113 () Bool)

(assert (=> bm!46113 (= call!46112 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46114 () Bool)

(assert (=> bm!46114 (= call!46116 call!46113)))

(declare-fun b!1100887 () Bool)

(assert (=> b!1100887 (= e!628342 (= (apply!950 lt!493432 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)) (get!17648 (select (arr!34332 lt!493300) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34868 lt!493300)))))

(assert (=> b!1100887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(declare-fun b!1100888 () Bool)

(assert (=> b!1100888 (= e!628339 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(declare-fun b!1100889 () Bool)

(assert (=> b!1100889 (= e!628341 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(assert (= (and d!130605 c!108739) b!1100870))

(assert (= (and d!130605 (not c!108739)) b!1100881))

(assert (= (and b!1100881 c!108740) b!1100879))

(assert (= (and b!1100881 (not c!108740)) b!1100882))

(assert (= (and b!1100882 c!108742) b!1100873))

(assert (= (and b!1100882 (not c!108742)) b!1100883))

(assert (= (or b!1100873 b!1100883) bm!46114))

(assert (= (or b!1100879 bm!46114) bm!46108))

(assert (= (or b!1100879 b!1100873) bm!46109))

(assert (= (or b!1100870 bm!46108) bm!46113))

(assert (= (or b!1100870 bm!46109) bm!46112))

(assert (= (and d!130605 res!734616) b!1100888))

(assert (= (and d!130605 c!108738) b!1100886))

(assert (= (and d!130605 (not c!108738)) b!1100880))

(assert (= (and d!130605 res!734615) b!1100878))

(assert (= (and b!1100878 res!734617) b!1100889))

(assert (= (and b!1100878 (not res!734610)) b!1100871))

(assert (= (and b!1100871 res!734612) b!1100887))

(assert (= (and b!1100878 res!734618) b!1100876))

(assert (= (and b!1100876 c!108737) b!1100872))

(assert (= (and b!1100876 (not c!108737)) b!1100869))

(assert (= (and b!1100872 res!734614) b!1100874))

(assert (= (or b!1100872 b!1100869) bm!46111))

(assert (= (and b!1100876 res!734613) b!1100885))

(assert (= (and b!1100885 c!108741) b!1100877))

(assert (= (and b!1100885 (not c!108741)) b!1100875))

(assert (= (and b!1100877 res!734611) b!1100884))

(assert (= (or b!1100877 b!1100875) bm!46110))

(declare-fun b_lambda!18033 () Bool)

(assert (=> (not b_lambda!18033) (not b!1100887)))

(assert (=> b!1100887 t!34187))

(declare-fun b_and!37085 () Bool)

(assert (= b_and!37083 (and (=> t!34187 result!16583) b_and!37085)))

(assert (=> b!1100871 m!1020955))

(assert (=> b!1100871 m!1020955))

(declare-fun m!1021017 () Bool)

(assert (=> b!1100871 m!1021017))

(declare-fun m!1021019 () Bool)

(assert (=> b!1100870 m!1021019))

(declare-fun m!1021021 () Bool)

(assert (=> b!1100886 m!1021021))

(declare-fun m!1021023 () Bool)

(assert (=> b!1100886 m!1021023))

(declare-fun m!1021025 () Bool)

(assert (=> b!1100886 m!1021025))

(declare-fun m!1021027 () Bool)

(assert (=> b!1100886 m!1021027))

(assert (=> b!1100886 m!1020867))

(declare-fun m!1021029 () Bool)

(assert (=> b!1100886 m!1021029))

(assert (=> b!1100886 m!1021021))

(declare-fun m!1021031 () Bool)

(assert (=> b!1100886 m!1021031))

(declare-fun m!1021033 () Bool)

(assert (=> b!1100886 m!1021033))

(declare-fun m!1021035 () Bool)

(assert (=> b!1100886 m!1021035))

(assert (=> b!1100886 m!1021023))

(declare-fun m!1021037 () Bool)

(assert (=> b!1100886 m!1021037))

(declare-fun m!1021039 () Bool)

(assert (=> b!1100886 m!1021039))

(declare-fun m!1021041 () Bool)

(assert (=> b!1100886 m!1021041))

(assert (=> b!1100886 m!1021027))

(declare-fun m!1021043 () Bool)

(assert (=> b!1100886 m!1021043))

(assert (=> b!1100886 m!1020955))

(declare-fun m!1021045 () Bool)

(assert (=> b!1100886 m!1021045))

(declare-fun m!1021047 () Bool)

(assert (=> b!1100886 m!1021047))

(declare-fun m!1021049 () Bool)

(assert (=> b!1100886 m!1021049))

(assert (=> b!1100886 m!1021045))

(assert (=> b!1100887 m!1020955))

(declare-fun m!1021051 () Bool)

(assert (=> b!1100887 m!1021051))

(assert (=> b!1100887 m!1020855))

(declare-fun m!1021053 () Bool)

(assert (=> b!1100887 m!1021053))

(assert (=> b!1100887 m!1020955))

(declare-fun m!1021055 () Bool)

(assert (=> b!1100887 m!1021055))

(assert (=> b!1100887 m!1020855))

(assert (=> b!1100887 m!1021051))

(declare-fun m!1021057 () Bool)

(assert (=> bm!46110 m!1021057))

(assert (=> b!1100888 m!1020955))

(assert (=> b!1100888 m!1020955))

(assert (=> b!1100888 m!1020957))

(declare-fun m!1021059 () Bool)

(assert (=> b!1100884 m!1021059))

(declare-fun m!1021061 () Bool)

(assert (=> bm!46112 m!1021061))

(assert (=> d!130605 m!1020875))

(declare-fun m!1021063 () Bool)

(assert (=> b!1100874 m!1021063))

(assert (=> b!1100889 m!1020955))

(assert (=> b!1100889 m!1020955))

(assert (=> b!1100889 m!1020957))

(declare-fun m!1021065 () Bool)

(assert (=> bm!46111 m!1021065))

(assert (=> bm!46113 m!1020867))

(assert (=> b!1100738 d!130605))

(declare-fun b!1100896 () Bool)

(declare-fun e!628354 () Bool)

(declare-fun call!46123 () ListLongMap!15339)

(declare-fun call!46122 () ListLongMap!15339)

(assert (=> b!1100896 (= e!628354 (= call!46123 call!46122))))

(assert (=> b!1100896 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34868 _values!874)))))

(declare-fun b!1100897 () Bool)

(assert (=> b!1100897 (= e!628354 (= call!46123 (-!970 call!46122 k0!904)))))

(assert (=> b!1100897 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34868 _values!874)))))

(declare-fun d!130607 () Bool)

(declare-fun e!628353 () Bool)

(assert (=> d!130607 e!628353))

(declare-fun res!734621 () Bool)

(assert (=> d!130607 (=> (not res!734621) (not e!628353))))

(assert (=> d!130607 (= res!734621 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34867 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34867 _keys!1070))))))))

(declare-fun lt!493435 () Unit!36186)

(declare-fun choose!1769 (array!71333 array!71335 (_ BitVec 32) (_ BitVec 32) V!41403 V!41403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36186)

(assert (=> d!130607 (= lt!493435 (choose!1769 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130607 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(assert (=> d!130607 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!218 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493435)))

(declare-fun bm!46119 () Bool)

(assert (=> bm!46119 (= call!46123 (getCurrentListMapNoExtraKeys!4188 (array!71334 (store (arr!34331 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34867 _keys!1070)) (array!71336 (store (arr!34332 _values!874) i!650 (ValueCellFull!12894 (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34868 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46120 () Bool)

(assert (=> bm!46120 (= call!46122 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100898 () Bool)

(assert (=> b!1100898 (= e!628353 e!628354)))

(declare-fun c!108745 () Bool)

(assert (=> b!1100898 (= c!108745 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130607 res!734621) b!1100898))

(assert (= (and b!1100898 c!108745) b!1100897))

(assert (= (and b!1100898 (not c!108745)) b!1100896))

(assert (= (or b!1100897 b!1100896) bm!46120))

(assert (= (or b!1100897 b!1100896) bm!46119))

(declare-fun b_lambda!18035 () Bool)

(assert (=> (not b_lambda!18035) (not bm!46119)))

(assert (=> bm!46119 t!34187))

(declare-fun b_and!37087 () Bool)

(assert (= b_and!37085 (and (=> t!34187 result!16583) b_and!37087)))

(declare-fun m!1021067 () Bool)

(assert (=> b!1100897 m!1021067))

(declare-fun m!1021069 () Bool)

(assert (=> d!130607 m!1021069))

(assert (=> bm!46119 m!1020883))

(assert (=> bm!46119 m!1020855))

(assert (=> bm!46119 m!1020857))

(declare-fun m!1021071 () Bool)

(assert (=> bm!46119 m!1021071))

(assert (=> bm!46120 m!1020865))

(assert (=> b!1100738 d!130607))

(declare-fun b!1100923 () Bool)

(assert (=> b!1100923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(assert (=> b!1100923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34868 lt!493300)))))

(declare-fun e!628370 () Bool)

(declare-fun lt!493455 () ListLongMap!15339)

(assert (=> b!1100923 (= e!628370 (= (apply!950 lt!493455 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)) (get!17648 (select (arr!34332 lt!493300) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1100924 () Bool)

(declare-fun e!628372 () ListLongMap!15339)

(assert (=> b!1100924 (= e!628372 (ListLongMap!15340 Nil!23982))))

(declare-fun bm!46123 () Bool)

(declare-fun call!46126 () ListLongMap!15339)

(assert (=> bm!46123 (= call!46126 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100925 () Bool)

(declare-fun e!628373 () Bool)

(assert (=> b!1100925 (= e!628373 e!628370)))

(assert (=> b!1100925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(declare-fun res!734630 () Bool)

(assert (=> b!1100925 (= res!734630 (contains!6398 lt!493455 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(assert (=> b!1100925 (=> (not res!734630) (not e!628370))))

(declare-fun b!1100926 () Bool)

(declare-fun e!628374 () Bool)

(assert (=> b!1100926 (= e!628374 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(assert (=> b!1100926 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130609 () Bool)

(declare-fun e!628375 () Bool)

(assert (=> d!130609 e!628375))

(declare-fun res!734633 () Bool)

(assert (=> d!130609 (=> (not res!734633) (not e!628375))))

(assert (=> d!130609 (= res!734633 (not (contains!6398 lt!493455 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130609 (= lt!493455 e!628372)))

(declare-fun c!108754 () Bool)

(assert (=> d!130609 (= c!108754 (bvsge #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(assert (=> d!130609 (validMask!0 mask!1414)))

(assert (=> d!130609 (= (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493455)))

(declare-fun b!1100927 () Bool)

(declare-fun e!628369 () ListLongMap!15339)

(assert (=> b!1100927 (= e!628369 call!46126)))

(declare-fun b!1100928 () Bool)

(declare-fun e!628371 () Bool)

(assert (=> b!1100928 (= e!628373 e!628371)))

(declare-fun c!108755 () Bool)

(assert (=> b!1100928 (= c!108755 (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(declare-fun b!1100929 () Bool)

(declare-fun lt!493452 () Unit!36186)

(declare-fun lt!493450 () Unit!36186)

(assert (=> b!1100929 (= lt!493452 lt!493450)))

(declare-fun lt!493456 () (_ BitVec 64))

(declare-fun lt!493453 () V!41403)

(declare-fun lt!493454 () (_ BitVec 64))

(declare-fun lt!493451 () ListLongMap!15339)

(assert (=> b!1100929 (not (contains!6398 (+!3390 lt!493451 (tuple2!17371 lt!493454 lt!493453)) lt!493456))))

(declare-fun addStillNotContains!278 (ListLongMap!15339 (_ BitVec 64) V!41403 (_ BitVec 64)) Unit!36186)

(assert (=> b!1100929 (= lt!493450 (addStillNotContains!278 lt!493451 lt!493454 lt!493453 lt!493456))))

(assert (=> b!1100929 (= lt!493456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100929 (= lt!493453 (get!17648 (select (arr!34332 lt!493300) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100929 (= lt!493454 (select (arr!34331 lt!493301) #b00000000000000000000000000000000))))

(assert (=> b!1100929 (= lt!493451 call!46126)))

(assert (=> b!1100929 (= e!628369 (+!3390 call!46126 (tuple2!17371 (select (arr!34331 lt!493301) #b00000000000000000000000000000000) (get!17648 (select (arr!34332 lt!493300) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100930 () Bool)

(assert (=> b!1100930 (= e!628371 (= lt!493455 (getCurrentListMapNoExtraKeys!4188 lt!493301 lt!493300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100931 () Bool)

(declare-fun res!734631 () Bool)

(assert (=> b!1100931 (=> (not res!734631) (not e!628375))))

(assert (=> b!1100931 (= res!734631 (not (contains!6398 lt!493455 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100932 () Bool)

(assert (=> b!1100932 (= e!628375 e!628373)))

(declare-fun c!108756 () Bool)

(assert (=> b!1100932 (= c!108756 e!628374)))

(declare-fun res!734632 () Bool)

(assert (=> b!1100932 (=> (not res!734632) (not e!628374))))

(assert (=> b!1100932 (= res!734632 (bvslt #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(declare-fun b!1100933 () Bool)

(declare-fun isEmpty!968 (ListLongMap!15339) Bool)

(assert (=> b!1100933 (= e!628371 (isEmpty!968 lt!493455))))

(declare-fun b!1100934 () Bool)

(assert (=> b!1100934 (= e!628372 e!628369)))

(declare-fun c!108757 () Bool)

(assert (=> b!1100934 (= c!108757 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(assert (= (and d!130609 c!108754) b!1100924))

(assert (= (and d!130609 (not c!108754)) b!1100934))

(assert (= (and b!1100934 c!108757) b!1100929))

(assert (= (and b!1100934 (not c!108757)) b!1100927))

(assert (= (or b!1100929 b!1100927) bm!46123))

(assert (= (and d!130609 res!734633) b!1100931))

(assert (= (and b!1100931 res!734631) b!1100932))

(assert (= (and b!1100932 res!734632) b!1100926))

(assert (= (and b!1100932 c!108756) b!1100925))

(assert (= (and b!1100932 (not c!108756)) b!1100928))

(assert (= (and b!1100925 res!734630) b!1100923))

(assert (= (and b!1100928 c!108755) b!1100930))

(assert (= (and b!1100928 (not c!108755)) b!1100933))

(declare-fun b_lambda!18037 () Bool)

(assert (=> (not b_lambda!18037) (not b!1100923)))

(assert (=> b!1100923 t!34187))

(declare-fun b_and!37089 () Bool)

(assert (= b_and!37087 (and (=> t!34187 result!16583) b_and!37089)))

(declare-fun b_lambda!18039 () Bool)

(assert (=> (not b_lambda!18039) (not b!1100929)))

(assert (=> b!1100929 t!34187))

(declare-fun b_and!37091 () Bool)

(assert (= b_and!37089 (and (=> t!34187 result!16583) b_and!37091)))

(assert (=> b!1100925 m!1020955))

(assert (=> b!1100925 m!1020955))

(declare-fun m!1021073 () Bool)

(assert (=> b!1100925 m!1021073))

(declare-fun m!1021075 () Bool)

(assert (=> b!1100933 m!1021075))

(declare-fun m!1021077 () Bool)

(assert (=> b!1100931 m!1021077))

(declare-fun m!1021079 () Bool)

(assert (=> b!1100930 m!1021079))

(assert (=> b!1100923 m!1020855))

(assert (=> b!1100923 m!1020955))

(assert (=> b!1100923 m!1020955))

(declare-fun m!1021081 () Bool)

(assert (=> b!1100923 m!1021081))

(assert (=> b!1100923 m!1021051))

(assert (=> b!1100923 m!1021051))

(assert (=> b!1100923 m!1020855))

(assert (=> b!1100923 m!1021053))

(declare-fun m!1021083 () Bool)

(assert (=> b!1100929 m!1021083))

(declare-fun m!1021085 () Bool)

(assert (=> b!1100929 m!1021085))

(assert (=> b!1100929 m!1021083))

(declare-fun m!1021087 () Bool)

(assert (=> b!1100929 m!1021087))

(assert (=> b!1100929 m!1020855))

(assert (=> b!1100929 m!1021051))

(assert (=> b!1100929 m!1021051))

(assert (=> b!1100929 m!1020855))

(assert (=> b!1100929 m!1021053))

(declare-fun m!1021089 () Bool)

(assert (=> b!1100929 m!1021089))

(assert (=> b!1100929 m!1020955))

(assert (=> b!1100934 m!1020955))

(assert (=> b!1100934 m!1020955))

(assert (=> b!1100934 m!1020957))

(assert (=> bm!46123 m!1021079))

(declare-fun m!1021091 () Bool)

(assert (=> d!130609 m!1021091))

(assert (=> d!130609 m!1020875))

(assert (=> b!1100926 m!1020955))

(assert (=> b!1100926 m!1020955))

(assert (=> b!1100926 m!1020957))

(assert (=> b!1100738 d!130609))

(declare-fun d!130611 () Bool)

(declare-fun lt!493459 () ListLongMap!15339)

(assert (=> d!130611 (not (contains!6398 lt!493459 k0!904))))

(declare-fun removeStrictlySorted!84 (List!23985 (_ BitVec 64)) List!23985)

(assert (=> d!130611 (= lt!493459 (ListLongMap!15340 (removeStrictlySorted!84 (toList!7685 lt!493298) k0!904)))))

(assert (=> d!130611 (= (-!970 lt!493298 k0!904) lt!493459)))

(declare-fun bs!32315 () Bool)

(assert (= bs!32315 d!130611))

(declare-fun m!1021093 () Bool)

(assert (=> bs!32315 m!1021093))

(declare-fun m!1021095 () Bool)

(assert (=> bs!32315 m!1021095))

(assert (=> b!1100738 d!130611))

(declare-fun d!130613 () Bool)

(declare-fun res!734638 () Bool)

(declare-fun e!628380 () Bool)

(assert (=> d!130613 (=> res!734638 e!628380)))

(assert (=> d!130613 (= res!734638 (= (select (arr!34331 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130613 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628380)))

(declare-fun b!1100939 () Bool)

(declare-fun e!628381 () Bool)

(assert (=> b!1100939 (= e!628380 e!628381)))

(declare-fun res!734639 () Bool)

(assert (=> b!1100939 (=> (not res!734639) (not e!628381))))

(assert (=> b!1100939 (= res!734639 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34867 _keys!1070)))))

(declare-fun b!1100940 () Bool)

(assert (=> b!1100940 (= e!628381 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130613 (not res!734638)) b!1100939))

(assert (= (and b!1100939 res!734639) b!1100940))

(assert (=> d!130613 m!1020963))

(declare-fun m!1021097 () Bool)

(assert (=> b!1100940 m!1021097))

(assert (=> b!1100738 d!130613))

(declare-fun b!1100941 () Bool)

(assert (=> b!1100941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(assert (=> b!1100941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34868 _values!874)))))

(declare-fun lt!493465 () ListLongMap!15339)

(declare-fun e!628383 () Bool)

(assert (=> b!1100941 (= e!628383 (= (apply!950 lt!493465 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)) (get!17648 (select (arr!34332 _values!874) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1100942 () Bool)

(declare-fun e!628385 () ListLongMap!15339)

(assert (=> b!1100942 (= e!628385 (ListLongMap!15340 Nil!23982))))

(declare-fun call!46127 () ListLongMap!15339)

(declare-fun bm!46124 () Bool)

(assert (=> bm!46124 (= call!46127 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100943 () Bool)

(declare-fun e!628386 () Bool)

(assert (=> b!1100943 (= e!628386 e!628383)))

(assert (=> b!1100943 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(declare-fun res!734640 () Bool)

(assert (=> b!1100943 (= res!734640 (contains!6398 lt!493465 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100943 (=> (not res!734640) (not e!628383))))

(declare-fun b!1100944 () Bool)

(declare-fun e!628387 () Bool)

(assert (=> b!1100944 (= e!628387 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100944 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130615 () Bool)

(declare-fun e!628388 () Bool)

(assert (=> d!130615 e!628388))

(declare-fun res!734643 () Bool)

(assert (=> d!130615 (=> (not res!734643) (not e!628388))))

(assert (=> d!130615 (= res!734643 (not (contains!6398 lt!493465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130615 (= lt!493465 e!628385)))

(declare-fun c!108758 () Bool)

(assert (=> d!130615 (= c!108758 (bvsge #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(assert (=> d!130615 (validMask!0 mask!1414)))

(assert (=> d!130615 (= (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493465)))

(declare-fun b!1100945 () Bool)

(declare-fun e!628382 () ListLongMap!15339)

(assert (=> b!1100945 (= e!628382 call!46127)))

(declare-fun b!1100946 () Bool)

(declare-fun e!628384 () Bool)

(assert (=> b!1100946 (= e!628386 e!628384)))

(declare-fun c!108759 () Bool)

(assert (=> b!1100946 (= c!108759 (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(declare-fun b!1100947 () Bool)

(declare-fun lt!493462 () Unit!36186)

(declare-fun lt!493460 () Unit!36186)

(assert (=> b!1100947 (= lt!493462 lt!493460)))

(declare-fun lt!493461 () ListLongMap!15339)

(declare-fun lt!493464 () (_ BitVec 64))

(declare-fun lt!493463 () V!41403)

(declare-fun lt!493466 () (_ BitVec 64))

(assert (=> b!1100947 (not (contains!6398 (+!3390 lt!493461 (tuple2!17371 lt!493464 lt!493463)) lt!493466))))

(assert (=> b!1100947 (= lt!493460 (addStillNotContains!278 lt!493461 lt!493464 lt!493463 lt!493466))))

(assert (=> b!1100947 (= lt!493466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100947 (= lt!493463 (get!17648 (select (arr!34332 _values!874) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100947 (= lt!493464 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100947 (= lt!493461 call!46127)))

(assert (=> b!1100947 (= e!628382 (+!3390 call!46127 (tuple2!17371 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000) (get!17648 (select (arr!34332 _values!874) #b00000000000000000000000000000000) (dynLambda!2323 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100948 () Bool)

(assert (=> b!1100948 (= e!628384 (= lt!493465 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100949 () Bool)

(declare-fun res!734641 () Bool)

(assert (=> b!1100949 (=> (not res!734641) (not e!628388))))

(assert (=> b!1100949 (= res!734641 (not (contains!6398 lt!493465 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100950 () Bool)

(assert (=> b!1100950 (= e!628388 e!628386)))

(declare-fun c!108760 () Bool)

(assert (=> b!1100950 (= c!108760 e!628387)))

(declare-fun res!734642 () Bool)

(assert (=> b!1100950 (=> (not res!734642) (not e!628387))))

(assert (=> b!1100950 (= res!734642 (bvslt #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(declare-fun b!1100951 () Bool)

(assert (=> b!1100951 (= e!628384 (isEmpty!968 lt!493465))))

(declare-fun b!1100952 () Bool)

(assert (=> b!1100952 (= e!628385 e!628382)))

(declare-fun c!108761 () Bool)

(assert (=> b!1100952 (= c!108761 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130615 c!108758) b!1100942))

(assert (= (and d!130615 (not c!108758)) b!1100952))

(assert (= (and b!1100952 c!108761) b!1100947))

(assert (= (and b!1100952 (not c!108761)) b!1100945))

(assert (= (or b!1100947 b!1100945) bm!46124))

(assert (= (and d!130615 res!734643) b!1100949))

(assert (= (and b!1100949 res!734641) b!1100950))

(assert (= (and b!1100950 res!734642) b!1100944))

(assert (= (and b!1100950 c!108760) b!1100943))

(assert (= (and b!1100950 (not c!108760)) b!1100946))

(assert (= (and b!1100943 res!734640) b!1100941))

(assert (= (and b!1100946 c!108759) b!1100948))

(assert (= (and b!1100946 (not c!108759)) b!1100951))

(declare-fun b_lambda!18041 () Bool)

(assert (=> (not b_lambda!18041) (not b!1100941)))

(assert (=> b!1100941 t!34187))

(declare-fun b_and!37093 () Bool)

(assert (= b_and!37091 (and (=> t!34187 result!16583) b_and!37093)))

(declare-fun b_lambda!18043 () Bool)

(assert (=> (not b_lambda!18043) (not b!1100947)))

(assert (=> b!1100947 t!34187))

(declare-fun b_and!37095 () Bool)

(assert (= b_and!37093 (and (=> t!34187 result!16583) b_and!37095)))

(assert (=> b!1100943 m!1020963))

(assert (=> b!1100943 m!1020963))

(declare-fun m!1021099 () Bool)

(assert (=> b!1100943 m!1021099))

(declare-fun m!1021101 () Bool)

(assert (=> b!1100951 m!1021101))

(declare-fun m!1021103 () Bool)

(assert (=> b!1100949 m!1021103))

(declare-fun m!1021105 () Bool)

(assert (=> b!1100948 m!1021105))

(assert (=> b!1100941 m!1020855))

(assert (=> b!1100941 m!1020963))

(assert (=> b!1100941 m!1020963))

(declare-fun m!1021107 () Bool)

(assert (=> b!1100941 m!1021107))

(assert (=> b!1100941 m!1020999))

(assert (=> b!1100941 m!1020999))

(assert (=> b!1100941 m!1020855))

(assert (=> b!1100941 m!1021001))

(declare-fun m!1021109 () Bool)

(assert (=> b!1100947 m!1021109))

(declare-fun m!1021111 () Bool)

(assert (=> b!1100947 m!1021111))

(assert (=> b!1100947 m!1021109))

(declare-fun m!1021113 () Bool)

(assert (=> b!1100947 m!1021113))

(assert (=> b!1100947 m!1020855))

(assert (=> b!1100947 m!1020999))

(assert (=> b!1100947 m!1020999))

(assert (=> b!1100947 m!1020855))

(assert (=> b!1100947 m!1021001))

(declare-fun m!1021115 () Bool)

(assert (=> b!1100947 m!1021115))

(assert (=> b!1100947 m!1020963))

(assert (=> b!1100952 m!1020963))

(assert (=> b!1100952 m!1020963))

(assert (=> b!1100952 m!1021007))

(assert (=> bm!46124 m!1021105))

(declare-fun m!1021117 () Bool)

(assert (=> d!130615 m!1021117))

(assert (=> d!130615 m!1020875))

(assert (=> b!1100944 m!1020963))

(assert (=> b!1100944 m!1020963))

(assert (=> b!1100944 m!1021007))

(assert (=> b!1100738 d!130615))

(declare-fun d!130617 () Bool)

(assert (=> d!130617 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493469 () Unit!36186)

(declare-fun choose!13 (array!71333 (_ BitVec 64) (_ BitVec 32)) Unit!36186)

(assert (=> d!130617 (= lt!493469 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130617 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130617 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493469)))

(declare-fun bs!32316 () Bool)

(assert (= bs!32316 d!130617))

(assert (=> bs!32316 m!1020859))

(declare-fun m!1021119 () Bool)

(assert (=> bs!32316 m!1021119))

(assert (=> b!1100738 d!130617))

(declare-fun d!130619 () Bool)

(declare-fun res!734644 () Bool)

(declare-fun e!628392 () Bool)

(assert (=> d!130619 (=> res!734644 e!628392)))

(assert (=> d!130619 (= res!734644 (bvsge #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(assert (=> d!130619 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23983) e!628392)))

(declare-fun b!1100953 () Bool)

(declare-fun e!628390 () Bool)

(declare-fun call!46128 () Bool)

(assert (=> b!1100953 (= e!628390 call!46128)))

(declare-fun b!1100954 () Bool)

(declare-fun e!628391 () Bool)

(assert (=> b!1100954 (= e!628391 e!628390)))

(declare-fun c!108762 () Bool)

(assert (=> b!1100954 (= c!108762 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100955 () Bool)

(assert (=> b!1100955 (= e!628390 call!46128)))

(declare-fun b!1100956 () Bool)

(declare-fun e!628389 () Bool)

(assert (=> b!1100956 (= e!628389 (contains!6400 Nil!23983 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100957 () Bool)

(assert (=> b!1100957 (= e!628392 e!628391)))

(declare-fun res!734646 () Bool)

(assert (=> b!1100957 (=> (not res!734646) (not e!628391))))

(assert (=> b!1100957 (= res!734646 (not e!628389))))

(declare-fun res!734645 () Bool)

(assert (=> b!1100957 (=> (not res!734645) (not e!628389))))

(assert (=> b!1100957 (= res!734645 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46125 () Bool)

(assert (=> bm!46125 (= call!46128 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108762 (Cons!23982 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000) Nil!23983) Nil!23983)))))

(assert (= (and d!130619 (not res!734644)) b!1100957))

(assert (= (and b!1100957 res!734645) b!1100956))

(assert (= (and b!1100957 res!734646) b!1100954))

(assert (= (and b!1100954 c!108762) b!1100955))

(assert (= (and b!1100954 (not c!108762)) b!1100953))

(assert (= (or b!1100955 b!1100953) bm!46125))

(assert (=> b!1100954 m!1020963))

(assert (=> b!1100954 m!1020963))

(assert (=> b!1100954 m!1021007))

(assert (=> b!1100956 m!1020963))

(assert (=> b!1100956 m!1020963))

(declare-fun m!1021121 () Bool)

(assert (=> b!1100956 m!1021121))

(assert (=> b!1100957 m!1020963))

(assert (=> b!1100957 m!1020963))

(assert (=> b!1100957 m!1021007))

(assert (=> bm!46125 m!1020963))

(declare-fun m!1021123 () Bool)

(assert (=> bm!46125 m!1021123))

(assert (=> b!1100733 d!130619))

(declare-fun d!130621 () Bool)

(assert (=> d!130621 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96762 d!130621))

(declare-fun d!130623 () Bool)

(assert (=> d!130623 (= (array_inv!26444 _keys!1070) (bvsge (size!34867 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96762 d!130623))

(declare-fun d!130625 () Bool)

(assert (=> d!130625 (= (array_inv!26445 _values!874) (bvsge (size!34868 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96762 d!130625))

(declare-fun d!130627 () Bool)

(declare-fun res!734651 () Bool)

(declare-fun e!628399 () Bool)

(assert (=> d!130627 (=> res!734651 e!628399)))

(assert (=> d!130627 (= res!734651 (bvsge #b00000000000000000000000000000000 (size!34867 lt!493301)))))

(assert (=> d!130627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493301 mask!1414) e!628399)))

(declare-fun b!1100966 () Bool)

(declare-fun e!628400 () Bool)

(assert (=> b!1100966 (= e!628399 e!628400)))

(declare-fun c!108765 () Bool)

(assert (=> b!1100966 (= c!108765 (validKeyInArray!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000)))))

(declare-fun b!1100967 () Bool)

(declare-fun e!628401 () Bool)

(assert (=> b!1100967 (= e!628400 e!628401)))

(declare-fun lt!493477 () (_ BitVec 64))

(assert (=> b!1100967 (= lt!493477 (select (arr!34331 lt!493301) #b00000000000000000000000000000000))))

(declare-fun lt!493476 () Unit!36186)

(assert (=> b!1100967 (= lt!493476 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493301 lt!493477 #b00000000000000000000000000000000))))

(assert (=> b!1100967 (arrayContainsKey!0 lt!493301 lt!493477 #b00000000000000000000000000000000)))

(declare-fun lt!493478 () Unit!36186)

(assert (=> b!1100967 (= lt!493478 lt!493476)))

(declare-fun res!734652 () Bool)

(declare-datatypes ((SeekEntryResult!9913 0))(
  ( (MissingZero!9913 (index!42023 (_ BitVec 32))) (Found!9913 (index!42024 (_ BitVec 32))) (Intermediate!9913 (undefined!10725 Bool) (index!42025 (_ BitVec 32)) (x!99004 (_ BitVec 32))) (Undefined!9913) (MissingVacant!9913 (index!42026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71333 (_ BitVec 32)) SeekEntryResult!9913)

(assert (=> b!1100967 (= res!734652 (= (seekEntryOrOpen!0 (select (arr!34331 lt!493301) #b00000000000000000000000000000000) lt!493301 mask!1414) (Found!9913 #b00000000000000000000000000000000)))))

(assert (=> b!1100967 (=> (not res!734652) (not e!628401))))

(declare-fun bm!46128 () Bool)

(declare-fun call!46131 () Bool)

(assert (=> bm!46128 (= call!46131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493301 mask!1414))))

(declare-fun b!1100968 () Bool)

(assert (=> b!1100968 (= e!628401 call!46131)))

(declare-fun b!1100969 () Bool)

(assert (=> b!1100969 (= e!628400 call!46131)))

(assert (= (and d!130627 (not res!734651)) b!1100966))

(assert (= (and b!1100966 c!108765) b!1100967))

(assert (= (and b!1100966 (not c!108765)) b!1100969))

(assert (= (and b!1100967 res!734652) b!1100968))

(assert (= (or b!1100968 b!1100969) bm!46128))

(assert (=> b!1100966 m!1020955))

(assert (=> b!1100966 m!1020955))

(assert (=> b!1100966 m!1020957))

(assert (=> b!1100967 m!1020955))

(declare-fun m!1021125 () Bool)

(assert (=> b!1100967 m!1021125))

(declare-fun m!1021127 () Bool)

(assert (=> b!1100967 m!1021127))

(assert (=> b!1100967 m!1020955))

(declare-fun m!1021129 () Bool)

(assert (=> b!1100967 m!1021129))

(declare-fun m!1021131 () Bool)

(assert (=> bm!46128 m!1021131))

(assert (=> b!1100740 d!130627))

(declare-fun d!130629 () Bool)

(assert (=> d!130629 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100731 d!130629))

(declare-fun d!130631 () Bool)

(declare-fun res!734653 () Bool)

(declare-fun e!628402 () Bool)

(assert (=> d!130631 (=> res!734653 e!628402)))

(assert (=> d!130631 (= res!734653 (bvsge #b00000000000000000000000000000000 (size!34867 _keys!1070)))))

(assert (=> d!130631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628402)))

(declare-fun b!1100970 () Bool)

(declare-fun e!628403 () Bool)

(assert (=> b!1100970 (= e!628402 e!628403)))

(declare-fun c!108766 () Bool)

(assert (=> b!1100970 (= c!108766 (validKeyInArray!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100971 () Bool)

(declare-fun e!628404 () Bool)

(assert (=> b!1100971 (= e!628403 e!628404)))

(declare-fun lt!493480 () (_ BitVec 64))

(assert (=> b!1100971 (= lt!493480 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493479 () Unit!36186)

(assert (=> b!1100971 (= lt!493479 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493480 #b00000000000000000000000000000000))))

(assert (=> b!1100971 (arrayContainsKey!0 _keys!1070 lt!493480 #b00000000000000000000000000000000)))

(declare-fun lt!493481 () Unit!36186)

(assert (=> b!1100971 (= lt!493481 lt!493479)))

(declare-fun res!734654 () Bool)

(assert (=> b!1100971 (= res!734654 (= (seekEntryOrOpen!0 (select (arr!34331 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9913 #b00000000000000000000000000000000)))))

(assert (=> b!1100971 (=> (not res!734654) (not e!628404))))

(declare-fun bm!46129 () Bool)

(declare-fun call!46132 () Bool)

(assert (=> bm!46129 (= call!46132 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1100972 () Bool)

(assert (=> b!1100972 (= e!628404 call!46132)))

(declare-fun b!1100973 () Bool)

(assert (=> b!1100973 (= e!628403 call!46132)))

(assert (= (and d!130631 (not res!734653)) b!1100970))

(assert (= (and b!1100970 c!108766) b!1100971))

(assert (= (and b!1100970 (not c!108766)) b!1100973))

(assert (= (and b!1100971 res!734654) b!1100972))

(assert (= (or b!1100972 b!1100973) bm!46129))

(assert (=> b!1100970 m!1020963))

(assert (=> b!1100970 m!1020963))

(assert (=> b!1100970 m!1021007))

(assert (=> b!1100971 m!1020963))

(declare-fun m!1021133 () Bool)

(assert (=> b!1100971 m!1021133))

(declare-fun m!1021135 () Bool)

(assert (=> b!1100971 m!1021135))

(assert (=> b!1100971 m!1020963))

(declare-fun m!1021137 () Bool)

(assert (=> b!1100971 m!1021137))

(declare-fun m!1021139 () Bool)

(assert (=> bm!46129 m!1021139))

(assert (=> b!1100741 d!130631))

(declare-fun mapNonEmpty!42598 () Bool)

(declare-fun mapRes!42598 () Bool)

(declare-fun tp!81428 () Bool)

(declare-fun e!628409 () Bool)

(assert (=> mapNonEmpty!42598 (= mapRes!42598 (and tp!81428 e!628409))))

(declare-fun mapKey!42598 () (_ BitVec 32))

(declare-fun mapRest!42598 () (Array (_ BitVec 32) ValueCell!12894))

(declare-fun mapValue!42598 () ValueCell!12894)

(assert (=> mapNonEmpty!42598 (= mapRest!42592 (store mapRest!42598 mapKey!42598 mapValue!42598))))

(declare-fun condMapEmpty!42598 () Bool)

(declare-fun mapDefault!42598 () ValueCell!12894)

(assert (=> mapNonEmpty!42592 (= condMapEmpty!42598 (= mapRest!42592 ((as const (Array (_ BitVec 32) ValueCell!12894)) mapDefault!42598)))))

(declare-fun e!628410 () Bool)

(assert (=> mapNonEmpty!42592 (= tp!81418 (and e!628410 mapRes!42598))))

(declare-fun mapIsEmpty!42598 () Bool)

(assert (=> mapIsEmpty!42598 mapRes!42598))

(declare-fun b!1100981 () Bool)

(assert (=> b!1100981 (= e!628410 tp_is_empty!27207)))

(declare-fun b!1100980 () Bool)

(assert (=> b!1100980 (= e!628409 tp_is_empty!27207)))

(assert (= (and mapNonEmpty!42592 condMapEmpty!42598) mapIsEmpty!42598))

(assert (= (and mapNonEmpty!42592 (not condMapEmpty!42598)) mapNonEmpty!42598))

(assert (= (and mapNonEmpty!42598 ((_ is ValueCellFull!12894) mapValue!42598)) b!1100980))

(assert (= (and mapNonEmpty!42592 ((_ is ValueCellFull!12894) mapDefault!42598)) b!1100981))

(declare-fun m!1021141 () Bool)

(assert (=> mapNonEmpty!42598 m!1021141))

(declare-fun b_lambda!18045 () Bool)

(assert (= b_lambda!18035 (or (and start!96762 b_free!23157) b_lambda!18045)))

(declare-fun b_lambda!18047 () Bool)

(assert (= b_lambda!18037 (or (and start!96762 b_free!23157) b_lambda!18047)))

(declare-fun b_lambda!18049 () Bool)

(assert (= b_lambda!18033 (or (and start!96762 b_free!23157) b_lambda!18049)))

(declare-fun b_lambda!18051 () Bool)

(assert (= b_lambda!18039 (or (and start!96762 b_free!23157) b_lambda!18051)))

(declare-fun b_lambda!18053 () Bool)

(assert (= b_lambda!18043 (or (and start!96762 b_free!23157) b_lambda!18053)))

(declare-fun b_lambda!18055 () Bool)

(assert (= b_lambda!18041 (or (and start!96762 b_free!23157) b_lambda!18055)))

(declare-fun b_lambda!18057 () Bool)

(assert (= b_lambda!18031 (or (and start!96762 b_free!23157) b_lambda!18057)))

(check-sat (not b!1100952) (not bm!46103) (not b!1100849) (not b!1100866) (not bm!46105) (not b_lambda!18055) (not b!1100853) (not b!1100863) (not d!130599) (not d!130617) (not d!130611) (not b!1100887) (not bm!46123) (not b!1100944) (not mapNonEmpty!42598) (not b_next!23157) (not b!1100943) (not d!130615) (not bm!46113) (not bm!46125) (not b!1100941) b_and!37095 (not b_lambda!18045) (not bm!46129) (not b!1100940) (not bm!46120) (not b!1100966) (not d!130605) (not b!1100930) (not bm!46111) (not b!1100954) (not bm!46124) (not b!1100925) (not d!130603) (not b!1100933) (not d!130607) (not b!1100874) (not bm!46110) (not b!1100889) (not d!130609) (not b!1100888) (not b_lambda!18047) (not bm!46086) (not b!1100850) (not b_lambda!18053) (not b_lambda!18049) (not bm!46119) (not bm!46104) (not b_lambda!18051) (not b!1100804) (not b!1100956) (not b!1100886) (not bm!46128) (not b!1100970) (not b!1100789) (not b!1100923) (not b!1100929) (not b!1100897) (not b_lambda!18057) (not b!1100949) (not bm!46112) (not b!1100871) (not b!1100967) (not b!1100870) (not b!1100957) (not b!1100947) (not b!1100951) (not b!1100867) (not b!1100926) (not b!1100971) (not b!1100805) (not b!1100948) (not b!1100790) (not b!1100934) (not b!1100865) (not b!1100802) tp_is_empty!27207 (not b!1100868) (not b_lambda!18029) (not b!1100884) (not bm!46106) (not b!1100931))
(check-sat b_and!37095 (not b_next!23157))
