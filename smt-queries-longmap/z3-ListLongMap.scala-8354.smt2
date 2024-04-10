; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101708 () Bool)

(assert start!101708)

(declare-fun b_free!26397 () Bool)

(declare-fun b_next!26397 () Bool)

(assert (=> start!101708 (= b_free!26397 (not b_next!26397))))

(declare-fun tp!92236 () Bool)

(declare-fun b_and!44055 () Bool)

(assert (=> start!101708 (= tp!92236 b_and!44055)))

(declare-fun b!1223703 () Bool)

(declare-fun e!694997 () Bool)

(declare-fun tp_is_empty!31101 () Bool)

(assert (=> b!1223703 (= e!694997 tp_is_empty!31101)))

(declare-datatypes ((array!78985 0))(
  ( (array!78986 (arr!38119 (Array (_ BitVec 32) (_ BitVec 64))) (size!38655 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78985)

(declare-fun e!694999 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1223704 () Bool)

(declare-fun arrayContainsKey!0 (array!78985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223704 (= e!694999 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223705 () Bool)

(declare-fun e!694994 () Bool)

(assert (=> b!1223705 (= e!694994 tp_is_empty!31101)))

(declare-fun b!1223706 () Bool)

(declare-fun res!813086 () Bool)

(declare-fun e!695005 () Bool)

(assert (=> b!1223706 (=> (not res!813086) (not e!695005))))

(assert (=> b!1223706 (= res!813086 (= (select (arr!38119 _keys!1208) i!673) k0!934))))

(declare-fun b!1223707 () Bool)

(declare-fun res!813076 () Bool)

(assert (=> b!1223707 (=> (not res!813076) (not e!695005))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223707 (= res!813076 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48550 () Bool)

(declare-fun mapRes!48550 () Bool)

(assert (=> mapIsEmpty!48550 mapRes!48550))

(declare-fun b!1223708 () Bool)

(declare-fun e!695001 () Bool)

(declare-fun e!695002 () Bool)

(assert (=> b!1223708 (= e!695001 e!695002)))

(declare-fun res!813082 () Bool)

(assert (=> b!1223708 (=> res!813082 e!695002)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223708 (= res!813082 (not (validKeyInArray!0 (select (arr!38119 _keys!1208) from!1455))))))

(declare-datatypes ((V!46595 0))(
  ( (V!46596 (val!15607 Int)) )
))
(declare-datatypes ((tuple2!20110 0))(
  ( (tuple2!20111 (_1!10066 (_ BitVec 64)) (_2!10066 V!46595)) )
))
(declare-datatypes ((List!26911 0))(
  ( (Nil!26908) (Cons!26907 (h!28116 tuple2!20110) (t!40288 List!26911)) )
))
(declare-datatypes ((ListLongMap!18079 0))(
  ( (ListLongMap!18080 (toList!9055 List!26911)) )
))
(declare-fun lt!557027 () ListLongMap!18079)

(declare-fun lt!557032 () ListLongMap!18079)

(assert (=> b!1223708 (= lt!557027 lt!557032)))

(declare-fun lt!557023 () ListLongMap!18079)

(declare-fun -!1957 (ListLongMap!18079 (_ BitVec 64)) ListLongMap!18079)

(assert (=> b!1223708 (= lt!557032 (-!1957 lt!557023 k0!934))))

(declare-fun zeroValue!944 () V!46595)

(declare-datatypes ((ValueCell!14841 0))(
  ( (ValueCellFull!14841 (v!18269 V!46595)) (EmptyCell!14841) )
))
(declare-datatypes ((array!78987 0))(
  ( (array!78988 (arr!38120 (Array (_ BitVec 32) ValueCell!14841)) (size!38656 (_ BitVec 32))) )
))
(declare-fun lt!557033 () array!78987)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557026 () array!78985)

(declare-fun minValue!944 () V!46595)

(declare-fun getCurrentListMapNoExtraKeys!5477 (array!78985 array!78987 (_ BitVec 32) (_ BitVec 32) V!46595 V!46595 (_ BitVec 32) Int) ListLongMap!18079)

(assert (=> b!1223708 (= lt!557027 (getCurrentListMapNoExtraKeys!5477 lt!557026 lt!557033 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78987)

(assert (=> b!1223708 (= lt!557023 (getCurrentListMapNoExtraKeys!5477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40540 0))(
  ( (Unit!40541) )
))
(declare-fun lt!557029 () Unit!40540)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1164 (array!78985 array!78987 (_ BitVec 32) (_ BitVec 32) V!46595 V!46595 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40540)

(assert (=> b!1223708 (= lt!557029 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1164 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223709 () Bool)

(declare-fun res!813087 () Bool)

(declare-fun e!694996 () Bool)

(assert (=> b!1223709 (=> (not res!813087) (not e!694996))))

(declare-datatypes ((List!26912 0))(
  ( (Nil!26909) (Cons!26908 (h!28117 (_ BitVec 64)) (t!40289 List!26912)) )
))
(declare-fun arrayNoDuplicates!0 (array!78985 (_ BitVec 32) List!26912) Bool)

(assert (=> b!1223709 (= res!813087 (arrayNoDuplicates!0 lt!557026 #b00000000000000000000000000000000 Nil!26909))))

(declare-fun b!1223710 () Bool)

(declare-fun res!813078 () Bool)

(assert (=> b!1223710 (=> (not res!813078) (not e!695005))))

(assert (=> b!1223710 (= res!813078 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38655 _keys!1208))))))

(declare-fun b!1223711 () Bool)

(declare-fun e!694995 () Bool)

(assert (=> b!1223711 (= e!694996 (not e!694995))))

(declare-fun res!813085 () Bool)

(assert (=> b!1223711 (=> res!813085 e!694995)))

(assert (=> b!1223711 (= res!813085 (bvsgt from!1455 i!673))))

(assert (=> b!1223711 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557034 () Unit!40540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78985 (_ BitVec 64) (_ BitVec 32)) Unit!40540)

(assert (=> b!1223711 (= lt!557034 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223712 () Bool)

(declare-fun res!813090 () Bool)

(assert (=> b!1223712 (=> (not res!813090) (not e!695005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78985 (_ BitVec 32)) Bool)

(assert (=> b!1223712 (= res!813090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223713 () Bool)

(assert (=> b!1223713 (= e!695005 e!694996)))

(declare-fun res!813077 () Bool)

(assert (=> b!1223713 (=> (not res!813077) (not e!694996))))

(assert (=> b!1223713 (= res!813077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557026 mask!1564))))

(assert (=> b!1223713 (= lt!557026 (array!78986 (store (arr!38119 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38655 _keys!1208)))))

(declare-fun res!813091 () Bool)

(assert (=> start!101708 (=> (not res!813091) (not e!695005))))

(assert (=> start!101708 (= res!813091 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38655 _keys!1208))))))

(assert (=> start!101708 e!695005))

(assert (=> start!101708 tp_is_empty!31101))

(declare-fun array_inv!29000 (array!78985) Bool)

(assert (=> start!101708 (array_inv!29000 _keys!1208)))

(assert (=> start!101708 true))

(assert (=> start!101708 tp!92236))

(declare-fun e!694993 () Bool)

(declare-fun array_inv!29001 (array!78987) Bool)

(assert (=> start!101708 (and (array_inv!29001 _values!996) e!694993)))

(declare-fun b!1223702 () Bool)

(declare-fun res!813084 () Bool)

(assert (=> b!1223702 (=> (not res!813084) (not e!695005))))

(assert (=> b!1223702 (= res!813084 (validKeyInArray!0 k0!934))))

(declare-fun b!1223714 () Bool)

(declare-fun res!813080 () Bool)

(assert (=> b!1223714 (=> (not res!813080) (not e!695005))))

(assert (=> b!1223714 (= res!813080 (and (= (size!38656 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38655 _keys!1208) (size!38656 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223715 () Bool)

(assert (=> b!1223715 (= e!694993 (and e!694997 mapRes!48550))))

(declare-fun condMapEmpty!48550 () Bool)

(declare-fun mapDefault!48550 () ValueCell!14841)

(assert (=> b!1223715 (= condMapEmpty!48550 (= (arr!38120 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14841)) mapDefault!48550)))))

(declare-fun b!1223716 () Bool)

(declare-fun e!695003 () Unit!40540)

(declare-fun Unit!40542 () Unit!40540)

(assert (=> b!1223716 (= e!695003 Unit!40542)))

(declare-fun lt!557030 () Unit!40540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78985 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40540)

(assert (=> b!1223716 (= lt!557030 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223716 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557024 () Unit!40540)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78985 (_ BitVec 32) (_ BitVec 32)) Unit!40540)

(assert (=> b!1223716 (= lt!557024 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223716 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26909)))

(declare-fun lt!557031 () Unit!40540)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78985 (_ BitVec 64) (_ BitVec 32) List!26912) Unit!40540)

(assert (=> b!1223716 (= lt!557031 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26909))))

(assert (=> b!1223716 false))

(declare-fun b!1223717 () Bool)

(declare-fun e!694998 () Bool)

(assert (=> b!1223717 (= e!694998 e!694999)))

(declare-fun res!813081 () Bool)

(assert (=> b!1223717 (=> res!813081 e!694999)))

(assert (=> b!1223717 (= res!813081 (not (= (select (arr!38119 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!48550 () Bool)

(declare-fun tp!92237 () Bool)

(assert (=> mapNonEmpty!48550 (= mapRes!48550 (and tp!92237 e!694994))))

(declare-fun mapRest!48550 () (Array (_ BitVec 32) ValueCell!14841))

(declare-fun mapValue!48550 () ValueCell!14841)

(declare-fun mapKey!48550 () (_ BitVec 32))

(assert (=> mapNonEmpty!48550 (= (arr!38120 _values!996) (store mapRest!48550 mapKey!48550 mapValue!48550))))

(declare-fun b!1223718 () Bool)

(assert (=> b!1223718 (= e!695002 (bvslt i!673 (size!38656 _values!996)))))

(declare-fun e!695000 () Bool)

(assert (=> b!1223718 e!695000))

(declare-fun res!813079 () Bool)

(assert (=> b!1223718 (=> (not res!813079) (not e!695000))))

(assert (=> b!1223718 (= res!813079 (not (= (select (arr!38119 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557035 () Unit!40540)

(assert (=> b!1223718 (= lt!557035 e!695003)))

(declare-fun c!120416 () Bool)

(assert (=> b!1223718 (= c!120416 (= (select (arr!38119 _keys!1208) from!1455) k0!934))))

(assert (=> b!1223718 e!694998))

(declare-fun res!813083 () Bool)

(assert (=> b!1223718 (=> (not res!813083) (not e!694998))))

(declare-fun lt!557036 () ListLongMap!18079)

(declare-fun lt!557028 () tuple2!20110)

(declare-fun +!4113 (ListLongMap!18079 tuple2!20110) ListLongMap!18079)

(assert (=> b!1223718 (= res!813083 (= lt!557036 (+!4113 lt!557032 lt!557028)))))

(declare-fun lt!557022 () V!46595)

(declare-fun get!19466 (ValueCell!14841 V!46595) V!46595)

(assert (=> b!1223718 (= lt!557028 (tuple2!20111 (select (arr!38119 _keys!1208) from!1455) (get!19466 (select (arr!38120 _values!996) from!1455) lt!557022)))))

(declare-fun b!1223719 () Bool)

(declare-fun lt!557025 () ListLongMap!18079)

(assert (=> b!1223719 (= e!695000 (= lt!557025 (+!4113 lt!557023 lt!557028)))))

(declare-fun b!1223720 () Bool)

(declare-fun res!813088 () Bool)

(assert (=> b!1223720 (=> (not res!813088) (not e!695005))))

(assert (=> b!1223720 (= res!813088 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26909))))

(declare-fun b!1223721 () Bool)

(declare-fun Unit!40543 () Unit!40540)

(assert (=> b!1223721 (= e!695003 Unit!40543)))

(declare-fun b!1223722 () Bool)

(assert (=> b!1223722 (= e!694995 e!695001)))

(declare-fun res!813089 () Bool)

(assert (=> b!1223722 (=> res!813089 e!695001)))

(assert (=> b!1223722 (= res!813089 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1223722 (= lt!557036 (getCurrentListMapNoExtraKeys!5477 lt!557026 lt!557033 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223722 (= lt!557033 (array!78988 (store (arr!38120 _values!996) i!673 (ValueCellFull!14841 lt!557022)) (size!38656 _values!996)))))

(declare-fun dynLambda!3350 (Int (_ BitVec 64)) V!46595)

(assert (=> b!1223722 (= lt!557022 (dynLambda!3350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1223722 (= lt!557025 (getCurrentListMapNoExtraKeys!5477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101708 res!813091) b!1223707))

(assert (= (and b!1223707 res!813076) b!1223714))

(assert (= (and b!1223714 res!813080) b!1223712))

(assert (= (and b!1223712 res!813090) b!1223720))

(assert (= (and b!1223720 res!813088) b!1223710))

(assert (= (and b!1223710 res!813078) b!1223702))

(assert (= (and b!1223702 res!813084) b!1223706))

(assert (= (and b!1223706 res!813086) b!1223713))

(assert (= (and b!1223713 res!813077) b!1223709))

(assert (= (and b!1223709 res!813087) b!1223711))

(assert (= (and b!1223711 (not res!813085)) b!1223722))

(assert (= (and b!1223722 (not res!813089)) b!1223708))

(assert (= (and b!1223708 (not res!813082)) b!1223718))

(assert (= (and b!1223718 res!813083) b!1223717))

(assert (= (and b!1223717 (not res!813081)) b!1223704))

(assert (= (and b!1223718 c!120416) b!1223716))

(assert (= (and b!1223718 (not c!120416)) b!1223721))

(assert (= (and b!1223718 res!813079) b!1223719))

(assert (= (and b!1223715 condMapEmpty!48550) mapIsEmpty!48550))

(assert (= (and b!1223715 (not condMapEmpty!48550)) mapNonEmpty!48550))

(get-info :version)

(assert (= (and mapNonEmpty!48550 ((_ is ValueCellFull!14841) mapValue!48550)) b!1223705))

(assert (= (and b!1223715 ((_ is ValueCellFull!14841) mapDefault!48550)) b!1223703))

(assert (= start!101708 b!1223715))

(declare-fun b_lambda!22377 () Bool)

(assert (=> (not b_lambda!22377) (not b!1223722)))

(declare-fun t!40287 () Bool)

(declare-fun tb!11197 () Bool)

(assert (=> (and start!101708 (= defaultEntry!1004 defaultEntry!1004) t!40287) tb!11197))

(declare-fun result!23007 () Bool)

(assert (=> tb!11197 (= result!23007 tp_is_empty!31101)))

(assert (=> b!1223722 t!40287))

(declare-fun b_and!44057 () Bool)

(assert (= b_and!44055 (and (=> t!40287 result!23007) b_and!44057)))

(declare-fun m!1128713 () Bool)

(assert (=> b!1223716 m!1128713))

(declare-fun m!1128715 () Bool)

(assert (=> b!1223716 m!1128715))

(declare-fun m!1128717 () Bool)

(assert (=> b!1223716 m!1128717))

(declare-fun m!1128719 () Bool)

(assert (=> b!1223716 m!1128719))

(declare-fun m!1128721 () Bool)

(assert (=> b!1223716 m!1128721))

(declare-fun m!1128723 () Bool)

(assert (=> b!1223702 m!1128723))

(declare-fun m!1128725 () Bool)

(assert (=> b!1223719 m!1128725))

(declare-fun m!1128727 () Bool)

(assert (=> b!1223704 m!1128727))

(declare-fun m!1128729 () Bool)

(assert (=> b!1223711 m!1128729))

(declare-fun m!1128731 () Bool)

(assert (=> b!1223711 m!1128731))

(declare-fun m!1128733 () Bool)

(assert (=> start!101708 m!1128733))

(declare-fun m!1128735 () Bool)

(assert (=> start!101708 m!1128735))

(declare-fun m!1128737 () Bool)

(assert (=> b!1223713 m!1128737))

(declare-fun m!1128739 () Bool)

(assert (=> b!1223713 m!1128739))

(declare-fun m!1128741 () Bool)

(assert (=> b!1223720 m!1128741))

(declare-fun m!1128743 () Bool)

(assert (=> b!1223708 m!1128743))

(declare-fun m!1128745 () Bool)

(assert (=> b!1223708 m!1128745))

(declare-fun m!1128747 () Bool)

(assert (=> b!1223708 m!1128747))

(declare-fun m!1128749 () Bool)

(assert (=> b!1223708 m!1128749))

(assert (=> b!1223708 m!1128747))

(declare-fun m!1128751 () Bool)

(assert (=> b!1223708 m!1128751))

(declare-fun m!1128753 () Bool)

(assert (=> b!1223708 m!1128753))

(assert (=> b!1223717 m!1128747))

(declare-fun m!1128755 () Bool)

(assert (=> b!1223709 m!1128755))

(declare-fun m!1128757 () Bool)

(assert (=> b!1223706 m!1128757))

(declare-fun m!1128759 () Bool)

(assert (=> mapNonEmpty!48550 m!1128759))

(declare-fun m!1128761 () Bool)

(assert (=> b!1223712 m!1128761))

(declare-fun m!1128763 () Bool)

(assert (=> b!1223707 m!1128763))

(assert (=> b!1223718 m!1128747))

(declare-fun m!1128765 () Bool)

(assert (=> b!1223718 m!1128765))

(declare-fun m!1128767 () Bool)

(assert (=> b!1223718 m!1128767))

(assert (=> b!1223718 m!1128767))

(declare-fun m!1128769 () Bool)

(assert (=> b!1223718 m!1128769))

(declare-fun m!1128771 () Bool)

(assert (=> b!1223722 m!1128771))

(declare-fun m!1128773 () Bool)

(assert (=> b!1223722 m!1128773))

(declare-fun m!1128775 () Bool)

(assert (=> b!1223722 m!1128775))

(declare-fun m!1128777 () Bool)

(assert (=> b!1223722 m!1128777))

(check-sat (not b!1223720) b_and!44057 (not b!1223711) (not b_next!26397) (not b_lambda!22377) (not b!1223704) (not b!1223722) (not start!101708) tp_is_empty!31101 (not b!1223719) (not b!1223709) (not b!1223712) (not mapNonEmpty!48550) (not b!1223718) (not b!1223708) (not b!1223716) (not b!1223707) (not b!1223713) (not b!1223702))
(check-sat b_and!44057 (not b_next!26397))
