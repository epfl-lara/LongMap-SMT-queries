; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22072 () Bool)

(assert start!22072)

(declare-fun b!228733 () Bool)

(declare-fun b_free!6139 () Bool)

(declare-fun b_next!6139 () Bool)

(assert (=> b!228733 (= b_free!6139 (not b_next!6139))))

(declare-fun tp!21558 () Bool)

(declare-fun b_and!13037 () Bool)

(assert (=> b!228733 (= tp!21558 b_and!13037)))

(declare-fun c!37930 () Bool)

(declare-datatypes ((V!7649 0))(
  ( (V!7650 (val!3045 Int)) )
))
(declare-datatypes ((ValueCell!2657 0))(
  ( (ValueCellFull!2657 (v!5065 V!7649)) (EmptyCell!2657) )
))
(declare-datatypes ((array!11245 0))(
  ( (array!11246 (arr!5342 (Array (_ BitVec 32) ValueCell!2657)) (size!5675 (_ BitVec 32))) )
))
(declare-datatypes ((array!11247 0))(
  ( (array!11248 (arr!5343 (Array (_ BitVec 32) (_ BitVec 64))) (size!5676 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3214 0))(
  ( (LongMapFixedSize!3215 (defaultEntry!4266 Int) (mask!10140 (_ BitVec 32)) (extraKeys!4003 (_ BitVec 32)) (zeroValue!4107 V!7649) (minValue!4107 V!7649) (_size!1656 (_ BitVec 32)) (_keys!6320 array!11247) (_values!4249 array!11245) (_vacant!1656 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3214)

(declare-fun bm!21248 () Bool)

(declare-fun call!21252 () Bool)

(declare-datatypes ((SeekEntryResult!911 0))(
  ( (MissingZero!911 (index!5814 (_ BitVec 32))) (Found!911 (index!5815 (_ BitVec 32))) (Intermediate!911 (undefined!1723 Bool) (index!5816 (_ BitVec 32)) (x!23347 (_ BitVec 32))) (Undefined!911) (MissingVacant!911 (index!5817 (_ BitVec 32))) )
))
(declare-fun lt!115065 () SeekEntryResult!911)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21248 (= call!21252 (inRange!0 (ite c!37930 (index!5814 lt!115065) (index!5817 lt!115065)) (mask!10140 thiss!1504)))))

(declare-fun b!228712 () Bool)

(declare-fun e!148380 () Bool)

(declare-fun call!21251 () Bool)

(assert (=> b!228712 (= e!148380 (not call!21251))))

(declare-fun b!228713 () Bool)

(declare-fun e!148383 () Bool)

(declare-fun e!148385 () Bool)

(assert (=> b!228713 (= e!148383 (not e!148385))))

(declare-fun res!112575 () Bool)

(assert (=> b!228713 (=> res!112575 e!148385)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228713 (= res!112575 (not (validMask!0 (mask!10140 thiss!1504))))))

(declare-fun lt!115057 () array!11247)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11247 (_ BitVec 32)) Bool)

(assert (=> b!228713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115057 (mask!10140 thiss!1504))))

(declare-datatypes ((Unit!6961 0))(
  ( (Unit!6962) )
))
(declare-fun lt!115061 () Unit!6961)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11247 (_ BitVec 32) (_ BitVec 32)) Unit!6961)

(assert (=> b!228713 (= lt!115061 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6320 thiss!1504) index!297 (mask!10140 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11247 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228713 (= (arrayCountValidKeys!0 lt!115057 #b00000000000000000000000000000000 (size!5676 (_keys!6320 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6320 thiss!1504) #b00000000000000000000000000000000 (size!5676 (_keys!6320 thiss!1504)))))))

(declare-fun lt!115062 () Unit!6961)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11247 (_ BitVec 32) (_ BitVec 64)) Unit!6961)

(assert (=> b!228713 (= lt!115062 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6320 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3416 0))(
  ( (Nil!3413) (Cons!3412 (h!4060 (_ BitVec 64)) (t!8375 List!3416)) )
))
(declare-fun arrayNoDuplicates!0 (array!11247 (_ BitVec 32) List!3416) Bool)

(assert (=> b!228713 (arrayNoDuplicates!0 lt!115057 #b00000000000000000000000000000000 Nil!3413)))

(assert (=> b!228713 (= lt!115057 (array!11248 (store (arr!5343 (_keys!6320 thiss!1504)) index!297 key!932) (size!5676 (_keys!6320 thiss!1504))))))

(declare-fun lt!115064 () Unit!6961)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11247 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3416) Unit!6961)

(assert (=> b!228713 (= lt!115064 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6320 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3413))))

(declare-fun lt!115063 () Unit!6961)

(declare-fun e!148390 () Unit!6961)

(assert (=> b!228713 (= lt!115063 e!148390)))

(declare-fun c!37929 () Bool)

(declare-fun arrayContainsKey!0 (array!11247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228713 (= c!37929 (arrayContainsKey!0 (_keys!6320 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228714 () Bool)

(declare-fun e!148394 () Unit!6961)

(declare-fun lt!115058 () Unit!6961)

(assert (=> b!228714 (= e!148394 lt!115058)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!289 (array!11247 array!11245 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) Int) Unit!6961)

(assert (=> b!228714 (= lt!115058 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!289 (_keys!6320 thiss!1504) (_values!4249 thiss!1504) (mask!10140 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 (defaultEntry!4266 thiss!1504)))))

(assert (=> b!228714 (= c!37930 (is-MissingZero!911 lt!115065))))

(declare-fun e!148387 () Bool)

(assert (=> b!228714 e!148387))

(declare-fun b!228715 () Bool)

(declare-fun res!112571 () Bool)

(declare-fun e!148388 () Bool)

(assert (=> b!228715 (=> (not res!112571) (not e!148388))))

(assert (=> b!228715 (= res!112571 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228716 () Bool)

(declare-fun res!112569 () Bool)

(assert (=> b!228716 (=> res!112569 e!148385)))

(assert (=> b!228716 (= res!112569 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6320 thiss!1504) (mask!10140 thiss!1504))))))

(declare-fun b!228717 () Bool)

(declare-fun e!148381 () Bool)

(declare-fun tp_is_empty!6001 () Bool)

(assert (=> b!228717 (= e!148381 tp_is_empty!6001)))

(declare-fun b!228718 () Bool)

(declare-fun e!148384 () Bool)

(declare-fun mapRes!10171 () Bool)

(assert (=> b!228718 (= e!148384 (and e!148381 mapRes!10171))))

(declare-fun condMapEmpty!10171 () Bool)

(declare-fun mapDefault!10171 () ValueCell!2657)

