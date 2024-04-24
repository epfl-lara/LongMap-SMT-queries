; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101316 () Bool)

(assert start!101316)

(declare-fun b_free!26041 () Bool)

(declare-fun b_next!26041 () Bool)

(assert (=> start!101316 (= b_free!26041 (not b_next!26041))))

(declare-fun tp!91142 () Bool)

(declare-fun b_and!43183 () Bool)

(assert (=> start!101316 (= tp!91142 b_and!43183)))

(declare-datatypes ((V!46121 0))(
  ( (V!46122 (val!15429 Int)) )
))
(declare-fun zeroValue!944 () V!46121)

(declare-datatypes ((tuple2!19834 0))(
  ( (tuple2!19835 (_1!9928 (_ BitVec 64)) (_2!9928 V!46121)) )
))
(declare-datatypes ((List!26638 0))(
  ( (Nil!26635) (Cons!26634 (h!27852 tuple2!19834) (t!39651 List!26638)) )
))
(declare-datatypes ((ListLongMap!17811 0))(
  ( (ListLongMap!17812 (toList!8921 List!26638)) )
))
(declare-fun call!60020 () ListLongMap!17811)

(declare-fun c!119927 () Bool)

(declare-fun bm!60016 () Bool)

(declare-fun lt!550939 () ListLongMap!17811)

(declare-fun c!119928 () Bool)

(declare-fun minValue!944 () V!46121)

(declare-fun +!4081 (ListLongMap!17811 tuple2!19834) ListLongMap!17811)

(assert (=> bm!60016 (= call!60020 (+!4081 lt!550939 (ite (or c!119927 c!119928) (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!550940 () ListLongMap!17811)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!60017 () Bool)

(declare-fun call!60022 () Bool)

(declare-fun call!60024 () ListLongMap!17811)

(declare-fun contains!7015 (ListLongMap!17811 (_ BitVec 64)) Bool)

(assert (=> bm!60017 (= call!60022 (contains!7015 (ite c!119927 lt!550940 call!60024) k0!934))))

(declare-fun b!1213030 () Bool)

(declare-fun lt!550934 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1213030 (= c!119928 (and (not lt!550934) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!40133 0))(
  ( (Unit!40134) )
))
(declare-fun e!689010 () Unit!40133)

(declare-fun e!689002 () Unit!40133)

(assert (=> b!1213030 (= e!689010 e!689002)))

(declare-fun b!1213031 () Bool)

(declare-fun e!689000 () Bool)

(declare-fun call!60026 () ListLongMap!17811)

(declare-fun call!60019 () ListLongMap!17811)

(assert (=> b!1213031 (= e!689000 (= call!60026 call!60019))))

(declare-fun b!1213032 () Bool)

(declare-fun e!689001 () Bool)

(declare-fun e!689003 () Bool)

(assert (=> b!1213032 (= e!689001 e!689003)))

(declare-fun res!805438 () Bool)

(assert (=> b!1213032 (=> (not res!805438) (not e!689003))))

(declare-datatypes ((array!78309 0))(
  ( (array!78310 (arr!37784 (Array (_ BitVec 32) (_ BitVec 64))) (size!38321 (_ BitVec 32))) )
))
(declare-fun lt!550945 () array!78309)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78309 (_ BitVec 32)) Bool)

(assert (=> b!1213032 (= res!805438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550945 mask!1564))))

(declare-fun _keys!1208 () array!78309)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213032 (= lt!550945 (array!78310 (store (arr!37784 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38321 _keys!1208)))))

(declare-fun b!1213033 () Bool)

(declare-fun e!688996 () Unit!40133)

(declare-fun Unit!40135 () Unit!40133)

(assert (=> b!1213033 (= e!688996 Unit!40135)))

(declare-fun bm!60018 () Bool)

(declare-fun call!60025 () Unit!40133)

(declare-fun call!60023 () Unit!40133)

(assert (=> bm!60018 (= call!60025 call!60023)))

(declare-fun b!1213035 () Bool)

