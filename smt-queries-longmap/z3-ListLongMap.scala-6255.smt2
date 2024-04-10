; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79998 () Bool)

(assert start!79998)

(declare-fun b!940483 () Bool)

(declare-fun b_free!17853 () Bool)

(declare-fun b_next!17853 () Bool)

(assert (=> b!940483 (= b_free!17853 (not b_next!17853))))

(declare-fun tp!62033 () Bool)

(declare-fun b_and!29265 () Bool)

(assert (=> b!940483 (= tp!62033 b_and!29265)))

(declare-fun res!632374 () Bool)

(declare-fun e!528526 () Bool)

(assert (=> start!79998 (=> (not res!632374) (not e!528526))))

(declare-datatypes ((V!32113 0))(
  ( (V!32114 (val!10231 Int)) )
))
(declare-datatypes ((ValueCell!9699 0))(
  ( (ValueCellFull!9699 (v!12762 V!32113)) (EmptyCell!9699) )
))
(declare-datatypes ((array!56670 0))(
  ( (array!56671 (arr!27270 (Array (_ BitVec 32) ValueCell!9699)) (size!27731 (_ BitVec 32))) )
))
(declare-datatypes ((array!56672 0))(
  ( (array!56673 (arr!27271 (Array (_ BitVec 32) (_ BitVec 64))) (size!27732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4548 0))(
  ( (LongMapFixedSize!4549 (defaultEntry!5565 Int) (mask!27106 (_ BitVec 32)) (extraKeys!5297 (_ BitVec 32)) (zeroValue!5401 V!32113) (minValue!5401 V!32113) (_size!2329 (_ BitVec 32)) (_keys!10415 array!56672) (_values!5588 array!56670) (_vacant!2329 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4548)

(declare-fun valid!1745 (LongMapFixedSize!4548) Bool)

(assert (=> start!79998 (= res!632374 (valid!1745 thiss!1141))))

(assert (=> start!79998 e!528526))

(declare-fun e!528531 () Bool)

(assert (=> start!79998 e!528531))

(assert (=> start!79998 true))

(declare-fun b!940476 () Bool)

(declare-fun e!528525 () Bool)

(assert (=> b!940476 (= e!528526 e!528525)))

(declare-fun res!632372 () Bool)

(assert (=> b!940476 (=> (not res!632372) (not e!528525))))

(declare-datatypes ((SeekEntryResult!8999 0))(
  ( (MissingZero!8999 (index!38367 (_ BitVec 32))) (Found!8999 (index!38368 (_ BitVec 32))) (Intermediate!8999 (undefined!9811 Bool) (index!38369 (_ BitVec 32)) (x!80660 (_ BitVec 32))) (Undefined!8999) (MissingVacant!8999 (index!38370 (_ BitVec 32))) )
))
(declare-fun lt!424723 () SeekEntryResult!8999)

(get-info :version)

(assert (=> b!940476 (= res!632372 ((_ is Found!8999) lt!424723))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56672 (_ BitVec 32)) SeekEntryResult!8999)

(assert (=> b!940476 (= lt!424723 (seekEntry!0 key!756 (_keys!10415 thiss!1141) (mask!27106 thiss!1141)))))

(declare-fun mapNonEmpty!32332 () Bool)

(declare-fun mapRes!32332 () Bool)

(declare-fun tp!62034 () Bool)

(declare-fun e!528529 () Bool)

(assert (=> mapNonEmpty!32332 (= mapRes!32332 (and tp!62034 e!528529))))

(declare-fun mapRest!32332 () (Array (_ BitVec 32) ValueCell!9699))

(declare-fun mapValue!32332 () ValueCell!9699)

(declare-fun mapKey!32332 () (_ BitVec 32))

(assert (=> mapNonEmpty!32332 (= (arr!27270 (_values!5588 thiss!1141)) (store mapRest!32332 mapKey!32332 mapValue!32332))))

(declare-fun b!940477 () Bool)

(declare-fun res!632373 () Bool)

(assert (=> b!940477 (=> (not res!632373) (not e!528526))))

(assert (=> b!940477 (= res!632373 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940478 () Bool)

(declare-fun e!528532 () Bool)

(declare-fun tp_is_empty!20361 () Bool)

(assert (=> b!940478 (= e!528532 tp_is_empty!20361)))

(declare-fun mapIsEmpty!32332 () Bool)

(assert (=> mapIsEmpty!32332 mapRes!32332))

(declare-fun b!940479 () Bool)

(declare-fun e!528527 () Bool)

(assert (=> b!940479 (= e!528525 (not e!528527))))

(declare-fun res!632377 () Bool)

(assert (=> b!940479 (=> res!632377 e!528527)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940479 (= res!632377 (not (validMask!0 (mask!27106 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940479 (arrayContainsKey!0 (_keys!10415 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31766 0))(
  ( (Unit!31767) )
))
(declare-fun lt!424721 () Unit!31766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56672 (_ BitVec 64) (_ BitVec 32)) Unit!31766)

(assert (=> b!940479 (= lt!424721 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10415 thiss!1141) key!756 (index!38368 lt!424723)))))

(declare-fun b!940480 () Bool)

(assert (=> b!940480 (= e!528527 true)))

(declare-fun lt!424722 () Bool)

(declare-datatypes ((List!19189 0))(
  ( (Nil!19186) (Cons!19185 (h!20331 (_ BitVec 64)) (t!27504 List!19189)) )
))
(declare-fun arrayNoDuplicates!0 (array!56672 (_ BitVec 32) List!19189) Bool)

(assert (=> b!940480 (= lt!424722 (arrayNoDuplicates!0 (_keys!10415 thiss!1141) #b00000000000000000000000000000000 Nil!19186))))

(declare-fun b!940481 () Bool)

(assert (=> b!940481 (= e!528529 tp_is_empty!20361)))

(declare-fun b!940482 () Bool)

(declare-fun e!528530 () Bool)

(assert (=> b!940482 (= e!528530 (and e!528532 mapRes!32332))))

(declare-fun condMapEmpty!32332 () Bool)

(declare-fun mapDefault!32332 () ValueCell!9699)

(assert (=> b!940482 (= condMapEmpty!32332 (= (arr!27270 (_values!5588 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9699)) mapDefault!32332)))))

(declare-fun array_inv!21196 (array!56672) Bool)

(declare-fun array_inv!21197 (array!56670) Bool)

(assert (=> b!940483 (= e!528531 (and tp!62033 tp_is_empty!20361 (array_inv!21196 (_keys!10415 thiss!1141)) (array_inv!21197 (_values!5588 thiss!1141)) e!528530))))

(declare-fun b!940484 () Bool)

(declare-fun res!632375 () Bool)

(assert (=> b!940484 (=> res!632375 e!528527)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56672 (_ BitVec 32)) Bool)

(assert (=> b!940484 (= res!632375 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10415 thiss!1141) (mask!27106 thiss!1141))))))

(declare-fun b!940485 () Bool)

(declare-fun res!632376 () Bool)

(assert (=> b!940485 (=> res!632376 e!528527)))

(assert (=> b!940485 (= res!632376 (or (not (= (size!27731 (_values!5588 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27106 thiss!1141)))) (not (= (size!27732 (_keys!10415 thiss!1141)) (size!27731 (_values!5588 thiss!1141)))) (bvslt (mask!27106 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5297 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5297 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!79998 res!632374) b!940477))

(assert (= (and b!940477 res!632373) b!940476))

(assert (= (and b!940476 res!632372) b!940479))

(assert (= (and b!940479 (not res!632377)) b!940485))

(assert (= (and b!940485 (not res!632376)) b!940484))

(assert (= (and b!940484 (not res!632375)) b!940480))

(assert (= (and b!940482 condMapEmpty!32332) mapIsEmpty!32332))

(assert (= (and b!940482 (not condMapEmpty!32332)) mapNonEmpty!32332))

(assert (= (and mapNonEmpty!32332 ((_ is ValueCellFull!9699) mapValue!32332)) b!940481))

(assert (= (and b!940482 ((_ is ValueCellFull!9699) mapDefault!32332)) b!940478))

(assert (= b!940483 b!940482))

(assert (= start!79998 b!940483))

(declare-fun m!875913 () Bool)

(assert (=> b!940479 m!875913))

(declare-fun m!875915 () Bool)

(assert (=> b!940479 m!875915))

(declare-fun m!875917 () Bool)

(assert (=> b!940479 m!875917))

(declare-fun m!875919 () Bool)

(assert (=> mapNonEmpty!32332 m!875919))

(declare-fun m!875921 () Bool)

(assert (=> b!940476 m!875921))

(declare-fun m!875923 () Bool)

(assert (=> b!940480 m!875923))

(declare-fun m!875925 () Bool)

(assert (=> start!79998 m!875925))

(declare-fun m!875927 () Bool)

(assert (=> b!940484 m!875927))

(declare-fun m!875929 () Bool)

(assert (=> b!940483 m!875929))

(declare-fun m!875931 () Bool)

(assert (=> b!940483 m!875931))

(check-sat (not b!940476) b_and!29265 (not mapNonEmpty!32332) (not b!940483) (not b_next!17853) (not start!79998) tp_is_empty!20361 (not b!940479) (not b!940480) (not b!940484))
(check-sat b_and!29265 (not b_next!17853))
