; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17534 () Bool)

(assert start!17534)

(declare-fun b!175629 () Bool)

(declare-fun b_free!4341 () Bool)

(declare-fun b_next!4341 () Bool)

(assert (=> b!175629 (= b_free!4341 (not b_next!4341))))

(declare-fun tp!15706 () Bool)

(declare-fun b_and!10823 () Bool)

(assert (=> b!175629 (= tp!15706 b_and!10823)))

(declare-fun b!175628 () Bool)

(declare-fun e!115921 () Bool)

(declare-fun e!115920 () Bool)

(declare-fun mapRes!7015 () Bool)

(assert (=> b!175628 (= e!115921 (and e!115920 mapRes!7015))))

(declare-fun condMapEmpty!7015 () Bool)

(declare-datatypes ((V!5131 0))(
  ( (V!5132 (val!2101 Int)) )
))
(declare-datatypes ((ValueCell!1713 0))(
  ( (ValueCellFull!1713 (v!3976 V!5131)) (EmptyCell!1713) )
))
(declare-datatypes ((array!7367 0))(
  ( (array!7368 (arr!3497 (Array (_ BitVec 32) (_ BitVec 64))) (size!3799 (_ BitVec 32))) )
))
(declare-datatypes ((array!7369 0))(
  ( (array!7370 (arr!3498 (Array (_ BitVec 32) ValueCell!1713)) (size!3800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2334 0))(
  ( (LongMapFixedSize!2335 (defaultEntry!3623 Int) (mask!8524 (_ BitVec 32)) (extraKeys!3360 (_ BitVec 32)) (zeroValue!3464 V!5131) (minValue!3464 V!5131) (_size!1216 (_ BitVec 32)) (_keys!5476 array!7367) (_values!3606 array!7369) (_vacant!1216 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2334)

(declare-fun mapDefault!7015 () ValueCell!1713)

(assert (=> b!175628 (= condMapEmpty!7015 (= (arr!3498 (_values!3606 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1713)) mapDefault!7015)))))

(declare-fun res!83258 () Bool)

(declare-fun e!115924 () Bool)

(assert (=> start!17534 (=> (not res!83258) (not e!115924))))

(declare-fun valid!984 (LongMapFixedSize!2334) Bool)

(assert (=> start!17534 (= res!83258 (valid!984 thiss!1248))))

(assert (=> start!17534 e!115924))

(declare-fun e!115923 () Bool)

(assert (=> start!17534 e!115923))

(assert (=> start!17534 true))

(declare-fun tp_is_empty!4113 () Bool)

(declare-fun array_inv!2239 (array!7367) Bool)

(declare-fun array_inv!2240 (array!7369) Bool)

(assert (=> b!175629 (= e!115923 (and tp!15706 tp_is_empty!4113 (array_inv!2239 (_keys!5476 thiss!1248)) (array_inv!2240 (_values!3606 thiss!1248)) e!115921))))

(declare-fun b!175630 () Bool)

(declare-fun e!115922 () Bool)

(assert (=> b!175630 (= e!115922 tp_is_empty!4113)))

(declare-fun b!175631 () Bool)

(declare-fun res!83260 () Bool)

(assert (=> b!175631 (=> (not res!83260) (not e!115924))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3268 0))(
  ( (tuple2!3269 (_1!1645 (_ BitVec 64)) (_2!1645 V!5131)) )
))
(declare-datatypes ((List!2225 0))(
  ( (Nil!2222) (Cons!2221 (h!2840 tuple2!3268) (t!7045 List!2225)) )
))
(declare-datatypes ((ListLongMap!2195 0))(
  ( (ListLongMap!2196 (toList!1113 List!2225)) )
))
(declare-fun contains!1173 (ListLongMap!2195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!765 (array!7367 array!7369 (_ BitVec 32) (_ BitVec 32) V!5131 V!5131 (_ BitVec 32) Int) ListLongMap!2195)

(assert (=> b!175631 (= res!83260 (contains!1173 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)) key!828))))

(declare-fun b!175632 () Bool)

(declare-fun res!83256 () Bool)

(assert (=> b!175632 (=> (not res!83256) (not e!115924))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!552 0))(
  ( (MissingZero!552 (index!4376 (_ BitVec 32))) (Found!552 (index!4377 (_ BitVec 32))) (Intermediate!552 (undefined!1364 Bool) (index!4378 (_ BitVec 32)) (x!19310 (_ BitVec 32))) (Undefined!552) (MissingVacant!552 (index!4379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7367 (_ BitVec 32)) SeekEntryResult!552)

(assert (=> b!175632 (= res!83256 ((_ is Undefined!552) (seekEntryOrOpen!0 key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248))))))

(declare-fun mapIsEmpty!7015 () Bool)

(assert (=> mapIsEmpty!7015 mapRes!7015))

(declare-fun b!175633 () Bool)

(assert (=> b!175633 (= e!115920 tp_is_empty!4113)))

(declare-fun b!175634 () Bool)

(assert (=> b!175634 (= e!115924 (and (= (size!3800 (_values!3606 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8524 thiss!1248))) (= (size!3799 (_keys!5476 thiss!1248)) (size!3800 (_values!3606 thiss!1248))) (bvsge (mask!8524 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3360 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175635 () Bool)

(declare-fun res!83259 () Bool)

(assert (=> b!175635 (=> (not res!83259) (not e!115924))))

(assert (=> b!175635 (= res!83259 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7015 () Bool)

(declare-fun tp!15705 () Bool)

(assert (=> mapNonEmpty!7015 (= mapRes!7015 (and tp!15705 e!115922))))

(declare-fun mapKey!7015 () (_ BitVec 32))

(declare-fun mapRest!7015 () (Array (_ BitVec 32) ValueCell!1713))

(declare-fun mapValue!7015 () ValueCell!1713)

(assert (=> mapNonEmpty!7015 (= (arr!3498 (_values!3606 thiss!1248)) (store mapRest!7015 mapKey!7015 mapValue!7015))))

(declare-fun b!175636 () Bool)

(declare-fun res!83257 () Bool)

(assert (=> b!175636 (=> (not res!83257) (not e!115924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175636 (= res!83257 (validMask!0 (mask!8524 thiss!1248)))))

(assert (= (and start!17534 res!83258) b!175635))

(assert (= (and b!175635 res!83259) b!175632))

(assert (= (and b!175632 res!83256) b!175631))

(assert (= (and b!175631 res!83260) b!175636))

(assert (= (and b!175636 res!83257) b!175634))

(assert (= (and b!175628 condMapEmpty!7015) mapIsEmpty!7015))

(assert (= (and b!175628 (not condMapEmpty!7015)) mapNonEmpty!7015))

(assert (= (and mapNonEmpty!7015 ((_ is ValueCellFull!1713) mapValue!7015)) b!175630))

(assert (= (and b!175628 ((_ is ValueCellFull!1713) mapDefault!7015)) b!175633))

(assert (= b!175629 b!175628))

(assert (= start!17534 b!175629))

(declare-fun m!204517 () Bool)

(assert (=> b!175629 m!204517))

(declare-fun m!204519 () Bool)

(assert (=> b!175629 m!204519))

(declare-fun m!204521 () Bool)

(assert (=> mapNonEmpty!7015 m!204521))

(declare-fun m!204523 () Bool)

(assert (=> start!17534 m!204523))

(declare-fun m!204525 () Bool)

(assert (=> b!175632 m!204525))

(declare-fun m!204527 () Bool)

(assert (=> b!175636 m!204527))

(declare-fun m!204529 () Bool)

(assert (=> b!175631 m!204529))

(assert (=> b!175631 m!204529))

(declare-fun m!204531 () Bool)

(assert (=> b!175631 m!204531))

(check-sat (not b!175636) (not mapNonEmpty!7015) (not b_next!4341) b_and!10823 (not b!175629) tp_is_empty!4113 (not b!175631) (not b!175632) (not start!17534))
(check-sat b_and!10823 (not b_next!4341))
(get-model)

(declare-fun d!53489 () Bool)

(declare-fun res!83282 () Bool)

(declare-fun e!115945 () Bool)

(assert (=> d!53489 (=> (not res!83282) (not e!115945))))

(declare-fun simpleValid!149 (LongMapFixedSize!2334) Bool)

(assert (=> d!53489 (= res!83282 (simpleValid!149 thiss!1248))))

(assert (=> d!53489 (= (valid!984 thiss!1248) e!115945)))

(declare-fun b!175670 () Bool)

(declare-fun res!83283 () Bool)

(assert (=> b!175670 (=> (not res!83283) (not e!115945))))

(declare-fun arrayCountValidKeys!0 (array!7367 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175670 (= res!83283 (= (arrayCountValidKeys!0 (_keys!5476 thiss!1248) #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))) (_size!1216 thiss!1248)))))

(declare-fun b!175671 () Bool)

(declare-fun res!83284 () Bool)

(assert (=> b!175671 (=> (not res!83284) (not e!115945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7367 (_ BitVec 32)) Bool)

(assert (=> b!175671 (= res!83284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)))))

(declare-fun b!175672 () Bool)

(declare-datatypes ((List!2226 0))(
  ( (Nil!2223) (Cons!2222 (h!2841 (_ BitVec 64)) (t!7048 List!2226)) )
))
(declare-fun arrayNoDuplicates!0 (array!7367 (_ BitVec 32) List!2226) Bool)

(assert (=> b!175672 (= e!115945 (arrayNoDuplicates!0 (_keys!5476 thiss!1248) #b00000000000000000000000000000000 Nil!2223))))

(assert (= (and d!53489 res!83282) b!175670))

(assert (= (and b!175670 res!83283) b!175671))

(assert (= (and b!175671 res!83284) b!175672))

(declare-fun m!204549 () Bool)

(assert (=> d!53489 m!204549))

(declare-fun m!204551 () Bool)

(assert (=> b!175670 m!204551))

(declare-fun m!204553 () Bool)

(assert (=> b!175671 m!204553))

(declare-fun m!204555 () Bool)

(assert (=> b!175672 m!204555))

(assert (=> start!17534 d!53489))

(declare-fun b!175685 () Bool)

(declare-fun e!115954 () SeekEntryResult!552)

(declare-fun e!115952 () SeekEntryResult!552)

(assert (=> b!175685 (= e!115954 e!115952)))

(declare-fun lt!86892 () (_ BitVec 64))

(declare-fun lt!86893 () SeekEntryResult!552)

(assert (=> b!175685 (= lt!86892 (select (arr!3497 (_keys!5476 thiss!1248)) (index!4378 lt!86893)))))

(declare-fun c!31465 () Bool)

(assert (=> b!175685 (= c!31465 (= lt!86892 key!828))))

(declare-fun b!175686 () Bool)

(assert (=> b!175686 (= e!115954 Undefined!552)))

(declare-fun d!53491 () Bool)

(declare-fun lt!86894 () SeekEntryResult!552)

(assert (=> d!53491 (and (or ((_ is Undefined!552) lt!86894) (not ((_ is Found!552) lt!86894)) (and (bvsge (index!4377 lt!86894) #b00000000000000000000000000000000) (bvslt (index!4377 lt!86894) (size!3799 (_keys!5476 thiss!1248))))) (or ((_ is Undefined!552) lt!86894) ((_ is Found!552) lt!86894) (not ((_ is MissingZero!552) lt!86894)) (and (bvsge (index!4376 lt!86894) #b00000000000000000000000000000000) (bvslt (index!4376 lt!86894) (size!3799 (_keys!5476 thiss!1248))))) (or ((_ is Undefined!552) lt!86894) ((_ is Found!552) lt!86894) ((_ is MissingZero!552) lt!86894) (not ((_ is MissingVacant!552) lt!86894)) (and (bvsge (index!4379 lt!86894) #b00000000000000000000000000000000) (bvslt (index!4379 lt!86894) (size!3799 (_keys!5476 thiss!1248))))) (or ((_ is Undefined!552) lt!86894) (ite ((_ is Found!552) lt!86894) (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4377 lt!86894)) key!828) (ite ((_ is MissingZero!552) lt!86894) (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4376 lt!86894)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!552) lt!86894) (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4379 lt!86894)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53491 (= lt!86894 e!115954)))

(declare-fun c!31466 () Bool)

(assert (=> d!53491 (= c!31466 (and ((_ is Intermediate!552) lt!86893) (undefined!1364 lt!86893)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7367 (_ BitVec 32)) SeekEntryResult!552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53491 (= lt!86893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8524 thiss!1248)) key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)))))

(assert (=> d!53491 (validMask!0 (mask!8524 thiss!1248))))

(assert (=> d!53491 (= (seekEntryOrOpen!0 key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)) lt!86894)))

(declare-fun b!175687 () Bool)

(declare-fun c!31464 () Bool)

(assert (=> b!175687 (= c!31464 (= lt!86892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115953 () SeekEntryResult!552)

(assert (=> b!175687 (= e!115952 e!115953)))

(declare-fun b!175688 () Bool)

(assert (=> b!175688 (= e!115953 (MissingZero!552 (index!4378 lt!86893)))))

(declare-fun b!175689 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7367 (_ BitVec 32)) SeekEntryResult!552)

(assert (=> b!175689 (= e!115953 (seekKeyOrZeroReturnVacant!0 (x!19310 lt!86893) (index!4378 lt!86893) (index!4378 lt!86893) key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)))))

(declare-fun b!175690 () Bool)

(assert (=> b!175690 (= e!115952 (Found!552 (index!4378 lt!86893)))))

(assert (= (and d!53491 c!31466) b!175686))

(assert (= (and d!53491 (not c!31466)) b!175685))

(assert (= (and b!175685 c!31465) b!175690))

(assert (= (and b!175685 (not c!31465)) b!175687))

(assert (= (and b!175687 c!31464) b!175688))

(assert (= (and b!175687 (not c!31464)) b!175689))

(declare-fun m!204557 () Bool)

(assert (=> b!175685 m!204557))

(declare-fun m!204559 () Bool)

(assert (=> d!53491 m!204559))

(declare-fun m!204561 () Bool)

(assert (=> d!53491 m!204561))

(declare-fun m!204563 () Bool)

(assert (=> d!53491 m!204563))

(assert (=> d!53491 m!204561))

(declare-fun m!204565 () Bool)

(assert (=> d!53491 m!204565))

(assert (=> d!53491 m!204527))

(declare-fun m!204567 () Bool)

(assert (=> d!53491 m!204567))

(declare-fun m!204569 () Bool)

(assert (=> b!175689 m!204569))

(assert (=> b!175632 d!53491))

(declare-fun d!53493 () Bool)

(declare-fun e!115959 () Bool)

(assert (=> d!53493 e!115959))

(declare-fun res!83287 () Bool)

(assert (=> d!53493 (=> res!83287 e!115959)))

(declare-fun lt!86904 () Bool)

(assert (=> d!53493 (= res!83287 (not lt!86904))))

(declare-fun lt!86905 () Bool)

(assert (=> d!53493 (= lt!86904 lt!86905)))

(declare-datatypes ((Unit!5388 0))(
  ( (Unit!5389) )
))
(declare-fun lt!86903 () Unit!5388)

(declare-fun e!115960 () Unit!5388)

(assert (=> d!53493 (= lt!86903 e!115960)))

(declare-fun c!31469 () Bool)

(assert (=> d!53493 (= c!31469 lt!86905)))

(declare-fun containsKey!194 (List!2225 (_ BitVec 64)) Bool)

(assert (=> d!53493 (= lt!86905 (containsKey!194 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))

(assert (=> d!53493 (= (contains!1173 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)) key!828) lt!86904)))

(declare-fun b!175697 () Bool)

(declare-fun lt!86906 () Unit!5388)

(assert (=> b!175697 (= e!115960 lt!86906)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!142 (List!2225 (_ BitVec 64)) Unit!5388)

(assert (=> b!175697 (= lt!86906 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))

(declare-datatypes ((Option!196 0))(
  ( (Some!195 (v!3978 V!5131)) (None!194) )
))
(declare-fun isDefined!143 (Option!196) Bool)

(declare-fun getValueByKey!190 (List!2225 (_ BitVec 64)) Option!196)

(assert (=> b!175697 (isDefined!143 (getValueByKey!190 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))

(declare-fun b!175698 () Bool)

(declare-fun Unit!5390 () Unit!5388)

(assert (=> b!175698 (= e!115960 Unit!5390)))

(declare-fun b!175699 () Bool)

(assert (=> b!175699 (= e!115959 (isDefined!143 (getValueByKey!190 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828)))))

(assert (= (and d!53493 c!31469) b!175697))

(assert (= (and d!53493 (not c!31469)) b!175698))

(assert (= (and d!53493 (not res!83287)) b!175699))

(declare-fun m!204571 () Bool)

(assert (=> d!53493 m!204571))

(declare-fun m!204573 () Bool)

(assert (=> b!175697 m!204573))

(declare-fun m!204575 () Bool)

(assert (=> b!175697 m!204575))

(assert (=> b!175697 m!204575))

(declare-fun m!204577 () Bool)

(assert (=> b!175697 m!204577))

(assert (=> b!175699 m!204575))

(assert (=> b!175699 m!204575))

(assert (=> b!175699 m!204577))

(assert (=> b!175631 d!53493))

(declare-fun call!17798 () ListLongMap!2195)

(declare-fun c!31484 () Bool)

(declare-fun bm!17791 () Bool)

(declare-fun c!31482 () Bool)

(declare-fun call!17794 () ListLongMap!2195)

(declare-fun call!17797 () ListLongMap!2195)

(declare-fun call!17796 () ListLongMap!2195)

(declare-fun +!252 (ListLongMap!2195 tuple2!3268) ListLongMap!2195)

(assert (=> bm!17791 (= call!17798 (+!252 (ite c!31482 call!17794 (ite c!31484 call!17796 call!17797)) (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))

(declare-fun bm!17792 () Bool)

(assert (=> bm!17792 (= call!17797 call!17796)))

(declare-fun bm!17793 () Bool)

(declare-fun call!17800 () Bool)

(declare-fun lt!86959 () ListLongMap!2195)

(assert (=> bm!17793 (= call!17800 (contains!1173 lt!86959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17794 () Bool)

(assert (=> bm!17794 (= call!17796 call!17794)))

(declare-fun b!175742 () Bool)

(declare-fun c!31487 () Bool)

(assert (=> b!175742 (= c!31487 (and (not (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115997 () ListLongMap!2195)

(declare-fun e!115988 () ListLongMap!2195)

(assert (=> b!175742 (= e!115997 e!115988)))

(declare-fun b!175743 () Bool)

(declare-fun e!115993 () Bool)

(declare-fun e!115989 () Bool)

(assert (=> b!175743 (= e!115993 e!115989)))

(declare-fun c!31485 () Bool)

(assert (=> b!175743 (= c!31485 (not (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175744 () Bool)

(declare-fun e!115991 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175744 (= e!115991 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175745 () Bool)

(declare-fun e!115995 () Bool)

(declare-fun apply!135 (ListLongMap!2195 (_ BitVec 64)) V!5131)

(assert (=> b!175745 (= e!115995 (= (apply!135 lt!86959 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3464 thiss!1248)))))

(declare-fun b!175746 () Bool)

(declare-fun e!115992 () Bool)

(assert (=> b!175746 (= e!115992 e!115995)))

(declare-fun res!83310 () Bool)

(assert (=> b!175746 (= res!83310 call!17800)))

(assert (=> b!175746 (=> (not res!83310) (not e!115995))))

(declare-fun b!175747 () Bool)

(declare-fun e!115990 () Bool)

(declare-fun e!115987 () Bool)

(assert (=> b!175747 (= e!115990 e!115987)))

(declare-fun res!83308 () Bool)

(assert (=> b!175747 (=> (not res!83308) (not e!115987))))

(assert (=> b!175747 (= res!83308 (contains!1173 lt!86959 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun bm!17795 () Bool)

(declare-fun call!17795 () ListLongMap!2195)

(assert (=> bm!17795 (= call!17795 call!17798)))

(declare-fun bm!17796 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!168 (array!7367 array!7369 (_ BitVec 32) (_ BitVec 32) V!5131 V!5131 (_ BitVec 32) Int) ListLongMap!2195)

(assert (=> bm!17796 (= call!17794 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))

(declare-fun b!175748 () Bool)

(declare-fun get!1992 (ValueCell!1713 V!5131) V!5131)

(declare-fun dynLambda!478 (Int (_ BitVec 64)) V!5131)

(assert (=> b!175748 (= e!115987 (= (apply!135 lt!86959 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)) (get!1992 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3800 (_values!3606 thiss!1248))))))

(assert (=> b!175748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun b!175749 () Bool)

(declare-fun res!83306 () Bool)

(assert (=> b!175749 (=> (not res!83306) (not e!115993))))

(assert (=> b!175749 (= res!83306 e!115992)))

(declare-fun c!31483 () Bool)

(assert (=> b!175749 (= c!31483 (not (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!175750 () Bool)

(declare-fun e!115998 () Bool)

(assert (=> b!175750 (= e!115998 (= (apply!135 lt!86959 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3464 thiss!1248)))))

(declare-fun b!175751 () Bool)

(declare-fun e!115999 () ListLongMap!2195)

(assert (=> b!175751 (= e!115999 e!115997)))

(assert (=> b!175751 (= c!31484 (and (not (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175752 () Bool)

(declare-fun e!115994 () Unit!5388)

(declare-fun lt!86971 () Unit!5388)

(assert (=> b!175752 (= e!115994 lt!86971)))

(declare-fun lt!86964 () ListLongMap!2195)

(assert (=> b!175752 (= lt!86964 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))

(declare-fun lt!86953 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86966 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86966 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86957 () Unit!5388)

(declare-fun addStillContains!111 (ListLongMap!2195 (_ BitVec 64) V!5131 (_ BitVec 64)) Unit!5388)

(assert (=> b!175752 (= lt!86957 (addStillContains!111 lt!86964 lt!86953 (zeroValue!3464 thiss!1248) lt!86966))))

(assert (=> b!175752 (contains!1173 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))) lt!86966)))

(declare-fun lt!86970 () Unit!5388)

(assert (=> b!175752 (= lt!86970 lt!86957)))

(declare-fun lt!86958 () ListLongMap!2195)

(assert (=> b!175752 (= lt!86958 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))

(declare-fun lt!86954 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86954 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86969 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86969 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86972 () Unit!5388)

(declare-fun addApplyDifferent!111 (ListLongMap!2195 (_ BitVec 64) V!5131 (_ BitVec 64)) Unit!5388)

(assert (=> b!175752 (= lt!86972 (addApplyDifferent!111 lt!86958 lt!86954 (minValue!3464 thiss!1248) lt!86969))))

(assert (=> b!175752 (= (apply!135 (+!252 lt!86958 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))) lt!86969) (apply!135 lt!86958 lt!86969))))

(declare-fun lt!86955 () Unit!5388)

(assert (=> b!175752 (= lt!86955 lt!86972)))

(declare-fun lt!86963 () ListLongMap!2195)

(assert (=> b!175752 (= lt!86963 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))

(declare-fun lt!86956 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86961 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86961 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86965 () Unit!5388)

(assert (=> b!175752 (= lt!86965 (addApplyDifferent!111 lt!86963 lt!86956 (zeroValue!3464 thiss!1248) lt!86961))))

(assert (=> b!175752 (= (apply!135 (+!252 lt!86963 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))) lt!86961) (apply!135 lt!86963 lt!86961))))

(declare-fun lt!86967 () Unit!5388)

(assert (=> b!175752 (= lt!86967 lt!86965)))

(declare-fun lt!86962 () ListLongMap!2195)

(assert (=> b!175752 (= lt!86962 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))

(declare-fun lt!86960 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86960 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86968 () (_ BitVec 64))

(assert (=> b!175752 (= lt!86968 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175752 (= lt!86971 (addApplyDifferent!111 lt!86962 lt!86960 (minValue!3464 thiss!1248) lt!86968))))

(assert (=> b!175752 (= (apply!135 (+!252 lt!86962 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))) lt!86968) (apply!135 lt!86962 lt!86968))))

(declare-fun b!175753 () Bool)

(declare-fun e!115996 () Bool)

(assert (=> b!175753 (= e!115996 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53495 () Bool)

(assert (=> d!53495 e!115993))

(declare-fun res!83312 () Bool)

(assert (=> d!53495 (=> (not res!83312) (not e!115993))))

(assert (=> d!53495 (= res!83312 (or (bvsge #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))))

(declare-fun lt!86952 () ListLongMap!2195)

(assert (=> d!53495 (= lt!86959 lt!86952)))

(declare-fun lt!86951 () Unit!5388)

(assert (=> d!53495 (= lt!86951 e!115994)))

(declare-fun c!31486 () Bool)

(assert (=> d!53495 (= c!31486 e!115996)))

(declare-fun res!83313 () Bool)

(assert (=> d!53495 (=> (not res!83313) (not e!115996))))

(assert (=> d!53495 (= res!83313 (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> d!53495 (= lt!86952 e!115999)))

(assert (=> d!53495 (= c!31482 (and (not (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3360 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53495 (validMask!0 (mask!8524 thiss!1248))))

(assert (=> d!53495 (= (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)) lt!86959)))

(declare-fun b!175754 () Bool)

(assert (=> b!175754 (= e!115988 call!17795)))

(declare-fun b!175755 () Bool)

(assert (=> b!175755 (= e!115992 (not call!17800))))

(declare-fun b!175756 () Bool)

(assert (=> b!175756 (= e!115999 (+!252 call!17798 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))

(declare-fun b!175757 () Bool)

(assert (=> b!175757 (= e!115988 call!17797)))

(declare-fun b!175758 () Bool)

(assert (=> b!175758 (= e!115997 call!17795)))

(declare-fun b!175759 () Bool)

(declare-fun res!83309 () Bool)

(assert (=> b!175759 (=> (not res!83309) (not e!115993))))

(assert (=> b!175759 (= res!83309 e!115990)))

(declare-fun res!83314 () Bool)

(assert (=> b!175759 (=> res!83314 e!115990)))

(assert (=> b!175759 (= res!83314 (not e!115991))))

(declare-fun res!83311 () Bool)

(assert (=> b!175759 (=> (not res!83311) (not e!115991))))

(assert (=> b!175759 (= res!83311 (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun b!175760 () Bool)

(assert (=> b!175760 (= e!115989 e!115998)))

(declare-fun res!83307 () Bool)

(declare-fun call!17799 () Bool)

(assert (=> b!175760 (= res!83307 call!17799)))

(assert (=> b!175760 (=> (not res!83307) (not e!115998))))

(declare-fun b!175761 () Bool)

(assert (=> b!175761 (= e!115989 (not call!17799))))

(declare-fun b!175762 () Bool)

(declare-fun Unit!5391 () Unit!5388)

(assert (=> b!175762 (= e!115994 Unit!5391)))

(declare-fun bm!17797 () Bool)

(assert (=> bm!17797 (= call!17799 (contains!1173 lt!86959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53495 c!31482) b!175756))

(assert (= (and d!53495 (not c!31482)) b!175751))

(assert (= (and b!175751 c!31484) b!175758))

(assert (= (and b!175751 (not c!31484)) b!175742))

(assert (= (and b!175742 c!31487) b!175754))

(assert (= (and b!175742 (not c!31487)) b!175757))

(assert (= (or b!175754 b!175757) bm!17792))

(assert (= (or b!175758 bm!17792) bm!17794))

(assert (= (or b!175758 b!175754) bm!17795))

(assert (= (or b!175756 bm!17794) bm!17796))

(assert (= (or b!175756 bm!17795) bm!17791))

(assert (= (and d!53495 res!83313) b!175753))

(assert (= (and d!53495 c!31486) b!175752))

(assert (= (and d!53495 (not c!31486)) b!175762))

(assert (= (and d!53495 res!83312) b!175759))

(assert (= (and b!175759 res!83311) b!175744))

(assert (= (and b!175759 (not res!83314)) b!175747))

(assert (= (and b!175747 res!83308) b!175748))

(assert (= (and b!175759 res!83309) b!175749))

(assert (= (and b!175749 c!31483) b!175746))

(assert (= (and b!175749 (not c!31483)) b!175755))

(assert (= (and b!175746 res!83310) b!175745))

(assert (= (or b!175746 b!175755) bm!17793))

(assert (= (and b!175749 res!83306) b!175743))

(assert (= (and b!175743 c!31485) b!175760))

(assert (= (and b!175743 (not c!31485)) b!175761))

(assert (= (and b!175760 res!83307) b!175750))

(assert (= (or b!175760 b!175761) bm!17797))

(declare-fun b_lambda!7015 () Bool)

(assert (=> (not b_lambda!7015) (not b!175748)))

(declare-fun t!7047 () Bool)

(declare-fun tb!2781 () Bool)

(assert (=> (and b!175629 (= (defaultEntry!3623 thiss!1248) (defaultEntry!3623 thiss!1248)) t!7047) tb!2781))

(declare-fun result!4617 () Bool)

(assert (=> tb!2781 (= result!4617 tp_is_empty!4113)))

(assert (=> b!175748 t!7047))

(declare-fun b_and!10827 () Bool)

(assert (= b_and!10823 (and (=> t!7047 result!4617) b_and!10827)))

(declare-fun m!204579 () Bool)

(assert (=> b!175745 m!204579))

(declare-fun m!204581 () Bool)

(assert (=> b!175752 m!204581))

(declare-fun m!204583 () Bool)

(assert (=> b!175752 m!204583))

(declare-fun m!204585 () Bool)

(assert (=> b!175752 m!204585))

(declare-fun m!204587 () Bool)

(assert (=> b!175752 m!204587))

(declare-fun m!204589 () Bool)

(assert (=> b!175752 m!204589))

(declare-fun m!204591 () Bool)

(assert (=> b!175752 m!204591))

(assert (=> b!175752 m!204585))

(declare-fun m!204593 () Bool)

(assert (=> b!175752 m!204593))

(declare-fun m!204595 () Bool)

(assert (=> b!175752 m!204595))

(declare-fun m!204597 () Bool)

(assert (=> b!175752 m!204597))

(declare-fun m!204599 () Bool)

(assert (=> b!175752 m!204599))

(declare-fun m!204601 () Bool)

(assert (=> b!175752 m!204601))

(declare-fun m!204603 () Bool)

(assert (=> b!175752 m!204603))

(declare-fun m!204605 () Bool)

(assert (=> b!175752 m!204605))

(declare-fun m!204607 () Bool)

(assert (=> b!175752 m!204607))

(declare-fun m!204609 () Bool)

(assert (=> b!175752 m!204609))

(assert (=> b!175752 m!204597))

(declare-fun m!204611 () Bool)

(assert (=> b!175752 m!204611))

(assert (=> b!175752 m!204581))

(assert (=> b!175752 m!204599))

(declare-fun m!204613 () Bool)

(assert (=> b!175752 m!204613))

(declare-fun m!204615 () Bool)

(assert (=> bm!17793 m!204615))

(assert (=> b!175744 m!204603))

(assert (=> b!175744 m!204603))

(declare-fun m!204617 () Bool)

(assert (=> b!175744 m!204617))

(assert (=> d!53495 m!204527))

(assert (=> b!175753 m!204603))

(assert (=> b!175753 m!204603))

(assert (=> b!175753 m!204617))

(declare-fun m!204619 () Bool)

(assert (=> bm!17797 m!204619))

(declare-fun m!204621 () Bool)

(assert (=> bm!17791 m!204621))

(declare-fun m!204623 () Bool)

(assert (=> b!175750 m!204623))

(assert (=> bm!17796 m!204587))

(assert (=> b!175748 m!204603))

(declare-fun m!204625 () Bool)

(assert (=> b!175748 m!204625))

(declare-fun m!204627 () Bool)

(assert (=> b!175748 m!204627))

(assert (=> b!175748 m!204603))

(declare-fun m!204629 () Bool)

(assert (=> b!175748 m!204629))

(assert (=> b!175748 m!204627))

(assert (=> b!175748 m!204625))

(declare-fun m!204631 () Bool)

(assert (=> b!175748 m!204631))

(declare-fun m!204633 () Bool)

(assert (=> b!175756 m!204633))

(assert (=> b!175747 m!204603))

(assert (=> b!175747 m!204603))

(declare-fun m!204635 () Bool)

(assert (=> b!175747 m!204635))

(assert (=> b!175631 d!53495))

(declare-fun d!53497 () Bool)

(assert (=> d!53497 (= (array_inv!2239 (_keys!5476 thiss!1248)) (bvsge (size!3799 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175629 d!53497))

(declare-fun d!53499 () Bool)

(assert (=> d!53499 (= (array_inv!2240 (_values!3606 thiss!1248)) (bvsge (size!3800 (_values!3606 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175629 d!53499))

(declare-fun d!53501 () Bool)

(assert (=> d!53501 (= (validMask!0 (mask!8524 thiss!1248)) (and (or (= (mask!8524 thiss!1248) #b00000000000000000000000000000111) (= (mask!8524 thiss!1248) #b00000000000000000000000000001111) (= (mask!8524 thiss!1248) #b00000000000000000000000000011111) (= (mask!8524 thiss!1248) #b00000000000000000000000000111111) (= (mask!8524 thiss!1248) #b00000000000000000000000001111111) (= (mask!8524 thiss!1248) #b00000000000000000000000011111111) (= (mask!8524 thiss!1248) #b00000000000000000000000111111111) (= (mask!8524 thiss!1248) #b00000000000000000000001111111111) (= (mask!8524 thiss!1248) #b00000000000000000000011111111111) (= (mask!8524 thiss!1248) #b00000000000000000000111111111111) (= (mask!8524 thiss!1248) #b00000000000000000001111111111111) (= (mask!8524 thiss!1248) #b00000000000000000011111111111111) (= (mask!8524 thiss!1248) #b00000000000000000111111111111111) (= (mask!8524 thiss!1248) #b00000000000000001111111111111111) (= (mask!8524 thiss!1248) #b00000000000000011111111111111111) (= (mask!8524 thiss!1248) #b00000000000000111111111111111111) (= (mask!8524 thiss!1248) #b00000000000001111111111111111111) (= (mask!8524 thiss!1248) #b00000000000011111111111111111111) (= (mask!8524 thiss!1248) #b00000000000111111111111111111111) (= (mask!8524 thiss!1248) #b00000000001111111111111111111111) (= (mask!8524 thiss!1248) #b00000000011111111111111111111111) (= (mask!8524 thiss!1248) #b00000000111111111111111111111111) (= (mask!8524 thiss!1248) #b00000001111111111111111111111111) (= (mask!8524 thiss!1248) #b00000011111111111111111111111111) (= (mask!8524 thiss!1248) #b00000111111111111111111111111111) (= (mask!8524 thiss!1248) #b00001111111111111111111111111111) (= (mask!8524 thiss!1248) #b00011111111111111111111111111111) (= (mask!8524 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8524 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175636 d!53501))

(declare-fun b!175771 () Bool)

(declare-fun e!116004 () Bool)

(assert (=> b!175771 (= e!116004 tp_is_empty!4113)))

(declare-fun condMapEmpty!7021 () Bool)

(declare-fun mapDefault!7021 () ValueCell!1713)

(assert (=> mapNonEmpty!7015 (= condMapEmpty!7021 (= mapRest!7015 ((as const (Array (_ BitVec 32) ValueCell!1713)) mapDefault!7021)))))

(declare-fun e!116005 () Bool)

(declare-fun mapRes!7021 () Bool)

(assert (=> mapNonEmpty!7015 (= tp!15705 (and e!116005 mapRes!7021))))

(declare-fun b!175772 () Bool)

(assert (=> b!175772 (= e!116005 tp_is_empty!4113)))

(declare-fun mapIsEmpty!7021 () Bool)

(assert (=> mapIsEmpty!7021 mapRes!7021))

(declare-fun mapNonEmpty!7021 () Bool)

(declare-fun tp!15715 () Bool)

(assert (=> mapNonEmpty!7021 (= mapRes!7021 (and tp!15715 e!116004))))

(declare-fun mapValue!7021 () ValueCell!1713)

(declare-fun mapRest!7021 () (Array (_ BitVec 32) ValueCell!1713))

(declare-fun mapKey!7021 () (_ BitVec 32))

(assert (=> mapNonEmpty!7021 (= mapRest!7015 (store mapRest!7021 mapKey!7021 mapValue!7021))))

(assert (= (and mapNonEmpty!7015 condMapEmpty!7021) mapIsEmpty!7021))

(assert (= (and mapNonEmpty!7015 (not condMapEmpty!7021)) mapNonEmpty!7021))

(assert (= (and mapNonEmpty!7021 ((_ is ValueCellFull!1713) mapValue!7021)) b!175771))

(assert (= (and mapNonEmpty!7015 ((_ is ValueCellFull!1713) mapDefault!7021)) b!175772))

(declare-fun m!204637 () Bool)

(assert (=> mapNonEmpty!7021 m!204637))

(declare-fun b_lambda!7017 () Bool)

(assert (= b_lambda!7015 (or (and b!175629 b_free!4341) b_lambda!7017)))

(check-sat (not d!53495) (not d!53489) (not b_lambda!7017) (not b!175671) (not bm!17797) (not b_next!4341) (not b!175748) (not b!175689) (not b!175670) (not b!175672) (not b!175752) (not bm!17793) (not b!175697) (not d!53493) (not b!175744) (not b!175756) (not bm!17796) (not b!175750) (not b!175745) (not bm!17791) b_and!10827 (not b!175753) tp_is_empty!4113 (not mapNonEmpty!7021) (not b!175747) (not b!175699) (not d!53491))
(check-sat b_and!10827 (not b_next!4341))
(get-model)

(declare-fun b!175791 () Bool)

(declare-fun e!116020 () SeekEntryResult!552)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175791 (= e!116020 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8524 thiss!1248)) #b00000000000000000000000000000000 (mask!8524 thiss!1248)) key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)))))

(declare-fun b!175792 () Bool)

(declare-fun lt!86978 () SeekEntryResult!552)

(assert (=> b!175792 (and (bvsge (index!4378 lt!86978) #b00000000000000000000000000000000) (bvslt (index!4378 lt!86978) (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun e!116016 () Bool)

(assert (=> b!175792 (= e!116016 (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4378 lt!86978)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53503 () Bool)

(declare-fun e!116019 () Bool)

(assert (=> d!53503 e!116019))

(declare-fun c!31494 () Bool)

(assert (=> d!53503 (= c!31494 (and ((_ is Intermediate!552) lt!86978) (undefined!1364 lt!86978)))))

(declare-fun e!116017 () SeekEntryResult!552)

(assert (=> d!53503 (= lt!86978 e!116017)))

(declare-fun c!31496 () Bool)

(assert (=> d!53503 (= c!31496 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!86977 () (_ BitVec 64))

(assert (=> d!53503 (= lt!86977 (select (arr!3497 (_keys!5476 thiss!1248)) (toIndex!0 key!828 (mask!8524 thiss!1248))))))

(assert (=> d!53503 (validMask!0 (mask!8524 thiss!1248))))

(assert (=> d!53503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8524 thiss!1248)) key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)) lt!86978)))

(declare-fun b!175793 () Bool)

(assert (=> b!175793 (= e!116017 e!116020)))

(declare-fun c!31495 () Bool)

(assert (=> b!175793 (= c!31495 (or (= lt!86977 key!828) (= (bvadd lt!86977 lt!86977) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175794 () Bool)

(assert (=> b!175794 (and (bvsge (index!4378 lt!86978) #b00000000000000000000000000000000) (bvslt (index!4378 lt!86978) (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun res!83321 () Bool)

(assert (=> b!175794 (= res!83321 (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4378 lt!86978)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175794 (=> res!83321 e!116016)))

(declare-fun b!175795 () Bool)

(assert (=> b!175795 (= e!116019 (bvsge (x!19310 lt!86978) #b01111111111111111111111111111110))))

(declare-fun b!175796 () Bool)

(assert (=> b!175796 (= e!116017 (Intermediate!552 true (toIndex!0 key!828 (mask!8524 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175797 () Bool)

(declare-fun e!116018 () Bool)

(assert (=> b!175797 (= e!116019 e!116018)))

(declare-fun res!83322 () Bool)

(assert (=> b!175797 (= res!83322 (and ((_ is Intermediate!552) lt!86978) (not (undefined!1364 lt!86978)) (bvslt (x!19310 lt!86978) #b01111111111111111111111111111110) (bvsge (x!19310 lt!86978) #b00000000000000000000000000000000) (bvsge (x!19310 lt!86978) #b00000000000000000000000000000000)))))

(assert (=> b!175797 (=> (not res!83322) (not e!116018))))

(declare-fun b!175798 () Bool)

(assert (=> b!175798 (= e!116020 (Intermediate!552 false (toIndex!0 key!828 (mask!8524 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175799 () Bool)

(assert (=> b!175799 (and (bvsge (index!4378 lt!86978) #b00000000000000000000000000000000) (bvslt (index!4378 lt!86978) (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun res!83323 () Bool)

(assert (=> b!175799 (= res!83323 (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4378 lt!86978)) key!828))))

(assert (=> b!175799 (=> res!83323 e!116016)))

(assert (=> b!175799 (= e!116018 e!116016)))

(assert (= (and d!53503 c!31496) b!175796))

(assert (= (and d!53503 (not c!31496)) b!175793))

(assert (= (and b!175793 c!31495) b!175798))

(assert (= (and b!175793 (not c!31495)) b!175791))

(assert (= (and d!53503 c!31494) b!175795))

(assert (= (and d!53503 (not c!31494)) b!175797))

(assert (= (and b!175797 res!83322) b!175799))

(assert (= (and b!175799 (not res!83323)) b!175794))

(assert (= (and b!175794 (not res!83321)) b!175792))

(declare-fun m!204639 () Bool)

(assert (=> b!175794 m!204639))

(assert (=> d!53503 m!204561))

(declare-fun m!204641 () Bool)

(assert (=> d!53503 m!204641))

(assert (=> d!53503 m!204527))

(assert (=> b!175799 m!204639))

(assert (=> b!175792 m!204639))

(assert (=> b!175791 m!204561))

(declare-fun m!204643 () Bool)

(assert (=> b!175791 m!204643))

(assert (=> b!175791 m!204643))

(declare-fun m!204645 () Bool)

(assert (=> b!175791 m!204645))

(assert (=> d!53491 d!53503))

(declare-fun d!53505 () Bool)

(declare-fun lt!86984 () (_ BitVec 32))

(declare-fun lt!86983 () (_ BitVec 32))

(assert (=> d!53505 (= lt!86984 (bvmul (bvxor lt!86983 (bvlshr lt!86983 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53505 (= lt!86983 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53505 (and (bvsge (mask!8524 thiss!1248) #b00000000000000000000000000000000) (let ((res!83324 (let ((h!2842 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19326 (bvmul (bvxor h!2842 (bvlshr h!2842 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19326 (bvlshr x!19326 #b00000000000000000000000000001101)) (mask!8524 thiss!1248)))))) (and (bvslt res!83324 (bvadd (mask!8524 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83324 #b00000000000000000000000000000000))))))

(assert (=> d!53505 (= (toIndex!0 key!828 (mask!8524 thiss!1248)) (bvand (bvxor lt!86984 (bvlshr lt!86984 #b00000000000000000000000000001101)) (mask!8524 thiss!1248)))))

(assert (=> d!53491 d!53505))

(assert (=> d!53491 d!53501))

(declare-fun bm!17800 () Bool)

(declare-fun call!17803 () Bool)

(assert (=> bm!17800 (= call!17803 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5476 thiss!1248) (mask!8524 thiss!1248)))))

(declare-fun b!175808 () Bool)

(declare-fun e!116029 () Bool)

(assert (=> b!175808 (= e!116029 call!17803)))

(declare-fun b!175809 () Bool)

(declare-fun e!116027 () Bool)

(assert (=> b!175809 (= e!116029 e!116027)))

(declare-fun lt!86992 () (_ BitVec 64))

(assert (=> b!175809 (= lt!86992 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86993 () Unit!5388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7367 (_ BitVec 64) (_ BitVec 32)) Unit!5388)

(assert (=> b!175809 (= lt!86993 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5476 thiss!1248) lt!86992 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!175809 (arrayContainsKey!0 (_keys!5476 thiss!1248) lt!86992 #b00000000000000000000000000000000)))

(declare-fun lt!86991 () Unit!5388)

(assert (=> b!175809 (= lt!86991 lt!86993)))

(declare-fun res!83329 () Bool)

(assert (=> b!175809 (= res!83329 (= (seekEntryOrOpen!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000) (_keys!5476 thiss!1248) (mask!8524 thiss!1248)) (Found!552 #b00000000000000000000000000000000)))))

(assert (=> b!175809 (=> (not res!83329) (not e!116027))))

(declare-fun b!175810 () Bool)

(declare-fun e!116028 () Bool)

(assert (=> b!175810 (= e!116028 e!116029)))

(declare-fun c!31499 () Bool)

(assert (=> b!175810 (= c!31499 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53507 () Bool)

(declare-fun res!83330 () Bool)

(assert (=> d!53507 (=> res!83330 e!116028)))

(assert (=> d!53507 (= res!83330 (bvsge #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> d!53507 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)) e!116028)))

(declare-fun b!175811 () Bool)

(assert (=> b!175811 (= e!116027 call!17803)))

(assert (= (and d!53507 (not res!83330)) b!175810))

(assert (= (and b!175810 c!31499) b!175809))

(assert (= (and b!175810 (not c!31499)) b!175808))

(assert (= (and b!175809 res!83329) b!175811))

(assert (= (or b!175811 b!175808) bm!17800))

(declare-fun m!204647 () Bool)

(assert (=> bm!17800 m!204647))

(assert (=> b!175809 m!204603))

(declare-fun m!204649 () Bool)

(assert (=> b!175809 m!204649))

(declare-fun m!204651 () Bool)

(assert (=> b!175809 m!204651))

(assert (=> b!175809 m!204603))

(declare-fun m!204653 () Bool)

(assert (=> b!175809 m!204653))

(assert (=> b!175810 m!204603))

(assert (=> b!175810 m!204603))

(assert (=> b!175810 m!204617))

(assert (=> b!175671 d!53507))

(declare-fun d!53509 () Bool)

(declare-fun isEmpty!443 (Option!196) Bool)

(assert (=> d!53509 (= (isDefined!143 (getValueByKey!190 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828)) (not (isEmpty!443 (getValueByKey!190 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))))

(declare-fun bs!7247 () Bool)

(assert (= bs!7247 d!53509))

(assert (=> bs!7247 m!204575))

(declare-fun m!204655 () Bool)

(assert (=> bs!7247 m!204655))

(assert (=> b!175699 d!53509))

(declare-fun b!175823 () Bool)

(declare-fun e!116035 () Option!196)

(assert (=> b!175823 (= e!116035 None!194)))

(declare-fun d!53511 () Bool)

(declare-fun c!31504 () Bool)

(assert (=> d!53511 (= c!31504 (and ((_ is Cons!2221) (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))) (= (_1!1645 (h!2840 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))))) key!828)))))

(declare-fun e!116034 () Option!196)

(assert (=> d!53511 (= (getValueByKey!190 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828) e!116034)))

(declare-fun b!175821 () Bool)

(assert (=> b!175821 (= e!116034 e!116035)))

(declare-fun c!31505 () Bool)

(assert (=> b!175821 (= c!31505 (and ((_ is Cons!2221) (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))) (not (= (_1!1645 (h!2840 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))))) key!828))))))

(declare-fun b!175822 () Bool)

(assert (=> b!175822 (= e!116035 (getValueByKey!190 (t!7045 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))) key!828))))

(declare-fun b!175820 () Bool)

(assert (=> b!175820 (= e!116034 (Some!195 (_2!1645 (h!2840 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))))))

(assert (= (and d!53511 c!31504) b!175820))

(assert (= (and d!53511 (not c!31504)) b!175821))

(assert (= (and b!175821 c!31505) b!175822))

(assert (= (and b!175821 (not c!31505)) b!175823))

(declare-fun m!204657 () Bool)

(assert (=> b!175822 m!204657))

(assert (=> b!175699 d!53511))

(declare-fun d!53513 () Bool)

(declare-fun e!116038 () Bool)

(assert (=> d!53513 e!116038))

(declare-fun res!83335 () Bool)

(assert (=> d!53513 (=> (not res!83335) (not e!116038))))

(declare-fun lt!87002 () ListLongMap!2195)

(assert (=> d!53513 (= res!83335 (contains!1173 lt!87002 (_1!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))

(declare-fun lt!87003 () List!2225)

(assert (=> d!53513 (= lt!87002 (ListLongMap!2196 lt!87003))))

(declare-fun lt!87005 () Unit!5388)

(declare-fun lt!87004 () Unit!5388)

(assert (=> d!53513 (= lt!87005 lt!87004)))

(assert (=> d!53513 (= (getValueByKey!190 lt!87003 (_1!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!101 (List!2225 (_ BitVec 64) V!5131) Unit!5388)

(assert (=> d!53513 (= lt!87004 (lemmaContainsTupThenGetReturnValue!101 lt!87003 (_1!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))

(declare-fun insertStrictlySorted!104 (List!2225 (_ BitVec 64) V!5131) List!2225)

(assert (=> d!53513 (= lt!87003 (insertStrictlySorted!104 (toList!1113 call!17798) (_1!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))

(assert (=> d!53513 (= (+!252 call!17798 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))) lt!87002)))

(declare-fun b!175828 () Bool)

(declare-fun res!83336 () Bool)

(assert (=> b!175828 (=> (not res!83336) (not e!116038))))

(assert (=> b!175828 (= res!83336 (= (getValueByKey!190 (toList!1113 lt!87002) (_1!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))))

(declare-fun b!175829 () Bool)

(declare-fun contains!1174 (List!2225 tuple2!3268) Bool)

(assert (=> b!175829 (= e!116038 (contains!1174 (toList!1113 lt!87002) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))

(assert (= (and d!53513 res!83335) b!175828))

(assert (= (and b!175828 res!83336) b!175829))

(declare-fun m!204659 () Bool)

(assert (=> d!53513 m!204659))

(declare-fun m!204661 () Bool)

(assert (=> d!53513 m!204661))

(declare-fun m!204663 () Bool)

(assert (=> d!53513 m!204663))

(declare-fun m!204665 () Bool)

(assert (=> d!53513 m!204665))

(declare-fun m!204667 () Bool)

(assert (=> b!175828 m!204667))

(declare-fun m!204669 () Bool)

(assert (=> b!175829 m!204669))

(assert (=> b!175756 d!53513))

(declare-fun d!53515 () Bool)

(declare-fun res!83345 () Bool)

(declare-fun e!116050 () Bool)

(assert (=> d!53515 (=> res!83345 e!116050)))

(assert (=> d!53515 (= res!83345 (bvsge #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> d!53515 (= (arrayNoDuplicates!0 (_keys!5476 thiss!1248) #b00000000000000000000000000000000 Nil!2223) e!116050)))

(declare-fun b!175840 () Bool)

(declare-fun e!116049 () Bool)

(assert (=> b!175840 (= e!116050 e!116049)))

(declare-fun res!83344 () Bool)

(assert (=> b!175840 (=> (not res!83344) (not e!116049))))

(declare-fun e!116047 () Bool)

(assert (=> b!175840 (= res!83344 (not e!116047))))

(declare-fun res!83343 () Bool)

(assert (=> b!175840 (=> (not res!83343) (not e!116047))))

(assert (=> b!175840 (= res!83343 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175841 () Bool)

(declare-fun e!116048 () Bool)

(declare-fun call!17806 () Bool)

(assert (=> b!175841 (= e!116048 call!17806)))

(declare-fun bm!17803 () Bool)

(declare-fun c!31508 () Bool)

(assert (=> bm!17803 (= call!17806 (arrayNoDuplicates!0 (_keys!5476 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31508 (Cons!2222 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000) Nil!2223) Nil!2223)))))

(declare-fun b!175842 () Bool)

(assert (=> b!175842 (= e!116049 e!116048)))

(assert (=> b!175842 (= c!31508 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175843 () Bool)

(assert (=> b!175843 (= e!116048 call!17806)))

(declare-fun b!175844 () Bool)

(declare-fun contains!1175 (List!2226 (_ BitVec 64)) Bool)

(assert (=> b!175844 (= e!116047 (contains!1175 Nil!2223 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53515 (not res!83345)) b!175840))

(assert (= (and b!175840 res!83343) b!175844))

(assert (= (and b!175840 res!83344) b!175842))

(assert (= (and b!175842 c!31508) b!175841))

(assert (= (and b!175842 (not c!31508)) b!175843))

(assert (= (or b!175841 b!175843) bm!17803))

(assert (=> b!175840 m!204603))

(assert (=> b!175840 m!204603))

(assert (=> b!175840 m!204617))

(assert (=> bm!17803 m!204603))

(declare-fun m!204671 () Bool)

(assert (=> bm!17803 m!204671))

(assert (=> b!175842 m!204603))

(assert (=> b!175842 m!204603))

(assert (=> b!175842 m!204617))

(assert (=> b!175844 m!204603))

(assert (=> b!175844 m!204603))

(declare-fun m!204673 () Bool)

(assert (=> b!175844 m!204673))

(assert (=> b!175672 d!53515))

(declare-fun d!53517 () Bool)

(declare-fun e!116051 () Bool)

(assert (=> d!53517 e!116051))

(declare-fun res!83346 () Bool)

(assert (=> d!53517 (=> res!83346 e!116051)))

(declare-fun lt!87007 () Bool)

(assert (=> d!53517 (= res!83346 (not lt!87007))))

(declare-fun lt!87008 () Bool)

(assert (=> d!53517 (= lt!87007 lt!87008)))

(declare-fun lt!87006 () Unit!5388)

(declare-fun e!116052 () Unit!5388)

(assert (=> d!53517 (= lt!87006 e!116052)))

(declare-fun c!31509 () Bool)

(assert (=> d!53517 (= c!31509 lt!87008)))

(assert (=> d!53517 (= lt!87008 (containsKey!194 (toList!1113 lt!86959) (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53517 (= (contains!1173 lt!86959 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)) lt!87007)))

(declare-fun b!175845 () Bool)

(declare-fun lt!87009 () Unit!5388)

(assert (=> b!175845 (= e!116052 lt!87009)))

(assert (=> b!175845 (= lt!87009 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1113 lt!86959) (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175845 (isDefined!143 (getValueByKey!190 (toList!1113 lt!86959) (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175846 () Bool)

(declare-fun Unit!5392 () Unit!5388)

(assert (=> b!175846 (= e!116052 Unit!5392)))

(declare-fun b!175847 () Bool)

(assert (=> b!175847 (= e!116051 (isDefined!143 (getValueByKey!190 (toList!1113 lt!86959) (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53517 c!31509) b!175845))

(assert (= (and d!53517 (not c!31509)) b!175846))

(assert (= (and d!53517 (not res!83346)) b!175847))

(assert (=> d!53517 m!204603))

(declare-fun m!204675 () Bool)

(assert (=> d!53517 m!204675))

(assert (=> b!175845 m!204603))

(declare-fun m!204677 () Bool)

(assert (=> b!175845 m!204677))

(assert (=> b!175845 m!204603))

(declare-fun m!204679 () Bool)

(assert (=> b!175845 m!204679))

(assert (=> b!175845 m!204679))

(declare-fun m!204681 () Bool)

(assert (=> b!175845 m!204681))

(assert (=> b!175847 m!204603))

(assert (=> b!175847 m!204679))

(assert (=> b!175847 m!204679))

(assert (=> b!175847 m!204681))

(assert (=> b!175747 d!53517))

(declare-fun d!53519 () Bool)

(assert (=> d!53519 (= (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175744 d!53519))

(declare-fun d!53521 () Bool)

(assert (=> d!53521 (isDefined!143 (getValueByKey!190 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))

(declare-fun lt!87012 () Unit!5388)

(declare-fun choose!940 (List!2225 (_ BitVec 64)) Unit!5388)

(assert (=> d!53521 (= lt!87012 (choose!940 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))

(declare-fun e!116055 () Bool)

(assert (=> d!53521 e!116055))

(declare-fun res!83349 () Bool)

(assert (=> d!53521 (=> (not res!83349) (not e!116055))))

(declare-fun isStrictlySorted!335 (List!2225) Bool)

(assert (=> d!53521 (= res!83349 (isStrictlySorted!335 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))))))

(assert (=> d!53521 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828) lt!87012)))

(declare-fun b!175850 () Bool)

(assert (=> b!175850 (= e!116055 (containsKey!194 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828))))

(assert (= (and d!53521 res!83349) b!175850))

(assert (=> d!53521 m!204575))

(assert (=> d!53521 m!204575))

(assert (=> d!53521 m!204577))

(declare-fun m!204683 () Bool)

(assert (=> d!53521 m!204683))

(declare-fun m!204685 () Bool)

(assert (=> d!53521 m!204685))

(assert (=> b!175850 m!204571))

(assert (=> b!175697 d!53521))

(assert (=> b!175697 d!53509))

(assert (=> b!175697 d!53511))

(declare-fun d!53523 () Bool)

(declare-fun res!83360 () Bool)

(declare-fun e!116058 () Bool)

(assert (=> d!53523 (=> (not res!83360) (not e!116058))))

(assert (=> d!53523 (= res!83360 (validMask!0 (mask!8524 thiss!1248)))))

(assert (=> d!53523 (= (simpleValid!149 thiss!1248) e!116058)))

(declare-fun b!175861 () Bool)

(declare-fun res!83358 () Bool)

(assert (=> b!175861 (=> (not res!83358) (not e!116058))))

(declare-fun size!3803 (LongMapFixedSize!2334) (_ BitVec 32))

(assert (=> b!175861 (= res!83358 (= (size!3803 thiss!1248) (bvadd (_size!1216 thiss!1248) (bvsdiv (bvadd (extraKeys!3360 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!175859 () Bool)

(declare-fun res!83359 () Bool)

(assert (=> b!175859 (=> (not res!83359) (not e!116058))))

(assert (=> b!175859 (= res!83359 (and (= (size!3800 (_values!3606 thiss!1248)) (bvadd (mask!8524 thiss!1248) #b00000000000000000000000000000001)) (= (size!3799 (_keys!5476 thiss!1248)) (size!3800 (_values!3606 thiss!1248))) (bvsge (_size!1216 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1216 thiss!1248) (bvadd (mask!8524 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!175862 () Bool)

(assert (=> b!175862 (= e!116058 (and (bvsge (extraKeys!3360 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3360 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1216 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175860 () Bool)

(declare-fun res!83361 () Bool)

(assert (=> b!175860 (=> (not res!83361) (not e!116058))))

(assert (=> b!175860 (= res!83361 (bvsge (size!3803 thiss!1248) (_size!1216 thiss!1248)))))

(assert (= (and d!53523 res!83360) b!175859))

(assert (= (and b!175859 res!83359) b!175860))

(assert (= (and b!175860 res!83361) b!175861))

(assert (= (and b!175861 res!83358) b!175862))

(assert (=> d!53523 m!204527))

(declare-fun m!204687 () Bool)

(assert (=> b!175861 m!204687))

(assert (=> b!175860 m!204687))

(assert (=> d!53489 d!53523))

(declare-fun d!53525 () Bool)

(declare-fun e!116059 () Bool)

(assert (=> d!53525 e!116059))

(declare-fun res!83362 () Bool)

(assert (=> d!53525 (=> res!83362 e!116059)))

(declare-fun lt!87014 () Bool)

(assert (=> d!53525 (= res!83362 (not lt!87014))))

(declare-fun lt!87015 () Bool)

(assert (=> d!53525 (= lt!87014 lt!87015)))

(declare-fun lt!87013 () Unit!5388)

(declare-fun e!116060 () Unit!5388)

(assert (=> d!53525 (= lt!87013 e!116060)))

(declare-fun c!31510 () Bool)

(assert (=> d!53525 (= c!31510 lt!87015)))

(assert (=> d!53525 (= lt!87015 (containsKey!194 (toList!1113 lt!86959) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53525 (= (contains!1173 lt!86959 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87014)))

(declare-fun b!175863 () Bool)

(declare-fun lt!87016 () Unit!5388)

(assert (=> b!175863 (= e!116060 lt!87016)))

(assert (=> b!175863 (= lt!87016 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1113 lt!86959) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175863 (isDefined!143 (getValueByKey!190 (toList!1113 lt!86959) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175864 () Bool)

(declare-fun Unit!5393 () Unit!5388)

(assert (=> b!175864 (= e!116060 Unit!5393)))

(declare-fun b!175865 () Bool)

(assert (=> b!175865 (= e!116059 (isDefined!143 (getValueByKey!190 (toList!1113 lt!86959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53525 c!31510) b!175863))

(assert (= (and d!53525 (not c!31510)) b!175864))

(assert (= (and d!53525 (not res!83362)) b!175865))

(declare-fun m!204689 () Bool)

(assert (=> d!53525 m!204689))

(declare-fun m!204691 () Bool)

(assert (=> b!175863 m!204691))

(declare-fun m!204693 () Bool)

(assert (=> b!175863 m!204693))

(assert (=> b!175863 m!204693))

(declare-fun m!204695 () Bool)

(assert (=> b!175863 m!204695))

(assert (=> b!175865 m!204693))

(assert (=> b!175865 m!204693))

(assert (=> b!175865 m!204695))

(assert (=> bm!17797 d!53525))

(declare-fun d!53527 () Bool)

(assert (=> d!53527 (= (apply!135 (+!252 lt!86963 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))) lt!86961) (apply!135 lt!86963 lt!86961))))

(declare-fun lt!87019 () Unit!5388)

(declare-fun choose!941 (ListLongMap!2195 (_ BitVec 64) V!5131 (_ BitVec 64)) Unit!5388)

(assert (=> d!53527 (= lt!87019 (choose!941 lt!86963 lt!86956 (zeroValue!3464 thiss!1248) lt!86961))))

(declare-fun e!116063 () Bool)

(assert (=> d!53527 e!116063))

(declare-fun res!83365 () Bool)

(assert (=> d!53527 (=> (not res!83365) (not e!116063))))

(assert (=> d!53527 (= res!83365 (contains!1173 lt!86963 lt!86961))))

(assert (=> d!53527 (= (addApplyDifferent!111 lt!86963 lt!86956 (zeroValue!3464 thiss!1248) lt!86961) lt!87019)))

(declare-fun b!175869 () Bool)

(assert (=> b!175869 (= e!116063 (not (= lt!86961 lt!86956)))))

(assert (= (and d!53527 res!83365) b!175869))

(declare-fun m!204697 () Bool)

(assert (=> d!53527 m!204697))

(assert (=> d!53527 m!204597))

(assert (=> d!53527 m!204611))

(assert (=> d!53527 m!204591))

(assert (=> d!53527 m!204597))

(declare-fun m!204699 () Bool)

(assert (=> d!53527 m!204699))

(assert (=> b!175752 d!53527))

(declare-fun d!53529 () Bool)

(assert (=> d!53529 (contains!1173 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))) lt!86966)))

(declare-fun lt!87022 () Unit!5388)

(declare-fun choose!942 (ListLongMap!2195 (_ BitVec 64) V!5131 (_ BitVec 64)) Unit!5388)

(assert (=> d!53529 (= lt!87022 (choose!942 lt!86964 lt!86953 (zeroValue!3464 thiss!1248) lt!86966))))

(assert (=> d!53529 (contains!1173 lt!86964 lt!86966)))

(assert (=> d!53529 (= (addStillContains!111 lt!86964 lt!86953 (zeroValue!3464 thiss!1248) lt!86966) lt!87022)))

(declare-fun bs!7248 () Bool)

(assert (= bs!7248 d!53529))

(assert (=> bs!7248 m!204585))

(assert (=> bs!7248 m!204585))

(assert (=> bs!7248 m!204593))

(declare-fun m!204701 () Bool)

(assert (=> bs!7248 m!204701))

(declare-fun m!204703 () Bool)

(assert (=> bs!7248 m!204703))

(assert (=> b!175752 d!53529))

(declare-fun d!53531 () Bool)

(declare-fun e!116064 () Bool)

(assert (=> d!53531 e!116064))

(declare-fun res!83366 () Bool)

(assert (=> d!53531 (=> (not res!83366) (not e!116064))))

(declare-fun lt!87023 () ListLongMap!2195)

(assert (=> d!53531 (= res!83366 (contains!1173 lt!87023 (_1!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))))))

(declare-fun lt!87024 () List!2225)

(assert (=> d!53531 (= lt!87023 (ListLongMap!2196 lt!87024))))

(declare-fun lt!87026 () Unit!5388)

(declare-fun lt!87025 () Unit!5388)

(assert (=> d!53531 (= lt!87026 lt!87025)))

(assert (=> d!53531 (= (getValueByKey!190 lt!87024 (_1!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))))))

(assert (=> d!53531 (= lt!87025 (lemmaContainsTupThenGetReturnValue!101 lt!87024 (_1!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))))))

(assert (=> d!53531 (= lt!87024 (insertStrictlySorted!104 (toList!1113 lt!86964) (_1!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))))))

(assert (=> d!53531 (= (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))) lt!87023)))

(declare-fun b!175871 () Bool)

(declare-fun res!83367 () Bool)

(assert (=> b!175871 (=> (not res!83367) (not e!116064))))

(assert (=> b!175871 (= res!83367 (= (getValueByKey!190 (toList!1113 lt!87023) (_1!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))))))))

(declare-fun b!175872 () Bool)

(assert (=> b!175872 (= e!116064 (contains!1174 (toList!1113 lt!87023) (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))))))

(assert (= (and d!53531 res!83366) b!175871))

(assert (= (and b!175871 res!83367) b!175872))

(declare-fun m!204705 () Bool)

(assert (=> d!53531 m!204705))

(declare-fun m!204707 () Bool)

(assert (=> d!53531 m!204707))

(declare-fun m!204709 () Bool)

(assert (=> d!53531 m!204709))

(declare-fun m!204711 () Bool)

(assert (=> d!53531 m!204711))

(declare-fun m!204713 () Bool)

(assert (=> b!175871 m!204713))

(declare-fun m!204715 () Bool)

(assert (=> b!175872 m!204715))

(assert (=> b!175752 d!53531))

(declare-fun d!53533 () Bool)

(declare-fun get!1993 (Option!196) V!5131)

(assert (=> d!53533 (= (apply!135 lt!86962 lt!86968) (get!1993 (getValueByKey!190 (toList!1113 lt!86962) lt!86968)))))

(declare-fun bs!7249 () Bool)

(assert (= bs!7249 d!53533))

(declare-fun m!204717 () Bool)

(assert (=> bs!7249 m!204717))

(assert (=> bs!7249 m!204717))

(declare-fun m!204719 () Bool)

(assert (=> bs!7249 m!204719))

(assert (=> b!175752 d!53533))

(declare-fun b!175897 () Bool)

(declare-fun e!116081 () Bool)

(declare-fun lt!87043 () ListLongMap!2195)

(declare-fun isEmpty!444 (ListLongMap!2195) Bool)

(assert (=> b!175897 (= e!116081 (isEmpty!444 lt!87043))))

(declare-fun d!53535 () Bool)

(declare-fun e!116083 () Bool)

(assert (=> d!53535 e!116083))

(declare-fun res!83379 () Bool)

(assert (=> d!53535 (=> (not res!83379) (not e!116083))))

(assert (=> d!53535 (= res!83379 (not (contains!1173 lt!87043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!116085 () ListLongMap!2195)

(assert (=> d!53535 (= lt!87043 e!116085)))

(declare-fun c!31521 () Bool)

(assert (=> d!53535 (= c!31521 (bvsge #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> d!53535 (validMask!0 (mask!8524 thiss!1248))))

(assert (=> d!53535 (= (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)) lt!87043)))

(declare-fun b!175898 () Bool)

(declare-fun e!116084 () Bool)

(assert (=> b!175898 (= e!116084 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175898 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!175899 () Bool)

(declare-fun lt!87041 () Unit!5388)

(declare-fun lt!87044 () Unit!5388)

(assert (=> b!175899 (= lt!87041 lt!87044)))

(declare-fun lt!87047 () (_ BitVec 64))

(declare-fun lt!87042 () ListLongMap!2195)

(declare-fun lt!87045 () (_ BitVec 64))

(declare-fun lt!87046 () V!5131)

(assert (=> b!175899 (not (contains!1173 (+!252 lt!87042 (tuple2!3269 lt!87047 lt!87046)) lt!87045))))

(declare-fun addStillNotContains!75 (ListLongMap!2195 (_ BitVec 64) V!5131 (_ BitVec 64)) Unit!5388)

(assert (=> b!175899 (= lt!87044 (addStillNotContains!75 lt!87042 lt!87047 lt!87046 lt!87045))))

(assert (=> b!175899 (= lt!87045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!175899 (= lt!87046 (get!1992 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175899 (= lt!87047 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17809 () ListLongMap!2195)

(assert (=> b!175899 (= lt!87042 call!17809)))

(declare-fun e!116080 () ListLongMap!2195)

(assert (=> b!175899 (= e!116080 (+!252 call!17809 (tuple2!3269 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000) (get!1992 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!175900 () Bool)

(assert (=> b!175900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> b!175900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3800 (_values!3606 thiss!1248))))))

(declare-fun e!116079 () Bool)

(assert (=> b!175900 (= e!116079 (= (apply!135 lt!87043 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)) (get!1992 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!175901 () Bool)

(declare-fun e!116082 () Bool)

(assert (=> b!175901 (= e!116082 e!116079)))

(assert (=> b!175901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun res!83376 () Bool)

(assert (=> b!175901 (= res!83376 (contains!1173 lt!87043 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175901 (=> (not res!83376) (not e!116079))))

(declare-fun b!175902 () Bool)

(assert (=> b!175902 (= e!116080 call!17809)))

(declare-fun b!175903 () Bool)

(assert (=> b!175903 (= e!116081 (= lt!87043 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3623 thiss!1248))))))

(declare-fun b!175904 () Bool)

(assert (=> b!175904 (= e!116085 (ListLongMap!2196 Nil!2222))))

(declare-fun bm!17806 () Bool)

(assert (=> bm!17806 (= call!17809 (getCurrentListMapNoExtraKeys!168 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3623 thiss!1248)))))

(declare-fun b!175905 () Bool)

(assert (=> b!175905 (= e!116085 e!116080)))

(declare-fun c!31519 () Bool)

(assert (=> b!175905 (= c!31519 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175906 () Bool)

(declare-fun res!83377 () Bool)

(assert (=> b!175906 (=> (not res!83377) (not e!116083))))

(assert (=> b!175906 (= res!83377 (not (contains!1173 lt!87043 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175907 () Bool)

(assert (=> b!175907 (= e!116082 e!116081)))

(declare-fun c!31520 () Bool)

(assert (=> b!175907 (= c!31520 (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(declare-fun b!175908 () Bool)

(assert (=> b!175908 (= e!116083 e!116082)))

(declare-fun c!31522 () Bool)

(assert (=> b!175908 (= c!31522 e!116084)))

(declare-fun res!83378 () Bool)

(assert (=> b!175908 (=> (not res!83378) (not e!116084))))

(assert (=> b!175908 (= res!83378 (bvslt #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (= (and d!53535 c!31521) b!175904))

(assert (= (and d!53535 (not c!31521)) b!175905))

(assert (= (and b!175905 c!31519) b!175899))

(assert (= (and b!175905 (not c!31519)) b!175902))

(assert (= (or b!175899 b!175902) bm!17806))

(assert (= (and d!53535 res!83379) b!175906))

(assert (= (and b!175906 res!83377) b!175908))

(assert (= (and b!175908 res!83378) b!175898))

(assert (= (and b!175908 c!31522) b!175901))

(assert (= (and b!175908 (not c!31522)) b!175907))

(assert (= (and b!175901 res!83376) b!175900))

(assert (= (and b!175907 c!31520) b!175903))

(assert (= (and b!175907 (not c!31520)) b!175897))

(declare-fun b_lambda!7019 () Bool)

(assert (=> (not b_lambda!7019) (not b!175899)))

(assert (=> b!175899 t!7047))

(declare-fun b_and!10829 () Bool)

(assert (= b_and!10827 (and (=> t!7047 result!4617) b_and!10829)))

(declare-fun b_lambda!7021 () Bool)

(assert (=> (not b_lambda!7021) (not b!175900)))

(assert (=> b!175900 t!7047))

(declare-fun b_and!10831 () Bool)

(assert (= b_and!10829 (and (=> t!7047 result!4617) b_and!10831)))

(declare-fun m!204721 () Bool)

(assert (=> b!175897 m!204721))

(declare-fun m!204723 () Bool)

(assert (=> bm!17806 m!204723))

(declare-fun m!204725 () Bool)

(assert (=> b!175899 m!204725))

(declare-fun m!204727 () Bool)

(assert (=> b!175899 m!204727))

(assert (=> b!175899 m!204725))

(declare-fun m!204729 () Bool)

(assert (=> b!175899 m!204729))

(assert (=> b!175899 m!204603))

(assert (=> b!175899 m!204625))

(assert (=> b!175899 m!204627))

(assert (=> b!175899 m!204625))

(assert (=> b!175899 m!204631))

(assert (=> b!175899 m!204627))

(declare-fun m!204731 () Bool)

(assert (=> b!175899 m!204731))

(assert (=> b!175903 m!204723))

(assert (=> b!175901 m!204603))

(assert (=> b!175901 m!204603))

(declare-fun m!204733 () Bool)

(assert (=> b!175901 m!204733))

(assert (=> b!175905 m!204603))

(assert (=> b!175905 m!204603))

(assert (=> b!175905 m!204617))

(declare-fun m!204735 () Bool)

(assert (=> b!175906 m!204735))

(assert (=> b!175898 m!204603))

(assert (=> b!175898 m!204603))

(assert (=> b!175898 m!204617))

(declare-fun m!204737 () Bool)

(assert (=> d!53535 m!204737))

(assert (=> d!53535 m!204527))

(assert (=> b!175900 m!204603))

(declare-fun m!204739 () Bool)

(assert (=> b!175900 m!204739))

(assert (=> b!175900 m!204603))

(assert (=> b!175900 m!204625))

(assert (=> b!175900 m!204627))

(assert (=> b!175900 m!204625))

(assert (=> b!175900 m!204631))

(assert (=> b!175900 m!204627))

(assert (=> b!175752 d!53535))

(declare-fun d!53537 () Bool)

(assert (=> d!53537 (= (apply!135 (+!252 lt!86958 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))) lt!86969) (get!1993 (getValueByKey!190 (toList!1113 (+!252 lt!86958 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))) lt!86969)))))

(declare-fun bs!7250 () Bool)

(assert (= bs!7250 d!53537))

(declare-fun m!204741 () Bool)

(assert (=> bs!7250 m!204741))

(assert (=> bs!7250 m!204741))

(declare-fun m!204743 () Bool)

(assert (=> bs!7250 m!204743))

(assert (=> b!175752 d!53537))

(declare-fun d!53539 () Bool)

(assert (=> d!53539 (= (apply!135 (+!252 lt!86962 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))) lt!86968) (apply!135 lt!86962 lt!86968))))

(declare-fun lt!87048 () Unit!5388)

(assert (=> d!53539 (= lt!87048 (choose!941 lt!86962 lt!86960 (minValue!3464 thiss!1248) lt!86968))))

(declare-fun e!116086 () Bool)

(assert (=> d!53539 e!116086))

(declare-fun res!83380 () Bool)

(assert (=> d!53539 (=> (not res!83380) (not e!116086))))

(assert (=> d!53539 (= res!83380 (contains!1173 lt!86962 lt!86968))))

(assert (=> d!53539 (= (addApplyDifferent!111 lt!86962 lt!86960 (minValue!3464 thiss!1248) lt!86968) lt!87048)))

(declare-fun b!175909 () Bool)

(assert (=> b!175909 (= e!116086 (not (= lt!86968 lt!86960)))))

(assert (= (and d!53539 res!83380) b!175909))

(declare-fun m!204745 () Bool)

(assert (=> d!53539 m!204745))

(assert (=> d!53539 m!204581))

(assert (=> d!53539 m!204583))

(assert (=> d!53539 m!204595))

(assert (=> d!53539 m!204581))

(declare-fun m!204747 () Bool)

(assert (=> d!53539 m!204747))

(assert (=> b!175752 d!53539))

(declare-fun d!53541 () Bool)

(assert (=> d!53541 (= (apply!135 (+!252 lt!86963 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))) lt!86961) (get!1993 (getValueByKey!190 (toList!1113 (+!252 lt!86963 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))) lt!86961)))))

(declare-fun bs!7251 () Bool)

(assert (= bs!7251 d!53541))

(declare-fun m!204749 () Bool)

(assert (=> bs!7251 m!204749))

(assert (=> bs!7251 m!204749))

(declare-fun m!204751 () Bool)

(assert (=> bs!7251 m!204751))

(assert (=> b!175752 d!53541))

(declare-fun d!53543 () Bool)

(assert (=> d!53543 (= (apply!135 (+!252 lt!86958 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))) lt!86969) (apply!135 lt!86958 lt!86969))))

(declare-fun lt!87049 () Unit!5388)

(assert (=> d!53543 (= lt!87049 (choose!941 lt!86958 lt!86954 (minValue!3464 thiss!1248) lt!86969))))

(declare-fun e!116087 () Bool)

(assert (=> d!53543 e!116087))

(declare-fun res!83381 () Bool)

(assert (=> d!53543 (=> (not res!83381) (not e!116087))))

(assert (=> d!53543 (= res!83381 (contains!1173 lt!86958 lt!86969))))

(assert (=> d!53543 (= (addApplyDifferent!111 lt!86958 lt!86954 (minValue!3464 thiss!1248) lt!86969) lt!87049)))

(declare-fun b!175910 () Bool)

(assert (=> b!175910 (= e!116087 (not (= lt!86969 lt!86954)))))

(assert (= (and d!53543 res!83381) b!175910))

(declare-fun m!204753 () Bool)

(assert (=> d!53543 m!204753))

(assert (=> d!53543 m!204599))

(assert (=> d!53543 m!204601))

(assert (=> d!53543 m!204589))

(assert (=> d!53543 m!204599))

(declare-fun m!204755 () Bool)

(assert (=> d!53543 m!204755))

(assert (=> b!175752 d!53543))

(declare-fun d!53545 () Bool)

(declare-fun e!116088 () Bool)

(assert (=> d!53545 e!116088))

(declare-fun res!83382 () Bool)

(assert (=> d!53545 (=> (not res!83382) (not e!116088))))

(declare-fun lt!87050 () ListLongMap!2195)

(assert (=> d!53545 (= res!83382 (contains!1173 lt!87050 (_1!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))))))

(declare-fun lt!87051 () List!2225)

(assert (=> d!53545 (= lt!87050 (ListLongMap!2196 lt!87051))))

(declare-fun lt!87053 () Unit!5388)

(declare-fun lt!87052 () Unit!5388)

(assert (=> d!53545 (= lt!87053 lt!87052)))

(assert (=> d!53545 (= (getValueByKey!190 lt!87051 (_1!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))))))

(assert (=> d!53545 (= lt!87052 (lemmaContainsTupThenGetReturnValue!101 lt!87051 (_1!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))))))

(assert (=> d!53545 (= lt!87051 (insertStrictlySorted!104 (toList!1113 lt!86963) (_1!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))))))

(assert (=> d!53545 (= (+!252 lt!86963 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))) lt!87050)))

(declare-fun b!175911 () Bool)

(declare-fun res!83383 () Bool)

(assert (=> b!175911 (=> (not res!83383) (not e!116088))))

(assert (=> b!175911 (= res!83383 (= (getValueByKey!190 (toList!1113 lt!87050) (_1!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))))))))

(declare-fun b!175912 () Bool)

(assert (=> b!175912 (= e!116088 (contains!1174 (toList!1113 lt!87050) (tuple2!3269 lt!86956 (zeroValue!3464 thiss!1248))))))

(assert (= (and d!53545 res!83382) b!175911))

(assert (= (and b!175911 res!83383) b!175912))

(declare-fun m!204757 () Bool)

(assert (=> d!53545 m!204757))

(declare-fun m!204759 () Bool)

(assert (=> d!53545 m!204759))

(declare-fun m!204761 () Bool)

(assert (=> d!53545 m!204761))

(declare-fun m!204763 () Bool)

(assert (=> d!53545 m!204763))

(declare-fun m!204765 () Bool)

(assert (=> b!175911 m!204765))

(declare-fun m!204767 () Bool)

(assert (=> b!175912 m!204767))

(assert (=> b!175752 d!53545))

(declare-fun d!53547 () Bool)

(assert (=> d!53547 (= (apply!135 (+!252 lt!86962 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))) lt!86968) (get!1993 (getValueByKey!190 (toList!1113 (+!252 lt!86962 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))) lt!86968)))))

(declare-fun bs!7252 () Bool)

(assert (= bs!7252 d!53547))

(declare-fun m!204769 () Bool)

(assert (=> bs!7252 m!204769))

(assert (=> bs!7252 m!204769))

(declare-fun m!204771 () Bool)

(assert (=> bs!7252 m!204771))

(assert (=> b!175752 d!53547))

(declare-fun d!53549 () Bool)

(assert (=> d!53549 (= (apply!135 lt!86958 lt!86969) (get!1993 (getValueByKey!190 (toList!1113 lt!86958) lt!86969)))))

(declare-fun bs!7253 () Bool)

(assert (= bs!7253 d!53549))

(declare-fun m!204773 () Bool)

(assert (=> bs!7253 m!204773))

(assert (=> bs!7253 m!204773))

(declare-fun m!204775 () Bool)

(assert (=> bs!7253 m!204775))

(assert (=> b!175752 d!53549))

(declare-fun d!53551 () Bool)

(declare-fun e!116089 () Bool)

(assert (=> d!53551 e!116089))

(declare-fun res!83384 () Bool)

(assert (=> d!53551 (=> res!83384 e!116089)))

(declare-fun lt!87055 () Bool)

(assert (=> d!53551 (= res!83384 (not lt!87055))))

(declare-fun lt!87056 () Bool)

(assert (=> d!53551 (= lt!87055 lt!87056)))

(declare-fun lt!87054 () Unit!5388)

(declare-fun e!116090 () Unit!5388)

(assert (=> d!53551 (= lt!87054 e!116090)))

(declare-fun c!31523 () Bool)

(assert (=> d!53551 (= c!31523 lt!87056)))

(assert (=> d!53551 (= lt!87056 (containsKey!194 (toList!1113 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))) lt!86966))))

(assert (=> d!53551 (= (contains!1173 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248))) lt!86966) lt!87055)))

(declare-fun b!175913 () Bool)

(declare-fun lt!87057 () Unit!5388)

(assert (=> b!175913 (= e!116090 lt!87057)))

(assert (=> b!175913 (= lt!87057 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1113 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))) lt!86966))))

(assert (=> b!175913 (isDefined!143 (getValueByKey!190 (toList!1113 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))) lt!86966))))

(declare-fun b!175914 () Bool)

(declare-fun Unit!5394 () Unit!5388)

(assert (=> b!175914 (= e!116090 Unit!5394)))

(declare-fun b!175915 () Bool)

(assert (=> b!175915 (= e!116089 (isDefined!143 (getValueByKey!190 (toList!1113 (+!252 lt!86964 (tuple2!3269 lt!86953 (zeroValue!3464 thiss!1248)))) lt!86966)))))

(assert (= (and d!53551 c!31523) b!175913))

(assert (= (and d!53551 (not c!31523)) b!175914))

(assert (= (and d!53551 (not res!83384)) b!175915))

(declare-fun m!204777 () Bool)

(assert (=> d!53551 m!204777))

(declare-fun m!204779 () Bool)

(assert (=> b!175913 m!204779))

(declare-fun m!204781 () Bool)

(assert (=> b!175913 m!204781))

(assert (=> b!175913 m!204781))

(declare-fun m!204783 () Bool)

(assert (=> b!175913 m!204783))

(assert (=> b!175915 m!204781))

(assert (=> b!175915 m!204781))

(assert (=> b!175915 m!204783))

(assert (=> b!175752 d!53551))

(declare-fun d!53553 () Bool)

(assert (=> d!53553 (= (apply!135 lt!86963 lt!86961) (get!1993 (getValueByKey!190 (toList!1113 lt!86963) lt!86961)))))

(declare-fun bs!7254 () Bool)

(assert (= bs!7254 d!53553))

(declare-fun m!204785 () Bool)

(assert (=> bs!7254 m!204785))

(assert (=> bs!7254 m!204785))

(declare-fun m!204787 () Bool)

(assert (=> bs!7254 m!204787))

(assert (=> b!175752 d!53553))

(declare-fun d!53555 () Bool)

(declare-fun e!116091 () Bool)

(assert (=> d!53555 e!116091))

(declare-fun res!83385 () Bool)

(assert (=> d!53555 (=> (not res!83385) (not e!116091))))

(declare-fun lt!87058 () ListLongMap!2195)

(assert (=> d!53555 (= res!83385 (contains!1173 lt!87058 (_1!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))))))

(declare-fun lt!87059 () List!2225)

(assert (=> d!53555 (= lt!87058 (ListLongMap!2196 lt!87059))))

(declare-fun lt!87061 () Unit!5388)

(declare-fun lt!87060 () Unit!5388)

(assert (=> d!53555 (= lt!87061 lt!87060)))

(assert (=> d!53555 (= (getValueByKey!190 lt!87059 (_1!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))))))

(assert (=> d!53555 (= lt!87060 (lemmaContainsTupThenGetReturnValue!101 lt!87059 (_1!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))))))

(assert (=> d!53555 (= lt!87059 (insertStrictlySorted!104 (toList!1113 lt!86958) (_1!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))))))

(assert (=> d!53555 (= (+!252 lt!86958 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))) lt!87058)))

(declare-fun b!175916 () Bool)

(declare-fun res!83386 () Bool)

(assert (=> b!175916 (=> (not res!83386) (not e!116091))))

(assert (=> b!175916 (= res!83386 (= (getValueByKey!190 (toList!1113 lt!87058) (_1!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))))))))

(declare-fun b!175917 () Bool)

(assert (=> b!175917 (= e!116091 (contains!1174 (toList!1113 lt!87058) (tuple2!3269 lt!86954 (minValue!3464 thiss!1248))))))

(assert (= (and d!53555 res!83385) b!175916))

(assert (= (and b!175916 res!83386) b!175917))

(declare-fun m!204789 () Bool)

(assert (=> d!53555 m!204789))

(declare-fun m!204791 () Bool)

(assert (=> d!53555 m!204791))

(declare-fun m!204793 () Bool)

(assert (=> d!53555 m!204793))

(declare-fun m!204795 () Bool)

(assert (=> d!53555 m!204795))

(declare-fun m!204797 () Bool)

(assert (=> b!175916 m!204797))

(declare-fun m!204799 () Bool)

(assert (=> b!175917 m!204799))

(assert (=> b!175752 d!53555))

(declare-fun d!53557 () Bool)

(declare-fun e!116092 () Bool)

(assert (=> d!53557 e!116092))

(declare-fun res!83387 () Bool)

(assert (=> d!53557 (=> (not res!83387) (not e!116092))))

(declare-fun lt!87062 () ListLongMap!2195)

(assert (=> d!53557 (= res!83387 (contains!1173 lt!87062 (_1!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))))))

(declare-fun lt!87063 () List!2225)

(assert (=> d!53557 (= lt!87062 (ListLongMap!2196 lt!87063))))

(declare-fun lt!87065 () Unit!5388)

(declare-fun lt!87064 () Unit!5388)

(assert (=> d!53557 (= lt!87065 lt!87064)))

(assert (=> d!53557 (= (getValueByKey!190 lt!87063 (_1!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))))))

(assert (=> d!53557 (= lt!87064 (lemmaContainsTupThenGetReturnValue!101 lt!87063 (_1!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))))))

(assert (=> d!53557 (= lt!87063 (insertStrictlySorted!104 (toList!1113 lt!86962) (_1!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))) (_2!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))))))

(assert (=> d!53557 (= (+!252 lt!86962 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))) lt!87062)))

(declare-fun b!175918 () Bool)

(declare-fun res!83388 () Bool)

(assert (=> b!175918 (=> (not res!83388) (not e!116092))))

(assert (=> b!175918 (= res!83388 (= (getValueByKey!190 (toList!1113 lt!87062) (_1!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248)))) (Some!195 (_2!1645 (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))))))))

(declare-fun b!175919 () Bool)

(assert (=> b!175919 (= e!116092 (contains!1174 (toList!1113 lt!87062) (tuple2!3269 lt!86960 (minValue!3464 thiss!1248))))))

(assert (= (and d!53557 res!83387) b!175918))

(assert (= (and b!175918 res!83388) b!175919))

(declare-fun m!204801 () Bool)

(assert (=> d!53557 m!204801))

(declare-fun m!204803 () Bool)

(assert (=> d!53557 m!204803))

(declare-fun m!204805 () Bool)

(assert (=> d!53557 m!204805))

(declare-fun m!204807 () Bool)

(assert (=> d!53557 m!204807))

(declare-fun m!204809 () Bool)

(assert (=> b!175918 m!204809))

(declare-fun m!204811 () Bool)

(assert (=> b!175919 m!204811))

(assert (=> b!175752 d!53557))

(assert (=> d!53495 d!53501))

(declare-fun b!175928 () Bool)

(declare-fun e!116098 () (_ BitVec 32))

(assert (=> b!175928 (= e!116098 #b00000000000000000000000000000000)))

(declare-fun d!53559 () Bool)

(declare-fun lt!87068 () (_ BitVec 32))

(assert (=> d!53559 (and (bvsge lt!87068 #b00000000000000000000000000000000) (bvsle lt!87068 (bvsub (size!3799 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53559 (= lt!87068 e!116098)))

(declare-fun c!31528 () Bool)

(assert (=> d!53559 (= c!31528 (bvsge #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> d!53559 (and (bvsle #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3799 (_keys!5476 thiss!1248)) (size!3799 (_keys!5476 thiss!1248))))))

(assert (=> d!53559 (= (arrayCountValidKeys!0 (_keys!5476 thiss!1248) #b00000000000000000000000000000000 (size!3799 (_keys!5476 thiss!1248))) lt!87068)))

(declare-fun b!175929 () Bool)

(declare-fun e!116097 () (_ BitVec 32))

(declare-fun call!17812 () (_ BitVec 32))

(assert (=> b!175929 (= e!116097 (bvadd #b00000000000000000000000000000001 call!17812))))

(declare-fun b!175930 () Bool)

(assert (=> b!175930 (= e!116097 call!17812)))

(declare-fun b!175931 () Bool)

(assert (=> b!175931 (= e!116098 e!116097)))

(declare-fun c!31529 () Bool)

(assert (=> b!175931 (= c!31529 (validKeyInArray!0 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17809 () Bool)

(assert (=> bm!17809 (= call!17812 (arrayCountValidKeys!0 (_keys!5476 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3799 (_keys!5476 thiss!1248))))))

(assert (= (and d!53559 c!31528) b!175928))

(assert (= (and d!53559 (not c!31528)) b!175931))

(assert (= (and b!175931 c!31529) b!175929))

(assert (= (and b!175931 (not c!31529)) b!175930))

(assert (= (or b!175929 b!175930) bm!17809))

(assert (=> b!175931 m!204603))

(assert (=> b!175931 m!204603))

(assert (=> b!175931 m!204617))

(declare-fun m!204813 () Bool)

(assert (=> bm!17809 m!204813))

(assert (=> b!175670 d!53559))

(declare-fun b!175944 () Bool)

(declare-fun e!116107 () SeekEntryResult!552)

(assert (=> b!175944 (= e!116107 (Found!552 (index!4378 lt!86893)))))

(declare-fun e!116105 () SeekEntryResult!552)

(declare-fun b!175945 () Bool)

(assert (=> b!175945 (= e!116105 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19310 lt!86893) #b00000000000000000000000000000001) (nextIndex!0 (index!4378 lt!86893) (x!19310 lt!86893) (mask!8524 thiss!1248)) (index!4378 lt!86893) key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)))))

(declare-fun b!175946 () Bool)

(declare-fun c!31538 () Bool)

(declare-fun lt!87074 () (_ BitVec 64))

(assert (=> b!175946 (= c!31538 (= lt!87074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175946 (= e!116107 e!116105)))

(declare-fun b!175947 () Bool)

(assert (=> b!175947 (= e!116105 (MissingVacant!552 (index!4378 lt!86893)))))

(declare-fun b!175948 () Bool)

(declare-fun e!116106 () SeekEntryResult!552)

(assert (=> b!175948 (= e!116106 e!116107)))

(declare-fun c!31537 () Bool)

(assert (=> b!175948 (= c!31537 (= lt!87074 key!828))))

(declare-fun d!53561 () Bool)

(declare-fun lt!87073 () SeekEntryResult!552)

(assert (=> d!53561 (and (or ((_ is Undefined!552) lt!87073) (not ((_ is Found!552) lt!87073)) (and (bvsge (index!4377 lt!87073) #b00000000000000000000000000000000) (bvslt (index!4377 lt!87073) (size!3799 (_keys!5476 thiss!1248))))) (or ((_ is Undefined!552) lt!87073) ((_ is Found!552) lt!87073) (not ((_ is MissingVacant!552) lt!87073)) (not (= (index!4379 lt!87073) (index!4378 lt!86893))) (and (bvsge (index!4379 lt!87073) #b00000000000000000000000000000000) (bvslt (index!4379 lt!87073) (size!3799 (_keys!5476 thiss!1248))))) (or ((_ is Undefined!552) lt!87073) (ite ((_ is Found!552) lt!87073) (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4377 lt!87073)) key!828) (and ((_ is MissingVacant!552) lt!87073) (= (index!4379 lt!87073) (index!4378 lt!86893)) (= (select (arr!3497 (_keys!5476 thiss!1248)) (index!4379 lt!87073)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53561 (= lt!87073 e!116106)))

(declare-fun c!31536 () Bool)

(assert (=> d!53561 (= c!31536 (bvsge (x!19310 lt!86893) #b01111111111111111111111111111110))))

(assert (=> d!53561 (= lt!87074 (select (arr!3497 (_keys!5476 thiss!1248)) (index!4378 lt!86893)))))

(assert (=> d!53561 (validMask!0 (mask!8524 thiss!1248))))

(assert (=> d!53561 (= (seekKeyOrZeroReturnVacant!0 (x!19310 lt!86893) (index!4378 lt!86893) (index!4378 lt!86893) key!828 (_keys!5476 thiss!1248) (mask!8524 thiss!1248)) lt!87073)))

(declare-fun b!175949 () Bool)

(assert (=> b!175949 (= e!116106 Undefined!552)))

(assert (= (and d!53561 c!31536) b!175949))

(assert (= (and d!53561 (not c!31536)) b!175948))

(assert (= (and b!175948 c!31537) b!175944))

(assert (= (and b!175948 (not c!31537)) b!175946))

(assert (= (and b!175946 c!31538) b!175947))

(assert (= (and b!175946 (not c!31538)) b!175945))

(declare-fun m!204815 () Bool)

(assert (=> b!175945 m!204815))

(assert (=> b!175945 m!204815))

(declare-fun m!204817 () Bool)

(assert (=> b!175945 m!204817))

(declare-fun m!204819 () Bool)

(assert (=> d!53561 m!204819))

(declare-fun m!204821 () Bool)

(assert (=> d!53561 m!204821))

(assert (=> d!53561 m!204557))

(assert (=> d!53561 m!204527))

(assert (=> b!175689 d!53561))

(declare-fun d!53563 () Bool)

(assert (=> d!53563 (= (apply!135 lt!86959 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1993 (getValueByKey!190 (toList!1113 lt!86959) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7255 () Bool)

(assert (= bs!7255 d!53563))

(declare-fun m!204823 () Bool)

(assert (=> bs!7255 m!204823))

(assert (=> bs!7255 m!204823))

(declare-fun m!204825 () Bool)

(assert (=> bs!7255 m!204825))

(assert (=> b!175745 d!53563))

(assert (=> b!175753 d!53519))

(declare-fun d!53565 () Bool)

(assert (=> d!53565 (= (apply!135 lt!86959 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1993 (getValueByKey!190 (toList!1113 lt!86959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7256 () Bool)

(assert (= bs!7256 d!53565))

(assert (=> bs!7256 m!204693))

(assert (=> bs!7256 m!204693))

(declare-fun m!204827 () Bool)

(assert (=> bs!7256 m!204827))

(assert (=> b!175750 d!53565))

(declare-fun d!53567 () Bool)

(declare-fun res!83393 () Bool)

(declare-fun e!116112 () Bool)

(assert (=> d!53567 (=> res!83393 e!116112)))

(assert (=> d!53567 (= res!83393 (and ((_ is Cons!2221) (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))) (= (_1!1645 (h!2840 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))))) key!828)))))

(assert (=> d!53567 (= (containsKey!194 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))) key!828) e!116112)))

(declare-fun b!175954 () Bool)

(declare-fun e!116113 () Bool)

(assert (=> b!175954 (= e!116112 e!116113)))

(declare-fun res!83394 () Bool)

(assert (=> b!175954 (=> (not res!83394) (not e!116113))))

(assert (=> b!175954 (= res!83394 (and (or (not ((_ is Cons!2221) (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))))) (bvsle (_1!1645 (h!2840 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))))) key!828)) ((_ is Cons!2221) (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))) (bvslt (_1!1645 (h!2840 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248))))) key!828)))))

(declare-fun b!175955 () Bool)

(assert (=> b!175955 (= e!116113 (containsKey!194 (t!7045 (toList!1113 (getCurrentListMap!765 (_keys!5476 thiss!1248) (_values!3606 thiss!1248) (mask!8524 thiss!1248) (extraKeys!3360 thiss!1248) (zeroValue!3464 thiss!1248) (minValue!3464 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3623 thiss!1248)))) key!828))))

(assert (= (and d!53567 (not res!83393)) b!175954))

(assert (= (and b!175954 res!83394) b!175955))

(declare-fun m!204829 () Bool)

(assert (=> b!175955 m!204829))

(assert (=> d!53493 d!53567))

(assert (=> bm!17796 d!53535))

(declare-fun d!53569 () Bool)

(declare-fun e!116114 () Bool)

(assert (=> d!53569 e!116114))

(declare-fun res!83395 () Bool)

(assert (=> d!53569 (=> (not res!83395) (not e!116114))))

(declare-fun lt!87075 () ListLongMap!2195)

(assert (=> d!53569 (= res!83395 (contains!1173 lt!87075 (_1!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))))

(declare-fun lt!87076 () List!2225)

(assert (=> d!53569 (= lt!87075 (ListLongMap!2196 lt!87076))))

(declare-fun lt!87078 () Unit!5388)

(declare-fun lt!87077 () Unit!5388)

(assert (=> d!53569 (= lt!87078 lt!87077)))

(assert (=> d!53569 (= (getValueByKey!190 lt!87076 (_1!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))) (Some!195 (_2!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))))

(assert (=> d!53569 (= lt!87077 (lemmaContainsTupThenGetReturnValue!101 lt!87076 (_1!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))) (_2!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))))

(assert (=> d!53569 (= lt!87076 (insertStrictlySorted!104 (toList!1113 (ite c!31482 call!17794 (ite c!31484 call!17796 call!17797))) (_1!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))) (_2!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))))))

(assert (=> d!53569 (= (+!252 (ite c!31482 call!17794 (ite c!31484 call!17796 call!17797)) (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))) lt!87075)))

(declare-fun b!175956 () Bool)

(declare-fun res!83396 () Bool)

(assert (=> b!175956 (=> (not res!83396) (not e!116114))))

(assert (=> b!175956 (= res!83396 (= (getValueByKey!190 (toList!1113 lt!87075) (_1!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248))))) (Some!195 (_2!1645 (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))))

(declare-fun b!175957 () Bool)

(assert (=> b!175957 (= e!116114 (contains!1174 (toList!1113 lt!87075) (ite (or c!31482 c!31484) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3464 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3464 thiss!1248)))))))

(assert (= (and d!53569 res!83395) b!175956))

(assert (= (and b!175956 res!83396) b!175957))

(declare-fun m!204831 () Bool)

(assert (=> d!53569 m!204831))

(declare-fun m!204833 () Bool)

(assert (=> d!53569 m!204833))

(declare-fun m!204835 () Bool)

(assert (=> d!53569 m!204835))

(declare-fun m!204837 () Bool)

(assert (=> d!53569 m!204837))

(declare-fun m!204839 () Bool)

(assert (=> b!175956 m!204839))

(declare-fun m!204841 () Bool)

(assert (=> b!175957 m!204841))

(assert (=> bm!17791 d!53569))

(declare-fun d!53571 () Bool)

(declare-fun e!116115 () Bool)

(assert (=> d!53571 e!116115))

(declare-fun res!83397 () Bool)

(assert (=> d!53571 (=> res!83397 e!116115)))

(declare-fun lt!87080 () Bool)

(assert (=> d!53571 (= res!83397 (not lt!87080))))

(declare-fun lt!87081 () Bool)

(assert (=> d!53571 (= lt!87080 lt!87081)))

(declare-fun lt!87079 () Unit!5388)

(declare-fun e!116116 () Unit!5388)

(assert (=> d!53571 (= lt!87079 e!116116)))

(declare-fun c!31539 () Bool)

(assert (=> d!53571 (= c!31539 lt!87081)))

(assert (=> d!53571 (= lt!87081 (containsKey!194 (toList!1113 lt!86959) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53571 (= (contains!1173 lt!86959 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87080)))

(declare-fun b!175958 () Bool)

(declare-fun lt!87082 () Unit!5388)

(assert (=> b!175958 (= e!116116 lt!87082)))

(assert (=> b!175958 (= lt!87082 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1113 lt!86959) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175958 (isDefined!143 (getValueByKey!190 (toList!1113 lt!86959) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175959 () Bool)

(declare-fun Unit!5395 () Unit!5388)

(assert (=> b!175959 (= e!116116 Unit!5395)))

(declare-fun b!175960 () Bool)

(assert (=> b!175960 (= e!116115 (isDefined!143 (getValueByKey!190 (toList!1113 lt!86959) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53571 c!31539) b!175958))

(assert (= (and d!53571 (not c!31539)) b!175959))

(assert (= (and d!53571 (not res!83397)) b!175960))

(declare-fun m!204843 () Bool)

(assert (=> d!53571 m!204843))

(declare-fun m!204845 () Bool)

(assert (=> b!175958 m!204845))

(assert (=> b!175958 m!204823))

(assert (=> b!175958 m!204823))

(declare-fun m!204847 () Bool)

(assert (=> b!175958 m!204847))

(assert (=> b!175960 m!204823))

(assert (=> b!175960 m!204823))

(assert (=> b!175960 m!204847))

(assert (=> bm!17793 d!53571))

(declare-fun d!53573 () Bool)

(assert (=> d!53573 (= (apply!135 lt!86959 (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000)) (get!1993 (getValueByKey!190 (toList!1113 lt!86959) (select (arr!3497 (_keys!5476 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7257 () Bool)

(assert (= bs!7257 d!53573))

(assert (=> bs!7257 m!204603))

(assert (=> bs!7257 m!204679))

(assert (=> bs!7257 m!204679))

(declare-fun m!204849 () Bool)

(assert (=> bs!7257 m!204849))

(assert (=> b!175748 d!53573))

(declare-fun d!53575 () Bool)

(declare-fun c!31542 () Bool)

(assert (=> d!53575 (= c!31542 ((_ is ValueCellFull!1713) (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116119 () V!5131)

(assert (=> d!53575 (= (get!1992 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!116119)))

(declare-fun b!175965 () Bool)

(declare-fun get!1994 (ValueCell!1713 V!5131) V!5131)

(assert (=> b!175965 (= e!116119 (get!1994 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175966 () Bool)

(declare-fun get!1995 (ValueCell!1713 V!5131) V!5131)

(assert (=> b!175966 (= e!116119 (get!1995 (select (arr!3498 (_values!3606 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3623 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53575 c!31542) b!175965))

(assert (= (and d!53575 (not c!31542)) b!175966))

(assert (=> b!175965 m!204627))

(assert (=> b!175965 m!204625))

(declare-fun m!204851 () Bool)

(assert (=> b!175965 m!204851))

(assert (=> b!175966 m!204627))

(assert (=> b!175966 m!204625))

(declare-fun m!204853 () Bool)

(assert (=> b!175966 m!204853))

(assert (=> b!175748 d!53575))

(declare-fun b!175967 () Bool)

(declare-fun e!116120 () Bool)

(assert (=> b!175967 (= e!116120 tp_is_empty!4113)))

(declare-fun condMapEmpty!7022 () Bool)

(declare-fun mapDefault!7022 () ValueCell!1713)

(assert (=> mapNonEmpty!7021 (= condMapEmpty!7022 (= mapRest!7021 ((as const (Array (_ BitVec 32) ValueCell!1713)) mapDefault!7022)))))

(declare-fun e!116121 () Bool)

(declare-fun mapRes!7022 () Bool)

(assert (=> mapNonEmpty!7021 (= tp!15715 (and e!116121 mapRes!7022))))

(declare-fun b!175968 () Bool)

(assert (=> b!175968 (= e!116121 tp_is_empty!4113)))

(declare-fun mapIsEmpty!7022 () Bool)

(assert (=> mapIsEmpty!7022 mapRes!7022))

(declare-fun mapNonEmpty!7022 () Bool)

(declare-fun tp!15716 () Bool)

(assert (=> mapNonEmpty!7022 (= mapRes!7022 (and tp!15716 e!116120))))

(declare-fun mapValue!7022 () ValueCell!1713)

(declare-fun mapKey!7022 () (_ BitVec 32))

(declare-fun mapRest!7022 () (Array (_ BitVec 32) ValueCell!1713))

(assert (=> mapNonEmpty!7022 (= mapRest!7021 (store mapRest!7022 mapKey!7022 mapValue!7022))))

(assert (= (and mapNonEmpty!7021 condMapEmpty!7022) mapIsEmpty!7022))

(assert (= (and mapNonEmpty!7021 (not condMapEmpty!7022)) mapNonEmpty!7022))

(assert (= (and mapNonEmpty!7022 ((_ is ValueCellFull!1713) mapValue!7022)) b!175967))

(assert (= (and mapNonEmpty!7021 ((_ is ValueCellFull!1713) mapDefault!7022)) b!175968))

(declare-fun m!204855 () Bool)

(assert (=> mapNonEmpty!7022 m!204855))

(declare-fun b_lambda!7023 () Bool)

(assert (= b_lambda!7021 (or (and b!175629 b_free!4341) b_lambda!7023)))

(declare-fun b_lambda!7025 () Bool)

(assert (= b_lambda!7019 (or (and b!175629 b_free!4341) b_lambda!7025)))

(check-sat (not b!175865) (not d!53553) (not bm!17806) (not b!175840) (not b!175919) (not d!53517) (not d!53547) (not d!53529) (not d!53569) (not b!175911) (not d!53541) (not d!53561) (not d!53537) (not b!175958) (not d!53557) (not b!175901) (not b!175956) (not bm!17803) (not d!53539) (not b_lambda!7017) (not b!175822) (not d!53563) (not b!175847) (not b!175828) (not b!175809) (not d!53545) (not d!53525) (not b!175957) (not b!175791) (not bm!17800) (not b!175915) (not d!53535) (not b!175945) (not b!175905) (not b_next!4341) (not b!175913) (not b!175850) (not b_lambda!7023) (not d!53555) (not mapNonEmpty!7022) (not b!175899) (not d!53551) (not b!175860) (not b!175861) (not b!175918) (not b!175931) (not d!53533) (not d!53571) (not bm!17809) (not d!53527) (not b!175871) (not b!175965) (not b!175872) (not d!53543) (not d!53513) (not b!175960) (not b!175810) (not d!53523) tp_is_empty!4113 (not b!175829) (not b!175906) (not d!53565) (not d!53573) (not b!175900) (not b!175955) (not b!175897) b_and!10831 (not b!175863) (not b!175916) (not d!53503) (not b!175903) (not d!53509) (not b!175844) (not d!53531) (not b!175912) (not b!175842) (not b!175917) (not d!53549) (not b_lambda!7025) (not b!175898) (not b!175966) (not b!175845) (not d!53521))
(check-sat b_and!10831 (not b_next!4341))
