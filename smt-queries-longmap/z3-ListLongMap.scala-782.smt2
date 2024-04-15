; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18542 () Bool)

(assert start!18542)

(declare-fun b!183554 () Bool)

(declare-fun b_free!4531 () Bool)

(declare-fun b_next!4531 () Bool)

(assert (=> b!183554 (= b_free!4531 (not b_next!4531))))

(declare-fun tp!16367 () Bool)

(declare-fun b_and!11081 () Bool)

(assert (=> b!183554 (= tp!16367 b_and!11081)))

(declare-fun b!183549 () Bool)

(declare-fun e!120829 () Bool)

(declare-datatypes ((V!5385 0))(
  ( (V!5386 (val!2196 Int)) )
))
(declare-datatypes ((ValueCell!1808 0))(
  ( (ValueCellFull!1808 (v!4094 V!5385)) (EmptyCell!1808) )
))
(declare-datatypes ((array!7781 0))(
  ( (array!7782 (arr!3676 (Array (_ BitVec 32) (_ BitVec 64))) (size!3990 (_ BitVec 32))) )
))
(declare-datatypes ((array!7783 0))(
  ( (array!7784 (arr!3677 (Array (_ BitVec 32) ValueCell!1808)) (size!3991 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2524 0))(
  ( (LongMapFixedSize!2525 (defaultEntry!3754 Int) (mask!8823 (_ BitVec 32)) (extraKeys!3491 (_ BitVec 32)) (zeroValue!3595 V!5385) (minValue!3595 V!5385) (_size!1311 (_ BitVec 32)) (_keys!5675 array!7781) (_values!3737 array!7783) (_vacant!1311 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2524)

(assert (=> b!183549 (= e!120829 (and (= (size!3991 (_values!3737 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8823 thiss!1248))) (not (= (size!3990 (_keys!5675 thiss!1248)) (size!3991 (_values!3737 thiss!1248))))))))

(declare-fun b!183550 () Bool)

(declare-fun e!120828 () Bool)

(declare-fun tp_is_empty!4303 () Bool)

(assert (=> b!183550 (= e!120828 tp_is_empty!4303)))

(declare-fun b!183551 () Bool)

(declare-fun e!120830 () Bool)

(assert (=> b!183551 (= e!120830 e!120829)))

(declare-fun res!86842 () Bool)

(assert (=> b!183551 (=> (not res!86842) (not e!120829))))

(declare-datatypes ((SeekEntryResult!624 0))(
  ( (MissingZero!624 (index!4666 (_ BitVec 32))) (Found!624 (index!4667 (_ BitVec 32))) (Intermediate!624 (undefined!1436 Bool) (index!4668 (_ BitVec 32)) (x!20003 (_ BitVec 32))) (Undefined!624) (MissingVacant!624 (index!4669 (_ BitVec 32))) )
))
(declare-fun lt!90644 () SeekEntryResult!624)

(get-info :version)

(assert (=> b!183551 (= res!86842 (and (not ((_ is Undefined!624) lt!90644)) (not ((_ is MissingVacant!624) lt!90644)) (not ((_ is MissingZero!624) lt!90644)) ((_ is Found!624) lt!90644)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7781 (_ BitVec 32)) SeekEntryResult!624)

(assert (=> b!183551 (= lt!90644 (seekEntryOrOpen!0 key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(declare-fun mapNonEmpty!7392 () Bool)

(declare-fun mapRes!7392 () Bool)

(declare-fun tp!16368 () Bool)

(declare-fun e!120831 () Bool)

(assert (=> mapNonEmpty!7392 (= mapRes!7392 (and tp!16368 e!120831))))

(declare-fun mapRest!7392 () (Array (_ BitVec 32) ValueCell!1808))

(declare-fun mapKey!7392 () (_ BitVec 32))

(declare-fun mapValue!7392 () ValueCell!1808)

(assert (=> mapNonEmpty!7392 (= (arr!3677 (_values!3737 thiss!1248)) (store mapRest!7392 mapKey!7392 mapValue!7392))))

(declare-fun mapIsEmpty!7392 () Bool)

(assert (=> mapIsEmpty!7392 mapRes!7392))

(declare-fun b!183552 () Bool)

(declare-fun res!86841 () Bool)

(assert (=> b!183552 (=> (not res!86841) (not e!120829))))

(declare-datatypes ((tuple2!3390 0))(
  ( (tuple2!3391 (_1!1706 (_ BitVec 64)) (_2!1706 V!5385)) )
))
(declare-datatypes ((List!2331 0))(
  ( (Nil!2328) (Cons!2327 (h!2957 tuple2!3390) (t!7192 List!2331)) )
))
(declare-datatypes ((ListLongMap!2299 0))(
  ( (ListLongMap!2300 (toList!1165 List!2331)) )
))
(declare-fun contains!1259 (ListLongMap!2299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!798 (array!7781 array!7783 (_ BitVec 32) (_ BitVec 32) V!5385 V!5385 (_ BitVec 32) Int) ListLongMap!2299)

(assert (=> b!183552 (= res!86841 (not (contains!1259 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) key!828)))))

(declare-fun b!183553 () Bool)

(declare-fun res!86844 () Bool)

(assert (=> b!183553 (=> (not res!86844) (not e!120830))))

(assert (=> b!183553 (= res!86844 (not (= key!828 (bvneg key!828))))))

(declare-fun res!86840 () Bool)

(assert (=> start!18542 (=> (not res!86840) (not e!120830))))

(declare-fun valid!1062 (LongMapFixedSize!2524) Bool)

(assert (=> start!18542 (= res!86840 (valid!1062 thiss!1248))))

(assert (=> start!18542 e!120830))

(declare-fun e!120832 () Bool)

(assert (=> start!18542 e!120832))

(assert (=> start!18542 true))

(declare-fun e!120827 () Bool)

(declare-fun array_inv!2377 (array!7781) Bool)

(declare-fun array_inv!2378 (array!7783) Bool)

(assert (=> b!183554 (= e!120832 (and tp!16367 tp_is_empty!4303 (array_inv!2377 (_keys!5675 thiss!1248)) (array_inv!2378 (_values!3737 thiss!1248)) e!120827))))

(declare-fun b!183555 () Bool)

(declare-fun res!86843 () Bool)

(assert (=> b!183555 (=> (not res!86843) (not e!120829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183555 (= res!86843 (validMask!0 (mask!8823 thiss!1248)))))

(declare-fun b!183556 () Bool)

(assert (=> b!183556 (= e!120831 tp_is_empty!4303)))

(declare-fun b!183557 () Bool)

(assert (=> b!183557 (= e!120827 (and e!120828 mapRes!7392))))

(declare-fun condMapEmpty!7392 () Bool)

(declare-fun mapDefault!7392 () ValueCell!1808)

(assert (=> b!183557 (= condMapEmpty!7392 (= (arr!3677 (_values!3737 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1808)) mapDefault!7392)))))

(assert (= (and start!18542 res!86840) b!183553))

(assert (= (and b!183553 res!86844) b!183551))

(assert (= (and b!183551 res!86842) b!183552))

(assert (= (and b!183552 res!86841) b!183555))

(assert (= (and b!183555 res!86843) b!183549))

(assert (= (and b!183557 condMapEmpty!7392) mapIsEmpty!7392))

(assert (= (and b!183557 (not condMapEmpty!7392)) mapNonEmpty!7392))

(assert (= (and mapNonEmpty!7392 ((_ is ValueCellFull!1808) mapValue!7392)) b!183556))

(assert (= (and b!183557 ((_ is ValueCellFull!1808) mapDefault!7392)) b!183550))

(assert (= b!183554 b!183557))

(assert (= start!18542 b!183554))

(declare-fun m!210571 () Bool)

(assert (=> mapNonEmpty!7392 m!210571))

(declare-fun m!210573 () Bool)

(assert (=> b!183551 m!210573))

(declare-fun m!210575 () Bool)

(assert (=> b!183554 m!210575))

(declare-fun m!210577 () Bool)

(assert (=> b!183554 m!210577))

(declare-fun m!210579 () Bool)

(assert (=> start!18542 m!210579))

(declare-fun m!210581 () Bool)

(assert (=> b!183552 m!210581))

(assert (=> b!183552 m!210581))

(declare-fun m!210583 () Bool)

(assert (=> b!183552 m!210583))

(declare-fun m!210585 () Bool)

(assert (=> b!183555 m!210585))

(check-sat (not b!183555) (not b!183551) b_and!11081 (not b!183554) tp_is_empty!4303 (not b!183552) (not mapNonEmpty!7392) (not start!18542) (not b_next!4531))
(check-sat b_and!11081 (not b_next!4531))
(get-model)

(declare-fun d!54645 () Bool)

(assert (=> d!54645 (= (validMask!0 (mask!8823 thiss!1248)) (and (or (= (mask!8823 thiss!1248) #b00000000000000000000000000000111) (= (mask!8823 thiss!1248) #b00000000000000000000000000001111) (= (mask!8823 thiss!1248) #b00000000000000000000000000011111) (= (mask!8823 thiss!1248) #b00000000000000000000000000111111) (= (mask!8823 thiss!1248) #b00000000000000000000000001111111) (= (mask!8823 thiss!1248) #b00000000000000000000000011111111) (= (mask!8823 thiss!1248) #b00000000000000000000000111111111) (= (mask!8823 thiss!1248) #b00000000000000000000001111111111) (= (mask!8823 thiss!1248) #b00000000000000000000011111111111) (= (mask!8823 thiss!1248) #b00000000000000000000111111111111) (= (mask!8823 thiss!1248) #b00000000000000000001111111111111) (= (mask!8823 thiss!1248) #b00000000000000000011111111111111) (= (mask!8823 thiss!1248) #b00000000000000000111111111111111) (= (mask!8823 thiss!1248) #b00000000000000001111111111111111) (= (mask!8823 thiss!1248) #b00000000000000011111111111111111) (= (mask!8823 thiss!1248) #b00000000000000111111111111111111) (= (mask!8823 thiss!1248) #b00000000000001111111111111111111) (= (mask!8823 thiss!1248) #b00000000000011111111111111111111) (= (mask!8823 thiss!1248) #b00000000000111111111111111111111) (= (mask!8823 thiss!1248) #b00000000001111111111111111111111) (= (mask!8823 thiss!1248) #b00000000011111111111111111111111) (= (mask!8823 thiss!1248) #b00000000111111111111111111111111) (= (mask!8823 thiss!1248) #b00000001111111111111111111111111) (= (mask!8823 thiss!1248) #b00000011111111111111111111111111) (= (mask!8823 thiss!1248) #b00000111111111111111111111111111) (= (mask!8823 thiss!1248) #b00001111111111111111111111111111) (= (mask!8823 thiss!1248) #b00011111111111111111111111111111) (= (mask!8823 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8823 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183555 d!54645))

(declare-fun b!183624 () Bool)

(declare-fun e!120883 () SeekEntryResult!624)

(declare-fun lt!90658 () SeekEntryResult!624)

(assert (=> b!183624 (= e!120883 (MissingZero!624 (index!4668 lt!90658)))))

(declare-fun b!183625 () Bool)

(declare-fun c!32913 () Bool)

(declare-fun lt!90659 () (_ BitVec 64))

(assert (=> b!183625 (= c!32913 (= lt!90659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120882 () SeekEntryResult!624)

(assert (=> b!183625 (= e!120882 e!120883)))

(declare-fun b!183626 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7781 (_ BitVec 32)) SeekEntryResult!624)

(assert (=> b!183626 (= e!120883 (seekKeyOrZeroReturnVacant!0 (x!20003 lt!90658) (index!4668 lt!90658) (index!4668 lt!90658) key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(declare-fun b!183627 () Bool)

(declare-fun e!120884 () SeekEntryResult!624)

(assert (=> b!183627 (= e!120884 Undefined!624)))

(declare-fun d!54647 () Bool)

(declare-fun lt!90657 () SeekEntryResult!624)

(assert (=> d!54647 (and (or ((_ is Undefined!624) lt!90657) (not ((_ is Found!624) lt!90657)) (and (bvsge (index!4667 lt!90657) #b00000000000000000000000000000000) (bvslt (index!4667 lt!90657) (size!3990 (_keys!5675 thiss!1248))))) (or ((_ is Undefined!624) lt!90657) ((_ is Found!624) lt!90657) (not ((_ is MissingZero!624) lt!90657)) (and (bvsge (index!4666 lt!90657) #b00000000000000000000000000000000) (bvslt (index!4666 lt!90657) (size!3990 (_keys!5675 thiss!1248))))) (or ((_ is Undefined!624) lt!90657) ((_ is Found!624) lt!90657) ((_ is MissingZero!624) lt!90657) (not ((_ is MissingVacant!624) lt!90657)) (and (bvsge (index!4669 lt!90657) #b00000000000000000000000000000000) (bvslt (index!4669 lt!90657) (size!3990 (_keys!5675 thiss!1248))))) (or ((_ is Undefined!624) lt!90657) (ite ((_ is Found!624) lt!90657) (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4667 lt!90657)) key!828) (ite ((_ is MissingZero!624) lt!90657) (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4666 lt!90657)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!624) lt!90657) (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4669 lt!90657)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54647 (= lt!90657 e!120884)))

(declare-fun c!32915 () Bool)

(assert (=> d!54647 (= c!32915 (and ((_ is Intermediate!624) lt!90658) (undefined!1436 lt!90658)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7781 (_ BitVec 32)) SeekEntryResult!624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54647 (= lt!90658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8823 thiss!1248)) key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(assert (=> d!54647 (validMask!0 (mask!8823 thiss!1248))))

(assert (=> d!54647 (= (seekEntryOrOpen!0 key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)) lt!90657)))

(declare-fun b!183628 () Bool)

(assert (=> b!183628 (= e!120882 (Found!624 (index!4668 lt!90658)))))

(declare-fun b!183629 () Bool)

(assert (=> b!183629 (= e!120884 e!120882)))

(assert (=> b!183629 (= lt!90659 (select (arr!3676 (_keys!5675 thiss!1248)) (index!4668 lt!90658)))))

(declare-fun c!32914 () Bool)

(assert (=> b!183629 (= c!32914 (= lt!90659 key!828))))

(assert (= (and d!54647 c!32915) b!183627))

(assert (= (and d!54647 (not c!32915)) b!183629))

(assert (= (and b!183629 c!32914) b!183628))

(assert (= (and b!183629 (not c!32914)) b!183625))

(assert (= (and b!183625 c!32913) b!183624))

(assert (= (and b!183625 (not c!32913)) b!183626))

(declare-fun m!210619 () Bool)

(assert (=> b!183626 m!210619))

(declare-fun m!210621 () Bool)

(assert (=> d!54647 m!210621))

(assert (=> d!54647 m!210585))

(declare-fun m!210623 () Bool)

(assert (=> d!54647 m!210623))

(declare-fun m!210625 () Bool)

(assert (=> d!54647 m!210625))

(assert (=> d!54647 m!210621))

(declare-fun m!210627 () Bool)

(assert (=> d!54647 m!210627))

(declare-fun m!210629 () Bool)

(assert (=> d!54647 m!210629))

(declare-fun m!210631 () Bool)

(assert (=> b!183629 m!210631))

(assert (=> b!183551 d!54647))

(declare-fun d!54649 () Bool)

(assert (=> d!54649 (= (array_inv!2377 (_keys!5675 thiss!1248)) (bvsge (size!3990 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183554 d!54649))

(declare-fun d!54651 () Bool)

(assert (=> d!54651 (= (array_inv!2378 (_values!3737 thiss!1248)) (bvsge (size!3991 (_values!3737 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183554 d!54651))

(declare-fun d!54653 () Bool)

(declare-fun res!86881 () Bool)

(declare-fun e!120887 () Bool)

(assert (=> d!54653 (=> (not res!86881) (not e!120887))))

(declare-fun simpleValid!176 (LongMapFixedSize!2524) Bool)

(assert (=> d!54653 (= res!86881 (simpleValid!176 thiss!1248))))

(assert (=> d!54653 (= (valid!1062 thiss!1248) e!120887)))

(declare-fun b!183636 () Bool)

(declare-fun res!86882 () Bool)

(assert (=> b!183636 (=> (not res!86882) (not e!120887))))

(declare-fun arrayCountValidKeys!0 (array!7781 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183636 (= res!86882 (= (arrayCountValidKeys!0 (_keys!5675 thiss!1248) #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))) (_size!1311 thiss!1248)))))

(declare-fun b!183637 () Bool)

(declare-fun res!86883 () Bool)

(assert (=> b!183637 (=> (not res!86883) (not e!120887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7781 (_ BitVec 32)) Bool)

(assert (=> b!183637 (= res!86883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(declare-fun b!183638 () Bool)

(declare-datatypes ((List!2333 0))(
  ( (Nil!2330) (Cons!2329 (h!2959 (_ BitVec 64)) (t!7196 List!2333)) )
))
(declare-fun arrayNoDuplicates!0 (array!7781 (_ BitVec 32) List!2333) Bool)

(assert (=> b!183638 (= e!120887 (arrayNoDuplicates!0 (_keys!5675 thiss!1248) #b00000000000000000000000000000000 Nil!2330))))

(assert (= (and d!54653 res!86881) b!183636))

(assert (= (and b!183636 res!86882) b!183637))

(assert (= (and b!183637 res!86883) b!183638))

(declare-fun m!210633 () Bool)

(assert (=> d!54653 m!210633))

(declare-fun m!210635 () Bool)

(assert (=> b!183636 m!210635))

(declare-fun m!210637 () Bool)

(assert (=> b!183637 m!210637))

(declare-fun m!210639 () Bool)

(assert (=> b!183638 m!210639))

(assert (=> start!18542 d!54653))

(declare-fun d!54655 () Bool)

(declare-fun e!120893 () Bool)

(assert (=> d!54655 e!120893))

(declare-fun res!86886 () Bool)

(assert (=> d!54655 (=> res!86886 e!120893)))

(declare-fun lt!90671 () Bool)

(assert (=> d!54655 (= res!86886 (not lt!90671))))

(declare-fun lt!90668 () Bool)

(assert (=> d!54655 (= lt!90671 lt!90668)))

(declare-datatypes ((Unit!5527 0))(
  ( (Unit!5528) )
))
(declare-fun lt!90669 () Unit!5527)

(declare-fun e!120892 () Unit!5527)

(assert (=> d!54655 (= lt!90669 e!120892)))

(declare-fun c!32918 () Bool)

(assert (=> d!54655 (= c!32918 lt!90668)))

(declare-fun containsKey!219 (List!2331 (_ BitVec 64)) Bool)

(assert (=> d!54655 (= lt!90668 (containsKey!219 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(assert (=> d!54655 (= (contains!1259 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) key!828) lt!90671)))

(declare-fun b!183645 () Bool)

(declare-fun lt!90670 () Unit!5527)

(assert (=> b!183645 (= e!120892 lt!90670)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!168 (List!2331 (_ BitVec 64)) Unit!5527)

(assert (=> b!183645 (= lt!90670 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-datatypes ((Option!221 0))(
  ( (Some!220 (v!4097 V!5385)) (None!219) )
))
(declare-fun isDefined!169 (Option!221) Bool)

(declare-fun getValueByKey!215 (List!2331 (_ BitVec 64)) Option!221)

(assert (=> b!183645 (isDefined!169 (getValueByKey!215 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-fun b!183646 () Bool)

(declare-fun Unit!5529 () Unit!5527)

(assert (=> b!183646 (= e!120892 Unit!5529)))

(declare-fun b!183647 () Bool)

(assert (=> b!183647 (= e!120893 (isDefined!169 (getValueByKey!215 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828)))))

(assert (= (and d!54655 c!32918) b!183645))

(assert (= (and d!54655 (not c!32918)) b!183646))

(assert (= (and d!54655 (not res!86886)) b!183647))

(declare-fun m!210641 () Bool)

(assert (=> d!54655 m!210641))

(declare-fun m!210643 () Bool)

(assert (=> b!183645 m!210643))

(declare-fun m!210645 () Bool)

(assert (=> b!183645 m!210645))

(assert (=> b!183645 m!210645))

(declare-fun m!210647 () Bool)

(assert (=> b!183645 m!210647))

(assert (=> b!183647 m!210645))

(assert (=> b!183647 m!210645))

(assert (=> b!183647 m!210647))

(assert (=> b!183552 d!54655))

(declare-fun b!183690 () Bool)

(declare-fun e!120921 () Bool)

(declare-fun e!120929 () Bool)

(assert (=> b!183690 (= e!120921 e!120929)))

(declare-fun res!86909 () Bool)

(assert (=> b!183690 (=> (not res!86909) (not e!120929))))

(declare-fun lt!90717 () ListLongMap!2299)

(assert (=> b!183690 (= res!86909 (contains!1259 lt!90717 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun b!183691 () Bool)

(declare-fun e!120931 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183691 (= e!120931 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183692 () Bool)

(declare-fun e!120927 () Unit!5527)

(declare-fun Unit!5530 () Unit!5527)

(assert (=> b!183692 (= e!120927 Unit!5530)))

(declare-fun b!183693 () Bool)

(declare-fun e!120925 () Bool)

(declare-fun e!120922 () Bool)

(assert (=> b!183693 (= e!120925 e!120922)))

(declare-fun res!86911 () Bool)

(declare-fun call!18532 () Bool)

(assert (=> b!183693 (= res!86911 call!18532)))

(assert (=> b!183693 (=> (not res!86911) (not e!120922))))

(declare-fun bm!18529 () Bool)

(declare-fun call!18536 () ListLongMap!2299)

(declare-fun call!18533 () ListLongMap!2299)

(assert (=> bm!18529 (= call!18536 call!18533)))

(declare-fun b!183694 () Bool)

(declare-fun e!120930 () Bool)

(declare-fun call!18537 () Bool)

(assert (=> b!183694 (= e!120930 (not call!18537))))

(declare-fun b!183695 () Bool)

(declare-fun lt!90737 () Unit!5527)

(assert (=> b!183695 (= e!120927 lt!90737)))

(declare-fun lt!90732 () ListLongMap!2299)

(declare-fun getCurrentListMapNoExtraKeys!181 (array!7781 array!7783 (_ BitVec 32) (_ BitVec 32) V!5385 V!5385 (_ BitVec 32) Int) ListLongMap!2299)

(assert (=> b!183695 (= lt!90732 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90729 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90726 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90726 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90731 () Unit!5527)

(declare-fun addStillContains!136 (ListLongMap!2299 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5527)

(assert (=> b!183695 (= lt!90731 (addStillContains!136 lt!90732 lt!90729 (zeroValue!3595 thiss!1248) lt!90726))))

(declare-fun +!277 (ListLongMap!2299 tuple2!3390) ListLongMap!2299)

(assert (=> b!183695 (contains!1259 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))) lt!90726)))

(declare-fun lt!90723 () Unit!5527)

(assert (=> b!183695 (= lt!90723 lt!90731)))

(declare-fun lt!90728 () ListLongMap!2299)

(assert (=> b!183695 (= lt!90728 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90720 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90720 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90733 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90733 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90722 () Unit!5527)

(declare-fun addApplyDifferent!136 (ListLongMap!2299 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5527)

(assert (=> b!183695 (= lt!90722 (addApplyDifferent!136 lt!90728 lt!90720 (minValue!3595 thiss!1248) lt!90733))))

(declare-fun apply!160 (ListLongMap!2299 (_ BitVec 64)) V!5385)

(assert (=> b!183695 (= (apply!160 (+!277 lt!90728 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))) lt!90733) (apply!160 lt!90728 lt!90733))))

(declare-fun lt!90721 () Unit!5527)

(assert (=> b!183695 (= lt!90721 lt!90722)))

(declare-fun lt!90724 () ListLongMap!2299)

(assert (=> b!183695 (= lt!90724 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90716 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90735 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90735 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90727 () Unit!5527)

(assert (=> b!183695 (= lt!90727 (addApplyDifferent!136 lt!90724 lt!90716 (zeroValue!3595 thiss!1248) lt!90735))))

(assert (=> b!183695 (= (apply!160 (+!277 lt!90724 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))) lt!90735) (apply!160 lt!90724 lt!90735))))

(declare-fun lt!90730 () Unit!5527)

(assert (=> b!183695 (= lt!90730 lt!90727)))

(declare-fun lt!90719 () ListLongMap!2299)

(assert (=> b!183695 (= lt!90719 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90736 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90736 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90734 () (_ BitVec 64))

(assert (=> b!183695 (= lt!90734 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183695 (= lt!90737 (addApplyDifferent!136 lt!90719 lt!90736 (minValue!3595 thiss!1248) lt!90734))))

(assert (=> b!183695 (= (apply!160 (+!277 lt!90719 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))) lt!90734) (apply!160 lt!90719 lt!90734))))

(declare-fun b!183696 () Bool)

(declare-fun c!32935 () Bool)

(assert (=> b!183696 (= c!32935 (and (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120923 () ListLongMap!2299)

(declare-fun e!120926 () ListLongMap!2299)

(assert (=> b!183696 (= e!120923 e!120926)))

(declare-fun bm!18530 () Bool)

(declare-fun call!18538 () ListLongMap!2299)

(declare-fun call!18534 () ListLongMap!2299)

(assert (=> bm!18530 (= call!18538 call!18534)))

(declare-fun d!54657 () Bool)

(declare-fun e!120932 () Bool)

(assert (=> d!54657 e!120932))

(declare-fun res!86908 () Bool)

(assert (=> d!54657 (=> (not res!86908) (not e!120932))))

(assert (=> d!54657 (= res!86908 (or (bvsge #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))))

(declare-fun lt!90725 () ListLongMap!2299)

(assert (=> d!54657 (= lt!90717 lt!90725)))

(declare-fun lt!90718 () Unit!5527)

(assert (=> d!54657 (= lt!90718 e!120927)))

(declare-fun c!32931 () Bool)

(declare-fun e!120924 () Bool)

(assert (=> d!54657 (= c!32931 e!120924)))

(declare-fun res!86910 () Bool)

(assert (=> d!54657 (=> (not res!86910) (not e!120924))))

(assert (=> d!54657 (= res!86910 (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun e!120928 () ListLongMap!2299)

(assert (=> d!54657 (= lt!90725 e!120928)))

(declare-fun c!32934 () Bool)

(assert (=> d!54657 (= c!32934 (and (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54657 (validMask!0 (mask!8823 thiss!1248))))

(assert (=> d!54657 (= (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) lt!90717)))

(declare-fun b!183697 () Bool)

(assert (=> b!183697 (= e!120926 call!18538)))

(declare-fun bm!18531 () Bool)

(declare-fun call!18535 () ListLongMap!2299)

(assert (=> bm!18531 (= call!18535 call!18536)))

(declare-fun bm!18532 () Bool)

(assert (=> bm!18532 (= call!18532 (contains!1259 lt!90717 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183698 () Bool)

(assert (=> b!183698 (= e!120924 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183699 () Bool)

(declare-fun get!2108 (ValueCell!1808 V!5385) V!5385)

(declare-fun dynLambda!494 (Int (_ BitVec 64)) V!5385)

(assert (=> b!183699 (= e!120929 (= (apply!160 lt!90717 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)) (get!2108 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3991 (_values!3737 thiss!1248))))))

(assert (=> b!183699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun bm!18533 () Bool)

(assert (=> bm!18533 (= call!18537 (contains!1259 lt!90717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183700 () Bool)

(assert (=> b!183700 (= e!120923 call!18538)))

(declare-fun b!183701 () Bool)

(assert (=> b!183701 (= e!120932 e!120925)))

(declare-fun c!32936 () Bool)

(assert (=> b!183701 (= c!32936 (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!32932 () Bool)

(declare-fun bm!18534 () Bool)

(assert (=> bm!18534 (= call!18534 (+!277 (ite c!32934 call!18533 (ite c!32932 call!18536 call!18535)) (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(declare-fun b!183702 () Bool)

(declare-fun e!120920 () Bool)

(assert (=> b!183702 (= e!120930 e!120920)))

(declare-fun res!86906 () Bool)

(assert (=> b!183702 (= res!86906 call!18537)))

(assert (=> b!183702 (=> (not res!86906) (not e!120920))))

(declare-fun b!183703 () Bool)

(assert (=> b!183703 (= e!120920 (= (apply!160 lt!90717 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3595 thiss!1248)))))

(declare-fun b!183704 () Bool)

(declare-fun res!86912 () Bool)

(assert (=> b!183704 (=> (not res!86912) (not e!120932))))

(assert (=> b!183704 (= res!86912 e!120930)))

(declare-fun c!32933 () Bool)

(assert (=> b!183704 (= c!32933 (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183705 () Bool)

(assert (=> b!183705 (= e!120928 e!120923)))

(assert (=> b!183705 (= c!32932 (and (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183706 () Bool)

(assert (=> b!183706 (= e!120926 call!18535)))

(declare-fun b!183707 () Bool)

(declare-fun res!86907 () Bool)

(assert (=> b!183707 (=> (not res!86907) (not e!120932))))

(assert (=> b!183707 (= res!86907 e!120921)))

(declare-fun res!86913 () Bool)

(assert (=> b!183707 (=> res!86913 e!120921)))

(assert (=> b!183707 (= res!86913 (not e!120931))))

(declare-fun res!86905 () Bool)

(assert (=> b!183707 (=> (not res!86905) (not e!120931))))

(assert (=> b!183707 (= res!86905 (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun b!183708 () Bool)

(assert (=> b!183708 (= e!120922 (= (apply!160 lt!90717 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3595 thiss!1248)))))

(declare-fun b!183709 () Bool)

(assert (=> b!183709 (= e!120925 (not call!18532))))

(declare-fun bm!18535 () Bool)

(assert (=> bm!18535 (= call!18533 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun b!183710 () Bool)

(assert (=> b!183710 (= e!120928 (+!277 call!18534 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))

(assert (= (and d!54657 c!32934) b!183710))

(assert (= (and d!54657 (not c!32934)) b!183705))

(assert (= (and b!183705 c!32932) b!183700))

(assert (= (and b!183705 (not c!32932)) b!183696))

(assert (= (and b!183696 c!32935) b!183697))

(assert (= (and b!183696 (not c!32935)) b!183706))

(assert (= (or b!183697 b!183706) bm!18531))

(assert (= (or b!183700 bm!18531) bm!18529))

(assert (= (or b!183700 b!183697) bm!18530))

(assert (= (or b!183710 bm!18529) bm!18535))

(assert (= (or b!183710 bm!18530) bm!18534))

(assert (= (and d!54657 res!86910) b!183698))

(assert (= (and d!54657 c!32931) b!183695))

(assert (= (and d!54657 (not c!32931)) b!183692))

(assert (= (and d!54657 res!86908) b!183707))

(assert (= (and b!183707 res!86905) b!183691))

(assert (= (and b!183707 (not res!86913)) b!183690))

(assert (= (and b!183690 res!86909) b!183699))

(assert (= (and b!183707 res!86907) b!183704))

(assert (= (and b!183704 c!32933) b!183702))

(assert (= (and b!183704 (not c!32933)) b!183694))

(assert (= (and b!183702 res!86906) b!183703))

(assert (= (or b!183702 b!183694) bm!18533))

(assert (= (and b!183704 res!86912) b!183701))

(assert (= (and b!183701 c!32936) b!183693))

(assert (= (and b!183701 (not c!32936)) b!183709))

(assert (= (and b!183693 res!86911) b!183708))

(assert (= (or b!183693 b!183709) bm!18532))

(declare-fun b_lambda!7185 () Bool)

(assert (=> (not b_lambda!7185) (not b!183699)))

(declare-fun t!7195 () Bool)

(declare-fun tb!2823 () Bool)

(assert (=> (and b!183554 (= (defaultEntry!3754 thiss!1248) (defaultEntry!3754 thiss!1248)) t!7195) tb!2823))

(declare-fun result!4763 () Bool)

(assert (=> tb!2823 (= result!4763 tp_is_empty!4303)))

(assert (=> b!183699 t!7195))

(declare-fun b_and!11087 () Bool)

(assert (= b_and!11081 (and (=> t!7195 result!4763) b_and!11087)))

(declare-fun m!210649 () Bool)

(assert (=> b!183699 m!210649))

(declare-fun m!210651 () Bool)

(assert (=> b!183699 m!210651))

(declare-fun m!210653 () Bool)

(assert (=> b!183699 m!210653))

(declare-fun m!210655 () Bool)

(assert (=> b!183699 m!210655))

(declare-fun m!210657 () Bool)

(assert (=> b!183699 m!210657))

(assert (=> b!183699 m!210649))

(assert (=> b!183699 m!210653))

(assert (=> b!183699 m!210655))

(assert (=> b!183691 m!210649))

(assert (=> b!183691 m!210649))

(declare-fun m!210659 () Bool)

(assert (=> b!183691 m!210659))

(declare-fun m!210661 () Bool)

(assert (=> b!183710 m!210661))

(assert (=> d!54657 m!210585))

(declare-fun m!210663 () Bool)

(assert (=> bm!18534 m!210663))

(declare-fun m!210665 () Bool)

(assert (=> b!183708 m!210665))

(declare-fun m!210667 () Bool)

(assert (=> bm!18533 m!210667))

(assert (=> b!183698 m!210649))

(assert (=> b!183698 m!210649))

(assert (=> b!183698 m!210659))

(declare-fun m!210669 () Bool)

(assert (=> b!183703 m!210669))

(assert (=> b!183690 m!210649))

(assert (=> b!183690 m!210649))

(declare-fun m!210671 () Bool)

(assert (=> b!183690 m!210671))

(declare-fun m!210673 () Bool)

(assert (=> bm!18535 m!210673))

(declare-fun m!210675 () Bool)

(assert (=> b!183695 m!210675))

(declare-fun m!210677 () Bool)

(assert (=> b!183695 m!210677))

(declare-fun m!210679 () Bool)

(assert (=> b!183695 m!210679))

(declare-fun m!210681 () Bool)

(assert (=> b!183695 m!210681))

(assert (=> b!183695 m!210675))

(declare-fun m!210683 () Bool)

(assert (=> b!183695 m!210683))

(declare-fun m!210685 () Bool)

(assert (=> b!183695 m!210685))

(assert (=> b!183695 m!210681))

(declare-fun m!210687 () Bool)

(assert (=> b!183695 m!210687))

(assert (=> b!183695 m!210649))

(declare-fun m!210689 () Bool)

(assert (=> b!183695 m!210689))

(declare-fun m!210691 () Bool)

(assert (=> b!183695 m!210691))

(assert (=> b!183695 m!210689))

(declare-fun m!210693 () Bool)

(assert (=> b!183695 m!210693))

(declare-fun m!210695 () Bool)

(assert (=> b!183695 m!210695))

(declare-fun m!210697 () Bool)

(assert (=> b!183695 m!210697))

(declare-fun m!210699 () Bool)

(assert (=> b!183695 m!210699))

(assert (=> b!183695 m!210673))

(declare-fun m!210701 () Bool)

(assert (=> b!183695 m!210701))

(assert (=> b!183695 m!210683))

(declare-fun m!210703 () Bool)

(assert (=> b!183695 m!210703))

(declare-fun m!210705 () Bool)

(assert (=> bm!18532 m!210705))

(assert (=> b!183552 d!54657))

(declare-fun mapNonEmpty!7401 () Bool)

(declare-fun mapRes!7401 () Bool)

(declare-fun tp!16383 () Bool)

(declare-fun e!120937 () Bool)

(assert (=> mapNonEmpty!7401 (= mapRes!7401 (and tp!16383 e!120937))))

(declare-fun mapRest!7401 () (Array (_ BitVec 32) ValueCell!1808))

(declare-fun mapValue!7401 () ValueCell!1808)

(declare-fun mapKey!7401 () (_ BitVec 32))

(assert (=> mapNonEmpty!7401 (= mapRest!7392 (store mapRest!7401 mapKey!7401 mapValue!7401))))

(declare-fun condMapEmpty!7401 () Bool)

(declare-fun mapDefault!7401 () ValueCell!1808)

(assert (=> mapNonEmpty!7392 (= condMapEmpty!7401 (= mapRest!7392 ((as const (Array (_ BitVec 32) ValueCell!1808)) mapDefault!7401)))))

(declare-fun e!120938 () Bool)

(assert (=> mapNonEmpty!7392 (= tp!16368 (and e!120938 mapRes!7401))))

(declare-fun mapIsEmpty!7401 () Bool)

(assert (=> mapIsEmpty!7401 mapRes!7401))

(declare-fun b!183720 () Bool)

(assert (=> b!183720 (= e!120938 tp_is_empty!4303)))

(declare-fun b!183719 () Bool)

(assert (=> b!183719 (= e!120937 tp_is_empty!4303)))

(assert (= (and mapNonEmpty!7392 condMapEmpty!7401) mapIsEmpty!7401))

(assert (= (and mapNonEmpty!7392 (not condMapEmpty!7401)) mapNonEmpty!7401))

(assert (= (and mapNonEmpty!7401 ((_ is ValueCellFull!1808) mapValue!7401)) b!183719))

(assert (= (and mapNonEmpty!7392 ((_ is ValueCellFull!1808) mapDefault!7401)) b!183720))

(declare-fun m!210707 () Bool)

(assert (=> mapNonEmpty!7401 m!210707))

(declare-fun b_lambda!7187 () Bool)

(assert (= b_lambda!7185 (or (and b!183554 b_free!4531) b_lambda!7187)))

(check-sat (not bm!18535) (not bm!18533) (not b!183703) (not b!183690) (not d!54655) (not b!183695) (not b!183638) tp_is_empty!4303 (not b!183699) (not b!183710) (not bm!18534) (not d!54647) (not b_lambda!7187) (not b!183698) (not mapNonEmpty!7401) (not b!183645) (not b!183708) b_and!11087 (not b!183636) (not d!54657) (not bm!18532) (not b!183637) (not b!183691) (not d!54653) (not b!183626) (not b!183647) (not b_next!4531))
(check-sat b_and!11087 (not b_next!4531))
(get-model)

(declare-fun d!54659 () Bool)

(declare-fun get!2109 (Option!221) V!5385)

(assert (=> d!54659 (= (apply!160 lt!90717 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)) (get!2109 (getValueByKey!215 (toList!1165 lt!90717) (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7443 () Bool)

(assert (= bs!7443 d!54659))

(assert (=> bs!7443 m!210649))

(declare-fun m!210709 () Bool)

(assert (=> bs!7443 m!210709))

(assert (=> bs!7443 m!210709))

(declare-fun m!210711 () Bool)

(assert (=> bs!7443 m!210711))

(assert (=> b!183699 d!54659))

(declare-fun d!54661 () Bool)

(declare-fun c!32939 () Bool)

(assert (=> d!54661 (= c!32939 ((_ is ValueCellFull!1808) (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120941 () V!5385)

(assert (=> d!54661 (= (get!2108 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!120941)))

(declare-fun b!183725 () Bool)

(declare-fun get!2110 (ValueCell!1808 V!5385) V!5385)

(assert (=> b!183725 (= e!120941 (get!2110 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183726 () Bool)

(declare-fun get!2111 (ValueCell!1808 V!5385) V!5385)

(assert (=> b!183726 (= e!120941 (get!2111 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54661 c!32939) b!183725))

(assert (= (and d!54661 (not c!32939)) b!183726))

(assert (=> b!183725 m!210653))

(assert (=> b!183725 m!210655))

(declare-fun m!210713 () Bool)

(assert (=> b!183725 m!210713))

(assert (=> b!183726 m!210653))

(assert (=> b!183726 m!210655))

(declare-fun m!210715 () Bool)

(assert (=> b!183726 m!210715))

(assert (=> b!183699 d!54661))

(declare-fun d!54663 () Bool)

(declare-fun lt!90740 () (_ BitVec 32))

(assert (=> d!54663 (and (bvsge lt!90740 #b00000000000000000000000000000000) (bvsle lt!90740 (bvsub (size!3990 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120947 () (_ BitVec 32))

(assert (=> d!54663 (= lt!90740 e!120947)))

(declare-fun c!32945 () Bool)

(assert (=> d!54663 (= c!32945 (bvsge #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> d!54663 (and (bvsle #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3990 (_keys!5675 thiss!1248)) (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> d!54663 (= (arrayCountValidKeys!0 (_keys!5675 thiss!1248) #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))) lt!90740)))

(declare-fun bm!18538 () Bool)

(declare-fun call!18541 () (_ BitVec 32))

(assert (=> bm!18538 (= call!18541 (arrayCountValidKeys!0 (_keys!5675 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun b!183735 () Bool)

(declare-fun e!120946 () (_ BitVec 32))

(assert (=> b!183735 (= e!120947 e!120946)))

(declare-fun c!32944 () Bool)

(assert (=> b!183735 (= c!32944 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183736 () Bool)

(assert (=> b!183736 (= e!120946 (bvadd #b00000000000000000000000000000001 call!18541))))

(declare-fun b!183737 () Bool)

(assert (=> b!183737 (= e!120947 #b00000000000000000000000000000000)))

(declare-fun b!183738 () Bool)

(assert (=> b!183738 (= e!120946 call!18541)))

(assert (= (and d!54663 c!32945) b!183737))

(assert (= (and d!54663 (not c!32945)) b!183735))

(assert (= (and b!183735 c!32944) b!183736))

(assert (= (and b!183735 (not c!32944)) b!183738))

(assert (= (or b!183736 b!183738) bm!18538))

(declare-fun m!210717 () Bool)

(assert (=> bm!18538 m!210717))

(assert (=> b!183735 m!210649))

(assert (=> b!183735 m!210649))

(assert (=> b!183735 m!210659))

(assert (=> b!183636 d!54663))

(declare-fun d!54665 () Bool)

(assert (=> d!54665 (= (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183698 d!54665))

(assert (=> b!183691 d!54665))

(declare-fun b!183749 () Bool)

(declare-fun res!86925 () Bool)

(declare-fun e!120950 () Bool)

(assert (=> b!183749 (=> (not res!86925) (not e!120950))))

(declare-fun size!3996 (LongMapFixedSize!2524) (_ BitVec 32))

(assert (=> b!183749 (= res!86925 (= (size!3996 thiss!1248) (bvadd (_size!1311 thiss!1248) (bvsdiv (bvadd (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!183750 () Bool)

(assert (=> b!183750 (= e!120950 (and (bvsge (extraKeys!3491 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3491 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1311 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!183747 () Bool)

(declare-fun res!86924 () Bool)

(assert (=> b!183747 (=> (not res!86924) (not e!120950))))

(assert (=> b!183747 (= res!86924 (and (= (size!3991 (_values!3737 thiss!1248)) (bvadd (mask!8823 thiss!1248) #b00000000000000000000000000000001)) (= (size!3990 (_keys!5675 thiss!1248)) (size!3991 (_values!3737 thiss!1248))) (bvsge (_size!1311 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1311 thiss!1248) (bvadd (mask!8823 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!54667 () Bool)

(declare-fun res!86922 () Bool)

(assert (=> d!54667 (=> (not res!86922) (not e!120950))))

(assert (=> d!54667 (= res!86922 (validMask!0 (mask!8823 thiss!1248)))))

(assert (=> d!54667 (= (simpleValid!176 thiss!1248) e!120950)))

(declare-fun b!183748 () Bool)

(declare-fun res!86923 () Bool)

(assert (=> b!183748 (=> (not res!86923) (not e!120950))))

(assert (=> b!183748 (= res!86923 (bvsge (size!3996 thiss!1248) (_size!1311 thiss!1248)))))

(assert (= (and d!54667 res!86922) b!183747))

(assert (= (and b!183747 res!86924) b!183748))

(assert (= (and b!183748 res!86923) b!183749))

(assert (= (and b!183749 res!86925) b!183750))

(declare-fun m!210719 () Bool)

(assert (=> b!183749 m!210719))

(assert (=> d!54667 m!210585))

(assert (=> b!183748 m!210719))

(assert (=> d!54653 d!54667))

(declare-fun d!54669 () Bool)

(declare-fun e!120952 () Bool)

(assert (=> d!54669 e!120952))

(declare-fun res!86926 () Bool)

(assert (=> d!54669 (=> res!86926 e!120952)))

(declare-fun lt!90744 () Bool)

(assert (=> d!54669 (= res!86926 (not lt!90744))))

(declare-fun lt!90741 () Bool)

(assert (=> d!54669 (= lt!90744 lt!90741)))

(declare-fun lt!90742 () Unit!5527)

(declare-fun e!120951 () Unit!5527)

(assert (=> d!54669 (= lt!90742 e!120951)))

(declare-fun c!32946 () Bool)

(assert (=> d!54669 (= c!32946 lt!90741)))

(assert (=> d!54669 (= lt!90741 (containsKey!219 (toList!1165 lt!90717) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54669 (= (contains!1259 lt!90717 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90744)))

(declare-fun b!183751 () Bool)

(declare-fun lt!90743 () Unit!5527)

(assert (=> b!183751 (= e!120951 lt!90743)))

(assert (=> b!183751 (= lt!90743 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1165 lt!90717) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183751 (isDefined!169 (getValueByKey!215 (toList!1165 lt!90717) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183752 () Bool)

(declare-fun Unit!5531 () Unit!5527)

(assert (=> b!183752 (= e!120951 Unit!5531)))

(declare-fun b!183753 () Bool)

(assert (=> b!183753 (= e!120952 (isDefined!169 (getValueByKey!215 (toList!1165 lt!90717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54669 c!32946) b!183751))

(assert (= (and d!54669 (not c!32946)) b!183752))

(assert (= (and d!54669 (not res!86926)) b!183753))

(declare-fun m!210721 () Bool)

(assert (=> d!54669 m!210721))

(declare-fun m!210723 () Bool)

(assert (=> b!183751 m!210723))

(declare-fun m!210725 () Bool)

(assert (=> b!183751 m!210725))

(assert (=> b!183751 m!210725))

(declare-fun m!210727 () Bool)

(assert (=> b!183751 m!210727))

(assert (=> b!183753 m!210725))

(assert (=> b!183753 m!210725))

(assert (=> b!183753 m!210727))

(assert (=> bm!18532 d!54669))

(declare-fun d!54671 () Bool)

(declare-fun e!120954 () Bool)

(assert (=> d!54671 e!120954))

(declare-fun res!86927 () Bool)

(assert (=> d!54671 (=> res!86927 e!120954)))

(declare-fun lt!90748 () Bool)

(assert (=> d!54671 (= res!86927 (not lt!90748))))

(declare-fun lt!90745 () Bool)

(assert (=> d!54671 (= lt!90748 lt!90745)))

(declare-fun lt!90746 () Unit!5527)

(declare-fun e!120953 () Unit!5527)

(assert (=> d!54671 (= lt!90746 e!120953)))

(declare-fun c!32947 () Bool)

(assert (=> d!54671 (= c!32947 lt!90745)))

(assert (=> d!54671 (= lt!90745 (containsKey!219 (toList!1165 lt!90717) (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54671 (= (contains!1259 lt!90717 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)) lt!90748)))

(declare-fun b!183754 () Bool)

(declare-fun lt!90747 () Unit!5527)

(assert (=> b!183754 (= e!120953 lt!90747)))

(assert (=> b!183754 (= lt!90747 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1165 lt!90717) (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183754 (isDefined!169 (getValueByKey!215 (toList!1165 lt!90717) (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183755 () Bool)

(declare-fun Unit!5532 () Unit!5527)

(assert (=> b!183755 (= e!120953 Unit!5532)))

(declare-fun b!183756 () Bool)

(assert (=> b!183756 (= e!120954 (isDefined!169 (getValueByKey!215 (toList!1165 lt!90717) (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54671 c!32947) b!183754))

(assert (= (and d!54671 (not c!32947)) b!183755))

(assert (= (and d!54671 (not res!86927)) b!183756))

(assert (=> d!54671 m!210649))

(declare-fun m!210729 () Bool)

(assert (=> d!54671 m!210729))

(assert (=> b!183754 m!210649))

(declare-fun m!210731 () Bool)

(assert (=> b!183754 m!210731))

(assert (=> b!183754 m!210649))

(assert (=> b!183754 m!210709))

(assert (=> b!183754 m!210709))

(declare-fun m!210733 () Bool)

(assert (=> b!183754 m!210733))

(assert (=> b!183756 m!210649))

(assert (=> b!183756 m!210709))

(assert (=> b!183756 m!210709))

(assert (=> b!183756 m!210733))

(assert (=> b!183690 d!54671))

(declare-fun d!54673 () Bool)

(assert (=> d!54673 (= (apply!160 lt!90717 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2109 (getValueByKey!215 (toList!1165 lt!90717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7444 () Bool)

(assert (= bs!7444 d!54673))

(declare-fun m!210735 () Bool)

(assert (=> bs!7444 m!210735))

(assert (=> bs!7444 m!210735))

(declare-fun m!210737 () Bool)

(assert (=> bs!7444 m!210737))

(assert (=> b!183703 d!54673))

(declare-fun d!54675 () Bool)

(declare-fun isEmpty!469 (Option!221) Bool)

(assert (=> d!54675 (= (isDefined!169 (getValueByKey!215 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828)) (not (isEmpty!469 (getValueByKey!215 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))))

(declare-fun bs!7445 () Bool)

(assert (= bs!7445 d!54675))

(assert (=> bs!7445 m!210645))

(declare-fun m!210739 () Bool)

(assert (=> bs!7445 m!210739))

(assert (=> b!183647 d!54675))

(declare-fun b!183768 () Bool)

(declare-fun e!120960 () Option!221)

(assert (=> b!183768 (= e!120960 None!219)))

(declare-fun b!183767 () Bool)

(assert (=> b!183767 (= e!120960 (getValueByKey!215 (t!7192 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) key!828))))

(declare-fun b!183765 () Bool)

(declare-fun e!120959 () Option!221)

(assert (=> b!183765 (= e!120959 (Some!220 (_2!1706 (h!2957 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))))))

(declare-fun d!54677 () Bool)

(declare-fun c!32952 () Bool)

(assert (=> d!54677 (= c!32952 (and ((_ is Cons!2327) (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (= (_1!1706 (h!2957 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)))))

(assert (=> d!54677 (= (getValueByKey!215 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828) e!120959)))

(declare-fun b!183766 () Bool)

(assert (=> b!183766 (= e!120959 e!120960)))

(declare-fun c!32953 () Bool)

(assert (=> b!183766 (= c!32953 (and ((_ is Cons!2327) (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (not (= (_1!1706 (h!2957 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828))))))

(assert (= (and d!54677 c!32952) b!183765))

(assert (= (and d!54677 (not c!32952)) b!183766))

(assert (= (and b!183766 c!32953) b!183767))

(assert (= (and b!183766 (not c!32953)) b!183768))

(declare-fun m!210741 () Bool)

(assert (=> b!183767 m!210741))

(assert (=> b!183647 d!54677))

(assert (=> d!54657 d!54645))

(declare-fun d!54679 () Bool)

(declare-fun e!120971 () Bool)

(assert (=> d!54679 e!120971))

(declare-fun c!32960 () Bool)

(declare-fun lt!90754 () SeekEntryResult!624)

(assert (=> d!54679 (= c!32960 (and ((_ is Intermediate!624) lt!90754) (undefined!1436 lt!90754)))))

(declare-fun e!120974 () SeekEntryResult!624)

(assert (=> d!54679 (= lt!90754 e!120974)))

(declare-fun c!32962 () Bool)

(assert (=> d!54679 (= c!32962 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!90753 () (_ BitVec 64))

(assert (=> d!54679 (= lt!90753 (select (arr!3676 (_keys!5675 thiss!1248)) (toIndex!0 key!828 (mask!8823 thiss!1248))))))

(assert (=> d!54679 (validMask!0 (mask!8823 thiss!1248))))

(assert (=> d!54679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8823 thiss!1248)) key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)) lt!90754)))

(declare-fun b!183787 () Bool)

(declare-fun e!120973 () Bool)

(assert (=> b!183787 (= e!120971 e!120973)))

(declare-fun res!86934 () Bool)

(assert (=> b!183787 (= res!86934 (and ((_ is Intermediate!624) lt!90754) (not (undefined!1436 lt!90754)) (bvslt (x!20003 lt!90754) #b01111111111111111111111111111110) (bvsge (x!20003 lt!90754) #b00000000000000000000000000000000) (bvsge (x!20003 lt!90754) #b00000000000000000000000000000000)))))

(assert (=> b!183787 (=> (not res!86934) (not e!120973))))

(declare-fun b!183788 () Bool)

(assert (=> b!183788 (and (bvsge (index!4668 lt!90754) #b00000000000000000000000000000000) (bvslt (index!4668 lt!90754) (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun res!86935 () Bool)

(assert (=> b!183788 (= res!86935 (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4668 lt!90754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120972 () Bool)

(assert (=> b!183788 (=> res!86935 e!120972)))

(declare-fun b!183789 () Bool)

(assert (=> b!183789 (and (bvsge (index!4668 lt!90754) #b00000000000000000000000000000000) (bvslt (index!4668 lt!90754) (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun res!86936 () Bool)

(assert (=> b!183789 (= res!86936 (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4668 lt!90754)) key!828))))

(assert (=> b!183789 (=> res!86936 e!120972)))

(assert (=> b!183789 (= e!120973 e!120972)))

(declare-fun b!183790 () Bool)

(assert (=> b!183790 (and (bvsge (index!4668 lt!90754) #b00000000000000000000000000000000) (bvslt (index!4668 lt!90754) (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> b!183790 (= e!120972 (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4668 lt!90754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183791 () Bool)

(assert (=> b!183791 (= e!120974 (Intermediate!624 true (toIndex!0 key!828 (mask!8823 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183792 () Bool)

(declare-fun e!120975 () SeekEntryResult!624)

(assert (=> b!183792 (= e!120975 (Intermediate!624 false (toIndex!0 key!828 (mask!8823 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183793 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183793 (= e!120975 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8823 thiss!1248)) #b00000000000000000000000000000000 (mask!8823 thiss!1248)) key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(declare-fun b!183794 () Bool)

(assert (=> b!183794 (= e!120974 e!120975)))

(declare-fun c!32961 () Bool)

(assert (=> b!183794 (= c!32961 (or (= lt!90753 key!828) (= (bvadd lt!90753 lt!90753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183795 () Bool)

(assert (=> b!183795 (= e!120971 (bvsge (x!20003 lt!90754) #b01111111111111111111111111111110))))

(assert (= (and d!54679 c!32962) b!183791))

(assert (= (and d!54679 (not c!32962)) b!183794))

(assert (= (and b!183794 c!32961) b!183792))

(assert (= (and b!183794 (not c!32961)) b!183793))

(assert (= (and d!54679 c!32960) b!183795))

(assert (= (and d!54679 (not c!32960)) b!183787))

(assert (= (and b!183787 res!86934) b!183789))

(assert (= (and b!183789 (not res!86936)) b!183788))

(assert (= (and b!183788 (not res!86935)) b!183790))

(assert (=> b!183793 m!210621))

(declare-fun m!210743 () Bool)

(assert (=> b!183793 m!210743))

(assert (=> b!183793 m!210743))

(declare-fun m!210745 () Bool)

(assert (=> b!183793 m!210745))

(assert (=> d!54679 m!210621))

(declare-fun m!210747 () Bool)

(assert (=> d!54679 m!210747))

(assert (=> d!54679 m!210585))

(declare-fun m!210749 () Bool)

(assert (=> b!183789 m!210749))

(assert (=> b!183790 m!210749))

(assert (=> b!183788 m!210749))

(assert (=> d!54647 d!54679))

(declare-fun d!54681 () Bool)

(declare-fun lt!90760 () (_ BitVec 32))

(declare-fun lt!90759 () (_ BitVec 32))

(assert (=> d!54681 (= lt!90760 (bvmul (bvxor lt!90759 (bvlshr lt!90759 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54681 (= lt!90759 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54681 (and (bvsge (mask!8823 thiss!1248) #b00000000000000000000000000000000) (let ((res!86937 (let ((h!2960 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20019 (bvmul (bvxor h!2960 (bvlshr h!2960 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20019 (bvlshr x!20019 #b00000000000000000000000000001101)) (mask!8823 thiss!1248)))))) (and (bvslt res!86937 (bvadd (mask!8823 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86937 #b00000000000000000000000000000000))))))

(assert (=> d!54681 (= (toIndex!0 key!828 (mask!8823 thiss!1248)) (bvand (bvxor lt!90760 (bvlshr lt!90760 #b00000000000000000000000000001101)) (mask!8823 thiss!1248)))))

(assert (=> d!54647 d!54681))

(assert (=> d!54647 d!54645))

(declare-fun d!54683 () Bool)

(declare-fun e!120978 () Bool)

(assert (=> d!54683 e!120978))

(declare-fun res!86943 () Bool)

(assert (=> d!54683 (=> (not res!86943) (not e!120978))))

(declare-fun lt!90770 () ListLongMap!2299)

(assert (=> d!54683 (= res!86943 (contains!1259 lt!90770 (_1!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun lt!90771 () List!2331)

(assert (=> d!54683 (= lt!90770 (ListLongMap!2300 lt!90771))))

(declare-fun lt!90772 () Unit!5527)

(declare-fun lt!90769 () Unit!5527)

(assert (=> d!54683 (= lt!90772 lt!90769)))

(assert (=> d!54683 (= (getValueByKey!215 lt!90771 (_1!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))) (Some!220 (_2!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!115 (List!2331 (_ BitVec 64) V!5385) Unit!5527)

(assert (=> d!54683 (= lt!90769 (lemmaContainsTupThenGetReturnValue!115 lt!90771 (_1!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (_2!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun insertStrictlySorted!118 (List!2331 (_ BitVec 64) V!5385) List!2331)

(assert (=> d!54683 (= lt!90771 (insertStrictlySorted!118 (toList!1165 (ite c!32934 call!18533 (ite c!32932 call!18536 call!18535))) (_1!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (_2!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(assert (=> d!54683 (= (+!277 (ite c!32934 call!18533 (ite c!32932 call!18536 call!18535)) (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) lt!90770)))

(declare-fun b!183800 () Bool)

(declare-fun res!86942 () Bool)

(assert (=> b!183800 (=> (not res!86942) (not e!120978))))

(assert (=> b!183800 (= res!86942 (= (getValueByKey!215 (toList!1165 lt!90770) (_1!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))) (Some!220 (_2!1706 (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))))

(declare-fun b!183801 () Bool)

(declare-fun contains!1261 (List!2331 tuple2!3390) Bool)

(assert (=> b!183801 (= e!120978 (contains!1261 (toList!1165 lt!90770) (ite (or c!32934 c!32932) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (= (and d!54683 res!86943) b!183800))

(assert (= (and b!183800 res!86942) b!183801))

(declare-fun m!210751 () Bool)

(assert (=> d!54683 m!210751))

(declare-fun m!210753 () Bool)

(assert (=> d!54683 m!210753))

(declare-fun m!210755 () Bool)

(assert (=> d!54683 m!210755))

(declare-fun m!210757 () Bool)

(assert (=> d!54683 m!210757))

(declare-fun m!210759 () Bool)

(assert (=> b!183800 m!210759))

(declare-fun m!210761 () Bool)

(assert (=> b!183801 m!210761))

(assert (=> bm!18534 d!54683))

(declare-fun d!54685 () Bool)

(declare-fun e!120979 () Bool)

(assert (=> d!54685 e!120979))

(declare-fun res!86945 () Bool)

(assert (=> d!54685 (=> (not res!86945) (not e!120979))))

(declare-fun lt!90774 () ListLongMap!2299)

(assert (=> d!54685 (= res!86945 (contains!1259 lt!90774 (_1!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))))))

(declare-fun lt!90775 () List!2331)

(assert (=> d!54685 (= lt!90774 (ListLongMap!2300 lt!90775))))

(declare-fun lt!90776 () Unit!5527)

(declare-fun lt!90773 () Unit!5527)

(assert (=> d!54685 (= lt!90776 lt!90773)))

(assert (=> d!54685 (= (getValueByKey!215 lt!90775 (_1!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54685 (= lt!90773 (lemmaContainsTupThenGetReturnValue!115 lt!90775 (_1!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54685 (= lt!90775 (insertStrictlySorted!118 (toList!1165 lt!90724) (_1!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54685 (= (+!277 lt!90724 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))) lt!90774)))

(declare-fun b!183802 () Bool)

(declare-fun res!86944 () Bool)

(assert (=> b!183802 (=> (not res!86944) (not e!120979))))

(assert (=> b!183802 (= res!86944 (= (getValueByKey!215 (toList!1165 lt!90774) (_1!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))))))))

(declare-fun b!183803 () Bool)

(assert (=> b!183803 (= e!120979 (contains!1261 (toList!1165 lt!90774) (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))))))

(assert (= (and d!54685 res!86945) b!183802))

(assert (= (and b!183802 res!86944) b!183803))

(declare-fun m!210763 () Bool)

(assert (=> d!54685 m!210763))

(declare-fun m!210765 () Bool)

(assert (=> d!54685 m!210765))

(declare-fun m!210767 () Bool)

(assert (=> d!54685 m!210767))

(declare-fun m!210769 () Bool)

(assert (=> d!54685 m!210769))

(declare-fun m!210771 () Bool)

(assert (=> b!183802 m!210771))

(declare-fun m!210773 () Bool)

(assert (=> b!183803 m!210773))

(assert (=> b!183695 d!54685))

(declare-fun b!183828 () Bool)

(declare-fun e!120998 () Bool)

(declare-fun lt!90793 () ListLongMap!2299)

(assert (=> b!183828 (= e!120998 (= lt!90793 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3754 thiss!1248))))))

(declare-fun b!183829 () Bool)

(declare-fun e!120995 () ListLongMap!2299)

(declare-fun e!121000 () ListLongMap!2299)

(assert (=> b!183829 (= e!120995 e!121000)))

(declare-fun c!32971 () Bool)

(assert (=> b!183829 (= c!32971 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183830 () Bool)

(declare-fun lt!90796 () Unit!5527)

(declare-fun lt!90795 () Unit!5527)

(assert (=> b!183830 (= lt!90796 lt!90795)))

(declare-fun lt!90794 () (_ BitVec 64))

(declare-fun lt!90797 () V!5385)

(declare-fun lt!90792 () (_ BitVec 64))

(declare-fun lt!90791 () ListLongMap!2299)

(assert (=> b!183830 (not (contains!1259 (+!277 lt!90791 (tuple2!3391 lt!90794 lt!90797)) lt!90792))))

(declare-fun addStillNotContains!87 (ListLongMap!2299 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5527)

(assert (=> b!183830 (= lt!90795 (addStillNotContains!87 lt!90791 lt!90794 lt!90797 lt!90792))))

(assert (=> b!183830 (= lt!90792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!183830 (= lt!90797 (get!2108 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183830 (= lt!90794 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18544 () ListLongMap!2299)

(assert (=> b!183830 (= lt!90791 call!18544)))

(assert (=> b!183830 (= e!121000 (+!277 call!18544 (tuple2!3391 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000) (get!2108 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!183831 () Bool)

(declare-fun res!86955 () Bool)

(declare-fun e!120996 () Bool)

(assert (=> b!183831 (=> (not res!86955) (not e!120996))))

(assert (=> b!183831 (= res!86955 (not (contains!1259 lt!90793 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183832 () Bool)

(assert (=> b!183832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> b!183832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3991 (_values!3737 thiss!1248))))))

(declare-fun e!120997 () Bool)

(assert (=> b!183832 (= e!120997 (= (apply!160 lt!90793 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)) (get!2108 (select (arr!3677 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!183833 () Bool)

(assert (=> b!183833 (= e!121000 call!18544)))

(declare-fun b!183834 () Bool)

(declare-fun e!120999 () Bool)

(assert (=> b!183834 (= e!120999 e!120998)))

(declare-fun c!32972 () Bool)

(assert (=> b!183834 (= c!32972 (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun d!54687 () Bool)

(assert (=> d!54687 e!120996))

(declare-fun res!86957 () Bool)

(assert (=> d!54687 (=> (not res!86957) (not e!120996))))

(assert (=> d!54687 (= res!86957 (not (contains!1259 lt!90793 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54687 (= lt!90793 e!120995)))

(declare-fun c!32974 () Bool)

(assert (=> d!54687 (= c!32974 (bvsge #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> d!54687 (validMask!0 (mask!8823 thiss!1248))))

(assert (=> d!54687 (= (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) lt!90793)))

(declare-fun b!183835 () Bool)

(declare-fun isEmpty!470 (ListLongMap!2299) Bool)

(assert (=> b!183835 (= e!120998 (isEmpty!470 lt!90793))))

(declare-fun b!183836 () Bool)

(declare-fun e!120994 () Bool)

(assert (=> b!183836 (= e!120994 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183836 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!18541 () Bool)

(assert (=> bm!18541 (= call!18544 (getCurrentListMapNoExtraKeys!181 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3754 thiss!1248)))))

(declare-fun b!183837 () Bool)

(assert (=> b!183837 (= e!120999 e!120997)))

(assert (=> b!183837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(declare-fun res!86956 () Bool)

(assert (=> b!183837 (= res!86956 (contains!1259 lt!90793 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183837 (=> (not res!86956) (not e!120997))))

(declare-fun b!183838 () Bool)

(assert (=> b!183838 (= e!120995 (ListLongMap!2300 Nil!2328))))

(declare-fun b!183839 () Bool)

(assert (=> b!183839 (= e!120996 e!120999)))

(declare-fun c!32973 () Bool)

(assert (=> b!183839 (= c!32973 e!120994)))

(declare-fun res!86954 () Bool)

(assert (=> b!183839 (=> (not res!86954) (not e!120994))))

(assert (=> b!183839 (= res!86954 (bvslt #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(assert (= (and d!54687 c!32974) b!183838))

(assert (= (and d!54687 (not c!32974)) b!183829))

(assert (= (and b!183829 c!32971) b!183830))

(assert (= (and b!183829 (not c!32971)) b!183833))

(assert (= (or b!183830 b!183833) bm!18541))

(assert (= (and d!54687 res!86957) b!183831))

(assert (= (and b!183831 res!86955) b!183839))

(assert (= (and b!183839 res!86954) b!183836))

(assert (= (and b!183839 c!32973) b!183837))

(assert (= (and b!183839 (not c!32973)) b!183834))

(assert (= (and b!183837 res!86956) b!183832))

(assert (= (and b!183834 c!32972) b!183828))

(assert (= (and b!183834 (not c!32972)) b!183835))

(declare-fun b_lambda!7189 () Bool)

(assert (=> (not b_lambda!7189) (not b!183830)))

(assert (=> b!183830 t!7195))

(declare-fun b_and!11089 () Bool)

(assert (= b_and!11087 (and (=> t!7195 result!4763) b_and!11089)))

(declare-fun b_lambda!7191 () Bool)

(assert (=> (not b_lambda!7191) (not b!183832)))

(assert (=> b!183832 t!7195))

(declare-fun b_and!11091 () Bool)

(assert (= b_and!11089 (and (=> t!7195 result!4763) b_and!11091)))

(assert (=> b!183836 m!210649))

(assert (=> b!183836 m!210649))

(assert (=> b!183836 m!210659))

(assert (=> b!183837 m!210649))

(assert (=> b!183837 m!210649))

(declare-fun m!210775 () Bool)

(assert (=> b!183837 m!210775))

(assert (=> b!183829 m!210649))

(assert (=> b!183829 m!210649))

(assert (=> b!183829 m!210659))

(assert (=> b!183832 m!210653))

(assert (=> b!183832 m!210655))

(assert (=> b!183832 m!210649))

(assert (=> b!183832 m!210653))

(assert (=> b!183832 m!210655))

(assert (=> b!183832 m!210657))

(assert (=> b!183832 m!210649))

(declare-fun m!210777 () Bool)

(assert (=> b!183832 m!210777))

(declare-fun m!210779 () Bool)

(assert (=> b!183831 m!210779))

(declare-fun m!210781 () Bool)

(assert (=> b!183835 m!210781))

(assert (=> b!183830 m!210653))

(assert (=> b!183830 m!210655))

(declare-fun m!210783 () Bool)

(assert (=> b!183830 m!210783))

(declare-fun m!210785 () Bool)

(assert (=> b!183830 m!210785))

(assert (=> b!183830 m!210783))

(assert (=> b!183830 m!210653))

(assert (=> b!183830 m!210655))

(assert (=> b!183830 m!210657))

(declare-fun m!210787 () Bool)

(assert (=> b!183830 m!210787))

(assert (=> b!183830 m!210649))

(declare-fun m!210789 () Bool)

(assert (=> b!183830 m!210789))

(declare-fun m!210791 () Bool)

(assert (=> d!54687 m!210791))

(assert (=> d!54687 m!210585))

(declare-fun m!210793 () Bool)

(assert (=> b!183828 m!210793))

(assert (=> bm!18541 m!210793))

(assert (=> b!183695 d!54687))

(declare-fun d!54689 () Bool)

(assert (=> d!54689 (= (apply!160 lt!90724 lt!90735) (get!2109 (getValueByKey!215 (toList!1165 lt!90724) lt!90735)))))

(declare-fun bs!7446 () Bool)

(assert (= bs!7446 d!54689))

(declare-fun m!210795 () Bool)

(assert (=> bs!7446 m!210795))

(assert (=> bs!7446 m!210795))

(declare-fun m!210797 () Bool)

(assert (=> bs!7446 m!210797))

(assert (=> b!183695 d!54689))

(declare-fun d!54691 () Bool)

(assert (=> d!54691 (= (apply!160 (+!277 lt!90728 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))) lt!90733) (get!2109 (getValueByKey!215 (toList!1165 (+!277 lt!90728 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))) lt!90733)))))

(declare-fun bs!7447 () Bool)

(assert (= bs!7447 d!54691))

(declare-fun m!210799 () Bool)

(assert (=> bs!7447 m!210799))

(assert (=> bs!7447 m!210799))

(declare-fun m!210801 () Bool)

(assert (=> bs!7447 m!210801))

(assert (=> b!183695 d!54691))

(declare-fun d!54693 () Bool)

(assert (=> d!54693 (= (apply!160 lt!90719 lt!90734) (get!2109 (getValueByKey!215 (toList!1165 lt!90719) lt!90734)))))

(declare-fun bs!7448 () Bool)

(assert (= bs!7448 d!54693))

(declare-fun m!210803 () Bool)

(assert (=> bs!7448 m!210803))

(assert (=> bs!7448 m!210803))

(declare-fun m!210805 () Bool)

(assert (=> bs!7448 m!210805))

(assert (=> b!183695 d!54693))

(declare-fun d!54695 () Bool)

(declare-fun e!121001 () Bool)

(assert (=> d!54695 e!121001))

(declare-fun res!86959 () Bool)

(assert (=> d!54695 (=> (not res!86959) (not e!121001))))

(declare-fun lt!90799 () ListLongMap!2299)

(assert (=> d!54695 (= res!86959 (contains!1259 lt!90799 (_1!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))))))

(declare-fun lt!90800 () List!2331)

(assert (=> d!54695 (= lt!90799 (ListLongMap!2300 lt!90800))))

(declare-fun lt!90801 () Unit!5527)

(declare-fun lt!90798 () Unit!5527)

(assert (=> d!54695 (= lt!90801 lt!90798)))

(assert (=> d!54695 (= (getValueByKey!215 lt!90800 (_1!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))))))

(assert (=> d!54695 (= lt!90798 (lemmaContainsTupThenGetReturnValue!115 lt!90800 (_1!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))))))

(assert (=> d!54695 (= lt!90800 (insertStrictlySorted!118 (toList!1165 lt!90728) (_1!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))))))

(assert (=> d!54695 (= (+!277 lt!90728 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))) lt!90799)))

(declare-fun b!183840 () Bool)

(declare-fun res!86958 () Bool)

(assert (=> b!183840 (=> (not res!86958) (not e!121001))))

(assert (=> b!183840 (= res!86958 (= (getValueByKey!215 (toList!1165 lt!90799) (_1!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))))))))

(declare-fun b!183841 () Bool)

(assert (=> b!183841 (= e!121001 (contains!1261 (toList!1165 lt!90799) (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))))))

(assert (= (and d!54695 res!86959) b!183840))

(assert (= (and b!183840 res!86958) b!183841))

(declare-fun m!210807 () Bool)

(assert (=> d!54695 m!210807))

(declare-fun m!210809 () Bool)

(assert (=> d!54695 m!210809))

(declare-fun m!210811 () Bool)

(assert (=> d!54695 m!210811))

(declare-fun m!210813 () Bool)

(assert (=> d!54695 m!210813))

(declare-fun m!210815 () Bool)

(assert (=> b!183840 m!210815))

(declare-fun m!210817 () Bool)

(assert (=> b!183841 m!210817))

(assert (=> b!183695 d!54695))

(declare-fun d!54697 () Bool)

(assert (=> d!54697 (= (apply!160 (+!277 lt!90728 (tuple2!3391 lt!90720 (minValue!3595 thiss!1248))) lt!90733) (apply!160 lt!90728 lt!90733))))

(declare-fun lt!90804 () Unit!5527)

(declare-fun choose!980 (ListLongMap!2299 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5527)

(assert (=> d!54697 (= lt!90804 (choose!980 lt!90728 lt!90720 (minValue!3595 thiss!1248) lt!90733))))

(declare-fun e!121004 () Bool)

(assert (=> d!54697 e!121004))

(declare-fun res!86962 () Bool)

(assert (=> d!54697 (=> (not res!86962) (not e!121004))))

(assert (=> d!54697 (= res!86962 (contains!1259 lt!90728 lt!90733))))

(assert (=> d!54697 (= (addApplyDifferent!136 lt!90728 lt!90720 (minValue!3595 thiss!1248) lt!90733) lt!90804)))

(declare-fun b!183845 () Bool)

(assert (=> b!183845 (= e!121004 (not (= lt!90733 lt!90720)))))

(assert (= (and d!54697 res!86962) b!183845))

(assert (=> d!54697 m!210679))

(declare-fun m!210819 () Bool)

(assert (=> d!54697 m!210819))

(assert (=> d!54697 m!210675))

(assert (=> d!54697 m!210677))

(declare-fun m!210821 () Bool)

(assert (=> d!54697 m!210821))

(assert (=> d!54697 m!210675))

(assert (=> b!183695 d!54697))

(declare-fun d!54699 () Bool)

(assert (=> d!54699 (= (apply!160 lt!90728 lt!90733) (get!2109 (getValueByKey!215 (toList!1165 lt!90728) lt!90733)))))

(declare-fun bs!7449 () Bool)

(assert (= bs!7449 d!54699))

(declare-fun m!210823 () Bool)

(assert (=> bs!7449 m!210823))

(assert (=> bs!7449 m!210823))

(declare-fun m!210825 () Bool)

(assert (=> bs!7449 m!210825))

(assert (=> b!183695 d!54699))

(declare-fun d!54701 () Bool)

(declare-fun e!121006 () Bool)

(assert (=> d!54701 e!121006))

(declare-fun res!86963 () Bool)

(assert (=> d!54701 (=> res!86963 e!121006)))

(declare-fun lt!90808 () Bool)

(assert (=> d!54701 (= res!86963 (not lt!90808))))

(declare-fun lt!90805 () Bool)

(assert (=> d!54701 (= lt!90808 lt!90805)))

(declare-fun lt!90806 () Unit!5527)

(declare-fun e!121005 () Unit!5527)

(assert (=> d!54701 (= lt!90806 e!121005)))

(declare-fun c!32975 () Bool)

(assert (=> d!54701 (= c!32975 lt!90805)))

(assert (=> d!54701 (= lt!90805 (containsKey!219 (toList!1165 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))) lt!90726))))

(assert (=> d!54701 (= (contains!1259 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))) lt!90726) lt!90808)))

(declare-fun b!183846 () Bool)

(declare-fun lt!90807 () Unit!5527)

(assert (=> b!183846 (= e!121005 lt!90807)))

(assert (=> b!183846 (= lt!90807 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1165 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))) lt!90726))))

(assert (=> b!183846 (isDefined!169 (getValueByKey!215 (toList!1165 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))) lt!90726))))

(declare-fun b!183847 () Bool)

(declare-fun Unit!5533 () Unit!5527)

(assert (=> b!183847 (= e!121005 Unit!5533)))

(declare-fun b!183848 () Bool)

(assert (=> b!183848 (= e!121006 (isDefined!169 (getValueByKey!215 (toList!1165 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))) lt!90726)))))

(assert (= (and d!54701 c!32975) b!183846))

(assert (= (and d!54701 (not c!32975)) b!183847))

(assert (= (and d!54701 (not res!86963)) b!183848))

(declare-fun m!210827 () Bool)

(assert (=> d!54701 m!210827))

(declare-fun m!210829 () Bool)

(assert (=> b!183846 m!210829))

(declare-fun m!210831 () Bool)

(assert (=> b!183846 m!210831))

(assert (=> b!183846 m!210831))

(declare-fun m!210833 () Bool)

(assert (=> b!183846 m!210833))

(assert (=> b!183848 m!210831))

(assert (=> b!183848 m!210831))

(assert (=> b!183848 m!210833))

(assert (=> b!183695 d!54701))

(declare-fun d!54703 () Bool)

(assert (=> d!54703 (contains!1259 (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))) lt!90726)))

(declare-fun lt!90811 () Unit!5527)

(declare-fun choose!981 (ListLongMap!2299 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5527)

(assert (=> d!54703 (= lt!90811 (choose!981 lt!90732 lt!90729 (zeroValue!3595 thiss!1248) lt!90726))))

(assert (=> d!54703 (contains!1259 lt!90732 lt!90726)))

(assert (=> d!54703 (= (addStillContains!136 lt!90732 lt!90729 (zeroValue!3595 thiss!1248) lt!90726) lt!90811)))

(declare-fun bs!7450 () Bool)

(assert (= bs!7450 d!54703))

(assert (=> bs!7450 m!210689))

(assert (=> bs!7450 m!210689))

(assert (=> bs!7450 m!210693))

(declare-fun m!210835 () Bool)

(assert (=> bs!7450 m!210835))

(declare-fun m!210837 () Bool)

(assert (=> bs!7450 m!210837))

(assert (=> b!183695 d!54703))

(declare-fun d!54705 () Bool)

(assert (=> d!54705 (= (apply!160 (+!277 lt!90719 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))) lt!90734) (apply!160 lt!90719 lt!90734))))

(declare-fun lt!90812 () Unit!5527)

(assert (=> d!54705 (= lt!90812 (choose!980 lt!90719 lt!90736 (minValue!3595 thiss!1248) lt!90734))))

(declare-fun e!121007 () Bool)

(assert (=> d!54705 e!121007))

(declare-fun res!86964 () Bool)

(assert (=> d!54705 (=> (not res!86964) (not e!121007))))

(assert (=> d!54705 (= res!86964 (contains!1259 lt!90719 lt!90734))))

(assert (=> d!54705 (= (addApplyDifferent!136 lt!90719 lt!90736 (minValue!3595 thiss!1248) lt!90734) lt!90812)))

(declare-fun b!183850 () Bool)

(assert (=> b!183850 (= e!121007 (not (= lt!90734 lt!90736)))))

(assert (= (and d!54705 res!86964) b!183850))

(assert (=> d!54705 m!210697))

(declare-fun m!210839 () Bool)

(assert (=> d!54705 m!210839))

(assert (=> d!54705 m!210681))

(assert (=> d!54705 m!210687))

(declare-fun m!210841 () Bool)

(assert (=> d!54705 m!210841))

(assert (=> d!54705 m!210681))

(assert (=> b!183695 d!54705))

(declare-fun d!54707 () Bool)

(declare-fun e!121008 () Bool)

(assert (=> d!54707 e!121008))

(declare-fun res!86966 () Bool)

(assert (=> d!54707 (=> (not res!86966) (not e!121008))))

(declare-fun lt!90814 () ListLongMap!2299)

(assert (=> d!54707 (= res!86966 (contains!1259 lt!90814 (_1!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))))))

(declare-fun lt!90815 () List!2331)

(assert (=> d!54707 (= lt!90814 (ListLongMap!2300 lt!90815))))

(declare-fun lt!90816 () Unit!5527)

(declare-fun lt!90813 () Unit!5527)

(assert (=> d!54707 (= lt!90816 lt!90813)))

(assert (=> d!54707 (= (getValueByKey!215 lt!90815 (_1!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54707 (= lt!90813 (lemmaContainsTupThenGetReturnValue!115 lt!90815 (_1!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54707 (= lt!90815 (insertStrictlySorted!118 (toList!1165 lt!90732) (_1!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54707 (= (+!277 lt!90732 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))) lt!90814)))

(declare-fun b!183851 () Bool)

(declare-fun res!86965 () Bool)

(assert (=> b!183851 (=> (not res!86965) (not e!121008))))

(assert (=> b!183851 (= res!86965 (= (getValueByKey!215 (toList!1165 lt!90814) (_1!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))))))))

(declare-fun b!183852 () Bool)

(assert (=> b!183852 (= e!121008 (contains!1261 (toList!1165 lt!90814) (tuple2!3391 lt!90729 (zeroValue!3595 thiss!1248))))))

(assert (= (and d!54707 res!86966) b!183851))

(assert (= (and b!183851 res!86965) b!183852))

(declare-fun m!210843 () Bool)

(assert (=> d!54707 m!210843))

(declare-fun m!210845 () Bool)

(assert (=> d!54707 m!210845))

(declare-fun m!210847 () Bool)

(assert (=> d!54707 m!210847))

(declare-fun m!210849 () Bool)

(assert (=> d!54707 m!210849))

(declare-fun m!210851 () Bool)

(assert (=> b!183851 m!210851))

(declare-fun m!210853 () Bool)

(assert (=> b!183852 m!210853))

(assert (=> b!183695 d!54707))

(declare-fun d!54709 () Bool)

(assert (=> d!54709 (= (apply!160 (+!277 lt!90724 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))) lt!90735) (apply!160 lt!90724 lt!90735))))

(declare-fun lt!90817 () Unit!5527)

(assert (=> d!54709 (= lt!90817 (choose!980 lt!90724 lt!90716 (zeroValue!3595 thiss!1248) lt!90735))))

(declare-fun e!121009 () Bool)

(assert (=> d!54709 e!121009))

(declare-fun res!86967 () Bool)

(assert (=> d!54709 (=> (not res!86967) (not e!121009))))

(assert (=> d!54709 (= res!86967 (contains!1259 lt!90724 lt!90735))))

(assert (=> d!54709 (= (addApplyDifferent!136 lt!90724 lt!90716 (zeroValue!3595 thiss!1248) lt!90735) lt!90817)))

(declare-fun b!183853 () Bool)

(assert (=> b!183853 (= e!121009 (not (= lt!90735 lt!90716)))))

(assert (= (and d!54709 res!86967) b!183853))

(assert (=> d!54709 m!210701))

(declare-fun m!210855 () Bool)

(assert (=> d!54709 m!210855))

(assert (=> d!54709 m!210683))

(assert (=> d!54709 m!210703))

(declare-fun m!210857 () Bool)

(assert (=> d!54709 m!210857))

(assert (=> d!54709 m!210683))

(assert (=> b!183695 d!54709))

(declare-fun d!54711 () Bool)

(assert (=> d!54711 (= (apply!160 (+!277 lt!90724 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248))) lt!90735) (get!2109 (getValueByKey!215 (toList!1165 (+!277 lt!90724 (tuple2!3391 lt!90716 (zeroValue!3595 thiss!1248)))) lt!90735)))))

(declare-fun bs!7451 () Bool)

(assert (= bs!7451 d!54711))

(declare-fun m!210859 () Bool)

(assert (=> bs!7451 m!210859))

(assert (=> bs!7451 m!210859))

(declare-fun m!210861 () Bool)

(assert (=> bs!7451 m!210861))

(assert (=> b!183695 d!54711))

(declare-fun d!54713 () Bool)

(assert (=> d!54713 (= (apply!160 (+!277 lt!90719 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))) lt!90734) (get!2109 (getValueByKey!215 (toList!1165 (+!277 lt!90719 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))) lt!90734)))))

(declare-fun bs!7452 () Bool)

(assert (= bs!7452 d!54713))

(declare-fun m!210863 () Bool)

(assert (=> bs!7452 m!210863))

(assert (=> bs!7452 m!210863))

(declare-fun m!210865 () Bool)

(assert (=> bs!7452 m!210865))

(assert (=> b!183695 d!54713))

(declare-fun d!54715 () Bool)

(declare-fun e!121010 () Bool)

(assert (=> d!54715 e!121010))

(declare-fun res!86969 () Bool)

(assert (=> d!54715 (=> (not res!86969) (not e!121010))))

(declare-fun lt!90819 () ListLongMap!2299)

(assert (=> d!54715 (= res!86969 (contains!1259 lt!90819 (_1!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))))))

(declare-fun lt!90820 () List!2331)

(assert (=> d!54715 (= lt!90819 (ListLongMap!2300 lt!90820))))

(declare-fun lt!90821 () Unit!5527)

(declare-fun lt!90818 () Unit!5527)

(assert (=> d!54715 (= lt!90821 lt!90818)))

(assert (=> d!54715 (= (getValueByKey!215 lt!90820 (_1!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))))))

(assert (=> d!54715 (= lt!90818 (lemmaContainsTupThenGetReturnValue!115 lt!90820 (_1!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))))))

(assert (=> d!54715 (= lt!90820 (insertStrictlySorted!118 (toList!1165 lt!90719) (_1!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))))))

(assert (=> d!54715 (= (+!277 lt!90719 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))) lt!90819)))

(declare-fun b!183854 () Bool)

(declare-fun res!86968 () Bool)

(assert (=> b!183854 (=> (not res!86968) (not e!121010))))

(assert (=> b!183854 (= res!86968 (= (getValueByKey!215 (toList!1165 lt!90819) (_1!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))))))))

(declare-fun b!183855 () Bool)

(assert (=> b!183855 (= e!121010 (contains!1261 (toList!1165 lt!90819) (tuple2!3391 lt!90736 (minValue!3595 thiss!1248))))))

(assert (= (and d!54715 res!86969) b!183854))

(assert (= (and b!183854 res!86968) b!183855))

(declare-fun m!210867 () Bool)

(assert (=> d!54715 m!210867))

(declare-fun m!210869 () Bool)

(assert (=> d!54715 m!210869))

(declare-fun m!210871 () Bool)

(assert (=> d!54715 m!210871))

(declare-fun m!210873 () Bool)

(assert (=> d!54715 m!210873))

(declare-fun m!210875 () Bool)

(assert (=> b!183854 m!210875))

(declare-fun m!210877 () Bool)

(assert (=> b!183855 m!210877))

(assert (=> b!183695 d!54715))

(declare-fun d!54717 () Bool)

(assert (=> d!54717 (isDefined!169 (getValueByKey!215 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-fun lt!90824 () Unit!5527)

(declare-fun choose!982 (List!2331 (_ BitVec 64)) Unit!5527)

(assert (=> d!54717 (= lt!90824 (choose!982 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-fun e!121013 () Bool)

(assert (=> d!54717 e!121013))

(declare-fun res!86972 () Bool)

(assert (=> d!54717 (=> (not res!86972) (not e!121013))))

(declare-fun isStrictlySorted!341 (List!2331) Bool)

(assert (=> d!54717 (= res!86972 (isStrictlySorted!341 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))))

(assert (=> d!54717 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828) lt!90824)))

(declare-fun b!183858 () Bool)

(assert (=> b!183858 (= e!121013 (containsKey!219 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(assert (= (and d!54717 res!86972) b!183858))

(assert (=> d!54717 m!210645))

(assert (=> d!54717 m!210645))

(assert (=> d!54717 m!210647))

(declare-fun m!210879 () Bool)

(assert (=> d!54717 m!210879))

(declare-fun m!210881 () Bool)

(assert (=> d!54717 m!210881))

(assert (=> b!183858 m!210641))

(assert (=> b!183645 d!54717))

(assert (=> b!183645 d!54675))

(assert (=> b!183645 d!54677))

(declare-fun d!54719 () Bool)

(declare-fun e!121014 () Bool)

(assert (=> d!54719 e!121014))

(declare-fun res!86974 () Bool)

(assert (=> d!54719 (=> (not res!86974) (not e!121014))))

(declare-fun lt!90826 () ListLongMap!2299)

(assert (=> d!54719 (= res!86974 (contains!1259 lt!90826 (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(declare-fun lt!90827 () List!2331)

(assert (=> d!54719 (= lt!90826 (ListLongMap!2300 lt!90827))))

(declare-fun lt!90828 () Unit!5527)

(declare-fun lt!90825 () Unit!5527)

(assert (=> d!54719 (= lt!90828 lt!90825)))

(assert (=> d!54719 (= (getValueByKey!215 lt!90827 (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (=> d!54719 (= lt!90825 (lemmaContainsTupThenGetReturnValue!115 lt!90827 (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (=> d!54719 (= lt!90827 (insertStrictlySorted!118 (toList!1165 call!18534) (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))) (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (=> d!54719 (= (+!277 call!18534 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))) lt!90826)))

(declare-fun b!183859 () Bool)

(declare-fun res!86973 () Bool)

(assert (=> b!183859 (=> (not res!86973) (not e!121014))))

(assert (=> b!183859 (= res!86973 (= (getValueByKey!215 (toList!1165 lt!90826) (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (Some!220 (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun b!183860 () Bool)

(assert (=> b!183860 (= e!121014 (contains!1261 (toList!1165 lt!90826) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))

(assert (= (and d!54719 res!86974) b!183859))

(assert (= (and b!183859 res!86973) b!183860))

(declare-fun m!210883 () Bool)

(assert (=> d!54719 m!210883))

(declare-fun m!210885 () Bool)

(assert (=> d!54719 m!210885))

(declare-fun m!210887 () Bool)

(assert (=> d!54719 m!210887))

(declare-fun m!210889 () Bool)

(assert (=> d!54719 m!210889))

(declare-fun m!210891 () Bool)

(assert (=> b!183859 m!210891))

(declare-fun m!210893 () Bool)

(assert (=> b!183860 m!210893))

(assert (=> b!183710 d!54719))

(assert (=> bm!18535 d!54687))

(declare-fun b!183873 () Bool)

(declare-fun e!121022 () SeekEntryResult!624)

(assert (=> b!183873 (= e!121022 Undefined!624)))

(declare-fun b!183874 () Bool)

(declare-fun e!121023 () SeekEntryResult!624)

(assert (=> b!183874 (= e!121022 e!121023)))

(declare-fun c!32983 () Bool)

(declare-fun lt!90833 () (_ BitVec 64))

(assert (=> b!183874 (= c!32983 (= lt!90833 key!828))))

(declare-fun b!183875 () Bool)

(assert (=> b!183875 (= e!121023 (Found!624 (index!4668 lt!90658)))))

(declare-fun b!183877 () Bool)

(declare-fun e!121021 () SeekEntryResult!624)

(assert (=> b!183877 (= e!121021 (MissingVacant!624 (index!4668 lt!90658)))))

(declare-fun b!183878 () Bool)

(assert (=> b!183878 (= e!121021 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20003 lt!90658) #b00000000000000000000000000000001) (nextIndex!0 (index!4668 lt!90658) (x!20003 lt!90658) (mask!8823 thiss!1248)) (index!4668 lt!90658) key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(declare-fun b!183876 () Bool)

(declare-fun c!32984 () Bool)

(assert (=> b!183876 (= c!32984 (= lt!90833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183876 (= e!121023 e!121021)))

(declare-fun lt!90834 () SeekEntryResult!624)

(declare-fun d!54721 () Bool)

(assert (=> d!54721 (and (or ((_ is Undefined!624) lt!90834) (not ((_ is Found!624) lt!90834)) (and (bvsge (index!4667 lt!90834) #b00000000000000000000000000000000) (bvslt (index!4667 lt!90834) (size!3990 (_keys!5675 thiss!1248))))) (or ((_ is Undefined!624) lt!90834) ((_ is Found!624) lt!90834) (not ((_ is MissingVacant!624) lt!90834)) (not (= (index!4669 lt!90834) (index!4668 lt!90658))) (and (bvsge (index!4669 lt!90834) #b00000000000000000000000000000000) (bvslt (index!4669 lt!90834) (size!3990 (_keys!5675 thiss!1248))))) (or ((_ is Undefined!624) lt!90834) (ite ((_ is Found!624) lt!90834) (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4667 lt!90834)) key!828) (and ((_ is MissingVacant!624) lt!90834) (= (index!4669 lt!90834) (index!4668 lt!90658)) (= (select (arr!3676 (_keys!5675 thiss!1248)) (index!4669 lt!90834)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54721 (= lt!90834 e!121022)))

(declare-fun c!32982 () Bool)

(assert (=> d!54721 (= c!32982 (bvsge (x!20003 lt!90658) #b01111111111111111111111111111110))))

(assert (=> d!54721 (= lt!90833 (select (arr!3676 (_keys!5675 thiss!1248)) (index!4668 lt!90658)))))

(assert (=> d!54721 (validMask!0 (mask!8823 thiss!1248))))

(assert (=> d!54721 (= (seekKeyOrZeroReturnVacant!0 (x!20003 lt!90658) (index!4668 lt!90658) (index!4668 lt!90658) key!828 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)) lt!90834)))

(assert (= (and d!54721 c!32982) b!183873))

(assert (= (and d!54721 (not c!32982)) b!183874))

(assert (= (and b!183874 c!32983) b!183875))

(assert (= (and b!183874 (not c!32983)) b!183876))

(assert (= (and b!183876 c!32984) b!183877))

(assert (= (and b!183876 (not c!32984)) b!183878))

(declare-fun m!210895 () Bool)

(assert (=> b!183878 m!210895))

(assert (=> b!183878 m!210895))

(declare-fun m!210897 () Bool)

(assert (=> b!183878 m!210897))

(declare-fun m!210899 () Bool)

(assert (=> d!54721 m!210899))

(declare-fun m!210901 () Bool)

(assert (=> d!54721 m!210901))

(assert (=> d!54721 m!210631))

(assert (=> d!54721 m!210585))

(assert (=> b!183626 d!54721))

(declare-fun b!183889 () Bool)

(declare-fun e!121034 () Bool)

(declare-fun call!18547 () Bool)

(assert (=> b!183889 (= e!121034 call!18547)))

(declare-fun b!183890 () Bool)

(declare-fun e!121032 () Bool)

(assert (=> b!183890 (= e!121032 e!121034)))

(declare-fun c!32987 () Bool)

(assert (=> b!183890 (= c!32987 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183891 () Bool)

(declare-fun e!121033 () Bool)

(declare-fun contains!1262 (List!2333 (_ BitVec 64)) Bool)

(assert (=> b!183891 (= e!121033 (contains!1262 Nil!2330 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183892 () Bool)

(assert (=> b!183892 (= e!121034 call!18547)))

(declare-fun d!54723 () Bool)

(declare-fun res!86983 () Bool)

(declare-fun e!121035 () Bool)

(assert (=> d!54723 (=> res!86983 e!121035)))

(assert (=> d!54723 (= res!86983 (bvsge #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> d!54723 (= (arrayNoDuplicates!0 (_keys!5675 thiss!1248) #b00000000000000000000000000000000 Nil!2330) e!121035)))

(declare-fun bm!18544 () Bool)

(assert (=> bm!18544 (= call!18547 (arrayNoDuplicates!0 (_keys!5675 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32987 (Cons!2329 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000) Nil!2330) Nil!2330)))))

(declare-fun b!183893 () Bool)

(assert (=> b!183893 (= e!121035 e!121032)))

(declare-fun res!86982 () Bool)

(assert (=> b!183893 (=> (not res!86982) (not e!121032))))

(assert (=> b!183893 (= res!86982 (not e!121033))))

(declare-fun res!86981 () Bool)

(assert (=> b!183893 (=> (not res!86981) (not e!121033))))

(assert (=> b!183893 (= res!86981 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54723 (not res!86983)) b!183893))

(assert (= (and b!183893 res!86981) b!183891))

(assert (= (and b!183893 res!86982) b!183890))

(assert (= (and b!183890 c!32987) b!183889))

(assert (= (and b!183890 (not c!32987)) b!183892))

(assert (= (or b!183889 b!183892) bm!18544))

(assert (=> b!183890 m!210649))

(assert (=> b!183890 m!210649))

(assert (=> b!183890 m!210659))

(assert (=> b!183891 m!210649))

(assert (=> b!183891 m!210649))

(declare-fun m!210903 () Bool)

(assert (=> b!183891 m!210903))

(assert (=> bm!18544 m!210649))

(declare-fun m!210905 () Bool)

(assert (=> bm!18544 m!210905))

(assert (=> b!183893 m!210649))

(assert (=> b!183893 m!210649))

(assert (=> b!183893 m!210659))

(assert (=> b!183638 d!54723))

(declare-fun d!54725 () Bool)

(declare-fun e!121037 () Bool)

(assert (=> d!54725 e!121037))

(declare-fun res!86984 () Bool)

(assert (=> d!54725 (=> res!86984 e!121037)))

(declare-fun lt!90838 () Bool)

(assert (=> d!54725 (= res!86984 (not lt!90838))))

(declare-fun lt!90835 () Bool)

(assert (=> d!54725 (= lt!90838 lt!90835)))

(declare-fun lt!90836 () Unit!5527)

(declare-fun e!121036 () Unit!5527)

(assert (=> d!54725 (= lt!90836 e!121036)))

(declare-fun c!32988 () Bool)

(assert (=> d!54725 (= c!32988 lt!90835)))

(assert (=> d!54725 (= lt!90835 (containsKey!219 (toList!1165 lt!90717) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54725 (= (contains!1259 lt!90717 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90838)))

(declare-fun b!183894 () Bool)

(declare-fun lt!90837 () Unit!5527)

(assert (=> b!183894 (= e!121036 lt!90837)))

(assert (=> b!183894 (= lt!90837 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1165 lt!90717) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183894 (isDefined!169 (getValueByKey!215 (toList!1165 lt!90717) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183895 () Bool)

(declare-fun Unit!5534 () Unit!5527)

(assert (=> b!183895 (= e!121036 Unit!5534)))

(declare-fun b!183896 () Bool)

(assert (=> b!183896 (= e!121037 (isDefined!169 (getValueByKey!215 (toList!1165 lt!90717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54725 c!32988) b!183894))

(assert (= (and d!54725 (not c!32988)) b!183895))

(assert (= (and d!54725 (not res!86984)) b!183896))

(declare-fun m!210907 () Bool)

(assert (=> d!54725 m!210907))

(declare-fun m!210909 () Bool)

(assert (=> b!183894 m!210909))

(assert (=> b!183894 m!210735))

(assert (=> b!183894 m!210735))

(declare-fun m!210911 () Bool)

(assert (=> b!183894 m!210911))

(assert (=> b!183896 m!210735))

(assert (=> b!183896 m!210735))

(assert (=> b!183896 m!210911))

(assert (=> bm!18533 d!54725))

(declare-fun d!54727 () Bool)

(declare-fun res!86989 () Bool)

(declare-fun e!121042 () Bool)

(assert (=> d!54727 (=> res!86989 e!121042)))

(assert (=> d!54727 (= res!86989 (and ((_ is Cons!2327) (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (= (_1!1706 (h!2957 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)))))

(assert (=> d!54727 (= (containsKey!219 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828) e!121042)))

(declare-fun b!183901 () Bool)

(declare-fun e!121043 () Bool)

(assert (=> b!183901 (= e!121042 e!121043)))

(declare-fun res!86990 () Bool)

(assert (=> b!183901 (=> (not res!86990) (not e!121043))))

(assert (=> b!183901 (= res!86990 (and (or (not ((_ is Cons!2327) (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) (bvsle (_1!1706 (h!2957 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)) ((_ is Cons!2327) (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (bvslt (_1!1706 (h!2957 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)))))

(declare-fun b!183902 () Bool)

(assert (=> b!183902 (= e!121043 (containsKey!219 (t!7192 (toList!1165 (getCurrentListMap!798 (_keys!5675 thiss!1248) (_values!3737 thiss!1248) (mask!8823 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) key!828))))

(assert (= (and d!54727 (not res!86989)) b!183901))

(assert (= (and b!183901 res!86990) b!183902))

(declare-fun m!210913 () Bool)

(assert (=> b!183902 m!210913))

(assert (=> d!54655 d!54727))

(declare-fun d!54729 () Bool)

(assert (=> d!54729 (= (apply!160 lt!90717 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2109 (getValueByKey!215 (toList!1165 lt!90717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7453 () Bool)

(assert (= bs!7453 d!54729))

(assert (=> bs!7453 m!210725))

(assert (=> bs!7453 m!210725))

(declare-fun m!210915 () Bool)

(assert (=> bs!7453 m!210915))

(assert (=> b!183708 d!54729))

(declare-fun d!54731 () Bool)

(declare-fun res!86995 () Bool)

(declare-fun e!121051 () Bool)

(assert (=> d!54731 (=> res!86995 e!121051)))

(assert (=> d!54731 (= res!86995 (bvsge #b00000000000000000000000000000000 (size!3990 (_keys!5675 thiss!1248))))))

(assert (=> d!54731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5675 thiss!1248) (mask!8823 thiss!1248)) e!121051)))

(declare-fun b!183911 () Bool)

(declare-fun e!121052 () Bool)

(declare-fun call!18550 () Bool)

(assert (=> b!183911 (= e!121052 call!18550)))

(declare-fun b!183912 () Bool)

(declare-fun e!121050 () Bool)

(assert (=> b!183912 (= e!121050 call!18550)))

(declare-fun bm!18547 () Bool)

(assert (=> bm!18547 (= call!18550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5675 thiss!1248) (mask!8823 thiss!1248)))))

(declare-fun b!183913 () Bool)

(assert (=> b!183913 (= e!121051 e!121050)))

(declare-fun c!32991 () Bool)

(assert (=> b!183913 (= c!32991 (validKeyInArray!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183914 () Bool)

(assert (=> b!183914 (= e!121050 e!121052)))

(declare-fun lt!90847 () (_ BitVec 64))

(assert (=> b!183914 (= lt!90847 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90845 () Unit!5527)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7781 (_ BitVec 64) (_ BitVec 32)) Unit!5527)

(assert (=> b!183914 (= lt!90845 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5675 thiss!1248) lt!90847 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183914 (arrayContainsKey!0 (_keys!5675 thiss!1248) lt!90847 #b00000000000000000000000000000000)))

(declare-fun lt!90846 () Unit!5527)

(assert (=> b!183914 (= lt!90846 lt!90845)))

(declare-fun res!86996 () Bool)

(assert (=> b!183914 (= res!86996 (= (seekEntryOrOpen!0 (select (arr!3676 (_keys!5675 thiss!1248)) #b00000000000000000000000000000000) (_keys!5675 thiss!1248) (mask!8823 thiss!1248)) (Found!624 #b00000000000000000000000000000000)))))

(assert (=> b!183914 (=> (not res!86996) (not e!121052))))

(assert (= (and d!54731 (not res!86995)) b!183913))

(assert (= (and b!183913 c!32991) b!183914))

(assert (= (and b!183913 (not c!32991)) b!183912))

(assert (= (and b!183914 res!86996) b!183911))

(assert (= (or b!183911 b!183912) bm!18547))

(declare-fun m!210917 () Bool)

(assert (=> bm!18547 m!210917))

(assert (=> b!183913 m!210649))

(assert (=> b!183913 m!210649))

(assert (=> b!183913 m!210659))

(assert (=> b!183914 m!210649))

(declare-fun m!210919 () Bool)

(assert (=> b!183914 m!210919))

(declare-fun m!210921 () Bool)

(assert (=> b!183914 m!210921))

(assert (=> b!183914 m!210649))

(declare-fun m!210923 () Bool)

(assert (=> b!183914 m!210923))

(assert (=> b!183637 d!54731))

(declare-fun mapNonEmpty!7402 () Bool)

(declare-fun mapRes!7402 () Bool)

(declare-fun tp!16384 () Bool)

(declare-fun e!121053 () Bool)

(assert (=> mapNonEmpty!7402 (= mapRes!7402 (and tp!16384 e!121053))))

(declare-fun mapValue!7402 () ValueCell!1808)

(declare-fun mapRest!7402 () (Array (_ BitVec 32) ValueCell!1808))

(declare-fun mapKey!7402 () (_ BitVec 32))

(assert (=> mapNonEmpty!7402 (= mapRest!7401 (store mapRest!7402 mapKey!7402 mapValue!7402))))

(declare-fun condMapEmpty!7402 () Bool)

(declare-fun mapDefault!7402 () ValueCell!1808)

(assert (=> mapNonEmpty!7401 (= condMapEmpty!7402 (= mapRest!7401 ((as const (Array (_ BitVec 32) ValueCell!1808)) mapDefault!7402)))))

(declare-fun e!121054 () Bool)

(assert (=> mapNonEmpty!7401 (= tp!16383 (and e!121054 mapRes!7402))))

(declare-fun mapIsEmpty!7402 () Bool)

(assert (=> mapIsEmpty!7402 mapRes!7402))

(declare-fun b!183916 () Bool)

(assert (=> b!183916 (= e!121054 tp_is_empty!4303)))

(declare-fun b!183915 () Bool)

(assert (=> b!183915 (= e!121053 tp_is_empty!4303)))

(assert (= (and mapNonEmpty!7401 condMapEmpty!7402) mapIsEmpty!7402))

(assert (= (and mapNonEmpty!7401 (not condMapEmpty!7402)) mapNonEmpty!7402))

(assert (= (and mapNonEmpty!7402 ((_ is ValueCellFull!1808) mapValue!7402)) b!183915))

(assert (= (and mapNonEmpty!7401 ((_ is ValueCellFull!1808) mapDefault!7402)) b!183916))

(declare-fun m!210925 () Bool)

(assert (=> mapNonEmpty!7402 m!210925))

(declare-fun b_lambda!7193 () Bool)

(assert (= b_lambda!7189 (or (and b!183554 b_free!4531) b_lambda!7193)))

(declare-fun b_lambda!7195 () Bool)

(assert (= b_lambda!7191 (or (and b!183554 b_free!4531) b_lambda!7195)))

(check-sat (not d!54659) (not d!54683) (not d!54675) (not b!183793) b_and!11091 (not b!183725) (not d!54705) (not d!54711) (not b!183726) (not b!183840) (not d!54725) (not b!183858) (not b!183831) (not b!183753) (not b!183902) (not b!183754) (not b!183914) (not b!183852) (not b!183767) (not b!183751) (not d!54729) (not bm!18541) (not b!183756) (not b!183894) (not b!183891) (not b!183830) (not d!54697) (not b!183859) (not b!183749) (not b!183801) (not b!183803) (not d!54713) (not b!183878) (not d!54667) tp_is_empty!4303 (not b!183846) (not d!54669) (not d!54673) (not b_lambda!7193) (not b!183851) (not d!54691) (not d!54695) (not d!54699) (not b!183854) (not d!54701) (not bm!18538) (not bm!18547) (not b!183748) (not b!183913) (not bm!18544) (not d!54719) (not b!183836) (not b_lambda!7187) (not d!54679) (not b!183800) (not b!183890) (not b!183848) (not d!54715) (not d!54671) (not b!183896) (not b!183828) (not d!54707) (not b!183735) (not b!183835) (not d!54689) (not b!183860) (not b!183802) (not b!183832) (not mapNonEmpty!7402) (not d!54721) (not b!183829) (not d!54703) (not d!54693) (not d!54685) (not d!54709) (not d!54717) (not b_lambda!7195) (not d!54687) (not b!183841) (not b!183837) (not b!183893) (not b!183855) (not b_next!4531))
(check-sat b_and!11091 (not b_next!4531))
