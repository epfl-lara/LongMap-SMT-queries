; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80002 () Bool)

(assert start!80002)

(declare-fun b!940572 () Bool)

(declare-fun b_free!17875 () Bool)

(declare-fun b_next!17875 () Bool)

(assert (=> b!940572 (= b_free!17875 (not b_next!17875))))

(declare-fun tp!62101 () Bool)

(declare-fun b_and!29261 () Bool)

(assert (=> b!940572 (= tp!62101 b_and!29261)))

(declare-fun b!940567 () Bool)

(declare-fun res!632463 () Bool)

(declare-fun e!528645 () Bool)

(assert (=> b!940567 (=> (not res!632463) (not e!528645))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940567 (= res!632463 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940568 () Bool)

(declare-fun e!528647 () Bool)

(declare-fun tp_is_empty!20383 () Bool)

(assert (=> b!940568 (= e!528647 tp_is_empty!20383)))

(declare-fun b!940569 () Bool)

(declare-fun e!528648 () Bool)

(assert (=> b!940569 (= e!528648 true)))

(declare-fun lt!424586 () Bool)

(declare-datatypes ((V!32143 0))(
  ( (V!32144 (val!10242 Int)) )
))
(declare-datatypes ((ValueCell!9710 0))(
  ( (ValueCellFull!9710 (v!12772 V!32143)) (EmptyCell!9710) )
))
(declare-datatypes ((array!56679 0))(
  ( (array!56680 (arr!27275 (Array (_ BitVec 32) ValueCell!9710)) (size!27738 (_ BitVec 32))) )
))
(declare-datatypes ((array!56681 0))(
  ( (array!56682 (arr!27276 (Array (_ BitVec 32) (_ BitVec 64))) (size!27739 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4570 0))(
  ( (LongMapFixedSize!4571 (defaultEntry!5576 Int) (mask!27118 (_ BitVec 32)) (extraKeys!5308 (_ BitVec 32)) (zeroValue!5412 V!32143) (minValue!5412 V!32143) (_size!2340 (_ BitVec 32)) (_keys!10421 array!56681) (_values!5599 array!56679) (_vacant!2340 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4570)

(declare-datatypes ((List!19210 0))(
  ( (Nil!19207) (Cons!19206 (h!20352 (_ BitVec 64)) (t!27516 List!19210)) )
))
(declare-fun arrayNoDuplicates!0 (array!56681 (_ BitVec 32) List!19210) Bool)

(assert (=> b!940569 (= lt!424586 (arrayNoDuplicates!0 (_keys!10421 thiss!1141) #b00000000000000000000000000000000 Nil!19207))))

(declare-fun b!940570 () Bool)

(declare-fun e!528641 () Bool)

(assert (=> b!940570 (= e!528641 tp_is_empty!20383)))

(declare-fun mapIsEmpty!32365 () Bool)

(declare-fun mapRes!32365 () Bool)

(assert (=> mapIsEmpty!32365 mapRes!32365))

(declare-fun res!632465 () Bool)

(assert (=> start!80002 (=> (not res!632465) (not e!528645))))

(declare-fun valid!1759 (LongMapFixedSize!4570) Bool)

(assert (=> start!80002 (= res!632465 (valid!1759 thiss!1141))))

(assert (=> start!80002 e!528645))

(declare-fun e!528644 () Bool)

(assert (=> start!80002 e!528644))

(assert (=> start!80002 true))

(declare-fun b!940571 () Bool)

(declare-fun res!632464 () Bool)

(assert (=> b!940571 (=> res!632464 e!528648)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56681 (_ BitVec 32)) Bool)

(assert (=> b!940571 (= res!632464 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10421 thiss!1141) (mask!27118 thiss!1141))))))

(declare-fun e!528642 () Bool)

(declare-fun array_inv!21264 (array!56681) Bool)

(declare-fun array_inv!21265 (array!56679) Bool)

(assert (=> b!940572 (= e!528644 (and tp!62101 tp_is_empty!20383 (array_inv!21264 (_keys!10421 thiss!1141)) (array_inv!21265 (_values!5599 thiss!1141)) e!528642))))

(declare-fun b!940573 () Bool)

(declare-fun e!528646 () Bool)

(assert (=> b!940573 (= e!528646 (not e!528648))))

(declare-fun res!632462 () Bool)

(assert (=> b!940573 (=> res!632462 e!528648)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940573 (= res!632462 (not (validMask!0 (mask!27118 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940573 (arrayContainsKey!0 (_keys!10421 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31669 0))(
  ( (Unit!31670) )
))
(declare-fun lt!424585 () Unit!31669)

(declare-datatypes ((SeekEntryResult!9008 0))(
  ( (MissingZero!9008 (index!38403 (_ BitVec 32))) (Found!9008 (index!38404 (_ BitVec 32))) (Intermediate!9008 (undefined!9820 Bool) (index!38405 (_ BitVec 32)) (x!80696 (_ BitVec 32))) (Undefined!9008) (MissingVacant!9008 (index!38406 (_ BitVec 32))) )
))
(declare-fun lt!424584 () SeekEntryResult!9008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56681 (_ BitVec 64) (_ BitVec 32)) Unit!31669)

(assert (=> b!940573 (= lt!424585 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10421 thiss!1141) key!756 (index!38404 lt!424584)))))

(declare-fun mapNonEmpty!32365 () Bool)

(declare-fun tp!62100 () Bool)

(assert (=> mapNonEmpty!32365 (= mapRes!32365 (and tp!62100 e!528647))))

(declare-fun mapRest!32365 () (Array (_ BitVec 32) ValueCell!9710))

(declare-fun mapValue!32365 () ValueCell!9710)

(declare-fun mapKey!32365 () (_ BitVec 32))

(assert (=> mapNonEmpty!32365 (= (arr!27275 (_values!5599 thiss!1141)) (store mapRest!32365 mapKey!32365 mapValue!32365))))

(declare-fun b!940574 () Bool)

(assert (=> b!940574 (= e!528642 (and e!528641 mapRes!32365))))

(declare-fun condMapEmpty!32365 () Bool)

(declare-fun mapDefault!32365 () ValueCell!9710)

(assert (=> b!940574 (= condMapEmpty!32365 (= (arr!27275 (_values!5599 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9710)) mapDefault!32365)))))

(declare-fun b!940575 () Bool)

(assert (=> b!940575 (= e!528645 e!528646)))

(declare-fun res!632461 () Bool)

(assert (=> b!940575 (=> (not res!632461) (not e!528646))))

(get-info :version)

(assert (=> b!940575 (= res!632461 ((_ is Found!9008) lt!424584))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56681 (_ BitVec 32)) SeekEntryResult!9008)

(assert (=> b!940575 (= lt!424584 (seekEntry!0 key!756 (_keys!10421 thiss!1141) (mask!27118 thiss!1141)))))

(declare-fun b!940576 () Bool)

(declare-fun res!632460 () Bool)

(assert (=> b!940576 (=> res!632460 e!528648)))

(assert (=> b!940576 (= res!632460 (or (not (= (size!27738 (_values!5599 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27118 thiss!1141)))) (not (= (size!27739 (_keys!10421 thiss!1141)) (size!27738 (_values!5599 thiss!1141)))) (bvslt (mask!27118 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5308 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5308 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80002 res!632465) b!940567))

(assert (= (and b!940567 res!632463) b!940575))

(assert (= (and b!940575 res!632461) b!940573))

(assert (= (and b!940573 (not res!632462)) b!940576))

(assert (= (and b!940576 (not res!632460)) b!940571))

(assert (= (and b!940571 (not res!632464)) b!940569))

(assert (= (and b!940574 condMapEmpty!32365) mapIsEmpty!32365))

(assert (= (and b!940574 (not condMapEmpty!32365)) mapNonEmpty!32365))

(assert (= (and mapNonEmpty!32365 ((_ is ValueCellFull!9710) mapValue!32365)) b!940568))

(assert (= (and b!940574 ((_ is ValueCellFull!9710) mapDefault!32365)) b!940570))

(assert (= b!940572 b!940574))

(assert (= start!80002 b!940572))

(declare-fun m!875375 () Bool)

(assert (=> b!940575 m!875375))

(declare-fun m!875377 () Bool)

(assert (=> b!940569 m!875377))

(declare-fun m!875379 () Bool)

(assert (=> b!940572 m!875379))

(declare-fun m!875381 () Bool)

(assert (=> b!940572 m!875381))

(declare-fun m!875383 () Bool)

(assert (=> b!940573 m!875383))

(declare-fun m!875385 () Bool)

(assert (=> b!940573 m!875385))

(declare-fun m!875387 () Bool)

(assert (=> b!940573 m!875387))

(declare-fun m!875389 () Bool)

(assert (=> start!80002 m!875389))

(declare-fun m!875391 () Bool)

(assert (=> mapNonEmpty!32365 m!875391))

(declare-fun m!875393 () Bool)

(assert (=> b!940571 m!875393))

(check-sat (not b_next!17875) (not b!940572) b_and!29261 (not b!940569) (not b!940573) (not mapNonEmpty!32365) (not start!80002) (not b!940571) tp_is_empty!20383 (not b!940575))
(check-sat b_and!29261 (not b_next!17875))
