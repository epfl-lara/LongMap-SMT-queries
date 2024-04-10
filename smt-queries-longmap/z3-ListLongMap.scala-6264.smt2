; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80062 () Bool)

(assert start!80062)

(declare-fun b!941260 () Bool)

(declare-fun b_free!17907 () Bool)

(declare-fun b_next!17907 () Bool)

(assert (=> b!941260 (= b_free!17907 (not b_next!17907))))

(declare-fun tp!62199 () Bool)

(declare-fun b_and!29319 () Bool)

(assert (=> b!941260 (= tp!62199 b_and!29319)))

(declare-fun b!941257 () Bool)

(declare-fun res!632806 () Bool)

(declare-fun e!529154 () Bool)

(assert (=> b!941257 (=> (not res!632806) (not e!529154))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941257 (= res!632806 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941258 () Bool)

(declare-fun res!632803 () Bool)

(assert (=> b!941258 (=> (not res!632803) (not e!529154))))

(declare-datatypes ((V!32185 0))(
  ( (V!32186 (val!10258 Int)) )
))
(declare-datatypes ((ValueCell!9726 0))(
  ( (ValueCellFull!9726 (v!12789 V!32185)) (EmptyCell!9726) )
))
(declare-datatypes ((array!56780 0))(
  ( (array!56781 (arr!27324 (Array (_ BitVec 32) ValueCell!9726)) (size!27785 (_ BitVec 32))) )
))
(declare-datatypes ((array!56782 0))(
  ( (array!56783 (arr!27325 (Array (_ BitVec 32) (_ BitVec 64))) (size!27786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4602 0))(
  ( (LongMapFixedSize!4603 (defaultEntry!5592 Int) (mask!27153 (_ BitVec 32)) (extraKeys!5324 (_ BitVec 32)) (zeroValue!5428 V!32185) (minValue!5428 V!32185) (_size!2356 (_ BitVec 32)) (_keys!10443 array!56782) (_values!5615 array!56780) (_vacant!2356 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4602)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941258 (= res!632803 (validMask!0 (mask!27153 thiss!1141)))))

(declare-fun b!941259 () Bool)

(declare-fun e!529158 () Bool)

(declare-fun tp_is_empty!20415 () Bool)

(assert (=> b!941259 (= e!529158 tp_is_empty!20415)))

(declare-fun mapNonEmpty!32416 () Bool)

(declare-fun mapRes!32416 () Bool)

(declare-fun tp!62198 () Bool)

(declare-fun e!529156 () Bool)

(assert (=> mapNonEmpty!32416 (= mapRes!32416 (and tp!62198 e!529156))))

(declare-fun mapRest!32416 () (Array (_ BitVec 32) ValueCell!9726))

(declare-fun mapKey!32416 () (_ BitVec 32))

(declare-fun mapValue!32416 () ValueCell!9726)

(assert (=> mapNonEmpty!32416 (= (arr!27324 (_values!5615 thiss!1141)) (store mapRest!32416 mapKey!32416 mapValue!32416))))

(declare-fun e!529157 () Bool)

(declare-fun e!529155 () Bool)

(declare-fun array_inv!21234 (array!56782) Bool)

(declare-fun array_inv!21235 (array!56780) Bool)

(assert (=> b!941260 (= e!529155 (and tp!62199 tp_is_empty!20415 (array_inv!21234 (_keys!10443 thiss!1141)) (array_inv!21235 (_values!5615 thiss!1141)) e!529157))))

(declare-fun b!941261 () Bool)

(assert (=> b!941261 (= e!529156 tp_is_empty!20415)))

(declare-fun res!632805 () Bool)

(assert (=> start!80062 (=> (not res!632805) (not e!529154))))

(declare-fun valid!1762 (LongMapFixedSize!4602) Bool)

(assert (=> start!80062 (= res!632805 (valid!1762 thiss!1141))))

(assert (=> start!80062 e!529154))

(assert (=> start!80062 e!529155))

(assert (=> start!80062 true))

(declare-fun b!941262 () Bool)

(assert (=> b!941262 (= e!529154 (not (= (size!27785 (_values!5615 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27153 thiss!1141)))))))

(declare-fun mapIsEmpty!32416 () Bool)

(assert (=> mapIsEmpty!32416 mapRes!32416))

(declare-fun b!941263 () Bool)

(assert (=> b!941263 (= e!529157 (and e!529158 mapRes!32416))))

(declare-fun condMapEmpty!32416 () Bool)

(declare-fun mapDefault!32416 () ValueCell!9726)

(assert (=> b!941263 (= condMapEmpty!32416 (= (arr!27324 (_values!5615 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9726)) mapDefault!32416)))))

(declare-fun b!941264 () Bool)

(declare-fun res!632804 () Bool)

(assert (=> b!941264 (=> (not res!632804) (not e!529154))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9020 0))(
  ( (MissingZero!9020 (index!38451 (_ BitVec 32))) (Found!9020 (index!38452 (_ BitVec 32))) (Intermediate!9020 (undefined!9832 Bool) (index!38453 (_ BitVec 32)) (x!80761 (_ BitVec 32))) (Undefined!9020) (MissingVacant!9020 (index!38454 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56782 (_ BitVec 32)) SeekEntryResult!9020)

(assert (=> b!941264 (= res!632804 (not ((_ is Found!9020) (seekEntry!0 key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))))

(assert (= (and start!80062 res!632805) b!941257))

(assert (= (and b!941257 res!632806) b!941264))

(assert (= (and b!941264 res!632804) b!941258))

(assert (= (and b!941258 res!632803) b!941262))

(assert (= (and b!941263 condMapEmpty!32416) mapIsEmpty!32416))

(assert (= (and b!941263 (not condMapEmpty!32416)) mapNonEmpty!32416))

(assert (= (and mapNonEmpty!32416 ((_ is ValueCellFull!9726) mapValue!32416)) b!941261))

(assert (= (and b!941263 ((_ is ValueCellFull!9726) mapDefault!32416)) b!941259))

(assert (= b!941260 b!941263))

(assert (= start!80062 b!941260))

(declare-fun m!876447 () Bool)

(assert (=> b!941264 m!876447))

(declare-fun m!876449 () Bool)

(assert (=> b!941258 m!876449))

(declare-fun m!876451 () Bool)

(assert (=> mapNonEmpty!32416 m!876451))

(declare-fun m!876453 () Bool)

(assert (=> b!941260 m!876453))

(declare-fun m!876455 () Bool)

(assert (=> b!941260 m!876455))

(declare-fun m!876457 () Bool)

(assert (=> start!80062 m!876457))

(check-sat b_and!29319 (not b!941258) tp_is_empty!20415 (not start!80062) (not b_next!17907) (not mapNonEmpty!32416) (not b!941264) (not b!941260))
(check-sat b_and!29319 (not b_next!17907))
(get-model)

(declare-fun d!114043 () Bool)

(assert (=> d!114043 (= (validMask!0 (mask!27153 thiss!1141)) (and (or (= (mask!27153 thiss!1141) #b00000000000000000000000000000111) (= (mask!27153 thiss!1141) #b00000000000000000000000000001111) (= (mask!27153 thiss!1141) #b00000000000000000000000000011111) (= (mask!27153 thiss!1141) #b00000000000000000000000000111111) (= (mask!27153 thiss!1141) #b00000000000000000000000001111111) (= (mask!27153 thiss!1141) #b00000000000000000000000011111111) (= (mask!27153 thiss!1141) #b00000000000000000000000111111111) (= (mask!27153 thiss!1141) #b00000000000000000000001111111111) (= (mask!27153 thiss!1141) #b00000000000000000000011111111111) (= (mask!27153 thiss!1141) #b00000000000000000000111111111111) (= (mask!27153 thiss!1141) #b00000000000000000001111111111111) (= (mask!27153 thiss!1141) #b00000000000000000011111111111111) (= (mask!27153 thiss!1141) #b00000000000000000111111111111111) (= (mask!27153 thiss!1141) #b00000000000000001111111111111111) (= (mask!27153 thiss!1141) #b00000000000000011111111111111111) (= (mask!27153 thiss!1141) #b00000000000000111111111111111111) (= (mask!27153 thiss!1141) #b00000000000001111111111111111111) (= (mask!27153 thiss!1141) #b00000000000011111111111111111111) (= (mask!27153 thiss!1141) #b00000000000111111111111111111111) (= (mask!27153 thiss!1141) #b00000000001111111111111111111111) (= (mask!27153 thiss!1141) #b00000000011111111111111111111111) (= (mask!27153 thiss!1141) #b00000000111111111111111111111111) (= (mask!27153 thiss!1141) #b00000001111111111111111111111111) (= (mask!27153 thiss!1141) #b00000011111111111111111111111111) (= (mask!27153 thiss!1141) #b00000111111111111111111111111111) (= (mask!27153 thiss!1141) #b00001111111111111111111111111111) (= (mask!27153 thiss!1141) #b00011111111111111111111111111111) (= (mask!27153 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27153 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941258 d!114043))

(declare-fun d!114045 () Bool)

(declare-fun res!632825 () Bool)

(declare-fun e!529180 () Bool)

(assert (=> d!114045 (=> (not res!632825) (not e!529180))))

(declare-fun simpleValid!340 (LongMapFixedSize!4602) Bool)

(assert (=> d!114045 (= res!632825 (simpleValid!340 thiss!1141))))

(assert (=> d!114045 (= (valid!1762 thiss!1141) e!529180)))

(declare-fun b!941295 () Bool)

(declare-fun res!632826 () Bool)

(assert (=> b!941295 (=> (not res!632826) (not e!529180))))

(declare-fun arrayCountValidKeys!0 (array!56782 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941295 (= res!632826 (= (arrayCountValidKeys!0 (_keys!10443 thiss!1141) #b00000000000000000000000000000000 (size!27786 (_keys!10443 thiss!1141))) (_size!2356 thiss!1141)))))

(declare-fun b!941296 () Bool)

(declare-fun res!632827 () Bool)

(assert (=> b!941296 (=> (not res!632827) (not e!529180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56782 (_ BitVec 32)) Bool)

(assert (=> b!941296 (= res!632827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))

(declare-fun b!941297 () Bool)

(declare-datatypes ((List!19205 0))(
  ( (Nil!19202) (Cons!19201 (h!20347 (_ BitVec 64)) (t!27520 List!19205)) )
))
(declare-fun arrayNoDuplicates!0 (array!56782 (_ BitVec 32) List!19205) Bool)

(assert (=> b!941297 (= e!529180 (arrayNoDuplicates!0 (_keys!10443 thiss!1141) #b00000000000000000000000000000000 Nil!19202))))

(assert (= (and d!114045 res!632825) b!941295))

(assert (= (and b!941295 res!632826) b!941296))

(assert (= (and b!941296 res!632827) b!941297))

(declare-fun m!876471 () Bool)

(assert (=> d!114045 m!876471))

(declare-fun m!876473 () Bool)

(assert (=> b!941295 m!876473))

(declare-fun m!876475 () Bool)

(assert (=> b!941296 m!876475))

(declare-fun m!876477 () Bool)

(assert (=> b!941297 m!876477))

(assert (=> start!80062 d!114045))

(declare-fun b!941310 () Bool)

(declare-fun e!529187 () SeekEntryResult!9020)

(declare-fun lt!424942 () SeekEntryResult!9020)

(assert (=> b!941310 (= e!529187 (MissingZero!9020 (index!38453 lt!424942)))))

(declare-fun b!941311 () Bool)

(declare-fun lt!424944 () SeekEntryResult!9020)

(assert (=> b!941311 (= e!529187 (ite ((_ is MissingVacant!9020) lt!424944) (MissingZero!9020 (index!38454 lt!424944)) lt!424944))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56782 (_ BitVec 32)) SeekEntryResult!9020)

(assert (=> b!941311 (= lt!424944 (seekKeyOrZeroReturnVacant!0 (x!80761 lt!424942) (index!38453 lt!424942) (index!38453 lt!424942) key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))

(declare-fun b!941312 () Bool)

(declare-fun e!529188 () SeekEntryResult!9020)

(assert (=> b!941312 (= e!529188 (Found!9020 (index!38453 lt!424942)))))

(declare-fun d!114047 () Bool)

(declare-fun lt!424943 () SeekEntryResult!9020)

(assert (=> d!114047 (and (or ((_ is MissingVacant!9020) lt!424943) (not ((_ is Found!9020) lt!424943)) (and (bvsge (index!38452 lt!424943) #b00000000000000000000000000000000) (bvslt (index!38452 lt!424943) (size!27786 (_keys!10443 thiss!1141))))) (not ((_ is MissingVacant!9020) lt!424943)) (or (not ((_ is Found!9020) lt!424943)) (= (select (arr!27325 (_keys!10443 thiss!1141)) (index!38452 lt!424943)) key!756)))))

(declare-fun e!529189 () SeekEntryResult!9020)

(assert (=> d!114047 (= lt!424943 e!529189)))

(declare-fun c!98043 () Bool)

(assert (=> d!114047 (= c!98043 (and ((_ is Intermediate!9020) lt!424942) (undefined!9832 lt!424942)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56782 (_ BitVec 32)) SeekEntryResult!9020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114047 (= lt!424942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27153 thiss!1141)) key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))

(assert (=> d!114047 (validMask!0 (mask!27153 thiss!1141))))

(assert (=> d!114047 (= (seekEntry!0 key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)) lt!424943)))

(declare-fun b!941313 () Bool)

(assert (=> b!941313 (= e!529189 Undefined!9020)))

(declare-fun b!941314 () Bool)

(assert (=> b!941314 (= e!529189 e!529188)))

(declare-fun lt!424945 () (_ BitVec 64))

(assert (=> b!941314 (= lt!424945 (select (arr!27325 (_keys!10443 thiss!1141)) (index!38453 lt!424942)))))

(declare-fun c!98044 () Bool)

(assert (=> b!941314 (= c!98044 (= lt!424945 key!756))))

(declare-fun b!941315 () Bool)

(declare-fun c!98042 () Bool)

(assert (=> b!941315 (= c!98042 (= lt!424945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941315 (= e!529188 e!529187)))

(assert (= (and d!114047 c!98043) b!941313))

(assert (= (and d!114047 (not c!98043)) b!941314))

(assert (= (and b!941314 c!98044) b!941312))

(assert (= (and b!941314 (not c!98044)) b!941315))

(assert (= (and b!941315 c!98042) b!941310))

(assert (= (and b!941315 (not c!98042)) b!941311))

(declare-fun m!876479 () Bool)

(assert (=> b!941311 m!876479))

(declare-fun m!876481 () Bool)

(assert (=> d!114047 m!876481))

(declare-fun m!876483 () Bool)

(assert (=> d!114047 m!876483))

(assert (=> d!114047 m!876483))

(declare-fun m!876485 () Bool)

(assert (=> d!114047 m!876485))

(assert (=> d!114047 m!876449))

(declare-fun m!876487 () Bool)

(assert (=> b!941314 m!876487))

(assert (=> b!941264 d!114047))

(declare-fun d!114049 () Bool)

(assert (=> d!114049 (= (array_inv!21234 (_keys!10443 thiss!1141)) (bvsge (size!27786 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941260 d!114049))

(declare-fun d!114051 () Bool)

(assert (=> d!114051 (= (array_inv!21235 (_values!5615 thiss!1141)) (bvsge (size!27785 (_values!5615 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941260 d!114051))

(declare-fun b!941323 () Bool)

(declare-fun e!529194 () Bool)

(assert (=> b!941323 (= e!529194 tp_is_empty!20415)))

(declare-fun mapIsEmpty!32422 () Bool)

(declare-fun mapRes!32422 () Bool)

(assert (=> mapIsEmpty!32422 mapRes!32422))

(declare-fun condMapEmpty!32422 () Bool)

(declare-fun mapDefault!32422 () ValueCell!9726)

(assert (=> mapNonEmpty!32416 (= condMapEmpty!32422 (= mapRest!32416 ((as const (Array (_ BitVec 32) ValueCell!9726)) mapDefault!32422)))))

(assert (=> mapNonEmpty!32416 (= tp!62198 (and e!529194 mapRes!32422))))

(declare-fun b!941322 () Bool)

(declare-fun e!529195 () Bool)

(assert (=> b!941322 (= e!529195 tp_is_empty!20415)))

(declare-fun mapNonEmpty!32422 () Bool)

(declare-fun tp!62208 () Bool)

(assert (=> mapNonEmpty!32422 (= mapRes!32422 (and tp!62208 e!529195))))

(declare-fun mapRest!32422 () (Array (_ BitVec 32) ValueCell!9726))

(declare-fun mapKey!32422 () (_ BitVec 32))

(declare-fun mapValue!32422 () ValueCell!9726)

(assert (=> mapNonEmpty!32422 (= mapRest!32416 (store mapRest!32422 mapKey!32422 mapValue!32422))))

(assert (= (and mapNonEmpty!32416 condMapEmpty!32422) mapIsEmpty!32422))

(assert (= (and mapNonEmpty!32416 (not condMapEmpty!32422)) mapNonEmpty!32422))

(assert (= (and mapNonEmpty!32422 ((_ is ValueCellFull!9726) mapValue!32422)) b!941322))

(assert (= (and mapNonEmpty!32416 ((_ is ValueCellFull!9726) mapDefault!32422)) b!941323))

(declare-fun m!876489 () Bool)

(assert (=> mapNonEmpty!32422 m!876489))

(check-sat tp_is_empty!20415 (not b!941297) (not b_next!17907) (not b!941311) (not b!941295) (not d!114047) (not d!114045) b_and!29319 (not b!941296) (not mapNonEmpty!32422))
(check-sat b_and!29319 (not b_next!17907))
(get-model)

(declare-fun d!114053 () Bool)

(declare-fun res!632838 () Bool)

(declare-fun e!529198 () Bool)

(assert (=> d!114053 (=> (not res!632838) (not e!529198))))

(assert (=> d!114053 (= res!632838 (validMask!0 (mask!27153 thiss!1141)))))

(assert (=> d!114053 (= (simpleValid!340 thiss!1141) e!529198)))

(declare-fun b!941333 () Bool)

(declare-fun res!632836 () Bool)

(assert (=> b!941333 (=> (not res!632836) (not e!529198))))

(declare-fun size!27789 (LongMapFixedSize!4602) (_ BitVec 32))

(assert (=> b!941333 (= res!632836 (bvsge (size!27789 thiss!1141) (_size!2356 thiss!1141)))))

(declare-fun b!941335 () Bool)

(assert (=> b!941335 (= e!529198 (and (bvsge (extraKeys!5324 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5324 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2356 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!941334 () Bool)

(declare-fun res!632839 () Bool)

(assert (=> b!941334 (=> (not res!632839) (not e!529198))))

(assert (=> b!941334 (= res!632839 (= (size!27789 thiss!1141) (bvadd (_size!2356 thiss!1141) (bvsdiv (bvadd (extraKeys!5324 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!941332 () Bool)

(declare-fun res!632837 () Bool)

(assert (=> b!941332 (=> (not res!632837) (not e!529198))))

(assert (=> b!941332 (= res!632837 (and (= (size!27785 (_values!5615 thiss!1141)) (bvadd (mask!27153 thiss!1141) #b00000000000000000000000000000001)) (= (size!27786 (_keys!10443 thiss!1141)) (size!27785 (_values!5615 thiss!1141))) (bvsge (_size!2356 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2356 thiss!1141) (bvadd (mask!27153 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114053 res!632838) b!941332))

(assert (= (and b!941332 res!632837) b!941333))

(assert (= (and b!941333 res!632836) b!941334))

(assert (= (and b!941334 res!632839) b!941335))

(assert (=> d!114053 m!876449))

(declare-fun m!876491 () Bool)

(assert (=> b!941333 m!876491))

(assert (=> b!941334 m!876491))

(assert (=> d!114045 d!114053))

(declare-fun b!941344 () Bool)

(declare-fun e!529203 () (_ BitVec 32))

(assert (=> b!941344 (= e!529203 #b00000000000000000000000000000000)))

(declare-fun bm!40914 () Bool)

(declare-fun call!40917 () (_ BitVec 32))

(assert (=> bm!40914 (= call!40917 (arrayCountValidKeys!0 (_keys!10443 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27786 (_keys!10443 thiss!1141))))))

(declare-fun b!941345 () Bool)

(declare-fun e!529204 () (_ BitVec 32))

(assert (=> b!941345 (= e!529204 call!40917)))

(declare-fun b!941346 () Bool)

(assert (=> b!941346 (= e!529203 e!529204)))

(declare-fun c!98049 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941346 (= c!98049 (validKeyInArray!0 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114055 () Bool)

(declare-fun lt!424948 () (_ BitVec 32))

(assert (=> d!114055 (and (bvsge lt!424948 #b00000000000000000000000000000000) (bvsle lt!424948 (bvsub (size!27786 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114055 (= lt!424948 e!529203)))

(declare-fun c!98050 () Bool)

(assert (=> d!114055 (= c!98050 (bvsge #b00000000000000000000000000000000 (size!27786 (_keys!10443 thiss!1141))))))

(assert (=> d!114055 (and (bvsle #b00000000000000000000000000000000 (size!27786 (_keys!10443 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27786 (_keys!10443 thiss!1141)) (size!27786 (_keys!10443 thiss!1141))))))

(assert (=> d!114055 (= (arrayCountValidKeys!0 (_keys!10443 thiss!1141) #b00000000000000000000000000000000 (size!27786 (_keys!10443 thiss!1141))) lt!424948)))

(declare-fun b!941347 () Bool)

(assert (=> b!941347 (= e!529204 (bvadd #b00000000000000000000000000000001 call!40917))))

(assert (= (and d!114055 c!98050) b!941344))

(assert (= (and d!114055 (not c!98050)) b!941346))

(assert (= (and b!941346 c!98049) b!941347))

(assert (= (and b!941346 (not c!98049)) b!941345))

(assert (= (or b!941347 b!941345) bm!40914))

(declare-fun m!876493 () Bool)

(assert (=> bm!40914 m!876493))

(declare-fun m!876495 () Bool)

(assert (=> b!941346 m!876495))

(assert (=> b!941346 m!876495))

(declare-fun m!876497 () Bool)

(assert (=> b!941346 m!876497))

(assert (=> b!941295 d!114055))

(declare-fun d!114057 () Bool)

(declare-fun res!632845 () Bool)

(declare-fun e!529211 () Bool)

(assert (=> d!114057 (=> res!632845 e!529211)))

(assert (=> d!114057 (= res!632845 (bvsge #b00000000000000000000000000000000 (size!27786 (_keys!10443 thiss!1141))))))

(assert (=> d!114057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)) e!529211)))

(declare-fun b!941356 () Bool)

(declare-fun e!529213 () Bool)

(declare-fun e!529212 () Bool)

(assert (=> b!941356 (= e!529213 e!529212)))

(declare-fun lt!424957 () (_ BitVec 64))

(assert (=> b!941356 (= lt!424957 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31800 0))(
  ( (Unit!31801) )
))
(declare-fun lt!424955 () Unit!31800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56782 (_ BitVec 64) (_ BitVec 32)) Unit!31800)

(assert (=> b!941356 (= lt!424955 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10443 thiss!1141) lt!424957 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941356 (arrayContainsKey!0 (_keys!10443 thiss!1141) lt!424957 #b00000000000000000000000000000000)))

(declare-fun lt!424956 () Unit!31800)

(assert (=> b!941356 (= lt!424956 lt!424955)))

(declare-fun res!632844 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56782 (_ BitVec 32)) SeekEntryResult!9020)

(assert (=> b!941356 (= res!632844 (= (seekEntryOrOpen!0 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000) (_keys!10443 thiss!1141) (mask!27153 thiss!1141)) (Found!9020 #b00000000000000000000000000000000)))))

(assert (=> b!941356 (=> (not res!632844) (not e!529212))))

(declare-fun bm!40917 () Bool)

(declare-fun call!40920 () Bool)

(assert (=> bm!40917 (= call!40920 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))

(declare-fun b!941357 () Bool)

(assert (=> b!941357 (= e!529211 e!529213)))

(declare-fun c!98053 () Bool)

(assert (=> b!941357 (= c!98053 (validKeyInArray!0 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941358 () Bool)

(assert (=> b!941358 (= e!529212 call!40920)))

(declare-fun b!941359 () Bool)

(assert (=> b!941359 (= e!529213 call!40920)))

(assert (= (and d!114057 (not res!632845)) b!941357))

(assert (= (and b!941357 c!98053) b!941356))

(assert (= (and b!941357 (not c!98053)) b!941359))

(assert (= (and b!941356 res!632844) b!941358))

(assert (= (or b!941358 b!941359) bm!40917))

(assert (=> b!941356 m!876495))

(declare-fun m!876499 () Bool)

(assert (=> b!941356 m!876499))

(declare-fun m!876501 () Bool)

(assert (=> b!941356 m!876501))

(assert (=> b!941356 m!876495))

(declare-fun m!876503 () Bool)

(assert (=> b!941356 m!876503))

(declare-fun m!876505 () Bool)

(assert (=> bm!40917 m!876505))

(assert (=> b!941357 m!876495))

(assert (=> b!941357 m!876495))

(assert (=> b!941357 m!876497))

(assert (=> b!941296 d!114057))

(declare-fun b!941378 () Bool)

(declare-fun e!529225 () SeekEntryResult!9020)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941378 (= e!529225 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27153 thiss!1141)) #b00000000000000000000000000000000 (mask!27153 thiss!1141)) key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))

(declare-fun d!114059 () Bool)

(declare-fun e!529227 () Bool)

(assert (=> d!114059 e!529227))

(declare-fun c!98060 () Bool)

(declare-fun lt!424962 () SeekEntryResult!9020)

(assert (=> d!114059 (= c!98060 (and ((_ is Intermediate!9020) lt!424962) (undefined!9832 lt!424962)))))

(declare-fun e!529226 () SeekEntryResult!9020)

(assert (=> d!114059 (= lt!424962 e!529226)))

(declare-fun c!98062 () Bool)

(assert (=> d!114059 (= c!98062 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!424963 () (_ BitVec 64))

(assert (=> d!114059 (= lt!424963 (select (arr!27325 (_keys!10443 thiss!1141)) (toIndex!0 key!756 (mask!27153 thiss!1141))))))

(assert (=> d!114059 (validMask!0 (mask!27153 thiss!1141))))

(assert (=> d!114059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27153 thiss!1141)) key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)) lt!424962)))

(declare-fun b!941379 () Bool)

(assert (=> b!941379 (and (bvsge (index!38453 lt!424962) #b00000000000000000000000000000000) (bvslt (index!38453 lt!424962) (size!27786 (_keys!10443 thiss!1141))))))

(declare-fun res!632852 () Bool)

(assert (=> b!941379 (= res!632852 (= (select (arr!27325 (_keys!10443 thiss!1141)) (index!38453 lt!424962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529228 () Bool)

(assert (=> b!941379 (=> res!632852 e!529228)))

(declare-fun b!941380 () Bool)

(assert (=> b!941380 (= e!529225 (Intermediate!9020 false (toIndex!0 key!756 (mask!27153 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941381 () Bool)

(assert (=> b!941381 (and (bvsge (index!38453 lt!424962) #b00000000000000000000000000000000) (bvslt (index!38453 lt!424962) (size!27786 (_keys!10443 thiss!1141))))))

(declare-fun res!632854 () Bool)

(assert (=> b!941381 (= res!632854 (= (select (arr!27325 (_keys!10443 thiss!1141)) (index!38453 lt!424962)) key!756))))

(assert (=> b!941381 (=> res!632854 e!529228)))

(declare-fun e!529224 () Bool)

(assert (=> b!941381 (= e!529224 e!529228)))

(declare-fun b!941382 () Bool)

(assert (=> b!941382 (= e!529227 (bvsge (x!80761 lt!424962) #b01111111111111111111111111111110))))

(declare-fun b!941383 () Bool)

(assert (=> b!941383 (= e!529226 (Intermediate!9020 true (toIndex!0 key!756 (mask!27153 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941384 () Bool)

(assert (=> b!941384 (= e!529227 e!529224)))

(declare-fun res!632853 () Bool)

(assert (=> b!941384 (= res!632853 (and ((_ is Intermediate!9020) lt!424962) (not (undefined!9832 lt!424962)) (bvslt (x!80761 lt!424962) #b01111111111111111111111111111110) (bvsge (x!80761 lt!424962) #b00000000000000000000000000000000) (bvsge (x!80761 lt!424962) #b00000000000000000000000000000000)))))

(assert (=> b!941384 (=> (not res!632853) (not e!529224))))

(declare-fun b!941385 () Bool)

(assert (=> b!941385 (= e!529226 e!529225)))

(declare-fun c!98061 () Bool)

(assert (=> b!941385 (= c!98061 (or (= lt!424963 key!756) (= (bvadd lt!424963 lt!424963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941386 () Bool)

(assert (=> b!941386 (and (bvsge (index!38453 lt!424962) #b00000000000000000000000000000000) (bvslt (index!38453 lt!424962) (size!27786 (_keys!10443 thiss!1141))))))

(assert (=> b!941386 (= e!529228 (= (select (arr!27325 (_keys!10443 thiss!1141)) (index!38453 lt!424962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!114059 c!98062) b!941383))

(assert (= (and d!114059 (not c!98062)) b!941385))

(assert (= (and b!941385 c!98061) b!941380))

(assert (= (and b!941385 (not c!98061)) b!941378))

(assert (= (and d!114059 c!98060) b!941382))

(assert (= (and d!114059 (not c!98060)) b!941384))

(assert (= (and b!941384 res!632853) b!941381))

(assert (= (and b!941381 (not res!632854)) b!941379))

(assert (= (and b!941379 (not res!632852)) b!941386))

(declare-fun m!876507 () Bool)

(assert (=> b!941381 m!876507))

(assert (=> b!941379 m!876507))

(assert (=> d!114059 m!876483))

(declare-fun m!876509 () Bool)

(assert (=> d!114059 m!876509))

(assert (=> d!114059 m!876449))

(assert (=> b!941386 m!876507))

(assert (=> b!941378 m!876483))

(declare-fun m!876511 () Bool)

(assert (=> b!941378 m!876511))

(assert (=> b!941378 m!876511))

(declare-fun m!876513 () Bool)

(assert (=> b!941378 m!876513))

(assert (=> d!114047 d!114059))

(declare-fun d!114061 () Bool)

(declare-fun lt!424969 () (_ BitVec 32))

(declare-fun lt!424968 () (_ BitVec 32))

(assert (=> d!114061 (= lt!424969 (bvmul (bvxor lt!424968 (bvlshr lt!424968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114061 (= lt!424968 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114061 (and (bvsge (mask!27153 thiss!1141) #b00000000000000000000000000000000) (let ((res!632855 (let ((h!20348 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80778 (bvmul (bvxor h!20348 (bvlshr h!20348 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80778 (bvlshr x!80778 #b00000000000000000000000000001101)) (mask!27153 thiss!1141)))))) (and (bvslt res!632855 (bvadd (mask!27153 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!632855 #b00000000000000000000000000000000))))))

(assert (=> d!114061 (= (toIndex!0 key!756 (mask!27153 thiss!1141)) (bvand (bvxor lt!424969 (bvlshr lt!424969 #b00000000000000000000000000001101)) (mask!27153 thiss!1141)))))

(assert (=> d!114047 d!114061))

(assert (=> d!114047 d!114043))

(declare-fun b!941397 () Bool)

(declare-fun e!529237 () Bool)

(declare-fun e!529240 () Bool)

(assert (=> b!941397 (= e!529237 e!529240)))

(declare-fun c!98065 () Bool)

(assert (=> b!941397 (= c!98065 (validKeyInArray!0 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40920 () Bool)

(declare-fun call!40923 () Bool)

(assert (=> bm!40920 (= call!40923 (arrayNoDuplicates!0 (_keys!10443 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98065 (Cons!19201 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000) Nil!19202) Nil!19202)))))

(declare-fun b!941398 () Bool)

(declare-fun e!529239 () Bool)

(assert (=> b!941398 (= e!529239 e!529237)))

(declare-fun res!632862 () Bool)

(assert (=> b!941398 (=> (not res!632862) (not e!529237))))

(declare-fun e!529238 () Bool)

(assert (=> b!941398 (= res!632862 (not e!529238))))

(declare-fun res!632863 () Bool)

(assert (=> b!941398 (=> (not res!632863) (not e!529238))))

(assert (=> b!941398 (= res!632863 (validKeyInArray!0 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941399 () Bool)

(assert (=> b!941399 (= e!529240 call!40923)))

(declare-fun b!941400 () Bool)

(declare-fun contains!5131 (List!19205 (_ BitVec 64)) Bool)

(assert (=> b!941400 (= e!529238 (contains!5131 Nil!19202 (select (arr!27325 (_keys!10443 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941401 () Bool)

(assert (=> b!941401 (= e!529240 call!40923)))

(declare-fun d!114063 () Bool)

(declare-fun res!632864 () Bool)

(assert (=> d!114063 (=> res!632864 e!529239)))

(assert (=> d!114063 (= res!632864 (bvsge #b00000000000000000000000000000000 (size!27786 (_keys!10443 thiss!1141))))))

(assert (=> d!114063 (= (arrayNoDuplicates!0 (_keys!10443 thiss!1141) #b00000000000000000000000000000000 Nil!19202) e!529239)))

(assert (= (and d!114063 (not res!632864)) b!941398))

(assert (= (and b!941398 res!632863) b!941400))

(assert (= (and b!941398 res!632862) b!941397))

(assert (= (and b!941397 c!98065) b!941401))

(assert (= (and b!941397 (not c!98065)) b!941399))

(assert (= (or b!941401 b!941399) bm!40920))

(assert (=> b!941397 m!876495))

(assert (=> b!941397 m!876495))

(assert (=> b!941397 m!876497))

(assert (=> bm!40920 m!876495))

(declare-fun m!876515 () Bool)

(assert (=> bm!40920 m!876515))

(assert (=> b!941398 m!876495))

(assert (=> b!941398 m!876495))

(assert (=> b!941398 m!876497))

(assert (=> b!941400 m!876495))

(assert (=> b!941400 m!876495))

(declare-fun m!876517 () Bool)

(assert (=> b!941400 m!876517))

(assert (=> b!941297 d!114063))

(declare-fun lt!424974 () SeekEntryResult!9020)

(declare-fun d!114065 () Bool)

(assert (=> d!114065 (and (or ((_ is Undefined!9020) lt!424974) (not ((_ is Found!9020) lt!424974)) (and (bvsge (index!38452 lt!424974) #b00000000000000000000000000000000) (bvslt (index!38452 lt!424974) (size!27786 (_keys!10443 thiss!1141))))) (or ((_ is Undefined!9020) lt!424974) ((_ is Found!9020) lt!424974) (not ((_ is MissingVacant!9020) lt!424974)) (not (= (index!38454 lt!424974) (index!38453 lt!424942))) (and (bvsge (index!38454 lt!424974) #b00000000000000000000000000000000) (bvslt (index!38454 lt!424974) (size!27786 (_keys!10443 thiss!1141))))) (or ((_ is Undefined!9020) lt!424974) (ite ((_ is Found!9020) lt!424974) (= (select (arr!27325 (_keys!10443 thiss!1141)) (index!38452 lt!424974)) key!756) (and ((_ is MissingVacant!9020) lt!424974) (= (index!38454 lt!424974) (index!38453 lt!424942)) (= (select (arr!27325 (_keys!10443 thiss!1141)) (index!38454 lt!424974)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!529247 () SeekEntryResult!9020)

(assert (=> d!114065 (= lt!424974 e!529247)))

(declare-fun c!98074 () Bool)

(assert (=> d!114065 (= c!98074 (bvsge (x!80761 lt!424942) #b01111111111111111111111111111110))))

(declare-fun lt!424975 () (_ BitVec 64))

(assert (=> d!114065 (= lt!424975 (select (arr!27325 (_keys!10443 thiss!1141)) (index!38453 lt!424942)))))

(assert (=> d!114065 (validMask!0 (mask!27153 thiss!1141))))

(assert (=> d!114065 (= (seekKeyOrZeroReturnVacant!0 (x!80761 lt!424942) (index!38453 lt!424942) (index!38453 lt!424942) key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)) lt!424974)))

(declare-fun b!941414 () Bool)

(declare-fun e!529249 () SeekEntryResult!9020)

(assert (=> b!941414 (= e!529249 (MissingVacant!9020 (index!38453 lt!424942)))))

(declare-fun b!941415 () Bool)

(declare-fun c!98072 () Bool)

(assert (=> b!941415 (= c!98072 (= lt!424975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529248 () SeekEntryResult!9020)

(assert (=> b!941415 (= e!529248 e!529249)))

(declare-fun b!941416 () Bool)

(assert (=> b!941416 (= e!529247 e!529248)))

(declare-fun c!98073 () Bool)

(assert (=> b!941416 (= c!98073 (= lt!424975 key!756))))

(declare-fun b!941417 () Bool)

(assert (=> b!941417 (= e!529247 Undefined!9020)))

(declare-fun b!941418 () Bool)

(assert (=> b!941418 (= e!529248 (Found!9020 (index!38453 lt!424942)))))

(declare-fun b!941419 () Bool)

(assert (=> b!941419 (= e!529249 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80761 lt!424942) #b00000000000000000000000000000001) (nextIndex!0 (index!38453 lt!424942) (x!80761 lt!424942) (mask!27153 thiss!1141)) (index!38453 lt!424942) key!756 (_keys!10443 thiss!1141) (mask!27153 thiss!1141)))))

(assert (= (and d!114065 c!98074) b!941417))

(assert (= (and d!114065 (not c!98074)) b!941416))

(assert (= (and b!941416 c!98073) b!941418))

(assert (= (and b!941416 (not c!98073)) b!941415))

(assert (= (and b!941415 c!98072) b!941414))

(assert (= (and b!941415 (not c!98072)) b!941419))

(declare-fun m!876519 () Bool)

(assert (=> d!114065 m!876519))

(declare-fun m!876521 () Bool)

(assert (=> d!114065 m!876521))

(assert (=> d!114065 m!876487))

(assert (=> d!114065 m!876449))

(declare-fun m!876523 () Bool)

(assert (=> b!941419 m!876523))

(assert (=> b!941419 m!876523))

(declare-fun m!876525 () Bool)

(assert (=> b!941419 m!876525))

(assert (=> b!941311 d!114065))

(declare-fun b!941421 () Bool)

(declare-fun e!529250 () Bool)

(assert (=> b!941421 (= e!529250 tp_is_empty!20415)))

(declare-fun mapIsEmpty!32423 () Bool)

(declare-fun mapRes!32423 () Bool)

(assert (=> mapIsEmpty!32423 mapRes!32423))

(declare-fun condMapEmpty!32423 () Bool)

(declare-fun mapDefault!32423 () ValueCell!9726)

(assert (=> mapNonEmpty!32422 (= condMapEmpty!32423 (= mapRest!32422 ((as const (Array (_ BitVec 32) ValueCell!9726)) mapDefault!32423)))))

(assert (=> mapNonEmpty!32422 (= tp!62208 (and e!529250 mapRes!32423))))

(declare-fun b!941420 () Bool)

(declare-fun e!529251 () Bool)

(assert (=> b!941420 (= e!529251 tp_is_empty!20415)))

(declare-fun mapNonEmpty!32423 () Bool)

(declare-fun tp!62209 () Bool)

(assert (=> mapNonEmpty!32423 (= mapRes!32423 (and tp!62209 e!529251))))

(declare-fun mapValue!32423 () ValueCell!9726)

(declare-fun mapKey!32423 () (_ BitVec 32))

(declare-fun mapRest!32423 () (Array (_ BitVec 32) ValueCell!9726))

(assert (=> mapNonEmpty!32423 (= mapRest!32422 (store mapRest!32423 mapKey!32423 mapValue!32423))))

(assert (= (and mapNonEmpty!32422 condMapEmpty!32423) mapIsEmpty!32423))

(assert (= (and mapNonEmpty!32422 (not condMapEmpty!32423)) mapNonEmpty!32423))

(assert (= (and mapNonEmpty!32423 ((_ is ValueCellFull!9726) mapValue!32423)) b!941420))

(assert (= (and mapNonEmpty!32422 ((_ is ValueCellFull!9726) mapDefault!32423)) b!941421))

(declare-fun m!876527 () Bool)

(assert (=> mapNonEmpty!32423 m!876527))

(check-sat (not b_next!17907) (not b!941334) (not b!941398) (not bm!40917) b_and!29319 (not b!941356) (not b!941419) (not b!941333) tp_is_empty!20415 (not b!941400) (not d!114059) (not bm!40914) (not b!941397) (not b!941378) (not d!114065) (not b!941346) (not mapNonEmpty!32423) (not d!114053) (not bm!40920) (not b!941357))
(check-sat b_and!29319 (not b_next!17907))
