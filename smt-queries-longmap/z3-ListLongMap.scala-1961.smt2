; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34498 () Bool)

(assert start!34498)

(declare-fun b_free!7435 () Bool)

(declare-fun b_next!7435 () Bool)

(assert (=> start!34498 (= b_free!7435 (not b_next!7435))))

(declare-fun tp!25851 () Bool)

(declare-fun b_and!14617 () Bool)

(assert (=> start!34498 (= tp!25851 b_and!14617)))

(declare-fun mapNonEmpty!12519 () Bool)

(declare-fun mapRes!12519 () Bool)

(declare-fun tp!25850 () Bool)

(declare-fun e!211239 () Bool)

(assert (=> mapNonEmpty!12519 (= mapRes!12519 (and tp!25850 e!211239))))

(declare-datatypes ((V!10827 0))(
  ( (V!10828 (val!3738 Int)) )
))
(declare-datatypes ((ValueCell!3350 0))(
  ( (ValueCellFull!3350 (v!5908 V!10827)) (EmptyCell!3350) )
))
(declare-fun mapRest!12519 () (Array (_ BitVec 32) ValueCell!3350))

(declare-datatypes ((array!18345 0))(
  ( (array!18346 (arr!8689 (Array (_ BitVec 32) ValueCell!3350)) (size!9042 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18345)

(declare-fun mapKey!12519 () (_ BitVec 32))

(declare-fun mapValue!12519 () ValueCell!3350)

(assert (=> mapNonEmpty!12519 (= (arr!8689 _values!1525) (store mapRest!12519 mapKey!12519 mapValue!12519))))

(declare-fun b!344645 () Bool)

(declare-fun res!190682 () Bool)

(declare-fun e!211242 () Bool)

(assert (=> b!344645 (=> (not res!190682) (not e!211242))))

(declare-datatypes ((array!18347 0))(
  ( (array!18348 (arr!8690 (Array (_ BitVec 32) (_ BitVec 64))) (size!9043 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18347)

(declare-datatypes ((List!4984 0))(
  ( (Nil!4981) (Cons!4980 (h!5836 (_ BitVec 64)) (t!10091 List!4984)) )
))
(declare-fun arrayNoDuplicates!0 (array!18347 (_ BitVec 32) List!4984) Bool)

(assert (=> b!344645 (= res!190682 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4981))))

(declare-fun b!344646 () Bool)

(declare-fun tp_is_empty!7387 () Bool)

(assert (=> b!344646 (= e!211239 tp_is_empty!7387)))

(declare-fun b!344647 () Bool)

(declare-fun e!211243 () Bool)

(declare-fun e!211241 () Bool)

(assert (=> b!344647 (= e!211243 (and e!211241 mapRes!12519))))

(declare-fun condMapEmpty!12519 () Bool)

(declare-fun mapDefault!12519 () ValueCell!3350)

(assert (=> b!344647 (= condMapEmpty!12519 (= (arr!8689 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3350)) mapDefault!12519)))))

(declare-fun res!190681 () Bool)

(assert (=> start!34498 (=> (not res!190681) (not e!211242))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34498 (= res!190681 (validMask!0 mask!2385))))

(assert (=> start!34498 e!211242))

(assert (=> start!34498 true))

(assert (=> start!34498 tp_is_empty!7387))

(assert (=> start!34498 tp!25851))

(declare-fun array_inv!6460 (array!18345) Bool)

(assert (=> start!34498 (and (array_inv!6460 _values!1525) e!211243)))

(declare-fun array_inv!6461 (array!18347) Bool)

(assert (=> start!34498 (array_inv!6461 _keys!1895)))

(declare-fun mapIsEmpty!12519 () Bool)

(assert (=> mapIsEmpty!12519 mapRes!12519))

(declare-fun b!344648 () Bool)

(declare-fun res!190677 () Bool)

(assert (=> b!344648 (=> (not res!190677) (not e!211242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18347 (_ BitVec 32)) Bool)

(assert (=> b!344648 (= res!190677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344649 () Bool)

(declare-fun res!190679 () Bool)

(assert (=> b!344649 (=> (not res!190679) (not e!211242))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344649 (= res!190679 (and (= (size!9042 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9043 _keys!1895) (size!9042 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344650 () Bool)

(assert (=> b!344650 (= e!211241 tp_is_empty!7387)))

(declare-fun b!344651 () Bool)

(declare-fun res!190678 () Bool)

(assert (=> b!344651 (=> (not res!190678) (not e!211242))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344651 (= res!190678 (validKeyInArray!0 k0!1348))))

(declare-fun b!344652 () Bool)

(assert (=> b!344652 (= e!211242 false)))

(declare-datatypes ((SeekEntryResult!3345 0))(
  ( (MissingZero!3345 (index!15559 (_ BitVec 32))) (Found!3345 (index!15560 (_ BitVec 32))) (Intermediate!3345 (undefined!4157 Bool) (index!15561 (_ BitVec 32)) (x!34350 (_ BitVec 32))) (Undefined!3345) (MissingVacant!3345 (index!15562 (_ BitVec 32))) )
))
(declare-fun lt!162492 () SeekEntryResult!3345)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18347 (_ BitVec 32)) SeekEntryResult!3345)

(assert (=> b!344652 (= lt!162492 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344653 () Bool)

(declare-fun res!190680 () Bool)

(assert (=> b!344653 (=> (not res!190680) (not e!211242))))

(declare-fun zeroValue!1467 () V!10827)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10827)

(declare-datatypes ((tuple2!5366 0))(
  ( (tuple2!5367 (_1!2694 (_ BitVec 64)) (_2!2694 V!10827)) )
))
(declare-datatypes ((List!4985 0))(
  ( (Nil!4982) (Cons!4981 (h!5837 tuple2!5366) (t!10092 List!4985)) )
))
(declare-datatypes ((ListLongMap!4269 0))(
  ( (ListLongMap!4270 (toList!2150 List!4985)) )
))
(declare-fun contains!2219 (ListLongMap!4269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1656 (array!18347 array!18345 (_ BitVec 32) (_ BitVec 32) V!10827 V!10827 (_ BitVec 32) Int) ListLongMap!4269)

(assert (=> b!344653 (= res!190680 (not (contains!2219 (getCurrentListMap!1656 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34498 res!190681) b!344649))

(assert (= (and b!344649 res!190679) b!344648))

(assert (= (and b!344648 res!190677) b!344645))

(assert (= (and b!344645 res!190682) b!344651))

(assert (= (and b!344651 res!190678) b!344653))

(assert (= (and b!344653 res!190680) b!344652))

(assert (= (and b!344647 condMapEmpty!12519) mapIsEmpty!12519))

(assert (= (and b!344647 (not condMapEmpty!12519)) mapNonEmpty!12519))

(get-info :version)

(assert (= (and mapNonEmpty!12519 ((_ is ValueCellFull!3350) mapValue!12519)) b!344646))

(assert (= (and b!344647 ((_ is ValueCellFull!3350) mapDefault!12519)) b!344650))

(assert (= start!34498 b!344647))

(declare-fun m!345687 () Bool)

(assert (=> b!344651 m!345687))

(declare-fun m!345689 () Bool)

(assert (=> b!344652 m!345689))

(declare-fun m!345691 () Bool)

(assert (=> b!344648 m!345691))

(declare-fun m!345693 () Bool)

(assert (=> b!344653 m!345693))

(assert (=> b!344653 m!345693))

(declare-fun m!345695 () Bool)

(assert (=> b!344653 m!345695))

(declare-fun m!345697 () Bool)

(assert (=> b!344645 m!345697))

(declare-fun m!345699 () Bool)

(assert (=> start!34498 m!345699))

(declare-fun m!345701 () Bool)

(assert (=> start!34498 m!345701))

(declare-fun m!345703 () Bool)

(assert (=> start!34498 m!345703))

(declare-fun m!345705 () Bool)

(assert (=> mapNonEmpty!12519 m!345705))

(check-sat (not start!34498) (not b!344653) (not b!344648) tp_is_empty!7387 (not b!344651) (not mapNonEmpty!12519) b_and!14617 (not b!344652) (not b!344645) (not b_next!7435))
(check-sat b_and!14617 (not b_next!7435))
