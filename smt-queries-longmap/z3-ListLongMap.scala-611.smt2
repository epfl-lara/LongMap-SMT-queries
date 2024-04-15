; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15920 () Bool)

(assert start!15920)

(declare-fun b!158121 () Bool)

(declare-fun b_free!3475 () Bool)

(declare-fun b_next!3475 () Bool)

(assert (=> b!158121 (= b_free!3475 (not b_next!3475))))

(declare-fun tp!12974 () Bool)

(declare-fun b_and!9863 () Bool)

(assert (=> b!158121 (= tp!12974 b_and!9863)))

(declare-fun mapNonEmpty!5583 () Bool)

(declare-fun mapRes!5583 () Bool)

(declare-fun tp!12975 () Bool)

(declare-fun e!103552 () Bool)

(assert (=> mapNonEmpty!5583 (= mapRes!5583 (and tp!12975 e!103552))))

(declare-datatypes ((V!4017 0))(
  ( (V!4018 (val!1683 Int)) )
))
(declare-datatypes ((ValueCell!1295 0))(
  ( (ValueCellFull!1295 (v!3542 V!4017)) (EmptyCell!1295) )
))
(declare-fun mapRest!5583 () (Array (_ BitVec 32) ValueCell!1295))

(declare-datatypes ((array!5601 0))(
  ( (array!5602 (arr!2650 (Array (_ BitVec 32) (_ BitVec 64))) (size!2933 (_ BitVec 32))) )
))
(declare-datatypes ((array!5603 0))(
  ( (array!5604 (arr!2651 (Array (_ BitVec 32) ValueCell!1295)) (size!2934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1498 0))(
  ( (LongMapFixedSize!1499 (defaultEntry!3191 Int) (mask!7701 (_ BitVec 32)) (extraKeys!2932 (_ BitVec 32)) (zeroValue!3034 V!4017) (minValue!3034 V!4017) (_size!798 (_ BitVec 32)) (_keys!4976 array!5601) (_values!3174 array!5603) (_vacant!798 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1498)

(declare-fun mapValue!5583 () ValueCell!1295)

(declare-fun mapKey!5583 () (_ BitVec 32))

(assert (=> mapNonEmpty!5583 (= (arr!2651 (_values!3174 thiss!1248)) (store mapRest!5583 mapKey!5583 mapValue!5583))))

(declare-fun b!158120 () Bool)

(declare-fun e!103549 () Bool)

(declare-fun e!103550 () Bool)

(assert (=> b!158120 (= e!103549 (and e!103550 mapRes!5583))))

(declare-fun condMapEmpty!5583 () Bool)

(declare-fun mapDefault!5583 () ValueCell!1295)

(assert (=> b!158120 (= condMapEmpty!5583 (= (arr!2651 (_values!3174 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1295)) mapDefault!5583)))))

(declare-fun e!103551 () Bool)

(declare-fun tp_is_empty!3277 () Bool)

(declare-fun array_inv!1703 (array!5601) Bool)

(declare-fun array_inv!1704 (array!5603) Bool)

(assert (=> b!158121 (= e!103551 (and tp!12974 tp_is_empty!3277 (array_inv!1703 (_keys!4976 thiss!1248)) (array_inv!1704 (_values!3174 thiss!1248)) e!103549))))

(declare-fun b!158122 () Bool)

(assert (=> b!158122 (= e!103552 tp_is_empty!3277)))

(declare-fun b!158123 () Bool)

(declare-fun res!74664 () Bool)

(declare-fun e!103553 () Bool)

(assert (=> b!158123 (=> (not res!74664) (not e!103553))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!300 0))(
  ( (MissingZero!300 (index!3368 (_ BitVec 32))) (Found!300 (index!3369 (_ BitVec 32))) (Intermediate!300 (undefined!1112 Bool) (index!3370 (_ BitVec 32)) (x!17465 (_ BitVec 32))) (Undefined!300) (MissingVacant!300 (index!3371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5601 (_ BitVec 32)) SeekEntryResult!300)

(assert (=> b!158123 (= res!74664 ((_ is Undefined!300) (seekEntryOrOpen!0 key!828 (_keys!4976 thiss!1248) (mask!7701 thiss!1248))))))

(declare-fun mapIsEmpty!5583 () Bool)

(assert (=> mapIsEmpty!5583 mapRes!5583))

(declare-fun b!158124 () Bool)

(declare-fun res!74663 () Bool)

(assert (=> b!158124 (=> (not res!74663) (not e!103553))))

(assert (=> b!158124 (= res!74663 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158125 () Bool)

(declare-fun res!74662 () Bool)

(assert (=> b!158125 (=> (not res!74662) (not e!103553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158125 (= res!74662 (validMask!0 (mask!7701 thiss!1248)))))

(declare-fun b!158127 () Bool)

(assert (=> b!158127 (= e!103550 tp_is_empty!3277)))

(declare-fun b!158126 () Bool)

(assert (=> b!158126 (= e!103553 (and (= (size!2934 (_values!3174 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7701 thiss!1248))) (= (size!2933 (_keys!4976 thiss!1248)) (size!2934 (_values!3174 thiss!1248))) (bvslt (mask!7701 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!74665 () Bool)

(assert (=> start!15920 (=> (not res!74665) (not e!103553))))

(declare-fun valid!710 (LongMapFixedSize!1498) Bool)

(assert (=> start!15920 (= res!74665 (valid!710 thiss!1248))))

(assert (=> start!15920 e!103553))

(assert (=> start!15920 e!103551))

(assert (=> start!15920 true))

(assert (= (and start!15920 res!74665) b!158124))

(assert (= (and b!158124 res!74663) b!158123))

(assert (= (and b!158123 res!74664) b!158125))

(assert (= (and b!158125 res!74662) b!158126))

(assert (= (and b!158120 condMapEmpty!5583) mapIsEmpty!5583))

(assert (= (and b!158120 (not condMapEmpty!5583)) mapNonEmpty!5583))

(assert (= (and mapNonEmpty!5583 ((_ is ValueCellFull!1295) mapValue!5583)) b!158122))

(assert (= (and b!158120 ((_ is ValueCellFull!1295) mapDefault!5583)) b!158127))

(assert (= b!158121 b!158120))

(assert (= start!15920 b!158121))

(declare-fun m!190457 () Bool)

(assert (=> mapNonEmpty!5583 m!190457))

(declare-fun m!190459 () Bool)

(assert (=> start!15920 m!190459))

(declare-fun m!190461 () Bool)

(assert (=> b!158121 m!190461))

(declare-fun m!190463 () Bool)

(assert (=> b!158121 m!190463))

(declare-fun m!190465 () Bool)

(assert (=> b!158125 m!190465))

(declare-fun m!190467 () Bool)

(assert (=> b!158123 m!190467))

(check-sat (not b!158123) (not mapNonEmpty!5583) (not b_next!3475) tp_is_empty!3277 (not b!158121) (not start!15920) (not b!158125) b_and!9863)
(check-sat b_and!9863 (not b_next!3475))
(get-model)

(declare-fun b!158188 () Bool)

(declare-fun c!29785 () Bool)

(declare-fun lt!81661 () (_ BitVec 64))

(assert (=> b!158188 (= c!29785 (= lt!81661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103597 () SeekEntryResult!300)

(declare-fun e!103598 () SeekEntryResult!300)

(assert (=> b!158188 (= e!103597 e!103598)))

(declare-fun d!51013 () Bool)

(declare-fun lt!81662 () SeekEntryResult!300)

(assert (=> d!51013 (and (or ((_ is Undefined!300) lt!81662) (not ((_ is Found!300) lt!81662)) (and (bvsge (index!3369 lt!81662) #b00000000000000000000000000000000) (bvslt (index!3369 lt!81662) (size!2933 (_keys!4976 thiss!1248))))) (or ((_ is Undefined!300) lt!81662) ((_ is Found!300) lt!81662) (not ((_ is MissingZero!300) lt!81662)) (and (bvsge (index!3368 lt!81662) #b00000000000000000000000000000000) (bvslt (index!3368 lt!81662) (size!2933 (_keys!4976 thiss!1248))))) (or ((_ is Undefined!300) lt!81662) ((_ is Found!300) lt!81662) ((_ is MissingZero!300) lt!81662) (not ((_ is MissingVacant!300) lt!81662)) (and (bvsge (index!3371 lt!81662) #b00000000000000000000000000000000) (bvslt (index!3371 lt!81662) (size!2933 (_keys!4976 thiss!1248))))) (or ((_ is Undefined!300) lt!81662) (ite ((_ is Found!300) lt!81662) (= (select (arr!2650 (_keys!4976 thiss!1248)) (index!3369 lt!81662)) key!828) (ite ((_ is MissingZero!300) lt!81662) (= (select (arr!2650 (_keys!4976 thiss!1248)) (index!3368 lt!81662)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!300) lt!81662) (= (select (arr!2650 (_keys!4976 thiss!1248)) (index!3371 lt!81662)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103599 () SeekEntryResult!300)

(assert (=> d!51013 (= lt!81662 e!103599)))

(declare-fun c!29784 () Bool)

(declare-fun lt!81663 () SeekEntryResult!300)

(assert (=> d!51013 (= c!29784 (and ((_ is Intermediate!300) lt!81663) (undefined!1112 lt!81663)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5601 (_ BitVec 32)) SeekEntryResult!300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51013 (= lt!81663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7701 thiss!1248)) key!828 (_keys!4976 thiss!1248) (mask!7701 thiss!1248)))))

(assert (=> d!51013 (validMask!0 (mask!7701 thiss!1248))))

(assert (=> d!51013 (= (seekEntryOrOpen!0 key!828 (_keys!4976 thiss!1248) (mask!7701 thiss!1248)) lt!81662)))

(declare-fun b!158189 () Bool)

(assert (=> b!158189 (= e!103598 (MissingZero!300 (index!3370 lt!81663)))))

(declare-fun b!158190 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5601 (_ BitVec 32)) SeekEntryResult!300)

(assert (=> b!158190 (= e!103598 (seekKeyOrZeroReturnVacant!0 (x!17465 lt!81663) (index!3370 lt!81663) (index!3370 lt!81663) key!828 (_keys!4976 thiss!1248) (mask!7701 thiss!1248)))))

(declare-fun b!158191 () Bool)

(assert (=> b!158191 (= e!103599 Undefined!300)))

(declare-fun b!158192 () Bool)

(assert (=> b!158192 (= e!103597 (Found!300 (index!3370 lt!81663)))))

(declare-fun b!158193 () Bool)

(assert (=> b!158193 (= e!103599 e!103597)))

(assert (=> b!158193 (= lt!81661 (select (arr!2650 (_keys!4976 thiss!1248)) (index!3370 lt!81663)))))

(declare-fun c!29786 () Bool)

(assert (=> b!158193 (= c!29786 (= lt!81661 key!828))))

(assert (= (and d!51013 c!29784) b!158191))

(assert (= (and d!51013 (not c!29784)) b!158193))

(assert (= (and b!158193 c!29786) b!158192))

(assert (= (and b!158193 (not c!29786)) b!158188))

(assert (= (and b!158188 c!29785) b!158189))

(assert (= (and b!158188 (not c!29785)) b!158190))

(assert (=> d!51013 m!190465))

(declare-fun m!190493 () Bool)

(assert (=> d!51013 m!190493))

(declare-fun m!190495 () Bool)

(assert (=> d!51013 m!190495))

(declare-fun m!190497 () Bool)

(assert (=> d!51013 m!190497))

(assert (=> d!51013 m!190493))

(declare-fun m!190499 () Bool)

(assert (=> d!51013 m!190499))

(declare-fun m!190501 () Bool)

(assert (=> d!51013 m!190501))

(declare-fun m!190503 () Bool)

(assert (=> b!158190 m!190503))

(declare-fun m!190505 () Bool)

(assert (=> b!158193 m!190505))

(assert (=> b!158123 d!51013))

(declare-fun d!51015 () Bool)

(declare-fun res!74696 () Bool)

(declare-fun e!103602 () Bool)

(assert (=> d!51015 (=> (not res!74696) (not e!103602))))

(declare-fun simpleValid!112 (LongMapFixedSize!1498) Bool)

(assert (=> d!51015 (= res!74696 (simpleValid!112 thiss!1248))))

(assert (=> d!51015 (= (valid!710 thiss!1248) e!103602)))

(declare-fun b!158200 () Bool)

(declare-fun res!74697 () Bool)

(assert (=> b!158200 (=> (not res!74697) (not e!103602))))

(declare-fun arrayCountValidKeys!0 (array!5601 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158200 (= res!74697 (= (arrayCountValidKeys!0 (_keys!4976 thiss!1248) #b00000000000000000000000000000000 (size!2933 (_keys!4976 thiss!1248))) (_size!798 thiss!1248)))))

(declare-fun b!158201 () Bool)

(declare-fun res!74698 () Bool)

(assert (=> b!158201 (=> (not res!74698) (not e!103602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5601 (_ BitVec 32)) Bool)

(assert (=> b!158201 (= res!74698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4976 thiss!1248) (mask!7701 thiss!1248)))))

(declare-fun b!158202 () Bool)

(declare-datatypes ((List!1886 0))(
  ( (Nil!1883) (Cons!1882 (h!2493 (_ BitVec 64)) (t!6679 List!1886)) )
))
(declare-fun arrayNoDuplicates!0 (array!5601 (_ BitVec 32) List!1886) Bool)

(assert (=> b!158202 (= e!103602 (arrayNoDuplicates!0 (_keys!4976 thiss!1248) #b00000000000000000000000000000000 Nil!1883))))

(assert (= (and d!51015 res!74696) b!158200))

(assert (= (and b!158200 res!74697) b!158201))

(assert (= (and b!158201 res!74698) b!158202))

(declare-fun m!190507 () Bool)

(assert (=> d!51015 m!190507))

(declare-fun m!190509 () Bool)

(assert (=> b!158200 m!190509))

(declare-fun m!190511 () Bool)

(assert (=> b!158201 m!190511))

(declare-fun m!190513 () Bool)

(assert (=> b!158202 m!190513))

(assert (=> start!15920 d!51015))

(declare-fun d!51017 () Bool)

(assert (=> d!51017 (= (array_inv!1703 (_keys!4976 thiss!1248)) (bvsge (size!2933 (_keys!4976 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158121 d!51017))

(declare-fun d!51019 () Bool)

(assert (=> d!51019 (= (array_inv!1704 (_values!3174 thiss!1248)) (bvsge (size!2934 (_values!3174 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158121 d!51019))

(declare-fun d!51021 () Bool)

(assert (=> d!51021 (= (validMask!0 (mask!7701 thiss!1248)) (and (or (= (mask!7701 thiss!1248) #b00000000000000000000000000000111) (= (mask!7701 thiss!1248) #b00000000000000000000000000001111) (= (mask!7701 thiss!1248) #b00000000000000000000000000011111) (= (mask!7701 thiss!1248) #b00000000000000000000000000111111) (= (mask!7701 thiss!1248) #b00000000000000000000000001111111) (= (mask!7701 thiss!1248) #b00000000000000000000000011111111) (= (mask!7701 thiss!1248) #b00000000000000000000000111111111) (= (mask!7701 thiss!1248) #b00000000000000000000001111111111) (= (mask!7701 thiss!1248) #b00000000000000000000011111111111) (= (mask!7701 thiss!1248) #b00000000000000000000111111111111) (= (mask!7701 thiss!1248) #b00000000000000000001111111111111) (= (mask!7701 thiss!1248) #b00000000000000000011111111111111) (= (mask!7701 thiss!1248) #b00000000000000000111111111111111) (= (mask!7701 thiss!1248) #b00000000000000001111111111111111) (= (mask!7701 thiss!1248) #b00000000000000011111111111111111) (= (mask!7701 thiss!1248) #b00000000000000111111111111111111) (= (mask!7701 thiss!1248) #b00000000000001111111111111111111) (= (mask!7701 thiss!1248) #b00000000000011111111111111111111) (= (mask!7701 thiss!1248) #b00000000000111111111111111111111) (= (mask!7701 thiss!1248) #b00000000001111111111111111111111) (= (mask!7701 thiss!1248) #b00000000011111111111111111111111) (= (mask!7701 thiss!1248) #b00000000111111111111111111111111) (= (mask!7701 thiss!1248) #b00000001111111111111111111111111) (= (mask!7701 thiss!1248) #b00000011111111111111111111111111) (= (mask!7701 thiss!1248) #b00000111111111111111111111111111) (= (mask!7701 thiss!1248) #b00001111111111111111111111111111) (= (mask!7701 thiss!1248) #b00011111111111111111111111111111) (= (mask!7701 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7701 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158125 d!51021))

(declare-fun b!158210 () Bool)

(declare-fun e!103608 () Bool)

(assert (=> b!158210 (= e!103608 tp_is_empty!3277)))

(declare-fun mapNonEmpty!5592 () Bool)

(declare-fun mapRes!5592 () Bool)

(declare-fun tp!12990 () Bool)

(declare-fun e!103607 () Bool)

(assert (=> mapNonEmpty!5592 (= mapRes!5592 (and tp!12990 e!103607))))

(declare-fun mapValue!5592 () ValueCell!1295)

(declare-fun mapKey!5592 () (_ BitVec 32))

(declare-fun mapRest!5592 () (Array (_ BitVec 32) ValueCell!1295))

(assert (=> mapNonEmpty!5592 (= mapRest!5583 (store mapRest!5592 mapKey!5592 mapValue!5592))))

(declare-fun mapIsEmpty!5592 () Bool)

(assert (=> mapIsEmpty!5592 mapRes!5592))

(declare-fun b!158209 () Bool)

(assert (=> b!158209 (= e!103607 tp_is_empty!3277)))

(declare-fun condMapEmpty!5592 () Bool)

(declare-fun mapDefault!5592 () ValueCell!1295)

(assert (=> mapNonEmpty!5583 (= condMapEmpty!5592 (= mapRest!5583 ((as const (Array (_ BitVec 32) ValueCell!1295)) mapDefault!5592)))))

(assert (=> mapNonEmpty!5583 (= tp!12975 (and e!103608 mapRes!5592))))

(assert (= (and mapNonEmpty!5583 condMapEmpty!5592) mapIsEmpty!5592))

(assert (= (and mapNonEmpty!5583 (not condMapEmpty!5592)) mapNonEmpty!5592))

(assert (= (and mapNonEmpty!5592 ((_ is ValueCellFull!1295) mapValue!5592)) b!158209))

(assert (= (and mapNonEmpty!5583 ((_ is ValueCellFull!1295) mapDefault!5592)) b!158210))

(declare-fun m!190515 () Bool)

(assert (=> mapNonEmpty!5592 m!190515))

(check-sat (not b!158190) (not mapNonEmpty!5592) (not b!158202) (not b!158201) (not b_next!3475) (not d!51015) b_and!9863 (not b!158200) tp_is_empty!3277 (not d!51013))
(check-sat b_and!9863 (not b_next!3475))
