; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98958 () Bool)

(assert start!98958)

(declare-fun b_free!24563 () Bool)

(declare-fun b_next!24563 () Bool)

(assert (=> start!98958 (= b_free!24563 (not b_next!24563))))

(declare-fun tp!86400 () Bool)

(declare-fun b_and!39975 () Bool)

(assert (=> start!98958 (= tp!86400 b_and!39975)))

(declare-fun b!1160910 () Bool)

(declare-fun res!770343 () Bool)

(declare-fun e!660144 () Bool)

(assert (=> b!1160910 (=> (not res!770343) (not e!660144))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160910 (= res!770343 (validMask!0 mask!1564))))

(declare-datatypes ((V!43917 0))(
  ( (V!43918 (val!14603 Int)) )
))
(declare-fun zeroValue!944 () V!43917)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18604 0))(
  ( (tuple2!18605 (_1!9313 (_ BitVec 64)) (_2!9313 V!43917)) )
))
(declare-datatypes ((List!25340 0))(
  ( (Nil!25337) (Cons!25336 (h!26545 tuple2!18604) (t!36895 List!25340)) )
))
(declare-datatypes ((ListLongMap!16573 0))(
  ( (ListLongMap!16574 (toList!8302 List!25340)) )
))
(declare-fun call!56305 () ListLongMap!16573)

(declare-datatypes ((array!75027 0))(
  ( (array!75028 (arr!36164 (Array (_ BitVec 32) (_ BitVec 64))) (size!36700 (_ BitVec 32))) )
))
(declare-fun lt!522322 () array!75027)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!56295 () Bool)

(declare-fun minValue!944 () V!43917)

(declare-datatypes ((ValueCell!13837 0))(
  ( (ValueCellFull!13837 (v!17240 V!43917)) (EmptyCell!13837) )
))
(declare-datatypes ((array!75029 0))(
  ( (array!75030 (arr!36165 (Array (_ BitVec 32) ValueCell!13837)) (size!36701 (_ BitVec 32))) )
))
(declare-fun lt!522330 () array!75029)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4766 (array!75027 array!75029 (_ BitVec 32) (_ BitVec 32) V!43917 V!43917 (_ BitVec 32) Int) ListLongMap!16573)

(assert (=> bm!56295 (= call!56305 (getCurrentListMapNoExtraKeys!4766 lt!522322 lt!522330 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160911 () Bool)

(declare-fun res!770336 () Bool)

(assert (=> b!1160911 (=> (not res!770336) (not e!660144))))

(declare-fun _keys!1208 () array!75027)

(declare-datatypes ((List!25341 0))(
  ( (Nil!25338) (Cons!25337 (h!26546 (_ BitVec 64)) (t!36896 List!25341)) )
))
(declare-fun arrayNoDuplicates!0 (array!75027 (_ BitVec 32) List!25341) Bool)

(assert (=> b!1160911 (= res!770336 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25338))))

(declare-fun b!1160912 () Bool)

(declare-datatypes ((Unit!38280 0))(
  ( (Unit!38281) )
))
(declare-fun e!660156 () Unit!38280)

(declare-fun Unit!38282 () Unit!38280)

(assert (=> b!1160912 (= e!660156 Unit!38282)))

(declare-fun b!1160913 () Bool)

(declare-fun e!660152 () Unit!38280)

(declare-fun Unit!38283 () Unit!38280)

(assert (=> b!1160913 (= e!660152 Unit!38283)))

(declare-fun e!660146 () Bool)

(declare-fun lt!522327 () Bool)

(declare-fun b!1160914 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1160914 (= e!660146 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522327) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!770345 () Bool)

(assert (=> start!98958 (=> (not res!770345) (not e!660144))))

(assert (=> start!98958 (= res!770345 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36700 _keys!1208))))))

(assert (=> start!98958 e!660144))

(declare-fun tp_is_empty!29093 () Bool)

(assert (=> start!98958 tp_is_empty!29093))

(declare-fun array_inv!27672 (array!75027) Bool)

(assert (=> start!98958 (array_inv!27672 _keys!1208)))

(assert (=> start!98958 true))

(assert (=> start!98958 tp!86400))

(declare-fun _values!996 () array!75029)

(declare-fun e!660154 () Bool)

(declare-fun array_inv!27673 (array!75029) Bool)

