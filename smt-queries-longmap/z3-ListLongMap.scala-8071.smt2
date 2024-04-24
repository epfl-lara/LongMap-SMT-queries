; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99528 () Bool)

(assert start!99528)

(declare-fun b_free!24871 () Bool)

(declare-fun b_next!24871 () Bool)

(assert (=> start!99528 (= b_free!24871 (not b_next!24871))))

(declare-fun tp!87327 () Bool)

(declare-fun b_and!40611 () Bool)

(assert (=> start!99528 (= tp!87327 b_and!40611)))

(declare-fun b!1171131 () Bool)

(declare-fun e!665718 () Bool)

(declare-fun e!665719 () Bool)

(assert (=> b!1171131 (= e!665718 e!665719)))

(declare-fun res!776803 () Bool)

(assert (=> b!1171131 (=> res!776803 e!665719)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171131 (= res!776803 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44329 0))(
  ( (V!44330 (val!14757 Int)) )
))
(declare-fun zeroValue!944 () V!44329)

(declare-datatypes ((tuple2!18870 0))(
  ( (tuple2!18871 (_1!9446 (_ BitVec 64)) (_2!9446 V!44329)) )
))
(declare-datatypes ((List!25606 0))(
  ( (Nil!25603) (Cons!25602 (h!26820 tuple2!18870) (t!37461 List!25606)) )
))
(declare-datatypes ((ListLongMap!16847 0))(
  ( (ListLongMap!16848 (toList!8439 List!25606)) )
))
(declare-fun lt!527288 () ListLongMap!16847)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13991 0))(
  ( (ValueCellFull!13991 (v!17391 V!44329)) (EmptyCell!13991) )
))
(declare-datatypes ((array!75671 0))(
  ( (array!75672 (arr!36479 (Array (_ BitVec 32) ValueCell!13991)) (size!37016 (_ BitVec 32))) )
))
(declare-fun lt!527292 () array!75671)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44329)

(declare-datatypes ((array!75673 0))(
  ( (array!75674 (arr!36480 (Array (_ BitVec 32) (_ BitVec 64))) (size!37017 (_ BitVec 32))) )
))
(declare-fun lt!527293 () array!75673)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4927 (array!75673 array!75671 (_ BitVec 32) (_ BitVec 32) V!44329 V!44329 (_ BitVec 32) Int) ListLongMap!16847)

