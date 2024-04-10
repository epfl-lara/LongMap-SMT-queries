; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34222 () Bool)

(assert start!34222)

(declare-fun b_free!7245 () Bool)

(declare-fun b_next!7245 () Bool)

(assert (=> start!34222 (= b_free!7245 (not b_next!7245))))

(declare-fun tp!25269 () Bool)

(declare-fun b_and!14445 () Bool)

(assert (=> start!34222 (= tp!25269 b_and!14445)))

(declare-fun b!341386 () Bool)

(declare-fun res!188713 () Bool)

(declare-fun e!209365 () Bool)

(assert (=> b!341386 (=> (not res!188713) (not e!209365))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10573 0))(
  ( (V!10574 (val!3643 Int)) )
))
(declare-fun zeroValue!1467 () V!10573)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3255 0))(
  ( (ValueCellFull!3255 (v!5815 V!10573)) (EmptyCell!3255) )
))
(declare-datatypes ((array!17989 0))(
  ( (array!17990 (arr!8515 (Array (_ BitVec 32) ValueCell!3255)) (size!8867 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17989)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10573)

(declare-datatypes ((array!17991 0))(
  ( (array!17992 (arr!8516 (Array (_ BitVec 32) (_ BitVec 64))) (size!8868 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17991)

(declare-datatypes ((tuple2!5282 0))(
  ( (tuple2!5283 (_1!2652 (_ BitVec 64)) (_2!2652 V!10573)) )
))
(declare-datatypes ((List!4899 0))(
  ( (Nil!4896) (Cons!4895 (h!5751 tuple2!5282) (t!10007 List!4899)) )
))
(declare-datatypes ((ListLongMap!4195 0))(
  ( (ListLongMap!4196 (toList!2113 List!4899)) )
))
(declare-fun contains!2167 (ListLongMap!4195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1634 (array!17991 array!17989 (_ BitVec 32) (_ BitVec 32) V!10573 V!10573 (_ BitVec 32) Int) ListLongMap!4195)

(assert (=> b!341386 (= res!188713 (not (contains!2167 (getCurrentListMap!1634 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341387 () Bool)

(declare-fun e!209370 () Bool)

(declare-fun tp_is_empty!7197 () Bool)

(assert (=> b!341387 (= e!209370 tp_is_empty!7197)))

(declare-fun b!341388 () Bool)

(declare-fun res!188716 () Bool)

(assert (=> b!341388 (=> (not res!188716) (not e!209365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17991 (_ BitVec 32)) Bool)

(assert (=> b!341388 (= res!188716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341389 () Bool)

(declare-fun e!209367 () Bool)

(assert (=> b!341389 (= e!209367 false)))

(declare-fun lt!161761 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17991 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341389 (= lt!161761 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12222 () Bool)

(declare-fun mapRes!12222 () Bool)

(declare-fun tp!25268 () Bool)

(assert (=> mapNonEmpty!12222 (= mapRes!12222 (and tp!25268 e!209370))))

(declare-fun mapValue!12222 () ValueCell!3255)

(declare-fun mapRest!12222 () (Array (_ BitVec 32) ValueCell!3255))

(declare-fun mapKey!12222 () (_ BitVec 32))

(assert (=> mapNonEmpty!12222 (= (arr!8515 _values!1525) (store mapRest!12222 mapKey!12222 mapValue!12222))))

(declare-fun b!341390 () Bool)

(declare-fun res!188715 () Bool)

(assert (=> b!341390 (=> (not res!188715) (not e!209367))))

(declare-fun arrayContainsKey!0 (array!17991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341390 (= res!188715 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!188720 () Bool)

(assert (=> start!34222 (=> (not res!188720) (not e!209365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34222 (= res!188720 (validMask!0 mask!2385))))

(assert (=> start!34222 e!209365))

(assert (=> start!34222 true))

(assert (=> start!34222 tp_is_empty!7197))

(assert (=> start!34222 tp!25269))

(declare-fun e!209366 () Bool)

(declare-fun array_inv!6306 (array!17989) Bool)

(assert (=> start!34222 (and (array_inv!6306 _values!1525) e!209366)))

(declare-fun array_inv!6307 (array!17991) Bool)

(assert (=> start!34222 (array_inv!6307 _keys!1895)))

(declare-fun b!341391 () Bool)

(declare-fun res!188717 () Bool)

(assert (=> b!341391 (=> (not res!188717) (not e!209365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341391 (= res!188717 (validKeyInArray!0 k0!1348))))

(declare-fun b!341392 () Bool)

(declare-fun e!209369 () Bool)

(assert (=> b!341392 (= e!209369 tp_is_empty!7197)))

(declare-fun b!341393 () Bool)

(declare-fun res!188719 () Bool)

(assert (=> b!341393 (=> (not res!188719) (not e!209365))))

(assert (=> b!341393 (= res!188719 (and (= (size!8867 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8868 _keys!1895) (size!8867 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12222 () Bool)

(assert (=> mapIsEmpty!12222 mapRes!12222))

(declare-fun b!341394 () Bool)

(declare-fun res!188714 () Bool)

(assert (=> b!341394 (=> (not res!188714) (not e!209365))))

(declare-datatypes ((List!4900 0))(
  ( (Nil!4897) (Cons!4896 (h!5752 (_ BitVec 64)) (t!10008 List!4900)) )
))
(declare-fun arrayNoDuplicates!0 (array!17991 (_ BitVec 32) List!4900) Bool)

(assert (=> b!341394 (= res!188714 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4897))))

(declare-fun b!341395 () Bool)

(assert (=> b!341395 (= e!209365 e!209367)))

(declare-fun res!188718 () Bool)

(assert (=> b!341395 (=> (not res!188718) (not e!209367))))

(declare-datatypes ((SeekEntryResult!3288 0))(
  ( (MissingZero!3288 (index!15331 (_ BitVec 32))) (Found!3288 (index!15332 (_ BitVec 32))) (Intermediate!3288 (undefined!4100 Bool) (index!15333 (_ BitVec 32)) (x!34002 (_ BitVec 32))) (Undefined!3288) (MissingVacant!3288 (index!15334 (_ BitVec 32))) )
))
(declare-fun lt!161760 () SeekEntryResult!3288)

(get-info :version)

(assert (=> b!341395 (= res!188718 (and (not ((_ is Found!3288) lt!161760)) (not ((_ is MissingZero!3288) lt!161760)) ((_ is MissingVacant!3288) lt!161760)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17991 (_ BitVec 32)) SeekEntryResult!3288)

(assert (=> b!341395 (= lt!161760 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341396 () Bool)

(assert (=> b!341396 (= e!209366 (and e!209369 mapRes!12222))))

(declare-fun condMapEmpty!12222 () Bool)

(declare-fun mapDefault!12222 () ValueCell!3255)

(assert (=> b!341396 (= condMapEmpty!12222 (= (arr!8515 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3255)) mapDefault!12222)))))

(assert (= (and start!34222 res!188720) b!341393))

(assert (= (and b!341393 res!188719) b!341388))

(assert (= (and b!341388 res!188716) b!341394))

(assert (= (and b!341394 res!188714) b!341391))

(assert (= (and b!341391 res!188717) b!341386))

(assert (= (and b!341386 res!188713) b!341395))

(assert (= (and b!341395 res!188718) b!341390))

(assert (= (and b!341390 res!188715) b!341389))

(assert (= (and b!341396 condMapEmpty!12222) mapIsEmpty!12222))

(assert (= (and b!341396 (not condMapEmpty!12222)) mapNonEmpty!12222))

(assert (= (and mapNonEmpty!12222 ((_ is ValueCellFull!3255) mapValue!12222)) b!341387))

(assert (= (and b!341396 ((_ is ValueCellFull!3255) mapDefault!12222)) b!341392))

(assert (= start!34222 b!341396))

(declare-fun m!343831 () Bool)

(assert (=> mapNonEmpty!12222 m!343831))

(declare-fun m!343833 () Bool)

(assert (=> b!341395 m!343833))

(declare-fun m!343835 () Bool)

(assert (=> start!34222 m!343835))

(declare-fun m!343837 () Bool)

(assert (=> start!34222 m!343837))

(declare-fun m!343839 () Bool)

(assert (=> start!34222 m!343839))

(declare-fun m!343841 () Bool)

(assert (=> b!341386 m!343841))

(assert (=> b!341386 m!343841))

(declare-fun m!343843 () Bool)

(assert (=> b!341386 m!343843))

(declare-fun m!343845 () Bool)

(assert (=> b!341388 m!343845))

(declare-fun m!343847 () Bool)

(assert (=> b!341391 m!343847))

(declare-fun m!343849 () Bool)

(assert (=> b!341394 m!343849))

(declare-fun m!343851 () Bool)

(assert (=> b!341390 m!343851))

(declare-fun m!343853 () Bool)

(assert (=> b!341389 m!343853))

(check-sat (not b!341388) (not start!34222) (not b_next!7245) (not mapNonEmpty!12222) tp_is_empty!7197 (not b!341389) (not b!341391) (not b!341394) (not b!341386) (not b!341390) b_and!14445 (not b!341395))
(check-sat b_and!14445 (not b_next!7245))
