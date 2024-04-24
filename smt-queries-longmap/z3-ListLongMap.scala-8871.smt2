; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107912 () Bool)

(assert start!107912)

(declare-fun b!1275509 () Bool)

(declare-fun b_free!27769 () Bool)

(declare-fun b_next!27769 () Bool)

(assert (=> b!1275509 (= b_free!27769 (not b_next!27769))))

(declare-fun tp!97877 () Bool)

(declare-fun b_and!45827 () Bool)

(assert (=> b!1275509 (= tp!97877 b_and!45827)))

(declare-fun b!1275500 () Bool)

(declare-fun e!727970 () Bool)

(declare-datatypes ((List!28598 0))(
  ( (Nil!28595) (Cons!28594 (h!29812 (_ BitVec 64)) (t!42123 List!28598)) )
))
(declare-fun contains!7700 (List!28598 (_ BitVec 64)) Bool)

(assert (=> b!1275500 (= e!727970 (contains!7700 Nil!28595 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275501 () Bool)

(declare-fun res!847670 () Bool)

(declare-fun e!727972 () Bool)

(assert (=> b!1275501 (=> (not res!847670) (not e!727972))))

(declare-datatypes ((V!49379 0))(
  ( (V!49380 (val!16644 Int)) )
))
(declare-datatypes ((ValueCell!15716 0))(
  ( (ValueCellFull!15716 (v!19276 V!49379)) (EmptyCell!15716) )
))
(declare-datatypes ((array!83581 0))(
  ( (array!83582 (arr!40304 (Array (_ BitVec 32) ValueCell!15716)) (size!40854 (_ BitVec 32))) )
))
(declare-datatypes ((array!83583 0))(
  ( (array!83584 (arr!40305 (Array (_ BitVec 32) (_ BitVec 64))) (size!40855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6196 0))(
  ( (LongMapFixedSize!6197 (defaultEntry!6744 Int) (mask!34610 (_ BitVec 32)) (extraKeys!6423 (_ BitVec 32)) (zeroValue!6529 V!49379) (minValue!6529 V!49379) (_size!3153 (_ BitVec 32)) (_keys!12200 array!83583) (_values!6767 array!83581) (_vacant!3153 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6196)

(assert (=> b!1275501 (= res!847670 (and (bvsle #b00000000000000000000000000000000 (size!40855 (_keys!12200 thiss!1551))) (bvslt (size!40855 (_keys!12200 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1275502 () Bool)

(declare-fun res!847673 () Bool)

(assert (=> b!1275502 (=> (not res!847673) (not e!727972))))

(declare-fun arrayCountValidKeys!0 (array!83583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1275502 (= res!847673 (= (arrayCountValidKeys!0 (_keys!12200 thiss!1551) #b00000000000000000000000000000000 (size!40855 (_keys!12200 thiss!1551))) (_size!3153 thiss!1551)))))

(declare-fun b!1275503 () Bool)

(declare-fun e!727971 () Bool)

(declare-fun e!727969 () Bool)

(declare-fun mapRes!51353 () Bool)

(assert (=> b!1275503 (= e!727971 (and e!727969 mapRes!51353))))

(declare-fun condMapEmpty!51353 () Bool)

(declare-fun mapDefault!51353 () ValueCell!15716)

(assert (=> b!1275503 (= condMapEmpty!51353 (= (arr!40304 (_values!6767 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15716)) mapDefault!51353)))))

(declare-fun b!1275504 () Bool)

(declare-fun res!847674 () Bool)

(assert (=> b!1275504 (=> (not res!847674) (not e!727972))))

(declare-fun noDuplicate!2063 (List!28598) Bool)

(assert (=> b!1275504 (= res!847674 (noDuplicate!2063 Nil!28595))))

(declare-fun b!1275505 () Bool)

(declare-fun tp_is_empty!33139 () Bool)

(assert (=> b!1275505 (= e!727969 tp_is_empty!33139)))

(declare-fun b!1275506 () Bool)

(declare-fun e!727973 () Bool)

(assert (=> b!1275506 (= e!727973 tp_is_empty!33139)))

(declare-fun res!847671 () Bool)

(assert (=> start!107912 (=> (not res!847671) (not e!727972))))

(declare-fun simpleValid!485 (LongMapFixedSize!6196) Bool)

(assert (=> start!107912 (= res!847671 (simpleValid!485 thiss!1551))))

(assert (=> start!107912 e!727972))

(declare-fun e!727974 () Bool)

(assert (=> start!107912 e!727974))

(declare-fun mapNonEmpty!51353 () Bool)

(declare-fun tp!97876 () Bool)

(assert (=> mapNonEmpty!51353 (= mapRes!51353 (and tp!97876 e!727973))))

(declare-fun mapValue!51353 () ValueCell!15716)

(declare-fun mapRest!51353 () (Array (_ BitVec 32) ValueCell!15716))

(declare-fun mapKey!51353 () (_ BitVec 32))

(assert (=> mapNonEmpty!51353 (= (arr!40304 (_values!6767 thiss!1551)) (store mapRest!51353 mapKey!51353 mapValue!51353))))

(declare-fun b!1275507 () Bool)

(assert (=> b!1275507 (= e!727972 e!727970)))

(declare-fun res!847672 () Bool)

(assert (=> b!1275507 (=> res!847672 e!727970)))

(assert (=> b!1275507 (= res!847672 (contains!7700 Nil!28595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!51353 () Bool)

(assert (=> mapIsEmpty!51353 mapRes!51353))

(declare-fun b!1275508 () Bool)

(declare-fun res!847669 () Bool)

(assert (=> b!1275508 (=> (not res!847669) (not e!727972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83583 (_ BitVec 32)) Bool)

(assert (=> b!1275508 (= res!847669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12200 thiss!1551) (mask!34610 thiss!1551)))))

(declare-fun array_inv!30819 (array!83583) Bool)

(declare-fun array_inv!30820 (array!83581) Bool)

(assert (=> b!1275509 (= e!727974 (and tp!97877 tp_is_empty!33139 (array_inv!30819 (_keys!12200 thiss!1551)) (array_inv!30820 (_values!6767 thiss!1551)) e!727971))))

(assert (= (and start!107912 res!847671) b!1275502))

(assert (= (and b!1275502 res!847673) b!1275508))

(assert (= (and b!1275508 res!847669) b!1275501))

(assert (= (and b!1275501 res!847670) b!1275504))

(assert (= (and b!1275504 res!847674) b!1275507))

(assert (= (and b!1275507 (not res!847672)) b!1275500))

(assert (= (and b!1275503 condMapEmpty!51353) mapIsEmpty!51353))

(assert (= (and b!1275503 (not condMapEmpty!51353)) mapNonEmpty!51353))

(get-info :version)

(assert (= (and mapNonEmpty!51353 ((_ is ValueCellFull!15716) mapValue!51353)) b!1275506))

(assert (= (and b!1275503 ((_ is ValueCellFull!15716) mapDefault!51353)) b!1275505))

(assert (= b!1275509 b!1275503))

(assert (= start!107912 b!1275509))

(declare-fun m!1172647 () Bool)

(assert (=> start!107912 m!1172647))

(declare-fun m!1172649 () Bool)

(assert (=> b!1275504 m!1172649))

(declare-fun m!1172651 () Bool)

(assert (=> b!1275509 m!1172651))

(declare-fun m!1172653 () Bool)

(assert (=> b!1275509 m!1172653))

(declare-fun m!1172655 () Bool)

(assert (=> mapNonEmpty!51353 m!1172655))

(declare-fun m!1172657 () Bool)

(assert (=> b!1275502 m!1172657))

(declare-fun m!1172659 () Bool)

(assert (=> b!1275508 m!1172659))

(declare-fun m!1172661 () Bool)

(assert (=> b!1275507 m!1172661))

(declare-fun m!1172663 () Bool)

(assert (=> b!1275500 m!1172663))

(check-sat (not b!1275502) (not b!1275507) (not mapNonEmpty!51353) (not b_next!27769) (not b!1275508) (not b!1275504) b_and!45827 (not b!1275509) (not start!107912) tp_is_empty!33139 (not b!1275500))
(check-sat b_and!45827 (not b_next!27769))
(get-model)

(declare-fun b!1275579 () Bool)

(declare-fun res!847722 () Bool)

(declare-fun e!728019 () Bool)

(assert (=> b!1275579 (=> (not res!847722) (not e!728019))))

(declare-fun size!40860 (LongMapFixedSize!6196) (_ BitVec 32))

(assert (=> b!1275579 (= res!847722 (bvsge (size!40860 thiss!1551) (_size!3153 thiss!1551)))))

(declare-fun b!1275578 () Bool)

(declare-fun res!847721 () Bool)

(assert (=> b!1275578 (=> (not res!847721) (not e!728019))))

(assert (=> b!1275578 (= res!847721 (and (= (size!40854 (_values!6767 thiss!1551)) (bvadd (mask!34610 thiss!1551) #b00000000000000000000000000000001)) (= (size!40855 (_keys!12200 thiss!1551)) (size!40854 (_values!6767 thiss!1551))) (bvsge (_size!3153 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3153 thiss!1551) (bvadd (mask!34610 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1275581 () Bool)

(assert (=> b!1275581 (= e!728019 (and (bvsge (extraKeys!6423 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6423 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3153 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1275580 () Bool)

(declare-fun res!847719 () Bool)

(assert (=> b!1275580 (=> (not res!847719) (not e!728019))))

(assert (=> b!1275580 (= res!847719 (= (size!40860 thiss!1551) (bvadd (_size!3153 thiss!1551) (bvsdiv (bvadd (extraKeys!6423 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!140545 () Bool)

(declare-fun res!847720 () Bool)

(assert (=> d!140545 (=> (not res!847720) (not e!728019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140545 (= res!847720 (validMask!0 (mask!34610 thiss!1551)))))

(assert (=> d!140545 (= (simpleValid!485 thiss!1551) e!728019)))

(assert (= (and d!140545 res!847720) b!1275578))

(assert (= (and b!1275578 res!847721) b!1275579))

(assert (= (and b!1275579 res!847722) b!1275580))

(assert (= (and b!1275580 res!847719) b!1275581))

(declare-fun m!1172701 () Bool)

(assert (=> b!1275579 m!1172701))

(assert (=> b!1275580 m!1172701))

(declare-fun m!1172703 () Bool)

(assert (=> d!140545 m!1172703))

(assert (=> start!107912 d!140545))

(declare-fun d!140547 () Bool)

(declare-fun lt!575688 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!639 (List!28598) (InoxSet (_ BitVec 64)))

(assert (=> d!140547 (= lt!575688 (select (content!639 Nil!28595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!728025 () Bool)

(assert (=> d!140547 (= lt!575688 e!728025)))

(declare-fun res!847727 () Bool)

(assert (=> d!140547 (=> (not res!847727) (not e!728025))))

(assert (=> d!140547 (= res!847727 ((_ is Cons!28594) Nil!28595))))

(assert (=> d!140547 (= (contains!7700 Nil!28595 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575688)))

(declare-fun b!1275586 () Bool)

(declare-fun e!728024 () Bool)

(assert (=> b!1275586 (= e!728025 e!728024)))

(declare-fun res!847728 () Bool)

(assert (=> b!1275586 (=> res!847728 e!728024)))

(assert (=> b!1275586 (= res!847728 (= (h!29812 Nil!28595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275587 () Bool)

(assert (=> b!1275587 (= e!728024 (contains!7700 (t!42123 Nil!28595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140547 res!847727) b!1275586))

(assert (= (and b!1275586 (not res!847728)) b!1275587))

(declare-fun m!1172705 () Bool)

(assert (=> d!140547 m!1172705))

(declare-fun m!1172707 () Bool)

(assert (=> d!140547 m!1172707))

(declare-fun m!1172709 () Bool)

(assert (=> b!1275587 m!1172709))

(assert (=> b!1275500 d!140547))

(declare-fun d!140549 () Bool)

(assert (=> d!140549 (= (array_inv!30819 (_keys!12200 thiss!1551)) (bvsge (size!40855 (_keys!12200 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275509 d!140549))

(declare-fun d!140551 () Bool)

(assert (=> d!140551 (= (array_inv!30820 (_values!6767 thiss!1551)) (bvsge (size!40854 (_values!6767 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275509 d!140551))

(declare-fun d!140553 () Bool)

(declare-fun lt!575689 () Bool)

(assert (=> d!140553 (= lt!575689 (select (content!639 Nil!28595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!728027 () Bool)

(assert (=> d!140553 (= lt!575689 e!728027)))

(declare-fun res!847729 () Bool)

(assert (=> d!140553 (=> (not res!847729) (not e!728027))))

(assert (=> d!140553 (= res!847729 ((_ is Cons!28594) Nil!28595))))

(assert (=> d!140553 (= (contains!7700 Nil!28595 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575689)))

(declare-fun b!1275588 () Bool)

(declare-fun e!728026 () Bool)

(assert (=> b!1275588 (= e!728027 e!728026)))

(declare-fun res!847730 () Bool)

(assert (=> b!1275588 (=> res!847730 e!728026)))

(assert (=> b!1275588 (= res!847730 (= (h!29812 Nil!28595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275589 () Bool)

(assert (=> b!1275589 (= e!728026 (contains!7700 (t!42123 Nil!28595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140553 res!847729) b!1275588))

(assert (= (and b!1275588 (not res!847730)) b!1275589))

(assert (=> d!140553 m!1172705))

(declare-fun m!1172711 () Bool)

(assert (=> d!140553 m!1172711))

(declare-fun m!1172713 () Bool)

(assert (=> b!1275589 m!1172713))

(assert (=> b!1275507 d!140553))

(declare-fun bm!62691 () Bool)

(declare-fun call!62694 () (_ BitVec 32))

(assert (=> bm!62691 (= call!62694 (arrayCountValidKeys!0 (_keys!12200 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40855 (_keys!12200 thiss!1551))))))

(declare-fun b!1275598 () Bool)

(declare-fun e!728032 () (_ BitVec 32))

(assert (=> b!1275598 (= e!728032 (bvadd #b00000000000000000000000000000001 call!62694))))

(declare-fun d!140555 () Bool)

(declare-fun lt!575692 () (_ BitVec 32))

(assert (=> d!140555 (and (bvsge lt!575692 #b00000000000000000000000000000000) (bvsle lt!575692 (bvsub (size!40855 (_keys!12200 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!728033 () (_ BitVec 32))

(assert (=> d!140555 (= lt!575692 e!728033)))

(declare-fun c!124222 () Bool)

(assert (=> d!140555 (= c!124222 (bvsge #b00000000000000000000000000000000 (size!40855 (_keys!12200 thiss!1551))))))

(assert (=> d!140555 (and (bvsle #b00000000000000000000000000000000 (size!40855 (_keys!12200 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40855 (_keys!12200 thiss!1551)) (size!40855 (_keys!12200 thiss!1551))))))

(assert (=> d!140555 (= (arrayCountValidKeys!0 (_keys!12200 thiss!1551) #b00000000000000000000000000000000 (size!40855 (_keys!12200 thiss!1551))) lt!575692)))

(declare-fun b!1275599 () Bool)

(assert (=> b!1275599 (= e!728033 e!728032)))

(declare-fun c!124221 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275599 (= c!124221 (validKeyInArray!0 (select (arr!40305 (_keys!12200 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275600 () Bool)

(assert (=> b!1275600 (= e!728032 call!62694)))

(declare-fun b!1275601 () Bool)

(assert (=> b!1275601 (= e!728033 #b00000000000000000000000000000000)))

(assert (= (and d!140555 c!124222) b!1275601))

(assert (= (and d!140555 (not c!124222)) b!1275599))

(assert (= (and b!1275599 c!124221) b!1275598))

(assert (= (and b!1275599 (not c!124221)) b!1275600))

(assert (= (or b!1275598 b!1275600) bm!62691))

(declare-fun m!1172715 () Bool)

(assert (=> bm!62691 m!1172715))

(declare-fun m!1172717 () Bool)

(assert (=> b!1275599 m!1172717))

(assert (=> b!1275599 m!1172717))

(declare-fun m!1172719 () Bool)

(assert (=> b!1275599 m!1172719))

(assert (=> b!1275502 d!140555))

(declare-fun b!1275610 () Bool)

(declare-fun e!728041 () Bool)

(declare-fun call!62697 () Bool)

(assert (=> b!1275610 (= e!728041 call!62697)))

(declare-fun bm!62694 () Bool)

(assert (=> bm!62694 (= call!62697 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12200 thiss!1551) (mask!34610 thiss!1551)))))

(declare-fun b!1275611 () Bool)

(declare-fun e!728042 () Bool)

(assert (=> b!1275611 (= e!728041 e!728042)))

(declare-fun lt!575700 () (_ BitVec 64))

(assert (=> b!1275611 (= lt!575700 (select (arr!40305 (_keys!12200 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42311 0))(
  ( (Unit!42312) )
))
(declare-fun lt!575699 () Unit!42311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83583 (_ BitVec 64) (_ BitVec 32)) Unit!42311)

(assert (=> b!1275611 (= lt!575699 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12200 thiss!1551) lt!575700 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275611 (arrayContainsKey!0 (_keys!12200 thiss!1551) lt!575700 #b00000000000000000000000000000000)))

(declare-fun lt!575701 () Unit!42311)

(assert (=> b!1275611 (= lt!575701 lt!575699)))

(declare-fun res!847736 () Bool)

(declare-datatypes ((SeekEntryResult!9956 0))(
  ( (MissingZero!9956 (index!42195 (_ BitVec 32))) (Found!9956 (index!42196 (_ BitVec 32))) (Intermediate!9956 (undefined!10768 Bool) (index!42197 (_ BitVec 32)) (x!112715 (_ BitVec 32))) (Undefined!9956) (MissingVacant!9956 (index!42198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83583 (_ BitVec 32)) SeekEntryResult!9956)

(assert (=> b!1275611 (= res!847736 (= (seekEntryOrOpen!0 (select (arr!40305 (_keys!12200 thiss!1551)) #b00000000000000000000000000000000) (_keys!12200 thiss!1551) (mask!34610 thiss!1551)) (Found!9956 #b00000000000000000000000000000000)))))

(assert (=> b!1275611 (=> (not res!847736) (not e!728042))))

(declare-fun b!1275612 () Bool)

(declare-fun e!728040 () Bool)

(assert (=> b!1275612 (= e!728040 e!728041)))

(declare-fun c!124225 () Bool)

(assert (=> b!1275612 (= c!124225 (validKeyInArray!0 (select (arr!40305 (_keys!12200 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275613 () Bool)

(assert (=> b!1275613 (= e!728042 call!62697)))

(declare-fun d!140557 () Bool)

(declare-fun res!847735 () Bool)

(assert (=> d!140557 (=> res!847735 e!728040)))

(assert (=> d!140557 (= res!847735 (bvsge #b00000000000000000000000000000000 (size!40855 (_keys!12200 thiss!1551))))))

(assert (=> d!140557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12200 thiss!1551) (mask!34610 thiss!1551)) e!728040)))

(assert (= (and d!140557 (not res!847735)) b!1275612))

(assert (= (and b!1275612 c!124225) b!1275611))

(assert (= (and b!1275612 (not c!124225)) b!1275610))

(assert (= (and b!1275611 res!847736) b!1275613))

(assert (= (or b!1275613 b!1275610) bm!62694))

(declare-fun m!1172721 () Bool)

(assert (=> bm!62694 m!1172721))

(assert (=> b!1275611 m!1172717))

(declare-fun m!1172723 () Bool)

(assert (=> b!1275611 m!1172723))

(declare-fun m!1172725 () Bool)

(assert (=> b!1275611 m!1172725))

(assert (=> b!1275611 m!1172717))

(declare-fun m!1172727 () Bool)

(assert (=> b!1275611 m!1172727))

(assert (=> b!1275612 m!1172717))

(assert (=> b!1275612 m!1172717))

(assert (=> b!1275612 m!1172719))

(assert (=> b!1275508 d!140557))

(declare-fun d!140559 () Bool)

(declare-fun res!847741 () Bool)

(declare-fun e!728047 () Bool)

(assert (=> d!140559 (=> res!847741 e!728047)))

(assert (=> d!140559 (= res!847741 ((_ is Nil!28595) Nil!28595))))

(assert (=> d!140559 (= (noDuplicate!2063 Nil!28595) e!728047)))

(declare-fun b!1275618 () Bool)

(declare-fun e!728048 () Bool)

(assert (=> b!1275618 (= e!728047 e!728048)))

(declare-fun res!847742 () Bool)

(assert (=> b!1275618 (=> (not res!847742) (not e!728048))))

(assert (=> b!1275618 (= res!847742 (not (contains!7700 (t!42123 Nil!28595) (h!29812 Nil!28595))))))

(declare-fun b!1275619 () Bool)

(assert (=> b!1275619 (= e!728048 (noDuplicate!2063 (t!42123 Nil!28595)))))

(assert (= (and d!140559 (not res!847741)) b!1275618))

(assert (= (and b!1275618 res!847742) b!1275619))

(declare-fun m!1172729 () Bool)

(assert (=> b!1275618 m!1172729))

(declare-fun m!1172731 () Bool)

(assert (=> b!1275619 m!1172731))

(assert (=> b!1275504 d!140559))

(declare-fun mapNonEmpty!51362 () Bool)

(declare-fun mapRes!51362 () Bool)

(declare-fun tp!97892 () Bool)

(declare-fun e!728053 () Bool)

(assert (=> mapNonEmpty!51362 (= mapRes!51362 (and tp!97892 e!728053))))

(declare-fun mapValue!51362 () ValueCell!15716)

(declare-fun mapKey!51362 () (_ BitVec 32))

(declare-fun mapRest!51362 () (Array (_ BitVec 32) ValueCell!15716))

(assert (=> mapNonEmpty!51362 (= mapRest!51353 (store mapRest!51362 mapKey!51362 mapValue!51362))))

(declare-fun b!1275627 () Bool)

(declare-fun e!728054 () Bool)

(assert (=> b!1275627 (= e!728054 tp_is_empty!33139)))

(declare-fun mapIsEmpty!51362 () Bool)

(assert (=> mapIsEmpty!51362 mapRes!51362))

(declare-fun b!1275626 () Bool)

(assert (=> b!1275626 (= e!728053 tp_is_empty!33139)))

(declare-fun condMapEmpty!51362 () Bool)

(declare-fun mapDefault!51362 () ValueCell!15716)

(assert (=> mapNonEmpty!51353 (= condMapEmpty!51362 (= mapRest!51353 ((as const (Array (_ BitVec 32) ValueCell!15716)) mapDefault!51362)))))

(assert (=> mapNonEmpty!51353 (= tp!97876 (and e!728054 mapRes!51362))))

(assert (= (and mapNonEmpty!51353 condMapEmpty!51362) mapIsEmpty!51362))

(assert (= (and mapNonEmpty!51353 (not condMapEmpty!51362)) mapNonEmpty!51362))

(assert (= (and mapNonEmpty!51362 ((_ is ValueCellFull!15716) mapValue!51362)) b!1275626))

(assert (= (and mapNonEmpty!51353 ((_ is ValueCellFull!15716) mapDefault!51362)) b!1275627))

(declare-fun m!1172733 () Bool)

(assert (=> mapNonEmpty!51362 m!1172733))

(check-sat (not b!1275599) (not b!1275589) (not d!140553) (not mapNonEmpty!51362) (not b_next!27769) (not d!140547) (not b!1275611) (not bm!62694) (not d!140545) (not b!1275580) (not bm!62691) (not b!1275579) tp_is_empty!33139 (not b!1275587) (not b!1275619) (not b!1275618) (not b!1275612) b_and!45827)
(check-sat b_and!45827 (not b_next!27769))
