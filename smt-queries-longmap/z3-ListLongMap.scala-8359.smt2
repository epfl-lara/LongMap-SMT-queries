; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101972 () Bool)

(assert start!101972)

(declare-fun b_free!26425 () Bool)

(declare-fun b_next!26425 () Bool)

(assert (=> start!101972 (= b_free!26425 (not b_next!26425))))

(declare-fun tp!92320 () Bool)

(declare-fun b_and!44113 () Bool)

(assert (=> start!101972 (= tp!92320 b_and!44113)))

(declare-fun b!1225924 () Bool)

(declare-datatypes ((Unit!40546 0))(
  ( (Unit!40547) )
))
(declare-fun e!696376 () Unit!40546)

(declare-fun Unit!40548 () Unit!40546)

(assert (=> b!1225924 (= e!696376 Unit!40548)))

(declare-fun lt!558155 () Unit!40546)

(declare-datatypes ((array!79079 0))(
  ( (array!79080 (arr!38160 (Array (_ BitVec 32) (_ BitVec 64))) (size!38697 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79079)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79079 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40546)

(assert (=> b!1225924 (= lt!558155 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225924 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558146 () Unit!40546)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79079 (_ BitVec 32) (_ BitVec 32)) Unit!40546)

(assert (=> b!1225924 (= lt!558146 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26957 0))(
  ( (Nil!26954) (Cons!26953 (h!28171 (_ BitVec 64)) (t!40354 List!26957)) )
))
(declare-fun arrayNoDuplicates!0 (array!79079 (_ BitVec 32) List!26957) Bool)

(assert (=> b!1225924 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26954)))

(declare-fun lt!558142 () Unit!40546)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79079 (_ BitVec 64) (_ BitVec 32) List!26957) Unit!40546)

(assert (=> b!1225924 (= lt!558142 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26954))))

(assert (=> b!1225924 false))

(declare-fun mapNonEmpty!48592 () Bool)

(declare-fun mapRes!48592 () Bool)

(declare-fun tp!92321 () Bool)

(declare-fun e!696377 () Bool)

(assert (=> mapNonEmpty!48592 (= mapRes!48592 (and tp!92321 e!696377))))

(declare-datatypes ((V!46633 0))(
  ( (V!46634 (val!15621 Int)) )
))
(declare-datatypes ((ValueCell!14855 0))(
  ( (ValueCellFull!14855 (v!18279 V!46633)) (EmptyCell!14855) )
))
(declare-fun mapValue!48592 () ValueCell!14855)

(declare-fun mapKey!48592 () (_ BitVec 32))

(declare-fun mapRest!48592 () (Array (_ BitVec 32) ValueCell!14855))

