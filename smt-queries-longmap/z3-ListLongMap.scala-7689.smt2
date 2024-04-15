; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96474 () Bool)

(assert start!96474)

(declare-fun b_free!23059 () Bool)

(declare-fun b_next!23059 () Bool)

(assert (=> start!96474 (= b_free!23059 (not b_next!23059))))

(declare-fun tp!81103 () Bool)

(declare-fun b_and!36755 () Bool)

(assert (=> start!96474 (= tp!81103 b_and!36755)))

(declare-fun b!1097053 () Bool)

(declare-fun res!732246 () Bool)

(declare-fun e!626134 () Bool)

(assert (=> b!1097053 (=> (not res!732246) (not e!626134))))

(declare-datatypes ((array!71038 0))(
  ( (array!71039 (arr!34191 (Array (_ BitVec 32) (_ BitVec 64))) (size!34729 (_ BitVec 32))) )
))
(declare-fun lt!490234 () array!71038)

(declare-datatypes ((List!23944 0))(
  ( (Nil!23941) (Cons!23940 (h!25149 (_ BitVec 64)) (t!34040 List!23944)) )
))
(declare-fun arrayNoDuplicates!0 (array!71038 (_ BitVec 32) List!23944) Bool)

(assert (=> b!1097053 (= res!732246 (arrayNoDuplicates!0 lt!490234 #b00000000000000000000000000000000 Nil!23941))))

(declare-fun b!1097054 () Bool)

(declare-fun res!732253 () Bool)

(declare-fun e!626130 () Bool)

(assert (=> b!1097054 (=> (not res!732253) (not e!626130))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097054 (= res!732253 (validKeyInArray!0 k0!904))))

(declare-fun b!1097055 () Bool)

(declare-fun res!732245 () Bool)

(assert (=> b!1097055 (=> (not res!732245) (not e!626130))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!71038)

(declare-datatypes ((V!41273 0))(
  ( (V!41274 (val!13611 Int)) )
))
(declare-datatypes ((ValueCell!12845 0))(
  ( (ValueCellFull!12845 (v!16231 V!41273)) (EmptyCell!12845) )
))
(declare-datatypes ((array!71040 0))(
  ( (array!71041 (arr!34192 (Array (_ BitVec 32) ValueCell!12845)) (size!34730 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71040)

(assert (=> b!1097055 (= res!732245 (and (= (size!34730 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34729 _keys!1070) (size!34730 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097056 () Bool)

(declare-fun e!626133 () Bool)

(declare-fun tp_is_empty!27109 () Bool)

(assert (=> b!1097056 (= e!626133 tp_is_empty!27109)))

(declare-fun mapIsEmpty!42424 () Bool)

(declare-fun mapRes!42424 () Bool)

(assert (=> mapIsEmpty!42424 mapRes!42424))

(declare-fun b!1097057 () Bool)

(declare-fun res!732251 () Bool)

(assert (=> b!1097057 (=> (not res!732251) (not e!626130))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097057 (= res!732251 (= (select (arr!34191 _keys!1070) i!650) k0!904))))

(declare-fun b!1097058 () Bool)

(declare-fun res!732250 () Bool)

(assert (=> b!1097058 (=> (not res!732250) (not e!626130))))

(assert (=> b!1097058 (= res!732250 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34729 _keys!1070))))))

(declare-fun res!732249 () Bool)

(assert (=> start!96474 (=> (not res!732249) (not e!626130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96474 (= res!732249 (validMask!0 mask!1414))))

(assert (=> start!96474 e!626130))

(assert (=> start!96474 tp!81103))

(assert (=> start!96474 true))

(assert (=> start!96474 tp_is_empty!27109))

(declare-fun array_inv!26378 (array!71038) Bool)

(assert (=> start!96474 (array_inv!26378 _keys!1070)))

(declare-fun e!626131 () Bool)

(declare-fun array_inv!26379 (array!71040) Bool)

(assert (=> start!96474 (and (array_inv!26379 _values!874) e!626131)))

(declare-fun b!1097059 () Bool)

(declare-fun res!732252 () Bool)

(assert (=> b!1097059 (=> (not res!732252) (not e!626130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71038 (_ BitVec 32)) Bool)

(assert (=> b!1097059 (= res!732252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097060 () Bool)

(assert (=> b!1097060 (= e!626130 e!626134)))

(declare-fun res!732248 () Bool)

(assert (=> b!1097060 (=> (not res!732248) (not e!626134))))

(assert (=> b!1097060 (= res!732248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490234 mask!1414))))

(assert (=> b!1097060 (= lt!490234 (array!71039 (store (arr!34191 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34729 _keys!1070)))))

(declare-fun mapNonEmpty!42424 () Bool)

(declare-fun tp!81104 () Bool)

(assert (=> mapNonEmpty!42424 (= mapRes!42424 (and tp!81104 e!626133))))

(declare-fun mapRest!42424 () (Array (_ BitVec 32) ValueCell!12845))

(declare-fun mapKey!42424 () (_ BitVec 32))

(declare-fun mapValue!42424 () ValueCell!12845)

(assert (=> mapNonEmpty!42424 (= (arr!34192 _values!874) (store mapRest!42424 mapKey!42424 mapValue!42424))))

(declare-fun b!1097061 () Bool)

(assert (=> b!1097061 (= e!626134 (not (bvslt i!650 (size!34730 _values!874))))))

(declare-datatypes ((tuple2!17350 0))(
  ( (tuple2!17351 (_1!8686 (_ BitVec 64)) (_2!8686 V!41273)) )
))
(declare-datatypes ((List!23945 0))(
  ( (Nil!23942) (Cons!23941 (h!25150 tuple2!17350) (t!34041 List!23945)) )
))
(declare-datatypes ((ListLongMap!15319 0))(
  ( (ListLongMap!15320 (toList!7675 List!23945)) )
))
(declare-fun lt!490231 () ListLongMap!15319)

(declare-fun lt!490232 () ListLongMap!15319)

(assert (=> b!1097061 (and (= lt!490231 lt!490232) (= lt!490232 lt!490231))))

(declare-fun lt!490230 () ListLongMap!15319)

(declare-fun -!915 (ListLongMap!15319 (_ BitVec 64)) ListLongMap!15319)

(assert (=> b!1097061 (= lt!490232 (-!915 lt!490230 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41273)

(declare-fun zeroValue!831 () V!41273)

(declare-datatypes ((Unit!35937 0))(
  ( (Unit!35938) )
))
(declare-fun lt!490233 () Unit!35937)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!190 (array!71038 array!71040 (_ BitVec 32) (_ BitVec 32) V!41273 V!41273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35937)

(assert (=> b!1097061 (= lt!490233 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!190 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4208 (array!71038 array!71040 (_ BitVec 32) (_ BitVec 32) V!41273 V!41273 (_ BitVec 32) Int) ListLongMap!15319)

(declare-fun dynLambda!2277 (Int (_ BitVec 64)) V!41273)

(assert (=> b!1097061 (= lt!490231 (getCurrentListMapNoExtraKeys!4208 lt!490234 (array!71041 (store (arr!34192 _values!874) i!650 (ValueCellFull!12845 (dynLambda!2277 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34730 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097061 (= lt!490230 (getCurrentListMapNoExtraKeys!4208 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097061 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490235 () Unit!35937)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71038 (_ BitVec 64) (_ BitVec 32)) Unit!35937)

(assert (=> b!1097061 (= lt!490235 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097062 () Bool)

(declare-fun e!626129 () Bool)

(assert (=> b!1097062 (= e!626131 (and e!626129 mapRes!42424))))

(declare-fun condMapEmpty!42424 () Bool)

(declare-fun mapDefault!42424 () ValueCell!12845)

(assert (=> b!1097062 (= condMapEmpty!42424 (= (arr!34192 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12845)) mapDefault!42424)))))

(declare-fun b!1097063 () Bool)

(assert (=> b!1097063 (= e!626129 tp_is_empty!27109)))

(declare-fun b!1097064 () Bool)

(declare-fun res!732247 () Bool)

(assert (=> b!1097064 (=> (not res!732247) (not e!626130))))

(assert (=> b!1097064 (= res!732247 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23941))))

(assert (= (and start!96474 res!732249) b!1097055))

(assert (= (and b!1097055 res!732245) b!1097059))

(assert (= (and b!1097059 res!732252) b!1097064))

(assert (= (and b!1097064 res!732247) b!1097058))

(assert (= (and b!1097058 res!732250) b!1097054))

(assert (= (and b!1097054 res!732253) b!1097057))

(assert (= (and b!1097057 res!732251) b!1097060))

(assert (= (and b!1097060 res!732248) b!1097053))

(assert (= (and b!1097053 res!732246) b!1097061))

(assert (= (and b!1097062 condMapEmpty!42424) mapIsEmpty!42424))

(assert (= (and b!1097062 (not condMapEmpty!42424)) mapNonEmpty!42424))

(get-info :version)

(assert (= (and mapNonEmpty!42424 ((_ is ValueCellFull!12845) mapValue!42424)) b!1097056))

(assert (= (and b!1097062 ((_ is ValueCellFull!12845) mapDefault!42424)) b!1097063))

(assert (= start!96474 b!1097062))

(declare-fun b_lambda!17695 () Bool)

(assert (=> (not b_lambda!17695) (not b!1097061)))

(declare-fun t!34039 () Bool)

(declare-fun tb!7917 () Bool)

(assert (=> (and start!96474 (= defaultEntry!882 defaultEntry!882) t!34039) tb!7917))

(declare-fun result!16365 () Bool)

(assert (=> tb!7917 (= result!16365 tp_is_empty!27109)))

(assert (=> b!1097061 t!34039))

(declare-fun b_and!36757 () Bool)

(assert (= b_and!36755 (and (=> t!34039 result!16365) b_and!36757)))

(declare-fun m!1016055 () Bool)

(assert (=> b!1097061 m!1016055))

(declare-fun m!1016057 () Bool)

(assert (=> b!1097061 m!1016057))

(declare-fun m!1016059 () Bool)

(assert (=> b!1097061 m!1016059))

(declare-fun m!1016061 () Bool)

(assert (=> b!1097061 m!1016061))

(declare-fun m!1016063 () Bool)

(assert (=> b!1097061 m!1016063))

(declare-fun m!1016065 () Bool)

(assert (=> b!1097061 m!1016065))

(declare-fun m!1016067 () Bool)

(assert (=> b!1097061 m!1016067))

(declare-fun m!1016069 () Bool)

(assert (=> b!1097061 m!1016069))

(declare-fun m!1016071 () Bool)

(assert (=> b!1097054 m!1016071))

(declare-fun m!1016073 () Bool)

(assert (=> b!1097053 m!1016073))

(declare-fun m!1016075 () Bool)

(assert (=> b!1097059 m!1016075))

(declare-fun m!1016077 () Bool)

(assert (=> b!1097057 m!1016077))

(declare-fun m!1016079 () Bool)

(assert (=> mapNonEmpty!42424 m!1016079))

(declare-fun m!1016081 () Bool)

(assert (=> b!1097064 m!1016081))

(declare-fun m!1016083 () Bool)

(assert (=> start!96474 m!1016083))

(declare-fun m!1016085 () Bool)

(assert (=> start!96474 m!1016085))

(declare-fun m!1016087 () Bool)

(assert (=> start!96474 m!1016087))

(declare-fun m!1016089 () Bool)

(assert (=> b!1097060 m!1016089))

(declare-fun m!1016091 () Bool)

(assert (=> b!1097060 m!1016091))

(check-sat (not b!1097061) (not b!1097059) b_and!36757 (not b_next!23059) tp_is_empty!27109 (not start!96474) (not b!1097060) (not b!1097054) (not b_lambda!17695) (not b!1097053) (not mapNonEmpty!42424) (not b!1097064))
(check-sat b_and!36757 (not b_next!23059))
