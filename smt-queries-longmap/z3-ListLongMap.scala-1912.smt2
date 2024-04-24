; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34048 () Bool)

(assert start!34048)

(declare-fun b_free!7141 () Bool)

(declare-fun b_next!7141 () Bool)

(assert (=> start!34048 (= b_free!7141 (not b_next!7141))))

(declare-fun tp!24948 () Bool)

(declare-fun b_and!14349 () Bool)

(assert (=> start!34048 (= tp!24948 b_and!14349)))

(declare-fun b!339277 () Bool)

(declare-fun res!187424 () Bool)

(declare-fun e!208163 () Bool)

(assert (=> b!339277 (=> (not res!187424) (not e!208163))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339277 (= res!187424 (validKeyInArray!0 k0!1348))))

(declare-fun b!339278 () Bool)

(declare-fun e!208162 () Bool)

(declare-fun tp_is_empty!7093 () Bool)

(assert (=> b!339278 (= e!208162 tp_is_empty!7093)))

(declare-fun mapNonEmpty!12057 () Bool)

(declare-fun mapRes!12057 () Bool)

(declare-fun tp!24947 () Bool)

(declare-fun e!208159 () Bool)

(assert (=> mapNonEmpty!12057 (= mapRes!12057 (and tp!24947 e!208159))))

