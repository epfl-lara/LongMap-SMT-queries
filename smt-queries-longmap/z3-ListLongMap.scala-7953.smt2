; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98560 () Bool)

(assert start!98560)

(declare-fun b_free!24165 () Bool)

(declare-fun b_next!24165 () Bool)

(assert (=> start!98560 (= b_free!24165 (not b_next!24165))))

(declare-fun tp!85205 () Bool)

(declare-fun b_and!39179 () Bool)

(assert (=> start!98560 (= tp!85205 b_and!39179)))

(declare-datatypes ((V!43387 0))(
  ( (V!43388 (val!14404 Int)) )
))
(declare-fun zeroValue!944 () V!43387)

(declare-datatypes ((tuple2!18228 0))(
  ( (tuple2!18229 (_1!9125 (_ BitVec 64)) (_2!9125 V!43387)) )
))
(declare-datatypes ((List!24982 0))(
  ( (Nil!24979) (Cons!24978 (h!26187 tuple2!18228) (t!36139 List!24982)) )
))
(declare-datatypes ((ListLongMap!16197 0))(
  ( (ListLongMap!16198 (toList!8114 List!24982)) )
))
(declare-fun call!51529 () ListLongMap!16197)

(declare-fun c!112347 () Bool)

(declare-fun lt!509398 () ListLongMap!16197)

(declare-fun bm!51519 () Bool)

(declare-fun c!112348 () Bool)

(declare-fun minValue!944 () V!43387)

(declare-fun +!3544 (ListLongMap!16197 tuple2!18228) ListLongMap!16197)

