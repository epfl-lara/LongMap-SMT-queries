; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97952 () Bool)

(assert start!97952)

(declare-fun b_free!23659 () Bool)

(declare-fun b_next!23659 () Bool)

(assert (=> start!97952 (= b_free!23659 (not b_next!23659))))

(declare-fun tp!83681 () Bool)

(declare-fun b_and!38079 () Bool)

(assert (=> start!97952 (= tp!83681 b_and!38079)))

(declare-datatypes ((V!42713 0))(
  ( (V!42714 (val!14151 Int)) )
))
(declare-fun zeroValue!944 () V!42713)

(declare-datatypes ((tuple2!17842 0))(
  ( (tuple2!17843 (_1!8932 (_ BitVec 64)) (_2!8932 V!42713)) )
))
(declare-datatypes ((List!24609 0))(
  ( (Nil!24606) (Cons!24605 (h!25814 tuple2!17842) (t!35251 List!24609)) )
))
(declare-datatypes ((ListLongMap!15811 0))(
  ( (ListLongMap!15812 (toList!7921 List!24609)) )
))
(declare-fun call!47237 () ListLongMap!15811)

(declare-datatypes ((array!73170 0))(
  ( (array!73171 (arr!35238 (Array (_ BitVec 32) (_ BitVec 64))) (size!35776 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73170)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13385 0))(
  ( (ValueCellFull!13385 (v!16783 V!42713)) (EmptyCell!13385) )
))
(declare-datatypes ((array!73172 0))(
  ( (array!73173 (arr!35239 (Array (_ BitVec 32) ValueCell!13385)) (size!35777 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73172)

(declare-fun minValue!944 () V!42713)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!47233 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4428 (array!73170 array!73172 (_ BitVec 32) (_ BitVec 32) V!42713 V!42713 (_ BitVec 32) Int) ListLongMap!15811)

(assert (=> bm!47233 (= call!47237 (getCurrentListMapNoExtraKeys!4428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122724 () Bool)

(declare-fun res!750104 () Bool)

(declare-fun e!639185 () Bool)

(assert (=> b!1122724 (=> (not res!750104) (not e!639185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122724 (= res!750104 (validMask!0 mask!1564))))

(declare-fun b!1122725 () Bool)

(declare-fun e!639184 () Bool)

(declare-fun e!639180 () Bool)

(declare-fun mapRes!44101 () Bool)

(assert (=> b!1122725 (= e!639184 (and e!639180 mapRes!44101))))

(declare-fun condMapEmpty!44101 () Bool)

(declare-fun mapDefault!44101 () ValueCell!13385)

(assert (=> b!1122725 (= condMapEmpty!44101 (= (arr!35239 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13385)) mapDefault!44101)))))

(declare-fun mapIsEmpty!44101 () Bool)

(assert (=> mapIsEmpty!44101 mapRes!44101))

(declare-fun b!1122726 () Bool)

(declare-fun res!750098 () Bool)

(assert (=> b!1122726 (=> (not res!750098) (not e!639185))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122726 (= res!750098 (validKeyInArray!0 k0!934))))

(declare-fun b!1122727 () Bool)

(declare-fun res!750097 () Bool)

(declare-fun e!639177 () Bool)

(assert (=> b!1122727 (=> (not res!750097) (not e!639177))))

(declare-fun lt!498675 () array!73170)

(declare-datatypes ((List!24610 0))(
  ( (Nil!24607) (Cons!24606 (h!25815 (_ BitVec 64)) (t!35252 List!24610)) )
))
(declare-fun arrayNoDuplicates!0 (array!73170 (_ BitVec 32) List!24610) Bool)

(assert (=> b!1122727 (= res!750097 (arrayNoDuplicates!0 lt!498675 #b00000000000000000000000000000000 Nil!24607))))

(declare-fun b!1122728 () Bool)

(declare-fun res!750101 () Bool)

(assert (=> b!1122728 (=> (not res!750101) (not e!639185))))

(assert (=> b!1122728 (= res!750101 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24607))))

(declare-fun b!1122729 () Bool)

(declare-fun e!639186 () Bool)

(declare-fun tp_is_empty!28189 () Bool)

(assert (=> b!1122729 (= e!639186 tp_is_empty!28189)))

(declare-fun mapNonEmpty!44101 () Bool)

(declare-fun tp!83680 () Bool)

(assert (=> mapNonEmpty!44101 (= mapRes!44101 (and tp!83680 e!639186))))

(declare-fun mapKey!44101 () (_ BitVec 32))

(declare-fun mapRest!44101 () (Array (_ BitVec 32) ValueCell!13385))

(declare-fun mapValue!44101 () ValueCell!13385)

(assert (=> mapNonEmpty!44101 (= (arr!35239 _values!996) (store mapRest!44101 mapKey!44101 mapValue!44101))))

(declare-fun b!1122730 () Bool)

(declare-fun e!639182 () Bool)

(declare-fun e!639178 () Bool)

(assert (=> b!1122730 (= e!639182 e!639178)))

(declare-fun res!750105 () Bool)

(assert (=> b!1122730 (=> res!750105 e!639178)))

(assert (=> b!1122730 (= res!750105 (not (= (select (arr!35238 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639179 () Bool)

(assert (=> b!1122730 e!639179))

(declare-fun c!109452 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122730 (= c!109452 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36663 0))(
  ( (Unit!36664) )
))
(declare-fun lt!498673 () Unit!36663)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!344 (array!73170 array!73172 (_ BitVec 32) (_ BitVec 32) V!42713 V!42713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36663)

(assert (=> b!1122730 (= lt!498673 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47236 () ListLongMap!15811)

(declare-fun bm!47234 () Bool)

(declare-fun lt!498672 () array!73172)

(assert (=> bm!47234 (= call!47236 (getCurrentListMapNoExtraKeys!4428 lt!498675 lt!498672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!750102 () Bool)

(assert (=> start!97952 (=> (not res!750102) (not e!639185))))

(assert (=> start!97952 (= res!750102 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35776 _keys!1208))))))

(assert (=> start!97952 e!639185))

(assert (=> start!97952 tp_is_empty!28189))

(declare-fun array_inv!27126 (array!73170) Bool)

(assert (=> start!97952 (array_inv!27126 _keys!1208)))

(assert (=> start!97952 true))

(assert (=> start!97952 tp!83681))

(declare-fun array_inv!27127 (array!73172) Bool)

(assert (=> start!97952 (and (array_inv!27127 _values!996) e!639184)))

(declare-fun b!1122731 () Bool)

(assert (=> b!1122731 (= e!639178 true)))

(declare-fun lt!498674 () Bool)

(declare-fun contains!6398 (ListLongMap!15811 (_ BitVec 64)) Bool)

(assert (=> b!1122731 (= lt!498674 (contains!6398 (getCurrentListMapNoExtraKeys!4428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122732 () Bool)

(assert (=> b!1122732 (= e!639185 e!639177)))

(declare-fun res!750099 () Bool)

(assert (=> b!1122732 (=> (not res!750099) (not e!639177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73170 (_ BitVec 32)) Bool)

(assert (=> b!1122732 (= res!750099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498675 mask!1564))))

(assert (=> b!1122732 (= lt!498675 (array!73171 (store (arr!35238 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35776 _keys!1208)))))

(declare-fun b!1122733 () Bool)

(declare-fun e!639183 () Bool)

(assert (=> b!1122733 (= e!639177 (not e!639183))))

(declare-fun res!750095 () Bool)

(assert (=> b!1122733 (=> res!750095 e!639183)))

(assert (=> b!1122733 (= res!750095 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122733 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498669 () Unit!36663)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73170 (_ BitVec 64) (_ BitVec 32)) Unit!36663)

(assert (=> b!1122733 (= lt!498669 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122734 () Bool)

(assert (=> b!1122734 (= e!639179 (= call!47236 call!47237))))

(declare-fun b!1122735 () Bool)

(declare-fun res!750094 () Bool)

(assert (=> b!1122735 (=> (not res!750094) (not e!639185))))

(assert (=> b!1122735 (= res!750094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122736 () Bool)

(declare-fun -!1067 (ListLongMap!15811 (_ BitVec 64)) ListLongMap!15811)

(assert (=> b!1122736 (= e!639179 (= call!47236 (-!1067 call!47237 k0!934)))))

(declare-fun b!1122737 () Bool)

(declare-fun res!750096 () Bool)

(assert (=> b!1122737 (=> (not res!750096) (not e!639185))))

(assert (=> b!1122737 (= res!750096 (and (= (size!35777 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35776 _keys!1208) (size!35777 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122738 () Bool)

(assert (=> b!1122738 (= e!639180 tp_is_empty!28189)))

(declare-fun b!1122739 () Bool)

(declare-fun res!750100 () Bool)

(assert (=> b!1122739 (=> (not res!750100) (not e!639185))))

(assert (=> b!1122739 (= res!750100 (= (select (arr!35238 _keys!1208) i!673) k0!934))))

(declare-fun b!1122740 () Bool)

(declare-fun res!750106 () Bool)

(assert (=> b!1122740 (=> (not res!750106) (not e!639185))))

(assert (=> b!1122740 (= res!750106 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35776 _keys!1208))))))

(declare-fun b!1122741 () Bool)

(assert (=> b!1122741 (= e!639183 e!639182)))

(declare-fun res!750103 () Bool)

(assert (=> b!1122741 (=> res!750103 e!639182)))

(assert (=> b!1122741 (= res!750103 (not (= from!1455 i!673)))))

(declare-fun lt!498671 () ListLongMap!15811)

(assert (=> b!1122741 (= lt!498671 (getCurrentListMapNoExtraKeys!4428 lt!498675 lt!498672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2462 (Int (_ BitVec 64)) V!42713)

(assert (=> b!1122741 (= lt!498672 (array!73173 (store (arr!35239 _values!996) i!673 (ValueCellFull!13385 (dynLambda!2462 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35777 _values!996)))))

(declare-fun lt!498670 () ListLongMap!15811)

(assert (=> b!1122741 (= lt!498670 (getCurrentListMapNoExtraKeys!4428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!97952 res!750102) b!1122724))

(assert (= (and b!1122724 res!750104) b!1122737))

(assert (= (and b!1122737 res!750096) b!1122735))

(assert (= (and b!1122735 res!750094) b!1122728))

(assert (= (and b!1122728 res!750101) b!1122740))

(assert (= (and b!1122740 res!750106) b!1122726))

(assert (= (and b!1122726 res!750098) b!1122739))

(assert (= (and b!1122739 res!750100) b!1122732))

(assert (= (and b!1122732 res!750099) b!1122727))

(assert (= (and b!1122727 res!750097) b!1122733))

(assert (= (and b!1122733 (not res!750095)) b!1122741))

(assert (= (and b!1122741 (not res!750103)) b!1122730))

(assert (= (and b!1122730 c!109452) b!1122736))

(assert (= (and b!1122730 (not c!109452)) b!1122734))

(assert (= (or b!1122736 b!1122734) bm!47234))

(assert (= (or b!1122736 b!1122734) bm!47233))

(assert (= (and b!1122730 (not res!750105)) b!1122731))

(assert (= (and b!1122725 condMapEmpty!44101) mapIsEmpty!44101))

(assert (= (and b!1122725 (not condMapEmpty!44101)) mapNonEmpty!44101))

(get-info :version)

(assert (= (and mapNonEmpty!44101 ((_ is ValueCellFull!13385) mapValue!44101)) b!1122729))

(assert (= (and b!1122725 ((_ is ValueCellFull!13385) mapDefault!44101)) b!1122738))

(assert (= start!97952 b!1122725))

(declare-fun b_lambda!18611 () Bool)

(assert (=> (not b_lambda!18611) (not b!1122741)))

(declare-fun t!35250 () Bool)

(declare-fun tb!8463 () Bool)

(assert (=> (and start!97952 (= defaultEntry!1004 defaultEntry!1004) t!35250) tb!8463))

(declare-fun result!17495 () Bool)

(assert (=> tb!8463 (= result!17495 tp_is_empty!28189)))

(assert (=> b!1122741 t!35250))

(declare-fun b_and!38081 () Bool)

(assert (= b_and!38079 (and (=> t!35250 result!17495) b_and!38081)))

(declare-fun m!1036803 () Bool)

(assert (=> b!1122735 m!1036803))

(declare-fun m!1036805 () Bool)

(assert (=> b!1122726 m!1036805))

(declare-fun m!1036807 () Bool)

(assert (=> bm!47234 m!1036807))

(declare-fun m!1036809 () Bool)

(assert (=> b!1122732 m!1036809))

(declare-fun m!1036811 () Bool)

(assert (=> b!1122732 m!1036811))

(declare-fun m!1036813 () Bool)

(assert (=> b!1122736 m!1036813))

(declare-fun m!1036815 () Bool)

(assert (=> b!1122731 m!1036815))

(assert (=> b!1122731 m!1036815))

(declare-fun m!1036817 () Bool)

(assert (=> b!1122731 m!1036817))

(declare-fun m!1036819 () Bool)

(assert (=> start!97952 m!1036819))

(declare-fun m!1036821 () Bool)

(assert (=> start!97952 m!1036821))

(assert (=> bm!47233 m!1036815))

(declare-fun m!1036823 () Bool)

(assert (=> b!1122741 m!1036823))

(declare-fun m!1036825 () Bool)

(assert (=> b!1122741 m!1036825))

(declare-fun m!1036827 () Bool)

(assert (=> b!1122741 m!1036827))

(declare-fun m!1036829 () Bool)

(assert (=> b!1122741 m!1036829))

(declare-fun m!1036831 () Bool)

(assert (=> b!1122739 m!1036831))

(declare-fun m!1036833 () Bool)

(assert (=> b!1122730 m!1036833))

(declare-fun m!1036835 () Bool)

(assert (=> b!1122730 m!1036835))

(declare-fun m!1036837 () Bool)

(assert (=> b!1122727 m!1036837))

(declare-fun m!1036839 () Bool)

(assert (=> b!1122724 m!1036839))

(declare-fun m!1036841 () Bool)

(assert (=> b!1122728 m!1036841))

(declare-fun m!1036843 () Bool)

(assert (=> b!1122733 m!1036843))

(declare-fun m!1036845 () Bool)

(assert (=> b!1122733 m!1036845))

(declare-fun m!1036847 () Bool)

(assert (=> mapNonEmpty!44101 m!1036847))

(check-sat (not bm!47234) (not b!1122730) (not b!1122736) (not b!1122728) (not b!1122726) (not b!1122732) tp_is_empty!28189 b_and!38081 (not b!1122733) (not b_next!23659) (not bm!47233) (not b!1122741) (not b!1122731) (not mapNonEmpty!44101) (not b_lambda!18611) (not start!97952) (not b!1122727) (not b!1122724) (not b!1122735))
(check-sat b_and!38081 (not b_next!23659))
