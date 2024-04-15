; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17940 () Bool)

(assert start!17940)

(declare-fun b!178618 () Bool)

(declare-fun b_free!4411 () Bool)

(declare-fun b_next!4411 () Bool)

(assert (=> b!178618 (= b_free!4411 (not b_next!4411))))

(declare-fun tp!15950 () Bool)

(declare-fun b_and!10907 () Bool)

(assert (=> b!178618 (= tp!15950 b_and!10907)))

(declare-fun res!84585 () Bool)

(declare-fun e!117711 () Bool)

(assert (=> start!17940 (=> (not res!84585) (not e!117711))))

(declare-datatypes ((V!5225 0))(
  ( (V!5226 (val!2136 Int)) )
))
(declare-datatypes ((ValueCell!1748 0))(
  ( (ValueCellFull!1748 (v!4015 V!5225)) (EmptyCell!1748) )
))
(declare-datatypes ((array!7507 0))(
  ( (array!7508 (arr!3556 (Array (_ BitVec 32) (_ BitVec 64))) (size!3864 (_ BitVec 32))) )
))
(declare-datatypes ((array!7509 0))(
  ( (array!7510 (arr!3557 (Array (_ BitVec 32) ValueCell!1748)) (size!3865 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2404 0))(
  ( (LongMapFixedSize!2405 (defaultEntry!3673 Int) (mask!8640 (_ BitVec 32)) (extraKeys!3410 (_ BitVec 32)) (zeroValue!3514 V!5225) (minValue!3514 V!5225) (_size!1251 (_ BitVec 32)) (_keys!5553 array!7507) (_values!3656 array!7509) (_vacant!1251 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2404)

(declare-fun valid!1021 (LongMapFixedSize!2404) Bool)

(assert (=> start!17940 (= res!84585 (valid!1021 thiss!1248))))

(assert (=> start!17940 e!117711))

(declare-fun e!117710 () Bool)

(assert (=> start!17940 e!117710))

(assert (=> start!17940 true))

(declare-fun b!178616 () Bool)

(declare-fun e!117713 () Bool)

(declare-fun tp_is_empty!4183 () Bool)

(assert (=> b!178616 (= e!117713 tp_is_empty!4183)))

(declare-fun b!178617 () Bool)

(declare-fun res!84581 () Bool)

(assert (=> b!178617 (=> (not res!84581) (not e!117711))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3302 0))(
  ( (tuple2!3303 (_1!1662 (_ BitVec 64)) (_2!1662 V!5225)) )
))
(declare-datatypes ((List!2267 0))(
  ( (Nil!2264) (Cons!2263 (h!2887 tuple2!3302) (t!7098 List!2267)) )
))
(declare-datatypes ((ListLongMap!2221 0))(
  ( (ListLongMap!2222 (toList!1126 List!2267)) )
))
(declare-fun contains!1203 (ListLongMap!2221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!762 (array!7507 array!7509 (_ BitVec 32) (_ BitVec 32) V!5225 V!5225 (_ BitVec 32) Int) ListLongMap!2221)

(assert (=> b!178617 (= res!84581 (not (contains!1203 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!7155 () Bool)

(declare-fun mapRes!7155 () Bool)

(declare-fun tp!15951 () Bool)

(assert (=> mapNonEmpty!7155 (= mapRes!7155 (and tp!15951 e!117713))))

(declare-fun mapRest!7155 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapKey!7155 () (_ BitVec 32))

(declare-fun mapValue!7155 () ValueCell!1748)

(assert (=> mapNonEmpty!7155 (= (arr!3557 (_values!3656 thiss!1248)) (store mapRest!7155 mapKey!7155 mapValue!7155))))

(declare-fun mapIsEmpty!7155 () Bool)

(assert (=> mapIsEmpty!7155 mapRes!7155))

(declare-fun e!117712 () Bool)

(declare-fun array_inv!2295 (array!7507) Bool)

(declare-fun array_inv!2296 (array!7509) Bool)

(assert (=> b!178618 (= e!117710 (and tp!15950 tp_is_empty!4183 (array_inv!2295 (_keys!5553 thiss!1248)) (array_inv!2296 (_values!3656 thiss!1248)) e!117712))))

(declare-fun b!178619 () Bool)

(declare-fun res!84582 () Bool)

(assert (=> b!178619 (=> (not res!84582) (not e!117711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178619 (= res!84582 (validMask!0 (mask!8640 thiss!1248)))))

(declare-fun b!178620 () Bool)

(declare-fun res!84584 () Bool)

(assert (=> b!178620 (=> (not res!84584) (not e!117711))))

(assert (=> b!178620 (= res!84584 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178621 () Bool)

(assert (=> b!178621 (= e!117711 (and (= (size!3865 (_values!3656 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8640 thiss!1248))) (= (size!3864 (_keys!5553 thiss!1248)) (size!3865 (_values!3656 thiss!1248))) (bvsge (mask!8640 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3410 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3410 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!178622 () Bool)

(declare-fun res!84583 () Bool)

(assert (=> b!178622 (=> (not res!84583) (not e!117711))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!585 0))(
  ( (MissingZero!585 (index!4508 (_ BitVec 32))) (Found!585 (index!4509 (_ BitVec 32))) (Intermediate!585 (undefined!1397 Bool) (index!4510 (_ BitVec 32)) (x!19578 (_ BitVec 32))) (Undefined!585) (MissingVacant!585 (index!4511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7507 (_ BitVec 32)) SeekEntryResult!585)

(assert (=> b!178622 (= res!84583 ((_ is Undefined!585) (seekEntryOrOpen!0 key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248))))))

(declare-fun b!178623 () Bool)

(declare-fun e!117714 () Bool)

(assert (=> b!178623 (= e!117714 tp_is_empty!4183)))

(declare-fun b!178624 () Bool)

(assert (=> b!178624 (= e!117712 (and e!117714 mapRes!7155))))

(declare-fun condMapEmpty!7155 () Bool)

(declare-fun mapDefault!7155 () ValueCell!1748)

(assert (=> b!178624 (= condMapEmpty!7155 (= (arr!3557 (_values!3656 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1748)) mapDefault!7155)))))

(assert (= (and start!17940 res!84585) b!178620))

(assert (= (and b!178620 res!84584) b!178622))

(assert (= (and b!178622 res!84583) b!178617))

(assert (= (and b!178617 res!84581) b!178619))

(assert (= (and b!178619 res!84582) b!178621))

(assert (= (and b!178624 condMapEmpty!7155) mapIsEmpty!7155))

(assert (= (and b!178624 (not condMapEmpty!7155)) mapNonEmpty!7155))

(assert (= (and mapNonEmpty!7155 ((_ is ValueCellFull!1748) mapValue!7155)) b!178616))

(assert (= (and b!178624 ((_ is ValueCellFull!1748) mapDefault!7155)) b!178623))

(assert (= b!178618 b!178624))

(assert (= start!17940 b!178618))

(declare-fun m!206517 () Bool)

(assert (=> b!178622 m!206517))

(declare-fun m!206519 () Bool)

(assert (=> b!178618 m!206519))

(declare-fun m!206521 () Bool)

(assert (=> b!178618 m!206521))

(declare-fun m!206523 () Bool)

(assert (=> mapNonEmpty!7155 m!206523))

(declare-fun m!206525 () Bool)

(assert (=> start!17940 m!206525))

(declare-fun m!206527 () Bool)

(assert (=> b!178617 m!206527))

(assert (=> b!178617 m!206527))

(declare-fun m!206529 () Bool)

(assert (=> b!178617 m!206529))

(declare-fun m!206531 () Bool)

(assert (=> b!178619 m!206531))

(check-sat (not mapNonEmpty!7155) (not b!178618) (not b!178617) b_and!10907 (not start!17940) tp_is_empty!4183 (not b_next!4411) (not b!178622) (not b!178619))
(check-sat b_and!10907 (not b_next!4411))
(get-model)

(declare-fun d!53887 () Bool)

(declare-fun res!84622 () Bool)

(declare-fun e!117753 () Bool)

(assert (=> d!53887 (=> (not res!84622) (not e!117753))))

(declare-fun simpleValid!159 (LongMapFixedSize!2404) Bool)

(assert (=> d!53887 (= res!84622 (simpleValid!159 thiss!1248))))

(assert (=> d!53887 (= (valid!1021 thiss!1248) e!117753)))

(declare-fun b!178685 () Bool)

(declare-fun res!84623 () Bool)

(assert (=> b!178685 (=> (not res!84623) (not e!117753))))

(declare-fun arrayCountValidKeys!0 (array!7507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178685 (= res!84623 (= (arrayCountValidKeys!0 (_keys!5553 thiss!1248) #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))) (_size!1251 thiss!1248)))))

(declare-fun b!178686 () Bool)

(declare-fun res!84624 () Bool)

(assert (=> b!178686 (=> (not res!84624) (not e!117753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7507 (_ BitVec 32)) Bool)

(assert (=> b!178686 (= res!84624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)))))

(declare-fun b!178687 () Bool)

(declare-datatypes ((List!2270 0))(
  ( (Nil!2267) (Cons!2266 (h!2890 (_ BitVec 64)) (t!7103 List!2270)) )
))
(declare-fun arrayNoDuplicates!0 (array!7507 (_ BitVec 32) List!2270) Bool)

(assert (=> b!178687 (= e!117753 (arrayNoDuplicates!0 (_keys!5553 thiss!1248) #b00000000000000000000000000000000 Nil!2267))))

(assert (= (and d!53887 res!84622) b!178685))

(assert (= (and b!178685 res!84623) b!178686))

(assert (= (and b!178686 res!84624) b!178687))

(declare-fun m!206565 () Bool)

(assert (=> d!53887 m!206565))

(declare-fun m!206567 () Bool)

(assert (=> b!178685 m!206567))

(declare-fun m!206569 () Bool)

(assert (=> b!178686 m!206569))

(declare-fun m!206571 () Bool)

(assert (=> b!178687 m!206571))

(assert (=> start!17940 d!53887))

(declare-fun d!53889 () Bool)

(assert (=> d!53889 (= (array_inv!2295 (_keys!5553 thiss!1248)) (bvsge (size!3864 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178618 d!53889))

(declare-fun d!53891 () Bool)

(assert (=> d!53891 (= (array_inv!2296 (_values!3656 thiss!1248)) (bvsge (size!3865 (_values!3656 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178618 d!53891))

(declare-fun b!178700 () Bool)

(declare-fun e!117761 () SeekEntryResult!585)

(declare-fun lt!88178 () SeekEntryResult!585)

(assert (=> b!178700 (= e!117761 (Found!585 (index!4510 lt!88178)))))

(declare-fun e!117762 () SeekEntryResult!585)

(declare-fun b!178701 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7507 (_ BitVec 32)) SeekEntryResult!585)

(assert (=> b!178701 (= e!117762 (seekKeyOrZeroReturnVacant!0 (x!19578 lt!88178) (index!4510 lt!88178) (index!4510 lt!88178) key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)))))

(declare-fun d!53893 () Bool)

(declare-fun lt!88176 () SeekEntryResult!585)

(assert (=> d!53893 (and (or ((_ is Undefined!585) lt!88176) (not ((_ is Found!585) lt!88176)) (and (bvsge (index!4509 lt!88176) #b00000000000000000000000000000000) (bvslt (index!4509 lt!88176) (size!3864 (_keys!5553 thiss!1248))))) (or ((_ is Undefined!585) lt!88176) ((_ is Found!585) lt!88176) (not ((_ is MissingZero!585) lt!88176)) (and (bvsge (index!4508 lt!88176) #b00000000000000000000000000000000) (bvslt (index!4508 lt!88176) (size!3864 (_keys!5553 thiss!1248))))) (or ((_ is Undefined!585) lt!88176) ((_ is Found!585) lt!88176) ((_ is MissingZero!585) lt!88176) (not ((_ is MissingVacant!585) lt!88176)) (and (bvsge (index!4511 lt!88176) #b00000000000000000000000000000000) (bvslt (index!4511 lt!88176) (size!3864 (_keys!5553 thiss!1248))))) (or ((_ is Undefined!585) lt!88176) (ite ((_ is Found!585) lt!88176) (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4509 lt!88176)) key!828) (ite ((_ is MissingZero!585) lt!88176) (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4508 lt!88176)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!585) lt!88176) (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4511 lt!88176)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!117760 () SeekEntryResult!585)

(assert (=> d!53893 (= lt!88176 e!117760)))

(declare-fun c!32029 () Bool)

(assert (=> d!53893 (= c!32029 (and ((_ is Intermediate!585) lt!88178) (undefined!1397 lt!88178)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7507 (_ BitVec 32)) SeekEntryResult!585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53893 (= lt!88178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8640 thiss!1248)) key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)))))

(assert (=> d!53893 (validMask!0 (mask!8640 thiss!1248))))

(assert (=> d!53893 (= (seekEntryOrOpen!0 key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)) lt!88176)))

(declare-fun b!178702 () Bool)

(assert (=> b!178702 (= e!117760 Undefined!585)))

(declare-fun b!178703 () Bool)

(declare-fun c!32028 () Bool)

(declare-fun lt!88177 () (_ BitVec 64))

(assert (=> b!178703 (= c!32028 (= lt!88177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178703 (= e!117761 e!117762)))

(declare-fun b!178704 () Bool)

(assert (=> b!178704 (= e!117760 e!117761)))

(assert (=> b!178704 (= lt!88177 (select (arr!3556 (_keys!5553 thiss!1248)) (index!4510 lt!88178)))))

(declare-fun c!32030 () Bool)

(assert (=> b!178704 (= c!32030 (= lt!88177 key!828))))

(declare-fun b!178705 () Bool)

(assert (=> b!178705 (= e!117762 (MissingZero!585 (index!4510 lt!88178)))))

(assert (= (and d!53893 c!32029) b!178702))

(assert (= (and d!53893 (not c!32029)) b!178704))

(assert (= (and b!178704 c!32030) b!178700))

(assert (= (and b!178704 (not c!32030)) b!178703))

(assert (= (and b!178703 c!32028) b!178705))

(assert (= (and b!178703 (not c!32028)) b!178701))

(declare-fun m!206573 () Bool)

(assert (=> b!178701 m!206573))

(declare-fun m!206575 () Bool)

(assert (=> d!53893 m!206575))

(assert (=> d!53893 m!206575))

(declare-fun m!206577 () Bool)

(assert (=> d!53893 m!206577))

(assert (=> d!53893 m!206531))

(declare-fun m!206579 () Bool)

(assert (=> d!53893 m!206579))

(declare-fun m!206581 () Bool)

(assert (=> d!53893 m!206581))

(declare-fun m!206583 () Bool)

(assert (=> d!53893 m!206583))

(declare-fun m!206585 () Bool)

(assert (=> b!178704 m!206585))

(assert (=> b!178622 d!53893))

(declare-fun d!53895 () Bool)

(declare-fun e!117768 () Bool)

(assert (=> d!53895 e!117768))

(declare-fun res!84627 () Bool)

(assert (=> d!53895 (=> res!84627 e!117768)))

(declare-fun lt!88188 () Bool)

(assert (=> d!53895 (= res!84627 (not lt!88188))))

(declare-fun lt!88189 () Bool)

(assert (=> d!53895 (= lt!88188 lt!88189)))

(declare-datatypes ((Unit!5425 0))(
  ( (Unit!5426) )
))
(declare-fun lt!88187 () Unit!5425)

(declare-fun e!117767 () Unit!5425)

(assert (=> d!53895 (= lt!88187 e!117767)))

(declare-fun c!32033 () Bool)

(assert (=> d!53895 (= c!32033 lt!88189)))

(declare-fun containsKey!202 (List!2267 (_ BitVec 64)) Bool)

(assert (=> d!53895 (= lt!88189 (containsKey!202 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(assert (=> d!53895 (= (contains!1203 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) key!828) lt!88188)))

(declare-fun b!178712 () Bool)

(declare-fun lt!88190 () Unit!5425)

(assert (=> b!178712 (= e!117767 lt!88190)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!151 (List!2267 (_ BitVec 64)) Unit!5425)

(assert (=> b!178712 (= lt!88190 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-datatypes ((Option!204 0))(
  ( (Some!203 (v!4018 V!5225)) (None!202) )
))
(declare-fun isDefined!152 (Option!204) Bool)

(declare-fun getValueByKey!198 (List!2267 (_ BitVec 64)) Option!204)

(assert (=> b!178712 (isDefined!152 (getValueByKey!198 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-fun b!178713 () Bool)

(declare-fun Unit!5427 () Unit!5425)

(assert (=> b!178713 (= e!117767 Unit!5427)))

(declare-fun b!178714 () Bool)

(assert (=> b!178714 (= e!117768 (isDefined!152 (getValueByKey!198 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828)))))

(assert (= (and d!53895 c!32033) b!178712))

(assert (= (and d!53895 (not c!32033)) b!178713))

(assert (= (and d!53895 (not res!84627)) b!178714))

(declare-fun m!206587 () Bool)

(assert (=> d!53895 m!206587))

(declare-fun m!206589 () Bool)

(assert (=> b!178712 m!206589))

(declare-fun m!206591 () Bool)

(assert (=> b!178712 m!206591))

(assert (=> b!178712 m!206591))

(declare-fun m!206593 () Bool)

(assert (=> b!178712 m!206593))

(assert (=> b!178714 m!206591))

(assert (=> b!178714 m!206591))

(assert (=> b!178714 m!206593))

(assert (=> b!178617 d!53895))

(declare-fun b!178757 () Bool)

(declare-fun e!117798 () Bool)

(declare-fun call!18060 () Bool)

(assert (=> b!178757 (= e!117798 (not call!18060))))

(declare-fun b!178758 () Bool)

(declare-fun c!32050 () Bool)

(assert (=> b!178758 (= c!32050 (and (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117797 () ListLongMap!2221)

(declare-fun e!117801 () ListLongMap!2221)

(assert (=> b!178758 (= e!117797 e!117801)))

(declare-fun bm!18052 () Bool)

(declare-fun call!18057 () ListLongMap!2221)

(declare-fun getCurrentListMapNoExtraKeys!166 (array!7507 array!7509 (_ BitVec 32) (_ BitVec 32) V!5225 V!5225 (_ BitVec 32) Int) ListLongMap!2221)

(assert (=> bm!18052 (= call!18057 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun b!178759 () Bool)

(declare-fun res!84646 () Bool)

(declare-fun e!117799 () Bool)

(assert (=> b!178759 (=> (not res!84646) (not e!117799))))

(declare-fun e!117804 () Bool)

(assert (=> b!178759 (= res!84646 e!117804)))

(declare-fun c!32051 () Bool)

(assert (=> b!178759 (= c!32051 (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!18055 () ListLongMap!2221)

(declare-fun call!18061 () ListLongMap!2221)

(declare-fun bm!18053 () Bool)

(declare-fun call!18059 () ListLongMap!2221)

(declare-fun c!32049 () Bool)

(declare-fun c!32047 () Bool)

(declare-fun +!257 (ListLongMap!2221 tuple2!3302) ListLongMap!2221)

(assert (=> bm!18053 (= call!18059 (+!257 (ite c!32049 call!18057 (ite c!32047 call!18061 call!18055)) (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun b!178761 () Bool)

(declare-fun res!84648 () Bool)

(assert (=> b!178761 (=> (not res!84648) (not e!117799))))

(declare-fun e!117803 () Bool)

(assert (=> b!178761 (= res!84648 e!117803)))

(declare-fun res!84649 () Bool)

(assert (=> b!178761 (=> res!84649 e!117803)))

(declare-fun e!117802 () Bool)

(assert (=> b!178761 (= res!84649 (not e!117802))))

(declare-fun res!84651 () Bool)

(assert (=> b!178761 (=> (not res!84651) (not e!117802))))

(assert (=> b!178761 (= res!84651 (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun b!178762 () Bool)

(declare-fun e!117807 () Bool)

(assert (=> b!178762 (= e!117798 e!117807)))

(declare-fun res!84652 () Bool)

(assert (=> b!178762 (= res!84652 call!18060)))

(assert (=> b!178762 (=> (not res!84652) (not e!117807))))

(declare-fun b!178763 () Bool)

(declare-fun e!117800 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178763 (= e!117800 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178764 () Bool)

(declare-fun lt!88249 () ListLongMap!2221)

(declare-fun apply!145 (ListLongMap!2221 (_ BitVec 64)) V!5225)

(assert (=> b!178764 (= e!117807 (= (apply!145 lt!88249 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3514 thiss!1248)))))

(declare-fun bm!18054 () Bool)

(declare-fun call!18056 () Bool)

(assert (=> bm!18054 (= call!18056 (contains!1203 lt!88249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178765 () Bool)

(declare-fun e!117796 () Bool)

(assert (=> b!178765 (= e!117804 e!117796)))

(declare-fun res!84650 () Bool)

(assert (=> b!178765 (= res!84650 call!18056)))

(assert (=> b!178765 (=> (not res!84650) (not e!117796))))

(declare-fun bm!18055 () Bool)

(assert (=> bm!18055 (= call!18061 call!18057)))

(declare-fun bm!18056 () Bool)

(declare-fun call!18058 () ListLongMap!2221)

(assert (=> bm!18056 (= call!18058 call!18059)))

(declare-fun b!178766 () Bool)

(declare-fun e!117795 () Unit!5425)

(declare-fun Unit!5428 () Unit!5425)

(assert (=> b!178766 (= e!117795 Unit!5428)))

(declare-fun b!178767 () Bool)

(declare-fun e!117805 () ListLongMap!2221)

(assert (=> b!178767 (= e!117805 e!117797)))

(assert (=> b!178767 (= c!32047 (and (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18057 () Bool)

(assert (=> bm!18057 (= call!18055 call!18061)))

(declare-fun bm!18058 () Bool)

(assert (=> bm!18058 (= call!18060 (contains!1203 lt!88249 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178768 () Bool)

(assert (=> b!178768 (= e!117801 call!18058)))

(declare-fun b!178769 () Bool)

(assert (=> b!178769 (= e!117801 call!18055)))

(declare-fun b!178770 () Bool)

(assert (=> b!178770 (= e!117799 e!117798)))

(declare-fun c!32048 () Bool)

(assert (=> b!178770 (= c!32048 (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178771 () Bool)

(assert (=> b!178771 (= e!117796 (= (apply!145 lt!88249 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3514 thiss!1248)))))

(declare-fun b!178772 () Bool)

(assert (=> b!178772 (= e!117805 (+!257 call!18059 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))

(declare-fun b!178773 () Bool)

(declare-fun e!117806 () Bool)

(assert (=> b!178773 (= e!117803 e!117806)))

(declare-fun res!84647 () Bool)

(assert (=> b!178773 (=> (not res!84647) (not e!117806))))

(assert (=> b!178773 (= res!84647 (contains!1203 lt!88249 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun b!178760 () Bool)

(assert (=> b!178760 (= e!117804 (not call!18056))))

(declare-fun d!53897 () Bool)

(assert (=> d!53897 e!117799))

(declare-fun res!84653 () Bool)

(assert (=> d!53897 (=> (not res!84653) (not e!117799))))

(assert (=> d!53897 (= res!84653 (or (bvsge #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))))

(declare-fun lt!88253 () ListLongMap!2221)

(assert (=> d!53897 (= lt!88249 lt!88253)))

(declare-fun lt!88242 () Unit!5425)

(assert (=> d!53897 (= lt!88242 e!117795)))

(declare-fun c!32046 () Bool)

(assert (=> d!53897 (= c!32046 e!117800)))

(declare-fun res!84654 () Bool)

(assert (=> d!53897 (=> (not res!84654) (not e!117800))))

(assert (=> d!53897 (= res!84654 (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> d!53897 (= lt!88253 e!117805)))

(assert (=> d!53897 (= c!32049 (and (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53897 (validMask!0 (mask!8640 thiss!1248))))

(assert (=> d!53897 (= (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) lt!88249)))

(declare-fun b!178774 () Bool)

(declare-fun get!2035 (ValueCell!1748 V!5225) V!5225)

(declare-fun dynLambda!479 (Int (_ BitVec 64)) V!5225)

(assert (=> b!178774 (= e!117806 (= (apply!145 lt!88249 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)) (get!2035 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178774 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3865 (_values!3656 thiss!1248))))))

(assert (=> b!178774 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun b!178775 () Bool)

(assert (=> b!178775 (= e!117797 call!18058)))

(declare-fun b!178776 () Bool)

(assert (=> b!178776 (= e!117802 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178777 () Bool)

(declare-fun lt!88244 () Unit!5425)

(assert (=> b!178777 (= e!117795 lt!88244)))

(declare-fun lt!88238 () ListLongMap!2221)

(assert (=> b!178777 (= lt!88238 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88236 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88248 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88248 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88243 () Unit!5425)

(declare-fun addStillContains!121 (ListLongMap!2221 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5425)

(assert (=> b!178777 (= lt!88243 (addStillContains!121 lt!88238 lt!88236 (zeroValue!3514 thiss!1248) lt!88248))))

(assert (=> b!178777 (contains!1203 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))) lt!88248)))

(declare-fun lt!88245 () Unit!5425)

(assert (=> b!178777 (= lt!88245 lt!88243)))

(declare-fun lt!88246 () ListLongMap!2221)

(assert (=> b!178777 (= lt!88246 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88240 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88240 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88254 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88254 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88251 () Unit!5425)

(declare-fun addApplyDifferent!121 (ListLongMap!2221 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5425)

(assert (=> b!178777 (= lt!88251 (addApplyDifferent!121 lt!88246 lt!88240 (minValue!3514 thiss!1248) lt!88254))))

(assert (=> b!178777 (= (apply!145 (+!257 lt!88246 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))) lt!88254) (apply!145 lt!88246 lt!88254))))

(declare-fun lt!88241 () Unit!5425)

(assert (=> b!178777 (= lt!88241 lt!88251)))

(declare-fun lt!88250 () ListLongMap!2221)

(assert (=> b!178777 (= lt!88250 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88255 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88256 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88256 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88237 () Unit!5425)

(assert (=> b!178777 (= lt!88237 (addApplyDifferent!121 lt!88250 lt!88255 (zeroValue!3514 thiss!1248) lt!88256))))

(assert (=> b!178777 (= (apply!145 (+!257 lt!88250 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))) lt!88256) (apply!145 lt!88250 lt!88256))))

(declare-fun lt!88247 () Unit!5425)

(assert (=> b!178777 (= lt!88247 lt!88237)))

(declare-fun lt!88239 () ListLongMap!2221)

(assert (=> b!178777 (= lt!88239 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88235 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88235 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88252 () (_ BitVec 64))

(assert (=> b!178777 (= lt!88252 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178777 (= lt!88244 (addApplyDifferent!121 lt!88239 lt!88235 (minValue!3514 thiss!1248) lt!88252))))

(assert (=> b!178777 (= (apply!145 (+!257 lt!88239 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))) lt!88252) (apply!145 lt!88239 lt!88252))))

(assert (= (and d!53897 c!32049) b!178772))

(assert (= (and d!53897 (not c!32049)) b!178767))

(assert (= (and b!178767 c!32047) b!178775))

(assert (= (and b!178767 (not c!32047)) b!178758))

(assert (= (and b!178758 c!32050) b!178768))

(assert (= (and b!178758 (not c!32050)) b!178769))

(assert (= (or b!178768 b!178769) bm!18057))

(assert (= (or b!178775 bm!18057) bm!18055))

(assert (= (or b!178775 b!178768) bm!18056))

(assert (= (or b!178772 bm!18055) bm!18052))

(assert (= (or b!178772 bm!18056) bm!18053))

(assert (= (and d!53897 res!84654) b!178763))

(assert (= (and d!53897 c!32046) b!178777))

(assert (= (and d!53897 (not c!32046)) b!178766))

(assert (= (and d!53897 res!84653) b!178761))

(assert (= (and b!178761 res!84651) b!178776))

(assert (= (and b!178761 (not res!84649)) b!178773))

(assert (= (and b!178773 res!84647) b!178774))

(assert (= (and b!178761 res!84648) b!178759))

(assert (= (and b!178759 c!32051) b!178765))

(assert (= (and b!178759 (not c!32051)) b!178760))

(assert (= (and b!178765 res!84650) b!178771))

(assert (= (or b!178765 b!178760) bm!18054))

(assert (= (and b!178759 res!84646) b!178770))

(assert (= (and b!178770 c!32048) b!178762))

(assert (= (and b!178770 (not c!32048)) b!178757))

(assert (= (and b!178762 res!84652) b!178764))

(assert (= (or b!178762 b!178757) bm!18058))

(declare-fun b_lambda!7077 () Bool)

(assert (=> (not b_lambda!7077) (not b!178774)))

(declare-fun t!7102 () Bool)

(declare-fun tb!2793 () Bool)

(assert (=> (and b!178618 (= (defaultEntry!3673 thiss!1248) (defaultEntry!3673 thiss!1248)) t!7102) tb!2793))

(declare-fun result!4669 () Bool)

(assert (=> tb!2793 (= result!4669 tp_is_empty!4183)))

(assert (=> b!178774 t!7102))

(declare-fun b_and!10913 () Bool)

(assert (= b_and!10907 (and (=> t!7102 result!4669) b_and!10913)))

(declare-fun m!206595 () Bool)

(assert (=> b!178764 m!206595))

(declare-fun m!206597 () Bool)

(assert (=> b!178763 m!206597))

(assert (=> b!178763 m!206597))

(declare-fun m!206599 () Bool)

(assert (=> b!178763 m!206599))

(declare-fun m!206601 () Bool)

(assert (=> bm!18054 m!206601))

(declare-fun m!206603 () Bool)

(assert (=> bm!18052 m!206603))

(declare-fun m!206605 () Bool)

(assert (=> bm!18058 m!206605))

(declare-fun m!206607 () Bool)

(assert (=> bm!18053 m!206607))

(assert (=> d!53897 m!206531))

(assert (=> b!178776 m!206597))

(assert (=> b!178776 m!206597))

(assert (=> b!178776 m!206599))

(declare-fun m!206609 () Bool)

(assert (=> b!178772 m!206609))

(assert (=> b!178773 m!206597))

(assert (=> b!178773 m!206597))

(declare-fun m!206611 () Bool)

(assert (=> b!178773 m!206611))

(declare-fun m!206613 () Bool)

(assert (=> b!178774 m!206613))

(declare-fun m!206615 () Bool)

(assert (=> b!178774 m!206615))

(assert (=> b!178774 m!206597))

(assert (=> b!178774 m!206597))

(declare-fun m!206617 () Bool)

(assert (=> b!178774 m!206617))

(assert (=> b!178774 m!206615))

(assert (=> b!178774 m!206613))

(declare-fun m!206619 () Bool)

(assert (=> b!178774 m!206619))

(declare-fun m!206621 () Bool)

(assert (=> b!178771 m!206621))

(declare-fun m!206623 () Bool)

(assert (=> b!178777 m!206623))

(declare-fun m!206625 () Bool)

(assert (=> b!178777 m!206625))

(declare-fun m!206627 () Bool)

(assert (=> b!178777 m!206627))

(declare-fun m!206629 () Bool)

(assert (=> b!178777 m!206629))

(declare-fun m!206631 () Bool)

(assert (=> b!178777 m!206631))

(declare-fun m!206633 () Bool)

(assert (=> b!178777 m!206633))

(declare-fun m!206635 () Bool)

(assert (=> b!178777 m!206635))

(declare-fun m!206637 () Bool)

(assert (=> b!178777 m!206637))

(assert (=> b!178777 m!206631))

(declare-fun m!206639 () Bool)

(assert (=> b!178777 m!206639))

(declare-fun m!206641 () Bool)

(assert (=> b!178777 m!206641))

(declare-fun m!206643 () Bool)

(assert (=> b!178777 m!206643))

(declare-fun m!206645 () Bool)

(assert (=> b!178777 m!206645))

(declare-fun m!206647 () Bool)

(assert (=> b!178777 m!206647))

(declare-fun m!206649 () Bool)

(assert (=> b!178777 m!206649))

(declare-fun m!206651 () Bool)

(assert (=> b!178777 m!206651))

(assert (=> b!178777 m!206603))

(assert (=> b!178777 m!206649))

(assert (=> b!178777 m!206597))

(assert (=> b!178777 m!206645))

(assert (=> b!178777 m!206623))

(assert (=> b!178617 d!53897))

(declare-fun d!53899 () Bool)

(assert (=> d!53899 (= (validMask!0 (mask!8640 thiss!1248)) (and (or (= (mask!8640 thiss!1248) #b00000000000000000000000000000111) (= (mask!8640 thiss!1248) #b00000000000000000000000000001111) (= (mask!8640 thiss!1248) #b00000000000000000000000000011111) (= (mask!8640 thiss!1248) #b00000000000000000000000000111111) (= (mask!8640 thiss!1248) #b00000000000000000000000001111111) (= (mask!8640 thiss!1248) #b00000000000000000000000011111111) (= (mask!8640 thiss!1248) #b00000000000000000000000111111111) (= (mask!8640 thiss!1248) #b00000000000000000000001111111111) (= (mask!8640 thiss!1248) #b00000000000000000000011111111111) (= (mask!8640 thiss!1248) #b00000000000000000000111111111111) (= (mask!8640 thiss!1248) #b00000000000000000001111111111111) (= (mask!8640 thiss!1248) #b00000000000000000011111111111111) (= (mask!8640 thiss!1248) #b00000000000000000111111111111111) (= (mask!8640 thiss!1248) #b00000000000000001111111111111111) (= (mask!8640 thiss!1248) #b00000000000000011111111111111111) (= (mask!8640 thiss!1248) #b00000000000000111111111111111111) (= (mask!8640 thiss!1248) #b00000000000001111111111111111111) (= (mask!8640 thiss!1248) #b00000000000011111111111111111111) (= (mask!8640 thiss!1248) #b00000000000111111111111111111111) (= (mask!8640 thiss!1248) #b00000000001111111111111111111111) (= (mask!8640 thiss!1248) #b00000000011111111111111111111111) (= (mask!8640 thiss!1248) #b00000000111111111111111111111111) (= (mask!8640 thiss!1248) #b00000001111111111111111111111111) (= (mask!8640 thiss!1248) #b00000011111111111111111111111111) (= (mask!8640 thiss!1248) #b00000111111111111111111111111111) (= (mask!8640 thiss!1248) #b00001111111111111111111111111111) (= (mask!8640 thiss!1248) #b00011111111111111111111111111111) (= (mask!8640 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8640 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178619 d!53899))

(declare-fun condMapEmpty!7164 () Bool)

(declare-fun mapDefault!7164 () ValueCell!1748)

(assert (=> mapNonEmpty!7155 (= condMapEmpty!7164 (= mapRest!7155 ((as const (Array (_ BitVec 32) ValueCell!1748)) mapDefault!7164)))))

(declare-fun e!117813 () Bool)

(declare-fun mapRes!7164 () Bool)

(assert (=> mapNonEmpty!7155 (= tp!15951 (and e!117813 mapRes!7164))))

(declare-fun mapNonEmpty!7164 () Bool)

(declare-fun tp!15966 () Bool)

(declare-fun e!117812 () Bool)

(assert (=> mapNonEmpty!7164 (= mapRes!7164 (and tp!15966 e!117812))))

(declare-fun mapKey!7164 () (_ BitVec 32))

(declare-fun mapRest!7164 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapValue!7164 () ValueCell!1748)

(assert (=> mapNonEmpty!7164 (= mapRest!7155 (store mapRest!7164 mapKey!7164 mapValue!7164))))

(declare-fun mapIsEmpty!7164 () Bool)

(assert (=> mapIsEmpty!7164 mapRes!7164))

(declare-fun b!178787 () Bool)

(assert (=> b!178787 (= e!117813 tp_is_empty!4183)))

(declare-fun b!178786 () Bool)

(assert (=> b!178786 (= e!117812 tp_is_empty!4183)))

(assert (= (and mapNonEmpty!7155 condMapEmpty!7164) mapIsEmpty!7164))

(assert (= (and mapNonEmpty!7155 (not condMapEmpty!7164)) mapNonEmpty!7164))

(assert (= (and mapNonEmpty!7164 ((_ is ValueCellFull!1748) mapValue!7164)) b!178786))

(assert (= (and mapNonEmpty!7155 ((_ is ValueCellFull!1748) mapDefault!7164)) b!178787))

(declare-fun m!206653 () Bool)

(assert (=> mapNonEmpty!7164 m!206653))

(declare-fun b_lambda!7079 () Bool)

(assert (= b_lambda!7077 (or (and b!178618 b_free!4411) b_lambda!7079)))

(check-sat (not b!178714) (not b!178686) (not b!178771) (not b!178701) (not b!178776) (not b!178777) (not bm!18052) (not bm!18054) (not b!178712) (not b!178773) (not b!178685) b_and!10913 (not b!178687) (not d!53887) (not b!178772) (not d!53893) (not b!178763) (not bm!18058) (not mapNonEmpty!7164) (not bm!18053) tp_is_empty!4183 (not d!53897) (not d!53895) (not b!178764) (not b!178774) (not b_next!4411) (not b_lambda!7079))
(check-sat b_and!10913 (not b_next!4411))
(get-model)

(declare-fun d!53901 () Bool)

(declare-fun e!117816 () Bool)

(assert (=> d!53901 e!117816))

(declare-fun res!84660 () Bool)

(assert (=> d!53901 (=> (not res!84660) (not e!117816))))

(declare-fun lt!88266 () ListLongMap!2221)

(assert (=> d!53901 (= res!84660 (contains!1203 lt!88266 (_1!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun lt!88265 () List!2267)

(assert (=> d!53901 (= lt!88266 (ListLongMap!2222 lt!88265))))

(declare-fun lt!88267 () Unit!5425)

(declare-fun lt!88268 () Unit!5425)

(assert (=> d!53901 (= lt!88267 lt!88268)))

(assert (=> d!53901 (= (getValueByKey!198 lt!88265 (_1!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!107 (List!2267 (_ BitVec 64) V!5225) Unit!5425)

(assert (=> d!53901 (= lt!88268 (lemmaContainsTupThenGetReturnValue!107 lt!88265 (_1!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun insertStrictlySorted!110 (List!2267 (_ BitVec 64) V!5225) List!2267)

(assert (=> d!53901 (= lt!88265 (insertStrictlySorted!110 (toList!1126 call!18059) (_1!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(assert (=> d!53901 (= (+!257 call!18059 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))) lt!88266)))

(declare-fun b!178792 () Bool)

(declare-fun res!84659 () Bool)

(assert (=> b!178792 (=> (not res!84659) (not e!117816))))

(assert (=> b!178792 (= res!84659 (= (getValueByKey!198 (toList!1126 lt!88266) (_1!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(declare-fun b!178793 () Bool)

(declare-fun contains!1206 (List!2267 tuple2!3302) Bool)

(assert (=> b!178793 (= e!117816 (contains!1206 (toList!1126 lt!88266) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))

(assert (= (and d!53901 res!84660) b!178792))

(assert (= (and b!178792 res!84659) b!178793))

(declare-fun m!206655 () Bool)

(assert (=> d!53901 m!206655))

(declare-fun m!206657 () Bool)

(assert (=> d!53901 m!206657))

(declare-fun m!206659 () Bool)

(assert (=> d!53901 m!206659))

(declare-fun m!206661 () Bool)

(assert (=> d!53901 m!206661))

(declare-fun m!206663 () Bool)

(assert (=> b!178792 m!206663))

(declare-fun m!206665 () Bool)

(assert (=> b!178793 m!206665))

(assert (=> b!178772 d!53901))

(declare-fun d!53903 () Bool)

(declare-fun get!2036 (Option!204) V!5225)

(assert (=> d!53903 (= (apply!145 lt!88249 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)) (get!2036 (getValueByKey!198 (toList!1126 lt!88249) (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7313 () Bool)

(assert (= bs!7313 d!53903))

(assert (=> bs!7313 m!206597))

(declare-fun m!206667 () Bool)

(assert (=> bs!7313 m!206667))

(assert (=> bs!7313 m!206667))

(declare-fun m!206669 () Bool)

(assert (=> bs!7313 m!206669))

(assert (=> b!178774 d!53903))

(declare-fun d!53905 () Bool)

(declare-fun c!32054 () Bool)

(assert (=> d!53905 (= c!32054 ((_ is ValueCellFull!1748) (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117819 () V!5225)

(assert (=> d!53905 (= (get!2035 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117819)))

(declare-fun b!178798 () Bool)

(declare-fun get!2037 (ValueCell!1748 V!5225) V!5225)

(assert (=> b!178798 (= e!117819 (get!2037 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178799 () Bool)

(declare-fun get!2038 (ValueCell!1748 V!5225) V!5225)

(assert (=> b!178799 (= e!117819 (get!2038 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53905 c!32054) b!178798))

(assert (= (and d!53905 (not c!32054)) b!178799))

(assert (=> b!178798 m!206615))

(assert (=> b!178798 m!206613))

(declare-fun m!206671 () Bool)

(assert (=> b!178798 m!206671))

(assert (=> b!178799 m!206615))

(assert (=> b!178799 m!206613))

(declare-fun m!206673 () Bool)

(assert (=> b!178799 m!206673))

(assert (=> b!178774 d!53905))

(declare-fun b!178824 () Bool)

(declare-fun res!84669 () Bool)

(declare-fun e!117834 () Bool)

(assert (=> b!178824 (=> (not res!84669) (not e!117834))))

(declare-fun lt!88285 () ListLongMap!2221)

(assert (=> b!178824 (= res!84669 (not (contains!1203 lt!88285 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178825 () Bool)

(declare-fun e!117840 () Bool)

(assert (=> b!178825 (= e!117840 (= lt!88285 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3673 thiss!1248))))))

(declare-fun bm!18061 () Bool)

(declare-fun call!18064 () ListLongMap!2221)

(assert (=> bm!18061 (= call!18064 (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3673 thiss!1248)))))

(declare-fun b!178826 () Bool)

(declare-fun e!117839 () Bool)

(assert (=> b!178826 (= e!117834 e!117839)))

(declare-fun c!32066 () Bool)

(declare-fun e!117836 () Bool)

(assert (=> b!178826 (= c!32066 e!117836)))

(declare-fun res!84671 () Bool)

(assert (=> b!178826 (=> (not res!84671) (not e!117836))))

(assert (=> b!178826 (= res!84671 (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun b!178827 () Bool)

(declare-fun e!117835 () ListLongMap!2221)

(declare-fun e!117838 () ListLongMap!2221)

(assert (=> b!178827 (= e!117835 e!117838)))

(declare-fun c!32065 () Bool)

(assert (=> b!178827 (= c!32065 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178828 () Bool)

(assert (=> b!178828 (= e!117838 call!18064)))

(declare-fun d!53907 () Bool)

(assert (=> d!53907 e!117834))

(declare-fun res!84672 () Bool)

(assert (=> d!53907 (=> (not res!84672) (not e!117834))))

(assert (=> d!53907 (= res!84672 (not (contains!1203 lt!88285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53907 (= lt!88285 e!117835)))

(declare-fun c!32063 () Bool)

(assert (=> d!53907 (= c!32063 (bvsge #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> d!53907 (validMask!0 (mask!8640 thiss!1248))))

(assert (=> d!53907 (= (getCurrentListMapNoExtraKeys!166 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) lt!88285)))

(declare-fun b!178829 () Bool)

(assert (=> b!178829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> b!178829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3865 (_values!3656 thiss!1248))))))

(declare-fun e!117837 () Bool)

(assert (=> b!178829 (= e!117837 (= (apply!145 lt!88285 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)) (get!2035 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!178830 () Bool)

(assert (=> b!178830 (= e!117839 e!117840)))

(declare-fun c!32064 () Bool)

(assert (=> b!178830 (= c!32064 (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun b!178831 () Bool)

(declare-fun lt!88287 () Unit!5425)

(declare-fun lt!88289 () Unit!5425)

(assert (=> b!178831 (= lt!88287 lt!88289)))

(declare-fun lt!88284 () (_ BitVec 64))

(declare-fun lt!88288 () (_ BitVec 64))

(declare-fun lt!88283 () V!5225)

(declare-fun lt!88286 () ListLongMap!2221)

(assert (=> b!178831 (not (contains!1203 (+!257 lt!88286 (tuple2!3303 lt!88284 lt!88283)) lt!88288))))

(declare-fun addStillNotContains!81 (ListLongMap!2221 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5425)

(assert (=> b!178831 (= lt!88289 (addStillNotContains!81 lt!88286 lt!88284 lt!88283 lt!88288))))

(assert (=> b!178831 (= lt!88288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!178831 (= lt!88283 (get!2035 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178831 (= lt!88284 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178831 (= lt!88286 call!18064)))

(assert (=> b!178831 (= e!117838 (+!257 call!18064 (tuple2!3303 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000) (get!2035 (select (arr!3557 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!178832 () Bool)

(declare-fun isEmpty!457 (ListLongMap!2221) Bool)

(assert (=> b!178832 (= e!117840 (isEmpty!457 lt!88285))))

(declare-fun b!178833 () Bool)

(assert (=> b!178833 (= e!117835 (ListLongMap!2222 Nil!2264))))

(declare-fun b!178834 () Bool)

(assert (=> b!178834 (= e!117839 e!117837)))

(assert (=> b!178834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun res!84670 () Bool)

(assert (=> b!178834 (= res!84670 (contains!1203 lt!88285 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178834 (=> (not res!84670) (not e!117837))))

(declare-fun b!178835 () Bool)

(assert (=> b!178835 (= e!117836 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178835 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!53907 c!32063) b!178833))

(assert (= (and d!53907 (not c!32063)) b!178827))

(assert (= (and b!178827 c!32065) b!178831))

(assert (= (and b!178827 (not c!32065)) b!178828))

(assert (= (or b!178831 b!178828) bm!18061))

(assert (= (and d!53907 res!84672) b!178824))

(assert (= (and b!178824 res!84669) b!178826))

(assert (= (and b!178826 res!84671) b!178835))

(assert (= (and b!178826 c!32066) b!178834))

(assert (= (and b!178826 (not c!32066)) b!178830))

(assert (= (and b!178834 res!84670) b!178829))

(assert (= (and b!178830 c!32064) b!178825))

(assert (= (and b!178830 (not c!32064)) b!178832))

(declare-fun b_lambda!7081 () Bool)

(assert (=> (not b_lambda!7081) (not b!178829)))

(assert (=> b!178829 t!7102))

(declare-fun b_and!10915 () Bool)

(assert (= b_and!10913 (and (=> t!7102 result!4669) b_and!10915)))

(declare-fun b_lambda!7083 () Bool)

(assert (=> (not b_lambda!7083) (not b!178831)))

(assert (=> b!178831 t!7102))

(declare-fun b_and!10917 () Bool)

(assert (= b_and!10915 (and (=> t!7102 result!4669) b_and!10917)))

(assert (=> b!178831 m!206613))

(assert (=> b!178831 m!206597))

(declare-fun m!206675 () Bool)

(assert (=> b!178831 m!206675))

(declare-fun m!206677 () Bool)

(assert (=> b!178831 m!206677))

(declare-fun m!206679 () Bool)

(assert (=> b!178831 m!206679))

(assert (=> b!178831 m!206615))

(assert (=> b!178831 m!206675))

(declare-fun m!206681 () Bool)

(assert (=> b!178831 m!206681))

(assert (=> b!178831 m!206615))

(assert (=> b!178831 m!206613))

(assert (=> b!178831 m!206619))

(declare-fun m!206683 () Bool)

(assert (=> b!178824 m!206683))

(assert (=> b!178834 m!206597))

(assert (=> b!178834 m!206597))

(declare-fun m!206685 () Bool)

(assert (=> b!178834 m!206685))

(assert (=> b!178829 m!206613))

(assert (=> b!178829 m!206597))

(assert (=> b!178829 m!206615))

(assert (=> b!178829 m!206597))

(declare-fun m!206687 () Bool)

(assert (=> b!178829 m!206687))

(assert (=> b!178829 m!206615))

(assert (=> b!178829 m!206613))

(assert (=> b!178829 m!206619))

(declare-fun m!206689 () Bool)

(assert (=> bm!18061 m!206689))

(assert (=> b!178827 m!206597))

(assert (=> b!178827 m!206597))

(assert (=> b!178827 m!206599))

(assert (=> b!178835 m!206597))

(assert (=> b!178835 m!206597))

(assert (=> b!178835 m!206599))

(declare-fun m!206691 () Bool)

(assert (=> b!178832 m!206691))

(assert (=> b!178825 m!206689))

(declare-fun m!206693 () Bool)

(assert (=> d!53907 m!206693))

(assert (=> d!53907 m!206531))

(assert (=> bm!18052 d!53907))

(declare-fun d!53909 () Bool)

(declare-fun e!117842 () Bool)

(assert (=> d!53909 e!117842))

(declare-fun res!84673 () Bool)

(assert (=> d!53909 (=> res!84673 e!117842)))

(declare-fun lt!88291 () Bool)

(assert (=> d!53909 (= res!84673 (not lt!88291))))

(declare-fun lt!88292 () Bool)

(assert (=> d!53909 (= lt!88291 lt!88292)))

(declare-fun lt!88290 () Unit!5425)

(declare-fun e!117841 () Unit!5425)

(assert (=> d!53909 (= lt!88290 e!117841)))

(declare-fun c!32067 () Bool)

(assert (=> d!53909 (= c!32067 lt!88292)))

(assert (=> d!53909 (= lt!88292 (containsKey!202 (toList!1126 lt!88249) (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53909 (= (contains!1203 lt!88249 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)) lt!88291)))

(declare-fun b!178836 () Bool)

(declare-fun lt!88293 () Unit!5425)

(assert (=> b!178836 (= e!117841 lt!88293)))

(assert (=> b!178836 (= lt!88293 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1126 lt!88249) (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178836 (isDefined!152 (getValueByKey!198 (toList!1126 lt!88249) (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178837 () Bool)

(declare-fun Unit!5429 () Unit!5425)

(assert (=> b!178837 (= e!117841 Unit!5429)))

(declare-fun b!178838 () Bool)

(assert (=> b!178838 (= e!117842 (isDefined!152 (getValueByKey!198 (toList!1126 lt!88249) (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53909 c!32067) b!178836))

(assert (= (and d!53909 (not c!32067)) b!178837))

(assert (= (and d!53909 (not res!84673)) b!178838))

(assert (=> d!53909 m!206597))

(declare-fun m!206695 () Bool)

(assert (=> d!53909 m!206695))

(assert (=> b!178836 m!206597))

(declare-fun m!206697 () Bool)

(assert (=> b!178836 m!206697))

(assert (=> b!178836 m!206597))

(assert (=> b!178836 m!206667))

(assert (=> b!178836 m!206667))

(declare-fun m!206699 () Bool)

(assert (=> b!178836 m!206699))

(assert (=> b!178838 m!206597))

(assert (=> b!178838 m!206667))

(assert (=> b!178838 m!206667))

(assert (=> b!178838 m!206699))

(assert (=> b!178773 d!53909))

(declare-fun d!53911 () Bool)

(assert (=> d!53911 (= (apply!145 lt!88249 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2036 (getValueByKey!198 (toList!1126 lt!88249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7314 () Bool)

(assert (= bs!7314 d!53911))

(declare-fun m!206701 () Bool)

(assert (=> bs!7314 m!206701))

(assert (=> bs!7314 m!206701))

(declare-fun m!206703 () Bool)

(assert (=> bs!7314 m!206703))

(assert (=> b!178764 d!53911))

(declare-fun b!178847 () Bool)

(declare-fun e!117851 () Bool)

(declare-fun call!18067 () Bool)

(assert (=> b!178847 (= e!117851 call!18067)))

(declare-fun b!178848 () Bool)

(declare-fun e!117850 () Bool)

(assert (=> b!178848 (= e!117851 e!117850)))

(declare-fun lt!88302 () (_ BitVec 64))

(assert (=> b!178848 (= lt!88302 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88301 () Unit!5425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7507 (_ BitVec 64) (_ BitVec 32)) Unit!5425)

(assert (=> b!178848 (= lt!88301 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5553 thiss!1248) lt!88302 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!178848 (arrayContainsKey!0 (_keys!5553 thiss!1248) lt!88302 #b00000000000000000000000000000000)))

(declare-fun lt!88300 () Unit!5425)

(assert (=> b!178848 (= lt!88300 lt!88301)))

(declare-fun res!84678 () Bool)

(assert (=> b!178848 (= res!84678 (= (seekEntryOrOpen!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000) (_keys!5553 thiss!1248) (mask!8640 thiss!1248)) (Found!585 #b00000000000000000000000000000000)))))

(assert (=> b!178848 (=> (not res!84678) (not e!117850))))

(declare-fun b!178849 () Bool)

(declare-fun e!117849 () Bool)

(assert (=> b!178849 (= e!117849 e!117851)))

(declare-fun c!32070 () Bool)

(assert (=> b!178849 (= c!32070 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178850 () Bool)

(assert (=> b!178850 (= e!117850 call!18067)))

(declare-fun d!53913 () Bool)

(declare-fun res!84679 () Bool)

(assert (=> d!53913 (=> res!84679 e!117849)))

(assert (=> d!53913 (= res!84679 (bvsge #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> d!53913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)) e!117849)))

(declare-fun bm!18064 () Bool)

(assert (=> bm!18064 (= call!18067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5553 thiss!1248) (mask!8640 thiss!1248)))))

(assert (= (and d!53913 (not res!84679)) b!178849))

(assert (= (and b!178849 c!32070) b!178848))

(assert (= (and b!178849 (not c!32070)) b!178847))

(assert (= (and b!178848 res!84678) b!178850))

(assert (= (or b!178850 b!178847) bm!18064))

(assert (=> b!178848 m!206597))

(declare-fun m!206705 () Bool)

(assert (=> b!178848 m!206705))

(declare-fun m!206707 () Bool)

(assert (=> b!178848 m!206707))

(assert (=> b!178848 m!206597))

(declare-fun m!206709 () Bool)

(assert (=> b!178848 m!206709))

(assert (=> b!178849 m!206597))

(assert (=> b!178849 m!206597))

(assert (=> b!178849 m!206599))

(declare-fun m!206711 () Bool)

(assert (=> bm!18064 m!206711))

(assert (=> b!178686 d!53913))

(declare-fun b!178869 () Bool)

(declare-fun e!117864 () Bool)

(declare-fun lt!88307 () SeekEntryResult!585)

(assert (=> b!178869 (= e!117864 (bvsge (x!19578 lt!88307) #b01111111111111111111111111111110))))

(declare-fun b!178870 () Bool)

(assert (=> b!178870 (and (bvsge (index!4510 lt!88307) #b00000000000000000000000000000000) (bvslt (index!4510 lt!88307) (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun e!117863 () Bool)

(assert (=> b!178870 (= e!117863 (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4510 lt!88307)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178871 () Bool)

(assert (=> b!178871 (and (bvsge (index!4510 lt!88307) #b00000000000000000000000000000000) (bvslt (index!4510 lt!88307) (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun res!84687 () Bool)

(assert (=> b!178871 (= res!84687 (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4510 lt!88307)) key!828))))

(assert (=> b!178871 (=> res!84687 e!117863)))

(declare-fun e!117866 () Bool)

(assert (=> b!178871 (= e!117866 e!117863)))

(declare-fun b!178872 () Bool)

(assert (=> b!178872 (and (bvsge (index!4510 lt!88307) #b00000000000000000000000000000000) (bvslt (index!4510 lt!88307) (size!3864 (_keys!5553 thiss!1248))))))

(declare-fun res!84688 () Bool)

(assert (=> b!178872 (= res!84688 (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4510 lt!88307)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178872 (=> res!84688 e!117863)))

(declare-fun b!178873 () Bool)

(declare-fun e!117862 () SeekEntryResult!585)

(declare-fun e!117865 () SeekEntryResult!585)

(assert (=> b!178873 (= e!117862 e!117865)))

(declare-fun c!32077 () Bool)

(declare-fun lt!88308 () (_ BitVec 64))

(assert (=> b!178873 (= c!32077 (or (= lt!88308 key!828) (= (bvadd lt!88308 lt!88308) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178874 () Bool)

(assert (=> b!178874 (= e!117865 (Intermediate!585 false (toIndex!0 key!828 (mask!8640 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178876 () Bool)

(assert (=> b!178876 (= e!117862 (Intermediate!585 true (toIndex!0 key!828 (mask!8640 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178877 () Bool)

(assert (=> b!178877 (= e!117864 e!117866)))

(declare-fun res!84686 () Bool)

(assert (=> b!178877 (= res!84686 (and ((_ is Intermediate!585) lt!88307) (not (undefined!1397 lt!88307)) (bvslt (x!19578 lt!88307) #b01111111111111111111111111111110) (bvsge (x!19578 lt!88307) #b00000000000000000000000000000000) (bvsge (x!19578 lt!88307) #b00000000000000000000000000000000)))))

(assert (=> b!178877 (=> (not res!84686) (not e!117866))))

(declare-fun d!53915 () Bool)

(assert (=> d!53915 e!117864))

(declare-fun c!32079 () Bool)

(assert (=> d!53915 (= c!32079 (and ((_ is Intermediate!585) lt!88307) (undefined!1397 lt!88307)))))

(assert (=> d!53915 (= lt!88307 e!117862)))

(declare-fun c!32078 () Bool)

(assert (=> d!53915 (= c!32078 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53915 (= lt!88308 (select (arr!3556 (_keys!5553 thiss!1248)) (toIndex!0 key!828 (mask!8640 thiss!1248))))))

(assert (=> d!53915 (validMask!0 (mask!8640 thiss!1248))))

(assert (=> d!53915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8640 thiss!1248)) key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)) lt!88307)))

(declare-fun b!178875 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178875 (= e!117865 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8640 thiss!1248)) #b00000000000000000000000000000000 (mask!8640 thiss!1248)) key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)))))

(assert (= (and d!53915 c!32078) b!178876))

(assert (= (and d!53915 (not c!32078)) b!178873))

(assert (= (and b!178873 c!32077) b!178874))

(assert (= (and b!178873 (not c!32077)) b!178875))

(assert (= (and d!53915 c!32079) b!178869))

(assert (= (and d!53915 (not c!32079)) b!178877))

(assert (= (and b!178877 res!84686) b!178871))

(assert (= (and b!178871 (not res!84687)) b!178872))

(assert (= (and b!178872 (not res!84688)) b!178870))

(declare-fun m!206713 () Bool)

(assert (=> b!178870 m!206713))

(assert (=> b!178872 m!206713))

(assert (=> b!178875 m!206575))

(declare-fun m!206715 () Bool)

(assert (=> b!178875 m!206715))

(assert (=> b!178875 m!206715))

(declare-fun m!206717 () Bool)

(assert (=> b!178875 m!206717))

(assert (=> d!53915 m!206575))

(declare-fun m!206719 () Bool)

(assert (=> d!53915 m!206719))

(assert (=> d!53915 m!206531))

(assert (=> b!178871 m!206713))

(assert (=> d!53893 d!53915))

(declare-fun d!53917 () Bool)

(declare-fun lt!88314 () (_ BitVec 32))

(declare-fun lt!88313 () (_ BitVec 32))

(assert (=> d!53917 (= lt!88314 (bvmul (bvxor lt!88313 (bvlshr lt!88313 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53917 (= lt!88313 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53917 (and (bvsge (mask!8640 thiss!1248) #b00000000000000000000000000000000) (let ((res!84689 (let ((h!2891 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19596 (bvmul (bvxor h!2891 (bvlshr h!2891 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19596 (bvlshr x!19596 #b00000000000000000000000000001101)) (mask!8640 thiss!1248)))))) (and (bvslt res!84689 (bvadd (mask!8640 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84689 #b00000000000000000000000000000000))))))

(assert (=> d!53917 (= (toIndex!0 key!828 (mask!8640 thiss!1248)) (bvand (bvxor lt!88314 (bvlshr lt!88314 #b00000000000000000000000000001101)) (mask!8640 thiss!1248)))))

(assert (=> d!53893 d!53917))

(assert (=> d!53893 d!53899))

(declare-fun d!53919 () Bool)

(assert (=> d!53919 (= (apply!145 lt!88249 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2036 (getValueByKey!198 (toList!1126 lt!88249) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7315 () Bool)

(assert (= bs!7315 d!53919))

(declare-fun m!206721 () Bool)

(assert (=> bs!7315 m!206721))

(assert (=> bs!7315 m!206721))

(declare-fun m!206723 () Bool)

(assert (=> bs!7315 m!206723))

(assert (=> b!178771 d!53919))

(declare-fun d!53921 () Bool)

(declare-fun e!117868 () Bool)

(assert (=> d!53921 e!117868))

(declare-fun res!84690 () Bool)

(assert (=> d!53921 (=> res!84690 e!117868)))

(declare-fun lt!88316 () Bool)

(assert (=> d!53921 (= res!84690 (not lt!88316))))

(declare-fun lt!88317 () Bool)

(assert (=> d!53921 (= lt!88316 lt!88317)))

(declare-fun lt!88315 () Unit!5425)

(declare-fun e!117867 () Unit!5425)

(assert (=> d!53921 (= lt!88315 e!117867)))

(declare-fun c!32080 () Bool)

(assert (=> d!53921 (= c!32080 lt!88317)))

(assert (=> d!53921 (= lt!88317 (containsKey!202 (toList!1126 lt!88249) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53921 (= (contains!1203 lt!88249 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88316)))

(declare-fun b!178878 () Bool)

(declare-fun lt!88318 () Unit!5425)

(assert (=> b!178878 (= e!117867 lt!88318)))

(assert (=> b!178878 (= lt!88318 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1126 lt!88249) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178878 (isDefined!152 (getValueByKey!198 (toList!1126 lt!88249) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178879 () Bool)

(declare-fun Unit!5430 () Unit!5425)

(assert (=> b!178879 (= e!117867 Unit!5430)))

(declare-fun b!178880 () Bool)

(assert (=> b!178880 (= e!117868 (isDefined!152 (getValueByKey!198 (toList!1126 lt!88249) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53921 c!32080) b!178878))

(assert (= (and d!53921 (not c!32080)) b!178879))

(assert (= (and d!53921 (not res!84690)) b!178880))

(declare-fun m!206725 () Bool)

(assert (=> d!53921 m!206725))

(declare-fun m!206727 () Bool)

(assert (=> b!178878 m!206727))

(assert (=> b!178878 m!206721))

(assert (=> b!178878 m!206721))

(declare-fun m!206729 () Bool)

(assert (=> b!178878 m!206729))

(assert (=> b!178880 m!206721))

(assert (=> b!178880 m!206721))

(assert (=> b!178880 m!206729))

(assert (=> bm!18054 d!53921))

(declare-fun b!178891 () Bool)

(declare-fun e!117880 () Bool)

(declare-fun call!18070 () Bool)

(assert (=> b!178891 (= e!117880 call!18070)))

(declare-fun bm!18067 () Bool)

(declare-fun c!32083 () Bool)

(assert (=> bm!18067 (= call!18070 (arrayNoDuplicates!0 (_keys!5553 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32083 (Cons!2266 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000) Nil!2267) Nil!2267)))))

(declare-fun b!178893 () Bool)

(declare-fun e!117877 () Bool)

(assert (=> b!178893 (= e!117877 e!117880)))

(assert (=> b!178893 (= c!32083 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178894 () Bool)

(declare-fun e!117879 () Bool)

(assert (=> b!178894 (= e!117879 e!117877)))

(declare-fun res!84698 () Bool)

(assert (=> b!178894 (=> (not res!84698) (not e!117877))))

(declare-fun e!117878 () Bool)

(assert (=> b!178894 (= res!84698 (not e!117878))))

(declare-fun res!84699 () Bool)

(assert (=> b!178894 (=> (not res!84699) (not e!117878))))

(assert (=> b!178894 (= res!84699 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178895 () Bool)

(declare-fun contains!1207 (List!2270 (_ BitVec 64)) Bool)

(assert (=> b!178895 (= e!117878 (contains!1207 Nil!2267 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53923 () Bool)

(declare-fun res!84697 () Bool)

(assert (=> d!53923 (=> res!84697 e!117879)))

(assert (=> d!53923 (= res!84697 (bvsge #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> d!53923 (= (arrayNoDuplicates!0 (_keys!5553 thiss!1248) #b00000000000000000000000000000000 Nil!2267) e!117879)))

(declare-fun b!178892 () Bool)

(assert (=> b!178892 (= e!117880 call!18070)))

(assert (= (and d!53923 (not res!84697)) b!178894))

(assert (= (and b!178894 res!84699) b!178895))

(assert (= (and b!178894 res!84698) b!178893))

(assert (= (and b!178893 c!32083) b!178891))

(assert (= (and b!178893 (not c!32083)) b!178892))

(assert (= (or b!178891 b!178892) bm!18067))

(assert (=> bm!18067 m!206597))

(declare-fun m!206731 () Bool)

(assert (=> bm!18067 m!206731))

(assert (=> b!178893 m!206597))

(assert (=> b!178893 m!206597))

(assert (=> b!178893 m!206599))

(assert (=> b!178894 m!206597))

(assert (=> b!178894 m!206597))

(assert (=> b!178894 m!206599))

(assert (=> b!178895 m!206597))

(assert (=> b!178895 m!206597))

(declare-fun m!206733 () Bool)

(assert (=> b!178895 m!206733))

(assert (=> b!178687 d!53923))

(declare-fun d!53925 () Bool)

(declare-fun e!117882 () Bool)

(assert (=> d!53925 e!117882))

(declare-fun res!84700 () Bool)

(assert (=> d!53925 (=> res!84700 e!117882)))

(declare-fun lt!88320 () Bool)

(assert (=> d!53925 (= res!84700 (not lt!88320))))

(declare-fun lt!88321 () Bool)

(assert (=> d!53925 (= lt!88320 lt!88321)))

(declare-fun lt!88319 () Unit!5425)

(declare-fun e!117881 () Unit!5425)

(assert (=> d!53925 (= lt!88319 e!117881)))

(declare-fun c!32084 () Bool)

(assert (=> d!53925 (= c!32084 lt!88321)))

(assert (=> d!53925 (= lt!88321 (containsKey!202 (toList!1126 lt!88249) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53925 (= (contains!1203 lt!88249 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88320)))

(declare-fun b!178896 () Bool)

(declare-fun lt!88322 () Unit!5425)

(assert (=> b!178896 (= e!117881 lt!88322)))

(assert (=> b!178896 (= lt!88322 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1126 lt!88249) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178896 (isDefined!152 (getValueByKey!198 (toList!1126 lt!88249) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178897 () Bool)

(declare-fun Unit!5431 () Unit!5425)

(assert (=> b!178897 (= e!117881 Unit!5431)))

(declare-fun b!178898 () Bool)

(assert (=> b!178898 (= e!117882 (isDefined!152 (getValueByKey!198 (toList!1126 lt!88249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53925 c!32084) b!178896))

(assert (= (and d!53925 (not c!32084)) b!178897))

(assert (= (and d!53925 (not res!84700)) b!178898))

(declare-fun m!206735 () Bool)

(assert (=> d!53925 m!206735))

(declare-fun m!206737 () Bool)

(assert (=> b!178896 m!206737))

(assert (=> b!178896 m!206701))

(assert (=> b!178896 m!206701))

(declare-fun m!206739 () Bool)

(assert (=> b!178896 m!206739))

(assert (=> b!178898 m!206701))

(assert (=> b!178898 m!206701))

(assert (=> b!178898 m!206739))

(assert (=> bm!18058 d!53925))

(declare-fun d!53927 () Bool)

(assert (=> d!53927 (isDefined!152 (getValueByKey!198 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-fun lt!88325 () Unit!5425)

(declare-fun choose!962 (List!2267 (_ BitVec 64)) Unit!5425)

(assert (=> d!53927 (= lt!88325 (choose!962 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-fun e!117885 () Bool)

(assert (=> d!53927 e!117885))

(declare-fun res!84703 () Bool)

(assert (=> d!53927 (=> (not res!84703) (not e!117885))))

(declare-fun isStrictlySorted!335 (List!2267) Bool)

(assert (=> d!53927 (= res!84703 (isStrictlySorted!335 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))))

(assert (=> d!53927 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828) lt!88325)))

(declare-fun b!178901 () Bool)

(assert (=> b!178901 (= e!117885 (containsKey!202 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(assert (= (and d!53927 res!84703) b!178901))

(assert (=> d!53927 m!206591))

(assert (=> d!53927 m!206591))

(assert (=> d!53927 m!206593))

(declare-fun m!206741 () Bool)

(assert (=> d!53927 m!206741))

(declare-fun m!206743 () Bool)

(assert (=> d!53927 m!206743))

(assert (=> b!178901 m!206587))

(assert (=> b!178712 d!53927))

(declare-fun d!53929 () Bool)

(declare-fun isEmpty!458 (Option!204) Bool)

(assert (=> d!53929 (= (isDefined!152 (getValueByKey!198 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828)) (not (isEmpty!458 (getValueByKey!198 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))))

(declare-fun bs!7316 () Bool)

(assert (= bs!7316 d!53929))

(assert (=> bs!7316 m!206591))

(declare-fun m!206745 () Bool)

(assert (=> bs!7316 m!206745))

(assert (=> b!178712 d!53929))

(declare-fun b!178910 () Bool)

(declare-fun e!117890 () Option!204)

(assert (=> b!178910 (= e!117890 (Some!203 (_2!1662 (h!2887 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))))))

(declare-fun b!178913 () Bool)

(declare-fun e!117891 () Option!204)

(assert (=> b!178913 (= e!117891 None!202)))

(declare-fun b!178912 () Bool)

(assert (=> b!178912 (= e!117891 (getValueByKey!198 (t!7098 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) key!828))))

(declare-fun b!178911 () Bool)

(assert (=> b!178911 (= e!117890 e!117891)))

(declare-fun c!32090 () Bool)

(assert (=> b!178911 (= c!32090 (and ((_ is Cons!2263) (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (not (= (_1!1662 (h!2887 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828))))))

(declare-fun d!53931 () Bool)

(declare-fun c!32089 () Bool)

(assert (=> d!53931 (= c!32089 (and ((_ is Cons!2263) (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (= (_1!1662 (h!2887 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)))))

(assert (=> d!53931 (= (getValueByKey!198 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828) e!117890)))

(assert (= (and d!53931 c!32089) b!178910))

(assert (= (and d!53931 (not c!32089)) b!178911))

(assert (= (and b!178911 c!32090) b!178912))

(assert (= (and b!178911 (not c!32090)) b!178913))

(declare-fun m!206747 () Bool)

(assert (=> b!178912 m!206747))

(assert (=> b!178712 d!53931))

(declare-fun d!53933 () Bool)

(declare-fun e!117892 () Bool)

(assert (=> d!53933 e!117892))

(declare-fun res!84705 () Bool)

(assert (=> d!53933 (=> (not res!84705) (not e!117892))))

(declare-fun lt!88327 () ListLongMap!2221)

(assert (=> d!53933 (= res!84705 (contains!1203 lt!88327 (_1!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))))))

(declare-fun lt!88326 () List!2267)

(assert (=> d!53933 (= lt!88327 (ListLongMap!2222 lt!88326))))

(declare-fun lt!88328 () Unit!5425)

(declare-fun lt!88329 () Unit!5425)

(assert (=> d!53933 (= lt!88328 lt!88329)))

(assert (=> d!53933 (= (getValueByKey!198 lt!88326 (_1!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!53933 (= lt!88329 (lemmaContainsTupThenGetReturnValue!107 lt!88326 (_1!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!53933 (= lt!88326 (insertStrictlySorted!110 (toList!1126 lt!88250) (_1!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!53933 (= (+!257 lt!88250 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))) lt!88327)))

(declare-fun b!178914 () Bool)

(declare-fun res!84704 () Bool)

(assert (=> b!178914 (=> (not res!84704) (not e!117892))))

(assert (=> b!178914 (= res!84704 (= (getValueByKey!198 (toList!1126 lt!88327) (_1!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))))))))

(declare-fun b!178915 () Bool)

(assert (=> b!178915 (= e!117892 (contains!1206 (toList!1126 lt!88327) (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))))))

(assert (= (and d!53933 res!84705) b!178914))

(assert (= (and b!178914 res!84704) b!178915))

(declare-fun m!206749 () Bool)

(assert (=> d!53933 m!206749))

(declare-fun m!206751 () Bool)

(assert (=> d!53933 m!206751))

(declare-fun m!206753 () Bool)

(assert (=> d!53933 m!206753))

(declare-fun m!206755 () Bool)

(assert (=> d!53933 m!206755))

(declare-fun m!206757 () Bool)

(assert (=> b!178914 m!206757))

(declare-fun m!206759 () Bool)

(assert (=> b!178915 m!206759))

(assert (=> b!178777 d!53933))

(declare-fun d!53935 () Bool)

(assert (=> d!53935 (= (apply!145 (+!257 lt!88239 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))) lt!88252) (get!2036 (getValueByKey!198 (toList!1126 (+!257 lt!88239 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))) lt!88252)))))

(declare-fun bs!7317 () Bool)

(assert (= bs!7317 d!53935))

(declare-fun m!206761 () Bool)

(assert (=> bs!7317 m!206761))

(assert (=> bs!7317 m!206761))

(declare-fun m!206763 () Bool)

(assert (=> bs!7317 m!206763))

(assert (=> b!178777 d!53935))

(assert (=> b!178777 d!53907))

(declare-fun d!53937 () Bool)

(assert (=> d!53937 (= (apply!145 (+!257 lt!88250 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))) lt!88256) (apply!145 lt!88250 lt!88256))))

(declare-fun lt!88332 () Unit!5425)

(declare-fun choose!963 (ListLongMap!2221 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5425)

(assert (=> d!53937 (= lt!88332 (choose!963 lt!88250 lt!88255 (zeroValue!3514 thiss!1248) lt!88256))))

(declare-fun e!117895 () Bool)

(assert (=> d!53937 e!117895))

(declare-fun res!84708 () Bool)

(assert (=> d!53937 (=> (not res!84708) (not e!117895))))

(assert (=> d!53937 (= res!84708 (contains!1203 lt!88250 lt!88256))))

(assert (=> d!53937 (= (addApplyDifferent!121 lt!88250 lt!88255 (zeroValue!3514 thiss!1248) lt!88256) lt!88332)))

(declare-fun b!178919 () Bool)

(assert (=> b!178919 (= e!117895 (not (= lt!88256 lt!88255)))))

(assert (= (and d!53937 res!84708) b!178919))

(declare-fun m!206765 () Bool)

(assert (=> d!53937 m!206765))

(declare-fun m!206767 () Bool)

(assert (=> d!53937 m!206767))

(assert (=> d!53937 m!206631))

(assert (=> d!53937 m!206639))

(assert (=> d!53937 m!206629))

(assert (=> d!53937 m!206631))

(assert (=> b!178777 d!53937))

(declare-fun d!53939 () Bool)

(assert (=> d!53939 (= (apply!145 lt!88246 lt!88254) (get!2036 (getValueByKey!198 (toList!1126 lt!88246) lt!88254)))))

(declare-fun bs!7318 () Bool)

(assert (= bs!7318 d!53939))

(declare-fun m!206769 () Bool)

(assert (=> bs!7318 m!206769))

(assert (=> bs!7318 m!206769))

(declare-fun m!206771 () Bool)

(assert (=> bs!7318 m!206771))

(assert (=> b!178777 d!53939))

(declare-fun d!53941 () Bool)

(assert (=> d!53941 (= (apply!145 (+!257 lt!88250 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248))) lt!88256) (get!2036 (getValueByKey!198 (toList!1126 (+!257 lt!88250 (tuple2!3303 lt!88255 (zeroValue!3514 thiss!1248)))) lt!88256)))))

(declare-fun bs!7319 () Bool)

(assert (= bs!7319 d!53941))

(declare-fun m!206773 () Bool)

(assert (=> bs!7319 m!206773))

(assert (=> bs!7319 m!206773))

(declare-fun m!206775 () Bool)

(assert (=> bs!7319 m!206775))

(assert (=> b!178777 d!53941))

(declare-fun d!53943 () Bool)

(assert (=> d!53943 (= (apply!145 lt!88250 lt!88256) (get!2036 (getValueByKey!198 (toList!1126 lt!88250) lt!88256)))))

(declare-fun bs!7320 () Bool)

(assert (= bs!7320 d!53943))

(declare-fun m!206777 () Bool)

(assert (=> bs!7320 m!206777))

(assert (=> bs!7320 m!206777))

(declare-fun m!206779 () Bool)

(assert (=> bs!7320 m!206779))

(assert (=> b!178777 d!53943))

(declare-fun d!53945 () Bool)

(declare-fun e!117897 () Bool)

(assert (=> d!53945 e!117897))

(declare-fun res!84709 () Bool)

(assert (=> d!53945 (=> res!84709 e!117897)))

(declare-fun lt!88334 () Bool)

(assert (=> d!53945 (= res!84709 (not lt!88334))))

(declare-fun lt!88335 () Bool)

(assert (=> d!53945 (= lt!88334 lt!88335)))

(declare-fun lt!88333 () Unit!5425)

(declare-fun e!117896 () Unit!5425)

(assert (=> d!53945 (= lt!88333 e!117896)))

(declare-fun c!32091 () Bool)

(assert (=> d!53945 (= c!32091 lt!88335)))

(assert (=> d!53945 (= lt!88335 (containsKey!202 (toList!1126 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))) lt!88248))))

(assert (=> d!53945 (= (contains!1203 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))) lt!88248) lt!88334)))

(declare-fun b!178920 () Bool)

(declare-fun lt!88336 () Unit!5425)

(assert (=> b!178920 (= e!117896 lt!88336)))

(assert (=> b!178920 (= lt!88336 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1126 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))) lt!88248))))

(assert (=> b!178920 (isDefined!152 (getValueByKey!198 (toList!1126 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))) lt!88248))))

(declare-fun b!178921 () Bool)

(declare-fun Unit!5432 () Unit!5425)

(assert (=> b!178921 (= e!117896 Unit!5432)))

(declare-fun b!178922 () Bool)

(assert (=> b!178922 (= e!117897 (isDefined!152 (getValueByKey!198 (toList!1126 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))) lt!88248)))))

(assert (= (and d!53945 c!32091) b!178920))

(assert (= (and d!53945 (not c!32091)) b!178921))

(assert (= (and d!53945 (not res!84709)) b!178922))

(declare-fun m!206781 () Bool)

(assert (=> d!53945 m!206781))

(declare-fun m!206783 () Bool)

(assert (=> b!178920 m!206783))

(declare-fun m!206785 () Bool)

(assert (=> b!178920 m!206785))

(assert (=> b!178920 m!206785))

(declare-fun m!206787 () Bool)

(assert (=> b!178920 m!206787))

(assert (=> b!178922 m!206785))

(assert (=> b!178922 m!206785))

(assert (=> b!178922 m!206787))

(assert (=> b!178777 d!53945))

(declare-fun d!53947 () Bool)

(declare-fun e!117898 () Bool)

(assert (=> d!53947 e!117898))

(declare-fun res!84711 () Bool)

(assert (=> d!53947 (=> (not res!84711) (not e!117898))))

(declare-fun lt!88338 () ListLongMap!2221)

(assert (=> d!53947 (= res!84711 (contains!1203 lt!88338 (_1!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))))))

(declare-fun lt!88337 () List!2267)

(assert (=> d!53947 (= lt!88338 (ListLongMap!2222 lt!88337))))

(declare-fun lt!88339 () Unit!5425)

(declare-fun lt!88340 () Unit!5425)

(assert (=> d!53947 (= lt!88339 lt!88340)))

(assert (=> d!53947 (= (getValueByKey!198 lt!88337 (_1!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))))))

(assert (=> d!53947 (= lt!88340 (lemmaContainsTupThenGetReturnValue!107 lt!88337 (_1!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))))))

(assert (=> d!53947 (= lt!88337 (insertStrictlySorted!110 (toList!1126 lt!88239) (_1!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))))))

(assert (=> d!53947 (= (+!257 lt!88239 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))) lt!88338)))

(declare-fun b!178923 () Bool)

(declare-fun res!84710 () Bool)

(assert (=> b!178923 (=> (not res!84710) (not e!117898))))

(assert (=> b!178923 (= res!84710 (= (getValueByKey!198 (toList!1126 lt!88338) (_1!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))))))))

(declare-fun b!178924 () Bool)

(assert (=> b!178924 (= e!117898 (contains!1206 (toList!1126 lt!88338) (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))))))

(assert (= (and d!53947 res!84711) b!178923))

(assert (= (and b!178923 res!84710) b!178924))

(declare-fun m!206789 () Bool)

(assert (=> d!53947 m!206789))

(declare-fun m!206791 () Bool)

(assert (=> d!53947 m!206791))

(declare-fun m!206793 () Bool)

(assert (=> d!53947 m!206793))

(declare-fun m!206795 () Bool)

(assert (=> d!53947 m!206795))

(declare-fun m!206797 () Bool)

(assert (=> b!178923 m!206797))

(declare-fun m!206799 () Bool)

(assert (=> b!178924 m!206799))

(assert (=> b!178777 d!53947))

(declare-fun d!53949 () Bool)

(assert (=> d!53949 (= (apply!145 (+!257 lt!88239 (tuple2!3303 lt!88235 (minValue!3514 thiss!1248))) lt!88252) (apply!145 lt!88239 lt!88252))))

(declare-fun lt!88341 () Unit!5425)

(assert (=> d!53949 (= lt!88341 (choose!963 lt!88239 lt!88235 (minValue!3514 thiss!1248) lt!88252))))

(declare-fun e!117899 () Bool)

(assert (=> d!53949 e!117899))

(declare-fun res!84712 () Bool)

(assert (=> d!53949 (=> (not res!84712) (not e!117899))))

(assert (=> d!53949 (= res!84712 (contains!1203 lt!88239 lt!88252))))

(assert (=> d!53949 (= (addApplyDifferent!121 lt!88239 lt!88235 (minValue!3514 thiss!1248) lt!88252) lt!88341)))

(declare-fun b!178925 () Bool)

(assert (=> b!178925 (= e!117899 (not (= lt!88252 lt!88235)))))

(assert (= (and d!53949 res!84712) b!178925))

(declare-fun m!206801 () Bool)

(assert (=> d!53949 m!206801))

(declare-fun m!206803 () Bool)

(assert (=> d!53949 m!206803))

(assert (=> d!53949 m!206649))

(assert (=> d!53949 m!206651))

(assert (=> d!53949 m!206643))

(assert (=> d!53949 m!206649))

(assert (=> b!178777 d!53949))

(declare-fun d!53951 () Bool)

(declare-fun e!117900 () Bool)

(assert (=> d!53951 e!117900))

(declare-fun res!84714 () Bool)

(assert (=> d!53951 (=> (not res!84714) (not e!117900))))

(declare-fun lt!88343 () ListLongMap!2221)

(assert (=> d!53951 (= res!84714 (contains!1203 lt!88343 (_1!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))))))

(declare-fun lt!88342 () List!2267)

(assert (=> d!53951 (= lt!88343 (ListLongMap!2222 lt!88342))))

(declare-fun lt!88344 () Unit!5425)

(declare-fun lt!88345 () Unit!5425)

(assert (=> d!53951 (= lt!88344 lt!88345)))

(assert (=> d!53951 (= (getValueByKey!198 lt!88342 (_1!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!53951 (= lt!88345 (lemmaContainsTupThenGetReturnValue!107 lt!88342 (_1!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!53951 (= lt!88342 (insertStrictlySorted!110 (toList!1126 lt!88238) (_1!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!53951 (= (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))) lt!88343)))

(declare-fun b!178926 () Bool)

(declare-fun res!84713 () Bool)

(assert (=> b!178926 (=> (not res!84713) (not e!117900))))

(assert (=> b!178926 (= res!84713 (= (getValueByKey!198 (toList!1126 lt!88343) (_1!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))))))))

(declare-fun b!178927 () Bool)

(assert (=> b!178927 (= e!117900 (contains!1206 (toList!1126 lt!88343) (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))))))

(assert (= (and d!53951 res!84714) b!178926))

(assert (= (and b!178926 res!84713) b!178927))

(declare-fun m!206805 () Bool)

(assert (=> d!53951 m!206805))

(declare-fun m!206807 () Bool)

(assert (=> d!53951 m!206807))

(declare-fun m!206809 () Bool)

(assert (=> d!53951 m!206809))

(declare-fun m!206811 () Bool)

(assert (=> d!53951 m!206811))

(declare-fun m!206813 () Bool)

(assert (=> b!178926 m!206813))

(declare-fun m!206815 () Bool)

(assert (=> b!178927 m!206815))

(assert (=> b!178777 d!53951))

(declare-fun d!53953 () Bool)

(assert (=> d!53953 (= (apply!145 (+!257 lt!88246 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))) lt!88254) (get!2036 (getValueByKey!198 (toList!1126 (+!257 lt!88246 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))) lt!88254)))))

(declare-fun bs!7321 () Bool)

(assert (= bs!7321 d!53953))

(declare-fun m!206817 () Bool)

(assert (=> bs!7321 m!206817))

(assert (=> bs!7321 m!206817))

(declare-fun m!206819 () Bool)

(assert (=> bs!7321 m!206819))

(assert (=> b!178777 d!53953))

(declare-fun d!53955 () Bool)

(assert (=> d!53955 (= (apply!145 lt!88239 lt!88252) (get!2036 (getValueByKey!198 (toList!1126 lt!88239) lt!88252)))))

(declare-fun bs!7322 () Bool)

(assert (= bs!7322 d!53955))

(declare-fun m!206821 () Bool)

(assert (=> bs!7322 m!206821))

(assert (=> bs!7322 m!206821))

(declare-fun m!206823 () Bool)

(assert (=> bs!7322 m!206823))

(assert (=> b!178777 d!53955))

(declare-fun d!53957 () Bool)

(assert (=> d!53957 (contains!1203 (+!257 lt!88238 (tuple2!3303 lt!88236 (zeroValue!3514 thiss!1248))) lt!88248)))

(declare-fun lt!88348 () Unit!5425)

(declare-fun choose!964 (ListLongMap!2221 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5425)

(assert (=> d!53957 (= lt!88348 (choose!964 lt!88238 lt!88236 (zeroValue!3514 thiss!1248) lt!88248))))

(assert (=> d!53957 (contains!1203 lt!88238 lt!88248)))

(assert (=> d!53957 (= (addStillContains!121 lt!88238 lt!88236 (zeroValue!3514 thiss!1248) lt!88248) lt!88348)))

(declare-fun bs!7323 () Bool)

(assert (= bs!7323 d!53957))

(assert (=> bs!7323 m!206623))

(assert (=> bs!7323 m!206623))

(assert (=> bs!7323 m!206625))

(declare-fun m!206825 () Bool)

(assert (=> bs!7323 m!206825))

(declare-fun m!206827 () Bool)

(assert (=> bs!7323 m!206827))

(assert (=> b!178777 d!53957))

(declare-fun d!53959 () Bool)

(declare-fun e!117901 () Bool)

(assert (=> d!53959 e!117901))

(declare-fun res!84716 () Bool)

(assert (=> d!53959 (=> (not res!84716) (not e!117901))))

(declare-fun lt!88350 () ListLongMap!2221)

(assert (=> d!53959 (= res!84716 (contains!1203 lt!88350 (_1!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))))))

(declare-fun lt!88349 () List!2267)

(assert (=> d!53959 (= lt!88350 (ListLongMap!2222 lt!88349))))

(declare-fun lt!88351 () Unit!5425)

(declare-fun lt!88352 () Unit!5425)

(assert (=> d!53959 (= lt!88351 lt!88352)))

(assert (=> d!53959 (= (getValueByKey!198 lt!88349 (_1!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))))))

(assert (=> d!53959 (= lt!88352 (lemmaContainsTupThenGetReturnValue!107 lt!88349 (_1!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))))))

(assert (=> d!53959 (= lt!88349 (insertStrictlySorted!110 (toList!1126 lt!88246) (_1!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))) (_2!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))))))

(assert (=> d!53959 (= (+!257 lt!88246 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))) lt!88350)))

(declare-fun b!178929 () Bool)

(declare-fun res!84715 () Bool)

(assert (=> b!178929 (=> (not res!84715) (not e!117901))))

(assert (=> b!178929 (= res!84715 (= (getValueByKey!198 (toList!1126 lt!88350) (_1!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248)))) (Some!203 (_2!1662 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))))))))

(declare-fun b!178930 () Bool)

(assert (=> b!178930 (= e!117901 (contains!1206 (toList!1126 lt!88350) (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))))))

(assert (= (and d!53959 res!84716) b!178929))

(assert (= (and b!178929 res!84715) b!178930))

(declare-fun m!206829 () Bool)

(assert (=> d!53959 m!206829))

(declare-fun m!206831 () Bool)

(assert (=> d!53959 m!206831))

(declare-fun m!206833 () Bool)

(assert (=> d!53959 m!206833))

(declare-fun m!206835 () Bool)

(assert (=> d!53959 m!206835))

(declare-fun m!206837 () Bool)

(assert (=> b!178929 m!206837))

(declare-fun m!206839 () Bool)

(assert (=> b!178930 m!206839))

(assert (=> b!178777 d!53959))

(declare-fun d!53961 () Bool)

(assert (=> d!53961 (= (apply!145 (+!257 lt!88246 (tuple2!3303 lt!88240 (minValue!3514 thiss!1248))) lt!88254) (apply!145 lt!88246 lt!88254))))

(declare-fun lt!88353 () Unit!5425)

(assert (=> d!53961 (= lt!88353 (choose!963 lt!88246 lt!88240 (minValue!3514 thiss!1248) lt!88254))))

(declare-fun e!117902 () Bool)

(assert (=> d!53961 e!117902))

(declare-fun res!84717 () Bool)

(assert (=> d!53961 (=> (not res!84717) (not e!117902))))

(assert (=> d!53961 (= res!84717 (contains!1203 lt!88246 lt!88254))))

(assert (=> d!53961 (= (addApplyDifferent!121 lt!88246 lt!88240 (minValue!3514 thiss!1248) lt!88254) lt!88353)))

(declare-fun b!178931 () Bool)

(assert (=> b!178931 (= e!117902 (not (= lt!88254 lt!88240)))))

(assert (= (and d!53961 res!84717) b!178931))

(declare-fun m!206841 () Bool)

(assert (=> d!53961 m!206841))

(declare-fun m!206843 () Bool)

(assert (=> d!53961 m!206843))

(assert (=> d!53961 m!206645))

(assert (=> d!53961 m!206647))

(assert (=> d!53961 m!206627))

(assert (=> d!53961 m!206645))

(assert (=> b!178777 d!53961))

(declare-fun d!53963 () Bool)

(assert (=> d!53963 (= (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178763 d!53963))

(assert (=> b!178714 d!53929))

(assert (=> b!178714 d!53931))

(declare-fun b!178940 () Bool)

(declare-fun e!117907 () (_ BitVec 32))

(declare-fun e!117908 () (_ BitVec 32))

(assert (=> b!178940 (= e!117907 e!117908)))

(declare-fun c!32097 () Bool)

(assert (=> b!178940 (= c!32097 (validKeyInArray!0 (select (arr!3556 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53965 () Bool)

(declare-fun lt!88356 () (_ BitVec 32))

(assert (=> d!53965 (and (bvsge lt!88356 #b00000000000000000000000000000000) (bvsle lt!88356 (bvsub (size!3864 (_keys!5553 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53965 (= lt!88356 e!117907)))

(declare-fun c!32096 () Bool)

(assert (=> d!53965 (= c!32096 (bvsge #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> d!53965 (and (bvsle #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3864 (_keys!5553 thiss!1248)) (size!3864 (_keys!5553 thiss!1248))))))

(assert (=> d!53965 (= (arrayCountValidKeys!0 (_keys!5553 thiss!1248) #b00000000000000000000000000000000 (size!3864 (_keys!5553 thiss!1248))) lt!88356)))

(declare-fun b!178941 () Bool)

(declare-fun call!18073 () (_ BitVec 32))

(assert (=> b!178941 (= e!117908 (bvadd #b00000000000000000000000000000001 call!18073))))

(declare-fun b!178942 () Bool)

(assert (=> b!178942 (= e!117907 #b00000000000000000000000000000000)))

(declare-fun b!178943 () Bool)

(assert (=> b!178943 (= e!117908 call!18073)))

(declare-fun bm!18070 () Bool)

(assert (=> bm!18070 (= call!18073 (arrayCountValidKeys!0 (_keys!5553 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3864 (_keys!5553 thiss!1248))))))

(assert (= (and d!53965 c!32096) b!178942))

(assert (= (and d!53965 (not c!32096)) b!178940))

(assert (= (and b!178940 c!32097) b!178941))

(assert (= (and b!178940 (not c!32097)) b!178943))

(assert (= (or b!178941 b!178943) bm!18070))

(assert (=> b!178940 m!206597))

(assert (=> b!178940 m!206597))

(assert (=> b!178940 m!206599))

(declare-fun m!206845 () Bool)

(assert (=> bm!18070 m!206845))

(assert (=> b!178685 d!53965))

(assert (=> d!53897 d!53899))

(declare-fun b!178952 () Bool)

(declare-fun res!84726 () Bool)

(declare-fun e!117911 () Bool)

(assert (=> b!178952 (=> (not res!84726) (not e!117911))))

(assert (=> b!178952 (= res!84726 (and (= (size!3865 (_values!3656 thiss!1248)) (bvadd (mask!8640 thiss!1248) #b00000000000000000000000000000001)) (= (size!3864 (_keys!5553 thiss!1248)) (size!3865 (_values!3656 thiss!1248))) (bvsge (_size!1251 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1251 thiss!1248) (bvadd (mask!8640 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53967 () Bool)

(declare-fun res!84727 () Bool)

(assert (=> d!53967 (=> (not res!84727) (not e!117911))))

(assert (=> d!53967 (= res!84727 (validMask!0 (mask!8640 thiss!1248)))))

(assert (=> d!53967 (= (simpleValid!159 thiss!1248) e!117911)))

(declare-fun b!178954 () Bool)

(declare-fun res!84728 () Bool)

(assert (=> b!178954 (=> (not res!84728) (not e!117911))))

(declare-fun size!3870 (LongMapFixedSize!2404) (_ BitVec 32))

(assert (=> b!178954 (= res!84728 (= (size!3870 thiss!1248) (bvadd (_size!1251 thiss!1248) (bvsdiv (bvadd (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!178953 () Bool)

(declare-fun res!84729 () Bool)

(assert (=> b!178953 (=> (not res!84729) (not e!117911))))

(assert (=> b!178953 (= res!84729 (bvsge (size!3870 thiss!1248) (_size!1251 thiss!1248)))))

(declare-fun b!178955 () Bool)

(assert (=> b!178955 (= e!117911 (and (bvsge (extraKeys!3410 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3410 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1251 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!53967 res!84727) b!178952))

(assert (= (and b!178952 res!84726) b!178953))

(assert (= (and b!178953 res!84729) b!178954))

(assert (= (and b!178954 res!84728) b!178955))

(assert (=> d!53967 m!206531))

(declare-fun m!206847 () Bool)

(assert (=> b!178954 m!206847))

(assert (=> b!178953 m!206847))

(assert (=> d!53887 d!53967))

(declare-fun d!53969 () Bool)

(declare-fun e!117912 () Bool)

(assert (=> d!53969 e!117912))

(declare-fun res!84731 () Bool)

(assert (=> d!53969 (=> (not res!84731) (not e!117912))))

(declare-fun lt!88358 () ListLongMap!2221)

(assert (=> d!53969 (= res!84731 (contains!1203 lt!88358 (_1!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(declare-fun lt!88357 () List!2267)

(assert (=> d!53969 (= lt!88358 (ListLongMap!2222 lt!88357))))

(declare-fun lt!88359 () Unit!5425)

(declare-fun lt!88360 () Unit!5425)

(assert (=> d!53969 (= lt!88359 lt!88360)))

(assert (=> d!53969 (= (getValueByKey!198 lt!88357 (_1!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))) (Some!203 (_2!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(assert (=> d!53969 (= lt!88360 (lemmaContainsTupThenGetReturnValue!107 lt!88357 (_1!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (_2!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(assert (=> d!53969 (= lt!88357 (insertStrictlySorted!110 (toList!1126 (ite c!32049 call!18057 (ite c!32047 call!18061 call!18055))) (_1!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (_2!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(assert (=> d!53969 (= (+!257 (ite c!32049 call!18057 (ite c!32047 call!18061 call!18055)) (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) lt!88358)))

(declare-fun b!178956 () Bool)

(declare-fun res!84730 () Bool)

(assert (=> b!178956 (=> (not res!84730) (not e!117912))))

(assert (=> b!178956 (= res!84730 (= (getValueByKey!198 (toList!1126 lt!88358) (_1!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))) (Some!203 (_2!1662 (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))))

(declare-fun b!178957 () Bool)

(assert (=> b!178957 (= e!117912 (contains!1206 (toList!1126 lt!88358) (ite (or c!32049 c!32047) (tuple2!3303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(assert (= (and d!53969 res!84731) b!178956))

(assert (= (and b!178956 res!84730) b!178957))

(declare-fun m!206849 () Bool)

(assert (=> d!53969 m!206849))

(declare-fun m!206851 () Bool)

(assert (=> d!53969 m!206851))

(declare-fun m!206853 () Bool)

(assert (=> d!53969 m!206853))

(declare-fun m!206855 () Bool)

(assert (=> d!53969 m!206855))

(declare-fun m!206857 () Bool)

(assert (=> b!178956 m!206857))

(declare-fun m!206859 () Bool)

(assert (=> b!178957 m!206859))

(assert (=> bm!18053 d!53969))

(declare-fun d!53971 () Bool)

(declare-fun res!84736 () Bool)

(declare-fun e!117917 () Bool)

(assert (=> d!53971 (=> res!84736 e!117917)))

(assert (=> d!53971 (= res!84736 (and ((_ is Cons!2263) (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (= (_1!1662 (h!2887 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)))))

(assert (=> d!53971 (= (containsKey!202 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828) e!117917)))

(declare-fun b!178962 () Bool)

(declare-fun e!117918 () Bool)

(assert (=> b!178962 (= e!117917 e!117918)))

(declare-fun res!84737 () Bool)

(assert (=> b!178962 (=> (not res!84737) (not e!117918))))

(assert (=> b!178962 (= res!84737 (and (or (not ((_ is Cons!2263) (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) (bvsle (_1!1662 (h!2887 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)) ((_ is Cons!2263) (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (bvslt (_1!1662 (h!2887 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)))))

(declare-fun b!178963 () Bool)

(assert (=> b!178963 (= e!117918 (containsKey!202 (t!7098 (toList!1126 (getCurrentListMap!762 (_keys!5553 thiss!1248) (_values!3656 thiss!1248) (mask!8640 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) key!828))))

(assert (= (and d!53971 (not res!84736)) b!178962))

(assert (= (and b!178962 res!84737) b!178963))

(declare-fun m!206861 () Bool)

(assert (=> b!178963 m!206861))

(assert (=> d!53895 d!53971))

(assert (=> b!178776 d!53963))

(declare-fun b!178976 () Bool)

(declare-fun c!32105 () Bool)

(declare-fun lt!88366 () (_ BitVec 64))

(assert (=> b!178976 (= c!32105 (= lt!88366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117927 () SeekEntryResult!585)

(declare-fun e!117926 () SeekEntryResult!585)

(assert (=> b!178976 (= e!117927 e!117926)))

(declare-fun b!178977 () Bool)

(assert (=> b!178977 (= e!117926 (MissingVacant!585 (index!4510 lt!88178)))))

(declare-fun d!53973 () Bool)

(declare-fun lt!88365 () SeekEntryResult!585)

(assert (=> d!53973 (and (or ((_ is Undefined!585) lt!88365) (not ((_ is Found!585) lt!88365)) (and (bvsge (index!4509 lt!88365) #b00000000000000000000000000000000) (bvslt (index!4509 lt!88365) (size!3864 (_keys!5553 thiss!1248))))) (or ((_ is Undefined!585) lt!88365) ((_ is Found!585) lt!88365) (not ((_ is MissingVacant!585) lt!88365)) (not (= (index!4511 lt!88365) (index!4510 lt!88178))) (and (bvsge (index!4511 lt!88365) #b00000000000000000000000000000000) (bvslt (index!4511 lt!88365) (size!3864 (_keys!5553 thiss!1248))))) (or ((_ is Undefined!585) lt!88365) (ite ((_ is Found!585) lt!88365) (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4509 lt!88365)) key!828) (and ((_ is MissingVacant!585) lt!88365) (= (index!4511 lt!88365) (index!4510 lt!88178)) (= (select (arr!3556 (_keys!5553 thiss!1248)) (index!4511 lt!88365)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!117925 () SeekEntryResult!585)

(assert (=> d!53973 (= lt!88365 e!117925)))

(declare-fun c!32104 () Bool)

(assert (=> d!53973 (= c!32104 (bvsge (x!19578 lt!88178) #b01111111111111111111111111111110))))

(assert (=> d!53973 (= lt!88366 (select (arr!3556 (_keys!5553 thiss!1248)) (index!4510 lt!88178)))))

(assert (=> d!53973 (validMask!0 (mask!8640 thiss!1248))))

(assert (=> d!53973 (= (seekKeyOrZeroReturnVacant!0 (x!19578 lt!88178) (index!4510 lt!88178) (index!4510 lt!88178) key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)) lt!88365)))

(declare-fun b!178978 () Bool)

(assert (=> b!178978 (= e!117927 (Found!585 (index!4510 lt!88178)))))

(declare-fun b!178979 () Bool)

(assert (=> b!178979 (= e!117926 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19578 lt!88178) #b00000000000000000000000000000001) (nextIndex!0 (index!4510 lt!88178) (x!19578 lt!88178) (mask!8640 thiss!1248)) (index!4510 lt!88178) key!828 (_keys!5553 thiss!1248) (mask!8640 thiss!1248)))))

(declare-fun b!178980 () Bool)

(assert (=> b!178980 (= e!117925 Undefined!585)))

(declare-fun b!178981 () Bool)

(assert (=> b!178981 (= e!117925 e!117927)))

(declare-fun c!32106 () Bool)

(assert (=> b!178981 (= c!32106 (= lt!88366 key!828))))

(assert (= (and d!53973 c!32104) b!178980))

(assert (= (and d!53973 (not c!32104)) b!178981))

(assert (= (and b!178981 c!32106) b!178978))

(assert (= (and b!178981 (not c!32106)) b!178976))

(assert (= (and b!178976 c!32105) b!178977))

(assert (= (and b!178976 (not c!32105)) b!178979))

(declare-fun m!206863 () Bool)

(assert (=> d!53973 m!206863))

(declare-fun m!206865 () Bool)

(assert (=> d!53973 m!206865))

(assert (=> d!53973 m!206585))

(assert (=> d!53973 m!206531))

(declare-fun m!206867 () Bool)

(assert (=> b!178979 m!206867))

(assert (=> b!178979 m!206867))

(declare-fun m!206869 () Bool)

(assert (=> b!178979 m!206869))

(assert (=> b!178701 d!53973))

(declare-fun condMapEmpty!7165 () Bool)

(declare-fun mapDefault!7165 () ValueCell!1748)

(assert (=> mapNonEmpty!7164 (= condMapEmpty!7165 (= mapRest!7164 ((as const (Array (_ BitVec 32) ValueCell!1748)) mapDefault!7165)))))

(declare-fun e!117929 () Bool)

(declare-fun mapRes!7165 () Bool)

(assert (=> mapNonEmpty!7164 (= tp!15966 (and e!117929 mapRes!7165))))

(declare-fun mapNonEmpty!7165 () Bool)

(declare-fun tp!15967 () Bool)

(declare-fun e!117928 () Bool)

(assert (=> mapNonEmpty!7165 (= mapRes!7165 (and tp!15967 e!117928))))

(declare-fun mapRest!7165 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapKey!7165 () (_ BitVec 32))

(declare-fun mapValue!7165 () ValueCell!1748)

(assert (=> mapNonEmpty!7165 (= mapRest!7164 (store mapRest!7165 mapKey!7165 mapValue!7165))))

(declare-fun mapIsEmpty!7165 () Bool)

(assert (=> mapIsEmpty!7165 mapRes!7165))

(declare-fun b!178983 () Bool)

(assert (=> b!178983 (= e!117929 tp_is_empty!4183)))

(declare-fun b!178982 () Bool)

(assert (=> b!178982 (= e!117928 tp_is_empty!4183)))

(assert (= (and mapNonEmpty!7164 condMapEmpty!7165) mapIsEmpty!7165))

(assert (= (and mapNonEmpty!7164 (not condMapEmpty!7165)) mapNonEmpty!7165))

(assert (= (and mapNonEmpty!7165 ((_ is ValueCellFull!1748) mapValue!7165)) b!178982))

(assert (= (and mapNonEmpty!7164 ((_ is ValueCellFull!1748) mapDefault!7165)) b!178983))

(declare-fun m!206871 () Bool)

(assert (=> mapNonEmpty!7165 m!206871))

(declare-fun b_lambda!7085 () Bool)

(assert (= b_lambda!7083 (or (and b!178618 b_free!4411) b_lambda!7085)))

(declare-fun b_lambda!7087 () Bool)

(assert (= b_lambda!7081 (or (and b!178618 b_free!4411) b_lambda!7087)))

(check-sat (not mapNonEmpty!7165) (not b!178929) (not bm!18061) (not d!53939) (not d!53915) (not d!53941) (not b!178893) (not d!53959) (not d!53927) (not b_lambda!7085) (not b!178880) (not b!178832) (not b!178792) (not b!178901) (not b!178895) (not d!53901) (not b!178953) (not b!178829) (not b!178835) (not d!53919) (not b!178824) (not b!178963) (not b!178954) (not b!178831) (not b!178920) (not b!178922) (not b!178834) (not b!178838) (not d!53951) (not b!178848) (not d!53969) (not b!178930) (not b!178799) (not d!53947) (not b!178898) (not b!178915) (not b!178927) (not b!178798) (not d!53953) (not b!178896) (not d!53961) (not b!178849) (not b!178914) (not d!53909) (not bm!18070) (not b!178956) (not bm!18064) (not b!178875) (not d!53943) (not b!178827) (not b!178912) (not d!53957) (not b!178979) (not d!53933) (not b!178926) b_and!10917 (not bm!18067) (not d!53955) (not d!53967) (not b!178793) (not d!53903) (not b!178878) (not b!178924) (not d!53929) (not b_lambda!7087) (not d!53973) (not d!53911) (not d!53935) (not d!53945) (not d!53925) (not d!53921) (not b!178825) (not d!53907) (not b!178957) tp_is_empty!4183 (not b!178894) (not d!53937) (not b!178940) (not b_next!4411) (not d!53949) (not b!178923) (not b_lambda!7079) (not b!178836))
(check-sat b_and!10917 (not b_next!4411))
