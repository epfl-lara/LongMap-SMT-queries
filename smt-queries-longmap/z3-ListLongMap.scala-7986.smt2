; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98992 () Bool)

(assert start!98992)

(declare-fun b_free!24361 () Bool)

(declare-fun b_next!24361 () Bool)

(assert (=> start!98992 (= b_free!24361 (not b_next!24361))))

(declare-fun tp!85793 () Bool)

(declare-fun b_and!39573 () Bool)

(assert (=> start!98992 (= tp!85793 b_and!39573)))

(declare-datatypes ((V!43649 0))(
  ( (V!43650 (val!14502 Int)) )
))
(declare-fun zeroValue!944 () V!43649)

(declare-fun c!114508 () Bool)

(declare-fun bm!53936 () Bool)

(declare-datatypes ((tuple2!18430 0))(
  ( (tuple2!18431 (_1!9226 (_ BitVec 64)) (_2!9226 V!43649)) )
))
(declare-datatypes ((List!25183 0))(
  ( (Nil!25180) (Cons!25179 (h!26397 tuple2!18430) (t!36528 List!25183)) )
))
(declare-datatypes ((ListLongMap!16407 0))(
  ( (ListLongMap!16408 (toList!8219 List!25183)) )
))
(declare-fun lt!516151 () ListLongMap!16407)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!114510 () Bool)

(declare-fun lt!516147 () ListLongMap!16407)

(declare-fun minValue!944 () V!43649)

(declare-datatypes ((Unit!37866 0))(
  ( (Unit!37867) )
))
(declare-fun call!53943 () Unit!37866)

(declare-fun addStillContains!879 (ListLongMap!16407 (_ BitVec 64) V!43649 (_ BitVec 64)) Unit!37866)

