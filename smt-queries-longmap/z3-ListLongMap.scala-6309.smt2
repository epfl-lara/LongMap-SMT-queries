; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80820 () Bool)

(assert start!80820)

(declare-fun b!947244 () Bool)

(declare-fun b_free!18175 () Bool)

(declare-fun b_next!18175 () Bool)

(assert (=> b!947244 (= b_free!18175 (not b_next!18175))))

(declare-fun tp!63087 () Bool)

(declare-fun b_and!29571 () Bool)

(assert (=> b!947244 (= tp!63087 b_and!29571)))

(declare-fun res!635761 () Bool)

(declare-fun e!533136 () Bool)

(assert (=> start!80820 (=> (not res!635761) (not e!533136))))

(declare-datatypes ((V!32543 0))(
  ( (V!32544 (val!10392 Int)) )
))
(declare-datatypes ((ValueCell!9860 0))(
  ( (ValueCellFull!9860 (v!12925 V!32543)) (EmptyCell!9860) )
))
(declare-datatypes ((array!57329 0))(
  ( (array!57330 (arr!27575 (Array (_ BitVec 32) ValueCell!9860)) (size!28050 (_ BitVec 32))) )
))
(declare-datatypes ((array!57331 0))(
  ( (array!57332 (arr!27576 (Array (_ BitVec 32) (_ BitVec 64))) (size!28051 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4870 0))(
  ( (LongMapFixedSize!4871 (defaultEntry!5732 Int) (mask!27465 (_ BitVec 32)) (extraKeys!5464 (_ BitVec 32)) (zeroValue!5568 V!32543) (minValue!5568 V!32543) (_size!2490 (_ BitVec 32)) (_keys!10638 array!57331) (_values!5755 array!57329) (_vacant!2490 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4870)

(declare-fun valid!1859 (LongMapFixedSize!4870) Bool)

(assert (=> start!80820 (= res!635761 (valid!1859 thiss!1141))))

(assert (=> start!80820 e!533136))

(declare-fun e!533132 () Bool)

(assert (=> start!80820 e!533132))

(assert (=> start!80820 true))

(declare-fun b!947236 () Bool)

(declare-fun res!635756 () Bool)

(declare-fun e!533135 () Bool)

(assert (=> b!947236 (=> res!635756 e!533135)))

(assert (=> b!947236 (= res!635756 (or (not (= (size!28050 (_values!5755 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27465 thiss!1141)))) (not (= (size!28051 (_keys!10638 thiss!1141)) (size!28050 (_values!5755 thiss!1141)))) (bvslt (mask!27465 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5464 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5464 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947237 () Bool)

(declare-fun e!533131 () Bool)

(declare-fun e!533134 () Bool)

(declare-fun mapRes!32902 () Bool)

(assert (=> b!947237 (= e!533131 (and e!533134 mapRes!32902))))

(declare-fun condMapEmpty!32902 () Bool)

(declare-fun mapDefault!32902 () ValueCell!9860)

(assert (=> b!947237 (= condMapEmpty!32902 (= (arr!27575 (_values!5755 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9860)) mapDefault!32902)))))

(declare-fun b!947238 () Bool)

(declare-fun e!533137 () Bool)

(declare-fun tp_is_empty!20683 () Bool)

(assert (=> b!947238 (= e!533137 tp_is_empty!20683)))

(declare-fun b!947239 () Bool)

(declare-fun res!635758 () Bool)

(assert (=> b!947239 (=> res!635758 e!533135)))

(declare-datatypes ((SeekEntryResult!9115 0))(
  ( (MissingZero!9115 (index!38831 (_ BitVec 32))) (Found!9115 (index!38832 (_ BitVec 32))) (Intermediate!9115 (undefined!9927 Bool) (index!38833 (_ BitVec 32)) (x!81510 (_ BitVec 32))) (Undefined!9115) (MissingVacant!9115 (index!38834 (_ BitVec 32))) )
))
(declare-fun lt!426352 () SeekEntryResult!9115)

(assert (=> b!947239 (= res!635758 (or (bvslt (index!38832 lt!426352) #b00000000000000000000000000000000) (bvsge (index!38832 lt!426352) (size!28051 (_keys!10638 thiss!1141)))))))

(declare-fun b!947240 () Bool)

(declare-fun e!533130 () Bool)

(assert (=> b!947240 (= e!533136 e!533130)))

(declare-fun res!635757 () Bool)

(assert (=> b!947240 (=> (not res!635757) (not e!533130))))

(get-info :version)

(assert (=> b!947240 (= res!635757 ((_ is Found!9115) lt!426352))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57331 (_ BitVec 32)) SeekEntryResult!9115)

(assert (=> b!947240 (= lt!426352 (seekEntry!0 key!756 (_keys!10638 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947241 () Bool)

(declare-fun res!635759 () Bool)

(assert (=> b!947241 (=> (not res!635759) (not e!533136))))

(assert (=> b!947241 (= res!635759 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947242 () Bool)

(declare-fun res!635762 () Bool)

(assert (=> b!947242 (=> res!635762 e!533135)))

(declare-datatypes ((List!19309 0))(
  ( (Nil!19306) (Cons!19305 (h!20461 (_ BitVec 64)) (t!27621 List!19309)) )
))
(declare-fun arrayNoDuplicates!0 (array!57331 (_ BitVec 32) List!19309) Bool)

(assert (=> b!947242 (= res!635762 (not (arrayNoDuplicates!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 Nil!19306)))))

(declare-fun mapNonEmpty!32902 () Bool)

(declare-fun tp!63088 () Bool)

(assert (=> mapNonEmpty!32902 (= mapRes!32902 (and tp!63088 e!533137))))

(declare-fun mapRest!32902 () (Array (_ BitVec 32) ValueCell!9860))

(declare-fun mapValue!32902 () ValueCell!9860)

(declare-fun mapKey!32902 () (_ BitVec 32))

(assert (=> mapNonEmpty!32902 (= (arr!27575 (_values!5755 thiss!1141)) (store mapRest!32902 mapKey!32902 mapValue!32902))))

(declare-fun b!947243 () Bool)

(assert (=> b!947243 (= e!533134 tp_is_empty!20683)))

(declare-fun array_inv!21464 (array!57331) Bool)

(declare-fun array_inv!21465 (array!57329) Bool)

(assert (=> b!947244 (= e!533132 (and tp!63087 tp_is_empty!20683 (array_inv!21464 (_keys!10638 thiss!1141)) (array_inv!21465 (_values!5755 thiss!1141)) e!533131))))

(declare-fun b!947245 () Bool)

(assert (=> b!947245 (= e!533130 (not e!533135))))

(declare-fun res!635760 () Bool)

(assert (=> b!947245 (=> res!635760 e!533135)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947245 (= res!635760 (not (validMask!0 (mask!27465 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947245 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31808 0))(
  ( (Unit!31809) )
))
(declare-fun lt!426351 () Unit!31808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57331 (_ BitVec 64) (_ BitVec 32)) Unit!31808)

(assert (=> b!947245 (= lt!426351 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10638 thiss!1141) key!756 (index!38832 lt!426352)))))

(declare-fun b!947246 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947246 (= e!533135 (validKeyInArray!0 (select (arr!27576 (_keys!10638 thiss!1141)) (index!38832 lt!426352))))))

(declare-fun mapIsEmpty!32902 () Bool)

(assert (=> mapIsEmpty!32902 mapRes!32902))

(declare-fun b!947247 () Bool)

(declare-fun res!635755 () Bool)

(assert (=> b!947247 (=> res!635755 e!533135)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57331 (_ BitVec 32)) Bool)

(assert (=> b!947247 (= res!635755 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10638 thiss!1141) (mask!27465 thiss!1141))))))

(assert (= (and start!80820 res!635761) b!947241))

(assert (= (and b!947241 res!635759) b!947240))

(assert (= (and b!947240 res!635757) b!947245))

(assert (= (and b!947245 (not res!635760)) b!947236))

(assert (= (and b!947236 (not res!635756)) b!947247))

(assert (= (and b!947247 (not res!635755)) b!947242))

(assert (= (and b!947242 (not res!635762)) b!947239))

(assert (= (and b!947239 (not res!635758)) b!947246))

(assert (= (and b!947237 condMapEmpty!32902) mapIsEmpty!32902))

(assert (= (and b!947237 (not condMapEmpty!32902)) mapNonEmpty!32902))

(assert (= (and mapNonEmpty!32902 ((_ is ValueCellFull!9860) mapValue!32902)) b!947238))

(assert (= (and b!947237 ((_ is ValueCellFull!9860) mapDefault!32902)) b!947243))

(assert (= b!947244 b!947237))

(assert (= start!80820 b!947244))

(declare-fun m!879649 () Bool)

(assert (=> b!947245 m!879649))

(declare-fun m!879651 () Bool)

(assert (=> b!947245 m!879651))

(declare-fun m!879653 () Bool)

(assert (=> b!947245 m!879653))

(declare-fun m!879655 () Bool)

(assert (=> start!80820 m!879655))

(declare-fun m!879657 () Bool)

(assert (=> b!947240 m!879657))

(declare-fun m!879659 () Bool)

(assert (=> b!947244 m!879659))

(declare-fun m!879661 () Bool)

(assert (=> b!947244 m!879661))

(declare-fun m!879663 () Bool)

(assert (=> mapNonEmpty!32902 m!879663))

(declare-fun m!879665 () Bool)

(assert (=> b!947246 m!879665))

(assert (=> b!947246 m!879665))

(declare-fun m!879667 () Bool)

(assert (=> b!947246 m!879667))

(declare-fun m!879669 () Bool)

(assert (=> b!947247 m!879669))

(declare-fun m!879671 () Bool)

(assert (=> b!947242 m!879671))

(check-sat (not b!947244) b_and!29571 (not b_next!18175) tp_is_empty!20683 (not b!947242) (not b!947245) (not b!947247) (not b!947246) (not mapNonEmpty!32902) (not start!80820) (not b!947240))
(check-sat b_and!29571 (not b_next!18175))
(get-model)

(declare-fun b!947330 () Bool)

(declare-fun e!533195 () Bool)

(declare-fun contains!5162 (List!19309 (_ BitVec 64)) Bool)

(assert (=> b!947330 (= e!533195 (contains!5162 Nil!19306 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947331 () Bool)

(declare-fun e!533194 () Bool)

(declare-fun e!533196 () Bool)

(assert (=> b!947331 (= e!533194 e!533196)))

(declare-fun res!635818 () Bool)

(assert (=> b!947331 (=> (not res!635818) (not e!533196))))

(assert (=> b!947331 (= res!635818 (not e!533195))))

(declare-fun res!635819 () Bool)

(assert (=> b!947331 (=> (not res!635819) (not e!533195))))

(assert (=> b!947331 (= res!635819 (validKeyInArray!0 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947332 () Bool)

(declare-fun e!533197 () Bool)

(assert (=> b!947332 (= e!533196 e!533197)))

(declare-fun c!98640 () Bool)

(assert (=> b!947332 (= c!98640 (validKeyInArray!0 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947333 () Bool)

(declare-fun call!41095 () Bool)

(assert (=> b!947333 (= e!533197 call!41095)))

(declare-fun bm!41092 () Bool)

(assert (=> bm!41092 (= call!41095 (arrayNoDuplicates!0 (_keys!10638 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98640 (Cons!19305 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000) Nil!19306) Nil!19306)))))

(declare-fun b!947334 () Bool)

(assert (=> b!947334 (= e!533197 call!41095)))

(declare-fun d!114491 () Bool)

(declare-fun res!635817 () Bool)

(assert (=> d!114491 (=> res!635817 e!533194)))

(assert (=> d!114491 (= res!635817 (bvsge #b00000000000000000000000000000000 (size!28051 (_keys!10638 thiss!1141))))))

(assert (=> d!114491 (= (arrayNoDuplicates!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 Nil!19306) e!533194)))

(assert (= (and d!114491 (not res!635817)) b!947331))

(assert (= (and b!947331 res!635819) b!947330))

(assert (= (and b!947331 res!635818) b!947332))

(assert (= (and b!947332 c!98640) b!947333))

(assert (= (and b!947332 (not c!98640)) b!947334))

(assert (= (or b!947333 b!947334) bm!41092))

(declare-fun m!879721 () Bool)

(assert (=> b!947330 m!879721))

(assert (=> b!947330 m!879721))

(declare-fun m!879723 () Bool)

(assert (=> b!947330 m!879723))

(assert (=> b!947331 m!879721))

(assert (=> b!947331 m!879721))

(declare-fun m!879725 () Bool)

(assert (=> b!947331 m!879725))

(assert (=> b!947332 m!879721))

(assert (=> b!947332 m!879721))

(assert (=> b!947332 m!879725))

(assert (=> bm!41092 m!879721))

(declare-fun m!879727 () Bool)

(assert (=> bm!41092 m!879727))

(assert (=> b!947242 d!114491))

(declare-fun d!114493 () Bool)

(assert (=> d!114493 (= (validKeyInArray!0 (select (arr!27576 (_keys!10638 thiss!1141)) (index!38832 lt!426352))) (and (not (= (select (arr!27576 (_keys!10638 thiss!1141)) (index!38832 lt!426352)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27576 (_keys!10638 thiss!1141)) (index!38832 lt!426352)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947246 d!114493))

(declare-fun d!114495 () Bool)

(assert (=> d!114495 (= (validMask!0 (mask!27465 thiss!1141)) (and (or (= (mask!27465 thiss!1141) #b00000000000000000000000000000111) (= (mask!27465 thiss!1141) #b00000000000000000000000000001111) (= (mask!27465 thiss!1141) #b00000000000000000000000000011111) (= (mask!27465 thiss!1141) #b00000000000000000000000000111111) (= (mask!27465 thiss!1141) #b00000000000000000000000001111111) (= (mask!27465 thiss!1141) #b00000000000000000000000011111111) (= (mask!27465 thiss!1141) #b00000000000000000000000111111111) (= (mask!27465 thiss!1141) #b00000000000000000000001111111111) (= (mask!27465 thiss!1141) #b00000000000000000000011111111111) (= (mask!27465 thiss!1141) #b00000000000000000000111111111111) (= (mask!27465 thiss!1141) #b00000000000000000001111111111111) (= (mask!27465 thiss!1141) #b00000000000000000011111111111111) (= (mask!27465 thiss!1141) #b00000000000000000111111111111111) (= (mask!27465 thiss!1141) #b00000000000000001111111111111111) (= (mask!27465 thiss!1141) #b00000000000000011111111111111111) (= (mask!27465 thiss!1141) #b00000000000000111111111111111111) (= (mask!27465 thiss!1141) #b00000000000001111111111111111111) (= (mask!27465 thiss!1141) #b00000000000011111111111111111111) (= (mask!27465 thiss!1141) #b00000000000111111111111111111111) (= (mask!27465 thiss!1141) #b00000000001111111111111111111111) (= (mask!27465 thiss!1141) #b00000000011111111111111111111111) (= (mask!27465 thiss!1141) #b00000000111111111111111111111111) (= (mask!27465 thiss!1141) #b00000001111111111111111111111111) (= (mask!27465 thiss!1141) #b00000011111111111111111111111111) (= (mask!27465 thiss!1141) #b00000111111111111111111111111111) (= (mask!27465 thiss!1141) #b00001111111111111111111111111111) (= (mask!27465 thiss!1141) #b00011111111111111111111111111111) (= (mask!27465 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27465 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947245 d!114495))

(declare-fun d!114497 () Bool)

(declare-fun res!635824 () Bool)

(declare-fun e!533202 () Bool)

(assert (=> d!114497 (=> res!635824 e!533202)))

(assert (=> d!114497 (= res!635824 (= (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114497 (= (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000) e!533202)))

(declare-fun b!947339 () Bool)

(declare-fun e!533203 () Bool)

(assert (=> b!947339 (= e!533202 e!533203)))

(declare-fun res!635825 () Bool)

(assert (=> b!947339 (=> (not res!635825) (not e!533203))))

(assert (=> b!947339 (= res!635825 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28051 (_keys!10638 thiss!1141))))))

(declare-fun b!947340 () Bool)

(assert (=> b!947340 (= e!533203 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114497 (not res!635824)) b!947339))

(assert (= (and b!947339 res!635825) b!947340))

(assert (=> d!114497 m!879721))

(declare-fun m!879729 () Bool)

(assert (=> b!947340 m!879729))

(assert (=> b!947245 d!114497))

(declare-fun d!114499 () Bool)

(assert (=> d!114499 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426367 () Unit!31808)

(declare-fun choose!13 (array!57331 (_ BitVec 64) (_ BitVec 32)) Unit!31808)

(assert (=> d!114499 (= lt!426367 (choose!13 (_keys!10638 thiss!1141) key!756 (index!38832 lt!426352)))))

(assert (=> d!114499 (bvsge (index!38832 lt!426352) #b00000000000000000000000000000000)))

(assert (=> d!114499 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10638 thiss!1141) key!756 (index!38832 lt!426352)) lt!426367)))

(declare-fun bs!26599 () Bool)

(assert (= bs!26599 d!114499))

(assert (=> bs!26599 m!879651))

(declare-fun m!879731 () Bool)

(assert (=> bs!26599 m!879731))

(assert (=> b!947245 d!114499))

(declare-fun d!114501 () Bool)

(declare-fun res!635832 () Bool)

(declare-fun e!533206 () Bool)

(assert (=> d!114501 (=> (not res!635832) (not e!533206))))

(declare-fun simpleValid!364 (LongMapFixedSize!4870) Bool)

(assert (=> d!114501 (= res!635832 (simpleValid!364 thiss!1141))))

(assert (=> d!114501 (= (valid!1859 thiss!1141) e!533206)))

(declare-fun b!947347 () Bool)

(declare-fun res!635833 () Bool)

(assert (=> b!947347 (=> (not res!635833) (not e!533206))))

(declare-fun arrayCountValidKeys!0 (array!57331 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947347 (= res!635833 (= (arrayCountValidKeys!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 (size!28051 (_keys!10638 thiss!1141))) (_size!2490 thiss!1141)))))

(declare-fun b!947348 () Bool)

(declare-fun res!635834 () Bool)

(assert (=> b!947348 (=> (not res!635834) (not e!533206))))

(assert (=> b!947348 (= res!635834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10638 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947349 () Bool)

(assert (=> b!947349 (= e!533206 (arrayNoDuplicates!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 Nil!19306))))

(assert (= (and d!114501 res!635832) b!947347))

(assert (= (and b!947347 res!635833) b!947348))

(assert (= (and b!947348 res!635834) b!947349))

(declare-fun m!879733 () Bool)

(assert (=> d!114501 m!879733))

(declare-fun m!879735 () Bool)

(assert (=> b!947347 m!879735))

(assert (=> b!947348 m!879669))

(assert (=> b!947349 m!879671))

(assert (=> start!80820 d!114501))

(declare-fun b!947362 () Bool)

(declare-fun e!533214 () SeekEntryResult!9115)

(assert (=> b!947362 (= e!533214 Undefined!9115)))

(declare-fun b!947363 () Bool)

(declare-fun e!533213 () SeekEntryResult!9115)

(declare-fun lt!426377 () SeekEntryResult!9115)

(assert (=> b!947363 (= e!533213 (Found!9115 (index!38833 lt!426377)))))

(declare-fun b!947364 () Bool)

(declare-fun e!533215 () SeekEntryResult!9115)

(declare-fun lt!426378 () SeekEntryResult!9115)

(assert (=> b!947364 (= e!533215 (ite ((_ is MissingVacant!9115) lt!426378) (MissingZero!9115 (index!38834 lt!426378)) lt!426378))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57331 (_ BitVec 32)) SeekEntryResult!9115)

(assert (=> b!947364 (= lt!426378 (seekKeyOrZeroReturnVacant!0 (x!81510 lt!426377) (index!38833 lt!426377) (index!38833 lt!426377) key!756 (_keys!10638 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun d!114503 () Bool)

(declare-fun lt!426376 () SeekEntryResult!9115)

(assert (=> d!114503 (and (or ((_ is MissingVacant!9115) lt!426376) (not ((_ is Found!9115) lt!426376)) (and (bvsge (index!38832 lt!426376) #b00000000000000000000000000000000) (bvslt (index!38832 lt!426376) (size!28051 (_keys!10638 thiss!1141))))) (not ((_ is MissingVacant!9115) lt!426376)) (or (not ((_ is Found!9115) lt!426376)) (= (select (arr!27576 (_keys!10638 thiss!1141)) (index!38832 lt!426376)) key!756)))))

(assert (=> d!114503 (= lt!426376 e!533214)))

(declare-fun c!98649 () Bool)

(assert (=> d!114503 (= c!98649 (and ((_ is Intermediate!9115) lt!426377) (undefined!9927 lt!426377)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57331 (_ BitVec 32)) SeekEntryResult!9115)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114503 (= lt!426377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27465 thiss!1141)) key!756 (_keys!10638 thiss!1141) (mask!27465 thiss!1141)))))

(assert (=> d!114503 (validMask!0 (mask!27465 thiss!1141))))

(assert (=> d!114503 (= (seekEntry!0 key!756 (_keys!10638 thiss!1141) (mask!27465 thiss!1141)) lt!426376)))

(declare-fun b!947365 () Bool)

(assert (=> b!947365 (= e!533214 e!533213)))

(declare-fun lt!426379 () (_ BitVec 64))

(assert (=> b!947365 (= lt!426379 (select (arr!27576 (_keys!10638 thiss!1141)) (index!38833 lt!426377)))))

(declare-fun c!98648 () Bool)

(assert (=> b!947365 (= c!98648 (= lt!426379 key!756))))

(declare-fun b!947366 () Bool)

(declare-fun c!98647 () Bool)

(assert (=> b!947366 (= c!98647 (= lt!426379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947366 (= e!533213 e!533215)))

(declare-fun b!947367 () Bool)

(assert (=> b!947367 (= e!533215 (MissingZero!9115 (index!38833 lt!426377)))))

(assert (= (and d!114503 c!98649) b!947362))

(assert (= (and d!114503 (not c!98649)) b!947365))

(assert (= (and b!947365 c!98648) b!947363))

(assert (= (and b!947365 (not c!98648)) b!947366))

(assert (= (and b!947366 c!98647) b!947367))

(assert (= (and b!947366 (not c!98647)) b!947364))

(declare-fun m!879737 () Bool)

(assert (=> b!947364 m!879737))

(declare-fun m!879739 () Bool)

(assert (=> d!114503 m!879739))

(declare-fun m!879741 () Bool)

(assert (=> d!114503 m!879741))

(assert (=> d!114503 m!879741))

(declare-fun m!879743 () Bool)

(assert (=> d!114503 m!879743))

(assert (=> d!114503 m!879649))

(declare-fun m!879745 () Bool)

(assert (=> b!947365 m!879745))

(assert (=> b!947240 d!114503))

(declare-fun d!114505 () Bool)

(assert (=> d!114505 (= (array_inv!21464 (_keys!10638 thiss!1141)) (bvsge (size!28051 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947244 d!114505))

(declare-fun d!114507 () Bool)

(assert (=> d!114507 (= (array_inv!21465 (_values!5755 thiss!1141)) (bvsge (size!28050 (_values!5755 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947244 d!114507))

(declare-fun d!114509 () Bool)

(declare-fun res!635839 () Bool)

(declare-fun e!533223 () Bool)

(assert (=> d!114509 (=> res!635839 e!533223)))

(assert (=> d!114509 (= res!635839 (bvsge #b00000000000000000000000000000000 (size!28051 (_keys!10638 thiss!1141))))))

(assert (=> d!114509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10638 thiss!1141) (mask!27465 thiss!1141)) e!533223)))

(declare-fun bm!41095 () Bool)

(declare-fun call!41098 () Bool)

(assert (=> bm!41095 (= call!41098 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10638 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947376 () Bool)

(declare-fun e!533224 () Bool)

(assert (=> b!947376 (= e!533224 call!41098)))

(declare-fun b!947377 () Bool)

(declare-fun e!533222 () Bool)

(assert (=> b!947377 (= e!533222 call!41098)))

(declare-fun b!947378 () Bool)

(assert (=> b!947378 (= e!533223 e!533224)))

(declare-fun c!98652 () Bool)

(assert (=> b!947378 (= c!98652 (validKeyInArray!0 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947379 () Bool)

(assert (=> b!947379 (= e!533224 e!533222)))

(declare-fun lt!426388 () (_ BitVec 64))

(assert (=> b!947379 (= lt!426388 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426387 () Unit!31808)

(assert (=> b!947379 (= lt!426387 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10638 thiss!1141) lt!426388 #b00000000000000000000000000000000))))

(assert (=> b!947379 (arrayContainsKey!0 (_keys!10638 thiss!1141) lt!426388 #b00000000000000000000000000000000)))

(declare-fun lt!426386 () Unit!31808)

(assert (=> b!947379 (= lt!426386 lt!426387)))

(declare-fun res!635840 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57331 (_ BitVec 32)) SeekEntryResult!9115)

(assert (=> b!947379 (= res!635840 (= (seekEntryOrOpen!0 (select (arr!27576 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000) (_keys!10638 thiss!1141) (mask!27465 thiss!1141)) (Found!9115 #b00000000000000000000000000000000)))))

(assert (=> b!947379 (=> (not res!635840) (not e!533222))))

(assert (= (and d!114509 (not res!635839)) b!947378))

(assert (= (and b!947378 c!98652) b!947379))

(assert (= (and b!947378 (not c!98652)) b!947376))

(assert (= (and b!947379 res!635840) b!947377))

(assert (= (or b!947377 b!947376) bm!41095))

(declare-fun m!879747 () Bool)

(assert (=> bm!41095 m!879747))

(assert (=> b!947378 m!879721))

(assert (=> b!947378 m!879721))

(assert (=> b!947378 m!879725))

(assert (=> b!947379 m!879721))

(declare-fun m!879749 () Bool)

(assert (=> b!947379 m!879749))

(declare-fun m!879751 () Bool)

(assert (=> b!947379 m!879751))

(assert (=> b!947379 m!879721))

(declare-fun m!879753 () Bool)

(assert (=> b!947379 m!879753))

(assert (=> b!947247 d!114509))

(declare-fun mapNonEmpty!32911 () Bool)

(declare-fun mapRes!32911 () Bool)

(declare-fun tp!63103 () Bool)

(declare-fun e!533230 () Bool)

(assert (=> mapNonEmpty!32911 (= mapRes!32911 (and tp!63103 e!533230))))

(declare-fun mapKey!32911 () (_ BitVec 32))

(declare-fun mapRest!32911 () (Array (_ BitVec 32) ValueCell!9860))

(declare-fun mapValue!32911 () ValueCell!9860)

(assert (=> mapNonEmpty!32911 (= mapRest!32902 (store mapRest!32911 mapKey!32911 mapValue!32911))))

(declare-fun b!947386 () Bool)

(assert (=> b!947386 (= e!533230 tp_is_empty!20683)))

(declare-fun condMapEmpty!32911 () Bool)

(declare-fun mapDefault!32911 () ValueCell!9860)

(assert (=> mapNonEmpty!32902 (= condMapEmpty!32911 (= mapRest!32902 ((as const (Array (_ BitVec 32) ValueCell!9860)) mapDefault!32911)))))

(declare-fun e!533229 () Bool)

(assert (=> mapNonEmpty!32902 (= tp!63088 (and e!533229 mapRes!32911))))

(declare-fun b!947387 () Bool)

(assert (=> b!947387 (= e!533229 tp_is_empty!20683)))

(declare-fun mapIsEmpty!32911 () Bool)

(assert (=> mapIsEmpty!32911 mapRes!32911))

(assert (= (and mapNonEmpty!32902 condMapEmpty!32911) mapIsEmpty!32911))

(assert (= (and mapNonEmpty!32902 (not condMapEmpty!32911)) mapNonEmpty!32911))

(assert (= (and mapNonEmpty!32911 ((_ is ValueCellFull!9860) mapValue!32911)) b!947386))

(assert (= (and mapNonEmpty!32902 ((_ is ValueCellFull!9860) mapDefault!32911)) b!947387))

(declare-fun m!879755 () Bool)

(assert (=> mapNonEmpty!32911 m!879755))

(check-sat (not b!947347) b_and!29571 (not bm!41095) (not mapNonEmpty!32911) tp_is_empty!20683 (not b!947340) (not b!947349) (not b!947332) (not b!947348) (not d!114499) (not b!947330) (not bm!41092) (not b!947364) (not d!114503) (not d!114501) (not b_next!18175) (not b!947379) (not b!947331) (not b!947378))
(check-sat b_and!29571 (not b_next!18175))
