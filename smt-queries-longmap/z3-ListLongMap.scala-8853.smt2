; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107592 () Bool)

(assert start!107592)

(declare-fun b!1273653 () Bool)

(declare-fun b_free!27661 () Bool)

(declare-fun b_next!27661 () Bool)

(assert (=> b!1273653 (= b_free!27661 (not b_next!27661))))

(declare-fun tp!97495 () Bool)

(declare-fun b_and!45719 () Bool)

(assert (=> b!1273653 (= tp!97495 b_and!45719)))

(declare-fun mapNonEmpty!51133 () Bool)

(declare-fun mapRes!51133 () Bool)

(declare-fun tp!97494 () Bool)

(declare-fun e!726541 () Bool)

(assert (=> mapNonEmpty!51133 (= mapRes!51133 (and tp!97494 e!726541))))

(declare-datatypes ((V!49235 0))(
  ( (V!49236 (val!16590 Int)) )
))
(declare-datatypes ((ValueCell!15662 0))(
  ( (ValueCellFull!15662 (v!19222 V!49235)) (EmptyCell!15662) )
))
(declare-datatypes ((array!83331 0))(
  ( (array!83332 (arr!40196 (Array (_ BitVec 32) ValueCell!15662)) (size!40733 (_ BitVec 32))) )
))
(declare-datatypes ((array!83333 0))(
  ( (array!83334 (arr!40197 (Array (_ BitVec 32) (_ BitVec 64))) (size!40734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6088 0))(
  ( (LongMapFixedSize!6089 (defaultEntry!6690 Int) (mask!34494 (_ BitVec 32)) (extraKeys!6369 (_ BitVec 32)) (zeroValue!6475 V!49235) (minValue!6475 V!49235) (_size!3099 (_ BitVec 32)) (_keys!12134 array!83333) (_values!6713 array!83331) (_vacant!3099 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6088)

(declare-fun mapValue!51133 () ValueCell!15662)

(declare-fun mapRest!51133 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapKey!51133 () (_ BitVec 32))

(assert (=> mapNonEmpty!51133 (= (arr!40196 (_values!6713 thiss!1559)) (store mapRest!51133 mapKey!51133 mapValue!51133))))

(declare-fun e!726537 () Bool)

(declare-fun tp_is_empty!33031 () Bool)

(declare-fun e!726539 () Bool)

(declare-fun array_inv!30737 (array!83333) Bool)

(declare-fun array_inv!30738 (array!83331) Bool)

(assert (=> b!1273653 (= e!726539 (and tp!97495 tp_is_empty!33031 (array_inv!30737 (_keys!12134 thiss!1559)) (array_inv!30738 (_values!6713 thiss!1559)) e!726537))))

(declare-fun b!1273654 () Bool)

(declare-fun e!726540 () Bool)

(assert (=> b!1273654 (= e!726540 tp_is_empty!33031)))

(declare-fun mapIsEmpty!51133 () Bool)

(assert (=> mapIsEmpty!51133 mapRes!51133))

(declare-fun res!846883 () Bool)

(declare-fun e!726538 () Bool)

(assert (=> start!107592 (=> (not res!846883) (not e!726538))))

(declare-fun valid!2288 (LongMapFixedSize!6088) Bool)

(assert (=> start!107592 (= res!846883 (valid!2288 thiss!1559))))

(assert (=> start!107592 e!726538))

(assert (=> start!107592 e!726539))

(declare-fun b!1273652 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273652 (= e!726538 (not (validMask!0 (mask!34494 thiss!1559))))))

(declare-fun b!1273655 () Bool)

(assert (=> b!1273655 (= e!726537 (and e!726540 mapRes!51133))))

(declare-fun condMapEmpty!51133 () Bool)

(declare-fun mapDefault!51133 () ValueCell!15662)

(assert (=> b!1273655 (= condMapEmpty!51133 (= (arr!40196 (_values!6713 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15662)) mapDefault!51133)))))

(declare-fun b!1273656 () Bool)

(assert (=> b!1273656 (= e!726541 tp_is_empty!33031)))

(assert (= (and start!107592 res!846883) b!1273652))

(assert (= (and b!1273655 condMapEmpty!51133) mapIsEmpty!51133))

(assert (= (and b!1273655 (not condMapEmpty!51133)) mapNonEmpty!51133))

(get-info :version)

(assert (= (and mapNonEmpty!51133 ((_ is ValueCellFull!15662) mapValue!51133)) b!1273656))

(assert (= (and b!1273655 ((_ is ValueCellFull!15662) mapDefault!51133)) b!1273654))

(assert (= b!1273653 b!1273655))

(assert (= start!107592 b!1273653))

(declare-fun m!1171671 () Bool)

(assert (=> mapNonEmpty!51133 m!1171671))

(declare-fun m!1171673 () Bool)

(assert (=> b!1273653 m!1171673))

(declare-fun m!1171675 () Bool)

(assert (=> b!1273653 m!1171675))

(declare-fun m!1171677 () Bool)

(assert (=> start!107592 m!1171677))

(declare-fun m!1171679 () Bool)

(assert (=> b!1273652 m!1171679))

(check-sat (not mapNonEmpty!51133) (not start!107592) (not b_next!27661) tp_is_empty!33031 b_and!45719 (not b!1273653) (not b!1273652))
(check-sat b_and!45719 (not b_next!27661))
(get-model)

(declare-fun d!140293 () Bool)

(declare-fun res!846896 () Bool)

(declare-fun e!726581 () Bool)

(assert (=> d!140293 (=> (not res!846896) (not e!726581))))

(declare-fun simpleValid!455 (LongMapFixedSize!6088) Bool)

(assert (=> d!140293 (= res!846896 (simpleValid!455 thiss!1559))))

(assert (=> d!140293 (= (valid!2288 thiss!1559) e!726581)))

(declare-fun b!1273693 () Bool)

(declare-fun res!846897 () Bool)

(assert (=> b!1273693 (=> (not res!846897) (not e!726581))))

(declare-fun arrayCountValidKeys!0 (array!83333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273693 (= res!846897 (= (arrayCountValidKeys!0 (_keys!12134 thiss!1559) #b00000000000000000000000000000000 (size!40734 (_keys!12134 thiss!1559))) (_size!3099 thiss!1559)))))

(declare-fun b!1273694 () Bool)

(declare-fun res!846898 () Bool)

(assert (=> b!1273694 (=> (not res!846898) (not e!726581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83333 (_ BitVec 32)) Bool)

(assert (=> b!1273694 (= res!846898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12134 thiss!1559) (mask!34494 thiss!1559)))))

(declare-fun b!1273695 () Bool)

(declare-datatypes ((List!28584 0))(
  ( (Nil!28581) (Cons!28580 (h!29798 (_ BitVec 64)) (t!42109 List!28584)) )
))
(declare-fun arrayNoDuplicates!0 (array!83333 (_ BitVec 32) List!28584) Bool)

(assert (=> b!1273695 (= e!726581 (arrayNoDuplicates!0 (_keys!12134 thiss!1559) #b00000000000000000000000000000000 Nil!28581))))

(assert (= (and d!140293 res!846896) b!1273693))

(assert (= (and b!1273693 res!846897) b!1273694))

(assert (= (and b!1273694 res!846898) b!1273695))

(declare-fun m!1171701 () Bool)

(assert (=> d!140293 m!1171701))

(declare-fun m!1171703 () Bool)

(assert (=> b!1273693 m!1171703))

(declare-fun m!1171705 () Bool)

(assert (=> b!1273694 m!1171705))

(declare-fun m!1171707 () Bool)

(assert (=> b!1273695 m!1171707))

(assert (=> start!107592 d!140293))

(declare-fun d!140295 () Bool)

(assert (=> d!140295 (= (array_inv!30737 (_keys!12134 thiss!1559)) (bvsge (size!40734 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273653 d!140295))

(declare-fun d!140297 () Bool)

(assert (=> d!140297 (= (array_inv!30738 (_values!6713 thiss!1559)) (bvsge (size!40733 (_values!6713 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273653 d!140297))

(declare-fun d!140299 () Bool)

(assert (=> d!140299 (= (validMask!0 (mask!34494 thiss!1559)) (and (or (= (mask!34494 thiss!1559) #b00000000000000000000000000000111) (= (mask!34494 thiss!1559) #b00000000000000000000000000001111) (= (mask!34494 thiss!1559) #b00000000000000000000000000011111) (= (mask!34494 thiss!1559) #b00000000000000000000000000111111) (= (mask!34494 thiss!1559) #b00000000000000000000000001111111) (= (mask!34494 thiss!1559) #b00000000000000000000000011111111) (= (mask!34494 thiss!1559) #b00000000000000000000000111111111) (= (mask!34494 thiss!1559) #b00000000000000000000001111111111) (= (mask!34494 thiss!1559) #b00000000000000000000011111111111) (= (mask!34494 thiss!1559) #b00000000000000000000111111111111) (= (mask!34494 thiss!1559) #b00000000000000000001111111111111) (= (mask!34494 thiss!1559) #b00000000000000000011111111111111) (= (mask!34494 thiss!1559) #b00000000000000000111111111111111) (= (mask!34494 thiss!1559) #b00000000000000001111111111111111) (= (mask!34494 thiss!1559) #b00000000000000011111111111111111) (= (mask!34494 thiss!1559) #b00000000000000111111111111111111) (= (mask!34494 thiss!1559) #b00000000000001111111111111111111) (= (mask!34494 thiss!1559) #b00000000000011111111111111111111) (= (mask!34494 thiss!1559) #b00000000000111111111111111111111) (= (mask!34494 thiss!1559) #b00000000001111111111111111111111) (= (mask!34494 thiss!1559) #b00000000011111111111111111111111) (= (mask!34494 thiss!1559) #b00000000111111111111111111111111) (= (mask!34494 thiss!1559) #b00000001111111111111111111111111) (= (mask!34494 thiss!1559) #b00000011111111111111111111111111) (= (mask!34494 thiss!1559) #b00000111111111111111111111111111) (= (mask!34494 thiss!1559) #b00001111111111111111111111111111) (= (mask!34494 thiss!1559) #b00011111111111111111111111111111) (= (mask!34494 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34494 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273652 d!140299))

(declare-fun mapNonEmpty!51142 () Bool)

(declare-fun mapRes!51142 () Bool)

(declare-fun tp!97510 () Bool)

(declare-fun e!726586 () Bool)

(assert (=> mapNonEmpty!51142 (= mapRes!51142 (and tp!97510 e!726586))))

(declare-fun mapKey!51142 () (_ BitVec 32))

(declare-fun mapRest!51142 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapValue!51142 () ValueCell!15662)

(assert (=> mapNonEmpty!51142 (= mapRest!51133 (store mapRest!51142 mapKey!51142 mapValue!51142))))

(declare-fun mapIsEmpty!51142 () Bool)

(assert (=> mapIsEmpty!51142 mapRes!51142))

(declare-fun b!1273703 () Bool)

(declare-fun e!726587 () Bool)

(assert (=> b!1273703 (= e!726587 tp_is_empty!33031)))

(declare-fun condMapEmpty!51142 () Bool)

(declare-fun mapDefault!51142 () ValueCell!15662)

(assert (=> mapNonEmpty!51133 (= condMapEmpty!51142 (= mapRest!51133 ((as const (Array (_ BitVec 32) ValueCell!15662)) mapDefault!51142)))))

(assert (=> mapNonEmpty!51133 (= tp!97494 (and e!726587 mapRes!51142))))

(declare-fun b!1273702 () Bool)

(assert (=> b!1273702 (= e!726586 tp_is_empty!33031)))

(assert (= (and mapNonEmpty!51133 condMapEmpty!51142) mapIsEmpty!51142))

(assert (= (and mapNonEmpty!51133 (not condMapEmpty!51142)) mapNonEmpty!51142))

(assert (= (and mapNonEmpty!51142 ((_ is ValueCellFull!15662) mapValue!51142)) b!1273702))

(assert (= (and mapNonEmpty!51133 ((_ is ValueCellFull!15662) mapDefault!51142)) b!1273703))

(declare-fun m!1171709 () Bool)

(assert (=> mapNonEmpty!51142 m!1171709))

(check-sat (not mapNonEmpty!51142) (not b_next!27661) (not b!1273694) (not b!1273695) b_and!45719 (not b!1273693) (not d!140293) tp_is_empty!33031)
(check-sat b_and!45719 (not b_next!27661))
(get-model)

(declare-fun bm!62602 () Bool)

(declare-fun call!62605 () Bool)

(declare-fun c!124087 () Bool)

(assert (=> bm!62602 (= call!62605 (arrayNoDuplicates!0 (_keys!12134 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124087 (Cons!28580 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000) Nil!28581) Nil!28581)))))

(declare-fun b!1273714 () Bool)

(declare-fun e!726597 () Bool)

(declare-fun contains!7692 (List!28584 (_ BitVec 64)) Bool)

(assert (=> b!1273714 (= e!726597 (contains!7692 Nil!28581 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273715 () Bool)

(declare-fun e!726596 () Bool)

(assert (=> b!1273715 (= e!726596 call!62605)))

(declare-fun b!1273716 () Bool)

(declare-fun e!726599 () Bool)

(assert (=> b!1273716 (= e!726599 e!726596)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273716 (= c!124087 (validKeyInArray!0 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273717 () Bool)

(assert (=> b!1273717 (= e!726596 call!62605)))

(declare-fun d!140301 () Bool)

(declare-fun res!846906 () Bool)

(declare-fun e!726598 () Bool)

(assert (=> d!140301 (=> res!846906 e!726598)))

(assert (=> d!140301 (= res!846906 (bvsge #b00000000000000000000000000000000 (size!40734 (_keys!12134 thiss!1559))))))

(assert (=> d!140301 (= (arrayNoDuplicates!0 (_keys!12134 thiss!1559) #b00000000000000000000000000000000 Nil!28581) e!726598)))

(declare-fun b!1273718 () Bool)

(assert (=> b!1273718 (= e!726598 e!726599)))

(declare-fun res!846905 () Bool)

(assert (=> b!1273718 (=> (not res!846905) (not e!726599))))

(assert (=> b!1273718 (= res!846905 (not e!726597))))

(declare-fun res!846907 () Bool)

(assert (=> b!1273718 (=> (not res!846907) (not e!726597))))

(assert (=> b!1273718 (= res!846907 (validKeyInArray!0 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!140301 (not res!846906)) b!1273718))

(assert (= (and b!1273718 res!846907) b!1273714))

(assert (= (and b!1273718 res!846905) b!1273716))

(assert (= (and b!1273716 c!124087) b!1273717))

(assert (= (and b!1273716 (not c!124087)) b!1273715))

(assert (= (or b!1273717 b!1273715) bm!62602))

(declare-fun m!1171711 () Bool)

(assert (=> bm!62602 m!1171711))

(declare-fun m!1171713 () Bool)

(assert (=> bm!62602 m!1171713))

(assert (=> b!1273714 m!1171711))

(assert (=> b!1273714 m!1171711))

(declare-fun m!1171715 () Bool)

(assert (=> b!1273714 m!1171715))

(assert (=> b!1273716 m!1171711))

(assert (=> b!1273716 m!1171711))

(declare-fun m!1171717 () Bool)

(assert (=> b!1273716 m!1171717))

(assert (=> b!1273718 m!1171711))

(assert (=> b!1273718 m!1171711))

(assert (=> b!1273718 m!1171717))

(assert (=> b!1273695 d!140301))

(declare-fun bm!62605 () Bool)

(declare-fun call!62608 () Bool)

(assert (=> bm!62605 (= call!62608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12134 thiss!1559) (mask!34494 thiss!1559)))))

(declare-fun b!1273727 () Bool)

(declare-fun e!726608 () Bool)

(declare-fun e!726606 () Bool)

(assert (=> b!1273727 (= e!726608 e!726606)))

(declare-fun c!124090 () Bool)

(assert (=> b!1273727 (= c!124090 (validKeyInArray!0 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!140303 () Bool)

(declare-fun res!846912 () Bool)

(assert (=> d!140303 (=> res!846912 e!726608)))

(assert (=> d!140303 (= res!846912 (bvsge #b00000000000000000000000000000000 (size!40734 (_keys!12134 thiss!1559))))))

(assert (=> d!140303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12134 thiss!1559) (mask!34494 thiss!1559)) e!726608)))

(declare-fun b!1273728 () Bool)

(declare-fun e!726607 () Bool)

(assert (=> b!1273728 (= e!726607 call!62608)))

(declare-fun b!1273729 () Bool)

(assert (=> b!1273729 (= e!726606 call!62608)))

(declare-fun b!1273730 () Bool)

(assert (=> b!1273730 (= e!726606 e!726607)))

(declare-fun lt!575537 () (_ BitVec 64))

(assert (=> b!1273730 (= lt!575537 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42289 0))(
  ( (Unit!42290) )
))
(declare-fun lt!575536 () Unit!42289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83333 (_ BitVec 64) (_ BitVec 32)) Unit!42289)

(assert (=> b!1273730 (= lt!575536 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12134 thiss!1559) lt!575537 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273730 (arrayContainsKey!0 (_keys!12134 thiss!1559) lt!575537 #b00000000000000000000000000000000)))

(declare-fun lt!575535 () Unit!42289)

(assert (=> b!1273730 (= lt!575535 lt!575536)))

(declare-fun res!846913 () Bool)

(declare-datatypes ((SeekEntryResult!9945 0))(
  ( (MissingZero!9945 (index!42151 (_ BitVec 32))) (Found!9945 (index!42152 (_ BitVec 32))) (Intermediate!9945 (undefined!10757 Bool) (index!42153 (_ BitVec 32)) (x!112388 (_ BitVec 32))) (Undefined!9945) (MissingVacant!9945 (index!42154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83333 (_ BitVec 32)) SeekEntryResult!9945)

(assert (=> b!1273730 (= res!846913 (= (seekEntryOrOpen!0 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000) (_keys!12134 thiss!1559) (mask!34494 thiss!1559)) (Found!9945 #b00000000000000000000000000000000)))))

(assert (=> b!1273730 (=> (not res!846913) (not e!726607))))

(assert (= (and d!140303 (not res!846912)) b!1273727))

(assert (= (and b!1273727 c!124090) b!1273730))

(assert (= (and b!1273727 (not c!124090)) b!1273729))

(assert (= (and b!1273730 res!846913) b!1273728))

(assert (= (or b!1273728 b!1273729) bm!62605))

(declare-fun m!1171719 () Bool)

(assert (=> bm!62605 m!1171719))

(assert (=> b!1273727 m!1171711))

(assert (=> b!1273727 m!1171711))

(assert (=> b!1273727 m!1171717))

(assert (=> b!1273730 m!1171711))

(declare-fun m!1171721 () Bool)

(assert (=> b!1273730 m!1171721))

(declare-fun m!1171723 () Bool)

(assert (=> b!1273730 m!1171723))

(assert (=> b!1273730 m!1171711))

(declare-fun m!1171725 () Bool)

(assert (=> b!1273730 m!1171725))

(assert (=> b!1273694 d!140303))

(declare-fun b!1273739 () Bool)

(declare-fun e!726614 () (_ BitVec 32))

(declare-fun e!726613 () (_ BitVec 32))

(assert (=> b!1273739 (= e!726614 e!726613)))

(declare-fun c!124096 () Bool)

(assert (=> b!1273739 (= c!124096 (validKeyInArray!0 (select (arr!40197 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273740 () Bool)

(assert (=> b!1273740 (= e!726614 #b00000000000000000000000000000000)))

(declare-fun d!140305 () Bool)

(declare-fun lt!575540 () (_ BitVec 32))

(assert (=> d!140305 (and (bvsge lt!575540 #b00000000000000000000000000000000) (bvsle lt!575540 (bvsub (size!40734 (_keys!12134 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!140305 (= lt!575540 e!726614)))

(declare-fun c!124095 () Bool)

(assert (=> d!140305 (= c!124095 (bvsge #b00000000000000000000000000000000 (size!40734 (_keys!12134 thiss!1559))))))

(assert (=> d!140305 (and (bvsle #b00000000000000000000000000000000 (size!40734 (_keys!12134 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40734 (_keys!12134 thiss!1559)) (size!40734 (_keys!12134 thiss!1559))))))

(assert (=> d!140305 (= (arrayCountValidKeys!0 (_keys!12134 thiss!1559) #b00000000000000000000000000000000 (size!40734 (_keys!12134 thiss!1559))) lt!575540)))

(declare-fun b!1273741 () Bool)

(declare-fun call!62611 () (_ BitVec 32))

(assert (=> b!1273741 (= e!726613 (bvadd #b00000000000000000000000000000001 call!62611))))

(declare-fun b!1273742 () Bool)

(assert (=> b!1273742 (= e!726613 call!62611)))

(declare-fun bm!62608 () Bool)

(assert (=> bm!62608 (= call!62611 (arrayCountValidKeys!0 (_keys!12134 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40734 (_keys!12134 thiss!1559))))))

(assert (= (and d!140305 c!124095) b!1273740))

(assert (= (and d!140305 (not c!124095)) b!1273739))

(assert (= (and b!1273739 c!124096) b!1273741))

(assert (= (and b!1273739 (not c!124096)) b!1273742))

(assert (= (or b!1273741 b!1273742) bm!62608))

(assert (=> b!1273739 m!1171711))

(assert (=> b!1273739 m!1171711))

(assert (=> b!1273739 m!1171717))

(declare-fun m!1171727 () Bool)

(assert (=> bm!62608 m!1171727))

(assert (=> b!1273693 d!140305))

(declare-fun b!1273754 () Bool)

(declare-fun e!726617 () Bool)

(assert (=> b!1273754 (= e!726617 (and (bvsge (extraKeys!6369 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6369 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3099 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun d!140307 () Bool)

(declare-fun res!846923 () Bool)

(assert (=> d!140307 (=> (not res!846923) (not e!726617))))

(assert (=> d!140307 (= res!846923 (validMask!0 (mask!34494 thiss!1559)))))

(assert (=> d!140307 (= (simpleValid!455 thiss!1559) e!726617)))

(declare-fun b!1273751 () Bool)

(declare-fun res!846924 () Bool)

(assert (=> b!1273751 (=> (not res!846924) (not e!726617))))

(assert (=> b!1273751 (= res!846924 (and (= (size!40733 (_values!6713 thiss!1559)) (bvadd (mask!34494 thiss!1559) #b00000000000000000000000000000001)) (= (size!40734 (_keys!12134 thiss!1559)) (size!40733 (_values!6713 thiss!1559))) (bvsge (_size!3099 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3099 thiss!1559) (bvadd (mask!34494 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1273753 () Bool)

(declare-fun res!846925 () Bool)

(assert (=> b!1273753 (=> (not res!846925) (not e!726617))))

(declare-fun size!40739 (LongMapFixedSize!6088) (_ BitVec 32))

(assert (=> b!1273753 (= res!846925 (= (size!40739 thiss!1559) (bvadd (_size!3099 thiss!1559) (bvsdiv (bvadd (extraKeys!6369 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273752 () Bool)

(declare-fun res!846922 () Bool)

(assert (=> b!1273752 (=> (not res!846922) (not e!726617))))

(assert (=> b!1273752 (= res!846922 (bvsge (size!40739 thiss!1559) (_size!3099 thiss!1559)))))

(assert (= (and d!140307 res!846923) b!1273751))

(assert (= (and b!1273751 res!846924) b!1273752))

(assert (= (and b!1273752 res!846922) b!1273753))

(assert (= (and b!1273753 res!846925) b!1273754))

(assert (=> d!140307 m!1171679))

(declare-fun m!1171729 () Bool)

(assert (=> b!1273753 m!1171729))

(assert (=> b!1273752 m!1171729))

(assert (=> d!140293 d!140307))

(declare-fun mapNonEmpty!51143 () Bool)

(declare-fun mapRes!51143 () Bool)

(declare-fun tp!97511 () Bool)

(declare-fun e!726618 () Bool)

(assert (=> mapNonEmpty!51143 (= mapRes!51143 (and tp!97511 e!726618))))

(declare-fun mapRest!51143 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapValue!51143 () ValueCell!15662)

(declare-fun mapKey!51143 () (_ BitVec 32))

(assert (=> mapNonEmpty!51143 (= mapRest!51142 (store mapRest!51143 mapKey!51143 mapValue!51143))))

(declare-fun mapIsEmpty!51143 () Bool)

(assert (=> mapIsEmpty!51143 mapRes!51143))

(declare-fun b!1273756 () Bool)

(declare-fun e!726619 () Bool)

(assert (=> b!1273756 (= e!726619 tp_is_empty!33031)))

(declare-fun condMapEmpty!51143 () Bool)

(declare-fun mapDefault!51143 () ValueCell!15662)

(assert (=> mapNonEmpty!51142 (= condMapEmpty!51143 (= mapRest!51142 ((as const (Array (_ BitVec 32) ValueCell!15662)) mapDefault!51143)))))

(assert (=> mapNonEmpty!51142 (= tp!97510 (and e!726619 mapRes!51143))))

(declare-fun b!1273755 () Bool)

(assert (=> b!1273755 (= e!726618 tp_is_empty!33031)))

(assert (= (and mapNonEmpty!51142 condMapEmpty!51143) mapIsEmpty!51143))

(assert (= (and mapNonEmpty!51142 (not condMapEmpty!51143)) mapNonEmpty!51143))

(assert (= (and mapNonEmpty!51143 ((_ is ValueCellFull!15662) mapValue!51143)) b!1273755))

(assert (= (and mapNonEmpty!51142 ((_ is ValueCellFull!15662) mapDefault!51143)) b!1273756))

(declare-fun m!1171731 () Bool)

(assert (=> mapNonEmpty!51143 m!1171731))

(check-sat (not d!140307) (not bm!62602) (not mapNonEmpty!51143) (not b!1273727) (not b!1273716) (not b_next!27661) (not b!1273752) (not b!1273714) (not b!1273739) (not b!1273718) (not bm!62608) (not b!1273730) (not b!1273753) tp_is_empty!33031 b_and!45719 (not bm!62605))
(check-sat b_and!45719 (not b_next!27661))
