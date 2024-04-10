; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18388 () Bool)

(assert start!18388)

(declare-fun b!182404 () Bool)

(declare-fun b_free!4499 () Bool)

(declare-fun b_next!4499 () Bool)

(assert (=> b!182404 (= b_free!4499 (not b_next!4499))))

(declare-fun tp!16255 () Bool)

(declare-fun b_and!11061 () Bool)

(assert (=> b!182404 (= tp!16255 b_and!11061)))

(declare-fun b!182402 () Bool)

(declare-fun res!86327 () Bool)

(declare-fun e!120110 () Bool)

(assert (=> b!182402 (=> (not res!86327) (not e!120110))))

(declare-datatypes ((V!5341 0))(
  ( (V!5342 (val!2180 Int)) )
))
(declare-datatypes ((ValueCell!1792 0))(
  ( (ValueCellFull!1792 (v!4079 V!5341)) (EmptyCell!1792) )
))
(declare-datatypes ((array!7727 0))(
  ( (array!7728 (arr!3655 (Array (_ BitVec 32) (_ BitVec 64))) (size!3967 (_ BitVec 32))) )
))
(declare-datatypes ((array!7729 0))(
  ( (array!7730 (arr!3656 (Array (_ BitVec 32) ValueCell!1792)) (size!3968 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2492 0))(
  ( (LongMapFixedSize!2493 (defaultEntry!3732 Int) (mask!8773 (_ BitVec 32)) (extraKeys!3469 (_ BitVec 32)) (zeroValue!3573 V!5341) (minValue!3573 V!5341) (_size!1295 (_ BitVec 32)) (_keys!5643 array!7727) (_values!3715 array!7729) (_vacant!1295 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2492)

(assert (=> b!182402 (= res!86327 (and (= (size!3968 (_values!3715 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8773 thiss!1248))) (= (size!3967 (_keys!5643 thiss!1248)) (size!3968 (_values!3715 thiss!1248))) (bvsge (mask!8773 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3469 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3469 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182403 () Bool)

(declare-fun e!120116 () Bool)

(declare-fun tp_is_empty!4271 () Bool)

(assert (=> b!182403 (= e!120116 tp_is_empty!4271)))

(declare-fun e!120111 () Bool)

(declare-fun e!120113 () Bool)

(declare-fun array_inv!2357 (array!7727) Bool)

(declare-fun array_inv!2358 (array!7729) Bool)

(assert (=> b!182404 (= e!120111 (and tp!16255 tp_is_empty!4271 (array_inv!2357 (_keys!5643 thiss!1248)) (array_inv!2358 (_values!3715 thiss!1248)) e!120113))))

(declare-fun mapIsEmpty!7328 () Bool)

(declare-fun mapRes!7328 () Bool)

(assert (=> mapIsEmpty!7328 mapRes!7328))

(declare-fun b!182405 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7727 (_ BitVec 32)) Bool)

(assert (=> b!182405 (= e!120110 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5643 thiss!1248) (mask!8773 thiss!1248))))))

(declare-fun b!182406 () Bool)

(declare-fun res!86330 () Bool)

(declare-fun e!120114 () Bool)

(assert (=> b!182406 (=> (not res!86330) (not e!120114))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182406 (= res!86330 (not (= key!828 (bvneg key!828))))))

(declare-fun res!86326 () Bool)

(assert (=> start!18388 (=> (not res!86326) (not e!120114))))

(declare-fun valid!1032 (LongMapFixedSize!2492) Bool)

(assert (=> start!18388 (= res!86326 (valid!1032 thiss!1248))))

(assert (=> start!18388 e!120114))

(assert (=> start!18388 e!120111))

(assert (=> start!18388 true))

(declare-fun b!182407 () Bool)

(declare-fun e!120112 () Bool)

(assert (=> b!182407 (= e!120112 tp_is_empty!4271)))

(declare-fun b!182408 () Bool)

(declare-fun res!86328 () Bool)

(assert (=> b!182408 (=> (not res!86328) (not e!120110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182408 (= res!86328 (validMask!0 (mask!8773 thiss!1248)))))

(declare-fun mapNonEmpty!7328 () Bool)

(declare-fun tp!16256 () Bool)

(assert (=> mapNonEmpty!7328 (= mapRes!7328 (and tp!16256 e!120116))))

(declare-fun mapValue!7328 () ValueCell!1792)

(declare-fun mapRest!7328 () (Array (_ BitVec 32) ValueCell!1792))

(declare-fun mapKey!7328 () (_ BitVec 32))

(assert (=> mapNonEmpty!7328 (= (arr!3656 (_values!3715 thiss!1248)) (store mapRest!7328 mapKey!7328 mapValue!7328))))

(declare-fun b!182409 () Bool)

(assert (=> b!182409 (= e!120114 e!120110)))

(declare-fun res!86329 () Bool)

(assert (=> b!182409 (=> (not res!86329) (not e!120110))))

(declare-datatypes ((SeekEntryResult!606 0))(
  ( (MissingZero!606 (index!4594 (_ BitVec 32))) (Found!606 (index!4595 (_ BitVec 32))) (Intermediate!606 (undefined!1418 Bool) (index!4596 (_ BitVec 32)) (x!19880 (_ BitVec 32))) (Undefined!606) (MissingVacant!606 (index!4597 (_ BitVec 32))) )
))
(declare-fun lt!90196 () SeekEntryResult!606)

(assert (=> b!182409 (= res!86329 (and (not (is-Undefined!606 lt!90196)) (not (is-MissingVacant!606 lt!90196)) (not (is-MissingZero!606 lt!90196)) (is-Found!606 lt!90196)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7727 (_ BitVec 32)) SeekEntryResult!606)

(assert (=> b!182409 (= lt!90196 (seekEntryOrOpen!0 key!828 (_keys!5643 thiss!1248) (mask!8773 thiss!1248)))))

(declare-fun b!182410 () Bool)

(assert (=> b!182410 (= e!120113 (and e!120112 mapRes!7328))))

(declare-fun condMapEmpty!7328 () Bool)

(declare-fun mapDefault!7328 () ValueCell!1792)

