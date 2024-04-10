; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98652 () Bool)

(assert start!98652)

(declare-fun b_free!24257 () Bool)

(declare-fun b_next!24257 () Bool)

(assert (=> start!98652 (= b_free!24257 (not b_next!24257))))

(declare-fun tp!85481 () Bool)

(declare-fun b_and!39363 () Bool)

(assert (=> start!98652 (= tp!85481 b_and!39363)))

(declare-datatypes ((V!43509 0))(
  ( (V!43510 (val!14450 Int)) )
))
(declare-fun zeroValue!944 () V!43509)

(declare-datatypes ((Unit!37660 0))(
  ( (Unit!37661) )
))
(declare-fun call!52631 () Unit!37660)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!113175 () Bool)

(declare-datatypes ((tuple2!18312 0))(
  ( (tuple2!18313 (_1!9167 (_ BitVec 64)) (_2!9167 V!43509)) )
))
(declare-datatypes ((List!25063 0))(
  ( (Nil!25060) (Cons!25059 (h!26268 tuple2!18312) (t!36312 List!25063)) )
))
(declare-datatypes ((ListLongMap!16281 0))(
  ( (ListLongMap!16282 (toList!8156 List!25063)) )
))
(declare-fun lt!512297 () ListLongMap!16281)

(declare-fun bm!52623 () Bool)

(declare-fun c!113171 () Bool)

(declare-fun minValue!944 () V!43509)

(declare-fun lt!512301 () ListLongMap!16281)

(declare-fun addStillContains!832 (ListLongMap!16281 (_ BitVec 64) V!43509 (_ BitVec 64)) Unit!37660)

