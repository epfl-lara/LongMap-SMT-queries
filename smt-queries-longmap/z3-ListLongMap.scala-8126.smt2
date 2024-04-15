; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99616 () Bool)

(assert start!99616)

(declare-fun b_free!25201 () Bool)

(declare-fun b_next!25201 () Bool)

(assert (=> start!99616 (= b_free!25201 (not b_next!25201))))

(declare-fun tp!88317 () Bool)

(declare-fun b_and!41247 () Bool)

(assert (=> start!99616 (= tp!88317 b_and!41247)))

(declare-fun b!1180289 () Bool)

(declare-fun e!671022 () Bool)

(declare-fun e!671029 () Bool)

(assert (=> b!1180289 (= e!671022 e!671029)))

(declare-fun res!784259 () Bool)

(assert (=> b!1180289 (=> res!784259 e!671029)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180289 (= res!784259 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44769 0))(
  ( (V!44770 (val!14922 Int)) )
))
(declare-fun zeroValue!944 () V!44769)

(declare-datatypes ((array!76198 0))(
  ( (array!76199 (arr!36749 (Array (_ BitVec 32) (_ BitVec 64))) (size!37287 (_ BitVec 32))) )
))
(declare-fun lt!533508 () array!76198)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44769)

(declare-datatypes ((ValueCell!14156 0))(
  ( (ValueCellFull!14156 (v!17559 V!44769)) (EmptyCell!14156) )
))
(declare-datatypes ((array!76200 0))(
  ( (array!76201 (arr!36750 (Array (_ BitVec 32) ValueCell!14156)) (size!37288 (_ BitVec 32))) )
))
(declare-fun lt!533504 () array!76200)

(declare-datatypes ((tuple2!19218 0))(
  ( (tuple2!19219 (_1!9620 (_ BitVec 64)) (_2!9620 V!44769)) )
))
(declare-datatypes ((List!25926 0))(
  ( (Nil!25923) (Cons!25922 (h!27131 tuple2!19218) (t!38110 List!25926)) )
))
(declare-datatypes ((ListLongMap!17187 0))(
  ( (ListLongMap!17188 (toList!8609 List!25926)) )
))
(declare-fun lt!533498 () ListLongMap!17187)

(declare-fun getCurrentListMapNoExtraKeys!5066 (array!76198 array!76200 (_ BitVec 32) (_ BitVec 32) V!44769 V!44769 (_ BitVec 32) Int) ListLongMap!17187)

