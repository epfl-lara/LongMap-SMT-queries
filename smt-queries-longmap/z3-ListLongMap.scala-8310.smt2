; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101210 () Bool)

(assert start!101210)

(declare-fun b_free!26133 () Bool)

(declare-fun b_next!26133 () Bool)

(assert (=> start!101210 (= b_free!26133 (not b_next!26133))))

(declare-fun tp!91421 () Bool)

(declare-fun b_and!43383 () Bool)

(assert (=> start!101210 (= tp!91421 b_and!43383)))

(declare-fun b!1215200 () Bool)

(declare-fun e!690032 () Bool)

(declare-fun tp_is_empty!30837 () Bool)

(assert (=> b!1215200 (= e!690032 tp_is_empty!30837)))

(declare-fun b!1215201 () Bool)

(declare-fun e!690030 () Bool)

(declare-fun e!690034 () Bool)

(assert (=> b!1215201 (= e!690030 (not e!690034))))

(declare-fun res!806833 () Bool)

(assert (=> b!1215201 (=> res!806833 e!690034)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215201 (= res!806833 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78453 0))(
  ( (array!78454 (arr!37861 (Array (_ BitVec 32) (_ BitVec 64))) (size!38397 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78453)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215201 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40294 0))(
  ( (Unit!40295) )
))
(declare-fun lt!552549 () Unit!40294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78453 (_ BitVec 64) (_ BitVec 32)) Unit!40294)

(assert (=> b!1215201 (= lt!552549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48130 () Bool)

(declare-fun mapRes!48130 () Bool)

(assert (=> mapIsEmpty!48130 mapRes!48130))

(declare-fun b!1215202 () Bool)

(declare-fun res!806832 () Bool)

(declare-fun e!690031 () Bool)

(assert (=> b!1215202 (=> (not res!806832) (not e!690031))))

(declare-datatypes ((List!26691 0))(
  ( (Nil!26688) (Cons!26687 (h!27896 (_ BitVec 64)) (t!39804 List!26691)) )
))
(declare-fun arrayNoDuplicates!0 (array!78453 (_ BitVec 32) List!26691) Bool)

(assert (=> b!1215202 (= res!806832 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26688))))

(declare-fun b!1215203 () Bool)

(assert (=> b!1215203 (= e!690034 true)))

(declare-datatypes ((V!46243 0))(
  ( (V!46244 (val!15475 Int)) )
))
(declare-fun zeroValue!944 () V!46243)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!552551 () array!78453)

