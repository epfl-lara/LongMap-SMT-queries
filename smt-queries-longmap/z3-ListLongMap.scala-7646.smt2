; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96190 () Bool)

(assert start!96190)

(declare-fun b_free!22849 () Bool)

(declare-fun b_next!22849 () Bool)

(assert (=> start!96190 (= b_free!22849 (not b_next!22849))))

(declare-fun tp!80395 () Bool)

(declare-fun b_and!36347 () Bool)

(assert (=> start!96190 (= tp!80395 b_and!36347)))

(declare-fun b!1092252 () Bool)

(declare-fun res!728858 () Bool)

(declare-fun e!623765 () Bool)

(assert (=> b!1092252 (=> (not res!728858) (not e!623765))))

(declare-datatypes ((array!70536 0))(
  ( (array!70537 (arr!33942 (Array (_ BitVec 32) (_ BitVec 64))) (size!34480 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70536)

(declare-datatypes ((List!23772 0))(
  ( (Nil!23769) (Cons!23768 (h!24977 (_ BitVec 64)) (t!33670 List!23772)) )
))
(declare-fun arrayNoDuplicates!0 (array!70536 (_ BitVec 32) List!23772) Bool)

(assert (=> b!1092252 (= res!728858 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23769))))

(declare-fun b!1092253 () Bool)

(declare-fun e!623761 () Bool)

(declare-fun tp_is_empty!26851 () Bool)

(assert (=> b!1092253 (= e!623761 tp_is_empty!26851)))

(declare-fun b!1092254 () Bool)

(declare-fun res!728857 () Bool)

(assert (=> b!1092254 (=> (not res!728857) (not e!623765))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092254 (= res!728857 (validKeyInArray!0 k0!904))))

(declare-fun b!1092256 () Bool)

(declare-fun res!728851 () Bool)

(assert (=> b!1092256 (=> (not res!728851) (not e!623765))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092256 (= res!728851 (= (select (arr!33942 _keys!1070) i!650) k0!904))))

(declare-fun b!1092257 () Bool)

(declare-fun res!728859 () Bool)

(assert (=> b!1092257 (=> (not res!728859) (not e!623765))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40929 0))(
  ( (V!40930 (val!13482 Int)) )
))
(declare-datatypes ((ValueCell!12716 0))(
  ( (ValueCellFull!12716 (v!16102 V!40929)) (EmptyCell!12716) )
))
(declare-datatypes ((array!70538 0))(
  ( (array!70539 (arr!33943 (Array (_ BitVec 32) ValueCell!12716)) (size!34481 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70538)

(assert (=> b!1092257 (= res!728859 (and (= (size!34481 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34480 _keys!1070) (size!34481 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42031 () Bool)

(declare-fun mapRes!42031 () Bool)

(assert (=> mapIsEmpty!42031 mapRes!42031))

(declare-fun b!1092258 () Bool)

(declare-fun res!728856 () Bool)

(assert (=> b!1092258 (=> (not res!728856) (not e!623765))))

(assert (=> b!1092258 (= res!728856 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34480 _keys!1070))))))

(declare-fun b!1092259 () Bool)

(declare-fun e!623764 () Bool)

(declare-fun e!623760 () Bool)

(assert (=> b!1092259 (= e!623764 (and e!623760 mapRes!42031))))

(declare-fun condMapEmpty!42031 () Bool)

(declare-fun mapDefault!42031 () ValueCell!12716)

(assert (=> b!1092259 (= condMapEmpty!42031 (= (arr!33943 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12716)) mapDefault!42031)))))

(declare-fun b!1092260 () Bool)

(declare-fun e!623762 () Bool)

(assert (=> b!1092260 (= e!623762 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40929)

(declare-datatypes ((tuple2!17210 0))(
  ( (tuple2!17211 (_1!8616 (_ BitVec 64)) (_2!8616 V!40929)) )
))
(declare-datatypes ((List!23773 0))(
  ( (Nil!23770) (Cons!23769 (h!24978 tuple2!17210) (t!33671 List!23773)) )
))
(declare-datatypes ((ListLongMap!15179 0))(
  ( (ListLongMap!15180 (toList!7605 List!23773)) )
))
(declare-fun lt!488054 () ListLongMap!15179)

(declare-fun zeroValue!831 () V!40929)

(declare-fun getCurrentListMap!4268 (array!70536 array!70538 (_ BitVec 32) (_ BitVec 32) V!40929 V!40929 (_ BitVec 32) Int) ListLongMap!15179)

(assert (=> b!1092260 (= lt!488054 (getCurrentListMap!4268 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488055 () array!70538)

(declare-fun lt!488052 () ListLongMap!15179)

(declare-fun lt!488058 () array!70536)

(assert (=> b!1092260 (= lt!488052 (getCurrentListMap!4268 lt!488058 lt!488055 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488056 () ListLongMap!15179)

(declare-fun lt!488053 () ListLongMap!15179)

(assert (=> b!1092260 (and (= lt!488056 lt!488053) (= lt!488053 lt!488056))))

(declare-fun lt!488059 () ListLongMap!15179)

(declare-fun -!877 (ListLongMap!15179 (_ BitVec 64)) ListLongMap!15179)

(assert (=> b!1092260 (= lt!488053 (-!877 lt!488059 k0!904))))

(declare-datatypes ((Unit!35789 0))(
  ( (Unit!35790) )
))
(declare-fun lt!488057 () Unit!35789)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!152 (array!70536 array!70538 (_ BitVec 32) (_ BitVec 32) V!40929 V!40929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35789)

(assert (=> b!1092260 (= lt!488057 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!152 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4138 (array!70536 array!70538 (_ BitVec 32) (_ BitVec 32) V!40929 V!40929 (_ BitVec 32) Int) ListLongMap!15179)

(assert (=> b!1092260 (= lt!488056 (getCurrentListMapNoExtraKeys!4138 lt!488058 lt!488055 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2209 (Int (_ BitVec 64)) V!40929)

(assert (=> b!1092260 (= lt!488055 (array!70539 (store (arr!33943 _values!874) i!650 (ValueCellFull!12716 (dynLambda!2209 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34481 _values!874)))))

(assert (=> b!1092260 (= lt!488059 (getCurrentListMapNoExtraKeys!4138 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092260 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488060 () Unit!35789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70536 (_ BitVec 64) (_ BitVec 32)) Unit!35789)

(assert (=> b!1092260 (= lt!488060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092255 () Bool)

(assert (=> b!1092255 (= e!623760 tp_is_empty!26851)))

(declare-fun res!728855 () Bool)

(assert (=> start!96190 (=> (not res!728855) (not e!623765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96190 (= res!728855 (validMask!0 mask!1414))))

(assert (=> start!96190 e!623765))

(assert (=> start!96190 tp!80395))

(assert (=> start!96190 true))

(assert (=> start!96190 tp_is_empty!26851))

(declare-fun array_inv!26204 (array!70536) Bool)

(assert (=> start!96190 (array_inv!26204 _keys!1070)))

(declare-fun array_inv!26205 (array!70538) Bool)

(assert (=> start!96190 (and (array_inv!26205 _values!874) e!623764)))

(declare-fun b!1092261 () Bool)

(declare-fun res!728854 () Bool)

(assert (=> b!1092261 (=> (not res!728854) (not e!623762))))

(assert (=> b!1092261 (= res!728854 (arrayNoDuplicates!0 lt!488058 #b00000000000000000000000000000000 Nil!23769))))

(declare-fun mapNonEmpty!42031 () Bool)

(declare-fun tp!80396 () Bool)

(assert (=> mapNonEmpty!42031 (= mapRes!42031 (and tp!80396 e!623761))))

(declare-fun mapRest!42031 () (Array (_ BitVec 32) ValueCell!12716))

(declare-fun mapValue!42031 () ValueCell!12716)

(declare-fun mapKey!42031 () (_ BitVec 32))

(assert (=> mapNonEmpty!42031 (= (arr!33943 _values!874) (store mapRest!42031 mapKey!42031 mapValue!42031))))

(declare-fun b!1092262 () Bool)

(declare-fun res!728853 () Bool)

(assert (=> b!1092262 (=> (not res!728853) (not e!623765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70536 (_ BitVec 32)) Bool)

(assert (=> b!1092262 (= res!728853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092263 () Bool)

(assert (=> b!1092263 (= e!623765 e!623762)))

(declare-fun res!728852 () Bool)

(assert (=> b!1092263 (=> (not res!728852) (not e!623762))))

(assert (=> b!1092263 (= res!728852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488058 mask!1414))))

(assert (=> b!1092263 (= lt!488058 (array!70537 (store (arr!33942 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34480 _keys!1070)))))

(assert (= (and start!96190 res!728855) b!1092257))

(assert (= (and b!1092257 res!728859) b!1092262))

(assert (= (and b!1092262 res!728853) b!1092252))

(assert (= (and b!1092252 res!728858) b!1092258))

(assert (= (and b!1092258 res!728856) b!1092254))

(assert (= (and b!1092254 res!728857) b!1092256))

(assert (= (and b!1092256 res!728851) b!1092263))

(assert (= (and b!1092263 res!728852) b!1092261))

(assert (= (and b!1092261 res!728854) b!1092260))

(assert (= (and b!1092259 condMapEmpty!42031) mapIsEmpty!42031))

(assert (= (and b!1092259 (not condMapEmpty!42031)) mapNonEmpty!42031))

(get-info :version)

(assert (= (and mapNonEmpty!42031 ((_ is ValueCellFull!12716) mapValue!42031)) b!1092253))

(assert (= (and b!1092259 ((_ is ValueCellFull!12716) mapDefault!42031)) b!1092255))

(assert (= start!96190 b!1092259))

(declare-fun b_lambda!17497 () Bool)

(assert (=> (not b_lambda!17497) (not b!1092260)))

(declare-fun t!33669 () Bool)

(declare-fun tb!7719 () Bool)

(assert (=> (and start!96190 (= defaultEntry!882 defaultEntry!882) t!33669) tb!7719))

(declare-fun result!15965 () Bool)

(assert (=> tb!7719 (= result!15965 tp_is_empty!26851)))

(assert (=> b!1092260 t!33669))

(declare-fun b_and!36349 () Bool)

(assert (= b_and!36347 (and (=> t!33669 result!15965) b_and!36349)))

(declare-fun m!1011539 () Bool)

(assert (=> b!1092254 m!1011539))

(declare-fun m!1011541 () Bool)

(assert (=> b!1092256 m!1011541))

(declare-fun m!1011543 () Bool)

(assert (=> b!1092263 m!1011543))

(declare-fun m!1011545 () Bool)

(assert (=> b!1092263 m!1011545))

(declare-fun m!1011547 () Bool)

(assert (=> b!1092262 m!1011547))

(declare-fun m!1011549 () Bool)

(assert (=> start!96190 m!1011549))

(declare-fun m!1011551 () Bool)

(assert (=> start!96190 m!1011551))

(declare-fun m!1011553 () Bool)

(assert (=> start!96190 m!1011553))

(declare-fun m!1011555 () Bool)

(assert (=> b!1092261 m!1011555))

(declare-fun m!1011557 () Bool)

(assert (=> b!1092260 m!1011557))

(declare-fun m!1011559 () Bool)

(assert (=> b!1092260 m!1011559))

(declare-fun m!1011561 () Bool)

(assert (=> b!1092260 m!1011561))

(declare-fun m!1011563 () Bool)

(assert (=> b!1092260 m!1011563))

(declare-fun m!1011565 () Bool)

(assert (=> b!1092260 m!1011565))

(declare-fun m!1011567 () Bool)

(assert (=> b!1092260 m!1011567))

(declare-fun m!1011569 () Bool)

(assert (=> b!1092260 m!1011569))

(declare-fun m!1011571 () Bool)

(assert (=> b!1092260 m!1011571))

(declare-fun m!1011573 () Bool)

(assert (=> b!1092260 m!1011573))

(declare-fun m!1011575 () Bool)

(assert (=> b!1092260 m!1011575))

(declare-fun m!1011577 () Bool)

(assert (=> mapNonEmpty!42031 m!1011577))

(declare-fun m!1011579 () Bool)

(assert (=> b!1092252 m!1011579))

(check-sat (not mapNonEmpty!42031) (not b!1092254) (not b!1092260) b_and!36349 (not b!1092263) (not start!96190) (not b!1092262) tp_is_empty!26851 (not b!1092261) (not b_lambda!17497) (not b_next!22849) (not b!1092252))
(check-sat b_and!36349 (not b_next!22849))
