; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98798 () Bool)

(assert start!98798)

(declare-fun b_free!24409 () Bool)

(declare-fun b_next!24409 () Bool)

(assert (=> start!98798 (= b_free!24409 (not b_next!24409))))

(declare-fun tp!85938 () Bool)

(declare-fun b_and!39645 () Bool)

(assert (=> start!98798 (= tp!85938 b_and!39645)))

(declare-fun bm!54424 () Bool)

(declare-datatypes ((V!43713 0))(
  ( (V!43714 (val!14526 Int)) )
))
(declare-datatypes ((tuple2!18536 0))(
  ( (tuple2!18537 (_1!9279 (_ BitVec 64)) (_2!9279 V!43713)) )
))
(declare-datatypes ((List!25266 0))(
  ( (Nil!25263) (Cons!25262 (h!26471 tuple2!18536) (t!36658 List!25266)) )
))
(declare-datatypes ((ListLongMap!16505 0))(
  ( (ListLongMap!16506 (toList!8268 List!25266)) )
))
(declare-fun call!54428 () ListLongMap!16505)

(declare-fun call!54431 () ListLongMap!16505)

(assert (=> bm!54424 (= call!54428 call!54431)))

(declare-fun b!1153702 () Bool)

(declare-fun e!656149 () Bool)

(declare-fun e!656150 () Bool)

(assert (=> b!1153702 (= e!656149 e!656150)))

(declare-fun res!766804 () Bool)

(assert (=> b!1153702 (=> (not res!766804) (not e!656150))))

(declare-datatypes ((array!74642 0))(
  ( (array!74643 (arr!35972 (Array (_ BitVec 32) (_ BitVec 64))) (size!36510 (_ BitVec 32))) )
))
(declare-fun lt!517050 () array!74642)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74642 (_ BitVec 32)) Bool)

(assert (=> b!1153702 (= res!766804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517050 mask!1564))))

(declare-fun _keys!1208 () array!74642)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153702 (= lt!517050 (array!74643 (store (arr!35972 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36510 _keys!1208)))))

(declare-fun b!1153703 () Bool)

(declare-fun res!766813 () Bool)

(assert (=> b!1153703 (=> (not res!766813) (not e!656149))))

