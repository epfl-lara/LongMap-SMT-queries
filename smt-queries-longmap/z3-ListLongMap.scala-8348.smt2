; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101632 () Bool)

(assert start!101632)

(declare-fun b_free!26359 () Bool)

(declare-fun b_next!26359 () Bool)

(assert (=> start!101632 (= b_free!26359 (not b_next!26359))))

(declare-fun tp!92120 () Bool)

(declare-fun b_and!43943 () Bool)

(assert (=> start!101632 (= tp!92120 b_and!43943)))

(declare-fun b!1222247 () Bool)

(declare-fun e!694127 () Bool)

(declare-fun e!694131 () Bool)

(assert (=> b!1222247 (= e!694127 e!694131)))

(declare-fun res!812083 () Bool)

(assert (=> b!1222247 (=> res!812083 e!694131)))

(declare-datatypes ((array!78830 0))(
  ( (array!78831 (arr!38043 (Array (_ BitVec 32) (_ BitVec 64))) (size!38581 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78830)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222247 (= res!812083 (not (validKeyInArray!0 (select (arr!38043 _keys!1208) from!1455))))))

(declare-datatypes ((V!46545 0))(
  ( (V!46546 (val!15588 Int)) )
))
(declare-datatypes ((tuple2!20160 0))(
  ( (tuple2!20161 (_1!10091 (_ BitVec 64)) (_2!10091 V!46545)) )
))
(declare-datatypes ((List!26937 0))(
  ( (Nil!26934) (Cons!26933 (h!28142 tuple2!20160) (t!40267 List!26937)) )
))
(declare-datatypes ((ListLongMap!18129 0))(
  ( (ListLongMap!18130 (toList!9080 List!26937)) )
))
(declare-fun lt!555941 () ListLongMap!18129)

(declare-fun lt!555942 () ListLongMap!18129)

(assert (=> b!1222247 (= lt!555941 lt!555942)))

(declare-fun lt!555939 () ListLongMap!18129)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1905 (ListLongMap!18129 (_ BitVec 64)) ListLongMap!18129)

(assert (=> b!1222247 (= lt!555942 (-!1905 lt!555939 k0!934))))

(declare-fun zeroValue!944 () V!46545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14822 0))(
  ( (ValueCellFull!14822 (v!18248 V!46545)) (EmptyCell!14822) )
))
(declare-datatypes ((array!78832 0))(
  ( (array!78833 (arr!38044 (Array (_ BitVec 32) ValueCell!14822)) (size!38582 (_ BitVec 32))) )
))
(declare-fun lt!555934 () array!78832)

(declare-fun lt!555932 () array!78830)

(declare-fun minValue!944 () V!46545)

(declare-fun getCurrentListMapNoExtraKeys!5514 (array!78830 array!78832 (_ BitVec 32) (_ BitVec 32) V!46545 V!46545 (_ BitVec 32) Int) ListLongMap!18129)

