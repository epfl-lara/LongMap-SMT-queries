; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98140 () Bool)

(assert start!98140)

(declare-fun b_free!23841 () Bool)

(declare-fun b_next!23841 () Bool)

(assert (=> start!98140 (= b_free!23841 (not b_next!23841))))

(declare-fun tp!84227 () Bool)

(declare-fun b_and!38465 () Bool)

(assert (=> start!98140 (= tp!84227 b_and!38465)))

(declare-fun b!1128147 () Bool)

(declare-fun e!642085 () Bool)

(declare-fun tp_is_empty!28371 () Bool)

(assert (=> b!1128147 (= e!642085 tp_is_empty!28371)))

(declare-fun b!1128148 () Bool)

(declare-fun res!753912 () Bool)

(declare-fun e!642084 () Bool)

(assert (=> b!1128148 (=> (not res!753912) (not e!642084))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128148 (= res!753912 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44374 () Bool)

(declare-fun mapRes!44374 () Bool)

(assert (=> mapIsEmpty!44374 mapRes!44374))

(declare-fun b!1128149 () Bool)

(declare-fun res!753917 () Bool)

(declare-fun e!642081 () Bool)

(assert (=> b!1128149 (=> (not res!753917) (not e!642081))))

(declare-datatypes ((array!73601 0))(
  ( (array!73602 (arr!35453 (Array (_ BitVec 32) (_ BitVec 64))) (size!35989 (_ BitVec 32))) )
))
(declare-fun lt!500856 () array!73601)

(declare-datatypes ((List!24691 0))(
  ( (Nil!24688) (Cons!24687 (h!25896 (_ BitVec 64)) (t!35524 List!24691)) )
))
(declare-fun arrayNoDuplicates!0 (array!73601 (_ BitVec 32) List!24691) Bool)

(assert (=> b!1128149 (= res!753917 (arrayNoDuplicates!0 lt!500856 #b00000000000000000000000000000000 Nil!24688))))

(declare-fun e!642083 () Bool)

(declare-datatypes ((V!42955 0))(
  ( (V!42956 (val!14242 Int)) )
))
(declare-datatypes ((tuple2!17920 0))(
  ( (tuple2!17921 (_1!8971 (_ BitVec 64)) (_2!8971 V!42955)) )
))
(declare-datatypes ((List!24692 0))(
  ( (Nil!24689) (Cons!24688 (h!25897 tuple2!17920) (t!35525 List!24692)) )
))
(declare-datatypes ((ListLongMap!15889 0))(
  ( (ListLongMap!15890 (toList!7960 List!24692)) )
))
(declare-fun call!47806 () ListLongMap!15889)

(declare-fun call!47805 () ListLongMap!15889)

(declare-fun b!1128150 () Bool)

(declare-fun -!1146 (ListLongMap!15889 (_ BitVec 64)) ListLongMap!15889)

(assert (=> b!1128150 (= e!642083 (= call!47805 (-!1146 call!47806 k0!934)))))

(declare-fun b!1128151 () Bool)

(declare-fun res!753916 () Bool)

(assert (=> b!1128151 (=> (not res!753916) (not e!642084))))

(declare-fun _keys!1208 () array!73601)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73601 (_ BitVec 32)) Bool)

(assert (=> b!1128151 (= res!753916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128152 () Bool)

(declare-fun res!753910 () Bool)

(assert (=> b!1128152 (=> (not res!753910) (not e!642084))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128152 (= res!753910 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35989 _keys!1208))))))

(declare-fun b!1128153 () Bool)

(declare-fun e!642078 () Bool)

(assert (=> b!1128153 (= e!642078 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13476 0))(
  ( (ValueCellFull!13476 (v!16875 V!42955)) (EmptyCell!13476) )
))
(declare-datatypes ((array!73603 0))(
  ( (array!73604 (arr!35454 (Array (_ BitVec 32) ValueCell!13476)) (size!35990 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73603)

(declare-fun minValue!944 () V!42955)

(declare-fun lt!500855 () Bool)

(declare-fun zeroValue!944 () V!42955)

(declare-fun contains!6487 (ListLongMap!15889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4447 (array!73601 array!73603 (_ BitVec 32) (_ BitVec 32) V!42955 V!42955 (_ BitVec 32) Int) ListLongMap!15889)

(assert (=> b!1128153 (= lt!500855 (contains!6487 (getCurrentListMapNoExtraKeys!4447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128154 () Bool)

(declare-fun res!753922 () Bool)

(assert (=> b!1128154 (=> (not res!753922) (not e!642084))))

(assert (=> b!1128154 (= res!753922 (and (= (size!35990 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35989 _keys!1208) (size!35990 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128155 () Bool)

(declare-fun e!642082 () Bool)

(assert (=> b!1128155 (= e!642081 (not e!642082))))

(declare-fun res!753918 () Bool)

(assert (=> b!1128155 (=> res!753918 e!642082)))

(assert (=> b!1128155 (= res!753918 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128155 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36960 0))(
  ( (Unit!36961) )
))
(declare-fun lt!500854 () Unit!36960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73601 (_ BitVec 64) (_ BitVec 32)) Unit!36960)

(assert (=> b!1128155 (= lt!500854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128156 () Bool)

(declare-fun res!753914 () Bool)

(assert (=> b!1128156 (=> (not res!753914) (not e!642084))))

(assert (=> b!1128156 (= res!753914 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24688))))

(declare-fun b!1128157 () Bool)

(assert (=> b!1128157 (= e!642083 (= call!47805 call!47806))))

(declare-fun res!753913 () Bool)

(assert (=> start!98140 (=> (not res!753913) (not e!642084))))

(assert (=> start!98140 (= res!753913 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35989 _keys!1208))))))

(assert (=> start!98140 e!642084))

(assert (=> start!98140 tp_is_empty!28371))

(declare-fun array_inv!27202 (array!73601) Bool)

(assert (=> start!98140 (array_inv!27202 _keys!1208)))

(assert (=> start!98140 true))

(assert (=> start!98140 tp!84227))

(declare-fun e!642079 () Bool)

(declare-fun array_inv!27203 (array!73603) Bool)

(assert (=> start!98140 (and (array_inv!27203 _values!996) e!642079)))

(declare-fun bm!47802 () Bool)

(assert (=> bm!47802 (= call!47806 (getCurrentListMapNoExtraKeys!4447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128158 () Bool)

(declare-fun res!753911 () Bool)

(assert (=> b!1128158 (=> (not res!753911) (not e!642084))))

(assert (=> b!1128158 (= res!753911 (= (select (arr!35453 _keys!1208) i!673) k0!934))))

(declare-fun b!1128159 () Bool)

(declare-fun res!753919 () Bool)

(assert (=> b!1128159 (=> (not res!753919) (not e!642084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128159 (= res!753919 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44374 () Bool)

(declare-fun tp!84226 () Bool)

(assert (=> mapNonEmpty!44374 (= mapRes!44374 (and tp!84226 e!642085))))

(declare-fun mapKey!44374 () (_ BitVec 32))

(declare-fun mapValue!44374 () ValueCell!13476)

(declare-fun mapRest!44374 () (Array (_ BitVec 32) ValueCell!13476))

(assert (=> mapNonEmpty!44374 (= (arr!35454 _values!996) (store mapRest!44374 mapKey!44374 mapValue!44374))))

(declare-fun b!1128160 () Bool)

(declare-fun e!642086 () Bool)

(assert (=> b!1128160 (= e!642082 e!642086)))

(declare-fun res!753915 () Bool)

(assert (=> b!1128160 (=> res!753915 e!642086)))

(assert (=> b!1128160 (= res!753915 (not (= from!1455 i!673)))))

(declare-fun lt!500858 () array!73603)

(declare-fun lt!500852 () ListLongMap!15889)

(assert (=> b!1128160 (= lt!500852 (getCurrentListMapNoExtraKeys!4447 lt!500856 lt!500858 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2531 (Int (_ BitVec 64)) V!42955)

(assert (=> b!1128160 (= lt!500858 (array!73604 (store (arr!35454 _values!996) i!673 (ValueCellFull!13476 (dynLambda!2531 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35990 _values!996)))))

(declare-fun lt!500857 () ListLongMap!15889)

(assert (=> b!1128160 (= lt!500857 (getCurrentListMapNoExtraKeys!4447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128161 () Bool)

(declare-fun e!642080 () Bool)

(assert (=> b!1128161 (= e!642080 tp_is_empty!28371)))

(declare-fun bm!47803 () Bool)

(assert (=> bm!47803 (= call!47805 (getCurrentListMapNoExtraKeys!4447 lt!500856 lt!500858 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128162 () Bool)

(assert (=> b!1128162 (= e!642086 e!642078)))

(declare-fun res!753920 () Bool)

(assert (=> b!1128162 (=> res!753920 e!642078)))

(assert (=> b!1128162 (= res!753920 (not (= (select (arr!35453 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128162 e!642083))

(declare-fun c!109752 () Bool)

(assert (=> b!1128162 (= c!109752 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500853 () Unit!36960)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!399 (array!73601 array!73603 (_ BitVec 32) (_ BitVec 32) V!42955 V!42955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36960)

(assert (=> b!1128162 (= lt!500853 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128163 () Bool)

(assert (=> b!1128163 (= e!642079 (and e!642080 mapRes!44374))))

(declare-fun condMapEmpty!44374 () Bool)

(declare-fun mapDefault!44374 () ValueCell!13476)

(assert (=> b!1128163 (= condMapEmpty!44374 (= (arr!35454 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13476)) mapDefault!44374)))))

(declare-fun b!1128164 () Bool)

(assert (=> b!1128164 (= e!642084 e!642081)))

(declare-fun res!753921 () Bool)

(assert (=> b!1128164 (=> (not res!753921) (not e!642081))))

(assert (=> b!1128164 (= res!753921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500856 mask!1564))))

(assert (=> b!1128164 (= lt!500856 (array!73602 (store (arr!35453 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35989 _keys!1208)))))

(assert (= (and start!98140 res!753913) b!1128159))

(assert (= (and b!1128159 res!753919) b!1128154))

(assert (= (and b!1128154 res!753922) b!1128151))

(assert (= (and b!1128151 res!753916) b!1128156))

(assert (= (and b!1128156 res!753914) b!1128152))

(assert (= (and b!1128152 res!753910) b!1128148))

(assert (= (and b!1128148 res!753912) b!1128158))

(assert (= (and b!1128158 res!753911) b!1128164))

(assert (= (and b!1128164 res!753921) b!1128149))

(assert (= (and b!1128149 res!753917) b!1128155))

(assert (= (and b!1128155 (not res!753918)) b!1128160))

(assert (= (and b!1128160 (not res!753915)) b!1128162))

(assert (= (and b!1128162 c!109752) b!1128150))

(assert (= (and b!1128162 (not c!109752)) b!1128157))

(assert (= (or b!1128150 b!1128157) bm!47803))

(assert (= (or b!1128150 b!1128157) bm!47802))

(assert (= (and b!1128162 (not res!753920)) b!1128153))

(assert (= (and b!1128163 condMapEmpty!44374) mapIsEmpty!44374))

(assert (= (and b!1128163 (not condMapEmpty!44374)) mapNonEmpty!44374))

(get-info :version)

(assert (= (and mapNonEmpty!44374 ((_ is ValueCellFull!13476) mapValue!44374)) b!1128147))

(assert (= (and b!1128163 ((_ is ValueCellFull!13476) mapDefault!44374)) b!1128161))

(assert (= start!98140 b!1128163))

(declare-fun b_lambda!18811 () Bool)

(assert (=> (not b_lambda!18811) (not b!1128160)))

(declare-fun t!35523 () Bool)

(declare-fun tb!8653 () Bool)

(assert (=> (and start!98140 (= defaultEntry!1004 defaultEntry!1004) t!35523) tb!8653))

(declare-fun result!17867 () Bool)

(assert (=> tb!8653 (= result!17867 tp_is_empty!28371)))

(assert (=> b!1128160 t!35523))

(declare-fun b_and!38467 () Bool)

(assert (= b_and!38465 (and (=> t!35523 result!17867) b_and!38467)))

(declare-fun m!1041799 () Bool)

(assert (=> b!1128160 m!1041799))

(declare-fun m!1041801 () Bool)

(assert (=> b!1128160 m!1041801))

(declare-fun m!1041803 () Bool)

(assert (=> b!1128160 m!1041803))

(declare-fun m!1041805 () Bool)

(assert (=> b!1128160 m!1041805))

(declare-fun m!1041807 () Bool)

(assert (=> bm!47803 m!1041807))

(declare-fun m!1041809 () Bool)

(assert (=> b!1128151 m!1041809))

(declare-fun m!1041811 () Bool)

(assert (=> b!1128159 m!1041811))

(declare-fun m!1041813 () Bool)

(assert (=> b!1128156 m!1041813))

(declare-fun m!1041815 () Bool)

(assert (=> b!1128155 m!1041815))

(declare-fun m!1041817 () Bool)

(assert (=> b!1128155 m!1041817))

(declare-fun m!1041819 () Bool)

(assert (=> b!1128158 m!1041819))

(declare-fun m!1041821 () Bool)

(assert (=> b!1128153 m!1041821))

(assert (=> b!1128153 m!1041821))

(declare-fun m!1041823 () Bool)

(assert (=> b!1128153 m!1041823))

(declare-fun m!1041825 () Bool)

(assert (=> b!1128148 m!1041825))

(declare-fun m!1041827 () Bool)

(assert (=> b!1128164 m!1041827))

(declare-fun m!1041829 () Bool)

(assert (=> b!1128164 m!1041829))

(declare-fun m!1041831 () Bool)

(assert (=> b!1128149 m!1041831))

(declare-fun m!1041833 () Bool)

(assert (=> b!1128150 m!1041833))

(assert (=> bm!47802 m!1041821))

(declare-fun m!1041835 () Bool)

(assert (=> b!1128162 m!1041835))

(declare-fun m!1041837 () Bool)

(assert (=> b!1128162 m!1041837))

(declare-fun m!1041839 () Bool)

(assert (=> mapNonEmpty!44374 m!1041839))

(declare-fun m!1041841 () Bool)

(assert (=> start!98140 m!1041841))

(declare-fun m!1041843 () Bool)

(assert (=> start!98140 m!1041843))

(check-sat (not b_next!23841) (not mapNonEmpty!44374) (not start!98140) (not b!1128160) (not b_lambda!18811) (not b!1128162) (not b!1128155) (not b!1128148) (not b!1128164) (not b!1128159) (not b!1128150) (not bm!47803) (not b!1128151) (not b!1128153) (not b!1128149) tp_is_empty!28371 (not b!1128156) b_and!38467 (not bm!47802))
(check-sat b_and!38467 (not b_next!23841))
