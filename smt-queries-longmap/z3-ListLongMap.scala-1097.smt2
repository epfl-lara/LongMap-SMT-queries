; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22528 () Bool)

(assert start!22528)

(declare-fun b!235534 () Bool)

(declare-fun b_free!6333 () Bool)

(declare-fun b_next!6333 () Bool)

(assert (=> b!235534 (= b_free!6333 (not b_next!6333))))

(declare-fun tp!22168 () Bool)

(declare-fun b_and!13263 () Bool)

(assert (=> b!235534 (= tp!22168 b_and!13263)))

(declare-fun b!235527 () Bool)

(declare-fun res!115498 () Bool)

(declare-fun e!152957 () Bool)

(assert (=> b!235527 (=> (not res!115498) (not e!152957))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235527 (= res!115498 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235528 () Bool)

(declare-fun e!152958 () Bool)

(declare-fun tp_is_empty!6195 () Bool)

(assert (=> b!235528 (= e!152958 tp_is_empty!6195)))

(declare-fun res!115501 () Bool)

(assert (=> start!22528 (=> (not res!115501) (not e!152957))))

(declare-datatypes ((V!7907 0))(
  ( (V!7908 (val!3142 Int)) )
))
(declare-datatypes ((ValueCell!2754 0))(
  ( (ValueCellFull!2754 (v!5170 V!7907)) (EmptyCell!2754) )
))
(declare-datatypes ((array!11649 0))(
  ( (array!11650 (arr!5536 (Array (_ BitVec 32) ValueCell!2754)) (size!5873 (_ BitVec 32))) )
))
(declare-datatypes ((array!11651 0))(
  ( (array!11652 (arr!5537 (Array (_ BitVec 32) (_ BitVec 64))) (size!5874 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3408 0))(
  ( (LongMapFixedSize!3409 (defaultEntry!4375 Int) (mask!10347 (_ BitVec 32)) (extraKeys!4112 (_ BitVec 32)) (zeroValue!4216 V!7907) (minValue!4216 V!7907) (_size!1753 (_ BitVec 32)) (_keys!6451 array!11651) (_values!4358 array!11649) (_vacant!1753 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3408)

(declare-fun valid!1346 (LongMapFixedSize!3408) Bool)

(assert (=> start!22528 (= res!115501 (valid!1346 thiss!1504))))

(assert (=> start!22528 e!152957))

(declare-fun e!152960 () Bool)

(assert (=> start!22528 e!152960))

(assert (=> start!22528 true))

(declare-fun b!235529 () Bool)

(declare-fun e!152961 () Bool)

(declare-fun mapRes!10490 () Bool)

(assert (=> b!235529 (= e!152961 (and e!152958 mapRes!10490))))

(declare-fun condMapEmpty!10490 () Bool)

(declare-fun mapDefault!10490 () ValueCell!2754)

(assert (=> b!235529 (= condMapEmpty!10490 (= (arr!5536 (_values!4358 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2754)) mapDefault!10490)))))

(declare-fun mapNonEmpty!10490 () Bool)

(declare-fun tp!22169 () Bool)

(declare-fun e!152962 () Bool)

(assert (=> mapNonEmpty!10490 (= mapRes!10490 (and tp!22169 e!152962))))

(declare-fun mapKey!10490 () (_ BitVec 32))

(declare-fun mapRest!10490 () (Array (_ BitVec 32) ValueCell!2754))

(declare-fun mapValue!10490 () ValueCell!2754)

(assert (=> mapNonEmpty!10490 (= (arr!5536 (_values!4358 thiss!1504)) (store mapRest!10490 mapKey!10490 mapValue!10490))))

(declare-fun mapIsEmpty!10490 () Bool)

(assert (=> mapIsEmpty!10490 mapRes!10490))

(declare-fun b!235530 () Bool)

(declare-fun e!152959 () Bool)

(assert (=> b!235530 (= e!152957 e!152959)))

(declare-fun res!115499 () Bool)

(assert (=> b!235530 (=> (not res!115499) (not e!152959))))

(declare-datatypes ((SeekEntryResult!990 0))(
  ( (MissingZero!990 (index!6130 (_ BitVec 32))) (Found!990 (index!6131 (_ BitVec 32))) (Intermediate!990 (undefined!1802 Bool) (index!6132 (_ BitVec 32)) (x!23794 (_ BitVec 32))) (Undefined!990) (MissingVacant!990 (index!6133 (_ BitVec 32))) )
))
(declare-fun lt!119143 () SeekEntryResult!990)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235530 (= res!115499 (or (= lt!119143 (MissingZero!990 index!297)) (= lt!119143 (MissingVacant!990 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11651 (_ BitVec 32)) SeekEntryResult!990)

(assert (=> b!235530 (= lt!119143 (seekEntryOrOpen!0 key!932 (_keys!6451 thiss!1504) (mask!10347 thiss!1504)))))

(declare-fun b!235531 () Bool)

(declare-fun res!115502 () Bool)

(assert (=> b!235531 (=> (not res!115502) (not e!152959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11651 (_ BitVec 32)) Bool)

(assert (=> b!235531 (= res!115502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6451 thiss!1504) (mask!10347 thiss!1504)))))

(declare-fun b!235532 () Bool)

(declare-fun res!115503 () Bool)

(assert (=> b!235532 (=> (not res!115503) (not e!152959))))

(assert (=> b!235532 (= res!115503 (and (= (size!5873 (_values!4358 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10347 thiss!1504))) (= (size!5874 (_keys!6451 thiss!1504)) (size!5873 (_values!4358 thiss!1504))) (bvsge (mask!10347 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4112 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4112 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235533 () Bool)

(declare-fun res!115497 () Bool)

(assert (=> b!235533 (=> (not res!115497) (not e!152959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235533 (= res!115497 (validMask!0 (mask!10347 thiss!1504)))))

(declare-fun array_inv!3653 (array!11651) Bool)

(declare-fun array_inv!3654 (array!11649) Bool)

(assert (=> b!235534 (= e!152960 (and tp!22168 tp_is_empty!6195 (array_inv!3653 (_keys!6451 thiss!1504)) (array_inv!3654 (_values!4358 thiss!1504)) e!152961))))

(declare-fun b!235535 () Bool)

(declare-fun res!115500 () Bool)

(assert (=> b!235535 (=> (not res!115500) (not e!152959))))

(declare-datatypes ((tuple2!4630 0))(
  ( (tuple2!4631 (_1!2326 (_ BitVec 64)) (_2!2326 V!7907)) )
))
(declare-datatypes ((List!3539 0))(
  ( (Nil!3536) (Cons!3535 (h!4187 tuple2!4630) (t!8514 List!3539)) )
))
(declare-datatypes ((ListLongMap!3543 0))(
  ( (ListLongMap!3544 (toList!1787 List!3539)) )
))
(declare-fun contains!1664 (ListLongMap!3543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1315 (array!11651 array!11649 (_ BitVec 32) (_ BitVec 32) V!7907 V!7907 (_ BitVec 32) Int) ListLongMap!3543)

(assert (=> b!235535 (= res!115500 (contains!1664 (getCurrentListMap!1315 (_keys!6451 thiss!1504) (_values!4358 thiss!1504) (mask!10347 thiss!1504) (extraKeys!4112 thiss!1504) (zeroValue!4216 thiss!1504) (minValue!4216 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4375 thiss!1504)) key!932))))

(declare-fun b!235536 () Bool)

(assert (=> b!235536 (= e!152959 false)))

(declare-fun lt!119142 () Bool)

(declare-datatypes ((List!3540 0))(
  ( (Nil!3537) (Cons!3536 (h!4188 (_ BitVec 64)) (t!8515 List!3540)) )
))
(declare-fun arrayNoDuplicates!0 (array!11651 (_ BitVec 32) List!3540) Bool)

(assert (=> b!235536 (= lt!119142 (arrayNoDuplicates!0 (_keys!6451 thiss!1504) #b00000000000000000000000000000000 Nil!3537))))

(declare-fun b!235537 () Bool)

(assert (=> b!235537 (= e!152962 tp_is_empty!6195)))

(assert (= (and start!22528 res!115501) b!235527))

(assert (= (and b!235527 res!115498) b!235530))

(assert (= (and b!235530 res!115499) b!235535))

(assert (= (and b!235535 res!115500) b!235533))

(assert (= (and b!235533 res!115497) b!235532))

(assert (= (and b!235532 res!115503) b!235531))

(assert (= (and b!235531 res!115502) b!235536))

(assert (= (and b!235529 condMapEmpty!10490) mapIsEmpty!10490))

(assert (= (and b!235529 (not condMapEmpty!10490)) mapNonEmpty!10490))

(get-info :version)

(assert (= (and mapNonEmpty!10490 ((_ is ValueCellFull!2754) mapValue!10490)) b!235537))

(assert (= (and b!235529 ((_ is ValueCellFull!2754) mapDefault!10490)) b!235528))

(assert (= b!235534 b!235529))

(assert (= start!22528 b!235534))

(declare-fun m!256613 () Bool)

(assert (=> b!235534 m!256613))

(declare-fun m!256615 () Bool)

(assert (=> b!235534 m!256615))

(declare-fun m!256617 () Bool)

(assert (=> b!235530 m!256617))

(declare-fun m!256619 () Bool)

(assert (=> b!235536 m!256619))

(declare-fun m!256621 () Bool)

(assert (=> b!235531 m!256621))

(declare-fun m!256623 () Bool)

(assert (=> b!235533 m!256623))

(declare-fun m!256625 () Bool)

(assert (=> b!235535 m!256625))

(assert (=> b!235535 m!256625))

(declare-fun m!256627 () Bool)

(assert (=> b!235535 m!256627))

(declare-fun m!256629 () Bool)

(assert (=> mapNonEmpty!10490 m!256629))

(declare-fun m!256631 () Bool)

(assert (=> start!22528 m!256631))

(check-sat tp_is_empty!6195 (not b!235533) (not b!235535) (not b_next!6333) (not b!235534) b_and!13263 (not b!235530) (not b!235531) (not mapNonEmpty!10490) (not start!22528) (not b!235536))
(check-sat b_and!13263 (not b_next!6333))
