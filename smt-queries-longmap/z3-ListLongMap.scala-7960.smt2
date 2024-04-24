; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98836 () Bool)

(assert start!98836)

(declare-fun b_free!24205 () Bool)

(declare-fun b_next!24205 () Bool)

(assert (=> start!98836 (= b_free!24205 (not b_next!24205))))

(declare-fun tp!85326 () Bool)

(declare-fun b_and!39261 () Bool)

(assert (=> start!98836 (= tp!85326 b_and!39261)))

(declare-fun res!762788 () Bool)

(declare-fun e!651846 () Bool)

(assert (=> start!98836 (=> (not res!762788) (not e!651846))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74369 0))(
  ( (array!74370 (arr!35829 (Array (_ BitVec 32) (_ BitVec 64))) (size!36366 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74369)

(assert (=> start!98836 (= res!762788 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36366 _keys!1208))))))

(assert (=> start!98836 e!651846))

(declare-fun tp_is_empty!28735 () Bool)

(assert (=> start!98836 tp_is_empty!28735))

(declare-fun array_inv!27500 (array!74369) Bool)

(assert (=> start!98836 (array_inv!27500 _keys!1208)))

(assert (=> start!98836 true))

(assert (=> start!98836 tp!85326))

(declare-datatypes ((V!43441 0))(
  ( (V!43442 (val!14424 Int)) )
))
(declare-datatypes ((ValueCell!13658 0))(
  ( (ValueCellFull!13658 (v!17057 V!43441)) (EmptyCell!13658) )
))
(declare-datatypes ((array!74371 0))(
  ( (array!74372 (arr!35830 (Array (_ BitVec 32) ValueCell!13658)) (size!36367 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74371)

(declare-fun e!651852 () Bool)

(declare-fun array_inv!27501 (array!74371) Bool)

(assert (=> start!98836 (and (array_inv!27501 _values!996) e!651852)))

(declare-fun bm!52064 () Bool)

(declare-fun call!52073 () Bool)

(declare-fun call!52071 () Bool)

(assert (=> bm!52064 (= call!52073 call!52071)))

(declare-fun zeroValue!944 () V!43441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!52065 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43441)

(declare-datatypes ((tuple2!18282 0))(
  ( (tuple2!18283 (_1!9152 (_ BitVec 64)) (_2!9152 V!43441)) )
))
(declare-datatypes ((List!25038 0))(
  ( (Nil!25035) (Cons!25034 (h!26252 tuple2!18282) (t!36227 List!25038)) )
))
(declare-datatypes ((ListLongMap!16259 0))(
  ( (ListLongMap!16260 (toList!8145 List!25038)) )
))
(declare-fun call!52068 () ListLongMap!16259)

(declare-fun getCurrentListMapNoExtraKeys!4650 (array!74369 array!74371 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 32) Int) ListLongMap!16259)

(assert (=> bm!52065 (= call!52068 (getCurrentListMapNoExtraKeys!4650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!511142 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!651850 () Bool)

(declare-fun b!1145731 () Bool)

(assert (=> b!1145731 (= e!651850 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511142) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145732 () Bool)

(declare-fun e!651854 () Bool)

(assert (=> b!1145732 (= e!651846 e!651854)))

(declare-fun res!762801 () Bool)

(assert (=> b!1145732 (=> (not res!762801) (not e!651854))))

(declare-fun lt!511135 () array!74369)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74369 (_ BitVec 32)) Bool)

(assert (=> b!1145732 (= res!762801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511135 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145732 (= lt!511135 (array!74370 (store (arr!35829 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36366 _keys!1208)))))

(declare-fun mapNonEmpty!44927 () Bool)

(declare-fun mapRes!44927 () Bool)

(declare-fun tp!85325 () Bool)

(declare-fun e!651853 () Bool)

(assert (=> mapNonEmpty!44927 (= mapRes!44927 (and tp!85325 e!651853))))

(declare-fun mapRest!44927 () (Array (_ BitVec 32) ValueCell!13658))

(declare-fun mapValue!44927 () ValueCell!13658)

(declare-fun mapKey!44927 () (_ BitVec 32))

(assert (=> mapNonEmpty!44927 (= (arr!35830 _values!996) (store mapRest!44927 mapKey!44927 mapValue!44927))))

(declare-fun b!1145733 () Bool)

(declare-fun e!651848 () Bool)

(assert (=> b!1145733 (= e!651848 tp_is_empty!28735)))

(declare-fun b!1145734 () Bool)

(declare-fun e!651855 () Bool)

(declare-fun call!52074 () ListLongMap!16259)

(assert (=> b!1145734 (= e!651855 (= call!52074 call!52068))))

(declare-fun bm!52066 () Bool)

(declare-datatypes ((Unit!37545 0))(
  ( (Unit!37546) )
))
(declare-fun call!52069 () Unit!37545)

(declare-fun call!52070 () Unit!37545)

(assert (=> bm!52066 (= call!52069 call!52070)))

(declare-fun b!1145735 () Bool)

(declare-fun call!52067 () ListLongMap!16259)

(declare-fun contains!6688 (ListLongMap!16259 (_ BitVec 64)) Bool)

(assert (=> b!1145735 (contains!6688 call!52067 k0!934)))

(declare-fun lt!511146 () ListLongMap!16259)

(declare-fun lt!511144 () Unit!37545)

(declare-fun addStillContains!815 (ListLongMap!16259 (_ BitVec 64) V!43441 (_ BitVec 64)) Unit!37545)

(assert (=> b!1145735 (= lt!511144 (addStillContains!815 lt!511146 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1145735 call!52071))

(declare-fun lt!511148 () ListLongMap!16259)

(declare-fun +!3589 (ListLongMap!16259 tuple2!18282) ListLongMap!16259)

(assert (=> b!1145735 (= lt!511146 (+!3589 lt!511148 (tuple2!18283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511150 () Unit!37545)

(assert (=> b!1145735 (= lt!511150 call!52070)))

(declare-fun e!651849 () Unit!37545)

(assert (=> b!1145735 (= e!651849 lt!511144)))

(declare-fun bm!52067 () Bool)

(declare-fun call!52072 () ListLongMap!16259)

(assert (=> bm!52067 (= call!52072 call!52067)))

(declare-fun b!1145736 () Bool)

(declare-fun res!762796 () Bool)

(assert (=> b!1145736 (=> (not res!762796) (not e!651846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145736 (= res!762796 (validMask!0 mask!1564))))

(declare-fun b!1145737 () Bool)

(declare-fun c!113105 () Bool)

(assert (=> b!1145737 (= c!113105 (and (not lt!511142) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651843 () Unit!37545)

(assert (=> b!1145737 (= e!651849 e!651843)))

(declare-fun c!113101 () Bool)

(declare-fun bm!52068 () Bool)

(assert (=> bm!52068 (= call!52071 (contains!6688 (ite c!113101 lt!511146 call!52072) k0!934))))

(declare-fun b!1145738 () Bool)

(assert (=> b!1145738 call!52073))

(declare-fun lt!511137 () Unit!37545)

(assert (=> b!1145738 (= lt!511137 call!52069)))

(declare-fun e!651851 () Unit!37545)

(assert (=> b!1145738 (= e!651851 lt!511137)))

(declare-fun b!1145739 () Bool)

(declare-fun res!762795 () Bool)

(assert (=> b!1145739 (=> (not res!762795) (not e!651846))))

(assert (=> b!1145739 (= res!762795 (and (= (size!36367 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36366 _keys!1208) (size!36367 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145740 () Bool)

(declare-fun Unit!37547 () Unit!37545)

(assert (=> b!1145740 (= e!651851 Unit!37547)))

(declare-fun mapIsEmpty!44927 () Bool)

(assert (=> mapIsEmpty!44927 mapRes!44927))

(declare-fun b!1145741 () Bool)

(declare-fun e!651845 () Unit!37545)

(declare-fun Unit!37548 () Unit!37545)

(assert (=> b!1145741 (= e!651845 Unit!37548)))

(assert (=> b!1145741 (= lt!511142 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145741 (= c!113101 (and (not lt!511142) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511139 () Unit!37545)

(assert (=> b!1145741 (= lt!511139 e!651849)))

(declare-fun lt!511134 () Unit!37545)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!412 (array!74369 array!74371 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 64) (_ BitVec 32) Int) Unit!37545)

(assert (=> b!1145741 (= lt!511134 (lemmaListMapContainsThenArrayContainsFrom!412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113106 () Bool)

(assert (=> b!1145741 (= c!113106 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762791 () Bool)

(assert (=> b!1145741 (= res!762791 e!651850)))

(declare-fun e!651847 () Bool)

(assert (=> b!1145741 (=> (not res!762791) (not e!651847))))

(assert (=> b!1145741 e!651847))

(declare-fun lt!511140 () Unit!37545)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74369 (_ BitVec 32) (_ BitVec 32)) Unit!37545)

(assert (=> b!1145741 (= lt!511140 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25039 0))(
  ( (Nil!25036) (Cons!25035 (h!26253 (_ BitVec 64)) (t!36228 List!25039)) )
))
(declare-fun arrayNoDuplicates!0 (array!74369 (_ BitVec 32) List!25039) Bool)

(assert (=> b!1145741 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25036)))

(declare-fun lt!511138 () Unit!37545)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74369 (_ BitVec 64) (_ BitVec 32) List!25039) Unit!37545)

(assert (=> b!1145741 (= lt!511138 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25036))))

(assert (=> b!1145741 false))

(declare-fun b!1145742 () Bool)

(declare-fun res!762797 () Bool)

(assert (=> b!1145742 (=> (not res!762797) (not e!651846))))

(assert (=> b!1145742 (= res!762797 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36366 _keys!1208))))))

(declare-fun b!1145743 () Bool)

(declare-fun arrayContainsKey!0 (array!74369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145743 (= e!651850 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145744 () Bool)

(declare-fun e!651857 () Bool)

(assert (=> b!1145744 (= e!651854 (not e!651857))))

(declare-fun res!762789 () Bool)

(assert (=> b!1145744 (=> res!762789 e!651857)))

(assert (=> b!1145744 (= res!762789 (bvsgt from!1455 i!673))))

(assert (=> b!1145744 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511141 () Unit!37545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74369 (_ BitVec 64) (_ BitVec 32)) Unit!37545)

(assert (=> b!1145744 (= lt!511141 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145745 () Bool)

(assert (=> b!1145745 (= e!651843 e!651851)))

(declare-fun c!113102 () Bool)

(assert (=> b!1145745 (= c!113102 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511142))))

(declare-fun bm!52069 () Bool)

(declare-fun lt!511136 () array!74371)

(assert (=> bm!52069 (= call!52074 (getCurrentListMapNoExtraKeys!4650 lt!511135 lt!511136 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145746 () Bool)

(declare-fun res!762794 () Bool)

(assert (=> b!1145746 (=> (not res!762794) (not e!651846))))

(assert (=> b!1145746 (= res!762794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145747 () Bool)

(declare-fun Unit!37549 () Unit!37545)

(assert (=> b!1145747 (= e!651845 Unit!37549)))

(declare-fun b!1145748 () Bool)

(declare-fun e!651858 () Bool)

(assert (=> b!1145748 (= e!651858 true)))

(declare-fun e!651859 () Bool)

(assert (=> b!1145748 e!651859))

(declare-fun res!762800 () Bool)

(assert (=> b!1145748 (=> (not res!762800) (not e!651859))))

(declare-fun lt!511153 () V!43441)

(declare-fun -!1274 (ListLongMap!16259 (_ BitVec 64)) ListLongMap!16259)

(assert (=> b!1145748 (= res!762800 (= (-!1274 (+!3589 lt!511148 (tuple2!18283 (select (arr!35829 _keys!1208) from!1455) lt!511153)) (select (arr!35829 _keys!1208) from!1455)) lt!511148))))

(declare-fun lt!511151 () Unit!37545)

(declare-fun addThenRemoveForNewKeyIsSame!129 (ListLongMap!16259 (_ BitVec 64) V!43441) Unit!37545)

(assert (=> b!1145748 (= lt!511151 (addThenRemoveForNewKeyIsSame!129 lt!511148 (select (arr!35829 _keys!1208) from!1455) lt!511153))))

(declare-fun lt!511143 () V!43441)

(declare-fun get!18242 (ValueCell!13658 V!43441) V!43441)

(assert (=> b!1145748 (= lt!511153 (get!18242 (select (arr!35830 _values!996) from!1455) lt!511143))))

(declare-fun lt!511149 () Unit!37545)

(assert (=> b!1145748 (= lt!511149 e!651845)))

(declare-fun c!113103 () Bool)

(assert (=> b!1145748 (= c!113103 (contains!6688 lt!511148 k0!934))))

(assert (=> b!1145748 (= lt!511148 (getCurrentListMapNoExtraKeys!4650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145749 () Bool)

(declare-fun res!762787 () Bool)

(assert (=> b!1145749 (=> (not res!762787) (not e!651846))))

(assert (=> b!1145749 (= res!762787 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25036))))

(declare-fun b!1145750 () Bool)

(declare-fun res!762793 () Bool)

(assert (=> b!1145750 (=> (not res!762793) (not e!651854))))

(assert (=> b!1145750 (= res!762793 (arrayNoDuplicates!0 lt!511135 #b00000000000000000000000000000000 Nil!25036))))

(declare-fun b!1145751 () Bool)

(declare-fun res!762798 () Bool)

(assert (=> b!1145751 (=> (not res!762798) (not e!651846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145751 (= res!762798 (validKeyInArray!0 k0!934))))

(declare-fun b!1145752 () Bool)

(declare-fun res!762799 () Bool)

(assert (=> b!1145752 (=> (not res!762799) (not e!651846))))

(assert (=> b!1145752 (= res!762799 (= (select (arr!35829 _keys!1208) i!673) k0!934))))

(declare-fun b!1145753 () Bool)

(assert (=> b!1145753 (= e!651852 (and e!651848 mapRes!44927))))

(declare-fun condMapEmpty!44927 () Bool)

(declare-fun mapDefault!44927 () ValueCell!13658)

(assert (=> b!1145753 (= condMapEmpty!44927 (= (arr!35830 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13658)) mapDefault!44927)))))

(declare-fun b!1145754 () Bool)

(assert (=> b!1145754 (= e!651855 (= call!52074 (-!1274 call!52068 k0!934)))))

(declare-fun b!1145755 () Bool)

(assert (=> b!1145755 (= e!651853 tp_is_empty!28735)))

(declare-fun b!1145756 () Bool)

(declare-fun lt!511133 () Unit!37545)

(assert (=> b!1145756 (= e!651843 lt!511133)))

(assert (=> b!1145756 (= lt!511133 call!52069)))

(assert (=> b!1145756 call!52073))

(declare-fun b!1145757 () Bool)

(declare-fun e!651856 () Bool)

(assert (=> b!1145757 (= e!651857 e!651856)))

(declare-fun res!762792 () Bool)

(assert (=> b!1145757 (=> res!762792 e!651856)))

(assert (=> b!1145757 (= res!762792 (not (= from!1455 i!673)))))

(declare-fun lt!511152 () ListLongMap!16259)

(assert (=> b!1145757 (= lt!511152 (getCurrentListMapNoExtraKeys!4650 lt!511135 lt!511136 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145757 (= lt!511136 (array!74372 (store (arr!35830 _values!996) i!673 (ValueCellFull!13658 lt!511143)) (size!36367 _values!996)))))

(declare-fun dynLambda!2682 (Int (_ BitVec 64)) V!43441)

(assert (=> b!1145757 (= lt!511143 (dynLambda!2682 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511147 () ListLongMap!16259)

(assert (=> b!1145757 (= lt!511147 (getCurrentListMapNoExtraKeys!4650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52070 () Bool)

(assert (=> bm!52070 (= call!52067 (+!3589 (ite c!113101 lt!511146 lt!511148) (ite c!113101 (tuple2!18283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113105 (tuple2!18283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1145758 () Bool)

(assert (=> b!1145758 (= e!651856 e!651858)))

(declare-fun res!762790 () Bool)

(assert (=> b!1145758 (=> res!762790 e!651858)))

(assert (=> b!1145758 (= res!762790 (not (= (select (arr!35829 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1145758 e!651855))

(declare-fun c!113104 () Bool)

(assert (=> b!1145758 (= c!113104 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511145 () Unit!37545)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!521 (array!74369 array!74371 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37545)

(assert (=> b!1145758 (= lt!511145 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145759 () Bool)

(assert (=> b!1145759 (= e!651859 (= (-!1274 lt!511147 k0!934) lt!511148))))

(declare-fun bm!52071 () Bool)

(assert (=> bm!52071 (= call!52070 (addStillContains!815 lt!511148 (ite (or c!113101 c!113105) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113101 c!113105) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1145760 () Bool)

(assert (=> b!1145760 (= e!651847 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98836 res!762788) b!1145736))

(assert (= (and b!1145736 res!762796) b!1145739))

(assert (= (and b!1145739 res!762795) b!1145746))

(assert (= (and b!1145746 res!762794) b!1145749))

(assert (= (and b!1145749 res!762787) b!1145742))

(assert (= (and b!1145742 res!762797) b!1145751))

(assert (= (and b!1145751 res!762798) b!1145752))

(assert (= (and b!1145752 res!762799) b!1145732))

(assert (= (and b!1145732 res!762801) b!1145750))

(assert (= (and b!1145750 res!762793) b!1145744))

(assert (= (and b!1145744 (not res!762789)) b!1145757))

(assert (= (and b!1145757 (not res!762792)) b!1145758))

(assert (= (and b!1145758 c!113104) b!1145754))

(assert (= (and b!1145758 (not c!113104)) b!1145734))

(assert (= (or b!1145754 b!1145734) bm!52069))

(assert (= (or b!1145754 b!1145734) bm!52065))

(assert (= (and b!1145758 (not res!762790)) b!1145748))

(assert (= (and b!1145748 c!113103) b!1145741))

(assert (= (and b!1145748 (not c!113103)) b!1145747))

(assert (= (and b!1145741 c!113101) b!1145735))

(assert (= (and b!1145741 (not c!113101)) b!1145737))

(assert (= (and b!1145737 c!113105) b!1145756))

(assert (= (and b!1145737 (not c!113105)) b!1145745))

(assert (= (and b!1145745 c!113102) b!1145738))

(assert (= (and b!1145745 (not c!113102)) b!1145740))

(assert (= (or b!1145756 b!1145738) bm!52066))

(assert (= (or b!1145756 b!1145738) bm!52067))

(assert (= (or b!1145756 b!1145738) bm!52064))

(assert (= (or b!1145735 bm!52064) bm!52068))

(assert (= (or b!1145735 bm!52066) bm!52071))

(assert (= (or b!1145735 bm!52067) bm!52070))

(assert (= (and b!1145741 c!113106) b!1145743))

(assert (= (and b!1145741 (not c!113106)) b!1145731))

(assert (= (and b!1145741 res!762791) b!1145760))

(assert (= (and b!1145748 res!762800) b!1145759))

(assert (= (and b!1145753 condMapEmpty!44927) mapIsEmpty!44927))

(assert (= (and b!1145753 (not condMapEmpty!44927)) mapNonEmpty!44927))

(get-info :version)

(assert (= (and mapNonEmpty!44927 ((_ is ValueCellFull!13658) mapValue!44927)) b!1145755))

(assert (= (and b!1145753 ((_ is ValueCellFull!13658) mapDefault!44927)) b!1145733))

(assert (= start!98836 b!1145753))

(declare-fun b_lambda!19305 () Bool)

(assert (=> (not b_lambda!19305) (not b!1145757)))

(declare-fun t!36226 () Bool)

(declare-fun tb!9009 () Bool)

(assert (=> (and start!98836 (= defaultEntry!1004 defaultEntry!1004) t!36226) tb!9009))

(declare-fun result!18591 () Bool)

(assert (=> tb!9009 (= result!18591 tp_is_empty!28735)))

(assert (=> b!1145757 t!36226))

(declare-fun b_and!39263 () Bool)

(assert (= b_and!39261 (and (=> t!36226 result!18591) b_and!39263)))

(declare-fun m!1057031 () Bool)

(assert (=> b!1145750 m!1057031))

(declare-fun m!1057033 () Bool)

(assert (=> b!1145751 m!1057033))

(declare-fun m!1057035 () Bool)

(assert (=> b!1145735 m!1057035))

(declare-fun m!1057037 () Bool)

(assert (=> b!1145735 m!1057037))

(declare-fun m!1057039 () Bool)

(assert (=> b!1145735 m!1057039))

(declare-fun m!1057041 () Bool)

(assert (=> b!1145758 m!1057041))

(declare-fun m!1057043 () Bool)

(assert (=> b!1145758 m!1057043))

(declare-fun m!1057045 () Bool)

(assert (=> b!1145752 m!1057045))

(declare-fun m!1057047 () Bool)

(assert (=> b!1145741 m!1057047))

(declare-fun m!1057049 () Bool)

(assert (=> b!1145741 m!1057049))

(declare-fun m!1057051 () Bool)

(assert (=> b!1145741 m!1057051))

(declare-fun m!1057053 () Bool)

(assert (=> b!1145741 m!1057053))

(declare-fun m!1057055 () Bool)

(assert (=> b!1145754 m!1057055))

(declare-fun m!1057057 () Bool)

(assert (=> b!1145746 m!1057057))

(declare-fun m!1057059 () Bool)

(assert (=> b!1145732 m!1057059))

(declare-fun m!1057061 () Bool)

(assert (=> b!1145732 m!1057061))

(declare-fun m!1057063 () Bool)

(assert (=> b!1145760 m!1057063))

(declare-fun m!1057065 () Bool)

(assert (=> bm!52070 m!1057065))

(declare-fun m!1057067 () Bool)

(assert (=> bm!52069 m!1057067))

(declare-fun m!1057069 () Bool)

(assert (=> bm!52068 m!1057069))

(declare-fun m!1057071 () Bool)

(assert (=> b!1145736 m!1057071))

(assert (=> b!1145743 m!1057063))

(declare-fun m!1057073 () Bool)

(assert (=> b!1145744 m!1057073))

(declare-fun m!1057075 () Bool)

(assert (=> b!1145744 m!1057075))

(declare-fun m!1057077 () Bool)

(assert (=> b!1145748 m!1057077))

(declare-fun m!1057079 () Bool)

(assert (=> b!1145748 m!1057079))

(assert (=> b!1145748 m!1057041))

(declare-fun m!1057081 () Bool)

(assert (=> b!1145748 m!1057081))

(assert (=> b!1145748 m!1057041))

(declare-fun m!1057083 () Bool)

(assert (=> b!1145748 m!1057083))

(declare-fun m!1057085 () Bool)

(assert (=> b!1145748 m!1057085))

(assert (=> b!1145748 m!1057077))

(declare-fun m!1057087 () Bool)

(assert (=> b!1145748 m!1057087))

(assert (=> b!1145748 m!1057041))

(declare-fun m!1057089 () Bool)

(assert (=> b!1145748 m!1057089))

(assert (=> b!1145748 m!1057079))

(declare-fun m!1057091 () Bool)

(assert (=> start!98836 m!1057091))

(declare-fun m!1057093 () Bool)

(assert (=> start!98836 m!1057093))

(declare-fun m!1057095 () Bool)

(assert (=> mapNonEmpty!44927 m!1057095))

(declare-fun m!1057097 () Bool)

(assert (=> b!1145759 m!1057097))

(declare-fun m!1057099 () Bool)

(assert (=> bm!52071 m!1057099))

(assert (=> bm!52065 m!1057089))

(declare-fun m!1057101 () Bool)

(assert (=> b!1145749 m!1057101))

(declare-fun m!1057103 () Bool)

(assert (=> b!1145757 m!1057103))

(declare-fun m!1057105 () Bool)

(assert (=> b!1145757 m!1057105))

(declare-fun m!1057107 () Bool)

(assert (=> b!1145757 m!1057107))

(declare-fun m!1057109 () Bool)

(assert (=> b!1145757 m!1057109))

(check-sat (not b!1145759) (not mapNonEmpty!44927) b_and!39263 tp_is_empty!28735 (not b!1145750) (not bm!52070) (not bm!52068) (not b!1145735) (not b!1145757) (not b!1145751) (not bm!52069) (not b!1145741) (not b!1145754) (not b!1145732) (not b!1145749) (not bm!52065) (not start!98836) (not b!1145758) (not b!1145748) (not bm!52071) (not b!1145743) (not b!1145736) (not b!1145744) (not b!1145760) (not b_lambda!19305) (not b!1145746) (not b_next!24205))
(check-sat b_and!39263 (not b_next!24205))
