; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99580 () Bool)

(assert start!99580)

(declare-fun b_free!25165 () Bool)

(declare-fun b_next!25165 () Bool)

(assert (=> start!99580 (= b_free!25165 (not b_next!25165))))

(declare-fun tp!88209 () Bool)

(declare-fun b_and!41175 () Bool)

(assert (=> start!99580 (= tp!88209 b_and!41175)))

(declare-fun b!1179081 () Bool)

(declare-fun e!670320 () Bool)

(assert (=> b!1179081 (= e!670320 true)))

(declare-fun e!670327 () Bool)

(assert (=> b!1179081 e!670327))

(declare-fun res!783365 () Bool)

(assert (=> b!1179081 (=> (not res!783365) (not e!670327))))

(declare-datatypes ((array!76128 0))(
  ( (array!76129 (arr!36714 (Array (_ BitVec 32) (_ BitVec 64))) (size!37252 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76128)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179081 (= res!783365 (not (= (select (arr!36714 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38811 0))(
  ( (Unit!38812) )
))
(declare-fun lt!532689 () Unit!38811)

(declare-fun e!670318 () Unit!38811)

(assert (=> b!1179081 (= lt!532689 e!670318)))

(declare-fun c!116845 () Bool)

(assert (=> b!1179081 (= c!116845 (= (select (arr!36714 _keys!1208) from!1455) k0!934))))

(declare-fun e!670326 () Bool)

(assert (=> b!1179081 e!670326))

(declare-fun res!783366 () Bool)

(assert (=> b!1179081 (=> (not res!783366) (not e!670326))))

(declare-datatypes ((V!44721 0))(
  ( (V!44722 (val!14904 Int)) )
))
(declare-datatypes ((tuple2!19186 0))(
  ( (tuple2!19187 (_1!9604 (_ BitVec 64)) (_2!9604 V!44721)) )
))
(declare-fun lt!532698 () tuple2!19186)

(declare-datatypes ((List!25894 0))(
  ( (Nil!25891) (Cons!25890 (h!27099 tuple2!19186) (t!38042 List!25894)) )
))
(declare-datatypes ((ListLongMap!17155 0))(
  ( (ListLongMap!17156 (toList!8593 List!25894)) )
))
(declare-fun lt!532699 () ListLongMap!17155)

(declare-fun lt!532701 () ListLongMap!17155)

(declare-fun +!3893 (ListLongMap!17155 tuple2!19186) ListLongMap!17155)

(assert (=> b!1179081 (= res!783366 (= lt!532699 (+!3893 lt!532701 lt!532698)))))

(declare-datatypes ((ValueCell!14138 0))(
  ( (ValueCellFull!14138 (v!17541 V!44721)) (EmptyCell!14138) )
))
(declare-datatypes ((array!76130 0))(
  ( (array!76131 (arr!36715 (Array (_ BitVec 32) ValueCell!14138)) (size!37253 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76130)

(declare-fun lt!532691 () V!44721)

(declare-fun get!18774 (ValueCell!14138 V!44721) V!44721)

(assert (=> b!1179081 (= lt!532698 (tuple2!19187 (select (arr!36714 _keys!1208) from!1455) (get!18774 (select (arr!36715 _values!996) from!1455) lt!532691)))))

(declare-fun b!1179082 () Bool)

(declare-fun res!783353 () Bool)

(declare-fun e!670324 () Bool)

(assert (=> b!1179082 (=> (not res!783353) (not e!670324))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76128 (_ BitVec 32)) Bool)

(assert (=> b!1179082 (= res!783353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179083 () Bool)

(declare-fun res!783359 () Bool)

(assert (=> b!1179083 (=> (not res!783359) (not e!670324))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179083 (= res!783359 (= (select (arr!36714 _keys!1208) i!673) k0!934))))

(declare-fun b!1179085 () Bool)

(declare-fun res!783363 () Bool)

(assert (=> b!1179085 (=> (not res!783363) (not e!670324))))

(declare-datatypes ((List!25895 0))(
  ( (Nil!25892) (Cons!25891 (h!27100 (_ BitVec 64)) (t!38043 List!25895)) )
))
(declare-fun arrayNoDuplicates!0 (array!76128 (_ BitVec 32) List!25895) Bool)

(assert (=> b!1179085 (= res!783363 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25892))))

(declare-fun b!1179086 () Bool)

(declare-fun res!783355 () Bool)

(declare-fun e!670323 () Bool)

(assert (=> b!1179086 (=> (not res!783355) (not e!670323))))

(declare-fun lt!532693 () array!76128)

(assert (=> b!1179086 (= res!783355 (arrayNoDuplicates!0 lt!532693 #b00000000000000000000000000000000 Nil!25892))))

(declare-fun b!1179087 () Bool)

(declare-fun e!670321 () Bool)

(assert (=> b!1179087 (= e!670326 e!670321)))

(declare-fun res!783360 () Bool)

(assert (=> b!1179087 (=> res!783360 e!670321)))

(assert (=> b!1179087 (= res!783360 (not (= (select (arr!36714 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179088 () Bool)

(declare-fun e!670322 () Bool)

(assert (=> b!1179088 (= e!670322 e!670320)))

(declare-fun res!783364 () Bool)

(assert (=> b!1179088 (=> res!783364 e!670320)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179088 (= res!783364 (not (validKeyInArray!0 (select (arr!36714 _keys!1208) from!1455))))))

(declare-fun lt!532688 () ListLongMap!17155)

(assert (=> b!1179088 (= lt!532688 lt!532701)))

(declare-fun lt!532690 () ListLongMap!17155)

(declare-fun -!1560 (ListLongMap!17155 (_ BitVec 64)) ListLongMap!17155)

(assert (=> b!1179088 (= lt!532701 (-!1560 lt!532690 k0!934))))

(declare-fun zeroValue!944 () V!44721)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532700 () array!76130)

(declare-fun minValue!944 () V!44721)

(declare-fun getCurrentListMapNoExtraKeys!5054 (array!76128 array!76130 (_ BitVec 32) (_ BitVec 32) V!44721 V!44721 (_ BitVec 32) Int) ListLongMap!17155)

(assert (=> b!1179088 (= lt!532688 (getCurrentListMapNoExtraKeys!5054 lt!532693 lt!532700 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179088 (= lt!532690 (getCurrentListMapNoExtraKeys!5054 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532696 () Unit!38811)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!824 (array!76128 array!76130 (_ BitVec 32) (_ BitVec 32) V!44721 V!44721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38811)

(assert (=> b!1179088 (= lt!532696 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532687 () ListLongMap!17155)

(declare-fun b!1179089 () Bool)

(assert (=> b!1179089 (= e!670327 (= lt!532687 (+!3893 lt!532690 lt!532698)))))

(declare-fun mapIsEmpty!46370 () Bool)

(declare-fun mapRes!46370 () Bool)

(assert (=> mapIsEmpty!46370 mapRes!46370))

(declare-fun b!1179090 () Bool)

(declare-fun Unit!38813 () Unit!38811)

(assert (=> b!1179090 (= e!670318 Unit!38813)))

(declare-fun b!1179091 () Bool)

(declare-fun res!783362 () Bool)

(assert (=> b!1179091 (=> (not res!783362) (not e!670324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179091 (= res!783362 (validMask!0 mask!1564))))

(declare-fun b!1179092 () Bool)

(declare-fun e!670319 () Bool)

(declare-fun tp_is_empty!29695 () Bool)

(assert (=> b!1179092 (= e!670319 tp_is_empty!29695)))

(declare-fun b!1179093 () Bool)

(declare-fun Unit!38814 () Unit!38811)

(assert (=> b!1179093 (= e!670318 Unit!38814)))

(declare-fun lt!532695 () Unit!38811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76128 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38811)

(assert (=> b!1179093 (= lt!532695 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179093 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532697 () Unit!38811)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76128 (_ BitVec 32) (_ BitVec 32)) Unit!38811)

(assert (=> b!1179093 (= lt!532697 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179093 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25892)))

(declare-fun lt!532692 () Unit!38811)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76128 (_ BitVec 64) (_ BitVec 32) List!25895) Unit!38811)

(assert (=> b!1179093 (= lt!532692 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25892))))

(assert (=> b!1179093 false))

(declare-fun b!1179094 () Bool)

(declare-fun e!670316 () Bool)

(assert (=> b!1179094 (= e!670323 (not e!670316))))

(declare-fun res!783352 () Bool)

(assert (=> b!1179094 (=> res!783352 e!670316)))

(assert (=> b!1179094 (= res!783352 (bvsgt from!1455 i!673))))

(assert (=> b!1179094 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532694 () Unit!38811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76128 (_ BitVec 64) (_ BitVec 32)) Unit!38811)

(assert (=> b!1179094 (= lt!532694 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179095 () Bool)

(declare-fun res!783361 () Bool)

(assert (=> b!1179095 (=> (not res!783361) (not e!670324))))

(assert (=> b!1179095 (= res!783361 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37252 _keys!1208))))))

(declare-fun b!1179096 () Bool)

(declare-fun e!670317 () Bool)

(assert (=> b!1179096 (= e!670317 tp_is_empty!29695)))

(declare-fun b!1179097 () Bool)

(assert (=> b!1179097 (= e!670316 e!670322)))

(declare-fun res!783356 () Bool)

(assert (=> b!1179097 (=> res!783356 e!670322)))

(assert (=> b!1179097 (= res!783356 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179097 (= lt!532699 (getCurrentListMapNoExtraKeys!5054 lt!532693 lt!532700 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179097 (= lt!532700 (array!76131 (store (arr!36715 _values!996) i!673 (ValueCellFull!14138 lt!532691)) (size!37253 _values!996)))))

(declare-fun dynLambda!2967 (Int (_ BitVec 64)) V!44721)

(assert (=> b!1179097 (= lt!532691 (dynLambda!2967 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179097 (= lt!532687 (getCurrentListMapNoExtraKeys!5054 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179084 () Bool)

(assert (=> b!1179084 (= e!670324 e!670323)))

(declare-fun res!783367 () Bool)

(assert (=> b!1179084 (=> (not res!783367) (not e!670323))))

(assert (=> b!1179084 (= res!783367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532693 mask!1564))))

(assert (=> b!1179084 (= lt!532693 (array!76129 (store (arr!36714 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37252 _keys!1208)))))

(declare-fun res!783358 () Bool)

(assert (=> start!99580 (=> (not res!783358) (not e!670324))))

(assert (=> start!99580 (= res!783358 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37252 _keys!1208))))))

(assert (=> start!99580 e!670324))

(assert (=> start!99580 tp_is_empty!29695))

(declare-fun array_inv!28144 (array!76128) Bool)

(assert (=> start!99580 (array_inv!28144 _keys!1208)))

(assert (=> start!99580 true))

(assert (=> start!99580 tp!88209))

(declare-fun e!670315 () Bool)

(declare-fun array_inv!28145 (array!76130) Bool)

(assert (=> start!99580 (and (array_inv!28145 _values!996) e!670315)))

(declare-fun b!1179098 () Bool)

(assert (=> b!1179098 (= e!670321 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179099 () Bool)

(assert (=> b!1179099 (= e!670315 (and e!670317 mapRes!46370))))

(declare-fun condMapEmpty!46370 () Bool)

(declare-fun mapDefault!46370 () ValueCell!14138)

(assert (=> b!1179099 (= condMapEmpty!46370 (= (arr!36715 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14138)) mapDefault!46370)))))

(declare-fun b!1179100 () Bool)

(declare-fun res!783354 () Bool)

(assert (=> b!1179100 (=> (not res!783354) (not e!670324))))

(assert (=> b!1179100 (= res!783354 (and (= (size!37253 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37252 _keys!1208) (size!37253 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179101 () Bool)

(declare-fun res!783357 () Bool)

(assert (=> b!1179101 (=> (not res!783357) (not e!670324))))

(assert (=> b!1179101 (= res!783357 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46370 () Bool)

(declare-fun tp!88208 () Bool)

(assert (=> mapNonEmpty!46370 (= mapRes!46370 (and tp!88208 e!670319))))

(declare-fun mapKey!46370 () (_ BitVec 32))

(declare-fun mapRest!46370 () (Array (_ BitVec 32) ValueCell!14138))

(declare-fun mapValue!46370 () ValueCell!14138)

(assert (=> mapNonEmpty!46370 (= (arr!36715 _values!996) (store mapRest!46370 mapKey!46370 mapValue!46370))))

(assert (= (and start!99580 res!783358) b!1179091))

(assert (= (and b!1179091 res!783362) b!1179100))

(assert (= (and b!1179100 res!783354) b!1179082))

(assert (= (and b!1179082 res!783353) b!1179085))

(assert (= (and b!1179085 res!783363) b!1179095))

(assert (= (and b!1179095 res!783361) b!1179101))

(assert (= (and b!1179101 res!783357) b!1179083))

(assert (= (and b!1179083 res!783359) b!1179084))

(assert (= (and b!1179084 res!783367) b!1179086))

(assert (= (and b!1179086 res!783355) b!1179094))

(assert (= (and b!1179094 (not res!783352)) b!1179097))

(assert (= (and b!1179097 (not res!783356)) b!1179088))

(assert (= (and b!1179088 (not res!783364)) b!1179081))

(assert (= (and b!1179081 res!783366) b!1179087))

(assert (= (and b!1179087 (not res!783360)) b!1179098))

(assert (= (and b!1179081 c!116845) b!1179093))

(assert (= (and b!1179081 (not c!116845)) b!1179090))

(assert (= (and b!1179081 res!783365) b!1179089))

(assert (= (and b!1179099 condMapEmpty!46370) mapIsEmpty!46370))

(assert (= (and b!1179099 (not condMapEmpty!46370)) mapNonEmpty!46370))

(get-info :version)

(assert (= (and mapNonEmpty!46370 ((_ is ValueCellFull!14138) mapValue!46370)) b!1179092))

(assert (= (and b!1179099 ((_ is ValueCellFull!14138) mapDefault!46370)) b!1179096))

(assert (= start!99580 b!1179099))

(declare-fun b_lambda!20291 () Bool)

(assert (=> (not b_lambda!20291) (not b!1179097)))

(declare-fun t!38041 () Bool)

(declare-fun tb!9969 () Bool)

(assert (=> (and start!99580 (= defaultEntry!1004 defaultEntry!1004) t!38041) tb!9969))

(declare-fun result!20513 () Bool)

(assert (=> tb!9969 (= result!20513 tp_is_empty!29695)))

(assert (=> b!1179097 t!38041))

(declare-fun b_and!41177 () Bool)

(assert (= b_and!41175 (and (=> t!38041 result!20513) b_and!41177)))

(declare-fun m!1086569 () Bool)

(assert (=> b!1179094 m!1086569))

(declare-fun m!1086571 () Bool)

(assert (=> b!1179094 m!1086571))

(declare-fun m!1086573 () Bool)

(assert (=> b!1179084 m!1086573))

(declare-fun m!1086575 () Bool)

(assert (=> b!1179084 m!1086575))

(declare-fun m!1086577 () Bool)

(assert (=> b!1179082 m!1086577))

(declare-fun m!1086579 () Bool)

(assert (=> b!1179085 m!1086579))

(declare-fun m!1086581 () Bool)

(assert (=> b!1179097 m!1086581))

(declare-fun m!1086583 () Bool)

(assert (=> b!1179097 m!1086583))

(declare-fun m!1086585 () Bool)

(assert (=> b!1179097 m!1086585))

(declare-fun m!1086587 () Bool)

(assert (=> b!1179097 m!1086587))

(declare-fun m!1086589 () Bool)

(assert (=> start!99580 m!1086589))

(declare-fun m!1086591 () Bool)

(assert (=> start!99580 m!1086591))

(declare-fun m!1086593 () Bool)

(assert (=> b!1179101 m!1086593))

(declare-fun m!1086595 () Bool)

(assert (=> b!1179081 m!1086595))

(declare-fun m!1086597 () Bool)

(assert (=> b!1179081 m!1086597))

(declare-fun m!1086599 () Bool)

(assert (=> b!1179081 m!1086599))

(assert (=> b!1179081 m!1086599))

(declare-fun m!1086601 () Bool)

(assert (=> b!1179081 m!1086601))

(declare-fun m!1086603 () Bool)

(assert (=> b!1179091 m!1086603))

(declare-fun m!1086605 () Bool)

(assert (=> b!1179088 m!1086605))

(declare-fun m!1086607 () Bool)

(assert (=> b!1179088 m!1086607))

(assert (=> b!1179088 m!1086595))

(declare-fun m!1086609 () Bool)

(assert (=> b!1179088 m!1086609))

(declare-fun m!1086611 () Bool)

(assert (=> b!1179088 m!1086611))

(assert (=> b!1179088 m!1086595))

(declare-fun m!1086613 () Bool)

(assert (=> b!1179088 m!1086613))

(declare-fun m!1086615 () Bool)

(assert (=> b!1179098 m!1086615))

(declare-fun m!1086617 () Bool)

(assert (=> b!1179083 m!1086617))

(assert (=> b!1179087 m!1086595))

(declare-fun m!1086619 () Bool)

(assert (=> b!1179089 m!1086619))

(declare-fun m!1086621 () Bool)

(assert (=> b!1179086 m!1086621))

(declare-fun m!1086623 () Bool)

(assert (=> b!1179093 m!1086623))

(declare-fun m!1086625 () Bool)

(assert (=> b!1179093 m!1086625))

(declare-fun m!1086627 () Bool)

(assert (=> b!1179093 m!1086627))

(declare-fun m!1086629 () Bool)

(assert (=> b!1179093 m!1086629))

(declare-fun m!1086631 () Bool)

(assert (=> b!1179093 m!1086631))

(declare-fun m!1086633 () Bool)

(assert (=> mapNonEmpty!46370 m!1086633))

(check-sat (not b_lambda!20291) (not b!1179082) (not b!1179094) (not b!1179084) tp_is_empty!29695 b_and!41177 (not b!1179085) (not b_next!25165) (not b!1179086) (not start!99580) (not b!1179098) (not b!1179089) (not b!1179101) (not mapNonEmpty!46370) (not b!1179088) (not b!1179093) (not b!1179081) (not b!1179097) (not b!1179091))
(check-sat b_and!41177 (not b_next!25165))
