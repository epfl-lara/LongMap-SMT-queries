; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108240 () Bool)

(assert start!108240)

(declare-fun b!1278109 () Bool)

(declare-fun e!730005 () Bool)

(declare-fun tp_is_empty!33471 () Bool)

(assert (=> b!1278109 (= e!730005 tp_is_empty!33471)))

(declare-fun b!1278110 () Bool)

(declare-fun e!730001 () Bool)

(assert (=> b!1278110 (= e!730001 tp_is_empty!33471)))

(declare-fun res!849189 () Bool)

(declare-fun e!730003 () Bool)

(assert (=> start!108240 (=> (not res!849189) (not e!730003))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108240 (= res!849189 (validMask!0 mask!2175))))

(assert (=> start!108240 e!730003))

(assert (=> start!108240 true))

(declare-datatypes ((V!49731 0))(
  ( (V!49732 (val!16810 Int)) )
))
(declare-datatypes ((ValueCell!15837 0))(
  ( (ValueCellFull!15837 (v!19409 V!49731)) (EmptyCell!15837) )
))
(declare-datatypes ((array!84030 0))(
  ( (array!84031 (arr!40524 (Array (_ BitVec 32) ValueCell!15837)) (size!41074 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84030)

(declare-fun e!730004 () Bool)

(declare-fun array_inv!30783 (array!84030) Bool)

(assert (=> start!108240 (and (array_inv!30783 _values!1445) e!730004)))

(declare-datatypes ((array!84032 0))(
  ( (array!84033 (arr!40525 (Array (_ BitVec 32) (_ BitVec 64))) (size!41075 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84032)

(declare-fun array_inv!30784 (array!84032) Bool)

(assert (=> start!108240 (array_inv!30784 _keys!1741)))

(declare-fun b!1278111 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278111 (= e!730003 (and (= (size!41074 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41075 _keys!1741) (size!41074 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (not (= (size!41075 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)))))))

(declare-fun b!1278112 () Bool)

(declare-fun mapRes!51743 () Bool)

(assert (=> b!1278112 (= e!730004 (and e!730005 mapRes!51743))))

(declare-fun condMapEmpty!51743 () Bool)

(declare-fun mapDefault!51743 () ValueCell!15837)

(assert (=> b!1278112 (= condMapEmpty!51743 (= (arr!40524 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15837)) mapDefault!51743)))))

(declare-fun mapNonEmpty!51743 () Bool)

(declare-fun tp!98717 () Bool)

(assert (=> mapNonEmpty!51743 (= mapRes!51743 (and tp!98717 e!730001))))

(declare-fun mapKey!51743 () (_ BitVec 32))

(declare-fun mapRest!51743 () (Array (_ BitVec 32) ValueCell!15837))

(declare-fun mapValue!51743 () ValueCell!15837)

(assert (=> mapNonEmpty!51743 (= (arr!40524 _values!1445) (store mapRest!51743 mapKey!51743 mapValue!51743))))

(declare-fun mapIsEmpty!51743 () Bool)

(assert (=> mapIsEmpty!51743 mapRes!51743))

(assert (= (and start!108240 res!849189) b!1278111))

(assert (= (and b!1278112 condMapEmpty!51743) mapIsEmpty!51743))

(assert (= (and b!1278112 (not condMapEmpty!51743)) mapNonEmpty!51743))

(get-info :version)

(assert (= (and mapNonEmpty!51743 ((_ is ValueCellFull!15837) mapValue!51743)) b!1278110))

(assert (= (and b!1278112 ((_ is ValueCellFull!15837) mapDefault!51743)) b!1278109))

(assert (= start!108240 b!1278112))

(declare-fun m!1173549 () Bool)

(assert (=> start!108240 m!1173549))

(declare-fun m!1173551 () Bool)

(assert (=> start!108240 m!1173551))

(declare-fun m!1173553 () Bool)

(assert (=> start!108240 m!1173553))

(declare-fun m!1173555 () Bool)

(assert (=> mapNonEmpty!51743 m!1173555))

(check-sat (not start!108240) (not mapNonEmpty!51743) tp_is_empty!33471)
(check-sat)
