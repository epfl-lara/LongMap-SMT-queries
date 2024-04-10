; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16070 () Bool)

(assert start!16070)

(declare-fun b!159561 () Bool)

(declare-fun b_free!3531 () Bool)

(declare-fun b_next!3531 () Bool)

(assert (=> b!159561 (= b_free!3531 (not b_next!3531))))

(declare-fun tp!13163 () Bool)

(declare-fun b_and!9945 () Bool)

(assert (=> b!159561 (= tp!13163 b_and!9945)))

(declare-fun e!104430 () Bool)

(declare-fun e!104429 () Bool)

(declare-fun tp_is_empty!3333 () Bool)

(declare-datatypes ((V!4091 0))(
  ( (V!4092 (val!1711 Int)) )
))
(declare-datatypes ((ValueCell!1323 0))(
  ( (ValueCellFull!1323 (v!3576 V!4091)) (EmptyCell!1323) )
))
(declare-datatypes ((array!5745 0))(
  ( (array!5746 (arr!2717 (Array (_ BitVec 32) (_ BitVec 64))) (size!3001 (_ BitVec 32))) )
))
(declare-datatypes ((array!5747 0))(
  ( (array!5748 (arr!2718 (Array (_ BitVec 32) ValueCell!1323)) (size!3002 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1554 0))(
  ( (LongMapFixedSize!1555 (defaultEntry!3219 Int) (mask!7771 (_ BitVec 32)) (extraKeys!2960 (_ BitVec 32)) (zeroValue!3062 V!4091) (minValue!3062 V!4091) (_size!826 (_ BitVec 32)) (_keys!5020 array!5745) (_values!3202 array!5747) (_vacant!826 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1554)

(declare-fun array_inv!1727 (array!5745) Bool)

(declare-fun array_inv!1728 (array!5747) Bool)

(assert (=> b!159561 (= e!104429 (and tp!13163 tp_is_empty!3333 (array_inv!1727 (_keys!5020 thiss!1248)) (array_inv!1728 (_values!3202 thiss!1248)) e!104430))))

(declare-fun b!159562 () Bool)

(declare-fun res!75408 () Bool)

(declare-fun e!104426 () Bool)

(assert (=> b!159562 (=> (not res!75408) (not e!104426))))

(assert (=> b!159562 (= res!75408 (and (= (size!3002 (_values!3202 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7771 thiss!1248))) (= (size!3001 (_keys!5020 thiss!1248)) (size!3002 (_values!3202 thiss!1248))) (bvsge (mask!7771 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2960 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2960 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75410 () Bool)

(assert (=> start!16070 (=> (not res!75410) (not e!104426))))

(declare-fun valid!725 (LongMapFixedSize!1554) Bool)

(assert (=> start!16070 (= res!75410 (valid!725 thiss!1248))))

(assert (=> start!16070 e!104426))

(assert (=> start!16070 e!104429))

(assert (=> start!16070 true))

(declare-fun mapIsEmpty!5687 () Bool)

(declare-fun mapRes!5687 () Bool)

(assert (=> mapIsEmpty!5687 mapRes!5687))

(declare-fun b!159563 () Bool)

(declare-fun e!104428 () Bool)

(assert (=> b!159563 (= e!104430 (and e!104428 mapRes!5687))))

(declare-fun condMapEmpty!5687 () Bool)

(declare-fun mapDefault!5687 () ValueCell!1323)

(assert (=> b!159563 (= condMapEmpty!5687 (= (arr!2718 (_values!3202 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1323)) mapDefault!5687)))))

(declare-fun b!159564 () Bool)

(declare-fun res!75412 () Bool)

(assert (=> b!159564 (=> (not res!75412) (not e!104426))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2890 0))(
  ( (tuple2!2891 (_1!1456 (_ BitVec 64)) (_2!1456 V!4091)) )
))
(declare-datatypes ((List!1911 0))(
  ( (Nil!1908) (Cons!1907 (h!2520 tuple2!2890) (t!6713 List!1911)) )
))
(declare-datatypes ((ListLongMap!1877 0))(
  ( (ListLongMap!1878 (toList!954 List!1911)) )
))
(declare-fun contains!990 (ListLongMap!1877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!618 (array!5745 array!5747 (_ BitVec 32) (_ BitVec 32) V!4091 V!4091 (_ BitVec 32) Int) ListLongMap!1877)

(assert (=> b!159564 (= res!75412 (contains!990 (getCurrentListMap!618 (_keys!5020 thiss!1248) (_values!3202 thiss!1248) (mask!7771 thiss!1248) (extraKeys!2960 thiss!1248) (zeroValue!3062 thiss!1248) (minValue!3062 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3219 thiss!1248)) key!828))))

(declare-fun b!159565 () Bool)

(assert (=> b!159565 (= e!104426 false)))

(declare-fun lt!82009 () Bool)

(declare-datatypes ((List!1912 0))(
  ( (Nil!1909) (Cons!1908 (h!2521 (_ BitVec 64)) (t!6714 List!1912)) )
))
(declare-fun arrayNoDuplicates!0 (array!5745 (_ BitVec 32) List!1912) Bool)

(assert (=> b!159565 (= lt!82009 (arrayNoDuplicates!0 (_keys!5020 thiss!1248) #b00000000000000000000000000000000 Nil!1909))))

(declare-fun b!159566 () Bool)

(assert (=> b!159566 (= e!104428 tp_is_empty!3333)))

(declare-fun mapNonEmpty!5687 () Bool)

(declare-fun tp!13162 () Bool)

(declare-fun e!104427 () Bool)

(assert (=> mapNonEmpty!5687 (= mapRes!5687 (and tp!13162 e!104427))))

(declare-fun mapValue!5687 () ValueCell!1323)

(declare-fun mapRest!5687 () (Array (_ BitVec 32) ValueCell!1323))

(declare-fun mapKey!5687 () (_ BitVec 32))

(assert (=> mapNonEmpty!5687 (= (arr!2718 (_values!3202 thiss!1248)) (store mapRest!5687 mapKey!5687 mapValue!5687))))

(declare-fun b!159567 () Bool)

(assert (=> b!159567 (= e!104427 tp_is_empty!3333)))

(declare-fun b!159568 () Bool)

(declare-fun res!75409 () Bool)

(assert (=> b!159568 (=> (not res!75409) (not e!104426))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!313 0))(
  ( (MissingZero!313 (index!3420 (_ BitVec 32))) (Found!313 (index!3421 (_ BitVec 32))) (Intermediate!313 (undefined!1125 Bool) (index!3422 (_ BitVec 32)) (x!17617 (_ BitVec 32))) (Undefined!313) (MissingVacant!313 (index!3423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5745 (_ BitVec 32)) SeekEntryResult!313)

(assert (=> b!159568 (= res!75409 ((_ is Undefined!313) (seekEntryOrOpen!0 key!828 (_keys!5020 thiss!1248) (mask!7771 thiss!1248))))))

(declare-fun b!159569 () Bool)

(declare-fun res!75411 () Bool)

(assert (=> b!159569 (=> (not res!75411) (not e!104426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159569 (= res!75411 (validMask!0 (mask!7771 thiss!1248)))))

(declare-fun b!159570 () Bool)

(declare-fun res!75413 () Bool)

(assert (=> b!159570 (=> (not res!75413) (not e!104426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5745 (_ BitVec 32)) Bool)

(assert (=> b!159570 (= res!75413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5020 thiss!1248) (mask!7771 thiss!1248)))))

(declare-fun b!159571 () Bool)

(declare-fun res!75407 () Bool)

(assert (=> b!159571 (=> (not res!75407) (not e!104426))))

(assert (=> b!159571 (= res!75407 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16070 res!75410) b!159571))

(assert (= (and b!159571 res!75407) b!159568))

(assert (= (and b!159568 res!75409) b!159564))

(assert (= (and b!159564 res!75412) b!159569))

(assert (= (and b!159569 res!75411) b!159562))

(assert (= (and b!159562 res!75408) b!159570))

(assert (= (and b!159570 res!75413) b!159565))

(assert (= (and b!159563 condMapEmpty!5687) mapIsEmpty!5687))

(assert (= (and b!159563 (not condMapEmpty!5687)) mapNonEmpty!5687))

(assert (= (and mapNonEmpty!5687 ((_ is ValueCellFull!1323) mapValue!5687)) b!159567))

(assert (= (and b!159563 ((_ is ValueCellFull!1323) mapDefault!5687)) b!159566))

(assert (= b!159561 b!159563))

(assert (= start!16070 b!159561))

(declare-fun m!191777 () Bool)

(assert (=> b!159568 m!191777))

(declare-fun m!191779 () Bool)

(assert (=> b!159561 m!191779))

(declare-fun m!191781 () Bool)

(assert (=> b!159561 m!191781))

(declare-fun m!191783 () Bool)

(assert (=> b!159569 m!191783))

(declare-fun m!191785 () Bool)

(assert (=> start!16070 m!191785))

(declare-fun m!191787 () Bool)

(assert (=> mapNonEmpty!5687 m!191787))

(declare-fun m!191789 () Bool)

(assert (=> b!159564 m!191789))

(assert (=> b!159564 m!191789))

(declare-fun m!191791 () Bool)

(assert (=> b!159564 m!191791))

(declare-fun m!191793 () Bool)

(assert (=> b!159565 m!191793))

(declare-fun m!191795 () Bool)

(assert (=> b!159570 m!191795))

(check-sat (not b!159568) (not b!159561) (not b!159564) (not mapNonEmpty!5687) (not b!159565) tp_is_empty!3333 (not b!159570) (not b_next!3531) b_and!9945 (not start!16070) (not b!159569))
(check-sat b_and!9945 (not b_next!3531))
