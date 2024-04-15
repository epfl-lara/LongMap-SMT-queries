; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98570 () Bool)

(assert start!98570)

(declare-fun b_free!24181 () Bool)

(declare-fun b_next!24181 () Bool)

(assert (=> start!98570 (= b_free!24181 (not b_next!24181))))

(declare-fun tp!85253 () Bool)

(declare-fun b_and!39189 () Bool)

(assert (=> start!98570 (= tp!85253 b_and!39189)))

(declare-fun bm!51688 () Bool)

(declare-fun call!51697 () Bool)

(declare-fun call!51691 () Bool)

(assert (=> bm!51688 (= call!51697 call!51691)))

(declare-fun b!1143239 () Bool)

(declare-datatypes ((Unit!37377 0))(
  ( (Unit!37378) )
))
(declare-fun e!650361 () Unit!37377)

(declare-fun lt!509719 () Unit!37377)

(assert (=> b!1143239 (= e!650361 lt!509719)))

(declare-fun call!51695 () Unit!37377)

(assert (=> b!1143239 (= lt!509719 call!51695)))

(assert (=> b!1143239 call!51697))

(declare-fun b!1143240 () Bool)

(declare-fun e!650354 () Bool)

(declare-fun tp_is_empty!28711 () Bool)

(assert (=> b!1143240 (= e!650354 tp_is_empty!28711)))

(declare-fun b!1143241 () Bool)

(declare-fun c!112466 () Bool)

