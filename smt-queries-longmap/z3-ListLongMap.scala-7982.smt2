; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98968 () Bool)

(assert start!98968)

(declare-fun b_free!24337 () Bool)

(declare-fun b_next!24337 () Bool)

(assert (=> start!98968 (= b_free!24337 (not b_next!24337))))

(declare-fun tp!85722 () Bool)

(declare-fun b_and!39525 () Bool)

(assert (=> start!98968 (= tp!85722 b_and!39525)))

(declare-fun b!1151803 () Bool)

(declare-fun e!655209 () Bool)

(assert (=> b!1151803 (= e!655209 true)))

(declare-fun e!655212 () Bool)

(assert (=> b!1151803 e!655212))

(declare-fun res!765757 () Bool)

(assert (=> b!1151803 (=> (not res!765757) (not e!655212))))

(declare-datatypes ((V!43617 0))(
  ( (V!43618 (val!14490 Int)) )
))
(declare-datatypes ((tuple2!18406 0))(
  ( (tuple2!18407 (_1!9214 (_ BitVec 64)) (_2!9214 V!43617)) )
))
(declare-datatypes ((List!25159 0))(
  ( (Nil!25156) (Cons!25155 (h!26373 tuple2!18406) (t!36480 List!25159)) )
))
(declare-datatypes ((ListLongMap!16383 0))(
  ( (ListLongMap!16384 (toList!8207 List!25159)) )
))
(declare-fun lt!515351 () ListLongMap!16383)

(declare-fun lt!515359 () ListLongMap!16383)

(assert (=> b!1151803 (= res!765757 (= lt!515351 lt!515359))))

(declare-fun lt!515350 () ListLongMap!16383)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1328 (ListLongMap!16383 (_ BitVec 64)) ListLongMap!16383)

(assert (=> b!1151803 (= lt!515351 (-!1328 lt!515350 k0!934))))

