; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16748 () Bool)

(assert start!16748)

(declare-fun b!168345 () Bool)

(declare-fun b_free!4053 () Bool)

(declare-fun b_next!4053 () Bool)

(assert (=> b!168345 (= b_free!4053 (not b_next!4053))))

(declare-fun tp!14759 () Bool)

(declare-fun b_and!10467 () Bool)

(assert (=> b!168345 (= tp!14759 b_and!10467)))

(declare-fun tp_is_empty!3855 () Bool)

(declare-fun e!110665 () Bool)

(declare-fun e!110661 () Bool)

(declare-datatypes ((V!4787 0))(
  ( (V!4788 (val!1972 Int)) )
))
(declare-datatypes ((ValueCell!1584 0))(
  ( (ValueCellFull!1584 (v!3837 V!4787)) (EmptyCell!1584) )
))
(declare-datatypes ((array!6807 0))(
  ( (array!6808 (arr!3239 (Array (_ BitVec 32) (_ BitVec 64))) (size!3527 (_ BitVec 32))) )
))
(declare-datatypes ((array!6809 0))(
  ( (array!6810 (arr!3240 (Array (_ BitVec 32) ValueCell!1584)) (size!3528 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2076 0))(
  ( (LongMapFixedSize!2077 (defaultEntry!3480 Int) (mask!8243 (_ BitVec 32)) (extraKeys!3221 (_ BitVec 32)) (zeroValue!3323 V!4787) (minValue!3323 V!4787) (_size!1087 (_ BitVec 32)) (_keys!5305 array!6807) (_values!3463 array!6809) (_vacant!1087 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2076)

(declare-fun array_inv!2083 (array!6807) Bool)

(declare-fun array_inv!2084 (array!6809) Bool)

(assert (=> b!168345 (= e!110665 (and tp!14759 tp_is_empty!3855 (array_inv!2083 (_keys!5305 thiss!1248)) (array_inv!2084 (_values!3463 thiss!1248)) e!110661))))

(declare-fun mapIsEmpty!6501 () Bool)

(declare-fun mapRes!6501 () Bool)

(assert (=> mapIsEmpty!6501 mapRes!6501))

(declare-fun b!168346 () Bool)

(declare-fun e!110660 () Bool)

(assert (=> b!168346 (= e!110660 tp_is_empty!3855)))

(declare-fun b!168348 () Bool)

(assert (=> b!168348 (= e!110661 (and e!110660 mapRes!6501))))

(declare-fun condMapEmpty!6501 () Bool)

(declare-fun mapDefault!6501 () ValueCell!1584)

(assert (=> b!168348 (= condMapEmpty!6501 (= (arr!3240 (_values!3463 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1584)) mapDefault!6501)))))

(declare-fun b!168349 () Bool)

(declare-fun res!80128 () Bool)

(declare-fun e!110667 () Bool)

(assert (=> b!168349 (=> (not res!80128) (not e!110667))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168349 (= res!80128 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168350 () Bool)

(declare-datatypes ((Unit!5177 0))(
  ( (Unit!5178) )
))
(declare-fun e!110664 () Unit!5177)

(declare-fun lt!84178 () Unit!5177)

(assert (=> b!168350 (= e!110664 lt!84178)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!121 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4787 V!4787 (_ BitVec 64) Int) Unit!5177)

(assert (=> b!168350 (= lt!84178 (lemmaInListMapThenSeekEntryOrOpenFindsIt!121 (_keys!5305 thiss!1248) (_values!3463 thiss!1248) (mask!8243 thiss!1248) (extraKeys!3221 thiss!1248) (zeroValue!3323 thiss!1248) (minValue!3323 thiss!1248) key!828 (defaultEntry!3480 thiss!1248)))))

(declare-fun res!80131 () Bool)

(declare-datatypes ((SeekEntryResult!498 0))(
  ( (MissingZero!498 (index!4160 (_ BitVec 32))) (Found!498 (index!4161 (_ BitVec 32))) (Intermediate!498 (undefined!1310 Bool) (index!4162 (_ BitVec 32)) (x!18606 (_ BitVec 32))) (Undefined!498) (MissingVacant!498 (index!4163 (_ BitVec 32))) )
))
(declare-fun lt!84180 () SeekEntryResult!498)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168350 (= res!80131 (inRange!0 (index!4161 lt!84180) (mask!8243 thiss!1248)))))

(declare-fun e!110663 () Bool)

(assert (=> b!168350 (=> (not res!80131) (not e!110663))))

(assert (=> b!168350 e!110663))

(declare-fun b!168351 () Bool)

(declare-fun e!110662 () Bool)

(assert (=> b!168351 (= e!110662 true)))

(declare-fun lt!84175 () Bool)

(declare-datatypes ((List!2157 0))(
  ( (Nil!2154) (Cons!2153 (h!2770 (_ BitVec 64)) (t!6959 List!2157)) )
))
(declare-fun arrayNoDuplicates!0 (array!6807 (_ BitVec 32) List!2157) Bool)

(assert (=> b!168351 (= lt!84175 (arrayNoDuplicates!0 (_keys!5305 thiss!1248) #b00000000000000000000000000000000 Nil!2154))))

(declare-fun b!168352 () Bool)

(declare-fun res!80130 () Bool)

(assert (=> b!168352 (=> res!80130 e!110662)))

(assert (=> b!168352 (= res!80130 (or (not (= (size!3528 (_values!3463 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8243 thiss!1248)))) (not (= (size!3527 (_keys!5305 thiss!1248)) (size!3528 (_values!3463 thiss!1248)))) (bvslt (mask!8243 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3221 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3221 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6501 () Bool)

(declare-fun tp!14760 () Bool)

(declare-fun e!110669 () Bool)

(assert (=> mapNonEmpty!6501 (= mapRes!6501 (and tp!14760 e!110669))))

(declare-fun mapValue!6501 () ValueCell!1584)

(declare-fun mapRest!6501 () (Array (_ BitVec 32) ValueCell!1584))

(declare-fun mapKey!6501 () (_ BitVec 32))

(assert (=> mapNonEmpty!6501 (= (arr!3240 (_values!3463 thiss!1248)) (store mapRest!6501 mapKey!6501 mapValue!6501))))

(declare-fun b!168353 () Bool)

(declare-fun e!110668 () Bool)

(assert (=> b!168353 (= e!110667 e!110668)))

(declare-fun res!80129 () Bool)

(assert (=> b!168353 (=> (not res!80129) (not e!110668))))

(get-info :version)

(assert (=> b!168353 (= res!80129 (and (not ((_ is Undefined!498) lt!84180)) (not ((_ is MissingVacant!498) lt!84180)) (not ((_ is MissingZero!498) lt!84180)) ((_ is Found!498) lt!84180)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6807 (_ BitVec 32)) SeekEntryResult!498)

(assert (=> b!168353 (= lt!84180 (seekEntryOrOpen!0 key!828 (_keys!5305 thiss!1248) (mask!8243 thiss!1248)))))

(declare-fun b!168354 () Bool)

(assert (=> b!168354 (= e!110668 (not e!110662))))

(declare-fun res!80132 () Bool)

(assert (=> b!168354 (=> res!80132 e!110662)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168354 (= res!80132 (not (validMask!0 (mask!8243 thiss!1248))))))

(declare-datatypes ((tuple2!3166 0))(
  ( (tuple2!3167 (_1!1594 (_ BitVec 64)) (_2!1594 V!4787)) )
))
(declare-datatypes ((List!2158 0))(
  ( (Nil!2155) (Cons!2154 (h!2771 tuple2!3166) (t!6960 List!2158)) )
))
(declare-datatypes ((ListLongMap!2121 0))(
  ( (ListLongMap!2122 (toList!1076 List!2158)) )
))
(declare-fun lt!84177 () ListLongMap!2121)

(declare-fun v!309 () V!4787)

(declare-fun +!228 (ListLongMap!2121 tuple2!3166) ListLongMap!2121)

(declare-fun getCurrentListMap!734 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4787 V!4787 (_ BitVec 32) Int) ListLongMap!2121)

(assert (=> b!168354 (= (+!228 lt!84177 (tuple2!3167 key!828 v!309)) (getCurrentListMap!734 (_keys!5305 thiss!1248) (array!6810 (store (arr!3240 (_values!3463 thiss!1248)) (index!4161 lt!84180) (ValueCellFull!1584 v!309)) (size!3528 (_values!3463 thiss!1248))) (mask!8243 thiss!1248) (extraKeys!3221 thiss!1248) (zeroValue!3323 thiss!1248) (minValue!3323 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3480 thiss!1248)))))

(declare-fun lt!84179 () Unit!5177)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!83 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4787 V!4787 (_ BitVec 32) (_ BitVec 64) V!4787 Int) Unit!5177)

(assert (=> b!168354 (= lt!84179 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!83 (_keys!5305 thiss!1248) (_values!3463 thiss!1248) (mask!8243 thiss!1248) (extraKeys!3221 thiss!1248) (zeroValue!3323 thiss!1248) (minValue!3323 thiss!1248) (index!4161 lt!84180) key!828 v!309 (defaultEntry!3480 thiss!1248)))))

(declare-fun lt!84176 () Unit!5177)

(assert (=> b!168354 (= lt!84176 e!110664)))

(declare-fun c!30361 () Bool)

(declare-fun contains!1118 (ListLongMap!2121 (_ BitVec 64)) Bool)

(assert (=> b!168354 (= c!30361 (contains!1118 lt!84177 key!828))))

(assert (=> b!168354 (= lt!84177 (getCurrentListMap!734 (_keys!5305 thiss!1248) (_values!3463 thiss!1248) (mask!8243 thiss!1248) (extraKeys!3221 thiss!1248) (zeroValue!3323 thiss!1248) (minValue!3323 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3480 thiss!1248)))))

(declare-fun b!168355 () Bool)

(declare-fun res!80133 () Bool)

(assert (=> b!168355 (=> res!80133 e!110662)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6807 (_ BitVec 32)) Bool)

(assert (=> b!168355 (= res!80133 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5305 thiss!1248) (mask!8243 thiss!1248))))))

(declare-fun b!168356 () Bool)

(declare-fun Unit!5179 () Unit!5177)

(assert (=> b!168356 (= e!110664 Unit!5179)))

(declare-fun lt!84181 () Unit!5177)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!122 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4787 V!4787 (_ BitVec 64) Int) Unit!5177)

(assert (=> b!168356 (= lt!84181 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!122 (_keys!5305 thiss!1248) (_values!3463 thiss!1248) (mask!8243 thiss!1248) (extraKeys!3221 thiss!1248) (zeroValue!3323 thiss!1248) (minValue!3323 thiss!1248) key!828 (defaultEntry!3480 thiss!1248)))))

(assert (=> b!168356 false))

(declare-fun b!168357 () Bool)

(assert (=> b!168357 (= e!110663 (= (select (arr!3239 (_keys!5305 thiss!1248)) (index!4161 lt!84180)) key!828))))

(declare-fun b!168347 () Bool)

(assert (=> b!168347 (= e!110669 tp_is_empty!3855)))

(declare-fun res!80127 () Bool)

(assert (=> start!16748 (=> (not res!80127) (not e!110667))))

(declare-fun valid!899 (LongMapFixedSize!2076) Bool)

(assert (=> start!16748 (= res!80127 (valid!899 thiss!1248))))

(assert (=> start!16748 e!110667))

(assert (=> start!16748 e!110665))

(assert (=> start!16748 true))

(assert (=> start!16748 tp_is_empty!3855))

(assert (= (and start!16748 res!80127) b!168349))

(assert (= (and b!168349 res!80128) b!168353))

(assert (= (and b!168353 res!80129) b!168354))

(assert (= (and b!168354 c!30361) b!168350))

(assert (= (and b!168354 (not c!30361)) b!168356))

(assert (= (and b!168350 res!80131) b!168357))

(assert (= (and b!168354 (not res!80132)) b!168352))

(assert (= (and b!168352 (not res!80130)) b!168355))

(assert (= (and b!168355 (not res!80133)) b!168351))

(assert (= (and b!168348 condMapEmpty!6501) mapIsEmpty!6501))

(assert (= (and b!168348 (not condMapEmpty!6501)) mapNonEmpty!6501))

(assert (= (and mapNonEmpty!6501 ((_ is ValueCellFull!1584) mapValue!6501)) b!168347))

(assert (= (and b!168348 ((_ is ValueCellFull!1584) mapDefault!6501)) b!168346))

(assert (= b!168345 b!168348))

(assert (= start!16748 b!168345))

(declare-fun m!197427 () Bool)

(assert (=> start!16748 m!197427))

(declare-fun m!197429 () Bool)

(assert (=> b!168355 m!197429))

(declare-fun m!197431 () Bool)

(assert (=> b!168357 m!197431))

(declare-fun m!197433 () Bool)

(assert (=> b!168356 m!197433))

(declare-fun m!197435 () Bool)

(assert (=> b!168351 m!197435))

(declare-fun m!197437 () Bool)

(assert (=> b!168354 m!197437))

(declare-fun m!197439 () Bool)

(assert (=> b!168354 m!197439))

(declare-fun m!197441 () Bool)

(assert (=> b!168354 m!197441))

(declare-fun m!197443 () Bool)

(assert (=> b!168354 m!197443))

(declare-fun m!197445 () Bool)

(assert (=> b!168354 m!197445))

(declare-fun m!197447 () Bool)

(assert (=> b!168354 m!197447))

(declare-fun m!197449 () Bool)

(assert (=> b!168354 m!197449))

(declare-fun m!197451 () Bool)

(assert (=> b!168345 m!197451))

(declare-fun m!197453 () Bool)

(assert (=> b!168345 m!197453))

(declare-fun m!197455 () Bool)

(assert (=> b!168350 m!197455))

(declare-fun m!197457 () Bool)

(assert (=> b!168350 m!197457))

(declare-fun m!197459 () Bool)

(assert (=> mapNonEmpty!6501 m!197459))

(declare-fun m!197461 () Bool)

(assert (=> b!168353 m!197461))

(check-sat tp_is_empty!3855 (not b!168355) (not b!168345) (not start!16748) b_and!10467 (not mapNonEmpty!6501) (not b!168350) (not b!168356) (not b!168351) (not b!168354) (not b_next!4053) (not b!168353))
(check-sat b_and!10467 (not b_next!4053))
