; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96504 () Bool)

(assert start!96504)

(declare-fun b_free!22921 () Bool)

(declare-fun b_next!22921 () Bool)

(assert (=> start!96504 (= b_free!22921 (not b_next!22921))))

(declare-fun tp!80611 () Bool)

(declare-fun b_and!36527 () Bool)

(assert (=> start!96504 (= tp!80611 b_and!36527)))

(declare-fun b!1095100 () Bool)

(declare-fun e!625360 () Bool)

(declare-fun tp_is_empty!26923 () Bool)

(assert (=> b!1095100 (= e!625360 tp_is_empty!26923)))

(declare-fun mapNonEmpty!42139 () Bool)

(declare-fun mapRes!42139 () Bool)

(declare-fun tp!80612 () Bool)

(assert (=> mapNonEmpty!42139 (= mapRes!42139 (and tp!80612 e!625360))))

(declare-datatypes ((V!41025 0))(
  ( (V!41026 (val!13518 Int)) )
))
(declare-datatypes ((ValueCell!12752 0))(
  ( (ValueCellFull!12752 (v!16135 V!41025)) (EmptyCell!12752) )
))
(declare-datatypes ((array!70791 0))(
  ( (array!70792 (arr!34063 (Array (_ BitVec 32) ValueCell!12752)) (size!34600 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70791)

(declare-fun mapRest!42139 () (Array (_ BitVec 32) ValueCell!12752))

(declare-fun mapValue!42139 () ValueCell!12752)

(declare-fun mapKey!42139 () (_ BitVec 32))

(assert (=> mapNonEmpty!42139 (= (arr!34063 _values!874) (store mapRest!42139 mapKey!42139 mapValue!42139))))

(declare-fun res!730422 () Bool)

(declare-fun e!625361 () Bool)

(assert (=> start!96504 (=> (not res!730422) (not e!625361))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96504 (= res!730422 (validMask!0 mask!1414))))

(assert (=> start!96504 e!625361))

(assert (=> start!96504 tp!80611))

(assert (=> start!96504 true))

(assert (=> start!96504 tp_is_empty!26923))

(declare-datatypes ((array!70793 0))(
  ( (array!70794 (arr!34064 (Array (_ BitVec 32) (_ BitVec 64))) (size!34601 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70793)

(declare-fun array_inv!26290 (array!70793) Bool)

(assert (=> start!96504 (array_inv!26290 _keys!1070)))

(declare-fun e!625359 () Bool)

(declare-fun array_inv!26291 (array!70791) Bool)

(assert (=> start!96504 (and (array_inv!26291 _values!874) e!625359)))

(declare-fun b!1095101 () Bool)

(declare-fun res!730421 () Bool)

(assert (=> b!1095101 (=> (not res!730421) (not e!625361))))

(declare-datatypes ((List!23801 0))(
  ( (Nil!23798) (Cons!23797 (h!25015 (_ BitVec 64)) (t!33772 List!23801)) )
))
(declare-fun arrayNoDuplicates!0 (array!70793 (_ BitVec 32) List!23801) Bool)

(assert (=> b!1095101 (= res!730421 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23798))))

(declare-fun b!1095102 () Bool)

(declare-fun res!730418 () Bool)

(assert (=> b!1095102 (=> (not res!730418) (not e!625361))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095102 (= res!730418 (and (= (size!34600 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34601 _keys!1070) (size!34600 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095103 () Bool)

(declare-fun res!730415 () Bool)

(declare-fun e!625356 () Bool)

(assert (=> b!1095103 (=> (not res!730415) (not e!625356))))

(declare-fun lt!489749 () array!70793)

(assert (=> b!1095103 (= res!730415 (arrayNoDuplicates!0 lt!489749 #b00000000000000000000000000000000 Nil!23798))))

(declare-fun b!1095104 () Bool)

(assert (=> b!1095104 (= e!625356 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41025)

(declare-fun zeroValue!831 () V!41025)

(declare-datatypes ((tuple2!17204 0))(
  ( (tuple2!17205 (_1!8613 (_ BitVec 64)) (_2!8613 V!41025)) )
))
(declare-datatypes ((List!23802 0))(
  ( (Nil!23799) (Cons!23798 (h!25016 tuple2!17204) (t!33773 List!23802)) )
))
(declare-datatypes ((ListLongMap!15181 0))(
  ( (ListLongMap!15182 (toList!7606 List!23802)) )
))
(declare-fun lt!489751 () ListLongMap!15181)

(declare-fun getCurrentListMap!4354 (array!70793 array!70791 (_ BitVec 32) (_ BitVec 32) V!41025 V!41025 (_ BitVec 32) Int) ListLongMap!15181)

(assert (=> b!1095104 (= lt!489751 (getCurrentListMap!4354 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489755 () ListLongMap!15181)

(declare-fun lt!489753 () array!70791)

(assert (=> b!1095104 (= lt!489755 (getCurrentListMap!4354 lt!489749 lt!489753 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489756 () ListLongMap!15181)

(declare-fun lt!489754 () ListLongMap!15181)

(assert (=> b!1095104 (and (= lt!489756 lt!489754) (= lt!489754 lt!489756))))

(declare-fun lt!489748 () ListLongMap!15181)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!911 (ListLongMap!15181 (_ BitVec 64)) ListLongMap!15181)

(assert (=> b!1095104 (= lt!489754 (-!911 lt!489748 k0!904))))

(declare-datatypes ((Unit!35989 0))(
  ( (Unit!35990) )
))
(declare-fun lt!489752 () Unit!35989)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!183 (array!70793 array!70791 (_ BitVec 32) (_ BitVec 32) V!41025 V!41025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35989)

(assert (=> b!1095104 (= lt!489752 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!183 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4159 (array!70793 array!70791 (_ BitVec 32) (_ BitVec 32) V!41025 V!41025 (_ BitVec 32) Int) ListLongMap!15181)

(assert (=> b!1095104 (= lt!489756 (getCurrentListMapNoExtraKeys!4159 lt!489749 lt!489753 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2280 (Int (_ BitVec 64)) V!41025)

(assert (=> b!1095104 (= lt!489753 (array!70792 (store (arr!34063 _values!874) i!650 (ValueCellFull!12752 (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34600 _values!874)))))

(assert (=> b!1095104 (= lt!489748 (getCurrentListMapNoExtraKeys!4159 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095104 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489750 () Unit!35989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70793 (_ BitVec 64) (_ BitVec 32)) Unit!35989)

(assert (=> b!1095104 (= lt!489750 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095105 () Bool)

(declare-fun e!625358 () Bool)

(assert (=> b!1095105 (= e!625359 (and e!625358 mapRes!42139))))

(declare-fun condMapEmpty!42139 () Bool)

(declare-fun mapDefault!42139 () ValueCell!12752)

(assert (=> b!1095105 (= condMapEmpty!42139 (= (arr!34063 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12752)) mapDefault!42139)))))

(declare-fun b!1095106 () Bool)

(assert (=> b!1095106 (= e!625361 e!625356)))

(declare-fun res!730419 () Bool)

(assert (=> b!1095106 (=> (not res!730419) (not e!625356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70793 (_ BitVec 32)) Bool)

(assert (=> b!1095106 (= res!730419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489749 mask!1414))))

(assert (=> b!1095106 (= lt!489749 (array!70794 (store (arr!34064 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34601 _keys!1070)))))

(declare-fun b!1095107 () Bool)

(declare-fun res!730414 () Bool)

(assert (=> b!1095107 (=> (not res!730414) (not e!625361))))

(assert (=> b!1095107 (= res!730414 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34601 _keys!1070))))))

(declare-fun b!1095108 () Bool)

(declare-fun res!730420 () Bool)

(assert (=> b!1095108 (=> (not res!730420) (not e!625361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095108 (= res!730420 (validKeyInArray!0 k0!904))))

(declare-fun b!1095109 () Bool)

(assert (=> b!1095109 (= e!625358 tp_is_empty!26923)))

(declare-fun b!1095110 () Bool)

(declare-fun res!730416 () Bool)

(assert (=> b!1095110 (=> (not res!730416) (not e!625361))))

(assert (=> b!1095110 (= res!730416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42139 () Bool)

(assert (=> mapIsEmpty!42139 mapRes!42139))

(declare-fun b!1095111 () Bool)

(declare-fun res!730417 () Bool)

(assert (=> b!1095111 (=> (not res!730417) (not e!625361))))

(assert (=> b!1095111 (= res!730417 (= (select (arr!34064 _keys!1070) i!650) k0!904))))

(assert (= (and start!96504 res!730422) b!1095102))

(assert (= (and b!1095102 res!730418) b!1095110))

(assert (= (and b!1095110 res!730416) b!1095101))

(assert (= (and b!1095101 res!730421) b!1095107))

(assert (= (and b!1095107 res!730414) b!1095108))

(assert (= (and b!1095108 res!730420) b!1095111))

(assert (= (and b!1095111 res!730417) b!1095106))

(assert (= (and b!1095106 res!730419) b!1095103))

(assert (= (and b!1095103 res!730415) b!1095104))

(assert (= (and b!1095105 condMapEmpty!42139) mapIsEmpty!42139))

(assert (= (and b!1095105 (not condMapEmpty!42139)) mapNonEmpty!42139))

(get-info :version)

(assert (= (and mapNonEmpty!42139 ((_ is ValueCellFull!12752) mapValue!42139)) b!1095100))

(assert (= (and b!1095105 ((_ is ValueCellFull!12752) mapDefault!42139)) b!1095109))

(assert (= start!96504 b!1095105))

(declare-fun b_lambda!17601 () Bool)

(assert (=> (not b_lambda!17601) (not b!1095104)))

(declare-fun t!33771 () Bool)

(declare-fun tb!7791 () Bool)

(assert (=> (and start!96504 (= defaultEntry!882 defaultEntry!882) t!33771) tb!7791))

(declare-fun result!16109 () Bool)

(assert (=> tb!7791 (= result!16109 tp_is_empty!26923)))

(assert (=> b!1095104 t!33771))

(declare-fun b_and!36529 () Bool)

(assert (= b_and!36527 (and (=> t!33771 result!16109) b_and!36529)))

(declare-fun m!1015349 () Bool)

(assert (=> b!1095103 m!1015349))

(declare-fun m!1015351 () Bool)

(assert (=> mapNonEmpty!42139 m!1015351))

(declare-fun m!1015353 () Bool)

(assert (=> b!1095104 m!1015353))

(declare-fun m!1015355 () Bool)

(assert (=> b!1095104 m!1015355))

(declare-fun m!1015357 () Bool)

(assert (=> b!1095104 m!1015357))

(declare-fun m!1015359 () Bool)

(assert (=> b!1095104 m!1015359))

(declare-fun m!1015361 () Bool)

(assert (=> b!1095104 m!1015361))

(declare-fun m!1015363 () Bool)

(assert (=> b!1095104 m!1015363))

(declare-fun m!1015365 () Bool)

(assert (=> b!1095104 m!1015365))

(declare-fun m!1015367 () Bool)

(assert (=> b!1095104 m!1015367))

(declare-fun m!1015369 () Bool)

(assert (=> b!1095104 m!1015369))

(declare-fun m!1015371 () Bool)

(assert (=> b!1095104 m!1015371))

(declare-fun m!1015373 () Bool)

(assert (=> b!1095106 m!1015373))

(declare-fun m!1015375 () Bool)

(assert (=> b!1095106 m!1015375))

(declare-fun m!1015377 () Bool)

(assert (=> start!96504 m!1015377))

(declare-fun m!1015379 () Bool)

(assert (=> start!96504 m!1015379))

(declare-fun m!1015381 () Bool)

(assert (=> start!96504 m!1015381))

(declare-fun m!1015383 () Bool)

(assert (=> b!1095111 m!1015383))

(declare-fun m!1015385 () Bool)

(assert (=> b!1095110 m!1015385))

(declare-fun m!1015387 () Bool)

(assert (=> b!1095108 m!1015387))

(declare-fun m!1015389 () Bool)

(assert (=> b!1095101 m!1015389))

(check-sat (not b_next!22921) (not b!1095104) (not b!1095106) (not b!1095110) b_and!36529 (not start!96504) (not b_lambda!17601) tp_is_empty!26923 (not mapNonEmpty!42139) (not b!1095108) (not b!1095101) (not b!1095103))
(check-sat b_and!36529 (not b_next!22921))
