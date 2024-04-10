; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98668 () Bool)

(assert start!98668)

(declare-fun b_free!24273 () Bool)

(declare-fun b_next!24273 () Bool)

(assert (=> start!98668 (= b_free!24273 (not b_next!24273))))

(declare-fun tp!85530 () Bool)

(declare-fun b_and!39395 () Bool)

(assert (=> start!98668 (= tp!85530 b_and!39395)))

(declare-fun b!1147570 () Bool)

(declare-datatypes ((Unit!37696 0))(
  ( (Unit!37697) )
))
(declare-fun e!652746 () Unit!37696)

(declare-fun Unit!37698 () Unit!37696)

(assert (=> b!1147570 (= e!652746 Unit!37698)))

(declare-fun b!1147571 () Bool)

(declare-fun e!652760 () Bool)

(declare-fun e!652758 () Bool)

(assert (=> b!1147571 (= e!652760 e!652758)))

(declare-fun res!763820 () Bool)

(assert (=> b!1147571 (=> res!763820 e!652758)))

(declare-datatypes ((array!74453 0))(
  ( (array!74454 (arr!35877 (Array (_ BitVec 32) (_ BitVec 64))) (size!36413 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74453)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1147571 (= res!763820 (not (= (select (arr!35877 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652752 () Bool)

(assert (=> b!1147571 e!652752))

(declare-fun c!113318 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147571 (= c!113318 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!43531 0))(
  ( (V!43532 (val!14458 Int)) )
))
(declare-datatypes ((ValueCell!13692 0))(
  ( (ValueCellFull!13692 (v!17095 V!43531)) (EmptyCell!13692) )
))
(declare-datatypes ((array!74455 0))(
  ( (array!74456 (arr!35878 (Array (_ BitVec 32) ValueCell!13692)) (size!36414 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74455)

(declare-fun minValue!944 () V!43531)

(declare-fun lt!512810 () Unit!37696)

(declare-fun zeroValue!944 () V!43531)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!537 (array!74453 array!74455 (_ BitVec 32) (_ BitVec 32) V!43531 V!43531 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37696)

(assert (=> b!1147571 (= lt!512810 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!537 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52815 () Bool)

(declare-fun call!52820 () Unit!37696)

(declare-fun call!52821 () Unit!37696)

(assert (=> bm!52815 (= call!52820 call!52821)))

(declare-fun mapNonEmpty!45029 () Bool)

(declare-fun mapRes!45029 () Bool)

(declare-fun tp!85529 () Bool)

(declare-fun e!652748 () Bool)

(assert (=> mapNonEmpty!45029 (= mapRes!45029 (and tp!85529 e!652748))))

(declare-fun mapKey!45029 () (_ BitVec 32))

(declare-fun mapRest!45029 () (Array (_ BitVec 32) ValueCell!13692))

(declare-fun mapValue!45029 () ValueCell!13692)

(assert (=> mapNonEmpty!45029 (= (arr!35878 _values!996) (store mapRest!45029 mapKey!45029 mapValue!45029))))

(declare-fun b!1147572 () Bool)

(declare-fun e!652749 () Bool)

(declare-fun arrayContainsKey!0 (array!74453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147572 (= e!652749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147573 () Bool)

(declare-fun e!652750 () Bool)

(declare-fun tp_is_empty!28803 () Bool)

(assert (=> b!1147573 (= e!652750 tp_is_empty!28803)))

(declare-fun c!113320 () Bool)

(declare-datatypes ((tuple2!18328 0))(
  ( (tuple2!18329 (_1!9175 (_ BitVec 64)) (_2!9175 V!43531)) )
))
(declare-datatypes ((List!25079 0))(
  ( (Nil!25076) (Cons!25075 (h!26284 tuple2!18328) (t!36344 List!25079)) )
))
(declare-datatypes ((ListLongMap!16297 0))(
  ( (ListLongMap!16298 (toList!8164 List!25079)) )
))
(declare-fun lt!512794 () ListLongMap!16297)

(declare-fun bm!52816 () Bool)

(declare-fun call!52819 () Bool)

(declare-fun call!52818 () ListLongMap!16297)

(declare-fun contains!6687 (ListLongMap!16297 (_ BitVec 64)) Bool)

(assert (=> bm!52816 (= call!52819 (contains!6687 (ite c!113320 lt!512794 call!52818) k0!934))))

(declare-fun lt!512807 () ListLongMap!16297)

(declare-fun call!52824 () ListLongMap!16297)

(declare-fun c!113319 () Bool)

(declare-fun bm!52817 () Bool)

(declare-fun +!3587 (ListLongMap!16297 tuple2!18328) ListLongMap!16297)

(assert (=> bm!52817 (= call!52824 (+!3587 (ite c!113320 lt!512794 lt!512807) (ite c!113320 (tuple2!18329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113319 (tuple2!18329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147574 () Bool)

(declare-fun e!652754 () Bool)

(assert (=> b!1147574 (= e!652754 (and e!652750 mapRes!45029))))

(declare-fun condMapEmpty!45029 () Bool)

(declare-fun mapDefault!45029 () ValueCell!13692)

(assert (=> b!1147574 (= condMapEmpty!45029 (= (arr!35878 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13692)) mapDefault!45029)))))

(declare-fun b!1147575 () Bool)

(declare-fun res!763813 () Bool)

(declare-fun e!652753 () Bool)

(assert (=> b!1147575 (=> (not res!763813) (not e!652753))))

(assert (=> b!1147575 (= res!763813 (and (= (size!36414 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36413 _keys!1208) (size!36414 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52818 () Bool)

(declare-fun addStillContains!838 (ListLongMap!16297 (_ BitVec 64) V!43531 (_ BitVec 64)) Unit!37696)

(assert (=> bm!52818 (= call!52821 (addStillContains!838 (ite c!113320 lt!512794 lt!512807) (ite c!113320 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113319 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113320 minValue!944 (ite c!113319 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147576 () Bool)

(declare-fun res!763814 () Bool)

(assert (=> b!1147576 (=> (not res!763814) (not e!652753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74453 (_ BitVec 32)) Bool)

(assert (=> b!1147576 (= res!763814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147577 () Bool)

(declare-fun res!763822 () Bool)

(assert (=> b!1147577 (=> (not res!763822) (not e!652753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147577 (= res!763822 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45029 () Bool)

(assert (=> mapIsEmpty!45029 mapRes!45029))

(declare-fun b!1147578 () Bool)

(declare-fun e!652747 () Unit!37696)

(assert (=> b!1147578 (= e!652747 e!652746)))

(declare-fun c!113316 () Bool)

(declare-fun lt!512791 () Bool)

(assert (=> b!1147578 (= c!113316 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512791))))

(declare-fun b!1147579 () Bool)

(declare-fun call!52823 () Bool)

(assert (=> b!1147579 call!52823))

(declare-fun lt!512800 () Unit!37696)

(assert (=> b!1147579 (= lt!512800 call!52820)))

(assert (=> b!1147579 (= e!652746 lt!512800)))

(declare-fun b!1147580 () Bool)

(declare-fun res!763812 () Bool)

(assert (=> b!1147580 (=> (not res!763812) (not e!652753))))

(assert (=> b!1147580 (= res!763812 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36413 _keys!1208))))))

(declare-fun call!52822 () ListLongMap!16297)

(declare-fun b!1147581 () Bool)

(declare-fun call!52825 () ListLongMap!16297)

(declare-fun -!1300 (ListLongMap!16297 (_ BitVec 64)) ListLongMap!16297)

(assert (=> b!1147581 (= e!652752 (= call!52825 (-!1300 call!52822 k0!934)))))

(declare-fun b!1147582 () Bool)

(declare-fun e!652759 () Unit!37696)

(declare-fun Unit!37699 () Unit!37696)

(assert (=> b!1147582 (= e!652759 Unit!37699)))

(declare-fun b!1147583 () Bool)

(declare-fun res!763823 () Bool)

(assert (=> b!1147583 (=> (not res!763823) (not e!652753))))

(assert (=> b!1147583 (= res!763823 (= (select (arr!35877 _keys!1208) i!673) k0!934))))

(declare-fun e!652745 () Bool)

(declare-fun b!1147584 () Bool)

(assert (=> b!1147584 (= e!652745 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512791) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147585 () Bool)

(declare-fun res!763809 () Bool)

(assert (=> b!1147585 (=> (not res!763809) (not e!652753))))

(declare-datatypes ((List!25080 0))(
  ( (Nil!25077) (Cons!25076 (h!26285 (_ BitVec 64)) (t!36345 List!25080)) )
))
(declare-fun arrayNoDuplicates!0 (array!74453 (_ BitVec 32) List!25080) Bool)

(assert (=> b!1147585 (= res!763809 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25077))))

(declare-fun b!1147586 () Bool)

(assert (=> b!1147586 (contains!6687 call!52824 k0!934)))

(declare-fun lt!512801 () Unit!37696)

(assert (=> b!1147586 (= lt!512801 call!52821)))

(assert (=> b!1147586 call!52819))

(assert (=> b!1147586 (= lt!512794 (+!3587 lt!512807 (tuple2!18329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512809 () Unit!37696)

(assert (=> b!1147586 (= lt!512809 (addStillContains!838 lt!512807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!652751 () Unit!37696)

(assert (=> b!1147586 (= e!652751 lt!512801)))

(declare-fun bm!52819 () Bool)

(assert (=> bm!52819 (= call!52818 call!52824)))

(declare-fun b!1147587 () Bool)

(declare-fun e!652756 () Bool)

(declare-fun e!652755 () Bool)

(assert (=> b!1147587 (= e!652756 (not e!652755))))

(declare-fun res!763811 () Bool)

(assert (=> b!1147587 (=> res!763811 e!652755)))

(assert (=> b!1147587 (= res!763811 (bvsgt from!1455 i!673))))

(assert (=> b!1147587 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512799 () Unit!37696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74453 (_ BitVec 64) (_ BitVec 32)) Unit!37696)

(assert (=> b!1147587 (= lt!512799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun lt!512806 () array!74455)

(declare-fun bm!52820 () Bool)

(declare-fun lt!512805 () array!74453)

(declare-fun getCurrentListMapNoExtraKeys!4638 (array!74453 array!74455 (_ BitVec 32) (_ BitVec 32) V!43531 V!43531 (_ BitVec 32) Int) ListLongMap!16297)

(assert (=> bm!52820 (= call!52825 (getCurrentListMapNoExtraKeys!4638 lt!512805 lt!512806 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147588 () Bool)

(assert (=> b!1147588 (= e!652748 tp_is_empty!28803)))

(declare-fun b!1147589 () Bool)

(assert (=> b!1147589 (= c!113319 (and (not lt!512791) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147589 (= e!652751 e!652747)))

(declare-fun b!1147590 () Bool)

(declare-fun res!763817 () Bool)

(assert (=> b!1147590 (=> (not res!763817) (not e!652756))))

(assert (=> b!1147590 (= res!763817 (arrayNoDuplicates!0 lt!512805 #b00000000000000000000000000000000 Nil!25077))))

(declare-fun b!1147591 () Bool)

(declare-fun lt!512796 () Unit!37696)

(assert (=> b!1147591 (= e!652747 lt!512796)))

(assert (=> b!1147591 (= lt!512796 call!52820)))

(assert (=> b!1147591 call!52823))

(declare-fun b!1147592 () Bool)

(declare-fun Unit!37700 () Unit!37696)

(assert (=> b!1147592 (= e!652759 Unit!37700)))

(assert (=> b!1147592 (= lt!512791 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147592 (= c!113320 (and (not lt!512791) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512798 () Unit!37696)

(assert (=> b!1147592 (= lt!512798 e!652751)))

(declare-fun lt!512797 () Unit!37696)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!432 (array!74453 array!74455 (_ BitVec 32) (_ BitVec 32) V!43531 V!43531 (_ BitVec 64) (_ BitVec 32) Int) Unit!37696)

(assert (=> b!1147592 (= lt!512797 (lemmaListMapContainsThenArrayContainsFrom!432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113317 () Bool)

(assert (=> b!1147592 (= c!113317 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763818 () Bool)

(assert (=> b!1147592 (= res!763818 e!652745)))

(assert (=> b!1147592 (=> (not res!763818) (not e!652749))))

(assert (=> b!1147592 e!652749))

(declare-fun lt!512802 () Unit!37696)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74453 (_ BitVec 32) (_ BitVec 32)) Unit!37696)

(assert (=> b!1147592 (= lt!512802 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147592 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25077)))

(declare-fun lt!512795 () Unit!37696)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74453 (_ BitVec 64) (_ BitVec 32) List!25080) Unit!37696)

(assert (=> b!1147592 (= lt!512795 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25077))))

(assert (=> b!1147592 false))

(declare-fun b!1147593 () Bool)

(assert (=> b!1147593 (= e!652752 (= call!52825 call!52822))))

(declare-fun bm!52821 () Bool)

(assert (=> bm!52821 (= call!52822 (getCurrentListMapNoExtraKeys!4638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147594 () Bool)

(declare-fun res!763815 () Bool)

(assert (=> b!1147594 (=> (not res!763815) (not e!652753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147594 (= res!763815 (validMask!0 mask!1564))))

(declare-fun lt!512808 () ListLongMap!16297)

(declare-fun b!1147595 () Bool)

(declare-fun e!652757 () Bool)

(assert (=> b!1147595 (= e!652757 (= (-!1300 lt!512808 k0!934) lt!512807))))

(declare-fun b!1147596 () Bool)

(assert (=> b!1147596 (= e!652745 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!763810 () Bool)

(assert (=> start!98668 (=> (not res!763810) (not e!652753))))

(assert (=> start!98668 (= res!763810 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36413 _keys!1208))))))

(assert (=> start!98668 e!652753))

(assert (=> start!98668 tp_is_empty!28803))

(declare-fun array_inv!27480 (array!74453) Bool)

(assert (=> start!98668 (array_inv!27480 _keys!1208)))

(assert (=> start!98668 true))

(assert (=> start!98668 tp!85530))

(declare-fun array_inv!27481 (array!74455) Bool)

(assert (=> start!98668 (and (array_inv!27481 _values!996) e!652754)))

(declare-fun b!1147597 () Bool)

(assert (=> b!1147597 (= e!652755 e!652760)))

(declare-fun res!763819 () Bool)

(assert (=> b!1147597 (=> res!763819 e!652760)))

(assert (=> b!1147597 (= res!763819 (not (= from!1455 i!673)))))

(declare-fun lt!512803 () ListLongMap!16297)

(assert (=> b!1147597 (= lt!512803 (getCurrentListMapNoExtraKeys!4638 lt!512805 lt!512806 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512793 () V!43531)

(assert (=> b!1147597 (= lt!512806 (array!74456 (store (arr!35878 _values!996) i!673 (ValueCellFull!13692 lt!512793)) (size!36414 _values!996)))))

(declare-fun dynLambda!2668 (Int (_ BitVec 64)) V!43531)

(assert (=> b!1147597 (= lt!512793 (dynLambda!2668 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147597 (= lt!512808 (getCurrentListMapNoExtraKeys!4638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147598 () Bool)

(assert (=> b!1147598 (= e!652753 e!652756)))

(declare-fun res!763816 () Bool)

(assert (=> b!1147598 (=> (not res!763816) (not e!652756))))

(assert (=> b!1147598 (= res!763816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512805 mask!1564))))

(assert (=> b!1147598 (= lt!512805 (array!74454 (store (arr!35877 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36413 _keys!1208)))))

(declare-fun bm!52822 () Bool)

(assert (=> bm!52822 (= call!52823 call!52819)))

(declare-fun b!1147599 () Bool)

(assert (=> b!1147599 (= e!652758 true)))

(assert (=> b!1147599 e!652757))

(declare-fun res!763821 () Bool)

(assert (=> b!1147599 (=> (not res!763821) (not e!652757))))

(declare-fun lt!512804 () V!43531)

(assert (=> b!1147599 (= res!763821 (= (-!1300 (+!3587 lt!512807 (tuple2!18329 (select (arr!35877 _keys!1208) from!1455) lt!512804)) (select (arr!35877 _keys!1208) from!1455)) lt!512807))))

(declare-fun lt!512792 () Unit!37696)

(declare-fun addThenRemoveForNewKeyIsSame!148 (ListLongMap!16297 (_ BitVec 64) V!43531) Unit!37696)

(assert (=> b!1147599 (= lt!512792 (addThenRemoveForNewKeyIsSame!148 lt!512807 (select (arr!35877 _keys!1208) from!1455) lt!512804))))

(declare-fun get!18252 (ValueCell!13692 V!43531) V!43531)

(assert (=> b!1147599 (= lt!512804 (get!18252 (select (arr!35878 _values!996) from!1455) lt!512793))))

(declare-fun lt!512811 () Unit!37696)

(assert (=> b!1147599 (= lt!512811 e!652759)))

(declare-fun c!113315 () Bool)

(assert (=> b!1147599 (= c!113315 (contains!6687 lt!512807 k0!934))))

(assert (=> b!1147599 (= lt!512807 (getCurrentListMapNoExtraKeys!4638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98668 res!763810) b!1147594))

(assert (= (and b!1147594 res!763815) b!1147575))

(assert (= (and b!1147575 res!763813) b!1147576))

(assert (= (and b!1147576 res!763814) b!1147585))

(assert (= (and b!1147585 res!763809) b!1147580))

(assert (= (and b!1147580 res!763812) b!1147577))

(assert (= (and b!1147577 res!763822) b!1147583))

(assert (= (and b!1147583 res!763823) b!1147598))

(assert (= (and b!1147598 res!763816) b!1147590))

(assert (= (and b!1147590 res!763817) b!1147587))

(assert (= (and b!1147587 (not res!763811)) b!1147597))

(assert (= (and b!1147597 (not res!763819)) b!1147571))

(assert (= (and b!1147571 c!113318) b!1147581))

(assert (= (and b!1147571 (not c!113318)) b!1147593))

(assert (= (or b!1147581 b!1147593) bm!52820))

(assert (= (or b!1147581 b!1147593) bm!52821))

(assert (= (and b!1147571 (not res!763820)) b!1147599))

(assert (= (and b!1147599 c!113315) b!1147592))

(assert (= (and b!1147599 (not c!113315)) b!1147582))

(assert (= (and b!1147592 c!113320) b!1147586))

(assert (= (and b!1147592 (not c!113320)) b!1147589))

(assert (= (and b!1147589 c!113319) b!1147591))

(assert (= (and b!1147589 (not c!113319)) b!1147578))

(assert (= (and b!1147578 c!113316) b!1147579))

(assert (= (and b!1147578 (not c!113316)) b!1147570))

(assert (= (or b!1147591 b!1147579) bm!52815))

(assert (= (or b!1147591 b!1147579) bm!52819))

(assert (= (or b!1147591 b!1147579) bm!52822))

(assert (= (or b!1147586 bm!52822) bm!52816))

(assert (= (or b!1147586 bm!52815) bm!52818))

(assert (= (or b!1147586 bm!52819) bm!52817))

(assert (= (and b!1147592 c!113317) b!1147596))

(assert (= (and b!1147592 (not c!113317)) b!1147584))

(assert (= (and b!1147592 res!763818) b!1147572))

(assert (= (and b!1147599 res!763821) b!1147595))

(assert (= (and b!1147574 condMapEmpty!45029) mapIsEmpty!45029))

(assert (= (and b!1147574 (not condMapEmpty!45029)) mapNonEmpty!45029))

(get-info :version)

(assert (= (and mapNonEmpty!45029 ((_ is ValueCellFull!13692) mapValue!45029)) b!1147588))

(assert (= (and b!1147574 ((_ is ValueCellFull!13692) mapDefault!45029)) b!1147573))

(assert (= start!98668 b!1147574))

(declare-fun b_lambda!19379 () Bool)

(assert (=> (not b_lambda!19379) (not b!1147597)))

(declare-fun t!36343 () Bool)

(declare-fun tb!9085 () Bool)

(assert (=> (and start!98668 (= defaultEntry!1004 defaultEntry!1004) t!36343) tb!9085))

(declare-fun result!18735 () Bool)

(assert (=> tb!9085 (= result!18735 tp_is_empty!28803)))

(assert (=> b!1147597 t!36343))

(declare-fun b_and!39397 () Bool)

(assert (= b_and!39395 (and (=> t!36343 result!18735) b_and!39397)))

(declare-fun m!1058181 () Bool)

(assert (=> b!1147581 m!1058181))

(declare-fun m!1058183 () Bool)

(assert (=> b!1147585 m!1058183))

(declare-fun m!1058185 () Bool)

(assert (=> b!1147595 m!1058185))

(declare-fun m!1058187 () Bool)

(assert (=> b!1147592 m!1058187))

(declare-fun m!1058189 () Bool)

(assert (=> b!1147592 m!1058189))

(declare-fun m!1058191 () Bool)

(assert (=> b!1147592 m!1058191))

(declare-fun m!1058193 () Bool)

(assert (=> b!1147592 m!1058193))

(declare-fun m!1058195 () Bool)

(assert (=> bm!52817 m!1058195))

(declare-fun m!1058197 () Bool)

(assert (=> mapNonEmpty!45029 m!1058197))

(declare-fun m!1058199 () Bool)

(assert (=> bm!52818 m!1058199))

(declare-fun m!1058201 () Bool)

(assert (=> b!1147597 m!1058201))

(declare-fun m!1058203 () Bool)

(assert (=> b!1147597 m!1058203))

(declare-fun m!1058205 () Bool)

(assert (=> b!1147597 m!1058205))

(declare-fun m!1058207 () Bool)

(assert (=> b!1147597 m!1058207))

(declare-fun m!1058209 () Bool)

(assert (=> b!1147576 m!1058209))

(declare-fun m!1058211 () Bool)

(assert (=> b!1147583 m!1058211))

(declare-fun m!1058213 () Bool)

(assert (=> b!1147590 m!1058213))

(declare-fun m!1058215 () Bool)

(assert (=> b!1147598 m!1058215))

(declare-fun m!1058217 () Bool)

(assert (=> b!1147598 m!1058217))

(declare-fun m!1058219 () Bool)

(assert (=> b!1147596 m!1058219))

(declare-fun m!1058221 () Bool)

(assert (=> b!1147594 m!1058221))

(declare-fun m!1058223 () Bool)

(assert (=> start!98668 m!1058223))

(declare-fun m!1058225 () Bool)

(assert (=> start!98668 m!1058225))

(declare-fun m!1058227 () Bool)

(assert (=> bm!52821 m!1058227))

(declare-fun m!1058229 () Bool)

(assert (=> b!1147577 m!1058229))

(declare-fun m!1058231 () Bool)

(assert (=> b!1147587 m!1058231))

(declare-fun m!1058233 () Bool)

(assert (=> b!1147587 m!1058233))

(declare-fun m!1058235 () Bool)

(assert (=> bm!52820 m!1058235))

(assert (=> b!1147572 m!1058219))

(declare-fun m!1058237 () Bool)

(assert (=> b!1147586 m!1058237))

(declare-fun m!1058239 () Bool)

(assert (=> b!1147586 m!1058239))

(declare-fun m!1058241 () Bool)

(assert (=> b!1147586 m!1058241))

(assert (=> b!1147599 m!1058227))

(declare-fun m!1058243 () Bool)

(assert (=> b!1147599 m!1058243))

(declare-fun m!1058245 () Bool)

(assert (=> b!1147599 m!1058245))

(declare-fun m!1058247 () Bool)

(assert (=> b!1147599 m!1058247))

(declare-fun m!1058249 () Bool)

(assert (=> b!1147599 m!1058249))

(declare-fun m!1058251 () Bool)

(assert (=> b!1147599 m!1058251))

(assert (=> b!1147599 m!1058247))

(declare-fun m!1058253 () Bool)

(assert (=> b!1147599 m!1058253))

(assert (=> b!1147599 m!1058245))

(assert (=> b!1147599 m!1058247))

(assert (=> b!1147599 m!1058243))

(declare-fun m!1058255 () Bool)

(assert (=> b!1147599 m!1058255))

(declare-fun m!1058257 () Bool)

(assert (=> bm!52816 m!1058257))

(assert (=> b!1147571 m!1058247))

(declare-fun m!1058259 () Bool)

(assert (=> b!1147571 m!1058259))

(check-sat (not b!1147581) tp_is_empty!28803 (not start!98668) (not b!1147592) (not b!1147595) (not b!1147599) (not b!1147598) (not b!1147572) (not bm!52818) (not bm!52816) (not b!1147585) (not b!1147576) (not b!1147590) (not b!1147596) (not b!1147571) (not b!1147577) (not b!1147587) (not b!1147586) b_and!39397 (not bm!52821) (not mapNonEmpty!45029) (not bm!52817) (not b!1147594) (not b_next!24273) (not bm!52820) (not b!1147597) (not b_lambda!19379))
(check-sat b_and!39397 (not b_next!24273))
