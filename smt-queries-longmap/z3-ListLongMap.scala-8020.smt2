; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98954 () Bool)

(assert start!98954)

(declare-fun b_free!24565 () Bool)

(declare-fun b_next!24565 () Bool)

(assert (=> start!98954 (= b_free!24565 (not b_next!24565))))

(declare-fun tp!86405 () Bool)

(declare-fun b_and!39957 () Bool)

(assert (=> start!98954 (= tp!86405 b_and!39957)))

(declare-fun b!1160878 () Bool)

(declare-fun e!660113 () Bool)

(declare-datatypes ((V!43921 0))(
  ( (V!43922 (val!14604 Int)) )
))
(declare-datatypes ((tuple2!18690 0))(
  ( (tuple2!18691 (_1!9356 (_ BitVec 64)) (_2!9356 V!43921)) )
))
(declare-datatypes ((List!25409 0))(
  ( (Nil!25406) (Cons!25405 (h!26614 tuple2!18690) (t!36957 List!25409)) )
))
(declare-datatypes ((ListLongMap!16659 0))(
  ( (ListLongMap!16660 (toList!8345 List!25409)) )
))
(declare-fun call!56300 () ListLongMap!16659)

(declare-fun call!56302 () ListLongMap!16659)

(assert (=> b!1160878 (= e!660113 (= call!56300 call!56302))))

(declare-fun b!1160879 () Bool)

(declare-fun e!660116 () Bool)

(declare-fun e!660127 () Bool)

(assert (=> b!1160879 (= e!660116 e!660127)))

(declare-fun res!770318 () Bool)

(assert (=> b!1160879 (=> (not res!770318) (not e!660127))))

(declare-datatypes ((array!74948 0))(
  ( (array!74949 (arr!36125 (Array (_ BitVec 32) (_ BitVec 64))) (size!36663 (_ BitVec 32))) )
))
(declare-fun lt!522193 () array!74948)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74948 (_ BitVec 32)) Bool)

(assert (=> b!1160879 (= res!770318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522193 mask!1564))))

(declare-fun _keys!1208 () array!74948)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160879 (= lt!522193 (array!74949 (store (arr!36125 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36663 _keys!1208)))))

(declare-fun b!1160880 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1395 (ListLongMap!16659 (_ BitVec 64)) ListLongMap!16659)

(assert (=> b!1160880 (= e!660113 (= call!56300 (-!1395 call!56302 k0!934)))))

(declare-fun b!1160881 () Bool)

(declare-fun call!56306 () ListLongMap!16659)

(declare-fun contains!6793 (ListLongMap!16659 (_ BitVec 64)) Bool)

(assert (=> b!1160881 (contains!6793 call!56306 k0!934)))

(declare-datatypes ((Unit!38119 0))(
  ( (Unit!38120) )
))
(declare-fun lt!522190 () Unit!38119)

(declare-fun lt!522206 () ListLongMap!16659)

(declare-fun minValue!944 () V!43921)

(declare-fun addStillContains!958 (ListLongMap!16659 (_ BitVec 64) V!43921 (_ BitVec 64)) Unit!38119)

