; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16464 () Bool)

(assert start!16464)

(declare-fun b!163631 () Bool)

(declare-fun b_free!3805 () Bool)

(declare-fun b_next!3805 () Bool)

(assert (=> b!163631 (= b_free!3805 (not b_next!3805))))

(declare-fun tp!14007 () Bool)

(declare-fun b_and!10193 () Bool)

(assert (=> b!163631 (= tp!14007 b_and!10193)))

(declare-fun res!77388 () Bool)

(declare-fun e!107355 () Bool)

(assert (=> start!16464 (=> (not res!77388) (not e!107355))))

(declare-datatypes ((V!4457 0))(
  ( (V!4458 (val!1848 Int)) )
))
(declare-datatypes ((ValueCell!1460 0))(
  ( (ValueCellFull!1460 (v!3707 V!4457)) (EmptyCell!1460) )
))
(declare-datatypes ((array!6285 0))(
  ( (array!6286 (arr!2980 (Array (_ BitVec 32) (_ BitVec 64))) (size!3269 (_ BitVec 32))) )
))
(declare-datatypes ((array!6287 0))(
  ( (array!6288 (arr!2981 (Array (_ BitVec 32) ValueCell!1460)) (size!3270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1828 0))(
  ( (LongMapFixedSize!1829 (defaultEntry!3356 Int) (mask!8027 (_ BitVec 32)) (extraKeys!3097 (_ BitVec 32)) (zeroValue!3199 V!4457) (minValue!3199 V!4457) (_size!963 (_ BitVec 32)) (_keys!5174 array!6285) (_values!3339 array!6287) (_vacant!963 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1828)

(declare-fun valid!825 (LongMapFixedSize!1828) Bool)

(assert (=> start!16464 (= res!77388 (valid!825 thiss!1248))))

(assert (=> start!16464 e!107355))

(declare-fun e!107352 () Bool)

(assert (=> start!16464 e!107352))

(assert (=> start!16464 true))

(declare-fun b!163624 () Bool)

(declare-fun e!107349 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6285 (_ BitVec 32)) Bool)

(assert (=> b!163624 (= e!107349 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5174 thiss!1248) (mask!8027 thiss!1248))))))

(declare-fun b!163625 () Bool)

(declare-fun res!77392 () Bool)

(assert (=> b!163625 (=> (not res!77392) (not e!107349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163625 (= res!77392 (validMask!0 (mask!8027 thiss!1248)))))

(declare-fun mapNonEmpty!6120 () Bool)

(declare-fun mapRes!6120 () Bool)

(declare-fun tp!14006 () Bool)

(declare-fun e!107351 () Bool)

(assert (=> mapNonEmpty!6120 (= mapRes!6120 (and tp!14006 e!107351))))

(declare-fun mapValue!6120 () ValueCell!1460)

(declare-fun mapKey!6120 () (_ BitVec 32))

(declare-fun mapRest!6120 () (Array (_ BitVec 32) ValueCell!1460))

(assert (=> mapNonEmpty!6120 (= (arr!2981 (_values!3339 thiss!1248)) (store mapRest!6120 mapKey!6120 mapValue!6120))))

(declare-fun b!163626 () Bool)

(declare-fun e!107354 () Bool)

(declare-fun tp_is_empty!3607 () Bool)

(assert (=> b!163626 (= e!107354 tp_is_empty!3607)))

(declare-fun b!163627 () Bool)

(declare-fun res!77389 () Bool)

(assert (=> b!163627 (=> (not res!77389) (not e!107349))))

(assert (=> b!163627 (= res!77389 (and (= (size!3270 (_values!3339 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8027 thiss!1248))) (= (size!3269 (_keys!5174 thiss!1248)) (size!3270 (_values!3339 thiss!1248))) (bvsge (mask!8027 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3097 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3097 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163628 () Bool)

(assert (=> b!163628 (= e!107351 tp_is_empty!3607)))

(declare-fun b!163629 () Bool)

(declare-fun e!107350 () Bool)

(assert (=> b!163629 (= e!107350 (and e!107354 mapRes!6120))))

(declare-fun condMapEmpty!6120 () Bool)

(declare-fun mapDefault!6120 () ValueCell!1460)

(assert (=> b!163629 (= condMapEmpty!6120 (= (arr!2981 (_values!3339 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1460)) mapDefault!6120)))))

(declare-fun b!163630 () Bool)

(assert (=> b!163630 (= e!107355 e!107349)))

(declare-fun res!77391 () Bool)

(assert (=> b!163630 (=> (not res!77391) (not e!107349))))

(declare-datatypes ((SeekEntryResult!413 0))(
  ( (MissingZero!413 (index!3820 (_ BitVec 32))) (Found!413 (index!3821 (_ BitVec 32))) (Intermediate!413 (undefined!1225 Bool) (index!3822 (_ BitVec 32)) (x!18168 (_ BitVec 32))) (Undefined!413) (MissingVacant!413 (index!3823 (_ BitVec 32))) )
))
(declare-fun lt!82584 () SeekEntryResult!413)

(get-info :version)

(assert (=> b!163630 (= res!77391 (and (not ((_ is Undefined!413) lt!82584)) (not ((_ is MissingVacant!413) lt!82584)) (not ((_ is MissingZero!413) lt!82584)) ((_ is Found!413) lt!82584)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6285 (_ BitVec 32)) SeekEntryResult!413)

(assert (=> b!163630 (= lt!82584 (seekEntryOrOpen!0 key!828 (_keys!5174 thiss!1248) (mask!8027 thiss!1248)))))

(declare-fun mapIsEmpty!6120 () Bool)

(assert (=> mapIsEmpty!6120 mapRes!6120))

(declare-fun array_inv!1919 (array!6285) Bool)

(declare-fun array_inv!1920 (array!6287) Bool)

(assert (=> b!163631 (= e!107352 (and tp!14007 tp_is_empty!3607 (array_inv!1919 (_keys!5174 thiss!1248)) (array_inv!1920 (_values!3339 thiss!1248)) e!107350))))

(declare-fun b!163632 () Bool)

(declare-fun res!77390 () Bool)

(assert (=> b!163632 (=> (not res!77390) (not e!107355))))

(assert (=> b!163632 (= res!77390 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16464 res!77388) b!163632))

(assert (= (and b!163632 res!77390) b!163630))

(assert (= (and b!163630 res!77391) b!163625))

(assert (= (and b!163625 res!77392) b!163627))

(assert (= (and b!163627 res!77389) b!163624))

(assert (= (and b!163629 condMapEmpty!6120) mapIsEmpty!6120))

(assert (= (and b!163629 (not condMapEmpty!6120)) mapNonEmpty!6120))

(assert (= (and mapNonEmpty!6120 ((_ is ValueCellFull!1460) mapValue!6120)) b!163628))

(assert (= (and b!163629 ((_ is ValueCellFull!1460) mapDefault!6120)) b!163626))

(assert (= b!163631 b!163629))

(assert (= start!16464 b!163631))

(declare-fun m!193647 () Bool)

(assert (=> b!163624 m!193647))

(declare-fun m!193649 () Bool)

(assert (=> b!163630 m!193649))

(declare-fun m!193651 () Bool)

(assert (=> b!163631 m!193651))

(declare-fun m!193653 () Bool)

(assert (=> b!163631 m!193653))

(declare-fun m!193655 () Bool)

(assert (=> start!16464 m!193655))

(declare-fun m!193657 () Bool)

(assert (=> b!163625 m!193657))

(declare-fun m!193659 () Bool)

(assert (=> mapNonEmpty!6120 m!193659))

(check-sat b_and!10193 (not b_next!3805) (not b!163630) (not b!163625) (not b!163624) tp_is_empty!3607 (not mapNonEmpty!6120) (not start!16464) (not b!163631))
(check-sat b_and!10193 (not b_next!3805))
(get-model)

(declare-fun d!51337 () Bool)

(assert (=> d!51337 (= (validMask!0 (mask!8027 thiss!1248)) (and (or (= (mask!8027 thiss!1248) #b00000000000000000000000000000111) (= (mask!8027 thiss!1248) #b00000000000000000000000000001111) (= (mask!8027 thiss!1248) #b00000000000000000000000000011111) (= (mask!8027 thiss!1248) #b00000000000000000000000000111111) (= (mask!8027 thiss!1248) #b00000000000000000000000001111111) (= (mask!8027 thiss!1248) #b00000000000000000000000011111111) (= (mask!8027 thiss!1248) #b00000000000000000000000111111111) (= (mask!8027 thiss!1248) #b00000000000000000000001111111111) (= (mask!8027 thiss!1248) #b00000000000000000000011111111111) (= (mask!8027 thiss!1248) #b00000000000000000000111111111111) (= (mask!8027 thiss!1248) #b00000000000000000001111111111111) (= (mask!8027 thiss!1248) #b00000000000000000011111111111111) (= (mask!8027 thiss!1248) #b00000000000000000111111111111111) (= (mask!8027 thiss!1248) #b00000000000000001111111111111111) (= (mask!8027 thiss!1248) #b00000000000000011111111111111111) (= (mask!8027 thiss!1248) #b00000000000000111111111111111111) (= (mask!8027 thiss!1248) #b00000000000001111111111111111111) (= (mask!8027 thiss!1248) #b00000000000011111111111111111111) (= (mask!8027 thiss!1248) #b00000000000111111111111111111111) (= (mask!8027 thiss!1248) #b00000000001111111111111111111111) (= (mask!8027 thiss!1248) #b00000000011111111111111111111111) (= (mask!8027 thiss!1248) #b00000000111111111111111111111111) (= (mask!8027 thiss!1248) #b00000001111111111111111111111111) (= (mask!8027 thiss!1248) #b00000011111111111111111111111111) (= (mask!8027 thiss!1248) #b00000111111111111111111111111111) (= (mask!8027 thiss!1248) #b00001111111111111111111111111111) (= (mask!8027 thiss!1248) #b00011111111111111111111111111111) (= (mask!8027 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8027 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163625 d!51337))

(declare-fun b!163699 () Bool)

(declare-fun e!107404 () SeekEntryResult!413)

(declare-fun e!107406 () SeekEntryResult!413)

(assert (=> b!163699 (= e!107404 e!107406)))

(declare-fun lt!82597 () (_ BitVec 64))

(declare-fun lt!82598 () SeekEntryResult!413)

(assert (=> b!163699 (= lt!82597 (select (arr!2980 (_keys!5174 thiss!1248)) (index!3822 lt!82598)))))

(declare-fun c!30132 () Bool)

(assert (=> b!163699 (= c!30132 (= lt!82597 key!828))))

(declare-fun b!163700 () Bool)

(declare-fun e!107405 () SeekEntryResult!413)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6285 (_ BitVec 32)) SeekEntryResult!413)

(assert (=> b!163700 (= e!107405 (seekKeyOrZeroReturnVacant!0 (x!18168 lt!82598) (index!3822 lt!82598) (index!3822 lt!82598) key!828 (_keys!5174 thiss!1248) (mask!8027 thiss!1248)))))

(declare-fun b!163701 () Bool)

(assert (=> b!163701 (= e!107404 Undefined!413)))

(declare-fun b!163702 () Bool)

(assert (=> b!163702 (= e!107406 (Found!413 (index!3822 lt!82598)))))

(declare-fun d!51339 () Bool)

(declare-fun lt!82599 () SeekEntryResult!413)

(assert (=> d!51339 (and (or ((_ is Undefined!413) lt!82599) (not ((_ is Found!413) lt!82599)) (and (bvsge (index!3821 lt!82599) #b00000000000000000000000000000000) (bvslt (index!3821 lt!82599) (size!3269 (_keys!5174 thiss!1248))))) (or ((_ is Undefined!413) lt!82599) ((_ is Found!413) lt!82599) (not ((_ is MissingZero!413) lt!82599)) (and (bvsge (index!3820 lt!82599) #b00000000000000000000000000000000) (bvslt (index!3820 lt!82599) (size!3269 (_keys!5174 thiss!1248))))) (or ((_ is Undefined!413) lt!82599) ((_ is Found!413) lt!82599) ((_ is MissingZero!413) lt!82599) (not ((_ is MissingVacant!413) lt!82599)) (and (bvsge (index!3823 lt!82599) #b00000000000000000000000000000000) (bvslt (index!3823 lt!82599) (size!3269 (_keys!5174 thiss!1248))))) (or ((_ is Undefined!413) lt!82599) (ite ((_ is Found!413) lt!82599) (= (select (arr!2980 (_keys!5174 thiss!1248)) (index!3821 lt!82599)) key!828) (ite ((_ is MissingZero!413) lt!82599) (= (select (arr!2980 (_keys!5174 thiss!1248)) (index!3820 lt!82599)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!413) lt!82599) (= (select (arr!2980 (_keys!5174 thiss!1248)) (index!3823 lt!82599)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51339 (= lt!82599 e!107404)))

(declare-fun c!30134 () Bool)

(assert (=> d!51339 (= c!30134 (and ((_ is Intermediate!413) lt!82598) (undefined!1225 lt!82598)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6285 (_ BitVec 32)) SeekEntryResult!413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51339 (= lt!82598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8027 thiss!1248)) key!828 (_keys!5174 thiss!1248) (mask!8027 thiss!1248)))))

(assert (=> d!51339 (validMask!0 (mask!8027 thiss!1248))))

(assert (=> d!51339 (= (seekEntryOrOpen!0 key!828 (_keys!5174 thiss!1248) (mask!8027 thiss!1248)) lt!82599)))

(declare-fun b!163703 () Bool)

(assert (=> b!163703 (= e!107405 (MissingZero!413 (index!3822 lt!82598)))))

(declare-fun b!163704 () Bool)

(declare-fun c!30133 () Bool)

(assert (=> b!163704 (= c!30133 (= lt!82597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163704 (= e!107406 e!107405)))

(assert (= (and d!51339 c!30134) b!163701))

(assert (= (and d!51339 (not c!30134)) b!163699))

(assert (= (and b!163699 c!30132) b!163702))

(assert (= (and b!163699 (not c!30132)) b!163704))

(assert (= (and b!163704 c!30133) b!163703))

(assert (= (and b!163704 (not c!30133)) b!163700))

(declare-fun m!193689 () Bool)

(assert (=> b!163699 m!193689))

(declare-fun m!193691 () Bool)

(assert (=> b!163700 m!193691))

(declare-fun m!193693 () Bool)

(assert (=> d!51339 m!193693))

(declare-fun m!193695 () Bool)

(assert (=> d!51339 m!193695))

(declare-fun m!193697 () Bool)

(assert (=> d!51339 m!193697))

(declare-fun m!193699 () Bool)

(assert (=> d!51339 m!193699))

(assert (=> d!51339 m!193693))

(declare-fun m!193701 () Bool)

(assert (=> d!51339 m!193701))

(assert (=> d!51339 m!193657))

(assert (=> b!163630 d!51339))

(declare-fun d!51341 () Bool)

(declare-fun res!77429 () Bool)

(declare-fun e!107409 () Bool)

(assert (=> d!51341 (=> (not res!77429) (not e!107409))))

(declare-fun simpleValid!124 (LongMapFixedSize!1828) Bool)

(assert (=> d!51341 (= res!77429 (simpleValid!124 thiss!1248))))

(assert (=> d!51341 (= (valid!825 thiss!1248) e!107409)))

(declare-fun b!163711 () Bool)

(declare-fun res!77430 () Bool)

(assert (=> b!163711 (=> (not res!77430) (not e!107409))))

(declare-fun arrayCountValidKeys!0 (array!6285 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163711 (= res!77430 (= (arrayCountValidKeys!0 (_keys!5174 thiss!1248) #b00000000000000000000000000000000 (size!3269 (_keys!5174 thiss!1248))) (_size!963 thiss!1248)))))

(declare-fun b!163712 () Bool)

(declare-fun res!77431 () Bool)

(assert (=> b!163712 (=> (not res!77431) (not e!107409))))

(assert (=> b!163712 (= res!77431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5174 thiss!1248) (mask!8027 thiss!1248)))))

(declare-fun b!163713 () Bool)

(declare-datatypes ((List!1999 0))(
  ( (Nil!1996) (Cons!1995 (h!2612 (_ BitVec 64)) (t!6792 List!1999)) )
))
(declare-fun arrayNoDuplicates!0 (array!6285 (_ BitVec 32) List!1999) Bool)

(assert (=> b!163713 (= e!107409 (arrayNoDuplicates!0 (_keys!5174 thiss!1248) #b00000000000000000000000000000000 Nil!1996))))

(assert (= (and d!51341 res!77429) b!163711))

(assert (= (and b!163711 res!77430) b!163712))

(assert (= (and b!163712 res!77431) b!163713))

(declare-fun m!193703 () Bool)

(assert (=> d!51341 m!193703))

(declare-fun m!193705 () Bool)

(assert (=> b!163711 m!193705))

(assert (=> b!163712 m!193647))

(declare-fun m!193707 () Bool)

(assert (=> b!163713 m!193707))

(assert (=> start!16464 d!51341))

(declare-fun d!51343 () Bool)

(assert (=> d!51343 (= (array_inv!1919 (_keys!5174 thiss!1248)) (bvsge (size!3269 (_keys!5174 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163631 d!51343))

(declare-fun d!51345 () Bool)

(assert (=> d!51345 (= (array_inv!1920 (_values!3339 thiss!1248)) (bvsge (size!3270 (_values!3339 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163631 d!51345))

(declare-fun b!163722 () Bool)

(declare-fun e!107418 () Bool)

(declare-fun call!17299 () Bool)

(assert (=> b!163722 (= e!107418 call!17299)))

(declare-fun b!163723 () Bool)

(declare-fun e!107417 () Bool)

(assert (=> b!163723 (= e!107417 call!17299)))

(declare-fun bm!17296 () Bool)

(assert (=> bm!17296 (= call!17299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5174 thiss!1248) (mask!8027 thiss!1248)))))

(declare-fun b!163724 () Bool)

(assert (=> b!163724 (= e!107418 e!107417)))

(declare-fun lt!82607 () (_ BitVec 64))

(assert (=> b!163724 (= lt!82607 (select (arr!2980 (_keys!5174 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5013 0))(
  ( (Unit!5014) )
))
(declare-fun lt!82606 () Unit!5013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6285 (_ BitVec 64) (_ BitVec 32)) Unit!5013)

(assert (=> b!163724 (= lt!82606 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5174 thiss!1248) lt!82607 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163724 (arrayContainsKey!0 (_keys!5174 thiss!1248) lt!82607 #b00000000000000000000000000000000)))

(declare-fun lt!82608 () Unit!5013)

(assert (=> b!163724 (= lt!82608 lt!82606)))

(declare-fun res!77437 () Bool)

(assert (=> b!163724 (= res!77437 (= (seekEntryOrOpen!0 (select (arr!2980 (_keys!5174 thiss!1248)) #b00000000000000000000000000000000) (_keys!5174 thiss!1248) (mask!8027 thiss!1248)) (Found!413 #b00000000000000000000000000000000)))))

(assert (=> b!163724 (=> (not res!77437) (not e!107417))))

(declare-fun d!51347 () Bool)

(declare-fun res!77436 () Bool)

(declare-fun e!107416 () Bool)

(assert (=> d!51347 (=> res!77436 e!107416)))

(assert (=> d!51347 (= res!77436 (bvsge #b00000000000000000000000000000000 (size!3269 (_keys!5174 thiss!1248))))))

(assert (=> d!51347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5174 thiss!1248) (mask!8027 thiss!1248)) e!107416)))

(declare-fun b!163725 () Bool)

(assert (=> b!163725 (= e!107416 e!107418)))

(declare-fun c!30137 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163725 (= c!30137 (validKeyInArray!0 (select (arr!2980 (_keys!5174 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51347 (not res!77436)) b!163725))

(assert (= (and b!163725 c!30137) b!163724))

(assert (= (and b!163725 (not c!30137)) b!163722))

(assert (= (and b!163724 res!77437) b!163723))

(assert (= (or b!163723 b!163722) bm!17296))

(declare-fun m!193709 () Bool)

(assert (=> bm!17296 m!193709))

(declare-fun m!193711 () Bool)

(assert (=> b!163724 m!193711))

(declare-fun m!193713 () Bool)

(assert (=> b!163724 m!193713))

(declare-fun m!193715 () Bool)

(assert (=> b!163724 m!193715))

(assert (=> b!163724 m!193711))

(declare-fun m!193717 () Bool)

(assert (=> b!163724 m!193717))

(assert (=> b!163725 m!193711))

(assert (=> b!163725 m!193711))

(declare-fun m!193719 () Bool)

(assert (=> b!163725 m!193719))

(assert (=> b!163624 d!51347))

(declare-fun mapIsEmpty!6129 () Bool)

(declare-fun mapRes!6129 () Bool)

(assert (=> mapIsEmpty!6129 mapRes!6129))

(declare-fun mapNonEmpty!6129 () Bool)

(declare-fun tp!14022 () Bool)

(declare-fun e!107423 () Bool)

(assert (=> mapNonEmpty!6129 (= mapRes!6129 (and tp!14022 e!107423))))

(declare-fun mapValue!6129 () ValueCell!1460)

(declare-fun mapRest!6129 () (Array (_ BitVec 32) ValueCell!1460))

(declare-fun mapKey!6129 () (_ BitVec 32))

(assert (=> mapNonEmpty!6129 (= mapRest!6120 (store mapRest!6129 mapKey!6129 mapValue!6129))))

(declare-fun b!163732 () Bool)

(assert (=> b!163732 (= e!107423 tp_is_empty!3607)))

(declare-fun condMapEmpty!6129 () Bool)

(declare-fun mapDefault!6129 () ValueCell!1460)

(assert (=> mapNonEmpty!6120 (= condMapEmpty!6129 (= mapRest!6120 ((as const (Array (_ BitVec 32) ValueCell!1460)) mapDefault!6129)))))

(declare-fun e!107424 () Bool)

(assert (=> mapNonEmpty!6120 (= tp!14006 (and e!107424 mapRes!6129))))

(declare-fun b!163733 () Bool)

(assert (=> b!163733 (= e!107424 tp_is_empty!3607)))

(assert (= (and mapNonEmpty!6120 condMapEmpty!6129) mapIsEmpty!6129))

(assert (= (and mapNonEmpty!6120 (not condMapEmpty!6129)) mapNonEmpty!6129))

(assert (= (and mapNonEmpty!6129 ((_ is ValueCellFull!1460) mapValue!6129)) b!163732))

(assert (= (and mapNonEmpty!6120 ((_ is ValueCellFull!1460) mapDefault!6129)) b!163733))

(declare-fun m!193721 () Bool)

(assert (=> mapNonEmpty!6129 m!193721))

(check-sat b_and!10193 (not d!51339) (not b_next!3805) (not d!51341) (not b!163700) (not bm!17296) (not b!163725) (not b!163713) (not b!163711) (not b!163724) tp_is_empty!3607 (not b!163712) (not mapNonEmpty!6129))
(check-sat b_and!10193 (not b_next!3805))
