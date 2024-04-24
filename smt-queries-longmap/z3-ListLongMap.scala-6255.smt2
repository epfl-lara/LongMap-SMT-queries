; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80164 () Bool)

(assert start!80164)

(declare-fun b!941358 () Bool)

(declare-fun b_free!17851 () Bool)

(declare-fun b_next!17851 () Bool)

(assert (=> b!941358 (= b_free!17851 (not b_next!17851))))

(declare-fun tp!62028 () Bool)

(declare-fun b_and!29273 () Bool)

(assert (=> b!941358 (= tp!62028 b_and!29273)))

(declare-fun b!941349 () Bool)

(declare-fun e!529086 () Bool)

(declare-fun tp_is_empty!20359 () Bool)

(assert (=> b!941349 (= e!529086 tp_is_empty!20359)))

(declare-fun res!632700 () Bool)

(declare-fun e!529085 () Bool)

(assert (=> start!80164 (=> (not res!632700) (not e!529085))))

(declare-datatypes ((V!32111 0))(
  ( (V!32112 (val!10230 Int)) )
))
(declare-datatypes ((ValueCell!9698 0))(
  ( (ValueCellFull!9698 (v!12758 V!32111)) (EmptyCell!9698) )
))
(declare-datatypes ((array!56717 0))(
  ( (array!56718 (arr!27289 (Array (_ BitVec 32) ValueCell!9698)) (size!27751 (_ BitVec 32))) )
))
(declare-datatypes ((array!56719 0))(
  ( (array!56720 (arr!27290 (Array (_ BitVec 32) (_ BitVec 64))) (size!27752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4546 0))(
  ( (LongMapFixedSize!4547 (defaultEntry!5564 Int) (mask!27148 (_ BitVec 32)) (extraKeys!5296 (_ BitVec 32)) (zeroValue!5400 V!32111) (minValue!5400 V!32111) (_size!2328 (_ BitVec 32)) (_keys!10442 array!56719) (_values!5587 array!56717) (_vacant!2328 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4546)

(declare-fun valid!1751 (LongMapFixedSize!4546) Bool)

(assert (=> start!80164 (= res!632700 (valid!1751 thiss!1141))))

(assert (=> start!80164 e!529085))

(declare-fun e!529087 () Bool)

(assert (=> start!80164 e!529087))

(assert (=> start!80164 true))

(declare-fun b!941350 () Bool)

(declare-fun e!529088 () Bool)

(assert (=> b!941350 (= e!529088 tp_is_empty!20359)))

(declare-fun b!941351 () Bool)

(declare-fun res!632703 () Bool)

(declare-fun e!529084 () Bool)

(assert (=> b!941351 (=> res!632703 e!529084)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56719 (_ BitVec 32)) Bool)

(assert (=> b!941351 (= res!632703 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10442 thiss!1141) (mask!27148 thiss!1141))))))

(declare-fun mapIsEmpty!32329 () Bool)

(declare-fun mapRes!32329 () Bool)

(assert (=> mapIsEmpty!32329 mapRes!32329))

(declare-fun b!941352 () Bool)

(declare-fun res!632702 () Bool)

(assert (=> b!941352 (=> (not res!632702) (not e!529085))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941352 (= res!632702 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941353 () Bool)

(assert (=> b!941353 (= e!529084 true)))

(declare-fun lt!425074 () Bool)

(declare-datatypes ((List!19173 0))(
  ( (Nil!19170) (Cons!19169 (h!20321 (_ BitVec 64)) (t!27480 List!19173)) )
))
(declare-fun arrayNoDuplicates!0 (array!56719 (_ BitVec 32) List!19173) Bool)

(assert (=> b!941353 (= lt!425074 (arrayNoDuplicates!0 (_keys!10442 thiss!1141) #b00000000000000000000000000000000 Nil!19170))))

(declare-fun b!941354 () Bool)

(declare-fun e!529083 () Bool)

(assert (=> b!941354 (= e!529083 (and e!529088 mapRes!32329))))

(declare-fun condMapEmpty!32329 () Bool)

(declare-fun mapDefault!32329 () ValueCell!9698)

(assert (=> b!941354 (= condMapEmpty!32329 (= (arr!27289 (_values!5587 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9698)) mapDefault!32329)))))

(declare-fun b!941355 () Bool)

(declare-fun res!632698 () Bool)

(assert (=> b!941355 (=> res!632698 e!529084)))

(assert (=> b!941355 (= res!632698 (or (not (= (size!27751 (_values!5587 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27148 thiss!1141)))) (not (= (size!27752 (_keys!10442 thiss!1141)) (size!27751 (_values!5587 thiss!1141)))) (bvslt (mask!27148 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5296 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5296 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32329 () Bool)

(declare-fun tp!62029 () Bool)

(assert (=> mapNonEmpty!32329 (= mapRes!32329 (and tp!62029 e!529086))))

(declare-fun mapRest!32329 () (Array (_ BitVec 32) ValueCell!9698))

(declare-fun mapKey!32329 () (_ BitVec 32))

(declare-fun mapValue!32329 () ValueCell!9698)

(assert (=> mapNonEmpty!32329 (= (arr!27289 (_values!5587 thiss!1141)) (store mapRest!32329 mapKey!32329 mapValue!32329))))

(declare-fun b!941356 () Bool)

(declare-fun e!529090 () Bool)

(assert (=> b!941356 (= e!529085 e!529090)))

(declare-fun res!632699 () Bool)

(assert (=> b!941356 (=> (not res!632699) (not e!529090))))

(declare-datatypes ((SeekEntryResult!8954 0))(
  ( (MissingZero!8954 (index!38187 (_ BitVec 32))) (Found!8954 (index!38188 (_ BitVec 32))) (Intermediate!8954 (undefined!9766 Bool) (index!38189 (_ BitVec 32)) (x!80629 (_ BitVec 32))) (Undefined!8954) (MissingVacant!8954 (index!38190 (_ BitVec 32))) )
))
(declare-fun lt!425075 () SeekEntryResult!8954)

(get-info :version)

(assert (=> b!941356 (= res!632699 ((_ is Found!8954) lt!425075))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56719 (_ BitVec 32)) SeekEntryResult!8954)

(assert (=> b!941356 (= lt!425075 (seekEntry!0 key!756 (_keys!10442 thiss!1141) (mask!27148 thiss!1141)))))

(declare-fun b!941357 () Bool)

(assert (=> b!941357 (= e!529090 (not e!529084))))

(declare-fun res!632701 () Bool)

(assert (=> b!941357 (=> res!632701 e!529084)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941357 (= res!632701 (not (validMask!0 (mask!27148 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941357 (arrayContainsKey!0 (_keys!10442 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31748 0))(
  ( (Unit!31749) )
))
(declare-fun lt!425073 () Unit!31748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56719 (_ BitVec 64) (_ BitVec 32)) Unit!31748)

(assert (=> b!941357 (= lt!425073 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10442 thiss!1141) key!756 (index!38188 lt!425075)))))

(declare-fun array_inv!21302 (array!56719) Bool)

(declare-fun array_inv!21303 (array!56717) Bool)

(assert (=> b!941358 (= e!529087 (and tp!62028 tp_is_empty!20359 (array_inv!21302 (_keys!10442 thiss!1141)) (array_inv!21303 (_values!5587 thiss!1141)) e!529083))))

(assert (= (and start!80164 res!632700) b!941352))

(assert (= (and b!941352 res!632702) b!941356))

(assert (= (and b!941356 res!632699) b!941357))

(assert (= (and b!941357 (not res!632701)) b!941355))

(assert (= (and b!941355 (not res!632698)) b!941351))

(assert (= (and b!941351 (not res!632703)) b!941353))

(assert (= (and b!941354 condMapEmpty!32329) mapIsEmpty!32329))

(assert (= (and b!941354 (not condMapEmpty!32329)) mapNonEmpty!32329))

(assert (= (and mapNonEmpty!32329 ((_ is ValueCellFull!9698) mapValue!32329)) b!941349))

(assert (= (and b!941354 ((_ is ValueCellFull!9698) mapDefault!32329)) b!941350))

(assert (= b!941358 b!941354))

(assert (= start!80164 b!941358))

(declare-fun m!877187 () Bool)

(assert (=> b!941356 m!877187))

(declare-fun m!877189 () Bool)

(assert (=> b!941357 m!877189))

(declare-fun m!877191 () Bool)

(assert (=> b!941357 m!877191))

(declare-fun m!877193 () Bool)

(assert (=> b!941357 m!877193))

(declare-fun m!877195 () Bool)

(assert (=> b!941358 m!877195))

(declare-fun m!877197 () Bool)

(assert (=> b!941358 m!877197))

(declare-fun m!877199 () Bool)

(assert (=> b!941353 m!877199))

(declare-fun m!877201 () Bool)

(assert (=> b!941351 m!877201))

(declare-fun m!877203 () Bool)

(assert (=> mapNonEmpty!32329 m!877203))

(declare-fun m!877205 () Bool)

(assert (=> start!80164 m!877205))

(check-sat (not mapNonEmpty!32329) (not b!941358) (not b!941351) (not b!941353) (not start!80164) (not b!941357) b_and!29273 (not b_next!17851) (not b!941356) tp_is_empty!20359)
(check-sat b_and!29273 (not b_next!17851))