(assert (=> start!98958 (and (array_inv!27673 _values!996) e!660154)))

(declare-fun e!660149 () Bool)

(declare-fun b!1160915 () Bool)

(declare-fun arrayContainsKey!0 (array!75027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160915 (= e!660149 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160916 () Bool)

(declare-fun e!660140 () Bool)

(assert (=> b!1160916 (= e!660144 e!660140)))

(declare-fun res!770342 () Bool)

(assert (=> b!1160916 (=> (not res!770342) (not e!660140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75027 (_ BitVec 32)) Bool)

(assert (=> b!1160916 (= res!770342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522322 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160916 (= lt!522322 (array!75028 (store (arr!36164 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36700 _keys!1208)))))

(declare-fun b!1160917 () Bool)

(declare-fun res!770344 () Bool)

(assert (=> b!1160917 (=> (not res!770344) (not e!660144))))

(assert (=> b!1160917 (= res!770344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36700 _keys!1208))))))

(declare-fun b!1160918 () Bool)

(declare-fun e!660145 () Bool)

(assert (=> b!1160918 (= e!660145 tp_is_empty!29093)))

(declare-fun mapNonEmpty!45464 () Bool)

(declare-fun mapRes!45464 () Bool)

(declare-fun tp!86399 () Bool)

(assert (=> mapNonEmpty!45464 (= mapRes!45464 (and tp!86399 e!660145))))

(declare-fun mapRest!45464 () (Array (_ BitVec 32) ValueCell!13837))

(declare-fun mapValue!45464 () ValueCell!13837)

(declare-fun mapKey!45464 () (_ BitVec 32))

(assert (=> mapNonEmpty!45464 (= (arr!36165 _values!996) (store mapRest!45464 mapKey!45464 mapValue!45464))))

(declare-fun b!1160919 () Bool)

(declare-fun res!770339 () Bool)

(assert (=> b!1160919 (=> (not res!770339) (not e!660144))))

(assert (=> b!1160919 (= res!770339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!522313 () ListLongMap!16573)

(declare-fun c!115928 () Bool)

(declare-fun c!115930 () Bool)

(declare-fun bm!56296 () Bool)

(declare-fun call!56298 () Unit!38280)

(declare-fun addStillContains!949 (ListLongMap!16573 (_ BitVec 64) V!43917 (_ BitVec 64)) Unit!38280)

(assert (=> bm!56296 (= call!56298 (addStillContains!949 lt!522313 (ite (or c!115930 c!115928) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115930 c!115928) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1160920 () Bool)

(declare-fun e!660148 () Bool)

(assert (=> b!1160920 (= e!660148 true)))

(declare-fun e!660142 () Bool)

(assert (=> b!1160920 e!660142))

(declare-fun res!770334 () Bool)

(assert (=> b!1160920 (=> (not res!770334) (not e!660142))))

(declare-fun lt!522325 () ListLongMap!16573)

(assert (=> b!1160920 (= res!770334 (= lt!522325 lt!522313))))

(declare-fun lt!522324 () ListLongMap!16573)

(declare-fun -!1411 (ListLongMap!16573 (_ BitVec 64)) ListLongMap!16573)

(assert (=> b!1160920 (= lt!522325 (-!1411 lt!522324 k!934))))

(declare-fun lt!522320 () V!43917)

(declare-fun +!3707 (ListLongMap!16573 tuple2!18604) ListLongMap!16573)

(assert (=> b!1160920 (= (-!1411 (+!3707 lt!522313 (tuple2!18605 (select (arr!36164 _keys!1208) from!1455) lt!522320)) (select (arr!36164 _keys!1208) from!1455)) lt!522313)))

(declare-fun lt!522314 () Unit!38280)

(declare-fun addThenRemoveForNewKeyIsSame!245 (ListLongMap!16573 (_ BitVec 64) V!43917) Unit!38280)

(assert (=> b!1160920 (= lt!522314 (addThenRemoveForNewKeyIsSame!245 lt!522313 (select (arr!36164 _keys!1208) from!1455) lt!522320))))

(declare-fun lt!522329 () V!43917)

(declare-fun get!18445 (ValueCell!13837 V!43917) V!43917)

(assert (=> b!1160920 (= lt!522320 (get!18445 (select (arr!36165 _values!996) from!1455) lt!522329))))

(declare-fun lt!522333 () Unit!38280)

(assert (=> b!1160920 (= lt!522333 e!660152)))

(declare-fun c!115929 () Bool)

(declare-fun contains!6808 (ListLongMap!16573 (_ BitVec 64)) Bool)

(assert (=> b!1160920 (= c!115929 (contains!6808 lt!522313 k!934))))

(assert (=> b!1160920 (= lt!522313 (getCurrentListMapNoExtraKeys!4766 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56297 () Bool)

(declare-fun call!56302 () Unit!38280)

(assert (=> bm!56297 (= call!56302 call!56298)))

(declare-fun bm!56298 () Bool)

(declare-fun call!56303 () ListLongMap!16573)

(declare-fun lt!522318 () ListLongMap!16573)

(declare-fun call!56300 () Bool)

(assert (=> bm!56298 (= call!56300 (contains!6808 (ite c!115930 lt!522318 call!56303) k!934))))

(declare-fun bm!56299 () Bool)

(declare-fun call!56301 () ListLongMap!16573)

(assert (=> bm!56299 (= call!56303 call!56301)))

(declare-fun b!1160921 () Bool)

(assert (=> b!1160921 (= c!115928 (and (not lt!522327) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660150 () Unit!38280)

(declare-fun e!660143 () Unit!38280)

(assert (=> b!1160921 (= e!660150 e!660143)))

(declare-fun b!1160922 () Bool)

(assert (=> b!1160922 (contains!6808 (+!3707 lt!522318 (tuple2!18605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!522328 () Unit!38280)

(assert (=> b!1160922 (= lt!522328 (addStillContains!949 lt!522318 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1160922 call!56300))

(assert (=> b!1160922 (= lt!522318 call!56301)))

(declare-fun lt!522326 () Unit!38280)

(assert (=> b!1160922 (= lt!522326 call!56298)))

(assert (=> b!1160922 (= e!660150 lt!522328)))

(declare-fun b!1160923 () Bool)

(declare-fun Unit!38284 () Unit!38280)

(assert (=> b!1160923 (= e!660152 Unit!38284)))

(assert (=> b!1160923 (= lt!522327 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160923 (= c!115930 (and (not lt!522327) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522316 () Unit!38280)

(assert (=> b!1160923 (= lt!522316 e!660150)))

(declare-fun lt!522319 () Unit!38280)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!534 (array!75027 array!75029 (_ BitVec 32) (_ BitVec 32) V!43917 V!43917 (_ BitVec 64) (_ BitVec 32) Int) Unit!38280)

(assert (=> b!1160923 (= lt!522319 (lemmaListMapContainsThenArrayContainsFrom!534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115925 () Bool)

(assert (=> b!1160923 (= c!115925 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770335 () Bool)

(assert (=> b!1160923 (= res!770335 e!660146)))

(assert (=> b!1160923 (=> (not res!770335) (not e!660149))))

(assert (=> b!1160923 e!660149))

(declare-fun lt!522315 () Unit!38280)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75027 (_ BitVec 32) (_ BitVec 32)) Unit!38280)

(assert (=> b!1160923 (= lt!522315 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160923 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25338)))

(declare-fun lt!522312 () Unit!38280)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75027 (_ BitVec 64) (_ BitVec 32) List!25341) Unit!38280)

(assert (=> b!1160923 (= lt!522312 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25338))))

(assert (=> b!1160923 false))

(declare-fun b!1160924 () Bool)

(declare-fun res!770338 () Bool)

(assert (=> b!1160924 (=> (not res!770338) (not e!660144))))

(assert (=> b!1160924 (= res!770338 (and (= (size!36701 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36700 _keys!1208) (size!36701 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160925 () Bool)

(assert (=> b!1160925 (= e!660143 e!660156)))

(declare-fun c!115926 () Bool)

(assert (=> b!1160925 (= c!115926 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522327))))

(declare-fun b!1160926 () Bool)

(declare-fun e!660147 () Bool)

(assert (=> b!1160926 (= e!660147 tp_is_empty!29093)))

(declare-fun b!1160927 () Bool)

(assert (=> b!1160927 (= e!660154 (and e!660147 mapRes!45464))))

(declare-fun condMapEmpty!45464 () Bool)

(declare-fun mapDefault!45464 () ValueCell!13837)

