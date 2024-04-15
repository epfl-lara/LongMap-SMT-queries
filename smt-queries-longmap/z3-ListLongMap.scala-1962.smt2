; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34504 () Bool)

(assert start!34504)

(declare-fun b_free!7441 () Bool)

(declare-fun b_next!7441 () Bool)

(assert (=> start!34504 (= b_free!7441 (not b_next!7441))))

(declare-fun tp!25868 () Bool)

(declare-fun b_and!14623 () Bool)

(assert (=> start!34504 (= tp!25868 b_and!14623)))

(declare-fun b!344726 () Bool)

(declare-fun e!211286 () Bool)

(declare-fun tp_is_empty!7393 () Bool)

(assert (=> b!344726 (= e!211286 tp_is_empty!7393)))

(declare-fun mapNonEmpty!12528 () Bool)

(declare-fun mapRes!12528 () Bool)

(declare-fun tp!25869 () Bool)

(declare-fun e!211287 () Bool)

(assert (=> mapNonEmpty!12528 (= mapRes!12528 (and tp!25869 e!211287))))

(declare-datatypes ((V!10835 0))(
  ( (V!10836 (val!3741 Int)) )
))
(declare-datatypes ((ValueCell!3353 0))(
  ( (ValueCellFull!3353 (v!5911 V!10835)) (EmptyCell!3353) )
))
(declare-fun mapValue!12528 () ValueCell!3353)

(declare-fun mapRest!12528 () (Array (_ BitVec 32) ValueCell!3353))

