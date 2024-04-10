; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96476 () Bool)

(assert start!96476)

(declare-fun b_free!23055 () Bool)

(declare-fun b_next!23055 () Bool)

(assert (=> start!96476 (= b_free!23055 (not b_next!23055))))

(declare-fun tp!81092 () Bool)

(declare-fun b_and!36773 () Bool)

(assert (=> start!96476 (= tp!81092 b_and!36773)))

(declare-fun b!1097130 () Bool)

(declare-fun e!626186 () Bool)

(declare-fun e!626187 () Bool)

(assert (=> b!1097130 (= e!626186 e!626187)))

(declare-fun res!732264 () Bool)

(assert (=> b!1097130 (=> (not res!732264) (not e!626187))))

(declare-datatypes ((array!71121 0))(
  ( (array!71122 (arr!34232 (Array (_ BitVec 32) (_ BitVec 64))) (size!34768 (_ BitVec 32))) )
))
(declare-fun lt!490396 () array!71121)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71121 (_ BitVec 32)) Bool)

(assert (=> b!1097130 (= res!732264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490396 mask!1414))))

(declare-fun _keys!1070 () array!71121)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097130 (= lt!490396 (array!71122 (store (arr!34232 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34768 _keys!1070)))))

(declare-fun b!1097131 () Bool)

(declare-fun res!732266 () Bool)

(assert (=> b!1097131 (=> (not res!732266) (not e!626186))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097131 (= res!732266 (validKeyInArray!0 k0!904))))

(declare-fun b!1097132 () Bool)

(declare-fun e!626190 () Bool)

(declare-fun tp_is_empty!27105 () Bool)

(assert (=> b!1097132 (= e!626190 tp_is_empty!27105)))

(declare-fun b!1097133 () Bool)

(declare-fun e!626188 () Bool)

(declare-fun e!626191 () Bool)

(declare-fun mapRes!42418 () Bool)

(assert (=> b!1097133 (= e!626188 (and e!626191 mapRes!42418))))

(declare-fun condMapEmpty!42418 () Bool)

