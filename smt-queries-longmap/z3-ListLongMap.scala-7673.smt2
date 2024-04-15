; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96378 () Bool)

(assert start!96378)

(declare-fun b_free!22963 () Bool)

(declare-fun b_next!22963 () Bool)

(assert (=> start!96378 (= b_free!22963 (not b_next!22963))))

(declare-fun tp!80816 () Bool)

(declare-fun b_and!36563 () Bool)

(assert (=> start!96378 (= tp!80816 b_and!36563)))

(declare-fun b!1095229 () Bool)

(declare-fun res!730951 () Bool)

(declare-fun e!625270 () Bool)

(assert (=> b!1095229 (=> (not res!730951) (not e!625270))))

(declare-datatypes ((array!70854 0))(
  ( (array!70855 (arr!34099 (Array (_ BitVec 32) (_ BitVec 64))) (size!34637 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70854)

(declare-datatypes ((List!23875 0))(
  ( (Nil!23872) (Cons!23871 (h!25080 (_ BitVec 64)) (t!33875 List!23875)) )
))
(declare-fun arrayNoDuplicates!0 (array!70854 (_ BitVec 32) List!23875) Bool)

(assert (=> b!1095229 (= res!730951 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23872))))

(declare-fun mapIsEmpty!42280 () Bool)

(declare-fun mapRes!42280 () Bool)

(assert (=> mapIsEmpty!42280 mapRes!42280))

(declare-fun b!1095230 () Bool)

(declare-fun e!625269 () Bool)

(declare-fun tp_is_empty!27013 () Bool)

(assert (=> b!1095230 (= e!625269 tp_is_empty!27013)))

(declare-fun b!1095231 () Bool)

(declare-fun res!730953 () Bool)

(assert (=> b!1095231 (=> (not res!730953) (not e!625270))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095231 (= res!730953 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34637 _keys!1070))))))

(declare-fun mapNonEmpty!42280 () Bool)

(declare-fun tp!80815 () Bool)

(declare-fun e!625268 () Bool)

(assert (=> mapNonEmpty!42280 (= mapRes!42280 (and tp!80815 e!625268))))

(declare-datatypes ((V!41145 0))(
  ( (V!41146 (val!13563 Int)) )
))
(declare-datatypes ((ValueCell!12797 0))(
  ( (ValueCellFull!12797 (v!16183 V!41145)) (EmptyCell!12797) )
))
(declare-fun mapValue!42280 () ValueCell!12797)

