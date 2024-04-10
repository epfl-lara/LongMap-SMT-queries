; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98602 () Bool)

(assert start!98602)

(declare-fun b_free!24207 () Bool)

(declare-fun b_next!24207 () Bool)

(assert (=> start!98602 (= b_free!24207 (not b_next!24207))))

(declare-fun tp!85331 () Bool)

(declare-fun b_and!39263 () Bool)

(assert (=> start!98602 (= tp!85331 b_and!39263)))

(declare-fun b!1144534 () Bool)

(declare-datatypes ((Unit!37567 0))(
  ( (Unit!37568) )
))
(declare-fun e!651077 () Unit!37567)

(declare-fun e!651071 () Unit!37567)

(assert (=> b!1144534 (= e!651077 e!651071)))

(declare-fun c!112726 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!510718 () Bool)

(assert (=> b!1144534 (= c!112726 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510718))))

(declare-fun bm!52023 () Bool)

(declare-fun call!52028 () Bool)

(declare-fun call!52030 () Bool)

(assert (=> bm!52023 (= call!52028 call!52030)))

(declare-fun b!1144535 () Bool)

(declare-fun lt!510719 () Unit!37567)

(assert (=> b!1144535 (= e!651077 lt!510719)))

(declare-fun call!52027 () Unit!37567)

(assert (=> b!1144535 (= lt!510719 call!52027)))

(assert (=> b!1144535 call!52028))

(declare-fun b!1144537 () Bool)

(declare-fun e!651065 () Unit!37567)

(declare-fun Unit!37569 () Unit!37567)

(assert (=> b!1144537 (= e!651065 Unit!37569)))

(declare-fun call!52031 () Unit!37567)

(declare-fun c!112722 () Bool)

(declare-fun bm!52024 () Bool)

(declare-datatypes ((V!43443 0))(
  ( (V!43444 (val!14425 Int)) )
))
(declare-datatypes ((tuple2!18268 0))(
  ( (tuple2!18269 (_1!9145 (_ BitVec 64)) (_2!9145 V!43443)) )
))
(declare-datatypes ((List!25021 0))(
  ( (Nil!25018) (Cons!25017 (h!26226 tuple2!18268) (t!36220 List!25021)) )
))
(declare-datatypes ((ListLongMap!16237 0))(
  ( (ListLongMap!16238 (toList!8134 List!25021)) )
))
(declare-fun lt!510725 () ListLongMap!16237)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43443)

(declare-fun zeroValue!944 () V!43443)

(declare-fun c!112723 () Bool)

(declare-fun addStillContains!816 (ListLongMap!16237 (_ BitVec 64) V!43443 (_ BitVec 64)) Unit!37567)

