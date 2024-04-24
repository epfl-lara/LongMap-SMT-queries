; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96378 () Bool)

(assert start!96378)

(declare-fun b_free!22795 () Bool)

(declare-fun b_next!22795 () Bool)

(assert (=> start!96378 (= b_free!22795 (not b_next!22795))))

(declare-fun tp!80233 () Bool)

(declare-fun b_and!36275 () Bool)

(assert (=> start!96378 (= tp!80233 b_and!36275)))

(declare-fun b!1092566 () Bool)

(declare-fun e!624086 () Bool)

(declare-fun tp_is_empty!26797 () Bool)

(assert (=> b!1092566 (= e!624086 tp_is_empty!26797)))

(declare-fun mapIsEmpty!41950 () Bool)

(declare-fun mapRes!41950 () Bool)

(assert (=> mapIsEmpty!41950 mapRes!41950))

(declare-fun b!1092567 () Bool)

(declare-fun e!624084 () Bool)

(declare-fun e!624088 () Bool)

(assert (=> b!1092567 (= e!624084 (not e!624088))))

(declare-fun res!728580 () Bool)

(assert (=> b!1092567 (=> res!728580 e!624088)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092567 (= res!728580 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40857 0))(
  ( (V!40858 (val!13455 Int)) )
))
(declare-fun minValue!831 () V!40857)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17114 0))(
  ( (tuple2!17115 (_1!8568 (_ BitVec 64)) (_2!8568 V!40857)) )
))
(declare-datatypes ((List!23708 0))(
  ( (Nil!23705) (Cons!23704 (h!24922 tuple2!17114) (t!33553 List!23708)) )
))
(declare-datatypes ((ListLongMap!15091 0))(
  ( (ListLongMap!15092 (toList!7561 List!23708)) )
))
(declare-fun lt!487769 () ListLongMap!15091)

(declare-fun zeroValue!831 () V!40857)

