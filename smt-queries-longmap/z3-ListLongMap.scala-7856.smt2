; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97882 () Bool)

(assert start!97882)

(declare-fun b_free!23583 () Bool)

(declare-fun b_next!23583 () Bool)

(assert (=> start!97882 (= b_free!23583 (not b_next!23583))))

(declare-fun tp!83452 () Bool)

(declare-fun b_and!37949 () Bool)

(assert (=> start!97882 (= tp!83452 b_and!37949)))

(declare-fun b!1120792 () Bool)

(declare-fun e!638193 () Bool)

(declare-datatypes ((V!42611 0))(
  ( (V!42612 (val!14113 Int)) )
))
(declare-datatypes ((tuple2!17710 0))(
  ( (tuple2!17711 (_1!8866 (_ BitVec 64)) (_2!8866 V!42611)) )
))
(declare-datatypes ((List!24494 0))(
  ( (Nil!24491) (Cons!24490 (h!25699 tuple2!17710) (t!35069 List!24494)) )
))
(declare-datatypes ((ListLongMap!15679 0))(
  ( (ListLongMap!15680 (toList!7855 List!24494)) )
))
(declare-fun call!47032 () ListLongMap!15679)

(declare-fun call!47031 () ListLongMap!15679)

(assert (=> b!1120792 (= e!638193 (= call!47032 call!47031))))

(declare-fun b!1120793 () Bool)

(declare-fun res!748750 () Bool)

(declare-fun e!638185 () Bool)

(assert (=> b!1120793 (=> (not res!748750) (not e!638185))))

(declare-datatypes ((array!73107 0))(
  ( (array!73108 (arr!35206 (Array (_ BitVec 32) (_ BitVec 64))) (size!35742 (_ BitVec 32))) )
))
(declare-fun lt!498139 () array!73107)

(declare-datatypes ((List!24495 0))(
  ( (Nil!24492) (Cons!24491 (h!25700 (_ BitVec 64)) (t!35070 List!24495)) )
))
(declare-fun arrayNoDuplicates!0 (array!73107 (_ BitVec 32) List!24495) Bool)

