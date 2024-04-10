; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98980 () Bool)

(assert start!98980)

(declare-fun b_free!24585 () Bool)

(declare-fun b_next!24585 () Bool)

(assert (=> start!98980 (= b_free!24585 (not b_next!24585))))

(declare-fun tp!86465 () Bool)

(declare-fun b_and!40019 () Bool)

(assert (=> start!98980 (= tp!86465 b_and!40019)))

(declare-datatypes ((V!43947 0))(
  ( (V!43948 (val!14614 Int)) )
))
(declare-fun zeroValue!944 () V!43947)

(declare-fun c!116125 () Bool)

(declare-fun c!116128 () Bool)

(declare-fun bm!56559 () Bool)

(declare-datatypes ((tuple2!18624 0))(
  ( (tuple2!18625 (_1!9323 (_ BitVec 64)) (_2!9323 V!43947)) )
))
(declare-datatypes ((List!25358 0))(
  ( (Nil!25355) (Cons!25354 (h!26563 tuple2!18624) (t!36935 List!25358)) )
))
(declare-datatypes ((ListLongMap!16593 0))(
  ( (ListLongMap!16594 (toList!8312 List!25358)) )
))
(declare-fun lt!523039 () ListLongMap!16593)

(declare-fun lt!523050 () ListLongMap!16593)

(declare-fun call!56562 () ListLongMap!16593)

(declare-fun minValue!944 () V!43947)

(declare-fun +!3716 (ListLongMap!16593 tuple2!18624) ListLongMap!16593)

