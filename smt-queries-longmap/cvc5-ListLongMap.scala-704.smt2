; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16728 () Bool)

(assert start!16728)

(declare-fun b!167965 () Bool)

(declare-fun b_free!4033 () Bool)

(declare-fun b_next!4033 () Bool)

(assert (=> b!167965 (= b_free!4033 (not b_next!4033))))

(declare-fun tp!14700 () Bool)

(declare-fun b_and!10447 () Bool)

(assert (=> b!167965 (= tp!14700 b_and!10447)))

(declare-fun b!167955 () Bool)

(declare-fun e!110367 () Bool)

(declare-fun e!110368 () Bool)

(assert (=> b!167955 (= e!110367 e!110368)))

(declare-fun res!79918 () Bool)

(assert (=> b!167955 (=> (not res!79918) (not e!110368))))

(declare-datatypes ((SeekEntryResult!490 0))(
  ( (MissingZero!490 (index!4128 (_ BitVec 32))) (Found!490 (index!4129 (_ BitVec 32))) (Intermediate!490 (undefined!1302 Bool) (index!4130 (_ BitVec 32)) (x!18574 (_ BitVec 32))) (Undefined!490) (MissingVacant!490 (index!4131 (_ BitVec 32))) )
))
(declare-fun lt!83966 () SeekEntryResult!490)

(assert (=> b!167955 (= res!79918 (and (not (is-Undefined!490 lt!83966)) (not (is-MissingVacant!490 lt!83966)) (not (is-MissingZero!490 lt!83966)) (is-Found!490 lt!83966)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4761 0))(
  ( (V!4762 (val!1962 Int)) )
))
(declare-datatypes ((ValueCell!1574 0))(
  ( (ValueCellFull!1574 (v!3827 V!4761)) (EmptyCell!1574) )
))
(declare-datatypes ((array!6767 0))(
  ( (array!6768 (arr!3219 (Array (_ BitVec 32) (_ BitVec 64))) (size!3507 (_ BitVec 32))) )
))
(declare-datatypes ((array!6769 0))(
  ( (array!6770 (arr!3220 (Array (_ BitVec 32) ValueCell!1574)) (size!3508 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2056 0))(
  ( (LongMapFixedSize!2057 (defaultEntry!3470 Int) (mask!8227 (_ BitVec 32)) (extraKeys!3211 (_ BitVec 32)) (zeroValue!3313 V!4761) (minValue!3313 V!4761) (_size!1077 (_ BitVec 32)) (_keys!5295 array!6767) (_values!3453 array!6769) (_vacant!1077 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2056)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6767 (_ BitVec 32)) SeekEntryResult!490)

(assert (=> b!167955 (= lt!83966 (seekEntryOrOpen!0 key!828 (_keys!5295 thiss!1248) (mask!8227 thiss!1248)))))

(declare-fun b!167956 () Bool)

(declare-fun e!110366 () Bool)

(declare-fun tp_is_empty!3835 () Bool)

(assert (=> b!167956 (= e!110366 tp_is_empty!3835)))

(declare-fun b!167957 () Bool)

(declare-datatypes ((Unit!5154 0))(
  ( (Unit!5155) )
))
(declare-fun e!110364 () Unit!5154)

(declare-fun Unit!5156 () Unit!5154)

(assert (=> b!167957 (= e!110364 Unit!5156)))

(declare-fun lt!83965 () Unit!5154)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!115 (array!6767 array!6769 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 64) Int) Unit!5154)

(assert (=> b!167957 (= lt!83965 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!115 (_keys!5295 thiss!1248) (_values!3453 thiss!1248) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) key!828 (defaultEntry!3470 thiss!1248)))))

(assert (=> b!167957 false))

(declare-fun mapIsEmpty!6471 () Bool)

(declare-fun mapRes!6471 () Bool)

(assert (=> mapIsEmpty!6471 mapRes!6471))

(declare-fun b!167959 () Bool)

(declare-fun e!110365 () Bool)

(assert (=> b!167959 (= e!110365 (= (select (arr!3219 (_keys!5295 thiss!1248)) (index!4129 lt!83966)) key!828))))

(declare-fun b!167960 () Bool)

(declare-fun lt!83971 () Unit!5154)

(assert (=> b!167960 (= e!110364 lt!83971)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!114 (array!6767 array!6769 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 64) Int) Unit!5154)

(assert (=> b!167960 (= lt!83971 (lemmaInListMapThenSeekEntryOrOpenFindsIt!114 (_keys!5295 thiss!1248) (_values!3453 thiss!1248) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) key!828 (defaultEntry!3470 thiss!1248)))))

(declare-fun res!79921 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167960 (= res!79921 (inRange!0 (index!4129 lt!83966) (mask!8227 thiss!1248)))))

(assert (=> b!167960 (=> (not res!79921) (not e!110365))))

(assert (=> b!167960 e!110365))

(declare-fun b!167961 () Bool)

(declare-fun e!110361 () Bool)

(assert (=> b!167961 (= e!110361 true)))

(declare-fun lt!83970 () Bool)

(declare-datatypes ((List!2144 0))(
  ( (Nil!2141) (Cons!2140 (h!2757 (_ BitVec 64)) (t!6946 List!2144)) )
))
(declare-fun arrayNoDuplicates!0 (array!6767 (_ BitVec 32) List!2144) Bool)

(assert (=> b!167961 (= lt!83970 (arrayNoDuplicates!0 (_keys!5295 thiss!1248) #b00000000000000000000000000000000 Nil!2141))))

(declare-fun b!167962 () Bool)

(declare-fun res!79922 () Bool)

(assert (=> b!167962 (=> (not res!79922) (not e!110367))))

(assert (=> b!167962 (= res!79922 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6471 () Bool)

(declare-fun tp!14699 () Bool)

(assert (=> mapNonEmpty!6471 (= mapRes!6471 (and tp!14699 e!110366))))

(declare-fun mapRest!6471 () (Array (_ BitVec 32) ValueCell!1574))

(declare-fun mapValue!6471 () ValueCell!1574)

(declare-fun mapKey!6471 () (_ BitVec 32))

(assert (=> mapNonEmpty!6471 (= (arr!3220 (_values!3453 thiss!1248)) (store mapRest!6471 mapKey!6471 mapValue!6471))))

(declare-fun b!167963 () Bool)

(declare-fun res!79917 () Bool)

(assert (=> b!167963 (=> res!79917 e!110361)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6767 (_ BitVec 32)) Bool)

(assert (=> b!167963 (= res!79917 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5295 thiss!1248) (mask!8227 thiss!1248))))))

(declare-fun b!167964 () Bool)

(declare-fun e!110363 () Bool)

(declare-fun e!110369 () Bool)

(assert (=> b!167964 (= e!110363 (and e!110369 mapRes!6471))))

(declare-fun condMapEmpty!6471 () Bool)

(declare-fun mapDefault!6471 () ValueCell!1574)

