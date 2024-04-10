; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98758 () Bool)

(assert start!98758)

(declare-fun b_free!24363 () Bool)

(declare-fun b_next!24363 () Bool)

(assert (=> start!98758 (= b_free!24363 (not b_next!24363))))

(declare-fun tp!85799 () Bool)

(declare-fun b_and!39575 () Bool)

(assert (=> start!98758 (= tp!85799 b_and!39575)))

(declare-fun b!1151710 () Bool)

(declare-fun e!655046 () Bool)

(declare-fun tp_is_empty!28893 () Bool)

(assert (=> b!1151710 (= e!655046 tp_is_empty!28893)))

(declare-fun b!1151711 () Bool)

(declare-datatypes ((Unit!37891 0))(
  ( (Unit!37892) )
))
(declare-fun e!655047 () Unit!37891)

(declare-fun Unit!37893 () Unit!37891)

(assert (=> b!1151711 (= e!655047 Unit!37893)))

(declare-datatypes ((V!43651 0))(
  ( (V!43652 (val!14503 Int)) )
))
(declare-fun zeroValue!944 () V!43651)

(declare-datatypes ((tuple2!18416 0))(
  ( (tuple2!18417 (_1!9219 (_ BitVec 64)) (_2!9219 V!43651)) )
))
(declare-datatypes ((List!25164 0))(
  ( (Nil!25161) (Cons!25160 (h!26369 tuple2!18416) (t!36519 List!25164)) )
))
(declare-datatypes ((ListLongMap!16385 0))(
  ( (ListLongMap!16386 (toList!8208 List!25164)) )
))
(declare-fun lt!515720 () ListLongMap!16385)

(declare-fun c!114130 () Bool)

(declare-fun c!114128 () Bool)

(declare-fun minValue!944 () V!43651)

(declare-fun call!53899 () Unit!37891)

(declare-fun bm!53895 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!874 (ListLongMap!16385 (_ BitVec 64) V!43651 (_ BitVec 64)) Unit!37891)

(assert (=> bm!53895 (= call!53899 (addStillContains!874 lt!515720 (ite (or c!114130 c!114128) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114130 c!114128) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1151712 () Bool)

(declare-fun e!655045 () Bool)

(declare-fun e!655043 () Bool)

(assert (=> b!1151712 (= e!655045 e!655043)))

(declare-fun res!765842 () Bool)

(assert (=> b!1151712 (=> res!765842 e!655043)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151712 (= res!765842 (not (= from!1455 i!673)))))

(declare-datatypes ((ValueCell!13737 0))(
  ( (ValueCellFull!13737 (v!17140 V!43651)) (EmptyCell!13737) )
))
(declare-datatypes ((array!74633 0))(
  ( (array!74634 (arr!35967 (Array (_ BitVec 32) ValueCell!13737)) (size!36503 (_ BitVec 32))) )
))
(declare-fun lt!515717 () array!74633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!74635 0))(
  ( (array!74636 (arr!35968 (Array (_ BitVec 32) (_ BitVec 64))) (size!36504 (_ BitVec 32))) )
))
(declare-fun lt!515714 () array!74635)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!515729 () ListLongMap!16385)

(declare-fun getCurrentListMapNoExtraKeys!4680 (array!74635 array!74633 (_ BitVec 32) (_ BitVec 32) V!43651 V!43651 (_ BitVec 32) Int) ListLongMap!16385)

