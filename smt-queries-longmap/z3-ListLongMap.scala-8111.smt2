; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99526 () Bool)

(assert start!99526)

(declare-fun b_free!25111 () Bool)

(declare-fun b_next!25111 () Bool)

(assert (=> start!99526 (= b_free!25111 (not b_next!25111))))

(declare-fun tp!88046 () Bool)

(declare-fun b_and!41067 () Bool)

(assert (=> start!99526 (= tp!88046 b_and!41067)))

(declare-fun b!1177326 () Bool)

(declare-fun e!669272 () Bool)

(declare-fun e!669264 () Bool)

(assert (=> b!1177326 (= e!669272 e!669264)))

(declare-fun res!782063 () Bool)

(assert (=> b!1177326 (=> res!782063 e!669264)))

(declare-datatypes ((array!76020 0))(
  ( (array!76021 (arr!36660 (Array (_ BitVec 32) (_ BitVec 64))) (size!37198 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76020)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177326 (= res!782063 (not (= (select (arr!36660 _keys!1208) from!1455) k0!934)))))

(declare-fun res!782059 () Bool)

(declare-fun e!669268 () Bool)

(assert (=> start!99526 (=> (not res!782059) (not e!669268))))

(assert (=> start!99526 (= res!782059 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37198 _keys!1208))))))

(assert (=> start!99526 e!669268))

(declare-fun tp_is_empty!29641 () Bool)

(assert (=> start!99526 tp_is_empty!29641))

(declare-fun array_inv!28106 (array!76020) Bool)

(assert (=> start!99526 (array_inv!28106 _keys!1208)))

(assert (=> start!99526 true))

(assert (=> start!99526 tp!88046))

(declare-datatypes ((V!44649 0))(
  ( (V!44650 (val!14877 Int)) )
))
(declare-datatypes ((ValueCell!14111 0))(
  ( (ValueCellFull!14111 (v!17514 V!44649)) (EmptyCell!14111) )
))
(declare-datatypes ((array!76022 0))(
  ( (array!76023 (arr!36661 (Array (_ BitVec 32) ValueCell!14111)) (size!37199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76022)

(declare-fun e!669270 () Bool)

(declare-fun array_inv!28107 (array!76022) Bool)

(assert (=> start!99526 (and (array_inv!28107 _values!996) e!669270)))

(declare-fun b!1177327 () Bool)

(declare-fun res!782060 () Bool)

(assert (=> b!1177327 (=> (not res!782060) (not e!669268))))

(declare-datatypes ((List!25845 0))(
  ( (Nil!25842) (Cons!25841 (h!27050 (_ BitVec 64)) (t!37939 List!25845)) )
))
(declare-fun arrayNoDuplicates!0 (array!76020 (_ BitVec 32) List!25845) Bool)

(assert (=> b!1177327 (= res!782060 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25842))))

(declare-fun b!1177328 () Bool)

(declare-fun e!669263 () Bool)

(assert (=> b!1177328 (= e!669263 true)))

(declare-fun e!669266 () Bool)

(assert (=> b!1177328 e!669266))

(declare-fun res!782070 () Bool)

(assert (=> b!1177328 (=> (not res!782070) (not e!669266))))

(assert (=> b!1177328 (= res!782070 (not (= (select (arr!36660 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38719 0))(
  ( (Unit!38720) )
))
(declare-fun lt!531476 () Unit!38719)

(declare-fun e!669265 () Unit!38719)

(assert (=> b!1177328 (= lt!531476 e!669265)))

(declare-fun c!116764 () Bool)

(assert (=> b!1177328 (= c!116764 (= (select (arr!36660 _keys!1208) from!1455) k0!934))))

(assert (=> b!1177328 e!669272))

(declare-fun res!782065 () Bool)

(assert (=> b!1177328 (=> (not res!782065) (not e!669272))))

(declare-datatypes ((tuple2!19136 0))(
  ( (tuple2!19137 (_1!9579 (_ BitVec 64)) (_2!9579 V!44649)) )
))
(declare-fun lt!531479 () tuple2!19136)

(declare-datatypes ((List!25846 0))(
  ( (Nil!25843) (Cons!25842 (h!27051 tuple2!19136) (t!37940 List!25846)) )
))
(declare-datatypes ((ListLongMap!17105 0))(
  ( (ListLongMap!17106 (toList!8568 List!25846)) )
))
(declare-fun lt!531484 () ListLongMap!17105)

(declare-fun lt!531473 () ListLongMap!17105)

(declare-fun +!3871 (ListLongMap!17105 tuple2!19136) ListLongMap!17105)

(assert (=> b!1177328 (= res!782065 (= lt!531484 (+!3871 lt!531473 lt!531479)))))

(declare-fun lt!531478 () V!44649)

(declare-fun get!18737 (ValueCell!14111 V!44649) V!44649)

(assert (=> b!1177328 (= lt!531479 (tuple2!19137 (select (arr!36660 _keys!1208) from!1455) (get!18737 (select (arr!36661 _values!996) from!1455) lt!531478)))))

(declare-fun mapNonEmpty!46289 () Bool)

(declare-fun mapRes!46289 () Bool)

(declare-fun tp!88047 () Bool)

(declare-fun e!669274 () Bool)

(assert (=> mapNonEmpty!46289 (= mapRes!46289 (and tp!88047 e!669274))))

(declare-fun mapKey!46289 () (_ BitVec 32))

(declare-fun mapValue!46289 () ValueCell!14111)

(declare-fun mapRest!46289 () (Array (_ BitVec 32) ValueCell!14111))

(assert (=> mapNonEmpty!46289 (= (arr!36661 _values!996) (store mapRest!46289 mapKey!46289 mapValue!46289))))

(declare-fun b!1177329 () Bool)

(declare-fun Unit!38721 () Unit!38719)

(assert (=> b!1177329 (= e!669265 Unit!38721)))

(declare-fun lt!531475 () Unit!38719)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38719)

(assert (=> b!1177329 (= lt!531475 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177329 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531472 () Unit!38719)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76020 (_ BitVec 32) (_ BitVec 32)) Unit!38719)

(assert (=> b!1177329 (= lt!531472 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177329 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25842)))

(declare-fun lt!531480 () Unit!38719)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76020 (_ BitVec 64) (_ BitVec 32) List!25845) Unit!38719)

(assert (=> b!1177329 (= lt!531480 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25842))))

(assert (=> b!1177329 false))

(declare-fun b!1177330 () Bool)

(declare-fun res!782058 () Bool)

(assert (=> b!1177330 (=> (not res!782058) (not e!669268))))

(assert (=> b!1177330 (= res!782058 (= (select (arr!36660 _keys!1208) i!673) k0!934))))

(declare-fun b!1177331 () Bool)

(declare-fun res!782062 () Bool)

(assert (=> b!1177331 (=> (not res!782062) (not e!669268))))

(assert (=> b!1177331 (= res!782062 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37198 _keys!1208))))))

