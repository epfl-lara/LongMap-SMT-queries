; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99292 () Bool)

(assert start!99292)

(declare-fun b_free!24877 () Bool)

(declare-fun b_next!24877 () Bool)

(assert (=> start!99292 (= b_free!24877 (not b_next!24877))))

(declare-fun tp!87345 () Bool)

(declare-fun b_and!40599 () Bool)

(assert (=> start!99292 (= tp!87345 b_and!40599)))

(declare-fun b!1169888 () Bool)

(declare-fun e!664911 () Bool)

(declare-fun e!664908 () Bool)

(assert (=> b!1169888 (= e!664911 e!664908)))

(declare-fun res!776370 () Bool)

(assert (=> b!1169888 (=> res!776370 e!664908)))

(declare-datatypes ((array!75562 0))(
  ( (array!75563 (arr!36431 (Array (_ BitVec 32) (_ BitVec 64))) (size!36969 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75562)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169888 (= res!776370 (not (= (select (arr!36431 _keys!1208) from!1455) k0!934)))))

(declare-fun e!664905 () Bool)

(assert (=> b!1169888 e!664905))

(declare-fun res!776363 () Bool)

(assert (=> b!1169888 (=> (not res!776363) (not e!664905))))

(declare-datatypes ((V!44337 0))(
  ( (V!44338 (val!14760 Int)) )
))
(declare-datatypes ((tuple2!18938 0))(
  ( (tuple2!18939 (_1!9480 (_ BitVec 64)) (_2!9480 V!44337)) )
))
(declare-datatypes ((List!25652 0))(
  ( (Nil!25649) (Cons!25648 (h!26857 tuple2!18938) (t!37512 List!25652)) )
))
(declare-datatypes ((ListLongMap!16907 0))(
  ( (ListLongMap!16908 (toList!8469 List!25652)) )
))
(declare-fun lt!526707 () ListLongMap!16907)

(declare-fun lt!526709 () V!44337)

(declare-datatypes ((ValueCell!13994 0))(
  ( (ValueCellFull!13994 (v!17397 V!44337)) (EmptyCell!13994) )
))
(declare-datatypes ((array!75564 0))(
  ( (array!75565 (arr!36432 (Array (_ BitVec 32) ValueCell!13994)) (size!36970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75564)

(declare-fun lt!526708 () ListLongMap!16907)

(declare-fun +!3790 (ListLongMap!16907 tuple2!18938) ListLongMap!16907)

(declare-fun get!18582 (ValueCell!13994 V!44337) V!44337)

(assert (=> b!1169888 (= res!776363 (= lt!526707 (+!3790 lt!526708 (tuple2!18939 (select (arr!36431 _keys!1208) from!1455) (get!18582 (select (arr!36432 _values!996) from!1455) lt!526709)))))))

(declare-fun b!1169889 () Bool)

(declare-fun res!776371 () Bool)

(declare-fun e!664912 () Bool)

(assert (=> b!1169889 (=> (not res!776371) (not e!664912))))

(declare-datatypes ((List!25653 0))(
  ( (Nil!25650) (Cons!25649 (h!26858 (_ BitVec 64)) (t!37513 List!25653)) )
))
(declare-fun arrayNoDuplicates!0 (array!75562 (_ BitVec 32) List!25653) Bool)

(assert (=> b!1169889 (= res!776371 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25650))))

(declare-fun b!1169890 () Bool)

(declare-fun res!776366 () Bool)

(declare-fun e!664910 () Bool)

(assert (=> b!1169890 (=> (not res!776366) (not e!664910))))

(declare-fun lt!526703 () array!75562)

(assert (=> b!1169890 (= res!776366 (arrayNoDuplicates!0 lt!526703 #b00000000000000000000000000000000 Nil!25650))))

(declare-fun b!1169891 () Bool)

(declare-fun res!776368 () Bool)

(assert (=> b!1169891 (=> (not res!776368) (not e!664912))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169891 (= res!776368 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36969 _keys!1208))))))

(declare-fun b!1169892 () Bool)

(declare-fun res!776361 () Bool)

(assert (=> b!1169892 (=> (not res!776361) (not e!664912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169892 (= res!776361 (validKeyInArray!0 k0!934))))

(declare-fun b!1169893 () Bool)

(declare-fun res!776362 () Bool)

(assert (=> b!1169893 (=> (not res!776362) (not e!664912))))

(assert (=> b!1169893 (= res!776362 (= (select (arr!36431 _keys!1208) i!673) k0!934))))

(declare-fun b!1169894 () Bool)

(declare-fun e!664913 () Bool)

(declare-fun e!664904 () Bool)

(declare-fun mapRes!45938 () Bool)

(assert (=> b!1169894 (= e!664913 (and e!664904 mapRes!45938))))

(declare-fun condMapEmpty!45938 () Bool)

(declare-fun mapDefault!45938 () ValueCell!13994)

(assert (=> b!1169894 (= condMapEmpty!45938 (= (arr!36432 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13994)) mapDefault!45938)))))

(declare-fun b!1169895 () Bool)

(declare-fun tp_is_empty!29407 () Bool)

(assert (=> b!1169895 (= e!664904 tp_is_empty!29407)))

(declare-fun b!1169896 () Bool)

(declare-fun e!664907 () Bool)

(assert (=> b!1169896 (= e!664907 e!664911)))

(declare-fun res!776373 () Bool)

(assert (=> b!1169896 (=> res!776373 e!664911)))

(assert (=> b!1169896 (= res!776373 (not (validKeyInArray!0 (select (arr!36431 _keys!1208) from!1455))))))

(declare-fun lt!526712 () ListLongMap!16907)

(assert (=> b!1169896 (= lt!526712 lt!526708)))

(declare-fun lt!526704 () ListLongMap!16907)

(declare-fun -!1469 (ListLongMap!16907 (_ BitVec 64)) ListLongMap!16907)

(assert (=> b!1169896 (= lt!526708 (-!1469 lt!526704 k0!934))))

(declare-fun zeroValue!944 () V!44337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526706 () array!75564)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!44337)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4944 (array!75562 array!75564 (_ BitVec 32) (_ BitVec 32) V!44337 V!44337 (_ BitVec 32) Int) ListLongMap!16907)

(assert (=> b!1169896 (= lt!526712 (getCurrentListMapNoExtraKeys!4944 lt!526703 lt!526706 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169896 (= lt!526704 (getCurrentListMapNoExtraKeys!4944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38421 0))(
  ( (Unit!38422) )
))
(declare-fun lt!526710 () Unit!38421)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!733 (array!75562 array!75564 (_ BitVec 32) (_ BitVec 32) V!44337 V!44337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38421)

(assert (=> b!1169896 (= lt!526710 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169897 () Bool)

(declare-fun e!664915 () Bool)

(assert (=> b!1169897 (= e!664915 tp_is_empty!29407)))

(declare-fun b!1169898 () Bool)

(declare-fun res!776360 () Bool)

(assert (=> b!1169898 (=> (not res!776360) (not e!664912))))

(assert (=> b!1169898 (= res!776360 (and (= (size!36970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36969 _keys!1208) (size!36970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169899 () Bool)

(declare-fun e!664914 () Bool)

(declare-fun arrayContainsKey!0 (array!75562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169899 (= e!664914 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169900 () Bool)

(declare-fun res!776364 () Bool)

(assert (=> b!1169900 (=> (not res!776364) (not e!664912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75562 (_ BitVec 32)) Bool)

(assert (=> b!1169900 (= res!776364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169901 () Bool)

(declare-fun e!664909 () Bool)

(assert (=> b!1169901 (= e!664910 (not e!664909))))

(declare-fun res!776374 () Bool)

(assert (=> b!1169901 (=> res!776374 e!664909)))

(assert (=> b!1169901 (= res!776374 (bvsgt from!1455 i!673))))

(assert (=> b!1169901 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526713 () Unit!38421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75562 (_ BitVec 64) (_ BitVec 32)) Unit!38421)

(assert (=> b!1169901 (= lt!526713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169902 () Bool)

(assert (=> b!1169902 (= e!664909 e!664907)))

(declare-fun res!776365 () Bool)

(assert (=> b!1169902 (=> res!776365 e!664907)))

(assert (=> b!1169902 (= res!776365 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169902 (= lt!526707 (getCurrentListMapNoExtraKeys!4944 lt!526703 lt!526706 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169902 (= lt!526706 (array!75565 (store (arr!36432 _values!996) i!673 (ValueCellFull!13994 lt!526709)) (size!36970 _values!996)))))

(declare-fun dynLambda!2869 (Int (_ BitVec 64)) V!44337)

(assert (=> b!1169902 (= lt!526709 (dynLambda!2869 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526711 () ListLongMap!16907)

(assert (=> b!1169902 (= lt!526711 (getCurrentListMapNoExtraKeys!4944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45938 () Bool)

(declare-fun tp!87344 () Bool)

(assert (=> mapNonEmpty!45938 (= mapRes!45938 (and tp!87344 e!664915))))

(declare-fun mapRest!45938 () (Array (_ BitVec 32) ValueCell!13994))

(declare-fun mapKey!45938 () (_ BitVec 32))

(declare-fun mapValue!45938 () ValueCell!13994)

(assert (=> mapNonEmpty!45938 (= (arr!36432 _values!996) (store mapRest!45938 mapKey!45938 mapValue!45938))))

(declare-fun mapIsEmpty!45938 () Bool)

(assert (=> mapIsEmpty!45938 mapRes!45938))

(declare-fun res!776369 () Bool)

(assert (=> start!99292 (=> (not res!776369) (not e!664912))))

(assert (=> start!99292 (= res!776369 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36969 _keys!1208))))))

(assert (=> start!99292 e!664912))

(assert (=> start!99292 tp_is_empty!29407))

(declare-fun array_inv!27946 (array!75562) Bool)

(assert (=> start!99292 (array_inv!27946 _keys!1208)))

(assert (=> start!99292 true))

(assert (=> start!99292 tp!87345))

(declare-fun array_inv!27947 (array!75564) Bool)

(assert (=> start!99292 (and (array_inv!27947 _values!996) e!664913)))

(declare-fun b!1169903 () Bool)

(assert (=> b!1169903 (= e!664905 e!664914)))

(declare-fun res!776372 () Bool)

(assert (=> b!1169903 (=> res!776372 e!664914)))

(assert (=> b!1169903 (= res!776372 (not (= (select (arr!36431 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169904 () Bool)

(assert (=> b!1169904 (= e!664912 e!664910)))

(declare-fun res!776367 () Bool)

(assert (=> b!1169904 (=> (not res!776367) (not e!664910))))

(assert (=> b!1169904 (= res!776367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526703 mask!1564))))

(assert (=> b!1169904 (= lt!526703 (array!75563 (store (arr!36431 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36969 _keys!1208)))))

(declare-fun b!1169905 () Bool)

(declare-fun res!776359 () Bool)

(assert (=> b!1169905 (=> (not res!776359) (not e!664912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169905 (= res!776359 (validMask!0 mask!1564))))

(declare-fun b!1169906 () Bool)

(assert (=> b!1169906 (= e!664908 true)))

(assert (=> b!1169906 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!526705 () Unit!38421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38421)

(assert (=> b!1169906 (= lt!526705 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!99292 res!776369) b!1169905))

(assert (= (and b!1169905 res!776359) b!1169898))

(assert (= (and b!1169898 res!776360) b!1169900))

(assert (= (and b!1169900 res!776364) b!1169889))

(assert (= (and b!1169889 res!776371) b!1169891))

(assert (= (and b!1169891 res!776368) b!1169892))

(assert (= (and b!1169892 res!776361) b!1169893))

(assert (= (and b!1169893 res!776362) b!1169904))

(assert (= (and b!1169904 res!776367) b!1169890))

(assert (= (and b!1169890 res!776366) b!1169901))

(assert (= (and b!1169901 (not res!776374)) b!1169902))

(assert (= (and b!1169902 (not res!776365)) b!1169896))

(assert (= (and b!1169896 (not res!776373)) b!1169888))

(assert (= (and b!1169888 res!776363) b!1169903))

(assert (= (and b!1169903 (not res!776372)) b!1169899))

(assert (= (and b!1169888 (not res!776370)) b!1169906))

(assert (= (and b!1169894 condMapEmpty!45938) mapIsEmpty!45938))

(assert (= (and b!1169894 (not condMapEmpty!45938)) mapNonEmpty!45938))

(get-info :version)

(assert (= (and mapNonEmpty!45938 ((_ is ValueCellFull!13994) mapValue!45938)) b!1169897))

(assert (= (and b!1169894 ((_ is ValueCellFull!13994) mapDefault!45938)) b!1169895))

(assert (= start!99292 b!1169894))

(declare-fun b_lambda!20003 () Bool)

(assert (=> (not b_lambda!20003) (not b!1169902)))

(declare-fun t!37511 () Bool)

(declare-fun tb!9681 () Bool)

(assert (=> (and start!99292 (= defaultEntry!1004 defaultEntry!1004) t!37511) tb!9681))

(declare-fun result!19937 () Bool)

(assert (=> tb!9681 (= result!19937 tp_is_empty!29407)))

(assert (=> b!1169902 t!37511))

(declare-fun b_and!40601 () Bool)

(assert (= b_and!40599 (and (=> t!37511 result!19937) b_and!40601)))

(declare-fun m!1077239 () Bool)

(assert (=> b!1169888 m!1077239))

(declare-fun m!1077241 () Bool)

(assert (=> b!1169888 m!1077241))

(assert (=> b!1169888 m!1077241))

(declare-fun m!1077243 () Bool)

(assert (=> b!1169888 m!1077243))

(declare-fun m!1077245 () Bool)

(assert (=> b!1169888 m!1077245))

(declare-fun m!1077247 () Bool)

(assert (=> b!1169892 m!1077247))

(declare-fun m!1077249 () Bool)

(assert (=> b!1169900 m!1077249))

(declare-fun m!1077251 () Bool)

(assert (=> b!1169890 m!1077251))

(declare-fun m!1077253 () Bool)

(assert (=> b!1169906 m!1077253))

(declare-fun m!1077255 () Bool)

(assert (=> b!1169906 m!1077255))

(declare-fun m!1077257 () Bool)

(assert (=> b!1169902 m!1077257))

(declare-fun m!1077259 () Bool)

(assert (=> b!1169902 m!1077259))

(declare-fun m!1077261 () Bool)

(assert (=> b!1169902 m!1077261))

(declare-fun m!1077263 () Bool)

(assert (=> b!1169902 m!1077263))

(declare-fun m!1077265 () Bool)

(assert (=> mapNonEmpty!45938 m!1077265))

(declare-fun m!1077267 () Bool)

(assert (=> b!1169899 m!1077267))

(declare-fun m!1077269 () Bool)

(assert (=> start!99292 m!1077269))

(declare-fun m!1077271 () Bool)

(assert (=> start!99292 m!1077271))

(declare-fun m!1077273 () Bool)

(assert (=> b!1169905 m!1077273))

(declare-fun m!1077275 () Bool)

(assert (=> b!1169896 m!1077275))

(declare-fun m!1077277 () Bool)

(assert (=> b!1169896 m!1077277))

(assert (=> b!1169896 m!1077239))

(declare-fun m!1077279 () Bool)

(assert (=> b!1169896 m!1077279))

(assert (=> b!1169896 m!1077239))

(declare-fun m!1077281 () Bool)

(assert (=> b!1169896 m!1077281))

(declare-fun m!1077283 () Bool)

(assert (=> b!1169896 m!1077283))

(declare-fun m!1077285 () Bool)

(assert (=> b!1169893 m!1077285))

(declare-fun m!1077287 () Bool)

(assert (=> b!1169904 m!1077287))

(declare-fun m!1077289 () Bool)

(assert (=> b!1169904 m!1077289))

(declare-fun m!1077291 () Bool)

(assert (=> b!1169889 m!1077291))

(assert (=> b!1169903 m!1077239))

(declare-fun m!1077293 () Bool)

(assert (=> b!1169901 m!1077293))

(declare-fun m!1077295 () Bool)

(assert (=> b!1169901 m!1077295))

(check-sat (not b!1169901) b_and!40601 (not b_lambda!20003) (not b!1169892) (not b!1169888) tp_is_empty!29407 (not b!1169904) (not mapNonEmpty!45938) (not b!1169890) (not b!1169902) (not b!1169889) (not b!1169905) (not b!1169899) (not start!99292) (not b!1169906) (not b_next!24877) (not b!1169900) (not b!1169896))
(check-sat b_and!40601 (not b_next!24877))
