; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98680 () Bool)

(assert start!98680)

(declare-fun b_free!24049 () Bool)

(declare-fun b_next!24049 () Bool)

(assert (=> start!98680 (= b_free!24049 (not b_next!24049))))

(declare-fun tp!84857 () Bool)

(declare-fun b_and!38949 () Bool)

(assert (=> start!98680 (= tp!84857 b_and!38949)))

(declare-fun b!1138778 () Bool)

(declare-fun e!648101 () Bool)

(declare-fun e!648089 () Bool)

(declare-fun mapRes!44693 () Bool)

(assert (=> b!1138778 (= e!648101 (and e!648089 mapRes!44693))))

(declare-fun condMapEmpty!44693 () Bool)

(declare-datatypes ((V!43233 0))(
  ( (V!43234 (val!14346 Int)) )
))
(declare-datatypes ((ValueCell!13580 0))(
  ( (ValueCellFull!13580 (v!16979 V!43233)) (EmptyCell!13580) )
))
(declare-datatypes ((array!74059 0))(
  ( (array!74060 (arr!35674 (Array (_ BitVec 32) ValueCell!13580)) (size!36211 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74059)

(declare-fun mapDefault!44693 () ValueCell!13580)

(assert (=> b!1138778 (= condMapEmpty!44693 (= (arr!35674 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13580)) mapDefault!44693)))))

(declare-fun b!1138779 () Bool)

(declare-datatypes ((Unit!37235 0))(
  ( (Unit!37236) )
))
(declare-fun e!648092 () Unit!37235)

(declare-fun Unit!37237 () Unit!37235)

(assert (=> b!1138779 (= e!648092 Unit!37237)))

(declare-fun lt!506410 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1138779 (= lt!506410 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111700 () Bool)

(assert (=> b!1138779 (= c!111700 (and (not lt!506410) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506408 () Unit!37235)

(declare-fun e!648102 () Unit!37235)

(assert (=> b!1138779 (= lt!506408 e!648102)))

(declare-fun zeroValue!944 () V!43233)

(declare-datatypes ((array!74061 0))(
  ( (array!74062 (arr!35675 (Array (_ BitVec 32) (_ BitVec 64))) (size!36212 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74061)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!506402 () Unit!37235)

(declare-fun minValue!944 () V!43233)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!357 (array!74061 array!74059 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 64) (_ BitVec 32) Int) Unit!37235)

(assert (=> b!1138779 (= lt!506402 (lemmaListMapContainsThenArrayContainsFrom!357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111701 () Bool)

(assert (=> b!1138779 (= c!111701 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759506 () Bool)

(declare-fun e!648094 () Bool)

(assert (=> b!1138779 (= res!759506 e!648094)))

(declare-fun e!648100 () Bool)

(assert (=> b!1138779 (=> (not res!759506) (not e!648100))))

(assert (=> b!1138779 e!648100))

(declare-fun lt!506396 () Unit!37235)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74061 (_ BitVec 32) (_ BitVec 32)) Unit!37235)

(assert (=> b!1138779 (= lt!506396 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24895 0))(
  ( (Nil!24892) (Cons!24891 (h!26109 (_ BitVec 64)) (t!35928 List!24895)) )
))
(declare-fun arrayNoDuplicates!0 (array!74061 (_ BitVec 32) List!24895) Bool)

(assert (=> b!1138779 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24892)))

(declare-fun lt!506393 () Unit!37235)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74061 (_ BitVec 64) (_ BitVec 32) List!24895) Unit!37235)

(assert (=> b!1138779 (= lt!506393 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24892))))

(assert (=> b!1138779 false))

(declare-fun b!1138780 () Bool)

(declare-fun e!648093 () Unit!37235)

(declare-fun Unit!37238 () Unit!37235)

(assert (=> b!1138780 (= e!648093 Unit!37238)))

(declare-fun b!1138781 () Bool)

(declare-datatypes ((tuple2!18130 0))(
  ( (tuple2!18131 (_1!9076 (_ BitVec 64)) (_2!9076 V!43233)) )
))
(declare-datatypes ((List!24896 0))(
  ( (Nil!24893) (Cons!24892 (h!26110 tuple2!18130) (t!35929 List!24896)) )
))
(declare-datatypes ((ListLongMap!16107 0))(
  ( (ListLongMap!16108 (toList!8069 List!24896)) )
))
(declare-fun call!50202 () ListLongMap!16107)

(declare-fun contains!6620 (ListLongMap!16107 (_ BitVec 64)) Bool)

(assert (=> b!1138781 (contains!6620 call!50202 k0!934)))

(declare-fun lt!506395 () Unit!37235)

(declare-fun call!50198 () Unit!37235)

(assert (=> b!1138781 (= lt!506395 call!50198)))

(declare-fun call!50196 () Bool)

(assert (=> b!1138781 call!50196))

(declare-fun lt!506404 () ListLongMap!16107)

(declare-fun lt!506401 () ListLongMap!16107)

(declare-fun +!3522 (ListLongMap!16107 tuple2!18130) ListLongMap!16107)

(assert (=> b!1138781 (= lt!506404 (+!3522 lt!506401 (tuple2!18131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506398 () Unit!37235)

(declare-fun addStillContains!749 (ListLongMap!16107 (_ BitVec 64) V!43233 (_ BitVec 64)) Unit!37235)

(assert (=> b!1138781 (= lt!506398 (addStillContains!749 lt!506401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1138781 (= e!648102 lt!506395)))

(declare-fun b!1138782 () Bool)

(declare-fun call!50200 () Bool)

(assert (=> b!1138782 call!50200))

(declare-fun lt!506397 () Unit!37235)

(declare-fun call!50197 () Unit!37235)

(assert (=> b!1138782 (= lt!506397 call!50197)))

(assert (=> b!1138782 (= e!648093 lt!506397)))

(declare-fun b!1138783 () Bool)

(declare-fun res!759511 () Bool)

(declare-fun e!648103 () Bool)

(assert (=> b!1138783 (=> (not res!759511) (not e!648103))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138783 (= res!759511 (= (select (arr!35675 _keys!1208) i!673) k0!934))))

(declare-fun b!1138784 () Bool)

(assert (=> b!1138784 (= e!648094 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506410) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138785 () Bool)

(declare-fun e!648099 () Unit!37235)

(assert (=> b!1138785 (= e!648099 e!648093)))

(declare-fun c!111698 () Bool)

(assert (=> b!1138785 (= c!111698 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506410))))

(declare-fun bm!50192 () Bool)

(declare-fun c!111697 () Bool)

(assert (=> bm!50192 (= call!50198 (addStillContains!749 (ite c!111700 lt!506404 lt!506401) (ite c!111700 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111700 minValue!944 (ite c!111697 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1138786 () Bool)

(declare-fun res!759512 () Bool)

(assert (=> b!1138786 (=> (not res!759512) (not e!648103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74061 (_ BitVec 32)) Bool)

(assert (=> b!1138786 (= res!759512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138788 () Bool)

(declare-fun e!648090 () Bool)

(assert (=> b!1138788 (= e!648090 true)))

(declare-fun lt!506405 () Unit!37235)

(assert (=> b!1138788 (= lt!506405 e!648092)))

(declare-fun c!111699 () Bool)

(assert (=> b!1138788 (= c!111699 (contains!6620 lt!506401 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4579 (array!74061 array!74059 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 32) Int) ListLongMap!16107)

(assert (=> b!1138788 (= lt!506401 (getCurrentListMapNoExtraKeys!4579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50193 () Bool)

(declare-fun call!50195 () ListLongMap!16107)

(declare-fun lt!506409 () array!74061)

(declare-fun lt!506406 () array!74059)

(assert (=> bm!50193 (= call!50195 (getCurrentListMapNoExtraKeys!4579 lt!506409 lt!506406 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138789 () Bool)

(declare-fun e!648098 () Bool)

(assert (=> b!1138789 (= e!648103 e!648098)))

(declare-fun res!759507 () Bool)

(assert (=> b!1138789 (=> (not res!759507) (not e!648098))))

(assert (=> b!1138789 (= res!759507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506409 mask!1564))))

(assert (=> b!1138789 (= lt!506409 (array!74062 (store (arr!35675 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36212 _keys!1208)))))

(declare-fun b!1138790 () Bool)

(declare-fun res!759502 () Bool)

(assert (=> b!1138790 (=> (not res!759502) (not e!648098))))

(assert (=> b!1138790 (= res!759502 (arrayNoDuplicates!0 lt!506409 #b00000000000000000000000000000000 Nil!24892))))

(declare-fun b!1138791 () Bool)

(declare-fun e!648091 () Bool)

(assert (=> b!1138791 (= e!648091 e!648090)))

(declare-fun res!759501 () Bool)

(assert (=> b!1138791 (=> res!759501 e!648090)))

(assert (=> b!1138791 (= res!759501 (not (= (select (arr!35675 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648096 () Bool)

(assert (=> b!1138791 e!648096))

(declare-fun c!111702 () Bool)

(assert (=> b!1138791 (= c!111702 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506403 () Unit!37235)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!468 (array!74061 array!74059 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37235)

(assert (=> b!1138791 (= lt!506403 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44693 () Bool)

(assert (=> mapIsEmpty!44693 mapRes!44693))

(declare-fun bm!50194 () Bool)

(declare-fun call!50201 () ListLongMap!16107)

(assert (=> bm!50194 (= call!50201 (getCurrentListMapNoExtraKeys!4579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50195 () Bool)

(assert (=> bm!50195 (= call!50202 (+!3522 (ite c!111700 lt!506404 lt!506401) (ite c!111700 (tuple2!18131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111697 (tuple2!18131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1138792 () Bool)

(declare-fun res!759510 () Bool)

(assert (=> b!1138792 (=> (not res!759510) (not e!648103))))

(assert (=> b!1138792 (= res!759510 (and (= (size!36211 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36212 _keys!1208) (size!36211 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138793 () Bool)

(assert (=> b!1138793 (= c!111697 (and (not lt!506410) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138793 (= e!648102 e!648099)))

(declare-fun b!1138794 () Bool)

(declare-fun tp_is_empty!28579 () Bool)

(assert (=> b!1138794 (= e!648089 tp_is_empty!28579)))

(declare-fun b!1138795 () Bool)

(declare-fun res!759504 () Bool)

(assert (=> b!1138795 (=> (not res!759504) (not e!648103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138795 (= res!759504 (validMask!0 mask!1564))))

(declare-fun b!1138796 () Bool)

(assert (=> b!1138796 (= e!648096 (= call!50195 call!50201))))

(declare-fun b!1138797 () Bool)

(declare-fun -!1210 (ListLongMap!16107 (_ BitVec 64)) ListLongMap!16107)

(assert (=> b!1138797 (= e!648096 (= call!50195 (-!1210 call!50201 k0!934)))))

(declare-fun b!1138798 () Bool)

(declare-fun e!648088 () Bool)

(assert (=> b!1138798 (= e!648098 (not e!648088))))

(declare-fun res!759509 () Bool)

(assert (=> b!1138798 (=> res!759509 e!648088)))

(assert (=> b!1138798 (= res!759509 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138798 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506394 () Unit!37235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74061 (_ BitVec 64) (_ BitVec 32)) Unit!37235)

(assert (=> b!1138798 (= lt!506394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138799 () Bool)

(declare-fun res!759508 () Bool)

(assert (=> b!1138799 (=> (not res!759508) (not e!648103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138799 (= res!759508 (validKeyInArray!0 k0!934))))

(declare-fun call!50199 () ListLongMap!16107)

(declare-fun bm!50196 () Bool)

(assert (=> bm!50196 (= call!50196 (contains!6620 (ite c!111700 lt!506404 call!50199) k0!934))))

(declare-fun mapNonEmpty!44693 () Bool)

(declare-fun tp!84858 () Bool)

(declare-fun e!648095 () Bool)

(assert (=> mapNonEmpty!44693 (= mapRes!44693 (and tp!84858 e!648095))))

(declare-fun mapRest!44693 () (Array (_ BitVec 32) ValueCell!13580))

(declare-fun mapValue!44693 () ValueCell!13580)

(declare-fun mapKey!44693 () (_ BitVec 32))

(assert (=> mapNonEmpty!44693 (= (arr!35674 _values!996) (store mapRest!44693 mapKey!44693 mapValue!44693))))

(declare-fun bm!50197 () Bool)

(assert (=> bm!50197 (= call!50197 call!50198)))

(declare-fun b!1138800 () Bool)

(declare-fun Unit!37239 () Unit!37235)

(assert (=> b!1138800 (= e!648092 Unit!37239)))

(declare-fun b!1138801 () Bool)

(assert (=> b!1138801 (= e!648088 e!648091)))

(declare-fun res!759513 () Bool)

(assert (=> b!1138801 (=> res!759513 e!648091)))

(assert (=> b!1138801 (= res!759513 (not (= from!1455 i!673)))))

(declare-fun lt!506400 () ListLongMap!16107)

(assert (=> b!1138801 (= lt!506400 (getCurrentListMapNoExtraKeys!4579 lt!506409 lt!506406 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2627 (Int (_ BitVec 64)) V!43233)

(assert (=> b!1138801 (= lt!506406 (array!74060 (store (arr!35674 _values!996) i!673 (ValueCellFull!13580 (dynLambda!2627 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36211 _values!996)))))

(declare-fun lt!506407 () ListLongMap!16107)

(assert (=> b!1138801 (= lt!506407 (getCurrentListMapNoExtraKeys!4579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!759503 () Bool)

(assert (=> start!98680 (=> (not res!759503) (not e!648103))))

(assert (=> start!98680 (= res!759503 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36212 _keys!1208))))))

(assert (=> start!98680 e!648103))

(assert (=> start!98680 tp_is_empty!28579))

(declare-fun array_inv!27398 (array!74061) Bool)

(assert (=> start!98680 (array_inv!27398 _keys!1208)))

(assert (=> start!98680 true))

(assert (=> start!98680 tp!84857))

(declare-fun array_inv!27399 (array!74059) Bool)

(assert (=> start!98680 (and (array_inv!27399 _values!996) e!648101)))

(declare-fun b!1138787 () Bool)

(assert (=> b!1138787 (= e!648094 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50198 () Bool)

(assert (=> bm!50198 (= call!50200 call!50196)))

(declare-fun b!1138802 () Bool)

(declare-fun res!759505 () Bool)

(assert (=> b!1138802 (=> (not res!759505) (not e!648103))))

(assert (=> b!1138802 (= res!759505 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24892))))

(declare-fun b!1138803 () Bool)

(assert (=> b!1138803 (= e!648095 tp_is_empty!28579)))

(declare-fun b!1138804 () Bool)

(declare-fun lt!506399 () Unit!37235)

(assert (=> b!1138804 (= e!648099 lt!506399)))

(assert (=> b!1138804 (= lt!506399 call!50197)))

(assert (=> b!1138804 call!50200))

(declare-fun b!1138805 () Bool)

(assert (=> b!1138805 (= e!648100 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50199 () Bool)

(assert (=> bm!50199 (= call!50199 call!50202)))

(declare-fun b!1138806 () Bool)

(declare-fun res!759500 () Bool)

(assert (=> b!1138806 (=> (not res!759500) (not e!648103))))

(assert (=> b!1138806 (= res!759500 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36212 _keys!1208))))))

(assert (= (and start!98680 res!759503) b!1138795))

(assert (= (and b!1138795 res!759504) b!1138792))

(assert (= (and b!1138792 res!759510) b!1138786))

(assert (= (and b!1138786 res!759512) b!1138802))

(assert (= (and b!1138802 res!759505) b!1138806))

(assert (= (and b!1138806 res!759500) b!1138799))

(assert (= (and b!1138799 res!759508) b!1138783))

(assert (= (and b!1138783 res!759511) b!1138789))

(assert (= (and b!1138789 res!759507) b!1138790))

(assert (= (and b!1138790 res!759502) b!1138798))

(assert (= (and b!1138798 (not res!759509)) b!1138801))

(assert (= (and b!1138801 (not res!759513)) b!1138791))

(assert (= (and b!1138791 c!111702) b!1138797))

(assert (= (and b!1138791 (not c!111702)) b!1138796))

(assert (= (or b!1138797 b!1138796) bm!50193))

(assert (= (or b!1138797 b!1138796) bm!50194))

(assert (= (and b!1138791 (not res!759501)) b!1138788))

(assert (= (and b!1138788 c!111699) b!1138779))

(assert (= (and b!1138788 (not c!111699)) b!1138800))

(assert (= (and b!1138779 c!111700) b!1138781))

(assert (= (and b!1138779 (not c!111700)) b!1138793))

(assert (= (and b!1138793 c!111697) b!1138804))

(assert (= (and b!1138793 (not c!111697)) b!1138785))

(assert (= (and b!1138785 c!111698) b!1138782))

(assert (= (and b!1138785 (not c!111698)) b!1138780))

(assert (= (or b!1138804 b!1138782) bm!50197))

(assert (= (or b!1138804 b!1138782) bm!50199))

(assert (= (or b!1138804 b!1138782) bm!50198))

(assert (= (or b!1138781 bm!50198) bm!50196))

(assert (= (or b!1138781 bm!50197) bm!50192))

(assert (= (or b!1138781 bm!50199) bm!50195))

(assert (= (and b!1138779 c!111701) b!1138787))

(assert (= (and b!1138779 (not c!111701)) b!1138784))

(assert (= (and b!1138779 res!759506) b!1138805))

(assert (= (and b!1138778 condMapEmpty!44693) mapIsEmpty!44693))

(assert (= (and b!1138778 (not condMapEmpty!44693)) mapNonEmpty!44693))

(get-info :version)

(assert (= (and mapNonEmpty!44693 ((_ is ValueCellFull!13580) mapValue!44693)) b!1138803))

(assert (= (and b!1138778 ((_ is ValueCellFull!13580) mapDefault!44693)) b!1138794))

(assert (= start!98680 b!1138778))

(declare-fun b_lambda!19149 () Bool)

(assert (=> (not b_lambda!19149) (not b!1138801)))

(declare-fun t!35927 () Bool)

(declare-fun tb!8853 () Bool)

(assert (=> (and start!98680 (= defaultEntry!1004 defaultEntry!1004) t!35927) tb!8853))

(declare-fun result!18279 () Bool)

(assert (=> tb!8853 (= result!18279 tp_is_empty!28579)))

(assert (=> b!1138801 t!35927))

(declare-fun b_and!38951 () Bool)

(assert (= b_and!38949 (and (=> t!35927 result!18279) b_and!38951)))

(declare-fun m!1051143 () Bool)

(assert (=> b!1138788 m!1051143))

(declare-fun m!1051145 () Bool)

(assert (=> b!1138788 m!1051145))

(declare-fun m!1051147 () Bool)

(assert (=> b!1138781 m!1051147))

(declare-fun m!1051149 () Bool)

(assert (=> b!1138781 m!1051149))

(declare-fun m!1051151 () Bool)

(assert (=> b!1138781 m!1051151))

(declare-fun m!1051153 () Bool)

(assert (=> b!1138797 m!1051153))

(declare-fun m!1051155 () Bool)

(assert (=> bm!50193 m!1051155))

(declare-fun m!1051157 () Bool)

(assert (=> b!1138791 m!1051157))

(declare-fun m!1051159 () Bool)

(assert (=> b!1138791 m!1051159))

(declare-fun m!1051161 () Bool)

(assert (=> bm!50196 m!1051161))

(declare-fun m!1051163 () Bool)

(assert (=> b!1138786 m!1051163))

(declare-fun m!1051165 () Bool)

(assert (=> b!1138798 m!1051165))

(declare-fun m!1051167 () Bool)

(assert (=> b!1138798 m!1051167))

(declare-fun m!1051169 () Bool)

(assert (=> b!1138789 m!1051169))

(declare-fun m!1051171 () Bool)

(assert (=> b!1138789 m!1051171))

(declare-fun m!1051173 () Bool)

(assert (=> mapNonEmpty!44693 m!1051173))

(declare-fun m!1051175 () Bool)

(assert (=> b!1138799 m!1051175))

(declare-fun m!1051177 () Bool)

(assert (=> b!1138783 m!1051177))

(declare-fun m!1051179 () Bool)

(assert (=> bm!50195 m!1051179))

(declare-fun m!1051181 () Bool)

(assert (=> b!1138802 m!1051181))

(declare-fun m!1051183 () Bool)

(assert (=> bm!50192 m!1051183))

(declare-fun m!1051185 () Bool)

(assert (=> b!1138795 m!1051185))

(assert (=> bm!50194 m!1051145))

(declare-fun m!1051187 () Bool)

(assert (=> b!1138801 m!1051187))

(declare-fun m!1051189 () Bool)

(assert (=> b!1138801 m!1051189))

(declare-fun m!1051191 () Bool)

(assert (=> b!1138801 m!1051191))

(declare-fun m!1051193 () Bool)

(assert (=> b!1138801 m!1051193))

(declare-fun m!1051195 () Bool)

(assert (=> b!1138790 m!1051195))

(declare-fun m!1051197 () Bool)

(assert (=> start!98680 m!1051197))

(declare-fun m!1051199 () Bool)

(assert (=> start!98680 m!1051199))

(declare-fun m!1051201 () Bool)

(assert (=> b!1138787 m!1051201))

(declare-fun m!1051203 () Bool)

(assert (=> b!1138779 m!1051203))

(declare-fun m!1051205 () Bool)

(assert (=> b!1138779 m!1051205))

(declare-fun m!1051207 () Bool)

(assert (=> b!1138779 m!1051207))

(declare-fun m!1051209 () Bool)

(assert (=> b!1138779 m!1051209))

(assert (=> b!1138805 m!1051201))

(check-sat (not b!1138788) (not mapNonEmpty!44693) (not b!1138787) (not b!1138797) (not b!1138791) tp_is_empty!28579 (not b!1138798) (not b!1138779) (not bm!50196) (not bm!50195) b_and!38951 (not start!98680) (not b!1138801) (not b!1138789) (not bm!50192) (not b!1138790) (not b!1138799) (not b!1138802) (not bm!50193) (not b_next!24049) (not b!1138805) (not b!1138781) (not b!1138786) (not b!1138795) (not bm!50194) (not b_lambda!19149))
(check-sat b_and!38951 (not b_next!24049))
