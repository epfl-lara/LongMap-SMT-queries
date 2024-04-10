; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79986 () Bool)

(assert start!79986)

(declare-fun b!940304 () Bool)

(declare-fun b_free!17841 () Bool)

(declare-fun b_next!17841 () Bool)

(assert (=> b!940304 (= b_free!17841 (not b_next!17841))))

(declare-fun tp!61997 () Bool)

(declare-fun b_and!29253 () Bool)

(assert (=> b!940304 (= tp!61997 b_and!29253)))

(declare-fun b!940296 () Bool)

(declare-fun e!528381 () Bool)

(declare-fun tp_is_empty!20349 () Bool)

(assert (=> b!940296 (= e!528381 tp_is_empty!20349)))

(declare-fun b!940297 () Bool)

(declare-fun res!632264 () Bool)

(declare-fun e!528388 () Bool)

(assert (=> b!940297 (=> res!632264 e!528388)))

(declare-datatypes ((V!32097 0))(
  ( (V!32098 (val!10225 Int)) )
))
(declare-datatypes ((ValueCell!9693 0))(
  ( (ValueCellFull!9693 (v!12756 V!32097)) (EmptyCell!9693) )
))
(declare-datatypes ((array!56646 0))(
  ( (array!56647 (arr!27258 (Array (_ BitVec 32) ValueCell!9693)) (size!27719 (_ BitVec 32))) )
))
(declare-datatypes ((array!56648 0))(
  ( (array!56649 (arr!27259 (Array (_ BitVec 32) (_ BitVec 64))) (size!27720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4536 0))(
  ( (LongMapFixedSize!4537 (defaultEntry!5559 Int) (mask!27096 (_ BitVec 32)) (extraKeys!5291 (_ BitVec 32)) (zeroValue!5395 V!32097) (minValue!5395 V!32097) (_size!2323 (_ BitVec 32)) (_keys!10409 array!56648) (_values!5582 array!56646) (_vacant!2323 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4536)

(assert (=> b!940297 (= res!632264 (or (not (= (size!27719 (_values!5582 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27096 thiss!1141)))) (not (= (size!27720 (_keys!10409 thiss!1141)) (size!27719 (_values!5582 thiss!1141)))) (bvslt (mask!27096 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5291 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5291 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940298 () Bool)

(declare-fun e!528385 () Bool)

(declare-fun e!528386 () Bool)

(declare-fun mapRes!32314 () Bool)

(assert (=> b!940298 (= e!528385 (and e!528386 mapRes!32314))))

(declare-fun condMapEmpty!32314 () Bool)

(declare-fun mapDefault!32314 () ValueCell!9693)

(assert (=> b!940298 (= condMapEmpty!32314 (= (arr!27258 (_values!5582 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9693)) mapDefault!32314)))))

(declare-fun b!940299 () Bool)

(declare-fun e!528383 () Bool)

(assert (=> b!940299 (= e!528383 (not e!528388))))

(declare-fun res!632268 () Bool)

(assert (=> b!940299 (=> res!632268 e!528388)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940299 (= res!632268 (not (validMask!0 (mask!27096 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940299 (arrayContainsKey!0 (_keys!10409 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8995 0))(
  ( (MissingZero!8995 (index!38351 (_ BitVec 32))) (Found!8995 (index!38352 (_ BitVec 32))) (Intermediate!8995 (undefined!9807 Bool) (index!38353 (_ BitVec 32)) (x!80640 (_ BitVec 32))) (Undefined!8995) (MissingVacant!8995 (index!38354 (_ BitVec 32))) )
))
(declare-fun lt!424667 () SeekEntryResult!8995)

(declare-datatypes ((Unit!31758 0))(
  ( (Unit!31759) )
))
(declare-fun lt!424669 () Unit!31758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56648 (_ BitVec 64) (_ BitVec 32)) Unit!31758)

(assert (=> b!940299 (= lt!424669 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10409 thiss!1141) key!756 (index!38352 lt!424667)))))

(declare-fun b!940300 () Bool)

(declare-fun e!528387 () Bool)

(assert (=> b!940300 (= e!528387 e!528383)))

(declare-fun res!632265 () Bool)

(assert (=> b!940300 (=> (not res!632265) (not e!528383))))

(get-info :version)

(assert (=> b!940300 (= res!632265 ((_ is Found!8995) lt!424667))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56648 (_ BitVec 32)) SeekEntryResult!8995)

(assert (=> b!940300 (= lt!424667 (seekEntry!0 key!756 (_keys!10409 thiss!1141) (mask!27096 thiss!1141)))))

(declare-fun mapNonEmpty!32314 () Bool)

(declare-fun tp!61998 () Bool)

(assert (=> mapNonEmpty!32314 (= mapRes!32314 (and tp!61998 e!528381))))

(declare-fun mapKey!32314 () (_ BitVec 32))

(declare-fun mapValue!32314 () ValueCell!9693)

(declare-fun mapRest!32314 () (Array (_ BitVec 32) ValueCell!9693))

(assert (=> mapNonEmpty!32314 (= (arr!27258 (_values!5582 thiss!1141)) (store mapRest!32314 mapKey!32314 mapValue!32314))))

(declare-fun mapIsEmpty!32314 () Bool)

(assert (=> mapIsEmpty!32314 mapRes!32314))

(declare-fun b!940301 () Bool)

(assert (=> b!940301 (= e!528386 tp_is_empty!20349)))

(declare-fun b!940302 () Bool)

(assert (=> b!940302 (= e!528388 true)))

(declare-fun lt!424668 () Bool)

(declare-datatypes ((List!19184 0))(
  ( (Nil!19181) (Cons!19180 (h!20326 (_ BitVec 64)) (t!27499 List!19184)) )
))
(declare-fun arrayNoDuplicates!0 (array!56648 (_ BitVec 32) List!19184) Bool)

(assert (=> b!940302 (= lt!424668 (arrayNoDuplicates!0 (_keys!10409 thiss!1141) #b00000000000000000000000000000000 Nil!19181))))

(declare-fun e!528382 () Bool)

(declare-fun array_inv!21190 (array!56648) Bool)

(declare-fun array_inv!21191 (array!56646) Bool)

(assert (=> b!940304 (= e!528382 (and tp!61997 tp_is_empty!20349 (array_inv!21190 (_keys!10409 thiss!1141)) (array_inv!21191 (_values!5582 thiss!1141)) e!528385))))

(declare-fun b!940305 () Bool)

(declare-fun res!632269 () Bool)

(assert (=> b!940305 (=> (not res!632269) (not e!528387))))

(assert (=> b!940305 (= res!632269 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940303 () Bool)

(declare-fun res!632266 () Bool)

(assert (=> b!940303 (=> res!632266 e!528388)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56648 (_ BitVec 32)) Bool)

(assert (=> b!940303 (= res!632266 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10409 thiss!1141) (mask!27096 thiss!1141))))))

(declare-fun res!632267 () Bool)

(assert (=> start!79986 (=> (not res!632267) (not e!528387))))

(declare-fun valid!1740 (LongMapFixedSize!4536) Bool)

(assert (=> start!79986 (= res!632267 (valid!1740 thiss!1141))))

(assert (=> start!79986 e!528387))

(assert (=> start!79986 e!528382))

(assert (=> start!79986 true))

(assert (= (and start!79986 res!632267) b!940305))

(assert (= (and b!940305 res!632269) b!940300))

(assert (= (and b!940300 res!632265) b!940299))

(assert (= (and b!940299 (not res!632268)) b!940297))

(assert (= (and b!940297 (not res!632264)) b!940303))

(assert (= (and b!940303 (not res!632266)) b!940302))

(assert (= (and b!940298 condMapEmpty!32314) mapIsEmpty!32314))

(assert (= (and b!940298 (not condMapEmpty!32314)) mapNonEmpty!32314))

(assert (= (and mapNonEmpty!32314 ((_ is ValueCellFull!9693) mapValue!32314)) b!940296))

(assert (= (and b!940298 ((_ is ValueCellFull!9693) mapDefault!32314)) b!940301))

(assert (= b!940304 b!940298))

(assert (= start!79986 b!940304))

(declare-fun m!875793 () Bool)

(assert (=> b!940303 m!875793))

(declare-fun m!875795 () Bool)

(assert (=> start!79986 m!875795))

(declare-fun m!875797 () Bool)

(assert (=> mapNonEmpty!32314 m!875797))

(declare-fun m!875799 () Bool)

(assert (=> b!940302 m!875799))

(declare-fun m!875801 () Bool)

(assert (=> b!940299 m!875801))

(declare-fun m!875803 () Bool)

(assert (=> b!940299 m!875803))

(declare-fun m!875805 () Bool)

(assert (=> b!940299 m!875805))

(declare-fun m!875807 () Bool)

(assert (=> b!940300 m!875807))

(declare-fun m!875809 () Bool)

(assert (=> b!940304 m!875809))

(declare-fun m!875811 () Bool)

(assert (=> b!940304 m!875811))

(check-sat (not b!940300) (not b!940304) (not b!940303) (not b!940302) (not b!940299) (not start!79986) b_and!29253 (not mapNonEmpty!32314) tp_is_empty!20349 (not b_next!17841))
(check-sat b_and!29253 (not b_next!17841))
