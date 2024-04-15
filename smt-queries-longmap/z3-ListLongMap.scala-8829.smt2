; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107198 () Bool)

(assert start!107198)

(declare-fun b!1270741 () Bool)

(declare-fun res!845568 () Bool)

(declare-fun e!724457 () Bool)

(assert (=> b!1270741 (=> (not res!845568) (not e!724457))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82945 0))(
  ( (array!82946 (arr!40010 (Array (_ BitVec 32) (_ BitVec 64))) (size!40548 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82945)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!49043 0))(
  ( (V!49044 (val!16518 Int)) )
))
(declare-datatypes ((ValueCell!15590 0))(
  ( (ValueCellFull!15590 (v!19154 V!49043)) (EmptyCell!15590) )
))
(declare-datatypes ((array!82947 0))(
  ( (array!82948 (arr!40011 (Array (_ BitVec 32) ValueCell!15590)) (size!40549 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82947)

(assert (=> b!1270741 (= res!845568 (and (= (size!40549 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40548 _keys!1364) (size!40549 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270742 () Bool)

(declare-fun e!724459 () Bool)

(declare-fun tp_is_empty!32887 () Bool)

(assert (=> b!1270742 (= e!724459 tp_is_empty!32887)))

(declare-fun b!1270743 () Bool)

(declare-fun e!724458 () Bool)

(declare-fun e!724456 () Bool)

(declare-fun mapRes!50911 () Bool)

(assert (=> b!1270743 (= e!724458 (and e!724456 mapRes!50911))))

(declare-fun condMapEmpty!50911 () Bool)

(declare-fun mapDefault!50911 () ValueCell!15590)

(assert (=> b!1270743 (= condMapEmpty!50911 (= (arr!40011 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15590)) mapDefault!50911)))))

(declare-fun res!845570 () Bool)

(assert (=> start!107198 (=> (not res!845570) (not e!724457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107198 (= res!845570 (validMask!0 mask!1730))))

(assert (=> start!107198 e!724457))

(declare-fun array_inv!30595 (array!82947) Bool)

(assert (=> start!107198 (and (array_inv!30595 _values!1134) e!724458)))

(assert (=> start!107198 true))

(declare-fun array_inv!30596 (array!82945) Bool)

(assert (=> start!107198 (array_inv!30596 _keys!1364)))

(declare-fun mapIsEmpty!50911 () Bool)

(assert (=> mapIsEmpty!50911 mapRes!50911))

(declare-fun mapNonEmpty!50911 () Bool)

(declare-fun tp!97253 () Bool)

(assert (=> mapNonEmpty!50911 (= mapRes!50911 (and tp!97253 e!724459))))

(declare-fun mapKey!50911 () (_ BitVec 32))

(declare-fun mapValue!50911 () ValueCell!15590)

(declare-fun mapRest!50911 () (Array (_ BitVec 32) ValueCell!15590))

(assert (=> mapNonEmpty!50911 (= (arr!40011 _values!1134) (store mapRest!50911 mapKey!50911 mapValue!50911))))

(declare-fun b!1270744 () Bool)

(assert (=> b!1270744 (= e!724456 tp_is_empty!32887)))

(declare-fun b!1270745 () Bool)

(declare-fun res!845569 () Bool)

(assert (=> b!1270745 (=> (not res!845569) (not e!724457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82945 (_ BitVec 32)) Bool)

(assert (=> b!1270745 (= res!845569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270746 () Bool)

(assert (=> b!1270746 (= e!724457 false)))

(declare-fun lt!574589 () Bool)

(declare-datatypes ((List!28580 0))(
  ( (Nil!28577) (Cons!28576 (h!29785 (_ BitVec 64)) (t!42101 List!28580)) )
))
(declare-fun arrayNoDuplicates!0 (array!82945 (_ BitVec 32) List!28580) Bool)

(assert (=> b!1270746 (= lt!574589 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28577))))

(assert (= (and start!107198 res!845570) b!1270741))

(assert (= (and b!1270741 res!845568) b!1270745))

(assert (= (and b!1270745 res!845569) b!1270746))

(assert (= (and b!1270743 condMapEmpty!50911) mapIsEmpty!50911))

(assert (= (and b!1270743 (not condMapEmpty!50911)) mapNonEmpty!50911))

(get-info :version)

(assert (= (and mapNonEmpty!50911 ((_ is ValueCellFull!15590) mapValue!50911)) b!1270742))

(assert (= (and b!1270743 ((_ is ValueCellFull!15590) mapDefault!50911)) b!1270744))

(assert (= start!107198 b!1270743))

(declare-fun m!1168467 () Bool)

(assert (=> start!107198 m!1168467))

(declare-fun m!1168469 () Bool)

(assert (=> start!107198 m!1168469))

(declare-fun m!1168471 () Bool)

(assert (=> start!107198 m!1168471))

(declare-fun m!1168473 () Bool)

(assert (=> mapNonEmpty!50911 m!1168473))

(declare-fun m!1168475 () Bool)

(assert (=> b!1270745 m!1168475))

(declare-fun m!1168477 () Bool)

(assert (=> b!1270746 m!1168477))

(check-sat (not b!1270746) tp_is_empty!32887 (not b!1270745) (not mapNonEmpty!50911) (not start!107198))
(check-sat)
