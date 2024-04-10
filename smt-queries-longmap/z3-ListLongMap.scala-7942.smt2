; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98494 () Bool)

(assert start!98494)

(declare-fun b_free!24099 () Bool)

(declare-fun b_next!24099 () Bool)

(assert (=> start!98494 (= b_free!24099 (not b_next!24099))))

(declare-fun tp!85007 () Bool)

(declare-fun b_and!39047 () Bool)

(assert (=> start!98494 (= tp!85007 b_and!39047)))

(declare-fun b!1139714 () Bool)

(declare-fun res!760053 () Bool)

(declare-fun e!648469 () Bool)

(assert (=> b!1139714 (=> (not res!760053) (not e!648469))))

(declare-datatypes ((array!74117 0))(
  ( (array!74118 (arr!35709 (Array (_ BitVec 32) (_ BitVec 64))) (size!36245 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74117)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43299 0))(
  ( (V!43300 (val!14371 Int)) )
))
(declare-datatypes ((ValueCell!13605 0))(
  ( (ValueCellFull!13605 (v!17008 V!43299)) (EmptyCell!13605) )
))
(declare-datatypes ((array!74119 0))(
  ( (array!74120 (arr!35710 (Array (_ BitVec 32) ValueCell!13605)) (size!36246 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74119)

(assert (=> b!1139714 (= res!760053 (and (= (size!36246 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36245 _keys!1208) (size!36246 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43299)

(declare-fun bm!50727 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43299)

(declare-datatypes ((tuple2!18168 0))(
  ( (tuple2!18169 (_1!9095 (_ BitVec 64)) (_2!9095 V!43299)) )
))
(declare-datatypes ((List!24924 0))(
  ( (Nil!24921) (Cons!24920 (h!26129 tuple2!18168) (t!36015 List!24924)) )
))
(declare-datatypes ((ListLongMap!16137 0))(
  ( (ListLongMap!16138 (toList!8084 List!24924)) )
))
(declare-fun call!50736 () ListLongMap!16137)

(declare-fun getCurrentListMapNoExtraKeys!4567 (array!74117 array!74119 (_ BitVec 32) (_ BitVec 32) V!43299 V!43299 (_ BitVec 32) Int) ListLongMap!16137)

(assert (=> bm!50727 (= call!50736 (getCurrentListMapNoExtraKeys!4567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139715 () Bool)

(declare-fun e!648465 () Bool)

(assert (=> b!1139715 (= e!648465 true)))

(declare-fun lt!507328 () ListLongMap!16137)

(declare-fun lt!507317 () V!43299)

(declare-fun -!1235 (ListLongMap!16137 (_ BitVec 64)) ListLongMap!16137)

(declare-fun +!3516 (ListLongMap!16137 tuple2!18168) ListLongMap!16137)

(assert (=> b!1139715 (= (-!1235 (+!3516 lt!507328 (tuple2!18169 (select (arr!35709 _keys!1208) from!1455) lt!507317)) (select (arr!35709 _keys!1208) from!1455)) lt!507328)))

(declare-datatypes ((Unit!37360 0))(
  ( (Unit!37361) )
))
(declare-fun lt!507321 () Unit!37360)

(declare-fun addThenRemoveForNewKeyIsSame!90 (ListLongMap!16137 (_ BitVec 64) V!43299) Unit!37360)

(assert (=> b!1139715 (= lt!507321 (addThenRemoveForNewKeyIsSame!90 lt!507328 (select (arr!35709 _keys!1208) from!1455) lt!507317))))

(declare-fun lt!507311 () V!43299)

(declare-fun get!18136 (ValueCell!13605 V!43299) V!43299)

(assert (=> b!1139715 (= lt!507317 (get!18136 (select (arr!35710 _values!996) from!1455) lt!507311))))

(declare-fun lt!507329 () Unit!37360)

(declare-fun e!648466 () Unit!37360)

(assert (=> b!1139715 (= lt!507329 e!648466)))

(declare-fun c!111752 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6619 (ListLongMap!16137 (_ BitVec 64)) Bool)

(assert (=> b!1139715 (= c!111752 (contains!6619 lt!507328 k0!934))))

(assert (=> b!1139715 (= lt!507328 (getCurrentListMapNoExtraKeys!4567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139716 () Bool)

(declare-fun e!648471 () Bool)

(declare-fun e!648463 () Bool)

(assert (=> b!1139716 (= e!648471 e!648463)))

(declare-fun res!760045 () Bool)

(assert (=> b!1139716 (=> res!760045 e!648463)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139716 (= res!760045 (not (= from!1455 i!673)))))

(declare-fun lt!507315 () array!74117)

(declare-fun lt!507325 () ListLongMap!16137)

(declare-fun lt!507324 () array!74119)

(assert (=> b!1139716 (= lt!507325 (getCurrentListMapNoExtraKeys!4567 lt!507315 lt!507324 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1139716 (= lt!507324 (array!74120 (store (arr!35710 _values!996) i!673 (ValueCellFull!13605 lt!507311)) (size!36246 _values!996)))))

(declare-fun dynLambda!2616 (Int (_ BitVec 64)) V!43299)

(assert (=> b!1139716 (= lt!507311 (dynLambda!2616 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507313 () ListLongMap!16137)

(assert (=> b!1139716 (= lt!507313 (getCurrentListMapNoExtraKeys!4567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139717 () Bool)

(declare-fun e!648467 () Bool)

(declare-fun tp_is_empty!28629 () Bool)

(assert (=> b!1139717 (= e!648467 tp_is_empty!28629)))

(declare-fun mapIsEmpty!44768 () Bool)

(declare-fun mapRes!44768 () Bool)

(assert (=> mapIsEmpty!44768 mapRes!44768))

(declare-fun b!1139718 () Bool)

(declare-fun call!50733 () ListLongMap!16137)

(assert (=> b!1139718 (contains!6619 call!50733 k0!934)))

(declare-fun lt!507322 () Unit!37360)

(declare-fun lt!507316 () ListLongMap!16137)

(declare-fun addStillContains!774 (ListLongMap!16137 (_ BitVec 64) V!43299 (_ BitVec 64)) Unit!37360)

(assert (=> b!1139718 (= lt!507322 (addStillContains!774 lt!507316 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50735 () Bool)

(assert (=> b!1139718 call!50735))

(assert (=> b!1139718 (= lt!507316 (+!3516 lt!507328 (tuple2!18169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507310 () Unit!37360)

(declare-fun call!50734 () Unit!37360)

(assert (=> b!1139718 (= lt!507310 call!50734)))

(declare-fun e!648458 () Unit!37360)

(assert (=> b!1139718 (= e!648458 lt!507322)))

(declare-fun b!1139719 () Bool)

(declare-fun e!648456 () Unit!37360)

(declare-fun e!648461 () Unit!37360)

(assert (=> b!1139719 (= e!648456 e!648461)))

(declare-fun c!111754 () Bool)

(declare-fun lt!507320 () Bool)

(assert (=> b!1139719 (= c!111754 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507320))))

(declare-fun mapNonEmpty!44768 () Bool)

(declare-fun tp!85008 () Bool)

(assert (=> mapNonEmpty!44768 (= mapRes!44768 (and tp!85008 e!648467))))

(declare-fun mapKey!44768 () (_ BitVec 32))

(declare-fun mapRest!44768 () (Array (_ BitVec 32) ValueCell!13605))

(declare-fun mapValue!44768 () ValueCell!13605)

(assert (=> mapNonEmpty!44768 (= (arr!35710 _values!996) (store mapRest!44768 mapKey!44768 mapValue!44768))))

(declare-fun bm!50728 () Bool)

(declare-fun c!111753 () Bool)

(declare-fun c!111750 () Bool)

(assert (=> bm!50728 (= call!50734 (addStillContains!774 lt!507328 (ite (or c!111753 c!111750) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111753 c!111750) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1139720 () Bool)

(declare-fun e!648470 () Bool)

(declare-fun arrayContainsKey!0 (array!74117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139720 (= e!648470 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139721 () Bool)

(declare-fun e!648460 () Bool)

(declare-fun call!50731 () ListLongMap!16137)

(assert (=> b!1139721 (= e!648460 (= call!50731 call!50736))))

(declare-fun bm!50729 () Bool)

(declare-fun call!50732 () Unit!37360)

(assert (=> bm!50729 (= call!50732 call!50734)))

(declare-fun b!1139722 () Bool)

(declare-fun Unit!37362 () Unit!37360)

(assert (=> b!1139722 (= e!648466 Unit!37362)))

(assert (=> b!1139722 (= lt!507320 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139722 (= c!111753 (and (not lt!507320) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507326 () Unit!37360)

(assert (=> b!1139722 (= lt!507326 e!648458)))

(declare-fun lt!507319 () Unit!37360)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!375 (array!74117 array!74119 (_ BitVec 32) (_ BitVec 32) V!43299 V!43299 (_ BitVec 64) (_ BitVec 32) Int) Unit!37360)

(assert (=> b!1139722 (= lt!507319 (lemmaListMapContainsThenArrayContainsFrom!375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111751 () Bool)

(assert (=> b!1139722 (= c!111751 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760046 () Bool)

(assert (=> b!1139722 (= res!760046 e!648470)))

(declare-fun e!648457 () Bool)

(assert (=> b!1139722 (=> (not res!760046) (not e!648457))))

(assert (=> b!1139722 e!648457))

(declare-fun lt!507318 () Unit!37360)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74117 (_ BitVec 32) (_ BitVec 32)) Unit!37360)

(assert (=> b!1139722 (= lt!507318 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24925 0))(
  ( (Nil!24922) (Cons!24921 (h!26130 (_ BitVec 64)) (t!36016 List!24925)) )
))
(declare-fun arrayNoDuplicates!0 (array!74117 (_ BitVec 32) List!24925) Bool)

(assert (=> b!1139722 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24922)))

(declare-fun lt!507314 () Unit!37360)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74117 (_ BitVec 64) (_ BitVec 32) List!24925) Unit!37360)

(assert (=> b!1139722 (= lt!507314 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24922))))

(assert (=> b!1139722 false))

(declare-fun bm!50730 () Bool)

(assert (=> bm!50730 (= call!50733 (+!3516 (ite c!111753 lt!507316 lt!507328) (ite c!111753 (tuple2!18169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111750 (tuple2!18169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1139723 () Bool)

(declare-fun res!760051 () Bool)

(assert (=> b!1139723 (=> (not res!760051) (not e!648469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139723 (= res!760051 (validKeyInArray!0 k0!934))))

(declare-fun b!1139724 () Bool)

(assert (=> b!1139724 (= e!648470 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507320) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!760043 () Bool)

(assert (=> start!98494 (=> (not res!760043) (not e!648469))))

(assert (=> start!98494 (= res!760043 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36245 _keys!1208))))))

(assert (=> start!98494 e!648469))

(assert (=> start!98494 tp_is_empty!28629))

(declare-fun array_inv!27372 (array!74117) Bool)

(assert (=> start!98494 (array_inv!27372 _keys!1208)))

(assert (=> start!98494 true))

(assert (=> start!98494 tp!85007))

(declare-fun e!648464 () Bool)

(declare-fun array_inv!27373 (array!74119) Bool)

(assert (=> start!98494 (and (array_inv!27373 _values!996) e!648464)))

(declare-fun b!1139725 () Bool)

(declare-fun res!760047 () Bool)

(assert (=> b!1139725 (=> (not res!760047) (not e!648469))))

(assert (=> b!1139725 (= res!760047 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36245 _keys!1208))))))

(declare-fun b!1139726 () Bool)

(declare-fun Unit!37363 () Unit!37360)

(assert (=> b!1139726 (= e!648461 Unit!37363)))

(declare-fun b!1139727 () Bool)

(assert (=> b!1139727 (= e!648457 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139728 () Bool)

(assert (=> b!1139728 (= e!648460 (= call!50731 (-!1235 call!50736 k0!934)))))

(declare-fun b!1139729 () Bool)

(declare-fun Unit!37364 () Unit!37360)

(assert (=> b!1139729 (= e!648466 Unit!37364)))

(declare-fun b!1139730 () Bool)

(assert (=> b!1139730 (= c!111750 (and (not lt!507320) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139730 (= e!648458 e!648456)))

(declare-fun b!1139731 () Bool)

(declare-fun call!50730 () Bool)

(assert (=> b!1139731 call!50730))

(declare-fun lt!507330 () Unit!37360)

(assert (=> b!1139731 (= lt!507330 call!50732)))

(assert (=> b!1139731 (= e!648461 lt!507330)))

(declare-fun b!1139732 () Bool)

(declare-fun res!760042 () Bool)

(assert (=> b!1139732 (=> (not res!760042) (not e!648469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74117 (_ BitVec 32)) Bool)

(assert (=> b!1139732 (= res!760042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139733 () Bool)

(declare-fun lt!507327 () Unit!37360)

(assert (=> b!1139733 (= e!648456 lt!507327)))

(assert (=> b!1139733 (= lt!507327 call!50732)))

(assert (=> b!1139733 call!50730))

(declare-fun b!1139734 () Bool)

(declare-fun e!648468 () Bool)

(assert (=> b!1139734 (= e!648469 e!648468)))

(declare-fun res!760055 () Bool)

(assert (=> b!1139734 (=> (not res!760055) (not e!648468))))

(assert (=> b!1139734 (= res!760055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507315 mask!1564))))

(assert (=> b!1139734 (= lt!507315 (array!74118 (store (arr!35709 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36245 _keys!1208)))))

(declare-fun b!1139735 () Bool)

(assert (=> b!1139735 (= e!648463 e!648465)))

(declare-fun res!760048 () Bool)

(assert (=> b!1139735 (=> res!760048 e!648465)))

(assert (=> b!1139735 (= res!760048 (not (= (select (arr!35709 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1139735 e!648460))

(declare-fun c!111749 () Bool)

(assert (=> b!1139735 (= c!111749 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507312 () Unit!37360)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!482 (array!74117 array!74119 (_ BitVec 32) (_ BitVec 32) V!43299 V!43299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37360)

(assert (=> b!1139735 (= lt!507312 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139736 () Bool)

(declare-fun res!760049 () Bool)

(assert (=> b!1139736 (=> (not res!760049) (not e!648468))))

(assert (=> b!1139736 (= res!760049 (arrayNoDuplicates!0 lt!507315 #b00000000000000000000000000000000 Nil!24922))))

(declare-fun b!1139737 () Bool)

(declare-fun res!760052 () Bool)

(assert (=> b!1139737 (=> (not res!760052) (not e!648469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139737 (= res!760052 (validMask!0 mask!1564))))

(declare-fun b!1139738 () Bool)

(declare-fun res!760050 () Bool)

(assert (=> b!1139738 (=> (not res!760050) (not e!648469))))

(assert (=> b!1139738 (= res!760050 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24922))))

(declare-fun bm!50731 () Bool)

(declare-fun call!50737 () ListLongMap!16137)

(assert (=> bm!50731 (= call!50737 call!50733)))

(declare-fun bm!50732 () Bool)

(assert (=> bm!50732 (= call!50735 (contains!6619 (ite c!111753 lt!507316 call!50737) k0!934))))

(declare-fun bm!50733 () Bool)

(assert (=> bm!50733 (= call!50731 (getCurrentListMapNoExtraKeys!4567 lt!507315 lt!507324 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139739 () Bool)

(declare-fun res!760044 () Bool)

(assert (=> b!1139739 (=> (not res!760044) (not e!648469))))

(assert (=> b!1139739 (= res!760044 (= (select (arr!35709 _keys!1208) i!673) k0!934))))

(declare-fun bm!50734 () Bool)

(assert (=> bm!50734 (= call!50730 call!50735)))

(declare-fun b!1139740 () Bool)

(declare-fun e!648459 () Bool)

(assert (=> b!1139740 (= e!648459 tp_is_empty!28629)))

(declare-fun b!1139741 () Bool)

(assert (=> b!1139741 (= e!648468 (not e!648471))))

(declare-fun res!760054 () Bool)

(assert (=> b!1139741 (=> res!760054 e!648471)))

(assert (=> b!1139741 (= res!760054 (bvsgt from!1455 i!673))))

(assert (=> b!1139741 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507323 () Unit!37360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74117 (_ BitVec 64) (_ BitVec 32)) Unit!37360)

(assert (=> b!1139741 (= lt!507323 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139742 () Bool)

(assert (=> b!1139742 (= e!648464 (and e!648459 mapRes!44768))))

(declare-fun condMapEmpty!44768 () Bool)

(declare-fun mapDefault!44768 () ValueCell!13605)

(assert (=> b!1139742 (= condMapEmpty!44768 (= (arr!35710 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13605)) mapDefault!44768)))))

(assert (= (and start!98494 res!760043) b!1139737))

(assert (= (and b!1139737 res!760052) b!1139714))

(assert (= (and b!1139714 res!760053) b!1139732))

(assert (= (and b!1139732 res!760042) b!1139738))

(assert (= (and b!1139738 res!760050) b!1139725))

(assert (= (and b!1139725 res!760047) b!1139723))

(assert (= (and b!1139723 res!760051) b!1139739))

(assert (= (and b!1139739 res!760044) b!1139734))

(assert (= (and b!1139734 res!760055) b!1139736))

(assert (= (and b!1139736 res!760049) b!1139741))

(assert (= (and b!1139741 (not res!760054)) b!1139716))

(assert (= (and b!1139716 (not res!760045)) b!1139735))

(assert (= (and b!1139735 c!111749) b!1139728))

(assert (= (and b!1139735 (not c!111749)) b!1139721))

(assert (= (or b!1139728 b!1139721) bm!50733))

(assert (= (or b!1139728 b!1139721) bm!50727))

(assert (= (and b!1139735 (not res!760048)) b!1139715))

(assert (= (and b!1139715 c!111752) b!1139722))

(assert (= (and b!1139715 (not c!111752)) b!1139729))

(assert (= (and b!1139722 c!111753) b!1139718))

(assert (= (and b!1139722 (not c!111753)) b!1139730))

(assert (= (and b!1139730 c!111750) b!1139733))

(assert (= (and b!1139730 (not c!111750)) b!1139719))

(assert (= (and b!1139719 c!111754) b!1139731))

(assert (= (and b!1139719 (not c!111754)) b!1139726))

(assert (= (or b!1139733 b!1139731) bm!50729))

(assert (= (or b!1139733 b!1139731) bm!50731))

(assert (= (or b!1139733 b!1139731) bm!50734))

(assert (= (or b!1139718 bm!50734) bm!50732))

(assert (= (or b!1139718 bm!50729) bm!50728))

(assert (= (or b!1139718 bm!50731) bm!50730))

(assert (= (and b!1139722 c!111751) b!1139720))

(assert (= (and b!1139722 (not c!111751)) b!1139724))

(assert (= (and b!1139722 res!760046) b!1139727))

(assert (= (and b!1139742 condMapEmpty!44768) mapIsEmpty!44768))

(assert (= (and b!1139742 (not condMapEmpty!44768)) mapNonEmpty!44768))

(get-info :version)

(assert (= (and mapNonEmpty!44768 ((_ is ValueCellFull!13605) mapValue!44768)) b!1139717))

(assert (= (and b!1139742 ((_ is ValueCellFull!13605) mapDefault!44768)) b!1139740))

(assert (= start!98494 b!1139742))

(declare-fun b_lambda!19205 () Bool)

(assert (=> (not b_lambda!19205) (not b!1139716)))

(declare-fun t!36014 () Bool)

(declare-fun tb!8911 () Bool)

(assert (=> (and start!98494 (= defaultEntry!1004 defaultEntry!1004) t!36014) tb!8911))

(declare-fun result!18387 () Bool)

(assert (=> tb!8911 (= result!18387 tp_is_empty!28629)))

(assert (=> b!1139716 t!36014))

(declare-fun b_and!39049 () Bool)

(assert (= b_and!39047 (and (=> t!36014 result!18387) b_and!39049)))

(declare-fun m!1051311 () Bool)

(assert (=> bm!50728 m!1051311))

(declare-fun m!1051313 () Bool)

(assert (=> b!1139718 m!1051313))

(declare-fun m!1051315 () Bool)

(assert (=> b!1139718 m!1051315))

(declare-fun m!1051317 () Bool)

(assert (=> b!1139718 m!1051317))

(declare-fun m!1051319 () Bool)

(assert (=> b!1139722 m!1051319))

(declare-fun m!1051321 () Bool)

(assert (=> b!1139722 m!1051321))

(declare-fun m!1051323 () Bool)

(assert (=> b!1139722 m!1051323))

(declare-fun m!1051325 () Bool)

(assert (=> b!1139722 m!1051325))

(declare-fun m!1051327 () Bool)

(assert (=> b!1139741 m!1051327))

(declare-fun m!1051329 () Bool)

(assert (=> b!1139741 m!1051329))

(declare-fun m!1051331 () Bool)

(assert (=> bm!50732 m!1051331))

(declare-fun m!1051333 () Bool)

(assert (=> b!1139734 m!1051333))

(declare-fun m!1051335 () Bool)

(assert (=> b!1139734 m!1051335))

(declare-fun m!1051337 () Bool)

(assert (=> b!1139723 m!1051337))

(declare-fun m!1051339 () Bool)

(assert (=> b!1139738 m!1051339))

(declare-fun m!1051341 () Bool)

(assert (=> bm!50727 m!1051341))

(assert (=> b!1139715 m!1051341))

(declare-fun m!1051343 () Bool)

(assert (=> b!1139715 m!1051343))

(declare-fun m!1051345 () Bool)

(assert (=> b!1139715 m!1051345))

(declare-fun m!1051347 () Bool)

(assert (=> b!1139715 m!1051347))

(declare-fun m!1051349 () Bool)

(assert (=> b!1139715 m!1051349))

(assert (=> b!1139715 m!1051343))

(declare-fun m!1051351 () Bool)

(assert (=> b!1139715 m!1051351))

(declare-fun m!1051353 () Bool)

(assert (=> b!1139715 m!1051353))

(assert (=> b!1139715 m!1051347))

(declare-fun m!1051355 () Bool)

(assert (=> b!1139715 m!1051355))

(assert (=> b!1139715 m!1051345))

(assert (=> b!1139715 m!1051347))

(declare-fun m!1051357 () Bool)

(assert (=> b!1139737 m!1051357))

(declare-fun m!1051359 () Bool)

(assert (=> b!1139720 m!1051359))

(declare-fun m!1051361 () Bool)

(assert (=> mapNonEmpty!44768 m!1051361))

(assert (=> b!1139735 m!1051347))

(declare-fun m!1051363 () Bool)

(assert (=> b!1139735 m!1051363))

(declare-fun m!1051365 () Bool)

(assert (=> b!1139716 m!1051365))

(declare-fun m!1051367 () Bool)

(assert (=> b!1139716 m!1051367))

(declare-fun m!1051369 () Bool)

(assert (=> b!1139716 m!1051369))

(declare-fun m!1051371 () Bool)

(assert (=> b!1139716 m!1051371))

(declare-fun m!1051373 () Bool)

(assert (=> start!98494 m!1051373))

(declare-fun m!1051375 () Bool)

(assert (=> start!98494 m!1051375))

(declare-fun m!1051377 () Bool)

(assert (=> bm!50730 m!1051377))

(assert (=> b!1139727 m!1051359))

(declare-fun m!1051379 () Bool)

(assert (=> b!1139736 m!1051379))

(declare-fun m!1051381 () Bool)

(assert (=> b!1139728 m!1051381))

(declare-fun m!1051383 () Bool)

(assert (=> b!1139739 m!1051383))

(declare-fun m!1051385 () Bool)

(assert (=> b!1139732 m!1051385))

(declare-fun m!1051387 () Bool)

(assert (=> bm!50733 m!1051387))

(check-sat (not bm!50733) (not b!1139738) (not b!1139722) (not b!1139728) b_and!39049 (not bm!50732) (not b!1139741) (not b!1139723) (not b!1139720) (not b_lambda!19205) (not b!1139734) (not bm!50727) (not b!1139715) (not b!1139716) (not b!1139735) tp_is_empty!28629 (not bm!50730) (not b!1139718) (not bm!50728) (not b!1139736) (not mapNonEmpty!44768) (not b!1139737) (not b_next!24099) (not b!1139727) (not start!98494) (not b!1139732))
(check-sat b_and!39049 (not b_next!24099))
