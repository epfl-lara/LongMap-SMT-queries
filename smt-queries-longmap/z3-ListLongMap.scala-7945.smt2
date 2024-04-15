; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98504 () Bool)

(assert start!98504)

(declare-fun b_free!24115 () Bool)

(declare-fun b_next!24115 () Bool)

(assert (=> start!98504 (= b_free!24115 (not b_next!24115))))

(declare-fun tp!85056 () Bool)

(declare-fun b_and!39057 () Bool)

(assert (=> start!98504 (= tp!85056 b_and!39057)))

(declare-fun bm!50896 () Bool)

(declare-fun call!50902 () Bool)

(declare-fun call!50905 () Bool)

(assert (=> bm!50896 (= call!50902 call!50905)))

(declare-fun b!1140302 () Bool)

(declare-fun res!760321 () Bool)

(declare-fun e!648771 () Bool)

(assert (=> b!1140302 (=> (not res!760321) (not e!648771))))

(declare-datatypes ((array!74072 0))(
  ( (array!74073 (arr!35687 (Array (_ BitVec 32) (_ BitVec 64))) (size!36225 (_ BitVec 32))) )
))
(declare-fun lt!507622 () array!74072)

(declare-datatypes ((List!25010 0))(
  ( (Nil!25007) (Cons!25006 (h!26215 (_ BitVec 64)) (t!36108 List!25010)) )
))
(declare-fun arrayNoDuplicates!0 (array!74072 (_ BitVec 32) List!25010) Bool)

