; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80004 () Bool)

(assert start!80004)

(declare-fun b!940574 () Bool)

(declare-fun b_free!17859 () Bool)

(declare-fun b_next!17859 () Bool)

(assert (=> b!940574 (= b_free!17859 (not b_next!17859))))

(declare-fun tp!62051 () Bool)

(declare-fun b_and!29271 () Bool)

(assert (=> b!940574 (= tp!62051 b_and!29271)))

(declare-fun b!940566 () Bool)

(declare-fun e!528598 () Bool)

(declare-fun e!528604 () Bool)

(declare-fun mapRes!32341 () Bool)

(assert (=> b!940566 (= e!528598 (and e!528604 mapRes!32341))))

(declare-fun condMapEmpty!32341 () Bool)

(declare-datatypes ((V!32121 0))(
  ( (V!32122 (val!10234 Int)) )
))
(declare-datatypes ((ValueCell!9702 0))(
  ( (ValueCellFull!9702 (v!12765 V!32121)) (EmptyCell!9702) )
))
(declare-datatypes ((array!56682 0))(
  ( (array!56683 (arr!27276 (Array (_ BitVec 32) ValueCell!9702)) (size!27737 (_ BitVec 32))) )
))
(declare-datatypes ((array!56684 0))(
  ( (array!56685 (arr!27277 (Array (_ BitVec 32) (_ BitVec 64))) (size!27738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4554 0))(
  ( (LongMapFixedSize!4555 (defaultEntry!5568 Int) (mask!27111 (_ BitVec 32)) (extraKeys!5300 (_ BitVec 32)) (zeroValue!5404 V!32121) (minValue!5404 V!32121) (_size!2332 (_ BitVec 32)) (_keys!10418 array!56684) (_values!5591 array!56682) (_vacant!2332 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4554)

(declare-fun mapDefault!32341 () ValueCell!9702)

(assert (=> b!940566 (= condMapEmpty!32341 (= (arr!27276 (_values!5591 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9702)) mapDefault!32341)))))

(declare-fun b!940567 () Bool)

(declare-fun e!528603 () Bool)

(declare-fun tp_is_empty!20367 () Bool)

(assert (=> b!940567 (= e!528603 tp_is_empty!20367)))

(declare-fun b!940568 () Bool)

(assert (=> b!940568 (= e!528604 tp_is_empty!20367)))

(declare-fun b!940569 () Bool)

(declare-fun e!528597 () Bool)

(declare-fun e!528600 () Bool)

(assert (=> b!940569 (= e!528597 (not e!528600))))

(declare-fun res!632428 () Bool)

(assert (=> b!940569 (=> res!632428 e!528600)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940569 (= res!632428 (not (validMask!0 (mask!27111 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940569 (arrayContainsKey!0 (_keys!10418 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31770 0))(
  ( (Unit!31771) )
))
(declare-fun lt!424748 () Unit!31770)

(declare-datatypes ((SeekEntryResult!9002 0))(
  ( (MissingZero!9002 (index!38379 (_ BitVec 32))) (Found!9002 (index!38380 (_ BitVec 32))) (Intermediate!9002 (undefined!9814 Bool) (index!38381 (_ BitVec 32)) (x!80671 (_ BitVec 32))) (Undefined!9002) (MissingVacant!9002 (index!38382 (_ BitVec 32))) )
))
(declare-fun lt!424750 () SeekEntryResult!9002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56684 (_ BitVec 64) (_ BitVec 32)) Unit!31770)

(assert (=> b!940569 (= lt!424748 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10418 thiss!1141) key!756 (index!38380 lt!424750)))))

(declare-fun b!940570 () Bool)

(assert (=> b!940570 (= e!528600 true)))

(declare-fun lt!424749 () Bool)

(declare-datatypes ((List!19191 0))(
  ( (Nil!19188) (Cons!19187 (h!20333 (_ BitVec 64)) (t!27506 List!19191)) )
))
(declare-fun arrayNoDuplicates!0 (array!56684 (_ BitVec 32) List!19191) Bool)

(assert (=> b!940570 (= lt!424749 (arrayNoDuplicates!0 (_keys!10418 thiss!1141) #b00000000000000000000000000000000 Nil!19188))))

(declare-fun b!940571 () Bool)

(declare-fun res!632431 () Bool)

(assert (=> b!940571 (=> res!632431 e!528600)))

(assert (=> b!940571 (= res!632431 (or (not (= (size!27737 (_values!5591 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27111 thiss!1141)))) (not (= (size!27738 (_keys!10418 thiss!1141)) (size!27737 (_values!5591 thiss!1141)))) (bvslt (mask!27111 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5300 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5300 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!632430 () Bool)

(declare-fun e!528602 () Bool)

(assert (=> start!80004 (=> (not res!632430) (not e!528602))))

(declare-fun valid!1747 (LongMapFixedSize!4554) Bool)

(assert (=> start!80004 (= res!632430 (valid!1747 thiss!1141))))

(assert (=> start!80004 e!528602))

(declare-fun e!528601 () Bool)

(assert (=> start!80004 e!528601))

(assert (=> start!80004 true))

(declare-fun b!940572 () Bool)

(assert (=> b!940572 (= e!528602 e!528597)))

(declare-fun res!632427 () Bool)

(assert (=> b!940572 (=> (not res!632427) (not e!528597))))

(get-info :version)

(assert (=> b!940572 (= res!632427 ((_ is Found!9002) lt!424750))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56684 (_ BitVec 32)) SeekEntryResult!9002)

(assert (=> b!940572 (= lt!424750 (seekEntry!0 key!756 (_keys!10418 thiss!1141) (mask!27111 thiss!1141)))))

(declare-fun mapNonEmpty!32341 () Bool)

(declare-fun tp!62052 () Bool)

(assert (=> mapNonEmpty!32341 (= mapRes!32341 (and tp!62052 e!528603))))

(declare-fun mapValue!32341 () ValueCell!9702)

(declare-fun mapKey!32341 () (_ BitVec 32))

(declare-fun mapRest!32341 () (Array (_ BitVec 32) ValueCell!9702))

(assert (=> mapNonEmpty!32341 (= (arr!27276 (_values!5591 thiss!1141)) (store mapRest!32341 mapKey!32341 mapValue!32341))))

(declare-fun mapIsEmpty!32341 () Bool)

(assert (=> mapIsEmpty!32341 mapRes!32341))

(declare-fun b!940573 () Bool)

(declare-fun res!632429 () Bool)

(assert (=> b!940573 (=> res!632429 e!528600)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56684 (_ BitVec 32)) Bool)

(assert (=> b!940573 (= res!632429 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10418 thiss!1141) (mask!27111 thiss!1141))))))

(declare-fun array_inv!21202 (array!56684) Bool)

(declare-fun array_inv!21203 (array!56682) Bool)

(assert (=> b!940574 (= e!528601 (and tp!62051 tp_is_empty!20367 (array_inv!21202 (_keys!10418 thiss!1141)) (array_inv!21203 (_values!5591 thiss!1141)) e!528598))))

(declare-fun b!940575 () Bool)

(declare-fun res!632426 () Bool)

(assert (=> b!940575 (=> (not res!632426) (not e!528602))))

(assert (=> b!940575 (= res!632426 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80004 res!632430) b!940575))

(assert (= (and b!940575 res!632426) b!940572))

(assert (= (and b!940572 res!632427) b!940569))

(assert (= (and b!940569 (not res!632428)) b!940571))

(assert (= (and b!940571 (not res!632431)) b!940573))

(assert (= (and b!940573 (not res!632429)) b!940570))

(assert (= (and b!940566 condMapEmpty!32341) mapIsEmpty!32341))

(assert (= (and b!940566 (not condMapEmpty!32341)) mapNonEmpty!32341))

(assert (= (and mapNonEmpty!32341 ((_ is ValueCellFull!9702) mapValue!32341)) b!940567))

(assert (= (and b!940566 ((_ is ValueCellFull!9702) mapDefault!32341)) b!940568))

(assert (= b!940574 b!940566))

(assert (= start!80004 b!940574))

(declare-fun m!875973 () Bool)

(assert (=> b!940570 m!875973))

(declare-fun m!875975 () Bool)

(assert (=> start!80004 m!875975))

(declare-fun m!875977 () Bool)

(assert (=> b!940574 m!875977))

(declare-fun m!875979 () Bool)

(assert (=> b!940574 m!875979))

(declare-fun m!875981 () Bool)

(assert (=> b!940572 m!875981))

(declare-fun m!875983 () Bool)

(assert (=> b!940569 m!875983))

(declare-fun m!875985 () Bool)

(assert (=> b!940569 m!875985))

(declare-fun m!875987 () Bool)

(assert (=> b!940569 m!875987))

(declare-fun m!875989 () Bool)

(assert (=> mapNonEmpty!32341 m!875989))

(declare-fun m!875991 () Bool)

(assert (=> b!940573 m!875991))

(check-sat tp_is_empty!20367 (not b_next!17859) (not start!80004) (not mapNonEmpty!32341) (not b!940572) (not b!940569) b_and!29271 (not b!940570) (not b!940574) (not b!940573))
(check-sat b_and!29271 (not b_next!17859))
