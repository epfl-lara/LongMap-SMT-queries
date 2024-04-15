; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96456 () Bool)

(assert start!96456)

(declare-fun b_free!23041 () Bool)

(declare-fun b_next!23041 () Bool)

(assert (=> start!96456 (= b_free!23041 (not b_next!23041))))

(declare-fun tp!81050 () Bool)

(declare-fun b_and!36719 () Bool)

(assert (=> start!96456 (= tp!81050 b_and!36719)))

(declare-fun b!1096711 () Bool)

(declare-fun res!732009 () Bool)

(declare-fun e!625968 () Bool)

(assert (=> b!1096711 (=> (not res!732009) (not e!625968))))

(declare-datatypes ((array!71004 0))(
  ( (array!71005 (arr!34174 (Array (_ BitVec 32) (_ BitVec 64))) (size!34712 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71004)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71004 (_ BitVec 32)) Bool)

(assert (=> b!1096711 (= res!732009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096712 () Bool)

(declare-fun e!625971 () Bool)

(assert (=> b!1096712 (= e!625971 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41249 0))(
  ( (V!41250 (val!13602 Int)) )
))
(declare-datatypes ((ValueCell!12836 0))(
  ( (ValueCellFull!12836 (v!16222 V!41249)) (EmptyCell!12836) )
))
(declare-datatypes ((array!71006 0))(
  ( (array!71007 (arr!34175 (Array (_ BitVec 32) ValueCell!12836)) (size!34713 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71006)

(declare-fun minValue!831 () V!41249)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!490082 () array!71004)

(declare-datatypes ((tuple2!17338 0))(
  ( (tuple2!17339 (_1!8680 (_ BitVec 64)) (_2!8680 V!41249)) )
))
(declare-datatypes ((List!23930 0))(
  ( (Nil!23927) (Cons!23926 (h!25135 tuple2!17338) (t!34008 List!23930)) )
))
(declare-datatypes ((ListLongMap!15307 0))(
  ( (ListLongMap!15308 (toList!7669 List!23930)) )
))
(declare-fun lt!490085 () ListLongMap!15307)

(declare-fun zeroValue!831 () V!41249)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4202 (array!71004 array!71006 (_ BitVec 32) (_ BitVec 32) V!41249 V!41249 (_ BitVec 32) Int) ListLongMap!15307)

(declare-fun dynLambda!2271 (Int (_ BitVec 64)) V!41249)

(assert (=> b!1096712 (= lt!490085 (getCurrentListMapNoExtraKeys!4202 lt!490082 (array!71007 (store (arr!34175 _values!874) i!650 (ValueCellFull!12836 (dynLambda!2271 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34713 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490084 () ListLongMap!15307)

(assert (=> b!1096712 (= lt!490084 (getCurrentListMapNoExtraKeys!4202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096712 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35925 0))(
  ( (Unit!35926) )
))
(declare-fun lt!490083 () Unit!35925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71004 (_ BitVec 64) (_ BitVec 32)) Unit!35925)

(assert (=> b!1096712 (= lt!490083 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42397 () Bool)

(declare-fun mapRes!42397 () Bool)

(assert (=> mapIsEmpty!42397 mapRes!42397))

(declare-fun res!732002 () Bool)

(assert (=> start!96456 (=> (not res!732002) (not e!625968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96456 (= res!732002 (validMask!0 mask!1414))))

(assert (=> start!96456 e!625968))

(assert (=> start!96456 tp!81050))

(assert (=> start!96456 true))

(declare-fun tp_is_empty!27091 () Bool)

(assert (=> start!96456 tp_is_empty!27091))

(declare-fun array_inv!26366 (array!71004) Bool)

(assert (=> start!96456 (array_inv!26366 _keys!1070)))

(declare-fun e!625967 () Bool)

(declare-fun array_inv!26367 (array!71006) Bool)

(assert (=> start!96456 (and (array_inv!26367 _values!874) e!625967)))

(declare-fun b!1096713 () Bool)

(declare-fun e!625972 () Bool)

(assert (=> b!1096713 (= e!625972 tp_is_empty!27091)))

(declare-fun b!1096714 () Bool)

(declare-fun res!732006 () Bool)

(assert (=> b!1096714 (=> (not res!732006) (not e!625968))))

(assert (=> b!1096714 (= res!732006 (and (= (size!34713 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34712 _keys!1070) (size!34713 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096715 () Bool)

(declare-fun e!625969 () Bool)

(assert (=> b!1096715 (= e!625967 (and e!625969 mapRes!42397))))

(declare-fun condMapEmpty!42397 () Bool)

(declare-fun mapDefault!42397 () ValueCell!12836)

(assert (=> b!1096715 (= condMapEmpty!42397 (= (arr!34175 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12836)) mapDefault!42397)))))

(declare-fun b!1096716 () Bool)

(declare-fun res!732008 () Bool)

(assert (=> b!1096716 (=> (not res!732008) (not e!625968))))

(assert (=> b!1096716 (= res!732008 (= (select (arr!34174 _keys!1070) i!650) k0!904))))

(declare-fun b!1096717 () Bool)

(declare-fun res!732007 () Bool)

(assert (=> b!1096717 (=> (not res!732007) (not e!625968))))

(assert (=> b!1096717 (= res!732007 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34712 _keys!1070))))))

(declare-fun b!1096718 () Bool)

(assert (=> b!1096718 (= e!625968 e!625971)))

(declare-fun res!732003 () Bool)

(assert (=> b!1096718 (=> (not res!732003) (not e!625971))))

(assert (=> b!1096718 (= res!732003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490082 mask!1414))))

(assert (=> b!1096718 (= lt!490082 (array!71005 (store (arr!34174 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34712 _keys!1070)))))

(declare-fun b!1096719 () Bool)

(declare-fun res!732004 () Bool)

(assert (=> b!1096719 (=> (not res!732004) (not e!625968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096719 (= res!732004 (validKeyInArray!0 k0!904))))

(declare-fun b!1096720 () Bool)

(assert (=> b!1096720 (= e!625969 tp_is_empty!27091)))

(declare-fun b!1096721 () Bool)

(declare-fun res!732010 () Bool)

(assert (=> b!1096721 (=> (not res!732010) (not e!625968))))

(declare-datatypes ((List!23931 0))(
  ( (Nil!23928) (Cons!23927 (h!25136 (_ BitVec 64)) (t!34009 List!23931)) )
))
(declare-fun arrayNoDuplicates!0 (array!71004 (_ BitVec 32) List!23931) Bool)

(assert (=> b!1096721 (= res!732010 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23928))))

(declare-fun b!1096722 () Bool)

(declare-fun res!732005 () Bool)

(assert (=> b!1096722 (=> (not res!732005) (not e!625971))))

(assert (=> b!1096722 (= res!732005 (arrayNoDuplicates!0 lt!490082 #b00000000000000000000000000000000 Nil!23928))))

(declare-fun mapNonEmpty!42397 () Bool)

(declare-fun tp!81049 () Bool)

(assert (=> mapNonEmpty!42397 (= mapRes!42397 (and tp!81049 e!625972))))

(declare-fun mapValue!42397 () ValueCell!12836)

(declare-fun mapKey!42397 () (_ BitVec 32))

(declare-fun mapRest!42397 () (Array (_ BitVec 32) ValueCell!12836))

(assert (=> mapNonEmpty!42397 (= (arr!34175 _values!874) (store mapRest!42397 mapKey!42397 mapValue!42397))))

(assert (= (and start!96456 res!732002) b!1096714))

(assert (= (and b!1096714 res!732006) b!1096711))

(assert (= (and b!1096711 res!732009) b!1096721))

(assert (= (and b!1096721 res!732010) b!1096717))

(assert (= (and b!1096717 res!732007) b!1096719))

(assert (= (and b!1096719 res!732004) b!1096716))

(assert (= (and b!1096716 res!732008) b!1096718))

(assert (= (and b!1096718 res!732003) b!1096722))

(assert (= (and b!1096722 res!732005) b!1096712))

(assert (= (and b!1096715 condMapEmpty!42397) mapIsEmpty!42397))

(assert (= (and b!1096715 (not condMapEmpty!42397)) mapNonEmpty!42397))

(get-info :version)

(assert (= (and mapNonEmpty!42397 ((_ is ValueCellFull!12836) mapValue!42397)) b!1096713))

(assert (= (and b!1096715 ((_ is ValueCellFull!12836) mapDefault!42397)) b!1096720))

(assert (= start!96456 b!1096715))

(declare-fun b_lambda!17677 () Bool)

(assert (=> (not b_lambda!17677) (not b!1096712)))

(declare-fun t!34007 () Bool)

(declare-fun tb!7899 () Bool)

(assert (=> (and start!96456 (= defaultEntry!882 defaultEntry!882) t!34007) tb!7899))

(declare-fun result!16329 () Bool)

(assert (=> tb!7899 (= result!16329 tp_is_empty!27091)))

(assert (=> b!1096712 t!34007))

(declare-fun b_and!36721 () Bool)

(assert (= b_and!36719 (and (=> t!34007 result!16329) b_and!36721)))

(declare-fun m!1015725 () Bool)

(assert (=> b!1096719 m!1015725))

(declare-fun m!1015727 () Bool)

(assert (=> b!1096722 m!1015727))

(declare-fun m!1015729 () Bool)

(assert (=> b!1096711 m!1015729))

(declare-fun m!1015731 () Bool)

(assert (=> b!1096718 m!1015731))

(declare-fun m!1015733 () Bool)

(assert (=> b!1096718 m!1015733))

(declare-fun m!1015735 () Bool)

(assert (=> b!1096712 m!1015735))

(declare-fun m!1015737 () Bool)

(assert (=> b!1096712 m!1015737))

(declare-fun m!1015739 () Bool)

(assert (=> b!1096712 m!1015739))

(declare-fun m!1015741 () Bool)

(assert (=> b!1096712 m!1015741))

(declare-fun m!1015743 () Bool)

(assert (=> b!1096712 m!1015743))

(declare-fun m!1015745 () Bool)

(assert (=> b!1096712 m!1015745))

(declare-fun m!1015747 () Bool)

(assert (=> b!1096716 m!1015747))

(declare-fun m!1015749 () Bool)

(assert (=> start!96456 m!1015749))

(declare-fun m!1015751 () Bool)

(assert (=> start!96456 m!1015751))

(declare-fun m!1015753 () Bool)

(assert (=> start!96456 m!1015753))

(declare-fun m!1015755 () Bool)

(assert (=> b!1096721 m!1015755))

(declare-fun m!1015757 () Bool)

(assert (=> mapNonEmpty!42397 m!1015757))

(check-sat (not b!1096711) (not b!1096722) b_and!36721 (not b_next!23041) (not b!1096712) (not b!1096721) (not start!96456) (not b!1096719) (not mapNonEmpty!42397) tp_is_empty!27091 (not b!1096718) (not b_lambda!17677))
(check-sat b_and!36721 (not b_next!23041))
