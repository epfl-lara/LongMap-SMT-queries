; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99276 () Bool)

(assert start!99276)

(declare-fun b_free!24855 () Bool)

(declare-fun b_next!24855 () Bool)

(assert (=> start!99276 (= b_free!24855 (not b_next!24855))))

(declare-fun tp!87278 () Bool)

(declare-fun b_and!40577 () Bool)

(assert (=> start!99276 (= tp!87278 b_and!40577)))

(declare-fun b!1169394 () Bool)

(declare-fun e!664626 () Bool)

(declare-fun e!664621 () Bool)

(assert (=> b!1169394 (= e!664626 e!664621)))

(declare-fun res!775932 () Bool)

(assert (=> b!1169394 (=> res!775932 e!664621)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!75593 0))(
  ( (array!75594 (arr!36446 (Array (_ BitVec 32) (_ BitVec 64))) (size!36982 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75593)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169394 (= res!775932 (not (= (select (arr!36446 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169395 () Bool)

(declare-fun res!775937 () Bool)

(declare-fun e!664620 () Bool)

(assert (=> b!1169395 (=> (not res!775937) (not e!664620))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75593 (_ BitVec 32)) Bool)

(assert (=> b!1169395 (= res!775937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45905 () Bool)

(declare-fun mapRes!45905 () Bool)

(declare-fun tp!87279 () Bool)

(declare-fun e!664619 () Bool)

(assert (=> mapNonEmpty!45905 (= mapRes!45905 (and tp!87279 e!664619))))

(declare-datatypes ((V!44307 0))(
  ( (V!44308 (val!14749 Int)) )
))
(declare-datatypes ((ValueCell!13983 0))(
  ( (ValueCellFull!13983 (v!17387 V!44307)) (EmptyCell!13983) )
))
(declare-fun mapValue!45905 () ValueCell!13983)

(declare-fun mapKey!45905 () (_ BitVec 32))

(declare-fun mapRest!45905 () (Array (_ BitVec 32) ValueCell!13983))

(declare-datatypes ((array!75595 0))(
  ( (array!75596 (arr!36447 (Array (_ BitVec 32) ValueCell!13983)) (size!36983 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75595)

(assert (=> mapNonEmpty!45905 (= (arr!36447 _values!996) (store mapRest!45905 mapKey!45905 mapValue!45905))))

(declare-fun b!1169396 () Bool)

(declare-fun res!775938 () Bool)

(assert (=> b!1169396 (=> (not res!775938) (not e!664620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169396 (= res!775938 (validMask!0 mask!1564))))

(declare-fun b!1169397 () Bool)

(declare-fun res!775929 () Bool)

(declare-fun e!664627 () Bool)

(assert (=> b!1169397 (=> (not res!775929) (not e!664627))))

(declare-fun lt!526566 () array!75593)

(declare-datatypes ((List!25567 0))(
  ( (Nil!25564) (Cons!25563 (h!26772 (_ BitVec 64)) (t!37414 List!25567)) )
))
(declare-fun arrayNoDuplicates!0 (array!75593 (_ BitVec 32) List!25567) Bool)

(assert (=> b!1169397 (= res!775929 (arrayNoDuplicates!0 lt!526566 #b00000000000000000000000000000000 Nil!25564))))

(declare-fun b!1169398 () Bool)

(declare-fun e!664617 () Bool)

(declare-fun e!664624 () Bool)

(assert (=> b!1169398 (= e!664617 e!664624)))

(declare-fun res!775928 () Bool)

(assert (=> b!1169398 (=> res!775928 e!664624)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169398 (= res!775928 (not (validKeyInArray!0 (select (arr!36446 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18830 0))(
  ( (tuple2!18831 (_1!9426 (_ BitVec 64)) (_2!9426 V!44307)) )
))
(declare-datatypes ((List!25568 0))(
  ( (Nil!25565) (Cons!25564 (h!26773 tuple2!18830) (t!37415 List!25568)) )
))
(declare-datatypes ((ListLongMap!16799 0))(
  ( (ListLongMap!16800 (toList!8415 List!25568)) )
))
(declare-fun lt!526572 () ListLongMap!16799)

(declare-fun lt!526567 () ListLongMap!16799)

(assert (=> b!1169398 (= lt!526572 lt!526567)))

(declare-fun lt!526563 () ListLongMap!16799)

(declare-fun -!1487 (ListLongMap!16799 (_ BitVec 64)) ListLongMap!16799)

(assert (=> b!1169398 (= lt!526567 (-!1487 lt!526563 k0!934))))

(declare-fun zeroValue!944 () V!44307)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526569 () array!75595)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44307)

(declare-fun getCurrentListMapNoExtraKeys!4879 (array!75593 array!75595 (_ BitVec 32) (_ BitVec 32) V!44307 V!44307 (_ BitVec 32) Int) ListLongMap!16799)

(assert (=> b!1169398 (= lt!526572 (getCurrentListMapNoExtraKeys!4879 lt!526566 lt!526569 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169398 (= lt!526563 (getCurrentListMapNoExtraKeys!4879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38582 0))(
  ( (Unit!38583) )
))
(declare-fun lt!526568 () Unit!38582)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!714 (array!75593 array!75595 (_ BitVec 32) (_ BitVec 32) V!44307 V!44307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38582)

(assert (=> b!1169398 (= lt!526568 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169399 () Bool)

(declare-fun e!664618 () Bool)

(declare-fun e!664625 () Bool)

(assert (=> b!1169399 (= e!664618 (and e!664625 mapRes!45905))))

(declare-fun condMapEmpty!45905 () Bool)

(declare-fun mapDefault!45905 () ValueCell!13983)

(assert (=> b!1169399 (= condMapEmpty!45905 (= (arr!36447 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13983)) mapDefault!45905)))))

(declare-fun b!1169400 () Bool)

(declare-fun res!775935 () Bool)

(assert (=> b!1169400 (=> (not res!775935) (not e!664620))))

(assert (=> b!1169400 (= res!775935 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36982 _keys!1208))))))

(declare-fun b!1169401 () Bool)

(declare-fun tp_is_empty!29385 () Bool)

(assert (=> b!1169401 (= e!664619 tp_is_empty!29385)))

(declare-fun mapIsEmpty!45905 () Bool)

(assert (=> mapIsEmpty!45905 mapRes!45905))

(declare-fun b!1169402 () Bool)

(declare-fun e!664622 () Bool)

(assert (=> b!1169402 (= e!664627 (not e!664622))))

(declare-fun res!775934 () Bool)

(assert (=> b!1169402 (=> res!775934 e!664622)))

(assert (=> b!1169402 (= res!775934 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169402 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526570 () Unit!38582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75593 (_ BitVec 64) (_ BitVec 32)) Unit!38582)

(assert (=> b!1169402 (= lt!526570 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169403 () Bool)

(declare-fun res!775939 () Bool)

(assert (=> b!1169403 (=> (not res!775939) (not e!664620))))

(assert (=> b!1169403 (= res!775939 (= (select (arr!36446 _keys!1208) i!673) k0!934))))

(declare-fun b!1169404 () Bool)

(assert (=> b!1169404 (= e!664621 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169405 () Bool)

(assert (=> b!1169405 (= e!664625 tp_is_empty!29385)))

(declare-fun b!1169406 () Bool)

(declare-fun res!775940 () Bool)

(assert (=> b!1169406 (=> (not res!775940) (not e!664620))))

(assert (=> b!1169406 (= res!775940 (and (= (size!36983 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36982 _keys!1208) (size!36983 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169407 () Bool)

(assert (=> b!1169407 (= e!664624 true)))

(assert (=> b!1169407 e!664626))

(declare-fun res!775941 () Bool)

(assert (=> b!1169407 (=> (not res!775941) (not e!664626))))

(declare-fun lt!526565 () V!44307)

(declare-fun lt!526564 () ListLongMap!16799)

(declare-fun +!3747 (ListLongMap!16799 tuple2!18830) ListLongMap!16799)

(declare-fun get!18579 (ValueCell!13983 V!44307) V!44307)

(assert (=> b!1169407 (= res!775941 (= lt!526564 (+!3747 lt!526567 (tuple2!18831 (select (arr!36446 _keys!1208) from!1455) (get!18579 (select (arr!36447 _values!996) from!1455) lt!526565)))))))

(declare-fun b!1169408 () Bool)

(assert (=> b!1169408 (= e!664620 e!664627)))

(declare-fun res!775942 () Bool)

(assert (=> b!1169408 (=> (not res!775942) (not e!664627))))

(assert (=> b!1169408 (= res!775942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526566 mask!1564))))

(assert (=> b!1169408 (= lt!526566 (array!75594 (store (arr!36446 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36982 _keys!1208)))))

(declare-fun b!1169409 () Bool)

(assert (=> b!1169409 (= e!664622 e!664617)))

(declare-fun res!775930 () Bool)

(assert (=> b!1169409 (=> res!775930 e!664617)))

(assert (=> b!1169409 (= res!775930 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169409 (= lt!526564 (getCurrentListMapNoExtraKeys!4879 lt!526566 lt!526569 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169409 (= lt!526569 (array!75596 (store (arr!36447 _values!996) i!673 (ValueCellFull!13983 lt!526565)) (size!36983 _values!996)))))

(declare-fun dynLambda!2857 (Int (_ BitVec 64)) V!44307)

(assert (=> b!1169409 (= lt!526565 (dynLambda!2857 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526571 () ListLongMap!16799)

(assert (=> b!1169409 (= lt!526571 (getCurrentListMapNoExtraKeys!4879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!775936 () Bool)

(assert (=> start!99276 (=> (not res!775936) (not e!664620))))

(assert (=> start!99276 (= res!775936 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36982 _keys!1208))))))

(assert (=> start!99276 e!664620))

(assert (=> start!99276 tp_is_empty!29385))

(declare-fun array_inv!27856 (array!75593) Bool)

(assert (=> start!99276 (array_inv!27856 _keys!1208)))

(assert (=> start!99276 true))

(assert (=> start!99276 tp!87278))

(declare-fun array_inv!27857 (array!75595) Bool)

(assert (=> start!99276 (and (array_inv!27857 _values!996) e!664618)))

(declare-fun b!1169410 () Bool)

(declare-fun res!775931 () Bool)

(assert (=> b!1169410 (=> (not res!775931) (not e!664620))))

(assert (=> b!1169410 (= res!775931 (validKeyInArray!0 k0!934))))

(declare-fun b!1169411 () Bool)

(declare-fun res!775933 () Bool)

(assert (=> b!1169411 (=> (not res!775933) (not e!664620))))

(assert (=> b!1169411 (= res!775933 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25564))))

(assert (= (and start!99276 res!775936) b!1169396))

(assert (= (and b!1169396 res!775938) b!1169406))

(assert (= (and b!1169406 res!775940) b!1169395))

(assert (= (and b!1169395 res!775937) b!1169411))

(assert (= (and b!1169411 res!775933) b!1169400))

(assert (= (and b!1169400 res!775935) b!1169410))

(assert (= (and b!1169410 res!775931) b!1169403))

(assert (= (and b!1169403 res!775939) b!1169408))

(assert (= (and b!1169408 res!775942) b!1169397))

(assert (= (and b!1169397 res!775929) b!1169402))

(assert (= (and b!1169402 (not res!775934)) b!1169409))

(assert (= (and b!1169409 (not res!775930)) b!1169398))

(assert (= (and b!1169398 (not res!775928)) b!1169407))

(assert (= (and b!1169407 res!775941) b!1169394))

(assert (= (and b!1169394 (not res!775932)) b!1169404))

(assert (= (and b!1169399 condMapEmpty!45905) mapIsEmpty!45905))

(assert (= (and b!1169399 (not condMapEmpty!45905)) mapNonEmpty!45905))

(get-info :version)

(assert (= (and mapNonEmpty!45905 ((_ is ValueCellFull!13983) mapValue!45905)) b!1169401))

(assert (= (and b!1169399 ((_ is ValueCellFull!13983) mapDefault!45905)) b!1169405))

(assert (= start!99276 b!1169399))

(declare-fun b_lambda!19999 () Bool)

(assert (=> (not b_lambda!19999) (not b!1169409)))

(declare-fun t!37413 () Bool)

(declare-fun tb!9667 () Bool)

(assert (=> (and start!99276 (= defaultEntry!1004 defaultEntry!1004) t!37413) tb!9667))

(declare-fun result!19901 () Bool)

(assert (=> tb!9667 (= result!19901 tp_is_empty!29385)))

(assert (=> b!1169409 t!37413))

(declare-fun b_and!40579 () Bool)

(assert (= b_and!40577 (and (=> t!37413 result!19901) b_and!40579)))

(declare-fun m!1077255 () Bool)

(assert (=> b!1169398 m!1077255))

(declare-fun m!1077257 () Bool)

(assert (=> b!1169398 m!1077257))

(declare-fun m!1077259 () Bool)

(assert (=> b!1169398 m!1077259))

(declare-fun m!1077261 () Bool)

(assert (=> b!1169398 m!1077261))

(declare-fun m!1077263 () Bool)

(assert (=> b!1169398 m!1077263))

(declare-fun m!1077265 () Bool)

(assert (=> b!1169398 m!1077265))

(assert (=> b!1169398 m!1077263))

(declare-fun m!1077267 () Bool)

(assert (=> b!1169408 m!1077267))

(declare-fun m!1077269 () Bool)

(assert (=> b!1169408 m!1077269))

(declare-fun m!1077271 () Bool)

(assert (=> b!1169397 m!1077271))

(declare-fun m!1077273 () Bool)

(assert (=> b!1169396 m!1077273))

(declare-fun m!1077275 () Bool)

(assert (=> b!1169395 m!1077275))

(declare-fun m!1077277 () Bool)

(assert (=> mapNonEmpty!45905 m!1077277))

(assert (=> b!1169394 m!1077263))

(declare-fun m!1077279 () Bool)

(assert (=> b!1169410 m!1077279))

(declare-fun m!1077281 () Bool)

(assert (=> start!99276 m!1077281))

(declare-fun m!1077283 () Bool)

(assert (=> start!99276 m!1077283))

(declare-fun m!1077285 () Bool)

(assert (=> b!1169402 m!1077285))

(declare-fun m!1077287 () Bool)

(assert (=> b!1169402 m!1077287))

(declare-fun m!1077289 () Bool)

(assert (=> b!1169404 m!1077289))

(declare-fun m!1077291 () Bool)

(assert (=> b!1169403 m!1077291))

(declare-fun m!1077293 () Bool)

(assert (=> b!1169411 m!1077293))

(assert (=> b!1169407 m!1077263))

(declare-fun m!1077295 () Bool)

(assert (=> b!1169407 m!1077295))

(assert (=> b!1169407 m!1077295))

(declare-fun m!1077297 () Bool)

(assert (=> b!1169407 m!1077297))

(declare-fun m!1077299 () Bool)

(assert (=> b!1169407 m!1077299))

(declare-fun m!1077301 () Bool)

(assert (=> b!1169409 m!1077301))

(declare-fun m!1077303 () Bool)

(assert (=> b!1169409 m!1077303))

(declare-fun m!1077305 () Bool)

(assert (=> b!1169409 m!1077305))

(declare-fun m!1077307 () Bool)

(assert (=> b!1169409 m!1077307))

(check-sat (not b!1169396) (not b!1169410) (not b!1169407) (not b!1169409) b_and!40579 (not mapNonEmpty!45905) (not b_lambda!19999) (not start!99276) (not b!1169402) (not b!1169398) (not b!1169404) tp_is_empty!29385 (not b!1169411) (not b!1169397) (not b!1169408) (not b_next!24855) (not b!1169395))
(check-sat b_and!40579 (not b_next!24855))
