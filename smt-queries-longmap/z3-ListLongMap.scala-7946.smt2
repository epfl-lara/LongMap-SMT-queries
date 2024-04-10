; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98518 () Bool)

(assert start!98518)

(declare-fun b_free!24123 () Bool)

(declare-fun b_next!24123 () Bool)

(assert (=> start!98518 (= b_free!24123 (not b_next!24123))))

(declare-fun tp!85079 () Bool)

(declare-fun b_and!39095 () Bool)

(assert (=> start!98518 (= tp!85079 b_and!39095)))

(declare-fun c!111966 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!111969 () Bool)

(declare-datatypes ((V!43331 0))(
  ( (V!43332 (val!14383 Int)) )
))
(declare-fun minValue!944 () V!43331)

(declare-datatypes ((tuple2!18190 0))(
  ( (tuple2!18191 (_1!9106 (_ BitVec 64)) (_2!9106 V!43331)) )
))
(declare-datatypes ((List!24945 0))(
  ( (Nil!24942) (Cons!24941 (h!26150 tuple2!18190) (t!36060 List!24945)) )
))
(declare-datatypes ((ListLongMap!16159 0))(
  ( (ListLongMap!16160 (toList!8095 List!24945)) )
))
(declare-fun lt!508078 () ListLongMap!16159)

(declare-fun zeroValue!944 () V!43331)

(declare-fun bm!51015 () Bool)

(declare-datatypes ((Unit!37409 0))(
  ( (Unit!37410) )
))
(declare-fun call!51020 () Unit!37409)

(declare-fun addStillContains!784 (ListLongMap!16159 (_ BitVec 64) V!43331 (_ BitVec 64)) Unit!37409)

