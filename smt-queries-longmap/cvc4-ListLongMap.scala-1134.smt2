; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23332 () Bool)

(assert start!23332)

(declare-fun b!245416 () Bool)

(declare-fun b_free!6557 () Bool)

(declare-fun b_next!6557 () Bool)

(assert (=> b!245416 (= b_free!6557 (not b_next!6557))))

(declare-fun tp!22902 () Bool)

(declare-fun b_and!13545 () Bool)

(assert (=> b!245416 (= tp!22902 b_and!13545)))

(declare-fun b!245399 () Bool)

(declare-fun e!159221 () Bool)

(declare-datatypes ((V!8205 0))(
  ( (V!8206 (val!3254 Int)) )
))
(declare-datatypes ((ValueCell!2866 0))(
  ( (ValueCellFull!2866 (v!5306 V!8205)) (EmptyCell!2866) )
))
(declare-datatypes ((array!12135 0))(
  ( (array!12136 (arr!5760 (Array (_ BitVec 32) ValueCell!2866)) (size!6102 (_ BitVec 32))) )
))
(declare-datatypes ((array!12137 0))(
  ( (array!12138 (arr!5761 (Array (_ BitVec 32) (_ BitVec 64))) (size!6103 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3632 0))(
  ( (LongMapFixedSize!3633 (defaultEntry!4541 Int) (mask!10650 (_ BitVec 32)) (extraKeys!4278 (_ BitVec 32)) (zeroValue!4382 V!8205) (minValue!4382 V!8205) (_size!1865 (_ BitVec 32)) (_keys!6655 array!12137) (_values!4524 array!12135) (_vacant!1865 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3632)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245399 (= e!159221 (not (validMask!0 (mask!10650 thiss!1504))))))

(declare-fun lt!122896 () array!12137)

(declare-fun arrayCountValidKeys!0 (array!12137 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245399 (= (arrayCountValidKeys!0 lt!122896 #b00000000000000000000000000000000 (size!6103 (_keys!6655 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6655 thiss!1504) #b00000000000000000000000000000000 (size!6103 (_keys!6655 thiss!1504)))))))

(declare-datatypes ((Unit!7580 0))(
  ( (Unit!7581) )
))
(declare-fun lt!122892 () Unit!7580)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12137 (_ BitVec 32) (_ BitVec 64)) Unit!7580)

(assert (=> b!245399 (= lt!122892 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6655 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3670 0))(
  ( (Nil!3667) (Cons!3666 (h!4323 (_ BitVec 64)) (t!8683 List!3670)) )
))
(declare-fun arrayNoDuplicates!0 (array!12137 (_ BitVec 32) List!3670) Bool)

(assert (=> b!245399 (arrayNoDuplicates!0 lt!122896 #b00000000000000000000000000000000 Nil!3667)))

(assert (=> b!245399 (= lt!122896 (array!12138 (store (arr!5761 (_keys!6655 thiss!1504)) index!297 key!932) (size!6103 (_keys!6655 thiss!1504))))))

(declare-fun lt!122890 () Unit!7580)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3670) Unit!7580)

(assert (=> b!245399 (= lt!122890 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6655 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3667))))

(declare-fun lt!122897 () Unit!7580)

(declare-fun e!159212 () Unit!7580)

(assert (=> b!245399 (= lt!122897 e!159212)))

(declare-fun c!40972 () Bool)

(declare-fun arrayContainsKey!0 (array!12137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!245399 (= c!40972 (arrayContainsKey!0 (_keys!6655 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245400 () Bool)

(declare-fun res!120375 () Bool)

(declare-fun e!159214 () Bool)

(assert (=> b!245400 (=> (not res!120375) (not e!159214))))

(assert (=> b!245400 (= res!120375 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!245401 () Bool)

(declare-fun e!159211 () Bool)

(declare-fun e!159215 () Bool)

(assert (=> b!245401 (= e!159211 e!159215)))

(declare-fun res!120370 () Bool)

(declare-fun call!22904 () Bool)

(assert (=> b!245401 (= res!120370 call!22904)))

(assert (=> b!245401 (=> (not res!120370) (not e!159215))))

(declare-fun b!245402 () Bool)

(declare-fun e!159213 () Bool)

(declare-fun call!22905 () Bool)

(assert (=> b!245402 (= e!159213 (not call!22905))))

(declare-fun bm!22901 () Bool)

(declare-datatypes ((SeekEntryResult!1089 0))(
  ( (MissingZero!1089 (index!6526 (_ BitVec 32))) (Found!1089 (index!6527 (_ BitVec 32))) (Intermediate!1089 (undefined!1901 Bool) (index!6528 (_ BitVec 32)) (x!24419 (_ BitVec 32))) (Undefined!1089) (MissingVacant!1089 (index!6529 (_ BitVec 32))) )
))
(declare-fun lt!122895 () SeekEntryResult!1089)

(declare-fun c!40973 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22901 (= call!22904 (inRange!0 (ite c!40973 (index!6526 lt!122895) (index!6529 lt!122895)) (mask!10650 thiss!1504)))))

(declare-fun b!245404 () Bool)

(declare-fun res!120374 () Bool)

(assert (=> b!245404 (=> (not res!120374) (not e!159213))))

(assert (=> b!245404 (= res!120374 call!22904)))

(declare-fun e!159220 () Bool)

(assert (=> b!245404 (= e!159220 e!159213)))

(declare-fun mapNonEmpty!10888 () Bool)

(declare-fun mapRes!10888 () Bool)

(declare-fun tp!22903 () Bool)

(declare-fun e!159210 () Bool)

(assert (=> mapNonEmpty!10888 (= mapRes!10888 (and tp!22903 e!159210))))

(declare-fun mapRest!10888 () (Array (_ BitVec 32) ValueCell!2866))

(declare-fun mapValue!10888 () ValueCell!2866)

(declare-fun mapKey!10888 () (_ BitVec 32))

(assert (=> mapNonEmpty!10888 (= (arr!5760 (_values!4524 thiss!1504)) (store mapRest!10888 mapKey!10888 mapValue!10888))))

(declare-fun b!245405 () Bool)

(declare-fun e!159216 () Bool)

(assert (=> b!245405 (= e!159214 e!159216)))

(declare-fun res!120368 () Bool)

(assert (=> b!245405 (=> (not res!120368) (not e!159216))))

(assert (=> b!245405 (= res!120368 (or (= lt!122895 (MissingZero!1089 index!297)) (= lt!122895 (MissingVacant!1089 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12137 (_ BitVec 32)) SeekEntryResult!1089)

(assert (=> b!245405 (= lt!122895 (seekEntryOrOpen!0 key!932 (_keys!6655 thiss!1504) (mask!10650 thiss!1504)))))

(declare-fun mapIsEmpty!10888 () Bool)

(assert (=> mapIsEmpty!10888 mapRes!10888))

(declare-fun b!245406 () Bool)

(declare-fun tp_is_empty!6419 () Bool)

(assert (=> b!245406 (= e!159210 tp_is_empty!6419)))

(declare-fun b!245407 () Bool)

(declare-fun e!159217 () Bool)

(assert (=> b!245407 (= e!159217 tp_is_empty!6419)))

(declare-fun b!245408 () Bool)

(assert (=> b!245408 (= e!159211 (is-Undefined!1089 lt!122895))))

(declare-fun b!245409 () Bool)

(declare-fun res!120372 () Bool)

(assert (=> b!245409 (=> (not res!120372) (not e!159213))))

(assert (=> b!245409 (= res!120372 (= (select (arr!5761 (_keys!6655 thiss!1504)) (index!6526 lt!122895)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245410 () Bool)

(declare-fun e!159223 () Unit!7580)

(declare-fun Unit!7582 () Unit!7580)

(assert (=> b!245410 (= e!159223 Unit!7582)))

(declare-fun lt!122891 () Unit!7580)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!372 (array!12137 array!12135 (_ BitVec 32) (_ BitVec 32) V!8205 V!8205 (_ BitVec 64) Int) Unit!7580)

(assert (=> b!245410 (= lt!122891 (lemmaInListMapThenSeekEntryOrOpenFindsIt!372 (_keys!6655 thiss!1504) (_values!4524 thiss!1504) (mask!10650 thiss!1504) (extraKeys!4278 thiss!1504) (zeroValue!4382 thiss!1504) (minValue!4382 thiss!1504) key!932 (defaultEntry!4541 thiss!1504)))))

(assert (=> b!245410 false))

(declare-fun b!245411 () Bool)

(assert (=> b!245411 (= e!159215 (not call!22905))))

(declare-fun res!120371 () Bool)

(assert (=> start!23332 (=> (not res!120371) (not e!159214))))

(declare-fun valid!1421 (LongMapFixedSize!3632) Bool)

(assert (=> start!23332 (= res!120371 (valid!1421 thiss!1504))))

(assert (=> start!23332 e!159214))

(declare-fun e!159218 () Bool)

(assert (=> start!23332 e!159218))

(assert (=> start!23332 true))

(declare-fun b!245403 () Bool)

(assert (=> b!245403 (= e!159216 e!159221)))

(declare-fun res!120369 () Bool)

(assert (=> b!245403 (=> (not res!120369) (not e!159221))))

(assert (=> b!245403 (= res!120369 (inRange!0 index!297 (mask!10650 thiss!1504)))))

(declare-fun lt!122893 () Unit!7580)

(assert (=> b!245403 (= lt!122893 e!159223)))

(declare-fun c!40974 () Bool)

(declare-datatypes ((tuple2!4788 0))(
  ( (tuple2!4789 (_1!2405 (_ BitVec 64)) (_2!2405 V!8205)) )
))
(declare-datatypes ((List!3671 0))(
  ( (Nil!3668) (Cons!3667 (h!4324 tuple2!4788) (t!8684 List!3671)) )
))
(declare-datatypes ((ListLongMap!3701 0))(
  ( (ListLongMap!3702 (toList!1866 List!3671)) )
))
(declare-fun contains!1774 (ListLongMap!3701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1394 (array!12137 array!12135 (_ BitVec 32) (_ BitVec 32) V!8205 V!8205 (_ BitVec 32) Int) ListLongMap!3701)

(assert (=> b!245403 (= c!40974 (contains!1774 (getCurrentListMap!1394 (_keys!6655 thiss!1504) (_values!4524 thiss!1504) (mask!10650 thiss!1504) (extraKeys!4278 thiss!1504) (zeroValue!4382 thiss!1504) (minValue!4382 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4541 thiss!1504)) key!932))))

(declare-fun b!245412 () Bool)

(declare-fun e!159219 () Bool)

(assert (=> b!245412 (= e!159219 (and e!159217 mapRes!10888))))

(declare-fun condMapEmpty!10888 () Bool)

(declare-fun mapDefault!10888 () ValueCell!2866)

