; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98498 () Bool)

(assert start!98498)

(declare-fun b_free!24109 () Bool)

(declare-fun b_next!24109 () Bool)

(assert (=> start!98498 (= b_free!24109 (not b_next!24109))))

(declare-fun tp!85037 () Bool)

(declare-fun b_and!39045 () Bool)

(assert (=> start!98498 (= tp!85037 b_and!39045)))

(declare-fun b!1140035 () Bool)

(declare-fun e!648619 () Bool)

(declare-datatypes ((V!43313 0))(
  ( (V!43314 (val!14376 Int)) )
))
(declare-datatypes ((tuple2!18264 0))(
  ( (tuple2!18265 (_1!9143 (_ BitVec 64)) (_2!9143 V!43313)) )
))
(declare-datatypes ((List!25004 0))(
  ( (Nil!25001) (Cons!25000 (h!26209 tuple2!18264) (t!36096 List!25004)) )
))
(declare-datatypes ((ListLongMap!16233 0))(
  ( (ListLongMap!16234 (toList!8132 List!25004)) )
))
(declare-fun call!50829 () ListLongMap!16233)

(declare-fun call!50828 () ListLongMap!16233)

(assert (=> b!1140035 (= e!648619 (= call!50829 call!50828))))

(declare-fun b!1140036 () Bool)

(declare-fun call!50832 () Bool)

(assert (=> b!1140036 call!50832))

(declare-datatypes ((Unit!37231 0))(
  ( (Unit!37232) )
))
(declare-fun lt!507447 () Unit!37231)

(declare-fun call!50827 () Unit!37231)

(assert (=> b!1140036 (= lt!507447 call!50827)))

(declare-fun e!648626 () Unit!37231)

(assert (=> b!1140036 (= e!648626 lt!507447)))

(declare-fun res!760198 () Bool)

(declare-fun e!648629 () Bool)

(assert (=> start!98498 (=> (not res!760198) (not e!648629))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74060 0))(
  ( (array!74061 (arr!35681 (Array (_ BitVec 32) (_ BitVec 64))) (size!36219 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74060)

(assert (=> start!98498 (= res!760198 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36219 _keys!1208))))))

(assert (=> start!98498 e!648629))

(declare-fun tp_is_empty!28639 () Bool)

(assert (=> start!98498 tp_is_empty!28639))

(declare-fun array_inv!27420 (array!74060) Bool)

(assert (=> start!98498 (array_inv!27420 _keys!1208)))

(assert (=> start!98498 true))

(assert (=> start!98498 tp!85037))

