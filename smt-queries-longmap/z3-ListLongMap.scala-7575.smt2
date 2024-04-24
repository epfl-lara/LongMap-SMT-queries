; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96006 () Bool)

(assert start!96006)

(declare-fun b_free!22423 () Bool)

(declare-fun b_next!22423 () Bool)

(assert (=> start!96006 (= b_free!22423 (not b_next!22423))))

(declare-fun tp!79118 () Bool)

(declare-fun b_and!35531 () Bool)

(assert (=> start!96006 (= tp!79118 b_and!35531)))

(declare-fun b!1084576 () Bool)

(declare-fun res!722635 () Bool)

(declare-fun e!619840 () Bool)

(assert (=> b!1084576 (=> (not res!722635) (not e!619840))))

(declare-datatypes ((array!69831 0))(
  ( (array!69832 (arr!33583 (Array (_ BitVec 32) (_ BitVec 64))) (size!34120 (_ BitVec 32))) )
))
(declare-fun lt!480501 () array!69831)

(declare-datatypes ((List!23413 0))(
  ( (Nil!23410) (Cons!23409 (h!24627 (_ BitVec 64)) (t!32886 List!23413)) )
))
(declare-fun arrayNoDuplicates!0 (array!69831 (_ BitVec 32) List!23413) Bool)

