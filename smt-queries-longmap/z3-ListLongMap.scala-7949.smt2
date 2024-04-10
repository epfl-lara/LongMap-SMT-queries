; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98536 () Bool)

(assert start!98536)

(declare-fun b_free!24141 () Bool)

(declare-fun b_next!24141 () Bool)

(assert (=> start!98536 (= b_free!24141 (not b_next!24141))))

(declare-fun tp!85133 () Bool)

(declare-fun b_and!39131 () Bool)

(assert (=> start!98536 (= tp!85133 b_and!39131)))

(declare-fun b!1141583 () Bool)

(declare-fun e!649467 () Bool)

(declare-fun e!649468 () Bool)

(assert (=> b!1141583 (= e!649467 e!649468)))

(declare-fun res!760928 () Bool)

(assert (=> b!1141583 (=> (not res!760928) (not e!649468))))

(declare-datatypes ((array!74197 0))(
  ( (array!74198 (arr!35749 (Array (_ BitVec 32) (_ BitVec 64))) (size!36285 (_ BitVec 32))) )
))
(declare-fun lt!508649 () array!74197)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74197 (_ BitVec 32)) Bool)

(assert (=> b!1141583 (= res!760928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508649 mask!1564))))

(declare-fun _keys!1208 () array!74197)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141583 (= lt!508649 (array!74198 (store (arr!35749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36285 _keys!1208)))))

(declare-fun b!1141584 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!649479 () Bool)

