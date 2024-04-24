; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107732 () Bool)

(assert start!107732)

(declare-fun b!1274436 () Bool)

(declare-fun b_free!27703 () Bool)

(declare-fun b_next!27703 () Bool)

(assert (=> b!1274436 (= b_free!27703 (not b_next!27703))))

(declare-fun tp!97647 () Bool)

(declare-fun b_and!45761 () Bool)

(assert (=> b!1274436 (= tp!97647 b_and!45761)))

(declare-fun b!1274432 () Bool)

(declare-fun res!847222 () Bool)

(declare-fun e!727150 () Bool)

(assert (=> b!1274432 (=> (not res!847222) (not e!727150))))

(declare-datatypes ((V!49291 0))(
  ( (V!49292 (val!16611 Int)) )
))
(declare-datatypes ((ValueCell!15683 0))(
  ( (ValueCellFull!15683 (v!19243 V!49291)) (EmptyCell!15683) )
))
(declare-datatypes ((array!83429 0))(
  ( (array!83430 (arr!40238 (Array (_ BitVec 32) ValueCell!15683)) (size!40780 (_ BitVec 32))) )
))
(declare-datatypes ((array!83431 0))(
  ( (array!83432 (arr!40239 (Array (_ BitVec 32) (_ BitVec 64))) (size!40781 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6130 0))(
  ( (LongMapFixedSize!6131 (defaultEntry!6711 Int) (mask!34542 (_ BitVec 32)) (extraKeys!6390 (_ BitVec 32)) (zeroValue!6496 V!49291) (minValue!6496 V!49291) (_size!3120 (_ BitVec 32)) (_keys!12161 array!83431) (_values!6734 array!83429) (_vacant!3120 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6130)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274432 (= res!847222 (validMask!0 (mask!34542 thiss!1559)))))

(declare-fun b!1274433 () Bool)

(declare-fun res!847221 () Bool)

(assert (=> b!1274433 (=> (not res!847221) (not e!727150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83431 (_ BitVec 32)) Bool)

(assert (=> b!1274433 (= res!847221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12161 thiss!1559) (mask!34542 thiss!1559)))))

(declare-fun b!1274434 () Bool)

(declare-fun e!727149 () Bool)

(declare-fun tp_is_empty!33073 () Bool)

(assert (=> b!1274434 (= e!727149 tp_is_empty!33073)))

(declare-fun b!1274435 () Bool)

(declare-fun e!727151 () Bool)

(assert (=> b!1274435 (= e!727151 tp_is_empty!33073)))

(declare-fun res!847219 () Bool)

(assert (=> start!107732 (=> (not res!847219) (not e!727150))))

(declare-fun valid!2301 (LongMapFixedSize!6130) Bool)

(assert (=> start!107732 (= res!847219 (valid!2301 thiss!1559))))

(assert (=> start!107732 e!727150))

(declare-fun e!727152 () Bool)

(assert (=> start!107732 e!727152))

(declare-fun e!727147 () Bool)

(declare-fun array_inv!30771 (array!83431) Bool)

(declare-fun array_inv!30772 (array!83429) Bool)

(assert (=> b!1274436 (= e!727152 (and tp!97647 tp_is_empty!33073 (array_inv!30771 (_keys!12161 thiss!1559)) (array_inv!30772 (_values!6734 thiss!1559)) e!727147))))

(declare-fun mapIsEmpty!51222 () Bool)

(declare-fun mapRes!51222 () Bool)

(assert (=> mapIsEmpty!51222 mapRes!51222))

(declare-fun mapNonEmpty!51222 () Bool)

(declare-fun tp!97646 () Bool)

(assert (=> mapNonEmpty!51222 (= mapRes!51222 (and tp!97646 e!727151))))

(declare-fun mapRest!51222 () (Array (_ BitVec 32) ValueCell!15683))

(declare-fun mapValue!51222 () ValueCell!15683)

(declare-fun mapKey!51222 () (_ BitVec 32))

(assert (=> mapNonEmpty!51222 (= (arr!40238 (_values!6734 thiss!1559)) (store mapRest!51222 mapKey!51222 mapValue!51222))))

(declare-fun b!1274437 () Bool)

(declare-datatypes ((List!28591 0))(
  ( (Nil!28588) (Cons!28587 (h!29805 (_ BitVec 64)) (t!42116 List!28591)) )
))
(declare-fun arrayNoDuplicates!0 (array!83431 (_ BitVec 32) List!28591) Bool)

(assert (=> b!1274437 (= e!727150 (not (arrayNoDuplicates!0 (_keys!12161 thiss!1559) #b00000000000000000000000000000000 Nil!28588)))))

(declare-fun b!1274438 () Bool)

(assert (=> b!1274438 (= e!727147 (and e!727149 mapRes!51222))))

(declare-fun condMapEmpty!51222 () Bool)

(declare-fun mapDefault!51222 () ValueCell!15683)

(assert (=> b!1274438 (= condMapEmpty!51222 (= (arr!40238 (_values!6734 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15683)) mapDefault!51222)))))

(declare-fun b!1274439 () Bool)

(declare-fun res!847220 () Bool)

(assert (=> b!1274439 (=> (not res!847220) (not e!727150))))

(assert (=> b!1274439 (= res!847220 (and (= (size!40780 (_values!6734 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34542 thiss!1559))) (= (size!40781 (_keys!12161 thiss!1559)) (size!40780 (_values!6734 thiss!1559))) (bvsge (mask!34542 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6390 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6390 thiss!1559) #b00000000000000000000000000000011)))))

(assert (= (and start!107732 res!847219) b!1274432))

(assert (= (and b!1274432 res!847222) b!1274439))

(assert (= (and b!1274439 res!847220) b!1274433))

(assert (= (and b!1274433 res!847221) b!1274437))

(assert (= (and b!1274438 condMapEmpty!51222) mapIsEmpty!51222))

(assert (= (and b!1274438 (not condMapEmpty!51222)) mapNonEmpty!51222))

(get-info :version)

(assert (= (and mapNonEmpty!51222 ((_ is ValueCellFull!15683) mapValue!51222)) b!1274435))

(assert (= (and b!1274438 ((_ is ValueCellFull!15683) mapDefault!51222)) b!1274434))

(assert (= b!1274436 b!1274438))

(assert (= start!107732 b!1274436))

(declare-fun m!1172077 () Bool)

(assert (=> b!1274432 m!1172077))

(declare-fun m!1172079 () Bool)

(assert (=> b!1274437 m!1172079))

(declare-fun m!1172081 () Bool)

(assert (=> start!107732 m!1172081))

(declare-fun m!1172083 () Bool)

(assert (=> b!1274436 m!1172083))

(declare-fun m!1172085 () Bool)

(assert (=> b!1274436 m!1172085))

(declare-fun m!1172087 () Bool)

(assert (=> b!1274433 m!1172087))

(declare-fun m!1172089 () Bool)

(assert (=> mapNonEmpty!51222 m!1172089))

(check-sat (not mapNonEmpty!51222) (not b_next!27703) (not b!1274433) (not b!1274432) (not b!1274436) tp_is_empty!33073 (not start!107732) (not b!1274437) b_and!45761)
(check-sat b_and!45761 (not b_next!27703))
(get-model)

(declare-fun d!140405 () Bool)

(assert (=> d!140405 (= (validMask!0 (mask!34542 thiss!1559)) (and (or (= (mask!34542 thiss!1559) #b00000000000000000000000000000111) (= (mask!34542 thiss!1559) #b00000000000000000000000000001111) (= (mask!34542 thiss!1559) #b00000000000000000000000000011111) (= (mask!34542 thiss!1559) #b00000000000000000000000000111111) (= (mask!34542 thiss!1559) #b00000000000000000000000001111111) (= (mask!34542 thiss!1559) #b00000000000000000000000011111111) (= (mask!34542 thiss!1559) #b00000000000000000000000111111111) (= (mask!34542 thiss!1559) #b00000000000000000000001111111111) (= (mask!34542 thiss!1559) #b00000000000000000000011111111111) (= (mask!34542 thiss!1559) #b00000000000000000000111111111111) (= (mask!34542 thiss!1559) #b00000000000000000001111111111111) (= (mask!34542 thiss!1559) #b00000000000000000011111111111111) (= (mask!34542 thiss!1559) #b00000000000000000111111111111111) (= (mask!34542 thiss!1559) #b00000000000000001111111111111111) (= (mask!34542 thiss!1559) #b00000000000000011111111111111111) (= (mask!34542 thiss!1559) #b00000000000000111111111111111111) (= (mask!34542 thiss!1559) #b00000000000001111111111111111111) (= (mask!34542 thiss!1559) #b00000000000011111111111111111111) (= (mask!34542 thiss!1559) #b00000000000111111111111111111111) (= (mask!34542 thiss!1559) #b00000000001111111111111111111111) (= (mask!34542 thiss!1559) #b00000000011111111111111111111111) (= (mask!34542 thiss!1559) #b00000000111111111111111111111111) (= (mask!34542 thiss!1559) #b00000001111111111111111111111111) (= (mask!34542 thiss!1559) #b00000011111111111111111111111111) (= (mask!34542 thiss!1559) #b00000111111111111111111111111111) (= (mask!34542 thiss!1559) #b00001111111111111111111111111111) (= (mask!34542 thiss!1559) #b00011111111111111111111111111111) (= (mask!34542 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34542 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1274432 d!140405))

(declare-fun b!1274496 () Bool)

(declare-fun e!727195 () Bool)

(declare-fun e!727197 () Bool)

(assert (=> b!1274496 (= e!727195 e!727197)))

(declare-fun c!124150 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274496 (= c!124150 (validKeyInArray!0 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62650 () Bool)

(declare-fun call!62653 () Bool)

(assert (=> bm!62650 (= call!62653 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12161 thiss!1559) (mask!34542 thiss!1559)))))

(declare-fun b!1274497 () Bool)

(declare-fun e!727196 () Bool)

(assert (=> b!1274497 (= e!727197 e!727196)))

(declare-fun lt!575606 () (_ BitVec 64))

(assert (=> b!1274497 (= lt!575606 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42301 0))(
  ( (Unit!42302) )
))
(declare-fun lt!575604 () Unit!42301)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83431 (_ BitVec 64) (_ BitVec 32)) Unit!42301)

(assert (=> b!1274497 (= lt!575604 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12161 thiss!1559) lt!575606 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274497 (arrayContainsKey!0 (_keys!12161 thiss!1559) lt!575606 #b00000000000000000000000000000000)))

(declare-fun lt!575605 () Unit!42301)

(assert (=> b!1274497 (= lt!575605 lt!575604)))

(declare-fun res!847252 () Bool)

(declare-datatypes ((SeekEntryResult!9951 0))(
  ( (MissingZero!9951 (index!42175 (_ BitVec 32))) (Found!9951 (index!42176 (_ BitVec 32))) (Intermediate!9951 (undefined!10763 Bool) (index!42177 (_ BitVec 32)) (x!112530 (_ BitVec 32))) (Undefined!9951) (MissingVacant!9951 (index!42178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83431 (_ BitVec 32)) SeekEntryResult!9951)

(assert (=> b!1274497 (= res!847252 (= (seekEntryOrOpen!0 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000) (_keys!12161 thiss!1559) (mask!34542 thiss!1559)) (Found!9951 #b00000000000000000000000000000000)))))

(assert (=> b!1274497 (=> (not res!847252) (not e!727196))))

(declare-fun d!140407 () Bool)

(declare-fun res!847251 () Bool)

(assert (=> d!140407 (=> res!847251 e!727195)))

(assert (=> d!140407 (= res!847251 (bvsge #b00000000000000000000000000000000 (size!40781 (_keys!12161 thiss!1559))))))

(assert (=> d!140407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12161 thiss!1559) (mask!34542 thiss!1559)) e!727195)))

(declare-fun b!1274498 () Bool)

(assert (=> b!1274498 (= e!727196 call!62653)))

(declare-fun b!1274499 () Bool)

(assert (=> b!1274499 (= e!727197 call!62653)))

(assert (= (and d!140407 (not res!847251)) b!1274496))

(assert (= (and b!1274496 c!124150) b!1274497))

(assert (= (and b!1274496 (not c!124150)) b!1274499))

(assert (= (and b!1274497 res!847252) b!1274498))

(assert (= (or b!1274498 b!1274499) bm!62650))

(declare-fun m!1172119 () Bool)

(assert (=> b!1274496 m!1172119))

(assert (=> b!1274496 m!1172119))

(declare-fun m!1172121 () Bool)

(assert (=> b!1274496 m!1172121))

(declare-fun m!1172123 () Bool)

(assert (=> bm!62650 m!1172123))

(assert (=> b!1274497 m!1172119))

(declare-fun m!1172125 () Bool)

(assert (=> b!1274497 m!1172125))

(declare-fun m!1172127 () Bool)

(assert (=> b!1274497 m!1172127))

(assert (=> b!1274497 m!1172119))

(declare-fun m!1172129 () Bool)

(assert (=> b!1274497 m!1172129))

(assert (=> b!1274433 d!140407))

(declare-fun b!1274510 () Bool)

(declare-fun e!727207 () Bool)

(declare-fun e!727206 () Bool)

(assert (=> b!1274510 (= e!727207 e!727206)))

(declare-fun c!124153 () Bool)

(assert (=> b!1274510 (= c!124153 (validKeyInArray!0 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62653 () Bool)

(declare-fun call!62656 () Bool)

(assert (=> bm!62653 (= call!62656 (arrayNoDuplicates!0 (_keys!12161 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124153 (Cons!28587 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000) Nil!28588) Nil!28588)))))

(declare-fun b!1274511 () Bool)

(declare-fun e!727208 () Bool)

(assert (=> b!1274511 (= e!727208 e!727207)))

(declare-fun res!847259 () Bool)

(assert (=> b!1274511 (=> (not res!847259) (not e!727207))))

(declare-fun e!727209 () Bool)

(assert (=> b!1274511 (= res!847259 (not e!727209))))

(declare-fun res!847260 () Bool)

(assert (=> b!1274511 (=> (not res!847260) (not e!727209))))

(assert (=> b!1274511 (= res!847260 (validKeyInArray!0 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!140409 () Bool)

(declare-fun res!847261 () Bool)

(assert (=> d!140409 (=> res!847261 e!727208)))

(assert (=> d!140409 (= res!847261 (bvsge #b00000000000000000000000000000000 (size!40781 (_keys!12161 thiss!1559))))))

(assert (=> d!140409 (= (arrayNoDuplicates!0 (_keys!12161 thiss!1559) #b00000000000000000000000000000000 Nil!28588) e!727208)))

(declare-fun b!1274512 () Bool)

(assert (=> b!1274512 (= e!727206 call!62656)))

(declare-fun b!1274513 () Bool)

(declare-fun contains!7697 (List!28591 (_ BitVec 64)) Bool)

(assert (=> b!1274513 (= e!727209 (contains!7697 Nil!28588 (select (arr!40239 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274514 () Bool)

(assert (=> b!1274514 (= e!727206 call!62656)))

(assert (= (and d!140409 (not res!847261)) b!1274511))

(assert (= (and b!1274511 res!847260) b!1274513))

(assert (= (and b!1274511 res!847259) b!1274510))

(assert (= (and b!1274510 c!124153) b!1274512))

(assert (= (and b!1274510 (not c!124153)) b!1274514))

(assert (= (or b!1274512 b!1274514) bm!62653))

(assert (=> b!1274510 m!1172119))

(assert (=> b!1274510 m!1172119))

(assert (=> b!1274510 m!1172121))

(assert (=> bm!62653 m!1172119))

(declare-fun m!1172131 () Bool)

(assert (=> bm!62653 m!1172131))

(assert (=> b!1274511 m!1172119))

(assert (=> b!1274511 m!1172119))

(assert (=> b!1274511 m!1172121))

(assert (=> b!1274513 m!1172119))

(assert (=> b!1274513 m!1172119))

(declare-fun m!1172133 () Bool)

(assert (=> b!1274513 m!1172133))

(assert (=> b!1274437 d!140409))

(declare-fun d!140411 () Bool)

(declare-fun res!847268 () Bool)

(declare-fun e!727212 () Bool)

(assert (=> d!140411 (=> (not res!847268) (not e!727212))))

(declare-fun simpleValid!462 (LongMapFixedSize!6130) Bool)

(assert (=> d!140411 (= res!847268 (simpleValid!462 thiss!1559))))

(assert (=> d!140411 (= (valid!2301 thiss!1559) e!727212)))

(declare-fun b!1274521 () Bool)

(declare-fun res!847269 () Bool)

(assert (=> b!1274521 (=> (not res!847269) (not e!727212))))

(declare-fun arrayCountValidKeys!0 (array!83431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274521 (= res!847269 (= (arrayCountValidKeys!0 (_keys!12161 thiss!1559) #b00000000000000000000000000000000 (size!40781 (_keys!12161 thiss!1559))) (_size!3120 thiss!1559)))))

(declare-fun b!1274522 () Bool)

(declare-fun res!847270 () Bool)

(assert (=> b!1274522 (=> (not res!847270) (not e!727212))))

(assert (=> b!1274522 (= res!847270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12161 thiss!1559) (mask!34542 thiss!1559)))))

(declare-fun b!1274523 () Bool)

(assert (=> b!1274523 (= e!727212 (arrayNoDuplicates!0 (_keys!12161 thiss!1559) #b00000000000000000000000000000000 Nil!28588))))

(assert (= (and d!140411 res!847268) b!1274521))

(assert (= (and b!1274521 res!847269) b!1274522))

(assert (= (and b!1274522 res!847270) b!1274523))

(declare-fun m!1172135 () Bool)

(assert (=> d!140411 m!1172135))

(declare-fun m!1172137 () Bool)

(assert (=> b!1274521 m!1172137))

(assert (=> b!1274522 m!1172087))

(assert (=> b!1274523 m!1172079))

(assert (=> start!107732 d!140411))

(declare-fun d!140413 () Bool)

(assert (=> d!140413 (= (array_inv!30771 (_keys!12161 thiss!1559)) (bvsge (size!40781 (_keys!12161 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274436 d!140413))

(declare-fun d!140415 () Bool)

(assert (=> d!140415 (= (array_inv!30772 (_values!6734 thiss!1559)) (bvsge (size!40780 (_values!6734 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274436 d!140415))

(declare-fun mapNonEmpty!51231 () Bool)

(declare-fun mapRes!51231 () Bool)

(declare-fun tp!97662 () Bool)

(declare-fun e!727218 () Bool)

(assert (=> mapNonEmpty!51231 (= mapRes!51231 (and tp!97662 e!727218))))

(declare-fun mapValue!51231 () ValueCell!15683)

(declare-fun mapKey!51231 () (_ BitVec 32))

(declare-fun mapRest!51231 () (Array (_ BitVec 32) ValueCell!15683))

(assert (=> mapNonEmpty!51231 (= mapRest!51222 (store mapRest!51231 mapKey!51231 mapValue!51231))))

(declare-fun b!1274531 () Bool)

(declare-fun e!727217 () Bool)

(assert (=> b!1274531 (= e!727217 tp_is_empty!33073)))

(declare-fun mapIsEmpty!51231 () Bool)

(assert (=> mapIsEmpty!51231 mapRes!51231))

(declare-fun condMapEmpty!51231 () Bool)

(declare-fun mapDefault!51231 () ValueCell!15683)

(assert (=> mapNonEmpty!51222 (= condMapEmpty!51231 (= mapRest!51222 ((as const (Array (_ BitVec 32) ValueCell!15683)) mapDefault!51231)))))

(assert (=> mapNonEmpty!51222 (= tp!97646 (and e!727217 mapRes!51231))))

(declare-fun b!1274530 () Bool)

(assert (=> b!1274530 (= e!727218 tp_is_empty!33073)))

(assert (= (and mapNonEmpty!51222 condMapEmpty!51231) mapIsEmpty!51231))

(assert (= (and mapNonEmpty!51222 (not condMapEmpty!51231)) mapNonEmpty!51231))

(assert (= (and mapNonEmpty!51231 ((_ is ValueCellFull!15683) mapValue!51231)) b!1274530))

(assert (= (and mapNonEmpty!51222 ((_ is ValueCellFull!15683) mapDefault!51231)) b!1274531))

(declare-fun m!1172139 () Bool)

(assert (=> mapNonEmpty!51231 m!1172139))

(check-sat (not b_next!27703) (not b!1274510) tp_is_empty!33073 (not b!1274513) (not bm!62653) b_and!45761 (not mapNonEmpty!51231) (not b!1274521) (not d!140411) (not b!1274511) (not b!1274496) (not b!1274523) (not bm!62650) (not b!1274497) (not b!1274522))
(check-sat b_and!45761 (not b_next!27703))
