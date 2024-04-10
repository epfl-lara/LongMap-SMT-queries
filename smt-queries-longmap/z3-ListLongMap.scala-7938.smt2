; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98470 () Bool)

(assert start!98470)

(declare-fun b_free!24075 () Bool)

(declare-fun b_next!24075 () Bool)

(assert (=> start!98470 (= b_free!24075 (not b_next!24075))))

(declare-fun tp!84936 () Bool)

(declare-fun b_and!38999 () Bool)

(assert (=> start!98470 (= tp!84936 b_and!38999)))

(declare-fun b!1138646 () Bool)

(declare-datatypes ((Unit!37306 0))(
  ( (Unit!37307) )
))
(declare-fun e!647881 () Unit!37306)

(declare-fun Unit!37308 () Unit!37306)

(assert (=> b!1138646 (= e!647881 Unit!37308)))

(declare-fun lt!506628 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1138646 (= lt!506628 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111533 () Bool)

(assert (=> b!1138646 (= c!111533 (and (not lt!506628) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506624 () Unit!37306)

(declare-fun e!647893 () Unit!37306)

(assert (=> b!1138646 (= lt!506624 e!647893)))

(declare-datatypes ((V!43267 0))(
  ( (V!43268 (val!14359 Int)) )
))
(declare-fun zeroValue!944 () V!43267)

(declare-datatypes ((array!74069 0))(
  ( (array!74070 (arr!35685 (Array (_ BitVec 32) (_ BitVec 64))) (size!36221 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74069)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13593 0))(
  ( (ValueCellFull!13593 (v!16996 V!43267)) (EmptyCell!13593) )
))
(declare-datatypes ((array!74071 0))(
  ( (array!74072 (arr!35686 (Array (_ BitVec 32) ValueCell!13593)) (size!36222 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74071)

(declare-fun minValue!944 () V!43267)

(declare-fun lt!506621 () Unit!37306)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!366 (array!74069 array!74071 (_ BitVec 32) (_ BitVec 32) V!43267 V!43267 (_ BitVec 64) (_ BitVec 32) Int) Unit!37306)

(assert (=> b!1138646 (= lt!506621 (lemmaListMapContainsThenArrayContainsFrom!366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111535 () Bool)

(assert (=> b!1138646 (= c!111535 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759542 () Bool)

(declare-fun e!647889 () Bool)

(assert (=> b!1138646 (= res!759542 e!647889)))

(declare-fun e!647892 () Bool)

(assert (=> b!1138646 (=> (not res!759542) (not e!647892))))

(assert (=> b!1138646 e!647892))

(declare-fun lt!506626 () Unit!37306)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74069 (_ BitVec 32) (_ BitVec 32)) Unit!37306)

(assert (=> b!1138646 (= lt!506626 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24900 0))(
  ( (Nil!24897) (Cons!24896 (h!26105 (_ BitVec 64)) (t!35967 List!24900)) )
))
(declare-fun arrayNoDuplicates!0 (array!74069 (_ BitVec 32) List!24900) Bool)

(assert (=> b!1138646 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24897)))

(declare-fun lt!506618 () Unit!37306)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74069 (_ BitVec 64) (_ BitVec 32) List!24900) Unit!37306)

(assert (=> b!1138646 (= lt!506618 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24897))))

(assert (=> b!1138646 false))

(declare-fun b!1138647 () Bool)

(declare-fun res!759541 () Bool)

(declare-fun e!647895 () Bool)

(assert (=> b!1138647 (=> (not res!759541) (not e!647895))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138647 (= res!759541 (= (select (arr!35685 _keys!1208) i!673) k0!934))))

(declare-fun b!1138649 () Bool)

(assert (=> b!1138649 (= e!647889 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506628) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!50444 () Unit!37306)

(declare-fun bm!50439 () Bool)

(declare-fun c!111534 () Bool)

(declare-datatypes ((tuple2!18144 0))(
  ( (tuple2!18145 (_1!9083 (_ BitVec 64)) (_2!9083 V!43267)) )
))
(declare-datatypes ((List!24901 0))(
  ( (Nil!24898) (Cons!24897 (h!26106 tuple2!18144) (t!35968 List!24901)) )
))
(declare-datatypes ((ListLongMap!16113 0))(
  ( (ListLongMap!16114 (toList!8072 List!24901)) )
))
(declare-fun lt!506615 () ListLongMap!16113)

(declare-fun addStillContains!764 (ListLongMap!16113 (_ BitVec 64) V!43267 (_ BitVec 64)) Unit!37306)

(assert (=> bm!50439 (= call!50444 (addStillContains!764 lt!506615 (ite (or c!111533 c!111534) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111533 c!111534) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1138650 () Bool)

(declare-fun e!647888 () Bool)

(declare-fun tp_is_empty!28605 () Bool)

(assert (=> b!1138650 (= e!647888 tp_is_empty!28605)))

(declare-fun b!1138651 () Bool)

(declare-fun e!647891 () Bool)

(assert (=> b!1138651 (= e!647891 true)))

(declare-fun lt!506611 () Unit!37306)

(assert (=> b!1138651 (= lt!506611 e!647881)))

(declare-fun c!111536 () Bool)

(declare-fun contains!6608 (ListLongMap!16113 (_ BitVec 64)) Bool)

(assert (=> b!1138651 (= c!111536 (contains!6608 lt!506615 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4556 (array!74069 array!74071 (_ BitVec 32) (_ BitVec 32) V!43267 V!43267 (_ BitVec 32) Int) ListLongMap!16113)

(assert (=> b!1138651 (= lt!506615 (getCurrentListMapNoExtraKeys!4556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138652 () Bool)

(declare-fun call!50443 () Bool)

(assert (=> b!1138652 call!50443))

(declare-fun lt!506623 () Unit!37306)

(declare-fun call!50445 () Unit!37306)

(assert (=> b!1138652 (= lt!506623 call!50445)))

(declare-fun e!647883 () Unit!37306)

(assert (=> b!1138652 (= e!647883 lt!506623)))

(declare-fun b!1138653 () Bool)

(declare-fun e!647884 () Bool)

(assert (=> b!1138653 (= e!647895 e!647884)))

(declare-fun res!759551 () Bool)

(assert (=> b!1138653 (=> (not res!759551) (not e!647884))))

(declare-fun lt!506613 () array!74069)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74069 (_ BitVec 32)) Bool)

(assert (=> b!1138653 (= res!759551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506613 mask!1564))))

(assert (=> b!1138653 (= lt!506613 (array!74070 (store (arr!35685 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36221 _keys!1208)))))

(declare-fun b!1138654 () Bool)

(declare-fun e!647894 () Bool)

(declare-fun e!647890 () Bool)

(assert (=> b!1138654 (= e!647894 e!647890)))

(declare-fun res!759538 () Bool)

(assert (=> b!1138654 (=> res!759538 e!647890)))

(assert (=> b!1138654 (= res!759538 (not (= from!1455 i!673)))))

(declare-fun lt!506622 () ListLongMap!16113)

(declare-fun lt!506614 () array!74071)

(assert (=> b!1138654 (= lt!506622 (getCurrentListMapNoExtraKeys!4556 lt!506613 lt!506614 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2606 (Int (_ BitVec 64)) V!43267)

(assert (=> b!1138654 (= lt!506614 (array!74072 (store (arr!35686 _values!996) i!673 (ValueCellFull!13593 (dynLambda!2606 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36222 _values!996)))))

(declare-fun lt!506617 () ListLongMap!16113)

(assert (=> b!1138654 (= lt!506617 (getCurrentListMapNoExtraKeys!4556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138655 () Bool)

(assert (=> b!1138655 (= e!647890 e!647891)))

(declare-fun res!759547 () Bool)

(assert (=> b!1138655 (=> res!759547 e!647891)))

(assert (=> b!1138655 (= res!759547 (not (= (select (arr!35685 _keys!1208) from!1455) k0!934)))))

(declare-fun e!647880 () Bool)

(assert (=> b!1138655 e!647880))

(declare-fun c!111537 () Bool)

(assert (=> b!1138655 (= c!111537 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506620 () Unit!37306)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!473 (array!74069 array!74071 (_ BitVec 32) (_ BitVec 32) V!43267 V!43267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37306)

(assert (=> b!1138655 (= lt!506620 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44732 () Bool)

(declare-fun mapRes!44732 () Bool)

(assert (=> mapIsEmpty!44732 mapRes!44732))

(declare-fun b!1138656 () Bool)

(declare-fun e!647887 () Unit!37306)

(declare-fun lt!506616 () Unit!37306)

(assert (=> b!1138656 (= e!647887 lt!506616)))

(assert (=> b!1138656 (= lt!506616 call!50445)))

(assert (=> b!1138656 call!50443))

(declare-fun res!759550 () Bool)

(assert (=> start!98470 (=> (not res!759550) (not e!647895))))

(assert (=> start!98470 (= res!759550 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36221 _keys!1208))))))

(assert (=> start!98470 e!647895))

(assert (=> start!98470 tp_is_empty!28605))

(declare-fun array_inv!27354 (array!74069) Bool)

(assert (=> start!98470 (array_inv!27354 _keys!1208)))

(assert (=> start!98470 true))

(assert (=> start!98470 tp!84936))

(declare-fun e!647885 () Bool)

(declare-fun array_inv!27355 (array!74071) Bool)

(assert (=> start!98470 (and (array_inv!27355 _values!996) e!647885)))

(declare-fun call!50446 () ListLongMap!16113)

(declare-fun call!50448 () ListLongMap!16113)

(declare-fun b!1138648 () Bool)

(declare-fun -!1223 (ListLongMap!16113 (_ BitVec 64)) ListLongMap!16113)

(assert (=> b!1138648 (= e!647880 (= call!50448 (-!1223 call!50446 k0!934)))))

(declare-fun b!1138657 () Bool)

(declare-fun res!759540 () Bool)

(assert (=> b!1138657 (=> (not res!759540) (not e!647895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138657 (= res!759540 (validKeyInArray!0 k0!934))))

(declare-fun call!50449 () ListLongMap!16113)

(declare-fun lt!506625 () ListLongMap!16113)

(declare-fun bm!50440 () Bool)

(declare-fun +!3504 (ListLongMap!16113 tuple2!18144) ListLongMap!16113)

(assert (=> bm!50440 (= call!50449 (+!3504 (ite c!111533 lt!506625 lt!506615) (ite c!111533 (tuple2!18145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111534 (tuple2!18145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1138658 () Bool)

(declare-fun arrayContainsKey!0 (array!74069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138658 (= e!647892 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138659 () Bool)

(declare-fun res!759544 () Bool)

(assert (=> b!1138659 (=> (not res!759544) (not e!647895))))

(assert (=> b!1138659 (= res!759544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138660 () Bool)

(assert (=> b!1138660 (contains!6608 call!50449 k0!934)))

(declare-fun lt!506612 () Unit!37306)

(assert (=> b!1138660 (= lt!506612 (addStillContains!764 lt!506625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50442 () Bool)

(assert (=> b!1138660 call!50442))

(assert (=> b!1138660 (= lt!506625 (+!3504 lt!506615 (tuple2!18145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506627 () Unit!37306)

(assert (=> b!1138660 (= lt!506627 call!50444)))

(assert (=> b!1138660 (= e!647893 lt!506612)))

(declare-fun bm!50441 () Bool)

(assert (=> bm!50441 (= call!50448 (getCurrentListMapNoExtraKeys!4556 lt!506613 lt!506614 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138661 () Bool)

(declare-fun Unit!37309 () Unit!37306)

(assert (=> b!1138661 (= e!647881 Unit!37309)))

(declare-fun mapNonEmpty!44732 () Bool)

(declare-fun tp!84935 () Bool)

(assert (=> mapNonEmpty!44732 (= mapRes!44732 (and tp!84935 e!647888))))

(declare-fun mapKey!44732 () (_ BitVec 32))

(declare-fun mapRest!44732 () (Array (_ BitVec 32) ValueCell!13593))

(declare-fun mapValue!44732 () ValueCell!13593)

(assert (=> mapNonEmpty!44732 (= (arr!35686 _values!996) (store mapRest!44732 mapKey!44732 mapValue!44732))))

(declare-fun b!1138662 () Bool)

(assert (=> b!1138662 (= e!647884 (not e!647894))))

(declare-fun res!759546 () Bool)

(assert (=> b!1138662 (=> res!759546 e!647894)))

(assert (=> b!1138662 (= res!759546 (bvsgt from!1455 i!673))))

(assert (=> b!1138662 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506619 () Unit!37306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74069 (_ BitVec 64) (_ BitVec 32)) Unit!37306)

(assert (=> b!1138662 (= lt!506619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50442 () Bool)

(declare-fun call!50447 () ListLongMap!16113)

(assert (=> bm!50442 (= call!50447 call!50449)))

(declare-fun bm!50443 () Bool)

(assert (=> bm!50443 (= call!50446 (getCurrentListMapNoExtraKeys!4556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138663 () Bool)

(assert (=> b!1138663 (= e!647880 (= call!50448 call!50446))))

(declare-fun bm!50444 () Bool)

(assert (=> bm!50444 (= call!50445 call!50444)))

(declare-fun b!1138664 () Bool)

(assert (=> b!1138664 (= c!111534 (and (not lt!506628) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138664 (= e!647893 e!647887)))

(declare-fun b!1138665 () Bool)

(declare-fun e!647882 () Bool)

(assert (=> b!1138665 (= e!647885 (and e!647882 mapRes!44732))))

(declare-fun condMapEmpty!44732 () Bool)

(declare-fun mapDefault!44732 () ValueCell!13593)

(assert (=> b!1138665 (= condMapEmpty!44732 (= (arr!35686 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13593)) mapDefault!44732)))))

(declare-fun b!1138666 () Bool)

(assert (=> b!1138666 (= e!647882 tp_is_empty!28605)))

(declare-fun b!1138667 () Bool)

(declare-fun Unit!37310 () Unit!37306)

(assert (=> b!1138667 (= e!647883 Unit!37310)))

(declare-fun b!1138668 () Bool)

(declare-fun res!759539 () Bool)

(assert (=> b!1138668 (=> (not res!759539) (not e!647895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138668 (= res!759539 (validMask!0 mask!1564))))

(declare-fun bm!50445 () Bool)

(assert (=> bm!50445 (= call!50442 (contains!6608 (ite c!111533 lt!506625 call!50447) k0!934))))

(declare-fun b!1138669 () Bool)

(declare-fun res!759543 () Bool)

(assert (=> b!1138669 (=> (not res!759543) (not e!647895))))

(assert (=> b!1138669 (= res!759543 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36221 _keys!1208))))))

(declare-fun b!1138670 () Bool)

(declare-fun res!759548 () Bool)

(assert (=> b!1138670 (=> (not res!759548) (not e!647895))))

(assert (=> b!1138670 (= res!759548 (and (= (size!36222 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36221 _keys!1208) (size!36222 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138671 () Bool)

(assert (=> b!1138671 (= e!647887 e!647883)))

(declare-fun c!111538 () Bool)

(assert (=> b!1138671 (= c!111538 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506628))))

(declare-fun b!1138672 () Bool)

(declare-fun res!759549 () Bool)

(assert (=> b!1138672 (=> (not res!759549) (not e!647884))))

(assert (=> b!1138672 (= res!759549 (arrayNoDuplicates!0 lt!506613 #b00000000000000000000000000000000 Nil!24897))))

(declare-fun b!1138673 () Bool)

(declare-fun res!759545 () Bool)

(assert (=> b!1138673 (=> (not res!759545) (not e!647895))))

(assert (=> b!1138673 (= res!759545 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24897))))

(declare-fun bm!50446 () Bool)

(assert (=> bm!50446 (= call!50443 call!50442)))

(declare-fun b!1138674 () Bool)

(assert (=> b!1138674 (= e!647889 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98470 res!759550) b!1138668))

(assert (= (and b!1138668 res!759539) b!1138670))

(assert (= (and b!1138670 res!759548) b!1138659))

(assert (= (and b!1138659 res!759544) b!1138673))

(assert (= (and b!1138673 res!759545) b!1138669))

(assert (= (and b!1138669 res!759543) b!1138657))

(assert (= (and b!1138657 res!759540) b!1138647))

(assert (= (and b!1138647 res!759541) b!1138653))

(assert (= (and b!1138653 res!759551) b!1138672))

(assert (= (and b!1138672 res!759549) b!1138662))

(assert (= (and b!1138662 (not res!759546)) b!1138654))

(assert (= (and b!1138654 (not res!759538)) b!1138655))

(assert (= (and b!1138655 c!111537) b!1138648))

(assert (= (and b!1138655 (not c!111537)) b!1138663))

(assert (= (or b!1138648 b!1138663) bm!50441))

(assert (= (or b!1138648 b!1138663) bm!50443))

(assert (= (and b!1138655 (not res!759547)) b!1138651))

(assert (= (and b!1138651 c!111536) b!1138646))

(assert (= (and b!1138651 (not c!111536)) b!1138661))

(assert (= (and b!1138646 c!111533) b!1138660))

(assert (= (and b!1138646 (not c!111533)) b!1138664))

(assert (= (and b!1138664 c!111534) b!1138656))

(assert (= (and b!1138664 (not c!111534)) b!1138671))

(assert (= (and b!1138671 c!111538) b!1138652))

(assert (= (and b!1138671 (not c!111538)) b!1138667))

(assert (= (or b!1138656 b!1138652) bm!50444))

(assert (= (or b!1138656 b!1138652) bm!50442))

(assert (= (or b!1138656 b!1138652) bm!50446))

(assert (= (or b!1138660 bm!50446) bm!50445))

(assert (= (or b!1138660 bm!50444) bm!50439))

(assert (= (or b!1138660 bm!50442) bm!50440))

(assert (= (and b!1138646 c!111535) b!1138674))

(assert (= (and b!1138646 (not c!111535)) b!1138649))

(assert (= (and b!1138646 res!759542) b!1138658))

(assert (= (and b!1138665 condMapEmpty!44732) mapIsEmpty!44732))

(assert (= (and b!1138665 (not condMapEmpty!44732)) mapNonEmpty!44732))

(get-info :version)

(assert (= (and mapNonEmpty!44732 ((_ is ValueCellFull!13593) mapValue!44732)) b!1138650))

(assert (= (and b!1138665 ((_ is ValueCellFull!13593) mapDefault!44732)) b!1138666))

(assert (= start!98470 b!1138665))

(declare-fun b_lambda!19181 () Bool)

(assert (=> (not b_lambda!19181) (not b!1138654)))

(declare-fun t!35966 () Bool)

(declare-fun tb!8887 () Bool)

(assert (=> (and start!98470 (= defaultEntry!1004 defaultEntry!1004) t!35966) tb!8887))

(declare-fun result!18339 () Bool)

(assert (=> tb!8887 (= result!18339 tp_is_empty!28605)))

(assert (=> b!1138654 t!35966))

(declare-fun b_and!39001 () Bool)

(assert (= b_and!38999 (and (=> t!35966 result!18339) b_and!39001)))

(declare-fun m!1050449 () Bool)

(assert (=> bm!50445 m!1050449))

(declare-fun m!1050451 () Bool)

(assert (=> b!1138651 m!1050451))

(declare-fun m!1050453 () Bool)

(assert (=> b!1138651 m!1050453))

(declare-fun m!1050455 () Bool)

(assert (=> b!1138659 m!1050455))

(declare-fun m!1050457 () Bool)

(assert (=> b!1138657 m!1050457))

(declare-fun m!1050459 () Bool)

(assert (=> b!1138655 m!1050459))

(declare-fun m!1050461 () Bool)

(assert (=> b!1138655 m!1050461))

(declare-fun m!1050463 () Bool)

(assert (=> start!98470 m!1050463))

(declare-fun m!1050465 () Bool)

(assert (=> start!98470 m!1050465))

(declare-fun m!1050467 () Bool)

(assert (=> bm!50439 m!1050467))

(declare-fun m!1050469 () Bool)

(assert (=> b!1138672 m!1050469))

(declare-fun m!1050471 () Bool)

(assert (=> bm!50441 m!1050471))

(declare-fun m!1050473 () Bool)

(assert (=> mapNonEmpty!44732 m!1050473))

(declare-fun m!1050475 () Bool)

(assert (=> b!1138648 m!1050475))

(declare-fun m!1050477 () Bool)

(assert (=> b!1138653 m!1050477))

(declare-fun m!1050479 () Bool)

(assert (=> b!1138653 m!1050479))

(declare-fun m!1050481 () Bool)

(assert (=> b!1138646 m!1050481))

(declare-fun m!1050483 () Bool)

(assert (=> b!1138646 m!1050483))

(declare-fun m!1050485 () Bool)

(assert (=> b!1138646 m!1050485))

(declare-fun m!1050487 () Bool)

(assert (=> b!1138646 m!1050487))

(declare-fun m!1050489 () Bool)

(assert (=> b!1138673 m!1050489))

(declare-fun m!1050491 () Bool)

(assert (=> b!1138660 m!1050491))

(declare-fun m!1050493 () Bool)

(assert (=> b!1138660 m!1050493))

(declare-fun m!1050495 () Bool)

(assert (=> b!1138660 m!1050495))

(declare-fun m!1050497 () Bool)

(assert (=> b!1138662 m!1050497))

(declare-fun m!1050499 () Bool)

(assert (=> b!1138662 m!1050499))

(declare-fun m!1050501 () Bool)

(assert (=> b!1138658 m!1050501))

(assert (=> b!1138674 m!1050501))

(assert (=> bm!50443 m!1050453))

(declare-fun m!1050503 () Bool)

(assert (=> b!1138654 m!1050503))

(declare-fun m!1050505 () Bool)

(assert (=> b!1138654 m!1050505))

(declare-fun m!1050507 () Bool)

(assert (=> b!1138654 m!1050507))

(declare-fun m!1050509 () Bool)

(assert (=> b!1138654 m!1050509))

(declare-fun m!1050511 () Bool)

(assert (=> bm!50440 m!1050511))

(declare-fun m!1050513 () Bool)

(assert (=> b!1138668 m!1050513))

(declare-fun m!1050515 () Bool)

(assert (=> b!1138647 m!1050515))

(check-sat (not bm!50440) (not b!1138655) (not bm!50445) (not b!1138657) (not b!1138653) (not b_next!24075) (not bm!50443) (not b!1138660) (not b!1138658) tp_is_empty!28605 (not bm!50441) (not start!98470) (not b!1138654) (not bm!50439) (not b!1138651) (not mapNonEmpty!44732) (not b!1138659) b_and!39001 (not b!1138673) (not b!1138646) (not b!1138674) (not b!1138668) (not b!1138648) (not b_lambda!19181) (not b!1138662) (not b!1138672))
(check-sat b_and!39001 (not b_next!24075))
