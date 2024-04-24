; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99106 () Bool)

(assert start!99106)

(declare-fun b_free!24475 () Bool)

(declare-fun b_next!24475 () Bool)

(assert (=> start!99106 (= b_free!24475 (not b_next!24475))))

(declare-fun tp!86136 () Bool)

(declare-fun b_and!39801 () Bool)

(assert (=> start!99106 (= tp!86136 b_and!39801)))

(declare-fun b!1158151 () Bool)

(declare-fun res!768874 () Bool)

(declare-fun e!658743 () Bool)

(assert (=> b!1158151 (=> (not res!768874) (not e!658743))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158151 (= res!768874 (validKeyInArray!0 k0!934))))

(declare-fun bm!55304 () Bool)

(declare-datatypes ((Unit!38088 0))(
  ( (Unit!38089) )
))
(declare-fun call!55312 () Unit!38088)

(declare-fun call!55307 () Unit!38088)

(assert (=> bm!55304 (= call!55312 call!55307)))

(declare-fun b!1158152 () Bool)

(declare-fun res!768867 () Bool)

(assert (=> b!1158152 (=> (not res!768867) (not e!658743))))

(declare-datatypes ((array!74901 0))(
  ( (array!74902 (arr!36095 (Array (_ BitVec 32) (_ BitVec 64))) (size!36632 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74901)

(declare-datatypes ((List!25286 0))(
  ( (Nil!25283) (Cons!25282 (h!26500 (_ BitVec 64)) (t!36745 List!25286)) )
))
(declare-fun arrayNoDuplicates!0 (array!74901 (_ BitVec 32) List!25286) Bool)

(assert (=> b!1158152 (= res!768867 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25283))))

(declare-fun mapNonEmpty!45332 () Bool)

(declare-fun mapRes!45332 () Bool)

(declare-fun tp!86135 () Bool)

(declare-fun e!658731 () Bool)

(assert (=> mapNonEmpty!45332 (= mapRes!45332 (and tp!86135 e!658731))))

(declare-datatypes ((V!43801 0))(
  ( (V!43802 (val!14559 Int)) )
))
(declare-datatypes ((ValueCell!13793 0))(
  ( (ValueCellFull!13793 (v!17192 V!43801)) (EmptyCell!13793) )
))
(declare-fun mapValue!45332 () ValueCell!13793)

(declare-fun mapKey!45332 () (_ BitVec 32))

(declare-datatypes ((array!74903 0))(
  ( (array!74904 (arr!36096 (Array (_ BitVec 32) ValueCell!13793)) (size!36633 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74903)

(declare-fun mapRest!45332 () (Array (_ BitVec 32) ValueCell!13793))

(assert (=> mapNonEmpty!45332 (= (arr!36096 _values!996) (store mapRest!45332 mapKey!45332 mapValue!45332))))

(declare-fun b!1158153 () Bool)

(declare-fun e!658744 () Bool)

(assert (=> b!1158153 (= e!658743 e!658744)))

(declare-fun res!768873 () Bool)

(assert (=> b!1158153 (=> (not res!768873) (not e!658744))))

(declare-fun lt!519892 () array!74901)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74901 (_ BitVec 32)) Bool)

(assert (=> b!1158153 (= res!768873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519892 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158153 (= lt!519892 (array!74902 (store (arr!36095 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36632 _keys!1208)))))

(declare-fun b!1158154 () Bool)

(declare-fun res!768868 () Bool)

(assert (=> b!1158154 (=> (not res!768868) (not e!658743))))

(assert (=> b!1158154 (= res!768868 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36632 _keys!1208))))))

(declare-fun b!1158155 () Bool)

(declare-fun e!658728 () Bool)

(declare-fun tp_is_empty!29005 () Bool)

(assert (=> b!1158155 (= e!658728 tp_is_empty!29005)))

(declare-fun bm!55305 () Bool)

(declare-fun call!55308 () Bool)

(declare-fun call!55313 () Bool)

(assert (=> bm!55305 (= call!55308 call!55313)))

(declare-fun b!1158156 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!658740 () Bool)

(declare-fun arrayContainsKey!0 (array!74901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158156 (= e!658740 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158157 () Bool)

(declare-fun e!658729 () Bool)

(declare-fun e!658735 () Bool)

(assert (=> b!1158157 (= e!658729 e!658735)))

(declare-fun res!768872 () Bool)

(assert (=> b!1158157 (=> res!768872 e!658735)))

(assert (=> b!1158157 (= res!768872 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!519896 () array!74903)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43801)

(declare-datatypes ((tuple2!18544 0))(
  ( (tuple2!18545 (_1!9283 (_ BitVec 64)) (_2!9283 V!43801)) )
))
(declare-datatypes ((List!25287 0))(
  ( (Nil!25284) (Cons!25283 (h!26501 tuple2!18544) (t!36746 List!25287)) )
))
(declare-datatypes ((ListLongMap!16521 0))(
  ( (ListLongMap!16522 (toList!8276 List!25287)) )
))
(declare-fun lt!519903 () ListLongMap!16521)

(declare-fun getCurrentListMapNoExtraKeys!4770 (array!74901 array!74903 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 32) Int) ListLongMap!16521)

(assert (=> b!1158157 (= lt!519903 (getCurrentListMapNoExtraKeys!4770 lt!519892 lt!519896 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519897 () V!43801)

(assert (=> b!1158157 (= lt!519896 (array!74904 (store (arr!36096 _values!996) i!673 (ValueCellFull!13793 lt!519897)) (size!36633 _values!996)))))

(declare-fun dynLambda!2783 (Int (_ BitVec 64)) V!43801)

(assert (=> b!1158157 (= lt!519897 (dynLambda!2783 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!519910 () ListLongMap!16521)

(assert (=> b!1158157 (= lt!519910 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158159 () Bool)

(declare-fun res!768870 () Bool)

(assert (=> b!1158159 (=> (not res!768870) (not e!658743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158159 (= res!768870 (validMask!0 mask!1564))))

(declare-fun b!1158160 () Bool)

(declare-fun e!658742 () Bool)

(assert (=> b!1158160 (= e!658742 (and e!658728 mapRes!45332))))

(declare-fun condMapEmpty!45332 () Bool)

(declare-fun mapDefault!45332 () ValueCell!13793)

(assert (=> b!1158160 (= condMapEmpty!45332 (= (arr!36096 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13793)) mapDefault!45332)))))

(declare-fun b!1158161 () Bool)

(declare-fun res!768876 () Bool)

(assert (=> b!1158161 (=> (not res!768876) (not e!658744))))

(assert (=> b!1158161 (= res!768876 (arrayNoDuplicates!0 lt!519892 #b00000000000000000000000000000000 Nil!25283))))

(declare-fun lt!519902 () ListLongMap!16521)

(declare-fun c!115536 () Bool)

(declare-fun bm!55306 () Bool)

(declare-fun c!115533 () Bool)

(declare-fun addStillContains!920 (ListLongMap!16521 (_ BitVec 64) V!43801 (_ BitVec 64)) Unit!38088)

(assert (=> bm!55306 (= call!55307 (addStillContains!920 lt!519902 (ite (or c!115536 c!115533) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115536 c!115533) zeroValue!944 minValue!944) k0!934))))

(declare-fun lt!519900 () Bool)

(declare-fun b!1158162 () Bool)

(declare-fun e!658736 () Bool)

(assert (=> b!1158162 (= e!658736 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519900) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158163 () Bool)

(declare-fun e!658739 () Bool)

(declare-fun call!55311 () ListLongMap!16521)

(declare-fun call!55310 () ListLongMap!16521)

(assert (=> b!1158163 (= e!658739 (= call!55311 call!55310))))

(declare-fun b!1158164 () Bool)

(declare-fun e!658733 () Bool)

(assert (=> b!1158164 (= e!658735 e!658733)))

(declare-fun res!768865 () Bool)

(assert (=> b!1158164 (=> res!768865 e!658733)))

(assert (=> b!1158164 (= res!768865 (not (= (select (arr!36095 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158164 e!658739))

(declare-fun c!115532 () Bool)

(assert (=> b!1158164 (= c!115532 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519911 () Unit!38088)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!619 (array!74901 array!74903 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38088)

(assert (=> b!1158164 (= lt!519911 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55307 () Bool)

(declare-fun lt!519898 () ListLongMap!16521)

(declare-fun call!55309 () ListLongMap!16521)

(declare-fun contains!6799 (ListLongMap!16521 (_ BitVec 64)) Bool)

(assert (=> bm!55307 (= call!55313 (contains!6799 (ite c!115536 lt!519898 call!55309) k0!934))))

(declare-fun b!1158165 () Bool)

(declare-fun res!768875 () Bool)

(assert (=> b!1158165 (=> (not res!768875) (not e!658743))))

(assert (=> b!1158165 (= res!768875 (and (= (size!36633 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36632 _keys!1208) (size!36633 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55308 () Bool)

(declare-fun call!55314 () ListLongMap!16521)

(assert (=> bm!55308 (= call!55309 call!55314)))

(declare-fun b!1158166 () Bool)

(declare-fun -!1378 (ListLongMap!16521 (_ BitVec 64)) ListLongMap!16521)

(assert (=> b!1158166 (= e!658739 (= call!55311 (-!1378 call!55310 k0!934)))))

(declare-fun b!1158167 () Bool)

(assert (=> b!1158167 (contains!6799 call!55314 k0!934)))

(declare-fun lt!519895 () Unit!38088)

(assert (=> b!1158167 (= lt!519895 (addStillContains!920 lt!519898 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1158167 call!55313))

(declare-fun +!3698 (ListLongMap!16521 tuple2!18544) ListLongMap!16521)

(assert (=> b!1158167 (= lt!519898 (+!3698 lt!519902 (tuple2!18545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519906 () Unit!38088)

(assert (=> b!1158167 (= lt!519906 call!55307)))

(declare-fun e!658738 () Unit!38088)

(assert (=> b!1158167 (= e!658738 lt!519895)))

(declare-fun b!1158168 () Bool)

(assert (=> b!1158168 (= e!658731 tp_is_empty!29005)))

(declare-fun b!1158169 () Bool)

(declare-fun e!658741 () Unit!38088)

(declare-fun e!658734 () Unit!38088)

(assert (=> b!1158169 (= e!658741 e!658734)))

(declare-fun c!115531 () Bool)

(assert (=> b!1158169 (= c!115531 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519900))))

(declare-fun b!1158170 () Bool)

(declare-fun res!768864 () Bool)

(assert (=> b!1158170 (=> (not res!768864) (not e!658743))))

(assert (=> b!1158170 (= res!768864 (= (select (arr!36095 _keys!1208) i!673) k0!934))))

(declare-fun b!1158171 () Bool)

(declare-fun e!658730 () Unit!38088)

(declare-fun Unit!38090 () Unit!38088)

(assert (=> b!1158171 (= e!658730 Unit!38090)))

(assert (=> b!1158171 (= lt!519900 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158171 (= c!115536 (and (not lt!519900) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519894 () Unit!38088)

(assert (=> b!1158171 (= lt!519894 e!658738)))

(declare-fun lt!519905 () Unit!38088)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!509 (array!74901 array!74903 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 64) (_ BitVec 32) Int) Unit!38088)

(assert (=> b!1158171 (= lt!519905 (lemmaListMapContainsThenArrayContainsFrom!509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115534 () Bool)

(assert (=> b!1158171 (= c!115534 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768862 () Bool)

(assert (=> b!1158171 (= res!768862 e!658736)))

(assert (=> b!1158171 (=> (not res!768862) (not e!658740))))

(assert (=> b!1158171 e!658740))

(declare-fun lt!519909 () Unit!38088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74901 (_ BitVec 32) (_ BitVec 32)) Unit!38088)

(assert (=> b!1158171 (= lt!519909 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158171 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25283)))

(declare-fun lt!519912 () Unit!38088)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74901 (_ BitVec 64) (_ BitVec 32) List!25286) Unit!38088)

(assert (=> b!1158171 (= lt!519912 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25283))))

(assert (=> b!1158171 false))

(declare-fun bm!55309 () Bool)

(assert (=> bm!55309 (= call!55310 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158172 () Bool)

(assert (=> b!1158172 (= e!658736 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55310 () Bool)

(assert (=> bm!55310 (= call!55314 (+!3698 (ite c!115536 lt!519898 lt!519902) (ite c!115536 (tuple2!18545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115533 (tuple2!18545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1158173 () Bool)

(assert (=> b!1158173 call!55308))

(declare-fun lt!519913 () Unit!38088)

(assert (=> b!1158173 (= lt!519913 call!55312)))

(assert (=> b!1158173 (= e!658734 lt!519913)))

(declare-fun b!1158158 () Bool)

(assert (=> b!1158158 (= c!115533 (and (not lt!519900) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158158 (= e!658738 e!658741)))

(declare-fun res!768869 () Bool)

(assert (=> start!99106 (=> (not res!768869) (not e!658743))))

(assert (=> start!99106 (= res!768869 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36632 _keys!1208))))))

(assert (=> start!99106 e!658743))

(assert (=> start!99106 tp_is_empty!29005))

(declare-fun array_inv!27686 (array!74901) Bool)

(assert (=> start!99106 (array_inv!27686 _keys!1208)))

(assert (=> start!99106 true))

(assert (=> start!99106 tp!86136))

(declare-fun array_inv!27687 (array!74903) Bool)

(assert (=> start!99106 (and (array_inv!27687 _values!996) e!658742)))

(declare-fun b!1158174 () Bool)

(declare-fun res!768871 () Bool)

(assert (=> b!1158174 (=> (not res!768871) (not e!658743))))

(assert (=> b!1158174 (= res!768871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158175 () Bool)

(assert (=> b!1158175 (= e!658744 (not e!658729))))

(declare-fun res!768863 () Bool)

(assert (=> b!1158175 (=> res!768863 e!658729)))

(assert (=> b!1158175 (= res!768863 (bvsgt from!1455 i!673))))

(assert (=> b!1158175 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519901 () Unit!38088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74901 (_ BitVec 64) (_ BitVec 32)) Unit!38088)

(assert (=> b!1158175 (= lt!519901 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158176 () Bool)

(assert (=> b!1158176 (= e!658733 true)))

(declare-fun e!658732 () Bool)

(assert (=> b!1158176 e!658732))

(declare-fun res!768866 () Bool)

(assert (=> b!1158176 (=> (not res!768866) (not e!658732))))

(declare-fun lt!519904 () ListLongMap!16521)

(assert (=> b!1158176 (= res!768866 (= lt!519904 lt!519902))))

(assert (=> b!1158176 (= lt!519904 (-!1378 lt!519910 k0!934))))

(declare-fun lt!519893 () V!43801)

(assert (=> b!1158176 (= (-!1378 (+!3698 lt!519902 (tuple2!18545 (select (arr!36095 _keys!1208) from!1455) lt!519893)) (select (arr!36095 _keys!1208) from!1455)) lt!519902)))

(declare-fun lt!519908 () Unit!38088)

(declare-fun addThenRemoveForNewKeyIsSame!215 (ListLongMap!16521 (_ BitVec 64) V!43801) Unit!38088)

(assert (=> b!1158176 (= lt!519908 (addThenRemoveForNewKeyIsSame!215 lt!519902 (select (arr!36095 _keys!1208) from!1455) lt!519893))))

(declare-fun get!18418 (ValueCell!13793 V!43801) V!43801)

(assert (=> b!1158176 (= lt!519893 (get!18418 (select (arr!36096 _values!996) from!1455) lt!519897))))

(declare-fun lt!519899 () Unit!38088)

(assert (=> b!1158176 (= lt!519899 e!658730)))

(declare-fun c!115535 () Bool)

(assert (=> b!1158176 (= c!115535 (contains!6799 lt!519902 k0!934))))

(assert (=> b!1158176 (= lt!519902 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158177 () Bool)

(declare-fun lt!519907 () Unit!38088)

(assert (=> b!1158177 (= e!658741 lt!519907)))

(assert (=> b!1158177 (= lt!519907 call!55312)))

(assert (=> b!1158177 call!55308))

(declare-fun b!1158178 () Bool)

(declare-fun Unit!38091 () Unit!38088)

(assert (=> b!1158178 (= e!658734 Unit!38091)))

(declare-fun mapIsEmpty!45332 () Bool)

(assert (=> mapIsEmpty!45332 mapRes!45332))

(declare-fun bm!55311 () Bool)

(assert (=> bm!55311 (= call!55311 (getCurrentListMapNoExtraKeys!4770 lt!519892 lt!519896 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158179 () Bool)

(assert (=> b!1158179 (= e!658732 (= lt!519904 (getCurrentListMapNoExtraKeys!4770 lt!519892 lt!519896 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158180 () Bool)

(declare-fun Unit!38092 () Unit!38088)

(assert (=> b!1158180 (= e!658730 Unit!38092)))

(assert (= (and start!99106 res!768869) b!1158159))

(assert (= (and b!1158159 res!768870) b!1158165))

(assert (= (and b!1158165 res!768875) b!1158174))

(assert (= (and b!1158174 res!768871) b!1158152))

(assert (= (and b!1158152 res!768867) b!1158154))

(assert (= (and b!1158154 res!768868) b!1158151))

(assert (= (and b!1158151 res!768874) b!1158170))

(assert (= (and b!1158170 res!768864) b!1158153))

(assert (= (and b!1158153 res!768873) b!1158161))

(assert (= (and b!1158161 res!768876) b!1158175))

(assert (= (and b!1158175 (not res!768863)) b!1158157))

(assert (= (and b!1158157 (not res!768872)) b!1158164))

(assert (= (and b!1158164 c!115532) b!1158166))

(assert (= (and b!1158164 (not c!115532)) b!1158163))

(assert (= (or b!1158166 b!1158163) bm!55311))

(assert (= (or b!1158166 b!1158163) bm!55309))

(assert (= (and b!1158164 (not res!768865)) b!1158176))

(assert (= (and b!1158176 c!115535) b!1158171))

(assert (= (and b!1158176 (not c!115535)) b!1158180))

(assert (= (and b!1158171 c!115536) b!1158167))

(assert (= (and b!1158171 (not c!115536)) b!1158158))

(assert (= (and b!1158158 c!115533) b!1158177))

(assert (= (and b!1158158 (not c!115533)) b!1158169))

(assert (= (and b!1158169 c!115531) b!1158173))

(assert (= (and b!1158169 (not c!115531)) b!1158178))

(assert (= (or b!1158177 b!1158173) bm!55304))

(assert (= (or b!1158177 b!1158173) bm!55308))

(assert (= (or b!1158177 b!1158173) bm!55305))

(assert (= (or b!1158167 bm!55305) bm!55307))

(assert (= (or b!1158167 bm!55304) bm!55306))

(assert (= (or b!1158167 bm!55308) bm!55310))

(assert (= (and b!1158171 c!115534) b!1158172))

(assert (= (and b!1158171 (not c!115534)) b!1158162))

(assert (= (and b!1158171 res!768862) b!1158156))

(assert (= (and b!1158176 res!768866) b!1158179))

(assert (= (and b!1158160 condMapEmpty!45332) mapIsEmpty!45332))

(assert (= (and b!1158160 (not condMapEmpty!45332)) mapNonEmpty!45332))

(get-info :version)

(assert (= (and mapNonEmpty!45332 ((_ is ValueCellFull!13793) mapValue!45332)) b!1158168))

(assert (= (and b!1158160 ((_ is ValueCellFull!13793) mapDefault!45332)) b!1158155))

(assert (= start!99106 b!1158160))

(declare-fun b_lambda!19575 () Bool)

(assert (=> (not b_lambda!19575) (not b!1158157)))

(declare-fun t!36744 () Bool)

(declare-fun tb!9279 () Bool)

(assert (=> (and start!99106 (= defaultEntry!1004 defaultEntry!1004) t!36744) tb!9279))

(declare-fun result!19131 () Bool)

(assert (=> tb!9279 (= result!19131 tp_is_empty!29005)))

(assert (=> b!1158157 t!36744))

(declare-fun b_and!39803 () Bool)

(assert (= b_and!39801 (and (=> t!36744 result!19131) b_and!39803)))

(declare-fun m!1067837 () Bool)

(assert (=> b!1158171 m!1067837))

(declare-fun m!1067839 () Bool)

(assert (=> b!1158171 m!1067839))

(declare-fun m!1067841 () Bool)

(assert (=> b!1158171 m!1067841))

(declare-fun m!1067843 () Bool)

(assert (=> b!1158171 m!1067843))

(declare-fun m!1067845 () Bool)

(assert (=> start!99106 m!1067845))

(declare-fun m!1067847 () Bool)

(assert (=> start!99106 m!1067847))

(declare-fun m!1067849 () Bool)

(assert (=> b!1158153 m!1067849))

(declare-fun m!1067851 () Bool)

(assert (=> b!1158153 m!1067851))

(declare-fun m!1067853 () Bool)

(assert (=> bm!55310 m!1067853))

(declare-fun m!1067855 () Bool)

(assert (=> b!1158161 m!1067855))

(declare-fun m!1067857 () Bool)

(assert (=> b!1158167 m!1067857))

(declare-fun m!1067859 () Bool)

(assert (=> b!1158167 m!1067859))

(declare-fun m!1067861 () Bool)

(assert (=> b!1158167 m!1067861))

(declare-fun m!1067863 () Bool)

(assert (=> b!1158166 m!1067863))

(declare-fun m!1067865 () Bool)

(assert (=> b!1158179 m!1067865))

(declare-fun m!1067867 () Bool)

(assert (=> b!1158151 m!1067867))

(declare-fun m!1067869 () Bool)

(assert (=> b!1158157 m!1067869))

(declare-fun m!1067871 () Bool)

(assert (=> b!1158157 m!1067871))

(declare-fun m!1067873 () Bool)

(assert (=> b!1158157 m!1067873))

(declare-fun m!1067875 () Bool)

(assert (=> b!1158157 m!1067875))

(declare-fun m!1067877 () Bool)

(assert (=> b!1158159 m!1067877))

(declare-fun m!1067879 () Bool)

(assert (=> bm!55306 m!1067879))

(declare-fun m!1067881 () Bool)

(assert (=> mapNonEmpty!45332 m!1067881))

(declare-fun m!1067883 () Bool)

(assert (=> bm!55309 m!1067883))

(declare-fun m!1067885 () Bool)

(assert (=> b!1158170 m!1067885))

(declare-fun m!1067887 () Bool)

(assert (=> b!1158156 m!1067887))

(assert (=> b!1158176 m!1067883))

(declare-fun m!1067889 () Bool)

(assert (=> b!1158176 m!1067889))

(declare-fun m!1067891 () Bool)

(assert (=> b!1158176 m!1067891))

(assert (=> b!1158176 m!1067889))

(declare-fun m!1067893 () Bool)

(assert (=> b!1158176 m!1067893))

(declare-fun m!1067895 () Bool)

(assert (=> b!1158176 m!1067895))

(declare-fun m!1067897 () Bool)

(assert (=> b!1158176 m!1067897))

(assert (=> b!1158176 m!1067893))

(assert (=> b!1158176 m!1067895))

(declare-fun m!1067899 () Bool)

(assert (=> b!1158176 m!1067899))

(declare-fun m!1067901 () Bool)

(assert (=> b!1158176 m!1067901))

(declare-fun m!1067903 () Bool)

(assert (=> b!1158176 m!1067903))

(assert (=> b!1158176 m!1067895))

(declare-fun m!1067905 () Bool)

(assert (=> b!1158175 m!1067905))

(declare-fun m!1067907 () Bool)

(assert (=> b!1158175 m!1067907))

(declare-fun m!1067909 () Bool)

(assert (=> b!1158174 m!1067909))

(assert (=> b!1158172 m!1067887))

(assert (=> bm!55311 m!1067865))

(assert (=> b!1158164 m!1067895))

(declare-fun m!1067911 () Bool)

(assert (=> b!1158164 m!1067911))

(declare-fun m!1067913 () Bool)

(assert (=> b!1158152 m!1067913))

(declare-fun m!1067915 () Bool)

(assert (=> bm!55307 m!1067915))

(check-sat (not b!1158172) (not b!1158176) (not b!1158171) (not bm!55310) (not b!1158153) (not mapNonEmpty!45332) (not b!1158151) (not b!1158164) (not bm!55309) (not bm!55306) (not b!1158179) (not bm!55311) (not b!1158167) tp_is_empty!29005 (not bm!55307) (not b_next!24475) b_and!39803 (not b!1158161) (not b!1158152) (not b_lambda!19575) (not b!1158166) (not b!1158156) (not b!1158175) (not start!99106) (not b!1158159) (not b!1158157) (not b!1158174))
(check-sat b_and!39803 (not b_next!24475))
