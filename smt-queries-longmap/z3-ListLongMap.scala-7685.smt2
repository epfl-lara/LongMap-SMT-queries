; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96458 () Bool)

(assert start!96458)

(declare-fun b_free!23037 () Bool)

(declare-fun b_next!23037 () Bool)

(assert (=> start!96458 (= b_free!23037 (not b_next!23037))))

(declare-fun tp!81038 () Bool)

(declare-fun b_and!36737 () Bool)

(assert (=> start!96458 (= tp!81038 b_and!36737)))

(declare-fun b!1096788 () Bool)

(declare-fun res!732024 () Bool)

(declare-fun e!626026 () Bool)

(assert (=> b!1096788 (=> (not res!732024) (not e!626026))))

(declare-datatypes ((array!71087 0))(
  ( (array!71088 (arr!34215 (Array (_ BitVec 32) (_ BitVec 64))) (size!34751 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71087)

(declare-datatypes ((List!23894 0))(
  ( (Nil!23891) (Cons!23890 (h!25099 (_ BitVec 64)) (t!33977 List!23894)) )
))
(declare-fun arrayNoDuplicates!0 (array!71087 (_ BitVec 32) List!23894) Bool)

(assert (=> b!1096788 (= res!732024 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23891))))

(declare-fun b!1096789 () Bool)

(declare-fun res!732017 () Bool)

(assert (=> b!1096789 (=> (not res!732017) (not e!626026))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096789 (= res!732017 (validKeyInArray!0 k0!904))))

(declare-fun b!1096790 () Bool)

(declare-fun res!732022 () Bool)

(assert (=> b!1096790 (=> (not res!732022) (not e!626026))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096790 (= res!732022 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34751 _keys!1070))))))

(declare-fun b!1096791 () Bool)

(declare-fun res!732023 () Bool)

(assert (=> b!1096791 (=> (not res!732023) (not e!626026))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71087 (_ BitVec 32)) Bool)

