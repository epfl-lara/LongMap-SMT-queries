; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99912 () Bool)

(assert start!99912)

(declare-fun b_free!25491 () Bool)

(declare-fun b_next!25491 () Bool)

(assert (=> start!99912 (= b_free!25491 (not b_next!25491))))

(declare-fun tp!89187 () Bool)

(declare-fun b_and!41849 () Bool)

(assert (=> start!99912 (= tp!89187 b_and!41849)))

(declare-fun b!1189212 () Bool)

(declare-fun res!790782 () Bool)

(declare-fun e!676134 () Bool)

(assert (=> b!1189212 (=> (not res!790782) (not e!676134))))

(declare-datatypes ((array!76837 0))(
  ( (array!76838 (arr!37068 (Array (_ BitVec 32) (_ BitVec 64))) (size!37604 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76837)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1189212 (= res!790782 (= (select (arr!37068 _keys!1208) i!673) k0!934))))

(declare-fun b!1189213 () Bool)

(declare-fun e!676132 () Bool)

(declare-fun e!676138 () Bool)

(assert (=> b!1189213 (= e!676132 e!676138)))

(declare-fun res!790781 () Bool)

(assert (=> b!1189213 (=> res!790781 e!676138)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189213 (= res!790781 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45155 0))(
  ( (V!45156 (val!15067 Int)) )
))
(declare-fun zeroValue!944 () V!45155)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!540982 () array!76837)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19350 0))(
  ( (tuple2!19351 (_1!9686 (_ BitVec 64)) (_2!9686 V!45155)) )
))
(declare-datatypes ((List!26095 0))(
  ( (Nil!26092) (Cons!26091 (h!27300 tuple2!19350) (t!38578 List!26095)) )
))
(declare-datatypes ((ListLongMap!17319 0))(
  ( (ListLongMap!17320 (toList!8675 List!26095)) )
))
(declare-fun lt!540980 () ListLongMap!17319)

(declare-datatypes ((ValueCell!14301 0))(
  ( (ValueCellFull!14301 (v!17705 V!45155)) (EmptyCell!14301) )
))
(declare-datatypes ((array!76839 0))(
  ( (array!76840 (arr!37069 (Array (_ BitVec 32) ValueCell!14301)) (size!37605 (_ BitVec 32))) )
))
(declare-fun lt!540984 () array!76839)

(declare-fun minValue!944 () V!45155)

(declare-fun getCurrentListMapNoExtraKeys!5116 (array!76837 array!76839 (_ BitVec 32) (_ BitVec 32) V!45155 V!45155 (_ BitVec 32) Int) ListLongMap!17319)

