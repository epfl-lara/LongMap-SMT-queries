; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98480 () Bool)

(assert start!98480)

(declare-fun b_free!24091 () Bool)

(declare-fun b_next!24091 () Bool)

(assert (=> start!98480 (= b_free!24091 (not b_next!24091))))

(declare-fun tp!84984 () Bool)

(declare-fun b_and!39009 () Bool)

(assert (=> start!98480 (= tp!84984 b_and!39009)))

(declare-fun b!1139234 () Bool)

(declare-fun call!50611 () Bool)

(assert (=> b!1139234 call!50611))

(declare-datatypes ((Unit!37197 0))(
  ( (Unit!37198) )
))
(declare-fun lt!506884 () Unit!37197)

(declare-fun call!50617 () Unit!37197)

(assert (=> b!1139234 (= lt!506884 call!50617)))

(declare-fun e!648200 () Unit!37197)

(assert (=> b!1139234 (= e!648200 lt!506884)))

(declare-fun b!1139235 () Bool)

(declare-fun e!648190 () Bool)

(declare-fun e!648193 () Bool)

(assert (=> b!1139235 (= e!648190 e!648193)))

(declare-fun res!759813 () Bool)

(assert (=> b!1139235 (=> (not res!759813) (not e!648193))))

(declare-datatypes ((array!74024 0))(
  ( (array!74025 (arr!35663 (Array (_ BitVec 32) (_ BitVec 64))) (size!36201 (_ BitVec 32))) )
))
(declare-fun lt!506867 () array!74024)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74024 (_ BitVec 32)) Bool)

(assert (=> b!1139235 (= res!759813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506867 mask!1564))))

(declare-fun _keys!1208 () array!74024)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139235 (= lt!506867 (array!74025 (store (arr!35663 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36201 _keys!1208)))))

(declare-fun b!1139236 () Bool)

(declare-fun res!759821 () Bool)

(assert (=> b!1139236 (=> (not res!759821) (not e!648190))))

(assert (=> b!1139236 (= res!759821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1139237 () Bool)

(declare-fun e!648199 () Bool)

(declare-fun lt!506883 () Bool)

(assert (=> b!1139237 (= e!648199 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506883) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139238 () Bool)

(declare-fun res!759814 () Bool)

(assert (=> b!1139238 (=> (not res!759814) (not e!648190))))

(assert (=> b!1139238 (= res!759814 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36201 _keys!1208))))))

(declare-fun b!1139239 () Bool)

(declare-fun e!648189 () Bool)

(declare-fun e!648198 () Bool)

(assert (=> b!1139239 (= e!648189 e!648198)))

(declare-fun res!759810 () Bool)

