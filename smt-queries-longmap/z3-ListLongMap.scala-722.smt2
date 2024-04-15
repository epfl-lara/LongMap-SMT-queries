; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16872 () Bool)

(assert start!16872)

(declare-fun b!169756 () Bool)

(declare-fun b_free!4171 () Bool)

(declare-fun b_next!4171 () Bool)

(assert (=> b!169756 (= b_free!4171 (not b_next!4171))))

(declare-fun tp!15121 () Bool)

(declare-fun b_and!10559 () Bool)

(assert (=> b!169756 (= tp!15121 b_and!10559)))

(declare-fun b!169754 () Bool)

(declare-fun e!111964 () Bool)

(declare-fun tp_is_empty!3943 () Bool)

(assert (=> b!169754 (= e!111964 tp_is_empty!3943)))

(declare-fun mapIsEmpty!6686 () Bool)

(declare-fun mapRes!6686 () Bool)

(assert (=> mapIsEmpty!6686 mapRes!6686))

(declare-fun b!169755 () Bool)

(declare-fun e!111963 () Bool)

(declare-datatypes ((V!4905 0))(
  ( (V!4906 (val!2016 Int)) )
))
(declare-datatypes ((ValueCell!1628 0))(
  ( (ValueCellFull!1628 (v!3875 V!4905)) (EmptyCell!1628) )
))
(declare-datatypes ((array!6967 0))(
  ( (array!6968 (arr!3316 (Array (_ BitVec 32) (_ BitVec 64))) (size!3607 (_ BitVec 32))) )
))
(declare-datatypes ((array!6969 0))(
  ( (array!6970 (arr!3317 (Array (_ BitVec 32) ValueCell!1628)) (size!3608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2164 0))(
  ( (LongMapFixedSize!2165 (defaultEntry!3524 Int) (mask!8320 (_ BitVec 32)) (extraKeys!3265 (_ BitVec 32)) (zeroValue!3367 V!4905) (minValue!3367 V!4905) (_size!1131 (_ BitVec 32)) (_keys!5350 array!6967) (_values!3507 array!6969) (_vacant!1131 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2164)

(assert (=> b!169755 (= e!111963 (and (= (size!3608 (_values!3507 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8320 thiss!1248))) (not (= (size!3607 (_keys!5350 thiss!1248)) (size!3608 (_values!3507 thiss!1248))))))))

(declare-fun e!111966 () Bool)

(declare-fun e!111965 () Bool)

(declare-fun array_inv!2133 (array!6967) Bool)

(declare-fun array_inv!2134 (array!6969) Bool)

(assert (=> b!169756 (= e!111965 (and tp!15121 tp_is_empty!3943 (array_inv!2133 (_keys!5350 thiss!1248)) (array_inv!2134 (_values!3507 thiss!1248)) e!111966))))

(declare-fun res!80678 () Bool)

(assert (=> start!16872 (=> (not res!80678) (not e!111963))))

(declare-fun valid!946 (LongMapFixedSize!2164) Bool)

(assert (=> start!16872 (= res!80678 (valid!946 thiss!1248))))

(assert (=> start!16872 e!111963))

(assert (=> start!16872 e!111965))

(assert (=> start!16872 true))

(declare-fun mapNonEmpty!6686 () Bool)

(declare-fun tp!15122 () Bool)

(assert (=> mapNonEmpty!6686 (= mapRes!6686 (and tp!15122 e!111964))))

(declare-fun mapValue!6686 () ValueCell!1628)

(declare-fun mapKey!6686 () (_ BitVec 32))

(declare-fun mapRest!6686 () (Array (_ BitVec 32) ValueCell!1628))

(assert (=> mapNonEmpty!6686 (= (arr!3317 (_values!3507 thiss!1248)) (store mapRest!6686 mapKey!6686 mapValue!6686))))

(declare-fun b!169757 () Bool)

(declare-fun res!80679 () Bool)

(assert (=> b!169757 (=> (not res!80679) (not e!111963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169757 (= res!80679 (validMask!0 (mask!8320 thiss!1248)))))

(declare-fun b!169758 () Bool)

(declare-fun e!111962 () Bool)

(assert (=> b!169758 (= e!111966 (and e!111962 mapRes!6686))))

(declare-fun condMapEmpty!6686 () Bool)

(declare-fun mapDefault!6686 () ValueCell!1628)

(assert (=> b!169758 (= condMapEmpty!6686 (= (arr!3317 (_values!3507 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1628)) mapDefault!6686)))))

(declare-fun b!169759 () Bool)

(declare-fun res!80680 () Bool)

(assert (=> b!169759 (=> (not res!80680) (not e!111963))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169759 (= res!80680 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169760 () Bool)

(assert (=> b!169760 (= e!111962 tp_is_empty!3943)))

(assert (= (and start!16872 res!80678) b!169759))

(assert (= (and b!169759 res!80680) b!169757))

(assert (= (and b!169757 res!80679) b!169755))

(assert (= (and b!169758 condMapEmpty!6686) mapIsEmpty!6686))

(assert (= (and b!169758 (not condMapEmpty!6686)) mapNonEmpty!6686))

(get-info :version)

(assert (= (and mapNonEmpty!6686 ((_ is ValueCellFull!1628) mapValue!6686)) b!169754))

(assert (= (and b!169758 ((_ is ValueCellFull!1628) mapDefault!6686)) b!169760))

(assert (= b!169756 b!169758))

(assert (= start!16872 b!169756))

(declare-fun m!198077 () Bool)

(assert (=> b!169756 m!198077))

(declare-fun m!198079 () Bool)

(assert (=> b!169756 m!198079))

(declare-fun m!198081 () Bool)

(assert (=> start!16872 m!198081))

(declare-fun m!198083 () Bool)

(assert (=> mapNonEmpty!6686 m!198083))

(declare-fun m!198085 () Bool)

(assert (=> b!169757 m!198085))

(check-sat b_and!10559 tp_is_empty!3943 (not b!169756) (not mapNonEmpty!6686) (not b!169757) (not start!16872) (not b_next!4171))
(check-sat b_and!10559 (not b_next!4171))
(get-model)

(declare-fun d!51521 () Bool)

(assert (=> d!51521 (= (validMask!0 (mask!8320 thiss!1248)) (and (or (= (mask!8320 thiss!1248) #b00000000000000000000000000000111) (= (mask!8320 thiss!1248) #b00000000000000000000000000001111) (= (mask!8320 thiss!1248) #b00000000000000000000000000011111) (= (mask!8320 thiss!1248) #b00000000000000000000000000111111) (= (mask!8320 thiss!1248) #b00000000000000000000000001111111) (= (mask!8320 thiss!1248) #b00000000000000000000000011111111) (= (mask!8320 thiss!1248) #b00000000000000000000000111111111) (= (mask!8320 thiss!1248) #b00000000000000000000001111111111) (= (mask!8320 thiss!1248) #b00000000000000000000011111111111) (= (mask!8320 thiss!1248) #b00000000000000000000111111111111) (= (mask!8320 thiss!1248) #b00000000000000000001111111111111) (= (mask!8320 thiss!1248) #b00000000000000000011111111111111) (= (mask!8320 thiss!1248) #b00000000000000000111111111111111) (= (mask!8320 thiss!1248) #b00000000000000001111111111111111) (= (mask!8320 thiss!1248) #b00000000000000011111111111111111) (= (mask!8320 thiss!1248) #b00000000000000111111111111111111) (= (mask!8320 thiss!1248) #b00000000000001111111111111111111) (= (mask!8320 thiss!1248) #b00000000000011111111111111111111) (= (mask!8320 thiss!1248) #b00000000000111111111111111111111) (= (mask!8320 thiss!1248) #b00000000001111111111111111111111) (= (mask!8320 thiss!1248) #b00000000011111111111111111111111) (= (mask!8320 thiss!1248) #b00000000111111111111111111111111) (= (mask!8320 thiss!1248) #b00000001111111111111111111111111) (= (mask!8320 thiss!1248) #b00000011111111111111111111111111) (= (mask!8320 thiss!1248) #b00000111111111111111111111111111) (= (mask!8320 thiss!1248) #b00001111111111111111111111111111) (= (mask!8320 thiss!1248) #b00011111111111111111111111111111) (= (mask!8320 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8320 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169757 d!51521))

(declare-fun d!51523 () Bool)

(assert (=> d!51523 (= (array_inv!2133 (_keys!5350 thiss!1248)) (bvsge (size!3607 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169756 d!51523))

(declare-fun d!51525 () Bool)

(assert (=> d!51525 (= (array_inv!2134 (_values!3507 thiss!1248)) (bvsge (size!3608 (_values!3507 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169756 d!51525))

(declare-fun d!51527 () Bool)

(declare-fun res!80705 () Bool)

(declare-fun e!112006 () Bool)

(assert (=> d!51527 (=> (not res!80705) (not e!112006))))

(declare-fun simpleValid!129 (LongMapFixedSize!2164) Bool)

(assert (=> d!51527 (= res!80705 (simpleValid!129 thiss!1248))))

(assert (=> d!51527 (= (valid!946 thiss!1248) e!112006)))

(declare-fun b!169809 () Bool)

(declare-fun res!80706 () Bool)

(assert (=> b!169809 (=> (not res!80706) (not e!112006))))

(declare-fun arrayCountValidKeys!0 (array!6967 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169809 (= res!80706 (= (arrayCountValidKeys!0 (_keys!5350 thiss!1248) #b00000000000000000000000000000000 (size!3607 (_keys!5350 thiss!1248))) (_size!1131 thiss!1248)))))

(declare-fun b!169810 () Bool)

(declare-fun res!80707 () Bool)

(assert (=> b!169810 (=> (not res!80707) (not e!112006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6967 (_ BitVec 32)) Bool)

(assert (=> b!169810 (= res!80707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5350 thiss!1248) (mask!8320 thiss!1248)))))

(declare-fun b!169811 () Bool)

(declare-datatypes ((List!2196 0))(
  ( (Nil!2193) (Cons!2192 (h!2809 (_ BitVec 64)) (t!6989 List!2196)) )
))
(declare-fun arrayNoDuplicates!0 (array!6967 (_ BitVec 32) List!2196) Bool)

(assert (=> b!169811 (= e!112006 (arrayNoDuplicates!0 (_keys!5350 thiss!1248) #b00000000000000000000000000000000 Nil!2193))))

(assert (= (and d!51527 res!80705) b!169809))

(assert (= (and b!169809 res!80706) b!169810))

(assert (= (and b!169810 res!80707) b!169811))

(declare-fun m!198107 () Bool)

(assert (=> d!51527 m!198107))

(declare-fun m!198109 () Bool)

(assert (=> b!169809 m!198109))

(declare-fun m!198111 () Bool)

(assert (=> b!169810 m!198111))

(declare-fun m!198113 () Bool)

(assert (=> b!169811 m!198113))

(assert (=> start!16872 d!51527))

(declare-fun mapIsEmpty!6695 () Bool)

(declare-fun mapRes!6695 () Bool)

(assert (=> mapIsEmpty!6695 mapRes!6695))

(declare-fun b!169819 () Bool)

(declare-fun e!112012 () Bool)

(assert (=> b!169819 (= e!112012 tp_is_empty!3943)))

(declare-fun condMapEmpty!6695 () Bool)

(declare-fun mapDefault!6695 () ValueCell!1628)

(assert (=> mapNonEmpty!6686 (= condMapEmpty!6695 (= mapRest!6686 ((as const (Array (_ BitVec 32) ValueCell!1628)) mapDefault!6695)))))

(assert (=> mapNonEmpty!6686 (= tp!15122 (and e!112012 mapRes!6695))))

(declare-fun mapNonEmpty!6695 () Bool)

(declare-fun tp!15137 () Bool)

(declare-fun e!112011 () Bool)

(assert (=> mapNonEmpty!6695 (= mapRes!6695 (and tp!15137 e!112011))))

(declare-fun mapRest!6695 () (Array (_ BitVec 32) ValueCell!1628))

(declare-fun mapValue!6695 () ValueCell!1628)

(declare-fun mapKey!6695 () (_ BitVec 32))

(assert (=> mapNonEmpty!6695 (= mapRest!6686 (store mapRest!6695 mapKey!6695 mapValue!6695))))

(declare-fun b!169818 () Bool)

(assert (=> b!169818 (= e!112011 tp_is_empty!3943)))

(assert (= (and mapNonEmpty!6686 condMapEmpty!6695) mapIsEmpty!6695))

(assert (= (and mapNonEmpty!6686 (not condMapEmpty!6695)) mapNonEmpty!6695))

(assert (= (and mapNonEmpty!6695 ((_ is ValueCellFull!1628) mapValue!6695)) b!169818))

(assert (= (and mapNonEmpty!6686 ((_ is ValueCellFull!1628) mapDefault!6695)) b!169819))

(declare-fun m!198115 () Bool)

(assert (=> mapNonEmpty!6695 m!198115))

(check-sat (not mapNonEmpty!6695) (not d!51527) tp_is_empty!3943 (not b!169811) (not b_next!4171) (not b!169810) b_and!10559 (not b!169809))
(check-sat b_and!10559 (not b_next!4171))
(get-model)

(declare-fun b!169828 () Bool)

(declare-fun e!112017 () (_ BitVec 32))

(declare-fun call!17332 () (_ BitVec 32))

(assert (=> b!169828 (= e!112017 call!17332)))

(declare-fun bm!17329 () Bool)

(assert (=> bm!17329 (= call!17332 (arrayCountValidKeys!0 (_keys!5350 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3607 (_keys!5350 thiss!1248))))))

(declare-fun d!51529 () Bool)

(declare-fun lt!84795 () (_ BitVec 32))

(assert (=> d!51529 (and (bvsge lt!84795 #b00000000000000000000000000000000) (bvsle lt!84795 (bvsub (size!3607 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112018 () (_ BitVec 32))

(assert (=> d!51529 (= lt!84795 e!112018)))

(declare-fun c!30430 () Bool)

(assert (=> d!51529 (= c!30430 (bvsge #b00000000000000000000000000000000 (size!3607 (_keys!5350 thiss!1248))))))

(assert (=> d!51529 (and (bvsle #b00000000000000000000000000000000 (size!3607 (_keys!5350 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3607 (_keys!5350 thiss!1248)) (size!3607 (_keys!5350 thiss!1248))))))

(assert (=> d!51529 (= (arrayCountValidKeys!0 (_keys!5350 thiss!1248) #b00000000000000000000000000000000 (size!3607 (_keys!5350 thiss!1248))) lt!84795)))

(declare-fun b!169829 () Bool)

(assert (=> b!169829 (= e!112017 (bvadd #b00000000000000000000000000000001 call!17332))))

(declare-fun b!169830 () Bool)

(assert (=> b!169830 (= e!112018 e!112017)))

(declare-fun c!30431 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169830 (= c!30431 (validKeyInArray!0 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169831 () Bool)

(assert (=> b!169831 (= e!112018 #b00000000000000000000000000000000)))

(assert (= (and d!51529 c!30430) b!169831))

(assert (= (and d!51529 (not c!30430)) b!169830))

(assert (= (and b!169830 c!30431) b!169829))

(assert (= (and b!169830 (not c!30431)) b!169828))

(assert (= (or b!169829 b!169828) bm!17329))

(declare-fun m!198117 () Bool)

(assert (=> bm!17329 m!198117))

(declare-fun m!198119 () Bool)

(assert (=> b!169830 m!198119))

(assert (=> b!169830 m!198119))

(declare-fun m!198121 () Bool)

(assert (=> b!169830 m!198121))

(assert (=> b!169809 d!51529))

(declare-fun b!169843 () Bool)

(declare-fun e!112021 () Bool)

(assert (=> b!169843 (= e!112021 (and (bvsge (extraKeys!3265 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3265 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1131 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169842 () Bool)

(declare-fun res!80717 () Bool)

(assert (=> b!169842 (=> (not res!80717) (not e!112021))))

(declare-fun size!3613 (LongMapFixedSize!2164) (_ BitVec 32))

(assert (=> b!169842 (= res!80717 (= (size!3613 thiss!1248) (bvadd (_size!1131 thiss!1248) (bvsdiv (bvadd (extraKeys!3265 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!169840 () Bool)

(declare-fun res!80718 () Bool)

(assert (=> b!169840 (=> (not res!80718) (not e!112021))))

(assert (=> b!169840 (= res!80718 (and (= (size!3608 (_values!3507 thiss!1248)) (bvadd (mask!8320 thiss!1248) #b00000000000000000000000000000001)) (= (size!3607 (_keys!5350 thiss!1248)) (size!3608 (_values!3507 thiss!1248))) (bvsge (_size!1131 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1131 thiss!1248) (bvadd (mask!8320 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!169841 () Bool)

(declare-fun res!80719 () Bool)

(assert (=> b!169841 (=> (not res!80719) (not e!112021))))

(assert (=> b!169841 (= res!80719 (bvsge (size!3613 thiss!1248) (_size!1131 thiss!1248)))))

(declare-fun d!51531 () Bool)

(declare-fun res!80716 () Bool)

(assert (=> d!51531 (=> (not res!80716) (not e!112021))))

(assert (=> d!51531 (= res!80716 (validMask!0 (mask!8320 thiss!1248)))))

(assert (=> d!51531 (= (simpleValid!129 thiss!1248) e!112021)))

(assert (= (and d!51531 res!80716) b!169840))

(assert (= (and b!169840 res!80718) b!169841))

(assert (= (and b!169841 res!80719) b!169842))

(assert (= (and b!169842 res!80717) b!169843))

(declare-fun m!198123 () Bool)

(assert (=> b!169842 m!198123))

(assert (=> b!169841 m!198123))

(assert (=> d!51531 m!198085))

(assert (=> d!51527 d!51531))

(declare-fun b!169854 () Bool)

(declare-fun e!112031 () Bool)

(declare-fun call!17335 () Bool)

(assert (=> b!169854 (= e!112031 call!17335)))

(declare-fun b!169855 () Bool)

(declare-fun e!112032 () Bool)

(assert (=> b!169855 (= e!112032 e!112031)))

(declare-fun c!30434 () Bool)

(assert (=> b!169855 (= c!30434 (validKeyInArray!0 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169856 () Bool)

(declare-fun e!112030 () Bool)

(declare-fun contains!1138 (List!2196 (_ BitVec 64)) Bool)

(assert (=> b!169856 (= e!112030 (contains!1138 Nil!2193 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169857 () Bool)

(declare-fun e!112033 () Bool)

(assert (=> b!169857 (= e!112033 e!112032)))

(declare-fun res!80726 () Bool)

(assert (=> b!169857 (=> (not res!80726) (not e!112032))))

(assert (=> b!169857 (= res!80726 (not e!112030))))

(declare-fun res!80727 () Bool)

(assert (=> b!169857 (=> (not res!80727) (not e!112030))))

(assert (=> b!169857 (= res!80727 (validKeyInArray!0 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51533 () Bool)

(declare-fun res!80728 () Bool)

(assert (=> d!51533 (=> res!80728 e!112033)))

(assert (=> d!51533 (= res!80728 (bvsge #b00000000000000000000000000000000 (size!3607 (_keys!5350 thiss!1248))))))

(assert (=> d!51533 (= (arrayNoDuplicates!0 (_keys!5350 thiss!1248) #b00000000000000000000000000000000 Nil!2193) e!112033)))

(declare-fun bm!17332 () Bool)

(assert (=> bm!17332 (= call!17335 (arrayNoDuplicates!0 (_keys!5350 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30434 (Cons!2192 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000) Nil!2193) Nil!2193)))))

(declare-fun b!169858 () Bool)

(assert (=> b!169858 (= e!112031 call!17335)))

(assert (= (and d!51533 (not res!80728)) b!169857))

(assert (= (and b!169857 res!80727) b!169856))

(assert (= (and b!169857 res!80726) b!169855))

(assert (= (and b!169855 c!30434) b!169854))

(assert (= (and b!169855 (not c!30434)) b!169858))

(assert (= (or b!169854 b!169858) bm!17332))

(assert (=> b!169855 m!198119))

(assert (=> b!169855 m!198119))

(assert (=> b!169855 m!198121))

(assert (=> b!169856 m!198119))

(assert (=> b!169856 m!198119))

(declare-fun m!198125 () Bool)

(assert (=> b!169856 m!198125))

(assert (=> b!169857 m!198119))

(assert (=> b!169857 m!198119))

(assert (=> b!169857 m!198121))

(assert (=> bm!17332 m!198119))

(declare-fun m!198127 () Bool)

(assert (=> bm!17332 m!198127))

(assert (=> b!169811 d!51533))

(declare-fun bm!17335 () Bool)

(declare-fun call!17338 () Bool)

(assert (=> bm!17335 (= call!17338 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5350 thiss!1248) (mask!8320 thiss!1248)))))

(declare-fun d!51535 () Bool)

(declare-fun res!80734 () Bool)

(declare-fun e!112040 () Bool)

(assert (=> d!51535 (=> res!80734 e!112040)))

(assert (=> d!51535 (= res!80734 (bvsge #b00000000000000000000000000000000 (size!3607 (_keys!5350 thiss!1248))))))

(assert (=> d!51535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5350 thiss!1248) (mask!8320 thiss!1248)) e!112040)))

(declare-fun b!169867 () Bool)

(declare-fun e!112042 () Bool)

(assert (=> b!169867 (= e!112042 call!17338)))

(declare-fun b!169868 () Bool)

(declare-fun e!112041 () Bool)

(assert (=> b!169868 (= e!112041 e!112042)))

(declare-fun lt!84803 () (_ BitVec 64))

(assert (=> b!169868 (= lt!84803 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5217 0))(
  ( (Unit!5218) )
))
(declare-fun lt!84802 () Unit!5217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6967 (_ BitVec 64) (_ BitVec 32)) Unit!5217)

(assert (=> b!169868 (= lt!84802 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5350 thiss!1248) lt!84803 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169868 (arrayContainsKey!0 (_keys!5350 thiss!1248) lt!84803 #b00000000000000000000000000000000)))

(declare-fun lt!84804 () Unit!5217)

(assert (=> b!169868 (= lt!84804 lt!84802)))

(declare-fun res!80733 () Bool)

(declare-datatypes ((SeekEntryResult!540 0))(
  ( (MissingZero!540 (index!4328 (_ BitVec 32))) (Found!540 (index!4329 (_ BitVec 32))) (Intermediate!540 (undefined!1352 Bool) (index!4330 (_ BitVec 32)) (x!18809 (_ BitVec 32))) (Undefined!540) (MissingVacant!540 (index!4331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6967 (_ BitVec 32)) SeekEntryResult!540)

(assert (=> b!169868 (= res!80733 (= (seekEntryOrOpen!0 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000) (_keys!5350 thiss!1248) (mask!8320 thiss!1248)) (Found!540 #b00000000000000000000000000000000)))))

(assert (=> b!169868 (=> (not res!80733) (not e!112042))))

(declare-fun b!169869 () Bool)

(assert (=> b!169869 (= e!112041 call!17338)))

(declare-fun b!169870 () Bool)

(assert (=> b!169870 (= e!112040 e!112041)))

(declare-fun c!30437 () Bool)

(assert (=> b!169870 (= c!30437 (validKeyInArray!0 (select (arr!3316 (_keys!5350 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51535 (not res!80734)) b!169870))

(assert (= (and b!169870 c!30437) b!169868))

(assert (= (and b!169870 (not c!30437)) b!169869))

(assert (= (and b!169868 res!80733) b!169867))

(assert (= (or b!169867 b!169869) bm!17335))

(declare-fun m!198129 () Bool)

(assert (=> bm!17335 m!198129))

(assert (=> b!169868 m!198119))

(declare-fun m!198131 () Bool)

(assert (=> b!169868 m!198131))

(declare-fun m!198133 () Bool)

(assert (=> b!169868 m!198133))

(assert (=> b!169868 m!198119))

(declare-fun m!198135 () Bool)

(assert (=> b!169868 m!198135))

(assert (=> b!169870 m!198119))

(assert (=> b!169870 m!198119))

(assert (=> b!169870 m!198121))

(assert (=> b!169810 d!51535))

(declare-fun mapIsEmpty!6696 () Bool)

(declare-fun mapRes!6696 () Bool)

(assert (=> mapIsEmpty!6696 mapRes!6696))

(declare-fun b!169872 () Bool)

(declare-fun e!112044 () Bool)

(assert (=> b!169872 (= e!112044 tp_is_empty!3943)))

(declare-fun condMapEmpty!6696 () Bool)

(declare-fun mapDefault!6696 () ValueCell!1628)

(assert (=> mapNonEmpty!6695 (= condMapEmpty!6696 (= mapRest!6695 ((as const (Array (_ BitVec 32) ValueCell!1628)) mapDefault!6696)))))

(assert (=> mapNonEmpty!6695 (= tp!15137 (and e!112044 mapRes!6696))))

(declare-fun mapNonEmpty!6696 () Bool)

(declare-fun tp!15138 () Bool)

(declare-fun e!112043 () Bool)

(assert (=> mapNonEmpty!6696 (= mapRes!6696 (and tp!15138 e!112043))))

(declare-fun mapValue!6696 () ValueCell!1628)

(declare-fun mapKey!6696 () (_ BitVec 32))

(declare-fun mapRest!6696 () (Array (_ BitVec 32) ValueCell!1628))

(assert (=> mapNonEmpty!6696 (= mapRest!6695 (store mapRest!6696 mapKey!6696 mapValue!6696))))

(declare-fun b!169871 () Bool)

(assert (=> b!169871 (= e!112043 tp_is_empty!3943)))

(assert (= (and mapNonEmpty!6695 condMapEmpty!6696) mapIsEmpty!6696))

(assert (= (and mapNonEmpty!6695 (not condMapEmpty!6696)) mapNonEmpty!6696))

(assert (= (and mapNonEmpty!6696 ((_ is ValueCellFull!1628) mapValue!6696)) b!169871))

(assert (= (and mapNonEmpty!6695 ((_ is ValueCellFull!1628) mapDefault!6696)) b!169872))

(declare-fun m!198137 () Bool)

(assert (=> mapNonEmpty!6696 m!198137))

(check-sat b_and!10559 (not mapNonEmpty!6696) (not b!169841) (not b!169842) tp_is_empty!3943 (not bm!17332) (not b!169830) (not b!169868) (not b!169855) (not b_next!4171) (not b!169870) (not b!169857) (not bm!17329) (not bm!17335) (not b!169856) (not d!51531))
(check-sat b_and!10559 (not b_next!4171))
