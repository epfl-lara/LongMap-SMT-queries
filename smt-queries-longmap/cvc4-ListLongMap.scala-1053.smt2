; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22004 () Bool)

(assert start!22004)

(declare-fun b!226333 () Bool)

(declare-fun b_free!6071 () Bool)

(declare-fun b_next!6071 () Bool)

(assert (=> b!226333 (= b_free!6071 (not b_next!6071))))

(declare-fun tp!21354 () Bool)

(declare-fun b_and!12969 () Bool)

(assert (=> b!226333 (= tp!21354 b_and!12969)))

(declare-fun b!226327 () Bool)

(declare-fun e!146852 () Bool)

(declare-fun call!21047 () Bool)

(assert (=> b!226327 (= e!146852 (not call!21047))))

(declare-fun b!226328 () Bool)

(declare-fun res!111410 () Bool)

(declare-fun e!146854 () Bool)

(assert (=> b!226328 (=> res!111410 e!146854)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226328 (= res!111410 (not (validKeyInArray!0 key!932)))))

(declare-fun mapNonEmpty!10069 () Bool)

(declare-fun mapRes!10069 () Bool)

(declare-fun tp!21355 () Bool)

(declare-fun e!146856 () Bool)

(assert (=> mapNonEmpty!10069 (= mapRes!10069 (and tp!21355 e!146856))))

(declare-datatypes ((V!7557 0))(
  ( (V!7558 (val!3011 Int)) )
))
(declare-datatypes ((ValueCell!2623 0))(
  ( (ValueCellFull!2623 (v!5031 V!7557)) (EmptyCell!2623) )
))
(declare-fun mapValue!10069 () ValueCell!2623)

(declare-fun mapKey!10069 () (_ BitVec 32))