(declare-datatypes ((V!10435 0))(
  ( (V!10436 (val!3591 Int)) )
))
(declare-datatypes ((ValueCell!3203 0))(
  ( (ValueCellFull!3203 (v!5761 V!10435)) (EmptyCell!3203) )
))
(declare-datatypes ((array!17768 0))(
  ( (array!17769 (arr!8407 (Array (_ BitVec 32) ValueCell!3203)) (size!8759 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17768)

(declare-fun mapValue!12057 () ValueCell!3203)

(declare-fun mapKey!12057 () (_ BitVec 32))

(declare-fun mapRest!12057 () (Array (_ BitVec 32) ValueCell!3203))

(assert (=> mapNonEmpty!12057 (= (arr!8407 _values!1525) (store mapRest!12057 mapKey!12057 mapValue!12057))))

(declare-fun b!339279 () Bool)

(declare-fun res!187423 () Bool)

(assert (=> b!339279 (=> (not res!187423) (not e!208163))))

(declare-datatypes ((array!17770 0))(
  ( (array!17771 (arr!8408 (Array (_ BitVec 32) (_ BitVec 64))) (size!8760 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17770)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!339279 (= res!187423 (and (= (size!8759 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8760 _keys!1895) (size!8759 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339280 () Bool)

(declare-fun res!187421 () Bool)

(assert (=> b!339280 (=> (not res!187421) (not e!208163))))

(declare-fun zeroValue!1467 () V!10435)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10435)

(declare-datatypes ((tuple2!5122 0))(
  ( (tuple2!5123 (_1!2572 (_ BitVec 64)) (_2!2572 V!10435)) )
))
(declare-datatypes ((List!4730 0))(
  ( (Nil!4727) (Cons!4726 (h!5582 tuple2!5122) (t!9824 List!4730)) )
))
(declare-datatypes ((ListLongMap!4037 0))(
  ( (ListLongMap!4038 (toList!2034 List!4730)) )
))
(declare-fun contains!2104 (ListLongMap!4037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1563 (array!17770 array!17768 (_ BitVec 32) (_ BitVec 32) V!10435 V!10435 (_ BitVec 32) Int) ListLongMap!4037)

(assert (=> b!339280 (= res!187421 (not (contains!2104 (getCurrentListMap!1563 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12057 () Bool)

(assert (=> mapIsEmpty!12057 mapRes!12057))

(declare-fun b!339281 () Bool)

(assert (=> b!339281 (= e!208159 tp_is_empty!7093)))

(declare-fun b!339283 () Bool)

(declare-fun e!208161 () Bool)

(assert (=> b!339283 (= e!208163 e!208161)))

(declare-fun res!187422 () Bool)

(assert (=> b!339283 (=> (not res!187422) (not e!208161))))

(declare-datatypes ((SeekEntryResult!3207 0))(
  ( (MissingZero!3207 (index!15007 (_ BitVec 32))) (Found!3207 (index!15008 (_ BitVec 32))) (Intermediate!3207 (undefined!4019 Bool) (index!15009 (_ BitVec 32)) (x!33752 (_ BitVec 32))) (Undefined!3207) (MissingVacant!3207 (index!15010 (_ BitVec 32))) )
))
(declare-fun lt!161198 () SeekEntryResult!3207)

(get-info :version)

(assert (=> b!339283 (= res!187422 (and (not ((_ is Found!3207) lt!161198)) ((_ is MissingZero!3207) lt!161198)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17770 (_ BitVec 32)) SeekEntryResult!3207)

(assert (=> b!339283 (= lt!161198 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339284 () Bool)

(declare-fun res!187420 () Bool)

(assert (=> b!339284 (=> (not res!187420) (not e!208163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17770 (_ BitVec 32)) Bool)

(assert (=> b!339284 (= res!187420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339285 () Bool)

(declare-fun e!208160 () Bool)

(assert (=> b!339285 (= e!208160 (and e!208162 mapRes!12057))))

(declare-fun condMapEmpty!12057 () Bool)

(declare-fun mapDefault!12057 () ValueCell!3203)

(assert (=> b!339285 (= condMapEmpty!12057 (= (arr!8407 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3203)) mapDefault!12057)))))

(declare-fun b!339286 () Bool)

(assert (=> b!339286 (= e!208161 false)))

(declare-datatypes ((Unit!10528 0))(
  ( (Unit!10529) )
))
(declare-fun lt!161200 () Unit!10528)

(declare-fun e!208158 () Unit!10528)

(assert (=> b!339286 (= lt!161200 e!208158)))

(declare-fun c!52526 () Bool)

(declare-fun arrayContainsKey!0 (array!17770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339286 (= c!52526 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339287 () Bool)

(declare-fun res!187419 () Bool)

(assert (=> b!339287 (=> (not res!187419) (not e!208163))))

(declare-datatypes ((List!4731 0))(
  ( (Nil!4728) (Cons!4727 (h!5583 (_ BitVec 64)) (t!9825 List!4731)) )
))
(declare-fun arrayNoDuplicates!0 (array!17770 (_ BitVec 32) List!4731) Bool)

(assert (=> b!339287 (= res!187419 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4728))))

(declare-fun b!339288 () Bool)

(declare-fun Unit!10530 () Unit!10528)

(assert (=> b!339288 (= e!208158 Unit!10530)))

(declare-fun lt!161199 () Unit!10528)

(declare-fun lemmaArrayContainsKeyThenInListMap!290 (array!17770 array!17768 (_ BitVec 32) (_ BitVec 32) V!10435 V!10435 (_ BitVec 64) (_ BitVec 32) Int) Unit!10528)

(declare-fun arrayScanForKey!0 (array!17770 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339288 (= lt!161199 (lemmaArrayContainsKeyThenInListMap!290 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339288 false))

(declare-fun b!339282 () Bool)

(declare-fun Unit!10531 () Unit!10528)

(assert (=> b!339282 (= e!208158 Unit!10531)))

(declare-fun res!187418 () Bool)

(assert (=> start!34048 (=> (not res!187418) (not e!208163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34048 (= res!187418 (validMask!0 mask!2385))))

(assert (=> start!34048 e!208163))

(assert (=> start!34048 true))

(assert (=> start!34048 tp_is_empty!7093))

(assert (=> start!34048 tp!24948))

(declare-fun array_inv!6236 (array!17768) Bool)

(assert (=> start!34048 (and (array_inv!6236 _values!1525) e!208160)))

(declare-fun array_inv!6237 (array!17770) Bool)

(assert (=> start!34048 (array_inv!6237 _keys!1895)))

(assert (= (and start!34048 res!187418) b!339279))

(assert (= (and b!339279 res!187423) b!339284))

(assert (= (and b!339284 res!187420) b!339287))

(assert (= (and b!339287 res!187419) b!339277))

(assert (= (and b!339277 res!187424) b!339280))

(assert (= (and b!339280 res!187421) b!339283))

(assert (= (and b!339283 res!187422) b!339286))

(assert (= (and b!339286 c!52526) b!339288))

(assert (= (and b!339286 (not c!52526)) b!339282))

(assert (= (and b!339285 condMapEmpty!12057) mapIsEmpty!12057))

(assert (= (and b!339285 (not condMapEmpty!12057)) mapNonEmpty!12057))

(assert (= (and mapNonEmpty!12057 ((_ is ValueCellFull!3203) mapValue!12057)) b!339281))

(assert (= (and b!339285 ((_ is ValueCellFull!3203) mapDefault!12057)) b!339278))

(assert (= start!34048 b!339285))

(declare-fun m!342559 () Bool)

(assert (=> b!339284 m!342559))

(declare-fun m!342561 () Bool)

(assert (=> mapNonEmpty!12057 m!342561))

(declare-fun m!342563 () Bool)

(assert (=> start!34048 m!342563))

(declare-fun m!342565 () Bool)

(assert (=> start!34048 m!342565))

(declare-fun m!342567 () Bool)

(assert (=> start!34048 m!342567))

(declare-fun m!342569 () Bool)

(assert (=> b!339280 m!342569))

(assert (=> b!339280 m!342569))

(declare-fun m!342571 () Bool)

(assert (=> b!339280 m!342571))

(declare-fun m!342573 () Bool)

(assert (=> b!339277 m!342573))

(declare-fun m!342575 () Bool)

(assert (=> b!339283 m!342575))

(declare-fun m!342577 () Bool)

(assert (=> b!339288 m!342577))

(assert (=> b!339288 m!342577))

(declare-fun m!342579 () Bool)

(assert (=> b!339288 m!342579))

(declare-fun m!342581 () Bool)

(assert (=> b!339287 m!342581))

(declare-fun m!342583 () Bool)

(assert (=> b!339286 m!342583))

(check-sat (not b!339288) (not b!339284) tp_is_empty!7093 (not start!34048) (not b_next!7141) (not b!339286) (not mapNonEmpty!12057) b_and!14349 (not b!339283) (not b!339287) (not b!339277) (not b!339280))
(check-sat b_and!14349 (not b_next!7141))
