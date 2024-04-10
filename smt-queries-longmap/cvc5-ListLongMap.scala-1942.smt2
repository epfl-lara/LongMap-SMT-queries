; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34346 () Bool)

(assert start!34346)

(declare-fun b_free!7321 () Bool)

(declare-fun b_next!7321 () Bool)

(assert (=> start!34346 (= b_free!7321 (not b_next!7321))))

(declare-fun tp!25503 () Bool)

(declare-fun b_and!14525 () Bool)

(assert (=> start!34346 (= tp!25503 b_and!14525)))

(declare-fun b!343023 () Bool)

(declare-fun e!210334 () Bool)

(declare-datatypes ((array!18135 0))(
  ( (array!18136 (arr!8586 (Array (_ BitVec 32) (_ BitVec 64))) (size!8938 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18135)

(declare-datatypes ((SeekEntryResult!3312 0))(
  ( (MissingZero!3312 (index!15427 (_ BitVec 32))) (Found!3312 (index!15428 (_ BitVec 32))) (Intermediate!3312 (undefined!4124 Bool) (index!15429 (_ BitVec 32)) (x!34150 (_ BitVec 32))) (Undefined!3312) (MissingVacant!3312 (index!15430 (_ BitVec 32))) )
))
(declare-fun lt!162307 () SeekEntryResult!3312)

(assert (=> b!343023 (= e!210334 (and (= (select (arr!8586 _keys!1895) (index!15430 lt!162307)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8938 _keys!1895))))))

(declare-fun b!343024 () Bool)

(declare-fun res!189637 () Bool)

(declare-fun e!210339 () Bool)

(assert (=> b!343024 (=> (not res!189637) (not e!210339))))

(declare-datatypes ((List!4951 0))(
  ( (Nil!4948) (Cons!4947 (h!5803 (_ BitVec 64)) (t!10063 List!4951)) )
))
(declare-fun arrayNoDuplicates!0 (array!18135 (_ BitVec 32) List!4951) Bool)

(assert (=> b!343024 (= res!189637 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4948))))

(declare-fun mapIsEmpty!12342 () Bool)

(declare-fun mapRes!12342 () Bool)

(assert (=> mapIsEmpty!12342 mapRes!12342))

(declare-fun b!343025 () Bool)

(declare-fun res!189633 () Bool)

(assert (=> b!343025 (=> (not res!189633) (not e!210339))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10675 0))(
  ( (V!10676 (val!3681 Int)) )
))
(declare-fun zeroValue!1467 () V!10675)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3293 0))(
  ( (ValueCellFull!3293 (v!5855 V!10675)) (EmptyCell!3293) )
))
(declare-datatypes ((array!18137 0))(
  ( (array!18138 (arr!8587 (Array (_ BitVec 32) ValueCell!3293)) (size!8939 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18137)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10675)

(declare-datatypes ((tuple2!5332 0))(
  ( (tuple2!5333 (_1!2677 (_ BitVec 64)) (_2!2677 V!10675)) )
))
(declare-datatypes ((List!4952 0))(
  ( (Nil!4949) (Cons!4948 (h!5804 tuple2!5332) (t!10064 List!4952)) )
))
(declare-datatypes ((ListLongMap!4245 0))(
  ( (ListLongMap!4246 (toList!2138 List!4952)) )
))
(declare-fun contains!2194 (ListLongMap!4245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1659 (array!18135 array!18137 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 32) Int) ListLongMap!4245)

(assert (=> b!343025 (= res!189633 (not (contains!2194 (getCurrentListMap!1659 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!343026 () Bool)

(declare-fun res!189638 () Bool)

(assert (=> b!343026 (=> (not res!189638) (not e!210339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18135 (_ BitVec 32)) Bool)

(assert (=> b!343026 (= res!189638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343027 () Bool)

(declare-fun e!210337 () Bool)

(declare-fun tp_is_empty!7273 () Bool)

(assert (=> b!343027 (= e!210337 tp_is_empty!7273)))

(declare-fun mapNonEmpty!12342 () Bool)

(declare-fun tp!25502 () Bool)

(assert (=> mapNonEmpty!12342 (= mapRes!12342 (and tp!25502 e!210337))))

(declare-fun mapKey!12342 () (_ BitVec 32))

(declare-fun mapValue!12342 () ValueCell!3293)

(declare-fun mapRest!12342 () (Array (_ BitVec 32) ValueCell!3293))

(assert (=> mapNonEmpty!12342 (= (arr!8587 _values!1525) (store mapRest!12342 mapKey!12342 mapValue!12342))))

(declare-fun b!343028 () Bool)

(declare-fun res!189634 () Bool)

(assert (=> b!343028 (=> (not res!189634) (not e!210339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343028 (= res!189634 (validKeyInArray!0 k!1348))))

(declare-fun b!343029 () Bool)

(declare-fun e!210333 () Bool)

(assert (=> b!343029 (= e!210333 tp_is_empty!7273)))

(declare-fun b!343030 () Bool)

(declare-fun res!189631 () Bool)

(assert (=> b!343030 (=> (not res!189631) (not e!210339))))

(assert (=> b!343030 (= res!189631 (and (= (size!8939 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8938 _keys!1895) (size!8939 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189635 () Bool)

(assert (=> start!34346 (=> (not res!189635) (not e!210339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34346 (= res!189635 (validMask!0 mask!2385))))

(assert (=> start!34346 e!210339))

(assert (=> start!34346 true))

(assert (=> start!34346 tp_is_empty!7273))

(assert (=> start!34346 tp!25503))

(declare-fun e!210338 () Bool)

(declare-fun array_inv!6358 (array!18137) Bool)

(assert (=> start!34346 (and (array_inv!6358 _values!1525) e!210338)))

(declare-fun array_inv!6359 (array!18135) Bool)

(assert (=> start!34346 (array_inv!6359 _keys!1895)))

(declare-fun b!343031 () Bool)

(declare-datatypes ((Unit!10704 0))(
  ( (Unit!10705) )
))
(declare-fun e!210332 () Unit!10704)

(declare-fun Unit!10706 () Unit!10704)

(assert (=> b!343031 (= e!210332 Unit!10706)))

(declare-fun lt!162305 () Unit!10704)

(declare-fun lemmaArrayContainsKeyThenInListMap!310 (array!18135 array!18137 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 64) (_ BitVec 32) Int) Unit!10704)

(declare-fun arrayScanForKey!0 (array!18135 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343031 (= lt!162305 (lemmaArrayContainsKeyThenInListMap!310 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343031 false))

(declare-fun b!343032 () Bool)

(declare-fun res!189636 () Bool)

(assert (=> b!343032 (=> (not res!189636) (not e!210334))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343032 (= res!189636 (inRange!0 (index!15430 lt!162307) mask!2385))))

(declare-fun b!343033 () Bool)

(assert (=> b!343033 (= e!210338 (and e!210333 mapRes!12342))))

(declare-fun condMapEmpty!12342 () Bool)

(declare-fun mapDefault!12342 () ValueCell!3293)