(assert (=> bm!53936 (= call!53943 (addStillContains!879 (ite c!114508 lt!516147 lt!516151) (ite c!114508 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114510 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114508 minValue!944 (ite c!114510 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1152907 () Bool)

(declare-fun e!655831 () Bool)

(assert (=> b!1152907 (= e!655831 true)))

(declare-fun e!655822 () Bool)

(assert (=> b!1152907 e!655822))

(declare-fun res!766297 () Bool)

(assert (=> b!1152907 (=> (not res!766297) (not e!655822))))

(declare-fun lt!516134 () ListLongMap!16407)

(assert (=> b!1152907 (= res!766297 (= lt!516134 lt!516151))))

(declare-fun lt!516143 () ListLongMap!16407)

(declare-fun -!1338 (ListLongMap!16407 (_ BitVec 64)) ListLongMap!16407)

(assert (=> b!1152907 (= lt!516134 (-!1338 lt!516143 k0!934))))

(declare-datatypes ((array!74675 0))(
  ( (array!74676 (arr!35982 (Array (_ BitVec 32) (_ BitVec 64))) (size!36519 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74675)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!516139 () V!43649)

(declare-fun +!3654 (ListLongMap!16407 tuple2!18430) ListLongMap!16407)

(assert (=> b!1152907 (= (-!1338 (+!3654 lt!516151 (tuple2!18431 (select (arr!35982 _keys!1208) from!1455) lt!516139)) (select (arr!35982 _keys!1208) from!1455)) lt!516151)))

(declare-fun lt!516142 () Unit!37866)

(declare-fun addThenRemoveForNewKeyIsSame!183 (ListLongMap!16407 (_ BitVec 64) V!43649) Unit!37866)

(assert (=> b!1152907 (= lt!516142 (addThenRemoveForNewKeyIsSame!183 lt!516151 (select (arr!35982 _keys!1208) from!1455) lt!516139))))

(declare-fun lt!516141 () V!43649)

(declare-datatypes ((ValueCell!13736 0))(
  ( (ValueCellFull!13736 (v!17135 V!43649)) (EmptyCell!13736) )
))
(declare-datatypes ((array!74677 0))(
  ( (array!74678 (arr!35983 (Array (_ BitVec 32) ValueCell!13736)) (size!36520 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74677)

(declare-fun get!18348 (ValueCell!13736 V!43649) V!43649)

(assert (=> b!1152907 (= lt!516139 (get!18348 (select (arr!35983 _values!996) from!1455) lt!516141))))

(declare-fun lt!516131 () Unit!37866)

(declare-fun e!655837 () Unit!37866)

(assert (=> b!1152907 (= lt!516131 e!655837)))

(declare-fun c!114505 () Bool)

(declare-fun contains!6753 (ListLongMap!16407 (_ BitVec 64)) Bool)

(assert (=> b!1152907 (= c!114505 (contains!6753 lt!516151 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4719 (array!74675 array!74677 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 32) Int) ListLongMap!16407)

(assert (=> b!1152907 (= lt!516151 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152908 () Bool)

(declare-fun e!655829 () Unit!37866)

(declare-fun e!655836 () Unit!37866)

(assert (=> b!1152908 (= e!655829 e!655836)))

(declare-fun c!114509 () Bool)

(declare-fun lt!516138 () Bool)

(assert (=> b!1152908 (= c!114509 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516138))))

(declare-fun e!655824 () Bool)

(declare-fun b!1152909 () Bool)

(declare-fun arrayContainsKey!0 (array!74675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152909 (= e!655824 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152910 () Bool)

(assert (=> b!1152910 (= c!114510 (and (not lt!516138) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655823 () Unit!37866)

(assert (=> b!1152910 (= e!655823 e!655829)))

(declare-fun b!1152911 () Bool)

(declare-fun e!655835 () Bool)

(assert (=> b!1152911 (= e!655835 e!655831)))

(declare-fun res!766308 () Bool)

(assert (=> b!1152911 (=> res!766308 e!655831)))

(assert (=> b!1152911 (= res!766308 (not (= (select (arr!35982 _keys!1208) from!1455) k0!934)))))

(declare-fun e!655830 () Bool)

(assert (=> b!1152911 e!655830))

(declare-fun c!114507 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152911 (= c!114507 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516148 () Unit!37866)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!581 (array!74675 array!74677 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37866)

(assert (=> b!1152911 (= lt!516148 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152912 () Bool)

(declare-fun lt!516150 () Unit!37866)

(assert (=> b!1152912 (= e!655829 lt!516150)))

(declare-fun call!53942 () Unit!37866)

(assert (=> b!1152912 (= lt!516150 call!53942)))

(declare-fun call!53945 () Bool)

(assert (=> b!1152912 call!53945))

(declare-fun bm!53937 () Bool)

(assert (=> bm!53937 (= call!53942 call!53943)))

(declare-fun e!655833 () Bool)

(declare-fun b!1152914 () Bool)

(assert (=> b!1152914 (= e!655833 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516138) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152915 () Bool)

(assert (=> b!1152915 (= e!655833 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152916 () Bool)

(declare-fun res!766306 () Bool)

(declare-fun e!655827 () Bool)

(assert (=> b!1152916 (=> (not res!766306) (not e!655827))))

(assert (=> b!1152916 (= res!766306 (= (select (arr!35982 _keys!1208) i!673) k0!934))))

(declare-fun b!1152917 () Bool)

(declare-fun Unit!37868 () Unit!37866)

(assert (=> b!1152917 (= e!655837 Unit!37868)))

(declare-fun b!1152918 () Bool)

(declare-fun res!766307 () Bool)

(assert (=> b!1152918 (=> (not res!766307) (not e!655827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74675 (_ BitVec 32)) Bool)

(assert (=> b!1152918 (= res!766307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152919 () Bool)

(declare-fun res!766303 () Bool)

(assert (=> b!1152919 (=> (not res!766303) (not e!655827))))

(declare-datatypes ((List!25184 0))(
  ( (Nil!25181) (Cons!25180 (h!26398 (_ BitVec 64)) (t!36529 List!25184)) )
))
(declare-fun arrayNoDuplicates!0 (array!74675 (_ BitVec 32) List!25184) Bool)

(assert (=> b!1152919 (= res!766303 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25181))))

(declare-fun b!1152920 () Bool)

(declare-fun res!766299 () Bool)

(assert (=> b!1152920 (=> (not res!766299) (not e!655827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152920 (= res!766299 (validKeyInArray!0 k0!934))))

(declare-fun b!1152921 () Bool)

(declare-fun res!766305 () Bool)

(assert (=> b!1152921 (=> (not res!766305) (not e!655827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152921 (= res!766305 (validMask!0 mask!1564))))

(declare-fun b!1152922 () Bool)

(declare-fun lt!516145 () array!74675)

(declare-fun lt!516140 () array!74677)

(assert (=> b!1152922 (= e!655822 (= lt!516134 (getCurrentListMapNoExtraKeys!4719 lt!516145 lt!516140 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45161 () Bool)

(declare-fun mapRes!45161 () Bool)

(assert (=> mapIsEmpty!45161 mapRes!45161))

(declare-fun b!1152923 () Bool)

(declare-fun e!655828 () Bool)

(declare-fun tp_is_empty!28891 () Bool)

(assert (=> b!1152923 (= e!655828 tp_is_empty!28891)))

(declare-fun b!1152924 () Bool)

(declare-fun e!655832 () Bool)

(assert (=> b!1152924 (= e!655832 tp_is_empty!28891)))

(declare-fun b!1152925 () Bool)

(declare-fun e!655834 () Bool)

(assert (=> b!1152925 (= e!655834 (and e!655828 mapRes!45161))))

(declare-fun condMapEmpty!45161 () Bool)

(declare-fun mapDefault!45161 () ValueCell!13736)

(assert (=> b!1152925 (= condMapEmpty!45161 (= (arr!35983 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13736)) mapDefault!45161)))))

(declare-fun mapNonEmpty!45161 () Bool)

(declare-fun tp!85794 () Bool)

(assert (=> mapNonEmpty!45161 (= mapRes!45161 (and tp!85794 e!655832))))

(declare-fun mapValue!45161 () ValueCell!13736)

(declare-fun mapRest!45161 () (Array (_ BitVec 32) ValueCell!13736))

(declare-fun mapKey!45161 () (_ BitVec 32))

(assert (=> mapNonEmpty!45161 (= (arr!35983 _values!996) (store mapRest!45161 mapKey!45161 mapValue!45161))))

(declare-fun bm!53938 () Bool)

(declare-fun call!53944 () Bool)

(assert (=> bm!53938 (= call!53945 call!53944)))

(declare-fun b!1152926 () Bool)

(declare-fun Unit!37869 () Unit!37866)

(assert (=> b!1152926 (= e!655837 Unit!37869)))

(assert (=> b!1152926 (= lt!516138 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152926 (= c!114508 (and (not lt!516138) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516133 () Unit!37866)

(assert (=> b!1152926 (= lt!516133 e!655823)))

(declare-fun lt!516149 () Unit!37866)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!474 (array!74675 array!74677 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 64) (_ BitVec 32) Int) Unit!37866)

(assert (=> b!1152926 (= lt!516149 (lemmaListMapContainsThenArrayContainsFrom!474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114506 () Bool)

(assert (=> b!1152926 (= c!114506 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766300 () Bool)

(assert (=> b!1152926 (= res!766300 e!655833)))

(assert (=> b!1152926 (=> (not res!766300) (not e!655824))))

(assert (=> b!1152926 e!655824))

(declare-fun lt!516144 () Unit!37866)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74675 (_ BitVec 32) (_ BitVec 32)) Unit!37866)

(assert (=> b!1152926 (= lt!516144 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152926 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25181)))

(declare-fun lt!516136 () Unit!37866)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74675 (_ BitVec 64) (_ BitVec 32) List!25184) Unit!37866)

(assert (=> b!1152926 (= lt!516136 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25181))))

(assert (=> b!1152926 false))

(declare-fun call!53940 () ListLongMap!16407)

(declare-fun bm!53939 () Bool)

(assert (=> bm!53939 (= call!53940 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152927 () Bool)

(declare-fun call!53939 () ListLongMap!16407)

(assert (=> b!1152927 (= e!655830 (= call!53939 call!53940))))

(declare-fun bm!53940 () Bool)

(declare-fun call!53941 () ListLongMap!16407)

(declare-fun call!53946 () ListLongMap!16407)

(assert (=> bm!53940 (= call!53941 call!53946)))

(declare-fun b!1152928 () Bool)

(declare-fun res!766309 () Bool)

(assert (=> b!1152928 (=> (not res!766309) (not e!655827))))

(assert (=> b!1152928 (= res!766309 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36519 _keys!1208))))))

(declare-fun bm!53941 () Bool)

(assert (=> bm!53941 (= call!53939 (getCurrentListMapNoExtraKeys!4719 lt!516145 lt!516140 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152929 () Bool)

(declare-fun Unit!37870 () Unit!37866)

(assert (=> b!1152929 (= e!655836 Unit!37870)))

(declare-fun bm!53942 () Bool)

(assert (=> bm!53942 (= call!53944 (contains!6753 (ite c!114508 lt!516147 call!53941) k0!934))))

(declare-fun res!766311 () Bool)

(assert (=> start!98992 (=> (not res!766311) (not e!655827))))

(assert (=> start!98992 (= res!766311 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36519 _keys!1208))))))

(assert (=> start!98992 e!655827))

(assert (=> start!98992 tp_is_empty!28891))

(declare-fun array_inv!27610 (array!74675) Bool)

(assert (=> start!98992 (array_inv!27610 _keys!1208)))

(assert (=> start!98992 true))

(assert (=> start!98992 tp!85793))

(declare-fun array_inv!27611 (array!74677) Bool)

(assert (=> start!98992 (and (array_inv!27611 _values!996) e!655834)))

(declare-fun b!1152913 () Bool)

(declare-fun res!766310 () Bool)

(declare-fun e!655825 () Bool)

(assert (=> b!1152913 (=> (not res!766310) (not e!655825))))

(assert (=> b!1152913 (= res!766310 (arrayNoDuplicates!0 lt!516145 #b00000000000000000000000000000000 Nil!25181))))

(declare-fun b!1152930 () Bool)

(assert (=> b!1152930 call!53945))

(declare-fun lt!516135 () Unit!37866)

(assert (=> b!1152930 (= lt!516135 call!53942)))

(assert (=> b!1152930 (= e!655836 lt!516135)))

(declare-fun b!1152931 () Bool)

(declare-fun res!766301 () Bool)

(assert (=> b!1152931 (=> (not res!766301) (not e!655827))))

(assert (=> b!1152931 (= res!766301 (and (= (size!36520 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36519 _keys!1208) (size!36520 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152932 () Bool)

(declare-fun e!655826 () Bool)

(assert (=> b!1152932 (= e!655825 (not e!655826))))

(declare-fun res!766302 () Bool)

(assert (=> b!1152932 (=> res!766302 e!655826)))

(assert (=> b!1152932 (= res!766302 (bvsgt from!1455 i!673))))

(assert (=> b!1152932 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516137 () Unit!37866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74675 (_ BitVec 64) (_ BitVec 32)) Unit!37866)

(assert (=> b!1152932 (= lt!516137 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53943 () Bool)

(assert (=> bm!53943 (= call!53946 (+!3654 lt!516151 (ite (or c!114508 c!114510) (tuple2!18431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152933 () Bool)

(assert (=> b!1152933 (= e!655826 e!655835)))

(declare-fun res!766298 () Bool)

(assert (=> b!1152933 (=> res!766298 e!655835)))

(assert (=> b!1152933 (= res!766298 (not (= from!1455 i!673)))))

(declare-fun lt!516146 () ListLongMap!16407)

(assert (=> b!1152933 (= lt!516146 (getCurrentListMapNoExtraKeys!4719 lt!516145 lt!516140 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1152933 (= lt!516140 (array!74678 (store (arr!35983 _values!996) i!673 (ValueCellFull!13736 lt!516141)) (size!36520 _values!996)))))

(declare-fun dynLambda!2742 (Int (_ BitVec 64)) V!43649)

(assert (=> b!1152933 (= lt!516141 (dynLambda!2742 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1152933 (= lt!516143 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152934 () Bool)

(assert (=> b!1152934 (= e!655830 (= call!53939 (-!1338 call!53940 k0!934)))))

(declare-fun b!1152935 () Bool)

(assert (=> b!1152935 (contains!6753 (+!3654 lt!516147 (tuple2!18431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516130 () Unit!37866)

(assert (=> b!1152935 (= lt!516130 call!53943)))

(assert (=> b!1152935 call!53944))

(assert (=> b!1152935 (= lt!516147 call!53946)))

(declare-fun lt!516132 () Unit!37866)

(assert (=> b!1152935 (= lt!516132 (addStillContains!879 lt!516151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1152935 (= e!655823 lt!516130)))

(declare-fun b!1152936 () Bool)

(assert (=> b!1152936 (= e!655827 e!655825)))

(declare-fun res!766304 () Bool)

(assert (=> b!1152936 (=> (not res!766304) (not e!655825))))

(assert (=> b!1152936 (= res!766304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516145 mask!1564))))

(assert (=> b!1152936 (= lt!516145 (array!74676 (store (arr!35982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36519 _keys!1208)))))

(assert (= (and start!98992 res!766311) b!1152921))

(assert (= (and b!1152921 res!766305) b!1152931))

(assert (= (and b!1152931 res!766301) b!1152918))

(assert (= (and b!1152918 res!766307) b!1152919))

(assert (= (and b!1152919 res!766303) b!1152928))

(assert (= (and b!1152928 res!766309) b!1152920))

(assert (= (and b!1152920 res!766299) b!1152916))

(assert (= (and b!1152916 res!766306) b!1152936))

(assert (= (and b!1152936 res!766304) b!1152913))

(assert (= (and b!1152913 res!766310) b!1152932))

(assert (= (and b!1152932 (not res!766302)) b!1152933))

(assert (= (and b!1152933 (not res!766298)) b!1152911))

(assert (= (and b!1152911 c!114507) b!1152934))

(assert (= (and b!1152911 (not c!114507)) b!1152927))

(assert (= (or b!1152934 b!1152927) bm!53941))

(assert (= (or b!1152934 b!1152927) bm!53939))

(assert (= (and b!1152911 (not res!766308)) b!1152907))

(assert (= (and b!1152907 c!114505) b!1152926))

(assert (= (and b!1152907 (not c!114505)) b!1152917))

(assert (= (and b!1152926 c!114508) b!1152935))

(assert (= (and b!1152926 (not c!114508)) b!1152910))

(assert (= (and b!1152910 c!114510) b!1152912))

(assert (= (and b!1152910 (not c!114510)) b!1152908))

(assert (= (and b!1152908 c!114509) b!1152930))

(assert (= (and b!1152908 (not c!114509)) b!1152929))

(assert (= (or b!1152912 b!1152930) bm!53937))

(assert (= (or b!1152912 b!1152930) bm!53940))

(assert (= (or b!1152912 b!1152930) bm!53938))

(assert (= (or b!1152935 bm!53938) bm!53942))

(assert (= (or b!1152935 bm!53937) bm!53936))

(assert (= (or b!1152935 bm!53940) bm!53943))

(assert (= (and b!1152926 c!114506) b!1152915))

(assert (= (and b!1152926 (not c!114506)) b!1152914))

(assert (= (and b!1152926 res!766300) b!1152909))

(assert (= (and b!1152907 res!766297) b!1152922))

(assert (= (and b!1152925 condMapEmpty!45161) mapIsEmpty!45161))

(assert (= (and b!1152925 (not condMapEmpty!45161)) mapNonEmpty!45161))

(get-info :version)

(assert (= (and mapNonEmpty!45161 ((_ is ValueCellFull!13736) mapValue!45161)) b!1152924))

(assert (= (and b!1152925 ((_ is ValueCellFull!13736) mapDefault!45161)) b!1152923))

(assert (= start!98992 b!1152925))

(declare-fun b_lambda!19461 () Bool)

(assert (=> (not b_lambda!19461) (not b!1152933)))

(declare-fun t!36527 () Bool)

(declare-fun tb!9165 () Bool)

(assert (=> (and start!98992 (= defaultEntry!1004 defaultEntry!1004) t!36527) tb!9165))

(declare-fun result!18903 () Bool)

(assert (=> tb!9165 (= result!18903 tp_is_empty!28891)))

(assert (=> b!1152933 t!36527))

(declare-fun b_and!39575 () Bool)

(assert (= b_and!39573 (and (=> t!36527 result!18903) b_and!39575)))

(declare-fun m!1063273 () Bool)

(assert (=> bm!53943 m!1063273))

(declare-fun m!1063275 () Bool)

(assert (=> bm!53936 m!1063275))

(declare-fun m!1063277 () Bool)

(assert (=> b!1152922 m!1063277))

(declare-fun m!1063279 () Bool)

(assert (=> b!1152909 m!1063279))

(declare-fun m!1063281 () Bool)

(assert (=> b!1152913 m!1063281))

(declare-fun m!1063283 () Bool)

(assert (=> b!1152926 m!1063283))

(declare-fun m!1063285 () Bool)

(assert (=> b!1152926 m!1063285))

(declare-fun m!1063287 () Bool)

(assert (=> b!1152926 m!1063287))

(declare-fun m!1063289 () Bool)

(assert (=> b!1152926 m!1063289))

(declare-fun m!1063291 () Bool)

(assert (=> b!1152936 m!1063291))

(declare-fun m!1063293 () Bool)

(assert (=> b!1152936 m!1063293))

(declare-fun m!1063295 () Bool)

(assert (=> b!1152911 m!1063295))

(declare-fun m!1063297 () Bool)

(assert (=> b!1152911 m!1063297))

(declare-fun m!1063299 () Bool)

(assert (=> b!1152919 m!1063299))

(declare-fun m!1063301 () Bool)

(assert (=> b!1152935 m!1063301))

(assert (=> b!1152935 m!1063301))

(declare-fun m!1063303 () Bool)

(assert (=> b!1152935 m!1063303))

(declare-fun m!1063305 () Bool)

(assert (=> b!1152935 m!1063305))

(declare-fun m!1063307 () Bool)

(assert (=> b!1152933 m!1063307))

(declare-fun m!1063309 () Bool)

(assert (=> b!1152933 m!1063309))

(declare-fun m!1063311 () Bool)

(assert (=> b!1152933 m!1063311))

(declare-fun m!1063313 () Bool)

(assert (=> b!1152933 m!1063313))

(declare-fun m!1063315 () Bool)

(assert (=> b!1152932 m!1063315))

(declare-fun m!1063317 () Bool)

(assert (=> b!1152932 m!1063317))

(declare-fun m!1063319 () Bool)

(assert (=> mapNonEmpty!45161 m!1063319))

(declare-fun m!1063321 () Bool)

(assert (=> start!98992 m!1063321))

(declare-fun m!1063323 () Bool)

(assert (=> start!98992 m!1063323))

(declare-fun m!1063325 () Bool)

(assert (=> b!1152916 m!1063325))

(declare-fun m!1063327 () Bool)

(assert (=> bm!53942 m!1063327))

(declare-fun m!1063329 () Bool)

(assert (=> bm!53939 m!1063329))

(assert (=> b!1152915 m!1063279))

(declare-fun m!1063331 () Bool)

(assert (=> b!1152921 m!1063331))

(assert (=> b!1152907 m!1063329))

(declare-fun m!1063333 () Bool)

(assert (=> b!1152907 m!1063333))

(declare-fun m!1063335 () Bool)

(assert (=> b!1152907 m!1063335))

(declare-fun m!1063337 () Bool)

(assert (=> b!1152907 m!1063337))

(declare-fun m!1063339 () Bool)

(assert (=> b!1152907 m!1063339))

(assert (=> b!1152907 m!1063295))

(declare-fun m!1063341 () Bool)

(assert (=> b!1152907 m!1063341))

(assert (=> b!1152907 m!1063333))

(declare-fun m!1063343 () Bool)

(assert (=> b!1152907 m!1063343))

(assert (=> b!1152907 m!1063339))

(assert (=> b!1152907 m!1063295))

(declare-fun m!1063345 () Bool)

(assert (=> b!1152907 m!1063345))

(assert (=> b!1152907 m!1063295))

(declare-fun m!1063347 () Bool)

(assert (=> b!1152918 m!1063347))

(assert (=> bm!53941 m!1063277))

(declare-fun m!1063349 () Bool)

(assert (=> b!1152934 m!1063349))

(declare-fun m!1063351 () Bool)

(assert (=> b!1152920 m!1063351))

(check-sat (not b!1152913) b_and!39575 (not bm!53942) (not b!1152933) (not b!1152911) (not b!1152907) (not b!1152935) (not b!1152919) (not start!98992) (not b_lambda!19461) (not b!1152932) (not b!1152918) tp_is_empty!28891 (not b!1152920) (not b!1152936) (not mapNonEmpty!45161) (not b!1152922) (not bm!53941) (not b_next!24361) (not bm!53939) (not b!1152915) (not bm!53936) (not b!1152909) (not b!1152934) (not b!1152926) (not b!1152921) (not bm!53943))
(check-sat b_and!39575 (not b_next!24361))