(assert (=> bm!51519 (= call!51529 (+!3544 lt!509398 (ite (or c!112347 c!112348) (tuple2!18229 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18229 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1142651 () Bool)

(declare-fun res!761428 () Bool)

(declare-fun e!650054 () Bool)

(assert (=> b!1142651 (=> (not res!761428) (not e!650054))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142651 (= res!761428 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44867 () Bool)

(declare-fun mapRes!44867 () Bool)

(declare-fun tp!85206 () Bool)

(declare-fun e!650045 () Bool)

(assert (=> mapNonEmpty!44867 (= mapRes!44867 (and tp!85206 e!650045))))

(declare-datatypes ((ValueCell!13638 0))(
  ( (ValueCellFull!13638 (v!17041 V!43387)) (EmptyCell!13638) )
))
(declare-fun mapRest!44867 () (Array (_ BitVec 32) ValueCell!13638))

(declare-fun mapKey!44867 () (_ BitVec 32))

(declare-fun mapValue!44867 () ValueCell!13638)

(declare-datatypes ((array!74243 0))(
  ( (array!74244 (arr!35772 (Array (_ BitVec 32) ValueCell!13638)) (size!36308 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74243)

(assert (=> mapNonEmpty!44867 (= (arr!35772 _values!996) (store mapRest!44867 mapKey!44867 mapValue!44867))))

(declare-fun b!1142652 () Bool)

(declare-fun call!51525 () Bool)

(assert (=> b!1142652 call!51525))

(declare-datatypes ((Unit!37486 0))(
  ( (Unit!37487) )
))
(declare-fun lt!509405 () Unit!37486)

(declare-fun call!51527 () Unit!37486)

(assert (=> b!1142652 (= lt!509405 call!51527)))

(declare-fun e!650042 () Unit!37486)

(assert (=> b!1142652 (= e!650042 lt!509405)))

(declare-fun b!1142653 () Bool)

(declare-fun lt!509389 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142653 (= c!112348 (and (not lt!509389) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650044 () Unit!37486)

(declare-fun e!650052 () Unit!37486)

(assert (=> b!1142653 (= e!650044 e!650052)))

(declare-fun b!1142654 () Bool)

(declare-fun e!650055 () Bool)

(assert (=> b!1142654 (= e!650054 e!650055)))

(declare-fun res!761432 () Bool)

(assert (=> b!1142654 (=> (not res!761432) (not e!650055))))

(declare-datatypes ((array!74245 0))(
  ( (array!74246 (arr!35773 (Array (_ BitVec 32) (_ BitVec 64))) (size!36309 (_ BitVec 32))) )
))
(declare-fun lt!509409 () array!74245)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74245 (_ BitVec 32)) Bool)

(assert (=> b!1142654 (= res!761432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509409 mask!1564))))

(declare-fun _keys!1208 () array!74245)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142654 (= lt!509409 (array!74246 (store (arr!35773 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36309 _keys!1208)))))

(declare-fun bm!51520 () Bool)

(declare-fun call!51524 () Bool)

(assert (=> bm!51520 (= call!51525 call!51524)))

(declare-fun b!1142655 () Bool)

(declare-fun tp_is_empty!28695 () Bool)

(assert (=> b!1142655 (= e!650045 tp_is_empty!28695)))

(declare-fun b!1142656 () Bool)

(declare-fun e!650047 () Bool)

(declare-fun call!51526 () ListLongMap!16197)

(declare-fun call!51523 () ListLongMap!16197)

(assert (=> b!1142656 (= e!650047 (= call!51526 call!51523))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!51521 () Bool)

(declare-fun lt!509396 () array!74243)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4594 (array!74245 array!74243 (_ BitVec 32) (_ BitVec 32) V!43387 V!43387 (_ BitVec 32) Int) ListLongMap!16197)

(assert (=> bm!51521 (= call!51526 (getCurrentListMapNoExtraKeys!4594 lt!509409 lt!509396 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142657 () Bool)

(declare-fun res!761438 () Bool)

(assert (=> b!1142657 (=> (not res!761438) (not e!650054))))

(assert (=> b!1142657 (= res!761438 (and (= (size!36308 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36309 _keys!1208) (size!36308 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!509406 () ListLongMap!16197)

(declare-fun bm!51522 () Bool)

(declare-fun call!51522 () Unit!37486)

(declare-fun addStillContains!800 (ListLongMap!16197 (_ BitVec 64) V!43387 (_ BitVec 64)) Unit!37486)

(assert (=> bm!51522 (= call!51522 (addStillContains!800 (ite c!112347 lt!509406 lt!509398) (ite c!112347 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112348 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112347 minValue!944 (ite c!112348 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1142658 () Bool)

(declare-fun -!1262 (ListLongMap!16197 (_ BitVec 64)) ListLongMap!16197)

(assert (=> b!1142658 (= e!650047 (= call!51526 (-!1262 call!51523 k0!934)))))

(declare-fun b!1142659 () Bool)

(declare-fun lt!509402 () Unit!37486)

(assert (=> b!1142659 (= e!650052 lt!509402)))

(assert (=> b!1142659 (= lt!509402 call!51527)))

(assert (=> b!1142659 call!51525))

(declare-fun b!1142660 () Bool)

(declare-fun e!650046 () Bool)

(declare-fun arrayContainsKey!0 (array!74245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142660 (= e!650046 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142661 () Bool)

(declare-fun res!761440 () Bool)

(assert (=> b!1142661 (=> (not res!761440) (not e!650054))))

(declare-datatypes ((List!24983 0))(
  ( (Nil!24980) (Cons!24979 (h!26188 (_ BitVec 64)) (t!36140 List!24983)) )
))
(declare-fun arrayNoDuplicates!0 (array!74245 (_ BitVec 32) List!24983) Bool)

(assert (=> b!1142661 (= res!761440 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24980))))

(declare-fun b!1142662 () Bool)

(declare-fun e!650043 () Unit!37486)

(declare-fun Unit!37488 () Unit!37486)

(assert (=> b!1142662 (= e!650043 Unit!37488)))

(declare-fun b!1142663 () Bool)

(declare-fun res!761439 () Bool)

(assert (=> b!1142663 (=> (not res!761439) (not e!650054))))

(assert (=> b!1142663 (= res!761439 (= (select (arr!35773 _keys!1208) i!673) k0!934))))

(declare-fun b!1142664 () Bool)

(assert (=> b!1142664 (= e!650052 e!650042)))

(declare-fun c!112344 () Bool)

(assert (=> b!1142664 (= c!112344 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509389))))

(declare-fun bm!51523 () Bool)

(declare-fun call!51528 () ListLongMap!16197)

(assert (=> bm!51523 (= call!51528 call!51529)))

(declare-fun b!1142665 () Bool)

(declare-fun e!650048 () Bool)

(declare-fun e!650053 () Bool)

(assert (=> b!1142665 (= e!650048 e!650053)))

(declare-fun res!761430 () Bool)

(assert (=> b!1142665 (=> res!761430 e!650053)))

(assert (=> b!1142665 (= res!761430 (not (= (select (arr!35773 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142665 e!650047))

(declare-fun c!112345 () Bool)

(assert (=> b!1142665 (= c!112345 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509392 () Unit!37486)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!504 (array!74245 array!74243 (_ BitVec 32) (_ BitVec 32) V!43387 V!43387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37486)

(assert (=> b!1142665 (= lt!509392 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142666 () Bool)

(declare-fun e!650041 () Bool)

(declare-fun e!650049 () Bool)

(assert (=> b!1142666 (= e!650041 (and e!650049 mapRes!44867))))

(declare-fun condMapEmpty!44867 () Bool)

(declare-fun mapDefault!44867 () ValueCell!13638)

(assert (=> b!1142666 (= condMapEmpty!44867 (= (arr!35772 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13638)) mapDefault!44867)))))

(declare-fun b!1142667 () Bool)

(assert (=> b!1142667 (= e!650049 tp_is_empty!28695)))

(declare-fun e!650050 () Bool)

(declare-fun b!1142668 () Bool)

(assert (=> b!1142668 (= e!650050 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142669 () Bool)

(declare-fun contains!6647 (ListLongMap!16197 (_ BitVec 64)) Bool)

(assert (=> b!1142669 (contains!6647 (+!3544 lt!509406 (tuple2!18229 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509395 () Unit!37486)

(assert (=> b!1142669 (= lt!509395 call!51522)))

(assert (=> b!1142669 call!51524))

(assert (=> b!1142669 (= lt!509406 call!51529)))

(declare-fun lt!509397 () Unit!37486)

(assert (=> b!1142669 (= lt!509397 (addStillContains!800 lt!509398 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1142669 (= e!650044 lt!509395)))

(declare-fun b!1142670 () Bool)

(declare-fun res!761434 () Bool)

(assert (=> b!1142670 (=> (not res!761434) (not e!650054))))

(assert (=> b!1142670 (= res!761434 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36309 _keys!1208))))))

(declare-fun bm!51524 () Bool)

(assert (=> bm!51524 (= call!51523 (getCurrentListMapNoExtraKeys!4594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142671 () Bool)

(assert (=> b!1142671 (= e!650053 true)))

(declare-fun lt!509404 () V!43387)

(assert (=> b!1142671 (= (-!1262 (+!3544 lt!509398 (tuple2!18229 (select (arr!35773 _keys!1208) from!1455) lt!509404)) (select (arr!35773 _keys!1208) from!1455)) lt!509398)))

(declare-fun lt!509390 () Unit!37486)

(declare-fun addThenRemoveForNewKeyIsSame!114 (ListLongMap!16197 (_ BitVec 64) V!43387) Unit!37486)

(assert (=> b!1142671 (= lt!509390 (addThenRemoveForNewKeyIsSame!114 lt!509398 (select (arr!35773 _keys!1208) from!1455) lt!509404))))

(declare-fun lt!509403 () V!43387)

(declare-fun get!18182 (ValueCell!13638 V!43387) V!43387)

(assert (=> b!1142671 (= lt!509404 (get!18182 (select (arr!35772 _values!996) from!1455) lt!509403))))

(declare-fun lt!509400 () Unit!37486)

(assert (=> b!1142671 (= lt!509400 e!650043)))

(declare-fun c!112343 () Bool)

(assert (=> b!1142671 (= c!112343 (contains!6647 lt!509398 k0!934))))

(assert (=> b!1142671 (= lt!509398 (getCurrentListMapNoExtraKeys!4594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142672 () Bool)

(assert (=> b!1142672 (= e!650046 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509389) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!44867 () Bool)

(assert (=> mapIsEmpty!44867 mapRes!44867))

(declare-fun b!1142673 () Bool)

(declare-fun res!761435 () Bool)

(assert (=> b!1142673 (=> (not res!761435) (not e!650054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142673 (= res!761435 (validMask!0 mask!1564))))

(declare-fun b!1142674 () Bool)

(declare-fun e!650040 () Bool)

(assert (=> b!1142674 (= e!650040 e!650048)))

(declare-fun res!761429 () Bool)

(assert (=> b!1142674 (=> res!761429 e!650048)))

(assert (=> b!1142674 (= res!761429 (not (= from!1455 i!673)))))

(declare-fun lt!509394 () ListLongMap!16197)

(assert (=> b!1142674 (= lt!509394 (getCurrentListMapNoExtraKeys!4594 lt!509409 lt!509396 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142674 (= lt!509396 (array!74244 (store (arr!35772 _values!996) i!673 (ValueCellFull!13638 lt!509403)) (size!36308 _values!996)))))

(declare-fun dynLambda!2635 (Int (_ BitVec 64)) V!43387)

(assert (=> b!1142674 (= lt!509403 (dynLambda!2635 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509408 () ListLongMap!16197)

(assert (=> b!1142674 (= lt!509408 (getCurrentListMapNoExtraKeys!4594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!761437 () Bool)

(assert (=> start!98560 (=> (not res!761437) (not e!650054))))

(assert (=> start!98560 (= res!761437 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36309 _keys!1208))))))

(assert (=> start!98560 e!650054))

(assert (=> start!98560 tp_is_empty!28695))

(declare-fun array_inv!27414 (array!74245) Bool)

(assert (=> start!98560 (array_inv!27414 _keys!1208)))

(assert (=> start!98560 true))

(assert (=> start!98560 tp!85205))

(declare-fun array_inv!27415 (array!74243) Bool)

(assert (=> start!98560 (and (array_inv!27415 _values!996) e!650041)))

(declare-fun b!1142675 () Bool)

(declare-fun res!761441 () Bool)

(assert (=> b!1142675 (=> (not res!761441) (not e!650054))))

(assert (=> b!1142675 (= res!761441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142676 () Bool)

(declare-fun Unit!37489 () Unit!37486)

(assert (=> b!1142676 (= e!650042 Unit!37489)))

(declare-fun bm!51525 () Bool)

(assert (=> bm!51525 (= call!51527 call!51522)))

(declare-fun b!1142677 () Bool)

(declare-fun Unit!37490 () Unit!37486)

(assert (=> b!1142677 (= e!650043 Unit!37490)))

(assert (=> b!1142677 (= lt!509389 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142677 (= c!112347 (and (not lt!509389) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509393 () Unit!37486)

(assert (=> b!1142677 (= lt!509393 e!650044)))

(declare-fun lt!509391 () Unit!37486)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!396 (array!74245 array!74243 (_ BitVec 32) (_ BitVec 32) V!43387 V!43387 (_ BitVec 64) (_ BitVec 32) Int) Unit!37486)

(assert (=> b!1142677 (= lt!509391 (lemmaListMapContainsThenArrayContainsFrom!396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112346 () Bool)

(assert (=> b!1142677 (= c!112346 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761433 () Bool)

(assert (=> b!1142677 (= res!761433 e!650046)))

(assert (=> b!1142677 (=> (not res!761433) (not e!650050))))

(assert (=> b!1142677 e!650050))

(declare-fun lt!509401 () Unit!37486)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74245 (_ BitVec 32) (_ BitVec 32)) Unit!37486)

(assert (=> b!1142677 (= lt!509401 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142677 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24980)))

(declare-fun lt!509399 () Unit!37486)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74245 (_ BitVec 64) (_ BitVec 32) List!24983) Unit!37486)

(assert (=> b!1142677 (= lt!509399 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24980))))

(assert (=> b!1142677 false))

(declare-fun b!1142678 () Bool)

(declare-fun res!761431 () Bool)

(assert (=> b!1142678 (=> (not res!761431) (not e!650055))))

(assert (=> b!1142678 (= res!761431 (arrayNoDuplicates!0 lt!509409 #b00000000000000000000000000000000 Nil!24980))))

(declare-fun bm!51526 () Bool)

(assert (=> bm!51526 (= call!51524 (contains!6647 (ite c!112347 lt!509406 call!51528) k0!934))))

(declare-fun b!1142679 () Bool)

(assert (=> b!1142679 (= e!650055 (not e!650040))))

(declare-fun res!761436 () Bool)

(assert (=> b!1142679 (=> res!761436 e!650040)))

(assert (=> b!1142679 (= res!761436 (bvsgt from!1455 i!673))))

(assert (=> b!1142679 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509407 () Unit!37486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74245 (_ BitVec 64) (_ BitVec 32)) Unit!37486)

(assert (=> b!1142679 (= lt!509407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98560 res!761437) b!1142673))

(assert (= (and b!1142673 res!761435) b!1142657))

(assert (= (and b!1142657 res!761438) b!1142675))

(assert (= (and b!1142675 res!761441) b!1142661))

(assert (= (and b!1142661 res!761440) b!1142670))

(assert (= (and b!1142670 res!761434) b!1142651))

(assert (= (and b!1142651 res!761428) b!1142663))

(assert (= (and b!1142663 res!761439) b!1142654))

(assert (= (and b!1142654 res!761432) b!1142678))

(assert (= (and b!1142678 res!761431) b!1142679))

(assert (= (and b!1142679 (not res!761436)) b!1142674))

(assert (= (and b!1142674 (not res!761429)) b!1142665))

(assert (= (and b!1142665 c!112345) b!1142658))

(assert (= (and b!1142665 (not c!112345)) b!1142656))

(assert (= (or b!1142658 b!1142656) bm!51521))

(assert (= (or b!1142658 b!1142656) bm!51524))

(assert (= (and b!1142665 (not res!761430)) b!1142671))

(assert (= (and b!1142671 c!112343) b!1142677))

(assert (= (and b!1142671 (not c!112343)) b!1142662))

(assert (= (and b!1142677 c!112347) b!1142669))

(assert (= (and b!1142677 (not c!112347)) b!1142653))

(assert (= (and b!1142653 c!112348) b!1142659))

(assert (= (and b!1142653 (not c!112348)) b!1142664))

(assert (= (and b!1142664 c!112344) b!1142652))

(assert (= (and b!1142664 (not c!112344)) b!1142676))

(assert (= (or b!1142659 b!1142652) bm!51525))

(assert (= (or b!1142659 b!1142652) bm!51523))

(assert (= (or b!1142659 b!1142652) bm!51520))

(assert (= (or b!1142669 bm!51520) bm!51526))

(assert (= (or b!1142669 bm!51525) bm!51522))

(assert (= (or b!1142669 bm!51523) bm!51519))

(assert (= (and b!1142677 c!112346) b!1142660))

(assert (= (and b!1142677 (not c!112346)) b!1142672))

(assert (= (and b!1142677 res!761433) b!1142668))

(assert (= (and b!1142666 condMapEmpty!44867) mapIsEmpty!44867))

(assert (= (and b!1142666 (not condMapEmpty!44867)) mapNonEmpty!44867))

(get-info :version)

(assert (= (and mapNonEmpty!44867 ((_ is ValueCellFull!13638) mapValue!44867)) b!1142655))

(assert (= (and b!1142666 ((_ is ValueCellFull!13638) mapDefault!44867)) b!1142667))

(assert (= start!98560 b!1142666))

(declare-fun b_lambda!19271 () Bool)

(assert (=> (not b_lambda!19271) (not b!1142674)))

(declare-fun t!36138 () Bool)

(declare-fun tb!8977 () Bool)

(assert (=> (and start!98560 (= defaultEntry!1004 defaultEntry!1004) t!36138) tb!8977))

(declare-fun result!18519 () Bool)

(assert (=> tb!8977 (= result!18519 tp_is_empty!28695)))

(assert (=> b!1142674 t!36138))

(declare-fun b_and!39181 () Bool)

(assert (= b_and!39179 (and (=> t!36138 result!18519) b_and!39181)))

(declare-fun m!1053891 () Bool)

(assert (=> b!1142675 m!1053891))

(declare-fun m!1053893 () Bool)

(assert (=> b!1142677 m!1053893))

(declare-fun m!1053895 () Bool)

(assert (=> b!1142677 m!1053895))

(declare-fun m!1053897 () Bool)

(assert (=> b!1142677 m!1053897))

(declare-fun m!1053899 () Bool)

(assert (=> b!1142677 m!1053899))

(declare-fun m!1053901 () Bool)

(assert (=> b!1142663 m!1053901))

(declare-fun m!1053903 () Bool)

(assert (=> b!1142674 m!1053903))

(declare-fun m!1053905 () Bool)

(assert (=> b!1142674 m!1053905))

(declare-fun m!1053907 () Bool)

(assert (=> b!1142674 m!1053907))

(declare-fun m!1053909 () Bool)

(assert (=> b!1142674 m!1053909))

(declare-fun m!1053911 () Bool)

(assert (=> start!98560 m!1053911))

(declare-fun m!1053913 () Bool)

(assert (=> start!98560 m!1053913))

(declare-fun m!1053915 () Bool)

(assert (=> b!1142673 m!1053915))

(declare-fun m!1053917 () Bool)

(assert (=> b!1142654 m!1053917))

(declare-fun m!1053919 () Bool)

(assert (=> b!1142654 m!1053919))

(declare-fun m!1053921 () Bool)

(assert (=> b!1142660 m!1053921))

(declare-fun m!1053923 () Bool)

(assert (=> bm!51524 m!1053923))

(assert (=> b!1142668 m!1053921))

(declare-fun m!1053925 () Bool)

(assert (=> bm!51526 m!1053925))

(declare-fun m!1053927 () Bool)

(assert (=> b!1142669 m!1053927))

(assert (=> b!1142669 m!1053927))

(declare-fun m!1053929 () Bool)

(assert (=> b!1142669 m!1053929))

(declare-fun m!1053931 () Bool)

(assert (=> b!1142669 m!1053931))

(declare-fun m!1053933 () Bool)

(assert (=> b!1142679 m!1053933))

(declare-fun m!1053935 () Bool)

(assert (=> b!1142679 m!1053935))

(declare-fun m!1053937 () Bool)

(assert (=> bm!51521 m!1053937))

(declare-fun m!1053939 () Bool)

(assert (=> mapNonEmpty!44867 m!1053939))

(declare-fun m!1053941 () Bool)

(assert (=> bm!51522 m!1053941))

(declare-fun m!1053943 () Bool)

(assert (=> b!1142658 m!1053943))

(declare-fun m!1053945 () Bool)

(assert (=> bm!51519 m!1053945))

(declare-fun m!1053947 () Bool)

(assert (=> b!1142665 m!1053947))

(declare-fun m!1053949 () Bool)

(assert (=> b!1142665 m!1053949))

(declare-fun m!1053951 () Bool)

(assert (=> b!1142671 m!1053951))

(declare-fun m!1053953 () Bool)

(assert (=> b!1142671 m!1053953))

(assert (=> b!1142671 m!1053947))

(declare-fun m!1053955 () Bool)

(assert (=> b!1142671 m!1053955))

(declare-fun m!1053957 () Bool)

(assert (=> b!1142671 m!1053957))

(assert (=> b!1142671 m!1053947))

(declare-fun m!1053959 () Bool)

(assert (=> b!1142671 m!1053959))

(assert (=> b!1142671 m!1053953))

(assert (=> b!1142671 m!1053947))

(assert (=> b!1142671 m!1053951))

(declare-fun m!1053961 () Bool)

(assert (=> b!1142671 m!1053961))

(assert (=> b!1142671 m!1053923))

(declare-fun m!1053963 () Bool)

(assert (=> b!1142678 m!1053963))

(declare-fun m!1053965 () Bool)

(assert (=> b!1142651 m!1053965))

(declare-fun m!1053967 () Bool)

(assert (=> b!1142661 m!1053967))

(check-sat (not b!1142669) (not bm!51522) (not b_next!24165) (not b_lambda!19271) (not bm!51524) (not bm!51521) (not bm!51519) (not b!1142651) (not b!1142654) (not mapNonEmpty!44867) (not b!1142660) (not b!1142668) (not b!1142671) (not b!1142674) (not b!1142678) tp_is_empty!28695 (not b!1142665) (not b!1142677) (not b!1142675) (not b!1142658) (not b!1142679) (not bm!51526) (not b!1142661) (not b!1142673) (not start!98560) b_and!39181)
(check-sat b_and!39181 (not b_next!24165))
