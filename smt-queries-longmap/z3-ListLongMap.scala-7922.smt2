; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98608 () Bool)

(assert start!98608)

(declare-fun b_free!23977 () Bool)

(declare-fun b_next!23977 () Bool)

(assert (=> start!98608 (= b_free!23977 (not b_next!23977))))

(declare-fun tp!84642 () Bool)

(declare-fun b_and!38805 () Bool)

(assert (=> start!98608 (= tp!84642 b_and!38805)))

(declare-fun res!757679 () Bool)

(declare-fun e!646293 () Bool)

(assert (=> start!98608 (=> (not res!757679) (not e!646293))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73917 0))(
  ( (array!73918 (arr!35603 (Array (_ BitVec 32) (_ BitVec 64))) (size!36140 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73917)

(assert (=> start!98608 (= res!757679 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36140 _keys!1208))))))

(assert (=> start!98608 e!646293))

(declare-fun tp_is_empty!28507 () Bool)

(assert (=> start!98608 tp_is_empty!28507))

(declare-fun array_inv!27358 (array!73917) Bool)

(assert (=> start!98608 (array_inv!27358 _keys!1208)))

(assert (=> start!98608 true))

(assert (=> start!98608 tp!84642))

(declare-datatypes ((V!43137 0))(
  ( (V!43138 (val!14310 Int)) )
))
(declare-datatypes ((ValueCell!13544 0))(
  ( (ValueCellFull!13544 (v!16943 V!43137)) (EmptyCell!13544) )
))
(declare-datatypes ((array!73919 0))(
  ( (array!73920 (arr!35604 (Array (_ BitVec 32) ValueCell!13544)) (size!36141 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73919)

(declare-fun e!646292 () Bool)

(declare-fun array_inv!27359 (array!73919) Bool)

(assert (=> start!98608 (and (array_inv!27359 _values!996) e!646292)))

(declare-fun b!1135416 () Bool)

(declare-fun res!757678 () Bool)

(assert (=> b!1135416 (=> (not res!757678) (not e!646293))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135416 (= res!757678 (validKeyInArray!0 k0!934))))

(declare-fun b!1135417 () Bool)

(declare-fun call!49334 () Bool)

(assert (=> b!1135417 call!49334))

(declare-datatypes ((Unit!37127 0))(
  ( (Unit!37128) )
))
(declare-fun lt!504542 () Unit!37127)

(declare-fun call!49338 () Unit!37127)

(assert (=> b!1135417 (= lt!504542 call!49338)))

(declare-fun e!646289 () Unit!37127)

(assert (=> b!1135417 (= e!646289 lt!504542)))

(declare-fun b!1135418 () Bool)

(declare-fun res!757676 () Bool)

(declare-fun e!646281 () Bool)

(assert (=> b!1135418 (=> res!757676 e!646281)))

(declare-datatypes ((List!24829 0))(
  ( (Nil!24826) (Cons!24825 (h!26043 (_ BitVec 64)) (t!35790 List!24829)) )
))
(declare-fun contains!6570 (List!24829 (_ BitVec 64)) Bool)

(assert (=> b!1135418 (= res!757676 (contains!6570 Nil!24826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135419 () Bool)

(assert (=> b!1135419 (= e!646281 true)))

(declare-fun lt!504535 () Bool)

(assert (=> b!1135419 (= lt!504535 (contains!6570 Nil!24826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135420 () Bool)

(declare-fun e!646283 () Unit!37127)

(declare-fun lt!504532 () Unit!37127)

(assert (=> b!1135420 (= e!646283 lt!504532)))

(declare-fun zeroValue!944 () V!43137)

(declare-datatypes ((tuple2!18062 0))(
  ( (tuple2!18063 (_1!9042 (_ BitVec 64)) (_2!9042 V!43137)) )
))
(declare-datatypes ((List!24830 0))(
  ( (Nil!24827) (Cons!24826 (h!26044 tuple2!18062) (t!35791 List!24830)) )
))
(declare-datatypes ((ListLongMap!16039 0))(
  ( (ListLongMap!16040 (toList!8035 List!24830)) )
))
(declare-fun lt!504539 () ListLongMap!16039)

(declare-fun lt!504528 () Unit!37127)

(declare-fun addStillContains!720 (ListLongMap!16039 (_ BitVec 64) V!43137 (_ BitVec 64)) Unit!37127)

(assert (=> b!1135420 (= lt!504528 (addStillContains!720 lt!504539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!504544 () ListLongMap!16039)

(declare-fun call!49335 () ListLongMap!16039)

(assert (=> b!1135420 (= lt!504544 call!49335)))

(declare-fun call!49337 () Bool)

(assert (=> b!1135420 call!49337))

(declare-fun call!49336 () Unit!37127)

(assert (=> b!1135420 (= lt!504532 call!49336)))

(declare-fun minValue!944 () V!43137)

(declare-fun contains!6571 (ListLongMap!16039 (_ BitVec 64)) Bool)

(declare-fun +!3494 (ListLongMap!16039 tuple2!18062) ListLongMap!16039)

(assert (=> b!1135420 (contains!6571 (+!3494 lt!504544 (tuple2!18063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!49328 () Bool)

(assert (=> bm!49328 (= call!49338 call!49336)))

(declare-fun b!1135421 () Bool)

(declare-fun c!111131 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504537 () Bool)

(assert (=> b!1135421 (= c!111131 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504537))))

(declare-fun e!646294 () Unit!37127)

(assert (=> b!1135421 (= e!646289 e!646294)))

(declare-fun e!646295 () Bool)

(declare-fun b!1135422 () Bool)

(declare-fun arrayContainsKey!0 (array!73917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135422 (= e!646295 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135423 () Bool)

(declare-fun res!757677 () Bool)

(assert (=> b!1135423 (=> (not res!757677) (not e!646293))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135423 (= res!757677 (validMask!0 mask!1564))))

(declare-fun b!1135424 () Bool)

(declare-fun e!646288 () Bool)

(declare-fun e!646285 () Bool)

(assert (=> b!1135424 (= e!646288 e!646285)))

(declare-fun res!757684 () Bool)

(assert (=> b!1135424 (=> res!757684 e!646285)))

(assert (=> b!1135424 (= res!757684 (not (contains!6571 lt!504539 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4549 (array!73917 array!73919 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 32) Int) ListLongMap!16039)

(assert (=> b!1135424 (= lt!504539 (getCurrentListMapNoExtraKeys!4549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135425 () Bool)

(declare-fun e!646296 () Bool)

(assert (=> b!1135425 (= e!646296 e!646288)))

(declare-fun res!757675 () Bool)

(assert (=> b!1135425 (=> res!757675 e!646288)))

(assert (=> b!1135425 (= res!757675 (not (= (select (arr!35603 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646290 () Bool)

(assert (=> b!1135425 e!646290))

(declare-fun c!111130 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135425 (= c!111130 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504531 () Unit!37127)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!443 (array!73917 array!73919 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37127)

(assert (=> b!1135425 (= lt!504531 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135426 () Bool)

(declare-fun res!757685 () Bool)

(assert (=> b!1135426 (=> res!757685 e!646281)))

(declare-fun noDuplicate!1603 (List!24829) Bool)

(assert (=> b!1135426 (= res!757685 (not (noDuplicate!1603 Nil!24826)))))

(declare-fun b!1135427 () Bool)

(declare-fun e!646282 () Bool)

(assert (=> b!1135427 (= e!646282 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44585 () Bool)

(declare-fun mapRes!44585 () Bool)

(assert (=> mapIsEmpty!44585 mapRes!44585))

(declare-fun bm!49329 () Bool)

(declare-fun call!49332 () ListLongMap!16039)

(assert (=> bm!49329 (= call!49332 call!49335)))

(declare-fun b!1135428 () Bool)

(declare-fun res!757673 () Bool)

(declare-fun e!646297 () Bool)

(assert (=> b!1135428 (=> (not res!757673) (not e!646297))))

(declare-fun lt!504533 () array!73917)

(declare-fun arrayNoDuplicates!0 (array!73917 (_ BitVec 32) List!24829) Bool)

(assert (=> b!1135428 (= res!757673 (arrayNoDuplicates!0 lt!504533 #b00000000000000000000000000000000 Nil!24826))))

(declare-fun b!1135429 () Bool)

(declare-fun e!646287 () Bool)

(assert (=> b!1135429 (= e!646292 (and e!646287 mapRes!44585))))

(declare-fun condMapEmpty!44585 () Bool)

(declare-fun mapDefault!44585 () ValueCell!13544)

(assert (=> b!1135429 (= condMapEmpty!44585 (= (arr!35604 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13544)) mapDefault!44585)))))

(declare-fun b!1135430 () Bool)

(assert (=> b!1135430 (= e!646293 e!646297)))

(declare-fun res!757689 () Bool)

(assert (=> b!1135430 (=> (not res!757689) (not e!646297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73917 (_ BitVec 32)) Bool)

(assert (=> b!1135430 (= res!757689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504533 mask!1564))))

(assert (=> b!1135430 (= lt!504533 (array!73918 (store (arr!35603 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36140 _keys!1208)))))

(declare-fun bm!49330 () Bool)

(declare-fun c!111132 () Bool)

(declare-fun c!111128 () Bool)

(assert (=> bm!49330 (= call!49336 (addStillContains!720 (ite c!111128 lt!504544 lt!504539) (ite c!111128 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111132 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111128 minValue!944 (ite c!111132 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!49331 () Bool)

(assert (=> bm!49331 (= call!49334 call!49337)))

(declare-fun b!1135431 () Bool)

(declare-fun res!757688 () Bool)

(assert (=> b!1135431 (=> (not res!757688) (not e!646293))))

(assert (=> b!1135431 (= res!757688 (and (= (size!36141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36140 _keys!1208) (size!36141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1135432 () Bool)

(declare-fun e!646284 () Bool)

(assert (=> b!1135432 (= e!646297 (not e!646284))))

(declare-fun res!757686 () Bool)

(assert (=> b!1135432 (=> res!757686 e!646284)))

(assert (=> b!1135432 (= res!757686 (bvsgt from!1455 i!673))))

(assert (=> b!1135432 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504541 () Unit!37127)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73917 (_ BitVec 64) (_ BitVec 32)) Unit!37127)

(assert (=> b!1135432 (= lt!504541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49332 () Bool)

(assert (=> bm!49332 (= call!49337 (contains!6571 (ite c!111128 lt!504544 call!49332) k0!934))))

(declare-fun b!1135433 () Bool)

(declare-fun res!757680 () Bool)

(assert (=> b!1135433 (=> (not res!757680) (not e!646293))))

(assert (=> b!1135433 (= res!757680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135434 () Bool)

(declare-fun res!757672 () Bool)

(assert (=> b!1135434 (=> (not res!757672) (not e!646293))))

(assert (=> b!1135434 (= res!757672 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36140 _keys!1208))))))

(declare-fun b!1135435 () Bool)

(assert (=> b!1135435 (= e!646284 e!646296)))

(declare-fun res!757681 () Bool)

(assert (=> b!1135435 (=> res!757681 e!646296)))

(assert (=> b!1135435 (= res!757681 (not (= from!1455 i!673)))))

(declare-fun lt!504534 () ListLongMap!16039)

(declare-fun lt!504540 () array!73919)

(assert (=> b!1135435 (= lt!504534 (getCurrentListMapNoExtraKeys!4549 lt!504533 lt!504540 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2605 (Int (_ BitVec 64)) V!43137)

(assert (=> b!1135435 (= lt!504540 (array!73920 (store (arr!35604 _values!996) i!673 (ValueCellFull!13544 (dynLambda!2605 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36141 _values!996)))))

(declare-fun lt!504543 () ListLongMap!16039)

(assert (=> b!1135435 (= lt!504543 (getCurrentListMapNoExtraKeys!4549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1135436 () Bool)

(declare-fun res!757687 () Bool)

(assert (=> b!1135436 (=> (not res!757687) (not e!646293))))

(assert (=> b!1135436 (= res!757687 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24826))))

(declare-fun mapNonEmpty!44585 () Bool)

(declare-fun tp!84641 () Bool)

(declare-fun e!646286 () Bool)

(assert (=> mapNonEmpty!44585 (= mapRes!44585 (and tp!84641 e!646286))))

(declare-fun mapRest!44585 () (Array (_ BitVec 32) ValueCell!13544))

(declare-fun mapValue!44585 () ValueCell!13544)

(declare-fun mapKey!44585 () (_ BitVec 32))

(assert (=> mapNonEmpty!44585 (= (arr!35604 _values!996) (store mapRest!44585 mapKey!44585 mapValue!44585))))

(declare-fun b!1135437 () Bool)

(declare-fun Unit!37129 () Unit!37127)

(assert (=> b!1135437 (= e!646294 Unit!37129)))

(declare-fun b!1135438 () Bool)

(declare-fun res!757682 () Bool)

(assert (=> b!1135438 (=> (not res!757682) (not e!646293))))

(assert (=> b!1135438 (= res!757682 (= (select (arr!35603 _keys!1208) i!673) k0!934))))

(declare-fun b!1135439 () Bool)

(declare-fun call!49333 () ListLongMap!16039)

(declare-fun call!49331 () ListLongMap!16039)

(assert (=> b!1135439 (= e!646290 (= call!49333 call!49331))))

(declare-fun bm!49333 () Bool)

(assert (=> bm!49333 (= call!49331 (getCurrentListMapNoExtraKeys!4549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135440 () Bool)

(declare-fun lt!504536 () Unit!37127)

(assert (=> b!1135440 (= e!646294 lt!504536)))

(assert (=> b!1135440 (= lt!504536 call!49338)))

(assert (=> b!1135440 call!49334))

(declare-fun b!1135441 () Bool)

(assert (=> b!1135441 (= e!646285 e!646281)))

(declare-fun res!757674 () Bool)

(assert (=> b!1135441 (=> res!757674 e!646281)))

(assert (=> b!1135441 (= res!757674 (or (bvsge (size!36140 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36140 _keys!1208)) (bvsge from!1455 (size!36140 _keys!1208))))))

(assert (=> b!1135441 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24826)))

(declare-fun lt!504530 () Unit!37127)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73917 (_ BitVec 32) (_ BitVec 32)) Unit!37127)

(assert (=> b!1135441 (= lt!504530 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135441 e!646282))

(declare-fun res!757683 () Bool)

(assert (=> b!1135441 (=> (not res!757683) (not e!646282))))

(assert (=> b!1135441 (= res!757683 e!646295)))

(declare-fun c!111129 () Bool)

(assert (=> b!1135441 (= c!111129 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504529 () Unit!37127)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!331 (array!73917 array!73919 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 64) (_ BitVec 32) Int) Unit!37127)

(assert (=> b!1135441 (= lt!504529 (lemmaListMapContainsThenArrayContainsFrom!331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504538 () Unit!37127)

(assert (=> b!1135441 (= lt!504538 e!646283)))

(assert (=> b!1135441 (= c!111128 (and (not lt!504537) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135441 (= lt!504537 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1135442 () Bool)

(assert (=> b!1135442 (= e!646287 tp_is_empty!28507)))

(declare-fun b!1135443 () Bool)

(declare-fun -!1187 (ListLongMap!16039 (_ BitVec 64)) ListLongMap!16039)

(assert (=> b!1135443 (= e!646290 (= call!49333 (-!1187 call!49331 k0!934)))))

(declare-fun b!1135444 () Bool)

(assert (=> b!1135444 (= e!646286 tp_is_empty!28507)))

(declare-fun bm!49334 () Bool)

(assert (=> bm!49334 (= call!49333 (getCurrentListMapNoExtraKeys!4549 lt!504533 lt!504540 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135445 () Bool)

(assert (=> b!1135445 (= e!646295 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504537) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49335 () Bool)

(assert (=> bm!49335 (= call!49335 (+!3494 lt!504539 (ite (or c!111128 c!111132) (tuple2!18063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1135446 () Bool)

(assert (=> b!1135446 (= e!646283 e!646289)))

(assert (=> b!1135446 (= c!111132 (and (not lt!504537) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!98608 res!757679) b!1135423))

(assert (= (and b!1135423 res!757677) b!1135431))

(assert (= (and b!1135431 res!757688) b!1135433))

(assert (= (and b!1135433 res!757680) b!1135436))

(assert (= (and b!1135436 res!757687) b!1135434))

(assert (= (and b!1135434 res!757672) b!1135416))

(assert (= (and b!1135416 res!757678) b!1135438))

(assert (= (and b!1135438 res!757682) b!1135430))

(assert (= (and b!1135430 res!757689) b!1135428))

(assert (= (and b!1135428 res!757673) b!1135432))

(assert (= (and b!1135432 (not res!757686)) b!1135435))

(assert (= (and b!1135435 (not res!757681)) b!1135425))

(assert (= (and b!1135425 c!111130) b!1135443))

(assert (= (and b!1135425 (not c!111130)) b!1135439))

(assert (= (or b!1135443 b!1135439) bm!49334))

(assert (= (or b!1135443 b!1135439) bm!49333))

(assert (= (and b!1135425 (not res!757675)) b!1135424))

(assert (= (and b!1135424 (not res!757684)) b!1135441))

(assert (= (and b!1135441 c!111128) b!1135420))

(assert (= (and b!1135441 (not c!111128)) b!1135446))

(assert (= (and b!1135446 c!111132) b!1135417))

(assert (= (and b!1135446 (not c!111132)) b!1135421))

(assert (= (and b!1135421 c!111131) b!1135440))

(assert (= (and b!1135421 (not c!111131)) b!1135437))

(assert (= (or b!1135417 b!1135440) bm!49328))

(assert (= (or b!1135417 b!1135440) bm!49329))

(assert (= (or b!1135417 b!1135440) bm!49331))

(assert (= (or b!1135420 bm!49331) bm!49332))

(assert (= (or b!1135420 bm!49328) bm!49330))

(assert (= (or b!1135420 bm!49329) bm!49335))

(assert (= (and b!1135441 c!111129) b!1135422))

(assert (= (and b!1135441 (not c!111129)) b!1135445))

(assert (= (and b!1135441 res!757683) b!1135427))

(assert (= (and b!1135441 (not res!757674)) b!1135426))

(assert (= (and b!1135426 (not res!757685)) b!1135418))

(assert (= (and b!1135418 (not res!757676)) b!1135419))

(assert (= (and b!1135429 condMapEmpty!44585) mapIsEmpty!44585))

(assert (= (and b!1135429 (not condMapEmpty!44585)) mapNonEmpty!44585))

(get-info :version)

(assert (= (and mapNonEmpty!44585 ((_ is ValueCellFull!13544) mapValue!44585)) b!1135444))

(assert (= (and b!1135429 ((_ is ValueCellFull!13544) mapDefault!44585)) b!1135442))

(assert (= start!98608 b!1135429))

(declare-fun b_lambda!19077 () Bool)

(assert (=> (not b_lambda!19077) (not b!1135435)))

(declare-fun t!35789 () Bool)

(declare-fun tb!8781 () Bool)

(assert (=> (and start!98608 (= defaultEntry!1004 defaultEntry!1004) t!35789) tb!8781))

(declare-fun result!18135 () Bool)

(assert (=> tb!8781 (= result!18135 tp_is_empty!28507)))

(assert (=> b!1135435 t!35789))

(declare-fun b_and!38807 () Bool)

(assert (= b_and!38805 (and (=> t!35789 result!18135) b_and!38807)))

(declare-fun m!1048587 () Bool)

(assert (=> b!1135418 m!1048587))

(declare-fun m!1048589 () Bool)

(assert (=> bm!49332 m!1048589))

(declare-fun m!1048591 () Bool)

(assert (=> b!1135432 m!1048591))

(declare-fun m!1048593 () Bool)

(assert (=> b!1135432 m!1048593))

(declare-fun m!1048595 () Bool)

(assert (=> b!1135430 m!1048595))

(declare-fun m!1048597 () Bool)

(assert (=> b!1135430 m!1048597))

(declare-fun m!1048599 () Bool)

(assert (=> b!1135441 m!1048599))

(declare-fun m!1048601 () Bool)

(assert (=> b!1135441 m!1048601))

(declare-fun m!1048603 () Bool)

(assert (=> b!1135441 m!1048603))

(declare-fun m!1048605 () Bool)

(assert (=> bm!49334 m!1048605))

(declare-fun m!1048607 () Bool)

(assert (=> bm!49330 m!1048607))

(declare-fun m!1048609 () Bool)

(assert (=> b!1135436 m!1048609))

(declare-fun m!1048611 () Bool)

(assert (=> b!1135422 m!1048611))

(declare-fun m!1048613 () Bool)

(assert (=> start!98608 m!1048613))

(declare-fun m!1048615 () Bool)

(assert (=> start!98608 m!1048615))

(declare-fun m!1048617 () Bool)

(assert (=> b!1135433 m!1048617))

(declare-fun m!1048619 () Bool)

(assert (=> b!1135424 m!1048619))

(declare-fun m!1048621 () Bool)

(assert (=> b!1135424 m!1048621))

(declare-fun m!1048623 () Bool)

(assert (=> b!1135423 m!1048623))

(declare-fun m!1048625 () Bool)

(assert (=> bm!49335 m!1048625))

(declare-fun m!1048627 () Bool)

(assert (=> b!1135425 m!1048627))

(declare-fun m!1048629 () Bool)

(assert (=> b!1135425 m!1048629))

(declare-fun m!1048631 () Bool)

(assert (=> b!1135435 m!1048631))

(declare-fun m!1048633 () Bool)

(assert (=> b!1135435 m!1048633))

(declare-fun m!1048635 () Bool)

(assert (=> b!1135435 m!1048635))

(declare-fun m!1048637 () Bool)

(assert (=> b!1135435 m!1048637))

(declare-fun m!1048639 () Bool)

(assert (=> b!1135443 m!1048639))

(declare-fun m!1048641 () Bool)

(assert (=> b!1135419 m!1048641))

(declare-fun m!1048643 () Bool)

(assert (=> b!1135428 m!1048643))

(declare-fun m!1048645 () Bool)

(assert (=> b!1135420 m!1048645))

(declare-fun m!1048647 () Bool)

(assert (=> b!1135420 m!1048647))

(assert (=> b!1135420 m!1048647))

(declare-fun m!1048649 () Bool)

(assert (=> b!1135420 m!1048649))

(declare-fun m!1048651 () Bool)

(assert (=> b!1135438 m!1048651))

(declare-fun m!1048653 () Bool)

(assert (=> b!1135416 m!1048653))

(declare-fun m!1048655 () Bool)

(assert (=> mapNonEmpty!44585 m!1048655))

(declare-fun m!1048657 () Bool)

(assert (=> b!1135426 m!1048657))

(assert (=> bm!49333 m!1048621))

(assert (=> b!1135427 m!1048611))

(check-sat (not b_next!23977) (not b!1135441) (not b!1135424) (not b!1135427) (not b!1135422) (not bm!49335) (not b!1135433) (not b!1135426) (not b!1135416) (not bm!49333) b_and!38807 (not b!1135435) (not bm!49330) (not b!1135430) (not b!1135428) (not start!98608) (not b!1135432) (not b!1135418) (not b!1135436) (not bm!49332) (not b!1135443) tp_is_empty!28507 (not b!1135420) (not b_lambda!19077) (not bm!49334) (not b!1135423) (not b!1135419) (not b!1135425) (not mapNonEmpty!44585))
(check-sat b_and!38807 (not b_next!23977))
