; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108022 () Bool)

(assert start!108022)

(declare-fun b!1275828 () Bool)

(declare-fun res!847965 () Bool)

(declare-fun e!728436 () Bool)

(assert (=> b!1275828 (=> (not res!847965) (not e!728436))))

(declare-datatypes ((array!83591 0))(
  ( (array!83592 (arr!40308 (Array (_ BitVec 32) (_ BitVec 64))) (size!40860 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83591)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83591 (_ BitVec 32)) Bool)

(assert (=> b!1275828 (= res!847965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51470 () Bool)

(declare-fun mapRes!51470 () Bool)

(assert (=> mapIsEmpty!51470 mapRes!51470))

(declare-fun b!1275829 () Bool)

(assert (=> b!1275829 (= e!728436 false)))

(declare-fun lt!575232 () Bool)

(declare-datatypes ((List!28704 0))(
  ( (Nil!28701) (Cons!28700 (h!29909 (_ BitVec 64)) (t!42232 List!28704)) )
))
(declare-fun arrayNoDuplicates!0 (array!83591 (_ BitVec 32) List!28704) Bool)

(assert (=> b!1275829 (= lt!575232 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28701))))

(declare-fun b!1275830 () Bool)

(declare-fun e!728438 () Bool)

(declare-fun tp_is_empty!33295 () Bool)

(assert (=> b!1275830 (= e!728438 tp_is_empty!33295)))

(declare-fun mapNonEmpty!51470 () Bool)

(declare-fun tp!98229 () Bool)

(declare-fun e!728437 () Bool)

(assert (=> mapNonEmpty!51470 (= mapRes!51470 (and tp!98229 e!728437))))

(declare-datatypes ((V!49497 0))(
  ( (V!49498 (val!16722 Int)) )
))
(declare-datatypes ((ValueCell!15749 0))(
  ( (ValueCellFull!15749 (v!19318 V!49497)) (EmptyCell!15749) )
))
(declare-fun mapRest!51470 () (Array (_ BitVec 32) ValueCell!15749))

(declare-fun mapValue!51470 () ValueCell!15749)

(declare-fun mapKey!51470 () (_ BitVec 32))

(declare-datatypes ((array!83593 0))(
  ( (array!83594 (arr!40309 (Array (_ BitVec 32) ValueCell!15749)) (size!40861 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83593)

(assert (=> mapNonEmpty!51470 (= (arr!40309 _values!1187) (store mapRest!51470 mapKey!51470 mapValue!51470))))

(declare-fun b!1275831 () Bool)

(declare-fun e!728440 () Bool)

(assert (=> b!1275831 (= e!728440 (and e!728438 mapRes!51470))))

(declare-fun condMapEmpty!51470 () Bool)

(declare-fun mapDefault!51470 () ValueCell!15749)

(assert (=> b!1275831 (= condMapEmpty!51470 (= (arr!40309 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15749)) mapDefault!51470)))))

(declare-fun b!1275832 () Bool)

(assert (=> b!1275832 (= e!728437 tp_is_empty!33295)))

(declare-fun res!847964 () Bool)

(assert (=> start!108022 (=> (not res!847964) (not e!728436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108022 (= res!847964 (validMask!0 mask!1805))))

(assert (=> start!108022 e!728436))

(assert (=> start!108022 true))

(declare-fun array_inv!30787 (array!83593) Bool)

(assert (=> start!108022 (and (array_inv!30787 _values!1187) e!728440)))

(declare-fun array_inv!30788 (array!83591) Bool)

(assert (=> start!108022 (array_inv!30788 _keys!1427)))

(declare-fun b!1275833 () Bool)

(declare-fun res!847963 () Bool)

(assert (=> b!1275833 (=> (not res!847963) (not e!728436))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275833 (= res!847963 (and (= (size!40861 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40860 _keys!1427) (size!40861 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108022 res!847964) b!1275833))

(assert (= (and b!1275833 res!847963) b!1275828))

(assert (= (and b!1275828 res!847965) b!1275829))

(assert (= (and b!1275831 condMapEmpty!51470) mapIsEmpty!51470))

(assert (= (and b!1275831 (not condMapEmpty!51470)) mapNonEmpty!51470))

(get-info :version)

(assert (= (and mapNonEmpty!51470 ((_ is ValueCellFull!15749) mapValue!51470)) b!1275832))

(assert (= (and b!1275831 ((_ is ValueCellFull!15749) mapDefault!51470)) b!1275830))

(assert (= start!108022 b!1275831))

(declare-fun m!1171479 () Bool)

(assert (=> b!1275828 m!1171479))

(declare-fun m!1171481 () Bool)

(assert (=> b!1275829 m!1171481))

(declare-fun m!1171483 () Bool)

(assert (=> mapNonEmpty!51470 m!1171483))

(declare-fun m!1171485 () Bool)

(assert (=> start!108022 m!1171485))

(declare-fun m!1171487 () Bool)

(assert (=> start!108022 m!1171487))

(declare-fun m!1171489 () Bool)

(assert (=> start!108022 m!1171489))

(check-sat (not b!1275829) tp_is_empty!33295 (not start!108022) (not mapNonEmpty!51470) (not b!1275828))
(check-sat)