(assert (=> b!1189213 (= lt!540980 (getCurrentListMapNoExtraKeys!5116 lt!540982 lt!540984 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76839)

(declare-fun dynLambda!3060 (Int (_ BitVec 64)) V!45155)

(assert (=> b!1189213 (= lt!540984 (array!76840 (store (arr!37069 _values!996) i!673 (ValueCellFull!14301 (dynLambda!3060 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37605 _values!996)))))

(declare-fun lt!540979 () ListLongMap!17319)

(assert (=> b!1189213 (= lt!540979 (getCurrentListMapNoExtraKeys!5116 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189214 () Bool)

(declare-fun e!676137 () Bool)

(assert (=> b!1189214 (= e!676134 e!676137)))

(declare-fun res!790772 () Bool)

(assert (=> b!1189214 (=> (not res!790772) (not e!676137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76837 (_ BitVec 32)) Bool)

(assert (=> b!1189214 (= res!790772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540982 mask!1564))))

(assert (=> b!1189214 (= lt!540982 (array!76838 (store (arr!37068 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37604 _keys!1208)))))

(declare-fun b!1189215 () Bool)

(declare-fun res!790776 () Bool)

(assert (=> b!1189215 (=> (not res!790776) (not e!676134))))

(assert (=> b!1189215 (= res!790776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189217 () Bool)

(declare-fun res!790779 () Bool)

(assert (=> b!1189217 (=> (not res!790779) (not e!676134))))

(assert (=> b!1189217 (= res!790779 (and (= (size!37605 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37604 _keys!1208) (size!37605 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189218 () Bool)

(declare-fun e!676131 () Bool)

(declare-fun tp_is_empty!30021 () Bool)

(assert (=> b!1189218 (= e!676131 tp_is_empty!30021)))

(declare-fun b!1189219 () Bool)

(declare-fun res!790783 () Bool)

(assert (=> b!1189219 (=> (not res!790783) (not e!676137))))

(declare-datatypes ((List!26096 0))(
  ( (Nil!26093) (Cons!26092 (h!27301 (_ BitVec 64)) (t!38579 List!26096)) )
))
(declare-fun arrayNoDuplicates!0 (array!76837 (_ BitVec 32) List!26096) Bool)

(assert (=> b!1189219 (= res!790783 (arrayNoDuplicates!0 lt!540982 #b00000000000000000000000000000000 Nil!26093))))

(declare-fun res!790778 () Bool)

(assert (=> start!99912 (=> (not res!790778) (not e!676134))))

(assert (=> start!99912 (= res!790778 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37604 _keys!1208))))))

(assert (=> start!99912 e!676134))

(assert (=> start!99912 tp_is_empty!30021))

(declare-fun array_inv!28272 (array!76837) Bool)

(assert (=> start!99912 (array_inv!28272 _keys!1208)))

(assert (=> start!99912 true))

(assert (=> start!99912 tp!89187))

(declare-fun e!676133 () Bool)

(declare-fun array_inv!28273 (array!76839) Bool)

(assert (=> start!99912 (and (array_inv!28273 _values!996) e!676133)))

(declare-fun b!1189216 () Bool)

(declare-fun res!790777 () Bool)

(assert (=> b!1189216 (=> (not res!790777) (not e!676134))))

(assert (=> b!1189216 (= res!790777 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37604 _keys!1208))))))

(declare-fun b!1189220 () Bool)

(declare-fun res!790773 () Bool)

(assert (=> b!1189220 (=> (not res!790773) (not e!676134))))

(assert (=> b!1189220 (= res!790773 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26093))))

(declare-fun b!1189221 () Bool)

(declare-fun e!676135 () Bool)

(assert (=> b!1189221 (= e!676135 tp_is_empty!30021)))

(declare-fun mapNonEmpty!46859 () Bool)

(declare-fun mapRes!46859 () Bool)

(declare-fun tp!89186 () Bool)

(assert (=> mapNonEmpty!46859 (= mapRes!46859 (and tp!89186 e!676131))))

(declare-fun mapRest!46859 () (Array (_ BitVec 32) ValueCell!14301))

(declare-fun mapValue!46859 () ValueCell!14301)

(declare-fun mapKey!46859 () (_ BitVec 32))

(assert (=> mapNonEmpty!46859 (= (arr!37069 _values!996) (store mapRest!46859 mapKey!46859 mapValue!46859))))

(declare-fun b!1189222 () Bool)

(declare-fun res!790774 () Bool)

(assert (=> b!1189222 (=> (not res!790774) (not e!676134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189222 (= res!790774 (validMask!0 mask!1564))))

(declare-fun b!1189223 () Bool)

(declare-fun res!790775 () Bool)

(assert (=> b!1189223 (=> (not res!790775) (not e!676134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189223 (= res!790775 (validKeyInArray!0 k0!934))))

(declare-fun b!1189224 () Bool)

(assert (=> b!1189224 (= e!676133 (and e!676135 mapRes!46859))))

(declare-fun condMapEmpty!46859 () Bool)

(declare-fun mapDefault!46859 () ValueCell!14301)

(assert (=> b!1189224 (= condMapEmpty!46859 (= (arr!37069 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14301)) mapDefault!46859)))))

(declare-fun b!1189225 () Bool)

(assert (=> b!1189225 (= e!676137 (not e!676132))))

(declare-fun res!790780 () Bool)

(assert (=> b!1189225 (=> res!790780 e!676132)))

(assert (=> b!1189225 (= res!790780 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189225 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39450 0))(
  ( (Unit!39451) )
))
(declare-fun lt!540981 () Unit!39450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76837 (_ BitVec 64) (_ BitVec 32)) Unit!39450)

(assert (=> b!1189225 (= lt!540981 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189226 () Bool)

(assert (=> b!1189226 (= e!676138 true)))

(declare-fun -!1705 (ListLongMap!17319 (_ BitVec 64)) ListLongMap!17319)

(assert (=> b!1189226 (= (getCurrentListMapNoExtraKeys!5116 lt!540982 lt!540984 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1705 (getCurrentListMapNoExtraKeys!5116 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540983 () Unit!39450)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!914 (array!76837 array!76839 (_ BitVec 32) (_ BitVec 32) V!45155 V!45155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39450)

(assert (=> b!1189226 (= lt!540983 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!914 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46859 () Bool)

(assert (=> mapIsEmpty!46859 mapRes!46859))

(assert (= (and start!99912 res!790778) b!1189222))

(assert (= (and b!1189222 res!790774) b!1189217))

(assert (= (and b!1189217 res!790779) b!1189215))

(assert (= (and b!1189215 res!790776) b!1189220))

(assert (= (and b!1189220 res!790773) b!1189216))

(assert (= (and b!1189216 res!790777) b!1189223))

(assert (= (and b!1189223 res!790775) b!1189212))

(assert (= (and b!1189212 res!790782) b!1189214))

(assert (= (and b!1189214 res!790772) b!1189219))

(assert (= (and b!1189219 res!790783) b!1189225))

(assert (= (and b!1189225 (not res!790780)) b!1189213))

(assert (= (and b!1189213 (not res!790781)) b!1189226))

(assert (= (and b!1189224 condMapEmpty!46859) mapIsEmpty!46859))

(assert (= (and b!1189224 (not condMapEmpty!46859)) mapNonEmpty!46859))

(get-info :version)

(assert (= (and mapNonEmpty!46859 ((_ is ValueCellFull!14301) mapValue!46859)) b!1189218))

(assert (= (and b!1189224 ((_ is ValueCellFull!14301) mapDefault!46859)) b!1189221))

(assert (= start!99912 b!1189224))

(declare-fun b_lambda!20635 () Bool)

(assert (=> (not b_lambda!20635) (not b!1189213)))

(declare-fun t!38577 () Bool)

(declare-fun tb!10303 () Bool)

(assert (=> (and start!99912 (= defaultEntry!1004 defaultEntry!1004) t!38577) tb!10303))

(declare-fun result!21173 () Bool)

(assert (=> tb!10303 (= result!21173 tp_is_empty!30021)))

(assert (=> b!1189213 t!38577))

(declare-fun b_and!41851 () Bool)

(assert (= b_and!41849 (and (=> t!38577 result!21173) b_and!41851)))

(declare-fun m!1097913 () Bool)

(assert (=> b!1189215 m!1097913))

(declare-fun m!1097915 () Bool)

(assert (=> b!1189212 m!1097915))

(declare-fun m!1097917 () Bool)

(assert (=> b!1189225 m!1097917))

(declare-fun m!1097919 () Bool)

(assert (=> b!1189225 m!1097919))

(declare-fun m!1097921 () Bool)

(assert (=> b!1189220 m!1097921))

(declare-fun m!1097923 () Bool)

(assert (=> b!1189226 m!1097923))

(declare-fun m!1097925 () Bool)

(assert (=> b!1189226 m!1097925))

(assert (=> b!1189226 m!1097925))

(declare-fun m!1097927 () Bool)

(assert (=> b!1189226 m!1097927))

(declare-fun m!1097929 () Bool)

(assert (=> b!1189226 m!1097929))

(declare-fun m!1097931 () Bool)

(assert (=> b!1189219 m!1097931))

(declare-fun m!1097933 () Bool)

(assert (=> mapNonEmpty!46859 m!1097933))

(declare-fun m!1097935 () Bool)

(assert (=> start!99912 m!1097935))

(declare-fun m!1097937 () Bool)

(assert (=> start!99912 m!1097937))

(declare-fun m!1097939 () Bool)

(assert (=> b!1189222 m!1097939))

(declare-fun m!1097941 () Bool)

(assert (=> b!1189223 m!1097941))

(declare-fun m!1097943 () Bool)

(assert (=> b!1189214 m!1097943))

(declare-fun m!1097945 () Bool)

(assert (=> b!1189214 m!1097945))

(declare-fun m!1097947 () Bool)

(assert (=> b!1189213 m!1097947))

(declare-fun m!1097949 () Bool)

(assert (=> b!1189213 m!1097949))

(declare-fun m!1097951 () Bool)

(assert (=> b!1189213 m!1097951))

(declare-fun m!1097953 () Bool)

(assert (=> b!1189213 m!1097953))

(check-sat (not b!1189213) (not mapNonEmpty!46859) (not b_lambda!20635) (not b!1189219) (not start!99912) b_and!41851 tp_is_empty!30021 (not b!1189215) (not b!1189214) (not b!1189225) (not b!1189223) (not b!1189220) (not b_next!25491) (not b!1189226) (not b!1189222))
(check-sat b_and!41851 (not b_next!25491))
