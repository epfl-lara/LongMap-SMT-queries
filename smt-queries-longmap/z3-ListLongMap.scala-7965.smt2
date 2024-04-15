; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98624 () Bool)

(assert start!98624)

(declare-fun b_free!24235 () Bool)

(declare-fun b_next!24235 () Bool)

(assert (=> start!98624 (= b_free!24235 (not b_next!24235))))

(declare-fun tp!85416 () Bool)

(declare-fun b_and!39297 () Bool)

(assert (=> start!98624 (= tp!85416 b_and!39297)))

(declare-fun b!1145698 () Bool)

(declare-fun e!651704 () Bool)

(declare-fun e!651703 () Bool)

(assert (=> b!1145698 (= e!651704 (not e!651703))))

(declare-fun res!762892 () Bool)

(assert (=> b!1145698 (=> res!762892 e!651703)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145698 (= res!762892 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74302 0))(
  ( (array!74303 (arr!35802 (Array (_ BitVec 32) (_ BitVec 64))) (size!36340 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74302)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145698 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37477 0))(
  ( (Unit!37478) )
))
(declare-fun lt!511415 () Unit!37477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74302 (_ BitVec 64) (_ BitVec 32)) Unit!37477)

(assert (=> b!1145698 (= lt!511415 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!43481 0))(
  ( (V!43482 (val!14439 Int)) )
))
(declare-datatypes ((tuple2!18380 0))(
  ( (tuple2!18381 (_1!9201 (_ BitVec 64)) (_2!9201 V!43481)) )
))
(declare-datatypes ((List!25116 0))(
  ( (Nil!25113) (Cons!25112 (h!26321 tuple2!18380) (t!36334 List!25116)) )
))
(declare-datatypes ((ListLongMap!16349 0))(
  ( (ListLongMap!16350 (toList!8190 List!25116)) )
))
(declare-fun lt!511412 () ListLongMap!16349)

(declare-fun minValue!944 () V!43481)

(declare-fun c!112947 () Bool)

(declare-fun zeroValue!944 () V!43481)

(declare-fun lt!511404 () ListLongMap!16349)

(declare-fun call!52341 () ListLongMap!16349)

(declare-fun bm!52336 () Bool)

(declare-fun c!112951 () Bool)

(declare-fun +!3610 (ListLongMap!16349 tuple2!18380) ListLongMap!16349)

