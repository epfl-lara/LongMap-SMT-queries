; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101380 () Bool)

(assert start!101380)

(declare-fun b_free!26257 () Bool)

(declare-fun b_next!26257 () Bool)

(assert (=> start!101380 (= b_free!26257 (not b_next!26257))))

(declare-fun tp!91799 () Bool)

(declare-fun b_and!43649 () Bool)

(assert (=> start!101380 (= tp!91799 b_and!43649)))

(declare-fun b!1218394 () Bool)

(declare-fun res!809217 () Bool)

(declare-fun e!691746 () Bool)

(assert (=> b!1218394 (=> (not res!809217) (not e!691746))))

(declare-datatypes ((array!78616 0))(
  ( (array!78617 (arr!37941 (Array (_ BitVec 32) (_ BitVec 64))) (size!38479 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78616)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78616 (_ BitVec 32)) Bool)

(assert (=> b!1218394 (= res!809217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218395 () Bool)

(declare-fun e!691740 () Bool)

(declare-fun e!691747 () Bool)

(declare-fun mapRes!48322 () Bool)

(assert (=> b!1218395 (= e!691740 (and e!691747 mapRes!48322))))

(declare-fun condMapEmpty!48322 () Bool)

(declare-datatypes ((V!46409 0))(
  ( (V!46410 (val!15537 Int)) )
))
(declare-datatypes ((ValueCell!14771 0))(
  ( (ValueCellFull!14771 (v!18191 V!46409)) (EmptyCell!14771) )
))
(declare-datatypes ((array!78618 0))(
  ( (array!78619 (arr!37942 (Array (_ BitVec 32) ValueCell!14771)) (size!38480 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78618)

(declare-fun mapDefault!48322 () ValueCell!14771)

(assert (=> b!1218395 (= condMapEmpty!48322 (= (arr!37942 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14771)) mapDefault!48322)))))

(declare-fun b!1218396 () Bool)

(declare-fun res!809228 () Bool)

(assert (=> b!1218396 (=> (not res!809228) (not e!691746))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1218396 (= res!809228 (and (= (size!38480 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38479 _keys!1208) (size!38480 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218397 () Bool)

(declare-fun e!691742 () Bool)

(assert (=> b!1218397 (= e!691746 e!691742)))

(declare-fun res!809218 () Bool)

(assert (=> b!1218397 (=> (not res!809218) (not e!691742))))

(declare-fun lt!553747 () array!78616)

(assert (=> b!1218397 (= res!809218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553747 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218397 (= lt!553747 (array!78617 (store (arr!37941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38479 _keys!1208)))))

(declare-fun b!1218398 () Bool)

(declare-fun tp_is_empty!30961 () Bool)

(assert (=> b!1218398 (= e!691747 tp_is_empty!30961)))

(declare-fun mapIsEmpty!48322 () Bool)

(assert (=> mapIsEmpty!48322 mapRes!48322))

(declare-fun b!1218399 () Bool)

(declare-fun res!809216 () Bool)

(assert (=> b!1218399 (=> (not res!809216) (not e!691742))))

(declare-datatypes ((List!26850 0))(
  ( (Nil!26847) (Cons!26846 (h!28055 (_ BitVec 64)) (t!40078 List!26850)) )
))
(declare-fun arrayNoDuplicates!0 (array!78616 (_ BitVec 32) List!26850) Bool)

(assert (=> b!1218399 (= res!809216 (arrayNoDuplicates!0 lt!553747 #b00000000000000000000000000000000 Nil!26847))))

(declare-fun mapNonEmpty!48322 () Bool)

(declare-fun tp!91798 () Bool)

(declare-fun e!691738 () Bool)

(assert (=> mapNonEmpty!48322 (= mapRes!48322 (and tp!91798 e!691738))))

(declare-fun mapValue!48322 () ValueCell!14771)

(declare-fun mapKey!48322 () (_ BitVec 32))

(declare-fun mapRest!48322 () (Array (_ BitVec 32) ValueCell!14771))

(assert (=> mapNonEmpty!48322 (= (arr!37942 _values!996) (store mapRest!48322 mapKey!48322 mapValue!48322))))

(declare-fun b!1218400 () Bool)

(assert (=> b!1218400 (= e!691738 tp_is_empty!30961)))

(declare-fun e!691745 () Bool)

(declare-fun b!1218401 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218401 (= e!691745 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218402 () Bool)

(declare-fun res!809224 () Bool)

(assert (=> b!1218402 (=> (not res!809224) (not e!691746))))

(assert (=> b!1218402 (= res!809224 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38479 _keys!1208))))))

(declare-fun b!1218403 () Bool)

(declare-fun e!691744 () Bool)

(declare-fun e!691739 () Bool)

(assert (=> b!1218403 (= e!691744 e!691739)))

(declare-fun res!809227 () Bool)

(assert (=> b!1218403 (=> res!809227 e!691739)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218403 (= res!809227 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46409)

(declare-fun lt!553743 () array!78618)

(declare-datatypes ((tuple2!20070 0))(
  ( (tuple2!20071 (_1!10046 (_ BitVec 64)) (_2!10046 V!46409)) )
))
(declare-datatypes ((List!26851 0))(
  ( (Nil!26848) (Cons!26847 (h!28056 tuple2!20070) (t!40079 List!26851)) )
))
(declare-datatypes ((ListLongMap!18039 0))(
  ( (ListLongMap!18040 (toList!9035 List!26851)) )
))
(declare-fun lt!553751 () ListLongMap!18039)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46409)

(declare-fun getCurrentListMapNoExtraKeys!5474 (array!78616 array!78618 (_ BitVec 32) (_ BitVec 32) V!46409 V!46409 (_ BitVec 32) Int) ListLongMap!18039)

(assert (=> b!1218403 (= lt!553751 (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553745 () V!46409)

(assert (=> b!1218403 (= lt!553743 (array!78619 (store (arr!37942 _values!996) i!673 (ValueCellFull!14771 lt!553745)) (size!38480 _values!996)))))

(declare-fun dynLambda!3325 (Int (_ BitVec 64)) V!46409)

(assert (=> b!1218403 (= lt!553745 (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553748 () ListLongMap!18039)

(assert (=> b!1218403 (= lt!553748 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!809220 () Bool)

(assert (=> start!101380 (=> (not res!809220) (not e!691746))))

(assert (=> start!101380 (= res!809220 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38479 _keys!1208))))))

(assert (=> start!101380 e!691746))

(assert (=> start!101380 tp_is_empty!30961))

(declare-fun array_inv!29000 (array!78616) Bool)

(assert (=> start!101380 (array_inv!29000 _keys!1208)))

(assert (=> start!101380 true))

(assert (=> start!101380 tp!91799))

(declare-fun array_inv!29001 (array!78618) Bool)

(assert (=> start!101380 (and (array_inv!29001 _values!996) e!691740)))

(declare-fun b!1218404 () Bool)

(declare-fun res!809221 () Bool)

(assert (=> b!1218404 (=> (not res!809221) (not e!691746))))

(assert (=> b!1218404 (= res!809221 (= (select (arr!37941 _keys!1208) i!673) k0!934))))

(declare-fun b!1218405 () Bool)

(declare-fun res!809229 () Bool)

(assert (=> b!1218405 (=> (not res!809229) (not e!691746))))

(assert (=> b!1218405 (= res!809229 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26847))))

(declare-fun b!1218406 () Bool)

(declare-fun e!691743 () Bool)

(assert (=> b!1218406 (= e!691739 e!691743)))

(declare-fun res!809222 () Bool)

(assert (=> b!1218406 (=> res!809222 e!691743)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218406 (= res!809222 (not (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455))))))

(declare-fun lt!553744 () ListLongMap!18039)

(declare-fun lt!553746 () ListLongMap!18039)

(assert (=> b!1218406 (= lt!553744 lt!553746)))

(declare-fun lt!553750 () ListLongMap!18039)

(declare-fun -!1868 (ListLongMap!18039 (_ BitVec 64)) ListLongMap!18039)

(assert (=> b!1218406 (= lt!553746 (-!1868 lt!553750 k0!934))))

(assert (=> b!1218406 (= lt!553744 (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218406 (= lt!553750 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40245 0))(
  ( (Unit!40246) )
))
(declare-fun lt!553749 () Unit!40245)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1103 (array!78616 array!78618 (_ BitVec 32) (_ BitVec 32) V!46409 V!46409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40245)

(assert (=> b!1218406 (= lt!553749 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218407 () Bool)

(declare-fun e!691748 () Bool)

(assert (=> b!1218407 (= e!691748 e!691745)))

(declare-fun res!809219 () Bool)

(assert (=> b!1218407 (=> res!809219 e!691745)))

(assert (=> b!1218407 (= res!809219 (not (= (select (arr!37941 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218408 () Bool)

(assert (=> b!1218408 (= e!691743 (or (not (= (select (arr!37941 _keys!1208) from!1455) k0!934)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (size!38479 _keys!1208) #b01111111111111111111111111111111)))))

(assert (=> b!1218408 e!691748))

(declare-fun res!809226 () Bool)

(assert (=> b!1218408 (=> (not res!809226) (not e!691748))))

(declare-fun +!4103 (ListLongMap!18039 tuple2!20070) ListLongMap!18039)

(declare-fun get!19352 (ValueCell!14771 V!46409) V!46409)

(assert (=> b!1218408 (= res!809226 (= lt!553751 (+!4103 lt!553746 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))))))

(declare-fun b!1218409 () Bool)

(assert (=> b!1218409 (= e!691742 (not e!691744))))

(declare-fun res!809225 () Bool)

(assert (=> b!1218409 (=> res!809225 e!691744)))

(assert (=> b!1218409 (= res!809225 (bvsgt from!1455 i!673))))

(assert (=> b!1218409 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553742 () Unit!40245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78616 (_ BitVec 64) (_ BitVec 32)) Unit!40245)

(assert (=> b!1218409 (= lt!553742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218410 () Bool)

(declare-fun res!809223 () Bool)

(assert (=> b!1218410 (=> (not res!809223) (not e!691746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218410 (= res!809223 (validMask!0 mask!1564))))

(declare-fun b!1218411 () Bool)

(declare-fun res!809230 () Bool)

(assert (=> b!1218411 (=> (not res!809230) (not e!691746))))

(assert (=> b!1218411 (= res!809230 (validKeyInArray!0 k0!934))))

(assert (= (and start!101380 res!809220) b!1218410))

(assert (= (and b!1218410 res!809223) b!1218396))

(assert (= (and b!1218396 res!809228) b!1218394))

(assert (= (and b!1218394 res!809217) b!1218405))

(assert (= (and b!1218405 res!809229) b!1218402))

(assert (= (and b!1218402 res!809224) b!1218411))

(assert (= (and b!1218411 res!809230) b!1218404))

(assert (= (and b!1218404 res!809221) b!1218397))

(assert (= (and b!1218397 res!809218) b!1218399))

(assert (= (and b!1218399 res!809216) b!1218409))

(assert (= (and b!1218409 (not res!809225)) b!1218403))

(assert (= (and b!1218403 (not res!809227)) b!1218406))

(assert (= (and b!1218406 (not res!809222)) b!1218408))

(assert (= (and b!1218408 res!809226) b!1218407))

(assert (= (and b!1218407 (not res!809219)) b!1218401))

(assert (= (and b!1218395 condMapEmpty!48322) mapIsEmpty!48322))

(assert (= (and b!1218395 (not condMapEmpty!48322)) mapNonEmpty!48322))

(get-info :version)

(assert (= (and mapNonEmpty!48322 ((_ is ValueCellFull!14771) mapValue!48322)) b!1218400))

(assert (= (and b!1218395 ((_ is ValueCellFull!14771) mapDefault!48322)) b!1218398))

(assert (= start!101380 b!1218395))

(declare-fun b_lambda!21999 () Bool)

(assert (=> (not b_lambda!21999) (not b!1218403)))

(declare-fun t!40077 () Bool)

(declare-fun tb!11049 () Bool)

(assert (=> (and start!101380 (= defaultEntry!1004 defaultEntry!1004) t!40077) tb!11049))

(declare-fun result!22707 () Bool)

(assert (=> tb!11049 (= result!22707 tp_is_empty!30961)))

(assert (=> b!1218403 t!40077))

(declare-fun b_and!43651 () Bool)

(assert (= b_and!43649 (and (=> t!40077 result!22707) b_and!43651)))

(declare-fun m!1122679 () Bool)

(assert (=> b!1218406 m!1122679))

(declare-fun m!1122681 () Bool)

(assert (=> b!1218406 m!1122681))

(declare-fun m!1122683 () Bool)

(assert (=> b!1218406 m!1122683))

(declare-fun m!1122685 () Bool)

(assert (=> b!1218406 m!1122685))

(assert (=> b!1218406 m!1122683))

(declare-fun m!1122687 () Bool)

(assert (=> b!1218406 m!1122687))

(declare-fun m!1122689 () Bool)

(assert (=> b!1218406 m!1122689))

(declare-fun m!1122691 () Bool)

(assert (=> b!1218411 m!1122691))

(declare-fun m!1122693 () Bool)

(assert (=> b!1218394 m!1122693))

(declare-fun m!1122695 () Bool)

(assert (=> start!101380 m!1122695))

(declare-fun m!1122697 () Bool)

(assert (=> start!101380 m!1122697))

(assert (=> b!1218407 m!1122683))

(declare-fun m!1122699 () Bool)

(assert (=> mapNonEmpty!48322 m!1122699))

(declare-fun m!1122701 () Bool)

(assert (=> b!1218405 m!1122701))

(declare-fun m!1122703 () Bool)

(assert (=> b!1218403 m!1122703))

(declare-fun m!1122705 () Bool)

(assert (=> b!1218403 m!1122705))

(declare-fun m!1122707 () Bool)

(assert (=> b!1218403 m!1122707))

(declare-fun m!1122709 () Bool)

(assert (=> b!1218403 m!1122709))

(declare-fun m!1122711 () Bool)

(assert (=> b!1218397 m!1122711))

(declare-fun m!1122713 () Bool)

(assert (=> b!1218397 m!1122713))

(declare-fun m!1122715 () Bool)

(assert (=> b!1218409 m!1122715))

(declare-fun m!1122717 () Bool)

(assert (=> b!1218409 m!1122717))

(declare-fun m!1122719 () Bool)

(assert (=> b!1218410 m!1122719))

(declare-fun m!1122721 () Bool)

(assert (=> b!1218399 m!1122721))

(declare-fun m!1122723 () Bool)

(assert (=> b!1218401 m!1122723))

(declare-fun m!1122725 () Bool)

(assert (=> b!1218404 m!1122725))

(assert (=> b!1218408 m!1122683))

(declare-fun m!1122727 () Bool)

(assert (=> b!1218408 m!1122727))

(assert (=> b!1218408 m!1122727))

(declare-fun m!1122729 () Bool)

(assert (=> b!1218408 m!1122729))

(declare-fun m!1122731 () Bool)

(assert (=> b!1218408 m!1122731))

(check-sat (not b!1218411) (not b!1218397) (not b_next!26257) (not b!1218410) (not b!1218408) tp_is_empty!30961 (not b!1218394) (not b!1218401) (not b!1218409) (not b!1218399) (not b!1218403) (not start!101380) (not mapNonEmpty!48322) (not b!1218406) b_and!43651 (not b_lambda!21999) (not b!1218405))
(check-sat b_and!43651 (not b_next!26257))
(get-model)

(declare-fun b_lambda!22005 () Bool)

(assert (= b_lambda!21999 (or (and start!101380 b_free!26257) b_lambda!22005)))

(check-sat (not b!1218411) (not b!1218397) (not b_next!26257) (not b!1218410) (not b!1218408) tp_is_empty!30961 (not b_lambda!22005) (not b!1218394) (not b!1218401) (not b!1218405) (not b!1218409) (not b!1218399) (not b!1218403) (not start!101380) (not mapNonEmpty!48322) (not b!1218406) b_and!43651)
(check-sat b_and!43651 (not b_next!26257))
(get-model)

(declare-fun d!133493 () Bool)

(declare-fun e!691817 () Bool)

(assert (=> d!133493 e!691817))

(declare-fun res!809325 () Bool)

(assert (=> d!133493 (=> (not res!809325) (not e!691817))))

(declare-fun lt!553822 () ListLongMap!18039)

(declare-fun contains!6986 (ListLongMap!18039 (_ BitVec 64)) Bool)

(assert (=> d!133493 (= res!809325 (contains!6986 lt!553822 (_1!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))))))

(declare-fun lt!553820 () List!26851)

(assert (=> d!133493 (= lt!553822 (ListLongMap!18040 lt!553820))))

(declare-fun lt!553821 () Unit!40245)

(declare-fun lt!553823 () Unit!40245)

(assert (=> d!133493 (= lt!553821 lt!553823)))

(declare-datatypes ((Option!696 0))(
  ( (Some!695 (v!18194 V!46409)) (None!694) )
))
(declare-fun getValueByKey!645 (List!26851 (_ BitVec 64)) Option!696)

(assert (=> d!133493 (= (getValueByKey!645 lt!553820 (_1!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))) (Some!695 (_2!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!321 (List!26851 (_ BitVec 64) V!46409) Unit!40245)

(assert (=> d!133493 (= lt!553823 (lemmaContainsTupThenGetReturnValue!321 lt!553820 (_1!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745))) (_2!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))))))

(declare-fun insertStrictlySorted!414 (List!26851 (_ BitVec 64) V!46409) List!26851)

(assert (=> d!133493 (= lt!553820 (insertStrictlySorted!414 (toList!9035 lt!553746) (_1!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745))) (_2!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))))))

(assert (=> d!133493 (= (+!4103 lt!553746 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745))) lt!553822)))

(declare-fun b!1218530 () Bool)

(declare-fun res!809326 () Bool)

(assert (=> b!1218530 (=> (not res!809326) (not e!691817))))

(assert (=> b!1218530 (= res!809326 (= (getValueByKey!645 (toList!9035 lt!553822) (_1!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745)))) (Some!695 (_2!10046 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745))))))))

(declare-fun b!1218531 () Bool)

(declare-fun contains!6987 (List!26851 tuple2!20070) Bool)

(assert (=> b!1218531 (= e!691817 (contains!6987 (toList!9035 lt!553822) (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745))))))

(assert (= (and d!133493 res!809325) b!1218530))

(assert (= (and b!1218530 res!809326) b!1218531))

(declare-fun m!1122841 () Bool)

(assert (=> d!133493 m!1122841))

(declare-fun m!1122843 () Bool)

(assert (=> d!133493 m!1122843))

(declare-fun m!1122845 () Bool)

(assert (=> d!133493 m!1122845))

(declare-fun m!1122847 () Bool)

(assert (=> d!133493 m!1122847))

(declare-fun m!1122849 () Bool)

(assert (=> b!1218530 m!1122849))

(declare-fun m!1122851 () Bool)

(assert (=> b!1218531 m!1122851))

(assert (=> b!1218408 d!133493))

(declare-fun d!133495 () Bool)

(declare-fun c!120106 () Bool)

(assert (=> d!133495 (= c!120106 ((_ is ValueCellFull!14771) (select (arr!37942 _values!996) from!1455)))))

(declare-fun e!691820 () V!46409)

(assert (=> d!133495 (= (get!19352 (select (arr!37942 _values!996) from!1455) lt!553745) e!691820)))

(declare-fun b!1218536 () Bool)

(declare-fun get!19354 (ValueCell!14771 V!46409) V!46409)

(assert (=> b!1218536 (= e!691820 (get!19354 (select (arr!37942 _values!996) from!1455) lt!553745))))

(declare-fun b!1218537 () Bool)

(declare-fun get!19355 (ValueCell!14771 V!46409) V!46409)

(assert (=> b!1218537 (= e!691820 (get!19355 (select (arr!37942 _values!996) from!1455) lt!553745))))

(assert (= (and d!133495 c!120106) b!1218536))

(assert (= (and d!133495 (not c!120106)) b!1218537))

(assert (=> b!1218536 m!1122727))

(declare-fun m!1122853 () Bool)

(assert (=> b!1218536 m!1122853))

(assert (=> b!1218537 m!1122727))

(declare-fun m!1122855 () Bool)

(assert (=> b!1218537 m!1122855))

(assert (=> b!1218408 d!133495))

(declare-fun d!133497 () Bool)

(assert (=> d!133497 (= (array_inv!29000 _keys!1208) (bvsge (size!38479 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101380 d!133497))

(declare-fun d!133499 () Bool)

(assert (=> d!133499 (= (array_inv!29001 _values!996) (bvsge (size!38480 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101380 d!133499))

(declare-fun d!133501 () Bool)

(declare-fun res!809331 () Bool)

(declare-fun e!691825 () Bool)

(assert (=> d!133501 (=> res!809331 e!691825)))

(assert (=> d!133501 (= res!809331 (= (select (arr!37941 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133501 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691825)))

(declare-fun b!1218542 () Bool)

(declare-fun e!691826 () Bool)

(assert (=> b!1218542 (= e!691825 e!691826)))

(declare-fun res!809332 () Bool)

(assert (=> b!1218542 (=> (not res!809332) (not e!691826))))

(assert (=> b!1218542 (= res!809332 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38479 _keys!1208)))))

(declare-fun b!1218543 () Bool)

(assert (=> b!1218543 (= e!691826 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133501 (not res!809331)) b!1218542))

(assert (= (and b!1218542 res!809332) b!1218543))

(declare-fun m!1122857 () Bool)

(assert (=> d!133501 m!1122857))

(declare-fun m!1122859 () Bool)

(assert (=> b!1218543 m!1122859))

(assert (=> b!1218409 d!133501))

(declare-fun d!133503 () Bool)

(assert (=> d!133503 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553826 () Unit!40245)

(declare-fun choose!13 (array!78616 (_ BitVec 64) (_ BitVec 32)) Unit!40245)

(assert (=> d!133503 (= lt!553826 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133503 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133503 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553826)))

(declare-fun bs!34302 () Bool)

(assert (= bs!34302 d!133503))

(assert (=> bs!34302 m!1122715))

(declare-fun m!1122861 () Bool)

(assert (=> bs!34302 m!1122861))

(assert (=> b!1218409 d!133503))

(declare-fun b!1218554 () Bool)

(declare-fun e!691835 () Bool)

(declare-fun call!60627 () Bool)

(assert (=> b!1218554 (= e!691835 call!60627)))

(declare-fun b!1218555 () Bool)

(declare-fun e!691838 () Bool)

(declare-fun e!691836 () Bool)

(assert (=> b!1218555 (= e!691838 e!691836)))

(declare-fun res!809339 () Bool)

(assert (=> b!1218555 (=> (not res!809339) (not e!691836))))

(declare-fun e!691837 () Bool)

(assert (=> b!1218555 (= res!809339 (not e!691837))))

(declare-fun res!809340 () Bool)

(assert (=> b!1218555 (=> (not res!809340) (not e!691837))))

(assert (=> b!1218555 (= res!809340 (validKeyInArray!0 (select (arr!37941 lt!553747) #b00000000000000000000000000000000)))))

(declare-fun bm!60624 () Bool)

(declare-fun c!120109 () Bool)

(assert (=> bm!60624 (= call!60627 (arrayNoDuplicates!0 lt!553747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120109 (Cons!26846 (select (arr!37941 lt!553747) #b00000000000000000000000000000000) Nil!26847) Nil!26847)))))

(declare-fun b!1218556 () Bool)

(declare-fun contains!6988 (List!26850 (_ BitVec 64)) Bool)

(assert (=> b!1218556 (= e!691837 (contains!6988 Nil!26847 (select (arr!37941 lt!553747) #b00000000000000000000000000000000)))))

(declare-fun d!133505 () Bool)

(declare-fun res!809341 () Bool)

(assert (=> d!133505 (=> res!809341 e!691838)))

(assert (=> d!133505 (= res!809341 (bvsge #b00000000000000000000000000000000 (size!38479 lt!553747)))))

(assert (=> d!133505 (= (arrayNoDuplicates!0 lt!553747 #b00000000000000000000000000000000 Nil!26847) e!691838)))

(declare-fun b!1218557 () Bool)

(assert (=> b!1218557 (= e!691836 e!691835)))

(assert (=> b!1218557 (= c!120109 (validKeyInArray!0 (select (arr!37941 lt!553747) #b00000000000000000000000000000000)))))

(declare-fun b!1218558 () Bool)

(assert (=> b!1218558 (= e!691835 call!60627)))

(assert (= (and d!133505 (not res!809341)) b!1218555))

(assert (= (and b!1218555 res!809340) b!1218556))

(assert (= (and b!1218555 res!809339) b!1218557))

(assert (= (and b!1218557 c!120109) b!1218558))

(assert (= (and b!1218557 (not c!120109)) b!1218554))

(assert (= (or b!1218558 b!1218554) bm!60624))

(declare-fun m!1122863 () Bool)

(assert (=> b!1218555 m!1122863))

(assert (=> b!1218555 m!1122863))

(declare-fun m!1122865 () Bool)

(assert (=> b!1218555 m!1122865))

(assert (=> bm!60624 m!1122863))

(declare-fun m!1122867 () Bool)

(assert (=> bm!60624 m!1122867))

(assert (=> b!1218556 m!1122863))

(assert (=> b!1218556 m!1122863))

(declare-fun m!1122869 () Bool)

(assert (=> b!1218556 m!1122869))

(assert (=> b!1218557 m!1122863))

(assert (=> b!1218557 m!1122863))

(assert (=> b!1218557 m!1122865))

(assert (=> b!1218399 d!133505))

(declare-fun d!133507 () Bool)

(assert (=> d!133507 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1218410 d!133507))

(declare-fun d!133509 () Bool)

(assert (=> d!133509 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218411 d!133509))

(declare-fun d!133511 () Bool)

(declare-fun res!809342 () Bool)

(declare-fun e!691839 () Bool)

(assert (=> d!133511 (=> res!809342 e!691839)))

(assert (=> d!133511 (= res!809342 (= (select (arr!37941 _keys!1208) i!673) k0!934))))

(assert (=> d!133511 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!691839)))

(declare-fun b!1218559 () Bool)

(declare-fun e!691840 () Bool)

(assert (=> b!1218559 (= e!691839 e!691840)))

(declare-fun res!809343 () Bool)

(assert (=> b!1218559 (=> (not res!809343) (not e!691840))))

(assert (=> b!1218559 (= res!809343 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38479 _keys!1208)))))

(declare-fun b!1218560 () Bool)

(assert (=> b!1218560 (= e!691840 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133511 (not res!809342)) b!1218559))

(assert (= (and b!1218559 res!809343) b!1218560))

(assert (=> d!133511 m!1122725))

(declare-fun m!1122871 () Bool)

(assert (=> b!1218560 m!1122871))

(assert (=> b!1218401 d!133511))

(declare-fun call!60630 () ListLongMap!18039)

(declare-fun bm!60627 () Bool)

(assert (=> bm!60627 (= call!60630 (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218585 () Bool)

(declare-fun e!691857 () Bool)

(declare-fun lt!553844 () ListLongMap!18039)

(declare-fun isEmpty!1001 (ListLongMap!18039) Bool)

(assert (=> b!1218585 (= e!691857 (isEmpty!1001 lt!553844))))

(declare-fun b!1218586 () Bool)

(declare-fun e!691860 () ListLongMap!18039)

(declare-fun e!691856 () ListLongMap!18039)

(assert (=> b!1218586 (= e!691860 e!691856)))

(declare-fun c!120120 () Bool)

(assert (=> b!1218586 (= c!120120 (validKeyInArray!0 (select (arr!37941 lt!553747) from!1455)))))

(declare-fun b!1218587 () Bool)

(declare-fun e!691859 () Bool)

(declare-fun e!691855 () Bool)

(assert (=> b!1218587 (= e!691859 e!691855)))

(assert (=> b!1218587 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38479 lt!553747)))))

(declare-fun res!809353 () Bool)

(assert (=> b!1218587 (= res!809353 (contains!6986 lt!553844 (select (arr!37941 lt!553747) from!1455)))))

(assert (=> b!1218587 (=> (not res!809353) (not e!691855))))

(declare-fun b!1218588 () Bool)

(assert (=> b!1218588 (= e!691859 e!691857)))

(declare-fun c!120121 () Bool)

(assert (=> b!1218588 (= c!120121 (bvslt from!1455 (size!38479 lt!553747)))))

(declare-fun b!1218589 () Bool)

(assert (=> b!1218589 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38479 lt!553747)))))

(assert (=> b!1218589 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38480 lt!553743)))))

(declare-fun apply!965 (ListLongMap!18039 (_ BitVec 64)) V!46409)

(assert (=> b!1218589 (= e!691855 (= (apply!965 lt!553844 (select (arr!37941 lt!553747) from!1455)) (get!19352 (select (arr!37942 lt!553743) from!1455) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218590 () Bool)

(declare-fun e!691858 () Bool)

(assert (=> b!1218590 (= e!691858 (validKeyInArray!0 (select (arr!37941 lt!553747) from!1455)))))

(assert (=> b!1218590 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1218591 () Bool)

(assert (=> b!1218591 (= e!691860 (ListLongMap!18040 Nil!26848))))

(declare-fun d!133513 () Bool)

(declare-fun e!691861 () Bool)

(assert (=> d!133513 e!691861))

(declare-fun res!809355 () Bool)

(assert (=> d!133513 (=> (not res!809355) (not e!691861))))

(assert (=> d!133513 (= res!809355 (not (contains!6986 lt!553844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133513 (= lt!553844 e!691860)))

(declare-fun c!120118 () Bool)

(assert (=> d!133513 (= c!120118 (bvsge from!1455 (size!38479 lt!553747)))))

(assert (=> d!133513 (validMask!0 mask!1564)))

(assert (=> d!133513 (= (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553844)))

(declare-fun b!1218592 () Bool)

(assert (=> b!1218592 (= e!691856 call!60630)))

(declare-fun b!1218593 () Bool)

(assert (=> b!1218593 (= e!691857 (= lt!553844 (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218594 () Bool)

(declare-fun res!809354 () Bool)

(assert (=> b!1218594 (=> (not res!809354) (not e!691861))))

(assert (=> b!1218594 (= res!809354 (not (contains!6986 lt!553844 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218595 () Bool)

(declare-fun lt!553847 () Unit!40245)

(declare-fun lt!553843 () Unit!40245)

(assert (=> b!1218595 (= lt!553847 lt!553843)))

(declare-fun lt!553842 () (_ BitVec 64))

(declare-fun lt!553845 () V!46409)

(declare-fun lt!553841 () ListLongMap!18039)

(declare-fun lt!553846 () (_ BitVec 64))

(assert (=> b!1218595 (not (contains!6986 (+!4103 lt!553841 (tuple2!20071 lt!553846 lt!553845)) lt!553842))))

(declare-fun addStillNotContains!301 (ListLongMap!18039 (_ BitVec 64) V!46409 (_ BitVec 64)) Unit!40245)

(assert (=> b!1218595 (= lt!553843 (addStillNotContains!301 lt!553841 lt!553846 lt!553845 lt!553842))))

(assert (=> b!1218595 (= lt!553842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218595 (= lt!553845 (get!19352 (select (arr!37942 lt!553743) from!1455) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218595 (= lt!553846 (select (arr!37941 lt!553747) from!1455))))

(assert (=> b!1218595 (= lt!553841 call!60630)))

(assert (=> b!1218595 (= e!691856 (+!4103 call!60630 (tuple2!20071 (select (arr!37941 lt!553747) from!1455) (get!19352 (select (arr!37942 lt!553743) from!1455) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1218596 () Bool)

(assert (=> b!1218596 (= e!691861 e!691859)))

(declare-fun c!120119 () Bool)

(assert (=> b!1218596 (= c!120119 e!691858)))

(declare-fun res!809352 () Bool)

(assert (=> b!1218596 (=> (not res!809352) (not e!691858))))

(assert (=> b!1218596 (= res!809352 (bvslt from!1455 (size!38479 lt!553747)))))

(assert (= (and d!133513 c!120118) b!1218591))

(assert (= (and d!133513 (not c!120118)) b!1218586))

(assert (= (and b!1218586 c!120120) b!1218595))

(assert (= (and b!1218586 (not c!120120)) b!1218592))

(assert (= (or b!1218595 b!1218592) bm!60627))

(assert (= (and d!133513 res!809355) b!1218594))

(assert (= (and b!1218594 res!809354) b!1218596))

(assert (= (and b!1218596 res!809352) b!1218590))

(assert (= (and b!1218596 c!120119) b!1218587))

(assert (= (and b!1218596 (not c!120119)) b!1218588))

(assert (= (and b!1218587 res!809353) b!1218589))

(assert (= (and b!1218588 c!120121) b!1218593))

(assert (= (and b!1218588 (not c!120121)) b!1218585))

(declare-fun b_lambda!22007 () Bool)

(assert (=> (not b_lambda!22007) (not b!1218589)))

(assert (=> b!1218589 t!40077))

(declare-fun b_and!43661 () Bool)

(assert (= b_and!43651 (and (=> t!40077 result!22707) b_and!43661)))

(declare-fun b_lambda!22009 () Bool)

(assert (=> (not b_lambda!22009) (not b!1218595)))

(assert (=> b!1218595 t!40077))

(declare-fun b_and!43663 () Bool)

(assert (= b_and!43661 (and (=> t!40077 result!22707) b_and!43663)))

(declare-fun m!1122873 () Bool)

(assert (=> b!1218595 m!1122873))

(declare-fun m!1122875 () Bool)

(assert (=> b!1218595 m!1122875))

(declare-fun m!1122877 () Bool)

(assert (=> b!1218595 m!1122877))

(declare-fun m!1122879 () Bool)

(assert (=> b!1218595 m!1122879))

(declare-fun m!1122881 () Bool)

(assert (=> b!1218595 m!1122881))

(assert (=> b!1218595 m!1122707))

(assert (=> b!1218595 m!1122877))

(assert (=> b!1218595 m!1122707))

(declare-fun m!1122883 () Bool)

(assert (=> b!1218595 m!1122883))

(assert (=> b!1218595 m!1122879))

(declare-fun m!1122885 () Bool)

(assert (=> b!1218595 m!1122885))

(declare-fun m!1122887 () Bool)

(assert (=> b!1218594 m!1122887))

(declare-fun m!1122889 () Bool)

(assert (=> b!1218585 m!1122889))

(assert (=> b!1218586 m!1122873))

(assert (=> b!1218586 m!1122873))

(declare-fun m!1122891 () Bool)

(assert (=> b!1218586 m!1122891))

(declare-fun m!1122893 () Bool)

(assert (=> b!1218593 m!1122893))

(assert (=> bm!60627 m!1122893))

(assert (=> b!1218589 m!1122873))

(assert (=> b!1218589 m!1122877))

(assert (=> b!1218589 m!1122707))

(assert (=> b!1218589 m!1122877))

(assert (=> b!1218589 m!1122707))

(assert (=> b!1218589 m!1122883))

(assert (=> b!1218589 m!1122873))

(declare-fun m!1122895 () Bool)

(assert (=> b!1218589 m!1122895))

(declare-fun m!1122897 () Bool)

(assert (=> d!133513 m!1122897))

(assert (=> d!133513 m!1122719))

(assert (=> b!1218587 m!1122873))

(assert (=> b!1218587 m!1122873))

(declare-fun m!1122899 () Bool)

(assert (=> b!1218587 m!1122899))

(assert (=> b!1218590 m!1122873))

(assert (=> b!1218590 m!1122873))

(assert (=> b!1218590 m!1122891))

(assert (=> b!1218403 d!133513))

(declare-fun call!60631 () ListLongMap!18039)

(declare-fun bm!60628 () Bool)

(assert (=> bm!60628 (= call!60631 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218597 () Bool)

(declare-fun e!691864 () Bool)

(declare-fun lt!553851 () ListLongMap!18039)

(assert (=> b!1218597 (= e!691864 (isEmpty!1001 lt!553851))))

(declare-fun b!1218598 () Bool)

(declare-fun e!691867 () ListLongMap!18039)

(declare-fun e!691863 () ListLongMap!18039)

(assert (=> b!1218598 (= e!691867 e!691863)))

(declare-fun c!120124 () Bool)

(assert (=> b!1218598 (= c!120124 (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455)))))

(declare-fun b!1218599 () Bool)

(declare-fun e!691866 () Bool)

(declare-fun e!691862 () Bool)

(assert (=> b!1218599 (= e!691866 e!691862)))

(assert (=> b!1218599 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38479 _keys!1208)))))

(declare-fun res!809357 () Bool)

(assert (=> b!1218599 (= res!809357 (contains!6986 lt!553851 (select (arr!37941 _keys!1208) from!1455)))))

(assert (=> b!1218599 (=> (not res!809357) (not e!691862))))

(declare-fun b!1218600 () Bool)

(assert (=> b!1218600 (= e!691866 e!691864)))

(declare-fun c!120125 () Bool)

(assert (=> b!1218600 (= c!120125 (bvslt from!1455 (size!38479 _keys!1208)))))

(declare-fun b!1218601 () Bool)

(assert (=> b!1218601 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38479 _keys!1208)))))

(assert (=> b!1218601 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38480 _values!996)))))

(assert (=> b!1218601 (= e!691862 (= (apply!965 lt!553851 (select (arr!37941 _keys!1208) from!1455)) (get!19352 (select (arr!37942 _values!996) from!1455) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218602 () Bool)

(declare-fun e!691865 () Bool)

(assert (=> b!1218602 (= e!691865 (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455)))))

(assert (=> b!1218602 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1218603 () Bool)

(assert (=> b!1218603 (= e!691867 (ListLongMap!18040 Nil!26848))))

(declare-fun d!133515 () Bool)

(declare-fun e!691868 () Bool)

(assert (=> d!133515 e!691868))

(declare-fun res!809359 () Bool)

(assert (=> d!133515 (=> (not res!809359) (not e!691868))))

(assert (=> d!133515 (= res!809359 (not (contains!6986 lt!553851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133515 (= lt!553851 e!691867)))

(declare-fun c!120122 () Bool)

(assert (=> d!133515 (= c!120122 (bvsge from!1455 (size!38479 _keys!1208)))))

(assert (=> d!133515 (validMask!0 mask!1564)))

(assert (=> d!133515 (= (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553851)))

(declare-fun b!1218604 () Bool)

(assert (=> b!1218604 (= e!691863 call!60631)))

(declare-fun b!1218605 () Bool)

(assert (=> b!1218605 (= e!691864 (= lt!553851 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218606 () Bool)

(declare-fun res!809358 () Bool)

(assert (=> b!1218606 (=> (not res!809358) (not e!691868))))

(assert (=> b!1218606 (= res!809358 (not (contains!6986 lt!553851 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218607 () Bool)

(declare-fun lt!553854 () Unit!40245)

(declare-fun lt!553850 () Unit!40245)

(assert (=> b!1218607 (= lt!553854 lt!553850)))

(declare-fun lt!553852 () V!46409)

(declare-fun lt!553849 () (_ BitVec 64))

(declare-fun lt!553848 () ListLongMap!18039)

(declare-fun lt!553853 () (_ BitVec 64))

(assert (=> b!1218607 (not (contains!6986 (+!4103 lt!553848 (tuple2!20071 lt!553853 lt!553852)) lt!553849))))

(assert (=> b!1218607 (= lt!553850 (addStillNotContains!301 lt!553848 lt!553853 lt!553852 lt!553849))))

(assert (=> b!1218607 (= lt!553849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218607 (= lt!553852 (get!19352 (select (arr!37942 _values!996) from!1455) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218607 (= lt!553853 (select (arr!37941 _keys!1208) from!1455))))

(assert (=> b!1218607 (= lt!553848 call!60631)))

(assert (=> b!1218607 (= e!691863 (+!4103 call!60631 (tuple2!20071 (select (arr!37941 _keys!1208) from!1455) (get!19352 (select (arr!37942 _values!996) from!1455) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1218608 () Bool)

(assert (=> b!1218608 (= e!691868 e!691866)))

(declare-fun c!120123 () Bool)

(assert (=> b!1218608 (= c!120123 e!691865)))

(declare-fun res!809356 () Bool)

(assert (=> b!1218608 (=> (not res!809356) (not e!691865))))

(assert (=> b!1218608 (= res!809356 (bvslt from!1455 (size!38479 _keys!1208)))))

(assert (= (and d!133515 c!120122) b!1218603))

(assert (= (and d!133515 (not c!120122)) b!1218598))

(assert (= (and b!1218598 c!120124) b!1218607))

(assert (= (and b!1218598 (not c!120124)) b!1218604))

(assert (= (or b!1218607 b!1218604) bm!60628))

(assert (= (and d!133515 res!809359) b!1218606))

(assert (= (and b!1218606 res!809358) b!1218608))

(assert (= (and b!1218608 res!809356) b!1218602))

(assert (= (and b!1218608 c!120123) b!1218599))

(assert (= (and b!1218608 (not c!120123)) b!1218600))

(assert (= (and b!1218599 res!809357) b!1218601))

(assert (= (and b!1218600 c!120125) b!1218605))

(assert (= (and b!1218600 (not c!120125)) b!1218597))

(declare-fun b_lambda!22011 () Bool)

(assert (=> (not b_lambda!22011) (not b!1218601)))

(assert (=> b!1218601 t!40077))

(declare-fun b_and!43665 () Bool)

(assert (= b_and!43663 (and (=> t!40077 result!22707) b_and!43665)))

(declare-fun b_lambda!22013 () Bool)

(assert (=> (not b_lambda!22013) (not b!1218607)))

(assert (=> b!1218607 t!40077))

(declare-fun b_and!43667 () Bool)

(assert (= b_and!43665 (and (=> t!40077 result!22707) b_and!43667)))

(assert (=> b!1218607 m!1122683))

(declare-fun m!1122901 () Bool)

(assert (=> b!1218607 m!1122901))

(assert (=> b!1218607 m!1122727))

(declare-fun m!1122903 () Bool)

(assert (=> b!1218607 m!1122903))

(declare-fun m!1122905 () Bool)

(assert (=> b!1218607 m!1122905))

(assert (=> b!1218607 m!1122707))

(assert (=> b!1218607 m!1122727))

(assert (=> b!1218607 m!1122707))

(declare-fun m!1122907 () Bool)

(assert (=> b!1218607 m!1122907))

(assert (=> b!1218607 m!1122903))

(declare-fun m!1122909 () Bool)

(assert (=> b!1218607 m!1122909))

(declare-fun m!1122911 () Bool)

(assert (=> b!1218606 m!1122911))

(declare-fun m!1122913 () Bool)

(assert (=> b!1218597 m!1122913))

(assert (=> b!1218598 m!1122683))

(assert (=> b!1218598 m!1122683))

(assert (=> b!1218598 m!1122685))

(declare-fun m!1122915 () Bool)

(assert (=> b!1218605 m!1122915))

(assert (=> bm!60628 m!1122915))

(assert (=> b!1218601 m!1122683))

(assert (=> b!1218601 m!1122727))

(assert (=> b!1218601 m!1122707))

(assert (=> b!1218601 m!1122727))

(assert (=> b!1218601 m!1122707))

(assert (=> b!1218601 m!1122907))

(assert (=> b!1218601 m!1122683))

(declare-fun m!1122917 () Bool)

(assert (=> b!1218601 m!1122917))

(declare-fun m!1122919 () Bool)

(assert (=> d!133515 m!1122919))

(assert (=> d!133515 m!1122719))

(assert (=> b!1218599 m!1122683))

(assert (=> b!1218599 m!1122683))

(declare-fun m!1122921 () Bool)

(assert (=> b!1218599 m!1122921))

(assert (=> b!1218602 m!1122683))

(assert (=> b!1218602 m!1122683))

(assert (=> b!1218602 m!1122685))

(assert (=> b!1218403 d!133515))

(declare-fun b!1218617 () Bool)

(declare-fun e!691876 () Bool)

(declare-fun call!60634 () Bool)

(assert (=> b!1218617 (= e!691876 call!60634)))

(declare-fun d!133517 () Bool)

(declare-fun res!809365 () Bool)

(declare-fun e!691877 () Bool)

(assert (=> d!133517 (=> res!809365 e!691877)))

(assert (=> d!133517 (= res!809365 (bvsge #b00000000000000000000000000000000 (size!38479 _keys!1208)))))

(assert (=> d!133517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!691877)))

(declare-fun b!1218618 () Bool)

(declare-fun e!691875 () Bool)

(assert (=> b!1218618 (= e!691875 call!60634)))

(declare-fun b!1218619 () Bool)

(assert (=> b!1218619 (= e!691876 e!691875)))

(declare-fun lt!553861 () (_ BitVec 64))

(assert (=> b!1218619 (= lt!553861 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553862 () Unit!40245)

(assert (=> b!1218619 (= lt!553862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!553861 #b00000000000000000000000000000000))))

(assert (=> b!1218619 (arrayContainsKey!0 _keys!1208 lt!553861 #b00000000000000000000000000000000)))

(declare-fun lt!553863 () Unit!40245)

(assert (=> b!1218619 (= lt!553863 lt!553862)))

(declare-fun res!809364 () Bool)

(declare-datatypes ((SeekEntryResult!9944 0))(
  ( (MissingZero!9944 (index!42147 (_ BitVec 32))) (Found!9944 (index!42148 (_ BitVec 32))) (Intermediate!9944 (undefined!10756 Bool) (index!42149 (_ BitVec 32)) (x!107350 (_ BitVec 32))) (Undefined!9944) (MissingVacant!9944 (index!42150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78616 (_ BitVec 32)) SeekEntryResult!9944)

(assert (=> b!1218619 (= res!809364 (= (seekEntryOrOpen!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9944 #b00000000000000000000000000000000)))))

(assert (=> b!1218619 (=> (not res!809364) (not e!691875))))

(declare-fun b!1218620 () Bool)

(assert (=> b!1218620 (= e!691877 e!691876)))

(declare-fun c!120128 () Bool)

(assert (=> b!1218620 (= c!120128 (validKeyInArray!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60631 () Bool)

(assert (=> bm!60631 (= call!60634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133517 (not res!809365)) b!1218620))

(assert (= (and b!1218620 c!120128) b!1218619))

(assert (= (and b!1218620 (not c!120128)) b!1218617))

(assert (= (and b!1218619 res!809364) b!1218618))

(assert (= (or b!1218618 b!1218617) bm!60631))

(assert (=> b!1218619 m!1122857))

(declare-fun m!1122923 () Bool)

(assert (=> b!1218619 m!1122923))

(declare-fun m!1122925 () Bool)

(assert (=> b!1218619 m!1122925))

(assert (=> b!1218619 m!1122857))

(declare-fun m!1122927 () Bool)

(assert (=> b!1218619 m!1122927))

(assert (=> b!1218620 m!1122857))

(assert (=> b!1218620 m!1122857))

(declare-fun m!1122929 () Bool)

(assert (=> b!1218620 m!1122929))

(declare-fun m!1122931 () Bool)

(assert (=> bm!60631 m!1122931))

(assert (=> b!1218394 d!133517))

(declare-fun b!1218621 () Bool)

(declare-fun e!691878 () Bool)

(declare-fun call!60635 () Bool)

(assert (=> b!1218621 (= e!691878 call!60635)))

(declare-fun b!1218622 () Bool)

(declare-fun e!691881 () Bool)

(declare-fun e!691879 () Bool)

(assert (=> b!1218622 (= e!691881 e!691879)))

(declare-fun res!809366 () Bool)

(assert (=> b!1218622 (=> (not res!809366) (not e!691879))))

(declare-fun e!691880 () Bool)

(assert (=> b!1218622 (= res!809366 (not e!691880))))

(declare-fun res!809367 () Bool)

(assert (=> b!1218622 (=> (not res!809367) (not e!691880))))

(assert (=> b!1218622 (= res!809367 (validKeyInArray!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60632 () Bool)

(declare-fun c!120129 () Bool)

(assert (=> bm!60632 (= call!60635 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120129 (Cons!26846 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000) Nil!26847) Nil!26847)))))

(declare-fun b!1218623 () Bool)

(assert (=> b!1218623 (= e!691880 (contains!6988 Nil!26847 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133519 () Bool)

(declare-fun res!809368 () Bool)

(assert (=> d!133519 (=> res!809368 e!691881)))

(assert (=> d!133519 (= res!809368 (bvsge #b00000000000000000000000000000000 (size!38479 _keys!1208)))))

(assert (=> d!133519 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26847) e!691881)))

(declare-fun b!1218624 () Bool)

(assert (=> b!1218624 (= e!691879 e!691878)))

(assert (=> b!1218624 (= c!120129 (validKeyInArray!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1218625 () Bool)

(assert (=> b!1218625 (= e!691878 call!60635)))

(assert (= (and d!133519 (not res!809368)) b!1218622))

(assert (= (and b!1218622 res!809367) b!1218623))

(assert (= (and b!1218622 res!809366) b!1218624))

(assert (= (and b!1218624 c!120129) b!1218625))

(assert (= (and b!1218624 (not c!120129)) b!1218621))

(assert (= (or b!1218625 b!1218621) bm!60632))

(assert (=> b!1218622 m!1122857))

(assert (=> b!1218622 m!1122857))

(assert (=> b!1218622 m!1122929))

(assert (=> bm!60632 m!1122857))

(declare-fun m!1122933 () Bool)

(assert (=> bm!60632 m!1122933))

(assert (=> b!1218623 m!1122857))

(assert (=> b!1218623 m!1122857))

(declare-fun m!1122935 () Bool)

(assert (=> b!1218623 m!1122935))

(assert (=> b!1218624 m!1122857))

(assert (=> b!1218624 m!1122857))

(assert (=> b!1218624 m!1122929))

(assert (=> b!1218405 d!133519))

(declare-fun b!1218626 () Bool)

(declare-fun e!691883 () Bool)

(declare-fun call!60636 () Bool)

(assert (=> b!1218626 (= e!691883 call!60636)))

(declare-fun d!133521 () Bool)

(declare-fun res!809370 () Bool)

(declare-fun e!691884 () Bool)

(assert (=> d!133521 (=> res!809370 e!691884)))

(assert (=> d!133521 (= res!809370 (bvsge #b00000000000000000000000000000000 (size!38479 lt!553747)))))

(assert (=> d!133521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553747 mask!1564) e!691884)))

(declare-fun b!1218627 () Bool)

(declare-fun e!691882 () Bool)

(assert (=> b!1218627 (= e!691882 call!60636)))

(declare-fun b!1218628 () Bool)

(assert (=> b!1218628 (= e!691883 e!691882)))

(declare-fun lt!553864 () (_ BitVec 64))

(assert (=> b!1218628 (= lt!553864 (select (arr!37941 lt!553747) #b00000000000000000000000000000000))))

(declare-fun lt!553865 () Unit!40245)

(assert (=> b!1218628 (= lt!553865 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553747 lt!553864 #b00000000000000000000000000000000))))

(assert (=> b!1218628 (arrayContainsKey!0 lt!553747 lt!553864 #b00000000000000000000000000000000)))

(declare-fun lt!553866 () Unit!40245)

(assert (=> b!1218628 (= lt!553866 lt!553865)))

(declare-fun res!809369 () Bool)

(assert (=> b!1218628 (= res!809369 (= (seekEntryOrOpen!0 (select (arr!37941 lt!553747) #b00000000000000000000000000000000) lt!553747 mask!1564) (Found!9944 #b00000000000000000000000000000000)))))

(assert (=> b!1218628 (=> (not res!809369) (not e!691882))))

(declare-fun b!1218629 () Bool)

(assert (=> b!1218629 (= e!691884 e!691883)))

(declare-fun c!120130 () Bool)

(assert (=> b!1218629 (= c!120130 (validKeyInArray!0 (select (arr!37941 lt!553747) #b00000000000000000000000000000000)))))

(declare-fun bm!60633 () Bool)

(assert (=> bm!60633 (= call!60636 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553747 mask!1564))))

(assert (= (and d!133521 (not res!809370)) b!1218629))

(assert (= (and b!1218629 c!120130) b!1218628))

(assert (= (and b!1218629 (not c!120130)) b!1218626))

(assert (= (and b!1218628 res!809369) b!1218627))

(assert (= (or b!1218627 b!1218626) bm!60633))

(assert (=> b!1218628 m!1122863))

(declare-fun m!1122937 () Bool)

(assert (=> b!1218628 m!1122937))

(declare-fun m!1122939 () Bool)

(assert (=> b!1218628 m!1122939))

(assert (=> b!1218628 m!1122863))

(declare-fun m!1122941 () Bool)

(assert (=> b!1218628 m!1122941))

(assert (=> b!1218629 m!1122863))

(assert (=> b!1218629 m!1122863))

(assert (=> b!1218629 m!1122865))

(declare-fun m!1122943 () Bool)

(assert (=> bm!60633 m!1122943))

(assert (=> b!1218397 d!133521))

(declare-fun d!133523 () Bool)

(assert (=> d!133523 (= (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455)) (and (not (= (select (arr!37941 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37941 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218406 d!133523))

(declare-fun call!60637 () ListLongMap!18039)

(declare-fun bm!60634 () Bool)

(assert (=> bm!60634 (= call!60637 (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218630 () Bool)

(declare-fun e!691887 () Bool)

(declare-fun lt!553870 () ListLongMap!18039)

(assert (=> b!1218630 (= e!691887 (isEmpty!1001 lt!553870))))

(declare-fun b!1218631 () Bool)

(declare-fun e!691890 () ListLongMap!18039)

(declare-fun e!691886 () ListLongMap!18039)

(assert (=> b!1218631 (= e!691890 e!691886)))

(declare-fun c!120133 () Bool)

(assert (=> b!1218631 (= c!120133 (validKeyInArray!0 (select (arr!37941 lt!553747) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1218632 () Bool)

(declare-fun e!691889 () Bool)

(declare-fun e!691885 () Bool)

(assert (=> b!1218632 (= e!691889 e!691885)))

(assert (=> b!1218632 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 lt!553747)))))

(declare-fun res!809372 () Bool)

(assert (=> b!1218632 (= res!809372 (contains!6986 lt!553870 (select (arr!37941 lt!553747) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218632 (=> (not res!809372) (not e!691885))))

(declare-fun b!1218633 () Bool)

(assert (=> b!1218633 (= e!691889 e!691887)))

(declare-fun c!120134 () Bool)

(assert (=> b!1218633 (= c!120134 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 lt!553747)))))

(declare-fun b!1218634 () Bool)

(assert (=> b!1218634 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 lt!553747)))))

(assert (=> b!1218634 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38480 lt!553743)))))

(assert (=> b!1218634 (= e!691885 (= (apply!965 lt!553870 (select (arr!37941 lt!553747) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19352 (select (arr!37942 lt!553743) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218635 () Bool)

(declare-fun e!691888 () Bool)

(assert (=> b!1218635 (= e!691888 (validKeyInArray!0 (select (arr!37941 lt!553747) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218635 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1218636 () Bool)

(assert (=> b!1218636 (= e!691890 (ListLongMap!18040 Nil!26848))))

(declare-fun d!133525 () Bool)

(declare-fun e!691891 () Bool)

(assert (=> d!133525 e!691891))

(declare-fun res!809374 () Bool)

(assert (=> d!133525 (=> (not res!809374) (not e!691891))))

(assert (=> d!133525 (= res!809374 (not (contains!6986 lt!553870 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133525 (= lt!553870 e!691890)))

(declare-fun c!120131 () Bool)

(assert (=> d!133525 (= c!120131 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 lt!553747)))))

(assert (=> d!133525 (validMask!0 mask!1564)))

(assert (=> d!133525 (= (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553870)))

(declare-fun b!1218637 () Bool)

(assert (=> b!1218637 (= e!691886 call!60637)))

(declare-fun b!1218638 () Bool)

(assert (=> b!1218638 (= e!691887 (= lt!553870 (getCurrentListMapNoExtraKeys!5474 lt!553747 lt!553743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218639 () Bool)

(declare-fun res!809373 () Bool)

(assert (=> b!1218639 (=> (not res!809373) (not e!691891))))

(assert (=> b!1218639 (= res!809373 (not (contains!6986 lt!553870 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218640 () Bool)

(declare-fun lt!553873 () Unit!40245)

(declare-fun lt!553869 () Unit!40245)

(assert (=> b!1218640 (= lt!553873 lt!553869)))

(declare-fun lt!553872 () (_ BitVec 64))

(declare-fun lt!553868 () (_ BitVec 64))

(declare-fun lt!553871 () V!46409)

(declare-fun lt!553867 () ListLongMap!18039)

(assert (=> b!1218640 (not (contains!6986 (+!4103 lt!553867 (tuple2!20071 lt!553872 lt!553871)) lt!553868))))

(assert (=> b!1218640 (= lt!553869 (addStillNotContains!301 lt!553867 lt!553872 lt!553871 lt!553868))))

(assert (=> b!1218640 (= lt!553868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218640 (= lt!553871 (get!19352 (select (arr!37942 lt!553743) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218640 (= lt!553872 (select (arr!37941 lt!553747) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1218640 (= lt!553867 call!60637)))

(assert (=> b!1218640 (= e!691886 (+!4103 call!60637 (tuple2!20071 (select (arr!37941 lt!553747) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19352 (select (arr!37942 lt!553743) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1218641 () Bool)

(assert (=> b!1218641 (= e!691891 e!691889)))

(declare-fun c!120132 () Bool)

(assert (=> b!1218641 (= c!120132 e!691888)))

(declare-fun res!809371 () Bool)

(assert (=> b!1218641 (=> (not res!809371) (not e!691888))))

(assert (=> b!1218641 (= res!809371 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 lt!553747)))))

(assert (= (and d!133525 c!120131) b!1218636))

(assert (= (and d!133525 (not c!120131)) b!1218631))

(assert (= (and b!1218631 c!120133) b!1218640))

(assert (= (and b!1218631 (not c!120133)) b!1218637))

(assert (= (or b!1218640 b!1218637) bm!60634))

(assert (= (and d!133525 res!809374) b!1218639))

(assert (= (and b!1218639 res!809373) b!1218641))

(assert (= (and b!1218641 res!809371) b!1218635))

(assert (= (and b!1218641 c!120132) b!1218632))

(assert (= (and b!1218641 (not c!120132)) b!1218633))

(assert (= (and b!1218632 res!809372) b!1218634))

(assert (= (and b!1218633 c!120134) b!1218638))

(assert (= (and b!1218633 (not c!120134)) b!1218630))

(declare-fun b_lambda!22015 () Bool)

(assert (=> (not b_lambda!22015) (not b!1218634)))

(assert (=> b!1218634 t!40077))

(declare-fun b_and!43669 () Bool)

(assert (= b_and!43667 (and (=> t!40077 result!22707) b_and!43669)))

(declare-fun b_lambda!22017 () Bool)

(assert (=> (not b_lambda!22017) (not b!1218640)))

(assert (=> b!1218640 t!40077))

(declare-fun b_and!43671 () Bool)

(assert (= b_and!43669 (and (=> t!40077 result!22707) b_and!43671)))

(declare-fun m!1122945 () Bool)

(assert (=> b!1218640 m!1122945))

(declare-fun m!1122947 () Bool)

(assert (=> b!1218640 m!1122947))

(declare-fun m!1122949 () Bool)

(assert (=> b!1218640 m!1122949))

(declare-fun m!1122951 () Bool)

(assert (=> b!1218640 m!1122951))

(declare-fun m!1122953 () Bool)

(assert (=> b!1218640 m!1122953))

(assert (=> b!1218640 m!1122707))

(assert (=> b!1218640 m!1122949))

(assert (=> b!1218640 m!1122707))

(declare-fun m!1122955 () Bool)

(assert (=> b!1218640 m!1122955))

(assert (=> b!1218640 m!1122951))

(declare-fun m!1122957 () Bool)

(assert (=> b!1218640 m!1122957))

(declare-fun m!1122959 () Bool)

(assert (=> b!1218639 m!1122959))

(declare-fun m!1122961 () Bool)

(assert (=> b!1218630 m!1122961))

(assert (=> b!1218631 m!1122945))

(assert (=> b!1218631 m!1122945))

(declare-fun m!1122963 () Bool)

(assert (=> b!1218631 m!1122963))

(declare-fun m!1122965 () Bool)

(assert (=> b!1218638 m!1122965))

(assert (=> bm!60634 m!1122965))

(assert (=> b!1218634 m!1122945))

(assert (=> b!1218634 m!1122949))

(assert (=> b!1218634 m!1122707))

(assert (=> b!1218634 m!1122949))

(assert (=> b!1218634 m!1122707))

(assert (=> b!1218634 m!1122955))

(assert (=> b!1218634 m!1122945))

(declare-fun m!1122967 () Bool)

(assert (=> b!1218634 m!1122967))

(declare-fun m!1122969 () Bool)

(assert (=> d!133525 m!1122969))

(assert (=> d!133525 m!1122719))

(assert (=> b!1218632 m!1122945))

(assert (=> b!1218632 m!1122945))

(declare-fun m!1122971 () Bool)

(assert (=> b!1218632 m!1122971))

(assert (=> b!1218635 m!1122945))

(assert (=> b!1218635 m!1122945))

(assert (=> b!1218635 m!1122963))

(assert (=> b!1218406 d!133525))

(declare-fun b!1218648 () Bool)

(declare-fun e!691896 () Bool)

(declare-fun call!60642 () ListLongMap!18039)

(declare-fun call!60643 () ListLongMap!18039)

(assert (=> b!1218648 (= e!691896 (= call!60642 call!60643))))

(assert (=> b!1218648 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38480 _values!996)))))

(declare-fun bm!60639 () Bool)

(assert (=> bm!60639 (= call!60643 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133527 () Bool)

(declare-fun e!691897 () Bool)

(assert (=> d!133527 e!691897))

(declare-fun res!809377 () Bool)

(assert (=> d!133527 (=> (not res!809377) (not e!691897))))

(assert (=> d!133527 (= res!809377 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38479 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38479 _keys!1208))))))))

(declare-fun lt!553876 () Unit!40245)

(declare-fun choose!1831 (array!78616 array!78618 (_ BitVec 32) (_ BitVec 32) V!46409 V!46409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40245)

(assert (=> d!133527 (= lt!553876 (choose!1831 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133527 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 _keys!1208)))))

(assert (=> d!133527 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553876)))

(declare-fun b!1218649 () Bool)

(assert (=> b!1218649 (= e!691897 e!691896)))

(declare-fun c!120137 () Bool)

(assert (=> b!1218649 (= c!120137 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1218650 () Bool)

(assert (=> b!1218650 (= e!691896 (= call!60642 (-!1868 call!60643 k0!934)))))

(assert (=> b!1218650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38480 _values!996)))))

(declare-fun bm!60640 () Bool)

(assert (=> bm!60640 (= call!60642 (getCurrentListMapNoExtraKeys!5474 (array!78617 (store (arr!37941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38479 _keys!1208)) (array!78619 (store (arr!37942 _values!996) i!673 (ValueCellFull!14771 (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38480 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133527 res!809377) b!1218649))

(assert (= (and b!1218649 c!120137) b!1218650))

(assert (= (and b!1218649 (not c!120137)) b!1218648))

(assert (= (or b!1218650 b!1218648) bm!60639))

(assert (= (or b!1218650 b!1218648) bm!60640))

(declare-fun b_lambda!22019 () Bool)

(assert (=> (not b_lambda!22019) (not bm!60640)))

(assert (=> bm!60640 t!40077))

(declare-fun b_and!43673 () Bool)

(assert (= b_and!43671 (and (=> t!40077 result!22707) b_and!43673)))

(assert (=> bm!60639 m!1122687))

(declare-fun m!1122973 () Bool)

(assert (=> d!133527 m!1122973))

(declare-fun m!1122975 () Bool)

(assert (=> b!1218650 m!1122975))

(assert (=> bm!60640 m!1122713))

(assert (=> bm!60640 m!1122707))

(declare-fun m!1122977 () Bool)

(assert (=> bm!60640 m!1122977))

(declare-fun m!1122979 () Bool)

(assert (=> bm!60640 m!1122979))

(assert (=> b!1218406 d!133527))

(declare-fun call!60644 () ListLongMap!18039)

(declare-fun bm!60641 () Bool)

(assert (=> bm!60641 (= call!60644 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218651 () Bool)

(declare-fun e!691900 () Bool)

(declare-fun lt!553880 () ListLongMap!18039)

(assert (=> b!1218651 (= e!691900 (isEmpty!1001 lt!553880))))

(declare-fun b!1218652 () Bool)

(declare-fun e!691903 () ListLongMap!18039)

(declare-fun e!691899 () ListLongMap!18039)

(assert (=> b!1218652 (= e!691903 e!691899)))

(declare-fun c!120140 () Bool)

(assert (=> b!1218652 (= c!120140 (validKeyInArray!0 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1218653 () Bool)

(declare-fun e!691902 () Bool)

(declare-fun e!691898 () Bool)

(assert (=> b!1218653 (= e!691902 e!691898)))

(assert (=> b!1218653 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 _keys!1208)))))

(declare-fun res!809379 () Bool)

(assert (=> b!1218653 (= res!809379 (contains!6986 lt!553880 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218653 (=> (not res!809379) (not e!691898))))

(declare-fun b!1218654 () Bool)

(assert (=> b!1218654 (= e!691902 e!691900)))

(declare-fun c!120141 () Bool)

(assert (=> b!1218654 (= c!120141 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 _keys!1208)))))

(declare-fun b!1218655 () Bool)

(assert (=> b!1218655 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 _keys!1208)))))

(assert (=> b!1218655 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38480 _values!996)))))

(assert (=> b!1218655 (= e!691898 (= (apply!965 lt!553880 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19352 (select (arr!37942 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218656 () Bool)

(declare-fun e!691901 () Bool)

(assert (=> b!1218656 (= e!691901 (validKeyInArray!0 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218656 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1218657 () Bool)

(assert (=> b!1218657 (= e!691903 (ListLongMap!18040 Nil!26848))))

(declare-fun d!133529 () Bool)

(declare-fun e!691904 () Bool)

(assert (=> d!133529 e!691904))

(declare-fun res!809381 () Bool)

(assert (=> d!133529 (=> (not res!809381) (not e!691904))))

(assert (=> d!133529 (= res!809381 (not (contains!6986 lt!553880 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133529 (= lt!553880 e!691903)))

(declare-fun c!120138 () Bool)

(assert (=> d!133529 (= c!120138 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 _keys!1208)))))

(assert (=> d!133529 (validMask!0 mask!1564)))

(assert (=> d!133529 (= (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553880)))

(declare-fun b!1218658 () Bool)

(assert (=> b!1218658 (= e!691899 call!60644)))

(declare-fun b!1218659 () Bool)

(assert (=> b!1218659 (= e!691900 (= lt!553880 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218660 () Bool)

(declare-fun res!809380 () Bool)

(assert (=> b!1218660 (=> (not res!809380) (not e!691904))))

(assert (=> b!1218660 (= res!809380 (not (contains!6986 lt!553880 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218661 () Bool)

(declare-fun lt!553883 () Unit!40245)

(declare-fun lt!553879 () Unit!40245)

(assert (=> b!1218661 (= lt!553883 lt!553879)))

(declare-fun lt!553878 () (_ BitVec 64))

(declare-fun lt!553877 () ListLongMap!18039)

(declare-fun lt!553882 () (_ BitVec 64))

(declare-fun lt!553881 () V!46409)

(assert (=> b!1218661 (not (contains!6986 (+!4103 lt!553877 (tuple2!20071 lt!553882 lt!553881)) lt!553878))))

(assert (=> b!1218661 (= lt!553879 (addStillNotContains!301 lt!553877 lt!553882 lt!553881 lt!553878))))

(assert (=> b!1218661 (= lt!553878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218661 (= lt!553881 (get!19352 (select (arr!37942 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218661 (= lt!553882 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1218661 (= lt!553877 call!60644)))

(assert (=> b!1218661 (= e!691899 (+!4103 call!60644 (tuple2!20071 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19352 (select (arr!37942 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1218662 () Bool)

(assert (=> b!1218662 (= e!691904 e!691902)))

(declare-fun c!120139 () Bool)

(assert (=> b!1218662 (= c!120139 e!691901)))

(declare-fun res!809378 () Bool)

(assert (=> b!1218662 (=> (not res!809378) (not e!691901))))

(assert (=> b!1218662 (= res!809378 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38479 _keys!1208)))))

(assert (= (and d!133529 c!120138) b!1218657))

(assert (= (and d!133529 (not c!120138)) b!1218652))

(assert (= (and b!1218652 c!120140) b!1218661))

(assert (= (and b!1218652 (not c!120140)) b!1218658))

(assert (= (or b!1218661 b!1218658) bm!60641))

(assert (= (and d!133529 res!809381) b!1218660))

(assert (= (and b!1218660 res!809380) b!1218662))

(assert (= (and b!1218662 res!809378) b!1218656))

(assert (= (and b!1218662 c!120139) b!1218653))

(assert (= (and b!1218662 (not c!120139)) b!1218654))

(assert (= (and b!1218653 res!809379) b!1218655))

(assert (= (and b!1218654 c!120141) b!1218659))

(assert (= (and b!1218654 (not c!120141)) b!1218651))

(declare-fun b_lambda!22021 () Bool)

(assert (=> (not b_lambda!22021) (not b!1218655)))

(assert (=> b!1218655 t!40077))

(declare-fun b_and!43675 () Bool)

(assert (= b_and!43673 (and (=> t!40077 result!22707) b_and!43675)))

(declare-fun b_lambda!22023 () Bool)

(assert (=> (not b_lambda!22023) (not b!1218661)))

(assert (=> b!1218661 t!40077))

(declare-fun b_and!43677 () Bool)

(assert (= b_and!43675 (and (=> t!40077 result!22707) b_and!43677)))

(declare-fun m!1122981 () Bool)

(assert (=> b!1218661 m!1122981))

(declare-fun m!1122983 () Bool)

(assert (=> b!1218661 m!1122983))

(declare-fun m!1122985 () Bool)

(assert (=> b!1218661 m!1122985))

(declare-fun m!1122987 () Bool)

(assert (=> b!1218661 m!1122987))

(declare-fun m!1122989 () Bool)

(assert (=> b!1218661 m!1122989))

(assert (=> b!1218661 m!1122707))

(assert (=> b!1218661 m!1122985))

(assert (=> b!1218661 m!1122707))

(declare-fun m!1122991 () Bool)

(assert (=> b!1218661 m!1122991))

(assert (=> b!1218661 m!1122987))

(declare-fun m!1122993 () Bool)

(assert (=> b!1218661 m!1122993))

(declare-fun m!1122995 () Bool)

(assert (=> b!1218660 m!1122995))

(declare-fun m!1122997 () Bool)

(assert (=> b!1218651 m!1122997))

(assert (=> b!1218652 m!1122981))

(assert (=> b!1218652 m!1122981))

(declare-fun m!1122999 () Bool)

(assert (=> b!1218652 m!1122999))

(declare-fun m!1123001 () Bool)

(assert (=> b!1218659 m!1123001))

(assert (=> bm!60641 m!1123001))

(assert (=> b!1218655 m!1122981))

(assert (=> b!1218655 m!1122985))

(assert (=> b!1218655 m!1122707))

(assert (=> b!1218655 m!1122985))

(assert (=> b!1218655 m!1122707))

(assert (=> b!1218655 m!1122991))

(assert (=> b!1218655 m!1122981))

(declare-fun m!1123003 () Bool)

(assert (=> b!1218655 m!1123003))

(declare-fun m!1123005 () Bool)

(assert (=> d!133529 m!1123005))

(assert (=> d!133529 m!1122719))

(assert (=> b!1218653 m!1122981))

(assert (=> b!1218653 m!1122981))

(declare-fun m!1123007 () Bool)

(assert (=> b!1218653 m!1123007))

(assert (=> b!1218656 m!1122981))

(assert (=> b!1218656 m!1122981))

(assert (=> b!1218656 m!1122999))

(assert (=> b!1218406 d!133529))

(declare-fun d!133531 () Bool)

(declare-fun lt!553886 () ListLongMap!18039)

(assert (=> d!133531 (not (contains!6986 lt!553886 k0!934))))

(declare-fun removeStrictlySorted!105 (List!26851 (_ BitVec 64)) List!26851)

(assert (=> d!133531 (= lt!553886 (ListLongMap!18040 (removeStrictlySorted!105 (toList!9035 lt!553750) k0!934)))))

(assert (=> d!133531 (= (-!1868 lt!553750 k0!934) lt!553886)))

(declare-fun bs!34303 () Bool)

(assert (= bs!34303 d!133531))

(declare-fun m!1123009 () Bool)

(assert (=> bs!34303 m!1123009))

(declare-fun m!1123011 () Bool)

(assert (=> bs!34303 m!1123011))

(assert (=> b!1218406 d!133531))

(declare-fun b!1218669 () Bool)

(declare-fun e!691909 () Bool)

(assert (=> b!1218669 (= e!691909 tp_is_empty!30961)))

(declare-fun b!1218670 () Bool)

(declare-fun e!691910 () Bool)

(assert (=> b!1218670 (= e!691910 tp_is_empty!30961)))

(declare-fun condMapEmpty!48331 () Bool)

(declare-fun mapDefault!48331 () ValueCell!14771)

(assert (=> mapNonEmpty!48322 (= condMapEmpty!48331 (= mapRest!48322 ((as const (Array (_ BitVec 32) ValueCell!14771)) mapDefault!48331)))))

(declare-fun mapRes!48331 () Bool)

(assert (=> mapNonEmpty!48322 (= tp!91798 (and e!691910 mapRes!48331))))

(declare-fun mapIsEmpty!48331 () Bool)

(assert (=> mapIsEmpty!48331 mapRes!48331))

(declare-fun mapNonEmpty!48331 () Bool)

(declare-fun tp!91814 () Bool)

(assert (=> mapNonEmpty!48331 (= mapRes!48331 (and tp!91814 e!691909))))

(declare-fun mapRest!48331 () (Array (_ BitVec 32) ValueCell!14771))

(declare-fun mapValue!48331 () ValueCell!14771)

(declare-fun mapKey!48331 () (_ BitVec 32))

(assert (=> mapNonEmpty!48331 (= mapRest!48322 (store mapRest!48331 mapKey!48331 mapValue!48331))))

(assert (= (and mapNonEmpty!48322 condMapEmpty!48331) mapIsEmpty!48331))

(assert (= (and mapNonEmpty!48322 (not condMapEmpty!48331)) mapNonEmpty!48331))

(assert (= (and mapNonEmpty!48331 ((_ is ValueCellFull!14771) mapValue!48331)) b!1218669))

(assert (= (and mapNonEmpty!48322 ((_ is ValueCellFull!14771) mapDefault!48331)) b!1218670))

(declare-fun m!1123013 () Bool)

(assert (=> mapNonEmpty!48331 m!1123013))

(declare-fun b_lambda!22025 () Bool)

(assert (= b_lambda!22019 (or (and start!101380 b_free!26257) b_lambda!22025)))

(declare-fun b_lambda!22027 () Bool)

(assert (= b_lambda!22023 (or (and start!101380 b_free!26257) b_lambda!22027)))

(declare-fun b_lambda!22029 () Bool)

(assert (= b_lambda!22011 (or (and start!101380 b_free!26257) b_lambda!22029)))

(declare-fun b_lambda!22031 () Bool)

(assert (= b_lambda!22021 (or (and start!101380 b_free!26257) b_lambda!22031)))

(declare-fun b_lambda!22033 () Bool)

(assert (= b_lambda!22009 (or (and start!101380 b_free!26257) b_lambda!22033)))

(declare-fun b_lambda!22035 () Bool)

(assert (= b_lambda!22015 (or (and start!101380 b_free!26257) b_lambda!22035)))

(declare-fun b_lambda!22037 () Bool)

(assert (= b_lambda!22017 (or (and start!101380 b_free!26257) b_lambda!22037)))

(declare-fun b_lambda!22039 () Bool)

(assert (= b_lambda!22007 (or (and start!101380 b_free!26257) b_lambda!22039)))

(declare-fun b_lambda!22041 () Bool)

(assert (= b_lambda!22013 (or (and start!101380 b_free!26257) b_lambda!22041)))

(check-sat (not b!1218586) (not b!1218628) (not b_next!26257) (not b!1218593) (not b_lambda!22035) (not b!1218634) (not b!1218594) (not b!1218656) (not bm!60640) (not bm!60631) (not bm!60628) (not bm!60639) (not b_lambda!22027) (not b_lambda!22039) (not b!1218629) (not b!1218639) (not b!1218560) (not bm!60633) (not b!1218531) (not b!1218619) (not d!133513) (not b!1218660) (not d!133531) (not bm!60641) (not mapNonEmpty!48331) (not b!1218630) (not b!1218620) (not bm!60624) (not b!1218605) (not b!1218652) (not b!1218635) (not b!1218536) (not b!1218555) (not b!1218543) b_and!43677 (not b!1218597) (not b_lambda!22033) (not b!1218607) (not b_lambda!22041) (not b!1218589) (not b!1218624) (not b!1218661) (not bm!60627) (not b!1218602) (not d!133493) (not d!133515) (not b!1218587) (not b!1218640) tp_is_empty!30961 (not b!1218537) (not b_lambda!22005) (not d!133527) (not b!1218622) (not b!1218659) (not b!1218631) (not d!133529) (not b!1218556) (not b!1218623) (not b!1218606) (not b_lambda!22031) (not b!1218653) (not b!1218595) (not d!133525) (not b!1218599) (not b!1218598) (not b_lambda!22029) (not b!1218557) (not bm!60634) (not b!1218655) (not b!1218651) (not bm!60632) (not b!1218530) (not d!133503) (not b!1218601) (not b!1218632) (not b!1218638) (not b!1218650) (not b!1218585) (not b_lambda!22037) (not b!1218590) (not b_lambda!22025))
(check-sat b_and!43677 (not b_next!26257))
