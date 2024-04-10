; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98722 () Bool)

(assert start!98722)

(declare-fun b_free!24327 () Bool)

(declare-fun b_next!24327 () Bool)

(assert (=> start!98722 (= b_free!24327 (not b_next!24327))))

(declare-fun tp!85691 () Bool)

(declare-fun b_and!39503 () Bool)

(assert (=> start!98722 (= tp!85691 b_and!39503)))

(declare-fun e!654131 () Bool)

(declare-datatypes ((V!43603 0))(
  ( (V!43604 (val!14485 Int)) )
))
(declare-datatypes ((tuple2!18382 0))(
  ( (tuple2!18383 (_1!9202 (_ BitVec 64)) (_2!9202 V!43603)) )
))
(declare-datatypes ((List!25131 0))(
  ( (Nil!25128) (Cons!25127 (h!26336 tuple2!18382) (t!36450 List!25131)) )
))
(declare-datatypes ((ListLongMap!16351 0))(
  ( (ListLongMap!16352 (toList!8191 List!25131)) )
))
(declare-fun call!53473 () ListLongMap!16351)

(declare-fun b!1150054 () Bool)

(declare-fun call!53470 () ListLongMap!16351)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1324 (ListLongMap!16351 (_ BitVec 64)) ListLongMap!16351)

(assert (=> b!1150054 (= e!654131 (= call!53473 (-!1324 call!53470 k0!934)))))

(declare-fun bm!53463 () Bool)

(declare-fun call!53466 () ListLongMap!16351)

(declare-fun call!53471 () ListLongMap!16351)

(assert (=> bm!53463 (= call!53466 call!53471)))

