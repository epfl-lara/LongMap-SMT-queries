; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100364 () Bool)

(assert start!100364)

(declare-fun b_free!25711 () Bool)

(declare-fun b_next!25711 () Bool)

(assert (=> start!100364 (= b_free!25711 (not b_next!25711))))

(declare-fun tp!90119 () Bool)

(declare-fun b_and!42291 () Bool)

(assert (=> start!100364 (= tp!90119 b_and!42291)))

(declare-fun mapNonEmpty!47462 () Bool)

(declare-fun mapRes!47462 () Bool)

(declare-fun tp!90120 () Bool)

(declare-fun e!680436 () Bool)

(assert (=> mapNonEmpty!47462 (= mapRes!47462 (and tp!90120 e!680436))))

(declare-datatypes ((V!45681 0))(
  ( (V!45682 (val!15264 Int)) )
))
(declare-datatypes ((ValueCell!14498 0))(
  ( (ValueCellFull!14498 (v!17901 V!45681)) (EmptyCell!14498) )
))
(declare-fun mapValue!47462 () ValueCell!14498)

(declare-fun mapRest!47462 () (Array (_ BitVec 32) ValueCell!14498))

(declare-datatypes ((array!77538 0))(
  ( (array!77539 (arr!37415 (Array (_ BitVec 32) ValueCell!14498)) (size!37953 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77538)

(declare-fun mapKey!47462 () (_ BitVec 32))

(assert (=> mapNonEmpty!47462 (= (arr!37415 _values!996) (store mapRest!47462 mapKey!47462 mapValue!47462))))

(declare-fun b!1197834 () Bool)

(declare-fun res!797204 () Bool)

(declare-fun e!680432 () Bool)

(assert (=> b!1197834 (=> (not res!797204) (not e!680432))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77540 0))(
  ( (array!77541 (arr!37416 (Array (_ BitVec 32) (_ BitVec 64))) (size!37954 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77540)

(assert (=> b!1197834 (= res!797204 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37954 _keys!1208))))))

(declare-fun b!1197835 () Bool)

(declare-fun tp_is_empty!30415 () Bool)

(assert (=> b!1197835 (= e!680436 tp_is_empty!30415)))

(declare-fun b!1197836 () Bool)

(declare-fun res!797206 () Bool)

(assert (=> b!1197836 (=> (not res!797206) (not e!680432))))

(declare-datatypes ((List!26411 0))(
  ( (Nil!26408) (Cons!26407 (h!27616 (_ BitVec 64)) (t!39105 List!26411)) )
))
(declare-fun arrayNoDuplicates!0 (array!77540 (_ BitVec 32) List!26411) Bool)

(assert (=> b!1197836 (= res!797206 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26408))))

(declare-fun res!797203 () Bool)

(assert (=> start!100364 (=> (not res!797203) (not e!680432))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100364 (= res!797203 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37954 _keys!1208))))))

(assert (=> start!100364 e!680432))

(assert (=> start!100364 tp_is_empty!30415))

(declare-fun array_inv!28634 (array!77540) Bool)

(assert (=> start!100364 (array_inv!28634 _keys!1208)))

(assert (=> start!100364 true))

(assert (=> start!100364 tp!90119))

(declare-fun e!680434 () Bool)

(declare-fun array_inv!28635 (array!77538) Bool)

(assert (=> start!100364 (and (array_inv!28635 _values!996) e!680434)))

(declare-fun zeroValue!944 () V!45681)

(declare-fun lt!543186 () array!77540)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!680437 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45681)

(declare-fun b!1197837 () Bool)

