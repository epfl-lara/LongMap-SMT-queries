; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101378 () Bool)

(assert start!101378)

(declare-fun b_free!26065 () Bool)

(declare-fun b_next!26065 () Bool)

(assert (=> start!101378 (= b_free!26065 (not b_next!26065))))

(declare-fun tp!91216 () Bool)

(declare-fun b_and!43249 () Bool)

(assert (=> start!101378 (= tp!91216 b_and!43249)))

(declare-fun bm!60325 () Bool)

(declare-datatypes ((V!46153 0))(
  ( (V!46154 (val!15441 Int)) )
))
(declare-datatypes ((tuple2!19856 0))(
  ( (tuple2!19857 (_1!9939 (_ BitVec 64)) (_2!9939 V!46153)) )
))
(declare-datatypes ((List!26658 0))(
  ( (Nil!26655) (Cons!26654 (h!27872 tuple2!19856) (t!39695 List!26658)) )
))
(declare-datatypes ((ListLongMap!17833 0))(
  ( (ListLongMap!17834 (toList!8932 List!26658)) )
))
(declare-fun call!60333 () ListLongMap!17833)

(declare-fun call!60328 () ListLongMap!17833)

(assert (=> bm!60325 (= call!60333 call!60328)))

(declare-fun b!1214303 () Bool)

(declare-datatypes ((Unit!40184 0))(
  ( (Unit!40185) )
))
(declare-fun e!689725 () Unit!40184)

(declare-fun Unit!40186 () Unit!40184)

(assert (=> b!1214303 (= e!689725 Unit!40186)))

(declare-fun zeroValue!944 () V!46153)

(declare-datatypes ((ValueCell!14675 0))(
  ( (ValueCellFull!14675 (v!18090 V!46153)) (EmptyCell!14675) )
))
(declare-datatypes ((array!78359 0))(
  ( (array!78360 (arr!37808 (Array (_ BitVec 32) ValueCell!14675)) (size!38345 (_ BitVec 32))) )
))
(declare-fun lt!551864 () array!78359)

