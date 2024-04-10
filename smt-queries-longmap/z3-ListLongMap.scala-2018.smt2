; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35186 () Bool)

(assert start!35186)

(declare-fun b_free!7779 () Bool)

(declare-fun b_next!7779 () Bool)

(assert (=> start!35186 (= b_free!7779 (not b_next!7779))))

(declare-fun tp!26928 () Bool)

(declare-fun b_and!15017 () Bool)

(assert (=> start!35186 (= tp!26928 b_and!15017)))

(declare-fun b!352726 () Bool)

(declare-fun e!215994 () Bool)

(declare-fun tp_is_empty!7731 () Bool)

(assert (=> b!352726 (= e!215994 tp_is_empty!7731)))

(declare-fun b!352727 () Bool)

(declare-fun e!215997 () Bool)

(declare-fun mapRes!13080 () Bool)

(assert (=> b!352727 (= e!215997 (and e!215994 mapRes!13080))))

(declare-fun condMapEmpty!13080 () Bool)

(declare-datatypes ((V!11285 0))(
  ( (V!11286 (val!3910 Int)) )
))
(declare-datatypes ((ValueCell!3522 0))(
  ( (ValueCellFull!3522 (v!6101 V!11285)) (EmptyCell!3522) )
))
(declare-datatypes ((array!19053 0))(
  ( (array!19054 (arr!9028 (Array (_ BitVec 32) ValueCell!3522)) (size!9380 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19053)

(declare-fun mapDefault!13080 () ValueCell!3522)

(assert (=> b!352727 (= condMapEmpty!13080 (= (arr!9028 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3522)) mapDefault!13080)))))

(declare-fun b!352728 () Bool)

(declare-fun res!195590 () Bool)

(declare-fun e!215996 () Bool)

(assert (=> b!352728 (=> (not res!195590) (not e!215996))))

(declare-datatypes ((array!19055 0))(
  ( (array!19056 (arr!9029 (Array (_ BitVec 32) (_ BitVec 64))) (size!9381 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19055)

(declare-datatypes ((List!5255 0))(
  ( (Nil!5252) (Cons!5251 (h!6107 (_ BitVec 64)) (t!10401 List!5255)) )
))
(declare-fun arrayNoDuplicates!0 (array!19055 (_ BitVec 32) List!5255) Bool)

(assert (=> b!352728 (= res!195590 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5252))))

(declare-fun mapIsEmpty!13080 () Bool)

(assert (=> mapIsEmpty!13080 mapRes!13080))

(declare-fun b!352730 () Bool)

(assert (=> b!352730 (= e!215996 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3473 0))(
  ( (MissingZero!3473 (index!16071 (_ BitVec 32))) (Found!3473 (index!16072 (_ BitVec 32))) (Intermediate!3473 (undefined!4285 Bool) (index!16073 (_ BitVec 32)) (x!35089 (_ BitVec 32))) (Undefined!3473) (MissingVacant!3473 (index!16074 (_ BitVec 32))) )
))
(declare-fun lt!165334 () SeekEntryResult!3473)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19055 (_ BitVec 32)) SeekEntryResult!3473)

(assert (=> b!352730 (= lt!165334 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352731 () Bool)

(declare-fun res!195593 () Bool)

(assert (=> b!352731 (=> (not res!195593) (not e!215996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352731 (= res!195593 (validKeyInArray!0 k0!1348))))

(declare-fun b!352729 () Bool)

(declare-fun res!195592 () Bool)

(assert (=> b!352729 (=> (not res!195592) (not e!215996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19055 (_ BitVec 32)) Bool)

(assert (=> b!352729 (= res!195592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!195591 () Bool)

(assert (=> start!35186 (=> (not res!195591) (not e!215996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35186 (= res!195591 (validMask!0 mask!2385))))

(assert (=> start!35186 e!215996))

(assert (=> start!35186 true))

(assert (=> start!35186 tp_is_empty!7731))

(assert (=> start!35186 tp!26928))

(declare-fun array_inv!6654 (array!19053) Bool)

(assert (=> start!35186 (and (array_inv!6654 _values!1525) e!215997)))

(declare-fun array_inv!6655 (array!19055) Bool)

(assert (=> start!35186 (array_inv!6655 _keys!1895)))

(declare-fun b!352732 () Bool)

(declare-fun e!215993 () Bool)

(assert (=> b!352732 (= e!215993 tp_is_empty!7731)))

(declare-fun b!352733 () Bool)

(declare-fun res!195588 () Bool)

(assert (=> b!352733 (=> (not res!195588) (not e!215996))))

(declare-fun zeroValue!1467 () V!11285)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11285)

(declare-datatypes ((tuple2!5636 0))(
  ( (tuple2!5637 (_1!2829 (_ BitVec 64)) (_2!2829 V!11285)) )
))
(declare-datatypes ((List!5256 0))(
  ( (Nil!5253) (Cons!5252 (h!6108 tuple2!5636) (t!10402 List!5256)) )
))
(declare-datatypes ((ListLongMap!4549 0))(
  ( (ListLongMap!4550 (toList!2290 List!5256)) )
))
(declare-fun contains!2363 (ListLongMap!4549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1811 (array!19055 array!19053 (_ BitVec 32) (_ BitVec 32) V!11285 V!11285 (_ BitVec 32) Int) ListLongMap!4549)

(assert (=> b!352733 (= res!195588 (not (contains!2363 (getCurrentListMap!1811 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13080 () Bool)

(declare-fun tp!26927 () Bool)

(assert (=> mapNonEmpty!13080 (= mapRes!13080 (and tp!26927 e!215993))))

(declare-fun mapValue!13080 () ValueCell!3522)

(declare-fun mapKey!13080 () (_ BitVec 32))

(declare-fun mapRest!13080 () (Array (_ BitVec 32) ValueCell!3522))

(assert (=> mapNonEmpty!13080 (= (arr!9028 _values!1525) (store mapRest!13080 mapKey!13080 mapValue!13080))))

(declare-fun b!352734 () Bool)

(declare-fun res!195589 () Bool)

(assert (=> b!352734 (=> (not res!195589) (not e!215996))))

(assert (=> b!352734 (= res!195589 (and (= (size!9380 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9381 _keys!1895) (size!9380 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!35186 res!195591) b!352734))

(assert (= (and b!352734 res!195589) b!352729))

(assert (= (and b!352729 res!195592) b!352728))

(assert (= (and b!352728 res!195590) b!352731))

(assert (= (and b!352731 res!195593) b!352733))

(assert (= (and b!352733 res!195588) b!352730))

(assert (= (and b!352727 condMapEmpty!13080) mapIsEmpty!13080))

(assert (= (and b!352727 (not condMapEmpty!13080)) mapNonEmpty!13080))

(get-info :version)

(assert (= (and mapNonEmpty!13080 ((_ is ValueCellFull!3522) mapValue!13080)) b!352732))

(assert (= (and b!352727 ((_ is ValueCellFull!3522) mapDefault!13080)) b!352726))

(assert (= start!35186 b!352727))

(declare-fun m!352287 () Bool)

(assert (=> b!352731 m!352287))

(declare-fun m!352289 () Bool)

(assert (=> start!35186 m!352289))

(declare-fun m!352291 () Bool)

(assert (=> start!35186 m!352291))

(declare-fun m!352293 () Bool)

(assert (=> start!35186 m!352293))

(declare-fun m!352295 () Bool)

(assert (=> b!352733 m!352295))

(assert (=> b!352733 m!352295))

(declare-fun m!352297 () Bool)

(assert (=> b!352733 m!352297))

(declare-fun m!352299 () Bool)

(assert (=> mapNonEmpty!13080 m!352299))

(declare-fun m!352301 () Bool)

(assert (=> b!352729 m!352301))

(declare-fun m!352303 () Bool)

(assert (=> b!352730 m!352303))

(declare-fun m!352305 () Bool)

(assert (=> b!352728 m!352305))

(check-sat (not b!352733) tp_is_empty!7731 (not b!352729) b_and!15017 (not start!35186) (not mapNonEmpty!13080) (not b!352730) (not b!352731) (not b_next!7779) (not b!352728))
(check-sat b_and!15017 (not b_next!7779))
