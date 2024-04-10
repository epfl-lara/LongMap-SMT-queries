; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101150 () Bool)

(assert start!101150)

(declare-fun b_free!26073 () Bool)

(declare-fun b_next!26073 () Bool)

(assert (=> start!101150 (= b_free!26073 (not b_next!26073))))

(declare-fun tp!91241 () Bool)

(declare-fun b_and!43263 () Bool)

(assert (=> start!101150 (= tp!91241 b_and!43263)))

(declare-fun b!1213384 () Bool)

(declare-fun call!60362 () Bool)

(assert (=> b!1213384 call!60362))

(declare-datatypes ((Unit!40236 0))(
  ( (Unit!40237) )
))
(declare-fun lt!551645 () Unit!40236)

(declare-fun call!60363 () Unit!40236)

(assert (=> b!1213384 (= lt!551645 call!60363)))

(declare-fun e!689102 () Unit!40236)

(assert (=> b!1213384 (= e!689102 lt!551645)))

(declare-fun b!1213385 () Bool)

(declare-fun e!689088 () Unit!40236)

(assert (=> b!1213385 (= e!689088 e!689102)))

(declare-fun c!119868 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!551641 () Bool)

(assert (=> b!1213385 (= c!119868 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551641))))

(declare-fun b!1213386 () Bool)

(declare-fun e!689104 () Bool)

(declare-fun tp_is_empty!30777 () Bool)

(assert (=> b!1213386 (= e!689104 tp_is_empty!30777)))

(declare-fun b!1213388 () Bool)

(declare-fun e!689100 () Bool)

(declare-fun mapRes!48040 () Bool)

(assert (=> b!1213388 (= e!689100 (and e!689104 mapRes!48040))))

(declare-fun condMapEmpty!48040 () Bool)

