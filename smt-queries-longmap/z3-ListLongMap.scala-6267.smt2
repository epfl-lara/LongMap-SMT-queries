; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80138 () Bool)

(assert start!80138)

(declare-fun b!941776 () Bool)

(declare-fun b_free!17925 () Bool)

(declare-fun b_next!17925 () Bool)

(assert (=> b!941776 (= b_free!17925 (not b_next!17925))))

(declare-fun tp!62263 () Bool)

(declare-fun b_and!29337 () Bool)

(assert (=> b!941776 (= tp!62263 b_and!29337)))

(declare-fun mapNonEmpty!32454 () Bool)

(declare-fun mapRes!32454 () Bool)

(declare-fun tp!62264 () Bool)

(declare-fun e!529487 () Bool)

(assert (=> mapNonEmpty!32454 (= mapRes!32454 (and tp!62264 e!529487))))

(declare-fun mapKey!32454 () (_ BitVec 32))

(declare-datatypes ((V!32209 0))(
  ( (V!32210 (val!10267 Int)) )
))
(declare-datatypes ((ValueCell!9735 0))(
  ( (ValueCellFull!9735 (v!12798 V!32209)) (EmptyCell!9735) )
))
(declare-fun mapValue!32454 () ValueCell!9735)

(declare-fun mapRest!32454 () (Array (_ BitVec 32) ValueCell!9735))

