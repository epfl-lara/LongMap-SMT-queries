; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98654 () Bool)

(assert start!98654)

(declare-fun b_free!24265 () Bool)

(declare-fun b_next!24265 () Bool)

(assert (=> start!98654 (= b_free!24265 (not b_next!24265))))

(declare-fun tp!85505 () Bool)

(declare-fun b_and!39357 () Bool)

(assert (=> start!98654 (= tp!85505 b_and!39357)))

(declare-fun b!1147078 () Bool)

(declare-fun c!113220 () Bool)

(declare-fun lt!512361 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1147078 (= c!113220 (and (not lt!512361) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37532 0))(
  ( (Unit!37533) )
))
(declare-fun e!652464 () Unit!37532)

(declare-fun e!652468 () Unit!37532)

(assert (=> b!1147078 (= e!652464 e!652468)))

(declare-fun b!1147079 () Bool)

(declare-fun res!763564 () Bool)

(declare-fun e!652463 () Bool)

(assert (=> b!1147079 (=> (not res!763564) (not e!652463))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147079 (= res!763564 (validMask!0 mask!1564))))

(declare-fun b!1147080 () Bool)

(declare-fun e!652467 () Bool)

(declare-fun e!652478 () Bool)

(assert (=> b!1147080 (= e!652467 (not e!652478))))

(declare-fun res!763575 () Bool)

