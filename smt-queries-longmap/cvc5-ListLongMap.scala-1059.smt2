; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22036 () Bool)

(assert start!22036)

(declare-fun b!227469 () Bool)

(declare-fun b_free!6103 () Bool)

(declare-fun b_next!6103 () Bool)

(assert (=> b!227469 (= b_free!6103 (not b_next!6103))))

(declare-fun tp!21451 () Bool)

(declare-fun b_and!13001 () Bool)

(assert (=> b!227469 (= tp!21451 b_and!13001)))

(declare-fun e!147571 () Bool)

(declare-fun tp_is_empty!5965 () Bool)

(declare-datatypes ((V!7601 0))(
  ( (V!7602 (val!3027 Int)) )
))
(declare-datatypes ((ValueCell!2639 0))(
  ( (ValueCellFull!2639 (v!5047 V!7601)) (EmptyCell!2639) )
))
(declare-datatypes ((array!11173 0))(
  ( (array!11174 (arr!5306 (Array (_ BitVec 32) ValueCell!2639)) (size!5639 (_ BitVec 32))) )
))
(declare-datatypes ((array!11175 0))(
  ( (array!11176 (arr!5307 (Array (_ BitVec 32) (_ BitVec 64))) (size!5640 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3178 0))(
  ( (LongMapFixedSize!3179 (defaultEntry!4248 Int) (mask!10110 (_ BitVec 32)) (extraKeys!3985 (_ BitVec 32)) (zeroValue!4089 V!7601) (minValue!4089 V!7601) (_size!1638 (_ BitVec 32)) (_keys!6302 array!11175) (_values!4231 array!11173) (_vacant!1638 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3178)

(declare-fun e!147581 () Bool)

(declare-fun array_inv!3507 (array!11175) Bool)

(declare-fun array_inv!3508 (array!11173) Bool)

(assert (=> b!227469 (= e!147571 (and tp!21451 tp_is_empty!5965 (array_inv!3507 (_keys!6302 thiss!1504)) (array_inv!3508 (_values!4231 thiss!1504)) e!147581))))

(declare-fun b!227470 () Bool)

(declare-fun e!147573 () Bool)

(declare-fun call!21143 () Bool)

(assert (=> b!227470 (= e!147573 (not call!21143))))

(declare-fun bm!21140 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21140 (= call!21143 (arrayContainsKey!0 (_keys!6302 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227471 () Bool)

(declare-fun e!147580 () Bool)

(declare-fun e!147575 () Bool)

(assert (=> b!227471 (= e!147580 e!147575)))

(declare-fun res!111984 () Bool)

(declare-fun call!21144 () Bool)

(assert (=> b!227471 (= res!111984 call!21144)))

(assert (=> b!227471 (=> (not res!111984) (not e!147575))))

(declare-fun b!227472 () Bool)

(declare-fun res!111976 () Bool)

(assert (=> b!227472 (=> (not res!111976) (not e!147573))))

(assert (=> b!227472 (= res!111976 call!21144)))

(declare-fun e!147578 () Bool)

(assert (=> b!227472 (= e!147578 e!147573)))

(declare-fun b!227473 () Bool)

(declare-fun res!111985 () Bool)

(assert (=> b!227473 (=> (not res!111985) (not e!147573))))

(declare-datatypes ((SeekEntryResult!895 0))(
  ( (MissingZero!895 (index!5750 (_ BitVec 32))) (Found!895 (index!5751 (_ BitVec 32))) (Intermediate!895 (undefined!1707 Bool) (index!5752 (_ BitVec 32)) (x!23283 (_ BitVec 32))) (Undefined!895) (MissingVacant!895 (index!5753 (_ BitVec 32))) )
))
(declare-fun lt!114473 () SeekEntryResult!895)

(assert (=> b!227473 (= res!111985 (= (select (arr!5307 (_keys!6302 thiss!1504)) (index!5750 lt!114473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227474 () Bool)

(declare-fun res!111978 () Bool)

(assert (=> b!227474 (= res!111978 (= (select (arr!5307 (_keys!6302 thiss!1504)) (index!5753 lt!114473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227474 (=> (not res!111978) (not e!147575))))

(declare-fun b!227476 () Bool)

(declare-fun e!147579 () Bool)

(assert (=> b!227476 (= e!147579 true)))

(declare-fun lt!114467 () Bool)

(declare-datatypes ((List!3392 0))(
  ( (Nil!3389) (Cons!3388 (h!4036 (_ BitVec 64)) (t!8351 List!3392)) )
))
(declare-fun arrayNoDuplicates!0 (array!11175 (_ BitVec 32) List!3392) Bool)

(assert (=> b!227476 (= lt!114467 (arrayNoDuplicates!0 (_keys!6302 thiss!1504) #b00000000000000000000000000000000 Nil!3389))))

(declare-fun b!227477 () Bool)

(declare-fun e!147572 () Bool)

(assert (=> b!227477 (= e!147572 (not e!147579))))

(declare-fun res!111979 () Bool)

(assert (=> b!227477 (=> res!111979 e!147579)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227477 (= res!111979 (not (validMask!0 (mask!10110 thiss!1504))))))

(declare-fun lt!114470 () array!11175)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11175 (_ BitVec 32)) Bool)

(assert (=> b!227477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114470 (mask!10110 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6899 0))(
  ( (Unit!6900) )
))
(declare-fun lt!114465 () Unit!6899)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11175 (_ BitVec 32) (_ BitVec 32)) Unit!6899)

(assert (=> b!227477 (= lt!114465 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6302 thiss!1504) index!297 (mask!10110 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11175 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227477 (= (arrayCountValidKeys!0 lt!114470 #b00000000000000000000000000000000 (size!5640 (_keys!6302 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6302 thiss!1504) #b00000000000000000000000000000000 (size!5640 (_keys!6302 thiss!1504)))))))

(declare-fun lt!114468 () Unit!6899)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11175 (_ BitVec 32) (_ BitVec 64)) Unit!6899)

(assert (=> b!227477 (= lt!114468 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6302 thiss!1504) index!297 key!932))))

(assert (=> b!227477 (arrayNoDuplicates!0 lt!114470 #b00000000000000000000000000000000 Nil!3389)))

(assert (=> b!227477 (= lt!114470 (array!11176 (store (arr!5307 (_keys!6302 thiss!1504)) index!297 key!932) (size!5640 (_keys!6302 thiss!1504))))))

(declare-fun lt!114471 () Unit!6899)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11175 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3392) Unit!6899)

(assert (=> b!227477 (= lt!114471 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6302 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3389))))

(declare-fun lt!114466 () Unit!6899)

(declare-fun e!147584 () Unit!6899)

(assert (=> b!227477 (= lt!114466 e!147584)))

(declare-fun c!37714 () Bool)

(assert (=> b!227477 (= c!37714 (arrayContainsKey!0 (_keys!6302 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227478 () Bool)

(declare-fun res!111975 () Bool)

(assert (=> b!227478 (=> res!111975 e!147579)))

(assert (=> b!227478 (= res!111975 (or (not (= (size!5639 (_values!4231 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10110 thiss!1504)))) (not (= (size!5640 (_keys!6302 thiss!1504)) (size!5639 (_values!4231 thiss!1504)))) (bvslt (mask!10110 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3985 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3985 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!10117 () Bool)

(declare-fun mapRes!10117 () Bool)

(declare-fun tp!21450 () Bool)

(declare-fun e!147583 () Bool)

(assert (=> mapNonEmpty!10117 (= mapRes!10117 (and tp!21450 e!147583))))

(declare-fun mapKey!10117 () (_ BitVec 32))

(declare-fun mapValue!10117 () ValueCell!2639)

(declare-fun mapRest!10117 () (Array (_ BitVec 32) ValueCell!2639))

(assert (=> mapNonEmpty!10117 (= (arr!5306 (_values!4231 thiss!1504)) (store mapRest!10117 mapKey!10117 mapValue!10117))))

(declare-fun b!227479 () Bool)

(assert (=> b!227479 (= e!147583 tp_is_empty!5965)))

(declare-fun b!227480 () Bool)

(declare-fun e!147577 () Bool)

(declare-fun e!147570 () Bool)

(assert (=> b!227480 (= e!147577 e!147570)))

(declare-fun res!111977 () Bool)

(assert (=> b!227480 (=> (not res!111977) (not e!147570))))

(assert (=> b!227480 (= res!111977 (or (= lt!114473 (MissingZero!895 index!297)) (= lt!114473 (MissingVacant!895 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11175 (_ BitVec 32)) SeekEntryResult!895)

(assert (=> b!227480 (= lt!114473 (seekEntryOrOpen!0 key!932 (_keys!6302 thiss!1504) (mask!10110 thiss!1504)))))

(declare-fun b!227481 () Bool)

(declare-fun e!147574 () Unit!6899)

(declare-fun lt!114469 () Unit!6899)

(assert (=> b!227481 (= e!147574 lt!114469)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!279 (array!11175 array!11173 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) Int) Unit!6899)

(assert (=> b!227481 (= lt!114469 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!279 (_keys!6302 thiss!1504) (_values!4231 thiss!1504) (mask!10110 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 (defaultEntry!4248 thiss!1504)))))

(declare-fun c!37713 () Bool)

(assert (=> b!227481 (= c!37713 (is-MissingZero!895 lt!114473))))

(assert (=> b!227481 e!147578))

(declare-fun b!227482 () Bool)

(declare-fun Unit!6901 () Unit!6899)

(assert (=> b!227482 (= e!147584 Unit!6901)))

(declare-fun b!227483 () Bool)

(assert (=> b!227483 (= e!147570 e!147572)))

(declare-fun res!111982 () Bool)

(assert (=> b!227483 (=> (not res!111982) (not e!147572))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227483 (= res!111982 (inRange!0 index!297 (mask!10110 thiss!1504)))))

(declare-fun lt!114472 () Unit!6899)

(assert (=> b!227483 (= lt!114472 e!147574)))

(declare-fun c!37715 () Bool)

(declare-datatypes ((tuple2!4472 0))(
  ( (tuple2!4473 (_1!2247 (_ BitVec 64)) (_2!2247 V!7601)) )
))
(declare-datatypes ((List!3393 0))(
  ( (Nil!3390) (Cons!3389 (h!4037 tuple2!4472) (t!8352 List!3393)) )
))
(declare-datatypes ((ListLongMap!3385 0))(
  ( (ListLongMap!3386 (toList!1708 List!3393)) )
))
(declare-fun contains!1582 (ListLongMap!3385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1236 (array!11175 array!11173 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 32) Int) ListLongMap!3385)

(assert (=> b!227483 (= c!37715 (contains!1582 (getCurrentListMap!1236 (_keys!6302 thiss!1504) (_values!4231 thiss!1504) (mask!10110 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4248 thiss!1504)) key!932))))

(declare-fun b!227484 () Bool)

(declare-fun e!147576 () Bool)

(assert (=> b!227484 (= e!147581 (and e!147576 mapRes!10117))))

(declare-fun condMapEmpty!10117 () Bool)

(declare-fun mapDefault!10117 () ValueCell!2639)

