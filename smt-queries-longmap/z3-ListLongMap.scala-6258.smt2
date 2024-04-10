; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80016 () Bool)

(assert start!80016)

(declare-fun b!940749 () Bool)

(declare-fun b_free!17871 () Bool)

(declare-fun b_next!17871 () Bool)

(assert (=> b!940749 (= b_free!17871 (not b_next!17871))))

(declare-fun tp!62087 () Bool)

(declare-fun b_and!29283 () Bool)

(assert (=> b!940749 (= tp!62087 b_and!29283)))

(declare-fun b!940746 () Bool)

(declare-fun e!528746 () Bool)

(declare-fun e!528747 () Bool)

(declare-fun mapRes!32359 () Bool)

(assert (=> b!940746 (= e!528746 (and e!528747 mapRes!32359))))

(declare-fun condMapEmpty!32359 () Bool)

(declare-datatypes ((V!32137 0))(
  ( (V!32138 (val!10240 Int)) )
))
(declare-datatypes ((ValueCell!9708 0))(
  ( (ValueCellFull!9708 (v!12771 V!32137)) (EmptyCell!9708) )
))
(declare-datatypes ((array!56706 0))(
  ( (array!56707 (arr!27288 (Array (_ BitVec 32) ValueCell!9708)) (size!27749 (_ BitVec 32))) )
))
(declare-datatypes ((array!56708 0))(
  ( (array!56709 (arr!27289 (Array (_ BitVec 32) (_ BitVec 64))) (size!27750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4566 0))(
  ( (LongMapFixedSize!4567 (defaultEntry!5574 Int) (mask!27121 (_ BitVec 32)) (extraKeys!5306 (_ BitVec 32)) (zeroValue!5410 V!32137) (minValue!5410 V!32137) (_size!2338 (_ BitVec 32)) (_keys!10424 array!56708) (_values!5597 array!56706) (_vacant!2338 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4566)

(declare-fun mapDefault!32359 () ValueCell!9708)

(assert (=> b!940746 (= condMapEmpty!32359 (= (arr!27288 (_values!5597 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9708)) mapDefault!32359)))))

(declare-fun b!940747 () Bool)

(declare-fun e!528743 () Bool)

(declare-fun tp_is_empty!20379 () Bool)

(assert (=> b!940747 (= e!528743 tp_is_empty!20379)))

(declare-fun res!632537 () Bool)

(declare-fun e!528741 () Bool)

(assert (=> start!80016 (=> (not res!632537) (not e!528741))))

(declare-fun valid!1751 (LongMapFixedSize!4566) Bool)

(assert (=> start!80016 (= res!632537 (valid!1751 thiss!1141))))

(assert (=> start!80016 e!528741))

(declare-fun e!528748 () Bool)

(assert (=> start!80016 e!528748))

(assert (=> start!80016 true))

(declare-fun b!940748 () Bool)

(declare-fun res!632539 () Bool)

(declare-fun e!528744 () Bool)

(assert (=> b!940748 (=> res!632539 e!528744)))

(assert (=> b!940748 (= res!632539 (or (not (= (size!27749 (_values!5597 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27121 thiss!1141)))) (not (= (size!27750 (_keys!10424 thiss!1141)) (size!27749 (_values!5597 thiss!1141)))) (bvslt (mask!27121 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5306 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5306 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32359 () Bool)

(assert (=> mapIsEmpty!32359 mapRes!32359))

(declare-fun array_inv!21210 (array!56708) Bool)

(declare-fun array_inv!21211 (array!56706) Bool)

(assert (=> b!940749 (= e!528748 (and tp!62087 tp_is_empty!20379 (array_inv!21210 (_keys!10424 thiss!1141)) (array_inv!21211 (_values!5597 thiss!1141)) e!528746))))

(declare-fun mapNonEmpty!32359 () Bool)

(declare-fun tp!62088 () Bool)

(assert (=> mapNonEmpty!32359 (= mapRes!32359 (and tp!62088 e!528743))))

(declare-fun mapRest!32359 () (Array (_ BitVec 32) ValueCell!9708))

(declare-fun mapValue!32359 () ValueCell!9708)

(declare-fun mapKey!32359 () (_ BitVec 32))

(assert (=> mapNonEmpty!32359 (= (arr!27288 (_values!5597 thiss!1141)) (store mapRest!32359 mapKey!32359 mapValue!32359))))

(declare-fun b!940750 () Bool)

(declare-fun res!632534 () Bool)

(assert (=> b!940750 (=> res!632534 e!528744)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56708 (_ BitVec 32)) Bool)

(assert (=> b!940750 (= res!632534 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10424 thiss!1141) (mask!27121 thiss!1141))))))

(declare-fun b!940751 () Bool)

(assert (=> b!940751 (= e!528744 true)))

(declare-fun lt!424802 () Bool)

(declare-datatypes ((List!19195 0))(
  ( (Nil!19192) (Cons!19191 (h!20337 (_ BitVec 64)) (t!27510 List!19195)) )
))
(declare-fun arrayNoDuplicates!0 (array!56708 (_ BitVec 32) List!19195) Bool)

(assert (=> b!940751 (= lt!424802 (arrayNoDuplicates!0 (_keys!10424 thiss!1141) #b00000000000000000000000000000000 Nil!19192))))

(declare-fun b!940752 () Bool)

(assert (=> b!940752 (= e!528747 tp_is_empty!20379)))

(declare-fun b!940753 () Bool)

(declare-fun e!528742 () Bool)

(assert (=> b!940753 (= e!528741 e!528742)))

(declare-fun res!632536 () Bool)

(assert (=> b!940753 (=> (not res!632536) (not e!528742))))

(declare-datatypes ((SeekEntryResult!9007 0))(
  ( (MissingZero!9007 (index!38399 (_ BitVec 32))) (Found!9007 (index!38400 (_ BitVec 32))) (Intermediate!9007 (undefined!9819 Bool) (index!38401 (_ BitVec 32)) (x!80692 (_ BitVec 32))) (Undefined!9007) (MissingVacant!9007 (index!38402 (_ BitVec 32))) )
))
(declare-fun lt!424804 () SeekEntryResult!9007)

(get-info :version)

(assert (=> b!940753 (= res!632536 ((_ is Found!9007) lt!424804))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56708 (_ BitVec 32)) SeekEntryResult!9007)

(assert (=> b!940753 (= lt!424804 (seekEntry!0 key!756 (_keys!10424 thiss!1141) (mask!27121 thiss!1141)))))

(declare-fun b!940754 () Bool)

(assert (=> b!940754 (= e!528742 (not e!528744))))

(declare-fun res!632538 () Bool)

(assert (=> b!940754 (=> res!632538 e!528744)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940754 (= res!632538 (not (validMask!0 (mask!27121 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940754 (arrayContainsKey!0 (_keys!10424 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31780 0))(
  ( (Unit!31781) )
))
(declare-fun lt!424803 () Unit!31780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56708 (_ BitVec 64) (_ BitVec 32)) Unit!31780)

(assert (=> b!940754 (= lt!424803 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10424 thiss!1141) key!756 (index!38400 lt!424804)))))

(declare-fun b!940755 () Bool)

(declare-fun res!632535 () Bool)

(assert (=> b!940755 (=> (not res!632535) (not e!528741))))

(assert (=> b!940755 (= res!632535 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80016 res!632537) b!940755))

(assert (= (and b!940755 res!632535) b!940753))

(assert (= (and b!940753 res!632536) b!940754))

(assert (= (and b!940754 (not res!632538)) b!940748))

(assert (= (and b!940748 (not res!632539)) b!940750))

(assert (= (and b!940750 (not res!632534)) b!940751))

(assert (= (and b!940746 condMapEmpty!32359) mapIsEmpty!32359))

(assert (= (and b!940746 (not condMapEmpty!32359)) mapNonEmpty!32359))

(assert (= (and mapNonEmpty!32359 ((_ is ValueCellFull!9708) mapValue!32359)) b!940747))

(assert (= (and b!940746 ((_ is ValueCellFull!9708) mapDefault!32359)) b!940752))

(assert (= b!940749 b!940746))

(assert (= start!80016 b!940749))

(declare-fun m!876093 () Bool)

(assert (=> b!940753 m!876093))

(declare-fun m!876095 () Bool)

(assert (=> mapNonEmpty!32359 m!876095))

(declare-fun m!876097 () Bool)

(assert (=> b!940751 m!876097))

(declare-fun m!876099 () Bool)

(assert (=> b!940750 m!876099))

(declare-fun m!876101 () Bool)

(assert (=> b!940749 m!876101))

(declare-fun m!876103 () Bool)

(assert (=> b!940749 m!876103))

(declare-fun m!876105 () Bool)

(assert (=> start!80016 m!876105))

(declare-fun m!876107 () Bool)

(assert (=> b!940754 m!876107))

(declare-fun m!876109 () Bool)

(assert (=> b!940754 m!876109))

(declare-fun m!876111 () Bool)

(assert (=> b!940754 m!876111))

(check-sat (not b_next!17871) (not b!940751) (not mapNonEmpty!32359) (not b!940750) (not start!80016) (not b!940749) tp_is_empty!20379 b_and!29283 (not b!940754) (not b!940753))
(check-sat b_and!29283 (not b_next!17871))
