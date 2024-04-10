; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98818 () Bool)

(assert start!98818)

(declare-fun b_free!24423 () Bool)

(declare-fun b_next!24423 () Bool)

(assert (=> start!98818 (= b_free!24423 (not b_next!24423))))

(declare-fun tp!85980 () Bool)

(declare-fun b_and!39695 () Bool)

(assert (=> start!98818 (= tp!85980 b_and!39695)))

(declare-fun b!1154470 () Bool)

(declare-fun e!656575 () Bool)

(declare-fun e!656576 () Bool)

(assert (=> b!1154470 (= e!656575 (not e!656576))))

(declare-fun res!767188 () Bool)

(assert (=> b!1154470 (=> res!767188 e!656576)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154470 (= res!767188 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74753 0))(
  ( (array!74754 (arr!36027 (Array (_ BitVec 32) (_ BitVec 64))) (size!36563 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74753)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154470 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38002 0))(
  ( (Unit!38003) )
))
(declare-fun lt!517713 () Unit!38002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74753 (_ BitVec 64) (_ BitVec 32)) Unit!38002)

(assert (=> b!1154470 (= lt!517713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154471 () Bool)

(declare-fun call!54618 () Bool)

(assert (=> b!1154471 call!54618))

(declare-fun lt!517696 () Unit!38002)

(declare-fun call!54623 () Unit!38002)

(assert (=> b!1154471 (= lt!517696 call!54623)))

(declare-fun e!656573 () Unit!38002)

(assert (=> b!1154471 (= e!656573 lt!517696)))

(declare-fun b!1154472 () Bool)

(declare-fun res!767189 () Bool)

(declare-fun e!656579 () Bool)

(assert (=> b!1154472 (=> (not res!767189) (not e!656579))))

(declare-datatypes ((List!25218 0))(
  ( (Nil!25215) (Cons!25214 (h!26423 (_ BitVec 64)) (t!36633 List!25218)) )
))
(declare-fun arrayNoDuplicates!0 (array!74753 (_ BitVec 32) List!25218) Bool)

(assert (=> b!1154472 (= res!767189 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25215))))

(declare-datatypes ((V!43731 0))(
  ( (V!43732 (val!14533 Int)) )
))
(declare-fun zeroValue!944 () V!43731)

(declare-datatypes ((tuple2!18474 0))(
  ( (tuple2!18475 (_1!9248 (_ BitVec 64)) (_2!9248 V!43731)) )
))
(declare-datatypes ((List!25219 0))(
  ( (Nil!25216) (Cons!25215 (h!26424 tuple2!18474) (t!36634 List!25219)) )
))
(declare-datatypes ((ListLongMap!16443 0))(
  ( (ListLongMap!16444 (toList!8237 List!25219)) )
))
(declare-fun lt!517706 () ListLongMap!16443)

(declare-fun c!114665 () Bool)

(declare-fun call!54620 () ListLongMap!16443)

(declare-fun bm!54615 () Bool)

(declare-fun lt!517697 () ListLongMap!16443)

(declare-fun minValue!944 () V!43731)

(declare-fun c!114669 () Bool)

(declare-fun +!3650 (ListLongMap!16443 tuple2!18474) ListLongMap!16443)

(assert (=> bm!54615 (= call!54620 (+!3650 (ite c!114665 lt!517706 lt!517697) (ite c!114665 (tuple2!18475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114669 (tuple2!18475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!54616 () Bool)

(declare-fun call!54622 () Unit!38002)

(declare-fun addStillContains!896 (ListLongMap!16443 (_ BitVec 64) V!43731 (_ BitVec 64)) Unit!38002)

(assert (=> bm!54616 (= call!54622 (addStillContains!896 (ite c!114665 lt!517706 lt!517697) (ite c!114665 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114669 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114665 minValue!944 (ite c!114669 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1154473 () Bool)

(declare-fun e!656578 () Unit!38002)

(declare-fun Unit!38004 () Unit!38002)

(assert (=> b!1154473 (= e!656578 Unit!38004)))

(declare-fun b!1154474 () Bool)

(declare-fun e!656580 () Bool)

(declare-fun e!656572 () Bool)

(assert (=> b!1154474 (= e!656580 e!656572)))

(declare-fun res!767195 () Bool)

(assert (=> b!1154474 (=> res!767195 e!656572)))

(assert (=> b!1154474 (= res!767195 (not (= (select (arr!36027 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656582 () Bool)

(assert (=> b!1154474 e!656582))

(declare-fun c!114670 () Bool)

(assert (=> b!1154474 (= c!114670 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!517712 () Unit!38002)

(declare-datatypes ((ValueCell!13767 0))(
  ( (ValueCellFull!13767 (v!17170 V!43731)) (EmptyCell!13767) )
))
(declare-datatypes ((array!74755 0))(
  ( (array!74756 (arr!36028 (Array (_ BitVec 32) ValueCell!13767)) (size!36564 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74755)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!593 (array!74753 array!74755 (_ BitVec 32) (_ BitVec 32) V!43731 V!43731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38002)

(assert (=> b!1154474 (= lt!517712 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154475 () Bool)

(declare-fun res!767187 () Bool)

(assert (=> b!1154475 (=> (not res!767187) (not e!656579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154475 (= res!767187 (validMask!0 mask!1564))))

(declare-fun b!1154476 () Bool)

(declare-fun res!767186 () Bool)

(assert (=> b!1154476 (=> (not res!767186) (not e!656579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74753 (_ BitVec 32)) Bool)

(assert (=> b!1154476 (= res!767186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154477 () Bool)

(declare-fun contains!6750 (ListLongMap!16443 (_ BitVec 64)) Bool)

(assert (=> b!1154477 (contains!6750 call!54620 k0!934)))

(declare-fun lt!517695 () Unit!38002)

(assert (=> b!1154477 (= lt!517695 call!54622)))

(declare-fun call!54624 () Bool)

(assert (=> b!1154477 call!54624))

(assert (=> b!1154477 (= lt!517706 (+!3650 lt!517697 (tuple2!18475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517694 () Unit!38002)

(assert (=> b!1154477 (= lt!517694 (addStillContains!896 lt!517697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!656570 () Unit!38002)

(assert (=> b!1154477 (= e!656570 lt!517695)))

(declare-fun b!1154478 () Bool)

(assert (=> b!1154478 (= e!656576 e!656580)))

(declare-fun res!767196 () Bool)

(assert (=> b!1154478 (=> res!767196 e!656580)))

(assert (=> b!1154478 (= res!767196 (not (= from!1455 i!673)))))

(declare-fun lt!517702 () array!74753)

(declare-fun lt!517701 () array!74755)

(declare-fun lt!517703 () ListLongMap!16443)

(declare-fun getCurrentListMapNoExtraKeys!4706 (array!74753 array!74755 (_ BitVec 32) (_ BitVec 32) V!43731 V!43731 (_ BitVec 32) Int) ListLongMap!16443)

(assert (=> b!1154478 (= lt!517703 (getCurrentListMapNoExtraKeys!4706 lt!517702 lt!517701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517710 () V!43731)

(assert (=> b!1154478 (= lt!517701 (array!74756 (store (arr!36028 _values!996) i!673 (ValueCellFull!13767 lt!517710)) (size!36564 _values!996)))))

(declare-fun dynLambda!2719 (Int (_ BitVec 64)) V!43731)

(assert (=> b!1154478 (= lt!517710 (dynLambda!2719 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517704 () ListLongMap!16443)

(assert (=> b!1154478 (= lt!517704 (getCurrentListMapNoExtraKeys!4706 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154479 () Bool)

(declare-fun res!767194 () Bool)

(assert (=> b!1154479 (=> (not res!767194) (not e!656579))))

(assert (=> b!1154479 (= res!767194 (= (select (arr!36027 _keys!1208) i!673) k0!934))))

(declare-fun e!656574 () Bool)

(declare-fun lt!517693 () ListLongMap!16443)

(declare-fun b!1154480 () Bool)

(assert (=> b!1154480 (= e!656574 (= lt!517693 (getCurrentListMapNoExtraKeys!4706 lt!517702 lt!517701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapNonEmpty!45254 () Bool)

(declare-fun mapRes!45254 () Bool)

(declare-fun tp!85979 () Bool)

(declare-fun e!656571 () Bool)

(assert (=> mapNonEmpty!45254 (= mapRes!45254 (and tp!85979 e!656571))))

(declare-fun mapKey!45254 () (_ BitVec 32))

(declare-fun mapValue!45254 () ValueCell!13767)

(declare-fun mapRest!45254 () (Array (_ BitVec 32) ValueCell!13767))

(assert (=> mapNonEmpty!45254 (= (arr!36028 _values!996) (store mapRest!45254 mapKey!45254 mapValue!45254))))

(declare-fun b!1154481 () Bool)

(declare-fun e!656577 () Unit!38002)

(declare-fun lt!517708 () Unit!38002)

(assert (=> b!1154481 (= e!656577 lt!517708)))

(assert (=> b!1154481 (= lt!517708 call!54623)))

(assert (=> b!1154481 call!54618))

(declare-fun b!1154482 () Bool)

(assert (=> b!1154482 (= e!656572 true)))

(assert (=> b!1154482 e!656574))

(declare-fun res!767185 () Bool)

(assert (=> b!1154482 (=> (not res!767185) (not e!656574))))

(assert (=> b!1154482 (= res!767185 (= lt!517693 lt!517697))))

(declare-fun -!1358 (ListLongMap!16443 (_ BitVec 64)) ListLongMap!16443)

(assert (=> b!1154482 (= lt!517693 (-!1358 lt!517704 k0!934))))

(declare-fun lt!517705 () V!43731)

(assert (=> b!1154482 (= (-!1358 (+!3650 lt!517697 (tuple2!18475 (select (arr!36027 _keys!1208) from!1455) lt!517705)) (select (arr!36027 _keys!1208) from!1455)) lt!517697)))

(declare-fun lt!517692 () Unit!38002)

(declare-fun addThenRemoveForNewKeyIsSame!198 (ListLongMap!16443 (_ BitVec 64) V!43731) Unit!38002)

(assert (=> b!1154482 (= lt!517692 (addThenRemoveForNewKeyIsSame!198 lt!517697 (select (arr!36027 _keys!1208) from!1455) lt!517705))))

(declare-fun get!18352 (ValueCell!13767 V!43731) V!43731)

(assert (=> b!1154482 (= lt!517705 (get!18352 (select (arr!36028 _values!996) from!1455) lt!517710))))

(declare-fun lt!517709 () Unit!38002)

(assert (=> b!1154482 (= lt!517709 e!656578)))

(declare-fun c!114666 () Bool)

(assert (=> b!1154482 (= c!114666 (contains!6750 lt!517697 k0!934))))

(assert (=> b!1154482 (= lt!517697 (getCurrentListMapNoExtraKeys!4706 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154483 () Bool)

(assert (=> b!1154483 (= e!656577 e!656573)))

(declare-fun c!114668 () Bool)

(declare-fun lt!517699 () Bool)

(assert (=> b!1154483 (= c!114668 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517699))))

(declare-fun bm!54617 () Bool)

(assert (=> bm!54617 (= call!54618 call!54624)))

(declare-fun bm!54618 () Bool)

(declare-fun call!54621 () ListLongMap!16443)

(assert (=> bm!54618 (= call!54624 (contains!6750 (ite c!114665 lt!517706 call!54621) k0!934))))

(declare-fun bm!54619 () Bool)

(assert (=> bm!54619 (= call!54623 call!54622)))

(declare-fun b!1154484 () Bool)

(declare-fun res!767191 () Bool)

(assert (=> b!1154484 (=> (not res!767191) (not e!656579))))

(assert (=> b!1154484 (= res!767191 (and (= (size!36564 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36563 _keys!1208) (size!36564 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154485 () Bool)

(declare-fun call!54625 () ListLongMap!16443)

(declare-fun call!54619 () ListLongMap!16443)

(assert (=> b!1154485 (= e!656582 (= call!54625 call!54619))))

(declare-fun b!1154486 () Bool)

(declare-fun e!656584 () Bool)

(assert (=> b!1154486 (= e!656584 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154487 () Bool)

(assert (=> b!1154487 (= e!656582 (= call!54625 (-!1358 call!54619 k0!934)))))

(declare-fun bm!54620 () Bool)

(assert (=> bm!54620 (= call!54621 call!54620)))

(declare-fun b!1154488 () Bool)

(declare-fun res!767184 () Bool)

(assert (=> b!1154488 (=> (not res!767184) (not e!656579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154488 (= res!767184 (validKeyInArray!0 k0!934))))

(declare-fun b!1154489 () Bool)

(declare-fun res!767198 () Bool)

(assert (=> b!1154489 (=> (not res!767198) (not e!656579))))

(assert (=> b!1154489 (= res!767198 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36563 _keys!1208))))))

(declare-fun mapIsEmpty!45254 () Bool)

(assert (=> mapIsEmpty!45254 mapRes!45254))

(declare-fun res!767193 () Bool)

(assert (=> start!98818 (=> (not res!767193) (not e!656579))))

(assert (=> start!98818 (= res!767193 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36563 _keys!1208))))))

(assert (=> start!98818 e!656579))

(declare-fun tp_is_empty!28953 () Bool)

(assert (=> start!98818 tp_is_empty!28953))

(declare-fun array_inv!27574 (array!74753) Bool)

(assert (=> start!98818 (array_inv!27574 _keys!1208)))

(assert (=> start!98818 true))

(assert (=> start!98818 tp!85980))

(declare-fun e!656585 () Bool)

(declare-fun array_inv!27575 (array!74755) Bool)

(assert (=> start!98818 (and (array_inv!27575 _values!996) e!656585)))

(declare-fun b!1154490 () Bool)

(declare-fun e!656583 () Bool)

(assert (=> b!1154490 (= e!656583 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154491 () Bool)

(assert (=> b!1154491 (= e!656584 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517699) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154492 () Bool)

(declare-fun e!656586 () Bool)

(assert (=> b!1154492 (= e!656586 tp_is_empty!28953)))

(declare-fun bm!54621 () Bool)

(assert (=> bm!54621 (= call!54625 (getCurrentListMapNoExtraKeys!4706 lt!517702 lt!517701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154493 () Bool)

(assert (=> b!1154493 (= c!114669 (and (not lt!517699) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154493 (= e!656570 e!656577)))

(declare-fun b!1154494 () Bool)

(assert (=> b!1154494 (= e!656585 (and e!656586 mapRes!45254))))

(declare-fun condMapEmpty!45254 () Bool)

(declare-fun mapDefault!45254 () ValueCell!13767)

(assert (=> b!1154494 (= condMapEmpty!45254 (= (arr!36028 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13767)) mapDefault!45254)))))

(declare-fun b!1154495 () Bool)

(assert (=> b!1154495 (= e!656579 e!656575)))

(declare-fun res!767197 () Bool)

(assert (=> b!1154495 (=> (not res!767197) (not e!656575))))

(assert (=> b!1154495 (= res!767197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517702 mask!1564))))

(assert (=> b!1154495 (= lt!517702 (array!74754 (store (arr!36027 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36563 _keys!1208)))))

(declare-fun b!1154496 () Bool)

(declare-fun Unit!38005 () Unit!38002)

(assert (=> b!1154496 (= e!656573 Unit!38005)))

(declare-fun b!1154497 () Bool)

(declare-fun Unit!38006 () Unit!38002)

(assert (=> b!1154497 (= e!656578 Unit!38006)))

(assert (=> b!1154497 (= lt!517699 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154497 (= c!114665 (and (not lt!517699) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517698 () Unit!38002)

(assert (=> b!1154497 (= lt!517698 e!656570)))

(declare-fun lt!517700 () Unit!38002)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!486 (array!74753 array!74755 (_ BitVec 32) (_ BitVec 32) V!43731 V!43731 (_ BitVec 64) (_ BitVec 32) Int) Unit!38002)

(assert (=> b!1154497 (= lt!517700 (lemmaListMapContainsThenArrayContainsFrom!486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114667 () Bool)

(assert (=> b!1154497 (= c!114667 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767192 () Bool)

(assert (=> b!1154497 (= res!767192 e!656584)))

(assert (=> b!1154497 (=> (not res!767192) (not e!656583))))

(assert (=> b!1154497 e!656583))

(declare-fun lt!517711 () Unit!38002)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74753 (_ BitVec 32) (_ BitVec 32)) Unit!38002)

(assert (=> b!1154497 (= lt!517711 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154497 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25215)))

(declare-fun lt!517707 () Unit!38002)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74753 (_ BitVec 64) (_ BitVec 32) List!25218) Unit!38002)

(assert (=> b!1154497 (= lt!517707 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25215))))

(assert (=> b!1154497 false))

(declare-fun bm!54622 () Bool)

(assert (=> bm!54622 (= call!54619 (getCurrentListMapNoExtraKeys!4706 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154498 () Bool)

(assert (=> b!1154498 (= e!656571 tp_is_empty!28953)))

(declare-fun b!1154499 () Bool)

(declare-fun res!767190 () Bool)

(assert (=> b!1154499 (=> (not res!767190) (not e!656575))))

(assert (=> b!1154499 (= res!767190 (arrayNoDuplicates!0 lt!517702 #b00000000000000000000000000000000 Nil!25215))))

(assert (= (and start!98818 res!767193) b!1154475))

(assert (= (and b!1154475 res!767187) b!1154484))

(assert (= (and b!1154484 res!767191) b!1154476))

(assert (= (and b!1154476 res!767186) b!1154472))

(assert (= (and b!1154472 res!767189) b!1154489))

(assert (= (and b!1154489 res!767198) b!1154488))

(assert (= (and b!1154488 res!767184) b!1154479))

(assert (= (and b!1154479 res!767194) b!1154495))

(assert (= (and b!1154495 res!767197) b!1154499))

(assert (= (and b!1154499 res!767190) b!1154470))

(assert (= (and b!1154470 (not res!767188)) b!1154478))

(assert (= (and b!1154478 (not res!767196)) b!1154474))

(assert (= (and b!1154474 c!114670) b!1154487))

(assert (= (and b!1154474 (not c!114670)) b!1154485))

(assert (= (or b!1154487 b!1154485) bm!54621))

(assert (= (or b!1154487 b!1154485) bm!54622))

(assert (= (and b!1154474 (not res!767195)) b!1154482))

(assert (= (and b!1154482 c!114666) b!1154497))

(assert (= (and b!1154482 (not c!114666)) b!1154473))

(assert (= (and b!1154497 c!114665) b!1154477))

(assert (= (and b!1154497 (not c!114665)) b!1154493))

(assert (= (and b!1154493 c!114669) b!1154481))

(assert (= (and b!1154493 (not c!114669)) b!1154483))

(assert (= (and b!1154483 c!114668) b!1154471))

(assert (= (and b!1154483 (not c!114668)) b!1154496))

(assert (= (or b!1154481 b!1154471) bm!54619))

(assert (= (or b!1154481 b!1154471) bm!54620))

(assert (= (or b!1154481 b!1154471) bm!54617))

(assert (= (or b!1154477 bm!54617) bm!54618))

(assert (= (or b!1154477 bm!54619) bm!54616))

(assert (= (or b!1154477 bm!54620) bm!54615))

(assert (= (and b!1154497 c!114667) b!1154486))

(assert (= (and b!1154497 (not c!114667)) b!1154491))

(assert (= (and b!1154497 res!767192) b!1154490))

(assert (= (and b!1154482 res!767185) b!1154480))

(assert (= (and b!1154494 condMapEmpty!45254) mapIsEmpty!45254))

(assert (= (and b!1154494 (not condMapEmpty!45254)) mapNonEmpty!45254))

(get-info :version)

(assert (= (and mapNonEmpty!45254 ((_ is ValueCellFull!13767) mapValue!45254)) b!1154498))

(assert (= (and b!1154494 ((_ is ValueCellFull!13767) mapDefault!45254)) b!1154492))

(assert (= start!98818 b!1154494))

(declare-fun b_lambda!19529 () Bool)

(assert (=> (not b_lambda!19529) (not b!1154478)))

(declare-fun t!36632 () Bool)

(declare-fun tb!9235 () Bool)

(assert (=> (and start!98818 (= defaultEntry!1004 defaultEntry!1004) t!36632) tb!9235))

(declare-fun result!19035 () Bool)

(assert (=> tb!9235 (= result!19035 tp_is_empty!28953)))

(assert (=> b!1154478 t!36632))

(declare-fun b_and!39697 () Bool)

(assert (= b_and!39695 (and (=> t!36632 result!19035) b_and!39697)))

(declare-fun m!1064185 () Bool)

(assert (=> b!1154478 m!1064185))

(declare-fun m!1064187 () Bool)

(assert (=> b!1154478 m!1064187))

(declare-fun m!1064189 () Bool)

(assert (=> b!1154478 m!1064189))

(declare-fun m!1064191 () Bool)

(assert (=> b!1154478 m!1064191))

(declare-fun m!1064193 () Bool)

(assert (=> bm!54618 m!1064193))

(declare-fun m!1064195 () Bool)

(assert (=> b!1154475 m!1064195))

(declare-fun m!1064197 () Bool)

(assert (=> b!1154497 m!1064197))

(declare-fun m!1064199 () Bool)

(assert (=> b!1154497 m!1064199))

(declare-fun m!1064201 () Bool)

(assert (=> b!1154497 m!1064201))

(declare-fun m!1064203 () Bool)

(assert (=> b!1154497 m!1064203))

(declare-fun m!1064205 () Bool)

(assert (=> b!1154480 m!1064205))

(declare-fun m!1064207 () Bool)

(assert (=> b!1154486 m!1064207))

(declare-fun m!1064209 () Bool)

(assert (=> start!98818 m!1064209))

(declare-fun m!1064211 () Bool)

(assert (=> start!98818 m!1064211))

(declare-fun m!1064213 () Bool)

(assert (=> b!1154470 m!1064213))

(declare-fun m!1064215 () Bool)

(assert (=> b!1154470 m!1064215))

(declare-fun m!1064217 () Bool)

(assert (=> b!1154474 m!1064217))

(declare-fun m!1064219 () Bool)

(assert (=> b!1154474 m!1064219))

(declare-fun m!1064221 () Bool)

(assert (=> b!1154487 m!1064221))

(declare-fun m!1064223 () Bool)

(assert (=> b!1154488 m!1064223))

(declare-fun m!1064225 () Bool)

(assert (=> b!1154476 m!1064225))

(declare-fun m!1064227 () Bool)

(assert (=> bm!54616 m!1064227))

(declare-fun m!1064229 () Bool)

(assert (=> b!1154499 m!1064229))

(declare-fun m!1064231 () Bool)

(assert (=> mapNonEmpty!45254 m!1064231))

(declare-fun m!1064233 () Bool)

(assert (=> b!1154472 m!1064233))

(declare-fun m!1064235 () Bool)

(assert (=> bm!54615 m!1064235))

(declare-fun m!1064237 () Bool)

(assert (=> b!1154479 m!1064237))

(declare-fun m!1064239 () Bool)

(assert (=> b!1154477 m!1064239))

(declare-fun m!1064241 () Bool)

(assert (=> b!1154477 m!1064241))

(declare-fun m!1064243 () Bool)

(assert (=> b!1154477 m!1064243))

(declare-fun m!1064245 () Bool)

(assert (=> b!1154495 m!1064245))

(declare-fun m!1064247 () Bool)

(assert (=> b!1154495 m!1064247))

(assert (=> b!1154490 m!1064207))

(declare-fun m!1064249 () Bool)

(assert (=> b!1154482 m!1064249))

(declare-fun m!1064251 () Bool)

(assert (=> b!1154482 m!1064251))

(assert (=> b!1154482 m!1064217))

(declare-fun m!1064253 () Bool)

(assert (=> b!1154482 m!1064253))

(declare-fun m!1064255 () Bool)

(assert (=> b!1154482 m!1064255))

(declare-fun m!1064257 () Bool)

(assert (=> b!1154482 m!1064257))

(assert (=> b!1154482 m!1064251))

(assert (=> b!1154482 m!1064217))

(declare-fun m!1064259 () Bool)

(assert (=> b!1154482 m!1064259))

(declare-fun m!1064261 () Bool)

(assert (=> b!1154482 m!1064261))

(assert (=> b!1154482 m!1064217))

(assert (=> b!1154482 m!1064255))

(declare-fun m!1064263 () Bool)

(assert (=> b!1154482 m!1064263))

(assert (=> bm!54621 m!1064205))

(assert (=> bm!54622 m!1064249))

(check-sat b_and!39697 (not b!1154482) (not b!1154495) (not mapNonEmpty!45254) (not bm!54622) (not start!98818) tp_is_empty!28953 (not bm!54618) (not b!1154490) (not bm!54615) (not b!1154470) (not b!1154472) (not b_lambda!19529) (not bm!54616) (not b!1154480) (not b!1154488) (not b!1154475) (not b!1154499) (not b_next!24423) (not b!1154487) (not b!1154486) (not bm!54621) (not b!1154478) (not b!1154474) (not b!1154476) (not b!1154477) (not b!1154497))
(check-sat b_and!39697 (not b_next!24423))