(declare-datatypes ((array!70856 0))(
  ( (array!70857 (arr!34100 (Array (_ BitVec 32) ValueCell!12797)) (size!34638 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70856)

(declare-fun mapKey!42280 () (_ BitVec 32))

(declare-fun mapRest!42280 () (Array (_ BitVec 32) ValueCell!12797))

(assert (=> mapNonEmpty!42280 (= (arr!34100 _values!874) (store mapRest!42280 mapKey!42280 mapValue!42280))))

(declare-fun b!1095232 () Bool)

(declare-fun e!625265 () Bool)

(assert (=> b!1095232 (= e!625265 (and e!625269 mapRes!42280))))

(declare-fun condMapEmpty!42280 () Bool)

(declare-fun mapDefault!42280 () ValueCell!12797)

(assert (=> b!1095232 (= condMapEmpty!42280 (= (arr!34100 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12797)) mapDefault!42280)))))

(declare-fun b!1095234 () Bool)

(declare-fun res!730956 () Bool)

(assert (=> b!1095234 (=> (not res!730956) (not e!625270))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70854 (_ BitVec 32)) Bool)

(assert (=> b!1095234 (= res!730956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095235 () Bool)

(declare-fun res!730949 () Bool)

(declare-fun e!625266 () Bool)

(assert (=> b!1095235 (=> (not res!730949) (not e!625266))))

(declare-fun lt!489616 () array!70854)

(assert (=> b!1095235 (= res!730949 (arrayNoDuplicates!0 lt!489616 #b00000000000000000000000000000000 Nil!23872))))

(declare-fun res!730957 () Bool)

(assert (=> start!96378 (=> (not res!730957) (not e!625270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96378 (= res!730957 (validMask!0 mask!1414))))

(assert (=> start!96378 e!625270))

(assert (=> start!96378 tp!80816))

(assert (=> start!96378 true))

(assert (=> start!96378 tp_is_empty!27013))

(declare-fun array_inv!26314 (array!70854) Bool)

(assert (=> start!96378 (array_inv!26314 _keys!1070)))

(declare-fun array_inv!26315 (array!70856) Bool)

(assert (=> start!96378 (and (array_inv!26315 _values!874) e!625265)))

(declare-fun b!1095233 () Bool)

(declare-fun res!730950 () Bool)

(assert (=> b!1095233 (=> (not res!730950) (not e!625270))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1095233 (= res!730950 (= (select (arr!34099 _keys!1070) i!650) k0!904))))

(declare-fun b!1095236 () Bool)

(declare-fun res!730955 () Bool)

(assert (=> b!1095236 (=> (not res!730955) (not e!625270))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095236 (= res!730955 (and (= (size!34638 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34637 _keys!1070) (size!34638 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095237 () Bool)

(assert (=> b!1095237 (= e!625266 (not (bvsle #b00000000000000000000000000000000 (size!34637 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41145)

(declare-fun zeroValue!831 () V!41145)

(declare-datatypes ((tuple2!17282 0))(
  ( (tuple2!17283 (_1!8652 (_ BitVec 64)) (_2!8652 V!41145)) )
))
(declare-datatypes ((List!23876 0))(
  ( (Nil!23873) (Cons!23872 (h!25081 tuple2!17282) (t!33876 List!23876)) )
))
(declare-datatypes ((ListLongMap!15251 0))(
  ( (ListLongMap!15252 (toList!7641 List!23876)) )
))
(declare-fun lt!489614 () ListLongMap!15251)

(declare-fun getCurrentListMapNoExtraKeys!4174 (array!70854 array!70856 (_ BitVec 32) (_ BitVec 32) V!41145 V!41145 (_ BitVec 32) Int) ListLongMap!15251)

(declare-fun dynLambda!2243 (Int (_ BitVec 64)) V!41145)

(assert (=> b!1095237 (= lt!489614 (getCurrentListMapNoExtraKeys!4174 lt!489616 (array!70857 (store (arr!34100 _values!874) i!650 (ValueCellFull!12797 (dynLambda!2243 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34638 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489617 () ListLongMap!15251)

(assert (=> b!1095237 (= lt!489617 (getCurrentListMapNoExtraKeys!4174 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095237 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35869 0))(
  ( (Unit!35870) )
))
(declare-fun lt!489615 () Unit!35869)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70854 (_ BitVec 64) (_ BitVec 32)) Unit!35869)

(assert (=> b!1095237 (= lt!489615 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095238 () Bool)

(assert (=> b!1095238 (= e!625268 tp_is_empty!27013)))

(declare-fun b!1095239 () Bool)

(assert (=> b!1095239 (= e!625270 e!625266)))

(declare-fun res!730952 () Bool)

(assert (=> b!1095239 (=> (not res!730952) (not e!625266))))

(assert (=> b!1095239 (= res!730952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489616 mask!1414))))

(assert (=> b!1095239 (= lt!489616 (array!70855 (store (arr!34099 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34637 _keys!1070)))))

(declare-fun b!1095240 () Bool)

(declare-fun res!730954 () Bool)

(assert (=> b!1095240 (=> (not res!730954) (not e!625270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095240 (= res!730954 (validKeyInArray!0 k0!904))))

(assert (= (and start!96378 res!730957) b!1095236))

(assert (= (and b!1095236 res!730955) b!1095234))

(assert (= (and b!1095234 res!730956) b!1095229))

(assert (= (and b!1095229 res!730951) b!1095231))

(assert (= (and b!1095231 res!730953) b!1095240))

(assert (= (and b!1095240 res!730954) b!1095233))

(assert (= (and b!1095233 res!730950) b!1095239))

(assert (= (and b!1095239 res!730952) b!1095235))

(assert (= (and b!1095235 res!730949) b!1095237))

(assert (= (and b!1095232 condMapEmpty!42280) mapIsEmpty!42280))

(assert (= (and b!1095232 (not condMapEmpty!42280)) mapNonEmpty!42280))

(get-info :version)

(assert (= (and mapNonEmpty!42280 ((_ is ValueCellFull!12797) mapValue!42280)) b!1095238))

(assert (= (and b!1095232 ((_ is ValueCellFull!12797) mapDefault!42280)) b!1095230))

(assert (= start!96378 b!1095232))

(declare-fun b_lambda!17599 () Bool)

(assert (=> (not b_lambda!17599) (not b!1095237)))

(declare-fun t!33874 () Bool)

(declare-fun tb!7821 () Bool)

(assert (=> (and start!96378 (= defaultEntry!882 defaultEntry!882) t!33874) tb!7821))

(declare-fun result!16173 () Bool)

(assert (=> tb!7821 (= result!16173 tp_is_empty!27013)))

(assert (=> b!1095237 t!33874))

(declare-fun b_and!36565 () Bool)

(assert (= b_and!36563 (and (=> t!33874 result!16173) b_and!36565)))

(declare-fun m!1014399 () Bool)

(assert (=> b!1095235 m!1014399))

(declare-fun m!1014401 () Bool)

(assert (=> start!96378 m!1014401))

(declare-fun m!1014403 () Bool)

(assert (=> start!96378 m!1014403))

(declare-fun m!1014405 () Bool)

(assert (=> start!96378 m!1014405))

(declare-fun m!1014407 () Bool)

(assert (=> b!1095229 m!1014407))

(declare-fun m!1014409 () Bool)

(assert (=> b!1095239 m!1014409))

(declare-fun m!1014411 () Bool)

(assert (=> b!1095239 m!1014411))

(declare-fun m!1014413 () Bool)

(assert (=> b!1095233 m!1014413))

(declare-fun m!1014415 () Bool)

(assert (=> mapNonEmpty!42280 m!1014415))

(declare-fun m!1014417 () Bool)

(assert (=> b!1095237 m!1014417))

(declare-fun m!1014419 () Bool)

(assert (=> b!1095237 m!1014419))

(declare-fun m!1014421 () Bool)

(assert (=> b!1095237 m!1014421))

(declare-fun m!1014423 () Bool)

(assert (=> b!1095237 m!1014423))

(declare-fun m!1014425 () Bool)

(assert (=> b!1095237 m!1014425))

(declare-fun m!1014427 () Bool)

(assert (=> b!1095237 m!1014427))

(declare-fun m!1014429 () Bool)

(assert (=> b!1095234 m!1014429))

(declare-fun m!1014431 () Bool)

(assert (=> b!1095240 m!1014431))

(check-sat b_and!36565 (not b_next!22963) (not start!96378) (not b!1095239) (not b_lambda!17599) (not b!1095234) (not b!1095235) (not mapNonEmpty!42280) (not b!1095229) (not b!1095240) (not b!1095237) tp_is_empty!27013)
(check-sat b_and!36565 (not b_next!22963))