(declare-fun b!1177332 () Bool)

(declare-fun res!782066 () Bool)

(assert (=> b!1177332 (=> (not res!782066) (not e!669268))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76020 (_ BitVec 32)) Bool)

(assert (=> b!1177332 (= res!782066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177333 () Bool)

(declare-fun e!669271 () Bool)

(assert (=> b!1177333 (= e!669270 (and e!669271 mapRes!46289))))

(declare-fun condMapEmpty!46289 () Bool)

(declare-fun mapDefault!46289 () ValueCell!14111)

(assert (=> b!1177333 (= condMapEmpty!46289 (= (arr!36661 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14111)) mapDefault!46289)))))

(declare-fun b!1177334 () Bool)

(assert (=> b!1177334 (= e!669274 tp_is_empty!29641)))

(declare-fun lt!531485 () ListLongMap!17105)

(declare-fun b!1177335 () Bool)

(declare-fun lt!531483 () ListLongMap!17105)

(assert (=> b!1177335 (= e!669266 (= lt!531485 (+!3871 lt!531483 lt!531479)))))

(declare-fun b!1177336 () Bool)

(declare-fun res!782056 () Bool)

(declare-fun e!669273 () Bool)

(assert (=> b!1177336 (=> (not res!782056) (not e!669273))))

(declare-fun lt!531482 () array!76020)

