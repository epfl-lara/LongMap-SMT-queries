; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19930 () Bool)

(assert start!19930)

(declare-fun b!195593 () Bool)

(declare-fun b_free!4733 () Bool)

(declare-fun b_next!4733 () Bool)

(assert (=> b!195593 (= b_free!4733 (not b_next!4733))))

(declare-fun tp!17081 () Bool)

(declare-fun b_and!11479 () Bool)

(assert (=> b!195593 (= tp!17081 b_and!11479)))

(declare-fun b!195591 () Bool)

(declare-fun b_free!4735 () Bool)

(declare-fun b_next!4735 () Bool)

(assert (=> b!195591 (= b_free!4735 (not b_next!4735))))

(declare-fun tp!17083 () Bool)

(declare-fun b_and!11481 () Bool)

(assert (=> b!195591 (= tp!17083 b_and!11481)))

(declare-fun b!195584 () Bool)

(declare-datatypes ((V!5651 0))(
  ( (V!5652 (val!2296 Int)) )
))
(declare-datatypes ((tuple2!3564 0))(
  ( (tuple2!3565 (_1!1793 (_ BitVec 64)) (_2!1793 V!5651)) )
))
(declare-datatypes ((List!2453 0))(
  ( (Nil!2450) (Cons!2449 (h!3091 tuple2!3564) (t!7384 List!2453)) )
))
(declare-datatypes ((ListLongMap!2481 0))(
  ( (ListLongMap!2482 (toList!1256 List!2453)) )
))
(declare-fun lt!97482 () ListLongMap!2481)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun call!19758 () ListLongMap!2481)

(declare-fun v!309 () V!5651)

(declare-fun e!128677 () Bool)

(declare-fun +!323 (ListLongMap!2481 tuple2!3564) ListLongMap!2481)

(assert (=> b!195584 (= e!128677 (not (= lt!97482 (+!323 call!19758 (tuple2!3565 key!828 v!309)))))))

(declare-fun b!195585 () Bool)

(declare-fun e!128675 () Bool)

(declare-fun tp_is_empty!4503 () Bool)

(assert (=> b!195585 (= e!128675 tp_is_empty!4503)))

(declare-fun b!195586 () Bool)

(declare-fun res!92318 () Bool)

(declare-fun e!128667 () Bool)

(assert (=> b!195586 (=> (not res!92318) (not e!128667))))

(assert (=> b!195586 (= res!92318 (not (= key!828 (bvneg key!828))))))

(declare-fun b!195587 () Bool)

(declare-fun e!128665 () Bool)

(declare-fun e!128666 () Bool)

(declare-fun mapRes!7801 () Bool)

(assert (=> b!195587 (= e!128665 (and e!128666 mapRes!7801))))

(declare-fun condMapEmpty!7800 () Bool)