(declare-fun lt!509704 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143241 (= c!112466 (and (not lt!509704) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650353 () Unit!37377)

(assert (=> b!1143241 (= e!650353 e!650361)))

(declare-fun b!1143242 () Bool)

(declare-fun res!761705 () Bool)

(declare-fun e!650351 () Bool)

(assert (=> b!1143242 (=> (not res!761705) (not e!650351))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74202 0))(
  ( (array!74203 (arr!35752 (Array (_ BitVec 32) (_ BitVec 64))) (size!36290 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74202)

(assert (=> b!1143242 (= res!761705 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36290 _keys!1208))))))

(declare-fun b!1143243 () Bool)

(declare-fun res!761706 () Bool)

(assert (=> b!1143243 (=> (not res!761706) (not e!650351))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143243 (= res!761706 (validMask!0 mask!1564))))

(declare-fun b!1143244 () Bool)

(declare-fun res!761709 () Bool)

(assert (=> b!1143244 (=> (not res!761709) (not e!650351))))

(declare-datatypes ((V!43409 0))(
  ( (V!43410 (val!14412 Int)) )
))
(declare-datatypes ((ValueCell!13646 0))(
  ( (ValueCellFull!13646 (v!17048 V!43409)) (EmptyCell!13646) )
))
(declare-datatypes ((array!74204 0))(
  ( (array!74205 (arr!35753 (Array (_ BitVec 32) ValueCell!13646)) (size!36291 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74204)

(assert (=> b!1143244 (= res!761709 (and (= (size!36291 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36290 _keys!1208) (size!36291 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51689 () Bool)

(declare-fun call!51694 () Unit!37377)

(assert (=> bm!51689 (= call!51695 call!51694)))

(declare-fun b!1143245 () Bool)

(declare-fun e!650356 () Bool)

(declare-fun e!650358 () Bool)

(assert (=> b!1143245 (= e!650356 e!650358)))

(declare-fun res!761711 () Bool)

(assert (=> b!1143245 (=> res!761711 e!650358)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1143245 (= res!761711 (not (= (select (arr!35752 _keys!1208) from!1455) k0!934)))))

(declare-fun e!650348 () Bool)

(assert (=> b!1143245 e!650348))

(declare-fun c!112464 () Bool)

(assert (=> b!1143245 (= c!112464 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43409)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!509713 () Unit!37377)

(declare-fun minValue!944 () V!43409)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!527 (array!74202 array!74204 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37377)

(assert (=> b!1143245 (= lt!509713 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!527 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143247 () Bool)

(declare-fun res!761707 () Bool)

(assert (=> b!1143247 (=> (not res!761707) (not e!650351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74202 (_ BitVec 32)) Bool)

(assert (=> b!1143247 (= res!761707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143248 () Bool)

(declare-fun res!761702 () Bool)

(declare-fun e!650349 () Bool)

(assert (=> b!1143248 (=> (not res!761702) (not e!650349))))

(declare-fun lt!509720 () array!74202)

(declare-datatypes ((List!25071 0))(
  ( (Nil!25068) (Cons!25067 (h!26276 (_ BitVec 64)) (t!36235 List!25071)) )
))
(declare-fun arrayNoDuplicates!0 (array!74202 (_ BitVec 32) List!25071) Bool)

(assert (=> b!1143248 (= res!761702 (arrayNoDuplicates!0 lt!509720 #b00000000000000000000000000000000 Nil!25068))))

(declare-fun mapIsEmpty!44891 () Bool)

(declare-fun mapRes!44891 () Bool)

(assert (=> mapIsEmpty!44891 mapRes!44891))

(declare-fun b!1143249 () Bool)

(declare-fun e!650355 () Bool)

(assert (=> b!1143249 (= e!650355 tp_is_empty!28711)))

(declare-fun b!1143250 () Bool)

(declare-datatypes ((tuple2!18334 0))(
  ( (tuple2!18335 (_1!9178 (_ BitVec 64)) (_2!9178 V!43409)) )
))
(declare-datatypes ((List!25072 0))(
  ( (Nil!25069) (Cons!25068 (h!26277 tuple2!18334) (t!36236 List!25072)) )
))
(declare-datatypes ((ListLongMap!16303 0))(
  ( (ListLongMap!16304 (toList!8167 List!25072)) )
))
(declare-fun lt!509701 () ListLongMap!16303)

(declare-fun contains!6635 (ListLongMap!16303 (_ BitVec 64)) Bool)

(declare-fun +!3590 (ListLongMap!16303 tuple2!18334) ListLongMap!16303)

(assert (=> b!1143250 (contains!6635 (+!3590 lt!509701 (tuple2!18335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509702 () Unit!37377)

(assert (=> b!1143250 (= lt!509702 call!51694)))

(assert (=> b!1143250 call!51691))

(declare-fun call!51696 () ListLongMap!16303)

(assert (=> b!1143250 (= lt!509701 call!51696)))

(declare-fun lt!509716 () Unit!37377)

(declare-fun lt!509710 () ListLongMap!16303)

(declare-fun addStillContains!804 (ListLongMap!16303 (_ BitVec 64) V!43409 (_ BitVec 64)) Unit!37377)

(assert (=> b!1143250 (= lt!509716 (addStillContains!804 lt!509710 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1143250 (= e!650353 lt!509702)))

(declare-fun e!650352 () Bool)

(declare-fun b!1143251 () Bool)

(declare-fun arrayContainsKey!0 (array!74202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143251 (= e!650352 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143252 () Bool)

(declare-fun res!761699 () Bool)

(assert (=> b!1143252 (=> (not res!761699) (not e!650351))))

(assert (=> b!1143252 (= res!761699 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25068))))

(declare-fun call!51693 () ListLongMap!16303)

(declare-fun c!112461 () Bool)

(declare-fun bm!51690 () Bool)

(assert (=> bm!51690 (= call!51691 (contains!6635 (ite c!112461 lt!509701 call!51693) k0!934))))

(declare-fun b!1143253 () Bool)

(declare-fun e!650357 () Unit!37377)

(declare-fun Unit!37379 () Unit!37377)

(assert (=> b!1143253 (= e!650357 Unit!37379)))

(declare-fun bm!51691 () Bool)

(assert (=> bm!51691 (= call!51693 call!51696)))

(declare-fun lt!509718 () array!74204)

(declare-fun call!51698 () ListLongMap!16303)

(declare-fun bm!51692 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4657 (array!74202 array!74204 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 32) Int) ListLongMap!16303)

(assert (=> bm!51692 (= call!51698 (getCurrentListMapNoExtraKeys!4657 lt!509720 lt!509718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44891 () Bool)

(declare-fun tp!85254 () Bool)

(assert (=> mapNonEmpty!44891 (= mapRes!44891 (and tp!85254 e!650355))))

(declare-fun mapValue!44891 () ValueCell!13646)

(declare-fun mapKey!44891 () (_ BitVec 32))

(declare-fun mapRest!44891 () (Array (_ BitVec 32) ValueCell!13646))

(assert (=> mapNonEmpty!44891 (= (arr!35753 _values!996) (store mapRest!44891 mapKey!44891 mapValue!44891))))

(declare-fun b!1143254 () Bool)

(declare-fun call!51692 () ListLongMap!16303)

(assert (=> b!1143254 (= e!650348 (= call!51698 call!51692))))

(declare-fun b!1143255 () Bool)

(declare-fun e!650346 () Bool)

(assert (=> b!1143255 (= e!650349 (not e!650346))))

(declare-fun res!761704 () Bool)

(assert (=> b!1143255 (=> res!761704 e!650346)))

(assert (=> b!1143255 (= res!761704 (bvsgt from!1455 i!673))))

(assert (=> b!1143255 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509703 () Unit!37377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74202 (_ BitVec 64) (_ BitVec 32)) Unit!37377)

(assert (=> b!1143255 (= lt!509703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!51693 () Bool)

(assert (=> bm!51693 (= call!51694 (addStillContains!804 (ite c!112461 lt!509701 lt!509710) (ite c!112461 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112466 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112461 minValue!944 (ite c!112466 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1143256 () Bool)

(declare-fun e!650360 () Bool)

(assert (=> b!1143256 (= e!650360 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143257 () Bool)

(assert (=> b!1143257 (= e!650351 e!650349)))

(declare-fun res!761703 () Bool)

(assert (=> b!1143257 (=> (not res!761703) (not e!650349))))

(assert (=> b!1143257 (= res!761703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509720 mask!1564))))

(assert (=> b!1143257 (= lt!509720 (array!74203 (store (arr!35752 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36290 _keys!1208)))))

(declare-fun b!1143258 () Bool)

(declare-fun e!650347 () Unit!37377)

(assert (=> b!1143258 (= e!650361 e!650347)))

(declare-fun c!112465 () Bool)

(assert (=> b!1143258 (= c!112465 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509704))))

(declare-fun bm!51694 () Bool)

(assert (=> bm!51694 (= call!51696 (+!3590 lt!509710 (ite (or c!112461 c!112466) (tuple2!18335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1143259 () Bool)

(assert (=> b!1143259 (= e!650360 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509704) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51695 () Bool)

(assert (=> bm!51695 (= call!51692 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143260 () Bool)

(declare-fun e!650359 () Bool)

(assert (=> b!1143260 (= e!650359 (and e!650354 mapRes!44891))))

(declare-fun condMapEmpty!44891 () Bool)

(declare-fun mapDefault!44891 () ValueCell!13646)

(assert (=> b!1143260 (= condMapEmpty!44891 (= (arr!35753 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13646)) mapDefault!44891)))))

(declare-fun b!1143246 () Bool)

(declare-fun Unit!37380 () Unit!37377)

(assert (=> b!1143246 (= e!650357 Unit!37380)))

(assert (=> b!1143246 (= lt!509704 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143246 (= c!112461 (and (not lt!509704) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509721 () Unit!37377)

(assert (=> b!1143246 (= lt!509721 e!650353)))

(declare-fun lt!509709 () Unit!37377)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!402 (array!74202 array!74204 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 64) (_ BitVec 32) Int) Unit!37377)

(assert (=> b!1143246 (= lt!509709 (lemmaListMapContainsThenArrayContainsFrom!402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112462 () Bool)

(assert (=> b!1143246 (= c!112462 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761710 () Bool)

(assert (=> b!1143246 (= res!761710 e!650360)))

(assert (=> b!1143246 (=> (not res!761710) (not e!650352))))

(assert (=> b!1143246 e!650352))

(declare-fun lt!509708 () Unit!37377)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74202 (_ BitVec 32) (_ BitVec 32)) Unit!37377)

(assert (=> b!1143246 (= lt!509708 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143246 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25068)))

(declare-fun lt!509712 () Unit!37377)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74202 (_ BitVec 64) (_ BitVec 32) List!25071) Unit!37377)

(assert (=> b!1143246 (= lt!509712 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25068))))

(assert (=> b!1143246 false))

(declare-fun res!761700 () Bool)

(assert (=> start!98570 (=> (not res!761700) (not e!650351))))

(assert (=> start!98570 (= res!761700 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36290 _keys!1208))))))

(assert (=> start!98570 e!650351))

(assert (=> start!98570 tp_is_empty!28711))

(declare-fun array_inv!27474 (array!74202) Bool)

(assert (=> start!98570 (array_inv!27474 _keys!1208)))

(assert (=> start!98570 true))

(assert (=> start!98570 tp!85253))

(declare-fun array_inv!27475 (array!74204) Bool)

(assert (=> start!98570 (and (array_inv!27475 _values!996) e!650359)))

(declare-fun b!1143261 () Bool)

(declare-fun res!761708 () Bool)

(assert (=> b!1143261 (=> (not res!761708) (not e!650351))))

(assert (=> b!1143261 (= res!761708 (= (select (arr!35752 _keys!1208) i!673) k0!934))))

(declare-fun b!1143262 () Bool)

(declare-fun res!761701 () Bool)

(assert (=> b!1143262 (=> (not res!761701) (not e!650351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143262 (= res!761701 (validKeyInArray!0 k0!934))))

(declare-fun b!1143263 () Bool)

(declare-fun -!1245 (ListLongMap!16303 (_ BitVec 64)) ListLongMap!16303)

(assert (=> b!1143263 (= e!650348 (= call!51698 (-!1245 call!51692 k0!934)))))

(declare-fun b!1143264 () Bool)

(declare-fun Unit!37381 () Unit!37377)

(assert (=> b!1143264 (= e!650347 Unit!37381)))

(declare-fun b!1143265 () Bool)

(assert (=> b!1143265 (= e!650346 e!650356)))

(declare-fun res!761698 () Bool)

(assert (=> b!1143265 (=> res!761698 e!650356)))

(assert (=> b!1143265 (= res!761698 (not (= from!1455 i!673)))))

(declare-fun lt!509706 () ListLongMap!16303)

(assert (=> b!1143265 (= lt!509706 (getCurrentListMapNoExtraKeys!4657 lt!509720 lt!509718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509715 () V!43409)

(assert (=> b!1143265 (= lt!509718 (array!74205 (store (arr!35753 _values!996) i!673 (ValueCellFull!13646 lt!509715)) (size!36291 _values!996)))))

(declare-fun dynLambda!2633 (Int (_ BitVec 64)) V!43409)

(assert (=> b!1143265 (= lt!509715 (dynLambda!2633 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509717 () ListLongMap!16303)

(assert (=> b!1143265 (= lt!509717 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143266 () Bool)

(assert (=> b!1143266 call!51697))

(declare-fun lt!509714 () Unit!37377)

(assert (=> b!1143266 (= lt!509714 call!51695)))

(assert (=> b!1143266 (= e!650347 lt!509714)))

(declare-fun b!1143267 () Bool)

(assert (=> b!1143267 (= e!650358 true)))

(declare-fun lt!509711 () V!43409)

(assert (=> b!1143267 (= (-!1245 (+!3590 lt!509710 (tuple2!18335 (select (arr!35752 _keys!1208) from!1455) lt!509711)) (select (arr!35752 _keys!1208) from!1455)) lt!509710)))

(declare-fun lt!509705 () Unit!37377)

(declare-fun addThenRemoveForNewKeyIsSame!111 (ListLongMap!16303 (_ BitVec 64) V!43409) Unit!37377)

(assert (=> b!1143267 (= lt!509705 (addThenRemoveForNewKeyIsSame!111 lt!509710 (select (arr!35752 _keys!1208) from!1455) lt!509711))))

(declare-fun get!18185 (ValueCell!13646 V!43409) V!43409)

(assert (=> b!1143267 (= lt!509711 (get!18185 (select (arr!35753 _values!996) from!1455) lt!509715))))

(declare-fun lt!509707 () Unit!37377)

(assert (=> b!1143267 (= lt!509707 e!650357)))

(declare-fun c!112463 () Bool)

(assert (=> b!1143267 (= c!112463 (contains!6635 lt!509710 k0!934))))

(assert (=> b!1143267 (= lt!509710 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98570 res!761700) b!1143243))

(assert (= (and b!1143243 res!761706) b!1143244))

(assert (= (and b!1143244 res!761709) b!1143247))

(assert (= (and b!1143247 res!761707) b!1143252))

(assert (= (and b!1143252 res!761699) b!1143242))

(assert (= (and b!1143242 res!761705) b!1143262))

(assert (= (and b!1143262 res!761701) b!1143261))

(assert (= (and b!1143261 res!761708) b!1143257))

(assert (= (and b!1143257 res!761703) b!1143248))

(assert (= (and b!1143248 res!761702) b!1143255))

(assert (= (and b!1143255 (not res!761704)) b!1143265))

(assert (= (and b!1143265 (not res!761698)) b!1143245))

(assert (= (and b!1143245 c!112464) b!1143263))

(assert (= (and b!1143245 (not c!112464)) b!1143254))

(assert (= (or b!1143263 b!1143254) bm!51692))

(assert (= (or b!1143263 b!1143254) bm!51695))

(assert (= (and b!1143245 (not res!761711)) b!1143267))

(assert (= (and b!1143267 c!112463) b!1143246))

(assert (= (and b!1143267 (not c!112463)) b!1143253))

(assert (= (and b!1143246 c!112461) b!1143250))

(assert (= (and b!1143246 (not c!112461)) b!1143241))

(assert (= (and b!1143241 c!112466) b!1143239))

(assert (= (and b!1143241 (not c!112466)) b!1143258))

(assert (= (and b!1143258 c!112465) b!1143266))

(assert (= (and b!1143258 (not c!112465)) b!1143264))

(assert (= (or b!1143239 b!1143266) bm!51689))

(assert (= (or b!1143239 b!1143266) bm!51691))

(assert (= (or b!1143239 b!1143266) bm!51688))

(assert (= (or b!1143250 bm!51688) bm!51690))

(assert (= (or b!1143250 bm!51689) bm!51693))

(assert (= (or b!1143250 bm!51691) bm!51694))

(assert (= (and b!1143246 c!112462) b!1143256))

(assert (= (and b!1143246 (not c!112462)) b!1143259))

(assert (= (and b!1143246 res!761710) b!1143251))

(assert (= (and b!1143260 condMapEmpty!44891) mapIsEmpty!44891))

(assert (= (and b!1143260 (not condMapEmpty!44891)) mapNonEmpty!44891))

(get-info :version)

(assert (= (and mapNonEmpty!44891 ((_ is ValueCellFull!13646) mapValue!44891)) b!1143249))

(assert (= (and b!1143260 ((_ is ValueCellFull!13646) mapDefault!44891)) b!1143240))

(assert (= start!98570 b!1143260))

(declare-fun b_lambda!19269 () Bool)

(assert (=> (not b_lambda!19269) (not b!1143265)))

(declare-fun t!36234 () Bool)

(declare-fun tb!8985 () Bool)

(assert (=> (and start!98570 (= defaultEntry!1004 defaultEntry!1004) t!36234) tb!8985))

(declare-fun result!18543 () Bool)

(assert (=> tb!8985 (= result!18543 tp_is_empty!28711)))

(assert (=> b!1143265 t!36234))

(declare-fun b_and!39191 () Bool)

(assert (= b_and!39189 (and (=> t!36234 result!18543) b_and!39191)))

(declare-fun m!1053915 () Bool)

(assert (=> b!1143247 m!1053915))

(declare-fun m!1053917 () Bool)

(assert (=> bm!51693 m!1053917))

(declare-fun m!1053919 () Bool)

(assert (=> b!1143248 m!1053919))

(declare-fun m!1053921 () Bool)

(assert (=> bm!51694 m!1053921))

(declare-fun m!1053923 () Bool)

(assert (=> b!1143250 m!1053923))

(assert (=> b!1143250 m!1053923))

(declare-fun m!1053925 () Bool)

(assert (=> b!1143250 m!1053925))

(declare-fun m!1053927 () Bool)

(assert (=> b!1143250 m!1053927))

(declare-fun m!1053929 () Bool)

(assert (=> b!1143267 m!1053929))

(declare-fun m!1053931 () Bool)

(assert (=> b!1143267 m!1053931))

(declare-fun m!1053933 () Bool)

(assert (=> b!1143267 m!1053933))

(declare-fun m!1053935 () Bool)

(assert (=> b!1143267 m!1053935))

(declare-fun m!1053937 () Bool)

(assert (=> b!1143267 m!1053937))

(assert (=> b!1143267 m!1053933))

(declare-fun m!1053939 () Bool)

(assert (=> b!1143267 m!1053939))

(assert (=> b!1143267 m!1053937))

(declare-fun m!1053941 () Bool)

(assert (=> b!1143267 m!1053941))

(assert (=> b!1143267 m!1053931))

(declare-fun m!1053943 () Bool)

(assert (=> b!1143267 m!1053943))

(assert (=> b!1143267 m!1053933))

(declare-fun m!1053945 () Bool)

(assert (=> b!1143243 m!1053945))

(declare-fun m!1053947 () Bool)

(assert (=> bm!51692 m!1053947))

(declare-fun m!1053949 () Bool)

(assert (=> start!98570 m!1053949))

(declare-fun m!1053951 () Bool)

(assert (=> start!98570 m!1053951))

(declare-fun m!1053953 () Bool)

(assert (=> b!1143265 m!1053953))

(declare-fun m!1053955 () Bool)

(assert (=> b!1143265 m!1053955))

(declare-fun m!1053957 () Bool)

(assert (=> b!1143265 m!1053957))

(declare-fun m!1053959 () Bool)

(assert (=> b!1143265 m!1053959))

(assert (=> bm!51695 m!1053929))

(declare-fun m!1053961 () Bool)

(assert (=> b!1143263 m!1053961))

(declare-fun m!1053963 () Bool)

(assert (=> b!1143261 m!1053963))

(declare-fun m!1053965 () Bool)

(assert (=> b!1143252 m!1053965))

(declare-fun m!1053967 () Bool)

(assert (=> b!1143262 m!1053967))

(declare-fun m!1053969 () Bool)

(assert (=> b!1143251 m!1053969))

(declare-fun m!1053971 () Bool)

(assert (=> b!1143257 m!1053971))

(declare-fun m!1053973 () Bool)

(assert (=> b!1143257 m!1053973))

(declare-fun m!1053975 () Bool)

(assert (=> mapNonEmpty!44891 m!1053975))

(declare-fun m!1053977 () Bool)

(assert (=> b!1143255 m!1053977))

(declare-fun m!1053979 () Bool)

(assert (=> b!1143255 m!1053979))

(assert (=> b!1143256 m!1053969))

(declare-fun m!1053981 () Bool)

(assert (=> bm!51690 m!1053981))

(declare-fun m!1053983 () Bool)

(assert (=> b!1143246 m!1053983))

(declare-fun m!1053985 () Bool)

(assert (=> b!1143246 m!1053985))

(declare-fun m!1053987 () Bool)

(assert (=> b!1143246 m!1053987))

(declare-fun m!1053989 () Bool)

(assert (=> b!1143246 m!1053989))

(assert (=> b!1143245 m!1053933))

(declare-fun m!1053991 () Bool)

(assert (=> b!1143245 m!1053991))

(check-sat (not bm!51695) (not bm!51693) (not b_lambda!19269) (not b!1143252) (not b!1143255) (not bm!51694) (not b!1143247) (not bm!51692) (not bm!51690) (not b!1143245) (not b!1143243) (not b_next!24181) (not mapNonEmpty!44891) (not start!98570) (not b!1143250) (not b!1143248) (not b!1143265) tp_is_empty!28711 b_and!39191 (not b!1143251) (not b!1143257) (not b!1143263) (not b!1143267) (not b!1143262) (not b!1143246) (not b!1143256))
(check-sat b_and!39191 (not b_next!24181))
