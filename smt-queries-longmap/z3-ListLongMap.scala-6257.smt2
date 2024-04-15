; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79990 () Bool)

(assert start!79990)

(declare-fun b!940389 () Bool)

(declare-fun b_free!17863 () Bool)

(declare-fun b_next!17863 () Bool)

(assert (=> b!940389 (= b_free!17863 (not b_next!17863))))

(declare-fun tp!62065 () Bool)

(declare-fun b_and!29249 () Bool)

(assert (=> b!940389 (= tp!62065 b_and!29249)))

(declare-fun mapNonEmpty!32347 () Bool)

(declare-fun mapRes!32347 () Bool)

(declare-fun tp!62064 () Bool)

(declare-fun e!528500 () Bool)

(assert (=> mapNonEmpty!32347 (= mapRes!32347 (and tp!62064 e!528500))))

(declare-datatypes ((V!32127 0))(
  ( (V!32128 (val!10236 Int)) )
))
(declare-datatypes ((ValueCell!9704 0))(
  ( (ValueCellFull!9704 (v!12766 V!32127)) (EmptyCell!9704) )
))
(declare-fun mapValue!32347 () ValueCell!9704)

(declare-fun mapKey!32347 () (_ BitVec 32))

(declare-datatypes ((array!56655 0))(
  ( (array!56656 (arr!27263 (Array (_ BitVec 32) ValueCell!9704)) (size!27726 (_ BitVec 32))) )
))
(declare-datatypes ((array!56657 0))(
  ( (array!56658 (arr!27264 (Array (_ BitVec 32) (_ BitVec 64))) (size!27727 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4558 0))(
  ( (LongMapFixedSize!4559 (defaultEntry!5570 Int) (mask!27108 (_ BitVec 32)) (extraKeys!5302 (_ BitVec 32)) (zeroValue!5406 V!32127) (minValue!5406 V!32127) (_size!2334 (_ BitVec 32)) (_keys!10415 array!56657) (_values!5593 array!56655) (_vacant!2334 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4558)

(declare-fun mapRest!32347 () (Array (_ BitVec 32) ValueCell!9704))

(assert (=> mapNonEmpty!32347 (= (arr!27263 (_values!5593 thiss!1141)) (store mapRest!32347 mapKey!32347 mapValue!32347))))

(declare-fun mapIsEmpty!32347 () Bool)

(assert (=> mapIsEmpty!32347 mapRes!32347))

(declare-fun res!632357 () Bool)

(declare-fun e!528502 () Bool)

(assert (=> start!79990 (=> (not res!632357) (not e!528502))))

(declare-fun valid!1756 (LongMapFixedSize!4558) Bool)

(assert (=> start!79990 (= res!632357 (valid!1756 thiss!1141))))

(assert (=> start!79990 e!528502))

(declare-fun e!528503 () Bool)

(assert (=> start!79990 e!528503))

(assert (=> start!79990 true))

(declare-fun b!940387 () Bool)

(declare-fun e!528497 () Bool)

(assert (=> b!940387 (= e!528502 e!528497)))

(declare-fun res!632356 () Bool)

(assert (=> b!940387 (=> (not res!632356) (not e!528497))))

(declare-datatypes ((SeekEntryResult!9004 0))(
  ( (MissingZero!9004 (index!38387 (_ BitVec 32))) (Found!9004 (index!38388 (_ BitVec 32))) (Intermediate!9004 (undefined!9816 Bool) (index!38389 (_ BitVec 32)) (x!80676 (_ BitVec 32))) (Undefined!9004) (MissingVacant!9004 (index!38390 (_ BitVec 32))) )
))
(declare-fun lt!424530 () SeekEntryResult!9004)

(get-info :version)

(assert (=> b!940387 (= res!632356 ((_ is Found!9004) lt!424530))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56657 (_ BitVec 32)) SeekEntryResult!9004)

(assert (=> b!940387 (= lt!424530 (seekEntry!0 key!756 (_keys!10415 thiss!1141) (mask!27108 thiss!1141)))))

(declare-fun b!940388 () Bool)

(declare-fun res!632354 () Bool)

(declare-fun e!528501 () Bool)

(assert (=> b!940388 (=> res!632354 e!528501)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56657 (_ BitVec 32)) Bool)

(assert (=> b!940388 (= res!632354 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10415 thiss!1141) (mask!27108 thiss!1141))))))

(declare-fun e!528498 () Bool)

(declare-fun tp_is_empty!20371 () Bool)

(declare-fun array_inv!21256 (array!56657) Bool)

(declare-fun array_inv!21257 (array!56655) Bool)

(assert (=> b!940389 (= e!528503 (and tp!62065 tp_is_empty!20371 (array_inv!21256 (_keys!10415 thiss!1141)) (array_inv!21257 (_values!5593 thiss!1141)) e!528498))))

(declare-fun b!940390 () Bool)

(assert (=> b!940390 (= e!528501 true)))

(declare-fun lt!424532 () Bool)

(declare-datatypes ((List!19205 0))(
  ( (Nil!19202) (Cons!19201 (h!20347 (_ BitVec 64)) (t!27511 List!19205)) )
))
(declare-fun arrayNoDuplicates!0 (array!56657 (_ BitVec 32) List!19205) Bool)

(assert (=> b!940390 (= lt!424532 (arrayNoDuplicates!0 (_keys!10415 thiss!1141) #b00000000000000000000000000000000 Nil!19202))))

(declare-fun b!940391 () Bool)

(assert (=> b!940391 (= e!528497 (not e!528501))))

(declare-fun res!632355 () Bool)

(assert (=> b!940391 (=> res!632355 e!528501)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940391 (= res!632355 (not (validMask!0 (mask!27108 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940391 (arrayContainsKey!0 (_keys!10415 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31661 0))(
  ( (Unit!31662) )
))
(declare-fun lt!424531 () Unit!31661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56657 (_ BitVec 64) (_ BitVec 32)) Unit!31661)

(assert (=> b!940391 (= lt!424531 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10415 thiss!1141) key!756 (index!38388 lt!424530)))))

(declare-fun b!940392 () Bool)

(declare-fun e!528504 () Bool)

(assert (=> b!940392 (= e!528498 (and e!528504 mapRes!32347))))

(declare-fun condMapEmpty!32347 () Bool)

(declare-fun mapDefault!32347 () ValueCell!9704)

(assert (=> b!940392 (= condMapEmpty!32347 (= (arr!27263 (_values!5593 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9704)) mapDefault!32347)))))

(declare-fun b!940393 () Bool)

(assert (=> b!940393 (= e!528500 tp_is_empty!20371)))

(declare-fun b!940394 () Bool)

(declare-fun res!632353 () Bool)

(assert (=> b!940394 (=> (not res!632353) (not e!528502))))

(assert (=> b!940394 (= res!632353 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940395 () Bool)

(declare-fun res!632352 () Bool)

(assert (=> b!940395 (=> res!632352 e!528501)))

(assert (=> b!940395 (= res!632352 (or (not (= (size!27726 (_values!5593 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27108 thiss!1141)))) (not (= (size!27727 (_keys!10415 thiss!1141)) (size!27726 (_values!5593 thiss!1141)))) (bvslt (mask!27108 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5302 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5302 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940396 () Bool)

(assert (=> b!940396 (= e!528504 tp_is_empty!20371)))

(assert (= (and start!79990 res!632357) b!940394))

(assert (= (and b!940394 res!632353) b!940387))

(assert (= (and b!940387 res!632356) b!940391))

(assert (= (and b!940391 (not res!632355)) b!940395))

(assert (= (and b!940395 (not res!632352)) b!940388))

(assert (= (and b!940388 (not res!632354)) b!940390))

(assert (= (and b!940392 condMapEmpty!32347) mapIsEmpty!32347))

(assert (= (and b!940392 (not condMapEmpty!32347)) mapNonEmpty!32347))

(assert (= (and mapNonEmpty!32347 ((_ is ValueCellFull!9704) mapValue!32347)) b!940393))

(assert (= (and b!940392 ((_ is ValueCellFull!9704) mapDefault!32347)) b!940396))

(assert (= b!940389 b!940392))

(assert (= start!79990 b!940389))

(declare-fun m!875255 () Bool)

(assert (=> b!940388 m!875255))

(declare-fun m!875257 () Bool)

(assert (=> b!940387 m!875257))

(declare-fun m!875259 () Bool)

(assert (=> b!940390 m!875259))

(declare-fun m!875261 () Bool)

(assert (=> b!940391 m!875261))

(declare-fun m!875263 () Bool)

(assert (=> b!940391 m!875263))

(declare-fun m!875265 () Bool)

(assert (=> b!940391 m!875265))

(declare-fun m!875267 () Bool)

(assert (=> mapNonEmpty!32347 m!875267))

(declare-fun m!875269 () Bool)

(assert (=> start!79990 m!875269))

(declare-fun m!875271 () Bool)

(assert (=> b!940389 m!875271))

(declare-fun m!875273 () Bool)

(assert (=> b!940389 m!875273))

(check-sat (not start!79990) b_and!29249 (not b!940388) (not b!940391) (not b!940390) (not b!940387) (not mapNonEmpty!32347) tp_is_empty!20371 (not b_next!17863) (not b!940389))
(check-sat b_and!29249 (not b_next!17863))
