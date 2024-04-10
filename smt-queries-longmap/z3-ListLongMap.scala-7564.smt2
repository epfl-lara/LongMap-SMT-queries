; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95706 () Bool)

(assert start!95706)

(declare-fun b_free!22359 () Bool)

(declare-fun b_next!22359 () Bool)

(assert (=> start!95706 (= b_free!22359 (not b_next!22359))))

(declare-fun tp!78926 () Bool)

(declare-fun b_and!35393 () Bool)

(assert (=> start!95706 (= tp!78926 b_and!35393)))

(declare-fun b!1082033 () Bool)

(declare-fun res!721243 () Bool)

(declare-fun e!618410 () Bool)

(assert (=> b!1082033 (=> (not res!721243) (not e!618410))))

(declare-datatypes ((array!69669 0))(
  ( (array!69670 (arr!33508 (Array (_ BitVec 32) (_ BitVec 64))) (size!34044 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69669)

(declare-datatypes ((List!23354 0))(
  ( (Nil!23351) (Cons!23350 (h!24559 (_ BitVec 64)) (t!32771 List!23354)) )
))
(declare-fun arrayNoDuplicates!0 (array!69669 (_ BitVec 32) List!23354) Bool)

(assert (=> b!1082033 (= res!721243 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23351))))

(declare-fun b!1082034 () Bool)

(declare-fun e!618411 () Bool)

(declare-fun e!618412 () Bool)

(declare-fun mapRes!41296 () Bool)

(assert (=> b!1082034 (= e!618411 (and e!618412 mapRes!41296))))

(declare-fun condMapEmpty!41296 () Bool)

(declare-datatypes ((V!40275 0))(
  ( (V!40276 (val!13237 Int)) )
))
(declare-datatypes ((ValueCell!12471 0))(
  ( (ValueCellFull!12471 (v!15858 V!40275)) (EmptyCell!12471) )
))
(declare-datatypes ((array!69671 0))(
  ( (array!69672 (arr!33509 (Array (_ BitVec 32) ValueCell!12471)) (size!34045 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69671)

(declare-fun mapDefault!41296 () ValueCell!12471)

(assert (=> b!1082034 (= condMapEmpty!41296 (= (arr!33509 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12471)) mapDefault!41296)))))

(declare-fun b!1082035 () Bool)

(declare-fun tp_is_empty!26361 () Bool)

(assert (=> b!1082035 (= e!618412 tp_is_empty!26361)))

(declare-fun mapNonEmpty!41296 () Bool)

(declare-fun tp!78925 () Bool)

(declare-fun e!618408 () Bool)

(assert (=> mapNonEmpty!41296 (= mapRes!41296 (and tp!78925 e!618408))))

(declare-fun mapKey!41296 () (_ BitVec 32))

(declare-fun mapRest!41296 () (Array (_ BitVec 32) ValueCell!12471))

(declare-fun mapValue!41296 () ValueCell!12471)

(assert (=> mapNonEmpty!41296 (= (arr!33509 _values!874) (store mapRest!41296 mapKey!41296 mapValue!41296))))

(declare-fun b!1082036 () Bool)

(declare-fun e!618413 () Bool)

(assert (=> b!1082036 (= e!618410 e!618413)))

(declare-fun res!721250 () Bool)

(assert (=> b!1082036 (=> (not res!721250) (not e!618413))))

(declare-fun lt!479491 () array!69669)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69669 (_ BitVec 32)) Bool)

(assert (=> b!1082036 (= res!721250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479491 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082036 (= lt!479491 (array!69670 (store (arr!33508 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34044 _keys!1070)))))

(declare-fun mapIsEmpty!41296 () Bool)

(assert (=> mapIsEmpty!41296 mapRes!41296))

(declare-fun b!1082037 () Bool)

(assert (=> b!1082037 (= e!618408 tp_is_empty!26361)))

(declare-fun b!1082039 () Bool)

(assert (=> b!1082039 (= e!618413 (not true))))

(declare-fun minValue!831 () V!40275)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16772 0))(
  ( (tuple2!16773 (_1!8397 (_ BitVec 64)) (_2!8397 V!40275)) )
))
(declare-datatypes ((List!23355 0))(
  ( (Nil!23352) (Cons!23351 (h!24560 tuple2!16772) (t!32772 List!23355)) )
))
(declare-datatypes ((ListLongMap!14741 0))(
  ( (ListLongMap!14742 (toList!7386 List!23355)) )
))
(declare-fun lt!479489 () ListLongMap!14741)

(declare-fun zeroValue!831 () V!40275)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3934 (array!69669 array!69671 (_ BitVec 32) (_ BitVec 32) V!40275 V!40275 (_ BitVec 32) Int) ListLongMap!14741)

(declare-fun dynLambda!2071 (Int (_ BitVec 64)) V!40275)

(assert (=> b!1082039 (= lt!479489 (getCurrentListMapNoExtraKeys!3934 lt!479491 (array!69672 (store (arr!33509 _values!874) i!650 (ValueCellFull!12471 (dynLambda!2071 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34045 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479488 () ListLongMap!14741)

(assert (=> b!1082039 (= lt!479488 (getCurrentListMapNoExtraKeys!3934 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082039 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35592 0))(
  ( (Unit!35593) )
))
(declare-fun lt!479490 () Unit!35592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69669 (_ BitVec 64) (_ BitVec 32)) Unit!35592)

(assert (=> b!1082039 (= lt!479490 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082040 () Bool)

(declare-fun res!721249 () Bool)

(assert (=> b!1082040 (=> (not res!721249) (not e!618410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082040 (= res!721249 (validKeyInArray!0 k0!904))))

(declare-fun b!1082041 () Bool)

(declare-fun res!721245 () Bool)

(assert (=> b!1082041 (=> (not res!721245) (not e!618410))))

(assert (=> b!1082041 (= res!721245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082042 () Bool)

(declare-fun res!721251 () Bool)

(assert (=> b!1082042 (=> (not res!721251) (not e!618410))))

(assert (=> b!1082042 (= res!721251 (and (= (size!34045 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34044 _keys!1070) (size!34045 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082038 () Bool)

(declare-fun res!721247 () Bool)

(assert (=> b!1082038 (=> (not res!721247) (not e!618413))))

(assert (=> b!1082038 (= res!721247 (arrayNoDuplicates!0 lt!479491 #b00000000000000000000000000000000 Nil!23351))))

(declare-fun res!721244 () Bool)

(assert (=> start!95706 (=> (not res!721244) (not e!618410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95706 (= res!721244 (validMask!0 mask!1414))))

(assert (=> start!95706 e!618410))

(assert (=> start!95706 tp!78926))

(assert (=> start!95706 true))

(assert (=> start!95706 tp_is_empty!26361))

(declare-fun array_inv!25868 (array!69669) Bool)

(assert (=> start!95706 (array_inv!25868 _keys!1070)))

(declare-fun array_inv!25869 (array!69671) Bool)

(assert (=> start!95706 (and (array_inv!25869 _values!874) e!618411)))

(declare-fun b!1082043 () Bool)

(declare-fun res!721246 () Bool)

(assert (=> b!1082043 (=> (not res!721246) (not e!618410))))

(assert (=> b!1082043 (= res!721246 (= (select (arr!33508 _keys!1070) i!650) k0!904))))

(declare-fun b!1082044 () Bool)

(declare-fun res!721248 () Bool)

(assert (=> b!1082044 (=> (not res!721248) (not e!618410))))

(assert (=> b!1082044 (= res!721248 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34044 _keys!1070))))))

(assert (= (and start!95706 res!721244) b!1082042))

(assert (= (and b!1082042 res!721251) b!1082041))

(assert (= (and b!1082041 res!721245) b!1082033))

(assert (= (and b!1082033 res!721243) b!1082044))

(assert (= (and b!1082044 res!721248) b!1082040))

(assert (= (and b!1082040 res!721249) b!1082043))

(assert (= (and b!1082043 res!721246) b!1082036))

(assert (= (and b!1082036 res!721250) b!1082038))

(assert (= (and b!1082038 res!721247) b!1082039))

(assert (= (and b!1082034 condMapEmpty!41296) mapIsEmpty!41296))

(assert (= (and b!1082034 (not condMapEmpty!41296)) mapNonEmpty!41296))

(get-info :version)

(assert (= (and mapNonEmpty!41296 ((_ is ValueCellFull!12471) mapValue!41296)) b!1082037))

(assert (= (and b!1082034 ((_ is ValueCellFull!12471) mapDefault!41296)) b!1082035))

(assert (= start!95706 b!1082034))

(declare-fun b_lambda!17029 () Bool)

(assert (=> (not b_lambda!17029) (not b!1082039)))

(declare-fun t!32770 () Bool)

(declare-fun tb!7237 () Bool)

(assert (=> (and start!95706 (= defaultEntry!882 defaultEntry!882) t!32770) tb!7237))

(declare-fun result!14993 () Bool)

(assert (=> tb!7237 (= result!14993 tp_is_empty!26361)))

(assert (=> b!1082039 t!32770))

(declare-fun b_and!35395 () Bool)

(assert (= b_and!35393 (and (=> t!32770 result!14993) b_and!35395)))

(declare-fun m!999761 () Bool)

(assert (=> b!1082043 m!999761))

(declare-fun m!999763 () Bool)

(assert (=> b!1082033 m!999763))

(declare-fun m!999765 () Bool)

(assert (=> b!1082036 m!999765))

(declare-fun m!999767 () Bool)

(assert (=> b!1082036 m!999767))

(declare-fun m!999769 () Bool)

(assert (=> b!1082040 m!999769))

(declare-fun m!999771 () Bool)

(assert (=> start!95706 m!999771))

(declare-fun m!999773 () Bool)

(assert (=> start!95706 m!999773))

(declare-fun m!999775 () Bool)

(assert (=> start!95706 m!999775))

(declare-fun m!999777 () Bool)

(assert (=> b!1082041 m!999777))

(declare-fun m!999779 () Bool)

(assert (=> b!1082038 m!999779))

(declare-fun m!999781 () Bool)

(assert (=> mapNonEmpty!41296 m!999781))

(declare-fun m!999783 () Bool)

(assert (=> b!1082039 m!999783))

(declare-fun m!999785 () Bool)

(assert (=> b!1082039 m!999785))

(declare-fun m!999787 () Bool)

(assert (=> b!1082039 m!999787))

(declare-fun m!999789 () Bool)

(assert (=> b!1082039 m!999789))

(declare-fun m!999791 () Bool)

(assert (=> b!1082039 m!999791))

(declare-fun m!999793 () Bool)

(assert (=> b!1082039 m!999793))

(check-sat tp_is_empty!26361 (not b!1082033) (not b!1082039) (not b!1082040) (not b!1082041) (not b!1082036) (not b_next!22359) (not start!95706) b_and!35395 (not b_lambda!17029) (not mapNonEmpty!41296) (not b!1082038))
(check-sat b_and!35395 (not b_next!22359))
