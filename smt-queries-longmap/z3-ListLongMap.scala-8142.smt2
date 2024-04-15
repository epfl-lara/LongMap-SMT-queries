; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99712 () Bool)

(assert start!99712)

(declare-fun b_free!25297 () Bool)

(declare-fun b_next!25297 () Bool)

(assert (=> start!99712 (= b_free!25297 (not b_next!25297))))

(declare-fun tp!88604 () Bool)

(declare-fun b_and!41439 () Bool)

(assert (=> start!99712 (= tp!88604 b_and!41439)))

(declare-fun b!1183370 () Bool)

(declare-fun e!672808 () Bool)

(assert (=> b!1183370 (= e!672808 true)))

(declare-datatypes ((V!44897 0))(
  ( (V!44898 (val!14970 Int)) )
))
(declare-datatypes ((tuple2!19302 0))(
  ( (tuple2!19303 (_1!9662 (_ BitVec 64)) (_2!9662 V!44897)) )
))
(declare-datatypes ((List!26010 0))(
  ( (Nil!26007) (Cons!26006 (h!27215 tuple2!19302) (t!38290 List!26010)) )
))
(declare-datatypes ((ListLongMap!17271 0))(
  ( (ListLongMap!17272 (toList!8651 List!26010)) )
))
(declare-fun lt!536040 () ListLongMap!17271)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!536041 () ListLongMap!17271)

(declare-fun -!1606 (ListLongMap!17271 (_ BitVec 64)) ListLongMap!17271)

(assert (=> b!1183370 (= (-!1606 lt!536040 k0!934) lt!536041)))

