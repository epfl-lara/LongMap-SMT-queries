; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95878 () Bool)

(assert start!95878)

(declare-fun b_free!22537 () Bool)

(declare-fun b_next!22537 () Bool)

(assert (=> start!95878 (= b_free!22537 (not b_next!22537))))

(declare-fun tp!79460 () Bool)

(declare-fun b_and!35723 () Bool)

(assert (=> start!95878 (= tp!79460 b_and!35723)))

(declare-fun b!1085392 () Bool)

(declare-fun e!620040 () Bool)

(declare-fun e!620038 () Bool)

(assert (=> b!1085392 (= e!620040 e!620038)))

(declare-fun res!723710 () Bool)

(assert (=> b!1085392 (=> (not res!723710) (not e!620038))))

(declare-datatypes ((array!69936 0))(
  ( (array!69937 (arr!33642 (Array (_ BitVec 32) (_ BitVec 64))) (size!34180 (_ BitVec 32))) )
))
(declare-fun lt!481610 () array!69936)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69936 (_ BitVec 32)) Bool)

(assert (=> b!1085392 (= res!723710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481610 mask!1414))))

(declare-fun _keys!1070 () array!69936)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085392 (= lt!481610 (array!69937 (store (arr!33642 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34180 _keys!1070)))))

(declare-fun b!1085393 () Bool)

(declare-fun res!723717 () Bool)

(assert (=> b!1085393 (=> (not res!723717) (not e!620040))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1085393 (= res!723717 (= (select (arr!33642 _keys!1070) i!650) k0!904))))

(declare-fun b!1085394 () Bool)

(declare-fun res!723709 () Bool)

(assert (=> b!1085394 (=> (not res!723709) (not e!620040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085394 (= res!723709 (validKeyInArray!0 k0!904))))

(declare-fun b!1085395 () Bool)

(declare-fun res!723713 () Bool)

(assert (=> b!1085395 (=> (not res!723713) (not e!620040))))

(assert (=> b!1085395 (= res!723713 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34180 _keys!1070))))))

(declare-fun b!1085396 () Bool)

(declare-fun e!620044 () Bool)

(assert (=> b!1085396 (= e!620038 (not e!620044))))

(declare-fun res!723711 () Bool)

(assert (=> b!1085396 (=> res!723711 e!620044)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085396 (= res!723711 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40513 0))(
  ( (V!40514 (val!13326 Int)) )
))
(declare-fun minValue!831 () V!40513)

(declare-datatypes ((tuple2!16952 0))(
  ( (tuple2!16953 (_1!8487 (_ BitVec 64)) (_2!8487 V!40513)) )
))
(declare-datatypes ((List!23523 0))(
  ( (Nil!23520) (Cons!23519 (h!24728 tuple2!16952) (t!33109 List!23523)) )
))
(declare-datatypes ((ListLongMap!14921 0))(
  ( (ListLongMap!14922 (toList!7476 List!23523)) )
))
(declare-fun lt!481613 () ListLongMap!14921)

(declare-fun zeroValue!831 () V!40513)