(declare-datatypes ((array!79081 0))(
  ( (array!79082 (arr!38161 (Array (_ BitVec 32) ValueCell!14855)) (size!38698 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79081)

(assert (=> mapNonEmpty!48592 (= (arr!38161 _values!996) (store mapRest!48592 mapKey!48592 mapValue!48592))))

(declare-fun b!1225925 () Bool)

(declare-fun res!814287 () Bool)

(declare-fun e!696371 () Bool)

(assert (=> b!1225925 (=> (not res!814287) (not e!696371))))

(assert (=> b!1225925 (= res!814287 (= (select (arr!38160 _keys!1208) i!673) k0!934))))

(declare-fun b!1225926 () Bool)

(declare-fun res!814291 () Bool)

(assert (=> b!1225926 (=> (not res!814291) (not e!696371))))

(assert (=> b!1225926 (= res!814291 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38697 _keys!1208))))))

(declare-fun b!1225927 () Bool)

(declare-fun res!814285 () Bool)

(declare-fun e!696369 () Bool)

(assert (=> b!1225927 (=> (not res!814285) (not e!696369))))

(declare-fun lt!558151 () array!79079)

(assert (=> b!1225927 (= res!814285 (arrayNoDuplicates!0 lt!558151 #b00000000000000000000000000000000 Nil!26954))))

(declare-fun b!1225929 () Bool)

(assert (=> b!1225929 (= e!696371 e!696369)))

(declare-fun res!814286 () Bool)

(assert (=> b!1225929 (=> (not res!814286) (not e!696369))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79079 (_ BitVec 32)) Bool)

(assert (=> b!1225929 (= res!814286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558151 mask!1564))))

(assert (=> b!1225929 (= lt!558151 (array!79080 (store (arr!38160 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38697 _keys!1208)))))

(declare-fun b!1225930 () Bool)

(declare-fun e!696370 () Bool)

(declare-fun e!696379 () Bool)

(assert (=> b!1225930 (= e!696370 e!696379)))

(declare-fun res!814292 () Bool)

(assert (=> b!1225930 (=> res!814292 e!696379)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225930 (= res!814292 (not (validKeyInArray!0 (select (arr!38160 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20144 0))(
  ( (tuple2!20145 (_1!10083 (_ BitVec 64)) (_2!10083 V!46633)) )
))
(declare-datatypes ((List!26958 0))(
  ( (Nil!26955) (Cons!26954 (h!28172 tuple2!20144) (t!40355 List!26958)) )
))
(declare-datatypes ((ListLongMap!18121 0))(
  ( (ListLongMap!18122 (toList!9076 List!26958)) )
))
(declare-fun lt!558143 () ListLongMap!18121)

(declare-fun lt!558150 () ListLongMap!18121)

(assert (=> b!1225930 (= lt!558143 lt!558150)))

(declare-fun lt!558141 () ListLongMap!18121)

(declare-fun -!1947 (ListLongMap!18121 (_ BitVec 64)) ListLongMap!18121)

(assert (=> b!1225930 (= lt!558150 (-!1947 lt!558141 k0!934))))

(declare-fun zeroValue!944 () V!46633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46633)

(declare-fun lt!558158 () array!79081)

(declare-fun getCurrentListMapNoExtraKeys!5523 (array!79079 array!79081 (_ BitVec 32) (_ BitVec 32) V!46633 V!46633 (_ BitVec 32) Int) ListLongMap!18121)

(assert (=> b!1225930 (= lt!558143 (getCurrentListMapNoExtraKeys!5523 lt!558151 lt!558158 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225930 (= lt!558141 (getCurrentListMapNoExtraKeys!5523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558156 () Unit!40546)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1162 (array!79079 array!79081 (_ BitVec 32) (_ BitVec 32) V!46633 V!46633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40546)

(assert (=> b!1225930 (= lt!558156 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225931 () Bool)

(declare-fun tp_is_empty!31129 () Bool)

(assert (=> b!1225931 (= e!696377 tp_is_empty!31129)))

(declare-fun b!1225932 () Bool)

(declare-fun res!814283 () Bool)

(assert (=> b!1225932 (=> (not res!814283) (not e!696371))))

(assert (=> b!1225932 (= res!814283 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26954))))

(declare-fun mapIsEmpty!48592 () Bool)

(assert (=> mapIsEmpty!48592 mapRes!48592))

(declare-fun b!1225933 () Bool)

(declare-fun e!696378 () Bool)

(assert (=> b!1225933 (= e!696378 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225934 () Bool)

(declare-fun e!696375 () Bool)

(declare-fun e!696373 () Bool)

(assert (=> b!1225934 (= e!696375 (and e!696373 mapRes!48592))))

(declare-fun condMapEmpty!48592 () Bool)

(declare-fun mapDefault!48592 () ValueCell!14855)

(assert (=> b!1225934 (= condMapEmpty!48592 (= (arr!38161 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14855)) mapDefault!48592)))))

(declare-fun b!1225935 () Bool)

(declare-fun res!814281 () Bool)

(assert (=> b!1225935 (=> (not res!814281) (not e!696371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225935 (= res!814281 (validMask!0 mask!1564))))

(declare-fun b!1225928 () Bool)

(declare-fun e!696374 () Bool)

(assert (=> b!1225928 (= e!696374 e!696378)))

(declare-fun res!814279 () Bool)

(assert (=> b!1225928 (=> res!814279 e!696378)))

(assert (=> b!1225928 (= res!814279 (not (= (select (arr!38160 _keys!1208) from!1455) k0!934)))))

(declare-fun res!814288 () Bool)

(assert (=> start!101972 (=> (not res!814288) (not e!696371))))

(assert (=> start!101972 (= res!814288 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38697 _keys!1208))))))

(assert (=> start!101972 e!696371))

(assert (=> start!101972 tp_is_empty!31129))

(declare-fun array_inv!29110 (array!79079) Bool)

(assert (=> start!101972 (array_inv!29110 _keys!1208)))

(assert (=> start!101972 true))

(assert (=> start!101972 tp!92320))

(declare-fun array_inv!29111 (array!79081) Bool)

(assert (=> start!101972 (and (array_inv!29111 _values!996) e!696375)))

(declare-fun b!1225936 () Bool)

(assert (=> b!1225936 (= e!696373 tp_is_empty!31129)))

(declare-fun b!1225937 () Bool)

(declare-fun e!696368 () Bool)

(assert (=> b!1225937 (= e!696368 e!696370)))

(declare-fun res!814293 () Bool)

(assert (=> b!1225937 (=> res!814293 e!696370)))

(assert (=> b!1225937 (= res!814293 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!558154 () ListLongMap!18121)

(assert (=> b!1225937 (= lt!558154 (getCurrentListMapNoExtraKeys!5523 lt!558151 lt!558158 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558148 () V!46633)

(assert (=> b!1225937 (= lt!558158 (array!79082 (store (arr!38161 _values!996) i!673 (ValueCellFull!14855 lt!558148)) (size!38698 _values!996)))))

(declare-fun dynLambda!3422 (Int (_ BitVec 64)) V!46633)

(assert (=> b!1225937 (= lt!558148 (dynLambda!3422 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!558140 () ListLongMap!18121)

(assert (=> b!1225937 (= lt!558140 (getCurrentListMapNoExtraKeys!5523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225938 () Bool)

(declare-fun res!814289 () Bool)

(assert (=> b!1225938 (=> (not res!814289) (not e!696371))))

(assert (=> b!1225938 (= res!814289 (validKeyInArray!0 k0!934))))

(declare-fun b!1225939 () Bool)

(declare-fun res!814282 () Bool)

(assert (=> b!1225939 (=> (not res!814282) (not e!696371))))

(assert (=> b!1225939 (= res!814282 (and (= (size!38698 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38697 _keys!1208) (size!38698 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225940 () Bool)

(declare-fun res!814280 () Bool)

(assert (=> b!1225940 (=> (not res!814280) (not e!696371))))

(assert (=> b!1225940 (= res!814280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225941 () Bool)

(assert (=> b!1225941 (= e!696369 (not e!696368))))

(declare-fun res!814290 () Bool)

(assert (=> b!1225941 (=> res!814290 e!696368)))

(assert (=> b!1225941 (= res!814290 (bvsgt from!1455 i!673))))

(assert (=> b!1225941 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558144 () Unit!40546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79079 (_ BitVec 64) (_ BitVec 32)) Unit!40546)

(assert (=> b!1225941 (= lt!558144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225942 () Bool)

(assert (=> b!1225942 (= e!696379 true)))

(declare-fun lt!558147 () ListLongMap!18121)

(declare-fun lt!558153 () ListLongMap!18121)

(assert (=> b!1225942 (= (-!1947 lt!558147 k0!934) lt!558153)))

(declare-fun lt!558157 () Unit!40546)

(declare-fun lt!558152 () V!46633)

(declare-fun addRemoveCommutativeForDiffKeys!212 (ListLongMap!18121 (_ BitVec 64) V!46633 (_ BitVec 64)) Unit!40546)

(assert (=> b!1225942 (= lt!558157 (addRemoveCommutativeForDiffKeys!212 lt!558141 (select (arr!38160 _keys!1208) from!1455) lt!558152 k0!934))))

(assert (=> b!1225942 (and (= lt!558140 lt!558147) (= lt!558150 lt!558143))))

(declare-fun lt!558145 () tuple2!20144)

(declare-fun +!4177 (ListLongMap!18121 tuple2!20144) ListLongMap!18121)

(assert (=> b!1225942 (= lt!558147 (+!4177 lt!558141 lt!558145))))

(assert (=> b!1225942 (not (= (select (arr!38160 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558149 () Unit!40546)

(assert (=> b!1225942 (= lt!558149 e!696376)))

(declare-fun c!120856 () Bool)

(assert (=> b!1225942 (= c!120856 (= (select (arr!38160 _keys!1208) from!1455) k0!934))))

(assert (=> b!1225942 e!696374))

(declare-fun res!814284 () Bool)

(assert (=> b!1225942 (=> (not res!814284) (not e!696374))))

(assert (=> b!1225942 (= res!814284 (= lt!558154 lt!558153))))

(assert (=> b!1225942 (= lt!558153 (+!4177 lt!558150 lt!558145))))

(assert (=> b!1225942 (= lt!558145 (tuple2!20145 (select (arr!38160 _keys!1208) from!1455) lt!558152))))

(declare-fun get!19533 (ValueCell!14855 V!46633) V!46633)

(assert (=> b!1225942 (= lt!558152 (get!19533 (select (arr!38161 _values!996) from!1455) lt!558148))))

(declare-fun b!1225943 () Bool)

(declare-fun Unit!40549 () Unit!40546)

(assert (=> b!1225943 (= e!696376 Unit!40549)))

(assert (= (and start!101972 res!814288) b!1225935))

(assert (= (and b!1225935 res!814281) b!1225939))

(assert (= (and b!1225939 res!814282) b!1225940))

(assert (= (and b!1225940 res!814280) b!1225932))

(assert (= (and b!1225932 res!814283) b!1225926))

(assert (= (and b!1225926 res!814291) b!1225938))

(assert (= (and b!1225938 res!814289) b!1225925))

(assert (= (and b!1225925 res!814287) b!1225929))

(assert (= (and b!1225929 res!814286) b!1225927))

(assert (= (and b!1225927 res!814285) b!1225941))

(assert (= (and b!1225941 (not res!814290)) b!1225937))

(assert (= (and b!1225937 (not res!814293)) b!1225930))

(assert (= (and b!1225930 (not res!814292)) b!1225942))

(assert (= (and b!1225942 res!814284) b!1225928))

(assert (= (and b!1225928 (not res!814279)) b!1225933))

(assert (= (and b!1225942 c!120856) b!1225924))

(assert (= (and b!1225942 (not c!120856)) b!1225943))

(assert (= (and b!1225934 condMapEmpty!48592) mapIsEmpty!48592))

(assert (= (and b!1225934 (not condMapEmpty!48592)) mapNonEmpty!48592))

(get-info :version)

(assert (= (and mapNonEmpty!48592 ((_ is ValueCellFull!14855) mapValue!48592)) b!1225931))

(assert (= (and b!1225934 ((_ is ValueCellFull!14855) mapDefault!48592)) b!1225936))

(assert (= start!101972 b!1225934))

(declare-fun b_lambda!22399 () Bool)

(assert (=> (not b_lambda!22399) (not b!1225937)))

(declare-fun t!40353 () Bool)

(declare-fun tb!11217 () Bool)

(assert (=> (and start!101972 (= defaultEntry!1004 defaultEntry!1004) t!40353) tb!11217))

(declare-fun result!23055 () Bool)

(assert (=> tb!11217 (= result!23055 tp_is_empty!31129)))

(assert (=> b!1225937 t!40353))

(declare-fun b_and!44115 () Bool)

(assert (= b_and!44113 (and (=> t!40353 result!23055) b_and!44115)))

(declare-fun m!1131227 () Bool)

(assert (=> b!1225940 m!1131227))

(declare-fun m!1131229 () Bool)

(assert (=> b!1225937 m!1131229))

(declare-fun m!1131231 () Bool)

(assert (=> b!1225937 m!1131231))

(declare-fun m!1131233 () Bool)

(assert (=> b!1225937 m!1131233))

(declare-fun m!1131235 () Bool)

(assert (=> b!1225937 m!1131235))

(declare-fun m!1131237 () Bool)

(assert (=> b!1225932 m!1131237))

(declare-fun m!1131239 () Bool)

(assert (=> b!1225925 m!1131239))

(declare-fun m!1131241 () Bool)

(assert (=> b!1225938 m!1131241))

(declare-fun m!1131243 () Bool)

(assert (=> b!1225941 m!1131243))

(declare-fun m!1131245 () Bool)

(assert (=> b!1225941 m!1131245))

(declare-fun m!1131247 () Bool)

(assert (=> start!101972 m!1131247))

(declare-fun m!1131249 () Bool)

(assert (=> start!101972 m!1131249))

(declare-fun m!1131251 () Bool)

(assert (=> b!1225928 m!1131251))

(declare-fun m!1131253 () Bool)

(assert (=> b!1225930 m!1131253))

(declare-fun m!1131255 () Bool)

(assert (=> b!1225930 m!1131255))

(declare-fun m!1131257 () Bool)

(assert (=> b!1225930 m!1131257))

(declare-fun m!1131259 () Bool)

(assert (=> b!1225930 m!1131259))

(assert (=> b!1225930 m!1131251))

(declare-fun m!1131261 () Bool)

(assert (=> b!1225930 m!1131261))

(assert (=> b!1225930 m!1131251))

(declare-fun m!1131263 () Bool)

(assert (=> b!1225924 m!1131263))

(declare-fun m!1131265 () Bool)

(assert (=> b!1225924 m!1131265))

(declare-fun m!1131267 () Bool)

(assert (=> b!1225924 m!1131267))

(declare-fun m!1131269 () Bool)

(assert (=> b!1225924 m!1131269))

(declare-fun m!1131271 () Bool)

(assert (=> b!1225924 m!1131271))

(declare-fun m!1131273 () Bool)

(assert (=> b!1225929 m!1131273))

(declare-fun m!1131275 () Bool)

(assert (=> b!1225929 m!1131275))

(declare-fun m!1131277 () Bool)

(assert (=> b!1225933 m!1131277))

(declare-fun m!1131279 () Bool)

(assert (=> b!1225935 m!1131279))

(declare-fun m!1131281 () Bool)

(assert (=> b!1225942 m!1131281))

(declare-fun m!1131283 () Bool)

(assert (=> b!1225942 m!1131283))

(declare-fun m!1131285 () Bool)

(assert (=> b!1225942 m!1131285))

(assert (=> b!1225942 m!1131251))

(declare-fun m!1131287 () Bool)

(assert (=> b!1225942 m!1131287))

(assert (=> b!1225942 m!1131281))

(declare-fun m!1131289 () Bool)

(assert (=> b!1225942 m!1131289))

(declare-fun m!1131291 () Bool)

(assert (=> b!1225942 m!1131291))

(assert (=> b!1225942 m!1131251))

(declare-fun m!1131293 () Bool)

(assert (=> mapNonEmpty!48592 m!1131293))

(declare-fun m!1131295 () Bool)

(assert (=> b!1225927 m!1131295))

(check-sat (not b!1225938) (not b!1225933) (not mapNonEmpty!48592) (not b!1225940) (not b!1225930) (not start!101972) b_and!44115 (not b!1225924) (not b_next!26425) tp_is_empty!31129 (not b!1225942) (not b!1225937) (not b!1225927) (not b!1225929) (not b!1225932) (not b!1225935) (not b!1225941) (not b_lambda!22399))
(check-sat b_and!44115 (not b_next!26425))