(declare-datatypes ((array!70551 0))(
  ( (array!70552 (arr!33943 (Array (_ BitVec 32) (_ BitVec 64))) (size!34480 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70551)

(declare-datatypes ((ValueCell!12689 0))(
  ( (ValueCellFull!12689 (v!16072 V!40857)) (EmptyCell!12689) )
))
(declare-datatypes ((array!70553 0))(
  ( (array!70554 (arr!33944 (Array (_ BitVec 32) ValueCell!12689)) (size!34481 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70553)

(declare-fun getCurrentListMap!4313 (array!70551 array!70553 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) Int) ListLongMap!15091)

(assert (=> b!1092567 (= lt!487769 (getCurrentListMap!4313 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487766 () array!70553)

(declare-fun lt!487759 () array!70551)

(declare-fun lt!487764 () ListLongMap!15091)

(assert (=> b!1092567 (= lt!487764 (getCurrentListMap!4313 lt!487759 lt!487766 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487761 () ListLongMap!15091)

(declare-fun lt!487767 () ListLongMap!15091)

(assert (=> b!1092567 (and (= lt!487761 lt!487767) (= lt!487767 lt!487761))))

(declare-fun lt!487765 () ListLongMap!15091)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!867 (ListLongMap!15091 (_ BitVec 64)) ListLongMap!15091)

(assert (=> b!1092567 (= lt!487767 (-!867 lt!487765 k0!904))))

(declare-datatypes ((Unit!35901 0))(
  ( (Unit!35902) )
))
(declare-fun lt!487770 () Unit!35901)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!142 (array!70551 array!70553 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35901)

(assert (=> b!1092567 (= lt!487770 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!142 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4118 (array!70551 array!70553 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) Int) ListLongMap!15091)

(assert (=> b!1092567 (= lt!487761 (getCurrentListMapNoExtraKeys!4118 lt!487759 lt!487766 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2239 (Int (_ BitVec 64)) V!40857)

(assert (=> b!1092567 (= lt!487766 (array!70554 (store (arr!33944 _values!874) i!650 (ValueCellFull!12689 (dynLambda!2239 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34481 _values!874)))))

(assert (=> b!1092567 (= lt!487765 (getCurrentListMapNoExtraKeys!4118 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092567 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487768 () Unit!35901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70551 (_ BitVec 64) (_ BitVec 32)) Unit!35901)

(assert (=> b!1092567 (= lt!487768 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41950 () Bool)

(declare-fun tp!80234 () Bool)

(declare-fun e!624089 () Bool)

(assert (=> mapNonEmpty!41950 (= mapRes!41950 (and tp!80234 e!624089))))

(declare-fun mapKey!41950 () (_ BitVec 32))

(declare-fun mapRest!41950 () (Array (_ BitVec 32) ValueCell!12689))

(declare-fun mapValue!41950 () ValueCell!12689)

(assert (=> mapNonEmpty!41950 (= (arr!33944 _values!874) (store mapRest!41950 mapKey!41950 mapValue!41950))))

(declare-fun b!1092568 () Bool)

(declare-fun res!728575 () Bool)

(declare-fun e!624083 () Bool)

(assert (=> b!1092568 (=> (not res!728575) (not e!624083))))

(assert (=> b!1092568 (= res!728575 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34480 _keys!1070))))))

(declare-fun b!1092569 () Bool)

(declare-fun e!624082 () Bool)

(assert (=> b!1092569 (= e!624082 true)))

(declare-fun lt!487763 () ListLongMap!15091)

(declare-fun lt!487760 () ListLongMap!15091)

(assert (=> b!1092569 (= (-!867 lt!487763 k0!904) lt!487760)))

(declare-fun lt!487758 () Unit!35901)

(declare-fun addRemoveCommutativeForDiffKeys!100 (ListLongMap!15091 (_ BitVec 64) V!40857 (_ BitVec 64)) Unit!35901)

(assert (=> b!1092569 (= lt!487758 (addRemoveCommutativeForDiffKeys!100 lt!487765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092570 () Bool)

(declare-fun res!728583 () Bool)

(assert (=> b!1092570 (=> (not res!728583) (not e!624083))))

(assert (=> b!1092570 (= res!728583 (= (select (arr!33943 _keys!1070) i!650) k0!904))))

(declare-fun res!728578 () Bool)

(assert (=> start!96378 (=> (not res!728578) (not e!624083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96378 (= res!728578 (validMask!0 mask!1414))))

(assert (=> start!96378 e!624083))

(assert (=> start!96378 tp!80233))

(assert (=> start!96378 true))

(assert (=> start!96378 tp_is_empty!26797))

(declare-fun array_inv!26212 (array!70551) Bool)

(assert (=> start!96378 (array_inv!26212 _keys!1070)))

(declare-fun e!624087 () Bool)

(declare-fun array_inv!26213 (array!70553) Bool)

(assert (=> start!96378 (and (array_inv!26213 _values!874) e!624087)))

(declare-fun b!1092571 () Bool)

(assert (=> b!1092571 (= e!624087 (and e!624086 mapRes!41950))))

(declare-fun condMapEmpty!41950 () Bool)

(declare-fun mapDefault!41950 () ValueCell!12689)

(assert (=> b!1092571 (= condMapEmpty!41950 (= (arr!33944 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12689)) mapDefault!41950)))))

(declare-fun b!1092572 () Bool)

(assert (=> b!1092572 (= e!624088 e!624082)))

(declare-fun res!728581 () Bool)

(assert (=> b!1092572 (=> res!728581 e!624082)))

(assert (=> b!1092572 (= res!728581 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1092572 (= lt!487769 lt!487763)))

(declare-fun lt!487762 () tuple2!17114)

(declare-fun +!3376 (ListLongMap!15091 tuple2!17114) ListLongMap!15091)

(assert (=> b!1092572 (= lt!487763 (+!3376 lt!487765 lt!487762))))

(assert (=> b!1092572 (= lt!487764 lt!487760)))

(assert (=> b!1092572 (= lt!487760 (+!3376 lt!487767 lt!487762))))

(assert (=> b!1092572 (= lt!487764 (+!3376 lt!487761 lt!487762))))

(assert (=> b!1092572 (= lt!487762 (tuple2!17115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092573 () Bool)

(declare-fun res!728579 () Bool)

(assert (=> b!1092573 (=> (not res!728579) (not e!624083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092573 (= res!728579 (validKeyInArray!0 k0!904))))

(declare-fun b!1092574 () Bool)

(declare-fun res!728574 () Bool)

(assert (=> b!1092574 (=> (not res!728574) (not e!624083))))

(declare-datatypes ((List!23709 0))(
  ( (Nil!23706) (Cons!23705 (h!24923 (_ BitVec 64)) (t!33554 List!23709)) )
))
(declare-fun arrayNoDuplicates!0 (array!70551 (_ BitVec 32) List!23709) Bool)

(assert (=> b!1092574 (= res!728574 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23706))))

(declare-fun b!1092575 () Bool)

(assert (=> b!1092575 (= e!624089 tp_is_empty!26797)))

(declare-fun b!1092576 () Bool)

(declare-fun res!728577 () Bool)

(assert (=> b!1092576 (=> (not res!728577) (not e!624083))))

(assert (=> b!1092576 (= res!728577 (and (= (size!34481 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34480 _keys!1070) (size!34481 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092577 () Bool)

(assert (=> b!1092577 (= e!624083 e!624084)))

(declare-fun res!728573 () Bool)

(assert (=> b!1092577 (=> (not res!728573) (not e!624084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70551 (_ BitVec 32)) Bool)

(assert (=> b!1092577 (= res!728573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487759 mask!1414))))

(assert (=> b!1092577 (= lt!487759 (array!70552 (store (arr!33943 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34480 _keys!1070)))))

(declare-fun b!1092578 () Bool)

(declare-fun res!728582 () Bool)

(assert (=> b!1092578 (=> (not res!728582) (not e!624083))))

(assert (=> b!1092578 (= res!728582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092579 () Bool)

(declare-fun res!728576 () Bool)

(assert (=> b!1092579 (=> (not res!728576) (not e!624084))))

(assert (=> b!1092579 (= res!728576 (arrayNoDuplicates!0 lt!487759 #b00000000000000000000000000000000 Nil!23706))))

(assert (= (and start!96378 res!728578) b!1092576))

(assert (= (and b!1092576 res!728577) b!1092578))

(assert (= (and b!1092578 res!728582) b!1092574))

(assert (= (and b!1092574 res!728574) b!1092568))

(assert (= (and b!1092568 res!728575) b!1092573))

(assert (= (and b!1092573 res!728579) b!1092570))

(assert (= (and b!1092570 res!728583) b!1092577))

(assert (= (and b!1092577 res!728573) b!1092579))

(assert (= (and b!1092579 res!728576) b!1092567))

(assert (= (and b!1092567 (not res!728580)) b!1092572))

(assert (= (and b!1092572 (not res!728581)) b!1092569))

(assert (= (and b!1092571 condMapEmpty!41950) mapIsEmpty!41950))

(assert (= (and b!1092571 (not condMapEmpty!41950)) mapNonEmpty!41950))

(get-info :version)

(assert (= (and mapNonEmpty!41950 ((_ is ValueCellFull!12689) mapValue!41950)) b!1092575))

(assert (= (and b!1092571 ((_ is ValueCellFull!12689) mapDefault!41950)) b!1092566))

(assert (= start!96378 b!1092571))

(declare-fun b_lambda!17475 () Bool)

(assert (=> (not b_lambda!17475) (not b!1092567)))

(declare-fun t!33552 () Bool)

(declare-fun tb!7665 () Bool)

(assert (=> (and start!96378 (= defaultEntry!882 defaultEntry!882) t!33552) tb!7665))

(declare-fun result!15857 () Bool)

(assert (=> tb!7665 (= result!15857 tp_is_empty!26797)))

(assert (=> b!1092567 t!33552))

(declare-fun b_and!36277 () Bool)

(assert (= b_and!36275 (and (=> t!33552 result!15857) b_and!36277)))

(declare-fun m!1012463 () Bool)

(assert (=> b!1092574 m!1012463))

(declare-fun m!1012465 () Bool)

(assert (=> mapNonEmpty!41950 m!1012465))

(declare-fun m!1012467 () Bool)

(assert (=> b!1092569 m!1012467))

(declare-fun m!1012469 () Bool)

(assert (=> b!1092569 m!1012469))

(declare-fun m!1012471 () Bool)

(assert (=> b!1092578 m!1012471))

(declare-fun m!1012473 () Bool)

(assert (=> b!1092573 m!1012473))

(declare-fun m!1012475 () Bool)

(assert (=> b!1092570 m!1012475))

(declare-fun m!1012477 () Bool)

(assert (=> b!1092572 m!1012477))

(declare-fun m!1012479 () Bool)

(assert (=> b!1092572 m!1012479))

(declare-fun m!1012481 () Bool)

(assert (=> b!1092572 m!1012481))

(declare-fun m!1012483 () Bool)

(assert (=> b!1092579 m!1012483))

(declare-fun m!1012485 () Bool)

(assert (=> b!1092567 m!1012485))

(declare-fun m!1012487 () Bool)

(assert (=> b!1092567 m!1012487))

(declare-fun m!1012489 () Bool)

(assert (=> b!1092567 m!1012489))

(declare-fun m!1012491 () Bool)

(assert (=> b!1092567 m!1012491))

(declare-fun m!1012493 () Bool)

(assert (=> b!1092567 m!1012493))

(declare-fun m!1012495 () Bool)

(assert (=> b!1092567 m!1012495))

(declare-fun m!1012497 () Bool)

(assert (=> b!1092567 m!1012497))

(declare-fun m!1012499 () Bool)

(assert (=> b!1092567 m!1012499))

(declare-fun m!1012501 () Bool)

(assert (=> b!1092567 m!1012501))

(declare-fun m!1012503 () Bool)

(assert (=> b!1092567 m!1012503))

(declare-fun m!1012505 () Bool)

(assert (=> b!1092577 m!1012505))

(declare-fun m!1012507 () Bool)

(assert (=> b!1092577 m!1012507))

(declare-fun m!1012509 () Bool)

(assert (=> start!96378 m!1012509))

(declare-fun m!1012511 () Bool)

(assert (=> start!96378 m!1012511))

(declare-fun m!1012513 () Bool)

(assert (=> start!96378 m!1012513))

(check-sat (not b_next!22795) (not b!1092567) (not b!1092579) (not start!96378) (not b!1092577) tp_is_empty!26797 (not b_lambda!17475) (not b!1092578) (not b!1092569) b_and!36277 (not mapNonEmpty!41950) (not b!1092574) (not b!1092573) (not b!1092572))
(check-sat b_and!36277 (not b_next!22795))