(assert (=> b!1213035 (contains!7015 (+!4081 lt!550940 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550943 () Unit!40133)

(declare-fun addStillContains!1064 (ListLongMap!17811 (_ BitVec 64) V!46121 (_ BitVec 64)) Unit!40133)

(assert (=> b!1213035 (= lt!550943 (addStillContains!1064 lt!550940 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1213035 call!60022))

(assert (=> b!1213035 (= lt!550940 call!60020)))

(declare-fun lt!550953 () Unit!40133)

(assert (=> b!1213035 (= lt!550953 call!60023)))

(assert (=> b!1213035 (= e!689010 lt!550943)))

(declare-fun b!1213036 () Bool)

(declare-fun res!805430 () Bool)

(assert (=> b!1213036 (=> (not res!805430) (not e!689001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213036 (= res!805430 (validKeyInArray!0 k0!934))))

(declare-fun b!1213037 () Bool)

(declare-fun e!689007 () Bool)

(declare-fun e!689009 () Bool)

(declare-fun mapRes!47989 () Bool)

(assert (=> b!1213037 (= e!689007 (and e!689009 mapRes!47989))))

(declare-fun condMapEmpty!47989 () Bool)

(declare-datatypes ((ValueCell!14663 0))(
  ( (ValueCellFull!14663 (v!18077 V!46121)) (EmptyCell!14663) )
))
(declare-datatypes ((array!78311 0))(
  ( (array!78312 (arr!37785 (Array (_ BitVec 32) ValueCell!14663)) (size!38322 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78311)

(declare-fun mapDefault!47989 () ValueCell!14663)

(assert (=> b!1213037 (= condMapEmpty!47989 (= (arr!37785 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14663)) mapDefault!47989)))))

(declare-fun mapNonEmpty!47989 () Bool)

(declare-fun tp!91141 () Bool)

(declare-fun e!689008 () Bool)

(assert (=> mapNonEmpty!47989 (= mapRes!47989 (and tp!91141 e!689008))))

(declare-fun mapRest!47989 () (Array (_ BitVec 32) ValueCell!14663))

(declare-fun mapValue!47989 () ValueCell!14663)

(declare-fun mapKey!47989 () (_ BitVec 32))

(assert (=> mapNonEmpty!47989 (= (arr!37785 _values!996) (store mapRest!47989 mapKey!47989 mapValue!47989))))

(declare-fun b!1213038 () Bool)

(declare-fun tp_is_empty!30745 () Bool)

(assert (=> b!1213038 (= e!689009 tp_is_empty!30745)))

(declare-fun b!1213039 () Bool)

(declare-fun e!688998 () Bool)

(assert (=> b!1213039 (= e!689003 (not e!688998))))

(declare-fun res!805435 () Bool)

(assert (=> b!1213039 (=> res!805435 e!688998)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1213039 (= res!805435 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213039 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550941 () Unit!40133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78309 (_ BitVec 64) (_ BitVec 32)) Unit!40133)

(assert (=> b!1213039 (= lt!550941 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!60019 () Bool)

(declare-fun call!60021 () Bool)

(assert (=> bm!60019 (= call!60021 call!60022)))

(declare-fun b!1213040 () Bool)

(assert (=> b!1213040 (= e!689008 tp_is_empty!30745)))

(declare-fun b!1213041 () Bool)

(declare-fun res!805437 () Bool)

(assert (=> b!1213041 (=> (not res!805437) (not e!689001))))

(assert (=> b!1213041 (= res!805437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!60020 () Bool)

(assert (=> bm!60020 (= call!60024 call!60020)))

(declare-fun b!1213042 () Bool)

(declare-fun res!805436 () Bool)

(assert (=> b!1213042 (=> (not res!805436) (not e!689001))))

(declare-datatypes ((List!26639 0))(
  ( (Nil!26636) (Cons!26635 (h!27853 (_ BitVec 64)) (t!39652 List!26639)) )
))
(declare-fun arrayNoDuplicates!0 (array!78309 (_ BitVec 32) List!26639) Bool)

(assert (=> b!1213042 (= res!805436 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26636))))

(declare-fun b!1213043 () Bool)

(declare-fun res!805441 () Bool)

(assert (=> b!1213043 (=> (not res!805441) (not e!689001))))

(assert (=> b!1213043 (= res!805441 (and (= (size!38322 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38321 _keys!1208) (size!38322 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213044 () Bool)

(declare-fun res!805443 () Bool)

(assert (=> b!1213044 (=> (not res!805443) (not e!689001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213044 (= res!805443 (validMask!0 mask!1564))))

(declare-fun e!689004 () Bool)

(declare-fun b!1213045 () Bool)

(assert (=> b!1213045 (= e!689004 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213046 () Bool)

(declare-fun e!689006 () Bool)

(assert (=> b!1213046 (= e!688998 e!689006)))

(declare-fun res!805439 () Bool)

(assert (=> b!1213046 (=> res!805439 e!689006)))

(assert (=> b!1213046 (= res!805439 (not (= from!1455 i!673)))))

(declare-fun lt!550948 () ListLongMap!17811)

(declare-fun lt!550949 () array!78311)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5380 (array!78309 array!78311 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 32) Int) ListLongMap!17811)

(assert (=> b!1213046 (= lt!550948 (getCurrentListMapNoExtraKeys!5380 lt!550945 lt!550949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550944 () V!46121)

(assert (=> b!1213046 (= lt!550949 (array!78312 (store (arr!37785 _values!996) i!673 (ValueCellFull!14663 lt!550944)) (size!38322 _values!996)))))

(declare-fun dynLambda!3296 (Int (_ BitVec 64)) V!46121)

(assert (=> b!1213046 (= lt!550944 (dynLambda!3296 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550942 () ListLongMap!17811)

(assert (=> b!1213046 (= lt!550942 (getCurrentListMapNoExtraKeys!5380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!688999 () Bool)

(declare-fun b!1213047 () Bool)

(assert (=> b!1213047 (= e!688999 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213048 () Bool)

(declare-fun e!688995 () Bool)

(assert (=> b!1213048 (= e!689006 e!688995)))

(declare-fun res!805434 () Bool)

(assert (=> b!1213048 (=> res!805434 e!688995)))

(assert (=> b!1213048 (= res!805434 (not (= (select (arr!37784 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213048 e!689000))

(declare-fun c!119930 () Bool)

(assert (=> b!1213048 (= c!119930 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550955 () Unit!40133)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1064 (array!78309 array!78311 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40133)

(assert (=> b!1213048 (= lt!550955 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1064 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60021 () Bool)

(assert (=> bm!60021 (= call!60026 (getCurrentListMapNoExtraKeys!5380 lt!550945 lt!550949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213049 () Bool)

(declare-fun e!689005 () Unit!40133)

(declare-fun Unit!40136 () Unit!40133)

(assert (=> b!1213049 (= e!689005 Unit!40136)))

(declare-fun b!1213034 () Bool)

(declare-fun lt!550937 () ListLongMap!17811)

(assert (=> b!1213034 (= e!688995 (= lt!550937 (getCurrentListMapNoExtraKeys!5380 lt!550945 lt!550949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (=> b!1213034 (= lt!550937 lt!550939)))

(declare-fun -!1850 (ListLongMap!17811 (_ BitVec 64)) ListLongMap!17811)

(assert (=> b!1213034 (= lt!550937 (-!1850 lt!550942 k0!934))))

(declare-fun lt!550950 () V!46121)

(assert (=> b!1213034 (= (-!1850 (+!4081 lt!550939 (tuple2!19835 (select (arr!37784 _keys!1208) from!1455) lt!550950)) (select (arr!37784 _keys!1208) from!1455)) lt!550939)))

(declare-fun lt!550951 () Unit!40133)

(declare-fun addThenRemoveForNewKeyIsSame!278 (ListLongMap!17811 (_ BitVec 64) V!46121) Unit!40133)

(assert (=> b!1213034 (= lt!550951 (addThenRemoveForNewKeyIsSame!278 lt!550939 (select (arr!37784 _keys!1208) from!1455) lt!550950))))

(declare-fun get!19303 (ValueCell!14663 V!46121) V!46121)

(assert (=> b!1213034 (= lt!550950 (get!19303 (select (arr!37785 _values!996) from!1455) lt!550944))))

(declare-fun lt!550946 () Unit!40133)

(assert (=> b!1213034 (= lt!550946 e!689005)))

(declare-fun c!119929 () Bool)

(assert (=> b!1213034 (= c!119929 (contains!7015 lt!550939 k0!934))))

(assert (=> b!1213034 (= lt!550939 (getCurrentListMapNoExtraKeys!5380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!805433 () Bool)

(assert (=> start!101316 (=> (not res!805433) (not e!689001))))

(assert (=> start!101316 (= res!805433 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38321 _keys!1208))))))

(assert (=> start!101316 e!689001))

(assert (=> start!101316 tp_is_empty!30745))

(declare-fun array_inv!28842 (array!78309) Bool)

(assert (=> start!101316 (array_inv!28842 _keys!1208)))

(assert (=> start!101316 true))

(assert (=> start!101316 tp!91142))

(declare-fun array_inv!28843 (array!78311) Bool)

(assert (=> start!101316 (and (array_inv!28843 _values!996) e!689007)))

(declare-fun b!1213050 () Bool)

(declare-fun Unit!40137 () Unit!40133)

(assert (=> b!1213050 (= e!689005 Unit!40137)))

(assert (=> b!1213050 (= lt!550934 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213050 (= c!119927 (and (not lt!550934) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550952 () Unit!40133)

(assert (=> b!1213050 (= lt!550952 e!689010)))

(declare-fun lt!550947 () Unit!40133)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!612 (array!78309 array!78311 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 64) (_ BitVec 32) Int) Unit!40133)

(assert (=> b!1213050 (= lt!550947 (lemmaListMapContainsThenArrayContainsFrom!612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119926 () Bool)

(assert (=> b!1213050 (= c!119926 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805442 () Bool)

(assert (=> b!1213050 (= res!805442 e!689004)))

(assert (=> b!1213050 (=> (not res!805442) (not e!688999))))

(assert (=> b!1213050 e!688999))

(declare-fun lt!550935 () Unit!40133)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78309 (_ BitVec 32) (_ BitVec 32)) Unit!40133)

(assert (=> b!1213050 (= lt!550935 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213050 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26636)))

(declare-fun lt!550936 () Unit!40133)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78309 (_ BitVec 64) (_ BitVec 32) List!26639) Unit!40133)

(assert (=> b!1213050 (= lt!550936 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26636))))

(assert (=> b!1213050 false))

(declare-fun b!1213051 () Bool)

(assert (=> b!1213051 (= e!689004 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550934) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213052 () Bool)

(assert (=> b!1213052 call!60021))

(declare-fun lt!550954 () Unit!40133)

(assert (=> b!1213052 (= lt!550954 call!60025)))

(assert (=> b!1213052 (= e!688996 lt!550954)))

(declare-fun b!1213053 () Bool)

(declare-fun res!805440 () Bool)

(assert (=> b!1213053 (=> (not res!805440) (not e!689003))))

(assert (=> b!1213053 (= res!805440 (arrayNoDuplicates!0 lt!550945 #b00000000000000000000000000000000 Nil!26636))))

(declare-fun bm!60022 () Bool)

(assert (=> bm!60022 (= call!60019 (getCurrentListMapNoExtraKeys!5380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60023 () Bool)

(assert (=> bm!60023 (= call!60023 (addStillContains!1064 lt!550939 (ite (or c!119927 c!119928) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119927 c!119928) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1213054 () Bool)

(declare-fun lt!550938 () Unit!40133)

(assert (=> b!1213054 (= e!689002 lt!550938)))

(assert (=> b!1213054 (= lt!550938 call!60025)))

(assert (=> b!1213054 call!60021))

(declare-fun b!1213055 () Bool)

(declare-fun res!805432 () Bool)

(assert (=> b!1213055 (=> (not res!805432) (not e!689001))))

(assert (=> b!1213055 (= res!805432 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38321 _keys!1208))))))

(declare-fun mapIsEmpty!47989 () Bool)

(assert (=> mapIsEmpty!47989 mapRes!47989))

(declare-fun b!1213056 () Bool)

(declare-fun res!805431 () Bool)

(assert (=> b!1213056 (=> (not res!805431) (not e!689001))))

(assert (=> b!1213056 (= res!805431 (= (select (arr!37784 _keys!1208) i!673) k0!934))))

(declare-fun b!1213057 () Bool)

(assert (=> b!1213057 (= e!689000 (= call!60026 (-!1850 call!60019 k0!934)))))

(declare-fun b!1213058 () Bool)

(assert (=> b!1213058 (= e!689002 e!688996)))

(declare-fun c!119931 () Bool)

(assert (=> b!1213058 (= c!119931 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550934))))

(assert (= (and start!101316 res!805433) b!1213044))

(assert (= (and b!1213044 res!805443) b!1213043))

(assert (= (and b!1213043 res!805441) b!1213041))

(assert (= (and b!1213041 res!805437) b!1213042))

(assert (= (and b!1213042 res!805436) b!1213055))

(assert (= (and b!1213055 res!805432) b!1213036))

(assert (= (and b!1213036 res!805430) b!1213056))

(assert (= (and b!1213056 res!805431) b!1213032))

(assert (= (and b!1213032 res!805438) b!1213053))

(assert (= (and b!1213053 res!805440) b!1213039))

(assert (= (and b!1213039 (not res!805435)) b!1213046))

(assert (= (and b!1213046 (not res!805439)) b!1213048))

(assert (= (and b!1213048 c!119930) b!1213057))

(assert (= (and b!1213048 (not c!119930)) b!1213031))

(assert (= (or b!1213057 b!1213031) bm!60021))

(assert (= (or b!1213057 b!1213031) bm!60022))

(assert (= (and b!1213048 (not res!805434)) b!1213034))

(assert (= (and b!1213034 c!119929) b!1213050))

(assert (= (and b!1213034 (not c!119929)) b!1213049))

(assert (= (and b!1213050 c!119927) b!1213035))

(assert (= (and b!1213050 (not c!119927)) b!1213030))

(assert (= (and b!1213030 c!119928) b!1213054))

(assert (= (and b!1213030 (not c!119928)) b!1213058))

(assert (= (and b!1213058 c!119931) b!1213052))

(assert (= (and b!1213058 (not c!119931)) b!1213033))

(assert (= (or b!1213054 b!1213052) bm!60018))

(assert (= (or b!1213054 b!1213052) bm!60020))

(assert (= (or b!1213054 b!1213052) bm!60019))

(assert (= (or b!1213035 bm!60019) bm!60017))

(assert (= (or b!1213035 bm!60018) bm!60023))

(assert (= (or b!1213035 bm!60020) bm!60016))

(assert (= (and b!1213050 c!119926) b!1213045))

(assert (= (and b!1213050 (not c!119926)) b!1213051))

(assert (= (and b!1213050 res!805442) b!1213047))

(assert (= (and b!1213037 condMapEmpty!47989) mapIsEmpty!47989))

(assert (= (and b!1213037 (not condMapEmpty!47989)) mapNonEmpty!47989))

(get-info :version)

(assert (= (and mapNonEmpty!47989 ((_ is ValueCellFull!14663) mapValue!47989)) b!1213040))

(assert (= (and b!1213037 ((_ is ValueCellFull!14663) mapDefault!47989)) b!1213038))

(assert (= start!101316 b!1213037))

(declare-fun b_lambda!21673 () Bool)

(assert (=> (not b_lambda!21673) (not b!1213046)))

(declare-fun t!39650 () Bool)

(declare-fun tb!10833 () Bool)

(assert (=> (and start!101316 (= defaultEntry!1004 defaultEntry!1004) t!39650) tb!10833))

(declare-fun result!22269 () Bool)

(assert (=> tb!10833 (= result!22269 tp_is_empty!30745)))

(assert (=> b!1213046 t!39650))

(declare-fun b_and!43185 () Bool)

(assert (= b_and!43183 (and (=> t!39650 result!22269) b_and!43185)))

(declare-fun m!1118739 () Bool)

(assert (=> b!1213045 m!1118739))

(declare-fun m!1118741 () Bool)

(assert (=> b!1213050 m!1118741))

(declare-fun m!1118743 () Bool)

(assert (=> b!1213050 m!1118743))

(declare-fun m!1118745 () Bool)

(assert (=> b!1213050 m!1118745))

(declare-fun m!1118747 () Bool)

(assert (=> b!1213050 m!1118747))

(declare-fun m!1118749 () Bool)

(assert (=> b!1213044 m!1118749))

(declare-fun m!1118751 () Bool)

(assert (=> bm!60022 m!1118751))

(assert (=> b!1213047 m!1118739))

(declare-fun m!1118753 () Bool)

(assert (=> b!1213039 m!1118753))

(declare-fun m!1118755 () Bool)

(assert (=> b!1213039 m!1118755))

(declare-fun m!1118757 () Bool)

(assert (=> b!1213036 m!1118757))

(declare-fun m!1118759 () Bool)

(assert (=> b!1213032 m!1118759))

(declare-fun m!1118761 () Bool)

(assert (=> b!1213032 m!1118761))

(declare-fun m!1118763 () Bool)

(assert (=> b!1213057 m!1118763))

(declare-fun m!1118765 () Bool)

(assert (=> b!1213046 m!1118765))

(declare-fun m!1118767 () Bool)

(assert (=> b!1213046 m!1118767))

(declare-fun m!1118769 () Bool)

(assert (=> b!1213046 m!1118769))

(declare-fun m!1118771 () Bool)

(assert (=> b!1213046 m!1118771))

(declare-fun m!1118773 () Bool)

(assert (=> b!1213048 m!1118773))

(declare-fun m!1118775 () Bool)

(assert (=> b!1213048 m!1118775))

(declare-fun m!1118777 () Bool)

(assert (=> mapNonEmpty!47989 m!1118777))

(declare-fun m!1118779 () Bool)

(assert (=> b!1213035 m!1118779))

(assert (=> b!1213035 m!1118779))

(declare-fun m!1118781 () Bool)

(assert (=> b!1213035 m!1118781))

(declare-fun m!1118783 () Bool)

(assert (=> b!1213035 m!1118783))

(declare-fun m!1118785 () Bool)

(assert (=> start!101316 m!1118785))

(declare-fun m!1118787 () Bool)

(assert (=> start!101316 m!1118787))

(assert (=> b!1213034 m!1118751))

(declare-fun m!1118789 () Bool)

(assert (=> b!1213034 m!1118789))

(declare-fun m!1118791 () Bool)

(assert (=> b!1213034 m!1118791))

(declare-fun m!1118793 () Bool)

(assert (=> b!1213034 m!1118793))

(declare-fun m!1118795 () Bool)

(assert (=> b!1213034 m!1118795))

(declare-fun m!1118797 () Bool)

(assert (=> b!1213034 m!1118797))

(assert (=> b!1213034 m!1118773))

(declare-fun m!1118799 () Bool)

(assert (=> b!1213034 m!1118799))

(assert (=> b!1213034 m!1118789))

(declare-fun m!1118801 () Bool)

(assert (=> b!1213034 m!1118801))

(assert (=> b!1213034 m!1118773))

(assert (=> b!1213034 m!1118791))

(assert (=> b!1213034 m!1118773))

(declare-fun m!1118803 () Bool)

(assert (=> b!1213034 m!1118803))

(declare-fun m!1118805 () Bool)

(assert (=> b!1213042 m!1118805))

(declare-fun m!1118807 () Bool)

(assert (=> bm!60016 m!1118807))

(assert (=> bm!60021 m!1118795))

(declare-fun m!1118809 () Bool)

(assert (=> bm!60023 m!1118809))

(declare-fun m!1118811 () Bool)

(assert (=> b!1213056 m!1118811))

(declare-fun m!1118813 () Bool)

(assert (=> b!1213053 m!1118813))

(declare-fun m!1118815 () Bool)

(assert (=> bm!60017 m!1118815))

(declare-fun m!1118817 () Bool)

(assert (=> b!1213041 m!1118817))

(check-sat (not bm!60016) (not bm!60021) b_and!43185 (not b!1213032) (not b!1213046) (not b_lambda!21673) (not b!1213047) (not start!101316) (not b!1213035) (not b!1213042) (not bm!60022) (not b!1213050) (not b!1213039) (not b!1213034) (not b!1213057) (not b!1213036) (not b_next!26041) (not b!1213041) (not mapNonEmpty!47989) (not bm!60017) (not b!1213048) (not bm!60023) (not b!1213045) (not b!1213044) (not b!1213053) tp_is_empty!30745)
(check-sat b_and!43185 (not b_next!26041))