(declare-datatypes ((array!11109 0))(
  ( (array!11110 (arr!5274 (Array (_ BitVec 32) ValueCell!2623)) (size!5607 (_ BitVec 32))) )
))
(declare-datatypes ((array!11111 0))(
  ( (array!11112 (arr!5275 (Array (_ BitVec 32) (_ BitVec 64))) (size!5608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3146 0))(
  ( (LongMapFixedSize!3147 (defaultEntry!4232 Int) (mask!10082 (_ BitVec 32)) (extraKeys!3969 (_ BitVec 32)) (zeroValue!4073 V!7557) (minValue!4073 V!7557) (_size!1622 (_ BitVec 32)) (_keys!6286 array!11111) (_values!4215 array!11109) (_vacant!1622 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3146)

(declare-fun mapRest!10069 () (Array (_ BitVec 32) ValueCell!2623))

(assert (=> mapNonEmpty!10069 (= (arr!5274 (_values!4215 thiss!1504)) (store mapRest!10069 mapKey!10069 mapValue!10069))))

(declare-fun b!226329 () Bool)

(declare-fun res!111417 () Bool)

(declare-datatypes ((SeekEntryResult!881 0))(
  ( (MissingZero!881 (index!5694 (_ BitVec 32))) (Found!881 (index!5695 (_ BitVec 32))) (Intermediate!881 (undefined!1693 Bool) (index!5696 (_ BitVec 32)) (x!23221 (_ BitVec 32))) (Undefined!881) (MissingVacant!881 (index!5697 (_ BitVec 32))) )
))
(declare-fun lt!113942 () SeekEntryResult!881)

(assert (=> b!226329 (= res!111417 (= (select (arr!5275 (_keys!6286 thiss!1504)) (index!5697 lt!113942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146863 () Bool)

(assert (=> b!226329 (=> (not res!111417) (not e!146863))))

(declare-fun b!226330 () Bool)

(declare-datatypes ((Unit!6843 0))(
  ( (Unit!6844) )
))
(declare-fun e!146857 () Unit!6843)

(declare-fun Unit!6845 () Unit!6843)

(assert (=> b!226330 (= e!146857 Unit!6845)))

(declare-fun res!111421 () Bool)

(declare-fun e!146864 () Bool)

(assert (=> start!22004 (=> (not res!111421) (not e!146864))))

(declare-fun valid!1266 (LongMapFixedSize!3146) Bool)

(assert (=> start!22004 (= res!111421 (valid!1266 thiss!1504))))

(assert (=> start!22004 e!146864))

(declare-fun e!146855 () Bool)

(assert (=> start!22004 e!146855))

(assert (=> start!22004 true))

(declare-fun b!226331 () Bool)

(declare-fun e!146858 () Bool)

(assert (=> b!226331 (= e!146858 (is-Undefined!881 lt!113942))))

(declare-fun b!226332 () Bool)

(declare-fun res!111416 () Bool)

(assert (=> b!226332 (=> res!111416 e!146854)))

(declare-fun lt!113939 () Bool)

(assert (=> b!226332 (= res!111416 lt!113939)))

(declare-fun tp_is_empty!5933 () Bool)

(declare-fun e!146859 () Bool)

(declare-fun array_inv!3489 (array!11111) Bool)

(declare-fun array_inv!3490 (array!11109) Bool)

(assert (=> b!226333 (= e!146855 (and tp!21354 tp_is_empty!5933 (array_inv!3489 (_keys!6286 thiss!1504)) (array_inv!3490 (_values!4215 thiss!1504)) e!146859))))

(declare-fun b!226334 () Bool)

(declare-fun e!146860 () Bool)

(assert (=> b!226334 (= e!146860 (not e!146854))))

(declare-fun res!111412 () Bool)

(assert (=> b!226334 (=> res!111412 e!146854)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226334 (= res!111412 (not (validMask!0 (mask!10082 thiss!1504))))))

(declare-fun lt!113941 () array!11111)

(declare-fun arrayCountValidKeys!0 (array!11111 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226334 (= (arrayCountValidKeys!0 lt!113941 #b00000000000000000000000000000000 (size!5608 (_keys!6286 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6286 thiss!1504) #b00000000000000000000000000000000 (size!5608 (_keys!6286 thiss!1504)))))))

(declare-fun lt!113938 () Unit!6843)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11111 (_ BitVec 32) (_ BitVec 64)) Unit!6843)

(assert (=> b!226334 (= lt!113938 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6286 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3372 0))(
  ( (Nil!3369) (Cons!3368 (h!4016 (_ BitVec 64)) (t!8331 List!3372)) )
))
(declare-fun arrayNoDuplicates!0 (array!11111 (_ BitVec 32) List!3372) Bool)

(assert (=> b!226334 (arrayNoDuplicates!0 lt!113941 #b00000000000000000000000000000000 Nil!3369)))

(assert (=> b!226334 (= lt!113941 (array!11112 (store (arr!5275 (_keys!6286 thiss!1504)) index!297 key!932) (size!5608 (_keys!6286 thiss!1504))))))

(declare-fun lt!113935 () Unit!6843)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11111 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3372) Unit!6843)

(assert (=> b!226334 (= lt!113935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6286 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3369))))

(declare-fun lt!113936 () Unit!6843)

(assert (=> b!226334 (= lt!113936 e!146857)))

(declare-fun c!37521 () Bool)

(assert (=> b!226334 (= c!37521 lt!113939)))

(declare-fun arrayContainsKey!0 (array!11111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226334 (= lt!113939 (arrayContainsKey!0 (_keys!6286 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226335 () Bool)

(declare-fun res!111413 () Bool)

(assert (=> b!226335 (=> (not res!111413) (not e!146864))))

(assert (=> b!226335 (= res!111413 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226336 () Bool)

(declare-fun res!111419 () Bool)

(assert (=> b!226336 (=> res!111419 e!146854)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11111 (_ BitVec 32)) Bool)

(assert (=> b!226336 (= res!111419 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6286 thiss!1504) (mask!10082 thiss!1504))))))

(declare-fun b!226337 () Bool)

(declare-fun c!37522 () Bool)

(assert (=> b!226337 (= c!37522 (is-MissingVacant!881 lt!113942))))

(declare-fun e!146850 () Bool)

(assert (=> b!226337 (= e!146850 e!146858)))

(declare-fun b!226338 () Bool)

(declare-fun res!111414 () Bool)

(assert (=> b!226338 (=> res!111414 e!146854)))

(assert (=> b!226338 (= res!111414 (or (not (= (size!5608 (_keys!6286 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10082 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5608 (_keys!6286 thiss!1504)))))))

(declare-fun b!226339 () Bool)

(assert (=> b!226339 (= e!146863 (not call!21047))))

(declare-fun mapIsEmpty!10069 () Bool)

(assert (=> mapIsEmpty!10069 mapRes!10069))

(declare-fun c!37523 () Bool)

(declare-fun call!21048 () Bool)

(declare-fun bm!21044 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21044 (= call!21048 (inRange!0 (ite c!37523 (index!5694 lt!113942) (index!5697 lt!113942)) (mask!10082 thiss!1504)))))

(declare-fun b!226340 () Bool)

(declare-fun e!146862 () Bool)

(assert (=> b!226340 (= e!146859 (and e!146862 mapRes!10069))))

(declare-fun condMapEmpty!10069 () Bool)

(declare-fun mapDefault!10069 () ValueCell!2623)