(assert (=> b!1153703 (= res!766813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!656135 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!517054 () Bool)

(declare-fun b!1153704 () Bool)

(assert (=> b!1153704 (= e!656135 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517054) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153705 () Bool)

(declare-datatypes ((Unit!37808 0))(
  ( (Unit!37809) )
))
(declare-fun e!656151 () Unit!37808)

(declare-fun Unit!37810 () Unit!37808)

(assert (=> b!1153705 (= e!656151 Unit!37810)))

(declare-fun e!656137 () Bool)

(declare-fun b!1153706 () Bool)

(declare-fun call!54430 () ListLongMap!16505)

(declare-fun call!54434 () ListLongMap!16505)

(declare-fun -!1328 (ListLongMap!16505 (_ BitVec 64)) ListLongMap!16505)

(assert (=> b!1153706 (= e!656137 (= call!54434 (-!1328 call!54430 k0!934)))))

(declare-fun b!1153707 () Bool)

(declare-fun res!766807 () Bool)

(assert (=> b!1153707 (=> (not res!766807) (not e!656150))))

(declare-datatypes ((List!25267 0))(
  ( (Nil!25264) (Cons!25263 (h!26472 (_ BitVec 64)) (t!36659 List!25267)) )
))
(declare-fun arrayNoDuplicates!0 (array!74642 (_ BitVec 32) List!25267) Bool)

(assert (=> b!1153707 (= res!766807 (arrayNoDuplicates!0 lt!517050 #b00000000000000000000000000000000 Nil!25264))))

(declare-fun b!1153708 () Bool)

(declare-fun c!114515 () Bool)

(assert (=> b!1153708 (= c!114515 (and (not lt!517054) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656138 () Unit!37808)

(declare-fun e!656141 () Unit!37808)

(assert (=> b!1153708 (= e!656138 e!656141)))

(declare-fun b!1153709 () Bool)

(declare-fun e!656144 () Bool)

(assert (=> b!1153709 (= e!656144 true)))

(declare-fun e!656146 () Bool)

(assert (=> b!1153709 e!656146))

(declare-fun res!766808 () Bool)

(assert (=> b!1153709 (=> (not res!766808) (not e!656146))))

(declare-fun lt!517038 () ListLongMap!16505)

(declare-fun lt!517047 () ListLongMap!16505)

(assert (=> b!1153709 (= res!766808 (= lt!517038 lt!517047))))

(declare-fun lt!517048 () ListLongMap!16505)

(assert (=> b!1153709 (= lt!517038 (-!1328 lt!517048 k0!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!517043 () V!43713)

(declare-fun +!3680 (ListLongMap!16505 tuple2!18536) ListLongMap!16505)

(assert (=> b!1153709 (= (-!1328 (+!3680 lt!517047 (tuple2!18537 (select (arr!35972 _keys!1208) from!1455) lt!517043)) (select (arr!35972 _keys!1208) from!1455)) lt!517047)))

(declare-fun lt!517053 () Unit!37808)

(declare-fun addThenRemoveForNewKeyIsSame!182 (ListLongMap!16505 (_ BitVec 64) V!43713) Unit!37808)

(assert (=> b!1153709 (= lt!517053 (addThenRemoveForNewKeyIsSame!182 lt!517047 (select (arr!35972 _keys!1208) from!1455) lt!517043))))

(declare-fun lt!517041 () V!43713)

(declare-datatypes ((ValueCell!13760 0))(
  ( (ValueCellFull!13760 (v!17162 V!43713)) (EmptyCell!13760) )
))
(declare-datatypes ((array!74644 0))(
  ( (array!74645 (arr!35973 (Array (_ BitVec 32) ValueCell!13760)) (size!36511 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74644)

(declare-fun get!18332 (ValueCell!13760 V!43713) V!43713)

(assert (=> b!1153709 (= lt!517043 (get!18332 (select (arr!35973 _values!996) from!1455) lt!517041))))

(declare-fun lt!517044 () Unit!37808)

(declare-fun e!656147 () Unit!37808)

(assert (=> b!1153709 (= lt!517044 e!656147)))

(declare-fun c!114518 () Bool)

(declare-fun contains!6721 (ListLongMap!16505 (_ BitVec 64)) Bool)

(assert (=> b!1153709 (= c!114518 (contains!6721 lt!517047 k0!934))))

(declare-fun zeroValue!944 () V!43713)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43713)

(declare-fun getCurrentListMapNoExtraKeys!4750 (array!74642 array!74644 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 32) Int) ListLongMap!16505)

(assert (=> b!1153709 (= lt!517047 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153710 () Bool)

(declare-fun res!766811 () Bool)

(assert (=> b!1153710 (=> (not res!766811) (not e!656149))))

(assert (=> b!1153710 (= res!766811 (= (select (arr!35972 _keys!1208) i!673) k0!934))))

(declare-fun b!1153711 () Bool)

(declare-fun call!54433 () Bool)

(assert (=> b!1153711 call!54433))

(declare-fun lt!517039 () Unit!37808)

(declare-fun call!54427 () Unit!37808)

(assert (=> b!1153711 (= lt!517039 call!54427)))

(assert (=> b!1153711 (= e!656151 lt!517039)))

(declare-fun b!1153712 () Bool)

(declare-fun res!766817 () Bool)

(assert (=> b!1153712 (=> (not res!766817) (not e!656149))))

(assert (=> b!1153712 (= res!766817 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25264))))

(declare-fun b!1153713 () Bool)

(declare-fun res!766810 () Bool)

(assert (=> b!1153713 (=> (not res!766810) (not e!656149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153713 (= res!766810 (validKeyInArray!0 k0!934))))

(declare-fun lt!517046 () array!74644)

(declare-fun bm!54426 () Bool)

(assert (=> bm!54426 (= call!54434 (getCurrentListMapNoExtraKeys!4750 lt!517050 lt!517046 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!766806 () Bool)

(assert (=> start!98798 (=> (not res!766806) (not e!656149))))

(assert (=> start!98798 (= res!766806 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36510 _keys!1208))))))

(assert (=> start!98798 e!656149))

(declare-fun tp_is_empty!28939 () Bool)

(assert (=> start!98798 tp_is_empty!28939))

(declare-fun array_inv!27640 (array!74642) Bool)

(assert (=> start!98798 (array_inv!27640 _keys!1208)))

(assert (=> start!98798 true))

(assert (=> start!98798 tp!85938))

(declare-fun e!656145 () Bool)

(declare-fun array_inv!27641 (array!74644) Bool)

(assert (=> start!98798 (and (array_inv!27641 _values!996) e!656145)))

(declare-fun bm!54425 () Bool)

(declare-fun call!54429 () Unit!37808)

(assert (=> bm!54425 (= call!54427 call!54429)))

(declare-fun b!1153714 () Bool)

(declare-fun lt!517052 () Unit!37808)

(assert (=> b!1153714 (= e!656141 lt!517052)))

(assert (=> b!1153714 (= lt!517052 call!54427)))

(assert (=> b!1153714 call!54433))

(declare-fun b!1153715 () Bool)

(declare-fun res!766812 () Bool)

(assert (=> b!1153715 (=> (not res!766812) (not e!656149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153715 (= res!766812 (validMask!0 mask!1564))))

(declare-fun b!1153716 () Bool)

(declare-fun e!656142 () Bool)

(assert (=> b!1153716 (= e!656150 (not e!656142))))

(declare-fun res!766809 () Bool)

(assert (=> b!1153716 (=> res!766809 e!656142)))

(assert (=> b!1153716 (= res!766809 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153716 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517057 () Unit!37808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74642 (_ BitVec 64) (_ BitVec 32)) Unit!37808)

(assert (=> b!1153716 (= lt!517057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153717 () Bool)

(declare-fun res!766805 () Bool)

(assert (=> b!1153717 (=> (not res!766805) (not e!656149))))

(assert (=> b!1153717 (= res!766805 (and (= (size!36511 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36510 _keys!1208) (size!36511 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153718 () Bool)

(declare-fun e!656143 () Bool)

(assert (=> b!1153718 (= e!656143 e!656144)))

(declare-fun res!766814 () Bool)

(assert (=> b!1153718 (=> res!766814 e!656144)))

(assert (=> b!1153718 (= res!766814 (not (= (select (arr!35972 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1153718 e!656137))

(declare-fun c!114516 () Bool)

(assert (=> b!1153718 (= c!114516 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517058 () Unit!37808)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!601 (array!74642 array!74644 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37808)

(assert (=> b!1153718 (= lt!517058 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153719 () Bool)

(assert (=> b!1153719 (= e!656146 (= lt!517038 (getCurrentListMapNoExtraKeys!4750 lt!517050 lt!517046 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153720 () Bool)

(declare-fun e!656136 () Bool)

(assert (=> b!1153720 (= e!656136 tp_is_empty!28939)))

(declare-fun bm!54427 () Bool)

(assert (=> bm!54427 (= call!54430 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45233 () Bool)

(declare-fun mapRes!45233 () Bool)

(declare-fun tp!85937 () Bool)

(declare-fun e!656139 () Bool)

(assert (=> mapNonEmpty!45233 (= mapRes!45233 (and tp!85937 e!656139))))

(declare-fun mapRest!45233 () (Array (_ BitVec 32) ValueCell!13760))

(declare-fun mapKey!45233 () (_ BitVec 32))

(declare-fun mapValue!45233 () ValueCell!13760)

(assert (=> mapNonEmpty!45233 (= (arr!35973 _values!996) (store mapRest!45233 mapKey!45233 mapValue!45233))))

(declare-fun b!1153721 () Bool)

(declare-fun Unit!37811 () Unit!37808)

(assert (=> b!1153721 (= e!656147 Unit!37811)))

(declare-fun b!1153722 () Bool)

(assert (=> b!1153722 (= e!656139 tp_is_empty!28939)))

(declare-fun b!1153723 () Bool)

(assert (=> b!1153723 (= e!656135 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54428 () Bool)

(declare-fun lt!517045 () ListLongMap!16505)

(declare-fun c!114514 () Bool)

(declare-fun addStillContains!891 (ListLongMap!16505 (_ BitVec 64) V!43713 (_ BitVec 64)) Unit!37808)

(assert (=> bm!54428 (= call!54429 (addStillContains!891 (ite c!114514 lt!517045 lt!517047) (ite c!114514 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114515 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114514 minValue!944 (ite c!114515 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1153724 () Bool)

(assert (=> b!1153724 (= e!656142 e!656143)))

(declare-fun res!766815 () Bool)

(assert (=> b!1153724 (=> res!766815 e!656143)))

(assert (=> b!1153724 (= res!766815 (not (= from!1455 i!673)))))

(declare-fun lt!517051 () ListLongMap!16505)

(assert (=> b!1153724 (= lt!517051 (getCurrentListMapNoExtraKeys!4750 lt!517050 lt!517046 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153724 (= lt!517046 (array!74645 (store (arr!35973 _values!996) i!673 (ValueCellFull!13760 lt!517041)) (size!36511 _values!996)))))

(declare-fun dynLambda!2710 (Int (_ BitVec 64)) V!43713)

(assert (=> b!1153724 (= lt!517041 (dynLambda!2710 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153724 (= lt!517048 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153725 () Bool)

(declare-fun res!766803 () Bool)

(assert (=> b!1153725 (=> (not res!766803) (not e!656149))))

(assert (=> b!1153725 (= res!766803 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36510 _keys!1208))))))

(declare-fun b!1153726 () Bool)

(assert (=> b!1153726 (= e!656137 (= call!54434 call!54430))))

(declare-fun b!1153727 () Bool)

(declare-fun Unit!37812 () Unit!37808)

(assert (=> b!1153727 (= e!656147 Unit!37812)))

(assert (=> b!1153727 (= lt!517054 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153727 (= c!114514 (and (not lt!517054) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517059 () Unit!37808)

(assert (=> b!1153727 (= lt!517059 e!656138)))

(declare-fun lt!517056 () Unit!37808)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!477 (array!74642 array!74644 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 64) (_ BitVec 32) Int) Unit!37808)

(assert (=> b!1153727 (= lt!517056 (lemmaListMapContainsThenArrayContainsFrom!477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114513 () Bool)

(assert (=> b!1153727 (= c!114513 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766816 () Bool)

(assert (=> b!1153727 (= res!766816 e!656135)))

(declare-fun e!656148 () Bool)

(assert (=> b!1153727 (=> (not res!766816) (not e!656148))))

(assert (=> b!1153727 e!656148))

(declare-fun lt!517055 () Unit!37808)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74642 (_ BitVec 32) (_ BitVec 32)) Unit!37808)

(assert (=> b!1153727 (= lt!517055 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153727 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25264)))

(declare-fun lt!517040 () Unit!37808)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74642 (_ BitVec 64) (_ BitVec 32) List!25267) Unit!37808)

(assert (=> b!1153727 (= lt!517040 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25264))))

(assert (=> b!1153727 false))

(declare-fun bm!54429 () Bool)

(assert (=> bm!54429 (= call!54431 (+!3680 lt!517047 (ite (or c!114514 c!114515) (tuple2!18537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!45233 () Bool)

(assert (=> mapIsEmpty!45233 mapRes!45233))

(declare-fun b!1153728 () Bool)

(assert (=> b!1153728 (= e!656148 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!54432 () Bool)

(declare-fun bm!54430 () Bool)

(assert (=> bm!54430 (= call!54432 (contains!6721 (ite c!114514 lt!517045 call!54428) k0!934))))

(declare-fun bm!54431 () Bool)

(assert (=> bm!54431 (= call!54433 call!54432)))

(declare-fun b!1153729 () Bool)

(assert (=> b!1153729 (= e!656145 (and e!656136 mapRes!45233))))

(declare-fun condMapEmpty!45233 () Bool)

(declare-fun mapDefault!45233 () ValueCell!13760)

(assert (=> b!1153729 (= condMapEmpty!45233 (= (arr!35973 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13760)) mapDefault!45233)))))

(declare-fun b!1153730 () Bool)

(assert (=> b!1153730 (contains!6721 (+!3680 lt!517045 (tuple2!18537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517042 () Unit!37808)

(assert (=> b!1153730 (= lt!517042 call!54429)))

(assert (=> b!1153730 call!54432))

(assert (=> b!1153730 (= lt!517045 call!54431)))

(declare-fun lt!517049 () Unit!37808)

(assert (=> b!1153730 (= lt!517049 (addStillContains!891 lt!517047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1153730 (= e!656138 lt!517042)))

(declare-fun b!1153731 () Bool)

(assert (=> b!1153731 (= e!656141 e!656151)))

(declare-fun c!114517 () Bool)

(assert (=> b!1153731 (= c!114517 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517054))))

(assert (= (and start!98798 res!766806) b!1153715))

(assert (= (and b!1153715 res!766812) b!1153717))

(assert (= (and b!1153717 res!766805) b!1153703))

(assert (= (and b!1153703 res!766813) b!1153712))

(assert (= (and b!1153712 res!766817) b!1153725))

(assert (= (and b!1153725 res!766803) b!1153713))

(assert (= (and b!1153713 res!766810) b!1153710))

(assert (= (and b!1153710 res!766811) b!1153702))

(assert (= (and b!1153702 res!766804) b!1153707))

(assert (= (and b!1153707 res!766807) b!1153716))

(assert (= (and b!1153716 (not res!766809)) b!1153724))

(assert (= (and b!1153724 (not res!766815)) b!1153718))

(assert (= (and b!1153718 c!114516) b!1153706))

(assert (= (and b!1153718 (not c!114516)) b!1153726))

(assert (= (or b!1153706 b!1153726) bm!54426))

(assert (= (or b!1153706 b!1153726) bm!54427))

(assert (= (and b!1153718 (not res!766814)) b!1153709))

(assert (= (and b!1153709 c!114518) b!1153727))

(assert (= (and b!1153709 (not c!114518)) b!1153721))

(assert (= (and b!1153727 c!114514) b!1153730))

(assert (= (and b!1153727 (not c!114514)) b!1153708))

(assert (= (and b!1153708 c!114515) b!1153714))

(assert (= (and b!1153708 (not c!114515)) b!1153731))

(assert (= (and b!1153731 c!114517) b!1153711))

(assert (= (and b!1153731 (not c!114517)) b!1153705))

(assert (= (or b!1153714 b!1153711) bm!54425))

(assert (= (or b!1153714 b!1153711) bm!54424))

(assert (= (or b!1153714 b!1153711) bm!54431))

(assert (= (or b!1153730 bm!54431) bm!54430))

(assert (= (or b!1153730 bm!54425) bm!54428))

(assert (= (or b!1153730 bm!54424) bm!54429))

(assert (= (and b!1153727 c!114513) b!1153723))

(assert (= (and b!1153727 (not c!114513)) b!1153704))

(assert (= (and b!1153727 res!766816) b!1153728))

(assert (= (and b!1153709 res!766808) b!1153719))

(assert (= (and b!1153729 condMapEmpty!45233) mapIsEmpty!45233))

(assert (= (and b!1153729 (not condMapEmpty!45233)) mapNonEmpty!45233))

(get-info :version)

(assert (= (and mapNonEmpty!45233 ((_ is ValueCellFull!13760) mapValue!45233)) b!1153722))

(assert (= (and b!1153729 ((_ is ValueCellFull!13760) mapDefault!45233)) b!1153720))

(assert (= start!98798 b!1153729))

(declare-fun b_lambda!19497 () Bool)

(assert (=> (not b_lambda!19497) (not b!1153724)))

(declare-fun t!36657 () Bool)

(declare-fun tb!9213 () Bool)

(assert (=> (and start!98798 (= defaultEntry!1004 defaultEntry!1004) t!36657) tb!9213))

(declare-fun result!18999 () Bool)

(assert (=> tb!9213 (= result!18999 tp_is_empty!28939)))

(assert (=> b!1153724 t!36657))

(declare-fun b_and!39647 () Bool)

(assert (= b_and!39645 (and (=> t!36657 result!18999) b_and!39647)))

(declare-fun m!1063027 () Bool)

(assert (=> bm!54429 m!1063027))

(declare-fun m!1063029 () Bool)

(assert (=> b!1153727 m!1063029))

(declare-fun m!1063031 () Bool)

(assert (=> b!1153727 m!1063031))

(declare-fun m!1063033 () Bool)

(assert (=> b!1153727 m!1063033))

(declare-fun m!1063035 () Bool)

(assert (=> b!1153727 m!1063035))

(declare-fun m!1063037 () Bool)

(assert (=> b!1153706 m!1063037))

(declare-fun m!1063039 () Bool)

(assert (=> b!1153730 m!1063039))

(assert (=> b!1153730 m!1063039))

(declare-fun m!1063041 () Bool)

(assert (=> b!1153730 m!1063041))

(declare-fun m!1063043 () Bool)

(assert (=> b!1153730 m!1063043))

(declare-fun m!1063045 () Bool)

(assert (=> b!1153702 m!1063045))

(declare-fun m!1063047 () Bool)

(assert (=> b!1153702 m!1063047))

(declare-fun m!1063049 () Bool)

(assert (=> b!1153728 m!1063049))

(declare-fun m!1063051 () Bool)

(assert (=> bm!54427 m!1063051))

(declare-fun m!1063053 () Bool)

(assert (=> bm!54426 m!1063053))

(declare-fun m!1063055 () Bool)

(assert (=> b!1153712 m!1063055))

(declare-fun m!1063057 () Bool)

(assert (=> mapNonEmpty!45233 m!1063057))

(assert (=> b!1153723 m!1063049))

(assert (=> b!1153719 m!1063053))

(declare-fun m!1063059 () Bool)

(assert (=> b!1153715 m!1063059))

(declare-fun m!1063061 () Bool)

(assert (=> bm!54428 m!1063061))

(declare-fun m!1063063 () Bool)

(assert (=> bm!54430 m!1063063))

(assert (=> b!1153709 m!1063051))

(declare-fun m!1063065 () Bool)

(assert (=> b!1153709 m!1063065))

(declare-fun m!1063067 () Bool)

(assert (=> b!1153709 m!1063067))

(declare-fun m!1063069 () Bool)

(assert (=> b!1153709 m!1063069))

(declare-fun m!1063071 () Bool)

(assert (=> b!1153709 m!1063071))

(assert (=> b!1153709 m!1063067))

(declare-fun m!1063073 () Bool)

(assert (=> b!1153709 m!1063073))

(assert (=> b!1153709 m!1063065))

(declare-fun m!1063075 () Bool)

(assert (=> b!1153709 m!1063075))

(assert (=> b!1153709 m!1063069))

(declare-fun m!1063077 () Bool)

(assert (=> b!1153709 m!1063077))

(assert (=> b!1153709 m!1063069))

(declare-fun m!1063079 () Bool)

(assert (=> b!1153709 m!1063079))

(declare-fun m!1063081 () Bool)

(assert (=> b!1153713 m!1063081))

(declare-fun m!1063083 () Bool)

(assert (=> b!1153716 m!1063083))

(declare-fun m!1063085 () Bool)

(assert (=> b!1153716 m!1063085))

(declare-fun m!1063087 () Bool)

(assert (=> start!98798 m!1063087))

(declare-fun m!1063089 () Bool)

(assert (=> start!98798 m!1063089))

(declare-fun m!1063091 () Bool)

(assert (=> b!1153707 m!1063091))

(declare-fun m!1063093 () Bool)

(assert (=> b!1153710 m!1063093))

(declare-fun m!1063095 () Bool)

(assert (=> b!1153724 m!1063095))

(declare-fun m!1063097 () Bool)

(assert (=> b!1153724 m!1063097))

(declare-fun m!1063099 () Bool)

(assert (=> b!1153724 m!1063099))

(declare-fun m!1063101 () Bool)

(assert (=> b!1153724 m!1063101))

(declare-fun m!1063103 () Bool)

(assert (=> b!1153703 m!1063103))

(assert (=> b!1153718 m!1063069))

(declare-fun m!1063105 () Bool)

(assert (=> b!1153718 m!1063105))

(check-sat (not b!1153713) (not b!1153724) (not b!1153709) b_and!39647 (not bm!54428) (not b!1153707) (not b!1153730) (not b!1153719) (not mapNonEmpty!45233) (not bm!54426) (not b!1153728) tp_is_empty!28939 (not b!1153718) (not b_next!24409) (not b!1153702) (not b!1153727) (not b!1153716) (not b!1153706) (not b!1153703) (not b!1153715) (not b_lambda!19497) (not bm!54430) (not bm!54429) (not b!1153723) (not b!1153712) (not bm!54427) (not start!98798))
(check-sat b_and!39647 (not b_next!24409))
