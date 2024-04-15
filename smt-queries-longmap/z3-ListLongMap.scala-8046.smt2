; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99110 () Bool)

(assert start!99110)

(declare-fun b_free!24721 () Bool)

(declare-fun b_next!24721 () Bool)

(assert (=> start!99110 (= b_free!24721 (not b_next!24721))))

(declare-fun tp!86873 () Bool)

(declare-fun b_and!40269 () Bool)

(assert (=> start!99110 (= tp!86873 b_and!40269)))

(declare-fun b!1165873 () Bool)

(declare-fun res!773295 () Bool)

(declare-fun e!662738 () Bool)

(assert (=> b!1165873 (=> (not res!773295) (not e!662738))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165873 (= res!773295 (validKeyInArray!0 k0!934))))

(declare-fun b!1165874 () Bool)

(declare-fun res!773297 () Bool)

(assert (=> b!1165874 (=> (not res!773297) (not e!662738))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165874 (= res!773297 (validMask!0 mask!1564))))

(declare-fun b!1165875 () Bool)

(declare-fun res!773291 () Bool)

(assert (=> b!1165875 (=> (not res!773291) (not e!662738))))

(declare-datatypes ((array!75254 0))(
  ( (array!75255 (arr!36278 (Array (_ BitVec 32) (_ BitVec 64))) (size!36816 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75254)

(declare-datatypes ((List!25529 0))(
  ( (Nil!25526) (Cons!25525 (h!26734 (_ BitVec 64)) (t!37233 List!25529)) )
))
(declare-fun arrayNoDuplicates!0 (array!75254 (_ BitVec 32) List!25529) Bool)

(assert (=> b!1165875 (= res!773291 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25526))))

(declare-fun b!1165876 () Bool)

(declare-fun res!773293 () Bool)

(declare-fun e!662737 () Bool)

(assert (=> b!1165876 (=> (not res!773293) (not e!662737))))

(declare-fun lt!524894 () array!75254)

(assert (=> b!1165876 (= res!773293 (arrayNoDuplicates!0 lt!524894 #b00000000000000000000000000000000 Nil!25526))))

(declare-fun b!1165877 () Bool)

(declare-fun res!773287 () Bool)

(assert (=> b!1165877 (=> (not res!773287) (not e!662738))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44129 0))(
  ( (V!44130 (val!14682 Int)) )
))
(declare-datatypes ((ValueCell!13916 0))(
  ( (ValueCellFull!13916 (v!17318 V!44129)) (EmptyCell!13916) )
))
(declare-datatypes ((array!75256 0))(
  ( (array!75257 (arr!36279 (Array (_ BitVec 32) ValueCell!13916)) (size!36817 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75256)

(assert (=> b!1165877 (= res!773287 (and (= (size!36817 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36816 _keys!1208) (size!36817 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165878 () Bool)

(declare-fun e!662734 () Bool)

(declare-fun tp_is_empty!29251 () Bool)

(assert (=> b!1165878 (= e!662734 tp_is_empty!29251)))

(declare-fun b!1165879 () Bool)

(declare-fun e!662733 () Bool)

(declare-fun e!662739 () Bool)

(assert (=> b!1165879 (= e!662733 e!662739)))

(declare-fun res!773294 () Bool)

(assert (=> b!1165879 (=> res!773294 e!662739)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165879 (= res!773294 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44129)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18812 0))(
  ( (tuple2!18813 (_1!9417 (_ BitVec 64)) (_2!9417 V!44129)) )
))
(declare-datatypes ((List!25530 0))(
  ( (Nil!25527) (Cons!25526 (h!26735 tuple2!18812) (t!37234 List!25530)) )
))
(declare-datatypes ((ListLongMap!16781 0))(
  ( (ListLongMap!16782 (toList!8406 List!25530)) )
))
(declare-fun lt!524893 () ListLongMap!16781)

(declare-fun lt!524892 () array!75256)

(declare-fun minValue!944 () V!44129)

(declare-fun getCurrentListMapNoExtraKeys!4882 (array!75254 array!75256 (_ BitVec 32) (_ BitVec 32) V!44129 V!44129 (_ BitVec 32) Int) ListLongMap!16781)

(assert (=> b!1165879 (= lt!524893 (getCurrentListMapNoExtraKeys!4882 lt!524894 lt!524892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2815 (Int (_ BitVec 64)) V!44129)

(assert (=> b!1165879 (= lt!524892 (array!75257 (store (arr!36279 _values!996) i!673 (ValueCellFull!13916 (dynLambda!2815 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36817 _values!996)))))

(declare-fun lt!524895 () ListLongMap!16781)

(assert (=> b!1165879 (= lt!524895 (getCurrentListMapNoExtraKeys!4882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!773289 () Bool)

(assert (=> start!99110 (=> (not res!773289) (not e!662738))))

(assert (=> start!99110 (= res!773289 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36816 _keys!1208))))))

(assert (=> start!99110 e!662738))

(assert (=> start!99110 tp_is_empty!29251))

(declare-fun array_inv!27844 (array!75254) Bool)

(assert (=> start!99110 (array_inv!27844 _keys!1208)))

(assert (=> start!99110 true))

(assert (=> start!99110 tp!86873))

(declare-fun e!662735 () Bool)

(declare-fun array_inv!27845 (array!75256) Bool)

(assert (=> start!99110 (and (array_inv!27845 _values!996) e!662735)))

(declare-fun b!1165880 () Bool)

(declare-fun res!773296 () Bool)

(assert (=> b!1165880 (=> (not res!773296) (not e!662738))))

(assert (=> b!1165880 (= res!773296 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36816 _keys!1208))))))

(declare-fun b!1165881 () Bool)

(assert (=> b!1165881 (= e!662737 (not e!662733))))

(declare-fun res!773290 () Bool)

(assert (=> b!1165881 (=> res!773290 e!662733)))

(assert (=> b!1165881 (= res!773290 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165881 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38303 0))(
  ( (Unit!38304) )
))
(declare-fun lt!524891 () Unit!38303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75254 (_ BitVec 64) (_ BitVec 32)) Unit!38303)

(assert (=> b!1165881 (= lt!524891 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165882 () Bool)

(assert (=> b!1165882 (= e!662739 true)))

(declare-fun -!1421 (ListLongMap!16781 (_ BitVec 64)) ListLongMap!16781)

(assert (=> b!1165882 (= (getCurrentListMapNoExtraKeys!4882 lt!524894 lt!524892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1421 (getCurrentListMapNoExtraKeys!4882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!524890 () Unit!38303)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!685 (array!75254 array!75256 (_ BitVec 32) (_ BitVec 32) V!44129 V!44129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38303)

(assert (=> b!1165882 (= lt!524890 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!685 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1165883 () Bool)

(declare-fun res!773292 () Bool)

(assert (=> b!1165883 (=> (not res!773292) (not e!662738))))

(assert (=> b!1165883 (= res!773292 (= (select (arr!36278 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45701 () Bool)

(declare-fun mapRes!45701 () Bool)

(declare-fun tp!86874 () Bool)

(declare-fun e!662732 () Bool)

(assert (=> mapNonEmpty!45701 (= mapRes!45701 (and tp!86874 e!662732))))

(declare-fun mapValue!45701 () ValueCell!13916)

(declare-fun mapKey!45701 () (_ BitVec 32))

(declare-fun mapRest!45701 () (Array (_ BitVec 32) ValueCell!13916))

(assert (=> mapNonEmpty!45701 (= (arr!36279 _values!996) (store mapRest!45701 mapKey!45701 mapValue!45701))))

(declare-fun mapIsEmpty!45701 () Bool)

(assert (=> mapIsEmpty!45701 mapRes!45701))

(declare-fun b!1165884 () Bool)

(assert (=> b!1165884 (= e!662732 tp_is_empty!29251)))

(declare-fun b!1165885 () Bool)

(declare-fun res!773286 () Bool)

(assert (=> b!1165885 (=> (not res!773286) (not e!662738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75254 (_ BitVec 32)) Bool)

(assert (=> b!1165885 (= res!773286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165886 () Bool)

(assert (=> b!1165886 (= e!662735 (and e!662734 mapRes!45701))))

(declare-fun condMapEmpty!45701 () Bool)

(declare-fun mapDefault!45701 () ValueCell!13916)

(assert (=> b!1165886 (= condMapEmpty!45701 (= (arr!36279 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13916)) mapDefault!45701)))))

(declare-fun b!1165887 () Bool)

(assert (=> b!1165887 (= e!662738 e!662737)))

(declare-fun res!773288 () Bool)

(assert (=> b!1165887 (=> (not res!773288) (not e!662737))))

(assert (=> b!1165887 (= res!773288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524894 mask!1564))))

(assert (=> b!1165887 (= lt!524894 (array!75255 (store (arr!36278 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36816 _keys!1208)))))

(assert (= (and start!99110 res!773289) b!1165874))

(assert (= (and b!1165874 res!773297) b!1165877))

(assert (= (and b!1165877 res!773287) b!1165885))

(assert (= (and b!1165885 res!773286) b!1165875))

(assert (= (and b!1165875 res!773291) b!1165880))

(assert (= (and b!1165880 res!773296) b!1165873))

(assert (= (and b!1165873 res!773295) b!1165883))

(assert (= (and b!1165883 res!773292) b!1165887))

(assert (= (and b!1165887 res!773288) b!1165876))

(assert (= (and b!1165876 res!773293) b!1165881))

(assert (= (and b!1165881 (not res!773290)) b!1165879))

(assert (= (and b!1165879 (not res!773294)) b!1165882))

(assert (= (and b!1165886 condMapEmpty!45701) mapIsEmpty!45701))

(assert (= (and b!1165886 (not condMapEmpty!45701)) mapNonEmpty!45701))

(get-info :version)

(assert (= (and mapNonEmpty!45701 ((_ is ValueCellFull!13916) mapValue!45701)) b!1165884))

(assert (= (and b!1165886 ((_ is ValueCellFull!13916) mapDefault!45701)) b!1165878))

(assert (= start!99110 b!1165886))

(declare-fun b_lambda!19809 () Bool)

(assert (=> (not b_lambda!19809) (not b!1165879)))

(declare-fun t!37232 () Bool)

(declare-fun tb!9525 () Bool)

(assert (=> (and start!99110 (= defaultEntry!1004 defaultEntry!1004) t!37232) tb!9525))

(declare-fun result!19623 () Bool)

(assert (=> tb!9525 (= result!19623 tp_is_empty!29251)))

(assert (=> b!1165879 t!37232))

(declare-fun b_and!40271 () Bool)

(assert (= b_and!40269 (and (=> t!37232 result!19623) b_and!40271)))

(declare-fun m!1073473 () Bool)

(assert (=> b!1165885 m!1073473))

(declare-fun m!1073475 () Bool)

(assert (=> b!1165881 m!1073475))

(declare-fun m!1073477 () Bool)

(assert (=> b!1165881 m!1073477))

(declare-fun m!1073479 () Bool)

(assert (=> b!1165882 m!1073479))

(declare-fun m!1073481 () Bool)

(assert (=> b!1165882 m!1073481))

(assert (=> b!1165882 m!1073481))

(declare-fun m!1073483 () Bool)

(assert (=> b!1165882 m!1073483))

(declare-fun m!1073485 () Bool)

(assert (=> b!1165882 m!1073485))

(declare-fun m!1073487 () Bool)

(assert (=> b!1165874 m!1073487))

(declare-fun m!1073489 () Bool)

(assert (=> start!99110 m!1073489))

(declare-fun m!1073491 () Bool)

(assert (=> start!99110 m!1073491))

(declare-fun m!1073493 () Bool)

(assert (=> b!1165883 m!1073493))

(declare-fun m!1073495 () Bool)

(assert (=> b!1165873 m!1073495))

(declare-fun m!1073497 () Bool)

(assert (=> mapNonEmpty!45701 m!1073497))

(declare-fun m!1073499 () Bool)

(assert (=> b!1165879 m!1073499))

(declare-fun m!1073501 () Bool)

(assert (=> b!1165879 m!1073501))

(declare-fun m!1073503 () Bool)

(assert (=> b!1165879 m!1073503))

(declare-fun m!1073505 () Bool)

(assert (=> b!1165879 m!1073505))

(declare-fun m!1073507 () Bool)

(assert (=> b!1165875 m!1073507))

(declare-fun m!1073509 () Bool)

(assert (=> b!1165887 m!1073509))

(declare-fun m!1073511 () Bool)

(assert (=> b!1165887 m!1073511))

(declare-fun m!1073513 () Bool)

(assert (=> b!1165876 m!1073513))

(check-sat (not b!1165879) (not b!1165881) (not b!1165876) (not start!99110) (not b_next!24721) (not b!1165874) (not b!1165882) (not b!1165875) (not b!1165885) (not b_lambda!19809) b_and!40271 (not b!1165873) tp_is_empty!29251 (not mapNonEmpty!45701) (not b!1165887))
(check-sat b_and!40271 (not b_next!24721))
