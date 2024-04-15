; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101644 () Bool)

(assert start!101644)

(declare-fun b_free!26371 () Bool)

(declare-fun b_next!26371 () Bool)

(assert (=> start!101644 (= b_free!26371 (not b_next!26371))))

(declare-fun tp!92155 () Bool)

(declare-fun b_and!43967 () Bool)

(assert (=> start!101644 (= tp!92155 b_and!43967)))

(declare-fun b!1222619 () Bool)

(declare-datatypes ((Unit!40345 0))(
  ( (Unit!40346) )
))
(declare-fun e!694340 () Unit!40345)

(declare-fun Unit!40347 () Unit!40345)

(assert (=> b!1222619 (= e!694340 Unit!40347)))

(declare-datatypes ((array!78854 0))(
  ( (array!78855 (arr!38055 (Array (_ BitVec 32) (_ BitVec 64))) (size!38593 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78854)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!556187 () Unit!40345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78854 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40345)

(assert (=> b!1222619 (= lt!556187 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222619 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556186 () Unit!40345)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78854 (_ BitVec 32) (_ BitVec 32)) Unit!40345)

(assert (=> b!1222619 (= lt!556186 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26947 0))(
  ( (Nil!26944) (Cons!26943 (h!28152 (_ BitVec 64)) (t!40289 List!26947)) )
))
(declare-fun arrayNoDuplicates!0 (array!78854 (_ BitVec 32) List!26947) Bool)

(assert (=> b!1222619 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26944)))

(declare-fun lt!556196 () Unit!40345)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78854 (_ BitVec 64) (_ BitVec 32) List!26947) Unit!40345)

(assert (=> b!1222619 (= lt!556196 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26944))))

(assert (=> b!1222619 false))

(declare-fun b!1222620 () Bool)

(declare-fun res!812354 () Bool)

(declare-fun e!694348 () Bool)

(assert (=> b!1222620 (=> (not res!812354) (not e!694348))))

(assert (=> b!1222620 (= res!812354 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38593 _keys!1208))))))

(declare-fun b!1222621 () Bool)

(declare-fun e!694346 () Bool)