(declare-datatypes ((array!74627 0))(
  ( (array!74628 (arr!35958 (Array (_ BitVec 32) (_ BitVec 64))) (size!36495 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74627)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!515339 () V!43617)

(declare-fun +!3645 (ListLongMap!16383 tuple2!18406) ListLongMap!16383)

(assert (=> b!1151803 (= (-!1328 (+!3645 lt!515359 (tuple2!18407 (select (arr!35958 _keys!1208) from!1455) lt!515339)) (select (arr!35958 _keys!1208) from!1455)) lt!515359)))

(declare-datatypes ((Unit!37814 0))(
  ( (Unit!37815) )
))
(declare-fun lt!515357 () Unit!37814)

(declare-fun addThenRemoveForNewKeyIsSame!175 (ListLongMap!16383 (_ BitVec 64) V!43617) Unit!37814)

(assert (=> b!1151803 (= lt!515357 (addThenRemoveForNewKeyIsSame!175 lt!515359 (select (arr!35958 _keys!1208) from!1455) lt!515339))))

(declare-fun lt!515341 () V!43617)

(declare-datatypes ((ValueCell!13724 0))(
  ( (ValueCellFull!13724 (v!17123 V!43617)) (EmptyCell!13724) )
))
(declare-datatypes ((array!74629 0))(
  ( (array!74630 (arr!35959 (Array (_ BitVec 32) ValueCell!13724)) (size!36496 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74629)

(declare-fun get!18332 (ValueCell!13724 V!43617) V!43617)

(assert (=> b!1151803 (= lt!515339 (get!18332 (select (arr!35959 _values!996) from!1455) lt!515341))))

(declare-fun lt!515349 () Unit!37814)

(declare-fun e!655219 () Unit!37814)

(assert (=> b!1151803 (= lt!515349 e!655219)))

(declare-fun c!114291 () Bool)

(declare-fun contains!6742 (ListLongMap!16383 (_ BitVec 64)) Bool)

(assert (=> b!1151803 (= c!114291 (contains!6742 lt!515359 k0!934))))

(declare-fun zeroValue!944 () V!43617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43617)

(declare-fun getCurrentListMapNoExtraKeys!4707 (array!74627 array!74629 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 32) Int) ListLongMap!16383)

(assert (=> b!1151803 (= lt!515359 (getCurrentListMapNoExtraKeys!4707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151804 () Bool)

(declare-fun res!765766 () Bool)

(declare-fun e!655213 () Bool)

(assert (=> b!1151804 (=> (not res!765766) (not e!655213))))

(declare-datatypes ((List!25160 0))(
  ( (Nil!25157) (Cons!25156 (h!26374 (_ BitVec 64)) (t!36481 List!25160)) )
))
(declare-fun arrayNoDuplicates!0 (array!74627 (_ BitVec 32) List!25160) Bool)

(assert (=> b!1151804 (= res!765766 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25157))))

(declare-fun b!1151805 () Bool)

(declare-fun Unit!37816 () Unit!37814)

(assert (=> b!1151805 (= e!655219 Unit!37816)))

(declare-fun lt!515343 () array!74627)

(declare-fun lt!515352 () array!74629)

(declare-fun b!1151806 () Bool)

(assert (=> b!1151806 (= e!655212 (= lt!515351 (getCurrentListMapNoExtraKeys!4707 lt!515343 lt!515352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151807 () Bool)

(declare-fun res!765759 () Bool)

(assert (=> b!1151807 (=> (not res!765759) (not e!655213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151807 (= res!765759 (validMask!0 mask!1564))))

(declare-fun b!1151808 () Bool)

(declare-fun call!53658 () Bool)

(assert (=> b!1151808 call!53658))

(declare-fun lt!515358 () Unit!37814)

(declare-fun call!53656 () Unit!37814)

(assert (=> b!1151808 (= lt!515358 call!53656)))

(declare-fun e!655215 () Unit!37814)

(assert (=> b!1151808 (= e!655215 lt!515358)))

(declare-fun b!1151809 () Bool)

(declare-fun res!765760 () Bool)

(assert (=> b!1151809 (=> (not res!765760) (not e!655213))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151809 (= res!765760 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36495 _keys!1208))))))

(declare-fun call!53652 () ListLongMap!16383)

(declare-fun lt!515342 () ListLongMap!16383)

(declare-fun c!114294 () Bool)

(declare-fun call!53653 () Bool)

(declare-fun bm!53649 () Bool)

(assert (=> bm!53649 (= call!53653 (contains!6742 (ite c!114294 lt!515342 call!53652) k0!934))))

(declare-fun e!655221 () Bool)

(declare-fun b!1151810 () Bool)

(declare-fun arrayContainsKey!0 (array!74627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151810 (= e!655221 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151811 () Bool)

(declare-fun res!765771 () Bool)

(assert (=> b!1151811 (=> (not res!765771) (not e!655213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74627 (_ BitVec 32)) Bool)

(assert (=> b!1151811 (= res!765771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151812 () Bool)

(declare-fun e!655224 () Bool)

(declare-fun e!655217 () Bool)

(declare-fun mapRes!45125 () Bool)

(assert (=> b!1151812 (= e!655224 (and e!655217 mapRes!45125))))

(declare-fun condMapEmpty!45125 () Bool)

(declare-fun mapDefault!45125 () ValueCell!13724)

(assert (=> b!1151812 (= condMapEmpty!45125 (= (arr!35959 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13724)) mapDefault!45125)))))

(declare-fun b!1151813 () Bool)

(declare-fun e!655223 () Unit!37814)

(declare-fun lt!515356 () Unit!37814)

(assert (=> b!1151813 (= e!655223 lt!515356)))

(assert (=> b!1151813 (= lt!515356 call!53656)))

(assert (=> b!1151813 call!53658))

(declare-fun mapNonEmpty!45125 () Bool)

(declare-fun tp!85721 () Bool)

(declare-fun e!655214 () Bool)

(assert (=> mapNonEmpty!45125 (= mapRes!45125 (and tp!85721 e!655214))))

(declare-fun mapValue!45125 () ValueCell!13724)

(declare-fun mapRest!45125 () (Array (_ BitVec 32) ValueCell!13724))

(declare-fun mapKey!45125 () (_ BitVec 32))

(assert (=> mapNonEmpty!45125 (= (arr!35959 _values!996) (store mapRest!45125 mapKey!45125 mapValue!45125))))

(declare-fun lt!515340 () Bool)

(declare-fun b!1151814 () Bool)

(assert (=> b!1151814 (= e!655221 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515340) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151815 () Bool)

(declare-fun e!655225 () Bool)

(assert (=> b!1151815 (= e!655225 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53650 () Bool)

(declare-fun call!53651 () ListLongMap!16383)

(assert (=> bm!53650 (= call!53651 (getCurrentListMapNoExtraKeys!4707 lt!515343 lt!515352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53651 () Bool)

(declare-fun call!53657 () ListLongMap!16383)

(assert (=> bm!53651 (= call!53652 call!53657)))

(declare-fun e!655222 () Bool)

(declare-fun b!1151816 () Bool)

(declare-fun call!53655 () ListLongMap!16383)

(assert (=> b!1151816 (= e!655222 (= call!53651 (-!1328 call!53655 k0!934)))))

(declare-fun b!1151817 () Bool)

(declare-fun e!655218 () Bool)

(assert (=> b!1151817 (= e!655213 e!655218)))

(declare-fun res!765769 () Bool)

(assert (=> b!1151817 (=> (not res!765769) (not e!655218))))

(assert (=> b!1151817 (= res!765769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515343 mask!1564))))

(assert (=> b!1151817 (= lt!515343 (array!74628 (store (arr!35958 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36495 _keys!1208)))))

(declare-fun bm!53652 () Bool)

(assert (=> bm!53652 (= call!53658 call!53653)))

(declare-fun b!1151818 () Bool)

(declare-fun e!655210 () Bool)

(assert (=> b!1151818 (= e!655210 e!655209)))

(declare-fun res!765765 () Bool)

(assert (=> b!1151818 (=> res!765765 e!655209)))

(assert (=> b!1151818 (= res!765765 (not (= (select (arr!35958 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151818 e!655222))

(declare-fun c!114292 () Bool)

(assert (=> b!1151818 (= c!114292 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515353 () Unit!37814)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!572 (array!74627 array!74629 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37814)

(assert (=> b!1151818 (= lt!515353 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151819 () Bool)

(declare-fun res!765763 () Bool)

(assert (=> b!1151819 (=> (not res!765763) (not e!655218))))

(assert (=> b!1151819 (= res!765763 (arrayNoDuplicates!0 lt!515343 #b00000000000000000000000000000000 Nil!25157))))

(declare-fun bm!53648 () Bool)

(declare-fun call!53654 () Unit!37814)

(assert (=> bm!53648 (= call!53656 call!53654)))

(declare-fun res!765758 () Bool)

(assert (=> start!98968 (=> (not res!765758) (not e!655213))))

(assert (=> start!98968 (= res!765758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36495 _keys!1208))))))

(assert (=> start!98968 e!655213))

(declare-fun tp_is_empty!28867 () Bool)

(assert (=> start!98968 tp_is_empty!28867))

(declare-fun array_inv!27590 (array!74627) Bool)

(assert (=> start!98968 (array_inv!27590 _keys!1208)))

(assert (=> start!98968 true))

(assert (=> start!98968 tp!85722))

(declare-fun array_inv!27591 (array!74629) Bool)

(assert (=> start!98968 (and (array_inv!27591 _values!996) e!655224)))

(declare-fun b!1151820 () Bool)

(declare-fun e!655211 () Bool)

(assert (=> b!1151820 (= e!655218 (not e!655211))))

(declare-fun res!765764 () Bool)

(assert (=> b!1151820 (=> res!765764 e!655211)))

(assert (=> b!1151820 (= res!765764 (bvsgt from!1455 i!673))))

(assert (=> b!1151820 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515345 () Unit!37814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74627 (_ BitVec 64) (_ BitVec 32)) Unit!37814)

(assert (=> b!1151820 (= lt!515345 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151821 () Bool)

(declare-fun res!765768 () Bool)

(assert (=> b!1151821 (=> (not res!765768) (not e!655213))))

(assert (=> b!1151821 (= res!765768 (= (select (arr!35958 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45125 () Bool)

(assert (=> mapIsEmpty!45125 mapRes!45125))

(declare-fun b!1151822 () Bool)

(declare-fun res!765767 () Bool)

(assert (=> b!1151822 (=> (not res!765767) (not e!655213))))

(assert (=> b!1151822 (= res!765767 (and (= (size!36496 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36495 _keys!1208) (size!36496 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151823 () Bool)

(assert (=> b!1151823 (= e!655222 (= call!53651 call!53655))))

(declare-fun b!1151824 () Bool)

(declare-fun Unit!37817 () Unit!37814)

(assert (=> b!1151824 (= e!655215 Unit!37817)))

(declare-fun b!1151825 () Bool)

(declare-fun c!114293 () Bool)

(assert (=> b!1151825 (= c!114293 (and (not lt!515340) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655216 () Unit!37814)

(assert (=> b!1151825 (= e!655216 e!655223)))

(declare-fun b!1151826 () Bool)

(assert (=> b!1151826 (= e!655223 e!655215)))

(declare-fun c!114290 () Bool)

(assert (=> b!1151826 (= c!114290 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515340))))

(declare-fun b!1151827 () Bool)

(assert (=> b!1151827 (= e!655217 tp_is_empty!28867)))

(declare-fun b!1151828 () Bool)

(declare-fun Unit!37818 () Unit!37814)

(assert (=> b!1151828 (= e!655219 Unit!37818)))

(assert (=> b!1151828 (= lt!515340 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151828 (= c!114294 (and (not lt!515340) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515347 () Unit!37814)

(assert (=> b!1151828 (= lt!515347 e!655216)))

(declare-fun lt!515354 () Unit!37814)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!464 (array!74627 array!74629 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 64) (_ BitVec 32) Int) Unit!37814)

(assert (=> b!1151828 (= lt!515354 (lemmaListMapContainsThenArrayContainsFrom!464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114289 () Bool)

(assert (=> b!1151828 (= c!114289 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765770 () Bool)

(assert (=> b!1151828 (= res!765770 e!655221)))

(assert (=> b!1151828 (=> (not res!765770) (not e!655225))))

(assert (=> b!1151828 e!655225))

(declare-fun lt!515344 () Unit!37814)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74627 (_ BitVec 32) (_ BitVec 32)) Unit!37814)

(assert (=> b!1151828 (= lt!515344 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151828 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25157)))

(declare-fun lt!515348 () Unit!37814)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74627 (_ BitVec 64) (_ BitVec 32) List!25160) Unit!37814)

(assert (=> b!1151828 (= lt!515348 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25157))))

(assert (=> b!1151828 false))

(declare-fun bm!53653 () Bool)

(assert (=> bm!53653 (= call!53655 (getCurrentListMapNoExtraKeys!4707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151829 () Bool)

(assert (=> b!1151829 (contains!6742 (+!3645 lt!515342 (tuple2!18407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!515346 () Unit!37814)

(declare-fun addStillContains!869 (ListLongMap!16383 (_ BitVec 64) V!43617 (_ BitVec 64)) Unit!37814)

(assert (=> b!1151829 (= lt!515346 (addStillContains!869 lt!515342 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1151829 call!53653))

(assert (=> b!1151829 (= lt!515342 call!53657)))

(declare-fun lt!515338 () Unit!37814)

(assert (=> b!1151829 (= lt!515338 call!53654)))

(assert (=> b!1151829 (= e!655216 lt!515346)))

(declare-fun b!1151830 () Bool)

(declare-fun res!765762 () Bool)

(assert (=> b!1151830 (=> (not res!765762) (not e!655213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151830 (= res!765762 (validKeyInArray!0 k0!934))))

(declare-fun bm!53654 () Bool)

(assert (=> bm!53654 (= call!53654 (addStillContains!869 lt!515359 (ite (or c!114294 c!114293) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114294 c!114293) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1151831 () Bool)

(assert (=> b!1151831 (= e!655214 tp_is_empty!28867)))

(declare-fun b!1151832 () Bool)

(assert (=> b!1151832 (= e!655211 e!655210)))

(declare-fun res!765761 () Bool)

(assert (=> b!1151832 (=> res!765761 e!655210)))

(assert (=> b!1151832 (= res!765761 (not (= from!1455 i!673)))))

(declare-fun lt!515355 () ListLongMap!16383)

(assert (=> b!1151832 (= lt!515355 (getCurrentListMapNoExtraKeys!4707 lt!515343 lt!515352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151832 (= lt!515352 (array!74630 (store (arr!35959 _values!996) i!673 (ValueCellFull!13724 lt!515341)) (size!36496 _values!996)))))

(declare-fun dynLambda!2730 (Int (_ BitVec 64)) V!43617)

(assert (=> b!1151832 (= lt!515341 (dynLambda!2730 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151832 (= lt!515350 (getCurrentListMapNoExtraKeys!4707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53655 () Bool)

(assert (=> bm!53655 (= call!53657 (+!3645 lt!515359 (ite (or c!114294 c!114293) (tuple2!18407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98968 res!765758) b!1151807))

(assert (= (and b!1151807 res!765759) b!1151822))

(assert (= (and b!1151822 res!765767) b!1151811))

(assert (= (and b!1151811 res!765771) b!1151804))

(assert (= (and b!1151804 res!765766) b!1151809))

(assert (= (and b!1151809 res!765760) b!1151830))

(assert (= (and b!1151830 res!765762) b!1151821))

(assert (= (and b!1151821 res!765768) b!1151817))

(assert (= (and b!1151817 res!765769) b!1151819))

(assert (= (and b!1151819 res!765763) b!1151820))

(assert (= (and b!1151820 (not res!765764)) b!1151832))

(assert (= (and b!1151832 (not res!765761)) b!1151818))

(assert (= (and b!1151818 c!114292) b!1151816))

(assert (= (and b!1151818 (not c!114292)) b!1151823))

(assert (= (or b!1151816 b!1151823) bm!53650))

(assert (= (or b!1151816 b!1151823) bm!53653))

(assert (= (and b!1151818 (not res!765765)) b!1151803))

(assert (= (and b!1151803 c!114291) b!1151828))

(assert (= (and b!1151803 (not c!114291)) b!1151805))

(assert (= (and b!1151828 c!114294) b!1151829))

(assert (= (and b!1151828 (not c!114294)) b!1151825))

(assert (= (and b!1151825 c!114293) b!1151813))

(assert (= (and b!1151825 (not c!114293)) b!1151826))

(assert (= (and b!1151826 c!114290) b!1151808))

(assert (= (and b!1151826 (not c!114290)) b!1151824))

(assert (= (or b!1151813 b!1151808) bm!53648))

(assert (= (or b!1151813 b!1151808) bm!53651))

(assert (= (or b!1151813 b!1151808) bm!53652))

(assert (= (or b!1151829 bm!53652) bm!53649))

(assert (= (or b!1151829 bm!53648) bm!53654))

(assert (= (or b!1151829 bm!53651) bm!53655))

(assert (= (and b!1151828 c!114289) b!1151810))

(assert (= (and b!1151828 (not c!114289)) b!1151814))

(assert (= (and b!1151828 res!765770) b!1151815))

(assert (= (and b!1151803 res!765757) b!1151806))

(assert (= (and b!1151812 condMapEmpty!45125) mapIsEmpty!45125))

(assert (= (and b!1151812 (not condMapEmpty!45125)) mapNonEmpty!45125))

(get-info :version)

(assert (= (and mapNonEmpty!45125 ((_ is ValueCellFull!13724) mapValue!45125)) b!1151831))

(assert (= (and b!1151812 ((_ is ValueCellFull!13724) mapDefault!45125)) b!1151827))

(assert (= start!98968 b!1151812))

(declare-fun b_lambda!19437 () Bool)

(assert (=> (not b_lambda!19437) (not b!1151832)))

(declare-fun t!36479 () Bool)

(declare-fun tb!9141 () Bool)

(assert (=> (and start!98968 (= defaultEntry!1004 defaultEntry!1004) t!36479) tb!9141))

(declare-fun result!18855 () Bool)

(assert (=> tb!9141 (= result!18855 tp_is_empty!28867)))

(assert (=> b!1151832 t!36479))

(declare-fun b_and!39527 () Bool)

(assert (= b_and!39525 (and (=> t!36479 result!18855) b_and!39527)))

(declare-fun m!1062313 () Bool)

(assert (=> start!98968 m!1062313))

(declare-fun m!1062315 () Bool)

(assert (=> start!98968 m!1062315))

(declare-fun m!1062317 () Bool)

(assert (=> b!1151810 m!1062317))

(declare-fun m!1062319 () Bool)

(assert (=> b!1151819 m!1062319))

(declare-fun m!1062321 () Bool)

(assert (=> b!1151829 m!1062321))

(assert (=> b!1151829 m!1062321))

(declare-fun m!1062323 () Bool)

(assert (=> b!1151829 m!1062323))

(declare-fun m!1062325 () Bool)

(assert (=> b!1151829 m!1062325))

(declare-fun m!1062327 () Bool)

(assert (=> b!1151803 m!1062327))

(declare-fun m!1062329 () Bool)

(assert (=> b!1151803 m!1062329))

(declare-fun m!1062331 () Bool)

(assert (=> b!1151803 m!1062331))

(declare-fun m!1062333 () Bool)

(assert (=> b!1151803 m!1062333))

(assert (=> b!1151803 m!1062327))

(declare-fun m!1062335 () Bool)

(assert (=> b!1151803 m!1062335))

(assert (=> b!1151803 m!1062333))

(declare-fun m!1062337 () Bool)

(assert (=> b!1151803 m!1062337))

(declare-fun m!1062339 () Bool)

(assert (=> b!1151803 m!1062339))

(assert (=> b!1151803 m!1062337))

(declare-fun m!1062341 () Bool)

(assert (=> b!1151803 m!1062341))

(assert (=> b!1151803 m!1062337))

(declare-fun m!1062343 () Bool)

(assert (=> b!1151803 m!1062343))

(declare-fun m!1062345 () Bool)

(assert (=> b!1151816 m!1062345))

(declare-fun m!1062347 () Bool)

(assert (=> b!1151817 m!1062347))

(declare-fun m!1062349 () Bool)

(assert (=> b!1151817 m!1062349))

(assert (=> bm!53653 m!1062341))

(declare-fun m!1062351 () Bool)

(assert (=> b!1151828 m!1062351))

(declare-fun m!1062353 () Bool)

(assert (=> b!1151828 m!1062353))

(declare-fun m!1062355 () Bool)

(assert (=> b!1151828 m!1062355))

(declare-fun m!1062357 () Bool)

(assert (=> b!1151828 m!1062357))

(declare-fun m!1062359 () Bool)

(assert (=> mapNonEmpty!45125 m!1062359))

(declare-fun m!1062361 () Bool)

(assert (=> b!1151804 m!1062361))

(assert (=> b!1151815 m!1062317))

(declare-fun m!1062363 () Bool)

(assert (=> b!1151807 m!1062363))

(declare-fun m!1062365 () Bool)

(assert (=> bm!53650 m!1062365))

(assert (=> b!1151818 m!1062337))

(declare-fun m!1062367 () Bool)

(assert (=> b!1151818 m!1062367))

(assert (=> b!1151806 m!1062365))

(declare-fun m!1062369 () Bool)

(assert (=> b!1151811 m!1062369))

(declare-fun m!1062371 () Bool)

(assert (=> bm!53655 m!1062371))

(declare-fun m!1062373 () Bool)

(assert (=> b!1151821 m!1062373))

(declare-fun m!1062375 () Bool)

(assert (=> b!1151830 m!1062375))

(declare-fun m!1062377 () Bool)

(assert (=> b!1151820 m!1062377))

(declare-fun m!1062379 () Bool)

(assert (=> b!1151820 m!1062379))

(declare-fun m!1062381 () Bool)

(assert (=> b!1151832 m!1062381))

(declare-fun m!1062383 () Bool)

(assert (=> b!1151832 m!1062383))

(declare-fun m!1062385 () Bool)

(assert (=> b!1151832 m!1062385))

(declare-fun m!1062387 () Bool)

(assert (=> b!1151832 m!1062387))

(declare-fun m!1062389 () Bool)

(assert (=> bm!53654 m!1062389))

(declare-fun m!1062391 () Bool)

(assert (=> bm!53649 m!1062391))

(check-sat (not b!1151804) (not b!1151815) (not bm!53655) (not b!1151820) (not b!1151816) (not b_next!24337) (not b!1151817) (not bm!53649) (not bm!53650) (not bm!53654) (not b!1151830) (not b!1151806) (not b!1151819) (not b!1151832) (not b!1151811) (not b_lambda!19437) (not b!1151828) (not start!98968) (not b!1151818) b_and!39527 (not bm!53653) (not b!1151803) tp_is_empty!28867 (not b!1151807) (not b!1151810) (not b!1151829) (not mapNonEmpty!45125))
(check-sat b_and!39527 (not b_next!24337))