(declare-datatypes ((ValueCell!1908 0))(
  ( (ValueCellFull!1908 (v!4264 V!5651)) (EmptyCell!1908) )
))
(declare-datatypes ((array!8261 0))(
  ( (array!8262 (arr!3887 (Array (_ BitVec 32) (_ BitVec 64))) (size!4212 (_ BitVec 32))) )
))
(declare-datatypes ((array!8263 0))(
  ( (array!8264 (arr!3888 (Array (_ BitVec 32) ValueCell!1908)) (size!4213 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2724 0))(
  ( (LongMapFixedSize!2725 (defaultEntry!3976 Int) (mask!9252 (_ BitVec 32)) (extraKeys!3713 (_ BitVec 32)) (zeroValue!3817 V!5651) (minValue!3817 V!5651) (_size!1411 (_ BitVec 32)) (_keys!5975 array!8261) (_values!3959 array!8263) (_vacant!1411 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3566 0))(
  ( (tuple2!3567 (_1!1794 Bool) (_2!1794 LongMapFixedSize!2724)) )
))
(declare-fun err!103 () tuple2!3566)

(declare-fun mapDefault!7801 () ValueCell!1908)

(assert (=> b!195587 (= condMapEmpty!7800 (= (arr!3888 (_values!3959 (_2!1794 err!103))) ((as const (Array (_ BitVec 32) ValueCell!1908)) mapDefault!7801)))))

(declare-fun b!195588 () Bool)

(declare-fun e!128671 () Bool)

(declare-fun e!128678 () Bool)

(assert (=> b!195588 (= e!128671 e!128678)))

(declare-fun c!35408 () Bool)

(declare-fun lt!97484 () tuple2!3566)

(assert (=> b!195588 (= c!35408 (_1!1794 lt!97484))))

(declare-fun b!195589 () Bool)

(declare-fun e!128672 () Bool)

(declare-fun e!128670 () Bool)

(declare-fun mapRes!7800 () Bool)

(assert (=> b!195589 (= e!128672 (and e!128670 mapRes!7800))))

(declare-fun condMapEmpty!7801 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!2724)

(declare-fun mapDefault!7800 () ValueCell!1908)

(assert (=> b!195589 (= condMapEmpty!7801 (= (arr!3888 (_values!3959 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1908)) mapDefault!7800)))))

(declare-fun mapIsEmpty!7800 () Bool)

(assert (=> mapIsEmpty!7800 mapRes!7800))

(declare-fun bm!19754 () Bool)

(declare-fun map!2035 (LongMapFixedSize!2724) ListLongMap!2481)

(assert (=> bm!19754 (= call!19758 (map!2035 thiss!1248))))

(declare-fun mapNonEmpty!7800 () Bool)

(declare-fun tp!17080 () Bool)

(assert (=> mapNonEmpty!7800 (= mapRes!7800 (and tp!17080 e!128675))))

(declare-fun mapRest!7800 () (Array (_ BitVec 32) ValueCell!1908))

(declare-fun mapValue!7801 () ValueCell!1908)

(declare-fun mapKey!7800 () (_ BitVec 32))

(assert (=> mapNonEmpty!7800 (= (arr!3888 (_values!3959 thiss!1248)) (store mapRest!7800 mapKey!7800 mapValue!7801))))

(declare-fun b!195590 () Bool)

(declare-fun call!19757 () ListLongMap!2481)

(assert (=> b!195590 (= e!128678 (not (= call!19757 call!19758)))))

(declare-fun e!128673 () Bool)

(declare-fun array_inv!2523 (array!8261) Bool)

(declare-fun array_inv!2524 (array!8263) Bool)

(assert (=> b!195591 (= e!128673 (and tp!17083 tp_is_empty!4503 (array_inv!2523 (_keys!5975 thiss!1248)) (array_inv!2524 (_values!3959 thiss!1248)) e!128672))))

(declare-fun b!195592 () Bool)

(declare-fun e!128674 () Bool)

(assert (=> b!195592 (= e!128674 e!128671)))

(declare-fun res!92317 () Bool)

(assert (=> b!195592 (=> res!92317 e!128671)))

(declare-fun valid!1116 (LongMapFixedSize!2724) Bool)

(assert (=> b!195592 (= res!92317 (not (valid!1116 (_2!1794 lt!97484))))))

(assert (=> b!195592 (= lt!97484 err!103)))

(assert (=> b!195592 true))

(declare-fun e!128669 () Bool)

(assert (=> b!195592 e!128669))

(assert (=> b!195593 (= e!128669 (and tp!17081 tp_is_empty!4503 (array_inv!2523 (_keys!5975 (_2!1794 err!103))) (array_inv!2524 (_values!3959 (_2!1794 err!103))) e!128665))))

(declare-fun b!195594 () Bool)

(assert (=> b!195594 (= e!128670 tp_is_empty!4503)))

(declare-fun mapNonEmpty!7801 () Bool)

(declare-fun tp!17082 () Bool)

(declare-fun e!128668 () Bool)

(assert (=> mapNonEmpty!7801 (= mapRes!7801 (and tp!17082 e!128668))))

(declare-fun mapRest!7801 () (Array (_ BitVec 32) ValueCell!1908))

(declare-fun mapKey!7801 () (_ BitVec 32))

(declare-fun mapValue!7800 () ValueCell!1908)

(assert (=> mapNonEmpty!7801 (= (arr!3888 (_values!3959 (_2!1794 err!103))) (store mapRest!7801 mapKey!7801 mapValue!7800))))

(declare-fun b!195595 () Bool)

(assert (=> b!195595 (= e!128678 e!128677)))

(assert (=> b!195595 (= lt!97482 call!19757)))

(declare-fun res!92316 () Bool)

(declare-fun contains!1383 (ListLongMap!2481 (_ BitVec 64)) Bool)

(assert (=> b!195595 (= res!92316 (not (contains!1383 lt!97482 key!828)))))

(assert (=> b!195595 (=> res!92316 e!128677)))

(declare-fun res!92315 () Bool)

(assert (=> start!19930 (=> (not res!92315) (not e!128667))))

(assert (=> start!19930 (= res!92315 (valid!1116 thiss!1248))))

(assert (=> start!19930 e!128667))

(assert (=> start!19930 e!128673))

(assert (=> start!19930 true))

(assert (=> start!19930 tp_is_empty!4503))

(declare-fun bm!19755 () Bool)

(assert (=> bm!19755 (= call!19757 (map!2035 (_2!1794 lt!97484)))))

(declare-fun b!195596 () Bool)

(assert (=> b!195596 (= e!128668 tp_is_empty!4503)))

(declare-fun mapIsEmpty!7801 () Bool)

(assert (=> mapIsEmpty!7801 mapRes!7801))

(declare-fun b!195597 () Bool)

(assert (=> b!195597 (= e!128666 tp_is_empty!4503)))

(declare-fun b!195598 () Bool)

(assert (=> b!195598 (= e!128667 e!128674)))

(declare-fun res!92314 () Bool)

(assert (=> b!195598 (=> (not res!92314) (not e!128674))))

(declare-datatypes ((SeekEntryResult!699 0))(
  ( (MissingZero!699 (index!4966 (_ BitVec 32))) (Found!699 (index!4967 (_ BitVec 32))) (Intermediate!699 (undefined!1511 Bool) (index!4968 (_ BitVec 32)) (x!20754 (_ BitVec 32))) (Undefined!699) (MissingVacant!699 (index!4969 (_ BitVec 32))) )
))
(declare-fun lt!97483 () SeekEntryResult!699)

(get-info :version)

(assert (=> b!195598 (= res!92314 (and (not ((_ is Undefined!699) lt!97483)) (not ((_ is MissingVacant!699) lt!97483)) (not ((_ is MissingZero!699) lt!97483)) (not ((_ is Found!699) lt!97483))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8261 (_ BitVec 32)) SeekEntryResult!699)

(assert (=> b!195598 (= lt!97483 (seekEntryOrOpen!0 key!828 (_keys!5975 thiss!1248) (mask!9252 thiss!1248)))))

(assert (= (and start!19930 res!92315) b!195586))

(assert (= (and b!195586 res!92318) b!195598))

(assert (= (and b!195598 res!92314) b!195592))

(assert (= (and b!195587 condMapEmpty!7800) mapIsEmpty!7801))

(assert (= (and b!195587 (not condMapEmpty!7800)) mapNonEmpty!7801))

(assert (= (and mapNonEmpty!7801 ((_ is ValueCellFull!1908) mapValue!7800)) b!195596))

(assert (= (and b!195587 ((_ is ValueCellFull!1908) mapDefault!7801)) b!195597))

(assert (= b!195593 b!195587))

(assert (= b!195592 b!195593))

(assert (= (and b!195592 (not res!92317)) b!195588))

(assert (= (and b!195588 c!35408) b!195595))

(assert (= (and b!195588 (not c!35408)) b!195590))

(assert (= (and b!195595 (not res!92316)) b!195584))

(assert (= (or b!195584 b!195590) bm!19754))

(assert (= (or b!195595 b!195590) bm!19755))

(assert (= (and b!195589 condMapEmpty!7801) mapIsEmpty!7800))

(assert (= (and b!195589 (not condMapEmpty!7801)) mapNonEmpty!7800))

(assert (= (and mapNonEmpty!7800 ((_ is ValueCellFull!1908) mapValue!7801)) b!195585))

(assert (= (and b!195589 ((_ is ValueCellFull!1908) mapDefault!7800)) b!195594))

(assert (= b!195591 b!195589))

(assert (= start!19930 b!195591))

(declare-fun m!223139 () Bool)

(assert (=> b!195593 m!223139))

(declare-fun m!223141 () Bool)

(assert (=> b!195593 m!223141))

(declare-fun m!223143 () Bool)

(assert (=> mapNonEmpty!7801 m!223143))

(declare-fun m!223145 () Bool)

(assert (=> b!195595 m!223145))

(declare-fun m!223147 () Bool)

(assert (=> b!195584 m!223147))

(declare-fun m!223149 () Bool)

(assert (=> bm!19754 m!223149))

(declare-fun m!223151 () Bool)

(assert (=> b!195592 m!223151))

(declare-fun m!223153 () Bool)

(assert (=> start!19930 m!223153))

(declare-fun m!223155 () Bool)

(assert (=> b!195591 m!223155))

(declare-fun m!223157 () Bool)

(assert (=> b!195591 m!223157))

(declare-fun m!223159 () Bool)

(assert (=> mapNonEmpty!7800 m!223159))

(declare-fun m!223161 () Bool)

(assert (=> bm!19755 m!223161))

(declare-fun m!223163 () Bool)

(assert (=> b!195598 m!223163))

(check-sat (not mapNonEmpty!7801) (not b!195595) (not b!195598) (not b!195592) (not mapNonEmpty!7800) (not b_next!4733) (not b_next!4735) (not b!195593) (not b!195584) (not bm!19755) b_and!11481 tp_is_empty!4503 (not b!195591) b_and!11479 (not bm!19754) (not start!19930))
(check-sat b_and!11479 b_and!11481 (not b_next!4735) (not b_next!4733))
(get-model)

(declare-fun d!57499 () Bool)

(declare-fun getCurrentListMap!903 (array!8261 array!8263 (_ BitVec 32) (_ BitVec 32) V!5651 V!5651 (_ BitVec 32) Int) ListLongMap!2481)

(assert (=> d!57499 (= (map!2035 (_2!1794 lt!97484)) (getCurrentListMap!903 (_keys!5975 (_2!1794 lt!97484)) (_values!3959 (_2!1794 lt!97484)) (mask!9252 (_2!1794 lt!97484)) (extraKeys!3713 (_2!1794 lt!97484)) (zeroValue!3817 (_2!1794 lt!97484)) (minValue!3817 (_2!1794 lt!97484)) #b00000000000000000000000000000000 (defaultEntry!3976 (_2!1794 lt!97484))))))

(declare-fun bs!7811 () Bool)

(assert (= bs!7811 d!57499))

(declare-fun m!223191 () Bool)

(assert (=> bs!7811 m!223191))

(assert (=> bm!19755 d!57499))

(declare-fun b!195656 () Bool)

(declare-fun c!35419 () Bool)

(declare-fun lt!97502 () (_ BitVec 64))

(assert (=> b!195656 (= c!35419 (= lt!97502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128731 () SeekEntryResult!699)

(declare-fun e!128732 () SeekEntryResult!699)

(assert (=> b!195656 (= e!128731 e!128732)))

(declare-fun b!195657 () Bool)

(declare-fun lt!97501 () SeekEntryResult!699)

(assert (=> b!195657 (= e!128731 (Found!699 (index!4968 lt!97501)))))

(declare-fun d!57501 () Bool)

(declare-fun lt!97500 () SeekEntryResult!699)

(assert (=> d!57501 (and (or ((_ is Undefined!699) lt!97500) (not ((_ is Found!699) lt!97500)) (and (bvsge (index!4967 lt!97500) #b00000000000000000000000000000000) (bvslt (index!4967 lt!97500) (size!4212 (_keys!5975 thiss!1248))))) (or ((_ is Undefined!699) lt!97500) ((_ is Found!699) lt!97500) (not ((_ is MissingZero!699) lt!97500)) (and (bvsge (index!4966 lt!97500) #b00000000000000000000000000000000) (bvslt (index!4966 lt!97500) (size!4212 (_keys!5975 thiss!1248))))) (or ((_ is Undefined!699) lt!97500) ((_ is Found!699) lt!97500) ((_ is MissingZero!699) lt!97500) (not ((_ is MissingVacant!699) lt!97500)) (and (bvsge (index!4969 lt!97500) #b00000000000000000000000000000000) (bvslt (index!4969 lt!97500) (size!4212 (_keys!5975 thiss!1248))))) (or ((_ is Undefined!699) lt!97500) (ite ((_ is Found!699) lt!97500) (= (select (arr!3887 (_keys!5975 thiss!1248)) (index!4967 lt!97500)) key!828) (ite ((_ is MissingZero!699) lt!97500) (= (select (arr!3887 (_keys!5975 thiss!1248)) (index!4966 lt!97500)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!699) lt!97500) (= (select (arr!3887 (_keys!5975 thiss!1248)) (index!4969 lt!97500)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128733 () SeekEntryResult!699)

(assert (=> d!57501 (= lt!97500 e!128733)))

(declare-fun c!35418 () Bool)

(assert (=> d!57501 (= c!35418 (and ((_ is Intermediate!699) lt!97501) (undefined!1511 lt!97501)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8261 (_ BitVec 32)) SeekEntryResult!699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57501 (= lt!97501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9252 thiss!1248)) key!828 (_keys!5975 thiss!1248) (mask!9252 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!57501 (validMask!0 (mask!9252 thiss!1248))))

(assert (=> d!57501 (= (seekEntryOrOpen!0 key!828 (_keys!5975 thiss!1248) (mask!9252 thiss!1248)) lt!97500)))

(declare-fun b!195658 () Bool)

(assert (=> b!195658 (= e!128733 e!128731)))

(assert (=> b!195658 (= lt!97502 (select (arr!3887 (_keys!5975 thiss!1248)) (index!4968 lt!97501)))))

(declare-fun c!35420 () Bool)

(assert (=> b!195658 (= c!35420 (= lt!97502 key!828))))

(declare-fun b!195659 () Bool)

(assert (=> b!195659 (= e!128732 (MissingZero!699 (index!4968 lt!97501)))))

(declare-fun b!195660 () Bool)

(assert (=> b!195660 (= e!128733 Undefined!699)))

(declare-fun b!195661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8261 (_ BitVec 32)) SeekEntryResult!699)

(assert (=> b!195661 (= e!128732 (seekKeyOrZeroReturnVacant!0 (x!20754 lt!97501) (index!4968 lt!97501) (index!4968 lt!97501) key!828 (_keys!5975 thiss!1248) (mask!9252 thiss!1248)))))

(assert (= (and d!57501 c!35418) b!195660))

(assert (= (and d!57501 (not c!35418)) b!195658))

(assert (= (and b!195658 c!35420) b!195657))

(assert (= (and b!195658 (not c!35420)) b!195656))

(assert (= (and b!195656 c!35419) b!195659))

(assert (= (and b!195656 (not c!35419)) b!195661))

(declare-fun m!223193 () Bool)

(assert (=> d!57501 m!223193))

(declare-fun m!223195 () Bool)

(assert (=> d!57501 m!223195))

(declare-fun m!223197 () Bool)

(assert (=> d!57501 m!223197))

(declare-fun m!223199 () Bool)

(assert (=> d!57501 m!223199))

(declare-fun m!223201 () Bool)

(assert (=> d!57501 m!223201))

(assert (=> d!57501 m!223195))

(declare-fun m!223203 () Bool)

(assert (=> d!57501 m!223203))

(declare-fun m!223205 () Bool)

(assert (=> b!195658 m!223205))

(declare-fun m!223207 () Bool)

(assert (=> b!195661 m!223207))

(assert (=> b!195598 d!57501))

(declare-fun d!57503 () Bool)

(assert (=> d!57503 (= (array_inv!2523 (_keys!5975 thiss!1248)) (bvsge (size!4212 (_keys!5975 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195591 d!57503))

(declare-fun d!57505 () Bool)

(assert (=> d!57505 (= (array_inv!2524 (_values!3959 thiss!1248)) (bvsge (size!4213 (_values!3959 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195591 d!57505))

(declare-fun d!57507 () Bool)

(declare-fun e!128739 () Bool)

(assert (=> d!57507 e!128739))

(declare-fun res!92336 () Bool)

(assert (=> d!57507 (=> res!92336 e!128739)))

(declare-fun lt!97512 () Bool)

(assert (=> d!57507 (= res!92336 (not lt!97512))))

(declare-fun lt!97514 () Bool)

(assert (=> d!57507 (= lt!97512 lt!97514)))

(declare-datatypes ((Unit!5939 0))(
  ( (Unit!5940) )
))
(declare-fun lt!97513 () Unit!5939)

(declare-fun e!128738 () Unit!5939)

(assert (=> d!57507 (= lt!97513 e!128738)))

(declare-fun c!35423 () Bool)

(assert (=> d!57507 (= c!35423 lt!97514)))

(declare-fun containsKey!250 (List!2453 (_ BitVec 64)) Bool)

(assert (=> d!57507 (= lt!97514 (containsKey!250 (toList!1256 lt!97482) key!828))))

(assert (=> d!57507 (= (contains!1383 lt!97482 key!828) lt!97512)))

(declare-fun b!195668 () Bool)

(declare-fun lt!97511 () Unit!5939)

(assert (=> b!195668 (= e!128738 lt!97511)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!198 (List!2453 (_ BitVec 64)) Unit!5939)

(assert (=> b!195668 (= lt!97511 (lemmaContainsKeyImpliesGetValueByKeyDefined!198 (toList!1256 lt!97482) key!828))))

(declare-datatypes ((Option!252 0))(
  ( (Some!251 (v!4266 V!5651)) (None!250) )
))
(declare-fun isDefined!199 (Option!252) Bool)

(declare-fun getValueByKey!246 (List!2453 (_ BitVec 64)) Option!252)

(assert (=> b!195668 (isDefined!199 (getValueByKey!246 (toList!1256 lt!97482) key!828))))

(declare-fun b!195669 () Bool)

(declare-fun Unit!5941 () Unit!5939)

(assert (=> b!195669 (= e!128738 Unit!5941)))

(declare-fun b!195670 () Bool)

(assert (=> b!195670 (= e!128739 (isDefined!199 (getValueByKey!246 (toList!1256 lt!97482) key!828)))))

(assert (= (and d!57507 c!35423) b!195668))

(assert (= (and d!57507 (not c!35423)) b!195669))

(assert (= (and d!57507 (not res!92336)) b!195670))

(declare-fun m!223209 () Bool)

(assert (=> d!57507 m!223209))

(declare-fun m!223211 () Bool)

(assert (=> b!195668 m!223211))

(declare-fun m!223213 () Bool)

(assert (=> b!195668 m!223213))

(assert (=> b!195668 m!223213))

(declare-fun m!223215 () Bool)

(assert (=> b!195668 m!223215))

(assert (=> b!195670 m!223213))

(assert (=> b!195670 m!223213))

(assert (=> b!195670 m!223215))

(assert (=> b!195595 d!57507))

(declare-fun d!57509 () Bool)

(declare-fun e!128742 () Bool)

(assert (=> d!57509 e!128742))

(declare-fun res!92342 () Bool)

(assert (=> d!57509 (=> (not res!92342) (not e!128742))))

(declare-fun lt!97526 () ListLongMap!2481)

(assert (=> d!57509 (= res!92342 (contains!1383 lt!97526 (_1!1793 (tuple2!3565 key!828 v!309))))))

(declare-fun lt!97523 () List!2453)

(assert (=> d!57509 (= lt!97526 (ListLongMap!2482 lt!97523))))

(declare-fun lt!97525 () Unit!5939)

(declare-fun lt!97524 () Unit!5939)

(assert (=> d!57509 (= lt!97525 lt!97524)))

(assert (=> d!57509 (= (getValueByKey!246 lt!97523 (_1!1793 (tuple2!3565 key!828 v!309))) (Some!251 (_2!1793 (tuple2!3565 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!133 (List!2453 (_ BitVec 64) V!5651) Unit!5939)

(assert (=> d!57509 (= lt!97524 (lemmaContainsTupThenGetReturnValue!133 lt!97523 (_1!1793 (tuple2!3565 key!828 v!309)) (_2!1793 (tuple2!3565 key!828 v!309))))))

(declare-fun insertStrictlySorted!136 (List!2453 (_ BitVec 64) V!5651) List!2453)

(assert (=> d!57509 (= lt!97523 (insertStrictlySorted!136 (toList!1256 call!19758) (_1!1793 (tuple2!3565 key!828 v!309)) (_2!1793 (tuple2!3565 key!828 v!309))))))

(assert (=> d!57509 (= (+!323 call!19758 (tuple2!3565 key!828 v!309)) lt!97526)))

(declare-fun b!195675 () Bool)

(declare-fun res!92341 () Bool)

(assert (=> b!195675 (=> (not res!92341) (not e!128742))))

(assert (=> b!195675 (= res!92341 (= (getValueByKey!246 (toList!1256 lt!97526) (_1!1793 (tuple2!3565 key!828 v!309))) (Some!251 (_2!1793 (tuple2!3565 key!828 v!309)))))))

(declare-fun b!195676 () Bool)

(declare-fun contains!1384 (List!2453 tuple2!3564) Bool)

(assert (=> b!195676 (= e!128742 (contains!1384 (toList!1256 lt!97526) (tuple2!3565 key!828 v!309)))))

(assert (= (and d!57509 res!92342) b!195675))

(assert (= (and b!195675 res!92341) b!195676))

(declare-fun m!223217 () Bool)

(assert (=> d!57509 m!223217))

(declare-fun m!223219 () Bool)

(assert (=> d!57509 m!223219))

(declare-fun m!223221 () Bool)

(assert (=> d!57509 m!223221))

(declare-fun m!223223 () Bool)

(assert (=> d!57509 m!223223))

(declare-fun m!223225 () Bool)

(assert (=> b!195675 m!223225))

(declare-fun m!223227 () Bool)

(assert (=> b!195676 m!223227))

(assert (=> b!195584 d!57509))

(declare-fun d!57511 () Bool)

(assert (=> d!57511 (= (array_inv!2523 (_keys!5975 (_2!1794 err!103))) (bvsge (size!4212 (_keys!5975 (_2!1794 err!103))) #b00000000000000000000000000000000))))

(assert (=> b!195593 d!57511))

(declare-fun d!57513 () Bool)

(assert (=> d!57513 (= (array_inv!2524 (_values!3959 (_2!1794 err!103))) (bvsge (size!4213 (_values!3959 (_2!1794 err!103))) #b00000000000000000000000000000000))))

(assert (=> b!195593 d!57513))

(declare-fun d!57515 () Bool)

(declare-fun res!92349 () Bool)

(declare-fun e!128745 () Bool)

(assert (=> d!57515 (=> (not res!92349) (not e!128745))))

(declare-fun simpleValid!206 (LongMapFixedSize!2724) Bool)

(assert (=> d!57515 (= res!92349 (simpleValid!206 thiss!1248))))

(assert (=> d!57515 (= (valid!1116 thiss!1248) e!128745)))

(declare-fun b!195683 () Bool)

(declare-fun res!92350 () Bool)

(assert (=> b!195683 (=> (not res!92350) (not e!128745))))

(declare-fun arrayCountValidKeys!0 (array!8261 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!195683 (= res!92350 (= (arrayCountValidKeys!0 (_keys!5975 thiss!1248) #b00000000000000000000000000000000 (size!4212 (_keys!5975 thiss!1248))) (_size!1411 thiss!1248)))))

(declare-fun b!195684 () Bool)

(declare-fun res!92351 () Bool)

(assert (=> b!195684 (=> (not res!92351) (not e!128745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8261 (_ BitVec 32)) Bool)

(assert (=> b!195684 (= res!92351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5975 thiss!1248) (mask!9252 thiss!1248)))))

(declare-fun b!195685 () Bool)

(declare-datatypes ((List!2454 0))(
  ( (Nil!2451) (Cons!2450 (h!3092 (_ BitVec 64)) (t!7385 List!2454)) )
))
(declare-fun arrayNoDuplicates!0 (array!8261 (_ BitVec 32) List!2454) Bool)

(assert (=> b!195685 (= e!128745 (arrayNoDuplicates!0 (_keys!5975 thiss!1248) #b00000000000000000000000000000000 Nil!2451))))

(assert (= (and d!57515 res!92349) b!195683))

(assert (= (and b!195683 res!92350) b!195684))

(assert (= (and b!195684 res!92351) b!195685))

(declare-fun m!223229 () Bool)

(assert (=> d!57515 m!223229))

(declare-fun m!223231 () Bool)

(assert (=> b!195683 m!223231))

(declare-fun m!223233 () Bool)

(assert (=> b!195684 m!223233))

(declare-fun m!223235 () Bool)

(assert (=> b!195685 m!223235))

(assert (=> start!19930 d!57515))

(declare-fun d!57517 () Bool)

(assert (=> d!57517 (= (map!2035 thiss!1248) (getCurrentListMap!903 (_keys!5975 thiss!1248) (_values!3959 thiss!1248) (mask!9252 thiss!1248) (extraKeys!3713 thiss!1248) (zeroValue!3817 thiss!1248) (minValue!3817 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3976 thiss!1248)))))

(declare-fun bs!7812 () Bool)

(assert (= bs!7812 d!57517))

(declare-fun m!223237 () Bool)

(assert (=> bs!7812 m!223237))

(assert (=> bm!19754 d!57517))

(declare-fun d!57519 () Bool)

(declare-fun res!92352 () Bool)

(declare-fun e!128746 () Bool)

(assert (=> d!57519 (=> (not res!92352) (not e!128746))))

(assert (=> d!57519 (= res!92352 (simpleValid!206 (_2!1794 lt!97484)))))

(assert (=> d!57519 (= (valid!1116 (_2!1794 lt!97484)) e!128746)))

(declare-fun b!195686 () Bool)

(declare-fun res!92353 () Bool)

(assert (=> b!195686 (=> (not res!92353) (not e!128746))))

(assert (=> b!195686 (= res!92353 (= (arrayCountValidKeys!0 (_keys!5975 (_2!1794 lt!97484)) #b00000000000000000000000000000000 (size!4212 (_keys!5975 (_2!1794 lt!97484)))) (_size!1411 (_2!1794 lt!97484))))))

(declare-fun b!195687 () Bool)

(declare-fun res!92354 () Bool)

(assert (=> b!195687 (=> (not res!92354) (not e!128746))))

(assert (=> b!195687 (= res!92354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5975 (_2!1794 lt!97484)) (mask!9252 (_2!1794 lt!97484))))))

(declare-fun b!195688 () Bool)

(assert (=> b!195688 (= e!128746 (arrayNoDuplicates!0 (_keys!5975 (_2!1794 lt!97484)) #b00000000000000000000000000000000 Nil!2451))))

(assert (= (and d!57519 res!92352) b!195686))

(assert (= (and b!195686 res!92353) b!195687))

(assert (= (and b!195687 res!92354) b!195688))

(declare-fun m!223239 () Bool)

(assert (=> d!57519 m!223239))

(declare-fun m!223241 () Bool)

(assert (=> b!195686 m!223241))

(declare-fun m!223243 () Bool)

(assert (=> b!195687 m!223243))

(declare-fun m!223245 () Bool)

(assert (=> b!195688 m!223245))

(assert (=> b!195592 d!57519))

(declare-fun mapIsEmpty!7810 () Bool)

(declare-fun mapRes!7810 () Bool)

(assert (=> mapIsEmpty!7810 mapRes!7810))

(declare-fun mapNonEmpty!7810 () Bool)

(declare-fun tp!17098 () Bool)

(declare-fun e!128751 () Bool)

(assert (=> mapNonEmpty!7810 (= mapRes!7810 (and tp!17098 e!128751))))

(declare-fun mapValue!7810 () ValueCell!1908)

(declare-fun mapKey!7810 () (_ BitVec 32))

(declare-fun mapRest!7810 () (Array (_ BitVec 32) ValueCell!1908))

(assert (=> mapNonEmpty!7810 (= mapRest!7800 (store mapRest!7810 mapKey!7810 mapValue!7810))))

(declare-fun condMapEmpty!7810 () Bool)

(declare-fun mapDefault!7810 () ValueCell!1908)

(assert (=> mapNonEmpty!7800 (= condMapEmpty!7810 (= mapRest!7800 ((as const (Array (_ BitVec 32) ValueCell!1908)) mapDefault!7810)))))

(declare-fun e!128752 () Bool)

(assert (=> mapNonEmpty!7800 (= tp!17080 (and e!128752 mapRes!7810))))

(declare-fun b!195695 () Bool)

(assert (=> b!195695 (= e!128751 tp_is_empty!4503)))

(declare-fun b!195696 () Bool)

(assert (=> b!195696 (= e!128752 tp_is_empty!4503)))

(assert (= (and mapNonEmpty!7800 condMapEmpty!7810) mapIsEmpty!7810))

(assert (= (and mapNonEmpty!7800 (not condMapEmpty!7810)) mapNonEmpty!7810))

(assert (= (and mapNonEmpty!7810 ((_ is ValueCellFull!1908) mapValue!7810)) b!195695))

(assert (= (and mapNonEmpty!7800 ((_ is ValueCellFull!1908) mapDefault!7810)) b!195696))

(declare-fun m!223247 () Bool)

(assert (=> mapNonEmpty!7810 m!223247))

(declare-fun mapIsEmpty!7811 () Bool)

(declare-fun mapRes!7811 () Bool)

(assert (=> mapIsEmpty!7811 mapRes!7811))

(declare-fun mapNonEmpty!7811 () Bool)

(declare-fun tp!17099 () Bool)

(declare-fun e!128753 () Bool)

(assert (=> mapNonEmpty!7811 (= mapRes!7811 (and tp!17099 e!128753))))

(declare-fun mapKey!7811 () (_ BitVec 32))

(declare-fun mapValue!7811 () ValueCell!1908)

(declare-fun mapRest!7811 () (Array (_ BitVec 32) ValueCell!1908))

(assert (=> mapNonEmpty!7811 (= mapRest!7801 (store mapRest!7811 mapKey!7811 mapValue!7811))))

(declare-fun condMapEmpty!7811 () Bool)

(declare-fun mapDefault!7811 () ValueCell!1908)

(assert (=> mapNonEmpty!7801 (= condMapEmpty!7811 (= mapRest!7801 ((as const (Array (_ BitVec 32) ValueCell!1908)) mapDefault!7811)))))

(declare-fun e!128754 () Bool)

(assert (=> mapNonEmpty!7801 (= tp!17082 (and e!128754 mapRes!7811))))

(declare-fun b!195697 () Bool)

(assert (=> b!195697 (= e!128753 tp_is_empty!4503)))

(declare-fun b!195698 () Bool)

(assert (=> b!195698 (= e!128754 tp_is_empty!4503)))

(assert (= (and mapNonEmpty!7801 condMapEmpty!7811) mapIsEmpty!7811))

(assert (= (and mapNonEmpty!7801 (not condMapEmpty!7811)) mapNonEmpty!7811))

(assert (= (and mapNonEmpty!7811 ((_ is ValueCellFull!1908) mapValue!7811)) b!195697))

(assert (= (and mapNonEmpty!7801 ((_ is ValueCellFull!1908) mapDefault!7811)) b!195698))

(declare-fun m!223249 () Bool)

(assert (=> mapNonEmpty!7811 m!223249))

(check-sat (not b!195668) (not d!57509) (not b!195686) b_and!11479 (not b_next!4733) (not d!57517) (not d!57507) (not d!57519) (not b!195687) (not b!195661) (not b!195675) b_and!11481 tp_is_empty!4503 (not mapNonEmpty!7811) (not d!57515) (not mapNonEmpty!7810) (not b!195676) (not b!195685) (not d!57499) (not b!195670) (not d!57501) (not b_next!4735) (not b!195684) (not b!195683) (not b!195688))
(check-sat b_and!11479 b_and!11481 (not b_next!4735) (not b_next!4733))
