; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21826 () Bool)

(assert start!21826)

(declare-fun b!219483 () Bool)

(declare-fun b_free!5893 () Bool)

(declare-fun b_next!5893 () Bool)

(assert (=> b!219483 (= b_free!5893 (not b_next!5893))))

(declare-fun tp!20821 () Bool)

(declare-fun b_and!12791 () Bool)

(assert (=> b!219483 (= tp!20821 b_and!12791)))

(declare-fun b!219466 () Bool)

(declare-datatypes ((Unit!6541 0))(
  ( (Unit!6542) )
))
(declare-fun e!142751 () Unit!6541)

(declare-fun Unit!6543 () Unit!6541)

(assert (=> b!219466 (= e!142751 Unit!6543)))

(declare-fun lt!111961 () Unit!6541)

(declare-datatypes ((V!7321 0))(
  ( (V!7322 (val!2922 Int)) )
))
(declare-datatypes ((ValueCell!2534 0))(
  ( (ValueCellFull!2534 (v!4942 V!7321)) (EmptyCell!2534) )
))
(declare-datatypes ((array!10753 0))(
  ( (array!10754 (arr!5096 (Array (_ BitVec 32) ValueCell!2534)) (size!5429 (_ BitVec 32))) )
))
(declare-datatypes ((array!10755 0))(
  ( (array!10756 (arr!5097 (Array (_ BitVec 32) (_ BitVec 64))) (size!5430 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2968 0))(
  ( (LongMapFixedSize!2969 (defaultEntry!4143 Int) (mask!9935 (_ BitVec 32)) (extraKeys!3880 (_ BitVec 32)) (zeroValue!3984 V!7321) (minValue!3984 V!7321) (_size!1533 (_ BitVec 32)) (_keys!6197 array!10755) (_values!4126 array!10753) (_vacant!1533 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2968)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!194 (array!10755 array!10753 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 64) Int) Unit!6541)

(assert (=> b!219466 (= lt!111961 (lemmaInListMapThenSeekEntryOrOpenFindsIt!194 (_keys!6197 thiss!1504) (_values!4126 thiss!1504) (mask!9935 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) key!932 (defaultEntry!4143 thiss!1504)))))

(assert (=> b!219466 false))

(declare-fun b!219467 () Bool)

(declare-fun e!142758 () Bool)

(assert (=> b!219467 (= e!142758 false)))

(declare-fun lt!111958 () Bool)

(declare-datatypes ((List!3240 0))(
  ( (Nil!3237) (Cons!3236 (h!3884 (_ BitVec 64)) (t!8199 List!3240)) )
))
(declare-fun arrayNoDuplicates!0 (array!10755 (_ BitVec 32) List!3240) Bool)

(assert (=> b!219467 (= lt!111958 (arrayNoDuplicates!0 (_keys!6197 thiss!1504) #b00000000000000000000000000000000 Nil!3237))))

(declare-fun b!219468 () Bool)

(declare-fun e!142763 () Bool)

(declare-fun tp_is_empty!5755 () Bool)

(assert (=> b!219468 (= e!142763 tp_is_empty!5755)))

(declare-fun b!219469 () Bool)

(declare-fun e!142761 () Bool)

(assert (=> b!219469 (= e!142761 tp_is_empty!5755)))

(declare-fun b!219470 () Bool)

(declare-fun res!107566 () Bool)

(declare-fun e!142757 () Bool)

(assert (=> b!219470 (=> (not res!107566) (not e!142757))))

(declare-datatypes ((SeekEntryResult!797 0))(
  ( (MissingZero!797 (index!5358 (_ BitVec 32))) (Found!797 (index!5359 (_ BitVec 32))) (Intermediate!797 (undefined!1609 Bool) (index!5360 (_ BitVec 32)) (x!22905 (_ BitVec 32))) (Undefined!797) (MissingVacant!797 (index!5361 (_ BitVec 32))) )
))
(declare-fun lt!111962 () SeekEntryResult!797)

(assert (=> b!219470 (= res!107566 (= (select (arr!5097 (_keys!6197 thiss!1504)) (index!5358 lt!111962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219471 () Bool)

(declare-fun lt!111959 () Unit!6541)

(assert (=> b!219471 (= e!142751 lt!111959)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!205 (array!10755 array!10753 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 64) Int) Unit!6541)

(assert (=> b!219471 (= lt!111959 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!205 (_keys!6197 thiss!1504) (_values!4126 thiss!1504) (mask!9935 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) key!932 (defaultEntry!4143 thiss!1504)))))

(declare-fun c!36550 () Bool)

(assert (=> b!219471 (= c!36550 (is-MissingZero!797 lt!111962))))

(declare-fun e!142755 () Bool)

(assert (=> b!219471 e!142755))

(declare-fun res!107568 () Bool)

(declare-fun e!142752 () Bool)

(assert (=> start!21826 (=> (not res!107568) (not e!142752))))

(declare-fun valid!1201 (LongMapFixedSize!2968) Bool)

(assert (=> start!21826 (= res!107568 (valid!1201 thiss!1504))))

(assert (=> start!21826 e!142752))

(declare-fun e!142760 () Bool)

(assert (=> start!21826 e!142760))

(assert (=> start!21826 true))

(declare-fun bm!20510 () Bool)

(declare-fun call!20514 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20510 (= call!20514 (inRange!0 (ite c!36550 (index!5358 lt!111962) (index!5361 lt!111962)) (mask!9935 thiss!1504)))))

(declare-fun b!219472 () Bool)

(declare-fun e!142756 () Bool)

(declare-fun e!142762 () Bool)

(assert (=> b!219472 (= e!142756 e!142762)))

(declare-fun res!107560 () Bool)

(assert (=> b!219472 (= res!107560 call!20514)))

(assert (=> b!219472 (=> (not res!107560) (not e!142762))))

(declare-fun b!219473 () Bool)

(assert (=> b!219473 (= e!142756 (is-Undefined!797 lt!111962))))

(declare-fun b!219474 () Bool)

(declare-fun call!20513 () Bool)

(assert (=> b!219474 (= e!142762 (not call!20513))))

(declare-fun b!219475 () Bool)

(declare-fun c!36551 () Bool)

(assert (=> b!219475 (= c!36551 (is-MissingVacant!797 lt!111962))))

(assert (=> b!219475 (= e!142755 e!142756)))

(declare-fun b!219476 () Bool)

(declare-fun e!142759 () Bool)

(assert (=> b!219476 (= e!142752 e!142759)))

(declare-fun res!107567 () Bool)

(assert (=> b!219476 (=> (not res!107567) (not e!142759))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219476 (= res!107567 (or (= lt!111962 (MissingZero!797 index!297)) (= lt!111962 (MissingVacant!797 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10755 (_ BitVec 32)) SeekEntryResult!797)

(assert (=> b!219476 (= lt!111962 (seekEntryOrOpen!0 key!932 (_keys!6197 thiss!1504) (mask!9935 thiss!1504)))))

(declare-fun b!219477 () Bool)

(declare-fun res!107563 () Bool)

(assert (=> b!219477 (=> (not res!107563) (not e!142758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219477 (= res!107563 (validMask!0 (mask!9935 thiss!1504)))))

(declare-fun b!219478 () Bool)

(assert (=> b!219478 (= e!142757 (not call!20513))))

(declare-fun bm!20511 () Bool)

(declare-fun arrayContainsKey!0 (array!10755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20511 (= call!20513 (arrayContainsKey!0 (_keys!6197 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219479 () Bool)

(declare-fun res!107562 () Bool)

(assert (=> b!219479 (=> (not res!107562) (not e!142752))))

(assert (=> b!219479 (= res!107562 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219480 () Bool)

(declare-fun res!107559 () Bool)

(assert (=> b!219480 (=> (not res!107559) (not e!142758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10755 (_ BitVec 32)) Bool)

(assert (=> b!219480 (= res!107559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6197 thiss!1504) (mask!9935 thiss!1504)))))

(declare-fun b!219481 () Bool)

(declare-fun res!107569 () Bool)

(assert (=> b!219481 (=> (not res!107569) (not e!142758))))

(assert (=> b!219481 (= res!107569 (arrayContainsKey!0 (_keys!6197 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219482 () Bool)

(assert (=> b!219482 (= e!142759 e!142758)))

(declare-fun res!107564 () Bool)

(assert (=> b!219482 (=> (not res!107564) (not e!142758))))

(assert (=> b!219482 (= res!107564 (inRange!0 index!297 (mask!9935 thiss!1504)))))

(declare-fun lt!111960 () Unit!6541)

(assert (=> b!219482 (= lt!111960 e!142751)))

(declare-fun c!36552 () Bool)

(declare-datatypes ((tuple2!4338 0))(
  ( (tuple2!4339 (_1!2180 (_ BitVec 64)) (_2!2180 V!7321)) )
))
(declare-datatypes ((List!3241 0))(
  ( (Nil!3238) (Cons!3237 (h!3885 tuple2!4338) (t!8200 List!3241)) )
))
(declare-datatypes ((ListLongMap!3251 0))(
  ( (ListLongMap!3252 (toList!1641 List!3241)) )
))
(declare-fun contains!1484 (ListLongMap!3251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1169 (array!10755 array!10753 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 32) Int) ListLongMap!3251)

(assert (=> b!219482 (= c!36552 (contains!1484 (getCurrentListMap!1169 (_keys!6197 thiss!1504) (_values!4126 thiss!1504) (mask!9935 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4143 thiss!1504)) key!932))))

(declare-fun e!142754 () Bool)

(declare-fun array_inv!3375 (array!10755) Bool)

(declare-fun array_inv!3376 (array!10753) Bool)

(assert (=> b!219483 (= e!142760 (and tp!20821 tp_is_empty!5755 (array_inv!3375 (_keys!6197 thiss!1504)) (array_inv!3376 (_values!4126 thiss!1504)) e!142754))))

(declare-fun b!219484 () Bool)

(declare-fun res!107558 () Bool)

(assert (=> b!219484 (= res!107558 (= (select (arr!5097 (_keys!6197 thiss!1504)) (index!5361 lt!111962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219484 (=> (not res!107558) (not e!142762))))

(declare-fun mapNonEmpty!9802 () Bool)

(declare-fun mapRes!9802 () Bool)

(declare-fun tp!20820 () Bool)

(assert (=> mapNonEmpty!9802 (= mapRes!9802 (and tp!20820 e!142761))))

(declare-fun mapRest!9802 () (Array (_ BitVec 32) ValueCell!2534))

(declare-fun mapKey!9802 () (_ BitVec 32))

(declare-fun mapValue!9802 () ValueCell!2534)

(assert (=> mapNonEmpty!9802 (= (arr!5096 (_values!4126 thiss!1504)) (store mapRest!9802 mapKey!9802 mapValue!9802))))

(declare-fun b!219485 () Bool)

(declare-fun res!107561 () Bool)

(assert (=> b!219485 (=> (not res!107561) (not e!142757))))

(assert (=> b!219485 (= res!107561 call!20514)))

(assert (=> b!219485 (= e!142755 e!142757)))

(declare-fun b!219486 () Bool)

(assert (=> b!219486 (= e!142754 (and e!142763 mapRes!9802))))

(declare-fun condMapEmpty!9802 () Bool)

(declare-fun mapDefault!9802 () ValueCell!2534)

