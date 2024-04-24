; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34798 () Bool)

(assert start!34798)

(declare-fun b_free!7597 () Bool)

(declare-fun b_next!7597 () Bool)

(assert (=> start!34798 (= b_free!7597 (not b_next!7597))))

(declare-fun tp!26357 () Bool)

(declare-fun b_and!14833 () Bool)

(assert (=> start!34798 (= tp!26357 b_and!14833)))

(declare-fun mapIsEmpty!12783 () Bool)

(declare-fun mapRes!12783 () Bool)

(assert (=> mapIsEmpty!12783 mapRes!12783))

(declare-fun res!192990 () Bool)

(declare-fun e!213432 () Bool)

(assert (=> start!34798 (=> (not res!192990) (not e!213432))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34798 (= res!192990 (validMask!0 mask!2385))))

(assert (=> start!34798 e!213432))

(assert (=> start!34798 true))

(declare-fun tp_is_empty!7549 () Bool)

(assert (=> start!34798 tp_is_empty!7549))

(assert (=> start!34798 tp!26357))

(declare-datatypes ((V!11043 0))(
  ( (V!11044 (val!3819 Int)) )
))
(declare-datatypes ((ValueCell!3431 0))(
  ( (ValueCellFull!3431 (v!6003 V!11043)) (EmptyCell!3431) )
))
(declare-datatypes ((array!18674 0))(
  ( (array!18675 (arr!8846 (Array (_ BitVec 32) ValueCell!3431)) (size!9198 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18674)

(declare-fun e!213435 () Bool)

(declare-fun array_inv!6534 (array!18674) Bool)

(assert (=> start!34798 (and (array_inv!6534 _values!1525) e!213435)))

(declare-datatypes ((array!18676 0))(
  ( (array!18677 (arr!8847 (Array (_ BitVec 32) (_ BitVec 64))) (size!9199 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18676)

(declare-fun array_inv!6535 (array!18676) Bool)

(assert (=> start!34798 (array_inv!6535 _keys!1895)))

(declare-fun b!348357 () Bool)

(declare-fun e!213433 () Bool)

(assert (=> b!348357 (= e!213435 (and e!213433 mapRes!12783))))

(declare-fun condMapEmpty!12783 () Bool)

(declare-fun mapDefault!12783 () ValueCell!3431)

(assert (=> b!348357 (= condMapEmpty!12783 (= (arr!8846 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3431)) mapDefault!12783)))))

(declare-fun b!348358 () Bool)

(declare-fun res!192994 () Bool)

(assert (=> b!348358 (=> (not res!192994) (not e!213432))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348358 (= res!192994 (validKeyInArray!0 k0!1348))))

(declare-fun b!348359 () Bool)

(declare-fun e!213436 () Bool)

(assert (=> b!348359 (= e!213436 tp_is_empty!7549)))

(declare-fun b!348360 () Bool)

(assert (=> b!348360 (= e!213433 tp_is_empty!7549)))

(declare-fun b!348361 () Bool)

(declare-fun res!192996 () Bool)

(assert (=> b!348361 (=> (not res!192996) (not e!213432))))

(declare-fun zeroValue!1467 () V!11043)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11043)

(declare-datatypes ((tuple2!5434 0))(
  ( (tuple2!5435 (_1!2728 (_ BitVec 64)) (_2!2728 V!11043)) )
))
(declare-datatypes ((List!5043 0))(
  ( (Nil!5040) (Cons!5039 (h!5895 tuple2!5434) (t!10165 List!5043)) )
))
(declare-datatypes ((ListLongMap!4349 0))(
  ( (ListLongMap!4350 (toList!2190 List!5043)) )
))
(declare-fun contains!2274 (ListLongMap!4349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1718 (array!18676 array!18674 (_ BitVec 32) (_ BitVec 32) V!11043 V!11043 (_ BitVec 32) Int) ListLongMap!4349)

(assert (=> b!348361 (= res!192996 (not (contains!2274 (getCurrentListMap!1718 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348362 () Bool)

(declare-fun e!213434 () Bool)

(assert (=> b!348362 (= e!213434 false)))

(declare-fun lt!163890 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18676 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348362 (= lt!163890 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348363 () Bool)

(assert (=> b!348363 (= e!213432 e!213434)))

(declare-fun res!192993 () Bool)

(assert (=> b!348363 (=> (not res!192993) (not e!213434))))

(declare-datatypes ((SeekEntryResult!3366 0))(
  ( (MissingZero!3366 (index!15643 (_ BitVec 32))) (Found!3366 (index!15644 (_ BitVec 32))) (Intermediate!3366 (undefined!4178 Bool) (index!15645 (_ BitVec 32)) (x!34659 (_ BitVec 32))) (Undefined!3366) (MissingVacant!3366 (index!15646 (_ BitVec 32))) )
))
(declare-fun lt!163891 () SeekEntryResult!3366)

(get-info :version)

(assert (=> b!348363 (= res!192993 (and (not ((_ is Found!3366) lt!163891)) ((_ is MissingZero!3366) lt!163891)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18676 (_ BitVec 32)) SeekEntryResult!3366)

(assert (=> b!348363 (= lt!163891 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12783 () Bool)

(declare-fun tp!26358 () Bool)

(assert (=> mapNonEmpty!12783 (= mapRes!12783 (and tp!26358 e!213436))))

(declare-fun mapValue!12783 () ValueCell!3431)

(declare-fun mapKey!12783 () (_ BitVec 32))

(declare-fun mapRest!12783 () (Array (_ BitVec 32) ValueCell!3431))

(assert (=> mapNonEmpty!12783 (= (arr!8846 _values!1525) (store mapRest!12783 mapKey!12783 mapValue!12783))))

(declare-fun b!348364 () Bool)

(declare-fun res!192995 () Bool)

(assert (=> b!348364 (=> (not res!192995) (not e!213434))))

(declare-fun arrayContainsKey!0 (array!18676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348364 (= res!192995 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348365 () Bool)

(declare-fun res!192997 () Bool)

(assert (=> b!348365 (=> (not res!192997) (not e!213432))))

(assert (=> b!348365 (= res!192997 (and (= (size!9198 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9199 _keys!1895) (size!9198 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348366 () Bool)

(declare-fun res!192991 () Bool)

(assert (=> b!348366 (=> (not res!192991) (not e!213432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18676 (_ BitVec 32)) Bool)

(assert (=> b!348366 (= res!192991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348367 () Bool)

(declare-fun res!192992 () Bool)

(assert (=> b!348367 (=> (not res!192992) (not e!213432))))

(declare-datatypes ((List!5044 0))(
  ( (Nil!5041) (Cons!5040 (h!5896 (_ BitVec 64)) (t!10166 List!5044)) )
))
(declare-fun arrayNoDuplicates!0 (array!18676 (_ BitVec 32) List!5044) Bool)

(assert (=> b!348367 (= res!192992 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5041))))

(assert (= (and start!34798 res!192990) b!348365))

(assert (= (and b!348365 res!192997) b!348366))

(assert (= (and b!348366 res!192991) b!348367))

(assert (= (and b!348367 res!192992) b!348358))

(assert (= (and b!348358 res!192994) b!348361))

(assert (= (and b!348361 res!192996) b!348363))

(assert (= (and b!348363 res!192993) b!348364))

(assert (= (and b!348364 res!192995) b!348362))

(assert (= (and b!348357 condMapEmpty!12783) mapIsEmpty!12783))

(assert (= (and b!348357 (not condMapEmpty!12783)) mapNonEmpty!12783))

(assert (= (and mapNonEmpty!12783 ((_ is ValueCellFull!3431) mapValue!12783)) b!348359))

(assert (= (and b!348357 ((_ is ValueCellFull!3431) mapDefault!12783)) b!348360))

(assert (= start!34798 b!348357))

(declare-fun m!349413 () Bool)

(assert (=> b!348361 m!349413))

(assert (=> b!348361 m!349413))

(declare-fun m!349415 () Bool)

(assert (=> b!348361 m!349415))

(declare-fun m!349417 () Bool)

(assert (=> b!348358 m!349417))

(declare-fun m!349419 () Bool)

(assert (=> b!348364 m!349419))

(declare-fun m!349421 () Bool)

(assert (=> b!348367 m!349421))

(declare-fun m!349423 () Bool)

(assert (=> mapNonEmpty!12783 m!349423))

(declare-fun m!349425 () Bool)

(assert (=> start!34798 m!349425))

(declare-fun m!349427 () Bool)

(assert (=> start!34798 m!349427))

(declare-fun m!349429 () Bool)

(assert (=> start!34798 m!349429))

(declare-fun m!349431 () Bool)

(assert (=> b!348363 m!349431))

(declare-fun m!349433 () Bool)

(assert (=> b!348366 m!349433))

(declare-fun m!349435 () Bool)

(assert (=> b!348362 m!349435))

(check-sat (not b!348364) (not b!348367) (not b!348366) (not b!348358) (not start!34798) (not b!348361) (not b_next!7597) tp_is_empty!7549 b_and!14833 (not b!348363) (not b!348362) (not mapNonEmpty!12783))
(check-sat b_and!14833 (not b_next!7597))