(declare-datatypes ((array!18355 0))(
  ( (array!18356 (arr!8694 (Array (_ BitVec 32) ValueCell!3353)) (size!9047 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18355)

(declare-fun mapKey!12528 () (_ BitVec 32))

(assert (=> mapNonEmpty!12528 (= (arr!8694 _values!1525) (store mapRest!12528 mapKey!12528 mapValue!12528))))

(declare-fun b!344727 () Bool)

(declare-fun e!211284 () Bool)

(assert (=> b!344727 (= e!211284 (and e!211286 mapRes!12528))))

(declare-fun condMapEmpty!12528 () Bool)

(declare-fun mapDefault!12528 () ValueCell!3353)

(assert (=> b!344727 (= condMapEmpty!12528 (= (arr!8694 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3353)) mapDefault!12528)))))

(declare-fun b!344728 () Bool)

(declare-fun res!190733 () Bool)

(declare-fun e!211285 () Bool)

(assert (=> b!344728 (=> (not res!190733) (not e!211285))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18357 0))(
  ( (array!18358 (arr!8695 (Array (_ BitVec 32) (_ BitVec 64))) (size!9048 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18357)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344728 (= res!190733 (and (= (size!9047 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9048 _keys!1895) (size!9047 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344729 () Bool)

(declare-fun res!190735 () Bool)

(assert (=> b!344729 (=> (not res!190735) (not e!211285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18357 (_ BitVec 32)) Bool)

(assert (=> b!344729 (= res!190735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344730 () Bool)

(declare-fun res!190734 () Bool)

(assert (=> b!344730 (=> (not res!190734) (not e!211285))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10835)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10835)

(declare-datatypes ((tuple2!5370 0))(
  ( (tuple2!5371 (_1!2696 (_ BitVec 64)) (_2!2696 V!10835)) )
))
(declare-datatypes ((List!4988 0))(
  ( (Nil!4985) (Cons!4984 (h!5840 tuple2!5370) (t!10095 List!4988)) )
))
(declare-datatypes ((ListLongMap!4273 0))(
  ( (ListLongMap!4274 (toList!2152 List!4988)) )
))
(declare-fun contains!2221 (ListLongMap!4273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1658 (array!18357 array!18355 (_ BitVec 32) (_ BitVec 32) V!10835 V!10835 (_ BitVec 32) Int) ListLongMap!4273)

(assert (=> b!344730 (= res!190734 (not (contains!2221 (getCurrentListMap!1658 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!190731 () Bool)

(assert (=> start!34504 (=> (not res!190731) (not e!211285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34504 (= res!190731 (validMask!0 mask!2385))))

(assert (=> start!34504 e!211285))

(assert (=> start!34504 true))

(assert (=> start!34504 tp_is_empty!7393))

(assert (=> start!34504 tp!25868))

(declare-fun array_inv!6462 (array!18355) Bool)

(assert (=> start!34504 (and (array_inv!6462 _values!1525) e!211284)))

(declare-fun array_inv!6463 (array!18357) Bool)

(assert (=> start!34504 (array_inv!6463 _keys!1895)))

(declare-fun b!344731 () Bool)

(declare-fun res!190732 () Bool)

(assert (=> b!344731 (=> (not res!190732) (not e!211285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344731 (= res!190732 (validKeyInArray!0 k0!1348))))

(declare-fun b!344732 () Bool)

(declare-fun res!190736 () Bool)

(assert (=> b!344732 (=> (not res!190736) (not e!211285))))

(declare-datatypes ((List!4989 0))(
  ( (Nil!4986) (Cons!4985 (h!5841 (_ BitVec 64)) (t!10096 List!4989)) )
))
(declare-fun arrayNoDuplicates!0 (array!18357 (_ BitVec 32) List!4989) Bool)

(assert (=> b!344732 (= res!190736 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4986))))

(declare-fun mapIsEmpty!12528 () Bool)

(assert (=> mapIsEmpty!12528 mapRes!12528))

(declare-fun b!344733 () Bool)

(assert (=> b!344733 (= e!211287 tp_is_empty!7393)))

(declare-fun b!344734 () Bool)

(assert (=> b!344734 (= e!211285 false)))

(declare-datatypes ((SeekEntryResult!3347 0))(
  ( (MissingZero!3347 (index!15567 (_ BitVec 32))) (Found!3347 (index!15568 (_ BitVec 32))) (Intermediate!3347 (undefined!4159 Bool) (index!15569 (_ BitVec 32)) (x!34360 (_ BitVec 32))) (Undefined!3347) (MissingVacant!3347 (index!15570 (_ BitVec 32))) )
))
(declare-fun lt!162501 () SeekEntryResult!3347)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18357 (_ BitVec 32)) SeekEntryResult!3347)

(assert (=> b!344734 (= lt!162501 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34504 res!190731) b!344728))

(assert (= (and b!344728 res!190733) b!344729))

(assert (= (and b!344729 res!190735) b!344732))

(assert (= (and b!344732 res!190736) b!344731))

(assert (= (and b!344731 res!190732) b!344730))

(assert (= (and b!344730 res!190734) b!344734))

(assert (= (and b!344727 condMapEmpty!12528) mapIsEmpty!12528))

(assert (= (and b!344727 (not condMapEmpty!12528)) mapNonEmpty!12528))

(get-info :version)

(assert (= (and mapNonEmpty!12528 ((_ is ValueCellFull!3353) mapValue!12528)) b!344733))

(assert (= (and b!344727 ((_ is ValueCellFull!3353) mapDefault!12528)) b!344726))

(assert (= start!34504 b!344727))

(declare-fun m!345747 () Bool)

(assert (=> b!344731 m!345747))

(declare-fun m!345749 () Bool)

(assert (=> b!344732 m!345749))

(declare-fun m!345751 () Bool)

(assert (=> mapNonEmpty!12528 m!345751))

(declare-fun m!345753 () Bool)

(assert (=> start!34504 m!345753))

(declare-fun m!345755 () Bool)

(assert (=> start!34504 m!345755))

(declare-fun m!345757 () Bool)

(assert (=> start!34504 m!345757))

(declare-fun m!345759 () Bool)

(assert (=> b!344729 m!345759))

(declare-fun m!345761 () Bool)

(assert (=> b!344734 m!345761))

(declare-fun m!345763 () Bool)

(assert (=> b!344730 m!345763))

(assert (=> b!344730 m!345763))

(declare-fun m!345765 () Bool)

(assert (=> b!344730 m!345765))

(check-sat (not b!344729) tp_is_empty!7393 (not start!34504) (not mapNonEmpty!12528) (not b_next!7441) b_and!14623 (not b!344732) (not b!344734) (not b!344730) (not b!344731))
(check-sat b_and!14623 (not b_next!7441))