(assert (=> b!1096791 (= res!732023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096792 () Bool)

(declare-fun res!732018 () Bool)

(assert (=> b!1096792 (=> (not res!732018) (not e!626026))))

(declare-datatypes ((V!41243 0))(
  ( (V!41244 (val!13600 Int)) )
))
(declare-datatypes ((ValueCell!12834 0))(
  ( (ValueCellFull!12834 (v!16221 V!41243)) (EmptyCell!12834) )
))
(declare-datatypes ((array!71089 0))(
  ( (array!71090 (arr!34216 (Array (_ BitVec 32) ValueCell!12834)) (size!34752 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71089)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096792 (= res!732018 (and (= (size!34752 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34751 _keys!1070) (size!34752 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096793 () Bool)

(declare-fun res!732019 () Bool)

(declare-fun e!626027 () Bool)

(assert (=> b!1096793 (=> (not res!732019) (not e!626027))))

(declare-fun lt!490258 () array!71087)

(assert (=> b!1096793 (= res!732019 (arrayNoDuplicates!0 lt!490258 #b00000000000000000000000000000000 Nil!23891))))

(declare-fun res!732020 () Bool)

(assert (=> start!96458 (=> (not res!732020) (not e!626026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96458 (= res!732020 (validMask!0 mask!1414))))

(assert (=> start!96458 e!626026))

(assert (=> start!96458 tp!81038))

(assert (=> start!96458 true))

(declare-fun tp_is_empty!27087 () Bool)

(assert (=> start!96458 tp_is_empty!27087))

(declare-fun array_inv!26360 (array!71087) Bool)

(assert (=> start!96458 (array_inv!26360 _keys!1070)))

(declare-fun e!626025 () Bool)

(declare-fun array_inv!26361 (array!71089) Bool)

(assert (=> start!96458 (and (array_inv!26361 _values!874) e!626025)))

(declare-fun mapIsEmpty!42391 () Bool)

(declare-fun mapRes!42391 () Bool)

(assert (=> mapIsEmpty!42391 mapRes!42391))

(declare-fun b!1096794 () Bool)

(assert (=> b!1096794 (= e!626027 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41243)

(declare-datatypes ((tuple2!17270 0))(
  ( (tuple2!17271 (_1!8646 (_ BitVec 64)) (_2!8646 V!41243)) )
))
(declare-datatypes ((List!23895 0))(
  ( (Nil!23892) (Cons!23891 (h!25100 tuple2!17270) (t!33978 List!23895)) )
))
(declare-datatypes ((ListLongMap!15239 0))(
  ( (ListLongMap!15240 (toList!7635 List!23895)) )
))
(declare-fun lt!490261 () ListLongMap!15239)

(declare-fun zeroValue!831 () V!41243)

(declare-fun getCurrentListMapNoExtraKeys!4151 (array!71087 array!71089 (_ BitVec 32) (_ BitVec 32) V!41243 V!41243 (_ BitVec 32) Int) ListLongMap!15239)

(declare-fun dynLambda!2286 (Int (_ BitVec 64)) V!41243)

(assert (=> b!1096794 (= lt!490261 (getCurrentListMapNoExtraKeys!4151 lt!490258 (array!71090 (store (arr!34216 _values!874) i!650 (ValueCellFull!12834 (dynLambda!2286 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34752 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490259 () ListLongMap!15239)

(assert (=> b!1096794 (= lt!490259 (getCurrentListMapNoExtraKeys!4151 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096794 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36082 0))(
  ( (Unit!36083) )
))
(declare-fun lt!490260 () Unit!36082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71087 (_ BitVec 64) (_ BitVec 32)) Unit!36082)

(assert (=> b!1096794 (= lt!490260 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096795 () Bool)

(declare-fun e!626028 () Bool)

(assert (=> b!1096795 (= e!626025 (and e!626028 mapRes!42391))))

(declare-fun condMapEmpty!42391 () Bool)

(declare-fun mapDefault!42391 () ValueCell!12834)

(assert (=> b!1096795 (= condMapEmpty!42391 (= (arr!34216 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12834)) mapDefault!42391)))))

(declare-fun b!1096796 () Bool)

(declare-fun res!732021 () Bool)

(assert (=> b!1096796 (=> (not res!732021) (not e!626026))))

(assert (=> b!1096796 (= res!732021 (= (select (arr!34215 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42391 () Bool)

(declare-fun tp!81037 () Bool)

(declare-fun e!626029 () Bool)

(assert (=> mapNonEmpty!42391 (= mapRes!42391 (and tp!81037 e!626029))))

(declare-fun mapRest!42391 () (Array (_ BitVec 32) ValueCell!12834))

(declare-fun mapKey!42391 () (_ BitVec 32))

(declare-fun mapValue!42391 () ValueCell!12834)

(assert (=> mapNonEmpty!42391 (= (arr!34216 _values!874) (store mapRest!42391 mapKey!42391 mapValue!42391))))

(declare-fun b!1096797 () Bool)

(assert (=> b!1096797 (= e!626029 tp_is_empty!27087)))

(declare-fun b!1096798 () Bool)

(assert (=> b!1096798 (= e!626026 e!626027)))

(declare-fun res!732025 () Bool)

(assert (=> b!1096798 (=> (not res!732025) (not e!626027))))

(assert (=> b!1096798 (= res!732025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490258 mask!1414))))

(assert (=> b!1096798 (= lt!490258 (array!71088 (store (arr!34215 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34751 _keys!1070)))))

(declare-fun b!1096799 () Bool)

(assert (=> b!1096799 (= e!626028 tp_is_empty!27087)))

(assert (= (and start!96458 res!732020) b!1096792))

(assert (= (and b!1096792 res!732018) b!1096791))

(assert (= (and b!1096791 res!732023) b!1096788))

(assert (= (and b!1096788 res!732024) b!1096790))

(assert (= (and b!1096790 res!732022) b!1096789))

(assert (= (and b!1096789 res!732017) b!1096796))

(assert (= (and b!1096796 res!732021) b!1096798))

(assert (= (and b!1096798 res!732025) b!1096793))

(assert (= (and b!1096793 res!732019) b!1096794))

(assert (= (and b!1096795 condMapEmpty!42391) mapIsEmpty!42391))

(assert (= (and b!1096795 (not condMapEmpty!42391)) mapNonEmpty!42391))

(get-info :version)

(assert (= (and mapNonEmpty!42391 ((_ is ValueCellFull!12834) mapValue!42391)) b!1096797))

(assert (= (and b!1096795 ((_ is ValueCellFull!12834) mapDefault!42391)) b!1096799))

(assert (= start!96458 b!1096795))

(declare-fun b_lambda!17695 () Bool)

(assert (=> (not b_lambda!17695) (not b!1096794)))

(declare-fun t!33976 () Bool)

(declare-fun tb!7903 () Bool)

(assert (=> (and start!96458 (= defaultEntry!882 defaultEntry!882) t!33976) tb!7903))

(declare-fun result!16329 () Bool)

(assert (=> tb!7903 (= result!16329 tp_is_empty!27087)))

(assert (=> b!1096794 t!33976))

(declare-fun b_and!36739 () Bool)

(assert (= b_and!36737 (and (=> t!33976 result!16329) b_and!36739)))

(declare-fun m!1016283 () Bool)

(assert (=> b!1096788 m!1016283))

(declare-fun m!1016285 () Bool)

(assert (=> mapNonEmpty!42391 m!1016285))

(declare-fun m!1016287 () Bool)

(assert (=> b!1096798 m!1016287))

(declare-fun m!1016289 () Bool)

(assert (=> b!1096798 m!1016289))

(declare-fun m!1016291 () Bool)

(assert (=> start!96458 m!1016291))

(declare-fun m!1016293 () Bool)

(assert (=> start!96458 m!1016293))

(declare-fun m!1016295 () Bool)

(assert (=> start!96458 m!1016295))

(declare-fun m!1016297 () Bool)

(assert (=> b!1096796 m!1016297))

(declare-fun m!1016299 () Bool)

(assert (=> b!1096793 m!1016299))

(declare-fun m!1016301 () Bool)

(assert (=> b!1096791 m!1016301))

(declare-fun m!1016303 () Bool)

(assert (=> b!1096794 m!1016303))

(declare-fun m!1016305 () Bool)

(assert (=> b!1096794 m!1016305))

(declare-fun m!1016307 () Bool)

(assert (=> b!1096794 m!1016307))

(declare-fun m!1016309 () Bool)

(assert (=> b!1096794 m!1016309))

(declare-fun m!1016311 () Bool)

(assert (=> b!1096794 m!1016311))

(declare-fun m!1016313 () Bool)

(assert (=> b!1096794 m!1016313))

(declare-fun m!1016315 () Bool)

(assert (=> b!1096789 m!1016315))

(check-sat tp_is_empty!27087 (not b!1096794) (not b!1096798) (not mapNonEmpty!42391) (not start!96458) (not b_lambda!17695) b_and!36739 (not b!1096788) (not b_next!23037) (not b!1096789) (not b!1096793) (not b!1096791))
(check-sat b_and!36739 (not b_next!23037))