(assert (=> bm!56559 (= call!56562 (+!3716 (ite c!116128 lt!523050 lt!523039) (ite c!116128 (tuple2!18625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116125 (tuple2!18625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-datatypes ((array!75069 0))(
  ( (array!75070 (arr!36185 (Array (_ BitVec 32) (_ BitVec 64))) (size!36721 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75069)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!660709 () Bool)

(declare-fun b!1161923 () Bool)

(declare-fun arrayContainsKey!0 (array!75069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161923 (= e!660709 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161924 () Bool)

(declare-datatypes ((Unit!38324 0))(
  ( (Unit!38325) )
))
(declare-fun e!660717 () Unit!38324)

(declare-fun Unit!38326 () Unit!38324)

(assert (=> b!1161924 (= e!660717 Unit!38326)))

(declare-fun bm!56560 () Bool)

(declare-fun call!56569 () Unit!38324)

(declare-fun addStillContains!957 (ListLongMap!16593 (_ BitVec 64) V!43947 (_ BitVec 64)) Unit!38324)

(assert (=> bm!56560 (= call!56569 (addStillContains!957 (ite c!116128 lt!523050 lt!523039) (ite c!116128 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116125 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116128 minValue!944 (ite c!116125 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1161925 () Bool)

(declare-fun lt!523056 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161925 (= c!116125 (and (not lt!523056) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660708 () Unit!38324)

(declare-fun e!660710 () Unit!38324)

(assert (=> b!1161925 (= e!660708 e!660710)))

(declare-fun mapNonEmpty!45497 () Bool)

(declare-fun mapRes!45497 () Bool)

(declare-fun tp!86466 () Bool)

(declare-fun e!660715 () Bool)

(assert (=> mapNonEmpty!45497 (= mapRes!45497 (and tp!86466 e!660715))))

(declare-fun mapKey!45497 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13848 0))(
  ( (ValueCellFull!13848 (v!17251 V!43947)) (EmptyCell!13848) )
))
(declare-fun mapRest!45497 () (Array (_ BitVec 32) ValueCell!13848))

(declare-fun mapValue!45497 () ValueCell!13848)

(declare-datatypes ((array!75071 0))(
  ( (array!75072 (arr!36186 (Array (_ BitVec 32) ValueCell!13848)) (size!36722 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75071)

(assert (=> mapNonEmpty!45497 (= (arr!36186 _values!996) (store mapRest!45497 mapKey!45497 mapValue!45497))))

(declare-fun b!1161926 () Bool)

(declare-fun e!660702 () Bool)

(declare-fun call!56565 () ListLongMap!16593)

(declare-fun call!56564 () ListLongMap!16593)

(declare-fun -!1418 (ListLongMap!16593 (_ BitVec 64)) ListLongMap!16593)

(assert (=> b!1161926 (= e!660702 (= call!56565 (-!1418 call!56564 k0!934)))))

(declare-fun b!1161927 () Bool)

(declare-fun e!660714 () Bool)

(assert (=> b!1161927 (= e!660714 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161928 () Bool)

(declare-fun res!770831 () Bool)

(declare-fun e!660705 () Bool)

(assert (=> b!1161928 (=> (not res!770831) (not e!660705))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75069 (_ BitVec 32)) Bool)

(assert (=> b!1161928 (= res!770831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161929 () Bool)

(declare-fun call!56567 () Bool)

(assert (=> b!1161929 call!56567))

(declare-fun lt!523058 () Unit!38324)

(declare-fun call!56566 () Unit!38324)

(assert (=> b!1161929 (= lt!523058 call!56566)))

(assert (=> b!1161929 (= e!660717 lt!523058)))

(declare-fun b!1161930 () Bool)

(declare-fun e!660713 () Bool)

(declare-fun e!660704 () Bool)

(assert (=> b!1161930 (= e!660713 e!660704)))

(declare-fun res!770843 () Bool)

(assert (=> b!1161930 (=> res!770843 e!660704)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161930 (= res!770843 (not (= from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!523059 () array!75071)

(declare-fun lt!523049 () ListLongMap!16593)

(declare-fun lt!523057 () array!75069)

(declare-fun getCurrentListMapNoExtraKeys!4776 (array!75069 array!75071 (_ BitVec 32) (_ BitVec 32) V!43947 V!43947 (_ BitVec 32) Int) ListLongMap!16593)

(assert (=> b!1161930 (= lt!523049 (getCurrentListMapNoExtraKeys!4776 lt!523057 lt!523059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523044 () V!43947)

(assert (=> b!1161930 (= lt!523059 (array!75072 (store (arr!36186 _values!996) i!673 (ValueCellFull!13848 lt!523044)) (size!36722 _values!996)))))

(declare-fun dynLambda!2772 (Int (_ BitVec 64)) V!43947)

(assert (=> b!1161930 (= lt!523044 (dynLambda!2772 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523055 () ListLongMap!16593)

(assert (=> b!1161930 (= lt!523055 (getCurrentListMapNoExtraKeys!4776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1161931 () Bool)

(declare-fun contains!6817 (ListLongMap!16593 (_ BitVec 64)) Bool)

(assert (=> b!1161931 (contains!6817 call!56562 k0!934)))

(declare-fun lt!523048 () Unit!38324)

(assert (=> b!1161931 (= lt!523048 call!56569)))

(declare-fun call!56563 () Bool)

(assert (=> b!1161931 call!56563))

(assert (=> b!1161931 (= lt!523050 (+!3716 lt!523039 (tuple2!18625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523046 () Unit!38324)

(assert (=> b!1161931 (= lt!523046 (addStillContains!957 lt!523039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1161931 (= e!660708 lt!523048)))

(declare-fun b!1161932 () Bool)

(declare-fun res!770836 () Bool)

(assert (=> b!1161932 (=> (not res!770836) (not e!660705))))

(assert (=> b!1161932 (= res!770836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36721 _keys!1208))))))

(declare-fun b!1161933 () Bool)

(declare-fun lt!523045 () Unit!38324)

(assert (=> b!1161933 (= e!660710 lt!523045)))

(assert (=> b!1161933 (= lt!523045 call!56566)))

(assert (=> b!1161933 call!56567))

(declare-fun b!1161934 () Bool)

(declare-fun e!660712 () Bool)

(declare-fun e!660701 () Bool)

(assert (=> b!1161934 (= e!660712 (and e!660701 mapRes!45497))))

(declare-fun condMapEmpty!45497 () Bool)

(declare-fun mapDefault!45497 () ValueCell!13848)

(assert (=> b!1161934 (= condMapEmpty!45497 (= (arr!36186 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13848)) mapDefault!45497)))))

(declare-fun e!660703 () Bool)

(declare-fun lt!523041 () ListLongMap!16593)

(declare-fun b!1161935 () Bool)

(assert (=> b!1161935 (= e!660703 (= lt!523041 (getCurrentListMapNoExtraKeys!4776 lt!523057 lt!523059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56561 () Bool)

(assert (=> bm!56561 (= call!56565 (getCurrentListMapNoExtraKeys!4776 lt!523057 lt!523059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161936 () Bool)

(declare-fun res!770829 () Bool)

(assert (=> b!1161936 (=> (not res!770829) (not e!660705))))

(declare-datatypes ((List!25359 0))(
  ( (Nil!25356) (Cons!25355 (h!26564 (_ BitVec 64)) (t!36936 List!25359)) )
))
(declare-fun arrayNoDuplicates!0 (array!75069 (_ BitVec 32) List!25359) Bool)

(assert (=> b!1161936 (= res!770829 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25356))))

(declare-fun b!1161937 () Bool)

(declare-fun e!660706 () Unit!38324)

(declare-fun Unit!38327 () Unit!38324)

(assert (=> b!1161937 (= e!660706 Unit!38327)))

(declare-fun bm!56562 () Bool)

(declare-fun call!56568 () ListLongMap!16593)

(assert (=> bm!56562 (= call!56568 call!56562)))

(declare-fun res!770837 () Bool)

(assert (=> start!98980 (=> (not res!770837) (not e!660705))))

(assert (=> start!98980 (= res!770837 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36721 _keys!1208))))))

(assert (=> start!98980 e!660705))

(declare-fun tp_is_empty!29115 () Bool)

(assert (=> start!98980 tp_is_empty!29115))

(declare-fun array_inv!27688 (array!75069) Bool)

(assert (=> start!98980 (array_inv!27688 _keys!1208)))

(assert (=> start!98980 true))

(assert (=> start!98980 tp!86465))

(declare-fun array_inv!27689 (array!75071) Bool)

(assert (=> start!98980 (and (array_inv!27689 _values!996) e!660712)))

(declare-fun b!1161922 () Bool)

(declare-fun e!660711 () Bool)

(assert (=> b!1161922 (= e!660711 true)))

(assert (=> b!1161922 e!660703))

(declare-fun res!770842 () Bool)

(assert (=> b!1161922 (=> (not res!770842) (not e!660703))))

(assert (=> b!1161922 (= res!770842 (= lt!523041 lt!523039))))

(assert (=> b!1161922 (= lt!523041 (-!1418 lt!523055 k0!934))))

(declare-fun lt!523052 () V!43947)

(assert (=> b!1161922 (= (-!1418 (+!3716 lt!523039 (tuple2!18625 (select (arr!36185 _keys!1208) from!1455) lt!523052)) (select (arr!36185 _keys!1208) from!1455)) lt!523039)))

(declare-fun lt!523051 () Unit!38324)

(declare-fun addThenRemoveForNewKeyIsSame!252 (ListLongMap!16593 (_ BitVec 64) V!43947) Unit!38324)

(assert (=> b!1161922 (= lt!523051 (addThenRemoveForNewKeyIsSame!252 lt!523039 (select (arr!36185 _keys!1208) from!1455) lt!523052))))

(declare-fun get!18460 (ValueCell!13848 V!43947) V!43947)

(assert (=> b!1161922 (= lt!523052 (get!18460 (select (arr!36186 _values!996) from!1455) lt!523044))))

(declare-fun lt!523042 () Unit!38324)

(assert (=> b!1161922 (= lt!523042 e!660706)))

(declare-fun c!116124 () Bool)

(assert (=> b!1161922 (= c!116124 (contains!6817 lt!523039 k0!934))))

(assert (=> b!1161922 (= lt!523039 (getCurrentListMapNoExtraKeys!4776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161938 () Bool)

(assert (=> b!1161938 (= e!660701 tp_is_empty!29115)))

(declare-fun b!1161939 () Bool)

(declare-fun res!770830 () Bool)

(assert (=> b!1161939 (=> (not res!770830) (not e!660705))))

(assert (=> b!1161939 (= res!770830 (and (= (size!36722 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36721 _keys!1208) (size!36722 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161940 () Bool)

(assert (=> b!1161940 (= e!660710 e!660717)))

(declare-fun c!116126 () Bool)

(assert (=> b!1161940 (= c!116126 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523056))))

(declare-fun b!1161941 () Bool)

(assert (=> b!1161941 (= e!660714 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523056) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161942 () Bool)

(declare-fun e!660707 () Bool)

(assert (=> b!1161942 (= e!660705 e!660707)))

(declare-fun res!770839 () Bool)

(assert (=> b!1161942 (=> (not res!770839) (not e!660707))))

(assert (=> b!1161942 (= res!770839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523057 mask!1564))))

(assert (=> b!1161942 (= lt!523057 (array!75070 (store (arr!36185 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36721 _keys!1208)))))

(declare-fun b!1161943 () Bool)

(assert (=> b!1161943 (= e!660715 tp_is_empty!29115)))

(declare-fun bm!56563 () Bool)

(assert (=> bm!56563 (= call!56563 (contains!6817 (ite c!116128 lt!523050 call!56568) k0!934))))

(declare-fun b!1161944 () Bool)

(declare-fun res!770833 () Bool)

(assert (=> b!1161944 (=> (not res!770833) (not e!660705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161944 (= res!770833 (validKeyInArray!0 k0!934))))

(declare-fun b!1161945 () Bool)

(assert (=> b!1161945 (= e!660707 (not e!660713))))

(declare-fun res!770834 () Bool)

(assert (=> b!1161945 (=> res!770834 e!660713)))

(assert (=> b!1161945 (= res!770834 (bvsgt from!1455 i!673))))

(assert (=> b!1161945 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523038 () Unit!38324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75069 (_ BitVec 64) (_ BitVec 32)) Unit!38324)

(assert (=> b!1161945 (= lt!523038 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161946 () Bool)

(assert (=> b!1161946 (= e!660702 (= call!56565 call!56564))))

(declare-fun bm!56564 () Bool)

(assert (=> bm!56564 (= call!56566 call!56569)))

(declare-fun b!1161947 () Bool)

(assert (=> b!1161947 (= e!660704 e!660711)))

(declare-fun res!770841 () Bool)

(assert (=> b!1161947 (=> res!770841 e!660711)))

(assert (=> b!1161947 (= res!770841 (not (= (select (arr!36185 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161947 e!660702))

(declare-fun c!116123 () Bool)

(assert (=> b!1161947 (= c!116123 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523043 () Unit!38324)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!648 (array!75069 array!75071 (_ BitVec 32) (_ BitVec 32) V!43947 V!43947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38324)

(assert (=> b!1161947 (= lt!523043 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!648 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56565 () Bool)

(assert (=> bm!56565 (= call!56564 (getCurrentListMapNoExtraKeys!4776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161948 () Bool)

(declare-fun res!770832 () Bool)

(assert (=> b!1161948 (=> (not res!770832) (not e!660705))))

(assert (=> b!1161948 (= res!770832 (= (select (arr!36185 _keys!1208) i!673) k0!934))))

(declare-fun b!1161949 () Bool)

(declare-fun res!770835 () Bool)

(assert (=> b!1161949 (=> (not res!770835) (not e!660705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161949 (= res!770835 (validMask!0 mask!1564))))

(declare-fun bm!56566 () Bool)

(assert (=> bm!56566 (= call!56567 call!56563)))

(declare-fun mapIsEmpty!45497 () Bool)

(assert (=> mapIsEmpty!45497 mapRes!45497))

(declare-fun b!1161950 () Bool)

(declare-fun res!770840 () Bool)

(assert (=> b!1161950 (=> (not res!770840) (not e!660707))))

(assert (=> b!1161950 (= res!770840 (arrayNoDuplicates!0 lt!523057 #b00000000000000000000000000000000 Nil!25356))))

(declare-fun b!1161951 () Bool)

(declare-fun Unit!38328 () Unit!38324)

(assert (=> b!1161951 (= e!660706 Unit!38328)))

(assert (=> b!1161951 (= lt!523056 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161951 (= c!116128 (and (not lt!523056) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523047 () Unit!38324)

(assert (=> b!1161951 (= lt!523047 e!660708)))

(declare-fun lt!523054 () Unit!38324)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!542 (array!75069 array!75071 (_ BitVec 32) (_ BitVec 32) V!43947 V!43947 (_ BitVec 64) (_ BitVec 32) Int) Unit!38324)

(assert (=> b!1161951 (= lt!523054 (lemmaListMapContainsThenArrayContainsFrom!542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116127 () Bool)

(assert (=> b!1161951 (= c!116127 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770838 () Bool)

(assert (=> b!1161951 (= res!770838 e!660714)))

(assert (=> b!1161951 (=> (not res!770838) (not e!660709))))

(assert (=> b!1161951 e!660709))

(declare-fun lt!523040 () Unit!38324)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75069 (_ BitVec 32) (_ BitVec 32)) Unit!38324)

(assert (=> b!1161951 (= lt!523040 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161951 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25356)))

(declare-fun lt!523053 () Unit!38324)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75069 (_ BitVec 64) (_ BitVec 32) List!25359) Unit!38324)

(assert (=> b!1161951 (= lt!523053 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25356))))

(assert (=> b!1161951 false))

(assert (= (and start!98980 res!770837) b!1161949))

(assert (= (and b!1161949 res!770835) b!1161939))

(assert (= (and b!1161939 res!770830) b!1161928))

(assert (= (and b!1161928 res!770831) b!1161936))

(assert (= (and b!1161936 res!770829) b!1161932))

(assert (= (and b!1161932 res!770836) b!1161944))

(assert (= (and b!1161944 res!770833) b!1161948))

(assert (= (and b!1161948 res!770832) b!1161942))

(assert (= (and b!1161942 res!770839) b!1161950))

(assert (= (and b!1161950 res!770840) b!1161945))

(assert (= (and b!1161945 (not res!770834)) b!1161930))

(assert (= (and b!1161930 (not res!770843)) b!1161947))

(assert (= (and b!1161947 c!116123) b!1161926))

(assert (= (and b!1161947 (not c!116123)) b!1161946))

(assert (= (or b!1161926 b!1161946) bm!56565))

(assert (= (or b!1161926 b!1161946) bm!56561))

(assert (= (and b!1161947 (not res!770841)) b!1161922))

(assert (= (and b!1161922 c!116124) b!1161951))

(assert (= (and b!1161922 (not c!116124)) b!1161937))

(assert (= (and b!1161951 c!116128) b!1161931))

(assert (= (and b!1161951 (not c!116128)) b!1161925))

(assert (= (and b!1161925 c!116125) b!1161933))

(assert (= (and b!1161925 (not c!116125)) b!1161940))

(assert (= (and b!1161940 c!116126) b!1161929))

(assert (= (and b!1161940 (not c!116126)) b!1161924))

(assert (= (or b!1161933 b!1161929) bm!56564))

(assert (= (or b!1161933 b!1161929) bm!56562))

(assert (= (or b!1161933 b!1161929) bm!56566))

(assert (= (or b!1161931 bm!56566) bm!56563))

(assert (= (or b!1161931 bm!56564) bm!56560))

(assert (= (or b!1161931 bm!56562) bm!56559))

(assert (= (and b!1161951 c!116127) b!1161927))

(assert (= (and b!1161951 (not c!116127)) b!1161941))

(assert (= (and b!1161951 res!770838) b!1161923))

(assert (= (and b!1161922 res!770842) b!1161935))

(assert (= (and b!1161934 condMapEmpty!45497) mapIsEmpty!45497))

(assert (= (and b!1161934 (not condMapEmpty!45497)) mapNonEmpty!45497))

(get-info :version)

(assert (= (and mapNonEmpty!45497 ((_ is ValueCellFull!13848) mapValue!45497)) b!1161943))

(assert (= (and b!1161934 ((_ is ValueCellFull!13848) mapDefault!45497)) b!1161938))

(assert (= start!98980 b!1161934))

(declare-fun b_lambda!19691 () Bool)

(assert (=> (not b_lambda!19691) (not b!1161930)))

(declare-fun t!36934 () Bool)

(declare-fun tb!9397 () Bool)

(assert (=> (and start!98980 (= defaultEntry!1004 defaultEntry!1004) t!36934) tb!9397))

(declare-fun result!19359 () Bool)

(assert (=> tb!9397 (= result!19359 tp_is_empty!29115)))

(assert (=> b!1161930 t!36934))

(declare-fun b_and!40021 () Bool)

(assert (= b_and!40019 (and (=> t!36934 result!19359) b_and!40021)))

(declare-fun m!1070685 () Bool)

(assert (=> bm!56565 m!1070685))

(declare-fun m!1070687 () Bool)

(assert (=> bm!56560 m!1070687))

(declare-fun m!1070689 () Bool)

(assert (=> b!1161950 m!1070689))

(declare-fun m!1070691 () Bool)

(assert (=> b!1161945 m!1070691))

(declare-fun m!1070693 () Bool)

(assert (=> b!1161945 m!1070693))

(declare-fun m!1070695 () Bool)

(assert (=> bm!56561 m!1070695))

(declare-fun m!1070697 () Bool)

(assert (=> b!1161923 m!1070697))

(declare-fun m!1070699 () Bool)

(assert (=> b!1161942 m!1070699))

(declare-fun m!1070701 () Bool)

(assert (=> b!1161942 m!1070701))

(declare-fun m!1070703 () Bool)

(assert (=> b!1161947 m!1070703))

(declare-fun m!1070705 () Bool)

(assert (=> b!1161947 m!1070705))

(declare-fun m!1070707 () Bool)

(assert (=> bm!56559 m!1070707))

(declare-fun m!1070709 () Bool)

(assert (=> b!1161951 m!1070709))

(declare-fun m!1070711 () Bool)

(assert (=> b!1161951 m!1070711))

(declare-fun m!1070713 () Bool)

(assert (=> b!1161951 m!1070713))

(declare-fun m!1070715 () Bool)

(assert (=> b!1161951 m!1070715))

(declare-fun m!1070717 () Bool)

(assert (=> mapNonEmpty!45497 m!1070717))

(declare-fun m!1070719 () Bool)

(assert (=> b!1161930 m!1070719))

(declare-fun m!1070721 () Bool)

(assert (=> b!1161930 m!1070721))

(declare-fun m!1070723 () Bool)

(assert (=> b!1161930 m!1070723))

(declare-fun m!1070725 () Bool)

(assert (=> b!1161930 m!1070725))

(declare-fun m!1070727 () Bool)

(assert (=> b!1161922 m!1070727))

(declare-fun m!1070729 () Bool)

(assert (=> b!1161922 m!1070729))

(assert (=> b!1161922 m!1070703))

(declare-fun m!1070731 () Bool)

(assert (=> b!1161922 m!1070731))

(declare-fun m!1070733 () Bool)

(assert (=> b!1161922 m!1070733))

(assert (=> b!1161922 m!1070703))

(assert (=> b!1161922 m!1070685))

(assert (=> b!1161922 m!1070729))

(declare-fun m!1070735 () Bool)

(assert (=> b!1161922 m!1070735))

(assert (=> b!1161922 m!1070733))

(assert (=> b!1161922 m!1070703))

(declare-fun m!1070737 () Bool)

(assert (=> b!1161922 m!1070737))

(declare-fun m!1070739 () Bool)

(assert (=> b!1161922 m!1070739))

(declare-fun m!1070741 () Bool)

(assert (=> b!1161944 m!1070741))

(declare-fun m!1070743 () Bool)

(assert (=> b!1161949 m!1070743))

(declare-fun m!1070745 () Bool)

(assert (=> b!1161928 m!1070745))

(declare-fun m!1070747 () Bool)

(assert (=> b!1161926 m!1070747))

(declare-fun m!1070749 () Bool)

(assert (=> b!1161931 m!1070749))

(declare-fun m!1070751 () Bool)

(assert (=> b!1161931 m!1070751))

(declare-fun m!1070753 () Bool)

(assert (=> b!1161931 m!1070753))

(assert (=> b!1161935 m!1070695))

(declare-fun m!1070755 () Bool)

(assert (=> bm!56563 m!1070755))

(declare-fun m!1070757 () Bool)

(assert (=> start!98980 m!1070757))

(declare-fun m!1070759 () Bool)

(assert (=> start!98980 m!1070759))

(declare-fun m!1070761 () Bool)

(assert (=> b!1161948 m!1070761))

(assert (=> b!1161927 m!1070697))

(declare-fun m!1070763 () Bool)

(assert (=> b!1161936 m!1070763))

(check-sat (not bm!56561) (not b!1161950) b_and!40021 (not mapNonEmpty!45497) (not b!1161926) (not b!1161936) (not b!1161947) (not bm!56565) (not b_next!24585) (not b!1161942) (not b!1161923) (not b!1161922) (not b!1161945) (not b!1161944) (not b!1161935) (not b!1161927) (not b!1161928) (not bm!56560) (not b!1161951) (not bm!56563) (not b!1161931) (not b!1161930) (not start!98980) (not b_lambda!19691) tp_is_empty!29115 (not b!1161949) (not bm!56559))
(check-sat b_and!40021 (not b_next!24585))
