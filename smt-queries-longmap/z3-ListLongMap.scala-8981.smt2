; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108648 () Bool)

(assert start!108648)

(declare-fun b_free!28161 () Bool)

(declare-fun b_next!28161 () Bool)

(assert (=> start!108648 (= b_free!28161 (not b_next!28161))))

(declare-fun tp!99598 () Bool)

(declare-fun b_and!46227 () Bool)

(assert (=> start!108648 (= tp!99598 b_and!46227)))

(declare-fun b!1282469 () Bool)

(declare-fun res!851856 () Bool)

(declare-fun e!732769 () Bool)

(assert (=> b!1282469 (=> (not res!851856) (not e!732769))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84672 0))(
  ( (array!84673 (arr!40838 (Array (_ BitVec 32) (_ BitVec 64))) (size!41388 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84672)

(assert (=> b!1282469 (= res!851856 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41388 _keys!1741))))))

(declare-fun mapNonEmpty!52259 () Bool)

(declare-fun mapRes!52259 () Bool)

(declare-fun tp!99599 () Bool)

(declare-fun e!732768 () Bool)

(assert (=> mapNonEmpty!52259 (= mapRes!52259 (and tp!99599 e!732768))))

(declare-datatypes ((V!50171 0))(
  ( (V!50172 (val!16975 Int)) )
))
(declare-datatypes ((ValueCell!16002 0))(
  ( (ValueCellFull!16002 (v!19577 V!50171)) (EmptyCell!16002) )
))
(declare-fun mapValue!52259 () ValueCell!16002)

(declare-fun mapRest!52259 () (Array (_ BitVec 32) ValueCell!16002))

(declare-fun mapKey!52259 () (_ BitVec 32))

(declare-datatypes ((array!84674 0))(
  ( (array!84675 (arr!40839 (Array (_ BitVec 32) ValueCell!16002)) (size!41389 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84674)

(assert (=> mapNonEmpty!52259 (= (arr!40839 _values!1445) (store mapRest!52259 mapKey!52259 mapValue!52259))))

(declare-fun mapIsEmpty!52259 () Bool)

(assert (=> mapIsEmpty!52259 mapRes!52259))

(declare-fun b!1282470 () Bool)

(declare-fun res!851853 () Bool)

(assert (=> b!1282470 (=> (not res!851853) (not e!732769))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282470 (= res!851853 (and (= (size!41389 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41388 _keys!1741) (size!41389 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282471 () Bool)

(declare-fun tp_is_empty!33801 () Bool)

(assert (=> b!1282471 (= e!732768 tp_is_empty!33801)))

(declare-fun b!1282472 () Bool)

(declare-fun e!732767 () Bool)

(declare-fun e!732770 () Bool)

(assert (=> b!1282472 (= e!732767 (and e!732770 mapRes!52259))))

(declare-fun condMapEmpty!52259 () Bool)

(declare-fun mapDefault!52259 () ValueCell!16002)

(assert (=> b!1282472 (= condMapEmpty!52259 (= (arr!40839 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16002)) mapDefault!52259)))))

(declare-fun b!1282473 () Bool)

(assert (=> b!1282473 (= e!732769 false)))

(declare-fun minValue!1387 () V!50171)

(declare-fun zeroValue!1387 () V!50171)

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576538 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21736 0))(
  ( (tuple2!21737 (_1!10879 (_ BitVec 64)) (_2!10879 V!50171)) )
))
(declare-datatypes ((List!28932 0))(
  ( (Nil!28929) (Cons!28928 (h!30137 tuple2!21736) (t!42476 List!28932)) )
))
(declare-datatypes ((ListLongMap!19393 0))(
  ( (ListLongMap!19394 (toList!9712 List!28932)) )
))
(declare-fun contains!7829 (ListLongMap!19393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4796 (array!84672 array!84674 (_ BitVec 32) (_ BitVec 32) V!50171 V!50171 (_ BitVec 32) Int) ListLongMap!19393)

(assert (=> b!1282473 (= lt!576538 (contains!7829 (getCurrentListMap!4796 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!851852 () Bool)

(assert (=> start!108648 (=> (not res!851852) (not e!732769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108648 (= res!851852 (validMask!0 mask!2175))))

(assert (=> start!108648 e!732769))

(assert (=> start!108648 tp_is_empty!33801))

(assert (=> start!108648 true))

(declare-fun array_inv!30981 (array!84674) Bool)

(assert (=> start!108648 (and (array_inv!30981 _values!1445) e!732767)))

(declare-fun array_inv!30982 (array!84672) Bool)

(assert (=> start!108648 (array_inv!30982 _keys!1741)))

(assert (=> start!108648 tp!99598))

(declare-fun b!1282474 () Bool)

(declare-fun res!851855 () Bool)

(assert (=> b!1282474 (=> (not res!851855) (not e!732769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84672 (_ BitVec 32)) Bool)

(assert (=> b!1282474 (= res!851855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282475 () Bool)

(declare-fun res!851854 () Bool)

(assert (=> b!1282475 (=> (not res!851854) (not e!732769))))

(declare-datatypes ((List!28933 0))(
  ( (Nil!28930) (Cons!28929 (h!30138 (_ BitVec 64)) (t!42477 List!28933)) )
))
(declare-fun arrayNoDuplicates!0 (array!84672 (_ BitVec 32) List!28933) Bool)

(assert (=> b!1282475 (= res!851854 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28930))))

(declare-fun b!1282476 () Bool)

(assert (=> b!1282476 (= e!732770 tp_is_empty!33801)))

(assert (= (and start!108648 res!851852) b!1282470))

(assert (= (and b!1282470 res!851853) b!1282474))

(assert (= (and b!1282474 res!851855) b!1282475))

(assert (= (and b!1282475 res!851854) b!1282469))

(assert (= (and b!1282469 res!851856) b!1282473))

(assert (= (and b!1282472 condMapEmpty!52259) mapIsEmpty!52259))

(assert (= (and b!1282472 (not condMapEmpty!52259)) mapNonEmpty!52259))

(get-info :version)

(assert (= (and mapNonEmpty!52259 ((_ is ValueCellFull!16002) mapValue!52259)) b!1282471))

(assert (= (and b!1282472 ((_ is ValueCellFull!16002) mapDefault!52259)) b!1282476))

(assert (= start!108648 b!1282472))

(declare-fun m!1176661 () Bool)

(assert (=> b!1282474 m!1176661))

(declare-fun m!1176663 () Bool)

(assert (=> b!1282473 m!1176663))

(assert (=> b!1282473 m!1176663))

(declare-fun m!1176665 () Bool)

(assert (=> b!1282473 m!1176665))

(declare-fun m!1176667 () Bool)

(assert (=> b!1282475 m!1176667))

(declare-fun m!1176669 () Bool)

(assert (=> mapNonEmpty!52259 m!1176669))

(declare-fun m!1176671 () Bool)

(assert (=> start!108648 m!1176671))

(declare-fun m!1176673 () Bool)

(assert (=> start!108648 m!1176673))

(declare-fun m!1176675 () Bool)

(assert (=> start!108648 m!1176675))

(check-sat (not start!108648) tp_is_empty!33801 (not b!1282473) b_and!46227 (not b!1282474) (not b!1282475) (not mapNonEmpty!52259) (not b_next!28161))
(check-sat b_and!46227 (not b_next!28161))
