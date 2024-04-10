; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16462 () Bool)

(assert start!16462)

(declare-fun b!163799 () Bool)

(declare-fun b_free!3807 () Bool)

(declare-fun b_next!3807 () Bool)

(assert (=> b!163799 (= b_free!3807 (not b_next!3807))))

(declare-fun tp!14012 () Bool)

(declare-fun b_and!10221 () Bool)

(assert (=> b!163799 (= tp!14012 b_and!10221)))

(declare-fun b!163798 () Bool)

(declare-fun res!77500 () Bool)

(declare-fun e!107477 () Bool)

(assert (=> b!163798 (=> (not res!77500) (not e!107477))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163798 (= res!77500 (not (= key!828 (bvneg key!828))))))

(declare-fun e!107474 () Bool)

(declare-fun e!107472 () Bool)

(declare-datatypes ((V!4459 0))(
  ( (V!4460 (val!1849 Int)) )
))
(declare-datatypes ((ValueCell!1461 0))(
  ( (ValueCellFull!1461 (v!3714 V!4459)) (EmptyCell!1461) )
))
(declare-datatypes ((array!6309 0))(
  ( (array!6310 (arr!2993 (Array (_ BitVec 32) (_ BitVec 64))) (size!3281 (_ BitVec 32))) )
))
(declare-datatypes ((array!6311 0))(
  ( (array!6312 (arr!2994 (Array (_ BitVec 32) ValueCell!1461)) (size!3282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1830 0))(
  ( (LongMapFixedSize!1831 (defaultEntry!3357 Int) (mask!8029 (_ BitVec 32)) (extraKeys!3098 (_ BitVec 32)) (zeroValue!3200 V!4459) (minValue!3200 V!4459) (_size!964 (_ BitVec 32)) (_keys!5176 array!6309) (_values!3340 array!6311) (_vacant!964 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1830)

(declare-fun tp_is_empty!3609 () Bool)

(declare-fun array_inv!1915 (array!6309) Bool)

(declare-fun array_inv!1916 (array!6311) Bool)

(assert (=> b!163799 (= e!107474 (and tp!14012 tp_is_empty!3609 (array_inv!1915 (_keys!5176 thiss!1248)) (array_inv!1916 (_values!3340 thiss!1248)) e!107472))))

(declare-fun mapIsEmpty!6123 () Bool)

(declare-fun mapRes!6123 () Bool)

(assert (=> mapIsEmpty!6123 mapRes!6123))

(declare-fun b!163800 () Bool)

(declare-fun e!107475 () Bool)

(assert (=> b!163800 (= e!107472 (and e!107475 mapRes!6123))))

(declare-fun condMapEmpty!6123 () Bool)

(declare-fun mapDefault!6123 () ValueCell!1461)

(assert (=> b!163800 (= condMapEmpty!6123 (= (arr!2994 (_values!3340 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1461)) mapDefault!6123)))))

(declare-fun b!163801 () Bool)

(declare-fun e!107471 () Bool)

(assert (=> b!163801 (= e!107471 tp_is_empty!3609)))

(declare-fun b!163802 () Bool)

(declare-fun e!107473 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6309 (_ BitVec 32)) Bool)

(assert (=> b!163802 (= e!107473 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5176 thiss!1248) (mask!8029 thiss!1248))))))

(declare-fun b!163803 () Bool)

(assert (=> b!163803 (= e!107475 tp_is_empty!3609)))

(declare-fun mapNonEmpty!6123 () Bool)

(declare-fun tp!14013 () Bool)

(assert (=> mapNonEmpty!6123 (= mapRes!6123 (and tp!14013 e!107471))))

(declare-fun mapRest!6123 () (Array (_ BitVec 32) ValueCell!1461))

(declare-fun mapKey!6123 () (_ BitVec 32))

(declare-fun mapValue!6123 () ValueCell!1461)

(assert (=> mapNonEmpty!6123 (= (arr!2994 (_values!3340 thiss!1248)) (store mapRest!6123 mapKey!6123 mapValue!6123))))

(declare-fun b!163804 () Bool)

(declare-fun res!77498 () Bool)

(assert (=> b!163804 (=> (not res!77498) (not e!107473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163804 (= res!77498 (validMask!0 (mask!8029 thiss!1248)))))

(declare-fun b!163805 () Bool)

(assert (=> b!163805 (= e!107477 e!107473)))

(declare-fun res!77499 () Bool)

(assert (=> b!163805 (=> (not res!77499) (not e!107473))))

(declare-datatypes ((SeekEntryResult!404 0))(
  ( (MissingZero!404 (index!3784 (_ BitVec 32))) (Found!404 (index!3785 (_ BitVec 32))) (Intermediate!404 (undefined!1216 Bool) (index!3786 (_ BitVec 32)) (x!18160 (_ BitVec 32))) (Undefined!404) (MissingVacant!404 (index!3787 (_ BitVec 32))) )
))
(declare-fun lt!82768 () SeekEntryResult!404)

(get-info :version)

(assert (=> b!163805 (= res!77499 (and (not ((_ is Undefined!404) lt!82768)) (not ((_ is MissingVacant!404) lt!82768)) (not ((_ is MissingZero!404) lt!82768)) ((_ is Found!404) lt!82768)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6309 (_ BitVec 32)) SeekEntryResult!404)

(assert (=> b!163805 (= lt!82768 (seekEntryOrOpen!0 key!828 (_keys!5176 thiss!1248) (mask!8029 thiss!1248)))))

(declare-fun b!163806 () Bool)

(declare-fun res!77501 () Bool)

(assert (=> b!163806 (=> (not res!77501) (not e!107473))))

(assert (=> b!163806 (= res!77501 (and (= (size!3282 (_values!3340 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8029 thiss!1248))) (= (size!3281 (_keys!5176 thiss!1248)) (size!3282 (_values!3340 thiss!1248))) (bvsge (mask!8029 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3098 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3098 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!77502 () Bool)

(assert (=> start!16462 (=> (not res!77502) (not e!107477))))

(declare-fun valid!818 (LongMapFixedSize!1830) Bool)

(assert (=> start!16462 (= res!77502 (valid!818 thiss!1248))))

(assert (=> start!16462 e!107477))

(assert (=> start!16462 e!107474))

(assert (=> start!16462 true))

(assert (= (and start!16462 res!77502) b!163798))

(assert (= (and b!163798 res!77500) b!163805))

(assert (= (and b!163805 res!77499) b!163804))

(assert (= (and b!163804 res!77498) b!163806))

(assert (= (and b!163806 res!77501) b!163802))

(assert (= (and b!163800 condMapEmpty!6123) mapIsEmpty!6123))

(assert (= (and b!163800 (not condMapEmpty!6123)) mapNonEmpty!6123))

(assert (= (and mapNonEmpty!6123 ((_ is ValueCellFull!1461) mapValue!6123)) b!163801))

(assert (= (and b!163800 ((_ is ValueCellFull!1461) mapDefault!6123)) b!163803))

(assert (= b!163799 b!163800))

(assert (= start!16462 b!163799))

(declare-fun m!194281 () Bool)

(assert (=> start!16462 m!194281))

(declare-fun m!194283 () Bool)

(assert (=> mapNonEmpty!6123 m!194283))

(declare-fun m!194285 () Bool)

(assert (=> b!163804 m!194285))

(declare-fun m!194287 () Bool)

(assert (=> b!163802 m!194287))

(declare-fun m!194289 () Bool)

(assert (=> b!163799 m!194289))

(declare-fun m!194291 () Bool)

(assert (=> b!163799 m!194291))

(declare-fun m!194293 () Bool)

(assert (=> b!163805 m!194293))

(check-sat (not b!163802) (not b!163799) (not start!16462) (not b!163805) (not mapNonEmpty!6123) (not b_next!3807) b_and!10221 (not b!163804) tp_is_empty!3609)
(check-sat b_and!10221 (not b_next!3807))
(get-model)

(declare-fun d!51485 () Bool)

(assert (=> d!51485 (= (validMask!0 (mask!8029 thiss!1248)) (and (or (= (mask!8029 thiss!1248) #b00000000000000000000000000000111) (= (mask!8029 thiss!1248) #b00000000000000000000000000001111) (= (mask!8029 thiss!1248) #b00000000000000000000000000011111) (= (mask!8029 thiss!1248) #b00000000000000000000000000111111) (= (mask!8029 thiss!1248) #b00000000000000000000000001111111) (= (mask!8029 thiss!1248) #b00000000000000000000000011111111) (= (mask!8029 thiss!1248) #b00000000000000000000000111111111) (= (mask!8029 thiss!1248) #b00000000000000000000001111111111) (= (mask!8029 thiss!1248) #b00000000000000000000011111111111) (= (mask!8029 thiss!1248) #b00000000000000000000111111111111) (= (mask!8029 thiss!1248) #b00000000000000000001111111111111) (= (mask!8029 thiss!1248) #b00000000000000000011111111111111) (= (mask!8029 thiss!1248) #b00000000000000000111111111111111) (= (mask!8029 thiss!1248) #b00000000000000001111111111111111) (= (mask!8029 thiss!1248) #b00000000000000011111111111111111) (= (mask!8029 thiss!1248) #b00000000000000111111111111111111) (= (mask!8029 thiss!1248) #b00000000000001111111111111111111) (= (mask!8029 thiss!1248) #b00000000000011111111111111111111) (= (mask!8029 thiss!1248) #b00000000000111111111111111111111) (= (mask!8029 thiss!1248) #b00000000001111111111111111111111) (= (mask!8029 thiss!1248) #b00000000011111111111111111111111) (= (mask!8029 thiss!1248) #b00000000111111111111111111111111) (= (mask!8029 thiss!1248) #b00000001111111111111111111111111) (= (mask!8029 thiss!1248) #b00000011111111111111111111111111) (= (mask!8029 thiss!1248) #b00000111111111111111111111111111) (= (mask!8029 thiss!1248) #b00001111111111111111111111111111) (= (mask!8029 thiss!1248) #b00011111111111111111111111111111) (= (mask!8029 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8029 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163804 d!51485))

(declare-fun d!51487 () Bool)

(declare-fun res!77524 () Bool)

(declare-fun e!107501 () Bool)

(assert (=> d!51487 (=> (not res!77524) (not e!107501))))

(declare-fun simpleValid!124 (LongMapFixedSize!1830) Bool)

(assert (=> d!51487 (= res!77524 (simpleValid!124 thiss!1248))))

(assert (=> d!51487 (= (valid!818 thiss!1248) e!107501)))

(declare-fun b!163840 () Bool)

(declare-fun res!77525 () Bool)

(assert (=> b!163840 (=> (not res!77525) (not e!107501))))

(declare-fun arrayCountValidKeys!0 (array!6309 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163840 (= res!77525 (= (arrayCountValidKeys!0 (_keys!5176 thiss!1248) #b00000000000000000000000000000000 (size!3281 (_keys!5176 thiss!1248))) (_size!964 thiss!1248)))))

(declare-fun b!163841 () Bool)

(declare-fun res!77526 () Bool)

(assert (=> b!163841 (=> (not res!77526) (not e!107501))))

(assert (=> b!163841 (= res!77526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5176 thiss!1248) (mask!8029 thiss!1248)))))

(declare-fun b!163842 () Bool)

(declare-datatypes ((List!1993 0))(
  ( (Nil!1990) (Cons!1989 (h!2606 (_ BitVec 64)) (t!6795 List!1993)) )
))
(declare-fun arrayNoDuplicates!0 (array!6309 (_ BitVec 32) List!1993) Bool)

(assert (=> b!163842 (= e!107501 (arrayNoDuplicates!0 (_keys!5176 thiss!1248) #b00000000000000000000000000000000 Nil!1990))))

(assert (= (and d!51487 res!77524) b!163840))

(assert (= (and b!163840 res!77525) b!163841))

(assert (= (and b!163841 res!77526) b!163842))

(declare-fun m!194309 () Bool)

(assert (=> d!51487 m!194309))

(declare-fun m!194311 () Bool)

(assert (=> b!163840 m!194311))

(assert (=> b!163841 m!194287))

(declare-fun m!194313 () Bool)

(assert (=> b!163842 m!194313))

(assert (=> start!16462 d!51487))

(declare-fun b!163855 () Bool)

(declare-fun lt!82779 () SeekEntryResult!404)

(declare-fun e!107508 () SeekEntryResult!404)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6309 (_ BitVec 32)) SeekEntryResult!404)

(assert (=> b!163855 (= e!107508 (seekKeyOrZeroReturnVacant!0 (x!18160 lt!82779) (index!3786 lt!82779) (index!3786 lt!82779) key!828 (_keys!5176 thiss!1248) (mask!8029 thiss!1248)))))

(declare-fun b!163856 () Bool)

(declare-fun c!30160 () Bool)

(declare-fun lt!82778 () (_ BitVec 64))

(assert (=> b!163856 (= c!30160 (= lt!82778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107510 () SeekEntryResult!404)

(assert (=> b!163856 (= e!107510 e!107508)))

(declare-fun b!163857 () Bool)

(assert (=> b!163857 (= e!107508 (MissingZero!404 (index!3786 lt!82779)))))

(declare-fun b!163858 () Bool)

(declare-fun e!107509 () SeekEntryResult!404)

(assert (=> b!163858 (= e!107509 Undefined!404)))

(declare-fun b!163859 () Bool)

(assert (=> b!163859 (= e!107510 (Found!404 (index!3786 lt!82779)))))

(declare-fun b!163860 () Bool)

(assert (=> b!163860 (= e!107509 e!107510)))

(assert (=> b!163860 (= lt!82778 (select (arr!2993 (_keys!5176 thiss!1248)) (index!3786 lt!82779)))))

(declare-fun c!30158 () Bool)

(assert (=> b!163860 (= c!30158 (= lt!82778 key!828))))

(declare-fun d!51489 () Bool)

(declare-fun lt!82780 () SeekEntryResult!404)

(assert (=> d!51489 (and (or ((_ is Undefined!404) lt!82780) (not ((_ is Found!404) lt!82780)) (and (bvsge (index!3785 lt!82780) #b00000000000000000000000000000000) (bvslt (index!3785 lt!82780) (size!3281 (_keys!5176 thiss!1248))))) (or ((_ is Undefined!404) lt!82780) ((_ is Found!404) lt!82780) (not ((_ is MissingZero!404) lt!82780)) (and (bvsge (index!3784 lt!82780) #b00000000000000000000000000000000) (bvslt (index!3784 lt!82780) (size!3281 (_keys!5176 thiss!1248))))) (or ((_ is Undefined!404) lt!82780) ((_ is Found!404) lt!82780) ((_ is MissingZero!404) lt!82780) (not ((_ is MissingVacant!404) lt!82780)) (and (bvsge (index!3787 lt!82780) #b00000000000000000000000000000000) (bvslt (index!3787 lt!82780) (size!3281 (_keys!5176 thiss!1248))))) (or ((_ is Undefined!404) lt!82780) (ite ((_ is Found!404) lt!82780) (= (select (arr!2993 (_keys!5176 thiss!1248)) (index!3785 lt!82780)) key!828) (ite ((_ is MissingZero!404) lt!82780) (= (select (arr!2993 (_keys!5176 thiss!1248)) (index!3784 lt!82780)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!404) lt!82780) (= (select (arr!2993 (_keys!5176 thiss!1248)) (index!3787 lt!82780)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51489 (= lt!82780 e!107509)))

(declare-fun c!30159 () Bool)

(assert (=> d!51489 (= c!30159 (and ((_ is Intermediate!404) lt!82779) (undefined!1216 lt!82779)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6309 (_ BitVec 32)) SeekEntryResult!404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51489 (= lt!82779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8029 thiss!1248)) key!828 (_keys!5176 thiss!1248) (mask!8029 thiss!1248)))))

(assert (=> d!51489 (validMask!0 (mask!8029 thiss!1248))))

(assert (=> d!51489 (= (seekEntryOrOpen!0 key!828 (_keys!5176 thiss!1248) (mask!8029 thiss!1248)) lt!82780)))

(assert (= (and d!51489 c!30159) b!163858))

(assert (= (and d!51489 (not c!30159)) b!163860))

(assert (= (and b!163860 c!30158) b!163859))

(assert (= (and b!163860 (not c!30158)) b!163856))

(assert (= (and b!163856 c!30160) b!163857))

(assert (= (and b!163856 (not c!30160)) b!163855))

(declare-fun m!194315 () Bool)

(assert (=> b!163855 m!194315))

(declare-fun m!194317 () Bool)

(assert (=> b!163860 m!194317))

(declare-fun m!194319 () Bool)

(assert (=> d!51489 m!194319))

(declare-fun m!194321 () Bool)

(assert (=> d!51489 m!194321))

(assert (=> d!51489 m!194321))

(declare-fun m!194323 () Bool)

(assert (=> d!51489 m!194323))

(declare-fun m!194325 () Bool)

(assert (=> d!51489 m!194325))

(declare-fun m!194327 () Bool)

(assert (=> d!51489 m!194327))

(assert (=> d!51489 m!194285))

(assert (=> b!163805 d!51489))

(declare-fun b!163869 () Bool)

(declare-fun e!107519 () Bool)

(declare-fun call!17323 () Bool)

(assert (=> b!163869 (= e!107519 call!17323)))

(declare-fun b!163870 () Bool)

(declare-fun e!107518 () Bool)

(assert (=> b!163870 (= e!107518 call!17323)))

(declare-fun b!163871 () Bool)

(declare-fun e!107517 () Bool)

(assert (=> b!163871 (= e!107517 e!107518)))

(declare-fun c!30163 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163871 (= c!30163 (validKeyInArray!0 (select (arr!2993 (_keys!5176 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17320 () Bool)

(assert (=> bm!17320 (= call!17323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5176 thiss!1248) (mask!8029 thiss!1248)))))

(declare-fun d!51491 () Bool)

(declare-fun res!77532 () Bool)

(assert (=> d!51491 (=> res!77532 e!107517)))

(assert (=> d!51491 (= res!77532 (bvsge #b00000000000000000000000000000000 (size!3281 (_keys!5176 thiss!1248))))))

(assert (=> d!51491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5176 thiss!1248) (mask!8029 thiss!1248)) e!107517)))

(declare-fun b!163872 () Bool)

(assert (=> b!163872 (= e!107518 e!107519)))

(declare-fun lt!82788 () (_ BitVec 64))

(assert (=> b!163872 (= lt!82788 (select (arr!2993 (_keys!5176 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5043 0))(
  ( (Unit!5044) )
))
(declare-fun lt!82787 () Unit!5043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6309 (_ BitVec 64) (_ BitVec 32)) Unit!5043)

(assert (=> b!163872 (= lt!82787 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5176 thiss!1248) lt!82788 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163872 (arrayContainsKey!0 (_keys!5176 thiss!1248) lt!82788 #b00000000000000000000000000000000)))

(declare-fun lt!82789 () Unit!5043)

(assert (=> b!163872 (= lt!82789 lt!82787)))

(declare-fun res!77531 () Bool)

(assert (=> b!163872 (= res!77531 (= (seekEntryOrOpen!0 (select (arr!2993 (_keys!5176 thiss!1248)) #b00000000000000000000000000000000) (_keys!5176 thiss!1248) (mask!8029 thiss!1248)) (Found!404 #b00000000000000000000000000000000)))))

(assert (=> b!163872 (=> (not res!77531) (not e!107519))))

(assert (= (and d!51491 (not res!77532)) b!163871))

(assert (= (and b!163871 c!30163) b!163872))

(assert (= (and b!163871 (not c!30163)) b!163870))

(assert (= (and b!163872 res!77531) b!163869))

(assert (= (or b!163869 b!163870) bm!17320))

(declare-fun m!194329 () Bool)

(assert (=> b!163871 m!194329))

(assert (=> b!163871 m!194329))

(declare-fun m!194331 () Bool)

(assert (=> b!163871 m!194331))

(declare-fun m!194333 () Bool)

(assert (=> bm!17320 m!194333))

(assert (=> b!163872 m!194329))

(declare-fun m!194335 () Bool)

(assert (=> b!163872 m!194335))

(declare-fun m!194337 () Bool)

(assert (=> b!163872 m!194337))

(assert (=> b!163872 m!194329))

(declare-fun m!194339 () Bool)

(assert (=> b!163872 m!194339))

(assert (=> b!163802 d!51491))

(declare-fun d!51493 () Bool)

(assert (=> d!51493 (= (array_inv!1915 (_keys!5176 thiss!1248)) (bvsge (size!3281 (_keys!5176 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163799 d!51493))

(declare-fun d!51495 () Bool)

(assert (=> d!51495 (= (array_inv!1916 (_values!3340 thiss!1248)) (bvsge (size!3282 (_values!3340 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163799 d!51495))

(declare-fun mapNonEmpty!6129 () Bool)

(declare-fun mapRes!6129 () Bool)

(declare-fun tp!14022 () Bool)

(declare-fun e!107524 () Bool)

(assert (=> mapNonEmpty!6129 (= mapRes!6129 (and tp!14022 e!107524))))

(declare-fun mapKey!6129 () (_ BitVec 32))

(declare-fun mapRest!6129 () (Array (_ BitVec 32) ValueCell!1461))

(declare-fun mapValue!6129 () ValueCell!1461)

(assert (=> mapNonEmpty!6129 (= mapRest!6123 (store mapRest!6129 mapKey!6129 mapValue!6129))))

(declare-fun mapIsEmpty!6129 () Bool)

(assert (=> mapIsEmpty!6129 mapRes!6129))

(declare-fun condMapEmpty!6129 () Bool)

(declare-fun mapDefault!6129 () ValueCell!1461)

(assert (=> mapNonEmpty!6123 (= condMapEmpty!6129 (= mapRest!6123 ((as const (Array (_ BitVec 32) ValueCell!1461)) mapDefault!6129)))))

(declare-fun e!107525 () Bool)

(assert (=> mapNonEmpty!6123 (= tp!14013 (and e!107525 mapRes!6129))))

(declare-fun b!163879 () Bool)

(assert (=> b!163879 (= e!107524 tp_is_empty!3609)))

(declare-fun b!163880 () Bool)

(assert (=> b!163880 (= e!107525 tp_is_empty!3609)))

(assert (= (and mapNonEmpty!6123 condMapEmpty!6129) mapIsEmpty!6129))

(assert (= (and mapNonEmpty!6123 (not condMapEmpty!6129)) mapNonEmpty!6129))

(assert (= (and mapNonEmpty!6129 ((_ is ValueCellFull!1461) mapValue!6129)) b!163879))

(assert (= (and mapNonEmpty!6123 ((_ is ValueCellFull!1461) mapDefault!6129)) b!163880))

(declare-fun m!194341 () Bool)

(assert (=> mapNonEmpty!6129 m!194341))

(check-sat (not b!163872) (not b!163840) (not b!163871) (not mapNonEmpty!6129) (not b_next!3807) b_and!10221 (not b!163855) (not b!163841) (not d!51487) (not bm!17320) (not b!163842) (not d!51489) tp_is_empty!3609)
(check-sat b_and!10221 (not b_next!3807))
