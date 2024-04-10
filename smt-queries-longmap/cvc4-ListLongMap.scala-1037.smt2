; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21908 () Bool)

(assert start!21908)

(declare-fun b!222352 () Bool)

(declare-fun b_free!5975 () Bool)

(declare-fun b_next!5975 () Bool)

(assert (=> b!222352 (= b_free!5975 (not b_next!5975))))

(declare-fun tp!21066 () Bool)

(declare-fun b_and!12873 () Bool)

(assert (=> b!222352 (= tp!21066 b_and!12873)))

(declare-fun b!222328 () Bool)

(declare-fun res!109138 () Bool)

(declare-fun e!144497 () Bool)

(assert (=> b!222328 (=> (not res!109138) (not e!144497))))

(declare-fun call!20760 () Bool)

(assert (=> b!222328 (= res!109138 call!20760)))

(declare-fun e!144486 () Bool)

(assert (=> b!222328 (= e!144486 e!144497)))

(declare-fun b!222329 () Bool)

(declare-fun call!20759 () Bool)

(assert (=> b!222329 (= e!144497 (not call!20759))))

(declare-fun mapIsEmpty!9925 () Bool)

(declare-fun mapRes!9925 () Bool)

(assert (=> mapIsEmpty!9925 mapRes!9925))

(declare-fun b!222330 () Bool)

(declare-fun e!144496 () Bool)

(declare-fun tp_is_empty!5837 () Bool)

(assert (=> b!222330 (= e!144496 tp_is_empty!5837)))

(declare-fun b!222331 () Bool)

(declare-fun e!144488 () Bool)

(declare-fun e!144481 () Bool)

(assert (=> b!222331 (= e!144488 e!144481)))

(declare-fun res!109145 () Bool)

(assert (=> b!222331 (=> (not res!109145) (not e!144481))))

