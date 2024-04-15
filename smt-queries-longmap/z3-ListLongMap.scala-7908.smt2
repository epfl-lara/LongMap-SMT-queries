; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98186 () Bool)

(assert start!98186)

(declare-fun b_free!23893 () Bool)

(declare-fun b_next!23893 () Bool)

(assert (=> start!98186 (= b_free!23893 (not b_next!23893))))

(declare-fun tp!84383 () Bool)

(declare-fun b_and!38547 () Bool)

(assert (=> start!98186 (= tp!84383 b_and!38547)))

(declare-datatypes ((V!43025 0))(
  ( (V!43026 (val!14268 Int)) )
))
(declare-fun zeroValue!944 () V!43025)

(declare-fun c!109919 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!109918 () Bool)

(declare-fun bm!48163 () Bool)

(declare-datatypes ((tuple2!18060 0))(
  ( (tuple2!18061 (_1!9041 (_ BitVec 64)) (_2!9041 V!43025)) )
))
(declare-datatypes ((List!24811 0))(
  ( (Nil!24808) (Cons!24807 (h!26016 tuple2!18060) (t!35687 List!24811)) )
))
(declare-datatypes ((ListLongMap!16029 0))(
  ( (ListLongMap!16030 (toList!8030 List!24811)) )
))
(declare-fun lt!501495 () ListLongMap!16029)

(declare-datatypes ((Unit!36857 0))(
  ( (Unit!36858) )
))
(declare-fun call!48166 () Unit!36857)

(declare-fun minValue!944 () V!43025)

(declare-fun addStillContains!688 (ListLongMap!16029 (_ BitVec 64) V!43025 (_ BitVec 64)) Unit!36857)