(assert (=> bm!52024 (= call!52031 (addStillContains!816 lt!510725 (ite (or c!112722 c!112723) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112722 c!112723) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1144538 () Bool)

(declare-fun e!651067 () Bool)

(declare-fun e!651069 () Bool)

(assert (=> b!1144538 (= e!651067 (not e!651069))))

(declare-fun res!762328 () Bool)

(assert (=> b!1144538 (=> res!762328 e!651069)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144538 (= res!762328 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74327 0))(
  ( (array!74328 (arr!35814 (Array (_ BitVec 32) (_ BitVec 64))) (size!36350 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74327)

(declare-fun arrayContainsKey!0 (array!74327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144538 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510713 () Unit!37567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74327 (_ BitVec 64) (_ BitVec 32)) Unit!37567)

(assert (=> b!1144538 (= lt!510713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1144539 () Bool)

(declare-fun Unit!37570 () Unit!37567)

(assert (=> b!1144539 (= e!651065 Unit!37570)))

(assert (=> b!1144539 (= lt!510718 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144539 (= c!112722 (and (not lt!510718) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510731 () Unit!37567)

(declare-fun e!651066 () Unit!37567)

(assert (=> b!1144539 (= lt!510731 e!651066)))

(declare-fun lt!510729 () Unit!37567)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13659 0))(
  ( (ValueCellFull!13659 (v!17062 V!43443)) (EmptyCell!13659) )
))
(declare-datatypes ((array!74329 0))(
  ( (array!74330 (arr!35815 (Array (_ BitVec 32) ValueCell!13659)) (size!36351 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74329)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!409 (array!74327 array!74329 (_ BitVec 32) (_ BitVec 32) V!43443 V!43443 (_ BitVec 64) (_ BitVec 32) Int) Unit!37567)

(assert (=> b!1144539 (= lt!510729 (lemmaListMapContainsThenArrayContainsFrom!409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112725 () Bool)

(assert (=> b!1144539 (= c!112725 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762337 () Bool)

(declare-fun e!651068 () Bool)

(assert (=> b!1144539 (= res!762337 e!651068)))

(declare-fun e!651070 () Bool)

(assert (=> b!1144539 (=> (not res!762337) (not e!651070))))

(assert (=> b!1144539 e!651070))

(declare-fun lt!510728 () Unit!37567)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74327 (_ BitVec 32) (_ BitVec 32)) Unit!37567)

(assert (=> b!1144539 (= lt!510728 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25022 0))(
  ( (Nil!25019) (Cons!25018 (h!26227 (_ BitVec 64)) (t!36221 List!25022)) )
))
(declare-fun arrayNoDuplicates!0 (array!74327 (_ BitVec 32) List!25022) Bool)

(assert (=> b!1144539 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25019)))

(declare-fun lt!510723 () Unit!37567)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74327 (_ BitVec 64) (_ BitVec 32) List!25022) Unit!37567)

(assert (=> b!1144539 (= lt!510723 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25019))))

(assert (=> b!1144539 false))

(declare-fun b!1144540 () Bool)

(declare-fun res!762332 () Bool)

(declare-fun e!651073 () Bool)

(assert (=> b!1144540 (=> (not res!762332) (not e!651073))))

(assert (=> b!1144540 (= res!762332 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25019))))

(declare-fun b!1144541 () Bool)

(declare-fun res!762325 () Bool)

(assert (=> b!1144541 (=> (not res!762325) (not e!651073))))

(assert (=> b!1144541 (= res!762325 (and (= (size!36351 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36350 _keys!1208) (size!36351 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1144542 () Bool)

(declare-fun res!762333 () Bool)

(assert (=> b!1144542 (=> (not res!762333) (not e!651067))))

(declare-fun lt!510716 () array!74327)

(assert (=> b!1144542 (= res!762333 (arrayNoDuplicates!0 lt!510716 #b00000000000000000000000000000000 Nil!25019))))

(declare-fun b!1144543 () Bool)

(declare-fun e!651062 () Bool)

(assert (=> b!1144543 (= e!651069 e!651062)))

(declare-fun res!762336 () Bool)

(assert (=> b!1144543 (=> res!762336 e!651062)))

(assert (=> b!1144543 (= res!762336 (not (= from!1455 i!673)))))

(declare-fun lt!510714 () ListLongMap!16237)

(declare-fun lt!510724 () array!74329)

(declare-fun getCurrentListMapNoExtraKeys!4612 (array!74327 array!74329 (_ BitVec 32) (_ BitVec 32) V!43443 V!43443 (_ BitVec 32) Int) ListLongMap!16237)

(assert (=> b!1144543 (= lt!510714 (getCurrentListMapNoExtraKeys!4612 lt!510716 lt!510724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510720 () V!43443)

(assert (=> b!1144543 (= lt!510724 (array!74330 (store (arr!35815 _values!996) i!673 (ValueCellFull!13659 lt!510720)) (size!36351 _values!996)))))

(declare-fun dynLambda!2649 (Int (_ BitVec 64)) V!43443)

(assert (=> b!1144543 (= lt!510720 (dynLambda!2649 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510730 () ListLongMap!16237)

(assert (=> b!1144543 (= lt!510730 (getCurrentListMapNoExtraKeys!4612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144544 () Bool)

(declare-fun res!762324 () Bool)

(assert (=> b!1144544 (=> (not res!762324) (not e!651073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144544 (= res!762324 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44930 () Bool)

(declare-fun mapRes!44930 () Bool)

(assert (=> mapIsEmpty!44930 mapRes!44930))

(declare-fun b!1144545 () Bool)

(declare-fun Unit!37571 () Unit!37567)

(assert (=> b!1144545 (= e!651071 Unit!37571)))

(declare-fun b!1144546 () Bool)

(declare-fun e!651074 () Bool)

(assert (=> b!1144546 (= e!651074 true)))

(declare-fun e!651075 () Bool)

(assert (=> b!1144546 e!651075))

(declare-fun res!762334 () Bool)

(assert (=> b!1144546 (=> (not res!762334) (not e!651075))))

(declare-fun lt!510726 () V!43443)

(declare-fun -!1277 (ListLongMap!16237 (_ BitVec 64)) ListLongMap!16237)

(declare-fun +!3561 (ListLongMap!16237 tuple2!18268) ListLongMap!16237)

(assert (=> b!1144546 (= res!762334 (= (-!1277 (+!3561 lt!510725 (tuple2!18269 (select (arr!35814 _keys!1208) from!1455) lt!510726)) (select (arr!35814 _keys!1208) from!1455)) lt!510725))))

(declare-fun lt!510717 () Unit!37567)

(declare-fun addThenRemoveForNewKeyIsSame!127 (ListLongMap!16237 (_ BitVec 64) V!43443) Unit!37567)

(assert (=> b!1144546 (= lt!510717 (addThenRemoveForNewKeyIsSame!127 lt!510725 (select (arr!35814 _keys!1208) from!1455) lt!510726))))

(declare-fun get!18209 (ValueCell!13659 V!43443) V!43443)

(assert (=> b!1144546 (= lt!510726 (get!18209 (select (arr!35815 _values!996) from!1455) lt!510720))))

(declare-fun lt!510722 () Unit!37567)

(assert (=> b!1144546 (= lt!510722 e!651065)))

(declare-fun c!112724 () Bool)

(declare-fun contains!6663 (ListLongMap!16237 (_ BitVec 64)) Bool)

(assert (=> b!1144546 (= c!112724 (contains!6663 lt!510725 k0!934))))

(assert (=> b!1144546 (= lt!510725 (getCurrentListMapNoExtraKeys!4612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52029 () ListLongMap!16237)

(declare-fun bm!52025 () Bool)

(assert (=> bm!52025 (= call!52029 (getCurrentListMapNoExtraKeys!4612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52026 () Bool)

(declare-fun call!52033 () ListLongMap!16237)

(assert (=> bm!52026 (= call!52033 (getCurrentListMapNoExtraKeys!4612 lt!510716 lt!510724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144547 () Bool)

(assert (=> b!1144547 (= c!112723 (and (not lt!510718) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144547 (= e!651066 e!651077)))

(declare-fun res!762335 () Bool)

(assert (=> start!98602 (=> (not res!762335) (not e!651073))))

(assert (=> start!98602 (= res!762335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36350 _keys!1208))))))

(assert (=> start!98602 e!651073))

(declare-fun tp_is_empty!28737 () Bool)

(assert (=> start!98602 tp_is_empty!28737))

(declare-fun array_inv!27440 (array!74327) Bool)

(assert (=> start!98602 (array_inv!27440 _keys!1208)))

(assert (=> start!98602 true))

(assert (=> start!98602 tp!85331))

(declare-fun e!651072 () Bool)

(declare-fun array_inv!27441 (array!74329) Bool)

(assert (=> start!98602 (and (array_inv!27441 _values!996) e!651072)))

(declare-fun b!1144536 () Bool)

(declare-fun e!651064 () Bool)

(assert (=> b!1144536 (= e!651064 (= call!52033 call!52029))))

(declare-fun b!1144548 () Bool)

(declare-fun res!762331 () Bool)

(assert (=> b!1144548 (=> (not res!762331) (not e!651073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144548 (= res!762331 (validMask!0 mask!1564))))

(declare-fun b!1144549 () Bool)

(declare-fun e!651063 () Bool)

(assert (=> b!1144549 (= e!651063 tp_is_empty!28737)))

(declare-fun bm!52027 () Bool)

(declare-fun lt!510721 () ListLongMap!16237)

(declare-fun call!52026 () ListLongMap!16237)

(assert (=> bm!52027 (= call!52030 (contains!6663 (ite c!112722 lt!510721 call!52026) k0!934))))

(declare-fun b!1144550 () Bool)

(assert (=> b!1144550 (= e!651064 (= call!52033 (-!1277 call!52029 k0!934)))))

(declare-fun b!1144551 () Bool)

(assert (=> b!1144551 (= e!651068 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144552 () Bool)

(assert (=> b!1144552 (= e!651062 e!651074)))

(declare-fun res!762338 () Bool)

(assert (=> b!1144552 (=> res!762338 e!651074)))

(assert (=> b!1144552 (= res!762338 (not (= (select (arr!35814 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144552 e!651064))

(declare-fun c!112721 () Bool)

(assert (=> b!1144552 (= c!112721 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510727 () Unit!37567)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!518 (array!74327 array!74329 (_ BitVec 32) (_ BitVec 32) V!43443 V!43443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37567)

(assert (=> b!1144552 (= lt!510727 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44930 () Bool)

(declare-fun tp!85332 () Bool)

(assert (=> mapNonEmpty!44930 (= mapRes!44930 (and tp!85332 e!651063))))

(declare-fun mapKey!44930 () (_ BitVec 32))

(declare-fun mapRest!44930 () (Array (_ BitVec 32) ValueCell!13659))

(declare-fun mapValue!44930 () ValueCell!13659)

(assert (=> mapNonEmpty!44930 (= (arr!35815 _values!996) (store mapRest!44930 mapKey!44930 mapValue!44930))))

(declare-fun b!1144553 () Bool)

(assert (=> b!1144553 (= e!651073 e!651067)))

(declare-fun res!762329 () Bool)

(assert (=> b!1144553 (=> (not res!762329) (not e!651067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74327 (_ BitVec 32)) Bool)

(assert (=> b!1144553 (= res!762329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510716 mask!1564))))

(assert (=> b!1144553 (= lt!510716 (array!74328 (store (arr!35814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36350 _keys!1208)))))

(declare-fun b!1144554 () Bool)

(declare-fun res!762327 () Bool)

(assert (=> b!1144554 (=> (not res!762327) (not e!651073))))

(assert (=> b!1144554 (= res!762327 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36350 _keys!1208))))))

(declare-fun bm!52028 () Bool)

(assert (=> bm!52028 (= call!52027 call!52031)))

(declare-fun b!1144555 () Bool)

(declare-fun e!651078 () Bool)

(assert (=> b!1144555 (= e!651072 (and e!651078 mapRes!44930))))

(declare-fun condMapEmpty!44930 () Bool)

(declare-fun mapDefault!44930 () ValueCell!13659)

(assert (=> b!1144555 (= condMapEmpty!44930 (= (arr!35815 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13659)) mapDefault!44930)))))

(declare-fun bm!52029 () Bool)

(declare-fun call!52032 () ListLongMap!16237)

(assert (=> bm!52029 (= call!52026 call!52032)))

(declare-fun bm!52030 () Bool)

(assert (=> bm!52030 (= call!52032 (+!3561 lt!510725 (ite (or c!112722 c!112723) (tuple2!18269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18269 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1144556 () Bool)

(declare-fun res!762326 () Bool)

(assert (=> b!1144556 (=> (not res!762326) (not e!651073))))

(assert (=> b!1144556 (= res!762326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144557 () Bool)

(assert (=> b!1144557 (= e!651078 tp_is_empty!28737)))

(declare-fun b!1144558 () Bool)

(declare-fun res!762330 () Bool)

(assert (=> b!1144558 (=> (not res!762330) (not e!651073))))

(assert (=> b!1144558 (= res!762330 (= (select (arr!35814 _keys!1208) i!673) k0!934))))

(declare-fun b!1144559 () Bool)

(assert (=> b!1144559 (= e!651068 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510718) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144560 () Bool)

(assert (=> b!1144560 (contains!6663 (+!3561 lt!510721 (tuple2!18269 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510732 () Unit!37567)

(assert (=> b!1144560 (= lt!510732 (addStillContains!816 lt!510721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1144560 call!52030))

(assert (=> b!1144560 (= lt!510721 call!52032)))

(declare-fun lt!510715 () Unit!37567)

(assert (=> b!1144560 (= lt!510715 call!52031)))

(assert (=> b!1144560 (= e!651066 lt!510732)))

(declare-fun b!1144561 () Bool)

(assert (=> b!1144561 call!52028))

(declare-fun lt!510712 () Unit!37567)

(assert (=> b!1144561 (= lt!510712 call!52027)))

(assert (=> b!1144561 (= e!651071 lt!510712)))

(declare-fun b!1144562 () Bool)

(assert (=> b!1144562 (= e!651070 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144563 () Bool)

(assert (=> b!1144563 (= e!651075 (= (-!1277 lt!510730 k0!934) lt!510725))))

(assert (= (and start!98602 res!762335) b!1144548))

(assert (= (and b!1144548 res!762331) b!1144541))

(assert (= (and b!1144541 res!762325) b!1144556))

(assert (= (and b!1144556 res!762326) b!1144540))

(assert (= (and b!1144540 res!762332) b!1144554))

(assert (= (and b!1144554 res!762327) b!1144544))

(assert (= (and b!1144544 res!762324) b!1144558))

(assert (= (and b!1144558 res!762330) b!1144553))

(assert (= (and b!1144553 res!762329) b!1144542))

(assert (= (and b!1144542 res!762333) b!1144538))

(assert (= (and b!1144538 (not res!762328)) b!1144543))

(assert (= (and b!1144543 (not res!762336)) b!1144552))

(assert (= (and b!1144552 c!112721) b!1144550))

(assert (= (and b!1144552 (not c!112721)) b!1144536))

(assert (= (or b!1144550 b!1144536) bm!52026))

(assert (= (or b!1144550 b!1144536) bm!52025))

(assert (= (and b!1144552 (not res!762338)) b!1144546))

(assert (= (and b!1144546 c!112724) b!1144539))

(assert (= (and b!1144546 (not c!112724)) b!1144537))

(assert (= (and b!1144539 c!112722) b!1144560))

(assert (= (and b!1144539 (not c!112722)) b!1144547))

(assert (= (and b!1144547 c!112723) b!1144535))

(assert (= (and b!1144547 (not c!112723)) b!1144534))

(assert (= (and b!1144534 c!112726) b!1144561))

(assert (= (and b!1144534 (not c!112726)) b!1144545))

(assert (= (or b!1144535 b!1144561) bm!52028))

(assert (= (or b!1144535 b!1144561) bm!52029))

(assert (= (or b!1144535 b!1144561) bm!52023))

(assert (= (or b!1144560 bm!52023) bm!52027))

(assert (= (or b!1144560 bm!52028) bm!52024))

(assert (= (or b!1144560 bm!52029) bm!52030))

(assert (= (and b!1144539 c!112725) b!1144551))

(assert (= (and b!1144539 (not c!112725)) b!1144559))

(assert (= (and b!1144539 res!762337) b!1144562))

(assert (= (and b!1144546 res!762334) b!1144563))

(assert (= (and b!1144555 condMapEmpty!44930) mapIsEmpty!44930))

(assert (= (and b!1144555 (not condMapEmpty!44930)) mapNonEmpty!44930))

(get-info :version)

(assert (= (and mapNonEmpty!44930 ((_ is ValueCellFull!13659) mapValue!44930)) b!1144549))

(assert (= (and b!1144555 ((_ is ValueCellFull!13659) mapDefault!44930)) b!1144557))

(assert (= start!98602 b!1144555))

(declare-fun b_lambda!19313 () Bool)

(assert (=> (not b_lambda!19313) (not b!1144543)))

(declare-fun t!36219 () Bool)

(declare-fun tb!9019 () Bool)

(assert (=> (and start!98602 (= defaultEntry!1004 defaultEntry!1004) t!36219) tb!9019))

(declare-fun result!18603 () Bool)

(assert (=> tb!9019 (= result!18603 tp_is_empty!28737)))

(assert (=> b!1144543 t!36219))

(declare-fun b_and!39265 () Bool)

(assert (= b_and!39263 (and (=> t!36219 result!18603) b_and!39265)))

(declare-fun m!1055539 () Bool)

(assert (=> bm!52030 m!1055539))

(declare-fun m!1055541 () Bool)

(assert (=> b!1144552 m!1055541))

(declare-fun m!1055543 () Bool)

(assert (=> b!1144552 m!1055543))

(declare-fun m!1055545 () Bool)

(assert (=> b!1144553 m!1055545))

(declare-fun m!1055547 () Bool)

(assert (=> b!1144553 m!1055547))

(declare-fun m!1055549 () Bool)

(assert (=> bm!52026 m!1055549))

(declare-fun m!1055551 () Bool)

(assert (=> b!1144539 m!1055551))

(declare-fun m!1055553 () Bool)

(assert (=> b!1144539 m!1055553))

(declare-fun m!1055555 () Bool)

(assert (=> b!1144539 m!1055555))

(declare-fun m!1055557 () Bool)

(assert (=> b!1144539 m!1055557))

(declare-fun m!1055559 () Bool)

(assert (=> b!1144542 m!1055559))

(declare-fun m!1055561 () Bool)

(assert (=> b!1144562 m!1055561))

(declare-fun m!1055563 () Bool)

(assert (=> b!1144563 m!1055563))

(declare-fun m!1055565 () Bool)

(assert (=> b!1144538 m!1055565))

(declare-fun m!1055567 () Bool)

(assert (=> b!1144538 m!1055567))

(declare-fun m!1055569 () Bool)

(assert (=> mapNonEmpty!44930 m!1055569))

(declare-fun m!1055571 () Bool)

(assert (=> b!1144556 m!1055571))

(declare-fun m!1055573 () Bool)

(assert (=> b!1144540 m!1055573))

(declare-fun m!1055575 () Bool)

(assert (=> b!1144544 m!1055575))

(assert (=> b!1144551 m!1055561))

(declare-fun m!1055577 () Bool)

(assert (=> bm!52027 m!1055577))

(declare-fun m!1055579 () Bool)

(assert (=> b!1144560 m!1055579))

(assert (=> b!1144560 m!1055579))

(declare-fun m!1055581 () Bool)

(assert (=> b!1144560 m!1055581))

(declare-fun m!1055583 () Bool)

(assert (=> b!1144560 m!1055583))

(declare-fun m!1055585 () Bool)

(assert (=> b!1144543 m!1055585))

(declare-fun m!1055587 () Bool)

(assert (=> b!1144543 m!1055587))

(declare-fun m!1055589 () Bool)

(assert (=> b!1144543 m!1055589))

(declare-fun m!1055591 () Bool)

(assert (=> b!1144543 m!1055591))

(declare-fun m!1055593 () Bool)

(assert (=> b!1144558 m!1055593))

(declare-fun m!1055595 () Bool)

(assert (=> b!1144546 m!1055595))

(declare-fun m!1055597 () Bool)

(assert (=> b!1144546 m!1055597))

(declare-fun m!1055599 () Bool)

(assert (=> b!1144546 m!1055599))

(assert (=> b!1144546 m!1055599))

(assert (=> b!1144546 m!1055541))

(declare-fun m!1055601 () Bool)

(assert (=> b!1144546 m!1055601))

(assert (=> b!1144546 m!1055541))

(declare-fun m!1055603 () Bool)

(assert (=> b!1144546 m!1055603))

(assert (=> b!1144546 m!1055541))

(declare-fun m!1055605 () Bool)

(assert (=> b!1144546 m!1055605))

(assert (=> b!1144546 m!1055597))

(declare-fun m!1055607 () Bool)

(assert (=> b!1144546 m!1055607))

(assert (=> bm!52025 m!1055595))

(declare-fun m!1055609 () Bool)

(assert (=> bm!52024 m!1055609))

(declare-fun m!1055611 () Bool)

(assert (=> start!98602 m!1055611))

(declare-fun m!1055613 () Bool)

(assert (=> start!98602 m!1055613))

(declare-fun m!1055615 () Bool)

(assert (=> b!1144550 m!1055615))

(declare-fun m!1055617 () Bool)

(assert (=> b!1144548 m!1055617))

(check-sat (not b!1144553) (not b_next!24207) (not start!98602) (not b!1144556) (not b!1144550) b_and!39265 (not b!1144560) (not bm!52026) (not b!1144562) (not b!1144563) (not b!1144551) (not bm!52024) (not b!1144546) (not mapNonEmpty!44930) (not b!1144538) (not b!1144542) (not b!1144548) (not b!1144539) (not bm!52030) (not bm!52027) (not b!1144544) (not b_lambda!19313) (not bm!52025) (not b!1144552) (not b!1144540) tp_is_empty!28737 (not b!1144543))
(check-sat b_and!39265 (not b_next!24207))
