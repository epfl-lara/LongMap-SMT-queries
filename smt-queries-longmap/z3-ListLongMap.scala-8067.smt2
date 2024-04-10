; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99270 () Bool)

(assert start!99270)

(declare-fun b_free!24849 () Bool)

(declare-fun b_next!24849 () Bool)

(assert (=> start!99270 (= b_free!24849 (not b_next!24849))))

(declare-fun tp!87260 () Bool)

(declare-fun b_and!40565 () Bool)

(assert (=> start!99270 (= tp!87260 b_and!40565)))

(declare-fun b!1169226 () Bool)

(declare-fun res!775805 () Bool)

(declare-fun e!664520 () Bool)

(assert (=> b!1169226 (=> (not res!775805) (not e!664520))))

(declare-datatypes ((array!75581 0))(
  ( (array!75582 (arr!36440 (Array (_ BitVec 32) (_ BitVec 64))) (size!36976 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75581)

(declare-datatypes ((List!25563 0))(
  ( (Nil!25560) (Cons!25559 (h!26768 (_ BitVec 64)) (t!37404 List!25563)) )
))
(declare-fun arrayNoDuplicates!0 (array!75581 (_ BitVec 32) List!25563) Bool)

(assert (=> b!1169226 (= res!775805 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25560))))

(declare-fun b!1169227 () Bool)

(declare-fun res!775801 () Bool)

(assert (=> b!1169227 (=> (not res!775801) (not e!664520))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169227 (= res!775801 (= (select (arr!36440 _keys!1208) i!673) k0!934))))

(declare-fun b!1169228 () Bool)

(declare-fun res!775800 () Bool)

(assert (=> b!1169228 (=> (not res!775800) (not e!664520))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75581 (_ BitVec 32)) Bool)

(assert (=> b!1169228 (= res!775800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!775793 () Bool)

(assert (=> start!99270 (=> (not res!775793) (not e!664520))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99270 (= res!775793 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36976 _keys!1208))))))

(assert (=> start!99270 e!664520))

(declare-fun tp_is_empty!29379 () Bool)

(assert (=> start!99270 tp_is_empty!29379))

(declare-fun array_inv!27852 (array!75581) Bool)

(assert (=> start!99270 (array_inv!27852 _keys!1208)))

(assert (=> start!99270 true))

(assert (=> start!99270 tp!87260))

(declare-datatypes ((V!44299 0))(
  ( (V!44300 (val!14746 Int)) )
))
(declare-datatypes ((ValueCell!13980 0))(
  ( (ValueCellFull!13980 (v!17384 V!44299)) (EmptyCell!13980) )
))
(declare-datatypes ((array!75583 0))(
  ( (array!75584 (arr!36441 (Array (_ BitVec 32) ValueCell!13980)) (size!36977 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75583)

(declare-fun e!664523 () Bool)

(declare-fun array_inv!27853 (array!75583) Bool)

(assert (=> start!99270 (and (array_inv!27853 _values!996) e!664523)))

(declare-fun b!1169229 () Bool)

(declare-fun res!775795 () Bool)

(assert (=> b!1169229 (=> (not res!775795) (not e!664520))))

(assert (=> b!1169229 (= res!775795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36976 _keys!1208))))))

(declare-fun b!1169230 () Bool)

(declare-fun e!664526 () Bool)

(assert (=> b!1169230 (= e!664526 tp_is_empty!29379)))

(declare-fun b!1169231 () Bool)

(declare-fun e!664518 () Bool)

(declare-fun e!664524 () Bool)

(assert (=> b!1169231 (= e!664518 e!664524)))

(declare-fun res!775803 () Bool)

(assert (=> b!1169231 (=> res!775803 e!664524)))

(assert (=> b!1169231 (= res!775803 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44299)

(declare-fun lt!526474 () array!75583)

(declare-fun lt!526475 () array!75581)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18826 0))(
  ( (tuple2!18827 (_1!9424 (_ BitVec 64)) (_2!9424 V!44299)) )
))
(declare-datatypes ((List!25564 0))(
  ( (Nil!25561) (Cons!25560 (h!26769 tuple2!18826) (t!37405 List!25564)) )
))
(declare-datatypes ((ListLongMap!16795 0))(
  ( (ListLongMap!16796 (toList!8413 List!25564)) )
))
(declare-fun lt!526480 () ListLongMap!16795)

(declare-fun minValue!944 () V!44299)

(declare-fun getCurrentListMapNoExtraKeys!4877 (array!75581 array!75583 (_ BitVec 32) (_ BitVec 32) V!44299 V!44299 (_ BitVec 32) Int) ListLongMap!16795)

(assert (=> b!1169231 (= lt!526480 (getCurrentListMapNoExtraKeys!4877 lt!526475 lt!526474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526479 () V!44299)

(assert (=> b!1169231 (= lt!526474 (array!75584 (store (arr!36441 _values!996) i!673 (ValueCellFull!13980 lt!526479)) (size!36977 _values!996)))))

(declare-fun dynLambda!2856 (Int (_ BitVec 64)) V!44299)

(assert (=> b!1169231 (= lt!526479 (dynLambda!2856 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526477 () ListLongMap!16795)

(assert (=> b!1169231 (= lt!526477 (getCurrentListMapNoExtraKeys!4877 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169232 () Bool)

(declare-fun res!775806 () Bool)

(declare-fun e!664519 () Bool)

(assert (=> b!1169232 (=> (not res!775806) (not e!664519))))

(assert (=> b!1169232 (= res!775806 (arrayNoDuplicates!0 lt!526475 #b00000000000000000000000000000000 Nil!25560))))

(declare-fun b!1169233 () Bool)

(declare-fun res!775799 () Bool)

(assert (=> b!1169233 (=> (not res!775799) (not e!664520))))

(assert (=> b!1169233 (= res!775799 (and (= (size!36977 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36976 _keys!1208) (size!36977 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169234 () Bool)

(declare-fun e!664521 () Bool)

(assert (=> b!1169234 (= e!664521 true)))

(declare-fun e!664527 () Bool)

(assert (=> b!1169234 e!664527))

(declare-fun res!775796 () Bool)

(assert (=> b!1169234 (=> (not res!775796) (not e!664527))))

(declare-fun lt!526478 () ListLongMap!16795)

(declare-fun +!3746 (ListLongMap!16795 tuple2!18826) ListLongMap!16795)

(declare-fun get!18576 (ValueCell!13980 V!44299) V!44299)

(assert (=> b!1169234 (= res!775796 (= lt!526480 (+!3746 lt!526478 (tuple2!18827 (select (arr!36440 _keys!1208) from!1455) (get!18576 (select (arr!36441 _values!996) from!1455) lt!526479)))))))

(declare-fun b!1169235 () Bool)

(declare-fun mapRes!45896 () Bool)

(assert (=> b!1169235 (= e!664523 (and e!664526 mapRes!45896))))

(declare-fun condMapEmpty!45896 () Bool)

(declare-fun mapDefault!45896 () ValueCell!13980)

(assert (=> b!1169235 (= condMapEmpty!45896 (= (arr!36441 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13980)) mapDefault!45896)))))

(declare-fun b!1169236 () Bool)

(declare-fun res!775794 () Bool)

(assert (=> b!1169236 (=> (not res!775794) (not e!664520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169236 (= res!775794 (validKeyInArray!0 k0!934))))

(declare-fun b!1169237 () Bool)

(declare-fun res!775798 () Bool)

(assert (=> b!1169237 (=> (not res!775798) (not e!664520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169237 (= res!775798 (validMask!0 mask!1564))))

(declare-fun b!1169238 () Bool)

(assert (=> b!1169238 (= e!664524 e!664521)))

(declare-fun res!775804 () Bool)

(assert (=> b!1169238 (=> res!775804 e!664521)))

(assert (=> b!1169238 (= res!775804 (not (validKeyInArray!0 (select (arr!36440 _keys!1208) from!1455))))))

(declare-fun lt!526481 () ListLongMap!16795)

(assert (=> b!1169238 (= lt!526481 lt!526478)))

(declare-fun lt!526476 () ListLongMap!16795)

(declare-fun -!1485 (ListLongMap!16795 (_ BitVec 64)) ListLongMap!16795)

(assert (=> b!1169238 (= lt!526478 (-!1485 lt!526476 k0!934))))

(assert (=> b!1169238 (= lt!526481 (getCurrentListMapNoExtraKeys!4877 lt!526475 lt!526474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169238 (= lt!526476 (getCurrentListMapNoExtraKeys!4877 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38578 0))(
  ( (Unit!38579) )
))
(declare-fun lt!526482 () Unit!38578)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!712 (array!75581 array!75583 (_ BitVec 32) (_ BitVec 32) V!44299 V!44299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38578)

(assert (=> b!1169238 (= lt!526482 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169239 () Bool)

(assert (=> b!1169239 (= e!664520 e!664519)))

(declare-fun res!775797 () Bool)

(assert (=> b!1169239 (=> (not res!775797) (not e!664519))))

(assert (=> b!1169239 (= res!775797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526475 mask!1564))))

(assert (=> b!1169239 (= lt!526475 (array!75582 (store (arr!36440 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36976 _keys!1208)))))

(declare-fun b!1169240 () Bool)

(assert (=> b!1169240 (= e!664519 (not e!664518))))

(declare-fun res!775807 () Bool)

(assert (=> b!1169240 (=> res!775807 e!664518)))

(assert (=> b!1169240 (= res!775807 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169240 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526473 () Unit!38578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75581 (_ BitVec 64) (_ BitVec 32)) Unit!38578)

(assert (=> b!1169240 (= lt!526473 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45896 () Bool)

(assert (=> mapIsEmpty!45896 mapRes!45896))

(declare-fun b!1169241 () Bool)

(declare-fun e!664525 () Bool)

(assert (=> b!1169241 (= e!664527 e!664525)))

(declare-fun res!775802 () Bool)

(assert (=> b!1169241 (=> res!775802 e!664525)))

(assert (=> b!1169241 (= res!775802 (not (= (select (arr!36440 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169242 () Bool)

(declare-fun e!664522 () Bool)

(assert (=> b!1169242 (= e!664522 tp_is_empty!29379)))

(declare-fun b!1169243 () Bool)

(assert (=> b!1169243 (= e!664525 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45896 () Bool)

(declare-fun tp!87261 () Bool)

(assert (=> mapNonEmpty!45896 (= mapRes!45896 (and tp!87261 e!664522))))

(declare-fun mapKey!45896 () (_ BitVec 32))

(declare-fun mapValue!45896 () ValueCell!13980)

(declare-fun mapRest!45896 () (Array (_ BitVec 32) ValueCell!13980))

(assert (=> mapNonEmpty!45896 (= (arr!36441 _values!996) (store mapRest!45896 mapKey!45896 mapValue!45896))))

(assert (= (and start!99270 res!775793) b!1169237))

(assert (= (and b!1169237 res!775798) b!1169233))

(assert (= (and b!1169233 res!775799) b!1169228))

(assert (= (and b!1169228 res!775800) b!1169226))

(assert (= (and b!1169226 res!775805) b!1169229))

(assert (= (and b!1169229 res!775795) b!1169236))

(assert (= (and b!1169236 res!775794) b!1169227))

(assert (= (and b!1169227 res!775801) b!1169239))

(assert (= (and b!1169239 res!775797) b!1169232))

(assert (= (and b!1169232 res!775806) b!1169240))

(assert (= (and b!1169240 (not res!775807)) b!1169231))

(assert (= (and b!1169231 (not res!775803)) b!1169238))

(assert (= (and b!1169238 (not res!775804)) b!1169234))

(assert (= (and b!1169234 res!775796) b!1169241))

(assert (= (and b!1169241 (not res!775802)) b!1169243))

(assert (= (and b!1169235 condMapEmpty!45896) mapIsEmpty!45896))

(assert (= (and b!1169235 (not condMapEmpty!45896)) mapNonEmpty!45896))

(get-info :version)

(assert (= (and mapNonEmpty!45896 ((_ is ValueCellFull!13980) mapValue!45896)) b!1169242))

(assert (= (and b!1169235 ((_ is ValueCellFull!13980) mapDefault!45896)) b!1169230))

(assert (= start!99270 b!1169235))

(declare-fun b_lambda!19993 () Bool)

(assert (=> (not b_lambda!19993) (not b!1169231)))

(declare-fun t!37403 () Bool)

(declare-fun tb!9661 () Bool)

(assert (=> (and start!99270 (= defaultEntry!1004 defaultEntry!1004) t!37403) tb!9661))

(declare-fun result!19889 () Bool)

(assert (=> tb!9661 (= result!19889 tp_is_empty!29379)))

(assert (=> b!1169231 t!37403))

(declare-fun b_and!40567 () Bool)

(assert (= b_and!40565 (and (=> t!37403 result!19889) b_and!40567)))

(declare-fun m!1077093 () Bool)

(assert (=> b!1169241 m!1077093))

(declare-fun m!1077095 () Bool)

(assert (=> b!1169226 m!1077095))

(declare-fun m!1077097 () Bool)

(assert (=> b!1169232 m!1077097))

(declare-fun m!1077099 () Bool)

(assert (=> b!1169238 m!1077099))

(declare-fun m!1077101 () Bool)

(assert (=> b!1169238 m!1077101))

(declare-fun m!1077103 () Bool)

(assert (=> b!1169238 m!1077103))

(assert (=> b!1169238 m!1077093))

(declare-fun m!1077105 () Bool)

(assert (=> b!1169238 m!1077105))

(assert (=> b!1169238 m!1077093))

(declare-fun m!1077107 () Bool)

(assert (=> b!1169238 m!1077107))

(declare-fun m!1077109 () Bool)

(assert (=> b!1169243 m!1077109))

(declare-fun m!1077111 () Bool)

(assert (=> b!1169236 m!1077111))

(declare-fun m!1077113 () Bool)

(assert (=> b!1169227 m!1077113))

(declare-fun m!1077115 () Bool)

(assert (=> start!99270 m!1077115))

(declare-fun m!1077117 () Bool)

(assert (=> start!99270 m!1077117))

(declare-fun m!1077119 () Bool)

(assert (=> mapNonEmpty!45896 m!1077119))

(declare-fun m!1077121 () Bool)

(assert (=> b!1169228 m!1077121))

(declare-fun m!1077123 () Bool)

(assert (=> b!1169239 m!1077123))

(declare-fun m!1077125 () Bool)

(assert (=> b!1169239 m!1077125))

(assert (=> b!1169234 m!1077093))

(declare-fun m!1077127 () Bool)

(assert (=> b!1169234 m!1077127))

(assert (=> b!1169234 m!1077127))

(declare-fun m!1077129 () Bool)

(assert (=> b!1169234 m!1077129))

(declare-fun m!1077131 () Bool)

(assert (=> b!1169234 m!1077131))

(declare-fun m!1077133 () Bool)

(assert (=> b!1169240 m!1077133))

(declare-fun m!1077135 () Bool)

(assert (=> b!1169240 m!1077135))

(declare-fun m!1077137 () Bool)

(assert (=> b!1169237 m!1077137))

(declare-fun m!1077139 () Bool)

(assert (=> b!1169231 m!1077139))

(declare-fun m!1077141 () Bool)

(assert (=> b!1169231 m!1077141))

(declare-fun m!1077143 () Bool)

(assert (=> b!1169231 m!1077143))

(declare-fun m!1077145 () Bool)

(assert (=> b!1169231 m!1077145))

(check-sat (not start!99270) (not b!1169236) (not b!1169239) (not b_lambda!19993) (not b!1169238) (not b!1169226) tp_is_empty!29379 (not b!1169232) (not mapNonEmpty!45896) (not b!1169237) (not b!1169231) b_and!40567 (not b!1169240) (not b_next!24849) (not b!1169228) (not b!1169234) (not b!1169243))
(check-sat b_and!40567 (not b_next!24849))