(declare-datatypes ((ValueCell!13610 0))(
  ( (ValueCellFull!13610 (v!17012 V!43313)) (EmptyCell!13610) )
))
(declare-datatypes ((array!74062 0))(
  ( (array!74063 (arr!35682 (Array (_ BitVec 32) ValueCell!13610)) (size!36220 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74062)

(declare-fun e!648630 () Bool)

(declare-fun array_inv!27421 (array!74062) Bool)

(assert (=> start!98498 (and (array_inv!27421 _values!996) e!648630)))

(declare-fun call!50833 () Unit!37231)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43313)

(declare-fun c!111816 () Bool)

(declare-fun zeroValue!944 () V!43313)

(declare-fun bm!50824 () Bool)

(declare-fun lt!507434 () ListLongMap!16233)

(declare-fun c!111818 () Bool)

(declare-fun addStillContains!775 (ListLongMap!16233 (_ BitVec 64) V!43313 (_ BitVec 64)) Unit!37231)

(assert (=> bm!50824 (= call!50833 (addStillContains!775 lt!507434 (ite (or c!111818 c!111816) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111818 c!111816) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!50830 () ListLongMap!16233)

(declare-fun bm!50825 () Bool)

(declare-fun lt!507450 () ListLongMap!16233)

(declare-fun +!3559 (ListLongMap!16233 tuple2!18264) ListLongMap!16233)

(assert (=> bm!50825 (= call!50830 (+!3559 (ite c!111818 lt!507450 lt!507434) (ite c!111818 (tuple2!18265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111816 (tuple2!18265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!50826 () Bool)

(declare-fun call!50831 () ListLongMap!16233)

(assert (=> bm!50826 (= call!50831 call!50830)))

(declare-fun b!1140037 () Bool)

(declare-fun e!648624 () Unit!37231)

(assert (=> b!1140037 (= e!648624 e!648626)))

(declare-fun c!111814 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!507435 () Bool)

(assert (=> b!1140037 (= c!111814 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507435))))

(declare-fun b!1140038 () Bool)

(declare-fun e!648633 () Unit!37231)

(declare-fun Unit!37233 () Unit!37231)

(assert (=> b!1140038 (= e!648633 Unit!37233)))

(declare-fun b!1140039 () Bool)

(declare-fun res!760190 () Bool)

(declare-fun e!648621 () Bool)

(assert (=> b!1140039 (=> (not res!760190) (not e!648621))))

(declare-fun lt!507439 () array!74060)

(declare-datatypes ((List!25005 0))(
  ( (Nil!25002) (Cons!25001 (h!26210 (_ BitVec 64)) (t!36097 List!25005)) )
))
(declare-fun arrayNoDuplicates!0 (array!74060 (_ BitVec 32) List!25005) Bool)

(assert (=> b!1140039 (= res!760190 (arrayNoDuplicates!0 lt!507439 #b00000000000000000000000000000000 Nil!25002))))

(declare-fun bm!50827 () Bool)

(declare-fun call!50834 () Bool)

(declare-fun contains!6604 (ListLongMap!16233 (_ BitVec 64)) Bool)

(assert (=> bm!50827 (= call!50834 (contains!6604 (ite c!111818 lt!507450 call!50831) k0!934))))

(declare-fun b!1140040 () Bool)

(declare-fun lt!507451 () Unit!37231)

(assert (=> b!1140040 (= e!648624 lt!507451)))

(assert (=> b!1140040 (= lt!507451 call!50827)))

(assert (=> b!1140040 call!50832))

(declare-fun b!1140041 () Bool)

(declare-fun e!648622 () Bool)

(declare-fun e!648632 () Bool)

(assert (=> b!1140041 (= e!648622 e!648632)))

(declare-fun res!760196 () Bool)

(assert (=> b!1140041 (=> res!760196 e!648632)))

(assert (=> b!1140041 (= res!760196 (not (= (select (arr!35681 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140041 e!648619))

(declare-fun c!111813 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140041 (= c!111813 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!507442 () Unit!37231)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!502 (array!74060 array!74062 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37231)

(assert (=> b!1140041 (= lt!507442 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140042 () Bool)

(assert (=> b!1140042 (= e!648632 true)))

(declare-fun lt!507438 () V!43313)

(declare-fun -!1219 (ListLongMap!16233 (_ BitVec 64)) ListLongMap!16233)

(assert (=> b!1140042 (= (-!1219 (+!3559 lt!507434 (tuple2!18265 (select (arr!35681 _keys!1208) from!1455) lt!507438)) (select (arr!35681 _keys!1208) from!1455)) lt!507434)))

(declare-fun lt!507449 () Unit!37231)

(declare-fun addThenRemoveForNewKeyIsSame!87 (ListLongMap!16233 (_ BitVec 64) V!43313) Unit!37231)

(assert (=> b!1140042 (= lt!507449 (addThenRemoveForNewKeyIsSame!87 lt!507434 (select (arr!35681 _keys!1208) from!1455) lt!507438))))

(declare-fun lt!507446 () V!43313)

(declare-fun get!18137 (ValueCell!13610 V!43313) V!43313)

(assert (=> b!1140042 (= lt!507438 (get!18137 (select (arr!35682 _values!996) from!1455) lt!507446))))

(declare-fun lt!507445 () Unit!37231)

(assert (=> b!1140042 (= lt!507445 e!648633)))

(declare-fun c!111815 () Bool)

(assert (=> b!1140042 (= c!111815 (contains!6604 lt!507434 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4627 (array!74060 array!74062 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 32) Int) ListLongMap!16233)

(assert (=> b!1140042 (= lt!507434 (getCurrentListMapNoExtraKeys!4627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140043 () Bool)

(declare-fun e!648620 () Bool)

(declare-fun mapRes!44783 () Bool)

(assert (=> b!1140043 (= e!648630 (and e!648620 mapRes!44783))))

(declare-fun condMapEmpty!44783 () Bool)

(declare-fun mapDefault!44783 () ValueCell!13610)

(assert (=> b!1140043 (= condMapEmpty!44783 (= (arr!35682 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13610)) mapDefault!44783)))))

(declare-fun b!1140044 () Bool)

(declare-fun res!760197 () Bool)

(assert (=> b!1140044 (=> (not res!760197) (not e!648629))))

(assert (=> b!1140044 (= res!760197 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25002))))

(declare-fun b!1140045 () Bool)

(declare-fun res!760186 () Bool)

(assert (=> b!1140045 (=> (not res!760186) (not e!648629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74060 (_ BitVec 32)) Bool)

(assert (=> b!1140045 (= res!760186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140046 () Bool)

(declare-fun e!648618 () Bool)

(assert (=> b!1140046 (= e!648618 tp_is_empty!28639)))

(declare-fun b!1140047 () Bool)

(declare-fun res!760187 () Bool)

(assert (=> b!1140047 (=> (not res!760187) (not e!648629))))

(assert (=> b!1140047 (= res!760187 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36219 _keys!1208))))))

(declare-fun b!1140048 () Bool)

(assert (=> b!1140048 (= e!648619 (= call!50829 (-!1219 call!50828 k0!934)))))

(declare-fun e!648623 () Bool)

(declare-fun b!1140049 () Bool)

(declare-fun arrayContainsKey!0 (array!74060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140049 (= e!648623 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140050 () Bool)

(declare-fun e!648627 () Bool)

(assert (=> b!1140050 (= e!648627 e!648622)))

(declare-fun res!760191 () Bool)

(assert (=> b!1140050 (=> res!760191 e!648622)))

(assert (=> b!1140050 (= res!760191 (not (= from!1455 i!673)))))

(declare-fun lt!507433 () ListLongMap!16233)

(declare-fun lt!507443 () array!74062)

(assert (=> b!1140050 (= lt!507433 (getCurrentListMapNoExtraKeys!4627 lt!507439 lt!507443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140050 (= lt!507443 (array!74063 (store (arr!35682 _values!996) i!673 (ValueCellFull!13610 lt!507446)) (size!36220 _values!996)))))

(declare-fun dynLambda!2611 (Int (_ BitVec 64)) V!43313)

(assert (=> b!1140050 (= lt!507446 (dynLambda!2611 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507448 () ListLongMap!16233)

(assert (=> b!1140050 (= lt!507448 (getCurrentListMapNoExtraKeys!4627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140051 () Bool)

(assert (=> b!1140051 (= c!111816 (and (not lt!507435) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648628 () Unit!37231)

(assert (=> b!1140051 (= e!648628 e!648624)))

(declare-fun b!1140052 () Bool)

(assert (=> b!1140052 (= e!648623 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507435) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140053 () Bool)

(assert (=> b!1140053 (contains!6604 call!50830 k0!934)))

(declare-fun lt!507437 () Unit!37231)

(assert (=> b!1140053 (= lt!507437 (addStillContains!775 lt!507450 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1140053 call!50834))

(assert (=> b!1140053 (= lt!507450 (+!3559 lt!507434 (tuple2!18265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507440 () Unit!37231)

(assert (=> b!1140053 (= lt!507440 call!50833)))

(assert (=> b!1140053 (= e!648628 lt!507437)))

(declare-fun b!1140054 () Bool)

(declare-fun Unit!37234 () Unit!37231)

(assert (=> b!1140054 (= e!648626 Unit!37234)))

(declare-fun b!1140055 () Bool)

(declare-fun res!760199 () Bool)

(assert (=> b!1140055 (=> (not res!760199) (not e!648629))))

(assert (=> b!1140055 (= res!760199 (= (select (arr!35681 _keys!1208) i!673) k0!934))))

(declare-fun b!1140056 () Bool)

(declare-fun e!648625 () Bool)

(assert (=> b!1140056 (= e!648625 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44783 () Bool)

(declare-fun tp!85038 () Bool)

(assert (=> mapNonEmpty!44783 (= mapRes!44783 (and tp!85038 e!648618))))

(declare-fun mapValue!44783 () ValueCell!13610)

(declare-fun mapRest!44783 () (Array (_ BitVec 32) ValueCell!13610))

(declare-fun mapKey!44783 () (_ BitVec 32))

(assert (=> mapNonEmpty!44783 (= (arr!35682 _values!996) (store mapRest!44783 mapKey!44783 mapValue!44783))))

(declare-fun bm!50828 () Bool)

(assert (=> bm!50828 (= call!50828 (getCurrentListMapNoExtraKeys!4627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140057 () Bool)

(assert (=> b!1140057 (= e!648629 e!648621)))

(declare-fun res!760188 () Bool)

(assert (=> b!1140057 (=> (not res!760188) (not e!648621))))

(assert (=> b!1140057 (= res!760188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507439 mask!1564))))

(assert (=> b!1140057 (= lt!507439 (array!74061 (store (arr!35681 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36219 _keys!1208)))))

(declare-fun mapIsEmpty!44783 () Bool)

(assert (=> mapIsEmpty!44783 mapRes!44783))

(declare-fun b!1140058 () Bool)

(declare-fun Unit!37235 () Unit!37231)

(assert (=> b!1140058 (= e!648633 Unit!37235)))

(assert (=> b!1140058 (= lt!507435 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140058 (= c!111818 (and (not lt!507435) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507441 () Unit!37231)

(assert (=> b!1140058 (= lt!507441 e!648628)))

(declare-fun lt!507452 () Unit!37231)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!378 (array!74060 array!74062 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 64) (_ BitVec 32) Int) Unit!37231)

(assert (=> b!1140058 (= lt!507452 (lemmaListMapContainsThenArrayContainsFrom!378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111817 () Bool)

(assert (=> b!1140058 (= c!111817 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760193 () Bool)

(assert (=> b!1140058 (= res!760193 e!648623)))

(assert (=> b!1140058 (=> (not res!760193) (not e!648625))))

(assert (=> b!1140058 e!648625))

(declare-fun lt!507444 () Unit!37231)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74060 (_ BitVec 32) (_ BitVec 32)) Unit!37231)

(assert (=> b!1140058 (= lt!507444 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140058 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25002)))

(declare-fun lt!507453 () Unit!37231)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74060 (_ BitVec 64) (_ BitVec 32) List!25005) Unit!37231)

(assert (=> b!1140058 (= lt!507453 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25002))))

(assert (=> b!1140058 false))

(declare-fun bm!50829 () Bool)

(assert (=> bm!50829 (= call!50832 call!50834)))

(declare-fun bm!50830 () Bool)

(assert (=> bm!50830 (= call!50827 call!50833)))

(declare-fun b!1140059 () Bool)

(declare-fun res!760189 () Bool)

(assert (=> b!1140059 (=> (not res!760189) (not e!648629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140059 (= res!760189 (validMask!0 mask!1564))))

(declare-fun b!1140060 () Bool)

(declare-fun res!760194 () Bool)

(assert (=> b!1140060 (=> (not res!760194) (not e!648629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140060 (= res!760194 (validKeyInArray!0 k0!934))))

(declare-fun b!1140061 () Bool)

(assert (=> b!1140061 (= e!648621 (not e!648627))))

(declare-fun res!760195 () Bool)

(assert (=> b!1140061 (=> res!760195 e!648627)))

(assert (=> b!1140061 (= res!760195 (bvsgt from!1455 i!673))))

(assert (=> b!1140061 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507436 () Unit!37231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74060 (_ BitVec 64) (_ BitVec 32)) Unit!37231)

(assert (=> b!1140061 (= lt!507436 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140062 () Bool)

(assert (=> b!1140062 (= e!648620 tp_is_empty!28639)))

(declare-fun b!1140063 () Bool)

(declare-fun res!760192 () Bool)

(assert (=> b!1140063 (=> (not res!760192) (not e!648629))))

(assert (=> b!1140063 (= res!760192 (and (= (size!36220 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36219 _keys!1208) (size!36220 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50831 () Bool)

(assert (=> bm!50831 (= call!50829 (getCurrentListMapNoExtraKeys!4627 lt!507439 lt!507443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98498 res!760198) b!1140059))

(assert (= (and b!1140059 res!760189) b!1140063))

(assert (= (and b!1140063 res!760192) b!1140045))

(assert (= (and b!1140045 res!760186) b!1140044))

(assert (= (and b!1140044 res!760197) b!1140047))

(assert (= (and b!1140047 res!760187) b!1140060))

(assert (= (and b!1140060 res!760194) b!1140055))

(assert (= (and b!1140055 res!760199) b!1140057))

(assert (= (and b!1140057 res!760188) b!1140039))

(assert (= (and b!1140039 res!760190) b!1140061))

(assert (= (and b!1140061 (not res!760195)) b!1140050))

(assert (= (and b!1140050 (not res!760191)) b!1140041))

(assert (= (and b!1140041 c!111813) b!1140048))

(assert (= (and b!1140041 (not c!111813)) b!1140035))

(assert (= (or b!1140048 b!1140035) bm!50831))

(assert (= (or b!1140048 b!1140035) bm!50828))

(assert (= (and b!1140041 (not res!760196)) b!1140042))

(assert (= (and b!1140042 c!111815) b!1140058))

(assert (= (and b!1140042 (not c!111815)) b!1140038))

(assert (= (and b!1140058 c!111818) b!1140053))

(assert (= (and b!1140058 (not c!111818)) b!1140051))

(assert (= (and b!1140051 c!111816) b!1140040))

(assert (= (and b!1140051 (not c!111816)) b!1140037))

(assert (= (and b!1140037 c!111814) b!1140036))

(assert (= (and b!1140037 (not c!111814)) b!1140054))

(assert (= (or b!1140040 b!1140036) bm!50830))

(assert (= (or b!1140040 b!1140036) bm!50826))

(assert (= (or b!1140040 b!1140036) bm!50829))

(assert (= (or b!1140053 bm!50829) bm!50827))

(assert (= (or b!1140053 bm!50830) bm!50824))

(assert (= (or b!1140053 bm!50826) bm!50825))

(assert (= (and b!1140058 c!111817) b!1140049))

(assert (= (and b!1140058 (not c!111817)) b!1140052))

(assert (= (and b!1140058 res!760193) b!1140056))

(assert (= (and b!1140043 condMapEmpty!44783) mapIsEmpty!44783))

(assert (= (and b!1140043 (not condMapEmpty!44783)) mapNonEmpty!44783))

(get-info :version)

(assert (= (and mapNonEmpty!44783 ((_ is ValueCellFull!13610) mapValue!44783)) b!1140046))

(assert (= (and b!1140043 ((_ is ValueCellFull!13610) mapDefault!44783)) b!1140062))

(assert (= start!98498 b!1140043))

(declare-fun b_lambda!19197 () Bool)

(assert (=> (not b_lambda!19197) (not b!1140050)))

(declare-fun t!36095 () Bool)

(declare-fun tb!8913 () Bool)

(assert (=> (and start!98498 (= defaultEntry!1004 defaultEntry!1004) t!36095) tb!8913))

(declare-fun result!18399 () Bool)

(assert (=> tb!8913 (= result!18399 tp_is_empty!28639)))

(assert (=> b!1140050 t!36095))

(declare-fun b_and!39047 () Bool)

(assert (= b_and!39045 (and (=> t!36095 result!18399) b_and!39047)))

(declare-fun m!1051103 () Bool)

(assert (=> b!1140061 m!1051103))

(declare-fun m!1051105 () Bool)

(assert (=> b!1140061 m!1051105))

(declare-fun m!1051107 () Bool)

(assert (=> b!1140058 m!1051107))

(declare-fun m!1051109 () Bool)

(assert (=> b!1140058 m!1051109))

(declare-fun m!1051111 () Bool)

(assert (=> b!1140058 m!1051111))

(declare-fun m!1051113 () Bool)

(assert (=> b!1140058 m!1051113))

(declare-fun m!1051115 () Bool)

(assert (=> b!1140042 m!1051115))

(declare-fun m!1051117 () Bool)

(assert (=> b!1140042 m!1051117))

(declare-fun m!1051119 () Bool)

(assert (=> b!1140042 m!1051119))

(assert (=> b!1140042 m!1051115))

(declare-fun m!1051121 () Bool)

(assert (=> b!1140042 m!1051121))

(declare-fun m!1051123 () Bool)

(assert (=> b!1140042 m!1051123))

(assert (=> b!1140042 m!1051123))

(assert (=> b!1140042 m!1051117))

(declare-fun m!1051125 () Bool)

(assert (=> b!1140042 m!1051125))

(assert (=> b!1140042 m!1051117))

(declare-fun m!1051127 () Bool)

(assert (=> b!1140042 m!1051127))

(declare-fun m!1051129 () Bool)

(assert (=> b!1140042 m!1051129))

(declare-fun m!1051131 () Bool)

(assert (=> b!1140060 m!1051131))

(declare-fun m!1051133 () Bool)

(assert (=> b!1140057 m!1051133))

(declare-fun m!1051135 () Bool)

(assert (=> b!1140057 m!1051135))

(declare-fun m!1051137 () Bool)

(assert (=> bm!50824 m!1051137))

(declare-fun m!1051139 () Bool)

(assert (=> b!1140055 m!1051139))

(declare-fun m!1051141 () Bool)

(assert (=> b!1140039 m!1051141))

(declare-fun m!1051143 () Bool)

(assert (=> b!1140049 m!1051143))

(declare-fun m!1051145 () Bool)

(assert (=> bm!50825 m!1051145))

(declare-fun m!1051147 () Bool)

(assert (=> b!1140053 m!1051147))

(declare-fun m!1051149 () Bool)

(assert (=> b!1140053 m!1051149))

(declare-fun m!1051151 () Bool)

(assert (=> b!1140053 m!1051151))

(declare-fun m!1051153 () Bool)

(assert (=> mapNonEmpty!44783 m!1051153))

(assert (=> b!1140041 m!1051117))

(declare-fun m!1051155 () Bool)

(assert (=> b!1140041 m!1051155))

(assert (=> b!1140056 m!1051143))

(declare-fun m!1051157 () Bool)

(assert (=> b!1140044 m!1051157))

(declare-fun m!1051159 () Bool)

(assert (=> bm!50827 m!1051159))

(declare-fun m!1051161 () Bool)

(assert (=> b!1140045 m!1051161))

(declare-fun m!1051163 () Bool)

(assert (=> b!1140059 m!1051163))

(declare-fun m!1051165 () Bool)

(assert (=> b!1140048 m!1051165))

(declare-fun m!1051167 () Bool)

(assert (=> start!98498 m!1051167))

(declare-fun m!1051169 () Bool)

(assert (=> start!98498 m!1051169))

(declare-fun m!1051171 () Bool)

(assert (=> bm!50831 m!1051171))

(assert (=> bm!50828 m!1051129))

(declare-fun m!1051173 () Bool)

(assert (=> b!1140050 m!1051173))

(declare-fun m!1051175 () Bool)

(assert (=> b!1140050 m!1051175))

(declare-fun m!1051177 () Bool)

(assert (=> b!1140050 m!1051177))

(declare-fun m!1051179 () Bool)

(assert (=> b!1140050 m!1051179))

(check-sat (not bm!50828) (not b!1140059) (not b!1140050) (not b!1140053) tp_is_empty!28639 (not b_lambda!19197) (not start!98498) (not bm!50824) (not b!1140061) (not b!1140039) (not b!1140049) b_and!39047 (not bm!50827) (not b!1140056) (not b!1140048) (not b!1140058) (not b!1140041) (not b!1140044) (not b!1140042) (not b!1140045) (not bm!50831) (not b_next!24109) (not bm!50825) (not b!1140057) (not mapNonEmpty!44783) (not b!1140060))
(check-sat b_and!39047 (not b_next!24109))
