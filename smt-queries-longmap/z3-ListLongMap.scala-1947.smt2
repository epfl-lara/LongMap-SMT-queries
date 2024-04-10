; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34430 () Bool)

(assert start!34430)

(declare-fun b_free!7353 () Bool)

(declare-fun b_next!7353 () Bool)

(assert (=> start!34430 (= b_free!7353 (not b_next!7353))))

(declare-fun tp!25605 () Bool)

(declare-fun b_and!14561 () Bool)

(assert (=> start!34430 (= tp!25605 b_and!14561)))

(declare-fun b!343813 () Bool)

(declare-fun res!190071 () Bool)

(declare-fun e!210800 () Bool)

(assert (=> b!343813 (=> (not res!190071) (not e!210800))))

(declare-datatypes ((array!18203 0))(
  ( (array!18204 (arr!8618 (Array (_ BitVec 32) (_ BitVec 64))) (size!8970 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18203)

(declare-datatypes ((List!4973 0))(
  ( (Nil!4970) (Cons!4969 (h!5825 (_ BitVec 64)) (t!10089 List!4973)) )
))
(declare-fun arrayNoDuplicates!0 (array!18203 (_ BitVec 32) List!4973) Bool)

(assert (=> b!343813 (= res!190071 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4970))))

(declare-fun mapNonEmpty!12396 () Bool)

(declare-fun mapRes!12396 () Bool)

(declare-fun tp!25604 () Bool)

(declare-fun e!210803 () Bool)

(assert (=> mapNonEmpty!12396 (= mapRes!12396 (and tp!25604 e!210803))))

(declare-datatypes ((V!10717 0))(
  ( (V!10718 (val!3697 Int)) )
))
(declare-datatypes ((ValueCell!3309 0))(
  ( (ValueCellFull!3309 (v!5873 V!10717)) (EmptyCell!3309) )
))
(declare-fun mapValue!12396 () ValueCell!3309)

(declare-fun mapRest!12396 () (Array (_ BitVec 32) ValueCell!3309))

(declare-fun mapKey!12396 () (_ BitVec 32))

(declare-datatypes ((array!18205 0))(
  ( (array!18206 (arr!8619 (Array (_ BitVec 32) ValueCell!3309)) (size!8971 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18205)

(assert (=> mapNonEmpty!12396 (= (arr!8619 _values!1525) (store mapRest!12396 mapKey!12396 mapValue!12396))))

(declare-fun b!343814 () Bool)

(assert (=> b!343814 (= e!210800 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3327 0))(
  ( (MissingZero!3327 (index!15487 (_ BitVec 32))) (Found!3327 (index!15488 (_ BitVec 32))) (Intermediate!3327 (undefined!4139 Bool) (index!15489 (_ BitVec 32)) (x!34225 (_ BitVec 32))) (Undefined!3327) (MissingVacant!3327 (index!15490 (_ BitVec 32))) )
))
(declare-fun lt!162604 () SeekEntryResult!3327)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18203 (_ BitVec 32)) SeekEntryResult!3327)

(assert (=> b!343814 (= lt!162604 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!190069 () Bool)

(assert (=> start!34430 (=> (not res!190069) (not e!210800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34430 (= res!190069 (validMask!0 mask!2385))))

(assert (=> start!34430 e!210800))

(assert (=> start!34430 true))

(declare-fun tp_is_empty!7305 () Bool)

(assert (=> start!34430 tp_is_empty!7305))

(assert (=> start!34430 tp!25605))

(declare-fun e!210801 () Bool)

(declare-fun array_inv!6386 (array!18205) Bool)

(assert (=> start!34430 (and (array_inv!6386 _values!1525) e!210801)))

(declare-fun array_inv!6387 (array!18203) Bool)

(assert (=> start!34430 (array_inv!6387 _keys!1895)))

(declare-fun b!343815 () Bool)

(declare-fun res!190070 () Bool)

(assert (=> b!343815 (=> (not res!190070) (not e!210800))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343815 (= res!190070 (and (= (size!8971 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8970 _keys!1895) (size!8971 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343816 () Bool)

(declare-fun res!190073 () Bool)

(assert (=> b!343816 (=> (not res!190073) (not e!210800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343816 (= res!190073 (validKeyInArray!0 k0!1348))))

(declare-fun b!343817 () Bool)

(declare-fun res!190068 () Bool)

(assert (=> b!343817 (=> (not res!190068) (not e!210800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18203 (_ BitVec 32)) Bool)

(assert (=> b!343817 (= res!190068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343818 () Bool)

(declare-fun e!210802 () Bool)

(assert (=> b!343818 (= e!210802 tp_is_empty!7305)))

(declare-fun mapIsEmpty!12396 () Bool)

(assert (=> mapIsEmpty!12396 mapRes!12396))

(declare-fun b!343819 () Bool)

(assert (=> b!343819 (= e!210801 (and e!210802 mapRes!12396))))

(declare-fun condMapEmpty!12396 () Bool)

(declare-fun mapDefault!12396 () ValueCell!3309)

(assert (=> b!343819 (= condMapEmpty!12396 (= (arr!8619 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3309)) mapDefault!12396)))))

(declare-fun b!343820 () Bool)

(assert (=> b!343820 (= e!210803 tp_is_empty!7305)))

(declare-fun b!343821 () Bool)

(declare-fun res!190072 () Bool)

(assert (=> b!343821 (=> (not res!190072) (not e!210800))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10717)

(declare-fun zeroValue!1467 () V!10717)

(declare-datatypes ((tuple2!5352 0))(
  ( (tuple2!5353 (_1!2687 (_ BitVec 64)) (_2!2687 V!10717)) )
))
(declare-datatypes ((List!4974 0))(
  ( (Nil!4971) (Cons!4970 (h!5826 tuple2!5352) (t!10090 List!4974)) )
))
(declare-datatypes ((ListLongMap!4265 0))(
  ( (ListLongMap!4266 (toList!2148 List!4974)) )
))
(declare-fun contains!2206 (ListLongMap!4265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1669 (array!18203 array!18205 (_ BitVec 32) (_ BitVec 32) V!10717 V!10717 (_ BitVec 32) Int) ListLongMap!4265)

(assert (=> b!343821 (= res!190072 (not (contains!2206 (getCurrentListMap!1669 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34430 res!190069) b!343815))

(assert (= (and b!343815 res!190070) b!343817))

(assert (= (and b!343817 res!190068) b!343813))

(assert (= (and b!343813 res!190071) b!343816))

(assert (= (and b!343816 res!190073) b!343821))

(assert (= (and b!343821 res!190072) b!343814))

(assert (= (and b!343819 condMapEmpty!12396) mapIsEmpty!12396))

(assert (= (and b!343819 (not condMapEmpty!12396)) mapNonEmpty!12396))

(get-info :version)

(assert (= (and mapNonEmpty!12396 ((_ is ValueCellFull!3309) mapValue!12396)) b!343820))

(assert (= (and b!343819 ((_ is ValueCellFull!3309) mapDefault!12396)) b!343818))

(assert (= start!34430 b!343819))

(declare-fun m!345597 () Bool)

(assert (=> b!343817 m!345597))

(declare-fun m!345599 () Bool)

(assert (=> b!343814 m!345599))

(declare-fun m!345601 () Bool)

(assert (=> mapNonEmpty!12396 m!345601))

(declare-fun m!345603 () Bool)

(assert (=> b!343821 m!345603))

(assert (=> b!343821 m!345603))

(declare-fun m!345605 () Bool)

(assert (=> b!343821 m!345605))

(declare-fun m!345607 () Bool)

(assert (=> start!34430 m!345607))

(declare-fun m!345609 () Bool)

(assert (=> start!34430 m!345609))

(declare-fun m!345611 () Bool)

(assert (=> start!34430 m!345611))

(declare-fun m!345613 () Bool)

(assert (=> b!343816 m!345613))

(declare-fun m!345615 () Bool)

(assert (=> b!343813 m!345615))

(check-sat b_and!14561 (not mapNonEmpty!12396) (not b!343814) (not b!343821) (not b!343813) (not b!343817) (not b_next!7353) tp_is_empty!7305 (not b!343816) (not start!34430))
(check-sat b_and!14561 (not b_next!7353))
