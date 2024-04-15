; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80216 () Bool)

(assert start!80216)

(declare-fun b!942214 () Bool)

(declare-fun b_free!17947 () Bool)

(declare-fun b_next!17947 () Bool)

(assert (=> b!942214 (= b_free!17947 (not b_next!17947))))

(declare-fun tp!62345 () Bool)

(declare-fun b_and!29333 () Bool)

(assert (=> b!942214 (= tp!62345 b_and!29333)))

(declare-fun b!942207 () Bool)

(declare-fun res!633204 () Bool)

(declare-fun e!529751 () Bool)

(assert (=> b!942207 (=> (not res!633204) (not e!529751))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32239 0))(
  ( (V!32240 (val!10278 Int)) )
))
(declare-datatypes ((ValueCell!9746 0))(
  ( (ValueCellFull!9746 (v!12808 V!32239)) (EmptyCell!9746) )
))
(declare-datatypes ((array!56839 0))(
  ( (array!56840 (arr!27347 (Array (_ BitVec 32) ValueCell!9746)) (size!27814 (_ BitVec 32))) )
))
(declare-datatypes ((array!56841 0))(
  ( (array!56842 (arr!27348 (Array (_ BitVec 32) (_ BitVec 64))) (size!27815 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4642 0))(
  ( (LongMapFixedSize!4643 (defaultEntry!5612 Int) (mask!27212 (_ BitVec 32)) (extraKeys!5344 (_ BitVec 32)) (zeroValue!5448 V!32239) (minValue!5448 V!32239) (_size!2376 (_ BitVec 32)) (_keys!10479 array!56841) (_values!5635 array!56839) (_vacant!2376 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4642)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9032 0))(
  ( (MissingZero!9032 (index!38499 (_ BitVec 32))) (Found!9032 (index!38500 (_ BitVec 32))) (Intermediate!9032 (undefined!9844 Bool) (index!38501 (_ BitVec 32)) (x!80916 (_ BitVec 32))) (Undefined!9032) (MissingVacant!9032 (index!38502 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56841 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!942207 (= res!633204 (not ((_ is Found!9032) (seekEntry!0 key!756 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)))))))

(declare-fun b!942208 () Bool)

(declare-fun res!633200 () Bool)

(assert (=> b!942208 (=> (not res!633200) (not e!529751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56841 (_ BitVec 32)) Bool)

(assert (=> b!942208 (= res!633200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942209 () Bool)

(declare-fun res!633202 () Bool)

(assert (=> b!942209 (=> (not res!633202) (not e!529751))))

(declare-datatypes ((List!19223 0))(
  ( (Nil!19220) (Cons!19219 (h!20369 (_ BitVec 64)) (t!27529 List!19223)) )
))
(declare-fun arrayNoDuplicates!0 (array!56841 (_ BitVec 32) List!19223) Bool)

(assert (=> b!942209 (= res!633202 (arrayNoDuplicates!0 (_keys!10479 thiss!1141) #b00000000000000000000000000000000 Nil!19220))))

(declare-fun b!942211 () Bool)

(declare-fun res!633201 () Bool)

(assert (=> b!942211 (=> (not res!633201) (not e!529751))))

(assert (=> b!942211 (= res!633201 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32501 () Bool)

(declare-fun mapRes!32501 () Bool)

(declare-fun tp!62344 () Bool)

(declare-fun e!529746 () Bool)

(assert (=> mapNonEmpty!32501 (= mapRes!32501 (and tp!62344 e!529746))))

(declare-fun mapValue!32501 () ValueCell!9746)

(declare-fun mapRest!32501 () (Array (_ BitVec 32) ValueCell!9746))

(declare-fun mapKey!32501 () (_ BitVec 32))

(assert (=> mapNonEmpty!32501 (= (arr!27347 (_values!5635 thiss!1141)) (store mapRest!32501 mapKey!32501 mapValue!32501))))

(declare-fun b!942212 () Bool)

(assert (=> b!942212 (= e!529751 (bvsgt #b00000000000000000000000000000000 (size!27815 (_keys!10479 thiss!1141))))))

(declare-fun b!942213 () Bool)

(declare-fun e!529750 () Bool)

(declare-fun tp_is_empty!20455 () Bool)

(assert (=> b!942213 (= e!529750 tp_is_empty!20455)))

(declare-fun e!529748 () Bool)

(declare-fun e!529749 () Bool)

(declare-fun array_inv!21316 (array!56841) Bool)

(declare-fun array_inv!21317 (array!56839) Bool)

(assert (=> b!942214 (= e!529748 (and tp!62345 tp_is_empty!20455 (array_inv!21316 (_keys!10479 thiss!1141)) (array_inv!21317 (_values!5635 thiss!1141)) e!529749))))

(declare-fun mapIsEmpty!32501 () Bool)

(assert (=> mapIsEmpty!32501 mapRes!32501))

(declare-fun b!942215 () Bool)

(declare-fun res!633199 () Bool)

(assert (=> b!942215 (=> (not res!633199) (not e!529751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942215 (= res!633199 (validMask!0 (mask!27212 thiss!1141)))))

(declare-fun b!942210 () Bool)

(declare-fun res!633203 () Bool)

(assert (=> b!942210 (=> (not res!633203) (not e!529751))))

(assert (=> b!942210 (= res!633203 (and (= (size!27814 (_values!5635 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27212 thiss!1141))) (= (size!27815 (_keys!10479 thiss!1141)) (size!27814 (_values!5635 thiss!1141))) (bvsge (mask!27212 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5344 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5344 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!633198 () Bool)

(assert (=> start!80216 (=> (not res!633198) (not e!529751))))

(declare-fun valid!1786 (LongMapFixedSize!4642) Bool)

(assert (=> start!80216 (= res!633198 (valid!1786 thiss!1141))))

(assert (=> start!80216 e!529751))

(assert (=> start!80216 e!529748))

(assert (=> start!80216 true))

(declare-fun b!942216 () Bool)

(assert (=> b!942216 (= e!529746 tp_is_empty!20455)))

(declare-fun b!942217 () Bool)

(assert (=> b!942217 (= e!529749 (and e!529750 mapRes!32501))))

(declare-fun condMapEmpty!32501 () Bool)

(declare-fun mapDefault!32501 () ValueCell!9746)

(assert (=> b!942217 (= condMapEmpty!32501 (= (arr!27347 (_values!5635 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9746)) mapDefault!32501)))))

(assert (= (and start!80216 res!633198) b!942211))

(assert (= (and b!942211 res!633201) b!942207))

(assert (= (and b!942207 res!633204) b!942215))

(assert (= (and b!942215 res!633199) b!942210))

(assert (= (and b!942210 res!633203) b!942208))

(assert (= (and b!942208 res!633200) b!942209))

(assert (= (and b!942209 res!633202) b!942212))

(assert (= (and b!942217 condMapEmpty!32501) mapIsEmpty!32501))

(assert (= (and b!942217 (not condMapEmpty!32501)) mapNonEmpty!32501))

(assert (= (and mapNonEmpty!32501 ((_ is ValueCellFull!9746) mapValue!32501)) b!942216))

(assert (= (and b!942217 ((_ is ValueCellFull!9746) mapDefault!32501)) b!942213))

(assert (= b!942214 b!942217))

(assert (= start!80216 b!942214))

(declare-fun m!876261 () Bool)

(assert (=> b!942207 m!876261))

(declare-fun m!876263 () Bool)

(assert (=> b!942215 m!876263))

(declare-fun m!876265 () Bool)

(assert (=> b!942209 m!876265))

(declare-fun m!876267 () Bool)

(assert (=> b!942214 m!876267))

(declare-fun m!876269 () Bool)

(assert (=> b!942214 m!876269))

(declare-fun m!876271 () Bool)

(assert (=> b!942208 m!876271))

(declare-fun m!876273 () Bool)

(assert (=> mapNonEmpty!32501 m!876273))

(declare-fun m!876275 () Bool)

(assert (=> start!80216 m!876275))

(check-sat tp_is_empty!20455 (not b!942214) (not b!942215) (not b!942209) (not mapNonEmpty!32501) (not b!942207) (not b_next!17947) (not b!942208) (not start!80216) b_and!29333)
(check-sat b_and!29333 (not b_next!17947))
(get-model)

(declare-fun d!113991 () Bool)

(assert (=> d!113991 (= (array_inv!21316 (_keys!10479 thiss!1141)) (bvsge (size!27815 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942214 d!113991))

(declare-fun d!113993 () Bool)

(assert (=> d!113993 (= (array_inv!21317 (_values!5635 thiss!1141)) (bvsge (size!27814 (_values!5635 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942214 d!113993))

(declare-fun b!942294 () Bool)

(declare-fun e!529796 () Bool)

(declare-fun call!40936 () Bool)

(assert (=> b!942294 (= e!529796 call!40936)))

(declare-fun b!942295 () Bool)

(declare-fun e!529799 () Bool)

(assert (=> b!942295 (= e!529799 e!529796)))

(declare-fun c!98165 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942295 (= c!98165 (validKeyInArray!0 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942296 () Bool)

(declare-fun e!529797 () Bool)

(assert (=> b!942296 (= e!529797 e!529799)))

(declare-fun res!633254 () Bool)

(assert (=> b!942296 (=> (not res!633254) (not e!529799))))

(declare-fun e!529798 () Bool)

(assert (=> b!942296 (= res!633254 (not e!529798))))

(declare-fun res!633253 () Bool)

(assert (=> b!942296 (=> (not res!633253) (not e!529798))))

(assert (=> b!942296 (= res!633253 (validKeyInArray!0 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40933 () Bool)

(assert (=> bm!40933 (= call!40936 (arrayNoDuplicates!0 (_keys!10479 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98165 (Cons!19219 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000) Nil!19220) Nil!19220)))))

(declare-fun b!942298 () Bool)

(declare-fun contains!5099 (List!19223 (_ BitVec 64)) Bool)

(assert (=> b!942298 (= e!529798 (contains!5099 Nil!19220 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942297 () Bool)

(assert (=> b!942297 (= e!529796 call!40936)))

(declare-fun d!113995 () Bool)

(declare-fun res!633255 () Bool)

(assert (=> d!113995 (=> res!633255 e!529797)))

(assert (=> d!113995 (= res!633255 (bvsge #b00000000000000000000000000000000 (size!27815 (_keys!10479 thiss!1141))))))

(assert (=> d!113995 (= (arrayNoDuplicates!0 (_keys!10479 thiss!1141) #b00000000000000000000000000000000 Nil!19220) e!529797)))

(assert (= (and d!113995 (not res!633255)) b!942296))

(assert (= (and b!942296 res!633253) b!942298))

(assert (= (and b!942296 res!633254) b!942295))

(assert (= (and b!942295 c!98165) b!942294))

(assert (= (and b!942295 (not c!98165)) b!942297))

(assert (= (or b!942294 b!942297) bm!40933))

(declare-fun m!876309 () Bool)

(assert (=> b!942295 m!876309))

(assert (=> b!942295 m!876309))

(declare-fun m!876311 () Bool)

(assert (=> b!942295 m!876311))

(assert (=> b!942296 m!876309))

(assert (=> b!942296 m!876309))

(assert (=> b!942296 m!876311))

(assert (=> bm!40933 m!876309))

(declare-fun m!876313 () Bool)

(assert (=> bm!40933 m!876313))

(assert (=> b!942298 m!876309))

(assert (=> b!942298 m!876309))

(declare-fun m!876315 () Bool)

(assert (=> b!942298 m!876315))

(assert (=> b!942209 d!113995))

(declare-fun b!942311 () Bool)

(declare-fun e!529806 () SeekEntryResult!9032)

(assert (=> b!942311 (= e!529806 Undefined!9032)))

(declare-fun b!942312 () Bool)

(declare-fun e!529808 () SeekEntryResult!9032)

(declare-fun lt!424929 () SeekEntryResult!9032)

(assert (=> b!942312 (= e!529808 (MissingZero!9032 (index!38501 lt!424929)))))

(declare-fun b!942313 () Bool)

(declare-fun e!529807 () SeekEntryResult!9032)

(assert (=> b!942313 (= e!529806 e!529807)))

(declare-fun lt!424928 () (_ BitVec 64))

(assert (=> b!942313 (= lt!424928 (select (arr!27348 (_keys!10479 thiss!1141)) (index!38501 lt!424929)))))

(declare-fun c!98173 () Bool)

(assert (=> b!942313 (= c!98173 (= lt!424928 key!756))))

(declare-fun b!942314 () Bool)

(assert (=> b!942314 (= e!529807 (Found!9032 (index!38501 lt!424929)))))

(declare-fun d!113997 () Bool)

(declare-fun lt!424931 () SeekEntryResult!9032)

(assert (=> d!113997 (and (or ((_ is MissingVacant!9032) lt!424931) (not ((_ is Found!9032) lt!424931)) (and (bvsge (index!38500 lt!424931) #b00000000000000000000000000000000) (bvslt (index!38500 lt!424931) (size!27815 (_keys!10479 thiss!1141))))) (not ((_ is MissingVacant!9032) lt!424931)) (or (not ((_ is Found!9032) lt!424931)) (= (select (arr!27348 (_keys!10479 thiss!1141)) (index!38500 lt!424931)) key!756)))))

(assert (=> d!113997 (= lt!424931 e!529806)))

(declare-fun c!98172 () Bool)

(assert (=> d!113997 (= c!98172 (and ((_ is Intermediate!9032) lt!424929) (undefined!9844 lt!424929)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56841 (_ BitVec 32)) SeekEntryResult!9032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113997 (= lt!424929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27212 thiss!1141)) key!756 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)))))

(assert (=> d!113997 (validMask!0 (mask!27212 thiss!1141))))

(assert (=> d!113997 (= (seekEntry!0 key!756 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)) lt!424931)))

(declare-fun b!942315 () Bool)

(declare-fun lt!424930 () SeekEntryResult!9032)

(assert (=> b!942315 (= e!529808 (ite ((_ is MissingVacant!9032) lt!424930) (MissingZero!9032 (index!38502 lt!424930)) lt!424930))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56841 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!942315 (= lt!424930 (seekKeyOrZeroReturnVacant!0 (x!80916 lt!424929) (index!38501 lt!424929) (index!38501 lt!424929) key!756 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942316 () Bool)

(declare-fun c!98174 () Bool)

(assert (=> b!942316 (= c!98174 (= lt!424928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942316 (= e!529807 e!529808)))

(assert (= (and d!113997 c!98172) b!942311))

(assert (= (and d!113997 (not c!98172)) b!942313))

(assert (= (and b!942313 c!98173) b!942314))

(assert (= (and b!942313 (not c!98173)) b!942316))

(assert (= (and b!942316 c!98174) b!942312))

(assert (= (and b!942316 (not c!98174)) b!942315))

(declare-fun m!876317 () Bool)

(assert (=> b!942313 m!876317))

(declare-fun m!876319 () Bool)

(assert (=> d!113997 m!876319))

(declare-fun m!876321 () Bool)

(assert (=> d!113997 m!876321))

(assert (=> d!113997 m!876321))

(declare-fun m!876323 () Bool)

(assert (=> d!113997 m!876323))

(assert (=> d!113997 m!876263))

(declare-fun m!876325 () Bool)

(assert (=> b!942315 m!876325))

(assert (=> b!942207 d!113997))

(declare-fun d!113999 () Bool)

(declare-fun res!633260 () Bool)

(declare-fun e!529817 () Bool)

(assert (=> d!113999 (=> res!633260 e!529817)))

(assert (=> d!113999 (= res!633260 (bvsge #b00000000000000000000000000000000 (size!27815 (_keys!10479 thiss!1141))))))

(assert (=> d!113999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)) e!529817)))

(declare-fun bm!40936 () Bool)

(declare-fun call!40939 () Bool)

(assert (=> bm!40936 (= call!40939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10479 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942325 () Bool)

(declare-fun e!529816 () Bool)

(assert (=> b!942325 (= e!529817 e!529816)))

(declare-fun c!98177 () Bool)

(assert (=> b!942325 (= c!98177 (validKeyInArray!0 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942326 () Bool)

(declare-fun e!529815 () Bool)

(assert (=> b!942326 (= e!529815 call!40939)))

(declare-fun b!942327 () Bool)

(assert (=> b!942327 (= e!529816 call!40939)))

(declare-fun b!942328 () Bool)

(assert (=> b!942328 (= e!529816 e!529815)))

(declare-fun lt!424940 () (_ BitVec 64))

(assert (=> b!942328 (= lt!424940 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31697 0))(
  ( (Unit!31698) )
))
(declare-fun lt!424938 () Unit!31697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56841 (_ BitVec 64) (_ BitVec 32)) Unit!31697)

(assert (=> b!942328 (= lt!424938 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10479 thiss!1141) lt!424940 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942328 (arrayContainsKey!0 (_keys!10479 thiss!1141) lt!424940 #b00000000000000000000000000000000)))

(declare-fun lt!424939 () Unit!31697)

(assert (=> b!942328 (= lt!424939 lt!424938)))

(declare-fun res!633261 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56841 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!942328 (= res!633261 (= (seekEntryOrOpen!0 (select (arr!27348 (_keys!10479 thiss!1141)) #b00000000000000000000000000000000) (_keys!10479 thiss!1141) (mask!27212 thiss!1141)) (Found!9032 #b00000000000000000000000000000000)))))

(assert (=> b!942328 (=> (not res!633261) (not e!529815))))

(assert (= (and d!113999 (not res!633260)) b!942325))

(assert (= (and b!942325 c!98177) b!942328))

(assert (= (and b!942325 (not c!98177)) b!942327))

(assert (= (and b!942328 res!633261) b!942326))

(assert (= (or b!942326 b!942327) bm!40936))

(declare-fun m!876327 () Bool)

(assert (=> bm!40936 m!876327))

(assert (=> b!942325 m!876309))

(assert (=> b!942325 m!876309))

(assert (=> b!942325 m!876311))

(assert (=> b!942328 m!876309))

(declare-fun m!876329 () Bool)

(assert (=> b!942328 m!876329))

(declare-fun m!876331 () Bool)

(assert (=> b!942328 m!876331))

(assert (=> b!942328 m!876309))

(declare-fun m!876333 () Bool)

(assert (=> b!942328 m!876333))

(assert (=> b!942208 d!113999))

(declare-fun d!114001 () Bool)

(declare-fun res!633268 () Bool)

(declare-fun e!529820 () Bool)

(assert (=> d!114001 (=> (not res!633268) (not e!529820))))

(declare-fun simpleValid!347 (LongMapFixedSize!4642) Bool)

(assert (=> d!114001 (= res!633268 (simpleValid!347 thiss!1141))))

(assert (=> d!114001 (= (valid!1786 thiss!1141) e!529820)))

(declare-fun b!942335 () Bool)

(declare-fun res!633269 () Bool)

(assert (=> b!942335 (=> (not res!633269) (not e!529820))))

(declare-fun arrayCountValidKeys!0 (array!56841 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942335 (= res!633269 (= (arrayCountValidKeys!0 (_keys!10479 thiss!1141) #b00000000000000000000000000000000 (size!27815 (_keys!10479 thiss!1141))) (_size!2376 thiss!1141)))))

(declare-fun b!942336 () Bool)

(declare-fun res!633270 () Bool)

(assert (=> b!942336 (=> (not res!633270) (not e!529820))))

(assert (=> b!942336 (= res!633270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10479 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942337 () Bool)

(assert (=> b!942337 (= e!529820 (arrayNoDuplicates!0 (_keys!10479 thiss!1141) #b00000000000000000000000000000000 Nil!19220))))

(assert (= (and d!114001 res!633268) b!942335))

(assert (= (and b!942335 res!633269) b!942336))

(assert (= (and b!942336 res!633270) b!942337))

(declare-fun m!876335 () Bool)

(assert (=> d!114001 m!876335))

(declare-fun m!876337 () Bool)

(assert (=> b!942335 m!876337))

(assert (=> b!942336 m!876271))

(assert (=> b!942337 m!876265))

(assert (=> start!80216 d!114001))

(declare-fun d!114003 () Bool)

(assert (=> d!114003 (= (validMask!0 (mask!27212 thiss!1141)) (and (or (= (mask!27212 thiss!1141) #b00000000000000000000000000000111) (= (mask!27212 thiss!1141) #b00000000000000000000000000001111) (= (mask!27212 thiss!1141) #b00000000000000000000000000011111) (= (mask!27212 thiss!1141) #b00000000000000000000000000111111) (= (mask!27212 thiss!1141) #b00000000000000000000000001111111) (= (mask!27212 thiss!1141) #b00000000000000000000000011111111) (= (mask!27212 thiss!1141) #b00000000000000000000000111111111) (= (mask!27212 thiss!1141) #b00000000000000000000001111111111) (= (mask!27212 thiss!1141) #b00000000000000000000011111111111) (= (mask!27212 thiss!1141) #b00000000000000000000111111111111) (= (mask!27212 thiss!1141) #b00000000000000000001111111111111) (= (mask!27212 thiss!1141) #b00000000000000000011111111111111) (= (mask!27212 thiss!1141) #b00000000000000000111111111111111) (= (mask!27212 thiss!1141) #b00000000000000001111111111111111) (= (mask!27212 thiss!1141) #b00000000000000011111111111111111) (= (mask!27212 thiss!1141) #b00000000000000111111111111111111) (= (mask!27212 thiss!1141) #b00000000000001111111111111111111) (= (mask!27212 thiss!1141) #b00000000000011111111111111111111) (= (mask!27212 thiss!1141) #b00000000000111111111111111111111) (= (mask!27212 thiss!1141) #b00000000001111111111111111111111) (= (mask!27212 thiss!1141) #b00000000011111111111111111111111) (= (mask!27212 thiss!1141) #b00000000111111111111111111111111) (= (mask!27212 thiss!1141) #b00000001111111111111111111111111) (= (mask!27212 thiss!1141) #b00000011111111111111111111111111) (= (mask!27212 thiss!1141) #b00000111111111111111111111111111) (= (mask!27212 thiss!1141) #b00001111111111111111111111111111) (= (mask!27212 thiss!1141) #b00011111111111111111111111111111) (= (mask!27212 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27212 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942215 d!114003))

(declare-fun b!942344 () Bool)

(declare-fun e!529825 () Bool)

(assert (=> b!942344 (= e!529825 tp_is_empty!20455)))

(declare-fun b!942345 () Bool)

(declare-fun e!529826 () Bool)

(assert (=> b!942345 (= e!529826 tp_is_empty!20455)))

(declare-fun mapNonEmpty!32510 () Bool)

(declare-fun mapRes!32510 () Bool)

(declare-fun tp!62360 () Bool)

(assert (=> mapNonEmpty!32510 (= mapRes!32510 (and tp!62360 e!529825))))

(declare-fun mapValue!32510 () ValueCell!9746)

(declare-fun mapKey!32510 () (_ BitVec 32))

(declare-fun mapRest!32510 () (Array (_ BitVec 32) ValueCell!9746))

(assert (=> mapNonEmpty!32510 (= mapRest!32501 (store mapRest!32510 mapKey!32510 mapValue!32510))))

(declare-fun mapIsEmpty!32510 () Bool)

(assert (=> mapIsEmpty!32510 mapRes!32510))

(declare-fun condMapEmpty!32510 () Bool)

(declare-fun mapDefault!32510 () ValueCell!9746)

(assert (=> mapNonEmpty!32501 (= condMapEmpty!32510 (= mapRest!32501 ((as const (Array (_ BitVec 32) ValueCell!9746)) mapDefault!32510)))))

(assert (=> mapNonEmpty!32501 (= tp!62344 (and e!529826 mapRes!32510))))

(assert (= (and mapNonEmpty!32501 condMapEmpty!32510) mapIsEmpty!32510))

(assert (= (and mapNonEmpty!32501 (not condMapEmpty!32510)) mapNonEmpty!32510))

(assert (= (and mapNonEmpty!32510 ((_ is ValueCellFull!9746) mapValue!32510)) b!942344))

(assert (= (and mapNonEmpty!32501 ((_ is ValueCellFull!9746) mapDefault!32510)) b!942345))

(declare-fun m!876339 () Bool)

(assert (=> mapNonEmpty!32510 m!876339))

(check-sat (not b!942337) (not b!942328) (not b!942295) (not b_next!17947) (not d!113997) (not b!942315) (not b!942296) (not b!942298) (not b!942335) (not d!114001) tp_is_empty!20455 (not mapNonEmpty!32510) (not b!942336) (not bm!40933) b_and!29333 (not bm!40936) (not b!942325))
(check-sat b_and!29333 (not b_next!17947))
