; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98410 () Bool)

(assert start!98410)

(declare-fun b_free!24015 () Bool)

(declare-fun b_next!24015 () Bool)

(assert (=> start!98410 (= b_free!24015 (not b_next!24015))))

(declare-fun tp!84756 () Bool)

(declare-fun b_and!38879 () Bool)

(assert (=> start!98410 (= tp!84756 b_and!38879)))

(declare-fun b!1135932 () Bool)

(declare-fun e!646421 () Bool)

(declare-fun e!646431 () Bool)

(declare-fun mapRes!44642 () Bool)

(assert (=> b!1135932 (= e!646421 (and e!646431 mapRes!44642))))

(declare-fun condMapEmpty!44642 () Bool)

(declare-datatypes ((V!43187 0))(
  ( (V!43188 (val!14329 Int)) )
))
(declare-datatypes ((ValueCell!13563 0))(
  ( (ValueCellFull!13563 (v!16966 V!43187)) (EmptyCell!13563) )
))
(declare-datatypes ((array!73951 0))(
  ( (array!73952 (arr!35626 (Array (_ BitVec 32) ValueCell!13563)) (size!36162 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73951)

(declare-fun mapDefault!44642 () ValueCell!13563)

(assert (=> b!1135932 (= condMapEmpty!44642 (= (arr!35626 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13563)) mapDefault!44642)))))

(declare-fun b!1135933 () Bool)

(declare-fun e!646433 () Bool)

(declare-datatypes ((tuple2!18086 0))(
  ( (tuple2!18087 (_1!9054 (_ BitVec 64)) (_2!9054 V!43187)) )
))
(declare-datatypes ((List!24845 0))(
  ( (Nil!24842) (Cons!24841 (h!26050 tuple2!18086) (t!35852 List!24845)) )
))
(declare-datatypes ((ListLongMap!16055 0))(
  ( (ListLongMap!16056 (toList!8043 List!24845)) )
))
(declare-fun call!49726 () ListLongMap!16055)

(declare-fun call!49724 () ListLongMap!16055)

(assert (=> b!1135933 (= e!646433 (= call!49726 call!49724))))

(declare-fun b!1135934 () Bool)

(declare-fun tp_is_empty!28545 () Bool)

(assert (=> b!1135934 (= e!646431 tp_is_empty!28545)))

(declare-fun b!1135935 () Bool)

(declare-fun res!758205 () Bool)

(declare-fun e!646422 () Bool)

(assert (=> b!1135935 (=> (not res!758205) (not e!646422))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73953 0))(
  ( (array!73954 (arr!35627 (Array (_ BitVec 32) (_ BitVec 64))) (size!36163 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73953)

(assert (=> b!1135935 (= res!758205 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36163 _keys!1208))))))

(declare-fun zeroValue!944 () V!43187)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!49719 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43187)

(declare-fun getCurrentListMapNoExtraKeys!4528 (array!73953 array!73951 (_ BitVec 32) (_ BitVec 32) V!43187 V!43187 (_ BitVec 32) Int) ListLongMap!16055)

(assert (=> bm!49719 (= call!49724 (getCurrentListMapNoExtraKeys!4528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135936 () Bool)

(declare-fun res!758203 () Bool)

(assert (=> b!1135936 (=> (not res!758203) (not e!646422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135936 (= res!758203 (validMask!0 mask!1564))))

(declare-fun lt!505017 () ListLongMap!16055)

(declare-fun c!111019 () Bool)

(declare-datatypes ((Unit!37204 0))(
  ( (Unit!37205) )
))
(declare-fun call!49723 () Unit!37204)

(declare-fun c!111018 () Bool)

(declare-fun lt!505013 () ListLongMap!16055)

(declare-fun bm!49720 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!741 (ListLongMap!16055 (_ BitVec 64) V!43187 (_ BitVec 64)) Unit!37204)

(assert (=> bm!49720 (= call!49723 (addStillContains!741 (ite c!111019 lt!505017 lt!505013) (ite c!111019 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111018 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111019 minValue!944 (ite c!111018 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1135937 () Bool)

(declare-fun e!646429 () Bool)

(declare-fun arrayContainsKey!0 (array!73953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135937 (= e!646429 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135938 () Bool)

(declare-fun e!646418 () Bool)

(assert (=> b!1135938 (= e!646418 true)))

(declare-fun lt!505021 () Bool)

(declare-datatypes ((List!24846 0))(
  ( (Nil!24843) (Cons!24842 (h!26051 (_ BitVec 64)) (t!35853 List!24846)) )
))
(declare-fun contains!6577 (List!24846 (_ BitVec 64)) Bool)

(assert (=> b!1135938 (= lt!505021 (contains!6577 Nil!24843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49721 () Bool)

(declare-fun call!49729 () ListLongMap!16055)

(declare-fun call!49722 () ListLongMap!16055)

(assert (=> bm!49721 (= call!49729 call!49722)))

(declare-fun e!646424 () Bool)

(declare-fun b!1135939 () Bool)

(assert (=> b!1135939 (= e!646424 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135940 () Bool)

(declare-fun -!1204 (ListLongMap!16055 (_ BitVec 64)) ListLongMap!16055)

(assert (=> b!1135940 (= e!646433 (= call!49726 (-!1204 call!49724 k0!934)))))

(declare-fun b!1135941 () Bool)

(declare-fun e!646428 () Bool)

(declare-fun e!646426 () Bool)

(assert (=> b!1135941 (= e!646428 e!646426)))

(declare-fun res!758194 () Bool)

(assert (=> b!1135941 (=> res!758194 e!646426)))

(declare-fun contains!6578 (ListLongMap!16055 (_ BitVec 64)) Bool)

(assert (=> b!1135941 (= res!758194 (not (contains!6578 lt!505013 k0!934)))))

(assert (=> b!1135941 (= lt!505013 (getCurrentListMapNoExtraKeys!4528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135942 () Bool)

(declare-fun res!758206 () Bool)

(declare-fun e!646420 () Bool)

(assert (=> b!1135942 (=> (not res!758206) (not e!646420))))

(declare-fun lt!505022 () array!73953)

(declare-fun arrayNoDuplicates!0 (array!73953 (_ BitVec 32) List!24846) Bool)

(assert (=> b!1135942 (= res!758206 (arrayNoDuplicates!0 lt!505022 #b00000000000000000000000000000000 Nil!24843))))

(declare-fun b!1135943 () Bool)

(declare-fun e!646430 () Bool)

(assert (=> b!1135943 (= e!646430 tp_is_empty!28545)))

(declare-fun b!1135944 () Bool)

(declare-fun e!646434 () Bool)

(assert (=> b!1135944 (= e!646420 (not e!646434))))

(declare-fun res!758201 () Bool)

(assert (=> b!1135944 (=> res!758201 e!646434)))

(assert (=> b!1135944 (= res!758201 (bvsgt from!1455 i!673))))

(assert (=> b!1135944 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505029 () Unit!37204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73953 (_ BitVec 64) (_ BitVec 32)) Unit!37204)

(assert (=> b!1135944 (= lt!505029 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1135945 () Bool)

(declare-fun res!758202 () Bool)

(assert (=> b!1135945 (=> (not res!758202) (not e!646422))))

(assert (=> b!1135945 (= res!758202 (and (= (size!36162 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36163 _keys!1208) (size!36162 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1135946 () Bool)

(declare-fun e!646423 () Bool)

(assert (=> b!1135946 (= e!646434 e!646423)))

(declare-fun res!758196 () Bool)

(assert (=> b!1135946 (=> res!758196 e!646423)))

(assert (=> b!1135946 (= res!758196 (not (= from!1455 i!673)))))

(declare-fun lt!505025 () array!73951)

(declare-fun lt!505024 () ListLongMap!16055)

(assert (=> b!1135946 (= lt!505024 (getCurrentListMapNoExtraKeys!4528 lt!505022 lt!505025 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2588 (Int (_ BitVec 64)) V!43187)

(assert (=> b!1135946 (= lt!505025 (array!73952 (store (arr!35626 _values!996) i!673 (ValueCellFull!13563 (dynLambda!2588 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36162 _values!996)))))

(declare-fun lt!505018 () ListLongMap!16055)

(assert (=> b!1135946 (= lt!505018 (getCurrentListMapNoExtraKeys!4528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!758198 () Bool)

(assert (=> start!98410 (=> (not res!758198) (not e!646422))))

(assert (=> start!98410 (= res!758198 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36163 _keys!1208))))))

(assert (=> start!98410 e!646422))

(assert (=> start!98410 tp_is_empty!28545))

(declare-fun array_inv!27318 (array!73953) Bool)

(assert (=> start!98410 (array_inv!27318 _keys!1208)))

(assert (=> start!98410 true))

(assert (=> start!98410 tp!84756))

(declare-fun array_inv!27319 (array!73951) Bool)

(assert (=> start!98410 (and (array_inv!27319 _values!996) e!646421)))

(declare-fun b!1135947 () Bool)

(declare-fun e!646427 () Unit!37204)

(declare-fun Unit!37206 () Unit!37204)

(assert (=> b!1135947 (= e!646427 Unit!37206)))

(declare-fun b!1135948 () Bool)

(declare-fun res!758193 () Bool)

(assert (=> b!1135948 (=> (not res!758193) (not e!646422))))

(assert (=> b!1135948 (= res!758193 (= (select (arr!35627 _keys!1208) i!673) k0!934))))

(declare-fun b!1135949 () Bool)

(declare-fun res!758204 () Bool)

(assert (=> b!1135949 (=> (not res!758204) (not e!646422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73953 (_ BitVec 32)) Bool)

(assert (=> b!1135949 (= res!758204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135950 () Bool)

(declare-fun res!758191 () Bool)

(assert (=> b!1135950 (=> res!758191 e!646418)))

(assert (=> b!1135950 (= res!758191 (contains!6577 Nil!24843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135951 () Bool)

(declare-fun call!49728 () Bool)

(assert (=> b!1135951 call!49728))

(declare-fun lt!505015 () Unit!37204)

(declare-fun call!49727 () Unit!37204)

(assert (=> b!1135951 (= lt!505015 call!49727)))

(declare-fun e!646432 () Unit!37204)

(assert (=> b!1135951 (= e!646432 lt!505015)))

(declare-fun bm!49722 () Bool)

(assert (=> bm!49722 (= call!49726 (getCurrentListMapNoExtraKeys!4528 lt!505022 lt!505025 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135952 () Bool)

(declare-fun lt!505023 () Unit!37204)

(assert (=> b!1135952 (= e!646427 lt!505023)))

(assert (=> b!1135952 (= lt!505023 call!49727)))

(assert (=> b!1135952 call!49728))

(declare-fun call!49725 () Bool)

(declare-fun bm!49723 () Bool)

(assert (=> bm!49723 (= call!49725 (contains!6578 (ite c!111019 lt!505017 call!49729) k0!934))))

(declare-fun b!1135953 () Bool)

(declare-fun res!758207 () Bool)

(assert (=> b!1135953 (=> res!758207 e!646418)))

(declare-fun noDuplicate!1600 (List!24846) Bool)

(assert (=> b!1135953 (= res!758207 (not (noDuplicate!1600 Nil!24843)))))

(declare-fun b!1135954 () Bool)

(assert (=> b!1135954 (= e!646422 e!646420)))

(declare-fun res!758197 () Bool)

(assert (=> b!1135954 (=> (not res!758197) (not e!646420))))

(assert (=> b!1135954 (= res!758197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505022 mask!1564))))

(assert (=> b!1135954 (= lt!505022 (array!73954 (store (arr!35627 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36163 _keys!1208)))))

(declare-fun bm!49724 () Bool)

(declare-fun +!3479 (ListLongMap!16055 tuple2!18086) ListLongMap!16055)

(assert (=> bm!49724 (= call!49722 (+!3479 lt!505013 (ite (or c!111019 c!111018) (tuple2!18087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!49725 () Bool)

(assert (=> bm!49725 (= call!49728 call!49725)))

(declare-fun lt!505028 () Bool)

(declare-fun b!1135955 () Bool)

(assert (=> b!1135955 (= e!646429 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505028) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1135956 () Bool)

(declare-fun res!758200 () Bool)

(assert (=> b!1135956 (=> (not res!758200) (not e!646422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135956 (= res!758200 (validKeyInArray!0 k0!934))))

(declare-fun b!1135957 () Bool)

(declare-fun res!758192 () Bool)

(assert (=> b!1135957 (=> (not res!758192) (not e!646422))))

(assert (=> b!1135957 (= res!758192 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24843))))

(declare-fun b!1135958 () Bool)

(declare-fun e!646419 () Unit!37204)

(assert (=> b!1135958 (= e!646419 e!646432)))

(assert (=> b!1135958 (= c!111018 (and (not lt!505028) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1135959 () Bool)

(assert (=> b!1135959 (= e!646423 e!646428)))

(declare-fun res!758195 () Bool)

(assert (=> b!1135959 (=> res!758195 e!646428)))

(assert (=> b!1135959 (= res!758195 (not (= (select (arr!35627 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1135959 e!646433))

(declare-fun c!111017 () Bool)

(assert (=> b!1135959 (= c!111017 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505016 () Unit!37204)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!454 (array!73953 array!73951 (_ BitVec 32) (_ BitVec 32) V!43187 V!43187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37204)

(assert (=> b!1135959 (= lt!505016 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135960 () Bool)

(assert (=> b!1135960 (= e!646426 e!646418)))

(declare-fun res!758190 () Bool)

(assert (=> b!1135960 (=> res!758190 e!646418)))

(assert (=> b!1135960 (= res!758190 (or (bvsge (size!36163 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36163 _keys!1208)) (bvsge from!1455 (size!36163 _keys!1208))))))

(assert (=> b!1135960 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24843)))

(declare-fun lt!505026 () Unit!37204)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73953 (_ BitVec 32) (_ BitVec 32)) Unit!37204)

(assert (=> b!1135960 (= lt!505026 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135960 e!646424))

(declare-fun res!758199 () Bool)

(assert (=> b!1135960 (=> (not res!758199) (not e!646424))))

(assert (=> b!1135960 (= res!758199 e!646429)))

(declare-fun c!111016 () Bool)

(assert (=> b!1135960 (= c!111016 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505014 () Unit!37204)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!346 (array!73953 array!73951 (_ BitVec 32) (_ BitVec 32) V!43187 V!43187 (_ BitVec 64) (_ BitVec 32) Int) Unit!37204)

(assert (=> b!1135960 (= lt!505014 (lemmaListMapContainsThenArrayContainsFrom!346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505020 () Unit!37204)

(assert (=> b!1135960 (= lt!505020 e!646419)))

(assert (=> b!1135960 (= c!111019 (and (not lt!505028) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135960 (= lt!505028 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!44642 () Bool)

(assert (=> mapIsEmpty!44642 mapRes!44642))

(declare-fun b!1135961 () Bool)

(declare-fun lt!505019 () Unit!37204)

(assert (=> b!1135961 (= e!646419 lt!505019)))

(declare-fun lt!505027 () Unit!37204)

(assert (=> b!1135961 (= lt!505027 (addStillContains!741 lt!505013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1135961 (= lt!505017 call!49722)))

(assert (=> b!1135961 call!49725))

(assert (=> b!1135961 (= lt!505019 call!49723)))

(assert (=> b!1135961 (contains!6578 (+!3479 lt!505017 (tuple2!18087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1135962 () Bool)

(declare-fun c!111015 () Bool)

(assert (=> b!1135962 (= c!111015 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505028))))

(assert (=> b!1135962 (= e!646432 e!646427)))

(declare-fun bm!49726 () Bool)

(assert (=> bm!49726 (= call!49727 call!49723)))

(declare-fun mapNonEmpty!44642 () Bool)

(declare-fun tp!84755 () Bool)

(assert (=> mapNonEmpty!44642 (= mapRes!44642 (and tp!84755 e!646430))))

(declare-fun mapValue!44642 () ValueCell!13563)

(declare-fun mapRest!44642 () (Array (_ BitVec 32) ValueCell!13563))

(declare-fun mapKey!44642 () (_ BitVec 32))

(assert (=> mapNonEmpty!44642 (= (arr!35626 _values!996) (store mapRest!44642 mapKey!44642 mapValue!44642))))

(assert (= (and start!98410 res!758198) b!1135936))

(assert (= (and b!1135936 res!758203) b!1135945))

(assert (= (and b!1135945 res!758202) b!1135949))

(assert (= (and b!1135949 res!758204) b!1135957))

(assert (= (and b!1135957 res!758192) b!1135935))

(assert (= (and b!1135935 res!758205) b!1135956))

(assert (= (and b!1135956 res!758200) b!1135948))

(assert (= (and b!1135948 res!758193) b!1135954))

(assert (= (and b!1135954 res!758197) b!1135942))

(assert (= (and b!1135942 res!758206) b!1135944))

(assert (= (and b!1135944 (not res!758201)) b!1135946))

(assert (= (and b!1135946 (not res!758196)) b!1135959))

(assert (= (and b!1135959 c!111017) b!1135940))

(assert (= (and b!1135959 (not c!111017)) b!1135933))

(assert (= (or b!1135940 b!1135933) bm!49719))

(assert (= (or b!1135940 b!1135933) bm!49722))

(assert (= (and b!1135959 (not res!758195)) b!1135941))

(assert (= (and b!1135941 (not res!758194)) b!1135960))

(assert (= (and b!1135960 c!111019) b!1135961))

(assert (= (and b!1135960 (not c!111019)) b!1135958))

(assert (= (and b!1135958 c!111018) b!1135951))

(assert (= (and b!1135958 (not c!111018)) b!1135962))

(assert (= (and b!1135962 c!111015) b!1135952))

(assert (= (and b!1135962 (not c!111015)) b!1135947))

(assert (= (or b!1135951 b!1135952) bm!49726))

(assert (= (or b!1135951 b!1135952) bm!49721))

(assert (= (or b!1135951 b!1135952) bm!49725))

(assert (= (or b!1135961 bm!49725) bm!49723))

(assert (= (or b!1135961 bm!49726) bm!49720))

(assert (= (or b!1135961 bm!49721) bm!49724))

(assert (= (and b!1135960 c!111016) b!1135937))

(assert (= (and b!1135960 (not c!111016)) b!1135955))

(assert (= (and b!1135960 res!758199) b!1135939))

(assert (= (and b!1135960 (not res!758190)) b!1135953))

(assert (= (and b!1135953 (not res!758207)) b!1135950))

(assert (= (and b!1135950 (not res!758191)) b!1135938))

(assert (= (and b!1135932 condMapEmpty!44642) mapIsEmpty!44642))

(assert (= (and b!1135932 (not condMapEmpty!44642)) mapNonEmpty!44642))

(get-info :version)

(assert (= (and mapNonEmpty!44642 ((_ is ValueCellFull!13563) mapValue!44642)) b!1135943))

(assert (= (and b!1135932 ((_ is ValueCellFull!13563) mapDefault!44642)) b!1135934))

(assert (= start!98410 b!1135932))

(declare-fun b_lambda!19121 () Bool)

(assert (=> (not b_lambda!19121) (not b!1135946)))

(declare-fun t!35851 () Bool)

(declare-fun tb!8827 () Bool)

(assert (=> (and start!98410 (= defaultEntry!1004 defaultEntry!1004) t!35851) tb!8827))

(declare-fun result!18219 () Bool)

(assert (=> tb!8827 (= result!18219 tp_is_empty!28545)))

(assert (=> b!1135946 t!35851))

(declare-fun b_and!38881 () Bool)

(assert (= b_and!38879 (and (=> t!35851 result!18219) b_and!38881)))

(declare-fun m!1048377 () Bool)

(assert (=> b!1135953 m!1048377))

(declare-fun m!1048379 () Bool)

(assert (=> b!1135956 m!1048379))

(declare-fun m!1048381 () Bool)

(assert (=> b!1135939 m!1048381))

(assert (=> b!1135937 m!1048381))

(declare-fun m!1048383 () Bool)

(assert (=> b!1135936 m!1048383))

(declare-fun m!1048385 () Bool)

(assert (=> mapNonEmpty!44642 m!1048385))

(declare-fun m!1048387 () Bool)

(assert (=> b!1135948 m!1048387))

(declare-fun m!1048389 () Bool)

(assert (=> b!1135959 m!1048389))

(declare-fun m!1048391 () Bool)

(assert (=> b!1135959 m!1048391))

(declare-fun m!1048393 () Bool)

(assert (=> b!1135944 m!1048393))

(declare-fun m!1048395 () Bool)

(assert (=> b!1135944 m!1048395))

(declare-fun m!1048397 () Bool)

(assert (=> b!1135960 m!1048397))

(declare-fun m!1048399 () Bool)

(assert (=> b!1135960 m!1048399))

(declare-fun m!1048401 () Bool)

(assert (=> b!1135960 m!1048401))

(declare-fun m!1048403 () Bool)

(assert (=> b!1135957 m!1048403))

(declare-fun m!1048405 () Bool)

(assert (=> bm!49724 m!1048405))

(declare-fun m!1048407 () Bool)

(assert (=> b!1135954 m!1048407))

(declare-fun m!1048409 () Bool)

(assert (=> b!1135954 m!1048409))

(declare-fun m!1048411 () Bool)

(assert (=> b!1135938 m!1048411))

(declare-fun m!1048413 () Bool)

(assert (=> b!1135940 m!1048413))

(declare-fun m!1048415 () Bool)

(assert (=> start!98410 m!1048415))

(declare-fun m!1048417 () Bool)

(assert (=> start!98410 m!1048417))

(declare-fun m!1048419 () Bool)

(assert (=> bm!49720 m!1048419))

(declare-fun m!1048421 () Bool)

(assert (=> bm!49719 m!1048421))

(declare-fun m!1048423 () Bool)

(assert (=> b!1135946 m!1048423))

(declare-fun m!1048425 () Bool)

(assert (=> b!1135946 m!1048425))

(declare-fun m!1048427 () Bool)

(assert (=> b!1135946 m!1048427))

(declare-fun m!1048429 () Bool)

(assert (=> b!1135946 m!1048429))

(declare-fun m!1048431 () Bool)

(assert (=> b!1135942 m!1048431))

(declare-fun m!1048433 () Bool)

(assert (=> bm!49723 m!1048433))

(declare-fun m!1048435 () Bool)

(assert (=> b!1135949 m!1048435))

(declare-fun m!1048437 () Bool)

(assert (=> b!1135941 m!1048437))

(assert (=> b!1135941 m!1048421))

(declare-fun m!1048439 () Bool)

(assert (=> b!1135961 m!1048439))

(declare-fun m!1048441 () Bool)

(assert (=> b!1135961 m!1048441))

(assert (=> b!1135961 m!1048441))

(declare-fun m!1048443 () Bool)

(assert (=> b!1135961 m!1048443))

(declare-fun m!1048445 () Bool)

(assert (=> b!1135950 m!1048445))

(declare-fun m!1048447 () Bool)

(assert (=> bm!49722 m!1048447))

(check-sat (not b!1135946) (not start!98410) (not mapNonEmpty!44642) (not b!1135950) (not b!1135938) (not b!1135954) tp_is_empty!28545 (not b_lambda!19121) (not bm!49722) (not b_next!24015) (not b!1135956) (not bm!49724) (not b!1135940) b_and!38881 (not b!1135937) (not b!1135942) (not b!1135944) (not bm!49723) (not b!1135949) (not b!1135961) (not b!1135960) (not b!1135957) (not b!1135939) (not b!1135941) (not b!1135936) (not b!1135953) (not bm!49719) (not bm!49720) (not b!1135959))
(check-sat b_and!38881 (not b_next!24015))
