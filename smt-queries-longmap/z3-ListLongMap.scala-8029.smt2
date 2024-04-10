; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99016 () Bool)

(assert start!99016)

(declare-fun b_free!24621 () Bool)

(declare-fun b_next!24621 () Bool)

(assert (=> start!99016 (= b_free!24621 (not b_next!24621))))

(declare-fun tp!86574 () Bool)

(declare-fun b_and!40091 () Bool)

(assert (=> start!99016 (= tp!86574 b_and!40091)))

(declare-fun b!1163578 () Bool)

(declare-fun res!771651 () Bool)

(declare-fun e!661624 () Bool)

(assert (=> b!1163578 (=> (not res!771651) (not e!661624))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163578 (= res!771651 (validKeyInArray!0 k0!934))))

(declare-fun b!1163579 () Bool)

(declare-fun e!661620 () Bool)

(declare-fun e!661621 () Bool)

(declare-fun mapRes!45551 () Bool)

(assert (=> b!1163579 (= e!661620 (and e!661621 mapRes!45551))))

(declare-fun condMapEmpty!45551 () Bool)

(declare-datatypes ((V!43995 0))(
  ( (V!43996 (val!14632 Int)) )
))
(declare-datatypes ((ValueCell!13866 0))(
  ( (ValueCellFull!13866 (v!17269 V!43995)) (EmptyCell!13866) )
))
(declare-datatypes ((array!75141 0))(
  ( (array!75142 (arr!36221 (Array (_ BitVec 32) ValueCell!13866)) (size!36757 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75141)

(declare-fun mapDefault!45551 () ValueCell!13866)

(assert (=> b!1163579 (= condMapEmpty!45551 (= (arr!36221 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13866)) mapDefault!45551)))))

(declare-fun b!1163580 () Bool)

(declare-fun call!56999 () Bool)

(assert (=> b!1163580 call!56999))

(declare-datatypes ((Unit!38399 0))(
  ( (Unit!38400) )
))
(declare-fun lt!524226 () Unit!38399)

(declare-fun call!56996 () Unit!38399)

(assert (=> b!1163580 (= lt!524226 call!56996)))

(declare-fun e!661634 () Unit!38399)

(assert (=> b!1163580 (= e!661634 lt!524226)))

(declare-fun b!1163581 () Bool)

(declare-fun c!116448 () Bool)

(declare-fun lt!524227 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1163581 (= c!116448 (and (not lt!524227) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661619 () Unit!38399)

(declare-fun e!661630 () Unit!38399)

(assert (=> b!1163581 (= e!661619 e!661630)))

(declare-fun zeroValue!944 () V!43995)

(declare-fun bm!56991 () Bool)

(declare-datatypes ((array!75143 0))(
  ( (array!75144 (arr!36222 (Array (_ BitVec 32) (_ BitVec 64))) (size!36758 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75143)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18660 0))(
  ( (tuple2!18661 (_1!9341 (_ BitVec 64)) (_2!9341 V!43995)) )
))
(declare-datatypes ((List!25393 0))(
  ( (Nil!25390) (Cons!25389 (h!26598 tuple2!18660) (t!37006 List!25393)) )
))
(declare-datatypes ((ListLongMap!16629 0))(
  ( (ListLongMap!16630 (toList!8330 List!25393)) )
))
(declare-fun call!57001 () ListLongMap!16629)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43995)

(declare-fun getCurrentListMapNoExtraKeys!4794 (array!75143 array!75141 (_ BitVec 32) (_ BitVec 32) V!43995 V!43995 (_ BitVec 32) Int) ListLongMap!16629)

(assert (=> bm!56991 (= call!57001 (getCurrentListMapNoExtraKeys!4794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163582 () Bool)

(declare-fun e!661627 () Bool)

(declare-fun call!56997 () ListLongMap!16629)

(assert (=> b!1163582 (= e!661627 (= call!56997 call!57001))))

(declare-fun b!1163583 () Bool)

(declare-fun res!771642 () Bool)

(declare-fun e!661633 () Bool)

(assert (=> b!1163583 (=> (not res!771642) (not e!661633))))

(declare-fun lt!524228 () array!75143)

(declare-datatypes ((List!25394 0))(
  ( (Nil!25391) (Cons!25390 (h!26599 (_ BitVec 64)) (t!37007 List!25394)) )
))
(declare-fun arrayNoDuplicates!0 (array!75143 (_ BitVec 32) List!25394) Bool)

(assert (=> b!1163583 (= res!771642 (arrayNoDuplicates!0 lt!524228 #b00000000000000000000000000000000 Nil!25391))))

(declare-fun bm!56992 () Bool)

(declare-fun c!116447 () Bool)

(declare-fun call!57000 () Bool)

(declare-fun call!56998 () ListLongMap!16629)

(declare-fun lt!524241 () ListLongMap!16629)

(declare-fun contains!6834 (ListLongMap!16629 (_ BitVec 64)) Bool)

(assert (=> bm!56992 (= call!57000 (contains!6834 (ite c!116447 lt!524241 call!56998) k0!934))))

(declare-fun mapIsEmpty!45551 () Bool)

(assert (=> mapIsEmpty!45551 mapRes!45551))

(declare-fun b!1163584 () Bool)

(declare-fun res!771653 () Bool)

(assert (=> b!1163584 (=> (not res!771653) (not e!661624))))

(assert (=> b!1163584 (= res!771653 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25391))))

(declare-fun e!661629 () Bool)

(declare-fun b!1163585 () Bool)

(declare-fun arrayContainsKey!0 (array!75143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163585 (= e!661629 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163586 () Bool)

(declare-fun lt!524229 () Unit!38399)

(assert (=> b!1163586 (= e!661630 lt!524229)))

(assert (=> b!1163586 (= lt!524229 call!56996)))

(assert (=> b!1163586 call!56999))

(declare-fun b!1163587 () Bool)

(declare-fun e!661635 () Unit!38399)

(declare-fun Unit!38401 () Unit!38399)

(assert (=> b!1163587 (= e!661635 Unit!38401)))

(declare-fun b!1163588 () Bool)

(declare-fun res!771648 () Bool)

(assert (=> b!1163588 (=> (not res!771648) (not e!661624))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163588 (= res!771648 (= (select (arr!36222 _keys!1208) i!673) k0!934))))

(declare-fun lt!524244 () ListLongMap!16629)

(declare-fun bm!56993 () Bool)

(declare-fun call!56994 () ListLongMap!16629)

(declare-fun +!3733 (ListLongMap!16629 tuple2!18660) ListLongMap!16629)

(assert (=> bm!56993 (= call!56994 (+!3733 (ite c!116447 lt!524241 lt!524244) (ite c!116447 (tuple2!18661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116448 (tuple2!18661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1163589 () Bool)

(declare-fun e!661622 () Bool)

(assert (=> b!1163589 (= e!661622 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524227) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163590 () Bool)

(declare-fun Unit!38402 () Unit!38399)

(assert (=> b!1163590 (= e!661635 Unit!38402)))

(assert (=> b!1163590 (= lt!524227 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163590 (= c!116447 (and (not lt!524227) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524231 () Unit!38399)

(assert (=> b!1163590 (= lt!524231 e!661619)))

(declare-fun lt!524240 () Unit!38399)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!557 (array!75143 array!75141 (_ BitVec 32) (_ BitVec 32) V!43995 V!43995 (_ BitVec 64) (_ BitVec 32) Int) Unit!38399)

(assert (=> b!1163590 (= lt!524240 (lemmaListMapContainsThenArrayContainsFrom!557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116452 () Bool)

(assert (=> b!1163590 (= c!116452 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771645 () Bool)

(assert (=> b!1163590 (= res!771645 e!661622)))

(assert (=> b!1163590 (=> (not res!771645) (not e!661629))))

(assert (=> b!1163590 e!661629))

(declare-fun lt!524242 () Unit!38399)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75143 (_ BitVec 32) (_ BitVec 32)) Unit!38399)

(assert (=> b!1163590 (= lt!524242 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163590 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25391)))

(declare-fun lt!524243 () Unit!38399)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75143 (_ BitVec 64) (_ BitVec 32) List!25394) Unit!38399)

(assert (=> b!1163590 (= lt!524243 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25391))))

(assert (=> b!1163590 false))

(declare-fun b!1163591 () Bool)

(declare-fun Unit!38403 () Unit!38399)

(assert (=> b!1163591 (= e!661634 Unit!38403)))

(declare-fun b!1163592 () Bool)

(declare-fun e!661628 () Bool)

(declare-fun e!661631 () Bool)

(assert (=> b!1163592 (= e!661628 e!661631)))

(declare-fun res!771649 () Bool)

(assert (=> b!1163592 (=> res!771649 e!661631)))

(assert (=> b!1163592 (= res!771649 (not (= (select (arr!36222 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1163592 e!661627))

(declare-fun c!116449 () Bool)

(assert (=> b!1163592 (= c!116449 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524232 () Unit!38399)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!661 (array!75143 array!75141 (_ BitVec 32) (_ BitVec 32) V!43995 V!43995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38399)

(assert (=> b!1163592 (= lt!524232 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163593 () Bool)

(assert (=> b!1163593 (= e!661622 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56994 () Bool)

(assert (=> bm!56994 (= call!56999 call!57000)))

(declare-fun b!1163594 () Bool)

(declare-fun res!771643 () Bool)

(assert (=> b!1163594 (=> (not res!771643) (not e!661624))))

(assert (=> b!1163594 (= res!771643 (and (= (size!36757 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36758 _keys!1208) (size!36757 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45551 () Bool)

(declare-fun tp!86573 () Bool)

(declare-fun e!661632 () Bool)

(assert (=> mapNonEmpty!45551 (= mapRes!45551 (and tp!86573 e!661632))))

(declare-fun mapValue!45551 () ValueCell!13866)

(declare-fun mapKey!45551 () (_ BitVec 32))

(declare-fun mapRest!45551 () (Array (_ BitVec 32) ValueCell!13866))

(assert (=> mapNonEmpty!45551 (= (arr!36221 _values!996) (store mapRest!45551 mapKey!45551 mapValue!45551))))

(declare-fun bm!56995 () Bool)

(declare-fun call!56995 () Unit!38399)

(assert (=> bm!56995 (= call!56996 call!56995)))

(declare-fun b!1163595 () Bool)

(assert (=> b!1163595 (contains!6834 call!56994 k0!934)))

(declare-fun lt!524230 () Unit!38399)

(declare-fun addStillContains!972 (ListLongMap!16629 (_ BitVec 64) V!43995 (_ BitVec 64)) Unit!38399)

(assert (=> b!1163595 (= lt!524230 (addStillContains!972 lt!524241 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1163595 call!57000))

(assert (=> b!1163595 (= lt!524241 (+!3733 lt!524244 (tuple2!18661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!524246 () Unit!38399)

(assert (=> b!1163595 (= lt!524246 call!56995)))

(assert (=> b!1163595 (= e!661619 lt!524230)))

(declare-fun b!1163596 () Bool)

(declare-fun -!1434 (ListLongMap!16629 (_ BitVec 64)) ListLongMap!16629)

(assert (=> b!1163596 (= e!661627 (= call!56997 (-!1434 call!57001 k0!934)))))

(declare-fun res!771644 () Bool)

(assert (=> start!99016 (=> (not res!771644) (not e!661624))))

(assert (=> start!99016 (= res!771644 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36758 _keys!1208))))))

(assert (=> start!99016 e!661624))

(declare-fun tp_is_empty!29151 () Bool)

(assert (=> start!99016 tp_is_empty!29151))

(declare-fun array_inv!27716 (array!75143) Bool)

(assert (=> start!99016 (array_inv!27716 _keys!1208)))

(assert (=> start!99016 true))

(assert (=> start!99016 tp!86574))

(declare-fun array_inv!27717 (array!75141) Bool)

(assert (=> start!99016 (and (array_inv!27717 _values!996) e!661620)))

(declare-fun b!1163597 () Bool)

(assert (=> b!1163597 (= e!661631 true)))

(declare-fun e!661625 () Bool)

(assert (=> b!1163597 e!661625))

(declare-fun res!771652 () Bool)

(assert (=> b!1163597 (=> (not res!771652) (not e!661625))))

(declare-fun lt!524235 () ListLongMap!16629)

(assert (=> b!1163597 (= res!771652 (= lt!524235 lt!524244))))

(declare-fun lt!524234 () ListLongMap!16629)

(assert (=> b!1163597 (= lt!524235 (-!1434 lt!524234 k0!934))))

(declare-fun lt!524236 () V!43995)

(assert (=> b!1163597 (= (-!1434 (+!3733 lt!524244 (tuple2!18661 (select (arr!36222 _keys!1208) from!1455) lt!524236)) (select (arr!36222 _keys!1208) from!1455)) lt!524244)))

(declare-fun lt!524247 () Unit!38399)

(declare-fun addThenRemoveForNewKeyIsSame!266 (ListLongMap!16629 (_ BitVec 64) V!43995) Unit!38399)

(assert (=> b!1163597 (= lt!524247 (addThenRemoveForNewKeyIsSame!266 lt!524244 (select (arr!36222 _keys!1208) from!1455) lt!524236))))

(declare-fun lt!524233 () V!43995)

(declare-fun get!18486 (ValueCell!13866 V!43995) V!43995)

(assert (=> b!1163597 (= lt!524236 (get!18486 (select (arr!36221 _values!996) from!1455) lt!524233))))

(declare-fun lt!524237 () Unit!38399)

(assert (=> b!1163597 (= lt!524237 e!661635)))

(declare-fun c!116450 () Bool)

(assert (=> b!1163597 (= c!116450 (contains!6834 lt!524244 k0!934))))

(assert (=> b!1163597 (= lt!524244 (getCurrentListMapNoExtraKeys!4794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163598 () Bool)

(assert (=> b!1163598 (= e!661632 tp_is_empty!29151)))

(declare-fun b!1163599 () Bool)

(declare-fun res!771639 () Bool)

(assert (=> b!1163599 (=> (not res!771639) (not e!661624))))

(assert (=> b!1163599 (= res!771639 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36758 _keys!1208))))))

(declare-fun b!1163600 () Bool)

(assert (=> b!1163600 (= e!661624 e!661633)))

(declare-fun res!771650 () Bool)

(assert (=> b!1163600 (=> (not res!771650) (not e!661633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75143 (_ BitVec 32)) Bool)

(assert (=> b!1163600 (= res!771650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524228 mask!1564))))

(assert (=> b!1163600 (= lt!524228 (array!75144 (store (arr!36222 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36758 _keys!1208)))))

(declare-fun bm!56996 () Bool)

(assert (=> bm!56996 (= call!56998 call!56994)))

(declare-fun bm!56997 () Bool)

(assert (=> bm!56997 (= call!56995 (addStillContains!972 lt!524244 (ite (or c!116447 c!116448) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116447 c!116448) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1163601 () Bool)

(declare-fun res!771647 () Bool)

(assert (=> b!1163601 (=> (not res!771647) (not e!661624))))

(assert (=> b!1163601 (= res!771647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163602 () Bool)

(declare-fun e!661623 () Bool)

(assert (=> b!1163602 (= e!661633 (not e!661623))))

(declare-fun res!771640 () Bool)

(assert (=> b!1163602 (=> res!771640 e!661623)))

(assert (=> b!1163602 (= res!771640 (bvsgt from!1455 i!673))))

(assert (=> b!1163602 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524239 () Unit!38399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75143 (_ BitVec 64) (_ BitVec 32)) Unit!38399)

(assert (=> b!1163602 (= lt!524239 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163603 () Bool)

(declare-fun res!771646 () Bool)

(assert (=> b!1163603 (=> (not res!771646) (not e!661624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163603 (= res!771646 (validMask!0 mask!1564))))

(declare-fun lt!524238 () array!75141)

(declare-fun b!1163604 () Bool)

(assert (=> b!1163604 (= e!661625 (= lt!524235 (getCurrentListMapNoExtraKeys!4794 lt!524228 lt!524238 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163605 () Bool)

(assert (=> b!1163605 (= e!661621 tp_is_empty!29151)))

(declare-fun b!1163606 () Bool)

(assert (=> b!1163606 (= e!661630 e!661634)))

(declare-fun c!116451 () Bool)

(assert (=> b!1163606 (= c!116451 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524227))))

(declare-fun b!1163607 () Bool)

(assert (=> b!1163607 (= e!661623 e!661628)))

(declare-fun res!771641 () Bool)

(assert (=> b!1163607 (=> res!771641 e!661628)))

(assert (=> b!1163607 (= res!771641 (not (= from!1455 i!673)))))

(declare-fun lt!524245 () ListLongMap!16629)

(assert (=> b!1163607 (= lt!524245 (getCurrentListMapNoExtraKeys!4794 lt!524228 lt!524238 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163607 (= lt!524238 (array!75142 (store (arr!36221 _values!996) i!673 (ValueCellFull!13866 lt!524233)) (size!36757 _values!996)))))

(declare-fun dynLambda!2786 (Int (_ BitVec 64)) V!43995)

(assert (=> b!1163607 (= lt!524233 (dynLambda!2786 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163607 (= lt!524234 (getCurrentListMapNoExtraKeys!4794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56998 () Bool)

(assert (=> bm!56998 (= call!56997 (getCurrentListMapNoExtraKeys!4794 lt!524228 lt!524238 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99016 res!771644) b!1163603))

(assert (= (and b!1163603 res!771646) b!1163594))

(assert (= (and b!1163594 res!771643) b!1163601))

(assert (= (and b!1163601 res!771647) b!1163584))

(assert (= (and b!1163584 res!771653) b!1163599))

(assert (= (and b!1163599 res!771639) b!1163578))

(assert (= (and b!1163578 res!771651) b!1163588))

(assert (= (and b!1163588 res!771648) b!1163600))

(assert (= (and b!1163600 res!771650) b!1163583))

(assert (= (and b!1163583 res!771642) b!1163602))

(assert (= (and b!1163602 (not res!771640)) b!1163607))

(assert (= (and b!1163607 (not res!771641)) b!1163592))

(assert (= (and b!1163592 c!116449) b!1163596))

(assert (= (and b!1163592 (not c!116449)) b!1163582))

(assert (= (or b!1163596 b!1163582) bm!56998))

(assert (= (or b!1163596 b!1163582) bm!56991))

(assert (= (and b!1163592 (not res!771649)) b!1163597))

(assert (= (and b!1163597 c!116450) b!1163590))

(assert (= (and b!1163597 (not c!116450)) b!1163587))

(assert (= (and b!1163590 c!116447) b!1163595))

(assert (= (and b!1163590 (not c!116447)) b!1163581))

(assert (= (and b!1163581 c!116448) b!1163586))

(assert (= (and b!1163581 (not c!116448)) b!1163606))

(assert (= (and b!1163606 c!116451) b!1163580))

(assert (= (and b!1163606 (not c!116451)) b!1163591))

(assert (= (or b!1163586 b!1163580) bm!56995))

(assert (= (or b!1163586 b!1163580) bm!56996))

(assert (= (or b!1163586 b!1163580) bm!56994))

(assert (= (or b!1163595 bm!56994) bm!56992))

(assert (= (or b!1163595 bm!56995) bm!56997))

(assert (= (or b!1163595 bm!56996) bm!56993))

(assert (= (and b!1163590 c!116452) b!1163593))

(assert (= (and b!1163590 (not c!116452)) b!1163589))

(assert (= (and b!1163590 res!771645) b!1163585))

(assert (= (and b!1163597 res!771652) b!1163604))

(assert (= (and b!1163579 condMapEmpty!45551) mapIsEmpty!45551))

(assert (= (and b!1163579 (not condMapEmpty!45551)) mapNonEmpty!45551))

(get-info :version)

(assert (= (and mapNonEmpty!45551 ((_ is ValueCellFull!13866) mapValue!45551)) b!1163598))

(assert (= (and b!1163579 ((_ is ValueCellFull!13866) mapDefault!45551)) b!1163605))

(assert (= start!99016 b!1163579))

(declare-fun b_lambda!19727 () Bool)

(assert (=> (not b_lambda!19727) (not b!1163607)))

(declare-fun t!37005 () Bool)

(declare-fun tb!9433 () Bool)

(assert (=> (and start!99016 (= defaultEntry!1004 defaultEntry!1004) t!37005) tb!9433))

(declare-fun result!19431 () Bool)

(assert (=> tb!9433 (= result!19431 tp_is_empty!29151)))

(assert (=> b!1163607 t!37005))

(declare-fun b_and!40093 () Bool)

(assert (= b_and!40091 (and (=> t!37005 result!19431) b_and!40093)))

(declare-fun m!1072129 () Bool)

(assert (=> b!1163595 m!1072129))

(declare-fun m!1072131 () Bool)

(assert (=> b!1163595 m!1072131))

(declare-fun m!1072133 () Bool)

(assert (=> b!1163595 m!1072133))

(declare-fun m!1072135 () Bool)

(assert (=> b!1163601 m!1072135))

(declare-fun m!1072137 () Bool)

(assert (=> b!1163592 m!1072137))

(declare-fun m!1072139 () Bool)

(assert (=> b!1163592 m!1072139))

(declare-fun m!1072141 () Bool)

(assert (=> b!1163585 m!1072141))

(declare-fun m!1072143 () Bool)

(assert (=> bm!56991 m!1072143))

(declare-fun m!1072145 () Bool)

(assert (=> b!1163602 m!1072145))

(declare-fun m!1072147 () Bool)

(assert (=> b!1163602 m!1072147))

(declare-fun m!1072149 () Bool)

(assert (=> b!1163596 m!1072149))

(declare-fun m!1072151 () Bool)

(assert (=> b!1163607 m!1072151))

(declare-fun m!1072153 () Bool)

(assert (=> b!1163607 m!1072153))

(declare-fun m!1072155 () Bool)

(assert (=> b!1163607 m!1072155))

(declare-fun m!1072157 () Bool)

(assert (=> b!1163607 m!1072157))

(declare-fun m!1072159 () Bool)

(assert (=> bm!56998 m!1072159))

(declare-fun m!1072161 () Bool)

(assert (=> start!99016 m!1072161))

(declare-fun m!1072163 () Bool)

(assert (=> start!99016 m!1072163))

(declare-fun m!1072165 () Bool)

(assert (=> bm!56997 m!1072165))

(assert (=> b!1163597 m!1072143))

(declare-fun m!1072167 () Bool)

(assert (=> b!1163597 m!1072167))

(declare-fun m!1072169 () Bool)

(assert (=> b!1163597 m!1072169))

(assert (=> b!1163597 m!1072137))

(declare-fun m!1072171 () Bool)

(assert (=> b!1163597 m!1072171))

(assert (=> b!1163597 m!1072167))

(declare-fun m!1072173 () Bool)

(assert (=> b!1163597 m!1072173))

(declare-fun m!1072175 () Bool)

(assert (=> b!1163597 m!1072175))

(declare-fun m!1072177 () Bool)

(assert (=> b!1163597 m!1072177))

(assert (=> b!1163597 m!1072137))

(declare-fun m!1072179 () Bool)

(assert (=> b!1163597 m!1072179))

(assert (=> b!1163597 m!1072169))

(assert (=> b!1163597 m!1072137))

(declare-fun m!1072181 () Bool)

(assert (=> b!1163603 m!1072181))

(assert (=> b!1163593 m!1072141))

(declare-fun m!1072183 () Bool)

(assert (=> b!1163584 m!1072183))

(declare-fun m!1072185 () Bool)

(assert (=> b!1163588 m!1072185))

(declare-fun m!1072187 () Bool)

(assert (=> bm!56992 m!1072187))

(assert (=> b!1163604 m!1072159))

(declare-fun m!1072189 () Bool)

(assert (=> b!1163583 m!1072189))

(declare-fun m!1072191 () Bool)

(assert (=> mapNonEmpty!45551 m!1072191))

(declare-fun m!1072193 () Bool)

(assert (=> bm!56993 m!1072193))

(declare-fun m!1072195 () Bool)

(assert (=> b!1163578 m!1072195))

(declare-fun m!1072197 () Bool)

(assert (=> b!1163590 m!1072197))

(declare-fun m!1072199 () Bool)

(assert (=> b!1163590 m!1072199))

(declare-fun m!1072201 () Bool)

(assert (=> b!1163590 m!1072201))

(declare-fun m!1072203 () Bool)

(assert (=> b!1163590 m!1072203))

(declare-fun m!1072205 () Bool)

(assert (=> b!1163600 m!1072205))

(declare-fun m!1072207 () Bool)

(assert (=> b!1163600 m!1072207))

(check-sat (not b!1163585) (not b_lambda!19727) b_and!40093 (not b!1163603) (not b_next!24621) (not b!1163590) (not bm!56998) (not b!1163578) (not start!99016) (not b!1163583) tp_is_empty!29151 (not b!1163601) (not b!1163604) (not b!1163597) (not bm!56991) (not b!1163584) (not b!1163600) (not b!1163602) (not bm!56992) (not b!1163607) (not b!1163596) (not bm!56997) (not bm!56993) (not b!1163595) (not b!1163593) (not mapNonEmpty!45551) (not b!1163592))
(check-sat b_and!40093 (not b_next!24621))