(assert (=> b!1222621 (= e!694346 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222622 () Bool)

(declare-fun e!694345 () Bool)

(assert (=> b!1222622 (= e!694345 (bvslt from!1455 (size!38593 _keys!1208)))))

(assert (=> b!1222622 (not (= (select (arr!38055 _keys!1208) from!1455) k0!934))))

(declare-fun lt!556189 () Unit!40345)

(assert (=> b!1222622 (= lt!556189 e!694340)))

(declare-fun c!120317 () Bool)

(assert (=> b!1222622 (= c!120317 (= (select (arr!38055 _keys!1208) from!1455) k0!934))))

(declare-fun e!694342 () Bool)

(assert (=> b!1222622 e!694342))

(declare-fun res!812359 () Bool)

(assert (=> b!1222622 (=> (not res!812359) (not e!694342))))

(declare-datatypes ((V!46561 0))(
  ( (V!46562 (val!15594 Int)) )
))
(declare-datatypes ((tuple2!20168 0))(
  ( (tuple2!20169 (_1!10095 (_ BitVec 64)) (_2!10095 V!46561)) )
))
(declare-datatypes ((List!26948 0))(
  ( (Nil!26945) (Cons!26944 (h!28153 tuple2!20168) (t!40290 List!26948)) )
))
(declare-datatypes ((ListLongMap!18137 0))(
  ( (ListLongMap!18138 (toList!9084 List!26948)) )
))
(declare-fun lt!556193 () ListLongMap!18137)

(declare-fun lt!556197 () V!46561)

(declare-datatypes ((ValueCell!14828 0))(
  ( (ValueCellFull!14828 (v!18254 V!46561)) (EmptyCell!14828) )
))
(declare-datatypes ((array!78856 0))(
  ( (array!78857 (arr!38056 (Array (_ BitVec 32) ValueCell!14828)) (size!38594 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78856)

(declare-fun lt!556185 () ListLongMap!18137)

(declare-fun +!4146 (ListLongMap!18137 tuple2!20168) ListLongMap!18137)

(declare-fun get!19443 (ValueCell!14828 V!46561) V!46561)

(assert (=> b!1222622 (= res!812359 (= lt!556193 (+!4146 lt!556185 (tuple2!20169 (select (arr!38055 _keys!1208) from!1455) (get!19443 (select (arr!38056 _values!996) from!1455) lt!556197)))))))

(declare-fun mapIsEmpty!48508 () Bool)

(declare-fun mapRes!48508 () Bool)

(assert (=> mapIsEmpty!48508 mapRes!48508))

(declare-fun b!1222624 () Bool)

(declare-fun e!694349 () Bool)

(declare-fun e!694339 () Bool)

(assert (=> b!1222624 (= e!694349 (not e!694339))))

(declare-fun res!812352 () Bool)

(assert (=> b!1222624 (=> res!812352 e!694339)))

(assert (=> b!1222624 (= res!812352 (bvsgt from!1455 i!673))))

(assert (=> b!1222624 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556195 () Unit!40345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78854 (_ BitVec 64) (_ BitVec 32)) Unit!40345)

(assert (=> b!1222624 (= lt!556195 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222625 () Bool)

(declare-fun e!694343 () Bool)

(declare-fun tp_is_empty!31075 () Bool)

(assert (=> b!1222625 (= e!694343 tp_is_empty!31075)))

(declare-fun b!1222626 () Bool)

(declare-fun e!694341 () Bool)

(assert (=> b!1222626 (= e!694339 e!694341)))

(declare-fun res!812348 () Bool)

(assert (=> b!1222626 (=> res!812348 e!694341)))

(assert (=> b!1222626 (= res!812348 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!556190 () array!78854)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46561)

(declare-fun zeroValue!944 () V!46561)

(declare-fun lt!556194 () array!78856)

(declare-fun getCurrentListMapNoExtraKeys!5518 (array!78854 array!78856 (_ BitVec 32) (_ BitVec 32) V!46561 V!46561 (_ BitVec 32) Int) ListLongMap!18137)

(assert (=> b!1222626 (= lt!556193 (getCurrentListMapNoExtraKeys!5518 lt!556190 lt!556194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222626 (= lt!556194 (array!78857 (store (arr!38056 _values!996) i!673 (ValueCellFull!14828 lt!556197)) (size!38594 _values!996)))))

(declare-fun dynLambda!3366 (Int (_ BitVec 64)) V!46561)

(assert (=> b!1222626 (= lt!556197 (dynLambda!3366 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556188 () ListLongMap!18137)

(assert (=> b!1222626 (= lt!556188 (getCurrentListMapNoExtraKeys!5518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222627 () Bool)

(assert (=> b!1222627 (= e!694348 e!694349)))

(declare-fun res!812360 () Bool)

(assert (=> b!1222627 (=> (not res!812360) (not e!694349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78854 (_ BitVec 32)) Bool)

(assert (=> b!1222627 (= res!812360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556190 mask!1564))))

(assert (=> b!1222627 (= lt!556190 (array!78855 (store (arr!38055 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38593 _keys!1208)))))

(declare-fun b!1222628 () Bool)

(declare-fun res!812350 () Bool)

(assert (=> b!1222628 (=> (not res!812350) (not e!694348))))

(assert (=> b!1222628 (= res!812350 (= (select (arr!38055 _keys!1208) i!673) k0!934))))

(declare-fun b!1222629 () Bool)

(declare-fun res!812356 () Bool)

(assert (=> b!1222629 (=> (not res!812356) (not e!694348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222629 (= res!812356 (validMask!0 mask!1564))))

(declare-fun b!1222630 () Bool)

(declare-fun res!812349 () Bool)

(assert (=> b!1222630 (=> (not res!812349) (not e!694348))))

(assert (=> b!1222630 (= res!812349 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26944))))

(declare-fun b!1222631 () Bool)

(declare-fun res!812361 () Bool)

(assert (=> b!1222631 (=> (not res!812361) (not e!694349))))

(assert (=> b!1222631 (= res!812361 (arrayNoDuplicates!0 lt!556190 #b00000000000000000000000000000000 Nil!26944))))

(declare-fun b!1222632 () Bool)

(declare-fun res!812357 () Bool)

(assert (=> b!1222632 (=> (not res!812357) (not e!694348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222632 (= res!812357 (validKeyInArray!0 k0!934))))

(declare-fun b!1222633 () Bool)

(assert (=> b!1222633 (= e!694341 e!694345)))

(declare-fun res!812351 () Bool)

(assert (=> b!1222633 (=> res!812351 e!694345)))

(assert (=> b!1222633 (= res!812351 (not (validKeyInArray!0 (select (arr!38055 _keys!1208) from!1455))))))

(declare-fun lt!556192 () ListLongMap!18137)

(assert (=> b!1222633 (= lt!556192 lt!556185)))

(declare-fun lt!556184 () ListLongMap!18137)

(declare-fun -!1909 (ListLongMap!18137 (_ BitVec 64)) ListLongMap!18137)

(assert (=> b!1222633 (= lt!556185 (-!1909 lt!556184 k0!934))))

(assert (=> b!1222633 (= lt!556192 (getCurrentListMapNoExtraKeys!5518 lt!556190 lt!556194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222633 (= lt!556184 (getCurrentListMapNoExtraKeys!5518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556191 () Unit!40345)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1144 (array!78854 array!78856 (_ BitVec 32) (_ BitVec 32) V!46561 V!46561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40345)

(assert (=> b!1222633 (= lt!556191 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222634 () Bool)

(declare-fun res!812355 () Bool)

(assert (=> b!1222634 (=> (not res!812355) (not e!694348))))

(assert (=> b!1222634 (= res!812355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222635 () Bool)

(declare-fun e!694347 () Bool)

(assert (=> b!1222635 (= e!694347 (and e!694343 mapRes!48508))))

(declare-fun condMapEmpty!48508 () Bool)

(declare-fun mapDefault!48508 () ValueCell!14828)

(assert (=> b!1222635 (= condMapEmpty!48508 (= (arr!38056 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14828)) mapDefault!48508)))))

(declare-fun b!1222623 () Bool)

(declare-fun res!812362 () Bool)

(assert (=> b!1222623 (=> (not res!812362) (not e!694348))))

(assert (=> b!1222623 (= res!812362 (and (= (size!38594 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38593 _keys!1208) (size!38594 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!812353 () Bool)

(assert (=> start!101644 (=> (not res!812353) (not e!694348))))

(assert (=> start!101644 (= res!812353 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38593 _keys!1208))))))

(assert (=> start!101644 e!694348))

(assert (=> start!101644 tp_is_empty!31075))

(declare-fun array_inv!29082 (array!78854) Bool)

(assert (=> start!101644 (array_inv!29082 _keys!1208)))

(assert (=> start!101644 true))

(assert (=> start!101644 tp!92155))

(declare-fun array_inv!29083 (array!78856) Bool)

(assert (=> start!101644 (and (array_inv!29083 _values!996) e!694347)))

(declare-fun b!1222636 () Bool)

(declare-fun e!694344 () Bool)

(assert (=> b!1222636 (= e!694344 tp_is_empty!31075)))

(declare-fun b!1222637 () Bool)

(declare-fun Unit!40348 () Unit!40345)

(assert (=> b!1222637 (= e!694340 Unit!40348)))

(declare-fun mapNonEmpty!48508 () Bool)

(declare-fun tp!92156 () Bool)

(assert (=> mapNonEmpty!48508 (= mapRes!48508 (and tp!92156 e!694344))))

(declare-fun mapRest!48508 () (Array (_ BitVec 32) ValueCell!14828))

(declare-fun mapKey!48508 () (_ BitVec 32))

(declare-fun mapValue!48508 () ValueCell!14828)

(assert (=> mapNonEmpty!48508 (= (arr!38056 _values!996) (store mapRest!48508 mapKey!48508 mapValue!48508))))

(declare-fun b!1222638 () Bool)

(assert (=> b!1222638 (= e!694342 e!694346)))

(declare-fun res!812358 () Bool)

(assert (=> b!1222638 (=> res!812358 e!694346)))

(assert (=> b!1222638 (= res!812358 (not (= (select (arr!38055 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!101644 res!812353) b!1222629))

(assert (= (and b!1222629 res!812356) b!1222623))

(assert (= (and b!1222623 res!812362) b!1222634))

(assert (= (and b!1222634 res!812355) b!1222630))

(assert (= (and b!1222630 res!812349) b!1222620))

(assert (= (and b!1222620 res!812354) b!1222632))

(assert (= (and b!1222632 res!812357) b!1222628))

(assert (= (and b!1222628 res!812350) b!1222627))

(assert (= (and b!1222627 res!812360) b!1222631))

(assert (= (and b!1222631 res!812361) b!1222624))

(assert (= (and b!1222624 (not res!812352)) b!1222626))

(assert (= (and b!1222626 (not res!812348)) b!1222633))

(assert (= (and b!1222633 (not res!812351)) b!1222622))

(assert (= (and b!1222622 res!812359) b!1222638))

(assert (= (and b!1222638 (not res!812358)) b!1222621))

(assert (= (and b!1222622 c!120317) b!1222619))

(assert (= (and b!1222622 (not c!120317)) b!1222637))

(assert (= (and b!1222635 condMapEmpty!48508) mapIsEmpty!48508))

(assert (= (and b!1222635 (not condMapEmpty!48508)) mapNonEmpty!48508))

(get-info :version)

(assert (= (and mapNonEmpty!48508 ((_ is ValueCellFull!14828) mapValue!48508)) b!1222636))

(assert (= (and b!1222635 ((_ is ValueCellFull!14828) mapDefault!48508)) b!1222625))

(assert (= start!101644 b!1222635))

(declare-fun b_lambda!22303 () Bool)

(assert (=> (not b_lambda!22303) (not b!1222626)))

(declare-fun t!40288 () Bool)

(declare-fun tb!11163 () Bool)

(assert (=> (and start!101644 (= defaultEntry!1004 defaultEntry!1004) t!40288) tb!11163))

(declare-fun result!22945 () Bool)

(assert (=> tb!11163 (= result!22945 tp_is_empty!31075)))

(assert (=> b!1222626 t!40288))

(declare-fun b_and!43969 () Bool)

(assert (= b_and!43967 (and (=> t!40288 result!22945) b_and!43969)))

(declare-fun m!1127105 () Bool)

(assert (=> b!1222626 m!1127105))

(declare-fun m!1127107 () Bool)

(assert (=> b!1222626 m!1127107))

(declare-fun m!1127109 () Bool)

(assert (=> b!1222626 m!1127109))

(declare-fun m!1127111 () Bool)

(assert (=> b!1222626 m!1127111))

(declare-fun m!1127113 () Bool)

(assert (=> mapNonEmpty!48508 m!1127113))

(declare-fun m!1127115 () Bool)

(assert (=> start!101644 m!1127115))

(declare-fun m!1127117 () Bool)

(assert (=> start!101644 m!1127117))

(declare-fun m!1127119 () Bool)

(assert (=> b!1222628 m!1127119))

(declare-fun m!1127121 () Bool)

(assert (=> b!1222629 m!1127121))

(declare-fun m!1127123 () Bool)

(assert (=> b!1222627 m!1127123))

(declare-fun m!1127125 () Bool)

(assert (=> b!1222627 m!1127125))

(declare-fun m!1127127 () Bool)

(assert (=> b!1222631 m!1127127))

(declare-fun m!1127129 () Bool)

(assert (=> b!1222630 m!1127129))

(declare-fun m!1127131 () Bool)

(assert (=> b!1222632 m!1127131))

(declare-fun m!1127133 () Bool)

(assert (=> b!1222634 m!1127133))

(declare-fun m!1127135 () Bool)

(assert (=> b!1222621 m!1127135))

(declare-fun m!1127137 () Bool)

(assert (=> b!1222622 m!1127137))

(declare-fun m!1127139 () Bool)

(assert (=> b!1222622 m!1127139))

(assert (=> b!1222622 m!1127139))

(declare-fun m!1127141 () Bool)

(assert (=> b!1222622 m!1127141))

(declare-fun m!1127143 () Bool)

(assert (=> b!1222622 m!1127143))

(declare-fun m!1127145 () Bool)

(assert (=> b!1222624 m!1127145))

(declare-fun m!1127147 () Bool)

(assert (=> b!1222624 m!1127147))

(declare-fun m!1127149 () Bool)

(assert (=> b!1222633 m!1127149))

(declare-fun m!1127151 () Bool)

(assert (=> b!1222633 m!1127151))

(declare-fun m!1127153 () Bool)

(assert (=> b!1222633 m!1127153))

(declare-fun m!1127155 () Bool)

(assert (=> b!1222633 m!1127155))

(assert (=> b!1222633 m!1127137))

(declare-fun m!1127157 () Bool)

(assert (=> b!1222633 m!1127157))

(assert (=> b!1222633 m!1127137))

(declare-fun m!1127159 () Bool)

(assert (=> b!1222619 m!1127159))

(declare-fun m!1127161 () Bool)

(assert (=> b!1222619 m!1127161))

(declare-fun m!1127163 () Bool)

(assert (=> b!1222619 m!1127163))

(declare-fun m!1127165 () Bool)

(assert (=> b!1222619 m!1127165))

(declare-fun m!1127167 () Bool)

(assert (=> b!1222619 m!1127167))

(assert (=> b!1222638 m!1127137))

(check-sat (not start!101644) (not b!1222632) (not b!1222626) (not b!1222631) tp_is_empty!31075 (not b!1222630) (not b!1222619) (not b!1222634) b_and!43969 (not mapNonEmpty!48508) (not b!1222627) (not b!1222622) (not b!1222629) (not b!1222621) (not b!1222624) (not b!1222633) (not b_next!26371) (not b_lambda!22303))
(check-sat b_and!43969 (not b_next!26371))
