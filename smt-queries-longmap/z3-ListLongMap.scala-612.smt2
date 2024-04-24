; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15936 () Bool)

(assert start!15936)

(declare-fun b!158421 () Bool)

(declare-fun b_free!3481 () Bool)

(declare-fun b_next!3481 () Bool)

(assert (=> b!158421 (= b_free!3481 (not b_next!3481))))

(declare-fun tp!12996 () Bool)

(declare-fun b_and!9909 () Bool)

(assert (=> b!158421 (= tp!12996 b_and!9909)))

(declare-fun mapNonEmpty!5595 () Bool)

(declare-fun mapRes!5595 () Bool)

(declare-fun tp!12995 () Bool)

(declare-fun e!103746 () Bool)

(assert (=> mapNonEmpty!5595 (= mapRes!5595 (and tp!12995 e!103746))))

(declare-datatypes ((V!4025 0))(
  ( (V!4026 (val!1686 Int)) )
))
(declare-datatypes ((ValueCell!1298 0))(
  ( (ValueCellFull!1298 (v!3552 V!4025)) (EmptyCell!1298) )
))
(declare-fun mapRest!5595 () (Array (_ BitVec 32) ValueCell!1298))

(declare-fun mapValue!5595 () ValueCell!1298)

(declare-datatypes ((array!5621 0))(
  ( (array!5622 (arr!2660 (Array (_ BitVec 32) (_ BitVec 64))) (size!2942 (_ BitVec 32))) )
))
(declare-datatypes ((array!5623 0))(
  ( (array!5624 (arr!2661 (Array (_ BitVec 32) ValueCell!1298)) (size!2943 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1504 0))(
  ( (LongMapFixedSize!1505 (defaultEntry!3194 Int) (mask!7709 (_ BitVec 32)) (extraKeys!2935 (_ BitVec 32)) (zeroValue!3037 V!4025) (minValue!3037 V!4025) (_size!801 (_ BitVec 32)) (_keys!4981 array!5621) (_values!3177 array!5623) (_vacant!801 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1504)

(declare-fun mapKey!5595 () (_ BitVec 32))

(assert (=> mapNonEmpty!5595 (= (arr!2661 (_values!3177 thiss!1248)) (store mapRest!5595 mapKey!5595 mapValue!5595))))

(declare-fun tp_is_empty!3283 () Bool)

(declare-fun e!103748 () Bool)

(declare-fun e!103747 () Bool)

(declare-fun array_inv!1697 (array!5621) Bool)

(declare-fun array_inv!1698 (array!5623) Bool)

(assert (=> b!158421 (= e!103748 (and tp!12996 tp_is_empty!3283 (array_inv!1697 (_keys!4981 thiss!1248)) (array_inv!1698 (_values!3177 thiss!1248)) e!103747))))

(declare-fun b!158422 () Bool)

(declare-fun res!74825 () Bool)

(declare-fun e!103750 () Bool)

(assert (=> b!158422 (=> (not res!74825) (not e!103750))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!291 0))(
  ( (MissingZero!291 (index!3332 (_ BitVec 32))) (Found!291 (index!3333 (_ BitVec 32))) (Intermediate!291 (undefined!1103 Bool) (index!3334 (_ BitVec 32)) (x!17473 (_ BitVec 32))) (Undefined!291) (MissingVacant!291 (index!3335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5621 (_ BitVec 32)) SeekEntryResult!291)

(assert (=> b!158422 (= res!74825 ((_ is Undefined!291) (seekEntryOrOpen!0 key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248))))))

(declare-fun b!158423 () Bool)

(declare-fun res!74824 () Bool)

(assert (=> b!158423 (=> (not res!74824) (not e!103750))))

(assert (=> b!158423 (= res!74824 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158424 () Bool)

(declare-fun e!103749 () Bool)

(assert (=> b!158424 (= e!103747 (and e!103749 mapRes!5595))))

(declare-fun condMapEmpty!5595 () Bool)

(declare-fun mapDefault!5595 () ValueCell!1298)

(assert (=> b!158424 (= condMapEmpty!5595 (= (arr!2661 (_values!3177 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1298)) mapDefault!5595)))))

(declare-fun res!74823 () Bool)

(assert (=> start!15936 (=> (not res!74823) (not e!103750))))

(declare-fun valid!727 (LongMapFixedSize!1504) Bool)

(assert (=> start!15936 (= res!74823 (valid!727 thiss!1248))))

(assert (=> start!15936 e!103750))

(assert (=> start!15936 e!103748))

(assert (=> start!15936 true))

(declare-fun b!158425 () Bool)

(assert (=> b!158425 (= e!103746 tp_is_empty!3283)))

(declare-fun b!158426 () Bool)

(assert (=> b!158426 (= e!103749 tp_is_empty!3283)))

(declare-fun b!158427 () Bool)

(assert (=> b!158427 (= e!103750 (and (= (size!2943 (_values!3177 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7709 thiss!1248))) (= (size!2942 (_keys!4981 thiss!1248)) (size!2943 (_values!3177 thiss!1248))) (bvsge (mask!7709 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!2935 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158428 () Bool)

(declare-fun res!74826 () Bool)

(assert (=> b!158428 (=> (not res!74826) (not e!103750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158428 (= res!74826 (validMask!0 (mask!7709 thiss!1248)))))

(declare-fun mapIsEmpty!5595 () Bool)

(assert (=> mapIsEmpty!5595 mapRes!5595))

(assert (= (and start!15936 res!74823) b!158423))

(assert (= (and b!158423 res!74824) b!158422))

(assert (= (and b!158422 res!74825) b!158428))

(assert (= (and b!158428 res!74826) b!158427))

(assert (= (and b!158424 condMapEmpty!5595) mapIsEmpty!5595))

(assert (= (and b!158424 (not condMapEmpty!5595)) mapNonEmpty!5595))

(assert (= (and mapNonEmpty!5595 ((_ is ValueCellFull!1298) mapValue!5595)) b!158425))

(assert (= (and b!158424 ((_ is ValueCellFull!1298) mapDefault!5595)) b!158426))

(assert (= b!158421 b!158424))

(assert (= start!15936 b!158421))

(declare-fun m!191319 () Bool)

(assert (=> start!15936 m!191319))

(declare-fun m!191321 () Bool)

(assert (=> mapNonEmpty!5595 m!191321))

(declare-fun m!191323 () Bool)

(assert (=> b!158422 m!191323))

(declare-fun m!191325 () Bool)

(assert (=> b!158421 m!191325))

(declare-fun m!191327 () Bool)

(assert (=> b!158421 m!191327))

(declare-fun m!191329 () Bool)

(assert (=> b!158428 m!191329))

(check-sat (not b!158428) (not mapNonEmpty!5595) tp_is_empty!3283 (not start!15936) b_and!9909 (not b!158421) (not b!158422) (not b_next!3481))
(check-sat b_and!9909 (not b_next!3481))
(get-model)

(declare-fun d!51247 () Bool)

(assert (=> d!51247 (= (array_inv!1697 (_keys!4981 thiss!1248)) (bvsge (size!2942 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158421 d!51247))

(declare-fun d!51249 () Bool)

(assert (=> d!51249 (= (array_inv!1698 (_values!3177 thiss!1248)) (bvsge (size!2943 (_values!3177 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158421 d!51249))

(declare-fun d!51251 () Bool)

(declare-fun res!74857 () Bool)

(declare-fun e!103790 () Bool)

(assert (=> d!51251 (=> (not res!74857) (not e!103790))))

(declare-fun simpleValid!113 (LongMapFixedSize!1504) Bool)

(assert (=> d!51251 (= res!74857 (simpleValid!113 thiss!1248))))

(assert (=> d!51251 (= (valid!727 thiss!1248) e!103790)))

(declare-fun b!158483 () Bool)

(declare-fun res!74858 () Bool)

(assert (=> b!158483 (=> (not res!74858) (not e!103790))))

(declare-fun arrayCountValidKeys!0 (array!5621 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158483 (= res!74858 (= (arrayCountValidKeys!0 (_keys!4981 thiss!1248) #b00000000000000000000000000000000 (size!2942 (_keys!4981 thiss!1248))) (_size!801 thiss!1248)))))

(declare-fun b!158484 () Bool)

(declare-fun res!74859 () Bool)

(assert (=> b!158484 (=> (not res!74859) (not e!103790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5621 (_ BitVec 32)) Bool)

(assert (=> b!158484 (= res!74859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)))))

(declare-fun b!158485 () Bool)

(declare-datatypes ((List!1874 0))(
  ( (Nil!1871) (Cons!1870 (h!2481 (_ BitVec 64)) (t!6668 List!1874)) )
))
(declare-fun arrayNoDuplicates!0 (array!5621 (_ BitVec 32) List!1874) Bool)

(assert (=> b!158485 (= e!103790 (arrayNoDuplicates!0 (_keys!4981 thiss!1248) #b00000000000000000000000000000000 Nil!1871))))

(assert (= (and d!51251 res!74857) b!158483))

(assert (= (and b!158483 res!74858) b!158484))

(assert (= (and b!158484 res!74859) b!158485))

(declare-fun m!191355 () Bool)

(assert (=> d!51251 m!191355))

(declare-fun m!191357 () Bool)

(assert (=> b!158483 m!191357))

(declare-fun m!191359 () Bool)

(assert (=> b!158484 m!191359))

(declare-fun m!191361 () Bool)

(assert (=> b!158485 m!191361))

(assert (=> start!15936 d!51251))

(declare-fun e!103799 () SeekEntryResult!291)

(declare-fun b!158498 () Bool)

(declare-fun lt!81912 () SeekEntryResult!291)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5621 (_ BitVec 32)) SeekEntryResult!291)

(assert (=> b!158498 (= e!103799 (seekKeyOrZeroReturnVacant!0 (x!17473 lt!81912) (index!3334 lt!81912) (index!3334 lt!81912) key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)))))

(declare-fun d!51253 () Bool)

(declare-fun lt!81910 () SeekEntryResult!291)

(assert (=> d!51253 (and (or ((_ is Undefined!291) lt!81910) (not ((_ is Found!291) lt!81910)) (and (bvsge (index!3333 lt!81910) #b00000000000000000000000000000000) (bvslt (index!3333 lt!81910) (size!2942 (_keys!4981 thiss!1248))))) (or ((_ is Undefined!291) lt!81910) ((_ is Found!291) lt!81910) (not ((_ is MissingZero!291) lt!81910)) (and (bvsge (index!3332 lt!81910) #b00000000000000000000000000000000) (bvslt (index!3332 lt!81910) (size!2942 (_keys!4981 thiss!1248))))) (or ((_ is Undefined!291) lt!81910) ((_ is Found!291) lt!81910) ((_ is MissingZero!291) lt!81910) (not ((_ is MissingVacant!291) lt!81910)) (and (bvsge (index!3335 lt!81910) #b00000000000000000000000000000000) (bvslt (index!3335 lt!81910) (size!2942 (_keys!4981 thiss!1248))))) (or ((_ is Undefined!291) lt!81910) (ite ((_ is Found!291) lt!81910) (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3333 lt!81910)) key!828) (ite ((_ is MissingZero!291) lt!81910) (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3332 lt!81910)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!291) lt!81910) (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3335 lt!81910)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103797 () SeekEntryResult!291)

(assert (=> d!51253 (= lt!81910 e!103797)))

(declare-fun c!29834 () Bool)

(assert (=> d!51253 (= c!29834 (and ((_ is Intermediate!291) lt!81912) (undefined!1103 lt!81912)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5621 (_ BitVec 32)) SeekEntryResult!291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51253 (= lt!81912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7709 thiss!1248)) key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)))))

(assert (=> d!51253 (validMask!0 (mask!7709 thiss!1248))))

(assert (=> d!51253 (= (seekEntryOrOpen!0 key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)) lt!81910)))

(declare-fun b!158499 () Bool)

(declare-fun e!103798 () SeekEntryResult!291)

(assert (=> b!158499 (= e!103798 (Found!291 (index!3334 lt!81912)))))

(declare-fun b!158500 () Bool)

(assert (=> b!158500 (= e!103799 (MissingZero!291 (index!3334 lt!81912)))))

(declare-fun b!158501 () Bool)

(declare-fun c!29832 () Bool)

(declare-fun lt!81911 () (_ BitVec 64))

(assert (=> b!158501 (= c!29832 (= lt!81911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158501 (= e!103798 e!103799)))

(declare-fun b!158502 () Bool)

(assert (=> b!158502 (= e!103797 Undefined!291)))

(declare-fun b!158503 () Bool)

(assert (=> b!158503 (= e!103797 e!103798)))

(assert (=> b!158503 (= lt!81911 (select (arr!2660 (_keys!4981 thiss!1248)) (index!3334 lt!81912)))))

(declare-fun c!29833 () Bool)

(assert (=> b!158503 (= c!29833 (= lt!81911 key!828))))

(assert (= (and d!51253 c!29834) b!158502))

(assert (= (and d!51253 (not c!29834)) b!158503))

(assert (= (and b!158503 c!29833) b!158499))

(assert (= (and b!158503 (not c!29833)) b!158501))

(assert (= (and b!158501 c!29832) b!158500))

(assert (= (and b!158501 (not c!29832)) b!158498))

(declare-fun m!191363 () Bool)

(assert (=> b!158498 m!191363))

(declare-fun m!191365 () Bool)

(assert (=> d!51253 m!191365))

(declare-fun m!191367 () Bool)

(assert (=> d!51253 m!191367))

(declare-fun m!191369 () Bool)

(assert (=> d!51253 m!191369))

(assert (=> d!51253 m!191365))

(declare-fun m!191371 () Bool)

(assert (=> d!51253 m!191371))

(declare-fun m!191373 () Bool)

(assert (=> d!51253 m!191373))

(assert (=> d!51253 m!191329))

(declare-fun m!191375 () Bool)

(assert (=> b!158503 m!191375))

(assert (=> b!158422 d!51253))

(declare-fun d!51255 () Bool)

(assert (=> d!51255 (= (validMask!0 (mask!7709 thiss!1248)) (and (or (= (mask!7709 thiss!1248) #b00000000000000000000000000000111) (= (mask!7709 thiss!1248) #b00000000000000000000000000001111) (= (mask!7709 thiss!1248) #b00000000000000000000000000011111) (= (mask!7709 thiss!1248) #b00000000000000000000000000111111) (= (mask!7709 thiss!1248) #b00000000000000000000000001111111) (= (mask!7709 thiss!1248) #b00000000000000000000000011111111) (= (mask!7709 thiss!1248) #b00000000000000000000000111111111) (= (mask!7709 thiss!1248) #b00000000000000000000001111111111) (= (mask!7709 thiss!1248) #b00000000000000000000011111111111) (= (mask!7709 thiss!1248) #b00000000000000000000111111111111) (= (mask!7709 thiss!1248) #b00000000000000000001111111111111) (= (mask!7709 thiss!1248) #b00000000000000000011111111111111) (= (mask!7709 thiss!1248) #b00000000000000000111111111111111) (= (mask!7709 thiss!1248) #b00000000000000001111111111111111) (= (mask!7709 thiss!1248) #b00000000000000011111111111111111) (= (mask!7709 thiss!1248) #b00000000000000111111111111111111) (= (mask!7709 thiss!1248) #b00000000000001111111111111111111) (= (mask!7709 thiss!1248) #b00000000000011111111111111111111) (= (mask!7709 thiss!1248) #b00000000000111111111111111111111) (= (mask!7709 thiss!1248) #b00000000001111111111111111111111) (= (mask!7709 thiss!1248) #b00000000011111111111111111111111) (= (mask!7709 thiss!1248) #b00000000111111111111111111111111) (= (mask!7709 thiss!1248) #b00000001111111111111111111111111) (= (mask!7709 thiss!1248) #b00000011111111111111111111111111) (= (mask!7709 thiss!1248) #b00000111111111111111111111111111) (= (mask!7709 thiss!1248) #b00001111111111111111111111111111) (= (mask!7709 thiss!1248) #b00011111111111111111111111111111) (= (mask!7709 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7709 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158428 d!51255))

(declare-fun mapIsEmpty!5604 () Bool)

(declare-fun mapRes!5604 () Bool)

(assert (=> mapIsEmpty!5604 mapRes!5604))

(declare-fun b!158510 () Bool)

(declare-fun e!103804 () Bool)

(assert (=> b!158510 (= e!103804 tp_is_empty!3283)))

(declare-fun b!158511 () Bool)

(declare-fun e!103805 () Bool)

(assert (=> b!158511 (= e!103805 tp_is_empty!3283)))

(declare-fun condMapEmpty!5604 () Bool)

(declare-fun mapDefault!5604 () ValueCell!1298)

(assert (=> mapNonEmpty!5595 (= condMapEmpty!5604 (= mapRest!5595 ((as const (Array (_ BitVec 32) ValueCell!1298)) mapDefault!5604)))))

(assert (=> mapNonEmpty!5595 (= tp!12995 (and e!103805 mapRes!5604))))

(declare-fun mapNonEmpty!5604 () Bool)

(declare-fun tp!13011 () Bool)

(assert (=> mapNonEmpty!5604 (= mapRes!5604 (and tp!13011 e!103804))))

(declare-fun mapRest!5604 () (Array (_ BitVec 32) ValueCell!1298))

(declare-fun mapKey!5604 () (_ BitVec 32))

(declare-fun mapValue!5604 () ValueCell!1298)

(assert (=> mapNonEmpty!5604 (= mapRest!5595 (store mapRest!5604 mapKey!5604 mapValue!5604))))

(assert (= (and mapNonEmpty!5595 condMapEmpty!5604) mapIsEmpty!5604))

(assert (= (and mapNonEmpty!5595 (not condMapEmpty!5604)) mapNonEmpty!5604))

(assert (= (and mapNonEmpty!5604 ((_ is ValueCellFull!1298) mapValue!5604)) b!158510))

(assert (= (and mapNonEmpty!5595 ((_ is ValueCellFull!1298) mapDefault!5604)) b!158511))

(declare-fun m!191377 () Bool)

(assert (=> mapNonEmpty!5604 m!191377))

(check-sat (not b!158483) b_and!9909 (not mapNonEmpty!5604) (not d!51253) (not b!158498) (not b!158485) tp_is_empty!3283 (not d!51251) (not b!158484) (not b_next!3481))
(check-sat b_and!9909 (not b_next!3481))
(get-model)

(declare-fun b!158520 () Bool)

(declare-fun e!103811 () (_ BitVec 32))

(declare-fun call!17242 () (_ BitVec 32))

(assert (=> b!158520 (= e!103811 call!17242)))

(declare-fun d!51257 () Bool)

(declare-fun lt!81915 () (_ BitVec 32))

(assert (=> d!51257 (and (bvsge lt!81915 #b00000000000000000000000000000000) (bvsle lt!81915 (bvsub (size!2942 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103810 () (_ BitVec 32))

(assert (=> d!51257 (= lt!81915 e!103810)))

(declare-fun c!29840 () Bool)

(assert (=> d!51257 (= c!29840 (bvsge #b00000000000000000000000000000000 (size!2942 (_keys!4981 thiss!1248))))))

(assert (=> d!51257 (and (bvsle #b00000000000000000000000000000000 (size!2942 (_keys!4981 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2942 (_keys!4981 thiss!1248)) (size!2942 (_keys!4981 thiss!1248))))))

(assert (=> d!51257 (= (arrayCountValidKeys!0 (_keys!4981 thiss!1248) #b00000000000000000000000000000000 (size!2942 (_keys!4981 thiss!1248))) lt!81915)))

(declare-fun b!158521 () Bool)

(assert (=> b!158521 (= e!103810 e!103811)))

(declare-fun c!29839 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158521 (= c!29839 (validKeyInArray!0 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158522 () Bool)

(assert (=> b!158522 (= e!103811 (bvadd #b00000000000000000000000000000001 call!17242))))

(declare-fun b!158523 () Bool)

(assert (=> b!158523 (= e!103810 #b00000000000000000000000000000000)))

(declare-fun bm!17239 () Bool)

(assert (=> bm!17239 (= call!17242 (arrayCountValidKeys!0 (_keys!4981 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2942 (_keys!4981 thiss!1248))))))

(assert (= (and d!51257 c!29840) b!158523))

(assert (= (and d!51257 (not c!29840)) b!158521))

(assert (= (and b!158521 c!29839) b!158522))

(assert (= (and b!158521 (not c!29839)) b!158520))

(assert (= (or b!158522 b!158520) bm!17239))

(declare-fun m!191379 () Bool)

(assert (=> b!158521 m!191379))

(assert (=> b!158521 m!191379))

(declare-fun m!191381 () Bool)

(assert (=> b!158521 m!191381))

(declare-fun m!191383 () Bool)

(assert (=> bm!17239 m!191383))

(assert (=> b!158483 d!51257))

(declare-fun b!158533 () Bool)

(declare-fun res!74869 () Bool)

(declare-fun e!103814 () Bool)

(assert (=> b!158533 (=> (not res!74869) (not e!103814))))

(declare-fun size!2948 (LongMapFixedSize!1504) (_ BitVec 32))

(assert (=> b!158533 (= res!74869 (bvsge (size!2948 thiss!1248) (_size!801 thiss!1248)))))

(declare-fun b!158534 () Bool)

(declare-fun res!74868 () Bool)

(assert (=> b!158534 (=> (not res!74868) (not e!103814))))

(assert (=> b!158534 (= res!74868 (= (size!2948 thiss!1248) (bvadd (_size!801 thiss!1248) (bvsdiv (bvadd (extraKeys!2935 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158535 () Bool)

(assert (=> b!158535 (= e!103814 (and (bvsge (extraKeys!2935 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2935 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!801 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51259 () Bool)

(declare-fun res!74870 () Bool)

(assert (=> d!51259 (=> (not res!74870) (not e!103814))))

(assert (=> d!51259 (= res!74870 (validMask!0 (mask!7709 thiss!1248)))))

(assert (=> d!51259 (= (simpleValid!113 thiss!1248) e!103814)))

(declare-fun b!158532 () Bool)

(declare-fun res!74871 () Bool)

(assert (=> b!158532 (=> (not res!74871) (not e!103814))))

(assert (=> b!158532 (= res!74871 (and (= (size!2943 (_values!3177 thiss!1248)) (bvadd (mask!7709 thiss!1248) #b00000000000000000000000000000001)) (= (size!2942 (_keys!4981 thiss!1248)) (size!2943 (_values!3177 thiss!1248))) (bvsge (_size!801 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!801 thiss!1248) (bvadd (mask!7709 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51259 res!74870) b!158532))

(assert (= (and b!158532 res!74871) b!158533))

(assert (= (and b!158533 res!74869) b!158534))

(assert (= (and b!158534 res!74868) b!158535))

(declare-fun m!191385 () Bool)

(assert (=> b!158533 m!191385))

(assert (=> b!158534 m!191385))

(assert (=> d!51259 m!191329))

(assert (=> d!51251 d!51259))

(declare-fun b!158548 () Bool)

(declare-fun e!103821 () SeekEntryResult!291)

(declare-fun e!103822 () SeekEntryResult!291)

(assert (=> b!158548 (= e!103821 e!103822)))

(declare-fun c!29849 () Bool)

(declare-fun lt!81920 () (_ BitVec 64))

(assert (=> b!158548 (= c!29849 (= lt!81920 key!828))))

(declare-fun b!158549 () Bool)

(assert (=> b!158549 (= e!103821 Undefined!291)))

(declare-fun d!51261 () Bool)

(declare-fun lt!81921 () SeekEntryResult!291)

(assert (=> d!51261 (and (or ((_ is Undefined!291) lt!81921) (not ((_ is Found!291) lt!81921)) (and (bvsge (index!3333 lt!81921) #b00000000000000000000000000000000) (bvslt (index!3333 lt!81921) (size!2942 (_keys!4981 thiss!1248))))) (or ((_ is Undefined!291) lt!81921) ((_ is Found!291) lt!81921) (not ((_ is MissingVacant!291) lt!81921)) (not (= (index!3335 lt!81921) (index!3334 lt!81912))) (and (bvsge (index!3335 lt!81921) #b00000000000000000000000000000000) (bvslt (index!3335 lt!81921) (size!2942 (_keys!4981 thiss!1248))))) (or ((_ is Undefined!291) lt!81921) (ite ((_ is Found!291) lt!81921) (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3333 lt!81921)) key!828) (and ((_ is MissingVacant!291) lt!81921) (= (index!3335 lt!81921) (index!3334 lt!81912)) (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3335 lt!81921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51261 (= lt!81921 e!103821)))

(declare-fun c!29847 () Bool)

(assert (=> d!51261 (= c!29847 (bvsge (x!17473 lt!81912) #b01111111111111111111111111111110))))

(assert (=> d!51261 (= lt!81920 (select (arr!2660 (_keys!4981 thiss!1248)) (index!3334 lt!81912)))))

(assert (=> d!51261 (validMask!0 (mask!7709 thiss!1248))))

(assert (=> d!51261 (= (seekKeyOrZeroReturnVacant!0 (x!17473 lt!81912) (index!3334 lt!81912) (index!3334 lt!81912) key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)) lt!81921)))

(declare-fun b!158550 () Bool)

(declare-fun c!29848 () Bool)

(assert (=> b!158550 (= c!29848 (= lt!81920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103823 () SeekEntryResult!291)

(assert (=> b!158550 (= e!103822 e!103823)))

(declare-fun b!158551 () Bool)

(assert (=> b!158551 (= e!103822 (Found!291 (index!3334 lt!81912)))))

(declare-fun b!158552 () Bool)

(assert (=> b!158552 (= e!103823 (MissingVacant!291 (index!3334 lt!81912)))))

(declare-fun b!158553 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158553 (= e!103823 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17473 lt!81912) #b00000000000000000000000000000001) (nextIndex!0 (index!3334 lt!81912) (bvadd (x!17473 lt!81912) #b00000000000000000000000000000001) (mask!7709 thiss!1248)) (index!3334 lt!81912) key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)))))

(assert (= (and d!51261 c!29847) b!158549))

(assert (= (and d!51261 (not c!29847)) b!158548))

(assert (= (and b!158548 c!29849) b!158551))

(assert (= (and b!158548 (not c!29849)) b!158550))

(assert (= (and b!158550 c!29848) b!158552))

(assert (= (and b!158550 (not c!29848)) b!158553))

(declare-fun m!191387 () Bool)

(assert (=> d!51261 m!191387))

(declare-fun m!191389 () Bool)

(assert (=> d!51261 m!191389))

(assert (=> d!51261 m!191375))

(assert (=> d!51261 m!191329))

(declare-fun m!191391 () Bool)

(assert (=> b!158553 m!191391))

(assert (=> b!158553 m!191391))

(declare-fun m!191393 () Bool)

(assert (=> b!158553 m!191393))

(assert (=> b!158498 d!51261))

(declare-fun b!158572 () Bool)

(declare-fun e!103835 () SeekEntryResult!291)

(assert (=> b!158572 (= e!103835 (Intermediate!291 false (toIndex!0 key!828 (mask!7709 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158574 () Bool)

(declare-fun e!103838 () Bool)

(declare-fun e!103834 () Bool)

(assert (=> b!158574 (= e!103838 e!103834)))

(declare-fun res!74880 () Bool)

(declare-fun lt!81927 () SeekEntryResult!291)

(assert (=> b!158574 (= res!74880 (and ((_ is Intermediate!291) lt!81927) (not (undefined!1103 lt!81927)) (bvslt (x!17473 lt!81927) #b01111111111111111111111111111110) (bvsge (x!17473 lt!81927) #b00000000000000000000000000000000) (bvsge (x!17473 lt!81927) #b00000000000000000000000000000000)))))

(assert (=> b!158574 (=> (not res!74880) (not e!103834))))

(declare-fun b!158575 () Bool)

(assert (=> b!158575 (= e!103835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7709 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7709 thiss!1248)) key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)))))

(declare-fun b!158576 () Bool)

(assert (=> b!158576 (and (bvsge (index!3334 lt!81927) #b00000000000000000000000000000000) (bvslt (index!3334 lt!81927) (size!2942 (_keys!4981 thiss!1248))))))

(declare-fun e!103837 () Bool)

(assert (=> b!158576 (= e!103837 (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3334 lt!81927)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158573 () Bool)

(assert (=> b!158573 (and (bvsge (index!3334 lt!81927) #b00000000000000000000000000000000) (bvslt (index!3334 lt!81927) (size!2942 (_keys!4981 thiss!1248))))))

(declare-fun res!74878 () Bool)

(assert (=> b!158573 (= res!74878 (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3334 lt!81927)) key!828))))

(assert (=> b!158573 (=> res!74878 e!103837)))

(assert (=> b!158573 (= e!103834 e!103837)))

(declare-fun d!51263 () Bool)

(assert (=> d!51263 e!103838))

(declare-fun c!29858 () Bool)

(assert (=> d!51263 (= c!29858 (and ((_ is Intermediate!291) lt!81927) (undefined!1103 lt!81927)))))

(declare-fun e!103836 () SeekEntryResult!291)

(assert (=> d!51263 (= lt!81927 e!103836)))

(declare-fun c!29857 () Bool)

(assert (=> d!51263 (= c!29857 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!81926 () (_ BitVec 64))

(assert (=> d!51263 (= lt!81926 (select (arr!2660 (_keys!4981 thiss!1248)) (toIndex!0 key!828 (mask!7709 thiss!1248))))))

(assert (=> d!51263 (validMask!0 (mask!7709 thiss!1248))))

(assert (=> d!51263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7709 thiss!1248)) key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)) lt!81927)))

(declare-fun b!158577 () Bool)

(assert (=> b!158577 (and (bvsge (index!3334 lt!81927) #b00000000000000000000000000000000) (bvslt (index!3334 lt!81927) (size!2942 (_keys!4981 thiss!1248))))))

(declare-fun res!74879 () Bool)

(assert (=> b!158577 (= res!74879 (= (select (arr!2660 (_keys!4981 thiss!1248)) (index!3334 lt!81927)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158577 (=> res!74879 e!103837)))

(declare-fun b!158578 () Bool)

(assert (=> b!158578 (= e!103836 (Intermediate!291 true (toIndex!0 key!828 (mask!7709 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158579 () Bool)

(assert (=> b!158579 (= e!103836 e!103835)))

(declare-fun c!29856 () Bool)

(assert (=> b!158579 (= c!29856 (or (= lt!81926 key!828) (= (bvadd lt!81926 lt!81926) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158580 () Bool)

(assert (=> b!158580 (= e!103838 (bvsge (x!17473 lt!81927) #b01111111111111111111111111111110))))

(assert (= (and d!51263 c!29857) b!158578))

(assert (= (and d!51263 (not c!29857)) b!158579))

(assert (= (and b!158579 c!29856) b!158572))

(assert (= (and b!158579 (not c!29856)) b!158575))

(assert (= (and d!51263 c!29858) b!158580))

(assert (= (and d!51263 (not c!29858)) b!158574))

(assert (= (and b!158574 res!74880) b!158573))

(assert (= (and b!158573 (not res!74878)) b!158577))

(assert (= (and b!158577 (not res!74879)) b!158576))

(assert (=> d!51263 m!191365))

(declare-fun m!191395 () Bool)

(assert (=> d!51263 m!191395))

(assert (=> d!51263 m!191329))

(declare-fun m!191397 () Bool)

(assert (=> b!158576 m!191397))

(assert (=> b!158577 m!191397))

(assert (=> b!158575 m!191365))

(declare-fun m!191399 () Bool)

(assert (=> b!158575 m!191399))

(assert (=> b!158575 m!191399))

(declare-fun m!191401 () Bool)

(assert (=> b!158575 m!191401))

(assert (=> b!158573 m!191397))

(assert (=> d!51253 d!51263))

(declare-fun d!51265 () Bool)

(declare-fun lt!81933 () (_ BitVec 32))

(declare-fun lt!81932 () (_ BitVec 32))

(assert (=> d!51265 (= lt!81933 (bvmul (bvxor lt!81932 (bvlshr lt!81932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51265 (= lt!81932 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51265 (and (bvsge (mask!7709 thiss!1248) #b00000000000000000000000000000000) (let ((res!74881 (let ((h!2482 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17492 (bvmul (bvxor h!2482 (bvlshr h!2482 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17492 (bvlshr x!17492 #b00000000000000000000000000001101)) (mask!7709 thiss!1248)))))) (and (bvslt res!74881 (bvadd (mask!7709 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74881 #b00000000000000000000000000000000))))))

(assert (=> d!51265 (= (toIndex!0 key!828 (mask!7709 thiss!1248)) (bvand (bvxor lt!81933 (bvlshr lt!81933 #b00000000000000000000000000001101)) (mask!7709 thiss!1248)))))

(assert (=> d!51253 d!51265))

(assert (=> d!51253 d!51255))

(declare-fun bm!17242 () Bool)

(declare-fun call!17245 () Bool)

(assert (=> bm!17242 (= call!17245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4981 thiss!1248) (mask!7709 thiss!1248)))))

(declare-fun b!158589 () Bool)

(declare-fun e!103845 () Bool)

(declare-fun e!103846 () Bool)

(assert (=> b!158589 (= e!103845 e!103846)))

(declare-fun c!29861 () Bool)

(assert (=> b!158589 (= c!29861 (validKeyInArray!0 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158590 () Bool)

(declare-fun e!103847 () Bool)

(assert (=> b!158590 (= e!103847 call!17245)))

(declare-fun b!158591 () Bool)

(assert (=> b!158591 (= e!103846 call!17245)))

(declare-fun b!158592 () Bool)

(assert (=> b!158592 (= e!103846 e!103847)))

(declare-fun lt!81942 () (_ BitVec 64))

(assert (=> b!158592 (= lt!81942 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4991 0))(
  ( (Unit!4992) )
))
(declare-fun lt!81940 () Unit!4991)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5621 (_ BitVec 64) (_ BitVec 32)) Unit!4991)

(assert (=> b!158592 (= lt!81940 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4981 thiss!1248) lt!81942 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158592 (arrayContainsKey!0 (_keys!4981 thiss!1248) lt!81942 #b00000000000000000000000000000000)))

(declare-fun lt!81941 () Unit!4991)

(assert (=> b!158592 (= lt!81941 lt!81940)))

(declare-fun res!74886 () Bool)

(assert (=> b!158592 (= res!74886 (= (seekEntryOrOpen!0 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000) (_keys!4981 thiss!1248) (mask!7709 thiss!1248)) (Found!291 #b00000000000000000000000000000000)))))

(assert (=> b!158592 (=> (not res!74886) (not e!103847))))

(declare-fun d!51267 () Bool)

(declare-fun res!74887 () Bool)

(assert (=> d!51267 (=> res!74887 e!103845)))

(assert (=> d!51267 (= res!74887 (bvsge #b00000000000000000000000000000000 (size!2942 (_keys!4981 thiss!1248))))))

(assert (=> d!51267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4981 thiss!1248) (mask!7709 thiss!1248)) e!103845)))

(assert (= (and d!51267 (not res!74887)) b!158589))

(assert (= (and b!158589 c!29861) b!158592))

(assert (= (and b!158589 (not c!29861)) b!158591))

(assert (= (and b!158592 res!74886) b!158590))

(assert (= (or b!158590 b!158591) bm!17242))

(declare-fun m!191403 () Bool)

(assert (=> bm!17242 m!191403))

(assert (=> b!158589 m!191379))

(assert (=> b!158589 m!191379))

(assert (=> b!158589 m!191381))

(assert (=> b!158592 m!191379))

(declare-fun m!191405 () Bool)

(assert (=> b!158592 m!191405))

(declare-fun m!191407 () Bool)

(assert (=> b!158592 m!191407))

(assert (=> b!158592 m!191379))

(declare-fun m!191409 () Bool)

(assert (=> b!158592 m!191409))

(assert (=> b!158484 d!51267))

(declare-fun b!158603 () Bool)

(declare-fun e!103856 () Bool)

(declare-fun e!103858 () Bool)

(assert (=> b!158603 (= e!103856 e!103858)))

(declare-fun c!29864 () Bool)

(assert (=> b!158603 (= c!29864 (validKeyInArray!0 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158604 () Bool)

(declare-fun e!103857 () Bool)

(assert (=> b!158604 (= e!103857 e!103856)))

(declare-fun res!74894 () Bool)

(assert (=> b!158604 (=> (not res!74894) (not e!103856))))

(declare-fun e!103859 () Bool)

(assert (=> b!158604 (= res!74894 (not e!103859))))

(declare-fun res!74896 () Bool)

(assert (=> b!158604 (=> (not res!74896) (not e!103859))))

(assert (=> b!158604 (= res!74896 (validKeyInArray!0 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158605 () Bool)

(declare-fun call!17248 () Bool)

(assert (=> b!158605 (= e!103858 call!17248)))

(declare-fun bm!17245 () Bool)

(assert (=> bm!17245 (= call!17248 (arrayNoDuplicates!0 (_keys!4981 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29864 (Cons!1870 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000) Nil!1871) Nil!1871)))))

(declare-fun b!158606 () Bool)

(declare-fun contains!964 (List!1874 (_ BitVec 64)) Bool)

(assert (=> b!158606 (= e!103859 (contains!964 Nil!1871 (select (arr!2660 (_keys!4981 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158607 () Bool)

(assert (=> b!158607 (= e!103858 call!17248)))

(declare-fun d!51269 () Bool)

(declare-fun res!74895 () Bool)

(assert (=> d!51269 (=> res!74895 e!103857)))

(assert (=> d!51269 (= res!74895 (bvsge #b00000000000000000000000000000000 (size!2942 (_keys!4981 thiss!1248))))))

(assert (=> d!51269 (= (arrayNoDuplicates!0 (_keys!4981 thiss!1248) #b00000000000000000000000000000000 Nil!1871) e!103857)))

(assert (= (and d!51269 (not res!74895)) b!158604))

(assert (= (and b!158604 res!74896) b!158606))

(assert (= (and b!158604 res!74894) b!158603))

(assert (= (and b!158603 c!29864) b!158607))

(assert (= (and b!158603 (not c!29864)) b!158605))

(assert (= (or b!158607 b!158605) bm!17245))

(assert (=> b!158603 m!191379))

(assert (=> b!158603 m!191379))

(assert (=> b!158603 m!191381))

(assert (=> b!158604 m!191379))

(assert (=> b!158604 m!191379))

(assert (=> b!158604 m!191381))

(assert (=> bm!17245 m!191379))

(declare-fun m!191411 () Bool)

(assert (=> bm!17245 m!191411))

(assert (=> b!158606 m!191379))

(assert (=> b!158606 m!191379))

(declare-fun m!191413 () Bool)

(assert (=> b!158606 m!191413))

(assert (=> b!158485 d!51269))

(declare-fun mapIsEmpty!5605 () Bool)

(declare-fun mapRes!5605 () Bool)

(assert (=> mapIsEmpty!5605 mapRes!5605))

(declare-fun b!158608 () Bool)

(declare-fun e!103860 () Bool)

(assert (=> b!158608 (= e!103860 tp_is_empty!3283)))

(declare-fun b!158609 () Bool)

(declare-fun e!103861 () Bool)

(assert (=> b!158609 (= e!103861 tp_is_empty!3283)))

(declare-fun condMapEmpty!5605 () Bool)

(declare-fun mapDefault!5605 () ValueCell!1298)

(assert (=> mapNonEmpty!5604 (= condMapEmpty!5605 (= mapRest!5604 ((as const (Array (_ BitVec 32) ValueCell!1298)) mapDefault!5605)))))

(assert (=> mapNonEmpty!5604 (= tp!13011 (and e!103861 mapRes!5605))))

(declare-fun mapNonEmpty!5605 () Bool)

(declare-fun tp!13012 () Bool)

(assert (=> mapNonEmpty!5605 (= mapRes!5605 (and tp!13012 e!103860))))

(declare-fun mapRest!5605 () (Array (_ BitVec 32) ValueCell!1298))

(declare-fun mapValue!5605 () ValueCell!1298)

(declare-fun mapKey!5605 () (_ BitVec 32))

(assert (=> mapNonEmpty!5605 (= mapRest!5604 (store mapRest!5605 mapKey!5605 mapValue!5605))))

(assert (= (and mapNonEmpty!5604 condMapEmpty!5605) mapIsEmpty!5605))

(assert (= (and mapNonEmpty!5604 (not condMapEmpty!5605)) mapNonEmpty!5605))

(assert (= (and mapNonEmpty!5605 ((_ is ValueCellFull!1298) mapValue!5605)) b!158608))

(assert (= (and mapNonEmpty!5604 ((_ is ValueCellFull!1298) mapDefault!5605)) b!158609))

(declare-fun m!191415 () Bool)

(assert (=> mapNonEmpty!5605 m!191415))

(check-sat (not b!158604) (not b!158589) (not b!158533) (not bm!17242) (not mapNonEmpty!5605) (not d!51259) b_and!9909 (not b!158553) (not b!158534) (not d!51263) (not b!158575) (not bm!17239) (not b_next!3481) (not b!158606) tp_is_empty!3283 (not b!158603) (not b!158592) (not d!51261) (not b!158521) (not bm!17245))
(check-sat b_and!9909 (not b_next!3481))