(assert (=> b!1177336 (= res!782056 (arrayNoDuplicates!0 lt!531482 #b00000000000000000000000000000000 Nil!25842))))

(declare-fun b!1177337 () Bool)

(assert (=> b!1177337 (= e!669268 e!669273)))

(declare-fun res!782064 () Bool)

(assert (=> b!1177337 (=> (not res!782064) (not e!669273))))

(assert (=> b!1177337 (= res!782064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531482 mask!1564))))

(assert (=> b!1177337 (= lt!531482 (array!76021 (store (arr!36660 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37198 _keys!1208)))))

(declare-fun b!1177338 () Bool)

(declare-fun res!782061 () Bool)

(assert (=> b!1177338 (=> (not res!782061) (not e!669268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177338 (= res!782061 (validKeyInArray!0 k0!934))))

(declare-fun b!1177339 () Bool)

(assert (=> b!1177339 (= e!669264 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177340 () Bool)

(declare-fun e!669262 () Bool)

(declare-fun e!669269 () Bool)

(assert (=> b!1177340 (= e!669262 e!669269)))

(declare-fun res!782057 () Bool)

(assert (=> b!1177340 (=> res!782057 e!669269)))

(assert (=> b!1177340 (= res!782057 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531474 () array!76022)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44649)

(declare-fun zeroValue!944 () V!44649)

(declare-fun getCurrentListMapNoExtraKeys!5034 (array!76020 array!76022 (_ BitVec 32) (_ BitVec 32) V!44649 V!44649 (_ BitVec 32) Int) ListLongMap!17105)

(assert (=> b!1177340 (= lt!531484 (getCurrentListMapNoExtraKeys!5034 lt!531482 lt!531474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177340 (= lt!531474 (array!76023 (store (arr!36661 _values!996) i!673 (ValueCellFull!14111 lt!531478)) (size!37199 _values!996)))))

(declare-fun dynLambda!2951 (Int (_ BitVec 64)) V!44649)

(assert (=> b!1177340 (= lt!531478 (dynLambda!2951 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177340 (= lt!531485 (getCurrentListMapNoExtraKeys!5034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177341 () Bool)

(declare-fun res!782067 () Bool)

(assert (=> b!1177341 (=> (not res!782067) (not e!669268))))

(assert (=> b!1177341 (= res!782067 (and (= (size!37199 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37198 _keys!1208) (size!37199 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177342 () Bool)

(assert (=> b!1177342 (= e!669269 e!669263)))

(declare-fun res!782069 () Bool)

(assert (=> b!1177342 (=> res!782069 e!669263)))

(assert (=> b!1177342 (= res!782069 (not (validKeyInArray!0 (select (arr!36660 _keys!1208) from!1455))))))

(declare-fun lt!531477 () ListLongMap!17105)

(assert (=> b!1177342 (= lt!531477 lt!531473)))

(declare-fun -!1541 (ListLongMap!17105 (_ BitVec 64)) ListLongMap!17105)

(assert (=> b!1177342 (= lt!531473 (-!1541 lt!531483 k0!934))))

(assert (=> b!1177342 (= lt!531477 (getCurrentListMapNoExtraKeys!5034 lt!531482 lt!531474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177342 (= lt!531483 (getCurrentListMapNoExtraKeys!5034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531481 () Unit!38719)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!805 (array!76020 array!76022 (_ BitVec 32) (_ BitVec 32) V!44649 V!44649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38719)

(assert (=> b!1177342 (= lt!531481 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!805 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177343 () Bool)

(declare-fun res!782071 () Bool)

(assert (=> b!1177343 (=> (not res!782071) (not e!669268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177343 (= res!782071 (validMask!0 mask!1564))))

(declare-fun b!1177344 () Bool)

(assert (=> b!1177344 (= e!669273 (not e!669262))))

(declare-fun res!782068 () Bool)

(assert (=> b!1177344 (=> res!782068 e!669262)))

(assert (=> b!1177344 (= res!782068 (bvsgt from!1455 i!673))))

(assert (=> b!1177344 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531486 () Unit!38719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76020 (_ BitVec 64) (_ BitVec 32)) Unit!38719)

(assert (=> b!1177344 (= lt!531486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177345 () Bool)

(declare-fun Unit!38722 () Unit!38719)

(assert (=> b!1177345 (= e!669265 Unit!38722)))

(declare-fun b!1177346 () Bool)

(assert (=> b!1177346 (= e!669271 tp_is_empty!29641)))

(declare-fun mapIsEmpty!46289 () Bool)

(assert (=> mapIsEmpty!46289 mapRes!46289))

(assert (= (and start!99526 res!782059) b!1177343))

(assert (= (and b!1177343 res!782071) b!1177341))

(assert (= (and b!1177341 res!782067) b!1177332))

(assert (= (and b!1177332 res!782066) b!1177327))

(assert (= (and b!1177327 res!782060) b!1177331))

(assert (= (and b!1177331 res!782062) b!1177338))

(assert (= (and b!1177338 res!782061) b!1177330))

(assert (= (and b!1177330 res!782058) b!1177337))

(assert (= (and b!1177337 res!782064) b!1177336))

(assert (= (and b!1177336 res!782056) b!1177344))

(assert (= (and b!1177344 (not res!782068)) b!1177340))

(assert (= (and b!1177340 (not res!782057)) b!1177342))

(assert (= (and b!1177342 (not res!782069)) b!1177328))

(assert (= (and b!1177328 res!782065) b!1177326))

(assert (= (and b!1177326 (not res!782063)) b!1177339))

(assert (= (and b!1177328 c!116764) b!1177329))

(assert (= (and b!1177328 (not c!116764)) b!1177345))

(assert (= (and b!1177328 res!782070) b!1177335))

(assert (= (and b!1177333 condMapEmpty!46289) mapIsEmpty!46289))

(assert (= (and b!1177333 (not condMapEmpty!46289)) mapNonEmpty!46289))

(get-info :version)

(assert (= (and mapNonEmpty!46289 ((_ is ValueCellFull!14111) mapValue!46289)) b!1177334))

(assert (= (and b!1177333 ((_ is ValueCellFull!14111) mapDefault!46289)) b!1177346))

(assert (= start!99526 b!1177333))

(declare-fun b_lambda!20237 () Bool)

(assert (=> (not b_lambda!20237) (not b!1177340)))

(declare-fun t!37938 () Bool)

(declare-fun tb!9915 () Bool)

(assert (=> (and start!99526 (= defaultEntry!1004 defaultEntry!1004) t!37938) tb!9915))

(declare-fun result!20405 () Bool)

(assert (=> tb!9915 (= result!20405 tp_is_empty!29641)))

(assert (=> b!1177340 t!37938))

(declare-fun b_and!41069 () Bool)

(assert (= b_and!41067 (and (=> t!37938 result!20405) b_and!41069)))

(declare-fun m!1084787 () Bool)

(assert (=> b!1177326 m!1084787))

(declare-fun m!1084789 () Bool)

(assert (=> b!1177338 m!1084789))

(declare-fun m!1084791 () Bool)

(assert (=> b!1177335 m!1084791))

(declare-fun m!1084793 () Bool)

(assert (=> b!1177332 m!1084793))

(declare-fun m!1084795 () Bool)

(assert (=> b!1177342 m!1084795))

(declare-fun m!1084797 () Bool)

(assert (=> b!1177342 m!1084797))

(assert (=> b!1177342 m!1084787))

(assert (=> b!1177342 m!1084787))

(declare-fun m!1084799 () Bool)

(assert (=> b!1177342 m!1084799))

(declare-fun m!1084801 () Bool)

(assert (=> b!1177342 m!1084801))

(declare-fun m!1084803 () Bool)

(assert (=> b!1177342 m!1084803))

(declare-fun m!1084805 () Bool)

(assert (=> b!1177340 m!1084805))

(declare-fun m!1084807 () Bool)

(assert (=> b!1177340 m!1084807))

(declare-fun m!1084809 () Bool)

(assert (=> b!1177340 m!1084809))

(declare-fun m!1084811 () Bool)

(assert (=> b!1177340 m!1084811))

(declare-fun m!1084813 () Bool)

(assert (=> b!1177327 m!1084813))

(declare-fun m!1084815 () Bool)

(assert (=> b!1177344 m!1084815))

(declare-fun m!1084817 () Bool)

(assert (=> b!1177344 m!1084817))

(declare-fun m!1084819 () Bool)

(assert (=> b!1177337 m!1084819))

(declare-fun m!1084821 () Bool)

(assert (=> b!1177337 m!1084821))

(declare-fun m!1084823 () Bool)

(assert (=> b!1177343 m!1084823))

(declare-fun m!1084825 () Bool)

(assert (=> b!1177336 m!1084825))

(declare-fun m!1084827 () Bool)

(assert (=> b!1177330 m!1084827))

(declare-fun m!1084829 () Bool)

(assert (=> start!99526 m!1084829))

(declare-fun m!1084831 () Bool)

(assert (=> start!99526 m!1084831))

(declare-fun m!1084833 () Bool)

(assert (=> mapNonEmpty!46289 m!1084833))

(assert (=> b!1177328 m!1084787))

(declare-fun m!1084835 () Bool)

(assert (=> b!1177328 m!1084835))

(declare-fun m!1084837 () Bool)

(assert (=> b!1177328 m!1084837))

(assert (=> b!1177328 m!1084837))

(declare-fun m!1084839 () Bool)

(assert (=> b!1177328 m!1084839))

(declare-fun m!1084841 () Bool)

(assert (=> b!1177339 m!1084841))

(declare-fun m!1084843 () Bool)

(assert (=> b!1177329 m!1084843))

(declare-fun m!1084845 () Bool)

(assert (=> b!1177329 m!1084845))

(declare-fun m!1084847 () Bool)

(assert (=> b!1177329 m!1084847))

(declare-fun m!1084849 () Bool)

(assert (=> b!1177329 m!1084849))

(declare-fun m!1084851 () Bool)

(assert (=> b!1177329 m!1084851))

(check-sat (not b!1177339) (not b_next!25111) (not b!1177328) tp_is_empty!29641 b_and!41069 (not b!1177332) (not b!1177335) (not b!1177329) (not b_lambda!20237) (not b!1177337) (not start!99526) (not mapNonEmpty!46289) (not b!1177336) (not b!1177340) (not b!1177327) (not b!1177342) (not b!1177343) (not b!1177344) (not b!1177338))
(check-sat b_and!41069 (not b_next!25111))
