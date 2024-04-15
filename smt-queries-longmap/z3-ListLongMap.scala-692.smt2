; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16660 () Bool)

(assert start!16660)

(declare-fun b!166411 () Bool)

(declare-fun b_free!3961 () Bool)

(declare-fun b_next!3961 () Bool)

(assert (=> b!166411 (= b_free!3961 (not b_next!3961))))

(declare-fun tp!14483 () Bool)

(declare-fun b_and!10349 () Bool)

(assert (=> b!166411 (= tp!14483 b_and!10349)))

(declare-datatypes ((SeekEntryResult!467 0))(
  ( (MissingZero!467 (index!4036 (_ BitVec 32))) (Found!467 (index!4037 (_ BitVec 32))) (Intermediate!467 (undefined!1279 Bool) (index!4038 (_ BitVec 32)) (x!18454 (_ BitVec 32))) (Undefined!467) (MissingVacant!467 (index!4039 (_ BitVec 32))) )
))
(declare-fun lt!83171 () SeekEntryResult!467)

(declare-fun b!166404 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4665 0))(
  ( (V!4666 (val!1926 Int)) )
))
(declare-datatypes ((ValueCell!1538 0))(
  ( (ValueCellFull!1538 (v!3785 V!4665)) (EmptyCell!1538) )
))
(declare-datatypes ((array!6603 0))(
  ( (array!6604 (arr!3136 (Array (_ BitVec 32) (_ BitVec 64))) (size!3425 (_ BitVec 32))) )
))
(declare-datatypes ((array!6605 0))(
  ( (array!6606 (arr!3137 (Array (_ BitVec 32) ValueCell!1538)) (size!3426 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1984 0))(
  ( (LongMapFixedSize!1985 (defaultEntry!3434 Int) (mask!8166 (_ BitVec 32)) (extraKeys!3175 (_ BitVec 32)) (zeroValue!3277 V!4665) (minValue!3277 V!4665) (_size!1041 (_ BitVec 32)) (_keys!5258 array!6603) (_values!3417 array!6605) (_vacant!1041 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1984)

(declare-fun e!109180 () Bool)

(assert (=> b!166404 (= e!109180 (= (select (arr!3136 (_keys!5258 thiss!1248)) (index!4037 lt!83171)) key!828))))

(declare-fun mapIsEmpty!6363 () Bool)

(declare-fun mapRes!6363 () Bool)

(assert (=> mapIsEmpty!6363 mapRes!6363))

(declare-fun b!166405 () Bool)

(declare-fun e!109184 () Bool)

(declare-fun e!109179 () Bool)

(assert (=> b!166405 (= e!109184 e!109179)))

(declare-fun res!79066 () Bool)

(assert (=> b!166405 (=> (not res!79066) (not e!109179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166405 (= res!79066 (validMask!0 (mask!8166 thiss!1248)))))

(declare-datatypes ((Unit!5040 0))(
  ( (Unit!5041) )
))
(declare-fun lt!83172 () Unit!5040)

(declare-fun e!109183 () Unit!5040)

(assert (=> b!166405 (= lt!83172 e!109183)))

(declare-fun c!30197 () Bool)

(declare-datatypes ((tuple2!3096 0))(
  ( (tuple2!3097 (_1!1559 (_ BitVec 64)) (_2!1559 V!4665)) )
))
(declare-datatypes ((List!2097 0))(
  ( (Nil!2094) (Cons!2093 (h!2710 tuple2!3096) (t!6890 List!2097)) )
))
(declare-datatypes ((ListLongMap!2039 0))(
  ( (ListLongMap!2040 (toList!1035 List!2097)) )
))
(declare-fun contains!1080 (ListLongMap!2039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!677 (array!6603 array!6605 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 32) Int) ListLongMap!2039)

(assert (=> b!166405 (= c!30197 (contains!1080 (getCurrentListMap!677 (_keys!5258 thiss!1248) (_values!3417 thiss!1248) (mask!8166 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3434 thiss!1248)) key!828))))

(declare-fun b!166406 () Bool)

(declare-fun Unit!5042 () Unit!5040)

(assert (=> b!166406 (= e!109183 Unit!5042)))

(declare-fun lt!83168 () Unit!5040)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!84 (array!6603 array!6605 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 64) Int) Unit!5040)

(assert (=> b!166406 (= lt!83168 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!84 (_keys!5258 thiss!1248) (_values!3417 thiss!1248) (mask!8166 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) key!828 (defaultEntry!3434 thiss!1248)))))

(assert (=> b!166406 false))

(declare-fun b!166407 () Bool)

(declare-fun res!79071 () Bool)

(declare-fun e!109187 () Bool)

(assert (=> b!166407 (=> (not res!79071) (not e!109187))))

(assert (=> b!166407 (= res!79071 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166408 () Bool)

(declare-fun e!109181 () Bool)

(declare-fun e!109182 () Bool)

(assert (=> b!166408 (= e!109181 (and e!109182 mapRes!6363))))

(declare-fun condMapEmpty!6363 () Bool)

(declare-fun mapDefault!6363 () ValueCell!1538)

(assert (=> b!166408 (= condMapEmpty!6363 (= (arr!3137 (_values!3417 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1538)) mapDefault!6363)))))

(declare-fun b!166409 () Bool)

(assert (=> b!166409 (= e!109179 false)))

(declare-fun lt!83169 () Bool)

(declare-datatypes ((List!2098 0))(
  ( (Nil!2095) (Cons!2094 (h!2711 (_ BitVec 64)) (t!6891 List!2098)) )
))
(declare-fun arrayNoDuplicates!0 (array!6603 (_ BitVec 32) List!2098) Bool)

(assert (=> b!166409 (= lt!83169 (arrayNoDuplicates!0 (_keys!5258 thiss!1248) #b00000000000000000000000000000000 Nil!2095))))

(declare-fun b!166410 () Bool)

(declare-fun res!79068 () Bool)

(assert (=> b!166410 (=> (not res!79068) (not e!109179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6603 (_ BitVec 32)) Bool)

(assert (=> b!166410 (= res!79068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5258 thiss!1248) (mask!8166 thiss!1248)))))

(declare-fun e!109185 () Bool)

(declare-fun tp_is_empty!3763 () Bool)

(declare-fun array_inv!2015 (array!6603) Bool)

(declare-fun array_inv!2016 (array!6605) Bool)

(assert (=> b!166411 (= e!109185 (and tp!14483 tp_is_empty!3763 (array_inv!2015 (_keys!5258 thiss!1248)) (array_inv!2016 (_values!3417 thiss!1248)) e!109181))))

(declare-fun b!166412 () Bool)

(declare-fun lt!83170 () Unit!5040)

(assert (=> b!166412 (= e!109183 lt!83170)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!87 (array!6603 array!6605 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 64) Int) Unit!5040)

(assert (=> b!166412 (= lt!83170 (lemmaInListMapThenSeekEntryOrOpenFindsIt!87 (_keys!5258 thiss!1248) (_values!3417 thiss!1248) (mask!8166 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) key!828 (defaultEntry!3434 thiss!1248)))))

(declare-fun res!79067 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166412 (= res!79067 (inRange!0 (index!4037 lt!83171) (mask!8166 thiss!1248)))))

(assert (=> b!166412 (=> (not res!79067) (not e!109180))))

(assert (=> b!166412 e!109180))

(declare-fun b!166413 () Bool)

(assert (=> b!166413 (= e!109187 e!109184)))

(declare-fun res!79069 () Bool)

(assert (=> b!166413 (=> (not res!79069) (not e!109184))))

(get-info :version)

(assert (=> b!166413 (= res!79069 (and (not ((_ is Undefined!467) lt!83171)) (not ((_ is MissingVacant!467) lt!83171)) (not ((_ is MissingZero!467) lt!83171)) ((_ is Found!467) lt!83171)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6603 (_ BitVec 32)) SeekEntryResult!467)

(assert (=> b!166413 (= lt!83171 (seekEntryOrOpen!0 key!828 (_keys!5258 thiss!1248) (mask!8166 thiss!1248)))))

(declare-fun b!166414 () Bool)

(assert (=> b!166414 (= e!109182 tp_is_empty!3763)))

(declare-fun b!166415 () Bool)

(declare-fun res!79072 () Bool)

(assert (=> b!166415 (=> (not res!79072) (not e!109179))))

(assert (=> b!166415 (= res!79072 (and (= (size!3426 (_values!3417 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8166 thiss!1248))) (= (size!3425 (_keys!5258 thiss!1248)) (size!3426 (_values!3417 thiss!1248))) (bvsge (mask!8166 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3175 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3175 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166416 () Bool)

(declare-fun e!109188 () Bool)

(assert (=> b!166416 (= e!109188 tp_is_empty!3763)))

(declare-fun mapNonEmpty!6363 () Bool)

(declare-fun tp!14484 () Bool)

(assert (=> mapNonEmpty!6363 (= mapRes!6363 (and tp!14484 e!109188))))

(declare-fun mapKey!6363 () (_ BitVec 32))

(declare-fun mapValue!6363 () ValueCell!1538)

(declare-fun mapRest!6363 () (Array (_ BitVec 32) ValueCell!1538))

(assert (=> mapNonEmpty!6363 (= (arr!3137 (_values!3417 thiss!1248)) (store mapRest!6363 mapKey!6363 mapValue!6363))))

(declare-fun res!79070 () Bool)

(assert (=> start!16660 (=> (not res!79070) (not e!109187))))

(declare-fun valid!878 (LongMapFixedSize!1984) Bool)

(assert (=> start!16660 (= res!79070 (valid!878 thiss!1248))))

(assert (=> start!16660 e!109187))

(assert (=> start!16660 e!109185))

(assert (=> start!16660 true))

(assert (= (and start!16660 res!79070) b!166407))

(assert (= (and b!166407 res!79071) b!166413))

(assert (= (and b!166413 res!79069) b!166405))

(assert (= (and b!166405 c!30197) b!166412))

(assert (= (and b!166405 (not c!30197)) b!166406))

(assert (= (and b!166412 res!79067) b!166404))

(assert (= (and b!166405 res!79066) b!166415))

(assert (= (and b!166415 res!79072) b!166410))

(assert (= (and b!166410 res!79068) b!166409))

(assert (= (and b!166408 condMapEmpty!6363) mapIsEmpty!6363))

(assert (= (and b!166408 (not condMapEmpty!6363)) mapNonEmpty!6363))

(assert (= (and mapNonEmpty!6363 ((_ is ValueCellFull!1538) mapValue!6363)) b!166416))

(assert (= (and b!166408 ((_ is ValueCellFull!1538) mapDefault!6363)) b!166414))

(assert (= b!166411 b!166408))

(assert (= start!16660 b!166411))

(declare-fun m!195343 () Bool)

(assert (=> b!166413 m!195343))

(declare-fun m!195345 () Bool)

(assert (=> b!166410 m!195345))

(declare-fun m!195347 () Bool)

(assert (=> b!166411 m!195347))

(declare-fun m!195349 () Bool)

(assert (=> b!166411 m!195349))

(declare-fun m!195351 () Bool)

(assert (=> b!166412 m!195351))

(declare-fun m!195353 () Bool)

(assert (=> b!166412 m!195353))

(declare-fun m!195355 () Bool)

(assert (=> b!166406 m!195355))

(declare-fun m!195357 () Bool)

(assert (=> b!166405 m!195357))

(declare-fun m!195359 () Bool)

(assert (=> b!166405 m!195359))

(assert (=> b!166405 m!195359))

(declare-fun m!195361 () Bool)

(assert (=> b!166405 m!195361))

(declare-fun m!195363 () Bool)

(assert (=> start!16660 m!195363))

(declare-fun m!195365 () Bool)

(assert (=> b!166409 m!195365))

(declare-fun m!195367 () Bool)

(assert (=> mapNonEmpty!6363 m!195367))

(declare-fun m!195369 () Bool)

(assert (=> b!166404 m!195369))

(check-sat b_and!10349 (not b!166412) (not b!166409) (not start!16660) (not b!166410) (not b_next!3961) (not b!166411) (not mapNonEmpty!6363) (not b!166413) (not b!166406) (not b!166405) tp_is_empty!3763)
(check-sat b_and!10349 (not b_next!3961))