(assert (=> bm!51015 (= call!51020 (addStillContains!784 lt!508078 (ite (or c!111966 c!111969) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111966 c!111969) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1140782 () Bool)

(declare-fun e!649039 () Bool)

(declare-fun tp_is_empty!28653 () Bool)

(assert (=> b!1140782 (= e!649039 tp_is_empty!28653)))

(declare-fun call!51018 () ListLongMap!16159)

(declare-fun bm!51016 () Bool)

(declare-fun +!3527 (ListLongMap!16159 tuple2!18190) ListLongMap!16159)

(assert (=> bm!51016 (= call!51018 (+!3527 lt!508078 (ite (or c!111966 c!111969) (tuple2!18191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1140783 () Bool)

(declare-fun e!649046 () Bool)

(declare-fun e!649045 () Bool)

(assert (=> b!1140783 (= e!649046 e!649045)))

(declare-fun res!760556 () Bool)

(assert (=> b!1140783 (=> res!760556 e!649045)))

(declare-datatypes ((array!74163 0))(
  ( (array!74164 (arr!35732 (Array (_ BitVec 32) (_ BitVec 64))) (size!36268 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74163)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1140783 (= res!760556 (not (= (select (arr!35732 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649034 () Bool)

(assert (=> b!1140783 e!649034))

(declare-fun c!111970 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140783 (= c!111970 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!508083 () Unit!37409)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13617 0))(
  ( (ValueCellFull!13617 (v!17020 V!43331)) (EmptyCell!13617) )
))
(declare-datatypes ((array!74165 0))(
  ( (array!74166 (arr!35733 (Array (_ BitVec 32) ValueCell!13617)) (size!36269 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74165)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!490 (array!74163 array!74165 (_ BitVec 32) (_ BitVec 32) V!43331 V!43331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37409)

(assert (=> b!1140783 (= lt!508083 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140784 () Bool)

(declare-fun e!649043 () Unit!37409)

(declare-fun Unit!37411 () Unit!37409)

(assert (=> b!1140784 (= e!649043 Unit!37411)))

(declare-fun b!1140785 () Bool)

(declare-fun e!649041 () Unit!37409)

(declare-fun e!649035 () Unit!37409)

(assert (=> b!1140785 (= e!649041 e!649035)))

(declare-fun c!111967 () Bool)

(declare-fun lt!508071 () Bool)

(assert (=> b!1140785 (= c!111967 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508071))))

(declare-fun bm!51017 () Bool)

(declare-fun lt!508070 () ListLongMap!16159)

(declare-fun call!51021 () Bool)

(declare-fun call!51023 () ListLongMap!16159)

(declare-fun contains!6630 (ListLongMap!16159 (_ BitVec 64)) Bool)

(assert (=> bm!51017 (= call!51021 (contains!6630 (ite c!111966 lt!508070 call!51023) k0!934))))

(declare-fun b!1140786 () Bool)

(declare-fun Unit!37412 () Unit!37409)

(assert (=> b!1140786 (= e!649035 Unit!37412)))

(declare-fun b!1140787 () Bool)

(declare-fun res!760559 () Bool)

(declare-fun e!649044 () Bool)

(assert (=> b!1140787 (=> (not res!760559) (not e!649044))))

(assert (=> b!1140787 (= res!760559 (and (= (size!36269 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36268 _keys!1208) (size!36269 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140788 () Bool)

(declare-fun e!649042 () Bool)

(assert (=> b!1140788 (= e!649044 e!649042)))

(declare-fun res!760554 () Bool)

(assert (=> b!1140788 (=> (not res!760554) (not e!649042))))

(declare-fun lt!508086 () array!74163)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74163 (_ BitVec 32)) Bool)

(assert (=> b!1140788 (= res!760554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508086 mask!1564))))

(assert (=> b!1140788 (= lt!508086 (array!74164 (store (arr!35732 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36268 _keys!1208)))))

(declare-fun b!1140789 () Bool)

(declare-fun res!760552 () Bool)

(assert (=> b!1140789 (=> (not res!760552) (not e!649042))))

(declare-datatypes ((List!24946 0))(
  ( (Nil!24943) (Cons!24942 (h!26151 (_ BitVec 64)) (t!36061 List!24946)) )
))
(declare-fun arrayNoDuplicates!0 (array!74163 (_ BitVec 32) List!24946) Bool)

(assert (=> b!1140789 (= res!760552 (arrayNoDuplicates!0 lt!508086 #b00000000000000000000000000000000 Nil!24943))))

(declare-fun b!1140790 () Bool)

(declare-fun res!760549 () Bool)

(assert (=> b!1140790 (=> (not res!760549) (not e!649044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140790 (= res!760549 (validMask!0 mask!1564))))

(declare-fun b!1140791 () Bool)

(declare-fun Unit!37413 () Unit!37409)

(assert (=> b!1140791 (= e!649043 Unit!37413)))

(assert (=> b!1140791 (= lt!508071 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140791 (= c!111966 (and (not lt!508071) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508068 () Unit!37409)

(declare-fun e!649040 () Unit!37409)

(assert (=> b!1140791 (= lt!508068 e!649040)))

(declare-fun lt!508076 () Unit!37409)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!383 (array!74163 array!74165 (_ BitVec 32) (_ BitVec 32) V!43331 V!43331 (_ BitVec 64) (_ BitVec 32) Int) Unit!37409)

(assert (=> b!1140791 (= lt!508076 (lemmaListMapContainsThenArrayContainsFrom!383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111965 () Bool)

(assert (=> b!1140791 (= c!111965 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760546 () Bool)

(declare-fun e!649047 () Bool)

(assert (=> b!1140791 (= res!760546 e!649047)))

(declare-fun e!649038 () Bool)

(assert (=> b!1140791 (=> (not res!760546) (not e!649038))))

(assert (=> b!1140791 e!649038))

(declare-fun lt!508074 () Unit!37409)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74163 (_ BitVec 32) (_ BitVec 32)) Unit!37409)

(assert (=> b!1140791 (= lt!508074 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140791 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24943)))

(declare-fun lt!508067 () Unit!37409)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74163 (_ BitVec 64) (_ BitVec 32) List!24946) Unit!37409)

(assert (=> b!1140791 (= lt!508067 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24943))))

(assert (=> b!1140791 false))

(declare-fun bm!51018 () Bool)

(declare-fun lt!508081 () array!74165)

(declare-fun call!51019 () ListLongMap!16159)

(declare-fun getCurrentListMapNoExtraKeys!4577 (array!74163 array!74165 (_ BitVec 32) (_ BitVec 32) V!43331 V!43331 (_ BitVec 32) Int) ListLongMap!16159)

(assert (=> bm!51018 (= call!51019 (getCurrentListMapNoExtraKeys!4577 lt!508086 lt!508081 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44804 () Bool)

(declare-fun mapRes!44804 () Bool)

(declare-fun tp!85080 () Bool)

(declare-fun e!649032 () Bool)

(assert (=> mapNonEmpty!44804 (= mapRes!44804 (and tp!85080 e!649032))))

(declare-fun mapRest!44804 () (Array (_ BitVec 32) ValueCell!13617))

(declare-fun mapKey!44804 () (_ BitVec 32))

(declare-fun mapValue!44804 () ValueCell!13617)

(assert (=> mapNonEmpty!44804 (= (arr!35733 _values!996) (store mapRest!44804 mapKey!44804 mapValue!44804))))

(declare-fun b!1140792 () Bool)

(assert (=> b!1140792 (= e!649047 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508071) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140793 () Bool)

(declare-fun res!760547 () Bool)

(assert (=> b!1140793 (=> (not res!760547) (not e!649044))))

(assert (=> b!1140793 (= res!760547 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24943))))

(declare-fun b!1140794 () Bool)

(declare-fun e!649036 () Bool)

(assert (=> b!1140794 (= e!649036 (and e!649039 mapRes!44804))))

(declare-fun condMapEmpty!44804 () Bool)

(declare-fun mapDefault!44804 () ValueCell!13617)

(assert (=> b!1140794 (= condMapEmpty!44804 (= (arr!35733 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13617)) mapDefault!44804)))))

(declare-fun b!1140795 () Bool)

(declare-fun arrayContainsKey!0 (array!74163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140795 (= e!649047 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140796 () Bool)

(assert (=> b!1140796 (= e!649045 true)))

(declare-fun lt!508072 () V!43331)

(declare-fun -!1245 (ListLongMap!16159 (_ BitVec 64)) ListLongMap!16159)

(assert (=> b!1140796 (= (-!1245 (+!3527 lt!508078 (tuple2!18191 (select (arr!35732 _keys!1208) from!1455) lt!508072)) (select (arr!35732 _keys!1208) from!1455)) lt!508078)))

(declare-fun lt!508069 () Unit!37409)

(declare-fun addThenRemoveForNewKeyIsSame!99 (ListLongMap!16159 (_ BitVec 64) V!43331) Unit!37409)

(assert (=> b!1140796 (= lt!508069 (addThenRemoveForNewKeyIsSame!99 lt!508078 (select (arr!35732 _keys!1208) from!1455) lt!508072))))

(declare-fun lt!508073 () V!43331)

(declare-fun get!18153 (ValueCell!13617 V!43331) V!43331)

(assert (=> b!1140796 (= lt!508072 (get!18153 (select (arr!35733 _values!996) from!1455) lt!508073))))

(declare-fun lt!508080 () Unit!37409)

(assert (=> b!1140796 (= lt!508080 e!649043)))

(declare-fun c!111968 () Bool)

(assert (=> b!1140796 (= c!111968 (contains!6630 lt!508078 k0!934))))

(assert (=> b!1140796 (= lt!508078 (getCurrentListMapNoExtraKeys!4577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140797 () Bool)

(declare-fun call!51022 () ListLongMap!16159)

(assert (=> b!1140797 (= e!649034 (= call!51019 call!51022))))

(declare-fun b!1140798 () Bool)

(assert (=> b!1140798 (= e!649034 (= call!51019 (-!1245 call!51022 k0!934)))))

(declare-fun b!1140799 () Bool)

(declare-fun call!51025 () Bool)

(assert (=> b!1140799 call!51025))

(declare-fun lt!508085 () Unit!37409)

(declare-fun call!51024 () Unit!37409)

(assert (=> b!1140799 (= lt!508085 call!51024)))

(assert (=> b!1140799 (= e!649035 lt!508085)))

(declare-fun bm!51019 () Bool)

(assert (=> bm!51019 (= call!51023 call!51018)))

(declare-fun b!1140800 () Bool)

(assert (=> b!1140800 (= e!649038 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140801 () Bool)

(declare-fun res!760550 () Bool)

(assert (=> b!1140801 (=> (not res!760550) (not e!649044))))

(assert (=> b!1140801 (= res!760550 (= (select (arr!35732 _keys!1208) i!673) k0!934))))

(declare-fun b!1140802 () Bool)

(declare-fun e!649033 () Bool)

(assert (=> b!1140802 (= e!649033 e!649046)))

(declare-fun res!760555 () Bool)

(assert (=> b!1140802 (=> res!760555 e!649046)))

(assert (=> b!1140802 (= res!760555 (not (= from!1455 i!673)))))

(declare-fun lt!508084 () ListLongMap!16159)

(assert (=> b!1140802 (= lt!508084 (getCurrentListMapNoExtraKeys!4577 lt!508086 lt!508081 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140802 (= lt!508081 (array!74166 (store (arr!35733 _values!996) i!673 (ValueCellFull!13617 lt!508073)) (size!36269 _values!996)))))

(declare-fun dynLambda!2623 (Int (_ BitVec 64)) V!43331)

(assert (=> b!1140802 (= lt!508073 (dynLambda!2623 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508066 () ListLongMap!16159)

(assert (=> b!1140802 (= lt!508066 (getCurrentListMapNoExtraKeys!4577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140803 () Bool)

(declare-fun res!760558 () Bool)

(assert (=> b!1140803 (=> (not res!760558) (not e!649044))))

(assert (=> b!1140803 (= res!760558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44804 () Bool)

(assert (=> mapIsEmpty!44804 mapRes!44804))

(declare-fun bm!51020 () Bool)

(assert (=> bm!51020 (= call!51025 call!51021)))

(declare-fun b!1140804 () Bool)

(assert (=> b!1140804 (= e!649042 (not e!649033))))

(declare-fun res!760557 () Bool)

(assert (=> b!1140804 (=> res!760557 e!649033)))

(assert (=> b!1140804 (= res!760557 (bvsgt from!1455 i!673))))

(assert (=> b!1140804 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508075 () Unit!37409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74163 (_ BitVec 64) (_ BitVec 32)) Unit!37409)

(assert (=> b!1140804 (= lt!508075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140805 () Bool)

(declare-fun lt!508077 () Unit!37409)

(assert (=> b!1140805 (= e!649041 lt!508077)))

(assert (=> b!1140805 (= lt!508077 call!51024)))

(assert (=> b!1140805 call!51025))

(declare-fun b!1140806 () Bool)

(assert (=> b!1140806 (= e!649032 tp_is_empty!28653)))

(declare-fun b!1140807 () Bool)

(declare-fun res!760553 () Bool)

(assert (=> b!1140807 (=> (not res!760553) (not e!649044))))

(assert (=> b!1140807 (= res!760553 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36268 _keys!1208))))))

(declare-fun b!1140808 () Bool)

(assert (=> b!1140808 (contains!6630 (+!3527 lt!508070 (tuple2!18191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!508079 () Unit!37409)

(assert (=> b!1140808 (= lt!508079 (addStillContains!784 lt!508070 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1140808 call!51021))

(assert (=> b!1140808 (= lt!508070 call!51018)))

(declare-fun lt!508082 () Unit!37409)

(assert (=> b!1140808 (= lt!508082 call!51020)))

(assert (=> b!1140808 (= e!649040 lt!508079)))

(declare-fun bm!51021 () Bool)

(assert (=> bm!51021 (= call!51022 (getCurrentListMapNoExtraKeys!4577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51022 () Bool)

(assert (=> bm!51022 (= call!51024 call!51020)))

(declare-fun res!760551 () Bool)

(assert (=> start!98518 (=> (not res!760551) (not e!649044))))

(assert (=> start!98518 (= res!760551 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36268 _keys!1208))))))

(assert (=> start!98518 e!649044))

(assert (=> start!98518 tp_is_empty!28653))

(declare-fun array_inv!27388 (array!74163) Bool)

(assert (=> start!98518 (array_inv!27388 _keys!1208)))

(assert (=> start!98518 true))

(assert (=> start!98518 tp!85079))

(declare-fun array_inv!27389 (array!74165) Bool)

(assert (=> start!98518 (and (array_inv!27389 _values!996) e!649036)))

(declare-fun b!1140809 () Bool)

(assert (=> b!1140809 (= c!111969 (and (not lt!508071) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140809 (= e!649040 e!649041)))

(declare-fun b!1140810 () Bool)

(declare-fun res!760548 () Bool)

(assert (=> b!1140810 (=> (not res!760548) (not e!649044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140810 (= res!760548 (validKeyInArray!0 k0!934))))

(assert (= (and start!98518 res!760551) b!1140790))

(assert (= (and b!1140790 res!760549) b!1140787))

(assert (= (and b!1140787 res!760559) b!1140803))

(assert (= (and b!1140803 res!760558) b!1140793))

(assert (= (and b!1140793 res!760547) b!1140807))

(assert (= (and b!1140807 res!760553) b!1140810))

(assert (= (and b!1140810 res!760548) b!1140801))

(assert (= (and b!1140801 res!760550) b!1140788))

(assert (= (and b!1140788 res!760554) b!1140789))

(assert (= (and b!1140789 res!760552) b!1140804))

(assert (= (and b!1140804 (not res!760557)) b!1140802))

(assert (= (and b!1140802 (not res!760555)) b!1140783))

(assert (= (and b!1140783 c!111970) b!1140798))

(assert (= (and b!1140783 (not c!111970)) b!1140797))

(assert (= (or b!1140798 b!1140797) bm!51021))

(assert (= (or b!1140798 b!1140797) bm!51018))

(assert (= (and b!1140783 (not res!760556)) b!1140796))

(assert (= (and b!1140796 c!111968) b!1140791))

(assert (= (and b!1140796 (not c!111968)) b!1140784))

(assert (= (and b!1140791 c!111966) b!1140808))

(assert (= (and b!1140791 (not c!111966)) b!1140809))

(assert (= (and b!1140809 c!111969) b!1140805))

(assert (= (and b!1140809 (not c!111969)) b!1140785))

(assert (= (and b!1140785 c!111967) b!1140799))

(assert (= (and b!1140785 (not c!111967)) b!1140786))

(assert (= (or b!1140805 b!1140799) bm!51022))

(assert (= (or b!1140805 b!1140799) bm!51019))

(assert (= (or b!1140805 b!1140799) bm!51020))

(assert (= (or b!1140808 bm!51020) bm!51017))

(assert (= (or b!1140808 bm!51022) bm!51015))

(assert (= (or b!1140808 bm!51019) bm!51016))

(assert (= (and b!1140791 c!111965) b!1140795))

(assert (= (and b!1140791 (not c!111965)) b!1140792))

(assert (= (and b!1140791 res!760546) b!1140800))

(assert (= (and b!1140794 condMapEmpty!44804) mapIsEmpty!44804))

(assert (= (and b!1140794 (not condMapEmpty!44804)) mapNonEmpty!44804))

(get-info :version)

(assert (= (and mapNonEmpty!44804 ((_ is ValueCellFull!13617) mapValue!44804)) b!1140806))

(assert (= (and b!1140794 ((_ is ValueCellFull!13617) mapDefault!44804)) b!1140782))

(assert (= start!98518 b!1140794))

(declare-fun b_lambda!19229 () Bool)

(assert (=> (not b_lambda!19229) (not b!1140802)))

(declare-fun t!36059 () Bool)

(declare-fun tb!8935 () Bool)

(assert (=> (and start!98518 (= defaultEntry!1004 defaultEntry!1004) t!36059) tb!8935))

(declare-fun result!18435 () Bool)

(assert (=> tb!8935 (= result!18435 tp_is_empty!28653)))

(assert (=> b!1140802 t!36059))

(declare-fun b_and!39097 () Bool)

(assert (= b_and!39095 (and (=> t!36059 result!18435) b_and!39097)))

(declare-fun m!1052251 () Bool)

(assert (=> b!1140802 m!1052251))

(declare-fun m!1052253 () Bool)

(assert (=> b!1140802 m!1052253))

(declare-fun m!1052255 () Bool)

(assert (=> b!1140802 m!1052255))

(declare-fun m!1052257 () Bool)

(assert (=> b!1140802 m!1052257))

(declare-fun m!1052259 () Bool)

(assert (=> start!98518 m!1052259))

(declare-fun m!1052261 () Bool)

(assert (=> start!98518 m!1052261))

(declare-fun m!1052263 () Bool)

(assert (=> b!1140810 m!1052263))

(declare-fun m!1052265 () Bool)

(assert (=> bm!51015 m!1052265))

(declare-fun m!1052267 () Bool)

(assert (=> bm!51021 m!1052267))

(declare-fun m!1052269 () Bool)

(assert (=> b!1140803 m!1052269))

(declare-fun m!1052271 () Bool)

(assert (=> b!1140800 m!1052271))

(declare-fun m!1052273 () Bool)

(assert (=> b!1140791 m!1052273))

(declare-fun m!1052275 () Bool)

(assert (=> b!1140791 m!1052275))

(declare-fun m!1052277 () Bool)

(assert (=> b!1140791 m!1052277))

(declare-fun m!1052279 () Bool)

(assert (=> b!1140791 m!1052279))

(declare-fun m!1052281 () Bool)

(assert (=> bm!51018 m!1052281))

(declare-fun m!1052283 () Bool)

(assert (=> b!1140789 m!1052283))

(assert (=> b!1140795 m!1052271))

(declare-fun m!1052285 () Bool)

(assert (=> b!1140798 m!1052285))

(declare-fun m!1052287 () Bool)

(assert (=> b!1140788 m!1052287))

(declare-fun m!1052289 () Bool)

(assert (=> b!1140788 m!1052289))

(declare-fun m!1052291 () Bool)

(assert (=> b!1140783 m!1052291))

(declare-fun m!1052293 () Bool)

(assert (=> b!1140783 m!1052293))

(declare-fun m!1052295 () Bool)

(assert (=> mapNonEmpty!44804 m!1052295))

(declare-fun m!1052297 () Bool)

(assert (=> b!1140793 m!1052297))

(declare-fun m!1052299 () Bool)

(assert (=> b!1140790 m!1052299))

(declare-fun m!1052301 () Bool)

(assert (=> b!1140801 m!1052301))

(declare-fun m!1052303 () Bool)

(assert (=> bm!51017 m!1052303))

(assert (=> b!1140796 m!1052267))

(declare-fun m!1052305 () Bool)

(assert (=> b!1140796 m!1052305))

(declare-fun m!1052307 () Bool)

(assert (=> b!1140796 m!1052307))

(assert (=> b!1140796 m!1052291))

(declare-fun m!1052309 () Bool)

(assert (=> b!1140796 m!1052309))

(assert (=> b!1140796 m!1052305))

(declare-fun m!1052311 () Bool)

(assert (=> b!1140796 m!1052311))

(assert (=> b!1140796 m!1052291))

(declare-fun m!1052313 () Bool)

(assert (=> b!1140796 m!1052313))

(assert (=> b!1140796 m!1052307))

(assert (=> b!1140796 m!1052291))

(declare-fun m!1052315 () Bool)

(assert (=> b!1140796 m!1052315))

(declare-fun m!1052317 () Bool)

(assert (=> bm!51016 m!1052317))

(declare-fun m!1052319 () Bool)

(assert (=> b!1140804 m!1052319))

(declare-fun m!1052321 () Bool)

(assert (=> b!1140804 m!1052321))

(declare-fun m!1052323 () Bool)

(assert (=> b!1140808 m!1052323))

(assert (=> b!1140808 m!1052323))

(declare-fun m!1052325 () Bool)

(assert (=> b!1140808 m!1052325))

(declare-fun m!1052327 () Bool)

(assert (=> b!1140808 m!1052327))

(check-sat (not b!1140804) (not mapNonEmpty!44804) (not bm!51017) (not bm!51015) (not start!98518) (not b!1140803) (not b!1140789) (not bm!51018) (not b!1140800) tp_is_empty!28653 (not b!1140798) (not b_next!24123) (not b!1140796) (not b!1140791) (not bm!51021) (not b!1140790) (not b!1140808) (not b!1140810) (not b!1140788) (not b_lambda!19229) (not b!1140802) (not bm!51016) (not b!1140783) (not b!1140793) b_and!39097 (not b!1140795))
(check-sat b_and!39097 (not b_next!24123))