(declare-datatypes ((array!56822 0))(
  ( (array!56823 (arr!27342 (Array (_ BitVec 32) ValueCell!9735)) (size!27805 (_ BitVec 32))) )
))
(declare-datatypes ((array!56824 0))(
  ( (array!56825 (arr!27343 (Array (_ BitVec 32) (_ BitVec 64))) (size!27806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4620 0))(
  ( (LongMapFixedSize!4621 (defaultEntry!5601 Int) (mask!27182 (_ BitVec 32)) (extraKeys!5333 (_ BitVec 32)) (zeroValue!5437 V!32209) (minValue!5437 V!32209) (_size!2365 (_ BitVec 32)) (_keys!10461 array!56824) (_values!5624 array!56822) (_vacant!2365 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4620)

(assert (=> mapNonEmpty!32454 (= (arr!27342 (_values!5624 thiss!1141)) (store mapRest!32454 mapKey!32454 mapValue!32454))))

(declare-fun b!941774 () Bool)

(declare-fun res!633012 () Bool)

(declare-fun e!529484 () Bool)

(assert (=> b!941774 (=> (not res!633012) (not e!529484))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9024 0))(
  ( (MissingZero!9024 (index!38467 (_ BitVec 32))) (Found!9024 (index!38468 (_ BitVec 32))) (Intermediate!9024 (undefined!9836 Bool) (index!38469 (_ BitVec 32)) (x!80831 (_ BitVec 32))) (Undefined!9024) (MissingVacant!9024 (index!38470 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56824 (_ BitVec 32)) SeekEntryResult!9024)

(assert (=> b!941774 (= res!633012 (not ((_ is Found!9024) (seekEntry!0 key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))))

(declare-fun b!941775 () Bool)

(declare-fun e!529483 () Bool)

(declare-fun e!529485 () Bool)

(assert (=> b!941775 (= e!529483 (and e!529485 mapRes!32454))))

(declare-fun condMapEmpty!32454 () Bool)

(declare-fun mapDefault!32454 () ValueCell!9735)

(assert (=> b!941775 (= condMapEmpty!32454 (= (arr!27342 (_values!5624 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9735)) mapDefault!32454)))))

(declare-fun tp_is_empty!20433 () Bool)

(declare-fun e!529486 () Bool)

(declare-fun array_inv!21244 (array!56824) Bool)

(declare-fun array_inv!21245 (array!56822) Bool)

(assert (=> b!941776 (= e!529486 (and tp!62263 tp_is_empty!20433 (array_inv!21244 (_keys!10461 thiss!1141)) (array_inv!21245 (_values!5624 thiss!1141)) e!529483))))

(declare-fun b!941777 () Bool)

(assert (=> b!941777 (= e!529484 (and (= (size!27805 (_values!5624 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27182 thiss!1141))) (= (size!27806 (_keys!10461 thiss!1141)) (size!27805 (_values!5624 thiss!1141))) (bvsge (mask!27182 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5333 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun res!633014 () Bool)

(assert (=> start!80138 (=> (not res!633014) (not e!529484))))

(declare-fun valid!1768 (LongMapFixedSize!4620) Bool)

(assert (=> start!80138 (= res!633014 (valid!1768 thiss!1141))))

(assert (=> start!80138 e!529484))

(assert (=> start!80138 e!529486))

(assert (=> start!80138 true))

(declare-fun b!941778 () Bool)

(assert (=> b!941778 (= e!529485 tp_is_empty!20433)))

(declare-fun b!941779 () Bool)

(assert (=> b!941779 (= e!529487 tp_is_empty!20433)))

(declare-fun b!941780 () Bool)

(declare-fun res!633015 () Bool)

(assert (=> b!941780 (=> (not res!633015) (not e!529484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941780 (= res!633015 (validMask!0 (mask!27182 thiss!1141)))))

(declare-fun b!941781 () Bool)

(declare-fun res!633013 () Bool)

(assert (=> b!941781 (=> (not res!633013) (not e!529484))))

(assert (=> b!941781 (= res!633013 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32454 () Bool)

(assert (=> mapIsEmpty!32454 mapRes!32454))

(assert (= (and start!80138 res!633014) b!941781))

(assert (= (and b!941781 res!633013) b!941774))

(assert (= (and b!941774 res!633012) b!941780))

(assert (= (and b!941780 res!633015) b!941777))

(assert (= (and b!941775 condMapEmpty!32454) mapIsEmpty!32454))

(assert (= (and b!941775 (not condMapEmpty!32454)) mapNonEmpty!32454))

(assert (= (and mapNonEmpty!32454 ((_ is ValueCellFull!9735) mapValue!32454)) b!941779))

(assert (= (and b!941775 ((_ is ValueCellFull!9735) mapDefault!32454)) b!941778))

(assert (= b!941776 b!941775))

(assert (= start!80138 b!941776))

(declare-fun m!876691 () Bool)

(assert (=> b!941774 m!876691))

(declare-fun m!876693 () Bool)

(assert (=> b!941780 m!876693))

(declare-fun m!876695 () Bool)

(assert (=> b!941776 m!876695))

(declare-fun m!876697 () Bool)

(assert (=> b!941776 m!876697))

(declare-fun m!876699 () Bool)

(assert (=> mapNonEmpty!32454 m!876699))

(declare-fun m!876701 () Bool)

(assert (=> start!80138 m!876701))

(check-sat b_and!29337 (not start!80138) tp_is_empty!20433 (not b!941776) (not b!941774) (not mapNonEmpty!32454) (not b!941780) (not b_next!17925))
(check-sat b_and!29337 (not b_next!17925))
(get-model)

(declare-fun d!114107 () Bool)

(assert (=> d!114107 (= (array_inv!21244 (_keys!10461 thiss!1141)) (bvsge (size!27806 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941776 d!114107))

(declare-fun d!114109 () Bool)

(assert (=> d!114109 (= (array_inv!21245 (_values!5624 thiss!1141)) (bvsge (size!27805 (_values!5624 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941776 d!114109))

(declare-fun d!114111 () Bool)

(declare-fun res!633034 () Bool)

(declare-fun e!529508 () Bool)

(assert (=> d!114111 (=> (not res!633034) (not e!529508))))

(declare-fun simpleValid!343 (LongMapFixedSize!4620) Bool)

(assert (=> d!114111 (= res!633034 (simpleValid!343 thiss!1141))))

(assert (=> d!114111 (= (valid!1768 thiss!1141) e!529508)))

(declare-fun b!941812 () Bool)

(declare-fun res!633035 () Bool)

(assert (=> b!941812 (=> (not res!633035) (not e!529508))))

(declare-fun arrayCountValidKeys!0 (array!56824 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941812 (= res!633035 (= (arrayCountValidKeys!0 (_keys!10461 thiss!1141) #b00000000000000000000000000000000 (size!27806 (_keys!10461 thiss!1141))) (_size!2365 thiss!1141)))))

(declare-fun b!941813 () Bool)

(declare-fun res!633036 () Bool)

(assert (=> b!941813 (=> (not res!633036) (not e!529508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56824 (_ BitVec 32)) Bool)

(assert (=> b!941813 (= res!633036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))

(declare-fun b!941814 () Bool)

(declare-datatypes ((List!19208 0))(
  ( (Nil!19205) (Cons!19204 (h!20352 (_ BitVec 64)) (t!27523 List!19208)) )
))
(declare-fun arrayNoDuplicates!0 (array!56824 (_ BitVec 32) List!19208) Bool)

(assert (=> b!941814 (= e!529508 (arrayNoDuplicates!0 (_keys!10461 thiss!1141) #b00000000000000000000000000000000 Nil!19205))))

(assert (= (and d!114111 res!633034) b!941812))

(assert (= (and b!941812 res!633035) b!941813))

(assert (= (and b!941813 res!633036) b!941814))

(declare-fun m!876715 () Bool)

(assert (=> d!114111 m!876715))

(declare-fun m!876717 () Bool)

(assert (=> b!941812 m!876717))

(declare-fun m!876719 () Bool)

(assert (=> b!941813 m!876719))

(declare-fun m!876721 () Bool)

(assert (=> b!941814 m!876721))

(assert (=> start!80138 d!114111))

(declare-fun d!114113 () Bool)

(assert (=> d!114113 (= (validMask!0 (mask!27182 thiss!1141)) (and (or (= (mask!27182 thiss!1141) #b00000000000000000000000000000111) (= (mask!27182 thiss!1141) #b00000000000000000000000000001111) (= (mask!27182 thiss!1141) #b00000000000000000000000000011111) (= (mask!27182 thiss!1141) #b00000000000000000000000000111111) (= (mask!27182 thiss!1141) #b00000000000000000000000001111111) (= (mask!27182 thiss!1141) #b00000000000000000000000011111111) (= (mask!27182 thiss!1141) #b00000000000000000000000111111111) (= (mask!27182 thiss!1141) #b00000000000000000000001111111111) (= (mask!27182 thiss!1141) #b00000000000000000000011111111111) (= (mask!27182 thiss!1141) #b00000000000000000000111111111111) (= (mask!27182 thiss!1141) #b00000000000000000001111111111111) (= (mask!27182 thiss!1141) #b00000000000000000011111111111111) (= (mask!27182 thiss!1141) #b00000000000000000111111111111111) (= (mask!27182 thiss!1141) #b00000000000000001111111111111111) (= (mask!27182 thiss!1141) #b00000000000000011111111111111111) (= (mask!27182 thiss!1141) #b00000000000000111111111111111111) (= (mask!27182 thiss!1141) #b00000000000001111111111111111111) (= (mask!27182 thiss!1141) #b00000000000011111111111111111111) (= (mask!27182 thiss!1141) #b00000000000111111111111111111111) (= (mask!27182 thiss!1141) #b00000000001111111111111111111111) (= (mask!27182 thiss!1141) #b00000000011111111111111111111111) (= (mask!27182 thiss!1141) #b00000000111111111111111111111111) (= (mask!27182 thiss!1141) #b00000001111111111111111111111111) (= (mask!27182 thiss!1141) #b00000011111111111111111111111111) (= (mask!27182 thiss!1141) #b00000111111111111111111111111111) (= (mask!27182 thiss!1141) #b00001111111111111111111111111111) (= (mask!27182 thiss!1141) #b00011111111111111111111111111111) (= (mask!27182 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27182 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941780 d!114113))

(declare-fun d!114115 () Bool)

(declare-fun lt!425039 () SeekEntryResult!9024)

(assert (=> d!114115 (and (or ((_ is MissingVacant!9024) lt!425039) (not ((_ is Found!9024) lt!425039)) (and (bvsge (index!38468 lt!425039) #b00000000000000000000000000000000) (bvslt (index!38468 lt!425039) (size!27806 (_keys!10461 thiss!1141))))) (not ((_ is MissingVacant!9024) lt!425039)) (or (not ((_ is Found!9024) lt!425039)) (= (select (arr!27343 (_keys!10461 thiss!1141)) (index!38468 lt!425039)) key!756)))))

(declare-fun e!529515 () SeekEntryResult!9024)

(assert (=> d!114115 (= lt!425039 e!529515)))

(declare-fun c!98129 () Bool)

(declare-fun lt!425040 () SeekEntryResult!9024)

(assert (=> d!114115 (= c!98129 (and ((_ is Intermediate!9024) lt!425040) (undefined!9836 lt!425040)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56824 (_ BitVec 32)) SeekEntryResult!9024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114115 (= lt!425040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27182 thiss!1141)) key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))

(assert (=> d!114115 (validMask!0 (mask!27182 thiss!1141))))

(assert (=> d!114115 (= (seekEntry!0 key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)) lt!425039)))

(declare-fun b!941827 () Bool)

(declare-fun c!98131 () Bool)

(declare-fun lt!425041 () (_ BitVec 64))

(assert (=> b!941827 (= c!98131 (= lt!425041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529517 () SeekEntryResult!9024)

(declare-fun e!529516 () SeekEntryResult!9024)

(assert (=> b!941827 (= e!529517 e!529516)))

(declare-fun b!941828 () Bool)

(declare-fun lt!425038 () SeekEntryResult!9024)

(assert (=> b!941828 (= e!529516 (ite ((_ is MissingVacant!9024) lt!425038) (MissingZero!9024 (index!38470 lt!425038)) lt!425038))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56824 (_ BitVec 32)) SeekEntryResult!9024)

(assert (=> b!941828 (= lt!425038 (seekKeyOrZeroReturnVacant!0 (x!80831 lt!425040) (index!38469 lt!425040) (index!38469 lt!425040) key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))

(declare-fun b!941829 () Bool)

(assert (=> b!941829 (= e!529517 (Found!9024 (index!38469 lt!425040)))))

(declare-fun b!941830 () Bool)

(assert (=> b!941830 (= e!529516 (MissingZero!9024 (index!38469 lt!425040)))))

(declare-fun b!941831 () Bool)

(assert (=> b!941831 (= e!529515 e!529517)))

(assert (=> b!941831 (= lt!425041 (select (arr!27343 (_keys!10461 thiss!1141)) (index!38469 lt!425040)))))

(declare-fun c!98130 () Bool)

(assert (=> b!941831 (= c!98130 (= lt!425041 key!756))))

(declare-fun b!941832 () Bool)

(assert (=> b!941832 (= e!529515 Undefined!9024)))

(assert (= (and d!114115 c!98129) b!941832))

(assert (= (and d!114115 (not c!98129)) b!941831))

(assert (= (and b!941831 c!98130) b!941829))

(assert (= (and b!941831 (not c!98130)) b!941827))

(assert (= (and b!941827 c!98131) b!941830))

(assert (= (and b!941827 (not c!98131)) b!941828))

(declare-fun m!876723 () Bool)

(assert (=> d!114115 m!876723))

(declare-fun m!876725 () Bool)

(assert (=> d!114115 m!876725))

(assert (=> d!114115 m!876725))

(declare-fun m!876727 () Bool)

(assert (=> d!114115 m!876727))

(assert (=> d!114115 m!876693))

(declare-fun m!876729 () Bool)

(assert (=> b!941828 m!876729))

(declare-fun m!876731 () Bool)

(assert (=> b!941831 m!876731))

(assert (=> b!941774 d!114115))

(declare-fun mapIsEmpty!32460 () Bool)

(declare-fun mapRes!32460 () Bool)

(assert (=> mapIsEmpty!32460 mapRes!32460))

(declare-fun b!941840 () Bool)

(declare-fun e!529523 () Bool)

(assert (=> b!941840 (= e!529523 tp_is_empty!20433)))

(declare-fun condMapEmpty!32460 () Bool)

(declare-fun mapDefault!32460 () ValueCell!9735)

(assert (=> mapNonEmpty!32454 (= condMapEmpty!32460 (= mapRest!32454 ((as const (Array (_ BitVec 32) ValueCell!9735)) mapDefault!32460)))))

(assert (=> mapNonEmpty!32454 (= tp!62264 (and e!529523 mapRes!32460))))

(declare-fun b!941839 () Bool)

(declare-fun e!529522 () Bool)

(assert (=> b!941839 (= e!529522 tp_is_empty!20433)))

(declare-fun mapNonEmpty!32460 () Bool)

(declare-fun tp!62273 () Bool)

(assert (=> mapNonEmpty!32460 (= mapRes!32460 (and tp!62273 e!529522))))

(declare-fun mapValue!32460 () ValueCell!9735)

(declare-fun mapRest!32460 () (Array (_ BitVec 32) ValueCell!9735))

(declare-fun mapKey!32460 () (_ BitVec 32))

(assert (=> mapNonEmpty!32460 (= mapRest!32454 (store mapRest!32460 mapKey!32460 mapValue!32460))))

(assert (= (and mapNonEmpty!32454 condMapEmpty!32460) mapIsEmpty!32460))

(assert (= (and mapNonEmpty!32454 (not condMapEmpty!32460)) mapNonEmpty!32460))

(assert (= (and mapNonEmpty!32460 ((_ is ValueCellFull!9735) mapValue!32460)) b!941839))

(assert (= (and mapNonEmpty!32454 ((_ is ValueCellFull!9735) mapDefault!32460)) b!941840))

(declare-fun m!876733 () Bool)

(assert (=> mapNonEmpty!32460 m!876733))

(check-sat (not b!941813) (not d!114111) tp_is_empty!20433 (not mapNonEmpty!32460) (not b!941828) b_and!29337 (not d!114115) (not b!941812) (not b!941814) (not b_next!17925))
(check-sat b_and!29337 (not b_next!17925))
(get-model)

(declare-fun b!941853 () Bool)

(declare-fun e!529531 () SeekEntryResult!9024)

(declare-fun e!529530 () SeekEntryResult!9024)

(assert (=> b!941853 (= e!529531 e!529530)))

(declare-fun c!98139 () Bool)

(declare-fun lt!425046 () (_ BitVec 64))

(assert (=> b!941853 (= c!98139 (= lt!425046 key!756))))

(declare-fun lt!425047 () SeekEntryResult!9024)

(declare-fun d!114117 () Bool)

(assert (=> d!114117 (and (or ((_ is Undefined!9024) lt!425047) (not ((_ is Found!9024) lt!425047)) (and (bvsge (index!38468 lt!425047) #b00000000000000000000000000000000) (bvslt (index!38468 lt!425047) (size!27806 (_keys!10461 thiss!1141))))) (or ((_ is Undefined!9024) lt!425047) ((_ is Found!9024) lt!425047) (not ((_ is MissingVacant!9024) lt!425047)) (not (= (index!38470 lt!425047) (index!38469 lt!425040))) (and (bvsge (index!38470 lt!425047) #b00000000000000000000000000000000) (bvslt (index!38470 lt!425047) (size!27806 (_keys!10461 thiss!1141))))) (or ((_ is Undefined!9024) lt!425047) (ite ((_ is Found!9024) lt!425047) (= (select (arr!27343 (_keys!10461 thiss!1141)) (index!38468 lt!425047)) key!756) (and ((_ is MissingVacant!9024) lt!425047) (= (index!38470 lt!425047) (index!38469 lt!425040)) (= (select (arr!27343 (_keys!10461 thiss!1141)) (index!38470 lt!425047)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114117 (= lt!425047 e!529531)))

(declare-fun c!98140 () Bool)

(assert (=> d!114117 (= c!98140 (bvsge (x!80831 lt!425040) #b01111111111111111111111111111110))))

(assert (=> d!114117 (= lt!425046 (select (arr!27343 (_keys!10461 thiss!1141)) (index!38469 lt!425040)))))

(assert (=> d!114117 (validMask!0 (mask!27182 thiss!1141))))

(assert (=> d!114117 (= (seekKeyOrZeroReturnVacant!0 (x!80831 lt!425040) (index!38469 lt!425040) (index!38469 lt!425040) key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)) lt!425047)))

(declare-fun b!941854 () Bool)

(assert (=> b!941854 (= e!529531 Undefined!9024)))

(declare-fun b!941855 () Bool)

(declare-fun e!529532 () SeekEntryResult!9024)

(assert (=> b!941855 (= e!529532 (MissingVacant!9024 (index!38469 lt!425040)))))

(declare-fun b!941856 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941856 (= e!529532 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80831 lt!425040) #b00000000000000000000000000000001) (nextIndex!0 (index!38469 lt!425040) (x!80831 lt!425040) (mask!27182 thiss!1141)) (index!38469 lt!425040) key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))

(declare-fun b!941857 () Bool)

(assert (=> b!941857 (= e!529530 (Found!9024 (index!38469 lt!425040)))))

(declare-fun b!941858 () Bool)

(declare-fun c!98138 () Bool)

(assert (=> b!941858 (= c!98138 (= lt!425046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941858 (= e!529530 e!529532)))

(assert (= (and d!114117 c!98140) b!941854))

(assert (= (and d!114117 (not c!98140)) b!941853))

(assert (= (and b!941853 c!98139) b!941857))

(assert (= (and b!941853 (not c!98139)) b!941858))

(assert (= (and b!941858 c!98138) b!941855))

(assert (= (and b!941858 (not c!98138)) b!941856))

(declare-fun m!876735 () Bool)

(assert (=> d!114117 m!876735))

(declare-fun m!876737 () Bool)

(assert (=> d!114117 m!876737))

(assert (=> d!114117 m!876731))

(assert (=> d!114117 m!876693))

(declare-fun m!876739 () Bool)

(assert (=> b!941856 m!876739))

(assert (=> b!941856 m!876739))

(declare-fun m!876741 () Bool)

(assert (=> b!941856 m!876741))

(assert (=> b!941828 d!114117))

(declare-fun b!941869 () Bool)

(declare-fun e!529544 () Bool)

(declare-fun e!529541 () Bool)

(assert (=> b!941869 (= e!529544 e!529541)))

(declare-fun res!633044 () Bool)

(assert (=> b!941869 (=> (not res!633044) (not e!529541))))

(declare-fun e!529542 () Bool)

(assert (=> b!941869 (= res!633044 (not e!529542))))

(declare-fun res!633045 () Bool)

(assert (=> b!941869 (=> (not res!633045) (not e!529542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941869 (= res!633045 (validKeyInArray!0 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40932 () Bool)

(declare-fun call!40935 () Bool)

(declare-fun c!98143 () Bool)

(assert (=> bm!40932 (= call!40935 (arrayNoDuplicates!0 (_keys!10461 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98143 (Cons!19204 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000) Nil!19205) Nil!19205)))))

(declare-fun b!941871 () Bool)

(declare-fun contains!5133 (List!19208 (_ BitVec 64)) Bool)

(assert (=> b!941871 (= e!529542 (contains!5133 Nil!19205 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941872 () Bool)

(declare-fun e!529543 () Bool)

(assert (=> b!941872 (= e!529543 call!40935)))

(declare-fun b!941873 () Bool)

(assert (=> b!941873 (= e!529543 call!40935)))

(declare-fun d!114119 () Bool)

(declare-fun res!633043 () Bool)

(assert (=> d!114119 (=> res!633043 e!529544)))

(assert (=> d!114119 (= res!633043 (bvsge #b00000000000000000000000000000000 (size!27806 (_keys!10461 thiss!1141))))))

(assert (=> d!114119 (= (arrayNoDuplicates!0 (_keys!10461 thiss!1141) #b00000000000000000000000000000000 Nil!19205) e!529544)))

(declare-fun b!941870 () Bool)

(assert (=> b!941870 (= e!529541 e!529543)))

(assert (=> b!941870 (= c!98143 (validKeyInArray!0 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114119 (not res!633043)) b!941869))

(assert (= (and b!941869 res!633045) b!941871))

(assert (= (and b!941869 res!633044) b!941870))

(assert (= (and b!941870 c!98143) b!941872))

(assert (= (and b!941870 (not c!98143)) b!941873))

(assert (= (or b!941872 b!941873) bm!40932))

(declare-fun m!876743 () Bool)

(assert (=> b!941869 m!876743))

(assert (=> b!941869 m!876743))

(declare-fun m!876745 () Bool)

(assert (=> b!941869 m!876745))

(assert (=> bm!40932 m!876743))

(declare-fun m!876747 () Bool)

(assert (=> bm!40932 m!876747))

(assert (=> b!941871 m!876743))

(assert (=> b!941871 m!876743))

(declare-fun m!876749 () Bool)

(assert (=> b!941871 m!876749))

(assert (=> b!941870 m!876743))

(assert (=> b!941870 m!876743))

(assert (=> b!941870 m!876745))

(assert (=> b!941814 d!114119))

(declare-fun b!941892 () Bool)

(declare-fun e!529558 () Bool)

(declare-fun e!529555 () Bool)

(assert (=> b!941892 (= e!529558 e!529555)))

(declare-fun res!633054 () Bool)

(declare-fun lt!425053 () SeekEntryResult!9024)

(assert (=> b!941892 (= res!633054 (and ((_ is Intermediate!9024) lt!425053) (not (undefined!9836 lt!425053)) (bvslt (x!80831 lt!425053) #b01111111111111111111111111111110) (bvsge (x!80831 lt!425053) #b00000000000000000000000000000000) (bvsge (x!80831 lt!425053) #b00000000000000000000000000000000)))))

(assert (=> b!941892 (=> (not res!633054) (not e!529555))))

(declare-fun b!941893 () Bool)

(assert (=> b!941893 (and (bvsge (index!38469 lt!425053) #b00000000000000000000000000000000) (bvslt (index!38469 lt!425053) (size!27806 (_keys!10461 thiss!1141))))))

(declare-fun e!529556 () Bool)

(assert (=> b!941893 (= e!529556 (= (select (arr!27343 (_keys!10461 thiss!1141)) (index!38469 lt!425053)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!941894 () Bool)

(assert (=> b!941894 (and (bvsge (index!38469 lt!425053) #b00000000000000000000000000000000) (bvslt (index!38469 lt!425053) (size!27806 (_keys!10461 thiss!1141))))))

(declare-fun res!633052 () Bool)

(assert (=> b!941894 (= res!633052 (= (select (arr!27343 (_keys!10461 thiss!1141)) (index!38469 lt!425053)) key!756))))

(assert (=> b!941894 (=> res!633052 e!529556)))

(assert (=> b!941894 (= e!529555 e!529556)))

(declare-fun b!941895 () Bool)

(assert (=> b!941895 (= e!529558 (bvsge (x!80831 lt!425053) #b01111111111111111111111111111110))))

(declare-fun d!114121 () Bool)

(assert (=> d!114121 e!529558))

(declare-fun c!98150 () Bool)

(assert (=> d!114121 (= c!98150 (and ((_ is Intermediate!9024) lt!425053) (undefined!9836 lt!425053)))))

(declare-fun e!529557 () SeekEntryResult!9024)

(assert (=> d!114121 (= lt!425053 e!529557)))

(declare-fun c!98151 () Bool)

(assert (=> d!114121 (= c!98151 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425052 () (_ BitVec 64))

(assert (=> d!114121 (= lt!425052 (select (arr!27343 (_keys!10461 thiss!1141)) (toIndex!0 key!756 (mask!27182 thiss!1141))))))

(assert (=> d!114121 (validMask!0 (mask!27182 thiss!1141))))

(assert (=> d!114121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27182 thiss!1141)) key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)) lt!425053)))

(declare-fun b!941896 () Bool)

(declare-fun e!529559 () SeekEntryResult!9024)

(assert (=> b!941896 (= e!529557 e!529559)))

(declare-fun c!98152 () Bool)

(assert (=> b!941896 (= c!98152 (or (= lt!425052 key!756) (= (bvadd lt!425052 lt!425052) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941897 () Bool)

(assert (=> b!941897 (= e!529559 (Intermediate!9024 false (toIndex!0 key!756 (mask!27182 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941898 () Bool)

(assert (=> b!941898 (and (bvsge (index!38469 lt!425053) #b00000000000000000000000000000000) (bvslt (index!38469 lt!425053) (size!27806 (_keys!10461 thiss!1141))))))

(declare-fun res!633053 () Bool)

(assert (=> b!941898 (= res!633053 (= (select (arr!27343 (_keys!10461 thiss!1141)) (index!38469 lt!425053)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941898 (=> res!633053 e!529556)))

(declare-fun b!941899 () Bool)

(assert (=> b!941899 (= e!529559 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27182 thiss!1141)) #b00000000000000000000000000000000 (mask!27182 thiss!1141)) key!756 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))

(declare-fun b!941900 () Bool)

(assert (=> b!941900 (= e!529557 (Intermediate!9024 true (toIndex!0 key!756 (mask!27182 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114121 c!98151) b!941900))

(assert (= (and d!114121 (not c!98151)) b!941896))

(assert (= (and b!941896 c!98152) b!941897))

(assert (= (and b!941896 (not c!98152)) b!941899))

(assert (= (and d!114121 c!98150) b!941895))

(assert (= (and d!114121 (not c!98150)) b!941892))

(assert (= (and b!941892 res!633054) b!941894))

(assert (= (and b!941894 (not res!633052)) b!941898))

(assert (= (and b!941898 (not res!633053)) b!941893))

(assert (=> b!941899 m!876725))

(declare-fun m!876751 () Bool)

(assert (=> b!941899 m!876751))

(assert (=> b!941899 m!876751))

(declare-fun m!876753 () Bool)

(assert (=> b!941899 m!876753))

(declare-fun m!876755 () Bool)

(assert (=> b!941894 m!876755))

(assert (=> b!941898 m!876755))

(assert (=> b!941893 m!876755))

(assert (=> d!114121 m!876725))

(declare-fun m!876757 () Bool)

(assert (=> d!114121 m!876757))

(assert (=> d!114121 m!876693))

(assert (=> d!114115 d!114121))

(declare-fun d!114123 () Bool)

(declare-fun lt!425059 () (_ BitVec 32))

(declare-fun lt!425058 () (_ BitVec 32))

(assert (=> d!114123 (= lt!425059 (bvmul (bvxor lt!425058 (bvlshr lt!425058 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114123 (= lt!425058 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114123 (and (bvsge (mask!27182 thiss!1141) #b00000000000000000000000000000000) (let ((res!633055 (let ((h!20353 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80849 (bvmul (bvxor h!20353 (bvlshr h!20353 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80849 (bvlshr x!80849 #b00000000000000000000000000001101)) (mask!27182 thiss!1141)))))) (and (bvslt res!633055 (bvadd (mask!27182 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633055 #b00000000000000000000000000000000))))))

(assert (=> d!114123 (= (toIndex!0 key!756 (mask!27182 thiss!1141)) (bvand (bvxor lt!425059 (bvlshr lt!425059 #b00000000000000000000000000001101)) (mask!27182 thiss!1141)))))

(assert (=> d!114115 d!114123))

(assert (=> d!114115 d!114113))

(declare-fun bm!40935 () Bool)

(declare-fun call!40938 () Bool)

(assert (=> bm!40935 (= call!40938 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10461 thiss!1141) (mask!27182 thiss!1141)))))

(declare-fun b!941909 () Bool)

(declare-fun e!529566 () Bool)

(declare-fun e!529568 () Bool)

(assert (=> b!941909 (= e!529566 e!529568)))

(declare-fun lt!425068 () (_ BitVec 64))

(assert (=> b!941909 (= lt!425068 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31804 0))(
  ( (Unit!31805) )
))
(declare-fun lt!425067 () Unit!31804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56824 (_ BitVec 64) (_ BitVec 32)) Unit!31804)

(assert (=> b!941909 (= lt!425067 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10461 thiss!1141) lt!425068 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941909 (arrayContainsKey!0 (_keys!10461 thiss!1141) lt!425068 #b00000000000000000000000000000000)))

(declare-fun lt!425066 () Unit!31804)

(assert (=> b!941909 (= lt!425066 lt!425067)))

(declare-fun res!633060 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56824 (_ BitVec 32)) SeekEntryResult!9024)

(assert (=> b!941909 (= res!633060 (= (seekEntryOrOpen!0 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000) (_keys!10461 thiss!1141) (mask!27182 thiss!1141)) (Found!9024 #b00000000000000000000000000000000)))))

(assert (=> b!941909 (=> (not res!633060) (not e!529568))))

(declare-fun b!941910 () Bool)

(declare-fun e!529567 () Bool)

(assert (=> b!941910 (= e!529567 e!529566)))

(declare-fun c!98155 () Bool)

(assert (=> b!941910 (= c!98155 (validKeyInArray!0 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941911 () Bool)

(assert (=> b!941911 (= e!529566 call!40938)))

(declare-fun d!114125 () Bool)

(declare-fun res!633061 () Bool)

(assert (=> d!114125 (=> res!633061 e!529567)))

(assert (=> d!114125 (= res!633061 (bvsge #b00000000000000000000000000000000 (size!27806 (_keys!10461 thiss!1141))))))

(assert (=> d!114125 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10461 thiss!1141) (mask!27182 thiss!1141)) e!529567)))

(declare-fun b!941912 () Bool)

(assert (=> b!941912 (= e!529568 call!40938)))

(assert (= (and d!114125 (not res!633061)) b!941910))

(assert (= (and b!941910 c!98155) b!941909))

(assert (= (and b!941910 (not c!98155)) b!941911))

(assert (= (and b!941909 res!633060) b!941912))

(assert (= (or b!941912 b!941911) bm!40935))

(declare-fun m!876759 () Bool)

(assert (=> bm!40935 m!876759))

(assert (=> b!941909 m!876743))

(declare-fun m!876761 () Bool)

(assert (=> b!941909 m!876761))

(declare-fun m!876763 () Bool)

(assert (=> b!941909 m!876763))

(assert (=> b!941909 m!876743))

(declare-fun m!876765 () Bool)

(assert (=> b!941909 m!876765))

(assert (=> b!941910 m!876743))

(assert (=> b!941910 m!876743))

(assert (=> b!941910 m!876745))

(assert (=> b!941813 d!114125))

(declare-fun b!941921 () Bool)

(declare-fun e!529574 () (_ BitVec 32))

(declare-fun e!529573 () (_ BitVec 32))

(assert (=> b!941921 (= e!529574 e!529573)))

(declare-fun c!98160 () Bool)

(assert (=> b!941921 (= c!98160 (validKeyInArray!0 (select (arr!27343 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114127 () Bool)

(declare-fun lt!425071 () (_ BitVec 32))

(assert (=> d!114127 (and (bvsge lt!425071 #b00000000000000000000000000000000) (bvsle lt!425071 (bvsub (size!27806 (_keys!10461 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114127 (= lt!425071 e!529574)))

(declare-fun c!98161 () Bool)

(assert (=> d!114127 (= c!98161 (bvsge #b00000000000000000000000000000000 (size!27806 (_keys!10461 thiss!1141))))))

(assert (=> d!114127 (and (bvsle #b00000000000000000000000000000000 (size!27806 (_keys!10461 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27806 (_keys!10461 thiss!1141)) (size!27806 (_keys!10461 thiss!1141))))))

(assert (=> d!114127 (= (arrayCountValidKeys!0 (_keys!10461 thiss!1141) #b00000000000000000000000000000000 (size!27806 (_keys!10461 thiss!1141))) lt!425071)))

(declare-fun b!941922 () Bool)

(assert (=> b!941922 (= e!529574 #b00000000000000000000000000000000)))

(declare-fun b!941923 () Bool)

(declare-fun call!40941 () (_ BitVec 32))

(assert (=> b!941923 (= e!529573 (bvadd #b00000000000000000000000000000001 call!40941))))

(declare-fun bm!40938 () Bool)

(assert (=> bm!40938 (= call!40941 (arrayCountValidKeys!0 (_keys!10461 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27806 (_keys!10461 thiss!1141))))))

(declare-fun b!941924 () Bool)

(assert (=> b!941924 (= e!529573 call!40941)))

(assert (= (and d!114127 c!98161) b!941922))

(assert (= (and d!114127 (not c!98161)) b!941921))

(assert (= (and b!941921 c!98160) b!941923))

(assert (= (and b!941921 (not c!98160)) b!941924))

(assert (= (or b!941923 b!941924) bm!40938))

(assert (=> b!941921 m!876743))

(assert (=> b!941921 m!876743))

(assert (=> b!941921 m!876745))

(declare-fun m!876767 () Bool)

(assert (=> bm!40938 m!876767))

(assert (=> b!941812 d!114127))

(declare-fun b!941935 () Bool)

(declare-fun res!633070 () Bool)

(declare-fun e!529577 () Bool)

(assert (=> b!941935 (=> (not res!633070) (not e!529577))))

(declare-fun size!27809 (LongMapFixedSize!4620) (_ BitVec 32))

(assert (=> b!941935 (= res!633070 (= (size!27809 thiss!1141) (bvadd (_size!2365 thiss!1141) (bvsdiv (bvadd (extraKeys!5333 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114129 () Bool)

(declare-fun res!633073 () Bool)

(assert (=> d!114129 (=> (not res!633073) (not e!529577))))

(assert (=> d!114129 (= res!633073 (validMask!0 (mask!27182 thiss!1141)))))

(assert (=> d!114129 (= (simpleValid!343 thiss!1141) e!529577)))

(declare-fun b!941933 () Bool)

(declare-fun res!633072 () Bool)

(assert (=> b!941933 (=> (not res!633072) (not e!529577))))

(assert (=> b!941933 (= res!633072 (and (= (size!27805 (_values!5624 thiss!1141)) (bvadd (mask!27182 thiss!1141) #b00000000000000000000000000000001)) (= (size!27806 (_keys!10461 thiss!1141)) (size!27805 (_values!5624 thiss!1141))) (bvsge (_size!2365 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2365 thiss!1141) (bvadd (mask!27182 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!941934 () Bool)

(declare-fun res!633071 () Bool)

(assert (=> b!941934 (=> (not res!633071) (not e!529577))))

(assert (=> b!941934 (= res!633071 (bvsge (size!27809 thiss!1141) (_size!2365 thiss!1141)))))

(declare-fun b!941936 () Bool)

(assert (=> b!941936 (= e!529577 (and (bvsge (extraKeys!5333 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5333 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2365 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114129 res!633073) b!941933))

(assert (= (and b!941933 res!633072) b!941934))

(assert (= (and b!941934 res!633071) b!941935))

(assert (= (and b!941935 res!633070) b!941936))

(declare-fun m!876769 () Bool)

(assert (=> b!941935 m!876769))

(assert (=> d!114129 m!876693))

(assert (=> b!941934 m!876769))

(assert (=> d!114111 d!114129))

(declare-fun mapIsEmpty!32461 () Bool)

(declare-fun mapRes!32461 () Bool)

(assert (=> mapIsEmpty!32461 mapRes!32461))

(declare-fun b!941938 () Bool)

(declare-fun e!529579 () Bool)

(assert (=> b!941938 (= e!529579 tp_is_empty!20433)))

(declare-fun condMapEmpty!32461 () Bool)

(declare-fun mapDefault!32461 () ValueCell!9735)

(assert (=> mapNonEmpty!32460 (= condMapEmpty!32461 (= mapRest!32460 ((as const (Array (_ BitVec 32) ValueCell!9735)) mapDefault!32461)))))

(assert (=> mapNonEmpty!32460 (= tp!62273 (and e!529579 mapRes!32461))))

(declare-fun b!941937 () Bool)

(declare-fun e!529578 () Bool)

(assert (=> b!941937 (= e!529578 tp_is_empty!20433)))

(declare-fun mapNonEmpty!32461 () Bool)

(declare-fun tp!62274 () Bool)

(assert (=> mapNonEmpty!32461 (= mapRes!32461 (and tp!62274 e!529578))))

(declare-fun mapKey!32461 () (_ BitVec 32))

(declare-fun mapValue!32461 () ValueCell!9735)

(declare-fun mapRest!32461 () (Array (_ BitVec 32) ValueCell!9735))

(assert (=> mapNonEmpty!32461 (= mapRest!32460 (store mapRest!32461 mapKey!32461 mapValue!32461))))

(assert (= (and mapNonEmpty!32460 condMapEmpty!32461) mapIsEmpty!32461))

(assert (= (and mapNonEmpty!32460 (not condMapEmpty!32461)) mapNonEmpty!32461))

(assert (= (and mapNonEmpty!32461 ((_ is ValueCellFull!9735) mapValue!32461)) b!941937))

(assert (= (and mapNonEmpty!32460 ((_ is ValueCellFull!9735) mapDefault!32461)) b!941938))

(declare-fun m!876771 () Bool)

(assert (=> mapNonEmpty!32461 m!876771))

(check-sat (not b!941899) (not b!941869) tp_is_empty!20433 (not mapNonEmpty!32461) (not b!941935) (not b!941910) (not b!941921) (not b!941909) (not bm!40938) (not b!941934) (not b!941871) (not b!941870) (not d!114121) (not bm!40935) (not b_next!17925) (not b!941856) (not d!114129) (not bm!40932) (not d!114117) b_and!29337)
(check-sat b_and!29337 (not b_next!17925))
