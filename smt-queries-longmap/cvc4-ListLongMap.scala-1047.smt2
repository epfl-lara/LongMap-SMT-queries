; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21968 () Bool)

(assert start!21968)

(declare-fun b!224993 () Bool)

(declare-fun b_free!6035 () Bool)

(declare-fun b_next!6035 () Bool)

(assert (=> b!224993 (= b_free!6035 (not b_next!6035))))

(declare-fun tp!21247 () Bool)

(declare-fun b_and!12933 () Bool)

(assert (=> b!224993 (= tp!21247 b_and!12933)))

(declare-fun b!224977 () Bool)

(declare-fun e!146040 () Bool)

(declare-datatypes ((SeekEntryResult!863 0))(
  ( (MissingZero!863 (index!5622 (_ BitVec 32))) (Found!863 (index!5623 (_ BitVec 32))) (Intermediate!863 (undefined!1675 Bool) (index!5624 (_ BitVec 32)) (x!23155 (_ BitVec 32))) (Undefined!863) (MissingVacant!863 (index!5625 (_ BitVec 32))) )
))
(declare-fun lt!113341 () SeekEntryResult!863)

(assert (=> b!224977 (= e!146040 (is-Undefined!863 lt!113341))))

(declare-fun b!224978 () Bool)

(declare-datatypes ((Unit!6775 0))(
  ( (Unit!6776) )
))
(declare-fun e!146045 () Unit!6775)

(declare-fun Unit!6777 () Unit!6775)

(assert (=> b!224978 (= e!146045 Unit!6777)))

(declare-fun lt!113346 () Unit!6775)

