; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98822 () Bool)

(assert start!98822)

(declare-fun b_free!24433 () Bool)

(declare-fun b_next!24433 () Bool)

(assert (=> start!98822 (= b_free!24433 (not b_next!24433))))

(declare-fun tp!86010 () Bool)

(declare-fun b_and!39693 () Bool)

(assert (=> start!98822 (= tp!86010 b_and!39693)))

(declare-fun b!1154806 () Bool)

(declare-fun e!656754 () Bool)

(declare-fun e!656756 () Bool)

(assert (=> b!1154806 (= e!656754 e!656756)))

(declare-fun res!767345 () Bool)

(assert (=> b!1154806 (=> (not res!767345) (not e!656756))))

(declare-datatypes ((array!74690 0))(
  ( (array!74691 (arr!35996 (Array (_ BitVec 32) (_ BitVec 64))) (size!36534 (_ BitVec 32))) )
))
(declare-fun lt!517833 () array!74690)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74690 (_ BitVec 32)) Bool)

(assert (=> b!1154806 (= res!767345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517833 mask!1564))))

(declare-fun _keys!1208 () array!74690)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154806 (= lt!517833 (array!74691 (store (arr!35996 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36534 _keys!1208)))))

(declare-datatypes ((V!43745 0))(
  ( (V!43746 (val!14538 Int)) )
))
(declare-datatypes ((tuple2!18560 0))(
  ( (tuple2!18561 (_1!9291 (_ BitVec 64)) (_2!9291 V!43745)) )
))
(declare-datatypes ((List!25290 0))(
  ( (Nil!25287) (Cons!25286 (h!26495 tuple2!18560) (t!36706 List!25290)) )
))
(declare-datatypes ((ListLongMap!16529 0))(
  ( (ListLongMap!16530 (toList!8280 List!25290)) )
))
(declare-fun call!54718 () ListLongMap!16529)

(declare-fun call!54720 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!54712 () Bool)

(declare-fun c!114731 () Bool)

(declare-fun lt!517835 () ListLongMap!16529)

(declare-fun contains!6732 (ListLongMap!16529 (_ BitVec 64)) Bool)

(assert (=> bm!54712 (= call!54720 (contains!6732 (ite c!114731 lt!517835 call!54718) k0!934))))

(declare-fun b!1154807 () Bool)

(declare-fun e!656748 () Bool)

(declare-fun e!656747 () Bool)

(assert (=> b!1154807 (= e!656748 e!656747)))

(declare-fun res!767357 () Bool)

(assert (=> b!1154807 (=> res!767357 e!656747)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1154807 (= res!767357 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13772 0))(
  ( (ValueCellFull!13772 (v!17174 V!43745)) (EmptyCell!13772) )
))
(declare-datatypes ((array!74692 0))(
  ( (array!74693 (arr!35997 (Array (_ BitVec 32) ValueCell!13772)) (size!36535 (_ BitVec 32))) )
))
(declare-fun lt!517836 () array!74692)

(declare-fun minValue!944 () V!43745)

(declare-fun zeroValue!944 () V!43745)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!517837 () ListLongMap!16529)

(declare-fun getCurrentListMapNoExtraKeys!4761 (array!74690 array!74692 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 32) Int) ListLongMap!16529)

