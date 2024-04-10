; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99174 () Bool)

(assert start!99174)

(declare-fun b_free!24779 () Bool)

(declare-fun b_next!24779 () Bool)

(assert (=> start!99174 (= b_free!24779 (not b_next!24779))))

(declare-fun tp!87047 () Bool)

(declare-fun b_and!40407 () Bool)

(assert (=> start!99174 (= tp!87047 b_and!40407)))

(declare-fun b!1167360 () Bool)

(declare-fun res!774397 () Bool)

(declare-fun e!663507 () Bool)

(assert (=> b!1167360 (=> (not res!774397) (not e!663507))))

(declare-datatypes ((array!75447 0))(
  ( (array!75448 (arr!36374 (Array (_ BitVec 32) (_ BitVec 64))) (size!36910 (_ BitVec 32))) )
))
(declare-fun lt!525607 () array!75447)

(declare-datatypes ((List!25508 0))(
  ( (Nil!25505) (Cons!25504 (h!26713 (_ BitVec 64)) (t!37279 List!25508)) )
))
(declare-fun arrayNoDuplicates!0 (array!75447 (_ BitVec 32) List!25508) Bool)

(assert (=> b!1167360 (= res!774397 (arrayNoDuplicates!0 lt!525607 #b00000000000000000000000000000000 Nil!25505))))

(declare-fun b!1167361 () Bool)

(declare-fun res!774403 () Bool)

(declare-fun e!663508 () Bool)

(assert (=> b!1167361 (=> (not res!774403) (not e!663508))))

(declare-fun _keys!1208 () array!75447)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44205 0))(
  ( (V!44206 (val!14711 Int)) )
))
(declare-datatypes ((ValueCell!13945 0))(
  ( (ValueCellFull!13945 (v!17348 V!44205)) (EmptyCell!13945) )
))
(declare-datatypes ((array!75449 0))(
  ( (array!75450 (arr!36375 (Array (_ BitVec 32) ValueCell!13945)) (size!36911 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75449)

(assert (=> b!1167361 (= res!774403 (and (= (size!36911 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36910 _keys!1208) (size!36911 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167362 () Bool)

(declare-fun e!663506 () Bool)

(assert (=> b!1167362 (= e!663507 (not e!663506))))

(declare-fun res!774406 () Bool)

(assert (=> b!1167362 (=> res!774406 e!663506)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167362 (= res!774406 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167362 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38520 0))(
  ( (Unit!38521) )
))
(declare-fun lt!525609 () Unit!38520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75447 (_ BitVec 64) (_ BitVec 32)) Unit!38520)

(assert (=> b!1167362 (= lt!525609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1167363 () Bool)

(declare-fun res!774400 () Bool)

(assert (=> b!1167363 (=> (not res!774400) (not e!663508))))

(assert (=> b!1167363 (= res!774400 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36910 _keys!1208))))))

(declare-fun b!1167364 () Bool)

(declare-fun e!663513 () Bool)

(assert (=> b!1167364 (= e!663513 true)))

(declare-fun zeroValue!944 () V!44205)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525606 () array!75449)

(declare-fun minValue!944 () V!44205)

(declare-datatypes ((tuple2!18768 0))(
  ( (tuple2!18769 (_1!9395 (_ BitVec 64)) (_2!9395 V!44205)) )
))
(declare-datatypes ((List!25509 0))(
  ( (Nil!25506) (Cons!25505 (h!26714 tuple2!18768) (t!37280 List!25509)) )
))
(declare-datatypes ((ListLongMap!16737 0))(
  ( (ListLongMap!16738 (toList!8384 List!25509)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4848 (array!75447 array!75449 (_ BitVec 32) (_ BitVec 32) V!44205 V!44205 (_ BitVec 32) Int) ListLongMap!16737)

(declare-fun -!1459 (ListLongMap!16737 (_ BitVec 64)) ListLongMap!16737)

(assert (=> b!1167364 (= (getCurrentListMapNoExtraKeys!4848 lt!525607 lt!525606 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1459 (getCurrentListMapNoExtraKeys!4848 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!525605 () Unit!38520)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!686 (array!75447 array!75449 (_ BitVec 32) (_ BitVec 32) V!44205 V!44205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38520)

(assert (=> b!1167364 (= lt!525605 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167365 () Bool)

(assert (=> b!1167365 (= e!663508 e!663507)))

(declare-fun res!774402 () Bool)

(assert (=> b!1167365 (=> (not res!774402) (not e!663507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75447 (_ BitVec 32)) Bool)

(assert (=> b!1167365 (= res!774402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525607 mask!1564))))

(assert (=> b!1167365 (= lt!525607 (array!75448 (store (arr!36374 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36910 _keys!1208)))))

(declare-fun b!1167366 () Bool)

(declare-fun res!774401 () Bool)

(assert (=> b!1167366 (=> (not res!774401) (not e!663508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167366 (= res!774401 (validMask!0 mask!1564))))

(declare-fun b!1167367 () Bool)

(declare-fun res!774398 () Bool)

(assert (=> b!1167367 (=> (not res!774398) (not e!663508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167367 (= res!774398 (validKeyInArray!0 k!934))))

(declare-fun b!1167368 () Bool)

(declare-fun res!774407 () Bool)

(assert (=> b!1167368 (=> (not res!774407) (not e!663508))))

(assert (=> b!1167368 (= res!774407 (= (select (arr!36374 _keys!1208) i!673) k!934))))

(declare-fun b!1167369 () Bool)

(declare-fun e!663510 () Bool)

(declare-fun tp_is_empty!29309 () Bool)

(assert (=> b!1167369 (= e!663510 tp_is_empty!29309)))

(declare-fun mapNonEmpty!45788 () Bool)

(declare-fun mapRes!45788 () Bool)

(declare-fun tp!87048 () Bool)

(declare-fun e!663511 () Bool)

(assert (=> mapNonEmpty!45788 (= mapRes!45788 (and tp!87048 e!663511))))

(declare-fun mapValue!45788 () ValueCell!13945)

(declare-fun mapRest!45788 () (Array (_ BitVec 32) ValueCell!13945))

(declare-fun mapKey!45788 () (_ BitVec 32))

(assert (=> mapNonEmpty!45788 (= (arr!36375 _values!996) (store mapRest!45788 mapKey!45788 mapValue!45788))))

(declare-fun b!1167370 () Bool)

(declare-fun res!774404 () Bool)

(assert (=> b!1167370 (=> (not res!774404) (not e!663508))))

(assert (=> b!1167370 (= res!774404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167371 () Bool)

(declare-fun res!774399 () Bool)

(assert (=> b!1167371 (=> (not res!774399) (not e!663508))))

(assert (=> b!1167371 (= res!774399 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25505))))

(declare-fun res!774396 () Bool)

(assert (=> start!99174 (=> (not res!774396) (not e!663508))))

(assert (=> start!99174 (= res!774396 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36910 _keys!1208))))))

(assert (=> start!99174 e!663508))

(assert (=> start!99174 tp_is_empty!29309))

(declare-fun array_inv!27808 (array!75447) Bool)

(assert (=> start!99174 (array_inv!27808 _keys!1208)))

(assert (=> start!99174 true))

(assert (=> start!99174 tp!87047))

(declare-fun e!663509 () Bool)

(declare-fun array_inv!27809 (array!75449) Bool)

(assert (=> start!99174 (and (array_inv!27809 _values!996) e!663509)))

(declare-fun b!1167372 () Bool)

(assert (=> b!1167372 (= e!663509 (and e!663510 mapRes!45788))))

(declare-fun condMapEmpty!45788 () Bool)

(declare-fun mapDefault!45788 () ValueCell!13945)

