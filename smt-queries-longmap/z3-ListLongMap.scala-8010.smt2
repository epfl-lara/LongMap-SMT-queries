; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99136 () Bool)

(assert start!99136)

(declare-fun b_free!24505 () Bool)

(declare-fun b_next!24505 () Bool)

(assert (=> start!99136 (= b_free!24505 (not b_next!24505))))

(declare-fun tp!86225 () Bool)

(declare-fun b_and!39861 () Bool)

(assert (=> start!99136 (= tp!86225 b_and!39861)))

(declare-fun b!1159531 () Bool)

(declare-fun res!769544 () Bool)

(declare-fun e!659503 () Bool)

(assert (=> b!1159531 (=> (not res!769544) (not e!659503))))

(declare-datatypes ((array!74961 0))(
  ( (array!74962 (arr!36125 (Array (_ BitVec 32) (_ BitVec 64))) (size!36662 (_ BitVec 32))) )
))
(declare-fun lt!520887 () array!74961)

(declare-datatypes ((List!25316 0))(
  ( (Nil!25313) (Cons!25312 (h!26530 (_ BitVec 64)) (t!36805 List!25316)) )
))
(declare-fun arrayNoDuplicates!0 (array!74961 (_ BitVec 32) List!25316) Bool)

(assert (=> b!1159531 (= res!769544 (arrayNoDuplicates!0 lt!520887 #b00000000000000000000000000000000 Nil!25313))))

(declare-fun b!1159532 () Bool)

(declare-datatypes ((Unit!38159 0))(
  ( (Unit!38160) )
))
(declare-fun e!659499 () Unit!38159)

(declare-fun lt!520885 () Unit!38159)

(assert (=> b!1159532 (= e!659499 lt!520885)))

(declare-fun call!55671 () Unit!38159)

(assert (=> b!1159532 (= lt!520885 call!55671)))

(declare-fun call!55668 () Bool)

(assert (=> b!1159532 call!55668))

(declare-fun mapIsEmpty!45377 () Bool)

(declare-fun mapRes!45377 () Bool)

(assert (=> mapIsEmpty!45377 mapRes!45377))

(declare-fun b!1159533 () Bool)

(declare-fun res!769545 () Bool)

(declare-fun e!659504 () Bool)

(assert (=> b!1159533 (=> (not res!769545) (not e!659504))))

(declare-fun _keys!1208 () array!74961)

(assert (=> b!1159533 (= res!769545 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25313))))

(declare-fun b!1159534 () Bool)

(declare-fun res!769550 () Bool)

(assert (=> b!1159534 (=> (not res!769550) (not e!659504))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159534 (= res!769550 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36662 _keys!1208))))))

(declare-datatypes ((V!43841 0))(
  ( (V!43842 (val!14574 Int)) )
))
(declare-fun zeroValue!944 () V!43841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18574 0))(
  ( (tuple2!18575 (_1!9298 (_ BitVec 64)) (_2!9298 V!43841)) )
))
(declare-datatypes ((List!25317 0))(
  ( (Nil!25314) (Cons!25313 (h!26531 tuple2!18574) (t!36806 List!25317)) )
))
(declare-datatypes ((ListLongMap!16551 0))(
  ( (ListLongMap!16552 (toList!8291 List!25317)) )
))
(declare-fun call!55673 () ListLongMap!16551)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!55665 () Bool)

(declare-fun minValue!944 () V!43841)

(declare-datatypes ((ValueCell!13808 0))(
  ( (ValueCellFull!13808 (v!17207 V!43841)) (EmptyCell!13808) )
))
(declare-datatypes ((array!74963 0))(
  ( (array!74964 (arr!36126 (Array (_ BitVec 32) ValueCell!13808)) (size!36663 (_ BitVec 32))) )
))
(declare-fun lt!520892 () array!74963)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4784 (array!74961 array!74963 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 32) Int) ListLongMap!16551)

