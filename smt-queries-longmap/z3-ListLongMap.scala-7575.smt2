; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95764 () Bool)

(assert start!95764)

(declare-fun b_free!22423 () Bool)

(declare-fun b_next!22423 () Bool)

(assert (=> start!95764 (= b_free!22423 (not b_next!22423))))

(declare-fun tp!79118 () Bool)

(declare-fun b_and!35495 () Bool)

(assert (=> start!95764 (= tp!79118 b_and!35495)))

(declare-fun b!1083096 () Bool)

(declare-fun e!618893 () Bool)

(declare-fun tp_is_empty!26425 () Bool)

(assert (=> b!1083096 (= e!618893 tp_is_empty!26425)))

(declare-fun mapIsEmpty!41392 () Bool)

(declare-fun mapRes!41392 () Bool)

(assert (=> mapIsEmpty!41392 mapRes!41392))

(declare-fun b!1083097 () Bool)

(declare-fun e!618894 () Bool)

(declare-fun e!618891 () Bool)

(assert (=> b!1083097 (= e!618894 (and e!618891 mapRes!41392))))

(declare-fun condMapEmpty!41392 () Bool)

(declare-datatypes ((V!40361 0))(
  ( (V!40362 (val!13269 Int)) )
))
(declare-datatypes ((ValueCell!12503 0))(
  ( (ValueCellFull!12503 (v!15889 V!40361)) (EmptyCell!12503) )
))
(declare-datatypes ((array!69720 0))(
  ( (array!69721 (arr!33534 (Array (_ BitVec 32) ValueCell!12503)) (size!34072 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69720)

(declare-fun mapDefault!41392 () ValueCell!12503)

(assert (=> b!1083097 (= condMapEmpty!41392 (= (arr!33534 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12503)) mapDefault!41392)))))

(declare-fun b!1083098 () Bool)

(declare-fun res!722041 () Bool)

(declare-fun e!618895 () Bool)

(assert (=> b!1083098 (=> (not res!722041) (not e!618895))))

(declare-datatypes ((array!69722 0))(
  ( (array!69723 (arr!33535 (Array (_ BitVec 32) (_ BitVec 64))) (size!34073 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69722)

(declare-datatypes ((List!23442 0))(
  ( (Nil!23439) (Cons!23438 (h!24647 (_ BitVec 64)) (t!32914 List!23442)) )
))
(declare-fun arrayNoDuplicates!0 (array!69722 (_ BitVec 32) List!23442) Bool)

(assert (=> b!1083098 (= res!722041 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23439))))

(declare-fun mapNonEmpty!41392 () Bool)

(declare-fun tp!79117 () Bool)

(assert (=> mapNonEmpty!41392 (= mapRes!41392 (and tp!79117 e!618893))))

(declare-fun mapKey!41392 () (_ BitVec 32))

(declare-fun mapValue!41392 () ValueCell!12503)

(declare-fun mapRest!41392 () (Array (_ BitVec 32) ValueCell!12503))

(assert (=> mapNonEmpty!41392 (= (arr!33534 _values!874) (store mapRest!41392 mapKey!41392 mapValue!41392))))

(declare-fun b!1083099 () Bool)

(declare-fun e!618892 () Bool)

(assert (=> b!1083099 (= e!618892 (not true))))

(declare-datatypes ((tuple2!16874 0))(
  ( (tuple2!16875 (_1!8448 (_ BitVec 64)) (_2!8448 V!40361)) )
))
(declare-datatypes ((List!23443 0))(
  ( (Nil!23440) (Cons!23439 (h!24648 tuple2!16874) (t!32915 List!23443)) )
))
(declare-datatypes ((ListLongMap!14843 0))(
  ( (ListLongMap!14844 (toList!7437 List!23443)) )
))
(declare-fun lt!479789 () ListLongMap!14843)

(declare-fun lt!479787 () ListLongMap!14843)

(assert (=> b!1083099 (and (= lt!479789 lt!479787) (= lt!479787 lt!479789))))

(declare-fun lt!479786 () ListLongMap!14843)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!716 (ListLongMap!14843 (_ BitVec 64)) ListLongMap!14843)

(assert (=> b!1083099 (= lt!479787 (-!716 lt!479786 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40361)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35467 0))(
  ( (Unit!35468) )
))
(declare-fun lt!479785 () Unit!35467)

(declare-fun zeroValue!831 () V!40361)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!14 (array!69722 array!69720 (_ BitVec 32) (_ BitVec 32) V!40361 V!40361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35467)

(assert (=> b!1083099 (= lt!479785 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!14 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479788 () array!69722)

(declare-fun getCurrentListMapNoExtraKeys!4000 (array!69722 array!69720 (_ BitVec 32) (_ BitVec 32) V!40361 V!40361 (_ BitVec 32) Int) ListLongMap!14843)

(declare-fun dynLambda!2071 (Int (_ BitVec 64)) V!40361)

(assert (=> b!1083099 (= lt!479789 (getCurrentListMapNoExtraKeys!4000 lt!479788 (array!69721 (store (arr!33534 _values!874) i!650 (ValueCellFull!12503 (dynLambda!2071 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34072 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083099 (= lt!479786 (getCurrentListMapNoExtraKeys!4000 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083099 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479784 () Unit!35467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69722 (_ BitVec 64) (_ BitVec 32)) Unit!35467)

(assert (=> b!1083099 (= lt!479784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083100 () Bool)

(declare-fun res!722046 () Bool)

(assert (=> b!1083100 (=> (not res!722046) (not e!618892))))

(assert (=> b!1083100 (= res!722046 (arrayNoDuplicates!0 lt!479788 #b00000000000000000000000000000000 Nil!23439))))

(declare-fun b!1083101 () Bool)

(assert (=> b!1083101 (= e!618895 e!618892)))

(declare-fun res!722039 () Bool)

(assert (=> b!1083101 (=> (not res!722039) (not e!618892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69722 (_ BitVec 32)) Bool)

(assert (=> b!1083101 (= res!722039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479788 mask!1414))))

(assert (=> b!1083101 (= lt!479788 (array!69723 (store (arr!33535 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34073 _keys!1070)))))

(declare-fun res!722043 () Bool)

(assert (=> start!95764 (=> (not res!722043) (not e!618895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95764 (= res!722043 (validMask!0 mask!1414))))

(assert (=> start!95764 e!618895))

(assert (=> start!95764 tp!79118))

(assert (=> start!95764 true))

(assert (=> start!95764 tp_is_empty!26425))

(declare-fun array_inv!25926 (array!69722) Bool)

(assert (=> start!95764 (array_inv!25926 _keys!1070)))

(declare-fun array_inv!25927 (array!69720) Bool)

(assert (=> start!95764 (and (array_inv!25927 _values!874) e!618894)))

(declare-fun b!1083102 () Bool)

(assert (=> b!1083102 (= e!618891 tp_is_empty!26425)))

(declare-fun b!1083103 () Bool)

(declare-fun res!722040 () Bool)

(assert (=> b!1083103 (=> (not res!722040) (not e!618895))))

(assert (=> b!1083103 (= res!722040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083104 () Bool)

(declare-fun res!722038 () Bool)

(assert (=> b!1083104 (=> (not res!722038) (not e!618895))))

(assert (=> b!1083104 (= res!722038 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34073 _keys!1070))))))

(declare-fun b!1083105 () Bool)

(declare-fun res!722042 () Bool)

(assert (=> b!1083105 (=> (not res!722042) (not e!618895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083105 (= res!722042 (validKeyInArray!0 k0!904))))

(declare-fun b!1083106 () Bool)

(declare-fun res!722044 () Bool)

(assert (=> b!1083106 (=> (not res!722044) (not e!618895))))

(assert (=> b!1083106 (= res!722044 (= (select (arr!33535 _keys!1070) i!650) k0!904))))

(declare-fun b!1083107 () Bool)

(declare-fun res!722045 () Bool)

(assert (=> b!1083107 (=> (not res!722045) (not e!618895))))

(assert (=> b!1083107 (= res!722045 (and (= (size!34072 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34073 _keys!1070) (size!34072 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95764 res!722043) b!1083107))

(assert (= (and b!1083107 res!722045) b!1083103))

(assert (= (and b!1083103 res!722040) b!1083098))

(assert (= (and b!1083098 res!722041) b!1083104))

(assert (= (and b!1083104 res!722038) b!1083105))

(assert (= (and b!1083105 res!722042) b!1083106))

(assert (= (and b!1083106 res!722044) b!1083101))

(assert (= (and b!1083101 res!722039) b!1083100))

(assert (= (and b!1083100 res!722046) b!1083099))

(assert (= (and b!1083097 condMapEmpty!41392) mapIsEmpty!41392))

(assert (= (and b!1083097 (not condMapEmpty!41392)) mapNonEmpty!41392))

(get-info :version)

(assert (= (and mapNonEmpty!41392 ((_ is ValueCellFull!12503) mapValue!41392)) b!1083096))

(assert (= (and b!1083097 ((_ is ValueCellFull!12503) mapDefault!41392)) b!1083102))

(assert (= start!95764 b!1083097))

(declare-fun b_lambda!17071 () Bool)

(assert (=> (not b_lambda!17071) (not b!1083099)))

(declare-fun t!32913 () Bool)

(declare-fun tb!7293 () Bool)

(assert (=> (and start!95764 (= defaultEntry!882 defaultEntry!882) t!32913) tb!7293))

(declare-fun result!15113 () Bool)

(assert (=> tb!7293 (= result!15113 tp_is_empty!26425)))

(assert (=> b!1083099 t!32913))

(declare-fun b_and!35497 () Bool)

(assert (= b_and!35495 (and (=> t!32913 result!15113) b_and!35497)))

(declare-fun m!1000295 () Bool)

(assert (=> start!95764 m!1000295))

(declare-fun m!1000297 () Bool)

(assert (=> start!95764 m!1000297))

(declare-fun m!1000299 () Bool)

(assert (=> start!95764 m!1000299))

(declare-fun m!1000301 () Bool)

(assert (=> b!1083103 m!1000301))

(declare-fun m!1000303 () Bool)

(assert (=> b!1083105 m!1000303))

(declare-fun m!1000305 () Bool)

(assert (=> b!1083106 m!1000305))

(declare-fun m!1000307 () Bool)

(assert (=> mapNonEmpty!41392 m!1000307))

(declare-fun m!1000309 () Bool)

(assert (=> b!1083100 m!1000309))

(declare-fun m!1000311 () Bool)

(assert (=> b!1083101 m!1000311))

(declare-fun m!1000313 () Bool)

(assert (=> b!1083101 m!1000313))

(declare-fun m!1000315 () Bool)

(assert (=> b!1083099 m!1000315))

(declare-fun m!1000317 () Bool)

(assert (=> b!1083099 m!1000317))

(declare-fun m!1000319 () Bool)

(assert (=> b!1083099 m!1000319))

(declare-fun m!1000321 () Bool)

(assert (=> b!1083099 m!1000321))

(declare-fun m!1000323 () Bool)

(assert (=> b!1083099 m!1000323))

(declare-fun m!1000325 () Bool)

(assert (=> b!1083099 m!1000325))

(declare-fun m!1000327 () Bool)

(assert (=> b!1083099 m!1000327))

(declare-fun m!1000329 () Bool)

(assert (=> b!1083099 m!1000329))

(declare-fun m!1000331 () Bool)

(assert (=> b!1083098 m!1000331))

(check-sat (not b!1083105) (not b!1083103) (not b!1083098) (not b_next!22423) (not b!1083099) tp_is_empty!26425 (not mapNonEmpty!41392) b_and!35497 (not b_lambda!17071) (not start!95764) (not b!1083100) (not b!1083101))
(check-sat b_and!35497 (not b_next!22423))
