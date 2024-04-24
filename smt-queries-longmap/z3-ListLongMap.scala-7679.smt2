; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96656 () Bool)

(assert start!96656)

(declare-fun b_free!22999 () Bool)

(declare-fun b_next!22999 () Bool)

(assert (=> start!96656 (= b_free!22999 (not b_next!22999))))

(declare-fun tp!80924 () Bool)

(declare-fun b_and!36671 () Bool)

(assert (=> start!96656 (= tp!80924 b_and!36671)))

(declare-fun b!1097393 () Bool)

(declare-fun res!732032 () Bool)

(declare-fun e!626542 () Bool)

(assert (=> b!1097393 (=> (not res!732032) (not e!626542))))

(declare-datatypes ((array!71039 0))(
  ( (array!71040 (arr!34185 (Array (_ BitVec 32) (_ BitVec 64))) (size!34722 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71039)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71039 (_ BitVec 32)) Bool)

(assert (=> b!1097393 (= res!732032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!732028 () Bool)

(assert (=> start!96656 (=> (not res!732028) (not e!626542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96656 (= res!732028 (validMask!0 mask!1414))))

(assert (=> start!96656 e!626542))

(assert (=> start!96656 tp!80924))

(assert (=> start!96656 true))

(declare-fun tp_is_empty!27049 () Bool)

(assert (=> start!96656 tp_is_empty!27049))

(declare-fun array_inv!26374 (array!71039) Bool)

(assert (=> start!96656 (array_inv!26374 _keys!1070)))

(declare-datatypes ((V!41193 0))(
  ( (V!41194 (val!13581 Int)) )
))
(declare-datatypes ((ValueCell!12815 0))(
  ( (ValueCellFull!12815 (v!16198 V!41193)) (EmptyCell!12815) )
))
(declare-datatypes ((array!71041 0))(
  ( (array!71042 (arr!34186 (Array (_ BitVec 32) ValueCell!12815)) (size!34723 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71041)

(declare-fun e!626540 () Bool)

(declare-fun array_inv!26375 (array!71041) Bool)

(assert (=> start!96656 (and (array_inv!26375 _values!874) e!626540)))

(declare-fun b!1097394 () Bool)

(declare-fun res!732033 () Bool)

(assert (=> b!1097394 (=> (not res!732033) (not e!626542))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097394 (= res!732033 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42334 () Bool)

(declare-fun mapRes!42334 () Bool)

(assert (=> mapIsEmpty!42334 mapRes!42334))

(declare-fun mapNonEmpty!42334 () Bool)

(declare-fun tp!80923 () Bool)

(declare-fun e!626537 () Bool)

(assert (=> mapNonEmpty!42334 (= mapRes!42334 (and tp!80923 e!626537))))

(declare-fun mapKey!42334 () (_ BitVec 32))

(declare-fun mapRest!42334 () (Array (_ BitVec 32) ValueCell!12815))

(declare-fun mapValue!42334 () ValueCell!12815)

(assert (=> mapNonEmpty!42334 (= (arr!34186 _values!874) (store mapRest!42334 mapKey!42334 mapValue!42334))))

(declare-fun b!1097395 () Bool)

(declare-fun e!626539 () Bool)

(assert (=> b!1097395 (= e!626542 e!626539)))

(declare-fun res!732026 () Bool)

(assert (=> b!1097395 (=> (not res!732026) (not e!626539))))

(declare-fun lt!490547 () array!71039)

(assert (=> b!1097395 (= res!732026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490547 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097395 (= lt!490547 (array!71040 (store (arr!34185 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34722 _keys!1070)))))

(declare-fun b!1097396 () Bool)

(assert (=> b!1097396 (= e!626537 tp_is_empty!27049)))

(declare-fun b!1097397 () Bool)

(declare-fun res!732029 () Bool)

(assert (=> b!1097397 (=> (not res!732029) (not e!626542))))

(assert (=> b!1097397 (= res!732029 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34722 _keys!1070))))))

(declare-fun b!1097398 () Bool)

(declare-fun e!626541 () Bool)

(assert (=> b!1097398 (= e!626541 tp_is_empty!27049)))

(declare-fun b!1097399 () Bool)

(declare-fun res!732027 () Bool)

(assert (=> b!1097399 (=> (not res!732027) (not e!626542))))

(declare-datatypes ((List!23877 0))(
  ( (Nil!23874) (Cons!23873 (h!25091 (_ BitVec 64)) (t!33914 List!23877)) )
))
(declare-fun arrayNoDuplicates!0 (array!71039 (_ BitVec 32) List!23877) Bool)

(assert (=> b!1097399 (= res!732027 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23874))))

(declare-fun b!1097400 () Bool)

(assert (=> b!1097400 (= e!626540 (and e!626541 mapRes!42334))))

(declare-fun condMapEmpty!42334 () Bool)

(declare-fun mapDefault!42334 () ValueCell!12815)

(assert (=> b!1097400 (= condMapEmpty!42334 (= (arr!34186 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12815)) mapDefault!42334)))))

(declare-fun b!1097401 () Bool)

(declare-fun res!732031 () Bool)

(assert (=> b!1097401 (=> (not res!732031) (not e!626539))))

(assert (=> b!1097401 (= res!732031 (arrayNoDuplicates!0 lt!490547 #b00000000000000000000000000000000 Nil!23874))))

(declare-fun b!1097402 () Bool)

(declare-fun res!732030 () Bool)

(assert (=> b!1097402 (=> (not res!732030) (not e!626542))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097402 (= res!732030 (and (= (size!34723 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34722 _keys!1070) (size!34723 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097403 () Bool)

(assert (=> b!1097403 (= e!626539 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41193)

(declare-datatypes ((tuple2!17256 0))(
  ( (tuple2!17257 (_1!8639 (_ BitVec 64)) (_2!8639 V!41193)) )
))
(declare-datatypes ((List!23878 0))(
  ( (Nil!23875) (Cons!23874 (h!25092 tuple2!17256) (t!33915 List!23878)) )
))
(declare-datatypes ((ListLongMap!15233 0))(
  ( (ListLongMap!15234 (toList!7632 List!23878)) )
))
(declare-fun lt!490546 () ListLongMap!15233)

(declare-fun zeroValue!831 () V!41193)

(declare-fun getCurrentListMapNoExtraKeys!4185 (array!71039 array!71041 (_ BitVec 32) (_ BitVec 32) V!41193 V!41193 (_ BitVec 32) Int) ListLongMap!15233)

(declare-fun dynLambda!2303 (Int (_ BitVec 64)) V!41193)

(assert (=> b!1097403 (= lt!490546 (getCurrentListMapNoExtraKeys!4185 lt!490547 (array!71042 (store (arr!34186 _values!874) i!650 (ValueCellFull!12815 (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34723 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490548 () ListLongMap!15233)

(assert (=> b!1097403 (= lt!490548 (getCurrentListMapNoExtraKeys!4185 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097403 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36051 0))(
  ( (Unit!36052) )
))
(declare-fun lt!490545 () Unit!36051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71039 (_ BitVec 64) (_ BitVec 32)) Unit!36051)

(assert (=> b!1097403 (= lt!490545 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097404 () Bool)

(declare-fun res!732034 () Bool)

(assert (=> b!1097404 (=> (not res!732034) (not e!626542))))

(assert (=> b!1097404 (= res!732034 (= (select (arr!34185 _keys!1070) i!650) k0!904))))

(assert (= (and start!96656 res!732028) b!1097402))

(assert (= (and b!1097402 res!732030) b!1097393))

(assert (= (and b!1097393 res!732032) b!1097399))

(assert (= (and b!1097399 res!732027) b!1097397))

(assert (= (and b!1097397 res!732029) b!1097394))

(assert (= (and b!1097394 res!732033) b!1097404))

(assert (= (and b!1097404 res!732034) b!1097395))

(assert (= (and b!1097395 res!732026) b!1097401))

(assert (= (and b!1097401 res!732031) b!1097403))

(assert (= (and b!1097400 condMapEmpty!42334) mapIsEmpty!42334))

(assert (= (and b!1097400 (not condMapEmpty!42334)) mapNonEmpty!42334))

(get-info :version)

(assert (= (and mapNonEmpty!42334 ((_ is ValueCellFull!12815) mapValue!42334)) b!1097396))

(assert (= (and b!1097400 ((_ is ValueCellFull!12815) mapDefault!42334)) b!1097398))

(assert (= start!96656 b!1097400))

(declare-fun b_lambda!17667 () Bool)

(assert (=> (not b_lambda!17667) (not b!1097403)))

(declare-fun t!33913 () Bool)

(declare-fun tb!7857 () Bool)

(assert (=> (and start!96656 (= defaultEntry!882 defaultEntry!882) t!33913) tb!7857))

(declare-fun result!16245 () Bool)

(assert (=> tb!7857 (= result!16245 tp_is_empty!27049)))

(assert (=> b!1097403 t!33913))

(declare-fun b_and!36673 () Bool)

(assert (= b_and!36671 (and (=> t!33913 result!16245) b_and!36673)))

(declare-fun m!1017309 () Bool)

(assert (=> start!96656 m!1017309))

(declare-fun m!1017311 () Bool)

(assert (=> start!96656 m!1017311))

(declare-fun m!1017313 () Bool)

(assert (=> start!96656 m!1017313))

(declare-fun m!1017315 () Bool)

(assert (=> b!1097393 m!1017315))

(declare-fun m!1017317 () Bool)

(assert (=> b!1097394 m!1017317))

(declare-fun m!1017319 () Bool)

(assert (=> b!1097395 m!1017319))

(declare-fun m!1017321 () Bool)

(assert (=> b!1097395 m!1017321))

(declare-fun m!1017323 () Bool)

(assert (=> b!1097403 m!1017323))

(declare-fun m!1017325 () Bool)

(assert (=> b!1097403 m!1017325))

(declare-fun m!1017327 () Bool)

(assert (=> b!1097403 m!1017327))

(declare-fun m!1017329 () Bool)

(assert (=> b!1097403 m!1017329))

(declare-fun m!1017331 () Bool)

(assert (=> b!1097403 m!1017331))

(declare-fun m!1017333 () Bool)

(assert (=> b!1097403 m!1017333))

(declare-fun m!1017335 () Bool)

(assert (=> b!1097399 m!1017335))

(declare-fun m!1017337 () Bool)

(assert (=> mapNonEmpty!42334 m!1017337))

(declare-fun m!1017339 () Bool)

(assert (=> b!1097404 m!1017339))

(declare-fun m!1017341 () Bool)

(assert (=> b!1097401 m!1017341))

(check-sat (not b_next!22999) (not b!1097395) (not mapNonEmpty!42334) (not b!1097401) (not b!1097394) (not b_lambda!17667) (not start!96656) b_and!36673 (not b!1097399) tp_is_empty!27049 (not b!1097403) (not b!1097393))
(check-sat b_and!36673 (not b_next!22999))