(declare-datatypes ((array!78361 0))(
  ( (array!78362 (arr!37809 (Array (_ BitVec 32) (_ BitVec 64))) (size!38346 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78361)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!60326 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!78359)

(declare-fun call!60331 () ListLongMap!17833)

(declare-fun minValue!944 () V!46153)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun c!120194 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!551865 () array!78361)

(declare-fun getCurrentListMapNoExtraKeys!5391 (array!78361 array!78359 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 32) Int) ListLongMap!17833)

(assert (=> bm!60326 (= call!60331 (getCurrentListMapNoExtraKeys!5391 (ite c!120194 lt!551865 _keys!1208) (ite c!120194 lt!551864 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214304 () Bool)

(declare-fun res!806045 () Bool)

(declare-fun e!689729 () Bool)

(assert (=> b!1214304 (=> (not res!806045) (not e!689729))))

(assert (=> b!1214304 (= res!806045 (and (= (size!38345 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38346 _keys!1208) (size!38345 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!551852 () ListLongMap!17833)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!60327 () Bool)

(declare-fun lt!551857 () ListLongMap!17833)

(declare-fun call!60335 () Unit!40184)

(declare-fun c!120192 () Bool)

(declare-fun c!120190 () Bool)

(declare-fun addStillContains!1072 (ListLongMap!17833 (_ BitVec 64) V!46153 (_ BitVec 64)) Unit!40184)

(assert (=> bm!60327 (= call!60335 (addStillContains!1072 (ite c!120190 lt!551852 lt!551857) (ite c!120190 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120192 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120190 minValue!944 (ite c!120192 zeroValue!944 minValue!944)) k0!934))))

(declare-fun e!689731 () Bool)

(declare-fun b!1214305 () Bool)

(declare-fun arrayContainsKey!0 (array!78361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214305 (= e!689731 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60328 () Bool)

(declare-fun call!60330 () Bool)

(declare-fun call!60332 () Bool)

(assert (=> bm!60328 (= call!60330 call!60332)))

(declare-fun b!1214306 () Bool)

(declare-fun e!689722 () Bool)

(assert (=> b!1214306 (= e!689722 true)))

(declare-fun e!689717 () Bool)

(assert (=> b!1214306 e!689717))

(declare-fun res!806044 () Bool)

(assert (=> b!1214306 (=> (not res!806044) (not e!689717))))

(declare-fun lt!551867 () ListLongMap!17833)

(assert (=> b!1214306 (= res!806044 (= lt!551867 lt!551857))))

(declare-fun lt!551853 () ListLongMap!17833)

(declare-fun -!1858 (ListLongMap!17833 (_ BitVec 64)) ListLongMap!17833)

(assert (=> b!1214306 (= lt!551867 (-!1858 lt!551853 k0!934))))

(declare-fun lt!551847 () V!46153)

(declare-fun +!4089 (ListLongMap!17833 tuple2!19856) ListLongMap!17833)

(assert (=> b!1214306 (= (-!1858 (+!4089 lt!551857 (tuple2!19857 (select (arr!37809 _keys!1208) from!1455) lt!551847)) (select (arr!37809 _keys!1208) from!1455)) lt!551857)))

(declare-fun lt!551860 () Unit!40184)

(declare-fun addThenRemoveForNewKeyIsSame!284 (ListLongMap!17833 (_ BitVec 64) V!46153) Unit!40184)

(assert (=> b!1214306 (= lt!551860 (addThenRemoveForNewKeyIsSame!284 lt!551857 (select (arr!37809 _keys!1208) from!1455) lt!551847))))

(declare-fun lt!551854 () V!46153)

(declare-fun get!19319 (ValueCell!14675 V!46153) V!46153)

(assert (=> b!1214306 (= lt!551847 (get!19319 (select (arr!37808 _values!996) from!1455) lt!551854))))

(declare-fun lt!551849 () Unit!40184)

(declare-fun e!689718 () Unit!40184)

(assert (=> b!1214306 (= lt!551849 e!689718)))

(declare-fun c!120193 () Bool)

(declare-fun contains!7028 (ListLongMap!17833 (_ BitVec 64)) Bool)

(assert (=> b!1214306 (= c!120193 (contains!7028 lt!551857 k0!934))))

(assert (=> b!1214306 (= lt!551857 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214307 () Bool)

(declare-fun res!806043 () Bool)

(assert (=> b!1214307 (=> (not res!806043) (not e!689729))))

(declare-datatypes ((List!26659 0))(
  ( (Nil!26656) (Cons!26655 (h!27873 (_ BitVec 64)) (t!39696 List!26659)) )
))
(declare-fun arrayNoDuplicates!0 (array!78361 (_ BitVec 32) List!26659) Bool)

(assert (=> b!1214307 (= res!806043 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26656))))

(declare-fun res!806048 () Bool)

(assert (=> start!101378 (=> (not res!806048) (not e!689729))))

(assert (=> start!101378 (= res!806048 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38346 _keys!1208))))))

(assert (=> start!101378 e!689729))

(declare-fun tp_is_empty!30769 () Bool)

(assert (=> start!101378 tp_is_empty!30769))

(declare-fun array_inv!28858 (array!78361) Bool)

(assert (=> start!101378 (array_inv!28858 _keys!1208)))

(assert (=> start!101378 true))

(assert (=> start!101378 tp!91216))

(declare-fun e!689730 () Bool)

(declare-fun array_inv!28859 (array!78359) Bool)

(assert (=> start!101378 (and (array_inv!28859 _values!996) e!689730)))

(declare-fun b!1214308 () Bool)

(declare-fun e!689720 () Bool)

(declare-fun mapRes!48028 () Bool)

(assert (=> b!1214308 (= e!689730 (and e!689720 mapRes!48028))))

(declare-fun condMapEmpty!48028 () Bool)

(declare-fun mapDefault!48028 () ValueCell!14675)

(assert (=> b!1214308 (= condMapEmpty!48028 (= (arr!37808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14675)) mapDefault!48028)))))

(declare-fun b!1214309 () Bool)

(declare-fun res!806049 () Bool)

(assert (=> b!1214309 (=> (not res!806049) (not e!689729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78361 (_ BitVec 32)) Bool)

(assert (=> b!1214309 (= res!806049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214310 () Bool)

(declare-fun res!806046 () Bool)

(assert (=> b!1214310 (=> (not res!806046) (not e!689729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214310 (= res!806046 (validMask!0 mask!1564))))

(declare-fun b!1214311 () Bool)

(declare-fun e!689721 () Bool)

(declare-fun e!689723 () Bool)

(assert (=> b!1214311 (= e!689721 e!689723)))

(declare-fun res!806040 () Bool)

(assert (=> b!1214311 (=> res!806040 e!689723)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214311 (= res!806040 (not (= from!1455 i!673)))))

(declare-fun lt!551866 () ListLongMap!17833)

(assert (=> b!1214311 (= lt!551866 (getCurrentListMapNoExtraKeys!5391 lt!551865 lt!551864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1214311 (= lt!551864 (array!78360 (store (arr!37808 _values!996) i!673 (ValueCellFull!14675 lt!551854)) (size!38345 _values!996)))))

(declare-fun dynLambda!3305 (Int (_ BitVec 64)) V!46153)

(assert (=> b!1214311 (= lt!551854 (dynLambda!3305 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1214311 (= lt!551853 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214312 () Bool)

(declare-fun e!689728 () Bool)

(assert (=> b!1214312 (= e!689728 tp_is_empty!30769)))

(declare-fun b!1214313 () Bool)

(declare-fun lt!551851 () Bool)

(assert (=> b!1214313 (= c!120192 (and (not lt!551851) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!689719 () Unit!40184)

(declare-fun e!689716 () Unit!40184)

(assert (=> b!1214313 (= e!689719 e!689716)))

(declare-fun b!1214314 () Bool)

(assert (=> b!1214314 (= e!689731 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551851) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!689724 () Bool)

(declare-fun b!1214315 () Bool)

(assert (=> b!1214315 (= e!689724 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214316 () Bool)

(assert (=> b!1214316 (= e!689717 (= lt!551867 (getCurrentListMapNoExtraKeys!5391 lt!551865 lt!551864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1214317 () Bool)

(declare-fun res!806047 () Bool)

(assert (=> b!1214317 (=> (not res!806047) (not e!689729))))

(assert (=> b!1214317 (= res!806047 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38346 _keys!1208))))))

(declare-fun bm!60329 () Bool)

(assert (=> bm!60329 (= call!60332 (contains!7028 (ite c!120190 lt!551852 call!60333) k0!934))))

(declare-fun b!1214318 () Bool)

(declare-fun e!689715 () Bool)

(declare-fun call!60334 () ListLongMap!17833)

(assert (=> b!1214318 (= e!689715 (= call!60334 call!60331))))

(declare-fun bm!60330 () Bool)

(assert (=> bm!60330 (= call!60334 (getCurrentListMapNoExtraKeys!5391 (ite c!120194 _keys!1208 lt!551865) (ite c!120194 _values!996 lt!551864) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214319 () Bool)

(assert (=> b!1214319 (= e!689720 tp_is_empty!30769)))

(declare-fun b!1214320 () Bool)

(assert (=> b!1214320 (= e!689716 e!689725)))

(declare-fun c!120189 () Bool)

(assert (=> b!1214320 (= c!120189 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551851))))

(declare-fun b!1214321 () Bool)

(declare-fun Unit!40187 () Unit!40184)

(assert (=> b!1214321 (= e!689718 Unit!40187)))

(assert (=> b!1214321 (= lt!551851 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1214321 (= c!120190 (and (not lt!551851) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551859 () Unit!40184)

(assert (=> b!1214321 (= lt!551859 e!689719)))

(declare-fun lt!551862 () Unit!40184)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!619 (array!78361 array!78359 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 64) (_ BitVec 32) Int) Unit!40184)

(assert (=> b!1214321 (= lt!551862 (lemmaListMapContainsThenArrayContainsFrom!619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120191 () Bool)

(assert (=> b!1214321 (= c!120191 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806036 () Bool)

(assert (=> b!1214321 (= res!806036 e!689731)))

(assert (=> b!1214321 (=> (not res!806036) (not e!689724))))

(assert (=> b!1214321 e!689724))

(declare-fun lt!551850 () Unit!40184)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78361 (_ BitVec 32) (_ BitVec 32)) Unit!40184)

(assert (=> b!1214321 (= lt!551850 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1214321 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26656)))

(declare-fun lt!551858 () Unit!40184)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78361 (_ BitVec 64) (_ BitVec 32) List!26659) Unit!40184)

(assert (=> b!1214321 (= lt!551858 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26656))))

(assert (=> b!1214321 false))

(declare-fun b!1214322 () Bool)

(assert (=> b!1214322 (contains!7028 (+!4089 lt!551852 (tuple2!19857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!551863 () Unit!40184)

(assert (=> b!1214322 (= lt!551863 call!60335)))

(assert (=> b!1214322 call!60332))

(assert (=> b!1214322 (= lt!551852 call!60328)))

(declare-fun lt!551855 () Unit!40184)

(assert (=> b!1214322 (= lt!551855 (addStillContains!1072 lt!551857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1214322 (= e!689719 lt!551863)))

(declare-fun bm!60331 () Bool)

(declare-fun call!60329 () Unit!40184)

(assert (=> bm!60331 (= call!60329 call!60335)))

(declare-fun b!1214323 () Bool)

(declare-fun e!689727 () Bool)

(assert (=> b!1214323 (= e!689727 (not e!689721))))

(declare-fun res!806041 () Bool)

(assert (=> b!1214323 (=> res!806041 e!689721)))

(assert (=> b!1214323 (= res!806041 (bvsgt from!1455 i!673))))

(assert (=> b!1214323 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551861 () Unit!40184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78361 (_ BitVec 64) (_ BitVec 32)) Unit!40184)

(assert (=> b!1214323 (= lt!551861 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214324 () Bool)

(declare-fun res!806038 () Bool)

(assert (=> b!1214324 (=> (not res!806038) (not e!689729))))

(assert (=> b!1214324 (= res!806038 (= (select (arr!37809 _keys!1208) i!673) k0!934))))

(declare-fun b!1214325 () Bool)

(assert (=> b!1214325 (= e!689723 e!689722)))

(declare-fun res!806050 () Bool)

(assert (=> b!1214325 (=> res!806050 e!689722)))

(assert (=> b!1214325 (= res!806050 (not (= (select (arr!37809 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1214325 e!689715))

(assert (=> b!1214325 (= c!120194 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551856 () Unit!40184)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1072 (array!78361 array!78359 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40184)

(assert (=> b!1214325 (= lt!551856 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214326 () Bool)

(declare-fun lt!551848 () Unit!40184)

(assert (=> b!1214326 (= e!689716 lt!551848)))

(assert (=> b!1214326 (= lt!551848 call!60329)))

(assert (=> b!1214326 call!60330))

(declare-fun mapIsEmpty!48028 () Bool)

(assert (=> mapIsEmpty!48028 mapRes!48028))

(declare-fun b!1214327 () Bool)

(declare-fun res!806037 () Bool)

(assert (=> b!1214327 (=> (not res!806037) (not e!689729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214327 (= res!806037 (validKeyInArray!0 k0!934))))

(declare-fun b!1214328 () Bool)

(assert (=> b!1214328 call!60330))

(declare-fun lt!551868 () Unit!40184)

(assert (=> b!1214328 (= lt!551868 call!60329)))

(assert (=> b!1214328 (= e!689725 lt!551868)))

(declare-fun b!1214329 () Bool)

(assert (=> b!1214329 (= e!689729 e!689727)))

(declare-fun res!806039 () Bool)

(assert (=> b!1214329 (=> (not res!806039) (not e!689727))))

(assert (=> b!1214329 (= res!806039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551865 mask!1564))))

(assert (=> b!1214329 (= lt!551865 (array!78362 (store (arr!37809 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38346 _keys!1208)))))

(declare-fun mapNonEmpty!48028 () Bool)

(declare-fun tp!91217 () Bool)

(assert (=> mapNonEmpty!48028 (= mapRes!48028 (and tp!91217 e!689728))))

(declare-fun mapKey!48028 () (_ BitVec 32))

(declare-fun mapValue!48028 () ValueCell!14675)

(declare-fun mapRest!48028 () (Array (_ BitVec 32) ValueCell!14675))

(assert (=> mapNonEmpty!48028 (= (arr!37808 _values!996) (store mapRest!48028 mapKey!48028 mapValue!48028))))

(declare-fun bm!60332 () Bool)

(assert (=> bm!60332 (= call!60328 (+!4089 lt!551857 (ite (or c!120190 c!120192) (tuple2!19857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1214330 () Bool)

(declare-fun res!806042 () Bool)

(assert (=> b!1214330 (=> (not res!806042) (not e!689727))))

(assert (=> b!1214330 (= res!806042 (arrayNoDuplicates!0 lt!551865 #b00000000000000000000000000000000 Nil!26656))))

(declare-fun b!1214331 () Bool)

(assert (=> b!1214331 (= e!689715 (= call!60331 (-!1858 call!60334 k0!934)))))

(declare-fun b!1214332 () Bool)

(declare-fun Unit!40188 () Unit!40184)

(assert (=> b!1214332 (= e!689718 Unit!40188)))

(assert (= (and start!101378 res!806048) b!1214310))

(assert (= (and b!1214310 res!806046) b!1214304))

(assert (= (and b!1214304 res!806045) b!1214309))

(assert (= (and b!1214309 res!806049) b!1214307))

(assert (= (and b!1214307 res!806043) b!1214317))

(assert (= (and b!1214317 res!806047) b!1214327))

(assert (= (and b!1214327 res!806037) b!1214324))

(assert (= (and b!1214324 res!806038) b!1214329))

(assert (= (and b!1214329 res!806039) b!1214330))

(assert (= (and b!1214330 res!806042) b!1214323))

(assert (= (and b!1214323 (not res!806041)) b!1214311))

(assert (= (and b!1214311 (not res!806040)) b!1214325))

(assert (= (and b!1214325 c!120194) b!1214331))

(assert (= (and b!1214325 (not c!120194)) b!1214318))

(assert (= (or b!1214331 b!1214318) bm!60330))

(assert (= (or b!1214331 b!1214318) bm!60326))

(assert (= (and b!1214325 (not res!806050)) b!1214306))

(assert (= (and b!1214306 c!120193) b!1214321))

(assert (= (and b!1214306 (not c!120193)) b!1214332))

(assert (= (and b!1214321 c!120190) b!1214322))

(assert (= (and b!1214321 (not c!120190)) b!1214313))

(assert (= (and b!1214313 c!120192) b!1214326))

(assert (= (and b!1214313 (not c!120192)) b!1214320))

(assert (= (and b!1214320 c!120189) b!1214328))

(assert (= (and b!1214320 (not c!120189)) b!1214303))

(assert (= (or b!1214326 b!1214328) bm!60331))

(assert (= (or b!1214326 b!1214328) bm!60325))

(assert (= (or b!1214326 b!1214328) bm!60328))

(assert (= (or b!1214322 bm!60328) bm!60329))

(assert (= (or b!1214322 bm!60331) bm!60327))

(assert (= (or b!1214322 bm!60325) bm!60332))

(assert (= (and b!1214321 c!120191) b!1214305))

(assert (= (and b!1214321 (not c!120191)) b!1214314))

(assert (= (and b!1214321 res!806036) b!1214315))

(assert (= (and b!1214306 res!806044) b!1214316))

(assert (= (and b!1214308 condMapEmpty!48028) mapIsEmpty!48028))

(assert (= (and b!1214308 (not condMapEmpty!48028)) mapNonEmpty!48028))

(get-info :version)

(assert (= (and mapNonEmpty!48028 ((_ is ValueCellFull!14675) mapValue!48028)) b!1214312))

(assert (= (and b!1214308 ((_ is ValueCellFull!14675) mapDefault!48028)) b!1214319))

(assert (= start!101378 b!1214308))

(declare-fun b_lambda!21735 () Bool)

(assert (=> (not b_lambda!21735) (not b!1214311)))

(declare-fun t!39694 () Bool)

(declare-fun tb!10857 () Bool)

(assert (=> (and start!101378 (= defaultEntry!1004 defaultEntry!1004) t!39694) tb!10857))

(declare-fun result!22319 () Bool)

(assert (=> tb!10857 (= result!22319 tp_is_empty!30769)))

(assert (=> b!1214311 t!39694))

(declare-fun b_and!43251 () Bool)

(assert (= b_and!43249 (and (=> t!39694 result!22319) b_and!43251)))

(declare-fun m!1119957 () Bool)

(assert (=> mapNonEmpty!48028 m!1119957))

(declare-fun m!1119959 () Bool)

(assert (=> b!1214309 m!1119959))

(declare-fun m!1119961 () Bool)

(assert (=> b!1214329 m!1119961))

(declare-fun m!1119963 () Bool)

(assert (=> b!1214329 m!1119963))

(declare-fun m!1119965 () Bool)

(assert (=> b!1214316 m!1119965))

(declare-fun m!1119967 () Bool)

(assert (=> b!1214307 m!1119967))

(declare-fun m!1119969 () Bool)

(assert (=> bm!60332 m!1119969))

(declare-fun m!1119971 () Bool)

(assert (=> bm!60329 m!1119971))

(declare-fun m!1119973 () Bool)

(assert (=> b!1214321 m!1119973))

(declare-fun m!1119975 () Bool)

(assert (=> b!1214321 m!1119975))

(declare-fun m!1119977 () Bool)

(assert (=> b!1214321 m!1119977))

(declare-fun m!1119979 () Bool)

(assert (=> b!1214321 m!1119979))

(declare-fun m!1119981 () Bool)

(assert (=> bm!60327 m!1119981))

(declare-fun m!1119983 () Bool)

(assert (=> b!1214331 m!1119983))

(declare-fun m!1119985 () Bool)

(assert (=> bm!60326 m!1119985))

(declare-fun m!1119987 () Bool)

(assert (=> b!1214330 m!1119987))

(declare-fun m!1119989 () Bool)

(assert (=> start!101378 m!1119989))

(declare-fun m!1119991 () Bool)

(assert (=> start!101378 m!1119991))

(declare-fun m!1119993 () Bool)

(assert (=> b!1214327 m!1119993))

(declare-fun m!1119995 () Bool)

(assert (=> b!1214325 m!1119995))

(declare-fun m!1119997 () Bool)

(assert (=> b!1214325 m!1119997))

(declare-fun m!1119999 () Bool)

(assert (=> bm!60330 m!1119999))

(declare-fun m!1120001 () Bool)

(assert (=> b!1214315 m!1120001))

(declare-fun m!1120003 () Bool)

(assert (=> b!1214310 m!1120003))

(declare-fun m!1120005 () Bool)

(assert (=> b!1214324 m!1120005))

(declare-fun m!1120007 () Bool)

(assert (=> b!1214323 m!1120007))

(declare-fun m!1120009 () Bool)

(assert (=> b!1214323 m!1120009))

(declare-fun m!1120011 () Bool)

(assert (=> b!1214306 m!1120011))

(declare-fun m!1120013 () Bool)

(assert (=> b!1214306 m!1120013))

(declare-fun m!1120015 () Bool)

(assert (=> b!1214306 m!1120015))

(declare-fun m!1120017 () Bool)

(assert (=> b!1214306 m!1120017))

(declare-fun m!1120019 () Bool)

(assert (=> b!1214306 m!1120019))

(assert (=> b!1214306 m!1120017))

(assert (=> b!1214306 m!1119995))

(declare-fun m!1120021 () Bool)

(assert (=> b!1214306 m!1120021))

(assert (=> b!1214306 m!1120015))

(declare-fun m!1120023 () Bool)

(assert (=> b!1214306 m!1120023))

(assert (=> b!1214306 m!1119995))

(assert (=> b!1214306 m!1119995))

(declare-fun m!1120025 () Bool)

(assert (=> b!1214306 m!1120025))

(declare-fun m!1120027 () Bool)

(assert (=> b!1214322 m!1120027))

(assert (=> b!1214322 m!1120027))

(declare-fun m!1120029 () Bool)

(assert (=> b!1214322 m!1120029))

(declare-fun m!1120031 () Bool)

(assert (=> b!1214322 m!1120031))

(declare-fun m!1120033 () Bool)

(assert (=> b!1214311 m!1120033))

(declare-fun m!1120035 () Bool)

(assert (=> b!1214311 m!1120035))

(declare-fun m!1120037 () Bool)

(assert (=> b!1214311 m!1120037))

(declare-fun m!1120039 () Bool)

(assert (=> b!1214311 m!1120039))

(assert (=> b!1214305 m!1120001))

(check-sat (not b!1214305) (not b!1214331) (not b!1214306) (not bm!60330) (not b_next!26065) (not b!1214307) (not b!1214322) (not bm!60326) tp_is_empty!30769 (not b!1214315) (not b!1214316) (not b!1214311) (not bm!60329) (not b!1214323) (not b!1214329) (not b!1214325) (not bm!60332) b_and!43251 (not mapNonEmpty!48028) (not b!1214327) (not bm!60327) (not b!1214321) (not b!1214309) (not start!101378) (not b!1214330) (not b!1214310) (not b_lambda!21735))
(check-sat b_and!43251 (not b_next!26065))
