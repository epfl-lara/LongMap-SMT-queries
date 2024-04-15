; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101712 () Bool)

(assert start!101712)

(declare-fun b_free!26407 () Bool)

(declare-fun b_next!26407 () Bool)

(assert (=> start!101712 (= b_free!26407 (not b_next!26407))))

(declare-fun tp!92267 () Bool)

(declare-fun b_and!44057 () Bool)

(assert (=> start!101712 (= tp!92267 b_and!44057)))

(declare-fun b!1223920 () Bool)

(declare-fun e!695128 () Bool)

(declare-datatypes ((V!46609 0))(
  ( (V!46610 (val!15612 Int)) )
))
(declare-datatypes ((tuple2!20198 0))(
  ( (tuple2!20199 (_1!10110 (_ BitVec 64)) (_2!10110 V!46609)) )
))
(declare-datatypes ((List!26979 0))(
  ( (Nil!26976) (Cons!26975 (h!28184 tuple2!20198) (t!40357 List!26979)) )
))
(declare-datatypes ((ListLongMap!18167 0))(
  ( (ListLongMap!18168 (toList!9099 List!26979)) )
))
(declare-fun lt!557074 () ListLongMap!18167)

(declare-fun lt!557072 () ListLongMap!18167)

(assert (=> b!1223920 (= e!695128 (= lt!557074 lt!557072))))

(declare-fun mapNonEmpty!48565 () Bool)

(declare-fun mapRes!48565 () Bool)

(declare-fun tp!92266 () Bool)

(declare-fun e!695120 () Bool)

(assert (=> mapNonEmpty!48565 (= mapRes!48565 (and tp!92266 e!695120))))

(declare-datatypes ((ValueCell!14846 0))(
  ( (ValueCellFull!14846 (v!18273 V!46609)) (EmptyCell!14846) )
))
(declare-fun mapRest!48565 () (Array (_ BitVec 32) ValueCell!14846))

(declare-fun mapValue!48565 () ValueCell!14846)

(declare-fun mapKey!48565 () (_ BitVec 32))

(declare-datatypes ((array!78926 0))(
  ( (array!78927 (arr!38090 (Array (_ BitVec 32) ValueCell!14846)) (size!38628 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78926)

(assert (=> mapNonEmpty!48565 (= (arr!38090 _values!996) (store mapRest!48565 mapKey!48565 mapValue!48565))))

(declare-fun b!1223921 () Bool)

(declare-datatypes ((Unit!40395 0))(
  ( (Unit!40396) )
))
(declare-fun e!695129 () Unit!40395)

(declare-fun Unit!40397 () Unit!40395)

(assert (=> b!1223921 (= e!695129 Unit!40397)))

(declare-datatypes ((array!78928 0))(
  ( (array!78929 (arr!38091 (Array (_ BitVec 32) (_ BitVec 64))) (size!38629 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78928)

(declare-fun lt!557077 () Unit!40395)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78928 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40395)

(assert (=> b!1223921 (= lt!557077 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223921 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557073 () Unit!40395)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78928 (_ BitVec 32) (_ BitVec 32)) Unit!40395)

(assert (=> b!1223921 (= lt!557073 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26980 0))(
  ( (Nil!26977) (Cons!26976 (h!28185 (_ BitVec 64)) (t!40358 List!26980)) )
))
(declare-fun arrayNoDuplicates!0 (array!78928 (_ BitVec 32) List!26980) Bool)

(assert (=> b!1223921 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26977)))

(declare-fun lt!557080 () Unit!40395)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78928 (_ BitVec 64) (_ BitVec 32) List!26980) Unit!40395)

(assert (=> b!1223921 (= lt!557080 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26977))))

(assert (=> b!1223921 false))

(declare-fun b!1223922 () Bool)

(declare-fun Unit!40398 () Unit!40395)

(assert (=> b!1223922 (= e!695129 Unit!40398)))

(declare-fun b!1223923 () Bool)

(declare-fun res!813260 () Bool)

(declare-fun e!695124 () Bool)

(assert (=> b!1223923 (=> (not res!813260) (not e!695124))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223923 (= res!813260 (validMask!0 mask!1564))))

(declare-fun b!1223924 () Bool)

(declare-fun e!695122 () Bool)

(assert (=> b!1223924 (= e!695124 e!695122)))

(declare-fun res!813270 () Bool)

(assert (=> b!1223924 (=> (not res!813270) (not e!695122))))

(declare-fun lt!557079 () array!78928)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78928 (_ BitVec 32)) Bool)

(assert (=> b!1223924 (= res!813270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557079 mask!1564))))

