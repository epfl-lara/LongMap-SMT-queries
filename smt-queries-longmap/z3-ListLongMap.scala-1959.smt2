; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34486 () Bool)

(assert start!34486)

(declare-fun b_free!7423 () Bool)

(declare-fun b_next!7423 () Bool)

(assert (=> start!34486 (= b_free!7423 (not b_next!7423))))

(declare-fun tp!25815 () Bool)

(declare-fun b_and!14605 () Bool)

(assert (=> start!34486 (= tp!25815 b_and!14605)))

(declare-fun mapIsEmpty!12501 () Bool)

(declare-fun mapRes!12501 () Bool)

(assert (=> mapIsEmpty!12501 mapRes!12501))

(declare-fun mapNonEmpty!12501 () Bool)

(declare-fun tp!25814 () Bool)

(declare-fun e!211153 () Bool)

(assert (=> mapNonEmpty!12501 (= mapRes!12501 (and tp!25814 e!211153))))

(declare-datatypes ((V!10811 0))(
  ( (V!10812 (val!3732 Int)) )
))
(declare-datatypes ((ValueCell!3344 0))(
  ( (ValueCellFull!3344 (v!5902 V!10811)) (EmptyCell!3344) )
))
(declare-fun mapValue!12501 () ValueCell!3344)

(declare-fun mapKey!12501 () (_ BitVec 32))

