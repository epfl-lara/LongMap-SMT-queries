; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101304 () Bool)

(assert start!101304)

(declare-fun b_free!26029 () Bool)

(declare-fun b_next!26029 () Bool)

(assert (=> start!101304 (= b_free!26029 (not b_next!26029))))

(declare-fun tp!91106 () Bool)

(declare-fun b_and!43159 () Bool)

(assert (=> start!101304 (= tp!91106 b_and!43159)))

(declare-fun b!1212480 () Bool)

(declare-fun e!688697 () Bool)

(declare-fun e!688699 () Bool)

(assert (=> b!1212480 (= e!688697 (not e!688699))))

(declare-fun res!805167 () Bool)

(assert (=> b!1212480 (=> res!805167 e!688699)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212480 (= res!805167 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78285 0))(
  ( (array!78286 (arr!37772 (Array (_ BitVec 32) (_ BitVec 64))) (size!38309 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78285)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212480 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40109 0))(
  ( (Unit!40110) )
))
(declare-fun lt!550569 () Unit!40109)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78285 (_ BitVec 64) (_ BitVec 32)) Unit!40109)

(assert (=> b!1212480 (= lt!550569 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59872 () Bool)

(declare-datatypes ((V!46105 0))(
  ( (V!46106 (val!15423 Int)) )
))
(declare-datatypes ((tuple2!19824 0))(
  ( (tuple2!19825 (_1!9923 (_ BitVec 64)) (_2!9923 V!46105)) )
))
(declare-datatypes ((List!26628 0))(
  ( (Nil!26625) (Cons!26624 (h!27842 tuple2!19824) (t!39629 List!26628)) )
))
(declare-datatypes ((ListLongMap!17801 0))(
  ( (ListLongMap!17802 (toList!8916 List!26628)) )
))
(declare-fun call!59882 () ListLongMap!17801)

(declare-fun c!119818 () Bool)

(declare-fun call!59876 () Bool)

(declare-fun lt!550557 () ListLongMap!17801)

(declare-fun contains!7010 (ListLongMap!17801 (_ BitVec 64)) Bool)

(assert (=> bm!59872 (= call!59876 (contains!7010 (ite c!119818 lt!550557 call!59882) k0!934))))

(declare-fun b!1212481 () Bool)

(declare-fun res!805165 () Bool)

(declare-fun e!688701 () Bool)

(assert (=> b!1212481 (=> (not res!805165) (not e!688701))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14657 0))(
  ( (ValueCellFull!14657 (v!18071 V!46105)) (EmptyCell!14657) )
))
(declare-datatypes ((array!78287 0))(
  ( (array!78288 (arr!37773 (Array (_ BitVec 32) ValueCell!14657)) (size!38310 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78287)

(assert (=> b!1212481 (= res!805165 (and (= (size!38310 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38309 _keys!1208) (size!38310 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!688700 () Bool)

(declare-fun b!1212482 () Bool)

(assert (=> b!1212482 (= e!688700 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59873 () Bool)

(declare-fun call!59878 () Unit!40109)

(declare-fun call!59875 () Unit!40109)

(assert (=> bm!59873 (= call!59878 call!59875)))

(declare-fun b!1212483 () Bool)

(declare-fun e!688706 () Bool)

(assert (=> b!1212483 (= e!688699 e!688706)))

(declare-fun res!805168 () Bool)

(assert (=> b!1212483 (=> res!805168 e!688706)))

(assert (=> b!1212483 (= res!805168 (not (= from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!550567 () array!78285)

(declare-fun lt!550564 () array!78287)

(declare-fun minValue!944 () V!46105)

(declare-fun lt!550556 () ListLongMap!17801)

(declare-fun zeroValue!944 () V!46105)

(declare-fun getCurrentListMapNoExtraKeys!5375 (array!78285 array!78287 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 32) Int) ListLongMap!17801)

(assert (=> b!1212483 (= lt!550556 (getCurrentListMapNoExtraKeys!5375 lt!550567 lt!550564 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550568 () V!46105)

(assert (=> b!1212483 (= lt!550564 (array!78288 (store (arr!37773 _values!996) i!673 (ValueCellFull!14657 lt!550568)) (size!38310 _values!996)))))

(declare-fun dynLambda!3292 (Int (_ BitVec 64)) V!46105)

(assert (=> b!1212483 (= lt!550568 (dynLambda!3292 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550563 () ListLongMap!17801)

(assert (=> b!1212483 (= lt!550563 (getCurrentListMapNoExtraKeys!5375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!805163 () Bool)

(assert (=> start!101304 (=> (not res!805163) (not e!688701))))

(assert (=> start!101304 (= res!805163 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38309 _keys!1208))))))

(assert (=> start!101304 e!688701))

(declare-fun tp_is_empty!30733 () Bool)

(assert (=> start!101304 tp_is_empty!30733))

(declare-fun array_inv!28834 (array!78285) Bool)

(assert (=> start!101304 (array_inv!28834 _keys!1208)))

(assert (=> start!101304 true))

(assert (=> start!101304 tp!91106))

(declare-fun e!688703 () Bool)

(declare-fun array_inv!28835 (array!78287) Bool)

(assert (=> start!101304 (and (array_inv!28835 _values!996) e!688703)))

(declare-fun mapIsEmpty!47971 () Bool)

(declare-fun mapRes!47971 () Bool)

(assert (=> mapIsEmpty!47971 mapRes!47971))

(declare-fun b!1212484 () Bool)

(declare-fun lt!550558 () Bool)

(assert (=> b!1212484 (= e!688700 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550558) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212485 () Bool)

(declare-fun e!688696 () Unit!40109)

(declare-fun lt!550555 () Unit!40109)

(assert (=> b!1212485 (= e!688696 lt!550555)))

(assert (=> b!1212485 (= lt!550555 call!59878)))

(declare-fun call!59877 () Bool)

(assert (=> b!1212485 call!59877))

(declare-fun e!688702 () Bool)

(declare-fun b!1212486 () Bool)

(declare-fun call!59880 () ListLongMap!17801)

(declare-fun call!59881 () ListLongMap!17801)

(declare-fun -!1845 (ListLongMap!17801 (_ BitVec 64)) ListLongMap!17801)

(assert (=> b!1212486 (= e!688702 (= call!59880 (-!1845 call!59881 k0!934)))))

(declare-fun b!1212487 () Bool)

(declare-fun e!688705 () Bool)

(assert (=> b!1212487 (= e!688705 tp_is_empty!30733)))

(declare-fun bm!59874 () Bool)

(declare-fun call!59879 () ListLongMap!17801)

(assert (=> bm!59874 (= call!59882 call!59879)))

(declare-fun b!1212488 () Bool)

(declare-fun e!688691 () Unit!40109)

(declare-fun Unit!40111 () Unit!40109)

(assert (=> b!1212488 (= e!688691 Unit!40111)))

(assert (=> b!1212488 (= lt!550558 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212488 (= c!119818 (and (not lt!550558) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550566 () Unit!40109)

(declare-fun e!688698 () Unit!40109)

(assert (=> b!1212488 (= lt!550566 e!688698)))

(declare-fun lt!550565 () Unit!40109)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!607 (array!78285 array!78287 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 64) (_ BitVec 32) Int) Unit!40109)

(assert (=> b!1212488 (= lt!550565 (lemmaListMapContainsThenArrayContainsFrom!607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119822 () Bool)

(assert (=> b!1212488 (= c!119822 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805166 () Bool)

(assert (=> b!1212488 (= res!805166 e!688700)))

(declare-fun e!688704 () Bool)

(assert (=> b!1212488 (=> (not res!805166) (not e!688704))))

(assert (=> b!1212488 e!688704))

(declare-fun lt!550573 () Unit!40109)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78285 (_ BitVec 32) (_ BitVec 32)) Unit!40109)

(assert (=> b!1212488 (= lt!550573 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26629 0))(
  ( (Nil!26626) (Cons!26625 (h!27843 (_ BitVec 64)) (t!39630 List!26629)) )
))
(declare-fun arrayNoDuplicates!0 (array!78285 (_ BitVec 32) List!26629) Bool)

(assert (=> b!1212488 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26626)))

(declare-fun lt!550570 () Unit!40109)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78285 (_ BitVec 64) (_ BitVec 32) List!26629) Unit!40109)

(assert (=> b!1212488 (= lt!550570 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26626))))

(assert (=> b!1212488 false))

(declare-fun b!1212489 () Bool)

(declare-fun res!805175 () Bool)

(assert (=> b!1212489 (=> (not res!805175) (not e!688701))))

(assert (=> b!1212489 (= res!805175 (= (select (arr!37772 _keys!1208) i!673) k0!934))))

(declare-fun bm!59875 () Bool)

(assert (=> bm!59875 (= call!59881 (getCurrentListMapNoExtraKeys!5375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!550554 () ListLongMap!17801)

(declare-fun c!119819 () Bool)

(declare-fun bm!59876 () Bool)

(declare-fun +!4076 (ListLongMap!17801 tuple2!19824) ListLongMap!17801)

(assert (=> bm!59876 (= call!59879 (+!4076 lt!550554 (ite (or c!119818 c!119819) (tuple2!19825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19825 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1212490 () Bool)

(declare-fun res!805173 () Bool)

(assert (=> b!1212490 (=> (not res!805173) (not e!688701))))

(assert (=> b!1212490 (= res!805173 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26626))))

(declare-fun b!1212491 () Bool)

(declare-fun res!805169 () Bool)

(assert (=> b!1212491 (=> (not res!805169) (not e!688701))))

(assert (=> b!1212491 (= res!805169 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38309 _keys!1208))))))

(declare-fun b!1212492 () Bool)

(declare-fun e!688692 () Bool)

(assert (=> b!1212492 (= e!688692 true)))

(declare-fun e!688707 () Bool)

(assert (=> b!1212492 e!688707))

(declare-fun res!805171 () Bool)

(assert (=> b!1212492 (=> (not res!805171) (not e!688707))))

(declare-fun lt!550560 () V!46105)

(assert (=> b!1212492 (= res!805171 (= (-!1845 (+!4076 lt!550554 (tuple2!19825 (select (arr!37772 _keys!1208) from!1455) lt!550560)) (select (arr!37772 _keys!1208) from!1455)) lt!550554))))

(declare-fun lt!550559 () Unit!40109)

(declare-fun addThenRemoveForNewKeyIsSame!274 (ListLongMap!17801 (_ BitVec 64) V!46105) Unit!40109)

(assert (=> b!1212492 (= lt!550559 (addThenRemoveForNewKeyIsSame!274 lt!550554 (select (arr!37772 _keys!1208) from!1455) lt!550560))))

(declare-fun get!19295 (ValueCell!14657 V!46105) V!46105)

(assert (=> b!1212492 (= lt!550560 (get!19295 (select (arr!37773 _values!996) from!1455) lt!550568))))

(declare-fun lt!550561 () Unit!40109)

(assert (=> b!1212492 (= lt!550561 e!688691)))

(declare-fun c!119820 () Bool)

(assert (=> b!1212492 (= c!119820 (contains!7010 lt!550554 k0!934))))

(assert (=> b!1212492 (= lt!550554 (getCurrentListMapNoExtraKeys!5375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212493 () Bool)

(assert (=> b!1212493 (= e!688706 e!688692)))

(declare-fun res!805162 () Bool)

(assert (=> b!1212493 (=> res!805162 e!688692)))

(assert (=> b!1212493 (= res!805162 (not (= (select (arr!37772 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212493 e!688702))

(declare-fun c!119821 () Bool)

(assert (=> b!1212493 (= c!119821 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550571 () Unit!40109)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1059 (array!78285 array!78287 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40109)

(assert (=> b!1212493 (= lt!550571 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1059 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212494 () Bool)

(declare-fun res!805170 () Bool)

(assert (=> b!1212494 (=> (not res!805170) (not e!688697))))

(assert (=> b!1212494 (= res!805170 (arrayNoDuplicates!0 lt!550567 #b00000000000000000000000000000000 Nil!26626))))

(declare-fun bm!59877 () Bool)

(assert (=> bm!59877 (= call!59877 call!59876)))

(declare-fun b!1212495 () Bool)

(assert (=> b!1212495 (= c!119819 (and (not lt!550558) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212495 (= e!688698 e!688696)))

(declare-fun b!1212496 () Bool)

(declare-fun e!688695 () Unit!40109)

(assert (=> b!1212496 (= e!688696 e!688695)))

(declare-fun c!119823 () Bool)

(assert (=> b!1212496 (= c!119823 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550558))))

(declare-fun b!1212497 () Bool)

(declare-fun res!805164 () Bool)

(assert (=> b!1212497 (=> (not res!805164) (not e!688701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212497 (= res!805164 (validMask!0 mask!1564))))

(declare-fun b!1212498 () Bool)

(assert (=> b!1212498 call!59877))

(declare-fun lt!550562 () Unit!40109)

(assert (=> b!1212498 (= lt!550562 call!59878)))

(assert (=> b!1212498 (= e!688695 lt!550562)))

(declare-fun b!1212499 () Bool)

(assert (=> b!1212499 (contains!7010 (+!4076 lt!550557 (tuple2!19825 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550574 () Unit!40109)

(assert (=> b!1212499 (= lt!550574 call!59875)))

(assert (=> b!1212499 call!59876))

(assert (=> b!1212499 (= lt!550557 call!59879)))

(declare-fun lt!550572 () Unit!40109)

(declare-fun addStillContains!1059 (ListLongMap!17801 (_ BitVec 64) V!46105 (_ BitVec 64)) Unit!40109)

(assert (=> b!1212499 (= lt!550572 (addStillContains!1059 lt!550554 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1212499 (= e!688698 lt!550574)))

(declare-fun b!1212500 () Bool)

(declare-fun Unit!40112 () Unit!40109)

(assert (=> b!1212500 (= e!688695 Unit!40112)))

(declare-fun b!1212501 () Bool)

(declare-fun res!805172 () Bool)

(assert (=> b!1212501 (=> (not res!805172) (not e!688701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78285 (_ BitVec 32)) Bool)

(assert (=> b!1212501 (= res!805172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212502 () Bool)

(declare-fun res!805176 () Bool)

(assert (=> b!1212502 (=> (not res!805176) (not e!688701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212502 (= res!805176 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47971 () Bool)

(declare-fun tp!91105 () Bool)

(assert (=> mapNonEmpty!47971 (= mapRes!47971 (and tp!91105 e!688705))))

(declare-fun mapValue!47971 () ValueCell!14657)

(declare-fun mapKey!47971 () (_ BitVec 32))

(declare-fun mapRest!47971 () (Array (_ BitVec 32) ValueCell!14657))

(assert (=> mapNonEmpty!47971 (= (arr!37773 _values!996) (store mapRest!47971 mapKey!47971 mapValue!47971))))

(declare-fun bm!59878 () Bool)

(assert (=> bm!59878 (= call!59880 (getCurrentListMapNoExtraKeys!5375 lt!550567 lt!550564 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212503 () Bool)

(assert (=> b!1212503 (= e!688707 (= (-!1845 lt!550563 k0!934) lt!550554))))

(declare-fun b!1212504 () Bool)

(declare-fun e!688693 () Bool)

(assert (=> b!1212504 (= e!688693 tp_is_empty!30733)))

(declare-fun b!1212505 () Bool)

(assert (=> b!1212505 (= e!688704 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212506 () Bool)

(declare-fun Unit!40113 () Unit!40109)

(assert (=> b!1212506 (= e!688691 Unit!40113)))

(declare-fun b!1212507 () Bool)

(assert (=> b!1212507 (= e!688702 (= call!59880 call!59881))))

(declare-fun b!1212508 () Bool)

(assert (=> b!1212508 (= e!688701 e!688697)))

(declare-fun res!805174 () Bool)

(assert (=> b!1212508 (=> (not res!805174) (not e!688697))))

(assert (=> b!1212508 (= res!805174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550567 mask!1564))))

(assert (=> b!1212508 (= lt!550567 (array!78286 (store (arr!37772 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38309 _keys!1208)))))

(declare-fun b!1212509 () Bool)

(assert (=> b!1212509 (= e!688703 (and e!688693 mapRes!47971))))

(declare-fun condMapEmpty!47971 () Bool)

(declare-fun mapDefault!47971 () ValueCell!14657)

(assert (=> b!1212509 (= condMapEmpty!47971 (= (arr!37773 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14657)) mapDefault!47971)))))

(declare-fun bm!59879 () Bool)

(assert (=> bm!59879 (= call!59875 (addStillContains!1059 (ite c!119818 lt!550557 lt!550554) (ite c!119818 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119819 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119818 minValue!944 (ite c!119819 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!101304 res!805163) b!1212497))

(assert (= (and b!1212497 res!805164) b!1212481))

(assert (= (and b!1212481 res!805165) b!1212501))

(assert (= (and b!1212501 res!805172) b!1212490))

(assert (= (and b!1212490 res!805173) b!1212491))

(assert (= (and b!1212491 res!805169) b!1212502))

(assert (= (and b!1212502 res!805176) b!1212489))

(assert (= (and b!1212489 res!805175) b!1212508))

(assert (= (and b!1212508 res!805174) b!1212494))

(assert (= (and b!1212494 res!805170) b!1212480))

(assert (= (and b!1212480 (not res!805167)) b!1212483))

(assert (= (and b!1212483 (not res!805168)) b!1212493))

(assert (= (and b!1212493 c!119821) b!1212486))

(assert (= (and b!1212493 (not c!119821)) b!1212507))

(assert (= (or b!1212486 b!1212507) bm!59878))

(assert (= (or b!1212486 b!1212507) bm!59875))

(assert (= (and b!1212493 (not res!805162)) b!1212492))

(assert (= (and b!1212492 c!119820) b!1212488))

(assert (= (and b!1212492 (not c!119820)) b!1212506))

(assert (= (and b!1212488 c!119818) b!1212499))

(assert (= (and b!1212488 (not c!119818)) b!1212495))

(assert (= (and b!1212495 c!119819) b!1212485))

(assert (= (and b!1212495 (not c!119819)) b!1212496))

(assert (= (and b!1212496 c!119823) b!1212498))

(assert (= (and b!1212496 (not c!119823)) b!1212500))

(assert (= (or b!1212485 b!1212498) bm!59873))

(assert (= (or b!1212485 b!1212498) bm!59874))

(assert (= (or b!1212485 b!1212498) bm!59877))

(assert (= (or b!1212499 bm!59877) bm!59872))

(assert (= (or b!1212499 bm!59873) bm!59879))

(assert (= (or b!1212499 bm!59874) bm!59876))

(assert (= (and b!1212488 c!119822) b!1212482))

(assert (= (and b!1212488 (not c!119822)) b!1212484))

(assert (= (and b!1212488 res!805166) b!1212505))

(assert (= (and b!1212492 res!805171) b!1212503))

(assert (= (and b!1212509 condMapEmpty!47971) mapIsEmpty!47971))

(assert (= (and b!1212509 (not condMapEmpty!47971)) mapNonEmpty!47971))

(get-info :version)

(assert (= (and mapNonEmpty!47971 ((_ is ValueCellFull!14657) mapValue!47971)) b!1212487))

(assert (= (and b!1212509 ((_ is ValueCellFull!14657) mapDefault!47971)) b!1212504))

(assert (= start!101304 b!1212509))

(declare-fun b_lambda!21661 () Bool)

(assert (=> (not b_lambda!21661) (not b!1212483)))

(declare-fun t!39628 () Bool)

(declare-fun tb!10821 () Bool)

(assert (=> (and start!101304 (= defaultEntry!1004 defaultEntry!1004) t!39628) tb!10821))

(declare-fun result!22245 () Bool)

(assert (=> tb!10821 (= result!22245 tp_is_empty!30733)))

(assert (=> b!1212483 t!39628))

(declare-fun b_and!43161 () Bool)

(assert (= b_and!43159 (and (=> t!39628 result!22245) b_and!43161)))

(declare-fun m!1118259 () Bool)

(assert (=> bm!59878 m!1118259))

(declare-fun m!1118261 () Bool)

(assert (=> b!1212492 m!1118261))

(declare-fun m!1118263 () Bool)

(assert (=> b!1212492 m!1118263))

(declare-fun m!1118265 () Bool)

(assert (=> b!1212492 m!1118265))

(declare-fun m!1118267 () Bool)

(assert (=> b!1212492 m!1118267))

(declare-fun m!1118269 () Bool)

(assert (=> b!1212492 m!1118269))

(assert (=> b!1212492 m!1118263))

(declare-fun m!1118271 () Bool)

(assert (=> b!1212492 m!1118271))

(assert (=> b!1212492 m!1118265))

(assert (=> b!1212492 m!1118267))

(declare-fun m!1118273 () Bool)

(assert (=> b!1212492 m!1118273))

(declare-fun m!1118275 () Bool)

(assert (=> b!1212492 m!1118275))

(assert (=> b!1212492 m!1118267))

(declare-fun m!1118277 () Bool)

(assert (=> bm!59879 m!1118277))

(declare-fun m!1118279 () Bool)

(assert (=> b!1212497 m!1118279))

(declare-fun m!1118281 () Bool)

(assert (=> b!1212503 m!1118281))

(declare-fun m!1118283 () Bool)

(assert (=> b!1212488 m!1118283))

(declare-fun m!1118285 () Bool)

(assert (=> b!1212488 m!1118285))

(declare-fun m!1118287 () Bool)

(assert (=> b!1212488 m!1118287))

(declare-fun m!1118289 () Bool)

(assert (=> b!1212488 m!1118289))

(declare-fun m!1118291 () Bool)

(assert (=> bm!59876 m!1118291))

(declare-fun m!1118293 () Bool)

(assert (=> b!1212502 m!1118293))

(declare-fun m!1118295 () Bool)

(assert (=> b!1212482 m!1118295))

(declare-fun m!1118297 () Bool)

(assert (=> mapNonEmpty!47971 m!1118297))

(declare-fun m!1118299 () Bool)

(assert (=> b!1212490 m!1118299))

(assert (=> b!1212493 m!1118267))

(declare-fun m!1118301 () Bool)

(assert (=> b!1212493 m!1118301))

(assert (=> bm!59875 m!1118261))

(declare-fun m!1118303 () Bool)

(assert (=> b!1212489 m!1118303))

(declare-fun m!1118305 () Bool)

(assert (=> b!1212480 m!1118305))

(declare-fun m!1118307 () Bool)

(assert (=> b!1212480 m!1118307))

(assert (=> b!1212505 m!1118295))

(declare-fun m!1118309 () Bool)

(assert (=> b!1212508 m!1118309))

(declare-fun m!1118311 () Bool)

(assert (=> b!1212508 m!1118311))

(declare-fun m!1118313 () Bool)

(assert (=> start!101304 m!1118313))

(declare-fun m!1118315 () Bool)

(assert (=> start!101304 m!1118315))

(declare-fun m!1118317 () Bool)

(assert (=> b!1212486 m!1118317))

(declare-fun m!1118319 () Bool)

(assert (=> b!1212483 m!1118319))

(declare-fun m!1118321 () Bool)

(assert (=> b!1212483 m!1118321))

(declare-fun m!1118323 () Bool)

(assert (=> b!1212483 m!1118323))

(declare-fun m!1118325 () Bool)

(assert (=> b!1212483 m!1118325))

(declare-fun m!1118327 () Bool)

(assert (=> bm!59872 m!1118327))

(declare-fun m!1118329 () Bool)

(assert (=> b!1212494 m!1118329))

(declare-fun m!1118331 () Bool)

(assert (=> b!1212499 m!1118331))

(assert (=> b!1212499 m!1118331))

(declare-fun m!1118333 () Bool)

(assert (=> b!1212499 m!1118333))

(declare-fun m!1118335 () Bool)

(assert (=> b!1212499 m!1118335))

(declare-fun m!1118337 () Bool)

(assert (=> b!1212501 m!1118337))

(check-sat (not b!1212492) (not b_lambda!21661) (not b!1212480) (not b!1212501) (not mapNonEmpty!47971) (not bm!59876) (not b!1212505) (not bm!59879) tp_is_empty!30733 (not b!1212482) (not b!1212483) b_and!43161 (not b!1212499) (not b!1212488) (not bm!59872) (not b!1212497) (not b!1212508) (not bm!59875) (not bm!59878) (not b!1212503) (not b_next!26029) (not b!1212490) (not b!1212486) (not b!1212502) (not b!1212493) (not start!101304) (not b!1212494))
(check-sat b_and!43161 (not b_next!26029))
