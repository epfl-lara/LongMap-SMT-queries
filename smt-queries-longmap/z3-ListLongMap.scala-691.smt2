; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16654 () Bool)

(assert start!16654)

(declare-fun b!166298 () Bool)

(declare-fun b_free!3955 () Bool)

(declare-fun b_next!3955 () Bool)

(assert (=> b!166298 (= b_free!3955 (not b_next!3955))))

(declare-fun tp!14465 () Bool)

(declare-fun b_and!10343 () Bool)

(assert (=> b!166298 (= tp!14465 b_and!10343)))

(declare-fun e!109098 () Bool)

(declare-datatypes ((SeekEntryResult!466 0))(
  ( (MissingZero!466 (index!4032 (_ BitVec 32))) (Found!466 (index!4033 (_ BitVec 32))) (Intermediate!466 (undefined!1278 Bool) (index!4034 (_ BitVec 32)) (x!18445 (_ BitVec 32))) (Undefined!466) (MissingVacant!466 (index!4035 (_ BitVec 32))) )
))
(declare-fun lt!83126 () SeekEntryResult!466)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4657 0))(
  ( (V!4658 (val!1923 Int)) )
))
(declare-datatypes ((ValueCell!1535 0))(
  ( (ValueCellFull!1535 (v!3782 V!4657)) (EmptyCell!1535) )
))
(declare-datatypes ((array!6591 0))(
  ( (array!6592 (arr!3130 (Array (_ BitVec 32) (_ BitVec 64))) (size!3419 (_ BitVec 32))) )
))
(declare-datatypes ((array!6593 0))(
  ( (array!6594 (arr!3131 (Array (_ BitVec 32) ValueCell!1535)) (size!3420 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1978 0))(
  ( (LongMapFixedSize!1979 (defaultEntry!3431 Int) (mask!8161 (_ BitVec 32)) (extraKeys!3172 (_ BitVec 32)) (zeroValue!3274 V!4657) (minValue!3274 V!4657) (_size!1038 (_ BitVec 32)) (_keys!5255 array!6591) (_values!3414 array!6593) (_vacant!1038 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1978)

(declare-fun b!166287 () Bool)

(assert (=> b!166287 (= e!109098 (= (select (arr!3130 (_keys!5255 thiss!1248)) (index!4033 lt!83126)) key!828))))

(declare-fun b!166288 () Bool)

(declare-fun e!109089 () Bool)

(assert (=> b!166288 (= e!109089 false)))

(declare-fun lt!83127 () Bool)

(declare-datatypes ((List!2092 0))(
  ( (Nil!2089) (Cons!2088 (h!2705 (_ BitVec 64)) (t!6885 List!2092)) )
))
(declare-fun arrayNoDuplicates!0 (array!6591 (_ BitVec 32) List!2092) Bool)

(assert (=> b!166288 (= lt!83127 (arrayNoDuplicates!0 (_keys!5255 thiss!1248) #b00000000000000000000000000000000 Nil!2089))))

(declare-fun b!166290 () Bool)

(declare-fun e!109094 () Bool)

(declare-fun e!109095 () Bool)

(assert (=> b!166290 (= e!109094 e!109095)))

(declare-fun res!79004 () Bool)

(assert (=> b!166290 (=> (not res!79004) (not e!109095))))

(get-info :version)

(assert (=> b!166290 (= res!79004 (and (not ((_ is Undefined!466) lt!83126)) (not ((_ is MissingVacant!466) lt!83126)) (not ((_ is MissingZero!466) lt!83126)) ((_ is Found!466) lt!83126)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6591 (_ BitVec 32)) SeekEntryResult!466)

(assert (=> b!166290 (= lt!83126 (seekEntryOrOpen!0 key!828 (_keys!5255 thiss!1248) (mask!8161 thiss!1248)))))

(declare-fun b!166291 () Bool)

(declare-datatypes ((Unit!5032 0))(
  ( (Unit!5033) )
))
(declare-fun e!109096 () Unit!5032)

(declare-fun lt!83124 () Unit!5032)

(assert (=> b!166291 (= e!109096 lt!83124)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!86 (array!6591 array!6593 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 64) Int) Unit!5032)

(assert (=> b!166291 (= lt!83124 (lemmaInListMapThenSeekEntryOrOpenFindsIt!86 (_keys!5255 thiss!1248) (_values!3414 thiss!1248) (mask!8161 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) key!828 (defaultEntry!3431 thiss!1248)))))

(declare-fun res!79007 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166291 (= res!79007 (inRange!0 (index!4033 lt!83126) (mask!8161 thiss!1248)))))

(assert (=> b!166291 (=> (not res!79007) (not e!109098))))

(assert (=> b!166291 e!109098))

(declare-fun b!166292 () Bool)

(declare-fun res!79003 () Bool)

(assert (=> b!166292 (=> (not res!79003) (not e!109089))))

(assert (=> b!166292 (= res!79003 (and (= (size!3420 (_values!3414 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8161 thiss!1248))) (= (size!3419 (_keys!5255 thiss!1248)) (size!3420 (_values!3414 thiss!1248))) (bvsge (mask!8161 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3172 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3172 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166293 () Bool)

(declare-fun e!109090 () Bool)

(declare-fun e!109097 () Bool)

(declare-fun mapRes!6354 () Bool)

(assert (=> b!166293 (= e!109090 (and e!109097 mapRes!6354))))

(declare-fun condMapEmpty!6354 () Bool)

(declare-fun mapDefault!6354 () ValueCell!1535)

(assert (=> b!166293 (= condMapEmpty!6354 (= (arr!3131 (_values!3414 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1535)) mapDefault!6354)))))

(declare-fun b!166294 () Bool)

(declare-fun Unit!5034 () Unit!5032)

(assert (=> b!166294 (= e!109096 Unit!5034)))

(declare-fun lt!83123 () Unit!5032)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!82 (array!6591 array!6593 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 64) Int) Unit!5032)

(assert (=> b!166294 (= lt!83123 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!82 (_keys!5255 thiss!1248) (_values!3414 thiss!1248) (mask!8161 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) key!828 (defaultEntry!3431 thiss!1248)))))

(assert (=> b!166294 false))

(declare-fun mapNonEmpty!6354 () Bool)

(declare-fun tp!14466 () Bool)

(declare-fun e!109093 () Bool)

(assert (=> mapNonEmpty!6354 (= mapRes!6354 (and tp!14466 e!109093))))

(declare-fun mapKey!6354 () (_ BitVec 32))

(declare-fun mapValue!6354 () ValueCell!1535)

(declare-fun mapRest!6354 () (Array (_ BitVec 32) ValueCell!1535))

(assert (=> mapNonEmpty!6354 (= (arr!3131 (_values!3414 thiss!1248)) (store mapRest!6354 mapKey!6354 mapValue!6354))))

(declare-fun res!79006 () Bool)

(assert (=> start!16654 (=> (not res!79006) (not e!109094))))

(declare-fun valid!876 (LongMapFixedSize!1978) Bool)

(assert (=> start!16654 (= res!79006 (valid!876 thiss!1248))))

(assert (=> start!16654 e!109094))

(declare-fun e!109092 () Bool)

(assert (=> start!16654 e!109092))

(assert (=> start!16654 true))

(declare-fun b!166289 () Bool)

(declare-fun tp_is_empty!3757 () Bool)

(assert (=> b!166289 (= e!109093 tp_is_empty!3757)))

(declare-fun b!166295 () Bool)

(declare-fun res!79005 () Bool)

(assert (=> b!166295 (=> (not res!79005) (not e!109089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6591 (_ BitVec 32)) Bool)

(assert (=> b!166295 (= res!79005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5255 thiss!1248) (mask!8161 thiss!1248)))))

(declare-fun b!166296 () Bool)

(assert (=> b!166296 (= e!109095 e!109089)))

(declare-fun res!79008 () Bool)

(assert (=> b!166296 (=> (not res!79008) (not e!109089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166296 (= res!79008 (validMask!0 (mask!8161 thiss!1248)))))

(declare-fun lt!83125 () Unit!5032)

(assert (=> b!166296 (= lt!83125 e!109096)))

(declare-fun c!30188 () Bool)

(declare-datatypes ((tuple2!3090 0))(
  ( (tuple2!3091 (_1!1556 (_ BitVec 64)) (_2!1556 V!4657)) )
))
(declare-datatypes ((List!2093 0))(
  ( (Nil!2090) (Cons!2089 (h!2706 tuple2!3090) (t!6886 List!2093)) )
))
(declare-datatypes ((ListLongMap!2033 0))(
  ( (ListLongMap!2034 (toList!1032 List!2093)) )
))
(declare-fun contains!1077 (ListLongMap!2033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!674 (array!6591 array!6593 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 32) Int) ListLongMap!2033)

(assert (=> b!166296 (= c!30188 (contains!1077 (getCurrentListMap!674 (_keys!5255 thiss!1248) (_values!3414 thiss!1248) (mask!8161 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3431 thiss!1248)) key!828))))

(declare-fun b!166297 () Bool)

(declare-fun res!79009 () Bool)

(assert (=> b!166297 (=> (not res!79009) (not e!109094))))

(assert (=> b!166297 (= res!79009 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2013 (array!6591) Bool)

(declare-fun array_inv!2014 (array!6593) Bool)

(assert (=> b!166298 (= e!109092 (and tp!14465 tp_is_empty!3757 (array_inv!2013 (_keys!5255 thiss!1248)) (array_inv!2014 (_values!3414 thiss!1248)) e!109090))))

(declare-fun mapIsEmpty!6354 () Bool)

(assert (=> mapIsEmpty!6354 mapRes!6354))

(declare-fun b!166299 () Bool)

(assert (=> b!166299 (= e!109097 tp_is_empty!3757)))

(assert (= (and start!16654 res!79006) b!166297))

(assert (= (and b!166297 res!79009) b!166290))

(assert (= (and b!166290 res!79004) b!166296))

(assert (= (and b!166296 c!30188) b!166291))

(assert (= (and b!166296 (not c!30188)) b!166294))

(assert (= (and b!166291 res!79007) b!166287))

(assert (= (and b!166296 res!79008) b!166292))

(assert (= (and b!166292 res!79003) b!166295))

(assert (= (and b!166295 res!79005) b!166288))

(assert (= (and b!166293 condMapEmpty!6354) mapIsEmpty!6354))

(assert (= (and b!166293 (not condMapEmpty!6354)) mapNonEmpty!6354))

(assert (= (and mapNonEmpty!6354 ((_ is ValueCellFull!1535) mapValue!6354)) b!166289))

(assert (= (and b!166293 ((_ is ValueCellFull!1535) mapDefault!6354)) b!166299))

(assert (= b!166298 b!166293))

(assert (= start!16654 b!166298))

(declare-fun m!195259 () Bool)

(assert (=> b!166291 m!195259))

(declare-fun m!195261 () Bool)

(assert (=> b!166291 m!195261))

(declare-fun m!195263 () Bool)

(assert (=> b!166287 m!195263))

(declare-fun m!195265 () Bool)

(assert (=> b!166298 m!195265))

(declare-fun m!195267 () Bool)

(assert (=> b!166298 m!195267))

(declare-fun m!195269 () Bool)

(assert (=> mapNonEmpty!6354 m!195269))

(declare-fun m!195271 () Bool)

(assert (=> b!166290 m!195271))

(declare-fun m!195273 () Bool)

(assert (=> b!166296 m!195273))

(declare-fun m!195275 () Bool)

(assert (=> b!166296 m!195275))

(assert (=> b!166296 m!195275))

(declare-fun m!195277 () Bool)

(assert (=> b!166296 m!195277))

(declare-fun m!195279 () Bool)

(assert (=> start!16654 m!195279))

(declare-fun m!195281 () Bool)

(assert (=> b!166288 m!195281))

(declare-fun m!195283 () Bool)

(assert (=> b!166295 m!195283))

(declare-fun m!195285 () Bool)

(assert (=> b!166294 m!195285))

(check-sat (not b!166295) (not mapNonEmpty!6354) (not b!166288) (not b!166294) (not b!166290) tp_is_empty!3757 (not start!16654) b_and!10343 (not b!166296) (not b!166298) (not b_next!3955) (not b!166291))
(check-sat b_and!10343 (not b_next!3955))
