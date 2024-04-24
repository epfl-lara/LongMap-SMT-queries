; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80288 () Bool)

(assert start!80288)

(declare-fun b!942552 () Bool)

(declare-fun b_free!17917 () Bool)

(declare-fun b_next!17917 () Bool)

(assert (=> b!942552 (= b_free!17917 (not b_next!17917))))

(declare-fun tp!62238 () Bool)

(declare-fun b_and!29339 () Bool)

(assert (=> b!942552 (= tp!62238 b_and!29339)))

(declare-fun b!942546 () Bool)

(declare-fun e!529979 () Bool)

(declare-fun e!529974 () Bool)

(declare-fun mapRes!32439 () Bool)

(assert (=> b!942546 (= e!529979 (and e!529974 mapRes!32439))))

(declare-fun condMapEmpty!32439 () Bool)

(declare-datatypes ((V!32199 0))(
  ( (V!32200 (val!10263 Int)) )
))
(declare-datatypes ((ValueCell!9731 0))(
  ( (ValueCellFull!9731 (v!12791 V!32199)) (EmptyCell!9731) )
))
(declare-datatypes ((array!56855 0))(
  ( (array!56856 (arr!27355 (Array (_ BitVec 32) ValueCell!9731)) (size!27819 (_ BitVec 32))) )
))
(declare-datatypes ((array!56857 0))(
  ( (array!56858 (arr!27356 (Array (_ BitVec 32) (_ BitVec 64))) (size!27820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4612 0))(
  ( (LongMapFixedSize!4613 (defaultEntry!5597 Int) (mask!27217 (_ BitVec 32)) (extraKeys!5329 (_ BitVec 32)) (zeroValue!5433 V!32199) (minValue!5433 V!32199) (_size!2361 (_ BitVec 32)) (_keys!10484 array!56857) (_values!5620 array!56855) (_vacant!2361 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4612)

(declare-fun mapDefault!32439 () ValueCell!9731)

(assert (=> b!942546 (= condMapEmpty!32439 (= (arr!27355 (_values!5620 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9731)) mapDefault!32439)))))

(declare-fun b!942547 () Bool)

(declare-fun tp_is_empty!20425 () Bool)

(assert (=> b!942547 (= e!529974 tp_is_empty!20425)))

(declare-fun b!942548 () Bool)

(declare-fun res!633299 () Bool)

(declare-fun e!529977 () Bool)

(assert (=> b!942548 (=> (not res!633299) (not e!529977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942548 (= res!633299 (validMask!0 (mask!27217 thiss!1141)))))

(declare-fun b!942549 () Bool)

(declare-fun e!529978 () Bool)

(assert (=> b!942549 (= e!529978 tp_is_empty!20425)))

(declare-fun b!942550 () Bool)

(assert (=> b!942550 (= e!529977 (and (= (size!27819 (_values!5620 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27217 thiss!1141))) (= (size!27820 (_keys!10484 thiss!1141)) (size!27819 (_values!5620 thiss!1141))) (bvslt (mask!27217 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun res!633302 () Bool)

(assert (=> start!80288 (=> (not res!633302) (not e!529977))))

(declare-fun valid!1771 (LongMapFixedSize!4612) Bool)

(assert (=> start!80288 (= res!633302 (valid!1771 thiss!1141))))

(assert (=> start!80288 e!529977))

(declare-fun e!529976 () Bool)

(assert (=> start!80288 e!529976))

(assert (=> start!80288 true))

(declare-fun mapIsEmpty!32439 () Bool)

(assert (=> mapIsEmpty!32439 mapRes!32439))

(declare-fun b!942551 () Bool)

(declare-fun res!633301 () Bool)

(assert (=> b!942551 (=> (not res!633301) (not e!529977))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8978 0))(
  ( (MissingZero!8978 (index!38283 (_ BitVec 32))) (Found!8978 (index!38284 (_ BitVec 32))) (Intermediate!8978 (undefined!9790 Bool) (index!38285 (_ BitVec 32)) (x!80783 (_ BitVec 32))) (Undefined!8978) (MissingVacant!8978 (index!38286 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56857 (_ BitVec 32)) SeekEntryResult!8978)

(assert (=> b!942551 (= res!633301 (not ((_ is Found!8978) (seekEntry!0 key!756 (_keys!10484 thiss!1141) (mask!27217 thiss!1141)))))))

(declare-fun array_inv!21348 (array!56857) Bool)

(declare-fun array_inv!21349 (array!56855) Bool)

(assert (=> b!942552 (= e!529976 (and tp!62238 tp_is_empty!20425 (array_inv!21348 (_keys!10484 thiss!1141)) (array_inv!21349 (_values!5620 thiss!1141)) e!529979))))

(declare-fun mapNonEmpty!32439 () Bool)

(declare-fun tp!62237 () Bool)

(assert (=> mapNonEmpty!32439 (= mapRes!32439 (and tp!62237 e!529978))))

(declare-fun mapRest!32439 () (Array (_ BitVec 32) ValueCell!9731))

(declare-fun mapValue!32439 () ValueCell!9731)

(declare-fun mapKey!32439 () (_ BitVec 32))

(assert (=> mapNonEmpty!32439 (= (arr!27355 (_values!5620 thiss!1141)) (store mapRest!32439 mapKey!32439 mapValue!32439))))

(declare-fun b!942553 () Bool)

(declare-fun res!633300 () Bool)

(assert (=> b!942553 (=> (not res!633300) (not e!529977))))

(assert (=> b!942553 (= res!633300 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80288 res!633302) b!942553))

(assert (= (and b!942553 res!633300) b!942551))

(assert (= (and b!942551 res!633301) b!942548))

(assert (= (and b!942548 res!633299) b!942550))

(assert (= (and b!942546 condMapEmpty!32439) mapIsEmpty!32439))

(assert (= (and b!942546 (not condMapEmpty!32439)) mapNonEmpty!32439))

(assert (= (and mapNonEmpty!32439 ((_ is ValueCellFull!9731) mapValue!32439)) b!942549))

(assert (= (and b!942546 ((_ is ValueCellFull!9731) mapDefault!32439)) b!942547))

(assert (= b!942552 b!942546))

(assert (= start!80288 b!942552))

(declare-fun m!877917 () Bool)

(assert (=> b!942548 m!877917))

(declare-fun m!877919 () Bool)

(assert (=> mapNonEmpty!32439 m!877919))

(declare-fun m!877921 () Bool)

(assert (=> start!80288 m!877921))

(declare-fun m!877923 () Bool)

(assert (=> b!942551 m!877923))

(declare-fun m!877925 () Bool)

(assert (=> b!942552 m!877925))

(declare-fun m!877927 () Bool)

(assert (=> b!942552 m!877927))

(check-sat b_and!29339 (not b_next!17917) (not start!80288) (not b!942551) (not b!942552) (not b!942548) tp_is_empty!20425 (not mapNonEmpty!32439))
(check-sat b_and!29339 (not b_next!17917))
(get-model)

(declare-fun d!114417 () Bool)

(assert (=> d!114417 (= (validMask!0 (mask!27217 thiss!1141)) (and (or (= (mask!27217 thiss!1141) #b00000000000000000000000000000111) (= (mask!27217 thiss!1141) #b00000000000000000000000000001111) (= (mask!27217 thiss!1141) #b00000000000000000000000000011111) (= (mask!27217 thiss!1141) #b00000000000000000000000000111111) (= (mask!27217 thiss!1141) #b00000000000000000000000001111111) (= (mask!27217 thiss!1141) #b00000000000000000000000011111111) (= (mask!27217 thiss!1141) #b00000000000000000000000111111111) (= (mask!27217 thiss!1141) #b00000000000000000000001111111111) (= (mask!27217 thiss!1141) #b00000000000000000000011111111111) (= (mask!27217 thiss!1141) #b00000000000000000000111111111111) (= (mask!27217 thiss!1141) #b00000000000000000001111111111111) (= (mask!27217 thiss!1141) #b00000000000000000011111111111111) (= (mask!27217 thiss!1141) #b00000000000000000111111111111111) (= (mask!27217 thiss!1141) #b00000000000000001111111111111111) (= (mask!27217 thiss!1141) #b00000000000000011111111111111111) (= (mask!27217 thiss!1141) #b00000000000000111111111111111111) (= (mask!27217 thiss!1141) #b00000000000001111111111111111111) (= (mask!27217 thiss!1141) #b00000000000011111111111111111111) (= (mask!27217 thiss!1141) #b00000000000111111111111111111111) (= (mask!27217 thiss!1141) #b00000000001111111111111111111111) (= (mask!27217 thiss!1141) #b00000000011111111111111111111111) (= (mask!27217 thiss!1141) #b00000000111111111111111111111111) (= (mask!27217 thiss!1141) #b00000001111111111111111111111111) (= (mask!27217 thiss!1141) #b00000011111111111111111111111111) (= (mask!27217 thiss!1141) #b00000111111111111111111111111111) (= (mask!27217 thiss!1141) #b00001111111111111111111111111111) (= (mask!27217 thiss!1141) #b00011111111111111111111111111111) (= (mask!27217 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27217 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942548 d!114417))

(declare-fun d!114419 () Bool)

(assert (=> d!114419 (= (array_inv!21348 (_keys!10484 thiss!1141)) (bvsge (size!27820 (_keys!10484 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942552 d!114419))

(declare-fun d!114421 () Bool)

(assert (=> d!114421 (= (array_inv!21349 (_values!5620 thiss!1141)) (bvsge (size!27819 (_values!5620 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942552 d!114421))

(declare-fun d!114423 () Bool)

(declare-fun res!633333 () Bool)

(declare-fun e!530018 () Bool)

(assert (=> d!114423 (=> (not res!633333) (not e!530018))))

(declare-fun simpleValid!342 (LongMapFixedSize!4612) Bool)

(assert (=> d!114423 (= res!633333 (simpleValid!342 thiss!1141))))

(assert (=> d!114423 (= (valid!1771 thiss!1141) e!530018)))

(declare-fun b!942608 () Bool)

(declare-fun res!633334 () Bool)

(assert (=> b!942608 (=> (not res!633334) (not e!530018))))

(declare-fun arrayCountValidKeys!0 (array!56857 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942608 (= res!633334 (= (arrayCountValidKeys!0 (_keys!10484 thiss!1141) #b00000000000000000000000000000000 (size!27820 (_keys!10484 thiss!1141))) (_size!2361 thiss!1141)))))

(declare-fun b!942609 () Bool)

(declare-fun res!633335 () Bool)

(assert (=> b!942609 (=> (not res!633335) (not e!530018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56857 (_ BitVec 32)) Bool)

(assert (=> b!942609 (= res!633335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10484 thiss!1141) (mask!27217 thiss!1141)))))

(declare-fun b!942610 () Bool)

(declare-datatypes ((List!19193 0))(
  ( (Nil!19190) (Cons!19189 (h!20343 (_ BitVec 64)) (t!27500 List!19193)) )
))
(declare-fun arrayNoDuplicates!0 (array!56857 (_ BitVec 32) List!19193) Bool)

(assert (=> b!942610 (= e!530018 (arrayNoDuplicates!0 (_keys!10484 thiss!1141) #b00000000000000000000000000000000 Nil!19190))))

(assert (= (and d!114423 res!633333) b!942608))

(assert (= (and b!942608 res!633334) b!942609))

(assert (= (and b!942609 res!633335) b!942610))

(declare-fun m!877953 () Bool)

(assert (=> d!114423 m!877953))

(declare-fun m!877955 () Bool)

(assert (=> b!942608 m!877955))

(declare-fun m!877957 () Bool)

(assert (=> b!942609 m!877957))

(declare-fun m!877959 () Bool)

(assert (=> b!942610 m!877959))

(assert (=> start!80288 d!114423))

(declare-fun d!114425 () Bool)

(declare-fun lt!425390 () SeekEntryResult!8978)

(assert (=> d!114425 (and (or ((_ is MissingVacant!8978) lt!425390) (not ((_ is Found!8978) lt!425390)) (and (bvsge (index!38284 lt!425390) #b00000000000000000000000000000000) (bvslt (index!38284 lt!425390) (size!27820 (_keys!10484 thiss!1141))))) (not ((_ is MissingVacant!8978) lt!425390)) (or (not ((_ is Found!8978) lt!425390)) (= (select (arr!27356 (_keys!10484 thiss!1141)) (index!38284 lt!425390)) key!756)))))

(declare-fun e!530025 () SeekEntryResult!8978)

(assert (=> d!114425 (= lt!425390 e!530025)))

(declare-fun c!98404 () Bool)

(declare-fun lt!425387 () SeekEntryResult!8978)

(assert (=> d!114425 (= c!98404 (and ((_ is Intermediate!8978) lt!425387) (undefined!9790 lt!425387)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56857 (_ BitVec 32)) SeekEntryResult!8978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114425 (= lt!425387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27217 thiss!1141)) key!756 (_keys!10484 thiss!1141) (mask!27217 thiss!1141)))))

(assert (=> d!114425 (validMask!0 (mask!27217 thiss!1141))))

(assert (=> d!114425 (= (seekEntry!0 key!756 (_keys!10484 thiss!1141) (mask!27217 thiss!1141)) lt!425390)))

(declare-fun b!942623 () Bool)

(assert (=> b!942623 (= e!530025 Undefined!8978)))

(declare-fun b!942624 () Bool)

(declare-fun e!530027 () SeekEntryResult!8978)

(assert (=> b!942624 (= e!530027 (Found!8978 (index!38285 lt!425387)))))

(declare-fun b!942625 () Bool)

(declare-fun e!530026 () SeekEntryResult!8978)

(assert (=> b!942625 (= e!530026 (MissingZero!8978 (index!38285 lt!425387)))))

(declare-fun b!942626 () Bool)

(declare-fun c!98402 () Bool)

(declare-fun lt!425388 () (_ BitVec 64))

(assert (=> b!942626 (= c!98402 (= lt!425388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942626 (= e!530027 e!530026)))

(declare-fun b!942627 () Bool)

(assert (=> b!942627 (= e!530025 e!530027)))

(assert (=> b!942627 (= lt!425388 (select (arr!27356 (_keys!10484 thiss!1141)) (index!38285 lt!425387)))))

(declare-fun c!98403 () Bool)

(assert (=> b!942627 (= c!98403 (= lt!425388 key!756))))

(declare-fun b!942628 () Bool)

(declare-fun lt!425389 () SeekEntryResult!8978)

(assert (=> b!942628 (= e!530026 (ite ((_ is MissingVacant!8978) lt!425389) (MissingZero!8978 (index!38286 lt!425389)) lt!425389))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56857 (_ BitVec 32)) SeekEntryResult!8978)

(assert (=> b!942628 (= lt!425389 (seekKeyOrZeroReturnVacant!0 (x!80783 lt!425387) (index!38285 lt!425387) (index!38285 lt!425387) key!756 (_keys!10484 thiss!1141) (mask!27217 thiss!1141)))))

(assert (= (and d!114425 c!98404) b!942623))

(assert (= (and d!114425 (not c!98404)) b!942627))

(assert (= (and b!942627 c!98403) b!942624))

(assert (= (and b!942627 (not c!98403)) b!942626))

(assert (= (and b!942626 c!98402) b!942625))

(assert (= (and b!942626 (not c!98402)) b!942628))

(declare-fun m!877961 () Bool)

(assert (=> d!114425 m!877961))

(declare-fun m!877963 () Bool)

(assert (=> d!114425 m!877963))

(assert (=> d!114425 m!877963))

(declare-fun m!877965 () Bool)

(assert (=> d!114425 m!877965))

(assert (=> d!114425 m!877917))

(declare-fun m!877967 () Bool)

(assert (=> b!942627 m!877967))

(declare-fun m!877969 () Bool)

(assert (=> b!942628 m!877969))

(assert (=> b!942551 d!114425))

(declare-fun b!942635 () Bool)

(declare-fun e!530033 () Bool)

(assert (=> b!942635 (= e!530033 tp_is_empty!20425)))

(declare-fun mapIsEmpty!32448 () Bool)

(declare-fun mapRes!32448 () Bool)

(assert (=> mapIsEmpty!32448 mapRes!32448))

(declare-fun mapNonEmpty!32448 () Bool)

(declare-fun tp!62253 () Bool)

(assert (=> mapNonEmpty!32448 (= mapRes!32448 (and tp!62253 e!530033))))

(declare-fun mapValue!32448 () ValueCell!9731)

(declare-fun mapKey!32448 () (_ BitVec 32))

(declare-fun mapRest!32448 () (Array (_ BitVec 32) ValueCell!9731))

(assert (=> mapNonEmpty!32448 (= mapRest!32439 (store mapRest!32448 mapKey!32448 mapValue!32448))))

(declare-fun b!942636 () Bool)

(declare-fun e!530032 () Bool)

(assert (=> b!942636 (= e!530032 tp_is_empty!20425)))

(declare-fun condMapEmpty!32448 () Bool)

(declare-fun mapDefault!32448 () ValueCell!9731)

(assert (=> mapNonEmpty!32439 (= condMapEmpty!32448 (= mapRest!32439 ((as const (Array (_ BitVec 32) ValueCell!9731)) mapDefault!32448)))))

(assert (=> mapNonEmpty!32439 (= tp!62237 (and e!530032 mapRes!32448))))

(assert (= (and mapNonEmpty!32439 condMapEmpty!32448) mapIsEmpty!32448))

(assert (= (and mapNonEmpty!32439 (not condMapEmpty!32448)) mapNonEmpty!32448))

(assert (= (and mapNonEmpty!32448 ((_ is ValueCellFull!9731) mapValue!32448)) b!942635))

(assert (= (and mapNonEmpty!32439 ((_ is ValueCellFull!9731) mapDefault!32448)) b!942636))

(declare-fun m!877971 () Bool)

(assert (=> mapNonEmpty!32448 m!877971))

(check-sat b_and!29339 (not b_next!17917) (not b!942628) (not mapNonEmpty!32448) (not b!942610) (not d!114423) (not b!942608) (not b!942609) tp_is_empty!20425 (not d!114425))
(check-sat b_and!29339 (not b_next!17917))
