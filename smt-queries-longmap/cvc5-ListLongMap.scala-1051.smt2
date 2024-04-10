; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21988 () Bool)

(assert start!21988)

(declare-fun b!225727 () Bool)

(declare-fun b_free!6055 () Bool)

(declare-fun b_next!6055 () Bool)

(assert (=> b!225727 (= b_free!6055 (not b_next!6055))))

(declare-fun tp!21306 () Bool)

(declare-fun b_and!12953 () Bool)

(assert (=> b!225727 (= tp!21306 b_and!12953)))

(declare-fun e!146500 () Bool)

(declare-datatypes ((V!7537 0))(
  ( (V!7538 (val!3003 Int)) )
))
(declare-datatypes ((ValueCell!2615 0))(
  ( (ValueCellFull!2615 (v!5023 V!7537)) (EmptyCell!2615) )
))
(declare-datatypes ((array!11077 0))(
  ( (array!11078 (arr!5258 (Array (_ BitVec 32) ValueCell!2615)) (size!5591 (_ BitVec 32))) )
))
(declare-datatypes ((array!11079 0))(
  ( (array!11080 (arr!5259 (Array (_ BitVec 32) (_ BitVec 64))) (size!5592 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3130 0))(
  ( (LongMapFixedSize!3131 (defaultEntry!4224 Int) (mask!10070 (_ BitVec 32)) (extraKeys!3961 (_ BitVec 32)) (zeroValue!4065 V!7537) (minValue!4065 V!7537) (_size!1614 (_ BitVec 32)) (_keys!6278 array!11079) (_values!4207 array!11077) (_vacant!1614 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3130)

(declare-fun e!146496 () Bool)

(declare-fun tp_is_empty!5917 () Bool)

(declare-fun array_inv!3479 (array!11079) Bool)

(declare-fun array_inv!3480 (array!11077) Bool)

(assert (=> b!225727 (= e!146500 (and tp!21306 tp_is_empty!5917 (array_inv!3479 (_keys!6278 thiss!1504)) (array_inv!3480 (_values!4207 thiss!1504)) e!146496))))

(declare-fun b!225728 () Bool)

(declare-fun e!146495 () Bool)

(declare-fun e!146504 () Bool)

(assert (=> b!225728 (= e!146495 e!146504)))

(declare-fun res!111106 () Bool)

(assert (=> b!225728 (=> (not res!111106) (not e!146504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225728 (= res!111106 (inRange!0 index!297 (mask!10070 thiss!1504)))))

(declare-datatypes ((Unit!6809 0))(
  ( (Unit!6810) )
))
(declare-fun lt!113672 () Unit!6809)

(declare-fun e!146499 () Unit!6809)

(assert (=> b!225728 (= lt!113672 e!146499)))

(declare-fun c!37428 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4446 0))(
  ( (tuple2!4447 (_1!2234 (_ BitVec 64)) (_2!2234 V!7537)) )
))
(declare-datatypes ((List!3360 0))(
  ( (Nil!3357) (Cons!3356 (h!4004 tuple2!4446) (t!8319 List!3360)) )
))
(declare-datatypes ((ListLongMap!3359 0))(
  ( (ListLongMap!3360 (toList!1695 List!3360)) )
))
(declare-fun contains!1569 (ListLongMap!3359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1223 (array!11079 array!11077 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 32) Int) ListLongMap!3359)

(assert (=> b!225728 (= c!37428 (contains!1569 (getCurrentListMap!1223 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4224 thiss!1504)) key!932))))

(declare-fun b!225729 () Bool)

(declare-fun Unit!6811 () Unit!6809)

(assert (=> b!225729 (= e!146499 Unit!6811)))

(declare-fun lt!113681 () Unit!6809)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!249 (array!11079 array!11077 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) Int) Unit!6809)

(assert (=> b!225729 (= lt!113681 (lemmaInListMapThenSeekEntryOrOpenFindsIt!249 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225729 false))

(declare-fun b!225730 () Bool)

(declare-fun lt!113677 () Unit!6809)

(assert (=> b!225730 (= e!146499 lt!113677)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!262 (array!11079 array!11077 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) Int) Unit!6809)

(assert (=> b!225730 (= lt!113677 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!262 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 (defaultEntry!4224 thiss!1504)))))

(declare-fun c!37426 () Bool)

(declare-datatypes ((SeekEntryResult!873 0))(
  ( (MissingZero!873 (index!5662 (_ BitVec 32))) (Found!873 (index!5663 (_ BitVec 32))) (Intermediate!873 (undefined!1685 Bool) (index!5664 (_ BitVec 32)) (x!23197 (_ BitVec 32))) (Undefined!873) (MissingVacant!873 (index!5665 (_ BitVec 32))) )
))
(declare-fun lt!113679 () SeekEntryResult!873)

(assert (=> b!225730 (= c!37426 (is-MissingZero!873 lt!113679))))

(declare-fun e!146492 () Bool)

(assert (=> b!225730 e!146492))

(declare-fun b!225731 () Bool)

(declare-fun e!146498 () Unit!6809)

(declare-fun Unit!6812 () Unit!6809)

(assert (=> b!225731 (= e!146498 Unit!6812)))

(declare-fun b!225732 () Bool)

(declare-fun e!146501 () Bool)

(assert (=> b!225732 (= e!146504 (not e!146501))))

(declare-fun res!111105 () Bool)

(assert (=> b!225732 (=> res!111105 e!146501)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225732 (= res!111105 (not (validMask!0 (mask!10070 thiss!1504))))))

(declare-fun lt!113673 () array!11079)

(declare-fun arrayCountValidKeys!0 (array!11079 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225732 (= (arrayCountValidKeys!0 lt!113673 #b00000000000000000000000000000000 (size!5592 (_keys!6278 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6278 thiss!1504) #b00000000000000000000000000000000 (size!5592 (_keys!6278 thiss!1504)))))))

(declare-fun lt!113678 () Unit!6809)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11079 (_ BitVec 32) (_ BitVec 64)) Unit!6809)

(assert (=> b!225732 (= lt!113678 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6278 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3361 0))(
  ( (Nil!3358) (Cons!3357 (h!4005 (_ BitVec 64)) (t!8320 List!3361)) )
))
(declare-fun arrayNoDuplicates!0 (array!11079 (_ BitVec 32) List!3361) Bool)

(assert (=> b!225732 (arrayNoDuplicates!0 lt!113673 #b00000000000000000000000000000000 Nil!3358)))

(assert (=> b!225732 (= lt!113673 (array!11080 (store (arr!5259 (_keys!6278 thiss!1504)) index!297 key!932) (size!5592 (_keys!6278 thiss!1504))))))

(declare-fun lt!113671 () Unit!6809)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11079 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3361) Unit!6809)

(assert (=> b!225732 (= lt!113671 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6278 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3358))))

(declare-fun lt!113675 () Unit!6809)

(assert (=> b!225732 (= lt!113675 e!146498)))

(declare-fun c!37427 () Bool)

(declare-fun lt!113676 () Bool)

(assert (=> b!225732 (= c!37427 lt!113676)))

(declare-fun arrayContainsKey!0 (array!11079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225732 (= lt!113676 (arrayContainsKey!0 (_keys!6278 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225733 () Bool)

(declare-fun e!146503 () Bool)

(assert (=> b!225733 (= e!146503 e!146495)))

(declare-fun res!111097 () Bool)

(assert (=> b!225733 (=> (not res!111097) (not e!146495))))

(assert (=> b!225733 (= res!111097 (or (= lt!113679 (MissingZero!873 index!297)) (= lt!113679 (MissingVacant!873 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11079 (_ BitVec 32)) SeekEntryResult!873)

(assert (=> b!225733 (= lt!113679 (seekEntryOrOpen!0 key!932 (_keys!6278 thiss!1504) (mask!10070 thiss!1504)))))

(declare-fun bm!20996 () Bool)

(declare-fun call!21000 () Bool)

(assert (=> bm!20996 (= call!21000 (inRange!0 (ite c!37426 (index!5662 lt!113679) (index!5665 lt!113679)) (mask!10070 thiss!1504)))))

(declare-fun b!225734 () Bool)

(declare-fun res!111101 () Bool)

(assert (=> b!225734 (=> res!111101 e!146501)))

(assert (=> b!225734 (= res!111101 lt!113676)))

(declare-fun mapNonEmpty!10045 () Bool)

(declare-fun mapRes!10045 () Bool)

(declare-fun tp!21307 () Bool)

(declare-fun e!146490 () Bool)

(assert (=> mapNonEmpty!10045 (= mapRes!10045 (and tp!21307 e!146490))))

(declare-fun mapValue!10045 () ValueCell!2615)

(declare-fun mapRest!10045 () (Array (_ BitVec 32) ValueCell!2615))

(declare-fun mapKey!10045 () (_ BitVec 32))

(assert (=> mapNonEmpty!10045 (= (arr!5258 (_values!4207 thiss!1504)) (store mapRest!10045 mapKey!10045 mapValue!10045))))

(declare-fun b!225735 () Bool)

(declare-fun res!111098 () Bool)

(assert (=> b!225735 (= res!111098 (= (select (arr!5259 (_keys!6278 thiss!1504)) (index!5665 lt!113679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146494 () Bool)

(assert (=> b!225735 (=> (not res!111098) (not e!146494))))

(declare-fun b!225736 () Bool)

(declare-fun e!146502 () Bool)

(assert (=> b!225736 (= e!146496 (and e!146502 mapRes!10045))))

(declare-fun condMapEmpty!10045 () Bool)

(declare-fun mapDefault!10045 () ValueCell!2615)