(declare-fun arrayContainsKey!0 (array!74197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141584 (= e!649479 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141585 () Bool)

(declare-fun call!51241 () Bool)

(assert (=> b!1141585 call!51241))

(declare-datatypes ((Unit!37443 0))(
  ( (Unit!37444) )
))
(declare-fun lt!508648 () Unit!37443)

(declare-fun call!51236 () Unit!37443)

(assert (=> b!1141585 (= lt!508648 call!51236)))

(declare-fun e!649470 () Unit!37443)

(assert (=> b!1141585 (= e!649470 lt!508648)))

(declare-fun b!1141586 () Bool)

(declare-fun res!760926 () Bool)

(assert (=> b!1141586 (=> (not res!760926) (not e!649467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141586 (= res!760926 (validKeyInArray!0 k0!934))))

(declare-datatypes ((V!43355 0))(
  ( (V!43356 (val!14392 Int)) )
))
(declare-fun zeroValue!944 () V!43355)

(declare-fun bm!51231 () Bool)

(declare-datatypes ((tuple2!18206 0))(
  ( (tuple2!18207 (_1!9114 (_ BitVec 64)) (_2!9114 V!43355)) )
))
(declare-datatypes ((List!24961 0))(
  ( (Nil!24958) (Cons!24957 (h!26166 tuple2!18206) (t!36094 List!24961)) )
))
(declare-datatypes ((ListLongMap!16175 0))(
  ( (ListLongMap!16176 (toList!8103 List!24961)) )
))
(declare-fun call!51240 () ListLongMap!16175)

(declare-fun c!112127 () Bool)

(declare-fun minValue!944 () V!43355)

(declare-fun lt!508645 () ListLongMap!16175)

(declare-fun lt!508641 () ListLongMap!16175)

(declare-fun c!112128 () Bool)

(declare-fun +!3534 (ListLongMap!16175 tuple2!18206) ListLongMap!16175)

(assert (=> bm!51231 (= call!51240 (+!3534 (ite c!112127 lt!508641 lt!508645) (ite c!112127 (tuple2!18207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112128 (tuple2!18207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1141587 () Bool)

(declare-fun Unit!37445 () Unit!37443)

(assert (=> b!1141587 (= e!649470 Unit!37445)))

(declare-fun b!1141588 () Bool)

(declare-fun e!649474 () Unit!37443)

(declare-fun Unit!37446 () Unit!37443)

(assert (=> b!1141588 (= e!649474 Unit!37446)))

(declare-fun lt!508638 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1141588 (= lt!508638 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141588 (= c!112127 (and (not lt!508638) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508650 () Unit!37443)

(declare-fun e!649465 () Unit!37443)

(assert (=> b!1141588 (= lt!508650 e!649465)))

(declare-fun lt!508642 () Unit!37443)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13626 0))(
  ( (ValueCellFull!13626 (v!17029 V!43355)) (EmptyCell!13626) )
))
(declare-datatypes ((array!74199 0))(
  ( (array!74200 (arr!35750 (Array (_ BitVec 32) ValueCell!13626)) (size!36286 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74199)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!388 (array!74197 array!74199 (_ BitVec 32) (_ BitVec 32) V!43355 V!43355 (_ BitVec 64) (_ BitVec 32) Int) Unit!37443)

(assert (=> b!1141588 (= lt!508642 (lemmaListMapContainsThenArrayContainsFrom!388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112129 () Bool)

(assert (=> b!1141588 (= c!112129 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760925 () Bool)

(assert (=> b!1141588 (= res!760925 e!649479)))

(declare-fun e!649477 () Bool)

(assert (=> b!1141588 (=> (not res!760925) (not e!649477))))

(assert (=> b!1141588 e!649477))

(declare-fun lt!508636 () Unit!37443)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74197 (_ BitVec 32) (_ BitVec 32)) Unit!37443)

(assert (=> b!1141588 (= lt!508636 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24962 0))(
  ( (Nil!24959) (Cons!24958 (h!26167 (_ BitVec 64)) (t!36095 List!24962)) )
))
(declare-fun arrayNoDuplicates!0 (array!74197 (_ BitVec 32) List!24962) Bool)

(assert (=> b!1141588 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24959)))

(declare-fun lt!508643 () Unit!37443)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74197 (_ BitVec 64) (_ BitVec 32) List!24962) Unit!37443)

(assert (=> b!1141588 (= lt!508643 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24959))))

(assert (=> b!1141588 false))

(declare-fun b!1141589 () Bool)

(declare-fun e!649478 () Bool)

(assert (=> b!1141589 (= e!649468 (not e!649478))))

(declare-fun res!760932 () Bool)

(assert (=> b!1141589 (=> res!760932 e!649478)))

(assert (=> b!1141589 (= res!760932 (bvsgt from!1455 i!673))))

(assert (=> b!1141589 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508651 () Unit!37443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74197 (_ BitVec 64) (_ BitVec 32)) Unit!37443)

(assert (=> b!1141589 (= lt!508651 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141590 () Bool)

(assert (=> b!1141590 (= e!649477 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51232 () Bool)

(declare-fun call!51238 () Unit!37443)

(declare-fun addStillContains!791 (ListLongMap!16175 (_ BitVec 64) V!43355 (_ BitVec 64)) Unit!37443)

(assert (=> bm!51232 (= call!51238 (addStillContains!791 lt!508645 (ite (or c!112127 c!112128) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112127 c!112128) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141591 () Bool)

(declare-fun e!649464 () Bool)

(declare-fun tp_is_empty!28671 () Bool)

(assert (=> b!1141591 (= e!649464 tp_is_empty!28671)))

(declare-fun res!760927 () Bool)

(assert (=> start!98536 (=> (not res!760927) (not e!649467))))

(assert (=> start!98536 (= res!760927 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36285 _keys!1208))))))

(assert (=> start!98536 e!649467))

(assert (=> start!98536 tp_is_empty!28671))

(declare-fun array_inv!27402 (array!74197) Bool)

(assert (=> start!98536 (array_inv!27402 _keys!1208)))

(assert (=> start!98536 true))

(assert (=> start!98536 tp!85133))

(declare-fun e!649473 () Bool)

(declare-fun array_inv!27403 (array!74199) Bool)

(assert (=> start!98536 (and (array_inv!27403 _values!996) e!649473)))

(declare-fun b!1141592 () Bool)

(declare-fun res!760937 () Bool)

(assert (=> b!1141592 (=> (not res!760937) (not e!649467))))

(assert (=> b!1141592 (= res!760937 (= (select (arr!35749 _keys!1208) i!673) k0!934))))

(declare-fun b!1141593 () Bool)

(declare-fun e!649475 () Unit!37443)

(declare-fun lt!508644 () Unit!37443)

(assert (=> b!1141593 (= e!649475 lt!508644)))

(assert (=> b!1141593 (= lt!508644 call!51236)))

(assert (=> b!1141593 call!51241))

(declare-fun call!51237 () ListLongMap!16175)

(declare-fun bm!51233 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4585 (array!74197 array!74199 (_ BitVec 32) (_ BitVec 32) V!43355 V!43355 (_ BitVec 32) Int) ListLongMap!16175)

(assert (=> bm!51233 (= call!51237 (getCurrentListMapNoExtraKeys!4585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141594 () Bool)

(declare-fun res!760934 () Bool)

(assert (=> b!1141594 (=> (not res!760934) (not e!649467))))

(assert (=> b!1141594 (= res!760934 (and (= (size!36286 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36285 _keys!1208) (size!36286 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51234 () Bool)

(declare-fun call!51235 () Bool)

(assert (=> bm!51234 (= call!51241 call!51235)))

(declare-fun b!1141595 () Bool)

(declare-fun e!649472 () Bool)

(assert (=> b!1141595 (= e!649472 tp_is_empty!28671)))

(declare-fun b!1141596 () Bool)

(declare-fun e!649466 () Bool)

(assert (=> b!1141596 (= e!649466 true)))

(declare-fun lt!508639 () V!43355)

(declare-fun -!1253 (ListLongMap!16175 (_ BitVec 64)) ListLongMap!16175)

(assert (=> b!1141596 (= (-!1253 (+!3534 lt!508645 (tuple2!18207 (select (arr!35749 _keys!1208) from!1455) lt!508639)) (select (arr!35749 _keys!1208) from!1455)) lt!508645)))

(declare-fun lt!508633 () Unit!37443)

(declare-fun addThenRemoveForNewKeyIsSame!106 (ListLongMap!16175 (_ BitVec 64) V!43355) Unit!37443)

(assert (=> b!1141596 (= lt!508633 (addThenRemoveForNewKeyIsSame!106 lt!508645 (select (arr!35749 _keys!1208) from!1455) lt!508639))))

(declare-fun lt!508634 () V!43355)

(declare-fun get!18166 (ValueCell!13626 V!43355) V!43355)

(assert (=> b!1141596 (= lt!508639 (get!18166 (select (arr!35750 _values!996) from!1455) lt!508634))))

(declare-fun lt!508647 () Unit!37443)

(assert (=> b!1141596 (= lt!508647 e!649474)))

(declare-fun c!112131 () Bool)

(declare-fun contains!6638 (ListLongMap!16175 (_ BitVec 64)) Bool)

(assert (=> b!1141596 (= c!112131 (contains!6638 lt!508645 k0!934))))

(assert (=> b!1141596 (= lt!508645 (getCurrentListMapNoExtraKeys!4585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141597 () Bool)

(declare-fun res!760936 () Bool)

(assert (=> b!1141597 (=> (not res!760936) (not e!649467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141597 (= res!760936 (validMask!0 mask!1564))))

(declare-fun b!1141598 () Bool)

(assert (=> b!1141598 (contains!6638 call!51240 k0!934)))

(declare-fun lt!508635 () Unit!37443)

(assert (=> b!1141598 (= lt!508635 (addStillContains!791 lt!508641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141598 call!51235))

(assert (=> b!1141598 (= lt!508641 (+!3534 lt!508645 (tuple2!18207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508652 () Unit!37443)

(assert (=> b!1141598 (= lt!508652 call!51238)))

(assert (=> b!1141598 (= e!649465 lt!508635)))

(declare-fun b!1141599 () Bool)

(declare-fun res!760935 () Bool)

(assert (=> b!1141599 (=> (not res!760935) (not e!649467))))

(assert (=> b!1141599 (= res!760935 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36285 _keys!1208))))))

(declare-fun bm!51235 () Bool)

(declare-fun call!51234 () ListLongMap!16175)

(assert (=> bm!51235 (= call!51234 call!51240)))

(declare-fun b!1141600 () Bool)

(declare-fun e!649476 () Bool)

(declare-fun call!51239 () ListLongMap!16175)

(assert (=> b!1141600 (= e!649476 (= call!51239 call!51237))))

(declare-fun b!1141601 () Bool)

(assert (=> b!1141601 (= e!649479 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508638) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51236 () Bool)

(declare-fun lt!508653 () array!74199)

(assert (=> bm!51236 (= call!51239 (getCurrentListMapNoExtraKeys!4585 lt!508649 lt!508653 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141602 () Bool)

(declare-fun e!649471 () Bool)

(assert (=> b!1141602 (= e!649478 e!649471)))

(declare-fun res!760924 () Bool)

(assert (=> b!1141602 (=> res!760924 e!649471)))

(assert (=> b!1141602 (= res!760924 (not (= from!1455 i!673)))))

(declare-fun lt!508646 () ListLongMap!16175)

(assert (=> b!1141602 (= lt!508646 (getCurrentListMapNoExtraKeys!4585 lt!508649 lt!508653 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1141602 (= lt!508653 (array!74200 (store (arr!35750 _values!996) i!673 (ValueCellFull!13626 lt!508634)) (size!36286 _values!996)))))

(declare-fun dynLambda!2629 (Int (_ BitVec 64)) V!43355)

(assert (=> b!1141602 (= lt!508634 (dynLambda!2629 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508637 () ListLongMap!16175)

(assert (=> b!1141602 (= lt!508637 (getCurrentListMapNoExtraKeys!4585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141603 () Bool)

(assert (=> b!1141603 (= e!649471 e!649466)))

(declare-fun res!760931 () Bool)

(assert (=> b!1141603 (=> res!760931 e!649466)))

(assert (=> b!1141603 (= res!760931 (not (= (select (arr!35749 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1141603 e!649476))

(declare-fun c!112132 () Bool)

(assert (=> b!1141603 (= c!112132 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508640 () Unit!37443)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!498 (array!74197 array!74199 (_ BitVec 32) (_ BitVec 32) V!43355 V!43355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37443)

(assert (=> b!1141603 (= lt!508640 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141604 () Bool)

(assert (=> b!1141604 (= e!649475 e!649470)))

(declare-fun c!112130 () Bool)

(assert (=> b!1141604 (= c!112130 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508638))))

(declare-fun b!1141605 () Bool)

(declare-fun res!760933 () Bool)

(assert (=> b!1141605 (=> (not res!760933) (not e!649467))))

(assert (=> b!1141605 (= res!760933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44831 () Bool)

(declare-fun mapRes!44831 () Bool)

(assert (=> mapIsEmpty!44831 mapRes!44831))

(declare-fun b!1141606 () Bool)

(assert (=> b!1141606 (= e!649473 (and e!649472 mapRes!44831))))

(declare-fun condMapEmpty!44831 () Bool)

(declare-fun mapDefault!44831 () ValueCell!13626)

(assert (=> b!1141606 (= condMapEmpty!44831 (= (arr!35750 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13626)) mapDefault!44831)))))

(declare-fun b!1141607 () Bool)

(declare-fun res!760930 () Bool)

(assert (=> b!1141607 (=> (not res!760930) (not e!649468))))

(assert (=> b!1141607 (= res!760930 (arrayNoDuplicates!0 lt!508649 #b00000000000000000000000000000000 Nil!24959))))

(declare-fun b!1141608 () Bool)

(assert (=> b!1141608 (= e!649476 (= call!51239 (-!1253 call!51237 k0!934)))))

(declare-fun b!1141609 () Bool)

(assert (=> b!1141609 (= c!112128 (and (not lt!508638) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1141609 (= e!649465 e!649475)))

(declare-fun bm!51237 () Bool)

(assert (=> bm!51237 (= call!51235 (contains!6638 (ite c!112127 lt!508641 call!51234) k0!934))))

(declare-fun b!1141610 () Bool)

(declare-fun Unit!37447 () Unit!37443)

(assert (=> b!1141610 (= e!649474 Unit!37447)))

(declare-fun mapNonEmpty!44831 () Bool)

(declare-fun tp!85134 () Bool)

(assert (=> mapNonEmpty!44831 (= mapRes!44831 (and tp!85134 e!649464))))

(declare-fun mapValue!44831 () ValueCell!13626)

(declare-fun mapKey!44831 () (_ BitVec 32))

(declare-fun mapRest!44831 () (Array (_ BitVec 32) ValueCell!13626))

(assert (=> mapNonEmpty!44831 (= (arr!35750 _values!996) (store mapRest!44831 mapKey!44831 mapValue!44831))))

(declare-fun b!1141611 () Bool)

(declare-fun res!760929 () Bool)

(assert (=> b!1141611 (=> (not res!760929) (not e!649467))))

(assert (=> b!1141611 (= res!760929 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24959))))

(declare-fun bm!51238 () Bool)

(assert (=> bm!51238 (= call!51236 call!51238)))

(assert (= (and start!98536 res!760927) b!1141597))

(assert (= (and b!1141597 res!760936) b!1141594))

(assert (= (and b!1141594 res!760934) b!1141605))

(assert (= (and b!1141605 res!760933) b!1141611))

(assert (= (and b!1141611 res!760929) b!1141599))

(assert (= (and b!1141599 res!760935) b!1141586))

(assert (= (and b!1141586 res!760926) b!1141592))

(assert (= (and b!1141592 res!760937) b!1141583))

(assert (= (and b!1141583 res!760928) b!1141607))

(assert (= (and b!1141607 res!760930) b!1141589))

(assert (= (and b!1141589 (not res!760932)) b!1141602))

(assert (= (and b!1141602 (not res!760924)) b!1141603))

(assert (= (and b!1141603 c!112132) b!1141608))

(assert (= (and b!1141603 (not c!112132)) b!1141600))

(assert (= (or b!1141608 b!1141600) bm!51236))

(assert (= (or b!1141608 b!1141600) bm!51233))

(assert (= (and b!1141603 (not res!760931)) b!1141596))

(assert (= (and b!1141596 c!112131) b!1141588))

(assert (= (and b!1141596 (not c!112131)) b!1141610))

(assert (= (and b!1141588 c!112127) b!1141598))

(assert (= (and b!1141588 (not c!112127)) b!1141609))

(assert (= (and b!1141609 c!112128) b!1141593))

(assert (= (and b!1141609 (not c!112128)) b!1141604))

(assert (= (and b!1141604 c!112130) b!1141585))

(assert (= (and b!1141604 (not c!112130)) b!1141587))

(assert (= (or b!1141593 b!1141585) bm!51238))

(assert (= (or b!1141593 b!1141585) bm!51235))

(assert (= (or b!1141593 b!1141585) bm!51234))

(assert (= (or b!1141598 bm!51234) bm!51237))

(assert (= (or b!1141598 bm!51238) bm!51232))

(assert (= (or b!1141598 bm!51235) bm!51231))

(assert (= (and b!1141588 c!112129) b!1141584))

(assert (= (and b!1141588 (not c!112129)) b!1141601))

(assert (= (and b!1141588 res!760925) b!1141590))

(assert (= (and b!1141606 condMapEmpty!44831) mapIsEmpty!44831))

(assert (= (and b!1141606 (not condMapEmpty!44831)) mapNonEmpty!44831))

(get-info :version)

(assert (= (and mapNonEmpty!44831 ((_ is ValueCellFull!13626) mapValue!44831)) b!1141591))

(assert (= (and b!1141606 ((_ is ValueCellFull!13626) mapDefault!44831)) b!1141595))

(assert (= start!98536 b!1141606))

(declare-fun b_lambda!19247 () Bool)

(assert (=> (not b_lambda!19247) (not b!1141602)))

(declare-fun t!36093 () Bool)

(declare-fun tb!8953 () Bool)

(assert (=> (and start!98536 (= defaultEntry!1004 defaultEntry!1004) t!36093) tb!8953))

(declare-fun result!18471 () Bool)

(assert (=> tb!8953 (= result!18471 tp_is_empty!28671)))

(assert (=> b!1141602 t!36093))

(declare-fun b_and!39133 () Bool)

(assert (= b_and!39131 (and (=> t!36093 result!18471) b_and!39133)))

(declare-fun m!1052953 () Bool)

(assert (=> bm!51237 m!1052953))

(declare-fun m!1052955 () Bool)

(assert (=> bm!51231 m!1052955))

(declare-fun m!1052957 () Bool)

(assert (=> b!1141586 m!1052957))

(declare-fun m!1052959 () Bool)

(assert (=> b!1141603 m!1052959))

(declare-fun m!1052961 () Bool)

(assert (=> b!1141603 m!1052961))

(declare-fun m!1052963 () Bool)

(assert (=> b!1141602 m!1052963))

(declare-fun m!1052965 () Bool)

(assert (=> b!1141602 m!1052965))

(declare-fun m!1052967 () Bool)

(assert (=> b!1141602 m!1052967))

(declare-fun m!1052969 () Bool)

(assert (=> b!1141602 m!1052969))

(declare-fun m!1052971 () Bool)

(assert (=> b!1141589 m!1052971))

(declare-fun m!1052973 () Bool)

(assert (=> b!1141589 m!1052973))

(declare-fun m!1052975 () Bool)

(assert (=> b!1141607 m!1052975))

(declare-fun m!1052977 () Bool)

(assert (=> b!1141605 m!1052977))

(declare-fun m!1052979 () Bool)

(assert (=> mapNonEmpty!44831 m!1052979))

(declare-fun m!1052981 () Bool)

(assert (=> b!1141597 m!1052981))

(declare-fun m!1052983 () Bool)

(assert (=> b!1141590 m!1052983))

(declare-fun m!1052985 () Bool)

(assert (=> b!1141598 m!1052985))

(declare-fun m!1052987 () Bool)

(assert (=> b!1141598 m!1052987))

(declare-fun m!1052989 () Bool)

(assert (=> b!1141598 m!1052989))

(declare-fun m!1052991 () Bool)

(assert (=> bm!51233 m!1052991))

(assert (=> b!1141584 m!1052983))

(declare-fun m!1052993 () Bool)

(assert (=> b!1141608 m!1052993))

(declare-fun m!1052995 () Bool)

(assert (=> bm!51232 m!1052995))

(declare-fun m!1052997 () Bool)

(assert (=> b!1141592 m!1052997))

(declare-fun m!1052999 () Bool)

(assert (=> bm!51236 m!1052999))

(declare-fun m!1053001 () Bool)

(assert (=> start!98536 m!1053001))

(declare-fun m!1053003 () Bool)

(assert (=> start!98536 m!1053003))

(assert (=> b!1141596 m!1052991))

(declare-fun m!1053005 () Bool)

(assert (=> b!1141596 m!1053005))

(declare-fun m!1053007 () Bool)

(assert (=> b!1141596 m!1053007))

(assert (=> b!1141596 m!1052959))

(declare-fun m!1053009 () Bool)

(assert (=> b!1141596 m!1053009))

(declare-fun m!1053011 () Bool)

(assert (=> b!1141596 m!1053011))

(assert (=> b!1141596 m!1053007))

(assert (=> b!1141596 m!1052959))

(declare-fun m!1053013 () Bool)

(assert (=> b!1141596 m!1053013))

(assert (=> b!1141596 m!1053005))

(declare-fun m!1053015 () Bool)

(assert (=> b!1141596 m!1053015))

(assert (=> b!1141596 m!1052959))

(declare-fun m!1053017 () Bool)

(assert (=> b!1141588 m!1053017))

(declare-fun m!1053019 () Bool)

(assert (=> b!1141588 m!1053019))

(declare-fun m!1053021 () Bool)

(assert (=> b!1141588 m!1053021))

(declare-fun m!1053023 () Bool)

(assert (=> b!1141588 m!1053023))

(declare-fun m!1053025 () Bool)

(assert (=> b!1141583 m!1053025))

(declare-fun m!1053027 () Bool)

(assert (=> b!1141583 m!1053027))

(declare-fun m!1053029 () Bool)

(assert (=> b!1141611 m!1053029))

(check-sat (not mapNonEmpty!44831) (not b!1141588) (not b!1141597) (not bm!51231) (not b!1141602) (not b!1141605) (not bm!51233) (not b_next!24141) (not b!1141596) b_and!39133 (not b!1141590) (not b!1141584) (not b!1141598) (not b!1141589) (not b!1141611) (not start!98536) (not b!1141603) (not b!1141608) (not bm!51236) (not b!1141586) (not bm!51232) (not b!1141607) tp_is_empty!28671 (not b!1141583) (not bm!51237) (not b_lambda!19247))
(check-sat b_and!39133 (not b_next!24141))
