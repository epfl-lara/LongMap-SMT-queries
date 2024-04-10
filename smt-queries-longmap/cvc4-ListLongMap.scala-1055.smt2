; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22016 () Bool)

(assert start!22016)

(declare-fun b!226781 () Bool)

(declare-fun b_free!6083 () Bool)

(declare-fun b_next!6083 () Bool)

(assert (=> b!226781 (= b_free!6083 (not b_next!6083))))

(declare-fun tp!21391 () Bool)

(declare-fun b_and!12981 () Bool)

(assert (=> b!226781 (= tp!21391 b_and!12981)))

(declare-fun b!226777 () Bool)

(declare-fun res!111646 () Bool)

(declare-fun e!147132 () Bool)

(assert (=> b!226777 (=> res!111646 e!147132)))

(declare-datatypes ((V!7573 0))(
  ( (V!7574 (val!3017 Int)) )
))
(declare-datatypes ((ValueCell!2629 0))(
  ( (ValueCellFull!2629 (v!5037 V!7573)) (EmptyCell!2629) )
))
(declare-datatypes ((array!11133 0))(
  ( (array!11134 (arr!5286 (Array (_ BitVec 32) ValueCell!2629)) (size!5619 (_ BitVec 32))) )
))
(declare-datatypes ((array!11135 0))(
  ( (array!11136 (arr!5287 (Array (_ BitVec 32) (_ BitVec 64))) (size!5620 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3158 0))(
  ( (LongMapFixedSize!3159 (defaultEntry!4238 Int) (mask!10092 (_ BitVec 32)) (extraKeys!3975 (_ BitVec 32)) (zeroValue!4079 V!7573) (minValue!4079 V!7573) (_size!1628 (_ BitVec 32)) (_keys!6292 array!11135) (_values!4221 array!11133) (_vacant!1628 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3158)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11135 (_ BitVec 32)) Bool)

(assert (=> b!226777 (= res!111646 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6292 thiss!1504) (mask!10092 thiss!1504))))))

(declare-fun b!226778 () Bool)

(declare-fun e!147128 () Bool)

(declare-fun e!147125 () Bool)

(assert (=> b!226778 (= e!147128 e!147125)))

(declare-fun res!111654 () Bool)

(assert (=> b!226778 (=> (not res!111654) (not e!147125))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226778 (= res!111654 (inRange!0 index!297 (mask!10092 thiss!1504)))))

(declare-datatypes ((Unit!6866 0))(
  ( (Unit!6867) )
))
(declare-fun lt!114133 () Unit!6866)

(declare-fun e!147126 () Unit!6866)

(assert (=> b!226778 (= lt!114133 e!147126)))

(declare-fun c!37594 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4462 0))(
  ( (tuple2!4463 (_1!2242 (_ BitVec 64)) (_2!2242 V!7573)) )
))
(declare-datatypes ((List!3380 0))(
  ( (Nil!3377) (Cons!3376 (h!4024 tuple2!4462) (t!8339 List!3380)) )
))
(declare-datatypes ((ListLongMap!3375 0))(
  ( (ListLongMap!3376 (toList!1703 List!3380)) )
))
(declare-fun contains!1577 (ListLongMap!3375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1231 (array!11135 array!11133 (_ BitVec 32) (_ BitVec 32) V!7573 V!7573 (_ BitVec 32) Int) ListLongMap!3375)

(assert (=> b!226778 (= c!37594 (contains!1577 (getCurrentListMap!1231 (_keys!6292 thiss!1504) (_values!4221 thiss!1504) (mask!10092 thiss!1504) (extraKeys!3975 thiss!1504) (zeroValue!4079 thiss!1504) (minValue!4079 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4238 thiss!1504)) key!932))))

(declare-fun b!226779 () Bool)

(declare-fun e!147122 () Bool)

(declare-fun tp_is_empty!5945 () Bool)

(assert (=> b!226779 (= e!147122 tp_is_empty!5945)))

(declare-fun b!226780 () Bool)

(declare-fun e!147120 () Unit!6866)

(declare-fun Unit!6868 () Unit!6866)

(assert (=> b!226780 (= e!147120 Unit!6868)))

(declare-fun lt!114135 () Unit!6866)

(declare-fun lemmaArrayContainsKeyThenInListMap!98 (array!11135 array!11133 (_ BitVec 32) (_ BitVec 32) V!7573 V!7573 (_ BitVec 64) (_ BitVec 32) Int) Unit!6866)

(assert (=> b!226780 (= lt!114135 (lemmaArrayContainsKeyThenInListMap!98 (_keys!6292 thiss!1504) (_values!4221 thiss!1504) (mask!10092 thiss!1504) (extraKeys!3975 thiss!1504) (zeroValue!4079 thiss!1504) (minValue!4079 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4238 thiss!1504)))))

(assert (=> b!226780 false))

(declare-fun e!147130 () Bool)

(declare-fun e!147127 () Bool)

(declare-fun array_inv!3495 (array!11135) Bool)

(declare-fun array_inv!3496 (array!11133) Bool)

(assert (=> b!226781 (= e!147127 (and tp!21391 tp_is_empty!5945 (array_inv!3495 (_keys!6292 thiss!1504)) (array_inv!3496 (_values!4221 thiss!1504)) e!147130))))

(declare-fun b!226783 () Bool)

(declare-fun e!147131 () Bool)

(declare-fun call!21083 () Bool)

(assert (=> b!226783 (= e!147131 (not call!21083))))

(declare-fun c!37593 () Bool)

(declare-fun bm!21080 () Bool)

(declare-datatypes ((SeekEntryResult!887 0))(
  ( (MissingZero!887 (index!5718 (_ BitVec 32))) (Found!887 (index!5719 (_ BitVec 32))) (Intermediate!887 (undefined!1699 Bool) (index!5720 (_ BitVec 32)) (x!23243 (_ BitVec 32))) (Undefined!887) (MissingVacant!887 (index!5721 (_ BitVec 32))) )
))
(declare-fun lt!114136 () SeekEntryResult!887)

(declare-fun call!21084 () Bool)

(assert (=> bm!21080 (= call!21084 (inRange!0 (ite c!37593 (index!5718 lt!114136) (index!5721 lt!114136)) (mask!10092 thiss!1504)))))

(declare-fun mapIsEmpty!10087 () Bool)

(declare-fun mapRes!10087 () Bool)

(assert (=> mapIsEmpty!10087 mapRes!10087))

(declare-fun bm!21081 () Bool)

(declare-fun arrayContainsKey!0 (array!11135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21081 (= call!21083 (arrayContainsKey!0 (_keys!6292 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226784 () Bool)

(declare-fun c!37595 () Bool)

(assert (=> b!226784 (= c!37595 (is-MissingVacant!887 lt!114136))))

(declare-fun e!147121 () Bool)

(declare-fun e!147134 () Bool)

(assert (=> b!226784 (= e!147121 e!147134)))

(declare-fun b!226785 () Bool)

(declare-fun e!147124 () Bool)

(assert (=> b!226785 (= e!147124 e!147128)))

(declare-fun res!111651 () Bool)

(assert (=> b!226785 (=> (not res!111651) (not e!147128))))

(assert (=> b!226785 (= res!111651 (or (= lt!114136 (MissingZero!887 index!297)) (= lt!114136 (MissingVacant!887 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11135 (_ BitVec 32)) SeekEntryResult!887)

(assert (=> b!226785 (= lt!114136 (seekEntryOrOpen!0 key!932 (_keys!6292 thiss!1504) (mask!10092 thiss!1504)))))

(declare-fun b!226786 () Bool)

(declare-fun res!111655 () Bool)

(assert (=> b!226786 (=> res!111655 e!147132)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226786 (= res!111655 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226787 () Bool)

(declare-fun e!147123 () Bool)

(assert (=> b!226787 (= e!147123 tp_is_empty!5945)))

(declare-fun b!226788 () Bool)

(assert (=> b!226788 (= e!147125 (not e!147132))))

(declare-fun res!111650 () Bool)

(assert (=> b!226788 (=> res!111650 e!147132)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226788 (= res!111650 (not (validMask!0 (mask!10092 thiss!1504))))))

(declare-fun lt!114141 () array!11135)

(declare-fun arrayCountValidKeys!0 (array!11135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226788 (= (arrayCountValidKeys!0 lt!114141 #b00000000000000000000000000000000 (size!5620 (_keys!6292 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6292 thiss!1504) #b00000000000000000000000000000000 (size!5620 (_keys!6292 thiss!1504)))))))

(declare-fun lt!114134 () Unit!6866)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11135 (_ BitVec 32) (_ BitVec 64)) Unit!6866)

(assert (=> b!226788 (= lt!114134 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6292 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3381 0))(
  ( (Nil!3378) (Cons!3377 (h!4025 (_ BitVec 64)) (t!8340 List!3381)) )
))
(declare-fun arrayNoDuplicates!0 (array!11135 (_ BitVec 32) List!3381) Bool)

(assert (=> b!226788 (arrayNoDuplicates!0 lt!114141 #b00000000000000000000000000000000 Nil!3378)))

(assert (=> b!226788 (= lt!114141 (array!11136 (store (arr!5287 (_keys!6292 thiss!1504)) index!297 key!932) (size!5620 (_keys!6292 thiss!1504))))))

(declare-fun lt!114137 () Unit!6866)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3381) Unit!6866)

(assert (=> b!226788 (= lt!114137 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6292 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3378))))

(declare-fun lt!114139 () Unit!6866)

(assert (=> b!226788 (= lt!114139 e!147120)))

(declare-fun c!37596 () Bool)

(declare-fun lt!114142 () Bool)

(assert (=> b!226788 (= c!37596 lt!114142)))

(assert (=> b!226788 (= lt!114142 (arrayContainsKey!0 (_keys!6292 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226789 () Bool)

(declare-fun Unit!6869 () Unit!6866)

(assert (=> b!226789 (= e!147120 Unit!6869)))

(declare-fun b!226790 () Bool)

(assert (=> b!226790 (= e!147130 (and e!147123 mapRes!10087))))

(declare-fun condMapEmpty!10087 () Bool)

(declare-fun mapDefault!10087 () ValueCell!2629)