(declare-datatypes ((V!41267 0))(
  ( (V!41268 (val!13609 Int)) )
))
(declare-datatypes ((ValueCell!12843 0))(
  ( (ValueCellFull!12843 (v!16230 V!41267)) (EmptyCell!12843) )
))
(declare-datatypes ((array!71123 0))(
  ( (array!71124 (arr!34233 (Array (_ BitVec 32) ValueCell!12843)) (size!34769 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71123)

(declare-fun mapDefault!42418 () ValueCell!12843)

(assert (=> b!1097133 (= condMapEmpty!42418 (= (arr!34233 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12843)) mapDefault!42418)))))

(declare-fun b!1097134 () Bool)

(declare-fun res!732261 () Bool)

(assert (=> b!1097134 (=> (not res!732261) (not e!626186))))

(assert (=> b!1097134 (= res!732261 (= (select (arr!34232 _keys!1070) i!650) k0!904))))

(declare-fun b!1097135 () Bool)

(declare-fun res!732268 () Bool)

(assert (=> b!1097135 (=> (not res!732268) (not e!626186))))

(assert (=> b!1097135 (= res!732268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!732263 () Bool)

(assert (=> start!96476 (=> (not res!732263) (not e!626186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96476 (= res!732263 (validMask!0 mask!1414))))

(assert (=> start!96476 e!626186))

(assert (=> start!96476 tp!81092))

(assert (=> start!96476 true))

(assert (=> start!96476 tp_is_empty!27105))

(declare-fun array_inv!26374 (array!71121) Bool)

(assert (=> start!96476 (array_inv!26374 _keys!1070)))

(declare-fun array_inv!26375 (array!71123) Bool)

(assert (=> start!96476 (and (array_inv!26375 _values!874) e!626188)))

(declare-fun b!1097136 () Bool)

(declare-fun res!732267 () Bool)

(assert (=> b!1097136 (=> (not res!732267) (not e!626186))))

(declare-datatypes ((List!23906 0))(
  ( (Nil!23903) (Cons!23902 (h!25111 (_ BitVec 64)) (t!34007 List!23906)) )
))
(declare-fun arrayNoDuplicates!0 (array!71121 (_ BitVec 32) List!23906) Bool)

(assert (=> b!1097136 (= res!732267 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23903))))

(declare-fun b!1097137 () Bool)

(declare-fun res!732265 () Bool)

(assert (=> b!1097137 (=> (not res!732265) (not e!626186))))

(assert (=> b!1097137 (= res!732265 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34768 _keys!1070))))))

(declare-fun b!1097138 () Bool)

(declare-fun res!732262 () Bool)

(assert (=> b!1097138 (=> (not res!732262) (not e!626186))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097138 (= res!732262 (and (= (size!34769 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34768 _keys!1070) (size!34769 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097139 () Bool)

(assert (=> b!1097139 (= e!626187 (not true))))

(declare-datatypes ((tuple2!17284 0))(
  ( (tuple2!17285 (_1!8653 (_ BitVec 64)) (_2!8653 V!41267)) )
))
(declare-datatypes ((List!23907 0))(
  ( (Nil!23904) (Cons!23903 (h!25112 tuple2!17284) (t!34008 List!23907)) )
))
(declare-datatypes ((ListLongMap!15253 0))(
  ( (ListLongMap!15254 (toList!7642 List!23907)) )
))
(declare-fun lt!490398 () ListLongMap!15253)

(declare-fun lt!490399 () ListLongMap!15253)

(assert (=> b!1097139 (and (= lt!490398 lt!490399) (= lt!490399 lt!490398))))

(declare-fun lt!490395 () ListLongMap!15253)

(declare-fun -!932 (ListLongMap!15253 (_ BitVec 64)) ListLongMap!15253)

(assert (=> b!1097139 (= lt!490399 (-!932 lt!490395 k0!904))))

(declare-datatypes ((Unit!36096 0))(
  ( (Unit!36097) )
))
(declare-fun lt!490397 () Unit!36096)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41267)

(declare-fun zeroValue!831 () V!41267)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!188 (array!71121 array!71123 (_ BitVec 32) (_ BitVec 32) V!41267 V!41267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36096)

(assert (=> b!1097139 (= lt!490397 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4158 (array!71121 array!71123 (_ BitVec 32) (_ BitVec 32) V!41267 V!41267 (_ BitVec 32) Int) ListLongMap!15253)

(declare-fun dynLambda!2293 (Int (_ BitVec 64)) V!41267)

(assert (=> b!1097139 (= lt!490398 (getCurrentListMapNoExtraKeys!4158 lt!490396 (array!71124 (store (arr!34233 _values!874) i!650 (ValueCellFull!12843 (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34769 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097139 (= lt!490395 (getCurrentListMapNoExtraKeys!4158 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097139 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490394 () Unit!36096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71121 (_ BitVec 64) (_ BitVec 32)) Unit!36096)

(assert (=> b!1097139 (= lt!490394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42418 () Bool)

(declare-fun tp!81091 () Bool)

(assert (=> mapNonEmpty!42418 (= mapRes!42418 (and tp!81091 e!626190))))

(declare-fun mapRest!42418 () (Array (_ BitVec 32) ValueCell!12843))

(declare-fun mapValue!42418 () ValueCell!12843)

(declare-fun mapKey!42418 () (_ BitVec 32))

(assert (=> mapNonEmpty!42418 (= (arr!34233 _values!874) (store mapRest!42418 mapKey!42418 mapValue!42418))))

(declare-fun b!1097140 () Bool)

(declare-fun res!732260 () Bool)

(assert (=> b!1097140 (=> (not res!732260) (not e!626187))))

(assert (=> b!1097140 (= res!732260 (arrayNoDuplicates!0 lt!490396 #b00000000000000000000000000000000 Nil!23903))))

(declare-fun b!1097141 () Bool)

(assert (=> b!1097141 (= e!626191 tp_is_empty!27105)))

(declare-fun mapIsEmpty!42418 () Bool)

(assert (=> mapIsEmpty!42418 mapRes!42418))

(assert (= (and start!96476 res!732263) b!1097138))

(assert (= (and b!1097138 res!732262) b!1097135))

(assert (= (and b!1097135 res!732268) b!1097136))

(assert (= (and b!1097136 res!732267) b!1097137))

(assert (= (and b!1097137 res!732265) b!1097131))

(assert (= (and b!1097131 res!732266) b!1097134))

(assert (= (and b!1097134 res!732261) b!1097130))

(assert (= (and b!1097130 res!732264) b!1097140))

(assert (= (and b!1097140 res!732260) b!1097139))

(assert (= (and b!1097133 condMapEmpty!42418) mapIsEmpty!42418))

(assert (= (and b!1097133 (not condMapEmpty!42418)) mapNonEmpty!42418))

(get-info :version)

(assert (= (and mapNonEmpty!42418 ((_ is ValueCellFull!12843) mapValue!42418)) b!1097132))

(assert (= (and b!1097133 ((_ is ValueCellFull!12843) mapDefault!42418)) b!1097141))

(assert (= start!96476 b!1097133))

(declare-fun b_lambda!17713 () Bool)

(assert (=> (not b_lambda!17713) (not b!1097139)))

(declare-fun t!34006 () Bool)

(declare-fun tb!7921 () Bool)

(assert (=> (and start!96476 (= defaultEntry!882 defaultEntry!882) t!34006) tb!7921))

(declare-fun result!16365 () Bool)

(assert (=> tb!7921 (= result!16365 tp_is_empty!27105)))

(assert (=> b!1097139 t!34006))

(declare-fun b_and!36775 () Bool)

(assert (= b_and!36773 (and (=> t!34006 result!16365) b_and!36775)))

(declare-fun m!1016605 () Bool)

(assert (=> mapNonEmpty!42418 m!1016605))

(declare-fun m!1016607 () Bool)

(assert (=> b!1097139 m!1016607))

(declare-fun m!1016609 () Bool)

(assert (=> b!1097139 m!1016609))

(declare-fun m!1016611 () Bool)

(assert (=> b!1097139 m!1016611))

(declare-fun m!1016613 () Bool)

(assert (=> b!1097139 m!1016613))

(declare-fun m!1016615 () Bool)

(assert (=> b!1097139 m!1016615))

(declare-fun m!1016617 () Bool)

(assert (=> b!1097139 m!1016617))

(declare-fun m!1016619 () Bool)

(assert (=> b!1097139 m!1016619))

(declare-fun m!1016621 () Bool)

(assert (=> b!1097139 m!1016621))

(declare-fun m!1016623 () Bool)

(assert (=> b!1097131 m!1016623))

(declare-fun m!1016625 () Bool)

(assert (=> b!1097135 m!1016625))

(declare-fun m!1016627 () Bool)

(assert (=> b!1097134 m!1016627))

(declare-fun m!1016629 () Bool)

(assert (=> b!1097130 m!1016629))

(declare-fun m!1016631 () Bool)

(assert (=> b!1097130 m!1016631))

(declare-fun m!1016633 () Bool)

(assert (=> b!1097140 m!1016633))

(declare-fun m!1016635 () Bool)

(assert (=> b!1097136 m!1016635))

(declare-fun m!1016637 () Bool)

(assert (=> start!96476 m!1016637))

(declare-fun m!1016639 () Bool)

(assert (=> start!96476 m!1016639))

(declare-fun m!1016641 () Bool)

(assert (=> start!96476 m!1016641))

(check-sat (not b_next!23055) (not mapNonEmpty!42418) (not b!1097131) b_and!36775 (not b_lambda!17713) tp_is_empty!27105 (not b!1097135) (not b!1097136) (not start!96476) (not b!1097139) (not b!1097130) (not b!1097140))
(check-sat b_and!36775 (not b_next!23055))
