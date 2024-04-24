; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99028 () Bool)

(assert start!99028)

(declare-fun b_free!24397 () Bool)

(declare-fun b_next!24397 () Bool)

(assert (=> start!99028 (= b_free!24397 (not b_next!24397))))

(declare-fun tp!85901 () Bool)

(declare-fun b_and!39645 () Bool)

(assert (=> start!99028 (= tp!85901 b_and!39645)))

(declare-fun b!1154563 () Bool)

(declare-fun e!656749 () Bool)

(declare-fun tp_is_empty!28927 () Bool)

(assert (=> b!1154563 (= e!656749 tp_is_empty!28927)))

(declare-datatypes ((V!43697 0))(
  ( (V!43698 (val!14520 Int)) )
))
(declare-fun zeroValue!944 () V!43697)

(declare-datatypes ((array!74745 0))(
  ( (array!74746 (arr!36017 (Array (_ BitVec 32) (_ BitVec 64))) (size!36554 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74745)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18466 0))(
  ( (tuple2!18467 (_1!9244 (_ BitVec 64)) (_2!9244 V!43697)) )
))
(declare-datatypes ((List!25214 0))(
  ( (Nil!25211) (Cons!25210 (h!26428 tuple2!18466) (t!36595 List!25214)) )
))
(declare-datatypes ((ListLongMap!16443 0))(
  ( (ListLongMap!16444 (toList!8237 List!25214)) )
))
(declare-fun call!54377 () ListLongMap!16443)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!54368 () Bool)

