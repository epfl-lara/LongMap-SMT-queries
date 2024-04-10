; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98584 () Bool)

(assert start!98584)

(declare-fun b_free!24189 () Bool)

(declare-fun b_next!24189 () Bool)

(assert (=> start!98584 (= b_free!24189 (not b_next!24189))))

(declare-fun tp!85278 () Bool)

(declare-fun b_and!39227 () Bool)

(assert (=> start!98584 (= tp!85278 b_and!39227)))

(declare-fun b!1143719 () Bool)

(declare-fun e!650631 () Bool)

(declare-fun tp_is_empty!28719 () Bool)

(assert (=> b!1143719 (= e!650631 tp_is_empty!28719)))

(declare-fun b!1143720 () Bool)

(declare-fun e!650630 () Bool)

(assert (=> b!1143720 (= e!650630 true)))

(declare-datatypes ((array!74291 0))(
  ( (array!74292 (arr!35796 (Array (_ BitVec 32) (_ BitVec 64))) (size!36332 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74291)

(declare-datatypes ((V!43419 0))(
  ( (V!43420 (val!14416 Int)) )
))
(declare-datatypes ((tuple2!18252 0))(
  ( (tuple2!18253 (_1!9137 (_ BitVec 64)) (_2!9137 V!43419)) )
))
(declare-datatypes ((List!25005 0))(
  ( (Nil!25002) (Cons!25001 (h!26210 tuple2!18252) (t!36186 List!25005)) )
))
(declare-datatypes ((ListLongMap!16221 0))(
  ( (ListLongMap!16222 (toList!8126 List!25005)) )
))
(declare-fun lt!510150 () ListLongMap!16221)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!510163 () V!43419)

(declare-fun -!1271 (ListLongMap!16221 (_ BitVec 64)) ListLongMap!16221)

(declare-fun +!3554 (ListLongMap!16221 tuple2!18252) ListLongMap!16221)

(assert (=> b!1143720 (= (-!1271 (+!3554 lt!510150 (tuple2!18253 (select (arr!35796 _keys!1208) from!1455) lt!510163)) (select (arr!35796 _keys!1208) from!1455)) lt!510150)))

(declare-datatypes ((Unit!37535 0))(
  ( (Unit!37536) )
))
(declare-fun lt!510148 () Unit!37535)

(declare-fun addThenRemoveForNewKeyIsSame!123 (ListLongMap!16221 (_ BitVec 64) V!43419) Unit!37535)

(assert (=> b!1143720 (= lt!510148 (addThenRemoveForNewKeyIsSame!123 lt!510150 (select (arr!35796 _keys!1208) from!1455) lt!510163))))

(declare-fun lt!510158 () V!43419)

(declare-datatypes ((ValueCell!13650 0))(
  ( (ValueCellFull!13650 (v!17053 V!43419)) (EmptyCell!13650) )
))
(declare-datatypes ((array!74293 0))(
  ( (array!74294 (arr!35797 (Array (_ BitVec 32) ValueCell!13650)) (size!36333 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74293)

(declare-fun get!18199 (ValueCell!13650 V!43419) V!43419)

(assert (=> b!1143720 (= lt!510163 (get!18199 (select (arr!35797 _values!996) from!1455) lt!510158))))

(declare-fun lt!510165 () Unit!37535)

(declare-fun e!650616 () Unit!37535)

(assert (=> b!1143720 (= lt!510165 e!650616)))

(declare-fun c!112559 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6657 (ListLongMap!16221 (_ BitVec 64)) Bool)

(assert (=> b!1143720 (= c!112559 (contains!6657 lt!510150 k0!934))))

(declare-fun zeroValue!944 () V!43419)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43419)

(declare-fun getCurrentListMapNoExtraKeys!4605 (array!74291 array!74293 (_ BitVec 32) (_ BitVec 32) V!43419 V!43419 (_ BitVec 32) Int) ListLongMap!16221)

(assert (=> b!1143720 (= lt!510150 (getCurrentListMapNoExtraKeys!4605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143721 () Bool)

(declare-fun e!650618 () Unit!37535)

(declare-fun lt!510146 () Unit!37535)

(assert (=> b!1143721 (= e!650618 lt!510146)))

(declare-fun call!51816 () Unit!37535)

(assert (=> b!1143721 (= lt!510146 call!51816)))

(declare-fun call!51810 () Bool)

(assert (=> b!1143721 call!51810))

(declare-fun bm!51807 () Bool)

(declare-fun call!51815 () Unit!37535)

(assert (=> bm!51807 (= call!51816 call!51815)))

(declare-fun call!51817 () ListLongMap!16221)

(declare-fun call!51814 () ListLongMap!16221)

(declare-fun b!1143722 () Bool)

(declare-fun e!650620 () Bool)

(assert (=> b!1143722 (= e!650620 (= call!51814 (-!1271 call!51817 k0!934)))))

(declare-fun lt!510155 () array!74291)

(declare-fun lt!510160 () array!74293)

(declare-fun bm!51808 () Bool)

(assert (=> bm!51808 (= call!51814 (getCurrentListMapNoExtraKeys!4605 lt!510155 lt!510160 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143723 () Bool)

(declare-fun e!650626 () Bool)

(declare-fun arrayContainsKey!0 (array!74291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143723 (= e!650626 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143724 () Bool)

(declare-fun e!650617 () Bool)

(declare-fun e!650623 () Bool)

(assert (=> b!1143724 (= e!650617 e!650623)))

(declare-fun res!761943 () Bool)

(assert (=> b!1143724 (=> (not res!761943) (not e!650623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74291 (_ BitVec 32)) Bool)

(assert (=> b!1143724 (= res!761943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510155 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143724 (= lt!510155 (array!74292 (store (arr!35796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36332 _keys!1208)))))

(declare-fun mapNonEmpty!44903 () Bool)

(declare-fun mapRes!44903 () Bool)

(declare-fun tp!85277 () Bool)

(declare-fun e!650619 () Bool)

(assert (=> mapNonEmpty!44903 (= mapRes!44903 (and tp!85277 e!650619))))

(declare-fun mapKey!44903 () (_ BitVec 32))

(declare-fun mapValue!44903 () ValueCell!13650)

(declare-fun mapRest!44903 () (Array (_ BitVec 32) ValueCell!13650))

(assert (=> mapNonEmpty!44903 (= (arr!35797 _values!996) (store mapRest!44903 mapKey!44903 mapValue!44903))))

(declare-fun b!1143725 () Bool)

(assert (=> b!1143725 call!51810))

(declare-fun lt!510151 () Unit!37535)

(assert (=> b!1143725 (= lt!510151 call!51816)))

(declare-fun e!650625 () Unit!37535)

(assert (=> b!1143725 (= e!650625 lt!510151)))

(declare-fun bm!51809 () Bool)

(assert (=> bm!51809 (= call!51817 (getCurrentListMapNoExtraKeys!4605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143726 () Bool)

(declare-fun e!650621 () Bool)

(assert (=> b!1143726 (= e!650621 (and e!650631 mapRes!44903))))

(declare-fun condMapEmpty!44903 () Bool)

(declare-fun mapDefault!44903 () ValueCell!13650)

(assert (=> b!1143726 (= condMapEmpty!44903 (= (arr!35797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13650)) mapDefault!44903)))))

(declare-fun bm!51810 () Bool)

(declare-fun call!51811 () Bool)

(assert (=> bm!51810 (= call!51810 call!51811)))

(declare-fun b!1143727 () Bool)

(declare-fun e!650628 () Bool)

(assert (=> b!1143727 (= e!650628 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143728 () Bool)

(declare-fun c!112560 () Bool)

(declare-fun lt!510156 () Bool)

(assert (=> b!1143728 (= c!112560 (and (not lt!510156) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650624 () Unit!37535)

(assert (=> b!1143728 (= e!650624 e!650618)))

(declare-fun res!761944 () Bool)

(assert (=> start!98584 (=> (not res!761944) (not e!650617))))

(assert (=> start!98584 (= res!761944 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36332 _keys!1208))))))

(assert (=> start!98584 e!650617))

(assert (=> start!98584 tp_is_empty!28719))

(declare-fun array_inv!27430 (array!74291) Bool)

(assert (=> start!98584 (array_inv!27430 _keys!1208)))

(assert (=> start!98584 true))

(assert (=> start!98584 tp!85278))

(declare-fun array_inv!27431 (array!74293) Bool)

(assert (=> start!98584 (and (array_inv!27431 _values!996) e!650621)))

(declare-fun b!1143729 () Bool)

(declare-fun res!761935 () Bool)

(assert (=> b!1143729 (=> (not res!761935) (not e!650617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143729 (= res!761935 (validMask!0 mask!1564))))

(declare-fun b!1143730 () Bool)

(declare-fun res!761942 () Bool)

(assert (=> b!1143730 (=> (not res!761942) (not e!650617))))

(assert (=> b!1143730 (= res!761942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143731 () Bool)

(assert (=> b!1143731 (= e!650620 (= call!51814 call!51817))))

(declare-fun b!1143732 () Bool)

(declare-fun e!650627 () Bool)

(assert (=> b!1143732 (= e!650623 (not e!650627))))

(declare-fun res!761938 () Bool)

(assert (=> b!1143732 (=> res!761938 e!650627)))

(assert (=> b!1143732 (= res!761938 (bvsgt from!1455 i!673))))

(assert (=> b!1143732 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510157 () Unit!37535)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74291 (_ BitVec 64) (_ BitVec 32)) Unit!37535)

(assert (=> b!1143732 (= lt!510157 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143733 () Bool)

(declare-fun res!761940 () Bool)

(assert (=> b!1143733 (=> (not res!761940) (not e!650617))))

(assert (=> b!1143733 (= res!761940 (and (= (size!36333 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36332 _keys!1208) (size!36333 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!112562 () Bool)

(declare-fun lt!510147 () ListLongMap!16221)

(declare-fun bm!51811 () Bool)

(declare-fun call!51812 () ListLongMap!16221)

(assert (=> bm!51811 (= call!51812 (+!3554 (ite c!112562 lt!510147 lt!510150) (ite c!112562 (tuple2!18253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112560 (tuple2!18253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1143734 () Bool)

(assert (=> b!1143734 (= e!650619 tp_is_empty!28719)))

(declare-fun b!1143735 () Bool)

(assert (=> b!1143735 (contains!6657 call!51812 k0!934)))

(declare-fun lt!510153 () Unit!37535)

(declare-fun addStillContains!811 (ListLongMap!16221 (_ BitVec 64) V!43419 (_ BitVec 64)) Unit!37535)

(assert (=> b!1143735 (= lt!510153 (addStillContains!811 lt!510147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1143735 call!51811))

(assert (=> b!1143735 (= lt!510147 (+!3554 lt!510150 (tuple2!18253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510149 () Unit!37535)

(assert (=> b!1143735 (= lt!510149 call!51815)))

(assert (=> b!1143735 (= e!650624 lt!510153)))

(declare-fun mapIsEmpty!44903 () Bool)

(assert (=> mapIsEmpty!44903 mapRes!44903))

(declare-fun b!1143736 () Bool)

(declare-fun e!650622 () Bool)

(assert (=> b!1143736 (= e!650622 e!650630)))

(declare-fun res!761936 () Bool)

(assert (=> b!1143736 (=> res!761936 e!650630)))

(assert (=> b!1143736 (= res!761936 (not (= (select (arr!35796 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143736 e!650620))

(declare-fun c!112563 () Bool)

(assert (=> b!1143736 (= c!112563 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510164 () Unit!37535)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!514 (array!74291 array!74293 (_ BitVec 32) (_ BitVec 32) V!43419 V!43419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37535)

(assert (=> b!1143736 (= lt!510164 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143737 () Bool)

(assert (=> b!1143737 (= e!650618 e!650625)))

(declare-fun c!112564 () Bool)

(assert (=> b!1143737 (= c!112564 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510156))))

(declare-fun b!1143738 () Bool)

(declare-fun res!761941 () Bool)

(assert (=> b!1143738 (=> (not res!761941) (not e!650617))))

(assert (=> b!1143738 (= res!761941 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36332 _keys!1208))))))

(declare-fun bm!51812 () Bool)

(declare-fun call!51813 () ListLongMap!16221)

(assert (=> bm!51812 (= call!51813 call!51812)))

(declare-fun b!1143739 () Bool)

(declare-fun Unit!37537 () Unit!37535)

(assert (=> b!1143739 (= e!650625 Unit!37537)))

(declare-fun b!1143740 () Bool)

(declare-fun res!761933 () Bool)

(assert (=> b!1143740 (=> (not res!761933) (not e!650617))))

(assert (=> b!1143740 (= res!761933 (= (select (arr!35796 _keys!1208) i!673) k0!934))))

(declare-fun bm!51813 () Bool)

(assert (=> bm!51813 (= call!51811 (contains!6657 (ite c!112562 lt!510147 call!51813) k0!934))))

(declare-fun b!1143741 () Bool)

(assert (=> b!1143741 (= e!650626 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510156) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1143742 () Bool)

(declare-fun Unit!37538 () Unit!37535)

(assert (=> b!1143742 (= e!650616 Unit!37538)))

(declare-fun b!1143743 () Bool)

(declare-fun res!761934 () Bool)

(assert (=> b!1143743 (=> (not res!761934) (not e!650623))))

(declare-datatypes ((List!25006 0))(
  ( (Nil!25003) (Cons!25002 (h!26211 (_ BitVec 64)) (t!36187 List!25006)) )
))
(declare-fun arrayNoDuplicates!0 (array!74291 (_ BitVec 32) List!25006) Bool)

(assert (=> b!1143743 (= res!761934 (arrayNoDuplicates!0 lt!510155 #b00000000000000000000000000000000 Nil!25003))))

(declare-fun b!1143744 () Bool)

(declare-fun res!761939 () Bool)

(assert (=> b!1143744 (=> (not res!761939) (not e!650617))))

(assert (=> b!1143744 (= res!761939 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25003))))

(declare-fun b!1143745 () Bool)

(declare-fun Unit!37539 () Unit!37535)

(assert (=> b!1143745 (= e!650616 Unit!37539)))

(assert (=> b!1143745 (= lt!510156 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143745 (= c!112562 (and (not lt!510156) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510159 () Unit!37535)

(assert (=> b!1143745 (= lt!510159 e!650624)))

(declare-fun lt!510152 () Unit!37535)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!404 (array!74291 array!74293 (_ BitVec 32) (_ BitVec 32) V!43419 V!43419 (_ BitVec 64) (_ BitVec 32) Int) Unit!37535)

(assert (=> b!1143745 (= lt!510152 (lemmaListMapContainsThenArrayContainsFrom!404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112561 () Bool)

(assert (=> b!1143745 (= c!112561 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761932 () Bool)

(assert (=> b!1143745 (= res!761932 e!650626)))

(assert (=> b!1143745 (=> (not res!761932) (not e!650628))))

(assert (=> b!1143745 e!650628))

(declare-fun lt!510161 () Unit!37535)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74291 (_ BitVec 32) (_ BitVec 32)) Unit!37535)

(assert (=> b!1143745 (= lt!510161 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143745 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25003)))

(declare-fun lt!510154 () Unit!37535)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74291 (_ BitVec 64) (_ BitVec 32) List!25006) Unit!37535)

(assert (=> b!1143745 (= lt!510154 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25003))))

(assert (=> b!1143745 false))

(declare-fun b!1143746 () Bool)

(assert (=> b!1143746 (= e!650627 e!650622)))

(declare-fun res!761937 () Bool)

(assert (=> b!1143746 (=> res!761937 e!650622)))

(assert (=> b!1143746 (= res!761937 (not (= from!1455 i!673)))))

(declare-fun lt!510145 () ListLongMap!16221)

(assert (=> b!1143746 (= lt!510145 (getCurrentListMapNoExtraKeys!4605 lt!510155 lt!510160 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1143746 (= lt!510160 (array!74294 (store (arr!35797 _values!996) i!673 (ValueCellFull!13650 lt!510158)) (size!36333 _values!996)))))

(declare-fun dynLambda!2643 (Int (_ BitVec 64)) V!43419)

(assert (=> b!1143746 (= lt!510158 (dynLambda!2643 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510162 () ListLongMap!16221)

(assert (=> b!1143746 (= lt!510162 (getCurrentListMapNoExtraKeys!4605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143747 () Bool)

(declare-fun res!761945 () Bool)

(assert (=> b!1143747 (=> (not res!761945) (not e!650617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143747 (= res!761945 (validKeyInArray!0 k0!934))))

(declare-fun bm!51814 () Bool)

(assert (=> bm!51814 (= call!51815 (addStillContains!811 lt!510150 (ite (or c!112562 c!112560) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112562 c!112560) zeroValue!944 minValue!944) k0!934))))

(assert (= (and start!98584 res!761944) b!1143729))

(assert (= (and b!1143729 res!761935) b!1143733))

(assert (= (and b!1143733 res!761940) b!1143730))

(assert (= (and b!1143730 res!761942) b!1143744))

(assert (= (and b!1143744 res!761939) b!1143738))

(assert (= (and b!1143738 res!761941) b!1143747))

(assert (= (and b!1143747 res!761945) b!1143740))

(assert (= (and b!1143740 res!761933) b!1143724))

(assert (= (and b!1143724 res!761943) b!1143743))

(assert (= (and b!1143743 res!761934) b!1143732))

(assert (= (and b!1143732 (not res!761938)) b!1143746))

(assert (= (and b!1143746 (not res!761937)) b!1143736))

(assert (= (and b!1143736 c!112563) b!1143722))

(assert (= (and b!1143736 (not c!112563)) b!1143731))

(assert (= (or b!1143722 b!1143731) bm!51808))

(assert (= (or b!1143722 b!1143731) bm!51809))

(assert (= (and b!1143736 (not res!761936)) b!1143720))

(assert (= (and b!1143720 c!112559) b!1143745))

(assert (= (and b!1143720 (not c!112559)) b!1143742))

(assert (= (and b!1143745 c!112562) b!1143735))

(assert (= (and b!1143745 (not c!112562)) b!1143728))

(assert (= (and b!1143728 c!112560) b!1143721))

(assert (= (and b!1143728 (not c!112560)) b!1143737))

(assert (= (and b!1143737 c!112564) b!1143725))

(assert (= (and b!1143737 (not c!112564)) b!1143739))

(assert (= (or b!1143721 b!1143725) bm!51807))

(assert (= (or b!1143721 b!1143725) bm!51812))

(assert (= (or b!1143721 b!1143725) bm!51810))

(assert (= (or b!1143735 bm!51810) bm!51813))

(assert (= (or b!1143735 bm!51807) bm!51814))

(assert (= (or b!1143735 bm!51812) bm!51811))

(assert (= (and b!1143745 c!112561) b!1143723))

(assert (= (and b!1143745 (not c!112561)) b!1143741))

(assert (= (and b!1143745 res!761932) b!1143727))

(assert (= (and b!1143726 condMapEmpty!44903) mapIsEmpty!44903))

(assert (= (and b!1143726 (not condMapEmpty!44903)) mapNonEmpty!44903))

(get-info :version)

(assert (= (and mapNonEmpty!44903 ((_ is ValueCellFull!13650) mapValue!44903)) b!1143734))

(assert (= (and b!1143726 ((_ is ValueCellFull!13650) mapDefault!44903)) b!1143719))

(assert (= start!98584 b!1143726))

(declare-fun b_lambda!19295 () Bool)

(assert (=> (not b_lambda!19295) (not b!1143746)))

(declare-fun t!36185 () Bool)

(declare-fun tb!9001 () Bool)

(assert (=> (and start!98584 (= defaultEntry!1004 defaultEntry!1004) t!36185) tb!9001))

(declare-fun result!18567 () Bool)

(assert (=> tb!9001 (= result!18567 tp_is_empty!28719)))

(assert (=> b!1143746 t!36185))

(declare-fun b_and!39229 () Bool)

(assert (= b_and!39227 (and (=> t!36185 result!18567) b_and!39229)))

(declare-fun m!1054827 () Bool)

(assert (=> b!1143740 m!1054827))

(declare-fun m!1054829 () Bool)

(assert (=> b!1143720 m!1054829))

(declare-fun m!1054831 () Bool)

(assert (=> b!1143720 m!1054831))

(declare-fun m!1054833 () Bool)

(assert (=> b!1143720 m!1054833))

(declare-fun m!1054835 () Bool)

(assert (=> b!1143720 m!1054835))

(declare-fun m!1054837 () Bool)

(assert (=> b!1143720 m!1054837))

(declare-fun m!1054839 () Bool)

(assert (=> b!1143720 m!1054839))

(assert (=> b!1143720 m!1054831))

(declare-fun m!1054841 () Bool)

(assert (=> b!1143720 m!1054841))

(assert (=> b!1143720 m!1054835))

(declare-fun m!1054843 () Bool)

(assert (=> b!1143720 m!1054843))

(assert (=> b!1143720 m!1054839))

(assert (=> b!1143720 m!1054831))

(declare-fun m!1054845 () Bool)

(assert (=> bm!51808 m!1054845))

(declare-fun m!1054847 () Bool)

(assert (=> b!1143747 m!1054847))

(declare-fun m!1054849 () Bool)

(assert (=> b!1143732 m!1054849))

(declare-fun m!1054851 () Bool)

(assert (=> b!1143732 m!1054851))

(declare-fun m!1054853 () Bool)

(assert (=> b!1143723 m!1054853))

(declare-fun m!1054855 () Bool)

(assert (=> b!1143744 m!1054855))

(assert (=> b!1143727 m!1054853))

(declare-fun m!1054857 () Bool)

(assert (=> start!98584 m!1054857))

(declare-fun m!1054859 () Bool)

(assert (=> start!98584 m!1054859))

(assert (=> bm!51809 m!1054829))

(declare-fun m!1054861 () Bool)

(assert (=> b!1143724 m!1054861))

(declare-fun m!1054863 () Bool)

(assert (=> b!1143724 m!1054863))

(declare-fun m!1054865 () Bool)

(assert (=> b!1143745 m!1054865))

(declare-fun m!1054867 () Bool)

(assert (=> b!1143745 m!1054867))

(declare-fun m!1054869 () Bool)

(assert (=> b!1143745 m!1054869))

(declare-fun m!1054871 () Bool)

(assert (=> b!1143745 m!1054871))

(declare-fun m!1054873 () Bool)

(assert (=> b!1143735 m!1054873))

(declare-fun m!1054875 () Bool)

(assert (=> b!1143735 m!1054875))

(declare-fun m!1054877 () Bool)

(assert (=> b!1143735 m!1054877))

(declare-fun m!1054879 () Bool)

(assert (=> mapNonEmpty!44903 m!1054879))

(declare-fun m!1054881 () Bool)

(assert (=> b!1143722 m!1054881))

(declare-fun m!1054883 () Bool)

(assert (=> bm!51811 m!1054883))

(declare-fun m!1054885 () Bool)

(assert (=> bm!51813 m!1054885))

(declare-fun m!1054887 () Bool)

(assert (=> b!1143729 m!1054887))

(declare-fun m!1054889 () Bool)

(assert (=> b!1143730 m!1054889))

(declare-fun m!1054891 () Bool)

(assert (=> bm!51814 m!1054891))

(assert (=> b!1143736 m!1054831))

(declare-fun m!1054893 () Bool)

(assert (=> b!1143736 m!1054893))

(declare-fun m!1054895 () Bool)

(assert (=> b!1143746 m!1054895))

(declare-fun m!1054897 () Bool)

(assert (=> b!1143746 m!1054897))

(declare-fun m!1054899 () Bool)

(assert (=> b!1143746 m!1054899))

(declare-fun m!1054901 () Bool)

(assert (=> b!1143746 m!1054901))

(declare-fun m!1054903 () Bool)

(assert (=> b!1143743 m!1054903))

(check-sat (not b!1143729) (not b!1143720) (not b!1143744) (not b!1143722) (not b!1143727) (not start!98584) (not b_next!24189) (not b!1143746) (not b!1143735) (not b!1143723) (not bm!51814) (not b_lambda!19295) (not bm!51809) (not bm!51808) (not b!1143743) (not b!1143745) (not b!1143732) tp_is_empty!28719 (not b!1143730) (not bm!51811) (not b!1143736) b_and!39229 (not mapNonEmpty!44903) (not bm!51813) (not b!1143724) (not b!1143747))
(check-sat b_and!39229 (not b_next!24189))
