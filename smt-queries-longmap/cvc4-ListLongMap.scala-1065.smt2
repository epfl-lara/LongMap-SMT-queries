; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22076 () Bool)

(assert start!22076)

(declare-fun b!228856 () Bool)

(declare-fun b_free!6143 () Bool)

(declare-fun b_next!6143 () Bool)

(assert (=> b!228856 (= b_free!6143 (not b_next!6143))))

(declare-fun tp!21571 () Bool)

(declare-fun b_and!13041 () Bool)

(assert (=> b!228856 (= tp!21571 b_and!13041)))

(declare-fun b!228849 () Bool)

(declare-fun res!112643 () Bool)

(declare-fun e!148470 () Bool)

(assert (=> b!228849 (=> res!112643 e!148470)))

(declare-datatypes ((V!7653 0))(
  ( (V!7654 (val!3047 Int)) )
))
(declare-datatypes ((ValueCell!2659 0))(
  ( (ValueCellFull!2659 (v!5067 V!7653)) (EmptyCell!2659) )
))
(declare-datatypes ((array!11253 0))(
  ( (array!11254 (arr!5346 (Array (_ BitVec 32) ValueCell!2659)) (size!5679 (_ BitVec 32))) )
))
(declare-datatypes ((array!11255 0))(
  ( (array!11256 (arr!5347 (Array (_ BitVec 32) (_ BitVec 64))) (size!5680 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3218 0))(
  ( (LongMapFixedSize!3219 (defaultEntry!4268 Int) (mask!10142 (_ BitVec 32)) (extraKeys!4005 (_ BitVec 32)) (zeroValue!4109 V!7653) (minValue!4109 V!7653) (_size!1658 (_ BitVec 32)) (_keys!6322 array!11255) (_values!4251 array!11253) (_vacant!1658 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3218)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11255 (_ BitVec 32)) Bool)

(assert (=> b!228849 (= res!112643 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6322 thiss!1504) (mask!10142 thiss!1504))))))

(declare-fun b!228850 () Bool)

(declare-fun res!112642 () Bool)

(declare-fun e!148482 () Bool)

(assert (=> b!228850 (=> (not res!112642) (not e!148482))))

(declare-fun call!21264 () Bool)

(assert (=> b!228850 (= res!112642 call!21264)))

(declare-fun e!148481 () Bool)

(assert (=> b!228850 (= e!148481 e!148482)))

(declare-fun mapIsEmpty!10177 () Bool)

(declare-fun mapRes!10177 () Bool)

(assert (=> mapIsEmpty!10177 mapRes!10177))

(declare-fun b!228851 () Bool)

(declare-fun res!112644 () Bool)

(declare-fun e!148473 () Bool)

(assert (=> b!228851 (=> (not res!112644) (not e!148473))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!228851 (= res!112644 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228852 () Bool)

(declare-datatypes ((Unit!6968 0))(
  ( (Unit!6969) )
))
(declare-fun e!148479 () Unit!6968)

(declare-fun lt!115125 () Unit!6968)

(assert (=> b!228852 (= e!148479 lt!115125)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!291 (array!11255 array!11253 (_ BitVec 32) (_ BitVec 32) V!7653 V!7653 (_ BitVec 64) Int) Unit!6968)

(assert (=> b!228852 (= lt!115125 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!291 (_keys!6322 thiss!1504) (_values!4251 thiss!1504) (mask!10142 thiss!1504) (extraKeys!4005 thiss!1504) (zeroValue!4109 thiss!1504) (minValue!4109 thiss!1504) key!932 (defaultEntry!4268 thiss!1504)))))

(declare-fun c!37956 () Bool)

(declare-datatypes ((SeekEntryResult!913 0))(
  ( (MissingZero!913 (index!5822 (_ BitVec 32))) (Found!913 (index!5823 (_ BitVec 32))) (Intermediate!913 (undefined!1725 Bool) (index!5824 (_ BitVec 32)) (x!23349 (_ BitVec 32))) (Undefined!913) (MissingVacant!913 (index!5825 (_ BitVec 32))) )
))
(declare-fun lt!115124 () SeekEntryResult!913)

(assert (=> b!228852 (= c!37956 (is-MissingZero!913 lt!115124))))

(assert (=> b!228852 e!148481))

(declare-fun b!228853 () Bool)

(declare-fun Unit!6970 () Unit!6968)

(assert (=> b!228853 (= e!148479 Unit!6970)))

(declare-fun lt!115130 () Unit!6968)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!276 (array!11255 array!11253 (_ BitVec 32) (_ BitVec 32) V!7653 V!7653 (_ BitVec 64) Int) Unit!6968)

(assert (=> b!228853 (= lt!115130 (lemmaInListMapThenSeekEntryOrOpenFindsIt!276 (_keys!6322 thiss!1504) (_values!4251 thiss!1504) (mask!10142 thiss!1504) (extraKeys!4005 thiss!1504) (zeroValue!4109 thiss!1504) (minValue!4109 thiss!1504) key!932 (defaultEntry!4268 thiss!1504)))))

(assert (=> b!228853 false))

(declare-fun b!228854 () Bool)

(declare-fun e!148475 () Bool)

(assert (=> b!228854 (= e!148475 (not e!148470))))

(declare-fun res!112636 () Bool)

(assert (=> b!228854 (=> res!112636 e!148470)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228854 (= res!112636 (not (validMask!0 (mask!10142 thiss!1504))))))

(declare-fun lt!115128 () array!11255)

(assert (=> b!228854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115128 (mask!10142 thiss!1504))))

(declare-fun lt!115133 () Unit!6968)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11255 (_ BitVec 32) (_ BitVec 32)) Unit!6968)