(assert (=> b!1084576 (= res!722635 (arrayNoDuplicates!0 lt!480501 #b00000000000000000000000000000000 Nil!23410))))

(declare-fun b!1084577 () Bool)

(declare-fun res!722634 () Bool)

(declare-fun e!619843 () Bool)

(assert (=> b!1084577 (=> (not res!722634) (not e!619843))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69831)

(declare-datatypes ((V!40361 0))(
  ( (V!40362 (val!13269 Int)) )
))
(declare-datatypes ((ValueCell!12503 0))(
  ( (ValueCellFull!12503 (v!15886 V!40361)) (EmptyCell!12503) )
))
(declare-datatypes ((array!69833 0))(
  ( (array!69834 (arr!33584 (Array (_ BitVec 32) ValueCell!12503)) (size!34121 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69833)

(assert (=> b!1084577 (= res!722634 (and (= (size!34121 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34120 _keys!1070) (size!34121 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084578 () Bool)

(assert (=> b!1084578 (= e!619840 (not true))))

(declare-datatypes ((tuple2!16818 0))(
  ( (tuple2!16819 (_1!8420 (_ BitVec 64)) (_2!8420 V!40361)) )
))
(declare-datatypes ((List!23414 0))(
  ( (Nil!23411) (Cons!23410 (h!24628 tuple2!16818) (t!32887 List!23414)) )
))
(declare-datatypes ((ListLongMap!14795 0))(
  ( (ListLongMap!14796 (toList!7413 List!23414)) )
))
(declare-fun lt!480500 () ListLongMap!14795)

(declare-fun lt!480499 () ListLongMap!14795)

(assert (=> b!1084578 (and (= lt!480500 lt!480499) (= lt!480499 lt!480500))))

(declare-fun lt!480502 () ListLongMap!14795)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!725 (ListLongMap!14795 (_ BitVec 64)) ListLongMap!14795)

(assert (=> b!1084578 (= lt!480499 (-!725 lt!480502 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40361)

(declare-fun minValue!831 () V!40361)

(declare-datatypes ((Unit!35617 0))(
  ( (Unit!35618) )
))
(declare-fun lt!480504 () Unit!35617)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!14 (array!69831 array!69833 (_ BitVec 32) (_ BitVec 32) V!40361 V!40361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35617)

(assert (=> b!1084578 (= lt!480504 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!14 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3990 (array!69831 array!69833 (_ BitVec 32) (_ BitVec 32) V!40361 V!40361 (_ BitVec 32) Int) ListLongMap!14795)

(declare-fun dynLambda!2111 (Int (_ BitVec 64)) V!40361)

(assert (=> b!1084578 (= lt!480500 (getCurrentListMapNoExtraKeys!3990 lt!480501 (array!69834 (store (arr!33584 _values!874) i!650 (ValueCellFull!12503 (dynLambda!2111 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34121 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084578 (= lt!480502 (getCurrentListMapNoExtraKeys!3990 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084578 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480503 () Unit!35617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69831 (_ BitVec 64) (_ BitVec 32)) Unit!35617)

(assert (=> b!1084578 (= lt!480503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41392 () Bool)

(declare-fun mapRes!41392 () Bool)

(declare-fun tp!79117 () Bool)

(declare-fun e!619842 () Bool)

(assert (=> mapNonEmpty!41392 (= mapRes!41392 (and tp!79117 e!619842))))

(declare-fun mapValue!41392 () ValueCell!12503)

(declare-fun mapRest!41392 () (Array (_ BitVec 32) ValueCell!12503))

(declare-fun mapKey!41392 () (_ BitVec 32))

(assert (=> mapNonEmpty!41392 (= (arr!33584 _values!874) (store mapRest!41392 mapKey!41392 mapValue!41392))))

(declare-fun b!1084580 () Bool)

(declare-fun res!722636 () Bool)

(assert (=> b!1084580 (=> (not res!722636) (not e!619843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69831 (_ BitVec 32)) Bool)

(assert (=> b!1084580 (= res!722636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084581 () Bool)

(declare-fun e!619841 () Bool)

(declare-fun tp_is_empty!26425 () Bool)

(assert (=> b!1084581 (= e!619841 tp_is_empty!26425)))

(declare-fun b!1084582 () Bool)

(declare-fun e!619839 () Bool)

(assert (=> b!1084582 (= e!619839 (and e!619841 mapRes!41392))))

(declare-fun condMapEmpty!41392 () Bool)

(declare-fun mapDefault!41392 () ValueCell!12503)

(assert (=> b!1084582 (= condMapEmpty!41392 (= (arr!33584 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12503)) mapDefault!41392)))))

(declare-fun mapIsEmpty!41392 () Bool)

(assert (=> mapIsEmpty!41392 mapRes!41392))

(declare-fun b!1084583 () Bool)

(declare-fun res!722631 () Bool)

(assert (=> b!1084583 (=> (not res!722631) (not e!619843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084583 (= res!722631 (validKeyInArray!0 k0!904))))

(declare-fun b!1084584 () Bool)

(declare-fun res!722633 () Bool)

(assert (=> b!1084584 (=> (not res!722633) (not e!619843))))

(assert (=> b!1084584 (= res!722633 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34120 _keys!1070))))))

(declare-fun b!1084585 () Bool)

(assert (=> b!1084585 (= e!619843 e!619840)))

(declare-fun res!722629 () Bool)

(assert (=> b!1084585 (=> (not res!722629) (not e!619840))))

(assert (=> b!1084585 (= res!722629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480501 mask!1414))))

(assert (=> b!1084585 (= lt!480501 (array!69832 (store (arr!33583 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34120 _keys!1070)))))

(declare-fun b!1084586 () Bool)

(declare-fun res!722630 () Bool)

(assert (=> b!1084586 (=> (not res!722630) (not e!619843))))

(assert (=> b!1084586 (= res!722630 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23410))))

(declare-fun b!1084587 () Bool)

(assert (=> b!1084587 (= e!619842 tp_is_empty!26425)))

(declare-fun res!722637 () Bool)

(assert (=> start!96006 (=> (not res!722637) (not e!619843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96006 (= res!722637 (validMask!0 mask!1414))))

(assert (=> start!96006 e!619843))

(assert (=> start!96006 tp!79118))

(assert (=> start!96006 true))

(assert (=> start!96006 tp_is_empty!26425))

(declare-fun array_inv!25966 (array!69831) Bool)

(assert (=> start!96006 (array_inv!25966 _keys!1070)))

(declare-fun array_inv!25967 (array!69833) Bool)

(assert (=> start!96006 (and (array_inv!25967 _values!874) e!619839)))

(declare-fun b!1084579 () Bool)

(declare-fun res!722632 () Bool)

(assert (=> b!1084579 (=> (not res!722632) (not e!619843))))

(assert (=> b!1084579 (= res!722632 (= (select (arr!33583 _keys!1070) i!650) k0!904))))

(assert (= (and start!96006 res!722637) b!1084577))

(assert (= (and b!1084577 res!722634) b!1084580))

(assert (= (and b!1084580 res!722636) b!1084586))

(assert (= (and b!1084586 res!722630) b!1084584))

(assert (= (and b!1084584 res!722633) b!1084583))

(assert (= (and b!1084583 res!722631) b!1084579))

(assert (= (and b!1084579 res!722632) b!1084585))

(assert (= (and b!1084585 res!722629) b!1084576))

(assert (= (and b!1084576 res!722635) b!1084578))

(assert (= (and b!1084582 condMapEmpty!41392) mapIsEmpty!41392))

(assert (= (and b!1084582 (not condMapEmpty!41392)) mapNonEmpty!41392))

(get-info :version)

(assert (= (and mapNonEmpty!41392 ((_ is ValueCellFull!12503) mapValue!41392)) b!1084587))

(assert (= (and b!1084582 ((_ is ValueCellFull!12503) mapDefault!41392)) b!1084581))

(assert (= start!96006 b!1084582))

(declare-fun b_lambda!17103 () Bool)

(assert (=> (not b_lambda!17103) (not b!1084578)))

(declare-fun t!32885 () Bool)

(declare-fun tb!7293 () Bool)

(assert (=> (and start!96006 (= defaultEntry!882 defaultEntry!882) t!32885) tb!7293))

(declare-fun result!15113 () Bool)

(assert (=> tb!7293 (= result!15113 tp_is_empty!26425)))

(assert (=> b!1084578 t!32885))

(declare-fun b_and!35533 () Bool)

(assert (= b_and!35531 (and (=> t!32885 result!15113) b_and!35533)))

(declare-fun m!1002593 () Bool)

(assert (=> b!1084579 m!1002593))

(declare-fun m!1002595 () Bool)

(assert (=> b!1084580 m!1002595))

(declare-fun m!1002597 () Bool)

(assert (=> start!96006 m!1002597))

(declare-fun m!1002599 () Bool)

(assert (=> start!96006 m!1002599))

(declare-fun m!1002601 () Bool)

(assert (=> start!96006 m!1002601))

(declare-fun m!1002603 () Bool)

(assert (=> b!1084578 m!1002603))

(declare-fun m!1002605 () Bool)

(assert (=> b!1084578 m!1002605))

(declare-fun m!1002607 () Bool)

(assert (=> b!1084578 m!1002607))

(declare-fun m!1002609 () Bool)

(assert (=> b!1084578 m!1002609))

(declare-fun m!1002611 () Bool)

(assert (=> b!1084578 m!1002611))

(declare-fun m!1002613 () Bool)

(assert (=> b!1084578 m!1002613))

(declare-fun m!1002615 () Bool)

(assert (=> b!1084578 m!1002615))

(declare-fun m!1002617 () Bool)

(assert (=> b!1084578 m!1002617))

(declare-fun m!1002619 () Bool)

(assert (=> b!1084585 m!1002619))

(declare-fun m!1002621 () Bool)

(assert (=> b!1084585 m!1002621))

(declare-fun m!1002623 () Bool)

(assert (=> b!1084583 m!1002623))

(declare-fun m!1002625 () Bool)

(assert (=> b!1084576 m!1002625))

(declare-fun m!1002627 () Bool)

(assert (=> b!1084586 m!1002627))

(declare-fun m!1002629 () Bool)

(assert (=> mapNonEmpty!41392 m!1002629))

(check-sat (not mapNonEmpty!41392) (not b!1084583) (not b!1084580) (not b!1084585) (not b!1084578) tp_is_empty!26425 (not b_next!22423) (not b_lambda!17103) b_and!35533 (not start!96006) (not b!1084576) (not b!1084586))
(check-sat b_and!35533 (not b_next!22423))
