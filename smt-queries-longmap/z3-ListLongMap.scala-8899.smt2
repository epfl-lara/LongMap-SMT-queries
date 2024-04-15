; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108034 () Bool)

(assert start!108034)

(declare-fun mapNonEmpty!51488 () Bool)

(declare-fun mapRes!51488 () Bool)

(declare-fun tp!98247 () Bool)

(declare-fun e!728528 () Bool)

(assert (=> mapNonEmpty!51488 (= mapRes!51488 (and tp!98247 e!728528))))

(declare-fun mapKey!51488 () (_ BitVec 32))

(declare-datatypes ((V!49513 0))(
  ( (V!49514 (val!16728 Int)) )
))
(declare-datatypes ((ValueCell!15755 0))(
  ( (ValueCellFull!15755 (v!19324 V!49513)) (EmptyCell!15755) )
))
(declare-fun mapRest!51488 () (Array (_ BitVec 32) ValueCell!15755))

(declare-fun mapValue!51488 () ValueCell!15755)

(declare-datatypes ((array!83615 0))(
  ( (array!83616 (arr!40320 (Array (_ BitVec 32) ValueCell!15755)) (size!40872 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83615)

(assert (=> mapNonEmpty!51488 (= (arr!40320 _values!1187) (store mapRest!51488 mapKey!51488 mapValue!51488))))

(declare-fun b!1275936 () Bool)

(declare-fun res!848017 () Bool)

(declare-fun e!728530 () Bool)

(assert (=> b!1275936 (=> (not res!848017) (not e!728530))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83617 0))(
  ( (array!83618 (arr!40321 (Array (_ BitVec 32) (_ BitVec 64))) (size!40873 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83617)

(assert (=> b!1275936 (= res!848017 (and (= (size!40872 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40873 _keys!1427) (size!40872 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848019 () Bool)

(assert (=> start!108034 (=> (not res!848019) (not e!728530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108034 (= res!848019 (validMask!0 mask!1805))))

(assert (=> start!108034 e!728530))

(assert (=> start!108034 true))

(declare-fun e!728526 () Bool)

(declare-fun array_inv!30797 (array!83615) Bool)

(assert (=> start!108034 (and (array_inv!30797 _values!1187) e!728526)))

(declare-fun array_inv!30798 (array!83617) Bool)

(assert (=> start!108034 (array_inv!30798 _keys!1427)))

(declare-fun b!1275937 () Bool)

(declare-fun e!728527 () Bool)

(assert (=> b!1275937 (= e!728526 (and e!728527 mapRes!51488))))

(declare-fun condMapEmpty!51488 () Bool)

(declare-fun mapDefault!51488 () ValueCell!15755)

(assert (=> b!1275937 (= condMapEmpty!51488 (= (arr!40320 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15755)) mapDefault!51488)))))

(declare-fun b!1275938 () Bool)

(declare-fun tp_is_empty!33307 () Bool)

(assert (=> b!1275938 (= e!728528 tp_is_empty!33307)))

(declare-fun mapIsEmpty!51488 () Bool)

(assert (=> mapIsEmpty!51488 mapRes!51488))

(declare-fun b!1275939 () Bool)

(declare-fun res!848018 () Bool)

(assert (=> b!1275939 (=> (not res!848018) (not e!728530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83617 (_ BitVec 32)) Bool)

(assert (=> b!1275939 (= res!848018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275940 () Bool)

(assert (=> b!1275940 (= e!728530 false)))

(declare-fun lt!575250 () Bool)

(declare-datatypes ((List!28707 0))(
  ( (Nil!28704) (Cons!28703 (h!29912 (_ BitVec 64)) (t!42235 List!28707)) )
))
(declare-fun arrayNoDuplicates!0 (array!83617 (_ BitVec 32) List!28707) Bool)

(assert (=> b!1275940 (= lt!575250 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28704))))

(declare-fun b!1275941 () Bool)

(assert (=> b!1275941 (= e!728527 tp_is_empty!33307)))

(assert (= (and start!108034 res!848019) b!1275936))

(assert (= (and b!1275936 res!848017) b!1275939))

(assert (= (and b!1275939 res!848018) b!1275940))

(assert (= (and b!1275937 condMapEmpty!51488) mapIsEmpty!51488))

(assert (= (and b!1275937 (not condMapEmpty!51488)) mapNonEmpty!51488))

(get-info :version)

(assert (= (and mapNonEmpty!51488 ((_ is ValueCellFull!15755) mapValue!51488)) b!1275938))

(assert (= (and b!1275937 ((_ is ValueCellFull!15755) mapDefault!51488)) b!1275941))

(assert (= start!108034 b!1275937))

(declare-fun m!1171551 () Bool)

(assert (=> mapNonEmpty!51488 m!1171551))

(declare-fun m!1171553 () Bool)

(assert (=> start!108034 m!1171553))

(declare-fun m!1171555 () Bool)

(assert (=> start!108034 m!1171555))

(declare-fun m!1171557 () Bool)

(assert (=> start!108034 m!1171557))

(declare-fun m!1171559 () Bool)

(assert (=> b!1275939 m!1171559))

(declare-fun m!1171561 () Bool)

(assert (=> b!1275940 m!1171561))

(check-sat (not mapNonEmpty!51488) (not b!1275939) (not b!1275940) (not start!108034) tp_is_empty!33307)
(check-sat)