(assert (=> b!1151712 (= lt!515729 (getCurrentListMapNoExtraKeys!4680 lt!515714 lt!515717 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515723 () V!43651)

(declare-fun _values!996 () array!74633)

(assert (=> b!1151712 (= lt!515717 (array!74634 (store (arr!35967 _values!996) i!673 (ValueCellFull!13737 lt!515723)) (size!36503 _values!996)))))

(declare-fun dynLambda!2702 (Int (_ BitVec 64)) V!43651)

(assert (=> b!1151712 (= lt!515723 (dynLambda!2702 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74635)

(declare-fun lt!515719 () ListLongMap!16385)

(assert (=> b!1151712 (= lt!515719 (getCurrentListMapNoExtraKeys!4680 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151713 () Bool)

(declare-fun e!655042 () Bool)

(assert (=> b!1151713 (= e!655042 tp_is_empty!28893)))

(declare-fun b!1151714 () Bool)

(declare-fun e!655052 () Bool)

(declare-fun call!53898 () ListLongMap!16385)

(declare-fun call!53904 () ListLongMap!16385)

(assert (=> b!1151714 (= e!655052 (= call!53898 call!53904))))

(declare-fun b!1151715 () Bool)

(declare-fun res!765841 () Bool)

(declare-fun e!655041 () Bool)

(assert (=> b!1151715 (=> (not res!765841) (not e!655041))))

(assert (=> b!1151715 (= res!765841 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36504 _keys!1208))))))

(declare-fun b!1151716 () Bool)

(declare-fun e!655050 () Unit!37891)

(declare-fun Unit!37894 () Unit!37891)

(assert (=> b!1151716 (= e!655050 Unit!37894)))

(declare-fun b!1151717 () Bool)

(declare-fun e!655040 () Bool)

(assert (=> b!1151717 (= e!655043 e!655040)))

(declare-fun res!765846 () Bool)

(assert (=> b!1151717 (=> res!765846 e!655040)))

(assert (=> b!1151717 (= res!765846 (not (= (select (arr!35968 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151717 e!655052))

(declare-fun c!114129 () Bool)

(assert (=> b!1151717 (= c!114129 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515715 () Unit!37891)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!574 (array!74635 array!74633 (_ BitVec 32) (_ BitVec 32) V!43651 V!43651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37891)

(assert (=> b!1151717 (= lt!515715 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151718 () Bool)

(declare-fun e!655049 () Unit!37891)

(assert (=> b!1151718 (= e!655049 e!655047)))

(declare-fun c!114127 () Bool)

(declare-fun lt!515726 () Bool)

(assert (=> b!1151718 (= c!114127 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515726))))

(declare-fun bm!53896 () Bool)

(declare-fun call!53900 () ListLongMap!16385)

(declare-fun call!53902 () ListLongMap!16385)

(assert (=> bm!53896 (= call!53900 call!53902)))

(declare-fun b!1151719 () Bool)

(declare-fun e!655053 () Bool)

(declare-fun mapRes!45164 () Bool)

(assert (=> b!1151719 (= e!655053 (and e!655042 mapRes!45164))))

(declare-fun condMapEmpty!45164 () Bool)

(declare-fun mapDefault!45164 () ValueCell!13737)

(assert (=> b!1151719 (= condMapEmpty!45164 (= (arr!35967 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13737)) mapDefault!45164)))))

(declare-fun mapNonEmpty!45164 () Bool)

(declare-fun tp!85800 () Bool)

(assert (=> mapNonEmpty!45164 (= mapRes!45164 (and tp!85800 e!655046))))

(declare-fun mapValue!45164 () ValueCell!13737)

(declare-fun mapKey!45164 () (_ BitVec 32))

(declare-fun mapRest!45164 () (Array (_ BitVec 32) ValueCell!13737))

(assert (=> mapNonEmpty!45164 (= (arr!35967 _values!996) (store mapRest!45164 mapKey!45164 mapValue!45164))))

(declare-fun b!1151720 () Bool)

(assert (=> b!1151720 (= c!114128 (and (not lt!515726) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655056 () Unit!37891)

(assert (=> b!1151720 (= e!655056 e!655049)))

(declare-fun b!1151721 () Bool)

(declare-fun Unit!37895 () Unit!37891)

(assert (=> b!1151721 (= e!655050 Unit!37895)))

(assert (=> b!1151721 (= lt!515726 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151721 (= c!114130 (and (not lt!515726) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515713 () Unit!37891)

(assert (=> b!1151721 (= lt!515713 e!655056)))

(declare-fun lt!515730 () Unit!37891)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!467 (array!74635 array!74633 (_ BitVec 32) (_ BitVec 32) V!43651 V!43651 (_ BitVec 64) (_ BitVec 32) Int) Unit!37891)

(assert (=> b!1151721 (= lt!515730 (lemmaListMapContainsThenArrayContainsFrom!467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114126 () Bool)

(assert (=> b!1151721 (= c!114126 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765845 () Bool)

(declare-fun e!655055 () Bool)

(assert (=> b!1151721 (= res!765845 e!655055)))

(declare-fun e!655044 () Bool)

(assert (=> b!1151721 (=> (not res!765845) (not e!655044))))

(assert (=> b!1151721 e!655044))

(declare-fun lt!515732 () Unit!37891)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74635 (_ BitVec 32) (_ BitVec 32)) Unit!37891)

(assert (=> b!1151721 (= lt!515732 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25165 0))(
  ( (Nil!25162) (Cons!25161 (h!26370 (_ BitVec 64)) (t!36520 List!25165)) )
))
(declare-fun arrayNoDuplicates!0 (array!74635 (_ BitVec 32) List!25165) Bool)

(assert (=> b!1151721 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25162)))

(declare-fun lt!515721 () Unit!37891)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74635 (_ BitVec 64) (_ BitVec 32) List!25165) Unit!37891)

(assert (=> b!1151721 (= lt!515721 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25162))))

(assert (=> b!1151721 false))

(declare-fun b!1151722 () Bool)

(declare-fun res!765838 () Bool)

(declare-fun e!655054 () Bool)

(assert (=> b!1151722 (=> (not res!765838) (not e!655054))))

(assert (=> b!1151722 (= res!765838 (arrayNoDuplicates!0 lt!515714 #b00000000000000000000000000000000 Nil!25162))))

(declare-fun bm!53897 () Bool)

(declare-fun call!53901 () Bool)

(declare-fun call!53903 () Bool)

(assert (=> bm!53897 (= call!53901 call!53903)))

(declare-fun bm!53898 () Bool)

(assert (=> bm!53898 (= call!53898 (getCurrentListMapNoExtraKeys!4680 lt!515714 lt!515717 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151723 () Bool)

(assert (=> b!1151723 (= e!655055 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515726) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53899 () Bool)

(assert (=> bm!53899 (= call!53904 (getCurrentListMapNoExtraKeys!4680 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151724 () Bool)

(declare-fun res!765837 () Bool)

(assert (=> b!1151724 (=> (not res!765837) (not e!655041))))

(assert (=> b!1151724 (= res!765837 (and (= (size!36503 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36504 _keys!1208) (size!36503 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151725 () Bool)

(declare-fun contains!6726 (ListLongMap!16385 (_ BitVec 64)) Bool)

(assert (=> b!1151725 (contains!6726 call!53902 k0!934)))

(declare-fun lt!515716 () ListLongMap!16385)

(declare-fun lt!515728 () Unit!37891)

(assert (=> b!1151725 (= lt!515728 (addStillContains!874 lt!515716 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1151725 call!53903))

(declare-fun +!3626 (ListLongMap!16385 tuple2!18416) ListLongMap!16385)

(assert (=> b!1151725 (= lt!515716 (+!3626 lt!515720 (tuple2!18417 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515712 () Unit!37891)

(assert (=> b!1151725 (= lt!515712 call!53899)))

(assert (=> b!1151725 (= e!655056 lt!515728)))

(declare-fun b!1151726 () Bool)

(assert (=> b!1151726 (= e!655040 true)))

(declare-fun e!655051 () Bool)

(assert (=> b!1151726 e!655051))

(declare-fun res!765840 () Bool)

(assert (=> b!1151726 (=> (not res!765840) (not e!655051))))

(declare-fun lt!515731 () ListLongMap!16385)

(assert (=> b!1151726 (= res!765840 (= lt!515731 lt!515720))))

(declare-fun -!1339 (ListLongMap!16385 (_ BitVec 64)) ListLongMap!16385)

(assert (=> b!1151726 (= lt!515731 (-!1339 lt!515719 k0!934))))

(declare-fun lt!515722 () V!43651)

(assert (=> b!1151726 (= (-!1339 (+!3626 lt!515720 (tuple2!18417 (select (arr!35968 _keys!1208) from!1455) lt!515722)) (select (arr!35968 _keys!1208) from!1455)) lt!515720)))

(declare-fun lt!515733 () Unit!37891)

(declare-fun addThenRemoveForNewKeyIsSame!181 (ListLongMap!16385 (_ BitVec 64) V!43651) Unit!37891)

(assert (=> b!1151726 (= lt!515733 (addThenRemoveForNewKeyIsSame!181 lt!515720 (select (arr!35968 _keys!1208) from!1455) lt!515722))))

(declare-fun get!18315 (ValueCell!13737 V!43651) V!43651)

(assert (=> b!1151726 (= lt!515722 (get!18315 (select (arr!35967 _values!996) from!1455) lt!515723))))

(declare-fun lt!515718 () Unit!37891)

(assert (=> b!1151726 (= lt!515718 e!655050)))

(declare-fun c!114125 () Bool)

(assert (=> b!1151726 (= c!114125 (contains!6726 lt!515720 k0!934))))

(assert (=> b!1151726 (= lt!515720 (getCurrentListMapNoExtraKeys!4680 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53900 () Bool)

(declare-fun call!53905 () Unit!37891)

(assert (=> bm!53900 (= call!53905 call!53899)))

(declare-fun b!1151727 () Bool)

(assert (=> b!1151727 (= e!655041 e!655054)))

(declare-fun res!765836 () Bool)

(assert (=> b!1151727 (=> (not res!765836) (not e!655054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74635 (_ BitVec 32)) Bool)

(assert (=> b!1151727 (= res!765836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515714 mask!1564))))

(assert (=> b!1151727 (= lt!515714 (array!74636 (store (arr!35968 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36504 _keys!1208)))))

(declare-fun b!1151728 () Bool)

(declare-fun arrayContainsKey!0 (array!74635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151728 (= e!655044 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151729 () Bool)

(assert (=> b!1151729 (= e!655055 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151730 () Bool)

(declare-fun lt!515724 () Unit!37891)

(assert (=> b!1151730 (= e!655049 lt!515724)))

(assert (=> b!1151730 (= lt!515724 call!53905)))

(assert (=> b!1151730 call!53901))

(declare-fun b!1151731 () Bool)

(declare-fun res!765847 () Bool)

(assert (=> b!1151731 (=> (not res!765847) (not e!655041))))

(assert (=> b!1151731 (= res!765847 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25162))))

(declare-fun b!1151732 () Bool)

(declare-fun res!765839 () Bool)

(assert (=> b!1151732 (=> (not res!765839) (not e!655041))))

(assert (=> b!1151732 (= res!765839 (= (select (arr!35968 _keys!1208) i!673) k0!934))))

(declare-fun res!765848 () Bool)

(assert (=> start!98758 (=> (not res!765848) (not e!655041))))

(assert (=> start!98758 (= res!765848 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36504 _keys!1208))))))

(assert (=> start!98758 e!655041))

(assert (=> start!98758 tp_is_empty!28893))

(declare-fun array_inv!27544 (array!74635) Bool)

(assert (=> start!98758 (array_inv!27544 _keys!1208)))

(assert (=> start!98758 true))

(assert (=> start!98758 tp!85799))

(declare-fun array_inv!27545 (array!74633) Bool)

(assert (=> start!98758 (and (array_inv!27545 _values!996) e!655053)))

(declare-fun b!1151733 () Bool)

(assert (=> b!1151733 (= e!655051 (= lt!515731 (getCurrentListMapNoExtraKeys!4680 lt!515714 lt!515717 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151734 () Bool)

(assert (=> b!1151734 call!53901))

(declare-fun lt!515725 () Unit!37891)

(assert (=> b!1151734 (= lt!515725 call!53905)))

(assert (=> b!1151734 (= e!655047 lt!515725)))

(declare-fun b!1151735 () Bool)

(assert (=> b!1151735 (= e!655052 (= call!53898 (-!1339 call!53904 k0!934)))))

(declare-fun mapIsEmpty!45164 () Bool)

(assert (=> mapIsEmpty!45164 mapRes!45164))

(declare-fun bm!53901 () Bool)

(assert (=> bm!53901 (= call!53903 (contains!6726 (ite c!114130 lt!515716 call!53900) k0!934))))

(declare-fun b!1151736 () Bool)

(declare-fun res!765834 () Bool)

(assert (=> b!1151736 (=> (not res!765834) (not e!655041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151736 (= res!765834 (validKeyInArray!0 k0!934))))

(declare-fun b!1151737 () Bool)

(declare-fun res!765844 () Bool)

(assert (=> b!1151737 (=> (not res!765844) (not e!655041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151737 (= res!765844 (validMask!0 mask!1564))))

(declare-fun b!1151738 () Bool)

(assert (=> b!1151738 (= e!655054 (not e!655045))))

(declare-fun res!765835 () Bool)

(assert (=> b!1151738 (=> res!765835 e!655045)))

(assert (=> b!1151738 (= res!765835 (bvsgt from!1455 i!673))))

(assert (=> b!1151738 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515727 () Unit!37891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74635 (_ BitVec 64) (_ BitVec 32)) Unit!37891)

(assert (=> b!1151738 (= lt!515727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151739 () Bool)

(declare-fun res!765843 () Bool)

(assert (=> b!1151739 (=> (not res!765843) (not e!655041))))

(assert (=> b!1151739 (= res!765843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53902 () Bool)

(assert (=> bm!53902 (= call!53902 (+!3626 (ite c!114130 lt!515716 lt!515720) (ite c!114130 (tuple2!18417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114128 (tuple2!18417 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!98758 res!765848) b!1151737))

(assert (= (and b!1151737 res!765844) b!1151724))

(assert (= (and b!1151724 res!765837) b!1151739))

(assert (= (and b!1151739 res!765843) b!1151731))

(assert (= (and b!1151731 res!765847) b!1151715))

(assert (= (and b!1151715 res!765841) b!1151736))

(assert (= (and b!1151736 res!765834) b!1151732))

(assert (= (and b!1151732 res!765839) b!1151727))

(assert (= (and b!1151727 res!765836) b!1151722))

(assert (= (and b!1151722 res!765838) b!1151738))

(assert (= (and b!1151738 (not res!765835)) b!1151712))

(assert (= (and b!1151712 (not res!765842)) b!1151717))

(assert (= (and b!1151717 c!114129) b!1151735))

(assert (= (and b!1151717 (not c!114129)) b!1151714))

(assert (= (or b!1151735 b!1151714) bm!53899))

(assert (= (or b!1151735 b!1151714) bm!53898))

(assert (= (and b!1151717 (not res!765846)) b!1151726))

(assert (= (and b!1151726 c!114125) b!1151721))

(assert (= (and b!1151726 (not c!114125)) b!1151716))

(assert (= (and b!1151721 c!114130) b!1151725))

(assert (= (and b!1151721 (not c!114130)) b!1151720))

(assert (= (and b!1151720 c!114128) b!1151730))

(assert (= (and b!1151720 (not c!114128)) b!1151718))

(assert (= (and b!1151718 c!114127) b!1151734))

(assert (= (and b!1151718 (not c!114127)) b!1151711))

(assert (= (or b!1151730 b!1151734) bm!53900))

(assert (= (or b!1151730 b!1151734) bm!53896))

(assert (= (or b!1151730 b!1151734) bm!53897))

(assert (= (or b!1151725 bm!53897) bm!53901))

(assert (= (or b!1151725 bm!53900) bm!53895))

(assert (= (or b!1151725 bm!53896) bm!53902))

(assert (= (and b!1151721 c!114126) b!1151729))

(assert (= (and b!1151721 (not c!114126)) b!1151723))

(assert (= (and b!1151721 res!765845) b!1151728))

(assert (= (and b!1151726 res!765840) b!1151733))

(assert (= (and b!1151719 condMapEmpty!45164) mapIsEmpty!45164))

(assert (= (and b!1151719 (not condMapEmpty!45164)) mapNonEmpty!45164))

(get-info :version)

(assert (= (and mapNonEmpty!45164 ((_ is ValueCellFull!13737) mapValue!45164)) b!1151710))

(assert (= (and b!1151719 ((_ is ValueCellFull!13737) mapDefault!45164)) b!1151713))

(assert (= start!98758 b!1151719))

(declare-fun b_lambda!19469 () Bool)

(assert (=> (not b_lambda!19469) (not b!1151712)))

(declare-fun t!36518 () Bool)

(declare-fun tb!9175 () Bool)

(assert (=> (and start!98758 (= defaultEntry!1004 defaultEntry!1004) t!36518) tb!9175))

(declare-fun result!18915 () Bool)

(assert (=> tb!9175 (= result!18915 tp_is_empty!28893)))

(assert (=> b!1151712 t!36518))

(declare-fun b_and!39577 () Bool)

(assert (= b_and!39575 (and (=> t!36518 result!18915) b_and!39577)))

(declare-fun m!1061785 () Bool)

(assert (=> b!1151732 m!1061785))

(declare-fun m!1061787 () Bool)

(assert (=> bm!53901 m!1061787))

(declare-fun m!1061789 () Bool)

(assert (=> b!1151725 m!1061789))

(declare-fun m!1061791 () Bool)

(assert (=> b!1151725 m!1061791))

(declare-fun m!1061793 () Bool)

(assert (=> b!1151725 m!1061793))

(declare-fun m!1061795 () Bool)

(assert (=> b!1151717 m!1061795))

(declare-fun m!1061797 () Bool)

(assert (=> b!1151717 m!1061797))

(declare-fun m!1061799 () Bool)

(assert (=> bm!53899 m!1061799))

(declare-fun m!1061801 () Bool)

(assert (=> b!1151736 m!1061801))

(declare-fun m!1061803 () Bool)

(assert (=> bm!53898 m!1061803))

(declare-fun m!1061805 () Bool)

(assert (=> b!1151712 m!1061805))

(declare-fun m!1061807 () Bool)

(assert (=> b!1151712 m!1061807))

(declare-fun m!1061809 () Bool)

(assert (=> b!1151712 m!1061809))

(declare-fun m!1061811 () Bool)

(assert (=> b!1151712 m!1061811))

(declare-fun m!1061813 () Bool)

(assert (=> b!1151738 m!1061813))

(declare-fun m!1061815 () Bool)

(assert (=> b!1151738 m!1061815))

(declare-fun m!1061817 () Bool)

(assert (=> b!1151721 m!1061817))

(declare-fun m!1061819 () Bool)

(assert (=> b!1151721 m!1061819))

(declare-fun m!1061821 () Bool)

(assert (=> b!1151721 m!1061821))

(declare-fun m!1061823 () Bool)

(assert (=> b!1151721 m!1061823))

(assert (=> b!1151733 m!1061803))

(declare-fun m!1061825 () Bool)

(assert (=> b!1151731 m!1061825))

(declare-fun m!1061827 () Bool)

(assert (=> b!1151727 m!1061827))

(declare-fun m!1061829 () Bool)

(assert (=> b!1151727 m!1061829))

(declare-fun m!1061831 () Bool)

(assert (=> start!98758 m!1061831))

(declare-fun m!1061833 () Bool)

(assert (=> start!98758 m!1061833))

(declare-fun m!1061835 () Bool)

(assert (=> b!1151728 m!1061835))

(declare-fun m!1061837 () Bool)

(assert (=> b!1151735 m!1061837))

(declare-fun m!1061839 () Bool)

(assert (=> bm!53902 m!1061839))

(declare-fun m!1061841 () Bool)

(assert (=> b!1151737 m!1061841))

(assert (=> b!1151726 m!1061799))

(declare-fun m!1061843 () Bool)

(assert (=> b!1151726 m!1061843))

(assert (=> b!1151726 m!1061795))

(declare-fun m!1061845 () Bool)

(assert (=> b!1151726 m!1061845))

(assert (=> b!1151726 m!1061843))

(declare-fun m!1061847 () Bool)

(assert (=> b!1151726 m!1061847))

(declare-fun m!1061849 () Bool)

(assert (=> b!1151726 m!1061849))

(declare-fun m!1061851 () Bool)

(assert (=> b!1151726 m!1061851))

(declare-fun m!1061853 () Bool)

(assert (=> b!1151726 m!1061853))

(assert (=> b!1151726 m!1061795))

(declare-fun m!1061855 () Bool)

(assert (=> b!1151726 m!1061855))

(assert (=> b!1151726 m!1061853))

(assert (=> b!1151726 m!1061795))

(declare-fun m!1061857 () Bool)

(assert (=> b!1151739 m!1061857))

(assert (=> b!1151729 m!1061835))

(declare-fun m!1061859 () Bool)

(assert (=> bm!53895 m!1061859))

(declare-fun m!1061861 () Bool)

(assert (=> mapNonEmpty!45164 m!1061861))

(declare-fun m!1061863 () Bool)

(assert (=> b!1151722 m!1061863))

(check-sat (not b!1151735) (not b!1151725) (not b!1151721) (not b!1151733) (not b!1151712) (not b_next!24363) (not bm!53895) (not bm!53902) (not bm!53899) (not b!1151729) b_and!39577 (not mapNonEmpty!45164) (not b!1151731) (not b_lambda!19469) (not b!1151722) (not b!1151738) (not b!1151737) tp_is_empty!28893 (not b!1151739) (not start!98758) (not b!1151717) (not b!1151736) (not bm!53898) (not b!1151728) (not b!1151726) (not bm!53901) (not b!1151727))
(check-sat b_and!39577 (not b_next!24363))
