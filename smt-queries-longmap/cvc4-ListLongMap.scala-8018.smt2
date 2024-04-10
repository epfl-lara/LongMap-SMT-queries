; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98952 () Bool)

(assert start!98952)

(declare-fun b_free!24557 () Bool)

(declare-fun b_next!24557 () Bool)

(assert (=> start!98952 (= b_free!24557 (not b_next!24557))))

(declare-fun tp!86381 () Bool)

(declare-fun b_and!39963 () Bool)

(assert (=> start!98952 (= tp!86381 b_and!39963)))

(declare-fun b!1160634 () Bool)

(declare-fun e!659987 () Bool)

(declare-fun e!659992 () Bool)

(assert (=> b!1160634 (= e!659987 (not e!659992))))

(declare-fun res!770199 () Bool)

(assert (=> b!1160634 (=> res!770199 e!659992)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160634 (= res!770199 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75015 0))(
  ( (array!75016 (arr!36158 (Array (_ BitVec 32) (_ BitVec 64))) (size!36694 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75015)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160634 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38267 0))(
  ( (Unit!38268) )
))
(declare-fun lt!522123 () Unit!38267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75015 (_ BitVec 64) (_ BitVec 32)) Unit!38267)

(assert (=> b!1160634 (= lt!522123 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1160635 () Bool)

(declare-fun res!770207 () Bool)

(declare-fun e!659997 () Bool)

(assert (=> b!1160635 (=> (not res!770207) (not e!659997))))

(assert (=> b!1160635 (= res!770207 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36694 _keys!1208))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!56223 () Bool)

(declare-datatypes ((V!43909 0))(
  ( (V!43910 (val!14600 Int)) )
))
(declare-datatypes ((ValueCell!13834 0))(
  ( (ValueCellFull!13834 (v!17237 V!43909)) (EmptyCell!13834) )
))
(declare-datatypes ((array!75017 0))(
  ( (array!75018 (arr!36159 (Array (_ BitVec 32) ValueCell!13834)) (size!36695 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75017)

(declare-fun minValue!944 () V!43909)

(declare-datatypes ((tuple2!18598 0))(
  ( (tuple2!18599 (_1!9310 (_ BitVec 64)) (_2!9310 V!43909)) )
))
(declare-datatypes ((List!25335 0))(
  ( (Nil!25332) (Cons!25331 (h!26540 tuple2!18598) (t!36884 List!25335)) )
))
(declare-datatypes ((ListLongMap!16567 0))(
  ( (ListLongMap!16568 (toList!8299 List!25335)) )
))
(declare-fun call!56228 () ListLongMap!16567)

(declare-fun zeroValue!944 () V!43909)

(declare-fun getCurrentListMapNoExtraKeys!4763 (array!75015 array!75017 (_ BitVec 32) (_ BitVec 32) V!43909 V!43909 (_ BitVec 32) Int) ListLongMap!16567)

(assert (=> bm!56223 (= call!56228 (getCurrentListMapNoExtraKeys!4763 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160636 () Bool)

(declare-fun e!659989 () Bool)

(assert (=> b!1160636 (= e!659989 true)))

(declare-fun e!660000 () Bool)

(assert (=> b!1160636 e!660000))

(declare-fun res!770205 () Bool)

(assert (=> b!1160636 (=> (not res!770205) (not e!660000))))

(declare-fun lt!522130 () ListLongMap!16567)

(declare-fun lt!522124 () ListLongMap!16567)

(assert (=> b!1160636 (= res!770205 (= lt!522130 lt!522124))))

(declare-fun lt!522120 () ListLongMap!16567)

(declare-fun -!1408 (ListLongMap!16567 (_ BitVec 64)) ListLongMap!16567)

(assert (=> b!1160636 (= lt!522130 (-!1408 lt!522120 k!934))))

(declare-fun lt!522132 () V!43909)

(declare-fun +!3704 (ListLongMap!16567 tuple2!18598) ListLongMap!16567)

(assert (=> b!1160636 (= (-!1408 (+!3704 lt!522124 (tuple2!18599 (select (arr!36158 _keys!1208) from!1455) lt!522132)) (select (arr!36158 _keys!1208) from!1455)) lt!522124)))

(declare-fun lt!522117 () Unit!38267)

(declare-fun addThenRemoveForNewKeyIsSame!242 (ListLongMap!16567 (_ BitVec 64) V!43909) Unit!38267)

(assert (=> b!1160636 (= lt!522117 (addThenRemoveForNewKeyIsSame!242 lt!522124 (select (arr!36158 _keys!1208) from!1455) lt!522132))))

(declare-fun lt!522134 () V!43909)

(declare-fun get!18440 (ValueCell!13834 V!43909) V!43909)

(assert (=> b!1160636 (= lt!522132 (get!18440 (select (arr!36159 _values!996) from!1455) lt!522134))))

(declare-fun lt!522125 () Unit!38267)

(declare-fun e!659991 () Unit!38267)

(assert (=> b!1160636 (= lt!522125 e!659991)))

(declare-fun c!115875 () Bool)

(declare-fun contains!6805 (ListLongMap!16567 (_ BitVec 64)) Bool)

(assert (=> b!1160636 (= c!115875 (contains!6805 lt!522124 k!934))))

(assert (=> b!1160636 (= lt!522124 (getCurrentListMapNoExtraKeys!4763 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160637 () Bool)

(declare-fun e!659988 () Bool)

(assert (=> b!1160637 (= e!659992 e!659988)))

(declare-fun res!770206 () Bool)

(assert (=> b!1160637 (=> res!770206 e!659988)))

(assert (=> b!1160637 (= res!770206 (not (= from!1455 i!673)))))

(declare-fun lt!522122 () array!75017)

(declare-fun lt!522116 () ListLongMap!16567)

(declare-fun lt!522129 () array!75015)

(assert (=> b!1160637 (= lt!522116 (getCurrentListMapNoExtraKeys!4763 lt!522129 lt!522122 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160637 (= lt!522122 (array!75018 (store (arr!36159 _values!996) i!673 (ValueCellFull!13834 lt!522134)) (size!36695 _values!996)))))

(declare-fun dynLambda!2763 (Int (_ BitVec 64)) V!43909)

(assert (=> b!1160637 (= lt!522134 (dynLambda!2763 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160637 (= lt!522120 (getCurrentListMapNoExtraKeys!4763 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160638 () Bool)

(declare-fun res!770201 () Bool)

(assert (=> b!1160638 (=> (not res!770201) (not e!659987))))

(declare-datatypes ((List!25336 0))(
  ( (Nil!25333) (Cons!25332 (h!26541 (_ BitVec 64)) (t!36885 List!25336)) )
))
(declare-fun arrayNoDuplicates!0 (array!75015 (_ BitVec 32) List!25336) Bool)

(assert (=> b!1160638 (= res!770201 (arrayNoDuplicates!0 lt!522129 #b00000000000000000000000000000000 Nil!25333))))

(declare-fun mapIsEmpty!45455 () Bool)

(declare-fun mapRes!45455 () Bool)

(assert (=> mapIsEmpty!45455 mapRes!45455))

(declare-fun lt!522131 () ListLongMap!16567)

(declare-fun call!56233 () Unit!38267)

(declare-fun c!115871 () Bool)

(declare-fun bm!56224 () Bool)

(declare-fun c!115873 () Bool)

(declare-fun addStillContains!946 (ListLongMap!16567 (_ BitVec 64) V!43909 (_ BitVec 64)) Unit!38267)

(assert (=> bm!56224 (= call!56233 (addStillContains!946 (ite c!115873 lt!522131 lt!522124) (ite c!115873 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115871 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115873 minValue!944 (ite c!115871 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1160640 () Bool)

(declare-fun call!56227 () ListLongMap!16567)

(assert (=> b!1160640 (contains!6805 call!56227 k!934)))

(declare-fun lt!522135 () Unit!38267)

(assert (=> b!1160640 (= lt!522135 call!56233)))

(declare-fun call!56230 () Bool)

(assert (=> b!1160640 call!56230))

(assert (=> b!1160640 (= lt!522131 (+!3704 lt!522124 (tuple2!18599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522126 () Unit!38267)

(assert (=> b!1160640 (= lt!522126 (addStillContains!946 lt!522124 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!660001 () Unit!38267)

(assert (=> b!1160640 (= e!660001 lt!522135)))

(declare-fun b!1160641 () Bool)

(declare-fun res!770209 () Bool)

(assert (=> b!1160641 (=> (not res!770209) (not e!659997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75015 (_ BitVec 32)) Bool)

(assert (=> b!1160641 (= res!770209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56225 () Bool)

(declare-fun call!56226 () Bool)

(assert (=> bm!56225 (= call!56226 call!56230)))

(declare-fun b!1160642 () Bool)

(declare-fun e!659999 () Unit!38267)

(declare-fun Unit!38269 () Unit!38267)

(assert (=> b!1160642 (= e!659999 Unit!38269)))

(declare-fun b!1160643 () Bool)

(declare-fun e!659998 () Bool)

(declare-fun call!56229 () ListLongMap!16567)

(assert (=> b!1160643 (= e!659998 (= call!56229 call!56228))))

(declare-fun b!1160644 () Bool)

(declare-fun e!659994 () Bool)

(assert (=> b!1160644 (= e!659994 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160645 () Bool)

(declare-fun res!770212 () Bool)

(assert (=> b!1160645 (=> (not res!770212) (not e!659997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160645 (= res!770212 (validKeyInArray!0 k!934))))

(declare-fun b!1160646 () Bool)

(assert (=> b!1160646 (= e!659998 (= call!56229 (-!1408 call!56228 k!934)))))

(declare-fun b!1160647 () Bool)

(declare-fun res!770208 () Bool)

(assert (=> b!1160647 (=> (not res!770208) (not e!659997))))

(assert (=> b!1160647 (= res!770208 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25333))))

(declare-fun b!1160648 () Bool)

(declare-fun e!659995 () Bool)

(declare-fun tp_is_empty!29087 () Bool)

(assert (=> b!1160648 (= e!659995 tp_is_empty!29087)))

(declare-fun bm!56226 () Bool)

(declare-fun call!56231 () Unit!38267)

(assert (=> bm!56226 (= call!56231 call!56233)))

(declare-fun b!1160649 () Bool)

(declare-fun e!660002 () Unit!38267)

(declare-fun lt!522119 () Unit!38267)

(assert (=> b!1160649 (= e!660002 lt!522119)))

(assert (=> b!1160649 (= lt!522119 call!56231)))

(assert (=> b!1160649 call!56226))

(declare-fun b!1160650 () Bool)

(declare-fun res!770203 () Bool)

(assert (=> b!1160650 (=> (not res!770203) (not e!659997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160650 (= res!770203 (validMask!0 mask!1564))))

(declare-fun b!1160651 () Bool)

(declare-fun Unit!38270 () Unit!38267)

(assert (=> b!1160651 (= e!659991 Unit!38270)))

(declare-fun lt!522133 () Bool)

(assert (=> b!1160651 (= lt!522133 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160651 (= c!115873 (and (not lt!522133) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522114 () Unit!38267)

(assert (=> b!1160651 (= lt!522114 e!660001)))

(declare-fun lt!522127 () Unit!38267)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!532 (array!75015 array!75017 (_ BitVec 32) (_ BitVec 32) V!43909 V!43909 (_ BitVec 64) (_ BitVec 32) Int) Unit!38267)

(assert (=> b!1160651 (= lt!522127 (lemmaListMapContainsThenArrayContainsFrom!532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115872 () Bool)

(assert (=> b!1160651 (= c!115872 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770210 () Bool)

(assert (=> b!1160651 (= res!770210 e!659994)))

(declare-fun e!659996 () Bool)

(assert (=> b!1160651 (=> (not res!770210) (not e!659996))))

(assert (=> b!1160651 e!659996))

(declare-fun lt!522115 () Unit!38267)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75015 (_ BitVec 32) (_ BitVec 32)) Unit!38267)

(assert (=> b!1160651 (= lt!522115 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160651 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25333)))

(declare-fun lt!522121 () Unit!38267)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75015 (_ BitVec 64) (_ BitVec 32) List!25336) Unit!38267)

(assert (=> b!1160651 (= lt!522121 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25333))))

(assert (=> b!1160651 false))

(declare-fun bm!56227 () Bool)

(declare-fun call!56232 () ListLongMap!16567)

(assert (=> bm!56227 (= call!56232 call!56227)))

(declare-fun b!1160652 () Bool)

(declare-fun res!770213 () Bool)

(assert (=> b!1160652 (=> (not res!770213) (not e!659997))))

(assert (=> b!1160652 (= res!770213 (= (select (arr!36158 _keys!1208) i!673) k!934))))

(declare-fun b!1160653 () Bool)

(declare-fun e!659993 () Bool)

(assert (=> b!1160653 (= e!659993 tp_is_empty!29087)))

(declare-fun bm!56228 () Bool)

(assert (=> bm!56228 (= call!56230 (contains!6805 (ite c!115873 lt!522131 call!56232) k!934))))

(declare-fun bm!56229 () Bool)

(assert (=> bm!56229 (= call!56229 (getCurrentListMapNoExtraKeys!4763 lt!522129 lt!522122 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160654 () Bool)

(declare-fun res!770211 () Bool)

(assert (=> b!1160654 (=> (not res!770211) (not e!659997))))

(assert (=> b!1160654 (= res!770211 (and (= (size!36695 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36694 _keys!1208) (size!36695 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160655 () Bool)

(assert (=> b!1160655 (= e!659997 e!659987)))

(declare-fun res!770200 () Bool)

(assert (=> b!1160655 (=> (not res!770200) (not e!659987))))

(assert (=> b!1160655 (= res!770200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522129 mask!1564))))

(assert (=> b!1160655 (= lt!522129 (array!75016 (store (arr!36158 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36694 _keys!1208)))))

(declare-fun b!1160656 () Bool)

(assert (=> b!1160656 (= e!660002 e!659999)))

(declare-fun c!115874 () Bool)

(assert (=> b!1160656 (= c!115874 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522133))))

(declare-fun b!1160657 () Bool)

(assert (=> b!1160657 (= e!660000 (= lt!522130 (getCurrentListMapNoExtraKeys!4763 lt!522129 lt!522122 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160658 () Bool)

(assert (=> b!1160658 (= e!659996 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160659 () Bool)

(declare-fun Unit!38271 () Unit!38267)

(assert (=> b!1160659 (= e!659991 Unit!38271)))

(declare-fun b!1160660 () Bool)

(assert (=> b!1160660 (= e!659994 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522133) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160661 () Bool)

(declare-fun e!660003 () Bool)

(assert (=> b!1160661 (= e!660003 (and e!659995 mapRes!45455))))

(declare-fun condMapEmpty!45455 () Bool)

(declare-fun mapDefault!45455 () ValueCell!13834)

