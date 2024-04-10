; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76428 () Bool)

(assert start!76428)

(declare-fun b!896310 () Bool)

(declare-fun b_free!15945 () Bool)

(declare-fun b_next!15945 () Bool)

(assert (=> b!896310 (= b_free!15945 (not b_next!15945))))

(declare-fun tp!55863 () Bool)

(declare-fun b_and!26237 () Bool)

(assert (=> b!896310 (= tp!55863 b_and!26237)))

(declare-fun mapIsEmpty!29024 () Bool)

(declare-fun mapRes!29024 () Bool)

(assert (=> mapIsEmpty!29024 mapRes!29024))

(declare-fun b!896309 () Bool)

(declare-fun e!500960 () Bool)

(declare-fun e!500959 () Bool)

(assert (=> b!896309 (= e!500960 (not e!500959))))

(declare-fun res!606087 () Bool)

(assert (=> b!896309 (=> res!606087 e!500959)))

(declare-datatypes ((SeekEntryResult!8894 0))(
  ( (MissingZero!8894 (index!37947 (_ BitVec 32))) (Found!8894 (index!37948 (_ BitVec 32))) (Intermediate!8894 (undefined!9706 Bool) (index!37949 (_ BitVec 32)) (x!76311 (_ BitVec 32))) (Undefined!8894) (MissingVacant!8894 (index!37950 (_ BitVec 32))) )
))
(declare-fun lt!404773 () SeekEntryResult!8894)

