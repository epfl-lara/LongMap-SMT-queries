; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96662 () Bool)

(assert start!96662)

(declare-fun b_free!23005 () Bool)

(declare-fun b_next!23005 () Bool)

(assert (=> start!96662 (= b_free!23005 (not b_next!23005))))

(declare-fun tp!80942 () Bool)

(declare-fun b_and!36683 () Bool)

(assert (=> start!96662 (= tp!80942 b_and!36683)))

(declare-fun b!1097507 () Bool)

(declare-fun res!732110 () Bool)

(declare-fun e!626592 () Bool)

(assert (=> b!1097507 (=> (not res!732110) (not e!626592))))

(declare-datatypes ((array!71051 0))(
  ( (array!71052 (arr!34191 (Array (_ BitVec 32) (_ BitVec 64))) (size!34728 (_ BitVec 32))) )
))
(declare-fun lt!490582 () array!71051)

(declare-datatypes ((List!23881 0))(
  ( (Nil!23878) (Cons!23877 (h!25095 (_ BitVec 64)) (t!33924 List!23881)) )
))
(declare-fun arrayNoDuplicates!0 (array!71051 (_ BitVec 32) List!23881) Bool)

(assert (=> b!1097507 (= res!732110 (arrayNoDuplicates!0 lt!490582 #b00000000000000000000000000000000 Nil!23878))))

(declare-fun res!732111 () Bool)

(declare-fun e!626591 () Bool)

(assert (=> start!96662 (=> (not res!732111) (not e!626591))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96662 (= res!732111 (validMask!0 mask!1414))))

(assert (=> start!96662 e!626591))

(assert (=> start!96662 tp!80942))

(assert (=> start!96662 true))

(declare-fun tp_is_empty!27055 () Bool)

(assert (=> start!96662 tp_is_empty!27055))

(declare-fun _keys!1070 () array!71051)

(declare-fun array_inv!26376 (array!71051) Bool)

(assert (=> start!96662 (array_inv!26376 _keys!1070)))

(declare-datatypes ((V!41201 0))(
  ( (V!41202 (val!13584 Int)) )
))
(declare-datatypes ((ValueCell!12818 0))(
  ( (ValueCellFull!12818 (v!16201 V!41201)) (EmptyCell!12818) )
))
(declare-datatypes ((array!71053 0))(
  ( (array!71054 (arr!34192 (Array (_ BitVec 32) ValueCell!12818)) (size!34729 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71053)

(declare-fun e!626594 () Bool)

(declare-fun array_inv!26377 (array!71053) Bool)

(assert (=> start!96662 (and (array_inv!26377 _values!874) e!626594)))

(declare-fun b!1097508 () Bool)

(declare-fun res!732112 () Bool)

(assert (=> b!1097508 (=> (not res!732112) (not e!626591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71051 (_ BitVec 32)) Bool)

(assert (=> b!1097508 (= res!732112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097509 () Bool)

(declare-fun e!626595 () Bool)

(assert (=> b!1097509 (= e!626595 tp_is_empty!27055)))

(declare-fun b!1097510 () Bool)

(declare-fun res!732108 () Bool)

(assert (=> b!1097510 (=> (not res!732108) (not e!626591))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097510 (= res!732108 (validKeyInArray!0 k0!904))))

(declare-fun b!1097511 () Bool)

(assert (=> b!1097511 (= e!626591 e!626592)))

(declare-fun res!732109 () Bool)

(assert (=> b!1097511 (=> (not res!732109) (not e!626592))))

(assert (=> b!1097511 (= res!732109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490582 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097511 (= lt!490582 (array!71052 (store (arr!34191 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34728 _keys!1070)))))

(declare-fun b!1097512 () Bool)

(declare-fun res!732113 () Bool)

(assert (=> b!1097512 (=> (not res!732113) (not e!626591))))

(assert (=> b!1097512 (= res!732113 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34728 _keys!1070))))))

(declare-fun b!1097513 () Bool)

(assert (=> b!1097513 (= e!626592 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41201)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17260 0))(
  ( (tuple2!17261 (_1!8641 (_ BitVec 64)) (_2!8641 V!41201)) )
))
(declare-datatypes ((List!23882 0))(
  ( (Nil!23879) (Cons!23878 (h!25096 tuple2!17260) (t!33925 List!23882)) )
))
(declare-datatypes ((ListLongMap!15237 0))(
  ( (ListLongMap!15238 (toList!7634 List!23882)) )
))
(declare-fun lt!490584 () ListLongMap!15237)

(declare-fun zeroValue!831 () V!41201)

(declare-fun getCurrentListMapNoExtraKeys!4187 (array!71051 array!71053 (_ BitVec 32) (_ BitVec 32) V!41201 V!41201 (_ BitVec 32) Int) ListLongMap!15237)

(declare-fun dynLambda!2305 (Int (_ BitVec 64)) V!41201)

(assert (=> b!1097513 (= lt!490584 (getCurrentListMapNoExtraKeys!4187 lt!490582 (array!71054 (store (arr!34192 _values!874) i!650 (ValueCellFull!12818 (dynLambda!2305 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34729 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490581 () ListLongMap!15237)

(assert (=> b!1097513 (= lt!490581 (getCurrentListMapNoExtraKeys!4187 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097513 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36055 0))(
  ( (Unit!36056) )
))
(declare-fun lt!490583 () Unit!36055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71051 (_ BitVec 64) (_ BitVec 32)) Unit!36055)

(assert (=> b!1097513 (= lt!490583 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42343 () Bool)

(declare-fun mapRes!42343 () Bool)

(assert (=> mapIsEmpty!42343 mapRes!42343))

(declare-fun b!1097514 () Bool)

(declare-fun res!732114 () Bool)

(assert (=> b!1097514 (=> (not res!732114) (not e!626591))))

(assert (=> b!1097514 (= res!732114 (= (select (arr!34191 _keys!1070) i!650) k0!904))))

(declare-fun b!1097515 () Bool)

(declare-fun res!732107 () Bool)

(assert (=> b!1097515 (=> (not res!732107) (not e!626591))))

(assert (=> b!1097515 (= res!732107 (and (= (size!34729 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34728 _keys!1070) (size!34729 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097516 () Bool)

(declare-fun res!732115 () Bool)

(assert (=> b!1097516 (=> (not res!732115) (not e!626591))))

(assert (=> b!1097516 (= res!732115 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23878))))

(declare-fun mapNonEmpty!42343 () Bool)

(declare-fun tp!80941 () Bool)

(assert (=> mapNonEmpty!42343 (= mapRes!42343 (and tp!80941 e!626595))))

(declare-fun mapRest!42343 () (Array (_ BitVec 32) ValueCell!12818))

(declare-fun mapValue!42343 () ValueCell!12818)

(declare-fun mapKey!42343 () (_ BitVec 32))

(assert (=> mapNonEmpty!42343 (= (arr!34192 _values!874) (store mapRest!42343 mapKey!42343 mapValue!42343))))

(declare-fun b!1097517 () Bool)

(declare-fun e!626593 () Bool)

(assert (=> b!1097517 (= e!626593 tp_is_empty!27055)))

(declare-fun b!1097518 () Bool)

(assert (=> b!1097518 (= e!626594 (and e!626593 mapRes!42343))))

(declare-fun condMapEmpty!42343 () Bool)

(declare-fun mapDefault!42343 () ValueCell!12818)

(assert (=> b!1097518 (= condMapEmpty!42343 (= (arr!34192 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12818)) mapDefault!42343)))))

(assert (= (and start!96662 res!732111) b!1097515))

(assert (= (and b!1097515 res!732107) b!1097508))

(assert (= (and b!1097508 res!732112) b!1097516))

(assert (= (and b!1097516 res!732115) b!1097512))

(assert (= (and b!1097512 res!732113) b!1097510))

(assert (= (and b!1097510 res!732108) b!1097514))

(assert (= (and b!1097514 res!732114) b!1097511))

(assert (= (and b!1097511 res!732109) b!1097507))

(assert (= (and b!1097507 res!732110) b!1097513))

(assert (= (and b!1097518 condMapEmpty!42343) mapIsEmpty!42343))

(assert (= (and b!1097518 (not condMapEmpty!42343)) mapNonEmpty!42343))

(get-info :version)

(assert (= (and mapNonEmpty!42343 ((_ is ValueCellFull!12818) mapValue!42343)) b!1097509))

(assert (= (and b!1097518 ((_ is ValueCellFull!12818) mapDefault!42343)) b!1097517))

(assert (= start!96662 b!1097518))

(declare-fun b_lambda!17673 () Bool)

(assert (=> (not b_lambda!17673) (not b!1097513)))

(declare-fun t!33923 () Bool)

(declare-fun tb!7863 () Bool)

(assert (=> (and start!96662 (= defaultEntry!882 defaultEntry!882) t!33923) tb!7863))

(declare-fun result!16257 () Bool)

(assert (=> tb!7863 (= result!16257 tp_is_empty!27055)))

(assert (=> b!1097513 t!33923))

(declare-fun b_and!36685 () Bool)

(assert (= b_and!36683 (and (=> t!33923 result!16257) b_and!36685)))

(declare-fun m!1017411 () Bool)

(assert (=> start!96662 m!1017411))

(declare-fun m!1017413 () Bool)

(assert (=> start!96662 m!1017413))

(declare-fun m!1017415 () Bool)

(assert (=> start!96662 m!1017415))

(declare-fun m!1017417 () Bool)

(assert (=> b!1097510 m!1017417))

(declare-fun m!1017419 () Bool)

(assert (=> b!1097511 m!1017419))

(declare-fun m!1017421 () Bool)

(assert (=> b!1097511 m!1017421))

(declare-fun m!1017423 () Bool)

(assert (=> b!1097508 m!1017423))

(declare-fun m!1017425 () Bool)

(assert (=> b!1097514 m!1017425))

(declare-fun m!1017427 () Bool)

(assert (=> b!1097516 m!1017427))

(declare-fun m!1017429 () Bool)

(assert (=> b!1097507 m!1017429))

(declare-fun m!1017431 () Bool)

(assert (=> b!1097513 m!1017431))

(declare-fun m!1017433 () Bool)

(assert (=> b!1097513 m!1017433))

(declare-fun m!1017435 () Bool)

(assert (=> b!1097513 m!1017435))

(declare-fun m!1017437 () Bool)

(assert (=> b!1097513 m!1017437))

(declare-fun m!1017439 () Bool)

(assert (=> b!1097513 m!1017439))

(declare-fun m!1017441 () Bool)

(assert (=> b!1097513 m!1017441))

(declare-fun m!1017443 () Bool)

(assert (=> mapNonEmpty!42343 m!1017443))

(check-sat tp_is_empty!27055 (not b_next!23005) (not b!1097511) (not mapNonEmpty!42343) (not b!1097513) (not b_lambda!17673) (not b!1097516) (not b!1097507) (not b!1097510) (not b!1097508) b_and!36685 (not start!96662))
(check-sat b_and!36685 (not b_next!23005))
