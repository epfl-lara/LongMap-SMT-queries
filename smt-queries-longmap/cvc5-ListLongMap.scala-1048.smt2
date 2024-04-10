; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21970 () Bool)

(assert start!21970)

(declare-fun b!225067 () Bool)

(declare-fun b_free!6037 () Bool)

(declare-fun b_next!6037 () Bool)

(assert (=> b!225067 (= b_free!6037 (not b_next!6037))))

(declare-fun tp!21252 () Bool)

(declare-fun b_and!12935 () Bool)

(assert (=> b!225067 (= tp!21252 b_and!12935)))

(declare-fun b!225052 () Bool)

(declare-datatypes ((Unit!6780 0))(
  ( (Unit!6781) )
))
(declare-fun e!146097 () Unit!6780)

(declare-fun Unit!6782 () Unit!6780)

(assert (=> b!225052 (= e!146097 Unit!6782)))

(declare-fun lt!113380 () Unit!6780)

(declare-datatypes ((V!7513 0))(
  ( (V!7514 (val!2994 Int)) )
))
(declare-datatypes ((ValueCell!2606 0))(
  ( (ValueCellFull!2606 (v!5014 V!7513)) (EmptyCell!2606) )
))
(declare-datatypes ((array!11041 0))(
  ( (array!11042 (arr!5240 (Array (_ BitVec 32) ValueCell!2606)) (size!5573 (_ BitVec 32))) )
))
(declare-datatypes ((array!11043 0))(
  ( (array!11044 (arr!5241 (Array (_ BitVec 32) (_ BitVec 64))) (size!5574 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3112 0))(
  ( (LongMapFixedSize!3113 (defaultEntry!4215 Int) (mask!10055 (_ BitVec 32)) (extraKeys!3952 (_ BitVec 32)) (zeroValue!4056 V!7513) (minValue!4056 V!7513) (_size!1605 (_ BitVec 32)) (_keys!6269 array!11043) (_values!4198 array!11041) (_vacant!1605 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3112)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!84 (array!11043 array!11041 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) (_ BitVec 32) Int) Unit!6780)

(assert (=> b!225052 (= lt!113380 (lemmaArrayContainsKeyThenInListMap!84 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!225052 false))

(declare-fun b!225053 () Bool)

(declare-fun res!110750 () Bool)

(declare-fun e!146093 () Bool)

(assert (=> b!225053 (=> res!110750 e!146093)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225053 (= res!110750 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225054 () Bool)

(declare-fun e!146094 () Bool)

(declare-fun call!20946 () Bool)

(assert (=> b!225054 (= e!146094 (not call!20946))))

(declare-fun b!225055 () Bool)

(declare-fun res!110752 () Bool)

(assert (=> b!225055 (=> (not res!110752) (not e!146094))))

(declare-fun call!20945 () Bool)

(assert (=> b!225055 (= res!110752 call!20945)))

(declare-fun e!146090 () Bool)

(assert (=> b!225055 (= e!146090 e!146094)))

(declare-fun b!225056 () Bool)

(declare-fun e!146096 () Bool)

(assert (=> b!225056 (= e!146096 (not e!146093))))

(declare-fun res!110747 () Bool)

(assert (=> b!225056 (=> res!110747 e!146093)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225056 (= res!110747 (not (validMask!0 (mask!10055 thiss!1504))))))

(declare-fun lt!113376 () array!11043)

(declare-fun arrayCountValidKeys!0 (array!11043 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225056 (= (arrayCountValidKeys!0 lt!113376 #b00000000000000000000000000000000 (size!5574 (_keys!6269 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6269 thiss!1504) #b00000000000000000000000000000000 (size!5574 (_keys!6269 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!113384 () Unit!6780)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11043 (_ BitVec 32) (_ BitVec 64)) Unit!6780)

(assert (=> b!225056 (= lt!113384 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6269 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3348 0))(
  ( (Nil!3345) (Cons!3344 (h!3992 (_ BitVec 64)) (t!8307 List!3348)) )
))
(declare-fun arrayNoDuplicates!0 (array!11043 (_ BitVec 32) List!3348) Bool)

(assert (=> b!225056 (arrayNoDuplicates!0 lt!113376 #b00000000000000000000000000000000 Nil!3345)))

(assert (=> b!225056 (= lt!113376 (array!11044 (store (arr!5241 (_keys!6269 thiss!1504)) index!297 key!932) (size!5574 (_keys!6269 thiss!1504))))))

(declare-fun lt!113374 () Unit!6780)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11043 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3348) Unit!6780)

(assert (=> b!225056 (= lt!113374 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6269 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3345))))

(declare-fun lt!113378 () Unit!6780)

(assert (=> b!225056 (= lt!113378 e!146097)))

(declare-fun c!37319 () Bool)

(declare-fun lt!113383 () Bool)

(assert (=> b!225056 (= c!37319 lt!113383)))

(declare-fun arrayContainsKey!0 (array!11043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225056 (= lt!113383 (arrayContainsKey!0 (_keys!6269 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225058 () Bool)

(declare-fun e!146092 () Bool)

(declare-datatypes ((SeekEntryResult!864 0))(
  ( (MissingZero!864 (index!5626 (_ BitVec 32))) (Found!864 (index!5627 (_ BitVec 32))) (Intermediate!864 (undefined!1676 Bool) (index!5628 (_ BitVec 32)) (x!23164 (_ BitVec 32))) (Undefined!864) (MissingVacant!864 (index!5629 (_ BitVec 32))) )
))
(declare-fun lt!113379 () SeekEntryResult!864)

(assert (=> b!225058 (= e!146092 (is-Undefined!864 lt!113379))))

(declare-fun b!225059 () Bool)

(declare-fun e!146099 () Bool)

(declare-fun tp_is_empty!5899 () Bool)

(assert (=> b!225059 (= e!146099 tp_is_empty!5899)))

(declare-fun b!225060 () Bool)

(declare-fun res!110746 () Bool)

(declare-fun e!146089 () Bool)

(assert (=> b!225060 (=> (not res!110746) (not e!146089))))

(assert (=> b!225060 (= res!110746 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225061 () Bool)

(declare-fun res!110754 () Bool)

(assert (=> b!225061 (=> res!110754 e!146093)))

(assert (=> b!225061 (= res!110754 lt!113383)))

(declare-fun b!225062 () Bool)

(declare-fun e!146098 () Bool)

(assert (=> b!225062 (= e!146098 (not call!20946))))

(declare-fun b!225063 () Bool)

(declare-fun e!146095 () Bool)

(assert (=> b!225063 (= e!146095 e!146096)))

(declare-fun res!110756 () Bool)

(assert (=> b!225063 (=> (not res!110756) (not e!146096))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225063 (= res!110756 (inRange!0 index!297 (mask!10055 thiss!1504)))))

(declare-fun lt!113375 () Unit!6780)

(declare-fun e!146087 () Unit!6780)

(assert (=> b!225063 (= lt!113375 e!146087)))

(declare-fun c!37317 () Bool)

(declare-datatypes ((tuple2!4436 0))(
  ( (tuple2!4437 (_1!2229 (_ BitVec 64)) (_2!2229 V!7513)) )
))
(declare-datatypes ((List!3349 0))(
  ( (Nil!3346) (Cons!3345 (h!3993 tuple2!4436) (t!8308 List!3349)) )
))
(declare-datatypes ((ListLongMap!3349 0))(
  ( (ListLongMap!3350 (toList!1690 List!3349)) )
))
(declare-fun contains!1564 (ListLongMap!3349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1218 (array!11043 array!11041 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 32) Int) ListLongMap!3349)

(assert (=> b!225063 (= c!37317 (contains!1564 (getCurrentListMap!1218 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4215 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10018 () Bool)

(declare-fun mapRes!10018 () Bool)

(assert (=> mapIsEmpty!10018 mapRes!10018))

(declare-fun b!225064 () Bool)

(declare-fun c!37320 () Bool)

(assert (=> b!225064 (= c!37320 (is-MissingVacant!864 lt!113379))))

(assert (=> b!225064 (= e!146090 e!146092)))

(declare-fun b!225065 () Bool)

(declare-fun res!110751 () Bool)

(assert (=> b!225065 (=> (not res!110751) (not e!146094))))

(assert (=> b!225065 (= res!110751 (= (select (arr!5241 (_keys!6269 thiss!1504)) (index!5626 lt!113379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!110748 () Bool)

(assert (=> start!21970 (=> (not res!110748) (not e!146089))))

(declare-fun valid!1255 (LongMapFixedSize!3112) Bool)

(assert (=> start!21970 (= res!110748 (valid!1255 thiss!1504))))

(assert (=> start!21970 e!146089))

(declare-fun e!146091 () Bool)

(assert (=> start!21970 e!146091))

(assert (=> start!21970 true))

(declare-fun b!225057 () Bool)

(declare-fun e!146086 () Bool)

(assert (=> b!225057 (= e!146086 tp_is_empty!5899)))

(declare-fun mapNonEmpty!10018 () Bool)

(declare-fun tp!21253 () Bool)

(assert (=> mapNonEmpty!10018 (= mapRes!10018 (and tp!21253 e!146086))))

(declare-fun mapKey!10018 () (_ BitVec 32))

(declare-fun mapValue!10018 () ValueCell!2606)

(declare-fun mapRest!10018 () (Array (_ BitVec 32) ValueCell!2606))

(assert (=> mapNonEmpty!10018 (= (arr!5240 (_values!4198 thiss!1504)) (store mapRest!10018 mapKey!10018 mapValue!10018))))

(declare-fun b!225066 () Bool)

(assert (=> b!225066 (= e!146093 true)))

(declare-fun lt!113377 () Bool)

(assert (=> b!225066 (= lt!113377 (arrayNoDuplicates!0 (_keys!6269 thiss!1504) #b00000000000000000000000000000000 Nil!3345))))

(declare-fun e!146088 () Bool)

(declare-fun array_inv!3469 (array!11043) Bool)

(declare-fun array_inv!3470 (array!11041) Bool)

(assert (=> b!225067 (= e!146091 (and tp!21252 tp_is_empty!5899 (array_inv!3469 (_keys!6269 thiss!1504)) (array_inv!3470 (_values!4198 thiss!1504)) e!146088))))

(declare-fun b!225068 () Bool)

(declare-fun lt!113381 () Unit!6780)

(assert (=> b!225068 (= e!146087 lt!113381)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!256 (array!11043 array!11041 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) Int) Unit!6780)

(assert (=> b!225068 (= lt!113381 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!256 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 (defaultEntry!4215 thiss!1504)))))

(declare-fun c!37318 () Bool)

(assert (=> b!225068 (= c!37318 (is-MissingZero!864 lt!113379))))

(assert (=> b!225068 e!146090))

(declare-fun b!225069 () Bool)

(declare-fun res!110749 () Bool)

(assert (=> b!225069 (= res!110749 (= (select (arr!5241 (_keys!6269 thiss!1504)) (index!5629 lt!113379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225069 (=> (not res!110749) (not e!146098))))

(declare-fun bm!20942 () Bool)

(assert (=> bm!20942 (= call!20945 (inRange!0 (ite c!37318 (index!5626 lt!113379) (index!5629 lt!113379)) (mask!10055 thiss!1504)))))

(declare-fun b!225070 () Bool)

(declare-fun Unit!6783 () Unit!6780)

(assert (=> b!225070 (= e!146087 Unit!6783)))

(declare-fun lt!113382 () Unit!6780)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!245 (array!11043 array!11041 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) Int) Unit!6780)

(assert (=> b!225070 (= lt!113382 (lemmaInListMapThenSeekEntryOrOpenFindsIt!245 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!225070 false))

(declare-fun b!225071 () Bool)

(assert (=> b!225071 (= e!146089 e!146095)))

(declare-fun res!110757 () Bool)

(assert (=> b!225071 (=> (not res!110757) (not e!146095))))

(assert (=> b!225071 (= res!110757 (or (= lt!113379 (MissingZero!864 index!297)) (= lt!113379 (MissingVacant!864 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11043 (_ BitVec 32)) SeekEntryResult!864)

(assert (=> b!225071 (= lt!113379 (seekEntryOrOpen!0 key!932 (_keys!6269 thiss!1504) (mask!10055 thiss!1504)))))

(declare-fun b!225072 () Bool)

(declare-fun res!110753 () Bool)

(assert (=> b!225072 (=> res!110753 e!146093)))

(assert (=> b!225072 (= res!110753 (or (not (= (size!5574 (_keys!6269 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10055 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5574 (_keys!6269 thiss!1504)))))))

(declare-fun b!225073 () Bool)

(assert (=> b!225073 (= e!146092 e!146098)))

(declare-fun res!110755 () Bool)

(assert (=> b!225073 (= res!110755 call!20945)))

(assert (=> b!225073 (=> (not res!110755) (not e!146098))))

(declare-fun b!225074 () Bool)

(declare-fun Unit!6784 () Unit!6780)

(assert (=> b!225074 (= e!146097 Unit!6784)))

(declare-fun b!225075 () Bool)

(declare-fun res!110758 () Bool)

(assert (=> b!225075 (=> res!110758 e!146093)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11043 (_ BitVec 32)) Bool)

(assert (=> b!225075 (= res!110758 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6269 thiss!1504) (mask!10055 thiss!1504))))))

(declare-fun bm!20943 () Bool)

(assert (=> bm!20943 (= call!20946 (arrayContainsKey!0 (_keys!6269 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225076 () Bool)

(assert (=> b!225076 (= e!146088 (and e!146099 mapRes!10018))))

(declare-fun condMapEmpty!10018 () Bool)

(declare-fun mapDefault!10018 () ValueCell!2606)