(declare-datatypes ((ValueCell!13754 0))(
  ( (ValueCellFull!13754 (v!17153 V!43697)) (EmptyCell!13754) )
))
(declare-datatypes ((array!74747 0))(
  ( (array!74748 (arr!36018 (Array (_ BitVec 32) ValueCell!13754)) (size!36555 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74747)

(declare-fun minValue!944 () V!43697)

(declare-fun getCurrentListMapNoExtraKeys!4733 (array!74745 array!74747 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 32) Int) ListLongMap!16443)

(assert (=> bm!54368 (= call!54377 (getCurrentListMapNoExtraKeys!4733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!656742 () Bool)

(declare-fun b!1154564 () Bool)

(declare-fun arrayContainsKey!0 (array!74745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154564 (= e!656742 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154565 () Bool)

(declare-fun res!767108 () Bool)

(declare-fun e!656740 () Bool)

(assert (=> b!1154565 (=> (not res!767108) (not e!656740))))

(declare-fun lt!517329 () array!74745)

(declare-datatypes ((List!25215 0))(
  ( (Nil!25212) (Cons!25211 (h!26429 (_ BitVec 64)) (t!36596 List!25215)) )
))
(declare-fun arrayNoDuplicates!0 (array!74745 (_ BitVec 32) List!25215) Bool)

(assert (=> b!1154565 (= res!767108 (arrayNoDuplicates!0 lt!517329 #b00000000000000000000000000000000 Nil!25212))))

(declare-fun b!1154566 () Bool)

(declare-fun res!767112 () Bool)

(declare-fun e!656746 () Bool)

(assert (=> b!1154566 (=> (not res!767112) (not e!656746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154566 (= res!767112 (validMask!0 mask!1564))))

(declare-fun bm!54369 () Bool)

(declare-fun call!54378 () ListLongMap!16443)

(declare-fun call!54372 () ListLongMap!16443)

(assert (=> bm!54369 (= call!54378 call!54372)))

(declare-fun b!1154567 () Bool)

(declare-fun e!656754 () Bool)

(assert (=> b!1154567 (= e!656740 (not e!656754))))

(declare-fun res!767111 () Bool)

(assert (=> b!1154567 (=> res!767111 e!656754)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154567 (= res!767111 (bvsgt from!1455 i!673))))

(assert (=> b!1154567 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37936 0))(
  ( (Unit!37937) )
))
(declare-fun lt!517330 () Unit!37936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74745 (_ BitVec 64) (_ BitVec 32)) Unit!37936)

(assert (=> b!1154567 (= lt!517330 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45215 () Bool)

(declare-fun mapRes!45215 () Bool)

(declare-fun tp!85902 () Bool)

(assert (=> mapNonEmpty!45215 (= mapRes!45215 (and tp!85902 e!656749))))

(declare-fun mapKey!45215 () (_ BitVec 32))

(declare-fun mapRest!45215 () (Array (_ BitVec 32) ValueCell!13754))

(declare-fun mapValue!45215 () ValueCell!13754)

(assert (=> mapNonEmpty!45215 (= (arr!36018 _values!996) (store mapRest!45215 mapKey!45215 mapValue!45215))))

(declare-fun b!1154569 () Bool)

(declare-fun e!656755 () Bool)

(assert (=> b!1154569 (= e!656755 tp_is_empty!28927)))

(declare-fun c!114830 () Bool)

(declare-fun call!54376 () Unit!37936)

(declare-fun bm!54370 () Bool)

(declare-fun lt!517335 () ListLongMap!16443)

(declare-fun lt!517334 () ListLongMap!16443)

(declare-fun c!114832 () Bool)

(declare-fun addStillContains!889 (ListLongMap!16443 (_ BitVec 64) V!43697 (_ BitVec 64)) Unit!37936)

(assert (=> bm!54370 (= call!54376 (addStillContains!889 (ite c!114832 lt!517334 lt!517335) (ite c!114832 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114830 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114832 minValue!944 (ite c!114830 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!45215 () Bool)

(assert (=> mapIsEmpty!45215 mapRes!45215))

(declare-fun bm!54371 () Bool)

(declare-fun lt!517337 () array!74747)

(declare-fun call!54374 () ListLongMap!16443)

(assert (=> bm!54371 (= call!54374 (getCurrentListMapNoExtraKeys!4733 lt!517329 lt!517337 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54372 () Bool)

(declare-fun +!3666 (ListLongMap!16443 tuple2!18466) ListLongMap!16443)

(assert (=> bm!54372 (= call!54372 (+!3666 (ite c!114832 lt!517334 lt!517335) (ite c!114832 (tuple2!18467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114830 (tuple2!18467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1154570 () Bool)

(declare-fun call!54375 () Bool)

(assert (=> b!1154570 call!54375))

(declare-fun lt!517322 () Unit!37936)

(declare-fun call!54373 () Unit!37936)

(assert (=> b!1154570 (= lt!517322 call!54373)))

(declare-fun e!656745 () Unit!37936)

(assert (=> b!1154570 (= e!656745 lt!517322)))

(declare-fun e!656748 () Bool)

(declare-fun b!1154571 () Bool)

(assert (=> b!1154571 (= e!656748 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154572 () Bool)

(declare-fun e!656750 () Bool)

(assert (=> b!1154572 (= e!656754 e!656750)))

(declare-fun res!767116 () Bool)

(assert (=> b!1154572 (=> res!767116 e!656750)))

(assert (=> b!1154572 (= res!767116 (not (= from!1455 i!673)))))

(declare-fun lt!517319 () ListLongMap!16443)

(assert (=> b!1154572 (= lt!517319 (getCurrentListMapNoExtraKeys!4733 lt!517329 lt!517337 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517331 () V!43697)

(assert (=> b!1154572 (= lt!517337 (array!74748 (store (arr!36018 _values!996) i!673 (ValueCellFull!13754 lt!517331)) (size!36555 _values!996)))))

(declare-fun dynLambda!2756 (Int (_ BitVec 64)) V!43697)

(assert (=> b!1154572 (= lt!517331 (dynLambda!2756 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517332 () ListLongMap!16443)

(assert (=> b!1154572 (= lt!517332 (getCurrentListMapNoExtraKeys!4733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!656743 () Bool)

(declare-fun b!1154573 () Bool)

(declare-fun -!1349 (ListLongMap!16443 (_ BitVec 64)) ListLongMap!16443)

(assert (=> b!1154573 (= e!656743 (= call!54374 (-!1349 call!54377 k0!934)))))

(declare-fun b!1154574 () Bool)

(declare-fun e!656744 () Unit!37936)

(declare-fun Unit!37938 () Unit!37936)

(assert (=> b!1154574 (= e!656744 Unit!37938)))

(declare-fun lt!517338 () Bool)

(assert (=> b!1154574 (= lt!517338 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154574 (= c!114832 (and (not lt!517338) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517339 () Unit!37936)

(declare-fun e!656751 () Unit!37936)

(assert (=> b!1154574 (= lt!517339 e!656751)))

(declare-fun lt!517328 () Unit!37936)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!484 (array!74745 array!74747 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 64) (_ BitVec 32) Int) Unit!37936)

(assert (=> b!1154574 (= lt!517328 (lemmaListMapContainsThenArrayContainsFrom!484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114834 () Bool)

(assert (=> b!1154574 (= c!114834 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767110 () Bool)

(assert (=> b!1154574 (= res!767110 e!656742)))

(assert (=> b!1154574 (=> (not res!767110) (not e!656748))))

(assert (=> b!1154574 e!656748))

(declare-fun lt!517324 () Unit!37936)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74745 (_ BitVec 32) (_ BitVec 32)) Unit!37936)

(assert (=> b!1154574 (= lt!517324 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154574 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25212)))

(declare-fun lt!517333 () Unit!37936)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74745 (_ BitVec 64) (_ BitVec 32) List!25215) Unit!37936)

(assert (=> b!1154574 (= lt!517333 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25212))))

(assert (=> b!1154574 false))

(declare-fun b!1154575 () Bool)

(declare-fun res!767118 () Bool)

(assert (=> b!1154575 (=> (not res!767118) (not e!656746))))

(assert (=> b!1154575 (= res!767118 (and (= (size!36555 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36554 _keys!1208) (size!36555 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154576 () Bool)

(declare-fun res!767107 () Bool)

(assert (=> b!1154576 (=> (not res!767107) (not e!656746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74745 (_ BitVec 32)) Bool)

(assert (=> b!1154576 (= res!767107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!767113 () Bool)

(assert (=> start!99028 (=> (not res!767113) (not e!656746))))

(assert (=> start!99028 (= res!767113 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36554 _keys!1208))))))

(assert (=> start!99028 e!656746))

(assert (=> start!99028 tp_is_empty!28927))

(declare-fun array_inv!27634 (array!74745) Bool)

(assert (=> start!99028 (array_inv!27634 _keys!1208)))

(assert (=> start!99028 true))

(assert (=> start!99028 tp!85901))

(declare-fun e!656741 () Bool)

(declare-fun array_inv!27635 (array!74747) Bool)

(assert (=> start!99028 (and (array_inv!27635 _values!996) e!656741)))

(declare-fun b!1154568 () Bool)

(assert (=> b!1154568 (= c!114830 (and (not lt!517338) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656752 () Unit!37936)

(assert (=> b!1154568 (= e!656751 e!656752)))

(declare-fun b!1154577 () Bool)

(declare-fun res!767120 () Bool)

(assert (=> b!1154577 (=> (not res!767120) (not e!656746))))

(assert (=> b!1154577 (= res!767120 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36554 _keys!1208))))))

(declare-fun b!1154578 () Bool)

(declare-fun Unit!37939 () Unit!37936)

(assert (=> b!1154578 (= e!656745 Unit!37939)))

(declare-fun b!1154579 () Bool)

(declare-fun res!767114 () Bool)

(assert (=> b!1154579 (=> (not res!767114) (not e!656746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154579 (= res!767114 (validKeyInArray!0 k0!934))))

(declare-fun bm!54373 () Bool)

(declare-fun call!54371 () Bool)

(declare-fun contains!6765 (ListLongMap!16443 (_ BitVec 64)) Bool)

(assert (=> bm!54373 (= call!54371 (contains!6765 (ite c!114832 lt!517334 call!54378) k0!934))))

(declare-fun b!1154580 () Bool)

(declare-fun res!767109 () Bool)

(assert (=> b!1154580 (=> (not res!767109) (not e!656746))))

(assert (=> b!1154580 (= res!767109 (= (select (arr!36017 _keys!1208) i!673) k0!934))))

(declare-fun bm!54374 () Bool)

(assert (=> bm!54374 (= call!54375 call!54371)))

(declare-fun b!1154581 () Bool)

(assert (=> b!1154581 (= e!656741 (and e!656755 mapRes!45215))))

(declare-fun condMapEmpty!45215 () Bool)

(declare-fun mapDefault!45215 () ValueCell!13754)

(assert (=> b!1154581 (= condMapEmpty!45215 (= (arr!36018 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13754)) mapDefault!45215)))))

(declare-fun bm!54375 () Bool)

(assert (=> bm!54375 (= call!54373 call!54376)))

(declare-fun b!1154582 () Bool)

(assert (=> b!1154582 (= e!656742 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517338) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154583 () Bool)

(declare-fun e!656739 () Bool)

(assert (=> b!1154583 (= e!656739 true)))

(declare-fun e!656753 () Bool)

(assert (=> b!1154583 e!656753))

(declare-fun res!767117 () Bool)

(assert (=> b!1154583 (=> (not res!767117) (not e!656753))))

(declare-fun lt!517336 () ListLongMap!16443)

(assert (=> b!1154583 (= res!767117 (= lt!517336 lt!517335))))

(assert (=> b!1154583 (= lt!517336 (-!1349 lt!517332 k0!934))))

(declare-fun lt!517321 () V!43697)

(assert (=> b!1154583 (= (-!1349 (+!3666 lt!517335 (tuple2!18467 (select (arr!36017 _keys!1208) from!1455) lt!517321)) (select (arr!36017 _keys!1208) from!1455)) lt!517335)))

(declare-fun lt!517325 () Unit!37936)

(declare-fun addThenRemoveForNewKeyIsSame!192 (ListLongMap!16443 (_ BitVec 64) V!43697) Unit!37936)

(assert (=> b!1154583 (= lt!517325 (addThenRemoveForNewKeyIsSame!192 lt!517335 (select (arr!36017 _keys!1208) from!1455) lt!517321))))

(declare-fun get!18369 (ValueCell!13754 V!43697) V!43697)

(assert (=> b!1154583 (= lt!517321 (get!18369 (select (arr!36018 _values!996) from!1455) lt!517331))))

(declare-fun lt!517326 () Unit!37936)

(assert (=> b!1154583 (= lt!517326 e!656744)))

(declare-fun c!114829 () Bool)

(assert (=> b!1154583 (= c!114829 (contains!6765 lt!517335 k0!934))))

(assert (=> b!1154583 (= lt!517335 (getCurrentListMapNoExtraKeys!4733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154584 () Bool)

(declare-fun res!767121 () Bool)

(assert (=> b!1154584 (=> (not res!767121) (not e!656746))))

(assert (=> b!1154584 (= res!767121 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25212))))

(declare-fun b!1154585 () Bool)

(declare-fun lt!517327 () Unit!37936)

(assert (=> b!1154585 (= e!656752 lt!517327)))

(assert (=> b!1154585 (= lt!517327 call!54373)))

(assert (=> b!1154585 call!54375))

(declare-fun b!1154586 () Bool)

(assert (=> b!1154586 (= e!656753 (= lt!517336 (getCurrentListMapNoExtraKeys!4733 lt!517329 lt!517337 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154587 () Bool)

(assert (=> b!1154587 (= e!656743 (= call!54374 call!54377))))

(declare-fun b!1154588 () Bool)

(assert (=> b!1154588 (= e!656746 e!656740)))

(declare-fun res!767115 () Bool)

(assert (=> b!1154588 (=> (not res!767115) (not e!656740))))

(assert (=> b!1154588 (= res!767115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517329 mask!1564))))

(assert (=> b!1154588 (= lt!517329 (array!74746 (store (arr!36017 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36554 _keys!1208)))))

(declare-fun b!1154589 () Bool)

(assert (=> b!1154589 (= e!656750 e!656739)))

(declare-fun res!767119 () Bool)

(assert (=> b!1154589 (=> res!767119 e!656739)))

(assert (=> b!1154589 (= res!767119 (not (= (select (arr!36017 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1154589 e!656743))

(declare-fun c!114833 () Bool)

(assert (=> b!1154589 (= c!114833 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517318 () Unit!37936)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!589 (array!74745 array!74747 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37936)

(assert (=> b!1154589 (= lt!517318 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154590 () Bool)

(declare-fun Unit!37940 () Unit!37936)

(assert (=> b!1154590 (= e!656744 Unit!37940)))

(declare-fun b!1154591 () Bool)

(assert (=> b!1154591 (= e!656752 e!656745)))

(declare-fun c!114831 () Bool)

(assert (=> b!1154591 (= c!114831 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517338))))

(declare-fun b!1154592 () Bool)

(assert (=> b!1154592 (contains!6765 call!54372 k0!934)))

(declare-fun lt!517320 () Unit!37936)

(assert (=> b!1154592 (= lt!517320 call!54376)))

(assert (=> b!1154592 call!54371))

(assert (=> b!1154592 (= lt!517334 (+!3666 lt!517335 (tuple2!18467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517323 () Unit!37936)

(assert (=> b!1154592 (= lt!517323 (addStillContains!889 lt!517335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1154592 (= e!656751 lt!517320)))

(assert (= (and start!99028 res!767113) b!1154566))

(assert (= (and b!1154566 res!767112) b!1154575))

(assert (= (and b!1154575 res!767118) b!1154576))

(assert (= (and b!1154576 res!767107) b!1154584))

(assert (= (and b!1154584 res!767121) b!1154577))

(assert (= (and b!1154577 res!767120) b!1154579))

(assert (= (and b!1154579 res!767114) b!1154580))

(assert (= (and b!1154580 res!767109) b!1154588))

(assert (= (and b!1154588 res!767115) b!1154565))

(assert (= (and b!1154565 res!767108) b!1154567))

(assert (= (and b!1154567 (not res!767111)) b!1154572))

(assert (= (and b!1154572 (not res!767116)) b!1154589))

(assert (= (and b!1154589 c!114833) b!1154573))

(assert (= (and b!1154589 (not c!114833)) b!1154587))

(assert (= (or b!1154573 b!1154587) bm!54371))

(assert (= (or b!1154573 b!1154587) bm!54368))

(assert (= (and b!1154589 (not res!767119)) b!1154583))

(assert (= (and b!1154583 c!114829) b!1154574))

(assert (= (and b!1154583 (not c!114829)) b!1154590))

(assert (= (and b!1154574 c!114832) b!1154592))

(assert (= (and b!1154574 (not c!114832)) b!1154568))

(assert (= (and b!1154568 c!114830) b!1154585))

(assert (= (and b!1154568 (not c!114830)) b!1154591))

(assert (= (and b!1154591 c!114831) b!1154570))

(assert (= (and b!1154591 (not c!114831)) b!1154578))

(assert (= (or b!1154585 b!1154570) bm!54375))

(assert (= (or b!1154585 b!1154570) bm!54369))

(assert (= (or b!1154585 b!1154570) bm!54374))

(assert (= (or b!1154592 bm!54374) bm!54373))

(assert (= (or b!1154592 bm!54375) bm!54370))

(assert (= (or b!1154592 bm!54369) bm!54372))

(assert (= (and b!1154574 c!114834) b!1154564))

(assert (= (and b!1154574 (not c!114834)) b!1154582))

(assert (= (and b!1154574 res!767110) b!1154571))

(assert (= (and b!1154583 res!767117) b!1154586))

(assert (= (and b!1154581 condMapEmpty!45215) mapIsEmpty!45215))

(assert (= (and b!1154581 (not condMapEmpty!45215)) mapNonEmpty!45215))

(get-info :version)

(assert (= (and mapNonEmpty!45215 ((_ is ValueCellFull!13754) mapValue!45215)) b!1154563))

(assert (= (and b!1154581 ((_ is ValueCellFull!13754) mapDefault!45215)) b!1154569))

(assert (= start!99028 b!1154581))

(declare-fun b_lambda!19497 () Bool)

(assert (=> (not b_lambda!19497) (not b!1154572)))

(declare-fun t!36594 () Bool)

(declare-fun tb!9201 () Bool)

(assert (=> (and start!99028 (= defaultEntry!1004 defaultEntry!1004) t!36594) tb!9201))

(declare-fun result!18975 () Bool)

(assert (=> tb!9201 (= result!18975 tp_is_empty!28927)))

(assert (=> b!1154572 t!36594))

(declare-fun b_and!39647 () Bool)

(assert (= b_and!39645 (and (=> t!36594 result!18975) b_and!39647)))

(declare-fun m!1064713 () Bool)

(assert (=> b!1154573 m!1064713))

(declare-fun m!1064715 () Bool)

(assert (=> bm!54372 m!1064715))

(declare-fun m!1064717 () Bool)

(assert (=> b!1154579 m!1064717))

(declare-fun m!1064719 () Bool)

(assert (=> bm!54371 m!1064719))

(declare-fun m!1064721 () Bool)

(assert (=> bm!54370 m!1064721))

(declare-fun m!1064723 () Bool)

(assert (=> b!1154576 m!1064723))

(declare-fun m!1064725 () Bool)

(assert (=> b!1154572 m!1064725))

(declare-fun m!1064727 () Bool)

(assert (=> b!1154572 m!1064727))

(declare-fun m!1064729 () Bool)

(assert (=> b!1154572 m!1064729))

(declare-fun m!1064731 () Bool)

(assert (=> b!1154572 m!1064731))

(assert (=> b!1154586 m!1064719))

(declare-fun m!1064733 () Bool)

(assert (=> b!1154574 m!1064733))

(declare-fun m!1064735 () Bool)

(assert (=> b!1154574 m!1064735))

(declare-fun m!1064737 () Bool)

(assert (=> b!1154574 m!1064737))

(declare-fun m!1064739 () Bool)

(assert (=> b!1154574 m!1064739))

(declare-fun m!1064741 () Bool)

(assert (=> b!1154589 m!1064741))

(declare-fun m!1064743 () Bool)

(assert (=> b!1154589 m!1064743))

(declare-fun m!1064745 () Bool)

(assert (=> b!1154584 m!1064745))

(declare-fun m!1064747 () Bool)

(assert (=> b!1154583 m!1064747))

(declare-fun m!1064749 () Bool)

(assert (=> b!1154583 m!1064749))

(declare-fun m!1064751 () Bool)

(assert (=> b!1154583 m!1064751))

(assert (=> b!1154583 m!1064741))

(declare-fun m!1064753 () Bool)

(assert (=> b!1154583 m!1064753))

(declare-fun m!1064755 () Bool)

(assert (=> b!1154583 m!1064755))

(assert (=> b!1154583 m!1064741))

(declare-fun m!1064757 () Bool)

(assert (=> b!1154583 m!1064757))

(assert (=> b!1154583 m!1064755))

(assert (=> b!1154583 m!1064741))

(assert (=> b!1154583 m!1064749))

(declare-fun m!1064759 () Bool)

(assert (=> b!1154583 m!1064759))

(declare-fun m!1064761 () Bool)

(assert (=> b!1154583 m!1064761))

(declare-fun m!1064763 () Bool)

(assert (=> b!1154588 m!1064763))

(declare-fun m!1064765 () Bool)

(assert (=> b!1154588 m!1064765))

(declare-fun m!1064767 () Bool)

(assert (=> mapNonEmpty!45215 m!1064767))

(declare-fun m!1064769 () Bool)

(assert (=> b!1154580 m!1064769))

(declare-fun m!1064771 () Bool)

(assert (=> start!99028 m!1064771))

(declare-fun m!1064773 () Bool)

(assert (=> start!99028 m!1064773))

(declare-fun m!1064775 () Bool)

(assert (=> b!1154566 m!1064775))

(declare-fun m!1064777 () Bool)

(assert (=> b!1154565 m!1064777))

(declare-fun m!1064779 () Bool)

(assert (=> b!1154592 m!1064779))

(declare-fun m!1064781 () Bool)

(assert (=> b!1154592 m!1064781))

(declare-fun m!1064783 () Bool)

(assert (=> b!1154592 m!1064783))

(assert (=> bm!54368 m!1064747))

(declare-fun m!1064785 () Bool)

(assert (=> b!1154567 m!1064785))

(declare-fun m!1064787 () Bool)

(assert (=> b!1154567 m!1064787))

(declare-fun m!1064789 () Bool)

(assert (=> b!1154564 m!1064789))

(declare-fun m!1064791 () Bool)

(assert (=> bm!54373 m!1064791))

(assert (=> b!1154571 m!1064789))

(check-sat (not b!1154573) (not b!1154567) (not bm!54370) (not b_lambda!19497) (not b!1154572) (not b!1154571) (not bm!54368) (not b!1154564) (not b!1154583) (not b!1154584) (not b!1154579) (not b!1154565) tp_is_empty!28927 (not b!1154574) (not b!1154566) (not b!1154588) b_and!39647 (not b!1154592) (not b!1154589) (not bm!54373) (not bm!54371) (not start!99028) (not bm!54372) (not b!1154586) (not b!1154576) (not b_next!24397) (not mapNonEmpty!45215))
(check-sat b_and!39647 (not b_next!24397))