(declare-datatypes ((array!76388 0))(
  ( (array!76389 (arr!36844 (Array (_ BitVec 32) (_ BitVec 64))) (size!37382 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76388)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39027 0))(
  ( (Unit!39028) )
))
(declare-fun lt!536035 () Unit!39027)

(declare-fun lt!536029 () ListLongMap!17271)

(declare-fun lt!536042 () V!44897)

(declare-fun addRemoveCommutativeForDiffKeys!154 (ListLongMap!17271 (_ BitVec 64) V!44897 (_ BitVec 64)) Unit!39027)

(assert (=> b!1183370 (= lt!536035 (addRemoveCommutativeForDiffKeys!154 lt!536029 (select (arr!36844 _keys!1208) from!1455) lt!536042 k0!934))))

(declare-fun lt!536037 () ListLongMap!17271)

(declare-fun lt!536025 () ListLongMap!17271)

(declare-fun lt!536043 () ListLongMap!17271)

(assert (=> b!1183370 (and (= lt!536043 lt!536040) (= lt!536025 lt!536037))))

(declare-fun lt!536027 () tuple2!19302)

(declare-fun +!3940 (ListLongMap!17271 tuple2!19302) ListLongMap!17271)

(assert (=> b!1183370 (= lt!536040 (+!3940 lt!536029 lt!536027))))

(assert (=> b!1183370 (not (= (select (arr!36844 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536034 () Unit!39027)

(declare-fun e!672801 () Unit!39027)

(assert (=> b!1183370 (= lt!536034 e!672801)))

(declare-fun c!117043 () Bool)

(assert (=> b!1183370 (= c!117043 (= (select (arr!36844 _keys!1208) from!1455) k0!934))))

(declare-fun e!672807 () Bool)

(assert (=> b!1183370 e!672807))

(declare-fun res!786524 () Bool)

(assert (=> b!1183370 (=> (not res!786524) (not e!672807))))

(declare-fun lt!536039 () ListLongMap!17271)

(assert (=> b!1183370 (= res!786524 (= lt!536039 lt!536041))))

(assert (=> b!1183370 (= lt!536041 (+!3940 lt!536025 lt!536027))))

(assert (=> b!1183370 (= lt!536027 (tuple2!19303 (select (arr!36844 _keys!1208) from!1455) lt!536042))))

(declare-datatypes ((ValueCell!14204 0))(
  ( (ValueCellFull!14204 (v!17607 V!44897)) (EmptyCell!14204) )
))
(declare-datatypes ((array!76390 0))(
  ( (array!76391 (arr!36845 (Array (_ BitVec 32) ValueCell!14204)) (size!37383 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76390)

(declare-fun lt!536033 () V!44897)

(declare-fun get!18861 (ValueCell!14204 V!44897) V!44897)

(assert (=> b!1183370 (= lt!536042 (get!18861 (select (arr!36845 _values!996) from!1455) lt!536033))))

(declare-fun b!1183371 () Bool)

(declare-fun e!672803 () Bool)

(declare-fun e!672806 () Bool)

(declare-fun mapRes!46568 () Bool)

(assert (=> b!1183371 (= e!672803 (and e!672806 mapRes!46568))))

(declare-fun condMapEmpty!46568 () Bool)

(declare-fun mapDefault!46568 () ValueCell!14204)

(assert (=> b!1183371 (= condMapEmpty!46568 (= (arr!36845 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14204)) mapDefault!46568)))))

(declare-fun b!1183372 () Bool)

(declare-fun Unit!39029 () Unit!39027)

(assert (=> b!1183372 (= e!672801 Unit!39029)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1183373 () Bool)

(declare-fun e!672800 () Bool)

(declare-fun arrayContainsKey!0 (array!76388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183373 (= e!672800 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183374 () Bool)

(declare-fun e!672797 () Bool)

(declare-fun tp_is_empty!29827 () Bool)

(assert (=> b!1183374 (= e!672797 tp_is_empty!29827)))

(declare-fun b!1183375 () Bool)

(declare-fun res!786531 () Bool)

(declare-fun e!672802 () Bool)

(assert (=> b!1183375 (=> (not res!786531) (not e!672802))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76388 (_ BitVec 32)) Bool)

(assert (=> b!1183375 (= res!786531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183376 () Bool)

(declare-fun e!672799 () Bool)

(declare-fun e!672798 () Bool)

(assert (=> b!1183376 (= e!672799 (not e!672798))))

(declare-fun res!786525 () Bool)

(assert (=> b!1183376 (=> res!786525 e!672798)))

(assert (=> b!1183376 (= res!786525 (bvsgt from!1455 i!673))))

(assert (=> b!1183376 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536036 () Unit!39027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76388 (_ BitVec 64) (_ BitVec 32)) Unit!39027)

(assert (=> b!1183376 (= lt!536036 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183377 () Bool)

(declare-fun res!786528 () Bool)

(assert (=> b!1183377 (=> (not res!786528) (not e!672802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183377 (= res!786528 (validKeyInArray!0 k0!934))))

(declare-fun b!1183378 () Bool)

(assert (=> b!1183378 (= e!672802 e!672799)))

(declare-fun res!786522 () Bool)

(assert (=> b!1183378 (=> (not res!786522) (not e!672799))))

(declare-fun lt!536032 () array!76388)

(assert (=> b!1183378 (= res!786522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536032 mask!1564))))

(assert (=> b!1183378 (= lt!536032 (array!76389 (store (arr!36844 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37382 _keys!1208)))))

(declare-fun b!1183379 () Bool)

(declare-fun e!672805 () Bool)

(assert (=> b!1183379 (= e!672805 e!672808)))

(declare-fun res!786523 () Bool)

(assert (=> b!1183379 (=> res!786523 e!672808)))

(assert (=> b!1183379 (= res!786523 (not (validKeyInArray!0 (select (arr!36844 _keys!1208) from!1455))))))

(assert (=> b!1183379 (= lt!536037 lt!536025)))

(assert (=> b!1183379 (= lt!536025 (-!1606 lt!536029 k0!934))))

(declare-fun zeroValue!944 () V!44897)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44897)

(declare-fun lt!536026 () array!76390)

(declare-fun getCurrentListMapNoExtraKeys!5106 (array!76388 array!76390 (_ BitVec 32) (_ BitVec 32) V!44897 V!44897 (_ BitVec 32) Int) ListLongMap!17271)

(assert (=> b!1183379 (= lt!536037 (getCurrentListMapNoExtraKeys!5106 lt!536032 lt!536026 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183379 (= lt!536029 (getCurrentListMapNoExtraKeys!5106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536038 () Unit!39027)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!868 (array!76388 array!76390 (_ BitVec 32) (_ BitVec 32) V!44897 V!44897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39027)

(assert (=> b!1183379 (= lt!536038 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!868 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46568 () Bool)

(assert (=> mapIsEmpty!46568 mapRes!46568))

(declare-fun b!1183380 () Bool)

(assert (=> b!1183380 (= e!672798 e!672805)))

(declare-fun res!786527 () Bool)

(assert (=> b!1183380 (=> res!786527 e!672805)))

(assert (=> b!1183380 (= res!786527 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183380 (= lt!536039 (getCurrentListMapNoExtraKeys!5106 lt!536032 lt!536026 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183380 (= lt!536026 (array!76391 (store (arr!36845 _values!996) i!673 (ValueCellFull!14204 lt!536033)) (size!37383 _values!996)))))

(declare-fun dynLambda!3011 (Int (_ BitVec 64)) V!44897)

(assert (=> b!1183380 (= lt!536033 (dynLambda!3011 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183380 (= lt!536043 (getCurrentListMapNoExtraKeys!5106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183381 () Bool)

(declare-fun Unit!39030 () Unit!39027)

(assert (=> b!1183381 (= e!672801 Unit!39030)))

(declare-fun lt!536028 () Unit!39027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39027)

(assert (=> b!1183381 (= lt!536028 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183381 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536031 () Unit!39027)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76388 (_ BitVec 32) (_ BitVec 32)) Unit!39027)

(assert (=> b!1183381 (= lt!536031 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26011 0))(
  ( (Nil!26008) (Cons!26007 (h!27216 (_ BitVec 64)) (t!38291 List!26011)) )
))
(declare-fun arrayNoDuplicates!0 (array!76388 (_ BitVec 32) List!26011) Bool)

(assert (=> b!1183381 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26008)))

(declare-fun lt!536030 () Unit!39027)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76388 (_ BitVec 64) (_ BitVec 32) List!26011) Unit!39027)

(assert (=> b!1183381 (= lt!536030 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26008))))

(assert (=> b!1183381 false))

(declare-fun b!1183382 () Bool)

(assert (=> b!1183382 (= e!672806 tp_is_empty!29827)))

(declare-fun mapNonEmpty!46568 () Bool)

(declare-fun tp!88605 () Bool)

(assert (=> mapNonEmpty!46568 (= mapRes!46568 (and tp!88605 e!672797))))

(declare-fun mapKey!46568 () (_ BitVec 32))

(declare-fun mapValue!46568 () ValueCell!14204)

(declare-fun mapRest!46568 () (Array (_ BitVec 32) ValueCell!14204))

(assert (=> mapNonEmpty!46568 (= (arr!36845 _values!996) (store mapRest!46568 mapKey!46568 mapValue!46568))))

(declare-fun b!1183383 () Bool)

(declare-fun res!786521 () Bool)

(assert (=> b!1183383 (=> (not res!786521) (not e!672802))))

(assert (=> b!1183383 (= res!786521 (= (select (arr!36844 _keys!1208) i!673) k0!934))))

(declare-fun b!1183384 () Bool)

(declare-fun res!786520 () Bool)

(assert (=> b!1183384 (=> (not res!786520) (not e!672799))))

(assert (=> b!1183384 (= res!786520 (arrayNoDuplicates!0 lt!536032 #b00000000000000000000000000000000 Nil!26008))))

(declare-fun b!1183369 () Bool)

(declare-fun res!786519 () Bool)

(assert (=> b!1183369 (=> (not res!786519) (not e!672802))))

(assert (=> b!1183369 (= res!786519 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26008))))

(declare-fun res!786530 () Bool)

(assert (=> start!99712 (=> (not res!786530) (not e!672802))))

(assert (=> start!99712 (= res!786530 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37382 _keys!1208))))))

(assert (=> start!99712 e!672802))

(assert (=> start!99712 tp_is_empty!29827))

(declare-fun array_inv!28234 (array!76388) Bool)

(assert (=> start!99712 (array_inv!28234 _keys!1208)))

(assert (=> start!99712 true))

(assert (=> start!99712 tp!88604))

(declare-fun array_inv!28235 (array!76390) Bool)

(assert (=> start!99712 (and (array_inv!28235 _values!996) e!672803)))

(declare-fun b!1183385 () Bool)

(assert (=> b!1183385 (= e!672807 e!672800)))

(declare-fun res!786529 () Bool)

(assert (=> b!1183385 (=> res!786529 e!672800)))

(assert (=> b!1183385 (= res!786529 (not (= (select (arr!36844 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183386 () Bool)

(declare-fun res!786532 () Bool)

(assert (=> b!1183386 (=> (not res!786532) (not e!672802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183386 (= res!786532 (validMask!0 mask!1564))))

(declare-fun b!1183387 () Bool)

(declare-fun res!786526 () Bool)

(assert (=> b!1183387 (=> (not res!786526) (not e!672802))))

(assert (=> b!1183387 (= res!786526 (and (= (size!37383 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37382 _keys!1208) (size!37383 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183388 () Bool)

(declare-fun res!786518 () Bool)

(assert (=> b!1183388 (=> (not res!786518) (not e!672802))))

(assert (=> b!1183388 (= res!786518 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37382 _keys!1208))))))

(assert (= (and start!99712 res!786530) b!1183386))

(assert (= (and b!1183386 res!786532) b!1183387))

(assert (= (and b!1183387 res!786526) b!1183375))

(assert (= (and b!1183375 res!786531) b!1183369))

(assert (= (and b!1183369 res!786519) b!1183388))

(assert (= (and b!1183388 res!786518) b!1183377))

(assert (= (and b!1183377 res!786528) b!1183383))

(assert (= (and b!1183383 res!786521) b!1183378))

(assert (= (and b!1183378 res!786522) b!1183384))

(assert (= (and b!1183384 res!786520) b!1183376))

(assert (= (and b!1183376 (not res!786525)) b!1183380))

(assert (= (and b!1183380 (not res!786527)) b!1183379))

(assert (= (and b!1183379 (not res!786523)) b!1183370))

(assert (= (and b!1183370 res!786524) b!1183385))

(assert (= (and b!1183385 (not res!786529)) b!1183373))

(assert (= (and b!1183370 c!117043) b!1183381))

(assert (= (and b!1183370 (not c!117043)) b!1183372))

(assert (= (and b!1183371 condMapEmpty!46568) mapIsEmpty!46568))

(assert (= (and b!1183371 (not condMapEmpty!46568)) mapNonEmpty!46568))

(get-info :version)

(assert (= (and mapNonEmpty!46568 ((_ is ValueCellFull!14204) mapValue!46568)) b!1183374))

(assert (= (and b!1183371 ((_ is ValueCellFull!14204) mapDefault!46568)) b!1183382))

(assert (= start!99712 b!1183371))

(declare-fun b_lambda!20423 () Bool)

(assert (=> (not b_lambda!20423) (not b!1183380)))

(declare-fun t!38289 () Bool)

(declare-fun tb!10101 () Bool)

(assert (=> (and start!99712 (= defaultEntry!1004 defaultEntry!1004) t!38289) tb!10101))

(declare-fun result!20777 () Bool)

(assert (=> tb!10101 (= result!20777 tp_is_empty!29827)))

(assert (=> b!1183380 t!38289))

(declare-fun b_and!41441 () Bool)

(assert (= b_and!41439 (and (=> t!38289 result!20777) b_and!41441)))

(declare-fun m!1091045 () Bool)

(assert (=> mapNonEmpty!46568 m!1091045))

(declare-fun m!1091047 () Bool)

(assert (=> b!1183385 m!1091047))

(declare-fun m!1091049 () Bool)

(assert (=> b!1183386 m!1091049))

(declare-fun m!1091051 () Bool)

(assert (=> b!1183377 m!1091051))

(declare-fun m!1091053 () Bool)

(assert (=> b!1183369 m!1091053))

(declare-fun m!1091055 () Bool)

(assert (=> b!1183376 m!1091055))

(declare-fun m!1091057 () Bool)

(assert (=> b!1183376 m!1091057))

(declare-fun m!1091059 () Bool)

(assert (=> b!1183379 m!1091059))

(declare-fun m!1091061 () Bool)

(assert (=> b!1183379 m!1091061))

(declare-fun m!1091063 () Bool)

(assert (=> b!1183379 m!1091063))

(assert (=> b!1183379 m!1091047))

(declare-fun m!1091065 () Bool)

(assert (=> b!1183379 m!1091065))

(assert (=> b!1183379 m!1091047))

(declare-fun m!1091067 () Bool)

(assert (=> b!1183379 m!1091067))

(declare-fun m!1091069 () Bool)

(assert (=> b!1183381 m!1091069))

(declare-fun m!1091071 () Bool)

(assert (=> b!1183381 m!1091071))

(declare-fun m!1091073 () Bool)

(assert (=> b!1183381 m!1091073))

(declare-fun m!1091075 () Bool)

(assert (=> b!1183381 m!1091075))

(declare-fun m!1091077 () Bool)

(assert (=> b!1183381 m!1091077))

(declare-fun m!1091079 () Bool)

(assert (=> b!1183378 m!1091079))

(declare-fun m!1091081 () Bool)

(assert (=> b!1183378 m!1091081))

(declare-fun m!1091083 () Bool)

(assert (=> b!1183373 m!1091083))

(declare-fun m!1091085 () Bool)

(assert (=> b!1183375 m!1091085))

(declare-fun m!1091087 () Bool)

(assert (=> b!1183380 m!1091087))

(declare-fun m!1091089 () Bool)

(assert (=> b!1183380 m!1091089))

(declare-fun m!1091091 () Bool)

(assert (=> b!1183380 m!1091091))

(declare-fun m!1091093 () Bool)

(assert (=> b!1183380 m!1091093))

(declare-fun m!1091095 () Bool)

(assert (=> b!1183370 m!1091095))

(declare-fun m!1091097 () Bool)

(assert (=> b!1183370 m!1091097))

(assert (=> b!1183370 m!1091095))

(declare-fun m!1091099 () Bool)

(assert (=> b!1183370 m!1091099))

(declare-fun m!1091101 () Bool)

(assert (=> b!1183370 m!1091101))

(assert (=> b!1183370 m!1091047))

(declare-fun m!1091103 () Bool)

(assert (=> b!1183370 m!1091103))

(assert (=> b!1183370 m!1091047))

(declare-fun m!1091105 () Bool)

(assert (=> b!1183370 m!1091105))

(declare-fun m!1091107 () Bool)

(assert (=> b!1183383 m!1091107))

(declare-fun m!1091109 () Bool)

(assert (=> b!1183384 m!1091109))

(declare-fun m!1091111 () Bool)

(assert (=> start!99712 m!1091111))

(declare-fun m!1091113 () Bool)

(assert (=> start!99712 m!1091113))

(check-sat b_and!41441 (not b!1183376) (not start!99712) (not b!1183375) (not b!1183373) (not b!1183380) (not b_next!25297) tp_is_empty!29827 (not b!1183370) (not b!1183377) (not b!1183378) (not b!1183369) (not b!1183384) (not b!1183379) (not mapNonEmpty!46568) (not b!1183386) (not b!1183381) (not b_lambda!20423))
(check-sat b_and!41441 (not b_next!25297))