(assert (=> b!1222247 (= lt!555941 (getCurrentListMapNoExtraKeys!5514 lt!555932 lt!555934 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78832)

(assert (=> b!1222247 (= lt!555939 (getCurrentListMapNoExtraKeys!5514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40327 0))(
  ( (Unit!40328) )
))
(declare-fun lt!555933 () Unit!40327)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 (array!78830 array!78832 (_ BitVec 32) (_ BitVec 32) V!46545 V!46545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40327)

(assert (=> b!1222247 (= lt!555933 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222248 () Bool)

(declare-fun e!694132 () Bool)

(declare-fun arrayContainsKey!0 (array!78830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222248 (= e!694132 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222249 () Bool)

(declare-fun e!694129 () Unit!40327)

(declare-fun Unit!40329 () Unit!40327)

(assert (=> b!1222249 (= e!694129 Unit!40329)))

(declare-fun lt!555936 () Unit!40327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78830 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40327)

(assert (=> b!1222249 (= lt!555936 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222249 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555945 () Unit!40327)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78830 (_ BitVec 32) (_ BitVec 32)) Unit!40327)

(assert (=> b!1222249 (= lt!555945 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26938 0))(
  ( (Nil!26935) (Cons!26934 (h!28143 (_ BitVec 64)) (t!40268 List!26938)) )
))
(declare-fun arrayNoDuplicates!0 (array!78830 (_ BitVec 32) List!26938) Bool)

(assert (=> b!1222249 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26935)))

(declare-fun lt!555937 () Unit!40327)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78830 (_ BitVec 64) (_ BitVec 32) List!26938) Unit!40327)

(assert (=> b!1222249 (= lt!555937 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26935))))

(assert (=> b!1222249 false))

(declare-fun b!1222250 () Bool)

(declare-fun res!812082 () Bool)

(declare-fun e!694123 () Bool)

(assert (=> b!1222250 (=> (not res!812082) (not e!694123))))

(assert (=> b!1222250 (= res!812082 (and (= (size!38582 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38581 _keys!1208) (size!38582 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222251 () Bool)

(declare-fun res!812089 () Bool)

(assert (=> b!1222251 (=> (not res!812089) (not e!694123))))

(assert (=> b!1222251 (= res!812089 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38581 _keys!1208))))))

(declare-fun mapNonEmpty!48490 () Bool)

(declare-fun mapRes!48490 () Bool)

(declare-fun tp!92119 () Bool)

(declare-fun e!694134 () Bool)

(assert (=> mapNonEmpty!48490 (= mapRes!48490 (and tp!92119 e!694134))))

(declare-fun mapValue!48490 () ValueCell!14822)

(declare-fun mapRest!48490 () (Array (_ BitVec 32) ValueCell!14822))

(declare-fun mapKey!48490 () (_ BitVec 32))

(assert (=> mapNonEmpty!48490 (= (arr!38044 _values!996) (store mapRest!48490 mapKey!48490 mapValue!48490))))

(declare-fun b!1222252 () Bool)

(assert (=> b!1222252 (= e!694131 (bvslt from!1455 (size!38581 _keys!1208)))))

(declare-fun lt!555935 () Unit!40327)

(assert (=> b!1222252 (= lt!555935 e!694129)))

(declare-fun c!120299 () Bool)

(assert (=> b!1222252 (= c!120299 (= (select (arr!38043 _keys!1208) from!1455) k0!934))))

(declare-fun e!694133 () Bool)

(assert (=> b!1222252 e!694133))

(declare-fun res!812086 () Bool)

(assert (=> b!1222252 (=> (not res!812086) (not e!694133))))

(declare-fun lt!555943 () V!46545)

(declare-fun lt!555940 () ListLongMap!18129)

(declare-fun +!4142 (ListLongMap!18129 tuple2!20160) ListLongMap!18129)

(declare-fun get!19435 (ValueCell!14822 V!46545) V!46545)

(assert (=> b!1222252 (= res!812086 (= lt!555940 (+!4142 lt!555942 (tuple2!20161 (select (arr!38043 _keys!1208) from!1455) (get!19435 (select (arr!38044 _values!996) from!1455) lt!555943)))))))

(declare-fun b!1222253 () Bool)

(declare-fun res!812085 () Bool)

(assert (=> b!1222253 (=> (not res!812085) (not e!694123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222253 (= res!812085 (validMask!0 mask!1564))))

(declare-fun b!1222255 () Bool)

(declare-fun e!694128 () Bool)

(declare-fun e!694126 () Bool)

(assert (=> b!1222255 (= e!694128 (and e!694126 mapRes!48490))))

(declare-fun condMapEmpty!48490 () Bool)

(declare-fun mapDefault!48490 () ValueCell!14822)

(assert (=> b!1222255 (= condMapEmpty!48490 (= (arr!38044 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14822)) mapDefault!48490)))))

(declare-fun b!1222256 () Bool)

(declare-fun res!812079 () Bool)

(assert (=> b!1222256 (=> (not res!812079) (not e!694123))))

(assert (=> b!1222256 (= res!812079 (validKeyInArray!0 k0!934))))

(declare-fun b!1222257 () Bool)

(declare-fun tp_is_empty!31063 () Bool)

(assert (=> b!1222257 (= e!694126 tp_is_empty!31063)))

(declare-fun b!1222258 () Bool)

(assert (=> b!1222258 (= e!694134 tp_is_empty!31063)))

(declare-fun b!1222259 () Bool)

(declare-fun e!694124 () Bool)

(assert (=> b!1222259 (= e!694124 e!694127)))

(declare-fun res!812078 () Bool)

(assert (=> b!1222259 (=> res!812078 e!694127)))

(assert (=> b!1222259 (= res!812078 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222259 (= lt!555940 (getCurrentListMapNoExtraKeys!5514 lt!555932 lt!555934 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222259 (= lt!555934 (array!78833 (store (arr!38044 _values!996) i!673 (ValueCellFull!14822 lt!555943)) (size!38582 _values!996)))))

(declare-fun dynLambda!3362 (Int (_ BitVec 64)) V!46545)

(assert (=> b!1222259 (= lt!555943 (dynLambda!3362 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555938 () ListLongMap!18129)

(assert (=> b!1222259 (= lt!555938 (getCurrentListMapNoExtraKeys!5514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222260 () Bool)

(declare-fun res!812091 () Bool)

(declare-fun e!694130 () Bool)

(assert (=> b!1222260 (=> (not res!812091) (not e!694130))))

(assert (=> b!1222260 (= res!812091 (arrayNoDuplicates!0 lt!555932 #b00000000000000000000000000000000 Nil!26935))))

(declare-fun mapIsEmpty!48490 () Bool)

(assert (=> mapIsEmpty!48490 mapRes!48490))

(declare-fun b!1222261 () Bool)

(declare-fun res!812084 () Bool)

(assert (=> b!1222261 (=> (not res!812084) (not e!694123))))

(assert (=> b!1222261 (= res!812084 (= (select (arr!38043 _keys!1208) i!673) k0!934))))

(declare-fun b!1222262 () Bool)

(assert (=> b!1222262 (= e!694130 (not e!694124))))

(declare-fun res!812087 () Bool)

(assert (=> b!1222262 (=> res!812087 e!694124)))

(assert (=> b!1222262 (= res!812087 (bvsgt from!1455 i!673))))

(assert (=> b!1222262 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555944 () Unit!40327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78830 (_ BitVec 64) (_ BitVec 32)) Unit!40327)

(assert (=> b!1222262 (= lt!555944 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222263 () Bool)

(declare-fun Unit!40330 () Unit!40327)

(assert (=> b!1222263 (= e!694129 Unit!40330)))

(declare-fun b!1222264 () Bool)

(declare-fun res!812088 () Bool)

(assert (=> b!1222264 (=> (not res!812088) (not e!694123))))

(assert (=> b!1222264 (= res!812088 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26935))))

(declare-fun b!1222265 () Bool)

(assert (=> b!1222265 (= e!694123 e!694130)))

(declare-fun res!812081 () Bool)

(assert (=> b!1222265 (=> (not res!812081) (not e!694130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78830 (_ BitVec 32)) Bool)

(assert (=> b!1222265 (= res!812081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555932 mask!1564))))

(assert (=> b!1222265 (= lt!555932 (array!78831 (store (arr!38043 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38581 _keys!1208)))))

(declare-fun b!1222266 () Bool)

(declare-fun res!812080 () Bool)

(assert (=> b!1222266 (=> (not res!812080) (not e!694123))))

(assert (=> b!1222266 (= res!812080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222254 () Bool)

(assert (=> b!1222254 (= e!694133 e!694132)))

(declare-fun res!812092 () Bool)

(assert (=> b!1222254 (=> res!812092 e!694132)))

(assert (=> b!1222254 (= res!812092 (not (= (select (arr!38043 _keys!1208) from!1455) k0!934)))))

(declare-fun res!812090 () Bool)

(assert (=> start!101632 (=> (not res!812090) (not e!694123))))

(assert (=> start!101632 (= res!812090 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38581 _keys!1208))))))

(assert (=> start!101632 e!694123))

(assert (=> start!101632 tp_is_empty!31063))

(declare-fun array_inv!29072 (array!78830) Bool)

(assert (=> start!101632 (array_inv!29072 _keys!1208)))

(assert (=> start!101632 true))

(assert (=> start!101632 tp!92120))

(declare-fun array_inv!29073 (array!78832) Bool)

(assert (=> start!101632 (and (array_inv!29073 _values!996) e!694128)))

(assert (= (and start!101632 res!812090) b!1222253))

(assert (= (and b!1222253 res!812085) b!1222250))

(assert (= (and b!1222250 res!812082) b!1222266))

(assert (= (and b!1222266 res!812080) b!1222264))

(assert (= (and b!1222264 res!812088) b!1222251))

(assert (= (and b!1222251 res!812089) b!1222256))

(assert (= (and b!1222256 res!812079) b!1222261))

(assert (= (and b!1222261 res!812084) b!1222265))

(assert (= (and b!1222265 res!812081) b!1222260))

(assert (= (and b!1222260 res!812091) b!1222262))

(assert (= (and b!1222262 (not res!812087)) b!1222259))

(assert (= (and b!1222259 (not res!812078)) b!1222247))

(assert (= (and b!1222247 (not res!812083)) b!1222252))

(assert (= (and b!1222252 res!812086) b!1222254))

(assert (= (and b!1222254 (not res!812092)) b!1222248))

(assert (= (and b!1222252 c!120299) b!1222249))

(assert (= (and b!1222252 (not c!120299)) b!1222263))

(assert (= (and b!1222255 condMapEmpty!48490) mapIsEmpty!48490))

(assert (= (and b!1222255 (not condMapEmpty!48490)) mapNonEmpty!48490))

(get-info :version)

(assert (= (and mapNonEmpty!48490 ((_ is ValueCellFull!14822) mapValue!48490)) b!1222258))

(assert (= (and b!1222255 ((_ is ValueCellFull!14822) mapDefault!48490)) b!1222257))

(assert (= start!101632 b!1222255))

(declare-fun b_lambda!22291 () Bool)

(assert (=> (not b_lambda!22291) (not b!1222259)))

(declare-fun t!40266 () Bool)

(declare-fun tb!11151 () Bool)

(assert (=> (and start!101632 (= defaultEntry!1004 defaultEntry!1004) t!40266) tb!11151))

(declare-fun result!22921 () Bool)

(assert (=> tb!11151 (= result!22921 tp_is_empty!31063)))

(assert (=> b!1222259 t!40266))

(declare-fun b_and!43945 () Bool)

(assert (= b_and!43943 (and (=> t!40266 result!22921) b_and!43945)))

(declare-fun m!1126721 () Bool)

(assert (=> b!1222247 m!1126721))

(declare-fun m!1126723 () Bool)

(assert (=> b!1222247 m!1126723))

(declare-fun m!1126725 () Bool)

(assert (=> b!1222247 m!1126725))

(declare-fun m!1126727 () Bool)

(assert (=> b!1222247 m!1126727))

(assert (=> b!1222247 m!1126725))

(declare-fun m!1126729 () Bool)

(assert (=> b!1222247 m!1126729))

(declare-fun m!1126731 () Bool)

(assert (=> b!1222247 m!1126731))

(declare-fun m!1126733 () Bool)

(assert (=> b!1222248 m!1126733))

(declare-fun m!1126735 () Bool)

(assert (=> b!1222264 m!1126735))

(declare-fun m!1126737 () Bool)

(assert (=> b!1222261 m!1126737))

(declare-fun m!1126739 () Bool)

(assert (=> start!101632 m!1126739))

(declare-fun m!1126741 () Bool)

(assert (=> start!101632 m!1126741))

(assert (=> b!1222254 m!1126725))

(declare-fun m!1126743 () Bool)

(assert (=> b!1222262 m!1126743))

(declare-fun m!1126745 () Bool)

(assert (=> b!1222262 m!1126745))

(declare-fun m!1126747 () Bool)

(assert (=> b!1222256 m!1126747))

(declare-fun m!1126749 () Bool)

(assert (=> b!1222249 m!1126749))

(declare-fun m!1126751 () Bool)

(assert (=> b!1222249 m!1126751))

(declare-fun m!1126753 () Bool)

(assert (=> b!1222249 m!1126753))

(declare-fun m!1126755 () Bool)

(assert (=> b!1222249 m!1126755))

(declare-fun m!1126757 () Bool)

(assert (=> b!1222249 m!1126757))

(declare-fun m!1126759 () Bool)

(assert (=> b!1222265 m!1126759))

(declare-fun m!1126761 () Bool)

(assert (=> b!1222265 m!1126761))

(declare-fun m!1126763 () Bool)

(assert (=> b!1222253 m!1126763))

(declare-fun m!1126765 () Bool)

(assert (=> b!1222260 m!1126765))

(declare-fun m!1126767 () Bool)

(assert (=> b!1222259 m!1126767))

(declare-fun m!1126769 () Bool)

(assert (=> b!1222259 m!1126769))

(declare-fun m!1126771 () Bool)

(assert (=> b!1222259 m!1126771))

(declare-fun m!1126773 () Bool)

(assert (=> b!1222259 m!1126773))

(declare-fun m!1126775 () Bool)

(assert (=> mapNonEmpty!48490 m!1126775))

(assert (=> b!1222252 m!1126725))

(declare-fun m!1126777 () Bool)

(assert (=> b!1222252 m!1126777))

(assert (=> b!1222252 m!1126777))

(declare-fun m!1126779 () Bool)

(assert (=> b!1222252 m!1126779))

(declare-fun m!1126781 () Bool)

(assert (=> b!1222252 m!1126781))

(declare-fun m!1126783 () Bool)

(assert (=> b!1222266 m!1126783))

(check-sat (not b_lambda!22291) (not b!1222264) (not b!1222248) b_and!43945 tp_is_empty!31063 (not mapNonEmpty!48490) (not b!1222262) (not b_next!26359) (not b!1222252) (not b!1222256) (not b!1222247) (not b!1222260) (not b!1222249) (not start!101632) (not b!1222253) (not b!1222266) (not b!1222265) (not b!1222259))
(check-sat b_and!43945 (not b_next!26359))
