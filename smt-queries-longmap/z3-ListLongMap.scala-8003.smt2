; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99094 () Bool)

(assert start!99094)

(declare-fun b_free!24463 () Bool)

(declare-fun b_next!24463 () Bool)

(assert (=> start!99094 (= b_free!24463 (not b_next!24463))))

(declare-fun tp!86099 () Bool)

(declare-fun b_and!39777 () Bool)

(assert (=> start!99094 (= tp!86099 b_and!39777)))

(declare-fun b!1157599 () Bool)

(declare-fun e!658431 () Bool)

(declare-fun e!658426 () Bool)

(assert (=> b!1157599 (= e!658431 e!658426)))

(declare-fun res!768599 () Bool)

(assert (=> b!1157599 (=> res!768599 e!658426)))

(declare-datatypes ((array!74877 0))(
  ( (array!74878 (arr!36083 (Array (_ BitVec 32) (_ BitVec 64))) (size!36620 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74877)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1157599 (= res!768599 (not (= (select (arr!36083 _keys!1208) from!1455) k0!934)))))

(declare-fun e!658437 () Bool)

(assert (=> b!1157599 e!658437))

(declare-fun c!115426 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157599 (= c!115426 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43785 0))(
  ( (V!43786 (val!14553 Int)) )
))
(declare-fun zeroValue!944 () V!43785)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!43785)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13787 0))(
  ( (ValueCellFull!13787 (v!17186 V!43785)) (EmptyCell!13787) )
))
(declare-datatypes ((array!74879 0))(
  ( (array!74880 (arr!36084 (Array (_ BitVec 32) ValueCell!13787)) (size!36621 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74879)

(declare-datatypes ((Unit!38062 0))(
  ( (Unit!38063) )
))
(declare-fun lt!519509 () Unit!38062)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!613 (array!74877 array!74879 (_ BitVec 32) (_ BitVec 32) V!43785 V!43785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38062)

(assert (=> b!1157599 (= lt!519509 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157600 () Bool)

(declare-fun e!658432 () Bool)

(declare-fun e!658425 () Bool)

(assert (=> b!1157600 (= e!658432 (not e!658425))))

(declare-fun res!768600 () Bool)

(assert (=> b!1157600 (=> res!768600 e!658425)))

(assert (=> b!1157600 (= res!768600 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157600 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519517 () Unit!38062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74877 (_ BitVec 64) (_ BitVec 32)) Unit!38062)

(assert (=> b!1157600 (= lt!519517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!658435 () Bool)

(declare-fun b!1157601 () Bool)

(assert (=> b!1157601 (= e!658435 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157602 () Bool)

(declare-datatypes ((tuple2!18532 0))(
  ( (tuple2!18533 (_1!9277 (_ BitVec 64)) (_2!9277 V!43785)) )
))
(declare-datatypes ((List!25274 0))(
  ( (Nil!25271) (Cons!25270 (h!26488 tuple2!18532) (t!36721 List!25274)) )
))
(declare-datatypes ((ListLongMap!16509 0))(
  ( (ListLongMap!16510 (toList!8270 List!25274)) )
))
(declare-fun call!55168 () ListLongMap!16509)

(declare-fun contains!6794 (ListLongMap!16509 (_ BitVec 64)) Bool)

(assert (=> b!1157602 (contains!6794 call!55168 k0!934)))

(declare-fun lt!519501 () ListLongMap!16509)

(declare-fun lt!519499 () Unit!38062)

(declare-fun addStillContains!915 (ListLongMap!16509 (_ BitVec 64) V!43785 (_ BitVec 64)) Unit!38062)

(assert (=> b!1157602 (= lt!519499 (addStillContains!915 lt!519501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!55170 () Bool)

(assert (=> b!1157602 call!55170))

(declare-fun lt!519496 () ListLongMap!16509)

(declare-fun +!3693 (ListLongMap!16509 tuple2!18532) ListLongMap!16509)

(assert (=> b!1157602 (= lt!519501 (+!3693 lt!519496 (tuple2!18533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519513 () Unit!38062)

(declare-fun call!55167 () Unit!38062)

(assert (=> b!1157602 (= lt!519513 call!55167)))

(declare-fun e!658428 () Unit!38062)

(assert (=> b!1157602 (= e!658428 lt!519499)))

(declare-fun b!1157603 () Bool)

(declare-fun res!768602 () Bool)

(assert (=> b!1157603 (=> (not res!768602) (not e!658432))))

(declare-fun lt!519504 () array!74877)

(declare-datatypes ((List!25275 0))(
  ( (Nil!25272) (Cons!25271 (h!26489 (_ BitVec 64)) (t!36722 List!25275)) )
))
(declare-fun arrayNoDuplicates!0 (array!74877 (_ BitVec 32) List!25275) Bool)

(assert (=> b!1157603 (= res!768602 (arrayNoDuplicates!0 lt!519504 #b00000000000000000000000000000000 Nil!25272))))

(declare-fun bm!55160 () Bool)

(declare-fun call!55165 () Unit!38062)

(assert (=> bm!55160 (= call!55165 call!55167)))

(declare-fun b!1157604 () Bool)

(declare-fun e!658430 () Unit!38062)

(declare-fun Unit!38064 () Unit!38062)

(assert (=> b!1157604 (= e!658430 Unit!38064)))

(declare-fun lt!519498 () Bool)

(assert (=> b!1157604 (= lt!519498 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115425 () Bool)

(assert (=> b!1157604 (= c!115425 (and (not lt!519498) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519505 () Unit!38062)

(assert (=> b!1157604 (= lt!519505 e!658428)))

(declare-fun lt!519515 () Unit!38062)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!505 (array!74877 array!74879 (_ BitVec 32) (_ BitVec 32) V!43785 V!43785 (_ BitVec 64) (_ BitVec 32) Int) Unit!38062)

(assert (=> b!1157604 (= lt!519515 (lemmaListMapContainsThenArrayContainsFrom!505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115423 () Bool)

(assert (=> b!1157604 (= c!115423 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768595 () Bool)

(assert (=> b!1157604 (= res!768595 e!658435)))

(declare-fun e!658423 () Bool)

(assert (=> b!1157604 (=> (not res!768595) (not e!658423))))

(assert (=> b!1157604 e!658423))

(declare-fun lt!519511 () Unit!38062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74877 (_ BitVec 32) (_ BitVec 32)) Unit!38062)

(assert (=> b!1157604 (= lt!519511 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157604 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25272)))

(declare-fun lt!519502 () Unit!38062)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74877 (_ BitVec 64) (_ BitVec 32) List!25275) Unit!38062)

(assert (=> b!1157604 (= lt!519502 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25272))))

(assert (=> b!1157604 false))

(declare-fun b!1157605 () Bool)

(declare-fun e!658434 () Bool)

(declare-fun e!658438 () Bool)

(declare-fun mapRes!45314 () Bool)

(assert (=> b!1157605 (= e!658434 (and e!658438 mapRes!45314))))

(declare-fun condMapEmpty!45314 () Bool)

(declare-fun mapDefault!45314 () ValueCell!13787)

(assert (=> b!1157605 (= condMapEmpty!45314 (= (arr!36084 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13787)) mapDefault!45314)))))

(declare-fun call!55169 () ListLongMap!16509)

(declare-fun bm!55161 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4764 (array!74877 array!74879 (_ BitVec 32) (_ BitVec 32) V!43785 V!43785 (_ BitVec 32) Int) ListLongMap!16509)

(assert (=> bm!55161 (= call!55169 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157606 () Bool)

(declare-fun call!55163 () Bool)

(assert (=> b!1157606 call!55163))

(declare-fun lt!519497 () Unit!38062)

(assert (=> b!1157606 (= lt!519497 call!55165)))

(declare-fun e!658433 () Unit!38062)

(assert (=> b!1157606 (= e!658433 lt!519497)))

(declare-fun b!1157607 () Bool)

(assert (=> b!1157607 (= e!658423 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!768606 () Bool)

(declare-fun e!658424 () Bool)

(assert (=> start!99094 (=> (not res!768606) (not e!658424))))

(assert (=> start!99094 (= res!768606 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36620 _keys!1208))))))

(assert (=> start!99094 e!658424))

(declare-fun tp_is_empty!28993 () Bool)

(assert (=> start!99094 tp_is_empty!28993))

(declare-fun array_inv!27676 (array!74877) Bool)

(assert (=> start!99094 (array_inv!27676 _keys!1208)))

(assert (=> start!99094 true))

(assert (=> start!99094 tp!86099))

(declare-fun array_inv!27677 (array!74879) Bool)

(assert (=> start!99094 (and (array_inv!27677 _values!996) e!658434)))

(declare-fun call!55164 () ListLongMap!16509)

(declare-fun b!1157608 () Bool)

(declare-fun -!1373 (ListLongMap!16509 (_ BitVec 64)) ListLongMap!16509)

(assert (=> b!1157608 (= e!658437 (= call!55164 (-!1373 call!55169 k0!934)))))

(declare-fun mapNonEmpty!45314 () Bool)

(declare-fun tp!86100 () Bool)

(declare-fun e!658422 () Bool)

(assert (=> mapNonEmpty!45314 (= mapRes!45314 (and tp!86100 e!658422))))

(declare-fun mapValue!45314 () ValueCell!13787)

(declare-fun mapKey!45314 () (_ BitVec 32))

(declare-fun mapRest!45314 () (Array (_ BitVec 32) ValueCell!13787))

(assert (=> mapNonEmpty!45314 (= (arr!36084 _values!996) (store mapRest!45314 mapKey!45314 mapValue!45314))))

(declare-fun e!658429 () Bool)

(declare-fun b!1157609 () Bool)

(declare-fun lt!519512 () ListLongMap!16509)

(declare-fun lt!519508 () array!74879)

(assert (=> b!1157609 (= e!658429 (= lt!519512 (getCurrentListMapNoExtraKeys!4764 lt!519504 lt!519508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45314 () Bool)

(assert (=> mapIsEmpty!45314 mapRes!45314))

(declare-fun b!1157610 () Bool)

(declare-fun res!768597 () Bool)

(assert (=> b!1157610 (=> (not res!768597) (not e!658424))))

(assert (=> b!1157610 (= res!768597 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25272))))

(declare-fun b!1157611 () Bool)

(declare-fun res!768601 () Bool)

(assert (=> b!1157611 (=> (not res!768601) (not e!658424))))

(assert (=> b!1157611 (= res!768601 (and (= (size!36621 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36620 _keys!1208) (size!36621 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!115428 () Bool)

(declare-fun bm!55162 () Bool)

(assert (=> bm!55162 (= call!55168 (+!3693 (ite c!115425 lt!519501 lt!519496) (ite c!115425 (tuple2!18533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115428 (tuple2!18533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1157612 () Bool)

(declare-fun res!768592 () Bool)

(assert (=> b!1157612 (=> (not res!768592) (not e!658424))))

(assert (=> b!1157612 (= res!768592 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36620 _keys!1208))))))

(declare-fun call!55166 () ListLongMap!16509)

(declare-fun bm!55163 () Bool)

(assert (=> bm!55163 (= call!55170 (contains!6794 (ite c!115425 lt!519501 call!55166) k0!934))))

(declare-fun b!1157613 () Bool)

(declare-fun e!658427 () Unit!38062)

(declare-fun lt!519503 () Unit!38062)

(assert (=> b!1157613 (= e!658427 lt!519503)))

(assert (=> b!1157613 (= lt!519503 call!55165)))

(assert (=> b!1157613 call!55163))

(declare-fun bm!55164 () Bool)

(assert (=> bm!55164 (= call!55166 call!55168)))

(declare-fun b!1157614 () Bool)

(assert (=> b!1157614 (= e!658426 true)))

(assert (=> b!1157614 e!658429))

(declare-fun res!768596 () Bool)

(assert (=> b!1157614 (=> (not res!768596) (not e!658429))))

(assert (=> b!1157614 (= res!768596 (= lt!519512 lt!519496))))

(declare-fun lt!519500 () ListLongMap!16509)

(assert (=> b!1157614 (= lt!519512 (-!1373 lt!519500 k0!934))))

(declare-fun lt!519506 () V!43785)

(assert (=> b!1157614 (= (-!1373 (+!3693 lt!519496 (tuple2!18533 (select (arr!36083 _keys!1208) from!1455) lt!519506)) (select (arr!36083 _keys!1208) from!1455)) lt!519496)))

(declare-fun lt!519514 () Unit!38062)

(declare-fun addThenRemoveForNewKeyIsSame!210 (ListLongMap!16509 (_ BitVec 64) V!43785) Unit!38062)

(assert (=> b!1157614 (= lt!519514 (addThenRemoveForNewKeyIsSame!210 lt!519496 (select (arr!36083 _keys!1208) from!1455) lt!519506))))

(declare-fun lt!519516 () V!43785)

(declare-fun get!18409 (ValueCell!13787 V!43785) V!43785)

(assert (=> b!1157614 (= lt!519506 (get!18409 (select (arr!36084 _values!996) from!1455) lt!519516))))

(declare-fun lt!519510 () Unit!38062)

(assert (=> b!1157614 (= lt!519510 e!658430)))

(declare-fun c!115424 () Bool)

(assert (=> b!1157614 (= c!115424 (contains!6794 lt!519496 k0!934))))

(assert (=> b!1157614 (= lt!519496 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157615 () Bool)

(assert (=> b!1157615 (= e!658427 e!658433)))

(declare-fun c!115427 () Bool)

(assert (=> b!1157615 (= c!115427 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519498))))

(declare-fun b!1157616 () Bool)

(declare-fun res!768593 () Bool)

(assert (=> b!1157616 (=> (not res!768593) (not e!658424))))

(assert (=> b!1157616 (= res!768593 (= (select (arr!36083 _keys!1208) i!673) k0!934))))

(declare-fun b!1157617 () Bool)

(declare-fun res!768594 () Bool)

(assert (=> b!1157617 (=> (not res!768594) (not e!658424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74877 (_ BitVec 32)) Bool)

(assert (=> b!1157617 (= res!768594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!55165 () Bool)

(assert (=> bm!55165 (= call!55163 call!55170)))

(declare-fun b!1157618 () Bool)

(declare-fun res!768605 () Bool)

(assert (=> b!1157618 (=> (not res!768605) (not e!658424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157618 (= res!768605 (validMask!0 mask!1564))))

(declare-fun b!1157619 () Bool)

(assert (=> b!1157619 (= e!658422 tp_is_empty!28993)))

(declare-fun bm!55166 () Bool)

(assert (=> bm!55166 (= call!55167 (addStillContains!915 lt!519496 (ite (or c!115425 c!115428) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115425 c!115428) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1157620 () Bool)

(assert (=> b!1157620 (= e!658438 tp_is_empty!28993)))

(declare-fun b!1157621 () Bool)

(assert (=> b!1157621 (= e!658425 e!658431)))

(declare-fun res!768603 () Bool)

(assert (=> b!1157621 (=> res!768603 e!658431)))

(assert (=> b!1157621 (= res!768603 (not (= from!1455 i!673)))))

(declare-fun lt!519507 () ListLongMap!16509)

(assert (=> b!1157621 (= lt!519507 (getCurrentListMapNoExtraKeys!4764 lt!519504 lt!519508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157621 (= lt!519508 (array!74880 (store (arr!36084 _values!996) i!673 (ValueCellFull!13787 lt!519516)) (size!36621 _values!996)))))

(declare-fun dynLambda!2777 (Int (_ BitVec 64)) V!43785)

(assert (=> b!1157621 (= lt!519516 (dynLambda!2777 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157621 (= lt!519500 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157622 () Bool)

(assert (=> b!1157622 (= e!658424 e!658432)))

(declare-fun res!768604 () Bool)

(assert (=> b!1157622 (=> (not res!768604) (not e!658432))))

(assert (=> b!1157622 (= res!768604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519504 mask!1564))))

(assert (=> b!1157622 (= lt!519504 (array!74878 (store (arr!36083 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36620 _keys!1208)))))

(declare-fun b!1157623 () Bool)

(assert (=> b!1157623 (= e!658437 (= call!55164 call!55169))))

(declare-fun b!1157624 () Bool)

(assert (=> b!1157624 (= c!115428 (and (not lt!519498) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157624 (= e!658428 e!658427)))

(declare-fun b!1157625 () Bool)

(declare-fun Unit!38065 () Unit!38062)

(assert (=> b!1157625 (= e!658433 Unit!38065)))

(declare-fun b!1157626 () Bool)

(assert (=> b!1157626 (= e!658435 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519498) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157627 () Bool)

(declare-fun Unit!38066 () Unit!38062)

(assert (=> b!1157627 (= e!658430 Unit!38066)))

(declare-fun bm!55167 () Bool)

(assert (=> bm!55167 (= call!55164 (getCurrentListMapNoExtraKeys!4764 lt!519504 lt!519508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157628 () Bool)

(declare-fun res!768598 () Bool)

(assert (=> b!1157628 (=> (not res!768598) (not e!658424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157628 (= res!768598 (validKeyInArray!0 k0!934))))

(assert (= (and start!99094 res!768606) b!1157618))

(assert (= (and b!1157618 res!768605) b!1157611))

(assert (= (and b!1157611 res!768601) b!1157617))

(assert (= (and b!1157617 res!768594) b!1157610))

(assert (= (and b!1157610 res!768597) b!1157612))

(assert (= (and b!1157612 res!768592) b!1157628))

(assert (= (and b!1157628 res!768598) b!1157616))

(assert (= (and b!1157616 res!768593) b!1157622))

(assert (= (and b!1157622 res!768604) b!1157603))

(assert (= (and b!1157603 res!768602) b!1157600))

(assert (= (and b!1157600 (not res!768600)) b!1157621))

(assert (= (and b!1157621 (not res!768603)) b!1157599))

(assert (= (and b!1157599 c!115426) b!1157608))

(assert (= (and b!1157599 (not c!115426)) b!1157623))

(assert (= (or b!1157608 b!1157623) bm!55167))

(assert (= (or b!1157608 b!1157623) bm!55161))

(assert (= (and b!1157599 (not res!768599)) b!1157614))

(assert (= (and b!1157614 c!115424) b!1157604))

(assert (= (and b!1157614 (not c!115424)) b!1157627))

(assert (= (and b!1157604 c!115425) b!1157602))

(assert (= (and b!1157604 (not c!115425)) b!1157624))

(assert (= (and b!1157624 c!115428) b!1157613))

(assert (= (and b!1157624 (not c!115428)) b!1157615))

(assert (= (and b!1157615 c!115427) b!1157606))

(assert (= (and b!1157615 (not c!115427)) b!1157625))

(assert (= (or b!1157613 b!1157606) bm!55160))

(assert (= (or b!1157613 b!1157606) bm!55164))

(assert (= (or b!1157613 b!1157606) bm!55165))

(assert (= (or b!1157602 bm!55165) bm!55163))

(assert (= (or b!1157602 bm!55160) bm!55166))

(assert (= (or b!1157602 bm!55164) bm!55162))

(assert (= (and b!1157604 c!115423) b!1157601))

(assert (= (and b!1157604 (not c!115423)) b!1157626))

(assert (= (and b!1157604 res!768595) b!1157607))

(assert (= (and b!1157614 res!768596) b!1157609))

(assert (= (and b!1157605 condMapEmpty!45314) mapIsEmpty!45314))

(assert (= (and b!1157605 (not condMapEmpty!45314)) mapNonEmpty!45314))

(get-info :version)

(assert (= (and mapNonEmpty!45314 ((_ is ValueCellFull!13787) mapValue!45314)) b!1157619))

(assert (= (and b!1157605 ((_ is ValueCellFull!13787) mapDefault!45314)) b!1157620))

(assert (= start!99094 b!1157605))

(declare-fun b_lambda!19563 () Bool)

(assert (=> (not b_lambda!19563) (not b!1157621)))

(declare-fun t!36720 () Bool)

(declare-fun tb!9267 () Bool)

(assert (=> (and start!99094 (= defaultEntry!1004 defaultEntry!1004) t!36720) tb!9267))

(declare-fun result!19107 () Bool)

(assert (=> tb!9267 (= result!19107 tp_is_empty!28993)))

(assert (=> b!1157621 t!36720))

(declare-fun b_and!39779 () Bool)

(assert (= b_and!39777 (and (=> t!36720 result!19107) b_and!39779)))

(declare-fun m!1067357 () Bool)

(assert (=> b!1157614 m!1067357))

(declare-fun m!1067359 () Bool)

(assert (=> b!1157614 m!1067359))

(declare-fun m!1067361 () Bool)

(assert (=> b!1157614 m!1067361))

(assert (=> b!1157614 m!1067361))

(declare-fun m!1067363 () Bool)

(assert (=> b!1157614 m!1067363))

(declare-fun m!1067365 () Bool)

(assert (=> b!1157614 m!1067365))

(declare-fun m!1067367 () Bool)

(assert (=> b!1157614 m!1067367))

(declare-fun m!1067369 () Bool)

(assert (=> b!1157614 m!1067369))

(assert (=> b!1157614 m!1067359))

(assert (=> b!1157614 m!1067367))

(declare-fun m!1067371 () Bool)

(assert (=> b!1157614 m!1067371))

(declare-fun m!1067373 () Bool)

(assert (=> b!1157614 m!1067373))

(assert (=> b!1157614 m!1067367))

(declare-fun m!1067375 () Bool)

(assert (=> b!1157622 m!1067375))

(declare-fun m!1067377 () Bool)

(assert (=> b!1157622 m!1067377))

(declare-fun m!1067379 () Bool)

(assert (=> b!1157602 m!1067379))

(declare-fun m!1067381 () Bool)

(assert (=> b!1157602 m!1067381))

(declare-fun m!1067383 () Bool)

(assert (=> b!1157602 m!1067383))

(assert (=> bm!55161 m!1067357))

(declare-fun m!1067385 () Bool)

(assert (=> b!1157610 m!1067385))

(declare-fun m!1067387 () Bool)

(assert (=> b!1157609 m!1067387))

(declare-fun m!1067389 () Bool)

(assert (=> b!1157618 m!1067389))

(assert (=> bm!55167 m!1067387))

(declare-fun m!1067391 () Bool)

(assert (=> b!1157608 m!1067391))

(declare-fun m!1067393 () Bool)

(assert (=> mapNonEmpty!45314 m!1067393))

(declare-fun m!1067395 () Bool)

(assert (=> b!1157600 m!1067395))

(declare-fun m!1067397 () Bool)

(assert (=> b!1157600 m!1067397))

(declare-fun m!1067399 () Bool)

(assert (=> b!1157617 m!1067399))

(declare-fun m!1067401 () Bool)

(assert (=> bm!55162 m!1067401))

(assert (=> b!1157599 m!1067367))

(declare-fun m!1067403 () Bool)

(assert (=> b!1157599 m!1067403))

(declare-fun m!1067405 () Bool)

(assert (=> b!1157603 m!1067405))

(declare-fun m!1067407 () Bool)

(assert (=> start!99094 m!1067407))

(declare-fun m!1067409 () Bool)

(assert (=> start!99094 m!1067409))

(declare-fun m!1067411 () Bool)

(assert (=> b!1157621 m!1067411))

(declare-fun m!1067413 () Bool)

(assert (=> b!1157621 m!1067413))

(declare-fun m!1067415 () Bool)

(assert (=> b!1157621 m!1067415))

(declare-fun m!1067417 () Bool)

(assert (=> b!1157621 m!1067417))

(declare-fun m!1067419 () Bool)

(assert (=> b!1157616 m!1067419))

(declare-fun m!1067421 () Bool)

(assert (=> bm!55163 m!1067421))

(declare-fun m!1067423 () Bool)

(assert (=> bm!55166 m!1067423))

(declare-fun m!1067425 () Bool)

(assert (=> b!1157628 m!1067425))

(declare-fun m!1067427 () Bool)

(assert (=> b!1157601 m!1067427))

(declare-fun m!1067429 () Bool)

(assert (=> b!1157604 m!1067429))

(declare-fun m!1067431 () Bool)

(assert (=> b!1157604 m!1067431))

(declare-fun m!1067433 () Bool)

(assert (=> b!1157604 m!1067433))

(declare-fun m!1067435 () Bool)

(assert (=> b!1157604 m!1067435))

(assert (=> b!1157607 m!1067427))

(check-sat (not b!1157610) (not b!1157617) (not mapNonEmpty!45314) (not b!1157628) (not bm!55162) (not b!1157600) b_and!39779 (not b!1157622) (not b!1157601) (not bm!55166) (not start!99094) (not bm!55161) (not b!1157621) (not b_next!24463) tp_is_empty!28993 (not b!1157602) (not b!1157609) (not b!1157614) (not b!1157608) (not b_lambda!19563) (not bm!55167) (not b!1157607) (not b!1157604) (not b!1157603) (not b!1157618) (not b!1157599) (not bm!55163))
(check-sat b_and!39779 (not b_next!24463))
