; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98824 () Bool)

(assert start!98824)

(declare-fun b_free!24193 () Bool)

(declare-fun b_next!24193 () Bool)

(assert (=> start!98824 (= b_free!24193 (not b_next!24193))))

(declare-fun tp!85290 () Bool)

(declare-fun b_and!39237 () Bool)

(assert (=> start!98824 (= tp!85290 b_and!39237)))

(declare-fun b!1145186 () Bool)

(declare-fun res!762532 () Bool)

(declare-fun e!651559 () Bool)

(assert (=> b!1145186 (=> (not res!762532) (not e!651559))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145186 (= res!762532 (validMask!0 mask!1564))))

(declare-fun b!1145187 () Bool)

(declare-fun res!762527 () Bool)

(assert (=> b!1145187 (=> (not res!762527) (not e!651559))))

(declare-datatypes ((array!74345 0))(
  ( (array!74346 (arr!35817 (Array (_ BitVec 32) (_ BitVec 64))) (size!36354 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74345)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1145187 (= res!762527 (= (select (arr!35817 _keys!1208) i!673) k0!934))))

(declare-fun bm!51920 () Bool)

(declare-fun call!51928 () Bool)

(declare-fun call!51930 () Bool)

(assert (=> bm!51920 (= call!51928 call!51930)))

(declare-fun mapIsEmpty!44909 () Bool)

(declare-fun mapRes!44909 () Bool)

(assert (=> mapIsEmpty!44909 mapRes!44909))

(declare-fun b!1145188 () Bool)

(declare-datatypes ((Unit!37521 0))(
  ( (Unit!37522) )
))
(declare-fun e!651557 () Unit!37521)

(declare-fun e!651548 () Unit!37521)

(assert (=> b!1145188 (= e!651557 e!651548)))

(declare-fun c!112997 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!510775 () Bool)

(assert (=> b!1145188 (= c!112997 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510775))))

(declare-fun e!651552 () Bool)

(declare-fun b!1145189 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145189 (= e!651552 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145190 () Bool)

(declare-fun res!762528 () Bool)

(declare-fun e!651544 () Bool)

(assert (=> b!1145190 (=> (not res!762528) (not e!651544))))

(declare-fun lt!510766 () array!74345)

(declare-datatypes ((List!25026 0))(
  ( (Nil!25023) (Cons!25022 (h!26240 (_ BitVec 64)) (t!36203 List!25026)) )
))
(declare-fun arrayNoDuplicates!0 (array!74345 (_ BitVec 32) List!25026) Bool)

(assert (=> b!1145190 (= res!762528 (arrayNoDuplicates!0 lt!510766 #b00000000000000000000000000000000 Nil!25023))))

(declare-fun b!1145191 () Bool)

(declare-fun res!762525 () Bool)

(assert (=> b!1145191 (=> (not res!762525) (not e!651559))))

(declare-datatypes ((V!43425 0))(
  ( (V!43426 (val!14418 Int)) )
))
(declare-datatypes ((ValueCell!13652 0))(
  ( (ValueCellFull!13652 (v!17051 V!43425)) (EmptyCell!13652) )
))
(declare-datatypes ((array!74347 0))(
  ( (array!74348 (arr!35818 (Array (_ BitVec 32) ValueCell!13652)) (size!36355 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74347)

(assert (=> b!1145191 (= res!762525 (and (= (size!36355 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36354 _keys!1208) (size!36355 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145192 () Bool)

(declare-fun e!651546 () Unit!37521)

(declare-fun Unit!37523 () Unit!37521)

(assert (=> b!1145192 (= e!651546 Unit!37523)))

(assert (=> b!1145192 (= lt!510775 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112993 () Bool)

(assert (=> b!1145192 (= c!112993 (and (not lt!510775) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510765 () Unit!37521)

(declare-fun e!651549 () Unit!37521)

(assert (=> b!1145192 (= lt!510765 e!651549)))

(declare-fun zeroValue!944 () V!43425)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43425)

(declare-fun lt!510773 () Unit!37521)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!408 (array!74345 array!74347 (_ BitVec 32) (_ BitVec 32) V!43425 V!43425 (_ BitVec 64) (_ BitVec 32) Int) Unit!37521)

(assert (=> b!1145192 (= lt!510773 (lemmaListMapContainsThenArrayContainsFrom!408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112996 () Bool)

(assert (=> b!1145192 (= c!112996 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762526 () Bool)

(declare-fun e!651553 () Bool)

(assert (=> b!1145192 (= res!762526 e!651553)))

(assert (=> b!1145192 (=> (not res!762526) (not e!651552))))

(assert (=> b!1145192 e!651552))

(declare-fun lt!510771 () Unit!37521)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74345 (_ BitVec 32) (_ BitVec 32)) Unit!37521)

(assert (=> b!1145192 (= lt!510771 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1145192 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25023)))

(declare-fun lt!510757 () Unit!37521)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74345 (_ BitVec 64) (_ BitVec 32) List!25026) Unit!37521)

(assert (=> b!1145192 (= lt!510757 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25023))))

(assert (=> b!1145192 false))

(declare-fun b!1145193 () Bool)

(declare-datatypes ((tuple2!18270 0))(
  ( (tuple2!18271 (_1!9146 (_ BitVec 64)) (_2!9146 V!43425)) )
))
(declare-datatypes ((List!25027 0))(
  ( (Nil!25024) (Cons!25023 (h!26241 tuple2!18270) (t!36204 List!25027)) )
))
(declare-datatypes ((ListLongMap!16247 0))(
  ( (ListLongMap!16248 (toList!8139 List!25027)) )
))
(declare-fun call!51925 () ListLongMap!16247)

(declare-fun contains!6683 (ListLongMap!16247 (_ BitVec 64)) Bool)

(assert (=> b!1145193 (contains!6683 call!51925 k0!934)))

(declare-fun lt!510769 () ListLongMap!16247)

(declare-fun lt!510761 () Unit!37521)

(declare-fun addStillContains!811 (ListLongMap!16247 (_ BitVec 64) V!43425 (_ BitVec 64)) Unit!37521)

(assert (=> b!1145193 (= lt!510761 (addStillContains!811 lt!510769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1145193 call!51930))

(declare-fun lt!510764 () ListLongMap!16247)

(declare-fun +!3584 (ListLongMap!16247 tuple2!18270) ListLongMap!16247)

(assert (=> b!1145193 (= lt!510769 (+!3584 lt!510764 (tuple2!18271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510770 () Unit!37521)

(declare-fun call!51929 () Unit!37521)

(assert (=> b!1145193 (= lt!510770 call!51929)))

(assert (=> b!1145193 (= e!651549 lt!510761)))

(declare-fun lt!510763 () array!74347)

(declare-fun call!51927 () ListLongMap!16247)

(declare-fun bm!51921 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4644 (array!74345 array!74347 (_ BitVec 32) (_ BitVec 32) V!43425 V!43425 (_ BitVec 32) Int) ListLongMap!16247)

(assert (=> bm!51921 (= call!51927 (getCurrentListMapNoExtraKeys!4644 lt!510766 lt!510763 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145194 () Bool)

(declare-fun c!112998 () Bool)

(assert (=> b!1145194 (= c!112998 (and (not lt!510775) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145194 (= e!651549 e!651557)))

(declare-fun b!1145195 () Bool)

(declare-fun e!651545 () Bool)

(declare-fun e!651555 () Bool)

(assert (=> b!1145195 (= e!651545 e!651555)))

(declare-fun res!762536 () Bool)

(assert (=> b!1145195 (=> res!762536 e!651555)))

(assert (=> b!1145195 (= res!762536 (not (= from!1455 i!673)))))

(declare-fun lt!510760 () ListLongMap!16247)

(assert (=> b!1145195 (= lt!510760 (getCurrentListMapNoExtraKeys!4644 lt!510766 lt!510763 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510772 () V!43425)

(assert (=> b!1145195 (= lt!510763 (array!74348 (store (arr!35818 _values!996) i!673 (ValueCellFull!13652 lt!510772)) (size!36355 _values!996)))))

(declare-fun dynLambda!2677 (Int (_ BitVec 64)) V!43425)

(assert (=> b!1145195 (= lt!510772 (dynLambda!2677 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510774 () ListLongMap!16247)

(assert (=> b!1145195 (= lt!510774 (getCurrentListMapNoExtraKeys!4644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145196 () Bool)

(declare-fun Unit!37524 () Unit!37521)

(assert (=> b!1145196 (= e!651546 Unit!37524)))

(declare-fun b!1145197 () Bool)

(assert (=> b!1145197 call!51928))

(declare-fun lt!510768 () Unit!37521)

(declare-fun call!51923 () Unit!37521)

(assert (=> b!1145197 (= lt!510768 call!51923)))

(assert (=> b!1145197 (= e!651548 lt!510768)))

(declare-fun call!51926 () ListLongMap!16247)

(declare-fun bm!51922 () Bool)

(assert (=> bm!51922 (= call!51930 (contains!6683 (ite c!112993 lt!510769 call!51926) k0!934))))

(declare-fun b!1145198 () Bool)

(declare-fun e!651547 () Bool)

(assert (=> b!1145198 (= e!651547 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36354 _keys!1208))))))

(declare-fun lt!510759 () V!43425)

(declare-fun -!1268 (ListLongMap!16247 (_ BitVec 64)) ListLongMap!16247)

(assert (=> b!1145198 (= (-!1268 (+!3584 lt!510764 (tuple2!18271 (select (arr!35817 _keys!1208) from!1455) lt!510759)) (select (arr!35817 _keys!1208) from!1455)) lt!510764)))

(declare-fun lt!510758 () Unit!37521)

(declare-fun addThenRemoveForNewKeyIsSame!125 (ListLongMap!16247 (_ BitVec 64) V!43425) Unit!37521)

(assert (=> b!1145198 (= lt!510758 (addThenRemoveForNewKeyIsSame!125 lt!510764 (select (arr!35817 _keys!1208) from!1455) lt!510759))))

(declare-fun get!18234 (ValueCell!13652 V!43425) V!43425)

(assert (=> b!1145198 (= lt!510759 (get!18234 (select (arr!35818 _values!996) from!1455) lt!510772))))

(declare-fun lt!510755 () Unit!37521)

(assert (=> b!1145198 (= lt!510755 e!651546)))

(declare-fun c!112995 () Bool)

(assert (=> b!1145198 (= c!112995 (contains!6683 lt!510764 k0!934))))

(assert (=> b!1145198 (= lt!510764 (getCurrentListMapNoExtraKeys!4644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145199 () Bool)

(declare-fun res!762529 () Bool)

(assert (=> b!1145199 (=> (not res!762529) (not e!651559))))

(assert (=> b!1145199 (= res!762529 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25023))))

(declare-fun bm!51923 () Bool)

(assert (=> bm!51923 (= call!51925 (+!3584 (ite c!112993 lt!510769 lt!510764) (ite c!112993 (tuple2!18271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112998 (tuple2!18271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1145200 () Bool)

(declare-fun e!651550 () Bool)

(declare-fun e!651551 () Bool)

(assert (=> b!1145200 (= e!651550 (and e!651551 mapRes!44909))))

(declare-fun condMapEmpty!44909 () Bool)

(declare-fun mapDefault!44909 () ValueCell!13652)

(assert (=> b!1145200 (= condMapEmpty!44909 (= (arr!35818 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13652)) mapDefault!44909)))))

(declare-fun b!1145201 () Bool)

(assert (=> b!1145201 (= e!651544 (not e!651545))))

(declare-fun res!762533 () Bool)

(assert (=> b!1145201 (=> res!762533 e!651545)))

(assert (=> b!1145201 (= res!762533 (bvsgt from!1455 i!673))))

(assert (=> b!1145201 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510756 () Unit!37521)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74345 (_ BitVec 64) (_ BitVec 32)) Unit!37521)

(assert (=> b!1145201 (= lt!510756 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145202 () Bool)

(assert (=> b!1145202 (= e!651555 e!651547)))

(declare-fun res!762534 () Bool)

(assert (=> b!1145202 (=> res!762534 e!651547)))

(assert (=> b!1145202 (= res!762534 (not (= (select (arr!35817 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651556 () Bool)

(assert (=> b!1145202 e!651556))

(declare-fun c!112994 () Bool)

(assert (=> b!1145202 (= c!112994 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510767 () Unit!37521)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!518 (array!74345 array!74347 (_ BitVec 32) (_ BitVec 32) V!43425 V!43425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37521)

(assert (=> b!1145202 (= lt!510767 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145203 () Bool)

(declare-fun res!762537 () Bool)

(assert (=> b!1145203 (=> (not res!762537) (not e!651559))))

(assert (=> b!1145203 (= res!762537 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36354 _keys!1208))))))

(declare-fun b!1145204 () Bool)

(declare-fun Unit!37525 () Unit!37521)

(assert (=> b!1145204 (= e!651548 Unit!37525)))

(declare-fun b!1145205 () Bool)

(declare-fun call!51924 () ListLongMap!16247)

(assert (=> b!1145205 (= e!651556 (= call!51927 call!51924))))

(declare-fun bm!51924 () Bool)

(assert (=> bm!51924 (= call!51923 call!51929)))

(declare-fun b!1145206 () Bool)

(assert (=> b!1145206 (= e!651553 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145207 () Bool)

(assert (=> b!1145207 (= e!651559 e!651544)))

(declare-fun res!762535 () Bool)

(assert (=> b!1145207 (=> (not res!762535) (not e!651544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74345 (_ BitVec 32)) Bool)

(assert (=> b!1145207 (= res!762535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510766 mask!1564))))

(assert (=> b!1145207 (= lt!510766 (array!74346 (store (arr!35817 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36354 _keys!1208)))))

(declare-fun bm!51925 () Bool)

(assert (=> bm!51925 (= call!51924 (getCurrentListMapNoExtraKeys!4644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51926 () Bool)

(assert (=> bm!51926 (= call!51929 (addStillContains!811 lt!510764 (ite (or c!112993 c!112998) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112993 c!112998) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1145208 () Bool)

(assert (=> b!1145208 (= e!651556 (= call!51927 (-!1268 call!51924 k0!934)))))

(declare-fun b!1145209 () Bool)

(assert (=> b!1145209 (= e!651553 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510775) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145210 () Bool)

(declare-fun lt!510762 () Unit!37521)

(assert (=> b!1145210 (= e!651557 lt!510762)))

(assert (=> b!1145210 (= lt!510762 call!51923)))

(assert (=> b!1145210 call!51928))

(declare-fun b!1145211 () Bool)

(declare-fun res!762531 () Bool)

(assert (=> b!1145211 (=> (not res!762531) (not e!651559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145211 (= res!762531 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44909 () Bool)

(declare-fun tp!85289 () Bool)

(declare-fun e!651558 () Bool)

(assert (=> mapNonEmpty!44909 (= mapRes!44909 (and tp!85289 e!651558))))

(declare-fun mapValue!44909 () ValueCell!13652)

(declare-fun mapRest!44909 () (Array (_ BitVec 32) ValueCell!13652))

(declare-fun mapKey!44909 () (_ BitVec 32))

(assert (=> mapNonEmpty!44909 (= (arr!35818 _values!996) (store mapRest!44909 mapKey!44909 mapValue!44909))))

(declare-fun b!1145212 () Bool)

(declare-fun tp_is_empty!28723 () Bool)

(assert (=> b!1145212 (= e!651551 tp_is_empty!28723)))

(declare-fun bm!51927 () Bool)

(assert (=> bm!51927 (= call!51926 call!51925)))

(declare-fun res!762524 () Bool)

(assert (=> start!98824 (=> (not res!762524) (not e!651559))))

(assert (=> start!98824 (= res!762524 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36354 _keys!1208))))))

(assert (=> start!98824 e!651559))

(assert (=> start!98824 tp_is_empty!28723))

(declare-fun array_inv!27492 (array!74345) Bool)

(assert (=> start!98824 (array_inv!27492 _keys!1208)))

(assert (=> start!98824 true))

(assert (=> start!98824 tp!85290))

(declare-fun array_inv!27493 (array!74347) Bool)

(assert (=> start!98824 (and (array_inv!27493 _values!996) e!651550)))

(declare-fun b!1145213 () Bool)

(declare-fun res!762530 () Bool)

(assert (=> b!1145213 (=> (not res!762530) (not e!651559))))

(assert (=> b!1145213 (= res!762530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145214 () Bool)

(assert (=> b!1145214 (= e!651558 tp_is_empty!28723)))

(assert (= (and start!98824 res!762524) b!1145186))

(assert (= (and b!1145186 res!762532) b!1145191))

(assert (= (and b!1145191 res!762525) b!1145213))

(assert (= (and b!1145213 res!762530) b!1145199))

(assert (= (and b!1145199 res!762529) b!1145203))

(assert (= (and b!1145203 res!762537) b!1145211))

(assert (= (and b!1145211 res!762531) b!1145187))

(assert (= (and b!1145187 res!762527) b!1145207))

(assert (= (and b!1145207 res!762535) b!1145190))

(assert (= (and b!1145190 res!762528) b!1145201))

(assert (= (and b!1145201 (not res!762533)) b!1145195))

(assert (= (and b!1145195 (not res!762536)) b!1145202))

(assert (= (and b!1145202 c!112994) b!1145208))

(assert (= (and b!1145202 (not c!112994)) b!1145205))

(assert (= (or b!1145208 b!1145205) bm!51921))

(assert (= (or b!1145208 b!1145205) bm!51925))

(assert (= (and b!1145202 (not res!762534)) b!1145198))

(assert (= (and b!1145198 c!112995) b!1145192))

(assert (= (and b!1145198 (not c!112995)) b!1145196))

(assert (= (and b!1145192 c!112993) b!1145193))

(assert (= (and b!1145192 (not c!112993)) b!1145194))

(assert (= (and b!1145194 c!112998) b!1145210))

(assert (= (and b!1145194 (not c!112998)) b!1145188))

(assert (= (and b!1145188 c!112997) b!1145197))

(assert (= (and b!1145188 (not c!112997)) b!1145204))

(assert (= (or b!1145210 b!1145197) bm!51924))

(assert (= (or b!1145210 b!1145197) bm!51927))

(assert (= (or b!1145210 b!1145197) bm!51920))

(assert (= (or b!1145193 bm!51920) bm!51922))

(assert (= (or b!1145193 bm!51924) bm!51926))

(assert (= (or b!1145193 bm!51927) bm!51923))

(assert (= (and b!1145192 c!112996) b!1145206))

(assert (= (and b!1145192 (not c!112996)) b!1145209))

(assert (= (and b!1145192 res!762526) b!1145189))

(assert (= (and b!1145200 condMapEmpty!44909) mapIsEmpty!44909))

(assert (= (and b!1145200 (not condMapEmpty!44909)) mapNonEmpty!44909))

(get-info :version)

(assert (= (and mapNonEmpty!44909 ((_ is ValueCellFull!13652) mapValue!44909)) b!1145214))

(assert (= (and b!1145200 ((_ is ValueCellFull!13652) mapDefault!44909)) b!1145212))

(assert (= start!98824 b!1145200))

(declare-fun b_lambda!19293 () Bool)

(assert (=> (not b_lambda!19293) (not b!1145195)))

(declare-fun t!36202 () Bool)

(declare-fun tb!8997 () Bool)

(assert (=> (and start!98824 (= defaultEntry!1004 defaultEntry!1004) t!36202) tb!8997))

(declare-fun result!18567 () Bool)

(assert (=> tb!8997 (= result!18567 tp_is_empty!28723)))

(assert (=> b!1145195 t!36202))

(declare-fun b_and!39239 () Bool)

(assert (= b_and!39237 (and (=> t!36202 result!18567) b_and!39239)))

(declare-fun m!1056557 () Bool)

(assert (=> b!1145208 m!1056557))

(declare-fun m!1056559 () Bool)

(assert (=> b!1145193 m!1056559))

(declare-fun m!1056561 () Bool)

(assert (=> b!1145193 m!1056561))

(declare-fun m!1056563 () Bool)

(assert (=> b!1145193 m!1056563))

(declare-fun m!1056565 () Bool)

(assert (=> bm!51921 m!1056565))

(declare-fun m!1056567 () Bool)

(assert (=> b!1145201 m!1056567))

(declare-fun m!1056569 () Bool)

(assert (=> b!1145201 m!1056569))

(declare-fun m!1056571 () Bool)

(assert (=> b!1145190 m!1056571))

(declare-fun m!1056573 () Bool)

(assert (=> b!1145213 m!1056573))

(declare-fun m!1056575 () Bool)

(assert (=> mapNonEmpty!44909 m!1056575))

(declare-fun m!1056577 () Bool)

(assert (=> b!1145199 m!1056577))

(declare-fun m!1056579 () Bool)

(assert (=> b!1145195 m!1056579))

(declare-fun m!1056581 () Bool)

(assert (=> b!1145195 m!1056581))

(declare-fun m!1056583 () Bool)

(assert (=> b!1145195 m!1056583))

(declare-fun m!1056585 () Bool)

(assert (=> b!1145195 m!1056585))

(declare-fun m!1056587 () Bool)

(assert (=> b!1145202 m!1056587))

(declare-fun m!1056589 () Bool)

(assert (=> b!1145202 m!1056589))

(declare-fun m!1056591 () Bool)

(assert (=> bm!51925 m!1056591))

(declare-fun m!1056593 () Bool)

(assert (=> bm!51923 m!1056593))

(declare-fun m!1056595 () Bool)

(assert (=> bm!51926 m!1056595))

(declare-fun m!1056597 () Bool)

(assert (=> b!1145192 m!1056597))

(declare-fun m!1056599 () Bool)

(assert (=> b!1145192 m!1056599))

(declare-fun m!1056601 () Bool)

(assert (=> b!1145192 m!1056601))

(declare-fun m!1056603 () Bool)

(assert (=> b!1145192 m!1056603))

(declare-fun m!1056605 () Bool)

(assert (=> b!1145211 m!1056605))

(declare-fun m!1056607 () Bool)

(assert (=> b!1145207 m!1056607))

(declare-fun m!1056609 () Bool)

(assert (=> b!1145207 m!1056609))

(declare-fun m!1056611 () Bool)

(assert (=> b!1145206 m!1056611))

(declare-fun m!1056613 () Bool)

(assert (=> b!1145187 m!1056613))

(declare-fun m!1056615 () Bool)

(assert (=> b!1145186 m!1056615))

(declare-fun m!1056617 () Bool)

(assert (=> bm!51922 m!1056617))

(assert (=> b!1145198 m!1056591))

(declare-fun m!1056619 () Bool)

(assert (=> b!1145198 m!1056619))

(assert (=> b!1145198 m!1056587))

(declare-fun m!1056621 () Bool)

(assert (=> b!1145198 m!1056621))

(declare-fun m!1056623 () Bool)

(assert (=> b!1145198 m!1056623))

(assert (=> b!1145198 m!1056587))

(declare-fun m!1056625 () Bool)

(assert (=> b!1145198 m!1056625))

(assert (=> b!1145198 m!1056619))

(declare-fun m!1056627 () Bool)

(assert (=> b!1145198 m!1056627))

(assert (=> b!1145198 m!1056623))

(assert (=> b!1145198 m!1056587))

(declare-fun m!1056629 () Bool)

(assert (=> b!1145198 m!1056629))

(declare-fun m!1056631 () Bool)

(assert (=> start!98824 m!1056631))

(declare-fun m!1056633 () Bool)

(assert (=> start!98824 m!1056633))

(assert (=> b!1145189 m!1056611))

(check-sat (not bm!51926) b_and!39239 (not b!1145199) (not bm!51923) (not bm!51925) (not b!1145192) (not b!1145207) (not mapNonEmpty!44909) (not b!1145195) (not b!1145186) (not b!1145211) (not b!1145198) (not b_next!24193) (not b!1145193) (not b!1145208) (not start!98824) (not b!1145206) (not bm!51921) (not b!1145213) (not b!1145201) (not bm!51922) (not b_lambda!19293) (not b!1145190) tp_is_empty!28723 (not b!1145202) (not b!1145189))
(check-sat b_and!39239 (not b_next!24193))
