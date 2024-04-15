; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98714 () Bool)

(assert start!98714)

(declare-fun b_free!24325 () Bool)

(declare-fun b_next!24325 () Bool)

(assert (=> start!98714 (= b_free!24325 (not b_next!24325))))

(declare-fun tp!85685 () Bool)

(declare-fun b_and!39477 () Bool)

(assert (=> start!98714 (= tp!85685 b_and!39477)))

(declare-datatypes ((V!43601 0))(
  ( (V!43602 (val!14484 Int)) )
))
(declare-fun zeroValue!944 () V!43601)

(declare-datatypes ((tuple2!18456 0))(
  ( (tuple2!18457 (_1!9239 (_ BitVec 64)) (_2!9239 V!43601)) )
))
(declare-datatypes ((List!25191 0))(
  ( (Nil!25188) (Cons!25187 (h!26396 tuple2!18456) (t!36499 List!25191)) )
))
(declare-datatypes ((ListLongMap!16425 0))(
  ( (ListLongMap!16426 (toList!8228 List!25191)) )
))
(declare-fun lt!514270 () ListLongMap!16425)

(declare-fun c!113758 () Bool)

(declare-fun c!113761 () Bool)

(declare-fun minValue!944 () V!43601)

(declare-fun lt!514284 () ListLongMap!16425)

(declare-fun bm!53416 () Bool)

(declare-fun call!53425 () ListLongMap!16425)

(declare-fun +!3644 (ListLongMap!16425 tuple2!18456) ListLongMap!16425)

