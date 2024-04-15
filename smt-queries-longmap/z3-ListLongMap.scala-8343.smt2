; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101536 () Bool)

(assert start!101536)

(declare-fun b_free!26329 () Bool)

(declare-fun b_next!26329 () Bool)

(assert (=> start!101536 (= b_free!26329 (not b_next!26329))))

(declare-fun tp!92024 () Bool)

(declare-fun b_and!43847 () Bool)

(assert (=> start!101536 (= tp!92024 b_and!43847)))

(declare-fun b!1220948 () Bool)

(declare-fun e!693325 () Bool)

(declare-fun e!693324 () Bool)

(assert (=> b!1220948 (= e!693325 e!693324)))

(declare-fun res!811130 () Bool)

(assert (=> b!1220948 (=> res!811130 e!693324)))

(declare-datatypes ((array!78766 0))(
  ( (array!78767 (arr!38013 (Array (_ BitVec 32) (_ BitVec 64))) (size!38551 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78766)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220948 (= res!811130 (not (validKeyInArray!0 (select (arr!38013 _keys!1208) from!1455))))))

(declare-datatypes ((V!46505 0))(
  ( (V!46506 (val!15573 Int)) )
))
(declare-datatypes ((tuple2!20134 0))(
  ( (tuple2!20135 (_1!10078 (_ BitVec 64)) (_2!10078 V!46505)) )
))
(declare-datatypes ((List!26913 0))(
  ( (Nil!26910) (Cons!26909 (h!28118 tuple2!20134) (t!40213 List!26913)) )
))
(declare-datatypes ((ListLongMap!18103 0))(
  ( (ListLongMap!18104 (toList!9067 List!26913)) )
))
(declare-fun lt!555196 () ListLongMap!18103)

(declare-fun lt!555200 () ListLongMap!18103)

(assert (=> b!1220948 (= lt!555196 lt!555200)))

(declare-fun lt!555195 () ListLongMap!18103)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1894 (ListLongMap!18103 (_ BitVec 64)) ListLongMap!18103)

(assert (=> b!1220948 (= lt!555200 (-!1894 lt!555195 k0!934))))

(declare-fun zeroValue!944 () V!46505)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555199 () array!78766)

(declare-fun minValue!944 () V!46505)

(declare-datatypes ((ValueCell!14807 0))(
  ( (ValueCellFull!14807 (v!18230 V!46505)) (EmptyCell!14807) )
))
(declare-datatypes ((array!78768 0))(
  ( (array!78769 (arr!38014 (Array (_ BitVec 32) ValueCell!14807)) (size!38552 (_ BitVec 32))) )
))
(declare-fun lt!555198 () array!78768)

(declare-fun getCurrentListMapNoExtraKeys!5502 (array!78766 array!78768 (_ BitVec 32) (_ BitVec 32) V!46505 V!46505 (_ BitVec 32) Int) ListLongMap!18103)