(assert (=> b!1223924 (= lt!557079 (array!78929 (store (arr!38091 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38629 _keys!1208)))))

(declare-fun b!1223925 () Bool)

(declare-fun e!695126 () Bool)

(assert (=> b!1223925 (= e!695126 (bvslt from!1455 (size!38629 _keys!1208)))))

(assert (=> b!1223925 e!695128))

(declare-fun res!813257 () Bool)

(assert (=> b!1223925 (=> (not res!813257) (not e!695128))))

(assert (=> b!1223925 (= res!813257 (not (= (select (arr!38091 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557066 () Unit!40395)

(assert (=> b!1223925 (= lt!557066 e!695129)))

(declare-fun c!120410 () Bool)

(assert (=> b!1223925 (= c!120410 (= (select (arr!38091 _keys!1208) from!1455) k0!934))))

(declare-fun e!695121 () Bool)

(assert (=> b!1223925 e!695121))

(declare-fun res!813266 () Bool)

(assert (=> b!1223925 (=> (not res!813266) (not e!695121))))

(declare-fun lt!557068 () ListLongMap!18167)

(declare-fun lt!557076 () tuple2!20198)

(declare-fun +!4161 (ListLongMap!18167 tuple2!20198) ListLongMap!18167)

(assert (=> b!1223925 (= res!813266 (= lt!557068 (+!4161 lt!557074 lt!557076)))))

(declare-fun lt!557071 () V!46609)

(declare-fun get!19470 (ValueCell!14846 V!46609) V!46609)

(assert (=> b!1223925 (= lt!557076 (tuple2!20199 (select (arr!38091 _keys!1208) from!1455) (get!19470 (select (arr!38090 _values!996) from!1455) lt!557071)))))

(declare-fun b!1223926 () Bool)

(declare-fun res!813258 () Bool)

(assert (=> b!1223926 (=> (not res!813258) (not e!695124))))

(assert (=> b!1223926 (= res!813258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223927 () Bool)

(declare-fun e!695127 () Bool)

(declare-fun e!695131 () Bool)

(assert (=> b!1223927 (= e!695127 e!695131)))

(declare-fun res!813263 () Bool)

(assert (=> b!1223927 (=> res!813263 e!695131)))

(assert (=> b!1223927 (= res!813263 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557069 () array!78926)

(declare-fun minValue!944 () V!46609)

(declare-fun zeroValue!944 () V!46609)

(declare-fun getCurrentListMapNoExtraKeys!5531 (array!78928 array!78926 (_ BitVec 32) (_ BitVec 32) V!46609 V!46609 (_ BitVec 32) Int) ListLongMap!18167)

(assert (=> b!1223927 (= lt!557068 (getCurrentListMapNoExtraKeys!5531 lt!557079 lt!557069 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223927 (= lt!557069 (array!78927 (store (arr!38090 _values!996) i!673 (ValueCellFull!14846 lt!557071)) (size!38628 _values!996)))))

(declare-fun dynLambda!3377 (Int (_ BitVec 64)) V!46609)

(assert (=> b!1223927 (= lt!557071 (dynLambda!3377 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557067 () ListLongMap!18167)

(assert (=> b!1223927 (= lt!557067 (getCurrentListMapNoExtraKeys!5531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223928 () Bool)

(declare-fun tp_is_empty!31111 () Bool)

(assert (=> b!1223928 (= e!695120 tp_is_empty!31111)))

(declare-fun b!1223929 () Bool)

(declare-fun res!813269 () Bool)

(assert (=> b!1223929 (=> (not res!813269) (not e!695124))))

(assert (=> b!1223929 (= res!813269 (= (select (arr!38091 _keys!1208) i!673) k0!934))))

(declare-fun b!1223930 () Bool)

(declare-fun res!813272 () Bool)

(assert (=> b!1223930 (=> (not res!813272) (not e!695124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223930 (= res!813272 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48565 () Bool)

(assert (=> mapIsEmpty!48565 mapRes!48565))

(declare-fun b!1223931 () Bool)

(declare-fun res!813271 () Bool)

(assert (=> b!1223931 (=> (not res!813271) (not e!695122))))

(assert (=> b!1223931 (= res!813271 (arrayNoDuplicates!0 lt!557079 #b00000000000000000000000000000000 Nil!26977))))

(declare-fun b!1223932 () Bool)

(declare-fun res!813267 () Bool)

(assert (=> b!1223932 (=> (not res!813267) (not e!695128))))

(declare-fun lt!557075 () ListLongMap!18167)

(assert (=> b!1223932 (= res!813267 (= lt!557067 (+!4161 lt!557075 lt!557076)))))

(declare-fun b!1223933 () Bool)

(declare-fun res!813268 () Bool)

(assert (=> b!1223933 (=> (not res!813268) (not e!695124))))

(assert (=> b!1223933 (= res!813268 (and (= (size!38628 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38629 _keys!1208) (size!38628 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223934 () Bool)

(declare-fun e!695123 () Bool)

(assert (=> b!1223934 (= e!695123 tp_is_empty!31111)))

(declare-fun res!813264 () Bool)

(assert (=> start!101712 (=> (not res!813264) (not e!695124))))

(assert (=> start!101712 (= res!813264 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38629 _keys!1208))))))

(assert (=> start!101712 e!695124))

(assert (=> start!101712 tp_is_empty!31111))

(declare-fun array_inv!29102 (array!78928) Bool)

(assert (=> start!101712 (array_inv!29102 _keys!1208)))

(assert (=> start!101712 true))

(assert (=> start!101712 tp!92267))

(declare-fun e!695125 () Bool)

(declare-fun array_inv!29103 (array!78926) Bool)

(assert (=> start!101712 (and (array_inv!29103 _values!996) e!695125)))

(declare-fun b!1223935 () Bool)

(assert (=> b!1223935 (= e!695131 e!695126)))

(declare-fun res!813262 () Bool)

(assert (=> b!1223935 (=> res!813262 e!695126)))

(assert (=> b!1223935 (= res!813262 (not (validKeyInArray!0 (select (arr!38091 _keys!1208) from!1455))))))

(assert (=> b!1223935 (= lt!557072 lt!557074)))

(declare-fun -!1920 (ListLongMap!18167 (_ BitVec 64)) ListLongMap!18167)

(assert (=> b!1223935 (= lt!557074 (-!1920 lt!557075 k0!934))))

(assert (=> b!1223935 (= lt!557072 (getCurrentListMapNoExtraKeys!5531 lt!557079 lt!557069 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223935 (= lt!557075 (getCurrentListMapNoExtraKeys!5531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557078 () Unit!40395)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1155 (array!78928 array!78926 (_ BitVec 32) (_ BitVec 32) V!46609 V!46609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40395)

(assert (=> b!1223935 (= lt!557078 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1155 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223936 () Bool)

(declare-fun res!813273 () Bool)

(assert (=> b!1223936 (=> (not res!813273) (not e!695124))))

(assert (=> b!1223936 (= res!813273 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26977))))

(declare-fun b!1223937 () Bool)

(declare-fun e!695130 () Bool)

(assert (=> b!1223937 (= e!695130 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223938 () Bool)

(declare-fun res!813265 () Bool)

(assert (=> b!1223938 (=> (not res!813265) (not e!695124))))

(assert (=> b!1223938 (= res!813265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38629 _keys!1208))))))

(declare-fun b!1223939 () Bool)

(assert (=> b!1223939 (= e!695121 e!695130)))

(declare-fun res!813261 () Bool)

(assert (=> b!1223939 (=> res!813261 e!695130)))

(assert (=> b!1223939 (= res!813261 (not (= (select (arr!38091 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223940 () Bool)

(assert (=> b!1223940 (= e!695122 (not e!695127))))

(declare-fun res!813259 () Bool)

(assert (=> b!1223940 (=> res!813259 e!695127)))

(assert (=> b!1223940 (= res!813259 (bvsgt from!1455 i!673))))

(assert (=> b!1223940 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557070 () Unit!40395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78928 (_ BitVec 64) (_ BitVec 32)) Unit!40395)

(assert (=> b!1223940 (= lt!557070 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223941 () Bool)

(assert (=> b!1223941 (= e!695125 (and e!695123 mapRes!48565))))

(declare-fun condMapEmpty!48565 () Bool)

(declare-fun mapDefault!48565 () ValueCell!14846)

(assert (=> b!1223941 (= condMapEmpty!48565 (= (arr!38090 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14846)) mapDefault!48565)))))

(assert (= (and start!101712 res!813264) b!1223923))

(assert (= (and b!1223923 res!813260) b!1223933))

(assert (= (and b!1223933 res!813268) b!1223926))

(assert (= (and b!1223926 res!813258) b!1223936))

(assert (= (and b!1223936 res!813273) b!1223938))

(assert (= (and b!1223938 res!813265) b!1223930))

(assert (= (and b!1223930 res!813272) b!1223929))

(assert (= (and b!1223929 res!813269) b!1223924))

(assert (= (and b!1223924 res!813270) b!1223931))

(assert (= (and b!1223931 res!813271) b!1223940))

(assert (= (and b!1223940 (not res!813259)) b!1223927))

(assert (= (and b!1223927 (not res!813263)) b!1223935))

(assert (= (and b!1223935 (not res!813262)) b!1223925))

(assert (= (and b!1223925 res!813266) b!1223939))

(assert (= (and b!1223939 (not res!813261)) b!1223937))

(assert (= (and b!1223925 c!120410) b!1223921))

(assert (= (and b!1223925 (not c!120410)) b!1223922))

(assert (= (and b!1223925 res!813257) b!1223932))

(assert (= (and b!1223932 res!813267) b!1223920))

(assert (= (and b!1223941 condMapEmpty!48565) mapIsEmpty!48565))

(assert (= (and b!1223941 (not condMapEmpty!48565)) mapNonEmpty!48565))

(get-info :version)

(assert (= (and mapNonEmpty!48565 ((_ is ValueCellFull!14846) mapValue!48565)) b!1223928))

(assert (= (and b!1223941 ((_ is ValueCellFull!14846) mapDefault!48565)) b!1223934))

(assert (= start!101712 b!1223941))

(declare-fun b_lambda!22377 () Bool)

(assert (=> (not b_lambda!22377) (not b!1223927)))

(declare-fun t!40356 () Bool)

(declare-fun tb!11199 () Bool)

(assert (=> (and start!101712 (= defaultEntry!1004 defaultEntry!1004) t!40356) tb!11199))

(declare-fun result!23019 () Bool)

(assert (=> tb!11199 (= result!23019 tp_is_empty!31111)))

(assert (=> b!1223927 t!40356))

(declare-fun b_and!44059 () Bool)

(assert (= b_and!44057 (and (=> t!40356 result!23019) b_and!44059)))

(declare-fun m!1128479 () Bool)

(assert (=> start!101712 m!1128479))

(declare-fun m!1128481 () Bool)

(assert (=> start!101712 m!1128481))

(declare-fun m!1128483 () Bool)

(assert (=> b!1223921 m!1128483))

(declare-fun m!1128485 () Bool)

(assert (=> b!1223921 m!1128485))

(declare-fun m!1128487 () Bool)

(assert (=> b!1223921 m!1128487))

(declare-fun m!1128489 () Bool)

(assert (=> b!1223921 m!1128489))

(declare-fun m!1128491 () Bool)

(assert (=> b!1223921 m!1128491))

(declare-fun m!1128493 () Bool)

(assert (=> mapNonEmpty!48565 m!1128493))

(declare-fun m!1128495 () Bool)

(assert (=> b!1223940 m!1128495))

(declare-fun m!1128497 () Bool)

(assert (=> b!1223940 m!1128497))

(declare-fun m!1128499 () Bool)

(assert (=> b!1223931 m!1128499))

(declare-fun m!1128501 () Bool)

(assert (=> b!1223932 m!1128501))

(declare-fun m!1128503 () Bool)

(assert (=> b!1223925 m!1128503))

(declare-fun m!1128505 () Bool)

(assert (=> b!1223925 m!1128505))

(declare-fun m!1128507 () Bool)

(assert (=> b!1223925 m!1128507))

(assert (=> b!1223925 m!1128507))

(declare-fun m!1128509 () Bool)

(assert (=> b!1223925 m!1128509))

(declare-fun m!1128511 () Bool)

(assert (=> b!1223923 m!1128511))

(declare-fun m!1128513 () Bool)

(assert (=> b!1223929 m!1128513))

(declare-fun m!1128515 () Bool)

(assert (=> b!1223937 m!1128515))

(declare-fun m!1128517 () Bool)

(assert (=> b!1223926 m!1128517))

(declare-fun m!1128519 () Bool)

(assert (=> b!1223935 m!1128519))

(declare-fun m!1128521 () Bool)

(assert (=> b!1223935 m!1128521))

(declare-fun m!1128523 () Bool)

(assert (=> b!1223935 m!1128523))

(assert (=> b!1223935 m!1128503))

(declare-fun m!1128525 () Bool)

(assert (=> b!1223935 m!1128525))

(declare-fun m!1128527 () Bool)

(assert (=> b!1223935 m!1128527))

(assert (=> b!1223935 m!1128503))

(declare-fun m!1128529 () Bool)

(assert (=> b!1223927 m!1128529))

(declare-fun m!1128531 () Bool)

(assert (=> b!1223927 m!1128531))

(declare-fun m!1128533 () Bool)

(assert (=> b!1223927 m!1128533))

(declare-fun m!1128535 () Bool)

(assert (=> b!1223927 m!1128535))

(declare-fun m!1128537 () Bool)

(assert (=> b!1223936 m!1128537))

(assert (=> b!1223939 m!1128503))

(declare-fun m!1128539 () Bool)

(assert (=> b!1223924 m!1128539))

(declare-fun m!1128541 () Bool)

(assert (=> b!1223924 m!1128541))

(declare-fun m!1128543 () Bool)

(assert (=> b!1223930 m!1128543))

(check-sat (not b!1223930) (not b!1223924) (not b!1223932) (not b!1223935) (not b!1223923) (not mapNonEmpty!48565) (not b_lambda!22377) (not b!1223931) tp_is_empty!31111 (not b!1223936) (not b!1223921) (not b!1223927) (not b!1223926) (not start!101712) b_and!44059 (not b_next!26407) (not b!1223937) (not b!1223925) (not b!1223940))
(check-sat b_and!44059 (not b_next!26407))
