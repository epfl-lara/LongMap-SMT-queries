; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101318 () Bool)

(assert start!101318)

(declare-fun b_free!26221 () Bool)

(declare-fun b_next!26221 () Bool)

(assert (=> start!101318 (= b_free!26221 (not b_next!26221))))

(declare-fun tp!91688 () Bool)

(declare-fun b_and!43559 () Bool)

(assert (=> start!101318 (= tp!91688 b_and!43559)))

(declare-fun b!1217264 () Bool)

(declare-fun res!808369 () Bool)

(declare-fun e!691079 () Bool)

(assert (=> b!1217264 (=> (not res!808369) (not e!691079))))

(declare-datatypes ((array!78544 0))(
  ( (array!78545 (arr!37906 (Array (_ BitVec 32) (_ BitVec 64))) (size!38444 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78544)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78544 (_ BitVec 32)) Bool)

(assert (=> b!1217264 (= res!808369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217265 () Bool)

(declare-fun res!808371 () Bool)

(assert (=> b!1217265 (=> (not res!808371) (not e!691079))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1217265 (= res!808371 (= (select (arr!37906 _keys!1208) i!673) k0!934))))

(declare-fun b!1217266 () Bool)

(declare-fun res!808379 () Bool)

(assert (=> b!1217266 (=> (not res!808379) (not e!691079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217266 (= res!808379 (validMask!0 mask!1564))))

(declare-fun b!1217267 () Bool)

(declare-fun res!808377 () Bool)

(assert (=> b!1217267 (=> (not res!808377) (not e!691079))))

(assert (=> b!1217267 (= res!808377 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38444 _keys!1208))))))

(declare-fun b!1217268 () Bool)

(declare-fun res!808370 () Bool)

(assert (=> b!1217268 (=> (not res!808370) (not e!691079))))

(declare-datatypes ((List!26824 0))(
  ( (Nil!26821) (Cons!26820 (h!28029 (_ BitVec 64)) (t!40016 List!26824)) )
))
(declare-fun arrayNoDuplicates!0 (array!78544 (_ BitVec 32) List!26824) Bool)

(assert (=> b!1217268 (= res!808370 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26821))))

(declare-fun res!808374 () Bool)

(assert (=> start!101318 (=> (not res!808374) (not e!691079))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101318 (= res!808374 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38444 _keys!1208))))))

(assert (=> start!101318 e!691079))

(declare-fun tp_is_empty!30925 () Bool)

(assert (=> start!101318 tp_is_empty!30925))

(declare-fun array_inv!28976 (array!78544) Bool)

(assert (=> start!101318 (array_inv!28976 _keys!1208)))

(assert (=> start!101318 true))

(assert (=> start!101318 tp!91688))

