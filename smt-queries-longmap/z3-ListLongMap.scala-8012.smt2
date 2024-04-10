; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98914 () Bool)

(assert start!98914)

(declare-fun b_free!24519 () Bool)

(declare-fun b_next!24519 () Bool)

(assert (=> start!98914 (= b_free!24519 (not b_next!24519))))

(declare-fun tp!86267 () Bool)

(declare-fun b_and!39887 () Bool)

(assert (=> start!98914 (= tp!86267 b_and!39887)))

(declare-fun b!1158886 () Bool)

(declare-datatypes ((Unit!38187 0))(
  ( (Unit!38188) )
))
(declare-fun e!659021 () Unit!38187)

(declare-fun Unit!38189 () Unit!38187)

(assert (=> b!1158886 (= e!659021 Unit!38189)))

(declare-fun b!1158887 () Bool)

(declare-fun res!769351 () Bool)

(declare-fun e!659028 () Bool)

(assert (=> b!1158887 (=> (not res!769351) (not e!659028))))

(declare-datatypes ((array!74939 0))(
  ( (array!74940 (arr!36120 (Array (_ BitVec 32) (_ BitVec 64))) (size!36656 (_ BitVec 32))) )
))
(declare-fun lt!520866 () array!74939)

(declare-datatypes ((List!25300 0))(
  ( (Nil!25297) (Cons!25296 (h!26505 (_ BitVec 64)) (t!36811 List!25300)) )
))
(declare-fun arrayNoDuplicates!0 (array!74939 (_ BitVec 32) List!25300) Bool)

