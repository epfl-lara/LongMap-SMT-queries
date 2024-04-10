; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22924 () Bool)

(assert start!22924)

(declare-fun b!239189 () Bool)

(declare-fun b_free!6427 () Bool)

(declare-fun b_next!6427 () Bool)

(assert (=> b!239189 (= b_free!6427 (not b_next!6427))))

(declare-fun tp!22485 () Bool)

(declare-fun b_and!13393 () Bool)

(assert (=> b!239189 (= tp!22485 b_and!13393)))

(declare-fun b!239180 () Bool)

(declare-fun res!117220 () Bool)

(declare-fun e!155296 () Bool)

(assert (=> b!239180 (=> (not res!117220) (not e!155296))))

(declare-fun call!22241 () Bool)

(assert (=> b!239180 (= res!117220 call!22241)))

(declare-fun e!155304 () Bool)

(assert (=> b!239180 (= e!155304 e!155296)))

(declare-fun b!239181 () Bool)

(declare-fun e!155295 () Bool)

(declare-fun e!155301 () Bool)

(assert (=> b!239181 (= e!155295 e!155301)))

(declare-fun res!117226 () Bool)

(assert (=> b!239181 (=> (not res!117226) (not e!155301))))

(declare-datatypes ((SeekEntryResult!1029 0))(
  ( (MissingZero!1029 (index!6286 (_ BitVec 32))) (Found!1029 (index!6287 (_ BitVec 32))) (Intermediate!1029 (undefined!1841 Bool) (index!6288 (_ BitVec 32)) (x!24093 (_ BitVec 32))) (Undefined!1029) (MissingVacant!1029 (index!6289 (_ BitVec 32))) )
))
(declare-fun lt!120739 () SeekEntryResult!1029)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239181 (= res!117226 (or (= lt!120739 (MissingZero!1029 index!297)) (= lt!120739 (MissingVacant!1029 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8033 0))(
  ( (V!8034 (val!3189 Int)) )
))
(declare-datatypes ((ValueCell!2801 0))(
  ( (ValueCellFull!2801 (v!5227 V!8033)) (EmptyCell!2801) )
))
(declare-datatypes ((array!11857 0))(
  ( (array!11858 (arr!5630 (Array (_ BitVec 32) ValueCell!2801)) (size!5971 (_ BitVec 32))) )
))
(declare-datatypes ((array!11859 0))(
  ( (array!11860 (arr!5631 (Array (_ BitVec 32) (_ BitVec 64))) (size!5972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3502 0))(
  ( (LongMapFixedSize!3503 (defaultEntry!4436 Int) (mask!10480 (_ BitVec 32)) (extraKeys!4173 (_ BitVec 32)) (zeroValue!4277 V!8033) (minValue!4277 V!8033) (_size!1800 (_ BitVec 32)) (_keys!6538 array!11859) (_values!4419 array!11857) (_vacant!1800 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3502)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11859 (_ BitVec 32)) SeekEntryResult!1029)

(assert (=> b!239181 (= lt!120739 (seekEntryOrOpen!0 key!932 (_keys!6538 thiss!1504) (mask!10480 thiss!1504)))))

(declare-fun mapIsEmpty!10665 () Bool)

(declare-fun mapRes!10665 () Bool)

(assert (=> mapIsEmpty!10665 mapRes!10665))

(declare-fun b!239182 () Bool)

(declare-fun e!155294 () Bool)

(assert (=> b!239182 (= e!155294 (and (= (size!5971 (_values!4419 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10480 thiss!1504))) (= (size!5972 (_keys!6538 thiss!1504)) (size!5971 (_values!4419 thiss!1504))) (bvslt (mask!10480 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!239183 () Bool)

(declare-datatypes ((Unit!7342 0))(
  ( (Unit!7343) )
))
(declare-fun e!155300 () Unit!7342)

(declare-fun lt!120741 () Unit!7342)

(assert (=> b!239183 (= e!155300 lt!120741)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!340 (array!11859 array!11857 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 64) Int) Unit!7342)

(assert (=> b!239183 (= lt!120741 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!340 (_keys!6538 thiss!1504) (_values!4419 thiss!1504) (mask!10480 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) key!932 (defaultEntry!4436 thiss!1504)))))

(declare-fun c!39874 () Bool)

(assert (=> b!239183 (= c!39874 (is-MissingZero!1029 lt!120739))))

(assert (=> b!239183 e!155304))

(declare-fun b!239184 () Bool)

(declare-fun c!39875 () Bool)

(assert (=> b!239184 (= c!39875 (is-MissingVacant!1029 lt!120739))))

(declare-fun e!155298 () Bool)

(assert (=> b!239184 (= e!155304 e!155298)))

(declare-fun b!239185 () Bool)

(declare-fun e!155293 () Bool)

(declare-fun tp_is_empty!6289 () Bool)

(assert (=> b!239185 (= e!155293 tp_is_empty!6289)))

(declare-fun res!117219 () Bool)

(assert (=> start!22924 (=> (not res!117219) (not e!155295))))

(declare-fun valid!1381 (LongMapFixedSize!3502) Bool)

(assert (=> start!22924 (= res!117219 (valid!1381 thiss!1504))))

(assert (=> start!22924 e!155295))

(declare-fun e!155297 () Bool)

(assert (=> start!22924 e!155297))

(assert (=> start!22924 true))

(declare-fun b!239186 () Bool)

(declare-fun res!117218 () Bool)

(assert (=> b!239186 (= res!117218 (= (select (arr!5631 (_keys!6538 thiss!1504)) (index!6289 lt!120739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155302 () Bool)

(assert (=> b!239186 (=> (not res!117218) (not e!155302))))

(declare-fun b!239187 () Bool)

(assert (=> b!239187 (= e!155301 e!155294)))

(declare-fun res!117223 () Bool)

(assert (=> b!239187 (=> (not res!117223) (not e!155294))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239187 (= res!117223 (inRange!0 index!297 (mask!10480 thiss!1504)))))

(declare-fun lt!120740 () Unit!7342)

(assert (=> b!239187 (= lt!120740 e!155300)))

(declare-fun c!39873 () Bool)

(declare-datatypes ((tuple2!4700 0))(
  ( (tuple2!4701 (_1!2361 (_ BitVec 64)) (_2!2361 V!8033)) )
))
(declare-datatypes ((List!3592 0))(
  ( (Nil!3589) (Cons!3588 (h!4244 tuple2!4700) (t!8587 List!3592)) )
))
(declare-datatypes ((ListLongMap!3613 0))(
  ( (ListLongMap!3614 (toList!1822 List!3592)) )
))
(declare-fun contains!1710 (ListLongMap!3613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1350 (array!11859 array!11857 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 32) Int) ListLongMap!3613)

(assert (=> b!239187 (= c!39873 (contains!1710 (getCurrentListMap!1350 (_keys!6538 thiss!1504) (_values!4419 thiss!1504) (mask!10480 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4436 thiss!1504)) key!932))))

(declare-fun bm!22238 () Bool)

(declare-fun call!22242 () Bool)

(declare-fun arrayContainsKey!0 (array!11859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22238 (= call!22242 (arrayContainsKey!0 (_keys!6538 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239188 () Bool)

(declare-fun res!117227 () Bool)

(assert (=> b!239188 (=> (not res!117227) (not e!155295))))

(assert (=> b!239188 (= res!117227 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!155303 () Bool)

(declare-fun array_inv!3725 (array!11859) Bool)

(declare-fun array_inv!3726 (array!11857) Bool)

(assert (=> b!239189 (= e!155297 (and tp!22485 tp_is_empty!6289 (array_inv!3725 (_keys!6538 thiss!1504)) (array_inv!3726 (_values!4419 thiss!1504)) e!155303))))

(declare-fun b!239190 () Bool)

(assert (=> b!239190 (= e!155298 (is-Undefined!1029 lt!120739))))

(declare-fun mapNonEmpty!10665 () Bool)

(declare-fun tp!22484 () Bool)

(declare-fun e!155299 () Bool)

(assert (=> mapNonEmpty!10665 (= mapRes!10665 (and tp!22484 e!155299))))

(declare-fun mapKey!10665 () (_ BitVec 32))

(declare-fun mapValue!10665 () ValueCell!2801)

(declare-fun mapRest!10665 () (Array (_ BitVec 32) ValueCell!2801))

(assert (=> mapNonEmpty!10665 (= (arr!5630 (_values!4419 thiss!1504)) (store mapRest!10665 mapKey!10665 mapValue!10665))))

(declare-fun b!239191 () Bool)

(assert (=> b!239191 (= e!155296 (not call!22242))))

(declare-fun b!239192 () Bool)

(declare-fun res!117224 () Bool)

(assert (=> b!239192 (=> (not res!117224) (not e!155296))))

(assert (=> b!239192 (= res!117224 (= (select (arr!5631 (_keys!6538 thiss!1504)) (index!6286 lt!120739)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239193 () Bool)

(declare-fun res!117225 () Bool)

(assert (=> b!239193 (=> (not res!117225) (not e!155294))))

(assert (=> b!239193 (= res!117225 (arrayContainsKey!0 (_keys!6538 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239194 () Bool)

(assert (=> b!239194 (= e!155298 e!155302)))

(declare-fun res!117221 () Bool)

(assert (=> b!239194 (= res!117221 call!22241)))

(assert (=> b!239194 (=> (not res!117221) (not e!155302))))

(declare-fun b!239195 () Bool)

(assert (=> b!239195 (= e!155302 (not call!22242))))

(declare-fun b!239196 () Bool)

(assert (=> b!239196 (= e!155299 tp_is_empty!6289)))

(declare-fun bm!22239 () Bool)

(assert (=> bm!22239 (= call!22241 (inRange!0 (ite c!39874 (index!6286 lt!120739) (index!6289 lt!120739)) (mask!10480 thiss!1504)))))

(declare-fun b!239197 () Bool)

(assert (=> b!239197 (= e!155303 (and e!155293 mapRes!10665))))

(declare-fun condMapEmpty!10665 () Bool)

(declare-fun mapDefault!10665 () ValueCell!2801)

