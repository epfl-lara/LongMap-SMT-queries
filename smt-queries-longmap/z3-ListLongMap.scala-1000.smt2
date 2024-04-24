; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21590 () Bool)

(assert start!21590)

(declare-fun b!216365 () Bool)

(declare-fun b_free!5749 () Bool)

(declare-fun b_next!5749 () Bool)

(assert (=> b!216365 (= b_free!5749 (not b_next!5749))))

(declare-fun tp!20379 () Bool)

(declare-fun b_and!12653 () Bool)

(assert (=> b!216365 (= tp!20379 b_and!12653)))

(declare-fun b!216355 () Bool)

(declare-fun res!105791 () Bool)

(declare-fun e!140760 () Bool)

(assert (=> b!216355 (=> (not res!105791) (not e!140760))))

(declare-datatypes ((V!7129 0))(
  ( (V!7130 (val!2850 Int)) )
))
(declare-datatypes ((ValueCell!2462 0))(
  ( (ValueCellFull!2462 (v!4869 V!7129)) (EmptyCell!2462) )
))
(declare-datatypes ((array!10457 0))(
  ( (array!10458 (arr!4951 (Array (_ BitVec 32) ValueCell!2462)) (size!5283 (_ BitVec 32))) )
))
(declare-datatypes ((array!10459 0))(
  ( (array!10460 (arr!4952 (Array (_ BitVec 32) (_ BitVec 64))) (size!5284 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2824 0))(
  ( (LongMapFixedSize!2825 (defaultEntry!4062 Int) (mask!9794 (_ BitVec 32)) (extraKeys!3799 (_ BitVec 32)) (zeroValue!3903 V!7129) (minValue!3903 V!7129) (_size!1461 (_ BitVec 32)) (_keys!6109 array!10459) (_values!4045 array!10457) (_vacant!1461 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2824)

(assert (=> b!216355 (= res!105791 (and (= (size!5283 (_values!4045 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9794 thiss!1504))) (= (size!5284 (_keys!6109 thiss!1504)) (size!5283 (_values!4045 thiss!1504))) (bvsge (mask!9794 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3799 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3799 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216356 () Bool)

(declare-fun res!105789 () Bool)

(declare-fun e!140764 () Bool)

(assert (=> b!216356 (=> (not res!105789) (not e!140764))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216356 (= res!105789 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216357 () Bool)

(assert (=> b!216357 (= e!140760 (bvsgt #b00000000000000000000000000000000 (size!5284 (_keys!6109 thiss!1504))))))

(declare-fun b!216358 () Bool)

(declare-fun e!140762 () Bool)

(declare-fun tp_is_empty!5611 () Bool)

(assert (=> b!216358 (= e!140762 tp_is_empty!5611)))

(declare-fun b!216359 () Bool)

(assert (=> b!216359 (= e!140764 e!140760)))

(declare-fun res!105787 () Bool)

(assert (=> b!216359 (=> (not res!105787) (not e!140760))))

(declare-datatypes ((SeekEntryResult!730 0))(
  ( (MissingZero!730 (index!5090 (_ BitVec 32))) (Found!730 (index!5091 (_ BitVec 32))) (Intermediate!730 (undefined!1542 Bool) (index!5092 (_ BitVec 32)) (x!22610 (_ BitVec 32))) (Undefined!730) (MissingVacant!730 (index!5093 (_ BitVec 32))) )
))
(declare-fun lt!111200 () SeekEntryResult!730)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216359 (= res!105787 (or (= lt!111200 (MissingZero!730 index!297)) (= lt!111200 (MissingVacant!730 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10459 (_ BitVec 32)) SeekEntryResult!730)

(assert (=> b!216359 (= lt!111200 (seekEntryOrOpen!0 key!932 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(declare-fun mapIsEmpty!9576 () Bool)

(declare-fun mapRes!9576 () Bool)

(assert (=> mapIsEmpty!9576 mapRes!9576))

(declare-fun b!216360 () Bool)

(declare-fun res!105790 () Bool)

(assert (=> b!216360 (=> (not res!105790) (not e!140760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10459 (_ BitVec 32)) Bool)

(assert (=> b!216360 (= res!105790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(declare-fun res!105786 () Bool)

(assert (=> start!21590 (=> (not res!105786) (not e!140764))))

(declare-fun valid!1168 (LongMapFixedSize!2824) Bool)

(assert (=> start!21590 (= res!105786 (valid!1168 thiss!1504))))

(assert (=> start!21590 e!140764))

(declare-fun e!140761 () Bool)

(assert (=> start!21590 e!140761))

(assert (=> start!21590 true))

(declare-fun b!216361 () Bool)

(declare-fun res!105788 () Bool)

(assert (=> b!216361 (=> (not res!105788) (not e!140760))))

(declare-datatypes ((List!3077 0))(
  ( (Nil!3074) (Cons!3073 (h!3720 (_ BitVec 64)) (t!8024 List!3077)) )
))
(declare-fun arrayNoDuplicates!0 (array!10459 (_ BitVec 32) List!3077) Bool)

(assert (=> b!216361 (= res!105788 (arrayNoDuplicates!0 (_keys!6109 thiss!1504) #b00000000000000000000000000000000 Nil!3074))))

(declare-fun b!216362 () Bool)

(declare-fun res!105792 () Bool)

(assert (=> b!216362 (=> (not res!105792) (not e!140760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216362 (= res!105792 (validMask!0 (mask!9794 thiss!1504)))))

(declare-fun b!216363 () Bool)

(declare-fun e!140758 () Bool)

(assert (=> b!216363 (= e!140758 (and e!140762 mapRes!9576))))

(declare-fun condMapEmpty!9576 () Bool)

(declare-fun mapDefault!9576 () ValueCell!2462)

(assert (=> b!216363 (= condMapEmpty!9576 (= (arr!4951 (_values!4045 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2462)) mapDefault!9576)))))

(declare-fun b!216364 () Bool)

(declare-fun e!140759 () Bool)

(assert (=> b!216364 (= e!140759 tp_is_empty!5611)))

(declare-fun mapNonEmpty!9576 () Bool)

(declare-fun tp!20378 () Bool)

(assert (=> mapNonEmpty!9576 (= mapRes!9576 (and tp!20378 e!140759))))

(declare-fun mapRest!9576 () (Array (_ BitVec 32) ValueCell!2462))

(declare-fun mapKey!9576 () (_ BitVec 32))

(declare-fun mapValue!9576 () ValueCell!2462)

(assert (=> mapNonEmpty!9576 (= (arr!4951 (_values!4045 thiss!1504)) (store mapRest!9576 mapKey!9576 mapValue!9576))))

(declare-fun array_inv!3253 (array!10459) Bool)

(declare-fun array_inv!3254 (array!10457) Bool)

(assert (=> b!216365 (= e!140761 (and tp!20379 tp_is_empty!5611 (array_inv!3253 (_keys!6109 thiss!1504)) (array_inv!3254 (_values!4045 thiss!1504)) e!140758))))

(assert (= (and start!21590 res!105786) b!216356))

(assert (= (and b!216356 res!105789) b!216359))

(assert (= (and b!216359 res!105787) b!216362))

(assert (= (and b!216362 res!105792) b!216355))

(assert (= (and b!216355 res!105791) b!216360))

(assert (= (and b!216360 res!105790) b!216361))

(assert (= (and b!216361 res!105788) b!216357))

(assert (= (and b!216363 condMapEmpty!9576) mapIsEmpty!9576))

(assert (= (and b!216363 (not condMapEmpty!9576)) mapNonEmpty!9576))

(get-info :version)

(assert (= (and mapNonEmpty!9576 ((_ is ValueCellFull!2462) mapValue!9576)) b!216364))

(assert (= (and b!216363 ((_ is ValueCellFull!2462) mapDefault!9576)) b!216358))

(assert (= b!216365 b!216363))

(assert (= start!21590 b!216365))

(declare-fun m!243267 () Bool)

(assert (=> mapNonEmpty!9576 m!243267))

(declare-fun m!243269 () Bool)

(assert (=> start!21590 m!243269))

(declare-fun m!243271 () Bool)

(assert (=> b!216365 m!243271))

(declare-fun m!243273 () Bool)

(assert (=> b!216365 m!243273))

(declare-fun m!243275 () Bool)

(assert (=> b!216362 m!243275))

(declare-fun m!243277 () Bool)

(assert (=> b!216360 m!243277))

(declare-fun m!243279 () Bool)

(assert (=> b!216361 m!243279))

(declare-fun m!243281 () Bool)

(assert (=> b!216359 m!243281))

(check-sat (not start!21590) (not b_next!5749) (not b!216359) (not b!216361) (not b!216362) tp_is_empty!5611 (not mapNonEmpty!9576) (not b!216365) (not b!216360) b_and!12653)
(check-sat b_and!12653 (not b_next!5749))
(get-model)

(declare-fun b!216442 () Bool)

(declare-fun e!140818 () Bool)

(declare-fun e!140816 () Bool)

(assert (=> b!216442 (= e!140818 e!140816)))

(declare-fun c!36330 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216442 (= c!36330 (validKeyInArray!0 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216443 () Bool)

(declare-fun call!20367 () Bool)

(assert (=> b!216443 (= e!140816 call!20367)))

(declare-fun b!216444 () Bool)

(assert (=> b!216444 (= e!140816 call!20367)))

(declare-fun b!216445 () Bool)

(declare-fun e!140817 () Bool)

(declare-fun contains!1416 (List!3077 (_ BitVec 64)) Bool)

(assert (=> b!216445 (= e!140817 (contains!1416 Nil!3074 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58615 () Bool)

(declare-fun res!105841 () Bool)

(declare-fun e!140815 () Bool)

(assert (=> d!58615 (=> res!105841 e!140815)))

(assert (=> d!58615 (= res!105841 (bvsge #b00000000000000000000000000000000 (size!5284 (_keys!6109 thiss!1504))))))

(assert (=> d!58615 (= (arrayNoDuplicates!0 (_keys!6109 thiss!1504) #b00000000000000000000000000000000 Nil!3074) e!140815)))

(declare-fun bm!20364 () Bool)

(assert (=> bm!20364 (= call!20367 (arrayNoDuplicates!0 (_keys!6109 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36330 (Cons!3073 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000) Nil!3074) Nil!3074)))))

(declare-fun b!216446 () Bool)

(assert (=> b!216446 (= e!140815 e!140818)))

(declare-fun res!105843 () Bool)

(assert (=> b!216446 (=> (not res!105843) (not e!140818))))

(assert (=> b!216446 (= res!105843 (not e!140817))))

(declare-fun res!105842 () Bool)

(assert (=> b!216446 (=> (not res!105842) (not e!140817))))

(assert (=> b!216446 (= res!105842 (validKeyInArray!0 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58615 (not res!105841)) b!216446))

(assert (= (and b!216446 res!105842) b!216445))

(assert (= (and b!216446 res!105843) b!216442))

(assert (= (and b!216442 c!36330) b!216444))

(assert (= (and b!216442 (not c!36330)) b!216443))

(assert (= (or b!216444 b!216443) bm!20364))

(declare-fun m!243315 () Bool)

(assert (=> b!216442 m!243315))

(assert (=> b!216442 m!243315))

(declare-fun m!243317 () Bool)

(assert (=> b!216442 m!243317))

(assert (=> b!216445 m!243315))

(assert (=> b!216445 m!243315))

(declare-fun m!243319 () Bool)

(assert (=> b!216445 m!243319))

(assert (=> bm!20364 m!243315))

(declare-fun m!243321 () Bool)

(assert (=> bm!20364 m!243321))

(assert (=> b!216446 m!243315))

(assert (=> b!216446 m!243315))

(assert (=> b!216446 m!243317))

(assert (=> b!216361 d!58615))

(declare-fun d!58617 () Bool)

(assert (=> d!58617 (= (array_inv!3253 (_keys!6109 thiss!1504)) (bvsge (size!5284 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216365 d!58617))

(declare-fun d!58619 () Bool)

(assert (=> d!58619 (= (array_inv!3254 (_values!4045 thiss!1504)) (bvsge (size!5283 (_values!4045 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216365 d!58619))

(declare-fun b!216455 () Bool)

(declare-fun e!140826 () Bool)

(declare-fun e!140825 () Bool)

(assert (=> b!216455 (= e!140826 e!140825)))

(declare-fun lt!111213 () (_ BitVec 64))

(assert (=> b!216455 (= lt!111213 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6492 0))(
  ( (Unit!6493) )
))
(declare-fun lt!111214 () Unit!6492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10459 (_ BitVec 64) (_ BitVec 32)) Unit!6492)

(assert (=> b!216455 (= lt!111214 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6109 thiss!1504) lt!111213 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216455 (arrayContainsKey!0 (_keys!6109 thiss!1504) lt!111213 #b00000000000000000000000000000000)))

(declare-fun lt!111215 () Unit!6492)

(assert (=> b!216455 (= lt!111215 lt!111214)))

(declare-fun res!105849 () Bool)

(assert (=> b!216455 (= res!105849 (= (seekEntryOrOpen!0 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000) (_keys!6109 thiss!1504) (mask!9794 thiss!1504)) (Found!730 #b00000000000000000000000000000000)))))

(assert (=> b!216455 (=> (not res!105849) (not e!140825))))

(declare-fun b!216456 () Bool)

(declare-fun e!140827 () Bool)

(assert (=> b!216456 (= e!140827 e!140826)))

(declare-fun c!36333 () Bool)

(assert (=> b!216456 (= c!36333 (validKeyInArray!0 (select (arr!4952 (_keys!6109 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216457 () Bool)

(declare-fun call!20370 () Bool)

(assert (=> b!216457 (= e!140825 call!20370)))

(declare-fun d!58621 () Bool)

(declare-fun res!105848 () Bool)

(assert (=> d!58621 (=> res!105848 e!140827)))

(assert (=> d!58621 (= res!105848 (bvsge #b00000000000000000000000000000000 (size!5284 (_keys!6109 thiss!1504))))))

(assert (=> d!58621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)) e!140827)))

(declare-fun b!216458 () Bool)

(assert (=> b!216458 (= e!140826 call!20370)))

(declare-fun bm!20367 () Bool)

(assert (=> bm!20367 (= call!20370 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(assert (= (and d!58621 (not res!105848)) b!216456))

(assert (= (and b!216456 c!36333) b!216455))

(assert (= (and b!216456 (not c!36333)) b!216458))

(assert (= (and b!216455 res!105849) b!216457))

(assert (= (or b!216457 b!216458) bm!20367))

(assert (=> b!216455 m!243315))

(declare-fun m!243323 () Bool)

(assert (=> b!216455 m!243323))

(declare-fun m!243325 () Bool)

(assert (=> b!216455 m!243325))

(assert (=> b!216455 m!243315))

(declare-fun m!243327 () Bool)

(assert (=> b!216455 m!243327))

(assert (=> b!216456 m!243315))

(assert (=> b!216456 m!243315))

(assert (=> b!216456 m!243317))

(declare-fun m!243329 () Bool)

(assert (=> bm!20367 m!243329))

(assert (=> b!216360 d!58621))

(declare-fun b!216471 () Bool)

(declare-fun c!36342 () Bool)

(declare-fun lt!111222 () (_ BitVec 64))

(assert (=> b!216471 (= c!36342 (= lt!111222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140834 () SeekEntryResult!730)

(declare-fun e!140836 () SeekEntryResult!730)

(assert (=> b!216471 (= e!140834 e!140836)))

(declare-fun b!216473 () Bool)

(declare-fun lt!111224 () SeekEntryResult!730)

(assert (=> b!216473 (= e!140836 (MissingZero!730 (index!5092 lt!111224)))))

(declare-fun b!216474 () Bool)

(declare-fun e!140835 () SeekEntryResult!730)

(assert (=> b!216474 (= e!140835 e!140834)))

(assert (=> b!216474 (= lt!111222 (select (arr!4952 (_keys!6109 thiss!1504)) (index!5092 lt!111224)))))

(declare-fun c!36341 () Bool)

(assert (=> b!216474 (= c!36341 (= lt!111222 key!932))))

(declare-fun b!216475 () Bool)

(assert (=> b!216475 (= e!140834 (Found!730 (index!5092 lt!111224)))))

(declare-fun b!216476 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10459 (_ BitVec 32)) SeekEntryResult!730)

(assert (=> b!216476 (= e!140836 (seekKeyOrZeroReturnVacant!0 (x!22610 lt!111224) (index!5092 lt!111224) (index!5092 lt!111224) key!932 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(declare-fun d!58623 () Bool)

(declare-fun lt!111223 () SeekEntryResult!730)

(assert (=> d!58623 (and (or ((_ is Undefined!730) lt!111223) (not ((_ is Found!730) lt!111223)) (and (bvsge (index!5091 lt!111223) #b00000000000000000000000000000000) (bvslt (index!5091 lt!111223) (size!5284 (_keys!6109 thiss!1504))))) (or ((_ is Undefined!730) lt!111223) ((_ is Found!730) lt!111223) (not ((_ is MissingZero!730) lt!111223)) (and (bvsge (index!5090 lt!111223) #b00000000000000000000000000000000) (bvslt (index!5090 lt!111223) (size!5284 (_keys!6109 thiss!1504))))) (or ((_ is Undefined!730) lt!111223) ((_ is Found!730) lt!111223) ((_ is MissingZero!730) lt!111223) (not ((_ is MissingVacant!730) lt!111223)) (and (bvsge (index!5093 lt!111223) #b00000000000000000000000000000000) (bvslt (index!5093 lt!111223) (size!5284 (_keys!6109 thiss!1504))))) (or ((_ is Undefined!730) lt!111223) (ite ((_ is Found!730) lt!111223) (= (select (arr!4952 (_keys!6109 thiss!1504)) (index!5091 lt!111223)) key!932) (ite ((_ is MissingZero!730) lt!111223) (= (select (arr!4952 (_keys!6109 thiss!1504)) (index!5090 lt!111223)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!730) lt!111223) (= (select (arr!4952 (_keys!6109 thiss!1504)) (index!5093 lt!111223)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58623 (= lt!111223 e!140835)))

(declare-fun c!36340 () Bool)

(assert (=> d!58623 (= c!36340 (and ((_ is Intermediate!730) lt!111224) (undefined!1542 lt!111224)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10459 (_ BitVec 32)) SeekEntryResult!730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58623 (= lt!111224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9794 thiss!1504)) key!932 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(assert (=> d!58623 (validMask!0 (mask!9794 thiss!1504))))

(assert (=> d!58623 (= (seekEntryOrOpen!0 key!932 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)) lt!111223)))

(declare-fun b!216472 () Bool)

(assert (=> b!216472 (= e!140835 Undefined!730)))

(assert (= (and d!58623 c!36340) b!216472))

(assert (= (and d!58623 (not c!36340)) b!216474))

(assert (= (and b!216474 c!36341) b!216475))

(assert (= (and b!216474 (not c!36341)) b!216471))

(assert (= (and b!216471 c!36342) b!216473))

(assert (= (and b!216471 (not c!36342)) b!216476))

(declare-fun m!243331 () Bool)

(assert (=> b!216474 m!243331))

(declare-fun m!243333 () Bool)

(assert (=> b!216476 m!243333))

(declare-fun m!243335 () Bool)

(assert (=> d!58623 m!243335))

(declare-fun m!243337 () Bool)

(assert (=> d!58623 m!243337))

(declare-fun m!243339 () Bool)

(assert (=> d!58623 m!243339))

(assert (=> d!58623 m!243335))

(declare-fun m!243341 () Bool)

(assert (=> d!58623 m!243341))

(declare-fun m!243343 () Bool)

(assert (=> d!58623 m!243343))

(assert (=> d!58623 m!243275))

(assert (=> b!216359 d!58623))

(declare-fun d!58625 () Bool)

(assert (=> d!58625 (= (validMask!0 (mask!9794 thiss!1504)) (and (or (= (mask!9794 thiss!1504) #b00000000000000000000000000000111) (= (mask!9794 thiss!1504) #b00000000000000000000000000001111) (= (mask!9794 thiss!1504) #b00000000000000000000000000011111) (= (mask!9794 thiss!1504) #b00000000000000000000000000111111) (= (mask!9794 thiss!1504) #b00000000000000000000000001111111) (= (mask!9794 thiss!1504) #b00000000000000000000000011111111) (= (mask!9794 thiss!1504) #b00000000000000000000000111111111) (= (mask!9794 thiss!1504) #b00000000000000000000001111111111) (= (mask!9794 thiss!1504) #b00000000000000000000011111111111) (= (mask!9794 thiss!1504) #b00000000000000000000111111111111) (= (mask!9794 thiss!1504) #b00000000000000000001111111111111) (= (mask!9794 thiss!1504) #b00000000000000000011111111111111) (= (mask!9794 thiss!1504) #b00000000000000000111111111111111) (= (mask!9794 thiss!1504) #b00000000000000001111111111111111) (= (mask!9794 thiss!1504) #b00000000000000011111111111111111) (= (mask!9794 thiss!1504) #b00000000000000111111111111111111) (= (mask!9794 thiss!1504) #b00000000000001111111111111111111) (= (mask!9794 thiss!1504) #b00000000000011111111111111111111) (= (mask!9794 thiss!1504) #b00000000000111111111111111111111) (= (mask!9794 thiss!1504) #b00000000001111111111111111111111) (= (mask!9794 thiss!1504) #b00000000011111111111111111111111) (= (mask!9794 thiss!1504) #b00000000111111111111111111111111) (= (mask!9794 thiss!1504) #b00000001111111111111111111111111) (= (mask!9794 thiss!1504) #b00000011111111111111111111111111) (= (mask!9794 thiss!1504) #b00000111111111111111111111111111) (= (mask!9794 thiss!1504) #b00001111111111111111111111111111) (= (mask!9794 thiss!1504) #b00011111111111111111111111111111) (= (mask!9794 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9794 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216362 d!58625))

(declare-fun d!58627 () Bool)

(declare-fun res!105856 () Bool)

(declare-fun e!140839 () Bool)

(assert (=> d!58627 (=> (not res!105856) (not e!140839))))

(declare-fun simpleValid!223 (LongMapFixedSize!2824) Bool)

(assert (=> d!58627 (= res!105856 (simpleValid!223 thiss!1504))))

(assert (=> d!58627 (= (valid!1168 thiss!1504) e!140839)))

(declare-fun b!216483 () Bool)

(declare-fun res!105857 () Bool)

(assert (=> b!216483 (=> (not res!105857) (not e!140839))))

(declare-fun arrayCountValidKeys!0 (array!10459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216483 (= res!105857 (= (arrayCountValidKeys!0 (_keys!6109 thiss!1504) #b00000000000000000000000000000000 (size!5284 (_keys!6109 thiss!1504))) (_size!1461 thiss!1504)))))

(declare-fun b!216484 () Bool)

(declare-fun res!105858 () Bool)

(assert (=> b!216484 (=> (not res!105858) (not e!140839))))

(assert (=> b!216484 (= res!105858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(declare-fun b!216485 () Bool)

(assert (=> b!216485 (= e!140839 (arrayNoDuplicates!0 (_keys!6109 thiss!1504) #b00000000000000000000000000000000 Nil!3074))))

(assert (= (and d!58627 res!105856) b!216483))

(assert (= (and b!216483 res!105857) b!216484))

(assert (= (and b!216484 res!105858) b!216485))

(declare-fun m!243345 () Bool)

(assert (=> d!58627 m!243345))

(declare-fun m!243347 () Bool)

(assert (=> b!216483 m!243347))

(assert (=> b!216484 m!243277))

(assert (=> b!216485 m!243279))

(assert (=> start!21590 d!58627))

(declare-fun condMapEmpty!9585 () Bool)

(declare-fun mapDefault!9585 () ValueCell!2462)

(assert (=> mapNonEmpty!9576 (= condMapEmpty!9585 (= mapRest!9576 ((as const (Array (_ BitVec 32) ValueCell!2462)) mapDefault!9585)))))

(declare-fun e!140844 () Bool)

(declare-fun mapRes!9585 () Bool)

(assert (=> mapNonEmpty!9576 (= tp!20378 (and e!140844 mapRes!9585))))

(declare-fun b!216492 () Bool)

(declare-fun e!140845 () Bool)

(assert (=> b!216492 (= e!140845 tp_is_empty!5611)))

(declare-fun mapIsEmpty!9585 () Bool)

(assert (=> mapIsEmpty!9585 mapRes!9585))

(declare-fun b!216493 () Bool)

(assert (=> b!216493 (= e!140844 tp_is_empty!5611)))

(declare-fun mapNonEmpty!9585 () Bool)

(declare-fun tp!20394 () Bool)

(assert (=> mapNonEmpty!9585 (= mapRes!9585 (and tp!20394 e!140845))))

(declare-fun mapValue!9585 () ValueCell!2462)

(declare-fun mapKey!9585 () (_ BitVec 32))

(declare-fun mapRest!9585 () (Array (_ BitVec 32) ValueCell!2462))

(assert (=> mapNonEmpty!9585 (= mapRest!9576 (store mapRest!9585 mapKey!9585 mapValue!9585))))

(assert (= (and mapNonEmpty!9576 condMapEmpty!9585) mapIsEmpty!9585))

(assert (= (and mapNonEmpty!9576 (not condMapEmpty!9585)) mapNonEmpty!9585))

(assert (= (and mapNonEmpty!9585 ((_ is ValueCellFull!2462) mapValue!9585)) b!216492))

(assert (= (and mapNonEmpty!9576 ((_ is ValueCellFull!2462) mapDefault!9585)) b!216493))

(declare-fun m!243349 () Bool)

(assert (=> mapNonEmpty!9585 m!243349))

(check-sat (not b!216445) (not b_next!5749) (not b!216456) (not bm!20364) (not b!216484) (not bm!20367) (not b!216476) tp_is_empty!5611 (not b!216485) (not d!58623) (not b!216442) (not b!216455) (not b!216483) (not d!58627) (not mapNonEmpty!9585) b_and!12653 (not b!216446))
(check-sat b_and!12653 (not b_next!5749))
