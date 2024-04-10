; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24276 () Bool)

(assert start!24276)

(declare-fun b!254109 () Bool)

(declare-fun b_free!6677 () Bool)

(declare-fun b_next!6677 () Bool)

(assert (=> b!254109 (= b_free!6677 (not b_next!6677))))

(declare-fun tp!23319 () Bool)

(declare-fun b_and!13719 () Bool)

(assert (=> b!254109 (= tp!23319 b_and!13719)))

(declare-fun b!254084 () Bool)

(declare-fun res!124397 () Bool)

(declare-fun e!164706 () Bool)

(assert (=> b!254084 (=> res!124397 e!164706)))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8365 0))(
  ( (V!8366 (val!3314 Int)) )
))
(declare-datatypes ((ValueCell!2926 0))(
  ( (ValueCellFull!2926 (v!5388 V!8365)) (EmptyCell!2926) )
))
(declare-datatypes ((array!12409 0))(
  ( (array!12410 (arr!5880 (Array (_ BitVec 32) ValueCell!2926)) (size!6227 (_ BitVec 32))) )
))
(declare-datatypes ((array!12411 0))(
  ( (array!12412 (arr!5881 (Array (_ BitVec 32) (_ BitVec 64))) (size!6228 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3752 0))(
  ( (LongMapFixedSize!3753 (defaultEntry!4689 Int) (mask!10931 (_ BitVec 32)) (extraKeys!4426 (_ BitVec 32)) (zeroValue!4530 V!8365) (minValue!4530 V!8365) (_size!1925 (_ BitVec 32)) (_keys!6843 array!12411) (_values!4672 array!12409) (_vacant!1925 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3752)

(assert (=> b!254084 (= res!124397 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6228 (_keys!6843 thiss!1504)))))))

(declare-fun b!254085 () Bool)

(declare-fun res!124388 () Bool)

(declare-fun e!164697 () Bool)

(assert (=> b!254085 (=> (not res!124388) (not e!164697))))

(declare-datatypes ((SeekEntryResult!1145 0))(
  ( (MissingZero!1145 (index!6750 (_ BitVec 32))) (Found!1145 (index!6751 (_ BitVec 32))) (Intermediate!1145 (undefined!1957 Bool) (index!6752 (_ BitVec 32)) (x!24845 (_ BitVec 32))) (Undefined!1145) (MissingVacant!1145 (index!6753 (_ BitVec 32))) )
))
(declare-fun lt!127332 () SeekEntryResult!1145)

(assert (=> b!254085 (= res!124388 (= (select (arr!5881 (_keys!6843 thiss!1504)) (index!6750 lt!127332)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254086 () Bool)

(declare-datatypes ((Unit!7864 0))(
  ( (Unit!7865) )
))
(declare-fun e!164699 () Unit!7864)

(declare-fun Unit!7866 () Unit!7864)

(assert (=> b!254086 (= e!164699 Unit!7866)))

(declare-fun b!254087 () Bool)

(declare-fun res!124396 () Bool)

(assert (=> b!254087 (=> res!124396 e!164706)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!254087 (= res!124396 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!11124 () Bool)

(declare-fun mapRes!11124 () Bool)

(assert (=> mapIsEmpty!11124 mapRes!11124))

(declare-fun res!124399 () Bool)

(declare-fun e!164703 () Bool)

(assert (=> start!24276 (=> (not res!124399) (not e!164703))))

(declare-fun valid!1467 (LongMapFixedSize!3752) Bool)

(assert (=> start!24276 (= res!124399 (valid!1467 thiss!1504))))

(assert (=> start!24276 e!164703))

(declare-fun e!164696 () Bool)

(assert (=> start!24276 e!164696))

(assert (=> start!24276 true))

(declare-fun b!254088 () Bool)

(declare-fun res!124390 () Bool)

(assert (=> b!254088 (=> res!124390 e!164706)))

(assert (=> b!254088 (= res!124390 (or (not (= (size!6227 (_values!4672 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10931 thiss!1504)))) (not (= (size!6228 (_keys!6843 thiss!1504)) (size!6227 (_values!4672 thiss!1504)))) (bvslt (mask!10931 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4426 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4426 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254089 () Bool)

(declare-fun e!164695 () Bool)

(declare-fun e!164701 () Bool)

(assert (=> b!254089 (= e!164695 e!164701)))

(declare-fun res!124395 () Bool)

(assert (=> b!254089 (=> (not res!124395) (not e!164701))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254089 (= res!124395 (inRange!0 index!297 (mask!10931 thiss!1504)))))

(declare-fun lt!127326 () Unit!7864)

(declare-fun e!164694 () Unit!7864)

(assert (=> b!254089 (= lt!127326 e!164694)))

(declare-fun c!42851 () Bool)

(declare-datatypes ((tuple2!4878 0))(
  ( (tuple2!4879 (_1!2450 (_ BitVec 64)) (_2!2450 V!8365)) )
))
(declare-datatypes ((List!3759 0))(
  ( (Nil!3756) (Cons!3755 (h!4417 tuple2!4878) (t!8806 List!3759)) )
))
(declare-datatypes ((ListLongMap!3791 0))(
  ( (ListLongMap!3792 (toList!1911 List!3759)) )
))
(declare-fun contains!1841 (ListLongMap!3791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1439 (array!12411 array!12409 (_ BitVec 32) (_ BitVec 32) V!8365 V!8365 (_ BitVec 32) Int) ListLongMap!3791)

(assert (=> b!254089 (= c!42851 (contains!1841 (getCurrentListMap!1439 (_keys!6843 thiss!1504) (_values!4672 thiss!1504) (mask!10931 thiss!1504) (extraKeys!4426 thiss!1504) (zeroValue!4530 thiss!1504) (minValue!4530 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4689 thiss!1504)) key!932))))

(declare-fun b!254090 () Bool)

(declare-fun e!164705 () Bool)

(declare-fun call!23976 () Bool)

(assert (=> b!254090 (= e!164705 (not call!23976))))

(declare-fun bm!23973 () Bool)

(declare-fun arrayContainsKey!0 (array!12411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23973 (= call!23976 (arrayContainsKey!0 (_keys!6843 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254091 () Bool)

(declare-fun e!164700 () Bool)

(assert (=> b!254091 (= e!164700 (is-Undefined!1145 lt!127332))))

(declare-fun b!254092 () Bool)

(declare-fun e!164702 () Bool)

(declare-fun tp_is_empty!6539 () Bool)

(assert (=> b!254092 (= e!164702 tp_is_empty!6539)))

(declare-fun lt!127333 () Bool)

(declare-fun b!254093 () Bool)

(assert (=> b!254093 (= e!164706 (or (and (not (= (select (arr!5881 (_keys!6843 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5881 (_keys!6843 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000))) (not lt!127333)))))

(declare-fun b!254094 () Bool)

(declare-fun res!124394 () Bool)

(assert (=> b!254094 (=> (not res!124394) (not e!164703))))

(assert (=> b!254094 (= res!124394 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254095 () Bool)

(assert (=> b!254095 (= e!164703 e!164695)))

(declare-fun res!124393 () Bool)

(assert (=> b!254095 (=> (not res!124393) (not e!164695))))

(assert (=> b!254095 (= res!124393 (or (= lt!127332 (MissingZero!1145 index!297)) (= lt!127332 (MissingVacant!1145 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12411 (_ BitVec 32)) SeekEntryResult!1145)

(assert (=> b!254095 (= lt!127332 (seekEntryOrOpen!0 key!932 (_keys!6843 thiss!1504) (mask!10931 thiss!1504)))))

(declare-fun b!254096 () Bool)

(declare-fun lt!127330 () Unit!7864)

(assert (=> b!254096 (= e!164694 lt!127330)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (array!12411 array!12409 (_ BitVec 32) (_ BitVec 32) V!8365 V!8365 (_ BitVec 64) Int) Unit!7864)

(assert (=> b!254096 (= lt!127330 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (_keys!6843 thiss!1504) (_values!4672 thiss!1504) (mask!10931 thiss!1504) (extraKeys!4426 thiss!1504) (zeroValue!4530 thiss!1504) (minValue!4530 thiss!1504) key!932 (defaultEntry!4689 thiss!1504)))))

(declare-fun c!42852 () Bool)

(assert (=> b!254096 (= c!42852 (is-MissingZero!1145 lt!127332))))

(declare-fun e!164707 () Bool)

(assert (=> b!254096 e!164707))

(declare-fun bm!23974 () Bool)

(declare-fun call!23977 () Bool)

(assert (=> bm!23974 (= call!23977 (inRange!0 (ite c!42852 (index!6750 lt!127332) (index!6753 lt!127332)) (mask!10931 thiss!1504)))))

(declare-fun b!254097 () Bool)

(declare-fun res!124398 () Bool)

(assert (=> b!254097 (=> res!124398 e!164706)))

(declare-datatypes ((List!3760 0))(
  ( (Nil!3757) (Cons!3756 (h!4418 (_ BitVec 64)) (t!8807 List!3760)) )
))
(declare-fun arrayNoDuplicates!0 (array!12411 (_ BitVec 32) List!3760) Bool)

(assert (=> b!254097 (= res!124398 (not (arrayNoDuplicates!0 (_keys!6843 thiss!1504) #b00000000000000000000000000000000 Nil!3757)))))

(declare-fun mapNonEmpty!11124 () Bool)

(declare-fun tp!23318 () Bool)

(declare-fun e!164698 () Bool)

(assert (=> mapNonEmpty!11124 (= mapRes!11124 (and tp!23318 e!164698))))

(declare-fun mapRest!11124 () (Array (_ BitVec 32) ValueCell!2926))

(declare-fun mapValue!11124 () ValueCell!2926)

(declare-fun mapKey!11124 () (_ BitVec 32))

(assert (=> mapNonEmpty!11124 (= (arr!5880 (_values!4672 thiss!1504)) (store mapRest!11124 mapKey!11124 mapValue!11124))))

(declare-fun b!254098 () Bool)

(declare-fun res!124392 () Bool)

(assert (=> b!254098 (= res!124392 (= (select (arr!5881 (_keys!6843 thiss!1504)) (index!6753 lt!127332)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254098 (=> (not res!124392) (not e!164705))))

(declare-fun b!254099 () Bool)

(declare-fun res!124389 () Bool)

(assert (=> b!254099 (=> res!124389 e!164706)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12411 (_ BitVec 32)) Bool)

(assert (=> b!254099 (= res!124389 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6843 thiss!1504) (mask!10931 thiss!1504))))))

(declare-fun b!254100 () Bool)

(declare-fun Unit!7867 () Unit!7864)

(assert (=> b!254100 (= e!164694 Unit!7867)))

(declare-fun lt!127334 () Unit!7864)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!413 (array!12411 array!12409 (_ BitVec 32) (_ BitVec 32) V!8365 V!8365 (_ BitVec 64) Int) Unit!7864)

(assert (=> b!254100 (= lt!127334 (lemmaInListMapThenSeekEntryOrOpenFindsIt!413 (_keys!6843 thiss!1504) (_values!4672 thiss!1504) (mask!10931 thiss!1504) (extraKeys!4426 thiss!1504) (zeroValue!4530 thiss!1504) (minValue!4530 thiss!1504) key!932 (defaultEntry!4689 thiss!1504)))))

(assert (=> b!254100 false))

(declare-fun b!254101 () Bool)

(declare-fun Unit!7868 () Unit!7864)

(assert (=> b!254101 (= e!164699 Unit!7868)))

(declare-fun lt!127324 () Unit!7864)

(declare-fun lemmaArrayContainsKeyThenInListMap!219 (array!12411 array!12409 (_ BitVec 32) (_ BitVec 32) V!8365 V!8365 (_ BitVec 64) (_ BitVec 32) Int) Unit!7864)

(assert (=> b!254101 (= lt!127324 (lemmaArrayContainsKeyThenInListMap!219 (_keys!6843 thiss!1504) (_values!4672 thiss!1504) (mask!10931 thiss!1504) (extraKeys!4426 thiss!1504) (zeroValue!4530 thiss!1504) (minValue!4530 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4689 thiss!1504)))))

(assert (=> b!254101 false))

(declare-fun b!254102 () Bool)

(assert (=> b!254102 (= e!164697 (not call!23976))))

(declare-fun b!254103 () Bool)

(declare-fun c!42853 () Bool)

(assert (=> b!254103 (= c!42853 (is-MissingVacant!1145 lt!127332))))

(assert (=> b!254103 (= e!164707 e!164700)))

(declare-fun b!254104 () Bool)

(assert (=> b!254104 (= e!164701 (not e!164706))))

(declare-fun res!124400 () Bool)

(assert (=> b!254104 (=> res!124400 e!164706)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254104 (= res!124400 (not (validMask!0 (mask!10931 thiss!1504))))))

(declare-fun lt!127329 () array!12411)

(assert (=> b!254104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127329 (mask!10931 thiss!1504))))

(declare-fun lt!127325 () Unit!7864)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12411 (_ BitVec 32) (_ BitVec 32)) Unit!7864)

(assert (=> b!254104 (= lt!127325 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6843 thiss!1504) index!297 (mask!10931 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12411 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254104 (= (arrayCountValidKeys!0 lt!127329 #b00000000000000000000000000000000 (size!6228 (_keys!6843 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6843 thiss!1504) #b00000000000000000000000000000000 (size!6228 (_keys!6843 thiss!1504)))))))

(declare-fun lt!127331 () Unit!7864)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12411 (_ BitVec 32) (_ BitVec 64)) Unit!7864)

(assert (=> b!254104 (= lt!127331 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6843 thiss!1504) index!297 key!932))))

(assert (=> b!254104 (arrayNoDuplicates!0 lt!127329 #b00000000000000000000000000000000 Nil!3757)))

(assert (=> b!254104 (= lt!127329 (array!12412 (store (arr!5881 (_keys!6843 thiss!1504)) index!297 key!932) (size!6228 (_keys!6843 thiss!1504))))))

(declare-fun lt!127328 () Unit!7864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12411 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3760) Unit!7864)

(assert (=> b!254104 (= lt!127328 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6843 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3757))))

(declare-fun lt!127327 () Unit!7864)

(assert (=> b!254104 (= lt!127327 e!164699)))

(declare-fun c!42854 () Bool)

(assert (=> b!254104 (= c!42854 lt!127333)))

(assert (=> b!254104 (= lt!127333 (arrayContainsKey!0 (_keys!6843 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254105 () Bool)

(declare-fun res!124391 () Bool)

(assert (=> b!254105 (=> (not res!124391) (not e!164697))))

(assert (=> b!254105 (= res!124391 call!23977)))

(assert (=> b!254105 (= e!164707 e!164697)))

(declare-fun b!254106 () Bool)

(assert (=> b!254106 (= e!164698 tp_is_empty!6539)))

(declare-fun b!254107 () Bool)

(assert (=> b!254107 (= e!164700 e!164705)))

(declare-fun res!124401 () Bool)

(assert (=> b!254107 (= res!124401 call!23977)))

(assert (=> b!254107 (=> (not res!124401) (not e!164705))))

(declare-fun b!254108 () Bool)

(declare-fun e!164704 () Bool)

(assert (=> b!254108 (= e!164704 (and e!164702 mapRes!11124))))

(declare-fun condMapEmpty!11124 () Bool)

(declare-fun mapDefault!11124 () ValueCell!2926)

