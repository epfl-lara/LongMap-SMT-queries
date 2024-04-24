; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15966 () Bool)

(assert start!15966)

(declare-fun b!158630 () Bool)

(declare-fun b_free!3487 () Bool)

(declare-fun b_next!3487 () Bool)

(assert (=> b!158630 (= b_free!3487 (not b_next!3487))))

(declare-fun tp!13017 () Bool)

(declare-fun b_and!9915 () Bool)

(assert (=> b!158630 (= tp!13017 b_and!9915)))

(declare-fun b!158626 () Bool)

(declare-fun res!74908 () Bool)

(declare-fun e!103875 () Bool)

(assert (=> b!158626 (=> (not res!74908) (not e!103875))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4033 0))(
  ( (V!4034 (val!1689 Int)) )
))
(declare-datatypes ((ValueCell!1301 0))(
  ( (ValueCellFull!1301 (v!3555 V!4033)) (EmptyCell!1301) )
))
(declare-datatypes ((array!5635 0))(
  ( (array!5636 (arr!2666 (Array (_ BitVec 32) (_ BitVec 64))) (size!2949 (_ BitVec 32))) )
))
(declare-datatypes ((array!5637 0))(
  ( (array!5638 (arr!2667 (Array (_ BitVec 32) ValueCell!1301)) (size!2950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1510 0))(
  ( (LongMapFixedSize!1511 (defaultEntry!3197 Int) (mask!7720 (_ BitVec 32)) (extraKeys!2938 (_ BitVec 32)) (zeroValue!3040 V!4033) (minValue!3040 V!4033) (_size!804 (_ BitVec 32)) (_keys!4988 array!5635) (_values!3180 array!5637) (_vacant!804 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1510)

(get-info :version)

(declare-datatypes ((SeekEntryResult!294 0))(
  ( (MissingZero!294 (index!3344 (_ BitVec 32))) (Found!294 (index!3345 (_ BitVec 32))) (Intermediate!294 (undefined!1106 Bool) (index!3346 (_ BitVec 32)) (x!17501 (_ BitVec 32))) (Undefined!294) (MissingVacant!294 (index!3347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5635 (_ BitVec 32)) SeekEntryResult!294)

(assert (=> b!158626 (= res!74908 ((_ is Undefined!294) (seekEntryOrOpen!0 key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248))))))

(declare-fun b!158627 () Bool)

(declare-fun e!103877 () Bool)

(declare-fun tp_is_empty!3289 () Bool)

(assert (=> b!158627 (= e!103877 tp_is_empty!3289)))

(declare-fun b!158628 () Bool)

(declare-fun e!103879 () Bool)

(assert (=> b!158628 (= e!103879 tp_is_empty!3289)))

(declare-fun b!158629 () Bool)

(assert (=> b!158629 (= e!103875 (and (= (size!2950 (_values!3180 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7720 thiss!1248))) (= (size!2949 (_keys!4988 thiss!1248)) (size!2950 (_values!3180 thiss!1248))) (bvsge (mask!7720 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2938 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!2938 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!74907 () Bool)

(assert (=> start!15966 (=> (not res!74907) (not e!103875))))

(declare-fun valid!730 (LongMapFixedSize!1510) Bool)

(assert (=> start!15966 (= res!74907 (valid!730 thiss!1248))))

(assert (=> start!15966 e!103875))

(declare-fun e!103878 () Bool)

(assert (=> start!15966 e!103878))

(assert (=> start!15966 true))

(declare-fun mapIsEmpty!5608 () Bool)

(declare-fun mapRes!5608 () Bool)

(assert (=> mapIsEmpty!5608 mapRes!5608))

(declare-fun mapNonEmpty!5608 () Bool)

(declare-fun tp!13018 () Bool)

(assert (=> mapNonEmpty!5608 (= mapRes!5608 (and tp!13018 e!103877))))

(declare-fun mapRest!5608 () (Array (_ BitVec 32) ValueCell!1301))

(declare-fun mapKey!5608 () (_ BitVec 32))

(declare-fun mapValue!5608 () ValueCell!1301)

(assert (=> mapNonEmpty!5608 (= (arr!2667 (_values!3180 thiss!1248)) (store mapRest!5608 mapKey!5608 mapValue!5608))))

(declare-fun e!103876 () Bool)

(declare-fun array_inv!1699 (array!5635) Bool)

(declare-fun array_inv!1700 (array!5637) Bool)

(assert (=> b!158630 (= e!103878 (and tp!13017 tp_is_empty!3289 (array_inv!1699 (_keys!4988 thiss!1248)) (array_inv!1700 (_values!3180 thiss!1248)) e!103876))))

(declare-fun b!158631 () Bool)

(declare-fun res!74905 () Bool)

(assert (=> b!158631 (=> (not res!74905) (not e!103875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158631 (= res!74905 (validMask!0 (mask!7720 thiss!1248)))))

(declare-fun b!158632 () Bool)

(declare-fun res!74906 () Bool)

(assert (=> b!158632 (=> (not res!74906) (not e!103875))))

(assert (=> b!158632 (= res!74906 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158633 () Bool)

(assert (=> b!158633 (= e!103876 (and e!103879 mapRes!5608))))

(declare-fun condMapEmpty!5608 () Bool)

(declare-fun mapDefault!5608 () ValueCell!1301)

(assert (=> b!158633 (= condMapEmpty!5608 (= (arr!2667 (_values!3180 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1301)) mapDefault!5608)))))

(assert (= (and start!15966 res!74907) b!158632))

(assert (= (and b!158632 res!74906) b!158626))

(assert (= (and b!158626 res!74908) b!158631))

(assert (= (and b!158631 res!74905) b!158629))

(assert (= (and b!158633 condMapEmpty!5608) mapIsEmpty!5608))

(assert (= (and b!158633 (not condMapEmpty!5608)) mapNonEmpty!5608))

(assert (= (and mapNonEmpty!5608 ((_ is ValueCellFull!1301) mapValue!5608)) b!158627))

(assert (= (and b!158633 ((_ is ValueCellFull!1301) mapDefault!5608)) b!158628))

(assert (= b!158630 b!158633))

(assert (= start!15966 b!158630))

(declare-fun m!191417 () Bool)

(assert (=> b!158631 m!191417))

(declare-fun m!191419 () Bool)

(assert (=> start!15966 m!191419))

(declare-fun m!191421 () Bool)

(assert (=> mapNonEmpty!5608 m!191421))

(declare-fun m!191423 () Bool)

(assert (=> b!158630 m!191423))

(declare-fun m!191425 () Bool)

(assert (=> b!158630 m!191425))

(declare-fun m!191427 () Bool)

(assert (=> b!158626 m!191427))

(check-sat (not mapNonEmpty!5608) (not b!158630) (not b_next!3487) b_and!9915 (not start!15966) (not b!158626) (not b!158631) tp_is_empty!3289)
(check-sat b_and!9915 (not b_next!3487))
(get-model)

(declare-fun b!158694 () Bool)

(declare-fun e!103924 () SeekEntryResult!294)

(declare-fun e!103923 () SeekEntryResult!294)

(assert (=> b!158694 (= e!103924 e!103923)))

(declare-fun lt!81950 () (_ BitVec 64))

(declare-fun lt!81951 () SeekEntryResult!294)

(assert (=> b!158694 (= lt!81950 (select (arr!2666 (_keys!4988 thiss!1248)) (index!3346 lt!81951)))))

(declare-fun c!29873 () Bool)

(assert (=> b!158694 (= c!29873 (= lt!81950 key!828))))

(declare-fun d!51273 () Bool)

(declare-fun lt!81949 () SeekEntryResult!294)

(assert (=> d!51273 (and (or ((_ is Undefined!294) lt!81949) (not ((_ is Found!294) lt!81949)) (and (bvsge (index!3345 lt!81949) #b00000000000000000000000000000000) (bvslt (index!3345 lt!81949) (size!2949 (_keys!4988 thiss!1248))))) (or ((_ is Undefined!294) lt!81949) ((_ is Found!294) lt!81949) (not ((_ is MissingZero!294) lt!81949)) (and (bvsge (index!3344 lt!81949) #b00000000000000000000000000000000) (bvslt (index!3344 lt!81949) (size!2949 (_keys!4988 thiss!1248))))) (or ((_ is Undefined!294) lt!81949) ((_ is Found!294) lt!81949) ((_ is MissingZero!294) lt!81949) (not ((_ is MissingVacant!294) lt!81949)) (and (bvsge (index!3347 lt!81949) #b00000000000000000000000000000000) (bvslt (index!3347 lt!81949) (size!2949 (_keys!4988 thiss!1248))))) (or ((_ is Undefined!294) lt!81949) (ite ((_ is Found!294) lt!81949) (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3345 lt!81949)) key!828) (ite ((_ is MissingZero!294) lt!81949) (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3344 lt!81949)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!294) lt!81949) (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3347 lt!81949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51273 (= lt!81949 e!103924)))

(declare-fun c!29872 () Bool)

(assert (=> d!51273 (= c!29872 (and ((_ is Intermediate!294) lt!81951) (undefined!1106 lt!81951)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5635 (_ BitVec 32)) SeekEntryResult!294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51273 (= lt!81951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7720 thiss!1248)) key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)))))

(assert (=> d!51273 (validMask!0 (mask!7720 thiss!1248))))

(assert (=> d!51273 (= (seekEntryOrOpen!0 key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)) lt!81949)))

(declare-fun e!103922 () SeekEntryResult!294)

(declare-fun b!158695 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5635 (_ BitVec 32)) SeekEntryResult!294)

(assert (=> b!158695 (= e!103922 (seekKeyOrZeroReturnVacant!0 (x!17501 lt!81951) (index!3346 lt!81951) (index!3346 lt!81951) key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)))))

(declare-fun b!158696 () Bool)

(assert (=> b!158696 (= e!103923 (Found!294 (index!3346 lt!81951)))))

(declare-fun b!158697 () Bool)

(assert (=> b!158697 (= e!103922 (MissingZero!294 (index!3346 lt!81951)))))

(declare-fun b!158698 () Bool)

(declare-fun c!29871 () Bool)

(assert (=> b!158698 (= c!29871 (= lt!81950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158698 (= e!103923 e!103922)))

(declare-fun b!158699 () Bool)

(assert (=> b!158699 (= e!103924 Undefined!294)))

(assert (= (and d!51273 c!29872) b!158699))

(assert (= (and d!51273 (not c!29872)) b!158694))

(assert (= (and b!158694 c!29873) b!158696))

(assert (= (and b!158694 (not c!29873)) b!158698))

(assert (= (and b!158698 c!29871) b!158697))

(assert (= (and b!158698 (not c!29871)) b!158695))

(declare-fun m!191453 () Bool)

(assert (=> b!158694 m!191453))

(declare-fun m!191455 () Bool)

(assert (=> d!51273 m!191455))

(declare-fun m!191457 () Bool)

(assert (=> d!51273 m!191457))

(declare-fun m!191459 () Bool)

(assert (=> d!51273 m!191459))

(declare-fun m!191461 () Bool)

(assert (=> d!51273 m!191461))

(assert (=> d!51273 m!191417))

(assert (=> d!51273 m!191455))

(declare-fun m!191463 () Bool)

(assert (=> d!51273 m!191463))

(declare-fun m!191465 () Bool)

(assert (=> b!158695 m!191465))

(assert (=> b!158626 d!51273))

(declare-fun d!51275 () Bool)

(assert (=> d!51275 (= (validMask!0 (mask!7720 thiss!1248)) (and (or (= (mask!7720 thiss!1248) #b00000000000000000000000000000111) (= (mask!7720 thiss!1248) #b00000000000000000000000000001111) (= (mask!7720 thiss!1248) #b00000000000000000000000000011111) (= (mask!7720 thiss!1248) #b00000000000000000000000000111111) (= (mask!7720 thiss!1248) #b00000000000000000000000001111111) (= (mask!7720 thiss!1248) #b00000000000000000000000011111111) (= (mask!7720 thiss!1248) #b00000000000000000000000111111111) (= (mask!7720 thiss!1248) #b00000000000000000000001111111111) (= (mask!7720 thiss!1248) #b00000000000000000000011111111111) (= (mask!7720 thiss!1248) #b00000000000000000000111111111111) (= (mask!7720 thiss!1248) #b00000000000000000001111111111111) (= (mask!7720 thiss!1248) #b00000000000000000011111111111111) (= (mask!7720 thiss!1248) #b00000000000000000111111111111111) (= (mask!7720 thiss!1248) #b00000000000000001111111111111111) (= (mask!7720 thiss!1248) #b00000000000000011111111111111111) (= (mask!7720 thiss!1248) #b00000000000000111111111111111111) (= (mask!7720 thiss!1248) #b00000000000001111111111111111111) (= (mask!7720 thiss!1248) #b00000000000011111111111111111111) (= (mask!7720 thiss!1248) #b00000000000111111111111111111111) (= (mask!7720 thiss!1248) #b00000000001111111111111111111111) (= (mask!7720 thiss!1248) #b00000000011111111111111111111111) (= (mask!7720 thiss!1248) #b00000000111111111111111111111111) (= (mask!7720 thiss!1248) #b00000001111111111111111111111111) (= (mask!7720 thiss!1248) #b00000011111111111111111111111111) (= (mask!7720 thiss!1248) #b00000111111111111111111111111111) (= (mask!7720 thiss!1248) #b00001111111111111111111111111111) (= (mask!7720 thiss!1248) #b00011111111111111111111111111111) (= (mask!7720 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7720 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158631 d!51275))

(declare-fun d!51277 () Bool)

(assert (=> d!51277 (= (array_inv!1699 (_keys!4988 thiss!1248)) (bvsge (size!2949 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158630 d!51277))

(declare-fun d!51279 () Bool)

(assert (=> d!51279 (= (array_inv!1700 (_values!3180 thiss!1248)) (bvsge (size!2950 (_values!3180 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158630 d!51279))

(declare-fun d!51281 () Bool)

(declare-fun res!74939 () Bool)

(declare-fun e!103927 () Bool)

(assert (=> d!51281 (=> (not res!74939) (not e!103927))))

(declare-fun simpleValid!114 (LongMapFixedSize!1510) Bool)

(assert (=> d!51281 (= res!74939 (simpleValid!114 thiss!1248))))

(assert (=> d!51281 (= (valid!730 thiss!1248) e!103927)))

(declare-fun b!158706 () Bool)

(declare-fun res!74940 () Bool)

(assert (=> b!158706 (=> (not res!74940) (not e!103927))))

(declare-fun arrayCountValidKeys!0 (array!5635 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158706 (= res!74940 (= (arrayCountValidKeys!0 (_keys!4988 thiss!1248) #b00000000000000000000000000000000 (size!2949 (_keys!4988 thiss!1248))) (_size!804 thiss!1248)))))

(declare-fun b!158707 () Bool)

(declare-fun res!74941 () Bool)

(assert (=> b!158707 (=> (not res!74941) (not e!103927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5635 (_ BitVec 32)) Bool)

(assert (=> b!158707 (= res!74941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)))))

(declare-fun b!158708 () Bool)

(declare-datatypes ((List!1875 0))(
  ( (Nil!1872) (Cons!1871 (h!2483 (_ BitVec 64)) (t!6669 List!1875)) )
))
(declare-fun arrayNoDuplicates!0 (array!5635 (_ BitVec 32) List!1875) Bool)

(assert (=> b!158708 (= e!103927 (arrayNoDuplicates!0 (_keys!4988 thiss!1248) #b00000000000000000000000000000000 Nil!1872))))

(assert (= (and d!51281 res!74939) b!158706))

(assert (= (and b!158706 res!74940) b!158707))

(assert (= (and b!158707 res!74941) b!158708))

(declare-fun m!191467 () Bool)

(assert (=> d!51281 m!191467))

(declare-fun m!191469 () Bool)

(assert (=> b!158706 m!191469))

(declare-fun m!191471 () Bool)

(assert (=> b!158707 m!191471))

(declare-fun m!191473 () Bool)

(assert (=> b!158708 m!191473))

(assert (=> start!15966 d!51281))

(declare-fun mapNonEmpty!5617 () Bool)

(declare-fun mapRes!5617 () Bool)

(declare-fun tp!13033 () Bool)

(declare-fun e!103932 () Bool)

(assert (=> mapNonEmpty!5617 (= mapRes!5617 (and tp!13033 e!103932))))

(declare-fun mapValue!5617 () ValueCell!1301)

(declare-fun mapKey!5617 () (_ BitVec 32))

(declare-fun mapRest!5617 () (Array (_ BitVec 32) ValueCell!1301))

(assert (=> mapNonEmpty!5617 (= mapRest!5608 (store mapRest!5617 mapKey!5617 mapValue!5617))))

(declare-fun mapIsEmpty!5617 () Bool)

(assert (=> mapIsEmpty!5617 mapRes!5617))

(declare-fun b!158716 () Bool)

(declare-fun e!103933 () Bool)

(assert (=> b!158716 (= e!103933 tp_is_empty!3289)))

(declare-fun b!158715 () Bool)

(assert (=> b!158715 (= e!103932 tp_is_empty!3289)))

(declare-fun condMapEmpty!5617 () Bool)

(declare-fun mapDefault!5617 () ValueCell!1301)

(assert (=> mapNonEmpty!5608 (= condMapEmpty!5617 (= mapRest!5608 ((as const (Array (_ BitVec 32) ValueCell!1301)) mapDefault!5617)))))

(assert (=> mapNonEmpty!5608 (= tp!13018 (and e!103933 mapRes!5617))))

(assert (= (and mapNonEmpty!5608 condMapEmpty!5617) mapIsEmpty!5617))

(assert (= (and mapNonEmpty!5608 (not condMapEmpty!5617)) mapNonEmpty!5617))

(assert (= (and mapNonEmpty!5617 ((_ is ValueCellFull!1301) mapValue!5617)) b!158715))

(assert (= (and mapNonEmpty!5608 ((_ is ValueCellFull!1301) mapDefault!5617)) b!158716))

(declare-fun m!191475 () Bool)

(assert (=> mapNonEmpty!5617 m!191475))

(check-sat (not b_next!3487) b_and!9915 (not b!158695) tp_is_empty!3289 (not d!51281) (not b!158707) (not d!51273) (not b!158706) (not b!158708) (not mapNonEmpty!5617))
(check-sat b_and!9915 (not b_next!3487))
(get-model)

(declare-fun b!158727 () Bool)

(declare-fun e!103942 () Bool)

(declare-fun call!17251 () Bool)

(assert (=> b!158727 (= e!103942 call!17251)))

(declare-fun b!158728 () Bool)

(declare-fun e!103944 () Bool)

(declare-fun contains!965 (List!1875 (_ BitVec 64)) Bool)

(assert (=> b!158728 (= e!103944 (contains!965 Nil!1872 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17248 () Bool)

(declare-fun c!29876 () Bool)

(assert (=> bm!17248 (= call!17251 (arrayNoDuplicates!0 (_keys!4988 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29876 (Cons!1871 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000) Nil!1872) Nil!1872)))))

(declare-fun b!158729 () Bool)

(declare-fun e!103945 () Bool)

(declare-fun e!103943 () Bool)

(assert (=> b!158729 (= e!103945 e!103943)))

(declare-fun res!74948 () Bool)

(assert (=> b!158729 (=> (not res!74948) (not e!103943))))

(assert (=> b!158729 (= res!74948 (not e!103944))))

(declare-fun res!74950 () Bool)

(assert (=> b!158729 (=> (not res!74950) (not e!103944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158729 (= res!74950 (validKeyInArray!0 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51283 () Bool)

(declare-fun res!74949 () Bool)

(assert (=> d!51283 (=> res!74949 e!103945)))

(assert (=> d!51283 (= res!74949 (bvsge #b00000000000000000000000000000000 (size!2949 (_keys!4988 thiss!1248))))))

(assert (=> d!51283 (= (arrayNoDuplicates!0 (_keys!4988 thiss!1248) #b00000000000000000000000000000000 Nil!1872) e!103945)))

(declare-fun b!158730 () Bool)

(assert (=> b!158730 (= e!103942 call!17251)))

(declare-fun b!158731 () Bool)

(assert (=> b!158731 (= e!103943 e!103942)))

(assert (=> b!158731 (= c!29876 (validKeyInArray!0 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51283 (not res!74949)) b!158729))

(assert (= (and b!158729 res!74950) b!158728))

(assert (= (and b!158729 res!74948) b!158731))

(assert (= (and b!158731 c!29876) b!158730))

(assert (= (and b!158731 (not c!29876)) b!158727))

(assert (= (or b!158730 b!158727) bm!17248))

(declare-fun m!191477 () Bool)

(assert (=> b!158728 m!191477))

(assert (=> b!158728 m!191477))

(declare-fun m!191479 () Bool)

(assert (=> b!158728 m!191479))

(assert (=> bm!17248 m!191477))

(declare-fun m!191481 () Bool)

(assert (=> bm!17248 m!191481))

(assert (=> b!158729 m!191477))

(assert (=> b!158729 m!191477))

(declare-fun m!191483 () Bool)

(assert (=> b!158729 m!191483))

(assert (=> b!158731 m!191477))

(assert (=> b!158731 m!191477))

(assert (=> b!158731 m!191483))

(assert (=> b!158708 d!51283))

(declare-fun b!158740 () Bool)

(declare-fun e!103951 () (_ BitVec 32))

(declare-fun call!17254 () (_ BitVec 32))

(assert (=> b!158740 (= e!103951 (bvadd #b00000000000000000000000000000001 call!17254))))

(declare-fun d!51285 () Bool)

(declare-fun lt!81954 () (_ BitVec 32))

(assert (=> d!51285 (and (bvsge lt!81954 #b00000000000000000000000000000000) (bvsle lt!81954 (bvsub (size!2949 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103950 () (_ BitVec 32))

(assert (=> d!51285 (= lt!81954 e!103950)))

(declare-fun c!29881 () Bool)

(assert (=> d!51285 (= c!29881 (bvsge #b00000000000000000000000000000000 (size!2949 (_keys!4988 thiss!1248))))))

(assert (=> d!51285 (and (bvsle #b00000000000000000000000000000000 (size!2949 (_keys!4988 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2949 (_keys!4988 thiss!1248)) (size!2949 (_keys!4988 thiss!1248))))))

(assert (=> d!51285 (= (arrayCountValidKeys!0 (_keys!4988 thiss!1248) #b00000000000000000000000000000000 (size!2949 (_keys!4988 thiss!1248))) lt!81954)))

(declare-fun b!158741 () Bool)

(assert (=> b!158741 (= e!103950 #b00000000000000000000000000000000)))

(declare-fun b!158742 () Bool)

(assert (=> b!158742 (= e!103950 e!103951)))

(declare-fun c!29882 () Bool)

(assert (=> b!158742 (= c!29882 (validKeyInArray!0 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158743 () Bool)

(assert (=> b!158743 (= e!103951 call!17254)))

(declare-fun bm!17251 () Bool)

(assert (=> bm!17251 (= call!17254 (arrayCountValidKeys!0 (_keys!4988 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2949 (_keys!4988 thiss!1248))))))

(assert (= (and d!51285 c!29881) b!158741))

(assert (= (and d!51285 (not c!29881)) b!158742))

(assert (= (and b!158742 c!29882) b!158740))

(assert (= (and b!158742 (not c!29882)) b!158743))

(assert (= (or b!158740 b!158743) bm!17251))

(assert (=> b!158742 m!191477))

(assert (=> b!158742 m!191477))

(assert (=> b!158742 m!191483))

(declare-fun m!191485 () Bool)

(assert (=> bm!17251 m!191485))

(assert (=> b!158706 d!51285))

(declare-fun b!158752 () Bool)

(declare-fun res!74960 () Bool)

(declare-fun e!103954 () Bool)

(assert (=> b!158752 (=> (not res!74960) (not e!103954))))

(assert (=> b!158752 (= res!74960 (and (= (size!2950 (_values!3180 thiss!1248)) (bvadd (mask!7720 thiss!1248) #b00000000000000000000000000000001)) (= (size!2949 (_keys!4988 thiss!1248)) (size!2950 (_values!3180 thiss!1248))) (bvsge (_size!804 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!804 thiss!1248) (bvadd (mask!7720 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51287 () Bool)

(declare-fun res!74959 () Bool)

(assert (=> d!51287 (=> (not res!74959) (not e!103954))))

(assert (=> d!51287 (= res!74959 (validMask!0 (mask!7720 thiss!1248)))))

(assert (=> d!51287 (= (simpleValid!114 thiss!1248) e!103954)))

(declare-fun b!158755 () Bool)

(assert (=> b!158755 (= e!103954 (and (bvsge (extraKeys!2938 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2938 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!804 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158753 () Bool)

(declare-fun res!74961 () Bool)

(assert (=> b!158753 (=> (not res!74961) (not e!103954))))

(declare-fun size!2955 (LongMapFixedSize!1510) (_ BitVec 32))

(assert (=> b!158753 (= res!74961 (bvsge (size!2955 thiss!1248) (_size!804 thiss!1248)))))

(declare-fun b!158754 () Bool)

(declare-fun res!74962 () Bool)

(assert (=> b!158754 (=> (not res!74962) (not e!103954))))

(assert (=> b!158754 (= res!74962 (= (size!2955 thiss!1248) (bvadd (_size!804 thiss!1248) (bvsdiv (bvadd (extraKeys!2938 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!51287 res!74959) b!158752))

(assert (= (and b!158752 res!74960) b!158753))

(assert (= (and b!158753 res!74961) b!158754))

(assert (= (and b!158754 res!74962) b!158755))

(assert (=> d!51287 m!191417))

(declare-fun m!191487 () Bool)

(assert (=> b!158753 m!191487))

(assert (=> b!158754 m!191487))

(assert (=> d!51281 d!51287))

(declare-fun b!158769 () Bool)

(declare-fun c!29890 () Bool)

(declare-fun lt!81960 () (_ BitVec 64))

(assert (=> b!158769 (= c!29890 (= lt!81960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103961 () SeekEntryResult!294)

(declare-fun e!103962 () SeekEntryResult!294)

(assert (=> b!158769 (= e!103961 e!103962)))

(declare-fun b!158770 () Bool)

(declare-fun e!103963 () SeekEntryResult!294)

(assert (=> b!158770 (= e!103963 e!103961)))

(declare-fun c!29891 () Bool)

(assert (=> b!158770 (= c!29891 (= lt!81960 key!828))))

(declare-fun b!158771 () Bool)

(assert (=> b!158771 (= e!103962 (MissingVacant!294 (index!3346 lt!81951)))))

(declare-fun b!158772 () Bool)

(assert (=> b!158772 (= e!103963 Undefined!294)))

(declare-fun b!158773 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158773 (= e!103962 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17501 lt!81951) #b00000000000000000000000000000001) (nextIndex!0 (index!3346 lt!81951) (bvadd (x!17501 lt!81951) #b00000000000000000000000000000001) (mask!7720 thiss!1248)) (index!3346 lt!81951) key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)))))

(declare-fun d!51289 () Bool)

(declare-fun lt!81959 () SeekEntryResult!294)

(assert (=> d!51289 (and (or ((_ is Undefined!294) lt!81959) (not ((_ is Found!294) lt!81959)) (and (bvsge (index!3345 lt!81959) #b00000000000000000000000000000000) (bvslt (index!3345 lt!81959) (size!2949 (_keys!4988 thiss!1248))))) (or ((_ is Undefined!294) lt!81959) ((_ is Found!294) lt!81959) (not ((_ is MissingVacant!294) lt!81959)) (not (= (index!3347 lt!81959) (index!3346 lt!81951))) (and (bvsge (index!3347 lt!81959) #b00000000000000000000000000000000) (bvslt (index!3347 lt!81959) (size!2949 (_keys!4988 thiss!1248))))) (or ((_ is Undefined!294) lt!81959) (ite ((_ is Found!294) lt!81959) (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3345 lt!81959)) key!828) (and ((_ is MissingVacant!294) lt!81959) (= (index!3347 lt!81959) (index!3346 lt!81951)) (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3347 lt!81959)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51289 (= lt!81959 e!103963)))

(declare-fun c!29889 () Bool)

(assert (=> d!51289 (= c!29889 (bvsge (x!17501 lt!81951) #b01111111111111111111111111111110))))

(assert (=> d!51289 (= lt!81960 (select (arr!2666 (_keys!4988 thiss!1248)) (index!3346 lt!81951)))))

(assert (=> d!51289 (validMask!0 (mask!7720 thiss!1248))))

(assert (=> d!51289 (= (seekKeyOrZeroReturnVacant!0 (x!17501 lt!81951) (index!3346 lt!81951) (index!3346 lt!81951) key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)) lt!81959)))

(declare-fun b!158768 () Bool)

(assert (=> b!158768 (= e!103961 (Found!294 (index!3346 lt!81951)))))

(assert (= (and d!51289 c!29889) b!158772))

(assert (= (and d!51289 (not c!29889)) b!158770))

(assert (= (and b!158770 c!29891) b!158768))

(assert (= (and b!158770 (not c!29891)) b!158769))

(assert (= (and b!158769 c!29890) b!158771))

(assert (= (and b!158769 (not c!29890)) b!158773))

(declare-fun m!191489 () Bool)

(assert (=> b!158773 m!191489))

(assert (=> b!158773 m!191489))

(declare-fun m!191491 () Bool)

(assert (=> b!158773 m!191491))

(declare-fun m!191493 () Bool)

(assert (=> d!51289 m!191493))

(declare-fun m!191495 () Bool)

(assert (=> d!51289 m!191495))

(assert (=> d!51289 m!191453))

(assert (=> d!51289 m!191417))

(assert (=> b!158695 d!51289))

(declare-fun b!158792 () Bool)

(declare-fun e!103976 () Bool)

(declare-fun e!103977 () Bool)

(assert (=> b!158792 (= e!103976 e!103977)))

(declare-fun res!74971 () Bool)

(declare-fun lt!81965 () SeekEntryResult!294)

(assert (=> b!158792 (= res!74971 (and ((_ is Intermediate!294) lt!81965) (not (undefined!1106 lt!81965)) (bvslt (x!17501 lt!81965) #b01111111111111111111111111111110) (bvsge (x!17501 lt!81965) #b00000000000000000000000000000000) (bvsge (x!17501 lt!81965) #b00000000000000000000000000000000)))))

(assert (=> b!158792 (=> (not res!74971) (not e!103977))))

(declare-fun b!158793 () Bool)

(declare-fun e!103978 () SeekEntryResult!294)

(assert (=> b!158793 (= e!103978 (Intermediate!294 false (toIndex!0 key!828 (mask!7720 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158794 () Bool)

(assert (=> b!158794 (= e!103976 (bvsge (x!17501 lt!81965) #b01111111111111111111111111111110))))

(declare-fun b!158795 () Bool)

(declare-fun e!103974 () SeekEntryResult!294)

(assert (=> b!158795 (= e!103974 (Intermediate!294 true (toIndex!0 key!828 (mask!7720 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158796 () Bool)

(assert (=> b!158796 (= e!103978 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7720 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7720 thiss!1248)) key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)))))

(declare-fun b!158798 () Bool)

(assert (=> b!158798 (= e!103974 e!103978)))

(declare-fun c!29898 () Bool)

(declare-fun lt!81966 () (_ BitVec 64))

(assert (=> b!158798 (= c!29898 (or (= lt!81966 key!828) (= (bvadd lt!81966 lt!81966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!51291 () Bool)

(assert (=> d!51291 e!103976))

(declare-fun c!29900 () Bool)

(assert (=> d!51291 (= c!29900 (and ((_ is Intermediate!294) lt!81965) (undefined!1106 lt!81965)))))

(assert (=> d!51291 (= lt!81965 e!103974)))

(declare-fun c!29899 () Bool)

(assert (=> d!51291 (= c!29899 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51291 (= lt!81966 (select (arr!2666 (_keys!4988 thiss!1248)) (toIndex!0 key!828 (mask!7720 thiss!1248))))))

(assert (=> d!51291 (validMask!0 (mask!7720 thiss!1248))))

(assert (=> d!51291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7720 thiss!1248)) key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)) lt!81965)))

(declare-fun b!158797 () Bool)

(assert (=> b!158797 (and (bvsge (index!3346 lt!81965) #b00000000000000000000000000000000) (bvslt (index!3346 lt!81965) (size!2949 (_keys!4988 thiss!1248))))))

(declare-fun res!74969 () Bool)

(assert (=> b!158797 (= res!74969 (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3346 lt!81965)) key!828))))

(declare-fun e!103975 () Bool)

(assert (=> b!158797 (=> res!74969 e!103975)))

(assert (=> b!158797 (= e!103977 e!103975)))

(declare-fun b!158799 () Bool)

(assert (=> b!158799 (and (bvsge (index!3346 lt!81965) #b00000000000000000000000000000000) (bvslt (index!3346 lt!81965) (size!2949 (_keys!4988 thiss!1248))))))

(declare-fun res!74970 () Bool)

(assert (=> b!158799 (= res!74970 (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3346 lt!81965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158799 (=> res!74970 e!103975)))

(declare-fun b!158800 () Bool)

(assert (=> b!158800 (and (bvsge (index!3346 lt!81965) #b00000000000000000000000000000000) (bvslt (index!3346 lt!81965) (size!2949 (_keys!4988 thiss!1248))))))

(assert (=> b!158800 (= e!103975 (= (select (arr!2666 (_keys!4988 thiss!1248)) (index!3346 lt!81965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51291 c!29899) b!158795))

(assert (= (and d!51291 (not c!29899)) b!158798))

(assert (= (and b!158798 c!29898) b!158793))

(assert (= (and b!158798 (not c!29898)) b!158796))

(assert (= (and d!51291 c!29900) b!158794))

(assert (= (and d!51291 (not c!29900)) b!158792))

(assert (= (and b!158792 res!74971) b!158797))

(assert (= (and b!158797 (not res!74969)) b!158799))

(assert (= (and b!158799 (not res!74970)) b!158800))

(declare-fun m!191497 () Bool)

(assert (=> b!158799 m!191497))

(assert (=> b!158796 m!191455))

(declare-fun m!191499 () Bool)

(assert (=> b!158796 m!191499))

(assert (=> b!158796 m!191499))

(declare-fun m!191501 () Bool)

(assert (=> b!158796 m!191501))

(assert (=> d!51291 m!191455))

(declare-fun m!191503 () Bool)

(assert (=> d!51291 m!191503))

(assert (=> d!51291 m!191417))

(assert (=> b!158800 m!191497))

(assert (=> b!158797 m!191497))

(assert (=> d!51273 d!51291))

(declare-fun d!51293 () Bool)

(declare-fun lt!81972 () (_ BitVec 32))

(declare-fun lt!81971 () (_ BitVec 32))

(assert (=> d!51293 (= lt!81972 (bvmul (bvxor lt!81971 (bvlshr lt!81971 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51293 (= lt!81971 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51293 (and (bvsge (mask!7720 thiss!1248) #b00000000000000000000000000000000) (let ((res!74972 (let ((h!2484 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17520 (bvmul (bvxor h!2484 (bvlshr h!2484 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17520 (bvlshr x!17520 #b00000000000000000000000000001101)) (mask!7720 thiss!1248)))))) (and (bvslt res!74972 (bvadd (mask!7720 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74972 #b00000000000000000000000000000000))))))

(assert (=> d!51293 (= (toIndex!0 key!828 (mask!7720 thiss!1248)) (bvand (bvxor lt!81972 (bvlshr lt!81972 #b00000000000000000000000000001101)) (mask!7720 thiss!1248)))))

(assert (=> d!51273 d!51293))

(assert (=> d!51273 d!51275))

(declare-fun b!158809 () Bool)

(declare-fun e!103986 () Bool)

(declare-fun e!103987 () Bool)

(assert (=> b!158809 (= e!103986 e!103987)))

(declare-fun lt!81979 () (_ BitVec 64))

(assert (=> b!158809 (= lt!81979 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4993 0))(
  ( (Unit!4994) )
))
(declare-fun lt!81980 () Unit!4993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5635 (_ BitVec 64) (_ BitVec 32)) Unit!4993)

(assert (=> b!158809 (= lt!81980 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4988 thiss!1248) lt!81979 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158809 (arrayContainsKey!0 (_keys!4988 thiss!1248) lt!81979 #b00000000000000000000000000000000)))

(declare-fun lt!81981 () Unit!4993)

(assert (=> b!158809 (= lt!81981 lt!81980)))

(declare-fun res!74977 () Bool)

(assert (=> b!158809 (= res!74977 (= (seekEntryOrOpen!0 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000) (_keys!4988 thiss!1248) (mask!7720 thiss!1248)) (Found!294 #b00000000000000000000000000000000)))))

(assert (=> b!158809 (=> (not res!74977) (not e!103987))))

(declare-fun b!158810 () Bool)

(declare-fun call!17257 () Bool)

(assert (=> b!158810 (= e!103986 call!17257)))

(declare-fun b!158811 () Bool)

(declare-fun e!103985 () Bool)

(assert (=> b!158811 (= e!103985 e!103986)))

(declare-fun c!29903 () Bool)

(assert (=> b!158811 (= c!29903 (validKeyInArray!0 (select (arr!2666 (_keys!4988 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51295 () Bool)

(declare-fun res!74978 () Bool)

(assert (=> d!51295 (=> res!74978 e!103985)))

(assert (=> d!51295 (= res!74978 (bvsge #b00000000000000000000000000000000 (size!2949 (_keys!4988 thiss!1248))))))

(assert (=> d!51295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4988 thiss!1248) (mask!7720 thiss!1248)) e!103985)))

(declare-fun b!158812 () Bool)

(assert (=> b!158812 (= e!103987 call!17257)))

(declare-fun bm!17254 () Bool)

(assert (=> bm!17254 (= call!17257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4988 thiss!1248) (mask!7720 thiss!1248)))))

(assert (= (and d!51295 (not res!74978)) b!158811))

(assert (= (and b!158811 c!29903) b!158809))

(assert (= (and b!158811 (not c!29903)) b!158810))

(assert (= (and b!158809 res!74977) b!158812))

(assert (= (or b!158812 b!158810) bm!17254))

(assert (=> b!158809 m!191477))

(declare-fun m!191505 () Bool)

(assert (=> b!158809 m!191505))

(declare-fun m!191507 () Bool)

(assert (=> b!158809 m!191507))

(assert (=> b!158809 m!191477))

(declare-fun m!191509 () Bool)

(assert (=> b!158809 m!191509))

(assert (=> b!158811 m!191477))

(assert (=> b!158811 m!191477))

(assert (=> b!158811 m!191483))

(declare-fun m!191511 () Bool)

(assert (=> bm!17254 m!191511))

(assert (=> b!158707 d!51295))

(declare-fun mapNonEmpty!5618 () Bool)

(declare-fun mapRes!5618 () Bool)

(declare-fun tp!13034 () Bool)

(declare-fun e!103988 () Bool)

(assert (=> mapNonEmpty!5618 (= mapRes!5618 (and tp!13034 e!103988))))

(declare-fun mapKey!5618 () (_ BitVec 32))

(declare-fun mapRest!5618 () (Array (_ BitVec 32) ValueCell!1301))

(declare-fun mapValue!5618 () ValueCell!1301)

(assert (=> mapNonEmpty!5618 (= mapRest!5617 (store mapRest!5618 mapKey!5618 mapValue!5618))))

(declare-fun mapIsEmpty!5618 () Bool)

(assert (=> mapIsEmpty!5618 mapRes!5618))

(declare-fun b!158814 () Bool)

(declare-fun e!103989 () Bool)

(assert (=> b!158814 (= e!103989 tp_is_empty!3289)))

(declare-fun b!158813 () Bool)

(assert (=> b!158813 (= e!103988 tp_is_empty!3289)))

(declare-fun condMapEmpty!5618 () Bool)

(declare-fun mapDefault!5618 () ValueCell!1301)

(assert (=> mapNonEmpty!5617 (= condMapEmpty!5618 (= mapRest!5617 ((as const (Array (_ BitVec 32) ValueCell!1301)) mapDefault!5618)))))

(assert (=> mapNonEmpty!5617 (= tp!13033 (and e!103989 mapRes!5618))))

(assert (= (and mapNonEmpty!5617 condMapEmpty!5618) mapIsEmpty!5618))

(assert (= (and mapNonEmpty!5617 (not condMapEmpty!5618)) mapNonEmpty!5618))

(assert (= (and mapNonEmpty!5618 ((_ is ValueCellFull!1301) mapValue!5618)) b!158813))

(assert (= (and mapNonEmpty!5617 ((_ is ValueCellFull!1301) mapDefault!5618)) b!158814))

(declare-fun m!191513 () Bool)

(assert (=> mapNonEmpty!5618 m!191513))

(check-sat (not b_next!3487) (not bm!17254) b_and!9915 (not b!158742) tp_is_empty!3289 (not b!158811) (not b!158753) (not b!158729) (not bm!17251) (not b!158796) (not b!158809) (not bm!17248) (not b!158754) (not d!51287) (not b!158731) (not b!158728) (not b!158773) (not d!51291) (not mapNonEmpty!5618) (not d!51289))
(check-sat b_and!9915 (not b_next!3487))