(assert (=> b!1158887 (= res!769351 (arrayNoDuplicates!0 lt!520866 #b00000000000000000000000000000000 Nil!25297))))

(declare-fun b!1158888 () Bool)

(declare-fun res!769344 () Bool)

(declare-fun e!659020 () Bool)

(assert (=> b!1158888 (=> (not res!769344) (not e!659020))))

(declare-fun _keys!1208 () array!74939)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74939 (_ BitVec 32)) Bool)

(assert (=> b!1158888 (= res!769344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158889 () Bool)

(declare-fun e!659022 () Unit!38187)

(declare-fun Unit!38190 () Unit!38187)

(assert (=> b!1158889 (= e!659022 Unit!38190)))

(declare-fun b!1158890 () Bool)

(declare-datatypes ((V!43859 0))(
  ( (V!43860 (val!14581 Int)) )
))
(declare-datatypes ((tuple2!18562 0))(
  ( (tuple2!18563 (_1!9292 (_ BitVec 64)) (_2!9292 V!43859)) )
))
(declare-datatypes ((List!25301 0))(
  ( (Nil!25298) (Cons!25297 (h!26506 tuple2!18562) (t!36812 List!25301)) )
))
(declare-datatypes ((ListLongMap!16531 0))(
  ( (ListLongMap!16532 (toList!8281 List!25301)) )
))
(declare-fun call!55773 () ListLongMap!16531)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6790 (ListLongMap!16531 (_ BitVec 64)) Bool)

(assert (=> b!1158890 (contains!6790 call!55773 k0!934)))

(declare-fun lt!520876 () Unit!38187)

(declare-fun call!55771 () Unit!38187)

(assert (=> b!1158890 (= lt!520876 call!55771)))

(declare-fun call!55770 () Bool)

(assert (=> b!1158890 call!55770))

(declare-fun lt!520862 () ListLongMap!16531)

(declare-fun lt!520868 () ListLongMap!16531)

(declare-fun zeroValue!944 () V!43859)

(declare-fun +!3689 (ListLongMap!16531 tuple2!18562) ListLongMap!16531)

(assert (=> b!1158890 (= lt!520862 (+!3689 lt!520868 (tuple2!18563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520873 () Unit!38187)

(declare-fun addStillContains!931 (ListLongMap!16531 (_ BitVec 64) V!43859 (_ BitVec 64)) Unit!38187)

(assert (=> b!1158890 (= lt!520873 (addStillContains!931 lt!520868 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!659025 () Unit!38187)

(assert (=> b!1158890 (= e!659025 lt!520876)))

(declare-fun b!1158891 () Bool)

(declare-fun e!659018 () Bool)

(declare-fun tp_is_empty!29049 () Bool)

(assert (=> b!1158891 (= e!659018 tp_is_empty!29049)))

(declare-fun b!1158892 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!659026 () Bool)

(declare-fun arrayContainsKey!0 (array!74939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158892 (= e!659026 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158893 () Bool)

(declare-fun res!769357 () Bool)

(assert (=> b!1158893 (=> (not res!769357) (not e!659020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158893 (= res!769357 (validMask!0 mask!1564))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1158894 () Bool)

(declare-fun lt!520860 () Bool)

(declare-fun e!659023 () Bool)

(assert (=> b!1158894 (= e!659023 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!55776 () ListLongMap!16531)

(declare-fun e!659024 () Bool)

(declare-fun call!55772 () ListLongMap!16531)

(declare-fun b!1158895 () Bool)

(declare-fun -!1392 (ListLongMap!16531 (_ BitVec 64)) ListLongMap!16531)

(assert (=> b!1158895 (= e!659024 (= call!55776 (-!1392 call!55772 k0!934)))))

(declare-fun b!1158896 () Bool)

(declare-fun res!769355 () Bool)

(assert (=> b!1158896 (=> (not res!769355) (not e!659020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158896 (= res!769355 (validKeyInArray!0 k0!934))))

(declare-fun b!1158897 () Bool)

(assert (=> b!1158897 (= e!659020 e!659028)))

(declare-fun res!769353 () Bool)

(assert (=> b!1158897 (=> (not res!769353) (not e!659028))))

(assert (=> b!1158897 (= res!769353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520866 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158897 (= lt!520866 (array!74940 (store (arr!36120 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36656 _keys!1208)))))

(declare-fun mapNonEmpty!45398 () Bool)

(declare-fun mapRes!45398 () Bool)

(declare-fun tp!86268 () Bool)

(assert (=> mapNonEmpty!45398 (= mapRes!45398 (and tp!86268 e!659018))))

(declare-fun mapKey!45398 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13815 0))(
  ( (ValueCellFull!13815 (v!17218 V!43859)) (EmptyCell!13815) )
))
(declare-fun mapValue!45398 () ValueCell!13815)

(declare-fun mapRest!45398 () (Array (_ BitVec 32) ValueCell!13815))

(declare-datatypes ((array!74941 0))(
  ( (array!74942 (arr!36121 (Array (_ BitVec 32) ValueCell!13815)) (size!36657 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74941)

(assert (=> mapNonEmpty!45398 (= (arr!36121 _values!996) (store mapRest!45398 mapKey!45398 mapValue!45398))))

(declare-fun b!1158898 () Bool)

(declare-fun e!659029 () Bool)

(assert (=> b!1158898 (= e!659029 tp_is_empty!29049)))

(declare-fun mapIsEmpty!45398 () Bool)

(assert (=> mapIsEmpty!45398 mapRes!45398))

(declare-fun call!55774 () ListLongMap!16531)

(declare-fun bm!55767 () Bool)

(declare-fun c!115532 () Bool)

(assert (=> bm!55767 (= call!55770 (contains!6790 (ite c!115532 lt!520862 call!55774) k0!934))))

(declare-fun b!1158899 () Bool)

(declare-fun res!769354 () Bool)

(assert (=> b!1158899 (=> (not res!769354) (not e!659020))))

(assert (=> b!1158899 (= res!769354 (and (= (size!36657 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36656 _keys!1208) (size!36657 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158900 () Bool)

(declare-fun e!659034 () Unit!38187)

(assert (=> b!1158900 (= e!659034 e!659021)))

(declare-fun c!115530 () Bool)

(assert (=> b!1158900 (= c!115530 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520860))))

(declare-fun b!1158901 () Bool)

(declare-fun e!659030 () Bool)

(declare-fun e!659031 () Bool)

(assert (=> b!1158901 (= e!659030 e!659031)))

(declare-fun res!769348 () Bool)

(assert (=> b!1158901 (=> res!769348 e!659031)))

(assert (=> b!1158901 (= res!769348 (not (= from!1455 i!673)))))

(declare-fun lt!520871 () ListLongMap!16531)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43859)

(declare-fun lt!520864 () array!74941)

(declare-fun getCurrentListMapNoExtraKeys!4745 (array!74939 array!74941 (_ BitVec 32) (_ BitVec 32) V!43859 V!43859 (_ BitVec 32) Int) ListLongMap!16531)

(assert (=> b!1158901 (= lt!520871 (getCurrentListMapNoExtraKeys!4745 lt!520866 lt!520864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520877 () V!43859)

(assert (=> b!1158901 (= lt!520864 (array!74942 (store (arr!36121 _values!996) i!673 (ValueCellFull!13815 lt!520877)) (size!36657 _values!996)))))

(declare-fun dynLambda!2749 (Int (_ BitVec 64)) V!43859)

(assert (=> b!1158901 (= lt!520877 (dynLambda!2749 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520870 () ListLongMap!16531)

(assert (=> b!1158901 (= lt!520870 (getCurrentListMapNoExtraKeys!4745 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55768 () Bool)

(assert (=> bm!55768 (= call!55774 call!55773)))

(declare-fun b!1158902 () Bool)

(declare-fun res!769358 () Bool)

(assert (=> b!1158902 (=> (not res!769358) (not e!659020))))

(assert (=> b!1158902 (= res!769358 (= (select (arr!36120 _keys!1208) i!673) k0!934))))

(declare-fun b!1158903 () Bool)

(declare-fun Unit!38191 () Unit!38187)

(assert (=> b!1158903 (= e!659022 Unit!38191)))

(assert (=> b!1158903 (= lt!520860 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158903 (= c!115532 (and (not lt!520860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520875 () Unit!38187)

(assert (=> b!1158903 (= lt!520875 e!659025)))

(declare-fun lt!520865 () Unit!38187)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!516 (array!74939 array!74941 (_ BitVec 32) (_ BitVec 32) V!43859 V!43859 (_ BitVec 64) (_ BitVec 32) Int) Unit!38187)

(assert (=> b!1158903 (= lt!520865 (lemmaListMapContainsThenArrayContainsFrom!516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115534 () Bool)

(assert (=> b!1158903 (= c!115534 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769345 () Bool)

(assert (=> b!1158903 (= res!769345 e!659023)))

(assert (=> b!1158903 (=> (not res!769345) (not e!659026))))

(assert (=> b!1158903 e!659026))

(declare-fun lt!520879 () Unit!38187)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74939 (_ BitVec 32) (_ BitVec 32)) Unit!38187)

(assert (=> b!1158903 (= lt!520879 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158903 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25297)))

(declare-fun lt!520867 () Unit!38187)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74939 (_ BitVec 64) (_ BitVec 32) List!25300) Unit!38187)

(assert (=> b!1158903 (= lt!520867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25297))))

(assert (=> b!1158903 false))

(declare-fun b!1158904 () Bool)

(declare-fun res!769347 () Bool)

(assert (=> b!1158904 (=> (not res!769347) (not e!659020))))

(assert (=> b!1158904 (= res!769347 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25297))))

(declare-fun bm!55769 () Bool)

(assert (=> bm!55769 (= call!55772 (getCurrentListMapNoExtraKeys!4745 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158905 () Bool)

(declare-fun e!659019 () Bool)

(assert (=> b!1158905 (= e!659019 true)))

(declare-fun e!659033 () Bool)

(assert (=> b!1158905 e!659033))

(declare-fun res!769349 () Bool)

(assert (=> b!1158905 (=> (not res!769349) (not e!659033))))

(declare-fun lt!520872 () ListLongMap!16531)

(assert (=> b!1158905 (= res!769349 (= lt!520872 lt!520868))))

(assert (=> b!1158905 (= lt!520872 (-!1392 lt!520870 k0!934))))

(declare-fun lt!520861 () V!43859)

(assert (=> b!1158905 (= (-!1392 (+!3689 lt!520868 (tuple2!18563 (select (arr!36120 _keys!1208) from!1455) lt!520861)) (select (arr!36120 _keys!1208) from!1455)) lt!520868)))

(declare-fun lt!520881 () Unit!38187)

(declare-fun addThenRemoveForNewKeyIsSame!228 (ListLongMap!16531 (_ BitVec 64) V!43859) Unit!38187)

(assert (=> b!1158905 (= lt!520881 (addThenRemoveForNewKeyIsSame!228 lt!520868 (select (arr!36120 _keys!1208) from!1455) lt!520861))))

(declare-fun get!18414 (ValueCell!13815 V!43859) V!43859)

(assert (=> b!1158905 (= lt!520861 (get!18414 (select (arr!36121 _values!996) from!1455) lt!520877))))

(declare-fun lt!520878 () Unit!38187)

(assert (=> b!1158905 (= lt!520878 e!659022)))

(declare-fun c!115529 () Bool)

(assert (=> b!1158905 (= c!115529 (contains!6790 lt!520868 k0!934))))

(assert (=> b!1158905 (= lt!520868 (getCurrentListMapNoExtraKeys!4745 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158906 () Bool)

(assert (=> b!1158906 (= e!659028 (not e!659030))))

(declare-fun res!769352 () Bool)

(assert (=> b!1158906 (=> res!769352 e!659030)))

(assert (=> b!1158906 (= res!769352 (bvsgt from!1455 i!673))))

(assert (=> b!1158906 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520874 () Unit!38187)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74939 (_ BitVec 64) (_ BitVec 32)) Unit!38187)

(assert (=> b!1158906 (= lt!520874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun c!115533 () Bool)

(declare-fun bm!55770 () Bool)

(assert (=> bm!55770 (= call!55771 (addStillContains!931 (ite c!115532 lt!520862 lt!520868) (ite c!115532 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115533 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115532 minValue!944 (ite c!115533 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1158907 () Bool)

(assert (=> b!1158907 (= e!659024 (= call!55776 call!55772))))

(declare-fun b!1158908 () Bool)

(assert (=> b!1158908 (= e!659033 (= lt!520872 (getCurrentListMapNoExtraKeys!4745 lt!520866 lt!520864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!55771 () Bool)

(assert (=> bm!55771 (= call!55776 (getCurrentListMapNoExtraKeys!4745 lt!520866 lt!520864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55772 () Bool)

(declare-fun call!55777 () Bool)

(assert (=> bm!55772 (= call!55777 call!55770)))

(declare-fun b!1158909 () Bool)

(declare-fun lt!520869 () Unit!38187)

(assert (=> b!1158909 (= e!659034 lt!520869)))

(declare-fun call!55775 () Unit!38187)

(assert (=> b!1158909 (= lt!520869 call!55775)))

(assert (=> b!1158909 call!55777))

(declare-fun bm!55773 () Bool)

(assert (=> bm!55773 (= call!55775 call!55771)))

(declare-fun b!1158910 () Bool)

(declare-fun res!769356 () Bool)

(assert (=> b!1158910 (=> (not res!769356) (not e!659020))))

(assert (=> b!1158910 (= res!769356 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36656 _keys!1208))))))

(declare-fun bm!55774 () Bool)

(assert (=> bm!55774 (= call!55773 (+!3689 (ite c!115532 lt!520862 lt!520868) (ite c!115532 (tuple2!18563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115533 (tuple2!18563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1158911 () Bool)

(assert (=> b!1158911 (= e!659031 e!659019)))

(declare-fun res!769346 () Bool)

(assert (=> b!1158911 (=> res!769346 e!659019)))

(assert (=> b!1158911 (= res!769346 (not (= (select (arr!36120 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158911 e!659024))

(declare-fun c!115531 () Bool)

(assert (=> b!1158911 (= c!115531 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520880 () Unit!38187)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!623 (array!74939 array!74941 (_ BitVec 32) (_ BitVec 32) V!43859 V!43859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38187)

(assert (=> b!1158911 (= lt!520880 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!623 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158912 () Bool)

(assert (=> b!1158912 (= c!115533 (and (not lt!520860) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158912 (= e!659025 e!659034)))

(declare-fun res!769350 () Bool)

(assert (=> start!98914 (=> (not res!769350) (not e!659020))))

(assert (=> start!98914 (= res!769350 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36656 _keys!1208))))))

(assert (=> start!98914 e!659020))

(assert (=> start!98914 tp_is_empty!29049))

(declare-fun array_inv!27640 (array!74939) Bool)

(assert (=> start!98914 (array_inv!27640 _keys!1208)))

(assert (=> start!98914 true))

(assert (=> start!98914 tp!86267))

(declare-fun e!659027 () Bool)

(declare-fun array_inv!27641 (array!74941) Bool)

(assert (=> start!98914 (and (array_inv!27641 _values!996) e!659027)))

(declare-fun b!1158913 () Bool)

(assert (=> b!1158913 (= e!659027 (and e!659029 mapRes!45398))))

(declare-fun condMapEmpty!45398 () Bool)

(declare-fun mapDefault!45398 () ValueCell!13815)

(assert (=> b!1158913 (= condMapEmpty!45398 (= (arr!36121 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13815)) mapDefault!45398)))))

(declare-fun b!1158914 () Bool)

(assert (=> b!1158914 (= e!659023 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158915 () Bool)

(assert (=> b!1158915 call!55777))

(declare-fun lt!520863 () Unit!38187)

(assert (=> b!1158915 (= lt!520863 call!55775)))

(assert (=> b!1158915 (= e!659021 lt!520863)))

(assert (= (and start!98914 res!769350) b!1158893))

(assert (= (and b!1158893 res!769357) b!1158899))

(assert (= (and b!1158899 res!769354) b!1158888))

(assert (= (and b!1158888 res!769344) b!1158904))

(assert (= (and b!1158904 res!769347) b!1158910))

(assert (= (and b!1158910 res!769356) b!1158896))

(assert (= (and b!1158896 res!769355) b!1158902))

(assert (= (and b!1158902 res!769358) b!1158897))

(assert (= (and b!1158897 res!769353) b!1158887))

(assert (= (and b!1158887 res!769351) b!1158906))

(assert (= (and b!1158906 (not res!769352)) b!1158901))

(assert (= (and b!1158901 (not res!769348)) b!1158911))

(assert (= (and b!1158911 c!115531) b!1158895))

(assert (= (and b!1158911 (not c!115531)) b!1158907))

(assert (= (or b!1158895 b!1158907) bm!55771))

(assert (= (or b!1158895 b!1158907) bm!55769))

(assert (= (and b!1158911 (not res!769346)) b!1158905))

(assert (= (and b!1158905 c!115529) b!1158903))

(assert (= (and b!1158905 (not c!115529)) b!1158889))

(assert (= (and b!1158903 c!115532) b!1158890))

(assert (= (and b!1158903 (not c!115532)) b!1158912))

(assert (= (and b!1158912 c!115533) b!1158909))

(assert (= (and b!1158912 (not c!115533)) b!1158900))

(assert (= (and b!1158900 c!115530) b!1158915))

(assert (= (and b!1158900 (not c!115530)) b!1158886))

(assert (= (or b!1158909 b!1158915) bm!55773))

(assert (= (or b!1158909 b!1158915) bm!55768))

(assert (= (or b!1158909 b!1158915) bm!55772))

(assert (= (or b!1158890 bm!55772) bm!55767))

(assert (= (or b!1158890 bm!55773) bm!55770))

(assert (= (or b!1158890 bm!55768) bm!55774))

(assert (= (and b!1158903 c!115534) b!1158914))

(assert (= (and b!1158903 (not c!115534)) b!1158894))

(assert (= (and b!1158903 res!769345) b!1158892))

(assert (= (and b!1158905 res!769349) b!1158908))

(assert (= (and b!1158913 condMapEmpty!45398) mapIsEmpty!45398))

(assert (= (and b!1158913 (not condMapEmpty!45398)) mapNonEmpty!45398))

(get-info :version)

(assert (= (and mapNonEmpty!45398 ((_ is ValueCellFull!13815) mapValue!45398)) b!1158891))

(assert (= (and b!1158913 ((_ is ValueCellFull!13815) mapDefault!45398)) b!1158898))

(assert (= start!98914 b!1158913))

(declare-fun b_lambda!19625 () Bool)

(assert (=> (not b_lambda!19625) (not b!1158901)))

(declare-fun t!36810 () Bool)

(declare-fun tb!9331 () Bool)

(assert (=> (and start!98914 (= defaultEntry!1004 defaultEntry!1004) t!36810) tb!9331))

(declare-fun result!19227 () Bool)

(assert (=> tb!9331 (= result!19227 tp_is_empty!29049)))

(assert (=> b!1158901 t!36810))

(declare-fun b_and!39889 () Bool)

(assert (= b_and!39887 (and (=> t!36810 result!19227) b_and!39889)))

(declare-fun m!1068029 () Bool)

(assert (=> b!1158905 m!1068029))

(declare-fun m!1068031 () Bool)

(assert (=> b!1158905 m!1068031))

(assert (=> b!1158905 m!1068031))

(declare-fun m!1068033 () Bool)

(assert (=> b!1158905 m!1068033))

(declare-fun m!1068035 () Bool)

(assert (=> b!1158905 m!1068035))

(declare-fun m!1068037 () Bool)

(assert (=> b!1158905 m!1068037))

(declare-fun m!1068039 () Bool)

(assert (=> b!1158905 m!1068039))

(declare-fun m!1068041 () Bool)

(assert (=> b!1158905 m!1068041))

(assert (=> b!1158905 m!1068037))

(assert (=> b!1158905 m!1068039))

(assert (=> b!1158905 m!1068039))

(declare-fun m!1068043 () Bool)

(assert (=> b!1158905 m!1068043))

(declare-fun m!1068045 () Bool)

(assert (=> b!1158905 m!1068045))

(declare-fun m!1068047 () Bool)

(assert (=> b!1158914 m!1068047))

(declare-fun m!1068049 () Bool)

(assert (=> b!1158895 m!1068049))

(declare-fun m!1068051 () Bool)

(assert (=> b!1158908 m!1068051))

(declare-fun m!1068053 () Bool)

(assert (=> b!1158888 m!1068053))

(declare-fun m!1068055 () Bool)

(assert (=> b!1158902 m!1068055))

(declare-fun m!1068057 () Bool)

(assert (=> b!1158890 m!1068057))

(declare-fun m!1068059 () Bool)

(assert (=> b!1158890 m!1068059))

(declare-fun m!1068061 () Bool)

(assert (=> b!1158890 m!1068061))

(assert (=> b!1158911 m!1068039))

(declare-fun m!1068063 () Bool)

(assert (=> b!1158911 m!1068063))

(assert (=> b!1158892 m!1068047))

(declare-fun m!1068065 () Bool)

(assert (=> b!1158893 m!1068065))

(declare-fun m!1068067 () Bool)

(assert (=> bm!55770 m!1068067))

(declare-fun m!1068069 () Bool)

(assert (=> b!1158887 m!1068069))

(declare-fun m!1068071 () Bool)

(assert (=> b!1158904 m!1068071))

(assert (=> bm!55771 m!1068051))

(declare-fun m!1068073 () Bool)

(assert (=> b!1158903 m!1068073))

(declare-fun m!1068075 () Bool)

(assert (=> b!1158903 m!1068075))

(declare-fun m!1068077 () Bool)

(assert (=> b!1158903 m!1068077))

(declare-fun m!1068079 () Bool)

(assert (=> b!1158903 m!1068079))

(declare-fun m!1068081 () Bool)

(assert (=> start!98914 m!1068081))

(declare-fun m!1068083 () Bool)

(assert (=> start!98914 m!1068083))

(declare-fun m!1068085 () Bool)

(assert (=> b!1158906 m!1068085))

(declare-fun m!1068087 () Bool)

(assert (=> b!1158906 m!1068087))

(declare-fun m!1068089 () Bool)

(assert (=> b!1158901 m!1068089))

(declare-fun m!1068091 () Bool)

(assert (=> b!1158901 m!1068091))

(declare-fun m!1068093 () Bool)

(assert (=> b!1158901 m!1068093))

(declare-fun m!1068095 () Bool)

(assert (=> b!1158901 m!1068095))

(declare-fun m!1068097 () Bool)

(assert (=> b!1158897 m!1068097))

(declare-fun m!1068099 () Bool)

(assert (=> b!1158897 m!1068099))

(declare-fun m!1068101 () Bool)

(assert (=> b!1158896 m!1068101))

(declare-fun m!1068103 () Bool)

(assert (=> bm!55767 m!1068103))

(assert (=> bm!55769 m!1068029))

(declare-fun m!1068105 () Bool)

(assert (=> bm!55774 m!1068105))

(declare-fun m!1068107 () Bool)

(assert (=> mapNonEmpty!45398 m!1068107))

(check-sat b_and!39889 (not b_next!24519) (not b!1158903) tp_is_empty!29049 (not b!1158893) (not b!1158911) (not mapNonEmpty!45398) (not b!1158892) (not bm!55770) (not bm!55769) (not b!1158890) (not b!1158901) (not b_lambda!19625) (not b!1158908) (not b!1158887) (not b!1158895) (not b!1158897) (not b!1158906) (not b!1158905) (not start!98914) (not b!1158888) (not b!1158904) (not bm!55774) (not b!1158896) (not bm!55771) (not bm!55767) (not b!1158914))
(check-sat b_and!39889 (not b_next!24519))