(assert (=> b!1139239 (=> res!759810 e!648198)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139239 (= res!759810 (not (= (select (arr!35663 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648197 () Bool)

(assert (=> b!1139239 e!648197))

(declare-fun c!111652 () Bool)

(assert (=> b!1139239 (= c!111652 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43289 0))(
  ( (V!43290 (val!14367 Int)) )
))
(declare-fun zeroValue!944 () V!43289)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13601 0))(
  ( (ValueCellFull!13601 (v!17003 V!43289)) (EmptyCell!13601) )
))
(declare-datatypes ((array!74026 0))(
  ( (array!74027 (arr!35664 (Array (_ BitVec 32) ValueCell!13601)) (size!36202 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74026)

(declare-fun minValue!944 () V!43289)

(declare-fun lt!506877 () Unit!37197)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!496 (array!74024 array!74026 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37197)

(assert (=> b!1139239 (= lt!506877 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139240 () Bool)

(declare-fun Unit!37199 () Unit!37197)

(assert (=> b!1139240 (= e!648200 Unit!37199)))

(declare-fun b!1139241 () Bool)

(declare-datatypes ((tuple2!18248 0))(
  ( (tuple2!18249 (_1!9135 (_ BitVec 64)) (_2!9135 V!43289)) )
))
(declare-datatypes ((List!24988 0))(
  ( (Nil!24985) (Cons!24984 (h!26193 tuple2!18248) (t!36062 List!24988)) )
))
(declare-datatypes ((ListLongMap!16217 0))(
  ( (ListLongMap!16218 (toList!8124 List!24988)) )
))
(declare-fun call!50612 () ListLongMap!16217)

(declare-fun contains!6596 (ListLongMap!16217 (_ BitVec 64)) Bool)

(assert (=> b!1139241 (contains!6596 call!50612 k0!934)))

(declare-fun lt!506869 () Unit!37197)

(declare-fun lt!506880 () ListLongMap!16217)

(declare-fun addStillContains!769 (ListLongMap!16217 (_ BitVec 64) V!43289 (_ BitVec 64)) Unit!37197)

(assert (=> b!1139241 (= lt!506869 (addStillContains!769 lt!506880 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50613 () Bool)

(assert (=> b!1139241 call!50613))

(declare-fun lt!506874 () ListLongMap!16217)

(declare-fun +!3551 (ListLongMap!16217 tuple2!18248) ListLongMap!16217)

(assert (=> b!1139241 (= lt!506880 (+!3551 lt!506874 (tuple2!18249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506882 () Unit!37197)

(declare-fun call!50614 () Unit!37197)

(assert (=> b!1139241 (= lt!506882 call!50614)))

(declare-fun e!648196 () Unit!37197)

(assert (=> b!1139241 (= e!648196 lt!506869)))

(declare-fun b!1139242 () Bool)

(declare-fun e!648191 () Bool)

(assert (=> b!1139242 (= e!648191 e!648189)))

(declare-fun res!759818 () Bool)

(assert (=> b!1139242 (=> res!759818 e!648189)))

(assert (=> b!1139242 (= res!759818 (not (= from!1455 i!673)))))

(declare-fun lt!506873 () array!74026)

(declare-fun lt!506875 () ListLongMap!16217)

(declare-fun getCurrentListMapNoExtraKeys!4619 (array!74024 array!74026 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 32) Int) ListLongMap!16217)

(assert (=> b!1139242 (= lt!506875 (getCurrentListMapNoExtraKeys!4619 lt!506867 lt!506873 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!506886 () V!43289)

(assert (=> b!1139242 (= lt!506873 (array!74027 (store (arr!35664 _values!996) i!673 (ValueCellFull!13601 lt!506886)) (size!36202 _values!996)))))

(declare-fun dynLambda!2605 (Int (_ BitVec 64)) V!43289)

(assert (=> b!1139242 (= lt!506886 (dynLambda!2605 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!506881 () ListLongMap!16217)

(assert (=> b!1139242 (= lt!506881 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50608 () Bool)

(assert (=> bm!50608 (= call!50617 call!50614)))

(declare-fun b!1139243 () Bool)

(declare-fun e!648187 () Unit!37197)

(assert (=> b!1139243 (= e!648187 e!648200)))

(declare-fun c!111655 () Bool)

(assert (=> b!1139243 (= c!111655 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506883))))

(declare-fun bm!50609 () Bool)

(declare-fun call!50615 () ListLongMap!16217)

(assert (=> bm!50609 (= call!50615 call!50612)))

(declare-fun call!50618 () ListLongMap!16217)

(declare-fun b!1139244 () Bool)

(declare-fun call!50616 () ListLongMap!16217)

(declare-fun -!1212 (ListLongMap!16217 (_ BitVec 64)) ListLongMap!16217)

(assert (=> b!1139244 (= e!648197 (= call!50616 (-!1212 call!50618 k0!934)))))

(declare-fun b!1139245 () Bool)

(declare-fun res!759812 () Bool)

(assert (=> b!1139245 (=> (not res!759812) (not e!648193))))

(declare-datatypes ((List!24989 0))(
  ( (Nil!24986) (Cons!24985 (h!26194 (_ BitVec 64)) (t!36063 List!24989)) )
))
(declare-fun arrayNoDuplicates!0 (array!74024 (_ BitVec 32) List!24989) Bool)

(assert (=> b!1139245 (= res!759812 (arrayNoDuplicates!0 lt!506867 #b00000000000000000000000000000000 Nil!24986))))

(declare-fun b!1139246 () Bool)

(declare-fun res!759816 () Bool)

(assert (=> b!1139246 (=> (not res!759816) (not e!648190))))

(assert (=> b!1139246 (= res!759816 (= (select (arr!35663 _keys!1208) i!673) k0!934))))

(declare-fun b!1139247 () Bool)

(assert (=> b!1139247 (= e!648197 (= call!50616 call!50618))))

(declare-fun b!1139248 () Bool)

(declare-fun res!759820 () Bool)

(assert (=> b!1139248 (=> (not res!759820) (not e!648190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139248 (= res!759820 (validMask!0 mask!1564))))

(declare-fun b!1139249 () Bool)

(declare-fun c!111654 () Bool)

(assert (=> b!1139249 (= c!111654 (and (not lt!506883) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139249 (= e!648196 e!648187)))

(declare-fun bm!50610 () Bool)

(declare-fun c!111651 () Bool)

(assert (=> bm!50610 (= call!50612 (+!3551 (ite c!111651 lt!506880 lt!506874) (ite c!111651 (tuple2!18249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111654 (tuple2!18249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!44756 () Bool)

(declare-fun mapRes!44756 () Bool)

(assert (=> mapIsEmpty!44756 mapRes!44756))

(declare-fun bm!50611 () Bool)

(assert (=> bm!50611 (= call!50616 (getCurrentListMapNoExtraKeys!4619 lt!506867 lt!506873 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139250 () Bool)

(declare-fun e!648201 () Bool)

(declare-fun tp_is_empty!28621 () Bool)

(assert (=> b!1139250 (= e!648201 tp_is_empty!28621)))

(declare-fun e!648186 () Bool)

(declare-fun b!1139251 () Bool)

(declare-fun arrayContainsKey!0 (array!74024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139251 (= e!648186 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50612 () Bool)

(assert (=> bm!50612 (= call!50613 (contains!6596 (ite c!111651 lt!506880 call!50615) k0!934))))

(declare-fun b!1139252 () Bool)

(declare-fun e!648188 () Bool)

(assert (=> b!1139252 (= e!648188 (and e!648201 mapRes!44756))))

(declare-fun condMapEmpty!44756 () Bool)

(declare-fun mapDefault!44756 () ValueCell!13601)

(assert (=> b!1139252 (= condMapEmpty!44756 (= (arr!35664 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13601)) mapDefault!44756)))))

(declare-fun bm!50613 () Bool)

(assert (=> bm!50613 (= call!50618 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!759811 () Bool)

(assert (=> start!98480 (=> (not res!759811) (not e!648190))))

(assert (=> start!98480 (= res!759811 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36201 _keys!1208))))))

(assert (=> start!98480 e!648190))

(assert (=> start!98480 tp_is_empty!28621))

(declare-fun array_inv!27410 (array!74024) Bool)

(assert (=> start!98480 (array_inv!27410 _keys!1208)))

(assert (=> start!98480 true))

(assert (=> start!98480 tp!84984))

(declare-fun array_inv!27411 (array!74026) Bool)

(assert (=> start!98480 (and (array_inv!27411 _values!996) e!648188)))

(declare-fun b!1139253 () Bool)

(declare-fun res!759815 () Bool)

(assert (=> b!1139253 (=> (not res!759815) (not e!648190))))

(assert (=> b!1139253 (= res!759815 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24986))))

(declare-fun b!1139254 () Bool)

(declare-fun lt!506871 () Unit!37197)

(assert (=> b!1139254 (= e!648187 lt!506871)))

(assert (=> b!1139254 (= lt!506871 call!50617)))

(assert (=> b!1139254 call!50611))

(declare-fun b!1139255 () Bool)

(assert (=> b!1139255 (= e!648198 true)))

(declare-fun lt!506872 () V!43289)

(assert (=> b!1139255 (= (-!1212 (+!3551 lt!506874 (tuple2!18249 (select (arr!35663 _keys!1208) from!1455) lt!506872)) (select (arr!35663 _keys!1208) from!1455)) lt!506874)))

(declare-fun lt!506885 () Unit!37197)

(declare-fun addThenRemoveForNewKeyIsSame!81 (ListLongMap!16217 (_ BitVec 64) V!43289) Unit!37197)

(assert (=> b!1139255 (= lt!506885 (addThenRemoveForNewKeyIsSame!81 lt!506874 (select (arr!35663 _keys!1208) from!1455) lt!506872))))

(declare-fun get!18125 (ValueCell!13601 V!43289) V!43289)

(assert (=> b!1139255 (= lt!506872 (get!18125 (select (arr!35664 _values!996) from!1455) lt!506886))))

(declare-fun lt!506879 () Unit!37197)

(declare-fun e!648195 () Unit!37197)

(assert (=> b!1139255 (= lt!506879 e!648195)))

(declare-fun c!111653 () Bool)

(assert (=> b!1139255 (= c!111653 (contains!6596 lt!506874 k0!934))))

(assert (=> b!1139255 (= lt!506874 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139256 () Bool)

(declare-fun res!759809 () Bool)

(assert (=> b!1139256 (=> (not res!759809) (not e!648190))))

(assert (=> b!1139256 (= res!759809 (and (= (size!36202 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36201 _keys!1208) (size!36202 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139257 () Bool)

(declare-fun Unit!37200 () Unit!37197)

(assert (=> b!1139257 (= e!648195 Unit!37200)))

(assert (=> b!1139257 (= lt!506883 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139257 (= c!111651 (and (not lt!506883) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506876 () Unit!37197)

(assert (=> b!1139257 (= lt!506876 e!648196)))

(declare-fun lt!506878 () Unit!37197)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!372 (array!74024 array!74026 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 64) (_ BitVec 32) Int) Unit!37197)

(assert (=> b!1139257 (= lt!506878 (lemmaListMapContainsThenArrayContainsFrom!372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111656 () Bool)

(assert (=> b!1139257 (= c!111656 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759817 () Bool)

(assert (=> b!1139257 (= res!759817 e!648199)))

(assert (=> b!1139257 (=> (not res!759817) (not e!648186))))

(assert (=> b!1139257 e!648186))

(declare-fun lt!506870 () Unit!37197)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74024 (_ BitVec 32) (_ BitVec 32)) Unit!37197)

(assert (=> b!1139257 (= lt!506870 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139257 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24986)))

(declare-fun lt!506866 () Unit!37197)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74024 (_ BitVec 64) (_ BitVec 32) List!24989) Unit!37197)

(assert (=> b!1139257 (= lt!506866 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24986))))

(assert (=> b!1139257 false))

(declare-fun b!1139258 () Bool)

(declare-fun e!648194 () Bool)

(assert (=> b!1139258 (= e!648194 tp_is_empty!28621)))

(declare-fun b!1139259 () Bool)

(declare-fun Unit!37201 () Unit!37197)

(assert (=> b!1139259 (= e!648195 Unit!37201)))

(declare-fun b!1139260 () Bool)

(assert (=> b!1139260 (= e!648193 (not e!648191))))

(declare-fun res!759819 () Bool)

(assert (=> b!1139260 (=> res!759819 e!648191)))

(assert (=> b!1139260 (= res!759819 (bvsgt from!1455 i!673))))

(assert (=> b!1139260 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506868 () Unit!37197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74024 (_ BitVec 64) (_ BitVec 32)) Unit!37197)

(assert (=> b!1139260 (= lt!506868 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139261 () Bool)

(assert (=> b!1139261 (= e!648199 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139262 () Bool)

(declare-fun res!759808 () Bool)

(assert (=> b!1139262 (=> (not res!759808) (not e!648190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139262 (= res!759808 (validKeyInArray!0 k0!934))))

(declare-fun bm!50614 () Bool)

(assert (=> bm!50614 (= call!50611 call!50613)))

(declare-fun bm!50615 () Bool)

(assert (=> bm!50615 (= call!50614 (addStillContains!769 lt!506874 (ite (or c!111651 c!111654) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111651 c!111654) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapNonEmpty!44756 () Bool)

(declare-fun tp!84983 () Bool)

(assert (=> mapNonEmpty!44756 (= mapRes!44756 (and tp!84983 e!648194))))

(declare-fun mapRest!44756 () (Array (_ BitVec 32) ValueCell!13601))

(declare-fun mapKey!44756 () (_ BitVec 32))

(declare-fun mapValue!44756 () ValueCell!13601)

(assert (=> mapNonEmpty!44756 (= (arr!35664 _values!996) (store mapRest!44756 mapKey!44756 mapValue!44756))))

(assert (= (and start!98480 res!759811) b!1139248))

(assert (= (and b!1139248 res!759820) b!1139256))

(assert (= (and b!1139256 res!759809) b!1139236))

(assert (= (and b!1139236 res!759821) b!1139253))

(assert (= (and b!1139253 res!759815) b!1139238))

(assert (= (and b!1139238 res!759814) b!1139262))

(assert (= (and b!1139262 res!759808) b!1139246))

(assert (= (and b!1139246 res!759816) b!1139235))

(assert (= (and b!1139235 res!759813) b!1139245))

(assert (= (and b!1139245 res!759812) b!1139260))

(assert (= (and b!1139260 (not res!759819)) b!1139242))

(assert (= (and b!1139242 (not res!759818)) b!1139239))

(assert (= (and b!1139239 c!111652) b!1139244))

(assert (= (and b!1139239 (not c!111652)) b!1139247))

(assert (= (or b!1139244 b!1139247) bm!50611))

(assert (= (or b!1139244 b!1139247) bm!50613))

(assert (= (and b!1139239 (not res!759810)) b!1139255))

(assert (= (and b!1139255 c!111653) b!1139257))

(assert (= (and b!1139255 (not c!111653)) b!1139259))

(assert (= (and b!1139257 c!111651) b!1139241))

(assert (= (and b!1139257 (not c!111651)) b!1139249))

(assert (= (and b!1139249 c!111654) b!1139254))

(assert (= (and b!1139249 (not c!111654)) b!1139243))

(assert (= (and b!1139243 c!111655) b!1139234))

(assert (= (and b!1139243 (not c!111655)) b!1139240))

(assert (= (or b!1139254 b!1139234) bm!50608))

(assert (= (or b!1139254 b!1139234) bm!50609))

(assert (= (or b!1139254 b!1139234) bm!50614))

(assert (= (or b!1139241 bm!50614) bm!50612))

(assert (= (or b!1139241 bm!50608) bm!50615))

(assert (= (or b!1139241 bm!50609) bm!50610))

(assert (= (and b!1139257 c!111656) b!1139261))

(assert (= (and b!1139257 (not c!111656)) b!1139237))

(assert (= (and b!1139257 res!759817) b!1139251))

(assert (= (and b!1139252 condMapEmpty!44756) mapIsEmpty!44756))

(assert (= (and b!1139252 (not condMapEmpty!44756)) mapNonEmpty!44756))

(get-info :version)

(assert (= (and mapNonEmpty!44756 ((_ is ValueCellFull!13601) mapValue!44756)) b!1139258))

(assert (= (and b!1139252 ((_ is ValueCellFull!13601) mapDefault!44756)) b!1139250))

(assert (= start!98480 b!1139252))

(declare-fun b_lambda!19179 () Bool)

(assert (=> (not b_lambda!19179) (not b!1139242)))

(declare-fun t!36061 () Bool)

(declare-fun tb!8895 () Bool)

(assert (=> (and start!98480 (= defaultEntry!1004 defaultEntry!1004) t!36061) tb!8895))

(declare-fun result!18363 () Bool)

(assert (=> tb!8895 (= result!18363 tp_is_empty!28621)))

(assert (=> b!1139242 t!36061))

(declare-fun b_and!39011 () Bool)

(assert (= b_and!39009 (and (=> t!36061 result!18363) b_and!39011)))

(declare-fun m!1050401 () Bool)

(assert (=> b!1139246 m!1050401))

(declare-fun m!1050403 () Bool)

(assert (=> b!1139236 m!1050403))

(declare-fun m!1050405 () Bool)

(assert (=> bm!50612 m!1050405))

(declare-fun m!1050407 () Bool)

(assert (=> b!1139253 m!1050407))

(declare-fun m!1050409 () Bool)

(assert (=> bm!50610 m!1050409))

(declare-fun m!1050411 () Bool)

(assert (=> b!1139260 m!1050411))

(declare-fun m!1050413 () Bool)

(assert (=> b!1139260 m!1050413))

(declare-fun m!1050415 () Bool)

(assert (=> b!1139248 m!1050415))

(declare-fun m!1050417 () Bool)

(assert (=> bm!50615 m!1050417))

(declare-fun m!1050419 () Bool)

(assert (=> bm!50611 m!1050419))

(declare-fun m!1050421 () Bool)

(assert (=> start!98480 m!1050421))

(declare-fun m!1050423 () Bool)

(assert (=> start!98480 m!1050423))

(declare-fun m!1050425 () Bool)

(assert (=> b!1139235 m!1050425))

(declare-fun m!1050427 () Bool)

(assert (=> b!1139235 m!1050427))

(declare-fun m!1050429 () Bool)

(assert (=> bm!50613 m!1050429))

(declare-fun m!1050431 () Bool)

(assert (=> b!1139251 m!1050431))

(declare-fun m!1050433 () Bool)

(assert (=> b!1139244 m!1050433))

(declare-fun m!1050435 () Bool)

(assert (=> b!1139239 m!1050435))

(declare-fun m!1050437 () Bool)

(assert (=> b!1139239 m!1050437))

(declare-fun m!1050439 () Bool)

(assert (=> mapNonEmpty!44756 m!1050439))

(declare-fun m!1050441 () Bool)

(assert (=> b!1139242 m!1050441))

(declare-fun m!1050443 () Bool)

(assert (=> b!1139242 m!1050443))

(declare-fun m!1050445 () Bool)

(assert (=> b!1139242 m!1050445))

(declare-fun m!1050447 () Bool)

(assert (=> b!1139242 m!1050447))

(assert (=> b!1139255 m!1050429))

(declare-fun m!1050449 () Bool)

(assert (=> b!1139255 m!1050449))

(declare-fun m!1050451 () Bool)

(assert (=> b!1139255 m!1050451))

(declare-fun m!1050453 () Bool)

(assert (=> b!1139255 m!1050453))

(assert (=> b!1139255 m!1050435))

(declare-fun m!1050455 () Bool)

(assert (=> b!1139255 m!1050455))

(assert (=> b!1139255 m!1050451))

(declare-fun m!1050457 () Bool)

(assert (=> b!1139255 m!1050457))

(assert (=> b!1139255 m!1050453))

(assert (=> b!1139255 m!1050435))

(declare-fun m!1050459 () Bool)

(assert (=> b!1139255 m!1050459))

(assert (=> b!1139255 m!1050435))

(declare-fun m!1050461 () Bool)

(assert (=> b!1139257 m!1050461))

(declare-fun m!1050463 () Bool)

(assert (=> b!1139257 m!1050463))

(declare-fun m!1050465 () Bool)

(assert (=> b!1139257 m!1050465))

(declare-fun m!1050467 () Bool)

(assert (=> b!1139257 m!1050467))

(declare-fun m!1050469 () Bool)

(assert (=> b!1139241 m!1050469))

(declare-fun m!1050471 () Bool)

(assert (=> b!1139241 m!1050471))

(declare-fun m!1050473 () Bool)

(assert (=> b!1139241 m!1050473))

(declare-fun m!1050475 () Bool)

(assert (=> b!1139262 m!1050475))

(assert (=> b!1139261 m!1050431))

(declare-fun m!1050477 () Bool)

(assert (=> b!1139245 m!1050477))

(check-sat tp_is_empty!28621 (not b_next!24091) (not b!1139244) (not start!98480) (not b!1139255) (not b!1139251) (not b!1139245) (not b!1139235) (not b!1139257) (not b!1139261) (not b!1139253) (not b!1139248) (not b!1139236) (not b!1139262) (not bm!50615) (not bm!50613) (not bm!50610) (not bm!50611) b_and!39011 (not b!1139241) (not b_lambda!19179) (not bm!50612) (not b!1139260) (not b!1139239) (not b!1139242) (not mapNonEmpty!44756))
(check-sat b_and!39011 (not b_next!24091))
