; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79984 () Bool)

(assert start!79984)

(declare-fun b!940301 () Bool)

(declare-fun b_free!17857 () Bool)

(declare-fun b_next!17857 () Bool)

(assert (=> b!940301 (= b_free!17857 (not b_next!17857))))

(declare-fun tp!62046 () Bool)

(declare-fun b_and!29243 () Bool)

(assert (=> b!940301 (= tp!62046 b_and!29243)))

(declare-fun b!940297 () Bool)

(declare-fun e!528427 () Bool)

(declare-fun e!528431 () Bool)

(assert (=> b!940297 (= e!528427 (not e!528431))))

(declare-fun res!632300 () Bool)

(assert (=> b!940297 (=> res!632300 e!528431)))

(declare-datatypes ((V!32119 0))(
  ( (V!32120 (val!10233 Int)) )
))
(declare-datatypes ((ValueCell!9701 0))(
  ( (ValueCellFull!9701 (v!12763 V!32119)) (EmptyCell!9701) )
))
(declare-datatypes ((array!56643 0))(
  ( (array!56644 (arr!27257 (Array (_ BitVec 32) ValueCell!9701)) (size!27720 (_ BitVec 32))) )
))
(declare-datatypes ((array!56645 0))(
  ( (array!56646 (arr!27258 (Array (_ BitVec 32) (_ BitVec 64))) (size!27721 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4552 0))(
  ( (LongMapFixedSize!4553 (defaultEntry!5567 Int) (mask!27103 (_ BitVec 32)) (extraKeys!5299 (_ BitVec 32)) (zeroValue!5403 V!32119) (minValue!5403 V!32119) (_size!2331 (_ BitVec 32)) (_keys!10412 array!56645) (_values!5590 array!56643) (_vacant!2331 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4552)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940297 (= res!632300 (not (validMask!0 (mask!27103 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940297 (arrayContainsKey!0 (_keys!10412 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9001 0))(
  ( (MissingZero!9001 (index!38375 (_ BitVec 32))) (Found!9001 (index!38376 (_ BitVec 32))) (Intermediate!9001 (undefined!9813 Bool) (index!38377 (_ BitVec 32)) (x!80665 (_ BitVec 32))) (Undefined!9001) (MissingVacant!9001 (index!38378 (_ BitVec 32))) )
))
(declare-fun lt!424504 () SeekEntryResult!9001)

(declare-datatypes ((Unit!31655 0))(
  ( (Unit!31656) )
))
(declare-fun lt!424505 () Unit!31655)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56645 (_ BitVec 64) (_ BitVec 32)) Unit!31655)

(assert (=> b!940297 (= lt!424505 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10412 thiss!1141) key!756 (index!38376 lt!424504)))))

(declare-fun res!632298 () Bool)

(declare-fun e!528428 () Bool)

(assert (=> start!79984 (=> (not res!632298) (not e!528428))))

(declare-fun valid!1754 (LongMapFixedSize!4552) Bool)

(assert (=> start!79984 (= res!632298 (valid!1754 thiss!1141))))

(assert (=> start!79984 e!528428))

(declare-fun e!528426 () Bool)

(assert (=> start!79984 e!528426))

(assert (=> start!79984 true))

(declare-fun mapNonEmpty!32338 () Bool)

(declare-fun mapRes!32338 () Bool)

(declare-fun tp!62047 () Bool)

(declare-fun e!528429 () Bool)

(assert (=> mapNonEmpty!32338 (= mapRes!32338 (and tp!62047 e!528429))))

(declare-fun mapKey!32338 () (_ BitVec 32))

(declare-fun mapRest!32338 () (Array (_ BitVec 32) ValueCell!9701))

(declare-fun mapValue!32338 () ValueCell!9701)

(assert (=> mapNonEmpty!32338 (= (arr!27257 (_values!5590 thiss!1141)) (store mapRest!32338 mapKey!32338 mapValue!32338))))

(declare-fun b!940298 () Bool)

(declare-fun e!528432 () Bool)

(declare-fun tp_is_empty!20365 () Bool)

(assert (=> b!940298 (= e!528432 tp_is_empty!20365)))

(declare-fun b!940299 () Bool)

(declare-fun e!528430 () Bool)

(assert (=> b!940299 (= e!528430 (and e!528432 mapRes!32338))))

(declare-fun condMapEmpty!32338 () Bool)

(declare-fun mapDefault!32338 () ValueCell!9701)

(assert (=> b!940299 (= condMapEmpty!32338 (= (arr!27257 (_values!5590 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9701)) mapDefault!32338)))))

(declare-fun b!940300 () Bool)

(declare-fun res!632301 () Bool)

(assert (=> b!940300 (=> (not res!632301) (not e!528428))))

(assert (=> b!940300 (= res!632301 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21252 (array!56645) Bool)

(declare-fun array_inv!21253 (array!56643) Bool)

(assert (=> b!940301 (= e!528426 (and tp!62046 tp_is_empty!20365 (array_inv!21252 (_keys!10412 thiss!1141)) (array_inv!21253 (_values!5590 thiss!1141)) e!528430))))

(declare-fun b!940302 () Bool)

(assert (=> b!940302 (= e!528431 true)))

(declare-fun lt!424503 () Bool)

(declare-datatypes ((List!19203 0))(
  ( (Nil!19200) (Cons!19199 (h!20345 (_ BitVec 64)) (t!27509 List!19203)) )
))
(declare-fun arrayNoDuplicates!0 (array!56645 (_ BitVec 32) List!19203) Bool)

(assert (=> b!940302 (= lt!424503 (arrayNoDuplicates!0 (_keys!10412 thiss!1141) #b00000000000000000000000000000000 Nil!19200))))

(declare-fun b!940303 () Bool)

(assert (=> b!940303 (= e!528429 tp_is_empty!20365)))

(declare-fun b!940304 () Bool)

(assert (=> b!940304 (= e!528428 e!528427)))

(declare-fun res!632302 () Bool)

(assert (=> b!940304 (=> (not res!632302) (not e!528427))))

(get-info :version)

(assert (=> b!940304 (= res!632302 ((_ is Found!9001) lt!424504))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56645 (_ BitVec 32)) SeekEntryResult!9001)

(assert (=> b!940304 (= lt!424504 (seekEntry!0 key!756 (_keys!10412 thiss!1141) (mask!27103 thiss!1141)))))

(declare-fun b!940305 () Bool)

(declare-fun res!632303 () Bool)

(assert (=> b!940305 (=> res!632303 e!528431)))

(assert (=> b!940305 (= res!632303 (or (not (= (size!27720 (_values!5590 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27103 thiss!1141)))) (not (= (size!27721 (_keys!10412 thiss!1141)) (size!27720 (_values!5590 thiss!1141)))) (bvslt (mask!27103 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5299 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5299 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32338 () Bool)

(assert (=> mapIsEmpty!32338 mapRes!32338))

(declare-fun b!940306 () Bool)

(declare-fun res!632299 () Bool)

(assert (=> b!940306 (=> res!632299 e!528431)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56645 (_ BitVec 32)) Bool)

(assert (=> b!940306 (= res!632299 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10412 thiss!1141) (mask!27103 thiss!1141))))))

(assert (= (and start!79984 res!632298) b!940300))

(assert (= (and b!940300 res!632301) b!940304))

(assert (= (and b!940304 res!632302) b!940297))

(assert (= (and b!940297 (not res!632300)) b!940305))

(assert (= (and b!940305 (not res!632303)) b!940306))

(assert (= (and b!940306 (not res!632299)) b!940302))

(assert (= (and b!940299 condMapEmpty!32338) mapIsEmpty!32338))

(assert (= (and b!940299 (not condMapEmpty!32338)) mapNonEmpty!32338))

(assert (= (and mapNonEmpty!32338 ((_ is ValueCellFull!9701) mapValue!32338)) b!940303))

(assert (= (and b!940299 ((_ is ValueCellFull!9701) mapDefault!32338)) b!940298))

(assert (= b!940301 b!940299))

(assert (= start!79984 b!940301))

(declare-fun m!875195 () Bool)

(assert (=> b!940302 m!875195))

(declare-fun m!875197 () Bool)

(assert (=> b!940301 m!875197))

(declare-fun m!875199 () Bool)

(assert (=> b!940301 m!875199))

(declare-fun m!875201 () Bool)

(assert (=> b!940306 m!875201))

(declare-fun m!875203 () Bool)

(assert (=> b!940304 m!875203))

(declare-fun m!875205 () Bool)

(assert (=> b!940297 m!875205))

(declare-fun m!875207 () Bool)

(assert (=> b!940297 m!875207))

(declare-fun m!875209 () Bool)

(assert (=> b!940297 m!875209))

(declare-fun m!875211 () Bool)

(assert (=> mapNonEmpty!32338 m!875211))

(declare-fun m!875213 () Bool)

(assert (=> start!79984 m!875213))

(check-sat (not b_next!17857) (not b!940304) (not b!940297) (not b!940306) (not mapNonEmpty!32338) b_and!29243 tp_is_empty!20365 (not start!79984) (not b!940301) (not b!940302))
(check-sat b_and!29243 (not b_next!17857))
