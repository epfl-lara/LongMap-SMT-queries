; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80176 () Bool)

(assert start!80176)

(declare-fun b!941532 () Bool)

(declare-fun b_free!17863 () Bool)

(declare-fun b_next!17863 () Bool)

(assert (=> b!941532 (= b_free!17863 (not b_next!17863))))

(declare-fun tp!62064 () Bool)

(declare-fun b_and!29285 () Bool)

(assert (=> b!941532 (= tp!62064 b_and!29285)))

(declare-fun b!941529 () Bool)

(declare-fun e!529234 () Bool)

(declare-fun tp_is_empty!20371 () Bool)

(assert (=> b!941529 (= e!529234 tp_is_empty!20371)))

(declare-fun b!941530 () Bool)

(declare-fun e!529230 () Bool)

(declare-fun mapRes!32347 () Bool)

(assert (=> b!941530 (= e!529230 (and e!529234 mapRes!32347))))

(declare-fun condMapEmpty!32347 () Bool)

(declare-datatypes ((V!32127 0))(
  ( (V!32128 (val!10236 Int)) )
))
(declare-datatypes ((ValueCell!9704 0))(
  ( (ValueCellFull!9704 (v!12764 V!32127)) (EmptyCell!9704) )
))
(declare-datatypes ((array!56741 0))(
  ( (array!56742 (arr!27301 (Array (_ BitVec 32) ValueCell!9704)) (size!27763 (_ BitVec 32))) )
))
(declare-datatypes ((array!56743 0))(
  ( (array!56744 (arr!27302 (Array (_ BitVec 32) (_ BitVec 64))) (size!27764 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4558 0))(
  ( (LongMapFixedSize!4559 (defaultEntry!5570 Int) (mask!27158 (_ BitVec 32)) (extraKeys!5302 (_ BitVec 32)) (zeroValue!5406 V!32127) (minValue!5406 V!32127) (_size!2334 (_ BitVec 32)) (_keys!10448 array!56743) (_values!5593 array!56741) (_vacant!2334 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4558)

(declare-fun mapDefault!32347 () ValueCell!9704)

(assert (=> b!941530 (= condMapEmpty!32347 (= (arr!27301 (_values!5593 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9704)) mapDefault!32347)))))

(declare-fun b!941531 () Bool)

(declare-fun res!632806 () Bool)

(declare-fun e!529233 () Bool)

(assert (=> b!941531 (=> res!632806 e!529233)))

(assert (=> b!941531 (= res!632806 (or (not (= (size!27763 (_values!5593 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27158 thiss!1141)))) (not (= (size!27764 (_keys!10448 thiss!1141)) (size!27763 (_values!5593 thiss!1141)))) (bvslt (mask!27158 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5302 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5302 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun e!529227 () Bool)

(declare-fun array_inv!21312 (array!56743) Bool)

(declare-fun array_inv!21313 (array!56741) Bool)

(assert (=> b!941532 (= e!529227 (and tp!62064 tp_is_empty!20371 (array_inv!21312 (_keys!10448 thiss!1141)) (array_inv!21313 (_values!5593 thiss!1141)) e!529230))))

(declare-fun b!941533 () Bool)

(assert (=> b!941533 (= e!529233 true)))

(declare-fun lt!425129 () Bool)

(declare-datatypes ((List!19177 0))(
  ( (Nil!19174) (Cons!19173 (h!20325 (_ BitVec 64)) (t!27484 List!19177)) )
))
(declare-fun arrayNoDuplicates!0 (array!56743 (_ BitVec 32) List!19177) Bool)

(assert (=> b!941533 (= lt!425129 (arrayNoDuplicates!0 (_keys!10448 thiss!1141) #b00000000000000000000000000000000 Nil!19174))))

(declare-fun b!941534 () Bool)

(declare-fun res!632807 () Bool)

(declare-fun e!529229 () Bool)

(assert (=> b!941534 (=> (not res!632807) (not e!529229))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941534 (= res!632807 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941535 () Bool)

(declare-fun e!529231 () Bool)

(assert (=> b!941535 (= e!529229 e!529231)))

(declare-fun res!632810 () Bool)

(assert (=> b!941535 (=> (not res!632810) (not e!529231))))

(declare-datatypes ((SeekEntryResult!8958 0))(
  ( (MissingZero!8958 (index!38203 (_ BitVec 32))) (Found!8958 (index!38204 (_ BitVec 32))) (Intermediate!8958 (undefined!9770 Bool) (index!38205 (_ BitVec 32)) (x!80649 (_ BitVec 32))) (Undefined!8958) (MissingVacant!8958 (index!38206 (_ BitVec 32))) )
))
(declare-fun lt!425127 () SeekEntryResult!8958)

(get-info :version)

(assert (=> b!941535 (= res!632810 ((_ is Found!8958) lt!425127))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56743 (_ BitVec 32)) SeekEntryResult!8958)

(assert (=> b!941535 (= lt!425127 (seekEntry!0 key!756 (_keys!10448 thiss!1141) (mask!27158 thiss!1141)))))

(declare-fun res!632811 () Bool)

(assert (=> start!80176 (=> (not res!632811) (not e!529229))))

(declare-fun valid!1754 (LongMapFixedSize!4558) Bool)

(assert (=> start!80176 (= res!632811 (valid!1754 thiss!1141))))

(assert (=> start!80176 e!529229))

(assert (=> start!80176 e!529227))

(assert (=> start!80176 true))

(declare-fun mapNonEmpty!32347 () Bool)

(declare-fun tp!62065 () Bool)

(declare-fun e!529228 () Bool)

(assert (=> mapNonEmpty!32347 (= mapRes!32347 (and tp!62065 e!529228))))

(declare-fun mapKey!32347 () (_ BitVec 32))

(declare-fun mapRest!32347 () (Array (_ BitVec 32) ValueCell!9704))

(declare-fun mapValue!32347 () ValueCell!9704)

(assert (=> mapNonEmpty!32347 (= (arr!27301 (_values!5593 thiss!1141)) (store mapRest!32347 mapKey!32347 mapValue!32347))))

(declare-fun mapIsEmpty!32347 () Bool)

(assert (=> mapIsEmpty!32347 mapRes!32347))

(declare-fun b!941536 () Bool)

(declare-fun res!632809 () Bool)

(assert (=> b!941536 (=> res!632809 e!529233)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56743 (_ BitVec 32)) Bool)

(assert (=> b!941536 (= res!632809 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10448 thiss!1141) (mask!27158 thiss!1141))))))

(declare-fun b!941537 () Bool)

(assert (=> b!941537 (= e!529231 (not e!529233))))

(declare-fun res!632808 () Bool)

(assert (=> b!941537 (=> res!632808 e!529233)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941537 (= res!632808 (not (validMask!0 (mask!27158 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941537 (arrayContainsKey!0 (_keys!10448 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31756 0))(
  ( (Unit!31757) )
))
(declare-fun lt!425128 () Unit!31756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56743 (_ BitVec 64) (_ BitVec 32)) Unit!31756)

(assert (=> b!941537 (= lt!425128 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10448 thiss!1141) key!756 (index!38204 lt!425127)))))

(declare-fun b!941538 () Bool)

(assert (=> b!941538 (= e!529228 tp_is_empty!20371)))

(assert (= (and start!80176 res!632811) b!941534))

(assert (= (and b!941534 res!632807) b!941535))

(assert (= (and b!941535 res!632810) b!941537))

(assert (= (and b!941537 (not res!632808)) b!941531))

(assert (= (and b!941531 (not res!632806)) b!941536))

(assert (= (and b!941536 (not res!632809)) b!941533))

(assert (= (and b!941530 condMapEmpty!32347) mapIsEmpty!32347))

(assert (= (and b!941530 (not condMapEmpty!32347)) mapNonEmpty!32347))

(assert (= (and mapNonEmpty!32347 ((_ is ValueCellFull!9704) mapValue!32347)) b!941538))

(assert (= (and b!941530 ((_ is ValueCellFull!9704) mapDefault!32347)) b!941529))

(assert (= b!941532 b!941530))

(assert (= start!80176 b!941532))

(declare-fun m!877307 () Bool)

(assert (=> b!941533 m!877307))

(declare-fun m!877309 () Bool)

(assert (=> b!941536 m!877309))

(declare-fun m!877311 () Bool)

(assert (=> b!941532 m!877311))

(declare-fun m!877313 () Bool)

(assert (=> b!941532 m!877313))

(declare-fun m!877315 () Bool)

(assert (=> b!941537 m!877315))

(declare-fun m!877317 () Bool)

(assert (=> b!941537 m!877317))

(declare-fun m!877319 () Bool)

(assert (=> b!941537 m!877319))

(declare-fun m!877321 () Bool)

(assert (=> b!941535 m!877321))

(declare-fun m!877323 () Bool)

(assert (=> mapNonEmpty!32347 m!877323))

(declare-fun m!877325 () Bool)

(assert (=> start!80176 m!877325))

(check-sat tp_is_empty!20371 (not start!80176) (not mapNonEmpty!32347) (not b!941533) (not b!941536) (not b!941535) (not b!941537) (not b_next!17863) b_and!29285 (not b!941532))
(check-sat b_and!29285 (not b_next!17863))
