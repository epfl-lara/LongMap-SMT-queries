; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96392 () Bool)

(assert start!96392)

(declare-fun b_free!22971 () Bool)

(declare-fun b_next!22971 () Bool)

(assert (=> start!96392 (= b_free!22971 (not b_next!22971))))

(declare-fun tp!80840 () Bool)

(declare-fun b_and!36605 () Bool)

(assert (=> start!96392 (= tp!80840 b_and!36605)))

(declare-fun b!1095534 () Bool)

(declare-fun e!625432 () Bool)

(declare-fun tp_is_empty!27021 () Bool)

(assert (=> b!1095534 (= e!625432 tp_is_empty!27021)))

(declare-fun b!1095535 () Bool)

(declare-fun res!731130 () Bool)

(declare-fun e!625435 () Bool)

(assert (=> b!1095535 (=> (not res!731130) (not e!625435))))

(declare-datatypes ((array!70955 0))(
  ( (array!70956 (arr!34149 (Array (_ BitVec 32) (_ BitVec 64))) (size!34685 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70955)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095535 (= res!731130 (= (select (arr!34149 _keys!1070) i!650) k0!904))))

(declare-fun b!1095536 () Bool)

(declare-fun res!731129 () Bool)

(assert (=> b!1095536 (=> (not res!731129) (not e!625435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095536 (= res!731129 (validKeyInArray!0 k0!904))))

(declare-fun res!731134 () Bool)

(assert (=> start!96392 (=> (not res!731134) (not e!625435))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96392 (= res!731134 (validMask!0 mask!1414))))

(assert (=> start!96392 e!625435))

(assert (=> start!96392 tp!80840))

(assert (=> start!96392 true))

(assert (=> start!96392 tp_is_empty!27021))

(declare-fun array_inv!26314 (array!70955) Bool)

(assert (=> start!96392 (array_inv!26314 _keys!1070)))

(declare-datatypes ((V!41155 0))(
  ( (V!41156 (val!13567 Int)) )
))
(declare-datatypes ((ValueCell!12801 0))(
  ( (ValueCellFull!12801 (v!16188 V!41155)) (EmptyCell!12801) )
))
(declare-datatypes ((array!70957 0))(
  ( (array!70958 (arr!34150 (Array (_ BitVec 32) ValueCell!12801)) (size!34686 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70957)

(declare-fun e!625430 () Bool)

(declare-fun array_inv!26315 (array!70957) Bool)

(assert (=> start!96392 (and (array_inv!26315 _values!874) e!625430)))

(declare-fun b!1095537 () Bool)

(declare-fun res!731127 () Bool)

(assert (=> b!1095537 (=> (not res!731127) (not e!625435))))

(declare-datatypes ((List!23846 0))(
  ( (Nil!23843) (Cons!23842 (h!25051 (_ BitVec 64)) (t!33863 List!23846)) )
))
(declare-fun arrayNoDuplicates!0 (array!70955 (_ BitVec 32) List!23846) Bool)

(assert (=> b!1095537 (= res!731127 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23843))))

(declare-fun b!1095538 () Bool)

(declare-fun res!731126 () Bool)

(assert (=> b!1095538 (=> (not res!731126) (not e!625435))))

(assert (=> b!1095538 (= res!731126 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34685 _keys!1070))))))

(declare-fun b!1095539 () Bool)

(declare-fun e!625434 () Bool)

(assert (=> b!1095539 (= e!625435 e!625434)))

(declare-fun res!731131 () Bool)

(assert (=> b!1095539 (=> (not res!731131) (not e!625434))))

(declare-fun lt!489862 () array!70955)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70955 (_ BitVec 32)) Bool)

(assert (=> b!1095539 (= res!731131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489862 mask!1414))))

(assert (=> b!1095539 (= lt!489862 (array!70956 (store (arr!34149 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34685 _keys!1070)))))

(declare-fun mapNonEmpty!42292 () Bool)

(declare-fun mapRes!42292 () Bool)

(declare-fun tp!80839 () Bool)

(assert (=> mapNonEmpty!42292 (= mapRes!42292 (and tp!80839 e!625432))))

(declare-fun mapValue!42292 () ValueCell!12801)

(declare-fun mapKey!42292 () (_ BitVec 32))

(declare-fun mapRest!42292 () (Array (_ BitVec 32) ValueCell!12801))

(assert (=> mapNonEmpty!42292 (= (arr!34150 _values!874) (store mapRest!42292 mapKey!42292 mapValue!42292))))

(declare-fun b!1095540 () Bool)

(assert (=> b!1095540 (= e!625434 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41155)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17226 0))(
  ( (tuple2!17227 (_1!8624 (_ BitVec 64)) (_2!8624 V!41155)) )
))
(declare-datatypes ((List!23847 0))(
  ( (Nil!23844) (Cons!23843 (h!25052 tuple2!17226) (t!33864 List!23847)) )
))
(declare-datatypes ((ListLongMap!15195 0))(
  ( (ListLongMap!15196 (toList!7613 List!23847)) )
))
(declare-fun lt!489863 () ListLongMap!15195)

(declare-fun zeroValue!831 () V!41155)

(declare-fun getCurrentListMapNoExtraKeys!4129 (array!70955 array!70957 (_ BitVec 32) (_ BitVec 32) V!41155 V!41155 (_ BitVec 32) Int) ListLongMap!15195)

(declare-fun dynLambda!2264 (Int (_ BitVec 64)) V!41155)

(assert (=> b!1095540 (= lt!489863 (getCurrentListMapNoExtraKeys!4129 lt!489862 (array!70958 (store (arr!34150 _values!874) i!650 (ValueCellFull!12801 (dynLambda!2264 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34686 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489865 () ListLongMap!15195)

(assert (=> b!1095540 (= lt!489865 (getCurrentListMapNoExtraKeys!4129 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095540 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36038 0))(
  ( (Unit!36039) )
))
(declare-fun lt!489864 () Unit!36038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70955 (_ BitVec 64) (_ BitVec 32)) Unit!36038)

(assert (=> b!1095540 (= lt!489864 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095541 () Bool)

(declare-fun res!731128 () Bool)

(assert (=> b!1095541 (=> (not res!731128) (not e!625434))))

(assert (=> b!1095541 (= res!731128 (arrayNoDuplicates!0 lt!489862 #b00000000000000000000000000000000 Nil!23843))))

(declare-fun mapIsEmpty!42292 () Bool)

(assert (=> mapIsEmpty!42292 mapRes!42292))

(declare-fun b!1095542 () Bool)

(declare-fun e!625431 () Bool)

(assert (=> b!1095542 (= e!625430 (and e!625431 mapRes!42292))))

(declare-fun condMapEmpty!42292 () Bool)

(declare-fun mapDefault!42292 () ValueCell!12801)

(assert (=> b!1095542 (= condMapEmpty!42292 (= (arr!34150 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12801)) mapDefault!42292)))))

(declare-fun b!1095543 () Bool)

(assert (=> b!1095543 (= e!625431 tp_is_empty!27021)))

(declare-fun b!1095544 () Bool)

(declare-fun res!731133 () Bool)

(assert (=> b!1095544 (=> (not res!731133) (not e!625435))))

(assert (=> b!1095544 (= res!731133 (and (= (size!34686 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34685 _keys!1070) (size!34686 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095545 () Bool)

(declare-fun res!731132 () Bool)

(assert (=> b!1095545 (=> (not res!731132) (not e!625435))))

(assert (=> b!1095545 (= res!731132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96392 res!731134) b!1095544))

(assert (= (and b!1095544 res!731133) b!1095545))

(assert (= (and b!1095545 res!731132) b!1095537))

(assert (= (and b!1095537 res!731127) b!1095538))

(assert (= (and b!1095538 res!731126) b!1095536))

(assert (= (and b!1095536 res!731129) b!1095535))

(assert (= (and b!1095535 res!731130) b!1095539))

(assert (= (and b!1095539 res!731131) b!1095541))

(assert (= (and b!1095541 res!731128) b!1095540))

(assert (= (and b!1095542 condMapEmpty!42292) mapIsEmpty!42292))

(assert (= (and b!1095542 (not condMapEmpty!42292)) mapNonEmpty!42292))

(get-info :version)

(assert (= (and mapNonEmpty!42292 ((_ is ValueCellFull!12801) mapValue!42292)) b!1095534))

(assert (= (and b!1095542 ((_ is ValueCellFull!12801) mapDefault!42292)) b!1095543))

(assert (= start!96392 b!1095542))

(declare-fun b_lambda!17629 () Bool)

(assert (=> (not b_lambda!17629) (not b!1095540)))

(declare-fun t!33862 () Bool)

(declare-fun tb!7837 () Bool)

(assert (=> (and start!96392 (= defaultEntry!882 defaultEntry!882) t!33862) tb!7837))

(declare-fun result!16197 () Bool)

(assert (=> tb!7837 (= result!16197 tp_is_empty!27021)))

(assert (=> b!1095540 t!33862))

(declare-fun b_and!36607 () Bool)

(assert (= b_and!36605 (and (=> t!33862 result!16197) b_and!36607)))

(declare-fun m!1015161 () Bool)

(assert (=> b!1095537 m!1015161))

(declare-fun m!1015163 () Bool)

(assert (=> mapNonEmpty!42292 m!1015163))

(declare-fun m!1015165 () Bool)

(assert (=> b!1095540 m!1015165))

(declare-fun m!1015167 () Bool)

(assert (=> b!1095540 m!1015167))

(declare-fun m!1015169 () Bool)

(assert (=> b!1095540 m!1015169))

(declare-fun m!1015171 () Bool)

(assert (=> b!1095540 m!1015171))

(declare-fun m!1015173 () Bool)

(assert (=> b!1095540 m!1015173))

(declare-fun m!1015175 () Bool)

(assert (=> b!1095540 m!1015175))

(declare-fun m!1015177 () Bool)

(assert (=> start!96392 m!1015177))

(declare-fun m!1015179 () Bool)

(assert (=> start!96392 m!1015179))

(declare-fun m!1015181 () Bool)

(assert (=> start!96392 m!1015181))

(declare-fun m!1015183 () Bool)

(assert (=> b!1095539 m!1015183))

(declare-fun m!1015185 () Bool)

(assert (=> b!1095539 m!1015185))

(declare-fun m!1015187 () Bool)

(assert (=> b!1095545 m!1015187))

(declare-fun m!1015189 () Bool)

(assert (=> b!1095535 m!1015189))

(declare-fun m!1015191 () Bool)

(assert (=> b!1095541 m!1015191))

(declare-fun m!1015193 () Bool)

(assert (=> b!1095536 m!1015193))

(check-sat (not mapNonEmpty!42292) (not b_lambda!17629) (not b!1095536) (not b!1095540) (not b!1095537) (not b!1095541) b_and!36607 (not b!1095545) (not b_next!22971) tp_is_empty!27021 (not b!1095539) (not start!96392))
(check-sat b_and!36607 (not b_next!22971))
