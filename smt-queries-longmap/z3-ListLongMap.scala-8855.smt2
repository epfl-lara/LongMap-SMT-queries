; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107414 () Bool)

(assert start!107414)

(declare-fun b!1272609 () Bool)

(declare-fun b_free!27675 () Bool)

(declare-fun b_next!27675 () Bool)

(assert (=> b!1272609 (= b_free!27675 (not b_next!27675))))

(declare-fun tp!97544 () Bool)

(declare-fun b_and!45731 () Bool)

(assert (=> b!1272609 (= tp!97544 b_and!45731)))

(declare-fun b!1272606 () Bool)

(declare-fun e!725898 () Bool)

(declare-fun tp_is_empty!33045 () Bool)

(assert (=> b!1272606 (= e!725898 tp_is_empty!33045)))

(declare-fun mapIsEmpty!51162 () Bool)

(declare-fun mapRes!51162 () Bool)

(assert (=> mapIsEmpty!51162 mapRes!51162))

(declare-fun b!1272608 () Bool)

(declare-fun res!846470 () Bool)

(declare-fun e!725902 () Bool)

(assert (=> b!1272608 (=> (not res!846470) (not e!725902))))

(declare-datatypes ((V!49253 0))(
  ( (V!49254 (val!16597 Int)) )
))
(declare-datatypes ((ValueCell!15669 0))(
  ( (ValueCellFull!15669 (v!19234 V!49253)) (EmptyCell!15669) )
))
(declare-datatypes ((array!83346 0))(
  ( (array!83347 (arr!40206 (Array (_ BitVec 32) ValueCell!15669)) (size!40744 (_ BitVec 32))) )
))
(declare-datatypes ((array!83348 0))(
  ( (array!83349 (arr!40207 (Array (_ BitVec 32) (_ BitVec 64))) (size!40745 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6102 0))(
  ( (LongMapFixedSize!6103 (defaultEntry!6697 Int) (mask!34449 (_ BitVec 32)) (extraKeys!6376 (_ BitVec 32)) (zeroValue!6482 V!49253) (minValue!6482 V!49253) (_size!3106 (_ BitVec 32)) (_keys!12105 array!83348) (_values!6720 array!83346) (_vacant!3106 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6102)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272608 (= res!846470 (validMask!0 (mask!34449 thiss!1559)))))

(declare-fun e!725901 () Bool)

(declare-fun e!725900 () Bool)

(declare-fun array_inv!30579 (array!83348) Bool)

(declare-fun array_inv!30580 (array!83346) Bool)

(assert (=> b!1272609 (= e!725900 (and tp!97544 tp_is_empty!33045 (array_inv!30579 (_keys!12105 thiss!1559)) (array_inv!30580 (_values!6720 thiss!1559)) e!725901))))

(declare-fun b!1272610 () Bool)

(assert (=> b!1272610 (= e!725901 (and e!725898 mapRes!51162))))

(declare-fun condMapEmpty!51162 () Bool)

(declare-fun mapDefault!51162 () ValueCell!15669)

(assert (=> b!1272610 (= condMapEmpty!51162 (= (arr!40206 (_values!6720 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15669)) mapDefault!51162)))))

(declare-fun res!846471 () Bool)

(assert (=> start!107414 (=> (not res!846471) (not e!725902))))

(declare-fun valid!2289 (LongMapFixedSize!6102) Bool)

(assert (=> start!107414 (= res!846471 (valid!2289 thiss!1559))))

(assert (=> start!107414 e!725902))

(assert (=> start!107414 e!725900))

(declare-fun b!1272607 () Bool)

(declare-fun e!725903 () Bool)

(assert (=> b!1272607 (= e!725903 tp_is_empty!33045)))

(declare-fun b!1272611 () Bool)

(assert (=> b!1272611 (= e!725902 (and (= (size!40744 (_values!6720 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34449 thiss!1559))) (not (= (size!40745 (_keys!12105 thiss!1559)) (size!40744 (_values!6720 thiss!1559))))))))

(declare-fun mapNonEmpty!51162 () Bool)

(declare-fun tp!97545 () Bool)

(assert (=> mapNonEmpty!51162 (= mapRes!51162 (and tp!97545 e!725903))))

(declare-fun mapValue!51162 () ValueCell!15669)

(declare-fun mapKey!51162 () (_ BitVec 32))

(declare-fun mapRest!51162 () (Array (_ BitVec 32) ValueCell!15669))

(assert (=> mapNonEmpty!51162 (= (arr!40206 (_values!6720 thiss!1559)) (store mapRest!51162 mapKey!51162 mapValue!51162))))

(assert (= (and start!107414 res!846471) b!1272608))

(assert (= (and b!1272608 res!846470) b!1272611))

(assert (= (and b!1272610 condMapEmpty!51162) mapIsEmpty!51162))

(assert (= (and b!1272610 (not condMapEmpty!51162)) mapNonEmpty!51162))

(get-info :version)

(assert (= (and mapNonEmpty!51162 ((_ is ValueCellFull!15669) mapValue!51162)) b!1272607))

(assert (= (and b!1272610 ((_ is ValueCellFull!15669) mapDefault!51162)) b!1272606))

(assert (= b!1272609 b!1272610))

(assert (= start!107414 b!1272609))

(declare-fun m!1170193 () Bool)

(assert (=> b!1272608 m!1170193))

(declare-fun m!1170195 () Bool)

(assert (=> b!1272609 m!1170195))

(declare-fun m!1170197 () Bool)

(assert (=> b!1272609 m!1170197))

(declare-fun m!1170199 () Bool)

(assert (=> start!107414 m!1170199))

(declare-fun m!1170201 () Bool)

(assert (=> mapNonEmpty!51162 m!1170201))

(check-sat (not mapNonEmpty!51162) (not b!1272608) (not b!1272609) (not start!107414) (not b_next!27675) tp_is_empty!33045 b_and!45731)
(check-sat b_and!45731 (not b_next!27675))
(get-model)

(declare-fun d!139881 () Bool)

(assert (=> d!139881 (= (validMask!0 (mask!34449 thiss!1559)) (and (or (= (mask!34449 thiss!1559) #b00000000000000000000000000000111) (= (mask!34449 thiss!1559) #b00000000000000000000000000001111) (= (mask!34449 thiss!1559) #b00000000000000000000000000011111) (= (mask!34449 thiss!1559) #b00000000000000000000000000111111) (= (mask!34449 thiss!1559) #b00000000000000000000000001111111) (= (mask!34449 thiss!1559) #b00000000000000000000000011111111) (= (mask!34449 thiss!1559) #b00000000000000000000000111111111) (= (mask!34449 thiss!1559) #b00000000000000000000001111111111) (= (mask!34449 thiss!1559) #b00000000000000000000011111111111) (= (mask!34449 thiss!1559) #b00000000000000000000111111111111) (= (mask!34449 thiss!1559) #b00000000000000000001111111111111) (= (mask!34449 thiss!1559) #b00000000000000000011111111111111) (= (mask!34449 thiss!1559) #b00000000000000000111111111111111) (= (mask!34449 thiss!1559) #b00000000000000001111111111111111) (= (mask!34449 thiss!1559) #b00000000000000011111111111111111) (= (mask!34449 thiss!1559) #b00000000000000111111111111111111) (= (mask!34449 thiss!1559) #b00000000000001111111111111111111) (= (mask!34449 thiss!1559) #b00000000000011111111111111111111) (= (mask!34449 thiss!1559) #b00000000000111111111111111111111) (= (mask!34449 thiss!1559) #b00000000001111111111111111111111) (= (mask!34449 thiss!1559) #b00000000011111111111111111111111) (= (mask!34449 thiss!1559) #b00000000111111111111111111111111) (= (mask!34449 thiss!1559) #b00000001111111111111111111111111) (= (mask!34449 thiss!1559) #b00000011111111111111111111111111) (= (mask!34449 thiss!1559) #b00000111111111111111111111111111) (= (mask!34449 thiss!1559) #b00001111111111111111111111111111) (= (mask!34449 thiss!1559) #b00011111111111111111111111111111) (= (mask!34449 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34449 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272608 d!139881))

(declare-fun d!139883 () Bool)

(declare-fun res!846484 () Bool)

(declare-fun e!725924 () Bool)

(assert (=> d!139883 (=> (not res!846484) (not e!725924))))

(declare-fun simpleValid!457 (LongMapFixedSize!6102) Bool)

(assert (=> d!139883 (= res!846484 (simpleValid!457 thiss!1559))))

(assert (=> d!139883 (= (valid!2289 thiss!1559) e!725924)))

(declare-fun b!1272636 () Bool)

(declare-fun res!846485 () Bool)

(assert (=> b!1272636 (=> (not res!846485) (not e!725924))))

(declare-fun arrayCountValidKeys!0 (array!83348 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272636 (= res!846485 (= (arrayCountValidKeys!0 (_keys!12105 thiss!1559) #b00000000000000000000000000000000 (size!40745 (_keys!12105 thiss!1559))) (_size!3106 thiss!1559)))))

(declare-fun b!1272637 () Bool)

(declare-fun res!846486 () Bool)

(assert (=> b!1272637 (=> (not res!846486) (not e!725924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83348 (_ BitVec 32)) Bool)

(assert (=> b!1272637 (= res!846486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12105 thiss!1559) (mask!34449 thiss!1559)))))

(declare-fun b!1272638 () Bool)

(declare-datatypes ((List!28560 0))(
  ( (Nil!28557) (Cons!28556 (h!29765 (_ BitVec 64)) (t!42093 List!28560)) )
))
(declare-fun arrayNoDuplicates!0 (array!83348 (_ BitVec 32) List!28560) Bool)

(assert (=> b!1272638 (= e!725924 (arrayNoDuplicates!0 (_keys!12105 thiss!1559) #b00000000000000000000000000000000 Nil!28557))))

(assert (= (and d!139883 res!846484) b!1272636))

(assert (= (and b!1272636 res!846485) b!1272637))

(assert (= (and b!1272637 res!846486) b!1272638))

(declare-fun m!1170213 () Bool)

(assert (=> d!139883 m!1170213))

(declare-fun m!1170215 () Bool)

(assert (=> b!1272636 m!1170215))

(declare-fun m!1170217 () Bool)

(assert (=> b!1272637 m!1170217))

(declare-fun m!1170219 () Bool)

(assert (=> b!1272638 m!1170219))

(assert (=> start!107414 d!139883))

(declare-fun d!139885 () Bool)

(assert (=> d!139885 (= (array_inv!30579 (_keys!12105 thiss!1559)) (bvsge (size!40745 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272609 d!139885))

(declare-fun d!139887 () Bool)

(assert (=> d!139887 (= (array_inv!30580 (_values!6720 thiss!1559)) (bvsge (size!40744 (_values!6720 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272609 d!139887))

(declare-fun b!1272645 () Bool)

(declare-fun e!725929 () Bool)

(assert (=> b!1272645 (= e!725929 tp_is_empty!33045)))

(declare-fun b!1272646 () Bool)

(declare-fun e!725930 () Bool)

(assert (=> b!1272646 (= e!725930 tp_is_empty!33045)))

(declare-fun condMapEmpty!51168 () Bool)

(declare-fun mapDefault!51168 () ValueCell!15669)

(assert (=> mapNonEmpty!51162 (= condMapEmpty!51168 (= mapRest!51162 ((as const (Array (_ BitVec 32) ValueCell!15669)) mapDefault!51168)))))

(declare-fun mapRes!51168 () Bool)

(assert (=> mapNonEmpty!51162 (= tp!97545 (and e!725930 mapRes!51168))))

(declare-fun mapIsEmpty!51168 () Bool)

(assert (=> mapIsEmpty!51168 mapRes!51168))

(declare-fun mapNonEmpty!51168 () Bool)

(declare-fun tp!97554 () Bool)

(assert (=> mapNonEmpty!51168 (= mapRes!51168 (and tp!97554 e!725929))))

(declare-fun mapRest!51168 () (Array (_ BitVec 32) ValueCell!15669))

(declare-fun mapValue!51168 () ValueCell!15669)

(declare-fun mapKey!51168 () (_ BitVec 32))

(assert (=> mapNonEmpty!51168 (= mapRest!51162 (store mapRest!51168 mapKey!51168 mapValue!51168))))

(assert (= (and mapNonEmpty!51162 condMapEmpty!51168) mapIsEmpty!51168))

(assert (= (and mapNonEmpty!51162 (not condMapEmpty!51168)) mapNonEmpty!51168))

(assert (= (and mapNonEmpty!51168 ((_ is ValueCellFull!15669) mapValue!51168)) b!1272645))

(assert (= (and mapNonEmpty!51162 ((_ is ValueCellFull!15669) mapDefault!51168)) b!1272646))

(declare-fun m!1170221 () Bool)

(assert (=> mapNonEmpty!51168 m!1170221))

(check-sat (not b!1272637) (not b!1272638) (not b_next!27675) tp_is_empty!33045 (not d!139883) (not b!1272636) b_and!45731 (not mapNonEmpty!51168))
(check-sat b_and!45731 (not b_next!27675))
(get-model)

(declare-fun b!1272655 () Bool)

(declare-fun e!725937 () Bool)

(declare-fun call!62558 () Bool)

(assert (=> b!1272655 (= e!725937 call!62558)))

(declare-fun b!1272656 () Bool)

(declare-fun e!725939 () Bool)

(assert (=> b!1272656 (= e!725939 call!62558)))

(declare-fun b!1272657 () Bool)

(assert (=> b!1272657 (= e!725939 e!725937)))

(declare-fun lt!575075 () (_ BitVec 64))

(assert (=> b!1272657 (= lt!575075 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42322 0))(
  ( (Unit!42323) )
))
(declare-fun lt!575076 () Unit!42322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83348 (_ BitVec 64) (_ BitVec 32)) Unit!42322)

(assert (=> b!1272657 (= lt!575076 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12105 thiss!1559) lt!575075 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272657 (arrayContainsKey!0 (_keys!12105 thiss!1559) lt!575075 #b00000000000000000000000000000000)))

(declare-fun lt!575077 () Unit!42322)

(assert (=> b!1272657 (= lt!575077 lt!575076)))

(declare-fun res!846492 () Bool)

(declare-datatypes ((SeekEntryResult!9991 0))(
  ( (MissingZero!9991 (index!42335 (_ BitVec 32))) (Found!9991 (index!42336 (_ BitVec 32))) (Intermediate!9991 (undefined!10803 Bool) (index!42337 (_ BitVec 32)) (x!112456 (_ BitVec 32))) (Undefined!9991) (MissingVacant!9991 (index!42338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83348 (_ BitVec 32)) SeekEntryResult!9991)

(assert (=> b!1272657 (= res!846492 (= (seekEntryOrOpen!0 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000) (_keys!12105 thiss!1559) (mask!34449 thiss!1559)) (Found!9991 #b00000000000000000000000000000000)))))

(assert (=> b!1272657 (=> (not res!846492) (not e!725937))))

(declare-fun d!139889 () Bool)

(declare-fun res!846491 () Bool)

(declare-fun e!725938 () Bool)

(assert (=> d!139889 (=> res!846491 e!725938)))

(assert (=> d!139889 (= res!846491 (bvsge #b00000000000000000000000000000000 (size!40745 (_keys!12105 thiss!1559))))))

(assert (=> d!139889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12105 thiss!1559) (mask!34449 thiss!1559)) e!725938)))

(declare-fun bm!62555 () Bool)

(assert (=> bm!62555 (= call!62558 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12105 thiss!1559) (mask!34449 thiss!1559)))))

(declare-fun b!1272658 () Bool)

(assert (=> b!1272658 (= e!725938 e!725939)))

(declare-fun c!123711 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272658 (= c!123711 (validKeyInArray!0 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139889 (not res!846491)) b!1272658))

(assert (= (and b!1272658 c!123711) b!1272657))

(assert (= (and b!1272658 (not c!123711)) b!1272656))

(assert (= (and b!1272657 res!846492) b!1272655))

(assert (= (or b!1272655 b!1272656) bm!62555))

(declare-fun m!1170223 () Bool)

(assert (=> b!1272657 m!1170223))

(declare-fun m!1170225 () Bool)

(assert (=> b!1272657 m!1170225))

(declare-fun m!1170227 () Bool)

(assert (=> b!1272657 m!1170227))

(assert (=> b!1272657 m!1170223))

(declare-fun m!1170229 () Bool)

(assert (=> b!1272657 m!1170229))

(declare-fun m!1170231 () Bool)

(assert (=> bm!62555 m!1170231))

(assert (=> b!1272658 m!1170223))

(assert (=> b!1272658 m!1170223))

(declare-fun m!1170233 () Bool)

(assert (=> b!1272658 m!1170233))

(assert (=> b!1272637 d!139889))

(declare-fun bm!62558 () Bool)

(declare-fun call!62561 () Bool)

(declare-fun c!123714 () Bool)

(assert (=> bm!62558 (= call!62561 (arrayNoDuplicates!0 (_keys!12105 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123714 (Cons!28556 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000) Nil!28557) Nil!28557)))))

(declare-fun b!1272669 () Bool)

(declare-fun e!725950 () Bool)

(declare-fun e!725948 () Bool)

(assert (=> b!1272669 (= e!725950 e!725948)))

(assert (=> b!1272669 (= c!123714 (validKeyInArray!0 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272670 () Bool)

(declare-fun e!725949 () Bool)

(declare-fun contains!7670 (List!28560 (_ BitVec 64)) Bool)

(assert (=> b!1272670 (= e!725949 (contains!7670 Nil!28557 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272671 () Bool)

(assert (=> b!1272671 (= e!725948 call!62561)))

(declare-fun d!139891 () Bool)

(declare-fun res!846499 () Bool)

(declare-fun e!725951 () Bool)

(assert (=> d!139891 (=> res!846499 e!725951)))

(assert (=> d!139891 (= res!846499 (bvsge #b00000000000000000000000000000000 (size!40745 (_keys!12105 thiss!1559))))))

(assert (=> d!139891 (= (arrayNoDuplicates!0 (_keys!12105 thiss!1559) #b00000000000000000000000000000000 Nil!28557) e!725951)))

(declare-fun b!1272672 () Bool)

(assert (=> b!1272672 (= e!725951 e!725950)))

(declare-fun res!846501 () Bool)

(assert (=> b!1272672 (=> (not res!846501) (not e!725950))))

(assert (=> b!1272672 (= res!846501 (not e!725949))))

(declare-fun res!846500 () Bool)

(assert (=> b!1272672 (=> (not res!846500) (not e!725949))))

(assert (=> b!1272672 (= res!846500 (validKeyInArray!0 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272673 () Bool)

(assert (=> b!1272673 (= e!725948 call!62561)))

(assert (= (and d!139891 (not res!846499)) b!1272672))

(assert (= (and b!1272672 res!846500) b!1272670))

(assert (= (and b!1272672 res!846501) b!1272669))

(assert (= (and b!1272669 c!123714) b!1272671))

(assert (= (and b!1272669 (not c!123714)) b!1272673))

(assert (= (or b!1272671 b!1272673) bm!62558))

(assert (=> bm!62558 m!1170223))

(declare-fun m!1170235 () Bool)

(assert (=> bm!62558 m!1170235))

(assert (=> b!1272669 m!1170223))

(assert (=> b!1272669 m!1170223))

(assert (=> b!1272669 m!1170233))

(assert (=> b!1272670 m!1170223))

(assert (=> b!1272670 m!1170223))

(declare-fun m!1170237 () Bool)

(assert (=> b!1272670 m!1170237))

(assert (=> b!1272672 m!1170223))

(assert (=> b!1272672 m!1170223))

(assert (=> b!1272672 m!1170233))

(assert (=> b!1272638 d!139891))

(declare-fun b!1272682 () Bool)

(declare-fun e!725957 () (_ BitVec 32))

(declare-fun e!725956 () (_ BitVec 32))

(assert (=> b!1272682 (= e!725957 e!725956)))

(declare-fun c!123719 () Bool)

(assert (=> b!1272682 (= c!123719 (validKeyInArray!0 (select (arr!40207 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62561 () Bool)

(declare-fun call!62564 () (_ BitVec 32))

(assert (=> bm!62561 (= call!62564 (arrayCountValidKeys!0 (_keys!12105 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40745 (_keys!12105 thiss!1559))))))

(declare-fun b!1272683 () Bool)

(assert (=> b!1272683 (= e!725956 call!62564)))

(declare-fun b!1272684 () Bool)

(assert (=> b!1272684 (= e!725956 (bvadd #b00000000000000000000000000000001 call!62564))))

(declare-fun b!1272685 () Bool)

(assert (=> b!1272685 (= e!725957 #b00000000000000000000000000000000)))

(declare-fun d!139893 () Bool)

(declare-fun lt!575080 () (_ BitVec 32))

(assert (=> d!139893 (and (bvsge lt!575080 #b00000000000000000000000000000000) (bvsle lt!575080 (bvsub (size!40745 (_keys!12105 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139893 (= lt!575080 e!725957)))

(declare-fun c!123720 () Bool)

(assert (=> d!139893 (= c!123720 (bvsge #b00000000000000000000000000000000 (size!40745 (_keys!12105 thiss!1559))))))

(assert (=> d!139893 (and (bvsle #b00000000000000000000000000000000 (size!40745 (_keys!12105 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40745 (_keys!12105 thiss!1559)) (size!40745 (_keys!12105 thiss!1559))))))

(assert (=> d!139893 (= (arrayCountValidKeys!0 (_keys!12105 thiss!1559) #b00000000000000000000000000000000 (size!40745 (_keys!12105 thiss!1559))) lt!575080)))

(assert (= (and d!139893 c!123720) b!1272685))

(assert (= (and d!139893 (not c!123720)) b!1272682))

(assert (= (and b!1272682 c!123719) b!1272684))

(assert (= (and b!1272682 (not c!123719)) b!1272683))

(assert (= (or b!1272684 b!1272683) bm!62561))

(assert (=> b!1272682 m!1170223))

(assert (=> b!1272682 m!1170223))

(assert (=> b!1272682 m!1170233))

(declare-fun m!1170239 () Bool)

(assert (=> bm!62561 m!1170239))

(assert (=> b!1272636 d!139893))

(declare-fun b!1272697 () Bool)

(declare-fun e!725960 () Bool)

(assert (=> b!1272697 (= e!725960 (and (bvsge (extraKeys!6376 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6376 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3106 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272696 () Bool)

(declare-fun res!846512 () Bool)

(assert (=> b!1272696 (=> (not res!846512) (not e!725960))))

(declare-fun size!40748 (LongMapFixedSize!6102) (_ BitVec 32))

(assert (=> b!1272696 (= res!846512 (= (size!40748 thiss!1559) (bvadd (_size!3106 thiss!1559) (bvsdiv (bvadd (extraKeys!6376 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272695 () Bool)

(declare-fun res!846510 () Bool)

(assert (=> b!1272695 (=> (not res!846510) (not e!725960))))

(assert (=> b!1272695 (= res!846510 (bvsge (size!40748 thiss!1559) (_size!3106 thiss!1559)))))

(declare-fun d!139895 () Bool)

(declare-fun res!846511 () Bool)

(assert (=> d!139895 (=> (not res!846511) (not e!725960))))

(assert (=> d!139895 (= res!846511 (validMask!0 (mask!34449 thiss!1559)))))

(assert (=> d!139895 (= (simpleValid!457 thiss!1559) e!725960)))

(declare-fun b!1272694 () Bool)

(declare-fun res!846513 () Bool)

(assert (=> b!1272694 (=> (not res!846513) (not e!725960))))

(assert (=> b!1272694 (= res!846513 (and (= (size!40744 (_values!6720 thiss!1559)) (bvadd (mask!34449 thiss!1559) #b00000000000000000000000000000001)) (= (size!40745 (_keys!12105 thiss!1559)) (size!40744 (_values!6720 thiss!1559))) (bvsge (_size!3106 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3106 thiss!1559) (bvadd (mask!34449 thiss!1559) #b00000000000000000000000000000001))))))

(assert (= (and d!139895 res!846511) b!1272694))

(assert (= (and b!1272694 res!846513) b!1272695))

(assert (= (and b!1272695 res!846510) b!1272696))

(assert (= (and b!1272696 res!846512) b!1272697))

(declare-fun m!1170241 () Bool)

(assert (=> b!1272696 m!1170241))

(assert (=> b!1272695 m!1170241))

(assert (=> d!139895 m!1170193))

(assert (=> d!139883 d!139895))

(declare-fun b!1272698 () Bool)

(declare-fun e!725961 () Bool)

(assert (=> b!1272698 (= e!725961 tp_is_empty!33045)))

(declare-fun b!1272699 () Bool)

(declare-fun e!725962 () Bool)

(assert (=> b!1272699 (= e!725962 tp_is_empty!33045)))

(declare-fun condMapEmpty!51169 () Bool)

(declare-fun mapDefault!51169 () ValueCell!15669)

(assert (=> mapNonEmpty!51168 (= condMapEmpty!51169 (= mapRest!51168 ((as const (Array (_ BitVec 32) ValueCell!15669)) mapDefault!51169)))))

(declare-fun mapRes!51169 () Bool)

(assert (=> mapNonEmpty!51168 (= tp!97554 (and e!725962 mapRes!51169))))

(declare-fun mapIsEmpty!51169 () Bool)

(assert (=> mapIsEmpty!51169 mapRes!51169))

(declare-fun mapNonEmpty!51169 () Bool)

(declare-fun tp!97555 () Bool)

(assert (=> mapNonEmpty!51169 (= mapRes!51169 (and tp!97555 e!725961))))

(declare-fun mapKey!51169 () (_ BitVec 32))

(declare-fun mapValue!51169 () ValueCell!15669)

(declare-fun mapRest!51169 () (Array (_ BitVec 32) ValueCell!15669))

(assert (=> mapNonEmpty!51169 (= mapRest!51168 (store mapRest!51169 mapKey!51169 mapValue!51169))))

(assert (= (and mapNonEmpty!51168 condMapEmpty!51169) mapIsEmpty!51169))

(assert (= (and mapNonEmpty!51168 (not condMapEmpty!51169)) mapNonEmpty!51169))

(assert (= (and mapNonEmpty!51169 ((_ is ValueCellFull!15669) mapValue!51169)) b!1272698))

(assert (= (and mapNonEmpty!51168 ((_ is ValueCellFull!15669) mapDefault!51169)) b!1272699))

(declare-fun m!1170243 () Bool)

(assert (=> mapNonEmpty!51169 m!1170243))

(check-sat (not b!1272670) (not b!1272657) (not b!1272682) (not b!1272669) (not bm!62558) (not b!1272672) (not mapNonEmpty!51169) (not bm!62561) (not b!1272695) (not d!139895) b_and!45731 (not bm!62555) (not b_next!27675) (not b!1272696) (not b!1272658) tp_is_empty!33045)
(check-sat b_and!45731 (not b_next!27675))
