; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22900 () Bool)

(assert start!22900)

(declare-fun b!238534 () Bool)

(declare-fun b_free!6403 () Bool)

(declare-fun b_next!6403 () Bool)

(assert (=> b!238534 (= b_free!6403 (not b_next!6403))))

(declare-fun tp!22413 () Bool)

(declare-fun b_and!13369 () Bool)

(assert (=> b!238534 (= tp!22413 b_and!13369)))

(declare-fun b!238532 () Bool)

(declare-fun res!116890 () Bool)

(declare-fun e!154868 () Bool)

(assert (=> b!238532 (=> (not res!116890) (not e!154868))))

(declare-datatypes ((V!8001 0))(
  ( (V!8002 (val!3177 Int)) )
))
(declare-datatypes ((ValueCell!2789 0))(
  ( (ValueCellFull!2789 (v!5215 V!8001)) (EmptyCell!2789) )
))
(declare-datatypes ((array!11809 0))(
  ( (array!11810 (arr!5606 (Array (_ BitVec 32) ValueCell!2789)) (size!5947 (_ BitVec 32))) )
))
(declare-datatypes ((array!11811 0))(
  ( (array!11812 (arr!5607 (Array (_ BitVec 32) (_ BitVec 64))) (size!5948 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3478 0))(
  ( (LongMapFixedSize!3479 (defaultEntry!4424 Int) (mask!10460 (_ BitVec 32)) (extraKeys!4161 (_ BitVec 32)) (zeroValue!4265 V!8001) (minValue!4265 V!8001) (_size!1788 (_ BitVec 32)) (_keys!6526 array!11811) (_values!4407 array!11809) (_vacant!1788 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3478)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11811 (_ BitVec 32)) Bool)

(assert (=> b!238532 (= res!116890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6526 thiss!1504) (mask!10460 thiss!1504)))))

(declare-fun b!238533 () Bool)

(declare-fun e!154867 () Bool)

(declare-fun tp_is_empty!6265 () Bool)

(assert (=> b!238533 (= e!154867 tp_is_empty!6265)))

(declare-fun e!154869 () Bool)

(declare-fun e!154871 () Bool)

(declare-fun array_inv!3707 (array!11811) Bool)

(declare-fun array_inv!3708 (array!11809) Bool)

(assert (=> b!238534 (= e!154869 (and tp!22413 tp_is_empty!6265 (array_inv!3707 (_keys!6526 thiss!1504)) (array_inv!3708 (_values!4407 thiss!1504)) e!154871))))

(declare-fun b!238535 () Bool)

(declare-fun e!154866 () Bool)

(assert (=> b!238535 (= e!154866 tp_is_empty!6265)))

(declare-fun b!238536 () Bool)

(declare-fun res!116888 () Bool)

(declare-fun e!154872 () Bool)

(assert (=> b!238536 (=> (not res!116888) (not e!154872))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!238536 (= res!116888 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238537 () Bool)

(declare-fun res!116894 () Bool)

(assert (=> b!238537 (=> (not res!116894) (not e!154868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238537 (= res!116894 (validMask!0 (mask!10460 thiss!1504)))))

(declare-fun b!238538 () Bool)

(assert (=> b!238538 (= e!154868 false)))

(declare-fun lt!120608 () Bool)

(declare-datatypes ((List!3581 0))(
  ( (Nil!3578) (Cons!3577 (h!4233 (_ BitVec 64)) (t!8576 List!3581)) )
))
(declare-fun arrayNoDuplicates!0 (array!11811 (_ BitVec 32) List!3581) Bool)

(assert (=> b!238538 (= lt!120608 (arrayNoDuplicates!0 (_keys!6526 thiss!1504) #b00000000000000000000000000000000 Nil!3578))))

(declare-fun b!238539 () Bool)

(declare-fun res!116891 () Bool)

(assert (=> b!238539 (=> (not res!116891) (not e!154868))))

(assert (=> b!238539 (= res!116891 (and (= (size!5947 (_values!4407 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10460 thiss!1504))) (= (size!5948 (_keys!6526 thiss!1504)) (size!5947 (_values!4407 thiss!1504))) (bvsge (mask!10460 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4161 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4161 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238541 () Bool)

(assert (=> b!238541 (= e!154872 e!154868)))

(declare-fun res!116892 () Bool)

(assert (=> b!238541 (=> (not res!116892) (not e!154868))))

(declare-datatypes ((SeekEntryResult!1018 0))(
  ( (MissingZero!1018 (index!6242 (_ BitVec 32))) (Found!1018 (index!6243 (_ BitVec 32))) (Intermediate!1018 (undefined!1830 Bool) (index!6244 (_ BitVec 32)) (x!24050 (_ BitVec 32))) (Undefined!1018) (MissingVacant!1018 (index!6245 (_ BitVec 32))) )
))
(declare-fun lt!120609 () SeekEntryResult!1018)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238541 (= res!116892 (or (= lt!120609 (MissingZero!1018 index!297)) (= lt!120609 (MissingVacant!1018 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11811 (_ BitVec 32)) SeekEntryResult!1018)

(assert (=> b!238541 (= lt!120609 (seekEntryOrOpen!0 key!932 (_keys!6526 thiss!1504) (mask!10460 thiss!1504)))))

(declare-fun mapNonEmpty!10629 () Bool)

(declare-fun mapRes!10629 () Bool)

(declare-fun tp!22412 () Bool)

(assert (=> mapNonEmpty!10629 (= mapRes!10629 (and tp!22412 e!154867))))

(declare-fun mapRest!10629 () (Array (_ BitVec 32) ValueCell!2789))

(declare-fun mapValue!10629 () ValueCell!2789)

(declare-fun mapKey!10629 () (_ BitVec 32))

(assert (=> mapNonEmpty!10629 (= (arr!5606 (_values!4407 thiss!1504)) (store mapRest!10629 mapKey!10629 mapValue!10629))))

(declare-fun mapIsEmpty!10629 () Bool)

(assert (=> mapIsEmpty!10629 mapRes!10629))

(declare-fun b!238542 () Bool)

(declare-fun res!116893 () Bool)

(assert (=> b!238542 (=> (not res!116893) (not e!154868))))

(declare-datatypes ((tuple2!4684 0))(
  ( (tuple2!4685 (_1!2353 (_ BitVec 64)) (_2!2353 V!8001)) )
))
(declare-datatypes ((List!3582 0))(
  ( (Nil!3579) (Cons!3578 (h!4234 tuple2!4684) (t!8577 List!3582)) )
))
(declare-datatypes ((ListLongMap!3597 0))(
  ( (ListLongMap!3598 (toList!1814 List!3582)) )
))
(declare-fun contains!1702 (ListLongMap!3597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1342 (array!11811 array!11809 (_ BitVec 32) (_ BitVec 32) V!8001 V!8001 (_ BitVec 32) Int) ListLongMap!3597)

(assert (=> b!238542 (= res!116893 (not (contains!1702 (getCurrentListMap!1342 (_keys!6526 thiss!1504) (_values!4407 thiss!1504) (mask!10460 thiss!1504) (extraKeys!4161 thiss!1504) (zeroValue!4265 thiss!1504) (minValue!4265 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4424 thiss!1504)) key!932)))))

(declare-fun b!238540 () Bool)

(assert (=> b!238540 (= e!154871 (and e!154866 mapRes!10629))))

(declare-fun condMapEmpty!10629 () Bool)

(declare-fun mapDefault!10629 () ValueCell!2789)

