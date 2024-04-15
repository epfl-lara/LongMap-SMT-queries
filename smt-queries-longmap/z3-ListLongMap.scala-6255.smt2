; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79978 () Bool)

(assert start!79978)

(declare-fun b!940210 () Bool)

(declare-fun b_free!17851 () Bool)

(declare-fun b_next!17851 () Bool)

(assert (=> b!940210 (= b_free!17851 (not b_next!17851))))

(declare-fun tp!62028 () Bool)

(declare-fun b_and!29237 () Bool)

(assert (=> b!940210 (= tp!62028 b_and!29237)))

(declare-fun b!940207 () Bool)

(declare-fun e!528358 () Bool)

(declare-fun e!528356 () Bool)

(assert (=> b!940207 (= e!528358 e!528356)))

(declare-fun res!632245 () Bool)

(assert (=> b!940207 (=> (not res!632245) (not e!528356))))

(declare-datatypes ((SeekEntryResult!8999 0))(
  ( (MissingZero!8999 (index!38367 (_ BitVec 32))) (Found!8999 (index!38368 (_ BitVec 32))) (Intermediate!8999 (undefined!9811 Bool) (index!38369 (_ BitVec 32)) (x!80655 (_ BitVec 32))) (Undefined!8999) (MissingVacant!8999 (index!38370 (_ BitVec 32))) )
))
(declare-fun lt!424477 () SeekEntryResult!8999)

(get-info :version)

