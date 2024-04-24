; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98932 () Bool)

(assert start!98932)

(declare-fun b_free!24301 () Bool)

(declare-fun b_next!24301 () Bool)

(assert (=> start!98932 (= b_free!24301 (not b_next!24301))))

(declare-fun tp!85613 () Bool)

(declare-fun b_and!39453 () Bool)

(assert (=> start!98932 (= tp!85613 b_and!39453)))

(declare-fun b!1150147 () Bool)

(declare-fun e!654304 () Bool)

(declare-fun tp_is_empty!28831 () Bool)

(assert (=> b!1150147 (= e!654304 tp_is_empty!28831)))

(declare-fun res!764949 () Bool)

(declare-fun e!654297 () Bool)

(assert (=> start!98932 (=> (not res!764949) (not e!654297))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74557 0))(
  ( (array!74558 (arr!35923 (Array (_ BitVec 32) (_ BitVec 64))) (size!36460 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74557)

(assert (=> start!98932 (= res!764949 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36460 _keys!1208))))))

(assert (=> start!98932 e!654297))

(assert (=> start!98932 tp_is_empty!28831))

(declare-fun array_inv!27570 (array!74557) Bool)

(assert (=> start!98932 (array_inv!27570 _keys!1208)))

(assert (=> start!98932 true))

(assert (=> start!98932 tp!85613))

