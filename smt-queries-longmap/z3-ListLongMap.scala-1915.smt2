; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34082 () Bool)

(assert start!34082)

(declare-fun b_free!7161 () Bool)

(declare-fun b_next!7161 () Bool)

(assert (=> start!34082 (= b_free!7161 (not b_next!7161))))

(declare-fun tp!25007 () Bool)

(declare-fun b_and!14355 () Bool)

(assert (=> start!34082 (= tp!25007 b_and!14355)))

(declare-fun b!339675 () Bool)

(declare-fun res!187626 () Bool)

(declare-fun e!208395 () Bool)

(assert (=> b!339675 (=> (not res!187626) (not e!208395))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10461 0))(
  ( (V!10462 (val!3601 Int)) )
))
(declare-fun zeroValue!1467 () V!10461)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3213 0))(
  ( (ValueCellFull!3213 (v!5770 V!10461)) (EmptyCell!3213) )
))
(declare-datatypes ((array!17825 0))(
  ( (array!17826 (arr!8436 (Array (_ BitVec 32) ValueCell!3213)) (size!8788 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17825)

(declare-datatypes ((array!17827 0))(
  ( (array!17828 (arr!8437 (Array (_ BitVec 32) (_ BitVec 64))) (size!8789 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17827)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10461)

(declare-datatypes ((tuple2!5228 0))(
  ( (tuple2!5229 (_1!2625 (_ BitVec 64)) (_2!2625 V!10461)) )
))
(declare-datatypes ((List!4847 0))(
  ( (Nil!4844) (Cons!4843 (h!5699 tuple2!5228) (t!9949 List!4847)) )
))
(declare-datatypes ((ListLongMap!4141 0))(
  ( (ListLongMap!4142 (toList!2086 List!4847)) )
))
(declare-fun contains!2137 (ListLongMap!4141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1607 (array!17827 array!17825 (_ BitVec 32) (_ BitVec 32) V!10461 V!10461 (_ BitVec 32) Int) ListLongMap!4141)

(assert (=> b!339675 (= res!187626 (not (contains!2137 (getCurrentListMap!1607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339676 () Bool)

(declare-fun e!208391 () Bool)

(declare-fun tp_is_empty!7113 () Bool)

(assert (=> b!339676 (= e!208391 tp_is_empty!7113)))

(declare-fun res!187628 () Bool)

(assert (=> start!34082 (=> (not res!187628) (not e!208395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34082 (= res!187628 (validMask!0 mask!2385))))

(assert (=> start!34082 e!208395))

(assert (=> start!34082 true))

(assert (=> start!34082 tp_is_empty!7113))

(assert (=> start!34082 tp!25007))

(declare-fun e!208394 () Bool)

(declare-fun array_inv!6254 (array!17825) Bool)

(assert (=> start!34082 (and (array_inv!6254 _values!1525) e!208394)))

(declare-fun array_inv!6255 (array!17827) Bool)

(assert (=> start!34082 (array_inv!6255 _keys!1895)))

(declare-fun b!339677 () Bool)

(declare-fun res!187629 () Bool)

(assert (=> b!339677 (=> (not res!187629) (not e!208395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339677 (= res!187629 (validKeyInArray!0 k0!1348))))

(declare-fun b!339678 () Bool)

(declare-fun res!187631 () Bool)

(assert (=> b!339678 (=> (not res!187631) (not e!208395))))

(declare-datatypes ((List!4848 0))(
  ( (Nil!4845) (Cons!4844 (h!5700 (_ BitVec 64)) (t!9950 List!4848)) )
))
(declare-fun arrayNoDuplicates!0 (array!17827 (_ BitVec 32) List!4848) Bool)

(assert (=> b!339678 (= res!187631 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4845))))

(declare-fun b!339679 () Bool)

(declare-fun res!187627 () Bool)

(assert (=> b!339679 (=> (not res!187627) (not e!208395))))

(assert (=> b!339679 (= res!187627 (and (= (size!8788 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8789 _keys!1895) (size!8788 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12087 () Bool)

(declare-fun mapRes!12087 () Bool)

(assert (=> mapIsEmpty!12087 mapRes!12087))

(declare-fun b!339680 () Bool)

(declare-fun res!187630 () Bool)

(assert (=> b!339680 (=> (not res!187630) (not e!208395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17827 (_ BitVec 32)) Bool)

(assert (=> b!339680 (= res!187630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12087 () Bool)

(declare-fun tp!25008 () Bool)

(assert (=> mapNonEmpty!12087 (= mapRes!12087 (and tp!25008 e!208391))))

(declare-fun mapRest!12087 () (Array (_ BitVec 32) ValueCell!3213))

(declare-fun mapValue!12087 () ValueCell!3213)

(declare-fun mapKey!12087 () (_ BitVec 32))

(assert (=> mapNonEmpty!12087 (= (arr!8436 _values!1525) (store mapRest!12087 mapKey!12087 mapValue!12087))))

(declare-fun b!339681 () Bool)

(declare-fun e!208393 () Bool)

(assert (=> b!339681 (= e!208393 tp_is_empty!7113)))

(declare-fun b!339682 () Bool)

(assert (=> b!339682 (= e!208394 (and e!208393 mapRes!12087))))

(declare-fun condMapEmpty!12087 () Bool)

(declare-fun mapDefault!12087 () ValueCell!3213)

(assert (=> b!339682 (= condMapEmpty!12087 (= (arr!8436 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3213)) mapDefault!12087)))))

(declare-fun b!339683 () Bool)

(assert (=> b!339683 (= e!208395 false)))

(declare-datatypes ((SeekEntryResult!3258 0))(
  ( (MissingZero!3258 (index!15211 (_ BitVec 32))) (Found!3258 (index!15212 (_ BitVec 32))) (Intermediate!3258 (undefined!4070 Bool) (index!15213 (_ BitVec 32)) (x!33830 (_ BitVec 32))) (Undefined!3258) (MissingVacant!3258 (index!15214 (_ BitVec 32))) )
))
(declare-fun lt!161260 () SeekEntryResult!3258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17827 (_ BitVec 32)) SeekEntryResult!3258)

(assert (=> b!339683 (= lt!161260 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34082 res!187628) b!339679))

(assert (= (and b!339679 res!187627) b!339680))

(assert (= (and b!339680 res!187630) b!339678))

(assert (= (and b!339678 res!187631) b!339677))

(assert (= (and b!339677 res!187629) b!339675))

(assert (= (and b!339675 res!187626) b!339683))

(assert (= (and b!339682 condMapEmpty!12087) mapIsEmpty!12087))

(assert (= (and b!339682 (not condMapEmpty!12087)) mapNonEmpty!12087))

(get-info :version)

(assert (= (and mapNonEmpty!12087 ((_ is ValueCellFull!3213) mapValue!12087)) b!339676))

(assert (= (and b!339682 ((_ is ValueCellFull!3213) mapDefault!12087)) b!339681))

(assert (= start!34082 b!339682))

(declare-fun m!342589 () Bool)

(assert (=> start!34082 m!342589))

(declare-fun m!342591 () Bool)

(assert (=> start!34082 m!342591))

(declare-fun m!342593 () Bool)

(assert (=> start!34082 m!342593))

(declare-fun m!342595 () Bool)

(assert (=> b!339678 m!342595))

(declare-fun m!342597 () Bool)

(assert (=> b!339675 m!342597))

(assert (=> b!339675 m!342597))

(declare-fun m!342599 () Bool)

(assert (=> b!339675 m!342599))

(declare-fun m!342601 () Bool)

(assert (=> mapNonEmpty!12087 m!342601))

(declare-fun m!342603 () Bool)

(assert (=> b!339683 m!342603))

(declare-fun m!342605 () Bool)

(assert (=> b!339680 m!342605))

(declare-fun m!342607 () Bool)

(assert (=> b!339677 m!342607))

(check-sat (not b!339683) (not b!339680) (not start!34082) (not b_next!7161) (not b!339675) (not b!339677) (not b!339678) b_and!14355 (not mapNonEmpty!12087) tp_is_empty!7113)
(check-sat b_and!14355 (not b_next!7161))