(declare-datatypes ((V!46361 0))(
  ( (V!46362 (val!15519 Int)) )
))
(declare-datatypes ((ValueCell!14753 0))(
  ( (ValueCellFull!14753 (v!18172 V!46361)) (EmptyCell!14753) )
))
(declare-datatypes ((array!78546 0))(
  ( (array!78547 (arr!37907 (Array (_ BitVec 32) ValueCell!14753)) (size!38445 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78546)

(declare-fun e!691071 () Bool)

(declare-fun array_inv!28977 (array!78546) Bool)

(assert (=> start!101318 (and (array_inv!28977 _values!996) e!691071)))

(declare-fun b!1217269 () Bool)

(declare-fun res!808372 () Bool)

(declare-fun e!691075 () Bool)

(assert (=> b!1217269 (=> (not res!808372) (not e!691075))))

(declare-fun lt!553130 () array!78544)

(assert (=> b!1217269 (= res!808372 (arrayNoDuplicates!0 lt!553130 #b00000000000000000000000000000000 Nil!26821))))

(declare-fun b!1217270 () Bool)

(assert (=> b!1217270 (= e!691079 e!691075)))

(declare-fun res!808378 () Bool)

(assert (=> b!1217270 (=> (not res!808378) (not e!691075))))

(assert (=> b!1217270 (= res!808378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553130 mask!1564))))

(assert (=> b!1217270 (= lt!553130 (array!78545 (store (arr!37906 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38444 _keys!1208)))))

(declare-fun b!1217271 () Bool)

(declare-fun e!691076 () Bool)

(declare-fun e!691074 () Bool)

(assert (=> b!1217271 (= e!691076 e!691074)))

(declare-fun res!808375 () Bool)

(assert (=> b!1217271 (=> res!808375 e!691074)))

(assert (=> b!1217271 (= res!808375 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46361)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20046 0))(
  ( (tuple2!20047 (_1!10034 (_ BitVec 64)) (_2!10034 V!46361)) )
))
(declare-datatypes ((List!26825 0))(
  ( (Nil!26822) (Cons!26821 (h!28030 tuple2!20046) (t!40017 List!26825)) )
))
(declare-datatypes ((ListLongMap!18015 0))(
  ( (ListLongMap!18016 (toList!9023 List!26825)) )
))
(declare-fun lt!553131 () ListLongMap!18015)

(declare-fun lt!553132 () array!78546)

(declare-fun minValue!944 () V!46361)

(declare-fun getCurrentListMapNoExtraKeys!5462 (array!78544 array!78546 (_ BitVec 32) (_ BitVec 32) V!46361 V!46361 (_ BitVec 32) Int) ListLongMap!18015)

(assert (=> b!1217271 (= lt!553131 (getCurrentListMapNoExtraKeys!5462 lt!553130 lt!553132 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553134 () V!46361)

(assert (=> b!1217271 (= lt!553132 (array!78547 (store (arr!37907 _values!996) i!673 (ValueCellFull!14753 lt!553134)) (size!38445 _values!996)))))

(declare-fun dynLambda!3313 (Int (_ BitVec 64)) V!46361)

(assert (=> b!1217271 (= lt!553134 (dynLambda!3313 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553129 () ListLongMap!18015)

(assert (=> b!1217271 (= lt!553129 (getCurrentListMapNoExtraKeys!5462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217272 () Bool)

(declare-fun e!691072 () Bool)

(declare-fun mapRes!48265 () Bool)

(assert (=> b!1217272 (= e!691071 (and e!691072 mapRes!48265))))

(declare-fun condMapEmpty!48265 () Bool)

(declare-fun mapDefault!48265 () ValueCell!14753)

(assert (=> b!1217272 (= condMapEmpty!48265 (= (arr!37907 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14753)) mapDefault!48265)))))

(declare-fun b!1217273 () Bool)

(declare-fun res!808368 () Bool)

(assert (=> b!1217273 (=> (not res!808368) (not e!691079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217273 (= res!808368 (validKeyInArray!0 k0!934))))

(declare-fun b!1217274 () Bool)

(declare-fun e!691077 () Bool)

(assert (=> b!1217274 (= e!691077 (bvslt from!1455 (size!38444 _keys!1208)))))

(declare-fun lt!553136 () ListLongMap!18015)

(declare-fun +!4093 (ListLongMap!18015 tuple2!20046) ListLongMap!18015)

(declare-fun get!19328 (ValueCell!14753 V!46361) V!46361)

(assert (=> b!1217274 (= lt!553131 (+!4093 lt!553136 (tuple2!20047 (select (arr!37906 _keys!1208) from!1455) (get!19328 (select (arr!37907 _values!996) from!1455) lt!553134))))))

(declare-fun b!1217275 () Bool)

(declare-fun res!808380 () Bool)

(assert (=> b!1217275 (=> (not res!808380) (not e!691079))))

(assert (=> b!1217275 (= res!808380 (and (= (size!38445 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38444 _keys!1208) (size!38445 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217276 () Bool)

(assert (=> b!1217276 (= e!691072 tp_is_empty!30925)))

(declare-fun b!1217277 () Bool)

(assert (=> b!1217277 (= e!691075 (not e!691076))))

(declare-fun res!808376 () Bool)

(assert (=> b!1217277 (=> res!808376 e!691076)))

(assert (=> b!1217277 (= res!808376 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217277 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40217 0))(
  ( (Unit!40218) )
))
(declare-fun lt!553133 () Unit!40217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78544 (_ BitVec 64) (_ BitVec 32)) Unit!40217)

(assert (=> b!1217277 (= lt!553133 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217278 () Bool)

(declare-fun e!691078 () Bool)

(assert (=> b!1217278 (= e!691078 tp_is_empty!30925)))

(declare-fun b!1217279 () Bool)

(assert (=> b!1217279 (= e!691074 e!691077)))

(declare-fun res!808373 () Bool)

(assert (=> b!1217279 (=> res!808373 e!691077)))

(assert (=> b!1217279 (= res!808373 (not (validKeyInArray!0 (select (arr!37906 _keys!1208) from!1455))))))

(declare-fun lt!553127 () ListLongMap!18015)

(assert (=> b!1217279 (= lt!553127 lt!553136)))

(declare-fun lt!553128 () ListLongMap!18015)

(declare-fun -!1860 (ListLongMap!18015 (_ BitVec 64)) ListLongMap!18015)

(assert (=> b!1217279 (= lt!553136 (-!1860 lt!553128 k0!934))))

(assert (=> b!1217279 (= lt!553127 (getCurrentListMapNoExtraKeys!5462 lt!553130 lt!553132 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217279 (= lt!553128 (getCurrentListMapNoExtraKeys!5462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553135 () Unit!40217)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1095 (array!78544 array!78546 (_ BitVec 32) (_ BitVec 32) V!46361 V!46361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40217)

(assert (=> b!1217279 (= lt!553135 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48265 () Bool)

(assert (=> mapIsEmpty!48265 mapRes!48265))

(declare-fun mapNonEmpty!48265 () Bool)

(declare-fun tp!91687 () Bool)

(assert (=> mapNonEmpty!48265 (= mapRes!48265 (and tp!91687 e!691078))))

(declare-fun mapRest!48265 () (Array (_ BitVec 32) ValueCell!14753))

(declare-fun mapValue!48265 () ValueCell!14753)

(declare-fun mapKey!48265 () (_ BitVec 32))

(assert (=> mapNonEmpty!48265 (= (arr!37907 _values!996) (store mapRest!48265 mapKey!48265 mapValue!48265))))

(assert (= (and start!101318 res!808374) b!1217266))

(assert (= (and b!1217266 res!808379) b!1217275))

(assert (= (and b!1217275 res!808380) b!1217264))

(assert (= (and b!1217264 res!808369) b!1217268))

(assert (= (and b!1217268 res!808370) b!1217267))

(assert (= (and b!1217267 res!808377) b!1217273))

(assert (= (and b!1217273 res!808368) b!1217265))

(assert (= (and b!1217265 res!808371) b!1217270))

(assert (= (and b!1217270 res!808378) b!1217269))

(assert (= (and b!1217269 res!808372) b!1217277))

(assert (= (and b!1217277 (not res!808376)) b!1217271))

(assert (= (and b!1217271 (not res!808375)) b!1217279))

(assert (= (and b!1217279 (not res!808373)) b!1217274))

(assert (= (and b!1217272 condMapEmpty!48265) mapIsEmpty!48265))

(assert (= (and b!1217272 (not condMapEmpty!48265)) mapNonEmpty!48265))

(get-info :version)

(assert (= (and mapNonEmpty!48265 ((_ is ValueCellFull!14753) mapValue!48265)) b!1217278))

(assert (= (and b!1217272 ((_ is ValueCellFull!14753) mapDefault!48265)) b!1217276))

(assert (= start!101318 b!1217272))

(declare-fun b_lambda!21925 () Bool)

(assert (=> (not b_lambda!21925) (not b!1217271)))

(declare-fun t!40015 () Bool)

(declare-fun tb!11013 () Bool)

(assert (=> (and start!101318 (= defaultEntry!1004 defaultEntry!1004) t!40015) tb!11013))

(declare-fun result!22633 () Bool)

(assert (=> tb!11013 (= result!22633 tp_is_empty!30925)))

(assert (=> b!1217271 t!40015))

(declare-fun b_and!43561 () Bool)

(assert (= b_and!43559 (and (=> t!40015 result!22633) b_and!43561)))

(declare-fun m!1121539 () Bool)

(assert (=> b!1217279 m!1121539))

(declare-fun m!1121541 () Bool)

(assert (=> b!1217279 m!1121541))

(declare-fun m!1121543 () Bool)

(assert (=> b!1217279 m!1121543))

(declare-fun m!1121545 () Bool)

(assert (=> b!1217279 m!1121545))

(declare-fun m!1121547 () Bool)

(assert (=> b!1217279 m!1121547))

(declare-fun m!1121549 () Bool)

(assert (=> b!1217279 m!1121549))

(assert (=> b!1217279 m!1121547))

(declare-fun m!1121551 () Bool)

(assert (=> mapNonEmpty!48265 m!1121551))

(declare-fun m!1121553 () Bool)

(assert (=> b!1217270 m!1121553))

(declare-fun m!1121555 () Bool)

(assert (=> b!1217270 m!1121555))

(declare-fun m!1121557 () Bool)

(assert (=> b!1217273 m!1121557))

(declare-fun m!1121559 () Bool)

(assert (=> b!1217264 m!1121559))

(declare-fun m!1121561 () Bool)

(assert (=> b!1217265 m!1121561))

(declare-fun m!1121563 () Bool)

(assert (=> b!1217277 m!1121563))

(declare-fun m!1121565 () Bool)

(assert (=> b!1217277 m!1121565))

(declare-fun m!1121567 () Bool)

(assert (=> start!101318 m!1121567))

(declare-fun m!1121569 () Bool)

(assert (=> start!101318 m!1121569))

(declare-fun m!1121571 () Bool)

(assert (=> b!1217271 m!1121571))

(declare-fun m!1121573 () Bool)

(assert (=> b!1217271 m!1121573))

(declare-fun m!1121575 () Bool)

(assert (=> b!1217271 m!1121575))

(declare-fun m!1121577 () Bool)

(assert (=> b!1217271 m!1121577))

(declare-fun m!1121579 () Bool)

(assert (=> b!1217268 m!1121579))

(declare-fun m!1121581 () Bool)

(assert (=> b!1217266 m!1121581))

(assert (=> b!1217274 m!1121547))

(declare-fun m!1121583 () Bool)

(assert (=> b!1217274 m!1121583))

(assert (=> b!1217274 m!1121583))

(declare-fun m!1121585 () Bool)

(assert (=> b!1217274 m!1121585))

(declare-fun m!1121587 () Bool)

(assert (=> b!1217274 m!1121587))

(declare-fun m!1121589 () Bool)

(assert (=> b!1217269 m!1121589))

(check-sat (not b_lambda!21925) (not b!1217274) (not b_next!26221) (not b!1217271) (not b!1217277) (not b!1217264) (not mapNonEmpty!48265) (not b!1217270) b_and!43561 (not b!1217268) (not b!1217266) (not b!1217269) (not b!1217273) (not start!101318) tp_is_empty!30925 (not b!1217279))
(check-sat b_and!43561 (not b_next!26221))
