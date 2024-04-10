; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101076 () Bool)

(assert start!101076)

(declare-fun b_free!26037 () Bool)

(declare-fun b_next!26037 () Bool)

(assert (=> start!101076 (= b_free!26037 (not b_next!26037))))

(declare-fun tp!91130 () Bool)

(declare-fun b_and!43173 () Bool)

(assert (=> start!101076 (= tp!91130 b_and!43173)))

(declare-datatypes ((V!46115 0))(
  ( (V!46116 (val!15427 Int)) )
))
(declare-fun zeroValue!944 () V!46115)

(declare-fun bm!59903 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14661 0))(
  ( (ValueCellFull!14661 (v!18079 V!46115)) (EmptyCell!14661) )
))
(declare-datatypes ((array!78269 0))(
  ( (array!78270 (arr!37770 (Array (_ BitVec 32) ValueCell!14661)) (size!38306 (_ BitVec 32))) )
))
(declare-fun lt!550326 () array!78269)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46115)

(declare-datatypes ((tuple2!19818 0))(
  ( (tuple2!19819 (_1!9920 (_ BitVec 64)) (_2!9920 V!46115)) )
))
(declare-datatypes ((List!26619 0))(
  ( (Nil!26616) (Cons!26615 (h!27824 tuple2!19818) (t!39636 List!26619)) )
))
(declare-datatypes ((ListLongMap!17787 0))(
  ( (ListLongMap!17788 (toList!8909 List!26619)) )
))
(declare-fun call!59908 () ListLongMap!17787)

(declare-datatypes ((array!78271 0))(
  ( (array!78272 (arr!37771 (Array (_ BitVec 32) (_ BitVec 64))) (size!38307 (_ BitVec 32))) )
))
(declare-fun lt!550337 () array!78271)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5341 (array!78271 array!78269 (_ BitVec 32) (_ BitVec 32) V!46115 V!46115 (_ BitVec 32) Int) ListLongMap!17787)