(assert (=> b!1140302 (= res!760321 (arrayNoDuplicates!0 lt!507622 #b00000000000000000000000000000000 Nil!25007))))

(declare-fun b!1140303 () Bool)

(declare-datatypes ((Unit!37243 0))(
  ( (Unit!37244) )
))
(declare-fun e!648766 () Unit!37243)

(declare-fun e!648775 () Unit!37243)

(assert (=> b!1140303 (= e!648766 e!648775)))

(declare-fun c!111867 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!507637 () Bool)

(assert (=> b!1140303 (= c!111867 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507637))))

(declare-fun mapIsEmpty!44792 () Bool)

(declare-fun mapRes!44792 () Bool)

(assert (=> mapIsEmpty!44792 mapRes!44792))

(declare-fun _keys!1208 () array!74072)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1140304 () Bool)

(declare-fun e!648762 () Bool)

(declare-fun arrayContainsKey!0 (array!74072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140304 (= e!648762 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140306 () Bool)

(declare-fun e!648774 () Unit!37243)

(declare-fun Unit!37245 () Unit!37243)

(assert (=> b!1140306 (= e!648774 Unit!37245)))

(assert (=> b!1140306 (= lt!507637 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111871 () Bool)

(assert (=> b!1140306 (= c!111871 (and (not lt!507637) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507626 () Unit!37243)

(declare-fun e!648769 () Unit!37243)

(assert (=> b!1140306 (= lt!507626 e!648769)))

(declare-datatypes ((V!43321 0))(
  ( (V!43322 (val!14379 Int)) )
))
(declare-fun zeroValue!944 () V!43321)

(declare-fun lt!507638 () Unit!37243)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13613 0))(
  ( (ValueCellFull!13613 (v!17015 V!43321)) (EmptyCell!13613) )
))
(declare-datatypes ((array!74074 0))(
  ( (array!74075 (arr!35688 (Array (_ BitVec 32) ValueCell!13613)) (size!36226 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74074)

(declare-fun minValue!944 () V!43321)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!380 (array!74072 array!74074 (_ BitVec 32) (_ BitVec 32) V!43321 V!43321 (_ BitVec 64) (_ BitVec 32) Int) Unit!37243)

(assert (=> b!1140306 (= lt!507638 (lemmaListMapContainsThenArrayContainsFrom!380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111869 () Bool)

(assert (=> b!1140306 (= c!111869 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760318 () Bool)

(assert (=> b!1140306 (= res!760318 e!648762)))

(declare-fun e!648768 () Bool)

(assert (=> b!1140306 (=> (not res!760318) (not e!648768))))

(assert (=> b!1140306 e!648768))

(declare-fun lt!507633 () Unit!37243)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74072 (_ BitVec 32) (_ BitVec 32)) Unit!37243)

(assert (=> b!1140306 (= lt!507633 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140306 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25007)))

(declare-fun lt!507624 () Unit!37243)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74072 (_ BitVec 64) (_ BitVec 32) List!25010) Unit!37243)

(assert (=> b!1140306 (= lt!507624 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25007))))

(assert (=> b!1140306 false))

(declare-fun bm!50897 () Bool)

(declare-fun call!50906 () Unit!37243)

(declare-fun call!50903 () Unit!37243)

(assert (=> bm!50897 (= call!50906 call!50903)))

(declare-fun b!1140307 () Bool)

(declare-fun e!648777 () Bool)

(declare-fun tp_is_empty!28645 () Bool)

(assert (=> b!1140307 (= e!648777 tp_is_empty!28645)))

(declare-fun b!1140308 () Bool)

(declare-fun res!760314 () Bool)

(declare-fun e!648772 () Bool)

(assert (=> b!1140308 (=> (not res!760314) (not e!648772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74072 (_ BitVec 32)) Bool)

(assert (=> b!1140308 (= res!760314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140309 () Bool)

(declare-fun res!760312 () Bool)

(assert (=> b!1140309 (=> (not res!760312) (not e!648772))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140309 (= res!760312 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36225 _keys!1208))))))

(declare-fun b!1140310 () Bool)

(declare-fun lt!507636 () Unit!37243)

(assert (=> b!1140310 (= e!648766 lt!507636)))

(assert (=> b!1140310 (= lt!507636 call!50906)))

(assert (=> b!1140310 call!50902))

(declare-fun b!1140311 () Bool)

(declare-fun Unit!37246 () Unit!37243)

(assert (=> b!1140311 (= e!648775 Unit!37246)))

(declare-fun b!1140312 () Bool)

(declare-fun e!648765 () Bool)

(declare-fun e!648764 () Bool)

(assert (=> b!1140312 (= e!648765 e!648764)))

(declare-fun res!760325 () Bool)

(assert (=> b!1140312 (=> res!760325 e!648764)))

(assert (=> b!1140312 (= res!760325 (not (= (select (arr!35687 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648770 () Bool)

(assert (=> b!1140312 e!648770))

(declare-fun c!111868 () Bool)

(assert (=> b!1140312 (= c!111868 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507639 () Unit!37243)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!504 (array!74072 array!74074 (_ BitVec 32) (_ BitVec 32) V!43321 V!43321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37243)

(assert (=> b!1140312 (= lt!507639 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!18270 0))(
  ( (tuple2!18271 (_1!9146 (_ BitVec 64)) (_2!9146 V!43321)) )
))
(declare-datatypes ((List!25011 0))(
  ( (Nil!25008) (Cons!25007 (h!26216 tuple2!18270) (t!36109 List!25011)) )
))
(declare-datatypes ((ListLongMap!16239 0))(
  ( (ListLongMap!16240 (toList!8135 List!25011)) )
))
(declare-fun call!50899 () ListLongMap!16239)

(declare-fun bm!50898 () Bool)

(declare-fun c!111870 () Bool)

(declare-fun lt!507623 () ListLongMap!16239)

(declare-fun lt!507632 () ListLongMap!16239)

(declare-fun +!3562 (ListLongMap!16239 tuple2!18270) ListLongMap!16239)

(assert (=> bm!50898 (= call!50899 (+!3562 (ite c!111871 lt!507632 lt!507623) (ite c!111871 (tuple2!18271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111870 (tuple2!18271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!50900 () ListLongMap!16239)

(declare-fun bm!50899 () Bool)

(declare-fun contains!6606 (ListLongMap!16239 (_ BitVec 64)) Bool)

(assert (=> bm!50899 (= call!50905 (contains!6606 (ite c!111871 lt!507632 call!50900) k0!934))))

(declare-fun b!1140313 () Bool)

(declare-fun e!648763 () Bool)

(assert (=> b!1140313 (= e!648763 e!648765)))

(declare-fun res!760322 () Bool)

(assert (=> b!1140313 (=> res!760322 e!648765)))

(assert (=> b!1140313 (= res!760322 (not (= from!1455 i!673)))))

(declare-fun lt!507641 () ListLongMap!16239)

(declare-fun lt!507640 () array!74074)

(declare-fun getCurrentListMapNoExtraKeys!4629 (array!74072 array!74074 (_ BitVec 32) (_ BitVec 32) V!43321 V!43321 (_ BitVec 32) Int) ListLongMap!16239)

(assert (=> b!1140313 (= lt!507641 (getCurrentListMapNoExtraKeys!4629 lt!507622 lt!507640 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507629 () V!43321)

(assert (=> b!1140313 (= lt!507640 (array!74075 (store (arr!35688 _values!996) i!673 (ValueCellFull!13613 lt!507629)) (size!36226 _values!996)))))

(declare-fun dynLambda!2613 (Int (_ BitVec 64)) V!43321)

(assert (=> b!1140313 (= lt!507629 (dynLambda!2613 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507628 () ListLongMap!16239)

(assert (=> b!1140313 (= lt!507628 (getCurrentListMapNoExtraKeys!4629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140305 () Bool)

(assert (=> b!1140305 (contains!6606 call!50899 k0!934)))

(declare-fun lt!507625 () Unit!37243)

(declare-fun addStillContains!777 (ListLongMap!16239 (_ BitVec 64) V!43321 (_ BitVec 64)) Unit!37243)

(assert (=> b!1140305 (= lt!507625 (addStillContains!777 lt!507632 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1140305 call!50905))

(assert (=> b!1140305 (= lt!507632 (+!3562 lt!507623 (tuple2!18271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507634 () Unit!37243)

(assert (=> b!1140305 (= lt!507634 call!50903)))

(assert (=> b!1140305 (= e!648769 lt!507625)))

(declare-fun res!760323 () Bool)

(assert (=> start!98504 (=> (not res!760323) (not e!648772))))

(assert (=> start!98504 (= res!760323 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36225 _keys!1208))))))

(assert (=> start!98504 e!648772))

(assert (=> start!98504 tp_is_empty!28645))

(declare-fun array_inv!27426 (array!74072) Bool)

(assert (=> start!98504 (array_inv!27426 _keys!1208)))

(assert (=> start!98504 true))

(assert (=> start!98504 tp!85056))

(declare-fun e!648776 () Bool)

(declare-fun array_inv!27427 (array!74074) Bool)

(assert (=> start!98504 (and (array_inv!27427 _values!996) e!648776)))

(declare-fun b!1140314 () Bool)

(assert (=> b!1140314 call!50902))

(declare-fun lt!507635 () Unit!37243)

(assert (=> b!1140314 (= lt!507635 call!50906)))

(assert (=> b!1140314 (= e!648775 lt!507635)))

(declare-fun bm!50900 () Bool)

(declare-fun call!50901 () ListLongMap!16239)

(assert (=> bm!50900 (= call!50901 (getCurrentListMapNoExtraKeys!4629 (ite c!111868 _keys!1208 lt!507622) (ite c!111868 _values!996 lt!507640) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140315 () Bool)

(assert (=> b!1140315 (= c!111870 (and (not lt!507637) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140315 (= e!648769 e!648766)))

(declare-fun b!1140316 () Bool)

(declare-fun res!760313 () Bool)

(assert (=> b!1140316 (=> (not res!760313) (not e!648772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140316 (= res!760313 (validMask!0 mask!1564))))

(declare-fun bm!50901 () Bool)

(declare-fun call!50904 () ListLongMap!16239)

(assert (=> bm!50901 (= call!50904 (getCurrentListMapNoExtraKeys!4629 (ite c!111868 lt!507622 _keys!1208) (ite c!111868 lt!507640 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140317 () Bool)

(assert (=> b!1140317 (= e!648772 e!648771)))

(declare-fun res!760316 () Bool)

(assert (=> b!1140317 (=> (not res!760316) (not e!648771))))

(assert (=> b!1140317 (= res!760316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507622 mask!1564))))

(assert (=> b!1140317 (= lt!507622 (array!74073 (store (arr!35687 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36225 _keys!1208)))))

(declare-fun b!1140318 () Bool)

(declare-fun -!1222 (ListLongMap!16239 (_ BitVec 64)) ListLongMap!16239)

(assert (=> b!1140318 (= e!648770 (= call!50904 (-!1222 call!50901 k0!934)))))

(declare-fun b!1140319 () Bool)

(declare-fun Unit!37247 () Unit!37243)

(assert (=> b!1140319 (= e!648774 Unit!37247)))

(declare-fun b!1140320 () Bool)

(assert (=> b!1140320 (= e!648771 (not e!648763))))

(declare-fun res!760315 () Bool)

(assert (=> b!1140320 (=> res!760315 e!648763)))

(assert (=> b!1140320 (= res!760315 (bvsgt from!1455 i!673))))

(assert (=> b!1140320 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507627 () Unit!37243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74072 (_ BitVec 64) (_ BitVec 32)) Unit!37243)

(assert (=> b!1140320 (= lt!507627 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140321 () Bool)

(assert (=> b!1140321 (= e!648764 true)))

(declare-fun lt!507642 () V!43321)

(assert (=> b!1140321 (= (-!1222 (+!3562 lt!507623 (tuple2!18271 (select (arr!35687 _keys!1208) from!1455) lt!507642)) (select (arr!35687 _keys!1208) from!1455)) lt!507623)))

(declare-fun lt!507631 () Unit!37243)

(declare-fun addThenRemoveForNewKeyIsSame!89 (ListLongMap!16239 (_ BitVec 64) V!43321) Unit!37243)

(assert (=> b!1140321 (= lt!507631 (addThenRemoveForNewKeyIsSame!89 lt!507623 (select (arr!35687 _keys!1208) from!1455) lt!507642))))

(declare-fun get!18141 (ValueCell!13613 V!43321) V!43321)

(assert (=> b!1140321 (= lt!507642 (get!18141 (select (arr!35688 _values!996) from!1455) lt!507629))))

(declare-fun lt!507630 () Unit!37243)

(assert (=> b!1140321 (= lt!507630 e!648774)))

(declare-fun c!111872 () Bool)

(assert (=> b!1140321 (= c!111872 (contains!6606 lt!507623 k0!934))))

(assert (=> b!1140321 (= lt!507623 (getCurrentListMapNoExtraKeys!4629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140322 () Bool)

(declare-fun e!648767 () Bool)

(assert (=> b!1140322 (= e!648776 (and e!648767 mapRes!44792))))

(declare-fun condMapEmpty!44792 () Bool)

(declare-fun mapDefault!44792 () ValueCell!13613)

(assert (=> b!1140322 (= condMapEmpty!44792 (= (arr!35688 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13613)) mapDefault!44792)))))

(declare-fun bm!50902 () Bool)

(assert (=> bm!50902 (= call!50900 call!50899)))

(declare-fun b!1140323 () Bool)

(declare-fun res!760324 () Bool)

(assert (=> b!1140323 (=> (not res!760324) (not e!648772))))

(assert (=> b!1140323 (= res!760324 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25007))))

(declare-fun b!1140324 () Bool)

(assert (=> b!1140324 (= e!648767 tp_is_empty!28645)))

(declare-fun mapNonEmpty!44792 () Bool)

(declare-fun tp!85055 () Bool)

(assert (=> mapNonEmpty!44792 (= mapRes!44792 (and tp!85055 e!648777))))

(declare-fun mapRest!44792 () (Array (_ BitVec 32) ValueCell!13613))

(declare-fun mapKey!44792 () (_ BitVec 32))

(declare-fun mapValue!44792 () ValueCell!13613)

(assert (=> mapNonEmpty!44792 (= (arr!35688 _values!996) (store mapRest!44792 mapKey!44792 mapValue!44792))))

(declare-fun b!1140325 () Bool)

(declare-fun res!760317 () Bool)

(assert (=> b!1140325 (=> (not res!760317) (not e!648772))))

(assert (=> b!1140325 (= res!760317 (and (= (size!36226 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36225 _keys!1208) (size!36226 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140326 () Bool)

(declare-fun res!760319 () Bool)

(assert (=> b!1140326 (=> (not res!760319) (not e!648772))))

(assert (=> b!1140326 (= res!760319 (= (select (arr!35687 _keys!1208) i!673) k0!934))))

(declare-fun bm!50903 () Bool)

(assert (=> bm!50903 (= call!50903 (addStillContains!777 lt!507623 (ite (or c!111871 c!111870) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111871 c!111870) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1140327 () Bool)

(assert (=> b!1140327 (= e!648762 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507637) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140328 () Bool)

(declare-fun res!760320 () Bool)

(assert (=> b!1140328 (=> (not res!760320) (not e!648772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140328 (= res!760320 (validKeyInArray!0 k0!934))))

(declare-fun b!1140329 () Bool)

(assert (=> b!1140329 (= e!648770 (= call!50901 call!50904))))

(declare-fun b!1140330 () Bool)

(assert (=> b!1140330 (= e!648768 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98504 res!760323) b!1140316))

(assert (= (and b!1140316 res!760313) b!1140325))

(assert (= (and b!1140325 res!760317) b!1140308))

(assert (= (and b!1140308 res!760314) b!1140323))

(assert (= (and b!1140323 res!760324) b!1140309))

(assert (= (and b!1140309 res!760312) b!1140328))

(assert (= (and b!1140328 res!760320) b!1140326))

(assert (= (and b!1140326 res!760319) b!1140317))

(assert (= (and b!1140317 res!760316) b!1140302))

(assert (= (and b!1140302 res!760321) b!1140320))

(assert (= (and b!1140320 (not res!760315)) b!1140313))

(assert (= (and b!1140313 (not res!760322)) b!1140312))

(assert (= (and b!1140312 c!111868) b!1140318))

(assert (= (and b!1140312 (not c!111868)) b!1140329))

(assert (= (or b!1140318 b!1140329) bm!50900))

(assert (= (or b!1140318 b!1140329) bm!50901))

(assert (= (and b!1140312 (not res!760325)) b!1140321))

(assert (= (and b!1140321 c!111872) b!1140306))

(assert (= (and b!1140321 (not c!111872)) b!1140319))

(assert (= (and b!1140306 c!111871) b!1140305))

(assert (= (and b!1140306 (not c!111871)) b!1140315))

(assert (= (and b!1140315 c!111870) b!1140310))

(assert (= (and b!1140315 (not c!111870)) b!1140303))

(assert (= (and b!1140303 c!111867) b!1140314))

(assert (= (and b!1140303 (not c!111867)) b!1140311))

(assert (= (or b!1140310 b!1140314) bm!50897))

(assert (= (or b!1140310 b!1140314) bm!50902))

(assert (= (or b!1140310 b!1140314) bm!50896))

(assert (= (or b!1140305 bm!50896) bm!50899))

(assert (= (or b!1140305 bm!50897) bm!50903))

(assert (= (or b!1140305 bm!50902) bm!50898))

(assert (= (and b!1140306 c!111869) b!1140304))

(assert (= (and b!1140306 (not c!111869)) b!1140327))

(assert (= (and b!1140306 res!760318) b!1140330))

(assert (= (and b!1140322 condMapEmpty!44792) mapIsEmpty!44792))

(assert (= (and b!1140322 (not condMapEmpty!44792)) mapNonEmpty!44792))

(get-info :version)

(assert (= (and mapNonEmpty!44792 ((_ is ValueCellFull!13613) mapValue!44792)) b!1140307))

(assert (= (and b!1140322 ((_ is ValueCellFull!13613) mapDefault!44792)) b!1140324))

(assert (= start!98504 b!1140322))

(declare-fun b_lambda!19203 () Bool)

(assert (=> (not b_lambda!19203) (not b!1140313)))

(declare-fun t!36107 () Bool)

(declare-fun tb!8919 () Bool)

(assert (=> (and start!98504 (= defaultEntry!1004 defaultEntry!1004) t!36107) tb!8919))

(declare-fun result!18411 () Bool)

(assert (=> tb!8919 (= result!18411 tp_is_empty!28645)))

(assert (=> b!1140313 t!36107))

(declare-fun b_and!39059 () Bool)

(assert (= b_and!39057 (and (=> t!36107 result!18411) b_and!39059)))

(declare-fun m!1051337 () Bool)

(assert (=> b!1140304 m!1051337))

(declare-fun m!1051339 () Bool)

(assert (=> b!1140326 m!1051339))

(declare-fun m!1051341 () Bool)

(assert (=> b!1140313 m!1051341))

(declare-fun m!1051343 () Bool)

(assert (=> b!1140313 m!1051343))

(declare-fun m!1051345 () Bool)

(assert (=> b!1140313 m!1051345))

(declare-fun m!1051347 () Bool)

(assert (=> b!1140313 m!1051347))

(declare-fun m!1051349 () Bool)

(assert (=> b!1140318 m!1051349))

(declare-fun m!1051351 () Bool)

(assert (=> b!1140305 m!1051351))

(declare-fun m!1051353 () Bool)

(assert (=> b!1140305 m!1051353))

(declare-fun m!1051355 () Bool)

(assert (=> b!1140305 m!1051355))

(declare-fun m!1051357 () Bool)

(assert (=> b!1140312 m!1051357))

(declare-fun m!1051359 () Bool)

(assert (=> b!1140312 m!1051359))

(declare-fun m!1051361 () Bool)

(assert (=> mapNonEmpty!44792 m!1051361))

(declare-fun m!1051363 () Bool)

(assert (=> bm!50903 m!1051363))

(declare-fun m!1051365 () Bool)

(assert (=> b!1140317 m!1051365))

(declare-fun m!1051367 () Bool)

(assert (=> b!1140317 m!1051367))

(declare-fun m!1051369 () Bool)

(assert (=> b!1140306 m!1051369))

(declare-fun m!1051371 () Bool)

(assert (=> b!1140306 m!1051371))

(declare-fun m!1051373 () Bool)

(assert (=> b!1140306 m!1051373))

(declare-fun m!1051375 () Bool)

(assert (=> b!1140306 m!1051375))

(declare-fun m!1051377 () Bool)

(assert (=> b!1140302 m!1051377))

(declare-fun m!1051379 () Bool)

(assert (=> b!1140321 m!1051379))

(declare-fun m!1051381 () Bool)

(assert (=> b!1140321 m!1051381))

(declare-fun m!1051383 () Bool)

(assert (=> b!1140321 m!1051383))

(declare-fun m!1051385 () Bool)

(assert (=> b!1140321 m!1051385))

(assert (=> b!1140321 m!1051381))

(declare-fun m!1051387 () Bool)

(assert (=> b!1140321 m!1051387))

(assert (=> b!1140321 m!1051357))

(declare-fun m!1051389 () Bool)

(assert (=> b!1140321 m!1051389))

(assert (=> b!1140321 m!1051385))

(assert (=> b!1140321 m!1051357))

(declare-fun m!1051391 () Bool)

(assert (=> b!1140321 m!1051391))

(assert (=> b!1140321 m!1051357))

(declare-fun m!1051393 () Bool)

(assert (=> bm!50901 m!1051393))

(declare-fun m!1051395 () Bool)

(assert (=> bm!50900 m!1051395))

(declare-fun m!1051397 () Bool)

(assert (=> b!1140320 m!1051397))

(declare-fun m!1051399 () Bool)

(assert (=> b!1140320 m!1051399))

(declare-fun m!1051401 () Bool)

(assert (=> b!1140308 m!1051401))

(declare-fun m!1051403 () Bool)

(assert (=> b!1140316 m!1051403))

(assert (=> b!1140330 m!1051337))

(declare-fun m!1051405 () Bool)

(assert (=> bm!50898 m!1051405))

(declare-fun m!1051407 () Bool)

(assert (=> b!1140323 m!1051407))

(declare-fun m!1051409 () Bool)

(assert (=> b!1140328 m!1051409))

(declare-fun m!1051411 () Bool)

(assert (=> bm!50899 m!1051411))

(declare-fun m!1051413 () Bool)

(assert (=> start!98504 m!1051413))

(declare-fun m!1051415 () Bool)

(assert (=> start!98504 m!1051415))

(check-sat (not b!1140308) tp_is_empty!28645 (not b!1140323) (not b!1140330) (not mapNonEmpty!44792) (not bm!50900) (not bm!50903) (not bm!50898) (not b!1140312) (not b!1140313) (not b!1140316) (not b!1140304) (not b!1140306) (not b!1140328) (not b!1140302) (not b!1140320) b_and!39059 (not b!1140318) (not bm!50901) (not b!1140321) (not start!98504) (not b_lambda!19203) (not bm!50899) (not b!1140305) (not b!1140317) (not b_next!24115))
(check-sat b_and!39059 (not b_next!24115))