(assert (=> b!228854 (= lt!115133 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6322 thiss!1504) index!297 (mask!10142 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11255 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228854 (= (arrayCountValidKeys!0 lt!115128 #b00000000000000000000000000000000 (size!5680 (_keys!6322 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6322 thiss!1504) #b00000000000000000000000000000000 (size!5680 (_keys!6322 thiss!1504)))))))

(declare-fun lt!115126 () Unit!6968)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11255 (_ BitVec 32) (_ BitVec 64)) Unit!6968)

(assert (=> b!228854 (= lt!115126 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6322 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3419 0))(
  ( (Nil!3416) (Cons!3415 (h!4063 (_ BitVec 64)) (t!8378 List!3419)) )
))
(declare-fun arrayNoDuplicates!0 (array!11255 (_ BitVec 32) List!3419) Bool)

(assert (=> b!228854 (arrayNoDuplicates!0 lt!115128 #b00000000000000000000000000000000 Nil!3416)))

(assert (=> b!228854 (= lt!115128 (array!11256 (store (arr!5347 (_keys!6322 thiss!1504)) index!297 key!932) (size!5680 (_keys!6322 thiss!1504))))))

(declare-fun lt!115132 () Unit!6968)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3419) Unit!6968)

(assert (=> b!228854 (= lt!115132 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6322 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3416))))

(declare-fun lt!115123 () Unit!6968)

(declare-fun e!148476 () Unit!6968)

(assert (=> b!228854 (= lt!115123 e!148476)))

(declare-fun c!37955 () Bool)

(declare-fun arrayContainsKey!0 (array!11255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228854 (= c!37955 (arrayContainsKey!0 (_keys!6322 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228855 () Bool)

(declare-fun e!148484 () Bool)

(assert (=> b!228855 (= e!148484 e!148475)))

(declare-fun res!112638 () Bool)

(assert (=> b!228855 (=> (not res!112638) (not e!148475))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228855 (= res!112638 (inRange!0 index!297 (mask!10142 thiss!1504)))))

(declare-fun lt!115127 () Unit!6968)

(assert (=> b!228855 (= lt!115127 e!148479)))

(declare-fun c!37954 () Bool)

(declare-datatypes ((tuple2!4496 0))(
  ( (tuple2!4497 (_1!2259 (_ BitVec 64)) (_2!2259 V!7653)) )
))
(declare-datatypes ((List!3420 0))(
  ( (Nil!3417) (Cons!3416 (h!4064 tuple2!4496) (t!8379 List!3420)) )
))
(declare-datatypes ((ListLongMap!3409 0))(
  ( (ListLongMap!3410 (toList!1720 List!3420)) )
))
(declare-fun contains!1594 (ListLongMap!3409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1248 (array!11255 array!11253 (_ BitVec 32) (_ BitVec 32) V!7653 V!7653 (_ BitVec 32) Int) ListLongMap!3409)

(assert (=> b!228855 (= c!37954 (contains!1594 (getCurrentListMap!1248 (_keys!6322 thiss!1504) (_values!4251 thiss!1504) (mask!10142 thiss!1504) (extraKeys!4005 thiss!1504) (zeroValue!4109 thiss!1504) (minValue!4109 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4268 thiss!1504)) key!932))))

(declare-fun e!148480 () Bool)

(declare-fun e!148478 () Bool)

(declare-fun tp_is_empty!6005 () Bool)

(declare-fun array_inv!3531 (array!11255) Bool)

(declare-fun array_inv!3532 (array!11253) Bool)

(assert (=> b!228856 (= e!148480 (and tp!21571 tp_is_empty!6005 (array_inv!3531 (_keys!6322 thiss!1504)) (array_inv!3532 (_values!4251 thiss!1504)) e!148478))))

(declare-fun b!228858 () Bool)

(declare-fun e!148474 () Bool)

(assert (=> b!228858 (= e!148474 tp_is_empty!6005)))

(declare-fun b!228859 () Bool)

(assert (=> b!228859 (= e!148473 e!148484)))

(declare-fun res!112637 () Bool)

(assert (=> b!228859 (=> (not res!112637) (not e!148484))))

(assert (=> b!228859 (= res!112637 (or (= lt!115124 (MissingZero!913 index!297)) (= lt!115124 (MissingVacant!913 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11255 (_ BitVec 32)) SeekEntryResult!913)

(assert (=> b!228859 (= lt!115124 (seekEntryOrOpen!0 key!932 (_keys!6322 thiss!1504) (mask!10142 thiss!1504)))))

(declare-fun b!228860 () Bool)

(declare-fun c!37953 () Bool)

(assert (=> b!228860 (= c!37953 (is-MissingVacant!913 lt!115124))))

(declare-fun e!148477 () Bool)

(assert (=> b!228860 (= e!148481 e!148477)))

(declare-fun b!228861 () Bool)

(assert (=> b!228861 (= e!148470 true)))

(declare-fun lt!115131 () Bool)

(assert (=> b!228861 (= lt!115131 (arrayNoDuplicates!0 (_keys!6322 thiss!1504) #b00000000000000000000000000000000 Nil!3416))))

(declare-fun b!228862 () Bool)

(assert (=> b!228862 (= e!148477 (is-Undefined!913 lt!115124))))

(declare-fun b!228863 () Bool)

(declare-fun res!112645 () Bool)

(assert (=> b!228863 (= res!112645 (= (select (arr!5347 (_keys!6322 thiss!1504)) (index!5825 lt!115124)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148472 () Bool)

(assert (=> b!228863 (=> (not res!112645) (not e!148472))))

(declare-fun b!228864 () Bool)

(declare-fun call!21263 () Bool)

(assert (=> b!228864 (= e!148472 (not call!21263))))

(declare-fun bm!21260 () Bool)

(assert (=> bm!21260 (= call!21263 (arrayContainsKey!0 (_keys!6322 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228865 () Bool)

(declare-fun e!148471 () Bool)

(assert (=> b!228865 (= e!148478 (and e!148471 mapRes!10177))))

(declare-fun condMapEmpty!10177 () Bool)

(declare-fun mapDefault!10177 () ValueCell!2659)