(assert (=> b!1160881 (= lt!522190 (addStillContains!958 lt!522206 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56304 () Bool)

(assert (=> b!1160881 call!56304))

(declare-fun lt!522204 () ListLongMap!16659)

(declare-fun zeroValue!944 () V!43921)

(declare-fun +!3751 (ListLongMap!16659 tuple2!18690) ListLongMap!16659)

(assert (=> b!1160881 (= lt!522206 (+!3751 lt!522204 (tuple2!18691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522198 () Unit!38119)

(declare-fun call!56303 () Unit!38119)

(assert (=> b!1160881 (= lt!522198 call!56303)))

(declare-fun e!660120 () Unit!38119)

(assert (=> b!1160881 (= e!660120 lt!522190)))

(declare-fun b!1160882 () Bool)

(declare-fun e!660118 () Bool)

(assert (=> b!1160882 (= e!660127 (not e!660118))))

(declare-fun res!770319 () Bool)

(assert (=> b!1160882 (=> res!770319 e!660118)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1160882 (= res!770319 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160882 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522194 () Unit!38119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74948 (_ BitVec 64) (_ BitVec 32)) Unit!38119)

(assert (=> b!1160882 (= lt!522194 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160883 () Bool)

(declare-fun c!115919 () Bool)

(declare-fun lt!522205 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1160883 (= c!115919 (and (not lt!522205) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660128 () Unit!38119)

(assert (=> b!1160883 (= e!660120 e!660128)))

(declare-fun b!1160884 () Bool)

(declare-fun e!660117 () Bool)

(assert (=> b!1160884 (= e!660117 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522205) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160885 () Bool)

(declare-fun res!770323 () Bool)

(assert (=> b!1160885 (=> (not res!770323) (not e!660116))))

(declare-datatypes ((ValueCell!13838 0))(
  ( (ValueCellFull!13838 (v!17240 V!43921)) (EmptyCell!13838) )
))
(declare-datatypes ((array!74950 0))(
  ( (array!74951 (arr!36126 (Array (_ BitVec 32) ValueCell!13838)) (size!36664 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74950)

(assert (=> b!1160885 (= res!770323 (and (= (size!36664 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36663 _keys!1208) (size!36664 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160886 () Bool)

(declare-fun lt!522191 () Unit!38119)

(assert (=> b!1160886 (= e!660128 lt!522191)))

(declare-fun call!56305 () Unit!38119)

(assert (=> b!1160886 (= lt!522191 call!56305)))

(declare-fun call!56301 () Bool)

(assert (=> b!1160886 call!56301))

(declare-fun lt!522207 () array!74950)

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!660129 () Bool)

(declare-fun lt!522199 () ListLongMap!16659)

(declare-fun b!1160887 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4823 (array!74948 array!74950 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 32) Int) ListLongMap!16659)

(assert (=> b!1160887 (= e!660129 (= lt!522199 (getCurrentListMapNoExtraKeys!4823 lt!522193 lt!522207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160888 () Bool)

(declare-fun res!770315 () Bool)

(assert (=> b!1160888 (=> (not res!770315) (not e!660116))))

(assert (=> b!1160888 (= res!770315 (= (select (arr!36125 _keys!1208) i!673) k0!934))))

(declare-fun bm!56296 () Bool)

(assert (=> bm!56296 (= call!56301 call!56304)))

(declare-fun b!1160889 () Bool)

(declare-fun e!660126 () Bool)

(declare-fun tp_is_empty!29095 () Bool)

(assert (=> b!1160889 (= e!660126 tp_is_empty!29095)))

(declare-fun bm!56297 () Bool)

(declare-fun c!115921 () Bool)

(assert (=> bm!56297 (= call!56303 (addStillContains!958 lt!522204 (ite (or c!115921 c!115919) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115921 c!115919) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160890 () Bool)

(declare-fun e!660114 () Unit!38119)

(declare-fun Unit!38121 () Unit!38119)

(assert (=> b!1160890 (= e!660114 Unit!38121)))

(declare-fun b!1160891 () Bool)

(declare-fun res!770313 () Bool)

(assert (=> b!1160891 (=> (not res!770313) (not e!660116))))

(assert (=> b!1160891 (= res!770313 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36663 _keys!1208))))))

(declare-fun b!1160892 () Bool)

(declare-fun e!660119 () Bool)

(assert (=> b!1160892 (= e!660118 e!660119)))

(declare-fun res!770317 () Bool)

(assert (=> b!1160892 (=> res!770317 e!660119)))

(assert (=> b!1160892 (= res!770317 (not (= from!1455 i!673)))))

(declare-fun lt!522187 () ListLongMap!16659)

(assert (=> b!1160892 (= lt!522187 (getCurrentListMapNoExtraKeys!4823 lt!522193 lt!522207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522188 () V!43921)

(assert (=> b!1160892 (= lt!522207 (array!74951 (store (arr!36126 _values!996) i!673 (ValueCellFull!13838 lt!522188)) (size!36664 _values!996)))))

(declare-fun dynLambda!2766 (Int (_ BitVec 64)) V!43921)

(assert (=> b!1160892 (= lt!522188 (dynLambda!2766 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522189 () ListLongMap!16659)

(assert (=> b!1160892 (= lt!522189 (getCurrentListMapNoExtraKeys!4823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160893 () Bool)

(assert (=> b!1160893 call!56301))

(declare-fun lt!522202 () Unit!38119)

(assert (=> b!1160893 (= lt!522202 call!56305)))

(declare-fun e!660115 () Unit!38119)

(assert (=> b!1160893 (= e!660115 lt!522202)))

(declare-fun b!1160894 () Bool)

(declare-fun e!660121 () Bool)

(assert (=> b!1160894 (= e!660121 true)))

(assert (=> b!1160894 e!660129))

(declare-fun res!770316 () Bool)

(assert (=> b!1160894 (=> (not res!770316) (not e!660129))))

(assert (=> b!1160894 (= res!770316 (= lt!522199 lt!522204))))

(assert (=> b!1160894 (= lt!522199 (-!1395 lt!522189 k0!934))))

(declare-fun lt!522197 () V!43921)

(assert (=> b!1160894 (= (-!1395 (+!3751 lt!522204 (tuple2!18691 (select (arr!36125 _keys!1208) from!1455) lt!522197)) (select (arr!36125 _keys!1208) from!1455)) lt!522204)))

(declare-fun lt!522186 () Unit!38119)

(declare-fun addThenRemoveForNewKeyIsSame!240 (ListLongMap!16659 (_ BitVec 64) V!43921) Unit!38119)

(assert (=> b!1160894 (= lt!522186 (addThenRemoveForNewKeyIsSame!240 lt!522204 (select (arr!36125 _keys!1208) from!1455) lt!522197))))

(declare-fun get!18442 (ValueCell!13838 V!43921) V!43921)

(assert (=> b!1160894 (= lt!522197 (get!18442 (select (arr!36126 _values!996) from!1455) lt!522188))))

(declare-fun lt!522200 () Unit!38119)

(assert (=> b!1160894 (= lt!522200 e!660114)))

(declare-fun c!115917 () Bool)

(assert (=> b!1160894 (= c!115917 (contains!6793 lt!522204 k0!934))))

(assert (=> b!1160894 (= lt!522204 (getCurrentListMapNoExtraKeys!4823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160895 () Bool)

(assert (=> b!1160895 (= e!660119 e!660121)))

(declare-fun res!770314 () Bool)

(assert (=> b!1160895 (=> res!770314 e!660121)))

(assert (=> b!1160895 (= res!770314 (not (= (select (arr!36125 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160895 e!660113))

(declare-fun c!115918 () Bool)

(assert (=> b!1160895 (= c!115918 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522203 () Unit!38119)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!663 (array!74948 array!74950 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38119)

(assert (=> b!1160895 (= lt!522203 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!663 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56298 () Bool)

(assert (=> bm!56298 (= call!56305 call!56303)))

(declare-fun bm!56299 () Bool)

(declare-fun call!56299 () ListLongMap!16659)

(assert (=> bm!56299 (= call!56304 (contains!6793 (ite c!115921 lt!522206 call!56299) k0!934))))

(declare-fun b!1160896 () Bool)

(assert (=> b!1160896 (= e!660128 e!660115)))

(declare-fun c!115920 () Bool)

(assert (=> b!1160896 (= c!115920 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522205))))

(declare-fun b!1160897 () Bool)

(declare-fun res!770326 () Bool)

(assert (=> b!1160897 (=> (not res!770326) (not e!660116))))

(declare-datatypes ((List!25410 0))(
  ( (Nil!25407) (Cons!25406 (h!26615 (_ BitVec 64)) (t!36958 List!25410)) )
))
(declare-fun arrayNoDuplicates!0 (array!74948 (_ BitVec 32) List!25410) Bool)

(assert (=> b!1160897 (= res!770326 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25407))))

(declare-fun b!1160898 () Bool)

(declare-fun Unit!38122 () Unit!38119)

(assert (=> b!1160898 (= e!660115 Unit!38122)))

(declare-fun b!1160899 () Bool)

(declare-fun e!660122 () Bool)

(declare-fun mapRes!45467 () Bool)

(assert (=> b!1160899 (= e!660122 (and e!660126 mapRes!45467))))

(declare-fun condMapEmpty!45467 () Bool)

(declare-fun mapDefault!45467 () ValueCell!13838)

(assert (=> b!1160899 (= condMapEmpty!45467 (= (arr!36126 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13838)) mapDefault!45467)))))

(declare-fun bm!56300 () Bool)

(assert (=> bm!56300 (= call!56300 (getCurrentListMapNoExtraKeys!4823 lt!522193 lt!522207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160900 () Bool)

(declare-fun res!770324 () Bool)

(assert (=> b!1160900 (=> (not res!770324) (not e!660116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160900 (= res!770324 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45467 () Bool)

(assert (=> mapIsEmpty!45467 mapRes!45467))

(declare-fun bm!56301 () Bool)

(assert (=> bm!56301 (= call!56302 (getCurrentListMapNoExtraKeys!4823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!660124 () Bool)

(declare-fun b!1160901 () Bool)

(assert (=> b!1160901 (= e!660124 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160902 () Bool)

(declare-fun e!660123 () Bool)

(assert (=> b!1160902 (= e!660123 tp_is_empty!29095)))

(declare-fun mapNonEmpty!45467 () Bool)

(declare-fun tp!86406 () Bool)

(assert (=> mapNonEmpty!45467 (= mapRes!45467 (and tp!86406 e!660123))))

(declare-fun mapValue!45467 () ValueCell!13838)

(declare-fun mapRest!45467 () (Array (_ BitVec 32) ValueCell!13838))

(declare-fun mapKey!45467 () (_ BitVec 32))

(assert (=> mapNonEmpty!45467 (= (arr!36126 _values!996) (store mapRest!45467 mapKey!45467 mapValue!45467))))

(declare-fun b!1160903 () Bool)

(declare-fun Unit!38123 () Unit!38119)

(assert (=> b!1160903 (= e!660114 Unit!38123)))

(assert (=> b!1160903 (= lt!522205 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160903 (= c!115921 (and (not lt!522205) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522196 () Unit!38119)

(assert (=> b!1160903 (= lt!522196 e!660120)))

(declare-fun lt!522201 () Unit!38119)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!531 (array!74948 array!74950 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 64) (_ BitVec 32) Int) Unit!38119)

(assert (=> b!1160903 (= lt!522201 (lemmaListMapContainsThenArrayContainsFrom!531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115922 () Bool)

(assert (=> b!1160903 (= c!115922 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770322 () Bool)

(assert (=> b!1160903 (= res!770322 e!660117)))

(assert (=> b!1160903 (=> (not res!770322) (not e!660124))))

(assert (=> b!1160903 e!660124))

(declare-fun lt!522195 () Unit!38119)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74948 (_ BitVec 32) (_ BitVec 32)) Unit!38119)

(assert (=> b!1160903 (= lt!522195 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160903 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25407)))

(declare-fun lt!522192 () Unit!38119)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74948 (_ BitVec 64) (_ BitVec 32) List!25410) Unit!38119)

(assert (=> b!1160903 (= lt!522192 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25407))))

(assert (=> b!1160903 false))

(declare-fun b!1160904 () Bool)

(declare-fun res!770320 () Bool)

(assert (=> b!1160904 (=> (not res!770320) (not e!660116))))

(assert (=> b!1160904 (= res!770320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160905 () Bool)

(assert (=> b!1160905 (= e!660117 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160906 () Bool)

(declare-fun res!770321 () Bool)

(assert (=> b!1160906 (=> (not res!770321) (not e!660116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160906 (= res!770321 (validMask!0 mask!1564))))

(declare-fun res!770327 () Bool)

(assert (=> start!98954 (=> (not res!770327) (not e!660116))))

(assert (=> start!98954 (= res!770327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36663 _keys!1208))))))

(assert (=> start!98954 e!660116))

(assert (=> start!98954 tp_is_empty!29095))

(declare-fun array_inv!27758 (array!74948) Bool)

(assert (=> start!98954 (array_inv!27758 _keys!1208)))

(assert (=> start!98954 true))

(assert (=> start!98954 tp!86405))

(declare-fun array_inv!27759 (array!74950) Bool)

(assert (=> start!98954 (and (array_inv!27759 _values!996) e!660122)))

(declare-fun bm!56302 () Bool)

(assert (=> bm!56302 (= call!56306 (+!3751 (ite c!115921 lt!522206 lt!522204) (ite c!115921 (tuple2!18691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115919 (tuple2!18691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1160907 () Bool)

(declare-fun res!770325 () Bool)

(assert (=> b!1160907 (=> (not res!770325) (not e!660127))))

(assert (=> b!1160907 (= res!770325 (arrayNoDuplicates!0 lt!522193 #b00000000000000000000000000000000 Nil!25407))))

(declare-fun bm!56303 () Bool)

(assert (=> bm!56303 (= call!56299 call!56306)))

(assert (= (and start!98954 res!770327) b!1160906))

(assert (= (and b!1160906 res!770321) b!1160885))

(assert (= (and b!1160885 res!770323) b!1160904))

(assert (= (and b!1160904 res!770320) b!1160897))

(assert (= (and b!1160897 res!770326) b!1160891))

(assert (= (and b!1160891 res!770313) b!1160900))

(assert (= (and b!1160900 res!770324) b!1160888))

(assert (= (and b!1160888 res!770315) b!1160879))

(assert (= (and b!1160879 res!770318) b!1160907))

(assert (= (and b!1160907 res!770325) b!1160882))

(assert (= (and b!1160882 (not res!770319)) b!1160892))

(assert (= (and b!1160892 (not res!770317)) b!1160895))

(assert (= (and b!1160895 c!115918) b!1160880))

(assert (= (and b!1160895 (not c!115918)) b!1160878))

(assert (= (or b!1160880 b!1160878) bm!56300))

(assert (= (or b!1160880 b!1160878) bm!56301))

(assert (= (and b!1160895 (not res!770314)) b!1160894))

(assert (= (and b!1160894 c!115917) b!1160903))

(assert (= (and b!1160894 (not c!115917)) b!1160890))

(assert (= (and b!1160903 c!115921) b!1160881))

(assert (= (and b!1160903 (not c!115921)) b!1160883))

(assert (= (and b!1160883 c!115919) b!1160886))

(assert (= (and b!1160883 (not c!115919)) b!1160896))

(assert (= (and b!1160896 c!115920) b!1160893))

(assert (= (and b!1160896 (not c!115920)) b!1160898))

(assert (= (or b!1160886 b!1160893) bm!56298))

(assert (= (or b!1160886 b!1160893) bm!56303))

(assert (= (or b!1160886 b!1160893) bm!56296))

(assert (= (or b!1160881 bm!56296) bm!56299))

(assert (= (or b!1160881 bm!56298) bm!56297))

(assert (= (or b!1160881 bm!56303) bm!56302))

(assert (= (and b!1160903 c!115922) b!1160905))

(assert (= (and b!1160903 (not c!115922)) b!1160884))

(assert (= (and b!1160903 res!770322) b!1160901))

(assert (= (and b!1160894 res!770316) b!1160887))

(assert (= (and b!1160899 condMapEmpty!45467) mapIsEmpty!45467))

(assert (= (and b!1160899 (not condMapEmpty!45467)) mapNonEmpty!45467))

(get-info :version)

(assert (= (and mapNonEmpty!45467 ((_ is ValueCellFull!13838) mapValue!45467)) b!1160902))

(assert (= (and b!1160899 ((_ is ValueCellFull!13838) mapDefault!45467)) b!1160889))

(assert (= start!98954 b!1160899))

(declare-fun b_lambda!19653 () Bool)

(assert (=> (not b_lambda!19653) (not b!1160892)))

(declare-fun t!36956 () Bool)

(declare-fun tb!9369 () Bool)

(assert (=> (and start!98954 (= defaultEntry!1004 defaultEntry!1004) t!36956) tb!9369))

(declare-fun result!19311 () Bool)

(assert (=> tb!9369 (= result!19311 tp_is_empty!29095)))

(assert (=> b!1160892 t!36956))

(declare-fun b_and!39959 () Bool)

(assert (= b_and!39957 (and (=> t!36956 result!19311) b_and!39959)))

(declare-fun m!1069275 () Bool)

(assert (=> b!1160900 m!1069275))

(declare-fun m!1069277 () Bool)

(assert (=> b!1160882 m!1069277))

(declare-fun m!1069279 () Bool)

(assert (=> b!1160882 m!1069279))

(declare-fun m!1069281 () Bool)

(assert (=> bm!56297 m!1069281))

(declare-fun m!1069283 () Bool)

(assert (=> b!1160880 m!1069283))

(declare-fun m!1069285 () Bool)

(assert (=> b!1160905 m!1069285))

(declare-fun m!1069287 () Bool)

(assert (=> start!98954 m!1069287))

(declare-fun m!1069289 () Bool)

(assert (=> start!98954 m!1069289))

(declare-fun m!1069291 () Bool)

(assert (=> b!1160894 m!1069291))

(declare-fun m!1069293 () Bool)

(assert (=> b!1160894 m!1069293))

(declare-fun m!1069295 () Bool)

(assert (=> b!1160894 m!1069295))

(assert (=> b!1160894 m!1069295))

(declare-fun m!1069297 () Bool)

(assert (=> b!1160894 m!1069297))

(declare-fun m!1069299 () Bool)

(assert (=> b!1160894 m!1069299))

(assert (=> b!1160894 m!1069293))

(declare-fun m!1069301 () Bool)

(assert (=> b!1160894 m!1069301))

(declare-fun m!1069303 () Bool)

(assert (=> b!1160894 m!1069303))

(declare-fun m!1069305 () Bool)

(assert (=> b!1160894 m!1069305))

(assert (=> b!1160894 m!1069297))

(declare-fun m!1069307 () Bool)

(assert (=> b!1160894 m!1069307))

(assert (=> b!1160894 m!1069297))

(declare-fun m!1069309 () Bool)

(assert (=> b!1160903 m!1069309))

(declare-fun m!1069311 () Bool)

(assert (=> b!1160903 m!1069311))

(declare-fun m!1069313 () Bool)

(assert (=> b!1160903 m!1069313))

(declare-fun m!1069315 () Bool)

(assert (=> b!1160903 m!1069315))

(declare-fun m!1069317 () Bool)

(assert (=> bm!56300 m!1069317))

(declare-fun m!1069319 () Bool)

(assert (=> b!1160879 m!1069319))

(declare-fun m!1069321 () Bool)

(assert (=> b!1160879 m!1069321))

(assert (=> b!1160901 m!1069285))

(declare-fun m!1069323 () Bool)

(assert (=> mapNonEmpty!45467 m!1069323))

(declare-fun m!1069325 () Bool)

(assert (=> b!1160881 m!1069325))

(declare-fun m!1069327 () Bool)

(assert (=> b!1160881 m!1069327))

(declare-fun m!1069329 () Bool)

(assert (=> b!1160881 m!1069329))

(declare-fun m!1069331 () Bool)

(assert (=> bm!56302 m!1069331))

(declare-fun m!1069333 () Bool)

(assert (=> b!1160907 m!1069333))

(declare-fun m!1069335 () Bool)

(assert (=> b!1160897 m!1069335))

(assert (=> b!1160887 m!1069317))

(declare-fun m!1069337 () Bool)

(assert (=> b!1160892 m!1069337))

(declare-fun m!1069339 () Bool)

(assert (=> b!1160892 m!1069339))

(declare-fun m!1069341 () Bool)

(assert (=> b!1160892 m!1069341))

(declare-fun m!1069343 () Bool)

(assert (=> b!1160892 m!1069343))

(assert (=> bm!56301 m!1069291))

(assert (=> b!1160895 m!1069297))

(declare-fun m!1069345 () Bool)

(assert (=> b!1160895 m!1069345))

(declare-fun m!1069347 () Bool)

(assert (=> b!1160906 m!1069347))

(declare-fun m!1069349 () Bool)

(assert (=> b!1160904 m!1069349))

(declare-fun m!1069351 () Bool)

(assert (=> b!1160888 m!1069351))

(declare-fun m!1069353 () Bool)

(assert (=> bm!56299 m!1069353))

(check-sat (not b!1160881) (not mapNonEmpty!45467) (not b!1160905) (not b!1160904) (not b!1160897) (not b!1160882) (not bm!56301) (not b!1160906) (not b_next!24565) (not b!1160892) (not b!1160887) (not b!1160900) (not start!98954) b_and!39959 (not b!1160895) (not b!1160907) (not bm!56297) (not b!1160879) (not b!1160901) (not bm!56302) (not bm!56300) (not b!1160894) (not b!1160880) (not b_lambda!19653) (not b!1160903) tp_is_empty!29095 (not bm!56299))
(check-sat b_and!39959 (not b_next!24565))
