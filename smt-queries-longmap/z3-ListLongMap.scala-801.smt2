; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19258 () Bool)

(assert start!19258)

(declare-fun b!189261 () Bool)

(declare-fun b_free!4645 () Bool)

(declare-fun b_next!4645 () Bool)

(assert (=> b!189261 (= b_free!4645 (not b_next!4645))))

(declare-fun tp!16768 () Bool)

(declare-fun b_and!11257 () Bool)

(assert (=> b!189261 (= tp!16768 b_and!11257)))

(declare-fun res!89460 () Bool)

(declare-fun e!124535 () Bool)

(assert (=> start!19258 (=> (not res!89460) (not e!124535))))

(declare-datatypes ((V!5537 0))(
  ( (V!5538 (val!2253 Int)) )
))
(declare-datatypes ((ValueCell!1865 0))(
  ( (ValueCellFull!1865 (v!4168 V!5537)) (EmptyCell!1865) )
))
(declare-datatypes ((array!8043 0))(
  ( (array!8044 (arr!3790 (Array (_ BitVec 32) (_ BitVec 64))) (size!4111 (_ BitVec 32))) )
))
(declare-datatypes ((array!8045 0))(
  ( (array!8046 (arr!3791 (Array (_ BitVec 32) ValueCell!1865)) (size!4112 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2638 0))(
  ( (LongMapFixedSize!2639 (defaultEntry!3863 Int) (mask!9049 (_ BitVec 32)) (extraKeys!3600 (_ BitVec 32)) (zeroValue!3704 V!5537) (minValue!3704 V!5537) (_size!1368 (_ BitVec 32)) (_keys!5829 array!8043) (_values!3846 array!8045) (_vacant!1368 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2638)

(declare-fun valid!1104 (LongMapFixedSize!2638) Bool)

(assert (=> start!19258 (= res!89460 (valid!1104 thiss!1248))))

(assert (=> start!19258 e!124535))

(declare-fun e!124540 () Bool)

(assert (=> start!19258 e!124540))

(assert (=> start!19258 true))

(declare-fun mapNonEmpty!7621 () Bool)

(declare-fun mapRes!7621 () Bool)

(declare-fun tp!16767 () Bool)

(declare-fun e!124539 () Bool)

(assert (=> mapNonEmpty!7621 (= mapRes!7621 (and tp!16767 e!124539))))

(declare-fun mapValue!7621 () ValueCell!1865)

(declare-fun mapKey!7621 () (_ BitVec 32))

(declare-fun mapRest!7621 () (Array (_ BitVec 32) ValueCell!1865))

(assert (=> mapNonEmpty!7621 (= (arr!3791 (_values!3846 thiss!1248)) (store mapRest!7621 mapKey!7621 mapValue!7621))))

(declare-fun b!189254 () Bool)

(declare-fun res!89456 () Bool)

(declare-fun e!124537 () Bool)

(assert (=> b!189254 (=> (not res!89456) (not e!124537))))

(declare-datatypes ((SeekEntryResult!667 0))(
  ( (MissingZero!667 (index!4838 (_ BitVec 32))) (Found!667 (index!4839 (_ BitVec 32))) (Intermediate!667 (undefined!1479 Bool) (index!4840 (_ BitVec 32)) (x!20424 (_ BitVec 32))) (Undefined!667) (MissingVacant!667 (index!4841 (_ BitVec 32))) )
))
(declare-fun lt!93567 () SeekEntryResult!667)

(assert (=> b!189254 (= res!89456 (and (bvsge (index!4839 lt!93567) #b00000000000000000000000000000000) (bvslt (index!4839 lt!93567) (size!4111 (_keys!5829 thiss!1248)))))))

(declare-fun b!189255 () Bool)

(declare-fun tp_is_empty!4417 () Bool)

(assert (=> b!189255 (= e!124539 tp_is_empty!4417)))

(declare-fun b!189256 () Bool)

(declare-fun e!124536 () Bool)

(declare-fun e!124534 () Bool)

(assert (=> b!189256 (= e!124536 (and e!124534 mapRes!7621))))

(declare-fun condMapEmpty!7621 () Bool)

(declare-fun mapDefault!7621 () ValueCell!1865)

(assert (=> b!189256 (= condMapEmpty!7621 (= (arr!3791 (_values!3846 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1865)) mapDefault!7621)))))

(declare-fun b!189257 () Bool)

(declare-fun e!124532 () Bool)

(assert (=> b!189257 (= e!124532 e!124537)))

(declare-fun res!89459 () Bool)

(assert (=> b!189257 (=> (not res!89459) (not e!124537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189257 (= res!89459 (validMask!0 (mask!9049 thiss!1248)))))

(declare-datatypes ((Unit!5670 0))(
  ( (Unit!5671) )
))
(declare-fun lt!93565 () Unit!5670)

(declare-fun e!124538 () Unit!5670)

(assert (=> b!189257 (= lt!93565 e!124538)))

(declare-fun c!34014 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3460 0))(
  ( (tuple2!3461 (_1!1741 (_ BitVec 64)) (_2!1741 V!5537)) )
))
(declare-datatypes ((List!2387 0))(
  ( (Nil!2384) (Cons!2383 (h!3020 tuple2!3460) (t!7282 List!2387)) )
))
(declare-datatypes ((ListLongMap!2369 0))(
  ( (ListLongMap!2370 (toList!1200 List!2387)) )
))
(declare-fun contains!1313 (ListLongMap!2369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!833 (array!8043 array!8045 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 32) Int) ListLongMap!2369)

(assert (=> b!189257 (= c!34014 (contains!1313 (getCurrentListMap!833 (_keys!5829 thiss!1248) (_values!3846 thiss!1248) (mask!9049 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3863 thiss!1248)) key!828))))

(declare-fun b!189258 () Bool)

(declare-fun res!89464 () Bool)

(assert (=> b!189258 (=> (not res!89464) (not e!124537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8043 (_ BitVec 32)) Bool)

(assert (=> b!189258 (= res!89464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5829 thiss!1248) (mask!9049 thiss!1248)))))

(declare-fun b!189259 () Bool)

(declare-fun res!89458 () Bool)

(assert (=> b!189259 (=> (not res!89458) (not e!124535))))

(assert (=> b!189259 (= res!89458 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189260 () Bool)

(declare-fun e!124533 () Bool)

(assert (=> b!189260 (= e!124533 (= (select (arr!3790 (_keys!5829 thiss!1248)) (index!4839 lt!93567)) key!828))))

(declare-fun array_inv!2455 (array!8043) Bool)

(declare-fun array_inv!2456 (array!8045) Bool)

(assert (=> b!189261 (= e!124540 (and tp!16768 tp_is_empty!4417 (array_inv!2455 (_keys!5829 thiss!1248)) (array_inv!2456 (_values!3846 thiss!1248)) e!124536))))

(declare-fun b!189262 () Bool)

(assert (=> b!189262 (= e!124535 e!124532)))

(declare-fun res!89463 () Bool)

(assert (=> b!189262 (=> (not res!89463) (not e!124532))))

(get-info :version)

(assert (=> b!189262 (= res!89463 (and (not ((_ is Undefined!667) lt!93567)) (not ((_ is MissingVacant!667) lt!93567)) (not ((_ is MissingZero!667) lt!93567)) ((_ is Found!667) lt!93567)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8043 (_ BitVec 32)) SeekEntryResult!667)

(assert (=> b!189262 (= lt!93567 (seekEntryOrOpen!0 key!828 (_keys!5829 thiss!1248) (mask!9049 thiss!1248)))))

(declare-fun b!189263 () Bool)

(declare-fun res!89462 () Bool)

(assert (=> b!189263 (=> (not res!89462) (not e!124537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189263 (= res!89462 (validKeyInArray!0 key!828))))

(declare-fun b!189264 () Bool)

(assert (=> b!189264 (= e!124537 (not (= (select (arr!3790 (_keys!5829 thiss!1248)) (index!4839 lt!93567)) key!828)))))

(declare-fun b!189265 () Bool)

(declare-fun Unit!5672 () Unit!5670)

(assert (=> b!189265 (= e!124538 Unit!5672)))

(declare-fun lt!93568 () Unit!5670)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!158 (array!8043 array!8045 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 64) Int) Unit!5670)

(assert (=> b!189265 (= lt!93568 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!158 (_keys!5829 thiss!1248) (_values!3846 thiss!1248) (mask!9049 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) key!828 (defaultEntry!3863 thiss!1248)))))

(assert (=> b!189265 false))

(declare-fun mapIsEmpty!7621 () Bool)

(assert (=> mapIsEmpty!7621 mapRes!7621))

(declare-fun b!189266 () Bool)

(declare-fun lt!93566 () Unit!5670)

(assert (=> b!189266 (= e!124538 lt!93566)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!160 (array!8043 array!8045 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 64) Int) Unit!5670)

(assert (=> b!189266 (= lt!93566 (lemmaInListMapThenSeekEntryOrOpenFindsIt!160 (_keys!5829 thiss!1248) (_values!3846 thiss!1248) (mask!9049 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) key!828 (defaultEntry!3863 thiss!1248)))))

(declare-fun res!89461 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189266 (= res!89461 (inRange!0 (index!4839 lt!93567) (mask!9049 thiss!1248)))))

(assert (=> b!189266 (=> (not res!89461) (not e!124533))))

(assert (=> b!189266 e!124533))

(declare-fun b!189267 () Bool)

(declare-fun res!89457 () Bool)

(assert (=> b!189267 (=> (not res!89457) (not e!124537))))

(assert (=> b!189267 (= res!89457 (and (= (size!4112 (_values!3846 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9049 thiss!1248))) (= (size!4111 (_keys!5829 thiss!1248)) (size!4112 (_values!3846 thiss!1248))) (bvsge (mask!9049 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3600 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3600 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!189268 () Bool)

(assert (=> b!189268 (= e!124534 tp_is_empty!4417)))

(declare-fun b!189269 () Bool)

(declare-fun res!89465 () Bool)

(assert (=> b!189269 (=> (not res!89465) (not e!124537))))

(declare-datatypes ((List!2388 0))(
  ( (Nil!2385) (Cons!2384 (h!3021 (_ BitVec 64)) (t!7283 List!2388)) )
))
(declare-fun arrayNoDuplicates!0 (array!8043 (_ BitVec 32) List!2388) Bool)

(assert (=> b!189269 (= res!89465 (arrayNoDuplicates!0 (_keys!5829 thiss!1248) #b00000000000000000000000000000000 Nil!2385))))

(assert (= (and start!19258 res!89460) b!189259))

(assert (= (and b!189259 res!89458) b!189262))

(assert (= (and b!189262 res!89463) b!189257))

(assert (= (and b!189257 c!34014) b!189266))

(assert (= (and b!189257 (not c!34014)) b!189265))

(assert (= (and b!189266 res!89461) b!189260))

(assert (= (and b!189257 res!89459) b!189267))

(assert (= (and b!189267 res!89457) b!189258))

(assert (= (and b!189258 res!89464) b!189269))

(assert (= (and b!189269 res!89465) b!189254))

(assert (= (and b!189254 res!89456) b!189263))

(assert (= (and b!189263 res!89462) b!189264))

(assert (= (and b!189256 condMapEmpty!7621) mapIsEmpty!7621))

(assert (= (and b!189256 (not condMapEmpty!7621)) mapNonEmpty!7621))

(assert (= (and mapNonEmpty!7621 ((_ is ValueCellFull!1865) mapValue!7621)) b!189255))

(assert (= (and b!189256 ((_ is ValueCellFull!1865) mapDefault!7621)) b!189268))

(assert (= b!189261 b!189256))

(assert (= start!19258 b!189261))

(declare-fun m!215135 () Bool)

(assert (=> b!189265 m!215135))

(declare-fun m!215137 () Bool)

(assert (=> b!189261 m!215137))

(declare-fun m!215139 () Bool)

(assert (=> b!189261 m!215139))

(declare-fun m!215141 () Bool)

(assert (=> mapNonEmpty!7621 m!215141))

(declare-fun m!215143 () Bool)

(assert (=> b!189257 m!215143))

(declare-fun m!215145 () Bool)

(assert (=> b!189257 m!215145))

(assert (=> b!189257 m!215145))

(declare-fun m!215147 () Bool)

(assert (=> b!189257 m!215147))

(declare-fun m!215149 () Bool)

(assert (=> b!189258 m!215149))

(declare-fun m!215151 () Bool)

(assert (=> b!189266 m!215151))

(declare-fun m!215153 () Bool)

(assert (=> b!189266 m!215153))

(declare-fun m!215155 () Bool)

(assert (=> b!189260 m!215155))

(declare-fun m!215157 () Bool)

(assert (=> b!189269 m!215157))

(declare-fun m!215159 () Bool)

(assert (=> b!189263 m!215159))

(declare-fun m!215161 () Bool)

(assert (=> start!19258 m!215161))

(assert (=> b!189264 m!215155))

(declare-fun m!215163 () Bool)

(assert (=> b!189262 m!215163))

(check-sat (not b!189269) (not start!19258) (not b!189257) (not mapNonEmpty!7621) (not b!189263) b_and!11257 (not b!189266) (not b_next!4645) (not b!189261) (not b!189258) (not b!189265) tp_is_empty!4417 (not b!189262))
(check-sat b_and!11257 (not b_next!4645))
