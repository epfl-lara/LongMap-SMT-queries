; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16644 () Bool)

(assert start!16644)

(declare-fun b!166326 () Bool)

(declare-fun b_free!3949 () Bool)

(declare-fun b_next!3949 () Bool)

(assert (=> b!166326 (= b_free!3949 (not b_next!3949))))

(declare-fun tp!14447 () Bool)

(declare-fun b_and!10363 () Bool)

(assert (=> b!166326 (= tp!14447 b_and!10363)))

(declare-fun b!166317 () Bool)

(declare-fun res!79041 () Bool)

(declare-fun e!109104 () Bool)

(assert (=> b!166317 (=> (not res!79041) (not e!109104))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166317 (= res!79041 (not (= key!828 (bvneg key!828))))))

(declare-fun res!79037 () Bool)

(assert (=> start!16644 (=> (not res!79037) (not e!109104))))

(declare-datatypes ((V!4649 0))(
  ( (V!4650 (val!1920 Int)) )
))
(declare-datatypes ((ValueCell!1532 0))(
  ( (ValueCellFull!1532 (v!3785 V!4649)) (EmptyCell!1532) )
))
(declare-datatypes ((array!6599 0))(
  ( (array!6600 (arr!3135 (Array (_ BitVec 32) (_ BitVec 64))) (size!3423 (_ BitVec 32))) )
))
(declare-datatypes ((array!6601 0))(
  ( (array!6602 (arr!3136 (Array (_ BitVec 32) ValueCell!1532)) (size!3424 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1972 0))(
  ( (LongMapFixedSize!1973 (defaultEntry!3428 Int) (mask!8157 (_ BitVec 32)) (extraKeys!3169 (_ BitVec 32)) (zeroValue!3271 V!4649) (minValue!3271 V!4649) (_size!1035 (_ BitVec 32)) (_keys!5253 array!6599) (_values!3411 array!6601) (_vacant!1035 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1972)

(declare-fun valid!866 (LongMapFixedSize!1972) Bool)

(assert (=> start!16644 (= res!79037 (valid!866 thiss!1248))))

(assert (=> start!16644 e!109104))

(declare-fun e!109102 () Bool)

(assert (=> start!16644 e!109102))

(assert (=> start!16644 true))

(declare-fun b!166318 () Bool)

(declare-fun res!79036 () Bool)

(declare-fun e!109103 () Bool)

(assert (=> b!166318 (=> (not res!79036) (not e!109103))))

(assert (=> b!166318 (= res!79036 (and (= (size!3424 (_values!3411 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8157 thiss!1248))) (= (size!3423 (_keys!5253 thiss!1248)) (size!3424 (_values!3411 thiss!1248))) (bvsge (mask!8157 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3169 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3169 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166319 () Bool)

(declare-datatypes ((Unit!5055 0))(
  ( (Unit!5056) )
))
(declare-fun e!109107 () Unit!5055)

(declare-fun lt!83263 () Unit!5055)

(assert (=> b!166319 (= e!109107 lt!83263)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!85 (array!6599 array!6601 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 64) Int) Unit!5055)

(assert (=> b!166319 (= lt!83263 (lemmaInListMapThenSeekEntryOrOpenFindsIt!85 (_keys!5253 thiss!1248) (_values!3411 thiss!1248) (mask!8157 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) key!828 (defaultEntry!3428 thiss!1248)))))

(declare-fun res!79040 () Bool)

(declare-datatypes ((SeekEntryResult!453 0))(
  ( (MissingZero!453 (index!3980 (_ BitVec 32))) (Found!453 (index!3981 (_ BitVec 32))) (Intermediate!453 (undefined!1265 Bool) (index!3982 (_ BitVec 32)) (x!18425 (_ BitVec 32))) (Undefined!453) (MissingVacant!453 (index!3983 (_ BitVec 32))) )
))
(declare-fun lt!83261 () SeekEntryResult!453)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166319 (= res!79040 (inRange!0 (index!3981 lt!83261) (mask!8157 thiss!1248)))))

(declare-fun e!109100 () Bool)

(assert (=> b!166319 (=> (not res!79040) (not e!109100))))

(assert (=> b!166319 e!109100))

(declare-fun b!166320 () Bool)

(declare-fun e!109105 () Bool)

(declare-fun tp_is_empty!3751 () Bool)

(assert (=> b!166320 (= e!109105 tp_is_empty!3751)))

(declare-fun b!166321 () Bool)

(declare-fun e!109108 () Bool)

(assert (=> b!166321 (= e!109108 e!109103)))

(declare-fun res!79039 () Bool)

(assert (=> b!166321 (=> (not res!79039) (not e!109103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166321 (= res!79039 (validMask!0 (mask!8157 thiss!1248)))))

(declare-fun lt!83260 () Unit!5055)

(assert (=> b!166321 (= lt!83260 e!109107)))

(declare-fun c!30205 () Bool)

(declare-datatypes ((tuple2!3100 0))(
  ( (tuple2!3101 (_1!1561 (_ BitVec 64)) (_2!1561 V!4649)) )
))
(declare-datatypes ((List!2086 0))(
  ( (Nil!2083) (Cons!2082 (h!2699 tuple2!3100) (t!6888 List!2086)) )
))
(declare-datatypes ((ListLongMap!2055 0))(
  ( (ListLongMap!2056 (toList!1043 List!2086)) )
))
(declare-fun contains!1085 (ListLongMap!2055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!701 (array!6599 array!6601 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 32) Int) ListLongMap!2055)

(assert (=> b!166321 (= c!30205 (contains!1085 (getCurrentListMap!701 (_keys!5253 thiss!1248) (_values!3411 thiss!1248) (mask!8157 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3428 thiss!1248)) key!828))))

(declare-fun b!166322 () Bool)

(declare-fun Unit!5057 () Unit!5055)

(assert (=> b!166322 (= e!109107 Unit!5057)))

(declare-fun lt!83259 () Unit!5055)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!86 (array!6599 array!6601 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 64) Int) Unit!5055)

(assert (=> b!166322 (= lt!83259 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!86 (_keys!5253 thiss!1248) (_values!3411 thiss!1248) (mask!8157 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) key!828 (defaultEntry!3428 thiss!1248)))))

(assert (=> b!166322 false))

(declare-fun b!166323 () Bool)

(assert (=> b!166323 (= e!109100 (= (select (arr!3135 (_keys!5253 thiss!1248)) (index!3981 lt!83261)) key!828))))

(declare-fun b!166324 () Bool)

(declare-fun e!109101 () Bool)

(assert (=> b!166324 (= e!109101 tp_is_empty!3751)))

(declare-fun b!166325 () Bool)

(assert (=> b!166325 (= e!109103 false)))

(declare-fun lt!83262 () Bool)

(declare-datatypes ((List!2087 0))(
  ( (Nil!2084) (Cons!2083 (h!2700 (_ BitVec 64)) (t!6889 List!2087)) )
))
(declare-fun arrayNoDuplicates!0 (array!6599 (_ BitVec 32) List!2087) Bool)

(assert (=> b!166325 (= lt!83262 (arrayNoDuplicates!0 (_keys!5253 thiss!1248) #b00000000000000000000000000000000 Nil!2084))))

(declare-fun mapIsEmpty!6345 () Bool)

(declare-fun mapRes!6345 () Bool)

(assert (=> mapIsEmpty!6345 mapRes!6345))

(declare-fun e!109109 () Bool)

(declare-fun array_inv!2009 (array!6599) Bool)

(declare-fun array_inv!2010 (array!6601) Bool)

(assert (=> b!166326 (= e!109102 (and tp!14447 tp_is_empty!3751 (array_inv!2009 (_keys!5253 thiss!1248)) (array_inv!2010 (_values!3411 thiss!1248)) e!109109))))

(declare-fun mapNonEmpty!6345 () Bool)

(declare-fun tp!14448 () Bool)

(assert (=> mapNonEmpty!6345 (= mapRes!6345 (and tp!14448 e!109105))))

(declare-fun mapValue!6345 () ValueCell!1532)

(declare-fun mapRest!6345 () (Array (_ BitVec 32) ValueCell!1532))

(declare-fun mapKey!6345 () (_ BitVec 32))

(assert (=> mapNonEmpty!6345 (= (arr!3136 (_values!3411 thiss!1248)) (store mapRest!6345 mapKey!6345 mapValue!6345))))

(declare-fun b!166327 () Bool)

(assert (=> b!166327 (= e!109104 e!109108)))

(declare-fun res!79035 () Bool)

(assert (=> b!166327 (=> (not res!79035) (not e!109108))))

(assert (=> b!166327 (= res!79035 (and (not (is-Undefined!453 lt!83261)) (not (is-MissingVacant!453 lt!83261)) (not (is-MissingZero!453 lt!83261)) (is-Found!453 lt!83261)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6599 (_ BitVec 32)) SeekEntryResult!453)

(assert (=> b!166327 (= lt!83261 (seekEntryOrOpen!0 key!828 (_keys!5253 thiss!1248) (mask!8157 thiss!1248)))))

(declare-fun b!166328 () Bool)

(declare-fun res!79038 () Bool)

(assert (=> b!166328 (=> (not res!79038) (not e!109103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6599 (_ BitVec 32)) Bool)

(assert (=> b!166328 (= res!79038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5253 thiss!1248) (mask!8157 thiss!1248)))))

(declare-fun b!166329 () Bool)

(assert (=> b!166329 (= e!109109 (and e!109101 mapRes!6345))))

(declare-fun condMapEmpty!6345 () Bool)

(declare-fun mapDefault!6345 () ValueCell!1532)

