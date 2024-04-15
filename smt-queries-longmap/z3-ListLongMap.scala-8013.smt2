; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98912 () Bool)

(assert start!98912)

(declare-fun b_free!24523 () Bool)

(declare-fun b_next!24523 () Bool)

(assert (=> start!98912 (= b_free!24523 (not b_next!24523))))

(declare-fun tp!86279 () Bool)

(declare-fun b_and!39873 () Bool)

(assert (=> start!98912 (= tp!86279 b_and!39873)))

(declare-fun b!1158946 () Bool)

(declare-fun e!659050 () Bool)

(declare-fun e!659046 () Bool)

(declare-fun mapRes!45404 () Bool)

(assert (=> b!1158946 (= e!659050 (and e!659046 mapRes!45404))))

(declare-fun condMapEmpty!45404 () Bool)

(declare-datatypes ((V!43865 0))(
  ( (V!43866 (val!14583 Int)) )
))
(declare-datatypes ((ValueCell!13817 0))(
  ( (ValueCellFull!13817 (v!17219 V!43865)) (EmptyCell!13817) )
))
(declare-datatypes ((array!74868 0))(
  ( (array!74869 (arr!36085 (Array (_ BitVec 32) ValueCell!13817)) (size!36623 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74868)

(declare-fun mapDefault!45404 () ValueCell!13817)

(assert (=> b!1158946 (= condMapEmpty!45404 (= (arr!36085 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13817)) mapDefault!45404)))))

(declare-fun b!1158947 () Bool)

(declare-fun e!659052 () Bool)

(declare-datatypes ((tuple2!18650 0))(
  ( (tuple2!18651 (_1!9336 (_ BitVec 64)) (_2!9336 V!43865)) )
))
(declare-datatypes ((List!25372 0))(
  ( (Nil!25369) (Cons!25368 (h!26577 tuple2!18650) (t!36878 List!25372)) )
))
(declare-datatypes ((ListLongMap!16619 0))(
  ( (ListLongMap!16620 (toList!8325 List!25372)) )
))
(declare-fun call!55801 () ListLongMap!16619)

(declare-fun call!55800 () ListLongMap!16619)

(assert (=> b!1158947 (= e!659052 (= call!55801 call!55800))))

(declare-fun b!1158948 () Bool)

(declare-datatypes ((Unit!38040 0))(
  ( (Unit!38041) )
))
(declare-fun e!659055 () Unit!38040)

(declare-fun Unit!38042 () Unit!38040)

(assert (=> b!1158948 (= e!659055 Unit!38042)))

(declare-fun lt!520802 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1158948 (= lt!520802 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115541 () Bool)

(assert (=> b!1158948 (= c!115541 (and (not lt!520802) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520819 () Unit!38040)

(declare-fun e!659047 () Unit!38040)

(assert (=> b!1158948 (= lt!520819 e!659047)))

(declare-fun zeroValue!944 () V!43865)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43865)

(declare-datatypes ((array!74870 0))(
  ( (array!74871 (arr!36086 (Array (_ BitVec 32) (_ BitVec 64))) (size!36624 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74870)

(declare-fun lt!520821 () Unit!38040)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!518 (array!74870 array!74868 (_ BitVec 32) (_ BitVec 32) V!43865 V!43865 (_ BitVec 64) (_ BitVec 32) Int) Unit!38040)

(assert (=> b!1158948 (= lt!520821 (lemmaListMapContainsThenArrayContainsFrom!518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115539 () Bool)

(assert (=> b!1158948 (= c!115539 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769374 () Bool)

(declare-fun e!659053 () Bool)

(assert (=> b!1158948 (= res!769374 e!659053)))

(declare-fun e!659048 () Bool)

(assert (=> b!1158948 (=> (not res!769374) (not e!659048))))

(assert (=> b!1158948 e!659048))

(declare-fun lt!520806 () Unit!38040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74870 (_ BitVec 32) (_ BitVec 32)) Unit!38040)

(assert (=> b!1158948 (= lt!520806 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25373 0))(
  ( (Nil!25370) (Cons!25369 (h!26578 (_ BitVec 64)) (t!36879 List!25373)) )
))
(declare-fun arrayNoDuplicates!0 (array!74870 (_ BitVec 32) List!25373) Bool)

(assert (=> b!1158948 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25370)))

(declare-fun lt!520814 () Unit!38040)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74870 (_ BitVec 64) (_ BitVec 32) List!25373) Unit!38040)

(assert (=> b!1158948 (= lt!520814 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25370))))

(assert (=> b!1158948 false))

(declare-fun mapIsEmpty!45404 () Bool)

(assert (=> mapIsEmpty!45404 mapRes!45404))

(declare-fun c!115543 () Bool)

(declare-fun call!55798 () ListLongMap!16619)

(declare-fun lt!520809 () ListLongMap!16619)

(declare-fun bm!55792 () Bool)

(declare-fun +!3733 (ListLongMap!16619 tuple2!18650) ListLongMap!16619)

(assert (=> bm!55792 (= call!55798 (+!3733 lt!520809 (ite (or c!115541 c!115543) (tuple2!18651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1158949 () Bool)

(declare-fun res!769375 () Bool)

(declare-fun e!659058 () Bool)

(assert (=> b!1158949 (=> (not res!769375) (not e!659058))))

(assert (=> b!1158949 (= res!769375 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25370))))

(declare-fun b!1158950 () Bool)

(declare-fun e!659049 () Bool)

(declare-fun tp_is_empty!29053 () Bool)

(assert (=> b!1158950 (= e!659049 tp_is_empty!29053)))

(declare-fun b!1158951 () Bool)

(declare-fun -!1379 (ListLongMap!16619 (_ BitVec 64)) ListLongMap!16619)

(assert (=> b!1158951 (= e!659052 (= call!55801 (-!1379 call!55800 k0!934)))))

(declare-fun b!1158952 () Bool)

(declare-fun lt!520801 () ListLongMap!16619)

(declare-fun contains!6776 (ListLongMap!16619 (_ BitVec 64)) Bool)

(assert (=> b!1158952 (contains!6776 (+!3733 lt!520801 (tuple2!18651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!520815 () Unit!38040)

(declare-fun call!55802 () Unit!38040)

(assert (=> b!1158952 (= lt!520815 call!55802)))

(declare-fun call!55795 () Bool)

(assert (=> b!1158952 call!55795))

(assert (=> b!1158952 (= lt!520801 call!55798)))

(declare-fun lt!520812 () Unit!38040)

(declare-fun addStillContains!941 (ListLongMap!16619 (_ BitVec 64) V!43865 (_ BitVec 64)) Unit!38040)

(assert (=> b!1158952 (= lt!520812 (addStillContains!941 lt!520809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1158952 (= e!659047 lt!520815)))

(declare-fun b!1158953 () Bool)

(declare-fun e!659056 () Bool)

(assert (=> b!1158953 (= e!659056 true)))

(declare-fun e!659044 () Bool)

(assert (=> b!1158953 e!659044))

(declare-fun res!769372 () Bool)

(assert (=> b!1158953 (=> (not res!769372) (not e!659044))))

(declare-fun lt!520805 () ListLongMap!16619)

(assert (=> b!1158953 (= res!769372 (= lt!520805 lt!520809))))

(declare-fun lt!520800 () ListLongMap!16619)

(assert (=> b!1158953 (= lt!520805 (-!1379 lt!520800 k0!934))))

(declare-fun lt!520820 () V!43865)

(assert (=> b!1158953 (= (-!1379 (+!3733 lt!520809 (tuple2!18651 (select (arr!36086 _keys!1208) from!1455) lt!520820)) (select (arr!36086 _keys!1208) from!1455)) lt!520809)))

(declare-fun lt!520810 () Unit!38040)

(declare-fun addThenRemoveForNewKeyIsSame!227 (ListLongMap!16619 (_ BitVec 64) V!43865) Unit!38040)

(assert (=> b!1158953 (= lt!520810 (addThenRemoveForNewKeyIsSame!227 lt!520809 (select (arr!36086 _keys!1208) from!1455) lt!520820))))

(declare-fun lt!520808 () V!43865)

(declare-fun get!18415 (ValueCell!13817 V!43865) V!43865)

(assert (=> b!1158953 (= lt!520820 (get!18415 (select (arr!36085 _values!996) from!1455) lt!520808))))

(declare-fun lt!520804 () Unit!38040)

(assert (=> b!1158953 (= lt!520804 e!659055)))

(declare-fun c!115542 () Bool)

(assert (=> b!1158953 (= c!115542 (contains!6776 lt!520809 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4804 (array!74870 array!74868 (_ BitVec 32) (_ BitVec 32) V!43865 V!43865 (_ BitVec 32) Int) ListLongMap!16619)

(assert (=> b!1158953 (= lt!520809 (getCurrentListMapNoExtraKeys!4804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55793 () Bool)

(declare-fun call!55797 () ListLongMap!16619)

(assert (=> bm!55793 (= call!55795 (contains!6776 (ite c!115541 lt!520801 call!55797) k0!934))))

(declare-fun b!1158954 () Bool)

(declare-fun Unit!38043 () Unit!38040)

(assert (=> b!1158954 (= e!659055 Unit!38043)))

(declare-fun mapNonEmpty!45404 () Bool)

(declare-fun tp!86280 () Bool)

(assert (=> mapNonEmpty!45404 (= mapRes!45404 (and tp!86280 e!659049))))

(declare-fun mapRest!45404 () (Array (_ BitVec 32) ValueCell!13817))

(declare-fun mapValue!45404 () ValueCell!13817)

(declare-fun mapKey!45404 () (_ BitVec 32))

(assert (=> mapNonEmpty!45404 (= (arr!36085 _values!996) (store mapRest!45404 mapKey!45404 mapValue!45404))))

(declare-fun b!1158955 () Bool)

(declare-fun arrayContainsKey!0 (array!74870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158955 (= e!659048 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!520803 () array!74868)

(declare-fun lt!520818 () array!74870)

(declare-fun bm!55794 () Bool)

(assert (=> bm!55794 (= call!55801 (getCurrentListMapNoExtraKeys!4804 lt!520818 lt!520803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158956 () Bool)

(declare-fun e!659057 () Unit!38040)

(declare-fun lt!520813 () Unit!38040)

(assert (=> b!1158956 (= e!659057 lt!520813)))

(declare-fun call!55799 () Unit!38040)

(assert (=> b!1158956 (= lt!520813 call!55799)))

(declare-fun call!55796 () Bool)

(assert (=> b!1158956 call!55796))

(declare-fun b!1158957 () Bool)

(declare-fun res!769376 () Bool)

(assert (=> b!1158957 (=> (not res!769376) (not e!659058))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158957 (= res!769376 (= (select (arr!36086 _keys!1208) i!673) k0!934))))

(declare-fun b!1158958 () Bool)

(declare-fun res!769379 () Bool)

(assert (=> b!1158958 (=> (not res!769379) (not e!659058))))

(assert (=> b!1158958 (= res!769379 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36624 _keys!1208))))))

(declare-fun bm!55795 () Bool)

(assert (=> bm!55795 (= call!55799 call!55802)))

(declare-fun b!1158959 () Bool)

(declare-fun res!769371 () Bool)

(assert (=> b!1158959 (=> (not res!769371) (not e!659058))))

(assert (=> b!1158959 (= res!769371 (and (= (size!36623 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36624 _keys!1208) (size!36623 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158960 () Bool)

(declare-fun e!659043 () Bool)

(assert (=> b!1158960 (= e!659043 e!659056)))

(declare-fun res!769368 () Bool)

(assert (=> b!1158960 (=> res!769368 e!659056)))

(assert (=> b!1158960 (= res!769368 (not (= (select (arr!36086 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158960 e!659052))

(declare-fun c!115540 () Bool)

(assert (=> b!1158960 (= c!115540 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520816 () Unit!38040)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!647 (array!74870 array!74868 (_ BitVec 32) (_ BitVec 32) V!43865 V!43865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38040)

(assert (=> b!1158960 (= lt!520816 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55796 () Bool)

(assert (=> bm!55796 (= call!55802 (addStillContains!941 (ite c!115541 lt!520801 lt!520809) (ite c!115541 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115543 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115541 minValue!944 (ite c!115543 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1158961 () Bool)

(assert (=> b!1158961 (= e!659046 tp_is_empty!29053)))

(declare-fun b!1158962 () Bool)

(declare-fun e!659045 () Unit!38040)

(declare-fun Unit!38044 () Unit!38040)

(assert (=> b!1158962 (= e!659045 Unit!38044)))

(declare-fun bm!55797 () Bool)

(assert (=> bm!55797 (= call!55796 call!55795)))

(declare-fun b!1158963 () Bool)

(declare-fun res!769373 () Bool)

(declare-fun e!659054 () Bool)

(assert (=> b!1158963 (=> (not res!769373) (not e!659054))))

(assert (=> b!1158963 (= res!769373 (arrayNoDuplicates!0 lt!520818 #b00000000000000000000000000000000 Nil!25370))))

(declare-fun b!1158964 () Bool)

(assert (=> b!1158964 call!55796))

(declare-fun lt!520817 () Unit!38040)

(assert (=> b!1158964 (= lt!520817 call!55799)))

(assert (=> b!1158964 (= e!659045 lt!520817)))

(declare-fun b!1158965 () Bool)

(assert (=> b!1158965 (= e!659058 e!659054)))

(declare-fun res!769380 () Bool)

(assert (=> b!1158965 (=> (not res!769380) (not e!659054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74870 (_ BitVec 32)) Bool)

(assert (=> b!1158965 (= res!769380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520818 mask!1564))))

(assert (=> b!1158965 (= lt!520818 (array!74871 (store (arr!36086 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36624 _keys!1208)))))

(declare-fun bm!55798 () Bool)

(assert (=> bm!55798 (= call!55800 (getCurrentListMapNoExtraKeys!4804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158966 () Bool)

(assert (=> b!1158966 (= e!659044 (= lt!520805 (getCurrentListMapNoExtraKeys!4804 lt!520818 lt!520803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158967 () Bool)

(assert (=> b!1158967 (= e!659057 e!659045)))

(declare-fun c!115544 () Bool)

(assert (=> b!1158967 (= c!115544 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520802))))

(declare-fun b!1158968 () Bool)

(declare-fun res!769381 () Bool)

(assert (=> b!1158968 (=> (not res!769381) (not e!659058))))

(assert (=> b!1158968 (= res!769381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!769370 () Bool)

(assert (=> start!98912 (=> (not res!769370) (not e!659058))))

(assert (=> start!98912 (= res!769370 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36624 _keys!1208))))))

(assert (=> start!98912 e!659058))

(assert (=> start!98912 tp_is_empty!29053))

(declare-fun array_inv!27728 (array!74870) Bool)

(assert (=> start!98912 (array_inv!27728 _keys!1208)))

(assert (=> start!98912 true))

(assert (=> start!98912 tp!86279))

(declare-fun array_inv!27729 (array!74868) Bool)

(assert (=> start!98912 (and (array_inv!27729 _values!996) e!659050)))

(declare-fun b!1158969 () Bool)

(declare-fun res!769378 () Bool)

(assert (=> b!1158969 (=> (not res!769378) (not e!659058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158969 (= res!769378 (validKeyInArray!0 k0!934))))

(declare-fun b!1158970 () Bool)

(assert (=> b!1158970 (= e!659053 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520802) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158971 () Bool)

(declare-fun e!659051 () Bool)

(assert (=> b!1158971 (= e!659051 e!659043)))

(declare-fun res!769377 () Bool)

(assert (=> b!1158971 (=> res!769377 e!659043)))

(assert (=> b!1158971 (= res!769377 (not (= from!1455 i!673)))))

(declare-fun lt!520811 () ListLongMap!16619)

(assert (=> b!1158971 (= lt!520811 (getCurrentListMapNoExtraKeys!4804 lt!520818 lt!520803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1158971 (= lt!520803 (array!74869 (store (arr!36085 _values!996) i!673 (ValueCellFull!13817 lt!520808)) (size!36623 _values!996)))))

(declare-fun dynLambda!2752 (Int (_ BitVec 64)) V!43865)

(assert (=> b!1158971 (= lt!520808 (dynLambda!2752 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1158971 (= lt!520800 (getCurrentListMapNoExtraKeys!4804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55799 () Bool)

(assert (=> bm!55799 (= call!55797 call!55798)))

(declare-fun b!1158972 () Bool)

(assert (=> b!1158972 (= e!659053 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158973 () Bool)

(assert (=> b!1158973 (= c!115543 (and (not lt!520802) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158973 (= e!659047 e!659057)))

(declare-fun b!1158974 () Bool)

(assert (=> b!1158974 (= e!659054 (not e!659051))))

(declare-fun res!769382 () Bool)

(assert (=> b!1158974 (=> res!769382 e!659051)))

(assert (=> b!1158974 (= res!769382 (bvsgt from!1455 i!673))))

(assert (=> b!1158974 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520807 () Unit!38040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74870 (_ BitVec 64) (_ BitVec 32)) Unit!38040)

(assert (=> b!1158974 (= lt!520807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158975 () Bool)

(declare-fun res!769369 () Bool)

(assert (=> b!1158975 (=> (not res!769369) (not e!659058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158975 (= res!769369 (validMask!0 mask!1564))))

(assert (= (and start!98912 res!769370) b!1158975))

(assert (= (and b!1158975 res!769369) b!1158959))

(assert (= (and b!1158959 res!769371) b!1158968))

(assert (= (and b!1158968 res!769381) b!1158949))

(assert (= (and b!1158949 res!769375) b!1158958))

(assert (= (and b!1158958 res!769379) b!1158969))

(assert (= (and b!1158969 res!769378) b!1158957))

(assert (= (and b!1158957 res!769376) b!1158965))

(assert (= (and b!1158965 res!769380) b!1158963))

(assert (= (and b!1158963 res!769373) b!1158974))

(assert (= (and b!1158974 (not res!769382)) b!1158971))

(assert (= (and b!1158971 (not res!769377)) b!1158960))

(assert (= (and b!1158960 c!115540) b!1158951))

(assert (= (and b!1158960 (not c!115540)) b!1158947))

(assert (= (or b!1158951 b!1158947) bm!55794))

(assert (= (or b!1158951 b!1158947) bm!55798))

(assert (= (and b!1158960 (not res!769368)) b!1158953))

(assert (= (and b!1158953 c!115542) b!1158948))

(assert (= (and b!1158953 (not c!115542)) b!1158954))

(assert (= (and b!1158948 c!115541) b!1158952))

(assert (= (and b!1158948 (not c!115541)) b!1158973))

(assert (= (and b!1158973 c!115543) b!1158956))

(assert (= (and b!1158973 (not c!115543)) b!1158967))

(assert (= (and b!1158967 c!115544) b!1158964))

(assert (= (and b!1158967 (not c!115544)) b!1158962))

(assert (= (or b!1158956 b!1158964) bm!55795))

(assert (= (or b!1158956 b!1158964) bm!55799))

(assert (= (or b!1158956 b!1158964) bm!55797))

(assert (= (or b!1158952 bm!55797) bm!55793))

(assert (= (or b!1158952 bm!55795) bm!55796))

(assert (= (or b!1158952 bm!55799) bm!55792))

(assert (= (and b!1158948 c!115539) b!1158972))

(assert (= (and b!1158948 (not c!115539)) b!1158970))

(assert (= (and b!1158948 res!769374) b!1158955))

(assert (= (and b!1158953 res!769372) b!1158966))

(assert (= (and b!1158946 condMapEmpty!45404) mapIsEmpty!45404))

(assert (= (and b!1158946 (not condMapEmpty!45404)) mapNonEmpty!45404))

(get-info :version)

(assert (= (and mapNonEmpty!45404 ((_ is ValueCellFull!13817) mapValue!45404)) b!1158950))

(assert (= (and b!1158946 ((_ is ValueCellFull!13817) mapDefault!45404)) b!1158961))

(assert (= start!98912 b!1158946))

(declare-fun b_lambda!19611 () Bool)

(assert (=> (not b_lambda!19611) (not b!1158971)))

(declare-fun t!36877 () Bool)

(declare-fun tb!9327 () Bool)

(assert (=> (and start!98912 (= defaultEntry!1004 defaultEntry!1004) t!36877) tb!9327))

(declare-fun result!19227 () Bool)

(assert (=> tb!9327 (= result!19227 tp_is_empty!29053)))

(assert (=> b!1158971 t!36877))

(declare-fun b_and!39875 () Bool)

(assert (= b_and!39873 (and (=> t!36877 result!19227) b_and!39875)))

(declare-fun m!1067595 () Bool)

(assert (=> start!98912 m!1067595))

(declare-fun m!1067597 () Bool)

(assert (=> start!98912 m!1067597))

(declare-fun m!1067599 () Bool)

(assert (=> bm!55794 m!1067599))

(declare-fun m!1067601 () Bool)

(assert (=> b!1158968 m!1067601))

(declare-fun m!1067603 () Bool)

(assert (=> b!1158969 m!1067603))

(declare-fun m!1067605 () Bool)

(assert (=> b!1158955 m!1067605))

(assert (=> b!1158972 m!1067605))

(declare-fun m!1067607 () Bool)

(assert (=> b!1158974 m!1067607))

(declare-fun m!1067609 () Bool)

(assert (=> b!1158974 m!1067609))

(declare-fun m!1067611 () Bool)

(assert (=> b!1158957 m!1067611))

(declare-fun m!1067613 () Bool)

(assert (=> b!1158949 m!1067613))

(declare-fun m!1067615 () Bool)

(assert (=> bm!55793 m!1067615))

(declare-fun m!1067617 () Bool)

(assert (=> b!1158952 m!1067617))

(assert (=> b!1158952 m!1067617))

(declare-fun m!1067619 () Bool)

(assert (=> b!1158952 m!1067619))

(declare-fun m!1067621 () Bool)

(assert (=> b!1158952 m!1067621))

(declare-fun m!1067623 () Bool)

(assert (=> b!1158951 m!1067623))

(declare-fun m!1067625 () Bool)

(assert (=> b!1158971 m!1067625))

(declare-fun m!1067627 () Bool)

(assert (=> b!1158971 m!1067627))

(declare-fun m!1067629 () Bool)

(assert (=> b!1158971 m!1067629))

(declare-fun m!1067631 () Bool)

(assert (=> b!1158971 m!1067631))

(declare-fun m!1067633 () Bool)

(assert (=> b!1158953 m!1067633))

(declare-fun m!1067635 () Bool)

(assert (=> b!1158953 m!1067635))

(declare-fun m!1067637 () Bool)

(assert (=> b!1158953 m!1067637))

(assert (=> b!1158953 m!1067635))

(declare-fun m!1067639 () Bool)

(assert (=> b!1158953 m!1067639))

(declare-fun m!1067641 () Bool)

(assert (=> b!1158953 m!1067641))

(declare-fun m!1067643 () Bool)

(assert (=> b!1158953 m!1067643))

(declare-fun m!1067645 () Bool)

(assert (=> b!1158953 m!1067645))

(declare-fun m!1067647 () Bool)

(assert (=> b!1158953 m!1067647))

(assert (=> b!1158953 m!1067641))

(assert (=> b!1158953 m!1067643))

(assert (=> b!1158953 m!1067643))

(declare-fun m!1067649 () Bool)

(assert (=> b!1158953 m!1067649))

(declare-fun m!1067651 () Bool)

(assert (=> b!1158963 m!1067651))

(declare-fun m!1067653 () Bool)

(assert (=> bm!55796 m!1067653))

(declare-fun m!1067655 () Bool)

(assert (=> b!1158948 m!1067655))

(declare-fun m!1067657 () Bool)

(assert (=> b!1158948 m!1067657))

(declare-fun m!1067659 () Bool)

(assert (=> b!1158948 m!1067659))

(declare-fun m!1067661 () Bool)

(assert (=> b!1158948 m!1067661))

(assert (=> b!1158960 m!1067643))

(declare-fun m!1067663 () Bool)

(assert (=> b!1158960 m!1067663))

(assert (=> b!1158966 m!1067599))

(declare-fun m!1067665 () Bool)

(assert (=> b!1158965 m!1067665))

(declare-fun m!1067667 () Bool)

(assert (=> b!1158965 m!1067667))

(declare-fun m!1067669 () Bool)

(assert (=> bm!55792 m!1067669))

(declare-fun m!1067671 () Bool)

(assert (=> mapNonEmpty!45404 m!1067671))

(declare-fun m!1067673 () Bool)

(assert (=> b!1158975 m!1067673))

(assert (=> bm!55798 m!1067633))

(check-sat (not b!1158951) (not b!1158963) (not b!1158952) (not b!1158969) (not b!1158949) (not b_lambda!19611) (not bm!55796) (not bm!55793) (not mapNonEmpty!45404) (not b!1158968) tp_is_empty!29053 (not bm!55792) (not b!1158975) (not b!1158972) (not b!1158971) (not b!1158974) (not b!1158955) (not bm!55794) (not b!1158965) (not b!1158953) (not bm!55798) (not b!1158966) (not b!1158948) b_and!39875 (not b!1158960) (not start!98912) (not b_next!24523))
(check-sat b_and!39875 (not b_next!24523))
