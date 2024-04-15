; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96316 () Bool)

(assert start!96316)

(declare-fun b!1094494 () Bool)

(declare-fun e!624872 () Bool)

(assert (=> b!1094494 (= e!624872 false)))

(declare-fun lt!489478 () Bool)

(declare-datatypes ((array!70780 0))(
  ( (array!70781 (arr!34064 (Array (_ BitVec 32) (_ BitVec 64))) (size!34602 (_ BitVec 32))) )
))
(declare-fun lt!489479 () array!70780)

(declare-datatypes ((List!23857 0))(
  ( (Nil!23854) (Cons!23853 (h!25062 (_ BitVec 64)) (t!33855 List!23857)) )
))
(declare-fun arrayNoDuplicates!0 (array!70780 (_ BitVec 32) List!23857) Bool)

(assert (=> b!1094494 (= lt!489478 (arrayNoDuplicates!0 lt!489479 #b00000000000000000000000000000000 Nil!23854))))

(declare-fun b!1094495 () Bool)

(declare-fun e!624871 () Bool)

(assert (=> b!1094495 (= e!624871 e!624872)))

(declare-fun res!730426 () Bool)

(assert (=> b!1094495 (=> (not res!730426) (not e!624872))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70780 (_ BitVec 32)) Bool)

(assert (=> b!1094495 (= res!730426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489479 mask!1414))))

(declare-fun _keys!1070 () array!70780)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094495 (= lt!489479 (array!70781 (store (arr!34064 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34602 _keys!1070)))))

(declare-fun b!1094496 () Bool)

(declare-fun res!730430 () Bool)

(assert (=> b!1094496 (=> (not res!730430) (not e!624871))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1094496 (= res!730430 (= (select (arr!34064 _keys!1070) i!650) k0!904))))

(declare-fun b!1094497 () Bool)

(declare-fun res!730424 () Bool)

(assert (=> b!1094497 (=> (not res!730424) (not e!624871))))

(assert (=> b!1094497 (= res!730424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094498 () Bool)

(declare-fun e!624870 () Bool)

(declare-fun tp_is_empty!26977 () Bool)

(assert (=> b!1094498 (= e!624870 tp_is_empty!26977)))

(declare-fun b!1094499 () Bool)

(declare-fun e!624868 () Bool)

(declare-fun e!624869 () Bool)

(declare-fun mapRes!42220 () Bool)

(assert (=> b!1094499 (= e!624868 (and e!624869 mapRes!42220))))

(declare-fun condMapEmpty!42220 () Bool)

(declare-datatypes ((V!41097 0))(
  ( (V!41098 (val!13545 Int)) )
))
(declare-datatypes ((ValueCell!12779 0))(
  ( (ValueCellFull!12779 (v!16165 V!41097)) (EmptyCell!12779) )
))
(declare-datatypes ((array!70782 0))(
  ( (array!70783 (arr!34065 (Array (_ BitVec 32) ValueCell!12779)) (size!34603 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70782)

(declare-fun mapDefault!42220 () ValueCell!12779)

(assert (=> b!1094499 (= condMapEmpty!42220 (= (arr!34065 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12779)) mapDefault!42220)))))

(declare-fun b!1094500 () Bool)

(assert (=> b!1094500 (= e!624869 tp_is_empty!26977)))

(declare-fun mapIsEmpty!42220 () Bool)

(assert (=> mapIsEmpty!42220 mapRes!42220))

(declare-fun mapNonEmpty!42220 () Bool)

(declare-fun tp!80735 () Bool)

(assert (=> mapNonEmpty!42220 (= mapRes!42220 (and tp!80735 e!624870))))

(declare-fun mapValue!42220 () ValueCell!12779)

(declare-fun mapKey!42220 () (_ BitVec 32))

(declare-fun mapRest!42220 () (Array (_ BitVec 32) ValueCell!12779))

(assert (=> mapNonEmpty!42220 (= (arr!34065 _values!874) (store mapRest!42220 mapKey!42220 mapValue!42220))))

(declare-fun b!1094502 () Bool)

(declare-fun res!730427 () Bool)

(assert (=> b!1094502 (=> (not res!730427) (not e!624871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094502 (= res!730427 (validKeyInArray!0 k0!904))))

(declare-fun b!1094503 () Bool)

(declare-fun res!730431 () Bool)

(assert (=> b!1094503 (=> (not res!730431) (not e!624871))))

(assert (=> b!1094503 (= res!730431 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34602 _keys!1070))))))

(declare-fun b!1094504 () Bool)

(declare-fun res!730425 () Bool)

(assert (=> b!1094504 (=> (not res!730425) (not e!624871))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094504 (= res!730425 (and (= (size!34603 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34602 _keys!1070) (size!34603 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!730428 () Bool)

(assert (=> start!96316 (=> (not res!730428) (not e!624871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96316 (= res!730428 (validMask!0 mask!1414))))

(assert (=> start!96316 e!624871))

(assert (=> start!96316 true))

(declare-fun array_inv!26284 (array!70780) Bool)

(assert (=> start!96316 (array_inv!26284 _keys!1070)))

(declare-fun array_inv!26285 (array!70782) Bool)

(assert (=> start!96316 (and (array_inv!26285 _values!874) e!624868)))

(declare-fun b!1094501 () Bool)

(declare-fun res!730429 () Bool)

(assert (=> b!1094501 (=> (not res!730429) (not e!624871))))

(assert (=> b!1094501 (= res!730429 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23854))))

(assert (= (and start!96316 res!730428) b!1094504))

(assert (= (and b!1094504 res!730425) b!1094497))

(assert (= (and b!1094497 res!730424) b!1094501))

(assert (= (and b!1094501 res!730429) b!1094503))

(assert (= (and b!1094503 res!730431) b!1094502))

(assert (= (and b!1094502 res!730427) b!1094496))

(assert (= (and b!1094496 res!730430) b!1094495))

(assert (= (and b!1094495 res!730426) b!1094494))

(assert (= (and b!1094499 condMapEmpty!42220) mapIsEmpty!42220))

(assert (= (and b!1094499 (not condMapEmpty!42220)) mapNonEmpty!42220))

(get-info :version)

(assert (= (and mapNonEmpty!42220 ((_ is ValueCellFull!12779) mapValue!42220)) b!1094498))

(assert (= (and b!1094499 ((_ is ValueCellFull!12779) mapDefault!42220)) b!1094500))

(assert (= start!96316 b!1094499))

(declare-fun m!1013891 () Bool)

(assert (=> b!1094495 m!1013891))

(declare-fun m!1013893 () Bool)

(assert (=> b!1094495 m!1013893))

(declare-fun m!1013895 () Bool)

(assert (=> mapNonEmpty!42220 m!1013895))

(declare-fun m!1013897 () Bool)

(assert (=> b!1094496 m!1013897))

(declare-fun m!1013899 () Bool)

(assert (=> b!1094494 m!1013899))

(declare-fun m!1013901 () Bool)

(assert (=> start!96316 m!1013901))

(declare-fun m!1013903 () Bool)

(assert (=> start!96316 m!1013903))

(declare-fun m!1013905 () Bool)

(assert (=> start!96316 m!1013905))

(declare-fun m!1013907 () Bool)

(assert (=> b!1094501 m!1013907))

(declare-fun m!1013909 () Bool)

(assert (=> b!1094497 m!1013909))

(declare-fun m!1013911 () Bool)

(assert (=> b!1094502 m!1013911))

(check-sat (not b!1094494) (not start!96316) (not b!1094501) (not b!1094497) (not b!1094502) tp_is_empty!26977 (not mapNonEmpty!42220) (not b!1094495))
(check-sat)