(assert (=> bm!59903 (= call!59908 (getCurrentListMapNoExtraKeys!5341 lt!550337 lt!550326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211561 () Bool)

(declare-fun c!119492 () Bool)

(declare-fun lt!550336 () Bool)

(assert (=> b!1211561 (= c!119492 (and (not lt!550336) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!40172 0))(
  ( (Unit!40173) )
))
(declare-fun e!688067 () Unit!40172)

(declare-fun e!688070 () Unit!40172)

(assert (=> b!1211561 (= e!688067 e!688070)))

(declare-fun b!1211562 () Bool)

(declare-fun res!804836 () Bool)

(declare-fun e!688065 () Bool)

(assert (=> b!1211562 (=> (not res!804836) (not e!688065))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!78271)

(assert (=> b!1211562 (= res!804836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38307 _keys!1208))))))

(declare-fun b!1211563 () Bool)

(declare-fun e!688073 () Bool)

(declare-fun call!59907 () ListLongMap!17787)

(assert (=> b!1211563 (= e!688073 (= call!59908 call!59907))))

(declare-fun b!1211564 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!688068 () Bool)

(declare-fun arrayContainsKey!0 (array!78271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211564 (= e!688068 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211565 () Bool)

(declare-fun e!688075 () Unit!40172)

(declare-fun Unit!40174 () Unit!40172)

(assert (=> b!1211565 (= e!688075 Unit!40174)))

(declare-fun b!1211566 () Bool)

(declare-fun res!804847 () Bool)

(assert (=> b!1211566 (=> (not res!804847) (not e!688065))))

(declare-fun _values!996 () array!78269)

(assert (=> b!1211566 (= res!804847 (and (= (size!38306 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38307 _keys!1208) (size!38306 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!59904 () Bool)

(declare-fun c!119497 () Bool)

(declare-fun lt!550343 () ListLongMap!17787)

(declare-fun call!59913 () Bool)

(declare-fun call!59910 () ListLongMap!17787)

(declare-fun contains!6981 (ListLongMap!17787 (_ BitVec 64)) Bool)

(assert (=> bm!59904 (= call!59913 (contains!6981 (ite c!119497 lt!550343 call!59910) k0!934))))

(declare-fun b!1211567 () Bool)

(declare-fun e!688079 () Bool)

(declare-fun e!688076 () Bool)

(assert (=> b!1211567 (= e!688079 e!688076)))

(declare-fun res!804849 () Bool)

(assert (=> b!1211567 (=> res!804849 e!688076)))

(assert (=> b!1211567 (= res!804849 (not (= (select (arr!37771 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211567 e!688073))

(declare-fun c!119493 () Bool)

(assert (=> b!1211567 (= c!119493 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550338 () Unit!40172)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1067 (array!78271 array!78269 (_ BitVec 32) (_ BitVec 32) V!46115 V!46115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40172)

(assert (=> b!1211567 (= lt!550338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1067 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211568 () Bool)

(declare-fun -!1857 (ListLongMap!17787 (_ BitVec 64)) ListLongMap!17787)

(assert (=> b!1211568 (= e!688073 (= call!59908 (-!1857 call!59907 k0!934)))))

(declare-fun bm!59905 () Bool)

(declare-fun call!59912 () ListLongMap!17787)

(assert (=> bm!59905 (= call!59910 call!59912)))

(declare-fun b!1211569 () Bool)

(declare-fun res!804846 () Bool)

(assert (=> b!1211569 (=> (not res!804846) (not e!688065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78271 (_ BitVec 32)) Bool)

(assert (=> b!1211569 (= res!804846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211570 () Bool)

(declare-fun e!688066 () Bool)

(assert (=> b!1211570 (= e!688065 e!688066)))

(declare-fun res!804844 () Bool)

(assert (=> b!1211570 (=> (not res!804844) (not e!688066))))

(assert (=> b!1211570 (= res!804844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550337 mask!1564))))

(assert (=> b!1211570 (= lt!550337 (array!78272 (store (arr!37771 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38307 _keys!1208)))))

(declare-fun b!1211571 () Bool)

(declare-fun call!59911 () Bool)

(assert (=> b!1211571 call!59911))

(declare-fun lt!550346 () Unit!40172)

(declare-fun call!59909 () Unit!40172)

(assert (=> b!1211571 (= lt!550346 call!59909)))

(assert (=> b!1211571 (= e!688075 lt!550346)))

(declare-fun b!1211572 () Bool)

(declare-fun res!804845 () Bool)

(assert (=> b!1211572 (=> (not res!804845) (not e!688065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211572 (= res!804845 (validKeyInArray!0 k0!934))))

(declare-fun b!1211573 () Bool)

(declare-fun res!804842 () Bool)

(assert (=> b!1211573 (=> (not res!804842) (not e!688066))))

(declare-datatypes ((List!26620 0))(
  ( (Nil!26617) (Cons!26616 (h!27825 (_ BitVec 64)) (t!39637 List!26620)) )
))
(declare-fun arrayNoDuplicates!0 (array!78271 (_ BitVec 32) List!26620) Bool)

(assert (=> b!1211573 (= res!804842 (arrayNoDuplicates!0 lt!550337 #b00000000000000000000000000000000 Nil!26617))))

(declare-fun e!688080 () Bool)

(declare-fun b!1211574 () Bool)

(assert (=> b!1211574 (= e!688080 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211575 () Bool)

(declare-fun e!688074 () Bool)

(assert (=> b!1211575 (= e!688074 e!688079)))

(declare-fun res!804840 () Bool)

(assert (=> b!1211575 (=> res!804840 e!688079)))

(assert (=> b!1211575 (= res!804840 (not (= from!1455 i!673)))))

(declare-fun lt!550339 () ListLongMap!17787)

(assert (=> b!1211575 (= lt!550339 (getCurrentListMapNoExtraKeys!5341 lt!550337 lt!550326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550329 () V!46115)

(assert (=> b!1211575 (= lt!550326 (array!78270 (store (arr!37770 _values!996) i!673 (ValueCellFull!14661 lt!550329)) (size!38306 _values!996)))))

(declare-fun dynLambda!3235 (Int (_ BitVec 64)) V!46115)

(assert (=> b!1211575 (= lt!550329 (dynLambda!3235 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550331 () ListLongMap!17787)

(assert (=> b!1211575 (= lt!550331 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211576 () Bool)

(declare-fun res!804850 () Bool)

(assert (=> b!1211576 (=> (not res!804850) (not e!688065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211576 (= res!804850 (validMask!0 mask!1564))))

(declare-fun b!1211577 () Bool)

(assert (=> b!1211577 (contains!6981 call!59912 k0!934)))

(declare-fun lt!550327 () Unit!40172)

(declare-fun call!59906 () Unit!40172)

(assert (=> b!1211577 (= lt!550327 call!59906)))

(assert (=> b!1211577 call!59913))

(declare-fun lt!550334 () ListLongMap!17787)

(declare-fun +!4027 (ListLongMap!17787 tuple2!19818) ListLongMap!17787)

(assert (=> b!1211577 (= lt!550343 (+!4027 lt!550334 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550345 () Unit!40172)

(declare-fun addStillContains!1054 (ListLongMap!17787 (_ BitVec 64) V!46115 (_ BitVec 64)) Unit!40172)

(assert (=> b!1211577 (= lt!550345 (addStillContains!1054 lt!550334 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1211577 (= e!688067 lt!550327)))

(declare-fun bm!59906 () Bool)

(assert (=> bm!59906 (= call!59911 call!59913)))

(declare-fun b!1211578 () Bool)

(assert (=> b!1211578 (= e!688066 (not e!688074))))

(declare-fun res!804838 () Bool)

(assert (=> b!1211578 (=> res!804838 e!688074)))

(assert (=> b!1211578 (= res!804838 (bvsgt from!1455 i!673))))

(assert (=> b!1211578 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550330 () Unit!40172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78271 (_ BitVec 64) (_ BitVec 32)) Unit!40172)

(assert (=> b!1211578 (= lt!550330 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1211579 () Bool)

(declare-fun res!804848 () Bool)

(assert (=> b!1211579 (=> (not res!804848) (not e!688065))))

(assert (=> b!1211579 (= res!804848 (= (select (arr!37771 _keys!1208) i!673) k0!934))))

(declare-fun e!688077 () Bool)

(declare-fun b!1211580 () Bool)

(assert (=> b!1211580 (= e!688077 (= (-!1857 lt!550331 k0!934) lt!550334))))

(declare-fun b!1211581 () Bool)

(assert (=> b!1211581 (= e!688076 (bvslt i!673 (size!38306 _values!996)))))

(assert (=> b!1211581 e!688077))

(declare-fun res!804841 () Bool)

(assert (=> b!1211581 (=> (not res!804841) (not e!688077))))

(declare-fun lt!550333 () V!46115)

(assert (=> b!1211581 (= res!804841 (= (-!1857 (+!4027 lt!550334 (tuple2!19819 (select (arr!37771 _keys!1208) from!1455) lt!550333)) (select (arr!37771 _keys!1208) from!1455)) lt!550334))))

(declare-fun lt!550341 () Unit!40172)

(declare-fun addThenRemoveForNewKeyIsSame!274 (ListLongMap!17787 (_ BitVec 64) V!46115) Unit!40172)

(assert (=> b!1211581 (= lt!550341 (addThenRemoveForNewKeyIsSame!274 lt!550334 (select (arr!37771 _keys!1208) from!1455) lt!550333))))

(declare-fun get!19247 (ValueCell!14661 V!46115) V!46115)

(assert (=> b!1211581 (= lt!550333 (get!19247 (select (arr!37770 _values!996) from!1455) lt!550329))))

(declare-fun lt!550335 () Unit!40172)

(declare-fun e!688072 () Unit!40172)

(assert (=> b!1211581 (= lt!550335 e!688072)))

(declare-fun c!119494 () Bool)

(assert (=> b!1211581 (= c!119494 (contains!6981 lt!550334 k0!934))))

(assert (=> b!1211581 (= lt!550334 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59907 () Bool)

(assert (=> bm!59907 (= call!59906 (addStillContains!1054 (ite c!119497 lt!550343 lt!550334) (ite c!119497 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119492 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119497 minValue!944 (ite c!119492 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!47983 () Bool)

(declare-fun mapRes!47983 () Bool)

(assert (=> mapIsEmpty!47983 mapRes!47983))

(declare-fun b!1211582 () Bool)

(declare-fun res!804837 () Bool)

(assert (=> b!1211582 (=> (not res!804837) (not e!688065))))

(assert (=> b!1211582 (= res!804837 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26617))))

(declare-fun b!1211583 () Bool)

(declare-fun Unit!40175 () Unit!40172)

(assert (=> b!1211583 (= e!688072 Unit!40175)))

(assert (=> b!1211583 (= lt!550336 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211583 (= c!119497 (and (not lt!550336) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550344 () Unit!40172)

(assert (=> b!1211583 (= lt!550344 e!688067)))

(declare-fun lt!550332 () Unit!40172)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!605 (array!78271 array!78269 (_ BitVec 32) (_ BitVec 32) V!46115 V!46115 (_ BitVec 64) (_ BitVec 32) Int) Unit!40172)

(assert (=> b!1211583 (= lt!550332 (lemmaListMapContainsThenArrayContainsFrom!605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119495 () Bool)

(assert (=> b!1211583 (= c!119495 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804839 () Bool)

(assert (=> b!1211583 (= res!804839 e!688080)))

(assert (=> b!1211583 (=> (not res!804839) (not e!688068))))

(assert (=> b!1211583 e!688068))

(declare-fun lt!550328 () Unit!40172)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78271 (_ BitVec 32) (_ BitVec 32)) Unit!40172)

(assert (=> b!1211583 (= lt!550328 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211583 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26617)))

(declare-fun lt!550342 () Unit!40172)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78271 (_ BitVec 64) (_ BitVec 32) List!26620) Unit!40172)

(assert (=> b!1211583 (= lt!550342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26617))))

(assert (=> b!1211583 false))

(declare-fun mapNonEmpty!47983 () Bool)

(declare-fun tp!91129 () Bool)

(declare-fun e!688069 () Bool)

(assert (=> mapNonEmpty!47983 (= mapRes!47983 (and tp!91129 e!688069))))

(declare-fun mapKey!47983 () (_ BitVec 32))

(declare-fun mapValue!47983 () ValueCell!14661)

(declare-fun mapRest!47983 () (Array (_ BitVec 32) ValueCell!14661))

(assert (=> mapNonEmpty!47983 (= (arr!37770 _values!996) (store mapRest!47983 mapKey!47983 mapValue!47983))))

(declare-fun b!1211584 () Bool)

(declare-fun lt!550340 () Unit!40172)

(assert (=> b!1211584 (= e!688070 lt!550340)))

(assert (=> b!1211584 (= lt!550340 call!59909)))

(assert (=> b!1211584 call!59911))

(declare-fun b!1211585 () Bool)

(assert (=> b!1211585 (= e!688070 e!688075)))

(declare-fun c!119496 () Bool)

(assert (=> b!1211585 (= c!119496 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550336))))

(declare-fun bm!59908 () Bool)

(assert (=> bm!59908 (= call!59907 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211586 () Bool)

(assert (=> b!1211586 (= e!688080 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550336) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211587 () Bool)

(declare-fun Unit!40176 () Unit!40172)

(assert (=> b!1211587 (= e!688072 Unit!40176)))

(declare-fun b!1211588 () Bool)

(declare-fun e!688078 () Bool)

(declare-fun tp_is_empty!30741 () Bool)

(assert (=> b!1211588 (= e!688078 tp_is_empty!30741)))

(declare-fun b!1211589 () Bool)

(assert (=> b!1211589 (= e!688069 tp_is_empty!30741)))

(declare-fun res!804843 () Bool)

(assert (=> start!101076 (=> (not res!804843) (not e!688065))))

(assert (=> start!101076 (= res!804843 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38307 _keys!1208))))))

(assert (=> start!101076 e!688065))

(assert (=> start!101076 tp_is_empty!30741))

(declare-fun array_inv!28770 (array!78271) Bool)

(assert (=> start!101076 (array_inv!28770 _keys!1208)))

(assert (=> start!101076 true))

(assert (=> start!101076 tp!91130))

(declare-fun e!688064 () Bool)

(declare-fun array_inv!28771 (array!78269) Bool)

(assert (=> start!101076 (and (array_inv!28771 _values!996) e!688064)))

(declare-fun bm!59909 () Bool)

(assert (=> bm!59909 (= call!59909 call!59906)))

(declare-fun bm!59910 () Bool)

(assert (=> bm!59910 (= call!59912 (+!4027 (ite c!119497 lt!550343 lt!550334) (ite c!119497 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119492 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211590 () Bool)

(assert (=> b!1211590 (= e!688064 (and e!688078 mapRes!47983))))

(declare-fun condMapEmpty!47983 () Bool)

(declare-fun mapDefault!47983 () ValueCell!14661)

(assert (=> b!1211590 (= condMapEmpty!47983 (= (arr!37770 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14661)) mapDefault!47983)))))

(assert (= (and start!101076 res!804843) b!1211576))

(assert (= (and b!1211576 res!804850) b!1211566))

(assert (= (and b!1211566 res!804847) b!1211569))

(assert (= (and b!1211569 res!804846) b!1211582))

(assert (= (and b!1211582 res!804837) b!1211562))

(assert (= (and b!1211562 res!804836) b!1211572))

(assert (= (and b!1211572 res!804845) b!1211579))

(assert (= (and b!1211579 res!804848) b!1211570))

(assert (= (and b!1211570 res!804844) b!1211573))

(assert (= (and b!1211573 res!804842) b!1211578))

(assert (= (and b!1211578 (not res!804838)) b!1211575))

(assert (= (and b!1211575 (not res!804840)) b!1211567))

(assert (= (and b!1211567 c!119493) b!1211568))

(assert (= (and b!1211567 (not c!119493)) b!1211563))

(assert (= (or b!1211568 b!1211563) bm!59903))

(assert (= (or b!1211568 b!1211563) bm!59908))

(assert (= (and b!1211567 (not res!804849)) b!1211581))

(assert (= (and b!1211581 c!119494) b!1211583))

(assert (= (and b!1211581 (not c!119494)) b!1211587))

(assert (= (and b!1211583 c!119497) b!1211577))

(assert (= (and b!1211583 (not c!119497)) b!1211561))

(assert (= (and b!1211561 c!119492) b!1211584))

(assert (= (and b!1211561 (not c!119492)) b!1211585))

(assert (= (and b!1211585 c!119496) b!1211571))

(assert (= (and b!1211585 (not c!119496)) b!1211565))

(assert (= (or b!1211584 b!1211571) bm!59909))

(assert (= (or b!1211584 b!1211571) bm!59905))

(assert (= (or b!1211584 b!1211571) bm!59906))

(assert (= (or b!1211577 bm!59906) bm!59904))

(assert (= (or b!1211577 bm!59909) bm!59907))

(assert (= (or b!1211577 bm!59905) bm!59910))

(assert (= (and b!1211583 c!119495) b!1211574))

(assert (= (and b!1211583 (not c!119495)) b!1211586))

(assert (= (and b!1211583 res!804839) b!1211564))

(assert (= (and b!1211581 res!804841) b!1211580))

(assert (= (and b!1211590 condMapEmpty!47983) mapIsEmpty!47983))

(assert (= (and b!1211590 (not condMapEmpty!47983)) mapNonEmpty!47983))

(get-info :version)

(assert (= (and mapNonEmpty!47983 ((_ is ValueCellFull!14661) mapValue!47983)) b!1211589))

(assert (= (and b!1211590 ((_ is ValueCellFull!14661) mapDefault!47983)) b!1211588))

(assert (= start!101076 b!1211590))

(declare-fun b_lambda!21675 () Bool)

(assert (=> (not b_lambda!21675) (not b!1211575)))

(declare-fun t!39635 () Bool)

(declare-fun tb!10837 () Bool)

(assert (=> (and start!101076 (= defaultEntry!1004 defaultEntry!1004) t!39635) tb!10837))

(declare-fun result!22269 () Bool)

(assert (=> tb!10837 (= result!22269 tp_is_empty!30741)))

(assert (=> b!1211575 t!39635))

(declare-fun b_and!43175 () Bool)

(assert (= b_and!43173 (and (=> t!39635 result!22269) b_and!43175)))

(declare-fun m!1116999 () Bool)

(assert (=> b!1211582 m!1116999))

(declare-fun m!1117001 () Bool)

(assert (=> bm!59910 m!1117001))

(declare-fun m!1117003 () Bool)

(assert (=> start!101076 m!1117003))

(declare-fun m!1117005 () Bool)

(assert (=> start!101076 m!1117005))

(declare-fun m!1117007 () Bool)

(assert (=> b!1211576 m!1117007))

(declare-fun m!1117009 () Bool)

(assert (=> bm!59904 m!1117009))

(declare-fun m!1117011 () Bool)

(assert (=> b!1211575 m!1117011))

(declare-fun m!1117013 () Bool)

(assert (=> b!1211575 m!1117013))

(declare-fun m!1117015 () Bool)

(assert (=> b!1211575 m!1117015))

(declare-fun m!1117017 () Bool)

(assert (=> b!1211575 m!1117017))

(declare-fun m!1117019 () Bool)

(assert (=> b!1211568 m!1117019))

(declare-fun m!1117021 () Bool)

(assert (=> bm!59907 m!1117021))

(declare-fun m!1117023 () Bool)

(assert (=> b!1211567 m!1117023))

(declare-fun m!1117025 () Bool)

(assert (=> b!1211567 m!1117025))

(declare-fun m!1117027 () Bool)

(assert (=> b!1211583 m!1117027))

(declare-fun m!1117029 () Bool)

(assert (=> b!1211583 m!1117029))

(declare-fun m!1117031 () Bool)

(assert (=> b!1211583 m!1117031))

(declare-fun m!1117033 () Bool)

(assert (=> b!1211583 m!1117033))

(declare-fun m!1117035 () Bool)

(assert (=> b!1211581 m!1117035))

(declare-fun m!1117037 () Bool)

(assert (=> b!1211581 m!1117037))

(declare-fun m!1117039 () Bool)

(assert (=> b!1211581 m!1117039))

(assert (=> b!1211581 m!1117037))

(declare-fun m!1117041 () Bool)

(assert (=> b!1211581 m!1117041))

(assert (=> b!1211581 m!1117023))

(declare-fun m!1117043 () Bool)

(assert (=> b!1211581 m!1117043))

(declare-fun m!1117045 () Bool)

(assert (=> b!1211581 m!1117045))

(assert (=> b!1211581 m!1117041))

(assert (=> b!1211581 m!1117023))

(declare-fun m!1117047 () Bool)

(assert (=> b!1211581 m!1117047))

(assert (=> b!1211581 m!1117023))

(declare-fun m!1117049 () Bool)

(assert (=> b!1211564 m!1117049))

(declare-fun m!1117051 () Bool)

(assert (=> mapNonEmpty!47983 m!1117051))

(declare-fun m!1117053 () Bool)

(assert (=> bm!59903 m!1117053))

(declare-fun m!1117055 () Bool)

(assert (=> b!1211579 m!1117055))

(declare-fun m!1117057 () Bool)

(assert (=> b!1211580 m!1117057))

(declare-fun m!1117059 () Bool)

(assert (=> b!1211569 m!1117059))

(declare-fun m!1117061 () Bool)

(assert (=> b!1211573 m!1117061))

(declare-fun m!1117063 () Bool)

(assert (=> b!1211578 m!1117063))

(declare-fun m!1117065 () Bool)

(assert (=> b!1211578 m!1117065))

(declare-fun m!1117067 () Bool)

(assert (=> b!1211572 m!1117067))

(assert (=> b!1211574 m!1117049))

(declare-fun m!1117069 () Bool)

(assert (=> b!1211570 m!1117069))

(declare-fun m!1117071 () Bool)

(assert (=> b!1211570 m!1117071))

(declare-fun m!1117073 () Bool)

(assert (=> b!1211577 m!1117073))

(declare-fun m!1117075 () Bool)

(assert (=> b!1211577 m!1117075))

(declare-fun m!1117077 () Bool)

(assert (=> b!1211577 m!1117077))

(assert (=> bm!59908 m!1117035))

(check-sat (not bm!59904) (not b!1211577) (not bm!59903) (not b!1211567) (not bm!59907) tp_is_empty!30741 (not b!1211573) (not b!1211582) (not bm!59908) (not b!1211574) (not mapNonEmpty!47983) (not start!101076) (not b!1211583) (not b_next!26037) (not b!1211568) (not b!1211570) b_and!43175 (not bm!59910) (not b!1211564) (not b!1211572) (not b!1211575) (not b!1211576) (not b!1211569) (not b_lambda!21675) (not b!1211580) (not b!1211578) (not b!1211581))
(check-sat b_and!43175 (not b_next!26037))
