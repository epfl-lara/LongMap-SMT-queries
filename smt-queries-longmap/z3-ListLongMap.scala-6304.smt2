; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80678 () Bool)

(assert start!80678)

(declare-fun b!946349 () Bool)

(declare-fun b_free!18145 () Bool)

(declare-fun b_next!18145 () Bool)

(assert (=> b!946349 (= b_free!18145 (not b_next!18145))))

(declare-fun tp!62980 () Bool)

(declare-fun b_and!29541 () Bool)

(assert (=> b!946349 (= tp!62980 b_and!29541)))

(declare-fun b!946343 () Bool)

(declare-fun res!635324 () Bool)

(declare-fun e!532488 () Bool)

(assert (=> b!946343 (=> (not res!635324) (not e!532488))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946343 (= res!635324 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946344 () Bool)

(declare-fun e!532487 () Bool)

(declare-fun e!532483 () Bool)

(declare-fun mapRes!32840 () Bool)

(assert (=> b!946344 (= e!532487 (and e!532483 mapRes!32840))))

(declare-fun condMapEmpty!32840 () Bool)

(declare-datatypes ((V!32503 0))(
  ( (V!32504 (val!10377 Int)) )
))
(declare-datatypes ((ValueCell!9845 0))(
  ( (ValueCellFull!9845 (v!12910 V!32503)) (EmptyCell!9845) )
))
(declare-datatypes ((array!57259 0))(
  ( (array!57260 (arr!27545 (Array (_ BitVec 32) ValueCell!9845)) (size!28018 (_ BitVec 32))) )
))
(declare-datatypes ((array!57261 0))(
  ( (array!57262 (arr!27546 (Array (_ BitVec 32) (_ BitVec 64))) (size!28019 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4840 0))(
  ( (LongMapFixedSize!4841 (defaultEntry!5717 Int) (mask!27419 (_ BitVec 32)) (extraKeys!5449 (_ BitVec 32)) (zeroValue!5553 V!32503) (minValue!5553 V!32503) (_size!2475 (_ BitVec 32)) (_keys!10609 array!57261) (_values!5740 array!57259) (_vacant!2475 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4840)

(declare-fun mapDefault!32840 () ValueCell!9845)

(assert (=> b!946344 (= condMapEmpty!32840 (= (arr!27545 (_values!5740 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9845)) mapDefault!32840)))))

(declare-fun b!946345 () Bool)

(declare-fun e!532485 () Bool)

(assert (=> b!946345 (= e!532488 e!532485)))

(declare-fun res!635326 () Bool)

(assert (=> b!946345 (=> (not res!635326) (not e!532485))))

(declare-datatypes ((SeekEntryResult!9102 0))(
  ( (MissingZero!9102 (index!38779 (_ BitVec 32))) (Found!9102 (index!38780 (_ BitVec 32))) (Intermediate!9102 (undefined!9914 Bool) (index!38781 (_ BitVec 32)) (x!81399 (_ BitVec 32))) (Undefined!9102) (MissingVacant!9102 (index!38782 (_ BitVec 32))) )
))
(declare-fun lt!426100 () SeekEntryResult!9102)

(get-info :version)

(assert (=> b!946345 (= res!635326 ((_ is Found!9102) lt!426100))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57261 (_ BitVec 32)) SeekEntryResult!9102)

(assert (=> b!946345 (= lt!426100 (seekEntry!0 key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(declare-fun mapIsEmpty!32840 () Bool)

(assert (=> mapIsEmpty!32840 mapRes!32840))

(declare-fun mapNonEmpty!32840 () Bool)

(declare-fun tp!62981 () Bool)

(declare-fun e!532490 () Bool)

(assert (=> mapNonEmpty!32840 (= mapRes!32840 (and tp!62981 e!532490))))

(declare-fun mapRest!32840 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapValue!32840 () ValueCell!9845)

(declare-fun mapKey!32840 () (_ BitVec 32))

(assert (=> mapNonEmpty!32840 (= (arr!27545 (_values!5740 thiss!1141)) (store mapRest!32840 mapKey!32840 mapValue!32840))))

(declare-fun b!946346 () Bool)

(declare-fun e!532489 () Bool)

(assert (=> b!946346 (= e!532485 (not e!532489))))

(declare-fun res!635327 () Bool)

(assert (=> b!946346 (=> res!635327 e!532489)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946346 (= res!635327 (not (validMask!0 (mask!27419 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946346 (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31788 0))(
  ( (Unit!31789) )
))
(declare-fun lt!426099 () Unit!31788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57261 (_ BitVec 64) (_ BitVec 32)) Unit!31788)

(assert (=> b!946346 (= lt!426099 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10609 thiss!1141) key!756 (index!38780 lt!426100)))))

(declare-fun b!946347 () Bool)

(assert (=> b!946347 (= e!532489 (or (not (= (size!28018 (_values!5740 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27419 thiss!1141)))) (not (= (size!28019 (_keys!10609 thiss!1141)) (size!28018 (_values!5740 thiss!1141)))) (bvslt (mask!27419 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5449 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun res!635325 () Bool)

(assert (=> start!80678 (=> (not res!635325) (not e!532488))))

(declare-fun valid!1849 (LongMapFixedSize!4840) Bool)

(assert (=> start!80678 (= res!635325 (valid!1849 thiss!1141))))

(assert (=> start!80678 e!532488))

(declare-fun e!532486 () Bool)

(assert (=> start!80678 e!532486))

(assert (=> start!80678 true))

(declare-fun b!946348 () Bool)

(declare-fun tp_is_empty!20653 () Bool)

(assert (=> b!946348 (= e!532490 tp_is_empty!20653)))

(declare-fun array_inv!21446 (array!57261) Bool)

(declare-fun array_inv!21447 (array!57259) Bool)

(assert (=> b!946349 (= e!532486 (and tp!62980 tp_is_empty!20653 (array_inv!21446 (_keys!10609 thiss!1141)) (array_inv!21447 (_values!5740 thiss!1141)) e!532487))))

(declare-fun b!946350 () Bool)

(assert (=> b!946350 (= e!532483 tp_is_empty!20653)))

(assert (= (and start!80678 res!635325) b!946343))

(assert (= (and b!946343 res!635324) b!946345))

(assert (= (and b!946345 res!635326) b!946346))

(assert (= (and b!946346 (not res!635327)) b!946347))

(assert (= (and b!946344 condMapEmpty!32840) mapIsEmpty!32840))

(assert (= (and b!946344 (not condMapEmpty!32840)) mapNonEmpty!32840))

(assert (= (and mapNonEmpty!32840 ((_ is ValueCellFull!9845) mapValue!32840)) b!946348))

(assert (= (and b!946344 ((_ is ValueCellFull!9845) mapDefault!32840)) b!946350))

(assert (= b!946349 b!946344))

(assert (= start!80678 b!946349))

(declare-fun m!879141 () Bool)

(assert (=> b!946346 m!879141))

(declare-fun m!879143 () Bool)

(assert (=> b!946346 m!879143))

(declare-fun m!879145 () Bool)

(assert (=> b!946346 m!879145))

(declare-fun m!879147 () Bool)

(assert (=> b!946349 m!879147))

(declare-fun m!879149 () Bool)

(assert (=> b!946349 m!879149))

(declare-fun m!879151 () Bool)

(assert (=> start!80678 m!879151))

(declare-fun m!879153 () Bool)

(assert (=> b!946345 m!879153))

(declare-fun m!879155 () Bool)

(assert (=> mapNonEmpty!32840 m!879155))

(check-sat (not b!946346) (not b!946345) tp_is_empty!20653 (not mapNonEmpty!32840) b_and!29541 (not b_next!18145) (not start!80678) (not b!946349))
(check-sat b_and!29541 (not b_next!18145))
(get-model)

(declare-fun d!114365 () Bool)

(declare-fun res!635358 () Bool)

(declare-fun e!532541 () Bool)

(assert (=> d!114365 (=> (not res!635358) (not e!532541))))

(declare-fun simpleValid!359 (LongMapFixedSize!4840) Bool)

(assert (=> d!114365 (= res!635358 (simpleValid!359 thiss!1141))))

(assert (=> d!114365 (= (valid!1849 thiss!1141) e!532541)))

(declare-fun b!946405 () Bool)

(declare-fun res!635359 () Bool)

(assert (=> b!946405 (=> (not res!635359) (not e!532541))))

(declare-fun arrayCountValidKeys!0 (array!57261 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946405 (= res!635359 (= (arrayCountValidKeys!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 (size!28019 (_keys!10609 thiss!1141))) (_size!2475 thiss!1141)))))

(declare-fun b!946406 () Bool)

(declare-fun res!635360 () Bool)

(assert (=> b!946406 (=> (not res!635360) (not e!532541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57261 (_ BitVec 32)) Bool)

(assert (=> b!946406 (= res!635360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(declare-fun b!946407 () Bool)

(declare-datatypes ((List!19304 0))(
  ( (Nil!19301) (Cons!19300 (h!20454 (_ BitVec 64)) (t!27616 List!19304)) )
))
(declare-fun arrayNoDuplicates!0 (array!57261 (_ BitVec 32) List!19304) Bool)

(assert (=> b!946407 (= e!532541 (arrayNoDuplicates!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 Nil!19301))))

(assert (= (and d!114365 res!635358) b!946405))

(assert (= (and b!946405 res!635359) b!946406))

(assert (= (and b!946406 res!635360) b!946407))

(declare-fun m!879189 () Bool)

(assert (=> d!114365 m!879189))

(declare-fun m!879191 () Bool)

(assert (=> b!946405 m!879191))

(declare-fun m!879193 () Bool)

(assert (=> b!946406 m!879193))

(declare-fun m!879195 () Bool)

(assert (=> b!946407 m!879195))

(assert (=> start!80678 d!114365))

(declare-fun b!946420 () Bool)

(declare-fun c!98526 () Bool)

(declare-fun lt!426122 () (_ BitVec 64))

(assert (=> b!946420 (= c!98526 (= lt!426122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532549 () SeekEntryResult!9102)

(declare-fun e!532548 () SeekEntryResult!9102)

(assert (=> b!946420 (= e!532549 e!532548)))

(declare-fun b!946421 () Bool)

(declare-fun e!532550 () SeekEntryResult!9102)

(assert (=> b!946421 (= e!532550 e!532549)))

(declare-fun lt!426121 () SeekEntryResult!9102)

(assert (=> b!946421 (= lt!426122 (select (arr!27546 (_keys!10609 thiss!1141)) (index!38781 lt!426121)))))

(declare-fun c!98525 () Bool)

(assert (=> b!946421 (= c!98525 (= lt!426122 key!756))))

(declare-fun d!114367 () Bool)

(declare-fun lt!426124 () SeekEntryResult!9102)

(assert (=> d!114367 (and (or ((_ is MissingVacant!9102) lt!426124) (not ((_ is Found!9102) lt!426124)) (and (bvsge (index!38780 lt!426124) #b00000000000000000000000000000000) (bvslt (index!38780 lt!426124) (size!28019 (_keys!10609 thiss!1141))))) (not ((_ is MissingVacant!9102) lt!426124)) (or (not ((_ is Found!9102) lt!426124)) (= (select (arr!27546 (_keys!10609 thiss!1141)) (index!38780 lt!426124)) key!756)))))

(assert (=> d!114367 (= lt!426124 e!532550)))

(declare-fun c!98524 () Bool)

(assert (=> d!114367 (= c!98524 (and ((_ is Intermediate!9102) lt!426121) (undefined!9914 lt!426121)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57261 (_ BitVec 32)) SeekEntryResult!9102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114367 (= lt!426121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27419 thiss!1141)) key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(assert (=> d!114367 (validMask!0 (mask!27419 thiss!1141))))

(assert (=> d!114367 (= (seekEntry!0 key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)) lt!426124)))

(declare-fun b!946422 () Bool)

(assert (=> b!946422 (= e!532550 Undefined!9102)))

(declare-fun b!946423 () Bool)

(declare-fun lt!426123 () SeekEntryResult!9102)

(assert (=> b!946423 (= e!532548 (ite ((_ is MissingVacant!9102) lt!426123) (MissingZero!9102 (index!38782 lt!426123)) lt!426123))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57261 (_ BitVec 32)) SeekEntryResult!9102)

(assert (=> b!946423 (= lt!426123 (seekKeyOrZeroReturnVacant!0 (x!81399 lt!426121) (index!38781 lt!426121) (index!38781 lt!426121) key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(declare-fun b!946424 () Bool)

(assert (=> b!946424 (= e!532549 (Found!9102 (index!38781 lt!426121)))))

(declare-fun b!946425 () Bool)

(assert (=> b!946425 (= e!532548 (MissingZero!9102 (index!38781 lt!426121)))))

(assert (= (and d!114367 c!98524) b!946422))

(assert (= (and d!114367 (not c!98524)) b!946421))

(assert (= (and b!946421 c!98525) b!946424))

(assert (= (and b!946421 (not c!98525)) b!946420))

(assert (= (and b!946420 c!98526) b!946425))

(assert (= (and b!946420 (not c!98526)) b!946423))

(declare-fun m!879197 () Bool)

(assert (=> b!946421 m!879197))

(declare-fun m!879199 () Bool)

(assert (=> d!114367 m!879199))

(declare-fun m!879201 () Bool)

(assert (=> d!114367 m!879201))

(assert (=> d!114367 m!879201))

(declare-fun m!879203 () Bool)

(assert (=> d!114367 m!879203))

(assert (=> d!114367 m!879141))

(declare-fun m!879205 () Bool)

(assert (=> b!946423 m!879205))

(assert (=> b!946345 d!114367))

(declare-fun d!114369 () Bool)

(assert (=> d!114369 (= (array_inv!21446 (_keys!10609 thiss!1141)) (bvsge (size!28019 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946349 d!114369))

(declare-fun d!114371 () Bool)

(assert (=> d!114371 (= (array_inv!21447 (_values!5740 thiss!1141)) (bvsge (size!28018 (_values!5740 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946349 d!114371))

(declare-fun d!114373 () Bool)

(assert (=> d!114373 (= (validMask!0 (mask!27419 thiss!1141)) (and (or (= (mask!27419 thiss!1141) #b00000000000000000000000000000111) (= (mask!27419 thiss!1141) #b00000000000000000000000000001111) (= (mask!27419 thiss!1141) #b00000000000000000000000000011111) (= (mask!27419 thiss!1141) #b00000000000000000000000000111111) (= (mask!27419 thiss!1141) #b00000000000000000000000001111111) (= (mask!27419 thiss!1141) #b00000000000000000000000011111111) (= (mask!27419 thiss!1141) #b00000000000000000000000111111111) (= (mask!27419 thiss!1141) #b00000000000000000000001111111111) (= (mask!27419 thiss!1141) #b00000000000000000000011111111111) (= (mask!27419 thiss!1141) #b00000000000000000000111111111111) (= (mask!27419 thiss!1141) #b00000000000000000001111111111111) (= (mask!27419 thiss!1141) #b00000000000000000011111111111111) (= (mask!27419 thiss!1141) #b00000000000000000111111111111111) (= (mask!27419 thiss!1141) #b00000000000000001111111111111111) (= (mask!27419 thiss!1141) #b00000000000000011111111111111111) (= (mask!27419 thiss!1141) #b00000000000000111111111111111111) (= (mask!27419 thiss!1141) #b00000000000001111111111111111111) (= (mask!27419 thiss!1141) #b00000000000011111111111111111111) (= (mask!27419 thiss!1141) #b00000000000111111111111111111111) (= (mask!27419 thiss!1141) #b00000000001111111111111111111111) (= (mask!27419 thiss!1141) #b00000000011111111111111111111111) (= (mask!27419 thiss!1141) #b00000000111111111111111111111111) (= (mask!27419 thiss!1141) #b00000001111111111111111111111111) (= (mask!27419 thiss!1141) #b00000011111111111111111111111111) (= (mask!27419 thiss!1141) #b00000111111111111111111111111111) (= (mask!27419 thiss!1141) #b00001111111111111111111111111111) (= (mask!27419 thiss!1141) #b00011111111111111111111111111111) (= (mask!27419 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27419 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946346 d!114373))

(declare-fun d!114375 () Bool)

(declare-fun res!635365 () Bool)

(declare-fun e!532555 () Bool)

(assert (=> d!114375 (=> res!635365 e!532555)))

(assert (=> d!114375 (= res!635365 (= (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114375 (= (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 #b00000000000000000000000000000000) e!532555)))

(declare-fun b!946430 () Bool)

(declare-fun e!532556 () Bool)

(assert (=> b!946430 (= e!532555 e!532556)))

(declare-fun res!635366 () Bool)

(assert (=> b!946430 (=> (not res!635366) (not e!532556))))

(assert (=> b!946430 (= res!635366 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28019 (_keys!10609 thiss!1141))))))

(declare-fun b!946431 () Bool)

(assert (=> b!946431 (= e!532556 (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114375 (not res!635365)) b!946430))

(assert (= (and b!946430 res!635366) b!946431))

(declare-fun m!879207 () Bool)

(assert (=> d!114375 m!879207))

(declare-fun m!879209 () Bool)

(assert (=> b!946431 m!879209))

(assert (=> b!946346 d!114375))

(declare-fun d!114377 () Bool)

(assert (=> d!114377 (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426127 () Unit!31788)

(declare-fun choose!13 (array!57261 (_ BitVec 64) (_ BitVec 32)) Unit!31788)

(assert (=> d!114377 (= lt!426127 (choose!13 (_keys!10609 thiss!1141) key!756 (index!38780 lt!426100)))))

(assert (=> d!114377 (bvsge (index!38780 lt!426100) #b00000000000000000000000000000000)))

(assert (=> d!114377 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10609 thiss!1141) key!756 (index!38780 lt!426100)) lt!426127)))

(declare-fun bs!26577 () Bool)

(assert (= bs!26577 d!114377))

(assert (=> bs!26577 m!879143))

(declare-fun m!879211 () Bool)

(assert (=> bs!26577 m!879211))

(assert (=> b!946346 d!114377))

(declare-fun b!946438 () Bool)

(declare-fun e!532561 () Bool)

(assert (=> b!946438 (= e!532561 tp_is_empty!20653)))

(declare-fun mapNonEmpty!32849 () Bool)

(declare-fun mapRes!32849 () Bool)

(declare-fun tp!62996 () Bool)

(assert (=> mapNonEmpty!32849 (= mapRes!32849 (and tp!62996 e!532561))))

(declare-fun mapValue!32849 () ValueCell!9845)

(declare-fun mapRest!32849 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapKey!32849 () (_ BitVec 32))

(assert (=> mapNonEmpty!32849 (= mapRest!32840 (store mapRest!32849 mapKey!32849 mapValue!32849))))

(declare-fun mapIsEmpty!32849 () Bool)

(assert (=> mapIsEmpty!32849 mapRes!32849))

(declare-fun condMapEmpty!32849 () Bool)

(declare-fun mapDefault!32849 () ValueCell!9845)

(assert (=> mapNonEmpty!32840 (= condMapEmpty!32849 (= mapRest!32840 ((as const (Array (_ BitVec 32) ValueCell!9845)) mapDefault!32849)))))

(declare-fun e!532562 () Bool)

(assert (=> mapNonEmpty!32840 (= tp!62981 (and e!532562 mapRes!32849))))

(declare-fun b!946439 () Bool)

(assert (=> b!946439 (= e!532562 tp_is_empty!20653)))

(assert (= (and mapNonEmpty!32840 condMapEmpty!32849) mapIsEmpty!32849))

(assert (= (and mapNonEmpty!32840 (not condMapEmpty!32849)) mapNonEmpty!32849))

(assert (= (and mapNonEmpty!32849 ((_ is ValueCellFull!9845) mapValue!32849)) b!946438))

(assert (= (and mapNonEmpty!32840 ((_ is ValueCellFull!9845) mapDefault!32849)) b!946439))

(declare-fun m!879213 () Bool)

(assert (=> mapNonEmpty!32849 m!879213))

(check-sat (not d!114365) (not d!114367) (not d!114377) (not b!946431) (not b!946407) (not mapNonEmpty!32849) (not b!946423) tp_is_empty!20653 (not b!946406) b_and!29541 (not b_next!18145) (not b!946405))
(check-sat b_and!29541 (not b_next!18145))
(get-model)

(declare-fun b!946452 () Bool)

(declare-fun e!532569 () SeekEntryResult!9102)

(assert (=> b!946452 (= e!532569 (Found!9102 (index!38781 lt!426121)))))

(declare-fun b!946454 () Bool)

(declare-fun e!532570 () SeekEntryResult!9102)

(assert (=> b!946454 (= e!532570 e!532569)))

(declare-fun c!98533 () Bool)

(declare-fun lt!426132 () (_ BitVec 64))

(assert (=> b!946454 (= c!98533 (= lt!426132 key!756))))

(declare-fun b!946455 () Bool)

(assert (=> b!946455 (= e!532570 Undefined!9102)))

(declare-fun b!946456 () Bool)

(declare-fun c!98535 () Bool)

(assert (=> b!946456 (= c!98535 (= lt!426132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532571 () SeekEntryResult!9102)

(assert (=> b!946456 (= e!532569 e!532571)))

(declare-fun b!946457 () Bool)

(assert (=> b!946457 (= e!532571 (MissingVacant!9102 (index!38781 lt!426121)))))

(declare-fun d!114379 () Bool)

(declare-fun lt!426133 () SeekEntryResult!9102)

(assert (=> d!114379 (and (or ((_ is Undefined!9102) lt!426133) (not ((_ is Found!9102) lt!426133)) (and (bvsge (index!38780 lt!426133) #b00000000000000000000000000000000) (bvslt (index!38780 lt!426133) (size!28019 (_keys!10609 thiss!1141))))) (or ((_ is Undefined!9102) lt!426133) ((_ is Found!9102) lt!426133) (not ((_ is MissingVacant!9102) lt!426133)) (not (= (index!38782 lt!426133) (index!38781 lt!426121))) (and (bvsge (index!38782 lt!426133) #b00000000000000000000000000000000) (bvslt (index!38782 lt!426133) (size!28019 (_keys!10609 thiss!1141))))) (or ((_ is Undefined!9102) lt!426133) (ite ((_ is Found!9102) lt!426133) (= (select (arr!27546 (_keys!10609 thiss!1141)) (index!38780 lt!426133)) key!756) (and ((_ is MissingVacant!9102) lt!426133) (= (index!38782 lt!426133) (index!38781 lt!426121)) (= (select (arr!27546 (_keys!10609 thiss!1141)) (index!38782 lt!426133)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114379 (= lt!426133 e!532570)))

(declare-fun c!98534 () Bool)

(assert (=> d!114379 (= c!98534 (bvsge (x!81399 lt!426121) #b01111111111111111111111111111110))))

(assert (=> d!114379 (= lt!426132 (select (arr!27546 (_keys!10609 thiss!1141)) (index!38781 lt!426121)))))

(assert (=> d!114379 (validMask!0 (mask!27419 thiss!1141))))

(assert (=> d!114379 (= (seekKeyOrZeroReturnVacant!0 (x!81399 lt!426121) (index!38781 lt!426121) (index!38781 lt!426121) key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)) lt!426133)))

(declare-fun b!946453 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946453 (= e!532571 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81399 lt!426121) #b00000000000000000000000000000001) (nextIndex!0 (index!38781 lt!426121) (x!81399 lt!426121) (mask!27419 thiss!1141)) (index!38781 lt!426121) key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(assert (= (and d!114379 c!98534) b!946455))

(assert (= (and d!114379 (not c!98534)) b!946454))

(assert (= (and b!946454 c!98533) b!946452))

(assert (= (and b!946454 (not c!98533)) b!946456))

(assert (= (and b!946456 c!98535) b!946457))

(assert (= (and b!946456 (not c!98535)) b!946453))

(declare-fun m!879215 () Bool)

(assert (=> d!114379 m!879215))

(declare-fun m!879217 () Bool)

(assert (=> d!114379 m!879217))

(assert (=> d!114379 m!879197))

(assert (=> d!114379 m!879141))

(declare-fun m!879219 () Bool)

(assert (=> b!946453 m!879219))

(assert (=> b!946453 m!879219))

(declare-fun m!879221 () Bool)

(assert (=> b!946453 m!879221))

(assert (=> b!946423 d!114379))

(declare-fun b!946467 () Bool)

(declare-fun e!532577 () (_ BitVec 32))

(declare-fun e!532576 () (_ BitVec 32))

(assert (=> b!946467 (= e!532577 e!532576)))

(declare-fun c!98540 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946467 (= c!98540 (validKeyInArray!0 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946468 () Bool)

(assert (=> b!946468 (= e!532577 #b00000000000000000000000000000000)))

(declare-fun bm!41059 () Bool)

(declare-fun call!41062 () (_ BitVec 32))

(assert (=> bm!41059 (= call!41062 (arrayCountValidKeys!0 (_keys!10609 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28019 (_keys!10609 thiss!1141))))))

(declare-fun b!946469 () Bool)

(assert (=> b!946469 (= e!532576 call!41062)))

(declare-fun d!114381 () Bool)

(declare-fun lt!426136 () (_ BitVec 32))

(assert (=> d!114381 (and (bvsge lt!426136 #b00000000000000000000000000000000) (bvsle lt!426136 (bvsub (size!28019 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114381 (= lt!426136 e!532577)))

(declare-fun c!98541 () Bool)

(assert (=> d!114381 (= c!98541 (bvsge #b00000000000000000000000000000000 (size!28019 (_keys!10609 thiss!1141))))))

(assert (=> d!114381 (and (bvsle #b00000000000000000000000000000000 (size!28019 (_keys!10609 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28019 (_keys!10609 thiss!1141)) (size!28019 (_keys!10609 thiss!1141))))))

(assert (=> d!114381 (= (arrayCountValidKeys!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 (size!28019 (_keys!10609 thiss!1141))) lt!426136)))

(declare-fun b!946466 () Bool)

(assert (=> b!946466 (= e!532576 (bvadd #b00000000000000000000000000000001 call!41062))))

(assert (= (and d!114381 c!98541) b!946468))

(assert (= (and d!114381 (not c!98541)) b!946467))

(assert (= (and b!946467 c!98540) b!946466))

(assert (= (and b!946467 (not c!98540)) b!946469))

(assert (= (or b!946466 b!946469) bm!41059))

(assert (=> b!946467 m!879207))

(assert (=> b!946467 m!879207))

(declare-fun m!879223 () Bool)

(assert (=> b!946467 m!879223))

(declare-fun m!879225 () Bool)

(assert (=> bm!41059 m!879225))

(assert (=> b!946405 d!114381))

(declare-fun bm!41062 () Bool)

(declare-fun call!41065 () Bool)

(assert (=> bm!41062 (= call!41065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(declare-fun b!946478 () Bool)

(declare-fun e!532586 () Bool)

(assert (=> b!946478 (= e!532586 call!41065)))

(declare-fun b!946479 () Bool)

(declare-fun e!532584 () Bool)

(assert (=> b!946479 (= e!532584 e!532586)))

(declare-fun c!98544 () Bool)

(assert (=> b!946479 (= c!98544 (validKeyInArray!0 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114383 () Bool)

(declare-fun res!635371 () Bool)

(assert (=> d!114383 (=> res!635371 e!532584)))

(assert (=> d!114383 (= res!635371 (bvsge #b00000000000000000000000000000000 (size!28019 (_keys!10609 thiss!1141))))))

(assert (=> d!114383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)) e!532584)))

(declare-fun b!946480 () Bool)

(declare-fun e!532585 () Bool)

(assert (=> b!946480 (= e!532586 e!532585)))

(declare-fun lt!426144 () (_ BitVec 64))

(assert (=> b!946480 (= lt!426144 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426145 () Unit!31788)

(assert (=> b!946480 (= lt!426145 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10609 thiss!1141) lt!426144 #b00000000000000000000000000000000))))

(assert (=> b!946480 (arrayContainsKey!0 (_keys!10609 thiss!1141) lt!426144 #b00000000000000000000000000000000)))

(declare-fun lt!426143 () Unit!31788)

(assert (=> b!946480 (= lt!426143 lt!426145)))

(declare-fun res!635372 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57261 (_ BitVec 32)) SeekEntryResult!9102)

(assert (=> b!946480 (= res!635372 (= (seekEntryOrOpen!0 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000) (_keys!10609 thiss!1141) (mask!27419 thiss!1141)) (Found!9102 #b00000000000000000000000000000000)))))

(assert (=> b!946480 (=> (not res!635372) (not e!532585))))

(declare-fun b!946481 () Bool)

(assert (=> b!946481 (= e!532585 call!41065)))

(assert (= (and d!114383 (not res!635371)) b!946479))

(assert (= (and b!946479 c!98544) b!946480))

(assert (= (and b!946479 (not c!98544)) b!946478))

(assert (= (and b!946480 res!635372) b!946481))

(assert (= (or b!946481 b!946478) bm!41062))

(declare-fun m!879227 () Bool)

(assert (=> bm!41062 m!879227))

(assert (=> b!946479 m!879207))

(assert (=> b!946479 m!879207))

(assert (=> b!946479 m!879223))

(assert (=> b!946480 m!879207))

(declare-fun m!879229 () Bool)

(assert (=> b!946480 m!879229))

(declare-fun m!879231 () Bool)

(assert (=> b!946480 m!879231))

(assert (=> b!946480 m!879207))

(declare-fun m!879233 () Bool)

(assert (=> b!946480 m!879233))

(assert (=> b!946406 d!114383))

(declare-fun b!946500 () Bool)

(declare-fun e!532598 () SeekEntryResult!9102)

(assert (=> b!946500 (= e!532598 (Intermediate!9102 true (toIndex!0 key!756 (mask!27419 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946501 () Bool)

(declare-fun lt!426150 () SeekEntryResult!9102)

(assert (=> b!946501 (and (bvsge (index!38781 lt!426150) #b00000000000000000000000000000000) (bvslt (index!38781 lt!426150) (size!28019 (_keys!10609 thiss!1141))))))

(declare-fun e!532597 () Bool)

(assert (=> b!946501 (= e!532597 (= (select (arr!27546 (_keys!10609 thiss!1141)) (index!38781 lt!426150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946502 () Bool)

(declare-fun e!532599 () Bool)

(declare-fun e!532600 () Bool)

(assert (=> b!946502 (= e!532599 e!532600)))

(declare-fun res!635379 () Bool)

(assert (=> b!946502 (= res!635379 (and ((_ is Intermediate!9102) lt!426150) (not (undefined!9914 lt!426150)) (bvslt (x!81399 lt!426150) #b01111111111111111111111111111110) (bvsge (x!81399 lt!426150) #b00000000000000000000000000000000) (bvsge (x!81399 lt!426150) #b00000000000000000000000000000000)))))

(assert (=> b!946502 (=> (not res!635379) (not e!532600))))

(declare-fun b!946503 () Bool)

(assert (=> b!946503 (and (bvsge (index!38781 lt!426150) #b00000000000000000000000000000000) (bvslt (index!38781 lt!426150) (size!28019 (_keys!10609 thiss!1141))))))

(declare-fun res!635380 () Bool)

(assert (=> b!946503 (= res!635380 (= (select (arr!27546 (_keys!10609 thiss!1141)) (index!38781 lt!426150)) key!756))))

(assert (=> b!946503 (=> res!635380 e!532597)))

(assert (=> b!946503 (= e!532600 e!532597)))

(declare-fun b!946504 () Bool)

(declare-fun e!532601 () SeekEntryResult!9102)

(assert (=> b!946504 (= e!532601 (Intermediate!9102 false (toIndex!0 key!756 (mask!27419 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946505 () Bool)

(assert (=> b!946505 (and (bvsge (index!38781 lt!426150) #b00000000000000000000000000000000) (bvslt (index!38781 lt!426150) (size!28019 (_keys!10609 thiss!1141))))))

(declare-fun res!635381 () Bool)

(assert (=> b!946505 (= res!635381 (= (select (arr!27546 (_keys!10609 thiss!1141)) (index!38781 lt!426150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946505 (=> res!635381 e!532597)))

(declare-fun d!114385 () Bool)

(assert (=> d!114385 e!532599))

(declare-fun c!98553 () Bool)

(assert (=> d!114385 (= c!98553 (and ((_ is Intermediate!9102) lt!426150) (undefined!9914 lt!426150)))))

(assert (=> d!114385 (= lt!426150 e!532598)))

(declare-fun c!98552 () Bool)

(assert (=> d!114385 (= c!98552 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!426151 () (_ BitVec 64))

(assert (=> d!114385 (= lt!426151 (select (arr!27546 (_keys!10609 thiss!1141)) (toIndex!0 key!756 (mask!27419 thiss!1141))))))

(assert (=> d!114385 (validMask!0 (mask!27419 thiss!1141))))

(assert (=> d!114385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27419 thiss!1141)) key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)) lt!426150)))

(declare-fun b!946506 () Bool)

(assert (=> b!946506 (= e!532599 (bvsge (x!81399 lt!426150) #b01111111111111111111111111111110))))

(declare-fun b!946507 () Bool)

(assert (=> b!946507 (= e!532601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27419 thiss!1141)) #b00000000000000000000000000000000 (mask!27419 thiss!1141)) key!756 (_keys!10609 thiss!1141) (mask!27419 thiss!1141)))))

(declare-fun b!946508 () Bool)

(assert (=> b!946508 (= e!532598 e!532601)))

(declare-fun c!98551 () Bool)

(assert (=> b!946508 (= c!98551 (or (= lt!426151 key!756) (= (bvadd lt!426151 lt!426151) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114385 c!98552) b!946500))

(assert (= (and d!114385 (not c!98552)) b!946508))

(assert (= (and b!946508 c!98551) b!946504))

(assert (= (and b!946508 (not c!98551)) b!946507))

(assert (= (and d!114385 c!98553) b!946506))

(assert (= (and d!114385 (not c!98553)) b!946502))

(assert (= (and b!946502 res!635379) b!946503))

(assert (= (and b!946503 (not res!635380)) b!946505))

(assert (= (and b!946505 (not res!635381)) b!946501))

(declare-fun m!879235 () Bool)

(assert (=> b!946501 m!879235))

(assert (=> b!946507 m!879201))

(declare-fun m!879237 () Bool)

(assert (=> b!946507 m!879237))

(assert (=> b!946507 m!879237))

(declare-fun m!879239 () Bool)

(assert (=> b!946507 m!879239))

(assert (=> d!114385 m!879201))

(declare-fun m!879241 () Bool)

(assert (=> d!114385 m!879241))

(assert (=> d!114385 m!879141))

(assert (=> b!946505 m!879235))

(assert (=> b!946503 m!879235))

(assert (=> d!114367 d!114385))

(declare-fun d!114387 () Bool)

(declare-fun lt!426157 () (_ BitVec 32))

(declare-fun lt!426156 () (_ BitVec 32))

(assert (=> d!114387 (= lt!426157 (bvmul (bvxor lt!426156 (bvlshr lt!426156 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114387 (= lt!426156 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114387 (and (bvsge (mask!27419 thiss!1141) #b00000000000000000000000000000000) (let ((res!635382 (let ((h!20455 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81418 (bvmul (bvxor h!20455 (bvlshr h!20455 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81418 (bvlshr x!81418 #b00000000000000000000000000001101)) (mask!27419 thiss!1141)))))) (and (bvslt res!635382 (bvadd (mask!27419 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635382 #b00000000000000000000000000000000))))))

(assert (=> d!114387 (= (toIndex!0 key!756 (mask!27419 thiss!1141)) (bvand (bvxor lt!426157 (bvlshr lt!426157 #b00000000000000000000000000001101)) (mask!27419 thiss!1141)))))

(assert (=> d!114367 d!114387))

(assert (=> d!114367 d!114373))

(declare-fun d!114389 () Bool)

(declare-fun res!635389 () Bool)

(declare-fun e!532611 () Bool)

(assert (=> d!114389 (=> res!635389 e!532611)))

(assert (=> d!114389 (= res!635389 (bvsge #b00000000000000000000000000000000 (size!28019 (_keys!10609 thiss!1141))))))

(assert (=> d!114389 (= (arrayNoDuplicates!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 Nil!19301) e!532611)))

(declare-fun b!946519 () Bool)

(declare-fun e!532612 () Bool)

(declare-fun call!41068 () Bool)

(assert (=> b!946519 (= e!532612 call!41068)))

(declare-fun bm!41065 () Bool)

(declare-fun c!98556 () Bool)

(assert (=> bm!41065 (= call!41068 (arrayNoDuplicates!0 (_keys!10609 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98556 (Cons!19300 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000) Nil!19301) Nil!19301)))))

(declare-fun b!946520 () Bool)

(declare-fun e!532610 () Bool)

(declare-fun contains!5158 (List!19304 (_ BitVec 64)) Bool)

(assert (=> b!946520 (= e!532610 (contains!5158 Nil!19301 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946521 () Bool)

(declare-fun e!532613 () Bool)

(assert (=> b!946521 (= e!532613 e!532612)))

(assert (=> b!946521 (= c!98556 (validKeyInArray!0 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946522 () Bool)

(assert (=> b!946522 (= e!532611 e!532613)))

(declare-fun res!635390 () Bool)

(assert (=> b!946522 (=> (not res!635390) (not e!532613))))

(assert (=> b!946522 (= res!635390 (not e!532610))))

(declare-fun res!635391 () Bool)

(assert (=> b!946522 (=> (not res!635391) (not e!532610))))

(assert (=> b!946522 (= res!635391 (validKeyInArray!0 (select (arr!27546 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946523 () Bool)

(assert (=> b!946523 (= e!532612 call!41068)))

(assert (= (and d!114389 (not res!635389)) b!946522))

(assert (= (and b!946522 res!635391) b!946520))

(assert (= (and b!946522 res!635390) b!946521))

(assert (= (and b!946521 c!98556) b!946523))

(assert (= (and b!946521 (not c!98556)) b!946519))

(assert (= (or b!946523 b!946519) bm!41065))

(assert (=> bm!41065 m!879207))

(declare-fun m!879243 () Bool)

(assert (=> bm!41065 m!879243))

(assert (=> b!946520 m!879207))

(assert (=> b!946520 m!879207))

(declare-fun m!879245 () Bool)

(assert (=> b!946520 m!879245))

(assert (=> b!946521 m!879207))

(assert (=> b!946521 m!879207))

(assert (=> b!946521 m!879223))

(assert (=> b!946522 m!879207))

(assert (=> b!946522 m!879207))

(assert (=> b!946522 m!879223))

(assert (=> b!946407 d!114389))

(declare-fun d!114391 () Bool)

(declare-fun res!635392 () Bool)

(declare-fun e!532614 () Bool)

(assert (=> d!114391 (=> res!635392 e!532614)))

(assert (=> d!114391 (= res!635392 (= (select (arr!27546 (_keys!10609 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114391 (= (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532614)))

(declare-fun b!946524 () Bool)

(declare-fun e!532615 () Bool)

(assert (=> b!946524 (= e!532614 e!532615)))

(declare-fun res!635393 () Bool)

(assert (=> b!946524 (=> (not res!635393) (not e!532615))))

(assert (=> b!946524 (= res!635393 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28019 (_keys!10609 thiss!1141))))))

(declare-fun b!946525 () Bool)

(assert (=> b!946525 (= e!532615 (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114391 (not res!635392)) b!946524))

(assert (= (and b!946524 res!635393) b!946525))

(declare-fun m!879247 () Bool)

(assert (=> d!114391 m!879247))

(declare-fun m!879249 () Bool)

(assert (=> b!946525 m!879249))

(assert (=> b!946431 d!114391))

(assert (=> d!114377 d!114375))

(declare-fun d!114393 () Bool)

(assert (=> d!114393 (arrayContainsKey!0 (_keys!10609 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114393 true))

(declare-fun _$60!433 () Unit!31788)

(assert (=> d!114393 (= (choose!13 (_keys!10609 thiss!1141) key!756 (index!38780 lt!426100)) _$60!433)))

(declare-fun bs!26578 () Bool)

(assert (= bs!26578 d!114393))

(assert (=> bs!26578 m!879143))

(assert (=> d!114377 d!114393))

(declare-fun b!946536 () Bool)

(declare-fun res!635403 () Bool)

(declare-fun e!532618 () Bool)

(assert (=> b!946536 (=> (not res!635403) (not e!532618))))

(declare-fun size!28024 (LongMapFixedSize!4840) (_ BitVec 32))

(assert (=> b!946536 (= res!635403 (= (size!28024 thiss!1141) (bvadd (_size!2475 thiss!1141) (bvsdiv (bvadd (extraKeys!5449 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!946534 () Bool)

(declare-fun res!635405 () Bool)

(assert (=> b!946534 (=> (not res!635405) (not e!532618))))

(assert (=> b!946534 (= res!635405 (and (= (size!28018 (_values!5740 thiss!1141)) (bvadd (mask!27419 thiss!1141) #b00000000000000000000000000000001)) (= (size!28019 (_keys!10609 thiss!1141)) (size!28018 (_values!5740 thiss!1141))) (bvsge (_size!2475 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2475 thiss!1141) (bvadd (mask!27419 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114395 () Bool)

(declare-fun res!635404 () Bool)

(assert (=> d!114395 (=> (not res!635404) (not e!532618))))

(assert (=> d!114395 (= res!635404 (validMask!0 (mask!27419 thiss!1141)))))

(assert (=> d!114395 (= (simpleValid!359 thiss!1141) e!532618)))

(declare-fun b!946535 () Bool)

(declare-fun res!635402 () Bool)

(assert (=> b!946535 (=> (not res!635402) (not e!532618))))

(assert (=> b!946535 (= res!635402 (bvsge (size!28024 thiss!1141) (_size!2475 thiss!1141)))))

(declare-fun b!946537 () Bool)

(assert (=> b!946537 (= e!532618 (and (bvsge (extraKeys!5449 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5449 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2475 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114395 res!635404) b!946534))

(assert (= (and b!946534 res!635405) b!946535))

(assert (= (and b!946535 res!635402) b!946536))

(assert (= (and b!946536 res!635403) b!946537))

(declare-fun m!879251 () Bool)

(assert (=> b!946536 m!879251))

(assert (=> d!114395 m!879141))

(assert (=> b!946535 m!879251))

(assert (=> d!114365 d!114395))

(declare-fun b!946538 () Bool)

(declare-fun e!532619 () Bool)

(assert (=> b!946538 (= e!532619 tp_is_empty!20653)))

(declare-fun mapNonEmpty!32850 () Bool)

(declare-fun mapRes!32850 () Bool)

(declare-fun tp!62997 () Bool)

(assert (=> mapNonEmpty!32850 (= mapRes!32850 (and tp!62997 e!532619))))

(declare-fun mapKey!32850 () (_ BitVec 32))

(declare-fun mapRest!32850 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapValue!32850 () ValueCell!9845)

(assert (=> mapNonEmpty!32850 (= mapRest!32849 (store mapRest!32850 mapKey!32850 mapValue!32850))))

(declare-fun mapIsEmpty!32850 () Bool)

(assert (=> mapIsEmpty!32850 mapRes!32850))

(declare-fun condMapEmpty!32850 () Bool)

(declare-fun mapDefault!32850 () ValueCell!9845)

(assert (=> mapNonEmpty!32849 (= condMapEmpty!32850 (= mapRest!32849 ((as const (Array (_ BitVec 32) ValueCell!9845)) mapDefault!32850)))))

(declare-fun e!532620 () Bool)

(assert (=> mapNonEmpty!32849 (= tp!62996 (and e!532620 mapRes!32850))))

(declare-fun b!946539 () Bool)

(assert (=> b!946539 (= e!532620 tp_is_empty!20653)))

(assert (= (and mapNonEmpty!32849 condMapEmpty!32850) mapIsEmpty!32850))

(assert (= (and mapNonEmpty!32849 (not condMapEmpty!32850)) mapNonEmpty!32850))

(assert (= (and mapNonEmpty!32850 ((_ is ValueCellFull!9845) mapValue!32850)) b!946538))

(assert (= (and mapNonEmpty!32849 ((_ is ValueCellFull!9845) mapDefault!32850)) b!946539))

(declare-fun m!879253 () Bool)

(assert (=> mapNonEmpty!32850 m!879253))

(check-sat (not b!946535) (not bm!41062) (not mapNonEmpty!32850) (not b!946453) (not b!946525) (not b!946521) (not b!946507) (not b!946467) (not d!114393) (not b!946536) b_and!29541 (not d!114385) (not b_next!18145) (not b!946522) (not d!114395) (not b!946479) tp_is_empty!20653 (not b!946480) (not d!114379) (not b!946520) (not bm!41059) (not bm!41065))
(check-sat b_and!29541 (not b_next!18145))
