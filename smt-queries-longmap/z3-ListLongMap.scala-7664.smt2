; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96298 () Bool)

(assert start!96298)

(declare-fun mapIsEmpty!42193 () Bool)

(declare-fun mapRes!42193 () Bool)

(assert (=> mapIsEmpty!42193 mapRes!42193))

(declare-fun mapNonEmpty!42193 () Bool)

(declare-fun tp!80708 () Bool)

(declare-fun e!624732 () Bool)

(assert (=> mapNonEmpty!42193 (= mapRes!42193 (and tp!80708 e!624732))))

(declare-fun mapKey!42193 () (_ BitVec 32))

(declare-datatypes ((V!41073 0))(
  ( (V!41074 (val!13536 Int)) )
))
(declare-datatypes ((ValueCell!12770 0))(
  ( (ValueCellFull!12770 (v!16156 V!41073)) (EmptyCell!12770) )
))
(declare-datatypes ((array!70748 0))(
  ( (array!70749 (arr!34048 (Array (_ BitVec 32) ValueCell!12770)) (size!34586 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70748)

(declare-fun mapRest!42193 () (Array (_ BitVec 32) ValueCell!12770))

(declare-fun mapValue!42193 () ValueCell!12770)

(assert (=> mapNonEmpty!42193 (= (arr!34048 _values!874) (store mapRest!42193 mapKey!42193 mapValue!42193))))

(declare-fun b!1094286 () Bool)

(declare-fun e!624730 () Bool)

(declare-fun tp_is_empty!26959 () Bool)

(assert (=> b!1094286 (= e!624730 tp_is_empty!26959)))

(declare-fun b!1094287 () Bool)

(declare-fun e!624733 () Bool)

(assert (=> b!1094287 (= e!624733 false)))

(declare-fun lt!489449 () Bool)

(declare-datatypes ((array!70750 0))(
  ( (array!70751 (arr!34049 (Array (_ BitVec 32) (_ BitVec 64))) (size!34587 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70750)

(declare-datatypes ((List!23850 0))(
  ( (Nil!23847) (Cons!23846 (h!25055 (_ BitVec 64)) (t!33848 List!23850)) )
))
(declare-fun arrayNoDuplicates!0 (array!70750 (_ BitVec 32) List!23850) Bool)

(assert (=> b!1094287 (= lt!489449 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23847))))

(declare-fun res!730299 () Bool)

(assert (=> start!96298 (=> (not res!730299) (not e!624733))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96298 (= res!730299 (validMask!0 mask!1414))))

(assert (=> start!96298 e!624733))

(assert (=> start!96298 true))

(declare-fun e!624731 () Bool)

(declare-fun array_inv!26276 (array!70748) Bool)

(assert (=> start!96298 (and (array_inv!26276 _values!874) e!624731)))

(declare-fun array_inv!26277 (array!70750) Bool)

(assert (=> start!96298 (array_inv!26277 _keys!1070)))

(declare-fun b!1094288 () Bool)

(declare-fun res!730297 () Bool)

(assert (=> b!1094288 (=> (not res!730297) (not e!624733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70750 (_ BitVec 32)) Bool)

(assert (=> b!1094288 (= res!730297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094289 () Bool)

(assert (=> b!1094289 (= e!624732 tp_is_empty!26959)))

(declare-fun b!1094290 () Bool)

(declare-fun res!730298 () Bool)

(assert (=> b!1094290 (=> (not res!730298) (not e!624733))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094290 (= res!730298 (and (= (size!34586 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34587 _keys!1070) (size!34586 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094291 () Bool)

(assert (=> b!1094291 (= e!624731 (and e!624730 mapRes!42193))))

(declare-fun condMapEmpty!42193 () Bool)

(declare-fun mapDefault!42193 () ValueCell!12770)

(assert (=> b!1094291 (= condMapEmpty!42193 (= (arr!34048 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12770)) mapDefault!42193)))))

(assert (= (and start!96298 res!730299) b!1094290))

(assert (= (and b!1094290 res!730298) b!1094288))

(assert (= (and b!1094288 res!730297) b!1094287))

(assert (= (and b!1094291 condMapEmpty!42193) mapIsEmpty!42193))

(assert (= (and b!1094291 (not condMapEmpty!42193)) mapNonEmpty!42193))

(get-info :version)

(assert (= (and mapNonEmpty!42193 ((_ is ValueCellFull!12770) mapValue!42193)) b!1094289))

(assert (= (and b!1094291 ((_ is ValueCellFull!12770) mapDefault!42193)) b!1094286))

(assert (= start!96298 b!1094291))

(declare-fun m!1013759 () Bool)

(assert (=> mapNonEmpty!42193 m!1013759))

(declare-fun m!1013761 () Bool)

(assert (=> b!1094287 m!1013761))

(declare-fun m!1013763 () Bool)

(assert (=> start!96298 m!1013763))

(declare-fun m!1013765 () Bool)

(assert (=> start!96298 m!1013765))

(declare-fun m!1013767 () Bool)

(assert (=> start!96298 m!1013767))

(declare-fun m!1013769 () Bool)

(assert (=> b!1094288 m!1013769))

(check-sat (not start!96298) (not mapNonEmpty!42193) tp_is_empty!26959 (not b!1094287) (not b!1094288))
(check-sat)
