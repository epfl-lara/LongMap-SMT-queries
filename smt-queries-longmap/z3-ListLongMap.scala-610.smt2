; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15890 () Bool)

(assert start!15890)

(declare-fun b!157918 () Bool)

(declare-fun b_free!3469 () Bool)

(declare-fun b_next!3469 () Bool)

(assert (=> b!157918 (= b_free!3469 (not b_next!3469))))

(declare-fun tp!12953 () Bool)

(declare-fun b_and!9857 () Bool)

(assert (=> b!157918 (= tp!12953 b_and!9857)))

(declare-fun b!157915 () Bool)

(declare-fun res!74583 () Bool)

(declare-fun e!103425 () Bool)

(assert (=> b!157915 (=> (not res!74583) (not e!103425))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157915 (= res!74583 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157916 () Bool)

(declare-fun e!103423 () Bool)

(declare-fun tp_is_empty!3271 () Bool)

(assert (=> b!157916 (= e!103423 tp_is_empty!3271)))

(declare-fun e!103421 () Bool)

(declare-fun e!103424 () Bool)

(declare-datatypes ((V!4009 0))(
  ( (V!4010 (val!1680 Int)) )
))
(declare-datatypes ((ValueCell!1292 0))(
  ( (ValueCellFull!1292 (v!3539 V!4009)) (EmptyCell!1292) )
))
(declare-datatypes ((array!5587 0))(
  ( (array!5588 (arr!2644 (Array (_ BitVec 32) (_ BitVec 64))) (size!2926 (_ BitVec 32))) )
))
(declare-datatypes ((array!5589 0))(
  ( (array!5590 (arr!2645 (Array (_ BitVec 32) ValueCell!1292)) (size!2927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1492 0))(
  ( (LongMapFixedSize!1493 (defaultEntry!3188 Int) (mask!7690 (_ BitVec 32)) (extraKeys!2929 (_ BitVec 32)) (zeroValue!3031 V!4009) (minValue!3031 V!4009) (_size!795 (_ BitVec 32)) (_keys!4969 array!5587) (_values!3171 array!5589) (_vacant!795 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1492)

(declare-fun array_inv!1699 (array!5587) Bool)

(declare-fun array_inv!1700 (array!5589) Bool)

(assert (=> b!157918 (= e!103421 (and tp!12953 tp_is_empty!3271 (array_inv!1699 (_keys!4969 thiss!1248)) (array_inv!1700 (_values!3171 thiss!1248)) e!103424))))

(declare-fun mapNonEmpty!5570 () Bool)

(declare-fun mapRes!5570 () Bool)

(declare-fun tp!12952 () Bool)

(assert (=> mapNonEmpty!5570 (= mapRes!5570 (and tp!12952 e!103423))))

(declare-fun mapKey!5570 () (_ BitVec 32))

(declare-fun mapRest!5570 () (Array (_ BitVec 32) ValueCell!1292))

(declare-fun mapValue!5570 () ValueCell!1292)

(assert (=> mapNonEmpty!5570 (= (arr!2645 (_values!3171 thiss!1248)) (store mapRest!5570 mapKey!5570 mapValue!5570))))

(declare-fun b!157919 () Bool)

(declare-fun res!74581 () Bool)

(assert (=> b!157919 (=> (not res!74581) (not e!103425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157919 (= res!74581 (validMask!0 (mask!7690 thiss!1248)))))

(declare-fun mapIsEmpty!5570 () Bool)

(assert (=> mapIsEmpty!5570 mapRes!5570))

(declare-fun b!157920 () Bool)

(declare-fun res!74582 () Bool)

(assert (=> b!157920 (=> (not res!74582) (not e!103425))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!297 0))(
  ( (MissingZero!297 (index!3356 (_ BitVec 32))) (Found!297 (index!3357 (_ BitVec 32))) (Intermediate!297 (undefined!1109 Bool) (index!3358 (_ BitVec 32)) (x!17437 (_ BitVec 32))) (Undefined!297) (MissingVacant!297 (index!3359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5587 (_ BitVec 32)) SeekEntryResult!297)

(assert (=> b!157920 (= res!74582 ((_ is Undefined!297) (seekEntryOrOpen!0 key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248))))))

(declare-fun b!157921 () Bool)

(declare-fun e!103426 () Bool)

(assert (=> b!157921 (= e!103426 tp_is_empty!3271)))

(declare-fun b!157922 () Bool)

(assert (=> b!157922 (= e!103424 (and e!103426 mapRes!5570))))

(declare-fun condMapEmpty!5570 () Bool)

(declare-fun mapDefault!5570 () ValueCell!1292)

(assert (=> b!157922 (= condMapEmpty!5570 (= (arr!2645 (_values!3171 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1292)) mapDefault!5570)))))

(declare-fun res!74580 () Bool)

(assert (=> start!15890 (=> (not res!74580) (not e!103425))))

(declare-fun valid!709 (LongMapFixedSize!1492) Bool)

(assert (=> start!15890 (= res!74580 (valid!709 thiss!1248))))

(assert (=> start!15890 e!103425))

(assert (=> start!15890 e!103421))

(assert (=> start!15890 true))

(declare-fun b!157917 () Bool)

(assert (=> b!157917 (= e!103425 (and (= (size!2927 (_values!3171 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7690 thiss!1248))) (not (= (size!2926 (_keys!4969 thiss!1248)) (size!2927 (_values!3171 thiss!1248))))))))

(assert (= (and start!15890 res!74580) b!157915))

(assert (= (and b!157915 res!74583) b!157920))

(assert (= (and b!157920 res!74582) b!157919))

(assert (= (and b!157919 res!74581) b!157917))

(assert (= (and b!157922 condMapEmpty!5570) mapIsEmpty!5570))

(assert (= (and b!157922 (not condMapEmpty!5570)) mapNonEmpty!5570))

(assert (= (and mapNonEmpty!5570 ((_ is ValueCellFull!1292) mapValue!5570)) b!157916))

(assert (= (and b!157922 ((_ is ValueCellFull!1292) mapDefault!5570)) b!157921))

(assert (= b!157918 b!157922))

(assert (= start!15890 b!157918))

(declare-fun m!190359 () Bool)

(assert (=> start!15890 m!190359))

(declare-fun m!190361 () Bool)

(assert (=> mapNonEmpty!5570 m!190361))

(declare-fun m!190363 () Bool)

(assert (=> b!157918 m!190363))

(declare-fun m!190365 () Bool)

(assert (=> b!157918 m!190365))

(declare-fun m!190367 () Bool)

(assert (=> b!157919 m!190367))

(declare-fun m!190369 () Bool)

(assert (=> b!157920 m!190369))

(check-sat b_and!9857 (not b!157918) (not b_next!3469) tp_is_empty!3271 (not mapNonEmpty!5570) (not b!157920) (not start!15890) (not b!157919))
(check-sat b_and!9857 (not b_next!3469))
(get-model)

(declare-fun d!50987 () Bool)

(assert (=> d!50987 (= (validMask!0 (mask!7690 thiss!1248)) (and (or (= (mask!7690 thiss!1248) #b00000000000000000000000000000111) (= (mask!7690 thiss!1248) #b00000000000000000000000000001111) (= (mask!7690 thiss!1248) #b00000000000000000000000000011111) (= (mask!7690 thiss!1248) #b00000000000000000000000000111111) (= (mask!7690 thiss!1248) #b00000000000000000000000001111111) (= (mask!7690 thiss!1248) #b00000000000000000000000011111111) (= (mask!7690 thiss!1248) #b00000000000000000000000111111111) (= (mask!7690 thiss!1248) #b00000000000000000000001111111111) (= (mask!7690 thiss!1248) #b00000000000000000000011111111111) (= (mask!7690 thiss!1248) #b00000000000000000000111111111111) (= (mask!7690 thiss!1248) #b00000000000000000001111111111111) (= (mask!7690 thiss!1248) #b00000000000000000011111111111111) (= (mask!7690 thiss!1248) #b00000000000000000111111111111111) (= (mask!7690 thiss!1248) #b00000000000000001111111111111111) (= (mask!7690 thiss!1248) #b00000000000000011111111111111111) (= (mask!7690 thiss!1248) #b00000000000000111111111111111111) (= (mask!7690 thiss!1248) #b00000000000001111111111111111111) (= (mask!7690 thiss!1248) #b00000000000011111111111111111111) (= (mask!7690 thiss!1248) #b00000000000111111111111111111111) (= (mask!7690 thiss!1248) #b00000000001111111111111111111111) (= (mask!7690 thiss!1248) #b00000000011111111111111111111111) (= (mask!7690 thiss!1248) #b00000000111111111111111111111111) (= (mask!7690 thiss!1248) #b00000001111111111111111111111111) (= (mask!7690 thiss!1248) #b00000011111111111111111111111111) (= (mask!7690 thiss!1248) #b00000111111111111111111111111111) (= (mask!7690 thiss!1248) #b00001111111111111111111111111111) (= (mask!7690 thiss!1248) #b00011111111111111111111111111111) (= (mask!7690 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7690 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157919 d!50987))

(declare-fun d!50989 () Bool)

(declare-fun res!74614 () Bool)

(declare-fun e!103465 () Bool)

(assert (=> d!50989 (=> (not res!74614) (not e!103465))))

(declare-fun simpleValid!111 (LongMapFixedSize!1492) Bool)

(assert (=> d!50989 (= res!74614 (simpleValid!111 thiss!1248))))

(assert (=> d!50989 (= (valid!709 thiss!1248) e!103465)))

(declare-fun b!157977 () Bool)

(declare-fun res!74615 () Bool)

(assert (=> b!157977 (=> (not res!74615) (not e!103465))))

(declare-fun arrayCountValidKeys!0 (array!5587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157977 (= res!74615 (= (arrayCountValidKeys!0 (_keys!4969 thiss!1248) #b00000000000000000000000000000000 (size!2926 (_keys!4969 thiss!1248))) (_size!795 thiss!1248)))))

(declare-fun b!157978 () Bool)

(declare-fun res!74616 () Bool)

(assert (=> b!157978 (=> (not res!74616) (not e!103465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5587 (_ BitVec 32)) Bool)

(assert (=> b!157978 (= res!74616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)))))

(declare-fun b!157979 () Bool)

(declare-datatypes ((List!1885 0))(
  ( (Nil!1882) (Cons!1881 (h!2491 (_ BitVec 64)) (t!6678 List!1885)) )
))
(declare-fun arrayNoDuplicates!0 (array!5587 (_ BitVec 32) List!1885) Bool)

(assert (=> b!157979 (= e!103465 (arrayNoDuplicates!0 (_keys!4969 thiss!1248) #b00000000000000000000000000000000 Nil!1882))))

(assert (= (and d!50989 res!74614) b!157977))

(assert (= (and b!157977 res!74615) b!157978))

(assert (= (and b!157978 res!74616) b!157979))

(declare-fun m!190395 () Bool)

(assert (=> d!50989 m!190395))

(declare-fun m!190397 () Bool)

(assert (=> b!157977 m!190397))

(declare-fun m!190399 () Bool)

(assert (=> b!157978 m!190399))

(declare-fun m!190401 () Bool)

(assert (=> b!157979 m!190401))

(assert (=> start!15890 d!50989))

(declare-fun d!50991 () Bool)

(assert (=> d!50991 (= (array_inv!1699 (_keys!4969 thiss!1248)) (bvsge (size!2926 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157918 d!50991))

(declare-fun d!50993 () Bool)

(assert (=> d!50993 (= (array_inv!1700 (_values!3171 thiss!1248)) (bvsge (size!2927 (_values!3171 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157918 d!50993))

(declare-fun b!157992 () Bool)

(declare-fun e!103474 () SeekEntryResult!297)

(declare-fun lt!81622 () SeekEntryResult!297)

(assert (=> b!157992 (= e!103474 (MissingZero!297 (index!3358 lt!81622)))))

(declare-fun b!157993 () Bool)

(declare-fun e!103473 () SeekEntryResult!297)

(declare-fun e!103472 () SeekEntryResult!297)

(assert (=> b!157993 (= e!103473 e!103472)))

(declare-fun lt!81623 () (_ BitVec 64))

(assert (=> b!157993 (= lt!81623 (select (arr!2644 (_keys!4969 thiss!1248)) (index!3358 lt!81622)))))

(declare-fun c!29747 () Bool)

(assert (=> b!157993 (= c!29747 (= lt!81623 key!828))))

(declare-fun b!157994 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5587 (_ BitVec 32)) SeekEntryResult!297)

(assert (=> b!157994 (= e!103474 (seekKeyOrZeroReturnVacant!0 (x!17437 lt!81622) (index!3358 lt!81622) (index!3358 lt!81622) key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)))))

(declare-fun b!157995 () Bool)

(declare-fun c!29745 () Bool)

(assert (=> b!157995 (= c!29745 (= lt!81623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!157995 (= e!103472 e!103474)))

(declare-fun b!157996 () Bool)

(assert (=> b!157996 (= e!103473 Undefined!297)))

(declare-fun d!50995 () Bool)

(declare-fun lt!81624 () SeekEntryResult!297)

(assert (=> d!50995 (and (or ((_ is Undefined!297) lt!81624) (not ((_ is Found!297) lt!81624)) (and (bvsge (index!3357 lt!81624) #b00000000000000000000000000000000) (bvslt (index!3357 lt!81624) (size!2926 (_keys!4969 thiss!1248))))) (or ((_ is Undefined!297) lt!81624) ((_ is Found!297) lt!81624) (not ((_ is MissingZero!297) lt!81624)) (and (bvsge (index!3356 lt!81624) #b00000000000000000000000000000000) (bvslt (index!3356 lt!81624) (size!2926 (_keys!4969 thiss!1248))))) (or ((_ is Undefined!297) lt!81624) ((_ is Found!297) lt!81624) ((_ is MissingZero!297) lt!81624) (not ((_ is MissingVacant!297) lt!81624)) (and (bvsge (index!3359 lt!81624) #b00000000000000000000000000000000) (bvslt (index!3359 lt!81624) (size!2926 (_keys!4969 thiss!1248))))) (or ((_ is Undefined!297) lt!81624) (ite ((_ is Found!297) lt!81624) (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3357 lt!81624)) key!828) (ite ((_ is MissingZero!297) lt!81624) (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3356 lt!81624)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!297) lt!81624) (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3359 lt!81624)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50995 (= lt!81624 e!103473)))

(declare-fun c!29746 () Bool)

(assert (=> d!50995 (= c!29746 (and ((_ is Intermediate!297) lt!81622) (undefined!1109 lt!81622)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5587 (_ BitVec 32)) SeekEntryResult!297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!50995 (= lt!81622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7690 thiss!1248)) key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)))))

(assert (=> d!50995 (validMask!0 (mask!7690 thiss!1248))))

(assert (=> d!50995 (= (seekEntryOrOpen!0 key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)) lt!81624)))

(declare-fun b!157997 () Bool)

(assert (=> b!157997 (= e!103472 (Found!297 (index!3358 lt!81622)))))

(assert (= (and d!50995 c!29746) b!157996))

(assert (= (and d!50995 (not c!29746)) b!157993))

(assert (= (and b!157993 c!29747) b!157997))

(assert (= (and b!157993 (not c!29747)) b!157995))

(assert (= (and b!157995 c!29745) b!157992))

(assert (= (and b!157995 (not c!29745)) b!157994))

(declare-fun m!190403 () Bool)

(assert (=> b!157993 m!190403))

(declare-fun m!190405 () Bool)

(assert (=> b!157994 m!190405))

(declare-fun m!190407 () Bool)

(assert (=> d!50995 m!190407))

(assert (=> d!50995 m!190367))

(declare-fun m!190409 () Bool)

(assert (=> d!50995 m!190409))

(declare-fun m!190411 () Bool)

(assert (=> d!50995 m!190411))

(assert (=> d!50995 m!190409))

(declare-fun m!190413 () Bool)

(assert (=> d!50995 m!190413))

(declare-fun m!190415 () Bool)

(assert (=> d!50995 m!190415))

(assert (=> b!157920 d!50995))

(declare-fun condMapEmpty!5579 () Bool)

(declare-fun mapDefault!5579 () ValueCell!1292)

(assert (=> mapNonEmpty!5570 (= condMapEmpty!5579 (= mapRest!5570 ((as const (Array (_ BitVec 32) ValueCell!1292)) mapDefault!5579)))))

(declare-fun e!103479 () Bool)

(declare-fun mapRes!5579 () Bool)

(assert (=> mapNonEmpty!5570 (= tp!12952 (and e!103479 mapRes!5579))))

(declare-fun b!158005 () Bool)

(assert (=> b!158005 (= e!103479 tp_is_empty!3271)))

(declare-fun mapIsEmpty!5579 () Bool)

(assert (=> mapIsEmpty!5579 mapRes!5579))

(declare-fun b!158004 () Bool)

(declare-fun e!103480 () Bool)

(assert (=> b!158004 (= e!103480 tp_is_empty!3271)))

(declare-fun mapNonEmpty!5579 () Bool)

(declare-fun tp!12968 () Bool)

(assert (=> mapNonEmpty!5579 (= mapRes!5579 (and tp!12968 e!103480))))

(declare-fun mapKey!5579 () (_ BitVec 32))

(declare-fun mapRest!5579 () (Array (_ BitVec 32) ValueCell!1292))

(declare-fun mapValue!5579 () ValueCell!1292)

(assert (=> mapNonEmpty!5579 (= mapRest!5570 (store mapRest!5579 mapKey!5579 mapValue!5579))))

(assert (= (and mapNonEmpty!5570 condMapEmpty!5579) mapIsEmpty!5579))

(assert (= (and mapNonEmpty!5570 (not condMapEmpty!5579)) mapNonEmpty!5579))

(assert (= (and mapNonEmpty!5579 ((_ is ValueCellFull!1292) mapValue!5579)) b!158004))

(assert (= (and mapNonEmpty!5570 ((_ is ValueCellFull!1292) mapDefault!5579)) b!158005))

(declare-fun m!190417 () Bool)

(assert (=> mapNonEmpty!5579 m!190417))

(check-sat (not mapNonEmpty!5579) b_and!9857 (not b!157979) (not b_next!3469) (not b!157977) (not d!50995) (not b!157994) tp_is_empty!3271 (not d!50989) (not b!157978))
(check-sat b_and!9857 (not b_next!3469))
(get-model)

(declare-fun b!158014 () Bool)

(declare-fun e!103488 () Bool)

(declare-fun call!17221 () Bool)

(assert (=> b!158014 (= e!103488 call!17221)))

(declare-fun d!50997 () Bool)

(declare-fun res!74622 () Bool)

(declare-fun e!103487 () Bool)

(assert (=> d!50997 (=> res!74622 e!103487)))

(assert (=> d!50997 (= res!74622 (bvsge #b00000000000000000000000000000000 (size!2926 (_keys!4969 thiss!1248))))))

(assert (=> d!50997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)) e!103487)))

(declare-fun bm!17218 () Bool)

(assert (=> bm!17218 (= call!17221 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4969 thiss!1248) (mask!7690 thiss!1248)))))

(declare-fun b!158015 () Bool)

(declare-fun e!103489 () Bool)

(assert (=> b!158015 (= e!103489 call!17221)))

(declare-fun b!158016 () Bool)

(assert (=> b!158016 (= e!103487 e!103489)))

(declare-fun c!29750 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158016 (= c!29750 (validKeyInArray!0 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158017 () Bool)

(assert (=> b!158017 (= e!103489 e!103488)))

(declare-fun lt!81633 () (_ BitVec 64))

(assert (=> b!158017 (= lt!81633 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4960 0))(
  ( (Unit!4961) )
))
(declare-fun lt!81632 () Unit!4960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5587 (_ BitVec 64) (_ BitVec 32)) Unit!4960)

(assert (=> b!158017 (= lt!81632 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4969 thiss!1248) lt!81633 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158017 (arrayContainsKey!0 (_keys!4969 thiss!1248) lt!81633 #b00000000000000000000000000000000)))

(declare-fun lt!81631 () Unit!4960)

(assert (=> b!158017 (= lt!81631 lt!81632)))

(declare-fun res!74621 () Bool)

(assert (=> b!158017 (= res!74621 (= (seekEntryOrOpen!0 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000) (_keys!4969 thiss!1248) (mask!7690 thiss!1248)) (Found!297 #b00000000000000000000000000000000)))))

(assert (=> b!158017 (=> (not res!74621) (not e!103488))))

(assert (= (and d!50997 (not res!74622)) b!158016))

(assert (= (and b!158016 c!29750) b!158017))

(assert (= (and b!158016 (not c!29750)) b!158015))

(assert (= (and b!158017 res!74621) b!158014))

(assert (= (or b!158014 b!158015) bm!17218))

(declare-fun m!190419 () Bool)

(assert (=> bm!17218 m!190419))

(declare-fun m!190421 () Bool)

(assert (=> b!158016 m!190421))

(assert (=> b!158016 m!190421))

(declare-fun m!190423 () Bool)

(assert (=> b!158016 m!190423))

(assert (=> b!158017 m!190421))

(declare-fun m!190425 () Bool)

(assert (=> b!158017 m!190425))

(declare-fun m!190427 () Bool)

(assert (=> b!158017 m!190427))

(assert (=> b!158017 m!190421))

(declare-fun m!190429 () Bool)

(assert (=> b!158017 m!190429))

(assert (=> b!157978 d!50997))

(declare-fun b!158036 () Bool)

(declare-fun lt!81639 () SeekEntryResult!297)

(assert (=> b!158036 (and (bvsge (index!3358 lt!81639) #b00000000000000000000000000000000) (bvslt (index!3358 lt!81639) (size!2926 (_keys!4969 thiss!1248))))))

(declare-fun e!103501 () Bool)

(assert (=> b!158036 (= e!103501 (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3358 lt!81639)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158037 () Bool)

(declare-fun e!103503 () SeekEntryResult!297)

(declare-fun e!103502 () SeekEntryResult!297)

(assert (=> b!158037 (= e!103503 e!103502)))

(declare-fun c!29759 () Bool)

(declare-fun lt!81638 () (_ BitVec 64))

(assert (=> b!158037 (= c!29759 (or (= lt!81638 key!828) (= (bvadd lt!81638 lt!81638) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!50999 () Bool)

(declare-fun e!103500 () Bool)

(assert (=> d!50999 e!103500))

(declare-fun c!29758 () Bool)

(assert (=> d!50999 (= c!29758 (and ((_ is Intermediate!297) lt!81639) (undefined!1109 lt!81639)))))

(assert (=> d!50999 (= lt!81639 e!103503)))

(declare-fun c!29757 () Bool)

(assert (=> d!50999 (= c!29757 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!50999 (= lt!81638 (select (arr!2644 (_keys!4969 thiss!1248)) (toIndex!0 key!828 (mask!7690 thiss!1248))))))

(assert (=> d!50999 (validMask!0 (mask!7690 thiss!1248))))

(assert (=> d!50999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7690 thiss!1248)) key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)) lt!81639)))

(declare-fun b!158038 () Bool)

(assert (=> b!158038 (and (bvsge (index!3358 lt!81639) #b00000000000000000000000000000000) (bvslt (index!3358 lt!81639) (size!2926 (_keys!4969 thiss!1248))))))

(declare-fun res!74630 () Bool)

(assert (=> b!158038 (= res!74630 (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3358 lt!81639)) key!828))))

(assert (=> b!158038 (=> res!74630 e!103501)))

(declare-fun e!103504 () Bool)

(assert (=> b!158038 (= e!103504 e!103501)))

(declare-fun b!158039 () Bool)

(assert (=> b!158039 (= e!103502 (Intermediate!297 false (toIndex!0 key!828 (mask!7690 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158040 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158040 (= e!103502 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7690 thiss!1248)) #b00000000000000000000000000000000 (mask!7690 thiss!1248)) key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)))))

(declare-fun b!158041 () Bool)

(assert (=> b!158041 (= e!103503 (Intermediate!297 true (toIndex!0 key!828 (mask!7690 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158042 () Bool)

(assert (=> b!158042 (= e!103500 e!103504)))

(declare-fun res!74629 () Bool)

(assert (=> b!158042 (= res!74629 (and ((_ is Intermediate!297) lt!81639) (not (undefined!1109 lt!81639)) (bvslt (x!17437 lt!81639) #b01111111111111111111111111111110) (bvsge (x!17437 lt!81639) #b00000000000000000000000000000000) (bvsge (x!17437 lt!81639) #b00000000000000000000000000000000)))))

(assert (=> b!158042 (=> (not res!74629) (not e!103504))))

(declare-fun b!158043 () Bool)

(assert (=> b!158043 (and (bvsge (index!3358 lt!81639) #b00000000000000000000000000000000) (bvslt (index!3358 lt!81639) (size!2926 (_keys!4969 thiss!1248))))))

(declare-fun res!74631 () Bool)

(assert (=> b!158043 (= res!74631 (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3358 lt!81639)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158043 (=> res!74631 e!103501)))

(declare-fun b!158044 () Bool)

(assert (=> b!158044 (= e!103500 (bvsge (x!17437 lt!81639) #b01111111111111111111111111111110))))

(assert (= (and d!50999 c!29757) b!158041))

(assert (= (and d!50999 (not c!29757)) b!158037))

(assert (= (and b!158037 c!29759) b!158039))

(assert (= (and b!158037 (not c!29759)) b!158040))

(assert (= (and d!50999 c!29758) b!158044))

(assert (= (and d!50999 (not c!29758)) b!158042))

(assert (= (and b!158042 res!74629) b!158038))

(assert (= (and b!158038 (not res!74630)) b!158043))

(assert (= (and b!158043 (not res!74631)) b!158036))

(declare-fun m!190431 () Bool)

(assert (=> b!158036 m!190431))

(assert (=> b!158040 m!190409))

(declare-fun m!190433 () Bool)

(assert (=> b!158040 m!190433))

(assert (=> b!158040 m!190433))

(declare-fun m!190435 () Bool)

(assert (=> b!158040 m!190435))

(assert (=> b!158043 m!190431))

(assert (=> b!158038 m!190431))

(assert (=> d!50999 m!190409))

(declare-fun m!190437 () Bool)

(assert (=> d!50999 m!190437))

(assert (=> d!50999 m!190367))

(assert (=> d!50995 d!50999))

(declare-fun d!51001 () Bool)

(declare-fun lt!81645 () (_ BitVec 32))

(declare-fun lt!81644 () (_ BitVec 32))

(assert (=> d!51001 (= lt!81645 (bvmul (bvxor lt!81644 (bvlshr lt!81644 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51001 (= lt!81644 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51001 (and (bvsge (mask!7690 thiss!1248) #b00000000000000000000000000000000) (let ((res!74632 (let ((h!2492 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17455 (bvmul (bvxor h!2492 (bvlshr h!2492 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17455 (bvlshr x!17455 #b00000000000000000000000000001101)) (mask!7690 thiss!1248)))))) (and (bvslt res!74632 (bvadd (mask!7690 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74632 #b00000000000000000000000000000000))))))

(assert (=> d!51001 (= (toIndex!0 key!828 (mask!7690 thiss!1248)) (bvand (bvxor lt!81645 (bvlshr lt!81645 #b00000000000000000000000000001101)) (mask!7690 thiss!1248)))))

(assert (=> d!50995 d!51001))

(assert (=> d!50995 d!50987))

(declare-fun bm!17221 () Bool)

(declare-fun call!17224 () (_ BitVec 32))

(assert (=> bm!17221 (= call!17224 (arrayCountValidKeys!0 (_keys!4969 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2926 (_keys!4969 thiss!1248))))))

(declare-fun b!158053 () Bool)

(declare-fun e!103510 () (_ BitVec 32))

(assert (=> b!158053 (= e!103510 call!17224)))

(declare-fun b!158054 () Bool)

(declare-fun e!103509 () (_ BitVec 32))

(assert (=> b!158054 (= e!103509 e!103510)))

(declare-fun c!29765 () Bool)

(assert (=> b!158054 (= c!29765 (validKeyInArray!0 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51003 () Bool)

(declare-fun lt!81648 () (_ BitVec 32))

(assert (=> d!51003 (and (bvsge lt!81648 #b00000000000000000000000000000000) (bvsle lt!81648 (bvsub (size!2926 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51003 (= lt!81648 e!103509)))

(declare-fun c!29764 () Bool)

(assert (=> d!51003 (= c!29764 (bvsge #b00000000000000000000000000000000 (size!2926 (_keys!4969 thiss!1248))))))

(assert (=> d!51003 (and (bvsle #b00000000000000000000000000000000 (size!2926 (_keys!4969 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2926 (_keys!4969 thiss!1248)) (size!2926 (_keys!4969 thiss!1248))))))

(assert (=> d!51003 (= (arrayCountValidKeys!0 (_keys!4969 thiss!1248) #b00000000000000000000000000000000 (size!2926 (_keys!4969 thiss!1248))) lt!81648)))

(declare-fun b!158055 () Bool)

(assert (=> b!158055 (= e!103509 #b00000000000000000000000000000000)))

(declare-fun b!158056 () Bool)

(assert (=> b!158056 (= e!103510 (bvadd #b00000000000000000000000000000001 call!17224))))

(assert (= (and d!51003 c!29764) b!158055))

(assert (= (and d!51003 (not c!29764)) b!158054))

(assert (= (and b!158054 c!29765) b!158056))

(assert (= (and b!158054 (not c!29765)) b!158053))

(assert (= (or b!158056 b!158053) bm!17221))

(declare-fun m!190439 () Bool)

(assert (=> bm!17221 m!190439))

(assert (=> b!158054 m!190421))

(assert (=> b!158054 m!190421))

(assert (=> b!158054 m!190423))

(assert (=> b!157977 d!51003))

(declare-fun d!51005 () Bool)

(declare-fun res!74644 () Bool)

(declare-fun e!103513 () Bool)

(assert (=> d!51005 (=> (not res!74644) (not e!103513))))

(assert (=> d!51005 (= res!74644 (validMask!0 (mask!7690 thiss!1248)))))

(assert (=> d!51005 (= (simpleValid!111 thiss!1248) e!103513)))

(declare-fun b!158067 () Bool)

(declare-fun res!74643 () Bool)

(assert (=> b!158067 (=> (not res!74643) (not e!103513))))

(declare-fun size!2932 (LongMapFixedSize!1492) (_ BitVec 32))

(assert (=> b!158067 (= res!74643 (= (size!2932 thiss!1248) (bvadd (_size!795 thiss!1248) (bvsdiv (bvadd (extraKeys!2929 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158068 () Bool)

(assert (=> b!158068 (= e!103513 (and (bvsge (extraKeys!2929 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2929 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!795 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158066 () Bool)

(declare-fun res!74642 () Bool)

(assert (=> b!158066 (=> (not res!74642) (not e!103513))))

(assert (=> b!158066 (= res!74642 (bvsge (size!2932 thiss!1248) (_size!795 thiss!1248)))))

(declare-fun b!158065 () Bool)

(declare-fun res!74641 () Bool)

(assert (=> b!158065 (=> (not res!74641) (not e!103513))))

(assert (=> b!158065 (= res!74641 (and (= (size!2927 (_values!3171 thiss!1248)) (bvadd (mask!7690 thiss!1248) #b00000000000000000000000000000001)) (= (size!2926 (_keys!4969 thiss!1248)) (size!2927 (_values!3171 thiss!1248))) (bvsge (_size!795 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!795 thiss!1248) (bvadd (mask!7690 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51005 res!74644) b!158065))

(assert (= (and b!158065 res!74641) b!158066))

(assert (= (and b!158066 res!74642) b!158067))

(assert (= (and b!158067 res!74643) b!158068))

(assert (=> d!51005 m!190367))

(declare-fun m!190441 () Bool)

(assert (=> b!158067 m!190441))

(assert (=> b!158066 m!190441))

(assert (=> d!50989 d!51005))

(declare-fun b!158081 () Bool)

(declare-fun e!103521 () SeekEntryResult!297)

(assert (=> b!158081 (= e!103521 Undefined!297)))

(declare-fun b!158082 () Bool)

(declare-fun e!103520 () SeekEntryResult!297)

(assert (=> b!158082 (= e!103520 (Found!297 (index!3358 lt!81622)))))

(declare-fun b!158083 () Bool)

(declare-fun c!29773 () Bool)

(declare-fun lt!81653 () (_ BitVec 64))

(assert (=> b!158083 (= c!29773 (= lt!81653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103522 () SeekEntryResult!297)

(assert (=> b!158083 (= e!103520 e!103522)))

(declare-fun b!158084 () Bool)

(assert (=> b!158084 (= e!103522 (MissingVacant!297 (index!3358 lt!81622)))))

(declare-fun lt!81654 () SeekEntryResult!297)

(declare-fun d!51007 () Bool)

(assert (=> d!51007 (and (or ((_ is Undefined!297) lt!81654) (not ((_ is Found!297) lt!81654)) (and (bvsge (index!3357 lt!81654) #b00000000000000000000000000000000) (bvslt (index!3357 lt!81654) (size!2926 (_keys!4969 thiss!1248))))) (or ((_ is Undefined!297) lt!81654) ((_ is Found!297) lt!81654) (not ((_ is MissingVacant!297) lt!81654)) (not (= (index!3359 lt!81654) (index!3358 lt!81622))) (and (bvsge (index!3359 lt!81654) #b00000000000000000000000000000000) (bvslt (index!3359 lt!81654) (size!2926 (_keys!4969 thiss!1248))))) (or ((_ is Undefined!297) lt!81654) (ite ((_ is Found!297) lt!81654) (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3357 lt!81654)) key!828) (and ((_ is MissingVacant!297) lt!81654) (= (index!3359 lt!81654) (index!3358 lt!81622)) (= (select (arr!2644 (_keys!4969 thiss!1248)) (index!3359 lt!81654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51007 (= lt!81654 e!103521)))

(declare-fun c!29774 () Bool)

(assert (=> d!51007 (= c!29774 (bvsge (x!17437 lt!81622) #b01111111111111111111111111111110))))

(assert (=> d!51007 (= lt!81653 (select (arr!2644 (_keys!4969 thiss!1248)) (index!3358 lt!81622)))))

(assert (=> d!51007 (validMask!0 (mask!7690 thiss!1248))))

(assert (=> d!51007 (= (seekKeyOrZeroReturnVacant!0 (x!17437 lt!81622) (index!3358 lt!81622) (index!3358 lt!81622) key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)) lt!81654)))

(declare-fun b!158085 () Bool)

(assert (=> b!158085 (= e!103521 e!103520)))

(declare-fun c!29772 () Bool)

(assert (=> b!158085 (= c!29772 (= lt!81653 key!828))))

(declare-fun b!158086 () Bool)

(assert (=> b!158086 (= e!103522 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17437 lt!81622) #b00000000000000000000000000000001) (nextIndex!0 (index!3358 lt!81622) (x!17437 lt!81622) (mask!7690 thiss!1248)) (index!3358 lt!81622) key!828 (_keys!4969 thiss!1248) (mask!7690 thiss!1248)))))

(assert (= (and d!51007 c!29774) b!158081))

(assert (= (and d!51007 (not c!29774)) b!158085))

(assert (= (and b!158085 c!29772) b!158082))

(assert (= (and b!158085 (not c!29772)) b!158083))

(assert (= (and b!158083 c!29773) b!158084))

(assert (= (and b!158083 (not c!29773)) b!158086))

(declare-fun m!190443 () Bool)

(assert (=> d!51007 m!190443))

(declare-fun m!190445 () Bool)

(assert (=> d!51007 m!190445))

(assert (=> d!51007 m!190403))

(assert (=> d!51007 m!190367))

(declare-fun m!190447 () Bool)

(assert (=> b!158086 m!190447))

(assert (=> b!158086 m!190447))

(declare-fun m!190449 () Bool)

(assert (=> b!158086 m!190449))

(assert (=> b!157994 d!51007))

(declare-fun b!158097 () Bool)

(declare-fun e!103533 () Bool)

(declare-fun e!103532 () Bool)

(assert (=> b!158097 (= e!103533 e!103532)))

(declare-fun c!29777 () Bool)

(assert (=> b!158097 (= c!29777 (validKeyInArray!0 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158098 () Bool)

(declare-fun call!17227 () Bool)

(assert (=> b!158098 (= e!103532 call!17227)))

(declare-fun b!158099 () Bool)

(assert (=> b!158099 (= e!103532 call!17227)))

(declare-fun b!158100 () Bool)

(declare-fun e!103534 () Bool)

(assert (=> b!158100 (= e!103534 e!103533)))

(declare-fun res!74651 () Bool)

(assert (=> b!158100 (=> (not res!74651) (not e!103533))))

(declare-fun e!103531 () Bool)

(assert (=> b!158100 (= res!74651 (not e!103531))))

(declare-fun res!74652 () Bool)

(assert (=> b!158100 (=> (not res!74652) (not e!103531))))

(assert (=> b!158100 (= res!74652 (validKeyInArray!0 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51009 () Bool)

(declare-fun res!74653 () Bool)

(assert (=> d!51009 (=> res!74653 e!103534)))

(assert (=> d!51009 (= res!74653 (bvsge #b00000000000000000000000000000000 (size!2926 (_keys!4969 thiss!1248))))))

(assert (=> d!51009 (= (arrayNoDuplicates!0 (_keys!4969 thiss!1248) #b00000000000000000000000000000000 Nil!1882) e!103534)))

(declare-fun b!158101 () Bool)

(declare-fun contains!965 (List!1885 (_ BitVec 64)) Bool)

(assert (=> b!158101 (= e!103531 (contains!965 Nil!1882 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17224 () Bool)

(assert (=> bm!17224 (= call!17227 (arrayNoDuplicates!0 (_keys!4969 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29777 (Cons!1881 (select (arr!2644 (_keys!4969 thiss!1248)) #b00000000000000000000000000000000) Nil!1882) Nil!1882)))))

(assert (= (and d!51009 (not res!74653)) b!158100))

(assert (= (and b!158100 res!74652) b!158101))

(assert (= (and b!158100 res!74651) b!158097))

(assert (= (and b!158097 c!29777) b!158098))

(assert (= (and b!158097 (not c!29777)) b!158099))

(assert (= (or b!158098 b!158099) bm!17224))

(assert (=> b!158097 m!190421))

(assert (=> b!158097 m!190421))

(assert (=> b!158097 m!190423))

(assert (=> b!158100 m!190421))

(assert (=> b!158100 m!190421))

(assert (=> b!158100 m!190423))

(assert (=> b!158101 m!190421))

(assert (=> b!158101 m!190421))

(declare-fun m!190451 () Bool)

(assert (=> b!158101 m!190451))

(assert (=> bm!17224 m!190421))

(declare-fun m!190453 () Bool)

(assert (=> bm!17224 m!190453))

(assert (=> b!157979 d!51009))

(declare-fun condMapEmpty!5580 () Bool)

(declare-fun mapDefault!5580 () ValueCell!1292)

(assert (=> mapNonEmpty!5579 (= condMapEmpty!5580 (= mapRest!5579 ((as const (Array (_ BitVec 32) ValueCell!1292)) mapDefault!5580)))))

(declare-fun e!103535 () Bool)

(declare-fun mapRes!5580 () Bool)

(assert (=> mapNonEmpty!5579 (= tp!12968 (and e!103535 mapRes!5580))))

(declare-fun b!158103 () Bool)

(assert (=> b!158103 (= e!103535 tp_is_empty!3271)))

(declare-fun mapIsEmpty!5580 () Bool)

(assert (=> mapIsEmpty!5580 mapRes!5580))

(declare-fun b!158102 () Bool)

(declare-fun e!103536 () Bool)

(assert (=> b!158102 (= e!103536 tp_is_empty!3271)))

(declare-fun mapNonEmpty!5580 () Bool)

(declare-fun tp!12969 () Bool)

(assert (=> mapNonEmpty!5580 (= mapRes!5580 (and tp!12969 e!103536))))

(declare-fun mapRest!5580 () (Array (_ BitVec 32) ValueCell!1292))

(declare-fun mapValue!5580 () ValueCell!1292)

(declare-fun mapKey!5580 () (_ BitVec 32))

(assert (=> mapNonEmpty!5580 (= mapRest!5579 (store mapRest!5580 mapKey!5580 mapValue!5580))))

(assert (= (and mapNonEmpty!5579 condMapEmpty!5580) mapIsEmpty!5580))

(assert (= (and mapNonEmpty!5579 (not condMapEmpty!5580)) mapNonEmpty!5580))

(assert (= (and mapNonEmpty!5580 ((_ is ValueCellFull!1292) mapValue!5580)) b!158102))

(assert (= (and mapNonEmpty!5579 ((_ is ValueCellFull!1292) mapDefault!5580)) b!158103))

(declare-fun m!190455 () Bool)

(assert (=> mapNonEmpty!5580 m!190455))

(check-sat (not b!158054) b_and!9857 (not mapNonEmpty!5580) (not b!158017) (not b!158100) (not bm!17218) (not b!158066) (not bm!17224) (not b_next!3469) (not b!158040) tp_is_empty!3271 (not b!158067) (not b!158016) (not d!51005) (not bm!17221) (not b!158097) (not d!51007) (not b!158101) (not b!158086) (not d!50999))
(check-sat b_and!9857 (not b_next!3469))