(assert (=> b!1171131 (= lt!527288 (getCurrentListMapNoExtraKeys!4927 lt!527293 lt!527292 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527296 () V!44329)

(declare-fun _values!996 () array!75671)

(assert (=> b!1171131 (= lt!527292 (array!75672 (store (arr!36479 _values!996) i!673 (ValueCellFull!13991 lt!527296)) (size!37016 _values!996)))))

(declare-fun dynLambda!2910 (Int (_ BitVec 64)) V!44329)

(assert (=> b!1171131 (= lt!527296 (dynLambda!2910 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75673)

(declare-fun lt!527290 () ListLongMap!16847)

(assert (=> b!1171131 (= lt!527290 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171132 () Bool)

(declare-fun e!665714 () Bool)

(declare-fun e!665716 () Bool)

(assert (=> b!1171132 (= e!665714 e!665716)))

(declare-fun res!776796 () Bool)

(assert (=> b!1171132 (=> res!776796 e!665716)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1171132 (= res!776796 (not (= (select (arr!36480 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171133 () Bool)

(declare-fun res!776802 () Bool)

(declare-fun e!665721 () Bool)

(assert (=> b!1171133 (=> (not res!776802) (not e!665721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75673 (_ BitVec 32)) Bool)

(assert (=> b!1171133 (= res!776802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171134 () Bool)

(declare-fun res!776810 () Bool)

(assert (=> b!1171134 (=> (not res!776810) (not e!665721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171134 (= res!776810 (validMask!0 mask!1564))))

(declare-fun b!1171135 () Bool)

(declare-fun e!665722 () Bool)

(declare-fun e!665723 () Bool)

(declare-fun mapRes!45929 () Bool)

(assert (=> b!1171135 (= e!665722 (and e!665723 mapRes!45929))))

(declare-fun condMapEmpty!45929 () Bool)

(declare-fun mapDefault!45929 () ValueCell!13991)

(assert (=> b!1171135 (= condMapEmpty!45929 (= (arr!36479 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13991)) mapDefault!45929)))))

(declare-fun b!1171136 () Bool)

(declare-fun res!776805 () Bool)

(declare-fun e!665715 () Bool)

(assert (=> b!1171136 (=> (not res!776805) (not e!665715))))

(declare-datatypes ((List!25607 0))(
  ( (Nil!25604) (Cons!25603 (h!26821 (_ BitVec 64)) (t!37462 List!25607)) )
))
(declare-fun arrayNoDuplicates!0 (array!75673 (_ BitVec 32) List!25607) Bool)

(assert (=> b!1171136 (= res!776805 (arrayNoDuplicates!0 lt!527293 #b00000000000000000000000000000000 Nil!25604))))

(declare-fun b!1171137 () Bool)

(declare-fun res!776801 () Bool)

(assert (=> b!1171137 (=> (not res!776801) (not e!665721))))

(assert (=> b!1171137 (= res!776801 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25604))))

(declare-fun b!1171138 () Bool)

(declare-fun res!776797 () Bool)

(assert (=> b!1171138 (=> (not res!776797) (not e!665721))))

(assert (=> b!1171138 (= res!776797 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37017 _keys!1208))))))

(declare-fun b!1171139 () Bool)

(declare-fun tp_is_empty!29401 () Bool)

(assert (=> b!1171139 (= e!665723 tp_is_empty!29401)))

(declare-fun b!1171140 () Bool)

(declare-fun res!776806 () Bool)

(assert (=> b!1171140 (=> (not res!776806) (not e!665721))))

(assert (=> b!1171140 (= res!776806 (= (select (arr!36480 _keys!1208) i!673) k0!934))))

(declare-fun res!776800 () Bool)

(assert (=> start!99528 (=> (not res!776800) (not e!665721))))

(assert (=> start!99528 (= res!776800 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37017 _keys!1208))))))

(assert (=> start!99528 e!665721))

(assert (=> start!99528 tp_is_empty!29401))

(declare-fun array_inv!27952 (array!75673) Bool)

(assert (=> start!99528 (array_inv!27952 _keys!1208)))

(assert (=> start!99528 true))

(assert (=> start!99528 tp!87327))

(declare-fun array_inv!27953 (array!75671) Bool)

(assert (=> start!99528 (and (array_inv!27953 _values!996) e!665722)))

(declare-fun mapIsEmpty!45929 () Bool)

(assert (=> mapIsEmpty!45929 mapRes!45929))

(declare-fun b!1171141 () Bool)

(declare-fun res!776809 () Bool)

(assert (=> b!1171141 (=> (not res!776809) (not e!665721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171141 (= res!776809 (validKeyInArray!0 k0!934))))

(declare-fun b!1171142 () Bool)

(declare-fun e!665713 () Bool)

(assert (=> b!1171142 (= e!665713 tp_is_empty!29401)))

(declare-fun b!1171143 () Bool)

(declare-fun arrayContainsKey!0 (array!75673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171143 (= e!665716 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171144 () Bool)

(declare-fun res!776808 () Bool)

(assert (=> b!1171144 (=> (not res!776808) (not e!665721))))

(assert (=> b!1171144 (= res!776808 (and (= (size!37016 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37017 _keys!1208) (size!37016 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45929 () Bool)

(declare-fun tp!87326 () Bool)

(assert (=> mapNonEmpty!45929 (= mapRes!45929 (and tp!87326 e!665713))))

(declare-fun mapKey!45929 () (_ BitVec 32))

(declare-fun mapRest!45929 () (Array (_ BitVec 32) ValueCell!13991))

(declare-fun mapValue!45929 () ValueCell!13991)

(assert (=> mapNonEmpty!45929 (= (arr!36479 _values!996) (store mapRest!45929 mapKey!45929 mapValue!45929))))

(declare-fun b!1171145 () Bool)

(assert (=> b!1171145 (= e!665715 (not e!665718))))

(declare-fun res!776799 () Bool)

(assert (=> b!1171145 (=> res!776799 e!665718)))

(assert (=> b!1171145 (= res!776799 (bvsgt from!1455 i!673))))

(assert (=> b!1171145 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38567 0))(
  ( (Unit!38568) )
))
(declare-fun lt!527295 () Unit!38567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75673 (_ BitVec 64) (_ BitVec 32)) Unit!38567)

(assert (=> b!1171145 (= lt!527295 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171146 () Bool)

(declare-fun e!665717 () Bool)

(assert (=> b!1171146 (= e!665717 true)))

(assert (=> b!1171146 e!665714))

(declare-fun res!776798 () Bool)

(assert (=> b!1171146 (=> (not res!776798) (not e!665714))))

(declare-fun lt!527287 () ListLongMap!16847)

(declare-fun +!3780 (ListLongMap!16847 tuple2!18870) ListLongMap!16847)

(declare-fun get!18622 (ValueCell!13991 V!44329) V!44329)

(assert (=> b!1171146 (= res!776798 (= lt!527288 (+!3780 lt!527287 (tuple2!18871 (select (arr!36480 _keys!1208) from!1455) (get!18622 (select (arr!36479 _values!996) from!1455) lt!527296)))))))

(declare-fun b!1171147 () Bool)

(assert (=> b!1171147 (= e!665719 e!665717)))

(declare-fun res!776807 () Bool)

(assert (=> b!1171147 (=> res!776807 e!665717)))

(assert (=> b!1171147 (= res!776807 (not (validKeyInArray!0 (select (arr!36480 _keys!1208) from!1455))))))

(declare-fun lt!527291 () ListLongMap!16847)

(assert (=> b!1171147 (= lt!527291 lt!527287)))

(declare-fun lt!527294 () ListLongMap!16847)

(declare-fun -!1496 (ListLongMap!16847 (_ BitVec 64)) ListLongMap!16847)

(assert (=> b!1171147 (= lt!527287 (-!1496 lt!527294 k0!934))))

(assert (=> b!1171147 (= lt!527291 (getCurrentListMapNoExtraKeys!4927 lt!527293 lt!527292 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171147 (= lt!527294 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527289 () Unit!38567)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!721 (array!75673 array!75671 (_ BitVec 32) (_ BitVec 32) V!44329 V!44329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38567)

(assert (=> b!1171147 (= lt!527289 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171148 () Bool)

(assert (=> b!1171148 (= e!665721 e!665715)))

(declare-fun res!776804 () Bool)

(assert (=> b!1171148 (=> (not res!776804) (not e!665715))))

(assert (=> b!1171148 (= res!776804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527293 mask!1564))))

(assert (=> b!1171148 (= lt!527293 (array!75674 (store (arr!36480 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37017 _keys!1208)))))

(assert (= (and start!99528 res!776800) b!1171134))

(assert (= (and b!1171134 res!776810) b!1171144))

(assert (= (and b!1171144 res!776808) b!1171133))

(assert (= (and b!1171133 res!776802) b!1171137))

(assert (= (and b!1171137 res!776801) b!1171138))

(assert (= (and b!1171138 res!776797) b!1171141))

(assert (= (and b!1171141 res!776809) b!1171140))

(assert (= (and b!1171140 res!776806) b!1171148))

(assert (= (and b!1171148 res!776804) b!1171136))

(assert (= (and b!1171136 res!776805) b!1171145))

(assert (= (and b!1171145 (not res!776799)) b!1171131))

(assert (= (and b!1171131 (not res!776803)) b!1171147))

(assert (= (and b!1171147 (not res!776807)) b!1171146))

(assert (= (and b!1171146 res!776798) b!1171132))

(assert (= (and b!1171132 (not res!776796)) b!1171143))

(assert (= (and b!1171135 condMapEmpty!45929) mapIsEmpty!45929))

(assert (= (and b!1171135 (not condMapEmpty!45929)) mapNonEmpty!45929))

(get-info :version)

(assert (= (and mapNonEmpty!45929 ((_ is ValueCellFull!13991) mapValue!45929)) b!1171142))

(assert (= (and b!1171135 ((_ is ValueCellFull!13991) mapDefault!45929)) b!1171139))

(assert (= start!99528 b!1171135))

(declare-fun b_lambda!20009 () Bool)

(assert (=> (not b_lambda!20009) (not b!1171131)))

(declare-fun t!37460 () Bool)

(declare-fun tb!9675 () Bool)

(assert (=> (and start!99528 (= defaultEntry!1004 defaultEntry!1004) t!37460) tb!9675))

(declare-fun result!19925 () Bool)

(assert (=> tb!9675 (= result!19925 tp_is_empty!29401)))

(assert (=> b!1171131 t!37460))

(declare-fun b_and!40613 () Bool)

(assert (= b_and!40611 (and (=> t!37460 result!19925) b_and!40613)))

(declare-fun m!1079259 () Bool)

(assert (=> b!1171136 m!1079259))

(declare-fun m!1079261 () Bool)

(assert (=> b!1171147 m!1079261))

(declare-fun m!1079263 () Bool)

(assert (=> b!1171147 m!1079263))

(declare-fun m!1079265 () Bool)

(assert (=> b!1171147 m!1079265))

(declare-fun m!1079267 () Bool)

(assert (=> b!1171147 m!1079267))

(declare-fun m!1079269 () Bool)

(assert (=> b!1171147 m!1079269))

(declare-fun m!1079271 () Bool)

(assert (=> b!1171147 m!1079271))

(assert (=> b!1171147 m!1079269))

(declare-fun m!1079273 () Bool)

(assert (=> b!1171137 m!1079273))

(declare-fun m!1079275 () Bool)

(assert (=> b!1171148 m!1079275))

(declare-fun m!1079277 () Bool)

(assert (=> b!1171148 m!1079277))

(assert (=> b!1171132 m!1079269))

(assert (=> b!1171146 m!1079269))

(declare-fun m!1079279 () Bool)

(assert (=> b!1171146 m!1079279))

(assert (=> b!1171146 m!1079279))

(declare-fun m!1079281 () Bool)

(assert (=> b!1171146 m!1079281))

(declare-fun m!1079283 () Bool)

(assert (=> b!1171146 m!1079283))

(declare-fun m!1079285 () Bool)

(assert (=> mapNonEmpty!45929 m!1079285))

(declare-fun m!1079287 () Bool)

(assert (=> b!1171133 m!1079287))

(declare-fun m!1079289 () Bool)

(assert (=> b!1171131 m!1079289))

(declare-fun m!1079291 () Bool)

(assert (=> b!1171131 m!1079291))

(declare-fun m!1079293 () Bool)

(assert (=> b!1171131 m!1079293))

(declare-fun m!1079295 () Bool)

(assert (=> b!1171131 m!1079295))

(declare-fun m!1079297 () Bool)

(assert (=> b!1171145 m!1079297))

(declare-fun m!1079299 () Bool)

(assert (=> b!1171145 m!1079299))

(declare-fun m!1079301 () Bool)

(assert (=> b!1171140 m!1079301))

(declare-fun m!1079303 () Bool)

(assert (=> b!1171141 m!1079303))

(declare-fun m!1079305 () Bool)

(assert (=> b!1171134 m!1079305))

(declare-fun m!1079307 () Bool)

(assert (=> b!1171143 m!1079307))

(declare-fun m!1079309 () Bool)

(assert (=> start!99528 m!1079309))

(declare-fun m!1079311 () Bool)

(assert (=> start!99528 m!1079311))

(check-sat (not b!1171143) tp_is_empty!29401 (not b!1171145) b_and!40613 (not b_lambda!20009) (not start!99528) (not b!1171146) (not b!1171134) (not b!1171137) (not b_next!24871) (not b!1171131) (not b!1171148) (not b!1171136) (not b!1171141) (not b!1171147) (not mapNonEmpty!45929) (not b!1171133))
(check-sat b_and!40613 (not b_next!24871))