(declare-datatypes ((ValueCell!12560 0))(
  ( (ValueCellFull!12560 (v!15946 V!40513)) (EmptyCell!12560) )
))
(declare-datatypes ((array!69938 0))(
  ( (array!69939 (arr!33643 (Array (_ BitVec 32) ValueCell!12560)) (size!34181 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69938)

(declare-fun getCurrentListMap!4166 (array!69936 array!69938 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) Int) ListLongMap!14921)

(assert (=> b!1085396 (= lt!481613 (getCurrentListMap!4166 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481612 () ListLongMap!14921)

(declare-fun lt!481608 () array!69938)

(assert (=> b!1085396 (= lt!481612 (getCurrentListMap!4166 lt!481610 lt!481608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481617 () ListLongMap!14921)

(declare-fun lt!481614 () ListLongMap!14921)

(assert (=> b!1085396 (and (= lt!481617 lt!481614) (= lt!481614 lt!481617))))

(declare-fun lt!481622 () ListLongMap!14921)

(declare-fun -!755 (ListLongMap!14921 (_ BitVec 64)) ListLongMap!14921)

(assert (=> b!1085396 (= lt!481614 (-!755 lt!481622 k0!904))))

(declare-datatypes ((Unit!35545 0))(
  ( (Unit!35546) )
))
(declare-fun lt!481606 () Unit!35545)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!50 (array!69936 array!69938 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35545)

(assert (=> b!1085396 (= lt!481606 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!50 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4036 (array!69936 array!69938 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) Int) ListLongMap!14921)

(assert (=> b!1085396 (= lt!481617 (getCurrentListMapNoExtraKeys!4036 lt!481610 lt!481608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2107 (Int (_ BitVec 64)) V!40513)

(assert (=> b!1085396 (= lt!481608 (array!69939 (store (arr!33643 _values!874) i!650 (ValueCellFull!12560 (dynLambda!2107 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34181 _values!874)))))

(assert (=> b!1085396 (= lt!481622 (getCurrentListMapNoExtraKeys!4036 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085396 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481615 () Unit!35545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69936 (_ BitVec 64) (_ BitVec 32)) Unit!35545)

(assert (=> b!1085396 (= lt!481615 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085397 () Bool)

(declare-fun e!620039 () Bool)

(declare-fun tp_is_empty!26539 () Bool)

(assert (=> b!1085397 (= e!620039 tp_is_empty!26539)))

(declare-fun mapNonEmpty!41563 () Bool)

(declare-fun mapRes!41563 () Bool)

(declare-fun tp!79459 () Bool)

(declare-fun e!620045 () Bool)

(assert (=> mapNonEmpty!41563 (= mapRes!41563 (and tp!79459 e!620045))))

(declare-fun mapKey!41563 () (_ BitVec 32))

(declare-fun mapRest!41563 () (Array (_ BitVec 32) ValueCell!12560))

(declare-fun mapValue!41563 () ValueCell!12560)

(assert (=> mapNonEmpty!41563 (= (arr!33643 _values!874) (store mapRest!41563 mapKey!41563 mapValue!41563))))

(declare-fun mapIsEmpty!41563 () Bool)

(assert (=> mapIsEmpty!41563 mapRes!41563))

(declare-fun b!1085398 () Bool)

(declare-fun res!723715 () Bool)

(assert (=> b!1085398 (=> (not res!723715) (not e!620040))))

(assert (=> b!1085398 (= res!723715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085399 () Bool)

(declare-fun res!723714 () Bool)

(assert (=> b!1085399 (=> (not res!723714) (not e!620038))))

(declare-datatypes ((List!23524 0))(
  ( (Nil!23521) (Cons!23520 (h!24729 (_ BitVec 64)) (t!33110 List!23524)) )
))
(declare-fun arrayNoDuplicates!0 (array!69936 (_ BitVec 32) List!23524) Bool)

(assert (=> b!1085399 (= res!723714 (arrayNoDuplicates!0 lt!481610 #b00000000000000000000000000000000 Nil!23521))))

(declare-fun res!723708 () Bool)

(assert (=> start!95878 (=> (not res!723708) (not e!620040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95878 (= res!723708 (validMask!0 mask!1414))))

(assert (=> start!95878 e!620040))

(assert (=> start!95878 tp!79460))

(assert (=> start!95878 true))

(assert (=> start!95878 tp_is_empty!26539))

(declare-fun array_inv!25998 (array!69936) Bool)

(assert (=> start!95878 (array_inv!25998 _keys!1070)))

(declare-fun e!620041 () Bool)

(declare-fun array_inv!25999 (array!69938) Bool)

(assert (=> start!95878 (and (array_inv!25999 _values!874) e!620041)))

(declare-fun b!1085400 () Bool)

(assert (=> b!1085400 (= e!620041 (and e!620039 mapRes!41563))))

(declare-fun condMapEmpty!41563 () Bool)

(declare-fun mapDefault!41563 () ValueCell!12560)

(assert (=> b!1085400 (= condMapEmpty!41563 (= (arr!33643 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12560)) mapDefault!41563)))))

(declare-fun b!1085401 () Bool)

(declare-fun res!723707 () Bool)

(assert (=> b!1085401 (=> (not res!723707) (not e!620040))))

(assert (=> b!1085401 (= res!723707 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23521))))

(declare-fun b!1085402 () Bool)

(declare-fun e!620042 () Bool)

(assert (=> b!1085402 (= e!620042 true)))

(declare-fun lt!481620 () ListLongMap!14921)

(declare-fun lt!481607 () ListLongMap!14921)

(declare-fun lt!481621 () tuple2!16952)

(declare-fun +!3284 (ListLongMap!14921 tuple2!16952) ListLongMap!14921)

(assert (=> b!1085402 (= (-!755 lt!481607 k0!904) (+!3284 lt!481620 lt!481621))))

(declare-fun lt!481609 () Unit!35545)

(declare-fun lt!481618 () ListLongMap!14921)

(declare-fun addRemoveCommutativeForDiffKeys!13 (ListLongMap!14921 (_ BitVec 64) V!40513 (_ BitVec 64)) Unit!35545)

(assert (=> b!1085402 (= lt!481609 (addRemoveCommutativeForDiffKeys!13 lt!481618 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085403 () Bool)

(declare-fun res!723712 () Bool)

(assert (=> b!1085403 (=> (not res!723712) (not e!620040))))

(assert (=> b!1085403 (= res!723712 (and (= (size!34181 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34180 _keys!1070) (size!34181 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085404 () Bool)

(assert (=> b!1085404 (= e!620044 e!620042)))

(declare-fun res!723716 () Bool)

(assert (=> b!1085404 (=> res!723716 e!620042)))

(assert (=> b!1085404 (= res!723716 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481611 () ListLongMap!14921)

(assert (=> b!1085404 (= lt!481620 lt!481611)))

(assert (=> b!1085404 (= lt!481620 (-!755 lt!481618 k0!904))))

(declare-fun lt!481616 () Unit!35545)

(assert (=> b!1085404 (= lt!481616 (addRemoveCommutativeForDiffKeys!13 lt!481622 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1085404 (= lt!481612 (+!3284 lt!481611 lt!481621))))

(declare-fun lt!481619 () tuple2!16952)

(assert (=> b!1085404 (= lt!481611 (+!3284 lt!481614 lt!481619))))

(assert (=> b!1085404 (= lt!481613 lt!481607)))

(assert (=> b!1085404 (= lt!481607 (+!3284 lt!481618 lt!481621))))

(assert (=> b!1085404 (= lt!481618 (+!3284 lt!481622 lt!481619))))

(assert (=> b!1085404 (= lt!481612 (+!3284 (+!3284 lt!481617 lt!481619) lt!481621))))

(assert (=> b!1085404 (= lt!481621 (tuple2!16953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085404 (= lt!481619 (tuple2!16953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085405 () Bool)

(assert (=> b!1085405 (= e!620045 tp_is_empty!26539)))

(assert (= (and start!95878 res!723708) b!1085403))

(assert (= (and b!1085403 res!723712) b!1085398))

(assert (= (and b!1085398 res!723715) b!1085401))

(assert (= (and b!1085401 res!723707) b!1085395))

(assert (= (and b!1085395 res!723713) b!1085394))

(assert (= (and b!1085394 res!723709) b!1085393))

(assert (= (and b!1085393 res!723717) b!1085392))

(assert (= (and b!1085392 res!723710) b!1085399))

(assert (= (and b!1085399 res!723714) b!1085396))

(assert (= (and b!1085396 (not res!723711)) b!1085404))

(assert (= (and b!1085404 (not res!723716)) b!1085402))

(assert (= (and b!1085400 condMapEmpty!41563) mapIsEmpty!41563))

(assert (= (and b!1085400 (not condMapEmpty!41563)) mapNonEmpty!41563))

(get-info :version)

(assert (= (and mapNonEmpty!41563 ((_ is ValueCellFull!12560) mapValue!41563)) b!1085405))

(assert (= (and b!1085400 ((_ is ValueCellFull!12560) mapDefault!41563)) b!1085397))

(assert (= start!95878 b!1085400))

(declare-fun b_lambda!17185 () Bool)

(assert (=> (not b_lambda!17185) (not b!1085396)))

(declare-fun t!33108 () Bool)

(declare-fun tb!7407 () Bool)

(assert (=> (and start!95878 (= defaultEntry!882 defaultEntry!882) t!33108) tb!7407))

(declare-fun result!15341 () Bool)

(assert (=> tb!7407 (= result!15341 tp_is_empty!26539)))

(assert (=> b!1085396 t!33108))

(declare-fun b_and!35725 () Bool)

(assert (= b_and!35723 (and (=> t!33108 result!15341) b_and!35725)))

(declare-fun m!1003013 () Bool)

(assert (=> b!1085404 m!1003013))

(declare-fun m!1003015 () Bool)

(assert (=> b!1085404 m!1003015))

(declare-fun m!1003017 () Bool)

(assert (=> b!1085404 m!1003017))

(declare-fun m!1003019 () Bool)

(assert (=> b!1085404 m!1003019))

(declare-fun m!1003021 () Bool)

(assert (=> b!1085404 m!1003021))

(assert (=> b!1085404 m!1003019))

(declare-fun m!1003023 () Bool)

(assert (=> b!1085404 m!1003023))

(declare-fun m!1003025 () Bool)

(assert (=> b!1085404 m!1003025))

(declare-fun m!1003027 () Bool)

(assert (=> b!1085404 m!1003027))

(declare-fun m!1003029 () Bool)

(assert (=> b!1085399 m!1003029))

(declare-fun m!1003031 () Bool)

(assert (=> b!1085392 m!1003031))

(declare-fun m!1003033 () Bool)

(assert (=> b!1085392 m!1003033))

(declare-fun m!1003035 () Bool)

(assert (=> b!1085402 m!1003035))

(declare-fun m!1003037 () Bool)

(assert (=> b!1085402 m!1003037))

(declare-fun m!1003039 () Bool)

(assert (=> b!1085402 m!1003039))

(declare-fun m!1003041 () Bool)

(assert (=> b!1085401 m!1003041))

(declare-fun m!1003043 () Bool)

(assert (=> mapNonEmpty!41563 m!1003043))

(declare-fun m!1003045 () Bool)

(assert (=> b!1085394 m!1003045))

(declare-fun m!1003047 () Bool)

(assert (=> b!1085393 m!1003047))

(declare-fun m!1003049 () Bool)

(assert (=> b!1085398 m!1003049))

(declare-fun m!1003051 () Bool)

(assert (=> b!1085396 m!1003051))

(declare-fun m!1003053 () Bool)

(assert (=> b!1085396 m!1003053))

(declare-fun m!1003055 () Bool)

(assert (=> b!1085396 m!1003055))

(declare-fun m!1003057 () Bool)

(assert (=> b!1085396 m!1003057))

(declare-fun m!1003059 () Bool)

(assert (=> b!1085396 m!1003059))

(declare-fun m!1003061 () Bool)

(assert (=> b!1085396 m!1003061))

(declare-fun m!1003063 () Bool)

(assert (=> b!1085396 m!1003063))

(declare-fun m!1003065 () Bool)

(assert (=> b!1085396 m!1003065))

(declare-fun m!1003067 () Bool)

(assert (=> b!1085396 m!1003067))

(declare-fun m!1003069 () Bool)

(assert (=> b!1085396 m!1003069))

(declare-fun m!1003071 () Bool)

(assert (=> start!95878 m!1003071))

(declare-fun m!1003073 () Bool)

(assert (=> start!95878 m!1003073))

(declare-fun m!1003075 () Bool)

(assert (=> start!95878 m!1003075))

(check-sat (not b_lambda!17185) b_and!35725 (not b!1085394) (not b!1085399) (not b!1085401) (not mapNonEmpty!41563) (not b!1085398) (not b_next!22537) tp_is_empty!26539 (not b!1085404) (not b!1085396) (not b!1085392) (not b!1085402) (not start!95878))
(check-sat b_and!35725 (not b_next!22537))
