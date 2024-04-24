; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108234 () Bool)

(assert start!108234)

(declare-fun b!1277089 () Bool)

(declare-fun e!729222 () Bool)

(assert (=> b!1277089 (= e!729222 false)))

(declare-fun lt!575876 () Bool)

(declare-datatypes ((array!83691 0))(
  ( (array!83692 (arr!40353 (Array (_ BitVec 32) (_ BitVec 64))) (size!40904 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83691)

(declare-datatypes ((List!28653 0))(
  ( (Nil!28650) (Cons!28649 (h!29867 (_ BitVec 64)) (t!42181 List!28653)) )
))
(declare-fun arrayNoDuplicates!0 (array!83691 (_ BitVec 32) List!28653) Bool)

(assert (=> b!1277089 (= lt!575876 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28650))))

(declare-fun b!1277090 () Bool)

(declare-fun res!848456 () Bool)

(assert (=> b!1277090 (=> (not res!848456) (not e!729222))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83691 (_ BitVec 32)) Bool)

(assert (=> b!1277090 (= res!848456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51452 () Bool)

(declare-fun mapRes!51452 () Bool)

(assert (=> mapIsEmpty!51452 mapRes!51452))

(declare-fun b!1277091 () Bool)

(declare-fun e!729226 () Bool)

(declare-fun tp_is_empty!33283 () Bool)

(assert (=> b!1277091 (= e!729226 tp_is_empty!33283)))

(declare-fun b!1277092 () Bool)

(declare-fun e!729225 () Bool)

(declare-fun e!729224 () Bool)

(assert (=> b!1277092 (= e!729225 (and e!729224 mapRes!51452))))

(declare-fun condMapEmpty!51452 () Bool)

(declare-datatypes ((V!49481 0))(
  ( (V!49482 (val!16716 Int)) )
))
(declare-datatypes ((ValueCell!15743 0))(
  ( (ValueCellFull!15743 (v!19308 V!49481)) (EmptyCell!15743) )
))
(declare-datatypes ((array!83693 0))(
  ( (array!83694 (arr!40354 (Array (_ BitVec 32) ValueCell!15743)) (size!40905 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83693)

(declare-fun mapDefault!51452 () ValueCell!15743)

(assert (=> b!1277092 (= condMapEmpty!51452 (= (arr!40354 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15743)) mapDefault!51452)))))

(declare-fun b!1277093 () Bool)

(declare-fun res!848458 () Bool)

(assert (=> b!1277093 (=> (not res!848458) (not e!729222))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277093 (= res!848458 (and (= (size!40905 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40904 _keys!1427) (size!40905 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277094 () Bool)

(assert (=> b!1277094 (= e!729224 tp_is_empty!33283)))

(declare-fun res!848457 () Bool)

(assert (=> start!108234 (=> (not res!848457) (not e!729222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108234 (= res!848457 (validMask!0 mask!1805))))

(assert (=> start!108234 e!729222))

(assert (=> start!108234 true))

(declare-fun array_inv!30859 (array!83693) Bool)

(assert (=> start!108234 (and (array_inv!30859 _values!1187) e!729225)))

(declare-fun array_inv!30860 (array!83691) Bool)

(assert (=> start!108234 (array_inv!30860 _keys!1427)))

(declare-fun mapNonEmpty!51452 () Bool)

(declare-fun tp!98210 () Bool)

(assert (=> mapNonEmpty!51452 (= mapRes!51452 (and tp!98210 e!729226))))

(declare-fun mapRest!51452 () (Array (_ BitVec 32) ValueCell!15743))

(declare-fun mapValue!51452 () ValueCell!15743)

(declare-fun mapKey!51452 () (_ BitVec 32))

(assert (=> mapNonEmpty!51452 (= (arr!40354 _values!1187) (store mapRest!51452 mapKey!51452 mapValue!51452))))

(assert (= (and start!108234 res!848457) b!1277093))

(assert (= (and b!1277093 res!848458) b!1277090))

(assert (= (and b!1277090 res!848456) b!1277089))

(assert (= (and b!1277092 condMapEmpty!51452) mapIsEmpty!51452))

(assert (= (and b!1277092 (not condMapEmpty!51452)) mapNonEmpty!51452))

(get-info :version)

(assert (= (and mapNonEmpty!51452 ((_ is ValueCellFull!15743) mapValue!51452)) b!1277091))

(assert (= (and b!1277092 ((_ is ValueCellFull!15743) mapDefault!51452)) b!1277094))

(assert (= start!108234 b!1277092))

(declare-fun m!1173519 () Bool)

(assert (=> b!1277089 m!1173519))

(declare-fun m!1173521 () Bool)

(assert (=> b!1277090 m!1173521))

(declare-fun m!1173523 () Bool)

(assert (=> start!108234 m!1173523))

(declare-fun m!1173525 () Bool)

(assert (=> start!108234 m!1173525))

(declare-fun m!1173527 () Bool)

(assert (=> start!108234 m!1173527))

(declare-fun m!1173529 () Bool)

(assert (=> mapNonEmpty!51452 m!1173529))

(check-sat (not start!108234) tp_is_empty!33283 (not b!1277090) (not b!1277089) (not mapNonEmpty!51452))
(check-sat)
