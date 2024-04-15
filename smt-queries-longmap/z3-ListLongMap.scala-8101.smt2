; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99466 () Bool)

(assert start!99466)

(declare-fun b_free!25051 () Bool)

(declare-fun b_next!25051 () Bool)

(assert (=> start!99466 (= b_free!25051 (not b_next!25051))))

(declare-fun tp!87867 () Bool)

(declare-fun b_and!40947 () Bool)

(assert (=> start!99466 (= tp!87867 b_and!40947)))

(declare-fun b!1175401 () Bool)

(declare-fun res!780650 () Bool)

(declare-fun e!668128 () Bool)

(assert (=> b!1175401 (=> (not res!780650) (not e!668128))))

(declare-datatypes ((array!75902 0))(
  ( (array!75903 (arr!36601 (Array (_ BitVec 32) (_ BitVec 64))) (size!37139 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75902)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1175401 (= res!780650 (= (select (arr!36601 _keys!1208) i!673) k0!934))))

(declare-fun b!1175402 () Bool)

(declare-fun res!780651 () Bool)

(assert (=> b!1175402 (=> (not res!780651) (not e!668128))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44569 0))(
  ( (V!44570 (val!14847 Int)) )
))
(declare-datatypes ((ValueCell!14081 0))(
  ( (ValueCellFull!14081 (v!17484 V!44569)) (EmptyCell!14081) )
))
(declare-datatypes ((array!75904 0))(
  ( (array!75905 (arr!36602 (Array (_ BitVec 32) ValueCell!14081)) (size!37140 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75904)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1175402 (= res!780651 (and (= (size!37140 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37139 _keys!1208) (size!37140 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46199 () Bool)

(declare-fun mapRes!46199 () Bool)

(declare-fun tp!87866 () Bool)

(declare-fun e!668121 () Bool)

(assert (=> mapNonEmpty!46199 (= mapRes!46199 (and tp!87866 e!668121))))

(declare-fun mapRest!46199 () (Array (_ BitVec 32) ValueCell!14081))

(declare-fun mapKey!46199 () (_ BitVec 32))

(declare-fun mapValue!46199 () ValueCell!14081)

(assert (=> mapNonEmpty!46199 (= (arr!36602 _values!996) (store mapRest!46199 mapKey!46199 mapValue!46199))))

(declare-fun b!1175403 () Bool)

(declare-fun e!668120 () Bool)

(assert (=> b!1175403 (= e!668128 e!668120)))

(declare-fun res!780648 () Bool)

(assert (=> b!1175403 (=> (not res!780648) (not e!668120))))

(declare-fun lt!530157 () array!75902)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75902 (_ BitVec 32)) Bool)

(assert (=> b!1175403 (= res!780648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530157 mask!1564))))

(assert (=> b!1175403 (= lt!530157 (array!75903 (store (arr!36601 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37139 _keys!1208)))))

(declare-fun b!1175404 () Bool)

(declare-datatypes ((Unit!38629 0))(
  ( (Unit!38630) )
))
(declare-fun e!668126 () Unit!38629)

(declare-fun Unit!38631 () Unit!38629)

(assert (=> b!1175404 (= e!668126 Unit!38631)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!530148 () Unit!38629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75902 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38629)

(assert (=> b!1175404 (= lt!530148 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175404 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530155 () Unit!38629)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75902 (_ BitVec 32) (_ BitVec 32)) Unit!38629)

(assert (=> b!1175404 (= lt!530155 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25798 0))(
  ( (Nil!25795) (Cons!25794 (h!27003 (_ BitVec 64)) (t!37832 List!25798)) )
))
(declare-fun arrayNoDuplicates!0 (array!75902 (_ BitVec 32) List!25798) Bool)

(assert (=> b!1175404 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25795)))

(declare-fun lt!530154 () Unit!38629)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75902 (_ BitVec 64) (_ BitVec 32) List!25798) Unit!38629)

(assert (=> b!1175404 (= lt!530154 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25795))))

(assert (=> b!1175404 false))

(declare-fun b!1175405 () Bool)

(declare-fun res!780652 () Bool)

(assert (=> b!1175405 (=> (not res!780652) (not e!668120))))

(assert (=> b!1175405 (= res!780652 (arrayNoDuplicates!0 lt!530157 #b00000000000000000000000000000000 Nil!25795))))

(declare-fun b!1175406 () Bool)

(declare-fun e!668125 () Bool)

(declare-fun e!668119 () Bool)

(assert (=> b!1175406 (= e!668125 e!668119)))

(declare-fun res!780646 () Bool)

(assert (=> b!1175406 (=> res!780646 e!668119)))

(assert (=> b!1175406 (= res!780646 (not (= (select (arr!36601 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175407 () Bool)

(declare-fun res!780655 () Bool)

(assert (=> b!1175407 (=> (not res!780655) (not e!668128))))

(assert (=> b!1175407 (= res!780655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175408 () Bool)

(declare-fun e!668117 () Bool)

(declare-fun e!668118 () Bool)

(assert (=> b!1175408 (= e!668117 (and e!668118 mapRes!46199))))

(declare-fun condMapEmpty!46199 () Bool)

(declare-fun mapDefault!46199 () ValueCell!14081)

(assert (=> b!1175408 (= condMapEmpty!46199 (= (arr!36602 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14081)) mapDefault!46199)))))

(declare-fun b!1175410 () Bool)

(declare-fun res!780653 () Bool)

(assert (=> b!1175410 (=> (not res!780653) (not e!668128))))

(assert (=> b!1175410 (= res!780653 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37139 _keys!1208))))))

(declare-fun b!1175411 () Bool)

(declare-fun e!668123 () Bool)

(assert (=> b!1175411 (= e!668120 (not e!668123))))

(declare-fun res!780641 () Bool)

(assert (=> b!1175411 (=> res!780641 e!668123)))

(assert (=> b!1175411 (= res!780641 (bvsgt from!1455 i!673))))

(assert (=> b!1175411 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530151 () Unit!38629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75902 (_ BitVec 64) (_ BitVec 32)) Unit!38629)

(assert (=> b!1175411 (= lt!530151 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175412 () Bool)

(declare-fun res!780645 () Bool)

(assert (=> b!1175412 (=> (not res!780645) (not e!668128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175412 (= res!780645 (validMask!0 mask!1564))))

(declare-fun b!1175413 () Bool)

(declare-fun e!668124 () Bool)

(assert (=> b!1175413 (= e!668124 true)))

(assert (=> b!1175413 (not (= (select (arr!36601 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530156 () Unit!38629)

(assert (=> b!1175413 (= lt!530156 e!668126)))

(declare-fun c!116674 () Bool)

(assert (=> b!1175413 (= c!116674 (= (select (arr!36601 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175413 e!668125))

(declare-fun res!780647 () Bool)

(assert (=> b!1175413 (=> (not res!780647) (not e!668125))))

(declare-fun lt!530158 () V!44569)

(declare-datatypes ((tuple2!19086 0))(
  ( (tuple2!19087 (_1!9554 (_ BitVec 64)) (_2!9554 V!44569)) )
))
(declare-datatypes ((List!25799 0))(
  ( (Nil!25796) (Cons!25795 (h!27004 tuple2!19086) (t!37833 List!25799)) )
))
(declare-datatypes ((ListLongMap!17055 0))(
  ( (ListLongMap!17056 (toList!8543 List!25799)) )
))
(declare-fun lt!530152 () ListLongMap!17055)

(declare-fun lt!530147 () ListLongMap!17055)

(declare-fun +!3849 (ListLongMap!17055 tuple2!19086) ListLongMap!17055)

(declare-fun get!18699 (ValueCell!14081 V!44569) V!44569)

(assert (=> b!1175413 (= res!780647 (= lt!530152 (+!3849 lt!530147 (tuple2!19087 (select (arr!36601 _keys!1208) from!1455) (get!18699 (select (arr!36602 _values!996) from!1455) lt!530158)))))))

(declare-fun b!1175414 () Bool)

(declare-fun Unit!38632 () Unit!38629)

(assert (=> b!1175414 (= e!668126 Unit!38632)))

(declare-fun b!1175415 () Bool)

(declare-fun e!668127 () Bool)

(assert (=> b!1175415 (= e!668127 e!668124)))

(declare-fun res!780649 () Bool)

(assert (=> b!1175415 (=> res!780649 e!668124)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175415 (= res!780649 (not (validKeyInArray!0 (select (arr!36601 _keys!1208) from!1455))))))

(declare-fun lt!530160 () ListLongMap!17055)

(assert (=> b!1175415 (= lt!530160 lt!530147)))

(declare-fun lt!530153 () ListLongMap!17055)

(declare-fun -!1526 (ListLongMap!17055 (_ BitVec 64)) ListLongMap!17055)

(assert (=> b!1175415 (= lt!530147 (-!1526 lt!530153 k0!934))))

(declare-fun zeroValue!944 () V!44569)

(declare-fun lt!530159 () array!75904)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44569)

(declare-fun getCurrentListMapNoExtraKeys!5013 (array!75902 array!75904 (_ BitVec 32) (_ BitVec 32) V!44569 V!44569 (_ BitVec 32) Int) ListLongMap!17055)

(assert (=> b!1175415 (= lt!530160 (getCurrentListMapNoExtraKeys!5013 lt!530157 lt!530159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175415 (= lt!530153 (getCurrentListMapNoExtraKeys!5013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530149 () Unit!38629)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!790 (array!75902 array!75904 (_ BitVec 32) (_ BitVec 32) V!44569 V!44569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38629)

(assert (=> b!1175415 (= lt!530149 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46199 () Bool)

(assert (=> mapIsEmpty!46199 mapRes!46199))

(declare-fun b!1175416 () Bool)

(declare-fun res!780644 () Bool)

(assert (=> b!1175416 (=> (not res!780644) (not e!668128))))

(assert (=> b!1175416 (= res!780644 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25795))))

(declare-fun b!1175417 () Bool)

(declare-fun tp_is_empty!29581 () Bool)

(assert (=> b!1175417 (= e!668118 tp_is_empty!29581)))

(declare-fun b!1175418 () Bool)

(assert (=> b!1175418 (= e!668123 e!668127)))

(declare-fun res!780643 () Bool)

(assert (=> b!1175418 (=> res!780643 e!668127)))

(assert (=> b!1175418 (= res!780643 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1175418 (= lt!530152 (getCurrentListMapNoExtraKeys!5013 lt!530157 lt!530159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175418 (= lt!530159 (array!75905 (store (arr!36602 _values!996) i!673 (ValueCellFull!14081 lt!530158)) (size!37140 _values!996)))))

(declare-fun dynLambda!2930 (Int (_ BitVec 64)) V!44569)

(assert (=> b!1175418 (= lt!530158 (dynLambda!2930 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530150 () ListLongMap!17055)

(assert (=> b!1175418 (= lt!530150 (getCurrentListMapNoExtraKeys!5013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175409 () Bool)

(declare-fun res!780654 () Bool)

(assert (=> b!1175409 (=> (not res!780654) (not e!668128))))

(assert (=> b!1175409 (= res!780654 (validKeyInArray!0 k0!934))))

(declare-fun res!780642 () Bool)

(assert (=> start!99466 (=> (not res!780642) (not e!668128))))

(assert (=> start!99466 (= res!780642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37139 _keys!1208))))))

(assert (=> start!99466 e!668128))

(assert (=> start!99466 tp_is_empty!29581))

(declare-fun array_inv!28066 (array!75902) Bool)

(assert (=> start!99466 (array_inv!28066 _keys!1208)))

(assert (=> start!99466 true))

(assert (=> start!99466 tp!87867))

(declare-fun array_inv!28067 (array!75904) Bool)

(assert (=> start!99466 (and (array_inv!28067 _values!996) e!668117)))

(declare-fun b!1175419 () Bool)

(assert (=> b!1175419 (= e!668121 tp_is_empty!29581)))

(declare-fun b!1175420 () Bool)

(assert (=> b!1175420 (= e!668119 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99466 res!780642) b!1175412))

(assert (= (and b!1175412 res!780645) b!1175402))

(assert (= (and b!1175402 res!780651) b!1175407))

(assert (= (and b!1175407 res!780655) b!1175416))

(assert (= (and b!1175416 res!780644) b!1175410))

(assert (= (and b!1175410 res!780653) b!1175409))

(assert (= (and b!1175409 res!780654) b!1175401))

(assert (= (and b!1175401 res!780650) b!1175403))

(assert (= (and b!1175403 res!780648) b!1175405))

(assert (= (and b!1175405 res!780652) b!1175411))

(assert (= (and b!1175411 (not res!780641)) b!1175418))

(assert (= (and b!1175418 (not res!780643)) b!1175415))

(assert (= (and b!1175415 (not res!780649)) b!1175413))

(assert (= (and b!1175413 res!780647) b!1175406))

(assert (= (and b!1175406 (not res!780646)) b!1175420))

(assert (= (and b!1175413 c!116674) b!1175404))

(assert (= (and b!1175413 (not c!116674)) b!1175414))

(assert (= (and b!1175408 condMapEmpty!46199) mapIsEmpty!46199))

(assert (= (and b!1175408 (not condMapEmpty!46199)) mapNonEmpty!46199))

(get-info :version)

(assert (= (and mapNonEmpty!46199 ((_ is ValueCellFull!14081) mapValue!46199)) b!1175419))

(assert (= (and b!1175408 ((_ is ValueCellFull!14081) mapDefault!46199)) b!1175417))

(assert (= start!99466 b!1175408))

(declare-fun b_lambda!20177 () Bool)

(assert (=> (not b_lambda!20177) (not b!1175418)))

(declare-fun t!37831 () Bool)

(declare-fun tb!9855 () Bool)

(assert (=> (and start!99466 (= defaultEntry!1004 defaultEntry!1004) t!37831) tb!9855))

(declare-fun result!20285 () Bool)

(assert (=> tb!9855 (= result!20285 tp_is_empty!29581)))

(assert (=> b!1175418 t!37831))

(declare-fun b_and!40949 () Bool)

(assert (= b_and!40947 (and (=> t!37831 result!20285) b_and!40949)))

(declare-fun m!1082825 () Bool)

(assert (=> b!1175412 m!1082825))

(declare-fun m!1082827 () Bool)

(assert (=> mapNonEmpty!46199 m!1082827))

(declare-fun m!1082829 () Bool)

(assert (=> b!1175411 m!1082829))

(declare-fun m!1082831 () Bool)

(assert (=> b!1175411 m!1082831))

(declare-fun m!1082833 () Bool)

(assert (=> b!1175404 m!1082833))

(declare-fun m!1082835 () Bool)

(assert (=> b!1175404 m!1082835))

(declare-fun m!1082837 () Bool)

(assert (=> b!1175404 m!1082837))

(declare-fun m!1082839 () Bool)

(assert (=> b!1175404 m!1082839))

(declare-fun m!1082841 () Bool)

(assert (=> b!1175404 m!1082841))

(declare-fun m!1082843 () Bool)

(assert (=> b!1175416 m!1082843))

(declare-fun m!1082845 () Bool)

(assert (=> b!1175415 m!1082845))

(declare-fun m!1082847 () Bool)

(assert (=> b!1175415 m!1082847))

(declare-fun m!1082849 () Bool)

(assert (=> b!1175415 m!1082849))

(declare-fun m!1082851 () Bool)

(assert (=> b!1175415 m!1082851))

(declare-fun m!1082853 () Bool)

(assert (=> b!1175415 m!1082853))

(declare-fun m!1082855 () Bool)

(assert (=> b!1175415 m!1082855))

(assert (=> b!1175415 m!1082853))

(declare-fun m!1082857 () Bool)

(assert (=> b!1175407 m!1082857))

(assert (=> b!1175413 m!1082853))

(declare-fun m!1082859 () Bool)

(assert (=> b!1175413 m!1082859))

(assert (=> b!1175413 m!1082859))

(declare-fun m!1082861 () Bool)

(assert (=> b!1175413 m!1082861))

(declare-fun m!1082863 () Bool)

(assert (=> b!1175413 m!1082863))

(declare-fun m!1082865 () Bool)

(assert (=> b!1175409 m!1082865))

(declare-fun m!1082867 () Bool)

(assert (=> start!99466 m!1082867))

(declare-fun m!1082869 () Bool)

(assert (=> start!99466 m!1082869))

(declare-fun m!1082871 () Bool)

(assert (=> b!1175401 m!1082871))

(declare-fun m!1082873 () Bool)

(assert (=> b!1175403 m!1082873))

(declare-fun m!1082875 () Bool)

(assert (=> b!1175403 m!1082875))

(declare-fun m!1082877 () Bool)

(assert (=> b!1175418 m!1082877))

(declare-fun m!1082879 () Bool)

(assert (=> b!1175418 m!1082879))

(declare-fun m!1082881 () Bool)

(assert (=> b!1175418 m!1082881))

(declare-fun m!1082883 () Bool)

(assert (=> b!1175418 m!1082883))

(declare-fun m!1082885 () Bool)

(assert (=> b!1175405 m!1082885))

(declare-fun m!1082887 () Bool)

(assert (=> b!1175420 m!1082887))

(assert (=> b!1175406 m!1082853))

(check-sat (not b_lambda!20177) (not b!1175403) (not b!1175404) (not b!1175418) (not mapNonEmpty!46199) b_and!40949 (not b!1175412) (not start!99466) (not b!1175413) (not b!1175415) (not b!1175405) (not b_next!25051) (not b!1175420) tp_is_empty!29581 (not b!1175411) (not b!1175407) (not b!1175416) (not b!1175409))
(check-sat b_and!40949 (not b_next!25051))
