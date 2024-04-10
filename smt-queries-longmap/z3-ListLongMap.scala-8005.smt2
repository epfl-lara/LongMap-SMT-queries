; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98872 () Bool)

(assert start!98872)

(declare-fun b_free!24477 () Bool)

(declare-fun b_next!24477 () Bool)

(assert (=> start!98872 (= b_free!24477 (not b_next!24477))))

(declare-fun tp!86142 () Bool)

(declare-fun b_and!39803 () Bool)

(assert (=> start!98872 (= tp!86142 b_and!39803)))

(declare-fun b!1156954 () Bool)

(declare-datatypes ((Unit!38112 0))(
  ( (Unit!38113) )
))
(declare-fun e!657949 () Unit!38112)

(declare-fun e!657959 () Unit!38112)

(assert (=> b!1156954 (= e!657949 e!657959)))

(declare-fun c!115154 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!519490 () Bool)

(assert (=> b!1156954 (= c!115154 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519490))))

(declare-fun b!1156955 () Bool)

(declare-fun c!115152 () Bool)

(assert (=> b!1156955 (= c!115152 (and (not lt!519490) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657955 () Unit!38112)

(assert (=> b!1156955 (= e!657955 e!657949)))

(declare-datatypes ((V!43803 0))(
  ( (V!43804 (val!14560 Int)) )
))
(declare-fun zeroValue!944 () V!43803)

(declare-datatypes ((array!74859 0))(
  ( (array!74860 (arr!36080 (Array (_ BitVec 32) (_ BitVec 64))) (size!36616 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74859)

(declare-datatypes ((tuple2!18522 0))(
  ( (tuple2!18523 (_1!9272 (_ BitVec 64)) (_2!9272 V!43803)) )
))
(declare-datatypes ((List!25265 0))(
  ( (Nil!25262) (Cons!25261 (h!26470 tuple2!18522) (t!36734 List!25265)) )
))
(declare-datatypes ((ListLongMap!16491 0))(
  ( (ListLongMap!16492 (toList!8261 List!25265)) )
))
(declare-fun call!55270 () ListLongMap!16491)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!55263 () Bool)

(declare-datatypes ((ValueCell!13794 0))(
  ( (ValueCellFull!13794 (v!17197 V!43803)) (EmptyCell!13794) )
))
(declare-datatypes ((array!74861 0))(
  ( (array!74862 (arr!36081 (Array (_ BitVec 32) ValueCell!13794)) (size!36617 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74861)

(declare-fun minValue!944 () V!43803)

(declare-fun getCurrentListMapNoExtraKeys!4729 (array!74859 array!74861 (_ BitVec 32) (_ BitVec 32) V!43803 V!43803 (_ BitVec 32) Int) ListLongMap!16491)

(assert (=> bm!55263 (= call!55270 (getCurrentListMapNoExtraKeys!4729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156956 () Bool)

(declare-fun res!768401 () Bool)

(declare-fun e!657954 () Bool)

(assert (=> b!1156956 (=> (not res!768401) (not e!657954))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156956 (= res!768401 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36616 _keys!1208))))))

(declare-fun b!1156957 () Bool)

(declare-fun e!657950 () Bool)

(assert (=> b!1156957 (= e!657950 true)))

(declare-fun e!657963 () Bool)

(assert (=> b!1156957 e!657963))

(declare-fun res!768400 () Bool)

(assert (=> b!1156957 (=> (not res!768400) (not e!657963))))

(declare-fun lt!519479 () ListLongMap!16491)

(declare-fun lt!519478 () ListLongMap!16491)

(assert (=> b!1156957 (= res!768400 (= lt!519479 lt!519478))))

(declare-fun lt!519494 () ListLongMap!16491)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1377 (ListLongMap!16491 (_ BitVec 64)) ListLongMap!16491)

(assert (=> b!1156957 (= lt!519479 (-!1377 lt!519494 k0!934))))

(declare-fun lt!519475 () V!43803)

(declare-fun +!3674 (ListLongMap!16491 tuple2!18522) ListLongMap!16491)

(assert (=> b!1156957 (= (-!1377 (+!3674 lt!519478 (tuple2!18523 (select (arr!36080 _keys!1208) from!1455) lt!519475)) (select (arr!36080 _keys!1208) from!1455)) lt!519478)))

(declare-fun lt!519474 () Unit!38112)

(declare-fun addThenRemoveForNewKeyIsSame!216 (ListLongMap!16491 (_ BitVec 64) V!43803) Unit!38112)

(assert (=> b!1156957 (= lt!519474 (addThenRemoveForNewKeyIsSame!216 lt!519478 (select (arr!36080 _keys!1208) from!1455) lt!519475))))

(declare-fun lt!519485 () V!43803)

(declare-fun get!18388 (ValueCell!13794 V!43803) V!43803)

(assert (=> b!1156957 (= lt!519475 (get!18388 (select (arr!36081 _values!996) from!1455) lt!519485))))

(declare-fun lt!519480 () Unit!38112)

(declare-fun e!657952 () Unit!38112)

(assert (=> b!1156957 (= lt!519480 e!657952)))

(declare-fun c!115155 () Bool)

(declare-fun contains!6773 (ListLongMap!16491 (_ BitVec 64)) Bool)

(assert (=> b!1156957 (= c!115155 (contains!6773 lt!519478 k0!934))))

(assert (=> b!1156957 (= lt!519478 (getCurrentListMapNoExtraKeys!4729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156958 () Bool)

(declare-fun res!768407 () Bool)

(assert (=> b!1156958 (=> (not res!768407) (not e!657954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156958 (= res!768407 (validKeyInArray!0 k0!934))))

(declare-fun lt!519492 () array!74861)

(declare-fun lt!519487 () array!74859)

(declare-fun b!1156959 () Bool)

(assert (=> b!1156959 (= e!657963 (= lt!519479 (getCurrentListMapNoExtraKeys!4729 lt!519487 lt!519492 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156960 () Bool)

(declare-fun res!768409 () Bool)

(assert (=> b!1156960 (=> (not res!768409) (not e!657954))))

(declare-datatypes ((List!25266 0))(
  ( (Nil!25263) (Cons!25262 (h!26471 (_ BitVec 64)) (t!36735 List!25266)) )
))
(declare-fun arrayNoDuplicates!0 (array!74859 (_ BitVec 32) List!25266) Bool)

(assert (=> b!1156960 (= res!768409 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25263))))

(declare-fun b!1156961 () Bool)

(declare-fun e!657956 () Bool)

(declare-fun call!55271 () ListLongMap!16491)

(assert (=> b!1156961 (= e!657956 (= call!55271 call!55270))))

(declare-fun bm!55264 () Bool)

(declare-fun call!55273 () Unit!38112)

(declare-fun call!55269 () Unit!38112)

(assert (=> bm!55264 (= call!55273 call!55269)))

(declare-fun b!1156963 () Bool)

(declare-fun e!657958 () Bool)

(declare-fun e!657951 () Bool)

(assert (=> b!1156963 (= e!657958 e!657951)))

(declare-fun res!768410 () Bool)

(assert (=> b!1156963 (=> res!768410 e!657951)))

(assert (=> b!1156963 (= res!768410 (not (= from!1455 i!673)))))

(declare-fun lt!519483 () ListLongMap!16491)

(assert (=> b!1156963 (= lt!519483 (getCurrentListMapNoExtraKeys!4729 lt!519487 lt!519492 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1156963 (= lt!519492 (array!74862 (store (arr!36081 _values!996) i!673 (ValueCellFull!13794 lt!519485)) (size!36617 _values!996)))))

(declare-fun dynLambda!2737 (Int (_ BitVec 64)) V!43803)

(assert (=> b!1156963 (= lt!519485 (dynLambda!2737 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1156963 (= lt!519494 (getCurrentListMapNoExtraKeys!4729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156964 () Bool)

(declare-fun res!768402 () Bool)

(assert (=> b!1156964 (=> (not res!768402) (not e!657954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156964 (= res!768402 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45335 () Bool)

(declare-fun mapRes!45335 () Bool)

(declare-fun tp!86141 () Bool)

(declare-fun e!657948 () Bool)

(assert (=> mapNonEmpty!45335 (= mapRes!45335 (and tp!86141 e!657948))))

(declare-fun mapKey!45335 () (_ BitVec 32))

(declare-fun mapRest!45335 () (Array (_ BitVec 32) ValueCell!13794))

(declare-fun mapValue!45335 () ValueCell!13794)

(assert (=> mapNonEmpty!45335 (= (arr!36081 _values!996) (store mapRest!45335 mapKey!45335 mapValue!45335))))

(declare-fun b!1156965 () Bool)

(assert (=> b!1156965 (= e!657956 (= call!55271 (-!1377 call!55270 k0!934)))))

(declare-fun bm!55265 () Bool)

(assert (=> bm!55265 (= call!55271 (getCurrentListMapNoExtraKeys!4729 lt!519487 lt!519492 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156966 () Bool)

(declare-fun lt!519489 () Unit!38112)

(assert (=> b!1156966 (= e!657949 lt!519489)))

(assert (=> b!1156966 (= lt!519489 call!55273)))

(declare-fun call!55267 () Bool)

(assert (=> b!1156966 call!55267))

(declare-fun b!1156967 () Bool)

(declare-fun e!657957 () Bool)

(assert (=> b!1156967 (= e!657954 e!657957)))

(declare-fun res!768404 () Bool)

(assert (=> b!1156967 (=> (not res!768404) (not e!657957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74859 (_ BitVec 32)) Bool)

(assert (=> b!1156967 (= res!768404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519487 mask!1564))))

(assert (=> b!1156967 (= lt!519487 (array!74860 (store (arr!36080 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36616 _keys!1208)))))

(declare-fun bm!55266 () Bool)

(declare-fun call!55272 () ListLongMap!16491)

(declare-fun call!55266 () ListLongMap!16491)

(assert (=> bm!55266 (= call!55272 call!55266)))

(declare-fun b!1156968 () Bool)

(declare-fun e!657953 () Bool)

(declare-fun e!657947 () Bool)

(assert (=> b!1156968 (= e!657953 (and e!657947 mapRes!45335))))

(declare-fun condMapEmpty!45335 () Bool)

(declare-fun mapDefault!45335 () ValueCell!13794)

(assert (=> b!1156968 (= condMapEmpty!45335 (= (arr!36081 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13794)) mapDefault!45335)))))

(declare-fun e!657961 () Bool)

(declare-fun b!1156969 () Bool)

(declare-fun arrayContainsKey!0 (array!74859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156969 (= e!657961 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!55268 () Bool)

(declare-fun bm!55267 () Bool)

(declare-fun c!115156 () Bool)

(declare-fun lt!519488 () ListLongMap!16491)

(assert (=> bm!55267 (= call!55268 (contains!6773 (ite c!115156 lt!519488 call!55272) k0!934))))

(declare-fun bm!55268 () Bool)

(assert (=> bm!55268 (= call!55266 (+!3674 lt!519478 (ite (or c!115156 c!115152) (tuple2!18523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!45335 () Bool)

(assert (=> mapIsEmpty!45335 mapRes!45335))

(declare-fun b!1156970 () Bool)

(declare-fun res!768405 () Bool)

(assert (=> b!1156970 (=> (not res!768405) (not e!657954))))

(assert (=> b!1156970 (= res!768405 (= (select (arr!36080 _keys!1208) i!673) k0!934))))

(declare-fun b!1156971 () Bool)

(declare-fun tp_is_empty!29007 () Bool)

(assert (=> b!1156971 (= e!657947 tp_is_empty!29007)))

(declare-fun b!1156972 () Bool)

(declare-fun res!768399 () Bool)

(assert (=> b!1156972 (=> (not res!768399) (not e!657954))))

(assert (=> b!1156972 (= res!768399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156973 () Bool)

(declare-fun Unit!38114 () Unit!38112)

(assert (=> b!1156973 (= e!657959 Unit!38114)))

(declare-fun b!1156974 () Bool)

(assert (=> b!1156974 (= e!657957 (not e!657958))))

(declare-fun res!768403 () Bool)

(assert (=> b!1156974 (=> res!768403 e!657958)))

(assert (=> b!1156974 (= res!768403 (bvsgt from!1455 i!673))))

(assert (=> b!1156974 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519481 () Unit!38112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74859 (_ BitVec 64) (_ BitVec 32)) Unit!38112)

(assert (=> b!1156974 (= lt!519481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1156975 () Bool)

(assert (=> b!1156975 (= e!657948 tp_is_empty!29007)))

(declare-fun e!657962 () Bool)

(declare-fun b!1156976 () Bool)

(assert (=> b!1156976 (= e!657962 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519490) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55269 () Bool)

(declare-fun addStillContains!916 (ListLongMap!16491 (_ BitVec 64) V!43803 (_ BitVec 64)) Unit!38112)

(assert (=> bm!55269 (= call!55269 (addStillContains!916 (ite c!115156 lt!519488 lt!519478) (ite c!115156 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115152 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115156 minValue!944 (ite c!115152 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1156977 () Bool)

(assert (=> b!1156977 (= e!657962 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156978 () Bool)

(assert (=> b!1156978 (= e!657951 e!657950)))

(declare-fun res!768411 () Bool)

(assert (=> b!1156978 (=> res!768411 e!657950)))

(assert (=> b!1156978 (= res!768411 (not (= (select (arr!36080 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156978 e!657956))

(declare-fun c!115153 () Bool)

(assert (=> b!1156978 (= c!115153 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519491 () Unit!38112)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!610 (array!74859 array!74861 (_ BitVec 32) (_ BitVec 32) V!43803 V!43803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38112)

(assert (=> b!1156978 (= lt!519491 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55270 () Bool)

(assert (=> bm!55270 (= call!55267 call!55268)))

(declare-fun b!1156979 () Bool)

(declare-fun Unit!38115 () Unit!38112)

(assert (=> b!1156979 (= e!657952 Unit!38115)))

(assert (=> b!1156979 (= lt!519490 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156979 (= c!115156 (and (not lt!519490) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519486 () Unit!38112)

(assert (=> b!1156979 (= lt!519486 e!657955)))

(declare-fun lt!519493 () Unit!38112)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!504 (array!74859 array!74861 (_ BitVec 32) (_ BitVec 32) V!43803 V!43803 (_ BitVec 64) (_ BitVec 32) Int) Unit!38112)

(assert (=> b!1156979 (= lt!519493 (lemmaListMapContainsThenArrayContainsFrom!504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115151 () Bool)

(assert (=> b!1156979 (= c!115151 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768408 () Bool)

(assert (=> b!1156979 (= res!768408 e!657962)))

(assert (=> b!1156979 (=> (not res!768408) (not e!657961))))

(assert (=> b!1156979 e!657961))

(declare-fun lt!519484 () Unit!38112)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74859 (_ BitVec 32) (_ BitVec 32)) Unit!38112)

(assert (=> b!1156979 (= lt!519484 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156979 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25263)))

(declare-fun lt!519477 () Unit!38112)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74859 (_ BitVec 64) (_ BitVec 32) List!25266) Unit!38112)

(assert (=> b!1156979 (= lt!519477 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25263))))

(assert (=> b!1156979 false))

(declare-fun b!1156980 () Bool)

(assert (=> b!1156980 (contains!6773 (+!3674 lt!519488 (tuple2!18523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519495 () Unit!38112)

(assert (=> b!1156980 (= lt!519495 call!55269)))

(assert (=> b!1156980 call!55268))

(assert (=> b!1156980 (= lt!519488 call!55266)))

(declare-fun lt!519476 () Unit!38112)

(assert (=> b!1156980 (= lt!519476 (addStillContains!916 lt!519478 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1156980 (= e!657955 lt!519495)))

(declare-fun b!1156981 () Bool)

(declare-fun res!768406 () Bool)

(assert (=> b!1156981 (=> (not res!768406) (not e!657957))))

(assert (=> b!1156981 (= res!768406 (arrayNoDuplicates!0 lt!519487 #b00000000000000000000000000000000 Nil!25263))))

(declare-fun b!1156982 () Bool)

(declare-fun Unit!38116 () Unit!38112)

(assert (=> b!1156982 (= e!657952 Unit!38116)))

(declare-fun b!1156983 () Bool)

(assert (=> b!1156983 call!55267))

(declare-fun lt!519482 () Unit!38112)

(assert (=> b!1156983 (= lt!519482 call!55273)))

(assert (=> b!1156983 (= e!657959 lt!519482)))

(declare-fun res!768413 () Bool)

(assert (=> start!98872 (=> (not res!768413) (not e!657954))))

(assert (=> start!98872 (= res!768413 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36616 _keys!1208))))))

(assert (=> start!98872 e!657954))

(assert (=> start!98872 tp_is_empty!29007))

(declare-fun array_inv!27614 (array!74859) Bool)

(assert (=> start!98872 (array_inv!27614 _keys!1208)))

(assert (=> start!98872 true))

(assert (=> start!98872 tp!86142))

(declare-fun array_inv!27615 (array!74861) Bool)

(assert (=> start!98872 (and (array_inv!27615 _values!996) e!657953)))

(declare-fun b!1156962 () Bool)

(declare-fun res!768412 () Bool)

(assert (=> b!1156962 (=> (not res!768412) (not e!657954))))

(assert (=> b!1156962 (= res!768412 (and (= (size!36617 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36616 _keys!1208) (size!36617 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98872 res!768413) b!1156964))

(assert (= (and b!1156964 res!768402) b!1156962))

(assert (= (and b!1156962 res!768412) b!1156972))

(assert (= (and b!1156972 res!768399) b!1156960))

(assert (= (and b!1156960 res!768409) b!1156956))

(assert (= (and b!1156956 res!768401) b!1156958))

(assert (= (and b!1156958 res!768407) b!1156970))

(assert (= (and b!1156970 res!768405) b!1156967))

(assert (= (and b!1156967 res!768404) b!1156981))

(assert (= (and b!1156981 res!768406) b!1156974))

(assert (= (and b!1156974 (not res!768403)) b!1156963))

(assert (= (and b!1156963 (not res!768410)) b!1156978))

(assert (= (and b!1156978 c!115153) b!1156965))

(assert (= (and b!1156978 (not c!115153)) b!1156961))

(assert (= (or b!1156965 b!1156961) bm!55265))

(assert (= (or b!1156965 b!1156961) bm!55263))

(assert (= (and b!1156978 (not res!768411)) b!1156957))

(assert (= (and b!1156957 c!115155) b!1156979))

(assert (= (and b!1156957 (not c!115155)) b!1156982))

(assert (= (and b!1156979 c!115156) b!1156980))

(assert (= (and b!1156979 (not c!115156)) b!1156955))

(assert (= (and b!1156955 c!115152) b!1156966))

(assert (= (and b!1156955 (not c!115152)) b!1156954))

(assert (= (and b!1156954 c!115154) b!1156983))

(assert (= (and b!1156954 (not c!115154)) b!1156973))

(assert (= (or b!1156966 b!1156983) bm!55264))

(assert (= (or b!1156966 b!1156983) bm!55266))

(assert (= (or b!1156966 b!1156983) bm!55270))

(assert (= (or b!1156980 bm!55270) bm!55267))

(assert (= (or b!1156980 bm!55264) bm!55269))

(assert (= (or b!1156980 bm!55266) bm!55268))

(assert (= (and b!1156979 c!115151) b!1156977))

(assert (= (and b!1156979 (not c!115151)) b!1156976))

(assert (= (and b!1156979 res!768408) b!1156969))

(assert (= (and b!1156957 res!768400) b!1156959))

(assert (= (and b!1156968 condMapEmpty!45335) mapIsEmpty!45335))

(assert (= (and b!1156968 (not condMapEmpty!45335)) mapNonEmpty!45335))

(get-info :version)

(assert (= (and mapNonEmpty!45335 ((_ is ValueCellFull!13794) mapValue!45335)) b!1156975))

(assert (= (and b!1156968 ((_ is ValueCellFull!13794) mapDefault!45335)) b!1156971))

(assert (= start!98872 b!1156968))

(declare-fun b_lambda!19583 () Bool)

(assert (=> (not b_lambda!19583) (not b!1156963)))

(declare-fun t!36733 () Bool)

(declare-fun tb!9289 () Bool)

(assert (=> (and start!98872 (= defaultEntry!1004 defaultEntry!1004) t!36733) tb!9289))

(declare-fun result!19143 () Bool)

(assert (=> tb!9289 (= result!19143 tp_is_empty!29007)))

(assert (=> b!1156963 t!36733))

(declare-fun b_and!39805 () Bool)

(assert (= b_and!39803 (and (=> t!36733 result!19143) b_and!39805)))

(declare-fun m!1066349 () Bool)

(assert (=> b!1156978 m!1066349))

(declare-fun m!1066351 () Bool)

(assert (=> b!1156978 m!1066351))

(declare-fun m!1066353 () Bool)

(assert (=> b!1156979 m!1066353))

(declare-fun m!1066355 () Bool)

(assert (=> b!1156979 m!1066355))

(declare-fun m!1066357 () Bool)

(assert (=> b!1156979 m!1066357))

(declare-fun m!1066359 () Bool)

(assert (=> b!1156979 m!1066359))

(declare-fun m!1066361 () Bool)

(assert (=> b!1156967 m!1066361))

(declare-fun m!1066363 () Bool)

(assert (=> b!1156967 m!1066363))

(declare-fun m!1066365 () Bool)

(assert (=> bm!55268 m!1066365))

(declare-fun m!1066367 () Bool)

(assert (=> b!1156969 m!1066367))

(declare-fun m!1066369 () Bool)

(assert (=> bm!55265 m!1066369))

(declare-fun m!1066371 () Bool)

(assert (=> b!1156965 m!1066371))

(declare-fun m!1066373 () Bool)

(assert (=> b!1156970 m!1066373))

(declare-fun m!1066375 () Bool)

(assert (=> mapNonEmpty!45335 m!1066375))

(declare-fun m!1066377 () Bool)

(assert (=> b!1156981 m!1066377))

(declare-fun m!1066379 () Bool)

(assert (=> bm!55263 m!1066379))

(declare-fun m!1066381 () Bool)

(assert (=> b!1156958 m!1066381))

(assert (=> b!1156977 m!1066367))

(declare-fun m!1066383 () Bool)

(assert (=> b!1156963 m!1066383))

(declare-fun m!1066385 () Bool)

(assert (=> b!1156963 m!1066385))

(declare-fun m!1066387 () Bool)

(assert (=> b!1156963 m!1066387))

(declare-fun m!1066389 () Bool)

(assert (=> b!1156963 m!1066389))

(declare-fun m!1066391 () Bool)

(assert (=> b!1156972 m!1066391))

(declare-fun m!1066393 () Bool)

(assert (=> start!98872 m!1066393))

(declare-fun m!1066395 () Bool)

(assert (=> start!98872 m!1066395))

(declare-fun m!1066397 () Bool)

(assert (=> b!1156974 m!1066397))

(declare-fun m!1066399 () Bool)

(assert (=> b!1156974 m!1066399))

(declare-fun m!1066401 () Bool)

(assert (=> b!1156960 m!1066401))

(declare-fun m!1066403 () Bool)

(assert (=> bm!55267 m!1066403))

(declare-fun m!1066405 () Bool)

(assert (=> b!1156980 m!1066405))

(assert (=> b!1156980 m!1066405))

(declare-fun m!1066407 () Bool)

(assert (=> b!1156980 m!1066407))

(declare-fun m!1066409 () Bool)

(assert (=> b!1156980 m!1066409))

(assert (=> b!1156957 m!1066379))

(declare-fun m!1066411 () Bool)

(assert (=> b!1156957 m!1066411))

(declare-fun m!1066413 () Bool)

(assert (=> b!1156957 m!1066413))

(declare-fun m!1066415 () Bool)

(assert (=> b!1156957 m!1066415))

(assert (=> b!1156957 m!1066349))

(declare-fun m!1066417 () Bool)

(assert (=> b!1156957 m!1066417))

(declare-fun m!1066419 () Bool)

(assert (=> b!1156957 m!1066419))

(assert (=> b!1156957 m!1066411))

(declare-fun m!1066421 () Bool)

(assert (=> b!1156957 m!1066421))

(assert (=> b!1156957 m!1066349))

(declare-fun m!1066423 () Bool)

(assert (=> b!1156957 m!1066423))

(assert (=> b!1156957 m!1066415))

(assert (=> b!1156957 m!1066349))

(declare-fun m!1066425 () Bool)

(assert (=> bm!55269 m!1066425))

(declare-fun m!1066427 () Bool)

(assert (=> b!1156964 m!1066427))

(assert (=> b!1156959 m!1066369))

(check-sat (not b!1156969) (not bm!55263) (not b!1156979) tp_is_empty!29007 (not b!1156965) (not b_next!24477) (not bm!55265) (not b_lambda!19583) (not b!1156964) (not b!1156959) (not b!1156963) (not b!1156981) (not start!98872) (not b!1156958) (not bm!55267) (not b!1156974) (not bm!55269) (not b!1156957) b_and!39805 (not mapNonEmpty!45335) (not b!1156978) (not b!1156967) (not b!1156960) (not b!1156972) (not b!1156977) (not bm!55268) (not b!1156980))
(check-sat b_and!39805 (not b_next!24477))