(assert (=> bm!52623 (= call!52631 (addStillContains!832 (ite c!113171 lt!512301 lt!512297) (ite c!113171 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113175 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113171 minValue!944 (ite c!113175 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1146834 () Bool)

(declare-fun e!652347 () Unit!37660)

(declare-fun Unit!37662 () Unit!37660)

(assert (=> b!1146834 (= e!652347 Unit!37662)))

(declare-fun res!763455 () Bool)

(declare-fun e!652341 () Bool)

(assert (=> start!98652 (=> (not res!763455) (not e!652341))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74421 0))(
  ( (array!74422 (arr!35861 (Array (_ BitVec 32) (_ BitVec 64))) (size!36397 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74421)

(assert (=> start!98652 (= res!763455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36397 _keys!1208))))))

(assert (=> start!98652 e!652341))

(declare-fun tp_is_empty!28787 () Bool)

(assert (=> start!98652 tp_is_empty!28787))

(declare-fun array_inv!27470 (array!74421) Bool)

(assert (=> start!98652 (array_inv!27470 _keys!1208)))

(assert (=> start!98652 true))

(assert (=> start!98652 tp!85481))

(declare-datatypes ((ValueCell!13684 0))(
  ( (ValueCellFull!13684 (v!17087 V!43509)) (EmptyCell!13684) )
))
(declare-datatypes ((array!74423 0))(
  ( (array!74424 (arr!35862 (Array (_ BitVec 32) ValueCell!13684)) (size!36398 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74423)

(declare-fun e!652350 () Bool)

(declare-fun array_inv!27471 (array!74423) Bool)

(assert (=> start!98652 (and (array_inv!27471 _values!996) e!652350)))

(declare-fun b!1146835 () Bool)

(declare-fun Unit!37663 () Unit!37660)

(assert (=> b!1146835 (= e!652347 Unit!37663)))

(declare-fun lt!512307 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1146835 (= lt!512307 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146835 (= c!113171 (and (not lt!512307) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512295 () Unit!37660)

(declare-fun e!652353 () Unit!37660)

(assert (=> b!1146835 (= lt!512295 e!652353)))

(declare-fun lt!512300 () Unit!37660)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!425 (array!74421 array!74423 (_ BitVec 32) (_ BitVec 32) V!43509 V!43509 (_ BitVec 64) (_ BitVec 32) Int) Unit!37660)

(assert (=> b!1146835 (= lt!512300 (lemmaListMapContainsThenArrayContainsFrom!425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113176 () Bool)

(assert (=> b!1146835 (= c!113176 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763456 () Bool)

(declare-fun e!652351 () Bool)

(assert (=> b!1146835 (= res!763456 e!652351)))

(declare-fun e!652340 () Bool)

(assert (=> b!1146835 (=> (not res!763456) (not e!652340))))

(assert (=> b!1146835 e!652340))

(declare-fun lt!512290 () Unit!37660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74421 (_ BitVec 32) (_ BitVec 32)) Unit!37660)

(assert (=> b!1146835 (= lt!512290 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25064 0))(
  ( (Nil!25061) (Cons!25060 (h!26269 (_ BitVec 64)) (t!36313 List!25064)) )
))
(declare-fun arrayNoDuplicates!0 (array!74421 (_ BitVec 32) List!25064) Bool)

(assert (=> b!1146835 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25061)))

(declare-fun lt!512305 () Unit!37660)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74421 (_ BitVec 64) (_ BitVec 32) List!25064) Unit!37660)

(assert (=> b!1146835 (= lt!512305 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25061))))

(assert (=> b!1146835 false))

(declare-fun b!1146836 () Bool)

(declare-fun res!763453 () Bool)

(assert (=> b!1146836 (=> (not res!763453) (not e!652341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146836 (= res!763453 (validKeyInArray!0 k!934))))

(declare-fun b!1146837 () Bool)

(declare-fun res!763452 () Bool)

(declare-fun e!652349 () Bool)

(assert (=> b!1146837 (=> (not res!763452) (not e!652349))))

(declare-fun lt!512292 () array!74421)

(assert (=> b!1146837 (= res!763452 (arrayNoDuplicates!0 lt!512292 #b00000000000000000000000000000000 Nil!25061))))

(declare-fun b!1146838 () Bool)

(declare-fun e!652344 () Unit!37660)

(declare-fun Unit!37664 () Unit!37660)

(assert (=> b!1146838 (= e!652344 Unit!37664)))

(declare-fun mapIsEmpty!45005 () Bool)

(declare-fun mapRes!45005 () Bool)

(assert (=> mapIsEmpty!45005 mapRes!45005))

(declare-fun b!1146839 () Bool)

(declare-fun call!52629 () Bool)

(assert (=> b!1146839 call!52629))

(declare-fun lt!512288 () Unit!37660)

(declare-fun call!52630 () Unit!37660)

(assert (=> b!1146839 (= lt!512288 call!52630)))

(assert (=> b!1146839 (= e!652344 lt!512288)))

(declare-fun lt!512289 () array!74423)

(declare-fun c!113173 () Bool)

(declare-fun call!52632 () ListLongMap!16281)

(declare-fun bm!52624 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4630 (array!74421 array!74423 (_ BitVec 32) (_ BitVec 32) V!43509 V!43509 (_ BitVec 32) Int) ListLongMap!16281)

(assert (=> bm!52624 (= call!52632 (getCurrentListMapNoExtraKeys!4630 (ite c!113173 lt!512292 _keys!1208) (ite c!113173 lt!512289 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146840 () Bool)

(assert (=> b!1146840 (= c!113175 (and (not lt!512307) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652346 () Unit!37660)

(assert (=> b!1146840 (= e!652353 e!652346)))

(declare-fun b!1146841 () Bool)

(declare-fun res!763459 () Bool)

(assert (=> b!1146841 (=> (not res!763459) (not e!652341))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146841 (= res!763459 (= (select (arr!35861 _keys!1208) i!673) k!934))))

(declare-fun b!1146842 () Bool)

(declare-fun contains!6680 (ListLongMap!16281 (_ BitVec 64)) Bool)

(declare-fun +!3580 (ListLongMap!16281 tuple2!18312) ListLongMap!16281)

(assert (=> b!1146842 (contains!6680 (+!3580 lt!512301 (tuple2!18313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!512299 () Unit!37660)

(assert (=> b!1146842 (= lt!512299 call!52631)))

(declare-fun call!52628 () Bool)

(assert (=> b!1146842 call!52628))

(declare-fun call!52633 () ListLongMap!16281)

(assert (=> b!1146842 (= lt!512301 call!52633)))

(declare-fun lt!512306 () Unit!37660)

(assert (=> b!1146842 (= lt!512306 (addStillContains!832 lt!512297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1146842 (= e!652353 lt!512299)))

(declare-fun mapNonEmpty!45005 () Bool)

(declare-fun tp!85482 () Bool)

(declare-fun e!652337 () Bool)

(assert (=> mapNonEmpty!45005 (= mapRes!45005 (and tp!85482 e!652337))))

(declare-fun mapRest!45005 () (Array (_ BitVec 32) ValueCell!13684))

(declare-fun mapKey!45005 () (_ BitVec 32))

(declare-fun mapValue!45005 () ValueCell!13684)

(assert (=> mapNonEmpty!45005 (= (arr!35862 _values!996) (store mapRest!45005 mapKey!45005 mapValue!45005))))

(declare-fun b!1146843 () Bool)

(declare-fun e!652338 () Bool)

(assert (=> b!1146843 (= e!652349 (not e!652338))))

(declare-fun res!763460 () Bool)

(assert (=> b!1146843 (=> res!763460 e!652338)))

(assert (=> b!1146843 (= res!763460 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146843 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!512291 () Unit!37660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74421 (_ BitVec 64) (_ BitVec 32)) Unit!37660)

(assert (=> b!1146843 (= lt!512291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1146844 () Bool)

(assert (=> b!1146844 (= e!652341 e!652349)))

(declare-fun res!763461 () Bool)

(assert (=> b!1146844 (=> (not res!763461) (not e!652349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74421 (_ BitVec 32)) Bool)

(assert (=> b!1146844 (= res!763461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512292 mask!1564))))

(assert (=> b!1146844 (= lt!512292 (array!74422 (store (arr!35861 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36397 _keys!1208)))))

(declare-fun b!1146845 () Bool)

(declare-fun e!652345 () Bool)

(assert (=> b!1146845 (= e!652345 true)))

(declare-fun e!652339 () Bool)

(assert (=> b!1146845 e!652339))

(declare-fun res!763449 () Bool)

(assert (=> b!1146845 (=> (not res!763449) (not e!652339))))

(declare-fun lt!512302 () V!43509)

(declare-fun -!1293 (ListLongMap!16281 (_ BitVec 64)) ListLongMap!16281)

(assert (=> b!1146845 (= res!763449 (= (-!1293 (+!3580 lt!512297 (tuple2!18313 (select (arr!35861 _keys!1208) from!1455) lt!512302)) (select (arr!35861 _keys!1208) from!1455)) lt!512297))))

(declare-fun lt!512293 () Unit!37660)

(declare-fun addThenRemoveForNewKeyIsSame!141 (ListLongMap!16281 (_ BitVec 64) V!43509) Unit!37660)

(assert (=> b!1146845 (= lt!512293 (addThenRemoveForNewKeyIsSame!141 lt!512297 (select (arr!35861 _keys!1208) from!1455) lt!512302))))

(declare-fun lt!512304 () V!43509)

(declare-fun get!18239 (ValueCell!13684 V!43509) V!43509)

(assert (=> b!1146845 (= lt!512302 (get!18239 (select (arr!35862 _values!996) from!1455) lt!512304))))

(declare-fun lt!512294 () Unit!37660)

(assert (=> b!1146845 (= lt!512294 e!652347)))

(declare-fun c!113174 () Bool)

(assert (=> b!1146845 (= c!113174 (contains!6680 lt!512297 k!934))))

(assert (=> b!1146845 (= lt!512297 (getCurrentListMapNoExtraKeys!4630 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146846 () Bool)

(declare-fun lt!512296 () Unit!37660)

(assert (=> b!1146846 (= e!652346 lt!512296)))

(assert (=> b!1146846 (= lt!512296 call!52630)))

(assert (=> b!1146846 call!52629))

(declare-fun b!1146847 () Bool)

(assert (=> b!1146847 (= e!652351 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512307) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146848 () Bool)

(declare-fun e!652352 () Bool)

(declare-fun call!52627 () ListLongMap!16281)

(assert (=> b!1146848 (= e!652352 (= call!52627 call!52632))))

(declare-fun b!1146849 () Bool)

(declare-fun res!763458 () Bool)

(assert (=> b!1146849 (=> (not res!763458) (not e!652341))))

(assert (=> b!1146849 (= res!763458 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36397 _keys!1208))))))

(declare-fun b!1146850 () Bool)

(declare-fun res!763450 () Bool)

(assert (=> b!1146850 (=> (not res!763450) (not e!652341))))

(assert (=> b!1146850 (= res!763450 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25061))))

(declare-fun b!1146851 () Bool)

(assert (=> b!1146851 (= e!652346 e!652344)))

(declare-fun c!113172 () Bool)

(assert (=> b!1146851 (= c!113172 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512307))))

(declare-fun bm!52625 () Bool)

(assert (=> bm!52625 (= call!52627 (getCurrentListMapNoExtraKeys!4630 (ite c!113173 _keys!1208 lt!512292) (ite c!113173 _values!996 lt!512289) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52626 () Bool)

(assert (=> bm!52626 (= call!52630 call!52631)))

(declare-fun b!1146852 () Bool)

(declare-fun res!763462 () Bool)

(assert (=> b!1146852 (=> (not res!763462) (not e!652341))))

(assert (=> b!1146852 (= res!763462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52627 () Bool)

(assert (=> bm!52627 (= call!52629 call!52628)))

(declare-fun b!1146853 () Bool)

(assert (=> b!1146853 (= e!652352 (= call!52632 (-!1293 call!52627 k!934)))))

(declare-fun bm!52628 () Bool)

(assert (=> bm!52628 (= call!52633 (+!3580 lt!512297 (ite (or c!113171 c!113175) (tuple2!18313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146854 () Bool)

(declare-fun e!652348 () Bool)

(assert (=> b!1146854 (= e!652348 e!652345)))

(declare-fun res!763463 () Bool)

(assert (=> b!1146854 (=> res!763463 e!652345)))

(assert (=> b!1146854 (= res!763463 (not (= (select (arr!35861 _keys!1208) from!1455) k!934)))))

(assert (=> b!1146854 e!652352))

(assert (=> b!1146854 (= c!113173 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512287 () Unit!37660)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!531 (array!74421 array!74423 (_ BitVec 32) (_ BitVec 32) V!43509 V!43509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37660)

(assert (=> b!1146854 (= lt!512287 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52629 () Bool)

(declare-fun call!52626 () ListLongMap!16281)

(assert (=> bm!52629 (= call!52628 (contains!6680 (ite c!113171 lt!512301 call!52626) k!934))))

(declare-fun b!1146855 () Bool)

(assert (=> b!1146855 (= e!652340 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146856 () Bool)

(declare-fun res!763451 () Bool)

(assert (=> b!1146856 (=> (not res!763451) (not e!652341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146856 (= res!763451 (validMask!0 mask!1564))))

(declare-fun bm!52630 () Bool)

(assert (=> bm!52630 (= call!52626 call!52633)))

(declare-fun b!1146857 () Bool)

(declare-fun e!652342 () Bool)

(assert (=> b!1146857 (= e!652350 (and e!652342 mapRes!45005))))

(declare-fun condMapEmpty!45005 () Bool)

(declare-fun mapDefault!45005 () ValueCell!13684)

