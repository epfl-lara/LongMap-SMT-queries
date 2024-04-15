; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95734 () Bool)

(assert start!95734)

(declare-fun b_free!22393 () Bool)

(declare-fun b_next!22393 () Bool)

(assert (=> start!95734 (= b_free!22393 (not b_next!22393))))

(declare-fun tp!79027 () Bool)

(declare-fun b_and!35435 () Bool)

(assert (=> start!95734 (= tp!79027 b_and!35435)))

(declare-fun b!1082526 () Bool)

(declare-fun res!721638 () Bool)

(declare-fun e!618626 () Bool)

(assert (=> b!1082526 (=> (not res!721638) (not e!618626))))

(declare-datatypes ((array!69660 0))(
  ( (array!69661 (arr!33504 (Array (_ BitVec 32) (_ BitVec 64))) (size!34042 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69660)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69660 (_ BitVec 32)) Bool)

(assert (=> b!1082526 (= res!721638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082527 () Bool)

(declare-fun e!618622 () Bool)

(assert (=> b!1082527 (= e!618626 e!618622)))

(declare-fun res!721639 () Bool)

(assert (=> b!1082527 (=> (not res!721639) (not e!618622))))

(declare-fun lt!479515 () array!69660)

(assert (=> b!1082527 (= res!721639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479515 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082527 (= lt!479515 (array!69661 (store (arr!33504 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34042 _keys!1070)))))

(declare-fun b!1082528 () Bool)

(declare-fun e!618621 () Bool)

(declare-fun e!618624 () Bool)

(declare-fun mapRes!41347 () Bool)

(assert (=> b!1082528 (= e!618621 (and e!618624 mapRes!41347))))

(declare-fun condMapEmpty!41347 () Bool)

(declare-datatypes ((V!40321 0))(
  ( (V!40322 (val!13254 Int)) )
))
(declare-datatypes ((ValueCell!12488 0))(
  ( (ValueCellFull!12488 (v!15874 V!40321)) (EmptyCell!12488) )
))
(declare-datatypes ((array!69662 0))(
  ( (array!69663 (arr!33505 (Array (_ BitVec 32) ValueCell!12488)) (size!34043 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69662)

(declare-fun mapDefault!41347 () ValueCell!12488)

(assert (=> b!1082528 (= condMapEmpty!41347 (= (arr!33505 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12488)) mapDefault!41347)))))

(declare-fun res!721641 () Bool)

(assert (=> start!95734 (=> (not res!721641) (not e!618626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95734 (= res!721641 (validMask!0 mask!1414))))

(assert (=> start!95734 e!618626))

(assert (=> start!95734 tp!79027))

(assert (=> start!95734 true))

(declare-fun tp_is_empty!26395 () Bool)

(assert (=> start!95734 tp_is_empty!26395))

(declare-fun array_inv!25900 (array!69660) Bool)

(assert (=> start!95734 (array_inv!25900 _keys!1070)))

(declare-fun array_inv!25901 (array!69662) Bool)

(assert (=> start!95734 (and (array_inv!25901 _values!874) e!618621)))

(declare-fun b!1082529 () Bool)

(declare-fun res!721636 () Bool)

(assert (=> b!1082529 (=> (not res!721636) (not e!618626))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082529 (= res!721636 (validKeyInArray!0 k0!904))))

(declare-fun b!1082530 () Bool)

(declare-fun res!721635 () Bool)

(assert (=> b!1082530 (=> (not res!721635) (not e!618626))))

(declare-datatypes ((List!23419 0))(
  ( (Nil!23416) (Cons!23415 (h!24624 (_ BitVec 64)) (t!32861 List!23419)) )
))
(declare-fun arrayNoDuplicates!0 (array!69660 (_ BitVec 32) List!23419) Bool)

(assert (=> b!1082530 (= res!721635 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23416))))

(declare-fun mapIsEmpty!41347 () Bool)

(assert (=> mapIsEmpty!41347 mapRes!41347))

(declare-fun b!1082531 () Bool)

(declare-fun res!721633 () Bool)

(assert (=> b!1082531 (=> (not res!721633) (not e!618626))))

(assert (=> b!1082531 (= res!721633 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34042 _keys!1070))))))

(declare-fun b!1082532 () Bool)

(declare-fun res!721637 () Bool)

(assert (=> b!1082532 (=> (not res!721637) (not e!618626))))

(assert (=> b!1082532 (= res!721637 (= (select (arr!33504 _keys!1070) i!650) k0!904))))

(declare-fun b!1082533 () Bool)

(declare-fun res!721634 () Bool)

(assert (=> b!1082533 (=> (not res!721634) (not e!618622))))

(assert (=> b!1082533 (= res!721634 (arrayNoDuplicates!0 lt!479515 #b00000000000000000000000000000000 Nil!23416))))

(declare-fun mapNonEmpty!41347 () Bool)

(declare-fun tp!79028 () Bool)

(declare-fun e!618623 () Bool)

(assert (=> mapNonEmpty!41347 (= mapRes!41347 (and tp!79028 e!618623))))

(declare-fun mapValue!41347 () ValueCell!12488)

(declare-fun mapKey!41347 () (_ BitVec 32))

(declare-fun mapRest!41347 () (Array (_ BitVec 32) ValueCell!12488))

(assert (=> mapNonEmpty!41347 (= (arr!33505 _values!874) (store mapRest!41347 mapKey!41347 mapValue!41347))))

(declare-fun b!1082534 () Bool)

(assert (=> b!1082534 (= e!618623 tp_is_empty!26395)))

(declare-fun b!1082535 () Bool)

(declare-fun res!721640 () Bool)

(assert (=> b!1082535 (=> (not res!721640) (not e!618626))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082535 (= res!721640 (and (= (size!34043 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34042 _keys!1070) (size!34043 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082536 () Bool)

(assert (=> b!1082536 (= e!618624 tp_is_empty!26395)))

(declare-fun b!1082537 () Bool)

(assert (=> b!1082537 (= e!618622 (not true))))

(declare-datatypes ((tuple2!16852 0))(
  ( (tuple2!16853 (_1!8437 (_ BitVec 64)) (_2!8437 V!40321)) )
))
(declare-datatypes ((List!23420 0))(
  ( (Nil!23417) (Cons!23416 (h!24625 tuple2!16852) (t!32862 List!23420)) )
))
(declare-datatypes ((ListLongMap!14821 0))(
  ( (ListLongMap!14822 (toList!7426 List!23420)) )
))
(declare-fun lt!479514 () ListLongMap!14821)

(declare-fun lt!479519 () ListLongMap!14821)

(assert (=> b!1082537 (and (= lt!479514 lt!479519) (= lt!479519 lt!479514))))

(declare-fun lt!479516 () ListLongMap!14821)

(declare-fun -!705 (ListLongMap!14821 (_ BitVec 64)) ListLongMap!14821)

(assert (=> b!1082537 (= lt!479519 (-!705 lt!479516 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40321)

(declare-fun zeroValue!831 () V!40321)

(declare-datatypes ((Unit!35445 0))(
  ( (Unit!35446) )
))
(declare-fun lt!479517 () Unit!35445)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!3 (array!69660 array!69662 (_ BitVec 32) (_ BitVec 32) V!40321 V!40321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35445)

(assert (=> b!1082537 (= lt!479517 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!3 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3989 (array!69660 array!69662 (_ BitVec 32) (_ BitVec 32) V!40321 V!40321 (_ BitVec 32) Int) ListLongMap!14821)

(declare-fun dynLambda!2060 (Int (_ BitVec 64)) V!40321)

(assert (=> b!1082537 (= lt!479514 (getCurrentListMapNoExtraKeys!3989 lt!479515 (array!69663 (store (arr!33505 _values!874) i!650 (ValueCellFull!12488 (dynLambda!2060 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34043 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082537 (= lt!479516 (getCurrentListMapNoExtraKeys!3989 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082537 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479518 () Unit!35445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69660 (_ BitVec 64) (_ BitVec 32)) Unit!35445)

(assert (=> b!1082537 (= lt!479518 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95734 res!721641) b!1082535))

(assert (= (and b!1082535 res!721640) b!1082526))

(assert (= (and b!1082526 res!721638) b!1082530))

(assert (= (and b!1082530 res!721635) b!1082531))

(assert (= (and b!1082531 res!721633) b!1082529))

(assert (= (and b!1082529 res!721636) b!1082532))

(assert (= (and b!1082532 res!721637) b!1082527))

(assert (= (and b!1082527 res!721639) b!1082533))

(assert (= (and b!1082533 res!721634) b!1082537))

(assert (= (and b!1082528 condMapEmpty!41347) mapIsEmpty!41347))

(assert (= (and b!1082528 (not condMapEmpty!41347)) mapNonEmpty!41347))

(get-info :version)

(assert (= (and mapNonEmpty!41347 ((_ is ValueCellFull!12488) mapValue!41347)) b!1082534))

(assert (= (and b!1082528 ((_ is ValueCellFull!12488) mapDefault!41347)) b!1082536))

(assert (= start!95734 b!1082528))

(declare-fun b_lambda!17041 () Bool)

(assert (=> (not b_lambda!17041) (not b!1082537)))

(declare-fun t!32860 () Bool)

(declare-fun tb!7263 () Bool)

(assert (=> (and start!95734 (= defaultEntry!882 defaultEntry!882) t!32860) tb!7263))

(declare-fun result!15053 () Bool)

(assert (=> tb!7263 (= result!15053 tp_is_empty!26395)))

(assert (=> b!1082537 t!32860))

(declare-fun b_and!35437 () Bool)

(assert (= b_and!35435 (and (=> t!32860 result!15053) b_and!35437)))

(declare-fun m!999725 () Bool)

(assert (=> b!1082527 m!999725))

(declare-fun m!999727 () Bool)

(assert (=> b!1082527 m!999727))

(declare-fun m!999729 () Bool)

(assert (=> b!1082532 m!999729))

(declare-fun m!999731 () Bool)

(assert (=> b!1082537 m!999731))

(declare-fun m!999733 () Bool)

(assert (=> b!1082537 m!999733))

(declare-fun m!999735 () Bool)

(assert (=> b!1082537 m!999735))

(declare-fun m!999737 () Bool)

(assert (=> b!1082537 m!999737))

(declare-fun m!999739 () Bool)

(assert (=> b!1082537 m!999739))

(declare-fun m!999741 () Bool)

(assert (=> b!1082537 m!999741))

(declare-fun m!999743 () Bool)

(assert (=> b!1082537 m!999743))

(declare-fun m!999745 () Bool)

(assert (=> b!1082537 m!999745))

(declare-fun m!999747 () Bool)

(assert (=> b!1082529 m!999747))

(declare-fun m!999749 () Bool)

(assert (=> b!1082530 m!999749))

(declare-fun m!999751 () Bool)

(assert (=> b!1082533 m!999751))

(declare-fun m!999753 () Bool)

(assert (=> start!95734 m!999753))

(declare-fun m!999755 () Bool)

(assert (=> start!95734 m!999755))

(declare-fun m!999757 () Bool)

(assert (=> start!95734 m!999757))

(declare-fun m!999759 () Bool)

(assert (=> mapNonEmpty!41347 m!999759))

(declare-fun m!999761 () Bool)

(assert (=> b!1082526 m!999761))

(check-sat (not b!1082529) (not b!1082530) (not b!1082527) (not b!1082526) b_and!35437 (not mapNonEmpty!41347) (not b!1082533) (not b_next!22393) (not start!95734) tp_is_empty!26395 (not b!1082537) (not b_lambda!17041))
(check-sat b_and!35437 (not b_next!22393))
