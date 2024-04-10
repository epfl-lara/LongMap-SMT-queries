; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98608 () Bool)

(assert start!98608)

(declare-fun b_free!24213 () Bool)

(declare-fun b_next!24213 () Bool)

(assert (=> start!98608 (= b_free!24213 (not b_next!24213))))

(declare-fun tp!85349 () Bool)

(declare-fun b_and!39275 () Bool)

(assert (=> start!98608 (= tp!85349 b_and!39275)))

(declare-fun b!1144810 () Bool)

(declare-fun e!651218 () Bool)

(declare-fun tp_is_empty!28743 () Bool)

(assert (=> b!1144810 (= e!651218 tp_is_empty!28743)))

(declare-datatypes ((array!74337 0))(
  ( (array!74338 (arr!35819 (Array (_ BitVec 32) (_ BitVec 64))) (size!36355 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43451 0))(
  ( (V!43452 (val!14428 Int)) )
))
(declare-datatypes ((ValueCell!13662 0))(
  ( (ValueCellFull!13662 (v!17065 V!43451)) (EmptyCell!13662) )
))
(declare-datatypes ((array!74339 0))(
  ( (array!74340 (arr!35820 (Array (_ BitVec 32) ValueCell!13662)) (size!36356 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74339)

(declare-fun minValue!944 () V!43451)

(declare-fun bm!52095 () Bool)

(declare-datatypes ((tuple2!18270 0))(
  ( (tuple2!18271 (_1!9146 (_ BitVec 64)) (_2!9146 V!43451)) )
))
(declare-datatypes ((List!25024 0))(
  ( (Nil!25021) (Cons!25020 (h!26229 tuple2!18270) (t!36229 List!25024)) )
))
(declare-datatypes ((ListLongMap!16239 0))(
  ( (ListLongMap!16240 (toList!8135 List!25024)) )
))
(declare-fun call!52103 () ListLongMap!16239)

(declare-fun zeroValue!944 () V!43451)

(declare-fun getCurrentListMapNoExtraKeys!4613 (array!74337 array!74339 (_ BitVec 32) (_ BitVec 32) V!43451 V!43451 (_ BitVec 32) Int) ListLongMap!16239)

(assert (=> bm!52095 (= call!52103 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144811 () Bool)

(declare-fun lt!510904 () Bool)

(declare-fun e!651225 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1144811 (= e!651225 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510904) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144812 () Bool)

(declare-fun e!651224 () Bool)

(assert (=> b!1144812 (= e!651224 true)))

(declare-fun e!651220 () Bool)

(assert (=> b!1144812 e!651220))

(declare-fun res!762471 () Bool)

(assert (=> b!1144812 (=> (not res!762471) (not e!651220))))

(declare-fun lt!510919 () ListLongMap!16239)

(declare-fun lt!510911 () V!43451)

(declare-fun -!1278 (ListLongMap!16239 (_ BitVec 64)) ListLongMap!16239)

(declare-fun +!3562 (ListLongMap!16239 tuple2!18270) ListLongMap!16239)

(assert (=> b!1144812 (= res!762471 (= (-!1278 (+!3562 lt!510919 (tuple2!18271 (select (arr!35819 _keys!1208) from!1455) lt!510911)) (select (arr!35819 _keys!1208) from!1455)) lt!510919))))

(declare-datatypes ((Unit!37577 0))(
  ( (Unit!37578) )
))
(declare-fun lt!510918 () Unit!37577)

(declare-fun addThenRemoveForNewKeyIsSame!128 (ListLongMap!16239 (_ BitVec 64) V!43451) Unit!37577)

(assert (=> b!1144812 (= lt!510918 (addThenRemoveForNewKeyIsSame!128 lt!510919 (select (arr!35819 _keys!1208) from!1455) lt!510911))))

(declare-fun lt!510905 () V!43451)

(declare-fun get!18212 (ValueCell!13662 V!43451) V!43451)

(assert (=> b!1144812 (= lt!510911 (get!18212 (select (arr!35820 _values!996) from!1455) lt!510905))))

(declare-fun lt!510913 () Unit!37577)

(declare-fun e!651216 () Unit!37577)

(assert (=> b!1144812 (= lt!510913 e!651216)))

(declare-fun c!112778 () Bool)

(declare-fun contains!6664 (ListLongMap!16239 (_ BitVec 64)) Bool)

(assert (=> b!1144812 (= c!112778 (contains!6664 lt!510919 k0!934))))

(assert (=> b!1144812 (= lt!510919 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144813 () Bool)

(declare-fun e!651229 () Bool)

(assert (=> b!1144813 (= e!651229 e!651224)))

(declare-fun res!762459 () Bool)

(assert (=> b!1144813 (=> res!762459 e!651224)))

(assert (=> b!1144813 (= res!762459 (not (= (select (arr!35819 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651227 () Bool)

(assert (=> b!1144813 e!651227))

(declare-fun c!112779 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144813 (= c!112779 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510907 () Unit!37577)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!519 (array!74337 array!74339 (_ BitVec 32) (_ BitVec 32) V!43451 V!43451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37577)

(assert (=> b!1144813 (= lt!510907 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144815 () Bool)

(declare-fun call!52105 () Bool)

(assert (=> b!1144815 call!52105))

(declare-fun lt!510908 () Unit!37577)

(declare-fun call!52101 () Unit!37577)

(assert (=> b!1144815 (= lt!510908 call!52101)))

(declare-fun e!651219 () Unit!37577)

(assert (=> b!1144815 (= e!651219 lt!510908)))

(declare-fun bm!52096 () Bool)

(declare-fun call!52098 () Bool)

(assert (=> bm!52096 (= call!52105 call!52098)))

(declare-fun c!112777 () Bool)

(declare-fun c!112776 () Bool)

(declare-fun bm!52097 () Bool)

(declare-fun call!52104 () Unit!37577)

(declare-fun lt!510917 () ListLongMap!16239)

(declare-fun addStillContains!817 (ListLongMap!16239 (_ BitVec 64) V!43451 (_ BitVec 64)) Unit!37577)

(assert (=> bm!52097 (= call!52104 (addStillContains!817 (ite c!112777 lt!510917 lt!510919) (ite c!112777 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112776 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112777 minValue!944 (ite c!112776 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!52098 () Bool)

(assert (=> bm!52098 (= call!52101 call!52104)))

(declare-fun b!1144816 () Bool)

(assert (=> b!1144816 (contains!6664 (+!3562 lt!510917 (tuple2!18271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510901 () Unit!37577)

(assert (=> b!1144816 (= lt!510901 call!52104)))

(assert (=> b!1144816 call!52098))

(declare-fun call!52102 () ListLongMap!16239)

(assert (=> b!1144816 (= lt!510917 call!52102)))

(declare-fun lt!510921 () Unit!37577)

(assert (=> b!1144816 (= lt!510921 (addStillContains!817 lt!510919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!651223 () Unit!37577)

(assert (=> b!1144816 (= e!651223 lt!510901)))

(declare-fun b!1144817 () Bool)

(declare-fun res!762466 () Bool)

(declare-fun e!651215 () Bool)

(assert (=> b!1144817 (=> (not res!762466) (not e!651215))))

(assert (=> b!1144817 (= res!762466 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36355 _keys!1208))))))

(declare-fun b!1144818 () Bool)

(declare-fun call!52099 () ListLongMap!16239)

(assert (=> b!1144818 (= e!651227 (= call!52099 call!52103))))

(declare-fun b!1144819 () Bool)

(declare-fun e!651228 () Bool)

(declare-fun arrayContainsKey!0 (array!74337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144819 (= e!651228 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144820 () Bool)

(declare-fun res!762473 () Bool)

(assert (=> b!1144820 (=> (not res!762473) (not e!651215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144820 (= res!762473 (validMask!0 mask!1564))))

(declare-fun b!1144821 () Bool)

(assert (=> b!1144821 (= c!112776 (and (not lt!510904) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651230 () Unit!37577)

(assert (=> b!1144821 (= e!651223 e!651230)))

(declare-fun b!1144822 () Bool)

(declare-fun e!651226 () Bool)

(assert (=> b!1144822 (= e!651215 e!651226)))

(declare-fun res!762465 () Bool)

(assert (=> b!1144822 (=> (not res!762465) (not e!651226))))

(declare-fun lt!510902 () array!74337)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74337 (_ BitVec 32)) Bool)

(assert (=> b!1144822 (= res!762465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510902 mask!1564))))

(assert (=> b!1144822 (= lt!510902 (array!74338 (store (arr!35819 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36355 _keys!1208)))))

(declare-fun b!1144823 () Bool)

(declare-fun e!651221 () Bool)

(declare-fun mapRes!44939 () Bool)

(assert (=> b!1144823 (= e!651221 (and e!651218 mapRes!44939))))

(declare-fun condMapEmpty!44939 () Bool)

(declare-fun mapDefault!44939 () ValueCell!13662)

(assert (=> b!1144823 (= condMapEmpty!44939 (= (arr!35820 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13662)) mapDefault!44939)))))

(declare-fun b!1144824 () Bool)

(declare-fun Unit!37579 () Unit!37577)

(assert (=> b!1144824 (= e!651216 Unit!37579)))

(assert (=> b!1144824 (= lt!510904 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144824 (= c!112777 (and (not lt!510904) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510909 () Unit!37577)

(assert (=> b!1144824 (= lt!510909 e!651223)))

(declare-fun lt!510906 () Unit!37577)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!411 (array!74337 array!74339 (_ BitVec 32) (_ BitVec 32) V!43451 V!43451 (_ BitVec 64) (_ BitVec 32) Int) Unit!37577)

(assert (=> b!1144824 (= lt!510906 (lemmaListMapContainsThenArrayContainsFrom!411 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112780 () Bool)

(assert (=> b!1144824 (= c!112780 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762469 () Bool)

(assert (=> b!1144824 (= res!762469 e!651225)))

(assert (=> b!1144824 (=> (not res!762469) (not e!651228))))

(assert (=> b!1144824 e!651228))

(declare-fun lt!510912 () Unit!37577)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74337 (_ BitVec 32) (_ BitVec 32)) Unit!37577)

(assert (=> b!1144824 (= lt!510912 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25025 0))(
  ( (Nil!25022) (Cons!25021 (h!26230 (_ BitVec 64)) (t!36230 List!25025)) )
))
(declare-fun arrayNoDuplicates!0 (array!74337 (_ BitVec 32) List!25025) Bool)

(assert (=> b!1144824 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25022)))

(declare-fun lt!510914 () Unit!37577)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74337 (_ BitVec 64) (_ BitVec 32) List!25025) Unit!37577)

(assert (=> b!1144824 (= lt!510914 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25022))))

(assert (=> b!1144824 false))

(declare-fun bm!52099 () Bool)

(declare-fun call!52100 () ListLongMap!16239)

(assert (=> bm!52099 (= call!52098 (contains!6664 (ite c!112777 lt!510917 call!52100) k0!934))))

(declare-fun b!1144825 () Bool)

(declare-fun res!762463 () Bool)

(assert (=> b!1144825 (=> (not res!762463) (not e!651215))))

(assert (=> b!1144825 (= res!762463 (and (= (size!36356 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36355 _keys!1208) (size!36356 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1144826 () Bool)

(assert (=> b!1144826 (= e!651230 e!651219)))

(declare-fun c!112775 () Bool)

(assert (=> b!1144826 (= c!112775 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510904))))

(declare-fun b!1144827 () Bool)

(assert (=> b!1144827 (= e!651225 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144828 () Bool)

(declare-fun Unit!37580 () Unit!37577)

(assert (=> b!1144828 (= e!651216 Unit!37580)))

(declare-fun b!1144829 () Bool)

(declare-fun res!762472 () Bool)

(assert (=> b!1144829 (=> (not res!762472) (not e!651215))))

(assert (=> b!1144829 (= res!762472 (= (select (arr!35819 _keys!1208) i!673) k0!934))))

(declare-fun b!1144830 () Bool)

(declare-fun res!762462 () Bool)

(assert (=> b!1144830 (=> (not res!762462) (not e!651226))))

(assert (=> b!1144830 (= res!762462 (arrayNoDuplicates!0 lt!510902 #b00000000000000000000000000000000 Nil!25022))))

(declare-fun b!1144831 () Bool)

(declare-fun res!762470 () Bool)

(assert (=> b!1144831 (=> (not res!762470) (not e!651215))))

(assert (=> b!1144831 (= res!762470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144832 () Bool)

(declare-fun res!762464 () Bool)

(assert (=> b!1144832 (=> (not res!762464) (not e!651215))))

(assert (=> b!1144832 (= res!762464 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25022))))

(declare-fun b!1144833 () Bool)

(declare-fun e!651222 () Bool)

(assert (=> b!1144833 (= e!651226 (not e!651222))))

(declare-fun res!762460 () Bool)

(assert (=> b!1144833 (=> res!762460 e!651222)))

(assert (=> b!1144833 (= res!762460 (bvsgt from!1455 i!673))))

(assert (=> b!1144833 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510910 () Unit!37577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74337 (_ BitVec 64) (_ BitVec 32)) Unit!37577)

(assert (=> b!1144833 (= lt!510910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52100 () Bool)

(assert (=> bm!52100 (= call!52102 (+!3562 lt!510919 (ite (or c!112777 c!112776) (tuple2!18271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1144814 () Bool)

(assert (=> b!1144814 (= e!651227 (= call!52099 (-!1278 call!52103 k0!934)))))

(declare-fun res!762467 () Bool)

(assert (=> start!98608 (=> (not res!762467) (not e!651215))))

(assert (=> start!98608 (= res!762467 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36355 _keys!1208))))))

(assert (=> start!98608 e!651215))

(assert (=> start!98608 tp_is_empty!28743))

(declare-fun array_inv!27442 (array!74337) Bool)

(assert (=> start!98608 (array_inv!27442 _keys!1208)))

(assert (=> start!98608 true))

(assert (=> start!98608 tp!85349))

(declare-fun array_inv!27443 (array!74339) Bool)

(assert (=> start!98608 (and (array_inv!27443 _values!996) e!651221)))

(declare-fun bm!52101 () Bool)

(declare-fun lt!510920 () array!74339)

(assert (=> bm!52101 (= call!52099 (getCurrentListMapNoExtraKeys!4613 lt!510902 lt!510920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144834 () Bool)

(declare-fun res!762468 () Bool)

(assert (=> b!1144834 (=> (not res!762468) (not e!651215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144834 (= res!762468 (validKeyInArray!0 k0!934))))

(declare-fun b!1144835 () Bool)

(assert (=> b!1144835 (= e!651222 e!651229)))

(declare-fun res!762461 () Bool)

(assert (=> b!1144835 (=> res!762461 e!651229)))

(assert (=> b!1144835 (= res!762461 (not (= from!1455 i!673)))))

(declare-fun lt!510916 () ListLongMap!16239)

(assert (=> b!1144835 (= lt!510916 (getCurrentListMapNoExtraKeys!4613 lt!510902 lt!510920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144835 (= lt!510920 (array!74340 (store (arr!35820 _values!996) i!673 (ValueCellFull!13662 lt!510905)) (size!36356 _values!996)))))

(declare-fun dynLambda!2650 (Int (_ BitVec 64)) V!43451)

(assert (=> b!1144835 (= lt!510905 (dynLambda!2650 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510903 () ListLongMap!16239)

(assert (=> b!1144835 (= lt!510903 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52102 () Bool)

(assert (=> bm!52102 (= call!52100 call!52102)))

(declare-fun b!1144836 () Bool)

(declare-fun e!651217 () Bool)

(assert (=> b!1144836 (= e!651217 tp_is_empty!28743)))

(declare-fun mapNonEmpty!44939 () Bool)

(declare-fun tp!85350 () Bool)

(assert (=> mapNonEmpty!44939 (= mapRes!44939 (and tp!85350 e!651217))))

(declare-fun mapKey!44939 () (_ BitVec 32))

(declare-fun mapValue!44939 () ValueCell!13662)

(declare-fun mapRest!44939 () (Array (_ BitVec 32) ValueCell!13662))

(assert (=> mapNonEmpty!44939 (= (arr!35820 _values!996) (store mapRest!44939 mapKey!44939 mapValue!44939))))

(declare-fun b!1144837 () Bool)

(assert (=> b!1144837 (= e!651220 (= (-!1278 lt!510903 k0!934) lt!510919))))

(declare-fun b!1144838 () Bool)

(declare-fun Unit!37581 () Unit!37577)

(assert (=> b!1144838 (= e!651219 Unit!37581)))

(declare-fun b!1144839 () Bool)

(declare-fun lt!510915 () Unit!37577)

(assert (=> b!1144839 (= e!651230 lt!510915)))

(assert (=> b!1144839 (= lt!510915 call!52101)))

(assert (=> b!1144839 call!52105))

(declare-fun mapIsEmpty!44939 () Bool)

(assert (=> mapIsEmpty!44939 mapRes!44939))

(assert (= (and start!98608 res!762467) b!1144820))

(assert (= (and b!1144820 res!762473) b!1144825))

(assert (= (and b!1144825 res!762463) b!1144831))

(assert (= (and b!1144831 res!762470) b!1144832))

(assert (= (and b!1144832 res!762464) b!1144817))

(assert (= (and b!1144817 res!762466) b!1144834))

(assert (= (and b!1144834 res!762468) b!1144829))

(assert (= (and b!1144829 res!762472) b!1144822))

(assert (= (and b!1144822 res!762465) b!1144830))

(assert (= (and b!1144830 res!762462) b!1144833))

(assert (= (and b!1144833 (not res!762460)) b!1144835))

(assert (= (and b!1144835 (not res!762461)) b!1144813))

(assert (= (and b!1144813 c!112779) b!1144814))

(assert (= (and b!1144813 (not c!112779)) b!1144818))

(assert (= (or b!1144814 b!1144818) bm!52101))

(assert (= (or b!1144814 b!1144818) bm!52095))

(assert (= (and b!1144813 (not res!762459)) b!1144812))

(assert (= (and b!1144812 c!112778) b!1144824))

(assert (= (and b!1144812 (not c!112778)) b!1144828))

(assert (= (and b!1144824 c!112777) b!1144816))

(assert (= (and b!1144824 (not c!112777)) b!1144821))

(assert (= (and b!1144821 c!112776) b!1144839))

(assert (= (and b!1144821 (not c!112776)) b!1144826))

(assert (= (and b!1144826 c!112775) b!1144815))

(assert (= (and b!1144826 (not c!112775)) b!1144838))

(assert (= (or b!1144839 b!1144815) bm!52098))

(assert (= (or b!1144839 b!1144815) bm!52102))

(assert (= (or b!1144839 b!1144815) bm!52096))

(assert (= (or b!1144816 bm!52096) bm!52099))

(assert (= (or b!1144816 bm!52098) bm!52097))

(assert (= (or b!1144816 bm!52102) bm!52100))

(assert (= (and b!1144824 c!112780) b!1144827))

(assert (= (and b!1144824 (not c!112780)) b!1144811))

(assert (= (and b!1144824 res!762469) b!1144819))

(assert (= (and b!1144812 res!762471) b!1144837))

(assert (= (and b!1144823 condMapEmpty!44939) mapIsEmpty!44939))

(assert (= (and b!1144823 (not condMapEmpty!44939)) mapNonEmpty!44939))

(get-info :version)

(assert (= (and mapNonEmpty!44939 ((_ is ValueCellFull!13662) mapValue!44939)) b!1144836))

(assert (= (and b!1144823 ((_ is ValueCellFull!13662) mapDefault!44939)) b!1144810))

(assert (= start!98608 b!1144823))

(declare-fun b_lambda!19319 () Bool)

(assert (=> (not b_lambda!19319) (not b!1144835)))

(declare-fun t!36228 () Bool)

(declare-fun tb!9025 () Bool)

(assert (=> (and start!98608 (= defaultEntry!1004 defaultEntry!1004) t!36228) tb!9025))

(declare-fun result!18615 () Bool)

(assert (=> tb!9025 (= result!18615 tp_is_empty!28743)))

(assert (=> b!1144835 t!36228))

(declare-fun b_and!39277 () Bool)

(assert (= b_and!39275 (and (=> t!36228 result!18615) b_and!39277)))

(declare-fun m!1055779 () Bool)

(assert (=> b!1144824 m!1055779))

(declare-fun m!1055781 () Bool)

(assert (=> b!1144824 m!1055781))

(declare-fun m!1055783 () Bool)

(assert (=> b!1144824 m!1055783))

(declare-fun m!1055785 () Bool)

(assert (=> b!1144824 m!1055785))

(declare-fun m!1055787 () Bool)

(assert (=> b!1144813 m!1055787))

(declare-fun m!1055789 () Bool)

(assert (=> b!1144813 m!1055789))

(declare-fun m!1055791 () Bool)

(assert (=> b!1144827 m!1055791))

(declare-fun m!1055793 () Bool)

(assert (=> bm!52100 m!1055793))

(declare-fun m!1055795 () Bool)

(assert (=> b!1144830 m!1055795))

(declare-fun m!1055797 () Bool)

(assert (=> bm!52101 m!1055797))

(declare-fun m!1055799 () Bool)

(assert (=> b!1144834 m!1055799))

(declare-fun m!1055801 () Bool)

(assert (=> b!1144833 m!1055801))

(declare-fun m!1055803 () Bool)

(assert (=> b!1144833 m!1055803))

(declare-fun m!1055805 () Bool)

(assert (=> b!1144832 m!1055805))

(declare-fun m!1055807 () Bool)

(assert (=> b!1144831 m!1055807))

(declare-fun m!1055809 () Bool)

(assert (=> b!1144837 m!1055809))

(declare-fun m!1055811 () Bool)

(assert (=> b!1144820 m!1055811))

(declare-fun m!1055813 () Bool)

(assert (=> b!1144814 m!1055813))

(declare-fun m!1055815 () Bool)

(assert (=> bm!52097 m!1055815))

(declare-fun m!1055817 () Bool)

(assert (=> b!1144829 m!1055817))

(declare-fun m!1055819 () Bool)

(assert (=> b!1144812 m!1055819))

(assert (=> b!1144812 m!1055787))

(declare-fun m!1055821 () Bool)

(assert (=> b!1144812 m!1055821))

(declare-fun m!1055823 () Bool)

(assert (=> b!1144812 m!1055823))

(assert (=> b!1144812 m!1055819))

(assert (=> b!1144812 m!1055787))

(declare-fun m!1055825 () Bool)

(assert (=> b!1144812 m!1055825))

(declare-fun m!1055827 () Bool)

(assert (=> b!1144812 m!1055827))

(assert (=> b!1144812 m!1055787))

(declare-fun m!1055829 () Bool)

(assert (=> b!1144812 m!1055829))

(assert (=> b!1144812 m!1055823))

(declare-fun m!1055831 () Bool)

(assert (=> b!1144812 m!1055831))

(declare-fun m!1055833 () Bool)

(assert (=> bm!52099 m!1055833))

(declare-fun m!1055835 () Bool)

(assert (=> b!1144835 m!1055835))

(declare-fun m!1055837 () Bool)

(assert (=> b!1144835 m!1055837))

(declare-fun m!1055839 () Bool)

(assert (=> b!1144835 m!1055839))

(declare-fun m!1055841 () Bool)

(assert (=> b!1144835 m!1055841))

(declare-fun m!1055843 () Bool)

(assert (=> mapNonEmpty!44939 m!1055843))

(declare-fun m!1055845 () Bool)

(assert (=> b!1144816 m!1055845))

(assert (=> b!1144816 m!1055845))

(declare-fun m!1055847 () Bool)

(assert (=> b!1144816 m!1055847))

(declare-fun m!1055849 () Bool)

(assert (=> b!1144816 m!1055849))

(assert (=> b!1144819 m!1055791))

(assert (=> bm!52095 m!1055829))

(declare-fun m!1055851 () Bool)

(assert (=> start!98608 m!1055851))

(declare-fun m!1055853 () Bool)

(assert (=> start!98608 m!1055853))

(declare-fun m!1055855 () Bool)

(assert (=> b!1144822 m!1055855))

(declare-fun m!1055857 () Bool)

(assert (=> b!1144822 m!1055857))

(check-sat (not b!1144835) (not b!1144820) (not b!1144831) (not b!1144816) (not b_lambda!19319) (not b!1144822) (not bm!52101) (not b!1144813) (not b!1144832) (not bm!52097) tp_is_empty!28743 (not b!1144824) (not b!1144812) (not b!1144814) (not b!1144827) b_and!39277 (not bm!52095) (not mapNonEmpty!44939) (not bm!52099) (not b!1144819) (not start!98608) (not b!1144830) (not b!1144833) (not b!1144834) (not b!1144837) (not bm!52100) (not b_next!24213))
(check-sat b_and!39277 (not b_next!24213))
