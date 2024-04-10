; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96912 () Bool)

(assert start!96912)

(declare-fun b_free!23205 () Bool)

(declare-fun b_next!23205 () Bool)

(assert (=> start!96912 (= b_free!23205 (not b_next!23205))))

(declare-fun tp!81574 () Bool)

(declare-fun b_and!37227 () Bool)

(assert (=> start!96912 (= tp!81574 b_and!37227)))

(declare-fun mapNonEmpty!42676 () Bool)

(declare-fun mapRes!42676 () Bool)

(declare-fun tp!81575 () Bool)

(declare-fun e!629310 () Bool)

(assert (=> mapNonEmpty!42676 (= mapRes!42676 (and tp!81575 e!629310))))

(declare-datatypes ((V!41467 0))(
  ( (V!41468 (val!13684 Int)) )
))
(declare-datatypes ((ValueCell!12918 0))(
  ( (ValueCellFull!12918 (v!16315 V!41467)) (EmptyCell!12918) )
))
(declare-datatypes ((array!71431 0))(
  ( (array!71432 (arr!34376 (Array (_ BitVec 32) ValueCell!12918)) (size!34912 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71431)

(declare-fun mapKey!42676 () (_ BitVec 32))

(declare-fun mapRest!42676 () (Array (_ BitVec 32) ValueCell!12918))

(declare-fun mapValue!42676 () ValueCell!12918)

(assert (=> mapNonEmpty!42676 (= (arr!34376 _values!874) (store mapRest!42676 mapKey!42676 mapValue!42676))))

(declare-fun b!1102543 () Bool)

(declare-fun res!735643 () Bool)

(declare-fun e!629307 () Bool)

(assert (=> b!1102543 (=> (not res!735643) (not e!629307))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71433 0))(
  ( (array!71434 (arr!34377 (Array (_ BitVec 32) (_ BitVec 64))) (size!34913 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71433)

(assert (=> b!1102543 (= res!735643 (= (select (arr!34377 _keys!1070) i!650) k0!904))))

(declare-fun b!1102544 () Bool)

(declare-fun res!735642 () Bool)

(assert (=> b!1102544 (=> (not res!735642) (not e!629307))))

(assert (=> b!1102544 (= res!735642 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34913 _keys!1070))))))

(declare-fun b!1102545 () Bool)

(declare-fun res!735646 () Bool)

(assert (=> b!1102545 (=> (not res!735646) (not e!629307))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71433 (_ BitVec 32)) Bool)

(assert (=> b!1102545 (= res!735646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102546 () Bool)

(declare-fun res!735641 () Bool)

(assert (=> b!1102546 (=> (not res!735641) (not e!629307))))

(declare-datatypes ((List!24020 0))(
  ( (Nil!24017) (Cons!24016 (h!25225 (_ BitVec 64)) (t!34271 List!24020)) )
))
(declare-fun arrayNoDuplicates!0 (array!71433 (_ BitVec 32) List!24020) Bool)

(assert (=> b!1102546 (= res!735641 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24017))))

(declare-fun b!1102547 () Bool)

(declare-fun tp_is_empty!27255 () Bool)

(assert (=> b!1102547 (= e!629310 tp_is_empty!27255)))

(declare-fun b!1102548 () Bool)

(declare-fun res!735639 () Bool)

(assert (=> b!1102548 (=> (not res!735639) (not e!629307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102548 (= res!735639 (validKeyInArray!0 k0!904))))

(declare-fun b!1102549 () Bool)

(declare-fun e!629309 () Bool)

(assert (=> b!1102549 (= e!629309 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41467)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17404 0))(
  ( (tuple2!17405 (_1!8713 (_ BitVec 64)) (_2!8713 V!41467)) )
))
(declare-datatypes ((List!24021 0))(
  ( (Nil!24018) (Cons!24017 (h!25226 tuple2!17404) (t!34272 List!24021)) )
))
(declare-datatypes ((ListLongMap!15373 0))(
  ( (ListLongMap!15374 (toList!7702 List!24021)) )
))
(declare-fun lt!494691 () ListLongMap!15373)

(declare-fun zeroValue!831 () V!41467)

(declare-fun getCurrentListMap!4406 (array!71433 array!71431 (_ BitVec 32) (_ BitVec 32) V!41467 V!41467 (_ BitVec 32) Int) ListLongMap!15373)

(assert (=> b!1102549 (= lt!494691 (getCurrentListMap!4406 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494695 () array!71433)

(declare-fun lt!494690 () array!71431)

(declare-fun lt!494692 () ListLongMap!15373)

(assert (=> b!1102549 (= lt!494692 (getCurrentListMap!4406 lt!494695 lt!494690 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494694 () ListLongMap!15373)

(declare-fun lt!494697 () ListLongMap!15373)

(assert (=> b!1102549 (and (= lt!494694 lt!494697) (= lt!494697 lt!494694))))

(declare-fun lt!494696 () ListLongMap!15373)

(declare-fun -!985 (ListLongMap!15373 (_ BitVec 64)) ListLongMap!15373)

(assert (=> b!1102549 (= lt!494697 (-!985 lt!494696 k0!904))))

(declare-datatypes ((Unit!36224 0))(
  ( (Unit!36225) )
))
(declare-fun lt!494689 () Unit!36224)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 (array!71433 array!71431 (_ BitVec 32) (_ BitVec 32) V!41467 V!41467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36224)

(assert (=> b!1102549 (= lt!494689 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4202 (array!71433 array!71431 (_ BitVec 32) (_ BitVec 32) V!41467 V!41467 (_ BitVec 32) Int) ListLongMap!15373)

(assert (=> b!1102549 (= lt!494694 (getCurrentListMapNoExtraKeys!4202 lt!494695 lt!494690 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2337 (Int (_ BitVec 64)) V!41467)

(assert (=> b!1102549 (= lt!494690 (array!71432 (store (arr!34376 _values!874) i!650 (ValueCellFull!12918 (dynLambda!2337 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34912 _values!874)))))

(assert (=> b!1102549 (= lt!494696 (getCurrentListMapNoExtraKeys!4202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102549 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494693 () Unit!36224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71433 (_ BitVec 64) (_ BitVec 32)) Unit!36224)

(assert (=> b!1102549 (= lt!494693 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102550 () Bool)

(declare-fun e!629308 () Bool)

(assert (=> b!1102550 (= e!629308 tp_is_empty!27255)))

(declare-fun mapIsEmpty!42676 () Bool)

(assert (=> mapIsEmpty!42676 mapRes!42676))

(declare-fun res!735640 () Bool)

(assert (=> start!96912 (=> (not res!735640) (not e!629307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96912 (= res!735640 (validMask!0 mask!1414))))

(assert (=> start!96912 e!629307))

(assert (=> start!96912 tp!81574))

(assert (=> start!96912 true))

(assert (=> start!96912 tp_is_empty!27255))

(declare-fun array_inv!26476 (array!71433) Bool)

(assert (=> start!96912 (array_inv!26476 _keys!1070)))

(declare-fun e!629311 () Bool)

(declare-fun array_inv!26477 (array!71431) Bool)

(assert (=> start!96912 (and (array_inv!26477 _values!874) e!629311)))

(declare-fun b!1102551 () Bool)

(assert (=> b!1102551 (= e!629311 (and e!629308 mapRes!42676))))

(declare-fun condMapEmpty!42676 () Bool)

(declare-fun mapDefault!42676 () ValueCell!12918)

(assert (=> b!1102551 (= condMapEmpty!42676 (= (arr!34376 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12918)) mapDefault!42676)))))

(declare-fun b!1102552 () Bool)

(declare-fun res!735638 () Bool)

(assert (=> b!1102552 (=> (not res!735638) (not e!629309))))

(assert (=> b!1102552 (= res!735638 (arrayNoDuplicates!0 lt!494695 #b00000000000000000000000000000000 Nil!24017))))

(declare-fun b!1102553 () Bool)

(declare-fun res!735645 () Bool)

(assert (=> b!1102553 (=> (not res!735645) (not e!629307))))

(assert (=> b!1102553 (= res!735645 (and (= (size!34912 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34913 _keys!1070) (size!34912 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102554 () Bool)

(assert (=> b!1102554 (= e!629307 e!629309)))

(declare-fun res!735644 () Bool)

(assert (=> b!1102554 (=> (not res!735644) (not e!629309))))

(assert (=> b!1102554 (= res!735644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494695 mask!1414))))

(assert (=> b!1102554 (= lt!494695 (array!71434 (store (arr!34377 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34913 _keys!1070)))))

(assert (= (and start!96912 res!735640) b!1102553))

(assert (= (and b!1102553 res!735645) b!1102545))

(assert (= (and b!1102545 res!735646) b!1102546))

(assert (= (and b!1102546 res!735641) b!1102544))

(assert (= (and b!1102544 res!735642) b!1102548))

(assert (= (and b!1102548 res!735639) b!1102543))

(assert (= (and b!1102543 res!735643) b!1102554))

(assert (= (and b!1102554 res!735644) b!1102552))

(assert (= (and b!1102552 res!735638) b!1102549))

(assert (= (and b!1102551 condMapEmpty!42676) mapIsEmpty!42676))

(assert (= (and b!1102551 (not condMapEmpty!42676)) mapNonEmpty!42676))

(get-info :version)

(assert (= (and mapNonEmpty!42676 ((_ is ValueCellFull!12918) mapValue!42676)) b!1102547))

(assert (= (and b!1102551 ((_ is ValueCellFull!12918) mapDefault!42676)) b!1102550))

(assert (= start!96912 b!1102551))

(declare-fun b_lambda!18193 () Bool)

(assert (=> (not b_lambda!18193) (not b!1102549)))

(declare-fun t!34270 () Bool)

(declare-fun tb!8071 () Bool)

(assert (=> (and start!96912 (= defaultEntry!882 defaultEntry!882) t!34270) tb!8071))

(declare-fun result!16687 () Bool)

(assert (=> tb!8071 (= result!16687 tp_is_empty!27255)))

(assert (=> b!1102549 t!34270))

(declare-fun b_and!37229 () Bool)

(assert (= b_and!37227 (and (=> t!34270 result!16687) b_and!37229)))

(declare-fun m!1022847 () Bool)

(assert (=> b!1102546 m!1022847))

(declare-fun m!1022849 () Bool)

(assert (=> b!1102543 m!1022849))

(declare-fun m!1022851 () Bool)

(assert (=> start!96912 m!1022851))

(declare-fun m!1022853 () Bool)

(assert (=> start!96912 m!1022853))

(declare-fun m!1022855 () Bool)

(assert (=> start!96912 m!1022855))

(declare-fun m!1022857 () Bool)

(assert (=> b!1102548 m!1022857))

(declare-fun m!1022859 () Bool)

(assert (=> b!1102552 m!1022859))

(declare-fun m!1022861 () Bool)

(assert (=> b!1102549 m!1022861))

(declare-fun m!1022863 () Bool)

(assert (=> b!1102549 m!1022863))

(declare-fun m!1022865 () Bool)

(assert (=> b!1102549 m!1022865))

(declare-fun m!1022867 () Bool)

(assert (=> b!1102549 m!1022867))

(declare-fun m!1022869 () Bool)

(assert (=> b!1102549 m!1022869))

(declare-fun m!1022871 () Bool)

(assert (=> b!1102549 m!1022871))

(declare-fun m!1022873 () Bool)

(assert (=> b!1102549 m!1022873))

(declare-fun m!1022875 () Bool)

(assert (=> b!1102549 m!1022875))

(declare-fun m!1022877 () Bool)

(assert (=> b!1102549 m!1022877))

(declare-fun m!1022879 () Bool)

(assert (=> b!1102549 m!1022879))

(declare-fun m!1022881 () Bool)

(assert (=> mapNonEmpty!42676 m!1022881))

(declare-fun m!1022883 () Bool)

(assert (=> b!1102554 m!1022883))

(declare-fun m!1022885 () Bool)

(assert (=> b!1102554 m!1022885))

(declare-fun m!1022887 () Bool)

(assert (=> b!1102545 m!1022887))

(check-sat (not b!1102546) b_and!37229 (not b!1102552) (not b!1102554) tp_is_empty!27255 (not b_lambda!18193) (not mapNonEmpty!42676) (not b!1102549) (not b!1102548) (not b!1102545) (not b_next!23205) (not start!96912))
(check-sat b_and!37229 (not b_next!23205))
