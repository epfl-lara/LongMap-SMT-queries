; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107448 () Bool)

(assert start!107448)

(declare-fun b!1272721 () Bool)

(declare-fun b_free!27685 () Bool)

(declare-fun b_next!27685 () Bool)

(assert (=> b!1272721 (= b_free!27685 (not b_next!27685))))

(declare-fun tp!97583 () Bool)

(declare-fun b_and!45723 () Bool)

(assert (=> b!1272721 (= tp!97583 b_and!45723)))

(declare-fun b!1272719 () Bool)

(declare-fun e!726012 () Bool)

(declare-datatypes ((V!49267 0))(
  ( (V!49268 (val!16602 Int)) )
))
(declare-datatypes ((ValueCell!15674 0))(
  ( (ValueCellFull!15674 (v!19238 V!49267)) (EmptyCell!15674) )
))
(declare-datatypes ((array!83269 0))(
  ( (array!83270 (arr!40166 (Array (_ BitVec 32) ValueCell!15674)) (size!40707 (_ BitVec 32))) )
))
(declare-datatypes ((array!83271 0))(
  ( (array!83272 (arr!40167 (Array (_ BitVec 32) (_ BitVec 64))) (size!40708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6112 0))(
  ( (LongMapFixedSize!6113 (defaultEntry!6702 Int) (mask!34456 (_ BitVec 32)) (extraKeys!6381 (_ BitVec 32)) (zeroValue!6487 V!49267) (minValue!6487 V!49267) (_size!3111 (_ BitVec 32)) (_keys!12107 array!83271) (_values!6725 array!83269) (_vacant!3111 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6112)

(assert (=> b!1272719 (= e!726012 (and (= (size!40707 (_values!6725 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34456 thiss!1559))) (= (size!40708 (_keys!12107 thiss!1559)) (size!40707 (_values!6725 thiss!1559))) (bvsge (mask!34456 thiss!1559) #b00000000000000000000000000000000) (bvslt (extraKeys!6381 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272720 () Bool)

(declare-fun e!726009 () Bool)

(declare-fun e!726014 () Bool)

(declare-fun mapRes!51184 () Bool)

(assert (=> b!1272720 (= e!726009 (and e!726014 mapRes!51184))))

(declare-fun condMapEmpty!51184 () Bool)

(declare-fun mapDefault!51184 () ValueCell!15674)

(assert (=> b!1272720 (= condMapEmpty!51184 (= (arr!40166 (_values!6725 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15674)) mapDefault!51184)))))

(declare-fun tp_is_empty!33055 () Bool)

(declare-fun e!726011 () Bool)

(declare-fun array_inv!30699 (array!83271) Bool)

(declare-fun array_inv!30700 (array!83269) Bool)

(assert (=> b!1272721 (= e!726011 (and tp!97583 tp_is_empty!33055 (array_inv!30699 (_keys!12107 thiss!1559)) (array_inv!30700 (_values!6725 thiss!1559)) e!726009))))

(declare-fun mapNonEmpty!51184 () Bool)

(declare-fun tp!97582 () Bool)

(declare-fun e!726010 () Bool)

(assert (=> mapNonEmpty!51184 (= mapRes!51184 (and tp!97582 e!726010))))

(declare-fun mapValue!51184 () ValueCell!15674)

(declare-fun mapRest!51184 () (Array (_ BitVec 32) ValueCell!15674))

(declare-fun mapKey!51184 () (_ BitVec 32))

(assert (=> mapNonEmpty!51184 (= (arr!40166 (_values!6725 thiss!1559)) (store mapRest!51184 mapKey!51184 mapValue!51184))))

(declare-fun b!1272722 () Bool)

(assert (=> b!1272722 (= e!726014 tp_is_empty!33055)))

(declare-fun res!846519 () Bool)

(assert (=> start!107448 (=> (not res!846519) (not e!726012))))

(declare-fun valid!2285 (LongMapFixedSize!6112) Bool)

(assert (=> start!107448 (= res!846519 (valid!2285 thiss!1559))))

(assert (=> start!107448 e!726012))

(assert (=> start!107448 e!726011))

(declare-fun b!1272723 () Bool)

(declare-fun res!846518 () Bool)

(assert (=> b!1272723 (=> (not res!846518) (not e!726012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272723 (= res!846518 (validMask!0 (mask!34456 thiss!1559)))))

(declare-fun mapIsEmpty!51184 () Bool)

(assert (=> mapIsEmpty!51184 mapRes!51184))

(declare-fun b!1272724 () Bool)

(assert (=> b!1272724 (= e!726010 tp_is_empty!33055)))

(assert (= (and start!107448 res!846519) b!1272723))

(assert (= (and b!1272723 res!846518) b!1272719))

(assert (= (and b!1272720 condMapEmpty!51184) mapIsEmpty!51184))

(assert (= (and b!1272720 (not condMapEmpty!51184)) mapNonEmpty!51184))

(get-info :version)

(assert (= (and mapNonEmpty!51184 ((_ is ValueCellFull!15674) mapValue!51184)) b!1272724))

(assert (= (and b!1272720 ((_ is ValueCellFull!15674) mapDefault!51184)) b!1272722))

(assert (= b!1272721 b!1272720))

(assert (= start!107448 b!1272721))

(declare-fun m!1169785 () Bool)

(assert (=> b!1272721 m!1169785))

(declare-fun m!1169787 () Bool)

(assert (=> b!1272721 m!1169787))

(declare-fun m!1169789 () Bool)

(assert (=> mapNonEmpty!51184 m!1169789))

(declare-fun m!1169791 () Bool)

(assert (=> start!107448 m!1169791))

(declare-fun m!1169793 () Bool)

(assert (=> b!1272723 m!1169793))

(check-sat tp_is_empty!33055 (not start!107448) (not mapNonEmpty!51184) b_and!45723 (not b!1272721) (not b_next!27685) (not b!1272723))
(check-sat b_and!45723 (not b_next!27685))
(get-model)

(declare-fun d!139797 () Bool)

(declare-fun res!846538 () Bool)

(declare-fun e!726053 () Bool)

(assert (=> d!139797 (=> (not res!846538) (not e!726053))))

(declare-fun simpleValid!459 (LongMapFixedSize!6112) Bool)

(assert (=> d!139797 (= res!846538 (simpleValid!459 thiss!1559))))

(assert (=> d!139797 (= (valid!2285 thiss!1559) e!726053)))

(declare-fun b!1272767 () Bool)

(declare-fun res!846539 () Bool)

(assert (=> b!1272767 (=> (not res!846539) (not e!726053))))

(declare-fun arrayCountValidKeys!0 (array!83271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272767 (= res!846539 (= (arrayCountValidKeys!0 (_keys!12107 thiss!1559) #b00000000000000000000000000000000 (size!40708 (_keys!12107 thiss!1559))) (_size!3111 thiss!1559)))))

(declare-fun b!1272768 () Bool)

(declare-fun res!846540 () Bool)

(assert (=> b!1272768 (=> (not res!846540) (not e!726053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83271 (_ BitVec 32)) Bool)

(assert (=> b!1272768 (= res!846540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12107 thiss!1559) (mask!34456 thiss!1559)))))

(declare-fun b!1272769 () Bool)

(declare-datatypes ((List!28634 0))(
  ( (Nil!28631) (Cons!28630 (h!29839 (_ BitVec 64)) (t!42159 List!28634)) )
))
(declare-fun arrayNoDuplicates!0 (array!83271 (_ BitVec 32) List!28634) Bool)

(assert (=> b!1272769 (= e!726053 (arrayNoDuplicates!0 (_keys!12107 thiss!1559) #b00000000000000000000000000000000 Nil!28631))))

(assert (= (and d!139797 res!846538) b!1272767))

(assert (= (and b!1272767 res!846539) b!1272768))

(assert (= (and b!1272768 res!846540) b!1272769))

(declare-fun m!1169815 () Bool)

(assert (=> d!139797 m!1169815))

(declare-fun m!1169817 () Bool)

(assert (=> b!1272767 m!1169817))

(declare-fun m!1169819 () Bool)

(assert (=> b!1272768 m!1169819))

(declare-fun m!1169821 () Bool)

(assert (=> b!1272769 m!1169821))

(assert (=> start!107448 d!139797))

(declare-fun d!139799 () Bool)

(assert (=> d!139799 (= (array_inv!30699 (_keys!12107 thiss!1559)) (bvsge (size!40708 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272721 d!139799))

(declare-fun d!139801 () Bool)

(assert (=> d!139801 (= (array_inv!30700 (_values!6725 thiss!1559)) (bvsge (size!40707 (_values!6725 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272721 d!139801))

(declare-fun d!139803 () Bool)

(assert (=> d!139803 (= (validMask!0 (mask!34456 thiss!1559)) (and (or (= (mask!34456 thiss!1559) #b00000000000000000000000000000111) (= (mask!34456 thiss!1559) #b00000000000000000000000000001111) (= (mask!34456 thiss!1559) #b00000000000000000000000000011111) (= (mask!34456 thiss!1559) #b00000000000000000000000000111111) (= (mask!34456 thiss!1559) #b00000000000000000000000001111111) (= (mask!34456 thiss!1559) #b00000000000000000000000011111111) (= (mask!34456 thiss!1559) #b00000000000000000000000111111111) (= (mask!34456 thiss!1559) #b00000000000000000000001111111111) (= (mask!34456 thiss!1559) #b00000000000000000000011111111111) (= (mask!34456 thiss!1559) #b00000000000000000000111111111111) (= (mask!34456 thiss!1559) #b00000000000000000001111111111111) (= (mask!34456 thiss!1559) #b00000000000000000011111111111111) (= (mask!34456 thiss!1559) #b00000000000000000111111111111111) (= (mask!34456 thiss!1559) #b00000000000000001111111111111111) (= (mask!34456 thiss!1559) #b00000000000000011111111111111111) (= (mask!34456 thiss!1559) #b00000000000000111111111111111111) (= (mask!34456 thiss!1559) #b00000000000001111111111111111111) (= (mask!34456 thiss!1559) #b00000000000011111111111111111111) (= (mask!34456 thiss!1559) #b00000000000111111111111111111111) (= (mask!34456 thiss!1559) #b00000000001111111111111111111111) (= (mask!34456 thiss!1559) #b00000000011111111111111111111111) (= (mask!34456 thiss!1559) #b00000000111111111111111111111111) (= (mask!34456 thiss!1559) #b00000001111111111111111111111111) (= (mask!34456 thiss!1559) #b00000011111111111111111111111111) (= (mask!34456 thiss!1559) #b00000111111111111111111111111111) (= (mask!34456 thiss!1559) #b00001111111111111111111111111111) (= (mask!34456 thiss!1559) #b00011111111111111111111111111111) (= (mask!34456 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34456 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272723 d!139803))

(declare-fun b!1272776 () Bool)

(declare-fun e!726058 () Bool)

(assert (=> b!1272776 (= e!726058 tp_is_empty!33055)))

(declare-fun mapNonEmpty!51193 () Bool)

(declare-fun mapRes!51193 () Bool)

(declare-fun tp!97598 () Bool)

(assert (=> mapNonEmpty!51193 (= mapRes!51193 (and tp!97598 e!726058))))

(declare-fun mapValue!51193 () ValueCell!15674)

(declare-fun mapRest!51193 () (Array (_ BitVec 32) ValueCell!15674))

(declare-fun mapKey!51193 () (_ BitVec 32))

(assert (=> mapNonEmpty!51193 (= mapRest!51184 (store mapRest!51193 mapKey!51193 mapValue!51193))))

(declare-fun mapIsEmpty!51193 () Bool)

(assert (=> mapIsEmpty!51193 mapRes!51193))

(declare-fun condMapEmpty!51193 () Bool)

(declare-fun mapDefault!51193 () ValueCell!15674)

(assert (=> mapNonEmpty!51184 (= condMapEmpty!51193 (= mapRest!51184 ((as const (Array (_ BitVec 32) ValueCell!15674)) mapDefault!51193)))))

(declare-fun e!726059 () Bool)

(assert (=> mapNonEmpty!51184 (= tp!97582 (and e!726059 mapRes!51193))))

(declare-fun b!1272777 () Bool)

(assert (=> b!1272777 (= e!726059 tp_is_empty!33055)))

(assert (= (and mapNonEmpty!51184 condMapEmpty!51193) mapIsEmpty!51193))

(assert (= (and mapNonEmpty!51184 (not condMapEmpty!51193)) mapNonEmpty!51193))

(assert (= (and mapNonEmpty!51193 ((_ is ValueCellFull!15674) mapValue!51193)) b!1272776))

(assert (= (and mapNonEmpty!51184 ((_ is ValueCellFull!15674) mapDefault!51193)) b!1272777))

(declare-fun m!1169823 () Bool)

(assert (=> mapNonEmpty!51193 m!1169823))

(check-sat (not b_next!27685) (not d!139797) b_and!45723 (not mapNonEmpty!51193) (not b!1272767) (not b!1272769) (not b!1272768) tp_is_empty!33055)
(check-sat b_and!45723 (not b_next!27685))
(get-model)

(declare-fun b!1272786 () Bool)

(declare-fun e!726065 () (_ BitVec 32))

(assert (=> b!1272786 (= e!726065 #b00000000000000000000000000000000)))

(declare-fun bm!62545 () Bool)

(declare-fun call!62548 () (_ BitVec 32))

(assert (=> bm!62545 (= call!62548 (arrayCountValidKeys!0 (_keys!12107 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40708 (_keys!12107 thiss!1559))))))

(declare-fun b!1272787 () Bool)

(declare-fun e!726064 () (_ BitVec 32))

(assert (=> b!1272787 (= e!726064 call!62548)))

(declare-fun b!1272788 () Bool)

(assert (=> b!1272788 (= e!726064 (bvadd #b00000000000000000000000000000001 call!62548))))

(declare-fun b!1272789 () Bool)

(assert (=> b!1272789 (= e!726065 e!726064)))

(declare-fun c!123709 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272789 (= c!123709 (validKeyInArray!0 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139805 () Bool)

(declare-fun lt!574905 () (_ BitVec 32))

(assert (=> d!139805 (and (bvsge lt!574905 #b00000000000000000000000000000000) (bvsle lt!574905 (bvsub (size!40708 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139805 (= lt!574905 e!726065)))

(declare-fun c!123710 () Bool)

(assert (=> d!139805 (= c!123710 (bvsge #b00000000000000000000000000000000 (size!40708 (_keys!12107 thiss!1559))))))

(assert (=> d!139805 (and (bvsle #b00000000000000000000000000000000 (size!40708 (_keys!12107 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40708 (_keys!12107 thiss!1559)) (size!40708 (_keys!12107 thiss!1559))))))

(assert (=> d!139805 (= (arrayCountValidKeys!0 (_keys!12107 thiss!1559) #b00000000000000000000000000000000 (size!40708 (_keys!12107 thiss!1559))) lt!574905)))

(assert (= (and d!139805 c!123710) b!1272786))

(assert (= (and d!139805 (not c!123710)) b!1272789))

(assert (= (and b!1272789 c!123709) b!1272788))

(assert (= (and b!1272789 (not c!123709)) b!1272787))

(assert (= (or b!1272788 b!1272787) bm!62545))

(declare-fun m!1169825 () Bool)

(assert (=> bm!62545 m!1169825))

(declare-fun m!1169827 () Bool)

(assert (=> b!1272789 m!1169827))

(assert (=> b!1272789 m!1169827))

(declare-fun m!1169829 () Bool)

(assert (=> b!1272789 m!1169829))

(assert (=> b!1272767 d!139805))

(declare-fun b!1272800 () Bool)

(declare-fun e!726075 () Bool)

(declare-fun contains!7640 (List!28634 (_ BitVec 64)) Bool)

(assert (=> b!1272800 (= e!726075 (contains!7640 Nil!28631 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272801 () Bool)

(declare-fun e!726077 () Bool)

(declare-fun call!62551 () Bool)

(assert (=> b!1272801 (= e!726077 call!62551)))

(declare-fun b!1272802 () Bool)

(assert (=> b!1272802 (= e!726077 call!62551)))

(declare-fun b!1272803 () Bool)

(declare-fun e!726074 () Bool)

(assert (=> b!1272803 (= e!726074 e!726077)))

(declare-fun c!123713 () Bool)

(assert (=> b!1272803 (= c!123713 (validKeyInArray!0 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272804 () Bool)

(declare-fun e!726076 () Bool)

(assert (=> b!1272804 (= e!726076 e!726074)))

(declare-fun res!846549 () Bool)

(assert (=> b!1272804 (=> (not res!846549) (not e!726074))))

(assert (=> b!1272804 (= res!846549 (not e!726075))))

(declare-fun res!846547 () Bool)

(assert (=> b!1272804 (=> (not res!846547) (not e!726075))))

(assert (=> b!1272804 (= res!846547 (validKeyInArray!0 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62548 () Bool)

(assert (=> bm!62548 (= call!62551 (arrayNoDuplicates!0 (_keys!12107 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123713 (Cons!28630 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000) Nil!28631) Nil!28631)))))

(declare-fun d!139807 () Bool)

(declare-fun res!846548 () Bool)

(assert (=> d!139807 (=> res!846548 e!726076)))

(assert (=> d!139807 (= res!846548 (bvsge #b00000000000000000000000000000000 (size!40708 (_keys!12107 thiss!1559))))))

(assert (=> d!139807 (= (arrayNoDuplicates!0 (_keys!12107 thiss!1559) #b00000000000000000000000000000000 Nil!28631) e!726076)))

(assert (= (and d!139807 (not res!846548)) b!1272804))

(assert (= (and b!1272804 res!846547) b!1272800))

(assert (= (and b!1272804 res!846549) b!1272803))

(assert (= (and b!1272803 c!123713) b!1272801))

(assert (= (and b!1272803 (not c!123713)) b!1272802))

(assert (= (or b!1272801 b!1272802) bm!62548))

(assert (=> b!1272800 m!1169827))

(assert (=> b!1272800 m!1169827))

(declare-fun m!1169831 () Bool)

(assert (=> b!1272800 m!1169831))

(assert (=> b!1272803 m!1169827))

(assert (=> b!1272803 m!1169827))

(assert (=> b!1272803 m!1169829))

(assert (=> b!1272804 m!1169827))

(assert (=> b!1272804 m!1169827))

(assert (=> b!1272804 m!1169829))

(assert (=> bm!62548 m!1169827))

(declare-fun m!1169833 () Bool)

(assert (=> bm!62548 m!1169833))

(assert (=> b!1272769 d!139807))

(declare-fun bm!62551 () Bool)

(declare-fun call!62554 () Bool)

(assert (=> bm!62551 (= call!62554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12107 thiss!1559) (mask!34456 thiss!1559)))))

(declare-fun b!1272814 () Bool)

(declare-fun e!726086 () Bool)

(assert (=> b!1272814 (= e!726086 call!62554)))

(declare-fun b!1272815 () Bool)

(declare-fun e!726085 () Bool)

(assert (=> b!1272815 (= e!726085 e!726086)))

(declare-fun lt!574912 () (_ BitVec 64))

(assert (=> b!1272815 (= lt!574912 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42170 0))(
  ( (Unit!42171) )
))
(declare-fun lt!574914 () Unit!42170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83271 (_ BitVec 64) (_ BitVec 32)) Unit!42170)

(assert (=> b!1272815 (= lt!574914 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12107 thiss!1559) lt!574912 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272815 (arrayContainsKey!0 (_keys!12107 thiss!1559) lt!574912 #b00000000000000000000000000000000)))

(declare-fun lt!574913 () Unit!42170)

(assert (=> b!1272815 (= lt!574913 lt!574914)))

(declare-fun res!846554 () Bool)

(declare-datatypes ((SeekEntryResult!9991 0))(
  ( (MissingZero!9991 (index!42335 (_ BitVec 32))) (Found!9991 (index!42336 (_ BitVec 32))) (Intermediate!9991 (undefined!10803 Bool) (index!42337 (_ BitVec 32)) (x!112491 (_ BitVec 32))) (Undefined!9991) (MissingVacant!9991 (index!42338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83271 (_ BitVec 32)) SeekEntryResult!9991)

(assert (=> b!1272815 (= res!846554 (= (seekEntryOrOpen!0 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000) (_keys!12107 thiss!1559) (mask!34456 thiss!1559)) (Found!9991 #b00000000000000000000000000000000)))))

(assert (=> b!1272815 (=> (not res!846554) (not e!726086))))

(declare-fun b!1272816 () Bool)

(declare-fun e!726084 () Bool)

(assert (=> b!1272816 (= e!726084 e!726085)))

(declare-fun c!123716 () Bool)

(assert (=> b!1272816 (= c!123716 (validKeyInArray!0 (select (arr!40167 (_keys!12107 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272813 () Bool)

(assert (=> b!1272813 (= e!726085 call!62554)))

(declare-fun d!139809 () Bool)

(declare-fun res!846555 () Bool)

(assert (=> d!139809 (=> res!846555 e!726084)))

(assert (=> d!139809 (= res!846555 (bvsge #b00000000000000000000000000000000 (size!40708 (_keys!12107 thiss!1559))))))

(assert (=> d!139809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12107 thiss!1559) (mask!34456 thiss!1559)) e!726084)))

(assert (= (and d!139809 (not res!846555)) b!1272816))

(assert (= (and b!1272816 c!123716) b!1272815))

(assert (= (and b!1272816 (not c!123716)) b!1272813))

(assert (= (and b!1272815 res!846554) b!1272814))

(assert (= (or b!1272814 b!1272813) bm!62551))

(declare-fun m!1169835 () Bool)

(assert (=> bm!62551 m!1169835))

(assert (=> b!1272815 m!1169827))

(declare-fun m!1169837 () Bool)

(assert (=> b!1272815 m!1169837))

(declare-fun m!1169839 () Bool)

(assert (=> b!1272815 m!1169839))

(assert (=> b!1272815 m!1169827))

(declare-fun m!1169841 () Bool)

(assert (=> b!1272815 m!1169841))

(assert (=> b!1272816 m!1169827))

(assert (=> b!1272816 m!1169827))

(assert (=> b!1272816 m!1169829))

(assert (=> b!1272768 d!139809))

(declare-fun b!1272826 () Bool)

(declare-fun res!846567 () Bool)

(declare-fun e!726089 () Bool)

(assert (=> b!1272826 (=> (not res!846567) (not e!726089))))

(declare-fun size!40713 (LongMapFixedSize!6112) (_ BitVec 32))

(assert (=> b!1272826 (= res!846567 (bvsge (size!40713 thiss!1559) (_size!3111 thiss!1559)))))

(declare-fun b!1272828 () Bool)

(assert (=> b!1272828 (= e!726089 (and (bvsge (extraKeys!6381 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6381 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3111 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272827 () Bool)

(declare-fun res!846564 () Bool)

(assert (=> b!1272827 (=> (not res!846564) (not e!726089))))

(assert (=> b!1272827 (= res!846564 (= (size!40713 thiss!1559) (bvadd (_size!3111 thiss!1559) (bvsdiv (bvadd (extraKeys!6381 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!139811 () Bool)

(declare-fun res!846566 () Bool)

(assert (=> d!139811 (=> (not res!846566) (not e!726089))))

(assert (=> d!139811 (= res!846566 (validMask!0 (mask!34456 thiss!1559)))))

(assert (=> d!139811 (= (simpleValid!459 thiss!1559) e!726089)))

(declare-fun b!1272825 () Bool)

(declare-fun res!846565 () Bool)

(assert (=> b!1272825 (=> (not res!846565) (not e!726089))))

(assert (=> b!1272825 (= res!846565 (and (= (size!40707 (_values!6725 thiss!1559)) (bvadd (mask!34456 thiss!1559) #b00000000000000000000000000000001)) (= (size!40708 (_keys!12107 thiss!1559)) (size!40707 (_values!6725 thiss!1559))) (bvsge (_size!3111 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3111 thiss!1559) (bvadd (mask!34456 thiss!1559) #b00000000000000000000000000000001))))))

(assert (= (and d!139811 res!846566) b!1272825))

(assert (= (and b!1272825 res!846565) b!1272826))

(assert (= (and b!1272826 res!846567) b!1272827))

(assert (= (and b!1272827 res!846564) b!1272828))

(declare-fun m!1169843 () Bool)

(assert (=> b!1272826 m!1169843))

(assert (=> b!1272827 m!1169843))

(assert (=> d!139811 m!1169793))

(assert (=> d!139797 d!139811))

(declare-fun b!1272829 () Bool)

(declare-fun e!726090 () Bool)

(assert (=> b!1272829 (= e!726090 tp_is_empty!33055)))

(declare-fun mapNonEmpty!51194 () Bool)

(declare-fun mapRes!51194 () Bool)

(declare-fun tp!97599 () Bool)

(assert (=> mapNonEmpty!51194 (= mapRes!51194 (and tp!97599 e!726090))))

(declare-fun mapRest!51194 () (Array (_ BitVec 32) ValueCell!15674))

(declare-fun mapKey!51194 () (_ BitVec 32))

(declare-fun mapValue!51194 () ValueCell!15674)

(assert (=> mapNonEmpty!51194 (= mapRest!51193 (store mapRest!51194 mapKey!51194 mapValue!51194))))

(declare-fun mapIsEmpty!51194 () Bool)

(assert (=> mapIsEmpty!51194 mapRes!51194))

(declare-fun condMapEmpty!51194 () Bool)

(declare-fun mapDefault!51194 () ValueCell!15674)

(assert (=> mapNonEmpty!51193 (= condMapEmpty!51194 (= mapRest!51193 ((as const (Array (_ BitVec 32) ValueCell!15674)) mapDefault!51194)))))

(declare-fun e!726091 () Bool)

(assert (=> mapNonEmpty!51193 (= tp!97598 (and e!726091 mapRes!51194))))

(declare-fun b!1272830 () Bool)

(assert (=> b!1272830 (= e!726091 tp_is_empty!33055)))

(assert (= (and mapNonEmpty!51193 condMapEmpty!51194) mapIsEmpty!51194))

(assert (= (and mapNonEmpty!51193 (not condMapEmpty!51194)) mapNonEmpty!51194))

(assert (= (and mapNonEmpty!51194 ((_ is ValueCellFull!15674) mapValue!51194)) b!1272829))

(assert (= (and mapNonEmpty!51193 ((_ is ValueCellFull!15674) mapDefault!51194)) b!1272830))

(declare-fun m!1169845 () Bool)

(assert (=> mapNonEmpty!51194 m!1169845))

(check-sat (not b!1272803) tp_is_empty!33055 b_and!45723 (not b!1272800) (not mapNonEmpty!51194) (not b!1272816) (not bm!62548) (not bm!62551) (not b!1272815) (not d!139811) (not b_next!27685) (not b!1272804) (not b!1272827) (not b!1272826) (not b!1272789) (not bm!62545))
(check-sat b_and!45723 (not b_next!27685))
