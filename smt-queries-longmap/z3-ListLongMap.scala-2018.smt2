; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35170 () Bool)

(assert start!35170)

(declare-fun b_free!7777 () Bool)

(declare-fun b_next!7777 () Bool)

(assert (=> start!35170 (= b_free!7777 (not b_next!7777))))

(declare-fun tp!26922 () Bool)

(declare-fun b_and!15029 () Bool)

(assert (=> start!35170 (= tp!26922 b_and!15029)))

(declare-fun mapIsEmpty!13077 () Bool)

(declare-fun mapRes!13077 () Bool)

(assert (=> mapIsEmpty!13077 mapRes!13077))

(declare-fun b!352646 () Bool)

(declare-fun e!215947 () Bool)

(declare-fun tp_is_empty!7729 () Bool)

(assert (=> b!352646 (= e!215947 tp_is_empty!7729)))

(declare-fun b!352647 () Bool)

(declare-fun res!195569 () Bool)

(declare-fun e!215946 () Bool)

(assert (=> b!352647 (=> (not res!195569) (not e!215946))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11283 0))(
  ( (V!11284 (val!3909 Int)) )
))
(declare-datatypes ((ValueCell!3521 0))(
  ( (ValueCellFull!3521 (v!6101 V!11283)) (EmptyCell!3521) )
))
(declare-datatypes ((array!19038 0))(
  ( (array!19039 (arr!9020 (Array (_ BitVec 32) ValueCell!3521)) (size!9372 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19038)

(declare-datatypes ((array!19040 0))(
  ( (array!19041 (arr!9021 (Array (_ BitVec 32) (_ BitVec 64))) (size!9373 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19040)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352647 (= res!195569 (and (= (size!9372 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9373 _keys!1895) (size!9372 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352648 () Bool)

(declare-fun res!195571 () Bool)

(assert (=> b!352648 (=> (not res!195571) (not e!215946))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352648 (= res!195571 (validKeyInArray!0 k0!1348))))

(declare-fun b!352649 () Bool)

(declare-fun res!195570 () Bool)

(assert (=> b!352649 (=> (not res!195570) (not e!215946))))

(declare-datatypes ((List!5156 0))(
  ( (Nil!5153) (Cons!5152 (h!6008 (_ BitVec 64)) (t!10294 List!5156)) )
))
(declare-fun arrayNoDuplicates!0 (array!19040 (_ BitVec 32) List!5156) Bool)

(assert (=> b!352649 (= res!195570 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5153))))

(declare-fun b!352650 () Bool)

(declare-fun res!195568 () Bool)

(assert (=> b!352650 (=> (not res!195568) (not e!215946))))

(declare-fun zeroValue!1467 () V!11283)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11283)

(declare-datatypes ((tuple2!5550 0))(
  ( (tuple2!5551 (_1!2786 (_ BitVec 64)) (_2!2786 V!11283)) )
))
(declare-datatypes ((List!5157 0))(
  ( (Nil!5154) (Cons!5153 (h!6009 tuple2!5550) (t!10295 List!5157)) )
))
(declare-datatypes ((ListLongMap!4465 0))(
  ( (ListLongMap!4466 (toList!2248 List!5157)) )
))
(declare-fun contains!2340 (ListLongMap!4465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1776 (array!19040 array!19038 (_ BitVec 32) (_ BitVec 32) V!11283 V!11283 (_ BitVec 32) Int) ListLongMap!4465)

(assert (=> b!352650 (= res!195568 (not (contains!2340 (getCurrentListMap!1776 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13077 () Bool)

(declare-fun tp!26921 () Bool)

(declare-fun e!215948 () Bool)

(assert (=> mapNonEmpty!13077 (= mapRes!13077 (and tp!26921 e!215948))))

(declare-fun mapValue!13077 () ValueCell!3521)

(declare-fun mapRest!13077 () (Array (_ BitVec 32) ValueCell!3521))

(declare-fun mapKey!13077 () (_ BitVec 32))

(assert (=> mapNonEmpty!13077 (= (arr!9020 _values!1525) (store mapRest!13077 mapKey!13077 mapValue!13077))))

(declare-fun b!352651 () Bool)

(declare-fun e!215944 () Bool)

(assert (=> b!352651 (= e!215944 (and e!215947 mapRes!13077))))

(declare-fun condMapEmpty!13077 () Bool)

(declare-fun mapDefault!13077 () ValueCell!3521)

(assert (=> b!352651 (= condMapEmpty!13077 (= (arr!9020 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3521)) mapDefault!13077)))))

(declare-fun b!352652 () Bool)

(assert (=> b!352652 (= e!215948 tp_is_empty!7729)))

(declare-fun b!352653 () Bool)

(declare-fun res!195567 () Bool)

(assert (=> b!352653 (=> (not res!195567) (not e!215946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19040 (_ BitVec 32)) Bool)

(assert (=> b!352653 (= res!195567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352654 () Bool)

(assert (=> b!352654 (= e!215946 false)))

(declare-datatypes ((SeekEntryResult!3425 0))(
  ( (MissingZero!3425 (index!15879 (_ BitVec 32))) (Found!3425 (index!15880 (_ BitVec 32))) (Intermediate!3425 (undefined!4237 Bool) (index!15881 (_ BitVec 32)) (x!35038 (_ BitVec 32))) (Undefined!3425) (MissingVacant!3425 (index!15882 (_ BitVec 32))) )
))
(declare-fun lt!165349 () SeekEntryResult!3425)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19040 (_ BitVec 32)) SeekEntryResult!3425)

(assert (=> b!352654 (= lt!165349 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!195572 () Bool)

(assert (=> start!35170 (=> (not res!195572) (not e!215946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35170 (= res!195572 (validMask!0 mask!2385))))

(assert (=> start!35170 e!215946))

(assert (=> start!35170 true))

(assert (=> start!35170 tp_is_empty!7729))

(assert (=> start!35170 tp!26922))

(declare-fun array_inv!6664 (array!19038) Bool)

(assert (=> start!35170 (and (array_inv!6664 _values!1525) e!215944)))

(declare-fun array_inv!6665 (array!19040) Bool)

(assert (=> start!35170 (array_inv!6665 _keys!1895)))

(assert (= (and start!35170 res!195572) b!352647))

(assert (= (and b!352647 res!195569) b!352653))

(assert (= (and b!352653 res!195567) b!352649))

(assert (= (and b!352649 res!195570) b!352648))

(assert (= (and b!352648 res!195571) b!352650))

(assert (= (and b!352650 res!195568) b!352654))

(assert (= (and b!352651 condMapEmpty!13077) mapIsEmpty!13077))

(assert (= (and b!352651 (not condMapEmpty!13077)) mapNonEmpty!13077))

(get-info :version)

(assert (= (and mapNonEmpty!13077 ((_ is ValueCellFull!3521) mapValue!13077)) b!352652))

(assert (= (and b!352651 ((_ is ValueCellFull!3521) mapDefault!13077)) b!352646))

(assert (= start!35170 b!352651))

(declare-fun m!352491 () Bool)

(assert (=> mapNonEmpty!13077 m!352491))

(declare-fun m!352493 () Bool)

(assert (=> b!352653 m!352493))

(declare-fun m!352495 () Bool)

(assert (=> b!352649 m!352495))

(declare-fun m!352497 () Bool)

(assert (=> b!352650 m!352497))

(assert (=> b!352650 m!352497))

(declare-fun m!352499 () Bool)

(assert (=> b!352650 m!352499))

(declare-fun m!352501 () Bool)

(assert (=> start!35170 m!352501))

(declare-fun m!352503 () Bool)

(assert (=> start!35170 m!352503))

(declare-fun m!352505 () Bool)

(assert (=> start!35170 m!352505))

(declare-fun m!352507 () Bool)

(assert (=> b!352654 m!352507))

(declare-fun m!352509 () Bool)

(assert (=> b!352648 m!352509))

(check-sat (not mapNonEmpty!13077) tp_is_empty!7729 b_and!15029 (not b!352653) (not b!352649) (not b!352650) (not start!35170) (not b_next!7777) (not b!352654) (not b!352648))
(check-sat b_and!15029 (not b_next!7777))
