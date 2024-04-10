; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96330 () Bool)

(assert start!96330)

(declare-fun b!1094779 () Bool)

(declare-fun res!730592 () Bool)

(declare-fun e!625036 () Bool)

(assert (=> b!1094779 (=> (not res!730592) (not e!625036))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70883 0))(
  ( (array!70884 (arr!34115 (Array (_ BitVec 32) (_ BitVec 64))) (size!34651 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70883)

(declare-datatypes ((V!41107 0))(
  ( (V!41108 (val!13549 Int)) )
))
(declare-datatypes ((ValueCell!12783 0))(
  ( (ValueCellFull!12783 (v!16170 V!41107)) (EmptyCell!12783) )
))
(declare-datatypes ((array!70885 0))(
  ( (array!70886 (arr!34116 (Array (_ BitVec 32) ValueCell!12783)) (size!34652 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70885)

(assert (=> b!1094779 (= res!730592 (and (= (size!34652 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34651 _keys!1070) (size!34652 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094780 () Bool)

(declare-fun res!730589 () Bool)

(assert (=> b!1094780 (=> (not res!730589) (not e!625036))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094780 (= res!730589 (validKeyInArray!0 k0!904))))

(declare-fun b!1094781 () Bool)

(declare-fun e!625032 () Bool)

(assert (=> b!1094781 (= e!625032 false)))

(declare-fun lt!489702 () Bool)

(declare-fun lt!489703 () array!70883)

(declare-datatypes ((List!23828 0))(
  ( (Nil!23825) (Cons!23824 (h!25033 (_ BitVec 64)) (t!33835 List!23828)) )
))
(declare-fun arrayNoDuplicates!0 (array!70883 (_ BitVec 32) List!23828) Bool)

(assert (=> b!1094781 (= lt!489702 (arrayNoDuplicates!0 lt!489703 #b00000000000000000000000000000000 Nil!23825))))

(declare-fun res!730593 () Bool)

(assert (=> start!96330 (=> (not res!730593) (not e!625036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96330 (= res!730593 (validMask!0 mask!1414))))

(assert (=> start!96330 e!625036))

(assert (=> start!96330 true))

(declare-fun array_inv!26288 (array!70883) Bool)

(assert (=> start!96330 (array_inv!26288 _keys!1070)))

(declare-fun e!625033 () Bool)

(declare-fun array_inv!26289 (array!70885) Bool)

(assert (=> start!96330 (and (array_inv!26289 _values!874) e!625033)))

(declare-fun b!1094782 () Bool)

(assert (=> b!1094782 (= e!625036 e!625032)))

(declare-fun res!730595 () Bool)

(assert (=> b!1094782 (=> (not res!730595) (not e!625032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70883 (_ BitVec 32)) Bool)

(assert (=> b!1094782 (= res!730595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489703 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094782 (= lt!489703 (array!70884 (store (arr!34115 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34651 _keys!1070)))))

(declare-fun mapNonEmpty!42232 () Bool)

(declare-fun mapRes!42232 () Bool)

(declare-fun tp!80747 () Bool)

(declare-fun e!625034 () Bool)

(assert (=> mapNonEmpty!42232 (= mapRes!42232 (and tp!80747 e!625034))))

(declare-fun mapKey!42232 () (_ BitVec 32))

(declare-fun mapValue!42232 () ValueCell!12783)

(declare-fun mapRest!42232 () (Array (_ BitVec 32) ValueCell!12783))

(assert (=> mapNonEmpty!42232 (= (arr!34116 _values!874) (store mapRest!42232 mapKey!42232 mapValue!42232))))

(declare-fun mapIsEmpty!42232 () Bool)

(assert (=> mapIsEmpty!42232 mapRes!42232))

(declare-fun b!1094783 () Bool)

(declare-fun res!730594 () Bool)

(assert (=> b!1094783 (=> (not res!730594) (not e!625036))))

(assert (=> b!1094783 (= res!730594 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34651 _keys!1070))))))

(declare-fun b!1094784 () Bool)

(declare-fun res!730591 () Bool)

(assert (=> b!1094784 (=> (not res!730591) (not e!625036))))

(assert (=> b!1094784 (= res!730591 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23825))))

(declare-fun b!1094785 () Bool)

(declare-fun e!625035 () Bool)

(declare-fun tp_is_empty!26985 () Bool)

(assert (=> b!1094785 (= e!625035 tp_is_empty!26985)))

(declare-fun b!1094786 () Bool)

(declare-fun res!730590 () Bool)

(assert (=> b!1094786 (=> (not res!730590) (not e!625036))))

(assert (=> b!1094786 (= res!730590 (= (select (arr!34115 _keys!1070) i!650) k0!904))))

(declare-fun b!1094787 () Bool)

(assert (=> b!1094787 (= e!625034 tp_is_empty!26985)))

(declare-fun b!1094788 () Bool)

(assert (=> b!1094788 (= e!625033 (and e!625035 mapRes!42232))))

(declare-fun condMapEmpty!42232 () Bool)

(declare-fun mapDefault!42232 () ValueCell!12783)

(assert (=> b!1094788 (= condMapEmpty!42232 (= (arr!34116 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12783)) mapDefault!42232)))))

(declare-fun b!1094789 () Bool)

(declare-fun res!730596 () Bool)

(assert (=> b!1094789 (=> (not res!730596) (not e!625036))))

(assert (=> b!1094789 (= res!730596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96330 res!730593) b!1094779))

(assert (= (and b!1094779 res!730592) b!1094789))

(assert (= (and b!1094789 res!730596) b!1094784))

(assert (= (and b!1094784 res!730591) b!1094783))

(assert (= (and b!1094783 res!730594) b!1094780))

(assert (= (and b!1094780 res!730589) b!1094786))

(assert (= (and b!1094786 res!730590) b!1094782))

(assert (= (and b!1094782 res!730595) b!1094781))

(assert (= (and b!1094788 condMapEmpty!42232) mapIsEmpty!42232))

(assert (= (and b!1094788 (not condMapEmpty!42232)) mapNonEmpty!42232))

(get-info :version)

(assert (= (and mapNonEmpty!42232 ((_ is ValueCellFull!12783) mapValue!42232)) b!1094787))

(assert (= (and b!1094788 ((_ is ValueCellFull!12783) mapDefault!42232)) b!1094785))

(assert (= start!96330 b!1094788))

(declare-fun m!1014605 () Bool)

(assert (=> b!1094780 m!1014605))

(declare-fun m!1014607 () Bool)

(assert (=> mapNonEmpty!42232 m!1014607))

(declare-fun m!1014609 () Bool)

(assert (=> b!1094786 m!1014609))

(declare-fun m!1014611 () Bool)

(assert (=> start!96330 m!1014611))

(declare-fun m!1014613 () Bool)

(assert (=> start!96330 m!1014613))

(declare-fun m!1014615 () Bool)

(assert (=> start!96330 m!1014615))

(declare-fun m!1014617 () Bool)

(assert (=> b!1094781 m!1014617))

(declare-fun m!1014619 () Bool)

(assert (=> b!1094782 m!1014619))

(declare-fun m!1014621 () Bool)

(assert (=> b!1094782 m!1014621))

(declare-fun m!1014623 () Bool)

(assert (=> b!1094789 m!1014623))

(declare-fun m!1014625 () Bool)

(assert (=> b!1094784 m!1014625))

(check-sat (not b!1094782) (not start!96330) (not b!1094784) (not mapNonEmpty!42232) (not b!1094789) tp_is_empty!26985 (not b!1094780) (not b!1094781))
(check-sat)