(declare-datatypes ((array!18323 0))(
  ( (array!18324 (arr!8678 (Array (_ BitVec 32) ValueCell!3344)) (size!9031 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18323)

(declare-fun mapRest!12501 () (Array (_ BitVec 32) ValueCell!3344))

(assert (=> mapNonEmpty!12501 (= (arr!8678 _values!1525) (store mapRest!12501 mapKey!12501 mapValue!12501))))

(declare-fun res!190570 () Bool)

(declare-fun e!211152 () Bool)

(assert (=> start!34486 (=> (not res!190570) (not e!211152))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34486 (= res!190570 (validMask!0 mask!2385))))

(assert (=> start!34486 e!211152))

(assert (=> start!34486 true))

(declare-fun tp_is_empty!7375 () Bool)

(assert (=> start!34486 tp_is_empty!7375))

(assert (=> start!34486 tp!25815))

(declare-fun e!211150 () Bool)

(declare-fun array_inv!6452 (array!18323) Bool)

(assert (=> start!34486 (and (array_inv!6452 _values!1525) e!211150)))

(declare-datatypes ((array!18325 0))(
  ( (array!18326 (arr!8679 (Array (_ BitVec 32) (_ BitVec 64))) (size!9032 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18325)

(declare-fun array_inv!6453 (array!18325) Bool)

(assert (=> start!34486 (array_inv!6453 _keys!1895)))

(declare-fun b!344483 () Bool)

(declare-fun res!190572 () Bool)

(assert (=> b!344483 (=> (not res!190572) (not e!211152))))

(declare-datatypes ((List!4977 0))(
  ( (Nil!4974) (Cons!4973 (h!5829 (_ BitVec 64)) (t!10084 List!4977)) )
))
(declare-fun arrayNoDuplicates!0 (array!18325 (_ BitVec 32) List!4977) Bool)

(assert (=> b!344483 (= res!190572 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4974))))

(declare-fun b!344484 () Bool)

(declare-fun res!190569 () Bool)

(assert (=> b!344484 (=> (not res!190569) (not e!211152))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344484 (= res!190569 (and (= (size!9031 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9032 _keys!1895) (size!9031 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344485 () Bool)

(declare-fun res!190574 () Bool)

(assert (=> b!344485 (=> (not res!190574) (not e!211152))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344485 (= res!190574 (validKeyInArray!0 k0!1348))))

(declare-fun b!344486 () Bool)

(assert (=> b!344486 (= e!211153 tp_is_empty!7375)))

(declare-fun b!344487 () Bool)

(assert (=> b!344487 (= e!211152 false)))

(declare-datatypes ((SeekEntryResult!3342 0))(
  ( (MissingZero!3342 (index!15547 (_ BitVec 32))) (Found!3342 (index!15548 (_ BitVec 32))) (Intermediate!3342 (undefined!4154 Bool) (index!15549 (_ BitVec 32)) (x!34331 (_ BitVec 32))) (Undefined!3342) (MissingVacant!3342 (index!15550 (_ BitVec 32))) )
))
(declare-fun lt!162474 () SeekEntryResult!3342)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18325 (_ BitVec 32)) SeekEntryResult!3342)

(assert (=> b!344487 (= lt!162474 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344488 () Bool)

(declare-fun e!211151 () Bool)

(assert (=> b!344488 (= e!211151 tp_is_empty!7375)))

(declare-fun b!344489 () Bool)

(declare-fun res!190571 () Bool)

(assert (=> b!344489 (=> (not res!190571) (not e!211152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18325 (_ BitVec 32)) Bool)

(assert (=> b!344489 (= res!190571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344490 () Bool)

(declare-fun res!190573 () Bool)

(assert (=> b!344490 (=> (not res!190573) (not e!211152))))

(declare-fun zeroValue!1467 () V!10811)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10811)

(declare-datatypes ((tuple2!5356 0))(
  ( (tuple2!5357 (_1!2689 (_ BitVec 64)) (_2!2689 V!10811)) )
))
(declare-datatypes ((List!4978 0))(
  ( (Nil!4975) (Cons!4974 (h!5830 tuple2!5356) (t!10085 List!4978)) )
))
(declare-datatypes ((ListLongMap!4259 0))(
  ( (ListLongMap!4260 (toList!2145 List!4978)) )
))
(declare-fun contains!2214 (ListLongMap!4259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1651 (array!18325 array!18323 (_ BitVec 32) (_ BitVec 32) V!10811 V!10811 (_ BitVec 32) Int) ListLongMap!4259)

(assert (=> b!344490 (= res!190573 (not (contains!2214 (getCurrentListMap!1651 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344491 () Bool)

(assert (=> b!344491 (= e!211150 (and e!211151 mapRes!12501))))

(declare-fun condMapEmpty!12501 () Bool)

(declare-fun mapDefault!12501 () ValueCell!3344)

(assert (=> b!344491 (= condMapEmpty!12501 (= (arr!8678 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3344)) mapDefault!12501)))))

(assert (= (and start!34486 res!190570) b!344484))

(assert (= (and b!344484 res!190569) b!344489))

(assert (= (and b!344489 res!190571) b!344483))

(assert (= (and b!344483 res!190572) b!344485))

(assert (= (and b!344485 res!190574) b!344490))

(assert (= (and b!344490 res!190573) b!344487))

(assert (= (and b!344491 condMapEmpty!12501) mapIsEmpty!12501))

(assert (= (and b!344491 (not condMapEmpty!12501)) mapNonEmpty!12501))

(get-info :version)

(assert (= (and mapNonEmpty!12501 ((_ is ValueCellFull!3344) mapValue!12501)) b!344486))

(assert (= (and b!344491 ((_ is ValueCellFull!3344) mapDefault!12501)) b!344488))

(assert (= start!34486 b!344491))

(declare-fun m!345567 () Bool)

(assert (=> mapNonEmpty!12501 m!345567))

(declare-fun m!345569 () Bool)

(assert (=> b!344485 m!345569))

(declare-fun m!345571 () Bool)

(assert (=> b!344489 m!345571))

(declare-fun m!345573 () Bool)

(assert (=> b!344483 m!345573))

(declare-fun m!345575 () Bool)

(assert (=> b!344487 m!345575))

(declare-fun m!345577 () Bool)

(assert (=> start!34486 m!345577))

(declare-fun m!345579 () Bool)

(assert (=> start!34486 m!345579))

(declare-fun m!345581 () Bool)

(assert (=> start!34486 m!345581))

(declare-fun m!345583 () Bool)

(assert (=> b!344490 m!345583))

(assert (=> b!344490 m!345583))

(declare-fun m!345585 () Bool)

(assert (=> b!344490 m!345585))

(check-sat (not b_next!7423) (not b!344483) b_and!14605 (not b!344487) (not b!344489) (not start!34486) tp_is_empty!7375 (not b!344490) (not b!344485) (not mapNonEmpty!12501))
(check-sat b_and!14605 (not b_next!7423))
