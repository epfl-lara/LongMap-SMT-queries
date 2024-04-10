; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18432 () Bool)

(assert start!18432)

(declare-fun b!182826 () Bool)

(declare-fun b_free!4509 () Bool)

(declare-fun b_next!4509 () Bool)

(assert (=> b!182826 (= b_free!4509 (not b_next!4509))))

(declare-fun tp!16292 () Bool)

(declare-fun b_and!11075 () Bool)

(assert (=> b!182826 (= tp!16292 b_and!11075)))

(declare-fun b!182823 () Bool)

(declare-fun res!86534 () Bool)

(declare-fun e!120374 () Bool)

(assert (=> b!182823 (=> (not res!86534) (not e!120374))))

(declare-datatypes ((V!5355 0))(
  ( (V!5356 (val!2185 Int)) )
))
(declare-datatypes ((ValueCell!1797 0))(
  ( (ValueCellFull!1797 (v!4086 V!5355)) (EmptyCell!1797) )
))
(declare-datatypes ((array!7751 0))(
  ( (array!7752 (arr!3665 (Array (_ BitVec 32) (_ BitVec 64))) (size!3977 (_ BitVec 32))) )
))
(declare-datatypes ((array!7753 0))(
  ( (array!7754 (arr!3666 (Array (_ BitVec 32) ValueCell!1797)) (size!3978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2502 0))(
  ( (LongMapFixedSize!2503 (defaultEntry!3739 Int) (mask!8790 (_ BitVec 32)) (extraKeys!3476 (_ BitVec 32)) (zeroValue!3580 V!5355) (minValue!3580 V!5355) (_size!1300 (_ BitVec 32)) (_keys!5654 array!7751) (_values!3722 array!7753) (_vacant!1300 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2502)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7751 (_ BitVec 32)) Bool)

(assert (=> b!182823 (= res!86534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5654 thiss!1248) (mask!8790 thiss!1248)))))

(declare-fun mapIsEmpty!7349 () Bool)

(declare-fun mapRes!7349 () Bool)

(assert (=> mapIsEmpty!7349 mapRes!7349))

(declare-fun b!182824 () Bool)

(declare-fun res!86533 () Bool)

(assert (=> b!182824 (=> (not res!86533) (not e!120374))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3406 0))(
  ( (tuple2!3407 (_1!1714 (_ BitVec 64)) (_2!1714 V!5355)) )
))
(declare-datatypes ((List!2324 0))(
  ( (Nil!2321) (Cons!2320 (h!2949 tuple2!3406) (t!7188 List!2324)) )
))
(declare-datatypes ((ListLongMap!2323 0))(
  ( (ListLongMap!2324 (toList!1177 List!2324)) )
))
(declare-fun contains!1262 (ListLongMap!2323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!825 (array!7751 array!7753 (_ BitVec 32) (_ BitVec 32) V!5355 V!5355 (_ BitVec 32) Int) ListLongMap!2323)

(assert (=> b!182824 (= res!86533 (contains!1262 (getCurrentListMap!825 (_keys!5654 thiss!1248) (_values!3722 thiss!1248) (mask!8790 thiss!1248) (extraKeys!3476 thiss!1248) (zeroValue!3580 thiss!1248) (minValue!3580 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3739 thiss!1248)) key!828))))

(declare-fun b!182825 () Bool)

(declare-fun e!120373 () Bool)

(declare-fun e!120376 () Bool)

(assert (=> b!182825 (= e!120373 (and e!120376 mapRes!7349))))

(declare-fun condMapEmpty!7349 () Bool)

(declare-fun mapDefault!7349 () ValueCell!1797)

(assert (=> b!182825 (= condMapEmpty!7349 (= (arr!3666 (_values!3722 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1797)) mapDefault!7349)))))

(declare-fun tp_is_empty!4281 () Bool)

(declare-fun e!120377 () Bool)

(declare-fun array_inv!2367 (array!7751) Bool)

(declare-fun array_inv!2368 (array!7753) Bool)

(assert (=> b!182826 (= e!120377 (and tp!16292 tp_is_empty!4281 (array_inv!2367 (_keys!5654 thiss!1248)) (array_inv!2368 (_values!3722 thiss!1248)) e!120373))))

(declare-fun b!182827 () Bool)

(declare-fun e!120372 () Bool)

(assert (=> b!182827 (= e!120372 tp_is_empty!4281)))

(declare-fun b!182828 () Bool)

(declare-fun res!86531 () Bool)

(assert (=> b!182828 (=> (not res!86531) (not e!120374))))

(assert (=> b!182828 (= res!86531 (and (= (size!3978 (_values!3722 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8790 thiss!1248))) (= (size!3977 (_keys!5654 thiss!1248)) (size!3978 (_values!3722 thiss!1248))) (bvsge (mask!8790 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3476 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3476 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!86529 () Bool)

(declare-fun e!120371 () Bool)

(assert (=> start!18432 (=> (not res!86529) (not e!120371))))

(declare-fun valid!1037 (LongMapFixedSize!2502) Bool)

(assert (=> start!18432 (= res!86529 (valid!1037 thiss!1248))))

(assert (=> start!18432 e!120371))

(assert (=> start!18432 e!120377))

(assert (=> start!18432 true))

(declare-fun b!182829 () Bool)

(assert (=> b!182829 (= e!120374 false)))

(declare-fun lt!90408 () Bool)

(declare-datatypes ((List!2325 0))(
  ( (Nil!2322) (Cons!2321 (h!2950 (_ BitVec 64)) (t!7189 List!2325)) )
))
(declare-fun arrayNoDuplicates!0 (array!7751 (_ BitVec 32) List!2325) Bool)

(assert (=> b!182829 (= lt!90408 (arrayNoDuplicates!0 (_keys!5654 thiss!1248) #b00000000000000000000000000000000 Nil!2322))))

(declare-fun b!182830 () Bool)

(declare-fun res!86535 () Bool)

(assert (=> b!182830 (=> (not res!86535) (not e!120371))))

(assert (=> b!182830 (= res!86535 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7349 () Bool)

(declare-fun tp!16291 () Bool)

(assert (=> mapNonEmpty!7349 (= mapRes!7349 (and tp!16291 e!120372))))

(declare-fun mapRest!7349 () (Array (_ BitVec 32) ValueCell!1797))

(declare-fun mapValue!7349 () ValueCell!1797)

(declare-fun mapKey!7349 () (_ BitVec 32))

(assert (=> mapNonEmpty!7349 (= (arr!3666 (_values!3722 thiss!1248)) (store mapRest!7349 mapKey!7349 mapValue!7349))))

(declare-fun b!182831 () Bool)

(declare-fun res!86532 () Bool)

(assert (=> b!182831 (=> (not res!86532) (not e!120374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182831 (= res!86532 (validMask!0 (mask!8790 thiss!1248)))))

(declare-fun b!182832 () Bool)

(assert (=> b!182832 (= e!120371 e!120374)))

(declare-fun res!86530 () Bool)

(assert (=> b!182832 (=> (not res!86530) (not e!120374))))

(declare-datatypes ((SeekEntryResult!611 0))(
  ( (MissingZero!611 (index!4614 (_ BitVec 32))) (Found!611 (index!4615 (_ BitVec 32))) (Intermediate!611 (undefined!1423 Bool) (index!4616 (_ BitVec 32)) (x!19921 (_ BitVec 32))) (Undefined!611) (MissingVacant!611 (index!4617 (_ BitVec 32))) )
))
(declare-fun lt!90409 () SeekEntryResult!611)

(get-info :version)

(assert (=> b!182832 (= res!86530 (and (not ((_ is Undefined!611) lt!90409)) (not ((_ is MissingVacant!611) lt!90409)) (not ((_ is MissingZero!611) lt!90409)) ((_ is Found!611) lt!90409)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7751 (_ BitVec 32)) SeekEntryResult!611)

(assert (=> b!182832 (= lt!90409 (seekEntryOrOpen!0 key!828 (_keys!5654 thiss!1248) (mask!8790 thiss!1248)))))

(declare-fun b!182833 () Bool)

(assert (=> b!182833 (= e!120376 tp_is_empty!4281)))

(assert (= (and start!18432 res!86529) b!182830))

(assert (= (and b!182830 res!86535) b!182832))

(assert (= (and b!182832 res!86530) b!182824))

(assert (= (and b!182824 res!86533) b!182831))

(assert (= (and b!182831 res!86532) b!182828))

(assert (= (and b!182828 res!86531) b!182823))

(assert (= (and b!182823 res!86534) b!182829))

(assert (= (and b!182825 condMapEmpty!7349) mapIsEmpty!7349))

(assert (= (and b!182825 (not condMapEmpty!7349)) mapNonEmpty!7349))

(assert (= (and mapNonEmpty!7349 ((_ is ValueCellFull!1797) mapValue!7349)) b!182827))

(assert (= (and b!182825 ((_ is ValueCellFull!1797) mapDefault!7349)) b!182833))

(assert (= b!182826 b!182825))

(assert (= start!18432 b!182826))

(declare-fun m!210489 () Bool)

(assert (=> b!182832 m!210489))

(declare-fun m!210491 () Bool)

(assert (=> b!182831 m!210491))

(declare-fun m!210493 () Bool)

(assert (=> mapNonEmpty!7349 m!210493))

(declare-fun m!210495 () Bool)

(assert (=> b!182824 m!210495))

(assert (=> b!182824 m!210495))

(declare-fun m!210497 () Bool)

(assert (=> b!182824 m!210497))

(declare-fun m!210499 () Bool)

(assert (=> b!182829 m!210499))

(declare-fun m!210501 () Bool)

(assert (=> start!18432 m!210501))

(declare-fun m!210503 () Bool)

(assert (=> b!182826 m!210503))

(declare-fun m!210505 () Bool)

(assert (=> b!182826 m!210505))

(declare-fun m!210507 () Bool)

(assert (=> b!182823 m!210507))

(check-sat tp_is_empty!4281 (not start!18432) (not b!182831) (not b_next!4509) (not b!182823) (not b!182826) (not b!182824) (not b!182832) (not b!182829) (not mapNonEmpty!7349) b_and!11075)
(check-sat b_and!11075 (not b_next!4509))
