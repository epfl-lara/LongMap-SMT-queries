; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15966 () Bool)

(assert start!15966)

(declare-fun b!158434 () Bool)

(declare-fun b_free!3487 () Bool)

(declare-fun b_next!3487 () Bool)

(assert (=> b!158434 (= b_free!3487 (not b_next!3487))))

(declare-fun tp!13017 () Bool)

(declare-fun b_and!9875 () Bool)

(assert (=> b!158434 (= tp!13017 b_and!9875)))

(declare-fun b!158432 () Bool)

(declare-fun e!103750 () Bool)

(declare-fun e!103749 () Bool)

(declare-fun mapRes!5608 () Bool)

(assert (=> b!158432 (= e!103750 (and e!103749 mapRes!5608))))

(declare-fun condMapEmpty!5608 () Bool)

(declare-datatypes ((V!4033 0))(
  ( (V!4034 (val!1689 Int)) )
))
(declare-datatypes ((ValueCell!1301 0))(
  ( (ValueCellFull!1301 (v!3548 V!4033)) (EmptyCell!1301) )
))
(declare-datatypes ((array!5629 0))(
  ( (array!5630 (arr!2662 (Array (_ BitVec 32) (_ BitVec 64))) (size!2946 (_ BitVec 32))) )
))
(declare-datatypes ((array!5631 0))(
  ( (array!5632 (arr!2663 (Array (_ BitVec 32) ValueCell!1301)) (size!2947 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1510 0))(
  ( (LongMapFixedSize!1511 (defaultEntry!3197 Int) (mask!7719 (_ BitVec 32)) (extraKeys!2938 (_ BitVec 32)) (zeroValue!3040 V!4033) (minValue!3040 V!4033) (_size!804 (_ BitVec 32)) (_keys!4987 array!5629) (_values!3180 array!5631) (_vacant!804 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1510)

(declare-fun mapDefault!5608 () ValueCell!1301)

(assert (=> b!158432 (= condMapEmpty!5608 (= (arr!2663 (_values!3180 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1301)) mapDefault!5608)))))

(declare-fun res!74792 () Bool)

(declare-fun e!103754 () Bool)

(assert (=> start!15966 (=> (not res!74792) (not e!103754))))

(declare-fun valid!714 (LongMapFixedSize!1510) Bool)

(assert (=> start!15966 (= res!74792 (valid!714 thiss!1248))))

(assert (=> start!15966 e!103754))

(declare-fun e!103751 () Bool)

(assert (=> start!15966 e!103751))

(assert (=> start!15966 true))

(declare-fun b!158433 () Bool)

(declare-fun e!103753 () Bool)

(declare-fun tp_is_empty!3289 () Bool)

(assert (=> b!158433 (= e!103753 tp_is_empty!3289)))

(declare-fun array_inv!1709 (array!5629) Bool)

(declare-fun array_inv!1710 (array!5631) Bool)

(assert (=> b!158434 (= e!103751 (and tp!13017 tp_is_empty!3289 (array_inv!1709 (_keys!4987 thiss!1248)) (array_inv!1710 (_values!3180 thiss!1248)) e!103750))))

(declare-fun mapIsEmpty!5608 () Bool)

(assert (=> mapIsEmpty!5608 mapRes!5608))

(declare-fun mapNonEmpty!5608 () Bool)

(declare-fun tp!13018 () Bool)

(assert (=> mapNonEmpty!5608 (= mapRes!5608 (and tp!13018 e!103753))))

(declare-fun mapRest!5608 () (Array (_ BitVec 32) ValueCell!1301))

(declare-fun mapKey!5608 () (_ BitVec 32))

(declare-fun mapValue!5608 () ValueCell!1301)

(assert (=> mapNonEmpty!5608 (= (arr!2663 (_values!3180 thiss!1248)) (store mapRest!5608 mapKey!5608 mapValue!5608))))

(declare-fun b!158435 () Bool)

(declare-fun res!74790 () Bool)

(assert (=> b!158435 (=> (not res!74790) (not e!103754))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158435 (= res!74790 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158436 () Bool)

(assert (=> b!158436 (= e!103749 tp_is_empty!3289)))

(declare-fun b!158437 () Bool)

(declare-fun res!74791 () Bool)

(assert (=> b!158437 (=> (not res!74791) (not e!103754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158437 (= res!74791 (validMask!0 (mask!7719 thiss!1248)))))

(declare-fun b!158438 () Bool)

(assert (=> b!158438 (= e!103754 (and (= (size!2947 (_values!3180 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7719 thiss!1248))) (= (size!2946 (_keys!4987 thiss!1248)) (size!2947 (_values!3180 thiss!1248))) (bvsge (mask!7719 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2938 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!2938 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158439 () Bool)

(declare-fun res!74789 () Bool)

(assert (=> b!158439 (=> (not res!74789) (not e!103754))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!304 0))(
  ( (MissingZero!304 (index!3384 (_ BitVec 32))) (Found!304 (index!3385 (_ BitVec 32))) (Intermediate!304 (undefined!1116 Bool) (index!3386 (_ BitVec 32)) (x!17510 (_ BitVec 32))) (Undefined!304) (MissingVacant!304 (index!3387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5629 (_ BitVec 32)) SeekEntryResult!304)

(assert (=> b!158439 (= res!74789 ((_ is Undefined!304) (seekEntryOrOpen!0 key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248))))))

(assert (= (and start!15966 res!74792) b!158435))

(assert (= (and b!158435 res!74790) b!158439))

(assert (= (and b!158439 res!74789) b!158437))

(assert (= (and b!158437 res!74791) b!158438))

(assert (= (and b!158432 condMapEmpty!5608) mapIsEmpty!5608))

(assert (= (and b!158432 (not condMapEmpty!5608)) mapNonEmpty!5608))

(assert (= (and mapNonEmpty!5608 ((_ is ValueCellFull!1301) mapValue!5608)) b!158433))

(assert (= (and b!158432 ((_ is ValueCellFull!1301) mapDefault!5608)) b!158436))

(assert (= b!158434 b!158432))

(assert (= start!15966 b!158434))

(declare-fun m!190615 () Bool)

(assert (=> b!158434 m!190615))

(declare-fun m!190617 () Bool)

(assert (=> b!158434 m!190617))

(declare-fun m!190619 () Bool)

(assert (=> start!15966 m!190619))

(declare-fun m!190621 () Bool)

(assert (=> mapNonEmpty!5608 m!190621))

(declare-fun m!190623 () Bool)

(assert (=> b!158439 m!190623))

(declare-fun m!190625 () Bool)

(assert (=> b!158437 m!190625))

(check-sat (not b!158439) (not mapNonEmpty!5608) (not start!15966) (not b!158434) (not b_next!3487) b_and!9875 tp_is_empty!3289 (not b!158437))
(check-sat b_and!9875 (not b_next!3487))
(get-model)

(declare-fun d!51051 () Bool)

(declare-fun res!74823 () Bool)

(declare-fun e!103793 () Bool)

(assert (=> d!51051 (=> (not res!74823) (not e!103793))))

(declare-fun simpleValid!114 (LongMapFixedSize!1510) Bool)

(assert (=> d!51051 (= res!74823 (simpleValid!114 thiss!1248))))

(assert (=> d!51051 (= (valid!714 thiss!1248) e!103793)))

(declare-fun b!158494 () Bool)

(declare-fun res!74824 () Bool)

(assert (=> b!158494 (=> (not res!74824) (not e!103793))))

(declare-fun arrayCountValidKeys!0 (array!5629 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158494 (= res!74824 (= (arrayCountValidKeys!0 (_keys!4987 thiss!1248) #b00000000000000000000000000000000 (size!2946 (_keys!4987 thiss!1248))) (_size!804 thiss!1248)))))

(declare-fun b!158495 () Bool)

(declare-fun res!74825 () Bool)

(assert (=> b!158495 (=> (not res!74825) (not e!103793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5629 (_ BitVec 32)) Bool)

(assert (=> b!158495 (= res!74825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)))))

(declare-fun b!158496 () Bool)

(declare-datatypes ((List!1888 0))(
  ( (Nil!1885) (Cons!1884 (h!2496 (_ BitVec 64)) (t!6681 List!1888)) )
))
(declare-fun arrayNoDuplicates!0 (array!5629 (_ BitVec 32) List!1888) Bool)

(assert (=> b!158496 (= e!103793 (arrayNoDuplicates!0 (_keys!4987 thiss!1248) #b00000000000000000000000000000000 Nil!1885))))

(assert (= (and d!51051 res!74823) b!158494))

(assert (= (and b!158494 res!74824) b!158495))

(assert (= (and b!158495 res!74825) b!158496))

(declare-fun m!190651 () Bool)

(assert (=> d!51051 m!190651))

(declare-fun m!190653 () Bool)

(assert (=> b!158494 m!190653))

(declare-fun m!190655 () Bool)

(assert (=> b!158495 m!190655))

(declare-fun m!190657 () Bool)

(assert (=> b!158496 m!190657))

(assert (=> start!15966 d!51051))

(declare-fun b!158509 () Bool)

(declare-fun e!103801 () SeekEntryResult!304)

(declare-fun lt!81710 () SeekEntryResult!304)

(assert (=> b!158509 (= e!103801 (Found!304 (index!3386 lt!81710)))))

(declare-fun b!158510 () Bool)

(declare-fun e!103800 () SeekEntryResult!304)

(assert (=> b!158510 (= e!103800 e!103801)))

(declare-fun lt!81709 () (_ BitVec 64))

(assert (=> b!158510 (= lt!81709 (select (arr!2662 (_keys!4987 thiss!1248)) (index!3386 lt!81710)))))

(declare-fun c!29833 () Bool)

(assert (=> b!158510 (= c!29833 (= lt!81709 key!828))))

(declare-fun d!51053 () Bool)

(declare-fun lt!81711 () SeekEntryResult!304)

(assert (=> d!51053 (and (or ((_ is Undefined!304) lt!81711) (not ((_ is Found!304) lt!81711)) (and (bvsge (index!3385 lt!81711) #b00000000000000000000000000000000) (bvslt (index!3385 lt!81711) (size!2946 (_keys!4987 thiss!1248))))) (or ((_ is Undefined!304) lt!81711) ((_ is Found!304) lt!81711) (not ((_ is MissingZero!304) lt!81711)) (and (bvsge (index!3384 lt!81711) #b00000000000000000000000000000000) (bvslt (index!3384 lt!81711) (size!2946 (_keys!4987 thiss!1248))))) (or ((_ is Undefined!304) lt!81711) ((_ is Found!304) lt!81711) ((_ is MissingZero!304) lt!81711) (not ((_ is MissingVacant!304) lt!81711)) (and (bvsge (index!3387 lt!81711) #b00000000000000000000000000000000) (bvslt (index!3387 lt!81711) (size!2946 (_keys!4987 thiss!1248))))) (or ((_ is Undefined!304) lt!81711) (ite ((_ is Found!304) lt!81711) (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3385 lt!81711)) key!828) (ite ((_ is MissingZero!304) lt!81711) (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3384 lt!81711)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!304) lt!81711) (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3387 lt!81711)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51053 (= lt!81711 e!103800)))

(declare-fun c!29832 () Bool)

(assert (=> d!51053 (= c!29832 (and ((_ is Intermediate!304) lt!81710) (undefined!1116 lt!81710)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5629 (_ BitVec 32)) SeekEntryResult!304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51053 (= lt!81710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7719 thiss!1248)) key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)))))

(assert (=> d!51053 (validMask!0 (mask!7719 thiss!1248))))

(assert (=> d!51053 (= (seekEntryOrOpen!0 key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)) lt!81711)))

(declare-fun b!158511 () Bool)

(declare-fun e!103802 () SeekEntryResult!304)

(assert (=> b!158511 (= e!103802 (MissingZero!304 (index!3386 lt!81710)))))

(declare-fun b!158512 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5629 (_ BitVec 32)) SeekEntryResult!304)

(assert (=> b!158512 (= e!103802 (seekKeyOrZeroReturnVacant!0 (x!17510 lt!81710) (index!3386 lt!81710) (index!3386 lt!81710) key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)))))

(declare-fun b!158513 () Bool)

(declare-fun c!29834 () Bool)

(assert (=> b!158513 (= c!29834 (= lt!81709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158513 (= e!103801 e!103802)))

(declare-fun b!158514 () Bool)

(assert (=> b!158514 (= e!103800 Undefined!304)))

(assert (= (and d!51053 c!29832) b!158514))

(assert (= (and d!51053 (not c!29832)) b!158510))

(assert (= (and b!158510 c!29833) b!158509))

(assert (= (and b!158510 (not c!29833)) b!158513))

(assert (= (and b!158513 c!29834) b!158511))

(assert (= (and b!158513 (not c!29834)) b!158512))

(declare-fun m!190659 () Bool)

(assert (=> b!158510 m!190659))

(declare-fun m!190661 () Bool)

(assert (=> d!51053 m!190661))

(declare-fun m!190663 () Bool)

(assert (=> d!51053 m!190663))

(assert (=> d!51053 m!190661))

(declare-fun m!190665 () Bool)

(assert (=> d!51053 m!190665))

(assert (=> d!51053 m!190625))

(declare-fun m!190667 () Bool)

(assert (=> d!51053 m!190667))

(declare-fun m!190669 () Bool)

(assert (=> d!51053 m!190669))

(declare-fun m!190671 () Bool)

(assert (=> b!158512 m!190671))

(assert (=> b!158439 d!51053))

(declare-fun d!51055 () Bool)

(assert (=> d!51055 (= (validMask!0 (mask!7719 thiss!1248)) (and (or (= (mask!7719 thiss!1248) #b00000000000000000000000000000111) (= (mask!7719 thiss!1248) #b00000000000000000000000000001111) (= (mask!7719 thiss!1248) #b00000000000000000000000000011111) (= (mask!7719 thiss!1248) #b00000000000000000000000000111111) (= (mask!7719 thiss!1248) #b00000000000000000000000001111111) (= (mask!7719 thiss!1248) #b00000000000000000000000011111111) (= (mask!7719 thiss!1248) #b00000000000000000000000111111111) (= (mask!7719 thiss!1248) #b00000000000000000000001111111111) (= (mask!7719 thiss!1248) #b00000000000000000000011111111111) (= (mask!7719 thiss!1248) #b00000000000000000000111111111111) (= (mask!7719 thiss!1248) #b00000000000000000001111111111111) (= (mask!7719 thiss!1248) #b00000000000000000011111111111111) (= (mask!7719 thiss!1248) #b00000000000000000111111111111111) (= (mask!7719 thiss!1248) #b00000000000000001111111111111111) (= (mask!7719 thiss!1248) #b00000000000000011111111111111111) (= (mask!7719 thiss!1248) #b00000000000000111111111111111111) (= (mask!7719 thiss!1248) #b00000000000001111111111111111111) (= (mask!7719 thiss!1248) #b00000000000011111111111111111111) (= (mask!7719 thiss!1248) #b00000000000111111111111111111111) (= (mask!7719 thiss!1248) #b00000000001111111111111111111111) (= (mask!7719 thiss!1248) #b00000000011111111111111111111111) (= (mask!7719 thiss!1248) #b00000000111111111111111111111111) (= (mask!7719 thiss!1248) #b00000001111111111111111111111111) (= (mask!7719 thiss!1248) #b00000011111111111111111111111111) (= (mask!7719 thiss!1248) #b00000111111111111111111111111111) (= (mask!7719 thiss!1248) #b00001111111111111111111111111111) (= (mask!7719 thiss!1248) #b00011111111111111111111111111111) (= (mask!7719 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7719 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158437 d!51055))

(declare-fun d!51057 () Bool)

(assert (=> d!51057 (= (array_inv!1709 (_keys!4987 thiss!1248)) (bvsge (size!2946 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158434 d!51057))

(declare-fun d!51059 () Bool)

(assert (=> d!51059 (= (array_inv!1710 (_values!3180 thiss!1248)) (bvsge (size!2947 (_values!3180 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158434 d!51059))

(declare-fun mapIsEmpty!5617 () Bool)

(declare-fun mapRes!5617 () Bool)

(assert (=> mapIsEmpty!5617 mapRes!5617))

(declare-fun mapNonEmpty!5617 () Bool)

(declare-fun tp!13033 () Bool)

(declare-fun e!103808 () Bool)

(assert (=> mapNonEmpty!5617 (= mapRes!5617 (and tp!13033 e!103808))))

(declare-fun mapRest!5617 () (Array (_ BitVec 32) ValueCell!1301))

(declare-fun mapValue!5617 () ValueCell!1301)

(declare-fun mapKey!5617 () (_ BitVec 32))

(assert (=> mapNonEmpty!5617 (= mapRest!5608 (store mapRest!5617 mapKey!5617 mapValue!5617))))

(declare-fun b!158521 () Bool)

(assert (=> b!158521 (= e!103808 tp_is_empty!3289)))

(declare-fun condMapEmpty!5617 () Bool)

(declare-fun mapDefault!5617 () ValueCell!1301)

(assert (=> mapNonEmpty!5608 (= condMapEmpty!5617 (= mapRest!5608 ((as const (Array (_ BitVec 32) ValueCell!1301)) mapDefault!5617)))))

(declare-fun e!103807 () Bool)

(assert (=> mapNonEmpty!5608 (= tp!13018 (and e!103807 mapRes!5617))))

(declare-fun b!158522 () Bool)

(assert (=> b!158522 (= e!103807 tp_is_empty!3289)))

(assert (= (and mapNonEmpty!5608 condMapEmpty!5617) mapIsEmpty!5617))

(assert (= (and mapNonEmpty!5608 (not condMapEmpty!5617)) mapNonEmpty!5617))

(assert (= (and mapNonEmpty!5617 ((_ is ValueCellFull!1301) mapValue!5617)) b!158521))

(assert (= (and mapNonEmpty!5608 ((_ is ValueCellFull!1301) mapDefault!5617)) b!158522))

(declare-fun m!190673 () Bool)

(assert (=> mapNonEmpty!5617 m!190673))

(check-sat (not b!158495) (not b!158494) (not d!51051) tp_is_empty!3289 (not b!158496) (not d!51053) (not b_next!3487) (not mapNonEmpty!5617) b_and!9875 (not b!158512))
(check-sat b_and!9875 (not b_next!3487))
(get-model)

(declare-fun b!158535 () Bool)

(declare-fun e!103817 () SeekEntryResult!304)

(assert (=> b!158535 (= e!103817 (MissingVacant!304 (index!3386 lt!81710)))))

(declare-fun b!158536 () Bool)

(declare-fun c!29841 () Bool)

(declare-fun lt!81717 () (_ BitVec 64))

(assert (=> b!158536 (= c!29841 (= lt!81717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103816 () SeekEntryResult!304)

(assert (=> b!158536 (= e!103816 e!103817)))

(declare-fun b!158537 () Bool)

(declare-fun e!103815 () SeekEntryResult!304)

(assert (=> b!158537 (= e!103815 Undefined!304)))

(declare-fun b!158538 () Bool)

(assert (=> b!158538 (= e!103815 e!103816)))

(declare-fun c!29843 () Bool)

(assert (=> b!158538 (= c!29843 (= lt!81717 key!828))))

(declare-fun b!158539 () Bool)

(assert (=> b!158539 (= e!103816 (Found!304 (index!3386 lt!81710)))))

(declare-fun lt!81716 () SeekEntryResult!304)

(declare-fun d!51061 () Bool)

(assert (=> d!51061 (and (or ((_ is Undefined!304) lt!81716) (not ((_ is Found!304) lt!81716)) (and (bvsge (index!3385 lt!81716) #b00000000000000000000000000000000) (bvslt (index!3385 lt!81716) (size!2946 (_keys!4987 thiss!1248))))) (or ((_ is Undefined!304) lt!81716) ((_ is Found!304) lt!81716) (not ((_ is MissingVacant!304) lt!81716)) (not (= (index!3387 lt!81716) (index!3386 lt!81710))) (and (bvsge (index!3387 lt!81716) #b00000000000000000000000000000000) (bvslt (index!3387 lt!81716) (size!2946 (_keys!4987 thiss!1248))))) (or ((_ is Undefined!304) lt!81716) (ite ((_ is Found!304) lt!81716) (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3385 lt!81716)) key!828) (and ((_ is MissingVacant!304) lt!81716) (= (index!3387 lt!81716) (index!3386 lt!81710)) (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3387 lt!81716)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51061 (= lt!81716 e!103815)))

(declare-fun c!29842 () Bool)

(assert (=> d!51061 (= c!29842 (bvsge (x!17510 lt!81710) #b01111111111111111111111111111110))))

(assert (=> d!51061 (= lt!81717 (select (arr!2662 (_keys!4987 thiss!1248)) (index!3386 lt!81710)))))

(assert (=> d!51061 (validMask!0 (mask!7719 thiss!1248))))

(assert (=> d!51061 (= (seekKeyOrZeroReturnVacant!0 (x!17510 lt!81710) (index!3386 lt!81710) (index!3386 lt!81710) key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)) lt!81716)))

(declare-fun b!158540 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158540 (= e!103817 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17510 lt!81710) #b00000000000000000000000000000001) (nextIndex!0 (index!3386 lt!81710) (x!17510 lt!81710) (mask!7719 thiss!1248)) (index!3386 lt!81710) key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)))))

(assert (= (and d!51061 c!29842) b!158537))

(assert (= (and d!51061 (not c!29842)) b!158538))

(assert (= (and b!158538 c!29843) b!158539))

(assert (= (and b!158538 (not c!29843)) b!158536))

(assert (= (and b!158536 c!29841) b!158535))

(assert (= (and b!158536 (not c!29841)) b!158540))

(declare-fun m!190675 () Bool)

(assert (=> d!51061 m!190675))

(declare-fun m!190677 () Bool)

(assert (=> d!51061 m!190677))

(assert (=> d!51061 m!190659))

(assert (=> d!51061 m!190625))

(declare-fun m!190679 () Bool)

(assert (=> b!158540 m!190679))

(assert (=> b!158540 m!190679))

(declare-fun m!190681 () Bool)

(assert (=> b!158540 m!190681))

(assert (=> b!158512 d!51061))

(declare-fun b!158551 () Bool)

(declare-fun res!74837 () Bool)

(declare-fun e!103820 () Bool)

(assert (=> b!158551 (=> (not res!74837) (not e!103820))))

(declare-fun size!2952 (LongMapFixedSize!1510) (_ BitVec 32))

(assert (=> b!158551 (= res!74837 (= (size!2952 thiss!1248) (bvadd (_size!804 thiss!1248) (bvsdiv (bvadd (extraKeys!2938 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158552 () Bool)

(assert (=> b!158552 (= e!103820 (and (bvsge (extraKeys!2938 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2938 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!804 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158550 () Bool)

(declare-fun res!74835 () Bool)

(assert (=> b!158550 (=> (not res!74835) (not e!103820))))

(assert (=> b!158550 (= res!74835 (bvsge (size!2952 thiss!1248) (_size!804 thiss!1248)))))

(declare-fun b!158549 () Bool)

(declare-fun res!74836 () Bool)

(assert (=> b!158549 (=> (not res!74836) (not e!103820))))

(assert (=> b!158549 (= res!74836 (and (= (size!2947 (_values!3180 thiss!1248)) (bvadd (mask!7719 thiss!1248) #b00000000000000000000000000000001)) (= (size!2946 (_keys!4987 thiss!1248)) (size!2947 (_values!3180 thiss!1248))) (bvsge (_size!804 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!804 thiss!1248) (bvadd (mask!7719 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51063 () Bool)

(declare-fun res!74834 () Bool)

(assert (=> d!51063 (=> (not res!74834) (not e!103820))))

(assert (=> d!51063 (= res!74834 (validMask!0 (mask!7719 thiss!1248)))))

(assert (=> d!51063 (= (simpleValid!114 thiss!1248) e!103820)))

(assert (= (and d!51063 res!74834) b!158549))

(assert (= (and b!158549 res!74836) b!158550))

(assert (= (and b!158550 res!74835) b!158551))

(assert (= (and b!158551 res!74837) b!158552))

(declare-fun m!190683 () Bool)

(assert (=> b!158551 m!190683))

(assert (=> b!158550 m!190683))

(assert (=> d!51063 m!190625))

(assert (=> d!51051 d!51063))

(declare-fun b!158571 () Bool)

(declare-fun e!103835 () SeekEntryResult!304)

(assert (=> b!158571 (= e!103835 (Intermediate!304 false (toIndex!0 key!828 (mask!7719 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158572 () Bool)

(declare-fun e!103834 () SeekEntryResult!304)

(assert (=> b!158572 (= e!103834 (Intermediate!304 true (toIndex!0 key!828 (mask!7719 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!51065 () Bool)

(declare-fun e!103831 () Bool)

(assert (=> d!51065 e!103831))

(declare-fun c!29852 () Bool)

(declare-fun lt!81723 () SeekEntryResult!304)

(assert (=> d!51065 (= c!29852 (and ((_ is Intermediate!304) lt!81723) (undefined!1116 lt!81723)))))

(assert (=> d!51065 (= lt!81723 e!103834)))

(declare-fun c!29851 () Bool)

(assert (=> d!51065 (= c!29851 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!81722 () (_ BitVec 64))

(assert (=> d!51065 (= lt!81722 (select (arr!2662 (_keys!4987 thiss!1248)) (toIndex!0 key!828 (mask!7719 thiss!1248))))))

(assert (=> d!51065 (validMask!0 (mask!7719 thiss!1248))))

(assert (=> d!51065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7719 thiss!1248)) key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)) lt!81723)))

(declare-fun b!158573 () Bool)

(assert (=> b!158573 (= e!103834 e!103835)))

(declare-fun c!29850 () Bool)

(assert (=> b!158573 (= c!29850 (or (= lt!81722 key!828) (= (bvadd lt!81722 lt!81722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158574 () Bool)

(assert (=> b!158574 (= e!103831 (bvsge (x!17510 lt!81723) #b01111111111111111111111111111110))))

(declare-fun b!158575 () Bool)

(declare-fun e!103832 () Bool)

(assert (=> b!158575 (= e!103831 e!103832)))

(declare-fun res!74846 () Bool)

(assert (=> b!158575 (= res!74846 (and ((_ is Intermediate!304) lt!81723) (not (undefined!1116 lt!81723)) (bvslt (x!17510 lt!81723) #b01111111111111111111111111111110) (bvsge (x!17510 lt!81723) #b00000000000000000000000000000000) (bvsge (x!17510 lt!81723) #b00000000000000000000000000000000)))))

(assert (=> b!158575 (=> (not res!74846) (not e!103832))))

(declare-fun b!158576 () Bool)

(assert (=> b!158576 (and (bvsge (index!3386 lt!81723) #b00000000000000000000000000000000) (bvslt (index!3386 lt!81723) (size!2946 (_keys!4987 thiss!1248))))))

(declare-fun e!103833 () Bool)

(assert (=> b!158576 (= e!103833 (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3386 lt!81723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158577 () Bool)

(assert (=> b!158577 (= e!103835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7719 thiss!1248)) #b00000000000000000000000000000000 (mask!7719 thiss!1248)) key!828 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)))))

(declare-fun b!158578 () Bool)

(assert (=> b!158578 (and (bvsge (index!3386 lt!81723) #b00000000000000000000000000000000) (bvslt (index!3386 lt!81723) (size!2946 (_keys!4987 thiss!1248))))))

(declare-fun res!74844 () Bool)

(assert (=> b!158578 (= res!74844 (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3386 lt!81723)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158578 (=> res!74844 e!103833)))

(declare-fun b!158579 () Bool)

(assert (=> b!158579 (and (bvsge (index!3386 lt!81723) #b00000000000000000000000000000000) (bvslt (index!3386 lt!81723) (size!2946 (_keys!4987 thiss!1248))))))

(declare-fun res!74845 () Bool)

(assert (=> b!158579 (= res!74845 (= (select (arr!2662 (_keys!4987 thiss!1248)) (index!3386 lt!81723)) key!828))))

(assert (=> b!158579 (=> res!74845 e!103833)))

(assert (=> b!158579 (= e!103832 e!103833)))

(assert (= (and d!51065 c!29851) b!158572))

(assert (= (and d!51065 (not c!29851)) b!158573))

(assert (= (and b!158573 c!29850) b!158571))

(assert (= (and b!158573 (not c!29850)) b!158577))

(assert (= (and d!51065 c!29852) b!158574))

(assert (= (and d!51065 (not c!29852)) b!158575))

(assert (= (and b!158575 res!74846) b!158579))

(assert (= (and b!158579 (not res!74845)) b!158578))

(assert (= (and b!158578 (not res!74844)) b!158576))

(declare-fun m!190685 () Bool)

(assert (=> b!158579 m!190685))

(assert (=> b!158576 m!190685))

(assert (=> d!51065 m!190661))

(declare-fun m!190687 () Bool)

(assert (=> d!51065 m!190687))

(assert (=> d!51065 m!190625))

(assert (=> b!158578 m!190685))

(assert (=> b!158577 m!190661))

(declare-fun m!190689 () Bool)

(assert (=> b!158577 m!190689))

(assert (=> b!158577 m!190689))

(declare-fun m!190691 () Bool)

(assert (=> b!158577 m!190691))

(assert (=> d!51053 d!51065))

(declare-fun d!51067 () Bool)

(declare-fun lt!81729 () (_ BitVec 32))

(declare-fun lt!81728 () (_ BitVec 32))

(assert (=> d!51067 (= lt!81729 (bvmul (bvxor lt!81728 (bvlshr lt!81728 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51067 (= lt!81728 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51067 (and (bvsge (mask!7719 thiss!1248) #b00000000000000000000000000000000) (let ((res!74847 (let ((h!2497 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17528 (bvmul (bvxor h!2497 (bvlshr h!2497 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17528 (bvlshr x!17528 #b00000000000000000000000000001101)) (mask!7719 thiss!1248)))))) (and (bvslt res!74847 (bvadd (mask!7719 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74847 #b00000000000000000000000000000000))))))

(assert (=> d!51067 (= (toIndex!0 key!828 (mask!7719 thiss!1248)) (bvand (bvxor lt!81729 (bvlshr lt!81729 #b00000000000000000000000000001101)) (mask!7719 thiss!1248)))))

(assert (=> d!51053 d!51067))

(assert (=> d!51053 d!51055))

(declare-fun b!158590 () Bool)

(declare-fun e!103845 () Bool)

(declare-fun contains!967 (List!1888 (_ BitVec 64)) Bool)

(assert (=> b!158590 (= e!103845 (contains!967 Nil!1885 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158591 () Bool)

(declare-fun e!103846 () Bool)

(declare-fun e!103847 () Bool)

(assert (=> b!158591 (= e!103846 e!103847)))

(declare-fun res!74855 () Bool)

(assert (=> b!158591 (=> (not res!74855) (not e!103847))))

(assert (=> b!158591 (= res!74855 (not e!103845))))

(declare-fun res!74854 () Bool)

(assert (=> b!158591 (=> (not res!74854) (not e!103845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158591 (= res!74854 (validKeyInArray!0 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158592 () Bool)

(declare-fun e!103844 () Bool)

(declare-fun call!17239 () Bool)

(assert (=> b!158592 (= e!103844 call!17239)))

(declare-fun b!158593 () Bool)

(assert (=> b!158593 (= e!103844 call!17239)))

(declare-fun b!158594 () Bool)

(assert (=> b!158594 (= e!103847 e!103844)))

(declare-fun c!29855 () Bool)

(assert (=> b!158594 (= c!29855 (validKeyInArray!0 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17236 () Bool)

(assert (=> bm!17236 (= call!17239 (arrayNoDuplicates!0 (_keys!4987 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29855 (Cons!1884 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000) Nil!1885) Nil!1885)))))

(declare-fun d!51069 () Bool)

(declare-fun res!74856 () Bool)

(assert (=> d!51069 (=> res!74856 e!103846)))

(assert (=> d!51069 (= res!74856 (bvsge #b00000000000000000000000000000000 (size!2946 (_keys!4987 thiss!1248))))))

(assert (=> d!51069 (= (arrayNoDuplicates!0 (_keys!4987 thiss!1248) #b00000000000000000000000000000000 Nil!1885) e!103846)))

(assert (= (and d!51069 (not res!74856)) b!158591))

(assert (= (and b!158591 res!74854) b!158590))

(assert (= (and b!158591 res!74855) b!158594))

(assert (= (and b!158594 c!29855) b!158593))

(assert (= (and b!158594 (not c!29855)) b!158592))

(assert (= (or b!158593 b!158592) bm!17236))

(declare-fun m!190693 () Bool)

(assert (=> b!158590 m!190693))

(assert (=> b!158590 m!190693))

(declare-fun m!190695 () Bool)

(assert (=> b!158590 m!190695))

(assert (=> b!158591 m!190693))

(assert (=> b!158591 m!190693))

(declare-fun m!190697 () Bool)

(assert (=> b!158591 m!190697))

(assert (=> b!158594 m!190693))

(assert (=> b!158594 m!190693))

(assert (=> b!158594 m!190697))

(assert (=> bm!17236 m!190693))

(declare-fun m!190699 () Bool)

(assert (=> bm!17236 m!190699))

(assert (=> b!158496 d!51069))

(declare-fun b!158603 () Bool)

(declare-fun e!103853 () (_ BitVec 32))

(declare-fun call!17242 () (_ BitVec 32))

(assert (=> b!158603 (= e!103853 call!17242)))

(declare-fun bm!17239 () Bool)

(assert (=> bm!17239 (= call!17242 (arrayCountValidKeys!0 (_keys!4987 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2946 (_keys!4987 thiss!1248))))))

(declare-fun d!51071 () Bool)

(declare-fun lt!81732 () (_ BitVec 32))

(assert (=> d!51071 (and (bvsge lt!81732 #b00000000000000000000000000000000) (bvsle lt!81732 (bvsub (size!2946 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103852 () (_ BitVec 32))

(assert (=> d!51071 (= lt!81732 e!103852)))

(declare-fun c!29861 () Bool)

(assert (=> d!51071 (= c!29861 (bvsge #b00000000000000000000000000000000 (size!2946 (_keys!4987 thiss!1248))))))

(assert (=> d!51071 (and (bvsle #b00000000000000000000000000000000 (size!2946 (_keys!4987 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2946 (_keys!4987 thiss!1248)) (size!2946 (_keys!4987 thiss!1248))))))

(assert (=> d!51071 (= (arrayCountValidKeys!0 (_keys!4987 thiss!1248) #b00000000000000000000000000000000 (size!2946 (_keys!4987 thiss!1248))) lt!81732)))

(declare-fun b!158604 () Bool)

(assert (=> b!158604 (= e!103853 (bvadd #b00000000000000000000000000000001 call!17242))))

(declare-fun b!158605 () Bool)

(assert (=> b!158605 (= e!103852 #b00000000000000000000000000000000)))

(declare-fun b!158606 () Bool)

(assert (=> b!158606 (= e!103852 e!103853)))

(declare-fun c!29860 () Bool)

(assert (=> b!158606 (= c!29860 (validKeyInArray!0 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51071 c!29861) b!158605))

(assert (= (and d!51071 (not c!29861)) b!158606))

(assert (= (and b!158606 c!29860) b!158604))

(assert (= (and b!158606 (not c!29860)) b!158603))

(assert (= (or b!158604 b!158603) bm!17239))

(declare-fun m!190701 () Bool)

(assert (=> bm!17239 m!190701))

(assert (=> b!158606 m!190693))

(assert (=> b!158606 m!190693))

(assert (=> b!158606 m!190697))

(assert (=> b!158494 d!51071))

(declare-fun b!158615 () Bool)

(declare-fun e!103862 () Bool)

(declare-fun e!103861 () Bool)

(assert (=> b!158615 (= e!103862 e!103861)))

(declare-fun c!29864 () Bool)

(assert (=> b!158615 (= c!29864 (validKeyInArray!0 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158616 () Bool)

(declare-fun e!103860 () Bool)

(declare-fun call!17245 () Bool)

(assert (=> b!158616 (= e!103860 call!17245)))

(declare-fun b!158617 () Bool)

(assert (=> b!158617 (= e!103861 e!103860)))

(declare-fun lt!81740 () (_ BitVec 64))

(assert (=> b!158617 (= lt!81740 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4964 0))(
  ( (Unit!4965) )
))
(declare-fun lt!81741 () Unit!4964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5629 (_ BitVec 64) (_ BitVec 32)) Unit!4964)

(assert (=> b!158617 (= lt!81741 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4987 thiss!1248) lt!81740 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158617 (arrayContainsKey!0 (_keys!4987 thiss!1248) lt!81740 #b00000000000000000000000000000000)))

(declare-fun lt!81739 () Unit!4964)

(assert (=> b!158617 (= lt!81739 lt!81741)))

(declare-fun res!74861 () Bool)

(assert (=> b!158617 (= res!74861 (= (seekEntryOrOpen!0 (select (arr!2662 (_keys!4987 thiss!1248)) #b00000000000000000000000000000000) (_keys!4987 thiss!1248) (mask!7719 thiss!1248)) (Found!304 #b00000000000000000000000000000000)))))

(assert (=> b!158617 (=> (not res!74861) (not e!103860))))

(declare-fun bm!17242 () Bool)

(assert (=> bm!17242 (= call!17245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4987 thiss!1248) (mask!7719 thiss!1248)))))

(declare-fun b!158618 () Bool)

(assert (=> b!158618 (= e!103861 call!17245)))

(declare-fun d!51073 () Bool)

(declare-fun res!74862 () Bool)

(assert (=> d!51073 (=> res!74862 e!103862)))

(assert (=> d!51073 (= res!74862 (bvsge #b00000000000000000000000000000000 (size!2946 (_keys!4987 thiss!1248))))))

(assert (=> d!51073 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4987 thiss!1248) (mask!7719 thiss!1248)) e!103862)))

(assert (= (and d!51073 (not res!74862)) b!158615))

(assert (= (and b!158615 c!29864) b!158617))

(assert (= (and b!158615 (not c!29864)) b!158618))

(assert (= (and b!158617 res!74861) b!158616))

(assert (= (or b!158616 b!158618) bm!17242))

(assert (=> b!158615 m!190693))

(assert (=> b!158615 m!190693))

(assert (=> b!158615 m!190697))

(assert (=> b!158617 m!190693))

(declare-fun m!190703 () Bool)

(assert (=> b!158617 m!190703))

(declare-fun m!190705 () Bool)

(assert (=> b!158617 m!190705))

(assert (=> b!158617 m!190693))

(declare-fun m!190707 () Bool)

(assert (=> b!158617 m!190707))

(declare-fun m!190709 () Bool)

(assert (=> bm!17242 m!190709))

(assert (=> b!158495 d!51073))

(declare-fun mapIsEmpty!5618 () Bool)

(declare-fun mapRes!5618 () Bool)

(assert (=> mapIsEmpty!5618 mapRes!5618))

(declare-fun mapNonEmpty!5618 () Bool)

(declare-fun tp!13034 () Bool)

(declare-fun e!103864 () Bool)

(assert (=> mapNonEmpty!5618 (= mapRes!5618 (and tp!13034 e!103864))))

(declare-fun mapRest!5618 () (Array (_ BitVec 32) ValueCell!1301))

(declare-fun mapKey!5618 () (_ BitVec 32))

(declare-fun mapValue!5618 () ValueCell!1301)

(assert (=> mapNonEmpty!5618 (= mapRest!5617 (store mapRest!5618 mapKey!5618 mapValue!5618))))

(declare-fun b!158619 () Bool)

(assert (=> b!158619 (= e!103864 tp_is_empty!3289)))

(declare-fun condMapEmpty!5618 () Bool)

(declare-fun mapDefault!5618 () ValueCell!1301)

(assert (=> mapNonEmpty!5617 (= condMapEmpty!5618 (= mapRest!5617 ((as const (Array (_ BitVec 32) ValueCell!1301)) mapDefault!5618)))))

(declare-fun e!103863 () Bool)

(assert (=> mapNonEmpty!5617 (= tp!13033 (and e!103863 mapRes!5618))))

(declare-fun b!158620 () Bool)

(assert (=> b!158620 (= e!103863 tp_is_empty!3289)))

(assert (= (and mapNonEmpty!5617 condMapEmpty!5618) mapIsEmpty!5618))

(assert (= (and mapNonEmpty!5617 (not condMapEmpty!5618)) mapNonEmpty!5618))

(assert (= (and mapNonEmpty!5618 ((_ is ValueCellFull!1301) mapValue!5618)) b!158619))

(assert (= (and mapNonEmpty!5617 ((_ is ValueCellFull!1301) mapDefault!5618)) b!158620))

(declare-fun m!190711 () Bool)

(assert (=> mapNonEmpty!5618 m!190711))

(check-sat (not b!158577) (not bm!17239) (not d!51065) (not b!158540) (not b!158615) (not b!158551) (not mapNonEmpty!5618) (not bm!17236) (not b!158550) b_and!9875 (not b!158606) (not b!158591) (not b!158594) (not b!158617) (not b_next!3487) (not d!51061) (not b!158590) (not d!51063) (not bm!17242) tp_is_empty!3289)
(check-sat b_and!9875 (not b_next!3487))
