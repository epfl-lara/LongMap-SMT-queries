; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75390 () Bool)

(assert start!75390)

(declare-fun b!887593 () Bool)

(declare-fun b_free!15535 () Bool)

(declare-fun b_next!15535 () Bool)

(assert (=> b!887593 (= b_free!15535 (not b_next!15535))))

(declare-fun tp!54549 () Bool)

(declare-fun b_and!25745 () Bool)

(assert (=> b!887593 (= tp!54549 b_and!25745)))

(declare-datatypes ((V!28783 0))(
  ( (V!28784 (val!8982 Int)) )
))
(declare-datatypes ((array!51675 0))(
  ( (array!51676 (arr!24851 (Array (_ BitVec 32) (_ BitVec 64))) (size!25293 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8450 0))(
  ( (ValueCellFull!8450 (v!11442 V!28783)) (EmptyCell!8450) )
))
(declare-datatypes ((array!51677 0))(
  ( (array!51678 (arr!24852 (Array (_ BitVec 32) ValueCell!8450)) (size!25294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3916 0))(
  ( (LongMapFixedSize!3917 (defaultEntry!5149 Int) (mask!25548 (_ BitVec 32)) (extraKeys!4843 (_ BitVec 32)) (zeroValue!4947 V!28783) (minValue!4947 V!28783) (_size!2013 (_ BitVec 32)) (_keys!9821 array!51675) (_values!5134 array!51677) (_vacant!2013 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1068 0))(
  ( (Cell!1069 (v!11443 LongMapFixedSize!3916)) )
))
(declare-datatypes ((LongMap!1068 0))(
  ( (LongMap!1069 (underlying!545 Cell!1068)) )
))
(declare-fun thiss!821 () LongMap!1068)

(declare-fun e!494400 () Bool)

(declare-fun tp_is_empty!17863 () Bool)

(declare-fun e!494407 () Bool)

(declare-fun array_inv!19606 (array!51675) Bool)

(declare-fun array_inv!19607 (array!51677) Bool)

(assert (=> b!887593 (= e!494407 (and tp!54549 tp_is_empty!17863 (array_inv!19606 (_keys!9821 (v!11443 (underlying!545 thiss!821)))) (array_inv!19607 (_values!5134 (v!11443 (underlying!545 thiss!821)))) e!494400))))

(declare-fun b!887594 () Bool)

(declare-fun e!494403 () Bool)

(assert (=> b!887594 (= e!494403 e!494407)))

(declare-fun b!887595 () Bool)

(declare-fun e!494402 () Bool)

(assert (=> b!887595 (= e!494402 e!494403)))

(declare-fun b!887596 () Bool)

(declare-fun e!494404 () Bool)

(declare-fun mapRes!28324 () Bool)

(assert (=> b!887596 (= e!494400 (and e!494404 mapRes!28324))))

(declare-fun condMapEmpty!28324 () Bool)

(declare-fun mapDefault!28324 () ValueCell!8450)

(assert (=> b!887596 (= condMapEmpty!28324 (= (arr!24852 (_values!5134 (v!11443 (underlying!545 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8450)) mapDefault!28324)))))

(declare-fun mapNonEmpty!28324 () Bool)

(declare-fun tp!54550 () Bool)

(declare-fun e!494405 () Bool)

(assert (=> mapNonEmpty!28324 (= mapRes!28324 (and tp!54550 e!494405))))

(declare-fun mapKey!28324 () (_ BitVec 32))

(declare-fun mapValue!28324 () ValueCell!8450)

(declare-fun mapRest!28324 () (Array (_ BitVec 32) ValueCell!8450))

(assert (=> mapNonEmpty!28324 (= (arr!24852 (_values!5134 (v!11443 (underlying!545 thiss!821)))) (store mapRest!28324 mapKey!28324 mapValue!28324))))

(declare-fun res!602103 () Bool)

(declare-fun e!494401 () Bool)

(assert (=> start!75390 (=> (not res!602103) (not e!494401))))

(declare-fun valid!1535 (LongMap!1068) Bool)

(assert (=> start!75390 (= res!602103 (valid!1535 thiss!821))))

(assert (=> start!75390 e!494401))

(assert (=> start!75390 e!494402))

(assert (=> start!75390 true))

(declare-fun b!887597 () Bool)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4287 (LongMapFixedSize!3916 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!11944 0))(
  ( (tuple2!11945 (_1!5983 (_ BitVec 64)) (_2!5983 V!28783)) )
))
(declare-datatypes ((List!17692 0))(
  ( (Nil!17689) (Cons!17688 (h!18819 tuple2!11944) (t!24978 List!17692)) )
))
(declare-datatypes ((ListLongMap!10631 0))(
  ( (ListLongMap!10632 (toList!5331 List!17692)) )
))
(declare-fun contains!4288 (ListLongMap!10631 (_ BitVec 64)) Bool)

(declare-fun map!12076 (LongMap!1068) ListLongMap!10631)

(assert (=> b!887597 (= e!494401 (not (= (contains!4287 (v!11443 (underlying!545 thiss!821)) key!666) (contains!4288 (map!12076 thiss!821) key!666))))))

(declare-fun mapIsEmpty!28324 () Bool)

(assert (=> mapIsEmpty!28324 mapRes!28324))

(declare-fun b!887598 () Bool)

(assert (=> b!887598 (= e!494404 tp_is_empty!17863)))

(declare-fun b!887599 () Bool)

(assert (=> b!887599 (= e!494405 tp_is_empty!17863)))

(assert (= (and start!75390 res!602103) b!887597))

(assert (= (and b!887596 condMapEmpty!28324) mapIsEmpty!28324))

(assert (= (and b!887596 (not condMapEmpty!28324)) mapNonEmpty!28324))

(get-info :version)

(assert (= (and mapNonEmpty!28324 ((_ is ValueCellFull!8450) mapValue!28324)) b!887599))

(assert (= (and b!887596 ((_ is ValueCellFull!8450) mapDefault!28324)) b!887598))

(assert (= b!887593 b!887596))

(assert (= b!887594 b!887593))

(assert (= b!887595 b!887594))

(assert (= start!75390 b!887595))

(declare-fun m!826561 () Bool)

(assert (=> b!887593 m!826561))

(declare-fun m!826563 () Bool)

(assert (=> b!887593 m!826563))

(declare-fun m!826565 () Bool)

(assert (=> mapNonEmpty!28324 m!826565))

(declare-fun m!826567 () Bool)

(assert (=> start!75390 m!826567))

(declare-fun m!826569 () Bool)

(assert (=> b!887597 m!826569))

(declare-fun m!826571 () Bool)

(assert (=> b!887597 m!826571))

(assert (=> b!887597 m!826571))

(declare-fun m!826573 () Bool)

(assert (=> b!887597 m!826573))

(check-sat (not b_next!15535) (not b!887597) tp_is_empty!17863 (not mapNonEmpty!28324) b_and!25745 (not b!887593) (not start!75390))
(check-sat b_and!25745 (not b_next!15535))
(get-model)

(declare-fun d!109775 () Bool)

(assert (=> d!109775 (= (array_inv!19606 (_keys!9821 (v!11443 (underlying!545 thiss!821)))) (bvsge (size!25293 (_keys!9821 (v!11443 (underlying!545 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887593 d!109775))

(declare-fun d!109777 () Bool)

(assert (=> d!109777 (= (array_inv!19607 (_values!5134 (v!11443 (underlying!545 thiss!821)))) (bvsge (size!25294 (_values!5134 (v!11443 (underlying!545 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887593 d!109777))

(declare-fun d!109779 () Bool)

(declare-fun valid!1537 (LongMapFixedSize!3916) Bool)

(assert (=> d!109779 (= (valid!1535 thiss!821) (valid!1537 (v!11443 (underlying!545 thiss!821))))))

(declare-fun bs!24861 () Bool)

(assert (= bs!24861 d!109779))

(declare-fun m!826603 () Bool)

(assert (=> bs!24861 m!826603))

(assert (=> start!75390 d!109779))

(declare-fun b!887662 () Bool)

(declare-fun c!93685 () Bool)

(declare-datatypes ((SeekEntryResult!8761 0))(
  ( (MissingZero!8761 (index!37415 (_ BitVec 32))) (Found!8761 (index!37416 (_ BitVec 32))) (Intermediate!8761 (undefined!9573 Bool) (index!37417 (_ BitVec 32)) (x!75304 (_ BitVec 32))) (Undefined!8761) (MissingVacant!8761 (index!37418 (_ BitVec 32))) )
))
(declare-fun lt!401259 () SeekEntryResult!8761)

(assert (=> b!887662 (= c!93685 ((_ is Found!8761) lt!401259))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51675 (_ BitVec 32)) SeekEntryResult!8761)

(assert (=> b!887662 (= lt!401259 (seekEntry!0 key!666 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821)))))))

(declare-fun e!494466 () Bool)

(declare-fun e!494470 () Bool)

(assert (=> b!887662 (= e!494466 e!494470)))

(declare-fun b!887663 () Bool)

(assert (=> b!887663 (= e!494466 (not (= (bvand (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39372 () Bool)

(declare-fun call!39377 () Bool)

(declare-fun arrayContainsKey!0 (array!51675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39372 (= call!39377 (arrayContainsKey!0 (_keys!9821 (v!11443 (underlying!545 thiss!821))) key!666 #b00000000000000000000000000000000))))

(declare-fun bm!39373 () Bool)

(declare-fun call!39376 () ListLongMap!10631)

(declare-fun getCurrentListMap!2565 (array!51675 array!51677 (_ BitVec 32) (_ BitVec 32) V!28783 V!28783 (_ BitVec 32) Int) ListLongMap!10631)

(assert (=> bm!39373 (= call!39376 (getCurrentListMap!2565 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (_values!5134 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821))) (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) (zeroValue!4947 (v!11443 (underlying!545 thiss!821))) (minValue!4947 (v!11443 (underlying!545 thiss!821))) #b00000000000000000000000000000000 (defaultEntry!5149 (v!11443 (underlying!545 thiss!821)))))))

(declare-fun b!887664 () Bool)

(declare-fun e!494469 () Bool)

(assert (=> b!887664 (= e!494469 (ite (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!887665 () Bool)

(declare-datatypes ((Unit!30197 0))(
  ( (Unit!30198) )
))
(declare-fun e!494468 () Unit!30197)

(declare-fun Unit!30199 () Unit!30197)

(assert (=> b!887665 (= e!494468 Unit!30199)))

(declare-fun b!887666 () Bool)

(assert (=> b!887666 false))

(declare-fun lt!401266 () Unit!30197)

(declare-fun lt!401267 () Unit!30197)

(assert (=> b!887666 (= lt!401266 lt!401267)))

(declare-fun lt!401270 () SeekEntryResult!8761)

(declare-fun lt!401262 () (_ BitVec 32))

(assert (=> b!887666 (and ((_ is Found!8761) lt!401270) (= (index!37416 lt!401270) lt!401262))))

(assert (=> b!887666 (= lt!401270 (seekEntry!0 key!666 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821)))))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51675 (_ BitVec 32)) Unit!30197)

(assert (=> b!887666 (= lt!401267 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!666 lt!401262 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821)))))))

(declare-fun lt!401268 () Unit!30197)

(declare-fun lt!401263 () Unit!30197)

(assert (=> b!887666 (= lt!401268 lt!401263)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51675 (_ BitVec 32)) Bool)

(assert (=> b!887666 (arrayForallSeekEntryOrOpenFound!0 lt!401262 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30197)

(assert (=> b!887666 (= lt!401263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821))) #b00000000000000000000000000000000 lt!401262))))

(declare-fun arrayScanForKey!0 (array!51675 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887666 (= lt!401262 (arrayScanForKey!0 (_keys!9821 (v!11443 (underlying!545 thiss!821))) key!666 #b00000000000000000000000000000000))))

(declare-fun lt!401265 () Unit!30197)

(declare-fun lt!401271 () Unit!30197)

(assert (=> b!887666 (= lt!401265 lt!401271)))

(assert (=> b!887666 e!494469))

(declare-fun c!93686 () Bool)

(assert (=> b!887666 (= c!93686 (and (not (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!666 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!163 (array!51675 array!51677 (_ BitVec 32) (_ BitVec 32) V!28783 V!28783 (_ BitVec 64) Int) Unit!30197)

(assert (=> b!887666 (= lt!401271 (lemmaKeyInListMapIsInArray!163 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (_values!5134 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821))) (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) (zeroValue!4947 (v!11443 (underlying!545 thiss!821))) (minValue!4947 (v!11443 (underlying!545 thiss!821))) key!666 (defaultEntry!5149 (v!11443 (underlying!545 thiss!821)))))))

(declare-fun Unit!30200 () Unit!30197)

(assert (=> b!887666 (= e!494468 Unit!30200)))

(declare-fun d!109781 () Bool)

(declare-fun lt!401269 () Bool)

(declare-fun map!12078 (LongMapFixedSize!3916) ListLongMap!10631)

(assert (=> d!109781 (= lt!401269 (contains!4288 (map!12078 (v!11443 (underlying!545 thiss!821))) key!666))))

(declare-fun e!494467 () Bool)

(assert (=> d!109781 (= lt!401269 e!494467)))

(declare-fun c!93682 () Bool)

(assert (=> d!109781 (= c!93682 (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109781 (valid!1537 (v!11443 (underlying!545 thiss!821)))))

(assert (=> d!109781 (= (contains!4287 (v!11443 (underlying!545 thiss!821)) key!666) lt!401269)))

(declare-fun b!887667 () Bool)

(assert (=> b!887667 (= e!494470 false)))

(declare-fun c!93684 () Bool)

(declare-fun call!39375 () Bool)

(assert (=> b!887667 (= c!93684 call!39375)))

(declare-fun lt!401260 () Unit!30197)

(assert (=> b!887667 (= lt!401260 e!494468)))

(declare-fun b!887668 () Bool)

(assert (=> b!887668 (= e!494467 (not (= (bvand (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!887669 () Bool)

(assert (=> b!887669 (= e!494470 true)))

(declare-fun lt!401264 () Unit!30197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51675 (_ BitVec 64) (_ BitVec 32)) Unit!30197)

(assert (=> b!887669 (= lt!401264 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9821 (v!11443 (underlying!545 thiss!821))) key!666 (index!37416 lt!401259)))))

(assert (=> b!887669 call!39377))

(declare-fun lt!401258 () Unit!30197)

(assert (=> b!887669 (= lt!401258 lt!401264)))

(declare-fun lt!401261 () Unit!30197)

(declare-fun lemmaValidKeyInArrayIsInListMap!201 (array!51675 array!51677 (_ BitVec 32) (_ BitVec 32) V!28783 V!28783 (_ BitVec 32) Int) Unit!30197)

(assert (=> b!887669 (= lt!401261 (lemmaValidKeyInArrayIsInListMap!201 (_keys!9821 (v!11443 (underlying!545 thiss!821))) (_values!5134 (v!11443 (underlying!545 thiss!821))) (mask!25548 (v!11443 (underlying!545 thiss!821))) (extraKeys!4843 (v!11443 (underlying!545 thiss!821))) (zeroValue!4947 (v!11443 (underlying!545 thiss!821))) (minValue!4947 (v!11443 (underlying!545 thiss!821))) (index!37416 lt!401259) (defaultEntry!5149 (v!11443 (underlying!545 thiss!821)))))))

(assert (=> b!887669 call!39375))

(declare-fun lt!401257 () Unit!30197)

(assert (=> b!887669 (= lt!401257 lt!401261)))

(declare-fun b!887670 () Bool)

(assert (=> b!887670 (= e!494467 e!494466)))

(declare-fun c!93683 () Bool)

(assert (=> b!887670 (= c!93683 (= key!666 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39374 () Bool)

(assert (=> bm!39374 (= call!39375 (contains!4288 call!39376 (ite c!93685 (select (arr!24851 (_keys!9821 (v!11443 (underlying!545 thiss!821)))) (index!37416 lt!401259)) key!666)))))

(declare-fun b!887671 () Bool)

(assert (=> b!887671 (= e!494469 call!39377)))

(assert (= (and d!109781 c!93682) b!887668))

(assert (= (and d!109781 (not c!93682)) b!887670))

(assert (= (and b!887670 c!93683) b!887663))

(assert (= (and b!887670 (not c!93683)) b!887662))

(assert (= (and b!887662 c!93685) b!887669))

(assert (= (and b!887662 (not c!93685)) b!887667))

(assert (= (and b!887667 c!93684) b!887666))

(assert (= (and b!887667 (not c!93684)) b!887665))

(assert (= (and b!887666 c!93686) b!887671))

(assert (= (and b!887666 (not c!93686)) b!887664))

(assert (= (or b!887669 b!887667) bm!39373))

(assert (= (or b!887669 b!887671) bm!39372))

(assert (= (or b!887669 b!887667) bm!39374))

(declare-fun m!826605 () Bool)

(assert (=> b!887666 m!826605))

(declare-fun m!826607 () Bool)

(assert (=> b!887666 m!826607))

(declare-fun m!826609 () Bool)

(assert (=> b!887666 m!826609))

(declare-fun m!826611 () Bool)

(assert (=> b!887666 m!826611))

(declare-fun m!826613 () Bool)

(assert (=> b!887666 m!826613))

(declare-fun m!826615 () Bool)

(assert (=> b!887666 m!826615))

(assert (=> b!887662 m!826605))

(declare-fun m!826617 () Bool)

(assert (=> b!887669 m!826617))

(declare-fun m!826619 () Bool)

(assert (=> b!887669 m!826619))

(declare-fun m!826621 () Bool)

(assert (=> bm!39372 m!826621))

(declare-fun m!826623 () Bool)

(assert (=> bm!39374 m!826623))

(declare-fun m!826625 () Bool)

(assert (=> bm!39374 m!826625))

(declare-fun m!826627 () Bool)

(assert (=> bm!39373 m!826627))

(declare-fun m!826629 () Bool)

(assert (=> d!109781 m!826629))

(assert (=> d!109781 m!826629))

(declare-fun m!826631 () Bool)

(assert (=> d!109781 m!826631))

(assert (=> d!109781 m!826603))

(assert (=> b!887597 d!109781))

(declare-fun d!109783 () Bool)

(declare-fun e!494476 () Bool)

(assert (=> d!109783 e!494476))

(declare-fun res!602112 () Bool)

(assert (=> d!109783 (=> res!602112 e!494476)))

(declare-fun lt!401283 () Bool)

(assert (=> d!109783 (= res!602112 (not lt!401283))))

(declare-fun lt!401282 () Bool)

(assert (=> d!109783 (= lt!401283 lt!401282)))

(declare-fun lt!401281 () Unit!30197)

(declare-fun e!494475 () Unit!30197)

(assert (=> d!109783 (= lt!401281 e!494475)))

(declare-fun c!93689 () Bool)

(assert (=> d!109783 (= c!93689 lt!401282)))

(declare-fun containsKey!418 (List!17692 (_ BitVec 64)) Bool)

(assert (=> d!109783 (= lt!401282 (containsKey!418 (toList!5331 (map!12076 thiss!821)) key!666))))

(assert (=> d!109783 (= (contains!4288 (map!12076 thiss!821) key!666) lt!401283)))

(declare-fun b!887678 () Bool)

(declare-fun lt!401280 () Unit!30197)

(assert (=> b!887678 (= e!494475 lt!401280)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!313 (List!17692 (_ BitVec 64)) Unit!30197)

(assert (=> b!887678 (= lt!401280 (lemmaContainsKeyImpliesGetValueByKeyDefined!313 (toList!5331 (map!12076 thiss!821)) key!666))))

(declare-datatypes ((Option!440 0))(
  ( (Some!439 (v!11448 V!28783)) (None!438) )
))
(declare-fun isDefined!315 (Option!440) Bool)

(declare-fun getValueByKey!434 (List!17692 (_ BitVec 64)) Option!440)

(assert (=> b!887678 (isDefined!315 (getValueByKey!434 (toList!5331 (map!12076 thiss!821)) key!666))))

(declare-fun b!887679 () Bool)

(declare-fun Unit!30201 () Unit!30197)

(assert (=> b!887679 (= e!494475 Unit!30201)))

(declare-fun b!887680 () Bool)

(assert (=> b!887680 (= e!494476 (isDefined!315 (getValueByKey!434 (toList!5331 (map!12076 thiss!821)) key!666)))))

(assert (= (and d!109783 c!93689) b!887678))

(assert (= (and d!109783 (not c!93689)) b!887679))

(assert (= (and d!109783 (not res!602112)) b!887680))

(declare-fun m!826633 () Bool)

(assert (=> d!109783 m!826633))

(declare-fun m!826635 () Bool)

(assert (=> b!887678 m!826635))

(declare-fun m!826637 () Bool)

(assert (=> b!887678 m!826637))

(assert (=> b!887678 m!826637))

(declare-fun m!826639 () Bool)

(assert (=> b!887678 m!826639))

(assert (=> b!887680 m!826637))

(assert (=> b!887680 m!826637))

(assert (=> b!887680 m!826639))

(assert (=> b!887597 d!109783))

(declare-fun d!109785 () Bool)

(assert (=> d!109785 (= (map!12076 thiss!821) (map!12078 (v!11443 (underlying!545 thiss!821))))))

(declare-fun bs!24862 () Bool)

(assert (= bs!24862 d!109785))

(assert (=> bs!24862 m!826629))

(assert (=> b!887597 d!109785))

(declare-fun condMapEmpty!28333 () Bool)

(declare-fun mapDefault!28333 () ValueCell!8450)

(assert (=> mapNonEmpty!28324 (= condMapEmpty!28333 (= mapRest!28324 ((as const (Array (_ BitVec 32) ValueCell!8450)) mapDefault!28333)))))

(declare-fun e!494482 () Bool)

(declare-fun mapRes!28333 () Bool)

(assert (=> mapNonEmpty!28324 (= tp!54550 (and e!494482 mapRes!28333))))

(declare-fun b!887688 () Bool)

(assert (=> b!887688 (= e!494482 tp_is_empty!17863)))

(declare-fun mapNonEmpty!28333 () Bool)

(declare-fun tp!54565 () Bool)

(declare-fun e!494481 () Bool)

(assert (=> mapNonEmpty!28333 (= mapRes!28333 (and tp!54565 e!494481))))

(declare-fun mapValue!28333 () ValueCell!8450)

(declare-fun mapRest!28333 () (Array (_ BitVec 32) ValueCell!8450))

(declare-fun mapKey!28333 () (_ BitVec 32))

(assert (=> mapNonEmpty!28333 (= mapRest!28324 (store mapRest!28333 mapKey!28333 mapValue!28333))))

(declare-fun mapIsEmpty!28333 () Bool)

(assert (=> mapIsEmpty!28333 mapRes!28333))

(declare-fun b!887687 () Bool)

(assert (=> b!887687 (= e!494481 tp_is_empty!17863)))

(assert (= (and mapNonEmpty!28324 condMapEmpty!28333) mapIsEmpty!28333))

(assert (= (and mapNonEmpty!28324 (not condMapEmpty!28333)) mapNonEmpty!28333))

(assert (= (and mapNonEmpty!28333 ((_ is ValueCellFull!8450) mapValue!28333)) b!887687))

(assert (= (and mapNonEmpty!28324 ((_ is ValueCellFull!8450) mapDefault!28333)) b!887688))

(declare-fun m!826641 () Bool)

(assert (=> mapNonEmpty!28333 m!826641))

(check-sat (not b!887678) (not b_next!15535) (not b!887662) (not d!109785) (not d!109783) (not d!109781) (not mapNonEmpty!28333) b_and!25745 (not bm!39374) (not bm!39372) (not b!887680) (not d!109779) (not b!887666) tp_is_empty!17863 (not bm!39373) (not b!887669))
(check-sat b_and!25745 (not b_next!15535))
