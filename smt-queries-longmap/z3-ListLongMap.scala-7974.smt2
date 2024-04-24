; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98920 () Bool)

(assert start!98920)

(declare-fun b_free!24289 () Bool)

(declare-fun b_next!24289 () Bool)

(assert (=> start!98920 (= b_free!24289 (not b_next!24289))))

(declare-fun tp!85578 () Bool)

(declare-fun b_and!39429 () Bool)

(assert (=> start!98920 (= tp!85578 b_and!39429)))

(declare-fun b!1149595 () Bool)

(declare-datatypes ((array!74533 0))(
  ( (array!74534 (arr!35911 (Array (_ BitVec 32) (_ BitVec 64))) (size!36448 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74533)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!653991 () Bool)

(declare-fun arrayContainsKey!0 (array!74533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149595 (= e!653991 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149596 () Bool)

(declare-fun res!764682 () Bool)

(declare-fun e!653987 () Bool)

(assert (=> b!1149596 (=> (not res!764682) (not e!653987))))

(declare-fun lt!513795 () array!74533)

(declare-datatypes ((List!25114 0))(
  ( (Nil!25111) (Cons!25110 (h!26328 (_ BitVec 64)) (t!36387 List!25114)) )
))
(declare-fun arrayNoDuplicates!0 (array!74533 (_ BitVec 32) List!25114) Bool)

(assert (=> b!1149596 (= res!764682 (arrayNoDuplicates!0 lt!513795 #b00000000000000000000000000000000 Nil!25111))))

(declare-fun bm!53072 () Bool)

(declare-datatypes ((V!43553 0))(
  ( (V!43554 (val!14466 Int)) )
))
(declare-datatypes ((tuple2!18360 0))(
  ( (tuple2!18361 (_1!9191 (_ BitVec 64)) (_2!9191 V!43553)) )
))
(declare-datatypes ((List!25115 0))(
  ( (Nil!25112) (Cons!25111 (h!26329 tuple2!18360) (t!36388 List!25115)) )
))
(declare-datatypes ((ListLongMap!16337 0))(
  ( (ListLongMap!16338 (toList!8184 List!25115)) )
))
(declare-fun call!53075 () ListLongMap!16337)

(declare-fun call!53077 () ListLongMap!16337)

(assert (=> bm!53072 (= call!53075 call!53077)))

(declare-fun mapIsEmpty!45053 () Bool)

(declare-fun mapRes!45053 () Bool)

(assert (=> mapIsEmpty!45053 mapRes!45053))

(declare-fun b!1149597 () Bool)

(declare-fun res!764685 () Bool)

(declare-fun e!653999 () Bool)

(assert (=> b!1149597 (=> (not res!764685) (not e!653999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149597 (= res!764685 (validKeyInArray!0 k0!934))))

(declare-fun b!1149598 () Bool)

(declare-datatypes ((Unit!37715 0))(
  ( (Unit!37716) )
))
(declare-fun e!653990 () Unit!37715)

(declare-fun Unit!37717 () Unit!37715)

(assert (=> b!1149598 (= e!653990 Unit!37717)))

(declare-fun mapNonEmpty!45053 () Bool)

(declare-fun tp!85577 () Bool)

(declare-fun e!654001 () Bool)

(assert (=> mapNonEmpty!45053 (= mapRes!45053 (and tp!85577 e!654001))))

(declare-datatypes ((ValueCell!13700 0))(
  ( (ValueCellFull!13700 (v!17099 V!43553)) (EmptyCell!13700) )
))
(declare-fun mapValue!45053 () ValueCell!13700)

(declare-fun mapKey!45053 () (_ BitVec 32))

(declare-datatypes ((array!74535 0))(
  ( (array!74536 (arr!35912 (Array (_ BitVec 32) ValueCell!13700)) (size!36449 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74535)

(declare-fun mapRest!45053 () (Array (_ BitVec 32) ValueCell!13700))

(assert (=> mapNonEmpty!45053 (= (arr!35912 _values!996) (store mapRest!45053 mapKey!45053 mapValue!45053))))

(declare-fun b!1149599 () Bool)

(declare-fun e!653996 () Bool)

(declare-fun e!653988 () Bool)

(assert (=> b!1149599 (= e!653996 e!653988)))

(declare-fun res!764687 () Bool)

(assert (=> b!1149599 (=> res!764687 e!653988)))

(assert (=> b!1149599 (= res!764687 (not (= (select (arr!35911 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653986 () Bool)

(assert (=> b!1149599 e!653986))

(declare-fun c!113858 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149599 (= c!113858 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43553)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43553)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!513799 () Unit!37715)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!554 (array!74533 array!74535 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37715)

(assert (=> b!1149599 (= lt!513799 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149600 () Bool)

(declare-fun call!53078 () ListLongMap!16337)

(declare-fun call!53076 () ListLongMap!16337)

(assert (=> b!1149600 (= e!653986 (= call!53078 call!53076))))

(declare-fun b!1149601 () Bool)

(declare-fun lt!513781 () ListLongMap!16337)

(declare-fun contains!6722 (ListLongMap!16337 (_ BitVec 64)) Bool)

(declare-fun +!3624 (ListLongMap!16337 tuple2!18360) ListLongMap!16337)

(assert (=> b!1149601 (contains!6722 (+!3624 lt!513781 (tuple2!18361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513796 () Unit!37715)

(declare-fun call!53079 () Unit!37715)

(assert (=> b!1149601 (= lt!513796 call!53079)))

(declare-fun call!53082 () Bool)

(assert (=> b!1149601 call!53082))

(assert (=> b!1149601 (= lt!513781 call!53077)))

(declare-fun lt!513787 () ListLongMap!16337)

(declare-fun lt!513792 () Unit!37715)

(declare-fun addStillContains!849 (ListLongMap!16337 (_ BitVec 64) V!43553 (_ BitVec 64)) Unit!37715)

(assert (=> b!1149601 (= lt!513792 (addStillContains!849 lt!513787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!653993 () Unit!37715)

(assert (=> b!1149601 (= e!653993 lt!513796)))

(declare-fun b!1149602 () Bool)

(declare-fun lt!513779 () Bool)

(assert (=> b!1149602 (= e!653991 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513779) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!113859 () Bool)

(declare-fun c!113860 () Bool)

(declare-fun bm!53073 () Bool)

(assert (=> bm!53073 (= call!53077 (+!3624 lt!513787 (ite (or c!113860 c!113859) (tuple2!18361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!53074 () Bool)

(assert (=> bm!53074 (= call!53079 (addStillContains!849 (ite c!113860 lt!513781 lt!513787) (ite c!113860 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113859 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113860 minValue!944 (ite c!113859 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1149603 () Bool)

(declare-fun res!764688 () Bool)

(assert (=> b!1149603 (=> (not res!764688) (not e!653999))))

(assert (=> b!1149603 (= res!764688 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25111))))

(declare-fun b!1149604 () Bool)

(declare-fun call!53081 () Bool)

(assert (=> b!1149604 call!53081))

(declare-fun lt!513798 () Unit!37715)

(declare-fun call!53080 () Unit!37715)

(assert (=> b!1149604 (= lt!513798 call!53080)))

(assert (=> b!1149604 (= e!653990 lt!513798)))

(declare-fun b!1149605 () Bool)

(assert (=> b!1149605 (= c!113859 (and (not lt!513779) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654000 () Unit!37715)

(assert (=> b!1149605 (= e!653993 e!654000)))

(declare-fun b!1149606 () Bool)

(declare-fun res!764684 () Bool)

(assert (=> b!1149606 (=> (not res!764684) (not e!653999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149606 (= res!764684 (validMask!0 mask!1564))))

(declare-fun b!1149607 () Bool)

(declare-fun e!653985 () Bool)

(declare-fun e!653992 () Bool)

(assert (=> b!1149607 (= e!653985 (and e!653992 mapRes!45053))))

(declare-fun condMapEmpty!45053 () Bool)

(declare-fun mapDefault!45053 () ValueCell!13700)

(assert (=> b!1149607 (= condMapEmpty!45053 (= (arr!35912 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13700)) mapDefault!45053)))))

(declare-fun b!1149608 () Bool)

(declare-fun e!653998 () Bool)

(assert (=> b!1149608 (= e!653998 e!653996)))

(declare-fun res!764680 () Bool)

(assert (=> b!1149608 (=> res!764680 e!653996)))

(assert (=> b!1149608 (= res!764680 (not (= from!1455 i!673)))))

(declare-fun lt!513797 () array!74535)

(declare-fun lt!513794 () ListLongMap!16337)

(declare-fun getCurrentListMapNoExtraKeys!4686 (array!74533 array!74535 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 32) Int) ListLongMap!16337)

(assert (=> b!1149608 (= lt!513794 (getCurrentListMapNoExtraKeys!4686 lt!513795 lt!513797 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513789 () V!43553)

(assert (=> b!1149608 (= lt!513797 (array!74536 (store (arr!35912 _values!996) i!673 (ValueCellFull!13700 lt!513789)) (size!36449 _values!996)))))

(declare-fun dynLambda!2713 (Int (_ BitVec 64)) V!43553)

(assert (=> b!1149608 (= lt!513789 (dynLambda!2713 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513790 () ListLongMap!16337)

(assert (=> b!1149608 (= lt!513790 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149609 () Bool)

(declare-fun tp_is_empty!28819 () Bool)

(assert (=> b!1149609 (= e!654001 tp_is_empty!28819)))

(declare-fun b!1149610 () Bool)

(declare-fun res!764691 () Bool)

(assert (=> b!1149610 (=> (not res!764691) (not e!653999))))

(assert (=> b!1149610 (= res!764691 (= (select (arr!35911 _keys!1208) i!673) k0!934))))

(declare-fun b!1149611 () Bool)

(declare-fun e!653994 () Bool)

(declare-fun -!1307 (ListLongMap!16337 (_ BitVec 64)) ListLongMap!16337)

(assert (=> b!1149611 (= e!653994 (= (-!1307 lt!513790 k0!934) lt!513787))))

(declare-fun bm!53075 () Bool)

(assert (=> bm!53075 (= call!53082 (contains!6722 (ite c!113860 lt!513781 call!53075) k0!934))))

(declare-fun bm!53076 () Bool)

(assert (=> bm!53076 (= call!53076 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149612 () Bool)

(assert (=> b!1149612 (= e!653999 e!653987)))

(declare-fun res!764677 () Bool)

(assert (=> b!1149612 (=> (not res!764677) (not e!653987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74533 (_ BitVec 32)) Bool)

(assert (=> b!1149612 (= res!764677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513795 mask!1564))))

(assert (=> b!1149612 (= lt!513795 (array!74534 (store (arr!35911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36448 _keys!1208)))))

(declare-fun b!1149613 () Bool)

(declare-fun e!653997 () Unit!37715)

(declare-fun Unit!37718 () Unit!37715)

(assert (=> b!1149613 (= e!653997 Unit!37718)))

(declare-fun b!1149614 () Bool)

(assert (=> b!1149614 (= e!654000 e!653990)))

(declare-fun c!113862 () Bool)

(assert (=> b!1149614 (= c!113862 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513779))))

(declare-fun b!1149615 () Bool)

(assert (=> b!1149615 (= e!653987 (not e!653998))))

(declare-fun res!764689 () Bool)

(assert (=> b!1149615 (=> res!764689 e!653998)))

(assert (=> b!1149615 (= res!764689 (bvsgt from!1455 i!673))))

(assert (=> b!1149615 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513793 () Unit!37715)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74533 (_ BitVec 64) (_ BitVec 32)) Unit!37715)

(assert (=> b!1149615 (= lt!513793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149616 () Bool)

(declare-fun e!653995 () Bool)

(assert (=> b!1149616 (= e!653995 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!764683 () Bool)

(assert (=> start!98920 (=> (not res!764683) (not e!653999))))

(assert (=> start!98920 (= res!764683 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36448 _keys!1208))))))

(assert (=> start!98920 e!653999))

(assert (=> start!98920 tp_is_empty!28819))

(declare-fun array_inv!27562 (array!74533) Bool)

(assert (=> start!98920 (array_inv!27562 _keys!1208)))

(assert (=> start!98920 true))

(assert (=> start!98920 tp!85578))

(declare-fun array_inv!27563 (array!74535) Bool)

(assert (=> start!98920 (and (array_inv!27563 _values!996) e!653985)))

(declare-fun b!1149617 () Bool)

(assert (=> b!1149617 (= e!653992 tp_is_empty!28819)))

(declare-fun b!1149618 () Bool)

(declare-fun res!764681 () Bool)

(assert (=> b!1149618 (=> (not res!764681) (not e!653999))))

(assert (=> b!1149618 (= res!764681 (and (= (size!36449 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36448 _keys!1208) (size!36449 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149619 () Bool)

(assert (=> b!1149619 (= e!653988 true)))

(assert (=> b!1149619 e!653994))

(declare-fun res!764679 () Bool)

(assert (=> b!1149619 (=> (not res!764679) (not e!653994))))

(declare-fun lt!513784 () V!43553)

(assert (=> b!1149619 (= res!764679 (= (-!1307 (+!3624 lt!513787 (tuple2!18361 (select (arr!35911 _keys!1208) from!1455) lt!513784)) (select (arr!35911 _keys!1208) from!1455)) lt!513787))))

(declare-fun lt!513782 () Unit!37715)

(declare-fun addThenRemoveForNewKeyIsSame!157 (ListLongMap!16337 (_ BitVec 64) V!43553) Unit!37715)

(assert (=> b!1149619 (= lt!513782 (addThenRemoveForNewKeyIsSame!157 lt!513787 (select (arr!35911 _keys!1208) from!1455) lt!513784))))

(declare-fun get!18298 (ValueCell!13700 V!43553) V!43553)

(assert (=> b!1149619 (= lt!513784 (get!18298 (select (arr!35912 _values!996) from!1455) lt!513789))))

(declare-fun lt!513780 () Unit!37715)

(assert (=> b!1149619 (= lt!513780 e!653997)))

(declare-fun c!113857 () Bool)

(assert (=> b!1149619 (= c!113857 (contains!6722 lt!513787 k0!934))))

(assert (=> b!1149619 (= lt!513787 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149620 () Bool)

(declare-fun res!764686 () Bool)

(assert (=> b!1149620 (=> (not res!764686) (not e!653999))))

(assert (=> b!1149620 (= res!764686 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36448 _keys!1208))))))

(declare-fun b!1149621 () Bool)

(declare-fun res!764690 () Bool)

(assert (=> b!1149621 (=> (not res!764690) (not e!653999))))

(assert (=> b!1149621 (= res!764690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149622 () Bool)

(declare-fun lt!513786 () Unit!37715)

(assert (=> b!1149622 (= e!654000 lt!513786)))

(assert (=> b!1149622 (= lt!513786 call!53080)))

(assert (=> b!1149622 call!53081))

(declare-fun bm!53077 () Bool)

(assert (=> bm!53077 (= call!53081 call!53082)))

(declare-fun bm!53078 () Bool)

(assert (=> bm!53078 (= call!53080 call!53079)))

(declare-fun b!1149623 () Bool)

(declare-fun Unit!37719 () Unit!37715)

(assert (=> b!1149623 (= e!653997 Unit!37719)))

(assert (=> b!1149623 (= lt!513779 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149623 (= c!113860 (and (not lt!513779) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513785 () Unit!37715)

(assert (=> b!1149623 (= lt!513785 e!653993)))

(declare-fun lt!513788 () Unit!37715)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!444 (array!74533 array!74535 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 64) (_ BitVec 32) Int) Unit!37715)

(assert (=> b!1149623 (= lt!513788 (lemmaListMapContainsThenArrayContainsFrom!444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113861 () Bool)

(assert (=> b!1149623 (= c!113861 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764678 () Bool)

(assert (=> b!1149623 (= res!764678 e!653991)))

(assert (=> b!1149623 (=> (not res!764678) (not e!653995))))

(assert (=> b!1149623 e!653995))

(declare-fun lt!513783 () Unit!37715)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74533 (_ BitVec 32) (_ BitVec 32)) Unit!37715)

(assert (=> b!1149623 (= lt!513783 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149623 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25111)))

(declare-fun lt!513791 () Unit!37715)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74533 (_ BitVec 64) (_ BitVec 32) List!25114) Unit!37715)

(assert (=> b!1149623 (= lt!513791 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25111))))

(assert (=> b!1149623 false))

(declare-fun b!1149624 () Bool)

(assert (=> b!1149624 (= e!653986 (= call!53078 (-!1307 call!53076 k0!934)))))

(declare-fun bm!53079 () Bool)

(assert (=> bm!53079 (= call!53078 (getCurrentListMapNoExtraKeys!4686 lt!513795 lt!513797 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98920 res!764683) b!1149606))

(assert (= (and b!1149606 res!764684) b!1149618))

(assert (= (and b!1149618 res!764681) b!1149621))

(assert (= (and b!1149621 res!764690) b!1149603))

(assert (= (and b!1149603 res!764688) b!1149620))

(assert (= (and b!1149620 res!764686) b!1149597))

(assert (= (and b!1149597 res!764685) b!1149610))

(assert (= (and b!1149610 res!764691) b!1149612))

(assert (= (and b!1149612 res!764677) b!1149596))

(assert (= (and b!1149596 res!764682) b!1149615))

(assert (= (and b!1149615 (not res!764689)) b!1149608))

(assert (= (and b!1149608 (not res!764680)) b!1149599))

(assert (= (and b!1149599 c!113858) b!1149624))

(assert (= (and b!1149599 (not c!113858)) b!1149600))

(assert (= (or b!1149624 b!1149600) bm!53079))

(assert (= (or b!1149624 b!1149600) bm!53076))

(assert (= (and b!1149599 (not res!764687)) b!1149619))

(assert (= (and b!1149619 c!113857) b!1149623))

(assert (= (and b!1149619 (not c!113857)) b!1149613))

(assert (= (and b!1149623 c!113860) b!1149601))

(assert (= (and b!1149623 (not c!113860)) b!1149605))

(assert (= (and b!1149605 c!113859) b!1149622))

(assert (= (and b!1149605 (not c!113859)) b!1149614))

(assert (= (and b!1149614 c!113862) b!1149604))

(assert (= (and b!1149614 (not c!113862)) b!1149598))

(assert (= (or b!1149622 b!1149604) bm!53078))

(assert (= (or b!1149622 b!1149604) bm!53072))

(assert (= (or b!1149622 b!1149604) bm!53077))

(assert (= (or b!1149601 bm!53077) bm!53075))

(assert (= (or b!1149601 bm!53078) bm!53074))

(assert (= (or b!1149601 bm!53072) bm!53073))

(assert (= (and b!1149623 c!113861) b!1149595))

(assert (= (and b!1149623 (not c!113861)) b!1149602))

(assert (= (and b!1149623 res!764678) b!1149616))

(assert (= (and b!1149619 res!764679) b!1149611))

(assert (= (and b!1149607 condMapEmpty!45053) mapIsEmpty!45053))

(assert (= (and b!1149607 (not condMapEmpty!45053)) mapNonEmpty!45053))

(get-info :version)

(assert (= (and mapNonEmpty!45053 ((_ is ValueCellFull!13700) mapValue!45053)) b!1149609))

(assert (= (and b!1149607 ((_ is ValueCellFull!13700) mapDefault!45053)) b!1149617))

(assert (= start!98920 b!1149607))

(declare-fun b_lambda!19389 () Bool)

(assert (=> (not b_lambda!19389) (not b!1149608)))

(declare-fun t!36386 () Bool)

(declare-fun tb!9093 () Bool)

(assert (=> (and start!98920 (= defaultEntry!1004 defaultEntry!1004) t!36386) tb!9093))

(declare-fun result!18759 () Bool)

(assert (=> tb!9093 (= result!18759 tp_is_empty!28819)))

(assert (=> b!1149608 t!36386))

(declare-fun b_and!39431 () Bool)

(assert (= b_and!39429 (and (=> t!36386 result!18759) b_and!39431)))

(declare-fun m!1060393 () Bool)

(assert (=> b!1149621 m!1060393))

(declare-fun m!1060395 () Bool)

(assert (=> b!1149597 m!1060395))

(declare-fun m!1060397 () Bool)

(assert (=> b!1149610 m!1060397))

(declare-fun m!1060399 () Bool)

(assert (=> bm!53075 m!1060399))

(declare-fun m!1060401 () Bool)

(assert (=> b!1149624 m!1060401))

(declare-fun m!1060403 () Bool)

(assert (=> b!1149603 m!1060403))

(declare-fun m!1060405 () Bool)

(assert (=> bm!53073 m!1060405))

(declare-fun m!1060407 () Bool)

(assert (=> b!1149623 m!1060407))

(declare-fun m!1060409 () Bool)

(assert (=> b!1149623 m!1060409))

(declare-fun m!1060411 () Bool)

(assert (=> b!1149623 m!1060411))

(declare-fun m!1060413 () Bool)

(assert (=> b!1149623 m!1060413))

(declare-fun m!1060415 () Bool)

(assert (=> b!1149615 m!1060415))

(declare-fun m!1060417 () Bool)

(assert (=> b!1149615 m!1060417))

(declare-fun m!1060419 () Bool)

(assert (=> b!1149616 m!1060419))

(declare-fun m!1060421 () Bool)

(assert (=> mapNonEmpty!45053 m!1060421))

(declare-fun m!1060423 () Bool)

(assert (=> bm!53074 m!1060423))

(declare-fun m!1060425 () Bool)

(assert (=> b!1149619 m!1060425))

(declare-fun m!1060427 () Bool)

(assert (=> b!1149619 m!1060427))

(declare-fun m!1060429 () Bool)

(assert (=> b!1149619 m!1060429))

(declare-fun m!1060431 () Bool)

(assert (=> b!1149619 m!1060431))

(assert (=> b!1149619 m!1060425))

(declare-fun m!1060433 () Bool)

(assert (=> b!1149619 m!1060433))

(declare-fun m!1060435 () Bool)

(assert (=> b!1149619 m!1060435))

(assert (=> b!1149619 m!1060431))

(declare-fun m!1060437 () Bool)

(assert (=> b!1149619 m!1060437))

(assert (=> b!1149619 m!1060427))

(declare-fun m!1060439 () Bool)

(assert (=> b!1149619 m!1060439))

(assert (=> b!1149619 m!1060427))

(declare-fun m!1060441 () Bool)

(assert (=> b!1149611 m!1060441))

(assert (=> b!1149595 m!1060419))

(declare-fun m!1060443 () Bool)

(assert (=> b!1149596 m!1060443))

(assert (=> b!1149599 m!1060427))

(declare-fun m!1060445 () Bool)

(assert (=> b!1149599 m!1060445))

(declare-fun m!1060447 () Bool)

(assert (=> start!98920 m!1060447))

(declare-fun m!1060449 () Bool)

(assert (=> start!98920 m!1060449))

(declare-fun m!1060451 () Bool)

(assert (=> b!1149601 m!1060451))

(assert (=> b!1149601 m!1060451))

(declare-fun m!1060453 () Bool)

(assert (=> b!1149601 m!1060453))

(declare-fun m!1060455 () Bool)

(assert (=> b!1149601 m!1060455))

(assert (=> bm!53076 m!1060435))

(declare-fun m!1060457 () Bool)

(assert (=> b!1149606 m!1060457))

(declare-fun m!1060459 () Bool)

(assert (=> b!1149612 m!1060459))

(declare-fun m!1060461 () Bool)

(assert (=> b!1149612 m!1060461))

(declare-fun m!1060463 () Bool)

(assert (=> bm!53079 m!1060463))

(declare-fun m!1060465 () Bool)

(assert (=> b!1149608 m!1060465))

(declare-fun m!1060467 () Bool)

(assert (=> b!1149608 m!1060467))

(declare-fun m!1060469 () Bool)

(assert (=> b!1149608 m!1060469))

(declare-fun m!1060471 () Bool)

(assert (=> b!1149608 m!1060471))

(check-sat (not bm!53074) (not b_next!24289) (not b!1149616) (not b!1149599) (not start!98920) (not b!1149615) (not b!1149621) (not bm!53079) (not b!1149596) (not b!1149603) (not bm!53073) (not bm!53076) (not mapNonEmpty!45053) (not b!1149606) (not b!1149619) tp_is_empty!28819 (not b!1149601) (not b!1149608) (not b!1149597) (not bm!53075) b_and!39431 (not b!1149612) (not b!1149624) (not b_lambda!19389) (not b!1149595) (not b!1149623) (not b!1149611))
(check-sat b_and!39431 (not b_next!24289))