(declare-datatypes ((V!46163 0))(
  ( (V!46164 (val!15445 Int)) )
))
(declare-datatypes ((ValueCell!14679 0))(
  ( (ValueCellFull!14679 (v!18098 V!46163)) (EmptyCell!14679) )
))
(declare-datatypes ((array!78341 0))(
  ( (array!78342 (arr!37805 (Array (_ BitVec 32) ValueCell!14679)) (size!38341 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78341)

(declare-fun mapDefault!48040 () ValueCell!14679)

(assert (=> b!1213388 (= condMapEmpty!48040 (= (arr!37805 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14679)) mapDefault!48040)))))

(declare-fun zeroValue!944 () V!46163)

(declare-datatypes ((array!78343 0))(
  ( (array!78344 (arr!37806 (Array (_ BitVec 32) (_ BitVec 64))) (size!38342 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78343)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!60356 () Bool)

(declare-fun minValue!944 () V!46163)

(declare-datatypes ((tuple2!19850 0))(
  ( (tuple2!19851 (_1!9936 (_ BitVec 64)) (_2!9936 V!46163)) )
))
(declare-datatypes ((List!26649 0))(
  ( (Nil!26646) (Cons!26645 (h!27854 tuple2!19850) (t!39702 List!26649)) )
))
(declare-datatypes ((ListLongMap!17819 0))(
  ( (ListLongMap!17820 (toList!8925 List!26649)) )
))
(declare-fun call!60365 () ListLongMap!17819)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5355 (array!78343 array!78341 (_ BitVec 32) (_ BitVec 32) V!46163 V!46163 (_ BitVec 32) Int) ListLongMap!17819)

(assert (=> bm!60356 (= call!60365 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213389 () Bool)

(declare-fun res!805711 () Bool)

(declare-fun e!689099 () Bool)

(assert (=> b!1213389 (=> (not res!805711) (not e!689099))))

(declare-datatypes ((List!26650 0))(
  ( (Nil!26647) (Cons!26646 (h!27855 (_ BitVec 64)) (t!39703 List!26650)) )
))
(declare-fun arrayNoDuplicates!0 (array!78343 (_ BitVec 32) List!26650) Bool)

(assert (=> b!1213389 (= res!805711 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26647))))

(declare-fun call!60364 () ListLongMap!17819)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!689095 () Bool)

(declare-fun b!1213390 () Bool)

(declare-fun -!1871 (ListLongMap!17819 (_ BitVec 64)) ListLongMap!17819)

(assert (=> b!1213390 (= e!689095 (= call!60364 (-!1871 call!60365 k0!934)))))

(declare-fun bm!60357 () Bool)

(declare-fun call!60366 () Bool)

(assert (=> bm!60357 (= call!60362 call!60366)))

(declare-fun bm!60358 () Bool)

(declare-fun call!60360 () Unit!40236)

(assert (=> bm!60358 (= call!60363 call!60360)))

(declare-fun b!1213391 () Bool)

(assert (=> b!1213391 (= e!689095 (= call!60364 call!60365))))

(declare-fun b!1213392 () Bool)

(declare-fun res!805722 () Bool)

(assert (=> b!1213392 (=> (not res!805722) (not e!689099))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213392 (= res!805722 (= (select (arr!37806 _keys!1208) i!673) k0!934))))

(declare-fun b!1213393 () Bool)

(declare-fun res!805714 () Bool)

(declare-fun e!689090 () Bool)

(assert (=> b!1213393 (=> (not res!805714) (not e!689090))))

(declare-fun lt!551648 () array!78343)

(assert (=> b!1213393 (= res!805714 (arrayNoDuplicates!0 lt!551648 #b00000000000000000000000000000000 Nil!26647))))

(declare-fun b!1213394 () Bool)

(declare-fun res!805713 () Bool)

(assert (=> b!1213394 (=> (not res!805713) (not e!689099))))

(assert (=> b!1213394 (= res!805713 (and (= (size!38341 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38342 _keys!1208) (size!38341 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213395 () Bool)

(declare-fun res!805721 () Bool)

(assert (=> b!1213395 (=> (not res!805721) (not e!689099))))

(assert (=> b!1213395 (= res!805721 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38342 _keys!1208))))))

(declare-fun b!1213396 () Bool)

(declare-fun e!689092 () Unit!40236)

(declare-fun Unit!40238 () Unit!40236)

(assert (=> b!1213396 (= e!689092 Unit!40238)))

(declare-fun bm!60359 () Bool)

(declare-fun lt!551644 () array!78341)

(assert (=> bm!60359 (= call!60364 (getCurrentListMapNoExtraKeys!5355 lt!551648 lt!551644 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!805715 () Bool)

(assert (=> start!101150 (=> (not res!805715) (not e!689099))))

(assert (=> start!101150 (= res!805715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38342 _keys!1208))))))

(assert (=> start!101150 e!689099))

(assert (=> start!101150 tp_is_empty!30777))

(declare-fun array_inv!28794 (array!78343) Bool)

(assert (=> start!101150 (array_inv!28794 _keys!1208)))

(assert (=> start!101150 true))

(assert (=> start!101150 tp!91241))

(declare-fun array_inv!28795 (array!78341) Bool)

(assert (=> start!101150 (and (array_inv!28795 _values!996) e!689100)))

(declare-fun b!1213387 () Bool)

(declare-fun e!689096 () Bool)

(assert (=> b!1213387 (= e!689096 tp_is_empty!30777)))

(declare-fun bm!60360 () Bool)

(declare-fun call!60359 () ListLongMap!17819)

(declare-fun call!60361 () ListLongMap!17819)

(assert (=> bm!60360 (= call!60359 call!60361)))

(declare-fun b!1213397 () Bool)

(declare-fun Unit!40239 () Unit!40236)

(assert (=> b!1213397 (= e!689102 Unit!40239)))

(declare-fun b!1213398 () Bool)

(declare-fun res!805712 () Bool)

(assert (=> b!1213398 (=> (not res!805712) (not e!689099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78343 (_ BitVec 32)) Bool)

(assert (=> b!1213398 (= res!805712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213399 () Bool)

(declare-fun e!689097 () Bool)

(assert (=> b!1213399 (= e!689090 (not e!689097))))

(declare-fun res!805710 () Bool)

(assert (=> b!1213399 (=> res!805710 e!689097)))

(assert (=> b!1213399 (= res!805710 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213399 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551634 () Unit!40236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78343 (_ BitVec 64) (_ BitVec 32)) Unit!40236)

(assert (=> b!1213399 (= lt!551634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!689091 () Bool)

(declare-fun b!1213400 () Bool)

(assert (=> b!1213400 (= e!689091 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551641) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!119863 () Bool)

(declare-fun lt!551631 () ListLongMap!17819)

(declare-fun bm!60361 () Bool)

(declare-fun contains!6996 (ListLongMap!17819 (_ BitVec 64)) Bool)

(assert (=> bm!60361 (= call!60366 (contains!6996 (ite c!119863 lt!551631 call!60359) k0!934))))

(declare-fun bm!60362 () Bool)

(declare-fun lt!551638 () ListLongMap!17819)

(declare-fun c!119864 () Bool)

(declare-fun addStillContains!1067 (ListLongMap!17819 (_ BitVec 64) V!46163 (_ BitVec 64)) Unit!40236)

(assert (=> bm!60362 (= call!60360 (addStillContains!1067 (ite c!119863 lt!551631 lt!551638) (ite c!119863 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119864 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119863 minValue!944 (ite c!119864 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1213401 () Bool)

(assert (=> b!1213401 (= c!119864 (and (not lt!551641) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!689089 () Unit!40236)

(assert (=> b!1213401 (= e!689089 e!689088)))

(declare-fun b!1213402 () Bool)

(declare-fun e!689103 () Bool)

(declare-fun e!689093 () Bool)

(assert (=> b!1213402 (= e!689103 e!689093)))

(declare-fun res!805724 () Bool)

(assert (=> b!1213402 (=> res!805724 e!689093)))

(assert (=> b!1213402 (= res!805724 (not (= (select (arr!37806 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213402 e!689095))

(declare-fun c!119865 () Bool)

(assert (=> b!1213402 (= c!119865 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551633 () Unit!40236)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1080 (array!78343 array!78341 (_ BitVec 32) (_ BitVec 32) V!46163 V!46163 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40236)

(assert (=> b!1213402 (= lt!551633 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213403 () Bool)

(declare-fun lt!551650 () ListLongMap!17819)

(declare-fun e!689098 () Bool)

(assert (=> b!1213403 (= e!689098 (= lt!551650 (getCurrentListMapNoExtraKeys!5355 lt!551648 lt!551644 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213404 () Bool)

(assert (=> b!1213404 (= e!689091 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60363 () Bool)

(declare-fun +!4039 (ListLongMap!17819 tuple2!19850) ListLongMap!17819)

(assert (=> bm!60363 (= call!60361 (+!4039 (ite c!119863 lt!551631 lt!551638) (ite c!119863 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119864 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!48040 () Bool)

(declare-fun tp!91240 () Bool)

(assert (=> mapNonEmpty!48040 (= mapRes!48040 (and tp!91240 e!689096))))

(declare-fun mapValue!48040 () ValueCell!14679)

(declare-fun mapKey!48040 () (_ BitVec 32))

(declare-fun mapRest!48040 () (Array (_ BitVec 32) ValueCell!14679))

(assert (=> mapNonEmpty!48040 (= (arr!37805 _values!996) (store mapRest!48040 mapKey!48040 mapValue!48040))))

(declare-fun e!689101 () Bool)

(declare-fun b!1213405 () Bool)

(assert (=> b!1213405 (= e!689101 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!551652 () ListLongMap!17819)

(declare-fun b!1213406 () Bool)

(assert (=> b!1213406 (= e!689093 (or (not (= lt!551650 lt!551652)) (bvslt i!673 (size!38341 _values!996))))))

(assert (=> b!1213406 e!689098))

(declare-fun res!805717 () Bool)

(assert (=> b!1213406 (=> (not res!805717) (not e!689098))))

(assert (=> b!1213406 (= res!805717 (= lt!551650 lt!551638))))

(declare-fun lt!551640 () ListLongMap!17819)

(assert (=> b!1213406 (= lt!551650 (-!1871 lt!551640 k0!934))))

(declare-fun lt!551647 () V!46163)

(assert (=> b!1213406 (= (-!1871 (+!4039 lt!551638 (tuple2!19851 (select (arr!37806 _keys!1208) from!1455) lt!551647)) (select (arr!37806 _keys!1208) from!1455)) lt!551638)))

(declare-fun lt!551651 () Unit!40236)

(declare-fun addThenRemoveForNewKeyIsSame!285 (ListLongMap!17819 (_ BitVec 64) V!46163) Unit!40236)

(assert (=> b!1213406 (= lt!551651 (addThenRemoveForNewKeyIsSame!285 lt!551638 (select (arr!37806 _keys!1208) from!1455) lt!551647))))

(declare-fun lt!551639 () V!46163)

(declare-fun get!19272 (ValueCell!14679 V!46163) V!46163)

(assert (=> b!1213406 (= lt!551647 (get!19272 (select (arr!37805 _values!996) from!1455) lt!551639))))

(declare-fun lt!551642 () Unit!40236)

(assert (=> b!1213406 (= lt!551642 e!689092)))

(declare-fun c!119866 () Bool)

(assert (=> b!1213406 (= c!119866 (contains!6996 lt!551638 k0!934))))

(assert (=> b!1213406 (= lt!551638 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213407 () Bool)

(assert (=> b!1213407 (= e!689097 e!689103)))

(declare-fun res!805723 () Bool)

(assert (=> b!1213407 (=> res!805723 e!689103)))

(assert (=> b!1213407 (= res!805723 (not (= from!1455 i!673)))))

(assert (=> b!1213407 (= lt!551652 (getCurrentListMapNoExtraKeys!5355 lt!551648 lt!551644 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1213407 (= lt!551644 (array!78342 (store (arr!37805 _values!996) i!673 (ValueCellFull!14679 lt!551639)) (size!38341 _values!996)))))

(declare-fun dynLambda!3246 (Int (_ BitVec 64)) V!46163)

(assert (=> b!1213407 (= lt!551639 (dynLambda!3246 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1213407 (= lt!551640 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213408 () Bool)

(declare-fun res!805719 () Bool)

(assert (=> b!1213408 (=> (not res!805719) (not e!689099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213408 (= res!805719 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48040 () Bool)

(assert (=> mapIsEmpty!48040 mapRes!48040))

(declare-fun b!1213409 () Bool)

(declare-fun Unit!40240 () Unit!40236)

(assert (=> b!1213409 (= e!689092 Unit!40240)))

(assert (=> b!1213409 (= lt!551641 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213409 (= c!119863 (and (not lt!551641) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551649 () Unit!40236)

(assert (=> b!1213409 (= lt!551649 e!689089)))

(declare-fun lt!551632 () Unit!40236)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!617 (array!78343 array!78341 (_ BitVec 32) (_ BitVec 32) V!46163 V!46163 (_ BitVec 64) (_ BitVec 32) Int) Unit!40236)

(assert (=> b!1213409 (= lt!551632 (lemmaListMapContainsThenArrayContainsFrom!617 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119867 () Bool)

(assert (=> b!1213409 (= c!119867 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805716 () Bool)

(assert (=> b!1213409 (= res!805716 e!689091)))

(assert (=> b!1213409 (=> (not res!805716) (not e!689101))))

(assert (=> b!1213409 e!689101))

(declare-fun lt!551643 () Unit!40236)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78343 (_ BitVec 32) (_ BitVec 32)) Unit!40236)

(assert (=> b!1213409 (= lt!551643 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213409 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26647)))

(declare-fun lt!551636 () Unit!40236)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78343 (_ BitVec 64) (_ BitVec 32) List!26650) Unit!40236)

(assert (=> b!1213409 (= lt!551636 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26647))))

(assert (=> b!1213409 false))

(declare-fun b!1213410 () Bool)

(assert (=> b!1213410 (= e!689099 e!689090)))

(declare-fun res!805720 () Bool)

(assert (=> b!1213410 (=> (not res!805720) (not e!689090))))

(assert (=> b!1213410 (= res!805720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551648 mask!1564))))

(assert (=> b!1213410 (= lt!551648 (array!78344 (store (arr!37806 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38342 _keys!1208)))))

(declare-fun b!1213411 () Bool)

(declare-fun res!805718 () Bool)

(assert (=> b!1213411 (=> (not res!805718) (not e!689099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213411 (= res!805718 (validKeyInArray!0 k0!934))))

(declare-fun b!1213412 () Bool)

(declare-fun lt!551637 () Unit!40236)

(assert (=> b!1213412 (= e!689088 lt!551637)))

(assert (=> b!1213412 (= lt!551637 call!60363)))

(assert (=> b!1213412 call!60362))

(declare-fun b!1213413 () Bool)

(assert (=> b!1213413 (contains!6996 call!60361 k0!934)))

(declare-fun lt!551635 () Unit!40236)

(assert (=> b!1213413 (= lt!551635 call!60360)))

(assert (=> b!1213413 call!60366))

(assert (=> b!1213413 (= lt!551631 (+!4039 lt!551638 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551646 () Unit!40236)

(assert (=> b!1213413 (= lt!551646 (addStillContains!1067 lt!551638 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1213413 (= e!689089 lt!551635)))

(assert (= (and start!101150 res!805715) b!1213408))

(assert (= (and b!1213408 res!805719) b!1213394))

(assert (= (and b!1213394 res!805713) b!1213398))

(assert (= (and b!1213398 res!805712) b!1213389))

(assert (= (and b!1213389 res!805711) b!1213395))

(assert (= (and b!1213395 res!805721) b!1213411))

(assert (= (and b!1213411 res!805718) b!1213392))

(assert (= (and b!1213392 res!805722) b!1213410))

(assert (= (and b!1213410 res!805720) b!1213393))

(assert (= (and b!1213393 res!805714) b!1213399))

(assert (= (and b!1213399 (not res!805710)) b!1213407))

(assert (= (and b!1213407 (not res!805723)) b!1213402))

(assert (= (and b!1213402 c!119865) b!1213390))

(assert (= (and b!1213402 (not c!119865)) b!1213391))

(assert (= (or b!1213390 b!1213391) bm!60359))

(assert (= (or b!1213390 b!1213391) bm!60356))

(assert (= (and b!1213402 (not res!805724)) b!1213406))

(assert (= (and b!1213406 c!119866) b!1213409))

(assert (= (and b!1213406 (not c!119866)) b!1213396))

(assert (= (and b!1213409 c!119863) b!1213413))

(assert (= (and b!1213409 (not c!119863)) b!1213401))

(assert (= (and b!1213401 c!119864) b!1213412))

(assert (= (and b!1213401 (not c!119864)) b!1213385))

(assert (= (and b!1213385 c!119868) b!1213384))

(assert (= (and b!1213385 (not c!119868)) b!1213397))

(assert (= (or b!1213412 b!1213384) bm!60358))

(assert (= (or b!1213412 b!1213384) bm!60360))

(assert (= (or b!1213412 b!1213384) bm!60357))

(assert (= (or b!1213413 bm!60357) bm!60361))

(assert (= (or b!1213413 bm!60358) bm!60362))

(assert (= (or b!1213413 bm!60360) bm!60363))

(assert (= (and b!1213409 c!119867) b!1213404))

(assert (= (and b!1213409 (not c!119867)) b!1213400))

(assert (= (and b!1213409 res!805716) b!1213405))

(assert (= (and b!1213406 res!805717) b!1213403))

(assert (= (and b!1213388 condMapEmpty!48040) mapIsEmpty!48040))

(assert (= (and b!1213388 (not condMapEmpty!48040)) mapNonEmpty!48040))

(get-info :version)

(assert (= (and mapNonEmpty!48040 ((_ is ValueCellFull!14679) mapValue!48040)) b!1213387))

(assert (= (and b!1213388 ((_ is ValueCellFull!14679) mapDefault!48040)) b!1213386))

(assert (= start!101150 b!1213388))

(declare-fun b_lambda!21749 () Bool)

(assert (=> (not b_lambda!21749) (not b!1213407)))

(declare-fun t!39701 () Bool)

(declare-fun tb!10873 () Bool)

(assert (=> (and start!101150 (= defaultEntry!1004 defaultEntry!1004) t!39701) tb!10873))

(declare-fun result!22343 () Bool)

(assert (=> tb!10873 (= result!22343 tp_is_empty!30777)))

(assert (=> b!1213407 t!39701))

(declare-fun b_and!43265 () Bool)

(assert (= b_and!43263 (and (=> t!39701 result!22343) b_and!43265)))

(declare-fun m!1118699 () Bool)

(assert (=> b!1213407 m!1118699))

(declare-fun m!1118701 () Bool)

(assert (=> b!1213407 m!1118701))

(declare-fun m!1118703 () Bool)

(assert (=> b!1213407 m!1118703))

(declare-fun m!1118705 () Bool)

(assert (=> b!1213407 m!1118705))

(declare-fun m!1118707 () Bool)

(assert (=> b!1213393 m!1118707))

(declare-fun m!1118709 () Bool)

(assert (=> b!1213398 m!1118709))

(declare-fun m!1118711 () Bool)

(assert (=> b!1213402 m!1118711))

(declare-fun m!1118713 () Bool)

(assert (=> b!1213402 m!1118713))

(declare-fun m!1118715 () Bool)

(assert (=> bm!60362 m!1118715))

(declare-fun m!1118717 () Bool)

(assert (=> b!1213413 m!1118717))

(declare-fun m!1118719 () Bool)

(assert (=> b!1213413 m!1118719))

(declare-fun m!1118721 () Bool)

(assert (=> b!1213413 m!1118721))

(declare-fun m!1118723 () Bool)

(assert (=> b!1213405 m!1118723))

(declare-fun m!1118725 () Bool)

(assert (=> bm!60363 m!1118725))

(assert (=> b!1213404 m!1118723))

(declare-fun m!1118727 () Bool)

(assert (=> b!1213411 m!1118727))

(declare-fun m!1118729 () Bool)

(assert (=> mapNonEmpty!48040 m!1118729))

(declare-fun m!1118731 () Bool)

(assert (=> b!1213390 m!1118731))

(declare-fun m!1118733 () Bool)

(assert (=> b!1213409 m!1118733))

(declare-fun m!1118735 () Bool)

(assert (=> b!1213409 m!1118735))

(declare-fun m!1118737 () Bool)

(assert (=> b!1213409 m!1118737))

(declare-fun m!1118739 () Bool)

(assert (=> b!1213409 m!1118739))

(declare-fun m!1118741 () Bool)

(assert (=> bm!60359 m!1118741))

(declare-fun m!1118743 () Bool)

(assert (=> b!1213392 m!1118743))

(declare-fun m!1118745 () Bool)

(assert (=> b!1213410 m!1118745))

(declare-fun m!1118747 () Bool)

(assert (=> b!1213410 m!1118747))

(declare-fun m!1118749 () Bool)

(assert (=> bm!60356 m!1118749))

(assert (=> b!1213403 m!1118741))

(declare-fun m!1118751 () Bool)

(assert (=> b!1213389 m!1118751))

(declare-fun m!1118753 () Bool)

(assert (=> bm!60361 m!1118753))

(declare-fun m!1118755 () Bool)

(assert (=> b!1213408 m!1118755))

(declare-fun m!1118757 () Bool)

(assert (=> b!1213406 m!1118757))

(declare-fun m!1118759 () Bool)

(assert (=> b!1213406 m!1118759))

(declare-fun m!1118761 () Bool)

(assert (=> b!1213406 m!1118761))

(assert (=> b!1213406 m!1118711))

(declare-fun m!1118763 () Bool)

(assert (=> b!1213406 m!1118763))

(assert (=> b!1213406 m!1118757))

(declare-fun m!1118765 () Bool)

(assert (=> b!1213406 m!1118765))

(declare-fun m!1118767 () Bool)

(assert (=> b!1213406 m!1118767))

(assert (=> b!1213406 m!1118711))

(assert (=> b!1213406 m!1118759))

(assert (=> b!1213406 m!1118711))

(declare-fun m!1118769 () Bool)

(assert (=> b!1213406 m!1118769))

(assert (=> b!1213406 m!1118749))

(declare-fun m!1118771 () Bool)

(assert (=> b!1213399 m!1118771))

(declare-fun m!1118773 () Bool)

(assert (=> b!1213399 m!1118773))

(declare-fun m!1118775 () Bool)

(assert (=> start!101150 m!1118775))

(declare-fun m!1118777 () Bool)

(assert (=> start!101150 m!1118777))

(check-sat (not b!1213413) (not b!1213409) (not b!1213411) (not bm!60361) (not b!1213403) (not b!1213402) (not b!1213393) (not b!1213410) (not bm!60362) (not b_lambda!21749) b_and!43265 (not bm!60363) (not b!1213406) (not b!1213404) (not b!1213389) (not b_next!26073) (not bm!60356) (not b!1213405) (not mapNonEmpty!48040) (not start!101150) (not bm!60359) (not b!1213398) tp_is_empty!30777 (not b!1213399) (not b!1213407) (not b!1213390) (not b!1213408))
(check-sat b_and!43265 (not b_next!26073))
