; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15844 () Bool)

(assert start!15844)

(declare-fun b!157610 () Bool)

(declare-fun b_free!3457 () Bool)

(declare-fun b_next!3457 () Bool)

(assert (=> b!157610 (= b_free!3457 (not b_next!3457))))

(declare-fun tp!12909 () Bool)

(declare-fun b_and!9845 () Bool)

(assert (=> b!157610 (= tp!12909 b_and!9845)))

(declare-fun res!74462 () Bool)

(declare-fun e!103224 () Bool)

(assert (=> start!15844 (=> (not res!74462) (not e!103224))))

(declare-datatypes ((V!3993 0))(
  ( (V!3994 (val!1674 Int)) )
))
(declare-datatypes ((ValueCell!1286 0))(
  ( (ValueCellFull!1286 (v!3533 V!3993)) (EmptyCell!1286) )
))
(declare-datatypes ((array!5559 0))(
  ( (array!5560 (arr!2632 (Array (_ BitVec 32) (_ BitVec 64))) (size!2913 (_ BitVec 32))) )
))
(declare-datatypes ((array!5561 0))(
  ( (array!5562 (arr!2633 (Array (_ BitVec 32) ValueCell!1286)) (size!2914 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1480 0))(
  ( (LongMapFixedSize!1481 (defaultEntry!3182 Int) (mask!7672 (_ BitVec 32)) (extraKeys!2923 (_ BitVec 32)) (zeroValue!3025 V!3993) (minValue!3025 V!3993) (_size!789 (_ BitVec 32)) (_keys!4958 array!5559) (_values!3165 array!5561) (_vacant!789 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1480)

(declare-fun valid!705 (LongMapFixedSize!1480) Bool)

(assert (=> start!15844 (= res!74462 (valid!705 thiss!1248))))

(assert (=> start!15844 e!103224))

(declare-fun e!103222 () Bool)

(assert (=> start!15844 e!103222))

(assert (=> start!15844 true))

(declare-fun tp_is_empty!3259 () Bool)

(declare-fun e!103221 () Bool)

(declare-fun array_inv!1691 (array!5559) Bool)

(declare-fun array_inv!1692 (array!5561) Bool)

(assert (=> b!157610 (= e!103222 (and tp!12909 tp_is_empty!3259 (array_inv!1691 (_keys!4958 thiss!1248)) (array_inv!1692 (_values!3165 thiss!1248)) e!103221))))

(declare-fun b!157611 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157611 (= e!103224 (not (validMask!0 (mask!7672 thiss!1248))))))

(declare-fun b!157612 () Bool)

(declare-fun e!103226 () Bool)

(assert (=> b!157612 (= e!103226 tp_is_empty!3259)))

(declare-fun b!157613 () Bool)

(declare-fun e!103225 () Bool)

(declare-fun mapRes!5545 () Bool)

(assert (=> b!157613 (= e!103221 (and e!103225 mapRes!5545))))

(declare-fun condMapEmpty!5545 () Bool)

(declare-fun mapDefault!5545 () ValueCell!1286)

(assert (=> b!157613 (= condMapEmpty!5545 (= (arr!2633 (_values!3165 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1286)) mapDefault!5545)))))

(declare-fun b!157614 () Bool)

(assert (=> b!157614 (= e!103225 tp_is_empty!3259)))

(declare-fun b!157615 () Bool)

(declare-fun res!74460 () Bool)

(assert (=> b!157615 (=> (not res!74460) (not e!103224))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!292 0))(
  ( (MissingZero!292 (index!3336 (_ BitVec 32))) (Found!292 (index!3337 (_ BitVec 32))) (Intermediate!292 (undefined!1104 Bool) (index!3338 (_ BitVec 32)) (x!17391 (_ BitVec 32))) (Undefined!292) (MissingVacant!292 (index!3339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5559 (_ BitVec 32)) SeekEntryResult!292)

(assert (=> b!157615 (= res!74460 ((_ is Undefined!292) (seekEntryOrOpen!0 key!828 (_keys!4958 thiss!1248) (mask!7672 thiss!1248))))))

(declare-fun mapIsEmpty!5545 () Bool)

(assert (=> mapIsEmpty!5545 mapRes!5545))

(declare-fun mapNonEmpty!5545 () Bool)

(declare-fun tp!12910 () Bool)

(assert (=> mapNonEmpty!5545 (= mapRes!5545 (and tp!12910 e!103226))))

(declare-fun mapRest!5545 () (Array (_ BitVec 32) ValueCell!1286))

(declare-fun mapKey!5545 () (_ BitVec 32))

(declare-fun mapValue!5545 () ValueCell!1286)

(assert (=> mapNonEmpty!5545 (= (arr!2633 (_values!3165 thiss!1248)) (store mapRest!5545 mapKey!5545 mapValue!5545))))

(declare-fun b!157616 () Bool)

(declare-fun res!74461 () Bool)

(assert (=> b!157616 (=> (not res!74461) (not e!103224))))

(assert (=> b!157616 (= res!74461 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!15844 res!74462) b!157616))

(assert (= (and b!157616 res!74461) b!157615))

(assert (= (and b!157615 res!74460) b!157611))

(assert (= (and b!157613 condMapEmpty!5545) mapIsEmpty!5545))

(assert (= (and b!157613 (not condMapEmpty!5545)) mapNonEmpty!5545))

(assert (= (and mapNonEmpty!5545 ((_ is ValueCellFull!1286) mapValue!5545)) b!157612))

(assert (= (and b!157613 ((_ is ValueCellFull!1286) mapDefault!5545)) b!157614))

(assert (= b!157610 b!157613))

(assert (= start!15844 b!157610))

(declare-fun m!190201 () Bool)

(assert (=> b!157610 m!190201))

(declare-fun m!190203 () Bool)

(assert (=> b!157610 m!190203))

(declare-fun m!190205 () Bool)

(assert (=> b!157611 m!190205))

(declare-fun m!190207 () Bool)

(assert (=> start!15844 m!190207))

(declare-fun m!190209 () Bool)

(assert (=> mapNonEmpty!5545 m!190209))

(declare-fun m!190211 () Bool)

(assert (=> b!157615 m!190211))

(check-sat (not start!15844) tp_is_empty!3259 (not b!157611) (not b_next!3457) (not b!157610) (not mapNonEmpty!5545) (not b!157615) b_and!9845)
(check-sat b_and!9845 (not b_next!3457))
(get-model)

(declare-fun d!50949 () Bool)

(assert (=> d!50949 (= (array_inv!1691 (_keys!4958 thiss!1248)) (bvsge (size!2913 (_keys!4958 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157610 d!50949))

(declare-fun d!50951 () Bool)

(assert (=> d!50951 (= (array_inv!1692 (_values!3165 thiss!1248)) (bvsge (size!2914 (_values!3165 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157610 d!50951))

(declare-fun d!50953 () Bool)

(declare-fun lt!81576 () SeekEntryResult!292)

(assert (=> d!50953 (and (or ((_ is Undefined!292) lt!81576) (not ((_ is Found!292) lt!81576)) (and (bvsge (index!3337 lt!81576) #b00000000000000000000000000000000) (bvslt (index!3337 lt!81576) (size!2913 (_keys!4958 thiss!1248))))) (or ((_ is Undefined!292) lt!81576) ((_ is Found!292) lt!81576) (not ((_ is MissingZero!292) lt!81576)) (and (bvsge (index!3336 lt!81576) #b00000000000000000000000000000000) (bvslt (index!3336 lt!81576) (size!2913 (_keys!4958 thiss!1248))))) (or ((_ is Undefined!292) lt!81576) ((_ is Found!292) lt!81576) ((_ is MissingZero!292) lt!81576) (not ((_ is MissingVacant!292) lt!81576)) (and (bvsge (index!3339 lt!81576) #b00000000000000000000000000000000) (bvslt (index!3339 lt!81576) (size!2913 (_keys!4958 thiss!1248))))) (or ((_ is Undefined!292) lt!81576) (ite ((_ is Found!292) lt!81576) (= (select (arr!2632 (_keys!4958 thiss!1248)) (index!3337 lt!81576)) key!828) (ite ((_ is MissingZero!292) lt!81576) (= (select (arr!2632 (_keys!4958 thiss!1248)) (index!3336 lt!81576)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!292) lt!81576) (= (select (arr!2632 (_keys!4958 thiss!1248)) (index!3339 lt!81576)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103269 () SeekEntryResult!292)

(assert (=> d!50953 (= lt!81576 e!103269)))

(declare-fun c!29699 () Bool)

(declare-fun lt!81575 () SeekEntryResult!292)

(assert (=> d!50953 (= c!29699 (and ((_ is Intermediate!292) lt!81575) (undefined!1104 lt!81575)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5559 (_ BitVec 32)) SeekEntryResult!292)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!50953 (= lt!81575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7672 thiss!1248)) key!828 (_keys!4958 thiss!1248) (mask!7672 thiss!1248)))))

(assert (=> d!50953 (validMask!0 (mask!7672 thiss!1248))))

(assert (=> d!50953 (= (seekEntryOrOpen!0 key!828 (_keys!4958 thiss!1248) (mask!7672 thiss!1248)) lt!81576)))

(declare-fun b!157671 () Bool)

(declare-fun e!103271 () SeekEntryResult!292)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5559 (_ BitVec 32)) SeekEntryResult!292)

(assert (=> b!157671 (= e!103271 (seekKeyOrZeroReturnVacant!0 (x!17391 lt!81575) (index!3338 lt!81575) (index!3338 lt!81575) key!828 (_keys!4958 thiss!1248) (mask!7672 thiss!1248)))))

(declare-fun b!157672 () Bool)

(assert (=> b!157672 (= e!103269 Undefined!292)))

(declare-fun b!157673 () Bool)

(assert (=> b!157673 (= e!103271 (MissingZero!292 (index!3338 lt!81575)))))

(declare-fun b!157674 () Bool)

(declare-fun e!103270 () SeekEntryResult!292)

(assert (=> b!157674 (= e!103270 (Found!292 (index!3338 lt!81575)))))

(declare-fun b!157675 () Bool)

(assert (=> b!157675 (= e!103269 e!103270)))

(declare-fun lt!81574 () (_ BitVec 64))

(assert (=> b!157675 (= lt!81574 (select (arr!2632 (_keys!4958 thiss!1248)) (index!3338 lt!81575)))))

(declare-fun c!29698 () Bool)

(assert (=> b!157675 (= c!29698 (= lt!81574 key!828))))

(declare-fun b!157676 () Bool)

(declare-fun c!29697 () Bool)

(assert (=> b!157676 (= c!29697 (= lt!81574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!157676 (= e!103270 e!103271)))

(assert (= (and d!50953 c!29699) b!157672))

(assert (= (and d!50953 (not c!29699)) b!157675))

(assert (= (and b!157675 c!29698) b!157674))

(assert (= (and b!157675 (not c!29698)) b!157676))

(assert (= (and b!157676 c!29697) b!157673))

(assert (= (and b!157676 (not c!29697)) b!157671))

(declare-fun m!190237 () Bool)

(assert (=> d!50953 m!190237))

(assert (=> d!50953 m!190205))

(declare-fun m!190239 () Bool)

(assert (=> d!50953 m!190239))

(declare-fun m!190241 () Bool)

(assert (=> d!50953 m!190241))

(declare-fun m!190243 () Bool)

(assert (=> d!50953 m!190243))

(declare-fun m!190245 () Bool)

(assert (=> d!50953 m!190245))

(assert (=> d!50953 m!190239))

(declare-fun m!190247 () Bool)

(assert (=> b!157671 m!190247))

(declare-fun m!190249 () Bool)

(assert (=> b!157675 m!190249))

(assert (=> b!157615 d!50953))

(declare-fun d!50955 () Bool)

(assert (=> d!50955 (= (validMask!0 (mask!7672 thiss!1248)) (and (or (= (mask!7672 thiss!1248) #b00000000000000000000000000000111) (= (mask!7672 thiss!1248) #b00000000000000000000000000001111) (= (mask!7672 thiss!1248) #b00000000000000000000000000011111) (= (mask!7672 thiss!1248) #b00000000000000000000000000111111) (= (mask!7672 thiss!1248) #b00000000000000000000000001111111) (= (mask!7672 thiss!1248) #b00000000000000000000000011111111) (= (mask!7672 thiss!1248) #b00000000000000000000000111111111) (= (mask!7672 thiss!1248) #b00000000000000000000001111111111) (= (mask!7672 thiss!1248) #b00000000000000000000011111111111) (= (mask!7672 thiss!1248) #b00000000000000000000111111111111) (= (mask!7672 thiss!1248) #b00000000000000000001111111111111) (= (mask!7672 thiss!1248) #b00000000000000000011111111111111) (= (mask!7672 thiss!1248) #b00000000000000000111111111111111) (= (mask!7672 thiss!1248) #b00000000000000001111111111111111) (= (mask!7672 thiss!1248) #b00000000000000011111111111111111) (= (mask!7672 thiss!1248) #b00000000000000111111111111111111) (= (mask!7672 thiss!1248) #b00000000000001111111111111111111) (= (mask!7672 thiss!1248) #b00000000000011111111111111111111) (= (mask!7672 thiss!1248) #b00000000000111111111111111111111) (= (mask!7672 thiss!1248) #b00000000001111111111111111111111) (= (mask!7672 thiss!1248) #b00000000011111111111111111111111) (= (mask!7672 thiss!1248) #b00000000111111111111111111111111) (= (mask!7672 thiss!1248) #b00000001111111111111111111111111) (= (mask!7672 thiss!1248) #b00000011111111111111111111111111) (= (mask!7672 thiss!1248) #b00000111111111111111111111111111) (= (mask!7672 thiss!1248) #b00001111111111111111111111111111) (= (mask!7672 thiss!1248) #b00011111111111111111111111111111) (= (mask!7672 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7672 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157611 d!50955))

(declare-fun d!50957 () Bool)

(declare-fun res!74487 () Bool)

(declare-fun e!103274 () Bool)

(assert (=> d!50957 (=> (not res!74487) (not e!103274))))

(declare-fun simpleValid!109 (LongMapFixedSize!1480) Bool)

(assert (=> d!50957 (= res!74487 (simpleValid!109 thiss!1248))))

(assert (=> d!50957 (= (valid!705 thiss!1248) e!103274)))

(declare-fun b!157683 () Bool)

(declare-fun res!74488 () Bool)

(assert (=> b!157683 (=> (not res!74488) (not e!103274))))

(declare-fun arrayCountValidKeys!0 (array!5559 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157683 (= res!74488 (= (arrayCountValidKeys!0 (_keys!4958 thiss!1248) #b00000000000000000000000000000000 (size!2913 (_keys!4958 thiss!1248))) (_size!789 thiss!1248)))))

(declare-fun b!157684 () Bool)

(declare-fun res!74489 () Bool)

(assert (=> b!157684 (=> (not res!74489) (not e!103274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5559 (_ BitVec 32)) Bool)

(assert (=> b!157684 (= res!74489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4958 thiss!1248) (mask!7672 thiss!1248)))))

(declare-fun b!157685 () Bool)

(declare-datatypes ((List!1883 0))(
  ( (Nil!1880) (Cons!1879 (h!2488 (_ BitVec 64)) (t!6676 List!1883)) )
))
(declare-fun arrayNoDuplicates!0 (array!5559 (_ BitVec 32) List!1883) Bool)

(assert (=> b!157685 (= e!103274 (arrayNoDuplicates!0 (_keys!4958 thiss!1248) #b00000000000000000000000000000000 Nil!1880))))

(assert (= (and d!50957 res!74487) b!157683))

(assert (= (and b!157683 res!74488) b!157684))

(assert (= (and b!157684 res!74489) b!157685))

(declare-fun m!190251 () Bool)

(assert (=> d!50957 m!190251))

(declare-fun m!190253 () Bool)

(assert (=> b!157683 m!190253))

(declare-fun m!190255 () Bool)

(assert (=> b!157684 m!190255))

(declare-fun m!190257 () Bool)

(assert (=> b!157685 m!190257))

(assert (=> start!15844 d!50957))

(declare-fun b!157692 () Bool)

(declare-fun e!103279 () Bool)

(assert (=> b!157692 (= e!103279 tp_is_empty!3259)))

(declare-fun b!157693 () Bool)

(declare-fun e!103280 () Bool)

(assert (=> b!157693 (= e!103280 tp_is_empty!3259)))

(declare-fun mapIsEmpty!5554 () Bool)

(declare-fun mapRes!5554 () Bool)

(assert (=> mapIsEmpty!5554 mapRes!5554))

(declare-fun mapNonEmpty!5554 () Bool)

(declare-fun tp!12925 () Bool)

(assert (=> mapNonEmpty!5554 (= mapRes!5554 (and tp!12925 e!103279))))

(declare-fun mapRest!5554 () (Array (_ BitVec 32) ValueCell!1286))

(declare-fun mapValue!5554 () ValueCell!1286)

(declare-fun mapKey!5554 () (_ BitVec 32))

(assert (=> mapNonEmpty!5554 (= mapRest!5545 (store mapRest!5554 mapKey!5554 mapValue!5554))))

(declare-fun condMapEmpty!5554 () Bool)

(declare-fun mapDefault!5554 () ValueCell!1286)

(assert (=> mapNonEmpty!5545 (= condMapEmpty!5554 (= mapRest!5545 ((as const (Array (_ BitVec 32) ValueCell!1286)) mapDefault!5554)))))

(assert (=> mapNonEmpty!5545 (= tp!12910 (and e!103280 mapRes!5554))))

(assert (= (and mapNonEmpty!5545 condMapEmpty!5554) mapIsEmpty!5554))

(assert (= (and mapNonEmpty!5545 (not condMapEmpty!5554)) mapNonEmpty!5554))

(assert (= (and mapNonEmpty!5554 ((_ is ValueCellFull!1286) mapValue!5554)) b!157692))

(assert (= (and mapNonEmpty!5545 ((_ is ValueCellFull!1286) mapDefault!5554)) b!157693))

(declare-fun m!190259 () Bool)

(assert (=> mapNonEmpty!5554 m!190259))

(check-sat tp_is_empty!3259 (not b_next!3457) (not mapNonEmpty!5554) (not d!50957) (not b!157684) (not b!157685) (not b!157683) (not b!157671) (not d!50953) b_and!9845)
(check-sat b_and!9845 (not b_next!3457))
