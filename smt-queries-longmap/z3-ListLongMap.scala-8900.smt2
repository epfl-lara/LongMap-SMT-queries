; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108042 () Bool)

(assert start!108042)

(declare-fun res!848082 () Bool)

(declare-fun e!728619 () Bool)

(assert (=> start!108042 (=> (not res!848082) (not e!728619))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108042 (= res!848082 (validMask!0 mask!1805))))

(assert (=> start!108042 e!728619))

(assert (=> start!108042 true))

(declare-datatypes ((V!49523 0))(
  ( (V!49524 (val!16732 Int)) )
))
(declare-datatypes ((ValueCell!15759 0))(
  ( (ValueCellFull!15759 (v!19329 V!49523)) (EmptyCell!15759) )
))
(declare-datatypes ((array!83724 0))(
  ( (array!83725 (arr!40374 (Array (_ BitVec 32) ValueCell!15759)) (size!40924 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83724)

(declare-fun e!728616 () Bool)

(declare-fun array_inv!30685 (array!83724) Bool)

(assert (=> start!108042 (and (array_inv!30685 _values!1187) e!728616)))

(declare-datatypes ((array!83726 0))(
  ( (array!83727 (arr!40375 (Array (_ BitVec 32) (_ BitVec 64))) (size!40925 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83726)

(declare-fun array_inv!30686 (array!83726) Bool)

(assert (=> start!108042 (array_inv!30686 _keys!1427)))

(declare-fun b!1276072 () Bool)

(declare-fun res!848080 () Bool)

(assert (=> b!1276072 (=> (not res!848080) (not e!728619))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276072 (= res!848080 (and (= (size!40924 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40925 _keys!1427) (size!40924 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276073 () Bool)

(declare-fun e!728615 () Bool)

(declare-fun tp_is_empty!33315 () Bool)

(assert (=> b!1276073 (= e!728615 tp_is_empty!33315)))

(declare-fun mapNonEmpty!51500 () Bool)

(declare-fun mapRes!51500 () Bool)

(declare-fun tp!98258 () Bool)

(assert (=> mapNonEmpty!51500 (= mapRes!51500 (and tp!98258 e!728615))))

(declare-fun mapValue!51500 () ValueCell!15759)

(declare-fun mapKey!51500 () (_ BitVec 32))

(declare-fun mapRest!51500 () (Array (_ BitVec 32) ValueCell!15759))

(assert (=> mapNonEmpty!51500 (= (arr!40374 _values!1187) (store mapRest!51500 mapKey!51500 mapValue!51500))))

(declare-fun b!1276074 () Bool)

(assert (=> b!1276074 (= e!728619 false)))

(declare-fun lt!575440 () Bool)

(declare-datatypes ((List!28634 0))(
  ( (Nil!28631) (Cons!28630 (h!29839 (_ BitVec 64)) (t!42170 List!28634)) )
))
(declare-fun arrayNoDuplicates!0 (array!83726 (_ BitVec 32) List!28634) Bool)

(assert (=> b!1276074 (= lt!575440 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28631))))

(declare-fun b!1276075 () Bool)

(declare-fun e!728617 () Bool)

(assert (=> b!1276075 (= e!728616 (and e!728617 mapRes!51500))))

(declare-fun condMapEmpty!51500 () Bool)

(declare-fun mapDefault!51500 () ValueCell!15759)

(assert (=> b!1276075 (= condMapEmpty!51500 (= (arr!40374 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15759)) mapDefault!51500)))))

(declare-fun mapIsEmpty!51500 () Bool)

(assert (=> mapIsEmpty!51500 mapRes!51500))

(declare-fun b!1276076 () Bool)

(declare-fun res!848081 () Bool)

(assert (=> b!1276076 (=> (not res!848081) (not e!728619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83726 (_ BitVec 32)) Bool)

(assert (=> b!1276076 (= res!848081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276077 () Bool)

(assert (=> b!1276077 (= e!728617 tp_is_empty!33315)))

(assert (= (and start!108042 res!848082) b!1276072))

(assert (= (and b!1276072 res!848080) b!1276076))

(assert (= (and b!1276076 res!848081) b!1276074))

(assert (= (and b!1276075 condMapEmpty!51500) mapIsEmpty!51500))

(assert (= (and b!1276075 (not condMapEmpty!51500)) mapNonEmpty!51500))

(get-info :version)

(assert (= (and mapNonEmpty!51500 ((_ is ValueCellFull!15759) mapValue!51500)) b!1276073))

(assert (= (and b!1276075 ((_ is ValueCellFull!15759) mapDefault!51500)) b!1276077))

(assert (= start!108042 b!1276075))

(declare-fun m!1172099 () Bool)

(assert (=> start!108042 m!1172099))

(declare-fun m!1172101 () Bool)

(assert (=> start!108042 m!1172101))

(declare-fun m!1172103 () Bool)

(assert (=> start!108042 m!1172103))

(declare-fun m!1172105 () Bool)

(assert (=> mapNonEmpty!51500 m!1172105))

(declare-fun m!1172107 () Bool)

(assert (=> b!1276074 m!1172107))

(declare-fun m!1172109 () Bool)

(assert (=> b!1276076 m!1172109))

(check-sat tp_is_empty!33315 (not b!1276074) (not b!1276076) (not mapNonEmpty!51500) (not start!108042))
(check-sat)