(assert (=> bm!52336 (= call!52341 (+!3610 (ite c!112947 lt!511412 lt!511404) (ite c!112947 (tuple2!18381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112951 (tuple2!18381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!762893 () Bool)

(declare-fun e!651712 () Bool)

(assert (=> start!98624 (=> (not res!762893) (not e!651712))))

(assert (=> start!98624 (= res!762893 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36340 _keys!1208))))))

(assert (=> start!98624 e!651712))

(declare-fun tp_is_empty!28765 () Bool)

(assert (=> start!98624 tp_is_empty!28765))

(declare-fun array_inv!27514 (array!74302) Bool)

(assert (=> start!98624 (array_inv!27514 _keys!1208)))

(assert (=> start!98624 true))

(assert (=> start!98624 tp!85416))

(declare-datatypes ((ValueCell!13673 0))(
  ( (ValueCellFull!13673 (v!17075 V!43481)) (EmptyCell!13673) )
))
(declare-datatypes ((array!74304 0))(
  ( (array!74305 (arr!35803 (Array (_ BitVec 32) ValueCell!13673)) (size!36341 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74304)

(declare-fun e!651700 () Bool)

(declare-fun array_inv!27515 (array!74304) Bool)

(assert (=> start!98624 (and (array_inv!27515 _values!996) e!651700)))

(declare-fun bm!52337 () Bool)

(declare-fun call!52342 () Unit!37477)

(declare-fun call!52343 () Unit!37477)

(assert (=> bm!52337 (= call!52342 call!52343)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!651702 () Bool)

(declare-fun lt!511407 () Bool)

(declare-fun b!1145699 () Bool)

(assert (=> b!1145699 (= e!651702 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511407) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145700 () Bool)

(declare-fun e!651701 () Unit!37477)

(declare-fun Unit!37479 () Unit!37477)

(assert (=> b!1145700 (= e!651701 Unit!37479)))

(declare-fun b!1145701 () Bool)

(declare-fun e!651714 () Unit!37477)

(declare-fun Unit!37480 () Unit!37477)

(assert (=> b!1145701 (= e!651714 Unit!37480)))

(declare-fun b!1145702 () Bool)

(declare-fun Unit!37481 () Unit!37477)

(assert (=> b!1145702 (= e!651701 Unit!37481)))

(assert (=> b!1145702 (= lt!511407 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145702 (= c!112947 (and (not lt!511407) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511420 () Unit!37477)

(declare-fun e!651705 () Unit!37477)

(assert (=> b!1145702 (= lt!511420 e!651705)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!511422 () Unit!37477)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!420 (array!74302 array!74304 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 64) (_ BitVec 32) Int) Unit!37477)

(assert (=> b!1145702 (= lt!511422 (lemmaListMapContainsThenArrayContainsFrom!420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112949 () Bool)

(assert (=> b!1145702 (= c!112949 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762900 () Bool)

(assert (=> b!1145702 (= res!762900 e!651702)))

(declare-fun e!651709 () Bool)

(assert (=> b!1145702 (=> (not res!762900) (not e!651709))))

(assert (=> b!1145702 e!651709))

(declare-fun lt!511410 () Unit!37477)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74302 (_ BitVec 32) (_ BitVec 32)) Unit!37477)

(assert (=> b!1145702 (= lt!511410 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25117 0))(
  ( (Nil!25114) (Cons!25113 (h!26322 (_ BitVec 64)) (t!36335 List!25117)) )
))
(declare-fun arrayNoDuplicates!0 (array!74302 (_ BitVec 32) List!25117) Bool)

(assert (=> b!1145702 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25114)))

(declare-fun lt!511411 () Unit!37477)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74302 (_ BitVec 64) (_ BitVec 32) List!25117) Unit!37477)

(assert (=> b!1145702 (= lt!511411 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25114))))

(assert (=> b!1145702 false))

(declare-fun b!1145703 () Bool)

(assert (=> b!1145703 (= c!112951 (and (not lt!511407) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651713 () Unit!37477)

(assert (=> b!1145703 (= e!651705 e!651713)))

(declare-fun call!52345 () Bool)

(declare-fun call!52346 () ListLongMap!16349)

(declare-fun bm!52338 () Bool)

(declare-fun contains!6654 (ListLongMap!16349 (_ BitVec 64)) Bool)

(assert (=> bm!52338 (= call!52345 (contains!6654 (ite c!112947 lt!511412 call!52346) k0!934))))

(declare-fun bm!52339 () Bool)

(declare-fun addStillContains!823 (ListLongMap!16349 (_ BitVec 64) V!43481 (_ BitVec 64)) Unit!37477)

(assert (=> bm!52339 (= call!52343 (addStillContains!823 (ite c!112947 lt!511412 lt!511404) (ite c!112947 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112951 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112947 minValue!944 (ite c!112951 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1145704 () Bool)

(assert (=> b!1145704 (contains!6654 call!52341 k0!934)))

(declare-fun lt!511406 () Unit!37477)

(assert (=> b!1145704 (= lt!511406 call!52343)))

(assert (=> b!1145704 call!52345))

(assert (=> b!1145704 (= lt!511412 (+!3610 lt!511404 (tuple2!18381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511402 () Unit!37477)

(assert (=> b!1145704 (= lt!511402 (addStillContains!823 lt!511404 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1145704 (= e!651705 lt!511406)))

(declare-fun mapIsEmpty!44972 () Bool)

(declare-fun mapRes!44972 () Bool)

(assert (=> mapIsEmpty!44972 mapRes!44972))

(declare-fun b!1145705 () Bool)

(declare-fun call!52340 () Bool)

(assert (=> b!1145705 call!52340))

(declare-fun lt!511418 () Unit!37477)

(assert (=> b!1145705 (= lt!511418 call!52342)))

(assert (=> b!1145705 (= e!651714 lt!511418)))

(declare-fun b!1145706 () Bool)

(declare-fun e!651699 () Bool)

(assert (=> b!1145706 (= e!651699 tp_is_empty!28765)))

(declare-fun b!1145707 () Bool)

(declare-fun res!762896 () Bool)

(assert (=> b!1145707 (=> (not res!762896) (not e!651712))))

(assert (=> b!1145707 (= res!762896 (= (select (arr!35802 _keys!1208) i!673) k0!934))))

(declare-fun bm!52340 () Bool)

(assert (=> bm!52340 (= call!52340 call!52345)))

(declare-fun b!1145708 () Bool)

(declare-fun res!762899 () Bool)

(assert (=> b!1145708 (=> (not res!762899) (not e!651712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145708 (= res!762899 (validMask!0 mask!1564))))

(declare-fun b!1145709 () Bool)

(declare-fun res!762894 () Bool)

(assert (=> b!1145709 (=> (not res!762894) (not e!651712))))

(assert (=> b!1145709 (= res!762894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36340 _keys!1208))))))

(declare-fun b!1145710 () Bool)

(declare-fun e!651708 () Bool)

(declare-fun call!52344 () ListLongMap!16349)

(declare-fun call!52339 () ListLongMap!16349)

(assert (=> b!1145710 (= e!651708 (= call!52344 call!52339))))

(declare-fun b!1145711 () Bool)

(declare-fun res!762895 () Bool)

(assert (=> b!1145711 (=> (not res!762895) (not e!651712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145711 (= res!762895 (validKeyInArray!0 k0!934))))

(declare-fun b!1145712 () Bool)

(declare-fun res!762889 () Bool)

(assert (=> b!1145712 (=> (not res!762889) (not e!651712))))

(assert (=> b!1145712 (= res!762889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25114))))

(declare-fun b!1145713 () Bool)

(declare-fun e!651707 () Bool)

(assert (=> b!1145713 (= e!651700 (and e!651707 mapRes!44972))))

(declare-fun condMapEmpty!44972 () Bool)

(declare-fun mapDefault!44972 () ValueCell!13673)

(assert (=> b!1145713 (= condMapEmpty!44972 (= (arr!35803 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13673)) mapDefault!44972)))))

(declare-fun lt!511405 () array!74304)

(declare-fun bm!52341 () Bool)

(declare-fun lt!511416 () array!74302)

(declare-fun getCurrentListMapNoExtraKeys!4676 (array!74302 array!74304 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 32) Int) ListLongMap!16349)

(assert (=> bm!52341 (= call!52344 (getCurrentListMapNoExtraKeys!4676 lt!511416 lt!511405 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145714 () Bool)

(declare-fun res!762891 () Bool)

(assert (=> b!1145714 (=> (not res!762891) (not e!651712))))

(assert (=> b!1145714 (= res!762891 (and (= (size!36341 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36340 _keys!1208) (size!36341 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145715 () Bool)

(assert (=> b!1145715 (= e!651702 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44972 () Bool)

(declare-fun tp!85415 () Bool)

(assert (=> mapNonEmpty!44972 (= mapRes!44972 (and tp!85415 e!651699))))

(declare-fun mapRest!44972 () (Array (_ BitVec 32) ValueCell!13673))

(declare-fun mapKey!44972 () (_ BitVec 32))

(declare-fun mapValue!44972 () ValueCell!13673)

(assert (=> mapNonEmpty!44972 (= (arr!35803 _values!996) (store mapRest!44972 mapKey!44972 mapValue!44972))))

(declare-fun b!1145716 () Bool)

(declare-fun e!651698 () Bool)

(assert (=> b!1145716 (= e!651703 e!651698)))

(declare-fun res!762898 () Bool)

(assert (=> b!1145716 (=> res!762898 e!651698)))

(assert (=> b!1145716 (= res!762898 (not (= from!1455 i!673)))))

(declare-fun lt!511408 () ListLongMap!16349)

(assert (=> b!1145716 (= lt!511408 (getCurrentListMapNoExtraKeys!4676 lt!511416 lt!511405 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!511419 () V!43481)

(assert (=> b!1145716 (= lt!511405 (array!74305 (store (arr!35803 _values!996) i!673 (ValueCellFull!13673 lt!511419)) (size!36341 _values!996)))))

(declare-fun dynLambda!2648 (Int (_ BitVec 64)) V!43481)

(assert (=> b!1145716 (= lt!511419 (dynLambda!2648 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511421 () ListLongMap!16349)

(assert (=> b!1145716 (= lt!511421 (getCurrentListMapNoExtraKeys!4676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145717 () Bool)

(declare-fun res!762890 () Bool)

(assert (=> b!1145717 (=> (not res!762890) (not e!651704))))

(assert (=> b!1145717 (= res!762890 (arrayNoDuplicates!0 lt!511416 #b00000000000000000000000000000000 Nil!25114))))

(declare-fun bm!52342 () Bool)

(assert (=> bm!52342 (= call!52339 (getCurrentListMapNoExtraKeys!4676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145718 () Bool)

(assert (=> b!1145718 (= e!651713 e!651714)))

(declare-fun c!112948 () Bool)

(assert (=> b!1145718 (= c!112948 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511407))))

(declare-fun b!1145719 () Bool)

(declare-fun lt!511409 () Unit!37477)

(assert (=> b!1145719 (= e!651713 lt!511409)))

(assert (=> b!1145719 (= lt!511409 call!52342)))

(assert (=> b!1145719 call!52340))

(declare-fun b!1145720 () Bool)

(assert (=> b!1145720 (= e!651709 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145721 () Bool)

(declare-fun e!651710 () Bool)

(assert (=> b!1145721 (= e!651698 e!651710)))

(declare-fun res!762888 () Bool)

(assert (=> b!1145721 (=> res!762888 e!651710)))

(assert (=> b!1145721 (= res!762888 (not (= (select (arr!35802 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1145721 e!651708))

(declare-fun c!112952 () Bool)

(assert (=> b!1145721 (= c!112952 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511417 () Unit!37477)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!544 (array!74302 array!74304 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37477)

(assert (=> b!1145721 (= lt!511417 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145722 () Bool)

(assert (=> b!1145722 (= e!651710 true)))

(declare-fun e!651706 () Bool)

(assert (=> b!1145722 e!651706))

(declare-fun res!762897 () Bool)

(assert (=> b!1145722 (=> (not res!762897) (not e!651706))))

(declare-fun lt!511403 () V!43481)

(declare-fun -!1264 (ListLongMap!16349 (_ BitVec 64)) ListLongMap!16349)

(assert (=> b!1145722 (= res!762897 (= (-!1264 (+!3610 lt!511404 (tuple2!18381 (select (arr!35802 _keys!1208) from!1455) lt!511403)) (select (arr!35802 _keys!1208) from!1455)) lt!511404))))

(declare-fun lt!511413 () Unit!37477)

(declare-fun addThenRemoveForNewKeyIsSame!127 (ListLongMap!16349 (_ BitVec 64) V!43481) Unit!37477)

(assert (=> b!1145722 (= lt!511413 (addThenRemoveForNewKeyIsSame!127 lt!511404 (select (arr!35802 _keys!1208) from!1455) lt!511403))))

(declare-fun get!18219 (ValueCell!13673 V!43481) V!43481)

(assert (=> b!1145722 (= lt!511403 (get!18219 (select (arr!35803 _values!996) from!1455) lt!511419))))

(declare-fun lt!511414 () Unit!37477)

(assert (=> b!1145722 (= lt!511414 e!651701)))

(declare-fun c!112950 () Bool)

(assert (=> b!1145722 (= c!112950 (contains!6654 lt!511404 k0!934))))

(assert (=> b!1145722 (= lt!511404 (getCurrentListMapNoExtraKeys!4676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145723 () Bool)

(assert (=> b!1145723 (= e!651708 (= call!52344 (-!1264 call!52339 k0!934)))))

(declare-fun bm!52343 () Bool)

(assert (=> bm!52343 (= call!52346 call!52341)))

(declare-fun b!1145724 () Bool)

(assert (=> b!1145724 (= e!651712 e!651704)))

(declare-fun res!762902 () Bool)

(assert (=> b!1145724 (=> (not res!762902) (not e!651704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74302 (_ BitVec 32)) Bool)

(assert (=> b!1145724 (= res!762902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511416 mask!1564))))

(assert (=> b!1145724 (= lt!511416 (array!74303 (store (arr!35802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36340 _keys!1208)))))

(declare-fun b!1145725 () Bool)

(assert (=> b!1145725 (= e!651706 (= (-!1264 lt!511421 k0!934) lt!511404))))

(declare-fun b!1145726 () Bool)

(assert (=> b!1145726 (= e!651707 tp_is_empty!28765)))

(declare-fun b!1145727 () Bool)

(declare-fun res!762901 () Bool)

(assert (=> b!1145727 (=> (not res!762901) (not e!651712))))

(assert (=> b!1145727 (= res!762901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98624 res!762893) b!1145708))

(assert (= (and b!1145708 res!762899) b!1145714))

(assert (= (and b!1145714 res!762891) b!1145727))

(assert (= (and b!1145727 res!762901) b!1145712))

(assert (= (and b!1145712 res!762889) b!1145709))

(assert (= (and b!1145709 res!762894) b!1145711))

(assert (= (and b!1145711 res!762895) b!1145707))

(assert (= (and b!1145707 res!762896) b!1145724))

(assert (= (and b!1145724 res!762902) b!1145717))

(assert (= (and b!1145717 res!762890) b!1145698))

(assert (= (and b!1145698 (not res!762892)) b!1145716))

(assert (= (and b!1145716 (not res!762898)) b!1145721))

(assert (= (and b!1145721 c!112952) b!1145723))

(assert (= (and b!1145721 (not c!112952)) b!1145710))

(assert (= (or b!1145723 b!1145710) bm!52341))

(assert (= (or b!1145723 b!1145710) bm!52342))

(assert (= (and b!1145721 (not res!762888)) b!1145722))

(assert (= (and b!1145722 c!112950) b!1145702))

(assert (= (and b!1145722 (not c!112950)) b!1145700))

(assert (= (and b!1145702 c!112947) b!1145704))

(assert (= (and b!1145702 (not c!112947)) b!1145703))

(assert (= (and b!1145703 c!112951) b!1145719))

(assert (= (and b!1145703 (not c!112951)) b!1145718))

(assert (= (and b!1145718 c!112948) b!1145705))

(assert (= (and b!1145718 (not c!112948)) b!1145701))

(assert (= (or b!1145719 b!1145705) bm!52337))

(assert (= (or b!1145719 b!1145705) bm!52343))

(assert (= (or b!1145719 b!1145705) bm!52340))

(assert (= (or b!1145704 bm!52340) bm!52338))

(assert (= (or b!1145704 bm!52337) bm!52339))

(assert (= (or b!1145704 bm!52343) bm!52336))

(assert (= (and b!1145702 c!112949) b!1145715))

(assert (= (and b!1145702 (not c!112949)) b!1145699))

(assert (= (and b!1145702 res!762900) b!1145720))

(assert (= (and b!1145722 res!762897) b!1145725))

(assert (= (and b!1145713 condMapEmpty!44972) mapIsEmpty!44972))

(assert (= (and b!1145713 (not condMapEmpty!44972)) mapNonEmpty!44972))

(get-info :version)

(assert (= (and mapNonEmpty!44972 ((_ is ValueCellFull!13673) mapValue!44972)) b!1145706))

(assert (= (and b!1145713 ((_ is ValueCellFull!13673) mapDefault!44972)) b!1145726))

(assert (= start!98624 b!1145713))

(declare-fun b_lambda!19323 () Bool)

(assert (=> (not b_lambda!19323) (not b!1145716)))

(declare-fun t!36333 () Bool)

(declare-fun tb!9039 () Bool)

(assert (=> (and start!98624 (= defaultEntry!1004 defaultEntry!1004) t!36333) tb!9039))

(declare-fun result!18651 () Bool)

(assert (=> tb!9039 (= result!18651 tp_is_empty!28765)))

(assert (=> b!1145716 t!36333))

(declare-fun b_and!39299 () Bool)

(assert (= b_and!39297 (and (=> t!36333 result!18651) b_and!39299)))

(declare-fun m!1056059 () Bool)

(assert (=> b!1145704 m!1056059))

(declare-fun m!1056061 () Bool)

(assert (=> b!1145704 m!1056061))

(declare-fun m!1056063 () Bool)

(assert (=> b!1145704 m!1056063))

(declare-fun m!1056065 () Bool)

(assert (=> b!1145698 m!1056065))

(declare-fun m!1056067 () Bool)

(assert (=> b!1145698 m!1056067))

(declare-fun m!1056069 () Bool)

(assert (=> b!1145720 m!1056069))

(declare-fun m!1056071 () Bool)

(assert (=> bm!52342 m!1056071))

(declare-fun m!1056073 () Bool)

(assert (=> b!1145707 m!1056073))

(declare-fun m!1056075 () Bool)

(assert (=> b!1145716 m!1056075))

(declare-fun m!1056077 () Bool)

(assert (=> b!1145716 m!1056077))

(declare-fun m!1056079 () Bool)

(assert (=> b!1145716 m!1056079))

(declare-fun m!1056081 () Bool)

(assert (=> b!1145716 m!1056081))

(declare-fun m!1056083 () Bool)

(assert (=> mapNonEmpty!44972 m!1056083))

(declare-fun m!1056085 () Bool)

(assert (=> b!1145723 m!1056085))

(declare-fun m!1056087 () Bool)

(assert (=> b!1145724 m!1056087))

(declare-fun m!1056089 () Bool)

(assert (=> b!1145724 m!1056089))

(declare-fun m!1056091 () Bool)

(assert (=> b!1145712 m!1056091))

(declare-fun m!1056093 () Bool)

(assert (=> b!1145708 m!1056093))

(declare-fun m!1056095 () Bool)

(assert (=> bm!52339 m!1056095))

(declare-fun m!1056097 () Bool)

(assert (=> bm!52336 m!1056097))

(declare-fun m!1056099 () Bool)

(assert (=> b!1145725 m!1056099))

(declare-fun m!1056101 () Bool)

(assert (=> start!98624 m!1056101))

(declare-fun m!1056103 () Bool)

(assert (=> start!98624 m!1056103))

(assert (=> b!1145722 m!1056071))

(declare-fun m!1056105 () Bool)

(assert (=> b!1145722 m!1056105))

(declare-fun m!1056107 () Bool)

(assert (=> b!1145722 m!1056107))

(declare-fun m!1056109 () Bool)

(assert (=> b!1145722 m!1056109))

(declare-fun m!1056111 () Bool)

(assert (=> b!1145722 m!1056111))

(assert (=> b!1145722 m!1056105))

(declare-fun m!1056113 () Bool)

(assert (=> b!1145722 m!1056113))

(declare-fun m!1056115 () Bool)

(assert (=> b!1145722 m!1056115))

(assert (=> b!1145722 m!1056111))

(assert (=> b!1145722 m!1056107))

(declare-fun m!1056117 () Bool)

(assert (=> b!1145722 m!1056117))

(assert (=> b!1145722 m!1056107))

(assert (=> b!1145721 m!1056107))

(declare-fun m!1056119 () Bool)

(assert (=> b!1145721 m!1056119))

(declare-fun m!1056121 () Bool)

(assert (=> b!1145727 m!1056121))

(declare-fun m!1056123 () Bool)

(assert (=> bm!52338 m!1056123))

(assert (=> b!1145715 m!1056069))

(declare-fun m!1056125 () Bool)

(assert (=> b!1145717 m!1056125))

(declare-fun m!1056127 () Bool)

(assert (=> b!1145711 m!1056127))

(declare-fun m!1056129 () Bool)

(assert (=> b!1145702 m!1056129))

(declare-fun m!1056131 () Bool)

(assert (=> b!1145702 m!1056131))

(declare-fun m!1056133 () Bool)

(assert (=> b!1145702 m!1056133))

(declare-fun m!1056135 () Bool)

(assert (=> b!1145702 m!1056135))

(declare-fun m!1056137 () Bool)

(assert (=> bm!52341 m!1056137))

(check-sat (not b!1145711) (not b!1145702) (not start!98624) (not b_lambda!19323) (not bm!52339) (not b!1145722) (not b!1145712) (not b!1145725) (not b!1145717) (not b!1145708) tp_is_empty!28765 (not b!1145723) (not b!1145721) (not bm!52341) (not b!1145724) (not bm!52342) (not bm!52336) (not b_next!24235) (not b!1145727) (not b!1145715) (not b!1145716) (not b!1145704) (not bm!52338) (not b!1145698) b_and!39299 (not b!1145720) (not mapNonEmpty!44972))
(check-sat b_and!39299 (not b_next!24235))