(assert (=> b!1220948 (= lt!555196 (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78768)

(assert (=> b!1220948 (= lt!555195 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40305 0))(
  ( (Unit!40306) )
))
(declare-fun lt!555201 () Unit!40305)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 (array!78766 array!78768 (_ BitVec 32) (_ BitVec 32) V!46505 V!46505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40305)

(assert (=> b!1220948 (= lt!555201 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220949 () Bool)

(declare-fun e!693321 () Bool)

(declare-fun e!693328 () Bool)

(assert (=> b!1220949 (= e!693321 (not e!693328))))

(declare-fun res!811125 () Bool)

(assert (=> b!1220949 (=> res!811125 e!693328)))

(assert (=> b!1220949 (= res!811125 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220949 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555197 () Unit!40305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78766 (_ BitVec 64) (_ BitVec 32)) Unit!40305)

(assert (=> b!1220949 (= lt!555197 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220950 () Bool)

(declare-fun res!811123 () Bool)

(declare-fun e!693318 () Bool)

(assert (=> b!1220950 (=> (not res!811123) (not e!693318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78766 (_ BitVec 32)) Bool)

(assert (=> b!1220950 (= res!811123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220952 () Bool)

(declare-fun res!811129 () Bool)

(assert (=> b!1220952 (=> (not res!811129) (not e!693318))))

(assert (=> b!1220952 (= res!811129 (= (select (arr!38013 _keys!1208) i!673) k0!934))))

(declare-fun b!1220953 () Bool)

(declare-fun res!811134 () Bool)

(assert (=> b!1220953 (=> (not res!811134) (not e!693318))))

(assert (=> b!1220953 (= res!811134 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38551 _keys!1208))))))

(declare-fun b!1220954 () Bool)

(assert (=> b!1220954 (= e!693328 e!693325)))

(declare-fun res!811121 () Bool)

(assert (=> b!1220954 (=> res!811121 e!693325)))

(assert (=> b!1220954 (= res!811121 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!555205 () ListLongMap!18103)

(assert (=> b!1220954 (= lt!555205 (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555203 () V!46505)

(assert (=> b!1220954 (= lt!555198 (array!78769 (store (arr!38014 _values!996) i!673 (ValueCellFull!14807 lt!555203)) (size!38552 _values!996)))))

(declare-fun dynLambda!3350 (Int (_ BitVec 64)) V!46505)

(assert (=> b!1220954 (= lt!555203 (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555206 () ListLongMap!18103)

(assert (=> b!1220954 (= lt!555206 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220955 () Bool)

(declare-fun e!693323 () Bool)

(declare-datatypes ((List!26914 0))(
  ( (Nil!26911) (Cons!26910 (h!28119 (_ BitVec 64)) (t!40214 List!26914)) )
))
(declare-fun noDuplicate!1645 (List!26914) Bool)

(assert (=> b!1220955 (= e!693323 (noDuplicate!1645 Nil!26911))))

(declare-fun b!1220956 () Bool)

(declare-fun e!693327 () Bool)

(assert (=> b!1220956 (= e!693327 e!693323)))

(declare-fun res!811122 () Bool)

(assert (=> b!1220956 (=> res!811122 e!693323)))

(assert (=> b!1220956 (= res!811122 (or (bvsge (size!38551 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)) (bvsge from!1455 (size!38551 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78766 (_ BitVec 32) List!26914) Bool)

(assert (=> b!1220956 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26911)))

(declare-fun lt!555202 () Unit!40305)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78766 (_ BitVec 32) (_ BitVec 32)) Unit!40305)

(assert (=> b!1220956 (= lt!555202 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220956 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555204 () Unit!40305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40305)

(assert (=> b!1220956 (= lt!555204 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220957 () Bool)

(declare-fun res!811136 () Bool)

(assert (=> b!1220957 (=> (not res!811136) (not e!693318))))

(assert (=> b!1220957 (= res!811136 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26911))))

(declare-fun b!1220958 () Bool)

(assert (=> b!1220958 (= e!693324 e!693327)))

(declare-fun res!811126 () Bool)

(assert (=> b!1220958 (=> res!811126 e!693327)))

(assert (=> b!1220958 (= res!811126 (not (= (select (arr!38013 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693316 () Bool)

(assert (=> b!1220958 e!693316))

(declare-fun res!811120 () Bool)

(assert (=> b!1220958 (=> (not res!811120) (not e!693316))))

(declare-fun +!4130 (ListLongMap!18103 tuple2!20134) ListLongMap!18103)

(declare-fun get!19409 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1220958 (= res!811120 (= lt!555205 (+!4130 lt!555200 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))))))

(declare-fun b!1220959 () Bool)

(declare-fun res!811128 () Bool)

(assert (=> b!1220959 (=> (not res!811128) (not e!693321))))

(assert (=> b!1220959 (= res!811128 (arrayNoDuplicates!0 lt!555199 #b00000000000000000000000000000000 Nil!26911))))

(declare-fun b!1220960 () Bool)

(assert (=> b!1220960 (= e!693318 e!693321)))

(declare-fun res!811133 () Bool)

(assert (=> b!1220960 (=> (not res!811133) (not e!693321))))

(assert (=> b!1220960 (= res!811133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555199 mask!1564))))

(assert (=> b!1220960 (= lt!555199 (array!78767 (store (arr!38013 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38551 _keys!1208)))))

(declare-fun b!1220961 () Bool)

(declare-fun res!811132 () Bool)

(assert (=> b!1220961 (=> (not res!811132) (not e!693318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220961 (= res!811132 (validMask!0 mask!1564))))

(declare-fun b!1220962 () Bool)

(declare-fun res!811135 () Bool)

(assert (=> b!1220962 (=> (not res!811135) (not e!693318))))

(assert (=> b!1220962 (= res!811135 (and (= (size!38552 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38551 _keys!1208) (size!38552 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220951 () Bool)

(declare-fun e!693322 () Bool)

(assert (=> b!1220951 (= e!693316 e!693322)))

(declare-fun res!811131 () Bool)

(assert (=> b!1220951 (=> res!811131 e!693322)))

(assert (=> b!1220951 (= res!811131 (not (= (select (arr!38013 _keys!1208) from!1455) k0!934)))))

(declare-fun res!811127 () Bool)

(assert (=> start!101536 (=> (not res!811127) (not e!693318))))

(assert (=> start!101536 (= res!811127 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38551 _keys!1208))))))

(assert (=> start!101536 e!693318))

(declare-fun tp_is_empty!31033 () Bool)

(assert (=> start!101536 tp_is_empty!31033))

(declare-fun array_inv!29050 (array!78766) Bool)

(assert (=> start!101536 (array_inv!29050 _keys!1208)))

(assert (=> start!101536 true))

(assert (=> start!101536 tp!92024))

(declare-fun e!693319 () Bool)

(declare-fun array_inv!29051 (array!78768) Bool)

(assert (=> start!101536 (and (array_inv!29051 _values!996) e!693319)))

(declare-fun b!1220963 () Bool)

(declare-fun res!811124 () Bool)

(assert (=> b!1220963 (=> (not res!811124) (not e!693318))))

(assert (=> b!1220963 (= res!811124 (validKeyInArray!0 k0!934))))

(declare-fun b!1220964 () Bool)

(declare-fun e!693320 () Bool)

(declare-fun mapRes!48439 () Bool)

(assert (=> b!1220964 (= e!693319 (and e!693320 mapRes!48439))))

(declare-fun condMapEmpty!48439 () Bool)

(declare-fun mapDefault!48439 () ValueCell!14807)

(assert (=> b!1220964 (= condMapEmpty!48439 (= (arr!38014 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14807)) mapDefault!48439)))))

(declare-fun mapIsEmpty!48439 () Bool)

(assert (=> mapIsEmpty!48439 mapRes!48439))

(declare-fun b!1220965 () Bool)

(assert (=> b!1220965 (= e!693320 tp_is_empty!31033)))

(declare-fun mapNonEmpty!48439 () Bool)

(declare-fun tp!92023 () Bool)

(declare-fun e!693326 () Bool)

(assert (=> mapNonEmpty!48439 (= mapRes!48439 (and tp!92023 e!693326))))

(declare-fun mapKey!48439 () (_ BitVec 32))

(declare-fun mapValue!48439 () ValueCell!14807)

(declare-fun mapRest!48439 () (Array (_ BitVec 32) ValueCell!14807))

(assert (=> mapNonEmpty!48439 (= (arr!38014 _values!996) (store mapRest!48439 mapKey!48439 mapValue!48439))))

(declare-fun b!1220966 () Bool)

(assert (=> b!1220966 (= e!693326 tp_is_empty!31033)))

(declare-fun b!1220967 () Bool)

(assert (=> b!1220967 (= e!693322 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101536 res!811127) b!1220961))

(assert (= (and b!1220961 res!811132) b!1220962))

(assert (= (and b!1220962 res!811135) b!1220950))

(assert (= (and b!1220950 res!811123) b!1220957))

(assert (= (and b!1220957 res!811136) b!1220953))

(assert (= (and b!1220953 res!811134) b!1220963))

(assert (= (and b!1220963 res!811124) b!1220952))

(assert (= (and b!1220952 res!811129) b!1220960))

(assert (= (and b!1220960 res!811133) b!1220959))

(assert (= (and b!1220959 res!811128) b!1220949))

(assert (= (and b!1220949 (not res!811125)) b!1220954))

(assert (= (and b!1220954 (not res!811121)) b!1220948))

(assert (= (and b!1220948 (not res!811130)) b!1220958))

(assert (= (and b!1220958 res!811120) b!1220951))

(assert (= (and b!1220951 (not res!811131)) b!1220967))

(assert (= (and b!1220958 (not res!811126)) b!1220956))

(assert (= (and b!1220956 (not res!811122)) b!1220955))

(assert (= (and b!1220964 condMapEmpty!48439) mapIsEmpty!48439))

(assert (= (and b!1220964 (not condMapEmpty!48439)) mapNonEmpty!48439))

(get-info :version)

(assert (= (and mapNonEmpty!48439 ((_ is ValueCellFull!14807) mapValue!48439)) b!1220966))

(assert (= (and b!1220964 ((_ is ValueCellFull!14807) mapDefault!48439)) b!1220965))

(assert (= start!101536 b!1220964))

(declare-fun b_lambda!22185 () Bool)

(assert (=> (not b_lambda!22185) (not b!1220954)))

(declare-fun t!40212 () Bool)

(declare-fun tb!11121 () Bool)

(assert (=> (and start!101536 (= defaultEntry!1004 defaultEntry!1004) t!40212) tb!11121))

(declare-fun result!22857 () Bool)

(assert (=> tb!11121 (= result!22857 tp_is_empty!31033)))

(assert (=> b!1220954 t!40212))

(declare-fun b_and!43849 () Bool)

(assert (= b_and!43847 (and (=> t!40212 result!22857) b_and!43849)))

(declare-fun m!1125339 () Bool)

(assert (=> b!1220955 m!1125339))

(declare-fun m!1125341 () Bool)

(assert (=> b!1220957 m!1125341))

(declare-fun m!1125343 () Bool)

(assert (=> b!1220951 m!1125343))

(declare-fun m!1125345 () Bool)

(assert (=> b!1220950 m!1125345))

(assert (=> b!1220958 m!1125343))

(declare-fun m!1125347 () Bool)

(assert (=> b!1220958 m!1125347))

(assert (=> b!1220958 m!1125347))

(declare-fun m!1125349 () Bool)

(assert (=> b!1220958 m!1125349))

(declare-fun m!1125351 () Bool)

(assert (=> b!1220958 m!1125351))

(declare-fun m!1125353 () Bool)

(assert (=> b!1220961 m!1125353))

(declare-fun m!1125355 () Bool)

(assert (=> b!1220948 m!1125355))

(declare-fun m!1125357 () Bool)

(assert (=> b!1220948 m!1125357))

(declare-fun m!1125359 () Bool)

(assert (=> b!1220948 m!1125359))

(assert (=> b!1220948 m!1125343))

(declare-fun m!1125361 () Bool)

(assert (=> b!1220948 m!1125361))

(assert (=> b!1220948 m!1125343))

(declare-fun m!1125363 () Bool)

(assert (=> b!1220948 m!1125363))

(declare-fun m!1125365 () Bool)

(assert (=> b!1220967 m!1125365))

(declare-fun m!1125367 () Bool)

(assert (=> start!101536 m!1125367))

(declare-fun m!1125369 () Bool)

(assert (=> start!101536 m!1125369))

(declare-fun m!1125371 () Bool)

(assert (=> b!1220963 m!1125371))

(declare-fun m!1125373 () Bool)

(assert (=> b!1220954 m!1125373))

(declare-fun m!1125375 () Bool)

(assert (=> b!1220954 m!1125375))

(declare-fun m!1125377 () Bool)

(assert (=> b!1220954 m!1125377))

(declare-fun m!1125379 () Bool)

(assert (=> b!1220954 m!1125379))

(declare-fun m!1125381 () Bool)

(assert (=> mapNonEmpty!48439 m!1125381))

(declare-fun m!1125383 () Bool)

(assert (=> b!1220956 m!1125383))

(declare-fun m!1125385 () Bool)

(assert (=> b!1220956 m!1125385))

(declare-fun m!1125387 () Bool)

(assert (=> b!1220956 m!1125387))

(declare-fun m!1125389 () Bool)

(assert (=> b!1220956 m!1125389))

(declare-fun m!1125391 () Bool)

(assert (=> b!1220949 m!1125391))

(declare-fun m!1125393 () Bool)

(assert (=> b!1220949 m!1125393))

(declare-fun m!1125395 () Bool)

(assert (=> b!1220959 m!1125395))

(declare-fun m!1125397 () Bool)

(assert (=> b!1220960 m!1125397))

(declare-fun m!1125399 () Bool)

(assert (=> b!1220960 m!1125399))

(declare-fun m!1125401 () Bool)

(assert (=> b!1220952 m!1125401))

(check-sat (not b!1220954) (not b!1220958) (not b!1220959) (not b!1220956) (not b!1220950) (not b!1220963) (not b!1220949) (not b!1220960) (not b!1220955) (not b!1220967) (not b!1220961) (not mapNonEmpty!48439) (not b!1220957) (not start!101536) (not b_next!26329) tp_is_empty!31033 (not b!1220948) b_and!43849 (not b_lambda!22185))
(check-sat b_and!43849 (not b_next!26329))
(get-model)

(declare-fun b_lambda!22191 () Bool)

(assert (= b_lambda!22185 (or (and start!101536 b_free!26329) b_lambda!22191)))

(check-sat (not b!1220954) (not b!1220958) (not b!1220959) (not b!1220956) (not b!1220950) (not b!1220963) (not b!1220949) (not b!1220960) b_and!43849 (not b!1220955) (not b!1220967) (not b!1220961) (not mapNonEmpty!48439) (not b_lambda!22191) (not b!1220957) (not start!101536) (not b_next!26329) tp_is_empty!31033 (not b!1220948))
(check-sat b_and!43849 (not b_next!26329))
(get-model)

(declare-fun d!133649 () Bool)

(declare-fun res!811243 () Bool)

(declare-fun e!693415 () Bool)

(assert (=> d!133649 (=> res!811243 e!693415)))

(assert (=> d!133649 (= res!811243 (bvsge #b00000000000000000000000000000000 (size!38551 lt!555199)))))

(assert (=> d!133649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555199 mask!1564) e!693415)))

(declare-fun bm!60685 () Bool)

(declare-fun call!60688 () Bool)

(assert (=> bm!60685 (= call!60688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!555199 mask!1564))))

(declare-fun b!1221102 () Bool)

(declare-fun e!693413 () Bool)

(declare-fun e!693414 () Bool)

(assert (=> b!1221102 (= e!693413 e!693414)))

(declare-fun lt!555286 () (_ BitVec 64))

(assert (=> b!1221102 (= lt!555286 (select (arr!38013 lt!555199) #b00000000000000000000000000000000))))

(declare-fun lt!555285 () Unit!40305)

(assert (=> b!1221102 (= lt!555285 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!555199 lt!555286 #b00000000000000000000000000000000))))

(assert (=> b!1221102 (arrayContainsKey!0 lt!555199 lt!555286 #b00000000000000000000000000000000)))

(declare-fun lt!555287 () Unit!40305)

(assert (=> b!1221102 (= lt!555287 lt!555285)))

(declare-fun res!811244 () Bool)

(declare-datatypes ((SeekEntryResult!9947 0))(
  ( (MissingZero!9947 (index!42159 (_ BitVec 32))) (Found!9947 (index!42160 (_ BitVec 32))) (Intermediate!9947 (undefined!10759 Bool) (index!42161 (_ BitVec 32)) (x!107554 (_ BitVec 32))) (Undefined!9947) (MissingVacant!9947 (index!42162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78766 (_ BitVec 32)) SeekEntryResult!9947)

(assert (=> b!1221102 (= res!811244 (= (seekEntryOrOpen!0 (select (arr!38013 lt!555199) #b00000000000000000000000000000000) lt!555199 mask!1564) (Found!9947 #b00000000000000000000000000000000)))))

(assert (=> b!1221102 (=> (not res!811244) (not e!693414))))

(declare-fun b!1221103 () Bool)

(assert (=> b!1221103 (= e!693414 call!60688)))

(declare-fun b!1221104 () Bool)

(assert (=> b!1221104 (= e!693413 call!60688)))

(declare-fun b!1221105 () Bool)

(assert (=> b!1221105 (= e!693415 e!693413)))

(declare-fun c!120221 () Bool)

(assert (=> b!1221105 (= c!120221 (validKeyInArray!0 (select (arr!38013 lt!555199) #b00000000000000000000000000000000)))))

(assert (= (and d!133649 (not res!811243)) b!1221105))

(assert (= (and b!1221105 c!120221) b!1221102))

(assert (= (and b!1221105 (not c!120221)) b!1221104))

(assert (= (and b!1221102 res!811244) b!1221103))

(assert (= (or b!1221103 b!1221104) bm!60685))

(declare-fun m!1125531 () Bool)

(assert (=> bm!60685 m!1125531))

(declare-fun m!1125533 () Bool)

(assert (=> b!1221102 m!1125533))

(declare-fun m!1125535 () Bool)

(assert (=> b!1221102 m!1125535))

(declare-fun m!1125537 () Bool)

(assert (=> b!1221102 m!1125537))

(assert (=> b!1221102 m!1125533))

(declare-fun m!1125539 () Bool)

(assert (=> b!1221102 m!1125539))

(assert (=> b!1221105 m!1125533))

(assert (=> b!1221105 m!1125533))

(declare-fun m!1125541 () Bool)

(assert (=> b!1221105 m!1125541))

(assert (=> b!1220960 d!133649))

(declare-fun d!133651 () Bool)

(declare-fun res!811249 () Bool)

(declare-fun e!693420 () Bool)

(assert (=> d!133651 (=> res!811249 e!693420)))

(assert (=> d!133651 (= res!811249 (= (select (arr!38013 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133651 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!693420)))

(declare-fun b!1221110 () Bool)

(declare-fun e!693421 () Bool)

(assert (=> b!1221110 (= e!693420 e!693421)))

(declare-fun res!811250 () Bool)

(assert (=> b!1221110 (=> (not res!811250) (not e!693421))))

(assert (=> b!1221110 (= res!811250 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38551 _keys!1208)))))

(declare-fun b!1221111 () Bool)

(assert (=> b!1221111 (= e!693421 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133651 (not res!811249)) b!1221110))

(assert (= (and b!1221110 res!811250) b!1221111))

(declare-fun m!1125543 () Bool)

(assert (=> d!133651 m!1125543))

(declare-fun m!1125545 () Bool)

(assert (=> b!1221111 m!1125545))

(assert (=> b!1220949 d!133651))

(declare-fun d!133653 () Bool)

(assert (=> d!133653 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555290 () Unit!40305)

(declare-fun choose!13 (array!78766 (_ BitVec 64) (_ BitVec 32)) Unit!40305)

(assert (=> d!133653 (= lt!555290 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133653 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133653 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!555290)))

(declare-fun bs!34347 () Bool)

(assert (= bs!34347 d!133653))

(assert (=> bs!34347 m!1125391))

(declare-fun m!1125547 () Bool)

(assert (=> bs!34347 m!1125547))

(assert (=> b!1220949 d!133653))

(declare-fun d!133655 () Bool)

(declare-fun res!811251 () Bool)

(declare-fun e!693424 () Bool)

(assert (=> d!133655 (=> res!811251 e!693424)))

(assert (=> d!133655 (= res!811251 (bvsge #b00000000000000000000000000000000 (size!38551 _keys!1208)))))

(assert (=> d!133655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!693424)))

(declare-fun bm!60686 () Bool)

(declare-fun call!60689 () Bool)

(assert (=> bm!60686 (= call!60689 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1221112 () Bool)

(declare-fun e!693422 () Bool)

(declare-fun e!693423 () Bool)

(assert (=> b!1221112 (= e!693422 e!693423)))

(declare-fun lt!555292 () (_ BitVec 64))

(assert (=> b!1221112 (= lt!555292 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!555291 () Unit!40305)

(assert (=> b!1221112 (= lt!555291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!555292 #b00000000000000000000000000000000))))

(assert (=> b!1221112 (arrayContainsKey!0 _keys!1208 lt!555292 #b00000000000000000000000000000000)))

(declare-fun lt!555293 () Unit!40305)

(assert (=> b!1221112 (= lt!555293 lt!555291)))

(declare-fun res!811252 () Bool)

(assert (=> b!1221112 (= res!811252 (= (seekEntryOrOpen!0 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9947 #b00000000000000000000000000000000)))))

(assert (=> b!1221112 (=> (not res!811252) (not e!693423))))

(declare-fun b!1221113 () Bool)

(assert (=> b!1221113 (= e!693423 call!60689)))

(declare-fun b!1221114 () Bool)

(assert (=> b!1221114 (= e!693422 call!60689)))

(declare-fun b!1221115 () Bool)

(assert (=> b!1221115 (= e!693424 e!693422)))

(declare-fun c!120222 () Bool)

(assert (=> b!1221115 (= c!120222 (validKeyInArray!0 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133655 (not res!811251)) b!1221115))

(assert (= (and b!1221115 c!120222) b!1221112))

(assert (= (and b!1221115 (not c!120222)) b!1221114))

(assert (= (and b!1221112 res!811252) b!1221113))

(assert (= (or b!1221113 b!1221114) bm!60686))

(declare-fun m!1125549 () Bool)

(assert (=> bm!60686 m!1125549))

(assert (=> b!1221112 m!1125543))

(declare-fun m!1125551 () Bool)

(assert (=> b!1221112 m!1125551))

(declare-fun m!1125553 () Bool)

(assert (=> b!1221112 m!1125553))

(assert (=> b!1221112 m!1125543))

(declare-fun m!1125555 () Bool)

(assert (=> b!1221112 m!1125555))

(assert (=> b!1221115 m!1125543))

(assert (=> b!1221115 m!1125543))

(declare-fun m!1125557 () Bool)

(assert (=> b!1221115 m!1125557))

(assert (=> b!1220950 d!133655))

(declare-fun d!133657 () Bool)

(assert (=> d!133657 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1220961 d!133657))

(declare-fun d!133659 () Bool)

(assert (=> d!133659 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1220963 d!133659))

(declare-fun d!133661 () Bool)

(assert (=> d!133661 (= (array_inv!29050 _keys!1208) (bvsge (size!38551 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101536 d!133661))

(declare-fun d!133663 () Bool)

(assert (=> d!133663 (= (array_inv!29051 _values!996) (bvsge (size!38552 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101536 d!133663))

(declare-fun d!133665 () Bool)

(declare-fun res!811257 () Bool)

(declare-fun e!693429 () Bool)

(assert (=> d!133665 (=> res!811257 e!693429)))

(assert (=> d!133665 (= res!811257 ((_ is Nil!26911) Nil!26911))))

(assert (=> d!133665 (= (noDuplicate!1645 Nil!26911) e!693429)))

(declare-fun b!1221120 () Bool)

(declare-fun e!693430 () Bool)

(assert (=> b!1221120 (= e!693429 e!693430)))

(declare-fun res!811258 () Bool)

(assert (=> b!1221120 (=> (not res!811258) (not e!693430))))

(declare-fun contains!6995 (List!26914 (_ BitVec 64)) Bool)

(assert (=> b!1221120 (= res!811258 (not (contains!6995 (t!40214 Nil!26911) (h!28119 Nil!26911))))))

(declare-fun b!1221121 () Bool)

(assert (=> b!1221121 (= e!693430 (noDuplicate!1645 (t!40214 Nil!26911)))))

(assert (= (and d!133665 (not res!811257)) b!1221120))

(assert (= (and b!1221120 res!811258) b!1221121))

(declare-fun m!1125559 () Bool)

(assert (=> b!1221120 m!1125559))

(declare-fun m!1125561 () Bool)

(assert (=> b!1221121 m!1125561))

(assert (=> b!1220955 d!133665))

(declare-fun b!1221146 () Bool)

(declare-fun e!693445 () Bool)

(declare-fun e!693447 () Bool)

(assert (=> b!1221146 (= e!693445 e!693447)))

(declare-fun c!120234 () Bool)

(assert (=> b!1221146 (= c!120234 (bvslt from!1455 (size!38551 lt!555199)))))

(declare-fun b!1221148 () Bool)

(declare-fun e!693450 () ListLongMap!18103)

(declare-fun call!60692 () ListLongMap!18103)

(assert (=> b!1221148 (= e!693450 call!60692)))

(declare-fun lt!555308 () ListLongMap!18103)

(declare-fun b!1221149 () Bool)

(assert (=> b!1221149 (= e!693447 (= lt!555308 (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221150 () Bool)

(declare-fun res!811268 () Bool)

(declare-fun e!693449 () Bool)

(assert (=> b!1221150 (=> (not res!811268) (not e!693449))))

(declare-fun contains!6996 (ListLongMap!18103 (_ BitVec 64)) Bool)

(assert (=> b!1221150 (= res!811268 (not (contains!6996 lt!555308 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221151 () Bool)

(declare-fun e!693451 () ListLongMap!18103)

(assert (=> b!1221151 (= e!693451 (ListLongMap!18104 Nil!26910))))

(declare-fun bm!60689 () Bool)

(assert (=> bm!60689 (= call!60692 (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221152 () Bool)

(declare-fun isEmpty!1004 (ListLongMap!18103) Bool)

(assert (=> b!1221152 (= e!693447 (isEmpty!1004 lt!555308))))

(declare-fun b!1221153 () Bool)

(assert (=> b!1221153 (= e!693449 e!693445)))

(declare-fun c!120232 () Bool)

(declare-fun e!693446 () Bool)

(assert (=> b!1221153 (= c!120232 e!693446)))

(declare-fun res!811267 () Bool)

(assert (=> b!1221153 (=> (not res!811267) (not e!693446))))

(assert (=> b!1221153 (= res!811267 (bvslt from!1455 (size!38551 lt!555199)))))

(declare-fun b!1221154 () Bool)

(assert (=> b!1221154 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38551 lt!555199)))))

(assert (=> b!1221154 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38552 lt!555198)))))

(declare-fun e!693448 () Bool)

(declare-fun apply!968 (ListLongMap!18103 (_ BitVec 64)) V!46505)

(assert (=> b!1221154 (= e!693448 (= (apply!968 lt!555308 (select (arr!38013 lt!555199) from!1455)) (get!19409 (select (arr!38014 lt!555198) from!1455) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221155 () Bool)

(assert (=> b!1221155 (= e!693445 e!693448)))

(assert (=> b!1221155 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38551 lt!555199)))))

(declare-fun res!811269 () Bool)

(assert (=> b!1221155 (= res!811269 (contains!6996 lt!555308 (select (arr!38013 lt!555199) from!1455)))))

(assert (=> b!1221155 (=> (not res!811269) (not e!693448))))

(declare-fun b!1221147 () Bool)

(assert (=> b!1221147 (= e!693451 e!693450)))

(declare-fun c!120233 () Bool)

(assert (=> b!1221147 (= c!120233 (validKeyInArray!0 (select (arr!38013 lt!555199) from!1455)))))

(declare-fun d!133667 () Bool)

(assert (=> d!133667 e!693449))

(declare-fun res!811270 () Bool)

(assert (=> d!133667 (=> (not res!811270) (not e!693449))))

(assert (=> d!133667 (= res!811270 (not (contains!6996 lt!555308 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133667 (= lt!555308 e!693451)))

(declare-fun c!120231 () Bool)

(assert (=> d!133667 (= c!120231 (bvsge from!1455 (size!38551 lt!555199)))))

(assert (=> d!133667 (validMask!0 mask!1564)))

(assert (=> d!133667 (= (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555308)))

(declare-fun b!1221156 () Bool)

(assert (=> b!1221156 (= e!693446 (validKeyInArray!0 (select (arr!38013 lt!555199) from!1455)))))

(assert (=> b!1221156 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1221157 () Bool)

(declare-fun lt!555314 () Unit!40305)

(declare-fun lt!555309 () Unit!40305)

(assert (=> b!1221157 (= lt!555314 lt!555309)))

(declare-fun lt!555311 () (_ BitVec 64))

(declare-fun lt!555312 () V!46505)

(declare-fun lt!555313 () (_ BitVec 64))

(declare-fun lt!555310 () ListLongMap!18103)

(assert (=> b!1221157 (not (contains!6996 (+!4130 lt!555310 (tuple2!20135 lt!555311 lt!555312)) lt!555313))))

(declare-fun addStillNotContains!304 (ListLongMap!18103 (_ BitVec 64) V!46505 (_ BitVec 64)) Unit!40305)

(assert (=> b!1221157 (= lt!555309 (addStillNotContains!304 lt!555310 lt!555311 lt!555312 lt!555313))))

(assert (=> b!1221157 (= lt!555313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221157 (= lt!555312 (get!19409 (select (arr!38014 lt!555198) from!1455) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221157 (= lt!555311 (select (arr!38013 lt!555199) from!1455))))

(assert (=> b!1221157 (= lt!555310 call!60692)))

(assert (=> b!1221157 (= e!693450 (+!4130 call!60692 (tuple2!20135 (select (arr!38013 lt!555199) from!1455) (get!19409 (select (arr!38014 lt!555198) from!1455) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133667 c!120231) b!1221151))

(assert (= (and d!133667 (not c!120231)) b!1221147))

(assert (= (and b!1221147 c!120233) b!1221157))

(assert (= (and b!1221147 (not c!120233)) b!1221148))

(assert (= (or b!1221157 b!1221148) bm!60689))

(assert (= (and d!133667 res!811270) b!1221150))

(assert (= (and b!1221150 res!811268) b!1221153))

(assert (= (and b!1221153 res!811267) b!1221156))

(assert (= (and b!1221153 c!120232) b!1221155))

(assert (= (and b!1221153 (not c!120232)) b!1221146))

(assert (= (and b!1221155 res!811269) b!1221154))

(assert (= (and b!1221146 c!120234) b!1221149))

(assert (= (and b!1221146 (not c!120234)) b!1221152))

(declare-fun b_lambda!22193 () Bool)

(assert (=> (not b_lambda!22193) (not b!1221154)))

(assert (=> b!1221154 t!40212))

(declare-fun b_and!43859 () Bool)

(assert (= b_and!43849 (and (=> t!40212 result!22857) b_and!43859)))

(declare-fun b_lambda!22195 () Bool)

(assert (=> (not b_lambda!22195) (not b!1221157)))

(assert (=> b!1221157 t!40212))

(declare-fun b_and!43861 () Bool)

(assert (= b_and!43859 (and (=> t!40212 result!22857) b_and!43861)))

(declare-fun m!1125563 () Bool)

(assert (=> b!1221154 m!1125563))

(assert (=> b!1221154 m!1125377))

(declare-fun m!1125565 () Bool)

(assert (=> b!1221154 m!1125565))

(declare-fun m!1125567 () Bool)

(assert (=> b!1221154 m!1125567))

(assert (=> b!1221154 m!1125377))

(assert (=> b!1221154 m!1125563))

(assert (=> b!1221154 m!1125567))

(declare-fun m!1125569 () Bool)

(assert (=> b!1221154 m!1125569))

(assert (=> b!1221155 m!1125567))

(assert (=> b!1221155 m!1125567))

(declare-fun m!1125571 () Bool)

(assert (=> b!1221155 m!1125571))

(declare-fun m!1125573 () Bool)

(assert (=> b!1221150 m!1125573))

(declare-fun m!1125575 () Bool)

(assert (=> b!1221152 m!1125575))

(assert (=> b!1221147 m!1125567))

(assert (=> b!1221147 m!1125567))

(declare-fun m!1125577 () Bool)

(assert (=> b!1221147 m!1125577))

(declare-fun m!1125579 () Bool)

(assert (=> b!1221149 m!1125579))

(declare-fun m!1125581 () Bool)

(assert (=> d!133667 m!1125581))

(assert (=> d!133667 m!1125353))

(assert (=> b!1221156 m!1125567))

(assert (=> b!1221156 m!1125567))

(assert (=> b!1221156 m!1125577))

(assert (=> bm!60689 m!1125579))

(assert (=> b!1221157 m!1125563))

(assert (=> b!1221157 m!1125377))

(assert (=> b!1221157 m!1125565))

(declare-fun m!1125583 () Bool)

(assert (=> b!1221157 m!1125583))

(assert (=> b!1221157 m!1125567))

(assert (=> b!1221157 m!1125377))

(declare-fun m!1125585 () Bool)

(assert (=> b!1221157 m!1125585))

(assert (=> b!1221157 m!1125563))

(declare-fun m!1125587 () Bool)

(assert (=> b!1221157 m!1125587))

(assert (=> b!1221157 m!1125583))

(declare-fun m!1125589 () Bool)

(assert (=> b!1221157 m!1125589))

(assert (=> b!1220954 d!133667))

(declare-fun b!1221158 () Bool)

(declare-fun e!693452 () Bool)

(declare-fun e!693454 () Bool)

(assert (=> b!1221158 (= e!693452 e!693454)))

(declare-fun c!120238 () Bool)

(assert (=> b!1221158 (= c!120238 (bvslt from!1455 (size!38551 _keys!1208)))))

(declare-fun b!1221160 () Bool)

(declare-fun e!693457 () ListLongMap!18103)

(declare-fun call!60693 () ListLongMap!18103)

(assert (=> b!1221160 (= e!693457 call!60693)))

(declare-fun lt!555315 () ListLongMap!18103)

(declare-fun b!1221161 () Bool)

(assert (=> b!1221161 (= e!693454 (= lt!555315 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221162 () Bool)

(declare-fun res!811272 () Bool)

(declare-fun e!693456 () Bool)

(assert (=> b!1221162 (=> (not res!811272) (not e!693456))))

(assert (=> b!1221162 (= res!811272 (not (contains!6996 lt!555315 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221163 () Bool)

(declare-fun e!693458 () ListLongMap!18103)

(assert (=> b!1221163 (= e!693458 (ListLongMap!18104 Nil!26910))))

(declare-fun bm!60690 () Bool)

(assert (=> bm!60690 (= call!60693 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221164 () Bool)

(assert (=> b!1221164 (= e!693454 (isEmpty!1004 lt!555315))))

(declare-fun b!1221165 () Bool)

(assert (=> b!1221165 (= e!693456 e!693452)))

(declare-fun c!120236 () Bool)

(declare-fun e!693453 () Bool)

(assert (=> b!1221165 (= c!120236 e!693453)))

(declare-fun res!811271 () Bool)

(assert (=> b!1221165 (=> (not res!811271) (not e!693453))))

(assert (=> b!1221165 (= res!811271 (bvslt from!1455 (size!38551 _keys!1208)))))

(declare-fun b!1221166 () Bool)

(assert (=> b!1221166 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38551 _keys!1208)))))

(assert (=> b!1221166 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38552 _values!996)))))

(declare-fun e!693455 () Bool)

(assert (=> b!1221166 (= e!693455 (= (apply!968 lt!555315 (select (arr!38013 _keys!1208) from!1455)) (get!19409 (select (arr!38014 _values!996) from!1455) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221167 () Bool)

(assert (=> b!1221167 (= e!693452 e!693455)))

(assert (=> b!1221167 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38551 _keys!1208)))))

(declare-fun res!811273 () Bool)

(assert (=> b!1221167 (= res!811273 (contains!6996 lt!555315 (select (arr!38013 _keys!1208) from!1455)))))

(assert (=> b!1221167 (=> (not res!811273) (not e!693455))))

(declare-fun b!1221159 () Bool)

(assert (=> b!1221159 (= e!693458 e!693457)))

(declare-fun c!120237 () Bool)

(assert (=> b!1221159 (= c!120237 (validKeyInArray!0 (select (arr!38013 _keys!1208) from!1455)))))

(declare-fun d!133669 () Bool)

(assert (=> d!133669 e!693456))

(declare-fun res!811274 () Bool)

(assert (=> d!133669 (=> (not res!811274) (not e!693456))))

(assert (=> d!133669 (= res!811274 (not (contains!6996 lt!555315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133669 (= lt!555315 e!693458)))

(declare-fun c!120235 () Bool)

(assert (=> d!133669 (= c!120235 (bvsge from!1455 (size!38551 _keys!1208)))))

(assert (=> d!133669 (validMask!0 mask!1564)))

(assert (=> d!133669 (= (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555315)))

(declare-fun b!1221168 () Bool)

(assert (=> b!1221168 (= e!693453 (validKeyInArray!0 (select (arr!38013 _keys!1208) from!1455)))))

(assert (=> b!1221168 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1221169 () Bool)

(declare-fun lt!555321 () Unit!40305)

(declare-fun lt!555316 () Unit!40305)

(assert (=> b!1221169 (= lt!555321 lt!555316)))

(declare-fun lt!555319 () V!46505)

(declare-fun lt!555318 () (_ BitVec 64))

(declare-fun lt!555317 () ListLongMap!18103)

(declare-fun lt!555320 () (_ BitVec 64))

(assert (=> b!1221169 (not (contains!6996 (+!4130 lt!555317 (tuple2!20135 lt!555318 lt!555319)) lt!555320))))

(assert (=> b!1221169 (= lt!555316 (addStillNotContains!304 lt!555317 lt!555318 lt!555319 lt!555320))))

(assert (=> b!1221169 (= lt!555320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221169 (= lt!555319 (get!19409 (select (arr!38014 _values!996) from!1455) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221169 (= lt!555318 (select (arr!38013 _keys!1208) from!1455))))

(assert (=> b!1221169 (= lt!555317 call!60693)))

(assert (=> b!1221169 (= e!693457 (+!4130 call!60693 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133669 c!120235) b!1221163))

(assert (= (and d!133669 (not c!120235)) b!1221159))

(assert (= (and b!1221159 c!120237) b!1221169))

(assert (= (and b!1221159 (not c!120237)) b!1221160))

(assert (= (or b!1221169 b!1221160) bm!60690))

(assert (= (and d!133669 res!811274) b!1221162))

(assert (= (and b!1221162 res!811272) b!1221165))

(assert (= (and b!1221165 res!811271) b!1221168))

(assert (= (and b!1221165 c!120236) b!1221167))

(assert (= (and b!1221165 (not c!120236)) b!1221158))

(assert (= (and b!1221167 res!811273) b!1221166))

(assert (= (and b!1221158 c!120238) b!1221161))

(assert (= (and b!1221158 (not c!120238)) b!1221164))

(declare-fun b_lambda!22197 () Bool)

(assert (=> (not b_lambda!22197) (not b!1221166)))

(assert (=> b!1221166 t!40212))

(declare-fun b_and!43863 () Bool)

(assert (= b_and!43861 (and (=> t!40212 result!22857) b_and!43863)))

(declare-fun b_lambda!22199 () Bool)

(assert (=> (not b_lambda!22199) (not b!1221169)))

(assert (=> b!1221169 t!40212))

(declare-fun b_and!43865 () Bool)

(assert (= b_and!43863 (and (=> t!40212 result!22857) b_and!43865)))

(assert (=> b!1221166 m!1125347))

(assert (=> b!1221166 m!1125377))

(declare-fun m!1125591 () Bool)

(assert (=> b!1221166 m!1125591))

(assert (=> b!1221166 m!1125343))

(assert (=> b!1221166 m!1125377))

(assert (=> b!1221166 m!1125347))

(assert (=> b!1221166 m!1125343))

(declare-fun m!1125593 () Bool)

(assert (=> b!1221166 m!1125593))

(assert (=> b!1221167 m!1125343))

(assert (=> b!1221167 m!1125343))

(declare-fun m!1125595 () Bool)

(assert (=> b!1221167 m!1125595))

(declare-fun m!1125597 () Bool)

(assert (=> b!1221162 m!1125597))

(declare-fun m!1125599 () Bool)

(assert (=> b!1221164 m!1125599))

(assert (=> b!1221159 m!1125343))

(assert (=> b!1221159 m!1125343))

(assert (=> b!1221159 m!1125361))

(declare-fun m!1125601 () Bool)

(assert (=> b!1221161 m!1125601))

(declare-fun m!1125603 () Bool)

(assert (=> d!133669 m!1125603))

(assert (=> d!133669 m!1125353))

(assert (=> b!1221168 m!1125343))

(assert (=> b!1221168 m!1125343))

(assert (=> b!1221168 m!1125361))

(assert (=> bm!60690 m!1125601))

(assert (=> b!1221169 m!1125347))

(assert (=> b!1221169 m!1125377))

(assert (=> b!1221169 m!1125591))

(declare-fun m!1125605 () Bool)

(assert (=> b!1221169 m!1125605))

(assert (=> b!1221169 m!1125343))

(assert (=> b!1221169 m!1125377))

(declare-fun m!1125607 () Bool)

(assert (=> b!1221169 m!1125607))

(assert (=> b!1221169 m!1125347))

(declare-fun m!1125609 () Bool)

(assert (=> b!1221169 m!1125609))

(assert (=> b!1221169 m!1125605))

(declare-fun m!1125611 () Bool)

(assert (=> b!1221169 m!1125611))

(assert (=> b!1220954 d!133669))

(declare-fun b!1221180 () Bool)

(declare-fun e!693469 () Bool)

(declare-fun call!60696 () Bool)

(assert (=> b!1221180 (= e!693469 call!60696)))

(declare-fun b!1221181 () Bool)

(assert (=> b!1221181 (= e!693469 call!60696)))

(declare-fun b!1221182 () Bool)

(declare-fun e!693468 () Bool)

(declare-fun e!693470 () Bool)

(assert (=> b!1221182 (= e!693468 e!693470)))

(declare-fun res!811282 () Bool)

(assert (=> b!1221182 (=> (not res!811282) (not e!693470))))

(declare-fun e!693467 () Bool)

(assert (=> b!1221182 (= res!811282 (not e!693467))))

(declare-fun res!811283 () Bool)

(assert (=> b!1221182 (=> (not res!811283) (not e!693467))))

(assert (=> b!1221182 (= res!811283 (validKeyInArray!0 (select (arr!38013 _keys!1208) from!1455)))))

(declare-fun b!1221183 () Bool)

(assert (=> b!1221183 (= e!693470 e!693469)))

(declare-fun c!120241 () Bool)

(assert (=> b!1221183 (= c!120241 (validKeyInArray!0 (select (arr!38013 _keys!1208) from!1455)))))

(declare-fun b!1221184 () Bool)

(assert (=> b!1221184 (= e!693467 (contains!6995 Nil!26911 (select (arr!38013 _keys!1208) from!1455)))))

(declare-fun bm!60693 () Bool)

(assert (=> bm!60693 (= call!60696 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120241 (Cons!26910 (select (arr!38013 _keys!1208) from!1455) Nil!26911) Nil!26911)))))

(declare-fun d!133671 () Bool)

(declare-fun res!811281 () Bool)

(assert (=> d!133671 (=> res!811281 e!693468)))

(assert (=> d!133671 (= res!811281 (bvsge from!1455 (size!38551 _keys!1208)))))

(assert (=> d!133671 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26911) e!693468)))

(assert (= (and d!133671 (not res!811281)) b!1221182))

(assert (= (and b!1221182 res!811283) b!1221184))

(assert (= (and b!1221182 res!811282) b!1221183))

(assert (= (and b!1221183 c!120241) b!1221180))

(assert (= (and b!1221183 (not c!120241)) b!1221181))

(assert (= (or b!1221180 b!1221181) bm!60693))

(assert (=> b!1221182 m!1125343))

(assert (=> b!1221182 m!1125343))

(assert (=> b!1221182 m!1125361))

(assert (=> b!1221183 m!1125343))

(assert (=> b!1221183 m!1125343))

(assert (=> b!1221183 m!1125361))

(assert (=> b!1221184 m!1125343))

(assert (=> b!1221184 m!1125343))

(declare-fun m!1125613 () Bool)

(assert (=> b!1221184 m!1125613))

(assert (=> bm!60693 m!1125343))

(declare-fun m!1125615 () Bool)

(assert (=> bm!60693 m!1125615))

(assert (=> b!1220956 d!133671))

(declare-fun d!133673 () Bool)

(assert (=> d!133673 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26911)))

(declare-fun lt!555324 () Unit!40305)

(declare-fun choose!39 (array!78766 (_ BitVec 32) (_ BitVec 32)) Unit!40305)

(assert (=> d!133673 (= lt!555324 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133673 (bvslt (size!38551 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133673 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!555324)))

(declare-fun bs!34348 () Bool)

(assert (= bs!34348 d!133673))

(assert (=> bs!34348 m!1125383))

(declare-fun m!1125617 () Bool)

(assert (=> bs!34348 m!1125617))

(assert (=> b!1220956 d!133673))

(declare-fun d!133675 () Bool)

(declare-fun res!811284 () Bool)

(declare-fun e!693471 () Bool)

(assert (=> d!133675 (=> res!811284 e!693471)))

(assert (=> d!133675 (= res!811284 (= (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133675 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!693471)))

(declare-fun b!1221185 () Bool)

(declare-fun e!693472 () Bool)

(assert (=> b!1221185 (= e!693471 e!693472)))

(declare-fun res!811285 () Bool)

(assert (=> b!1221185 (=> (not res!811285) (not e!693472))))

(assert (=> b!1221185 (= res!811285 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38551 _keys!1208)))))

(declare-fun b!1221186 () Bool)

(assert (=> b!1221186 (= e!693472 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133675 (not res!811284)) b!1221185))

(assert (= (and b!1221185 res!811285) b!1221186))

(declare-fun m!1125619 () Bool)

(assert (=> d!133675 m!1125619))

(declare-fun m!1125621 () Bool)

(assert (=> b!1221186 m!1125621))

(assert (=> b!1220956 d!133675))

(declare-fun d!133677 () Bool)

(assert (=> d!133677 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555327 () Unit!40305)

(declare-fun choose!114 (array!78766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40305)

(assert (=> d!133677 (= lt!555327 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133677 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133677 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!555327)))

(declare-fun bs!34349 () Bool)

(assert (= bs!34349 d!133677))

(assert (=> bs!34349 m!1125387))

(declare-fun m!1125623 () Bool)

(assert (=> bs!34349 m!1125623))

(assert (=> b!1220956 d!133677))

(declare-fun b!1221187 () Bool)

(declare-fun e!693475 () Bool)

(declare-fun call!60697 () Bool)

(assert (=> b!1221187 (= e!693475 call!60697)))

(declare-fun b!1221188 () Bool)

(assert (=> b!1221188 (= e!693475 call!60697)))

(declare-fun b!1221189 () Bool)

(declare-fun e!693474 () Bool)

(declare-fun e!693476 () Bool)

(assert (=> b!1221189 (= e!693474 e!693476)))

(declare-fun res!811287 () Bool)

(assert (=> b!1221189 (=> (not res!811287) (not e!693476))))

(declare-fun e!693473 () Bool)

(assert (=> b!1221189 (= res!811287 (not e!693473))))

(declare-fun res!811288 () Bool)

(assert (=> b!1221189 (=> (not res!811288) (not e!693473))))

(assert (=> b!1221189 (= res!811288 (validKeyInArray!0 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221190 () Bool)

(assert (=> b!1221190 (= e!693476 e!693475)))

(declare-fun c!120242 () Bool)

(assert (=> b!1221190 (= c!120242 (validKeyInArray!0 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221191 () Bool)

(assert (=> b!1221191 (= e!693473 (contains!6995 Nil!26911 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60694 () Bool)

(assert (=> bm!60694 (= call!60697 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120242 (Cons!26910 (select (arr!38013 _keys!1208) #b00000000000000000000000000000000) Nil!26911) Nil!26911)))))

(declare-fun d!133679 () Bool)

(declare-fun res!811286 () Bool)

(assert (=> d!133679 (=> res!811286 e!693474)))

(assert (=> d!133679 (= res!811286 (bvsge #b00000000000000000000000000000000 (size!38551 _keys!1208)))))

(assert (=> d!133679 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26911) e!693474)))

(assert (= (and d!133679 (not res!811286)) b!1221189))

(assert (= (and b!1221189 res!811288) b!1221191))

(assert (= (and b!1221189 res!811287) b!1221190))

(assert (= (and b!1221190 c!120242) b!1221187))

(assert (= (and b!1221190 (not c!120242)) b!1221188))

(assert (= (or b!1221187 b!1221188) bm!60694))

(assert (=> b!1221189 m!1125543))

(assert (=> b!1221189 m!1125543))

(assert (=> b!1221189 m!1125557))

(assert (=> b!1221190 m!1125543))

(assert (=> b!1221190 m!1125543))

(assert (=> b!1221190 m!1125557))

(assert (=> b!1221191 m!1125543))

(assert (=> b!1221191 m!1125543))

(declare-fun m!1125625 () Bool)

(assert (=> b!1221191 m!1125625))

(assert (=> bm!60694 m!1125543))

(declare-fun m!1125627 () Bool)

(assert (=> bm!60694 m!1125627))

(assert (=> b!1220957 d!133679))

(declare-fun b!1221192 () Bool)

(declare-fun e!693477 () Bool)

(declare-fun e!693479 () Bool)

(assert (=> b!1221192 (= e!693477 e!693479)))

(declare-fun c!120246 () Bool)

(assert (=> b!1221192 (= c!120246 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)))))

(declare-fun b!1221194 () Bool)

(declare-fun e!693482 () ListLongMap!18103)

(declare-fun call!60698 () ListLongMap!18103)

(assert (=> b!1221194 (= e!693482 call!60698)))

(declare-fun b!1221195 () Bool)

(declare-fun lt!555328 () ListLongMap!18103)

(assert (=> b!1221195 (= e!693479 (= lt!555328 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221196 () Bool)

(declare-fun res!811290 () Bool)

(declare-fun e!693481 () Bool)

(assert (=> b!1221196 (=> (not res!811290) (not e!693481))))

(assert (=> b!1221196 (= res!811290 (not (contains!6996 lt!555328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221197 () Bool)

(declare-fun e!693483 () ListLongMap!18103)

(assert (=> b!1221197 (= e!693483 (ListLongMap!18104 Nil!26910))))

(declare-fun bm!60695 () Bool)

(assert (=> bm!60695 (= call!60698 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221198 () Bool)

(assert (=> b!1221198 (= e!693479 (isEmpty!1004 lt!555328))))

(declare-fun b!1221199 () Bool)

(assert (=> b!1221199 (= e!693481 e!693477)))

(declare-fun c!120244 () Bool)

(declare-fun e!693478 () Bool)

(assert (=> b!1221199 (= c!120244 e!693478)))

(declare-fun res!811289 () Bool)

(assert (=> b!1221199 (=> (not res!811289) (not e!693478))))

(assert (=> b!1221199 (= res!811289 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)))))

(declare-fun b!1221200 () Bool)

(assert (=> b!1221200 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)))))

(assert (=> b!1221200 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38552 _values!996)))))

(declare-fun e!693480 () Bool)

(assert (=> b!1221200 (= e!693480 (= (apply!968 lt!555328 (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19409 (select (arr!38014 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221201 () Bool)

(assert (=> b!1221201 (= e!693477 e!693480)))

(assert (=> b!1221201 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)))))

(declare-fun res!811291 () Bool)

(assert (=> b!1221201 (= res!811291 (contains!6996 lt!555328 (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221201 (=> (not res!811291) (not e!693480))))

(declare-fun b!1221193 () Bool)

(assert (=> b!1221193 (= e!693483 e!693482)))

(declare-fun c!120245 () Bool)

(assert (=> b!1221193 (= c!120245 (validKeyInArray!0 (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133681 () Bool)

(assert (=> d!133681 e!693481))

(declare-fun res!811292 () Bool)

(assert (=> d!133681 (=> (not res!811292) (not e!693481))))

(assert (=> d!133681 (= res!811292 (not (contains!6996 lt!555328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133681 (= lt!555328 e!693483)))

(declare-fun c!120243 () Bool)

(assert (=> d!133681 (= c!120243 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)))))

(assert (=> d!133681 (validMask!0 mask!1564)))

(assert (=> d!133681 (= (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555328)))

(declare-fun b!1221202 () Bool)

(assert (=> b!1221202 (= e!693478 (validKeyInArray!0 (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221202 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1221203 () Bool)

(declare-fun lt!555334 () Unit!40305)

(declare-fun lt!555329 () Unit!40305)

(assert (=> b!1221203 (= lt!555334 lt!555329)))

(declare-fun lt!555330 () ListLongMap!18103)

(declare-fun lt!555333 () (_ BitVec 64))

(declare-fun lt!555332 () V!46505)

(declare-fun lt!555331 () (_ BitVec 64))

(assert (=> b!1221203 (not (contains!6996 (+!4130 lt!555330 (tuple2!20135 lt!555331 lt!555332)) lt!555333))))

(assert (=> b!1221203 (= lt!555329 (addStillNotContains!304 lt!555330 lt!555331 lt!555332 lt!555333))))

(assert (=> b!1221203 (= lt!555333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221203 (= lt!555332 (get!19409 (select (arr!38014 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221203 (= lt!555331 (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1221203 (= lt!555330 call!60698)))

(assert (=> b!1221203 (= e!693482 (+!4130 call!60698 (tuple2!20135 (select (arr!38013 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19409 (select (arr!38014 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133681 c!120243) b!1221197))

(assert (= (and d!133681 (not c!120243)) b!1221193))

(assert (= (and b!1221193 c!120245) b!1221203))

(assert (= (and b!1221193 (not c!120245)) b!1221194))

(assert (= (or b!1221203 b!1221194) bm!60695))

(assert (= (and d!133681 res!811292) b!1221196))

(assert (= (and b!1221196 res!811290) b!1221199))

(assert (= (and b!1221199 res!811289) b!1221202))

(assert (= (and b!1221199 c!120244) b!1221201))

(assert (= (and b!1221199 (not c!120244)) b!1221192))

(assert (= (and b!1221201 res!811291) b!1221200))

(assert (= (and b!1221192 c!120246) b!1221195))

(assert (= (and b!1221192 (not c!120246)) b!1221198))

(declare-fun b_lambda!22201 () Bool)

(assert (=> (not b_lambda!22201) (not b!1221200)))

(assert (=> b!1221200 t!40212))

(declare-fun b_and!43867 () Bool)

(assert (= b_and!43865 (and (=> t!40212 result!22857) b_and!43867)))

(declare-fun b_lambda!22203 () Bool)

(assert (=> (not b_lambda!22203) (not b!1221203)))

(assert (=> b!1221203 t!40212))

(declare-fun b_and!43869 () Bool)

(assert (= b_and!43867 (and (=> t!40212 result!22857) b_and!43869)))

(declare-fun m!1125629 () Bool)

(assert (=> b!1221200 m!1125629))

(assert (=> b!1221200 m!1125377))

(declare-fun m!1125631 () Bool)

(assert (=> b!1221200 m!1125631))

(assert (=> b!1221200 m!1125619))

(assert (=> b!1221200 m!1125377))

(assert (=> b!1221200 m!1125629))

(assert (=> b!1221200 m!1125619))

(declare-fun m!1125633 () Bool)

(assert (=> b!1221200 m!1125633))

(assert (=> b!1221201 m!1125619))

(assert (=> b!1221201 m!1125619))

(declare-fun m!1125635 () Bool)

(assert (=> b!1221201 m!1125635))

(declare-fun m!1125637 () Bool)

(assert (=> b!1221196 m!1125637))

(declare-fun m!1125639 () Bool)

(assert (=> b!1221198 m!1125639))

(assert (=> b!1221193 m!1125619))

(assert (=> b!1221193 m!1125619))

(declare-fun m!1125641 () Bool)

(assert (=> b!1221193 m!1125641))

(declare-fun m!1125643 () Bool)

(assert (=> b!1221195 m!1125643))

(declare-fun m!1125645 () Bool)

(assert (=> d!133681 m!1125645))

(assert (=> d!133681 m!1125353))

(assert (=> b!1221202 m!1125619))

(assert (=> b!1221202 m!1125619))

(assert (=> b!1221202 m!1125641))

(assert (=> bm!60695 m!1125643))

(assert (=> b!1221203 m!1125629))

(assert (=> b!1221203 m!1125377))

(assert (=> b!1221203 m!1125631))

(declare-fun m!1125647 () Bool)

(assert (=> b!1221203 m!1125647))

(assert (=> b!1221203 m!1125619))

(assert (=> b!1221203 m!1125377))

(declare-fun m!1125649 () Bool)

(assert (=> b!1221203 m!1125649))

(assert (=> b!1221203 m!1125629))

(declare-fun m!1125651 () Bool)

(assert (=> b!1221203 m!1125651))

(assert (=> b!1221203 m!1125647))

(declare-fun m!1125653 () Bool)

(assert (=> b!1221203 m!1125653))

(assert (=> b!1220948 d!133681))

(declare-fun d!133683 () Bool)

(assert (=> d!133683 (= (validKeyInArray!0 (select (arr!38013 _keys!1208) from!1455)) (and (not (= (select (arr!38013 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38013 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1220948 d!133683))

(declare-fun d!133685 () Bool)

(declare-fun lt!555337 () ListLongMap!18103)

(assert (=> d!133685 (not (contains!6996 lt!555337 k0!934))))

(declare-fun removeStrictlySorted!108 (List!26913 (_ BitVec 64)) List!26913)

(assert (=> d!133685 (= lt!555337 (ListLongMap!18104 (removeStrictlySorted!108 (toList!9067 lt!555195) k0!934)))))

(assert (=> d!133685 (= (-!1894 lt!555195 k0!934) lt!555337)))

(declare-fun bs!34350 () Bool)

(assert (= bs!34350 d!133685))

(declare-fun m!1125655 () Bool)

(assert (=> bs!34350 m!1125655))

(declare-fun m!1125657 () Bool)

(assert (=> bs!34350 m!1125657))

(assert (=> b!1220948 d!133685))

(declare-fun b!1221204 () Bool)

(declare-fun e!693484 () Bool)

(declare-fun e!693486 () Bool)

(assert (=> b!1221204 (= e!693484 e!693486)))

(declare-fun c!120250 () Bool)

(assert (=> b!1221204 (= c!120250 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 lt!555199)))))

(declare-fun b!1221206 () Bool)

(declare-fun e!693489 () ListLongMap!18103)

(declare-fun call!60699 () ListLongMap!18103)

(assert (=> b!1221206 (= e!693489 call!60699)))

(declare-fun b!1221207 () Bool)

(declare-fun lt!555338 () ListLongMap!18103)

(assert (=> b!1221207 (= e!693486 (= lt!555338 (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221208 () Bool)

(declare-fun res!811294 () Bool)

(declare-fun e!693488 () Bool)

(assert (=> b!1221208 (=> (not res!811294) (not e!693488))))

(assert (=> b!1221208 (= res!811294 (not (contains!6996 lt!555338 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221209 () Bool)

(declare-fun e!693490 () ListLongMap!18103)

(assert (=> b!1221209 (= e!693490 (ListLongMap!18104 Nil!26910))))

(declare-fun bm!60696 () Bool)

(assert (=> bm!60696 (= call!60699 (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221210 () Bool)

(assert (=> b!1221210 (= e!693486 (isEmpty!1004 lt!555338))))

(declare-fun b!1221211 () Bool)

(assert (=> b!1221211 (= e!693488 e!693484)))

(declare-fun c!120248 () Bool)

(declare-fun e!693485 () Bool)

(assert (=> b!1221211 (= c!120248 e!693485)))

(declare-fun res!811293 () Bool)

(assert (=> b!1221211 (=> (not res!811293) (not e!693485))))

(assert (=> b!1221211 (= res!811293 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 lt!555199)))))

(declare-fun b!1221212 () Bool)

(assert (=> b!1221212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 lt!555199)))))

(assert (=> b!1221212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38552 lt!555198)))))

(declare-fun e!693487 () Bool)

(assert (=> b!1221212 (= e!693487 (= (apply!968 lt!555338 (select (arr!38013 lt!555199) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19409 (select (arr!38014 lt!555198) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221213 () Bool)

(assert (=> b!1221213 (= e!693484 e!693487)))

(assert (=> b!1221213 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 lt!555199)))))

(declare-fun res!811295 () Bool)

(assert (=> b!1221213 (= res!811295 (contains!6996 lt!555338 (select (arr!38013 lt!555199) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221213 (=> (not res!811295) (not e!693487))))

(declare-fun b!1221205 () Bool)

(assert (=> b!1221205 (= e!693490 e!693489)))

(declare-fun c!120249 () Bool)

(assert (=> b!1221205 (= c!120249 (validKeyInArray!0 (select (arr!38013 lt!555199) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133687 () Bool)

(assert (=> d!133687 e!693488))

(declare-fun res!811296 () Bool)

(assert (=> d!133687 (=> (not res!811296) (not e!693488))))

(assert (=> d!133687 (= res!811296 (not (contains!6996 lt!555338 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133687 (= lt!555338 e!693490)))

(declare-fun c!120247 () Bool)

(assert (=> d!133687 (= c!120247 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 lt!555199)))))

(assert (=> d!133687 (validMask!0 mask!1564)))

(assert (=> d!133687 (= (getCurrentListMapNoExtraKeys!5502 lt!555199 lt!555198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555338)))

(declare-fun b!1221214 () Bool)

(assert (=> b!1221214 (= e!693485 (validKeyInArray!0 (select (arr!38013 lt!555199) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221214 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1221215 () Bool)

(declare-fun lt!555344 () Unit!40305)

(declare-fun lt!555339 () Unit!40305)

(assert (=> b!1221215 (= lt!555344 lt!555339)))

(declare-fun lt!555343 () (_ BitVec 64))

(declare-fun lt!555340 () ListLongMap!18103)

(declare-fun lt!555342 () V!46505)

(declare-fun lt!555341 () (_ BitVec 64))

(assert (=> b!1221215 (not (contains!6996 (+!4130 lt!555340 (tuple2!20135 lt!555341 lt!555342)) lt!555343))))

(assert (=> b!1221215 (= lt!555339 (addStillNotContains!304 lt!555340 lt!555341 lt!555342 lt!555343))))

(assert (=> b!1221215 (= lt!555343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221215 (= lt!555342 (get!19409 (select (arr!38014 lt!555198) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221215 (= lt!555341 (select (arr!38013 lt!555199) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1221215 (= lt!555340 call!60699)))

(assert (=> b!1221215 (= e!693489 (+!4130 call!60699 (tuple2!20135 (select (arr!38013 lt!555199) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19409 (select (arr!38014 lt!555198) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133687 c!120247) b!1221209))

(assert (= (and d!133687 (not c!120247)) b!1221205))

(assert (= (and b!1221205 c!120249) b!1221215))

(assert (= (and b!1221205 (not c!120249)) b!1221206))

(assert (= (or b!1221215 b!1221206) bm!60696))

(assert (= (and d!133687 res!811296) b!1221208))

(assert (= (and b!1221208 res!811294) b!1221211))

(assert (= (and b!1221211 res!811293) b!1221214))

(assert (= (and b!1221211 c!120248) b!1221213))

(assert (= (and b!1221211 (not c!120248)) b!1221204))

(assert (= (and b!1221213 res!811295) b!1221212))

(assert (= (and b!1221204 c!120250) b!1221207))

(assert (= (and b!1221204 (not c!120250)) b!1221210))

(declare-fun b_lambda!22205 () Bool)

(assert (=> (not b_lambda!22205) (not b!1221212)))

(assert (=> b!1221212 t!40212))

(declare-fun b_and!43871 () Bool)

(assert (= b_and!43869 (and (=> t!40212 result!22857) b_and!43871)))

(declare-fun b_lambda!22207 () Bool)

(assert (=> (not b_lambda!22207) (not b!1221215)))

(assert (=> b!1221215 t!40212))

(declare-fun b_and!43873 () Bool)

(assert (= b_and!43871 (and (=> t!40212 result!22857) b_and!43873)))

(declare-fun m!1125659 () Bool)

(assert (=> b!1221212 m!1125659))

(assert (=> b!1221212 m!1125377))

(declare-fun m!1125661 () Bool)

(assert (=> b!1221212 m!1125661))

(declare-fun m!1125663 () Bool)

(assert (=> b!1221212 m!1125663))

(assert (=> b!1221212 m!1125377))

(assert (=> b!1221212 m!1125659))

(assert (=> b!1221212 m!1125663))

(declare-fun m!1125665 () Bool)

(assert (=> b!1221212 m!1125665))

(assert (=> b!1221213 m!1125663))

(assert (=> b!1221213 m!1125663))

(declare-fun m!1125667 () Bool)

(assert (=> b!1221213 m!1125667))

(declare-fun m!1125669 () Bool)

(assert (=> b!1221208 m!1125669))

(declare-fun m!1125671 () Bool)

(assert (=> b!1221210 m!1125671))

(assert (=> b!1221205 m!1125663))

(assert (=> b!1221205 m!1125663))

(declare-fun m!1125673 () Bool)

(assert (=> b!1221205 m!1125673))

(declare-fun m!1125675 () Bool)

(assert (=> b!1221207 m!1125675))

(declare-fun m!1125677 () Bool)

(assert (=> d!133687 m!1125677))

(assert (=> d!133687 m!1125353))

(assert (=> b!1221214 m!1125663))

(assert (=> b!1221214 m!1125663))

(assert (=> b!1221214 m!1125673))

(assert (=> bm!60696 m!1125675))

(assert (=> b!1221215 m!1125659))

(assert (=> b!1221215 m!1125377))

(assert (=> b!1221215 m!1125661))

(declare-fun m!1125679 () Bool)

(assert (=> b!1221215 m!1125679))

(assert (=> b!1221215 m!1125663))

(assert (=> b!1221215 m!1125377))

(declare-fun m!1125681 () Bool)

(assert (=> b!1221215 m!1125681))

(assert (=> b!1221215 m!1125659))

(declare-fun m!1125683 () Bool)

(assert (=> b!1221215 m!1125683))

(assert (=> b!1221215 m!1125679))

(declare-fun m!1125685 () Bool)

(assert (=> b!1221215 m!1125685))

(assert (=> b!1220948 d!133687))

(declare-fun call!60704 () ListLongMap!18103)

(declare-fun bm!60701 () Bool)

(assert (=> bm!60701 (= call!60704 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221222 () Bool)

(declare-fun e!693496 () Bool)

(declare-fun e!693495 () Bool)

(assert (=> b!1221222 (= e!693496 e!693495)))

(declare-fun c!120253 () Bool)

(assert (=> b!1221222 (= c!120253 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1221223 () Bool)

(declare-fun call!60705 () ListLongMap!18103)

(assert (=> b!1221223 (= e!693495 (= call!60705 (-!1894 call!60704 k0!934)))))

(assert (=> b!1221223 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38552 _values!996)))))

(declare-fun bm!60702 () Bool)

(assert (=> bm!60702 (= call!60705 (getCurrentListMapNoExtraKeys!5502 (array!78767 (store (arr!38013 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38551 _keys!1208)) (array!78769 (store (arr!38014 _values!996) i!673 (ValueCellFull!14807 (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38552 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133689 () Bool)

(assert (=> d!133689 e!693496))

(declare-fun res!811299 () Bool)

(assert (=> d!133689 (=> (not res!811299) (not e!693496))))

(assert (=> d!133689 (= res!811299 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38551 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38551 _keys!1208))))))))

(declare-fun lt!555347 () Unit!40305)

(declare-fun choose!1834 (array!78766 array!78768 (_ BitVec 32) (_ BitVec 32) V!46505 V!46505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40305)

(assert (=> d!133689 (= lt!555347 (choose!1834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133689 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38551 _keys!1208)))))

(assert (=> d!133689 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555347)))

(declare-fun b!1221224 () Bool)

(assert (=> b!1221224 (= e!693495 (= call!60705 call!60704))))

(assert (=> b!1221224 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38552 _values!996)))))

(assert (= (and d!133689 res!811299) b!1221222))

(assert (= (and b!1221222 c!120253) b!1221223))

(assert (= (and b!1221222 (not c!120253)) b!1221224))

(assert (= (or b!1221223 b!1221224) bm!60701))

(assert (= (or b!1221223 b!1221224) bm!60702))

(declare-fun b_lambda!22209 () Bool)

(assert (=> (not b_lambda!22209) (not bm!60702)))

(assert (=> bm!60702 t!40212))

(declare-fun b_and!43875 () Bool)

(assert (= b_and!43873 (and (=> t!40212 result!22857) b_and!43875)))

(assert (=> bm!60701 m!1125355))

(declare-fun m!1125687 () Bool)

(assert (=> b!1221223 m!1125687))

(assert (=> bm!60702 m!1125399))

(assert (=> bm!60702 m!1125377))

(declare-fun m!1125689 () Bool)

(assert (=> bm!60702 m!1125689))

(declare-fun m!1125691 () Bool)

(assert (=> bm!60702 m!1125691))

(declare-fun m!1125693 () Bool)

(assert (=> d!133689 m!1125693))

(assert (=> b!1220948 d!133689))

(declare-fun b!1221225 () Bool)

(declare-fun e!693499 () Bool)

(declare-fun call!60706 () Bool)

(assert (=> b!1221225 (= e!693499 call!60706)))

(declare-fun b!1221226 () Bool)

(assert (=> b!1221226 (= e!693499 call!60706)))

(declare-fun b!1221227 () Bool)

(declare-fun e!693498 () Bool)

(declare-fun e!693500 () Bool)

(assert (=> b!1221227 (= e!693498 e!693500)))

(declare-fun res!811301 () Bool)

(assert (=> b!1221227 (=> (not res!811301) (not e!693500))))

(declare-fun e!693497 () Bool)

(assert (=> b!1221227 (= res!811301 (not e!693497))))

(declare-fun res!811302 () Bool)

(assert (=> b!1221227 (=> (not res!811302) (not e!693497))))

(assert (=> b!1221227 (= res!811302 (validKeyInArray!0 (select (arr!38013 lt!555199) #b00000000000000000000000000000000)))))

(declare-fun b!1221228 () Bool)

(assert (=> b!1221228 (= e!693500 e!693499)))

(declare-fun c!120254 () Bool)

(assert (=> b!1221228 (= c!120254 (validKeyInArray!0 (select (arr!38013 lt!555199) #b00000000000000000000000000000000)))))

(declare-fun b!1221229 () Bool)

(assert (=> b!1221229 (= e!693497 (contains!6995 Nil!26911 (select (arr!38013 lt!555199) #b00000000000000000000000000000000)))))

(declare-fun bm!60703 () Bool)

(assert (=> bm!60703 (= call!60706 (arrayNoDuplicates!0 lt!555199 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120254 (Cons!26910 (select (arr!38013 lt!555199) #b00000000000000000000000000000000) Nil!26911) Nil!26911)))))

(declare-fun d!133691 () Bool)

(declare-fun res!811300 () Bool)

(assert (=> d!133691 (=> res!811300 e!693498)))

(assert (=> d!133691 (= res!811300 (bvsge #b00000000000000000000000000000000 (size!38551 lt!555199)))))

(assert (=> d!133691 (= (arrayNoDuplicates!0 lt!555199 #b00000000000000000000000000000000 Nil!26911) e!693498)))

(assert (= (and d!133691 (not res!811300)) b!1221227))

(assert (= (and b!1221227 res!811302) b!1221229))

(assert (= (and b!1221227 res!811301) b!1221228))

(assert (= (and b!1221228 c!120254) b!1221225))

(assert (= (and b!1221228 (not c!120254)) b!1221226))

(assert (= (or b!1221225 b!1221226) bm!60703))

(assert (=> b!1221227 m!1125533))

(assert (=> b!1221227 m!1125533))

(assert (=> b!1221227 m!1125541))

(assert (=> b!1221228 m!1125533))

(assert (=> b!1221228 m!1125533))

(assert (=> b!1221228 m!1125541))

(assert (=> b!1221229 m!1125533))

(assert (=> b!1221229 m!1125533))

(declare-fun m!1125695 () Bool)

(assert (=> b!1221229 m!1125695))

(assert (=> bm!60703 m!1125533))

(declare-fun m!1125697 () Bool)

(assert (=> bm!60703 m!1125697))

(assert (=> b!1220959 d!133691))

(declare-fun d!133693 () Bool)

(declare-fun e!693503 () Bool)

(assert (=> d!133693 e!693503))

(declare-fun res!811307 () Bool)

(assert (=> d!133693 (=> (not res!811307) (not e!693503))))

(declare-fun lt!555359 () ListLongMap!18103)

(assert (=> d!133693 (= res!811307 (contains!6996 lt!555359 (_1!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))))))

(declare-fun lt!555357 () List!26913)

(assert (=> d!133693 (= lt!555359 (ListLongMap!18104 lt!555357))))

(declare-fun lt!555356 () Unit!40305)

(declare-fun lt!555358 () Unit!40305)

(assert (=> d!133693 (= lt!555356 lt!555358)))

(declare-datatypes ((Option!699 0))(
  ( (Some!698 (v!18233 V!46505)) (None!697) )
))
(declare-fun getValueByKey!648 (List!26913 (_ BitVec 64)) Option!699)

(assert (=> d!133693 (= (getValueByKey!648 lt!555357 (_1!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))) (Some!698 (_2!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!324 (List!26913 (_ BitVec 64) V!46505) Unit!40305)

(assert (=> d!133693 (= lt!555358 (lemmaContainsTupThenGetReturnValue!324 lt!555357 (_1!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203))) (_2!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))))))

(declare-fun insertStrictlySorted!417 (List!26913 (_ BitVec 64) V!46505) List!26913)

(assert (=> d!133693 (= lt!555357 (insertStrictlySorted!417 (toList!9067 lt!555200) (_1!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203))) (_2!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))))))

(assert (=> d!133693 (= (+!4130 lt!555200 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203))) lt!555359)))

(declare-fun b!1221234 () Bool)

(declare-fun res!811308 () Bool)

(assert (=> b!1221234 (=> (not res!811308) (not e!693503))))

(assert (=> b!1221234 (= res!811308 (= (getValueByKey!648 (toList!9067 lt!555359) (_1!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203)))) (Some!698 (_2!10078 (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203))))))))

(declare-fun b!1221235 () Bool)

(declare-fun contains!6997 (List!26913 tuple2!20134) Bool)

(assert (=> b!1221235 (= e!693503 (contains!6997 (toList!9067 lt!555359) (tuple2!20135 (select (arr!38013 _keys!1208) from!1455) (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203))))))

(assert (= (and d!133693 res!811307) b!1221234))

(assert (= (and b!1221234 res!811308) b!1221235))

(declare-fun m!1125699 () Bool)

(assert (=> d!133693 m!1125699))

(declare-fun m!1125701 () Bool)

(assert (=> d!133693 m!1125701))

(declare-fun m!1125703 () Bool)

(assert (=> d!133693 m!1125703))

(declare-fun m!1125705 () Bool)

(assert (=> d!133693 m!1125705))

(declare-fun m!1125707 () Bool)

(assert (=> b!1221234 m!1125707))

(declare-fun m!1125709 () Bool)

(assert (=> b!1221235 m!1125709))

(assert (=> b!1220958 d!133693))

(declare-fun d!133695 () Bool)

(declare-fun c!120257 () Bool)

(assert (=> d!133695 (= c!120257 ((_ is ValueCellFull!14807) (select (arr!38014 _values!996) from!1455)))))

(declare-fun e!693506 () V!46505)

(assert (=> d!133695 (= (get!19409 (select (arr!38014 _values!996) from!1455) lt!555203) e!693506)))

(declare-fun b!1221240 () Bool)

(declare-fun get!19411 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1221240 (= e!693506 (get!19411 (select (arr!38014 _values!996) from!1455) lt!555203))))

(declare-fun b!1221241 () Bool)

(declare-fun get!19412 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1221241 (= e!693506 (get!19412 (select (arr!38014 _values!996) from!1455) lt!555203))))

(assert (= (and d!133695 c!120257) b!1221240))

(assert (= (and d!133695 (not c!120257)) b!1221241))

(assert (=> b!1221240 m!1125347))

(declare-fun m!1125711 () Bool)

(assert (=> b!1221240 m!1125711))

(assert (=> b!1221241 m!1125347))

(declare-fun m!1125713 () Bool)

(assert (=> b!1221241 m!1125713))

(assert (=> b!1220958 d!133695))

(declare-fun d!133697 () Bool)

(declare-fun res!811309 () Bool)

(declare-fun e!693507 () Bool)

(assert (=> d!133697 (=> res!811309 e!693507)))

(assert (=> d!133697 (= res!811309 (= (select (arr!38013 _keys!1208) i!673) k0!934))))

(assert (=> d!133697 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!693507)))

(declare-fun b!1221242 () Bool)

(declare-fun e!693508 () Bool)

(assert (=> b!1221242 (= e!693507 e!693508)))

(declare-fun res!811310 () Bool)

(assert (=> b!1221242 (=> (not res!811310) (not e!693508))))

(assert (=> b!1221242 (= res!811310 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38551 _keys!1208)))))

(declare-fun b!1221243 () Bool)

(assert (=> b!1221243 (= e!693508 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133697 (not res!811309)) b!1221242))

(assert (= (and b!1221242 res!811310) b!1221243))

(assert (=> d!133697 m!1125401))

(declare-fun m!1125715 () Bool)

(assert (=> b!1221243 m!1125715))

(assert (=> b!1220967 d!133697))

(declare-fun b!1221251 () Bool)

(declare-fun e!693513 () Bool)

(assert (=> b!1221251 (= e!693513 tp_is_empty!31033)))

(declare-fun condMapEmpty!48448 () Bool)

(declare-fun mapDefault!48448 () ValueCell!14807)

(assert (=> mapNonEmpty!48439 (= condMapEmpty!48448 (= mapRest!48439 ((as const (Array (_ BitVec 32) ValueCell!14807)) mapDefault!48448)))))

(declare-fun mapRes!48448 () Bool)

(assert (=> mapNonEmpty!48439 (= tp!92023 (and e!693513 mapRes!48448))))

(declare-fun mapNonEmpty!48448 () Bool)

(declare-fun tp!92039 () Bool)

(declare-fun e!693514 () Bool)

(assert (=> mapNonEmpty!48448 (= mapRes!48448 (and tp!92039 e!693514))))

(declare-fun mapRest!48448 () (Array (_ BitVec 32) ValueCell!14807))

(declare-fun mapValue!48448 () ValueCell!14807)

(declare-fun mapKey!48448 () (_ BitVec 32))

(assert (=> mapNonEmpty!48448 (= mapRest!48439 (store mapRest!48448 mapKey!48448 mapValue!48448))))

(declare-fun b!1221250 () Bool)

(assert (=> b!1221250 (= e!693514 tp_is_empty!31033)))

(declare-fun mapIsEmpty!48448 () Bool)

(assert (=> mapIsEmpty!48448 mapRes!48448))

(assert (= (and mapNonEmpty!48439 condMapEmpty!48448) mapIsEmpty!48448))

(assert (= (and mapNonEmpty!48439 (not condMapEmpty!48448)) mapNonEmpty!48448))

(assert (= (and mapNonEmpty!48448 ((_ is ValueCellFull!14807) mapValue!48448)) b!1221250))

(assert (= (and mapNonEmpty!48439 ((_ is ValueCellFull!14807) mapDefault!48448)) b!1221251))

(declare-fun m!1125717 () Bool)

(assert (=> mapNonEmpty!48448 m!1125717))

(declare-fun b_lambda!22211 () Bool)

(assert (= b_lambda!22209 (or (and start!101536 b_free!26329) b_lambda!22211)))

(declare-fun b_lambda!22213 () Bool)

(assert (= b_lambda!22201 (or (and start!101536 b_free!26329) b_lambda!22213)))

(declare-fun b_lambda!22215 () Bool)

(assert (= b_lambda!22197 (or (and start!101536 b_free!26329) b_lambda!22215)))

(declare-fun b_lambda!22217 () Bool)

(assert (= b_lambda!22199 (or (and start!101536 b_free!26329) b_lambda!22217)))

(declare-fun b_lambda!22219 () Bool)

(assert (= b_lambda!22203 (or (and start!101536 b_free!26329) b_lambda!22219)))

(declare-fun b_lambda!22221 () Bool)

(assert (= b_lambda!22193 (or (and start!101536 b_free!26329) b_lambda!22221)))

(declare-fun b_lambda!22223 () Bool)

(assert (= b_lambda!22207 (or (and start!101536 b_free!26329) b_lambda!22223)))

(declare-fun b_lambda!22225 () Bool)

(assert (= b_lambda!22205 (or (and start!101536 b_free!26329) b_lambda!22225)))

(declare-fun b_lambda!22227 () Bool)

(assert (= b_lambda!22195 (or (and start!101536 b_free!26329) b_lambda!22227)))

(check-sat (not b_lambda!22221) (not b!1221201) (not bm!60702) (not bm!60694) (not b_lambda!22215) (not d!133681) b_and!43875 (not b!1221149) (not b!1221186) (not b!1221111) (not b!1221207) (not b_lambda!22191) (not b!1221105) (not bm!60690) (not bm!60685) (not b!1221234) (not b!1221214) (not b!1221152) (not bm!60689) (not b!1221240) (not b!1221169) (not b!1221159) (not b_next!26329) (not b!1221164) tp_is_empty!31033 (not bm!60693) (not b!1221168) (not b!1221167) (not d!133693) (not b!1221235) (not bm!60696) (not bm!60695) (not b!1221210) (not b!1221212) (not b!1221120) (not b_lambda!22219) (not b!1221241) (not b!1221154) (not b!1221228) (not b!1221193) (not b!1221243) (not bm!60703) (not b!1221205) (not b!1221196) (not b!1221203) (not b!1221155) (not d!133653) (not d!133673) (not b!1221161) (not b_lambda!22225) (not d!133677) (not b_lambda!22211) (not b!1221182) (not b!1221227) (not b!1221162) (not b!1221121) (not b!1221115) (not b!1221200) (not b!1221215) (not b!1221147) (not b!1221189) (not b_lambda!22227) (not bm!60686) (not b!1221191) (not b!1221213) (not b_lambda!22213) (not b!1221198) (not d!133689) (not d!133685) (not b!1221112) (not b_lambda!22223) (not d!133667) (not b!1221202) (not b!1221223) (not b!1221195) (not b!1221102) (not d!133687) (not b!1221184) (not mapNonEmpty!48448) (not b!1221157) (not b_lambda!22217) (not b!1221166) (not b!1221150) (not d!133669) (not b!1221190) (not b!1221229) (not b!1221156) (not b!1221208) (not b!1221183) (not bm!60701))
(check-sat b_and!43875 (not b_next!26329))
