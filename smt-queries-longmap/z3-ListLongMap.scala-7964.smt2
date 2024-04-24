; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98860 () Bool)

(assert start!98860)

(declare-fun b_free!24229 () Bool)

(declare-fun b_next!24229 () Bool)

(assert (=> start!98860 (= b_free!24229 (not b_next!24229))))

(declare-fun tp!85398 () Bool)

(declare-fun b_and!39309 () Bool)

(assert (=> start!98860 (= tp!85398 b_and!39309)))

(declare-fun b!1146835 () Bool)

(declare-fun res!763335 () Bool)

(declare-fun e!652459 () Bool)

(assert (=> b!1146835 (=> (not res!763335) (not e!652459))))

(declare-datatypes ((array!74415 0))(
  ( (array!74416 (arr!35852 (Array (_ BitVec 32) (_ BitVec 64))) (size!36389 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74415)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74415 (_ BitVec 32)) Bool)

(assert (=> b!1146835 (= res!763335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146836 () Bool)

(declare-fun res!763329 () Bool)

(assert (=> b!1146836 (=> (not res!763329) (not e!652459))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1146836 (= res!763329 (= (select (arr!35852 _keys!1208) i!673) k0!934))))

(declare-fun b!1146837 () Bool)

(declare-fun e!652460 () Bool)

(declare-fun e!652465 () Bool)

(assert (=> b!1146837 (= e!652460 e!652465)))

(declare-fun res!763338 () Bool)

(assert (=> b!1146837 (=> res!763338 e!652465)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1146837 (= res!763338 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43473 0))(
  ( (V!43474 (val!14436 Int)) )
))
(declare-fun zeroValue!944 () V!43473)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!511898 () array!74415)

(declare-datatypes ((ValueCell!13670 0))(
  ( (ValueCellFull!13670 (v!17069 V!43473)) (EmptyCell!13670) )
))
(declare-datatypes ((array!74417 0))(
  ( (array!74418 (arr!35853 (Array (_ BitVec 32) ValueCell!13670)) (size!36390 (_ BitVec 32))) )
))
(declare-fun lt!511899 () array!74417)

(declare-fun minValue!944 () V!43473)

(declare-datatypes ((tuple2!18302 0))(
  ( (tuple2!18303 (_1!9162 (_ BitVec 64)) (_2!9162 V!43473)) )
))
(declare-datatypes ((List!25057 0))(
  ( (Nil!25054) (Cons!25053 (h!26271 tuple2!18302) (t!36270 List!25057)) )
))
(declare-datatypes ((ListLongMap!16279 0))(
  ( (ListLongMap!16280 (toList!8155 List!25057)) )
))
(declare-fun lt!511903 () ListLongMap!16279)

(declare-fun getCurrentListMapNoExtraKeys!4659 (array!74415 array!74417 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 32) Int) ListLongMap!16279)

(assert (=> b!1146837 (= lt!511903 (getCurrentListMapNoExtraKeys!4659 lt!511898 lt!511899 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74417)

(declare-fun lt!511894 () V!43473)

(assert (=> b!1146837 (= lt!511899 (array!74418 (store (arr!35853 _values!996) i!673 (ValueCellFull!13670 lt!511894)) (size!36390 _values!996)))))

(declare-fun dynLambda!2688 (Int (_ BitVec 64)) V!43473)

(assert (=> b!1146837 (= lt!511894 (dynLambda!2688 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511889 () ListLongMap!16279)

(assert (=> b!1146837 (= lt!511889 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146838 () Bool)

(declare-fun res!763334 () Bool)

(assert (=> b!1146838 (=> (not res!763334) (not e!652459))))

(declare-datatypes ((List!25058 0))(
  ( (Nil!25055) (Cons!25054 (h!26272 (_ BitVec 64)) (t!36271 List!25058)) )
))
(declare-fun arrayNoDuplicates!0 (array!74415 (_ BitVec 32) List!25058) Bool)

(assert (=> b!1146838 (= res!763334 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25055))))

(declare-fun e!652463 () Bool)

(declare-fun lt!511906 () Bool)

(declare-fun b!1146839 () Bool)

(assert (=> b!1146839 (= e!652463 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511906) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52352 () Bool)

(declare-fun call!52359 () Bool)

(declare-fun call!52356 () Bool)

(assert (=> bm!52352 (= call!52359 call!52356)))

(declare-fun b!1146840 () Bool)

(declare-datatypes ((Unit!37591 0))(
  ( (Unit!37592) )
))
(declare-fun e!652458 () Unit!37591)

(declare-fun lt!511897 () Unit!37591)

(assert (=> b!1146840 (= e!652458 lt!511897)))

(declare-fun call!52357 () Unit!37591)

(assert (=> b!1146840 (= lt!511897 call!52357)))

(assert (=> b!1146840 call!52359))

(declare-fun b!1146841 () Bool)

(declare-fun res!763336 () Bool)

(assert (=> b!1146841 (=> (not res!763336) (not e!652459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146841 (= res!763336 (validKeyInArray!0 k0!934))))

(declare-fun b!1146842 () Bool)

(declare-fun e!652470 () Bool)

(declare-fun call!52355 () ListLongMap!16279)

(declare-fun call!52362 () ListLongMap!16279)

(assert (=> b!1146842 (= e!652470 (= call!52355 call!52362))))

(declare-fun b!1146843 () Bool)

(declare-fun e!652466 () Unit!37591)

(declare-fun Unit!37593 () Unit!37591)

(assert (=> b!1146843 (= e!652466 Unit!37593)))

(declare-fun b!1146844 () Bool)

(declare-fun e!652461 () Bool)

(assert (=> b!1146844 (= e!652461 true)))

(declare-fun e!652468 () Bool)

(assert (=> b!1146844 e!652468))

(declare-fun res!763337 () Bool)

(assert (=> b!1146844 (=> (not res!763337) (not e!652468))))

(declare-fun lt!511901 () ListLongMap!16279)

(declare-fun lt!511907 () V!43473)

(declare-fun -!1281 (ListLongMap!16279 (_ BitVec 64)) ListLongMap!16279)

(declare-fun +!3596 (ListLongMap!16279 tuple2!18302) ListLongMap!16279)

(assert (=> b!1146844 (= res!763337 (= (-!1281 (+!3596 lt!511901 (tuple2!18303 (select (arr!35852 _keys!1208) from!1455) lt!511907)) (select (arr!35852 _keys!1208) from!1455)) lt!511901))))

(declare-fun lt!511893 () Unit!37591)

(declare-fun addThenRemoveForNewKeyIsSame!135 (ListLongMap!16279 (_ BitVec 64) V!43473) Unit!37591)

(assert (=> b!1146844 (= lt!511893 (addThenRemoveForNewKeyIsSame!135 lt!511901 (select (arr!35852 _keys!1208) from!1455) lt!511907))))

(declare-fun get!18256 (ValueCell!13670 V!43473) V!43473)

(assert (=> b!1146844 (= lt!511907 (get!18256 (select (arr!35853 _values!996) from!1455) lt!511894))))

(declare-fun lt!511902 () Unit!37591)

(assert (=> b!1146844 (= lt!511902 e!652466)))

(declare-fun c!113317 () Bool)

(declare-fun contains!6695 (ListLongMap!16279 (_ BitVec 64)) Bool)

(assert (=> b!1146844 (= c!113317 (contains!6695 lt!511901 k0!934))))

(assert (=> b!1146844 (= lt!511901 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52353 () Bool)

(declare-fun call!52361 () Unit!37591)

(assert (=> bm!52353 (= call!52357 call!52361)))

(declare-fun b!1146845 () Bool)

(declare-fun call!52360 () ListLongMap!16279)

(assert (=> b!1146845 (contains!6695 call!52360 k0!934)))

(declare-fun lt!511905 () Unit!37591)

(declare-fun lt!511890 () ListLongMap!16279)

(declare-fun addStillContains!823 (ListLongMap!16279 (_ BitVec 64) V!43473 (_ BitVec 64)) Unit!37591)

(assert (=> b!1146845 (= lt!511905 (addStillContains!823 lt!511890 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1146845 call!52356))

(assert (=> b!1146845 (= lt!511890 (+!3596 lt!511901 (tuple2!18303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511909 () Unit!37591)

(assert (=> b!1146845 (= lt!511909 call!52361)))

(declare-fun e!652462 () Unit!37591)

(assert (=> b!1146845 (= e!652462 lt!511905)))

(declare-fun b!1146846 () Bool)

(declare-fun Unit!37594 () Unit!37591)

(assert (=> b!1146846 (= e!652466 Unit!37594)))

(assert (=> b!1146846 (= lt!511906 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113318 () Bool)

(assert (=> b!1146846 (= c!113318 (and (not lt!511906) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511891 () Unit!37591)

(assert (=> b!1146846 (= lt!511891 e!652462)))

(declare-fun lt!511908 () Unit!37591)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!420 (array!74415 array!74417 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 64) (_ BitVec 32) Int) Unit!37591)

(assert (=> b!1146846 (= lt!511908 (lemmaListMapContainsThenArrayContainsFrom!420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113321 () Bool)

(assert (=> b!1146846 (= c!113321 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763327 () Bool)

(assert (=> b!1146846 (= res!763327 e!652463)))

(declare-fun e!652469 () Bool)

(assert (=> b!1146846 (=> (not res!763327) (not e!652469))))

(assert (=> b!1146846 e!652469))

(declare-fun lt!511900 () Unit!37591)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74415 (_ BitVec 32) (_ BitVec 32)) Unit!37591)

(assert (=> b!1146846 (= lt!511900 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146846 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25055)))

(declare-fun lt!511896 () Unit!37591)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74415 (_ BitVec 64) (_ BitVec 32) List!25058) Unit!37591)

(assert (=> b!1146846 (= lt!511896 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25055))))

(assert (=> b!1146846 false))

(declare-fun bm!52354 () Bool)

(assert (=> bm!52354 (= call!52355 (getCurrentListMapNoExtraKeys!4659 lt!511898 lt!511899 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146847 () Bool)

(declare-fun e!652471 () Unit!37591)

(declare-fun Unit!37595 () Unit!37591)

(assert (=> b!1146847 (= e!652471 Unit!37595)))

(declare-fun res!763339 () Bool)

(assert (=> start!98860 (=> (not res!763339) (not e!652459))))

(assert (=> start!98860 (= res!763339 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36389 _keys!1208))))))

(assert (=> start!98860 e!652459))

(declare-fun tp_is_empty!28759 () Bool)

(assert (=> start!98860 tp_is_empty!28759))

(declare-fun array_inv!27516 (array!74415) Bool)

(assert (=> start!98860 (array_inv!27516 _keys!1208)))

(assert (=> start!98860 true))

(assert (=> start!98860 tp!85398))

(declare-fun e!652456 () Bool)

(declare-fun array_inv!27517 (array!74417) Bool)

(assert (=> start!98860 (and (array_inv!27517 _values!996) e!652456)))

(declare-fun bm!52355 () Bool)

(declare-fun call!52358 () ListLongMap!16279)

(assert (=> bm!52355 (= call!52356 (contains!6695 (ite c!113318 lt!511890 call!52358) k0!934))))

(declare-fun bm!52356 () Bool)

(assert (=> bm!52356 (= call!52362 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44963 () Bool)

(declare-fun mapRes!44963 () Bool)

(assert (=> mapIsEmpty!44963 mapRes!44963))

(declare-fun b!1146848 () Bool)

(declare-fun e!652464 () Bool)

(assert (=> b!1146848 (= e!652456 (and e!652464 mapRes!44963))))

(declare-fun condMapEmpty!44963 () Bool)

(declare-fun mapDefault!44963 () ValueCell!13670)

(assert (=> b!1146848 (= condMapEmpty!44963 (= (arr!35853 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13670)) mapDefault!44963)))))

(declare-fun b!1146849 () Bool)

(assert (=> b!1146849 (= e!652458 e!652471)))

(declare-fun c!113319 () Bool)

(assert (=> b!1146849 (= c!113319 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511906))))

(declare-fun c!113320 () Bool)

(declare-fun bm!52357 () Bool)

(assert (=> bm!52357 (= call!52360 (+!3596 (ite c!113318 lt!511890 lt!511901) (ite c!113318 (tuple2!18303 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113320 (tuple2!18303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18303 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1146850 () Bool)

(assert (=> b!1146850 call!52359))

(declare-fun lt!511904 () Unit!37591)

(assert (=> b!1146850 (= lt!511904 call!52357)))

(assert (=> b!1146850 (= e!652471 lt!511904)))

(declare-fun bm!52358 () Bool)

(assert (=> bm!52358 (= call!52361 (addStillContains!823 lt!511901 (ite (or c!113318 c!113320) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113318 c!113320) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1146851 () Bool)

(declare-fun res!763331 () Bool)

(assert (=> b!1146851 (=> (not res!763331) (not e!652459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146851 (= res!763331 (validMask!0 mask!1564))))

(declare-fun b!1146852 () Bool)

(assert (=> b!1146852 (= c!113320 (and (not lt!511906) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1146852 (= e!652462 e!652458)))

(declare-fun b!1146853 () Bool)

(assert (=> b!1146853 (= e!652465 e!652461)))

(declare-fun res!763333 () Bool)

(assert (=> b!1146853 (=> res!763333 e!652461)))

(assert (=> b!1146853 (= res!763333 (not (= (select (arr!35852 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146853 e!652470))

(declare-fun c!113322 () Bool)

(assert (=> b!1146853 (= c!113322 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511892 () Unit!37591)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!529 (array!74415 array!74417 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37591)

(assert (=> b!1146853 (= lt!511892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146854 () Bool)

(assert (=> b!1146854 (= e!652468 (= (-!1281 lt!511889 k0!934) lt!511901))))

(declare-fun b!1146855 () Bool)

(declare-fun arrayContainsKey!0 (array!74415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146855 (= e!652463 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44963 () Bool)

(declare-fun tp!85397 () Bool)

(declare-fun e!652455 () Bool)

(assert (=> mapNonEmpty!44963 (= mapRes!44963 (and tp!85397 e!652455))))

(declare-fun mapValue!44963 () ValueCell!13670)

(declare-fun mapRest!44963 () (Array (_ BitVec 32) ValueCell!13670))

(declare-fun mapKey!44963 () (_ BitVec 32))

(assert (=> mapNonEmpty!44963 (= (arr!35853 _values!996) (store mapRest!44963 mapKey!44963 mapValue!44963))))

(declare-fun b!1146856 () Bool)

(declare-fun res!763332 () Bool)

(assert (=> b!1146856 (=> (not res!763332) (not e!652459))))

(assert (=> b!1146856 (= res!763332 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36389 _keys!1208))))))

(declare-fun b!1146857 () Bool)

(declare-fun e!652457 () Bool)

(assert (=> b!1146857 (= e!652459 e!652457)))

(declare-fun res!763330 () Bool)

(assert (=> b!1146857 (=> (not res!763330) (not e!652457))))

(assert (=> b!1146857 (= res!763330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511898 mask!1564))))

(assert (=> b!1146857 (= lt!511898 (array!74416 (store (arr!35852 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36389 _keys!1208)))))

(declare-fun b!1146858 () Bool)

(assert (=> b!1146858 (= e!652455 tp_is_empty!28759)))

(declare-fun b!1146859 () Bool)

(assert (=> b!1146859 (= e!652457 (not e!652460))))

(declare-fun res!763328 () Bool)

(assert (=> b!1146859 (=> res!763328 e!652460)))

(assert (=> b!1146859 (= res!763328 (bvsgt from!1455 i!673))))

(assert (=> b!1146859 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511895 () Unit!37591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74415 (_ BitVec 64) (_ BitVec 32)) Unit!37591)

(assert (=> b!1146859 (= lt!511895 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52359 () Bool)

(assert (=> bm!52359 (= call!52358 call!52360)))

(declare-fun b!1146860 () Bool)

(assert (=> b!1146860 (= e!652470 (= call!52355 (-!1281 call!52362 k0!934)))))

(declare-fun b!1146861 () Bool)

(declare-fun res!763340 () Bool)

(assert (=> b!1146861 (=> (not res!763340) (not e!652459))))

(assert (=> b!1146861 (= res!763340 (and (= (size!36390 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36389 _keys!1208) (size!36390 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146862 () Bool)

(declare-fun res!763341 () Bool)

(assert (=> b!1146862 (=> (not res!763341) (not e!652457))))

(assert (=> b!1146862 (= res!763341 (arrayNoDuplicates!0 lt!511898 #b00000000000000000000000000000000 Nil!25055))))

(declare-fun b!1146863 () Bool)

(assert (=> b!1146863 (= e!652464 tp_is_empty!28759)))

(declare-fun b!1146864 () Bool)

(assert (=> b!1146864 (= e!652469 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98860 res!763339) b!1146851))

(assert (= (and b!1146851 res!763331) b!1146861))

(assert (= (and b!1146861 res!763340) b!1146835))

(assert (= (and b!1146835 res!763335) b!1146838))

(assert (= (and b!1146838 res!763334) b!1146856))

(assert (= (and b!1146856 res!763332) b!1146841))

(assert (= (and b!1146841 res!763336) b!1146836))

(assert (= (and b!1146836 res!763329) b!1146857))

(assert (= (and b!1146857 res!763330) b!1146862))

(assert (= (and b!1146862 res!763341) b!1146859))

(assert (= (and b!1146859 (not res!763328)) b!1146837))

(assert (= (and b!1146837 (not res!763338)) b!1146853))

(assert (= (and b!1146853 c!113322) b!1146860))

(assert (= (and b!1146853 (not c!113322)) b!1146842))

(assert (= (or b!1146860 b!1146842) bm!52354))

(assert (= (or b!1146860 b!1146842) bm!52356))

(assert (= (and b!1146853 (not res!763333)) b!1146844))

(assert (= (and b!1146844 c!113317) b!1146846))

(assert (= (and b!1146844 (not c!113317)) b!1146843))

(assert (= (and b!1146846 c!113318) b!1146845))

(assert (= (and b!1146846 (not c!113318)) b!1146852))

(assert (= (and b!1146852 c!113320) b!1146840))

(assert (= (and b!1146852 (not c!113320)) b!1146849))

(assert (= (and b!1146849 c!113319) b!1146850))

(assert (= (and b!1146849 (not c!113319)) b!1146847))

(assert (= (or b!1146840 b!1146850) bm!52353))

(assert (= (or b!1146840 b!1146850) bm!52359))

(assert (= (or b!1146840 b!1146850) bm!52352))

(assert (= (or b!1146845 bm!52352) bm!52355))

(assert (= (or b!1146845 bm!52353) bm!52358))

(assert (= (or b!1146845 bm!52359) bm!52357))

(assert (= (and b!1146846 c!113321) b!1146855))

(assert (= (and b!1146846 (not c!113321)) b!1146839))

(assert (= (and b!1146846 res!763327) b!1146864))

(assert (= (and b!1146844 res!763337) b!1146854))

(assert (= (and b!1146848 condMapEmpty!44963) mapIsEmpty!44963))

(assert (= (and b!1146848 (not condMapEmpty!44963)) mapNonEmpty!44963))

(get-info :version)

(assert (= (and mapNonEmpty!44963 ((_ is ValueCellFull!13670) mapValue!44963)) b!1146858))

(assert (= (and b!1146848 ((_ is ValueCellFull!13670) mapDefault!44963)) b!1146863))

(assert (= start!98860 b!1146848))

(declare-fun b_lambda!19329 () Bool)

(assert (=> (not b_lambda!19329) (not b!1146837)))

(declare-fun t!36269 () Bool)

(declare-fun tb!9033 () Bool)

(assert (=> (and start!98860 (= defaultEntry!1004 defaultEntry!1004) t!36269) tb!9033))

(declare-fun result!18639 () Bool)

(assert (=> tb!9033 (= result!18639 tp_is_empty!28759)))

(assert (=> b!1146837 t!36269))

(declare-fun b_and!39311 () Bool)

(assert (= b_and!39309 (and (=> t!36269 result!18639) b_and!39311)))

(declare-fun m!1057993 () Bool)

(assert (=> b!1146846 m!1057993))

(declare-fun m!1057995 () Bool)

(assert (=> b!1146846 m!1057995))

(declare-fun m!1057997 () Bool)

(assert (=> b!1146846 m!1057997))

(declare-fun m!1057999 () Bool)

(assert (=> b!1146846 m!1057999))

(declare-fun m!1058001 () Bool)

(assert (=> mapNonEmpty!44963 m!1058001))

(declare-fun m!1058003 () Bool)

(assert (=> b!1146836 m!1058003))

(declare-fun m!1058005 () Bool)

(assert (=> b!1146837 m!1058005))

(declare-fun m!1058007 () Bool)

(assert (=> b!1146837 m!1058007))

(declare-fun m!1058009 () Bool)

(assert (=> b!1146837 m!1058009))

(declare-fun m!1058011 () Bool)

(assert (=> b!1146837 m!1058011))

(declare-fun m!1058013 () Bool)

(assert (=> b!1146859 m!1058013))

(declare-fun m!1058015 () Bool)

(assert (=> b!1146859 m!1058015))

(declare-fun m!1058017 () Bool)

(assert (=> b!1146862 m!1058017))

(declare-fun m!1058019 () Bool)

(assert (=> bm!52357 m!1058019))

(declare-fun m!1058021 () Bool)

(assert (=> b!1146855 m!1058021))

(declare-fun m!1058023 () Bool)

(assert (=> bm!52356 m!1058023))

(declare-fun m!1058025 () Bool)

(assert (=> b!1146851 m!1058025))

(declare-fun m!1058027 () Bool)

(assert (=> b!1146835 m!1058027))

(declare-fun m!1058029 () Bool)

(assert (=> b!1146841 m!1058029))

(declare-fun m!1058031 () Bool)

(assert (=> b!1146860 m!1058031))

(declare-fun m!1058033 () Bool)

(assert (=> bm!52355 m!1058033))

(assert (=> b!1146864 m!1058021))

(declare-fun m!1058035 () Bool)

(assert (=> bm!52358 m!1058035))

(declare-fun m!1058037 () Bool)

(assert (=> b!1146857 m!1058037))

(declare-fun m!1058039 () Bool)

(assert (=> b!1146857 m!1058039))

(declare-fun m!1058041 () Bool)

(assert (=> start!98860 m!1058041))

(declare-fun m!1058043 () Bool)

(assert (=> start!98860 m!1058043))

(declare-fun m!1058045 () Bool)

(assert (=> b!1146854 m!1058045))

(assert (=> b!1146844 m!1058023))

(declare-fun m!1058047 () Bool)

(assert (=> b!1146844 m!1058047))

(declare-fun m!1058049 () Bool)

(assert (=> b!1146844 m!1058049))

(declare-fun m!1058051 () Bool)

(assert (=> b!1146844 m!1058051))

(assert (=> b!1146844 m!1058049))

(declare-fun m!1058053 () Bool)

(assert (=> b!1146844 m!1058053))

(declare-fun m!1058055 () Bool)

(assert (=> b!1146844 m!1058055))

(declare-fun m!1058057 () Bool)

(assert (=> b!1146844 m!1058057))

(declare-fun m!1058059 () Bool)

(assert (=> b!1146844 m!1058059))

(assert (=> b!1146844 m!1058049))

(assert (=> b!1146844 m!1058057))

(assert (=> b!1146844 m!1058047))

(declare-fun m!1058061 () Bool)

(assert (=> b!1146845 m!1058061))

(declare-fun m!1058063 () Bool)

(assert (=> b!1146845 m!1058063))

(declare-fun m!1058065 () Bool)

(assert (=> b!1146845 m!1058065))

(declare-fun m!1058067 () Bool)

(assert (=> bm!52354 m!1058067))

(assert (=> b!1146853 m!1058049))

(declare-fun m!1058069 () Bool)

(assert (=> b!1146853 m!1058069))

(declare-fun m!1058071 () Bool)

(assert (=> b!1146838 m!1058071))

(check-sat (not b!1146844) (not b!1146862) tp_is_empty!28759 (not b!1146846) (not b_lambda!19329) (not b!1146854) (not b!1146859) (not b!1146841) b_and!39311 (not b!1146838) (not bm!52356) (not b!1146845) (not bm!52358) (not mapNonEmpty!44963) (not bm!52357) (not b!1146855) (not bm!52355) (not b!1146851) (not b!1146857) (not start!98860) (not b!1146853) (not b!1146837) (not b!1146860) (not b!1146864) (not b_next!24229) (not b!1146835) (not bm!52354))
(check-sat b_and!39311 (not b_next!24229))
