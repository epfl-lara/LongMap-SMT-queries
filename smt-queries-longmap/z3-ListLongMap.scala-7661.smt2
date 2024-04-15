; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96280 () Bool)

(assert start!96280)

(declare-fun b_free!22939 () Bool)

(declare-fun b_next!22939 () Bool)

(assert (=> start!96280 (= b_free!22939 (not b_next!22939))))

(declare-fun tp!80665 () Bool)

(declare-fun b_and!36527 () Bool)

(assert (=> start!96280 (= tp!80665 b_and!36527)))

(declare-fun b!1093962 () Bool)

(declare-fun e!624573 () Bool)

(declare-fun e!624574 () Bool)

(assert (=> b!1093962 (= e!624573 e!624574)))

(declare-fun res!730074 () Bool)

(assert (=> b!1093962 (=> (not res!730074) (not e!624574))))

(declare-datatypes ((array!70712 0))(
  ( (array!70713 (arr!34030 (Array (_ BitVec 32) (_ BitVec 64))) (size!34568 (_ BitVec 32))) )
))
(declare-fun lt!489283 () array!70712)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70712 (_ BitVec 32)) Bool)

(assert (=> b!1093962 (= res!730074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489283 mask!1414))))

(declare-fun _keys!1070 () array!70712)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093962 (= lt!489283 (array!70713 (store (arr!34030 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34568 _keys!1070)))))

(declare-fun b!1093963 () Bool)

(declare-fun res!730073 () Bool)

(assert (=> b!1093963 (=> (not res!730073) (not e!624573))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093963 (= res!730073 (validKeyInArray!0 k0!904))))

(declare-fun res!730067 () Bool)