(declare-datatypes ((SeekEntryResult!836 0))(
  ( (MissingZero!836 (index!5514 (_ BitVec 32))) (Found!836 (index!5515 (_ BitVec 32))) (Intermediate!836 (undefined!1648 Bool) (index!5516 (_ BitVec 32)) (x!23048 (_ BitVec 32))) (Undefined!836) (MissingVacant!836 (index!5517 (_ BitVec 32))) )
))
(declare-fun lt!112625 () SeekEntryResult!836)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222331 (= res!109145 (or (= lt!112625 (MissingZero!836 index!297)) (= lt!112625 (MissingVacant!836 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7429 0))(
  ( (V!7430 (val!2963 Int)) )
))
(declare-datatypes ((ValueCell!2575 0))(
  ( (ValueCellFull!2575 (v!4983 V!7429)) (EmptyCell!2575) )
))
(declare-datatypes ((array!10917 0))(
  ( (array!10918 (arr!5178 (Array (_ BitVec 32) ValueCell!2575)) (size!5511 (_ BitVec 32))) )
))
(declare-datatypes ((array!10919 0))(
  ( (array!10920 (arr!5179 (Array (_ BitVec 32) (_ BitVec 64))) (size!5512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3050 0))(
  ( (LongMapFixedSize!3051 (defaultEntry!4184 Int) (mask!10002 (_ BitVec 32)) (extraKeys!3921 (_ BitVec 32)) (zeroValue!4025 V!7429) (minValue!4025 V!7429) (_size!1574 (_ BitVec 32)) (_keys!6238 array!10919) (_values!4167 array!10917) (_vacant!1574 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3050)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10919 (_ BitVec 32)) SeekEntryResult!836)

(assert (=> b!222331 (= lt!112625 (seekEntryOrOpen!0 key!932 (_keys!6238 thiss!1504) (mask!10002 thiss!1504)))))

(declare-fun b!222332 () Bool)

(declare-fun e!144484 () Bool)

(declare-datatypes ((List!3303 0))(
  ( (Nil!3300) (Cons!3299 (h!3947 (_ BitVec 64)) (t!8262 List!3303)) )
))
(declare-fun contains!1523 (List!3303 (_ BitVec 64)) Bool)

(assert (=> b!222332 (= e!144484 (not (contains!1523 Nil!3300 key!932)))))

(declare-fun bm!20756 () Bool)

(declare-fun arrayContainsKey!0 (array!10919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20756 (= call!20759 (arrayContainsKey!0 (_keys!6238 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9925 () Bool)

(declare-fun tp!21067 () Bool)

(assert (=> mapNonEmpty!9925 (= mapRes!9925 (and tp!21067 e!144496))))

(declare-fun mapRest!9925 () (Array (_ BitVec 32) ValueCell!2575))

(declare-fun mapKey!9925 () (_ BitVec 32))

(declare-fun mapValue!9925 () ValueCell!2575)

(assert (=> mapNonEmpty!9925 (= (arr!5178 (_values!4167 thiss!1504)) (store mapRest!9925 mapKey!9925 mapValue!9925))))

(declare-fun b!222333 () Bool)

(declare-fun e!144493 () Bool)

(assert (=> b!222333 (= e!144493 tp_is_empty!5837)))

(declare-fun b!222334 () Bool)

(declare-datatypes ((Unit!6661 0))(
  ( (Unit!6662) )
))
(declare-fun e!144487 () Unit!6661)

(declare-fun Unit!6663 () Unit!6661)

(assert (=> b!222334 (= e!144487 Unit!6663)))

(declare-fun lt!112629 () Unit!6661)

(declare-fun lemmaArrayContainsKeyThenInListMap!60 (array!10919 array!10917 (_ BitVec 32) (_ BitVec 32) V!7429 V!7429 (_ BitVec 64) (_ BitVec 32) Int) Unit!6661)

(assert (=> b!222334 (= lt!112629 (lemmaArrayContainsKeyThenInListMap!60 (_keys!6238 thiss!1504) (_values!4167 thiss!1504) (mask!10002 thiss!1504) (extraKeys!3921 thiss!1504) (zeroValue!4025 thiss!1504) (minValue!4025 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4184 thiss!1504)))))

(assert (=> b!222334 false))

(declare-fun b!222335 () Bool)

(declare-fun c!36946 () Bool)

(assert (=> b!222335 (= c!36946 (is-MissingVacant!836 lt!112625))))

(declare-fun e!144492 () Bool)

(assert (=> b!222335 (= e!144486 e!144492)))

(declare-fun b!222336 () Bool)

(declare-fun res!109149 () Bool)

(declare-fun e!144495 () Bool)

(assert (=> b!222336 (=> (not res!109149) (not e!144495))))

(assert (=> b!222336 (= res!109149 (not (contains!1523 Nil!3300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222338 () Bool)

(declare-fun e!144482 () Unit!6661)

(declare-fun Unit!6664 () Unit!6661)

(assert (=> b!222338 (= e!144482 Unit!6664)))

(declare-fun lt!112626 () Unit!6661)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!224 (array!10919 array!10917 (_ BitVec 32) (_ BitVec 32) V!7429 V!7429 (_ BitVec 64) Int) Unit!6661)

(assert (=> b!222338 (= lt!112626 (lemmaInListMapThenSeekEntryOrOpenFindsIt!224 (_keys!6238 thiss!1504) (_values!4167 thiss!1504) (mask!10002 thiss!1504) (extraKeys!3921 thiss!1504) (zeroValue!4025 thiss!1504) (minValue!4025 thiss!1504) key!932 (defaultEntry!4184 thiss!1504)))))

(assert (=> b!222338 false))

(declare-fun b!222339 () Bool)

(declare-fun res!109139 () Bool)

(assert (=> b!222339 (=> (not res!109139) (not e!144497))))

(assert (=> b!222339 (= res!109139 (= (select (arr!5179 (_keys!6238 thiss!1504)) (index!5514 lt!112625)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222340 () Bool)

(declare-fun e!144489 () Bool)

(assert (=> b!222340 (= e!144489 (contains!1523 Nil!3300 key!932))))

(declare-fun b!222341 () Bool)

(declare-fun e!144483 () Bool)

(assert (=> b!222341 (= e!144483 (not call!20759))))

(declare-fun b!222342 () Bool)

(declare-fun res!109143 () Bool)

(assert (=> b!222342 (=> (not res!109143) (not e!144495))))

(declare-fun e!144485 () Bool)

(assert (=> b!222342 (= res!109143 e!144485)))

(declare-fun res!109146 () Bool)

(assert (=> b!222342 (=> res!109146 e!144485)))

(assert (=> b!222342 (= res!109146 e!144489)))

(declare-fun res!109142 () Bool)

(assert (=> b!222342 (=> (not res!109142) (not e!144489))))

(assert (=> b!222342 (= res!109142 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222343 () Bool)

(assert (=> b!222343 (= e!144492 (is-Undefined!836 lt!112625))))

(declare-fun b!222344 () Bool)

(assert (=> b!222344 (= e!144492 e!144483)))

(declare-fun res!109150 () Bool)

(assert (=> b!222344 (= res!109150 call!20760)))

(assert (=> b!222344 (=> (not res!109150) (not e!144483))))

(declare-fun b!222345 () Bool)

(assert (=> b!222345 (= e!144485 e!144484)))

(declare-fun res!109141 () Bool)

(assert (=> b!222345 (=> (not res!109141) (not e!144484))))

(assert (=> b!222345 (= res!109141 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222346 () Bool)

(declare-fun res!109140 () Bool)

(assert (=> b!222346 (= res!109140 (= (select (arr!5179 (_keys!6238 thiss!1504)) (index!5517 lt!112625)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222346 (=> (not res!109140) (not e!144483))))

(declare-fun b!222347 () Bool)

(declare-fun e!144480 () Bool)

(assert (=> b!222347 (= e!144480 (and e!144493 mapRes!9925))))

(declare-fun condMapEmpty!9925 () Bool)

(declare-fun mapDefault!9925 () ValueCell!2575)

