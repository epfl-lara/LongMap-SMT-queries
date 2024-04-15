; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101166 () Bool)

(assert start!101166)

(declare-fun b_free!26095 () Bool)

(declare-fun b_next!26095 () Bool)

(assert (=> start!101166 (= b_free!26095 (not b_next!26095))))

(declare-fun tp!91306 () Bool)

(declare-fun b_and!43289 () Bool)

(assert (=> start!101166 (= tp!91306 b_and!43289)))

(declare-fun b!1214255 () Bool)

(declare-fun e!689564 () Bool)

(declare-fun tp_is_empty!30799 () Bool)

(assert (=> b!1214255 (= e!689564 tp_is_empty!30799)))

(declare-fun b!1214256 () Bool)

(declare-fun e!689561 () Bool)

(declare-fun mapRes!48073 () Bool)

(assert (=> b!1214256 (= e!689561 (and e!689564 mapRes!48073))))

(declare-fun condMapEmpty!48073 () Bool)

(declare-datatypes ((V!46193 0))(
  ( (V!46194 (val!15456 Int)) )
))
(declare-datatypes ((ValueCell!14690 0))(
  ( (ValueCellFull!14690 (v!18108 V!46193)) (EmptyCell!14690) )
))
(declare-datatypes ((array!78300 0))(
  ( (array!78301 (arr!37785 (Array (_ BitVec 32) ValueCell!14690)) (size!38323 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78300)

(declare-fun mapDefault!48073 () ValueCell!14690)

(assert (=> b!1214256 (= condMapEmpty!48073 (= (arr!37785 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14690)) mapDefault!48073)))))

(declare-fun b!1214257 () Bool)

(declare-fun res!806137 () Bool)

(declare-fun e!689562 () Bool)

(assert (=> b!1214257 (=> (not res!806137) (not e!689562))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214257 (= res!806137 (validMask!0 mask!1564))))

(declare-fun b!1214258 () Bool)

(declare-fun res!806140 () Bool)

(assert (=> b!1214258 (=> (not res!806140) (not e!689562))))

(declare-datatypes ((array!78302 0))(
  ( (array!78303 (arr!37786 (Array (_ BitVec 32) (_ BitVec 64))) (size!38324 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78302)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1214258 (= res!806140 (= (select (arr!37786 _keys!1208) i!673) k0!934))))

(declare-fun b!1214259 () Bool)

(declare-fun res!806146 () Bool)

(assert (=> b!1214259 (=> (not res!806146) (not e!689562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214259 (= res!806146 (validKeyInArray!0 k0!934))))

(declare-fun b!1214260 () Bool)

(declare-fun res!806141 () Bool)

(declare-fun e!689560 () Bool)

(assert (=> b!1214260 (=> (not res!806141) (not e!689560))))

(declare-fun lt!552143 () array!78302)

(declare-datatypes ((List!26723 0))(
  ( (Nil!26720) (Cons!26719 (h!27928 (_ BitVec 64)) (t!39789 List!26723)) )
))
(declare-fun arrayNoDuplicates!0 (array!78302 (_ BitVec 32) List!26723) Bool)

(assert (=> b!1214260 (= res!806141 (arrayNoDuplicates!0 lt!552143 #b00000000000000000000000000000000 Nil!26720))))

(declare-fun b!1214261 () Bool)

(declare-fun res!806139 () Bool)

(assert (=> b!1214261 (=> (not res!806139) (not e!689562))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214261 (= res!806139 (and (= (size!38323 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38324 _keys!1208) (size!38323 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48073 () Bool)

(assert (=> mapIsEmpty!48073 mapRes!48073))

(declare-fun b!1214263 () Bool)

(declare-fun e!689565 () Bool)

(assert (=> b!1214263 (= e!689565 tp_is_empty!30799)))

(declare-fun mapNonEmpty!48073 () Bool)

(declare-fun tp!91307 () Bool)

(assert (=> mapNonEmpty!48073 (= mapRes!48073 (and tp!91307 e!689565))))

(declare-fun mapKey!48073 () (_ BitVec 32))

(declare-fun mapValue!48073 () ValueCell!14690)

(declare-fun mapRest!48073 () (Array (_ BitVec 32) ValueCell!14690))

(assert (=> mapNonEmpty!48073 (= (arr!37785 _values!996) (store mapRest!48073 mapKey!48073 mapValue!48073))))

(declare-fun b!1214264 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!689563 () Bool)

(assert (=> b!1214264 (= e!689563 (or (= from!1455 i!673) (bvsge from!1455 i!673) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38324 _keys!1208)))))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46193)

(declare-datatypes ((tuple2!19946 0))(
  ( (tuple2!19947 (_1!9984 (_ BitVec 64)) (_2!9984 V!46193)) )
))
(declare-datatypes ((List!26724 0))(
  ( (Nil!26721) (Cons!26720 (h!27929 tuple2!19946) (t!39790 List!26724)) )
))
(declare-datatypes ((ListLongMap!17915 0))(
  ( (ListLongMap!17916 (toList!8973 List!26724)) )
))
(declare-fun lt!552140 () ListLongMap!17915)

(declare-fun zeroValue!944 () V!46193)

(declare-fun getCurrentListMapNoExtraKeys!5412 (array!78302 array!78300 (_ BitVec 32) (_ BitVec 32) V!46193 V!46193 (_ BitVec 32) Int) ListLongMap!17915)

(declare-fun dynLambda!3264 (Int (_ BitVec 64)) V!46193)

(assert (=> b!1214264 (= lt!552140 (getCurrentListMapNoExtraKeys!5412 lt!552143 (array!78301 (store (arr!37785 _values!996) i!673 (ValueCellFull!14690 (dynLambda!3264 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38323 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552142 () ListLongMap!17915)

(assert (=> b!1214264 (= lt!552142 (getCurrentListMapNoExtraKeys!5412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214265 () Bool)

(declare-fun res!806136 () Bool)

(assert (=> b!1214265 (=> (not res!806136) (not e!689562))))

(assert (=> b!1214265 (= res!806136 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38324 _keys!1208))))))

(declare-fun b!1214266 () Bool)

(assert (=> b!1214266 (= e!689560 (not e!689563))))

(declare-fun res!806143 () Bool)

(assert (=> b!1214266 (=> res!806143 e!689563)))

(assert (=> b!1214266 (= res!806143 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214266 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40121 0))(
  ( (Unit!40122) )
))
(declare-fun lt!552141 () Unit!40121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78302 (_ BitVec 64) (_ BitVec 32)) Unit!40121)

(assert (=> b!1214266 (= lt!552141 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214267 () Bool)

(declare-fun res!806145 () Bool)

(assert (=> b!1214267 (=> (not res!806145) (not e!689562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78302 (_ BitVec 32)) Bool)

(assert (=> b!1214267 (= res!806145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214268 () Bool)

(declare-fun res!806142 () Bool)

(assert (=> b!1214268 (=> (not res!806142) (not e!689562))))

(assert (=> b!1214268 (= res!806142 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26720))))

(declare-fun res!806138 () Bool)

(assert (=> start!101166 (=> (not res!806138) (not e!689562))))

(assert (=> start!101166 (= res!806138 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38324 _keys!1208))))))

(assert (=> start!101166 e!689562))

(assert (=> start!101166 tp_is_empty!30799))

(declare-fun array_inv!28884 (array!78302) Bool)

(assert (=> start!101166 (array_inv!28884 _keys!1208)))

(assert (=> start!101166 true))

(assert (=> start!101166 tp!91306))

(declare-fun array_inv!28885 (array!78300) Bool)

(assert (=> start!101166 (and (array_inv!28885 _values!996) e!689561)))

(declare-fun b!1214262 () Bool)

(assert (=> b!1214262 (= e!689562 e!689560)))

(declare-fun res!806144 () Bool)

(assert (=> b!1214262 (=> (not res!806144) (not e!689560))))

(assert (=> b!1214262 (= res!806144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552143 mask!1564))))

(assert (=> b!1214262 (= lt!552143 (array!78303 (store (arr!37786 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38324 _keys!1208)))))

(assert (= (and start!101166 res!806138) b!1214257))

(assert (= (and b!1214257 res!806137) b!1214261))

(assert (= (and b!1214261 res!806139) b!1214267))

(assert (= (and b!1214267 res!806145) b!1214268))

(assert (= (and b!1214268 res!806142) b!1214265))

(assert (= (and b!1214265 res!806136) b!1214259))

(assert (= (and b!1214259 res!806146) b!1214258))

(assert (= (and b!1214258 res!806140) b!1214262))

(assert (= (and b!1214262 res!806144) b!1214260))

(assert (= (and b!1214260 res!806141) b!1214266))

(assert (= (and b!1214266 (not res!806143)) b!1214264))

(assert (= (and b!1214256 condMapEmpty!48073) mapIsEmpty!48073))

(assert (= (and b!1214256 (not condMapEmpty!48073)) mapNonEmpty!48073))

(get-info :version)

(assert (= (and mapNonEmpty!48073 ((_ is ValueCellFull!14690) mapValue!48073)) b!1214263))

(assert (= (and b!1214256 ((_ is ValueCellFull!14690) mapDefault!48073)) b!1214255))

(assert (= start!101166 b!1214256))

(declare-fun b_lambda!21761 () Bool)

(assert (=> (not b_lambda!21761) (not b!1214264)))

(declare-fun t!39788 () Bool)

(declare-fun tb!10887 () Bool)

(assert (=> (and start!101166 (= defaultEntry!1004 defaultEntry!1004) t!39788) tb!10887))

(declare-fun result!22379 () Bool)

(assert (=> tb!10887 (= result!22379 tp_is_empty!30799)))

(assert (=> b!1214264 t!39788))

(declare-fun b_and!43291 () Bool)

(assert (= b_and!43289 (and (=> t!39788 result!22379) b_and!43291)))

(declare-fun m!1119015 () Bool)

(assert (=> b!1214260 m!1119015))

(declare-fun m!1119017 () Bool)

(assert (=> b!1214258 m!1119017))

(declare-fun m!1119019 () Bool)

(assert (=> start!101166 m!1119019))

(declare-fun m!1119021 () Bool)

(assert (=> start!101166 m!1119021))

(declare-fun m!1119023 () Bool)

(assert (=> b!1214257 m!1119023))

(declare-fun m!1119025 () Bool)

(assert (=> b!1214262 m!1119025))

(declare-fun m!1119027 () Bool)

(assert (=> b!1214262 m!1119027))

(declare-fun m!1119029 () Bool)

(assert (=> mapNonEmpty!48073 m!1119029))

(declare-fun m!1119031 () Bool)

(assert (=> b!1214266 m!1119031))

(declare-fun m!1119033 () Bool)

(assert (=> b!1214266 m!1119033))

(declare-fun m!1119035 () Bool)

(assert (=> b!1214259 m!1119035))

(declare-fun m!1119037 () Bool)

(assert (=> b!1214268 m!1119037))

(declare-fun m!1119039 () Bool)

(assert (=> b!1214267 m!1119039))

(declare-fun m!1119041 () Bool)

(assert (=> b!1214264 m!1119041))

(declare-fun m!1119043 () Bool)

(assert (=> b!1214264 m!1119043))

(declare-fun m!1119045 () Bool)

(assert (=> b!1214264 m!1119045))

(declare-fun m!1119047 () Bool)

(assert (=> b!1214264 m!1119047))

(check-sat (not b!1214262) (not b!1214259) (not b!1214260) (not b_lambda!21761) b_and!43291 (not b!1214266) tp_is_empty!30799 (not b!1214257) (not b!1214264) (not b!1214268) (not b!1214267) (not mapNonEmpty!48073) (not b_next!26095) (not start!101166))
(check-sat b_and!43291 (not b_next!26095))
