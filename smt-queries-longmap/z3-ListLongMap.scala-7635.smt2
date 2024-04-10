; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96132 () Bool)

(assert start!96132)

(declare-fun b_free!22785 () Bool)

(declare-fun b_next!22785 () Bool)

(assert (=> start!96132 (= b_free!22785 (not b_next!22785))))

(declare-fun tp!80203 () Bool)

(declare-fun b_and!36245 () Bool)

(assert (=> start!96132 (= tp!80203 b_and!36245)))

(declare-fun b!1091019 () Bool)

(declare-fun e!623114 () Bool)

(declare-fun tp_is_empty!26787 () Bool)

(assert (=> b!1091019 (= e!623114 tp_is_empty!26787)))

(declare-fun b!1091020 () Bool)

(declare-fun res!727890 () Bool)

(declare-fun e!623113 () Bool)

(assert (=> b!1091020 (=> (not res!727890) (not e!623113))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70493 0))(
  ( (array!70494 (arr!33920 (Array (_ BitVec 32) (_ BitVec 64))) (size!34456 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70493)

(declare-datatypes ((V!40843 0))(
  ( (V!40844 (val!13450 Int)) )
))
(declare-datatypes ((ValueCell!12684 0))(
  ( (ValueCellFull!12684 (v!16071 V!40843)) (EmptyCell!12684) )
))
(declare-datatypes ((array!70495 0))(
  ( (array!70496 (arr!33921 (Array (_ BitVec 32) ValueCell!12684)) (size!34457 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70495)

(assert (=> b!1091020 (= res!727890 (and (= (size!34457 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34456 _keys!1070) (size!34457 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41935 () Bool)

(declare-fun mapRes!41935 () Bool)

(declare-fun tp!80204 () Bool)

(assert (=> mapNonEmpty!41935 (= mapRes!41935 (and tp!80204 e!623114))))

(declare-fun mapValue!41935 () ValueCell!12684)

(declare-fun mapRest!41935 () (Array (_ BitVec 32) ValueCell!12684))

(declare-fun mapKey!41935 () (_ BitVec 32))

(assert (=> mapNonEmpty!41935 (= (arr!33921 _values!874) (store mapRest!41935 mapKey!41935 mapValue!41935))))

(declare-fun b!1091021 () Bool)

(declare-fun res!727891 () Bool)

(assert (=> b!1091021 (=> (not res!727891) (not e!623113))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091021 (= res!727891 (= (select (arr!33920 _keys!1070) i!650) k0!904))))

(declare-fun b!1091022 () Bool)

(declare-fun e!623111 () Bool)

(declare-fun e!623112 () Bool)

(assert (=> b!1091022 (= e!623111 e!623112)))

(declare-fun res!727889 () Bool)

(assert (=> b!1091022 (=> res!727889 e!623112)))

(assert (=> b!1091022 (= res!727889 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17102 0))(
  ( (tuple2!17103 (_1!8562 (_ BitVec 64)) (_2!8562 V!40843)) )
))
(declare-datatypes ((List!23688 0))(
  ( (Nil!23685) (Cons!23684 (h!24893 tuple2!17102) (t!33531 List!23688)) )
))
(declare-datatypes ((ListLongMap!15071 0))(
  ( (ListLongMap!15072 (toList!7551 List!23688)) )
))
(declare-fun lt!487059 () ListLongMap!15071)

(declare-fun lt!487048 () ListLongMap!15071)

(assert (=> b!1091022 (= lt!487059 lt!487048)))

(declare-fun lt!487058 () ListLongMap!15071)

(declare-fun lt!487049 () tuple2!17102)

(declare-fun +!3338 (ListLongMap!15071 tuple2!17102) ListLongMap!15071)

(assert (=> b!1091022 (= lt!487048 (+!3338 lt!487058 lt!487049))))

(declare-fun lt!487052 () ListLongMap!15071)

(declare-fun lt!487053 () ListLongMap!15071)

(assert (=> b!1091022 (= lt!487052 lt!487053)))

(declare-fun lt!487056 () ListLongMap!15071)

(assert (=> b!1091022 (= lt!487053 (+!3338 lt!487056 lt!487049))))

(declare-fun lt!487057 () ListLongMap!15071)

(assert (=> b!1091022 (= lt!487052 (+!3338 lt!487057 lt!487049))))

(declare-fun minValue!831 () V!40843)

(assert (=> b!1091022 (= lt!487049 (tuple2!17103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091023 () Bool)

(declare-fun res!727895 () Bool)

(assert (=> b!1091023 (=> (not res!727895) (not e!623113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091023 (= res!727895 (validKeyInArray!0 k0!904))))

(declare-fun b!1091024 () Bool)

(declare-fun e!623107 () Bool)

(assert (=> b!1091024 (= e!623107 (not e!623111))))

(declare-fun res!727894 () Bool)

(assert (=> b!1091024 (=> res!727894 e!623111)))

(assert (=> b!1091024 (= res!727894 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40843)

(declare-fun getCurrentListMap!4314 (array!70493 array!70495 (_ BitVec 32) (_ BitVec 32) V!40843 V!40843 (_ BitVec 32) Int) ListLongMap!15071)

(assert (=> b!1091024 (= lt!487059 (getCurrentListMap!4314 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487050 () array!70495)

(declare-fun lt!487051 () array!70493)

(assert (=> b!1091024 (= lt!487052 (getCurrentListMap!4314 lt!487051 lt!487050 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091024 (and (= lt!487057 lt!487056) (= lt!487056 lt!487057))))

(declare-fun -!873 (ListLongMap!15071 (_ BitVec 64)) ListLongMap!15071)

(assert (=> b!1091024 (= lt!487056 (-!873 lt!487058 k0!904))))

(declare-datatypes ((Unit!35912 0))(
  ( (Unit!35913) )
))
(declare-fun lt!487054 () Unit!35912)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!133 (array!70493 array!70495 (_ BitVec 32) (_ BitVec 32) V!40843 V!40843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35912)

(assert (=> b!1091024 (= lt!487054 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!133 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4074 (array!70493 array!70495 (_ BitVec 32) (_ BitVec 32) V!40843 V!40843 (_ BitVec 32) Int) ListLongMap!15071)

(assert (=> b!1091024 (= lt!487057 (getCurrentListMapNoExtraKeys!4074 lt!487051 lt!487050 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2211 (Int (_ BitVec 64)) V!40843)

(assert (=> b!1091024 (= lt!487050 (array!70496 (store (arr!33921 _values!874) i!650 (ValueCellFull!12684 (dynLambda!2211 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34457 _values!874)))))

(assert (=> b!1091024 (= lt!487058 (getCurrentListMapNoExtraKeys!4074 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091024 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487055 () Unit!35912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70493 (_ BitVec 64) (_ BitVec 32)) Unit!35912)

(assert (=> b!1091024 (= lt!487055 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091025 () Bool)

(declare-fun e!623110 () Bool)

(assert (=> b!1091025 (= e!623110 tp_is_empty!26787)))

(declare-fun b!1091026 () Bool)

(declare-fun res!727887 () Bool)

(assert (=> b!1091026 (=> (not res!727887) (not e!623107))))

(declare-datatypes ((List!23689 0))(
  ( (Nil!23686) (Cons!23685 (h!24894 (_ BitVec 64)) (t!33532 List!23689)) )
))
(declare-fun arrayNoDuplicates!0 (array!70493 (_ BitVec 32) List!23689) Bool)

(assert (=> b!1091026 (= res!727887 (arrayNoDuplicates!0 lt!487051 #b00000000000000000000000000000000 Nil!23686))))

(declare-fun b!1091027 () Bool)

(declare-fun res!727893 () Bool)

(assert (=> b!1091027 (=> (not res!727893) (not e!623113))))

(assert (=> b!1091027 (= res!727893 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34456 _keys!1070))))))

(declare-fun b!1091028 () Bool)

(assert (=> b!1091028 (= e!623113 e!623107)))

(declare-fun res!727896 () Bool)

(assert (=> b!1091028 (=> (not res!727896) (not e!623107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70493 (_ BitVec 32)) Bool)

(assert (=> b!1091028 (= res!727896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487051 mask!1414))))

(assert (=> b!1091028 (= lt!487051 (array!70494 (store (arr!33920 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34456 _keys!1070)))))

(declare-fun b!1091029 () Bool)

(declare-fun e!623109 () Bool)

(assert (=> b!1091029 (= e!623109 (and e!623110 mapRes!41935))))

(declare-fun condMapEmpty!41935 () Bool)

(declare-fun mapDefault!41935 () ValueCell!12684)

(assert (=> b!1091029 (= condMapEmpty!41935 (= (arr!33921 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12684)) mapDefault!41935)))))

(declare-fun b!1091030 () Bool)

(declare-fun res!727888 () Bool)

(assert (=> b!1091030 (=> (not res!727888) (not e!623113))))

(assert (=> b!1091030 (= res!727888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!727886 () Bool)

(assert (=> start!96132 (=> (not res!727886) (not e!623113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96132 (= res!727886 (validMask!0 mask!1414))))

(assert (=> start!96132 e!623113))

(assert (=> start!96132 tp!80203))

(assert (=> start!96132 true))

(assert (=> start!96132 tp_is_empty!26787))

(declare-fun array_inv!26156 (array!70493) Bool)

(assert (=> start!96132 (array_inv!26156 _keys!1070)))

(declare-fun array_inv!26157 (array!70495) Bool)

(assert (=> start!96132 (and (array_inv!26157 _values!874) e!623109)))

(declare-fun b!1091031 () Bool)

(assert (=> b!1091031 (= e!623112 (bvsle #b00000000000000000000000000000000 (size!34456 _keys!1070)))))

(assert (=> b!1091031 (= (-!873 lt!487048 k0!904) lt!487053)))

(declare-fun lt!487060 () Unit!35912)

(declare-fun addRemoveCommutativeForDiffKeys!97 (ListLongMap!15071 (_ BitVec 64) V!40843 (_ BitVec 64)) Unit!35912)

(assert (=> b!1091031 (= lt!487060 (addRemoveCommutativeForDiffKeys!97 lt!487058 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091032 () Bool)

(declare-fun res!727892 () Bool)

(assert (=> b!1091032 (=> (not res!727892) (not e!623113))))

(assert (=> b!1091032 (= res!727892 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23686))))

(declare-fun mapIsEmpty!41935 () Bool)

(assert (=> mapIsEmpty!41935 mapRes!41935))

(assert (= (and start!96132 res!727886) b!1091020))

(assert (= (and b!1091020 res!727890) b!1091030))

(assert (= (and b!1091030 res!727888) b!1091032))

(assert (= (and b!1091032 res!727892) b!1091027))

(assert (= (and b!1091027 res!727893) b!1091023))

(assert (= (and b!1091023 res!727895) b!1091021))

(assert (= (and b!1091021 res!727891) b!1091028))

(assert (= (and b!1091028 res!727896) b!1091026))

(assert (= (and b!1091026 res!727887) b!1091024))

(assert (= (and b!1091024 (not res!727894)) b!1091022))

(assert (= (and b!1091022 (not res!727889)) b!1091031))

(assert (= (and b!1091029 condMapEmpty!41935) mapIsEmpty!41935))

(assert (= (and b!1091029 (not condMapEmpty!41935)) mapNonEmpty!41935))

(get-info :version)

(assert (= (and mapNonEmpty!41935 ((_ is ValueCellFull!12684) mapValue!41935)) b!1091019))

(assert (= (and b!1091029 ((_ is ValueCellFull!12684) mapDefault!41935)) b!1091025))

(assert (= start!96132 b!1091029))

(declare-fun b_lambda!17455 () Bool)

(assert (=> (not b_lambda!17455) (not b!1091024)))

(declare-fun t!33530 () Bool)

(declare-fun tb!7663 () Bool)

(assert (=> (and start!96132 (= defaultEntry!882 defaultEntry!882) t!33530) tb!7663))

(declare-fun result!15845 () Bool)

(assert (=> tb!7663 (= result!15845 tp_is_empty!26787)))

(assert (=> b!1091024 t!33530))

(declare-fun b_and!36247 () Bool)

(assert (= b_and!36245 (and (=> t!33530 result!15845) b_and!36247)))

(declare-fun m!1010531 () Bool)

(assert (=> b!1091028 m!1010531))

(declare-fun m!1010533 () Bool)

(assert (=> b!1091028 m!1010533))

(declare-fun m!1010535 () Bool)

(assert (=> start!96132 m!1010535))

(declare-fun m!1010537 () Bool)

(assert (=> start!96132 m!1010537))

(declare-fun m!1010539 () Bool)

(assert (=> start!96132 m!1010539))

(declare-fun m!1010541 () Bool)

(assert (=> b!1091032 m!1010541))

(declare-fun m!1010543 () Bool)

(assert (=> b!1091024 m!1010543))

(declare-fun m!1010545 () Bool)

(assert (=> b!1091024 m!1010545))

(declare-fun m!1010547 () Bool)

(assert (=> b!1091024 m!1010547))

(declare-fun m!1010549 () Bool)

(assert (=> b!1091024 m!1010549))

(declare-fun m!1010551 () Bool)

(assert (=> b!1091024 m!1010551))

(declare-fun m!1010553 () Bool)

(assert (=> b!1091024 m!1010553))

(declare-fun m!1010555 () Bool)

(assert (=> b!1091024 m!1010555))

(declare-fun m!1010557 () Bool)

(assert (=> b!1091024 m!1010557))

(declare-fun m!1010559 () Bool)

(assert (=> b!1091024 m!1010559))

(declare-fun m!1010561 () Bool)

(assert (=> b!1091024 m!1010561))

(declare-fun m!1010563 () Bool)

(assert (=> b!1091031 m!1010563))

(declare-fun m!1010565 () Bool)

(assert (=> b!1091031 m!1010565))

(declare-fun m!1010567 () Bool)

(assert (=> b!1091026 m!1010567))

(declare-fun m!1010569 () Bool)

(assert (=> b!1091030 m!1010569))

(declare-fun m!1010571 () Bool)

(assert (=> b!1091021 m!1010571))

(declare-fun m!1010573 () Bool)

(assert (=> b!1091022 m!1010573))

(declare-fun m!1010575 () Bool)

(assert (=> b!1091022 m!1010575))

(declare-fun m!1010577 () Bool)

(assert (=> b!1091022 m!1010577))

(declare-fun m!1010579 () Bool)

(assert (=> mapNonEmpty!41935 m!1010579))

(declare-fun m!1010581 () Bool)

(assert (=> b!1091023 m!1010581))

(check-sat (not mapNonEmpty!41935) (not b!1091022) (not b!1091026) (not b!1091024) (not b_next!22785) (not b!1091030) (not b!1091031) tp_is_empty!26787 (not b!1091032) (not b_lambda!17455) (not b!1091028) (not start!96132) (not b!1091023) b_and!36247)
(check-sat b_and!36247 (not b_next!22785))
