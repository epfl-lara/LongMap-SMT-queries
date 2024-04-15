; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95818 () Bool)

(assert start!95818)

(declare-fun b_free!22477 () Bool)

(declare-fun b_next!22477 () Bool)

(assert (=> start!95818 (= b_free!22477 (not b_next!22477))))

(declare-fun tp!79280 () Bool)

(declare-fun b_and!35603 () Bool)

(assert (=> start!95818 (= tp!79280 b_and!35603)))

(declare-fun mapNonEmpty!41473 () Bool)

(declare-fun mapRes!41473 () Bool)

(declare-fun tp!79279 () Bool)

(declare-fun e!619381 () Bool)

(assert (=> mapNonEmpty!41473 (= mapRes!41473 (and tp!79279 e!619381))))

(declare-datatypes ((V!40433 0))(
  ( (V!40434 (val!13296 Int)) )
))
(declare-datatypes ((ValueCell!12530 0))(
  ( (ValueCellFull!12530 (v!15916 V!40433)) (EmptyCell!12530) )
))
(declare-datatypes ((array!69820 0))(
  ( (array!69821 (arr!33584 (Array (_ BitVec 32) ValueCell!12530)) (size!34122 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69820)

(declare-fun mapKey!41473 () (_ BitVec 32))

(declare-fun mapValue!41473 () ValueCell!12530)

(declare-fun mapRest!41473 () (Array (_ BitVec 32) ValueCell!12530))

(assert (=> mapNonEmpty!41473 (= (arr!33584 _values!874) (store mapRest!41473 mapKey!41473 mapValue!41473))))

(declare-fun mapIsEmpty!41473 () Bool)

(assert (=> mapIsEmpty!41473 mapRes!41473))

(declare-fun b!1084122 () Bool)

(declare-fun tp_is_empty!26479 () Bool)

(assert (=> b!1084122 (= e!619381 tp_is_empty!26479)))

(declare-fun b!1084123 () Bool)

(declare-fun res!722769 () Bool)

(declare-fun e!619378 () Bool)

(assert (=> b!1084123 (=> (not res!722769) (not e!619378))))

(declare-datatypes ((array!69822 0))(
  ( (array!69823 (arr!33585 (Array (_ BitVec 32) (_ BitVec 64))) (size!34123 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69822)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69822 (_ BitVec 32)) Bool)

(assert (=> b!1084123 (= res!722769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084124 () Bool)

(declare-fun e!619380 () Bool)

(declare-fun e!619377 () Bool)

(assert (=> b!1084124 (= e!619380 (and e!619377 mapRes!41473))))

(declare-fun condMapEmpty!41473 () Bool)

(declare-fun mapDefault!41473 () ValueCell!12530)

(assert (=> b!1084124 (= condMapEmpty!41473 (= (arr!33584 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12530)) mapDefault!41473)))))

(declare-fun b!1084125 () Bool)

(declare-fun res!722771 () Bool)

(assert (=> b!1084125 (=> (not res!722771) (not e!619378))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084125 (= res!722771 (validKeyInArray!0 k0!904))))

(declare-fun res!722774 () Bool)

(assert (=> start!95818 (=> (not res!722774) (not e!619378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95818 (= res!722774 (validMask!0 mask!1414))))

(assert (=> start!95818 e!619378))

(assert (=> start!95818 tp!79280))

(assert (=> start!95818 true))

(assert (=> start!95818 tp_is_empty!26479))

(declare-fun array_inv!25958 (array!69822) Bool)

(assert (=> start!95818 (array_inv!25958 _keys!1070)))

(declare-fun array_inv!25959 (array!69820) Bool)

(assert (=> start!95818 (and (array_inv!25959 _values!874) e!619380)))

(declare-fun b!1084126 () Bool)

(declare-fun res!722767 () Bool)

(assert (=> b!1084126 (=> (not res!722767) (not e!619378))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084126 (= res!722767 (= (select (arr!33585 _keys!1070) i!650) k0!904))))

(declare-fun b!1084127 () Bool)

(declare-fun res!722768 () Bool)

(assert (=> b!1084127 (=> (not res!722768) (not e!619378))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084127 (= res!722768 (and (= (size!34122 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34123 _keys!1070) (size!34122 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084128 () Bool)

(declare-fun res!722773 () Bool)

(assert (=> b!1084128 (=> (not res!722773) (not e!619378))))

(declare-datatypes ((List!23482 0))(
  ( (Nil!23479) (Cons!23478 (h!24687 (_ BitVec 64)) (t!33008 List!23482)) )
))
(declare-fun arrayNoDuplicates!0 (array!69822 (_ BitVec 32) List!23482) Bool)

(assert (=> b!1084128 (= res!722773 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23479))))

(declare-fun b!1084129 () Bool)

(declare-fun e!619379 () Bool)

(assert (=> b!1084129 (= e!619378 e!619379)))

(declare-fun res!722770 () Bool)

(assert (=> b!1084129 (=> (not res!722770) (not e!619379))))

(declare-fun lt!480382 () array!69822)

(assert (=> b!1084129 (= res!722770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480382 mask!1414))))

(assert (=> b!1084129 (= lt!480382 (array!69823 (store (arr!33585 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34123 _keys!1070)))))

(declare-fun b!1084130 () Bool)

(declare-fun res!722772 () Bool)

(assert (=> b!1084130 (=> (not res!722772) (not e!619378))))

(assert (=> b!1084130 (= res!722772 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34123 _keys!1070))))))

(declare-fun b!1084131 () Bool)

(declare-fun res!722775 () Bool)

(assert (=> b!1084131 (=> (not res!722775) (not e!619379))))

(assert (=> b!1084131 (= res!722775 (arrayNoDuplicates!0 lt!480382 #b00000000000000000000000000000000 Nil!23479))))

(declare-fun b!1084132 () Bool)

(assert (=> b!1084132 (= e!619379 (not true))))

(declare-fun minValue!831 () V!40433)

(declare-datatypes ((tuple2!16912 0))(
  ( (tuple2!16913 (_1!8467 (_ BitVec 64)) (_2!8467 V!40433)) )
))
(declare-datatypes ((List!23483 0))(
  ( (Nil!23480) (Cons!23479 (h!24688 tuple2!16912) (t!33009 List!23483)) )
))
(declare-datatypes ((ListLongMap!14881 0))(
  ( (ListLongMap!14882 (toList!7456 List!23483)) )
))
(declare-fun lt!480386 () ListLongMap!14881)

(declare-fun lt!480383 () array!69820)

(declare-fun zeroValue!831 () V!40433)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4149 (array!69822 array!69820 (_ BitVec 32) (_ BitVec 32) V!40433 V!40433 (_ BitVec 32) Int) ListLongMap!14881)

(assert (=> b!1084132 (= lt!480386 (getCurrentListMap!4149 lt!480382 lt!480383 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480388 () ListLongMap!14881)

(declare-fun lt!480384 () ListLongMap!14881)

(assert (=> b!1084132 (and (= lt!480388 lt!480384) (= lt!480384 lt!480388))))

(declare-fun lt!480389 () ListLongMap!14881)

(declare-fun -!735 (ListLongMap!14881 (_ BitVec 64)) ListLongMap!14881)

(assert (=> b!1084132 (= lt!480384 (-!735 lt!480389 k0!904))))

(declare-datatypes ((Unit!35505 0))(
  ( (Unit!35506) )
))
(declare-fun lt!480385 () Unit!35505)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!33 (array!69822 array!69820 (_ BitVec 32) (_ BitVec 32) V!40433 V!40433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35505)

(assert (=> b!1084132 (= lt!480385 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!33 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4019 (array!69822 array!69820 (_ BitVec 32) (_ BitVec 32) V!40433 V!40433 (_ BitVec 32) Int) ListLongMap!14881)

(assert (=> b!1084132 (= lt!480388 (getCurrentListMapNoExtraKeys!4019 lt!480382 lt!480383 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2090 (Int (_ BitVec 64)) V!40433)

(assert (=> b!1084132 (= lt!480383 (array!69821 (store (arr!33584 _values!874) i!650 (ValueCellFull!12530 (dynLambda!2090 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34122 _values!874)))))

(assert (=> b!1084132 (= lt!480389 (getCurrentListMapNoExtraKeys!4019 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084132 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480387 () Unit!35505)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69822 (_ BitVec 64) (_ BitVec 32)) Unit!35505)

(assert (=> b!1084132 (= lt!480387 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084133 () Bool)

(assert (=> b!1084133 (= e!619377 tp_is_empty!26479)))

(assert (= (and start!95818 res!722774) b!1084127))

(assert (= (and b!1084127 res!722768) b!1084123))

(assert (= (and b!1084123 res!722769) b!1084128))

(assert (= (and b!1084128 res!722773) b!1084130))

(assert (= (and b!1084130 res!722772) b!1084125))

(assert (= (and b!1084125 res!722771) b!1084126))

(assert (= (and b!1084126 res!722767) b!1084129))

(assert (= (and b!1084129 res!722770) b!1084131))

(assert (= (and b!1084131 res!722775) b!1084132))

(assert (= (and b!1084124 condMapEmpty!41473) mapIsEmpty!41473))

(assert (= (and b!1084124 (not condMapEmpty!41473)) mapNonEmpty!41473))

(get-info :version)

(assert (= (and mapNonEmpty!41473 ((_ is ValueCellFull!12530) mapValue!41473)) b!1084122))

(assert (= (and b!1084124 ((_ is ValueCellFull!12530) mapDefault!41473)) b!1084133))

(assert (= start!95818 b!1084124))

(declare-fun b_lambda!17125 () Bool)

(assert (=> (not b_lambda!17125) (not b!1084132)))

(declare-fun t!33007 () Bool)

(declare-fun tb!7347 () Bool)

(assert (=> (and start!95818 (= defaultEntry!882 defaultEntry!882) t!33007) tb!7347))

(declare-fun result!15221 () Bool)

(assert (=> tb!7347 (= result!15221 tp_is_empty!26479)))

(assert (=> b!1084132 t!33007))

(declare-fun b_and!35605 () Bool)

(assert (= b_and!35603 (and (=> t!33007 result!15221) b_and!35605)))

(declare-fun m!1001357 () Bool)

(assert (=> start!95818 m!1001357))

(declare-fun m!1001359 () Bool)

(assert (=> start!95818 m!1001359))

(declare-fun m!1001361 () Bool)

(assert (=> start!95818 m!1001361))

(declare-fun m!1001363 () Bool)

(assert (=> b!1084123 m!1001363))

(declare-fun m!1001365 () Bool)

(assert (=> b!1084132 m!1001365))

(declare-fun m!1001367 () Bool)

(assert (=> b!1084132 m!1001367))

(declare-fun m!1001369 () Bool)

(assert (=> b!1084132 m!1001369))

(declare-fun m!1001371 () Bool)

(assert (=> b!1084132 m!1001371))

(declare-fun m!1001373 () Bool)

(assert (=> b!1084132 m!1001373))

(declare-fun m!1001375 () Bool)

(assert (=> b!1084132 m!1001375))

(declare-fun m!1001377 () Bool)

(assert (=> b!1084132 m!1001377))

(declare-fun m!1001379 () Bool)

(assert (=> b!1084132 m!1001379))

(declare-fun m!1001381 () Bool)

(assert (=> b!1084132 m!1001381))

(declare-fun m!1001383 () Bool)

(assert (=> b!1084126 m!1001383))

(declare-fun m!1001385 () Bool)

(assert (=> b!1084128 m!1001385))

(declare-fun m!1001387 () Bool)

(assert (=> b!1084131 m!1001387))

(declare-fun m!1001389 () Bool)

(assert (=> b!1084125 m!1001389))

(declare-fun m!1001391 () Bool)

(assert (=> mapNonEmpty!41473 m!1001391))

(declare-fun m!1001393 () Bool)

(assert (=> b!1084129 m!1001393))

(declare-fun m!1001395 () Bool)

(assert (=> b!1084129 m!1001395))

(check-sat (not b!1084123) (not b!1084132) (not b!1084128) (not b_next!22477) (not b_lambda!17125) (not start!95818) (not b!1084131) (not b!1084125) (not b!1084129) tp_is_empty!26479 (not mapNonEmpty!41473) b_and!35605)
(check-sat b_and!35605 (not b_next!22477))
