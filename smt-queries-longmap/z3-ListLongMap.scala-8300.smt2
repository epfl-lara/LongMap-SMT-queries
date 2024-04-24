; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101384 () Bool)

(assert start!101384)

(declare-fun b_free!26071 () Bool)

(declare-fun b_next!26071 () Bool)

(assert (=> start!101384 (= b_free!26071 (not b_next!26071))))

(declare-fun tp!91235 () Bool)

(declare-fun b_and!43261 () Bool)

(assert (=> start!101384 (= tp!91235 b_and!43261)))

(declare-datatypes ((V!46161 0))(
  ( (V!46162 (val!15444 Int)) )
))
(declare-fun zeroValue!944 () V!46161)

(declare-fun bm!60397 () Bool)

(declare-fun c!120248 () Bool)

(declare-datatypes ((tuple2!19862 0))(
  ( (tuple2!19863 (_1!9942 (_ BitVec 64)) (_2!9942 V!46161)) )
))
(declare-datatypes ((List!26664 0))(
  ( (Nil!26661) (Cons!26660 (h!27878 tuple2!19862) (t!39707 List!26664)) )
))
(declare-datatypes ((ListLongMap!17839 0))(
  ( (ListLongMap!17840 (toList!8935 List!26664)) )
))
(declare-fun call!60400 () ListLongMap!17839)

(declare-fun lt!552053 () ListLongMap!17839)

(declare-fun minValue!944 () V!46161)

(declare-fun c!120246 () Bool)

(declare-fun +!4092 (ListLongMap!17839 tuple2!19862) ListLongMap!17839)

(assert (=> bm!60397 (= call!60400 (+!4092 lt!552053 (ite (or c!120246 c!120248) (tuple2!19863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1214579 () Bool)

(declare-fun e!689879 () Bool)

(declare-fun e!689872 () Bool)

(assert (=> b!1214579 (= e!689879 e!689872)))

(declare-fun res!806180 () Bool)

(assert (=> b!1214579 (=> (not res!806180) (not e!689872))))

(declare-datatypes ((array!78371 0))(
  ( (array!78372 (arr!37814 (Array (_ BitVec 32) (_ BitVec 64))) (size!38351 (_ BitVec 32))) )
))
(declare-fun lt!552047 () array!78371)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78371 (_ BitVec 32)) Bool)

(assert (=> b!1214579 (= res!806180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552047 mask!1564))))

(declare-fun _keys!1208 () array!78371)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214579 (= lt!552047 (array!78372 (store (arr!37814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38351 _keys!1208)))))

(declare-fun b!1214580 () Bool)

(declare-fun lt!552052 () ListLongMap!17839)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!7031 (ListLongMap!17839 (_ BitVec 64)) Bool)

