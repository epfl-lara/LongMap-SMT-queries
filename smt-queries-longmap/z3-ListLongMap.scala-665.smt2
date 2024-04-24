; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16434 () Bool)

(assert start!16434)

(declare-fun b!163617 () Bool)

(declare-fun b_free!3799 () Bool)

(declare-fun b_next!3799 () Bool)

(assert (=> b!163617 (= b_free!3799 (not b_next!3799))))

(declare-fun tp!13984 () Bool)

(declare-fun b_and!10227 () Bool)

(assert (=> b!163617 (= tp!13984 b_and!10227)))

(declare-fun b!163611 () Bool)

(declare-fun e!107338 () Bool)

(declare-fun e!107337 () Bool)

(assert (=> b!163611 (= e!107338 e!107337)))

(declare-fun res!77420 () Bool)

(assert (=> b!163611 (=> (not res!77420) (not e!107337))))

(declare-datatypes ((SeekEntryResult!401 0))(
  ( (MissingZero!401 (index!3772 (_ BitVec 32))) (Found!401 (index!3773 (_ BitVec 32))) (Intermediate!401 (undefined!1213 Bool) (index!3774 (_ BitVec 32)) (x!18132 (_ BitVec 32))) (Undefined!401) (MissingVacant!401 (index!3775 (_ BitVec 32))) )
))
(declare-fun lt!82776 () SeekEntryResult!401)

(get-info :version)

