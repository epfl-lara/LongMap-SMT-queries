; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98918 () Bool)

(assert start!98918)

(declare-fun b_free!24529 () Bool)

(declare-fun b_next!24529 () Bool)

(assert (=> start!98918 (= b_free!24529 (not b_next!24529))))

(declare-fun tp!86297 () Bool)

(declare-fun b_and!39885 () Bool)

(assert (=> start!98918 (= tp!86297 b_and!39885)))

(declare-fun b!1159222 () Bool)

(declare-datatypes ((Unit!38051 0))(
  ( (Unit!38052) )
))
(declare-fun e!659208 () Unit!38051)

(declare-fun Unit!38053 () Unit!38051)

(assert (=> b!1159222 (= e!659208 Unit!38053)))

(declare-fun bm!55864 () Bool)

(declare-fun call!55869 () Unit!38051)

(declare-fun call!55867 () Unit!38051)

(assert (=> bm!55864 (= call!55869 call!55867)))

(declare-fun b!1159223 () Bool)

(declare-fun res!769517 () Bool)

(declare-fun e!659196 () Bool)

(assert (=> b!1159223 (=> (not res!769517) (not e!659196))))

(declare-datatypes ((array!74880 0))(
  ( (array!74881 (arr!36091 (Array (_ BitVec 32) (_ BitVec 64))) (size!36629 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74880)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1159223 (= res!769517 (= (select (arr!36091 _keys!1208) i!673) k0!934))))

(declare-fun b!1159224 () Bool)

(declare-fun e!659211 () Bool)

(assert (=> b!1159224 (= e!659211 true)))

(declare-fun e!659210 () Bool)

(assert (=> b!1159224 e!659210))

(declare-fun res!769508 () Bool)

(assert (=> b!1159224 (=> (not res!769508) (not e!659210))))

(declare-datatypes ((V!43873 0))(
  ( (V!43874 (val!14586 Int)) )
))
(declare-datatypes ((tuple2!18656 0))(
  ( (tuple2!18657 (_1!9339 (_ BitVec 64)) (_2!9339 V!43873)) )
))
(declare-datatypes ((List!25377 0))(
  ( (Nil!25374) (Cons!25373 (h!26582 tuple2!18656) (t!36889 List!25377)) )
))
(declare-datatypes ((ListLongMap!16625 0))(
  ( (ListLongMap!16626 (toList!8328 List!25377)) )
))
(declare-fun lt!521015 () ListLongMap!16625)

(declare-fun lt!521007 () ListLongMap!16625)

(assert (=> b!1159224 (= res!769508 (= lt!521015 lt!521007))))

(declare-fun lt!521012 () ListLongMap!16625)

(declare-fun -!1381 (ListLongMap!16625 (_ BitVec 64)) ListLongMap!16625)

(assert (=> b!1159224 (= lt!521015 (-!1381 lt!521012 k0!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!521006 () V!43873)

(declare-fun +!3735 (ListLongMap!16625 tuple2!18656) ListLongMap!16625)

(assert (=> b!1159224 (= (-!1381 (+!3735 lt!521007 (tuple2!18657 (select (arr!36091 _keys!1208) from!1455) lt!521006)) (select (arr!36091 _keys!1208) from!1455)) lt!521007)))

(declare-fun lt!521002 () Unit!38051)

(declare-fun addThenRemoveForNewKeyIsSame!228 (ListLongMap!16625 (_ BitVec 64) V!43873) Unit!38051)

(assert (=> b!1159224 (= lt!521002 (addThenRemoveForNewKeyIsSame!228 lt!521007 (select (arr!36091 _keys!1208) from!1455) lt!521006))))

(declare-datatypes ((ValueCell!13820 0))(
  ( (ValueCellFull!13820 (v!17222 V!43873)) (EmptyCell!13820) )
))
(declare-datatypes ((array!74882 0))(
  ( (array!74883 (arr!36092 (Array (_ BitVec 32) ValueCell!13820)) (size!36630 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74882)

(declare-fun lt!521008 () V!43873)

(declare-fun get!18418 (ValueCell!13820 V!43873) V!43873)

(assert (=> b!1159224 (= lt!521006 (get!18418 (select (arr!36092 _values!996) from!1455) lt!521008))))

(declare-fun lt!521001 () Unit!38051)

(assert (=> b!1159224 (= lt!521001 e!659208)))

(declare-fun c!115596 () Bool)

(declare-fun contains!6778 (ListLongMap!16625 (_ BitVec 64)) Bool)

(assert (=> b!1159224 (= c!115596 (contains!6778 lt!521007 k0!934))))

(declare-fun zeroValue!944 () V!43873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43873)

(declare-fun getCurrentListMapNoExtraKeys!4807 (array!74880 array!74882 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 32) Int) ListLongMap!16625)

(assert (=> b!1159224 (= lt!521007 (getCurrentListMapNoExtraKeys!4807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159225 () Bool)

(declare-fun res!769516 () Bool)

(assert (=> b!1159225 (=> (not res!769516) (not e!659196))))

(assert (=> b!1159225 (= res!769516 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36629 _keys!1208))))))

(declare-fun b!1159226 () Bool)

(declare-fun e!659198 () Bool)

(declare-fun e!659206 () Bool)

(assert (=> b!1159226 (= e!659198 (not e!659206))))

(declare-fun res!769514 () Bool)

(assert (=> b!1159226 (=> res!769514 e!659206)))

(assert (=> b!1159226 (= res!769514 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159226 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521017 () Unit!38051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74880 (_ BitVec 64) (_ BitVec 32)) Unit!38051)

(assert (=> b!1159226 (= lt!521017 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!55871 () ListLongMap!16625)

(declare-fun bm!55865 () Bool)

(declare-fun lt!521011 () array!74880)

(declare-fun lt!521004 () array!74882)

(assert (=> bm!55865 (= call!55871 (getCurrentListMapNoExtraKeys!4807 lt!521011 lt!521004 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!55868 () ListLongMap!16625)

(declare-fun c!115594 () Bool)

(declare-fun lt!521013 () ListLongMap!16625)

(declare-fun call!55870 () Bool)

(declare-fun bm!55866 () Bool)

(assert (=> bm!55866 (= call!55870 (contains!6778 (ite c!115594 lt!521013 call!55868) k0!934))))

(declare-fun b!1159227 () Bool)

(declare-fun c!115593 () Bool)

(declare-fun lt!521000 () Bool)

(assert (=> b!1159227 (= c!115593 (and (not lt!521000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659204 () Unit!38051)

(declare-fun e!659209 () Unit!38051)

(assert (=> b!1159227 (= e!659204 e!659209)))

(declare-fun b!1159228 () Bool)

(assert (=> b!1159228 (= e!659196 e!659198)))

(declare-fun res!769506 () Bool)

(assert (=> b!1159228 (=> (not res!769506) (not e!659198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74880 (_ BitVec 32)) Bool)

(assert (=> b!1159228 (= res!769506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521011 mask!1564))))

(assert (=> b!1159228 (= lt!521011 (array!74881 (store (arr!36091 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36629 _keys!1208)))))

(declare-fun b!1159229 () Bool)

(declare-fun Unit!38054 () Unit!38051)

(assert (=> b!1159229 (= e!659208 Unit!38054)))

(assert (=> b!1159229 (= lt!521000 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159229 (= c!115594 (and (not lt!521000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521003 () Unit!38051)

(assert (=> b!1159229 (= lt!521003 e!659204)))

(declare-fun lt!520998 () Unit!38051)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!520 (array!74880 array!74882 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 64) (_ BitVec 32) Int) Unit!38051)

(assert (=> b!1159229 (= lt!520998 (lemmaListMapContainsThenArrayContainsFrom!520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115595 () Bool)

(assert (=> b!1159229 (= c!115595 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769503 () Bool)

(declare-fun e!659200 () Bool)

(assert (=> b!1159229 (= res!769503 e!659200)))

(declare-fun e!659207 () Bool)

(assert (=> b!1159229 (=> (not res!769503) (not e!659207))))

(assert (=> b!1159229 e!659207))

(declare-fun lt!520999 () Unit!38051)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74880 (_ BitVec 32) (_ BitVec 32)) Unit!38051)

(assert (=> b!1159229 (= lt!520999 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25378 0))(
  ( (Nil!25375) (Cons!25374 (h!26583 (_ BitVec 64)) (t!36890 List!25378)) )
))
(declare-fun arrayNoDuplicates!0 (array!74880 (_ BitVec 32) List!25378) Bool)

(assert (=> b!1159229 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25375)))

(declare-fun lt!521019 () Unit!38051)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74880 (_ BitVec 64) (_ BitVec 32) List!25378) Unit!38051)

(assert (=> b!1159229 (= lt!521019 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25375))))

(assert (=> b!1159229 false))

(declare-fun res!769510 () Bool)

(assert (=> start!98918 (=> (not res!769510) (not e!659196))))

(assert (=> start!98918 (= res!769510 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36629 _keys!1208))))))

(assert (=> start!98918 e!659196))

(declare-fun tp_is_empty!29059 () Bool)

(assert (=> start!98918 tp_is_empty!29059))

(declare-fun array_inv!27730 (array!74880) Bool)

(assert (=> start!98918 (array_inv!27730 _keys!1208)))

(assert (=> start!98918 true))

(assert (=> start!98918 tp!86297))

(declare-fun e!659202 () Bool)

(declare-fun array_inv!27731 (array!74882) Bool)

(assert (=> start!98918 (and (array_inv!27731 _values!996) e!659202)))

(declare-fun b!1159230 () Bool)

(declare-fun res!769507 () Bool)

(assert (=> b!1159230 (=> (not res!769507) (not e!659196))))

(assert (=> b!1159230 (= res!769507 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25375))))

(declare-fun call!55874 () ListLongMap!16625)

(declare-fun bm!55867 () Bool)

(assert (=> bm!55867 (= call!55874 (+!3735 lt!521007 (ite (or c!115594 c!115593) (tuple2!18657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1159231 () Bool)

(declare-fun e!659203 () Unit!38051)

(assert (=> b!1159231 (= e!659209 e!659203)))

(declare-fun c!115598 () Bool)

(assert (=> b!1159231 (= c!115598 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521000))))

(declare-fun bm!55868 () Bool)

(declare-fun call!55873 () Bool)

(assert (=> bm!55868 (= call!55873 call!55870)))

(declare-fun b!1159232 () Bool)

(assert (=> b!1159232 call!55873))

(declare-fun lt!521018 () Unit!38051)

(assert (=> b!1159232 (= lt!521018 call!55869)))

(assert (=> b!1159232 (= e!659203 lt!521018)))

(declare-fun b!1159233 () Bool)

(declare-fun e!659197 () Bool)

(assert (=> b!1159233 (= e!659197 e!659211)))

(declare-fun res!769513 () Bool)

(assert (=> b!1159233 (=> res!769513 e!659211)))

(assert (=> b!1159233 (= res!769513 (not (= (select (arr!36091 _keys!1208) from!1455) k0!934)))))

(declare-fun e!659199 () Bool)

(assert (=> b!1159233 e!659199))

(declare-fun c!115597 () Bool)

(assert (=> b!1159233 (= c!115597 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521016 () Unit!38051)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!649 (array!74880 array!74882 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38051)

(assert (=> b!1159233 (= lt!521016 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!55872 () ListLongMap!16625)

(declare-fun b!1159234 () Bool)

(assert (=> b!1159234 (= e!659199 (= call!55871 (-!1381 call!55872 k0!934)))))

(declare-fun b!1159235 () Bool)

(assert (=> b!1159235 (= e!659206 e!659197)))

(declare-fun res!769504 () Bool)

(assert (=> b!1159235 (=> res!769504 e!659197)))

(assert (=> b!1159235 (= res!769504 (not (= from!1455 i!673)))))

(declare-fun lt!521005 () ListLongMap!16625)

(assert (=> b!1159235 (= lt!521005 (getCurrentListMapNoExtraKeys!4807 lt!521011 lt!521004 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159235 (= lt!521004 (array!74883 (store (arr!36092 _values!996) i!673 (ValueCellFull!13820 lt!521008)) (size!36630 _values!996)))))

(declare-fun dynLambda!2755 (Int (_ BitVec 64)) V!43873)

(assert (=> b!1159235 (= lt!521008 (dynLambda!2755 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159235 (= lt!521012 (getCurrentListMapNoExtraKeys!4807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55869 () Bool)

(assert (=> bm!55869 (= call!55872 (getCurrentListMapNoExtraKeys!4807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45413 () Bool)

(declare-fun mapRes!45413 () Bool)

(declare-fun tp!86298 () Bool)

(declare-fun e!659201 () Bool)

(assert (=> mapNonEmpty!45413 (= mapRes!45413 (and tp!86298 e!659201))))

(declare-fun mapRest!45413 () (Array (_ BitVec 32) ValueCell!13820))

(declare-fun mapKey!45413 () (_ BitVec 32))

(declare-fun mapValue!45413 () ValueCell!13820)

(assert (=> mapNonEmpty!45413 (= (arr!36092 _values!996) (store mapRest!45413 mapKey!45413 mapValue!45413))))

(declare-fun b!1159236 () Bool)

(declare-fun res!769505 () Bool)

(assert (=> b!1159236 (=> (not res!769505) (not e!659196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159236 (= res!769505 (validMask!0 mask!1564))))

(declare-fun b!1159237 () Bool)

(assert (=> b!1159237 (= e!659200 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159238 () Bool)

(declare-fun res!769511 () Bool)

(assert (=> b!1159238 (=> (not res!769511) (not e!659196))))

(assert (=> b!1159238 (= res!769511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159239 () Bool)

(declare-fun Unit!38055 () Unit!38051)

(assert (=> b!1159239 (= e!659203 Unit!38055)))

(declare-fun b!1159240 () Bool)

(declare-fun res!769509 () Bool)

(assert (=> b!1159240 (=> (not res!769509) (not e!659196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159240 (= res!769509 (validKeyInArray!0 k0!934))))

(declare-fun b!1159241 () Bool)

(declare-fun res!769515 () Bool)

(assert (=> b!1159241 (=> (not res!769515) (not e!659198))))

(assert (=> b!1159241 (= res!769515 (arrayNoDuplicates!0 lt!521011 #b00000000000000000000000000000000 Nil!25375))))

(declare-fun b!1159242 () Bool)

(declare-fun res!769512 () Bool)

(assert (=> b!1159242 (=> (not res!769512) (not e!659196))))

(assert (=> b!1159242 (= res!769512 (and (= (size!36630 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36629 _keys!1208) (size!36630 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159243 () Bool)

(assert (=> b!1159243 (contains!6778 (+!3735 lt!521013 (tuple2!18657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521009 () Unit!38051)

(declare-fun addStillContains!943 (ListLongMap!16625 (_ BitVec 64) V!43873 (_ BitVec 64)) Unit!38051)

(assert (=> b!1159243 (= lt!521009 (addStillContains!943 lt!521013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1159243 call!55870))

(assert (=> b!1159243 (= lt!521013 call!55874)))

(declare-fun lt!521010 () Unit!38051)

(assert (=> b!1159243 (= lt!521010 call!55867)))

(assert (=> b!1159243 (= e!659204 lt!521009)))

(declare-fun b!1159244 () Bool)

(declare-fun lt!521014 () Unit!38051)

(assert (=> b!1159244 (= e!659209 lt!521014)))

(assert (=> b!1159244 (= lt!521014 call!55869)))

(assert (=> b!1159244 call!55873))

(declare-fun mapIsEmpty!45413 () Bool)

(assert (=> mapIsEmpty!45413 mapRes!45413))

(declare-fun b!1159245 () Bool)

(assert (=> b!1159245 (= e!659210 (= lt!521015 (getCurrentListMapNoExtraKeys!4807 lt!521011 lt!521004 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159246 () Bool)

(assert (=> b!1159246 (= e!659199 (= call!55871 call!55872))))

(declare-fun b!1159247 () Bool)

(assert (=> b!1159247 (= e!659207 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159248 () Bool)

(assert (=> b!1159248 (= e!659201 tp_is_empty!29059)))

(declare-fun b!1159249 () Bool)

(assert (=> b!1159249 (= e!659200 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159250 () Bool)

(declare-fun e!659195 () Bool)

(assert (=> b!1159250 (= e!659195 tp_is_empty!29059)))

(declare-fun bm!55870 () Bool)

(assert (=> bm!55870 (= call!55867 (addStillContains!943 lt!521007 (ite (or c!115594 c!115593) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115594 c!115593) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1159251 () Bool)

(assert (=> b!1159251 (= e!659202 (and e!659195 mapRes!45413))))

(declare-fun condMapEmpty!45413 () Bool)

(declare-fun mapDefault!45413 () ValueCell!13820)

(assert (=> b!1159251 (= condMapEmpty!45413 (= (arr!36092 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13820)) mapDefault!45413)))))

(declare-fun bm!55871 () Bool)

(assert (=> bm!55871 (= call!55868 call!55874)))

(assert (= (and start!98918 res!769510) b!1159236))

(assert (= (and b!1159236 res!769505) b!1159242))

(assert (= (and b!1159242 res!769512) b!1159238))

(assert (= (and b!1159238 res!769511) b!1159230))

(assert (= (and b!1159230 res!769507) b!1159225))

(assert (= (and b!1159225 res!769516) b!1159240))

(assert (= (and b!1159240 res!769509) b!1159223))

(assert (= (and b!1159223 res!769517) b!1159228))

(assert (= (and b!1159228 res!769506) b!1159241))

(assert (= (and b!1159241 res!769515) b!1159226))

(assert (= (and b!1159226 (not res!769514)) b!1159235))

(assert (= (and b!1159235 (not res!769504)) b!1159233))

(assert (= (and b!1159233 c!115597) b!1159234))

(assert (= (and b!1159233 (not c!115597)) b!1159246))

(assert (= (or b!1159234 b!1159246) bm!55865))

(assert (= (or b!1159234 b!1159246) bm!55869))

(assert (= (and b!1159233 (not res!769513)) b!1159224))

(assert (= (and b!1159224 c!115596) b!1159229))

(assert (= (and b!1159224 (not c!115596)) b!1159222))

(assert (= (and b!1159229 c!115594) b!1159243))

(assert (= (and b!1159229 (not c!115594)) b!1159227))

(assert (= (and b!1159227 c!115593) b!1159244))

(assert (= (and b!1159227 (not c!115593)) b!1159231))

(assert (= (and b!1159231 c!115598) b!1159232))

(assert (= (and b!1159231 (not c!115598)) b!1159239))

(assert (= (or b!1159244 b!1159232) bm!55864))

(assert (= (or b!1159244 b!1159232) bm!55871))

(assert (= (or b!1159244 b!1159232) bm!55868))

(assert (= (or b!1159243 bm!55868) bm!55866))

(assert (= (or b!1159243 bm!55864) bm!55870))

(assert (= (or b!1159243 bm!55871) bm!55867))

(assert (= (and b!1159229 c!115595) b!1159237))

(assert (= (and b!1159229 (not c!115595)) b!1159249))

(assert (= (and b!1159229 res!769503) b!1159247))

(assert (= (and b!1159224 res!769508) b!1159245))

(assert (= (and b!1159251 condMapEmpty!45413) mapIsEmpty!45413))

(assert (= (and b!1159251 (not condMapEmpty!45413)) mapNonEmpty!45413))

(get-info :version)

(assert (= (and mapNonEmpty!45413 ((_ is ValueCellFull!13820) mapValue!45413)) b!1159248))

(assert (= (and b!1159251 ((_ is ValueCellFull!13820) mapDefault!45413)) b!1159250))

(assert (= start!98918 b!1159251))

(declare-fun b_lambda!19617 () Bool)

(assert (=> (not b_lambda!19617) (not b!1159235)))

(declare-fun t!36888 () Bool)

(declare-fun tb!9333 () Bool)

(assert (=> (and start!98918 (= defaultEntry!1004 defaultEntry!1004) t!36888) tb!9333))

(declare-fun result!19239 () Bool)

(assert (=> tb!9333 (= result!19239 tp_is_empty!29059)))

(assert (=> b!1159235 t!36888))

(declare-fun b_and!39887 () Bool)

(assert (= b_and!39885 (and (=> t!36888 result!19239) b_and!39887)))

(declare-fun m!1067835 () Bool)

(assert (=> b!1159237 m!1067835))

(declare-fun m!1067837 () Bool)

(assert (=> mapNonEmpty!45413 m!1067837))

(declare-fun m!1067839 () Bool)

(assert (=> b!1159233 m!1067839))

(declare-fun m!1067841 () Bool)

(assert (=> b!1159233 m!1067841))

(declare-fun m!1067843 () Bool)

(assert (=> b!1159245 m!1067843))

(declare-fun m!1067845 () Bool)

(assert (=> b!1159234 m!1067845))

(declare-fun m!1067847 () Bool)

(assert (=> b!1159236 m!1067847))

(assert (=> bm!55865 m!1067843))

(declare-fun m!1067849 () Bool)

(assert (=> bm!55867 m!1067849))

(declare-fun m!1067851 () Bool)

(assert (=> b!1159240 m!1067851))

(declare-fun m!1067853 () Bool)

(assert (=> b!1159228 m!1067853))

(declare-fun m!1067855 () Bool)

(assert (=> b!1159228 m!1067855))

(declare-fun m!1067857 () Bool)

(assert (=> b!1159223 m!1067857))

(declare-fun m!1067859 () Bool)

(assert (=> b!1159226 m!1067859))

(declare-fun m!1067861 () Bool)

(assert (=> b!1159226 m!1067861))

(declare-fun m!1067863 () Bool)

(assert (=> b!1159230 m!1067863))

(declare-fun m!1067865 () Bool)

(assert (=> b!1159235 m!1067865))

(declare-fun m!1067867 () Bool)

(assert (=> b!1159235 m!1067867))

(declare-fun m!1067869 () Bool)

(assert (=> b!1159235 m!1067869))

(declare-fun m!1067871 () Bool)

(assert (=> b!1159235 m!1067871))

(declare-fun m!1067873 () Bool)

(assert (=> b!1159229 m!1067873))

(declare-fun m!1067875 () Bool)

(assert (=> b!1159229 m!1067875))

(declare-fun m!1067877 () Bool)

(assert (=> b!1159229 m!1067877))

(declare-fun m!1067879 () Bool)

(assert (=> b!1159229 m!1067879))

(assert (=> b!1159224 m!1067839))

(declare-fun m!1067881 () Bool)

(assert (=> b!1159224 m!1067881))

(declare-fun m!1067883 () Bool)

(assert (=> b!1159224 m!1067883))

(assert (=> b!1159224 m!1067883))

(declare-fun m!1067885 () Bool)

(assert (=> b!1159224 m!1067885))

(assert (=> b!1159224 m!1067839))

(declare-fun m!1067887 () Bool)

(assert (=> b!1159224 m!1067887))

(assert (=> b!1159224 m!1067839))

(declare-fun m!1067889 () Bool)

(assert (=> b!1159224 m!1067889))

(assert (=> b!1159224 m!1067887))

(declare-fun m!1067891 () Bool)

(assert (=> b!1159224 m!1067891))

(declare-fun m!1067893 () Bool)

(assert (=> b!1159224 m!1067893))

(declare-fun m!1067895 () Bool)

(assert (=> b!1159224 m!1067895))

(declare-fun m!1067897 () Bool)

(assert (=> start!98918 m!1067897))

(declare-fun m!1067899 () Bool)

(assert (=> start!98918 m!1067899))

(assert (=> b!1159247 m!1067835))

(declare-fun m!1067901 () Bool)

(assert (=> bm!55866 m!1067901))

(declare-fun m!1067903 () Bool)

(assert (=> b!1159238 m!1067903))

(declare-fun m!1067905 () Bool)

(assert (=> bm!55870 m!1067905))

(assert (=> bm!55869 m!1067891))

(declare-fun m!1067907 () Bool)

(assert (=> b!1159241 m!1067907))

(declare-fun m!1067909 () Bool)

(assert (=> b!1159243 m!1067909))

(assert (=> b!1159243 m!1067909))

(declare-fun m!1067911 () Bool)

(assert (=> b!1159243 m!1067911))

(declare-fun m!1067913 () Bool)

(assert (=> b!1159243 m!1067913))

(check-sat (not b!1159226) (not b!1159230) b_and!39887 (not b!1159238) (not mapNonEmpty!45413) (not bm!55869) (not b_lambda!19617) (not b!1159237) (not b!1159240) (not bm!55866) (not bm!55865) (not b!1159233) (not b!1159247) (not b!1159245) (not b!1159236) (not b!1159234) (not b!1159228) (not b!1159224) (not bm!55870) (not bm!55867) (not b_next!24529) (not b!1159229) (not b!1159241) tp_is_empty!29059 (not b!1159235) (not start!98918) (not b!1159243))
(check-sat b_and!39887 (not b_next!24529))
