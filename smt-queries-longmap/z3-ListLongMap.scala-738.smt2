; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17208 () Bool)

(assert start!17208)

(declare-fun b!172699 () Bool)

(declare-fun b_free!4267 () Bool)

(declare-fun b_next!4267 () Bool)

(assert (=> b!172699 (= b_free!4267 (not b_next!4267))))

(declare-fun tp!15454 () Bool)

(declare-fun b_and!10721 () Bool)

(assert (=> b!172699 (= tp!15454 b_and!10721)))

(declare-fun tp_is_empty!4039 () Bool)

(declare-fun e!114009 () Bool)

(declare-fun e!114008 () Bool)

(declare-datatypes ((V!5033 0))(
  ( (V!5034 (val!2064 Int)) )
))
(declare-datatypes ((ValueCell!1676 0))(
  ( (ValueCellFull!1676 (v!3933 V!5033)) (EmptyCell!1676) )
))
(declare-datatypes ((array!7189 0))(
  ( (array!7190 (arr!3416 (Array (_ BitVec 32) (_ BitVec 64))) (size!3714 (_ BitVec 32))) )
))
(declare-datatypes ((array!7191 0))(
  ( (array!7192 (arr!3417 (Array (_ BitVec 32) ValueCell!1676)) (size!3715 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2260 0))(
  ( (LongMapFixedSize!2261 (defaultEntry!3576 Int) (mask!8428 (_ BitVec 32)) (extraKeys!3315 (_ BitVec 32)) (zeroValue!3417 V!5033) (minValue!3419 V!5033) (_size!1179 (_ BitVec 32)) (_keys!5414 array!7189) (_values!3559 array!7191) (_vacant!1179 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2260)

(declare-fun array_inv!2199 (array!7189) Bool)

(declare-fun array_inv!2200 (array!7191) Bool)

(assert (=> b!172699 (= e!114009 (and tp!15454 tp_is_empty!4039 (array_inv!2199 (_keys!5414 thiss!1248)) (array_inv!2200 (_values!3559 thiss!1248)) e!114008))))

(declare-fun mapIsEmpty!6875 () Bool)

(declare-fun mapRes!6875 () Bool)

(assert (=> mapIsEmpty!6875 mapRes!6875))

(declare-fun b!172700 () Bool)

(declare-fun res!82000 () Bool)

(declare-fun e!114004 () Bool)

(assert (=> b!172700 (=> (not res!82000) (not e!114004))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172700 (= res!82000 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172701 () Bool)

(declare-fun res!82002 () Bool)

(assert (=> b!172701 (=> (not res!82002) (not e!114004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172701 (= res!82002 (validMask!0 (mask!8428 thiss!1248)))))

(declare-fun mapNonEmpty!6875 () Bool)

(declare-fun tp!15455 () Bool)

(declare-fun e!114006 () Bool)

(assert (=> mapNonEmpty!6875 (= mapRes!6875 (and tp!15455 e!114006))))

(declare-fun mapValue!6875 () ValueCell!1676)

(declare-fun mapRest!6875 () (Array (_ BitVec 32) ValueCell!1676))

(declare-fun mapKey!6875 () (_ BitVec 32))

(assert (=> mapNonEmpty!6875 (= (arr!3417 (_values!3559 thiss!1248)) (store mapRest!6875 mapKey!6875 mapValue!6875))))

(declare-fun b!172702 () Bool)

(declare-fun e!114007 () Bool)

(assert (=> b!172702 (= e!114007 tp_is_empty!4039)))

(declare-fun b!172703 () Bool)

(assert (=> b!172703 (= e!114006 tp_is_empty!4039)))

(declare-fun b!172704 () Bool)

(assert (=> b!172704 (= e!114004 (and (= (size!3715 (_values!3559 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8428 thiss!1248))) (= (size!3714 (_keys!5414 thiss!1248)) (size!3715 (_values!3559 thiss!1248))) (bvsge (mask!8428 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3315 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3315 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!172705 () Bool)

(assert (=> b!172705 (= e!114008 (and e!114007 mapRes!6875))))

(declare-fun condMapEmpty!6875 () Bool)

(declare-fun mapDefault!6875 () ValueCell!1676)

(assert (=> b!172705 (= condMapEmpty!6875 (= (arr!3417 (_values!3559 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1676)) mapDefault!6875)))))

(declare-fun res!82001 () Bool)

(assert (=> start!17208 (=> (not res!82001) (not e!114004))))

(declare-fun valid!974 (LongMapFixedSize!2260) Bool)

(assert (=> start!17208 (= res!82001 (valid!974 thiss!1248))))

(assert (=> start!17208 e!114004))

(assert (=> start!17208 e!114009))

(assert (=> start!17208 true))

(assert (= (and start!17208 res!82001) b!172700))

(assert (= (and b!172700 res!82000) b!172701))

(assert (= (and b!172701 res!82002) b!172704))

(assert (= (and b!172705 condMapEmpty!6875) mapIsEmpty!6875))

(assert (= (and b!172705 (not condMapEmpty!6875)) mapNonEmpty!6875))

(get-info :version)

(assert (= (and mapNonEmpty!6875 ((_ is ValueCellFull!1676) mapValue!6875)) b!172703))

(assert (= (and b!172705 ((_ is ValueCellFull!1676) mapDefault!6875)) b!172702))

(assert (= b!172699 b!172705))

(assert (= start!17208 b!172699))

(declare-fun m!201513 () Bool)

(assert (=> b!172699 m!201513))

(declare-fun m!201515 () Bool)

(assert (=> b!172699 m!201515))

(declare-fun m!201517 () Bool)

(assert (=> b!172701 m!201517))

(declare-fun m!201519 () Bool)

(assert (=> mapNonEmpty!6875 m!201519))

(declare-fun m!201521 () Bool)

(assert (=> start!17208 m!201521))

(check-sat tp_is_empty!4039 (not b!172699) b_and!10721 (not b!172701) (not start!17208) (not mapNonEmpty!6875) (not b_next!4267))
(check-sat b_and!10721 (not b_next!4267))
(get-model)

(declare-fun d!52611 () Bool)

(assert (=> d!52611 (= (array_inv!2199 (_keys!5414 thiss!1248)) (bvsge (size!3714 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172699 d!52611))

(declare-fun d!52613 () Bool)

(assert (=> d!52613 (= (array_inv!2200 (_values!3559 thiss!1248)) (bvsge (size!3715 (_values!3559 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172699 d!52613))

(declare-fun d!52615 () Bool)

(declare-fun res!82027 () Bool)

(declare-fun e!114048 () Bool)

(assert (=> d!52615 (=> (not res!82027) (not e!114048))))

(declare-fun simpleValid!141 (LongMapFixedSize!2260) Bool)

(assert (=> d!52615 (= res!82027 (simpleValid!141 thiss!1248))))

(assert (=> d!52615 (= (valid!974 thiss!1248) e!114048)))

(declare-fun b!172754 () Bool)

(declare-fun res!82028 () Bool)

(assert (=> b!172754 (=> (not res!82028) (not e!114048))))

(declare-fun arrayCountValidKeys!0 (array!7189 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172754 (= res!82028 (= (arrayCountValidKeys!0 (_keys!5414 thiss!1248) #b00000000000000000000000000000000 (size!3714 (_keys!5414 thiss!1248))) (_size!1179 thiss!1248)))))

(declare-fun b!172755 () Bool)

(declare-fun res!82029 () Bool)

(assert (=> b!172755 (=> (not res!82029) (not e!114048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7189 (_ BitVec 32)) Bool)

(assert (=> b!172755 (= res!82029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5414 thiss!1248) (mask!8428 thiss!1248)))))

(declare-fun b!172756 () Bool)

(declare-datatypes ((List!2184 0))(
  ( (Nil!2181) (Cons!2180 (h!2797 (_ BitVec 64)) (t!6983 List!2184)) )
))
(declare-fun arrayNoDuplicates!0 (array!7189 (_ BitVec 32) List!2184) Bool)

(assert (=> b!172756 (= e!114048 (arrayNoDuplicates!0 (_keys!5414 thiss!1248) #b00000000000000000000000000000000 Nil!2181))))

(assert (= (and d!52615 res!82027) b!172754))

(assert (= (and b!172754 res!82028) b!172755))

(assert (= (and b!172755 res!82029) b!172756))

(declare-fun m!201543 () Bool)

(assert (=> d!52615 m!201543))

(declare-fun m!201545 () Bool)

(assert (=> b!172754 m!201545))

(declare-fun m!201547 () Bool)

(assert (=> b!172755 m!201547))

(declare-fun m!201549 () Bool)

(assert (=> b!172756 m!201549))

(assert (=> start!17208 d!52615))

(declare-fun d!52617 () Bool)

(assert (=> d!52617 (= (validMask!0 (mask!8428 thiss!1248)) (and (or (= (mask!8428 thiss!1248) #b00000000000000000000000000000111) (= (mask!8428 thiss!1248) #b00000000000000000000000000001111) (= (mask!8428 thiss!1248) #b00000000000000000000000000011111) (= (mask!8428 thiss!1248) #b00000000000000000000000000111111) (= (mask!8428 thiss!1248) #b00000000000000000000000001111111) (= (mask!8428 thiss!1248) #b00000000000000000000000011111111) (= (mask!8428 thiss!1248) #b00000000000000000000000111111111) (= (mask!8428 thiss!1248) #b00000000000000000000001111111111) (= (mask!8428 thiss!1248) #b00000000000000000000011111111111) (= (mask!8428 thiss!1248) #b00000000000000000000111111111111) (= (mask!8428 thiss!1248) #b00000000000000000001111111111111) (= (mask!8428 thiss!1248) #b00000000000000000011111111111111) (= (mask!8428 thiss!1248) #b00000000000000000111111111111111) (= (mask!8428 thiss!1248) #b00000000000000001111111111111111) (= (mask!8428 thiss!1248) #b00000000000000011111111111111111) (= (mask!8428 thiss!1248) #b00000000000000111111111111111111) (= (mask!8428 thiss!1248) #b00000000000001111111111111111111) (= (mask!8428 thiss!1248) #b00000000000011111111111111111111) (= (mask!8428 thiss!1248) #b00000000000111111111111111111111) (= (mask!8428 thiss!1248) #b00000000001111111111111111111111) (= (mask!8428 thiss!1248) #b00000000011111111111111111111111) (= (mask!8428 thiss!1248) #b00000000111111111111111111111111) (= (mask!8428 thiss!1248) #b00000001111111111111111111111111) (= (mask!8428 thiss!1248) #b00000011111111111111111111111111) (= (mask!8428 thiss!1248) #b00000111111111111111111111111111) (= (mask!8428 thiss!1248) #b00001111111111111111111111111111) (= (mask!8428 thiss!1248) #b00011111111111111111111111111111) (= (mask!8428 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8428 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172701 d!52617))

(declare-fun mapNonEmpty!6884 () Bool)

(declare-fun mapRes!6884 () Bool)

(declare-fun tp!15470 () Bool)

(declare-fun e!114053 () Bool)

(assert (=> mapNonEmpty!6884 (= mapRes!6884 (and tp!15470 e!114053))))

(declare-fun mapRest!6884 () (Array (_ BitVec 32) ValueCell!1676))

(declare-fun mapKey!6884 () (_ BitVec 32))

(declare-fun mapValue!6884 () ValueCell!1676)

(assert (=> mapNonEmpty!6884 (= mapRest!6875 (store mapRest!6884 mapKey!6884 mapValue!6884))))

(declare-fun condMapEmpty!6884 () Bool)

(declare-fun mapDefault!6884 () ValueCell!1676)

(assert (=> mapNonEmpty!6875 (= condMapEmpty!6884 (= mapRest!6875 ((as const (Array (_ BitVec 32) ValueCell!1676)) mapDefault!6884)))))

(declare-fun e!114054 () Bool)

(assert (=> mapNonEmpty!6875 (= tp!15455 (and e!114054 mapRes!6884))))

(declare-fun b!172764 () Bool)

(assert (=> b!172764 (= e!114054 tp_is_empty!4039)))

(declare-fun b!172763 () Bool)

(assert (=> b!172763 (= e!114053 tp_is_empty!4039)))

(declare-fun mapIsEmpty!6884 () Bool)

(assert (=> mapIsEmpty!6884 mapRes!6884))

(assert (= (and mapNonEmpty!6875 condMapEmpty!6884) mapIsEmpty!6884))

(assert (= (and mapNonEmpty!6875 (not condMapEmpty!6884)) mapNonEmpty!6884))

(assert (= (and mapNonEmpty!6884 ((_ is ValueCellFull!1676) mapValue!6884)) b!172763))

(assert (= (and mapNonEmpty!6875 ((_ is ValueCellFull!1676) mapDefault!6884)) b!172764))

(declare-fun m!201551 () Bool)

(assert (=> mapNonEmpty!6884 m!201551))

(check-sat b_and!10721 (not b_next!4267) (not b!172755) (not d!52615) (not mapNonEmpty!6884) (not b!172756) (not b!172754) tp_is_empty!4039)
(check-sat b_and!10721 (not b_next!4267))
(get-model)

(declare-fun b!172773 () Bool)

(declare-fun e!114063 () Bool)

(declare-fun call!17530 () Bool)

(assert (=> b!172773 (= e!114063 call!17530)))

(declare-fun bm!17527 () Bool)

(assert (=> bm!17527 (= call!17530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5414 thiss!1248) (mask!8428 thiss!1248)))))

(declare-fun b!172774 () Bool)

(declare-fun e!114061 () Bool)

(assert (=> b!172774 (= e!114061 call!17530)))

(declare-fun b!172775 () Bool)

(declare-fun e!114062 () Bool)

(assert (=> b!172775 (= e!114062 e!114063)))

(declare-fun c!30891 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172775 (= c!30891 (validKeyInArray!0 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172776 () Bool)

(assert (=> b!172776 (= e!114063 e!114061)))

(declare-fun lt!85747 () (_ BitVec 64))

(assert (=> b!172776 (= lt!85747 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5309 0))(
  ( (Unit!5310) )
))
(declare-fun lt!85748 () Unit!5309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7189 (_ BitVec 64) (_ BitVec 32)) Unit!5309)

(assert (=> b!172776 (= lt!85748 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5414 thiss!1248) lt!85747 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172776 (arrayContainsKey!0 (_keys!5414 thiss!1248) lt!85747 #b00000000000000000000000000000000)))

(declare-fun lt!85749 () Unit!5309)

(assert (=> b!172776 (= lt!85749 lt!85748)))

(declare-fun res!82034 () Bool)

(declare-datatypes ((SeekEntryResult!533 0))(
  ( (MissingZero!533 (index!4300 (_ BitVec 32))) (Found!533 (index!4301 (_ BitVec 32))) (Intermediate!533 (undefined!1345 Bool) (index!4302 (_ BitVec 32)) (x!19092 (_ BitVec 32))) (Undefined!533) (MissingVacant!533 (index!4303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7189 (_ BitVec 32)) SeekEntryResult!533)

(assert (=> b!172776 (= res!82034 (= (seekEntryOrOpen!0 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000) (_keys!5414 thiss!1248) (mask!8428 thiss!1248)) (Found!533 #b00000000000000000000000000000000)))))

(assert (=> b!172776 (=> (not res!82034) (not e!114061))))

(declare-fun d!52619 () Bool)

(declare-fun res!82035 () Bool)

(assert (=> d!52619 (=> res!82035 e!114062)))

(assert (=> d!52619 (= res!82035 (bvsge #b00000000000000000000000000000000 (size!3714 (_keys!5414 thiss!1248))))))

(assert (=> d!52619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5414 thiss!1248) (mask!8428 thiss!1248)) e!114062)))

(assert (= (and d!52619 (not res!82035)) b!172775))

(assert (= (and b!172775 c!30891) b!172776))

(assert (= (and b!172775 (not c!30891)) b!172773))

(assert (= (and b!172776 res!82034) b!172774))

(assert (= (or b!172774 b!172773) bm!17527))

(declare-fun m!201553 () Bool)

(assert (=> bm!17527 m!201553))

(declare-fun m!201555 () Bool)

(assert (=> b!172775 m!201555))

(assert (=> b!172775 m!201555))

(declare-fun m!201557 () Bool)

(assert (=> b!172775 m!201557))

(assert (=> b!172776 m!201555))

(declare-fun m!201559 () Bool)

(assert (=> b!172776 m!201559))

(declare-fun m!201561 () Bool)

(assert (=> b!172776 m!201561))

(assert (=> b!172776 m!201555))

(declare-fun m!201563 () Bool)

(assert (=> b!172776 m!201563))

(assert (=> b!172755 d!52619))

(declare-fun b!172787 () Bool)

(declare-fun e!114073 () Bool)

(declare-fun e!114072 () Bool)

(assert (=> b!172787 (= e!114073 e!114072)))

(declare-fun res!82043 () Bool)

(assert (=> b!172787 (=> (not res!82043) (not e!114072))))

(declare-fun e!114075 () Bool)

(assert (=> b!172787 (= res!82043 (not e!114075))))

(declare-fun res!82044 () Bool)

(assert (=> b!172787 (=> (not res!82044) (not e!114075))))

(assert (=> b!172787 (= res!82044 (validKeyInArray!0 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172788 () Bool)

(declare-fun e!114074 () Bool)

(declare-fun call!17533 () Bool)

(assert (=> b!172788 (= e!114074 call!17533)))

(declare-fun b!172789 () Bool)

(declare-fun contains!1147 (List!2184 (_ BitVec 64)) Bool)

(assert (=> b!172789 (= e!114075 (contains!1147 Nil!2181 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17530 () Bool)

(declare-fun c!30894 () Bool)

(assert (=> bm!17530 (= call!17533 (arrayNoDuplicates!0 (_keys!5414 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30894 (Cons!2180 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000) Nil!2181) Nil!2181)))))

(declare-fun d!52621 () Bool)

(declare-fun res!82042 () Bool)

(assert (=> d!52621 (=> res!82042 e!114073)))

(assert (=> d!52621 (= res!82042 (bvsge #b00000000000000000000000000000000 (size!3714 (_keys!5414 thiss!1248))))))

(assert (=> d!52621 (= (arrayNoDuplicates!0 (_keys!5414 thiss!1248) #b00000000000000000000000000000000 Nil!2181) e!114073)))

(declare-fun b!172790 () Bool)

(assert (=> b!172790 (= e!114074 call!17533)))

(declare-fun b!172791 () Bool)

(assert (=> b!172791 (= e!114072 e!114074)))

(assert (=> b!172791 (= c!30894 (validKeyInArray!0 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52621 (not res!82042)) b!172787))

(assert (= (and b!172787 res!82044) b!172789))

(assert (= (and b!172787 res!82043) b!172791))

(assert (= (and b!172791 c!30894) b!172790))

(assert (= (and b!172791 (not c!30894)) b!172788))

(assert (= (or b!172790 b!172788) bm!17530))

(assert (=> b!172787 m!201555))

(assert (=> b!172787 m!201555))

(assert (=> b!172787 m!201557))

(assert (=> b!172789 m!201555))

(assert (=> b!172789 m!201555))

(declare-fun m!201565 () Bool)

(assert (=> b!172789 m!201565))

(assert (=> bm!17530 m!201555))

(declare-fun m!201567 () Bool)

(assert (=> bm!17530 m!201567))

(assert (=> b!172791 m!201555))

(assert (=> b!172791 m!201555))

(assert (=> b!172791 m!201557))

(assert (=> b!172756 d!52621))

(declare-fun b!172800 () Bool)

(declare-fun e!114080 () (_ BitVec 32))

(declare-fun e!114081 () (_ BitVec 32))

(assert (=> b!172800 (= e!114080 e!114081)))

(declare-fun c!30899 () Bool)

(assert (=> b!172800 (= c!30899 (validKeyInArray!0 (select (arr!3416 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172801 () Bool)

(assert (=> b!172801 (= e!114080 #b00000000000000000000000000000000)))

(declare-fun b!172802 () Bool)

(declare-fun call!17536 () (_ BitVec 32))

(assert (=> b!172802 (= e!114081 call!17536)))

(declare-fun bm!17533 () Bool)

(assert (=> bm!17533 (= call!17536 (arrayCountValidKeys!0 (_keys!5414 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3714 (_keys!5414 thiss!1248))))))

(declare-fun b!172803 () Bool)

(assert (=> b!172803 (= e!114081 (bvadd #b00000000000000000000000000000001 call!17536))))

(declare-fun d!52623 () Bool)

(declare-fun lt!85752 () (_ BitVec 32))

(assert (=> d!52623 (and (bvsge lt!85752 #b00000000000000000000000000000000) (bvsle lt!85752 (bvsub (size!3714 (_keys!5414 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52623 (= lt!85752 e!114080)))

(declare-fun c!30900 () Bool)

(assert (=> d!52623 (= c!30900 (bvsge #b00000000000000000000000000000000 (size!3714 (_keys!5414 thiss!1248))))))

(assert (=> d!52623 (and (bvsle #b00000000000000000000000000000000 (size!3714 (_keys!5414 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3714 (_keys!5414 thiss!1248)) (size!3714 (_keys!5414 thiss!1248))))))

(assert (=> d!52623 (= (arrayCountValidKeys!0 (_keys!5414 thiss!1248) #b00000000000000000000000000000000 (size!3714 (_keys!5414 thiss!1248))) lt!85752)))

(assert (= (and d!52623 c!30900) b!172801))

(assert (= (and d!52623 (not c!30900)) b!172800))

(assert (= (and b!172800 c!30899) b!172803))

(assert (= (and b!172800 (not c!30899)) b!172802))

(assert (= (or b!172803 b!172802) bm!17533))

(assert (=> b!172800 m!201555))

(assert (=> b!172800 m!201555))

(assert (=> b!172800 m!201557))

(declare-fun m!201569 () Bool)

(assert (=> bm!17533 m!201569))

(assert (=> b!172754 d!52623))

(declare-fun b!172814 () Bool)

(declare-fun res!82054 () Bool)

(declare-fun e!114084 () Bool)

(assert (=> b!172814 (=> (not res!82054) (not e!114084))))

(declare-fun size!3720 (LongMapFixedSize!2260) (_ BitVec 32))

(assert (=> b!172814 (= res!82054 (= (size!3720 thiss!1248) (bvadd (_size!1179 thiss!1248) (bvsdiv (bvadd (extraKeys!3315 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!52625 () Bool)

(declare-fun res!82053 () Bool)

(assert (=> d!52625 (=> (not res!82053) (not e!114084))))

(assert (=> d!52625 (= res!82053 (validMask!0 (mask!8428 thiss!1248)))))

(assert (=> d!52625 (= (simpleValid!141 thiss!1248) e!114084)))

(declare-fun b!172812 () Bool)

(declare-fun res!82056 () Bool)

(assert (=> b!172812 (=> (not res!82056) (not e!114084))))

(assert (=> b!172812 (= res!82056 (and (= (size!3715 (_values!3559 thiss!1248)) (bvadd (mask!8428 thiss!1248) #b00000000000000000000000000000001)) (= (size!3714 (_keys!5414 thiss!1248)) (size!3715 (_values!3559 thiss!1248))) (bvsge (_size!1179 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1179 thiss!1248) (bvadd (mask!8428 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172815 () Bool)

(assert (=> b!172815 (= e!114084 (and (bvsge (extraKeys!3315 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3315 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1179 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172813 () Bool)

(declare-fun res!82055 () Bool)

(assert (=> b!172813 (=> (not res!82055) (not e!114084))))

(assert (=> b!172813 (= res!82055 (bvsge (size!3720 thiss!1248) (_size!1179 thiss!1248)))))

(assert (= (and d!52625 res!82053) b!172812))

(assert (= (and b!172812 res!82056) b!172813))

(assert (= (and b!172813 res!82055) b!172814))

(assert (= (and b!172814 res!82054) b!172815))

(declare-fun m!201571 () Bool)

(assert (=> b!172814 m!201571))

(assert (=> d!52625 m!201517))

(assert (=> b!172813 m!201571))

(assert (=> d!52615 d!52625))

(declare-fun mapNonEmpty!6885 () Bool)

(declare-fun mapRes!6885 () Bool)

(declare-fun tp!15471 () Bool)

(declare-fun e!114085 () Bool)

(assert (=> mapNonEmpty!6885 (= mapRes!6885 (and tp!15471 e!114085))))

(declare-fun mapKey!6885 () (_ BitVec 32))

(declare-fun mapValue!6885 () ValueCell!1676)

(declare-fun mapRest!6885 () (Array (_ BitVec 32) ValueCell!1676))

(assert (=> mapNonEmpty!6885 (= mapRest!6884 (store mapRest!6885 mapKey!6885 mapValue!6885))))

(declare-fun condMapEmpty!6885 () Bool)

(declare-fun mapDefault!6885 () ValueCell!1676)

(assert (=> mapNonEmpty!6884 (= condMapEmpty!6885 (= mapRest!6884 ((as const (Array (_ BitVec 32) ValueCell!1676)) mapDefault!6885)))))

(declare-fun e!114086 () Bool)

(assert (=> mapNonEmpty!6884 (= tp!15470 (and e!114086 mapRes!6885))))

(declare-fun b!172817 () Bool)

(assert (=> b!172817 (= e!114086 tp_is_empty!4039)))

(declare-fun b!172816 () Bool)

(assert (=> b!172816 (= e!114085 tp_is_empty!4039)))

(declare-fun mapIsEmpty!6885 () Bool)

(assert (=> mapIsEmpty!6885 mapRes!6885))

(assert (= (and mapNonEmpty!6884 condMapEmpty!6885) mapIsEmpty!6885))

(assert (= (and mapNonEmpty!6884 (not condMapEmpty!6885)) mapNonEmpty!6885))

(assert (= (and mapNonEmpty!6885 ((_ is ValueCellFull!1676) mapValue!6885)) b!172816))

(assert (= (and mapNonEmpty!6884 ((_ is ValueCellFull!1676) mapDefault!6885)) b!172817))

(declare-fun m!201573 () Bool)

(assert (=> mapNonEmpty!6885 m!201573))

(check-sat (not b!172791) (not d!52625) (not b!172787) (not b_next!4267) (not bm!17530) (not b!172814) (not b!172800) (not bm!17533) tp_is_empty!4039 (not b!172775) (not mapNonEmpty!6885) b_and!10721 (not b!172776) (not b!172813) (not bm!17527) (not b!172789))
(check-sat b_and!10721 (not b_next!4267))