(declare-datatypes ((V!43569 0))(
  ( (V!43570 (val!14472 Int)) )
))
(declare-datatypes ((ValueCell!13706 0))(
  ( (ValueCellFull!13706 (v!17105 V!43569)) (EmptyCell!13706) )
))
(declare-datatypes ((array!74559 0))(
  ( (array!74560 (arr!35924 (Array (_ BitVec 32) ValueCell!13706)) (size!36461 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74559)

(declare-fun e!654294 () Bool)

(declare-fun array_inv!27571 (array!74559) Bool)

(assert (=> start!98932 (and (array_inv!27571 _values!996) e!654294)))

(declare-fun mapNonEmpty!45071 () Bool)

(declare-fun mapRes!45071 () Bool)

(declare-fun tp!85614 () Bool)

(declare-fun e!654303 () Bool)

(assert (=> mapNonEmpty!45071 (= mapRes!45071 (and tp!85614 e!654303))))

(declare-fun mapKey!45071 () (_ BitVec 32))

(declare-fun mapRest!45071 () (Array (_ BitVec 32) ValueCell!13706))

(declare-fun mapValue!45071 () ValueCell!13706)

(assert (=> mapNonEmpty!45071 (= (arr!35924 _values!996) (store mapRest!45071 mapKey!45071 mapValue!45071))))

(declare-fun b!1150148 () Bool)

(declare-datatypes ((Unit!37737 0))(
  ( (Unit!37738) )
))
(declare-fun e!654300 () Unit!37737)

(declare-fun lt!514166 () Unit!37737)

(assert (=> b!1150148 (= e!654300 lt!514166)))

(declare-fun call!53223 () Unit!37737)

(assert (=> b!1150148 (= lt!514166 call!53223)))

(declare-fun call!53221 () Bool)

(assert (=> b!1150148 call!53221))

(declare-fun b!1150149 () Bool)

(declare-fun res!764956 () Bool)

(assert (=> b!1150149 (=> (not res!764956) (not e!654297))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150149 (= res!764956 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!43569)

(declare-datatypes ((tuple2!18370 0))(
  ( (tuple2!18371 (_1!9196 (_ BitVec 64)) (_2!9196 V!43569)) )
))
(declare-datatypes ((List!25125 0))(
  ( (Nil!25122) (Cons!25121 (h!26339 tuple2!18370) (t!36410 List!25125)) )
))
(declare-datatypes ((ListLongMap!16347 0))(
  ( (ListLongMap!16348 (toList!8189 List!25125)) )
))
(declare-fun lt!514159 () ListLongMap!16347)

(declare-fun bm!53216 () Bool)

(declare-fun c!113969 () Bool)

(declare-fun c!113965 () Bool)

(declare-fun call!53219 () Unit!37737)

(declare-fun lt!514171 () ListLongMap!16347)

(declare-fun minValue!944 () V!43569)

(declare-fun addStillContains!854 (ListLongMap!16347 (_ BitVec 64) V!43569 (_ BitVec 64)) Unit!37737)

(assert (=> bm!53216 (= call!53219 (addStillContains!854 (ite c!113969 lt!514159 lt!514171) (ite c!113969 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113965 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113969 minValue!944 (ite c!113965 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150150 () Bool)

(declare-fun res!764947 () Bool)

(assert (=> b!1150150 (=> (not res!764947) (not e!654297))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1150150 (= res!764947 (and (= (size!36461 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36460 _keys!1208) (size!36461 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150151 () Bool)

(declare-fun res!764960 () Bool)

(assert (=> b!1150151 (=> (not res!764960) (not e!654297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74557 (_ BitVec 32)) Bool)

(assert (=> b!1150151 (= res!764960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150152 () Bool)

(declare-fun res!764953 () Bool)

(assert (=> b!1150152 (=> (not res!764953) (not e!654297))))

(declare-datatypes ((List!25126 0))(
  ( (Nil!25123) (Cons!25122 (h!26340 (_ BitVec 64)) (t!36411 List!25126)) )
))
(declare-fun arrayNoDuplicates!0 (array!74557 (_ BitVec 32) List!25126) Bool)

(assert (=> b!1150152 (= res!764953 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25123))))

(declare-fun b!1150153 () Bool)

(declare-fun e!654299 () Bool)

(declare-fun e!654292 () Bool)

(assert (=> b!1150153 (= e!654299 (not e!654292))))

(declare-fun res!764952 () Bool)

(assert (=> b!1150153 (=> res!764952 e!654292)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150153 (= res!764952 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150153 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514161 () Unit!37737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74557 (_ BitVec 64) (_ BitVec 32)) Unit!37737)

(assert (=> b!1150153 (= lt!514161 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150154 () Bool)

(declare-fun e!654301 () Bool)

(declare-fun lt!514170 () Bool)

(assert (=> b!1150154 (= e!654301 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514170) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150155 () Bool)

(declare-fun res!764950 () Bool)

(assert (=> b!1150155 (=> (not res!764950) (not e!654297))))

(assert (=> b!1150155 (= res!764950 (= (select (arr!35923 _keys!1208) i!673) k0!934))))

(declare-fun call!53224 () ListLongMap!16347)

(declare-fun lt!514174 () array!74559)

(declare-fun bm!53217 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!514173 () array!74557)

(declare-fun getCurrentListMapNoExtraKeys!4690 (array!74557 array!74559 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 32) Int) ListLongMap!16347)

(assert (=> bm!53217 (= call!53224 (getCurrentListMapNoExtraKeys!4690 lt!514173 lt!514174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150156 () Bool)

(declare-fun res!764959 () Bool)

(assert (=> b!1150156 (=> (not res!764959) (not e!654297))))

(assert (=> b!1150156 (= res!764959 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36460 _keys!1208))))))

(declare-fun b!1150157 () Bool)

(declare-fun e!654295 () Bool)

(assert (=> b!1150157 (= e!654292 e!654295)))

(declare-fun res!764951 () Bool)

(assert (=> b!1150157 (=> res!764951 e!654295)))

(assert (=> b!1150157 (= res!764951 (not (= from!1455 i!673)))))

(declare-fun lt!514160 () ListLongMap!16347)

(assert (=> b!1150157 (= lt!514160 (getCurrentListMapNoExtraKeys!4690 lt!514173 lt!514174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514157 () V!43569)

(assert (=> b!1150157 (= lt!514174 (array!74560 (store (arr!35924 _values!996) i!673 (ValueCellFull!13706 lt!514157)) (size!36461 _values!996)))))

(declare-fun dynLambda!2715 (Int (_ BitVec 64)) V!43569)

(assert (=> b!1150157 (= lt!514157 (dynLambda!2715 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514167 () ListLongMap!16347)

(assert (=> b!1150157 (= lt!514167 (getCurrentListMapNoExtraKeys!4690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150158 () Bool)

(assert (=> b!1150158 (= e!654294 (and e!654304 mapRes!45071))))

(declare-fun condMapEmpty!45071 () Bool)

(declare-fun mapDefault!45071 () ValueCell!13706)

(assert (=> b!1150158 (= condMapEmpty!45071 (= (arr!35924 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13706)) mapDefault!45071)))))

(declare-fun b!1150159 () Bool)

(declare-fun e!654296 () Bool)

(declare-fun call!53222 () ListLongMap!16347)

(assert (=> b!1150159 (= e!654296 (= call!53224 call!53222))))

(declare-fun b!1150160 () Bool)

(declare-fun e!654302 () Unit!37737)

(declare-fun Unit!37739 () Unit!37737)

(assert (=> b!1150160 (= e!654302 Unit!37739)))

(assert (=> b!1150160 (= lt!514170 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150160 (= c!113969 (and (not lt!514170) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514162 () Unit!37737)

(declare-fun e!654307 () Unit!37737)

(assert (=> b!1150160 (= lt!514162 e!654307)))

(declare-fun lt!514168 () Unit!37737)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!448 (array!74557 array!74559 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 64) (_ BitVec 32) Int) Unit!37737)

(assert (=> b!1150160 (= lt!514168 (lemmaListMapContainsThenArrayContainsFrom!448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113968 () Bool)

(assert (=> b!1150160 (= c!113968 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764955 () Bool)

(assert (=> b!1150160 (= res!764955 e!654301)))

(declare-fun e!654305 () Bool)

(assert (=> b!1150160 (=> (not res!764955) (not e!654305))))

(assert (=> b!1150160 e!654305))

(declare-fun lt!514164 () Unit!37737)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74557 (_ BitVec 32) (_ BitVec 32)) Unit!37737)

(assert (=> b!1150160 (= lt!514164 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150160 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25123)))

(declare-fun lt!514165 () Unit!37737)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74557 (_ BitVec 64) (_ BitVec 32) List!25126) Unit!37737)

(assert (=> b!1150160 (= lt!514165 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25123))))

(assert (=> b!1150160 false))

(declare-fun b!1150161 () Bool)

(declare-fun res!764957 () Bool)

(assert (=> b!1150161 (=> (not res!764957) (not e!654297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150161 (= res!764957 (validMask!0 mask!1564))))

(declare-fun b!1150162 () Bool)

(assert (=> b!1150162 call!53221))

(declare-fun lt!514177 () Unit!37737)

(assert (=> b!1150162 (= lt!514177 call!53223)))

(declare-fun e!654291 () Unit!37737)

(assert (=> b!1150162 (= e!654291 lt!514177)))

(declare-fun b!1150163 () Bool)

(assert (=> b!1150163 (= e!654303 tp_is_empty!28831)))

(declare-fun b!1150164 () Bool)

(declare-fun call!53225 () ListLongMap!16347)

(declare-fun contains!6726 (ListLongMap!16347 (_ BitVec 64)) Bool)

(assert (=> b!1150164 (contains!6726 call!53225 k0!934)))

(declare-fun lt!514169 () Unit!37737)

(assert (=> b!1150164 (= lt!514169 call!53219)))

(declare-fun call!53220 () Bool)

(assert (=> b!1150164 call!53220))

(declare-fun +!3628 (ListLongMap!16347 tuple2!18370) ListLongMap!16347)

(assert (=> b!1150164 (= lt!514159 (+!3628 lt!514171 (tuple2!18371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514175 () Unit!37737)

(assert (=> b!1150164 (= lt!514175 (addStillContains!854 lt!514171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150164 (= e!654307 lt!514169)))

(declare-fun b!1150165 () Bool)

(declare-fun Unit!37740 () Unit!37737)

(assert (=> b!1150165 (= e!654302 Unit!37740)))

(declare-fun bm!53218 () Bool)

(assert (=> bm!53218 (= call!53222 (getCurrentListMapNoExtraKeys!4690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150166 () Bool)

(declare-fun e!654298 () Bool)

(assert (=> b!1150166 (= e!654298 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36460 _keys!1208))))))

(declare-fun e!654306 () Bool)

(assert (=> b!1150166 e!654306))

(declare-fun res!764948 () Bool)

(assert (=> b!1150166 (=> (not res!764948) (not e!654306))))

(declare-fun lt!514163 () V!43569)

(declare-fun -!1312 (ListLongMap!16347 (_ BitVec 64)) ListLongMap!16347)

(assert (=> b!1150166 (= res!764948 (= (-!1312 (+!3628 lt!514171 (tuple2!18371 (select (arr!35923 _keys!1208) from!1455) lt!514163)) (select (arr!35923 _keys!1208) from!1455)) lt!514171))))

(declare-fun lt!514176 () Unit!37737)

(declare-fun addThenRemoveForNewKeyIsSame!161 (ListLongMap!16347 (_ BitVec 64) V!43569) Unit!37737)

(assert (=> b!1150166 (= lt!514176 (addThenRemoveForNewKeyIsSame!161 lt!514171 (select (arr!35923 _keys!1208) from!1455) lt!514163))))

(declare-fun get!18306 (ValueCell!13706 V!43569) V!43569)

(assert (=> b!1150166 (= lt!514163 (get!18306 (select (arr!35924 _values!996) from!1455) lt!514157))))

(declare-fun lt!514158 () Unit!37737)

(assert (=> b!1150166 (= lt!514158 e!654302)))

(declare-fun c!113970 () Bool)

(assert (=> b!1150166 (= c!113970 (contains!6726 lt!514171 k0!934))))

(assert (=> b!1150166 (= lt!514171 (getCurrentListMapNoExtraKeys!4690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150167 () Bool)

(assert (=> b!1150167 (= e!654297 e!654299)))

(declare-fun res!764961 () Bool)

(assert (=> b!1150167 (=> (not res!764961) (not e!654299))))

(assert (=> b!1150167 (= res!764961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514173 mask!1564))))

(assert (=> b!1150167 (= lt!514173 (array!74558 (store (arr!35923 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36460 _keys!1208)))))

(declare-fun b!1150168 () Bool)

(assert (=> b!1150168 (= c!113965 (and (not lt!514170) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1150168 (= e!654307 e!654300)))

(declare-fun bm!53219 () Bool)

(assert (=> bm!53219 (= call!53221 call!53220)))

(declare-fun b!1150169 () Bool)

(assert (=> b!1150169 (= e!654300 e!654291)))

(declare-fun c!113966 () Bool)

(assert (=> b!1150169 (= c!113966 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514170))))

(declare-fun b!1150170 () Bool)

(assert (=> b!1150170 (= e!654301 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150171 () Bool)

(declare-fun Unit!37741 () Unit!37737)

(assert (=> b!1150171 (= e!654291 Unit!37741)))

(declare-fun b!1150172 () Bool)

(assert (=> b!1150172 (= e!654306 (= (-!1312 lt!514167 k0!934) lt!514171))))

(declare-fun bm!53220 () Bool)

(declare-fun call!53226 () ListLongMap!16347)

(assert (=> bm!53220 (= call!53226 call!53225)))

(declare-fun bm!53221 () Bool)

(assert (=> bm!53221 (= call!53223 call!53219)))

(declare-fun b!1150173 () Bool)

(declare-fun res!764958 () Bool)

(assert (=> b!1150173 (=> (not res!764958) (not e!654299))))

(assert (=> b!1150173 (= res!764958 (arrayNoDuplicates!0 lt!514173 #b00000000000000000000000000000000 Nil!25123))))

(declare-fun mapIsEmpty!45071 () Bool)

(assert (=> mapIsEmpty!45071 mapRes!45071))

(declare-fun b!1150174 () Bool)

(assert (=> b!1150174 (= e!654296 (= call!53224 (-!1312 call!53222 k0!934)))))

(declare-fun bm!53222 () Bool)

(assert (=> bm!53222 (= call!53220 (contains!6726 (ite c!113969 lt!514159 call!53226) k0!934))))

(declare-fun b!1150175 () Bool)

(assert (=> b!1150175 (= e!654295 e!654298)))

(declare-fun res!764954 () Bool)

(assert (=> b!1150175 (=> res!764954 e!654298)))

(assert (=> b!1150175 (= res!764954 (not (= (select (arr!35923 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150175 e!654296))

(declare-fun c!113967 () Bool)

(assert (=> b!1150175 (= c!113967 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514172 () Unit!37737)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!558 (array!74557 array!74559 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37737)

(assert (=> b!1150175 (= lt!514172 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53223 () Bool)

(assert (=> bm!53223 (= call!53225 (+!3628 (ite c!113969 lt!514159 lt!514171) (ite c!113969 (tuple2!18371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113965 (tuple2!18371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1150176 () Bool)

(assert (=> b!1150176 (= e!654305 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98932 res!764949) b!1150161))

(assert (= (and b!1150161 res!764957) b!1150150))

(assert (= (and b!1150150 res!764947) b!1150151))

(assert (= (and b!1150151 res!764960) b!1150152))

(assert (= (and b!1150152 res!764953) b!1150156))

(assert (= (and b!1150156 res!764959) b!1150149))

(assert (= (and b!1150149 res!764956) b!1150155))

(assert (= (and b!1150155 res!764950) b!1150167))

(assert (= (and b!1150167 res!764961) b!1150173))

(assert (= (and b!1150173 res!764958) b!1150153))

(assert (= (and b!1150153 (not res!764952)) b!1150157))

(assert (= (and b!1150157 (not res!764951)) b!1150175))

(assert (= (and b!1150175 c!113967) b!1150174))

(assert (= (and b!1150175 (not c!113967)) b!1150159))

(assert (= (or b!1150174 b!1150159) bm!53217))

(assert (= (or b!1150174 b!1150159) bm!53218))

(assert (= (and b!1150175 (not res!764954)) b!1150166))

(assert (= (and b!1150166 c!113970) b!1150160))

(assert (= (and b!1150166 (not c!113970)) b!1150165))

(assert (= (and b!1150160 c!113969) b!1150164))

(assert (= (and b!1150160 (not c!113969)) b!1150168))

(assert (= (and b!1150168 c!113965) b!1150148))

(assert (= (and b!1150168 (not c!113965)) b!1150169))

(assert (= (and b!1150169 c!113966) b!1150162))

(assert (= (and b!1150169 (not c!113966)) b!1150171))

(assert (= (or b!1150148 b!1150162) bm!53221))

(assert (= (or b!1150148 b!1150162) bm!53220))

(assert (= (or b!1150148 b!1150162) bm!53219))

(assert (= (or b!1150164 bm!53219) bm!53222))

(assert (= (or b!1150164 bm!53221) bm!53216))

(assert (= (or b!1150164 bm!53220) bm!53223))

(assert (= (and b!1150160 c!113968) b!1150170))

(assert (= (and b!1150160 (not c!113968)) b!1150154))

(assert (= (and b!1150160 res!764955) b!1150176))

(assert (= (and b!1150166 res!764948) b!1150172))

(assert (= (and b!1150158 condMapEmpty!45071) mapIsEmpty!45071))

(assert (= (and b!1150158 (not condMapEmpty!45071)) mapNonEmpty!45071))

(get-info :version)

(assert (= (and mapNonEmpty!45071 ((_ is ValueCellFull!13706) mapValue!45071)) b!1150163))

(assert (= (and b!1150158 ((_ is ValueCellFull!13706) mapDefault!45071)) b!1150147))

(assert (= start!98932 b!1150158))

(declare-fun b_lambda!19401 () Bool)

(assert (=> (not b_lambda!19401) (not b!1150157)))

(declare-fun t!36409 () Bool)

(declare-fun tb!9105 () Bool)

(assert (=> (and start!98932 (= defaultEntry!1004 defaultEntry!1004) t!36409) tb!9105))

(declare-fun result!18783 () Bool)

(assert (=> tb!9105 (= result!18783 tp_is_empty!28831)))

(assert (=> b!1150157 t!36409))

(declare-fun b_and!39455 () Bool)

(assert (= b_and!39453 (and (=> t!36409 result!18783) b_and!39455)))

(declare-fun m!1060873 () Bool)

(assert (=> bm!53217 m!1060873))

(declare-fun m!1060875 () Bool)

(assert (=> b!1150176 m!1060875))

(assert (=> b!1150170 m!1060875))

(declare-fun m!1060877 () Bool)

(assert (=> b!1150151 m!1060877))

(declare-fun m!1060879 () Bool)

(assert (=> b!1150153 m!1060879))

(declare-fun m!1060881 () Bool)

(assert (=> b!1150153 m!1060881))

(declare-fun m!1060883 () Bool)

(assert (=> b!1150173 m!1060883))

(declare-fun m!1060885 () Bool)

(assert (=> bm!53218 m!1060885))

(declare-fun m!1060887 () Bool)

(assert (=> mapNonEmpty!45071 m!1060887))

(declare-fun m!1060889 () Bool)

(assert (=> b!1150167 m!1060889))

(declare-fun m!1060891 () Bool)

(assert (=> b!1150167 m!1060891))

(declare-fun m!1060893 () Bool)

(assert (=> b!1150160 m!1060893))

(declare-fun m!1060895 () Bool)

(assert (=> b!1150160 m!1060895))

(declare-fun m!1060897 () Bool)

(assert (=> b!1150160 m!1060897))

(declare-fun m!1060899 () Bool)

(assert (=> b!1150160 m!1060899))

(declare-fun m!1060901 () Bool)

(assert (=> start!98932 m!1060901))

(declare-fun m!1060903 () Bool)

(assert (=> start!98932 m!1060903))

(declare-fun m!1060905 () Bool)

(assert (=> b!1150164 m!1060905))

(declare-fun m!1060907 () Bool)

(assert (=> b!1150164 m!1060907))

(declare-fun m!1060909 () Bool)

(assert (=> b!1150164 m!1060909))

(declare-fun m!1060911 () Bool)

(assert (=> b!1150174 m!1060911))

(declare-fun m!1060913 () Bool)

(assert (=> b!1150152 m!1060913))

(declare-fun m!1060915 () Bool)

(assert (=> bm!53216 m!1060915))

(declare-fun m!1060917 () Bool)

(assert (=> bm!53222 m!1060917))

(declare-fun m!1060919 () Bool)

(assert (=> b!1150157 m!1060919))

(declare-fun m!1060921 () Bool)

(assert (=> b!1150157 m!1060921))

(declare-fun m!1060923 () Bool)

(assert (=> b!1150157 m!1060923))

(declare-fun m!1060925 () Bool)

(assert (=> b!1150157 m!1060925))

(declare-fun m!1060927 () Bool)

(assert (=> b!1150155 m!1060927))

(declare-fun m!1060929 () Bool)

(assert (=> b!1150175 m!1060929))

(declare-fun m!1060931 () Bool)

(assert (=> b!1150175 m!1060931))

(declare-fun m!1060933 () Bool)

(assert (=> b!1150149 m!1060933))

(declare-fun m!1060935 () Bool)

(assert (=> bm!53223 m!1060935))

(assert (=> b!1150166 m!1060885))

(declare-fun m!1060937 () Bool)

(assert (=> b!1150166 m!1060937))

(assert (=> b!1150166 m!1060929))

(declare-fun m!1060939 () Bool)

(assert (=> b!1150166 m!1060939))

(declare-fun m!1060941 () Bool)

(assert (=> b!1150166 m!1060941))

(assert (=> b!1150166 m!1060929))

(declare-fun m!1060943 () Bool)

(assert (=> b!1150166 m!1060943))

(assert (=> b!1150166 m!1060941))

(assert (=> b!1150166 m!1060937))

(declare-fun m!1060945 () Bool)

(assert (=> b!1150166 m!1060945))

(assert (=> b!1150166 m!1060929))

(declare-fun m!1060947 () Bool)

(assert (=> b!1150166 m!1060947))

(declare-fun m!1060949 () Bool)

(assert (=> b!1150161 m!1060949))

(declare-fun m!1060951 () Bool)

(assert (=> b!1150172 m!1060951))

(check-sat (not b!1150153) (not b!1150175) b_and!39455 (not b!1150166) (not b!1150174) (not bm!53216) (not bm!53222) (not b!1150157) (not b!1150170) (not b!1150172) (not b!1150176) (not bm!53223) (not b_lambda!19401) (not b!1150167) (not start!98932) (not b!1150152) (not b!1150160) (not bm!53218) (not b_next!24301) (not b!1150151) (not b!1150173) (not b!1150149) (not mapNonEmpty!45071) (not b!1150164) tp_is_empty!28831 (not bm!53217) (not b!1150161))
(check-sat b_and!39455 (not b_next!24301))
