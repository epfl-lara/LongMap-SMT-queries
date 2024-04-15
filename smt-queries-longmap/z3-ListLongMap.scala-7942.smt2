; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98486 () Bool)

(assert start!98486)

(declare-fun b_free!24097 () Bool)

(declare-fun b_next!24097 () Bool)

(assert (=> start!98486 (= b_free!24097 (not b_next!24097))))

(declare-fun tp!85001 () Bool)

(declare-fun b_and!39021 () Bool)

(assert (=> start!98486 (= tp!85001 b_and!39021)))

(declare-fun b!1139501 () Bool)

(declare-fun e!648332 () Bool)

(declare-fun e!648339 () Bool)

(assert (=> b!1139501 (= e!648332 (not e!648339))))

(declare-fun res!759946 () Bool)

(assert (=> b!1139501 (=> res!759946 e!648339)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139501 (= res!759946 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74036 0))(
  ( (array!74037 (arr!35669 (Array (_ BitVec 32) (_ BitVec 64))) (size!36207 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74036)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139501 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37208 0))(
  ( (Unit!37209) )
))
(declare-fun lt!507057 () Unit!37208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74036 (_ BitVec 64) (_ BitVec 32)) Unit!37208)

(assert (=> b!1139501 (= lt!507057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139502 () Bool)

(declare-fun res!759943 () Bool)

(declare-fun e!648330 () Bool)

(assert (=> b!1139502 (=> (not res!759943) (not e!648330))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74036 (_ BitVec 32)) Bool)

(assert (=> b!1139502 (= res!759943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!759940 () Bool)

(assert (=> start!98486 (=> (not res!759940) (not e!648330))))

(assert (=> start!98486 (= res!759940 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36207 _keys!1208))))))

(assert (=> start!98486 e!648330))

(declare-fun tp_is_empty!28627 () Bool)

(assert (=> start!98486 tp_is_empty!28627))

(declare-fun array_inv!27412 (array!74036) Bool)

(assert (=> start!98486 (array_inv!27412 _keys!1208)))

(assert (=> start!98486 true))

(assert (=> start!98486 tp!85001))

(declare-datatypes ((V!43297 0))(
  ( (V!43298 (val!14370 Int)) )
))
(declare-datatypes ((ValueCell!13604 0))(
  ( (ValueCellFull!13604 (v!17006 V!43297)) (EmptyCell!13604) )
))
(declare-datatypes ((array!74038 0))(
  ( (array!74039 (arr!35670 (Array (_ BitVec 32) ValueCell!13604)) (size!36208 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74038)

(declare-fun e!648331 () Bool)

(declare-fun array_inv!27413 (array!74038) Bool)

(assert (=> start!98486 (and (array_inv!27413 _values!996) e!648331)))

(declare-fun b!1139503 () Bool)

(declare-fun e!648344 () Bool)

(assert (=> b!1139503 (= e!648344 true)))

(declare-datatypes ((tuple2!18254 0))(
  ( (tuple2!18255 (_1!9138 (_ BitVec 64)) (_2!9138 V!43297)) )
))
(declare-datatypes ((List!24993 0))(
  ( (Nil!24990) (Cons!24989 (h!26198 tuple2!18254) (t!36073 List!24993)) )
))
(declare-datatypes ((ListLongMap!16223 0))(
  ( (ListLongMap!16224 (toList!8127 List!24993)) )
))
(declare-fun lt!507068 () ListLongMap!16223)

(declare-fun lt!507058 () V!43297)

(declare-fun -!1215 (ListLongMap!16223 (_ BitVec 64)) ListLongMap!16223)

(declare-fun +!3554 (ListLongMap!16223 tuple2!18254) ListLongMap!16223)

(assert (=> b!1139503 (= (-!1215 (+!3554 lt!507068 (tuple2!18255 (select (arr!35669 _keys!1208) from!1455) lt!507058)) (select (arr!35669 _keys!1208) from!1455)) lt!507068)))

(declare-fun lt!507063 () Unit!37208)

(declare-fun addThenRemoveForNewKeyIsSame!83 (ListLongMap!16223 (_ BitVec 64) V!43297) Unit!37208)

(assert (=> b!1139503 (= lt!507063 (addThenRemoveForNewKeyIsSame!83 lt!507068 (select (arr!35669 _keys!1208) from!1455) lt!507058))))

(declare-fun lt!507061 () V!43297)

(declare-fun get!18129 (ValueCell!13604 V!43297) V!43297)

(assert (=> b!1139503 (= lt!507058 (get!18129 (select (arr!35670 _values!996) from!1455) lt!507061))))

(declare-fun lt!507056 () Unit!37208)

(declare-fun e!648345 () Unit!37208)

(assert (=> b!1139503 (= lt!507056 e!648345)))

(declare-fun c!111710 () Bool)

(declare-fun contains!6599 (ListLongMap!16223 (_ BitVec 64)) Bool)

(assert (=> b!1139503 (= c!111710 (contains!6599 lt!507068 k0!934))))

(declare-fun zeroValue!944 () V!43297)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43297)

(declare-fun getCurrentListMapNoExtraKeys!4622 (array!74036 array!74038 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 32) Int) ListLongMap!16223)

(assert (=> b!1139503 (= lt!507068 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139504 () Bool)

(declare-fun e!648336 () Bool)

(assert (=> b!1139504 (= e!648336 tp_is_empty!28627)))

(declare-fun bm!50680 () Bool)

(declare-fun call!50683 () Bool)

(declare-fun call!50685 () Bool)

(assert (=> bm!50680 (= call!50683 call!50685)))

(declare-fun c!111709 () Bool)

(declare-fun c!111706 () Bool)

(declare-fun call!50688 () ListLongMap!16223)

(declare-fun bm!50681 () Bool)

(assert (=> bm!50681 (= call!50688 (+!3554 lt!507068 (ite (or c!111709 c!111706) (tuple2!18255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!507065 () array!74036)

(declare-fun lt!507064 () array!74038)

(declare-fun bm!50682 () Bool)

(declare-fun call!50689 () ListLongMap!16223)

(assert (=> bm!50682 (= call!50689 (getCurrentListMapNoExtraKeys!4622 lt!507065 lt!507064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139505 () Bool)

(declare-fun lt!507075 () ListLongMap!16223)

(assert (=> b!1139505 (contains!6599 (+!3554 lt!507075 (tuple2!18255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!507059 () Unit!37208)

(declare-fun addStillContains!771 (ListLongMap!16223 (_ BitVec 64) V!43297 (_ BitVec 64)) Unit!37208)

(assert (=> b!1139505 (= lt!507059 (addStillContains!771 lt!507075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1139505 call!50685))

(assert (=> b!1139505 (= lt!507075 call!50688)))

(declare-fun lt!507067 () Unit!37208)

(declare-fun call!50687 () Unit!37208)

(assert (=> b!1139505 (= lt!507067 call!50687)))

(declare-fun e!648342 () Unit!37208)

(assert (=> b!1139505 (= e!648342 lt!507059)))

(declare-fun e!648341 () Bool)

(declare-fun b!1139506 () Bool)

(assert (=> b!1139506 (= e!648341 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139507 () Bool)

(declare-fun res!759944 () Bool)

(assert (=> b!1139507 (=> (not res!759944) (not e!648330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139507 (= res!759944 (validMask!0 mask!1564))))

(declare-fun b!1139508 () Bool)

(declare-fun res!759942 () Bool)

(assert (=> b!1139508 (=> (not res!759942) (not e!648330))))

(assert (=> b!1139508 (= res!759942 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36207 _keys!1208))))))

(declare-fun b!1139509 () Bool)

(declare-fun e!648340 () Bool)

(assert (=> b!1139509 (= e!648340 e!648344)))

(declare-fun res!759934 () Bool)

(assert (=> b!1139509 (=> res!759934 e!648344)))

(assert (=> b!1139509 (= res!759934 (not (= (select (arr!35669 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648334 () Bool)

(assert (=> b!1139509 e!648334))

(declare-fun c!111705 () Bool)

(assert (=> b!1139509 (= c!111705 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507073 () Unit!37208)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!498 (array!74036 array!74038 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37208)

(assert (=> b!1139509 (= lt!507073 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50683 () Bool)

(assert (=> bm!50683 (= call!50687 (addStillContains!771 lt!507068 (ite (or c!111709 c!111706) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111709 c!111706) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1139510 () Bool)

(assert (=> b!1139510 (= e!648330 e!648332)))

(declare-fun res!759936 () Bool)

(assert (=> b!1139510 (=> (not res!759936) (not e!648332))))

(assert (=> b!1139510 (= res!759936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507065 mask!1564))))

(assert (=> b!1139510 (= lt!507065 (array!74037 (store (arr!35669 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36207 _keys!1208)))))

(declare-fun b!1139511 () Bool)

(declare-fun res!759938 () Bool)

(assert (=> b!1139511 (=> (not res!759938) (not e!648330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139511 (= res!759938 (validKeyInArray!0 k0!934))))

(declare-fun b!1139512 () Bool)

(declare-fun call!50684 () ListLongMap!16223)

(assert (=> b!1139512 (= e!648334 (= call!50689 call!50684))))

(declare-fun bm!50684 () Bool)

(declare-fun call!50686 () ListLongMap!16223)

(assert (=> bm!50684 (= call!50686 call!50688)))

(declare-fun b!1139513 () Bool)

(declare-fun e!648333 () Unit!37208)

(declare-fun lt!507070 () Unit!37208)

(assert (=> b!1139513 (= e!648333 lt!507070)))

(declare-fun call!50690 () Unit!37208)

(assert (=> b!1139513 (= lt!507070 call!50690)))

(assert (=> b!1139513 call!50683))

(declare-fun b!1139514 () Bool)

(declare-fun res!759947 () Bool)

(assert (=> b!1139514 (=> (not res!759947) (not e!648330))))

(assert (=> b!1139514 (= res!759947 (and (= (size!36208 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36207 _keys!1208) (size!36208 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139515 () Bool)

(declare-fun res!759941 () Bool)

(assert (=> b!1139515 (=> (not res!759941) (not e!648330))))

(declare-datatypes ((List!24994 0))(
  ( (Nil!24991) (Cons!24990 (h!26199 (_ BitVec 64)) (t!36074 List!24994)) )
))
(declare-fun arrayNoDuplicates!0 (array!74036 (_ BitVec 32) List!24994) Bool)

(assert (=> b!1139515 (= res!759941 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24991))))

(declare-fun b!1139516 () Bool)

(declare-fun res!759939 () Bool)

(assert (=> b!1139516 (=> (not res!759939) (not e!648330))))

(assert (=> b!1139516 (= res!759939 (= (select (arr!35669 _keys!1208) i!673) k0!934))))

(declare-fun e!648338 () Bool)

(declare-fun b!1139517 () Bool)

(assert (=> b!1139517 (= e!648338 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139518 () Bool)

(declare-fun e!648337 () Bool)

(assert (=> b!1139518 (= e!648337 tp_is_empty!28627)))

(declare-fun b!1139519 () Bool)

(declare-fun Unit!37210 () Unit!37208)

(assert (=> b!1139519 (= e!648345 Unit!37210)))

(declare-fun lt!507062 () Bool)

(declare-fun b!1139520 () Bool)

(assert (=> b!1139520 (= e!648341 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507062) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139521 () Bool)

(declare-fun e!648343 () Unit!37208)

(declare-fun Unit!37211 () Unit!37208)

(assert (=> b!1139521 (= e!648343 Unit!37211)))

(declare-fun b!1139522 () Bool)

(assert (=> b!1139522 call!50683))

(declare-fun lt!507072 () Unit!37208)

(assert (=> b!1139522 (= lt!507072 call!50690)))

(assert (=> b!1139522 (= e!648343 lt!507072)))

(declare-fun b!1139523 () Bool)

(declare-fun res!759945 () Bool)

(assert (=> b!1139523 (=> (not res!759945) (not e!648332))))

(assert (=> b!1139523 (= res!759945 (arrayNoDuplicates!0 lt!507065 #b00000000000000000000000000000000 Nil!24991))))

(declare-fun mapNonEmpty!44765 () Bool)

(declare-fun mapRes!44765 () Bool)

(declare-fun tp!85002 () Bool)

(assert (=> mapNonEmpty!44765 (= mapRes!44765 (and tp!85002 e!648336))))

(declare-fun mapRest!44765 () (Array (_ BitVec 32) ValueCell!13604))

(declare-fun mapValue!44765 () ValueCell!13604)

(declare-fun mapKey!44765 () (_ BitVec 32))

(assert (=> mapNonEmpty!44765 (= (arr!35670 _values!996) (store mapRest!44765 mapKey!44765 mapValue!44765))))

(declare-fun bm!50685 () Bool)

(assert (=> bm!50685 (= call!50685 (contains!6599 (ite c!111709 lt!507075 call!50686) k0!934))))

(declare-fun b!1139524 () Bool)

(assert (=> b!1139524 (= e!648333 e!648343)))

(declare-fun c!111707 () Bool)

(assert (=> b!1139524 (= c!111707 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507062))))

(declare-fun b!1139525 () Bool)

(assert (=> b!1139525 (= e!648339 e!648340)))

(declare-fun res!759937 () Bool)

(assert (=> b!1139525 (=> res!759937 e!648340)))

(assert (=> b!1139525 (= res!759937 (not (= from!1455 i!673)))))

(declare-fun lt!507060 () ListLongMap!16223)

(assert (=> b!1139525 (= lt!507060 (getCurrentListMapNoExtraKeys!4622 lt!507065 lt!507064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1139525 (= lt!507064 (array!74039 (store (arr!35670 _values!996) i!673 (ValueCellFull!13604 lt!507061)) (size!36208 _values!996)))))

(declare-fun dynLambda!2608 (Int (_ BitVec 64)) V!43297)

(assert (=> b!1139525 (= lt!507061 (dynLambda!2608 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507069 () ListLongMap!16223)

(assert (=> b!1139525 (= lt!507069 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139526 () Bool)

(assert (=> b!1139526 (= c!111706 (and (not lt!507062) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139526 (= e!648342 e!648333)))

(declare-fun b!1139527 () Bool)

(assert (=> b!1139527 (= e!648334 (= call!50689 (-!1215 call!50684 k0!934)))))

(declare-fun mapIsEmpty!44765 () Bool)

(assert (=> mapIsEmpty!44765 mapRes!44765))

(declare-fun bm!50686 () Bool)

(assert (=> bm!50686 (= call!50690 call!50687)))

(declare-fun b!1139528 () Bool)

(declare-fun Unit!37212 () Unit!37208)

(assert (=> b!1139528 (= e!648345 Unit!37212)))

(assert (=> b!1139528 (= lt!507062 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139528 (= c!111709 (and (not lt!507062) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507074 () Unit!37208)

(assert (=> b!1139528 (= lt!507074 e!648342)))

(declare-fun lt!507071 () Unit!37208)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!373 (array!74036 array!74038 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 64) (_ BitVec 32) Int) Unit!37208)

(assert (=> b!1139528 (= lt!507071 (lemmaListMapContainsThenArrayContainsFrom!373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111708 () Bool)

(assert (=> b!1139528 (= c!111708 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759935 () Bool)

(assert (=> b!1139528 (= res!759935 e!648341)))

(assert (=> b!1139528 (=> (not res!759935) (not e!648338))))

(assert (=> b!1139528 e!648338))

(declare-fun lt!507066 () Unit!37208)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74036 (_ BitVec 32) (_ BitVec 32)) Unit!37208)

(assert (=> b!1139528 (= lt!507066 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139528 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24991)))

(declare-fun lt!507055 () Unit!37208)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74036 (_ BitVec 64) (_ BitVec 32) List!24994) Unit!37208)

(assert (=> b!1139528 (= lt!507055 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24991))))

(assert (=> b!1139528 false))

(declare-fun b!1139529 () Bool)

(assert (=> b!1139529 (= e!648331 (and e!648337 mapRes!44765))))

(declare-fun condMapEmpty!44765 () Bool)

(declare-fun mapDefault!44765 () ValueCell!13604)

(assert (=> b!1139529 (= condMapEmpty!44765 (= (arr!35670 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13604)) mapDefault!44765)))))

(declare-fun bm!50687 () Bool)

(assert (=> bm!50687 (= call!50684 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98486 res!759940) b!1139507))

(assert (= (and b!1139507 res!759944) b!1139514))

(assert (= (and b!1139514 res!759947) b!1139502))

(assert (= (and b!1139502 res!759943) b!1139515))

(assert (= (and b!1139515 res!759941) b!1139508))

(assert (= (and b!1139508 res!759942) b!1139511))

(assert (= (and b!1139511 res!759938) b!1139516))

(assert (= (and b!1139516 res!759939) b!1139510))

(assert (= (and b!1139510 res!759936) b!1139523))

(assert (= (and b!1139523 res!759945) b!1139501))

(assert (= (and b!1139501 (not res!759946)) b!1139525))

(assert (= (and b!1139525 (not res!759937)) b!1139509))

(assert (= (and b!1139509 c!111705) b!1139527))

(assert (= (and b!1139509 (not c!111705)) b!1139512))

(assert (= (or b!1139527 b!1139512) bm!50682))

(assert (= (or b!1139527 b!1139512) bm!50687))

(assert (= (and b!1139509 (not res!759934)) b!1139503))

(assert (= (and b!1139503 c!111710) b!1139528))

(assert (= (and b!1139503 (not c!111710)) b!1139519))

(assert (= (and b!1139528 c!111709) b!1139505))

(assert (= (and b!1139528 (not c!111709)) b!1139526))

(assert (= (and b!1139526 c!111706) b!1139513))

(assert (= (and b!1139526 (not c!111706)) b!1139524))

(assert (= (and b!1139524 c!111707) b!1139522))

(assert (= (and b!1139524 (not c!111707)) b!1139521))

(assert (= (or b!1139513 b!1139522) bm!50686))

(assert (= (or b!1139513 b!1139522) bm!50684))

(assert (= (or b!1139513 b!1139522) bm!50680))

(assert (= (or b!1139505 bm!50680) bm!50685))

(assert (= (or b!1139505 bm!50686) bm!50683))

(assert (= (or b!1139505 bm!50684) bm!50681))

(assert (= (and b!1139528 c!111708) b!1139506))

(assert (= (and b!1139528 (not c!111708)) b!1139520))

(assert (= (and b!1139528 res!759935) b!1139517))

(assert (= (and b!1139529 condMapEmpty!44765) mapIsEmpty!44765))

(assert (= (and b!1139529 (not condMapEmpty!44765)) mapNonEmpty!44765))

(get-info :version)

(assert (= (and mapNonEmpty!44765 ((_ is ValueCellFull!13604) mapValue!44765)) b!1139504))

(assert (= (and b!1139529 ((_ is ValueCellFull!13604) mapDefault!44765)) b!1139518))

(assert (= start!98486 b!1139529))

(declare-fun b_lambda!19185 () Bool)

(assert (=> (not b_lambda!19185) (not b!1139525)))

(declare-fun t!36072 () Bool)

(declare-fun tb!8901 () Bool)

(assert (=> (and start!98486 (= defaultEntry!1004 defaultEntry!1004) t!36072) tb!8901))

(declare-fun result!18375 () Bool)

(assert (=> tb!8901 (= result!18375 tp_is_empty!28627)))

(assert (=> b!1139525 t!36072))

(declare-fun b_and!39023 () Bool)

(assert (= b_and!39021 (and (=> t!36072 result!18375) b_and!39023)))

(declare-fun m!1050635 () Bool)

(assert (=> b!1139501 m!1050635))

(declare-fun m!1050637 () Bool)

(assert (=> b!1139501 m!1050637))

(declare-fun m!1050639 () Bool)

(assert (=> bm!50687 m!1050639))

(declare-fun m!1050641 () Bool)

(assert (=> b!1139506 m!1050641))

(declare-fun m!1050643 () Bool)

(assert (=> b!1139509 m!1050643))

(declare-fun m!1050645 () Bool)

(assert (=> b!1139509 m!1050645))

(assert (=> b!1139517 m!1050641))

(declare-fun m!1050647 () Bool)

(assert (=> mapNonEmpty!44765 m!1050647))

(declare-fun m!1050649 () Bool)

(assert (=> b!1139507 m!1050649))

(declare-fun m!1050651 () Bool)

(assert (=> b!1139515 m!1050651))

(declare-fun m!1050653 () Bool)

(assert (=> start!98486 m!1050653))

(declare-fun m!1050655 () Bool)

(assert (=> start!98486 m!1050655))

(declare-fun m!1050657 () Bool)

(assert (=> b!1139516 m!1050657))

(assert (=> b!1139503 m!1050639))

(declare-fun m!1050659 () Bool)

(assert (=> b!1139503 m!1050659))

(assert (=> b!1139503 m!1050659))

(declare-fun m!1050661 () Bool)

(assert (=> b!1139503 m!1050661))

(declare-fun m!1050663 () Bool)

(assert (=> b!1139503 m!1050663))

(declare-fun m!1050665 () Bool)

(assert (=> b!1139503 m!1050665))

(assert (=> b!1139503 m!1050663))

(assert (=> b!1139503 m!1050643))

(declare-fun m!1050667 () Bool)

(assert (=> b!1139503 m!1050667))

(assert (=> b!1139503 m!1050643))

(declare-fun m!1050669 () Bool)

(assert (=> b!1139503 m!1050669))

(assert (=> b!1139503 m!1050643))

(declare-fun m!1050671 () Bool)

(assert (=> b!1139527 m!1050671))

(declare-fun m!1050673 () Bool)

(assert (=> b!1139525 m!1050673))

(declare-fun m!1050675 () Bool)

(assert (=> b!1139525 m!1050675))

(declare-fun m!1050677 () Bool)

(assert (=> b!1139525 m!1050677))

(declare-fun m!1050679 () Bool)

(assert (=> b!1139525 m!1050679))

(declare-fun m!1050681 () Bool)

(assert (=> bm!50681 m!1050681))

(declare-fun m!1050683 () Bool)

(assert (=> b!1139511 m!1050683))

(declare-fun m!1050685 () Bool)

(assert (=> b!1139528 m!1050685))

(declare-fun m!1050687 () Bool)

(assert (=> b!1139528 m!1050687))

(declare-fun m!1050689 () Bool)

(assert (=> b!1139528 m!1050689))

(declare-fun m!1050691 () Bool)

(assert (=> b!1139528 m!1050691))

(declare-fun m!1050693 () Bool)

(assert (=> b!1139510 m!1050693))

(declare-fun m!1050695 () Bool)

(assert (=> b!1139510 m!1050695))

(declare-fun m!1050697 () Bool)

(assert (=> b!1139502 m!1050697))

(declare-fun m!1050699 () Bool)

(assert (=> b!1139505 m!1050699))

(assert (=> b!1139505 m!1050699))

(declare-fun m!1050701 () Bool)

(assert (=> b!1139505 m!1050701))

(declare-fun m!1050703 () Bool)

(assert (=> b!1139505 m!1050703))

(declare-fun m!1050705 () Bool)

(assert (=> b!1139523 m!1050705))

(declare-fun m!1050707 () Bool)

(assert (=> bm!50682 m!1050707))

(declare-fun m!1050709 () Bool)

(assert (=> bm!50685 m!1050709))

(declare-fun m!1050711 () Bool)

(assert (=> bm!50683 m!1050711))

(check-sat (not b!1139511) (not b!1139505) (not b!1139523) (not bm!50687) (not bm!50683) b_and!39023 (not b!1139528) (not mapNonEmpty!44765) tp_is_empty!28627 (not b!1139510) (not b!1139506) (not b!1139515) (not b!1139509) (not b_lambda!19185) (not b!1139517) (not bm!50682) (not b!1139503) (not start!98486) (not b!1139527) (not b_next!24097) (not bm!50685) (not b!1139525) (not b!1139507) (not b!1139502) (not b!1139501) (not bm!50681))
(check-sat b_and!39023 (not b_next!24097))
