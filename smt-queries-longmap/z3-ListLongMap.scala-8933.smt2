; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108326 () Bool)

(assert start!108326)

(declare-fun mapIsEmpty!51821 () Bool)

(declare-fun mapRes!51821 () Bool)

(assert (=> mapIsEmpty!51821 mapRes!51821))

(declare-fun b!1278605 () Bool)

(declare-fun e!730411 () Bool)

(assert (=> b!1278605 (= e!730411 false)))

(declare-fun lt!575900 () Bool)

(declare-datatypes ((array!84120 0))(
  ( (array!84121 (arr!40564 (Array (_ BitVec 32) (_ BitVec 64))) (size!41114 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84120)

(declare-datatypes ((List!28744 0))(
  ( (Nil!28741) (Cons!28740 (h!29949 (_ BitVec 64)) (t!42284 List!28744)) )
))
(declare-fun arrayNoDuplicates!0 (array!84120 (_ BitVec 32) List!28744) Bool)

(assert (=> b!1278605 (= lt!575900 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28741))))

(declare-fun b!1278606 () Bool)

(declare-fun res!849432 () Bool)

(assert (=> b!1278606 (=> (not res!849432) (not e!730411))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84120 (_ BitVec 32)) Bool)

(assert (=> b!1278606 (= res!849432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278607 () Bool)

(declare-fun res!849433 () Bool)

(assert (=> b!1278607 (=> (not res!849433) (not e!730411))))

(declare-datatypes ((V!49787 0))(
  ( (V!49788 (val!16831 Int)) )
))
(declare-datatypes ((ValueCell!15858 0))(
  ( (ValueCellFull!15858 (v!19431 V!49787)) (EmptyCell!15858) )
))
(declare-datatypes ((array!84122 0))(
  ( (array!84123 (arr!40565 (Array (_ BitVec 32) ValueCell!15858)) (size!41115 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84122)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278607 (= res!849433 (and (= (size!41115 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41114 _keys!1741) (size!41115 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!849434 () Bool)

(assert (=> start!108326 (=> (not res!849434) (not e!730411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108326 (= res!849434 (validMask!0 mask!2175))))

(assert (=> start!108326 e!730411))

(assert (=> start!108326 true))

(declare-fun e!730414 () Bool)

(declare-fun array_inv!30809 (array!84122) Bool)

(assert (=> start!108326 (and (array_inv!30809 _values!1445) e!730414)))

(declare-fun array_inv!30810 (array!84120) Bool)

(assert (=> start!108326 (array_inv!30810 _keys!1741)))

(declare-fun b!1278608 () Bool)

(declare-fun e!730413 () Bool)

(declare-fun tp_is_empty!33513 () Bool)

(assert (=> b!1278608 (= e!730413 tp_is_empty!33513)))

(declare-fun b!1278609 () Bool)

(declare-fun e!730412 () Bool)

(assert (=> b!1278609 (= e!730412 tp_is_empty!33513)))

(declare-fun mapNonEmpty!51821 () Bool)

(declare-fun tp!98795 () Bool)

(assert (=> mapNonEmpty!51821 (= mapRes!51821 (and tp!98795 e!730412))))

(declare-fun mapValue!51821 () ValueCell!15858)

(declare-fun mapKey!51821 () (_ BitVec 32))

(declare-fun mapRest!51821 () (Array (_ BitVec 32) ValueCell!15858))

(assert (=> mapNonEmpty!51821 (= (arr!40565 _values!1445) (store mapRest!51821 mapKey!51821 mapValue!51821))))

(declare-fun b!1278610 () Bool)

(assert (=> b!1278610 (= e!730414 (and e!730413 mapRes!51821))))

(declare-fun condMapEmpty!51821 () Bool)

(declare-fun mapDefault!51821 () ValueCell!15858)

(assert (=> b!1278610 (= condMapEmpty!51821 (= (arr!40565 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15858)) mapDefault!51821)))))

(assert (= (and start!108326 res!849434) b!1278607))

(assert (= (and b!1278607 res!849433) b!1278606))

(assert (= (and b!1278606 res!849432) b!1278605))

(assert (= (and b!1278610 condMapEmpty!51821) mapIsEmpty!51821))

(assert (= (and b!1278610 (not condMapEmpty!51821)) mapNonEmpty!51821))

(get-info :version)

(assert (= (and mapNonEmpty!51821 ((_ is ValueCellFull!15858) mapValue!51821)) b!1278609))

(assert (= (and b!1278610 ((_ is ValueCellFull!15858) mapDefault!51821)) b!1278608))

(assert (= start!108326 b!1278610))

(declare-fun m!1173857 () Bool)

(assert (=> b!1278605 m!1173857))

(declare-fun m!1173859 () Bool)

(assert (=> b!1278606 m!1173859))

(declare-fun m!1173861 () Bool)

(assert (=> start!108326 m!1173861))

(declare-fun m!1173863 () Bool)

(assert (=> start!108326 m!1173863))

(declare-fun m!1173865 () Bool)

(assert (=> start!108326 m!1173865))

(declare-fun m!1173867 () Bool)

(assert (=> mapNonEmpty!51821 m!1173867))

(check-sat (not mapNonEmpty!51821) (not b!1278606) (not start!108326) tp_is_empty!33513 (not b!1278605))
(check-sat)
