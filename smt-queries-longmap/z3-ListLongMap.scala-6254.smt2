; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79992 () Bool)

(assert start!79992)

(declare-fun b!940390 () Bool)

(declare-fun b_free!17847 () Bool)

(declare-fun b_next!17847 () Bool)

(assert (=> b!940390 (= b_free!17847 (not b_next!17847))))

(declare-fun tp!62015 () Bool)

(declare-fun b_and!29259 () Bool)

(assert (=> b!940390 (= tp!62015 b_and!29259)))

(declare-fun mapIsEmpty!32323 () Bool)

(declare-fun mapRes!32323 () Bool)

(assert (=> mapIsEmpty!32323 mapRes!32323))

(declare-fun b!940386 () Bool)

(declare-fun res!632323 () Bool)

(declare-fun e!528460 () Bool)

(assert (=> b!940386 (=> res!632323 e!528460)))

(declare-datatypes ((V!32105 0))(
  ( (V!32106 (val!10228 Int)) )
))
(declare-datatypes ((ValueCell!9696 0))(
  ( (ValueCellFull!9696 (v!12759 V!32105)) (EmptyCell!9696) )
))
(declare-datatypes ((array!56658 0))(
  ( (array!56659 (arr!27264 (Array (_ BitVec 32) ValueCell!9696)) (size!27725 (_ BitVec 32))) )
))
(declare-datatypes ((array!56660 0))(
  ( (array!56661 (arr!27265 (Array (_ BitVec 32) (_ BitVec 64))) (size!27726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4542 0))(
  ( (LongMapFixedSize!4543 (defaultEntry!5562 Int) (mask!27101 (_ BitVec 32)) (extraKeys!5294 (_ BitVec 32)) (zeroValue!5398 V!32105) (minValue!5398 V!32105) (_size!2326 (_ BitVec 32)) (_keys!10412 array!56660) (_values!5585 array!56658) (_vacant!2326 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4542)

(assert (=> b!940386 (= res!632323 (or (not (= (size!27725 (_values!5585 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27101 thiss!1141)))) (not (= (size!27726 (_keys!10412 thiss!1141)) (size!27725 (_values!5585 thiss!1141)))) (bvslt (mask!27101 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5294 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5294 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940387 () Bool)

(declare-fun e!528455 () Bool)

(declare-fun e!528454 () Bool)

(assert (=> b!940387 (= e!528455 e!528454)))

(declare-fun res!632320 () Bool)

(assert (=> b!940387 (=> (not res!632320) (not e!528454))))

(declare-datatypes ((SeekEntryResult!8997 0))(
  ( (MissingZero!8997 (index!38359 (_ BitVec 32))) (Found!8997 (index!38360 (_ BitVec 32))) (Intermediate!8997 (undefined!9809 Bool) (index!38361 (_ BitVec 32)) (x!80650 (_ BitVec 32))) (Undefined!8997) (MissingVacant!8997 (index!38362 (_ BitVec 32))) )
))
(declare-fun lt!424694 () SeekEntryResult!8997)

(get-info :version)

(assert (=> b!940387 (= res!632320 ((_ is Found!8997) lt!424694))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56660 (_ BitVec 32)) SeekEntryResult!8997)

(assert (=> b!940387 (= lt!424694 (seekEntry!0 key!756 (_keys!10412 thiss!1141) (mask!27101 thiss!1141)))))

(declare-fun b!940388 () Bool)

(declare-fun res!632319 () Bool)

(assert (=> b!940388 (=> res!632319 e!528460)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56660 (_ BitVec 32)) Bool)

(assert (=> b!940388 (= res!632319 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10412 thiss!1141) (mask!27101 thiss!1141))))))

(declare-fun b!940389 () Bool)

(assert (=> b!940389 (= e!528460 true)))

(declare-fun lt!424696 () Bool)

(declare-datatypes ((List!19186 0))(
  ( (Nil!19183) (Cons!19182 (h!20328 (_ BitVec 64)) (t!27501 List!19186)) )
))
(declare-fun arrayNoDuplicates!0 (array!56660 (_ BitVec 32) List!19186) Bool)

(assert (=> b!940389 (= lt!424696 (arrayNoDuplicates!0 (_keys!10412 thiss!1141) #b00000000000000000000000000000000 Nil!19183))))

(declare-fun e!528456 () Bool)

(declare-fun e!528457 () Bool)

(declare-fun tp_is_empty!20355 () Bool)

(declare-fun array_inv!21192 (array!56660) Bool)

(declare-fun array_inv!21193 (array!56658) Bool)

(assert (=> b!940390 (= e!528457 (and tp!62015 tp_is_empty!20355 (array_inv!21192 (_keys!10412 thiss!1141)) (array_inv!21193 (_values!5585 thiss!1141)) e!528456))))

(declare-fun b!940391 () Bool)

(declare-fun e!528453 () Bool)

(assert (=> b!940391 (= e!528453 tp_is_empty!20355)))

(declare-fun b!940392 () Bool)

(assert (=> b!940392 (= e!528456 (and e!528453 mapRes!32323))))

(declare-fun condMapEmpty!32323 () Bool)

(declare-fun mapDefault!32323 () ValueCell!9696)

(assert (=> b!940392 (= condMapEmpty!32323 (= (arr!27264 (_values!5585 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9696)) mapDefault!32323)))))

(declare-fun res!632321 () Bool)

(assert (=> start!79992 (=> (not res!632321) (not e!528455))))

(declare-fun valid!1742 (LongMapFixedSize!4542) Bool)

(assert (=> start!79992 (= res!632321 (valid!1742 thiss!1141))))

(assert (=> start!79992 e!528455))

(assert (=> start!79992 e!528457))

(assert (=> start!79992 true))

(declare-fun mapNonEmpty!32323 () Bool)

(declare-fun tp!62016 () Bool)

(declare-fun e!528459 () Bool)

(assert (=> mapNonEmpty!32323 (= mapRes!32323 (and tp!62016 e!528459))))

(declare-fun mapRest!32323 () (Array (_ BitVec 32) ValueCell!9696))

(declare-fun mapKey!32323 () (_ BitVec 32))

(declare-fun mapValue!32323 () ValueCell!9696)

(assert (=> mapNonEmpty!32323 (= (arr!27264 (_values!5585 thiss!1141)) (store mapRest!32323 mapKey!32323 mapValue!32323))))

(declare-fun b!940393 () Bool)

(assert (=> b!940393 (= e!528459 tp_is_empty!20355)))

(declare-fun b!940394 () Bool)

(declare-fun res!632318 () Bool)

(assert (=> b!940394 (=> (not res!632318) (not e!528455))))

(assert (=> b!940394 (= res!632318 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940395 () Bool)

(assert (=> b!940395 (= e!528454 (not e!528460))))

(declare-fun res!632322 () Bool)

(assert (=> b!940395 (=> res!632322 e!528460)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940395 (= res!632322 (not (validMask!0 (mask!27101 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940395 (arrayContainsKey!0 (_keys!10412 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31762 0))(
  ( (Unit!31763) )
))
(declare-fun lt!424695 () Unit!31762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56660 (_ BitVec 64) (_ BitVec 32)) Unit!31762)

(assert (=> b!940395 (= lt!424695 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10412 thiss!1141) key!756 (index!38360 lt!424694)))))

(assert (= (and start!79992 res!632321) b!940394))

(assert (= (and b!940394 res!632318) b!940387))

(assert (= (and b!940387 res!632320) b!940395))

(assert (= (and b!940395 (not res!632322)) b!940386))

(assert (= (and b!940386 (not res!632323)) b!940388))

(assert (= (and b!940388 (not res!632319)) b!940389))

(assert (= (and b!940392 condMapEmpty!32323) mapIsEmpty!32323))

(assert (= (and b!940392 (not condMapEmpty!32323)) mapNonEmpty!32323))

(assert (= (and mapNonEmpty!32323 ((_ is ValueCellFull!9696) mapValue!32323)) b!940393))

(assert (= (and b!940392 ((_ is ValueCellFull!9696) mapDefault!32323)) b!940391))

(assert (= b!940390 b!940392))

(assert (= start!79992 b!940390))

(declare-fun m!875853 () Bool)

(assert (=> b!940387 m!875853))

(declare-fun m!875855 () Bool)

(assert (=> mapNonEmpty!32323 m!875855))

(declare-fun m!875857 () Bool)

(assert (=> start!79992 m!875857))

(declare-fun m!875859 () Bool)

(assert (=> b!940395 m!875859))

(declare-fun m!875861 () Bool)

(assert (=> b!940395 m!875861))

(declare-fun m!875863 () Bool)

(assert (=> b!940395 m!875863))

(declare-fun m!875865 () Bool)

(assert (=> b!940388 m!875865))

(declare-fun m!875867 () Bool)

(assert (=> b!940389 m!875867))

(declare-fun m!875869 () Bool)

(assert (=> b!940390 m!875869))

(declare-fun m!875871 () Bool)

(assert (=> b!940390 m!875871))

(check-sat (not start!79992) b_and!29259 (not mapNonEmpty!32323) (not b!940390) (not b!940389) (not b!940388) (not b!940387) (not b!940395) tp_is_empty!20355 (not b_next!17847))
(check-sat b_and!29259 (not b_next!17847))