(declare-datatypes ((tuple2!19624 0))(
  ( (tuple2!19625 (_1!9823 (_ BitVec 64)) (_2!9823 V!45681)) )
))
(declare-datatypes ((List!26412 0))(
  ( (Nil!26409) (Cons!26408 (h!27617 tuple2!19624) (t!39106 List!26412)) )
))
(declare-datatypes ((ListLongMap!17593 0))(
  ( (ListLongMap!17594 (toList!8812 List!26412)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5261 (array!77540 array!77538 (_ BitVec 32) (_ BitVec 32) V!45681 V!45681 (_ BitVec 32) Int) ListLongMap!17593)

(declare-fun dynLambda!3145 (Int (_ BitVec 64)) V!45681)

(assert (=> b!1197837 (= e!680437 (= (getCurrentListMapNoExtraKeys!5261 lt!543186 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun b!1197838 () Bool)

(declare-fun e!680435 () Bool)

(assert (=> b!1197838 (= e!680434 (and e!680435 mapRes!47462))))

(declare-fun condMapEmpty!47462 () Bool)

(declare-fun mapDefault!47462 () ValueCell!14498)

(assert (=> b!1197838 (= condMapEmpty!47462 (= (arr!37415 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14498)) mapDefault!47462)))))

(declare-fun b!1197839 () Bool)

(declare-fun e!680433 () Bool)

(assert (=> b!1197839 (= e!680432 e!680433)))

(declare-fun res!797210 () Bool)

(assert (=> b!1197839 (=> (not res!797210) (not e!680433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77540 (_ BitVec 32)) Bool)

(assert (=> b!1197839 (= res!797210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543186 mask!1564))))

(assert (=> b!1197839 (= lt!543186 (array!77541 (store (arr!37416 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37954 _keys!1208)))))

(declare-fun b!1197840 () Bool)

(assert (=> b!1197840 (= e!680435 tp_is_empty!30415)))

(declare-fun b!1197841 () Bool)

(declare-fun res!797201 () Bool)

(assert (=> b!1197841 (=> (not res!797201) (not e!680432))))

(assert (=> b!1197841 (= res!797201 (and (= (size!37953 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37954 _keys!1208) (size!37953 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197842 () Bool)

(declare-fun res!797211 () Bool)

(assert (=> b!1197842 (=> (not res!797211) (not e!680432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197842 (= res!797211 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47462 () Bool)

(assert (=> mapIsEmpty!47462 mapRes!47462))

(declare-fun b!1197843 () Bool)

(declare-fun res!797205 () Bool)

(assert (=> b!1197843 (=> (not res!797205) (not e!680432))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197843 (= res!797205 (validKeyInArray!0 k0!934))))

(declare-fun b!1197844 () Bool)

(assert (=> b!1197844 (= e!680433 (not e!680437))))

(declare-fun res!797208 () Bool)

(assert (=> b!1197844 (=> res!797208 e!680437)))

(assert (=> b!1197844 (= res!797208 (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37954 _keys!1208))))))

(declare-fun arrayContainsKey!0 (array!77540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197844 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39581 0))(
  ( (Unit!39582) )
))
(declare-fun lt!543185 () Unit!39581)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77540 (_ BitVec 64) (_ BitVec 32)) Unit!39581)

(assert (=> b!1197844 (= lt!543185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197845 () Bool)

(declare-fun res!797209 () Bool)

(assert (=> b!1197845 (=> (not res!797209) (not e!680432))))

(assert (=> b!1197845 (= res!797209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197846 () Bool)

(declare-fun res!797202 () Bool)

(assert (=> b!1197846 (=> (not res!797202) (not e!680433))))

(assert (=> b!1197846 (= res!797202 (arrayNoDuplicates!0 lt!543186 #b00000000000000000000000000000000 Nil!26408))))

(declare-fun b!1197847 () Bool)

(declare-fun res!797207 () Bool)

(assert (=> b!1197847 (=> (not res!797207) (not e!680432))))

(assert (=> b!1197847 (= res!797207 (= (select (arr!37416 _keys!1208) i!673) k0!934))))

(assert (= (and start!100364 res!797203) b!1197842))

(assert (= (and b!1197842 res!797211) b!1197841))

(assert (= (and b!1197841 res!797201) b!1197845))

(assert (= (and b!1197845 res!797209) b!1197836))

(assert (= (and b!1197836 res!797206) b!1197834))

(assert (= (and b!1197834 res!797204) b!1197843))

(assert (= (and b!1197843 res!797205) b!1197847))

(assert (= (and b!1197847 res!797207) b!1197839))

(assert (= (and b!1197839 res!797210) b!1197846))

(assert (= (and b!1197846 res!797202) b!1197844))

(assert (= (and b!1197844 (not res!797208)) b!1197837))

(assert (= (and b!1197838 condMapEmpty!47462) mapIsEmpty!47462))

(assert (= (and b!1197838 (not condMapEmpty!47462)) mapNonEmpty!47462))

(get-info :version)

(assert (= (and mapNonEmpty!47462 ((_ is ValueCellFull!14498) mapValue!47462)) b!1197835))

(assert (= (and b!1197838 ((_ is ValueCellFull!14498) mapDefault!47462)) b!1197840))

(assert (= start!100364 b!1197838))

(declare-fun b_lambda!20883 () Bool)

(assert (=> (not b_lambda!20883) (not b!1197837)))

(declare-fun t!39104 () Bool)

(declare-fun tb!10515 () Bool)

(assert (=> (and start!100364 (= defaultEntry!1004 defaultEntry!1004) t!39104) tb!10515))

(declare-fun result!21613 () Bool)

(assert (=> tb!10515 (= result!21613 tp_is_empty!30415)))

(assert (=> b!1197837 t!39104))

(declare-fun b_and!42293 () Bool)

(assert (= b_and!42291 (and (=> t!39104 result!21613) b_and!42293)))

(declare-fun m!1104231 () Bool)

(assert (=> mapNonEmpty!47462 m!1104231))

(declare-fun m!1104233 () Bool)

(assert (=> start!100364 m!1104233))

(declare-fun m!1104235 () Bool)

(assert (=> start!100364 m!1104235))

(declare-fun m!1104237 () Bool)

(assert (=> b!1197847 m!1104237))

(declare-fun m!1104239 () Bool)

(assert (=> b!1197843 m!1104239))

(declare-fun m!1104241 () Bool)

(assert (=> b!1197836 m!1104241))

(declare-fun m!1104243 () Bool)

(assert (=> b!1197846 m!1104243))

(declare-fun m!1104245 () Bool)

(assert (=> b!1197842 m!1104245))

(declare-fun m!1104247 () Bool)

(assert (=> b!1197837 m!1104247))

(declare-fun m!1104249 () Bool)

(assert (=> b!1197837 m!1104249))

(declare-fun m!1104251 () Bool)

(assert (=> b!1197837 m!1104251))

(declare-fun m!1104253 () Bool)

(assert (=> b!1197837 m!1104253))

(declare-fun m!1104255 () Bool)

(assert (=> b!1197844 m!1104255))

(declare-fun m!1104257 () Bool)

(assert (=> b!1197844 m!1104257))

(declare-fun m!1104259 () Bool)

(assert (=> b!1197845 m!1104259))

(declare-fun m!1104261 () Bool)

(assert (=> b!1197839 m!1104261))

(declare-fun m!1104263 () Bool)

(assert (=> b!1197839 m!1104263))

(check-sat (not b!1197842) (not b!1197845) (not b!1197844) (not mapNonEmpty!47462) (not b_lambda!20883) (not b!1197836) (not b!1197843) tp_is_empty!30415 (not b_next!25711) (not start!100364) b_and!42293 (not b!1197839) (not b!1197846) (not b!1197837))
(check-sat b_and!42293 (not b_next!25711))
(get-model)

(declare-fun b_lambda!20889 () Bool)

(assert (= b_lambda!20883 (or (and start!100364 b_free!25711) b_lambda!20889)))

(check-sat (not b_lambda!20889) (not b!1197842) (not b!1197845) (not b!1197844) (not mapNonEmpty!47462) (not b!1197836) (not b!1197843) tp_is_empty!30415 (not b_next!25711) (not start!100364) b_and!42293 (not b!1197839) (not b!1197846) (not b!1197837))
(check-sat b_and!42293 (not b_next!25711))
(get-model)

(declare-fun b!1197946 () Bool)

(declare-fun e!680488 () Bool)

(declare-fun e!680489 () Bool)

(assert (=> b!1197946 (= e!680488 e!680489)))

(declare-fun c!117390 () Bool)

(assert (=> b!1197946 (= c!117390 (validKeyInArray!0 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57246 () Bool)

(declare-fun call!57249 () Bool)

(assert (=> bm!57246 (= call!57249 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1197947 () Bool)

(assert (=> b!1197947 (= e!680489 call!57249)))

(declare-fun d!132245 () Bool)

(declare-fun res!797282 () Bool)

(assert (=> d!132245 (=> res!797282 e!680488)))

(assert (=> d!132245 (= res!797282 (bvsge #b00000000000000000000000000000000 (size!37954 _keys!1208)))))

(assert (=> d!132245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!680488)))

(declare-fun b!1197948 () Bool)

(declare-fun e!680487 () Bool)

(assert (=> b!1197948 (= e!680487 call!57249)))

(declare-fun b!1197949 () Bool)

(assert (=> b!1197949 (= e!680489 e!680487)))

(declare-fun lt!543206 () (_ BitVec 64))

(assert (=> b!1197949 (= lt!543206 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543207 () Unit!39581)

(assert (=> b!1197949 (= lt!543207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543206 #b00000000000000000000000000000000))))

(assert (=> b!1197949 (arrayContainsKey!0 _keys!1208 lt!543206 #b00000000000000000000000000000000)))

(declare-fun lt!543205 () Unit!39581)

(assert (=> b!1197949 (= lt!543205 lt!543207)))

(declare-fun res!797283 () Bool)

(declare-datatypes ((SeekEntryResult!9931 0))(
  ( (MissingZero!9931 (index!42095 (_ BitVec 32))) (Found!9931 (index!42096 (_ BitVec 32))) (Intermediate!9931 (undefined!10743 Bool) (index!42097 (_ BitVec 32)) (x!105924 (_ BitVec 32))) (Undefined!9931) (MissingVacant!9931 (index!42098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77540 (_ BitVec 32)) SeekEntryResult!9931)

(assert (=> b!1197949 (= res!797283 (= (seekEntryOrOpen!0 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9931 #b00000000000000000000000000000000)))))

(assert (=> b!1197949 (=> (not res!797283) (not e!680487))))

(assert (= (and d!132245 (not res!797282)) b!1197946))

(assert (= (and b!1197946 c!117390) b!1197949))

(assert (= (and b!1197946 (not c!117390)) b!1197947))

(assert (= (and b!1197949 res!797283) b!1197948))

(assert (= (or b!1197948 b!1197947) bm!57246))

(declare-fun m!1104333 () Bool)

(assert (=> b!1197946 m!1104333))

(assert (=> b!1197946 m!1104333))

(declare-fun m!1104335 () Bool)

(assert (=> b!1197946 m!1104335))

(declare-fun m!1104337 () Bool)

(assert (=> bm!57246 m!1104337))

(assert (=> b!1197949 m!1104333))

(declare-fun m!1104339 () Bool)

(assert (=> b!1197949 m!1104339))

(declare-fun m!1104341 () Bool)

(assert (=> b!1197949 m!1104341))

(assert (=> b!1197949 m!1104333))

(declare-fun m!1104343 () Bool)

(assert (=> b!1197949 m!1104343))

(assert (=> b!1197845 d!132245))

(declare-fun b!1197950 () Bool)

(declare-fun e!680491 () Bool)

(declare-fun e!680492 () Bool)

(assert (=> b!1197950 (= e!680491 e!680492)))

(declare-fun c!117391 () Bool)

(assert (=> b!1197950 (= c!117391 (validKeyInArray!0 (select (arr!37416 lt!543186) #b00000000000000000000000000000000)))))

(declare-fun bm!57247 () Bool)

(declare-fun call!57250 () Bool)

(assert (=> bm!57247 (= call!57250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543186 mask!1564))))

(declare-fun b!1197951 () Bool)

(assert (=> b!1197951 (= e!680492 call!57250)))

(declare-fun d!132247 () Bool)

(declare-fun res!797284 () Bool)

(assert (=> d!132247 (=> res!797284 e!680491)))

(assert (=> d!132247 (= res!797284 (bvsge #b00000000000000000000000000000000 (size!37954 lt!543186)))))

(assert (=> d!132247 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543186 mask!1564) e!680491)))

(declare-fun b!1197952 () Bool)

(declare-fun e!680490 () Bool)

(assert (=> b!1197952 (= e!680490 call!57250)))

(declare-fun b!1197953 () Bool)

(assert (=> b!1197953 (= e!680492 e!680490)))

(declare-fun lt!543209 () (_ BitVec 64))

(assert (=> b!1197953 (= lt!543209 (select (arr!37416 lt!543186) #b00000000000000000000000000000000))))

(declare-fun lt!543210 () Unit!39581)

(assert (=> b!1197953 (= lt!543210 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543186 lt!543209 #b00000000000000000000000000000000))))

(assert (=> b!1197953 (arrayContainsKey!0 lt!543186 lt!543209 #b00000000000000000000000000000000)))

(declare-fun lt!543208 () Unit!39581)

(assert (=> b!1197953 (= lt!543208 lt!543210)))

(declare-fun res!797285 () Bool)

(assert (=> b!1197953 (= res!797285 (= (seekEntryOrOpen!0 (select (arr!37416 lt!543186) #b00000000000000000000000000000000) lt!543186 mask!1564) (Found!9931 #b00000000000000000000000000000000)))))

(assert (=> b!1197953 (=> (not res!797285) (not e!680490))))

(assert (= (and d!132247 (not res!797284)) b!1197950))

(assert (= (and b!1197950 c!117391) b!1197953))

(assert (= (and b!1197950 (not c!117391)) b!1197951))

(assert (= (and b!1197953 res!797285) b!1197952))

(assert (= (or b!1197952 b!1197951) bm!57247))

(declare-fun m!1104345 () Bool)

(assert (=> b!1197950 m!1104345))

(assert (=> b!1197950 m!1104345))

(declare-fun m!1104347 () Bool)

(assert (=> b!1197950 m!1104347))

(declare-fun m!1104349 () Bool)

(assert (=> bm!57247 m!1104349))

(assert (=> b!1197953 m!1104345))

(declare-fun m!1104351 () Bool)

(assert (=> b!1197953 m!1104351))

(declare-fun m!1104353 () Bool)

(assert (=> b!1197953 m!1104353))

(assert (=> b!1197953 m!1104345))

(declare-fun m!1104355 () Bool)

(assert (=> b!1197953 m!1104355))

(assert (=> b!1197839 d!132247))

(declare-fun d!132249 () Bool)

(assert (=> d!132249 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1197843 d!132249))

(declare-fun d!132251 () Bool)

(declare-fun res!797290 () Bool)

(declare-fun e!680497 () Bool)

(assert (=> d!132251 (=> res!797290 e!680497)))

(assert (=> d!132251 (= res!797290 (= (select (arr!37416 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132251 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!680497)))

(declare-fun b!1197958 () Bool)

(declare-fun e!680498 () Bool)

(assert (=> b!1197958 (= e!680497 e!680498)))

(declare-fun res!797291 () Bool)

(assert (=> b!1197958 (=> (not res!797291) (not e!680498))))

(assert (=> b!1197958 (= res!797291 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37954 _keys!1208)))))

(declare-fun b!1197959 () Bool)

(assert (=> b!1197959 (= e!680498 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132251 (not res!797290)) b!1197958))

(assert (= (and b!1197958 res!797291) b!1197959))

(assert (=> d!132251 m!1104333))

(declare-fun m!1104357 () Bool)

(assert (=> b!1197959 m!1104357))

(assert (=> b!1197844 d!132251))

(declare-fun d!132253 () Bool)

(assert (=> d!132253 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543213 () Unit!39581)

(declare-fun choose!13 (array!77540 (_ BitVec 64) (_ BitVec 32)) Unit!39581)

(assert (=> d!132253 (= lt!543213 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132253 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132253 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543213)))

(declare-fun bs!33935 () Bool)

(assert (= bs!33935 d!132253))

(assert (=> bs!33935 m!1104255))

(declare-fun m!1104359 () Bool)

(assert (=> bs!33935 m!1104359))

(assert (=> b!1197844 d!132253))

(declare-fun b!1197970 () Bool)

(declare-fun e!680508 () Bool)

(declare-fun e!680509 () Bool)

(assert (=> b!1197970 (= e!680508 e!680509)))

(declare-fun c!117394 () Bool)

(assert (=> b!1197970 (= c!117394 (validKeyInArray!0 (select (arr!37416 lt!543186) #b00000000000000000000000000000000)))))

(declare-fun b!1197971 () Bool)

(declare-fun e!680507 () Bool)

(declare-fun contains!6846 (List!26411 (_ BitVec 64)) Bool)

(assert (=> b!1197971 (= e!680507 (contains!6846 Nil!26408 (select (arr!37416 lt!543186) #b00000000000000000000000000000000)))))

(declare-fun bm!57250 () Bool)

(declare-fun call!57253 () Bool)

(assert (=> bm!57250 (= call!57253 (arrayNoDuplicates!0 lt!543186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117394 (Cons!26407 (select (arr!37416 lt!543186) #b00000000000000000000000000000000) Nil!26408) Nil!26408)))))

(declare-fun d!132255 () Bool)

(declare-fun res!797298 () Bool)

(declare-fun e!680510 () Bool)

(assert (=> d!132255 (=> res!797298 e!680510)))

(assert (=> d!132255 (= res!797298 (bvsge #b00000000000000000000000000000000 (size!37954 lt!543186)))))

(assert (=> d!132255 (= (arrayNoDuplicates!0 lt!543186 #b00000000000000000000000000000000 Nil!26408) e!680510)))

(declare-fun b!1197972 () Bool)

(assert (=> b!1197972 (= e!680509 call!57253)))

(declare-fun b!1197973 () Bool)

(assert (=> b!1197973 (= e!680509 call!57253)))

(declare-fun b!1197974 () Bool)

(assert (=> b!1197974 (= e!680510 e!680508)))

(declare-fun res!797299 () Bool)

(assert (=> b!1197974 (=> (not res!797299) (not e!680508))))

(assert (=> b!1197974 (= res!797299 (not e!680507))))

(declare-fun res!797300 () Bool)

(assert (=> b!1197974 (=> (not res!797300) (not e!680507))))

(assert (=> b!1197974 (= res!797300 (validKeyInArray!0 (select (arr!37416 lt!543186) #b00000000000000000000000000000000)))))

(assert (= (and d!132255 (not res!797298)) b!1197974))

(assert (= (and b!1197974 res!797300) b!1197971))

(assert (= (and b!1197974 res!797299) b!1197970))

(assert (= (and b!1197970 c!117394) b!1197973))

(assert (= (and b!1197970 (not c!117394)) b!1197972))

(assert (= (or b!1197973 b!1197972) bm!57250))

(assert (=> b!1197970 m!1104345))

(assert (=> b!1197970 m!1104345))

(assert (=> b!1197970 m!1104347))

(assert (=> b!1197971 m!1104345))

(assert (=> b!1197971 m!1104345))

(declare-fun m!1104361 () Bool)

(assert (=> b!1197971 m!1104361))

(assert (=> bm!57250 m!1104345))

(declare-fun m!1104363 () Bool)

(assert (=> bm!57250 m!1104363))

(assert (=> b!1197974 m!1104345))

(assert (=> b!1197974 m!1104345))

(assert (=> b!1197974 m!1104347))

(assert (=> b!1197846 d!132255))

(declare-fun b!1197975 () Bool)

(declare-fun e!680512 () Bool)

(declare-fun e!680513 () Bool)

(assert (=> b!1197975 (= e!680512 e!680513)))

(declare-fun c!117395 () Bool)

(assert (=> b!1197975 (= c!117395 (validKeyInArray!0 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1197976 () Bool)

(declare-fun e!680511 () Bool)

(assert (=> b!1197976 (= e!680511 (contains!6846 Nil!26408 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57251 () Bool)

(declare-fun call!57254 () Bool)

(assert (=> bm!57251 (= call!57254 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117395 (Cons!26407 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000) Nil!26408) Nil!26408)))))

(declare-fun d!132257 () Bool)

(declare-fun res!797301 () Bool)

(declare-fun e!680514 () Bool)

(assert (=> d!132257 (=> res!797301 e!680514)))

(assert (=> d!132257 (= res!797301 (bvsge #b00000000000000000000000000000000 (size!37954 _keys!1208)))))

(assert (=> d!132257 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26408) e!680514)))

(declare-fun b!1197977 () Bool)

(assert (=> b!1197977 (= e!680513 call!57254)))

(declare-fun b!1197978 () Bool)

(assert (=> b!1197978 (= e!680513 call!57254)))

(declare-fun b!1197979 () Bool)

(assert (=> b!1197979 (= e!680514 e!680512)))

(declare-fun res!797302 () Bool)

(assert (=> b!1197979 (=> (not res!797302) (not e!680512))))

(assert (=> b!1197979 (= res!797302 (not e!680511))))

(declare-fun res!797303 () Bool)

(assert (=> b!1197979 (=> (not res!797303) (not e!680511))))

(assert (=> b!1197979 (= res!797303 (validKeyInArray!0 (select (arr!37416 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132257 (not res!797301)) b!1197979))

(assert (= (and b!1197979 res!797303) b!1197976))

(assert (= (and b!1197979 res!797302) b!1197975))

(assert (= (and b!1197975 c!117395) b!1197978))

(assert (= (and b!1197975 (not c!117395)) b!1197977))

(assert (= (or b!1197978 b!1197977) bm!57251))

(assert (=> b!1197975 m!1104333))

(assert (=> b!1197975 m!1104333))

(assert (=> b!1197975 m!1104335))

(assert (=> b!1197976 m!1104333))

(assert (=> b!1197976 m!1104333))

(declare-fun m!1104365 () Bool)

(assert (=> b!1197976 m!1104365))

(assert (=> bm!57251 m!1104333))

(declare-fun m!1104367 () Bool)

(assert (=> bm!57251 m!1104367))

(assert (=> b!1197979 m!1104333))

(assert (=> b!1197979 m!1104333))

(assert (=> b!1197979 m!1104335))

(assert (=> b!1197836 d!132257))

(declare-fun b!1198004 () Bool)

(declare-fun e!680531 () Bool)

(declare-fun e!680535 () Bool)

(assert (=> b!1198004 (= e!680531 e!680535)))

(declare-fun c!117406 () Bool)

(declare-fun e!680530 () Bool)

(assert (=> b!1198004 (= c!117406 e!680530)))

(declare-fun res!797313 () Bool)

(assert (=> b!1198004 (=> (not res!797313) (not e!680530))))

(assert (=> b!1198004 (= res!797313 (bvslt from!1455 (size!37954 lt!543186)))))

(declare-fun b!1198005 () Bool)

(declare-fun e!680534 () ListLongMap!17593)

(declare-fun e!680529 () ListLongMap!17593)

(assert (=> b!1198005 (= e!680534 e!680529)))

(declare-fun c!117405 () Bool)

(assert (=> b!1198005 (= c!117405 (validKeyInArray!0 (select (arr!37416 lt!543186) from!1455)))))

(declare-fun b!1198006 () Bool)

(assert (=> b!1198006 (= e!680534 (ListLongMap!17594 Nil!26409))))

(declare-fun b!1198007 () Bool)

(declare-fun e!680533 () Bool)

(assert (=> b!1198007 (= e!680535 e!680533)))

(assert (=> b!1198007 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37954 lt!543186)))))

(declare-fun res!797314 () Bool)

(declare-fun lt!543234 () ListLongMap!17593)

(declare-fun contains!6847 (ListLongMap!17593 (_ BitVec 64)) Bool)

(assert (=> b!1198007 (= res!797314 (contains!6847 lt!543234 (select (arr!37416 lt!543186) from!1455)))))

(assert (=> b!1198007 (=> (not res!797314) (not e!680533))))

(declare-fun b!1198008 () Bool)

(declare-fun call!57257 () ListLongMap!17593)

(assert (=> b!1198008 (= e!680529 call!57257)))

(declare-fun d!132259 () Bool)

(assert (=> d!132259 e!680531))

(declare-fun res!797312 () Bool)

(assert (=> d!132259 (=> (not res!797312) (not e!680531))))

(assert (=> d!132259 (= res!797312 (not (contains!6847 lt!543234 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132259 (= lt!543234 e!680534)))

(declare-fun c!117407 () Bool)

(assert (=> d!132259 (= c!117407 (bvsge from!1455 (size!37954 lt!543186)))))

(assert (=> d!132259 (validMask!0 mask!1564)))

(assert (=> d!132259 (= (getCurrentListMapNoExtraKeys!5261 lt!543186 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543234)))

(declare-fun b!1198009 () Bool)

(declare-fun e!680532 () Bool)

(assert (=> b!1198009 (= e!680532 (= lt!543234 (getCurrentListMapNoExtraKeys!5261 lt!543186 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198010 () Bool)

(assert (=> b!1198010 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37954 lt!543186)))))

(assert (=> b!1198010 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37953 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996)))))))

(declare-fun apply!952 (ListLongMap!17593 (_ BitVec 64)) V!45681)

(declare-fun get!19114 (ValueCell!14498 V!45681) V!45681)

(assert (=> b!1198010 (= e!680533 (= (apply!952 lt!543234 (select (arr!37416 lt!543186) from!1455)) (get!19114 (select (arr!37415 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996))) from!1455) (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1198011 () Bool)

(assert (=> b!1198011 (= e!680530 (validKeyInArray!0 (select (arr!37416 lt!543186) from!1455)))))

(assert (=> b!1198011 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1198012 () Bool)

(assert (=> b!1198012 (= e!680535 e!680532)))

(declare-fun c!117404 () Bool)

(assert (=> b!1198012 (= c!117404 (bvslt from!1455 (size!37954 lt!543186)))))

(declare-fun b!1198013 () Bool)

(declare-fun isEmpty!984 (ListLongMap!17593) Bool)

(assert (=> b!1198013 (= e!680532 (isEmpty!984 lt!543234))))

(declare-fun b!1198014 () Bool)

(declare-fun lt!543228 () Unit!39581)

(declare-fun lt!543232 () Unit!39581)

(assert (=> b!1198014 (= lt!543228 lt!543232)))

(declare-fun lt!543229 () (_ BitVec 64))

(declare-fun lt!543233 () (_ BitVec 64))

(declare-fun lt!543231 () V!45681)

(declare-fun lt!543230 () ListLongMap!17593)

(declare-fun +!3997 (ListLongMap!17593 tuple2!19624) ListLongMap!17593)

(assert (=> b!1198014 (not (contains!6847 (+!3997 lt!543230 (tuple2!19625 lt!543229 lt!543231)) lt!543233))))

(declare-fun addStillNotContains!288 (ListLongMap!17593 (_ BitVec 64) V!45681 (_ BitVec 64)) Unit!39581)

(assert (=> b!1198014 (= lt!543232 (addStillNotContains!288 lt!543230 lt!543229 lt!543231 lt!543233))))

(assert (=> b!1198014 (= lt!543233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1198014 (= lt!543231 (get!19114 (select (arr!37415 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996))) from!1455) (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198014 (= lt!543229 (select (arr!37416 lt!543186) from!1455))))

(assert (=> b!1198014 (= lt!543230 call!57257)))

(assert (=> b!1198014 (= e!680529 (+!3997 call!57257 (tuple2!19625 (select (arr!37416 lt!543186) from!1455) (get!19114 (select (arr!37415 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996))) from!1455) (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198015 () Bool)

(declare-fun res!797315 () Bool)

(assert (=> b!1198015 (=> (not res!797315) (not e!680531))))

(assert (=> b!1198015 (= res!797315 (not (contains!6847 lt!543234 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!57254 () Bool)

(assert (=> bm!57254 (= call!57257 (getCurrentListMapNoExtraKeys!5261 lt!543186 (array!77539 (store (arr!37415 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!132259 c!117407) b!1198006))

(assert (= (and d!132259 (not c!117407)) b!1198005))

(assert (= (and b!1198005 c!117405) b!1198014))

(assert (= (and b!1198005 (not c!117405)) b!1198008))

(assert (= (or b!1198014 b!1198008) bm!57254))

(assert (= (and d!132259 res!797312) b!1198015))

(assert (= (and b!1198015 res!797315) b!1198004))

(assert (= (and b!1198004 res!797313) b!1198011))

(assert (= (and b!1198004 c!117406) b!1198007))

(assert (= (and b!1198004 (not c!117406)) b!1198012))

(assert (= (and b!1198007 res!797314) b!1198010))

(assert (= (and b!1198012 c!117404) b!1198009))

(assert (= (and b!1198012 (not c!117404)) b!1198013))

(declare-fun b_lambda!20891 () Bool)

(assert (=> (not b_lambda!20891) (not b!1198010)))

(assert (=> b!1198010 t!39104))

(declare-fun b_and!42303 () Bool)

(assert (= b_and!42293 (and (=> t!39104 result!21613) b_and!42303)))

(declare-fun b_lambda!20893 () Bool)

(assert (=> (not b_lambda!20893) (not b!1198014)))

(assert (=> b!1198014 t!39104))

(declare-fun b_and!42305 () Bool)

(assert (= b_and!42303 (and (=> t!39104 result!21613) b_and!42305)))

(declare-fun m!1104369 () Bool)

(assert (=> b!1198015 m!1104369))

(declare-fun m!1104371 () Bool)

(assert (=> d!132259 m!1104371))

(assert (=> d!132259 m!1104245))

(declare-fun m!1104373 () Bool)

(assert (=> b!1198005 m!1104373))

(assert (=> b!1198005 m!1104373))

(declare-fun m!1104375 () Bool)

(assert (=> b!1198005 m!1104375))

(declare-fun m!1104377 () Bool)

(assert (=> bm!57254 m!1104377))

(declare-fun m!1104379 () Bool)

(assert (=> b!1198010 m!1104379))

(assert (=> b!1198010 m!1104247))

(declare-fun m!1104381 () Bool)

(assert (=> b!1198010 m!1104381))

(assert (=> b!1198010 m!1104373))

(assert (=> b!1198010 m!1104247))

(assert (=> b!1198010 m!1104379))

(assert (=> b!1198010 m!1104373))

(declare-fun m!1104383 () Bool)

(assert (=> b!1198010 m!1104383))

(assert (=> b!1198009 m!1104377))

(declare-fun m!1104385 () Bool)

(assert (=> b!1198014 m!1104385))

(declare-fun m!1104387 () Bool)

(assert (=> b!1198014 m!1104387))

(assert (=> b!1198014 m!1104379))

(assert (=> b!1198014 m!1104247))

(assert (=> b!1198014 m!1104381))

(assert (=> b!1198014 m!1104385))

(assert (=> b!1198014 m!1104373))

(assert (=> b!1198014 m!1104247))

(declare-fun m!1104389 () Bool)

(assert (=> b!1198014 m!1104389))

(declare-fun m!1104391 () Bool)

(assert (=> b!1198014 m!1104391))

(assert (=> b!1198014 m!1104379))

(assert (=> b!1198011 m!1104373))

(assert (=> b!1198011 m!1104373))

(assert (=> b!1198011 m!1104375))

(declare-fun m!1104393 () Bool)

(assert (=> b!1198013 m!1104393))

(assert (=> b!1198007 m!1104373))

(assert (=> b!1198007 m!1104373))

(declare-fun m!1104395 () Bool)

(assert (=> b!1198007 m!1104395))

(assert (=> b!1197837 d!132259))

(declare-fun b!1198016 () Bool)

(declare-fun e!680538 () Bool)

(declare-fun e!680542 () Bool)

(assert (=> b!1198016 (= e!680538 e!680542)))

(declare-fun c!117410 () Bool)

(declare-fun e!680537 () Bool)

(assert (=> b!1198016 (= c!117410 e!680537)))

(declare-fun res!797317 () Bool)

(assert (=> b!1198016 (=> (not res!797317) (not e!680537))))

(assert (=> b!1198016 (= res!797317 (bvslt from!1455 (size!37954 _keys!1208)))))

(declare-fun b!1198017 () Bool)

(declare-fun e!680541 () ListLongMap!17593)

(declare-fun e!680536 () ListLongMap!17593)

(assert (=> b!1198017 (= e!680541 e!680536)))

(declare-fun c!117409 () Bool)

(assert (=> b!1198017 (= c!117409 (validKeyInArray!0 (select (arr!37416 _keys!1208) from!1455)))))

(declare-fun b!1198018 () Bool)

(assert (=> b!1198018 (= e!680541 (ListLongMap!17594 Nil!26409))))

(declare-fun b!1198019 () Bool)

(declare-fun e!680540 () Bool)

(assert (=> b!1198019 (= e!680542 e!680540)))

(assert (=> b!1198019 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37954 _keys!1208)))))

(declare-fun res!797318 () Bool)

(declare-fun lt!543241 () ListLongMap!17593)

(assert (=> b!1198019 (= res!797318 (contains!6847 lt!543241 (select (arr!37416 _keys!1208) from!1455)))))

(assert (=> b!1198019 (=> (not res!797318) (not e!680540))))

(declare-fun b!1198020 () Bool)

(declare-fun call!57258 () ListLongMap!17593)

(assert (=> b!1198020 (= e!680536 call!57258)))

(declare-fun d!132261 () Bool)

(assert (=> d!132261 e!680538))

(declare-fun res!797316 () Bool)

(assert (=> d!132261 (=> (not res!797316) (not e!680538))))

(assert (=> d!132261 (= res!797316 (not (contains!6847 lt!543241 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132261 (= lt!543241 e!680541)))

(declare-fun c!117411 () Bool)

(assert (=> d!132261 (= c!117411 (bvsge from!1455 (size!37954 _keys!1208)))))

(assert (=> d!132261 (validMask!0 mask!1564)))

(assert (=> d!132261 (= (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543241)))

(declare-fun b!1198021 () Bool)

(declare-fun e!680539 () Bool)

(assert (=> b!1198021 (= e!680539 (= lt!543241 (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198022 () Bool)

(assert (=> b!1198022 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37954 _keys!1208)))))

(assert (=> b!1198022 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37953 _values!996)))))

(assert (=> b!1198022 (= e!680540 (= (apply!952 lt!543241 (select (arr!37416 _keys!1208) from!1455)) (get!19114 (select (arr!37415 _values!996) from!1455) (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1198023 () Bool)

(assert (=> b!1198023 (= e!680537 (validKeyInArray!0 (select (arr!37416 _keys!1208) from!1455)))))

(assert (=> b!1198023 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1198024 () Bool)

(assert (=> b!1198024 (= e!680542 e!680539)))

(declare-fun c!117408 () Bool)

(assert (=> b!1198024 (= c!117408 (bvslt from!1455 (size!37954 _keys!1208)))))

(declare-fun b!1198025 () Bool)

(assert (=> b!1198025 (= e!680539 (isEmpty!984 lt!543241))))

(declare-fun b!1198026 () Bool)

(declare-fun lt!543235 () Unit!39581)

(declare-fun lt!543239 () Unit!39581)

(assert (=> b!1198026 (= lt!543235 lt!543239)))

(declare-fun lt!543237 () ListLongMap!17593)

(declare-fun lt!543236 () (_ BitVec 64))

(declare-fun lt!543238 () V!45681)

(declare-fun lt!543240 () (_ BitVec 64))

(assert (=> b!1198026 (not (contains!6847 (+!3997 lt!543237 (tuple2!19625 lt!543236 lt!543238)) lt!543240))))

(assert (=> b!1198026 (= lt!543239 (addStillNotContains!288 lt!543237 lt!543236 lt!543238 lt!543240))))

(assert (=> b!1198026 (= lt!543240 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1198026 (= lt!543238 (get!19114 (select (arr!37415 _values!996) from!1455) (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198026 (= lt!543236 (select (arr!37416 _keys!1208) from!1455))))

(assert (=> b!1198026 (= lt!543237 call!57258)))

(assert (=> b!1198026 (= e!680536 (+!3997 call!57258 (tuple2!19625 (select (arr!37416 _keys!1208) from!1455) (get!19114 (select (arr!37415 _values!996) from!1455) (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198027 () Bool)

(declare-fun res!797319 () Bool)

(assert (=> b!1198027 (=> (not res!797319) (not e!680538))))

(assert (=> b!1198027 (= res!797319 (not (contains!6847 lt!543241 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!57255 () Bool)

(assert (=> bm!57255 (= call!57258 (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!132261 c!117411) b!1198018))

(assert (= (and d!132261 (not c!117411)) b!1198017))

(assert (= (and b!1198017 c!117409) b!1198026))

(assert (= (and b!1198017 (not c!117409)) b!1198020))

(assert (= (or b!1198026 b!1198020) bm!57255))

(assert (= (and d!132261 res!797316) b!1198027))

(assert (= (and b!1198027 res!797319) b!1198016))

(assert (= (and b!1198016 res!797317) b!1198023))

(assert (= (and b!1198016 c!117410) b!1198019))

(assert (= (and b!1198016 (not c!117410)) b!1198024))

(assert (= (and b!1198019 res!797318) b!1198022))

(assert (= (and b!1198024 c!117408) b!1198021))

(assert (= (and b!1198024 (not c!117408)) b!1198025))

(declare-fun b_lambda!20895 () Bool)

(assert (=> (not b_lambda!20895) (not b!1198022)))

(assert (=> b!1198022 t!39104))

(declare-fun b_and!42307 () Bool)

(assert (= b_and!42305 (and (=> t!39104 result!21613) b_and!42307)))

(declare-fun b_lambda!20897 () Bool)

(assert (=> (not b_lambda!20897) (not b!1198026)))

(assert (=> b!1198026 t!39104))

(declare-fun b_and!42309 () Bool)

(assert (= b_and!42307 (and (=> t!39104 result!21613) b_and!42309)))

(declare-fun m!1104397 () Bool)

(assert (=> b!1198027 m!1104397))

(declare-fun m!1104399 () Bool)

(assert (=> d!132261 m!1104399))

(assert (=> d!132261 m!1104245))

(declare-fun m!1104401 () Bool)

(assert (=> b!1198017 m!1104401))

(assert (=> b!1198017 m!1104401))

(declare-fun m!1104403 () Bool)

(assert (=> b!1198017 m!1104403))

(declare-fun m!1104405 () Bool)

(assert (=> bm!57255 m!1104405))

(declare-fun m!1104407 () Bool)

(assert (=> b!1198022 m!1104407))

(assert (=> b!1198022 m!1104247))

(declare-fun m!1104409 () Bool)

(assert (=> b!1198022 m!1104409))

(assert (=> b!1198022 m!1104401))

(assert (=> b!1198022 m!1104247))

(assert (=> b!1198022 m!1104407))

(assert (=> b!1198022 m!1104401))

(declare-fun m!1104411 () Bool)

(assert (=> b!1198022 m!1104411))

(assert (=> b!1198021 m!1104405))

(declare-fun m!1104413 () Bool)

(assert (=> b!1198026 m!1104413))

(declare-fun m!1104415 () Bool)

(assert (=> b!1198026 m!1104415))

(assert (=> b!1198026 m!1104407))

(assert (=> b!1198026 m!1104247))

(assert (=> b!1198026 m!1104409))

(assert (=> b!1198026 m!1104413))

(assert (=> b!1198026 m!1104401))

(assert (=> b!1198026 m!1104247))

(declare-fun m!1104417 () Bool)

(assert (=> b!1198026 m!1104417))

(declare-fun m!1104419 () Bool)

(assert (=> b!1198026 m!1104419))

(assert (=> b!1198026 m!1104407))

(assert (=> b!1198023 m!1104401))

(assert (=> b!1198023 m!1104401))

(assert (=> b!1198023 m!1104403))

(declare-fun m!1104421 () Bool)

(assert (=> b!1198025 m!1104421))

(assert (=> b!1198019 m!1104401))

(assert (=> b!1198019 m!1104401))

(declare-fun m!1104423 () Bool)

(assert (=> b!1198019 m!1104423))

(assert (=> b!1197837 d!132261))

(declare-fun d!132263 () Bool)

(assert (=> d!132263 (= (array_inv!28634 _keys!1208) (bvsge (size!37954 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100364 d!132263))

(declare-fun d!132265 () Bool)

(assert (=> d!132265 (= (array_inv!28635 _values!996) (bvsge (size!37953 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100364 d!132265))

(declare-fun d!132267 () Bool)

(assert (=> d!132267 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1197842 d!132267))

(declare-fun b!1198035 () Bool)

(declare-fun e!680548 () Bool)

(assert (=> b!1198035 (= e!680548 tp_is_empty!30415)))

(declare-fun condMapEmpty!47471 () Bool)

(declare-fun mapDefault!47471 () ValueCell!14498)

(assert (=> mapNonEmpty!47462 (= condMapEmpty!47471 (= mapRest!47462 ((as const (Array (_ BitVec 32) ValueCell!14498)) mapDefault!47471)))))

(declare-fun mapRes!47471 () Bool)

(assert (=> mapNonEmpty!47462 (= tp!90120 (and e!680548 mapRes!47471))))

(declare-fun mapIsEmpty!47471 () Bool)

(assert (=> mapIsEmpty!47471 mapRes!47471))

(declare-fun mapNonEmpty!47471 () Bool)

(declare-fun tp!90135 () Bool)

(declare-fun e!680547 () Bool)

(assert (=> mapNonEmpty!47471 (= mapRes!47471 (and tp!90135 e!680547))))

(declare-fun mapValue!47471 () ValueCell!14498)

(declare-fun mapKey!47471 () (_ BitVec 32))

(declare-fun mapRest!47471 () (Array (_ BitVec 32) ValueCell!14498))

(assert (=> mapNonEmpty!47471 (= mapRest!47462 (store mapRest!47471 mapKey!47471 mapValue!47471))))

(declare-fun b!1198034 () Bool)

(assert (=> b!1198034 (= e!680547 tp_is_empty!30415)))

(assert (= (and mapNonEmpty!47462 condMapEmpty!47471) mapIsEmpty!47471))

(assert (= (and mapNonEmpty!47462 (not condMapEmpty!47471)) mapNonEmpty!47471))

(assert (= (and mapNonEmpty!47471 ((_ is ValueCellFull!14498) mapValue!47471)) b!1198034))

(assert (= (and mapNonEmpty!47462 ((_ is ValueCellFull!14498) mapDefault!47471)) b!1198035))

(declare-fun m!1104425 () Bool)

(assert (=> mapNonEmpty!47471 m!1104425))

(declare-fun b_lambda!20899 () Bool)

(assert (= b_lambda!20891 (or (and start!100364 b_free!25711) b_lambda!20899)))

(declare-fun b_lambda!20901 () Bool)

(assert (= b_lambda!20893 (or (and start!100364 b_free!25711) b_lambda!20901)))

(declare-fun b_lambda!20903 () Bool)

(assert (= b_lambda!20897 (or (and start!100364 b_free!25711) b_lambda!20903)))

(declare-fun b_lambda!20905 () Bool)

(assert (= b_lambda!20895 (or (and start!100364 b_free!25711) b_lambda!20905)))

(check-sat (not b!1197976) (not b_lambda!20889) (not bm!57250) (not bm!57251) (not b!1197971) (not b!1197950) (not b!1197946) (not b_lambda!20899) (not b!1197949) (not b!1198005) (not bm!57255) (not b_next!25711) (not b!1198025) (not b!1198015) (not b!1197970) (not b!1198021) (not b_lambda!20905) (not b!1198014) (not b_lambda!20901) (not d!132261) (not b!1198027) (not b!1198019) (not bm!57247) (not b!1198010) (not b_lambda!20903) (not bm!57254) (not b!1198009) (not b!1198026) b_and!42309 (not d!132259) (not b!1197975) (not b!1197974) (not b!1198023) (not b!1197959) (not b!1198013) (not b!1198007) (not b!1197953) (not bm!57246) (not b!1198011) (not d!132253) (not b!1198022) tp_is_empty!30415 (not b!1197979) (not b!1198017) (not mapNonEmpty!47471))
(check-sat b_and!42309 (not b_next!25711))