(assert (=> b!1120793 (= res!748750 (arrayNoDuplicates!0 lt!498139 #b00000000000000000000000000000000 Nil!24492))))

(declare-fun b!1120794 () Bool)

(declare-fun e!638190 () Bool)

(assert (=> b!1120794 (= e!638190 e!638185)))

(declare-fun res!748758 () Bool)

(assert (=> b!1120794 (=> (not res!748758) (not e!638185))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73107 (_ BitVec 32)) Bool)

(assert (=> b!1120794 (= res!748758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498139 mask!1564))))

(declare-fun _keys!1208 () array!73107)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120794 (= lt!498139 (array!73108 (store (arr!35206 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35742 _keys!1208)))))

(declare-fun b!1120795 () Bool)

(declare-fun e!638189 () Bool)

(assert (=> b!1120795 (= e!638185 (not e!638189))))

(declare-fun res!748748 () Bool)

(assert (=> b!1120795 (=> res!748748 e!638189)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1120795 (= res!748748 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120795 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36774 0))(
  ( (Unit!36775) )
))
(declare-fun lt!498143 () Unit!36774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73107 (_ BitVec 64) (_ BitVec 32)) Unit!36774)

(assert (=> b!1120795 (= lt!498143 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!42611)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47028 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13347 0))(
  ( (ValueCellFull!13347 (v!16746 V!42611)) (EmptyCell!13347) )
))
(declare-datatypes ((array!73109 0))(
  ( (array!73110 (arr!35207 (Array (_ BitVec 32) ValueCell!13347)) (size!35743 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73109)

(declare-fun minValue!944 () V!42611)

(declare-fun getCurrentListMapNoExtraKeys!4345 (array!73107 array!73109 (_ BitVec 32) (_ BitVec 32) V!42611 V!42611 (_ BitVec 32) Int) ListLongMap!15679)

(assert (=> bm!47028 (= call!47031 (getCurrentListMapNoExtraKeys!4345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120796 () Bool)

(declare-fun e!638192 () Bool)

(declare-fun e!638187 () Bool)

(declare-fun mapRes!43987 () Bool)

(assert (=> b!1120796 (= e!638192 (and e!638187 mapRes!43987))))

(declare-fun condMapEmpty!43987 () Bool)

(declare-fun mapDefault!43987 () ValueCell!13347)

(assert (=> b!1120796 (= condMapEmpty!43987 (= (arr!35207 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13347)) mapDefault!43987)))))

(declare-fun b!1120797 () Bool)

(declare-fun res!748749 () Bool)

(assert (=> b!1120797 (=> (not res!748749) (not e!638190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120797 (= res!748749 (validMask!0 mask!1564))))

(declare-fun b!1120798 () Bool)

(declare-fun res!748759 () Bool)

(assert (=> b!1120798 (=> (not res!748759) (not e!638190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120798 (= res!748759 (validKeyInArray!0 k0!934))))

(declare-fun b!1120799 () Bool)

(declare-fun res!748756 () Bool)

(assert (=> b!1120799 (=> (not res!748756) (not e!638190))))

(assert (=> b!1120799 (= res!748756 (= (select (arr!35206 _keys!1208) i!673) k0!934))))

(declare-fun res!748757 () Bool)

(assert (=> start!97882 (=> (not res!748757) (not e!638190))))

(assert (=> start!97882 (= res!748757 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35742 _keys!1208))))))

(assert (=> start!97882 e!638190))

(declare-fun tp_is_empty!28113 () Bool)

(assert (=> start!97882 tp_is_empty!28113))

(declare-fun array_inv!27038 (array!73107) Bool)

(assert (=> start!97882 (array_inv!27038 _keys!1208)))

(assert (=> start!97882 true))

(assert (=> start!97882 tp!83452))

(declare-fun array_inv!27039 (array!73109) Bool)

(assert (=> start!97882 (and (array_inv!27039 _values!996) e!638192)))

(declare-fun b!1120800 () Bool)

(declare-fun res!748752 () Bool)

(assert (=> b!1120800 (=> (not res!748752) (not e!638190))))

(assert (=> b!1120800 (= res!748752 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35742 _keys!1208))))))

(declare-fun b!1120801 () Bool)

(declare-fun e!638186 () Bool)

(assert (=> b!1120801 (= e!638186 true)))

(assert (=> b!1120801 e!638193))

(declare-fun c!109365 () Bool)

(assert (=> b!1120801 (= c!109365 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498138 () Unit!36774)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!317 (array!73107 array!73109 (_ BitVec 32) (_ BitVec 32) V!42611 V!42611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36774)

(assert (=> b!1120801 (= lt!498138 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47029 () Bool)

(declare-fun lt!498142 () array!73109)

(assert (=> bm!47029 (= call!47032 (getCurrentListMapNoExtraKeys!4345 lt!498139 lt!498142 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120802 () Bool)

(declare-fun res!748753 () Bool)

(assert (=> b!1120802 (=> (not res!748753) (not e!638190))))

(assert (=> b!1120802 (= res!748753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120803 () Bool)

(declare-fun res!748751 () Bool)

(assert (=> b!1120803 (=> (not res!748751) (not e!638190))))

(assert (=> b!1120803 (= res!748751 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24492))))

(declare-fun b!1120804 () Bool)

(assert (=> b!1120804 (= e!638189 e!638186)))

(declare-fun res!748754 () Bool)

(assert (=> b!1120804 (=> res!748754 e!638186)))

(assert (=> b!1120804 (= res!748754 (not (= from!1455 i!673)))))

(declare-fun lt!498141 () ListLongMap!15679)

(assert (=> b!1120804 (= lt!498141 (getCurrentListMapNoExtraKeys!4345 lt!498139 lt!498142 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2447 (Int (_ BitVec 64)) V!42611)

(assert (=> b!1120804 (= lt!498142 (array!73110 (store (arr!35207 _values!996) i!673 (ValueCellFull!13347 (dynLambda!2447 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35743 _values!996)))))

(declare-fun lt!498140 () ListLongMap!15679)

(assert (=> b!1120804 (= lt!498140 (getCurrentListMapNoExtraKeys!4345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120805 () Bool)

(declare-fun e!638188 () Bool)

(assert (=> b!1120805 (= e!638188 tp_is_empty!28113)))

(declare-fun b!1120806 () Bool)

(declare-fun res!748755 () Bool)

(assert (=> b!1120806 (=> (not res!748755) (not e!638190))))

(assert (=> b!1120806 (= res!748755 (and (= (size!35743 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35742 _keys!1208) (size!35743 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43987 () Bool)

(assert (=> mapIsEmpty!43987 mapRes!43987))

(declare-fun b!1120807 () Bool)

(declare-fun -!1067 (ListLongMap!15679 (_ BitVec 64)) ListLongMap!15679)

(assert (=> b!1120807 (= e!638193 (= call!47032 (-!1067 call!47031 k0!934)))))

(declare-fun mapNonEmpty!43987 () Bool)

(declare-fun tp!83453 () Bool)

(assert (=> mapNonEmpty!43987 (= mapRes!43987 (and tp!83453 e!638188))))

(declare-fun mapValue!43987 () ValueCell!13347)

(declare-fun mapRest!43987 () (Array (_ BitVec 32) ValueCell!13347))

(declare-fun mapKey!43987 () (_ BitVec 32))

(assert (=> mapNonEmpty!43987 (= (arr!35207 _values!996) (store mapRest!43987 mapKey!43987 mapValue!43987))))

(declare-fun b!1120808 () Bool)

(assert (=> b!1120808 (= e!638187 tp_is_empty!28113)))

(assert (= (and start!97882 res!748757) b!1120797))

(assert (= (and b!1120797 res!748749) b!1120806))

(assert (= (and b!1120806 res!748755) b!1120802))

(assert (= (and b!1120802 res!748753) b!1120803))

(assert (= (and b!1120803 res!748751) b!1120800))

(assert (= (and b!1120800 res!748752) b!1120798))

(assert (= (and b!1120798 res!748759) b!1120799))

(assert (= (and b!1120799 res!748756) b!1120794))

(assert (= (and b!1120794 res!748758) b!1120793))

(assert (= (and b!1120793 res!748750) b!1120795))

(assert (= (and b!1120795 (not res!748748)) b!1120804))

(assert (= (and b!1120804 (not res!748754)) b!1120801))

(assert (= (and b!1120801 c!109365) b!1120807))

(assert (= (and b!1120801 (not c!109365)) b!1120792))

(assert (= (or b!1120807 b!1120792) bm!47029))

(assert (= (or b!1120807 b!1120792) bm!47028))

(assert (= (and b!1120796 condMapEmpty!43987) mapIsEmpty!43987))

(assert (= (and b!1120796 (not condMapEmpty!43987)) mapNonEmpty!43987))

(get-info :version)

(assert (= (and mapNonEmpty!43987 ((_ is ValueCellFull!13347) mapValue!43987)) b!1120805))

(assert (= (and b!1120796 ((_ is ValueCellFull!13347) mapDefault!43987)) b!1120808))

(assert (= start!97882 b!1120796))

(declare-fun b_lambda!18553 () Bool)

(assert (=> (not b_lambda!18553) (not b!1120804)))

(declare-fun t!35068 () Bool)

(declare-fun tb!8395 () Bool)

(assert (=> (and start!97882 (= defaultEntry!1004 defaultEntry!1004) t!35068) tb!8395))

(declare-fun result!17351 () Bool)

(assert (=> tb!8395 (= result!17351 tp_is_empty!28113)))

(assert (=> b!1120804 t!35068))

(declare-fun b_and!37951 () Bool)

(assert (= b_and!37949 (and (=> t!35068 result!17351) b_and!37951)))

(declare-fun m!1035767 () Bool)

(assert (=> b!1120807 m!1035767))

(declare-fun m!1035769 () Bool)

(assert (=> start!97882 m!1035769))

(declare-fun m!1035771 () Bool)

(assert (=> start!97882 m!1035771))

(declare-fun m!1035773 () Bool)

(assert (=> b!1120798 m!1035773))

(declare-fun m!1035775 () Bool)

(assert (=> b!1120803 m!1035775))

(declare-fun m!1035777 () Bool)

(assert (=> b!1120804 m!1035777))

(declare-fun m!1035779 () Bool)

(assert (=> b!1120804 m!1035779))

(declare-fun m!1035781 () Bool)

(assert (=> b!1120804 m!1035781))

(declare-fun m!1035783 () Bool)

(assert (=> b!1120804 m!1035783))

(declare-fun m!1035785 () Bool)

(assert (=> bm!47029 m!1035785))

(declare-fun m!1035787 () Bool)

(assert (=> b!1120793 m!1035787))

(declare-fun m!1035789 () Bool)

(assert (=> b!1120794 m!1035789))

(declare-fun m!1035791 () Bool)

(assert (=> b!1120794 m!1035791))

(declare-fun m!1035793 () Bool)

(assert (=> mapNonEmpty!43987 m!1035793))

(declare-fun m!1035795 () Bool)

(assert (=> b!1120797 m!1035795))

(declare-fun m!1035797 () Bool)

(assert (=> b!1120802 m!1035797))

(declare-fun m!1035799 () Bool)

(assert (=> b!1120801 m!1035799))

(declare-fun m!1035801 () Bool)

(assert (=> b!1120795 m!1035801))

(declare-fun m!1035803 () Bool)

(assert (=> b!1120795 m!1035803))

(declare-fun m!1035805 () Bool)

(assert (=> b!1120799 m!1035805))

(declare-fun m!1035807 () Bool)

(assert (=> bm!47028 m!1035807))

(check-sat (not b!1120802) (not b!1120801) (not mapNonEmpty!43987) b_and!37951 (not b!1120798) (not b!1120794) tp_is_empty!28113 (not b!1120793) (not b_lambda!18553) (not b!1120797) (not b_next!23583) (not bm!47028) (not start!97882) (not bm!47029) (not b!1120795) (not b!1120804) (not b!1120807) (not b!1120803))
(check-sat b_and!37951 (not b_next!23583))