(assert (=> bm!53416 (= call!53425 (+!3644 (ite c!113758 lt!514284 lt!514270) (ite c!113758 (tuple2!18457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113761 (tuple2!18457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!53421 () ListLongMap!16425)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!53424 () Bool)

(declare-fun bm!53417 () Bool)

(declare-fun contains!6685 (ListLongMap!16425 (_ BitVec 64)) Bool)

(assert (=> bm!53417 (= call!53424 (contains!6685 (ite c!113758 lt!514284 call!53421) k0!934))))

(declare-fun b!1149838 () Bool)

(declare-datatypes ((Unit!37637 0))(
  ( (Unit!37638) )
))
(declare-fun e!653993 () Unit!37637)

(declare-fun lt!514272 () Unit!37637)

(assert (=> b!1149838 (= e!653993 lt!514272)))

(declare-fun call!53426 () Unit!37637)

(assert (=> b!1149838 (= lt!514272 call!53426)))

(declare-fun call!53419 () Bool)

(assert (=> b!1149838 call!53419))

(declare-fun b!1149839 () Bool)

(declare-fun e!654005 () Bool)

(assert (=> b!1149839 (= e!654005 true)))

(declare-fun e!654000 () Bool)

(assert (=> b!1149839 e!654000))

(declare-fun res!764926 () Bool)

(assert (=> b!1149839 (=> (not res!764926) (not e!654000))))

(declare-fun lt!514276 () ListLongMap!16425)

(assert (=> b!1149839 (= res!764926 (= lt!514276 lt!514270))))

(declare-fun lt!514267 () ListLongMap!16425)

(declare-fun -!1297 (ListLongMap!16425 (_ BitVec 64)) ListLongMap!16425)

(assert (=> b!1149839 (= lt!514276 (-!1297 lt!514267 k0!934))))

(declare-fun lt!514287 () V!43601)

(declare-datatypes ((array!74476 0))(
  ( (array!74477 (arr!35889 (Array (_ BitVec 32) (_ BitVec 64))) (size!36427 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74476)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1149839 (= (-!1297 (+!3644 lt!514270 (tuple2!18457 (select (arr!35889 _keys!1208) from!1455) lt!514287)) (select (arr!35889 _keys!1208) from!1455)) lt!514270)))

(declare-fun lt!514283 () Unit!37637)

(declare-fun addThenRemoveForNewKeyIsSame!155 (ListLongMap!16425 (_ BitVec 64) V!43601) Unit!37637)

(assert (=> b!1149839 (= lt!514283 (addThenRemoveForNewKeyIsSame!155 lt!514270 (select (arr!35889 _keys!1208) from!1455) lt!514287))))

(declare-fun lt!514279 () V!43601)

(declare-datatypes ((ValueCell!13718 0))(
  ( (ValueCellFull!13718 (v!17120 V!43601)) (EmptyCell!13718) )
))
(declare-datatypes ((array!74478 0))(
  ( (array!74479 (arr!35890 (Array (_ BitVec 32) ValueCell!13718)) (size!36428 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74478)

(declare-fun get!18277 (ValueCell!13718 V!43601) V!43601)

(assert (=> b!1149839 (= lt!514287 (get!18277 (select (arr!35890 _values!996) from!1455) lt!514279))))

(declare-fun lt!514280 () Unit!37637)

(declare-fun e!654001 () Unit!37637)

(assert (=> b!1149839 (= lt!514280 e!654001)))

(declare-fun c!113759 () Bool)

(assert (=> b!1149839 (= c!113759 (contains!6685 lt!514270 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4712 (array!74476 array!74478 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 32) Int) ListLongMap!16425)

(assert (=> b!1149839 (= lt!514270 (getCurrentListMapNoExtraKeys!4712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149840 () Bool)

(declare-fun res!764920 () Bool)

(declare-fun e!654002 () Bool)

(assert (=> b!1149840 (=> (not res!764920) (not e!654002))))

(assert (=> b!1149840 (= res!764920 (and (= (size!36428 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36427 _keys!1208) (size!36428 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149841 () Bool)

(declare-fun Unit!37639 () Unit!37637)

(assert (=> b!1149841 (= e!654001 Unit!37639)))

(declare-fun lt!514266 () Bool)

(assert (=> b!1149841 (= lt!514266 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149841 (= c!113758 (and (not lt!514266) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514274 () Unit!37637)

(declare-fun e!653994 () Unit!37637)

(assert (=> b!1149841 (= lt!514274 e!653994)))

(declare-fun lt!514275 () Unit!37637)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!446 (array!74476 array!74478 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 64) (_ BitVec 32) Int) Unit!37637)

(assert (=> b!1149841 (= lt!514275 (lemmaListMapContainsThenArrayContainsFrom!446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113757 () Bool)

(assert (=> b!1149841 (= c!113757 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764927 () Bool)

(declare-fun e!653996 () Bool)

(assert (=> b!1149841 (= res!764927 e!653996)))

(declare-fun e!654009 () Bool)

(assert (=> b!1149841 (=> (not res!764927) (not e!654009))))

(assert (=> b!1149841 e!654009))

(declare-fun lt!514268 () Unit!37637)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74476 (_ BitVec 32) (_ BitVec 32)) Unit!37637)

(assert (=> b!1149841 (= lt!514268 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25192 0))(
  ( (Nil!25189) (Cons!25188 (h!26397 (_ BitVec 64)) (t!36500 List!25192)) )
))
(declare-fun arrayNoDuplicates!0 (array!74476 (_ BitVec 32) List!25192) Bool)

(assert (=> b!1149841 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25189)))

(declare-fun lt!514278 () Unit!37637)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74476 (_ BitVec 64) (_ BitVec 32) List!25192) Unit!37637)

(assert (=> b!1149841 (= lt!514278 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25189))))

(assert (=> b!1149841 false))

(declare-fun b!1149842 () Bool)

(declare-fun res!764918 () Bool)

(assert (=> b!1149842 (=> (not res!764918) (not e!654002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149842 (= res!764918 (validMask!0 mask!1564))))

(declare-fun e!653995 () Bool)

(declare-fun b!1149843 () Bool)

(declare-fun call!53423 () ListLongMap!16425)

(declare-fun call!53420 () ListLongMap!16425)

(assert (=> b!1149843 (= e!653995 (= call!53420 (-!1297 call!53423 k0!934)))))

(declare-fun b!1149844 () Bool)

(declare-fun res!764914 () Bool)

(assert (=> b!1149844 (=> (not res!764914) (not e!654002))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149844 (= res!764914 (= (select (arr!35889 _keys!1208) i!673) k0!934))))

(declare-fun b!1149845 () Bool)

(declare-fun e!653998 () Bool)

(assert (=> b!1149845 (= e!654002 e!653998)))

(declare-fun res!764924 () Bool)

(assert (=> b!1149845 (=> (not res!764924) (not e!653998))))

(declare-fun lt!514271 () array!74476)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74476 (_ BitVec 32)) Bool)

(assert (=> b!1149845 (= res!764924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514271 mask!1564))))

(assert (=> b!1149845 (= lt!514271 (array!74477 (store (arr!35889 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36427 _keys!1208)))))

(declare-fun b!1149846 () Bool)

(declare-fun arrayContainsKey!0 (array!74476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149846 (= e!654009 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149847 () Bool)

(assert (=> b!1149847 (= e!653996 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149848 () Bool)

(assert (=> b!1149848 (= c!113761 (and (not lt!514266) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149848 (= e!653994 e!653993)))

(declare-fun b!1149849 () Bool)

(declare-fun e!654004 () Bool)

(assert (=> b!1149849 (= e!653998 (not e!654004))))

(declare-fun res!764916 () Bool)

(assert (=> b!1149849 (=> res!764916 e!654004)))

(assert (=> b!1149849 (= res!764916 (bvsgt from!1455 i!673))))

(assert (=> b!1149849 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514285 () Unit!37637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74476 (_ BitVec 64) (_ BitVec 32)) Unit!37637)

(assert (=> b!1149849 (= lt!514285 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149850 () Bool)

(declare-fun e!653999 () Unit!37637)

(assert (=> b!1149850 (= e!653993 e!653999)))

(declare-fun c!113760 () Bool)

(assert (=> b!1149850 (= c!113760 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514266))))

(declare-fun b!1149851 () Bool)

(assert (=> b!1149851 call!53419))

(declare-fun lt!514286 () Unit!37637)

(assert (=> b!1149851 (= lt!514286 call!53426)))

(assert (=> b!1149851 (= e!653999 lt!514286)))

(declare-fun b!1149852 () Bool)

(declare-fun res!764923 () Bool)

(assert (=> b!1149852 (=> (not res!764923) (not e!654002))))

(assert (=> b!1149852 (= res!764923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53419 () Bool)

(declare-fun call!53422 () Unit!37637)

(assert (=> bm!53419 (= call!53426 call!53422)))

(declare-fun b!1149853 () Bool)

(declare-fun lt!514277 () array!74478)

(assert (=> b!1149853 (= e!654000 (= lt!514276 (getCurrentListMapNoExtraKeys!4712 lt!514271 lt!514277 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53420 () Bool)

(assert (=> bm!53420 (= call!53421 call!53425)))

(declare-fun b!1149854 () Bool)

(declare-fun e!654008 () Bool)

(assert (=> b!1149854 (= e!654008 e!654005)))

(declare-fun res!764925 () Bool)

(assert (=> b!1149854 (=> res!764925 e!654005)))

(assert (=> b!1149854 (= res!764925 (not (= (select (arr!35889 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1149854 e!653995))

(declare-fun c!113762 () Bool)

(assert (=> b!1149854 (= c!113762 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514269 () Unit!37637)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!571 (array!74476 array!74478 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37637)

(assert (=> b!1149854 (= lt!514269 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149855 () Bool)

(declare-fun res!764915 () Bool)

(assert (=> b!1149855 (=> (not res!764915) (not e!653998))))

(assert (=> b!1149855 (= res!764915 (arrayNoDuplicates!0 lt!514271 #b00000000000000000000000000000000 Nil!25189))))

(declare-fun b!1149856 () Bool)

(assert (=> b!1149856 (= e!653995 (= call!53420 call!53423))))

(declare-fun bm!53421 () Bool)

(assert (=> bm!53421 (= call!53420 (getCurrentListMapNoExtraKeys!4712 lt!514271 lt!514277 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149857 () Bool)

(declare-fun Unit!37640 () Unit!37637)

(assert (=> b!1149857 (= e!654001 Unit!37640)))

(declare-fun b!1149858 () Bool)

(declare-fun e!653997 () Bool)

(declare-fun tp_is_empty!28855 () Bool)

(assert (=> b!1149858 (= e!653997 tp_is_empty!28855)))

(declare-fun b!1149859 () Bool)

(assert (=> b!1149859 (contains!6685 call!53425 k0!934)))

(declare-fun lt!514273 () Unit!37637)

(declare-fun addStillContains!855 (ListLongMap!16425 (_ BitVec 64) V!43601 (_ BitVec 64)) Unit!37637)

(assert (=> b!1149859 (= lt!514273 (addStillContains!855 lt!514284 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1149859 call!53424))

(assert (=> b!1149859 (= lt!514284 (+!3644 lt!514270 (tuple2!18457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514282 () Unit!37637)

(assert (=> b!1149859 (= lt!514282 call!53422)))

(assert (=> b!1149859 (= e!653994 lt!514273)))

(declare-fun b!1149860 () Bool)

(assert (=> b!1149860 (= e!654004 e!654008)))

(declare-fun res!764917 () Bool)

(assert (=> b!1149860 (=> res!764917 e!654008)))

(assert (=> b!1149860 (= res!764917 (not (= from!1455 i!673)))))

(declare-fun lt!514281 () ListLongMap!16425)

(assert (=> b!1149860 (= lt!514281 (getCurrentListMapNoExtraKeys!4712 lt!514271 lt!514277 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1149860 (= lt!514277 (array!74479 (store (arr!35890 _values!996) i!673 (ValueCellFull!13718 lt!514279)) (size!36428 _values!996)))))

(declare-fun dynLambda!2677 (Int (_ BitVec 64)) V!43601)

(assert (=> b!1149860 (= lt!514279 (dynLambda!2677 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1149860 (= lt!514267 (getCurrentListMapNoExtraKeys!4712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149861 () Bool)

(assert (=> b!1149861 (= e!653996 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514266) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149862 () Bool)

(declare-fun e!654006 () Bool)

(assert (=> b!1149862 (= e!654006 tp_is_empty!28855)))

(declare-fun b!1149863 () Bool)

(declare-fun res!764922 () Bool)

(assert (=> b!1149863 (=> (not res!764922) (not e!654002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149863 (= res!764922 (validKeyInArray!0 k0!934))))

(declare-fun b!1149864 () Bool)

(declare-fun Unit!37641 () Unit!37637)

(assert (=> b!1149864 (= e!653999 Unit!37641)))

(declare-fun mapNonEmpty!45107 () Bool)

(declare-fun mapRes!45107 () Bool)

(declare-fun tp!85686 () Bool)

(assert (=> mapNonEmpty!45107 (= mapRes!45107 (and tp!85686 e!654006))))

(declare-fun mapRest!45107 () (Array (_ BitVec 32) ValueCell!13718))

(declare-fun mapKey!45107 () (_ BitVec 32))

(declare-fun mapValue!45107 () ValueCell!13718)

(assert (=> mapNonEmpty!45107 (= (arr!35890 _values!996) (store mapRest!45107 mapKey!45107 mapValue!45107))))

(declare-fun bm!53422 () Bool)

(assert (=> bm!53422 (= call!53419 call!53424)))

(declare-fun b!1149865 () Bool)

(declare-fun res!764921 () Bool)

(assert (=> b!1149865 (=> (not res!764921) (not e!654002))))

(assert (=> b!1149865 (= res!764921 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25189))))

(declare-fun bm!53423 () Bool)

(assert (=> bm!53423 (= call!53423 (getCurrentListMapNoExtraKeys!4712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!764913 () Bool)

(assert (=> start!98714 (=> (not res!764913) (not e!654002))))

(assert (=> start!98714 (= res!764913 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36427 _keys!1208))))))

(assert (=> start!98714 e!654002))

(assert (=> start!98714 tp_is_empty!28855))

(declare-fun array_inv!27576 (array!74476) Bool)

(assert (=> start!98714 (array_inv!27576 _keys!1208)))

(assert (=> start!98714 true))

(assert (=> start!98714 tp!85685))

(declare-fun e!654003 () Bool)

(declare-fun array_inv!27577 (array!74478) Bool)

(assert (=> start!98714 (and (array_inv!27577 _values!996) e!654003)))

(declare-fun bm!53418 () Bool)

(assert (=> bm!53418 (= call!53422 (addStillContains!855 lt!514270 (ite (or c!113758 c!113761) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113758 c!113761) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1149866 () Bool)

(assert (=> b!1149866 (= e!654003 (and e!653997 mapRes!45107))))

(declare-fun condMapEmpty!45107 () Bool)

(declare-fun mapDefault!45107 () ValueCell!13718)

(assert (=> b!1149866 (= condMapEmpty!45107 (= (arr!35890 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13718)) mapDefault!45107)))))

(declare-fun mapIsEmpty!45107 () Bool)

(assert (=> mapIsEmpty!45107 mapRes!45107))

(declare-fun b!1149867 () Bool)

(declare-fun res!764919 () Bool)

(assert (=> b!1149867 (=> (not res!764919) (not e!654002))))

(assert (=> b!1149867 (= res!764919 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36427 _keys!1208))))))

(assert (= (and start!98714 res!764913) b!1149842))

(assert (= (and b!1149842 res!764918) b!1149840))

(assert (= (and b!1149840 res!764920) b!1149852))

(assert (= (and b!1149852 res!764923) b!1149865))

(assert (= (and b!1149865 res!764921) b!1149867))

(assert (= (and b!1149867 res!764919) b!1149863))

(assert (= (and b!1149863 res!764922) b!1149844))

(assert (= (and b!1149844 res!764914) b!1149845))

(assert (= (and b!1149845 res!764924) b!1149855))

(assert (= (and b!1149855 res!764915) b!1149849))

(assert (= (and b!1149849 (not res!764916)) b!1149860))

(assert (= (and b!1149860 (not res!764917)) b!1149854))

(assert (= (and b!1149854 c!113762) b!1149843))

(assert (= (and b!1149854 (not c!113762)) b!1149856))

(assert (= (or b!1149843 b!1149856) bm!53421))

(assert (= (or b!1149843 b!1149856) bm!53423))

(assert (= (and b!1149854 (not res!764925)) b!1149839))

(assert (= (and b!1149839 c!113759) b!1149841))

(assert (= (and b!1149839 (not c!113759)) b!1149857))

(assert (= (and b!1149841 c!113758) b!1149859))

(assert (= (and b!1149841 (not c!113758)) b!1149848))

(assert (= (and b!1149848 c!113761) b!1149838))

(assert (= (and b!1149848 (not c!113761)) b!1149850))

(assert (= (and b!1149850 c!113760) b!1149851))

(assert (= (and b!1149850 (not c!113760)) b!1149864))

(assert (= (or b!1149838 b!1149851) bm!53419))

(assert (= (or b!1149838 b!1149851) bm!53420))

(assert (= (or b!1149838 b!1149851) bm!53422))

(assert (= (or b!1149859 bm!53422) bm!53417))

(assert (= (or b!1149859 bm!53419) bm!53418))

(assert (= (or b!1149859 bm!53420) bm!53416))

(assert (= (and b!1149841 c!113757) b!1149847))

(assert (= (and b!1149841 (not c!113757)) b!1149861))

(assert (= (and b!1149841 res!764927) b!1149846))

(assert (= (and b!1149839 res!764926) b!1149853))

(assert (= (and b!1149866 condMapEmpty!45107) mapIsEmpty!45107))

(assert (= (and b!1149866 (not condMapEmpty!45107)) mapNonEmpty!45107))

(get-info :version)

(assert (= (and mapNonEmpty!45107 ((_ is ValueCellFull!13718) mapValue!45107)) b!1149862))

(assert (= (and b!1149866 ((_ is ValueCellFull!13718) mapDefault!45107)) b!1149858))

(assert (= start!98714 b!1149866))

(declare-fun b_lambda!19413 () Bool)

(assert (=> (not b_lambda!19413) (not b!1149860)))

(declare-fun t!36498 () Bool)

(declare-fun tb!9129 () Bool)

(assert (=> (and start!98714 (= defaultEntry!1004 defaultEntry!1004) t!36498) tb!9129))

(declare-fun result!18831 () Bool)

(assert (=> tb!9129 (= result!18831 tp_is_empty!28855)))

(assert (=> b!1149860 t!36498))

(declare-fun b_and!39479 () Bool)

(assert (= b_and!39477 (and (=> t!36498 result!18831) b_and!39479)))

(declare-fun m!1059663 () Bool)

(assert (=> mapNonEmpty!45107 m!1059663))

(declare-fun m!1059665 () Bool)

(assert (=> bm!53423 m!1059665))

(declare-fun m!1059667 () Bool)

(assert (=> b!1149855 m!1059667))

(declare-fun m!1059669 () Bool)

(assert (=> b!1149849 m!1059669))

(declare-fun m!1059671 () Bool)

(assert (=> b!1149849 m!1059671))

(declare-fun m!1059673 () Bool)

(assert (=> b!1149842 m!1059673))

(declare-fun m!1059675 () Bool)

(assert (=> bm!53416 m!1059675))

(declare-fun m!1059677 () Bool)

(assert (=> b!1149863 m!1059677))

(declare-fun m!1059679 () Bool)

(assert (=> b!1149852 m!1059679))

(declare-fun m!1059681 () Bool)

(assert (=> b!1149841 m!1059681))

(declare-fun m!1059683 () Bool)

(assert (=> b!1149841 m!1059683))

(declare-fun m!1059685 () Bool)

(assert (=> b!1149841 m!1059685))

(declare-fun m!1059687 () Bool)

(assert (=> b!1149841 m!1059687))

(declare-fun m!1059689 () Bool)

(assert (=> b!1149847 m!1059689))

(assert (=> b!1149846 m!1059689))

(declare-fun m!1059691 () Bool)

(assert (=> b!1149843 m!1059691))

(assert (=> b!1149839 m!1059665))

(declare-fun m!1059693 () Bool)

(assert (=> b!1149839 m!1059693))

(declare-fun m!1059695 () Bool)

(assert (=> b!1149839 m!1059695))

(declare-fun m!1059697 () Bool)

(assert (=> b!1149839 m!1059697))

(declare-fun m!1059699 () Bool)

(assert (=> b!1149839 m!1059699))

(declare-fun m!1059701 () Bool)

(assert (=> b!1149839 m!1059701))

(assert (=> b!1149839 m!1059693))

(declare-fun m!1059703 () Bool)

(assert (=> b!1149839 m!1059703))

(assert (=> b!1149839 m!1059697))

(assert (=> b!1149839 m!1059699))

(declare-fun m!1059705 () Bool)

(assert (=> b!1149839 m!1059705))

(assert (=> b!1149839 m!1059699))

(declare-fun m!1059707 () Bool)

(assert (=> b!1149839 m!1059707))

(declare-fun m!1059709 () Bool)

(assert (=> b!1149844 m!1059709))

(declare-fun m!1059711 () Bool)

(assert (=> start!98714 m!1059711))

(declare-fun m!1059713 () Bool)

(assert (=> start!98714 m!1059713))

(declare-fun m!1059715 () Bool)

(assert (=> b!1149860 m!1059715))

(declare-fun m!1059717 () Bool)

(assert (=> b!1149860 m!1059717))

(declare-fun m!1059719 () Bool)

(assert (=> b!1149860 m!1059719))

(declare-fun m!1059721 () Bool)

(assert (=> b!1149860 m!1059721))

(declare-fun m!1059723 () Bool)

(assert (=> b!1149845 m!1059723))

(declare-fun m!1059725 () Bool)

(assert (=> b!1149845 m!1059725))

(assert (=> b!1149854 m!1059699))

(declare-fun m!1059727 () Bool)

(assert (=> b!1149854 m!1059727))

(declare-fun m!1059729 () Bool)

(assert (=> b!1149853 m!1059729))

(declare-fun m!1059731 () Bool)

(assert (=> b!1149859 m!1059731))

(declare-fun m!1059733 () Bool)

(assert (=> b!1149859 m!1059733))

(declare-fun m!1059735 () Bool)

(assert (=> b!1149859 m!1059735))

(declare-fun m!1059737 () Bool)

(assert (=> bm!53418 m!1059737))

(declare-fun m!1059739 () Bool)

(assert (=> b!1149865 m!1059739))

(assert (=> bm!53421 m!1059729))

(declare-fun m!1059741 () Bool)

(assert (=> bm!53417 m!1059741))

(check-sat (not start!98714) (not bm!53423) (not bm!53421) (not b!1149841) (not b!1149853) (not b!1149849) (not b!1149865) (not b!1149859) tp_is_empty!28855 (not bm!53417) (not b!1149847) (not b!1149845) (not b!1149854) (not b!1149839) (not b!1149863) (not b!1149842) (not b!1149843) (not bm!53418) b_and!39479 (not b!1149860) (not b!1149846) (not b_next!24325) (not b_lambda!19413) (not bm!53416) (not b!1149852) (not b!1149855) (not mapNonEmpty!45107))
(check-sat b_and!39479 (not b_next!24325))