(declare-datatypes ((array!52560 0))(
  ( (array!52561 (arr!25269 (Array (_ BitVec 32) (_ BitVec 64))) (size!25720 (_ BitVec 32))) )
))
(declare-datatypes ((V!29329 0))(
  ( (V!29330 (val!9187 Int)) )
))
(declare-datatypes ((ValueCell!8655 0))(
  ( (ValueCellFull!8655 (v!11677 V!29329)) (EmptyCell!8655) )
))
(declare-datatypes ((array!52562 0))(
  ( (array!52563 (arr!25270 (Array (_ BitVec 32) ValueCell!8655)) (size!25721 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4326 0))(
  ( (LongMapFixedSize!4327 (defaultEntry!5375 Int) (mask!26010 (_ BitVec 32)) (extraKeys!5075 (_ BitVec 32)) (zeroValue!5179 V!29329) (minValue!5179 V!29329) (_size!2218 (_ BitVec 32)) (_keys!10106 array!52560) (_values!5366 array!52562) (_vacant!2218 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4326)

(get-info :version)

(assert (=> b!896309 (= res!606087 (or (not ((_ is Found!8894) lt!404773)) (bvslt (index!37948 lt!404773) #b00000000000000000000000000000000) (bvsge (index!37948 lt!404773) (size!25720 (_keys!10106 thiss!1181))) (bvsge (size!25720 (_keys!10106 thiss!1181)) #b01111111111111111111111111111111)))))

(declare-fun e!500961 () Bool)

(assert (=> b!896309 e!500961))

(declare-fun res!606090 () Bool)

(assert (=> b!896309 (=> res!606090 e!500961)))

(assert (=> b!896309 (= res!606090 (not ((_ is Found!8894) lt!404773)))))

(declare-datatypes ((Unit!30480 0))(
  ( (Unit!30481) )
))
(declare-fun lt!404772 () Unit!30480)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!68 (array!52560 array!52562 (_ BitVec 32) (_ BitVec 32) V!29329 V!29329 (_ BitVec 64)) Unit!30480)

(assert (=> b!896309 (= lt!404772 (lemmaSeekEntryGivesInRangeIndex!68 (_keys!10106 thiss!1181) (_values!5366 thiss!1181) (mask!26010 thiss!1181) (extraKeys!5075 thiss!1181) (zeroValue!5179 thiss!1181) (minValue!5179 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52560 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!896309 (= lt!404773 (seekEntry!0 key!785 (_keys!10106 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun e!500956 () Bool)

(declare-fun e!500957 () Bool)

(declare-fun tp_is_empty!18273 () Bool)

(declare-fun array_inv!19838 (array!52560) Bool)

(declare-fun array_inv!19839 (array!52562) Bool)

(assert (=> b!896310 (= e!500957 (and tp!55863 tp_is_empty!18273 (array_inv!19838 (_keys!10106 thiss!1181)) (array_inv!19839 (_values!5366 thiss!1181)) e!500956))))

(declare-fun b!896311 () Bool)

(declare-fun arrayContainsKey!0 (array!52560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896311 (= e!500959 (arrayContainsKey!0 (_keys!10106 thiss!1181) key!785 (index!37948 lt!404773)))))

(declare-fun b!896312 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896312 (= e!500961 (inRange!0 (index!37948 lt!404773) (mask!26010 thiss!1181)))))

(declare-fun mapNonEmpty!29024 () Bool)

(declare-fun tp!55864 () Bool)

(declare-fun e!500958 () Bool)

(assert (=> mapNonEmpty!29024 (= mapRes!29024 (and tp!55864 e!500958))))

(declare-fun mapRest!29024 () (Array (_ BitVec 32) ValueCell!8655))

(declare-fun mapValue!29024 () ValueCell!8655)

(declare-fun mapKey!29024 () (_ BitVec 32))

(assert (=> mapNonEmpty!29024 (= (arr!25270 (_values!5366 thiss!1181)) (store mapRest!29024 mapKey!29024 mapValue!29024))))

(declare-fun b!896313 () Bool)

(assert (=> b!896313 (= e!500958 tp_is_empty!18273)))

(declare-fun b!896314 () Bool)

(declare-fun e!500962 () Bool)

(assert (=> b!896314 (= e!500962 tp_is_empty!18273)))

(declare-fun b!896315 () Bool)

(assert (=> b!896315 (= e!500956 (and e!500962 mapRes!29024))))

(declare-fun condMapEmpty!29024 () Bool)

(declare-fun mapDefault!29024 () ValueCell!8655)

(assert (=> b!896315 (= condMapEmpty!29024 (= (arr!25270 (_values!5366 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8655)) mapDefault!29024)))))

(declare-fun b!896316 () Bool)

(declare-fun res!606088 () Bool)

(assert (=> b!896316 (=> (not res!606088) (not e!500960))))

(assert (=> b!896316 (= res!606088 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606089 () Bool)

(assert (=> start!76428 (=> (not res!606089) (not e!500960))))

(declare-fun valid!1669 (LongMapFixedSize!4326) Bool)

(assert (=> start!76428 (= res!606089 (valid!1669 thiss!1181))))

(assert (=> start!76428 e!500960))

(assert (=> start!76428 e!500957))

(assert (=> start!76428 true))

(assert (= (and start!76428 res!606089) b!896316))

(assert (= (and b!896316 res!606088) b!896309))

(assert (= (and b!896309 (not res!606090)) b!896312))

(assert (= (and b!896309 (not res!606087)) b!896311))

(assert (= (and b!896315 condMapEmpty!29024) mapIsEmpty!29024))

(assert (= (and b!896315 (not condMapEmpty!29024)) mapNonEmpty!29024))

(assert (= (and mapNonEmpty!29024 ((_ is ValueCellFull!8655) mapValue!29024)) b!896313))

(assert (= (and b!896315 ((_ is ValueCellFull!8655) mapDefault!29024)) b!896314))

(assert (= b!896310 b!896315))

(assert (= start!76428 b!896310))

(declare-fun m!833527 () Bool)

(assert (=> b!896311 m!833527))

(declare-fun m!833529 () Bool)

(assert (=> mapNonEmpty!29024 m!833529))

(declare-fun m!833531 () Bool)

(assert (=> b!896309 m!833531))

(declare-fun m!833533 () Bool)

(assert (=> b!896309 m!833533))

(declare-fun m!833535 () Bool)

(assert (=> b!896310 m!833535))

(declare-fun m!833537 () Bool)

(assert (=> b!896310 m!833537))

(declare-fun m!833539 () Bool)

(assert (=> start!76428 m!833539))

(declare-fun m!833541 () Bool)

(assert (=> b!896312 m!833541))

(check-sat b_and!26237 (not b!896312) (not b_next!15945) (not b!896311) (not start!76428) (not b!896309) tp_is_empty!18273 (not mapNonEmpty!29024) (not b!896310))
(check-sat b_and!26237 (not b_next!15945))
(get-model)

(declare-fun d!110893 () Bool)

(declare-fun res!606109 () Bool)

(declare-fun e!500989 () Bool)

(assert (=> d!110893 (=> (not res!606109) (not e!500989))))

(declare-fun simpleValid!312 (LongMapFixedSize!4326) Bool)

(assert (=> d!110893 (= res!606109 (simpleValid!312 thiss!1181))))

(assert (=> d!110893 (= (valid!1669 thiss!1181) e!500989)))

(declare-fun b!896347 () Bool)

(declare-fun res!606110 () Bool)

(assert (=> b!896347 (=> (not res!606110) (not e!500989))))

(declare-fun arrayCountValidKeys!0 (array!52560 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896347 (= res!606110 (= (arrayCountValidKeys!0 (_keys!10106 thiss!1181) #b00000000000000000000000000000000 (size!25720 (_keys!10106 thiss!1181))) (_size!2218 thiss!1181)))))

(declare-fun b!896348 () Bool)

(declare-fun res!606111 () Bool)

(assert (=> b!896348 (=> (not res!606111) (not e!500989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52560 (_ BitVec 32)) Bool)

(assert (=> b!896348 (= res!606111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10106 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun b!896349 () Bool)

(declare-datatypes ((List!17822 0))(
  ( (Nil!17819) (Cons!17818 (h!18956 (_ BitVec 64)) (t!25161 List!17822)) )
))
(declare-fun arrayNoDuplicates!0 (array!52560 (_ BitVec 32) List!17822) Bool)

(assert (=> b!896349 (= e!500989 (arrayNoDuplicates!0 (_keys!10106 thiss!1181) #b00000000000000000000000000000000 Nil!17819))))

(assert (= (and d!110893 res!606109) b!896347))

(assert (= (and b!896347 res!606110) b!896348))

(assert (= (and b!896348 res!606111) b!896349))

(declare-fun m!833559 () Bool)

(assert (=> d!110893 m!833559))

(declare-fun m!833561 () Bool)

(assert (=> b!896347 m!833561))

(declare-fun m!833563 () Bool)

(assert (=> b!896348 m!833563))

(declare-fun m!833565 () Bool)

(assert (=> b!896349 m!833565))

(assert (=> start!76428 d!110893))

(declare-fun d!110895 () Bool)

(declare-fun e!500992 () Bool)

(assert (=> d!110895 e!500992))

(declare-fun res!606114 () Bool)

(assert (=> d!110895 (=> res!606114 e!500992)))

(declare-fun lt!404785 () SeekEntryResult!8894)

(assert (=> d!110895 (= res!606114 (not ((_ is Found!8894) lt!404785)))))

(assert (=> d!110895 (= lt!404785 (seekEntry!0 key!785 (_keys!10106 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun lt!404784 () Unit!30480)

(declare-fun choose!1477 (array!52560 array!52562 (_ BitVec 32) (_ BitVec 32) V!29329 V!29329 (_ BitVec 64)) Unit!30480)

(assert (=> d!110895 (= lt!404784 (choose!1477 (_keys!10106 thiss!1181) (_values!5366 thiss!1181) (mask!26010 thiss!1181) (extraKeys!5075 thiss!1181) (zeroValue!5179 thiss!1181) (minValue!5179 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110895 (validMask!0 (mask!26010 thiss!1181))))

(assert (=> d!110895 (= (lemmaSeekEntryGivesInRangeIndex!68 (_keys!10106 thiss!1181) (_values!5366 thiss!1181) (mask!26010 thiss!1181) (extraKeys!5075 thiss!1181) (zeroValue!5179 thiss!1181) (minValue!5179 thiss!1181) key!785) lt!404784)))

(declare-fun b!896352 () Bool)

(assert (=> b!896352 (= e!500992 (inRange!0 (index!37948 lt!404785) (mask!26010 thiss!1181)))))

(assert (= (and d!110895 (not res!606114)) b!896352))

(assert (=> d!110895 m!833533))

(declare-fun m!833567 () Bool)

(assert (=> d!110895 m!833567))

(declare-fun m!833569 () Bool)

(assert (=> d!110895 m!833569))

(declare-fun m!833571 () Bool)

(assert (=> b!896352 m!833571))

(assert (=> b!896309 d!110895))

(declare-fun b!896365 () Bool)

(declare-fun e!500999 () SeekEntryResult!8894)

(declare-fun lt!404795 () SeekEntryResult!8894)

(assert (=> b!896365 (= e!500999 (ite ((_ is MissingVacant!8894) lt!404795) (MissingZero!8894 (index!37950 lt!404795)) lt!404795))))

(declare-fun lt!404796 () SeekEntryResult!8894)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52560 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!896365 (= lt!404795 (seekKeyOrZeroReturnVacant!0 (x!76311 lt!404796) (index!37949 lt!404796) (index!37949 lt!404796) key!785 (_keys!10106 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun b!896366 () Bool)

(declare-fun e!501001 () SeekEntryResult!8894)

(assert (=> b!896366 (= e!501001 Undefined!8894)))

(declare-fun b!896367 () Bool)

(declare-fun c!94681 () Bool)

(declare-fun lt!404794 () (_ BitVec 64))

(assert (=> b!896367 (= c!94681 (= lt!404794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501000 () SeekEntryResult!8894)

(assert (=> b!896367 (= e!501000 e!500999)))

(declare-fun d!110897 () Bool)

(declare-fun lt!404797 () SeekEntryResult!8894)

(assert (=> d!110897 (and (or ((_ is MissingVacant!8894) lt!404797) (not ((_ is Found!8894) lt!404797)) (and (bvsge (index!37948 lt!404797) #b00000000000000000000000000000000) (bvslt (index!37948 lt!404797) (size!25720 (_keys!10106 thiss!1181))))) (not ((_ is MissingVacant!8894) lt!404797)) (or (not ((_ is Found!8894) lt!404797)) (= (select (arr!25269 (_keys!10106 thiss!1181)) (index!37948 lt!404797)) key!785)))))

(assert (=> d!110897 (= lt!404797 e!501001)))

(declare-fun c!94680 () Bool)

(assert (=> d!110897 (= c!94680 (and ((_ is Intermediate!8894) lt!404796) (undefined!9706 lt!404796)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52560 (_ BitVec 32)) SeekEntryResult!8894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110897 (= lt!404796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26010 thiss!1181)) key!785 (_keys!10106 thiss!1181) (mask!26010 thiss!1181)))))

(assert (=> d!110897 (validMask!0 (mask!26010 thiss!1181))))

(assert (=> d!110897 (= (seekEntry!0 key!785 (_keys!10106 thiss!1181) (mask!26010 thiss!1181)) lt!404797)))

(declare-fun b!896368 () Bool)

(assert (=> b!896368 (= e!500999 (MissingZero!8894 (index!37949 lt!404796)))))

(declare-fun b!896369 () Bool)

(assert (=> b!896369 (= e!501000 (Found!8894 (index!37949 lt!404796)))))

(declare-fun b!896370 () Bool)

(assert (=> b!896370 (= e!501001 e!501000)))

(assert (=> b!896370 (= lt!404794 (select (arr!25269 (_keys!10106 thiss!1181)) (index!37949 lt!404796)))))

(declare-fun c!94682 () Bool)

(assert (=> b!896370 (= c!94682 (= lt!404794 key!785))))

(assert (= (and d!110897 c!94680) b!896366))

(assert (= (and d!110897 (not c!94680)) b!896370))

(assert (= (and b!896370 c!94682) b!896369))

(assert (= (and b!896370 (not c!94682)) b!896367))

(assert (= (and b!896367 c!94681) b!896368))

(assert (= (and b!896367 (not c!94681)) b!896365))

(declare-fun m!833573 () Bool)

(assert (=> b!896365 m!833573))

(declare-fun m!833575 () Bool)

(assert (=> d!110897 m!833575))

(declare-fun m!833577 () Bool)

(assert (=> d!110897 m!833577))

(assert (=> d!110897 m!833577))

(declare-fun m!833579 () Bool)

(assert (=> d!110897 m!833579))

(assert (=> d!110897 m!833569))

(declare-fun m!833581 () Bool)

(assert (=> b!896370 m!833581))

(assert (=> b!896309 d!110897))

(declare-fun d!110899 () Bool)

(assert (=> d!110899 (= (inRange!0 (index!37948 lt!404773) (mask!26010 thiss!1181)) (and (bvsge (index!37948 lt!404773) #b00000000000000000000000000000000) (bvslt (index!37948 lt!404773) (bvadd (mask!26010 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896312 d!110899))

(declare-fun d!110901 () Bool)

(declare-fun res!606119 () Bool)

(declare-fun e!501006 () Bool)

(assert (=> d!110901 (=> res!606119 e!501006)))

(assert (=> d!110901 (= res!606119 (= (select (arr!25269 (_keys!10106 thiss!1181)) (index!37948 lt!404773)) key!785))))

(assert (=> d!110901 (= (arrayContainsKey!0 (_keys!10106 thiss!1181) key!785 (index!37948 lt!404773)) e!501006)))

(declare-fun b!896375 () Bool)

(declare-fun e!501007 () Bool)

(assert (=> b!896375 (= e!501006 e!501007)))

(declare-fun res!606120 () Bool)

(assert (=> b!896375 (=> (not res!606120) (not e!501007))))

(assert (=> b!896375 (= res!606120 (bvslt (bvadd (index!37948 lt!404773) #b00000000000000000000000000000001) (size!25720 (_keys!10106 thiss!1181))))))

(declare-fun b!896376 () Bool)

(assert (=> b!896376 (= e!501007 (arrayContainsKey!0 (_keys!10106 thiss!1181) key!785 (bvadd (index!37948 lt!404773) #b00000000000000000000000000000001)))))

(assert (= (and d!110901 (not res!606119)) b!896375))

(assert (= (and b!896375 res!606120) b!896376))

(declare-fun m!833583 () Bool)

(assert (=> d!110901 m!833583))

(declare-fun m!833585 () Bool)

(assert (=> b!896376 m!833585))

(assert (=> b!896311 d!110901))

(declare-fun d!110903 () Bool)

(assert (=> d!110903 (= (array_inv!19838 (_keys!10106 thiss!1181)) (bvsge (size!25720 (_keys!10106 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896310 d!110903))

(declare-fun d!110905 () Bool)

(assert (=> d!110905 (= (array_inv!19839 (_values!5366 thiss!1181)) (bvsge (size!25721 (_values!5366 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896310 d!110905))

(declare-fun b!896383 () Bool)

(declare-fun e!501013 () Bool)

(assert (=> b!896383 (= e!501013 tp_is_empty!18273)))

(declare-fun mapIsEmpty!29030 () Bool)

(declare-fun mapRes!29030 () Bool)

(assert (=> mapIsEmpty!29030 mapRes!29030))

(declare-fun condMapEmpty!29030 () Bool)

(declare-fun mapDefault!29030 () ValueCell!8655)

(assert (=> mapNonEmpty!29024 (= condMapEmpty!29030 (= mapRest!29024 ((as const (Array (_ BitVec 32) ValueCell!8655)) mapDefault!29030)))))

(declare-fun e!501012 () Bool)

(assert (=> mapNonEmpty!29024 (= tp!55864 (and e!501012 mapRes!29030))))

(declare-fun b!896384 () Bool)

(assert (=> b!896384 (= e!501012 tp_is_empty!18273)))

(declare-fun mapNonEmpty!29030 () Bool)

(declare-fun tp!55873 () Bool)

(assert (=> mapNonEmpty!29030 (= mapRes!29030 (and tp!55873 e!501013))))

(declare-fun mapValue!29030 () ValueCell!8655)

(declare-fun mapRest!29030 () (Array (_ BitVec 32) ValueCell!8655))

(declare-fun mapKey!29030 () (_ BitVec 32))

(assert (=> mapNonEmpty!29030 (= mapRest!29024 (store mapRest!29030 mapKey!29030 mapValue!29030))))

(assert (= (and mapNonEmpty!29024 condMapEmpty!29030) mapIsEmpty!29030))

(assert (= (and mapNonEmpty!29024 (not condMapEmpty!29030)) mapNonEmpty!29030))

(assert (= (and mapNonEmpty!29030 ((_ is ValueCellFull!8655) mapValue!29030)) b!896383))

(assert (= (and mapNonEmpty!29024 ((_ is ValueCellFull!8655) mapDefault!29030)) b!896384))

(declare-fun m!833587 () Bool)

(assert (=> mapNonEmpty!29030 m!833587))

(check-sat b_and!26237 (not mapNonEmpty!29030) (not b_next!15945) (not d!110895) (not d!110893) (not b!896348) (not b!896349) (not d!110897) (not b!896365) (not b!896347) (not b!896352) (not b!896376) tp_is_empty!18273)
(check-sat b_and!26237 (not b_next!15945))
