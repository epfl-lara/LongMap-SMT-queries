; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98800 () Bool)

(assert start!98800)

(declare-fun b_free!24169 () Bool)

(declare-fun b_next!24169 () Bool)

(assert (=> start!98800 (= b_free!24169 (not b_next!24169))))

(declare-fun tp!85217 () Bool)

(declare-fun b_and!39189 () Bool)

(assert (=> start!98800 (= tp!85217 b_and!39189)))

(declare-datatypes ((array!74297 0))(
  ( (array!74298 (arr!35793 (Array (_ BitVec 32) (_ BitVec 64))) (size!36330 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74297)

(declare-fun b!1144118 () Bool)

(declare-fun e!650982 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144118 (= e!650982 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144119 () Bool)

(declare-fun res!762023 () Bool)

(declare-fun e!650968 () Bool)

(assert (=> b!1144119 (=> (not res!762023) (not e!650968))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144119 (= res!762023 (= (select (arr!35793 _keys!1208) i!673) k0!934))))

(declare-fun b!1144120 () Bool)

(declare-fun e!650975 () Bool)

(declare-datatypes ((V!43393 0))(
  ( (V!43394 (val!14406 Int)) )
))
(declare-datatypes ((tuple2!18246 0))(
  ( (tuple2!18247 (_1!9134 (_ BitVec 64)) (_2!9134 V!43393)) )
))
(declare-datatypes ((List!25002 0))(
  ( (Nil!24999) (Cons!24998 (h!26216 tuple2!18246) (t!36155 List!25002)) )
))
(declare-datatypes ((ListLongMap!16223 0))(
  ( (ListLongMap!16224 (toList!8127 List!25002)) )
))
(declare-fun call!51636 () ListLongMap!16223)

(declare-fun call!51642 () ListLongMap!16223)

(assert (=> b!1144120 (= e!650975 (= call!51636 call!51642))))

(declare-fun b!1144122 () Bool)

(declare-fun -!1257 (ListLongMap!16223 (_ BitVec 64)) ListLongMap!16223)

(assert (=> b!1144122 (= e!650975 (= call!51636 (-!1257 call!51642 k0!934)))))

(declare-fun mapIsEmpty!44873 () Bool)

(declare-fun mapRes!44873 () Bool)

(assert (=> mapIsEmpty!44873 mapRes!44873))

(declare-fun e!650980 () Bool)

(declare-fun b!1144123 () Bool)

(assert (=> b!1144123 (= e!650980 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!51635 () Bool)

(declare-fun call!51638 () ListLongMap!16223)

(declare-fun bm!51632 () Bool)

(declare-fun c!112779 () Bool)

(declare-fun lt!510015 () ListLongMap!16223)

(declare-fun contains!6672 (ListLongMap!16223 (_ BitVec 64)) Bool)

(assert (=> bm!51632 (= call!51635 (contains!6672 (ite c!112779 lt!510015 call!51638) k0!934))))

(declare-fun b!1144124 () Bool)

(declare-fun res!762033 () Bool)

(assert (=> b!1144124 (=> (not res!762033) (not e!650968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144124 (= res!762033 (validKeyInArray!0 k0!934))))

(declare-fun b!1144125 () Bool)

(declare-datatypes ((Unit!37471 0))(
  ( (Unit!37472) )
))
(declare-fun e!650976 () Unit!37471)

(declare-fun Unit!37473 () Unit!37471)

(assert (=> b!1144125 (= e!650976 Unit!37473)))

(declare-fun lt!510007 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1144125 (= lt!510007 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144125 (= c!112779 (and (not lt!510007) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510008 () Unit!37471)

(declare-fun e!650981 () Unit!37471)

(assert (=> b!1144125 (= lt!510008 e!650981)))

(declare-fun zeroValue!944 () V!43393)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510017 () Unit!37471)

(declare-datatypes ((ValueCell!13640 0))(
  ( (ValueCellFull!13640 (v!17039 V!43393)) (EmptyCell!13640) )
))
(declare-datatypes ((array!74299 0))(
  ( (array!74300 (arr!35794 (Array (_ BitVec 32) ValueCell!13640)) (size!36331 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74299)

(declare-fun minValue!944 () V!43393)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!400 (array!74297 array!74299 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 64) (_ BitVec 32) Int) Unit!37471)

(assert (=> b!1144125 (= lt!510017 (lemmaListMapContainsThenArrayContainsFrom!400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112777 () Bool)

(assert (=> b!1144125 (= c!112777 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762024 () Bool)

(assert (=> b!1144125 (= res!762024 e!650982)))

(assert (=> b!1144125 (=> (not res!762024) (not e!650980))))

(assert (=> b!1144125 e!650980))

(declare-fun lt!510013 () Unit!37471)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74297 (_ BitVec 32) (_ BitVec 32)) Unit!37471)

(assert (=> b!1144125 (= lt!510013 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25003 0))(
  ( (Nil!25000) (Cons!24999 (h!26217 (_ BitVec 64)) (t!36156 List!25003)) )
))
(declare-fun arrayNoDuplicates!0 (array!74297 (_ BitVec 32) List!25003) Bool)

(assert (=> b!1144125 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25000)))

(declare-fun lt!510016 () Unit!37471)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74297 (_ BitVec 64) (_ BitVec 32) List!25003) Unit!37471)

(assert (=> b!1144125 (= lt!510016 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25000))))

(assert (=> b!1144125 false))

(declare-fun b!1144126 () Bool)

(declare-fun e!650972 () Unit!37471)

(declare-fun e!650971 () Unit!37471)

(assert (=> b!1144126 (= e!650972 e!650971)))

(declare-fun c!112782 () Bool)

(assert (=> b!1144126 (= c!112782 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510007))))

(declare-fun b!1144127 () Bool)

(declare-fun res!762030 () Bool)

(declare-fun e!650977 () Bool)

(assert (=> b!1144127 (=> (not res!762030) (not e!650977))))

(declare-fun lt!510011 () array!74297)

(assert (=> b!1144127 (= res!762030 (arrayNoDuplicates!0 lt!510011 #b00000000000000000000000000000000 Nil!25000))))

(declare-fun b!1144128 () Bool)

(declare-fun e!650970 () Bool)

(declare-fun tp_is_empty!28699 () Bool)

(assert (=> b!1144128 (= e!650970 tp_is_empty!28699)))

(declare-fun bm!51633 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4633 (array!74297 array!74299 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 32) Int) ListLongMap!16223)

(assert (=> bm!51633 (= call!51642 (getCurrentListMapNoExtraKeys!4633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144129 () Bool)

(declare-fun Unit!37474 () Unit!37471)

(assert (=> b!1144129 (= e!650976 Unit!37474)))

(declare-fun b!1144130 () Bool)

(declare-fun e!650983 () Bool)

(declare-fun e!650969 () Bool)

(assert (=> b!1144130 (= e!650983 e!650969)))

(declare-fun res!762028 () Bool)

(assert (=> b!1144130 (=> res!762028 e!650969)))

(assert (=> b!1144130 (= res!762028 (not (= from!1455 i!673)))))

(declare-fun lt!510009 () ListLongMap!16223)

(declare-fun lt!510014 () array!74299)

(assert (=> b!1144130 (= lt!510009 (getCurrentListMapNoExtraKeys!4633 lt!510011 lt!510014 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510010 () V!43393)

(assert (=> b!1144130 (= lt!510014 (array!74300 (store (arr!35794 _values!996) i!673 (ValueCellFull!13640 lt!510010)) (size!36331 _values!996)))))

(declare-fun dynLambda!2668 (Int (_ BitVec 64)) V!43393)

(assert (=> b!1144130 (= lt!510010 (dynLambda!2668 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510004 () ListLongMap!16223)

(assert (=> b!1144130 (= lt!510004 (getCurrentListMapNoExtraKeys!4633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!762026 () Bool)

(assert (=> start!98800 (=> (not res!762026) (not e!650968))))

(assert (=> start!98800 (= res!762026 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36330 _keys!1208))))))

(assert (=> start!98800 e!650968))

(assert (=> start!98800 tp_is_empty!28699))

(declare-fun array_inv!27474 (array!74297) Bool)

(assert (=> start!98800 (array_inv!27474 _keys!1208)))

(assert (=> start!98800 true))

(assert (=> start!98800 tp!85217))

(declare-fun e!650974 () Bool)

(declare-fun array_inv!27475 (array!74299) Bool)

(assert (=> start!98800 (and (array_inv!27475 _values!996) e!650974)))

(declare-fun b!1144121 () Bool)

(assert (=> b!1144121 (= e!650977 (not e!650983))))

(declare-fun res!762031 () Bool)

(assert (=> b!1144121 (=> res!762031 e!650983)))

(assert (=> b!1144121 (= res!762031 (bvsgt from!1455 i!673))))

(assert (=> b!1144121 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510003 () Unit!37471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74297 (_ BitVec 64) (_ BitVec 32)) Unit!37471)

(assert (=> b!1144121 (= lt!510003 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1144131 () Bool)

(declare-fun res!762025 () Bool)

(assert (=> b!1144131 (=> (not res!762025) (not e!650968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144131 (= res!762025 (validMask!0 mask!1564))))

(declare-fun bm!51634 () Bool)

(declare-fun c!112781 () Bool)

(declare-fun lt!510005 () ListLongMap!16223)

(declare-fun call!51637 () Unit!37471)

(declare-fun addStillContains!800 (ListLongMap!16223 (_ BitVec 64) V!43393 (_ BitVec 64)) Unit!37471)

(assert (=> bm!51634 (= call!51637 (addStillContains!800 (ite c!112779 lt!510015 lt!510005) (ite c!112779 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112781 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112779 minValue!944 (ite c!112781 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1144132 () Bool)

(declare-fun +!3573 (ListLongMap!16223 tuple2!18246) ListLongMap!16223)

(assert (=> b!1144132 (contains!6672 (+!3573 lt!510015 (tuple2!18247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510002 () Unit!37471)

(assert (=> b!1144132 (= lt!510002 call!51637)))

(assert (=> b!1144132 call!51635))

(declare-fun call!51641 () ListLongMap!16223)

(assert (=> b!1144132 (= lt!510015 call!51641)))

(declare-fun lt!510000 () Unit!37471)

(assert (=> b!1144132 (= lt!510000 (addStillContains!800 lt!510005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1144132 (= e!650981 lt!510002)))

(declare-fun mapNonEmpty!44873 () Bool)

(declare-fun tp!85218 () Bool)

(declare-fun e!650973 () Bool)

(assert (=> mapNonEmpty!44873 (= mapRes!44873 (and tp!85218 e!650973))))

(declare-fun mapRest!44873 () (Array (_ BitVec 32) ValueCell!13640))

(declare-fun mapKey!44873 () (_ BitVec 32))

(declare-fun mapValue!44873 () ValueCell!13640)

(assert (=> mapNonEmpty!44873 (= (arr!35794 _values!996) (store mapRest!44873 mapKey!44873 mapValue!44873))))

(declare-fun bm!51635 () Bool)

(assert (=> bm!51635 (= call!51638 call!51641)))

(declare-fun b!1144133 () Bool)

(declare-fun e!650979 () Bool)

(assert (=> b!1144133 (= e!650969 e!650979)))

(declare-fun res!762020 () Bool)

(assert (=> b!1144133 (=> res!762020 e!650979)))

(assert (=> b!1144133 (= res!762020 (not (= (select (arr!35793 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144133 e!650975))

(declare-fun c!112778 () Bool)

(assert (=> b!1144133 (= c!112778 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510019 () Unit!37471)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!509 (array!74297 array!74299 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37471)

(assert (=> b!1144133 (= lt!510019 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51636 () Bool)

(assert (=> bm!51636 (= call!51641 (+!3573 lt!510005 (ite (or c!112779 c!112781) (tuple2!18247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!51637 () Bool)

(declare-fun call!51639 () Bool)

(assert (=> bm!51637 (= call!51639 call!51635)))

(declare-fun bm!51638 () Bool)

(assert (=> bm!51638 (= call!51636 (getCurrentListMapNoExtraKeys!4633 lt!510011 lt!510014 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144134 () Bool)

(assert (=> b!1144134 (= e!650974 (and e!650970 mapRes!44873))))

(declare-fun condMapEmpty!44873 () Bool)

(declare-fun mapDefault!44873 () ValueCell!13640)

(assert (=> b!1144134 (= condMapEmpty!44873 (= (arr!35794 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13640)) mapDefault!44873)))))

(declare-fun b!1144135 () Bool)

(declare-fun Unit!37475 () Unit!37471)

(assert (=> b!1144135 (= e!650971 Unit!37475)))

(declare-fun b!1144136 () Bool)

(declare-fun res!762029 () Bool)

(assert (=> b!1144136 (=> (not res!762029) (not e!650968))))

(assert (=> b!1144136 (= res!762029 (and (= (size!36331 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36330 _keys!1208) (size!36331 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1144137 () Bool)

(assert (=> b!1144137 (= e!650973 tp_is_empty!28699)))

(declare-fun b!1144138 () Bool)

(declare-fun res!762027 () Bool)

(assert (=> b!1144138 (=> (not res!762027) (not e!650968))))

(assert (=> b!1144138 (= res!762027 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36330 _keys!1208))))))

(declare-fun b!1144139 () Bool)

(assert (=> b!1144139 (= c!112781 (and (not lt!510007) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144139 (= e!650981 e!650972)))

(declare-fun b!1144140 () Bool)

(declare-fun res!762032 () Bool)

(assert (=> b!1144140 (=> (not res!762032) (not e!650968))))

(assert (=> b!1144140 (= res!762032 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25000))))

(declare-fun b!1144141 () Bool)

(assert (=> b!1144141 (= e!650979 true)))

(declare-fun lt!509999 () V!43393)

(assert (=> b!1144141 (= (-!1257 (+!3573 lt!510005 (tuple2!18247 (select (arr!35793 _keys!1208) from!1455) lt!509999)) (select (arr!35793 _keys!1208) from!1455)) lt!510005)))

(declare-fun lt!510001 () Unit!37471)

(declare-fun addThenRemoveForNewKeyIsSame!114 (ListLongMap!16223 (_ BitVec 64) V!43393) Unit!37471)

(assert (=> b!1144141 (= lt!510001 (addThenRemoveForNewKeyIsSame!114 lt!510005 (select (arr!35793 _keys!1208) from!1455) lt!509999))))

(declare-fun get!18215 (ValueCell!13640 V!43393) V!43393)

(assert (=> b!1144141 (= lt!509999 (get!18215 (select (arr!35794 _values!996) from!1455) lt!510010))))

(declare-fun lt!510006 () Unit!37471)

(assert (=> b!1144141 (= lt!510006 e!650976)))

(declare-fun c!112780 () Bool)

(assert (=> b!1144141 (= c!112780 (contains!6672 lt!510005 k0!934))))

(assert (=> b!1144141 (= lt!510005 (getCurrentListMapNoExtraKeys!4633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144142 () Bool)

(assert (=> b!1144142 call!51639))

(declare-fun lt!510018 () Unit!37471)

(declare-fun call!51640 () Unit!37471)

(assert (=> b!1144142 (= lt!510018 call!51640)))

(assert (=> b!1144142 (= e!650971 lt!510018)))

(declare-fun b!1144143 () Bool)

(assert (=> b!1144143 (= e!650982 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510007) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144144 () Bool)

(declare-fun lt!510012 () Unit!37471)

(assert (=> b!1144144 (= e!650972 lt!510012)))

(assert (=> b!1144144 (= lt!510012 call!51640)))

(assert (=> b!1144144 call!51639))

(declare-fun bm!51639 () Bool)

(assert (=> bm!51639 (= call!51640 call!51637)))

(declare-fun b!1144145 () Bool)

(assert (=> b!1144145 (= e!650968 e!650977)))

(declare-fun res!762021 () Bool)

(assert (=> b!1144145 (=> (not res!762021) (not e!650977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74297 (_ BitVec 32)) Bool)

(assert (=> b!1144145 (= res!762021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510011 mask!1564))))

(assert (=> b!1144145 (= lt!510011 (array!74298 (store (arr!35793 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36330 _keys!1208)))))

(declare-fun b!1144146 () Bool)

(declare-fun res!762022 () Bool)

(assert (=> b!1144146 (=> (not res!762022) (not e!650968))))

(assert (=> b!1144146 (= res!762022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98800 res!762026) b!1144131))

(assert (= (and b!1144131 res!762025) b!1144136))

(assert (= (and b!1144136 res!762029) b!1144146))

(assert (= (and b!1144146 res!762022) b!1144140))

(assert (= (and b!1144140 res!762032) b!1144138))

(assert (= (and b!1144138 res!762027) b!1144124))

(assert (= (and b!1144124 res!762033) b!1144119))

(assert (= (and b!1144119 res!762023) b!1144145))

(assert (= (and b!1144145 res!762021) b!1144127))

(assert (= (and b!1144127 res!762030) b!1144121))

(assert (= (and b!1144121 (not res!762031)) b!1144130))

(assert (= (and b!1144130 (not res!762028)) b!1144133))

(assert (= (and b!1144133 c!112778) b!1144122))

(assert (= (and b!1144133 (not c!112778)) b!1144120))

(assert (= (or b!1144122 b!1144120) bm!51638))

(assert (= (or b!1144122 b!1144120) bm!51633))

(assert (= (and b!1144133 (not res!762020)) b!1144141))

(assert (= (and b!1144141 c!112780) b!1144125))

(assert (= (and b!1144141 (not c!112780)) b!1144129))

(assert (= (and b!1144125 c!112779) b!1144132))

(assert (= (and b!1144125 (not c!112779)) b!1144139))

(assert (= (and b!1144139 c!112781) b!1144144))

(assert (= (and b!1144139 (not c!112781)) b!1144126))

(assert (= (and b!1144126 c!112782) b!1144142))

(assert (= (and b!1144126 (not c!112782)) b!1144135))

(assert (= (or b!1144144 b!1144142) bm!51639))

(assert (= (or b!1144144 b!1144142) bm!51635))

(assert (= (or b!1144144 b!1144142) bm!51637))

(assert (= (or b!1144132 bm!51637) bm!51632))

(assert (= (or b!1144132 bm!51639) bm!51634))

(assert (= (or b!1144132 bm!51635) bm!51636))

(assert (= (and b!1144125 c!112777) b!1144118))

(assert (= (and b!1144125 (not c!112777)) b!1144143))

(assert (= (and b!1144125 res!762024) b!1144123))

(assert (= (and b!1144134 condMapEmpty!44873) mapIsEmpty!44873))

(assert (= (and b!1144134 (not condMapEmpty!44873)) mapNonEmpty!44873))

(get-info :version)

(assert (= (and mapNonEmpty!44873 ((_ is ValueCellFull!13640) mapValue!44873)) b!1144137))

(assert (= (and b!1144134 ((_ is ValueCellFull!13640) mapDefault!44873)) b!1144128))

(assert (= start!98800 b!1144134))

(declare-fun b_lambda!19269 () Bool)

(assert (=> (not b_lambda!19269) (not b!1144130)))

(declare-fun t!36154 () Bool)

(declare-fun tb!8973 () Bool)

(assert (=> (and start!98800 (= defaultEntry!1004 defaultEntry!1004) t!36154) tb!8973))

(declare-fun result!18519 () Bool)

(assert (=> tb!8973 (= result!18519 tp_is_empty!28699)))

(assert (=> b!1144130 t!36154))

(declare-fun b_and!39191 () Bool)

(assert (= b_and!39189 (and (=> t!36154 result!18519) b_and!39191)))

(declare-fun m!1055621 () Bool)

(assert (=> b!1144146 m!1055621))

(declare-fun m!1055623 () Bool)

(assert (=> b!1144131 m!1055623))

(declare-fun m!1055625 () Bool)

(assert (=> b!1144140 m!1055625))

(declare-fun m!1055627 () Bool)

(assert (=> b!1144121 m!1055627))

(declare-fun m!1055629 () Bool)

(assert (=> b!1144121 m!1055629))

(declare-fun m!1055631 () Bool)

(assert (=> b!1144130 m!1055631))

(declare-fun m!1055633 () Bool)

(assert (=> b!1144130 m!1055633))

(declare-fun m!1055635 () Bool)

(assert (=> b!1144130 m!1055635))

(declare-fun m!1055637 () Bool)

(assert (=> b!1144130 m!1055637))

(declare-fun m!1055639 () Bool)

(assert (=> b!1144133 m!1055639))

(declare-fun m!1055641 () Bool)

(assert (=> b!1144133 m!1055641))

(declare-fun m!1055643 () Bool)

(assert (=> mapNonEmpty!44873 m!1055643))

(declare-fun m!1055645 () Bool)

(assert (=> bm!51633 m!1055645))

(declare-fun m!1055647 () Bool)

(assert (=> b!1144132 m!1055647))

(assert (=> b!1144132 m!1055647))

(declare-fun m!1055649 () Bool)

(assert (=> b!1144132 m!1055649))

(declare-fun m!1055651 () Bool)

(assert (=> b!1144132 m!1055651))

(declare-fun m!1055653 () Bool)

(assert (=> b!1144122 m!1055653))

(declare-fun m!1055655 () Bool)

(assert (=> b!1144124 m!1055655))

(declare-fun m!1055657 () Bool)

(assert (=> b!1144145 m!1055657))

(declare-fun m!1055659 () Bool)

(assert (=> b!1144145 m!1055659))

(declare-fun m!1055661 () Bool)

(assert (=> start!98800 m!1055661))

(declare-fun m!1055663 () Bool)

(assert (=> start!98800 m!1055663))

(declare-fun m!1055665 () Bool)

(assert (=> b!1144123 m!1055665))

(declare-fun m!1055667 () Bool)

(assert (=> bm!51636 m!1055667))

(declare-fun m!1055669 () Bool)

(assert (=> bm!51632 m!1055669))

(declare-fun m!1055671 () Bool)

(assert (=> b!1144127 m!1055671))

(assert (=> b!1144118 m!1055665))

(declare-fun m!1055673 () Bool)

(assert (=> bm!51638 m!1055673))

(declare-fun m!1055675 () Bool)

(assert (=> b!1144119 m!1055675))

(declare-fun m!1055677 () Bool)

(assert (=> bm!51634 m!1055677))

(declare-fun m!1055679 () Bool)

(assert (=> b!1144141 m!1055679))

(declare-fun m!1055681 () Bool)

(assert (=> b!1144141 m!1055681))

(declare-fun m!1055683 () Bool)

(assert (=> b!1144141 m!1055683))

(assert (=> b!1144141 m!1055639))

(declare-fun m!1055685 () Bool)

(assert (=> b!1144141 m!1055685))

(assert (=> b!1144141 m!1055679))

(declare-fun m!1055687 () Bool)

(assert (=> b!1144141 m!1055687))

(assert (=> b!1144141 m!1055639))

(assert (=> b!1144141 m!1055645))

(assert (=> b!1144141 m!1055681))

(assert (=> b!1144141 m!1055639))

(declare-fun m!1055689 () Bool)

(assert (=> b!1144141 m!1055689))

(declare-fun m!1055691 () Bool)

(assert (=> b!1144125 m!1055691))

(declare-fun m!1055693 () Bool)

(assert (=> b!1144125 m!1055693))

(declare-fun m!1055695 () Bool)

(assert (=> b!1144125 m!1055695))

(declare-fun m!1055697 () Bool)

(assert (=> b!1144125 m!1055697))

(check-sat b_and!39191 (not b!1144141) (not b_lambda!19269) (not b!1144131) (not b!1144125) (not b!1144122) (not b_next!24169) (not b!1144130) (not start!98800) (not bm!51636) (not b!1144145) (not b!1144121) (not bm!51634) (not b!1144132) (not bm!51633) (not b!1144127) (not b!1144133) tp_is_empty!28699 (not mapNonEmpty!44873) (not b!1144140) (not bm!51632) (not b!1144123) (not bm!51638) (not b!1144124) (not b!1144146) (not b!1144118))
(check-sat b_and!39191 (not b_next!24169))
