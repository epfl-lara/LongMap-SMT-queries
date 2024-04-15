; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34480 () Bool)

(assert start!34480)

(declare-fun b_free!7417 () Bool)

(declare-fun b_next!7417 () Bool)

(assert (=> start!34480 (= b_free!7417 (not b_next!7417))))

(declare-fun tp!25796 () Bool)

(declare-fun b_and!14599 () Bool)

(assert (=> start!34480 (= tp!25796 b_and!14599)))

(declare-fun b!344402 () Bool)

(declare-fun res!190518 () Bool)

(declare-fun e!211107 () Bool)

(assert (=> b!344402 (=> (not res!190518) (not e!211107))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10803 0))(
  ( (V!10804 (val!3729 Int)) )
))
(declare-datatypes ((ValueCell!3341 0))(
  ( (ValueCellFull!3341 (v!5899 V!10803)) (EmptyCell!3341) )
))
(declare-datatypes ((array!18311 0))(
  ( (array!18312 (arr!8672 (Array (_ BitVec 32) ValueCell!3341)) (size!9025 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18311)

(declare-datatypes ((array!18313 0))(
  ( (array!18314 (arr!8673 (Array (_ BitVec 32) (_ BitVec 64))) (size!9026 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18313)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344402 (= res!190518 (and (= (size!9025 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9026 _keys!1895) (size!9025 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12492 () Bool)

(declare-fun mapRes!12492 () Bool)

(assert (=> mapIsEmpty!12492 mapRes!12492))

(declare-fun mapNonEmpty!12492 () Bool)

(declare-fun tp!25797 () Bool)

(declare-fun e!211108 () Bool)

(assert (=> mapNonEmpty!12492 (= mapRes!12492 (and tp!25797 e!211108))))

(declare-fun mapKey!12492 () (_ BitVec 32))

(declare-fun mapRest!12492 () (Array (_ BitVec 32) ValueCell!3341))

(declare-fun mapValue!12492 () ValueCell!3341)

(assert (=> mapNonEmpty!12492 (= (arr!8672 _values!1525) (store mapRest!12492 mapKey!12492 mapValue!12492))))

(declare-fun b!344403 () Bool)

(declare-fun res!190517 () Bool)

(assert (=> b!344403 (=> (not res!190517) (not e!211107))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344403 (= res!190517 (validKeyInArray!0 k0!1348))))

(declare-fun res!190519 () Bool)

(assert (=> start!34480 (=> (not res!190519) (not e!211107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34480 (= res!190519 (validMask!0 mask!2385))))

(assert (=> start!34480 e!211107))

(assert (=> start!34480 true))

(declare-fun tp_is_empty!7369 () Bool)

(assert (=> start!34480 tp_is_empty!7369))

(assert (=> start!34480 tp!25796))

(declare-fun e!211104 () Bool)

(declare-fun array_inv!6448 (array!18311) Bool)

(assert (=> start!34480 (and (array_inv!6448 _values!1525) e!211104)))

(declare-fun array_inv!6449 (array!18313) Bool)

(assert (=> start!34480 (array_inv!6449 _keys!1895)))

(declare-fun b!344404 () Bool)

(assert (=> b!344404 (= e!211108 tp_is_empty!7369)))

(declare-fun b!344405 () Bool)

(declare-fun res!190516 () Bool)

(assert (=> b!344405 (=> (not res!190516) (not e!211107))))

(declare-fun zeroValue!1467 () V!10803)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10803)

(declare-datatypes ((tuple2!5350 0))(
  ( (tuple2!5351 (_1!2686 (_ BitVec 64)) (_2!2686 V!10803)) )
))
(declare-datatypes ((List!4972 0))(
  ( (Nil!4969) (Cons!4968 (h!5824 tuple2!5350) (t!10079 List!4972)) )
))
(declare-datatypes ((ListLongMap!4253 0))(
  ( (ListLongMap!4254 (toList!2142 List!4972)) )
))
(declare-fun contains!2211 (ListLongMap!4253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1648 (array!18313 array!18311 (_ BitVec 32) (_ BitVec 32) V!10803 V!10803 (_ BitVec 32) Int) ListLongMap!4253)

(assert (=> b!344405 (= res!190516 (not (contains!2211 (getCurrentListMap!1648 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344406 () Bool)

(assert (=> b!344406 (= e!211107 false)))

(declare-datatypes ((SeekEntryResult!3341 0))(
  ( (MissingZero!3341 (index!15543 (_ BitVec 32))) (Found!3341 (index!15544 (_ BitVec 32))) (Intermediate!3341 (undefined!4153 Bool) (index!15545 (_ BitVec 32)) (x!34322 (_ BitVec 32))) (Undefined!3341) (MissingVacant!3341 (index!15546 (_ BitVec 32))) )
))
(declare-fun lt!162465 () SeekEntryResult!3341)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18313 (_ BitVec 32)) SeekEntryResult!3341)

(assert (=> b!344406 (= lt!162465 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344407 () Bool)

(declare-fun res!190515 () Bool)

(assert (=> b!344407 (=> (not res!190515) (not e!211107))))

(declare-datatypes ((List!4973 0))(
  ( (Nil!4970) (Cons!4969 (h!5825 (_ BitVec 64)) (t!10080 List!4973)) )
))
(declare-fun arrayNoDuplicates!0 (array!18313 (_ BitVec 32) List!4973) Bool)

(assert (=> b!344407 (= res!190515 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4970))))

(declare-fun b!344408 () Bool)

(declare-fun e!211106 () Bool)

(assert (=> b!344408 (= e!211104 (and e!211106 mapRes!12492))))

(declare-fun condMapEmpty!12492 () Bool)

(declare-fun mapDefault!12492 () ValueCell!3341)

(assert (=> b!344408 (= condMapEmpty!12492 (= (arr!8672 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3341)) mapDefault!12492)))))

(declare-fun b!344409 () Bool)

(declare-fun res!190520 () Bool)

(assert (=> b!344409 (=> (not res!190520) (not e!211107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18313 (_ BitVec 32)) Bool)

(assert (=> b!344409 (= res!190520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344410 () Bool)

(assert (=> b!344410 (= e!211106 tp_is_empty!7369)))

(assert (= (and start!34480 res!190519) b!344402))

(assert (= (and b!344402 res!190518) b!344409))

(assert (= (and b!344409 res!190520) b!344407))

(assert (= (and b!344407 res!190515) b!344403))

(assert (= (and b!344403 res!190517) b!344405))

(assert (= (and b!344405 res!190516) b!344406))

(assert (= (and b!344408 condMapEmpty!12492) mapIsEmpty!12492))

(assert (= (and b!344408 (not condMapEmpty!12492)) mapNonEmpty!12492))

(get-info :version)

(assert (= (and mapNonEmpty!12492 ((_ is ValueCellFull!3341) mapValue!12492)) b!344404))

(assert (= (and b!344408 ((_ is ValueCellFull!3341) mapDefault!12492)) b!344410))

(assert (= start!34480 b!344408))

(declare-fun m!345507 () Bool)

(assert (=> b!344409 m!345507))

(declare-fun m!345509 () Bool)

(assert (=> mapNonEmpty!12492 m!345509))

(declare-fun m!345511 () Bool)

(assert (=> b!344406 m!345511))

(declare-fun m!345513 () Bool)

(assert (=> b!344407 m!345513))

(declare-fun m!345515 () Bool)

(assert (=> b!344405 m!345515))

(assert (=> b!344405 m!345515))

(declare-fun m!345517 () Bool)

(assert (=> b!344405 m!345517))

(declare-fun m!345519 () Bool)

(assert (=> start!34480 m!345519))

(declare-fun m!345521 () Bool)

(assert (=> start!34480 m!345521))

(declare-fun m!345523 () Bool)

(assert (=> start!34480 m!345523))

(declare-fun m!345525 () Bool)

(assert (=> b!344403 m!345525))

(check-sat tp_is_empty!7369 (not mapNonEmpty!12492) (not b_next!7417) (not b!344409) (not b!344403) b_and!14599 (not b!344405) (not b!344407) (not b!344406) (not start!34480))
(check-sat b_and!14599 (not b_next!7417))
