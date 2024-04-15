; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108342 () Bool)

(assert start!108342)

(declare-fun b!1278685 () Bool)

(declare-fun e!730506 () Bool)

(declare-fun e!730504 () Bool)

(declare-fun mapRes!51845 () Bool)

(assert (=> b!1278685 (= e!730506 (and e!730504 mapRes!51845))))

(declare-fun condMapEmpty!51845 () Bool)

(declare-datatypes ((V!49809 0))(
  ( (V!49810 (val!16839 Int)) )
))
(declare-datatypes ((ValueCell!15866 0))(
  ( (ValueCellFull!15866 (v!19438 V!49809)) (EmptyCell!15866) )
))
(declare-datatypes ((array!84041 0))(
  ( (array!84042 (arr!40525 (Array (_ BitVec 32) ValueCell!15866)) (size!41077 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84041)

(declare-fun mapDefault!51845 () ValueCell!15866)

(assert (=> b!1278685 (= condMapEmpty!51845 (= (arr!40525 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15866)) mapDefault!51845)))))

(declare-fun b!1278686 () Bool)

(declare-fun res!849477 () Bool)

(declare-fun e!730503 () Bool)

(assert (=> b!1278686 (=> (not res!849477) (not e!730503))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84043 0))(
  ( (array!84044 (arr!40526 (Array (_ BitVec 32) (_ BitVec 64))) (size!41078 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84043)

(assert (=> b!1278686 (= res!849477 (and (= (size!41077 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41078 _keys!1741) (size!41077 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278687 () Bool)

(declare-fun e!730502 () Bool)

(declare-fun tp_is_empty!33529 () Bool)

(assert (=> b!1278687 (= e!730502 tp_is_empty!33529)))

(declare-fun b!1278688 () Bool)

(declare-fun res!849478 () Bool)

(assert (=> b!1278688 (=> (not res!849478) (not e!730503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84043 (_ BitVec 32)) Bool)

(assert (=> b!1278688 (= res!849478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!849479 () Bool)

(assert (=> start!108342 (=> (not res!849479) (not e!730503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108342 (= res!849479 (validMask!0 mask!2175))))

(assert (=> start!108342 e!730503))

(assert (=> start!108342 true))

(declare-fun array_inv!30937 (array!84041) Bool)

(assert (=> start!108342 (and (array_inv!30937 _values!1445) e!730506)))

(declare-fun array_inv!30938 (array!84043) Bool)

(assert (=> start!108342 (array_inv!30938 _keys!1741)))

(declare-fun b!1278689 () Bool)

(assert (=> b!1278689 (= e!730504 tp_is_empty!33529)))

(declare-fun b!1278690 () Bool)

(assert (=> b!1278690 (= e!730503 false)))

(declare-fun lt!575746 () Bool)

(declare-datatypes ((List!28823 0))(
  ( (Nil!28820) (Cons!28819 (h!30028 (_ BitVec 64)) (t!42355 List!28823)) )
))
(declare-fun arrayNoDuplicates!0 (array!84043 (_ BitVec 32) List!28823) Bool)

(assert (=> b!1278690 (= lt!575746 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28820))))

(declare-fun mapIsEmpty!51845 () Bool)

(assert (=> mapIsEmpty!51845 mapRes!51845))

(declare-fun mapNonEmpty!51845 () Bool)

(declare-fun tp!98820 () Bool)

(assert (=> mapNonEmpty!51845 (= mapRes!51845 (and tp!98820 e!730502))))

(declare-fun mapRest!51845 () (Array (_ BitVec 32) ValueCell!15866))

(declare-fun mapKey!51845 () (_ BitVec 32))

(declare-fun mapValue!51845 () ValueCell!15866)

(assert (=> mapNonEmpty!51845 (= (arr!40525 _values!1445) (store mapRest!51845 mapKey!51845 mapValue!51845))))

(assert (= (and start!108342 res!849479) b!1278686))

(assert (= (and b!1278686 res!849477) b!1278688))

(assert (= (and b!1278688 res!849478) b!1278690))

(assert (= (and b!1278685 condMapEmpty!51845) mapIsEmpty!51845))

(assert (= (and b!1278685 (not condMapEmpty!51845)) mapNonEmpty!51845))

(get-info :version)

(assert (= (and mapNonEmpty!51845 ((_ is ValueCellFull!15866) mapValue!51845)) b!1278687))

(assert (= (and b!1278685 ((_ is ValueCellFull!15866) mapDefault!51845)) b!1278689))

(assert (= start!108342 b!1278685))

(declare-fun m!1173453 () Bool)

(assert (=> b!1278688 m!1173453))

(declare-fun m!1173455 () Bool)

(assert (=> start!108342 m!1173455))

(declare-fun m!1173457 () Bool)

(assert (=> start!108342 m!1173457))

(declare-fun m!1173459 () Bool)

(assert (=> start!108342 m!1173459))

(declare-fun m!1173461 () Bool)

(assert (=> b!1278690 m!1173461))

(declare-fun m!1173463 () Bool)

(assert (=> mapNonEmpty!51845 m!1173463))

(check-sat (not b!1278690) (not mapNonEmpty!51845) tp_is_empty!33529 (not start!108342) (not b!1278688))
(check-sat)