(assert (=> b!1180289 (= lt!533498 (getCurrentListMapNoExtraKeys!5066 lt!533508 lt!533504 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533506 () V!44769)

(declare-fun _values!996 () array!76200)

(assert (=> b!1180289 (= lt!533504 (array!76201 (store (arr!36750 _values!996) i!673 (ValueCellFull!14156 lt!533506)) (size!37288 _values!996)))))

(declare-fun dynLambda!2978 (Int (_ BitVec 64)) V!44769)

(assert (=> b!1180289 (= lt!533506 (dynLambda!2978 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76198)

(declare-fun lt!533503 () ListLongMap!17187)

(assert (=> b!1180289 (= lt!533503 (getCurrentListMapNoExtraKeys!5066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180290 () Bool)

(declare-fun res!784260 () Bool)

(declare-fun e!671024 () Bool)

(assert (=> b!1180290 (=> (not res!784260) (not e!671024))))

(assert (=> b!1180290 (= res!784260 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37287 _keys!1208))))))

(declare-fun b!1180291 () Bool)

(declare-fun res!784265 () Bool)

(declare-fun e!671020 () Bool)

(assert (=> b!1180291 (=> (not res!784265) (not e!671020))))

(declare-fun lt!533499 () ListLongMap!17187)

(declare-fun lt!533501 () tuple2!19218)

(declare-fun +!3908 (ListLongMap!17187 tuple2!19218) ListLongMap!17187)

(assert (=> b!1180291 (= res!784265 (= lt!533503 (+!3908 lt!533499 lt!533501)))))

(declare-fun e!671025 () Bool)

(declare-fun b!1180292 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180292 (= e!671025 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180293 () Bool)

(declare-fun e!671021 () Bool)

(assert (=> b!1180293 (= e!671024 e!671021)))

(declare-fun res!784258 () Bool)

(assert (=> b!1180293 (=> (not res!784258) (not e!671021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76198 (_ BitVec 32)) Bool)

(assert (=> b!1180293 (= res!784258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533508 mask!1564))))

(assert (=> b!1180293 (= lt!533508 (array!76199 (store (arr!36749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37287 _keys!1208)))))

(declare-fun b!1180294 () Bool)

(declare-fun e!671028 () Bool)

(declare-fun e!671027 () Bool)

(declare-fun mapRes!46424 () Bool)

(assert (=> b!1180294 (= e!671028 (and e!671027 mapRes!46424))))

(declare-fun condMapEmpty!46424 () Bool)

(declare-fun mapDefault!46424 () ValueCell!14156)

(assert (=> b!1180294 (= condMapEmpty!46424 (= (arr!36750 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14156)) mapDefault!46424)))))

(declare-fun b!1180295 () Bool)

(assert (=> b!1180295 (= e!671021 (not e!671022))))

(declare-fun res!784267 () Bool)

(assert (=> b!1180295 (=> res!784267 e!671022)))

(assert (=> b!1180295 (= res!784267 (bvsgt from!1455 i!673))))

(assert (=> b!1180295 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38866 0))(
  ( (Unit!38867) )
))
(declare-fun lt!533511 () Unit!38866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76198 (_ BitVec 64) (_ BitVec 32)) Unit!38866)

(assert (=> b!1180295 (= lt!533511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180296 () Bool)

(declare-fun res!784262 () Bool)

(assert (=> b!1180296 (=> (not res!784262) (not e!671024))))

(assert (=> b!1180296 (= res!784262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180297 () Bool)

(declare-fun e!671019 () Bool)

(assert (=> b!1180297 (= e!671019 e!671025)))

(declare-fun res!784270 () Bool)

(assert (=> b!1180297 (=> res!784270 e!671025)))

(assert (=> b!1180297 (= res!784270 (not (= (select (arr!36749 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46424 () Bool)

(declare-fun tp!88316 () Bool)

(declare-fun e!671018 () Bool)

(assert (=> mapNonEmpty!46424 (= mapRes!46424 (and tp!88316 e!671018))))

(declare-fun mapRest!46424 () (Array (_ BitVec 32) ValueCell!14156))

(declare-fun mapValue!46424 () ValueCell!14156)

(declare-fun mapKey!46424 () (_ BitVec 32))

(assert (=> mapNonEmpty!46424 (= (arr!36750 _values!996) (store mapRest!46424 mapKey!46424 mapValue!46424))))

(declare-fun res!784268 () Bool)

(assert (=> start!99616 (=> (not res!784268) (not e!671024))))

(assert (=> start!99616 (= res!784268 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37287 _keys!1208))))))

(assert (=> start!99616 e!671024))

(declare-fun tp_is_empty!29731 () Bool)

(assert (=> start!99616 tp_is_empty!29731))

(declare-fun array_inv!28170 (array!76198) Bool)

(assert (=> start!99616 (array_inv!28170 _keys!1208)))

(assert (=> start!99616 true))

(assert (=> start!99616 tp!88317))

(declare-fun array_inv!28171 (array!76200) Bool)

(assert (=> start!99616 (and (array_inv!28171 _values!996) e!671028)))

(declare-fun b!1180298 () Bool)

(declare-fun res!784257 () Bool)

(assert (=> b!1180298 (=> (not res!784257) (not e!671024))))

(assert (=> b!1180298 (= res!784257 (and (= (size!37288 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37287 _keys!1208) (size!37288 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46424 () Bool)

(assert (=> mapIsEmpty!46424 mapRes!46424))

(declare-fun b!1180299 () Bool)

(declare-fun e!671023 () Bool)

(assert (=> b!1180299 (= e!671023 true)))

(assert (=> b!1180299 e!671020))

(declare-fun res!784263 () Bool)

(assert (=> b!1180299 (=> (not res!784263) (not e!671020))))

(assert (=> b!1180299 (= res!784263 (not (= (select (arr!36749 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533507 () Unit!38866)

(declare-fun e!671026 () Unit!38866)

(assert (=> b!1180299 (= lt!533507 e!671026)))

(declare-fun c!116899 () Bool)

(assert (=> b!1180299 (= c!116899 (= (select (arr!36749 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180299 e!671019))

(declare-fun res!784269 () Bool)

(assert (=> b!1180299 (=> (not res!784269) (not e!671019))))

(declare-fun lt!533500 () ListLongMap!17187)

(assert (=> b!1180299 (= res!784269 (= lt!533498 (+!3908 lt!533500 lt!533501)))))

(declare-fun get!18799 (ValueCell!14156 V!44769) V!44769)

(assert (=> b!1180299 (= lt!533501 (tuple2!19219 (select (arr!36749 _keys!1208) from!1455) (get!18799 (select (arr!36750 _values!996) from!1455) lt!533506)))))

(declare-fun b!1180300 () Bool)

(assert (=> b!1180300 (= e!671018 tp_is_empty!29731)))

(declare-fun b!1180301 () Bool)

(declare-fun res!784266 () Bool)

(assert (=> b!1180301 (=> (not res!784266) (not e!671024))))

(declare-datatypes ((List!25927 0))(
  ( (Nil!25924) (Cons!25923 (h!27132 (_ BitVec 64)) (t!38111 List!25927)) )
))
(declare-fun arrayNoDuplicates!0 (array!76198 (_ BitVec 32) List!25927) Bool)

(assert (=> b!1180301 (= res!784266 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25924))))

(declare-fun b!1180302 () Bool)

(assert (=> b!1180302 (= e!671027 tp_is_empty!29731)))

(declare-fun b!1180303 () Bool)

(assert (=> b!1180303 (= e!671029 e!671023)))

(declare-fun res!784255 () Bool)

(assert (=> b!1180303 (=> res!784255 e!671023)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180303 (= res!784255 (not (validKeyInArray!0 (select (arr!36749 _keys!1208) from!1455))))))

(declare-fun lt!533510 () ListLongMap!17187)

(assert (=> b!1180303 (= lt!533510 lt!533500)))

(declare-fun -!1571 (ListLongMap!17187 (_ BitVec 64)) ListLongMap!17187)

(assert (=> b!1180303 (= lt!533500 (-!1571 lt!533499 k0!934))))

(assert (=> b!1180303 (= lt!533510 (getCurrentListMapNoExtraKeys!5066 lt!533508 lt!533504 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180303 (= lt!533499 (getCurrentListMapNoExtraKeys!5066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533505 () Unit!38866)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!835 (array!76198 array!76200 (_ BitVec 32) (_ BitVec 32) V!44769 V!44769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38866)

(assert (=> b!1180303 (= lt!533505 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180304 () Bool)

(declare-fun res!784261 () Bool)

(assert (=> b!1180304 (=> (not res!784261) (not e!671024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180304 (= res!784261 (validMask!0 mask!1564))))

(declare-fun b!1180305 () Bool)

(declare-fun Unit!38868 () Unit!38866)

(assert (=> b!1180305 (= e!671026 Unit!38868)))

(declare-fun b!1180306 () Bool)

(declare-fun res!784256 () Bool)

(assert (=> b!1180306 (=> (not res!784256) (not e!671024))))

(assert (=> b!1180306 (= res!784256 (= (select (arr!36749 _keys!1208) i!673) k0!934))))

(declare-fun b!1180307 () Bool)

(assert (=> b!1180307 (= e!671020 (= lt!533500 lt!533510))))

(declare-fun b!1180308 () Bool)

(declare-fun Unit!38869 () Unit!38866)

(assert (=> b!1180308 (= e!671026 Unit!38869)))

(declare-fun lt!533497 () Unit!38866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76198 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38866)

(assert (=> b!1180308 (= lt!533497 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180308 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533502 () Unit!38866)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76198 (_ BitVec 32) (_ BitVec 32)) Unit!38866)

(assert (=> b!1180308 (= lt!533502 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180308 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25924)))

(declare-fun lt!533509 () Unit!38866)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76198 (_ BitVec 64) (_ BitVec 32) List!25927) Unit!38866)

(assert (=> b!1180308 (= lt!533509 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25924))))

(assert (=> b!1180308 false))

(declare-fun b!1180309 () Bool)

(declare-fun res!784264 () Bool)

(assert (=> b!1180309 (=> (not res!784264) (not e!671024))))

(assert (=> b!1180309 (= res!784264 (validKeyInArray!0 k0!934))))

(declare-fun b!1180310 () Bool)

(declare-fun res!784254 () Bool)

(assert (=> b!1180310 (=> (not res!784254) (not e!671021))))

(assert (=> b!1180310 (= res!784254 (arrayNoDuplicates!0 lt!533508 #b00000000000000000000000000000000 Nil!25924))))

(assert (= (and start!99616 res!784268) b!1180304))

(assert (= (and b!1180304 res!784261) b!1180298))

(assert (= (and b!1180298 res!784257) b!1180296))

(assert (= (and b!1180296 res!784262) b!1180301))

(assert (= (and b!1180301 res!784266) b!1180290))

(assert (= (and b!1180290 res!784260) b!1180309))

(assert (= (and b!1180309 res!784264) b!1180306))

(assert (= (and b!1180306 res!784256) b!1180293))

(assert (= (and b!1180293 res!784258) b!1180310))

(assert (= (and b!1180310 res!784254) b!1180295))

(assert (= (and b!1180295 (not res!784267)) b!1180289))

(assert (= (and b!1180289 (not res!784259)) b!1180303))

(assert (= (and b!1180303 (not res!784255)) b!1180299))

(assert (= (and b!1180299 res!784269) b!1180297))

(assert (= (and b!1180297 (not res!784270)) b!1180292))

(assert (= (and b!1180299 c!116899) b!1180308))

(assert (= (and b!1180299 (not c!116899)) b!1180305))

(assert (= (and b!1180299 res!784263) b!1180291))

(assert (= (and b!1180291 res!784265) b!1180307))

(assert (= (and b!1180294 condMapEmpty!46424) mapIsEmpty!46424))

(assert (= (and b!1180294 (not condMapEmpty!46424)) mapNonEmpty!46424))

(get-info :version)

(assert (= (and mapNonEmpty!46424 ((_ is ValueCellFull!14156) mapValue!46424)) b!1180300))

(assert (= (and b!1180294 ((_ is ValueCellFull!14156) mapDefault!46424)) b!1180302))

(assert (= start!99616 b!1180294))

(declare-fun b_lambda!20327 () Bool)

(assert (=> (not b_lambda!20327) (not b!1180289)))

(declare-fun t!38109 () Bool)

(declare-fun tb!10005 () Bool)

(assert (=> (and start!99616 (= defaultEntry!1004 defaultEntry!1004) t!38109) tb!10005))

(declare-fun result!20585 () Bool)

(assert (=> tb!10005 (= result!20585 tp_is_empty!29731)))

(assert (=> b!1180289 t!38109))

(declare-fun b_and!41249 () Bool)

(assert (= b_and!41247 (and (=> t!38109 result!20585) b_and!41249)))

(declare-fun m!1087757 () Bool)

(assert (=> mapNonEmpty!46424 m!1087757))

(declare-fun m!1087759 () Bool)

(assert (=> start!99616 m!1087759))

(declare-fun m!1087761 () Bool)

(assert (=> start!99616 m!1087761))

(declare-fun m!1087763 () Bool)

(assert (=> b!1180308 m!1087763))

(declare-fun m!1087765 () Bool)

(assert (=> b!1180308 m!1087765))

(declare-fun m!1087767 () Bool)

(assert (=> b!1180308 m!1087767))

(declare-fun m!1087769 () Bool)

(assert (=> b!1180308 m!1087769))

(declare-fun m!1087771 () Bool)

(assert (=> b!1180308 m!1087771))

(declare-fun m!1087773 () Bool)

(assert (=> b!1180306 m!1087773))

(declare-fun m!1087775 () Bool)

(assert (=> b!1180309 m!1087775))

(declare-fun m!1087777 () Bool)

(assert (=> b!1180295 m!1087777))

(declare-fun m!1087779 () Bool)

(assert (=> b!1180295 m!1087779))

(declare-fun m!1087781 () Bool)

(assert (=> b!1180297 m!1087781))

(assert (=> b!1180299 m!1087781))

(declare-fun m!1087783 () Bool)

(assert (=> b!1180299 m!1087783))

(declare-fun m!1087785 () Bool)

(assert (=> b!1180299 m!1087785))

(assert (=> b!1180299 m!1087785))

(declare-fun m!1087787 () Bool)

(assert (=> b!1180299 m!1087787))

(declare-fun m!1087789 () Bool)

(assert (=> b!1180303 m!1087789))

(declare-fun m!1087791 () Bool)

(assert (=> b!1180303 m!1087791))

(declare-fun m!1087793 () Bool)

(assert (=> b!1180303 m!1087793))

(declare-fun m!1087795 () Bool)

(assert (=> b!1180303 m!1087795))

(assert (=> b!1180303 m!1087781))

(declare-fun m!1087797 () Bool)

(assert (=> b!1180303 m!1087797))

(assert (=> b!1180303 m!1087781))

(declare-fun m!1087799 () Bool)

(assert (=> b!1180296 m!1087799))

(declare-fun m!1087801 () Bool)

(assert (=> b!1180293 m!1087801))

(declare-fun m!1087803 () Bool)

(assert (=> b!1180293 m!1087803))

(declare-fun m!1087805 () Bool)

(assert (=> b!1180310 m!1087805))

(declare-fun m!1087807 () Bool)

(assert (=> b!1180304 m!1087807))

(declare-fun m!1087809 () Bool)

(assert (=> b!1180289 m!1087809))

(declare-fun m!1087811 () Bool)

(assert (=> b!1180289 m!1087811))

(declare-fun m!1087813 () Bool)

(assert (=> b!1180289 m!1087813))

(declare-fun m!1087815 () Bool)

(assert (=> b!1180289 m!1087815))

(declare-fun m!1087817 () Bool)

(assert (=> b!1180301 m!1087817))

(declare-fun m!1087819 () Bool)

(assert (=> b!1180291 m!1087819))

(declare-fun m!1087821 () Bool)

(assert (=> b!1180292 m!1087821))

(check-sat (not mapNonEmpty!46424) tp_is_empty!29731 (not b!1180295) (not b!1180301) (not b_next!25201) (not b!1180310) (not b!1180308) (not b!1180293) (not b!1180304) (not b!1180292) (not b!1180289) b_and!41249 (not b!1180296) (not b_lambda!20327) (not start!99616) (not b!1180303) (not b!1180309) (not b!1180299) (not b!1180291))
(check-sat b_and!41249 (not b_next!25201))
