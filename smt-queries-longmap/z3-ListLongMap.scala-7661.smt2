; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96288 () Bool)

(assert start!96288)

(declare-fun b_free!22941 () Bool)

(declare-fun b_next!22941 () Bool)

(assert (=> start!96288 (= b_free!22941 (not b_next!22941))))

(declare-fun tp!80672 () Bool)

(declare-fun b_and!36557 () Bool)

(assert (=> start!96288 (= tp!80672 b_and!36557)))

(declare-fun b!1094153 () Bool)

(declare-fun e!624683 () Bool)

(declare-fun tp_is_empty!26943 () Bool)

(assert (=> b!1094153 (= e!624683 tp_is_empty!26943)))

(declare-fun res!730164 () Bool)

(declare-fun e!624682 () Bool)

(assert (=> start!96288 (=> (not res!730164) (not e!624682))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96288 (= res!730164 (validMask!0 mask!1414))))

(assert (=> start!96288 e!624682))

(assert (=> start!96288 tp!80672))

(assert (=> start!96288 true))

(assert (=> start!96288 tp_is_empty!26943))

(declare-datatypes ((array!70801 0))(
  ( (array!70802 (arr!34074 (Array (_ BitVec 32) (_ BitVec 64))) (size!34610 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70801)

(declare-fun array_inv!26262 (array!70801) Bool)

(assert (=> start!96288 (array_inv!26262 _keys!1070)))

(declare-datatypes ((V!41051 0))(
  ( (V!41052 (val!13528 Int)) )
))
(declare-datatypes ((ValueCell!12762 0))(
  ( (ValueCellFull!12762 (v!16149 V!41051)) (EmptyCell!12762) )
))
(declare-datatypes ((array!70803 0))(
  ( (array!70804 (arr!34075 (Array (_ BitVec 32) ValueCell!12762)) (size!34611 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70803)

(declare-fun e!624686 () Bool)

(declare-fun array_inv!26263 (array!70803) Bool)

(assert (=> start!96288 (and (array_inv!26263 _values!874) e!624686)))

(declare-fun b!1094154 () Bool)

(declare-fun e!624684 () Bool)

(assert (=> b!1094154 (= e!624684 tp_is_empty!26943)))

(declare-fun b!1094155 () Bool)

(declare-fun e!624685 () Bool)

(assert (=> b!1094155 (= e!624685 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17208 0))(
  ( (tuple2!17209 (_1!8615 (_ BitVec 64)) (_2!8615 V!41051)) )
))
(declare-datatypes ((List!23806 0))(
  ( (Nil!23803) (Cons!23802 (h!25011 tuple2!17208) (t!33805 List!23806)) )
))
(declare-datatypes ((ListLongMap!15177 0))(
  ( (ListLongMap!15178 (toList!7604 List!23806)) )
))
(declare-fun lt!489507 () ListLongMap!15177)

(declare-fun minValue!831 () V!41051)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41051)

(declare-fun getCurrentListMap!4360 (array!70801 array!70803 (_ BitVec 32) (_ BitVec 32) V!41051 V!41051 (_ BitVec 32) Int) ListLongMap!15177)

(assert (=> b!1094155 (= lt!489507 (getCurrentListMap!4360 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489510 () array!70803)

(declare-fun lt!489506 () array!70801)

(declare-fun lt!489503 () ListLongMap!15177)

(assert (=> b!1094155 (= lt!489503 (getCurrentListMap!4360 lt!489506 lt!489510 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489505 () ListLongMap!15177)

(declare-fun lt!489504 () ListLongMap!15177)

(assert (=> b!1094155 (and (= lt!489505 lt!489504) (= lt!489504 lt!489505))))

(declare-fun lt!489511 () ListLongMap!15177)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!923 (ListLongMap!15177 (_ BitVec 64)) ListLongMap!15177)

(assert (=> b!1094155 (= lt!489504 (-!923 lt!489511 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36012 0))(
  ( (Unit!36013) )
))
(declare-fun lt!489508 () Unit!36012)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!179 (array!70801 array!70803 (_ BitVec 32) (_ BitVec 32) V!41051 V!41051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36012)

(assert (=> b!1094155 (= lt!489508 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!179 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4120 (array!70801 array!70803 (_ BitVec 32) (_ BitVec 32) V!41051 V!41051 (_ BitVec 32) Int) ListLongMap!15177)

(assert (=> b!1094155 (= lt!489505 (getCurrentListMapNoExtraKeys!4120 lt!489506 lt!489510 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2257 (Int (_ BitVec 64)) V!41051)

(assert (=> b!1094155 (= lt!489510 (array!70804 (store (arr!34075 _values!874) i!650 (ValueCellFull!12762 (dynLambda!2257 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34611 _values!874)))))

(assert (=> b!1094155 (= lt!489511 (getCurrentListMapNoExtraKeys!4120 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094155 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489509 () Unit!36012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70801 (_ BitVec 64) (_ BitVec 32)) Unit!36012)

(assert (=> b!1094155 (= lt!489509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094156 () Bool)

(declare-fun res!730169 () Bool)

(assert (=> b!1094156 (=> (not res!730169) (not e!624682))))

(declare-datatypes ((List!23807 0))(
  ( (Nil!23804) (Cons!23803 (h!25012 (_ BitVec 64)) (t!33806 List!23807)) )
))
(declare-fun arrayNoDuplicates!0 (array!70801 (_ BitVec 32) List!23807) Bool)

(assert (=> b!1094156 (= res!730169 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23804))))

(declare-fun b!1094157 () Bool)

(declare-fun res!730170 () Bool)

(assert (=> b!1094157 (=> (not res!730170) (not e!624682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70801 (_ BitVec 32)) Bool)

(assert (=> b!1094157 (= res!730170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42169 () Bool)

(declare-fun mapRes!42169 () Bool)

(assert (=> mapIsEmpty!42169 mapRes!42169))

(declare-fun b!1094158 () Bool)

(declare-fun res!730166 () Bool)

(assert (=> b!1094158 (=> (not res!730166) (not e!624682))))

(assert (=> b!1094158 (= res!730166 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34610 _keys!1070))))))

(declare-fun b!1094159 () Bool)

(declare-fun res!730163 () Bool)

(assert (=> b!1094159 (=> (not res!730163) (not e!624682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094159 (= res!730163 (validKeyInArray!0 k0!904))))

(declare-fun b!1094160 () Bool)

(assert (=> b!1094160 (= e!624682 e!624685)))

(declare-fun res!730162 () Bool)

(assert (=> b!1094160 (=> (not res!730162) (not e!624685))))

(assert (=> b!1094160 (= res!730162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489506 mask!1414))))

(assert (=> b!1094160 (= lt!489506 (array!70802 (store (arr!34074 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34610 _keys!1070)))))

(declare-fun mapNonEmpty!42169 () Bool)

(declare-fun tp!80671 () Bool)

(assert (=> mapNonEmpty!42169 (= mapRes!42169 (and tp!80671 e!624684))))

(declare-fun mapRest!42169 () (Array (_ BitVec 32) ValueCell!12762))

(declare-fun mapValue!42169 () ValueCell!12762)

(declare-fun mapKey!42169 () (_ BitVec 32))

(assert (=> mapNonEmpty!42169 (= (arr!34075 _values!874) (store mapRest!42169 mapKey!42169 mapValue!42169))))

(declare-fun b!1094161 () Bool)

(declare-fun res!730165 () Bool)

(assert (=> b!1094161 (=> (not res!730165) (not e!624682))))

(assert (=> b!1094161 (= res!730165 (and (= (size!34611 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34610 _keys!1070) (size!34611 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094162 () Bool)

(declare-fun res!730168 () Bool)

(assert (=> b!1094162 (=> (not res!730168) (not e!624682))))

(assert (=> b!1094162 (= res!730168 (= (select (arr!34074 _keys!1070) i!650) k0!904))))

(declare-fun b!1094163 () Bool)

(declare-fun res!730167 () Bool)

(assert (=> b!1094163 (=> (not res!730167) (not e!624685))))

(assert (=> b!1094163 (= res!730167 (arrayNoDuplicates!0 lt!489506 #b00000000000000000000000000000000 Nil!23804))))

(declare-fun b!1094164 () Bool)

(assert (=> b!1094164 (= e!624686 (and e!624683 mapRes!42169))))

(declare-fun condMapEmpty!42169 () Bool)

(declare-fun mapDefault!42169 () ValueCell!12762)

(assert (=> b!1094164 (= condMapEmpty!42169 (= (arr!34075 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12762)) mapDefault!42169)))))

(assert (= (and start!96288 res!730164) b!1094161))

(assert (= (and b!1094161 res!730165) b!1094157))

(assert (= (and b!1094157 res!730170) b!1094156))

(assert (= (and b!1094156 res!730169) b!1094158))

(assert (= (and b!1094158 res!730166) b!1094159))

(assert (= (and b!1094159 res!730163) b!1094162))

(assert (= (and b!1094162 res!730168) b!1094160))

(assert (= (and b!1094160 res!730162) b!1094163))

(assert (= (and b!1094163 res!730167) b!1094155))

(assert (= (and b!1094164 condMapEmpty!42169) mapIsEmpty!42169))

(assert (= (and b!1094164 (not condMapEmpty!42169)) mapNonEmpty!42169))

(get-info :version)

(assert (= (and mapNonEmpty!42169 ((_ is ValueCellFull!12762) mapValue!42169)) b!1094154))

(assert (= (and b!1094164 ((_ is ValueCellFull!12762) mapDefault!42169)) b!1094153))

(assert (= start!96288 b!1094164))

(declare-fun b_lambda!17611 () Bool)

(assert (=> (not b_lambda!17611) (not b!1094155)))

(declare-fun t!33804 () Bool)

(declare-fun tb!7819 () Bool)

(assert (=> (and start!96288 (= defaultEntry!882 defaultEntry!882) t!33804) tb!7819))

(declare-fun result!16157 () Bool)

(assert (=> tb!7819 (= result!16157 tp_is_empty!26943)))

(assert (=> b!1094155 t!33804))

(declare-fun b_and!36559 () Bool)

(assert (= b_and!36557 (and (=> t!33804 result!16157) b_and!36559)))

(declare-fun m!1014097 () Bool)

(assert (=> b!1094163 m!1014097))

(declare-fun m!1014099 () Bool)

(assert (=> mapNonEmpty!42169 m!1014099))

(declare-fun m!1014101 () Bool)

(assert (=> b!1094159 m!1014101))

(declare-fun m!1014103 () Bool)

(assert (=> b!1094160 m!1014103))

(declare-fun m!1014105 () Bool)

(assert (=> b!1094160 m!1014105))

(declare-fun m!1014107 () Bool)

(assert (=> b!1094155 m!1014107))

(declare-fun m!1014109 () Bool)

(assert (=> b!1094155 m!1014109))

(declare-fun m!1014111 () Bool)

(assert (=> b!1094155 m!1014111))

(declare-fun m!1014113 () Bool)

(assert (=> b!1094155 m!1014113))

(declare-fun m!1014115 () Bool)

(assert (=> b!1094155 m!1014115))

(declare-fun m!1014117 () Bool)

(assert (=> b!1094155 m!1014117))

(declare-fun m!1014119 () Bool)

(assert (=> b!1094155 m!1014119))

(declare-fun m!1014121 () Bool)

(assert (=> b!1094155 m!1014121))

(declare-fun m!1014123 () Bool)

(assert (=> b!1094155 m!1014123))

(declare-fun m!1014125 () Bool)

(assert (=> b!1094155 m!1014125))

(declare-fun m!1014127 () Bool)

(assert (=> b!1094162 m!1014127))

(declare-fun m!1014129 () Bool)

(assert (=> start!96288 m!1014129))

(declare-fun m!1014131 () Bool)

(assert (=> start!96288 m!1014131))

(declare-fun m!1014133 () Bool)

(assert (=> start!96288 m!1014133))

(declare-fun m!1014135 () Bool)

(assert (=> b!1094156 m!1014135))

(declare-fun m!1014137 () Bool)

(assert (=> b!1094157 m!1014137))

(check-sat (not b!1094159) (not b!1094156) (not mapNonEmpty!42169) tp_is_empty!26943 (not b!1094163) (not start!96288) (not b!1094160) b_and!36559 (not b!1094155) (not b_lambda!17611) (not b_next!22941) (not b!1094157))
(check-sat b_and!36559 (not b_next!22941))