(declare-datatypes ((V!7509 0))(
  ( (V!7510 (val!2993 Int)) )
))
(declare-datatypes ((ValueCell!2605 0))(
  ( (ValueCellFull!2605 (v!5013 V!7509)) (EmptyCell!2605) )
))
(declare-datatypes ((array!11037 0))(
  ( (array!11038 (arr!5238 (Array (_ BitVec 32) ValueCell!2605)) (size!5571 (_ BitVec 32))) )
))
(declare-datatypes ((array!11039 0))(
  ( (array!11040 (arr!5239 (Array (_ BitVec 32) (_ BitVec 64))) (size!5572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3110 0))(
  ( (LongMapFixedSize!3111 (defaultEntry!4214 Int) (mask!10052 (_ BitVec 32)) (extraKeys!3951 (_ BitVec 32)) (zeroValue!4055 V!7509) (minValue!4055 V!7509) (_size!1604 (_ BitVec 32)) (_keys!6268 array!11039) (_values!4197 array!11037) (_vacant!1604 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3110)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!244 (array!11039 array!11037 (_ BitVec 32) (_ BitVec 32) V!7509 V!7509 (_ BitVec 64) Int) Unit!6775)

(assert (=> b!224978 (= lt!113346 (lemmaInListMapThenSeekEntryOrOpenFindsIt!244 (_keys!6268 thiss!1504) (_values!4197 thiss!1504) (mask!10052 thiss!1504) (extraKeys!3951 thiss!1504) (zeroValue!4055 thiss!1504) (minValue!4055 thiss!1504) key!932 (defaultEntry!4214 thiss!1504)))))

(assert (=> b!224978 false))

(declare-fun b!224979 () Bool)

(declare-fun e!146043 () Bool)

(declare-fun tp_is_empty!5897 () Bool)

(assert (=> b!224979 (= e!146043 tp_is_empty!5897)))

(declare-fun b!224980 () Bool)

(declare-fun res!110715 () Bool)

(declare-fun e!146053 () Bool)

(assert (=> b!224980 (=> res!110715 e!146053)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11039 (_ BitVec 32)) Bool)

(assert (=> b!224980 (= res!110715 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6268 thiss!1504) (mask!10052 thiss!1504))))))

(declare-fun b!224981 () Bool)

(declare-fun e!146044 () Bool)

(declare-fun e!146052 () Bool)

(assert (=> b!224981 (= e!146044 e!146052)))

(declare-fun res!110707 () Bool)

(assert (=> b!224981 (=> (not res!110707) (not e!146052))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224981 (= res!110707 (inRange!0 index!297 (mask!10052 thiss!1504)))))

(declare-fun lt!113347 () Unit!6775)

(assert (=> b!224981 (= lt!113347 e!146045)))

(declare-fun c!37308 () Bool)

(declare-datatypes ((tuple2!4434 0))(
  ( (tuple2!4435 (_1!2228 (_ BitVec 64)) (_2!2228 V!7509)) )
))
(declare-datatypes ((List!3346 0))(
  ( (Nil!3343) (Cons!3342 (h!3990 tuple2!4434) (t!8305 List!3346)) )
))
(declare-datatypes ((ListLongMap!3347 0))(
  ( (ListLongMap!3348 (toList!1689 List!3346)) )
))
(declare-fun contains!1563 (ListLongMap!3347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1217 (array!11039 array!11037 (_ BitVec 32) (_ BitVec 32) V!7509 V!7509 (_ BitVec 32) Int) ListLongMap!3347)

(assert (=> b!224981 (= c!37308 (contains!1563 (getCurrentListMap!1217 (_keys!6268 thiss!1504) (_values!4197 thiss!1504) (mask!10052 thiss!1504) (extraKeys!3951 thiss!1504) (zeroValue!4055 thiss!1504) (minValue!4055 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4214 thiss!1504)) key!932))))

(declare-fun b!224982 () Bool)

(declare-fun res!110709 () Bool)

(declare-fun e!146042 () Bool)

(assert (=> b!224982 (=> (not res!110709) (not e!146042))))

(declare-fun call!20940 () Bool)

(assert (=> b!224982 (= res!110709 call!20940)))

(declare-fun e!146054 () Bool)

(assert (=> b!224982 (= e!146054 e!146042)))

(declare-fun b!224984 () Bool)

(declare-fun e!146049 () Bool)

(assert (=> b!224984 (= e!146049 e!146044)))

(declare-fun res!110714 () Bool)

(assert (=> b!224984 (=> (not res!110714) (not e!146044))))

(assert (=> b!224984 (= res!110714 (or (= lt!113341 (MissingZero!863 index!297)) (= lt!113341 (MissingVacant!863 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11039 (_ BitVec 32)) SeekEntryResult!863)

(assert (=> b!224984 (= lt!113341 (seekEntryOrOpen!0 key!932 (_keys!6268 thiss!1504) (mask!10052 thiss!1504)))))

(declare-fun b!224985 () Bool)

(declare-fun call!20939 () Bool)

(assert (=> b!224985 (= e!146042 (not call!20939))))

(declare-fun b!224986 () Bool)

(declare-fun res!110710 () Bool)

(assert (=> b!224986 (=> res!110710 e!146053)))

(declare-fun lt!113348 () Bool)

(assert (=> b!224986 (= res!110710 lt!113348)))

(declare-fun b!224987 () Bool)

(declare-fun res!110708 () Bool)

(assert (=> b!224987 (=> (not res!110708) (not e!146049))))

(assert (=> b!224987 (= res!110708 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224988 () Bool)

(declare-fun res!110717 () Bool)

(assert (=> b!224988 (=> res!110717 e!146053)))

(assert (=> b!224988 (= res!110717 (or (not (= (size!5572 (_keys!6268 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10052 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5572 (_keys!6268 thiss!1504)))))))

(declare-fun b!224989 () Bool)

(assert (=> b!224989 (= e!146053 true)))

(declare-fun lt!113342 () Bool)

(declare-datatypes ((List!3347 0))(
  ( (Nil!3344) (Cons!3343 (h!3991 (_ BitVec 64)) (t!8306 List!3347)) )
))
(declare-fun arrayNoDuplicates!0 (array!11039 (_ BitVec 32) List!3347) Bool)

(assert (=> b!224989 (= lt!113342 (arrayNoDuplicates!0 (_keys!6268 thiss!1504) #b00000000000000000000000000000000 Nil!3344))))

(declare-fun b!224990 () Bool)

(declare-fun c!37307 () Bool)

(assert (=> b!224990 (= c!37307 (is-MissingVacant!863 lt!113341))))

(assert (=> b!224990 (= e!146054 e!146040)))

(declare-fun c!37306 () Bool)

(declare-fun bm!20936 () Bool)

(assert (=> bm!20936 (= call!20940 (inRange!0 (ite c!37306 (index!5622 lt!113341) (index!5625 lt!113341)) (mask!10052 thiss!1504)))))

(declare-fun bm!20937 () Bool)

(declare-fun arrayContainsKey!0 (array!11039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20937 (= call!20939 (arrayContainsKey!0 (_keys!6268 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224991 () Bool)

(declare-fun e!146041 () Bool)

(assert (=> b!224991 (= e!146041 (not call!20939))))

(declare-fun mapIsEmpty!10015 () Bool)

(declare-fun mapRes!10015 () Bool)

(assert (=> mapIsEmpty!10015 mapRes!10015))

(declare-fun b!224992 () Bool)

(assert (=> b!224992 (= e!146052 (not e!146053))))

(declare-fun res!110711 () Bool)

(assert (=> b!224992 (=> res!110711 e!146053)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!224992 (= res!110711 (not (validMask!0 (mask!10052 thiss!1504))))))

(declare-fun lt!113345 () array!11039)

(declare-fun arrayCountValidKeys!0 (array!11039 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!224992 (= (arrayCountValidKeys!0 lt!113345 #b00000000000000000000000000000000 (size!5572 (_keys!6268 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6268 thiss!1504) #b00000000000000000000000000000000 (size!5572 (_keys!6268 thiss!1504)))))))

(declare-fun lt!113351 () Unit!6775)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11039 (_ BitVec 32) (_ BitVec 64)) Unit!6775)

(assert (=> b!224992 (= lt!113351 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6268 thiss!1504) index!297 key!932))))

(assert (=> b!224992 (arrayNoDuplicates!0 lt!113345 #b00000000000000000000000000000000 Nil!3344)))

(assert (=> b!224992 (= lt!113345 (array!11040 (store (arr!5239 (_keys!6268 thiss!1504)) index!297 key!932) (size!5572 (_keys!6268 thiss!1504))))))

(declare-fun lt!113349 () Unit!6775)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3347) Unit!6775)

(assert (=> b!224992 (= lt!113349 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6268 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3344))))

(declare-fun lt!113344 () Unit!6775)

(declare-fun e!146048 () Unit!6775)

(assert (=> b!224992 (= lt!113344 e!146048)))

(declare-fun c!37305 () Bool)

(assert (=> b!224992 (= c!37305 lt!113348)))

(assert (=> b!224992 (= lt!113348 (arrayContainsKey!0 (_keys!6268 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!146046 () Bool)

(declare-fun e!146047 () Bool)

(declare-fun array_inv!3467 (array!11039) Bool)

(declare-fun array_inv!3468 (array!11037) Bool)

(assert (=> b!224993 (= e!146047 (and tp!21247 tp_is_empty!5897 (array_inv!3467 (_keys!6268 thiss!1504)) (array_inv!3468 (_values!4197 thiss!1504)) e!146046))))

(declare-fun b!224994 () Bool)

(declare-fun lt!113343 () Unit!6775)

(assert (=> b!224994 (= e!146045 lt!113343)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!255 (array!11039 array!11037 (_ BitVec 32) (_ BitVec 32) V!7509 V!7509 (_ BitVec 64) Int) Unit!6775)

(assert (=> b!224994 (= lt!113343 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!255 (_keys!6268 thiss!1504) (_values!4197 thiss!1504) (mask!10052 thiss!1504) (extraKeys!3951 thiss!1504) (zeroValue!4055 thiss!1504) (minValue!4055 thiss!1504) key!932 (defaultEntry!4214 thiss!1504)))))

(assert (=> b!224994 (= c!37306 (is-MissingZero!863 lt!113341))))

(assert (=> b!224994 e!146054))

(declare-fun b!224995 () Bool)

(declare-fun e!146050 () Bool)

(assert (=> b!224995 (= e!146050 tp_is_empty!5897)))

(declare-fun b!224996 () Bool)

(declare-fun Unit!6778 () Unit!6775)

(assert (=> b!224996 (= e!146048 Unit!6778)))

(declare-fun lt!113350 () Unit!6775)

(declare-fun lemmaArrayContainsKeyThenInListMap!83 (array!11039 array!11037 (_ BitVec 32) (_ BitVec 32) V!7509 V!7509 (_ BitVec 64) (_ BitVec 32) Int) Unit!6775)

(assert (=> b!224996 (= lt!113350 (lemmaArrayContainsKeyThenInListMap!83 (_keys!6268 thiss!1504) (_values!4197 thiss!1504) (mask!10052 thiss!1504) (extraKeys!3951 thiss!1504) (zeroValue!4055 thiss!1504) (minValue!4055 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4214 thiss!1504)))))

(assert (=> b!224996 false))

(declare-fun b!224997 () Bool)

(declare-fun res!110713 () Bool)

(assert (=> b!224997 (= res!110713 (= (select (arr!5239 (_keys!6268 thiss!1504)) (index!5625 lt!113341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224997 (=> (not res!110713) (not e!146041))))

(declare-fun b!224998 () Bool)

(declare-fun Unit!6779 () Unit!6775)

(assert (=> b!224998 (= e!146048 Unit!6779)))

(declare-fun res!110712 () Bool)

(assert (=> start!21968 (=> (not res!110712) (not e!146049))))

(declare-fun valid!1254 (LongMapFixedSize!3110) Bool)

(assert (=> start!21968 (= res!110712 (valid!1254 thiss!1504))))

(assert (=> start!21968 e!146049))

(assert (=> start!21968 e!146047))

(assert (=> start!21968 true))

(declare-fun b!224983 () Bool)

(assert (=> b!224983 (= e!146040 e!146041)))

(declare-fun res!110718 () Bool)

(assert (=> b!224983 (= res!110718 call!20940)))

(assert (=> b!224983 (=> (not res!110718) (not e!146041))))

(declare-fun b!224999 () Bool)

(declare-fun res!110719 () Bool)

(assert (=> b!224999 (=> res!110719 e!146053)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224999 (= res!110719 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225000 () Bool)

(assert (=> b!225000 (= e!146046 (and e!146050 mapRes!10015))))

(declare-fun condMapEmpty!10015 () Bool)

(declare-fun mapDefault!10015 () ValueCell!2605)

