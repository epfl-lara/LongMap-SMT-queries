; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101520 () Bool)

(assert start!101520)

(declare-fun b_free!26307 () Bool)

(declare-fun b_next!26307 () Bool)

(assert (=> start!101520 (= b_free!26307 (not b_next!26307))))

(declare-fun tp!91957 () Bool)

(declare-fun b_and!43821 () Bool)

(assert (=> start!101520 (= tp!91957 b_and!43821)))

(declare-fun b!1220406 () Bool)

(declare-fun res!810661 () Bool)

(declare-fun e!692987 () Bool)

(assert (=> b!1220406 (=> (not res!810661) (not e!692987))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!78801 0))(
  ( (array!78802 (arr!38030 (Array (_ BitVec 32) (_ BitVec 64))) (size!38566 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78801)

(assert (=> b!1220406 (= res!810661 (= (select (arr!38030 _keys!1208) i!673) k0!934))))

(declare-fun b!1220407 () Bool)

(declare-fun res!810653 () Bool)

(assert (=> b!1220407 (=> (not res!810653) (not e!692987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220407 (= res!810653 (validKeyInArray!0 k0!934))))

(declare-fun b!1220408 () Bool)

(declare-fun res!810654 () Bool)

(assert (=> b!1220408 (=> (not res!810654) (not e!692987))))

(assert (=> b!1220408 (= res!810654 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38566 _keys!1208))))))

(declare-fun b!1220409 () Bool)

(declare-fun e!692994 () Bool)

(declare-fun e!692992 () Bool)

(assert (=> b!1220409 (= e!692994 e!692992)))

(declare-fun res!810658 () Bool)

(assert (=> b!1220409 (=> res!810658 e!692992)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220409 (= res!810658 (not (= (select (arr!38030 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692990 () Bool)

(assert (=> b!1220409 e!692990))

(declare-fun res!810660 () Bool)

(assert (=> b!1220409 (=> (not res!810660) (not e!692990))))

(declare-datatypes ((V!46475 0))(
  ( (V!46476 (val!15562 Int)) )
))
(declare-fun lt!554985 () V!46475)

(declare-datatypes ((tuple2!20034 0))(
  ( (tuple2!20035 (_1!10028 (_ BitVec 64)) (_2!10028 V!46475)) )
))
(declare-datatypes ((List!26834 0))(
  ( (Nil!26831) (Cons!26830 (h!28039 tuple2!20034) (t!40121 List!26834)) )
))
(declare-datatypes ((ListLongMap!18003 0))(
  ( (ListLongMap!18004 (toList!9017 List!26834)) )
))
(declare-fun lt!554983 () ListLongMap!18003)

(declare-datatypes ((ValueCell!14796 0))(
  ( (ValueCellFull!14796 (v!18220 V!46475)) (EmptyCell!14796) )
))
(declare-datatypes ((array!78803 0))(
  ( (array!78804 (arr!38031 (Array (_ BitVec 32) ValueCell!14796)) (size!38567 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78803)

(declare-fun lt!554981 () ListLongMap!18003)

(declare-fun +!4084 (ListLongMap!18003 tuple2!20034) ListLongMap!18003)

(declare-fun get!19403 (ValueCell!14796 V!46475) V!46475)

(assert (=> b!1220409 (= res!810660 (= lt!554981 (+!4084 lt!554983 (tuple2!20035 (select (arr!38030 _keys!1208) from!1455) (get!19403 (select (arr!38031 _values!996) from!1455) lt!554985)))))))

(declare-fun b!1220410 () Bool)

(declare-fun e!692991 () Bool)

(declare-fun tp_is_empty!31011 () Bool)

(assert (=> b!1220410 (= e!692991 tp_is_empty!31011)))

(declare-fun mapIsEmpty!48406 () Bool)

(declare-fun mapRes!48406 () Bool)

(assert (=> mapIsEmpty!48406 mapRes!48406))

(declare-fun b!1220411 () Bool)

(declare-fun res!810664 () Bool)

(assert (=> b!1220411 (=> (not res!810664) (not e!692987))))

(declare-datatypes ((List!26835 0))(
  ( (Nil!26832) (Cons!26831 (h!28040 (_ BitVec 64)) (t!40122 List!26835)) )
))
(declare-fun arrayNoDuplicates!0 (array!78801 (_ BitVec 32) List!26835) Bool)

(assert (=> b!1220411 (= res!810664 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26832))))

(declare-fun b!1220412 () Bool)

(declare-fun res!810657 () Bool)

(assert (=> b!1220412 (=> (not res!810657) (not e!692987))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220412 (= res!810657 (validMask!0 mask!1564))))

(declare-fun b!1220413 () Bool)

(declare-fun e!692993 () Bool)

(declare-fun e!692988 () Bool)

(assert (=> b!1220413 (= e!692993 e!692988)))

(declare-fun res!810656 () Bool)

(assert (=> b!1220413 (=> res!810656 e!692988)))

(assert (=> b!1220413 (= res!810656 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554980 () array!78801)

(declare-fun minValue!944 () V!46475)

(declare-fun lt!554989 () array!78803)

(declare-fun zeroValue!944 () V!46475)

(declare-fun getCurrentListMapNoExtraKeys!5440 (array!78801 array!78803 (_ BitVec 32) (_ BitVec 32) V!46475 V!46475 (_ BitVec 32) Int) ListLongMap!18003)

(assert (=> b!1220413 (= lt!554981 (getCurrentListMapNoExtraKeys!5440 lt!554980 lt!554989 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220413 (= lt!554989 (array!78804 (store (arr!38031 _values!996) i!673 (ValueCellFull!14796 lt!554985)) (size!38567 _values!996)))))

(declare-fun dynLambda!3321 (Int (_ BitVec 64)) V!46475)

(assert (=> b!1220413 (= lt!554985 (dynLambda!3321 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554991 () ListLongMap!18003)

(assert (=> b!1220413 (= lt!554991 (getCurrentListMapNoExtraKeys!5440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220414 () Bool)

(assert (=> b!1220414 (= e!692992 true)))

(assert (=> b!1220414 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26832)))

(declare-datatypes ((Unit!40436 0))(
  ( (Unit!40437) )
))
(declare-fun lt!554984 () Unit!40436)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78801 (_ BitVec 32) (_ BitVec 32)) Unit!40436)

(assert (=> b!1220414 (= lt!554984 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220414 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554986 () Unit!40436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78801 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40436)

(assert (=> b!1220414 (= lt!554986 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220415 () Bool)

(declare-fun e!692998 () Bool)

(assert (=> b!1220415 (= e!692998 tp_is_empty!31011)))

(declare-fun b!1220416 () Bool)

(declare-fun e!692995 () Bool)

(assert (=> b!1220416 (= e!692995 (not e!692993))))

(declare-fun res!810652 () Bool)

(assert (=> b!1220416 (=> res!810652 e!692993)))

(assert (=> b!1220416 (= res!810652 (bvsgt from!1455 i!673))))

(assert (=> b!1220416 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554987 () Unit!40436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78801 (_ BitVec 64) (_ BitVec 32)) Unit!40436)

(assert (=> b!1220416 (= lt!554987 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!692997 () Bool)

(declare-fun b!1220417 () Bool)

(assert (=> b!1220417 (= e!692997 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220418 () Bool)

(assert (=> b!1220418 (= e!692988 e!692994)))

(declare-fun res!810662 () Bool)

(assert (=> b!1220418 (=> res!810662 e!692994)))

(assert (=> b!1220418 (= res!810662 (not (validKeyInArray!0 (select (arr!38030 _keys!1208) from!1455))))))

(declare-fun lt!554988 () ListLongMap!18003)

(assert (=> b!1220418 (= lt!554988 lt!554983)))

(declare-fun lt!554990 () ListLongMap!18003)

(declare-fun -!1926 (ListLongMap!18003 (_ BitVec 64)) ListLongMap!18003)

(assert (=> b!1220418 (= lt!554983 (-!1926 lt!554990 k0!934))))

(assert (=> b!1220418 (= lt!554988 (getCurrentListMapNoExtraKeys!5440 lt!554980 lt!554989 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220418 (= lt!554990 (getCurrentListMapNoExtraKeys!5440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554982 () Unit!40436)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1133 (array!78801 array!78803 (_ BitVec 32) (_ BitVec 32) V!46475 V!46475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40436)

(assert (=> b!1220418 (= lt!554982 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220419 () Bool)

(declare-fun res!810665 () Bool)

(assert (=> b!1220419 (=> (not res!810665) (not e!692987))))

(assert (=> b!1220419 (= res!810665 (and (= (size!38567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38566 _keys!1208) (size!38567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220420 () Bool)

(declare-fun e!692996 () Bool)

(assert (=> b!1220420 (= e!692996 (and e!692991 mapRes!48406))))

(declare-fun condMapEmpty!48406 () Bool)

(declare-fun mapDefault!48406 () ValueCell!14796)

(assert (=> b!1220420 (= condMapEmpty!48406 (= (arr!38031 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14796)) mapDefault!48406)))))

(declare-fun res!810655 () Bool)

(assert (=> start!101520 (=> (not res!810655) (not e!692987))))

(assert (=> start!101520 (= res!810655 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38566 _keys!1208))))))

(assert (=> start!101520 e!692987))

(assert (=> start!101520 tp_is_empty!31011))

(declare-fun array_inv!28940 (array!78801) Bool)

(assert (=> start!101520 (array_inv!28940 _keys!1208)))

(assert (=> start!101520 true))

(assert (=> start!101520 tp!91957))

(declare-fun array_inv!28941 (array!78803) Bool)

(assert (=> start!101520 (and (array_inv!28941 _values!996) e!692996)))

(declare-fun mapNonEmpty!48406 () Bool)

(declare-fun tp!91958 () Bool)

(assert (=> mapNonEmpty!48406 (= mapRes!48406 (and tp!91958 e!692998))))

(declare-fun mapKey!48406 () (_ BitVec 32))

(declare-fun mapValue!48406 () ValueCell!14796)

(declare-fun mapRest!48406 () (Array (_ BitVec 32) ValueCell!14796))

(assert (=> mapNonEmpty!48406 (= (arr!38031 _values!996) (store mapRest!48406 mapKey!48406 mapValue!48406))))

(declare-fun b!1220421 () Bool)

(declare-fun res!810663 () Bool)

(assert (=> b!1220421 (=> (not res!810663) (not e!692995))))

(assert (=> b!1220421 (= res!810663 (arrayNoDuplicates!0 lt!554980 #b00000000000000000000000000000000 Nil!26832))))

(declare-fun b!1220422 () Bool)

(assert (=> b!1220422 (= e!692987 e!692995)))

(declare-fun res!810651 () Bool)

(assert (=> b!1220422 (=> (not res!810651) (not e!692995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78801 (_ BitVec 32)) Bool)

(assert (=> b!1220422 (= res!810651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554980 mask!1564))))

(assert (=> b!1220422 (= lt!554980 (array!78802 (store (arr!38030 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38566 _keys!1208)))))

(declare-fun b!1220423 () Bool)

(assert (=> b!1220423 (= e!692990 e!692997)))

(declare-fun res!810666 () Bool)

(assert (=> b!1220423 (=> res!810666 e!692997)))

(assert (=> b!1220423 (= res!810666 (not (= (select (arr!38030 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220424 () Bool)

(declare-fun res!810659 () Bool)

(assert (=> b!1220424 (=> (not res!810659) (not e!692987))))

(assert (=> b!1220424 (= res!810659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101520 res!810655) b!1220412))

(assert (= (and b!1220412 res!810657) b!1220419))

(assert (= (and b!1220419 res!810665) b!1220424))

(assert (= (and b!1220424 res!810659) b!1220411))

(assert (= (and b!1220411 res!810664) b!1220408))

(assert (= (and b!1220408 res!810654) b!1220407))

(assert (= (and b!1220407 res!810653) b!1220406))

(assert (= (and b!1220406 res!810661) b!1220422))

(assert (= (and b!1220422 res!810651) b!1220421))

(assert (= (and b!1220421 res!810663) b!1220416))

(assert (= (and b!1220416 (not res!810652)) b!1220413))

(assert (= (and b!1220413 (not res!810656)) b!1220418))

(assert (= (and b!1220418 (not res!810662)) b!1220409))

(assert (= (and b!1220409 res!810660) b!1220423))

(assert (= (and b!1220423 (not res!810666)) b!1220417))

(assert (= (and b!1220409 (not res!810658)) b!1220414))

(assert (= (and b!1220420 condMapEmpty!48406) mapIsEmpty!48406))

(assert (= (and b!1220420 (not condMapEmpty!48406)) mapNonEmpty!48406))

(get-info :version)

(assert (= (and mapNonEmpty!48406 ((_ is ValueCellFull!14796) mapValue!48406)) b!1220415))

(assert (= (and b!1220420 ((_ is ValueCellFull!14796) mapDefault!48406)) b!1220410))

(assert (= start!101520 b!1220420))

(declare-fun b_lambda!22173 () Bool)

(assert (=> (not b_lambda!22173) (not b!1220413)))

(declare-fun t!40120 () Bool)

(declare-fun tb!11107 () Bool)

(assert (=> (and start!101520 (= defaultEntry!1004 defaultEntry!1004) t!40120) tb!11107))

(declare-fun result!22821 () Bool)

(assert (=> tb!11107 (= result!22821 tp_is_empty!31011)))

(assert (=> b!1220413 t!40120))

(declare-fun b_and!43823 () Bool)

(assert (= b_and!43821 (and (=> t!40120 result!22821) b_and!43823)))

(declare-fun m!1125221 () Bool)

(assert (=> b!1220416 m!1125221))

(declare-fun m!1125223 () Bool)

(assert (=> b!1220416 m!1125223))

(declare-fun m!1125225 () Bool)

(assert (=> b!1220406 m!1125225))

(declare-fun m!1125227 () Bool)

(assert (=> b!1220417 m!1125227))

(declare-fun m!1125229 () Bool)

(assert (=> b!1220414 m!1125229))

(declare-fun m!1125231 () Bool)

(assert (=> b!1220414 m!1125231))

(declare-fun m!1125233 () Bool)

(assert (=> b!1220414 m!1125233))

(declare-fun m!1125235 () Bool)

(assert (=> b!1220414 m!1125235))

(declare-fun m!1125237 () Bool)

(assert (=> b!1220418 m!1125237))

(declare-fun m!1125239 () Bool)

(assert (=> b!1220418 m!1125239))

(declare-fun m!1125241 () Bool)

(assert (=> b!1220418 m!1125241))

(declare-fun m!1125243 () Bool)

(assert (=> b!1220418 m!1125243))

(declare-fun m!1125245 () Bool)

(assert (=> b!1220418 m!1125245))

(declare-fun m!1125247 () Bool)

(assert (=> b!1220418 m!1125247))

(assert (=> b!1220418 m!1125243))

(declare-fun m!1125249 () Bool)

(assert (=> b!1220422 m!1125249))

(declare-fun m!1125251 () Bool)

(assert (=> b!1220422 m!1125251))

(assert (=> b!1220409 m!1125243))

(declare-fun m!1125253 () Bool)

(assert (=> b!1220409 m!1125253))

(assert (=> b!1220409 m!1125253))

(declare-fun m!1125255 () Bool)

(assert (=> b!1220409 m!1125255))

(declare-fun m!1125257 () Bool)

(assert (=> b!1220409 m!1125257))

(declare-fun m!1125259 () Bool)

(assert (=> b!1220413 m!1125259))

(declare-fun m!1125261 () Bool)

(assert (=> b!1220413 m!1125261))

(declare-fun m!1125263 () Bool)

(assert (=> b!1220413 m!1125263))

(declare-fun m!1125265 () Bool)

(assert (=> b!1220413 m!1125265))

(declare-fun m!1125267 () Bool)

(assert (=> start!101520 m!1125267))

(declare-fun m!1125269 () Bool)

(assert (=> start!101520 m!1125269))

(assert (=> b!1220423 m!1125243))

(declare-fun m!1125271 () Bool)

(assert (=> b!1220424 m!1125271))

(declare-fun m!1125273 () Bool)

(assert (=> b!1220412 m!1125273))

(declare-fun m!1125275 () Bool)

(assert (=> b!1220411 m!1125275))

(declare-fun m!1125277 () Bool)

(assert (=> b!1220421 m!1125277))

(declare-fun m!1125279 () Bool)

(assert (=> b!1220407 m!1125279))

(declare-fun m!1125281 () Bool)

(assert (=> mapNonEmpty!48406 m!1125281))

(check-sat (not b!1220424) tp_is_empty!31011 (not b!1220411) (not b!1220421) (not b!1220422) (not b_lambda!22173) (not b!1220416) (not b!1220413) (not b_next!26307) b_and!43823 (not b!1220409) (not b!1220412) (not b!1220417) (not b!1220414) (not mapNonEmpty!48406) (not b!1220418) (not b!1220407) (not start!101520))
(check-sat b_and!43823 (not b_next!26307))
