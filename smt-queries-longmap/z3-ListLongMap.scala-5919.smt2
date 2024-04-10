; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76806 () Bool)

(assert start!76806)

(declare-fun b!898464 () Bool)

(declare-fun b_free!16017 () Bool)

(declare-fun b_next!16017 () Bool)

(assert (=> b!898464 (= b_free!16017 (not b_next!16017))))

(declare-fun tp!56119 () Bool)

(declare-fun b_and!26311 () Bool)

(assert (=> b!898464 (= tp!56119 b_and!26311)))

(declare-fun b!898459 () Bool)

(declare-fun res!607163 () Bool)

(declare-fun e!502600 () Bool)

(assert (=> b!898459 (=> (not res!607163) (not e!502600))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898459 (= res!607163 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898460 () Bool)

(declare-fun e!502595 () Bool)

(declare-datatypes ((array!52728 0))(
  ( (array!52729 (arr!25341 (Array (_ BitVec 32) (_ BitVec 64))) (size!25796 (_ BitVec 32))) )
))
(declare-datatypes ((V!29425 0))(
  ( (V!29426 (val!9223 Int)) )
))
(declare-datatypes ((ValueCell!8691 0))(
  ( (ValueCellFull!8691 (v!11714 V!29425)) (EmptyCell!8691) )
))
(declare-datatypes ((array!52730 0))(
  ( (array!52731 (arr!25342 (Array (_ BitVec 32) ValueCell!8691)) (size!25797 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4398 0))(
  ( (LongMapFixedSize!4399 (defaultEntry!5413 Int) (mask!26143 (_ BitVec 32)) (extraKeys!5129 (_ BitVec 32)) (zeroValue!5233 V!29425) (minValue!5233 V!29425) (_size!2254 (_ BitVec 32)) (_keys!10188 array!52728) (_values!5420 array!52730) (_vacant!2254 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4398)

(assert (=> b!898460 (= e!502595 (= (size!25797 (_values!5420 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26143 thiss!1181))))))

(declare-fun b!898461 () Bool)

(declare-fun e!502597 () Bool)

(assert (=> b!898461 (= e!502600 (not e!502597))))

(declare-fun res!607165 () Bool)

(assert (=> b!898461 (=> res!607165 e!502597)))

(declare-datatypes ((SeekEntryResult!8926 0))(
  ( (MissingZero!8926 (index!38075 (_ BitVec 32))) (Found!8926 (index!38076 (_ BitVec 32))) (Intermediate!8926 (undefined!9738 Bool) (index!38077 (_ BitVec 32)) (x!76573 (_ BitVec 32))) (Undefined!8926) (MissingVacant!8926 (index!38078 (_ BitVec 32))) )
))
(declare-fun lt!405607 () SeekEntryResult!8926)

(get-info :version)

(assert (=> b!898461 (= res!607165 (not ((_ is Found!8926) lt!405607)))))

(declare-fun e!502598 () Bool)

(assert (=> b!898461 e!502598))

(declare-fun res!607167 () Bool)

(assert (=> b!898461 (=> res!607167 e!502598)))

(assert (=> b!898461 (= res!607167 (not ((_ is Found!8926) lt!405607)))))

(declare-datatypes ((Unit!30538 0))(
  ( (Unit!30539) )
))
(declare-fun lt!405606 () Unit!30538)

(declare-fun lemmaSeekEntryGivesInRangeIndex!91 (array!52728 array!52730 (_ BitVec 32) (_ BitVec 32) V!29425 V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> b!898461 (= lt!405606 (lemmaSeekEntryGivesInRangeIndex!91 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52728 (_ BitVec 32)) SeekEntryResult!8926)

(assert (=> b!898461 (= lt!405607 (seekEntry!0 key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun res!607166 () Bool)

(assert (=> start!76806 (=> (not res!607166) (not e!502600))))

(declare-fun valid!1691 (LongMapFixedSize!4398) Bool)

(assert (=> start!76806 (= res!607166 (valid!1691 thiss!1181))))

(assert (=> start!76806 e!502600))

(declare-fun e!502593 () Bool)

(assert (=> start!76806 e!502593))

(assert (=> start!76806 true))

(declare-fun b!898462 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898462 (= e!502598 (inRange!0 (index!38076 lt!405607) (mask!26143 thiss!1181)))))

(declare-fun b!898463 () Bool)

(declare-fun e!502601 () Bool)

(declare-fun e!502599 () Bool)

(declare-fun mapRes!29172 () Bool)

(assert (=> b!898463 (= e!502601 (and e!502599 mapRes!29172))))

(declare-fun condMapEmpty!29172 () Bool)

(declare-fun mapDefault!29172 () ValueCell!8691)

(assert (=> b!898463 (= condMapEmpty!29172 (= (arr!25342 (_values!5420 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8691)) mapDefault!29172)))))

(declare-fun tp_is_empty!18345 () Bool)

(declare-fun array_inv!19888 (array!52728) Bool)

(declare-fun array_inv!19889 (array!52730) Bool)

(assert (=> b!898464 (= e!502593 (and tp!56119 tp_is_empty!18345 (array_inv!19888 (_keys!10188 thiss!1181)) (array_inv!19889 (_values!5420 thiss!1181)) e!502601))))

(declare-fun b!898465 () Bool)

(assert (=> b!898465 (= e!502599 tp_is_empty!18345)))

(declare-fun b!898466 () Bool)

(assert (=> b!898466 (= e!502597 e!502595)))

(declare-fun res!607164 () Bool)

(assert (=> b!898466 (=> res!607164 e!502595)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898466 (= res!607164 (not (validMask!0 (mask!26143 thiss!1181))))))

(declare-datatypes ((tuple2!12034 0))(
  ( (tuple2!12035 (_1!6028 (_ BitVec 64)) (_2!6028 V!29425)) )
))
(declare-datatypes ((List!17840 0))(
  ( (Nil!17837) (Cons!17836 (h!18978 tuple2!12034) (t!25181 List!17840)) )
))
(declare-datatypes ((ListLongMap!10731 0))(
  ( (ListLongMap!10732 (toList!5381 List!17840)) )
))
(declare-fun contains!4410 (ListLongMap!10731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2655 (array!52728 array!52730 (_ BitVec 32) (_ BitVec 32) V!29425 V!29425 (_ BitVec 32) Int) ListLongMap!10731)

(assert (=> b!898466 (contains!4410 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))))

(declare-fun lt!405605 () Unit!30538)

(declare-fun lemmaValidKeyInArrayIsInListMap!244 (array!52728 array!52730 (_ BitVec 32) (_ BitVec 32) V!29425 V!29425 (_ BitVec 32) Int) Unit!30538)

(assert (=> b!898466 (= lt!405605 (lemmaValidKeyInArrayIsInListMap!244 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) (index!38076 lt!405607) (defaultEntry!5413 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898466 (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405604 () Unit!30538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52728 (_ BitVec 64) (_ BitVec 32)) Unit!30538)

(assert (=> b!898466 (= lt!405604 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10188 thiss!1181) key!785 (index!38076 lt!405607)))))

(declare-fun mapNonEmpty!29172 () Bool)

(declare-fun tp!56120 () Bool)

(declare-fun e!502596 () Bool)

(assert (=> mapNonEmpty!29172 (= mapRes!29172 (and tp!56120 e!502596))))

(declare-fun mapValue!29172 () ValueCell!8691)

(declare-fun mapKey!29172 () (_ BitVec 32))

(declare-fun mapRest!29172 () (Array (_ BitVec 32) ValueCell!8691))

(assert (=> mapNonEmpty!29172 (= (arr!25342 (_values!5420 thiss!1181)) (store mapRest!29172 mapKey!29172 mapValue!29172))))

(declare-fun mapIsEmpty!29172 () Bool)

(assert (=> mapIsEmpty!29172 mapRes!29172))

(declare-fun b!898467 () Bool)

(assert (=> b!898467 (= e!502596 tp_is_empty!18345)))

(assert (= (and start!76806 res!607166) b!898459))

(assert (= (and b!898459 res!607163) b!898461))

(assert (= (and b!898461 (not res!607167)) b!898462))

(assert (= (and b!898461 (not res!607165)) b!898466))

(assert (= (and b!898466 (not res!607164)) b!898460))

(assert (= (and b!898463 condMapEmpty!29172) mapIsEmpty!29172))

(assert (= (and b!898463 (not condMapEmpty!29172)) mapNonEmpty!29172))

(assert (= (and mapNonEmpty!29172 ((_ is ValueCellFull!8691) mapValue!29172)) b!898467))

(assert (= (and b!898463 ((_ is ValueCellFull!8691) mapDefault!29172)) b!898465))

(assert (= b!898464 b!898463))

(assert (= start!76806 b!898464))

(declare-fun m!834957 () Bool)

(assert (=> start!76806 m!834957))

(declare-fun m!834959 () Bool)

(assert (=> b!898462 m!834959))

(declare-fun m!834961 () Bool)

(assert (=> b!898461 m!834961))

(declare-fun m!834963 () Bool)

(assert (=> b!898461 m!834963))

(declare-fun m!834965 () Bool)

(assert (=> b!898466 m!834965))

(declare-fun m!834967 () Bool)

(assert (=> b!898466 m!834967))

(declare-fun m!834969 () Bool)

(assert (=> b!898466 m!834969))

(assert (=> b!898466 m!834969))

(declare-fun m!834971 () Bool)

(assert (=> b!898466 m!834971))

(declare-fun m!834973 () Bool)

(assert (=> b!898466 m!834973))

(declare-fun m!834975 () Bool)

(assert (=> b!898466 m!834975))

(assert (=> b!898466 m!834971))

(declare-fun m!834977 () Bool)

(assert (=> b!898466 m!834977))

(declare-fun m!834979 () Bool)

(assert (=> mapNonEmpty!29172 m!834979))

(declare-fun m!834981 () Bool)

(assert (=> b!898464 m!834981))

(declare-fun m!834983 () Bool)

(assert (=> b!898464 m!834983))

(check-sat b_and!26311 (not b!898462) (not b!898466) (not start!76806) (not mapNonEmpty!29172) (not b!898464) (not b!898461) tp_is_empty!18345 (not b_next!16017))
(check-sat b_and!26311 (not b_next!16017))
(get-model)

(declare-fun d!111239 () Bool)

(assert (=> d!111239 (= (array_inv!19888 (_keys!10188 thiss!1181)) (bvsge (size!25796 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898464 d!111239))

(declare-fun d!111241 () Bool)

(assert (=> d!111241 (= (array_inv!19889 (_values!5420 thiss!1181)) (bvsge (size!25797 (_values!5420 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898464 d!111241))

(declare-fun d!111243 () Bool)

(declare-fun e!502631 () Bool)

(assert (=> d!111243 e!502631))

(declare-fun res!607185 () Bool)

(assert (=> d!111243 (=> res!607185 e!502631)))

(declare-fun lt!405625 () SeekEntryResult!8926)

(assert (=> d!111243 (= res!607185 (not ((_ is Found!8926) lt!405625)))))

(assert (=> d!111243 (= lt!405625 (seekEntry!0 key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun lt!405624 () Unit!30538)

(declare-fun choose!1490 (array!52728 array!52730 (_ BitVec 32) (_ BitVec 32) V!29425 V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> d!111243 (= lt!405624 (choose!1490 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) key!785))))

(assert (=> d!111243 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111243 (= (lemmaSeekEntryGivesInRangeIndex!91 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) key!785) lt!405624)))

(declare-fun b!898497 () Bool)

(assert (=> b!898497 (= e!502631 (inRange!0 (index!38076 lt!405625) (mask!26143 thiss!1181)))))

(assert (= (and d!111243 (not res!607185)) b!898497))

(assert (=> d!111243 m!834963))

(declare-fun m!835013 () Bool)

(assert (=> d!111243 m!835013))

(assert (=> d!111243 m!834967))

(declare-fun m!835015 () Bool)

(assert (=> b!898497 m!835015))

(assert (=> b!898461 d!111243))

(declare-fun b!898510 () Bool)

(declare-fun c!94951 () Bool)

(declare-fun lt!405634 () (_ BitVec 64))

(assert (=> b!898510 (= c!94951 (= lt!405634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502640 () SeekEntryResult!8926)

(declare-fun e!502639 () SeekEntryResult!8926)

(assert (=> b!898510 (= e!502640 e!502639)))

(declare-fun b!898511 () Bool)

(declare-fun e!502638 () SeekEntryResult!8926)

(assert (=> b!898511 (= e!502638 e!502640)))

(declare-fun lt!405635 () SeekEntryResult!8926)

(assert (=> b!898511 (= lt!405634 (select (arr!25341 (_keys!10188 thiss!1181)) (index!38077 lt!405635)))))

(declare-fun c!94950 () Bool)

(assert (=> b!898511 (= c!94950 (= lt!405634 key!785))))

(declare-fun b!898512 () Bool)

(assert (=> b!898512 (= e!502640 (Found!8926 (index!38077 lt!405635)))))

(declare-fun b!898513 () Bool)

(assert (=> b!898513 (= e!502638 Undefined!8926)))

(declare-fun b!898514 () Bool)

(declare-fun lt!405636 () SeekEntryResult!8926)

(assert (=> b!898514 (= e!502639 (ite ((_ is MissingVacant!8926) lt!405636) (MissingZero!8926 (index!38078 lt!405636)) lt!405636))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52728 (_ BitVec 32)) SeekEntryResult!8926)

(assert (=> b!898514 (= lt!405636 (seekKeyOrZeroReturnVacant!0 (x!76573 lt!405635) (index!38077 lt!405635) (index!38077 lt!405635) key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun d!111245 () Bool)

(declare-fun lt!405637 () SeekEntryResult!8926)

(assert (=> d!111245 (and (or ((_ is MissingVacant!8926) lt!405637) (not ((_ is Found!8926) lt!405637)) (and (bvsge (index!38076 lt!405637) #b00000000000000000000000000000000) (bvslt (index!38076 lt!405637) (size!25796 (_keys!10188 thiss!1181))))) (not ((_ is MissingVacant!8926) lt!405637)) (or (not ((_ is Found!8926) lt!405637)) (= (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405637)) key!785)))))

(assert (=> d!111245 (= lt!405637 e!502638)))

(declare-fun c!94952 () Bool)

(assert (=> d!111245 (= c!94952 (and ((_ is Intermediate!8926) lt!405635) (undefined!9738 lt!405635)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52728 (_ BitVec 32)) SeekEntryResult!8926)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111245 (= lt!405635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26143 thiss!1181)) key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(assert (=> d!111245 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111245 (= (seekEntry!0 key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)) lt!405637)))

(declare-fun b!898515 () Bool)

(assert (=> b!898515 (= e!502639 (MissingZero!8926 (index!38077 lt!405635)))))

(assert (= (and d!111245 c!94952) b!898513))

(assert (= (and d!111245 (not c!94952)) b!898511))

(assert (= (and b!898511 c!94950) b!898512))

(assert (= (and b!898511 (not c!94950)) b!898510))

(assert (= (and b!898510 c!94951) b!898515))

(assert (= (and b!898510 (not c!94951)) b!898514))

(declare-fun m!835017 () Bool)

(assert (=> b!898511 m!835017))

(declare-fun m!835019 () Bool)

(assert (=> b!898514 m!835019))

(declare-fun m!835021 () Bool)

(assert (=> d!111245 m!835021))

(declare-fun m!835023 () Bool)

(assert (=> d!111245 m!835023))

(assert (=> d!111245 m!835023))

(declare-fun m!835025 () Bool)

(assert (=> d!111245 m!835025))

(assert (=> d!111245 m!834967))

(assert (=> b!898461 d!111245))

(declare-fun d!111247 () Bool)

(declare-fun e!502645 () Bool)

(assert (=> d!111247 e!502645))

(declare-fun res!607188 () Bool)

(assert (=> d!111247 (=> res!607188 e!502645)))

(declare-fun lt!405649 () Bool)

(assert (=> d!111247 (= res!607188 (not lt!405649))))

(declare-fun lt!405646 () Bool)

(assert (=> d!111247 (= lt!405649 lt!405646)))

(declare-fun lt!405648 () Unit!30538)

(declare-fun e!502646 () Unit!30538)

(assert (=> d!111247 (= lt!405648 e!502646)))

(declare-fun c!94955 () Bool)

(assert (=> d!111247 (= c!94955 lt!405646)))

(declare-fun containsKey!425 (List!17840 (_ BitVec 64)) Bool)

(assert (=> d!111247 (= lt!405646 (containsKey!425 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(assert (=> d!111247 (= (contains!4410 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))) lt!405649)))

(declare-fun b!898522 () Bool)

(declare-fun lt!405647 () Unit!30538)

(assert (=> b!898522 (= e!502646 lt!405647)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!321 (List!17840 (_ BitVec 64)) Unit!30538)

(assert (=> b!898522 (= lt!405647 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(declare-datatypes ((Option!462 0))(
  ( (Some!461 (v!11716 V!29425)) (None!460) )
))
(declare-fun isDefined!330 (Option!462) Bool)

(declare-fun getValueByKey!456 (List!17840 (_ BitVec 64)) Option!462)

(assert (=> b!898522 (isDefined!330 (getValueByKey!456 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(declare-fun b!898523 () Bool)

(declare-fun Unit!30542 () Unit!30538)

(assert (=> b!898523 (= e!502646 Unit!30542)))

(declare-fun b!898524 () Bool)

(assert (=> b!898524 (= e!502645 (isDefined!330 (getValueByKey!456 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))))))

(assert (= (and d!111247 c!94955) b!898522))

(assert (= (and d!111247 (not c!94955)) b!898523))

(assert (= (and d!111247 (not res!607188)) b!898524))

(assert (=> d!111247 m!834971))

(declare-fun m!835027 () Bool)

(assert (=> d!111247 m!835027))

(assert (=> b!898522 m!834971))

(declare-fun m!835029 () Bool)

(assert (=> b!898522 m!835029))

(assert (=> b!898522 m!834971))

(declare-fun m!835031 () Bool)

(assert (=> b!898522 m!835031))

(assert (=> b!898522 m!835031))

(declare-fun m!835033 () Bool)

(assert (=> b!898522 m!835033))

(assert (=> b!898524 m!834971))

(assert (=> b!898524 m!835031))

(assert (=> b!898524 m!835031))

(assert (=> b!898524 m!835033))

(assert (=> b!898466 d!111247))

(declare-fun d!111249 () Bool)

(assert (=> d!111249 (= (validMask!0 (mask!26143 thiss!1181)) (and (or (= (mask!26143 thiss!1181) #b00000000000000000000000000000111) (= (mask!26143 thiss!1181) #b00000000000000000000000000001111) (= (mask!26143 thiss!1181) #b00000000000000000000000000011111) (= (mask!26143 thiss!1181) #b00000000000000000000000000111111) (= (mask!26143 thiss!1181) #b00000000000000000000000001111111) (= (mask!26143 thiss!1181) #b00000000000000000000000011111111) (= (mask!26143 thiss!1181) #b00000000000000000000000111111111) (= (mask!26143 thiss!1181) #b00000000000000000000001111111111) (= (mask!26143 thiss!1181) #b00000000000000000000011111111111) (= (mask!26143 thiss!1181) #b00000000000000000000111111111111) (= (mask!26143 thiss!1181) #b00000000000000000001111111111111) (= (mask!26143 thiss!1181) #b00000000000000000011111111111111) (= (mask!26143 thiss!1181) #b00000000000000000111111111111111) (= (mask!26143 thiss!1181) #b00000000000000001111111111111111) (= (mask!26143 thiss!1181) #b00000000000000011111111111111111) (= (mask!26143 thiss!1181) #b00000000000000111111111111111111) (= (mask!26143 thiss!1181) #b00000000000001111111111111111111) (= (mask!26143 thiss!1181) #b00000000000011111111111111111111) (= (mask!26143 thiss!1181) #b00000000000111111111111111111111) (= (mask!26143 thiss!1181) #b00000000001111111111111111111111) (= (mask!26143 thiss!1181) #b00000000011111111111111111111111) (= (mask!26143 thiss!1181) #b00000000111111111111111111111111) (= (mask!26143 thiss!1181) #b00000001111111111111111111111111) (= (mask!26143 thiss!1181) #b00000011111111111111111111111111) (= (mask!26143 thiss!1181) #b00000111111111111111111111111111) (= (mask!26143 thiss!1181) #b00001111111111111111111111111111) (= (mask!26143 thiss!1181) #b00011111111111111111111111111111) (= (mask!26143 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26143 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898466 d!111249))

(declare-fun d!111251 () Bool)

(declare-fun res!607193 () Bool)

(declare-fun e!502651 () Bool)

(assert (=> d!111251 (=> res!607193 e!502651)))

(assert (=> d!111251 (= res!607193 (= (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111251 (= (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 #b00000000000000000000000000000000) e!502651)))

(declare-fun b!898529 () Bool)

(declare-fun e!502652 () Bool)

(assert (=> b!898529 (= e!502651 e!502652)))

(declare-fun res!607194 () Bool)

(assert (=> b!898529 (=> (not res!607194) (not e!502652))))

(assert (=> b!898529 (= res!607194 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun b!898530 () Bool)

(assert (=> b!898530 (= e!502652 (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111251 (not res!607193)) b!898529))

(assert (= (and b!898529 res!607194) b!898530))

(declare-fun m!835035 () Bool)

(assert (=> d!111251 m!835035))

(declare-fun m!835037 () Bool)

(assert (=> b!898530 m!835037))

(assert (=> b!898466 d!111251))

(declare-fun d!111253 () Bool)

(declare-fun e!502655 () Bool)

(assert (=> d!111253 e!502655))

(declare-fun res!607197 () Bool)

(assert (=> d!111253 (=> (not res!607197) (not e!502655))))

(assert (=> d!111253 (= res!607197 (and (bvsge (index!38076 lt!405607) #b00000000000000000000000000000000) (bvslt (index!38076 lt!405607) (size!25796 (_keys!10188 thiss!1181)))))))

(declare-fun lt!405652 () Unit!30538)

(declare-fun choose!1491 (array!52728 array!52730 (_ BitVec 32) (_ BitVec 32) V!29425 V!29425 (_ BitVec 32) Int) Unit!30538)

(assert (=> d!111253 (= lt!405652 (choose!1491 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) (index!38076 lt!405607) (defaultEntry!5413 thiss!1181)))))

(assert (=> d!111253 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111253 (= (lemmaValidKeyInArrayIsInListMap!244 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) (index!38076 lt!405607) (defaultEntry!5413 thiss!1181)) lt!405652)))

(declare-fun b!898533 () Bool)

(assert (=> b!898533 (= e!502655 (contains!4410 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(assert (= (and d!111253 res!607197) b!898533))

(declare-fun m!835039 () Bool)

(assert (=> d!111253 m!835039))

(assert (=> d!111253 m!834967))

(assert (=> b!898533 m!834969))

(assert (=> b!898533 m!834971))

(assert (=> b!898533 m!834969))

(assert (=> b!898533 m!834971))

(assert (=> b!898533 m!834973))

(assert (=> b!898466 d!111253))

(declare-fun d!111255 () Bool)

(assert (=> d!111255 (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405655 () Unit!30538)

(declare-fun choose!13 (array!52728 (_ BitVec 64) (_ BitVec 32)) Unit!30538)

(assert (=> d!111255 (= lt!405655 (choose!13 (_keys!10188 thiss!1181) key!785 (index!38076 lt!405607)))))

(assert (=> d!111255 (bvsge (index!38076 lt!405607) #b00000000000000000000000000000000)))

(assert (=> d!111255 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10188 thiss!1181) key!785 (index!38076 lt!405607)) lt!405655)))

(declare-fun bs!25214 () Bool)

(assert (= bs!25214 d!111255))

(assert (=> bs!25214 m!834975))

(declare-fun m!835041 () Bool)

(assert (=> bs!25214 m!835041))

(assert (=> b!898466 d!111255))

(declare-fun b!898576 () Bool)

(declare-fun e!502686 () Bool)

(declare-fun e!502684 () Bool)

(assert (=> b!898576 (= e!502686 e!502684)))

(declare-fun res!607221 () Bool)

(declare-fun call!39871 () Bool)

(assert (=> b!898576 (= res!607221 call!39871)))

(assert (=> b!898576 (=> (not res!607221) (not e!502684))))

(declare-fun b!898577 () Bool)

(declare-fun e!502691 () ListLongMap!10731)

(declare-fun call!39877 () ListLongMap!10731)

(assert (=> b!898577 (= e!502691 call!39877)))

(declare-fun bm!39868 () Bool)

(declare-fun call!39876 () ListLongMap!10731)

(declare-fun call!39873 () ListLongMap!10731)

(assert (=> bm!39868 (= call!39876 call!39873)))

(declare-fun bm!39869 () Bool)

(declare-fun lt!405718 () ListLongMap!10731)

(assert (=> bm!39869 (= call!39871 (contains!4410 lt!405718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898578 () Bool)

(declare-fun e!502685 () Bool)

(declare-fun call!39875 () Bool)

(assert (=> b!898578 (= e!502685 (not call!39875))))

(declare-fun b!898579 () Bool)

(declare-fun e!502690 () Unit!30538)

(declare-fun Unit!30543 () Unit!30538)

(assert (=> b!898579 (= e!502690 Unit!30543)))

(declare-fun b!898580 () Bool)

(declare-fun e!502687 () Bool)

(assert (=> b!898580 (= e!502687 e!502685)))

(declare-fun c!94969 () Bool)

(assert (=> b!898580 (= c!94969 (not (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!111257 () Bool)

(assert (=> d!111257 e!502687))

(declare-fun res!607222 () Bool)

(assert (=> d!111257 (=> (not res!607222) (not e!502687))))

(assert (=> d!111257 (= res!607222 (or (bvsge #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))))

(declare-fun lt!405705 () ListLongMap!10731)

(assert (=> d!111257 (= lt!405718 lt!405705)))

(declare-fun lt!405720 () Unit!30538)

(assert (=> d!111257 (= lt!405720 e!502690)))

(declare-fun c!94970 () Bool)

(declare-fun e!502692 () Bool)

(assert (=> d!111257 (= c!94970 e!502692)))

(declare-fun res!607224 () Bool)

(assert (=> d!111257 (=> (not res!607224) (not e!502692))))

(assert (=> d!111257 (= res!607224 (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun e!502688 () ListLongMap!10731)

(assert (=> d!111257 (= lt!405705 e!502688)))

(declare-fun c!94971 () Bool)

(assert (=> d!111257 (= c!94971 (and (not (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111257 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111257 (= (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)) lt!405718)))

(declare-fun b!898581 () Bool)

(declare-fun e!502694 () Bool)

(declare-fun e!502682 () Bool)

(assert (=> b!898581 (= e!502694 e!502682)))

(declare-fun res!607220 () Bool)

(assert (=> b!898581 (=> (not res!607220) (not e!502682))))

(assert (=> b!898581 (= res!607220 (contains!4410 lt!405718 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun b!898582 () Bool)

(declare-fun lt!405710 () Unit!30538)

(assert (=> b!898582 (= e!502690 lt!405710)))

(declare-fun lt!405708 () ListLongMap!10731)

(declare-fun getCurrentListMapNoExtraKeys!3278 (array!52728 array!52730 (_ BitVec 32) (_ BitVec 32) V!29425 V!29425 (_ BitVec 32) Int) ListLongMap!10731)

(assert (=> b!898582 (= lt!405708 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))

(declare-fun lt!405713 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405713 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405714 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405714 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405717 () Unit!30538)

(declare-fun addStillContains!332 (ListLongMap!10731 (_ BitVec 64) V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> b!898582 (= lt!405717 (addStillContains!332 lt!405708 lt!405713 (zeroValue!5233 thiss!1181) lt!405714))))

(declare-fun +!2591 (ListLongMap!10731 tuple2!12034) ListLongMap!10731)

(assert (=> b!898582 (contains!4410 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))) lt!405714)))

(declare-fun lt!405700 () Unit!30538)

(assert (=> b!898582 (= lt!405700 lt!405717)))

(declare-fun lt!405706 () ListLongMap!10731)

(assert (=> b!898582 (= lt!405706 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))

(declare-fun lt!405704 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405704 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405703 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405703 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405712 () Unit!30538)

(declare-fun addApplyDifferent!332 (ListLongMap!10731 (_ BitVec 64) V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> b!898582 (= lt!405712 (addApplyDifferent!332 lt!405706 lt!405704 (minValue!5233 thiss!1181) lt!405703))))

(declare-fun apply!410 (ListLongMap!10731 (_ BitVec 64)) V!29425)

(assert (=> b!898582 (= (apply!410 (+!2591 lt!405706 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))) lt!405703) (apply!410 lt!405706 lt!405703))))

(declare-fun lt!405711 () Unit!30538)

(assert (=> b!898582 (= lt!405711 lt!405712)))

(declare-fun lt!405715 () ListLongMap!10731)

(assert (=> b!898582 (= lt!405715 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))

(declare-fun lt!405707 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405719 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405719 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405701 () Unit!30538)

(assert (=> b!898582 (= lt!405701 (addApplyDifferent!332 lt!405715 lt!405707 (zeroValue!5233 thiss!1181) lt!405719))))

(assert (=> b!898582 (= (apply!410 (+!2591 lt!405715 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))) lt!405719) (apply!410 lt!405715 lt!405719))))

(declare-fun lt!405721 () Unit!30538)

(assert (=> b!898582 (= lt!405721 lt!405701)))

(declare-fun lt!405709 () ListLongMap!10731)

(assert (=> b!898582 (= lt!405709 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))

(declare-fun lt!405702 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405702 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405716 () (_ BitVec 64))

(assert (=> b!898582 (= lt!405716 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898582 (= lt!405710 (addApplyDifferent!332 lt!405709 lt!405702 (minValue!5233 thiss!1181) lt!405716))))

(assert (=> b!898582 (= (apply!410 (+!2591 lt!405709 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))) lt!405716) (apply!410 lt!405709 lt!405716))))

(declare-fun b!898583 () Bool)

(declare-fun c!94968 () Bool)

(assert (=> b!898583 (= c!94968 (and (not (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!502689 () ListLongMap!10731)

(assert (=> b!898583 (= e!502689 e!502691)))

(declare-fun b!898584 () Bool)

(declare-fun res!607223 () Bool)

(assert (=> b!898584 (=> (not res!607223) (not e!502687))))

(assert (=> b!898584 (= res!607223 e!502686)))

(declare-fun c!94973 () Bool)

(assert (=> b!898584 (= c!94973 (not (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39870 () Bool)

(declare-fun call!39874 () ListLongMap!10731)

(declare-fun call!39872 () ListLongMap!10731)

(assert (=> bm!39870 (= call!39874 call!39872)))

(declare-fun bm!39871 () Bool)

(assert (=> bm!39871 (= call!39877 call!39874)))

(declare-fun bm!39872 () Bool)

(assert (=> bm!39872 (= call!39875 (contains!4410 lt!405718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898585 () Bool)

(assert (=> b!898585 (= e!502691 call!39876)))

(declare-fun b!898586 () Bool)

(assert (=> b!898586 (= e!502689 call!39876)))

(declare-fun bm!39873 () Bool)

(assert (=> bm!39873 (= call!39872 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))

(declare-fun b!898587 () Bool)

(assert (=> b!898587 (= e!502686 (not call!39871))))

(declare-fun b!898588 () Bool)

(assert (=> b!898588 (= e!502684 (= (apply!410 lt!405718 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5233 thiss!1181)))))

(declare-fun c!94972 () Bool)

(declare-fun bm!39874 () Bool)

(assert (=> bm!39874 (= call!39873 (+!2591 (ite c!94971 call!39872 (ite c!94972 call!39874 call!39877)) (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))

(declare-fun b!898589 () Bool)

(declare-fun get!13322 (ValueCell!8691 V!29425) V!29425)

(declare-fun dynLambda!1304 (Int (_ BitVec 64)) V!29425)

(assert (=> b!898589 (= e!502682 (= (apply!410 lt!405718 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)) (get!13322 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25797 (_values!5420 thiss!1181))))))

(assert (=> b!898589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun b!898590 () Bool)

(assert (=> b!898590 (= e!502688 e!502689)))

(assert (=> b!898590 (= c!94972 (and (not (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5129 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898591 () Bool)

(declare-fun e!502693 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898591 (= e!502693 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898592 () Bool)

(declare-fun e!502683 () Bool)

(assert (=> b!898592 (= e!502685 e!502683)))

(declare-fun res!607217 () Bool)

(assert (=> b!898592 (= res!607217 call!39875)))

(assert (=> b!898592 (=> (not res!607217) (not e!502683))))

(declare-fun b!898593 () Bool)

(assert (=> b!898593 (= e!502683 (= (apply!410 lt!405718 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5233 thiss!1181)))))

(declare-fun b!898594 () Bool)

(declare-fun res!607218 () Bool)

(assert (=> b!898594 (=> (not res!607218) (not e!502687))))

(assert (=> b!898594 (= res!607218 e!502694)))

(declare-fun res!607219 () Bool)

(assert (=> b!898594 (=> res!607219 e!502694)))

(assert (=> b!898594 (= res!607219 (not e!502693))))

(declare-fun res!607216 () Bool)

(assert (=> b!898594 (=> (not res!607216) (not e!502693))))

(assert (=> b!898594 (= res!607216 (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun b!898595 () Bool)

(assert (=> b!898595 (= e!502688 (+!2591 call!39873 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))

(declare-fun b!898596 () Bool)

(assert (=> b!898596 (= e!502692 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111257 c!94971) b!898595))

(assert (= (and d!111257 (not c!94971)) b!898590))

(assert (= (and b!898590 c!94972) b!898586))

(assert (= (and b!898590 (not c!94972)) b!898583))

(assert (= (and b!898583 c!94968) b!898585))

(assert (= (and b!898583 (not c!94968)) b!898577))

(assert (= (or b!898585 b!898577) bm!39871))

(assert (= (or b!898586 bm!39871) bm!39870))

(assert (= (or b!898586 b!898585) bm!39868))

(assert (= (or b!898595 bm!39870) bm!39873))

(assert (= (or b!898595 bm!39868) bm!39874))

(assert (= (and d!111257 res!607224) b!898596))

(assert (= (and d!111257 c!94970) b!898582))

(assert (= (and d!111257 (not c!94970)) b!898579))

(assert (= (and d!111257 res!607222) b!898594))

(assert (= (and b!898594 res!607216) b!898591))

(assert (= (and b!898594 (not res!607219)) b!898581))

(assert (= (and b!898581 res!607220) b!898589))

(assert (= (and b!898594 res!607218) b!898584))

(assert (= (and b!898584 c!94973) b!898576))

(assert (= (and b!898584 (not c!94973)) b!898587))

(assert (= (and b!898576 res!607221) b!898588))

(assert (= (or b!898576 b!898587) bm!39869))

(assert (= (and b!898584 res!607223) b!898580))

(assert (= (and b!898580 c!94969) b!898592))

(assert (= (and b!898580 (not c!94969)) b!898578))

(assert (= (and b!898592 res!607217) b!898593))

(assert (= (or b!898592 b!898578) bm!39872))

(declare-fun b_lambda!12963 () Bool)

(assert (=> (not b_lambda!12963) (not b!898589)))

(declare-fun t!25184 () Bool)

(declare-fun tb!5193 () Bool)

(assert (=> (and b!898464 (= (defaultEntry!5413 thiss!1181) (defaultEntry!5413 thiss!1181)) t!25184) tb!5193))

(declare-fun result!10151 () Bool)

(assert (=> tb!5193 (= result!10151 tp_is_empty!18345)))

(assert (=> b!898589 t!25184))

(declare-fun b_and!26315 () Bool)

(assert (= b_and!26311 (and (=> t!25184 result!10151) b_and!26315)))

(assert (=> b!898581 m!835035))

(assert (=> b!898581 m!835035))

(declare-fun m!835043 () Bool)

(assert (=> b!898581 m!835043))

(declare-fun m!835045 () Bool)

(assert (=> bm!39874 m!835045))

(declare-fun m!835047 () Bool)

(assert (=> b!898589 m!835047))

(assert (=> b!898589 m!835035))

(declare-fun m!835049 () Bool)

(assert (=> b!898589 m!835049))

(declare-fun m!835051 () Bool)

(assert (=> b!898589 m!835051))

(assert (=> b!898589 m!835047))

(assert (=> b!898589 m!835051))

(declare-fun m!835053 () Bool)

(assert (=> b!898589 m!835053))

(assert (=> b!898589 m!835035))

(assert (=> b!898596 m!835035))

(assert (=> b!898596 m!835035))

(declare-fun m!835055 () Bool)

(assert (=> b!898596 m!835055))

(declare-fun m!835057 () Bool)

(assert (=> b!898588 m!835057))

(assert (=> d!111257 m!834967))

(declare-fun m!835059 () Bool)

(assert (=> bm!39873 m!835059))

(declare-fun m!835061 () Bool)

(assert (=> b!898582 m!835061))

(declare-fun m!835063 () Bool)

(assert (=> b!898582 m!835063))

(declare-fun m!835065 () Bool)

(assert (=> b!898582 m!835065))

(declare-fun m!835067 () Bool)

(assert (=> b!898582 m!835067))

(declare-fun m!835069 () Bool)

(assert (=> b!898582 m!835069))

(declare-fun m!835071 () Bool)

(assert (=> b!898582 m!835071))

(declare-fun m!835073 () Bool)

(assert (=> b!898582 m!835073))

(assert (=> b!898582 m!835059))

(declare-fun m!835075 () Bool)

(assert (=> b!898582 m!835075))

(declare-fun m!835077 () Bool)

(assert (=> b!898582 m!835077))

(declare-fun m!835079 () Bool)

(assert (=> b!898582 m!835079))

(declare-fun m!835081 () Bool)

(assert (=> b!898582 m!835081))

(assert (=> b!898582 m!835067))

(declare-fun m!835083 () Bool)

(assert (=> b!898582 m!835083))

(declare-fun m!835085 () Bool)

(assert (=> b!898582 m!835085))

(assert (=> b!898582 m!835071))

(declare-fun m!835087 () Bool)

(assert (=> b!898582 m!835087))

(assert (=> b!898582 m!835035))

(assert (=> b!898582 m!835063))

(declare-fun m!835089 () Bool)

(assert (=> b!898582 m!835089))

(assert (=> b!898582 m!835075))

(declare-fun m!835091 () Bool)

(assert (=> bm!39872 m!835091))

(declare-fun m!835093 () Bool)

(assert (=> bm!39869 m!835093))

(declare-fun m!835095 () Bool)

(assert (=> b!898595 m!835095))

(assert (=> b!898591 m!835035))

(assert (=> b!898591 m!835035))

(assert (=> b!898591 m!835055))

(declare-fun m!835097 () Bool)

(assert (=> b!898593 m!835097))

(assert (=> b!898466 d!111257))

(declare-fun d!111259 () Bool)

(declare-fun res!607231 () Bool)

(declare-fun e!502697 () Bool)

(assert (=> d!111259 (=> (not res!607231) (not e!502697))))

(declare-fun simpleValid!324 (LongMapFixedSize!4398) Bool)

(assert (=> d!111259 (= res!607231 (simpleValid!324 thiss!1181))))

(assert (=> d!111259 (= (valid!1691 thiss!1181) e!502697)))

(declare-fun b!898605 () Bool)

(declare-fun res!607232 () Bool)

(assert (=> b!898605 (=> (not res!607232) (not e!502697))))

(declare-fun arrayCountValidKeys!0 (array!52728 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898605 (= res!607232 (= (arrayCountValidKeys!0 (_keys!10188 thiss!1181) #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))) (_size!2254 thiss!1181)))))

(declare-fun b!898606 () Bool)

(declare-fun res!607233 () Bool)

(assert (=> b!898606 (=> (not res!607233) (not e!502697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52728 (_ BitVec 32)) Bool)

(assert (=> b!898606 (= res!607233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun b!898607 () Bool)

(declare-datatypes ((List!17842 0))(
  ( (Nil!17839) (Cons!17838 (h!18980 (_ BitVec 64)) (t!25185 List!17842)) )
))
(declare-fun arrayNoDuplicates!0 (array!52728 (_ BitVec 32) List!17842) Bool)

(assert (=> b!898607 (= e!502697 (arrayNoDuplicates!0 (_keys!10188 thiss!1181) #b00000000000000000000000000000000 Nil!17839))))

(assert (= (and d!111259 res!607231) b!898605))

(assert (= (and b!898605 res!607232) b!898606))

(assert (= (and b!898606 res!607233) b!898607))

(declare-fun m!835099 () Bool)

(assert (=> d!111259 m!835099))

(declare-fun m!835101 () Bool)

(assert (=> b!898605 m!835101))

(declare-fun m!835103 () Bool)

(assert (=> b!898606 m!835103))

(declare-fun m!835105 () Bool)

(assert (=> b!898607 m!835105))

(assert (=> start!76806 d!111259))

(declare-fun d!111261 () Bool)

(assert (=> d!111261 (= (inRange!0 (index!38076 lt!405607) (mask!26143 thiss!1181)) (and (bvsge (index!38076 lt!405607) #b00000000000000000000000000000000) (bvslt (index!38076 lt!405607) (bvadd (mask!26143 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898462 d!111261))

(declare-fun condMapEmpty!29178 () Bool)

(declare-fun mapDefault!29178 () ValueCell!8691)

(assert (=> mapNonEmpty!29172 (= condMapEmpty!29178 (= mapRest!29172 ((as const (Array (_ BitVec 32) ValueCell!8691)) mapDefault!29178)))))

(declare-fun e!502703 () Bool)

(declare-fun mapRes!29178 () Bool)

(assert (=> mapNonEmpty!29172 (= tp!56120 (and e!502703 mapRes!29178))))

(declare-fun mapNonEmpty!29178 () Bool)

(declare-fun tp!56129 () Bool)

(declare-fun e!502702 () Bool)

(assert (=> mapNonEmpty!29178 (= mapRes!29178 (and tp!56129 e!502702))))

(declare-fun mapRest!29178 () (Array (_ BitVec 32) ValueCell!8691))

(declare-fun mapValue!29178 () ValueCell!8691)

(declare-fun mapKey!29178 () (_ BitVec 32))

(assert (=> mapNonEmpty!29178 (= mapRest!29172 (store mapRest!29178 mapKey!29178 mapValue!29178))))

(declare-fun b!898614 () Bool)

(assert (=> b!898614 (= e!502702 tp_is_empty!18345)))

(declare-fun mapIsEmpty!29178 () Bool)

(assert (=> mapIsEmpty!29178 mapRes!29178))

(declare-fun b!898615 () Bool)

(assert (=> b!898615 (= e!502703 tp_is_empty!18345)))

(assert (= (and mapNonEmpty!29172 condMapEmpty!29178) mapIsEmpty!29178))

(assert (= (and mapNonEmpty!29172 (not condMapEmpty!29178)) mapNonEmpty!29178))

(assert (= (and mapNonEmpty!29178 ((_ is ValueCellFull!8691) mapValue!29178)) b!898614))

(assert (= (and mapNonEmpty!29172 ((_ is ValueCellFull!8691) mapDefault!29178)) b!898615))

(declare-fun m!835107 () Bool)

(assert (=> mapNonEmpty!29178 m!835107))

(declare-fun b_lambda!12965 () Bool)

(assert (= b_lambda!12963 (or (and b!898464 b_free!16017) b_lambda!12965)))

(check-sat (not d!111247) b_and!26315 (not b!898524) (not bm!39872) (not b!898605) (not b!898522) (not b!898591) (not d!111259) (not b!898497) (not b!898530) (not b!898589) (not b!898582) (not b!898588) (not b!898607) (not b!898596) (not d!111257) (not b_lambda!12965) (not bm!39874) (not b!898595) (not b!898593) (not mapNonEmpty!29178) (not bm!39873) (not b!898606) tp_is_empty!18345 (not b_next!16017) (not d!111243) (not d!111253) (not b!898581) (not d!111245) (not bm!39869) (not b!898514) (not d!111255) (not b!898533))
(check-sat b_and!26315 (not b_next!16017))
(get-model)

(declare-fun b!898626 () Bool)

(declare-fun e!502714 () Bool)

(declare-fun e!502715 () Bool)

(assert (=> b!898626 (= e!502714 e!502715)))

(declare-fun res!607242 () Bool)

(assert (=> b!898626 (=> (not res!607242) (not e!502715))))

(declare-fun e!502713 () Bool)

(assert (=> b!898626 (= res!607242 (not e!502713))))

(declare-fun res!607240 () Bool)

(assert (=> b!898626 (=> (not res!607240) (not e!502713))))

(assert (=> b!898626 (= res!607240 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898627 () Bool)

(declare-fun e!502712 () Bool)

(assert (=> b!898627 (= e!502715 e!502712)))

(declare-fun c!94976 () Bool)

(assert (=> b!898627 (= c!94976 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111263 () Bool)

(declare-fun res!607241 () Bool)

(assert (=> d!111263 (=> res!607241 e!502714)))

(assert (=> d!111263 (= res!607241 (bvsge #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> d!111263 (= (arrayNoDuplicates!0 (_keys!10188 thiss!1181) #b00000000000000000000000000000000 Nil!17839) e!502714)))

(declare-fun b!898628 () Bool)

(declare-fun call!39880 () Bool)

(assert (=> b!898628 (= e!502712 call!39880)))

(declare-fun b!898629 () Bool)

(declare-fun contains!4412 (List!17842 (_ BitVec 64)) Bool)

(assert (=> b!898629 (= e!502713 (contains!4412 Nil!17839 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898630 () Bool)

(assert (=> b!898630 (= e!502712 call!39880)))

(declare-fun bm!39877 () Bool)

(assert (=> bm!39877 (= call!39880 (arrayNoDuplicates!0 (_keys!10188 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94976 (Cons!17838 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000) Nil!17839) Nil!17839)))))

(assert (= (and d!111263 (not res!607241)) b!898626))

(assert (= (and b!898626 res!607240) b!898629))

(assert (= (and b!898626 res!607242) b!898627))

(assert (= (and b!898627 c!94976) b!898628))

(assert (= (and b!898627 (not c!94976)) b!898630))

(assert (= (or b!898628 b!898630) bm!39877))

(assert (=> b!898626 m!835035))

(assert (=> b!898626 m!835035))

(assert (=> b!898626 m!835055))

(assert (=> b!898627 m!835035))

(assert (=> b!898627 m!835035))

(assert (=> b!898627 m!835055))

(assert (=> b!898629 m!835035))

(assert (=> b!898629 m!835035))

(declare-fun m!835109 () Bool)

(assert (=> b!898629 m!835109))

(assert (=> bm!39877 m!835035))

(declare-fun m!835111 () Bool)

(assert (=> bm!39877 m!835111))

(assert (=> b!898607 d!111263))

(declare-fun d!111265 () Bool)

(assert (=> d!111265 (isDefined!330 (getValueByKey!456 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(declare-fun lt!405724 () Unit!30538)

(declare-fun choose!1492 (List!17840 (_ BitVec 64)) Unit!30538)

(assert (=> d!111265 (= lt!405724 (choose!1492 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(declare-fun e!502718 () Bool)

(assert (=> d!111265 e!502718))

(declare-fun res!607245 () Bool)

(assert (=> d!111265 (=> (not res!607245) (not e!502718))))

(declare-fun isStrictlySorted!497 (List!17840) Bool)

(assert (=> d!111265 (= res!607245 (isStrictlySorted!497 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))))

(assert (=> d!111265 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))) lt!405724)))

(declare-fun b!898633 () Bool)

(assert (=> b!898633 (= e!502718 (containsKey!425 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(assert (= (and d!111265 res!607245) b!898633))

(assert (=> d!111265 m!834971))

(assert (=> d!111265 m!835031))

(assert (=> d!111265 m!835031))

(assert (=> d!111265 m!835033))

(assert (=> d!111265 m!834971))

(declare-fun m!835113 () Bool)

(assert (=> d!111265 m!835113))

(declare-fun m!835115 () Bool)

(assert (=> d!111265 m!835115))

(assert (=> b!898633 m!834971))

(assert (=> b!898633 m!835027))

(assert (=> b!898522 d!111265))

(declare-fun d!111267 () Bool)

(declare-fun isEmpty!684 (Option!462) Bool)

(assert (=> d!111267 (= (isDefined!330 (getValueByKey!456 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))) (not (isEmpty!684 (getValueByKey!456 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))))

(declare-fun bs!25215 () Bool)

(assert (= bs!25215 d!111267))

(assert (=> bs!25215 m!835031))

(declare-fun m!835117 () Bool)

(assert (=> bs!25215 m!835117))

(assert (=> b!898522 d!111267))

(declare-fun d!111269 () Bool)

(declare-fun c!94981 () Bool)

(assert (=> d!111269 (= c!94981 (and ((_ is Cons!17836) (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))) (= (_1!6028 (h!18978 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))))))

(declare-fun e!502723 () Option!462)

(assert (=> d!111269 (= (getValueByKey!456 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))) e!502723)))

(declare-fun b!898644 () Bool)

(declare-fun e!502724 () Option!462)

(assert (=> b!898644 (= e!502724 (getValueByKey!456 (t!25181 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(declare-fun b!898642 () Bool)

(assert (=> b!898642 (= e!502723 (Some!461 (_2!6028 (h!18978 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))))))))

(declare-fun b!898643 () Bool)

(assert (=> b!898643 (= e!502723 e!502724)))

(declare-fun c!94982 () Bool)

(assert (=> b!898643 (= c!94982 (and ((_ is Cons!17836) (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))) (not (= (_1!6028 (h!18978 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))))

(declare-fun b!898645 () Bool)

(assert (=> b!898645 (= e!502724 None!460)))

(assert (= (and d!111269 c!94981) b!898642))

(assert (= (and d!111269 (not c!94981)) b!898643))

(assert (= (and b!898643 c!94982) b!898644))

(assert (= (and b!898643 (not c!94982)) b!898645))

(assert (=> b!898644 m!834971))

(declare-fun m!835119 () Bool)

(assert (=> b!898644 m!835119))

(assert (=> b!898522 d!111269))

(declare-fun d!111271 () Bool)

(declare-fun e!502727 () Bool)

(assert (=> d!111271 e!502727))

(declare-fun res!607250 () Bool)

(assert (=> d!111271 (=> (not res!607250) (not e!502727))))

(declare-fun lt!405734 () ListLongMap!10731)

(assert (=> d!111271 (= res!607250 (contains!4410 lt!405734 (_1!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))))

(declare-fun lt!405735 () List!17840)

(assert (=> d!111271 (= lt!405734 (ListLongMap!10732 lt!405735))))

(declare-fun lt!405736 () Unit!30538)

(declare-fun lt!405733 () Unit!30538)

(assert (=> d!111271 (= lt!405736 lt!405733)))

(assert (=> d!111271 (= (getValueByKey!456 lt!405735 (_1!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))) (Some!461 (_2!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!248 (List!17840 (_ BitVec 64) V!29425) Unit!30538)

(assert (=> d!111271 (= lt!405733 (lemmaContainsTupThenGetReturnValue!248 lt!405735 (_1!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))) (_2!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))))

(declare-fun insertStrictlySorted!305 (List!17840 (_ BitVec 64) V!29425) List!17840)

(assert (=> d!111271 (= lt!405735 (insertStrictlySorted!305 (toList!5381 (ite c!94971 call!39872 (ite c!94972 call!39874 call!39877))) (_1!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))) (_2!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))))

(assert (=> d!111271 (= (+!2591 (ite c!94971 call!39872 (ite c!94972 call!39874 call!39877)) (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))) lt!405734)))

(declare-fun b!898650 () Bool)

(declare-fun res!607251 () Bool)

(assert (=> b!898650 (=> (not res!607251) (not e!502727))))

(assert (=> b!898650 (= res!607251 (= (getValueByKey!456 (toList!5381 lt!405734) (_1!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))) (Some!461 (_2!6028 (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))))

(declare-fun b!898651 () Bool)

(declare-fun contains!4413 (List!17840 tuple2!12034) Bool)

(assert (=> b!898651 (= e!502727 (contains!4413 (toList!5381 lt!405734) (ite (or c!94971 c!94972) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5233 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))

(assert (= (and d!111271 res!607250) b!898650))

(assert (= (and b!898650 res!607251) b!898651))

(declare-fun m!835121 () Bool)

(assert (=> d!111271 m!835121))

(declare-fun m!835123 () Bool)

(assert (=> d!111271 m!835123))

(declare-fun m!835125 () Bool)

(assert (=> d!111271 m!835125))

(declare-fun m!835127 () Bool)

(assert (=> d!111271 m!835127))

(declare-fun m!835129 () Bool)

(assert (=> b!898650 m!835129))

(declare-fun m!835131 () Bool)

(assert (=> b!898651 m!835131))

(assert (=> bm!39874 d!111271))

(declare-fun d!111273 () Bool)

(declare-fun get!13323 (Option!462) V!29425)

(assert (=> d!111273 (= (apply!410 lt!405718 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)) (get!13323 (getValueByKey!456 (toList!5381 lt!405718) (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25216 () Bool)

(assert (= bs!25216 d!111273))

(assert (=> bs!25216 m!835035))

(declare-fun m!835133 () Bool)

(assert (=> bs!25216 m!835133))

(assert (=> bs!25216 m!835133))

(declare-fun m!835135 () Bool)

(assert (=> bs!25216 m!835135))

(assert (=> b!898589 d!111273))

(declare-fun d!111275 () Bool)

(declare-fun c!94985 () Bool)

(assert (=> d!111275 (= c!94985 ((_ is ValueCellFull!8691) (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!502730 () V!29425)

(assert (=> d!111275 (= (get!13322 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!502730)))

(declare-fun b!898656 () Bool)

(declare-fun get!13324 (ValueCell!8691 V!29425) V!29425)

(assert (=> b!898656 (= e!502730 (get!13324 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898657 () Bool)

(declare-fun get!13325 (ValueCell!8691 V!29425) V!29425)

(assert (=> b!898657 (= e!502730 (get!13325 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111275 c!94985) b!898656))

(assert (= (and d!111275 (not c!94985)) b!898657))

(assert (=> b!898656 m!835047))

(assert (=> b!898656 m!835051))

(declare-fun m!835137 () Bool)

(assert (=> b!898656 m!835137))

(assert (=> b!898657 m!835047))

(assert (=> b!898657 m!835051))

(declare-fun m!835139 () Bool)

(assert (=> b!898657 m!835139))

(assert (=> b!898589 d!111275))

(assert (=> b!898524 d!111267))

(assert (=> b!898524 d!111269))

(declare-fun d!111277 () Bool)

(assert (=> d!111277 (= (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898591 d!111277))

(declare-fun d!111279 () Bool)

(assert (=> d!111279 (contains!4410 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))))

(assert (=> d!111279 true))

(declare-fun _$16!178 () Unit!30538)

(assert (=> d!111279 (= (choose!1491 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) (index!38076 lt!405607) (defaultEntry!5413 thiss!1181)) _$16!178)))

(declare-fun bs!25217 () Bool)

(assert (= bs!25217 d!111279))

(assert (=> bs!25217 m!834969))

(assert (=> bs!25217 m!834971))

(assert (=> bs!25217 m!834969))

(assert (=> bs!25217 m!834971))

(assert (=> bs!25217 m!834973))

(assert (=> d!111253 d!111279))

(assert (=> d!111253 d!111249))

(assert (=> b!898533 d!111247))

(assert (=> b!898533 d!111257))

(declare-fun d!111281 () Bool)

(assert (=> d!111281 (= (apply!410 lt!405718 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13323 (getValueByKey!456 (toList!5381 lt!405718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25218 () Bool)

(assert (= bs!25218 d!111281))

(declare-fun m!835141 () Bool)

(assert (=> bs!25218 m!835141))

(assert (=> bs!25218 m!835141))

(declare-fun m!835143 () Bool)

(assert (=> bs!25218 m!835143))

(assert (=> b!898593 d!111281))

(declare-fun b!898676 () Bool)

(declare-fun e!502744 () SeekEntryResult!8926)

(assert (=> b!898676 (= e!502744 (Intermediate!8926 false (toIndex!0 key!785 (mask!26143 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!898677 () Bool)

(declare-fun lt!405742 () SeekEntryResult!8926)

(assert (=> b!898677 (and (bvsge (index!38077 lt!405742) #b00000000000000000000000000000000) (bvslt (index!38077 lt!405742) (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun res!607258 () Bool)

(assert (=> b!898677 (= res!607258 (= (select (arr!25341 (_keys!10188 thiss!1181)) (index!38077 lt!405742)) key!785))))

(declare-fun e!502741 () Bool)

(assert (=> b!898677 (=> res!607258 e!502741)))

(declare-fun e!502745 () Bool)

(assert (=> b!898677 (= e!502745 e!502741)))

(declare-fun d!111283 () Bool)

(declare-fun e!502743 () Bool)

(assert (=> d!111283 e!502743))

(declare-fun c!94992 () Bool)

(assert (=> d!111283 (= c!94992 (and ((_ is Intermediate!8926) lt!405742) (undefined!9738 lt!405742)))))

(declare-fun e!502742 () SeekEntryResult!8926)

(assert (=> d!111283 (= lt!405742 e!502742)))

(declare-fun c!94994 () Bool)

(assert (=> d!111283 (= c!94994 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!405741 () (_ BitVec 64))

(assert (=> d!111283 (= lt!405741 (select (arr!25341 (_keys!10188 thiss!1181)) (toIndex!0 key!785 (mask!26143 thiss!1181))))))

(assert (=> d!111283 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26143 thiss!1181)) key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)) lt!405742)))

(declare-fun b!898678 () Bool)

(assert (=> b!898678 (= e!502743 (bvsge (x!76573 lt!405742) #b01111111111111111111111111111110))))

(declare-fun b!898679 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898679 (= e!502744 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26143 thiss!1181)) #b00000000000000000000000000000000 (mask!26143 thiss!1181)) key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun b!898680 () Bool)

(assert (=> b!898680 (and (bvsge (index!38077 lt!405742) #b00000000000000000000000000000000) (bvslt (index!38077 lt!405742) (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun res!607260 () Bool)

(assert (=> b!898680 (= res!607260 (= (select (arr!25341 (_keys!10188 thiss!1181)) (index!38077 lt!405742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898680 (=> res!607260 e!502741)))

(declare-fun b!898681 () Bool)

(assert (=> b!898681 (= e!502743 e!502745)))

(declare-fun res!607259 () Bool)

(assert (=> b!898681 (= res!607259 (and ((_ is Intermediate!8926) lt!405742) (not (undefined!9738 lt!405742)) (bvslt (x!76573 lt!405742) #b01111111111111111111111111111110) (bvsge (x!76573 lt!405742) #b00000000000000000000000000000000) (bvsge (x!76573 lt!405742) #b00000000000000000000000000000000)))))

(assert (=> b!898681 (=> (not res!607259) (not e!502745))))

(declare-fun b!898682 () Bool)

(assert (=> b!898682 (= e!502742 (Intermediate!8926 true (toIndex!0 key!785 (mask!26143 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!898683 () Bool)

(assert (=> b!898683 (= e!502742 e!502744)))

(declare-fun c!94993 () Bool)

(assert (=> b!898683 (= c!94993 (or (= lt!405741 key!785) (= (bvadd lt!405741 lt!405741) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898684 () Bool)

(assert (=> b!898684 (and (bvsge (index!38077 lt!405742) #b00000000000000000000000000000000) (bvslt (index!38077 lt!405742) (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> b!898684 (= e!502741 (= (select (arr!25341 (_keys!10188 thiss!1181)) (index!38077 lt!405742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111283 c!94994) b!898682))

(assert (= (and d!111283 (not c!94994)) b!898683))

(assert (= (and b!898683 c!94993) b!898676))

(assert (= (and b!898683 (not c!94993)) b!898679))

(assert (= (and d!111283 c!94992) b!898678))

(assert (= (and d!111283 (not c!94992)) b!898681))

(assert (= (and b!898681 res!607259) b!898677))

(assert (= (and b!898677 (not res!607258)) b!898680))

(assert (= (and b!898680 (not res!607260)) b!898684))

(assert (=> b!898679 m!835023))

(declare-fun m!835145 () Bool)

(assert (=> b!898679 m!835145))

(assert (=> b!898679 m!835145))

(declare-fun m!835147 () Bool)

(assert (=> b!898679 m!835147))

(declare-fun m!835149 () Bool)

(assert (=> b!898684 m!835149))

(assert (=> d!111283 m!835023))

(declare-fun m!835151 () Bool)

(assert (=> d!111283 m!835151))

(assert (=> d!111283 m!834967))

(assert (=> b!898680 m!835149))

(assert (=> b!898677 m!835149))

(assert (=> d!111245 d!111283))

(declare-fun d!111285 () Bool)

(declare-fun lt!405748 () (_ BitVec 32))

(declare-fun lt!405747 () (_ BitVec 32))

(assert (=> d!111285 (= lt!405748 (bvmul (bvxor lt!405747 (bvlshr lt!405747 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111285 (= lt!405747 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111285 (and (bvsge (mask!26143 thiss!1181) #b00000000000000000000000000000000) (let ((res!607261 (let ((h!18981 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76590 (bvmul (bvxor h!18981 (bvlshr h!18981 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76590 (bvlshr x!76590 #b00000000000000000000000000001101)) (mask!26143 thiss!1181)))))) (and (bvslt res!607261 (bvadd (mask!26143 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607261 #b00000000000000000000000000000000))))))

(assert (=> d!111285 (= (toIndex!0 key!785 (mask!26143 thiss!1181)) (bvand (bvxor lt!405748 (bvlshr lt!405748 #b00000000000000000000000000001101)) (mask!26143 thiss!1181)))))

(assert (=> d!111245 d!111285))

(assert (=> d!111245 d!111249))

(declare-fun d!111287 () Bool)

(declare-fun e!502746 () Bool)

(assert (=> d!111287 e!502746))

(declare-fun res!607262 () Bool)

(assert (=> d!111287 (=> res!607262 e!502746)))

(declare-fun lt!405752 () Bool)

(assert (=> d!111287 (= res!607262 (not lt!405752))))

(declare-fun lt!405749 () Bool)

(assert (=> d!111287 (= lt!405752 lt!405749)))

(declare-fun lt!405751 () Unit!30538)

(declare-fun e!502747 () Unit!30538)

(assert (=> d!111287 (= lt!405751 e!502747)))

(declare-fun c!94995 () Bool)

(assert (=> d!111287 (= c!94995 lt!405749)))

(assert (=> d!111287 (= lt!405749 (containsKey!425 (toList!5381 lt!405718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111287 (= (contains!4410 lt!405718 #b0000000000000000000000000000000000000000000000000000000000000000) lt!405752)))

(declare-fun b!898685 () Bool)

(declare-fun lt!405750 () Unit!30538)

(assert (=> b!898685 (= e!502747 lt!405750)))

(assert (=> b!898685 (= lt!405750 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5381 lt!405718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898685 (isDefined!330 (getValueByKey!456 (toList!5381 lt!405718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898686 () Bool)

(declare-fun Unit!30544 () Unit!30538)

(assert (=> b!898686 (= e!502747 Unit!30544)))

(declare-fun b!898687 () Bool)

(assert (=> b!898687 (= e!502746 (isDefined!330 (getValueByKey!456 (toList!5381 lt!405718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111287 c!94995) b!898685))

(assert (= (and d!111287 (not c!94995)) b!898686))

(assert (= (and d!111287 (not res!607262)) b!898687))

(declare-fun m!835153 () Bool)

(assert (=> d!111287 m!835153))

(declare-fun m!835155 () Bool)

(assert (=> b!898685 m!835155))

(declare-fun m!835157 () Bool)

(assert (=> b!898685 m!835157))

(assert (=> b!898685 m!835157))

(declare-fun m!835159 () Bool)

(assert (=> b!898685 m!835159))

(assert (=> b!898687 m!835157))

(assert (=> b!898687 m!835157))

(assert (=> b!898687 m!835159))

(assert (=> bm!39869 d!111287))

(declare-fun d!111289 () Bool)

(declare-fun e!502748 () Bool)

(assert (=> d!111289 e!502748))

(declare-fun res!607263 () Bool)

(assert (=> d!111289 (=> (not res!607263) (not e!502748))))

(declare-fun lt!405754 () ListLongMap!10731)

(assert (=> d!111289 (= res!607263 (contains!4410 lt!405754 (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))

(declare-fun lt!405755 () List!17840)

(assert (=> d!111289 (= lt!405754 (ListLongMap!10732 lt!405755))))

(declare-fun lt!405756 () Unit!30538)

(declare-fun lt!405753 () Unit!30538)

(assert (=> d!111289 (= lt!405756 lt!405753)))

(assert (=> d!111289 (= (getValueByKey!456 lt!405755 (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))

(assert (=> d!111289 (= lt!405753 (lemmaContainsTupThenGetReturnValue!248 lt!405755 (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))

(assert (=> d!111289 (= lt!405755 (insertStrictlySorted!305 (toList!5381 call!39873) (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))))))

(assert (=> d!111289 (= (+!2591 call!39873 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))) lt!405754)))

(declare-fun b!898688 () Bool)

(declare-fun res!607264 () Bool)

(assert (=> b!898688 (=> (not res!607264) (not e!502748))))

(assert (=> b!898688 (= res!607264 (= (getValueByKey!456 (toList!5381 lt!405754) (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))))

(declare-fun b!898689 () Bool)

(assert (=> b!898689 (= e!502748 (contains!4413 (toList!5381 lt!405754) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5233 thiss!1181))))))

(assert (= (and d!111289 res!607263) b!898688))

(assert (= (and b!898688 res!607264) b!898689))

(declare-fun m!835161 () Bool)

(assert (=> d!111289 m!835161))

(declare-fun m!835163 () Bool)

(assert (=> d!111289 m!835163))

(declare-fun m!835165 () Bool)

(assert (=> d!111289 m!835165))

(declare-fun m!835167 () Bool)

(assert (=> d!111289 m!835167))

(declare-fun m!835169 () Bool)

(assert (=> b!898688 m!835169))

(declare-fun m!835171 () Bool)

(assert (=> b!898689 m!835171))

(assert (=> b!898595 d!111289))

(declare-fun d!111291 () Bool)

(declare-fun res!607269 () Bool)

(declare-fun e!502753 () Bool)

(assert (=> d!111291 (=> res!607269 e!502753)))

(assert (=> d!111291 (= res!607269 (and ((_ is Cons!17836) (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))) (= (_1!6028 (h!18978 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))))))

(assert (=> d!111291 (= (containsKey!425 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))) e!502753)))

(declare-fun b!898694 () Bool)

(declare-fun e!502754 () Bool)

(assert (=> b!898694 (= e!502753 e!502754)))

(declare-fun res!607270 () Bool)

(assert (=> b!898694 (=> (not res!607270) (not e!502754))))

(assert (=> b!898694 (= res!607270 (and (or (not ((_ is Cons!17836) (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))))) (bvsle (_1!6028 (h!18978 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))) ((_ is Cons!17836) (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))) (bvslt (_1!6028 (h!18978 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181))))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607)))))))

(declare-fun b!898695 () Bool)

(assert (=> b!898695 (= e!502754 (containsKey!425 (t!25181 (toList!5381 (getCurrentListMap!2655 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)))) (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405607))))))

(assert (= (and d!111291 (not res!607269)) b!898694))

(assert (= (and b!898694 res!607270) b!898695))

(assert (=> b!898695 m!834971))

(declare-fun m!835173 () Bool)

(assert (=> b!898695 m!835173))

(assert (=> d!111247 d!111291))

(assert (=> d!111255 d!111251))

(declare-fun d!111293 () Bool)

(assert (=> d!111293 (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111293 true))

(declare-fun _$60!418 () Unit!30538)

(assert (=> d!111293 (= (choose!13 (_keys!10188 thiss!1181) key!785 (index!38076 lt!405607)) _$60!418)))

(declare-fun bs!25219 () Bool)

(assert (= bs!25219 d!111293))

(assert (=> bs!25219 m!834975))

(assert (=> d!111255 d!111293))

(assert (=> b!898596 d!111277))

(declare-fun d!111295 () Bool)

(declare-fun e!502755 () Bool)

(assert (=> d!111295 e!502755))

(declare-fun res!607271 () Bool)

(assert (=> d!111295 (=> res!607271 e!502755)))

(declare-fun lt!405760 () Bool)

(assert (=> d!111295 (= res!607271 (not lt!405760))))

(declare-fun lt!405757 () Bool)

(assert (=> d!111295 (= lt!405760 lt!405757)))

(declare-fun lt!405759 () Unit!30538)

(declare-fun e!502756 () Unit!30538)

(assert (=> d!111295 (= lt!405759 e!502756)))

(declare-fun c!94996 () Bool)

(assert (=> d!111295 (= c!94996 lt!405757)))

(assert (=> d!111295 (= lt!405757 (containsKey!425 (toList!5381 lt!405718) (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111295 (= (contains!4410 lt!405718 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)) lt!405760)))

(declare-fun b!898696 () Bool)

(declare-fun lt!405758 () Unit!30538)

(assert (=> b!898696 (= e!502756 lt!405758)))

(assert (=> b!898696 (= lt!405758 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5381 lt!405718) (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898696 (isDefined!330 (getValueByKey!456 (toList!5381 lt!405718) (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898697 () Bool)

(declare-fun Unit!30545 () Unit!30538)

(assert (=> b!898697 (= e!502756 Unit!30545)))

(declare-fun b!898698 () Bool)

(assert (=> b!898698 (= e!502755 (isDefined!330 (getValueByKey!456 (toList!5381 lt!405718) (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111295 c!94996) b!898696))

(assert (= (and d!111295 (not c!94996)) b!898697))

(assert (= (and d!111295 (not res!607271)) b!898698))

(assert (=> d!111295 m!835035))

(declare-fun m!835175 () Bool)

(assert (=> d!111295 m!835175))

(assert (=> b!898696 m!835035))

(declare-fun m!835177 () Bool)

(assert (=> b!898696 m!835177))

(assert (=> b!898696 m!835035))

(assert (=> b!898696 m!835133))

(assert (=> b!898696 m!835133))

(declare-fun m!835179 () Bool)

(assert (=> b!898696 m!835179))

(assert (=> b!898698 m!835035))

(assert (=> b!898698 m!835133))

(assert (=> b!898698 m!835133))

(assert (=> b!898698 m!835179))

(assert (=> b!898581 d!111295))

(declare-fun d!111297 () Bool)

(assert (=> d!111297 (= (apply!410 (+!2591 lt!405715 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))) lt!405719) (get!13323 (getValueByKey!456 (toList!5381 (+!2591 lt!405715 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))) lt!405719)))))

(declare-fun bs!25220 () Bool)

(assert (= bs!25220 d!111297))

(declare-fun m!835181 () Bool)

(assert (=> bs!25220 m!835181))

(assert (=> bs!25220 m!835181))

(declare-fun m!835183 () Bool)

(assert (=> bs!25220 m!835183))

(assert (=> b!898582 d!111297))

(declare-fun d!111299 () Bool)

(declare-fun e!502757 () Bool)

(assert (=> d!111299 e!502757))

(declare-fun res!607272 () Bool)

(assert (=> d!111299 (=> res!607272 e!502757)))

(declare-fun lt!405764 () Bool)

(assert (=> d!111299 (= res!607272 (not lt!405764))))

(declare-fun lt!405761 () Bool)

(assert (=> d!111299 (= lt!405764 lt!405761)))

(declare-fun lt!405763 () Unit!30538)

(declare-fun e!502758 () Unit!30538)

(assert (=> d!111299 (= lt!405763 e!502758)))

(declare-fun c!94997 () Bool)

(assert (=> d!111299 (= c!94997 lt!405761)))

(assert (=> d!111299 (= lt!405761 (containsKey!425 (toList!5381 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))) lt!405714))))

(assert (=> d!111299 (= (contains!4410 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))) lt!405714) lt!405764)))

(declare-fun b!898699 () Bool)

(declare-fun lt!405762 () Unit!30538)

(assert (=> b!898699 (= e!502758 lt!405762)))

(assert (=> b!898699 (= lt!405762 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5381 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))) lt!405714))))

(assert (=> b!898699 (isDefined!330 (getValueByKey!456 (toList!5381 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))) lt!405714))))

(declare-fun b!898700 () Bool)

(declare-fun Unit!30546 () Unit!30538)

(assert (=> b!898700 (= e!502758 Unit!30546)))

(declare-fun b!898701 () Bool)

(assert (=> b!898701 (= e!502757 (isDefined!330 (getValueByKey!456 (toList!5381 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))) lt!405714)))))

(assert (= (and d!111299 c!94997) b!898699))

(assert (= (and d!111299 (not c!94997)) b!898700))

(assert (= (and d!111299 (not res!607272)) b!898701))

(declare-fun m!835185 () Bool)

(assert (=> d!111299 m!835185))

(declare-fun m!835187 () Bool)

(assert (=> b!898699 m!835187))

(declare-fun m!835189 () Bool)

(assert (=> b!898699 m!835189))

(assert (=> b!898699 m!835189))

(declare-fun m!835191 () Bool)

(assert (=> b!898699 m!835191))

(assert (=> b!898701 m!835189))

(assert (=> b!898701 m!835189))

(assert (=> b!898701 m!835191))

(assert (=> b!898582 d!111299))

(declare-fun d!111301 () Bool)

(assert (=> d!111301 (= (apply!410 (+!2591 lt!405715 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))) lt!405719) (apply!410 lt!405715 lt!405719))))

(declare-fun lt!405767 () Unit!30538)

(declare-fun choose!1493 (ListLongMap!10731 (_ BitVec 64) V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> d!111301 (= lt!405767 (choose!1493 lt!405715 lt!405707 (zeroValue!5233 thiss!1181) lt!405719))))

(declare-fun e!502761 () Bool)

(assert (=> d!111301 e!502761))

(declare-fun res!607275 () Bool)

(assert (=> d!111301 (=> (not res!607275) (not e!502761))))

(assert (=> d!111301 (= res!607275 (contains!4410 lt!405715 lt!405719))))

(assert (=> d!111301 (= (addApplyDifferent!332 lt!405715 lt!405707 (zeroValue!5233 thiss!1181) lt!405719) lt!405767)))

(declare-fun b!898705 () Bool)

(assert (=> b!898705 (= e!502761 (not (= lt!405719 lt!405707)))))

(assert (= (and d!111301 res!607275) b!898705))

(assert (=> d!111301 m!835071))

(assert (=> d!111301 m!835073))

(assert (=> d!111301 m!835071))

(declare-fun m!835193 () Bool)

(assert (=> d!111301 m!835193))

(declare-fun m!835195 () Bool)

(assert (=> d!111301 m!835195))

(assert (=> d!111301 m!835065))

(assert (=> b!898582 d!111301))

(declare-fun d!111303 () Bool)

(assert (=> d!111303 (= (apply!410 lt!405706 lt!405703) (get!13323 (getValueByKey!456 (toList!5381 lt!405706) lt!405703)))))

(declare-fun bs!25221 () Bool)

(assert (= bs!25221 d!111303))

(declare-fun m!835197 () Bool)

(assert (=> bs!25221 m!835197))

(assert (=> bs!25221 m!835197))

(declare-fun m!835199 () Bool)

(assert (=> bs!25221 m!835199))

(assert (=> b!898582 d!111303))

(declare-fun d!111305 () Bool)

(declare-fun e!502762 () Bool)

(assert (=> d!111305 e!502762))

(declare-fun res!607276 () Bool)

(assert (=> d!111305 (=> (not res!607276) (not e!502762))))

(declare-fun lt!405769 () ListLongMap!10731)

(assert (=> d!111305 (= res!607276 (contains!4410 lt!405769 (_1!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))))))

(declare-fun lt!405770 () List!17840)

(assert (=> d!111305 (= lt!405769 (ListLongMap!10732 lt!405770))))

(declare-fun lt!405771 () Unit!30538)

(declare-fun lt!405768 () Unit!30538)

(assert (=> d!111305 (= lt!405771 lt!405768)))

(assert (=> d!111305 (= (getValueByKey!456 lt!405770 (_1!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))))))

(assert (=> d!111305 (= lt!405768 (lemmaContainsTupThenGetReturnValue!248 lt!405770 (_1!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))))))

(assert (=> d!111305 (= lt!405770 (insertStrictlySorted!305 (toList!5381 lt!405709) (_1!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))))))

(assert (=> d!111305 (= (+!2591 lt!405709 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))) lt!405769)))

(declare-fun b!898706 () Bool)

(declare-fun res!607277 () Bool)

(assert (=> b!898706 (=> (not res!607277) (not e!502762))))

(assert (=> b!898706 (= res!607277 (= (getValueByKey!456 (toList!5381 lt!405769) (_1!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))))))))

(declare-fun b!898707 () Bool)

(assert (=> b!898707 (= e!502762 (contains!4413 (toList!5381 lt!405769) (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))))))

(assert (= (and d!111305 res!607276) b!898706))

(assert (= (and b!898706 res!607277) b!898707))

(declare-fun m!835201 () Bool)

(assert (=> d!111305 m!835201))

(declare-fun m!835203 () Bool)

(assert (=> d!111305 m!835203))

(declare-fun m!835205 () Bool)

(assert (=> d!111305 m!835205))

(declare-fun m!835207 () Bool)

(assert (=> d!111305 m!835207))

(declare-fun m!835209 () Bool)

(assert (=> b!898706 m!835209))

(declare-fun m!835211 () Bool)

(assert (=> b!898707 m!835211))

(assert (=> b!898582 d!111305))

(declare-fun d!111307 () Bool)

(declare-fun e!502763 () Bool)

(assert (=> d!111307 e!502763))

(declare-fun res!607278 () Bool)

(assert (=> d!111307 (=> (not res!607278) (not e!502763))))

(declare-fun lt!405773 () ListLongMap!10731)

(assert (=> d!111307 (= res!607278 (contains!4410 lt!405773 (_1!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))))))

(declare-fun lt!405774 () List!17840)

(assert (=> d!111307 (= lt!405773 (ListLongMap!10732 lt!405774))))

(declare-fun lt!405775 () Unit!30538)

(declare-fun lt!405772 () Unit!30538)

(assert (=> d!111307 (= lt!405775 lt!405772)))

(assert (=> d!111307 (= (getValueByKey!456 lt!405774 (_1!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))))))

(assert (=> d!111307 (= lt!405772 (lemmaContainsTupThenGetReturnValue!248 lt!405774 (_1!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))))))

(assert (=> d!111307 (= lt!405774 (insertStrictlySorted!305 (toList!5381 lt!405708) (_1!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))))))

(assert (=> d!111307 (= (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))) lt!405773)))

(declare-fun b!898708 () Bool)

(declare-fun res!607279 () Bool)

(assert (=> b!898708 (=> (not res!607279) (not e!502763))))

(assert (=> b!898708 (= res!607279 (= (getValueByKey!456 (toList!5381 lt!405773) (_1!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))))))))

(declare-fun b!898709 () Bool)

(assert (=> b!898709 (= e!502763 (contains!4413 (toList!5381 lt!405773) (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))))))

(assert (= (and d!111307 res!607278) b!898708))

(assert (= (and b!898708 res!607279) b!898709))

(declare-fun m!835213 () Bool)

(assert (=> d!111307 m!835213))

(declare-fun m!835215 () Bool)

(assert (=> d!111307 m!835215))

(declare-fun m!835217 () Bool)

(assert (=> d!111307 m!835217))

(declare-fun m!835219 () Bool)

(assert (=> d!111307 m!835219))

(declare-fun m!835221 () Bool)

(assert (=> b!898708 m!835221))

(declare-fun m!835223 () Bool)

(assert (=> b!898709 m!835223))

(assert (=> b!898582 d!111307))

(declare-fun d!111309 () Bool)

(assert (=> d!111309 (= (apply!410 (+!2591 lt!405709 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))) lt!405716) (apply!410 lt!405709 lt!405716))))

(declare-fun lt!405776 () Unit!30538)

(assert (=> d!111309 (= lt!405776 (choose!1493 lt!405709 lt!405702 (minValue!5233 thiss!1181) lt!405716))))

(declare-fun e!502764 () Bool)

(assert (=> d!111309 e!502764))

(declare-fun res!607280 () Bool)

(assert (=> d!111309 (=> (not res!607280) (not e!502764))))

(assert (=> d!111309 (= res!607280 (contains!4410 lt!405709 lt!405716))))

(assert (=> d!111309 (= (addApplyDifferent!332 lt!405709 lt!405702 (minValue!5233 thiss!1181) lt!405716) lt!405776)))

(declare-fun b!898710 () Bool)

(assert (=> b!898710 (= e!502764 (not (= lt!405716 lt!405702)))))

(assert (= (and d!111309 res!607280) b!898710))

(assert (=> d!111309 m!835063))

(assert (=> d!111309 m!835089))

(assert (=> d!111309 m!835063))

(declare-fun m!835225 () Bool)

(assert (=> d!111309 m!835225))

(declare-fun m!835227 () Bool)

(assert (=> d!111309 m!835227))

(assert (=> d!111309 m!835061))

(assert (=> b!898582 d!111309))

(declare-fun d!111311 () Bool)

(assert (=> d!111311 (contains!4410 (+!2591 lt!405708 (tuple2!12035 lt!405713 (zeroValue!5233 thiss!1181))) lt!405714)))

(declare-fun lt!405779 () Unit!30538)

(declare-fun choose!1494 (ListLongMap!10731 (_ BitVec 64) V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> d!111311 (= lt!405779 (choose!1494 lt!405708 lt!405713 (zeroValue!5233 thiss!1181) lt!405714))))

(assert (=> d!111311 (contains!4410 lt!405708 lt!405714)))

(assert (=> d!111311 (= (addStillContains!332 lt!405708 lt!405713 (zeroValue!5233 thiss!1181) lt!405714) lt!405779)))

(declare-fun bs!25222 () Bool)

(assert (= bs!25222 d!111311))

(assert (=> bs!25222 m!835067))

(assert (=> bs!25222 m!835067))

(assert (=> bs!25222 m!835083))

(declare-fun m!835229 () Bool)

(assert (=> bs!25222 m!835229))

(declare-fun m!835231 () Bool)

(assert (=> bs!25222 m!835231))

(assert (=> b!898582 d!111311))

(declare-fun d!111313 () Bool)

(assert (=> d!111313 (= (apply!410 (+!2591 lt!405706 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))) lt!405703) (apply!410 lt!405706 lt!405703))))

(declare-fun lt!405780 () Unit!30538)

(assert (=> d!111313 (= lt!405780 (choose!1493 lt!405706 lt!405704 (minValue!5233 thiss!1181) lt!405703))))

(declare-fun e!502765 () Bool)

(assert (=> d!111313 e!502765))

(declare-fun res!607281 () Bool)

(assert (=> d!111313 (=> (not res!607281) (not e!502765))))

(assert (=> d!111313 (= res!607281 (contains!4410 lt!405706 lt!405703))))

(assert (=> d!111313 (= (addApplyDifferent!332 lt!405706 lt!405704 (minValue!5233 thiss!1181) lt!405703) lt!405780)))

(declare-fun b!898712 () Bool)

(assert (=> b!898712 (= e!502765 (not (= lt!405703 lt!405704)))))

(assert (= (and d!111313 res!607281) b!898712))

(assert (=> d!111313 m!835075))

(assert (=> d!111313 m!835077))

(assert (=> d!111313 m!835075))

(declare-fun m!835233 () Bool)

(assert (=> d!111313 m!835233))

(declare-fun m!835235 () Bool)

(assert (=> d!111313 m!835235))

(assert (=> d!111313 m!835079))

(assert (=> b!898582 d!111313))

(declare-fun d!111315 () Bool)

(assert (=> d!111315 (= (apply!410 lt!405715 lt!405719) (get!13323 (getValueByKey!456 (toList!5381 lt!405715) lt!405719)))))

(declare-fun bs!25223 () Bool)

(assert (= bs!25223 d!111315))

(declare-fun m!835237 () Bool)

(assert (=> bs!25223 m!835237))

(assert (=> bs!25223 m!835237))

(declare-fun m!835239 () Bool)

(assert (=> bs!25223 m!835239))

(assert (=> b!898582 d!111315))

(declare-fun d!111317 () Bool)

(assert (=> d!111317 (= (apply!410 lt!405709 lt!405716) (get!13323 (getValueByKey!456 (toList!5381 lt!405709) lt!405716)))))

(declare-fun bs!25224 () Bool)

(assert (= bs!25224 d!111317))

(declare-fun m!835241 () Bool)

(assert (=> bs!25224 m!835241))

(assert (=> bs!25224 m!835241))

(declare-fun m!835243 () Bool)

(assert (=> bs!25224 m!835243))

(assert (=> b!898582 d!111317))

(declare-fun d!111319 () Bool)

(declare-fun e!502766 () Bool)

(assert (=> d!111319 e!502766))

(declare-fun res!607282 () Bool)

(assert (=> d!111319 (=> (not res!607282) (not e!502766))))

(declare-fun lt!405782 () ListLongMap!10731)

(assert (=> d!111319 (= res!607282 (contains!4410 lt!405782 (_1!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))))))

(declare-fun lt!405783 () List!17840)

(assert (=> d!111319 (= lt!405782 (ListLongMap!10732 lt!405783))))

(declare-fun lt!405784 () Unit!30538)

(declare-fun lt!405781 () Unit!30538)

(assert (=> d!111319 (= lt!405784 lt!405781)))

(assert (=> d!111319 (= (getValueByKey!456 lt!405783 (_1!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))))))

(assert (=> d!111319 (= lt!405781 (lemmaContainsTupThenGetReturnValue!248 lt!405783 (_1!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))))))

(assert (=> d!111319 (= lt!405783 (insertStrictlySorted!305 (toList!5381 lt!405715) (_1!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))))))

(assert (=> d!111319 (= (+!2591 lt!405715 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))) lt!405782)))

(declare-fun b!898713 () Bool)

(declare-fun res!607283 () Bool)

(assert (=> b!898713 (=> (not res!607283) (not e!502766))))

(assert (=> b!898713 (= res!607283 (= (getValueByKey!456 (toList!5381 lt!405782) (_1!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))))))))

(declare-fun b!898714 () Bool)

(assert (=> b!898714 (= e!502766 (contains!4413 (toList!5381 lt!405782) (tuple2!12035 lt!405707 (zeroValue!5233 thiss!1181))))))

(assert (= (and d!111319 res!607282) b!898713))

(assert (= (and b!898713 res!607283) b!898714))

(declare-fun m!835245 () Bool)

(assert (=> d!111319 m!835245))

(declare-fun m!835247 () Bool)

(assert (=> d!111319 m!835247))

(declare-fun m!835249 () Bool)

(assert (=> d!111319 m!835249))

(declare-fun m!835251 () Bool)

(assert (=> d!111319 m!835251))

(declare-fun m!835253 () Bool)

(assert (=> b!898713 m!835253))

(declare-fun m!835255 () Bool)

(assert (=> b!898714 m!835255))

(assert (=> b!898582 d!111319))

(declare-fun d!111321 () Bool)

(assert (=> d!111321 (= (apply!410 (+!2591 lt!405706 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))) lt!405703) (get!13323 (getValueByKey!456 (toList!5381 (+!2591 lt!405706 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))) lt!405703)))))

(declare-fun bs!25225 () Bool)

(assert (= bs!25225 d!111321))

(declare-fun m!835257 () Bool)

(assert (=> bs!25225 m!835257))

(assert (=> bs!25225 m!835257))

(declare-fun m!835259 () Bool)

(assert (=> bs!25225 m!835259))

(assert (=> b!898582 d!111321))

(declare-fun d!111323 () Bool)

(assert (=> d!111323 (= (apply!410 (+!2591 lt!405709 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181))) lt!405716) (get!13323 (getValueByKey!456 (toList!5381 (+!2591 lt!405709 (tuple2!12035 lt!405702 (minValue!5233 thiss!1181)))) lt!405716)))))

(declare-fun bs!25226 () Bool)

(assert (= bs!25226 d!111323))

(declare-fun m!835261 () Bool)

(assert (=> bs!25226 m!835261))

(assert (=> bs!25226 m!835261))

(declare-fun m!835263 () Bool)

(assert (=> bs!25226 m!835263))

(assert (=> b!898582 d!111323))

(declare-fun b!898739 () Bool)

(declare-fun e!502786 () ListLongMap!10731)

(declare-fun call!39883 () ListLongMap!10731)

(assert (=> b!898739 (= e!502786 call!39883)))

(declare-fun b!898740 () Bool)

(declare-fun e!502783 () ListLongMap!10731)

(assert (=> b!898740 (= e!502783 e!502786)))

(declare-fun c!95006 () Bool)

(assert (=> b!898740 (= c!95006 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898741 () Bool)

(declare-fun e!502782 () Bool)

(declare-fun lt!405803 () ListLongMap!10731)

(declare-fun isEmpty!685 (ListLongMap!10731) Bool)

(assert (=> b!898741 (= e!502782 (isEmpty!685 lt!405803))))

(declare-fun d!111325 () Bool)

(declare-fun e!502785 () Bool)

(assert (=> d!111325 e!502785))

(declare-fun res!607293 () Bool)

(assert (=> d!111325 (=> (not res!607293) (not e!502785))))

(assert (=> d!111325 (= res!607293 (not (contains!4410 lt!405803 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111325 (= lt!405803 e!502783)))

(declare-fun c!95009 () Bool)

(assert (=> d!111325 (= c!95009 (bvsge #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> d!111325 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111325 (= (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5413 thiss!1181)) lt!405803)))

(declare-fun b!898742 () Bool)

(declare-fun res!607295 () Bool)

(assert (=> b!898742 (=> (not res!607295) (not e!502785))))

(assert (=> b!898742 (= res!607295 (not (contains!4410 lt!405803 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898743 () Bool)

(assert (=> b!898743 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> b!898743 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25797 (_values!5420 thiss!1181))))))

(declare-fun e!502781 () Bool)

(assert (=> b!898743 (= e!502781 (= (apply!410 lt!405803 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)) (get!13322 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!898744 () Bool)

(declare-fun e!502787 () Bool)

(assert (=> b!898744 (= e!502787 e!502781)))

(assert (=> b!898744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun res!607292 () Bool)

(assert (=> b!898744 (= res!607292 (contains!4410 lt!405803 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898744 (=> (not res!607292) (not e!502781))))

(declare-fun b!898745 () Bool)

(assert (=> b!898745 (= e!502782 (= lt!405803 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5413 thiss!1181))))))

(declare-fun b!898746 () Bool)

(assert (=> b!898746 (= e!502787 e!502782)))

(declare-fun c!95008 () Bool)

(assert (=> b!898746 (= c!95008 (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun bm!39880 () Bool)

(assert (=> bm!39880 (= call!39883 (getCurrentListMapNoExtraKeys!3278 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5413 thiss!1181)))))

(declare-fun b!898747 () Bool)

(declare-fun lt!405804 () Unit!30538)

(declare-fun lt!405802 () Unit!30538)

(assert (=> b!898747 (= lt!405804 lt!405802)))

(declare-fun lt!405800 () (_ BitVec 64))

(declare-fun lt!405805 () ListLongMap!10731)

(declare-fun lt!405799 () V!29425)

(declare-fun lt!405801 () (_ BitVec 64))

(assert (=> b!898747 (not (contains!4410 (+!2591 lt!405805 (tuple2!12035 lt!405801 lt!405799)) lt!405800))))

(declare-fun addStillNotContains!214 (ListLongMap!10731 (_ BitVec 64) V!29425 (_ BitVec 64)) Unit!30538)

(assert (=> b!898747 (= lt!405802 (addStillNotContains!214 lt!405805 lt!405801 lt!405799 lt!405800))))

(assert (=> b!898747 (= lt!405800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!898747 (= lt!405799 (get!13322 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!898747 (= lt!405801 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898747 (= lt!405805 call!39883)))

(assert (=> b!898747 (= e!502786 (+!2591 call!39883 (tuple2!12035 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000) (get!13322 (select (arr!25342 (_values!5420 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5413 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!898748 () Bool)

(assert (=> b!898748 (= e!502783 (ListLongMap!10732 Nil!17837))))

(declare-fun b!898749 () Bool)

(assert (=> b!898749 (= e!502785 e!502787)))

(declare-fun c!95007 () Bool)

(declare-fun e!502784 () Bool)

(assert (=> b!898749 (= c!95007 e!502784)))

(declare-fun res!607294 () Bool)

(assert (=> b!898749 (=> (not res!607294) (not e!502784))))

(assert (=> b!898749 (= res!607294 (bvslt #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun b!898750 () Bool)

(assert (=> b!898750 (= e!502784 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898750 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!111325 c!95009) b!898748))

(assert (= (and d!111325 (not c!95009)) b!898740))

(assert (= (and b!898740 c!95006) b!898747))

(assert (= (and b!898740 (not c!95006)) b!898739))

(assert (= (or b!898747 b!898739) bm!39880))

(assert (= (and d!111325 res!607293) b!898742))

(assert (= (and b!898742 res!607295) b!898749))

(assert (= (and b!898749 res!607294) b!898750))

(assert (= (and b!898749 c!95007) b!898744))

(assert (= (and b!898749 (not c!95007)) b!898746))

(assert (= (and b!898744 res!607292) b!898743))

(assert (= (and b!898746 c!95008) b!898745))

(assert (= (and b!898746 (not c!95008)) b!898741))

(declare-fun b_lambda!12967 () Bool)

(assert (=> (not b_lambda!12967) (not b!898743)))

(assert (=> b!898743 t!25184))

(declare-fun b_and!26317 () Bool)

(assert (= b_and!26315 (and (=> t!25184 result!10151) b_and!26317)))

(declare-fun b_lambda!12969 () Bool)

(assert (=> (not b_lambda!12969) (not b!898747)))

(assert (=> b!898747 t!25184))

(declare-fun b_and!26319 () Bool)

(assert (= b_and!26317 (and (=> t!25184 result!10151) b_and!26319)))

(declare-fun m!835265 () Bool)

(assert (=> b!898741 m!835265))

(assert (=> b!898750 m!835035))

(assert (=> b!898750 m!835035))

(assert (=> b!898750 m!835055))

(declare-fun m!835267 () Bool)

(assert (=> d!111325 m!835267))

(assert (=> d!111325 m!834967))

(assert (=> b!898740 m!835035))

(assert (=> b!898740 m!835035))

(assert (=> b!898740 m!835055))

(assert (=> b!898743 m!835035))

(assert (=> b!898743 m!835051))

(assert (=> b!898743 m!835035))

(declare-fun m!835269 () Bool)

(assert (=> b!898743 m!835269))

(assert (=> b!898743 m!835047))

(assert (=> b!898743 m!835047))

(assert (=> b!898743 m!835051))

(assert (=> b!898743 m!835053))

(declare-fun m!835271 () Bool)

(assert (=> b!898747 m!835271))

(assert (=> b!898747 m!835035))

(assert (=> b!898747 m!835051))

(assert (=> b!898747 m!835047))

(declare-fun m!835273 () Bool)

(assert (=> b!898747 m!835273))

(assert (=> b!898747 m!835047))

(assert (=> b!898747 m!835051))

(assert (=> b!898747 m!835053))

(assert (=> b!898747 m!835271))

(declare-fun m!835275 () Bool)

(assert (=> b!898747 m!835275))

(declare-fun m!835277 () Bool)

(assert (=> b!898747 m!835277))

(declare-fun m!835279 () Bool)

(assert (=> b!898745 m!835279))

(declare-fun m!835281 () Bool)

(assert (=> b!898742 m!835281))

(assert (=> bm!39880 m!835279))

(assert (=> b!898744 m!835035))

(assert (=> b!898744 m!835035))

(declare-fun m!835283 () Bool)

(assert (=> b!898744 m!835283))

(assert (=> b!898582 d!111325))

(declare-fun d!111327 () Bool)

(declare-fun e!502788 () Bool)

(assert (=> d!111327 e!502788))

(declare-fun res!607296 () Bool)

(assert (=> d!111327 (=> (not res!607296) (not e!502788))))

(declare-fun lt!405807 () ListLongMap!10731)

(assert (=> d!111327 (= res!607296 (contains!4410 lt!405807 (_1!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))))))

(declare-fun lt!405808 () List!17840)

(assert (=> d!111327 (= lt!405807 (ListLongMap!10732 lt!405808))))

(declare-fun lt!405809 () Unit!30538)

(declare-fun lt!405806 () Unit!30538)

(assert (=> d!111327 (= lt!405809 lt!405806)))

(assert (=> d!111327 (= (getValueByKey!456 lt!405808 (_1!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))))))

(assert (=> d!111327 (= lt!405806 (lemmaContainsTupThenGetReturnValue!248 lt!405808 (_1!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))))))

(assert (=> d!111327 (= lt!405808 (insertStrictlySorted!305 (toList!5381 lt!405706) (_1!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))) (_2!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))))))

(assert (=> d!111327 (= (+!2591 lt!405706 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))) lt!405807)))

(declare-fun b!898751 () Bool)

(declare-fun res!607297 () Bool)

(assert (=> b!898751 (=> (not res!607297) (not e!502788))))

(assert (=> b!898751 (= res!607297 (= (getValueByKey!456 (toList!5381 lt!405807) (_1!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181)))) (Some!461 (_2!6028 (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))))))))

(declare-fun b!898752 () Bool)

(assert (=> b!898752 (= e!502788 (contains!4413 (toList!5381 lt!405807) (tuple2!12035 lt!405704 (minValue!5233 thiss!1181))))))

(assert (= (and d!111327 res!607296) b!898751))

(assert (= (and b!898751 res!607297) b!898752))

(declare-fun m!835285 () Bool)

(assert (=> d!111327 m!835285))

(declare-fun m!835287 () Bool)

(assert (=> d!111327 m!835287))

(declare-fun m!835289 () Bool)

(assert (=> d!111327 m!835289))

(declare-fun m!835291 () Bool)

(assert (=> d!111327 m!835291))

(declare-fun m!835293 () Bool)

(assert (=> b!898751 m!835293))

(declare-fun m!835295 () Bool)

(assert (=> b!898752 m!835295))

(assert (=> b!898582 d!111327))

(declare-fun d!111329 () Bool)

(declare-fun e!502789 () Bool)

(assert (=> d!111329 e!502789))

(declare-fun res!607298 () Bool)

(assert (=> d!111329 (=> res!607298 e!502789)))

(declare-fun lt!405813 () Bool)

(assert (=> d!111329 (= res!607298 (not lt!405813))))

(declare-fun lt!405810 () Bool)

(assert (=> d!111329 (= lt!405813 lt!405810)))

(declare-fun lt!405812 () Unit!30538)

(declare-fun e!502790 () Unit!30538)

(assert (=> d!111329 (= lt!405812 e!502790)))

(declare-fun c!95010 () Bool)

(assert (=> d!111329 (= c!95010 lt!405810)))

(assert (=> d!111329 (= lt!405810 (containsKey!425 (toList!5381 lt!405718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111329 (= (contains!4410 lt!405718 #b1000000000000000000000000000000000000000000000000000000000000000) lt!405813)))

(declare-fun b!898753 () Bool)

(declare-fun lt!405811 () Unit!30538)

(assert (=> b!898753 (= e!502790 lt!405811)))

(assert (=> b!898753 (= lt!405811 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5381 lt!405718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898753 (isDefined!330 (getValueByKey!456 (toList!5381 lt!405718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898754 () Bool)

(declare-fun Unit!30547 () Unit!30538)

(assert (=> b!898754 (= e!502790 Unit!30547)))

(declare-fun b!898755 () Bool)

(assert (=> b!898755 (= e!502789 (isDefined!330 (getValueByKey!456 (toList!5381 lt!405718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111329 c!95010) b!898753))

(assert (= (and d!111329 (not c!95010)) b!898754))

(assert (= (and d!111329 (not res!607298)) b!898755))

(declare-fun m!835297 () Bool)

(assert (=> d!111329 m!835297))

(declare-fun m!835299 () Bool)

(assert (=> b!898753 m!835299))

(assert (=> b!898753 m!835141))

(assert (=> b!898753 m!835141))

(declare-fun m!835301 () Bool)

(assert (=> b!898753 m!835301))

(assert (=> b!898755 m!835141))

(assert (=> b!898755 m!835141))

(assert (=> b!898755 m!835301))

(assert (=> bm!39872 d!111329))

(declare-fun b!898768 () Bool)

(declare-fun e!502797 () SeekEntryResult!8926)

(assert (=> b!898768 (= e!502797 Undefined!8926)))

(declare-fun b!898769 () Bool)

(declare-fun e!502798 () SeekEntryResult!8926)

(assert (=> b!898769 (= e!502798 (MissingVacant!8926 (index!38077 lt!405635)))))

(declare-fun b!898770 () Bool)

(assert (=> b!898770 (= e!502798 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76573 lt!405635) #b00000000000000000000000000000001) (nextIndex!0 (index!38077 lt!405635) (x!76573 lt!405635) (mask!26143 thiss!1181)) (index!38077 lt!405635) key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun b!898771 () Bool)

(declare-fun e!502799 () SeekEntryResult!8926)

(assert (=> b!898771 (= e!502797 e!502799)))

(declare-fun c!95018 () Bool)

(declare-fun lt!405818 () (_ BitVec 64))

(assert (=> b!898771 (= c!95018 (= lt!405818 key!785))))

(declare-fun lt!405819 () SeekEntryResult!8926)

(declare-fun d!111331 () Bool)

(assert (=> d!111331 (and (or ((_ is Undefined!8926) lt!405819) (not ((_ is Found!8926) lt!405819)) (and (bvsge (index!38076 lt!405819) #b00000000000000000000000000000000) (bvslt (index!38076 lt!405819) (size!25796 (_keys!10188 thiss!1181))))) (or ((_ is Undefined!8926) lt!405819) ((_ is Found!8926) lt!405819) (not ((_ is MissingVacant!8926) lt!405819)) (not (= (index!38078 lt!405819) (index!38077 lt!405635))) (and (bvsge (index!38078 lt!405819) #b00000000000000000000000000000000) (bvslt (index!38078 lt!405819) (size!25796 (_keys!10188 thiss!1181))))) (or ((_ is Undefined!8926) lt!405819) (ite ((_ is Found!8926) lt!405819) (= (select (arr!25341 (_keys!10188 thiss!1181)) (index!38076 lt!405819)) key!785) (and ((_ is MissingVacant!8926) lt!405819) (= (index!38078 lt!405819) (index!38077 lt!405635)) (= (select (arr!25341 (_keys!10188 thiss!1181)) (index!38078 lt!405819)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111331 (= lt!405819 e!502797)))

(declare-fun c!95017 () Bool)

(assert (=> d!111331 (= c!95017 (bvsge (x!76573 lt!405635) #b01111111111111111111111111111110))))

(assert (=> d!111331 (= lt!405818 (select (arr!25341 (_keys!10188 thiss!1181)) (index!38077 lt!405635)))))

(assert (=> d!111331 (validMask!0 (mask!26143 thiss!1181))))

(assert (=> d!111331 (= (seekKeyOrZeroReturnVacant!0 (x!76573 lt!405635) (index!38077 lt!405635) (index!38077 lt!405635) key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)) lt!405819)))

(declare-fun b!898772 () Bool)

(assert (=> b!898772 (= e!502799 (Found!8926 (index!38077 lt!405635)))))

(declare-fun b!898773 () Bool)

(declare-fun c!95019 () Bool)

(assert (=> b!898773 (= c!95019 (= lt!405818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898773 (= e!502799 e!502798)))

(assert (= (and d!111331 c!95017) b!898768))

(assert (= (and d!111331 (not c!95017)) b!898771))

(assert (= (and b!898771 c!95018) b!898772))

(assert (= (and b!898771 (not c!95018)) b!898773))

(assert (= (and b!898773 c!95019) b!898769))

(assert (= (and b!898773 (not c!95019)) b!898770))

(declare-fun m!835303 () Bool)

(assert (=> b!898770 m!835303))

(assert (=> b!898770 m!835303))

(declare-fun m!835305 () Bool)

(assert (=> b!898770 m!835305))

(declare-fun m!835307 () Bool)

(assert (=> d!111331 m!835307))

(declare-fun m!835309 () Bool)

(assert (=> d!111331 m!835309))

(assert (=> d!111331 m!835017))

(assert (=> d!111331 m!834967))

(assert (=> b!898514 d!111331))

(assert (=> d!111243 d!111245))

(declare-fun d!111333 () Bool)

(declare-fun e!502802 () Bool)

(assert (=> d!111333 e!502802))

(declare-fun res!607301 () Bool)

(assert (=> d!111333 (=> res!607301 e!502802)))

(declare-fun lt!405822 () SeekEntryResult!8926)

(assert (=> d!111333 (= res!607301 (not ((_ is Found!8926) lt!405822)))))

(assert (=> d!111333 (= lt!405822 (seekEntry!0 key!785 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(assert (=> d!111333 true))

(declare-fun _$36!366 () Unit!30538)

(assert (=> d!111333 (= (choose!1490 (_keys!10188 thiss!1181) (_values!5420 thiss!1181) (mask!26143 thiss!1181) (extraKeys!5129 thiss!1181) (zeroValue!5233 thiss!1181) (minValue!5233 thiss!1181) key!785) _$36!366)))

(declare-fun b!898776 () Bool)

(assert (=> b!898776 (= e!502802 (inRange!0 (index!38076 lt!405822) (mask!26143 thiss!1181)))))

(assert (= (and d!111333 (not res!607301)) b!898776))

(assert (=> d!111333 m!834963))

(declare-fun m!835311 () Bool)

(assert (=> b!898776 m!835311))

(assert (=> d!111243 d!111333))

(assert (=> d!111243 d!111249))

(assert (=> bm!39873 d!111325))

(declare-fun b!898785 () Bool)

(declare-fun res!607313 () Bool)

(declare-fun e!502805 () Bool)

(assert (=> b!898785 (=> (not res!607313) (not e!502805))))

(assert (=> b!898785 (= res!607313 (and (= (size!25797 (_values!5420 thiss!1181)) (bvadd (mask!26143 thiss!1181) #b00000000000000000000000000000001)) (= (size!25796 (_keys!10188 thiss!1181)) (size!25797 (_values!5420 thiss!1181))) (bvsge (_size!2254 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2254 thiss!1181) (bvadd (mask!26143 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111335 () Bool)

(declare-fun res!607311 () Bool)

(assert (=> d!111335 (=> (not res!607311) (not e!502805))))

(assert (=> d!111335 (= res!607311 (validMask!0 (mask!26143 thiss!1181)))))

(assert (=> d!111335 (= (simpleValid!324 thiss!1181) e!502805)))

(declare-fun b!898787 () Bool)

(declare-fun res!607312 () Bool)

(assert (=> b!898787 (=> (not res!607312) (not e!502805))))

(declare-fun size!25800 (LongMapFixedSize!4398) (_ BitVec 32))

(assert (=> b!898787 (= res!607312 (= (size!25800 thiss!1181) (bvadd (_size!2254 thiss!1181) (bvsdiv (bvadd (extraKeys!5129 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!898788 () Bool)

(assert (=> b!898788 (= e!502805 (and (bvsge (extraKeys!5129 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5129 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2254 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!898786 () Bool)

(declare-fun res!607310 () Bool)

(assert (=> b!898786 (=> (not res!607310) (not e!502805))))

(assert (=> b!898786 (= res!607310 (bvsge (size!25800 thiss!1181) (_size!2254 thiss!1181)))))

(assert (= (and d!111335 res!607311) b!898785))

(assert (= (and b!898785 res!607313) b!898786))

(assert (= (and b!898786 res!607310) b!898787))

(assert (= (and b!898787 res!607312) b!898788))

(assert (=> d!111335 m!834967))

(declare-fun m!835313 () Bool)

(assert (=> b!898787 m!835313))

(assert (=> b!898786 m!835313))

(assert (=> d!111259 d!111335))

(declare-fun d!111337 () Bool)

(declare-fun res!607314 () Bool)

(declare-fun e!502806 () Bool)

(assert (=> d!111337 (=> res!607314 e!502806)))

(assert (=> d!111337 (= res!607314 (= (select (arr!25341 (_keys!10188 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111337 (= (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!502806)))

(declare-fun b!898789 () Bool)

(declare-fun e!502807 () Bool)

(assert (=> b!898789 (= e!502806 e!502807)))

(declare-fun res!607315 () Bool)

(assert (=> b!898789 (=> (not res!607315) (not e!502807))))

(assert (=> b!898789 (= res!607315 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25796 (_keys!10188 thiss!1181))))))

(declare-fun b!898790 () Bool)

(assert (=> b!898790 (= e!502807 (arrayContainsKey!0 (_keys!10188 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111337 (not res!607314)) b!898789))

(assert (= (and b!898789 res!607315) b!898790))

(declare-fun m!835315 () Bool)

(assert (=> d!111337 m!835315))

(declare-fun m!835317 () Bool)

(assert (=> b!898790 m!835317))

(assert (=> b!898530 d!111337))

(declare-fun b!898799 () Bool)

(declare-fun e!502813 () (_ BitVec 32))

(assert (=> b!898799 (= e!502813 #b00000000000000000000000000000000)))

(declare-fun d!111339 () Bool)

(declare-fun lt!405825 () (_ BitVec 32))

(assert (=> d!111339 (and (bvsge lt!405825 #b00000000000000000000000000000000) (bvsle lt!405825 (bvsub (size!25796 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111339 (= lt!405825 e!502813)))

(declare-fun c!95024 () Bool)

(assert (=> d!111339 (= c!95024 (bvsge #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> d!111339 (and (bvsle #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25796 (_keys!10188 thiss!1181)) (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> d!111339 (= (arrayCountValidKeys!0 (_keys!10188 thiss!1181) #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))) lt!405825)))

(declare-fun b!898800 () Bool)

(declare-fun e!502812 () (_ BitVec 32))

(declare-fun call!39886 () (_ BitVec 32))

(assert (=> b!898800 (= e!502812 (bvadd #b00000000000000000000000000000001 call!39886))))

(declare-fun b!898801 () Bool)

(assert (=> b!898801 (= e!502812 call!39886)))

(declare-fun b!898802 () Bool)

(assert (=> b!898802 (= e!502813 e!502812)))

(declare-fun c!95025 () Bool)

(assert (=> b!898802 (= c!95025 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39883 () Bool)

(assert (=> bm!39883 (= call!39886 (arrayCountValidKeys!0 (_keys!10188 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25796 (_keys!10188 thiss!1181))))))

(assert (= (and d!111339 c!95024) b!898799))

(assert (= (and d!111339 (not c!95024)) b!898802))

(assert (= (and b!898802 c!95025) b!898800))

(assert (= (and b!898802 (not c!95025)) b!898801))

(assert (= (or b!898800 b!898801) bm!39883))

(assert (=> b!898802 m!835035))

(assert (=> b!898802 m!835035))

(assert (=> b!898802 m!835055))

(declare-fun m!835319 () Bool)

(assert (=> bm!39883 m!835319))

(assert (=> b!898605 d!111339))

(declare-fun b!898811 () Bool)

(declare-fun e!502822 () Bool)

(declare-fun call!39889 () Bool)

(assert (=> b!898811 (= e!502822 call!39889)))

(declare-fun bm!39886 () Bool)

(assert (=> bm!39886 (= call!39889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10188 thiss!1181) (mask!26143 thiss!1181)))))

(declare-fun b!898812 () Bool)

(declare-fun e!502820 () Bool)

(assert (=> b!898812 (= e!502820 e!502822)))

(declare-fun c!95028 () Bool)

(assert (=> b!898812 (= c!95028 (validKeyInArray!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111341 () Bool)

(declare-fun res!607321 () Bool)

(assert (=> d!111341 (=> res!607321 e!502820)))

(assert (=> d!111341 (= res!607321 (bvsge #b00000000000000000000000000000000 (size!25796 (_keys!10188 thiss!1181))))))

(assert (=> d!111341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10188 thiss!1181) (mask!26143 thiss!1181)) e!502820)))

(declare-fun b!898813 () Bool)

(declare-fun e!502821 () Bool)

(assert (=> b!898813 (= e!502821 call!39889)))

(declare-fun b!898814 () Bool)

(assert (=> b!898814 (= e!502822 e!502821)))

(declare-fun lt!405833 () (_ BitVec 64))

(assert (=> b!898814 (= lt!405833 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405834 () Unit!30538)

(assert (=> b!898814 (= lt!405834 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10188 thiss!1181) lt!405833 #b00000000000000000000000000000000))))

(assert (=> b!898814 (arrayContainsKey!0 (_keys!10188 thiss!1181) lt!405833 #b00000000000000000000000000000000)))

(declare-fun lt!405832 () Unit!30538)

(assert (=> b!898814 (= lt!405832 lt!405834)))

(declare-fun res!607320 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52728 (_ BitVec 32)) SeekEntryResult!8926)

(assert (=> b!898814 (= res!607320 (= (seekEntryOrOpen!0 (select (arr!25341 (_keys!10188 thiss!1181)) #b00000000000000000000000000000000) (_keys!10188 thiss!1181) (mask!26143 thiss!1181)) (Found!8926 #b00000000000000000000000000000000)))))

(assert (=> b!898814 (=> (not res!607320) (not e!502821))))

(assert (= (and d!111341 (not res!607321)) b!898812))

(assert (= (and b!898812 c!95028) b!898814))

(assert (= (and b!898812 (not c!95028)) b!898811))

(assert (= (and b!898814 res!607320) b!898813))

(assert (= (or b!898813 b!898811) bm!39886))

(declare-fun m!835321 () Bool)

(assert (=> bm!39886 m!835321))

(assert (=> b!898812 m!835035))

(assert (=> b!898812 m!835035))

(assert (=> b!898812 m!835055))

(assert (=> b!898814 m!835035))

(declare-fun m!835323 () Bool)

(assert (=> b!898814 m!835323))

(declare-fun m!835325 () Bool)

(assert (=> b!898814 m!835325))

(assert (=> b!898814 m!835035))

(declare-fun m!835327 () Bool)

(assert (=> b!898814 m!835327))

(assert (=> b!898606 d!111341))

(declare-fun d!111343 () Bool)

(assert (=> d!111343 (= (apply!410 lt!405718 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13323 (getValueByKey!456 (toList!5381 lt!405718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25227 () Bool)

(assert (= bs!25227 d!111343))

(assert (=> bs!25227 m!835157))

(assert (=> bs!25227 m!835157))

(declare-fun m!835329 () Bool)

(assert (=> bs!25227 m!835329))

(assert (=> b!898588 d!111343))

(assert (=> d!111257 d!111249))

(declare-fun d!111345 () Bool)

(assert (=> d!111345 (= (inRange!0 (index!38076 lt!405625) (mask!26143 thiss!1181)) (and (bvsge (index!38076 lt!405625) #b00000000000000000000000000000000) (bvslt (index!38076 lt!405625) (bvadd (mask!26143 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898497 d!111345))

(declare-fun condMapEmpty!29179 () Bool)

(declare-fun mapDefault!29179 () ValueCell!8691)

(assert (=> mapNonEmpty!29178 (= condMapEmpty!29179 (= mapRest!29178 ((as const (Array (_ BitVec 32) ValueCell!8691)) mapDefault!29179)))))

(declare-fun e!502824 () Bool)

(declare-fun mapRes!29179 () Bool)

(assert (=> mapNonEmpty!29178 (= tp!56129 (and e!502824 mapRes!29179))))

(declare-fun mapNonEmpty!29179 () Bool)

(declare-fun tp!56130 () Bool)

(declare-fun e!502823 () Bool)

(assert (=> mapNonEmpty!29179 (= mapRes!29179 (and tp!56130 e!502823))))

(declare-fun mapValue!29179 () ValueCell!8691)

(declare-fun mapKey!29179 () (_ BitVec 32))

(declare-fun mapRest!29179 () (Array (_ BitVec 32) ValueCell!8691))

(assert (=> mapNonEmpty!29179 (= mapRest!29178 (store mapRest!29179 mapKey!29179 mapValue!29179))))

(declare-fun b!898815 () Bool)

(assert (=> b!898815 (= e!502823 tp_is_empty!18345)))

(declare-fun mapIsEmpty!29179 () Bool)

(assert (=> mapIsEmpty!29179 mapRes!29179))

(declare-fun b!898816 () Bool)

(assert (=> b!898816 (= e!502824 tp_is_empty!18345)))

(assert (= (and mapNonEmpty!29178 condMapEmpty!29179) mapIsEmpty!29179))

(assert (= (and mapNonEmpty!29178 (not condMapEmpty!29179)) mapNonEmpty!29179))

(assert (= (and mapNonEmpty!29179 ((_ is ValueCellFull!8691) mapValue!29179)) b!898815))

(assert (= (and mapNonEmpty!29178 ((_ is ValueCellFull!8691) mapDefault!29179)) b!898816))

(declare-fun m!835331 () Bool)

(assert (=> mapNonEmpty!29179 m!835331))

(declare-fun b_lambda!12971 () Bool)

(assert (= b_lambda!12969 (or (and b!898464 b_free!16017) b_lambda!12971)))

(declare-fun b_lambda!12973 () Bool)

(assert (= b_lambda!12967 (or (and b!898464 b_free!16017) b_lambda!12973)))

(check-sat (not b_lambda!12971) (not b!898812) (not b!898744) (not d!111297) (not b!898752) (not b!898709) (not b!898790) (not d!111301) (not b!898751) (not b_lambda!12965) (not d!111307) (not d!111281) (not b!898627) (not d!111327) (not b!898701) (not b!898688) (not b!898685) (not b!898696) (not d!111267) (not b!898753) (not b!898707) (not d!111325) (not d!111313) (not b!898750) (not b!898742) (not b!898741) (not bm!39877) (not b!898714) (not b!898786) (not mapNonEmpty!29179) (not d!111321) (not d!111319) tp_is_empty!18345 b_and!26319 (not d!111335) (not b_next!16017) (not d!111309) (not b!898776) (not bm!39883) (not b!898698) (not d!111289) (not d!111295) (not d!111323) (not b!898743) (not d!111317) (not d!111305) (not b_lambda!12973) (not b!898656) (not b!898687) (not d!111271) (not d!111287) (not bm!39886) (not b!898633) (not d!111279) (not b!898706) (not d!111333) (not b!898745) (not d!111273) (not b!898708) (not d!111303) (not b!898695) (not b!898657) (not b!898740) (not d!111283) (not d!111329) (not b!898689) (not b!898699) (not b!898713) (not d!111315) (not b!898644) (not b!898787) (not b!898814) (not d!111299) (not b!898679) (not b!898747) (not b!898626) (not b!898650) (not d!111331) (not b!898755) (not d!111293) (not bm!39880) (not d!111265) (not d!111343) (not b!898651) (not d!111311) (not b!898802) (not b!898770) (not b!898629))
(check-sat b_and!26319 (not b_next!16017))