(declare-datatypes ((ValueCell!14709 0))(
  ( (ValueCellFull!14709 (v!18128 V!46243)) (EmptyCell!14709) )
))
(declare-datatypes ((array!78455 0))(
  ( (array!78456 (arr!37862 (Array (_ BitVec 32) ValueCell!14709)) (size!38398 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78455)

(declare-fun minValue!944 () V!46243)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19890 0))(
  ( (tuple2!19891 (_1!9956 (_ BitVec 64)) (_2!9956 V!46243)) )
))
(declare-datatypes ((List!26692 0))(
  ( (Nil!26689) (Cons!26688 (h!27897 tuple2!19890) (t!39805 List!26692)) )
))
(declare-datatypes ((ListLongMap!17859 0))(
  ( (ListLongMap!17860 (toList!8945 List!26692)) )
))
(declare-fun lt!552550 () ListLongMap!17859)

(declare-fun getCurrentListMapNoExtraKeys!5372 (array!78453 array!78455 (_ BitVec 32) (_ BitVec 32) V!46243 V!46243 (_ BitVec 32) Int) ListLongMap!17859)

(declare-fun dynLambda!3261 (Int (_ BitVec 64)) V!46243)

(assert (=> b!1215203 (= lt!552550 (getCurrentListMapNoExtraKeys!5372 lt!552551 (array!78456 (store (arr!37862 _values!996) i!673 (ValueCellFull!14709 (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38398 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552552 () ListLongMap!17859)

(assert (=> b!1215203 (= lt!552552 (getCurrentListMapNoExtraKeys!5372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215204 () Bool)

(declare-fun res!806830 () Bool)

(assert (=> b!1215204 (=> (not res!806830) (not e!690031))))

(assert (=> b!1215204 (= res!806830 (and (= (size!38398 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38397 _keys!1208) (size!38398 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215205 () Bool)

(declare-fun res!806825 () Bool)

(assert (=> b!1215205 (=> (not res!806825) (not e!690031))))

(assert (=> b!1215205 (= res!806825 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38397 _keys!1208))))))

(declare-fun b!1215206 () Bool)

(assert (=> b!1215206 (= e!690031 e!690030)))

(declare-fun res!806831 () Bool)

(assert (=> b!1215206 (=> (not res!806831) (not e!690030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78453 (_ BitVec 32)) Bool)

(assert (=> b!1215206 (= res!806831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552551 mask!1564))))

(assert (=> b!1215206 (= lt!552551 (array!78454 (store (arr!37861 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38397 _keys!1208)))))

(declare-fun b!1215207 () Bool)

(declare-fun res!806829 () Bool)

(assert (=> b!1215207 (=> (not res!806829) (not e!690030))))

(assert (=> b!1215207 (= res!806829 (arrayNoDuplicates!0 lt!552551 #b00000000000000000000000000000000 Nil!26688))))

(declare-fun mapNonEmpty!48130 () Bool)

(declare-fun tp!91420 () Bool)

(declare-fun e!690028 () Bool)

(assert (=> mapNonEmpty!48130 (= mapRes!48130 (and tp!91420 e!690028))))

(declare-fun mapKey!48130 () (_ BitVec 32))

(declare-fun mapRest!48130 () (Array (_ BitVec 32) ValueCell!14709))

(declare-fun mapValue!48130 () ValueCell!14709)

(assert (=> mapNonEmpty!48130 (= (arr!37862 _values!996) (store mapRest!48130 mapKey!48130 mapValue!48130))))

(declare-fun b!1215208 () Bool)

(declare-fun res!806824 () Bool)

(assert (=> b!1215208 (=> (not res!806824) (not e!690031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215208 (= res!806824 (validKeyInArray!0 k0!934))))

(declare-fun b!1215209 () Bool)

(declare-fun res!806828 () Bool)

(assert (=> b!1215209 (=> (not res!806828) (not e!690031))))

(assert (=> b!1215209 (= res!806828 (= (select (arr!37861 _keys!1208) i!673) k0!934))))

(declare-fun res!806826 () Bool)

(assert (=> start!101210 (=> (not res!806826) (not e!690031))))

(assert (=> start!101210 (= res!806826 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38397 _keys!1208))))))

(assert (=> start!101210 e!690031))

(assert (=> start!101210 tp_is_empty!30837))

(declare-fun array_inv!28830 (array!78453) Bool)

(assert (=> start!101210 (array_inv!28830 _keys!1208)))

(assert (=> start!101210 true))

(assert (=> start!101210 tp!91421))

(declare-fun e!690033 () Bool)

(declare-fun array_inv!28831 (array!78455) Bool)

(assert (=> start!101210 (and (array_inv!28831 _values!996) e!690033)))

(declare-fun b!1215210 () Bool)

(declare-fun res!806827 () Bool)

(assert (=> b!1215210 (=> (not res!806827) (not e!690031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215210 (= res!806827 (validMask!0 mask!1564))))

(declare-fun b!1215211 () Bool)

(assert (=> b!1215211 (= e!690028 tp_is_empty!30837)))

(declare-fun b!1215212 () Bool)

(assert (=> b!1215212 (= e!690033 (and e!690032 mapRes!48130))))

(declare-fun condMapEmpty!48130 () Bool)

(declare-fun mapDefault!48130 () ValueCell!14709)

(assert (=> b!1215212 (= condMapEmpty!48130 (= (arr!37862 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14709)) mapDefault!48130)))))

(declare-fun b!1215213 () Bool)

(declare-fun res!806834 () Bool)

(assert (=> b!1215213 (=> (not res!806834) (not e!690031))))

(assert (=> b!1215213 (= res!806834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101210 res!806826) b!1215210))

(assert (= (and b!1215210 res!806827) b!1215204))

(assert (= (and b!1215204 res!806830) b!1215213))

(assert (= (and b!1215213 res!806834) b!1215202))

(assert (= (and b!1215202 res!806832) b!1215205))

(assert (= (and b!1215205 res!806825) b!1215208))

(assert (= (and b!1215208 res!806824) b!1215209))

(assert (= (and b!1215209 res!806828) b!1215206))

(assert (= (and b!1215206 res!806831) b!1215207))

(assert (= (and b!1215207 res!806829) b!1215201))

(assert (= (and b!1215201 (not res!806833)) b!1215203))

(assert (= (and b!1215212 condMapEmpty!48130) mapIsEmpty!48130))

(assert (= (and b!1215212 (not condMapEmpty!48130)) mapNonEmpty!48130))

(get-info :version)

(assert (= (and mapNonEmpty!48130 ((_ is ValueCellFull!14709) mapValue!48130)) b!1215211))

(assert (= (and b!1215212 ((_ is ValueCellFull!14709) mapDefault!48130)) b!1215200))

(assert (= start!101210 b!1215212))

(declare-fun b_lambda!21809 () Bool)

(assert (=> (not b_lambda!21809) (not b!1215203)))

(declare-fun t!39803 () Bool)

(declare-fun tb!10933 () Bool)

(assert (=> (and start!101210 (= defaultEntry!1004 defaultEntry!1004) t!39803) tb!10933))

(declare-fun result!22463 () Bool)

(assert (=> tb!10933 (= result!22463 tp_is_empty!30837)))

(assert (=> b!1215203 t!39803))

(declare-fun b_and!43385 () Bool)

(assert (= b_and!43383 (and (=> t!39803 result!22463) b_and!43385)))

(declare-fun m!1120225 () Bool)

(assert (=> mapNonEmpty!48130 m!1120225))

(declare-fun m!1120227 () Bool)

(assert (=> b!1215208 m!1120227))

(declare-fun m!1120229 () Bool)

(assert (=> b!1215206 m!1120229))

(declare-fun m!1120231 () Bool)

(assert (=> b!1215206 m!1120231))

(declare-fun m!1120233 () Bool)

(assert (=> start!101210 m!1120233))

(declare-fun m!1120235 () Bool)

(assert (=> start!101210 m!1120235))

(declare-fun m!1120237 () Bool)

(assert (=> b!1215207 m!1120237))

(declare-fun m!1120239 () Bool)

(assert (=> b!1215203 m!1120239))

(declare-fun m!1120241 () Bool)

(assert (=> b!1215203 m!1120241))

(declare-fun m!1120243 () Bool)

(assert (=> b!1215203 m!1120243))

(declare-fun m!1120245 () Bool)

(assert (=> b!1215203 m!1120245))

(declare-fun m!1120247 () Bool)

(assert (=> b!1215213 m!1120247))

(declare-fun m!1120249 () Bool)

(assert (=> b!1215201 m!1120249))

(declare-fun m!1120251 () Bool)

(assert (=> b!1215201 m!1120251))

(declare-fun m!1120253 () Bool)

(assert (=> b!1215209 m!1120253))

(declare-fun m!1120255 () Bool)

(assert (=> b!1215210 m!1120255))

(declare-fun m!1120257 () Bool)

(assert (=> b!1215202 m!1120257))

(check-sat (not b!1215203) tp_is_empty!30837 (not b!1215201) (not b!1215206) (not b!1215207) (not b!1215202) (not start!101210) (not b!1215213) (not b!1215210) (not b_lambda!21809) (not b!1215208) b_and!43385 (not b_next!26133) (not mapNonEmpty!48130))
(check-sat b_and!43385 (not b_next!26133))
