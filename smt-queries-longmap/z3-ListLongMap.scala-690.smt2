; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16648 () Bool)

(assert start!16648)

(declare-fun b!166373 () Bool)

(declare-fun b_free!3949 () Bool)

(declare-fun b_next!3949 () Bool)

(assert (=> b!166373 (= b_free!3949 (not b_next!3949))))

(declare-fun tp!14447 () Bool)

(declare-fun b_and!10377 () Bool)

(assert (=> b!166373 (= tp!14447 b_and!10377)))

(declare-fun b!166364 () Bool)

(declare-fun e!109128 () Bool)

(declare-fun e!109130 () Bool)

(declare-fun mapRes!6345 () Bool)

(assert (=> b!166364 (= e!109128 (and e!109130 mapRes!6345))))

(declare-fun condMapEmpty!6345 () Bool)

(declare-datatypes ((V!4649 0))(
  ( (V!4650 (val!1920 Int)) )
))
(declare-datatypes ((ValueCell!1532 0))(
  ( (ValueCellFull!1532 (v!3786 V!4649)) (EmptyCell!1532) )
))
(declare-datatypes ((array!6585 0))(
  ( (array!6586 (arr!3128 (Array (_ BitVec 32) (_ BitVec 64))) (size!3416 (_ BitVec 32))) )
))
(declare-datatypes ((array!6587 0))(
  ( (array!6588 (arr!3129 (Array (_ BitVec 32) ValueCell!1532)) (size!3417 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1972 0))(
  ( (LongMapFixedSize!1973 (defaultEntry!3428 Int) (mask!8157 (_ BitVec 32)) (extraKeys!3169 (_ BitVec 32)) (zeroValue!3271 V!4649) (minValue!3271 V!4649) (_size!1035 (_ BitVec 32)) (_keys!5253 array!6585) (_values!3411 array!6587) (_vacant!1035 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1972)

(declare-fun mapDefault!6345 () ValueCell!1532)

(assert (=> b!166364 (= condMapEmpty!6345 (= (arr!3129 (_values!3411 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1532)) mapDefault!6345)))))

(declare-fun b!166365 () Bool)

(declare-fun e!109133 () Bool)

(declare-fun tp_is_empty!3751 () Bool)

(assert (=> b!166365 (= e!109133 tp_is_empty!3751)))

(declare-fun b!166366 () Bool)

(declare-fun res!79057 () Bool)

(declare-fun e!109131 () Bool)

(assert (=> b!166366 (=> (not res!79057) (not e!109131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6585 (_ BitVec 32)) Bool)

(assert (=> b!166366 (= res!79057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5253 thiss!1248) (mask!8157 thiss!1248)))))

(declare-fun b!166367 () Bool)

(declare-fun e!109126 () Bool)

(declare-fun e!109129 () Bool)

(assert (=> b!166367 (= e!109126 e!109129)))

(declare-fun res!79062 () Bool)

(assert (=> b!166367 (=> (not res!79062) (not e!109129))))

(declare-datatypes ((SeekEntryResult!449 0))(
  ( (MissingZero!449 (index!3964 (_ BitVec 32))) (Found!449 (index!3965 (_ BitVec 32))) (Intermediate!449 (undefined!1261 Bool) (index!3966 (_ BitVec 32)) (x!18421 (_ BitVec 32))) (Undefined!449) (MissingVacant!449 (index!3967 (_ BitVec 32))) )
))
(declare-fun lt!83319 () SeekEntryResult!449)

(get-info :version)

(assert (=> b!166367 (= res!79062 (and (not ((_ is Undefined!449) lt!83319)) (not ((_ is MissingVacant!449) lt!83319)) (not ((_ is MissingZero!449) lt!83319)) ((_ is Found!449) lt!83319)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6585 (_ BitVec 32)) SeekEntryResult!449)

(assert (=> b!166367 (= lt!83319 (seekEntryOrOpen!0 key!828 (_keys!5253 thiss!1248) (mask!8157 thiss!1248)))))

(declare-fun mapNonEmpty!6345 () Bool)

(declare-fun tp!14448 () Bool)

(assert (=> mapNonEmpty!6345 (= mapRes!6345 (and tp!14448 e!109133))))

(declare-fun mapValue!6345 () ValueCell!1532)

(declare-fun mapKey!6345 () (_ BitVec 32))

(declare-fun mapRest!6345 () (Array (_ BitVec 32) ValueCell!1532))

(assert (=> mapNonEmpty!6345 (= (arr!3129 (_values!3411 thiss!1248)) (store mapRest!6345 mapKey!6345 mapValue!6345))))

(declare-fun mapIsEmpty!6345 () Bool)

(assert (=> mapIsEmpty!6345 mapRes!6345))

(declare-fun b!166368 () Bool)

(declare-datatypes ((Unit!5064 0))(
  ( (Unit!5065) )
))
(declare-fun e!109127 () Unit!5064)

(declare-fun Unit!5066 () Unit!5064)

(assert (=> b!166368 (= e!109127 Unit!5066)))

(declare-fun lt!83318 () Unit!5064)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!84 (array!6585 array!6587 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 64) Int) Unit!5064)

(assert (=> b!166368 (= lt!83318 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!84 (_keys!5253 thiss!1248) (_values!3411 thiss!1248) (mask!8157 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) key!828 (defaultEntry!3428 thiss!1248)))))

(assert (=> b!166368 false))

(declare-fun res!79059 () Bool)

(assert (=> start!16648 (=> (not res!79059) (not e!109126))))

(declare-fun valid!880 (LongMapFixedSize!1972) Bool)

(assert (=> start!16648 (= res!79059 (valid!880 thiss!1248))))

(assert (=> start!16648 e!109126))

(declare-fun e!109124 () Bool)

(assert (=> start!16648 e!109124))

(assert (=> start!16648 true))

(declare-fun e!109132 () Bool)

(declare-fun b!166369 () Bool)

(assert (=> b!166369 (= e!109132 (= (select (arr!3128 (_keys!5253 thiss!1248)) (index!3965 lt!83319)) key!828))))

(declare-fun b!166370 () Bool)

(assert (=> b!166370 (= e!109131 false)))

(declare-fun lt!83320 () Bool)

(declare-datatypes ((List!2076 0))(
  ( (Nil!2073) (Cons!2072 (h!2689 (_ BitVec 64)) (t!6870 List!2076)) )
))
(declare-fun arrayNoDuplicates!0 (array!6585 (_ BitVec 32) List!2076) Bool)

(assert (=> b!166370 (= lt!83320 (arrayNoDuplicates!0 (_keys!5253 thiss!1248) #b00000000000000000000000000000000 Nil!2073))))

(declare-fun b!166371 () Bool)

(assert (=> b!166371 (= e!109130 tp_is_empty!3751)))

(declare-fun b!166372 () Bool)

(declare-fun lt!83322 () Unit!5064)

(assert (=> b!166372 (= e!109127 lt!83322)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!88 (array!6585 array!6587 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 64) Int) Unit!5064)

(assert (=> b!166372 (= lt!83322 (lemmaInListMapThenSeekEntryOrOpenFindsIt!88 (_keys!5253 thiss!1248) (_values!3411 thiss!1248) (mask!8157 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) key!828 (defaultEntry!3428 thiss!1248)))))

(declare-fun res!79056 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166372 (= res!79056 (inRange!0 (index!3965 lt!83319) (mask!8157 thiss!1248)))))

(assert (=> b!166372 (=> (not res!79056) (not e!109132))))

(assert (=> b!166372 e!109132))

(declare-fun array_inv!2003 (array!6585) Bool)

(declare-fun array_inv!2004 (array!6587) Bool)

(assert (=> b!166373 (= e!109124 (and tp!14447 tp_is_empty!3751 (array_inv!2003 (_keys!5253 thiss!1248)) (array_inv!2004 (_values!3411 thiss!1248)) e!109128))))

(declare-fun b!166374 () Bool)

(declare-fun res!79061 () Bool)

(assert (=> b!166374 (=> (not res!79061) (not e!109126))))

(assert (=> b!166374 (= res!79061 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166375 () Bool)

(declare-fun res!79060 () Bool)

(assert (=> b!166375 (=> (not res!79060) (not e!109131))))

(assert (=> b!166375 (= res!79060 (and (= (size!3417 (_values!3411 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8157 thiss!1248))) (= (size!3416 (_keys!5253 thiss!1248)) (size!3417 (_values!3411 thiss!1248))) (bvsge (mask!8157 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3169 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3169 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166376 () Bool)

(assert (=> b!166376 (= e!109129 e!109131)))

(declare-fun res!79058 () Bool)

(assert (=> b!166376 (=> (not res!79058) (not e!109131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166376 (= res!79058 (validMask!0 (mask!8157 thiss!1248)))))

(declare-fun lt!83321 () Unit!5064)

(assert (=> b!166376 (= lt!83321 e!109127)))

(declare-fun c!30218 () Bool)

(declare-datatypes ((tuple2!3058 0))(
  ( (tuple2!3059 (_1!1540 (_ BitVec 64)) (_2!1540 V!4649)) )
))
(declare-datatypes ((List!2077 0))(
  ( (Nil!2074) (Cons!2073 (h!2690 tuple2!3058) (t!6871 List!2077)) )
))
(declare-datatypes ((ListLongMap!2019 0))(
  ( (ListLongMap!2020 (toList!1025 List!2077)) )
))
(declare-fun contains!1077 (ListLongMap!2019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!687 (array!6585 array!6587 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 32) Int) ListLongMap!2019)

(assert (=> b!166376 (= c!30218 (contains!1077 (getCurrentListMap!687 (_keys!5253 thiss!1248) (_values!3411 thiss!1248) (mask!8157 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3428 thiss!1248)) key!828))))

(assert (= (and start!16648 res!79059) b!166374))

(assert (= (and b!166374 res!79061) b!166367))

(assert (= (and b!166367 res!79062) b!166376))

(assert (= (and b!166376 c!30218) b!166372))

(assert (= (and b!166376 (not c!30218)) b!166368))

(assert (= (and b!166372 res!79056) b!166369))

(assert (= (and b!166376 res!79058) b!166375))

(assert (= (and b!166375 res!79060) b!166366))

(assert (= (and b!166366 res!79057) b!166370))

(assert (= (and b!166364 condMapEmpty!6345) mapIsEmpty!6345))

(assert (= (and b!166364 (not condMapEmpty!6345)) mapNonEmpty!6345))

(assert (= (and mapNonEmpty!6345 ((_ is ValueCellFull!1532) mapValue!6345)) b!166365))

(assert (= (and b!166364 ((_ is ValueCellFull!1532) mapDefault!6345)) b!166371))

(assert (= b!166373 b!166364))

(assert (= start!16648 b!166373))

(declare-fun m!195977 () Bool)

(assert (=> b!166373 m!195977))

(declare-fun m!195979 () Bool)

(assert (=> b!166373 m!195979))

(declare-fun m!195981 () Bool)

(assert (=> b!166366 m!195981))

(declare-fun m!195983 () Bool)

(assert (=> b!166372 m!195983))

(declare-fun m!195985 () Bool)

(assert (=> b!166372 m!195985))

(declare-fun m!195987 () Bool)

(assert (=> mapNonEmpty!6345 m!195987))

(declare-fun m!195989 () Bool)

(assert (=> b!166376 m!195989))

(declare-fun m!195991 () Bool)

(assert (=> b!166376 m!195991))

(assert (=> b!166376 m!195991))

(declare-fun m!195993 () Bool)

(assert (=> b!166376 m!195993))

(declare-fun m!195995 () Bool)

(assert (=> start!16648 m!195995))

(declare-fun m!195997 () Bool)

(assert (=> b!166369 m!195997))

(declare-fun m!195999 () Bool)

(assert (=> b!166370 m!195999))

(declare-fun m!196001 () Bool)

(assert (=> b!166368 m!196001))

(declare-fun m!196003 () Bool)

(assert (=> b!166367 m!196003))

(check-sat b_and!10377 (not b!166373) (not b!166370) (not start!16648) (not b_next!3949) (not b!166376) (not b!166367) (not mapNonEmpty!6345) (not b!166366) (not b!166372) (not b!166368) tp_is_empty!3751)
(check-sat b_and!10377 (not b_next!3949))