(assert (=> bm!55665 (= call!55673 (getCurrentListMapNoExtraKeys!4784 lt!520887 lt!520892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55666 () Bool)

(declare-fun call!55672 () Bool)

(assert (=> bm!55666 (= call!55668 call!55672)))

(declare-fun b!1159535 () Bool)

(declare-fun res!769551 () Bool)

(assert (=> b!1159535 (=> (not res!769551) (not e!659504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74961 (_ BitVec 32)) Bool)

(assert (=> b!1159535 (= res!769551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159536 () Bool)

(declare-fun e!659502 () Unit!38159)

(declare-fun Unit!38161 () Unit!38159)

(assert (=> b!1159536 (= e!659502 Unit!38161)))

(declare-fun lt!520896 () Bool)

(assert (=> b!1159536 (= lt!520896 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115801 () Bool)

(assert (=> b!1159536 (= c!115801 (and (not lt!520896) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520900 () Unit!38159)

(declare-fun e!659508 () Unit!38159)

(assert (=> b!1159536 (= lt!520900 e!659508)))

(declare-fun lt!520891 () Unit!38159)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun _values!996 () array!74963)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!523 (array!74961 array!74963 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 64) (_ BitVec 32) Int) Unit!38159)

(assert (=> b!1159536 (= lt!520891 (lemmaListMapContainsThenArrayContainsFrom!523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115806 () Bool)

(assert (=> b!1159536 (= c!115806 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769542 () Bool)

(declare-fun e!659496 () Bool)

(assert (=> b!1159536 (= res!769542 e!659496)))

(declare-fun e!659497 () Bool)

(assert (=> b!1159536 (=> (not res!769542) (not e!659497))))

(assert (=> b!1159536 e!659497))

(declare-fun lt!520883 () Unit!38159)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74961 (_ BitVec 32) (_ BitVec 32)) Unit!38159)

(assert (=> b!1159536 (= lt!520883 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159536 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25313)))

(declare-fun lt!520902 () Unit!38159)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74961 (_ BitVec 64) (_ BitVec 32) List!25316) Unit!38159)

(assert (=> b!1159536 (= lt!520902 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25313))))

(assert (=> b!1159536 false))

(declare-fun b!1159537 () Bool)

(declare-fun e!659501 () Unit!38159)

(declare-fun Unit!38162 () Unit!38159)

(assert (=> b!1159537 (= e!659501 Unit!38162)))

(declare-fun b!1159538 () Bool)

(declare-fun call!55667 () ListLongMap!16551)

(declare-fun e!659506 () Bool)

(declare-fun -!1392 (ListLongMap!16551 (_ BitVec 64)) ListLongMap!16551)

(assert (=> b!1159538 (= e!659506 (= call!55673 (-!1392 call!55667 k0!934)))))

(declare-fun b!1159539 () Bool)

(assert (=> b!1159539 call!55668))

(declare-fun lt!520884 () Unit!38159)

(assert (=> b!1159539 (= lt!520884 call!55671)))

(assert (=> b!1159539 (= e!659501 lt!520884)))

(declare-fun b!1159540 () Bool)

(declare-fun e!659494 () Bool)

(declare-fun tp_is_empty!29035 () Bool)

(assert (=> b!1159540 (= e!659494 tp_is_empty!29035)))

(declare-fun b!1159541 () Bool)

(declare-fun e!659493 () Bool)

(assert (=> b!1159541 (= e!659493 (and e!659494 mapRes!45377))))

(declare-fun condMapEmpty!45377 () Bool)

(declare-fun mapDefault!45377 () ValueCell!13808)

(assert (=> b!1159541 (= condMapEmpty!45377 (= (arr!36126 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13808)) mapDefault!45377)))))

(declare-fun res!769541 () Bool)

(assert (=> start!99136 (=> (not res!769541) (not e!659504))))

(assert (=> start!99136 (= res!769541 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36662 _keys!1208))))))

(assert (=> start!99136 e!659504))

(assert (=> start!99136 tp_is_empty!29035))

(declare-fun array_inv!27712 (array!74961) Bool)

(assert (=> start!99136 (array_inv!27712 _keys!1208)))

(assert (=> start!99136 true))

(assert (=> start!99136 tp!86225))

(declare-fun array_inv!27713 (array!74963) Bool)

(assert (=> start!99136 (and (array_inv!27713 _values!996) e!659493)))

(declare-fun bm!55664 () Bool)

(declare-fun call!55669 () Unit!38159)

(assert (=> bm!55664 (= call!55671 call!55669)))

(declare-fun b!1159542 () Bool)

(declare-fun res!769547 () Bool)

(assert (=> b!1159542 (=> (not res!769547) (not e!659504))))

(assert (=> b!1159542 (= res!769547 (and (= (size!36663 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36662 _keys!1208) (size!36663 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159543 () Bool)

(declare-fun e!659507 () Bool)

(assert (=> b!1159543 (= e!659503 (not e!659507))))

(declare-fun res!769538 () Bool)

(assert (=> b!1159543 (=> res!769538 e!659507)))

(assert (=> b!1159543 (= res!769538 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159543 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520882 () Unit!38159)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74961 (_ BitVec 64) (_ BitVec 32)) Unit!38159)

(assert (=> b!1159543 (= lt!520882 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159544 () Bool)

(declare-fun e!659500 () Bool)

(declare-fun e!659509 () Bool)

(assert (=> b!1159544 (= e!659500 e!659509)))

(declare-fun res!769548 () Bool)

(assert (=> b!1159544 (=> res!769548 e!659509)))

(assert (=> b!1159544 (= res!769548 (not (= (select (arr!36125 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159544 e!659506))

(declare-fun c!115802 () Bool)

(assert (=> b!1159544 (= c!115802 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520888 () Unit!38159)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!631 (array!74961 array!74963 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38159)

(assert (=> b!1159544 (= lt!520888 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159545 () Bool)

(assert (=> b!1159545 (= e!659504 e!659503)))

(declare-fun res!769543 () Bool)

(assert (=> b!1159545 (=> (not res!769543) (not e!659503))))

(assert (=> b!1159545 (= res!769543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520887 mask!1564))))

(assert (=> b!1159545 (= lt!520887 (array!74962 (store (arr!36125 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36662 _keys!1208)))))

(declare-fun b!1159546 () Bool)

(assert (=> b!1159546 (= e!659506 (= call!55673 call!55667))))

(declare-fun b!1159547 () Bool)

(declare-fun res!769549 () Bool)

(assert (=> b!1159547 (=> (not res!769549) (not e!659504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159547 (= res!769549 (validKeyInArray!0 k0!934))))

(declare-fun b!1159548 () Bool)

(declare-fun c!115805 () Bool)

(assert (=> b!1159548 (= c!115805 (and (not lt!520896) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159548 (= e!659508 e!659499)))

(declare-fun b!1159549 () Bool)

(declare-fun Unit!38163 () Unit!38159)

(assert (=> b!1159549 (= e!659502 Unit!38163)))

(declare-fun b!1159550 () Bool)

(assert (=> b!1159550 (= e!659497 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159551 () Bool)

(declare-fun call!55670 () ListLongMap!16551)

(declare-fun contains!6814 (ListLongMap!16551 (_ BitVec 64)) Bool)

(assert (=> b!1159551 (contains!6814 call!55670 k0!934)))

(declare-fun lt!520895 () ListLongMap!16551)

(declare-fun lt!520898 () Unit!38159)

(declare-fun addStillContains!935 (ListLongMap!16551 (_ BitVec 64) V!43841 (_ BitVec 64)) Unit!38159)

(assert (=> b!1159551 (= lt!520898 (addStillContains!935 lt!520895 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1159551 call!55672))

(declare-fun lt!520890 () ListLongMap!16551)

(declare-fun +!3713 (ListLongMap!16551 tuple2!18574) ListLongMap!16551)

(assert (=> b!1159551 (= lt!520895 (+!3713 lt!520890 (tuple2!18575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520903 () Unit!38159)

(assert (=> b!1159551 (= lt!520903 call!55669)))

(assert (=> b!1159551 (= e!659508 lt!520898)))

(declare-fun e!659505 () Bool)

(declare-fun b!1159552 () Bool)

(declare-fun lt!520889 () ListLongMap!16551)

(assert (=> b!1159552 (= e!659505 (= lt!520889 (getCurrentListMapNoExtraKeys!4784 lt!520887 lt!520892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!55667 () Bool)

(assert (=> bm!55667 (= call!55667 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159553 () Bool)

(declare-fun e!659498 () Bool)

(assert (=> b!1159553 (= e!659498 tp_is_empty!29035)))

(declare-fun bm!55668 () Bool)

(assert (=> bm!55668 (= call!55669 (addStillContains!935 lt!520890 (ite (or c!115801 c!115805) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115801 c!115805) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1159554 () Bool)

(assert (=> b!1159554 (= e!659507 e!659500)))

(declare-fun res!769540 () Bool)

(assert (=> b!1159554 (=> res!769540 e!659500)))

(assert (=> b!1159554 (= res!769540 (not (= from!1455 i!673)))))

(declare-fun lt!520893 () ListLongMap!16551)

(assert (=> b!1159554 (= lt!520893 (getCurrentListMapNoExtraKeys!4784 lt!520887 lt!520892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520886 () V!43841)

(assert (=> b!1159554 (= lt!520892 (array!74964 (store (arr!36126 _values!996) i!673 (ValueCellFull!13808 lt!520886)) (size!36663 _values!996)))))

(declare-fun dynLambda!2795 (Int (_ BitVec 64)) V!43841)

(assert (=> b!1159554 (= lt!520886 (dynLambda!2795 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520894 () ListLongMap!16551)

(assert (=> b!1159554 (= lt!520894 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159555 () Bool)

(assert (=> b!1159555 (= e!659509 true)))

(assert (=> b!1159555 e!659505))

(declare-fun res!769537 () Bool)

(assert (=> b!1159555 (=> (not res!769537) (not e!659505))))

(assert (=> b!1159555 (= res!769537 (= lt!520889 lt!520890))))

(assert (=> b!1159555 (= lt!520889 (-!1392 lt!520894 k0!934))))

(declare-fun lt!520901 () V!43841)

(assert (=> b!1159555 (= (-!1392 (+!3713 lt!520890 (tuple2!18575 (select (arr!36125 _keys!1208) from!1455) lt!520901)) (select (arr!36125 _keys!1208) from!1455)) lt!520890)))

(declare-fun lt!520897 () Unit!38159)

(declare-fun addThenRemoveForNewKeyIsSame!227 (ListLongMap!16551 (_ BitVec 64) V!43841) Unit!38159)

(assert (=> b!1159555 (= lt!520897 (addThenRemoveForNewKeyIsSame!227 lt!520890 (select (arr!36125 _keys!1208) from!1455) lt!520901))))

(declare-fun get!18440 (ValueCell!13808 V!43841) V!43841)

(assert (=> b!1159555 (= lt!520901 (get!18440 (select (arr!36126 _values!996) from!1455) lt!520886))))

(declare-fun lt!520899 () Unit!38159)

(assert (=> b!1159555 (= lt!520899 e!659502)))

(declare-fun c!115804 () Bool)

(assert (=> b!1159555 (= c!115804 (contains!6814 lt!520890 k0!934))))

(assert (=> b!1159555 (= lt!520890 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159556 () Bool)

(declare-fun res!769546 () Bool)

(assert (=> b!1159556 (=> (not res!769546) (not e!659504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159556 (= res!769546 (validMask!0 mask!1564))))

(declare-fun b!1159557 () Bool)

(assert (=> b!1159557 (= e!659496 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520896) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55669 () Bool)

(declare-fun call!55674 () ListLongMap!16551)

(assert (=> bm!55669 (= call!55672 (contains!6814 (ite c!115801 lt!520895 call!55674) k0!934))))

(declare-fun mapNonEmpty!45377 () Bool)

(declare-fun tp!86226 () Bool)

(assert (=> mapNonEmpty!45377 (= mapRes!45377 (and tp!86226 e!659498))))

(declare-fun mapKey!45377 () (_ BitVec 32))

(declare-fun mapRest!45377 () (Array (_ BitVec 32) ValueCell!13808))

(declare-fun mapValue!45377 () ValueCell!13808)

(assert (=> mapNonEmpty!45377 (= (arr!36126 _values!996) (store mapRest!45377 mapKey!45377 mapValue!45377))))

(declare-fun bm!55670 () Bool)

(assert (=> bm!55670 (= call!55670 (+!3713 (ite c!115801 lt!520895 lt!520890) (ite c!115801 (tuple2!18575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115805 (tuple2!18575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1159558 () Bool)

(assert (=> b!1159558 (= e!659499 e!659501)))

(declare-fun c!115803 () Bool)

(assert (=> b!1159558 (= c!115803 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520896))))

(declare-fun b!1159559 () Bool)

(assert (=> b!1159559 (= e!659496 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159560 () Bool)

(declare-fun res!769539 () Bool)

(assert (=> b!1159560 (=> (not res!769539) (not e!659504))))

(assert (=> b!1159560 (= res!769539 (= (select (arr!36125 _keys!1208) i!673) k0!934))))

(declare-fun bm!55671 () Bool)

(assert (=> bm!55671 (= call!55674 call!55670)))

(assert (= (and start!99136 res!769541) b!1159556))

(assert (= (and b!1159556 res!769546) b!1159542))

(assert (= (and b!1159542 res!769547) b!1159535))

(assert (= (and b!1159535 res!769551) b!1159533))

(assert (= (and b!1159533 res!769545) b!1159534))

(assert (= (and b!1159534 res!769550) b!1159547))

(assert (= (and b!1159547 res!769549) b!1159560))

(assert (= (and b!1159560 res!769539) b!1159545))

(assert (= (and b!1159545 res!769543) b!1159531))

(assert (= (and b!1159531 res!769544) b!1159543))

(assert (= (and b!1159543 (not res!769538)) b!1159554))

(assert (= (and b!1159554 (not res!769540)) b!1159544))

(assert (= (and b!1159544 c!115802) b!1159538))

(assert (= (and b!1159544 (not c!115802)) b!1159546))

(assert (= (or b!1159538 b!1159546) bm!55665))

(assert (= (or b!1159538 b!1159546) bm!55667))

(assert (= (and b!1159544 (not res!769548)) b!1159555))

(assert (= (and b!1159555 c!115804) b!1159536))

(assert (= (and b!1159555 (not c!115804)) b!1159549))

(assert (= (and b!1159536 c!115801) b!1159551))

(assert (= (and b!1159536 (not c!115801)) b!1159548))

(assert (= (and b!1159548 c!115805) b!1159532))

(assert (= (and b!1159548 (not c!115805)) b!1159558))

(assert (= (and b!1159558 c!115803) b!1159539))

(assert (= (and b!1159558 (not c!115803)) b!1159537))

(assert (= (or b!1159532 b!1159539) bm!55664))

(assert (= (or b!1159532 b!1159539) bm!55671))

(assert (= (or b!1159532 b!1159539) bm!55666))

(assert (= (or b!1159551 bm!55666) bm!55669))

(assert (= (or b!1159551 bm!55664) bm!55668))

(assert (= (or b!1159551 bm!55671) bm!55670))

(assert (= (and b!1159536 c!115806) b!1159559))

(assert (= (and b!1159536 (not c!115806)) b!1159557))

(assert (= (and b!1159536 res!769542) b!1159550))

(assert (= (and b!1159555 res!769537) b!1159552))

(assert (= (and b!1159541 condMapEmpty!45377) mapIsEmpty!45377))

(assert (= (and b!1159541 (not condMapEmpty!45377)) mapNonEmpty!45377))

(get-info :version)

(assert (= (and mapNonEmpty!45377 ((_ is ValueCellFull!13808) mapValue!45377)) b!1159553))

(assert (= (and b!1159541 ((_ is ValueCellFull!13808) mapDefault!45377)) b!1159540))

(assert (= start!99136 b!1159541))

(declare-fun b_lambda!19605 () Bool)

(assert (=> (not b_lambda!19605) (not b!1159554)))

(declare-fun t!36804 () Bool)

(declare-fun tb!9309 () Bool)

(assert (=> (and start!99136 (= defaultEntry!1004 defaultEntry!1004) t!36804) tb!9309))

(declare-fun result!19191 () Bool)

(assert (=> tb!9309 (= result!19191 tp_is_empty!29035)))

(assert (=> b!1159554 t!36804))

(declare-fun b_and!39863 () Bool)

(assert (= b_and!39861 (and (=> t!36804 result!19191) b_and!39863)))

(declare-fun m!1069041 () Bool)

(assert (=> b!1159535 m!1069041))

(declare-fun m!1069043 () Bool)

(assert (=> bm!55668 m!1069043))

(declare-fun m!1069045 () Bool)

(assert (=> start!99136 m!1069045))

(declare-fun m!1069047 () Bool)

(assert (=> start!99136 m!1069047))

(declare-fun m!1069049 () Bool)

(assert (=> b!1159543 m!1069049))

(declare-fun m!1069051 () Bool)

(assert (=> b!1159543 m!1069051))

(declare-fun m!1069053 () Bool)

(assert (=> bm!55669 m!1069053))

(declare-fun m!1069055 () Bool)

(assert (=> b!1159544 m!1069055))

(declare-fun m!1069057 () Bool)

(assert (=> b!1159544 m!1069057))

(declare-fun m!1069059 () Bool)

(assert (=> b!1159552 m!1069059))

(declare-fun m!1069061 () Bool)

(assert (=> b!1159556 m!1069061))

(declare-fun m!1069063 () Bool)

(assert (=> b!1159550 m!1069063))

(declare-fun m!1069065 () Bool)

(assert (=> b!1159560 m!1069065))

(assert (=> bm!55665 m!1069059))

(declare-fun m!1069067 () Bool)

(assert (=> b!1159551 m!1069067))

(declare-fun m!1069069 () Bool)

(assert (=> b!1159551 m!1069069))

(declare-fun m!1069071 () Bool)

(assert (=> b!1159551 m!1069071))

(declare-fun m!1069073 () Bool)

(assert (=> b!1159547 m!1069073))

(assert (=> b!1159559 m!1069063))

(declare-fun m!1069075 () Bool)

(assert (=> mapNonEmpty!45377 m!1069075))

(declare-fun m!1069077 () Bool)

(assert (=> bm!55667 m!1069077))

(declare-fun m!1069079 () Bool)

(assert (=> b!1159531 m!1069079))

(declare-fun m!1069081 () Bool)

(assert (=> b!1159554 m!1069081))

(declare-fun m!1069083 () Bool)

(assert (=> b!1159554 m!1069083))

(declare-fun m!1069085 () Bool)

(assert (=> b!1159554 m!1069085))

(declare-fun m!1069087 () Bool)

(assert (=> b!1159554 m!1069087))

(declare-fun m!1069089 () Bool)

(assert (=> b!1159538 m!1069089))

(declare-fun m!1069091 () Bool)

(assert (=> b!1159533 m!1069091))

(declare-fun m!1069093 () Bool)

(assert (=> b!1159536 m!1069093))

(declare-fun m!1069095 () Bool)

(assert (=> b!1159536 m!1069095))

(declare-fun m!1069097 () Bool)

(assert (=> b!1159536 m!1069097))

(declare-fun m!1069099 () Bool)

(assert (=> b!1159536 m!1069099))

(declare-fun m!1069101 () Bool)

(assert (=> b!1159555 m!1069101))

(assert (=> b!1159555 m!1069055))

(assert (=> b!1159555 m!1069055))

(declare-fun m!1069103 () Bool)

(assert (=> b!1159555 m!1069103))

(assert (=> b!1159555 m!1069077))

(declare-fun m!1069105 () Bool)

(assert (=> b!1159555 m!1069105))

(assert (=> b!1159555 m!1069101))

(assert (=> b!1159555 m!1069055))

(declare-fun m!1069107 () Bool)

(assert (=> b!1159555 m!1069107))

(declare-fun m!1069109 () Bool)

(assert (=> b!1159555 m!1069109))

(declare-fun m!1069111 () Bool)

(assert (=> b!1159555 m!1069111))

(declare-fun m!1069113 () Bool)

(assert (=> b!1159555 m!1069113))

(assert (=> b!1159555 m!1069111))

(declare-fun m!1069115 () Bool)

(assert (=> b!1159545 m!1069115))

(declare-fun m!1069117 () Bool)

(assert (=> b!1159545 m!1069117))

(declare-fun m!1069119 () Bool)

(assert (=> bm!55670 m!1069119))

(check-sat (not b!1159556) (not b!1159533) (not b!1159538) (not b!1159544) (not start!99136) (not b!1159555) (not b!1159536) (not b!1159550) (not bm!55669) (not b_next!24505) (not bm!55670) (not b_lambda!19605) (not b!1159531) (not b!1159551) (not bm!55668) (not bm!55665) (not b!1159552) (not b!1159547) (not b!1159545) b_and!39863 (not bm!55667) (not b!1159535) (not b!1159543) (not b!1159559) tp_is_empty!29035 (not mapNonEmpty!45377) (not b!1159554))
(check-sat b_and!39863 (not b_next!24505))
