; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95508 () Bool)

(assert start!95508)

(declare-fun b!1078606 () Bool)

(declare-fun e!616691 () Bool)

(declare-fun e!616696 () Bool)

(declare-fun mapRes!41029 () Bool)

(assert (=> b!1078606 (= e!616691 (and e!616696 mapRes!41029))))

(declare-fun condMapEmpty!41029 () Bool)

(declare-datatypes ((V!40041 0))(
  ( (V!40042 (val!13149 Int)) )
))
(declare-datatypes ((ValueCell!12383 0))(
  ( (ValueCellFull!12383 (v!15769 V!40041)) (EmptyCell!12383) )
))
(declare-datatypes ((array!69254 0))(
  ( (array!69255 (arr!33302 (Array (_ BitVec 32) ValueCell!12383)) (size!33840 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69254)

(declare-fun mapDefault!41029 () ValueCell!12383)

(assert (=> b!1078606 (= condMapEmpty!41029 (= (arr!33302 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12383)) mapDefault!41029)))))

(declare-fun b!1078607 () Bool)

(declare-fun res!718775 () Bool)

(declare-fun e!616692 () Bool)

(assert (=> b!1078607 (=> (not res!718775) (not e!616692))))

(declare-datatypes ((array!69256 0))(
  ( (array!69257 (arr!33303 (Array (_ BitVec 32) (_ BitVec 64))) (size!33841 (_ BitVec 32))) )
))
(declare-fun lt!478493 () array!69256)

(declare-datatypes ((List!23297 0))(
  ( (Nil!23294) (Cons!23293 (h!24502 (_ BitVec 64)) (t!32647 List!23297)) )
))
(declare-fun arrayNoDuplicates!0 (array!69256 (_ BitVec 32) List!23297) Bool)

(assert (=> b!1078607 (= res!718775 (arrayNoDuplicates!0 lt!478493 #b00000000000000000000000000000000 Nil!23294))))

(declare-fun b!1078608 () Bool)

(declare-fun tp_is_empty!26185 () Bool)

(assert (=> b!1078608 (= e!616696 tp_is_empty!26185)))

(declare-fun b!1078609 () Bool)

(declare-fun _keys!1070 () array!69256)

(assert (=> b!1078609 (= e!616692 (not (bvslt #b00000000000000000000000000000000 (size!33841 _keys!1070))))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078609 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35315 0))(
  ( (Unit!35316) )
))
(declare-fun lt!478492 () Unit!35315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69256 (_ BitVec 64) (_ BitVec 32)) Unit!35315)

(assert (=> b!1078609 (= lt!478492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078610 () Bool)

(declare-fun res!718779 () Bool)

(declare-fun e!616694 () Bool)

(assert (=> b!1078610 (=> (not res!718779) (not e!616694))))

(assert (=> b!1078610 (= res!718779 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33841 _keys!1070))))))

(declare-fun b!1078611 () Bool)

(declare-fun res!718777 () Bool)

(assert (=> b!1078611 (=> (not res!718777) (not e!616694))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69256 (_ BitVec 32)) Bool)

(assert (=> b!1078611 (= res!718777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!718772 () Bool)

(assert (=> start!95508 (=> (not res!718772) (not e!616694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95508 (= res!718772 (validMask!0 mask!1414))))

(assert (=> start!95508 e!616694))

(assert (=> start!95508 true))

(declare-fun array_inv!25752 (array!69256) Bool)

(assert (=> start!95508 (array_inv!25752 _keys!1070)))

(declare-fun array_inv!25753 (array!69254) Bool)

(assert (=> start!95508 (and (array_inv!25753 _values!874) e!616691)))

(declare-fun mapIsEmpty!41029 () Bool)

(assert (=> mapIsEmpty!41029 mapRes!41029))

(declare-fun b!1078612 () Bool)

(declare-fun res!718776 () Bool)

(assert (=> b!1078612 (=> (not res!718776) (not e!616694))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078612 (= res!718776 (and (= (size!33840 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33841 _keys!1070) (size!33840 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078613 () Bool)

(declare-fun res!718778 () Bool)

(assert (=> b!1078613 (=> (not res!718778) (not e!616694))))

(assert (=> b!1078613 (= res!718778 (= (select (arr!33303 _keys!1070) i!650) k0!904))))

(declare-fun b!1078614 () Bool)

(assert (=> b!1078614 (= e!616694 e!616692)))

(declare-fun res!718780 () Bool)

(assert (=> b!1078614 (=> (not res!718780) (not e!616692))))

(assert (=> b!1078614 (= res!718780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478493 mask!1414))))

(assert (=> b!1078614 (= lt!478493 (array!69257 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33841 _keys!1070)))))

(declare-fun b!1078615 () Bool)

(declare-fun res!718774 () Bool)

(assert (=> b!1078615 (=> (not res!718774) (not e!616694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078615 (= res!718774 (validKeyInArray!0 k0!904))))

(declare-fun b!1078616 () Bool)

(declare-fun res!718773 () Bool)

(assert (=> b!1078616 (=> (not res!718773) (not e!616694))))

(assert (=> b!1078616 (= res!718773 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23294))))

(declare-fun mapNonEmpty!41029 () Bool)

(declare-fun tp!78491 () Bool)

(declare-fun e!616695 () Bool)

(assert (=> mapNonEmpty!41029 (= mapRes!41029 (and tp!78491 e!616695))))

(declare-fun mapRest!41029 () (Array (_ BitVec 32) ValueCell!12383))

(declare-fun mapValue!41029 () ValueCell!12383)

(declare-fun mapKey!41029 () (_ BitVec 32))

(assert (=> mapNonEmpty!41029 (= (arr!33302 _values!874) (store mapRest!41029 mapKey!41029 mapValue!41029))))

(declare-fun b!1078617 () Bool)

(assert (=> b!1078617 (= e!616695 tp_is_empty!26185)))

(assert (= (and start!95508 res!718772) b!1078612))

(assert (= (and b!1078612 res!718776) b!1078611))

(assert (= (and b!1078611 res!718777) b!1078616))

(assert (= (and b!1078616 res!718773) b!1078610))

(assert (= (and b!1078610 res!718779) b!1078615))

(assert (= (and b!1078615 res!718774) b!1078613))

(assert (= (and b!1078613 res!718778) b!1078614))

(assert (= (and b!1078614 res!718780) b!1078607))

(assert (= (and b!1078607 res!718775) b!1078609))

(assert (= (and b!1078606 condMapEmpty!41029) mapIsEmpty!41029))

(assert (= (and b!1078606 (not condMapEmpty!41029)) mapNonEmpty!41029))

(get-info :version)

(assert (= (and mapNonEmpty!41029 ((_ is ValueCellFull!12383) mapValue!41029)) b!1078617))

(assert (= (and b!1078606 ((_ is ValueCellFull!12383) mapDefault!41029)) b!1078608))

(assert (= start!95508 b!1078606))

(declare-fun m!996531 () Bool)

(assert (=> start!95508 m!996531))

(declare-fun m!996533 () Bool)

(assert (=> start!95508 m!996533))

(declare-fun m!996535 () Bool)

(assert (=> start!95508 m!996535))

(declare-fun m!996537 () Bool)

(assert (=> b!1078616 m!996537))

(declare-fun m!996539 () Bool)

(assert (=> b!1078613 m!996539))

(declare-fun m!996541 () Bool)

(assert (=> b!1078615 m!996541))

(declare-fun m!996543 () Bool)

(assert (=> b!1078607 m!996543))

(declare-fun m!996545 () Bool)

(assert (=> b!1078609 m!996545))

(declare-fun m!996547 () Bool)

(assert (=> b!1078609 m!996547))

(declare-fun m!996549 () Bool)

(assert (=> mapNonEmpty!41029 m!996549))

(declare-fun m!996551 () Bool)

(assert (=> b!1078611 m!996551))

(declare-fun m!996553 () Bool)

(assert (=> b!1078614 m!996553))

(declare-fun m!996555 () Bool)

(assert (=> b!1078614 m!996555))

(check-sat (not b!1078609) (not mapNonEmpty!41029) (not b!1078616) (not b!1078615) (not b!1078607) tp_is_empty!26185 (not start!95508) (not b!1078614) (not b!1078611))
(check-sat)