(assert (=> b!940207 (= res!632245 ((_ is Found!8999) lt!424477))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32111 0))(
  ( (V!32112 (val!10230 Int)) )
))
(declare-datatypes ((ValueCell!9698 0))(
  ( (ValueCellFull!9698 (v!12760 V!32111)) (EmptyCell!9698) )
))
(declare-datatypes ((array!56631 0))(
  ( (array!56632 (arr!27251 (Array (_ BitVec 32) ValueCell!9698)) (size!27714 (_ BitVec 32))) )
))
(declare-datatypes ((array!56633 0))(
  ( (array!56634 (arr!27252 (Array (_ BitVec 32) (_ BitVec 64))) (size!27715 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4546 0))(
  ( (LongMapFixedSize!4547 (defaultEntry!5564 Int) (mask!27098 (_ BitVec 32)) (extraKeys!5296 (_ BitVec 32)) (zeroValue!5400 V!32111) (minValue!5400 V!32111) (_size!2328 (_ BitVec 32)) (_keys!10409 array!56633) (_values!5587 array!56631) (_vacant!2328 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4546)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56633 (_ BitVec 32)) SeekEntryResult!8999)

(assert (=> b!940207 (= lt!424477 (seekEntry!0 key!756 (_keys!10409 thiss!1141) (mask!27098 thiss!1141)))))

(declare-fun b!940208 () Bool)

(declare-fun e!528355 () Bool)

(assert (=> b!940208 (= e!528356 (not e!528355))))

(declare-fun res!632249 () Bool)

(assert (=> b!940208 (=> res!632249 e!528355)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940208 (= res!632249 (not (validMask!0 (mask!27098 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940208 (arrayContainsKey!0 (_keys!10409 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31653 0))(
  ( (Unit!31654) )
))
(declare-fun lt!424478 () Unit!31653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56633 (_ BitVec 64) (_ BitVec 32)) Unit!31653)

(assert (=> b!940208 (= lt!424478 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10409 thiss!1141) key!756 (index!38368 lt!424477)))))

(declare-fun mapIsEmpty!32329 () Bool)

(declare-fun mapRes!32329 () Bool)

(assert (=> mapIsEmpty!32329 mapRes!32329))

(declare-fun b!940209 () Bool)

(declare-fun res!632246 () Bool)

(assert (=> b!940209 (=> res!632246 e!528355)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56633 (_ BitVec 32)) Bool)

(assert (=> b!940209 (= res!632246 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10409 thiss!1141) (mask!27098 thiss!1141))))))

(declare-fun e!528357 () Bool)

(declare-fun tp_is_empty!20359 () Bool)

(declare-fun e!528354 () Bool)

(declare-fun array_inv!21250 (array!56633) Bool)

(declare-fun array_inv!21251 (array!56631) Bool)

(assert (=> b!940210 (= e!528357 (and tp!62028 tp_is_empty!20359 (array_inv!21250 (_keys!10409 thiss!1141)) (array_inv!21251 (_values!5587 thiss!1141)) e!528354))))

(declare-fun mapNonEmpty!32329 () Bool)

(declare-fun tp!62029 () Bool)

(declare-fun e!528359 () Bool)

(assert (=> mapNonEmpty!32329 (= mapRes!32329 (and tp!62029 e!528359))))

(declare-fun mapValue!32329 () ValueCell!9698)

(declare-fun mapKey!32329 () (_ BitVec 32))

(declare-fun mapRest!32329 () (Array (_ BitVec 32) ValueCell!9698))

(assert (=> mapNonEmpty!32329 (= (arr!27251 (_values!5587 thiss!1141)) (store mapRest!32329 mapKey!32329 mapValue!32329))))

(declare-fun b!940211 () Bool)

(declare-fun res!632247 () Bool)

(assert (=> b!940211 (=> (not res!632247) (not e!528358))))

(assert (=> b!940211 (= res!632247 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632248 () Bool)

(assert (=> start!79978 (=> (not res!632248) (not e!528358))))

(declare-fun valid!1752 (LongMapFixedSize!4546) Bool)

(assert (=> start!79978 (= res!632248 (valid!1752 thiss!1141))))

(assert (=> start!79978 e!528358))

(assert (=> start!79978 e!528357))

(assert (=> start!79978 true))

(declare-fun b!940212 () Bool)

(declare-fun res!632244 () Bool)

(assert (=> b!940212 (=> res!632244 e!528355)))

(assert (=> b!940212 (= res!632244 (or (not (= (size!27714 (_values!5587 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27098 thiss!1141)))) (not (= (size!27715 (_keys!10409 thiss!1141)) (size!27714 (_values!5587 thiss!1141)))) (bvslt (mask!27098 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5296 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5296 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940213 () Bool)

(declare-fun e!528360 () Bool)

(assert (=> b!940213 (= e!528354 (and e!528360 mapRes!32329))))

(declare-fun condMapEmpty!32329 () Bool)

(declare-fun mapDefault!32329 () ValueCell!9698)

(assert (=> b!940213 (= condMapEmpty!32329 (= (arr!27251 (_values!5587 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9698)) mapDefault!32329)))))

(declare-fun b!940214 () Bool)

(assert (=> b!940214 (= e!528360 tp_is_empty!20359)))

(declare-fun b!940215 () Bool)

(assert (=> b!940215 (= e!528355 true)))

(declare-fun lt!424476 () Bool)

(declare-datatypes ((List!19201 0))(
  ( (Nil!19198) (Cons!19197 (h!20343 (_ BitVec 64)) (t!27507 List!19201)) )
))
(declare-fun arrayNoDuplicates!0 (array!56633 (_ BitVec 32) List!19201) Bool)

(assert (=> b!940215 (= lt!424476 (arrayNoDuplicates!0 (_keys!10409 thiss!1141) #b00000000000000000000000000000000 Nil!19198))))

(declare-fun b!940216 () Bool)

(assert (=> b!940216 (= e!528359 tp_is_empty!20359)))

(assert (= (and start!79978 res!632248) b!940211))

(assert (= (and b!940211 res!632247) b!940207))

(assert (= (and b!940207 res!632245) b!940208))

(assert (= (and b!940208 (not res!632249)) b!940212))

(assert (= (and b!940212 (not res!632244)) b!940209))

(assert (= (and b!940209 (not res!632246)) b!940215))

(assert (= (and b!940213 condMapEmpty!32329) mapIsEmpty!32329))

(assert (= (and b!940213 (not condMapEmpty!32329)) mapNonEmpty!32329))

(assert (= (and mapNonEmpty!32329 ((_ is ValueCellFull!9698) mapValue!32329)) b!940216))

(assert (= (and b!940213 ((_ is ValueCellFull!9698) mapDefault!32329)) b!940214))

(assert (= b!940210 b!940213))

(assert (= start!79978 b!940210))

(declare-fun m!875135 () Bool)

(assert (=> b!940215 m!875135))

(declare-fun m!875137 () Bool)

(assert (=> start!79978 m!875137))

(declare-fun m!875139 () Bool)

(assert (=> b!940207 m!875139))

(declare-fun m!875141 () Bool)

(assert (=> b!940208 m!875141))

(declare-fun m!875143 () Bool)

(assert (=> b!940208 m!875143))

(declare-fun m!875145 () Bool)

(assert (=> b!940208 m!875145))

(declare-fun m!875147 () Bool)

(assert (=> mapNonEmpty!32329 m!875147))

(declare-fun m!875149 () Bool)

(assert (=> b!940210 m!875149))

(declare-fun m!875151 () Bool)

(assert (=> b!940210 m!875151))

(declare-fun m!875153 () Bool)

(assert (=> b!940209 m!875153))

(check-sat b_and!29237 (not start!79978) (not b!940215) (not b!940208) tp_is_empty!20359 (not b!940209) (not mapNonEmpty!32329) (not b_next!17851) (not b!940207) (not b!940210))
(check-sat b_and!29237 (not b_next!17851))
