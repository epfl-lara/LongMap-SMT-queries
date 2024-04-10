; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108018 () Bool)

(assert start!108018)

(declare-fun b!1275856 () Bool)

(declare-fun e!728435 () Bool)

(declare-fun e!728438 () Bool)

(declare-fun mapRes!51464 () Bool)

(assert (=> b!1275856 (= e!728435 (and e!728438 mapRes!51464))))

(declare-fun condMapEmpty!51464 () Bool)

(declare-datatypes ((V!49491 0))(
  ( (V!49492 (val!16720 Int)) )
))
(declare-datatypes ((ValueCell!15747 0))(
  ( (ValueCellFull!15747 (v!19317 V!49491)) (EmptyCell!15747) )
))
(declare-datatypes ((array!83682 0))(
  ( (array!83683 (arr!40353 (Array (_ BitVec 32) ValueCell!15747)) (size!40903 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83682)

(declare-fun mapDefault!51464 () ValueCell!15747)

(assert (=> b!1275856 (= condMapEmpty!51464 (= (arr!40353 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15747)) mapDefault!51464)))))

(declare-fun b!1275857 () Bool)

(declare-fun e!728436 () Bool)

(declare-fun tp_is_empty!33291 () Bool)

(assert (=> b!1275857 (= e!728436 tp_is_empty!33291)))

(declare-fun b!1275858 () Bool)

(declare-fun res!847972 () Bool)

(declare-fun e!728439 () Bool)

(assert (=> b!1275858 (=> (not res!847972) (not e!728439))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83684 0))(
  ( (array!83685 (arr!40354 (Array (_ BitVec 32) (_ BitVec 64))) (size!40904 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83684)

(assert (=> b!1275858 (= res!847972 (and (= (size!40903 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40904 _keys!1427) (size!40903 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275859 () Bool)

(declare-fun res!847973 () Bool)

(assert (=> b!1275859 (=> (not res!847973) (not e!728439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83684 (_ BitVec 32)) Bool)

(assert (=> b!1275859 (= res!847973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275860 () Bool)

(assert (=> b!1275860 (= e!728439 false)))

(declare-fun lt!575404 () Bool)

(declare-datatypes ((List!28627 0))(
  ( (Nil!28624) (Cons!28623 (h!29832 (_ BitVec 64)) (t!42163 List!28627)) )
))
(declare-fun arrayNoDuplicates!0 (array!83684 (_ BitVec 32) List!28627) Bool)

(assert (=> b!1275860 (= lt!575404 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28624))))

(declare-fun mapNonEmpty!51464 () Bool)

(declare-fun tp!98222 () Bool)

(assert (=> mapNonEmpty!51464 (= mapRes!51464 (and tp!98222 e!728436))))

(declare-fun mapValue!51464 () ValueCell!15747)

(declare-fun mapRest!51464 () (Array (_ BitVec 32) ValueCell!15747))

(declare-fun mapKey!51464 () (_ BitVec 32))

(assert (=> mapNonEmpty!51464 (= (arr!40353 _values!1187) (store mapRest!51464 mapKey!51464 mapValue!51464))))

(declare-fun mapIsEmpty!51464 () Bool)

(assert (=> mapIsEmpty!51464 mapRes!51464))

(declare-fun b!1275861 () Bool)

(assert (=> b!1275861 (= e!728438 tp_is_empty!33291)))

(declare-fun res!847974 () Bool)

(assert (=> start!108018 (=> (not res!847974) (not e!728439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108018 (= res!847974 (validMask!0 mask!1805))))

(assert (=> start!108018 e!728439))

(assert (=> start!108018 true))

(declare-fun array_inv!30671 (array!83682) Bool)

(assert (=> start!108018 (and (array_inv!30671 _values!1187) e!728435)))

(declare-fun array_inv!30672 (array!83684) Bool)

(assert (=> start!108018 (array_inv!30672 _keys!1427)))

(assert (= (and start!108018 res!847974) b!1275858))

(assert (= (and b!1275858 res!847972) b!1275859))

(assert (= (and b!1275859 res!847973) b!1275860))

(assert (= (and b!1275856 condMapEmpty!51464) mapIsEmpty!51464))

(assert (= (and b!1275856 (not condMapEmpty!51464)) mapNonEmpty!51464))

(get-info :version)

(assert (= (and mapNonEmpty!51464 ((_ is ValueCellFull!15747) mapValue!51464)) b!1275857))

(assert (= (and b!1275856 ((_ is ValueCellFull!15747) mapDefault!51464)) b!1275861))

(assert (= start!108018 b!1275856))

(declare-fun m!1171955 () Bool)

(assert (=> b!1275859 m!1171955))

(declare-fun m!1171957 () Bool)

(assert (=> b!1275860 m!1171957))

(declare-fun m!1171959 () Bool)

(assert (=> mapNonEmpty!51464 m!1171959))

(declare-fun m!1171961 () Bool)

(assert (=> start!108018 m!1171961))

(declare-fun m!1171963 () Bool)

(assert (=> start!108018 m!1171963))

(declare-fun m!1171965 () Bool)

(assert (=> start!108018 m!1171965))

(check-sat (not start!108018) (not b!1275859) (not b!1275860) tp_is_empty!33291 (not mapNonEmpty!51464))
(check-sat)
