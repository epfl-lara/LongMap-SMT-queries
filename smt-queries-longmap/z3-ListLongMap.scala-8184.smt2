; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99972 () Bool)

(assert start!99972)

(declare-fun b_free!25551 () Bool)

(declare-fun b_next!25551 () Bool)

(assert (=> start!99972 (= b_free!25551 (not b_next!25551))))

(declare-fun tp!89366 () Bool)

(declare-fun b_and!41969 () Bool)

(assert (=> start!99972 (= tp!89366 b_and!41969)))

(declare-fun b!1190622 () Bool)

(declare-fun res!791862 () Bool)

(declare-fun e!676855 () Bool)

(assert (=> b!1190622 (=> (not res!791862) (not e!676855))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!76953 0))(
  ( (array!76954 (arr!37126 (Array (_ BitVec 32) (_ BitVec 64))) (size!37662 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76953)

(assert (=> b!1190622 (= res!791862 (= (select (arr!37126 _keys!1208) i!673) k0!934))))

(declare-fun res!791861 () Bool)

(assert (=> start!99972 (=> (not res!791861) (not e!676855))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99972 (= res!791861 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37662 _keys!1208))))))

(assert (=> start!99972 e!676855))

(declare-fun tp_is_empty!30081 () Bool)

(assert (=> start!99972 tp_is_empty!30081))

(declare-fun array_inv!28312 (array!76953) Bool)

(assert (=> start!99972 (array_inv!28312 _keys!1208)))

(assert (=> start!99972 true))

(assert (=> start!99972 tp!89366))

