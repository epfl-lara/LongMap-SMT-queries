; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95664 () Bool)

(assert start!95664)

(declare-fun b_free!22317 () Bool)

(declare-fun b_next!22317 () Bool)

(assert (=> start!95664 (= b_free!22317 (not b_next!22317))))

(declare-fun tp!78799 () Bool)

(declare-fun b_and!35309 () Bool)

(assert (=> start!95664 (= tp!78799 b_and!35309)))

(declare-fun res!720679 () Bool)

(declare-fun e!618035 () Bool)

(assert (=> start!95664 (=> (not res!720679) (not e!618035))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95664 (= res!720679 (validMask!0 mask!1414))))

(assert (=> start!95664 e!618035))

(assert (=> start!95664 tp!78799))

(assert (=> start!95664 true))

(declare-fun tp_is_empty!26319 () Bool)

(assert (=> start!95664 tp_is_empty!26319))

(declare-datatypes ((array!69585 0))(
  ( (array!69586 (arr!33466 (Array (_ BitVec 32) (_ BitVec 64))) (size!34002 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69585)

(declare-fun array_inv!25836 (array!69585) Bool)

(assert (=> start!95664 (array_inv!25836 _keys!1070)))

(declare-datatypes ((V!40219 0))(
  ( (V!40220 (val!13216 Int)) )
))
(declare-datatypes ((ValueCell!12450 0))(
  ( (ValueCellFull!12450 (v!15837 V!40219)) (EmptyCell!12450) )
))
(declare-datatypes ((array!69587 0))(
  ( (array!69588 (arr!33467 (Array (_ BitVec 32) ValueCell!12450)) (size!34003 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69587)

(declare-fun e!618033 () Bool)

(declare-fun array_inv!25837 (array!69587) Bool)

(assert (=> start!95664 (and (array_inv!25837 _values!874) e!618033)))

(declare-fun b!1081235 () Bool)

(declare-fun res!720678 () Bool)

(assert (=> b!1081235 (=> (not res!720678) (not e!618035))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081235 (= res!720678 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41233 () Bool)

(declare-fun mapRes!41233 () Bool)

(declare-fun tp!78800 () Bool)

(declare-fun e!618032 () Bool)

(assert (=> mapNonEmpty!41233 (= mapRes!41233 (and tp!78800 e!618032))))

(declare-fun mapRest!41233 () (Array (_ BitVec 32) ValueCell!12450))

(declare-fun mapValue!41233 () ValueCell!12450)

(declare-fun mapKey!41233 () (_ BitVec 32))

(assert (=> mapNonEmpty!41233 (= (arr!33467 _values!874) (store mapRest!41233 mapKey!41233 mapValue!41233))))

(declare-fun b!1081236 () Bool)

(declare-fun res!720684 () Bool)

(assert (=> b!1081236 (=> (not res!720684) (not e!618035))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081236 (= res!720684 (= (select (arr!33466 _keys!1070) i!650) k0!904))))

(declare-fun b!1081237 () Bool)

(assert (=> b!1081237 (= e!618032 tp_is_empty!26319)))

(declare-fun b!1081238 () Bool)

(declare-fun e!618030 () Bool)

(assert (=> b!1081238 (= e!618033 (and e!618030 mapRes!41233))))

(declare-fun condMapEmpty!41233 () Bool)

(declare-fun mapDefault!41233 () ValueCell!12450)

(assert (=> b!1081238 (= condMapEmpty!41233 (= (arr!33467 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12450)) mapDefault!41233)))))

(declare-fun mapIsEmpty!41233 () Bool)

(assert (=> mapIsEmpty!41233 mapRes!41233))

(declare-fun b!1081239 () Bool)

(assert (=> b!1081239 (= e!618030 tp_is_empty!26319)))

(declare-fun b!1081240 () Bool)

(declare-fun res!720682 () Bool)

(declare-fun e!618034 () Bool)

(assert (=> b!1081240 (=> (not res!720682) (not e!618034))))

(declare-fun lt!479239 () array!69585)

(declare-datatypes ((List!23321 0))(
  ( (Nil!23318) (Cons!23317 (h!24526 (_ BitVec 64)) (t!32696 List!23321)) )
))
(declare-fun arrayNoDuplicates!0 (array!69585 (_ BitVec 32) List!23321) Bool)

(assert (=> b!1081240 (= res!720682 (arrayNoDuplicates!0 lt!479239 #b00000000000000000000000000000000 Nil!23318))))

(declare-fun b!1081241 () Bool)

(declare-fun res!720677 () Bool)

(assert (=> b!1081241 (=> (not res!720677) (not e!618035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69585 (_ BitVec 32)) Bool)

(assert (=> b!1081241 (= res!720677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081242 () Bool)

(assert (=> b!1081242 (= e!618034 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16742 0))(
  ( (tuple2!16743 (_1!8382 (_ BitVec 64)) (_2!8382 V!40219)) )
))
(declare-datatypes ((List!23322 0))(
  ( (Nil!23319) (Cons!23318 (h!24527 tuple2!16742) (t!32697 List!23322)) )
))
(declare-datatypes ((ListLongMap!14711 0))(
  ( (ListLongMap!14712 (toList!7371 List!23322)) )
))
(declare-fun lt!479237 () ListLongMap!14711)

(declare-fun minValue!831 () V!40219)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40219)

(declare-fun getCurrentListMapNoExtraKeys!3919 (array!69585 array!69587 (_ BitVec 32) (_ BitVec 32) V!40219 V!40219 (_ BitVec 32) Int) ListLongMap!14711)

(declare-fun dynLambda!2056 (Int (_ BitVec 64)) V!40219)

(assert (=> b!1081242 (= lt!479237 (getCurrentListMapNoExtraKeys!3919 lt!479239 (array!69588 (store (arr!33467 _values!874) i!650 (ValueCellFull!12450 (dynLambda!2056 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34003 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479238 () ListLongMap!14711)

(assert (=> b!1081242 (= lt!479238 (getCurrentListMapNoExtraKeys!3919 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081242 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35562 0))(
  ( (Unit!35563) )
))
(declare-fun lt!479236 () Unit!35562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69585 (_ BitVec 64) (_ BitVec 32)) Unit!35562)

(assert (=> b!1081242 (= lt!479236 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081243 () Bool)

(assert (=> b!1081243 (= e!618035 e!618034)))

(declare-fun res!720683 () Bool)

(assert (=> b!1081243 (=> (not res!720683) (not e!618034))))

(assert (=> b!1081243 (= res!720683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479239 mask!1414))))

(assert (=> b!1081243 (= lt!479239 (array!69586 (store (arr!33466 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34002 _keys!1070)))))

(declare-fun b!1081244 () Bool)

(declare-fun res!720676 () Bool)

(assert (=> b!1081244 (=> (not res!720676) (not e!618035))))

(assert (=> b!1081244 (= res!720676 (and (= (size!34003 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34002 _keys!1070) (size!34003 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081245 () Bool)

(declare-fun res!720681 () Bool)

(assert (=> b!1081245 (=> (not res!720681) (not e!618035))))

(assert (=> b!1081245 (= res!720681 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34002 _keys!1070))))))

(declare-fun b!1081246 () Bool)

(declare-fun res!720680 () Bool)

(assert (=> b!1081246 (=> (not res!720680) (not e!618035))))

(assert (=> b!1081246 (= res!720680 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23318))))

(assert (= (and start!95664 res!720679) b!1081244))

(assert (= (and b!1081244 res!720676) b!1081241))

(assert (= (and b!1081241 res!720677) b!1081246))

(assert (= (and b!1081246 res!720680) b!1081245))

(assert (= (and b!1081245 res!720681) b!1081235))

(assert (= (and b!1081235 res!720678) b!1081236))

(assert (= (and b!1081236 res!720684) b!1081243))

(assert (= (and b!1081243 res!720683) b!1081240))

(assert (= (and b!1081240 res!720682) b!1081242))

(assert (= (and b!1081238 condMapEmpty!41233) mapIsEmpty!41233))

(assert (= (and b!1081238 (not condMapEmpty!41233)) mapNonEmpty!41233))

(get-info :version)

(assert (= (and mapNonEmpty!41233 ((_ is ValueCellFull!12450) mapValue!41233)) b!1081237))

(assert (= (and b!1081238 ((_ is ValueCellFull!12450) mapDefault!41233)) b!1081239))

(assert (= start!95664 b!1081238))

(declare-fun b_lambda!16987 () Bool)

(assert (=> (not b_lambda!16987) (not b!1081242)))

(declare-fun t!32695 () Bool)

(declare-fun tb!7195 () Bool)

(assert (=> (and start!95664 (= defaultEntry!882 defaultEntry!882) t!32695) tb!7195))

(declare-fun result!14909 () Bool)

(assert (=> tb!7195 (= result!14909 tp_is_empty!26319)))

(assert (=> b!1081242 t!32695))

(declare-fun b_and!35311 () Bool)

(assert (= b_and!35309 (and (=> t!32695 result!14909) b_and!35311)))

(declare-fun m!999047 () Bool)

(assert (=> b!1081236 m!999047))

(declare-fun m!999049 () Bool)

(assert (=> b!1081243 m!999049))

(declare-fun m!999051 () Bool)

(assert (=> b!1081243 m!999051))

(declare-fun m!999053 () Bool)

(assert (=> b!1081241 m!999053))

(declare-fun m!999055 () Bool)

(assert (=> b!1081240 m!999055))

(declare-fun m!999057 () Bool)

(assert (=> start!95664 m!999057))

(declare-fun m!999059 () Bool)

(assert (=> start!95664 m!999059))

(declare-fun m!999061 () Bool)

(assert (=> start!95664 m!999061))

(declare-fun m!999063 () Bool)

(assert (=> b!1081235 m!999063))

(declare-fun m!999065 () Bool)

(assert (=> mapNonEmpty!41233 m!999065))

(declare-fun m!999067 () Bool)

(assert (=> b!1081246 m!999067))

(declare-fun m!999069 () Bool)

(assert (=> b!1081242 m!999069))

(declare-fun m!999071 () Bool)

(assert (=> b!1081242 m!999071))

(declare-fun m!999073 () Bool)

(assert (=> b!1081242 m!999073))

(declare-fun m!999075 () Bool)

(assert (=> b!1081242 m!999075))

(declare-fun m!999077 () Bool)

(assert (=> b!1081242 m!999077))

(declare-fun m!999079 () Bool)

(assert (=> b!1081242 m!999079))

(check-sat (not b!1081240) (not mapNonEmpty!41233) (not b_next!22317) b_and!35311 tp_is_empty!26319 (not b!1081241) (not b!1081235) (not b!1081243) (not b!1081242) (not b!1081246) (not b_lambda!16987) (not start!95664))
(check-sat b_and!35311 (not b_next!22317))
