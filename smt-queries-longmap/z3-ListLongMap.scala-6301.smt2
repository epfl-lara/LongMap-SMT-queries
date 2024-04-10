; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80606 () Bool)

(assert start!80606)

(declare-fun b!946069 () Bool)

(declare-fun b_free!18129 () Bool)

(declare-fun b_next!18129 () Bool)

(assert (=> b!946069 (= b_free!18129 (not b_next!18129))))

(declare-fun tp!62920 () Bool)

(declare-fun b_and!29551 () Bool)

(assert (=> b!946069 (= tp!62920 b_and!29551)))

(declare-fun b!946067 () Bool)

(declare-fun e!532254 () Bool)

(declare-fun tp_is_empty!20637 () Bool)

(assert (=> b!946067 (= e!532254 tp_is_empty!20637)))

(declare-fun mapNonEmpty!32805 () Bool)

(declare-fun mapRes!32805 () Bool)

(declare-fun tp!62921 () Bool)

(declare-fun e!532253 () Bool)

(assert (=> mapNonEmpty!32805 (= mapRes!32805 (and tp!62921 e!532253))))

(declare-fun mapKey!32805 () (_ BitVec 32))

(declare-datatypes ((V!32481 0))(
  ( (V!32482 (val!10369 Int)) )
))
(declare-datatypes ((ValueCell!9837 0))(
  ( (ValueCellFull!9837 (v!12903 V!32481)) (EmptyCell!9837) )
))
(declare-datatypes ((array!57256 0))(
  ( (array!57257 (arr!27546 (Array (_ BitVec 32) ValueCell!9837)) (size!28015 (_ BitVec 32))) )
))
(declare-datatypes ((array!57258 0))(
  ( (array!57259 (arr!27547 (Array (_ BitVec 32) (_ BitVec 64))) (size!28016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4824 0))(
  ( (LongMapFixedSize!4825 (defaultEntry!5709 Int) (mask!27398 (_ BitVec 32)) (extraKeys!5441 (_ BitVec 32)) (zeroValue!5545 V!32481) (minValue!5545 V!32481) (_size!2467 (_ BitVec 32)) (_keys!10597 array!57258) (_values!5732 array!57256) (_vacant!2467 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4824)

(declare-fun mapValue!32805 () ValueCell!9837)

(declare-fun mapRest!32805 () (Array (_ BitVec 32) ValueCell!9837))

(assert (=> mapNonEmpty!32805 (= (arr!27546 (_values!5732 thiss!1141)) (store mapRest!32805 mapKey!32805 mapValue!32805))))

(declare-fun b!946068 () Bool)

(declare-fun e!532252 () Bool)

(declare-fun e!532255 () Bool)

(assert (=> b!946068 (= e!532252 e!532255)))

(declare-fun res!635217 () Bool)

(assert (=> b!946068 (=> (not res!635217) (not e!532255))))

(declare-datatypes ((SeekEntryResult!9098 0))(
  ( (MissingZero!9098 (index!38763 (_ BitVec 32))) (Found!9098 (index!38764 (_ BitVec 32))) (Intermediate!9098 (undefined!9910 Bool) (index!38765 (_ BitVec 32)) (x!81334 (_ BitVec 32))) (Undefined!9098) (MissingVacant!9098 (index!38766 (_ BitVec 32))) )
))
(declare-fun lt!426183 () SeekEntryResult!9098)

(get-info :version)

(assert (=> b!946068 (= res!635217 ((_ is Found!9098) lt!426183))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57258 (_ BitVec 32)) SeekEntryResult!9098)

(assert (=> b!946068 (= lt!426183 (seekEntry!0 key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(declare-fun res!635216 () Bool)

(assert (=> start!80606 (=> (not res!635216) (not e!532252))))

(declare-fun valid!1842 (LongMapFixedSize!4824) Bool)

(assert (=> start!80606 (= res!635216 (valid!1842 thiss!1141))))

(assert (=> start!80606 e!532252))

(declare-fun e!532257 () Bool)

(assert (=> start!80606 e!532257))

(assert (=> start!80606 true))

(declare-fun e!532256 () Bool)

(declare-fun array_inv!21394 (array!57258) Bool)

(declare-fun array_inv!21395 (array!57256) Bool)

(assert (=> b!946069 (= e!532257 (and tp!62920 tp_is_empty!20637 (array_inv!21394 (_keys!10597 thiss!1141)) (array_inv!21395 (_values!5732 thiss!1141)) e!532256))))

(declare-fun b!946070 () Bool)

(declare-fun e!532258 () Bool)

(assert (=> b!946070 (= e!532255 (not e!532258))))

(declare-fun res!635218 () Bool)

(assert (=> b!946070 (=> res!635218 e!532258)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946070 (= res!635218 (not (validMask!0 (mask!27398 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946070 (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31898 0))(
  ( (Unit!31899) )
))
(declare-fun lt!426182 () Unit!31898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57258 (_ BitVec 64) (_ BitVec 32)) Unit!31898)

(assert (=> b!946070 (= lt!426182 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10597 thiss!1141) key!756 (index!38764 lt!426183)))))

(declare-fun b!946071 () Bool)

(assert (=> b!946071 (= e!532253 tp_is_empty!20637)))

(declare-fun b!946072 () Bool)

(assert (=> b!946072 (= e!532258 (= (size!28015 (_values!5732 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27398 thiss!1141))))))

(declare-fun b!946073 () Bool)

(declare-fun res!635215 () Bool)

(assert (=> b!946073 (=> (not res!635215) (not e!532252))))

(assert (=> b!946073 (= res!635215 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946074 () Bool)

(assert (=> b!946074 (= e!532256 (and e!532254 mapRes!32805))))

(declare-fun condMapEmpty!32805 () Bool)

(declare-fun mapDefault!32805 () ValueCell!9837)

(assert (=> b!946074 (= condMapEmpty!32805 (= (arr!27546 (_values!5732 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9837)) mapDefault!32805)))))

(declare-fun mapIsEmpty!32805 () Bool)

(assert (=> mapIsEmpty!32805 mapRes!32805))

(assert (= (and start!80606 res!635216) b!946073))

(assert (= (and b!946073 res!635215) b!946068))

(assert (= (and b!946068 res!635217) b!946070))

(assert (= (and b!946070 (not res!635218)) b!946072))

(assert (= (and b!946074 condMapEmpty!32805) mapIsEmpty!32805))

(assert (= (and b!946074 (not condMapEmpty!32805)) mapNonEmpty!32805))

(assert (= (and mapNonEmpty!32805 ((_ is ValueCellFull!9837) mapValue!32805)) b!946071))

(assert (= (and b!946074 ((_ is ValueCellFull!9837) mapDefault!32805)) b!946067))

(assert (= b!946069 b!946074))

(assert (= start!80606 b!946069))

(declare-fun m!879613 () Bool)

(assert (=> b!946070 m!879613))

(declare-fun m!879615 () Bool)

(assert (=> b!946070 m!879615))

(declare-fun m!879617 () Bool)

(assert (=> b!946070 m!879617))

(declare-fun m!879619 () Bool)

(assert (=> mapNonEmpty!32805 m!879619))

(declare-fun m!879621 () Bool)

(assert (=> b!946069 m!879621))

(declare-fun m!879623 () Bool)

(assert (=> b!946069 m!879623))

(declare-fun m!879625 () Bool)

(assert (=> start!80606 m!879625))

(declare-fun m!879627 () Bool)

(assert (=> b!946068 m!879627))

(check-sat tp_is_empty!20637 (not start!80606) (not b_next!18129) (not b!946069) (not b!946068) b_and!29551 (not mapNonEmpty!32805) (not b!946070))
(check-sat b_and!29551 (not b_next!18129))
(get-model)

(declare-fun b!946111 () Bool)

(declare-fun c!98502 () Bool)

(declare-fun lt!426199 () (_ BitVec 64))

(assert (=> b!946111 (= c!98502 (= lt!426199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532291 () SeekEntryResult!9098)

(declare-fun e!532290 () SeekEntryResult!9098)

(assert (=> b!946111 (= e!532291 e!532290)))

(declare-fun b!946112 () Bool)

(declare-fun lt!426201 () SeekEntryResult!9098)

(assert (=> b!946112 (= e!532291 (Found!9098 (index!38765 lt!426201)))))

(declare-fun d!114479 () Bool)

(declare-fun lt!426198 () SeekEntryResult!9098)

(assert (=> d!114479 (and (or ((_ is MissingVacant!9098) lt!426198) (not ((_ is Found!9098) lt!426198)) (and (bvsge (index!38764 lt!426198) #b00000000000000000000000000000000) (bvslt (index!38764 lt!426198) (size!28016 (_keys!10597 thiss!1141))))) (not ((_ is MissingVacant!9098) lt!426198)) (or (not ((_ is Found!9098) lt!426198)) (= (select (arr!27547 (_keys!10597 thiss!1141)) (index!38764 lt!426198)) key!756)))))

(declare-fun e!532289 () SeekEntryResult!9098)

(assert (=> d!114479 (= lt!426198 e!532289)))

(declare-fun c!98504 () Bool)

(assert (=> d!114479 (= c!98504 (and ((_ is Intermediate!9098) lt!426201) (undefined!9910 lt!426201)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57258 (_ BitVec 32)) SeekEntryResult!9098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114479 (= lt!426201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27398 thiss!1141)) key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(assert (=> d!114479 (validMask!0 (mask!27398 thiss!1141))))

(assert (=> d!114479 (= (seekEntry!0 key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)) lt!426198)))

(declare-fun b!946113 () Bool)

(declare-fun lt!426200 () SeekEntryResult!9098)

(assert (=> b!946113 (= e!532290 (ite ((_ is MissingVacant!9098) lt!426200) (MissingZero!9098 (index!38766 lt!426200)) lt!426200))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57258 (_ BitVec 32)) SeekEntryResult!9098)

(assert (=> b!946113 (= lt!426200 (seekKeyOrZeroReturnVacant!0 (x!81334 lt!426201) (index!38765 lt!426201) (index!38765 lt!426201) key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(declare-fun b!946114 () Bool)

(assert (=> b!946114 (= e!532290 (MissingZero!9098 (index!38765 lt!426201)))))

(declare-fun b!946115 () Bool)

(assert (=> b!946115 (= e!532289 Undefined!9098)))

(declare-fun b!946116 () Bool)

(assert (=> b!946116 (= e!532289 e!532291)))

(assert (=> b!946116 (= lt!426199 (select (arr!27547 (_keys!10597 thiss!1141)) (index!38765 lt!426201)))))

(declare-fun c!98503 () Bool)

(assert (=> b!946116 (= c!98503 (= lt!426199 key!756))))

(assert (= (and d!114479 c!98504) b!946115))

(assert (= (and d!114479 (not c!98504)) b!946116))

(assert (= (and b!946116 c!98503) b!946112))

(assert (= (and b!946116 (not c!98503)) b!946111))

(assert (= (and b!946111 c!98502) b!946114))

(assert (= (and b!946111 (not c!98502)) b!946113))

(declare-fun m!879645 () Bool)

(assert (=> d!114479 m!879645))

(declare-fun m!879647 () Bool)

(assert (=> d!114479 m!879647))

(assert (=> d!114479 m!879647))

(declare-fun m!879649 () Bool)

(assert (=> d!114479 m!879649))

(assert (=> d!114479 m!879613))

(declare-fun m!879651 () Bool)

(assert (=> b!946113 m!879651))

(declare-fun m!879653 () Bool)

(assert (=> b!946116 m!879653))

(assert (=> b!946068 d!114479))

(declare-fun d!114481 () Bool)

(declare-fun res!635237 () Bool)

(declare-fun e!532294 () Bool)

(assert (=> d!114481 (=> (not res!635237) (not e!532294))))

(declare-fun simpleValid!356 (LongMapFixedSize!4824) Bool)

(assert (=> d!114481 (= res!635237 (simpleValid!356 thiss!1141))))

(assert (=> d!114481 (= (valid!1842 thiss!1141) e!532294)))

(declare-fun b!946123 () Bool)

(declare-fun res!635238 () Bool)

(assert (=> b!946123 (=> (not res!635238) (not e!532294))))

(declare-fun arrayCountValidKeys!0 (array!57258 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946123 (= res!635238 (= (arrayCountValidKeys!0 (_keys!10597 thiss!1141) #b00000000000000000000000000000000 (size!28016 (_keys!10597 thiss!1141))) (_size!2467 thiss!1141)))))

(declare-fun b!946124 () Bool)

(declare-fun res!635239 () Bool)

(assert (=> b!946124 (=> (not res!635239) (not e!532294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57258 (_ BitVec 32)) Bool)

(assert (=> b!946124 (= res!635239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(declare-fun b!946125 () Bool)

(declare-datatypes ((List!19296 0))(
  ( (Nil!19293) (Cons!19292 (h!20444 (_ BitVec 64)) (t!27617 List!19296)) )
))
(declare-fun arrayNoDuplicates!0 (array!57258 (_ BitVec 32) List!19296) Bool)

(assert (=> b!946125 (= e!532294 (arrayNoDuplicates!0 (_keys!10597 thiss!1141) #b00000000000000000000000000000000 Nil!19293))))

(assert (= (and d!114481 res!635237) b!946123))

(assert (= (and b!946123 res!635238) b!946124))

(assert (= (and b!946124 res!635239) b!946125))

(declare-fun m!879655 () Bool)

(assert (=> d!114481 m!879655))

(declare-fun m!879657 () Bool)

(assert (=> b!946123 m!879657))

(declare-fun m!879659 () Bool)

(assert (=> b!946124 m!879659))

(declare-fun m!879661 () Bool)

(assert (=> b!946125 m!879661))

(assert (=> start!80606 d!114481))

(declare-fun d!114483 () Bool)

(assert (=> d!114483 (= (array_inv!21394 (_keys!10597 thiss!1141)) (bvsge (size!28016 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946069 d!114483))

(declare-fun d!114485 () Bool)

(assert (=> d!114485 (= (array_inv!21395 (_values!5732 thiss!1141)) (bvsge (size!28015 (_values!5732 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946069 d!114485))

(declare-fun d!114487 () Bool)

(assert (=> d!114487 (= (validMask!0 (mask!27398 thiss!1141)) (and (or (= (mask!27398 thiss!1141) #b00000000000000000000000000000111) (= (mask!27398 thiss!1141) #b00000000000000000000000000001111) (= (mask!27398 thiss!1141) #b00000000000000000000000000011111) (= (mask!27398 thiss!1141) #b00000000000000000000000000111111) (= (mask!27398 thiss!1141) #b00000000000000000000000001111111) (= (mask!27398 thiss!1141) #b00000000000000000000000011111111) (= (mask!27398 thiss!1141) #b00000000000000000000000111111111) (= (mask!27398 thiss!1141) #b00000000000000000000001111111111) (= (mask!27398 thiss!1141) #b00000000000000000000011111111111) (= (mask!27398 thiss!1141) #b00000000000000000000111111111111) (= (mask!27398 thiss!1141) #b00000000000000000001111111111111) (= (mask!27398 thiss!1141) #b00000000000000000011111111111111) (= (mask!27398 thiss!1141) #b00000000000000000111111111111111) (= (mask!27398 thiss!1141) #b00000000000000001111111111111111) (= (mask!27398 thiss!1141) #b00000000000000011111111111111111) (= (mask!27398 thiss!1141) #b00000000000000111111111111111111) (= (mask!27398 thiss!1141) #b00000000000001111111111111111111) (= (mask!27398 thiss!1141) #b00000000000011111111111111111111) (= (mask!27398 thiss!1141) #b00000000000111111111111111111111) (= (mask!27398 thiss!1141) #b00000000001111111111111111111111) (= (mask!27398 thiss!1141) #b00000000011111111111111111111111) (= (mask!27398 thiss!1141) #b00000000111111111111111111111111) (= (mask!27398 thiss!1141) #b00000001111111111111111111111111) (= (mask!27398 thiss!1141) #b00000011111111111111111111111111) (= (mask!27398 thiss!1141) #b00000111111111111111111111111111) (= (mask!27398 thiss!1141) #b00001111111111111111111111111111) (= (mask!27398 thiss!1141) #b00011111111111111111111111111111) (= (mask!27398 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27398 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946070 d!114487))

(declare-fun d!114489 () Bool)

(declare-fun res!635244 () Bool)

(declare-fun e!532299 () Bool)

(assert (=> d!114489 (=> res!635244 e!532299)))

(assert (=> d!114489 (= res!635244 (= (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114489 (= (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 #b00000000000000000000000000000000) e!532299)))

(declare-fun b!946130 () Bool)

(declare-fun e!532300 () Bool)

(assert (=> b!946130 (= e!532299 e!532300)))

(declare-fun res!635245 () Bool)

(assert (=> b!946130 (=> (not res!635245) (not e!532300))))

(assert (=> b!946130 (= res!635245 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28016 (_keys!10597 thiss!1141))))))

(declare-fun b!946131 () Bool)

(assert (=> b!946131 (= e!532300 (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114489 (not res!635244)) b!946130))

(assert (= (and b!946130 res!635245) b!946131))

(declare-fun m!879663 () Bool)

(assert (=> d!114489 m!879663))

(declare-fun m!879665 () Bool)

(assert (=> b!946131 m!879665))

(assert (=> b!946070 d!114489))

(declare-fun d!114491 () Bool)

(assert (=> d!114491 (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426204 () Unit!31898)

(declare-fun choose!13 (array!57258 (_ BitVec 64) (_ BitVec 32)) Unit!31898)

(assert (=> d!114491 (= lt!426204 (choose!13 (_keys!10597 thiss!1141) key!756 (index!38764 lt!426183)))))

(assert (=> d!114491 (bvsge (index!38764 lt!426183) #b00000000000000000000000000000000)))

(assert (=> d!114491 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10597 thiss!1141) key!756 (index!38764 lt!426183)) lt!426204)))

(declare-fun bs!26596 () Bool)

(assert (= bs!26596 d!114491))

(assert (=> bs!26596 m!879615))

(declare-fun m!879667 () Bool)

(assert (=> bs!26596 m!879667))

(assert (=> b!946070 d!114491))

(declare-fun b!946138 () Bool)

(declare-fun e!532305 () Bool)

(assert (=> b!946138 (= e!532305 tp_is_empty!20637)))

(declare-fun b!946139 () Bool)

(declare-fun e!532306 () Bool)

(assert (=> b!946139 (= e!532306 tp_is_empty!20637)))

(declare-fun mapNonEmpty!32811 () Bool)

(declare-fun mapRes!32811 () Bool)

(declare-fun tp!62930 () Bool)

(assert (=> mapNonEmpty!32811 (= mapRes!32811 (and tp!62930 e!532305))))

(declare-fun mapKey!32811 () (_ BitVec 32))

(declare-fun mapRest!32811 () (Array (_ BitVec 32) ValueCell!9837))

(declare-fun mapValue!32811 () ValueCell!9837)

(assert (=> mapNonEmpty!32811 (= mapRest!32805 (store mapRest!32811 mapKey!32811 mapValue!32811))))

(declare-fun mapIsEmpty!32811 () Bool)

(assert (=> mapIsEmpty!32811 mapRes!32811))

(declare-fun condMapEmpty!32811 () Bool)

(declare-fun mapDefault!32811 () ValueCell!9837)

(assert (=> mapNonEmpty!32805 (= condMapEmpty!32811 (= mapRest!32805 ((as const (Array (_ BitVec 32) ValueCell!9837)) mapDefault!32811)))))

(assert (=> mapNonEmpty!32805 (= tp!62921 (and e!532306 mapRes!32811))))

(assert (= (and mapNonEmpty!32805 condMapEmpty!32811) mapIsEmpty!32811))

(assert (= (and mapNonEmpty!32805 (not condMapEmpty!32811)) mapNonEmpty!32811))

(assert (= (and mapNonEmpty!32811 ((_ is ValueCellFull!9837) mapValue!32811)) b!946138))

(assert (= (and mapNonEmpty!32805 ((_ is ValueCellFull!9837) mapDefault!32811)) b!946139))

(declare-fun m!879669 () Bool)

(assert (=> mapNonEmpty!32811 m!879669))

(check-sat (not d!114481) tp_is_empty!20637 b_and!29551 (not b!946113) (not b_next!18129) (not b!946123) (not b!946125) (not mapNonEmpty!32811) (not d!114479) (not b!946131) (not d!114491) (not b!946124))
(check-sat b_and!29551 (not b_next!18129))
(get-model)

(declare-fun d!114493 () Bool)

(declare-fun res!635246 () Bool)

(declare-fun e!532307 () Bool)

(assert (=> d!114493 (=> res!635246 e!532307)))

(assert (=> d!114493 (= res!635246 (= (select (arr!27547 (_keys!10597 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114493 (= (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532307)))

(declare-fun b!946140 () Bool)

(declare-fun e!532308 () Bool)

(assert (=> b!946140 (= e!532307 e!532308)))

(declare-fun res!635247 () Bool)

(assert (=> b!946140 (=> (not res!635247) (not e!532308))))

(assert (=> b!946140 (= res!635247 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28016 (_keys!10597 thiss!1141))))))

(declare-fun b!946141 () Bool)

(assert (=> b!946141 (= e!532308 (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114493 (not res!635246)) b!946140))

(assert (= (and b!946140 res!635247) b!946141))

(declare-fun m!879671 () Bool)

(assert (=> d!114493 m!879671))

(declare-fun m!879673 () Bool)

(assert (=> b!946141 m!879673))

(assert (=> b!946131 d!114493))

(declare-fun b!946152 () Bool)

(declare-fun e!532318 () Bool)

(declare-fun e!532317 () Bool)

(assert (=> b!946152 (= e!532318 e!532317)))

(declare-fun c!98507 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946152 (= c!98507 (validKeyInArray!0 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114495 () Bool)

(declare-fun res!635256 () Bool)

(declare-fun e!532319 () Bool)

(assert (=> d!114495 (=> res!635256 e!532319)))

(assert (=> d!114495 (= res!635256 (bvsge #b00000000000000000000000000000000 (size!28016 (_keys!10597 thiss!1141))))))

(assert (=> d!114495 (= (arrayNoDuplicates!0 (_keys!10597 thiss!1141) #b00000000000000000000000000000000 Nil!19293) e!532319)))

(declare-fun bm!41067 () Bool)

(declare-fun call!41070 () Bool)

(assert (=> bm!41067 (= call!41070 (arrayNoDuplicates!0 (_keys!10597 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98507 (Cons!19292 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000) Nil!19293) Nil!19293)))))

(declare-fun b!946153 () Bool)

(assert (=> b!946153 (= e!532317 call!41070)))

(declare-fun b!946154 () Bool)

(assert (=> b!946154 (= e!532319 e!532318)))

(declare-fun res!635254 () Bool)

(assert (=> b!946154 (=> (not res!635254) (not e!532318))))

(declare-fun e!532320 () Bool)

(assert (=> b!946154 (= res!635254 (not e!532320))))

(declare-fun res!635255 () Bool)

(assert (=> b!946154 (=> (not res!635255) (not e!532320))))

(assert (=> b!946154 (= res!635255 (validKeyInArray!0 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946155 () Bool)

(declare-fun contains!5194 (List!19296 (_ BitVec 64)) Bool)

(assert (=> b!946155 (= e!532320 (contains!5194 Nil!19293 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946156 () Bool)

(assert (=> b!946156 (= e!532317 call!41070)))

(assert (= (and d!114495 (not res!635256)) b!946154))

(assert (= (and b!946154 res!635255) b!946155))

(assert (= (and b!946154 res!635254) b!946152))

(assert (= (and b!946152 c!98507) b!946153))

(assert (= (and b!946152 (not c!98507)) b!946156))

(assert (= (or b!946153 b!946156) bm!41067))

(assert (=> b!946152 m!879663))

(assert (=> b!946152 m!879663))

(declare-fun m!879675 () Bool)

(assert (=> b!946152 m!879675))

(assert (=> bm!41067 m!879663))

(declare-fun m!879677 () Bool)

(assert (=> bm!41067 m!879677))

(assert (=> b!946154 m!879663))

(assert (=> b!946154 m!879663))

(assert (=> b!946154 m!879675))

(assert (=> b!946155 m!879663))

(assert (=> b!946155 m!879663))

(declare-fun m!879679 () Bool)

(assert (=> b!946155 m!879679))

(assert (=> b!946125 d!114495))

(assert (=> d!114491 d!114489))

(declare-fun d!114497 () Bool)

(assert (=> d!114497 (arrayContainsKey!0 (_keys!10597 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114497 true))

(declare-fun _$60!430 () Unit!31898)

(assert (=> d!114497 (= (choose!13 (_keys!10597 thiss!1141) key!756 (index!38764 lt!426183)) _$60!430)))

(declare-fun bs!26597 () Bool)

(assert (= bs!26597 d!114497))

(assert (=> bs!26597 m!879615))

(assert (=> d!114491 d!114497))

(declare-fun b!946175 () Bool)

(declare-fun e!532333 () SeekEntryResult!9098)

(assert (=> b!946175 (= e!532333 (Intermediate!9098 false (toIndex!0 key!756 (mask!27398 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946176 () Bool)

(declare-fun e!532331 () SeekEntryResult!9098)

(assert (=> b!946176 (= e!532331 e!532333)))

(declare-fun c!98514 () Bool)

(declare-fun lt!426209 () (_ BitVec 64))

(assert (=> b!946176 (= c!98514 (or (= lt!426209 key!756) (= (bvadd lt!426209 lt!426209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946177 () Bool)

(declare-fun lt!426210 () SeekEntryResult!9098)

(assert (=> b!946177 (and (bvsge (index!38765 lt!426210) #b00000000000000000000000000000000) (bvslt (index!38765 lt!426210) (size!28016 (_keys!10597 thiss!1141))))))

(declare-fun res!635263 () Bool)

(assert (=> b!946177 (= res!635263 (= (select (arr!27547 (_keys!10597 thiss!1141)) (index!38765 lt!426210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532332 () Bool)

(assert (=> b!946177 (=> res!635263 e!532332)))

(declare-fun d!114499 () Bool)

(declare-fun e!532334 () Bool)

(assert (=> d!114499 e!532334))

(declare-fun c!98516 () Bool)

(assert (=> d!114499 (= c!98516 (and ((_ is Intermediate!9098) lt!426210) (undefined!9910 lt!426210)))))

(assert (=> d!114499 (= lt!426210 e!532331)))

(declare-fun c!98515 () Bool)

(assert (=> d!114499 (= c!98515 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114499 (= lt!426209 (select (arr!27547 (_keys!10597 thiss!1141)) (toIndex!0 key!756 (mask!27398 thiss!1141))))))

(assert (=> d!114499 (validMask!0 (mask!27398 thiss!1141))))

(assert (=> d!114499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27398 thiss!1141)) key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)) lt!426210)))

(declare-fun b!946178 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946178 (= e!532333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27398 thiss!1141)) #b00000000000000000000000000000000 (mask!27398 thiss!1141)) key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(declare-fun b!946179 () Bool)

(assert (=> b!946179 (= e!532331 (Intermediate!9098 true (toIndex!0 key!756 (mask!27398 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946180 () Bool)

(declare-fun e!532335 () Bool)

(assert (=> b!946180 (= e!532334 e!532335)))

(declare-fun res!635264 () Bool)

(assert (=> b!946180 (= res!635264 (and ((_ is Intermediate!9098) lt!426210) (not (undefined!9910 lt!426210)) (bvslt (x!81334 lt!426210) #b01111111111111111111111111111110) (bvsge (x!81334 lt!426210) #b00000000000000000000000000000000) (bvsge (x!81334 lt!426210) #b00000000000000000000000000000000)))))

(assert (=> b!946180 (=> (not res!635264) (not e!532335))))

(declare-fun b!946181 () Bool)

(assert (=> b!946181 (and (bvsge (index!38765 lt!426210) #b00000000000000000000000000000000) (bvslt (index!38765 lt!426210) (size!28016 (_keys!10597 thiss!1141))))))

(declare-fun res!635265 () Bool)

(assert (=> b!946181 (= res!635265 (= (select (arr!27547 (_keys!10597 thiss!1141)) (index!38765 lt!426210)) key!756))))

(assert (=> b!946181 (=> res!635265 e!532332)))

(assert (=> b!946181 (= e!532335 e!532332)))

(declare-fun b!946182 () Bool)

(assert (=> b!946182 (= e!532334 (bvsge (x!81334 lt!426210) #b01111111111111111111111111111110))))

(declare-fun b!946183 () Bool)

(assert (=> b!946183 (and (bvsge (index!38765 lt!426210) #b00000000000000000000000000000000) (bvslt (index!38765 lt!426210) (size!28016 (_keys!10597 thiss!1141))))))

(assert (=> b!946183 (= e!532332 (= (select (arr!27547 (_keys!10597 thiss!1141)) (index!38765 lt!426210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!114499 c!98515) b!946179))

(assert (= (and d!114499 (not c!98515)) b!946176))

(assert (= (and b!946176 c!98514) b!946175))

(assert (= (and b!946176 (not c!98514)) b!946178))

(assert (= (and d!114499 c!98516) b!946182))

(assert (= (and d!114499 (not c!98516)) b!946180))

(assert (= (and b!946180 res!635264) b!946181))

(assert (= (and b!946181 (not res!635265)) b!946177))

(assert (= (and b!946177 (not res!635263)) b!946183))

(assert (=> b!946178 m!879647))

(declare-fun m!879681 () Bool)

(assert (=> b!946178 m!879681))

(assert (=> b!946178 m!879681))

(declare-fun m!879683 () Bool)

(assert (=> b!946178 m!879683))

(assert (=> d!114499 m!879647))

(declare-fun m!879685 () Bool)

(assert (=> d!114499 m!879685))

(assert (=> d!114499 m!879613))

(declare-fun m!879687 () Bool)

(assert (=> b!946177 m!879687))

(assert (=> b!946181 m!879687))

(assert (=> b!946183 m!879687))

(assert (=> d!114479 d!114499))

(declare-fun d!114501 () Bool)

(declare-fun lt!426216 () (_ BitVec 32))

(declare-fun lt!426215 () (_ BitVec 32))

(assert (=> d!114501 (= lt!426216 (bvmul (bvxor lt!426215 (bvlshr lt!426215 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114501 (= lt!426215 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114501 (and (bvsge (mask!27398 thiss!1141) #b00000000000000000000000000000000) (let ((res!635266 (let ((h!20445 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81350 (bvmul (bvxor h!20445 (bvlshr h!20445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81350 (bvlshr x!81350 #b00000000000000000000000000001101)) (mask!27398 thiss!1141)))))) (and (bvslt res!635266 (bvadd (mask!27398 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635266 #b00000000000000000000000000000000))))))

(assert (=> d!114501 (= (toIndex!0 key!756 (mask!27398 thiss!1141)) (bvand (bvxor lt!426216 (bvlshr lt!426216 #b00000000000000000000000000001101)) (mask!27398 thiss!1141)))))

(assert (=> d!114479 d!114501))

(assert (=> d!114479 d!114487))

(declare-fun d!114503 () Bool)

(declare-fun res!635278 () Bool)

(declare-fun e!532338 () Bool)

(assert (=> d!114503 (=> (not res!635278) (not e!532338))))

(assert (=> d!114503 (= res!635278 (validMask!0 (mask!27398 thiss!1141)))))

(assert (=> d!114503 (= (simpleValid!356 thiss!1141) e!532338)))

(declare-fun b!946194 () Bool)

(declare-fun res!635276 () Bool)

(assert (=> b!946194 (=> (not res!635276) (not e!532338))))

(declare-fun size!28019 (LongMapFixedSize!4824) (_ BitVec 32))

(assert (=> b!946194 (= res!635276 (= (size!28019 thiss!1141) (bvadd (_size!2467 thiss!1141) (bvsdiv (bvadd (extraKeys!5441 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!946192 () Bool)

(declare-fun res!635277 () Bool)

(assert (=> b!946192 (=> (not res!635277) (not e!532338))))

(assert (=> b!946192 (= res!635277 (and (= (size!28015 (_values!5732 thiss!1141)) (bvadd (mask!27398 thiss!1141) #b00000000000000000000000000000001)) (= (size!28016 (_keys!10597 thiss!1141)) (size!28015 (_values!5732 thiss!1141))) (bvsge (_size!2467 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2467 thiss!1141) (bvadd (mask!27398 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946193 () Bool)

(declare-fun res!635275 () Bool)

(assert (=> b!946193 (=> (not res!635275) (not e!532338))))

(assert (=> b!946193 (= res!635275 (bvsge (size!28019 thiss!1141) (_size!2467 thiss!1141)))))

(declare-fun b!946195 () Bool)

(assert (=> b!946195 (= e!532338 (and (bvsge (extraKeys!5441 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5441 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2467 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114503 res!635278) b!946192))

(assert (= (and b!946192 res!635277) b!946193))

(assert (= (and b!946193 res!635275) b!946194))

(assert (= (and b!946194 res!635276) b!946195))

(assert (=> d!114503 m!879613))

(declare-fun m!879689 () Bool)

(assert (=> b!946194 m!879689))

(assert (=> b!946193 m!879689))

(assert (=> d!114481 d!114503))

(declare-fun b!946204 () Bool)

(declare-fun e!532345 () Bool)

(declare-fun e!532347 () Bool)

(assert (=> b!946204 (= e!532345 e!532347)))

(declare-fun lt!426224 () (_ BitVec 64))

(assert (=> b!946204 (= lt!426224 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426225 () Unit!31898)

(assert (=> b!946204 (= lt!426225 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10597 thiss!1141) lt!426224 #b00000000000000000000000000000000))))

(assert (=> b!946204 (arrayContainsKey!0 (_keys!10597 thiss!1141) lt!426224 #b00000000000000000000000000000000)))

(declare-fun lt!426223 () Unit!31898)

(assert (=> b!946204 (= lt!426223 lt!426225)))

(declare-fun res!635283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57258 (_ BitVec 32)) SeekEntryResult!9098)

(assert (=> b!946204 (= res!635283 (= (seekEntryOrOpen!0 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000) (_keys!10597 thiss!1141) (mask!27398 thiss!1141)) (Found!9098 #b00000000000000000000000000000000)))))

(assert (=> b!946204 (=> (not res!635283) (not e!532347))))

(declare-fun b!946205 () Bool)

(declare-fun call!41073 () Bool)

(assert (=> b!946205 (= e!532347 call!41073)))

(declare-fun bm!41070 () Bool)

(assert (=> bm!41070 (= call!41073 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(declare-fun d!114505 () Bool)

(declare-fun res!635284 () Bool)

(declare-fun e!532346 () Bool)

(assert (=> d!114505 (=> res!635284 e!532346)))

(assert (=> d!114505 (= res!635284 (bvsge #b00000000000000000000000000000000 (size!28016 (_keys!10597 thiss!1141))))))

(assert (=> d!114505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)) e!532346)))

(declare-fun b!946206 () Bool)

(assert (=> b!946206 (= e!532345 call!41073)))

(declare-fun b!946207 () Bool)

(assert (=> b!946207 (= e!532346 e!532345)))

(declare-fun c!98519 () Bool)

(assert (=> b!946207 (= c!98519 (validKeyInArray!0 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114505 (not res!635284)) b!946207))

(assert (= (and b!946207 c!98519) b!946204))

(assert (= (and b!946207 (not c!98519)) b!946206))

(assert (= (and b!946204 res!635283) b!946205))

(assert (= (or b!946205 b!946206) bm!41070))

(assert (=> b!946204 m!879663))

(declare-fun m!879691 () Bool)

(assert (=> b!946204 m!879691))

(declare-fun m!879693 () Bool)

(assert (=> b!946204 m!879693))

(assert (=> b!946204 m!879663))

(declare-fun m!879695 () Bool)

(assert (=> b!946204 m!879695))

(declare-fun m!879697 () Bool)

(assert (=> bm!41070 m!879697))

(assert (=> b!946207 m!879663))

(assert (=> b!946207 m!879663))

(assert (=> b!946207 m!879675))

(assert (=> b!946124 d!114505))

(declare-fun b!946216 () Bool)

(declare-fun e!532352 () (_ BitVec 32))

(declare-fun call!41076 () (_ BitVec 32))

(assert (=> b!946216 (= e!532352 (bvadd #b00000000000000000000000000000001 call!41076))))

(declare-fun b!946217 () Bool)

(assert (=> b!946217 (= e!532352 call!41076)))

(declare-fun d!114507 () Bool)

(declare-fun lt!426228 () (_ BitVec 32))

(assert (=> d!114507 (and (bvsge lt!426228 #b00000000000000000000000000000000) (bvsle lt!426228 (bvsub (size!28016 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!532353 () (_ BitVec 32))

(assert (=> d!114507 (= lt!426228 e!532353)))

(declare-fun c!98524 () Bool)

(assert (=> d!114507 (= c!98524 (bvsge #b00000000000000000000000000000000 (size!28016 (_keys!10597 thiss!1141))))))

(assert (=> d!114507 (and (bvsle #b00000000000000000000000000000000 (size!28016 (_keys!10597 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28016 (_keys!10597 thiss!1141)) (size!28016 (_keys!10597 thiss!1141))))))

(assert (=> d!114507 (= (arrayCountValidKeys!0 (_keys!10597 thiss!1141) #b00000000000000000000000000000000 (size!28016 (_keys!10597 thiss!1141))) lt!426228)))

(declare-fun bm!41073 () Bool)

(assert (=> bm!41073 (= call!41076 (arrayCountValidKeys!0 (_keys!10597 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28016 (_keys!10597 thiss!1141))))))

(declare-fun b!946218 () Bool)

(assert (=> b!946218 (= e!532353 #b00000000000000000000000000000000)))

(declare-fun b!946219 () Bool)

(assert (=> b!946219 (= e!532353 e!532352)))

(declare-fun c!98525 () Bool)

(assert (=> b!946219 (= c!98525 (validKeyInArray!0 (select (arr!27547 (_keys!10597 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114507 c!98524) b!946218))

(assert (= (and d!114507 (not c!98524)) b!946219))

(assert (= (and b!946219 c!98525) b!946216))

(assert (= (and b!946219 (not c!98525)) b!946217))

(assert (= (or b!946216 b!946217) bm!41073))

(declare-fun m!879699 () Bool)

(assert (=> bm!41073 m!879699))

(assert (=> b!946219 m!879663))

(assert (=> b!946219 m!879663))

(assert (=> b!946219 m!879675))

(assert (=> b!946123 d!114507))

(declare-fun b!946232 () Bool)

(declare-fun e!532362 () SeekEntryResult!9098)

(assert (=> b!946232 (= e!532362 (Found!9098 (index!38765 lt!426201)))))

(declare-fun b!946233 () Bool)

(declare-fun e!532361 () SeekEntryResult!9098)

(assert (=> b!946233 (= e!532361 Undefined!9098)))

(declare-fun b!946234 () Bool)

(declare-fun c!98534 () Bool)

(declare-fun lt!426234 () (_ BitVec 64))

(assert (=> b!946234 (= c!98534 (= lt!426234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532360 () SeekEntryResult!9098)

(assert (=> b!946234 (= e!532362 e!532360)))

(declare-fun b!946235 () Bool)

(assert (=> b!946235 (= e!532361 e!532362)))

(declare-fun c!98533 () Bool)

(assert (=> b!946235 (= c!98533 (= lt!426234 key!756))))

(declare-fun lt!426233 () SeekEntryResult!9098)

(declare-fun d!114509 () Bool)

(assert (=> d!114509 (and (or ((_ is Undefined!9098) lt!426233) (not ((_ is Found!9098) lt!426233)) (and (bvsge (index!38764 lt!426233) #b00000000000000000000000000000000) (bvslt (index!38764 lt!426233) (size!28016 (_keys!10597 thiss!1141))))) (or ((_ is Undefined!9098) lt!426233) ((_ is Found!9098) lt!426233) (not ((_ is MissingVacant!9098) lt!426233)) (not (= (index!38766 lt!426233) (index!38765 lt!426201))) (and (bvsge (index!38766 lt!426233) #b00000000000000000000000000000000) (bvslt (index!38766 lt!426233) (size!28016 (_keys!10597 thiss!1141))))) (or ((_ is Undefined!9098) lt!426233) (ite ((_ is Found!9098) lt!426233) (= (select (arr!27547 (_keys!10597 thiss!1141)) (index!38764 lt!426233)) key!756) (and ((_ is MissingVacant!9098) lt!426233) (= (index!38766 lt!426233) (index!38765 lt!426201)) (= (select (arr!27547 (_keys!10597 thiss!1141)) (index!38766 lt!426233)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114509 (= lt!426233 e!532361)))

(declare-fun c!98532 () Bool)

(assert (=> d!114509 (= c!98532 (bvsge (x!81334 lt!426201) #b01111111111111111111111111111110))))

(assert (=> d!114509 (= lt!426234 (select (arr!27547 (_keys!10597 thiss!1141)) (index!38765 lt!426201)))))

(assert (=> d!114509 (validMask!0 (mask!27398 thiss!1141))))

(assert (=> d!114509 (= (seekKeyOrZeroReturnVacant!0 (x!81334 lt!426201) (index!38765 lt!426201) (index!38765 lt!426201) key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)) lt!426233)))

(declare-fun b!946236 () Bool)

(assert (=> b!946236 (= e!532360 (MissingVacant!9098 (index!38765 lt!426201)))))

(declare-fun b!946237 () Bool)

(assert (=> b!946237 (= e!532360 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81334 lt!426201) #b00000000000000000000000000000001) (nextIndex!0 (index!38765 lt!426201) (x!81334 lt!426201) (mask!27398 thiss!1141)) (index!38765 lt!426201) key!756 (_keys!10597 thiss!1141) (mask!27398 thiss!1141)))))

(assert (= (and d!114509 c!98532) b!946233))

(assert (= (and d!114509 (not c!98532)) b!946235))

(assert (= (and b!946235 c!98533) b!946232))

(assert (= (and b!946235 (not c!98533)) b!946234))

(assert (= (and b!946234 c!98534) b!946236))

(assert (= (and b!946234 (not c!98534)) b!946237))

(declare-fun m!879701 () Bool)

(assert (=> d!114509 m!879701))

(declare-fun m!879703 () Bool)

(assert (=> d!114509 m!879703))

(assert (=> d!114509 m!879653))

(assert (=> d!114509 m!879613))

(declare-fun m!879705 () Bool)

(assert (=> b!946237 m!879705))

(assert (=> b!946237 m!879705))

(declare-fun m!879707 () Bool)

(assert (=> b!946237 m!879707))

(assert (=> b!946113 d!114509))

(declare-fun b!946238 () Bool)

(declare-fun e!532363 () Bool)

(assert (=> b!946238 (= e!532363 tp_is_empty!20637)))

(declare-fun b!946239 () Bool)

(declare-fun e!532364 () Bool)

(assert (=> b!946239 (= e!532364 tp_is_empty!20637)))

(declare-fun mapNonEmpty!32812 () Bool)

(declare-fun mapRes!32812 () Bool)

(declare-fun tp!62931 () Bool)

(assert (=> mapNonEmpty!32812 (= mapRes!32812 (and tp!62931 e!532363))))

(declare-fun mapKey!32812 () (_ BitVec 32))

(declare-fun mapValue!32812 () ValueCell!9837)

(declare-fun mapRest!32812 () (Array (_ BitVec 32) ValueCell!9837))

(assert (=> mapNonEmpty!32812 (= mapRest!32811 (store mapRest!32812 mapKey!32812 mapValue!32812))))

(declare-fun mapIsEmpty!32812 () Bool)

(assert (=> mapIsEmpty!32812 mapRes!32812))

(declare-fun condMapEmpty!32812 () Bool)

(declare-fun mapDefault!32812 () ValueCell!9837)

(assert (=> mapNonEmpty!32811 (= condMapEmpty!32812 (= mapRest!32811 ((as const (Array (_ BitVec 32) ValueCell!9837)) mapDefault!32812)))))

(assert (=> mapNonEmpty!32811 (= tp!62930 (and e!532364 mapRes!32812))))

(assert (= (and mapNonEmpty!32811 condMapEmpty!32812) mapIsEmpty!32812))

(assert (= (and mapNonEmpty!32811 (not condMapEmpty!32812)) mapNonEmpty!32812))

(assert (= (and mapNonEmpty!32812 ((_ is ValueCellFull!9837) mapValue!32812)) b!946238))

(assert (= (and mapNonEmpty!32811 ((_ is ValueCellFull!9837) mapDefault!32812)) b!946239))

(declare-fun m!879709 () Bool)

(assert (=> mapNonEmpty!32812 m!879709))

(check-sat (not b!946194) (not b!946178) (not b!946207) (not b_next!18129) (not bm!41070) (not bm!41067) (not b!946154) (not b!946237) (not b!946152) (not b!946193) (not b!946141) (not b!946155) (not b!946219) tp_is_empty!20637 (not mapNonEmpty!32812) b_and!29551 (not bm!41073) (not b!946204) (not d!114509) (not d!114499) (not d!114497) (not d!114503))
(check-sat b_and!29551 (not b_next!18129))