(assert (=> b!1154807 (= lt!517837 (getCurrentListMapNoExtraKeys!4761 lt!517833 lt!517836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517851 () V!43745)

(declare-fun _values!996 () array!74692)

(assert (=> b!1154807 (= lt!517836 (array!74693 (store (arr!35997 _values!996) i!673 (ValueCellFull!13772 lt!517851)) (size!36535 _values!996)))))

(declare-fun dynLambda!2720 (Int (_ BitVec 64)) V!43745)

(assert (=> b!1154807 (= lt!517851 (dynLambda!2720 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517832 () ListLongMap!16529)

(assert (=> b!1154807 (= lt!517832 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154808 () Bool)

(declare-fun c!114733 () Bool)

(declare-fun lt!517847 () Bool)

(assert (=> b!1154808 (= c!114733 (and (not lt!517847) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37861 0))(
  ( (Unit!37862) )
))
(declare-fun e!656755 () Unit!37861)

(declare-fun e!656749 () Unit!37861)

(assert (=> b!1154808 (= e!656755 e!656749)))

(declare-fun b!1154809 () Bool)

(declare-fun e!656761 () Bool)

(declare-fun tp_is_empty!28963 () Bool)

(assert (=> b!1154809 (= e!656761 tp_is_empty!28963)))

(declare-fun res!767352 () Bool)

(assert (=> start!98822 (=> (not res!767352) (not e!656754))))

(assert (=> start!98822 (= res!767352 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36534 _keys!1208))))))

(assert (=> start!98822 e!656754))

(assert (=> start!98822 tp_is_empty!28963))

(declare-fun array_inv!27662 (array!74690) Bool)

(assert (=> start!98822 (array_inv!27662 _keys!1208)))

(assert (=> start!98822 true))

(assert (=> start!98822 tp!86010))

(declare-fun e!656763 () Bool)

(declare-fun array_inv!27663 (array!74692) Bool)

(assert (=> start!98822 (and (array_inv!27663 _values!996) e!656763)))

(declare-fun b!1154810 () Bool)

(declare-fun res!767343 () Bool)

(assert (=> b!1154810 (=> (not res!767343) (not e!656754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154810 (= res!767343 (validMask!0 mask!1564))))

(declare-fun e!656762 () Bool)

(declare-fun call!54716 () ListLongMap!16529)

(declare-fun call!54722 () ListLongMap!16529)

(declare-fun b!1154811 () Bool)

(declare-fun -!1339 (ListLongMap!16529 (_ BitVec 64)) ListLongMap!16529)

(assert (=> b!1154811 (= e!656762 (= call!54722 (-!1339 call!54716 k0!934)))))

(declare-fun b!1154812 () Bool)

(declare-fun res!767355 () Bool)

(assert (=> b!1154812 (=> (not res!767355) (not e!656754))))

(assert (=> b!1154812 (= res!767355 (and (= (size!36535 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36534 _keys!1208) (size!36535 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!656759 () Bool)

(declare-fun b!1154813 () Bool)

(declare-fun arrayContainsKey!0 (array!74690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154813 (= e!656759 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54713 () Bool)

(assert (=> bm!54713 (= call!54722 (getCurrentListMapNoExtraKeys!4761 lt!517833 lt!517836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54714 () Bool)

(declare-fun call!54715 () ListLongMap!16529)

(assert (=> bm!54714 (= call!54718 call!54715)))

(declare-fun b!1154814 () Bool)

(declare-fun e!656752 () Bool)

(assert (=> b!1154814 (= e!656747 e!656752)))

(declare-fun res!767347 () Bool)

(assert (=> b!1154814 (=> res!767347 e!656752)))

(assert (=> b!1154814 (= res!767347 (not (= (select (arr!35996 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1154814 e!656762))

(declare-fun c!114730 () Bool)

(assert (=> b!1154814 (= c!114730 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517844 () Unit!37861)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!611 (array!74690 array!74692 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37861)

(assert (=> b!1154814 (= lt!517844 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!611 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154815 () Bool)

(declare-fun +!3691 (ListLongMap!16529 tuple2!18560) ListLongMap!16529)

(assert (=> b!1154815 (contains!6732 (+!3691 lt!517835 (tuple2!18561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517845 () Unit!37861)

(declare-fun call!54721 () Unit!37861)

(assert (=> b!1154815 (= lt!517845 call!54721)))

(assert (=> b!1154815 call!54720))

(assert (=> b!1154815 (= lt!517835 call!54715)))

(declare-fun lt!517849 () Unit!37861)

(declare-fun lt!517841 () ListLongMap!16529)

(declare-fun addStillContains!903 (ListLongMap!16529 (_ BitVec 64) V!43745 (_ BitVec 64)) Unit!37861)

(assert (=> b!1154815 (= lt!517849 (addStillContains!903 lt!517841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1154815 (= e!656755 lt!517845)))

(declare-fun b!1154816 () Bool)

(declare-fun res!767349 () Bool)

(assert (=> b!1154816 (=> (not res!767349) (not e!656754))))

(assert (=> b!1154816 (= res!767349 (= (select (arr!35996 _keys!1208) i!673) k0!934))))

(declare-fun b!1154817 () Bool)

(declare-fun res!767350 () Bool)

(assert (=> b!1154817 (=> (not res!767350) (not e!656754))))

(assert (=> b!1154817 (= res!767350 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36534 _keys!1208))))))

(declare-fun b!1154818 () Bool)

(declare-fun res!767356 () Bool)

(assert (=> b!1154818 (=> (not res!767356) (not e!656754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154818 (= res!767356 (validKeyInArray!0 k0!934))))

(declare-fun b!1154819 () Bool)

(declare-fun e!656753 () Unit!37861)

(declare-fun Unit!37863 () Unit!37861)

(assert (=> b!1154819 (= e!656753 Unit!37863)))

(declare-fun bm!54715 () Bool)

(assert (=> bm!54715 (= call!54715 (+!3691 lt!517841 (ite (or c!114731 c!114733) (tuple2!18561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1154820 () Bool)

(assert (=> b!1154820 (= e!656756 (not e!656748))))

(declare-fun res!767344 () Bool)

(assert (=> b!1154820 (=> res!767344 e!656748)))

(assert (=> b!1154820 (= res!767344 (bvsgt from!1455 i!673))))

(assert (=> b!1154820 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517843 () Unit!37861)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74690 (_ BitVec 64) (_ BitVec 32)) Unit!37861)

(assert (=> b!1154820 (= lt!517843 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!54716 () Bool)

(assert (=> bm!54716 (= call!54716 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154821 () Bool)

(declare-fun e!656760 () Bool)

(assert (=> b!1154821 (= e!656760 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154822 () Bool)

(declare-fun Unit!37864 () Unit!37861)

(assert (=> b!1154822 (= e!656753 Unit!37864)))

(assert (=> b!1154822 (= lt!517847 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154822 (= c!114731 (and (not lt!517847) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517840 () Unit!37861)

(assert (=> b!1154822 (= lt!517840 e!656755)))

(declare-fun lt!517846 () Unit!37861)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!489 (array!74690 array!74692 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 64) (_ BitVec 32) Int) Unit!37861)

(assert (=> b!1154822 (= lt!517846 (lemmaListMapContainsThenArrayContainsFrom!489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114732 () Bool)

(assert (=> b!1154822 (= c!114732 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767346 () Bool)

(assert (=> b!1154822 (= res!767346 e!656760)))

(assert (=> b!1154822 (=> (not res!767346) (not e!656759))))

(assert (=> b!1154822 e!656759))

(declare-fun lt!517850 () Unit!37861)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74690 (_ BitVec 32) (_ BitVec 32)) Unit!37861)

(assert (=> b!1154822 (= lt!517850 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25291 0))(
  ( (Nil!25288) (Cons!25287 (h!26496 (_ BitVec 64)) (t!36707 List!25291)) )
))
(declare-fun arrayNoDuplicates!0 (array!74690 (_ BitVec 32) List!25291) Bool)

(assert (=> b!1154822 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25288)))

(declare-fun lt!517842 () Unit!37861)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74690 (_ BitVec 64) (_ BitVec 32) List!25291) Unit!37861)

(assert (=> b!1154822 (= lt!517842 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25288))))

(assert (=> b!1154822 false))

(declare-fun b!1154823 () Bool)

(declare-fun call!54717 () Bool)

(assert (=> b!1154823 call!54717))

(declare-fun lt!517848 () Unit!37861)

(declare-fun call!54719 () Unit!37861)

(assert (=> b!1154823 (= lt!517848 call!54719)))

(declare-fun e!656757 () Unit!37861)

(assert (=> b!1154823 (= e!656757 lt!517848)))

(declare-fun b!1154824 () Bool)

(declare-fun res!767351 () Bool)

(assert (=> b!1154824 (=> (not res!767351) (not e!656756))))

(assert (=> b!1154824 (= res!767351 (arrayNoDuplicates!0 lt!517833 #b00000000000000000000000000000000 Nil!25288))))

(declare-fun b!1154825 () Bool)

(declare-fun lt!517838 () Unit!37861)

(assert (=> b!1154825 (= e!656749 lt!517838)))

(assert (=> b!1154825 (= lt!517838 call!54719)))

(assert (=> b!1154825 call!54717))

(declare-fun b!1154826 () Bool)

(declare-fun res!767354 () Bool)

(assert (=> b!1154826 (=> (not res!767354) (not e!656754))))

(assert (=> b!1154826 (= res!767354 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25288))))

(declare-fun b!1154827 () Bool)

(assert (=> b!1154827 (= e!656762 (= call!54722 call!54716))))

(declare-fun b!1154828 () Bool)

(declare-fun e!656750 () Bool)

(assert (=> b!1154828 (= e!656750 tp_is_empty!28963)))

(declare-fun b!1154829 () Bool)

(declare-fun res!767353 () Bool)

(assert (=> b!1154829 (=> (not res!767353) (not e!656754))))

(assert (=> b!1154829 (= res!767353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154830 () Bool)

(declare-fun Unit!37865 () Unit!37861)

(assert (=> b!1154830 (= e!656757 Unit!37865)))

(declare-fun b!1154831 () Bool)

(declare-fun mapRes!45269 () Bool)

(assert (=> b!1154831 (= e!656763 (and e!656761 mapRes!45269))))

(declare-fun condMapEmpty!45269 () Bool)

(declare-fun mapDefault!45269 () ValueCell!13772)

(assert (=> b!1154831 (= condMapEmpty!45269 (= (arr!35997 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13772)) mapDefault!45269)))))

(declare-fun bm!54717 () Bool)

(assert (=> bm!54717 (= call!54719 call!54721)))

(declare-fun b!1154832 () Bool)

(assert (=> b!1154832 (= e!656749 e!656757)))

(declare-fun c!114729 () Bool)

(assert (=> b!1154832 (= c!114729 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517847))))

(declare-fun b!1154833 () Bool)

(assert (=> b!1154833 (= e!656752 true)))

(declare-fun e!656751 () Bool)

(assert (=> b!1154833 e!656751))

(declare-fun res!767348 () Bool)

(assert (=> b!1154833 (=> (not res!767348) (not e!656751))))

(declare-fun lt!517830 () ListLongMap!16529)

(assert (=> b!1154833 (= res!767348 (= lt!517830 lt!517841))))

(assert (=> b!1154833 (= lt!517830 (-!1339 lt!517832 k0!934))))

(declare-fun lt!517831 () V!43745)

(assert (=> b!1154833 (= (-!1339 (+!3691 lt!517841 (tuple2!18561 (select (arr!35996 _keys!1208) from!1455) lt!517831)) (select (arr!35996 _keys!1208) from!1455)) lt!517841)))

(declare-fun lt!517834 () Unit!37861)

(declare-fun addThenRemoveForNewKeyIsSame!192 (ListLongMap!16529 (_ BitVec 64) V!43745) Unit!37861)

(assert (=> b!1154833 (= lt!517834 (addThenRemoveForNewKeyIsSame!192 lt!517841 (select (arr!35996 _keys!1208) from!1455) lt!517831))))

(declare-fun get!18350 (ValueCell!13772 V!43745) V!43745)

(assert (=> b!1154833 (= lt!517831 (get!18350 (select (arr!35997 _values!996) from!1455) lt!517851))))

(declare-fun lt!517839 () Unit!37861)

(assert (=> b!1154833 (= lt!517839 e!656753)))

(declare-fun c!114734 () Bool)

(assert (=> b!1154833 (= c!114734 (contains!6732 lt!517841 k0!934))))

(assert (=> b!1154833 (= lt!517841 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154834 () Bool)

(assert (=> b!1154834 (= e!656760 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517847) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54718 () Bool)

(assert (=> bm!54718 (= call!54717 call!54720)))

(declare-fun b!1154835 () Bool)

(assert (=> b!1154835 (= e!656751 (= lt!517830 (getCurrentListMapNoExtraKeys!4761 lt!517833 lt!517836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45269 () Bool)

(assert (=> mapIsEmpty!45269 mapRes!45269))

(declare-fun bm!54719 () Bool)

(assert (=> bm!54719 (= call!54721 (addStillContains!903 (ite c!114731 lt!517835 lt!517841) (ite c!114731 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114733 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114731 minValue!944 (ite c!114733 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!45269 () Bool)

(declare-fun tp!86009 () Bool)

(assert (=> mapNonEmpty!45269 (= mapRes!45269 (and tp!86009 e!656750))))

(declare-fun mapKey!45269 () (_ BitVec 32))

(declare-fun mapValue!45269 () ValueCell!13772)

(declare-fun mapRest!45269 () (Array (_ BitVec 32) ValueCell!13772))

(assert (=> mapNonEmpty!45269 (= (arr!35997 _values!996) (store mapRest!45269 mapKey!45269 mapValue!45269))))

(assert (= (and start!98822 res!767352) b!1154810))

(assert (= (and b!1154810 res!767343) b!1154812))

(assert (= (and b!1154812 res!767355) b!1154829))

(assert (= (and b!1154829 res!767353) b!1154826))

(assert (= (and b!1154826 res!767354) b!1154817))

(assert (= (and b!1154817 res!767350) b!1154818))

(assert (= (and b!1154818 res!767356) b!1154816))

(assert (= (and b!1154816 res!767349) b!1154806))

(assert (= (and b!1154806 res!767345) b!1154824))

(assert (= (and b!1154824 res!767351) b!1154820))

(assert (= (and b!1154820 (not res!767344)) b!1154807))

(assert (= (and b!1154807 (not res!767357)) b!1154814))

(assert (= (and b!1154814 c!114730) b!1154811))

(assert (= (and b!1154814 (not c!114730)) b!1154827))

(assert (= (or b!1154811 b!1154827) bm!54713))

(assert (= (or b!1154811 b!1154827) bm!54716))

(assert (= (and b!1154814 (not res!767347)) b!1154833))

(assert (= (and b!1154833 c!114734) b!1154822))

(assert (= (and b!1154833 (not c!114734)) b!1154819))

(assert (= (and b!1154822 c!114731) b!1154815))

(assert (= (and b!1154822 (not c!114731)) b!1154808))

(assert (= (and b!1154808 c!114733) b!1154825))

(assert (= (and b!1154808 (not c!114733)) b!1154832))

(assert (= (and b!1154832 c!114729) b!1154823))

(assert (= (and b!1154832 (not c!114729)) b!1154830))

(assert (= (or b!1154825 b!1154823) bm!54717))

(assert (= (or b!1154825 b!1154823) bm!54714))

(assert (= (or b!1154825 b!1154823) bm!54718))

(assert (= (or b!1154815 bm!54718) bm!54712))

(assert (= (or b!1154815 bm!54717) bm!54719))

(assert (= (or b!1154815 bm!54714) bm!54715))

(assert (= (and b!1154822 c!114732) b!1154821))

(assert (= (and b!1154822 (not c!114732)) b!1154834))

(assert (= (and b!1154822 res!767346) b!1154813))

(assert (= (and b!1154833 res!767348) b!1154835))

(assert (= (and b!1154831 condMapEmpty!45269) mapIsEmpty!45269))

(assert (= (and b!1154831 (not condMapEmpty!45269)) mapNonEmpty!45269))

(get-info :version)

(assert (= (and mapNonEmpty!45269 ((_ is ValueCellFull!13772) mapValue!45269)) b!1154828))

(assert (= (and b!1154831 ((_ is ValueCellFull!13772) mapDefault!45269)) b!1154809))

(assert (= start!98822 b!1154831))

(declare-fun b_lambda!19521 () Bool)

(assert (=> (not b_lambda!19521) (not b!1154807)))

(declare-fun t!36705 () Bool)

(declare-fun tb!9237 () Bool)

(assert (=> (and start!98822 (= defaultEntry!1004 defaultEntry!1004) t!36705) tb!9237))

(declare-fun result!19047 () Bool)

(assert (=> tb!9237 (= result!19047 tp_is_empty!28963)))

(assert (=> b!1154807 t!36705))

(declare-fun b_and!39695 () Bool)

(assert (= b_and!39693 (and (=> t!36705 result!19047) b_and!39695)))

(declare-fun m!1063987 () Bool)

(assert (=> b!1154824 m!1063987))

(declare-fun m!1063989 () Bool)

(assert (=> b!1154821 m!1063989))

(declare-fun m!1063991 () Bool)

(assert (=> b!1154826 m!1063991))

(declare-fun m!1063993 () Bool)

(assert (=> b!1154815 m!1063993))

(assert (=> b!1154815 m!1063993))

(declare-fun m!1063995 () Bool)

(assert (=> b!1154815 m!1063995))

(declare-fun m!1063997 () Bool)

(assert (=> b!1154815 m!1063997))

(declare-fun m!1063999 () Bool)

(assert (=> bm!54715 m!1063999))

(declare-fun m!1064001 () Bool)

(assert (=> b!1154811 m!1064001))

(declare-fun m!1064003 () Bool)

(assert (=> bm!54719 m!1064003))

(declare-fun m!1064005 () Bool)

(assert (=> b!1154818 m!1064005))

(declare-fun m!1064007 () Bool)

(assert (=> bm!54712 m!1064007))

(declare-fun m!1064009 () Bool)

(assert (=> b!1154833 m!1064009))

(declare-fun m!1064011 () Bool)

(assert (=> b!1154833 m!1064011))

(assert (=> b!1154833 m!1064011))

(declare-fun m!1064013 () Bool)

(assert (=> b!1154833 m!1064013))

(declare-fun m!1064015 () Bool)

(assert (=> b!1154833 m!1064015))

(assert (=> b!1154833 m!1064009))

(declare-fun m!1064017 () Bool)

(assert (=> b!1154833 m!1064017))

(assert (=> b!1154833 m!1064013))

(declare-fun m!1064019 () Bool)

(assert (=> b!1154833 m!1064019))

(declare-fun m!1064021 () Bool)

(assert (=> b!1154833 m!1064021))

(assert (=> b!1154833 m!1064013))

(declare-fun m!1064023 () Bool)

(assert (=> b!1154833 m!1064023))

(declare-fun m!1064025 () Bool)

(assert (=> b!1154833 m!1064025))

(declare-fun m!1064027 () Bool)

(assert (=> b!1154806 m!1064027))

(declare-fun m!1064029 () Bool)

(assert (=> b!1154806 m!1064029))

(declare-fun m!1064031 () Bool)

(assert (=> bm!54713 m!1064031))

(declare-fun m!1064033 () Bool)

(assert (=> b!1154822 m!1064033))

(declare-fun m!1064035 () Bool)

(assert (=> b!1154822 m!1064035))

(declare-fun m!1064037 () Bool)

(assert (=> b!1154822 m!1064037))

(declare-fun m!1064039 () Bool)

(assert (=> b!1154822 m!1064039))

(assert (=> b!1154814 m!1064013))

(declare-fun m!1064041 () Bool)

(assert (=> b!1154814 m!1064041))

(assert (=> b!1154813 m!1063989))

(declare-fun m!1064043 () Bool)

(assert (=> b!1154807 m!1064043))

(declare-fun m!1064045 () Bool)

(assert (=> b!1154807 m!1064045))

(declare-fun m!1064047 () Bool)

(assert (=> b!1154807 m!1064047))

(declare-fun m!1064049 () Bool)

(assert (=> b!1154807 m!1064049))

(assert (=> b!1154835 m!1064031))

(declare-fun m!1064051 () Bool)

(assert (=> b!1154816 m!1064051))

(declare-fun m!1064053 () Bool)

(assert (=> mapNonEmpty!45269 m!1064053))

(assert (=> bm!54716 m!1064023))

(declare-fun m!1064055 () Bool)

(assert (=> b!1154810 m!1064055))

(declare-fun m!1064057 () Bool)

(assert (=> start!98822 m!1064057))

(declare-fun m!1064059 () Bool)

(assert (=> start!98822 m!1064059))

(declare-fun m!1064061 () Bool)

(assert (=> b!1154829 m!1064061))

(declare-fun m!1064063 () Bool)

(assert (=> b!1154820 m!1064063))

(declare-fun m!1064065 () Bool)

(assert (=> b!1154820 m!1064065))

(check-sat (not bm!54719) (not bm!54716) (not b!1154833) (not b!1154807) (not b!1154814) (not bm!54712) tp_is_empty!28963 (not b!1154824) (not b!1154810) (not bm!54715) (not b!1154821) (not b_next!24433) (not b!1154806) (not b!1154811) (not start!98822) (not mapNonEmpty!45269) (not b!1154835) (not b!1154829) (not b_lambda!19521) b_and!39695 (not b!1154813) (not b!1154818) (not b!1154826) (not b!1154820) (not bm!54713) (not b!1154815) (not b!1154822))
(check-sat b_and!39695 (not b_next!24433))
