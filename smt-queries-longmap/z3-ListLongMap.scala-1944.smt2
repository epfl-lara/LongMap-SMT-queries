; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34412 () Bool)

(assert start!34412)

(declare-fun b_free!7335 () Bool)

(declare-fun b_next!7335 () Bool)

(assert (=> start!34412 (= b_free!7335 (not b_next!7335))))

(declare-fun tp!25550 () Bool)

(declare-fun b_and!14543 () Bool)

(assert (=> start!34412 (= tp!25550 b_and!14543)))

(declare-fun b!343570 () Bool)

(declare-fun res!189910 () Bool)

(declare-fun e!210669 () Bool)

(assert (=> b!343570 (=> (not res!189910) (not e!210669))))

(declare-datatypes ((array!18167 0))(
  ( (array!18168 (arr!8600 (Array (_ BitVec 32) (_ BitVec 64))) (size!8952 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18167)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18167 (_ BitVec 32)) Bool)

(assert (=> b!343570 (= res!189910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343571 () Bool)

(declare-fun e!210665 () Bool)

(declare-fun tp_is_empty!7287 () Bool)

(assert (=> b!343571 (= e!210665 tp_is_empty!7287)))

(declare-fun b!343572 () Bool)

(declare-fun res!189909 () Bool)

(assert (=> b!343572 (=> (not res!189909) (not e!210669))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10693 0))(
  ( (V!10694 (val!3688 Int)) )
))
(declare-fun zeroValue!1467 () V!10693)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3300 0))(
  ( (ValueCellFull!3300 (v!5864 V!10693)) (EmptyCell!3300) )
))
(declare-datatypes ((array!18169 0))(
  ( (array!18170 (arr!8601 (Array (_ BitVec 32) ValueCell!3300)) (size!8953 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18169)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10693)

(declare-datatypes ((tuple2!5342 0))(
  ( (tuple2!5343 (_1!2682 (_ BitVec 64)) (_2!2682 V!10693)) )
))
(declare-datatypes ((List!4961 0))(
  ( (Nil!4958) (Cons!4957 (h!5813 tuple2!5342) (t!10077 List!4961)) )
))
(declare-datatypes ((ListLongMap!4255 0))(
  ( (ListLongMap!4256 (toList!2143 List!4961)) )
))
(declare-fun contains!2201 (ListLongMap!4255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1664 (array!18167 array!18169 (_ BitVec 32) (_ BitVec 32) V!10693 V!10693 (_ BitVec 32) Int) ListLongMap!4255)

(assert (=> b!343572 (= res!189909 (not (contains!2201 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343573 () Bool)

(declare-fun res!189907 () Bool)

(assert (=> b!343573 (=> (not res!189907) (not e!210669))))

(assert (=> b!343573 (= res!189907 (and (= (size!8953 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8952 _keys!1895) (size!8953 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343574 () Bool)

(assert (=> b!343574 (= e!210669 false)))

(declare-datatypes ((SeekEntryResult!3318 0))(
  ( (MissingZero!3318 (index!15451 (_ BitVec 32))) (Found!3318 (index!15452 (_ BitVec 32))) (Intermediate!3318 (undefined!4130 Bool) (index!15453 (_ BitVec 32)) (x!34192 (_ BitVec 32))) (Undefined!3318) (MissingVacant!3318 (index!15454 (_ BitVec 32))) )
))
(declare-fun lt!162577 () SeekEntryResult!3318)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18167 (_ BitVec 32)) SeekEntryResult!3318)

(assert (=> b!343574 (= lt!162577 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343575 () Bool)

(declare-fun e!210668 () Bool)

(assert (=> b!343575 (= e!210668 tp_is_empty!7287)))

(declare-fun b!343576 () Bool)

(declare-fun res!189908 () Bool)

(assert (=> b!343576 (=> (not res!189908) (not e!210669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343576 (= res!189908 (validKeyInArray!0 k0!1348))))

(declare-fun res!189911 () Bool)

(assert (=> start!34412 (=> (not res!189911) (not e!210669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34412 (= res!189911 (validMask!0 mask!2385))))

(assert (=> start!34412 e!210669))

(assert (=> start!34412 true))

(assert (=> start!34412 tp_is_empty!7287))

(assert (=> start!34412 tp!25550))

(declare-fun e!210666 () Bool)

(declare-fun array_inv!6368 (array!18169) Bool)

(assert (=> start!34412 (and (array_inv!6368 _values!1525) e!210666)))

(declare-fun array_inv!6369 (array!18167) Bool)

(assert (=> start!34412 (array_inv!6369 _keys!1895)))

(declare-fun b!343577 () Bool)

(declare-fun res!189906 () Bool)

(assert (=> b!343577 (=> (not res!189906) (not e!210669))))

(declare-datatypes ((List!4962 0))(
  ( (Nil!4959) (Cons!4958 (h!5814 (_ BitVec 64)) (t!10078 List!4962)) )
))
(declare-fun arrayNoDuplicates!0 (array!18167 (_ BitVec 32) List!4962) Bool)

(assert (=> b!343577 (= res!189906 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4959))))

(declare-fun mapIsEmpty!12369 () Bool)

(declare-fun mapRes!12369 () Bool)

(assert (=> mapIsEmpty!12369 mapRes!12369))

(declare-fun b!343578 () Bool)

(assert (=> b!343578 (= e!210666 (and e!210665 mapRes!12369))))

(declare-fun condMapEmpty!12369 () Bool)

(declare-fun mapDefault!12369 () ValueCell!3300)

(assert (=> b!343578 (= condMapEmpty!12369 (= (arr!8601 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3300)) mapDefault!12369)))))

(declare-fun mapNonEmpty!12369 () Bool)

(declare-fun tp!25551 () Bool)

(assert (=> mapNonEmpty!12369 (= mapRes!12369 (and tp!25551 e!210668))))

(declare-fun mapRest!12369 () (Array (_ BitVec 32) ValueCell!3300))

(declare-fun mapValue!12369 () ValueCell!3300)

(declare-fun mapKey!12369 () (_ BitVec 32))

(assert (=> mapNonEmpty!12369 (= (arr!8601 _values!1525) (store mapRest!12369 mapKey!12369 mapValue!12369))))

(assert (= (and start!34412 res!189911) b!343573))

(assert (= (and b!343573 res!189907) b!343570))

(assert (= (and b!343570 res!189910) b!343577))

(assert (= (and b!343577 res!189906) b!343576))

(assert (= (and b!343576 res!189908) b!343572))

(assert (= (and b!343572 res!189909) b!343574))

(assert (= (and b!343578 condMapEmpty!12369) mapIsEmpty!12369))

(assert (= (and b!343578 (not condMapEmpty!12369)) mapNonEmpty!12369))

(get-info :version)

(assert (= (and mapNonEmpty!12369 ((_ is ValueCellFull!3300) mapValue!12369)) b!343575))

(assert (= (and b!343578 ((_ is ValueCellFull!3300) mapDefault!12369)) b!343571))

(assert (= start!34412 b!343578))

(declare-fun m!345417 () Bool)

(assert (=> b!343574 m!345417))

(declare-fun m!345419 () Bool)

(assert (=> start!34412 m!345419))

(declare-fun m!345421 () Bool)

(assert (=> start!34412 m!345421))

(declare-fun m!345423 () Bool)

(assert (=> start!34412 m!345423))

(declare-fun m!345425 () Bool)

(assert (=> b!343572 m!345425))

(assert (=> b!343572 m!345425))

(declare-fun m!345427 () Bool)

(assert (=> b!343572 m!345427))

(declare-fun m!345429 () Bool)

(assert (=> mapNonEmpty!12369 m!345429))

(declare-fun m!345431 () Bool)

(assert (=> b!343576 m!345431))

(declare-fun m!345433 () Bool)

(assert (=> b!343570 m!345433))

(declare-fun m!345435 () Bool)

(assert (=> b!343577 m!345435))

(check-sat (not b_next!7335) (not b!343576) (not b!343577) (not start!34412) tp_is_empty!7287 (not b!343574) b_and!14543 (not b!343570) (not mapNonEmpty!12369) (not b!343572))
(check-sat b_and!14543 (not b_next!7335))