(declare-datatypes ((array!74561 0))(
  ( (array!74562 (arr!35931 (Array (_ BitVec 32) (_ BitVec 64))) (size!36467 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74561)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1150055 () Bool)

(declare-fun e!654128 () Bool)

(declare-fun arrayContainsKey!0 (array!74561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150055 (= e!654128 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150056 () Bool)

(declare-fun contains!6712 (ListLongMap!16351 (_ BitVec 64)) Bool)

(assert (=> b!1150056 (contains!6712 call!53471 k0!934)))

(declare-datatypes ((Unit!37814 0))(
  ( (Unit!37815) )
))
(declare-fun lt!514529 () Unit!37814)

(declare-fun lt!514544 () ListLongMap!16351)

(declare-fun minValue!944 () V!43603)

(declare-fun addStillContains!862 (ListLongMap!16351 (_ BitVec 64) V!43603 (_ BitVec 64)) Unit!37814)

(assert (=> b!1150056 (= lt!514529 (addStillContains!862 lt!514544 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53467 () Bool)

(assert (=> b!1150056 call!53467))

(declare-fun lt!514534 () ListLongMap!16351)

(declare-fun zeroValue!944 () V!43603)

(declare-fun +!3612 (ListLongMap!16351 tuple2!18382) ListLongMap!16351)

(assert (=> b!1150056 (= lt!514544 (+!3612 lt!514534 (tuple2!18383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514537 () Unit!37814)

(declare-fun call!53469 () Unit!37814)

(assert (=> b!1150056 (= lt!514537 call!53469)))

(declare-fun e!654137 () Unit!37814)

(assert (=> b!1150056 (= e!654137 lt!514529)))

(declare-fun res!765028 () Bool)

(declare-fun e!654133 () Bool)

(assert (=> start!98722 (=> (not res!765028) (not e!654133))))

(assert (=> start!98722 (= res!765028 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36467 _keys!1208))))))

(assert (=> start!98722 e!654133))

(declare-fun tp_is_empty!28857 () Bool)

(assert (=> start!98722 tp_is_empty!28857))

(declare-fun array_inv!27518 (array!74561) Bool)

(assert (=> start!98722 (array_inv!27518 _keys!1208)))

(assert (=> start!98722 true))

(assert (=> start!98722 tp!85691))

(declare-datatypes ((ValueCell!13719 0))(
  ( (ValueCellFull!13719 (v!17122 V!43603)) (EmptyCell!13719) )
))
(declare-datatypes ((array!74563 0))(
  ( (array!74564 (arr!35932 (Array (_ BitVec 32) ValueCell!13719)) (size!36468 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74563)

(declare-fun e!654135 () Bool)

(declare-fun array_inv!27519 (array!74563) Bool)

(assert (=> start!98722 (and (array_inv!27519 _values!996) e!654135)))

(declare-fun b!1150057 () Bool)

(declare-fun e!654138 () Bool)

(assert (=> b!1150057 (= e!654138 tp_is_empty!28857)))

(declare-fun c!113801 () Bool)

(declare-fun bm!53464 () Bool)

(assert (=> bm!53464 (= call!53467 (contains!6712 (ite c!113801 lt!514544 call!53466) k0!934))))

(declare-fun b!1150058 () Bool)

(declare-fun e!654132 () Bool)

(declare-fun e!654127 () Bool)

(assert (=> b!1150058 (= e!654132 e!654127)))

(declare-fun res!765029 () Bool)

(assert (=> b!1150058 (=> res!765029 e!654127)))

(assert (=> b!1150058 (= res!765029 (not (= (select (arr!35931 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150058 e!654131))

(declare-fun c!113804 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150058 (= c!113804 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!514540 () Unit!37814)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!561 (array!74561 array!74563 (_ BitVec 32) (_ BitVec 32) V!43603 V!43603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37814)

(assert (=> b!1150058 (= lt!514540 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53465 () Bool)

(declare-fun c!113806 () Bool)

(assert (=> bm!53465 (= call!53469 (addStillContains!862 lt!514534 (ite (or c!113801 c!113806) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113801 c!113806) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1150059 () Bool)

(declare-fun res!765038 () Bool)

(assert (=> b!1150059 (=> (not res!765038) (not e!654133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74561 (_ BitVec 32)) Bool)

(assert (=> b!1150059 (= res!765038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53466 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4664 (array!74561 array!74563 (_ BitVec 32) (_ BitVec 32) V!43603 V!43603 (_ BitVec 32) Int) ListLongMap!16351)

(assert (=> bm!53466 (= call!53470 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150060 () Bool)

(declare-fun res!765032 () Bool)

(assert (=> b!1150060 (=> (not res!765032) (not e!654133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150060 (= res!765032 (validKeyInArray!0 k0!934))))

(declare-fun b!1150061 () Bool)

(declare-fun res!765034 () Bool)

(assert (=> b!1150061 (=> (not res!765034) (not e!654133))))

(assert (=> b!1150061 (= res!765034 (= (select (arr!35931 _keys!1208) i!673) k0!934))))

(declare-fun bm!53467 () Bool)

(declare-fun call!53468 () Unit!37814)

(assert (=> bm!53467 (= call!53468 call!53469)))

(declare-fun bm!53468 () Bool)

(declare-fun call!53472 () Bool)

(assert (=> bm!53468 (= call!53472 call!53467)))

(declare-fun bm!53469 () Bool)

(declare-fun lt!514527 () array!74561)

(declare-fun lt!514538 () array!74563)

(assert (=> bm!53469 (= call!53473 (getCurrentListMapNoExtraKeys!4664 lt!514527 lt!514538 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150062 () Bool)

(declare-fun lt!514531 () Bool)

(assert (=> b!1150062 (= c!113806 (and (not lt!514531) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654136 () Unit!37814)

(assert (=> b!1150062 (= e!654137 e!654136)))

(declare-fun b!1150063 () Bool)

(declare-fun e!654130 () Unit!37814)

(declare-fun Unit!37816 () Unit!37814)

(assert (=> b!1150063 (= e!654130 Unit!37816)))

(declare-fun b!1150064 () Bool)

(declare-fun res!765031 () Bool)

(assert (=> b!1150064 (=> (not res!765031) (not e!654133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150064 (= res!765031 (validMask!0 mask!1564))))

(declare-fun b!1150065 () Bool)

(declare-fun e!654134 () Bool)

(declare-fun e!654122 () Bool)

(assert (=> b!1150065 (= e!654134 (not e!654122))))

(declare-fun res!765026 () Bool)

(assert (=> b!1150065 (=> res!765026 e!654122)))

(assert (=> b!1150065 (= res!765026 (bvsgt from!1455 i!673))))

(assert (=> b!1150065 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514536 () Unit!37814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74561 (_ BitVec 64) (_ BitVec 32)) Unit!37814)

(assert (=> b!1150065 (= lt!514536 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150066 () Bool)

(declare-fun e!654126 () Bool)

(assert (=> b!1150066 (= e!654126 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514531) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150067 () Bool)

(assert (=> b!1150067 (= e!654126 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150068 () Bool)

(assert (=> b!1150068 (= e!654127 true)))

(declare-fun e!654124 () Bool)

(assert (=> b!1150068 e!654124))

(declare-fun res!765024 () Bool)

(assert (=> b!1150068 (=> (not res!765024) (not e!654124))))

(declare-fun lt!514530 () ListLongMap!16351)

(assert (=> b!1150068 (= res!765024 (= lt!514530 lt!514534))))

(declare-fun lt!514545 () ListLongMap!16351)

(assert (=> b!1150068 (= lt!514530 (-!1324 lt!514545 k0!934))))

(declare-fun lt!514524 () V!43603)

(assert (=> b!1150068 (= (-!1324 (+!3612 lt!514534 (tuple2!18383 (select (arr!35931 _keys!1208) from!1455) lt!514524)) (select (arr!35931 _keys!1208) from!1455)) lt!514534)))

(declare-fun lt!514539 () Unit!37814)

(declare-fun addThenRemoveForNewKeyIsSame!168 (ListLongMap!16351 (_ BitVec 64) V!43603) Unit!37814)

(assert (=> b!1150068 (= lt!514539 (addThenRemoveForNewKeyIsSame!168 lt!514534 (select (arr!35931 _keys!1208) from!1455) lt!514524))))

(declare-fun lt!514535 () V!43603)

(declare-fun get!18290 (ValueCell!13719 V!43603) V!43603)

(assert (=> b!1150068 (= lt!514524 (get!18290 (select (arr!35932 _values!996) from!1455) lt!514535))))

(declare-fun lt!514533 () Unit!37814)

(assert (=> b!1150068 (= lt!514533 e!654130)))

(declare-fun c!113803 () Bool)

(assert (=> b!1150068 (= c!113803 (contains!6712 lt!514534 k0!934))))

(assert (=> b!1150068 (= lt!514534 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150069 () Bool)

(assert (=> b!1150069 call!53472))

(declare-fun lt!514542 () Unit!37814)

(assert (=> b!1150069 (= lt!514542 call!53468)))

(declare-fun e!654125 () Unit!37814)

(assert (=> b!1150069 (= e!654125 lt!514542)))

(declare-fun b!1150070 () Bool)

(declare-fun res!765027 () Bool)

(assert (=> b!1150070 (=> (not res!765027) (not e!654133))))

(declare-datatypes ((List!25132 0))(
  ( (Nil!25129) (Cons!25128 (h!26337 (_ BitVec 64)) (t!36451 List!25132)) )
))
(declare-fun arrayNoDuplicates!0 (array!74561 (_ BitVec 32) List!25132) Bool)

(assert (=> b!1150070 (= res!765027 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25129))))

(declare-fun b!1150071 () Bool)

(assert (=> b!1150071 (= e!654122 e!654132)))

(declare-fun res!765030 () Bool)

(assert (=> b!1150071 (=> res!765030 e!654132)))

(assert (=> b!1150071 (= res!765030 (not (= from!1455 i!673)))))

(declare-fun lt!514528 () ListLongMap!16351)

(assert (=> b!1150071 (= lt!514528 (getCurrentListMapNoExtraKeys!4664 lt!514527 lt!514538 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150071 (= lt!514538 (array!74564 (store (arr!35932 _values!996) i!673 (ValueCellFull!13719 lt!514535)) (size!36468 _values!996)))))

(declare-fun dynLambda!2688 (Int (_ BitVec 64)) V!43603)

(assert (=> b!1150071 (= lt!514535 (dynLambda!2688 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150071 (= lt!514545 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150072 () Bool)

(declare-fun e!654123 () Bool)

(assert (=> b!1150072 (= e!654123 tp_is_empty!28857)))

(declare-fun mapNonEmpty!45110 () Bool)

(declare-fun mapRes!45110 () Bool)

(declare-fun tp!85692 () Bool)

(assert (=> mapNonEmpty!45110 (= mapRes!45110 (and tp!85692 e!654123))))

(declare-fun mapRest!45110 () (Array (_ BitVec 32) ValueCell!13719))

(declare-fun mapKey!45110 () (_ BitVec 32))

(declare-fun mapValue!45110 () ValueCell!13719)

(assert (=> mapNonEmpty!45110 (= (arr!35932 _values!996) (store mapRest!45110 mapKey!45110 mapValue!45110))))

(declare-fun b!1150073 () Bool)

(declare-fun res!765037 () Bool)

(assert (=> b!1150073 (=> (not res!765037) (not e!654134))))

(assert (=> b!1150073 (= res!765037 (arrayNoDuplicates!0 lt!514527 #b00000000000000000000000000000000 Nil!25129))))

(declare-fun b!1150074 () Bool)

(assert (=> b!1150074 (= e!654131 (= call!53473 call!53470))))

(declare-fun b!1150075 () Bool)

(declare-fun Unit!37817 () Unit!37814)

(assert (=> b!1150075 (= e!654130 Unit!37817)))

(assert (=> b!1150075 (= lt!514531 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150075 (= c!113801 (and (not lt!514531) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514526 () Unit!37814)

(assert (=> b!1150075 (= lt!514526 e!654137)))

(declare-fun lt!514541 () Unit!37814)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!454 (array!74561 array!74563 (_ BitVec 32) (_ BitVec 32) V!43603 V!43603 (_ BitVec 64) (_ BitVec 32) Int) Unit!37814)

(assert (=> b!1150075 (= lt!514541 (lemmaListMapContainsThenArrayContainsFrom!454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113805 () Bool)

(assert (=> b!1150075 (= c!113805 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765033 () Bool)

(assert (=> b!1150075 (= res!765033 e!654126)))

(assert (=> b!1150075 (=> (not res!765033) (not e!654128))))

(assert (=> b!1150075 e!654128))

(declare-fun lt!514525 () Unit!37814)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74561 (_ BitVec 32) (_ BitVec 32)) Unit!37814)

(assert (=> b!1150075 (= lt!514525 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150075 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25129)))

(declare-fun lt!514543 () Unit!37814)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74561 (_ BitVec 64) (_ BitVec 32) List!25132) Unit!37814)

(assert (=> b!1150075 (= lt!514543 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25129))))

(assert (=> b!1150075 false))

(declare-fun mapIsEmpty!45110 () Bool)

(assert (=> mapIsEmpty!45110 mapRes!45110))

(declare-fun b!1150076 () Bool)

(assert (=> b!1150076 (= e!654136 e!654125)))

(declare-fun c!113802 () Bool)

(assert (=> b!1150076 (= c!113802 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514531))))

(declare-fun b!1150077 () Bool)

(assert (=> b!1150077 (= e!654133 e!654134)))

(declare-fun res!765025 () Bool)

(assert (=> b!1150077 (=> (not res!765025) (not e!654134))))

(assert (=> b!1150077 (= res!765025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514527 mask!1564))))

(assert (=> b!1150077 (= lt!514527 (array!74562 (store (arr!35931 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36467 _keys!1208)))))

(declare-fun b!1150078 () Bool)

(declare-fun Unit!37818 () Unit!37814)

(assert (=> b!1150078 (= e!654125 Unit!37818)))

(declare-fun b!1150079 () Bool)

(declare-fun res!765035 () Bool)

(assert (=> b!1150079 (=> (not res!765035) (not e!654133))))

(assert (=> b!1150079 (= res!765035 (and (= (size!36468 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36467 _keys!1208) (size!36468 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150080 () Bool)

(assert (=> b!1150080 (= e!654135 (and e!654138 mapRes!45110))))

(declare-fun condMapEmpty!45110 () Bool)

(declare-fun mapDefault!45110 () ValueCell!13719)

(assert (=> b!1150080 (= condMapEmpty!45110 (= (arr!35932 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13719)) mapDefault!45110)))))

(declare-fun b!1150081 () Bool)

(declare-fun lt!514532 () Unit!37814)

(assert (=> b!1150081 (= e!654136 lt!514532)))

(assert (=> b!1150081 (= lt!514532 call!53468)))

(assert (=> b!1150081 call!53472))

(declare-fun b!1150082 () Bool)

(declare-fun res!765036 () Bool)

(assert (=> b!1150082 (=> (not res!765036) (not e!654133))))

(assert (=> b!1150082 (= res!765036 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36467 _keys!1208))))))

(declare-fun bm!53470 () Bool)

(assert (=> bm!53470 (= call!53471 (+!3612 (ite c!113801 lt!514544 lt!514534) (ite c!113801 (tuple2!18383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113806 (tuple2!18383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1150083 () Bool)

(assert (=> b!1150083 (= e!654124 (= lt!514530 (getCurrentListMapNoExtraKeys!4664 lt!514527 lt!514538 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!98722 res!765028) b!1150064))

(assert (= (and b!1150064 res!765031) b!1150079))

(assert (= (and b!1150079 res!765035) b!1150059))

(assert (= (and b!1150059 res!765038) b!1150070))

(assert (= (and b!1150070 res!765027) b!1150082))

(assert (= (and b!1150082 res!765036) b!1150060))

(assert (= (and b!1150060 res!765032) b!1150061))

(assert (= (and b!1150061 res!765034) b!1150077))

(assert (= (and b!1150077 res!765025) b!1150073))

(assert (= (and b!1150073 res!765037) b!1150065))

(assert (= (and b!1150065 (not res!765026)) b!1150071))

(assert (= (and b!1150071 (not res!765030)) b!1150058))

(assert (= (and b!1150058 c!113804) b!1150054))

(assert (= (and b!1150058 (not c!113804)) b!1150074))

(assert (= (or b!1150054 b!1150074) bm!53469))

(assert (= (or b!1150054 b!1150074) bm!53466))

(assert (= (and b!1150058 (not res!765029)) b!1150068))

(assert (= (and b!1150068 c!113803) b!1150075))

(assert (= (and b!1150068 (not c!113803)) b!1150063))

(assert (= (and b!1150075 c!113801) b!1150056))

(assert (= (and b!1150075 (not c!113801)) b!1150062))

(assert (= (and b!1150062 c!113806) b!1150081))

(assert (= (and b!1150062 (not c!113806)) b!1150076))

(assert (= (and b!1150076 c!113802) b!1150069))

(assert (= (and b!1150076 (not c!113802)) b!1150078))

(assert (= (or b!1150081 b!1150069) bm!53467))

(assert (= (or b!1150081 b!1150069) bm!53463))

(assert (= (or b!1150081 b!1150069) bm!53468))

(assert (= (or b!1150056 bm!53468) bm!53464))

(assert (= (or b!1150056 bm!53467) bm!53465))

(assert (= (or b!1150056 bm!53463) bm!53470))

(assert (= (and b!1150075 c!113805) b!1150067))

(assert (= (and b!1150075 (not c!113805)) b!1150066))

(assert (= (and b!1150075 res!765033) b!1150055))

(assert (= (and b!1150068 res!765024) b!1150083))

(assert (= (and b!1150080 condMapEmpty!45110) mapIsEmpty!45110))

(assert (= (and b!1150080 (not condMapEmpty!45110)) mapNonEmpty!45110))

(get-info :version)

(assert (= (and mapNonEmpty!45110 ((_ is ValueCellFull!13719) mapValue!45110)) b!1150072))

(assert (= (and b!1150080 ((_ is ValueCellFull!13719) mapDefault!45110)) b!1150057))

(assert (= start!98722 b!1150080))

(declare-fun b_lambda!19433 () Bool)

(assert (=> (not b_lambda!19433) (not b!1150071)))

(declare-fun t!36449 () Bool)

(declare-fun tb!9139 () Bool)

(assert (=> (and start!98722 (= defaultEntry!1004 defaultEntry!1004) t!36449) tb!9139))

(declare-fun result!18843 () Bool)

(assert (=> tb!9139 (= result!18843 tp_is_empty!28857)))

(assert (=> b!1150071 t!36449))

(declare-fun b_and!39505 () Bool)

(assert (= b_and!39503 (and (=> t!36449 result!18843) b_and!39505)))

(declare-fun m!1060341 () Bool)

(assert (=> b!1150073 m!1060341))

(declare-fun m!1060343 () Bool)

(assert (=> b!1150060 m!1060343))

(declare-fun m!1060345 () Bool)

(assert (=> b!1150065 m!1060345))

(declare-fun m!1060347 () Bool)

(assert (=> b!1150065 m!1060347))

(declare-fun m!1060349 () Bool)

(assert (=> bm!53465 m!1060349))

(declare-fun m!1060351 () Bool)

(assert (=> mapNonEmpty!45110 m!1060351))

(declare-fun m!1060353 () Bool)

(assert (=> b!1150056 m!1060353))

(declare-fun m!1060355 () Bool)

(assert (=> b!1150056 m!1060355))

(declare-fun m!1060357 () Bool)

(assert (=> b!1150056 m!1060357))

(declare-fun m!1060359 () Bool)

(assert (=> b!1150067 m!1060359))

(declare-fun m!1060361 () Bool)

(assert (=> b!1150058 m!1060361))

(declare-fun m!1060363 () Bool)

(assert (=> b!1150058 m!1060363))

(declare-fun m!1060365 () Bool)

(assert (=> b!1150059 m!1060365))

(declare-fun m!1060367 () Bool)

(assert (=> b!1150061 m!1060367))

(declare-fun m!1060369 () Bool)

(assert (=> b!1150083 m!1060369))

(declare-fun m!1060371 () Bool)

(assert (=> bm!53464 m!1060371))

(declare-fun m!1060373 () Bool)

(assert (=> b!1150077 m!1060373))

(declare-fun m!1060375 () Bool)

(assert (=> b!1150077 m!1060375))

(declare-fun m!1060377 () Bool)

(assert (=> b!1150070 m!1060377))

(declare-fun m!1060379 () Bool)

(assert (=> bm!53466 m!1060379))

(declare-fun m!1060381 () Bool)

(assert (=> b!1150068 m!1060381))

(assert (=> b!1150068 m!1060379))

(declare-fun m!1060383 () Bool)

(assert (=> b!1150068 m!1060383))

(declare-fun m!1060385 () Bool)

(assert (=> b!1150068 m!1060385))

(assert (=> b!1150068 m!1060385))

(assert (=> b!1150068 m!1060361))

(declare-fun m!1060387 () Bool)

(assert (=> b!1150068 m!1060387))

(declare-fun m!1060389 () Bool)

(assert (=> b!1150068 m!1060389))

(assert (=> b!1150068 m!1060361))

(declare-fun m!1060391 () Bool)

(assert (=> b!1150068 m!1060391))

(assert (=> b!1150068 m!1060383))

(declare-fun m!1060393 () Bool)

(assert (=> b!1150068 m!1060393))

(assert (=> b!1150068 m!1060361))

(declare-fun m!1060395 () Bool)

(assert (=> b!1150075 m!1060395))

(declare-fun m!1060397 () Bool)

(assert (=> b!1150075 m!1060397))

(declare-fun m!1060399 () Bool)

(assert (=> b!1150075 m!1060399))

(declare-fun m!1060401 () Bool)

(assert (=> b!1150075 m!1060401))

(declare-fun m!1060403 () Bool)

(assert (=> b!1150071 m!1060403))

(declare-fun m!1060405 () Bool)

(assert (=> b!1150071 m!1060405))

(declare-fun m!1060407 () Bool)

(assert (=> b!1150071 m!1060407))

(declare-fun m!1060409 () Bool)

(assert (=> b!1150071 m!1060409))

(assert (=> bm!53469 m!1060369))

(declare-fun m!1060411 () Bool)

(assert (=> b!1150064 m!1060411))

(declare-fun m!1060413 () Bool)

(assert (=> bm!53470 m!1060413))

(declare-fun m!1060415 () Bool)

(assert (=> b!1150054 m!1060415))

(declare-fun m!1060417 () Bool)

(assert (=> start!98722 m!1060417))

(declare-fun m!1060419 () Bool)

(assert (=> start!98722 m!1060419))

(assert (=> b!1150055 m!1060359))

(check-sat tp_is_empty!28857 (not b!1150075) (not bm!53464) (not b!1150059) (not b!1150067) (not b!1150068) b_and!39505 (not b!1150083) (not bm!53470) (not b!1150060) (not mapNonEmpty!45110) (not bm!53466) (not b!1150073) (not b_next!24327) (not bm!53465) (not b!1150064) (not b!1150070) (not b_lambda!19433) (not b!1150071) (not bm!53469) (not b!1150077) (not b!1150055) (not b!1150065) (not start!98722) (not b!1150054) (not b!1150056) (not b!1150058))
(check-sat b_and!39505 (not b_next!24327))
