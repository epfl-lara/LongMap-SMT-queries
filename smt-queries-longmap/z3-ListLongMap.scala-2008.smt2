; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35014 () Bool)

(assert start!35014)

(declare-fun b_free!7717 () Bool)

(declare-fun b_next!7717 () Bool)

(assert (=> start!35014 (= b_free!7717 (not b_next!7717))))

(declare-fun tp!26729 () Bool)

(declare-fun b_and!14921 () Bool)

(assert (=> start!35014 (= tp!26729 b_and!14921)))

(declare-fun res!194533 () Bool)

(declare-fun e!214831 () Bool)

(assert (=> start!35014 (=> (not res!194533) (not e!214831))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35014 (= res!194533 (validMask!0 mask!2385))))

(assert (=> start!35014 e!214831))

(assert (=> start!35014 true))

(declare-fun tp_is_empty!7669 () Bool)

(assert (=> start!35014 tp_is_empty!7669))

(assert (=> start!35014 tp!26729))

(declare-datatypes ((V!11203 0))(
  ( (V!11204 (val!3879 Int)) )
))
(declare-datatypes ((ValueCell!3491 0))(
  ( (ValueCellFull!3491 (v!6060 V!11203)) (EmptyCell!3491) )
))
(declare-datatypes ((array!18905 0))(
  ( (array!18906 (arr!8958 (Array (_ BitVec 32) ValueCell!3491)) (size!9311 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18905)

(declare-fun e!214830 () Bool)

(declare-fun array_inv!6638 (array!18905) Bool)

(assert (=> start!35014 (and (array_inv!6638 _values!1525) e!214830)))

(declare-datatypes ((array!18907 0))(
  ( (array!18908 (arr!8959 (Array (_ BitVec 32) (_ BitVec 64))) (size!9312 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18907)

(declare-fun array_inv!6639 (array!18907) Bool)

(assert (=> start!35014 (array_inv!6639 _keys!1895)))

(declare-fun b!350799 () Bool)

(declare-fun res!194535 () Bool)

(assert (=> b!350799 (=> (not res!194535) (not e!214831))))

(declare-datatypes ((List!5186 0))(
  ( (Nil!5183) (Cons!5182 (h!6038 (_ BitVec 64)) (t!10315 List!5186)) )
))
(declare-fun arrayNoDuplicates!0 (array!18907 (_ BitVec 32) List!5186) Bool)

(assert (=> b!350799 (= res!194535 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5183))))

(declare-fun b!350800 () Bool)

(declare-fun res!194530 () Bool)

(assert (=> b!350800 (=> (not res!194530) (not e!214831))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350800 (= res!194530 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12975 () Bool)

(declare-fun mapRes!12975 () Bool)

(assert (=> mapIsEmpty!12975 mapRes!12975))

(declare-fun b!350801 () Bool)

(declare-fun e!214834 () Bool)

(assert (=> b!350801 (= e!214830 (and e!214834 mapRes!12975))))

(declare-fun condMapEmpty!12975 () Bool)

(declare-fun mapDefault!12975 () ValueCell!3491)

(assert (=> b!350801 (= condMapEmpty!12975 (= (arr!8958 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3491)) mapDefault!12975)))))

(declare-fun b!350802 () Bool)

(assert (=> b!350802 (= e!214834 tp_is_empty!7669)))

(declare-fun b!350803 () Bool)

(declare-fun e!214832 () Bool)

(assert (=> b!350803 (= e!214832 tp_is_empty!7669)))

(declare-fun mapNonEmpty!12975 () Bool)

(declare-fun tp!26730 () Bool)

(assert (=> mapNonEmpty!12975 (= mapRes!12975 (and tp!26730 e!214832))))

(declare-fun mapValue!12975 () ValueCell!3491)

(declare-fun mapRest!12975 () (Array (_ BitVec 32) ValueCell!3491))

(declare-fun mapKey!12975 () (_ BitVec 32))

(assert (=> mapNonEmpty!12975 (= (arr!8958 _values!1525) (store mapRest!12975 mapKey!12975 mapValue!12975))))

(declare-fun b!350804 () Bool)

(declare-fun res!194534 () Bool)

(declare-fun e!214833 () Bool)

(assert (=> b!350804 (=> (not res!194534) (not e!214833))))

(declare-fun arrayContainsKey!0 (array!18907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350804 (= res!194534 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350805 () Bool)

(declare-fun res!194528 () Bool)

(assert (=> b!350805 (=> (not res!194528) (not e!214831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18907 (_ BitVec 32)) Bool)

(assert (=> b!350805 (= res!194528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350806 () Bool)

(assert (=> b!350806 (= e!214831 e!214833)))

(declare-fun res!194532 () Bool)

(assert (=> b!350806 (=> (not res!194532) (not e!214833))))

(declare-datatypes ((SeekEntryResult!3451 0))(
  ( (MissingZero!3451 (index!15983 (_ BitVec 32))) (Found!3451 (index!15984 (_ BitVec 32))) (Intermediate!3451 (undefined!4263 Bool) (index!15985 (_ BitVec 32)) (x!34942 (_ BitVec 32))) (Undefined!3451) (MissingVacant!3451 (index!15986 (_ BitVec 32))) )
))
(declare-fun lt!164463 () SeekEntryResult!3451)

(get-info :version)

(assert (=> b!350806 (= res!194532 (and (not ((_ is Found!3451) lt!164463)) (not ((_ is MissingZero!3451) lt!164463)) ((_ is MissingVacant!3451) lt!164463)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18907 (_ BitVec 32)) SeekEntryResult!3451)

(assert (=> b!350806 (= lt!164463 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350807 () Bool)

(declare-fun res!194531 () Bool)

(assert (=> b!350807 (=> (not res!194531) (not e!214831))))

(declare-fun zeroValue!1467 () V!11203)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11203)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5570 0))(
  ( (tuple2!5571 (_1!2796 (_ BitVec 64)) (_2!2796 V!11203)) )
))
(declare-datatypes ((List!5187 0))(
  ( (Nil!5184) (Cons!5183 (h!6039 tuple2!5570) (t!10316 List!5187)) )
))
(declare-datatypes ((ListLongMap!4473 0))(
  ( (ListLongMap!4474 (toList!2252 List!5187)) )
))
(declare-fun contains!2332 (ListLongMap!4473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1757 (array!18907 array!18905 (_ BitVec 32) (_ BitVec 32) V!11203 V!11203 (_ BitVec 32) Int) ListLongMap!4473)

(assert (=> b!350807 (= res!194531 (not (contains!2332 (getCurrentListMap!1757 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350808 () Bool)

(declare-fun res!194529 () Bool)

(assert (=> b!350808 (=> (not res!194529) (not e!214831))))

(assert (=> b!350808 (= res!194529 (and (= (size!9311 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9312 _keys!1895) (size!9311 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350809 () Bool)

(assert (=> b!350809 (= e!214833 false)))

(declare-fun lt!164462 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18907 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350809 (= lt!164462 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35014 res!194533) b!350808))

(assert (= (and b!350808 res!194529) b!350805))

(assert (= (and b!350805 res!194528) b!350799))

(assert (= (and b!350799 res!194535) b!350800))

(assert (= (and b!350800 res!194530) b!350807))

(assert (= (and b!350807 res!194531) b!350806))

(assert (= (and b!350806 res!194532) b!350804))

(assert (= (and b!350804 res!194534) b!350809))

(assert (= (and b!350801 condMapEmpty!12975) mapIsEmpty!12975))

(assert (= (and b!350801 (not condMapEmpty!12975)) mapNonEmpty!12975))

(assert (= (and mapNonEmpty!12975 ((_ is ValueCellFull!3491) mapValue!12975)) b!350803))

(assert (= (and b!350801 ((_ is ValueCellFull!3491) mapDefault!12975)) b!350802))

(assert (= start!35014 b!350801))

(declare-fun m!350367 () Bool)

(assert (=> mapNonEmpty!12975 m!350367))

(declare-fun m!350369 () Bool)

(assert (=> b!350800 m!350369))

(declare-fun m!350371 () Bool)

(assert (=> b!350806 m!350371))

(declare-fun m!350373 () Bool)

(assert (=> b!350809 m!350373))

(declare-fun m!350375 () Bool)

(assert (=> b!350799 m!350375))

(declare-fun m!350377 () Bool)

(assert (=> b!350804 m!350377))

(declare-fun m!350379 () Bool)

(assert (=> b!350805 m!350379))

(declare-fun m!350381 () Bool)

(assert (=> b!350807 m!350381))

(assert (=> b!350807 m!350381))

(declare-fun m!350383 () Bool)

(assert (=> b!350807 m!350383))

(declare-fun m!350385 () Bool)

(assert (=> start!35014 m!350385))

(declare-fun m!350387 () Bool)

(assert (=> start!35014 m!350387))

(declare-fun m!350389 () Bool)

(assert (=> start!35014 m!350389))

(check-sat b_and!14921 (not start!35014) (not b!350809) (not b_next!7717) tp_is_empty!7669 (not b!350806) (not b!350800) (not b!350807) (not b!350804) (not b!350805) (not mapNonEmpty!12975) (not b!350799))
(check-sat b_and!14921 (not b_next!7717))
