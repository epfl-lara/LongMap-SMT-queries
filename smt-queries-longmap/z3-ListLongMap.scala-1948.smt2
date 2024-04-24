; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34420 () Bool)

(assert start!34420)

(declare-fun b_free!7357 () Bool)

(declare-fun b_next!7357 () Bool)

(assert (=> start!34420 (= b_free!7357 (not b_next!7357))))

(declare-fun tp!25616 () Bool)

(declare-fun b_and!14579 () Bool)

(assert (=> start!34420 (= tp!25616 b_and!14579)))

(declare-fun b!343814 () Bool)

(declare-fun res!190102 () Bool)

(declare-fun e!210797 () Bool)

(assert (=> b!343814 (=> (not res!190102) (not e!210797))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343814 (= res!190102 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12402 () Bool)

(declare-fun mapRes!12402 () Bool)

(declare-fun tp!25617 () Bool)

(declare-fun e!210798 () Bool)

(assert (=> mapNonEmpty!12402 (= mapRes!12402 (and tp!25617 e!210798))))

(declare-datatypes ((V!10723 0))(
  ( (V!10724 (val!3699 Int)) )
))
(declare-datatypes ((ValueCell!3311 0))(
  ( (ValueCellFull!3311 (v!5876 V!10723)) (EmptyCell!3311) )
))
(declare-datatypes ((array!18206 0))(
  ( (array!18207 (arr!8619 (Array (_ BitVec 32) ValueCell!3311)) (size!8971 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18206)

(declare-fun mapValue!12402 () ValueCell!3311)

(declare-fun mapRest!12402 () (Array (_ BitVec 32) ValueCell!3311))

(declare-fun mapKey!12402 () (_ BitVec 32))

(assert (=> mapNonEmpty!12402 (= (arr!8619 _values!1525) (store mapRest!12402 mapKey!12402 mapValue!12402))))

(declare-fun b!343815 () Bool)

(declare-fun res!190106 () Bool)

(assert (=> b!343815 (=> (not res!190106) (not e!210797))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10723)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18208 0))(
  ( (array!18209 (arr!8620 (Array (_ BitVec 32) (_ BitVec 64))) (size!8972 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18208)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10723)

(declare-datatypes ((tuple2!5276 0))(
  ( (tuple2!5277 (_1!2649 (_ BitVec 64)) (_2!2649 V!10723)) )
))
(declare-datatypes ((List!4881 0))(
  ( (Nil!4878) (Cons!4877 (h!5733 tuple2!5276) (t!9989 List!4881)) )
))
(declare-datatypes ((ListLongMap!4191 0))(
  ( (ListLongMap!4192 (toList!2111 List!4881)) )
))
(declare-fun contains!2188 (ListLongMap!4191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1640 (array!18208 array!18206 (_ BitVec 32) (_ BitVec 32) V!10723 V!10723 (_ BitVec 32) Int) ListLongMap!4191)

(assert (=> b!343815 (= res!190106 (not (contains!2188 (getCurrentListMap!1640 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!190105 () Bool)

(assert (=> start!34420 (=> (not res!190105) (not e!210797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34420 (= res!190105 (validMask!0 mask!2385))))

(assert (=> start!34420 e!210797))

(assert (=> start!34420 true))

(declare-fun tp_is_empty!7309 () Bool)

(assert (=> start!34420 tp_is_empty!7309))

(assert (=> start!34420 tp!25616))

(declare-fun e!210800 () Bool)

(declare-fun array_inv!6370 (array!18206) Bool)

(assert (=> start!34420 (and (array_inv!6370 _values!1525) e!210800)))

(declare-fun array_inv!6371 (array!18208) Bool)

(assert (=> start!34420 (array_inv!6371 _keys!1895)))

(declare-fun mapIsEmpty!12402 () Bool)

(assert (=> mapIsEmpty!12402 mapRes!12402))

(declare-fun b!343816 () Bool)

(declare-fun res!190103 () Bool)

(assert (=> b!343816 (=> (not res!190103) (not e!210797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18208 (_ BitVec 32)) Bool)

(assert (=> b!343816 (= res!190103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343817 () Bool)

(assert (=> b!343817 (= e!210797 false)))

(declare-datatypes ((SeekEntryResult!3277 0))(
  ( (MissingZero!3277 (index!15287 (_ BitVec 32))) (Found!3277 (index!15288 (_ BitVec 32))) (Intermediate!3277 (undefined!4089 Bool) (index!15289 (_ BitVec 32)) (x!34180 (_ BitVec 32))) (Undefined!3277) (MissingVacant!3277 (index!15290 (_ BitVec 32))) )
))
(declare-fun lt!162628 () SeekEntryResult!3277)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18208 (_ BitVec 32)) SeekEntryResult!3277)

(assert (=> b!343817 (= lt!162628 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343818 () Bool)

(declare-fun res!190104 () Bool)

(assert (=> b!343818 (=> (not res!190104) (not e!210797))))

(assert (=> b!343818 (= res!190104 (and (= (size!8971 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8972 _keys!1895) (size!8971 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343819 () Bool)

(declare-fun res!190101 () Bool)

(assert (=> b!343819 (=> (not res!190101) (not e!210797))))

(declare-datatypes ((List!4882 0))(
  ( (Nil!4879) (Cons!4878 (h!5734 (_ BitVec 64)) (t!9990 List!4882)) )
))
(declare-fun arrayNoDuplicates!0 (array!18208 (_ BitVec 32) List!4882) Bool)

(assert (=> b!343819 (= res!190101 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4879))))

(declare-fun b!343820 () Bool)

(declare-fun e!210799 () Bool)

(assert (=> b!343820 (= e!210799 tp_is_empty!7309)))

(declare-fun b!343821 () Bool)

(assert (=> b!343821 (= e!210800 (and e!210799 mapRes!12402))))

(declare-fun condMapEmpty!12402 () Bool)

(declare-fun mapDefault!12402 () ValueCell!3311)

(assert (=> b!343821 (= condMapEmpty!12402 (= (arr!8619 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3311)) mapDefault!12402)))))

(declare-fun b!343822 () Bool)

(assert (=> b!343822 (= e!210798 tp_is_empty!7309)))

(assert (= (and start!34420 res!190105) b!343818))

(assert (= (and b!343818 res!190104) b!343816))

(assert (= (and b!343816 res!190103) b!343819))

(assert (= (and b!343819 res!190101) b!343814))

(assert (= (and b!343814 res!190102) b!343815))

(assert (= (and b!343815 res!190106) b!343817))

(assert (= (and b!343821 condMapEmpty!12402) mapIsEmpty!12402))

(assert (= (and b!343821 (not condMapEmpty!12402)) mapNonEmpty!12402))

(get-info :version)

(assert (= (and mapNonEmpty!12402 ((_ is ValueCellFull!3311) mapValue!12402)) b!343822))

(assert (= (and b!343821 ((_ is ValueCellFull!3311) mapDefault!12402)) b!343820))

(assert (= start!34420 b!343821))

(declare-fun m!345861 () Bool)

(assert (=> mapNonEmpty!12402 m!345861))

(declare-fun m!345863 () Bool)

(assert (=> b!343815 m!345863))

(assert (=> b!343815 m!345863))

(declare-fun m!345865 () Bool)

(assert (=> b!343815 m!345865))

(declare-fun m!345867 () Bool)

(assert (=> b!343816 m!345867))

(declare-fun m!345869 () Bool)

(assert (=> start!34420 m!345869))

(declare-fun m!345871 () Bool)

(assert (=> start!34420 m!345871))

(declare-fun m!345873 () Bool)

(assert (=> start!34420 m!345873))

(declare-fun m!345875 () Bool)

(assert (=> b!343814 m!345875))

(declare-fun m!345877 () Bool)

(assert (=> b!343817 m!345877))

(declare-fun m!345879 () Bool)

(assert (=> b!343819 m!345879))

(check-sat (not b!343814) (not b!343815) (not mapNonEmpty!12402) (not b!343817) tp_is_empty!7309 (not b!343816) (not start!34420) b_and!14579 (not b_next!7357) (not b!343819))
(check-sat b_and!14579 (not b_next!7357))
