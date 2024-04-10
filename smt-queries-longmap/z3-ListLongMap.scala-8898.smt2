; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108030 () Bool)

(assert start!108030)

(declare-fun b!1275964 () Bool)

(declare-fun e!728527 () Bool)

(declare-fun tp_is_empty!33303 () Bool)

(assert (=> b!1275964 (= e!728527 tp_is_empty!33303)))

(declare-fun res!848028 () Bool)

(declare-fun e!728526 () Bool)

(assert (=> start!108030 (=> (not res!848028) (not e!728526))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108030 (= res!848028 (validMask!0 mask!1805))))

(assert (=> start!108030 e!728526))

(assert (=> start!108030 true))

(declare-datatypes ((V!49507 0))(
  ( (V!49508 (val!16726 Int)) )
))
(declare-datatypes ((ValueCell!15753 0))(
  ( (ValueCellFull!15753 (v!19323 V!49507)) (EmptyCell!15753) )
))
(declare-datatypes ((array!83700 0))(
  ( (array!83701 (arr!40362 (Array (_ BitVec 32) ValueCell!15753)) (size!40912 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83700)

(declare-fun e!728529 () Bool)

(declare-fun array_inv!30675 (array!83700) Bool)

(assert (=> start!108030 (and (array_inv!30675 _values!1187) e!728529)))

(declare-datatypes ((array!83702 0))(
  ( (array!83703 (arr!40363 (Array (_ BitVec 32) (_ BitVec 64))) (size!40913 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83702)

(declare-fun array_inv!30676 (array!83702) Bool)

(assert (=> start!108030 (array_inv!30676 _keys!1427)))

(declare-fun mapNonEmpty!51482 () Bool)

(declare-fun mapRes!51482 () Bool)

(declare-fun tp!98240 () Bool)

(declare-fun e!728525 () Bool)

(assert (=> mapNonEmpty!51482 (= mapRes!51482 (and tp!98240 e!728525))))

(declare-fun mapKey!51482 () (_ BitVec 32))

(declare-fun mapValue!51482 () ValueCell!15753)

(declare-fun mapRest!51482 () (Array (_ BitVec 32) ValueCell!15753))

(assert (=> mapNonEmpty!51482 (= (arr!40362 _values!1187) (store mapRest!51482 mapKey!51482 mapValue!51482))))

(declare-fun b!1275965 () Bool)

(assert (=> b!1275965 (= e!728526 false)))

(declare-fun lt!575422 () Bool)

(declare-datatypes ((List!28630 0))(
  ( (Nil!28627) (Cons!28626 (h!29835 (_ BitVec 64)) (t!42166 List!28630)) )
))
(declare-fun arrayNoDuplicates!0 (array!83702 (_ BitVec 32) List!28630) Bool)

(assert (=> b!1275965 (= lt!575422 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28627))))

(declare-fun b!1275966 () Bool)

(assert (=> b!1275966 (= e!728525 tp_is_empty!33303)))

(declare-fun b!1275967 () Bool)

(declare-fun res!848027 () Bool)

(assert (=> b!1275967 (=> (not res!848027) (not e!728526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83702 (_ BitVec 32)) Bool)

(assert (=> b!1275967 (= res!848027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51482 () Bool)

(assert (=> mapIsEmpty!51482 mapRes!51482))

(declare-fun b!1275968 () Bool)

(assert (=> b!1275968 (= e!728529 (and e!728527 mapRes!51482))))

(declare-fun condMapEmpty!51482 () Bool)

(declare-fun mapDefault!51482 () ValueCell!15753)

(assert (=> b!1275968 (= condMapEmpty!51482 (= (arr!40362 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15753)) mapDefault!51482)))))

(declare-fun b!1275969 () Bool)

(declare-fun res!848026 () Bool)

(assert (=> b!1275969 (=> (not res!848026) (not e!728526))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275969 (= res!848026 (and (= (size!40912 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40913 _keys!1427) (size!40912 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108030 res!848028) b!1275969))

(assert (= (and b!1275969 res!848026) b!1275967))

(assert (= (and b!1275967 res!848027) b!1275965))

(assert (= (and b!1275968 condMapEmpty!51482) mapIsEmpty!51482))

(assert (= (and b!1275968 (not condMapEmpty!51482)) mapNonEmpty!51482))

(get-info :version)

(assert (= (and mapNonEmpty!51482 ((_ is ValueCellFull!15753) mapValue!51482)) b!1275966))

(assert (= (and b!1275968 ((_ is ValueCellFull!15753) mapDefault!51482)) b!1275964))

(assert (= start!108030 b!1275968))

(declare-fun m!1172027 () Bool)

(assert (=> start!108030 m!1172027))

(declare-fun m!1172029 () Bool)

(assert (=> start!108030 m!1172029))

(declare-fun m!1172031 () Bool)

(assert (=> start!108030 m!1172031))

(declare-fun m!1172033 () Bool)

(assert (=> mapNonEmpty!51482 m!1172033))

(declare-fun m!1172035 () Bool)

(assert (=> b!1275965 m!1172035))

(declare-fun m!1172037 () Bool)

(assert (=> b!1275967 m!1172037))

(check-sat (not mapNonEmpty!51482) (not start!108030) (not b!1275965) (not b!1275967) tp_is_empty!33303)
(check-sat)