(assert (=> b!1214580 (contains!7031 (+!4092 lt!552052 (tuple2!19863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!40195 0))(
  ( (Unit!40196) )
))
(declare-fun lt!552060 () Unit!40195)

(declare-fun addStillContains!1075 (ListLongMap!17839 (_ BitVec 64) V!46161 (_ BitVec 64)) Unit!40195)

(assert (=> b!1214580 (= lt!552060 (addStillContains!1075 lt!552052 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!60403 () Bool)

(assert (=> b!1214580 call!60403))

(assert (=> b!1214580 (= lt!552052 call!60400)))

(declare-fun lt!552055 () Unit!40195)

(declare-fun call!60404 () Unit!40195)

(assert (=> b!1214580 (= lt!552055 call!60404)))

(declare-fun e!689871 () Unit!40195)

(assert (=> b!1214580 (= e!689871 lt!552060)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!552056 () ListLongMap!17839)

(declare-datatypes ((ValueCell!14678 0))(
  ( (ValueCellFull!14678 (v!18093 V!46161)) (EmptyCell!14678) )
))
(declare-datatypes ((array!78373 0))(
  ( (array!78374 (arr!37815 (Array (_ BitVec 32) ValueCell!14678)) (size!38352 (_ BitVec 32))) )
))
(declare-fun lt!552065 () array!78373)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!689882 () Bool)

(declare-fun b!1214581 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5394 (array!78371 array!78373 (_ BitVec 32) (_ BitVec 32) V!46161 V!46161 (_ BitVec 32) Int) ListLongMap!17839)

(assert (=> b!1214581 (= e!689882 (= lt!552056 (getCurrentListMapNoExtraKeys!5394 lt!552047 lt!552065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1214582 () Bool)

(declare-fun e!689880 () Bool)

(declare-fun e!689868 () Bool)

(declare-fun mapRes!48037 () Bool)

(assert (=> b!1214582 (= e!689880 (and e!689868 mapRes!48037))))

(declare-fun condMapEmpty!48037 () Bool)

(declare-fun _values!996 () array!78373)

(declare-fun mapDefault!48037 () ValueCell!14678)

(assert (=> b!1214582 (= condMapEmpty!48037 (= (arr!37815 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14678)) mapDefault!48037)))))

(declare-fun b!1214583 () Bool)

(declare-fun res!806179 () Bool)

(assert (=> b!1214583 (=> (not res!806179) (not e!689879))))

(assert (=> b!1214583 (= res!806179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!806176 () Bool)

(assert (=> start!101384 (=> (not res!806176) (not e!689879))))

(assert (=> start!101384 (= res!806176 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38351 _keys!1208))))))

(assert (=> start!101384 e!689879))

(declare-fun tp_is_empty!30775 () Bool)

(assert (=> start!101384 tp_is_empty!30775))

(declare-fun array_inv!28862 (array!78371) Bool)

(assert (=> start!101384 (array_inv!28862 _keys!1208)))

(assert (=> start!101384 true))

(assert (=> start!101384 tp!91235))

(declare-fun array_inv!28863 (array!78373) Bool)

(assert (=> start!101384 (and (array_inv!28863 _values!996) e!689880)))

(declare-fun bm!60398 () Bool)

(declare-fun call!60406 () ListLongMap!17839)

(assert (=> bm!60398 (= call!60406 (getCurrentListMapNoExtraKeys!5394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214584 () Bool)

(declare-fun e!689874 () Unit!40195)

(declare-fun Unit!40197 () Unit!40195)

(assert (=> b!1214584 (= e!689874 Unit!40197)))

(declare-fun e!689869 () Bool)

(declare-fun b!1214585 () Bool)

(declare-fun arrayContainsKey!0 (array!78371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214585 (= e!689869 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214586 () Bool)

(declare-fun call!60402 () Bool)

(assert (=> b!1214586 call!60402))

(declare-fun lt!552049 () Unit!40195)

(declare-fun call!60405 () Unit!40195)

(assert (=> b!1214586 (= lt!552049 call!60405)))

(declare-fun e!689870 () Unit!40195)

(assert (=> b!1214586 (= e!689870 lt!552049)))

(declare-fun b!1214587 () Bool)

(declare-fun res!806183 () Bool)

(assert (=> b!1214587 (=> (not res!806183) (not e!689879))))

(assert (=> b!1214587 (= res!806183 (and (= (size!38352 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38351 _keys!1208) (size!38352 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!60399 () Bool)

(assert (=> bm!60399 (= call!60404 (addStillContains!1075 lt!552053 (ite (or c!120246 c!120248) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!120246 c!120248) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1214588 () Bool)

(declare-fun Unit!40198 () Unit!40195)

(assert (=> b!1214588 (= e!689870 Unit!40198)))

(declare-fun bm!60400 () Bool)

(declare-fun call!60401 () ListLongMap!17839)

(assert (=> bm!60400 (= call!60401 call!60400)))

(declare-fun b!1214589 () Bool)

(declare-fun res!806178 () Bool)

(assert (=> b!1214589 (=> (not res!806178) (not e!689879))))

(assert (=> b!1214589 (= res!806178 (= (select (arr!37814 _keys!1208) i!673) k0!934))))

(declare-fun b!1214590 () Bool)

(declare-fun res!806171 () Bool)

(assert (=> b!1214590 (=> (not res!806171) (not e!689872))))

(declare-datatypes ((List!26665 0))(
  ( (Nil!26662) (Cons!26661 (h!27879 (_ BitVec 64)) (t!39708 List!26665)) )
))
(declare-fun arrayNoDuplicates!0 (array!78371 (_ BitVec 32) List!26665) Bool)

(assert (=> b!1214590 (= res!806171 (arrayNoDuplicates!0 lt!552047 #b00000000000000000000000000000000 Nil!26662))))

(declare-fun b!1214591 () Bool)

(declare-fun e!689873 () Bool)

(declare-fun e!689875 () Bool)

(assert (=> b!1214591 (= e!689873 e!689875)))

(declare-fun res!806182 () Bool)

(assert (=> b!1214591 (=> res!806182 e!689875)))

(assert (=> b!1214591 (= res!806182 (not (= (select (arr!37814 _keys!1208) from!1455) k0!934)))))

(declare-fun e!689881 () Bool)

(assert (=> b!1214591 e!689881))

(declare-fun c!120243 () Bool)

(assert (=> b!1214591 (= c!120243 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552063 () Unit!40195)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1075 (array!78371 array!78373 (_ BitVec 32) (_ BitVec 32) V!46161 V!46161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40195)

(assert (=> b!1214591 (= lt!552063 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1075 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214592 () Bool)

(declare-fun res!806175 () Bool)

(assert (=> b!1214592 (=> (not res!806175) (not e!689879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214592 (= res!806175 (validMask!0 mask!1564))))

(declare-fun bm!60401 () Bool)

(assert (=> bm!60401 (= call!60403 (contains!7031 (ite c!120246 lt!552052 call!60401) k0!934))))

(declare-fun b!1214593 () Bool)

(declare-fun res!806173 () Bool)

(assert (=> b!1214593 (=> (not res!806173) (not e!689879))))

(assert (=> b!1214593 (= res!806173 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38351 _keys!1208))))))

(declare-fun b!1214594 () Bool)

(assert (=> b!1214594 (= e!689868 tp_is_empty!30775)))

(declare-fun b!1214595 () Bool)

(declare-fun e!689884 () Unit!40195)

(assert (=> b!1214595 (= e!689884 e!689870)))

(declare-fun c!120245 () Bool)

(declare-fun lt!552059 () Bool)

(assert (=> b!1214595 (= c!120245 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552059))))

(declare-fun b!1214596 () Bool)

(declare-fun call!60407 () ListLongMap!17839)

(assert (=> b!1214596 (= e!689881 (= call!60407 call!60406))))

(declare-fun b!1214597 () Bool)

(declare-fun res!806172 () Bool)

(assert (=> b!1214597 (=> (not res!806172) (not e!689879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214597 (= res!806172 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48037 () Bool)

(assert (=> mapIsEmpty!48037 mapRes!48037))

(declare-fun b!1214598 () Bool)

(declare-fun lt!552057 () Unit!40195)

(assert (=> b!1214598 (= e!689884 lt!552057)))

(assert (=> b!1214598 (= lt!552057 call!60405)))

(assert (=> b!1214598 call!60402))

(declare-fun bm!60402 () Bool)

(assert (=> bm!60402 (= call!60407 (getCurrentListMapNoExtraKeys!5394 lt!552047 lt!552065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!689883 () Bool)

(declare-fun b!1214599 () Bool)

(assert (=> b!1214599 (= e!689883 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214600 () Bool)

(declare-fun e!689878 () Bool)

(assert (=> b!1214600 (= e!689872 (not e!689878))))

(declare-fun res!806184 () Bool)

(assert (=> b!1214600 (=> res!806184 e!689878)))

(assert (=> b!1214600 (= res!806184 (bvsgt from!1455 i!673))))

(assert (=> b!1214600 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552051 () Unit!40195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78371 (_ BitVec 64) (_ BitVec 32)) Unit!40195)

(assert (=> b!1214600 (= lt!552051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214601 () Bool)

(assert (=> b!1214601 (= c!120248 (and (not lt!552059) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1214601 (= e!689871 e!689884)))

(declare-fun b!1214602 () Bool)

(assert (=> b!1214602 (= e!689869 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552059) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60403 () Bool)

(assert (=> bm!60403 (= call!60405 call!60404)))

(declare-fun mapNonEmpty!48037 () Bool)

(declare-fun tp!91234 () Bool)

(declare-fun e!689876 () Bool)

(assert (=> mapNonEmpty!48037 (= mapRes!48037 (and tp!91234 e!689876))))

(declare-fun mapValue!48037 () ValueCell!14678)

(declare-fun mapRest!48037 () (Array (_ BitVec 32) ValueCell!14678))

(declare-fun mapKey!48037 () (_ BitVec 32))

(assert (=> mapNonEmpty!48037 (= (arr!37815 _values!996) (store mapRest!48037 mapKey!48037 mapValue!48037))))

(declare-fun bm!60404 () Bool)

(assert (=> bm!60404 (= call!60402 call!60403)))

(declare-fun b!1214603 () Bool)

(declare-fun res!806185 () Bool)

(assert (=> b!1214603 (=> (not res!806185) (not e!689879))))

(assert (=> b!1214603 (= res!806185 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26662))))

(declare-fun b!1214604 () Bool)

(assert (=> b!1214604 (= e!689878 e!689873)))

(declare-fun res!806181 () Bool)

(assert (=> b!1214604 (=> res!806181 e!689873)))

(assert (=> b!1214604 (= res!806181 (not (= from!1455 i!673)))))

(declare-fun lt!552048 () ListLongMap!17839)

(assert (=> b!1214604 (= lt!552048 (getCurrentListMapNoExtraKeys!5394 lt!552047 lt!552065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552054 () V!46161)

(assert (=> b!1214604 (= lt!552065 (array!78374 (store (arr!37815 _values!996) i!673 (ValueCellFull!14678 lt!552054)) (size!38352 _values!996)))))

(declare-fun dynLambda!3308 (Int (_ BitVec 64)) V!46161)

(assert (=> b!1214604 (= lt!552054 (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!552066 () ListLongMap!17839)

(assert (=> b!1214604 (= lt!552066 (getCurrentListMapNoExtraKeys!5394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214605 () Bool)

(declare-fun Unit!40199 () Unit!40195)

(assert (=> b!1214605 (= e!689874 Unit!40199)))

(assert (=> b!1214605 (= lt!552059 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1214605 (= c!120246 (and (not lt!552059) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552064 () Unit!40195)

(assert (=> b!1214605 (= lt!552064 e!689871)))

(declare-fun lt!552050 () Unit!40195)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!621 (array!78371 array!78373 (_ BitVec 32) (_ BitVec 32) V!46161 V!46161 (_ BitVec 64) (_ BitVec 32) Int) Unit!40195)

(assert (=> b!1214605 (= lt!552050 (lemmaListMapContainsThenArrayContainsFrom!621 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120244 () Bool)

(assert (=> b!1214605 (= c!120244 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806174 () Bool)

(assert (=> b!1214605 (= res!806174 e!689869)))

(assert (=> b!1214605 (=> (not res!806174) (not e!689883))))

(assert (=> b!1214605 e!689883))

(declare-fun lt!552045 () Unit!40195)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78371 (_ BitVec 32) (_ BitVec 32)) Unit!40195)

(assert (=> b!1214605 (= lt!552045 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1214605 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26662)))

(declare-fun lt!552061 () Unit!40195)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78371 (_ BitVec 64) (_ BitVec 32) List!26665) Unit!40195)

(assert (=> b!1214605 (= lt!552061 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26662))))

(assert (=> b!1214605 false))

(declare-fun b!1214606 () Bool)

(assert (=> b!1214606 (= e!689875 (or (not (= lt!552056 lt!552048)) (bvslt i!673 (size!38352 _values!996))))))

(assert (=> b!1214606 e!689882))

(declare-fun res!806177 () Bool)

(assert (=> b!1214606 (=> (not res!806177) (not e!689882))))

(assert (=> b!1214606 (= res!806177 (= lt!552056 lt!552053))))

(declare-fun -!1861 (ListLongMap!17839 (_ BitVec 64)) ListLongMap!17839)

(assert (=> b!1214606 (= lt!552056 (-!1861 lt!552066 k0!934))))

(declare-fun lt!552058 () V!46161)

(assert (=> b!1214606 (= (-!1861 (+!4092 lt!552053 (tuple2!19863 (select (arr!37814 _keys!1208) from!1455) lt!552058)) (select (arr!37814 _keys!1208) from!1455)) lt!552053)))

(declare-fun lt!552046 () Unit!40195)

(declare-fun addThenRemoveForNewKeyIsSame!287 (ListLongMap!17839 (_ BitVec 64) V!46161) Unit!40195)

(assert (=> b!1214606 (= lt!552046 (addThenRemoveForNewKeyIsSame!287 lt!552053 (select (arr!37814 _keys!1208) from!1455) lt!552058))))

(declare-fun get!19324 (ValueCell!14678 V!46161) V!46161)

(assert (=> b!1214606 (= lt!552058 (get!19324 (select (arr!37815 _values!996) from!1455) lt!552054))))

(declare-fun lt!552062 () Unit!40195)

(assert (=> b!1214606 (= lt!552062 e!689874)))

(declare-fun c!120247 () Bool)

(assert (=> b!1214606 (= c!120247 (contains!7031 lt!552053 k0!934))))

(assert (=> b!1214606 (= lt!552053 (getCurrentListMapNoExtraKeys!5394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214607 () Bool)

(assert (=> b!1214607 (= e!689881 (= call!60407 (-!1861 call!60406 k0!934)))))

(declare-fun b!1214608 () Bool)

(assert (=> b!1214608 (= e!689876 tp_is_empty!30775)))

(assert (= (and start!101384 res!806176) b!1214592))

(assert (= (and b!1214592 res!806175) b!1214587))

(assert (= (and b!1214587 res!806183) b!1214583))

(assert (= (and b!1214583 res!806179) b!1214603))

(assert (= (and b!1214603 res!806185) b!1214593))

(assert (= (and b!1214593 res!806173) b!1214597))

(assert (= (and b!1214597 res!806172) b!1214589))

(assert (= (and b!1214589 res!806178) b!1214579))

(assert (= (and b!1214579 res!806180) b!1214590))

(assert (= (and b!1214590 res!806171) b!1214600))

(assert (= (and b!1214600 (not res!806184)) b!1214604))

(assert (= (and b!1214604 (not res!806181)) b!1214591))

(assert (= (and b!1214591 c!120243) b!1214607))

(assert (= (and b!1214591 (not c!120243)) b!1214596))

(assert (= (or b!1214607 b!1214596) bm!60402))

(assert (= (or b!1214607 b!1214596) bm!60398))

(assert (= (and b!1214591 (not res!806182)) b!1214606))

(assert (= (and b!1214606 c!120247) b!1214605))

(assert (= (and b!1214606 (not c!120247)) b!1214584))

(assert (= (and b!1214605 c!120246) b!1214580))

(assert (= (and b!1214605 (not c!120246)) b!1214601))

(assert (= (and b!1214601 c!120248) b!1214598))

(assert (= (and b!1214601 (not c!120248)) b!1214595))

(assert (= (and b!1214595 c!120245) b!1214586))

(assert (= (and b!1214595 (not c!120245)) b!1214588))

(assert (= (or b!1214598 b!1214586) bm!60403))

(assert (= (or b!1214598 b!1214586) bm!60400))

(assert (= (or b!1214598 b!1214586) bm!60404))

(assert (= (or b!1214580 bm!60404) bm!60401))

(assert (= (or b!1214580 bm!60403) bm!60399))

(assert (= (or b!1214580 bm!60400) bm!60397))

(assert (= (and b!1214605 c!120244) b!1214585))

(assert (= (and b!1214605 (not c!120244)) b!1214602))

(assert (= (and b!1214605 res!806174) b!1214599))

(assert (= (and b!1214606 res!806177) b!1214581))

(assert (= (and b!1214582 condMapEmpty!48037) mapIsEmpty!48037))

(assert (= (and b!1214582 (not condMapEmpty!48037)) mapNonEmpty!48037))

(get-info :version)

(assert (= (and mapNonEmpty!48037 ((_ is ValueCellFull!14678) mapValue!48037)) b!1214608))

(assert (= (and b!1214582 ((_ is ValueCellFull!14678) mapDefault!48037)) b!1214594))

(assert (= start!101384 b!1214582))

(declare-fun b_lambda!21741 () Bool)

(assert (=> (not b_lambda!21741) (not b!1214604)))

(declare-fun t!39706 () Bool)

(declare-fun tb!10863 () Bool)

(assert (=> (and start!101384 (= defaultEntry!1004 defaultEntry!1004) t!39706) tb!10863))

(declare-fun result!22331 () Bool)

(assert (=> tb!10863 (= result!22331 tp_is_empty!30775)))

(assert (=> b!1214604 t!39706))

(declare-fun b_and!43263 () Bool)

(assert (= b_and!43261 (and (=> t!39706 result!22331) b_and!43263)))

(declare-fun m!1120201 () Bool)

(assert (=> bm!60399 m!1120201))

(declare-fun m!1120203 () Bool)

(assert (=> start!101384 m!1120203))

(declare-fun m!1120205 () Bool)

(assert (=> start!101384 m!1120205))

(declare-fun m!1120207 () Bool)

(assert (=> b!1214597 m!1120207))

(declare-fun m!1120209 () Bool)

(assert (=> b!1214583 m!1120209))

(declare-fun m!1120211 () Bool)

(assert (=> b!1214599 m!1120211))

(declare-fun m!1120213 () Bool)

(assert (=> b!1214579 m!1120213))

(declare-fun m!1120215 () Bool)

(assert (=> b!1214579 m!1120215))

(declare-fun m!1120217 () Bool)

(assert (=> b!1214589 m!1120217))

(declare-fun m!1120219 () Bool)

(assert (=> bm!60402 m!1120219))

(declare-fun m!1120221 () Bool)

(assert (=> b!1214590 m!1120221))

(declare-fun m!1120223 () Bool)

(assert (=> b!1214604 m!1120223))

(declare-fun m!1120225 () Bool)

(assert (=> b!1214604 m!1120225))

(declare-fun m!1120227 () Bool)

(assert (=> b!1214604 m!1120227))

(declare-fun m!1120229 () Bool)

(assert (=> b!1214604 m!1120229))

(assert (=> b!1214585 m!1120211))

(declare-fun m!1120231 () Bool)

(assert (=> b!1214591 m!1120231))

(declare-fun m!1120233 () Bool)

(assert (=> b!1214591 m!1120233))

(declare-fun m!1120235 () Bool)

(assert (=> b!1214603 m!1120235))

(declare-fun m!1120237 () Bool)

(assert (=> bm!60398 m!1120237))

(declare-fun m!1120239 () Bool)

(assert (=> b!1214592 m!1120239))

(declare-fun m!1120241 () Bool)

(assert (=> mapNonEmpty!48037 m!1120241))

(declare-fun m!1120243 () Bool)

(assert (=> bm!60397 m!1120243))

(declare-fun m!1120245 () Bool)

(assert (=> b!1214607 m!1120245))

(declare-fun m!1120247 () Bool)

(assert (=> b!1214600 m!1120247))

(declare-fun m!1120249 () Bool)

(assert (=> b!1214600 m!1120249))

(declare-fun m!1120251 () Bool)

(assert (=> b!1214605 m!1120251))

(declare-fun m!1120253 () Bool)

(assert (=> b!1214605 m!1120253))

(declare-fun m!1120255 () Bool)

(assert (=> b!1214605 m!1120255))

(declare-fun m!1120257 () Bool)

(assert (=> b!1214605 m!1120257))

(declare-fun m!1120259 () Bool)

(assert (=> b!1214580 m!1120259))

(assert (=> b!1214580 m!1120259))

(declare-fun m!1120261 () Bool)

(assert (=> b!1214580 m!1120261))

(declare-fun m!1120263 () Bool)

(assert (=> b!1214580 m!1120263))

(assert (=> b!1214606 m!1120237))

(declare-fun m!1120265 () Bool)

(assert (=> b!1214606 m!1120265))

(declare-fun m!1120267 () Bool)

(assert (=> b!1214606 m!1120267))

(declare-fun m!1120269 () Bool)

(assert (=> b!1214606 m!1120269))

(assert (=> b!1214606 m!1120231))

(declare-fun m!1120271 () Bool)

(assert (=> b!1214606 m!1120271))

(declare-fun m!1120273 () Bool)

(assert (=> b!1214606 m!1120273))

(assert (=> b!1214606 m!1120231))

(assert (=> b!1214606 m!1120265))

(declare-fun m!1120275 () Bool)

(assert (=> b!1214606 m!1120275))

(assert (=> b!1214606 m!1120275))

(assert (=> b!1214606 m!1120231))

(declare-fun m!1120277 () Bool)

(assert (=> b!1214606 m!1120277))

(assert (=> b!1214581 m!1120219))

(declare-fun m!1120279 () Bool)

(assert (=> bm!60401 m!1120279))

(check-sat (not bm!60399) (not bm!60402) (not b!1214579) (not b_lambda!21741) (not b!1214597) (not b!1214590) (not b!1214580) (not b_next!26071) (not b!1214581) (not start!101384) (not b!1214604) (not b!1214600) (not b!1214606) (not bm!60397) (not b!1214607) (not b!1214603) (not b!1214605) (not b!1214599) (not bm!60401) (not b!1214583) (not b!1214592) (not mapNonEmpty!48037) tp_is_empty!30775 (not b!1214591) (not bm!60398) b_and!43263 (not b!1214585))
(check-sat b_and!43263 (not b_next!26071))