(assert (=> b!163611 (= res!77420 (and (not ((_ is Undefined!401) lt!82776)) (not ((_ is MissingVacant!401) lt!82776)) (not ((_ is MissingZero!401) lt!82776)) ((_ is Found!401) lt!82776)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4449 0))(
  ( (V!4450 (val!1845 Int)) )
))
(declare-datatypes ((ValueCell!1457 0))(
  ( (ValueCellFull!1457 (v!3711 V!4449)) (EmptyCell!1457) )
))
(declare-datatypes ((array!6277 0))(
  ( (array!6278 (arr!2978 (Array (_ BitVec 32) (_ BitVec 64))) (size!3265 (_ BitVec 32))) )
))
(declare-datatypes ((array!6279 0))(
  ( (array!6280 (arr!2979 (Array (_ BitVec 32) ValueCell!1457)) (size!3266 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1822 0))(
  ( (LongMapFixedSize!1823 (defaultEntry!3353 Int) (mask!8017 (_ BitVec 32)) (extraKeys!3094 (_ BitVec 32)) (zeroValue!3196 V!4449) (minValue!3196 V!4449) (_size!960 (_ BitVec 32)) (_keys!5168 array!6277) (_values!3336 array!6279) (_vacant!960 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1822)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6277 (_ BitVec 32)) SeekEntryResult!401)

(assert (=> b!163611 (= lt!82776 (seekEntryOrOpen!0 key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(declare-fun mapNonEmpty!6107 () Bool)

(declare-fun mapRes!6107 () Bool)

(declare-fun tp!13985 () Bool)

(declare-fun e!107341 () Bool)

(assert (=> mapNonEmpty!6107 (= mapRes!6107 (and tp!13985 e!107341))))

(declare-fun mapValue!6107 () ValueCell!1457)

(declare-fun mapRest!6107 () (Array (_ BitVec 32) ValueCell!1457))

(declare-fun mapKey!6107 () (_ BitVec 32))

(assert (=> mapNonEmpty!6107 (= (arr!2979 (_values!3336 thiss!1248)) (store mapRest!6107 mapKey!6107 mapValue!6107))))

(declare-fun b!163612 () Bool)

(declare-fun res!77421 () Bool)

(assert (=> b!163612 (=> (not res!77421) (not e!107338))))

(assert (=> b!163612 (= res!77421 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163613 () Bool)

(declare-fun res!77422 () Bool)

(assert (=> b!163613 (=> (not res!77422) (not e!107337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163613 (= res!77422 (validMask!0 (mask!8017 thiss!1248)))))

(declare-fun b!163614 () Bool)

(declare-fun e!107342 () Bool)

(declare-fun tp_is_empty!3601 () Bool)

(assert (=> b!163614 (= e!107342 tp_is_empty!3601)))

(declare-fun res!77423 () Bool)

(assert (=> start!16434 (=> (not res!77423) (not e!107338))))

(declare-fun valid!837 (LongMapFixedSize!1822) Bool)

(assert (=> start!16434 (= res!77423 (valid!837 thiss!1248))))

(assert (=> start!16434 e!107338))

(declare-fun e!107339 () Bool)

(assert (=> start!16434 e!107339))

(assert (=> start!16434 true))

(declare-fun b!163615 () Bool)

(assert (=> b!163615 (= e!107341 tp_is_empty!3601)))

(declare-fun b!163616 () Bool)

(declare-fun e!107340 () Bool)

(assert (=> b!163616 (= e!107340 (and e!107342 mapRes!6107))))

(declare-fun condMapEmpty!6107 () Bool)

(declare-fun mapDefault!6107 () ValueCell!1457)

(assert (=> b!163616 (= condMapEmpty!6107 (= (arr!2979 (_values!3336 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1457)) mapDefault!6107)))))

(declare-fun mapIsEmpty!6107 () Bool)

(assert (=> mapIsEmpty!6107 mapRes!6107))

(declare-fun array_inv!1915 (array!6277) Bool)

(declare-fun array_inv!1916 (array!6279) Bool)

(assert (=> b!163617 (= e!107339 (and tp!13984 tp_is_empty!3601 (array_inv!1915 (_keys!5168 thiss!1248)) (array_inv!1916 (_values!3336 thiss!1248)) e!107340))))

(declare-fun b!163618 () Bool)

(assert (=> b!163618 (= e!107337 (and (= (size!3266 (_values!3336 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8017 thiss!1248))) (= (size!3265 (_keys!5168 thiss!1248)) (size!3266 (_values!3336 thiss!1248))) (bvsge (mask!8017 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3094 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3094 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16434 res!77423) b!163612))

(assert (= (and b!163612 res!77421) b!163611))

(assert (= (and b!163611 res!77420) b!163613))

(assert (= (and b!163613 res!77422) b!163618))

(assert (= (and b!163616 condMapEmpty!6107) mapIsEmpty!6107))

(assert (= (and b!163616 (not condMapEmpty!6107)) mapNonEmpty!6107))

(assert (= (and mapNonEmpty!6107 ((_ is ValueCellFull!1457) mapValue!6107)) b!163615))

(assert (= (and b!163616 ((_ is ValueCellFull!1457) mapDefault!6107)) b!163614))

(assert (= b!163617 b!163616))

(assert (= start!16434 b!163617))

(declare-fun m!194351 () Bool)

(assert (=> mapNonEmpty!6107 m!194351))

(declare-fun m!194353 () Bool)

(assert (=> b!163617 m!194353))

(declare-fun m!194355 () Bool)

(assert (=> b!163617 m!194355))

(declare-fun m!194357 () Bool)

(assert (=> b!163613 m!194357))

(declare-fun m!194359 () Bool)

(assert (=> start!16434 m!194359))

(declare-fun m!194361 () Bool)

(assert (=> b!163611 m!194361))

(check-sat (not b!163613) tp_is_empty!3601 (not start!16434) (not mapNonEmpty!6107) (not b!163611) (not b!163617) b_and!10227 (not b_next!3799))
(check-sat b_and!10227 (not b_next!3799))
(get-model)

(declare-fun b!163679 () Bool)

(declare-fun e!107392 () SeekEntryResult!401)

(declare-fun e!107393 () SeekEntryResult!401)

(assert (=> b!163679 (= e!107392 e!107393)))

(declare-fun lt!82789 () (_ BitVec 64))

(declare-fun lt!82790 () SeekEntryResult!401)

(assert (=> b!163679 (= lt!82789 (select (arr!2978 (_keys!5168 thiss!1248)) (index!3774 lt!82790)))))

(declare-fun c!30132 () Bool)

(assert (=> b!163679 (= c!30132 (= lt!82789 key!828))))

(declare-fun b!163680 () Bool)

(assert (=> b!163680 (= e!107393 (Found!401 (index!3774 lt!82790)))))

(declare-fun b!163681 () Bool)

(declare-fun e!107394 () SeekEntryResult!401)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6277 (_ BitVec 32)) SeekEntryResult!401)

(assert (=> b!163681 (= e!107394 (seekKeyOrZeroReturnVacant!0 (x!18132 lt!82790) (index!3774 lt!82790) (index!3774 lt!82790) key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(declare-fun b!163682 () Bool)

(declare-fun c!30134 () Bool)

(assert (=> b!163682 (= c!30134 (= lt!82789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163682 (= e!107393 e!107394)))

(declare-fun b!163683 () Bool)

(assert (=> b!163683 (= e!107392 Undefined!401)))

(declare-fun b!163684 () Bool)

(assert (=> b!163684 (= e!107394 (MissingZero!401 (index!3774 lt!82790)))))

(declare-fun d!51533 () Bool)

(declare-fun lt!82791 () SeekEntryResult!401)

(assert (=> d!51533 (and (or ((_ is Undefined!401) lt!82791) (not ((_ is Found!401) lt!82791)) (and (bvsge (index!3773 lt!82791) #b00000000000000000000000000000000) (bvslt (index!3773 lt!82791) (size!3265 (_keys!5168 thiss!1248))))) (or ((_ is Undefined!401) lt!82791) ((_ is Found!401) lt!82791) (not ((_ is MissingZero!401) lt!82791)) (and (bvsge (index!3772 lt!82791) #b00000000000000000000000000000000) (bvslt (index!3772 lt!82791) (size!3265 (_keys!5168 thiss!1248))))) (or ((_ is Undefined!401) lt!82791) ((_ is Found!401) lt!82791) ((_ is MissingZero!401) lt!82791) (not ((_ is MissingVacant!401) lt!82791)) (and (bvsge (index!3775 lt!82791) #b00000000000000000000000000000000) (bvslt (index!3775 lt!82791) (size!3265 (_keys!5168 thiss!1248))))) (or ((_ is Undefined!401) lt!82791) (ite ((_ is Found!401) lt!82791) (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3773 lt!82791)) key!828) (ite ((_ is MissingZero!401) lt!82791) (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3772 lt!82791)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!401) lt!82791) (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3775 lt!82791)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51533 (= lt!82791 e!107392)))

(declare-fun c!30133 () Bool)

(assert (=> d!51533 (= c!30133 (and ((_ is Intermediate!401) lt!82790) (undefined!1213 lt!82790)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6277 (_ BitVec 32)) SeekEntryResult!401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51533 (= lt!82790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8017 thiss!1248)) key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(assert (=> d!51533 (validMask!0 (mask!8017 thiss!1248))))

(assert (=> d!51533 (= (seekEntryOrOpen!0 key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)) lt!82791)))

(assert (= (and d!51533 c!30133) b!163683))

(assert (= (and d!51533 (not c!30133)) b!163679))

(assert (= (and b!163679 c!30132) b!163680))

(assert (= (and b!163679 (not c!30132)) b!163682))

(assert (= (and b!163682 c!30134) b!163684))

(assert (= (and b!163682 (not c!30134)) b!163681))

(declare-fun m!194387 () Bool)

(assert (=> b!163679 m!194387))

(declare-fun m!194389 () Bool)

(assert (=> b!163681 m!194389))

(declare-fun m!194391 () Bool)

(assert (=> d!51533 m!194391))

(declare-fun m!194393 () Bool)

(assert (=> d!51533 m!194393))

(declare-fun m!194395 () Bool)

(assert (=> d!51533 m!194395))

(declare-fun m!194397 () Bool)

(assert (=> d!51533 m!194397))

(declare-fun m!194399 () Bool)

(assert (=> d!51533 m!194399))

(assert (=> d!51533 m!194357))

(assert (=> d!51533 m!194397))

(assert (=> b!163611 d!51533))

(declare-fun d!51535 () Bool)

(declare-fun res!77454 () Bool)

(declare-fun e!107397 () Bool)

(assert (=> d!51535 (=> (not res!77454) (not e!107397))))

(declare-fun simpleValid!123 (LongMapFixedSize!1822) Bool)

(assert (=> d!51535 (= res!77454 (simpleValid!123 thiss!1248))))

(assert (=> d!51535 (= (valid!837 thiss!1248) e!107397)))

(declare-fun b!163691 () Bool)

(declare-fun res!77455 () Bool)

(assert (=> b!163691 (=> (not res!77455) (not e!107397))))

(declare-fun arrayCountValidKeys!0 (array!6277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163691 (= res!77455 (= (arrayCountValidKeys!0 (_keys!5168 thiss!1248) #b00000000000000000000000000000000 (size!3265 (_keys!5168 thiss!1248))) (_size!960 thiss!1248)))))

(declare-fun b!163692 () Bool)

(declare-fun res!77456 () Bool)

(assert (=> b!163692 (=> (not res!77456) (not e!107397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6277 (_ BitVec 32)) Bool)

(assert (=> b!163692 (= res!77456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(declare-fun b!163693 () Bool)

(declare-datatypes ((List!1988 0))(
  ( (Nil!1985) (Cons!1984 (h!2600 (_ BitVec 64)) (t!6782 List!1988)) )
))
(declare-fun arrayNoDuplicates!0 (array!6277 (_ BitVec 32) List!1988) Bool)

(assert (=> b!163693 (= e!107397 (arrayNoDuplicates!0 (_keys!5168 thiss!1248) #b00000000000000000000000000000000 Nil!1985))))

(assert (= (and d!51535 res!77454) b!163691))

(assert (= (and b!163691 res!77455) b!163692))

(assert (= (and b!163692 res!77456) b!163693))

(declare-fun m!194401 () Bool)

(assert (=> d!51535 m!194401))

(declare-fun m!194403 () Bool)

(assert (=> b!163691 m!194403))

(declare-fun m!194405 () Bool)

(assert (=> b!163692 m!194405))

(declare-fun m!194407 () Bool)

(assert (=> b!163693 m!194407))

(assert (=> start!16434 d!51535))

(declare-fun d!51537 () Bool)

(assert (=> d!51537 (= (validMask!0 (mask!8017 thiss!1248)) (and (or (= (mask!8017 thiss!1248) #b00000000000000000000000000000111) (= (mask!8017 thiss!1248) #b00000000000000000000000000001111) (= (mask!8017 thiss!1248) #b00000000000000000000000000011111) (= (mask!8017 thiss!1248) #b00000000000000000000000000111111) (= (mask!8017 thiss!1248) #b00000000000000000000000001111111) (= (mask!8017 thiss!1248) #b00000000000000000000000011111111) (= (mask!8017 thiss!1248) #b00000000000000000000000111111111) (= (mask!8017 thiss!1248) #b00000000000000000000001111111111) (= (mask!8017 thiss!1248) #b00000000000000000000011111111111) (= (mask!8017 thiss!1248) #b00000000000000000000111111111111) (= (mask!8017 thiss!1248) #b00000000000000000001111111111111) (= (mask!8017 thiss!1248) #b00000000000000000011111111111111) (= (mask!8017 thiss!1248) #b00000000000000000111111111111111) (= (mask!8017 thiss!1248) #b00000000000000001111111111111111) (= (mask!8017 thiss!1248) #b00000000000000011111111111111111) (= (mask!8017 thiss!1248) #b00000000000000111111111111111111) (= (mask!8017 thiss!1248) #b00000000000001111111111111111111) (= (mask!8017 thiss!1248) #b00000000000011111111111111111111) (= (mask!8017 thiss!1248) #b00000000000111111111111111111111) (= (mask!8017 thiss!1248) #b00000000001111111111111111111111) (= (mask!8017 thiss!1248) #b00000000011111111111111111111111) (= (mask!8017 thiss!1248) #b00000000111111111111111111111111) (= (mask!8017 thiss!1248) #b00000001111111111111111111111111) (= (mask!8017 thiss!1248) #b00000011111111111111111111111111) (= (mask!8017 thiss!1248) #b00000111111111111111111111111111) (= (mask!8017 thiss!1248) #b00001111111111111111111111111111) (= (mask!8017 thiss!1248) #b00011111111111111111111111111111) (= (mask!8017 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8017 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163613 d!51537))

(declare-fun d!51539 () Bool)

(assert (=> d!51539 (= (array_inv!1915 (_keys!5168 thiss!1248)) (bvsge (size!3265 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163617 d!51539))

(declare-fun d!51541 () Bool)

(assert (=> d!51541 (= (array_inv!1916 (_values!3336 thiss!1248)) (bvsge (size!3266 (_values!3336 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163617 d!51541))

(declare-fun condMapEmpty!6116 () Bool)

(declare-fun mapDefault!6116 () ValueCell!1457)

(assert (=> mapNonEmpty!6107 (= condMapEmpty!6116 (= mapRest!6107 ((as const (Array (_ BitVec 32) ValueCell!1457)) mapDefault!6116)))))

(declare-fun e!107402 () Bool)

(declare-fun mapRes!6116 () Bool)

(assert (=> mapNonEmpty!6107 (= tp!13985 (and e!107402 mapRes!6116))))

(declare-fun mapIsEmpty!6116 () Bool)

(assert (=> mapIsEmpty!6116 mapRes!6116))

(declare-fun mapNonEmpty!6116 () Bool)

(declare-fun tp!14000 () Bool)

(declare-fun e!107403 () Bool)

(assert (=> mapNonEmpty!6116 (= mapRes!6116 (and tp!14000 e!107403))))

(declare-fun mapRest!6116 () (Array (_ BitVec 32) ValueCell!1457))

(declare-fun mapValue!6116 () ValueCell!1457)

(declare-fun mapKey!6116 () (_ BitVec 32))

(assert (=> mapNonEmpty!6116 (= mapRest!6107 (store mapRest!6116 mapKey!6116 mapValue!6116))))

(declare-fun b!163700 () Bool)

(assert (=> b!163700 (= e!107403 tp_is_empty!3601)))

(declare-fun b!163701 () Bool)

(assert (=> b!163701 (= e!107402 tp_is_empty!3601)))

(assert (= (and mapNonEmpty!6107 condMapEmpty!6116) mapIsEmpty!6116))

(assert (= (and mapNonEmpty!6107 (not condMapEmpty!6116)) mapNonEmpty!6116))

(assert (= (and mapNonEmpty!6116 ((_ is ValueCellFull!1457) mapValue!6116)) b!163700))

(assert (= (and mapNonEmpty!6107 ((_ is ValueCellFull!1457) mapDefault!6116)) b!163701))

(declare-fun m!194409 () Bool)

(assert (=> mapNonEmpty!6116 m!194409))

(check-sat (not mapNonEmpty!6116) (not b!163691) tp_is_empty!3601 (not d!51535) (not b!163692) (not b!163693) b_and!10227 (not d!51533) (not b_next!3799) (not b!163681))
(check-sat b_and!10227 (not b_next!3799))
(get-model)

(declare-fun d!51543 () Bool)

(declare-fun res!77468 () Bool)

(declare-fun e!107406 () Bool)

(assert (=> d!51543 (=> (not res!77468) (not e!107406))))

(assert (=> d!51543 (= res!77468 (validMask!0 (mask!8017 thiss!1248)))))

(assert (=> d!51543 (= (simpleValid!123 thiss!1248) e!107406)))

(declare-fun b!163710 () Bool)

(declare-fun res!77465 () Bool)

(assert (=> b!163710 (=> (not res!77465) (not e!107406))))

(assert (=> b!163710 (= res!77465 (and (= (size!3266 (_values!3336 thiss!1248)) (bvadd (mask!8017 thiss!1248) #b00000000000000000000000000000001)) (= (size!3265 (_keys!5168 thiss!1248)) (size!3266 (_values!3336 thiss!1248))) (bvsge (_size!960 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!960 thiss!1248) (bvadd (mask!8017 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163712 () Bool)

(declare-fun res!77466 () Bool)

(assert (=> b!163712 (=> (not res!77466) (not e!107406))))

(declare-fun size!3271 (LongMapFixedSize!1822) (_ BitVec 32))

(assert (=> b!163712 (= res!77466 (= (size!3271 thiss!1248) (bvadd (_size!960 thiss!1248) (bvsdiv (bvadd (extraKeys!3094 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163713 () Bool)

(assert (=> b!163713 (= e!107406 (and (bvsge (extraKeys!3094 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3094 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!960 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163711 () Bool)

(declare-fun res!77467 () Bool)

(assert (=> b!163711 (=> (not res!77467) (not e!107406))))

(assert (=> b!163711 (= res!77467 (bvsge (size!3271 thiss!1248) (_size!960 thiss!1248)))))

(assert (= (and d!51543 res!77468) b!163710))

(assert (= (and b!163710 res!77465) b!163711))

(assert (= (and b!163711 res!77467) b!163712))

(assert (= (and b!163712 res!77466) b!163713))

(assert (=> d!51543 m!194357))

(declare-fun m!194411 () Bool)

(assert (=> b!163712 m!194411))

(assert (=> b!163711 m!194411))

(assert (=> d!51535 d!51543))

(declare-fun b!163732 () Bool)

(declare-fun e!107421 () SeekEntryResult!401)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163732 (= e!107421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8017 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8017 thiss!1248)) key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(declare-fun b!163733 () Bool)

(assert (=> b!163733 (= e!107421 (Intermediate!401 false (toIndex!0 key!828 (mask!8017 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163734 () Bool)

(declare-fun lt!82797 () SeekEntryResult!401)

(assert (=> b!163734 (and (bvsge (index!3774 lt!82797) #b00000000000000000000000000000000) (bvslt (index!3774 lt!82797) (size!3265 (_keys!5168 thiss!1248))))))

(declare-fun res!77476 () Bool)

(assert (=> b!163734 (= res!77476 (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3774 lt!82797)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107419 () Bool)

(assert (=> b!163734 (=> res!77476 e!107419)))

(declare-fun b!163735 () Bool)

(declare-fun e!107420 () SeekEntryResult!401)

(assert (=> b!163735 (= e!107420 (Intermediate!401 true (toIndex!0 key!828 (mask!8017 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163736 () Bool)

(declare-fun e!107417 () Bool)

(assert (=> b!163736 (= e!107417 (bvsge (x!18132 lt!82797) #b01111111111111111111111111111110))))

(declare-fun b!163738 () Bool)

(assert (=> b!163738 (and (bvsge (index!3774 lt!82797) #b00000000000000000000000000000000) (bvslt (index!3774 lt!82797) (size!3265 (_keys!5168 thiss!1248))))))

(declare-fun res!77475 () Bool)

(assert (=> b!163738 (= res!77475 (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3774 lt!82797)) key!828))))

(assert (=> b!163738 (=> res!77475 e!107419)))

(declare-fun e!107418 () Bool)

(assert (=> b!163738 (= e!107418 e!107419)))

(declare-fun d!51545 () Bool)

(assert (=> d!51545 e!107417))

(declare-fun c!30142 () Bool)

(assert (=> d!51545 (= c!30142 (and ((_ is Intermediate!401) lt!82797) (undefined!1213 lt!82797)))))

(assert (=> d!51545 (= lt!82797 e!107420)))

(declare-fun c!30141 () Bool)

(assert (=> d!51545 (= c!30141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!82796 () (_ BitVec 64))

(assert (=> d!51545 (= lt!82796 (select (arr!2978 (_keys!5168 thiss!1248)) (toIndex!0 key!828 (mask!8017 thiss!1248))))))

(assert (=> d!51545 (validMask!0 (mask!8017 thiss!1248))))

(assert (=> d!51545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8017 thiss!1248)) key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)) lt!82797)))

(declare-fun b!163737 () Bool)

(assert (=> b!163737 (= e!107420 e!107421)))

(declare-fun c!30143 () Bool)

(assert (=> b!163737 (= c!30143 (or (= lt!82796 key!828) (= (bvadd lt!82796 lt!82796) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163739 () Bool)

(assert (=> b!163739 (= e!107417 e!107418)))

(declare-fun res!77477 () Bool)

(assert (=> b!163739 (= res!77477 (and ((_ is Intermediate!401) lt!82797) (not (undefined!1213 lt!82797)) (bvslt (x!18132 lt!82797) #b01111111111111111111111111111110) (bvsge (x!18132 lt!82797) #b00000000000000000000000000000000) (bvsge (x!18132 lt!82797) #b00000000000000000000000000000000)))))

(assert (=> b!163739 (=> (not res!77477) (not e!107418))))

(declare-fun b!163740 () Bool)

(assert (=> b!163740 (and (bvsge (index!3774 lt!82797) #b00000000000000000000000000000000) (bvslt (index!3774 lt!82797) (size!3265 (_keys!5168 thiss!1248))))))

(assert (=> b!163740 (= e!107419 (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3774 lt!82797)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51545 c!30141) b!163735))

(assert (= (and d!51545 (not c!30141)) b!163737))

(assert (= (and b!163737 c!30143) b!163733))

(assert (= (and b!163737 (not c!30143)) b!163732))

(assert (= (and d!51545 c!30142) b!163736))

(assert (= (and d!51545 (not c!30142)) b!163739))

(assert (= (and b!163739 res!77477) b!163738))

(assert (= (and b!163738 (not res!77475)) b!163734))

(assert (= (and b!163734 (not res!77476)) b!163740))

(declare-fun m!194413 () Bool)

(assert (=> b!163740 m!194413))

(assert (=> b!163738 m!194413))

(assert (=> d!51545 m!194397))

(declare-fun m!194415 () Bool)

(assert (=> d!51545 m!194415))

(assert (=> d!51545 m!194357))

(assert (=> b!163732 m!194397))

(declare-fun m!194417 () Bool)

(assert (=> b!163732 m!194417))

(assert (=> b!163732 m!194417))

(declare-fun m!194419 () Bool)

(assert (=> b!163732 m!194419))

(assert (=> b!163734 m!194413))

(assert (=> d!51533 d!51545))

(declare-fun d!51547 () Bool)

(declare-fun lt!82803 () (_ BitVec 32))

(declare-fun lt!82802 () (_ BitVec 32))

(assert (=> d!51547 (= lt!82803 (bvmul (bvxor lt!82802 (bvlshr lt!82802 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51547 (= lt!82802 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51547 (and (bvsge (mask!8017 thiss!1248) #b00000000000000000000000000000000) (let ((res!77478 (let ((h!2601 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18148 (bvmul (bvxor h!2601 (bvlshr h!2601 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18148 (bvlshr x!18148 #b00000000000000000000000000001101)) (mask!8017 thiss!1248)))))) (and (bvslt res!77478 (bvadd (mask!8017 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77478 #b00000000000000000000000000000000))))))

(assert (=> d!51547 (= (toIndex!0 key!828 (mask!8017 thiss!1248)) (bvand (bvxor lt!82803 (bvlshr lt!82803 #b00000000000000000000000000001101)) (mask!8017 thiss!1248)))))

(assert (=> d!51533 d!51547))

(assert (=> d!51533 d!51537))

(declare-fun b!163749 () Bool)

(declare-fun e!107426 () (_ BitVec 32))

(declare-fun call!17302 () (_ BitVec 32))

(assert (=> b!163749 (= e!107426 (bvadd #b00000000000000000000000000000001 call!17302))))

(declare-fun bm!17299 () Bool)

(assert (=> bm!17299 (= call!17302 (arrayCountValidKeys!0 (_keys!5168 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3265 (_keys!5168 thiss!1248))))))

(declare-fun b!163750 () Bool)

(declare-fun e!107427 () (_ BitVec 32))

(assert (=> b!163750 (= e!107427 #b00000000000000000000000000000000)))

(declare-fun b!163751 () Bool)

(assert (=> b!163751 (= e!107427 e!107426)))

(declare-fun c!30149 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163751 (= c!30149 (validKeyInArray!0 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163752 () Bool)

(assert (=> b!163752 (= e!107426 call!17302)))

(declare-fun d!51549 () Bool)

(declare-fun lt!82806 () (_ BitVec 32))

(assert (=> d!51549 (and (bvsge lt!82806 #b00000000000000000000000000000000) (bvsle lt!82806 (bvsub (size!3265 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51549 (= lt!82806 e!107427)))

(declare-fun c!30148 () Bool)

(assert (=> d!51549 (= c!30148 (bvsge #b00000000000000000000000000000000 (size!3265 (_keys!5168 thiss!1248))))))

(assert (=> d!51549 (and (bvsle #b00000000000000000000000000000000 (size!3265 (_keys!5168 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3265 (_keys!5168 thiss!1248)) (size!3265 (_keys!5168 thiss!1248))))))

(assert (=> d!51549 (= (arrayCountValidKeys!0 (_keys!5168 thiss!1248) #b00000000000000000000000000000000 (size!3265 (_keys!5168 thiss!1248))) lt!82806)))

(assert (= (and d!51549 c!30148) b!163750))

(assert (= (and d!51549 (not c!30148)) b!163751))

(assert (= (and b!163751 c!30149) b!163749))

(assert (= (and b!163751 (not c!30149)) b!163752))

(assert (= (or b!163749 b!163752) bm!17299))

(declare-fun m!194421 () Bool)

(assert (=> bm!17299 m!194421))

(declare-fun m!194423 () Bool)

(assert (=> b!163751 m!194423))

(assert (=> b!163751 m!194423))

(declare-fun m!194425 () Bool)

(assert (=> b!163751 m!194425))

(assert (=> b!163691 d!51549))

(declare-fun b!163761 () Bool)

(declare-fun e!107436 () Bool)

(declare-fun e!107434 () Bool)

(assert (=> b!163761 (= e!107436 e!107434)))

(declare-fun c!30152 () Bool)

(assert (=> b!163761 (= c!30152 (validKeyInArray!0 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51551 () Bool)

(declare-fun res!77484 () Bool)

(assert (=> d!51551 (=> res!77484 e!107436)))

(assert (=> d!51551 (= res!77484 (bvsge #b00000000000000000000000000000000 (size!3265 (_keys!5168 thiss!1248))))))

(assert (=> d!51551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)) e!107436)))

(declare-fun bm!17302 () Bool)

(declare-fun call!17305 () Bool)

(assert (=> bm!17302 (= call!17305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(declare-fun b!163762 () Bool)

(declare-fun e!107435 () Bool)

(assert (=> b!163762 (= e!107435 call!17305)))

(declare-fun b!163763 () Bool)

(assert (=> b!163763 (= e!107434 e!107435)))

(declare-fun lt!82814 () (_ BitVec 64))

(assert (=> b!163763 (= lt!82814 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5048 0))(
  ( (Unit!5049) )
))
(declare-fun lt!82815 () Unit!5048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6277 (_ BitVec 64) (_ BitVec 32)) Unit!5048)

(assert (=> b!163763 (= lt!82815 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5168 thiss!1248) lt!82814 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163763 (arrayContainsKey!0 (_keys!5168 thiss!1248) lt!82814 #b00000000000000000000000000000000)))

(declare-fun lt!82813 () Unit!5048)

(assert (=> b!163763 (= lt!82813 lt!82815)))

(declare-fun res!77483 () Bool)

(assert (=> b!163763 (= res!77483 (= (seekEntryOrOpen!0 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000) (_keys!5168 thiss!1248) (mask!8017 thiss!1248)) (Found!401 #b00000000000000000000000000000000)))))

(assert (=> b!163763 (=> (not res!77483) (not e!107435))))

(declare-fun b!163764 () Bool)

(assert (=> b!163764 (= e!107434 call!17305)))

(assert (= (and d!51551 (not res!77484)) b!163761))

(assert (= (and b!163761 c!30152) b!163763))

(assert (= (and b!163761 (not c!30152)) b!163764))

(assert (= (and b!163763 res!77483) b!163762))

(assert (= (or b!163762 b!163764) bm!17302))

(assert (=> b!163761 m!194423))

(assert (=> b!163761 m!194423))

(assert (=> b!163761 m!194425))

(declare-fun m!194427 () Bool)

(assert (=> bm!17302 m!194427))

(assert (=> b!163763 m!194423))

(declare-fun m!194429 () Bool)

(assert (=> b!163763 m!194429))

(declare-fun m!194431 () Bool)

(assert (=> b!163763 m!194431))

(assert (=> b!163763 m!194423))

(declare-fun m!194433 () Bool)

(assert (=> b!163763 m!194433))

(assert (=> b!163692 d!51551))

(declare-fun b!163777 () Bool)

(declare-fun e!107444 () SeekEntryResult!401)

(assert (=> b!163777 (= e!107444 Undefined!401)))

(declare-fun b!163779 () Bool)

(declare-fun e!107443 () SeekEntryResult!401)

(assert (=> b!163779 (= e!107444 e!107443)))

(declare-fun c!30159 () Bool)

(declare-fun lt!82821 () (_ BitVec 64))

(assert (=> b!163779 (= c!30159 (= lt!82821 key!828))))

(declare-fun b!163780 () Bool)

(declare-fun c!30160 () Bool)

(assert (=> b!163780 (= c!30160 (= lt!82821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107445 () SeekEntryResult!401)

(assert (=> b!163780 (= e!107443 e!107445)))

(declare-fun b!163781 () Bool)

(assert (=> b!163781 (= e!107443 (Found!401 (index!3774 lt!82790)))))

(declare-fun b!163782 () Bool)

(assert (=> b!163782 (= e!107445 (MissingVacant!401 (index!3774 lt!82790)))))

(declare-fun b!163778 () Bool)

(assert (=> b!163778 (= e!107445 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18132 lt!82790) #b00000000000000000000000000000001) (nextIndex!0 (index!3774 lt!82790) (bvadd (x!18132 lt!82790) #b00000000000000000000000000000001) (mask!8017 thiss!1248)) (index!3774 lt!82790) key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)))))

(declare-fun d!51553 () Bool)

(declare-fun lt!82820 () SeekEntryResult!401)

(assert (=> d!51553 (and (or ((_ is Undefined!401) lt!82820) (not ((_ is Found!401) lt!82820)) (and (bvsge (index!3773 lt!82820) #b00000000000000000000000000000000) (bvslt (index!3773 lt!82820) (size!3265 (_keys!5168 thiss!1248))))) (or ((_ is Undefined!401) lt!82820) ((_ is Found!401) lt!82820) (not ((_ is MissingVacant!401) lt!82820)) (not (= (index!3775 lt!82820) (index!3774 lt!82790))) (and (bvsge (index!3775 lt!82820) #b00000000000000000000000000000000) (bvslt (index!3775 lt!82820) (size!3265 (_keys!5168 thiss!1248))))) (or ((_ is Undefined!401) lt!82820) (ite ((_ is Found!401) lt!82820) (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3773 lt!82820)) key!828) (and ((_ is MissingVacant!401) lt!82820) (= (index!3775 lt!82820) (index!3774 lt!82790)) (= (select (arr!2978 (_keys!5168 thiss!1248)) (index!3775 lt!82820)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51553 (= lt!82820 e!107444)))

(declare-fun c!30161 () Bool)

(assert (=> d!51553 (= c!30161 (bvsge (x!18132 lt!82790) #b01111111111111111111111111111110))))

(assert (=> d!51553 (= lt!82821 (select (arr!2978 (_keys!5168 thiss!1248)) (index!3774 lt!82790)))))

(assert (=> d!51553 (validMask!0 (mask!8017 thiss!1248))))

(assert (=> d!51553 (= (seekKeyOrZeroReturnVacant!0 (x!18132 lt!82790) (index!3774 lt!82790) (index!3774 lt!82790) key!828 (_keys!5168 thiss!1248) (mask!8017 thiss!1248)) lt!82820)))

(assert (= (and d!51553 c!30161) b!163777))

(assert (= (and d!51553 (not c!30161)) b!163779))

(assert (= (and b!163779 c!30159) b!163781))

(assert (= (and b!163779 (not c!30159)) b!163780))

(assert (= (and b!163780 c!30160) b!163782))

(assert (= (and b!163780 (not c!30160)) b!163778))

(declare-fun m!194435 () Bool)

(assert (=> b!163778 m!194435))

(assert (=> b!163778 m!194435))

(declare-fun m!194437 () Bool)

(assert (=> b!163778 m!194437))

(declare-fun m!194439 () Bool)

(assert (=> d!51553 m!194439))

(declare-fun m!194441 () Bool)

(assert (=> d!51553 m!194441))

(assert (=> d!51553 m!194387))

(assert (=> d!51553 m!194357))

(assert (=> b!163681 d!51553))

(declare-fun b!163793 () Bool)

(declare-fun e!107454 () Bool)

(declare-fun e!107457 () Bool)

(assert (=> b!163793 (= e!107454 e!107457)))

(declare-fun res!77493 () Bool)

(assert (=> b!163793 (=> (not res!77493) (not e!107457))))

(declare-fun e!107455 () Bool)

(assert (=> b!163793 (= res!77493 (not e!107455))))

(declare-fun res!77492 () Bool)

(assert (=> b!163793 (=> (not res!77492) (not e!107455))))

(assert (=> b!163793 (= res!77492 (validKeyInArray!0 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17305 () Bool)

(declare-fun call!17308 () Bool)

(declare-fun c!30164 () Bool)

(assert (=> bm!17305 (= call!17308 (arrayNoDuplicates!0 (_keys!5168 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30164 (Cons!1984 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000) Nil!1985) Nil!1985)))))

(declare-fun d!51555 () Bool)

(declare-fun res!77491 () Bool)

(assert (=> d!51555 (=> res!77491 e!107454)))

(assert (=> d!51555 (= res!77491 (bvsge #b00000000000000000000000000000000 (size!3265 (_keys!5168 thiss!1248))))))

(assert (=> d!51555 (= (arrayNoDuplicates!0 (_keys!5168 thiss!1248) #b00000000000000000000000000000000 Nil!1985) e!107454)))

(declare-fun b!163794 () Bool)

(declare-fun e!107456 () Bool)

(assert (=> b!163794 (= e!107456 call!17308)))

(declare-fun b!163795 () Bool)

(assert (=> b!163795 (= e!107457 e!107456)))

(assert (=> b!163795 (= c!30164 (validKeyInArray!0 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163796 () Bool)

(declare-fun contains!1031 (List!1988 (_ BitVec 64)) Bool)

(assert (=> b!163796 (= e!107455 (contains!1031 Nil!1985 (select (arr!2978 (_keys!5168 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163797 () Bool)

(assert (=> b!163797 (= e!107456 call!17308)))

(assert (= (and d!51555 (not res!77491)) b!163793))

(assert (= (and b!163793 res!77492) b!163796))

(assert (= (and b!163793 res!77493) b!163795))

(assert (= (and b!163795 c!30164) b!163794))

(assert (= (and b!163795 (not c!30164)) b!163797))

(assert (= (or b!163794 b!163797) bm!17305))

(assert (=> b!163793 m!194423))

(assert (=> b!163793 m!194423))

(assert (=> b!163793 m!194425))

(assert (=> bm!17305 m!194423))

(declare-fun m!194443 () Bool)

(assert (=> bm!17305 m!194443))

(assert (=> b!163795 m!194423))

(assert (=> b!163795 m!194423))

(assert (=> b!163795 m!194425))

(assert (=> b!163796 m!194423))

(assert (=> b!163796 m!194423))

(declare-fun m!194445 () Bool)

(assert (=> b!163796 m!194445))

(assert (=> b!163693 d!51555))

(declare-fun condMapEmpty!6117 () Bool)

(declare-fun mapDefault!6117 () ValueCell!1457)

(assert (=> mapNonEmpty!6116 (= condMapEmpty!6117 (= mapRest!6116 ((as const (Array (_ BitVec 32) ValueCell!1457)) mapDefault!6117)))))

(declare-fun e!107458 () Bool)

(declare-fun mapRes!6117 () Bool)

(assert (=> mapNonEmpty!6116 (= tp!14000 (and e!107458 mapRes!6117))))

(declare-fun mapIsEmpty!6117 () Bool)

(assert (=> mapIsEmpty!6117 mapRes!6117))

(declare-fun mapNonEmpty!6117 () Bool)

(declare-fun tp!14001 () Bool)

(declare-fun e!107459 () Bool)

(assert (=> mapNonEmpty!6117 (= mapRes!6117 (and tp!14001 e!107459))))

(declare-fun mapRest!6117 () (Array (_ BitVec 32) ValueCell!1457))

(declare-fun mapKey!6117 () (_ BitVec 32))

(declare-fun mapValue!6117 () ValueCell!1457)

(assert (=> mapNonEmpty!6117 (= mapRest!6116 (store mapRest!6117 mapKey!6117 mapValue!6117))))

(declare-fun b!163798 () Bool)

(assert (=> b!163798 (= e!107459 tp_is_empty!3601)))

(declare-fun b!163799 () Bool)

(assert (=> b!163799 (= e!107458 tp_is_empty!3601)))

(assert (= (and mapNonEmpty!6116 condMapEmpty!6117) mapIsEmpty!6117))

(assert (= (and mapNonEmpty!6116 (not condMapEmpty!6117)) mapNonEmpty!6117))

(assert (= (and mapNonEmpty!6117 ((_ is ValueCellFull!1457) mapValue!6117)) b!163798))

(assert (= (and mapNonEmpty!6116 ((_ is ValueCellFull!1457) mapDefault!6117)) b!163799))

(declare-fun m!194447 () Bool)

(assert (=> mapNonEmpty!6117 m!194447))

(check-sat (not b!163763) (not b!163711) (not bm!17302) (not d!51553) (not d!51543) b_and!10227 (not b!163761) (not bm!17299) (not b!163751) tp_is_empty!3601 (not d!51545) (not b!163795) (not b!163732) (not bm!17305) (not b!163793) (not b!163712) (not b!163796) (not b_next!3799) (not mapNonEmpty!6117) (not b!163778))
(check-sat b_and!10227 (not b_next!3799))
