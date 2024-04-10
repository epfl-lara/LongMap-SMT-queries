; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98824 () Bool)

(assert start!98824)

(declare-fun b_free!24429 () Bool)

(declare-fun b_next!24429 () Bool)

(assert (=> start!98824 (= b_free!24429 (not b_next!24429))))

(declare-fun tp!85997 () Bool)

(declare-fun b_and!39707 () Bool)

(assert (=> start!98824 (= tp!85997 b_and!39707)))

(declare-fun mapIsEmpty!45263 () Bool)

(declare-fun mapRes!45263 () Bool)

(assert (=> mapIsEmpty!45263 mapRes!45263))

(declare-fun b!1154746 () Bool)

(declare-datatypes ((V!43739 0))(
  ( (V!43740 (val!14536 Int)) )
))
(declare-datatypes ((tuple2!18480 0))(
  ( (tuple2!18481 (_1!9251 (_ BitVec 64)) (_2!9251 V!43739)) )
))
(declare-datatypes ((List!25224 0))(
  ( (Nil!25221) (Cons!25220 (h!26429 tuple2!18480) (t!36645 List!25224)) )
))
(declare-datatypes ((ListLongMap!16449 0))(
  ( (ListLongMap!16450 (toList!8240 List!25224)) )
))
(declare-fun call!54696 () ListLongMap!16449)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6753 (ListLongMap!16449 (_ BitVec 64)) Bool)

(assert (=> b!1154746 (contains!6753 call!54696 k0!934)))

(declare-fun lt!517893 () ListLongMap!16449)

(declare-datatypes ((Unit!38016 0))(
  ( (Unit!38017) )
))
(declare-fun lt!517903 () Unit!38016)

(declare-fun minValue!944 () V!43739)

(declare-fun addStillContains!898 (ListLongMap!16449 (_ BitVec 64) V!43739 (_ BitVec 64)) Unit!38016)

