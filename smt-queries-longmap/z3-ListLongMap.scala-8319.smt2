; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101264 () Bool)

(assert start!101264)

(declare-fun b_free!26187 () Bool)

(declare-fun b_next!26187 () Bool)

(assert (=> start!101264 (= b_free!26187 (not b_next!26187))))

(declare-fun tp!91583 () Bool)

(declare-fun b_and!43491 () Bool)

(assert (=> start!101264 (= tp!91583 b_and!43491)))

(declare-fun b!1216393 () Bool)

(declare-fun e!690606 () Bool)

(declare-fun e!690600 () Bool)

(declare-fun mapRes!48211 () Bool)

(assert (=> b!1216393 (= e!690606 (and e!690600 mapRes!48211))))

(declare-fun condMapEmpty!48211 () Bool)

(declare-datatypes ((V!46315 0))(
  ( (V!46316 (val!15502 Int)) )
))
(declare-datatypes ((ValueCell!14736 0))(
  ( (ValueCellFull!14736 (v!18155 V!46315)) (EmptyCell!14736) )
))
(declare-datatypes ((array!78555 0))(
  ( (array!78556 (arr!37912 (Array (_ BitVec 32) ValueCell!14736)) (size!38448 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78555)

(declare-fun mapDefault!48211 () ValueCell!14736)

(assert (=> b!1216393 (= condMapEmpty!48211 (= (arr!37912 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14736)) mapDefault!48211)))))

(declare-fun b!1216394 () Bool)

(declare-fun res!807723 () Bool)

(declare-fun e!690605 () Bool)

(assert (=> b!1216394 (=> (not res!807723) (not e!690605))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216394 (= res!807723 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48211 () Bool)

(declare-fun tp!91582 () Bool)

(declare-fun e!690603 () Bool)

(assert (=> mapNonEmpty!48211 (= mapRes!48211 (and tp!91582 e!690603))))

(declare-fun mapKey!48211 () (_ BitVec 32))

(declare-fun mapRest!48211 () (Array (_ BitVec 32) ValueCell!14736))

(declare-fun mapValue!48211 () ValueCell!14736)

(assert (=> mapNonEmpty!48211 (= (arr!37912 _values!996) (store mapRest!48211 mapKey!48211 mapValue!48211))))

(declare-fun b!1216395 () Bool)

(declare-fun e!690607 () Bool)

(declare-fun e!690601 () Bool)

(assert (=> b!1216395 (= e!690607 e!690601)))

(declare-fun res!807727 () Bool)

(assert (=> b!1216395 (=> res!807727 e!690601)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216395 (= res!807727 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46315)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46315)

(declare-fun lt!552886 () array!78555)

(declare-datatypes ((tuple2!19922 0))(
  ( (tuple2!19923 (_1!9972 (_ BitVec 64)) (_2!9972 V!46315)) )
))
(declare-datatypes ((List!26727 0))(
  ( (Nil!26724) (Cons!26723 (h!27932 tuple2!19922) (t!39894 List!26727)) )
))
(declare-datatypes ((ListLongMap!17891 0))(
  ( (ListLongMap!17892 (toList!8961 List!26727)) )
))
(declare-fun lt!552883 () ListLongMap!17891)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!78557 0))(
  ( (array!78558 (arr!37913 (Array (_ BitVec 32) (_ BitVec 64))) (size!38449 (_ BitVec 32))) )
))
(declare-fun lt!552888 () array!78557)

(declare-fun getCurrentListMapNoExtraKeys!5388 (array!78557 array!78555 (_ BitVec 32) (_ BitVec 32) V!46315 V!46315 (_ BitVec 32) Int) ListLongMap!17891)

(assert (=> b!1216395 (= lt!552883 (getCurrentListMapNoExtraKeys!5388 lt!552888 lt!552886 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3277 (Int (_ BitVec 64)) V!46315)

(assert (=> b!1216395 (= lt!552886 (array!78556 (store (arr!37912 _values!996) i!673 (ValueCellFull!14736 (dynLambda!3277 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38448 _values!996)))))

(declare-fun _keys!1208 () array!78557)

(declare-fun lt!552884 () ListLongMap!17891)

(assert (=> b!1216395 (= lt!552884 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216396 () Bool)

(declare-fun res!807724 () Bool)

(assert (=> b!1216396 (=> (not res!807724) (not e!690605))))

(declare-datatypes ((List!26728 0))(
  ( (Nil!26725) (Cons!26724 (h!27933 (_ BitVec 64)) (t!39895 List!26728)) )
))
(declare-fun arrayNoDuplicates!0 (array!78557 (_ BitVec 32) List!26728) Bool)

(assert (=> b!1216396 (= res!807724 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26725))))

(declare-fun b!1216397 () Bool)

(assert (=> b!1216397 (= e!690601 (bvslt from!1455 (size!38449 _keys!1208)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1880 (ListLongMap!17891 (_ BitVec 64)) ListLongMap!17891)

(assert (=> b!1216397 (= (getCurrentListMapNoExtraKeys!5388 lt!552888 lt!552886 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1880 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40330 0))(
  ( (Unit!40331) )
))
(declare-fun lt!552887 () Unit!40330)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1087 (array!78557 array!78555 (_ BitVec 32) (_ BitVec 32) V!46315 V!46315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40330)

(assert (=> b!1216397 (= lt!552887 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1087 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216398 () Bool)

(declare-fun tp_is_empty!30891 () Bool)

(assert (=> b!1216398 (= e!690603 tp_is_empty!30891)))

(declare-fun b!1216399 () Bool)

(declare-fun res!807728 () Bool)

(assert (=> b!1216399 (=> (not res!807728) (not e!690605))))

(assert (=> b!1216399 (= res!807728 (= (select (arr!37913 _keys!1208) i!673) k0!934))))

(declare-fun b!1216400 () Bool)

(declare-fun e!690602 () Bool)

(assert (=> b!1216400 (= e!690605 e!690602)))

(declare-fun res!807729 () Bool)

(assert (=> b!1216400 (=> (not res!807729) (not e!690602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78557 (_ BitVec 32)) Bool)

(assert (=> b!1216400 (= res!807729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552888 mask!1564))))

(assert (=> b!1216400 (= lt!552888 (array!78558 (store (arr!37913 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38449 _keys!1208)))))

(declare-fun b!1216401 () Bool)

(declare-fun res!807722 () Bool)

(assert (=> b!1216401 (=> (not res!807722) (not e!690605))))

(assert (=> b!1216401 (= res!807722 (and (= (size!38448 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38449 _keys!1208) (size!38448 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48211 () Bool)

(assert (=> mapIsEmpty!48211 mapRes!48211))

(declare-fun res!807720 () Bool)

(assert (=> start!101264 (=> (not res!807720) (not e!690605))))

(assert (=> start!101264 (= res!807720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38449 _keys!1208))))))

(assert (=> start!101264 e!690605))

(assert (=> start!101264 tp_is_empty!30891))

(declare-fun array_inv!28864 (array!78557) Bool)

(assert (=> start!101264 (array_inv!28864 _keys!1208)))

(assert (=> start!101264 true))

(assert (=> start!101264 tp!91583))

(declare-fun array_inv!28865 (array!78555) Bool)

(assert (=> start!101264 (and (array_inv!28865 _values!996) e!690606)))

(declare-fun b!1216402 () Bool)

(declare-fun res!807730 () Bool)

(assert (=> b!1216402 (=> (not res!807730) (not e!690605))))

(assert (=> b!1216402 (= res!807730 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38449 _keys!1208))))))

(declare-fun b!1216403 () Bool)

(assert (=> b!1216403 (= e!690602 (not e!690607))))

(declare-fun res!807731 () Bool)

(assert (=> b!1216403 (=> res!807731 e!690607)))

(assert (=> b!1216403 (= res!807731 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216403 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552885 () Unit!40330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78557 (_ BitVec 64) (_ BitVec 32)) Unit!40330)

(assert (=> b!1216403 (= lt!552885 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216404 () Bool)

(declare-fun res!807726 () Bool)

(assert (=> b!1216404 (=> (not res!807726) (not e!690605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216404 (= res!807726 (validKeyInArray!0 k0!934))))

(declare-fun b!1216405 () Bool)

(assert (=> b!1216405 (= e!690600 tp_is_empty!30891)))

(declare-fun b!1216406 () Bool)

(declare-fun res!807721 () Bool)

(assert (=> b!1216406 (=> (not res!807721) (not e!690602))))

(assert (=> b!1216406 (= res!807721 (arrayNoDuplicates!0 lt!552888 #b00000000000000000000000000000000 Nil!26725))))

(declare-fun b!1216407 () Bool)

(declare-fun res!807725 () Bool)

(assert (=> b!1216407 (=> (not res!807725) (not e!690605))))

(assert (=> b!1216407 (= res!807725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101264 res!807720) b!1216394))

(assert (= (and b!1216394 res!807723) b!1216401))

(assert (= (and b!1216401 res!807722) b!1216407))

(assert (= (and b!1216407 res!807725) b!1216396))

(assert (= (and b!1216396 res!807724) b!1216402))

(assert (= (and b!1216402 res!807730) b!1216404))

(assert (= (and b!1216404 res!807726) b!1216399))

(assert (= (and b!1216399 res!807728) b!1216400))

(assert (= (and b!1216400 res!807729) b!1216406))

(assert (= (and b!1216406 res!807721) b!1216403))

(assert (= (and b!1216403 (not res!807731)) b!1216395))

(assert (= (and b!1216395 (not res!807727)) b!1216397))

(assert (= (and b!1216393 condMapEmpty!48211) mapIsEmpty!48211))

(assert (= (and b!1216393 (not condMapEmpty!48211)) mapNonEmpty!48211))

(get-info :version)

(assert (= (and mapNonEmpty!48211 ((_ is ValueCellFull!14736) mapValue!48211)) b!1216398))

(assert (= (and b!1216393 ((_ is ValueCellFull!14736) mapDefault!48211)) b!1216405))

(assert (= start!101264 b!1216393))

(declare-fun b_lambda!21863 () Bool)

(assert (=> (not b_lambda!21863) (not b!1216395)))

(declare-fun t!39893 () Bool)

(declare-fun tb!10987 () Bool)

(assert (=> (and start!101264 (= defaultEntry!1004 defaultEntry!1004) t!39893) tb!10987))

(declare-fun result!22571 () Bool)

(assert (=> tb!10987 (= result!22571 tp_is_empty!30891)))

(assert (=> b!1216395 t!39893))

(declare-fun b_and!43493 () Bool)

(assert (= b_and!43491 (and (=> t!39893 result!22571) b_and!43493)))

(declare-fun m!1121151 () Bool)

(assert (=> b!1216396 m!1121151))

(declare-fun m!1121153 () Bool)

(assert (=> b!1216399 m!1121153))

(declare-fun m!1121155 () Bool)

(assert (=> b!1216407 m!1121155))

(declare-fun m!1121157 () Bool)

(assert (=> b!1216395 m!1121157))

(declare-fun m!1121159 () Bool)

(assert (=> b!1216395 m!1121159))

(declare-fun m!1121161 () Bool)

(assert (=> b!1216395 m!1121161))

(declare-fun m!1121163 () Bool)

(assert (=> b!1216395 m!1121163))

(declare-fun m!1121165 () Bool)

(assert (=> b!1216406 m!1121165))

(declare-fun m!1121167 () Bool)

(assert (=> b!1216394 m!1121167))

(declare-fun m!1121169 () Bool)

(assert (=> start!101264 m!1121169))

(declare-fun m!1121171 () Bool)

(assert (=> start!101264 m!1121171))

(declare-fun m!1121173 () Bool)

(assert (=> mapNonEmpty!48211 m!1121173))

(declare-fun m!1121175 () Bool)

(assert (=> b!1216404 m!1121175))

(declare-fun m!1121177 () Bool)

(assert (=> b!1216397 m!1121177))

(declare-fun m!1121179 () Bool)

(assert (=> b!1216397 m!1121179))

(assert (=> b!1216397 m!1121179))

(declare-fun m!1121181 () Bool)

(assert (=> b!1216397 m!1121181))

(declare-fun m!1121183 () Bool)

(assert (=> b!1216397 m!1121183))

(declare-fun m!1121185 () Bool)

(assert (=> b!1216403 m!1121185))

(declare-fun m!1121187 () Bool)

(assert (=> b!1216403 m!1121187))

(declare-fun m!1121189 () Bool)

(assert (=> b!1216400 m!1121189))

(declare-fun m!1121191 () Bool)

(assert (=> b!1216400 m!1121191))

(check-sat (not b!1216400) (not mapNonEmpty!48211) tp_is_empty!30891 (not b_lambda!21863) (not b!1216403) (not b!1216395) (not b!1216397) (not b_next!26187) (not start!101264) (not b!1216407) (not b!1216394) (not b!1216406) (not b!1216404) (not b!1216396) b_and!43493)
(check-sat b_and!43493 (not b_next!26187))
