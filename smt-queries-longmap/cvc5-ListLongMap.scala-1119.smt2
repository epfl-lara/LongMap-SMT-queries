; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22960 () Bool)

(assert start!22960)

(declare-fun b!240341 () Bool)

(declare-fun b_free!6463 () Bool)

(declare-fun b_next!6463 () Bool)

(assert (=> b!240341 (= b_free!6463 (not b_next!6463))))

(declare-fun tp!22592 () Bool)

(declare-fun b_and!13429 () Bool)

(assert (=> b!240341 (= tp!22592 b_and!13429)))

(declare-fun b!240322 () Bool)

(declare-fun e!156000 () Bool)

(declare-datatypes ((V!8081 0))(
  ( (V!8082 (val!3207 Int)) )
))
(declare-datatypes ((ValueCell!2819 0))(
  ( (ValueCellFull!2819 (v!5245 V!8081)) (EmptyCell!2819) )
))
(declare-datatypes ((array!11929 0))(
  ( (array!11930 (arr!5666 (Array (_ BitVec 32) ValueCell!2819)) (size!6007 (_ BitVec 32))) )
))
(declare-datatypes ((array!11931 0))(
  ( (array!11932 (arr!5667 (Array (_ BitVec 32) (_ BitVec 64))) (size!6008 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3538 0))(
  ( (LongMapFixedSize!3539 (defaultEntry!4454 Int) (mask!10510 (_ BitVec 32)) (extraKeys!4191 (_ BitVec 32)) (zeroValue!4295 V!8081) (minValue!4295 V!8081) (_size!1818 (_ BitVec 32)) (_keys!6556 array!11931) (_values!4437 array!11929) (_vacant!1818 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3538)

(assert (=> b!240322 (= e!156000 (bvsge #b00000000000000000000000000000000 (size!6008 (_keys!6556 thiss!1504))))))

(declare-fun b!240323 () Bool)

(declare-fun e!156004 () Bool)

(declare-fun call!22349 () Bool)

(assert (=> b!240323 (= e!156004 (not call!22349))))

(declare-fun mapIsEmpty!10719 () Bool)

(declare-fun mapRes!10719 () Bool)

(assert (=> mapIsEmpty!10719 mapRes!10719))

(declare-fun bm!22346 () Bool)

(declare-datatypes ((SeekEntryResult!1044 0))(
  ( (MissingZero!1044 (index!6346 (_ BitVec 32))) (Found!1044 (index!6347 (_ BitVec 32))) (Intermediate!1044 (undefined!1856 Bool) (index!6348 (_ BitVec 32)) (x!24156 (_ BitVec 32))) (Undefined!1044) (MissingVacant!1044 (index!6349 (_ BitVec 32))) )
))
(declare-fun lt!120954 () SeekEntryResult!1044)

(declare-fun c!40037 () Bool)

(declare-fun call!22350 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22346 (= call!22350 (inRange!0 (ite c!40037 (index!6346 lt!120954) (index!6349 lt!120954)) (mask!10510 thiss!1504)))))

(declare-fun b!240324 () Bool)

(declare-fun res!117827 () Bool)

(assert (=> b!240324 (=> (not res!117827) (not e!156000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240324 (= res!117827 (validMask!0 (mask!10510 thiss!1504)))))

(declare-fun b!240325 () Bool)

(declare-fun e!155997 () Bool)

(declare-fun e!156003 () Bool)

(assert (=> b!240325 (= e!155997 e!156003)))

(declare-fun res!117820 () Bool)

(assert (=> b!240325 (=> (not res!117820) (not e!156003))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240325 (= res!117820 (or (= lt!120954 (MissingZero!1044 index!297)) (= lt!120954 (MissingVacant!1044 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11931 (_ BitVec 32)) SeekEntryResult!1044)

(assert (=> b!240325 (= lt!120954 (seekEntryOrOpen!0 key!932 (_keys!6556 thiss!1504) (mask!10510 thiss!1504)))))

(declare-fun b!240326 () Bool)

(declare-fun e!155995 () Bool)

(assert (=> b!240326 (= e!155995 (not call!22349))))

(declare-fun b!240327 () Bool)

(declare-fun c!40035 () Bool)

(assert (=> b!240327 (= c!40035 (is-MissingVacant!1044 lt!120954))))

(declare-fun e!155998 () Bool)

(declare-fun e!155999 () Bool)

(assert (=> b!240327 (= e!155998 e!155999)))

(declare-fun mapNonEmpty!10719 () Bool)

(declare-fun tp!22593 () Bool)

(declare-fun e!156006 () Bool)

(assert (=> mapNonEmpty!10719 (= mapRes!10719 (and tp!22593 e!156006))))

(declare-fun mapRest!10719 () (Array (_ BitVec 32) ValueCell!2819))

(declare-fun mapKey!10719 () (_ BitVec 32))

(declare-fun mapValue!10719 () ValueCell!2819)

(assert (=> mapNonEmpty!10719 (= (arr!5666 (_values!4437 thiss!1504)) (store mapRest!10719 mapKey!10719 mapValue!10719))))

(declare-fun b!240329 () Bool)

(declare-datatypes ((Unit!7391 0))(
  ( (Unit!7392) )
))
(declare-fun e!156001 () Unit!7391)

(declare-fun Unit!7393 () Unit!7391)

(assert (=> b!240329 (= e!156001 Unit!7393)))

(declare-fun lt!120956 () Unit!7391)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!339 (array!11931 array!11929 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 64) Int) Unit!7391)

(assert (=> b!240329 (= lt!120956 (lemmaInListMapThenSeekEntryOrOpenFindsIt!339 (_keys!6556 thiss!1504) (_values!4437 thiss!1504) (mask!10510 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) key!932 (defaultEntry!4454 thiss!1504)))))

(assert (=> b!240329 false))

(declare-fun b!240330 () Bool)

(assert (=> b!240330 (= e!155999 (is-Undefined!1044 lt!120954))))

(declare-fun b!240331 () Bool)

(declare-fun res!117828 () Bool)

(assert (=> b!240331 (= res!117828 (= (select (arr!5667 (_keys!6556 thiss!1504)) (index!6349 lt!120954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240331 (=> (not res!117828) (not e!156004))))

(declare-fun b!240332 () Bool)

(declare-fun res!117829 () Bool)

(assert (=> b!240332 (=> (not res!117829) (not e!156000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11931 (_ BitVec 32)) Bool)

(assert (=> b!240332 (= res!117829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6556 thiss!1504) (mask!10510 thiss!1504)))))

(declare-fun b!240333 () Bool)

(assert (=> b!240333 (= e!155999 e!156004)))

(declare-fun res!117833 () Bool)

(assert (=> b!240333 (= res!117833 call!22350)))

(assert (=> b!240333 (=> (not res!117833) (not e!156004))))

(declare-fun bm!22347 () Bool)

(declare-fun arrayContainsKey!0 (array!11931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22347 (= call!22349 (arrayContainsKey!0 (_keys!6556 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240334 () Bool)

(declare-fun tp_is_empty!6325 () Bool)

(assert (=> b!240334 (= e!156006 tp_is_empty!6325)))

(declare-fun b!240335 () Bool)

(declare-fun res!117823 () Bool)

(assert (=> b!240335 (=> (not res!117823) (not e!156000))))

(assert (=> b!240335 (= res!117823 (arrayContainsKey!0 (_keys!6556 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240336 () Bool)

(declare-fun res!117826 () Bool)

(assert (=> b!240336 (=> (not res!117826) (not e!156000))))

(declare-datatypes ((List!3609 0))(
  ( (Nil!3606) (Cons!3605 (h!4261 (_ BitVec 64)) (t!8604 List!3609)) )
))
(declare-fun arrayNoDuplicates!0 (array!11931 (_ BitVec 32) List!3609) Bool)

(assert (=> b!240336 (= res!117826 (arrayNoDuplicates!0 (_keys!6556 thiss!1504) #b00000000000000000000000000000000 Nil!3606))))

(declare-fun b!240337 () Bool)

(declare-fun res!117832 () Bool)

(assert (=> b!240337 (=> (not res!117832) (not e!156000))))

(assert (=> b!240337 (= res!117832 (and (= (size!6007 (_values!4437 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10510 thiss!1504))) (= (size!6008 (_keys!6556 thiss!1504)) (size!6007 (_values!4437 thiss!1504))) (bvsge (mask!10510 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4191 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4191 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240338 () Bool)

(declare-fun res!117831 () Bool)

(assert (=> b!240338 (=> (not res!117831) (not e!155995))))

(assert (=> b!240338 (= res!117831 call!22350)))

(assert (=> b!240338 (= e!155998 e!155995)))

(declare-fun b!240339 () Bool)

(declare-fun res!117830 () Bool)

(assert (=> b!240339 (=> (not res!117830) (not e!156000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240339 (= res!117830 (validKeyInArray!0 key!932))))

(declare-fun b!240340 () Bool)

(assert (=> b!240340 (= e!156003 e!156000)))

(declare-fun res!117821 () Bool)

(assert (=> b!240340 (=> (not res!117821) (not e!156000))))

(assert (=> b!240340 (= res!117821 (inRange!0 index!297 (mask!10510 thiss!1504)))))

(declare-fun lt!120955 () Unit!7391)

(assert (=> b!240340 (= lt!120955 e!156001)))

(declare-fun c!40036 () Bool)

(declare-datatypes ((tuple2!4726 0))(
  ( (tuple2!4727 (_1!2374 (_ BitVec 64)) (_2!2374 V!8081)) )
))
(declare-datatypes ((List!3610 0))(
  ( (Nil!3607) (Cons!3606 (h!4262 tuple2!4726) (t!8605 List!3610)) )
))
(declare-datatypes ((ListLongMap!3639 0))(
  ( (ListLongMap!3640 (toList!1835 List!3610)) )
))
(declare-fun contains!1723 (ListLongMap!3639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1363 (array!11931 array!11929 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 32) Int) ListLongMap!3639)

(assert (=> b!240340 (= c!40036 (contains!1723 (getCurrentListMap!1363 (_keys!6556 thiss!1504) (_values!4437 thiss!1504) (mask!10510 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4454 thiss!1504)) key!932))))

(declare-fun e!156002 () Bool)

(declare-fun e!156005 () Bool)

(declare-fun array_inv!3749 (array!11931) Bool)

(declare-fun array_inv!3750 (array!11929) Bool)

(assert (=> b!240341 (= e!156002 (and tp!22592 tp_is_empty!6325 (array_inv!3749 (_keys!6556 thiss!1504)) (array_inv!3750 (_values!4437 thiss!1504)) e!156005))))

(declare-fun b!240342 () Bool)

(declare-fun e!155996 () Bool)

(assert (=> b!240342 (= e!156005 (and e!155996 mapRes!10719))))

(declare-fun condMapEmpty!10719 () Bool)

(declare-fun mapDefault!10719 () ValueCell!2819)