(assert (=> b!1154746 (= lt!517903 (addStillContains!898 lt!517893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!54697 () Bool)

(assert (=> b!1154746 call!54697))

(declare-fun lt!517895 () ListLongMap!16449)

(declare-fun zeroValue!944 () V!43739)

(declare-fun +!3653 (ListLongMap!16449 tuple2!18480) ListLongMap!16449)

(assert (=> b!1154746 (= lt!517893 (+!3653 lt!517895 (tuple2!18481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517905 () Unit!38016)

(declare-fun call!54693 () Unit!38016)

(assert (=> b!1154746 (= lt!517905 call!54693)))

(declare-fun e!656727 () Unit!38016)

(assert (=> b!1154746 (= e!656727 lt!517903)))

(declare-fun b!1154747 () Bool)

(declare-fun e!656739 () Unit!38016)

(declare-fun Unit!38018 () Unit!38016)

(assert (=> b!1154747 (= e!656739 Unit!38018)))

(declare-fun lt!517894 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1154747 (= lt!517894 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114721 () Bool)

(assert (=> b!1154747 (= c!114721 (and (not lt!517894) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517892 () Unit!38016)

(assert (=> b!1154747 (= lt!517892 e!656727)))

(declare-datatypes ((array!74765 0))(
  ( (array!74766 (arr!36033 (Array (_ BitVec 32) (_ BitVec 64))) (size!36569 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74765)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13770 0))(
  ( (ValueCellFull!13770 (v!17173 V!43739)) (EmptyCell!13770) )
))
(declare-datatypes ((array!74767 0))(
  ( (array!74768 (arr!36034 (Array (_ BitVec 32) ValueCell!13770)) (size!36570 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74767)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!517900 () Unit!38016)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!488 (array!74765 array!74767 (_ BitVec 32) (_ BitVec 32) V!43739 V!43739 (_ BitVec 64) (_ BitVec 32) Int) Unit!38016)

(assert (=> b!1154747 (= lt!517900 (lemmaListMapContainsThenArrayContainsFrom!488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114719 () Bool)

(assert (=> b!1154747 (= c!114719 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767332 () Bool)

(declare-fun e!656737 () Bool)

(assert (=> b!1154747 (= res!767332 e!656737)))

(declare-fun e!656738 () Bool)

(assert (=> b!1154747 (=> (not res!767332) (not e!656738))))

(assert (=> b!1154747 e!656738))

(declare-fun lt!517891 () Unit!38016)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74765 (_ BitVec 32) (_ BitVec 32)) Unit!38016)

(assert (=> b!1154747 (= lt!517891 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25225 0))(
  ( (Nil!25222) (Cons!25221 (h!26430 (_ BitVec 64)) (t!36646 List!25225)) )
))
(declare-fun arrayNoDuplicates!0 (array!74765 (_ BitVec 32) List!25225) Bool)

(assert (=> b!1154747 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25222)))

(declare-fun lt!517906 () Unit!38016)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74765 (_ BitVec 64) (_ BitVec 32) List!25225) Unit!38016)

(assert (=> b!1154747 (= lt!517906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25222))))

(assert (=> b!1154747 false))

(declare-fun bm!54687 () Bool)

(declare-fun lt!517909 () array!74767)

(declare-fun lt!517890 () array!74765)

(declare-fun call!54690 () ListLongMap!16449)

(declare-fun getCurrentListMapNoExtraKeys!4709 (array!74765 array!74767 (_ BitVec 32) (_ BitVec 32) V!43739 V!43739 (_ BitVec 32) Int) ListLongMap!16449)

(assert (=> bm!54687 (= call!54690 (getCurrentListMapNoExtraKeys!4709 lt!517890 lt!517909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154749 () Bool)

(declare-fun res!767329 () Bool)

(declare-fun e!656729 () Bool)

(assert (=> b!1154749 (=> (not res!767329) (not e!656729))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154749 (= res!767329 (= (select (arr!36033 _keys!1208) i!673) k0!934))))

(declare-fun b!1154750 () Bool)

(declare-fun res!767320 () Bool)

(assert (=> b!1154750 (=> (not res!767320) (not e!656729))))

(assert (=> b!1154750 (= res!767320 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36569 _keys!1208))))))

(declare-fun b!1154751 () Bool)

(declare-fun arrayContainsKey!0 (array!74765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154751 (= e!656738 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154752 () Bool)

(declare-fun e!656736 () Bool)

(declare-fun e!656731 () Bool)

(assert (=> b!1154752 (= e!656736 e!656731)))

(declare-fun res!767333 () Bool)

(assert (=> b!1154752 (=> res!767333 e!656731)))

(assert (=> b!1154752 (= res!767333 (not (= (select (arr!36033 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656724 () Bool)

(assert (=> b!1154752 e!656724))

(declare-fun c!114722 () Bool)

(assert (=> b!1154752 (= c!114722 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517898 () Unit!38016)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!594 (array!74765 array!74767 (_ BitVec 32) (_ BitVec 32) V!43739 V!43739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38016)

(assert (=> b!1154752 (= lt!517898 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154753 () Bool)

(declare-fun e!656735 () Unit!38016)

(declare-fun lt!517910 () Unit!38016)

(assert (=> b!1154753 (= e!656735 lt!517910)))

(declare-fun call!54694 () Unit!38016)

(assert (=> b!1154753 (= lt!517910 call!54694)))

(declare-fun call!54691 () Bool)

(assert (=> b!1154753 call!54691))

(declare-fun b!1154754 () Bool)

(declare-fun e!656734 () Bool)

(declare-fun tp_is_empty!28959 () Bool)

(assert (=> b!1154754 (= e!656734 tp_is_empty!28959)))

(declare-fun b!1154755 () Bool)

(declare-fun e!656730 () Unit!38016)

(declare-fun Unit!38019 () Unit!38016)

(assert (=> b!1154755 (= e!656730 Unit!38019)))

(declare-fun bm!54688 () Bool)

(assert (=> bm!54688 (= call!54691 call!54697)))

(declare-fun b!1154756 () Bool)

(declare-fun res!767321 () Bool)

(assert (=> b!1154756 (=> (not res!767321) (not e!656729))))

(assert (=> b!1154756 (= res!767321 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25222))))

(declare-fun b!1154757 () Bool)

(declare-fun res!767326 () Bool)

(assert (=> b!1154757 (=> (not res!767326) (not e!656729))))

(assert (=> b!1154757 (= res!767326 (and (= (size!36570 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36569 _keys!1208) (size!36570 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!54692 () ListLongMap!16449)

(declare-fun bm!54689 () Bool)

(assert (=> bm!54689 (= call!54697 (contains!6753 (ite c!114721 lt!517893 call!54692) k0!934))))

(declare-fun bm!54690 () Bool)

(declare-fun call!54695 () ListLongMap!16449)

(assert (=> bm!54690 (= call!54695 (getCurrentListMapNoExtraKeys!4709 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154758 () Bool)

(assert (=> b!1154758 (= e!656724 (= call!54690 call!54695))))

(declare-fun b!1154759 () Bool)

(declare-fun -!1360 (ListLongMap!16449 (_ BitVec 64)) ListLongMap!16449)

(assert (=> b!1154759 (= e!656724 (= call!54690 (-!1360 call!54695 k0!934)))))

(declare-fun b!1154760 () Bool)

(assert (=> b!1154760 (= e!656737 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154761 () Bool)

(declare-fun res!767327 () Bool)

(declare-fun e!656723 () Bool)

(assert (=> b!1154761 (=> (not res!767327) (not e!656723))))

(assert (=> b!1154761 (= res!767327 (arrayNoDuplicates!0 lt!517890 #b00000000000000000000000000000000 Nil!25222))))

(declare-fun b!1154762 () Bool)

(declare-fun res!767324 () Bool)

(assert (=> b!1154762 (=> (not res!767324) (not e!656729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154762 (= res!767324 (validKeyInArray!0 k0!934))))

(declare-fun res!767330 () Bool)

(assert (=> start!98824 (=> (not res!767330) (not e!656729))))

(assert (=> start!98824 (= res!767330 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36569 _keys!1208))))))

(assert (=> start!98824 e!656729))

(assert (=> start!98824 tp_is_empty!28959))

(declare-fun array_inv!27578 (array!74765) Bool)

(assert (=> start!98824 (array_inv!27578 _keys!1208)))

(assert (=> start!98824 true))

(assert (=> start!98824 tp!85997))

(declare-fun e!656726 () Bool)

(declare-fun array_inv!27579 (array!74767) Bool)

(assert (=> start!98824 (and (array_inv!27579 _values!996) e!656726)))

(declare-fun b!1154748 () Bool)

(declare-fun Unit!38020 () Unit!38016)

(assert (=> b!1154748 (= e!656739 Unit!38020)))

(declare-fun b!1154763 () Bool)

(declare-fun e!656725 () Bool)

(assert (=> b!1154763 (= e!656726 (and e!656725 mapRes!45263))))

(declare-fun condMapEmpty!45263 () Bool)

(declare-fun mapDefault!45263 () ValueCell!13770)

(assert (=> b!1154763 (= condMapEmpty!45263 (= (arr!36034 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13770)) mapDefault!45263)))))

(declare-fun b!1154764 () Bool)

(declare-fun res!767319 () Bool)

(assert (=> b!1154764 (=> (not res!767319) (not e!656729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74765 (_ BitVec 32)) Bool)

(assert (=> b!1154764 (= res!767319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154765 () Bool)

(declare-fun c!114723 () Bool)

(assert (=> b!1154765 (= c!114723 (and (not lt!517894) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154765 (= e!656727 e!656735)))

(declare-fun b!1154766 () Bool)

(assert (=> b!1154766 (= e!656729 e!656723)))

(declare-fun res!767325 () Bool)

(assert (=> b!1154766 (=> (not res!767325) (not e!656723))))

(assert (=> b!1154766 (= res!767325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517890 mask!1564))))

(assert (=> b!1154766 (= lt!517890 (array!74766 (store (arr!36033 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36569 _keys!1208)))))

(declare-fun b!1154767 () Bool)

(declare-fun e!656728 () Bool)

(assert (=> b!1154767 (= e!656723 (not e!656728))))

(declare-fun res!767322 () Bool)

(assert (=> b!1154767 (=> res!767322 e!656728)))

(assert (=> b!1154767 (= res!767322 (bvsgt from!1455 i!673))))

(assert (=> b!1154767 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517904 () Unit!38016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74765 (_ BitVec 64) (_ BitVec 32)) Unit!38016)

(assert (=> b!1154767 (= lt!517904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154768 () Bool)

(assert (=> b!1154768 (= e!656737 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517894) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154769 () Bool)

(assert (=> b!1154769 (= e!656735 e!656730)))

(declare-fun c!114724 () Bool)

(assert (=> b!1154769 (= c!114724 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517894))))

(declare-fun b!1154770 () Bool)

(assert (=> b!1154770 (= e!656728 e!656736)))

(declare-fun res!767331 () Bool)

(assert (=> b!1154770 (=> res!767331 e!656736)))

(assert (=> b!1154770 (= res!767331 (not (= from!1455 i!673)))))

(declare-fun lt!517911 () ListLongMap!16449)

(assert (=> b!1154770 (= lt!517911 (getCurrentListMapNoExtraKeys!4709 lt!517890 lt!517909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517901 () V!43739)

(assert (=> b!1154770 (= lt!517909 (array!74768 (store (arr!36034 _values!996) i!673 (ValueCellFull!13770 lt!517901)) (size!36570 _values!996)))))

(declare-fun dynLambda!2721 (Int (_ BitVec 64)) V!43739)

(assert (=> b!1154770 (= lt!517901 (dynLambda!2721 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517897 () ListLongMap!16449)

(assert (=> b!1154770 (= lt!517897 (getCurrentListMapNoExtraKeys!4709 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154771 () Bool)

(assert (=> b!1154771 call!54691))

(declare-fun lt!517902 () Unit!38016)

(assert (=> b!1154771 (= lt!517902 call!54694)))

(assert (=> b!1154771 (= e!656730 lt!517902)))

(declare-fun bm!54691 () Bool)

(assert (=> bm!54691 (= call!54693 (addStillContains!898 lt!517895 (ite (or c!114721 c!114723) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114721 c!114723) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1154772 () Bool)

(declare-fun res!767323 () Bool)

(assert (=> b!1154772 (=> (not res!767323) (not e!656729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154772 (= res!767323 (validMask!0 mask!1564))))

(declare-fun b!1154773 () Bool)

(assert (=> b!1154773 (= e!656725 tp_is_empty!28959)))

(declare-fun b!1154774 () Bool)

(assert (=> b!1154774 (= e!656731 true)))

(declare-fun e!656733 () Bool)

(assert (=> b!1154774 e!656733))

(declare-fun res!767328 () Bool)

(assert (=> b!1154774 (=> (not res!767328) (not e!656733))))

(declare-fun lt!517899 () ListLongMap!16449)

(assert (=> b!1154774 (= res!767328 (= lt!517899 lt!517895))))

(assert (=> b!1154774 (= lt!517899 (-!1360 lt!517897 k0!934))))

(declare-fun lt!517907 () V!43739)

(assert (=> b!1154774 (= (-!1360 (+!3653 lt!517895 (tuple2!18481 (select (arr!36033 _keys!1208) from!1455) lt!517907)) (select (arr!36033 _keys!1208) from!1455)) lt!517895)))

(declare-fun lt!517908 () Unit!38016)

(declare-fun addThenRemoveForNewKeyIsSame!200 (ListLongMap!16449 (_ BitVec 64) V!43739) Unit!38016)

(assert (=> b!1154774 (= lt!517908 (addThenRemoveForNewKeyIsSame!200 lt!517895 (select (arr!36033 _keys!1208) from!1455) lt!517907))))

(declare-fun get!18356 (ValueCell!13770 V!43739) V!43739)

(assert (=> b!1154774 (= lt!517907 (get!18356 (select (arr!36034 _values!996) from!1455) lt!517901))))

(declare-fun lt!517896 () Unit!38016)

(assert (=> b!1154774 (= lt!517896 e!656739)))

(declare-fun c!114720 () Bool)

(assert (=> b!1154774 (= c!114720 (contains!6753 lt!517895 k0!934))))

(assert (=> b!1154774 (= lt!517895 (getCurrentListMapNoExtraKeys!4709 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54692 () Bool)

(assert (=> bm!54692 (= call!54696 (+!3653 (ite c!114721 lt!517893 lt!517895) (ite c!114721 (tuple2!18481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114723 (tuple2!18481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!54693 () Bool)

(assert (=> bm!54693 (= call!54692 call!54696)))

(declare-fun mapNonEmpty!45263 () Bool)

(declare-fun tp!85998 () Bool)

(assert (=> mapNonEmpty!45263 (= mapRes!45263 (and tp!85998 e!656734))))

(declare-fun mapValue!45263 () ValueCell!13770)

(declare-fun mapKey!45263 () (_ BitVec 32))

(declare-fun mapRest!45263 () (Array (_ BitVec 32) ValueCell!13770))

(assert (=> mapNonEmpty!45263 (= (arr!36034 _values!996) (store mapRest!45263 mapKey!45263 mapValue!45263))))

(declare-fun bm!54694 () Bool)

(assert (=> bm!54694 (= call!54694 call!54693)))

(declare-fun b!1154775 () Bool)

(assert (=> b!1154775 (= e!656733 (= lt!517899 (getCurrentListMapNoExtraKeys!4709 lt!517890 lt!517909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!98824 res!767330) b!1154772))

(assert (= (and b!1154772 res!767323) b!1154757))

(assert (= (and b!1154757 res!767326) b!1154764))

(assert (= (and b!1154764 res!767319) b!1154756))

(assert (= (and b!1154756 res!767321) b!1154750))

(assert (= (and b!1154750 res!767320) b!1154762))

(assert (= (and b!1154762 res!767324) b!1154749))

(assert (= (and b!1154749 res!767329) b!1154766))

(assert (= (and b!1154766 res!767325) b!1154761))

(assert (= (and b!1154761 res!767327) b!1154767))

(assert (= (and b!1154767 (not res!767322)) b!1154770))

(assert (= (and b!1154770 (not res!767331)) b!1154752))

(assert (= (and b!1154752 c!114722) b!1154759))

(assert (= (and b!1154752 (not c!114722)) b!1154758))

(assert (= (or b!1154759 b!1154758) bm!54687))

(assert (= (or b!1154759 b!1154758) bm!54690))

(assert (= (and b!1154752 (not res!767333)) b!1154774))

(assert (= (and b!1154774 c!114720) b!1154747))

(assert (= (and b!1154774 (not c!114720)) b!1154748))

(assert (= (and b!1154747 c!114721) b!1154746))

(assert (= (and b!1154747 (not c!114721)) b!1154765))

(assert (= (and b!1154765 c!114723) b!1154753))

(assert (= (and b!1154765 (not c!114723)) b!1154769))

(assert (= (and b!1154769 c!114724) b!1154771))

(assert (= (and b!1154769 (not c!114724)) b!1154755))

(assert (= (or b!1154753 b!1154771) bm!54694))

(assert (= (or b!1154753 b!1154771) bm!54693))

(assert (= (or b!1154753 b!1154771) bm!54688))

(assert (= (or b!1154746 bm!54688) bm!54689))

(assert (= (or b!1154746 bm!54694) bm!54691))

(assert (= (or b!1154746 bm!54693) bm!54692))

(assert (= (and b!1154747 c!114719) b!1154760))

(assert (= (and b!1154747 (not c!114719)) b!1154768))

(assert (= (and b!1154747 res!767332) b!1154751))

(assert (= (and b!1154774 res!767328) b!1154775))

(assert (= (and b!1154763 condMapEmpty!45263) mapIsEmpty!45263))

(assert (= (and b!1154763 (not condMapEmpty!45263)) mapNonEmpty!45263))

(get-info :version)

(assert (= (and mapNonEmpty!45263 ((_ is ValueCellFull!13770) mapValue!45263)) b!1154754))

(assert (= (and b!1154763 ((_ is ValueCellFull!13770) mapDefault!45263)) b!1154773))

(assert (= start!98824 b!1154763))

(declare-fun b_lambda!19535 () Bool)

(assert (=> (not b_lambda!19535) (not b!1154770)))

(declare-fun t!36644 () Bool)

(declare-fun tb!9241 () Bool)

(assert (=> (and start!98824 (= defaultEntry!1004 defaultEntry!1004) t!36644) tb!9241))

(declare-fun result!19047 () Bool)

(assert (=> tb!9241 (= result!19047 tp_is_empty!28959)))

(assert (=> b!1154770 t!36644))

(declare-fun b_and!39709 () Bool)

(assert (= b_and!39707 (and (=> t!36644 result!19047) b_and!39709)))

(declare-fun m!1064425 () Bool)

(assert (=> bm!54687 m!1064425))

(declare-fun m!1064427 () Bool)

(assert (=> start!98824 m!1064427))

(declare-fun m!1064429 () Bool)

(assert (=> start!98824 m!1064429))

(declare-fun m!1064431 () Bool)

(assert (=> bm!54692 m!1064431))

(declare-fun m!1064433 () Bool)

(assert (=> b!1154751 m!1064433))

(declare-fun m!1064435 () Bool)

(assert (=> bm!54690 m!1064435))

(declare-fun m!1064437 () Bool)

(assert (=> b!1154761 m!1064437))

(declare-fun m!1064439 () Bool)

(assert (=> b!1154749 m!1064439))

(assert (=> b!1154775 m!1064425))

(declare-fun m!1064441 () Bool)

(assert (=> b!1154756 m!1064441))

(declare-fun m!1064443 () Bool)

(assert (=> b!1154767 m!1064443))

(declare-fun m!1064445 () Bool)

(assert (=> b!1154767 m!1064445))

(declare-fun m!1064447 () Bool)

(assert (=> b!1154762 m!1064447))

(declare-fun m!1064449 () Bool)

(assert (=> b!1154759 m!1064449))

(assert (=> b!1154760 m!1064433))

(declare-fun m!1064451 () Bool)

(assert (=> bm!54691 m!1064451))

(declare-fun m!1064453 () Bool)

(assert (=> bm!54689 m!1064453))

(declare-fun m!1064455 () Bool)

(assert (=> b!1154746 m!1064455))

(declare-fun m!1064457 () Bool)

(assert (=> b!1154746 m!1064457))

(declare-fun m!1064459 () Bool)

(assert (=> b!1154746 m!1064459))

(declare-fun m!1064461 () Bool)

(assert (=> b!1154747 m!1064461))

(declare-fun m!1064463 () Bool)

(assert (=> b!1154747 m!1064463))

(declare-fun m!1064465 () Bool)

(assert (=> b!1154747 m!1064465))

(declare-fun m!1064467 () Bool)

(assert (=> b!1154747 m!1064467))

(declare-fun m!1064469 () Bool)

(assert (=> b!1154770 m!1064469))

(declare-fun m!1064471 () Bool)

(assert (=> b!1154770 m!1064471))

(declare-fun m!1064473 () Bool)

(assert (=> b!1154770 m!1064473))

(declare-fun m!1064475 () Bool)

(assert (=> b!1154770 m!1064475))

(declare-fun m!1064477 () Bool)

(assert (=> b!1154764 m!1064477))

(declare-fun m!1064479 () Bool)

(assert (=> b!1154766 m!1064479))

(declare-fun m!1064481 () Bool)

(assert (=> b!1154766 m!1064481))

(declare-fun m!1064483 () Bool)

(assert (=> b!1154772 m!1064483))

(assert (=> b!1154774 m!1064435))

(declare-fun m!1064485 () Bool)

(assert (=> b!1154774 m!1064485))

(declare-fun m!1064487 () Bool)

(assert (=> b!1154774 m!1064487))

(declare-fun m!1064489 () Bool)

(assert (=> b!1154774 m!1064489))

(declare-fun m!1064491 () Bool)

(assert (=> b!1154774 m!1064491))

(declare-fun m!1064493 () Bool)

(assert (=> b!1154774 m!1064493))

(declare-fun m!1064495 () Bool)

(assert (=> b!1154774 m!1064495))

(assert (=> b!1154774 m!1064491))

(declare-fun m!1064497 () Bool)

(assert (=> b!1154774 m!1064497))

(assert (=> b!1154774 m!1064487))

(assert (=> b!1154774 m!1064485))

(assert (=> b!1154774 m!1064491))

(declare-fun m!1064499 () Bool)

(assert (=> b!1154774 m!1064499))

(declare-fun m!1064501 () Bool)

(assert (=> mapNonEmpty!45263 m!1064501))

(assert (=> b!1154752 m!1064491))

(declare-fun m!1064503 () Bool)

(assert (=> b!1154752 m!1064503))

(check-sat (not b!1154766) (not start!98824) tp_is_empty!28959 (not b!1154759) (not b!1154762) (not b!1154772) (not b_next!24429) (not bm!54691) (not b!1154756) (not b!1154747) (not b!1154746) b_and!39709 (not bm!54690) (not bm!54692) (not bm!54687) (not b!1154751) (not b!1154761) (not b!1154775) (not b!1154760) (not mapNonEmpty!45263) (not b!1154770) (not b!1154767) (not b!1154764) (not bm!54689) (not b!1154774) (not b_lambda!19535) (not b!1154752))
(check-sat b_and!39709 (not b_next!24429))