(assert (=> bm!48163 (= call!48166 (addStillContains!688 lt!501495 (ite (or c!109918 c!109919) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109918 c!109919) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1129787 () Bool)

(declare-fun e!642977 () Bool)

(assert (=> b!1129787 (= e!642977 true)))

(declare-datatypes ((array!73628 0))(
  ( (array!73629 (arr!35467 (Array (_ BitVec 32) (_ BitVec 64))) (size!36005 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73628)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!501496 () Bool)

(declare-datatypes ((ValueCell!13502 0))(
  ( (ValueCellFull!13502 (v!16900 V!43025)) (EmptyCell!13502) )
))
(declare-datatypes ((array!73630 0))(
  ( (array!73631 (arr!35468 (Array (_ BitVec 32) ValueCell!13502)) (size!36006 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73630)

(declare-fun contains!6482 (ListLongMap!16029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4359 (array!73628 array!73630 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) Int) ListLongMap!16029)

(assert (=> b!1129787 (= lt!501496 (contains!6482 (getCurrentListMap!4359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun call!48169 () ListLongMap!16029)

(declare-fun lt!501506 () array!73628)

(declare-fun lt!501507 () array!73630)

(declare-fun bm!48164 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4530 (array!73628 array!73630 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) Int) ListLongMap!16029)

(assert (=> bm!48164 (= call!48169 (getCurrentListMapNoExtraKeys!4530 lt!501506 lt!501507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129788 () Bool)

(declare-fun res!754947 () Bool)

(declare-fun e!642974 () Bool)

(assert (=> b!1129788 (=> (not res!754947) (not e!642974))))

(assert (=> b!1129788 (= res!754947 (and (= (size!36006 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36005 _keys!1208) (size!36006 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48165 () Bool)

(declare-fun call!48172 () Bool)

(declare-fun call!48167 () Bool)

(assert (=> bm!48165 (= call!48172 call!48167)))

(declare-fun b!1129789 () Bool)

(declare-fun e!642975 () Bool)

(assert (=> b!1129789 (= e!642974 e!642975)))

(declare-fun res!754949 () Bool)

(assert (=> b!1129789 (=> (not res!754949) (not e!642975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73628 (_ BitVec 32)) Bool)

(assert (=> b!1129789 (= res!754949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501506 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129789 (= lt!501506 (array!73629 (store (arr!35467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36005 _keys!1208)))))

(declare-fun b!1129790 () Bool)

(declare-fun res!754941 () Bool)

(assert (=> b!1129790 (=> (not res!754941) (not e!642974))))

(assert (=> b!1129790 (= res!754941 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36005 _keys!1208))))))

(declare-fun bm!48166 () Bool)

(declare-fun call!48171 () ListLongMap!16029)

(assert (=> bm!48166 (= call!48171 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129791 () Bool)

(declare-fun e!642970 () Bool)

(assert (=> b!1129791 (= e!642975 (not e!642970))))

(declare-fun res!754952 () Bool)

(assert (=> b!1129791 (=> res!754952 e!642970)))

(assert (=> b!1129791 (= res!754952 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129791 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501499 () Unit!36857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73628 (_ BitVec 64) (_ BitVec 32)) Unit!36857)

(assert (=> b!1129791 (= lt!501499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129792 () Bool)

(declare-fun res!754943 () Bool)

(assert (=> b!1129792 (=> (not res!754943) (not e!642974))))

(assert (=> b!1129792 (= res!754943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129793 () Bool)

(declare-fun e!642978 () Bool)

(declare-fun tp_is_empty!28423 () Bool)

(assert (=> b!1129793 (= e!642978 tp_is_empty!28423)))

(declare-fun b!1129794 () Bool)

(declare-fun e!642967 () Bool)

(declare-fun mapRes!44452 () Bool)

(assert (=> b!1129794 (= e!642967 (and e!642978 mapRes!44452))))

(declare-fun condMapEmpty!44452 () Bool)

(declare-fun mapDefault!44452 () ValueCell!13502)

(assert (=> b!1129794 (= condMapEmpty!44452 (= (arr!35468 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13502)) mapDefault!44452)))))

(declare-fun b!1129795 () Bool)

(assert (=> b!1129795 call!48172))

(declare-fun lt!501493 () Unit!36857)

(declare-fun call!48173 () Unit!36857)

(assert (=> b!1129795 (= lt!501493 call!48173)))

(declare-fun e!642969 () Unit!36857)

(assert (=> b!1129795 (= e!642969 lt!501493)))

(declare-fun b!1129796 () Bool)

(declare-fun e!642976 () Bool)

(declare-fun -!1142 (ListLongMap!16029 (_ BitVec 64)) ListLongMap!16029)

(assert (=> b!1129796 (= e!642976 (= call!48169 (-!1142 call!48171 k0!934)))))

(declare-fun b!1129797 () Bool)

(declare-fun e!642980 () Unit!36857)

(declare-fun Unit!36859 () Unit!36857)

(assert (=> b!1129797 (= e!642980 Unit!36859)))

(declare-fun b!1129798 () Bool)

(declare-fun res!754945 () Bool)

(assert (=> b!1129798 (=> (not res!754945) (not e!642974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129798 (= res!754945 (validKeyInArray!0 k0!934))))

(declare-fun b!1129799 () Bool)

(declare-fun lt!501498 () Unit!36857)

(assert (=> b!1129799 (= e!642980 lt!501498)))

(assert (=> b!1129799 (= lt!501498 call!48173)))

(assert (=> b!1129799 call!48172))

(declare-fun b!1129800 () Bool)

(declare-fun c!109917 () Bool)

(declare-fun lt!501505 () Bool)

(assert (=> b!1129800 (= c!109917 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501505))))

(assert (=> b!1129800 (= e!642969 e!642980)))

(declare-fun b!1129801 () Bool)

(declare-fun e!642981 () Bool)

(declare-fun e!642979 () Bool)

(assert (=> b!1129801 (= e!642981 e!642979)))

(declare-fun res!754953 () Bool)

(assert (=> b!1129801 (=> res!754953 e!642979)))

(assert (=> b!1129801 (= res!754953 (not (contains!6482 lt!501495 k0!934)))))

(assert (=> b!1129801 (= lt!501495 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48167 () Bool)

(declare-fun call!48168 () ListLongMap!16029)

(declare-fun call!48170 () ListLongMap!16029)

(assert (=> bm!48167 (= call!48168 call!48170)))

(declare-fun b!1129802 () Bool)

(declare-fun e!642968 () Bool)

(assert (=> b!1129802 (= e!642968 tp_is_empty!28423)))

(declare-fun b!1129803 () Bool)

(declare-fun e!642972 () Unit!36857)

(assert (=> b!1129803 (= e!642972 e!642969)))

(assert (=> b!1129803 (= c!109919 (and (not lt!501505) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48168 () Bool)

(declare-fun lt!501502 () ListLongMap!16029)

(assert (=> bm!48168 (= call!48167 (contains!6482 (ite c!109918 lt!501502 call!48168) k0!934))))

(declare-fun b!1129804 () Bool)

(declare-fun e!642971 () Bool)

(assert (=> b!1129804 (= e!642970 e!642971)))

(declare-fun res!754951 () Bool)

(assert (=> b!1129804 (=> res!754951 e!642971)))

(assert (=> b!1129804 (= res!754951 (not (= from!1455 i!673)))))

(declare-fun lt!501503 () ListLongMap!16029)

(assert (=> b!1129804 (= lt!501503 (getCurrentListMapNoExtraKeys!4530 lt!501506 lt!501507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2535 (Int (_ BitVec 64)) V!43025)

(assert (=> b!1129804 (= lt!501507 (array!73631 (store (arr!35468 _values!996) i!673 (ValueCellFull!13502 (dynLambda!2535 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36006 _values!996)))))

(declare-fun lt!501500 () ListLongMap!16029)

(assert (=> b!1129804 (= lt!501500 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129805 () Bool)

(declare-fun res!754954 () Bool)

(assert (=> b!1129805 (=> (not res!754954) (not e!642975))))

(declare-datatypes ((List!24812 0))(
  ( (Nil!24809) (Cons!24808 (h!26017 (_ BitVec 64)) (t!35688 List!24812)) )
))
(declare-fun arrayNoDuplicates!0 (array!73628 (_ BitVec 32) List!24812) Bool)

(assert (=> b!1129805 (= res!754954 (arrayNoDuplicates!0 lt!501506 #b00000000000000000000000000000000 Nil!24809))))

(declare-fun bm!48169 () Bool)

(assert (=> bm!48169 (= call!48173 call!48166)))

(declare-fun b!1129806 () Bool)

(assert (=> b!1129806 (= e!642976 (= call!48169 call!48171))))

(declare-fun b!1129807 () Bool)

(declare-fun res!754940 () Bool)

(assert (=> b!1129807 (=> (not res!754940) (not e!642974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129807 (= res!754940 (validMask!0 mask!1564))))

(declare-fun b!1129808 () Bool)

(declare-fun res!754946 () Bool)

(assert (=> b!1129808 (=> (not res!754946) (not e!642974))))

(assert (=> b!1129808 (= res!754946 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24809))))

(declare-fun mapIsEmpty!44452 () Bool)

(assert (=> mapIsEmpty!44452 mapRes!44452))

(declare-fun bm!48170 () Bool)

(declare-fun +!3471 (ListLongMap!16029 tuple2!18060) ListLongMap!16029)

(assert (=> bm!48170 (= call!48170 (+!3471 (ite c!109918 lt!501502 lt!501495) (ite c!109918 (tuple2!18061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!109919 (tuple2!18061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1129809 () Bool)

(assert (=> b!1129809 (= e!642971 e!642981)))

(declare-fun res!754950 () Bool)

(assert (=> b!1129809 (=> res!754950 e!642981)))

(assert (=> b!1129809 (= res!754950 (not (= (select (arr!35467 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129809 e!642976))

(declare-fun c!109920 () Bool)

(assert (=> b!1129809 (= c!109920 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501501 () Unit!36857)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!424 (array!73628 array!73630 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36857)

(assert (=> b!1129809 (= lt!501501 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129810 () Bool)

(declare-fun res!754942 () Bool)

(assert (=> b!1129810 (=> (not res!754942) (not e!642974))))

(assert (=> b!1129810 (= res!754942 (= (select (arr!35467 _keys!1208) i!673) k0!934))))

(declare-fun b!1129811 () Bool)

(declare-fun lt!501497 () Unit!36857)

(assert (=> b!1129811 (= e!642972 lt!501497)))

(declare-fun lt!501494 () Unit!36857)

(assert (=> b!1129811 (= lt!501494 call!48166)))

(assert (=> b!1129811 (= lt!501502 (+!3471 lt!501495 (tuple2!18061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1129811 call!48167))

(assert (=> b!1129811 (= lt!501497 (addStillContains!688 lt!501502 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1129811 (contains!6482 call!48170 k0!934)))

(declare-fun mapNonEmpty!44452 () Bool)

(declare-fun tp!84382 () Bool)

(assert (=> mapNonEmpty!44452 (= mapRes!44452 (and tp!84382 e!642968))))

(declare-fun mapKey!44452 () (_ BitVec 32))

(declare-fun mapRest!44452 () (Array (_ BitVec 32) ValueCell!13502))

(declare-fun mapValue!44452 () ValueCell!13502)

(assert (=> mapNonEmpty!44452 (= (arr!35468 _values!996) (store mapRest!44452 mapKey!44452 mapValue!44452))))

(declare-fun res!754948 () Bool)

(assert (=> start!98186 (=> (not res!754948) (not e!642974))))

(assert (=> start!98186 (= res!754948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36005 _keys!1208))))))

(assert (=> start!98186 e!642974))

(assert (=> start!98186 tp_is_empty!28423))

(declare-fun array_inv!27290 (array!73628) Bool)

(assert (=> start!98186 (array_inv!27290 _keys!1208)))

(assert (=> start!98186 true))

(assert (=> start!98186 tp!84383))

(declare-fun array_inv!27291 (array!73630) Bool)

(assert (=> start!98186 (and (array_inv!27291 _values!996) e!642967)))

(declare-fun b!1129812 () Bool)

(assert (=> b!1129812 (= e!642979 e!642977)))

(declare-fun res!754944 () Bool)

(assert (=> b!1129812 (=> res!754944 e!642977)))

(assert (=> b!1129812 (= res!754944 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36005 _keys!1208))))))

(declare-fun lt!501504 () Unit!36857)

(assert (=> b!1129812 (= lt!501504 e!642972)))

(assert (=> b!1129812 (= c!109918 (and (not lt!501505) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129812 (= lt!501505 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!98186 res!754948) b!1129807))

(assert (= (and b!1129807 res!754940) b!1129788))

(assert (= (and b!1129788 res!754947) b!1129792))

(assert (= (and b!1129792 res!754943) b!1129808))

(assert (= (and b!1129808 res!754946) b!1129790))

(assert (= (and b!1129790 res!754941) b!1129798))

(assert (= (and b!1129798 res!754945) b!1129810))

(assert (= (and b!1129810 res!754942) b!1129789))

(assert (= (and b!1129789 res!754949) b!1129805))

(assert (= (and b!1129805 res!754954) b!1129791))

(assert (= (and b!1129791 (not res!754952)) b!1129804))

(assert (= (and b!1129804 (not res!754951)) b!1129809))

(assert (= (and b!1129809 c!109920) b!1129796))

(assert (= (and b!1129809 (not c!109920)) b!1129806))

(assert (= (or b!1129796 b!1129806) bm!48164))

(assert (= (or b!1129796 b!1129806) bm!48166))

(assert (= (and b!1129809 (not res!754950)) b!1129801))

(assert (= (and b!1129801 (not res!754953)) b!1129812))

(assert (= (and b!1129812 c!109918) b!1129811))

(assert (= (and b!1129812 (not c!109918)) b!1129803))

(assert (= (and b!1129803 c!109919) b!1129795))

(assert (= (and b!1129803 (not c!109919)) b!1129800))

(assert (= (and b!1129800 c!109917) b!1129799))

(assert (= (and b!1129800 (not c!109917)) b!1129797))

(assert (= (or b!1129795 b!1129799) bm!48169))

(assert (= (or b!1129795 b!1129799) bm!48167))

(assert (= (or b!1129795 b!1129799) bm!48165))

(assert (= (or b!1129811 bm!48165) bm!48168))

(assert (= (or b!1129811 bm!48169) bm!48163))

(assert (= (or b!1129811 bm!48167) bm!48170))

(assert (= (and b!1129812 (not res!754944)) b!1129787))

(assert (= (and b!1129794 condMapEmpty!44452) mapIsEmpty!44452))

(assert (= (and b!1129794 (not condMapEmpty!44452)) mapNonEmpty!44452))

(get-info :version)

(assert (= (and mapNonEmpty!44452 ((_ is ValueCellFull!13502) mapValue!44452)) b!1129802))

(assert (= (and b!1129794 ((_ is ValueCellFull!13502) mapDefault!44452)) b!1129793))

(assert (= start!98186 b!1129794))

(declare-fun b_lambda!18845 () Bool)

(assert (=> (not b_lambda!18845) (not b!1129804)))

(declare-fun t!35686 () Bool)

(declare-fun tb!8697 () Bool)

(assert (=> (and start!98186 (= defaultEntry!1004 defaultEntry!1004) t!35686) tb!8697))

(declare-fun result!17963 () Bool)

(assert (=> tb!8697 (= result!17963 tp_is_empty!28423)))

(assert (=> b!1129804 t!35686))

(declare-fun b_and!38549 () Bool)

(assert (= b_and!38547 (and (=> t!35686 result!17963) b_and!38549)))

(declare-fun m!1042557 () Bool)

(assert (=> start!98186 m!1042557))

(declare-fun m!1042559 () Bool)

(assert (=> start!98186 m!1042559))

(declare-fun m!1042561 () Bool)

(assert (=> b!1129796 m!1042561))

(declare-fun m!1042563 () Bool)

(assert (=> bm!48164 m!1042563))

(declare-fun m!1042565 () Bool)

(assert (=> b!1129805 m!1042565))

(declare-fun m!1042567 () Bool)

(assert (=> b!1129807 m!1042567))

(declare-fun m!1042569 () Bool)

(assert (=> b!1129789 m!1042569))

(declare-fun m!1042571 () Bool)

(assert (=> b!1129789 m!1042571))

(declare-fun m!1042573 () Bool)

(assert (=> mapNonEmpty!44452 m!1042573))

(declare-fun m!1042575 () Bool)

(assert (=> b!1129792 m!1042575))

(declare-fun m!1042577 () Bool)

(assert (=> b!1129801 m!1042577))

(declare-fun m!1042579 () Bool)

(assert (=> b!1129801 m!1042579))

(declare-fun m!1042581 () Bool)

(assert (=> b!1129804 m!1042581))

(declare-fun m!1042583 () Bool)

(assert (=> b!1129804 m!1042583))

(declare-fun m!1042585 () Bool)

(assert (=> b!1129804 m!1042585))

(declare-fun m!1042587 () Bool)

(assert (=> b!1129804 m!1042587))

(declare-fun m!1042589 () Bool)

(assert (=> b!1129808 m!1042589))

(declare-fun m!1042591 () Bool)

(assert (=> b!1129791 m!1042591))

(declare-fun m!1042593 () Bool)

(assert (=> b!1129791 m!1042593))

(declare-fun m!1042595 () Bool)

(assert (=> bm!48170 m!1042595))

(declare-fun m!1042597 () Bool)

(assert (=> b!1129798 m!1042597))

(declare-fun m!1042599 () Bool)

(assert (=> b!1129809 m!1042599))

(declare-fun m!1042601 () Bool)

(assert (=> b!1129809 m!1042601))

(declare-fun m!1042603 () Bool)

(assert (=> bm!48168 m!1042603))

(declare-fun m!1042605 () Bool)

(assert (=> b!1129811 m!1042605))

(declare-fun m!1042607 () Bool)

(assert (=> b!1129811 m!1042607))

(declare-fun m!1042609 () Bool)

(assert (=> b!1129811 m!1042609))

(declare-fun m!1042611 () Bool)

(assert (=> b!1129787 m!1042611))

(assert (=> b!1129787 m!1042611))

(declare-fun m!1042613 () Bool)

(assert (=> b!1129787 m!1042613))

(declare-fun m!1042615 () Bool)

(assert (=> b!1129810 m!1042615))

(declare-fun m!1042617 () Bool)

(assert (=> bm!48163 m!1042617))

(assert (=> bm!48166 m!1042579))

(check-sat (not bm!48170) (not b!1129787) (not b!1129807) (not mapNonEmpty!44452) (not b!1129796) (not bm!48166) (not b!1129789) (not b!1129798) (not b_next!23893) (not b!1129809) b_and!38549 (not b!1129805) (not b!1129801) (not b_lambda!18845) (not b!1129808) (not b!1129804) (not b!1129792) (not b!1129791) tp_is_empty!28423 (not bm!48164) (not b!1129811) (not start!98186) (not bm!48163) (not bm!48168))
(check-sat b_and!38549 (not b_next!23893))