(assert (=> start!96280 (=> (not res!730067) (not e!624573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96280 (= res!730067 (validMask!0 mask!1414))))

(assert (=> start!96280 e!624573))

(assert (=> start!96280 tp!80665))

(assert (=> start!96280 true))

(declare-fun tp_is_empty!26941 () Bool)

(assert (=> start!96280 tp_is_empty!26941))

(declare-fun array_inv!26268 (array!70712) Bool)

(assert (=> start!96280 (array_inv!26268 _keys!1070)))

(declare-datatypes ((V!41049 0))(
  ( (V!41050 (val!13527 Int)) )
))
(declare-datatypes ((ValueCell!12761 0))(
  ( (ValueCellFull!12761 (v!16147 V!41049)) (EmptyCell!12761) )
))
(declare-datatypes ((array!70714 0))(
  ( (array!70715 (arr!34031 (Array (_ BitVec 32) ValueCell!12761)) (size!34569 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70714)

(declare-fun e!624575 () Bool)

(declare-fun array_inv!26269 (array!70714) Bool)

(assert (=> start!96280 (and (array_inv!26269 _values!874) e!624575)))

(declare-fun b!1093964 () Bool)

(declare-fun res!730072 () Bool)

(assert (=> b!1093964 (=> (not res!730072) (not e!624573))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093964 (= res!730072 (and (= (size!34569 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34568 _keys!1070) (size!34569 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42166 () Bool)

(declare-fun mapRes!42166 () Bool)

(assert (=> mapIsEmpty!42166 mapRes!42166))

(declare-fun b!1093965 () Bool)

(declare-fun res!730068 () Bool)

(assert (=> b!1093965 (=> (not res!730068) (not e!624574))))

(declare-datatypes ((List!23840 0))(
  ( (Nil!23837) (Cons!23836 (h!25045 (_ BitVec 64)) (t!33828 List!23840)) )
))
(declare-fun arrayNoDuplicates!0 (array!70712 (_ BitVec 32) List!23840) Bool)

(assert (=> b!1093965 (= res!730068 (arrayNoDuplicates!0 lt!489283 #b00000000000000000000000000000000 Nil!23837))))

(declare-fun b!1093966 () Bool)

(declare-fun e!624572 () Bool)

(assert (=> b!1093966 (= e!624572 tp_is_empty!26941)))

(declare-fun b!1093967 () Bool)

(declare-fun e!624570 () Bool)

(assert (=> b!1093967 (= e!624575 (and e!624570 mapRes!42166))))

(declare-fun condMapEmpty!42166 () Bool)

(declare-fun mapDefault!42166 () ValueCell!12761)

(assert (=> b!1093967 (= condMapEmpty!42166 (= (arr!34031 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12761)) mapDefault!42166)))))

(declare-fun b!1093968 () Bool)

(declare-fun res!730070 () Bool)

(assert (=> b!1093968 (=> (not res!730070) (not e!624573))))

(assert (=> b!1093968 (= res!730070 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23837))))

(declare-fun b!1093969 () Bool)

(declare-fun res!730069 () Bool)

(assert (=> b!1093969 (=> (not res!730069) (not e!624573))))

(assert (=> b!1093969 (= res!730069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42166 () Bool)

(declare-fun tp!80666 () Bool)

(assert (=> mapNonEmpty!42166 (= mapRes!42166 (and tp!80666 e!624572))))

(declare-fun mapValue!42166 () ValueCell!12761)

(declare-fun mapRest!42166 () (Array (_ BitVec 32) ValueCell!12761))

(declare-fun mapKey!42166 () (_ BitVec 32))

(assert (=> mapNonEmpty!42166 (= (arr!34031 _values!874) (store mapRest!42166 mapKey!42166 mapValue!42166))))

(declare-fun b!1093970 () Bool)

(declare-fun res!730066 () Bool)

(assert (=> b!1093970 (=> (not res!730066) (not e!624573))))

(assert (=> b!1093970 (= res!730066 (= (select (arr!34030 _keys!1070) i!650) k0!904))))

(declare-fun b!1093971 () Bool)

(assert (=> b!1093971 (= e!624570 tp_is_empty!26941)))

(declare-fun b!1093972 () Bool)

(declare-fun res!730071 () Bool)

(assert (=> b!1093972 (=> (not res!730071) (not e!624573))))

(assert (=> b!1093972 (= res!730071 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34568 _keys!1070))))))

(declare-fun b!1093973 () Bool)

(assert (=> b!1093973 (= e!624574 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41049)

(declare-datatypes ((tuple2!17272 0))(
  ( (tuple2!17273 (_1!8647 (_ BitVec 64)) (_2!8647 V!41049)) )
))
(declare-datatypes ((List!23841 0))(
  ( (Nil!23838) (Cons!23837 (h!25046 tuple2!17272) (t!33829 List!23841)) )
))
(declare-datatypes ((ListLongMap!15241 0))(
  ( (ListLongMap!15242 (toList!7636 List!23841)) )
))
(declare-fun lt!489280 () ListLongMap!15241)

(declare-fun zeroValue!831 () V!41049)

(declare-fun getCurrentListMap!4299 (array!70712 array!70714 (_ BitVec 32) (_ BitVec 32) V!41049 V!41049 (_ BitVec 32) Int) ListLongMap!15241)

(assert (=> b!1093973 (= lt!489280 (getCurrentListMap!4299 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489278 () ListLongMap!15241)

(declare-fun lt!489281 () array!70714)

(assert (=> b!1093973 (= lt!489278 (getCurrentListMap!4299 lt!489283 lt!489281 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489279 () ListLongMap!15241)

(declare-fun lt!489284 () ListLongMap!15241)

(assert (=> b!1093973 (and (= lt!489279 lt!489284) (= lt!489284 lt!489279))))

(declare-fun lt!489277 () ListLongMap!15241)

(declare-fun -!908 (ListLongMap!15241 (_ BitVec 64)) ListLongMap!15241)

(assert (=> b!1093973 (= lt!489284 (-!908 lt!489277 k0!904))))

(declare-datatypes ((Unit!35851 0))(
  ( (Unit!35852) )
))
(declare-fun lt!489276 () Unit!35851)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!183 (array!70712 array!70714 (_ BitVec 32) (_ BitVec 32) V!41049 V!41049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35851)

(assert (=> b!1093973 (= lt!489276 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!183 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4169 (array!70712 array!70714 (_ BitVec 32) (_ BitVec 32) V!41049 V!41049 (_ BitVec 32) Int) ListLongMap!15241)

(assert (=> b!1093973 (= lt!489279 (getCurrentListMapNoExtraKeys!4169 lt!489283 lt!489281 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2240 (Int (_ BitVec 64)) V!41049)

(assert (=> b!1093973 (= lt!489281 (array!70715 (store (arr!34031 _values!874) i!650 (ValueCellFull!12761 (dynLambda!2240 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34569 _values!874)))))

(assert (=> b!1093973 (= lt!489277 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093973 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489282 () Unit!35851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70712 (_ BitVec 64) (_ BitVec 32)) Unit!35851)

(assert (=> b!1093973 (= lt!489282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96280 res!730067) b!1093964))

(assert (= (and b!1093964 res!730072) b!1093969))

(assert (= (and b!1093969 res!730069) b!1093968))

(assert (= (and b!1093968 res!730070) b!1093972))

(assert (= (and b!1093972 res!730071) b!1093963))

(assert (= (and b!1093963 res!730073) b!1093970))

(assert (= (and b!1093970 res!730066) b!1093962))

(assert (= (and b!1093962 res!730074) b!1093965))

(assert (= (and b!1093965 res!730068) b!1093973))

(assert (= (and b!1093967 condMapEmpty!42166) mapIsEmpty!42166))

(assert (= (and b!1093967 (not condMapEmpty!42166)) mapNonEmpty!42166))

(get-info :version)

(assert (= (and mapNonEmpty!42166 ((_ is ValueCellFull!12761) mapValue!42166)) b!1093966))

(assert (= (and b!1093967 ((_ is ValueCellFull!12761) mapDefault!42166)) b!1093971))

(assert (= start!96280 b!1093967))

(declare-fun b_lambda!17587 () Bool)

(assert (=> (not b_lambda!17587) (not b!1093973)))

(declare-fun t!33827 () Bool)

(declare-fun tb!7809 () Bool)

(assert (=> (and start!96280 (= defaultEntry!882 defaultEntry!882) t!33827) tb!7809))

(declare-fun result!16145 () Bool)

(assert (=> tb!7809 (= result!16145 tp_is_empty!26941)))

(assert (=> b!1093973 t!33827))

(declare-fun b_and!36529 () Bool)

(assert (= b_and!36527 (and (=> t!33827 result!16145) b_and!36529)))

(declare-fun m!1013429 () Bool)

(assert (=> b!1093963 m!1013429))

(declare-fun m!1013431 () Bool)

(assert (=> mapNonEmpty!42166 m!1013431))

(declare-fun m!1013433 () Bool)

(assert (=> b!1093962 m!1013433))

(declare-fun m!1013435 () Bool)

(assert (=> b!1093962 m!1013435))

(declare-fun m!1013437 () Bool)

(assert (=> b!1093969 m!1013437))

(declare-fun m!1013439 () Bool)

(assert (=> start!96280 m!1013439))

(declare-fun m!1013441 () Bool)

(assert (=> start!96280 m!1013441))

(declare-fun m!1013443 () Bool)

(assert (=> start!96280 m!1013443))

(declare-fun m!1013445 () Bool)

(assert (=> b!1093973 m!1013445))

(declare-fun m!1013447 () Bool)

(assert (=> b!1093973 m!1013447))

(declare-fun m!1013449 () Bool)

(assert (=> b!1093973 m!1013449))

(declare-fun m!1013451 () Bool)

(assert (=> b!1093973 m!1013451))

(declare-fun m!1013453 () Bool)

(assert (=> b!1093973 m!1013453))

(declare-fun m!1013455 () Bool)

(assert (=> b!1093973 m!1013455))

(declare-fun m!1013457 () Bool)

(assert (=> b!1093973 m!1013457))

(declare-fun m!1013459 () Bool)

(assert (=> b!1093973 m!1013459))

(declare-fun m!1013461 () Bool)

(assert (=> b!1093973 m!1013461))

(declare-fun m!1013463 () Bool)

(assert (=> b!1093973 m!1013463))

(declare-fun m!1013465 () Bool)

(assert (=> b!1093968 m!1013465))

(declare-fun m!1013467 () Bool)

(assert (=> b!1093970 m!1013467))

(declare-fun m!1013469 () Bool)

(assert (=> b!1093965 m!1013469))

(check-sat (not b!1093969) (not start!96280) (not b!1093968) tp_is_empty!26941 (not b_lambda!17587) (not mapNonEmpty!42166) b_and!36529 (not b!1093973) (not b!1093962) (not b!1093963) (not b!1093965) (not b_next!22939))
(check-sat b_and!36529 (not b_next!22939))