(assert (=> b!1147080 (=> res!763575 e!652478)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147080 (= res!763575 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74360 0))(
  ( (array!74361 (arr!35831 (Array (_ BitVec 32) (_ BitVec 64))) (size!36369 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74360)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147080 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512359 () Unit!37532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74360 (_ BitVec 64) (_ BitVec 32)) Unit!37532)

(assert (=> b!1147080 (= lt!512359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147081 () Bool)

(declare-fun e!652469 () Unit!37532)

(declare-fun Unit!37534 () Unit!37532)

(assert (=> b!1147081 (= e!652469 Unit!37534)))

(assert (=> b!1147081 (= lt!512361 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113221 () Bool)

(assert (=> b!1147081 (= c!113221 (and (not lt!512361) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512358 () Unit!37532)

(assert (=> b!1147081 (= lt!512358 e!652464)))

(declare-datatypes ((V!43521 0))(
  ( (V!43522 (val!14454 Int)) )
))
(declare-fun zeroValue!944 () V!43521)

(declare-fun lt!512366 () Unit!37532)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13688 0))(
  ( (ValueCellFull!13688 (v!17090 V!43521)) (EmptyCell!13688) )
))
(declare-datatypes ((array!74362 0))(
  ( (array!74363 (arr!35832 (Array (_ BitVec 32) ValueCell!13688)) (size!36370 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74362)

(declare-fun minValue!944 () V!43521)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!429 (array!74360 array!74362 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 64) (_ BitVec 32) Int) Unit!37532)

(assert (=> b!1147081 (= lt!512366 (lemmaListMapContainsThenArrayContainsFrom!429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113217 () Bool)

(assert (=> b!1147081 (= c!113217 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763577 () Bool)

(declare-fun e!652466 () Bool)

(assert (=> b!1147081 (= res!763577 e!652466)))

(declare-fun e!652474 () Bool)

(assert (=> b!1147081 (=> (not res!763577) (not e!652474))))

(assert (=> b!1147081 e!652474))

(declare-fun lt!512352 () Unit!37532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74360 (_ BitVec 32) (_ BitVec 32)) Unit!37532)

(assert (=> b!1147081 (= lt!512352 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25141 0))(
  ( (Nil!25138) (Cons!25137 (h!26346 (_ BitVec 64)) (t!36389 List!25141)) )
))
(declare-fun arrayNoDuplicates!0 (array!74360 (_ BitVec 32) List!25141) Bool)

(assert (=> b!1147081 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25138)))

(declare-fun lt!512356 () Unit!37532)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74360 (_ BitVec 64) (_ BitVec 32) List!25141) Unit!37532)

(assert (=> b!1147081 (= lt!512356 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25138))))

(assert (=> b!1147081 false))

(declare-fun b!1147082 () Bool)

(declare-fun e!652479 () Bool)

(declare-fun tp_is_empty!28795 () Bool)

(assert (=> b!1147082 (= e!652479 tp_is_empty!28795)))

(declare-fun b!1147083 () Bool)

(declare-fun e!652476 () Bool)

(declare-fun e!652471 () Bool)

(declare-fun mapRes!45017 () Bool)

(assert (=> b!1147083 (= e!652476 (and e!652471 mapRes!45017))))

(declare-fun condMapEmpty!45017 () Bool)

(declare-fun mapDefault!45017 () ValueCell!13688)

(assert (=> b!1147083 (= condMapEmpty!45017 (= (arr!35832 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13688)) mapDefault!45017)))))

(declare-fun b!1147084 () Bool)

(assert (=> b!1147084 (= e!652466 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147085 () Bool)

(declare-fun res!763565 () Bool)

(assert (=> b!1147085 (=> (not res!763565) (not e!652463))))

(assert (=> b!1147085 (= res!763565 (and (= (size!36370 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36369 _keys!1208) (size!36370 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52696 () Bool)

(declare-fun call!52703 () Bool)

(declare-fun call!52701 () Bool)

(assert (=> bm!52696 (= call!52703 call!52701)))

(declare-fun b!1147086 () Bool)

(declare-fun e!652477 () Bool)

(declare-fun e!652472 () Bool)

(assert (=> b!1147086 (= e!652477 e!652472)))

(declare-fun res!763567 () Bool)

(assert (=> b!1147086 (=> res!763567 e!652472)))

(assert (=> b!1147086 (= res!763567 (not (= (select (arr!35831 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652470 () Bool)

(assert (=> b!1147086 e!652470))

(declare-fun c!113218 () Bool)

(assert (=> b!1147086 (= c!113218 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512365 () Unit!37532)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!554 (array!74360 array!74362 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37532)

(assert (=> b!1147086 (= lt!512365 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147087 () Bool)

(assert (=> b!1147087 (= e!652474 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147088 () Bool)

(declare-fun e!652465 () Unit!37532)

(assert (=> b!1147088 (= e!652468 e!652465)))

(declare-fun c!113222 () Bool)

(assert (=> b!1147088 (= c!113222 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512361))))

(declare-fun b!1147089 () Bool)

(declare-datatypes ((tuple2!18404 0))(
  ( (tuple2!18405 (_1!9213 (_ BitVec 64)) (_2!9213 V!43521)) )
))
(declare-datatypes ((List!25142 0))(
  ( (Nil!25139) (Cons!25138 (h!26347 tuple2!18404) (t!36390 List!25142)) )
))
(declare-datatypes ((ListLongMap!16373 0))(
  ( (ListLongMap!16374 (toList!8202 List!25142)) )
))
(declare-fun call!52706 () ListLongMap!16373)

(declare-fun call!52699 () ListLongMap!16373)

(declare-fun -!1275 (ListLongMap!16373 (_ BitVec 64)) ListLongMap!16373)

(assert (=> b!1147089 (= e!652470 (= call!52706 (-!1275 call!52699 k0!934)))))

(declare-fun b!1147090 () Bool)

(declare-fun res!763574 () Bool)

(assert (=> b!1147090 (=> (not res!763574) (not e!652463))))

(assert (=> b!1147090 (= res!763574 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25138))))

(declare-fun b!1147091 () Bool)

(declare-fun res!763571 () Bool)

(assert (=> b!1147091 (=> (not res!763571) (not e!652463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147091 (= res!763571 (validKeyInArray!0 k0!934))))

(declare-fun b!1147092 () Bool)

(assert (=> b!1147092 (= e!652471 tp_is_empty!28795)))

(declare-fun b!1147093 () Bool)

(declare-fun res!763576 () Bool)

(assert (=> b!1147093 (=> (not res!763576) (not e!652463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74360 (_ BitVec 32)) Bool)

(assert (=> b!1147093 (= res!763576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147094 () Bool)

(declare-fun call!52700 () ListLongMap!16373)

(declare-fun contains!6665 (ListLongMap!16373 (_ BitVec 64)) Bool)

(assert (=> b!1147094 (contains!6665 call!52700 k0!934)))

(declare-fun lt!512367 () Unit!37532)

(declare-fun call!52702 () Unit!37532)

(assert (=> b!1147094 (= lt!512367 call!52702)))

(assert (=> b!1147094 call!52701))

(declare-fun lt!512351 () ListLongMap!16373)

(declare-fun lt!512357 () ListLongMap!16373)

(declare-fun +!3621 (ListLongMap!16373 tuple2!18404) ListLongMap!16373)

(assert (=> b!1147094 (= lt!512351 (+!3621 lt!512357 (tuple2!18405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512364 () Unit!37532)

(declare-fun addStillContains!835 (ListLongMap!16373 (_ BitVec 64) V!43521 (_ BitVec 64)) Unit!37532)

(assert (=> b!1147094 (= lt!512364 (addStillContains!835 lt!512357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1147094 (= e!652464 lt!512367)))

(declare-fun b!1147095 () Bool)

(declare-fun Unit!37535 () Unit!37532)

(assert (=> b!1147095 (= e!652469 Unit!37535)))

(declare-fun b!1147096 () Bool)

(declare-fun lt!512355 () Unit!37532)

(assert (=> b!1147096 (= e!652468 lt!512355)))

(declare-fun call!52705 () Unit!37532)

(assert (=> b!1147096 (= lt!512355 call!52705)))

(assert (=> b!1147096 call!52703))

(declare-fun b!1147097 () Bool)

(assert (=> b!1147097 (= e!652472 true)))

(declare-fun e!652475 () Bool)

(assert (=> b!1147097 e!652475))

(declare-fun res!763566 () Bool)

(assert (=> b!1147097 (=> (not res!763566) (not e!652475))))

(declare-fun lt!512362 () V!43521)

(assert (=> b!1147097 (= res!763566 (= (-!1275 (+!3621 lt!512357 (tuple2!18405 (select (arr!35831 _keys!1208) from!1455) lt!512362)) (select (arr!35831 _keys!1208) from!1455)) lt!512357))))

(declare-fun lt!512363 () Unit!37532)

(declare-fun addThenRemoveForNewKeyIsSame!137 (ListLongMap!16373 (_ BitVec 64) V!43521) Unit!37532)

(assert (=> b!1147097 (= lt!512363 (addThenRemoveForNewKeyIsSame!137 lt!512357 (select (arr!35831 _keys!1208) from!1455) lt!512362))))

(declare-fun lt!512349 () V!43521)

(declare-fun get!18239 (ValueCell!13688 V!43521) V!43521)

(assert (=> b!1147097 (= lt!512362 (get!18239 (select (arr!35832 _values!996) from!1455) lt!512349))))

(declare-fun lt!512360 () Unit!37532)

(assert (=> b!1147097 (= lt!512360 e!652469)))

(declare-fun c!113219 () Bool)

(assert (=> b!1147097 (= c!113219 (contains!6665 lt!512357 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4688 (array!74360 array!74362 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 32) Int) ListLongMap!16373)

(assert (=> b!1147097 (= lt!512357 (getCurrentListMapNoExtraKeys!4688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52697 () Bool)

(assert (=> bm!52697 (= call!52705 call!52702)))

(declare-fun bm!52698 () Bool)

(assert (=> bm!52698 (= call!52699 (getCurrentListMapNoExtraKeys!4688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52699 () Bool)

(declare-fun lt!512347 () array!74362)

(declare-fun lt!512354 () array!74360)

(assert (=> bm!52699 (= call!52706 (getCurrentListMapNoExtraKeys!4688 lt!512354 lt!512347 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147098 () Bool)

(assert (=> b!1147098 (= e!652463 e!652467)))

(declare-fun res!763573 () Bool)

(assert (=> b!1147098 (=> (not res!763573) (not e!652467))))

(assert (=> b!1147098 (= res!763573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512354 mask!1564))))

(assert (=> b!1147098 (= lt!512354 (array!74361 (store (arr!35831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36369 _keys!1208)))))

(declare-fun bm!52700 () Bool)

(assert (=> bm!52700 (= call!52702 (addStillContains!835 (ite c!113221 lt!512351 lt!512357) (ite c!113221 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113220 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113221 minValue!944 (ite c!113220 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147099 () Bool)

(declare-fun res!763568 () Bool)

(assert (=> b!1147099 (=> (not res!763568) (not e!652463))))

(assert (=> b!1147099 (= res!763568 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36369 _keys!1208))))))

(declare-fun res!763563 () Bool)

(assert (=> start!98654 (=> (not res!763563) (not e!652463))))

(assert (=> start!98654 (= res!763563 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36369 _keys!1208))))))

(assert (=> start!98654 e!652463))

(assert (=> start!98654 tp_is_empty!28795))

(declare-fun array_inv!27536 (array!74360) Bool)

(assert (=> start!98654 (array_inv!27536 _keys!1208)))

(assert (=> start!98654 true))

(assert (=> start!98654 tp!85505))

(declare-fun array_inv!27537 (array!74362) Bool)

(assert (=> start!98654 (and (array_inv!27537 _values!996) e!652476)))

(declare-fun mapNonEmpty!45017 () Bool)

(declare-fun tp!85506 () Bool)

(assert (=> mapNonEmpty!45017 (= mapRes!45017 (and tp!85506 e!652479))))

(declare-fun mapValue!45017 () ValueCell!13688)

(declare-fun mapKey!45017 () (_ BitVec 32))

(declare-fun mapRest!45017 () (Array (_ BitVec 32) ValueCell!13688))

(assert (=> mapNonEmpty!45017 (= (arr!35832 _values!996) (store mapRest!45017 mapKey!45017 mapValue!45017))))

(declare-fun b!1147100 () Bool)

(declare-fun lt!512348 () ListLongMap!16373)

(assert (=> b!1147100 (= e!652475 (= (-!1275 lt!512348 k0!934) lt!512357))))

(declare-fun call!52704 () ListLongMap!16373)

(declare-fun bm!52701 () Bool)

(assert (=> bm!52701 (= call!52701 (contains!6665 (ite c!113221 lt!512351 call!52704) k0!934))))

(declare-fun b!1147101 () Bool)

(declare-fun res!763572 () Bool)

(assert (=> b!1147101 (=> (not res!763572) (not e!652463))))

(assert (=> b!1147101 (= res!763572 (= (select (arr!35831 _keys!1208) i!673) k0!934))))

(declare-fun b!1147102 () Bool)

(assert (=> b!1147102 (= e!652470 (= call!52706 call!52699))))

(declare-fun b!1147103 () Bool)

(declare-fun Unit!37536 () Unit!37532)

(assert (=> b!1147103 (= e!652465 Unit!37536)))

(declare-fun bm!52702 () Bool)

(assert (=> bm!52702 (= call!52704 call!52700)))

(declare-fun b!1147104 () Bool)

(declare-fun res!763569 () Bool)

(assert (=> b!1147104 (=> (not res!763569) (not e!652467))))

(assert (=> b!1147104 (= res!763569 (arrayNoDuplicates!0 lt!512354 #b00000000000000000000000000000000 Nil!25138))))

(declare-fun b!1147105 () Bool)

(assert (=> b!1147105 (= e!652466 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512361) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!45017 () Bool)

(assert (=> mapIsEmpty!45017 mapRes!45017))

(declare-fun b!1147106 () Bool)

(assert (=> b!1147106 call!52703))

(declare-fun lt!512353 () Unit!37532)

(assert (=> b!1147106 (= lt!512353 call!52705)))

(assert (=> b!1147106 (= e!652465 lt!512353)))

(declare-fun b!1147107 () Bool)

(assert (=> b!1147107 (= e!652478 e!652477)))

(declare-fun res!763570 () Bool)

(assert (=> b!1147107 (=> res!763570 e!652477)))

(assert (=> b!1147107 (= res!763570 (not (= from!1455 i!673)))))

(declare-fun lt!512350 () ListLongMap!16373)

(assert (=> b!1147107 (= lt!512350 (getCurrentListMapNoExtraKeys!4688 lt!512354 lt!512347 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147107 (= lt!512347 (array!74363 (store (arr!35832 _values!996) i!673 (ValueCellFull!13688 lt!512349)) (size!36370 _values!996)))))

(declare-fun dynLambda!2658 (Int (_ BitVec 64)) V!43521)

(assert (=> b!1147107 (= lt!512349 (dynLambda!2658 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147107 (= lt!512348 (getCurrentListMapNoExtraKeys!4688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52703 () Bool)

(assert (=> bm!52703 (= call!52700 (+!3621 (ite c!113221 lt!512351 lt!512357) (ite c!113221 (tuple2!18405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113220 (tuple2!18405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!98654 res!763563) b!1147079))

(assert (= (and b!1147079 res!763564) b!1147085))

(assert (= (and b!1147085 res!763565) b!1147093))

(assert (= (and b!1147093 res!763576) b!1147090))

(assert (= (and b!1147090 res!763574) b!1147099))

(assert (= (and b!1147099 res!763568) b!1147091))

(assert (= (and b!1147091 res!763571) b!1147101))

(assert (= (and b!1147101 res!763572) b!1147098))

(assert (= (and b!1147098 res!763573) b!1147104))

(assert (= (and b!1147104 res!763569) b!1147080))

(assert (= (and b!1147080 (not res!763575)) b!1147107))

(assert (= (and b!1147107 (not res!763570)) b!1147086))

(assert (= (and b!1147086 c!113218) b!1147089))

(assert (= (and b!1147086 (not c!113218)) b!1147102))

(assert (= (or b!1147089 b!1147102) bm!52699))

(assert (= (or b!1147089 b!1147102) bm!52698))

(assert (= (and b!1147086 (not res!763567)) b!1147097))

(assert (= (and b!1147097 c!113219) b!1147081))

(assert (= (and b!1147097 (not c!113219)) b!1147095))

(assert (= (and b!1147081 c!113221) b!1147094))

(assert (= (and b!1147081 (not c!113221)) b!1147078))

(assert (= (and b!1147078 c!113220) b!1147096))

(assert (= (and b!1147078 (not c!113220)) b!1147088))

(assert (= (and b!1147088 c!113222) b!1147106))

(assert (= (and b!1147088 (not c!113222)) b!1147103))

(assert (= (or b!1147096 b!1147106) bm!52697))

(assert (= (or b!1147096 b!1147106) bm!52702))

(assert (= (or b!1147096 b!1147106) bm!52696))

(assert (= (or b!1147094 bm!52696) bm!52701))

(assert (= (or b!1147094 bm!52697) bm!52700))

(assert (= (or b!1147094 bm!52702) bm!52703))

(assert (= (and b!1147081 c!113217) b!1147084))

(assert (= (and b!1147081 (not c!113217)) b!1147105))

(assert (= (and b!1147081 res!763577) b!1147087))

(assert (= (and b!1147097 res!763566) b!1147100))

(assert (= (and b!1147083 condMapEmpty!45017) mapIsEmpty!45017))

(assert (= (and b!1147083 (not condMapEmpty!45017)) mapNonEmpty!45017))

(get-info :version)

(assert (= (and mapNonEmpty!45017 ((_ is ValueCellFull!13688) mapValue!45017)) b!1147082))

(assert (= (and b!1147083 ((_ is ValueCellFull!13688) mapDefault!45017)) b!1147092))

(assert (= start!98654 b!1147083))

(declare-fun b_lambda!19353 () Bool)

(assert (=> (not b_lambda!19353) (not b!1147107)))

(declare-fun t!36388 () Bool)

(declare-fun tb!9069 () Bool)

(assert (=> (and start!98654 (= defaultEntry!1004 defaultEntry!1004) t!36388) tb!9069))

(declare-fun result!18711 () Bool)

(assert (=> tb!9069 (= result!18711 tp_is_empty!28795)))

(assert (=> b!1147107 t!36388))

(declare-fun b_and!39359 () Bool)

(assert (= b_and!39357 (and (=> t!36388 result!18711) b_and!39359)))

(declare-fun m!1057261 () Bool)

(assert (=> b!1147101 m!1057261))

(declare-fun m!1057263 () Bool)

(assert (=> bm!52699 m!1057263))

(declare-fun m!1057265 () Bool)

(assert (=> b!1147081 m!1057265))

(declare-fun m!1057267 () Bool)

(assert (=> b!1147081 m!1057267))

(declare-fun m!1057269 () Bool)

(assert (=> b!1147081 m!1057269))

(declare-fun m!1057271 () Bool)

(assert (=> b!1147081 m!1057271))

(declare-fun m!1057273 () Bool)

(assert (=> b!1147098 m!1057273))

(declare-fun m!1057275 () Bool)

(assert (=> b!1147098 m!1057275))

(declare-fun m!1057277 () Bool)

(assert (=> b!1147093 m!1057277))

(declare-fun m!1057279 () Bool)

(assert (=> bm!52701 m!1057279))

(declare-fun m!1057281 () Bool)

(assert (=> b!1147090 m!1057281))

(declare-fun m!1057283 () Bool)

(assert (=> bm!52700 m!1057283))

(declare-fun m!1057285 () Bool)

(assert (=> b!1147091 m!1057285))

(declare-fun m!1057287 () Bool)

(assert (=> b!1147107 m!1057287))

(declare-fun m!1057289 () Bool)

(assert (=> b!1147107 m!1057289))

(declare-fun m!1057291 () Bool)

(assert (=> b!1147107 m!1057291))

(declare-fun m!1057293 () Bool)

(assert (=> b!1147107 m!1057293))

(declare-fun m!1057295 () Bool)

(assert (=> b!1147084 m!1057295))

(declare-fun m!1057297 () Bool)

(assert (=> b!1147089 m!1057297))

(declare-fun m!1057299 () Bool)

(assert (=> b!1147086 m!1057299))

(declare-fun m!1057301 () Bool)

(assert (=> b!1147086 m!1057301))

(declare-fun m!1057303 () Bool)

(assert (=> b!1147097 m!1057303))

(declare-fun m!1057305 () Bool)

(assert (=> b!1147097 m!1057305))

(declare-fun m!1057307 () Bool)

(assert (=> b!1147097 m!1057307))

(assert (=> b!1147097 m!1057307))

(declare-fun m!1057309 () Bool)

(assert (=> b!1147097 m!1057309))

(assert (=> b!1147097 m!1057299))

(declare-fun m!1057311 () Bool)

(assert (=> b!1147097 m!1057311))

(declare-fun m!1057313 () Bool)

(assert (=> b!1147097 m!1057313))

(assert (=> b!1147097 m!1057303))

(assert (=> b!1147097 m!1057299))

(declare-fun m!1057315 () Bool)

(assert (=> b!1147097 m!1057315))

(assert (=> b!1147097 m!1057299))

(declare-fun m!1057317 () Bool)

(assert (=> start!98654 m!1057317))

(declare-fun m!1057319 () Bool)

(assert (=> start!98654 m!1057319))

(declare-fun m!1057321 () Bool)

(assert (=> b!1147100 m!1057321))

(declare-fun m!1057323 () Bool)

(assert (=> b!1147094 m!1057323))

(declare-fun m!1057325 () Bool)

(assert (=> b!1147094 m!1057325))

(declare-fun m!1057327 () Bool)

(assert (=> b!1147094 m!1057327))

(declare-fun m!1057329 () Bool)

(assert (=> b!1147079 m!1057329))

(declare-fun m!1057331 () Bool)

(assert (=> bm!52703 m!1057331))

(assert (=> bm!52698 m!1057305))

(declare-fun m!1057333 () Bool)

(assert (=> mapNonEmpty!45017 m!1057333))

(assert (=> b!1147087 m!1057295))

(declare-fun m!1057335 () Bool)

(assert (=> b!1147104 m!1057335))

(declare-fun m!1057337 () Bool)

(assert (=> b!1147080 m!1057337))

(declare-fun m!1057339 () Bool)

(assert (=> b!1147080 m!1057339))

(check-sat (not b!1147080) (not b!1147081) (not bm!52699) (not b!1147097) (not b!1147090) (not bm!52701) (not start!98654) b_and!39359 (not b!1147098) (not b!1147079) (not b!1147086) (not b!1147087) (not b!1147091) (not mapNonEmpty!45017) (not bm!52700) (not b!1147107) (not b!1147093) (not b_lambda!19353) (not bm!52698) (not bm!52703) (not b!1147089) (not b_next!24265) (not b!1147104) (not b!1147084) (not b!1147100) tp_is_empty!28795 (not b!1147094))
(check-sat b_and!39359 (not b_next!24265))