(declare-datatypes ((V!45235 0))(
  ( (V!45236 (val!15097 Int)) )
))
(declare-datatypes ((ValueCell!14331 0))(
  ( (ValueCellFull!14331 (v!17735 V!45235)) (EmptyCell!14331) )
))
(declare-datatypes ((array!76955 0))(
  ( (array!76956 (arr!37127 (Array (_ BitVec 32) ValueCell!14331)) (size!37663 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76955)

(declare-fun e!676851 () Bool)

(declare-fun array_inv!28313 (array!76955) Bool)

(assert (=> start!99972 (and (array_inv!28313 _values!996) e!676851)))

(declare-fun b!1190623 () Bool)

(declare-fun e!676856 () Bool)

(declare-fun e!676852 () Bool)

(assert (=> b!1190623 (= e!676856 (not e!676852))))

(declare-fun res!791860 () Bool)

(assert (=> b!1190623 (=> res!791860 e!676852)))

(assert (=> b!1190623 (= res!791860 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190623 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39492 0))(
  ( (Unit!39493) )
))
(declare-fun lt!541519 () Unit!39492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76953 (_ BitVec 64) (_ BitVec 32)) Unit!39492)

(assert (=> b!1190623 (= lt!541519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46949 () Bool)

(declare-fun mapRes!46949 () Bool)

(declare-fun tp!89367 () Bool)

(declare-fun e!676854 () Bool)

(assert (=> mapNonEmpty!46949 (= mapRes!46949 (and tp!89367 e!676854))))

(declare-fun mapRest!46949 () (Array (_ BitVec 32) ValueCell!14331))

(declare-fun mapKey!46949 () (_ BitVec 32))

(declare-fun mapValue!46949 () ValueCell!14331)

(assert (=> mapNonEmpty!46949 (= (arr!37127 _values!996) (store mapRest!46949 mapKey!46949 mapValue!46949))))

(declare-fun mapIsEmpty!46949 () Bool)

(assert (=> mapIsEmpty!46949 mapRes!46949))

(declare-fun b!1190624 () Bool)

(declare-fun e!676858 () Bool)

(assert (=> b!1190624 (= e!676858 tp_is_empty!30081)))

(declare-fun b!1190625 () Bool)

(declare-fun e!676853 () Bool)

(assert (=> b!1190625 (= e!676852 e!676853)))

(declare-fun res!791854 () Bool)

(assert (=> b!1190625 (=> res!791854 e!676853)))

(assert (=> b!1190625 (= res!791854 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45235)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541520 () array!76953)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541523 () array!76955)

(declare-datatypes ((tuple2!19394 0))(
  ( (tuple2!19395 (_1!9708 (_ BitVec 64)) (_2!9708 V!45235)) )
))
(declare-datatypes ((List!26140 0))(
  ( (Nil!26137) (Cons!26136 (h!27345 tuple2!19394) (t!38683 List!26140)) )
))
(declare-datatypes ((ListLongMap!17363 0))(
  ( (ListLongMap!17364 (toList!8697 List!26140)) )
))
(declare-fun lt!541521 () ListLongMap!17363)

(declare-fun minValue!944 () V!45235)

(declare-fun getCurrentListMapNoExtraKeys!5138 (array!76953 array!76955 (_ BitVec 32) (_ BitVec 32) V!45235 V!45235 (_ BitVec 32) Int) ListLongMap!17363)

(assert (=> b!1190625 (= lt!541521 (getCurrentListMapNoExtraKeys!5138 lt!541520 lt!541523 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3076 (Int (_ BitVec 64)) V!45235)

(assert (=> b!1190625 (= lt!541523 (array!76956 (store (arr!37127 _values!996) i!673 (ValueCellFull!14331 (dynLambda!3076 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37663 _values!996)))))

(declare-fun lt!541524 () ListLongMap!17363)

(assert (=> b!1190625 (= lt!541524 (getCurrentListMapNoExtraKeys!5138 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190626 () Bool)

(assert (=> b!1190626 (= e!676855 e!676856)))

(declare-fun res!791863 () Bool)

(assert (=> b!1190626 (=> (not res!791863) (not e!676856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76953 (_ BitVec 32)) Bool)

(assert (=> b!1190626 (= res!791863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541520 mask!1564))))

(assert (=> b!1190626 (= lt!541520 (array!76954 (store (arr!37126 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37662 _keys!1208)))))

(declare-fun b!1190627 () Bool)

(assert (=> b!1190627 (= e!676853 true)))

(declare-fun -!1724 (ListLongMap!17363 (_ BitVec 64)) ListLongMap!17363)

(assert (=> b!1190627 (= (getCurrentListMapNoExtraKeys!5138 lt!541520 lt!541523 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1724 (getCurrentListMapNoExtraKeys!5138 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541522 () Unit!39492)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!933 (array!76953 array!76955 (_ BitVec 32) (_ BitVec 32) V!45235 V!45235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39492)

(assert (=> b!1190627 (= lt!541522 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!933 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190628 () Bool)

(assert (=> b!1190628 (= e!676851 (and e!676858 mapRes!46949))))

(declare-fun condMapEmpty!46949 () Bool)

(declare-fun mapDefault!46949 () ValueCell!14331)

(assert (=> b!1190628 (= condMapEmpty!46949 (= (arr!37127 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14331)) mapDefault!46949)))))

(declare-fun b!1190629 () Bool)

(declare-fun res!791856 () Bool)

(assert (=> b!1190629 (=> (not res!791856) (not e!676855))))

(assert (=> b!1190629 (= res!791856 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37662 _keys!1208))))))

(declare-fun b!1190630 () Bool)

(declare-fun res!791855 () Bool)

(assert (=> b!1190630 (=> (not res!791855) (not e!676855))))

(declare-datatypes ((List!26141 0))(
  ( (Nil!26138) (Cons!26137 (h!27346 (_ BitVec 64)) (t!38684 List!26141)) )
))
(declare-fun arrayNoDuplicates!0 (array!76953 (_ BitVec 32) List!26141) Bool)

(assert (=> b!1190630 (= res!791855 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26138))))

(declare-fun b!1190631 () Bool)

(declare-fun res!791857 () Bool)

(assert (=> b!1190631 (=> (not res!791857) (not e!676855))))

(assert (=> b!1190631 (= res!791857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190632 () Bool)

(assert (=> b!1190632 (= e!676854 tp_is_empty!30081)))

(declare-fun b!1190633 () Bool)

(declare-fun res!791852 () Bool)

(assert (=> b!1190633 (=> (not res!791852) (not e!676855))))

(assert (=> b!1190633 (= res!791852 (and (= (size!37663 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37662 _keys!1208) (size!37663 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190634 () Bool)

(declare-fun res!791858 () Bool)

(assert (=> b!1190634 (=> (not res!791858) (not e!676856))))

(assert (=> b!1190634 (= res!791858 (arrayNoDuplicates!0 lt!541520 #b00000000000000000000000000000000 Nil!26138))))

(declare-fun b!1190635 () Bool)

(declare-fun res!791859 () Bool)

(assert (=> b!1190635 (=> (not res!791859) (not e!676855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190635 (= res!791859 (validMask!0 mask!1564))))

(declare-fun b!1190636 () Bool)

(declare-fun res!791853 () Bool)

(assert (=> b!1190636 (=> (not res!791853) (not e!676855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190636 (= res!791853 (validKeyInArray!0 k0!934))))

(assert (= (and start!99972 res!791861) b!1190635))

(assert (= (and b!1190635 res!791859) b!1190633))

(assert (= (and b!1190633 res!791852) b!1190631))

(assert (= (and b!1190631 res!791857) b!1190630))

(assert (= (and b!1190630 res!791855) b!1190629))

(assert (= (and b!1190629 res!791856) b!1190636))

(assert (= (and b!1190636 res!791853) b!1190622))

(assert (= (and b!1190622 res!791862) b!1190626))

(assert (= (and b!1190626 res!791863) b!1190634))

(assert (= (and b!1190634 res!791858) b!1190623))

(assert (= (and b!1190623 (not res!791860)) b!1190625))

(assert (= (and b!1190625 (not res!791854)) b!1190627))

(assert (= (and b!1190628 condMapEmpty!46949) mapIsEmpty!46949))

(assert (= (and b!1190628 (not condMapEmpty!46949)) mapNonEmpty!46949))

(get-info :version)

(assert (= (and mapNonEmpty!46949 ((_ is ValueCellFull!14331) mapValue!46949)) b!1190632))

(assert (= (and b!1190628 ((_ is ValueCellFull!14331) mapDefault!46949)) b!1190624))

(assert (= start!99972 b!1190628))

(declare-fun b_lambda!20695 () Bool)

(assert (=> (not b_lambda!20695) (not b!1190625)))

(declare-fun t!38682 () Bool)

(declare-fun tb!10363 () Bool)

(assert (=> (and start!99972 (= defaultEntry!1004 defaultEntry!1004) t!38682) tb!10363))

(declare-fun result!21293 () Bool)

(assert (=> tb!10363 (= result!21293 tp_is_empty!30081)))

(assert (=> b!1190625 t!38682))

(declare-fun b_and!41971 () Bool)

(assert (= b_and!41969 (and (=> t!38682 result!21293) b_and!41971)))

(declare-fun m!1099173 () Bool)

(assert (=> b!1190635 m!1099173))

(declare-fun m!1099175 () Bool)

(assert (=> b!1190627 m!1099175))

(declare-fun m!1099177 () Bool)

(assert (=> b!1190627 m!1099177))

(assert (=> b!1190627 m!1099177))

(declare-fun m!1099179 () Bool)

(assert (=> b!1190627 m!1099179))

(declare-fun m!1099181 () Bool)

(assert (=> b!1190627 m!1099181))

(declare-fun m!1099183 () Bool)

(assert (=> b!1190631 m!1099183))

(declare-fun m!1099185 () Bool)

(assert (=> start!99972 m!1099185))

(declare-fun m!1099187 () Bool)

(assert (=> start!99972 m!1099187))

(declare-fun m!1099189 () Bool)

(assert (=> b!1190623 m!1099189))

(declare-fun m!1099191 () Bool)

(assert (=> b!1190623 m!1099191))

(declare-fun m!1099193 () Bool)

(assert (=> b!1190626 m!1099193))

(declare-fun m!1099195 () Bool)

(assert (=> b!1190626 m!1099195))

(declare-fun m!1099197 () Bool)

(assert (=> b!1190634 m!1099197))

(declare-fun m!1099199 () Bool)

(assert (=> b!1190636 m!1099199))

(declare-fun m!1099201 () Bool)

(assert (=> mapNonEmpty!46949 m!1099201))

(declare-fun m!1099203 () Bool)

(assert (=> b!1190622 m!1099203))

(declare-fun m!1099205 () Bool)

(assert (=> b!1190630 m!1099205))

(declare-fun m!1099207 () Bool)

(assert (=> b!1190625 m!1099207))

(declare-fun m!1099209 () Bool)

(assert (=> b!1190625 m!1099209))

(declare-fun m!1099211 () Bool)

(assert (=> b!1190625 m!1099211))

(declare-fun m!1099213 () Bool)

(assert (=> b!1190625 m!1099213))

(check-sat (not b!1190635) b_and!41971 (not b!1190636) (not b!1190623) (not mapNonEmpty!46949) (not b!1190631) (not b!1190625) (not b!1190630) (not b!1190634) (not start!99972) tp_is_empty!30081 (not b_next!25551) (not b!1190626) (not b_lambda!20695) (not b!1190627))
(check-sat b_and!41971 (not b_next!25551))
