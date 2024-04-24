; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96540 () Bool)

(assert start!96540)

(declare-fun mapNonEmpty!42193 () Bool)

(declare-fun mapRes!42193 () Bool)

(declare-fun tp!80708 () Bool)

(declare-fun e!625679 () Bool)

(assert (=> mapNonEmpty!42193 (= mapRes!42193 (and tp!80708 e!625679))))

(declare-datatypes ((V!41073 0))(
  ( (V!41074 (val!13536 Int)) )
))
(declare-datatypes ((ValueCell!12770 0))(
  ( (ValueCellFull!12770 (v!16153 V!41073)) (EmptyCell!12770) )
))
(declare-fun mapRest!42193 () (Array (_ BitVec 32) ValueCell!12770))

(declare-fun mapValue!42193 () ValueCell!12770)

(declare-fun mapKey!42193 () (_ BitVec 32))

(declare-datatypes ((array!70863 0))(
  ( (array!70864 (arr!34099 (Array (_ BitVec 32) ValueCell!12770)) (size!34636 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70863)

(assert (=> mapNonEmpty!42193 (= (arr!34099 _values!874) (store mapRest!42193 mapKey!42193 mapValue!42193))))

(declare-fun b!1095766 () Bool)

(declare-fun tp_is_empty!26959 () Bool)

(assert (=> b!1095766 (= e!625679 tp_is_empty!26959)))

(declare-fun b!1095767 () Bool)

(declare-fun res!730889 () Bool)

(declare-fun e!625682 () Bool)

(assert (=> b!1095767 (=> (not res!730889) (not e!625682))))

(declare-datatypes ((array!70865 0))(
  ( (array!70866 (arr!34100 (Array (_ BitVec 32) (_ BitVec 64))) (size!34637 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70865)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70865 (_ BitVec 32)) Bool)

(assert (=> b!1095767 (= res!730889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095768 () Bool)

(assert (=> b!1095768 (= e!625682 false)))

(declare-fun lt!490164 () Bool)

(declare-datatypes ((List!23829 0))(
  ( (Nil!23826) (Cons!23825 (h!25043 (_ BitVec 64)) (t!33828 List!23829)) )
))
(declare-fun arrayNoDuplicates!0 (array!70865 (_ BitVec 32) List!23829) Bool)

(assert (=> b!1095768 (= lt!490164 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23826))))

(declare-fun b!1095769 () Bool)

(declare-fun e!625680 () Bool)

(declare-fun e!625681 () Bool)

(assert (=> b!1095769 (= e!625680 (and e!625681 mapRes!42193))))

(declare-fun condMapEmpty!42193 () Bool)

(declare-fun mapDefault!42193 () ValueCell!12770)

(assert (=> b!1095769 (= condMapEmpty!42193 (= (arr!34099 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12770)) mapDefault!42193)))))

(declare-fun b!1095770 () Bool)

(declare-fun res!730888 () Bool)

(assert (=> b!1095770 (=> (not res!730888) (not e!625682))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095770 (= res!730888 (and (= (size!34636 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34637 _keys!1070) (size!34636 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42193 () Bool)

(assert (=> mapIsEmpty!42193 mapRes!42193))

(declare-fun b!1095771 () Bool)

(assert (=> b!1095771 (= e!625681 tp_is_empty!26959)))

(declare-fun res!730890 () Bool)

(assert (=> start!96540 (=> (not res!730890) (not e!625682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96540 (= res!730890 (validMask!0 mask!1414))))

(assert (=> start!96540 e!625682))

(assert (=> start!96540 true))

(declare-fun array_inv!26318 (array!70863) Bool)

(assert (=> start!96540 (and (array_inv!26318 _values!874) e!625680)))

(declare-fun array_inv!26319 (array!70865) Bool)

(assert (=> start!96540 (array_inv!26319 _keys!1070)))

(assert (= (and start!96540 res!730890) b!1095770))

(assert (= (and b!1095770 res!730888) b!1095767))

(assert (= (and b!1095767 res!730889) b!1095768))

(assert (= (and b!1095769 condMapEmpty!42193) mapIsEmpty!42193))

(assert (= (and b!1095769 (not condMapEmpty!42193)) mapNonEmpty!42193))

(get-info :version)

(assert (= (and mapNonEmpty!42193 ((_ is ValueCellFull!12770) mapValue!42193)) b!1095766))

(assert (= (and b!1095769 ((_ is ValueCellFull!12770) mapDefault!42193)) b!1095771))

(assert (= start!96540 b!1095769))

(declare-fun m!1016057 () Bool)

(assert (=> mapNonEmpty!42193 m!1016057))

(declare-fun m!1016059 () Bool)

(assert (=> b!1095767 m!1016059))

(declare-fun m!1016061 () Bool)

(assert (=> b!1095768 m!1016061))

(declare-fun m!1016063 () Bool)

(assert (=> start!96540 m!1016063))

(declare-fun m!1016065 () Bool)

(assert (=> start!96540 m!1016065))

(declare-fun m!1016067 () Bool)

(assert (=> start!96540 m!1016067))

(check-sat (not b!1095767) (not b!1095768) tp_is_empty!26959 (not mapNonEmpty!42193) (not start!96540))
(check-sat)
