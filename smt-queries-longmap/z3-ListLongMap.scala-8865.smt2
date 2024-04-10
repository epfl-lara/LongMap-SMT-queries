; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107590 () Bool)

(assert start!107590)

(declare-fun b!1273607 () Bool)

(declare-fun b_free!27735 () Bool)

(declare-fun b_next!27735 () Bool)

(assert (=> b!1273607 (= b_free!27735 (not b_next!27735))))

(declare-fun tp!97759 () Bool)

(declare-fun b_and!45791 () Bool)

(assert (=> b!1273607 (= tp!97759 b_and!45791)))

(declare-fun b!1273605 () Bool)

(declare-fun res!846907 () Bool)

(declare-fun e!726684 () Bool)

(assert (=> b!1273605 (=> (not res!846907) (not e!726684))))

(declare-datatypes ((V!49333 0))(
  ( (V!49334 (val!16627 Int)) )
))
(declare-datatypes ((ValueCell!15699 0))(
  ( (ValueCellFull!15699 (v!19264 V!49333)) (EmptyCell!15699) )
))
(declare-datatypes ((array!83486 0))(
  ( (array!83487 (arr!40266 (Array (_ BitVec 32) ValueCell!15699)) (size!40810 (_ BitVec 32))) )
))
(declare-datatypes ((array!83488 0))(
  ( (array!83489 (arr!40267 (Array (_ BitVec 32) (_ BitVec 64))) (size!40811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6162 0))(
  ( (LongMapFixedSize!6163 (defaultEntry!6727 Int) (mask!34514 (_ BitVec 32)) (extraKeys!6406 (_ BitVec 32)) (zeroValue!6512 V!49333) (minValue!6512 V!49333) (_size!3136 (_ BitVec 32)) (_keys!12141 array!83488) (_values!6750 array!83486) (_vacant!3136 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6162)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273605 (= res!846907 (validMask!0 (mask!34514 thiss!1551)))))

(declare-fun b!1273606 () Bool)

(assert (=> b!1273606 (= e!726684 (not (= (size!40811 (_keys!12141 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34514 thiss!1551)))))))

(declare-fun tp_is_empty!33105 () Bool)

(declare-fun e!726686 () Bool)

(declare-fun e!726685 () Bool)

(declare-fun array_inv!30613 (array!83488) Bool)

(declare-fun array_inv!30614 (array!83486) Bool)

(assert (=> b!1273607 (= e!726686 (and tp!97759 tp_is_empty!33105 (array_inv!30613 (_keys!12141 thiss!1551)) (array_inv!30614 (_values!6750 thiss!1551)) e!726685))))

(declare-fun b!1273608 () Bool)

(declare-fun e!726683 () Bool)

(assert (=> b!1273608 (= e!726683 tp_is_empty!33105)))

(declare-fun b!1273609 () Bool)

(declare-fun e!726687 () Bool)

(assert (=> b!1273609 (= e!726687 tp_is_empty!33105)))

(declare-fun mapNonEmpty!51286 () Bool)

(declare-fun mapRes!51286 () Bool)

(declare-fun tp!97758 () Bool)

(assert (=> mapNonEmpty!51286 (= mapRes!51286 (and tp!97758 e!726683))))

(declare-fun mapRest!51286 () (Array (_ BitVec 32) ValueCell!15699))

(declare-fun mapKey!51286 () (_ BitVec 32))

(declare-fun mapValue!51286 () ValueCell!15699)

(assert (=> mapNonEmpty!51286 (= (arr!40266 (_values!6750 thiss!1551)) (store mapRest!51286 mapKey!51286 mapValue!51286))))

(declare-fun res!846909 () Bool)

(assert (=> start!107590 (=> (not res!846909) (not e!726684))))

(declare-fun simpleValid!470 (LongMapFixedSize!6162) Bool)

(assert (=> start!107590 (= res!846909 (simpleValid!470 thiss!1551))))

(assert (=> start!107590 e!726684))

(assert (=> start!107590 e!726686))

(declare-fun mapIsEmpty!51286 () Bool)

(assert (=> mapIsEmpty!51286 mapRes!51286))

(declare-fun b!1273610 () Bool)

(declare-fun res!846908 () Bool)

(assert (=> b!1273610 (=> (not res!846908) (not e!726684))))

(declare-fun arrayCountValidKeys!0 (array!83488 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273610 (= res!846908 (= (arrayCountValidKeys!0 (_keys!12141 thiss!1551) #b00000000000000000000000000000000 (size!40811 (_keys!12141 thiss!1551))) (_size!3136 thiss!1551)))))

(declare-fun b!1273611 () Bool)

(assert (=> b!1273611 (= e!726685 (and e!726687 mapRes!51286))))

(declare-fun condMapEmpty!51286 () Bool)

(declare-fun mapDefault!51286 () ValueCell!15699)

(assert (=> b!1273611 (= condMapEmpty!51286 (= (arr!40266 (_values!6750 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15699)) mapDefault!51286)))))

(assert (= (and start!107590 res!846909) b!1273610))

(assert (= (and b!1273610 res!846908) b!1273605))

(assert (= (and b!1273605 res!846907) b!1273606))

(assert (= (and b!1273611 condMapEmpty!51286) mapIsEmpty!51286))

(assert (= (and b!1273611 (not condMapEmpty!51286)) mapNonEmpty!51286))

(get-info :version)

(assert (= (and mapNonEmpty!51286 ((_ is ValueCellFull!15699) mapValue!51286)) b!1273608))

(assert (= (and b!1273611 ((_ is ValueCellFull!15699) mapDefault!51286)) b!1273609))

(assert (= b!1273607 b!1273611))

(assert (= start!107590 b!1273607))

(declare-fun m!1170713 () Bool)

(assert (=> b!1273605 m!1170713))

(declare-fun m!1170715 () Bool)

(assert (=> start!107590 m!1170715))

(declare-fun m!1170717 () Bool)

(assert (=> mapNonEmpty!51286 m!1170717))

(declare-fun m!1170719 () Bool)

(assert (=> b!1273607 m!1170719))

(declare-fun m!1170721 () Bool)

(assert (=> b!1273607 m!1170721))

(declare-fun m!1170723 () Bool)

(assert (=> b!1273610 m!1170723))

(check-sat (not b!1273607) tp_is_empty!33105 (not mapNonEmpty!51286) (not b_next!27735) (not start!107590) (not b!1273605) (not b!1273610) b_and!45791)
(check-sat b_and!45791 (not b_next!27735))
(get-model)

(declare-fun d!140017 () Bool)

(assert (=> d!140017 (= (validMask!0 (mask!34514 thiss!1551)) (and (or (= (mask!34514 thiss!1551) #b00000000000000000000000000000111) (= (mask!34514 thiss!1551) #b00000000000000000000000000001111) (= (mask!34514 thiss!1551) #b00000000000000000000000000011111) (= (mask!34514 thiss!1551) #b00000000000000000000000000111111) (= (mask!34514 thiss!1551) #b00000000000000000000000001111111) (= (mask!34514 thiss!1551) #b00000000000000000000000011111111) (= (mask!34514 thiss!1551) #b00000000000000000000000111111111) (= (mask!34514 thiss!1551) #b00000000000000000000001111111111) (= (mask!34514 thiss!1551) #b00000000000000000000011111111111) (= (mask!34514 thiss!1551) #b00000000000000000000111111111111) (= (mask!34514 thiss!1551) #b00000000000000000001111111111111) (= (mask!34514 thiss!1551) #b00000000000000000011111111111111) (= (mask!34514 thiss!1551) #b00000000000000000111111111111111) (= (mask!34514 thiss!1551) #b00000000000000001111111111111111) (= (mask!34514 thiss!1551) #b00000000000000011111111111111111) (= (mask!34514 thiss!1551) #b00000000000000111111111111111111) (= (mask!34514 thiss!1551) #b00000000000001111111111111111111) (= (mask!34514 thiss!1551) #b00000000000011111111111111111111) (= (mask!34514 thiss!1551) #b00000000000111111111111111111111) (= (mask!34514 thiss!1551) #b00000000001111111111111111111111) (= (mask!34514 thiss!1551) #b00000000011111111111111111111111) (= (mask!34514 thiss!1551) #b00000000111111111111111111111111) (= (mask!34514 thiss!1551) #b00000001111111111111111111111111) (= (mask!34514 thiss!1551) #b00000011111111111111111111111111) (= (mask!34514 thiss!1551) #b00000111111111111111111111111111) (= (mask!34514 thiss!1551) #b00001111111111111111111111111111) (= (mask!34514 thiss!1551) #b00011111111111111111111111111111) (= (mask!34514 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34514 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1273605 d!140017))

(declare-fun d!140019 () Bool)

(assert (=> d!140019 (= (array_inv!30613 (_keys!12141 thiss!1551)) (bvsge (size!40811 (_keys!12141 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273607 d!140019))

(declare-fun d!140021 () Bool)

(assert (=> d!140021 (= (array_inv!30614 (_values!6750 thiss!1551)) (bvsge (size!40810 (_values!6750 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273607 d!140021))

(declare-fun b!1273641 () Bool)

(declare-fun res!846929 () Bool)

(declare-fun e!726709 () Bool)

(assert (=> b!1273641 (=> (not res!846929) (not e!726709))))

(assert (=> b!1273641 (= res!846929 (and (= (size!40810 (_values!6750 thiss!1551)) (bvadd (mask!34514 thiss!1551) #b00000000000000000000000000000001)) (= (size!40811 (_keys!12141 thiss!1551)) (size!40810 (_values!6750 thiss!1551))) (bvsge (_size!3136 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3136 thiss!1551) (bvadd (mask!34514 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273643 () Bool)

(declare-fun res!846927 () Bool)

(assert (=> b!1273643 (=> (not res!846927) (not e!726709))))

(declare-fun size!40814 (LongMapFixedSize!6162) (_ BitVec 32))

(assert (=> b!1273643 (= res!846927 (= (size!40814 thiss!1551) (bvadd (_size!3136 thiss!1551) (bvsdiv (bvadd (extraKeys!6406 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!140023 () Bool)

(declare-fun res!846930 () Bool)

(assert (=> d!140023 (=> (not res!846930) (not e!726709))))

(assert (=> d!140023 (= res!846930 (validMask!0 (mask!34514 thiss!1551)))))

(assert (=> d!140023 (= (simpleValid!470 thiss!1551) e!726709)))

(declare-fun b!1273644 () Bool)

(assert (=> b!1273644 (= e!726709 (and (bvsge (extraKeys!6406 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6406 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3136 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273642 () Bool)

(declare-fun res!846928 () Bool)

(assert (=> b!1273642 (=> (not res!846928) (not e!726709))))

(assert (=> b!1273642 (= res!846928 (bvsge (size!40814 thiss!1551) (_size!3136 thiss!1551)))))

(assert (= (and d!140023 res!846930) b!1273641))

(assert (= (and b!1273641 res!846929) b!1273642))

(assert (= (and b!1273642 res!846928) b!1273643))

(assert (= (and b!1273643 res!846927) b!1273644))

(declare-fun m!1170737 () Bool)

(assert (=> b!1273643 m!1170737))

(assert (=> d!140023 m!1170713))

(assert (=> b!1273642 m!1170737))

(assert (=> start!107590 d!140023))

(declare-fun bm!62600 () Bool)

(declare-fun call!62603 () (_ BitVec 32))

(assert (=> bm!62600 (= call!62603 (arrayCountValidKeys!0 (_keys!12141 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40811 (_keys!12141 thiss!1551))))))

(declare-fun b!1273653 () Bool)

(declare-fun e!726714 () (_ BitVec 32))

(assert (=> b!1273653 (= e!726714 (bvadd #b00000000000000000000000000000001 call!62603))))

(declare-fun b!1273654 () Bool)

(declare-fun e!726715 () (_ BitVec 32))

(assert (=> b!1273654 (= e!726715 e!726714)))

(declare-fun c!123770 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273654 (= c!123770 (validKeyInArray!0 (select (arr!40267 (_keys!12141 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273655 () Bool)

(assert (=> b!1273655 (= e!726715 #b00000000000000000000000000000000)))

(declare-fun d!140025 () Bool)

(declare-fun lt!575137 () (_ BitVec 32))

(assert (=> d!140025 (and (bvsge lt!575137 #b00000000000000000000000000000000) (bvsle lt!575137 (bvsub (size!40811 (_keys!12141 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140025 (= lt!575137 e!726715)))

(declare-fun c!123771 () Bool)

(assert (=> d!140025 (= c!123771 (bvsge #b00000000000000000000000000000000 (size!40811 (_keys!12141 thiss!1551))))))

(assert (=> d!140025 (and (bvsle #b00000000000000000000000000000000 (size!40811 (_keys!12141 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40811 (_keys!12141 thiss!1551)) (size!40811 (_keys!12141 thiss!1551))))))

(assert (=> d!140025 (= (arrayCountValidKeys!0 (_keys!12141 thiss!1551) #b00000000000000000000000000000000 (size!40811 (_keys!12141 thiss!1551))) lt!575137)))

(declare-fun b!1273656 () Bool)

(assert (=> b!1273656 (= e!726714 call!62603)))

(assert (= (and d!140025 c!123771) b!1273655))

(assert (= (and d!140025 (not c!123771)) b!1273654))

(assert (= (and b!1273654 c!123770) b!1273653))

(assert (= (and b!1273654 (not c!123770)) b!1273656))

(assert (= (or b!1273653 b!1273656) bm!62600))

(declare-fun m!1170739 () Bool)

(assert (=> bm!62600 m!1170739))

(declare-fun m!1170741 () Bool)

(assert (=> b!1273654 m!1170741))

(assert (=> b!1273654 m!1170741))

(declare-fun m!1170743 () Bool)

(assert (=> b!1273654 m!1170743))

(assert (=> b!1273610 d!140025))

(declare-fun mapNonEmpty!51292 () Bool)

(declare-fun mapRes!51292 () Bool)

(declare-fun tp!97768 () Bool)

(declare-fun e!726721 () Bool)

(assert (=> mapNonEmpty!51292 (= mapRes!51292 (and tp!97768 e!726721))))

(declare-fun mapKey!51292 () (_ BitVec 32))

(declare-fun mapRest!51292 () (Array (_ BitVec 32) ValueCell!15699))

(declare-fun mapValue!51292 () ValueCell!15699)

(assert (=> mapNonEmpty!51292 (= mapRest!51286 (store mapRest!51292 mapKey!51292 mapValue!51292))))

(declare-fun condMapEmpty!51292 () Bool)

(declare-fun mapDefault!51292 () ValueCell!15699)

(assert (=> mapNonEmpty!51286 (= condMapEmpty!51292 (= mapRest!51286 ((as const (Array (_ BitVec 32) ValueCell!15699)) mapDefault!51292)))))

(declare-fun e!726720 () Bool)

(assert (=> mapNonEmpty!51286 (= tp!97758 (and e!726720 mapRes!51292))))

(declare-fun b!1273664 () Bool)

(assert (=> b!1273664 (= e!726720 tp_is_empty!33105)))

(declare-fun b!1273663 () Bool)

(assert (=> b!1273663 (= e!726721 tp_is_empty!33105)))

(declare-fun mapIsEmpty!51292 () Bool)

(assert (=> mapIsEmpty!51292 mapRes!51292))

(assert (= (and mapNonEmpty!51286 condMapEmpty!51292) mapIsEmpty!51292))

(assert (= (and mapNonEmpty!51286 (not condMapEmpty!51292)) mapNonEmpty!51292))

(assert (= (and mapNonEmpty!51292 ((_ is ValueCellFull!15699) mapValue!51292)) b!1273663))

(assert (= (and mapNonEmpty!51286 ((_ is ValueCellFull!15699) mapDefault!51292)) b!1273664))

(declare-fun m!1170745 () Bool)

(assert (=> mapNonEmpty!51292 m!1170745))

(check-sat (not bm!62600) tp_is_empty!33105 (not d!140023) (not mapNonEmpty!51292) (not b!1273642) (not b_next!27735) (not b!1273643) (not b!1273654) b_and!45791)
(check-sat b_and!45791 (not b_next!27735))
