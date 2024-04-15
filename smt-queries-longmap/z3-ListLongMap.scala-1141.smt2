; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23580 () Bool)

(assert start!23580)

(declare-fun b!247662 () Bool)

(declare-fun b_free!6595 () Bool)

(declare-fun b_next!6595 () Bool)

(assert (=> b!247662 (= b_free!6595 (not b_next!6595))))

(declare-fun tp!23033 () Bool)

(declare-fun b_and!13571 () Bool)

(assert (=> b!247662 (= tp!23033 b_and!13571)))

(declare-fun b!247661 () Bool)

(declare-fun e!160671 () Bool)

(declare-fun e!160665 () Bool)

(assert (=> b!247661 (= e!160671 e!160665)))

(declare-fun res!121358 () Bool)

(assert (=> b!247661 (=> (not res!121358) (not e!160665))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8257 0))(
  ( (V!8258 (val!3273 Int)) )
))
(declare-datatypes ((ValueCell!2885 0))(
  ( (ValueCellFull!2885 (v!5325 V!8257)) (EmptyCell!2885) )
))
(declare-datatypes ((array!12213 0))(
  ( (array!12214 (arr!5793 (Array (_ BitVec 32) ValueCell!2885)) (size!6137 (_ BitVec 32))) )
))
(declare-datatypes ((array!12215 0))(
  ( (array!12216 (arr!5794 (Array (_ BitVec 32) (_ BitVec 64))) (size!6138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3670 0))(
  ( (LongMapFixedSize!3671 (defaultEntry!4584 Int) (mask!10725 (_ BitVec 32)) (extraKeys!4321 (_ BitVec 32)) (zeroValue!4425 V!8257) (minValue!4425 V!8257) (_size!1884 (_ BitVec 32)) (_keys!6705 array!12215) (_values!4567 array!12213) (_vacant!1884 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3670)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247661 (= res!121358 (inRange!0 index!297 (mask!10725 thiss!1504)))))

(declare-datatypes ((Unit!7658 0))(
  ( (Unit!7659) )
))
(declare-fun lt!123912 () Unit!7658)

(declare-fun e!160666 () Unit!7658)

(assert (=> b!247661 (= lt!123912 e!160666)))

(declare-fun c!41471 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4784 0))(
  ( (tuple2!4785 (_1!2403 (_ BitVec 64)) (_2!2403 V!8257)) )
))
(declare-datatypes ((List!3686 0))(
  ( (Nil!3683) (Cons!3682 (h!4340 tuple2!4784) (t!8700 List!3686)) )
))
(declare-datatypes ((ListLongMap!3687 0))(
  ( (ListLongMap!3688 (toList!1859 List!3686)) )
))
(declare-fun contains!1778 (ListLongMap!3687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1368 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 32) Int) ListLongMap!3687)

(assert (=> b!247661 (= c!41471 (contains!1778 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) key!932))))

(declare-fun e!160660 () Bool)

(declare-fun e!160669 () Bool)

(declare-fun tp_is_empty!6457 () Bool)

(declare-fun array_inv!3823 (array!12215) Bool)

(declare-fun array_inv!3824 (array!12213) Bool)

(assert (=> b!247662 (= e!160669 (and tp!23033 tp_is_empty!6457 (array_inv!3823 (_keys!6705 thiss!1504)) (array_inv!3824 (_values!4567 thiss!1504)) e!160660))))

(declare-fun b!247663 () Bool)

(declare-fun e!160658 () Bool)

(declare-fun call!23182 () Bool)

(assert (=> b!247663 (= e!160658 (not call!23182))))

(declare-fun b!247664 () Bool)

(declare-fun e!160659 () Bool)

(declare-fun e!160672 () Bool)

(assert (=> b!247664 (= e!160659 e!160672)))

(declare-fun res!121360 () Bool)

(declare-fun call!23183 () Bool)

(assert (=> b!247664 (= res!121360 call!23183)))

(assert (=> b!247664 (=> (not res!121360) (not e!160672))))

(declare-fun b!247665 () Bool)

(declare-fun res!121353 () Bool)

(declare-datatypes ((SeekEntryResult!1105 0))(
  ( (MissingZero!1105 (index!6590 (_ BitVec 32))) (Found!1105 (index!6591 (_ BitVec 32))) (Intermediate!1105 (undefined!1917 Bool) (index!6592 (_ BitVec 32)) (x!24548 (_ BitVec 32))) (Undefined!1105) (MissingVacant!1105 (index!6593 (_ BitVec 32))) )
))
(declare-fun lt!123919 () SeekEntryResult!1105)

(assert (=> b!247665 (= res!121353 (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6593 lt!123919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247665 (=> (not res!121353) (not e!160672))))

(declare-fun b!247666 () Bool)

(declare-fun e!160661 () Unit!7658)

(declare-fun Unit!7660 () Unit!7658)

(assert (=> b!247666 (= e!160661 Unit!7660)))

(declare-fun b!247667 () Bool)

(declare-fun c!41469 () Bool)

(get-info :version)

(assert (=> b!247667 (= c!41469 ((_ is MissingVacant!1105) lt!123919))))

(declare-fun e!160667 () Bool)

(assert (=> b!247667 (= e!160667 e!160659)))

(declare-fun res!121362 () Bool)

(declare-fun e!160663 () Bool)

(assert (=> start!23580 (=> (not res!121362) (not e!160663))))

(declare-fun valid!1443 (LongMapFixedSize!3670) Bool)

(assert (=> start!23580 (= res!121362 (valid!1443 thiss!1504))))

(assert (=> start!23580 e!160663))

(assert (=> start!23580 e!160669))

(assert (=> start!23580 true))

(declare-fun mapNonEmpty!10961 () Bool)

(declare-fun mapRes!10961 () Bool)

(declare-fun tp!23032 () Bool)

(declare-fun e!160664 () Bool)

(assert (=> mapNonEmpty!10961 (= mapRes!10961 (and tp!23032 e!160664))))

(declare-fun mapValue!10961 () ValueCell!2885)

(declare-fun mapKey!10961 () (_ BitVec 32))

(declare-fun mapRest!10961 () (Array (_ BitVec 32) ValueCell!2885))

(assert (=> mapNonEmpty!10961 (= (arr!5793 (_values!4567 thiss!1504)) (store mapRest!10961 mapKey!10961 mapValue!10961))))

(declare-fun b!247668 () Bool)

(declare-fun Unit!7661 () Unit!7658)

(assert (=> b!247668 (= e!160666 Unit!7661)))

(declare-fun lt!123911 () Unit!7658)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!390 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7658)

(assert (=> b!247668 (= lt!123911 (lemmaInListMapThenSeekEntryOrOpenFindsIt!390 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> b!247668 false))

(declare-fun b!247669 () Bool)

(declare-fun e!160668 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12215 (_ BitVec 32)) Bool)

(assert (=> b!247669 (= e!160668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun b!247670 () Bool)

(declare-fun res!121357 () Bool)

(assert (=> b!247670 (=> res!121357 e!160668)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247670 (= res!121357 (not (validKeyInArray!0 key!932)))))

(declare-fun b!247671 () Bool)

(assert (=> b!247671 (= e!160663 e!160671)))

(declare-fun res!121361 () Bool)

(assert (=> b!247671 (=> (not res!121361) (not e!160671))))

(assert (=> b!247671 (= res!121361 (or (= lt!123919 (MissingZero!1105 index!297)) (= lt!123919 (MissingVacant!1105 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12215 (_ BitVec 32)) SeekEntryResult!1105)

(assert (=> b!247671 (= lt!123919 (seekEntryOrOpen!0 key!932 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun b!247672 () Bool)

(assert (=> b!247672 (= e!160659 ((_ is Undefined!1105) lt!123919))))

(declare-fun b!247673 () Bool)

(declare-fun lt!123917 () Unit!7658)

(assert (=> b!247673 (= e!160666 lt!123917)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!387 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7658)

(assert (=> b!247673 (= lt!123917 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!387 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(declare-fun c!41472 () Bool)

(assert (=> b!247673 (= c!41472 ((_ is MissingZero!1105) lt!123919))))

(assert (=> b!247673 e!160667))

(declare-fun b!247674 () Bool)

(assert (=> b!247674 (= e!160664 tp_is_empty!6457)))

(declare-fun b!247675 () Bool)

(assert (=> b!247675 (= e!160665 (not e!160668))))

(declare-fun res!121355 () Bool)

(assert (=> b!247675 (=> res!121355 e!160668)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247675 (= res!121355 (not (validMask!0 (mask!10725 thiss!1504))))))

(declare-fun lt!123913 () array!12215)

(declare-fun arrayCountValidKeys!0 (array!12215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247675 (= (arrayCountValidKeys!0 lt!123913 #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6705 thiss!1504) #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504)))))))

(declare-fun lt!123914 () Unit!7658)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12215 (_ BitVec 32) (_ BitVec 64)) Unit!7658)

(assert (=> b!247675 (= lt!123914 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6705 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3687 0))(
  ( (Nil!3684) (Cons!3683 (h!4341 (_ BitVec 64)) (t!8701 List!3687)) )
))
(declare-fun arrayNoDuplicates!0 (array!12215 (_ BitVec 32) List!3687) Bool)

(assert (=> b!247675 (arrayNoDuplicates!0 lt!123913 #b00000000000000000000000000000000 Nil!3684)))

(assert (=> b!247675 (= lt!123913 (array!12216 (store (arr!5794 (_keys!6705 thiss!1504)) index!297 key!932) (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun lt!123920 () Unit!7658)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3687) Unit!7658)

(assert (=> b!247675 (= lt!123920 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6705 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3684))))

(declare-fun lt!123915 () Unit!7658)

(assert (=> b!247675 (= lt!123915 e!160661)))

(declare-fun c!41470 () Bool)

(declare-fun lt!123918 () Bool)

(assert (=> b!247675 (= c!41470 lt!123918)))

(declare-fun arrayContainsKey!0 (array!12215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247675 (= lt!123918 (arrayContainsKey!0 (_keys!6705 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247676 () Bool)

(declare-fun e!160670 () Bool)

(assert (=> b!247676 (= e!160670 tp_is_empty!6457)))

(declare-fun b!247677 () Bool)

(declare-fun res!121359 () Bool)

(assert (=> b!247677 (=> (not res!121359) (not e!160658))))

(assert (=> b!247677 (= res!121359 call!23183)))

(assert (=> b!247677 (= e!160667 e!160658)))

(declare-fun b!247678 () Bool)

(declare-fun res!121354 () Bool)

(assert (=> b!247678 (=> (not res!121354) (not e!160663))))

(assert (=> b!247678 (= res!121354 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247679 () Bool)

(declare-fun res!121364 () Bool)

(assert (=> b!247679 (=> res!121364 e!160668)))

(assert (=> b!247679 (= res!121364 (or (not (= (size!6138 (_keys!6705 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10725 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6138 (_keys!6705 thiss!1504)))))))

(declare-fun mapIsEmpty!10961 () Bool)

(assert (=> mapIsEmpty!10961 mapRes!10961))

(declare-fun b!247680 () Bool)

(declare-fun Unit!7662 () Unit!7658)

(assert (=> b!247680 (= e!160661 Unit!7662)))

(declare-fun lt!123916 () Unit!7658)

(declare-fun lemmaArrayContainsKeyThenInListMap!199 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) (_ BitVec 32) Int) Unit!7658)

(assert (=> b!247680 (= lt!123916 (lemmaArrayContainsKeyThenInListMap!199 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(assert (=> b!247680 false))

(declare-fun b!247681 () Bool)

(assert (=> b!247681 (= e!160672 (not call!23182))))

(declare-fun bm!23179 () Bool)

(assert (=> bm!23179 (= call!23182 (arrayContainsKey!0 (_keys!6705 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247682 () Bool)

(assert (=> b!247682 (= e!160660 (and e!160670 mapRes!10961))))

(declare-fun condMapEmpty!10961 () Bool)

(declare-fun mapDefault!10961 () ValueCell!2885)

(assert (=> b!247682 (= condMapEmpty!10961 (= (arr!5793 (_values!4567 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2885)) mapDefault!10961)))))

(declare-fun b!247683 () Bool)

(declare-fun res!121356 () Bool)

(assert (=> b!247683 (=> res!121356 e!160668)))

(assert (=> b!247683 (= res!121356 lt!123918)))

(declare-fun b!247684 () Bool)

(declare-fun res!121363 () Bool)

(assert (=> b!247684 (=> (not res!121363) (not e!160658))))

(assert (=> b!247684 (= res!121363 (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6590 lt!123919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23180 () Bool)

(assert (=> bm!23180 (= call!23183 (inRange!0 (ite c!41472 (index!6590 lt!123919) (index!6593 lt!123919)) (mask!10725 thiss!1504)))))

(assert (= (and start!23580 res!121362) b!247678))

(assert (= (and b!247678 res!121354) b!247671))

(assert (= (and b!247671 res!121361) b!247661))

(assert (= (and b!247661 c!41471) b!247668))

(assert (= (and b!247661 (not c!41471)) b!247673))

(assert (= (and b!247673 c!41472) b!247677))

(assert (= (and b!247673 (not c!41472)) b!247667))

(assert (= (and b!247677 res!121359) b!247684))

(assert (= (and b!247684 res!121363) b!247663))

(assert (= (and b!247667 c!41469) b!247664))

(assert (= (and b!247667 (not c!41469)) b!247672))

(assert (= (and b!247664 res!121360) b!247665))

(assert (= (and b!247665 res!121353) b!247681))

(assert (= (or b!247677 b!247664) bm!23180))

(assert (= (or b!247663 b!247681) bm!23179))

(assert (= (and b!247661 res!121358) b!247675))

(assert (= (and b!247675 c!41470) b!247680))

(assert (= (and b!247675 (not c!41470)) b!247666))

(assert (= (and b!247675 (not res!121355)) b!247679))

(assert (= (and b!247679 (not res!121364)) b!247670))

(assert (= (and b!247670 (not res!121357)) b!247683))

(assert (= (and b!247683 (not res!121356)) b!247669))

(assert (= (and b!247682 condMapEmpty!10961) mapIsEmpty!10961))

(assert (= (and b!247682 (not condMapEmpty!10961)) mapNonEmpty!10961))

(assert (= (and mapNonEmpty!10961 ((_ is ValueCellFull!2885) mapValue!10961)) b!247674))

(assert (= (and b!247682 ((_ is ValueCellFull!2885) mapDefault!10961)) b!247676))

(assert (= b!247662 b!247682))

(assert (= start!23580 b!247662))

(declare-fun m!264141 () Bool)

(assert (=> b!247662 m!264141))

(declare-fun m!264143 () Bool)

(assert (=> b!247662 m!264143))

(declare-fun m!264145 () Bool)

(assert (=> mapNonEmpty!10961 m!264145))

(declare-fun m!264147 () Bool)

(assert (=> b!247673 m!264147))

(declare-fun m!264149 () Bool)

(assert (=> b!247670 m!264149))

(declare-fun m!264151 () Bool)

(assert (=> bm!23180 m!264151))

(declare-fun m!264153 () Bool)

(assert (=> b!247669 m!264153))

(declare-fun m!264155 () Bool)

(assert (=> bm!23179 m!264155))

(declare-fun m!264157 () Bool)

(assert (=> b!247668 m!264157))

(declare-fun m!264159 () Bool)

(assert (=> b!247665 m!264159))

(declare-fun m!264161 () Bool)

(assert (=> b!247684 m!264161))

(declare-fun m!264163 () Bool)

(assert (=> b!247671 m!264163))

(declare-fun m!264165 () Bool)

(assert (=> start!23580 m!264165))

(declare-fun m!264167 () Bool)

(assert (=> b!247661 m!264167))

(declare-fun m!264169 () Bool)

(assert (=> b!247661 m!264169))

(assert (=> b!247661 m!264169))

(declare-fun m!264171 () Bool)

(assert (=> b!247661 m!264171))

(declare-fun m!264173 () Bool)

(assert (=> b!247675 m!264173))

(assert (=> b!247675 m!264155))

(declare-fun m!264175 () Bool)

(assert (=> b!247675 m!264175))

(declare-fun m!264177 () Bool)

(assert (=> b!247675 m!264177))

(declare-fun m!264179 () Bool)

(assert (=> b!247675 m!264179))

(declare-fun m!264181 () Bool)

(assert (=> b!247675 m!264181))

(declare-fun m!264183 () Bool)

(assert (=> b!247675 m!264183))

(declare-fun m!264185 () Bool)

(assert (=> b!247675 m!264185))

(declare-fun m!264187 () Bool)

(assert (=> b!247680 m!264187))

(check-sat (not b!247673) (not b!247675) (not b!247669) (not b!247668) (not mapNonEmpty!10961) (not bm!23179) (not b!247670) (not b!247680) (not b!247662) (not b_next!6595) (not start!23580) tp_is_empty!6457 (not bm!23180) b_and!13571 (not b!247671) (not b!247661))
(check-sat b_and!13571 (not b_next!6595))
(get-model)

(declare-fun b!247841 () Bool)

(declare-fun c!41505 () Bool)

(declare-fun lt!123988 () (_ BitVec 64))

(assert (=> b!247841 (= c!41505 (= lt!123988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160770 () SeekEntryResult!1105)

(declare-fun e!160769 () SeekEntryResult!1105)

(assert (=> b!247841 (= e!160770 e!160769)))

(declare-fun b!247842 () Bool)

(declare-fun lt!123987 () SeekEntryResult!1105)

(assert (=> b!247842 (= e!160770 (Found!1105 (index!6592 lt!123987)))))

(declare-fun b!247844 () Bool)

(assert (=> b!247844 (= e!160769 (MissingZero!1105 (index!6592 lt!123987)))))

(declare-fun b!247845 () Bool)

(declare-fun e!160771 () SeekEntryResult!1105)

(assert (=> b!247845 (= e!160771 e!160770)))

(assert (=> b!247845 (= lt!123988 (select (arr!5794 (_keys!6705 thiss!1504)) (index!6592 lt!123987)))))

(declare-fun c!41503 () Bool)

(assert (=> b!247845 (= c!41503 (= lt!123988 key!932))))

(declare-fun b!247846 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12215 (_ BitVec 32)) SeekEntryResult!1105)

(assert (=> b!247846 (= e!160769 (seekKeyOrZeroReturnVacant!0 (x!24548 lt!123987) (index!6592 lt!123987) (index!6592 lt!123987) key!932 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun b!247843 () Bool)

(assert (=> b!247843 (= e!160771 Undefined!1105)))

(declare-fun d!60335 () Bool)

(declare-fun lt!123989 () SeekEntryResult!1105)

(assert (=> d!60335 (and (or ((_ is Undefined!1105) lt!123989) (not ((_ is Found!1105) lt!123989)) (and (bvsge (index!6591 lt!123989) #b00000000000000000000000000000000) (bvslt (index!6591 lt!123989) (size!6138 (_keys!6705 thiss!1504))))) (or ((_ is Undefined!1105) lt!123989) ((_ is Found!1105) lt!123989) (not ((_ is MissingZero!1105) lt!123989)) (and (bvsge (index!6590 lt!123989) #b00000000000000000000000000000000) (bvslt (index!6590 lt!123989) (size!6138 (_keys!6705 thiss!1504))))) (or ((_ is Undefined!1105) lt!123989) ((_ is Found!1105) lt!123989) ((_ is MissingZero!1105) lt!123989) (not ((_ is MissingVacant!1105) lt!123989)) (and (bvsge (index!6593 lt!123989) #b00000000000000000000000000000000) (bvslt (index!6593 lt!123989) (size!6138 (_keys!6705 thiss!1504))))) (or ((_ is Undefined!1105) lt!123989) (ite ((_ is Found!1105) lt!123989) (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6591 lt!123989)) key!932) (ite ((_ is MissingZero!1105) lt!123989) (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6590 lt!123989)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1105) lt!123989) (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6593 lt!123989)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60335 (= lt!123989 e!160771)))

(declare-fun c!41504 () Bool)

(assert (=> d!60335 (= c!41504 (and ((_ is Intermediate!1105) lt!123987) (undefined!1917 lt!123987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12215 (_ BitVec 32)) SeekEntryResult!1105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60335 (= lt!123987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10725 thiss!1504)) key!932 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(assert (=> d!60335 (validMask!0 (mask!10725 thiss!1504))))

(assert (=> d!60335 (= (seekEntryOrOpen!0 key!932 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)) lt!123989)))

(assert (= (and d!60335 c!41504) b!247843))

(assert (= (and d!60335 (not c!41504)) b!247845))

(assert (= (and b!247845 c!41503) b!247842))

(assert (= (and b!247845 (not c!41503)) b!247841))

(assert (= (and b!247841 c!41505) b!247844))

(assert (= (and b!247841 (not c!41505)) b!247846))

(declare-fun m!264285 () Bool)

(assert (=> b!247845 m!264285))

(declare-fun m!264287 () Bool)

(assert (=> b!247846 m!264287))

(declare-fun m!264289 () Bool)

(assert (=> d!60335 m!264289))

(declare-fun m!264291 () Bool)

(assert (=> d!60335 m!264291))

(declare-fun m!264293 () Bool)

(assert (=> d!60335 m!264293))

(assert (=> d!60335 m!264173))

(assert (=> d!60335 m!264293))

(declare-fun m!264295 () Bool)

(assert (=> d!60335 m!264295))

(declare-fun m!264297 () Bool)

(assert (=> d!60335 m!264297))

(assert (=> b!247671 d!60335))

(declare-fun d!60337 () Bool)

(assert (=> d!60337 (= (inRange!0 index!297 (mask!10725 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10725 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!247661 d!60337))

(declare-fun d!60339 () Bool)

(declare-fun e!160777 () Bool)

(assert (=> d!60339 e!160777))

(declare-fun res!121439 () Bool)

(assert (=> d!60339 (=> res!121439 e!160777)))

(declare-fun lt!123998 () Bool)

(assert (=> d!60339 (= res!121439 (not lt!123998))))

(declare-fun lt!123999 () Bool)

(assert (=> d!60339 (= lt!123998 lt!123999)))

(declare-fun lt!124001 () Unit!7658)

(declare-fun e!160776 () Unit!7658)

(assert (=> d!60339 (= lt!124001 e!160776)))

(declare-fun c!41508 () Bool)

(assert (=> d!60339 (= c!41508 lt!123999)))

(declare-fun containsKey!283 (List!3686 (_ BitVec 64)) Bool)

(assert (=> d!60339 (= lt!123999 (containsKey!283 (toList!1859 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932))))

(assert (=> d!60339 (= (contains!1778 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) key!932) lt!123998)))

(declare-fun b!247853 () Bool)

(declare-fun lt!124000 () Unit!7658)

(assert (=> b!247853 (= e!160776 lt!124000)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!232 (List!3686 (_ BitVec 64)) Unit!7658)

(assert (=> b!247853 (= lt!124000 (lemmaContainsKeyImpliesGetValueByKeyDefined!232 (toList!1859 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932))))

(declare-datatypes ((Option!297 0))(
  ( (Some!296 (v!5328 V!8257)) (None!295) )
))
(declare-fun isDefined!233 (Option!297) Bool)

(declare-fun getValueByKey!291 (List!3686 (_ BitVec 64)) Option!297)

(assert (=> b!247853 (isDefined!233 (getValueByKey!291 (toList!1859 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932))))

(declare-fun b!247854 () Bool)

(declare-fun Unit!7666 () Unit!7658)

(assert (=> b!247854 (= e!160776 Unit!7666)))

(declare-fun b!247855 () Bool)

(assert (=> b!247855 (= e!160777 (isDefined!233 (getValueByKey!291 (toList!1859 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932)))))

(assert (= (and d!60339 c!41508) b!247853))

(assert (= (and d!60339 (not c!41508)) b!247854))

(assert (= (and d!60339 (not res!121439)) b!247855))

(declare-fun m!264299 () Bool)

(assert (=> d!60339 m!264299))

(declare-fun m!264301 () Bool)

(assert (=> b!247853 m!264301))

(declare-fun m!264303 () Bool)

(assert (=> b!247853 m!264303))

(assert (=> b!247853 m!264303))

(declare-fun m!264305 () Bool)

(assert (=> b!247853 m!264305))

(assert (=> b!247855 m!264303))

(assert (=> b!247855 m!264303))

(assert (=> b!247855 m!264305))

(assert (=> b!247661 d!60339))

(declare-fun b!247898 () Bool)

(declare-fun e!160805 () Bool)

(declare-fun e!160809 () Bool)

(assert (=> b!247898 (= e!160805 e!160809)))

(declare-fun res!121458 () Bool)

(assert (=> b!247898 (=> (not res!121458) (not e!160809))))

(declare-fun lt!124046 () ListLongMap!3687)

(assert (=> b!247898 (= res!121458 (contains!1778 lt!124046 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!247898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun b!247899 () Bool)

(declare-fun e!160814 () Bool)

(declare-fun apply!235 (ListLongMap!3687 (_ BitVec 64)) V!8257)

(assert (=> b!247899 (= e!160814 (= (apply!235 lt!124046 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4425 thiss!1504)))))

(declare-fun bm!23207 () Bool)

(declare-fun call!23213 () ListLongMap!3687)

(declare-fun getCurrentListMapNoExtraKeys!551 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 32) Int) ListLongMap!3687)

(assert (=> bm!23207 (= call!23213 (getCurrentListMapNoExtraKeys!551 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun b!247900 () Bool)

(declare-fun res!121461 () Bool)

(declare-fun e!160807 () Bool)

(assert (=> b!247900 (=> (not res!121461) (not e!160807))))

(assert (=> b!247900 (= res!121461 e!160805)))

(declare-fun res!121459 () Bool)

(assert (=> b!247900 (=> res!121459 e!160805)))

(declare-fun e!160815 () Bool)

(assert (=> b!247900 (= res!121459 (not e!160815))))

(declare-fun res!121460 () Bool)

(assert (=> b!247900 (=> (not res!121460) (not e!160815))))

(assert (=> b!247900 (= res!121460 (bvslt #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun bm!23208 () Bool)

(declare-fun call!23216 () ListLongMap!3687)

(assert (=> bm!23208 (= call!23216 call!23213)))

(declare-fun call!23215 () ListLongMap!3687)

(declare-fun bm!23209 () Bool)

(declare-fun call!23210 () ListLongMap!3687)

(declare-fun c!41526 () Bool)

(declare-fun c!41522 () Bool)

(declare-fun +!668 (ListLongMap!3687 tuple2!4784) ListLongMap!3687)

(assert (=> bm!23209 (= call!23210 (+!668 (ite c!41526 call!23213 (ite c!41522 call!23216 call!23215)) (ite (or c!41526 c!41522) (tuple2!4785 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4425 thiss!1504)) (tuple2!4785 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4425 thiss!1504)))))))

(declare-fun b!247901 () Bool)

(declare-fun e!160810 () ListLongMap!3687)

(declare-fun e!160811 () ListLongMap!3687)

(assert (=> b!247901 (= e!160810 e!160811)))

(assert (=> b!247901 (= c!41522 (and (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23210 () Bool)

(declare-fun call!23212 () Bool)

(assert (=> bm!23210 (= call!23212 (contains!1778 lt!124046 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247902 () Bool)

(declare-fun e!160806 () Bool)

(declare-fun call!23214 () Bool)

(assert (=> b!247902 (= e!160806 (not call!23214))))

(declare-fun bm!23211 () Bool)

(declare-fun call!23211 () ListLongMap!3687)

(assert (=> bm!23211 (= call!23211 call!23210)))

(declare-fun b!247903 () Bool)

(declare-fun c!41525 () Bool)

(assert (=> b!247903 (= c!41525 (and (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!160816 () ListLongMap!3687)

(assert (=> b!247903 (= e!160811 e!160816)))

(declare-fun b!247904 () Bool)

(declare-fun e!160808 () Unit!7658)

(declare-fun Unit!7667 () Unit!7658)

(assert (=> b!247904 (= e!160808 Unit!7667)))

(declare-fun b!247906 () Bool)

(declare-fun e!160813 () Bool)

(declare-fun e!160812 () Bool)

(assert (=> b!247906 (= e!160813 e!160812)))

(declare-fun res!121466 () Bool)

(assert (=> b!247906 (= res!121466 call!23212)))

(assert (=> b!247906 (=> (not res!121466) (not e!160812))))

(declare-fun b!247907 () Bool)

(assert (=> b!247907 (= e!160810 (+!668 call!23210 (tuple2!4785 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4425 thiss!1504))))))

(declare-fun bm!23212 () Bool)

(assert (=> bm!23212 (= call!23214 (contains!1778 lt!124046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247908 () Bool)

(assert (=> b!247908 (= e!160813 (not call!23212))))

(declare-fun b!247909 () Bool)

(assert (=> b!247909 (= e!160811 call!23211)))

(declare-fun b!247910 () Bool)

(declare-fun e!160804 () Bool)

(assert (=> b!247910 (= e!160804 (validKeyInArray!0 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247911 () Bool)

(declare-fun lt!124055 () Unit!7658)

(assert (=> b!247911 (= e!160808 lt!124055)))

(declare-fun lt!124050 () ListLongMap!3687)

(assert (=> b!247911 (= lt!124050 (getCurrentListMapNoExtraKeys!551 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124054 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124048 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124048 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124066 () Unit!7658)

(declare-fun addStillContains!211 (ListLongMap!3687 (_ BitVec 64) V!8257 (_ BitVec 64)) Unit!7658)

(assert (=> b!247911 (= lt!124066 (addStillContains!211 lt!124050 lt!124054 (zeroValue!4425 thiss!1504) lt!124048))))

(assert (=> b!247911 (contains!1778 (+!668 lt!124050 (tuple2!4785 lt!124054 (zeroValue!4425 thiss!1504))) lt!124048)))

(declare-fun lt!124052 () Unit!7658)

(assert (=> b!247911 (= lt!124052 lt!124066)))

(declare-fun lt!124060 () ListLongMap!3687)

(assert (=> b!247911 (= lt!124060 (getCurrentListMapNoExtraKeys!551 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124058 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124064 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124064 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124056 () Unit!7658)

(declare-fun addApplyDifferent!211 (ListLongMap!3687 (_ BitVec 64) V!8257 (_ BitVec 64)) Unit!7658)

(assert (=> b!247911 (= lt!124056 (addApplyDifferent!211 lt!124060 lt!124058 (minValue!4425 thiss!1504) lt!124064))))

(assert (=> b!247911 (= (apply!235 (+!668 lt!124060 (tuple2!4785 lt!124058 (minValue!4425 thiss!1504))) lt!124064) (apply!235 lt!124060 lt!124064))))

(declare-fun lt!124049 () Unit!7658)

(assert (=> b!247911 (= lt!124049 lt!124056)))

(declare-fun lt!124047 () ListLongMap!3687)

(assert (=> b!247911 (= lt!124047 (getCurrentListMapNoExtraKeys!551 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124059 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124053 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124053 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124061 () Unit!7658)

(assert (=> b!247911 (= lt!124061 (addApplyDifferent!211 lt!124047 lt!124059 (zeroValue!4425 thiss!1504) lt!124053))))

(assert (=> b!247911 (= (apply!235 (+!668 lt!124047 (tuple2!4785 lt!124059 (zeroValue!4425 thiss!1504))) lt!124053) (apply!235 lt!124047 lt!124053))))

(declare-fun lt!124063 () Unit!7658)

(assert (=> b!247911 (= lt!124063 lt!124061)))

(declare-fun lt!124067 () ListLongMap!3687)

(assert (=> b!247911 (= lt!124067 (getCurrentListMapNoExtraKeys!551 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124051 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124057 () (_ BitVec 64))

(assert (=> b!247911 (= lt!124057 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247911 (= lt!124055 (addApplyDifferent!211 lt!124067 lt!124051 (minValue!4425 thiss!1504) lt!124057))))

(assert (=> b!247911 (= (apply!235 (+!668 lt!124067 (tuple2!4785 lt!124051 (minValue!4425 thiss!1504))) lt!124057) (apply!235 lt!124067 lt!124057))))

(declare-fun b!247912 () Bool)

(assert (=> b!247912 (= e!160806 e!160814)))

(declare-fun res!121463 () Bool)

(assert (=> b!247912 (= res!121463 call!23214)))

(assert (=> b!247912 (=> (not res!121463) (not e!160814))))

(declare-fun b!247913 () Bool)

(assert (=> b!247913 (= e!160812 (= (apply!235 lt!124046 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4425 thiss!1504)))))

(declare-fun b!247914 () Bool)

(assert (=> b!247914 (= e!160816 call!23211)))

(declare-fun b!247915 () Bool)

(assert (=> b!247915 (= e!160807 e!160813)))

(declare-fun c!41524 () Bool)

(assert (=> b!247915 (= c!41524 (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!247916 () Bool)

(assert (=> b!247916 (= e!160816 call!23215)))

(declare-fun b!247917 () Bool)

(declare-fun get!2970 (ValueCell!2885 V!8257) V!8257)

(declare-fun dynLambda!569 (Int (_ BitVec 64)) V!8257)

(assert (=> b!247917 (= e!160809 (= (apply!235 lt!124046 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)) (get!2970 (select (arr!5793 (_values!4567 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!569 (defaultEntry!4584 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247917 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6137 (_values!4567 thiss!1504))))))

(assert (=> b!247917 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun bm!23213 () Bool)

(assert (=> bm!23213 (= call!23215 call!23216)))

(declare-fun b!247918 () Bool)

(assert (=> b!247918 (= e!160815 (validKeyInArray!0 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60341 () Bool)

(assert (=> d!60341 e!160807))

(declare-fun res!121464 () Bool)

(assert (=> d!60341 (=> (not res!121464) (not e!160807))))

(assert (=> d!60341 (= res!121464 (or (bvsge #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))))

(declare-fun lt!124062 () ListLongMap!3687)

(assert (=> d!60341 (= lt!124046 lt!124062)))

(declare-fun lt!124065 () Unit!7658)

(assert (=> d!60341 (= lt!124065 e!160808)))

(declare-fun c!41523 () Bool)

(assert (=> d!60341 (= c!41523 e!160804)))

(declare-fun res!121462 () Bool)

(assert (=> d!60341 (=> (not res!121462) (not e!160804))))

(assert (=> d!60341 (= res!121462 (bvslt #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(assert (=> d!60341 (= lt!124062 e!160810)))

(assert (=> d!60341 (= c!41526 (and (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60341 (validMask!0 (mask!10725 thiss!1504))))

(assert (=> d!60341 (= (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) lt!124046)))

(declare-fun b!247905 () Bool)

(declare-fun res!121465 () Bool)

(assert (=> b!247905 (=> (not res!121465) (not e!160807))))

(assert (=> b!247905 (= res!121465 e!160806)))

(declare-fun c!41521 () Bool)

(assert (=> b!247905 (= c!41521 (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!60341 c!41526) b!247907))

(assert (= (and d!60341 (not c!41526)) b!247901))

(assert (= (and b!247901 c!41522) b!247909))

(assert (= (and b!247901 (not c!41522)) b!247903))

(assert (= (and b!247903 c!41525) b!247914))

(assert (= (and b!247903 (not c!41525)) b!247916))

(assert (= (or b!247914 b!247916) bm!23213))

(assert (= (or b!247909 bm!23213) bm!23208))

(assert (= (or b!247909 b!247914) bm!23211))

(assert (= (or b!247907 bm!23208) bm!23207))

(assert (= (or b!247907 bm!23211) bm!23209))

(assert (= (and d!60341 res!121462) b!247910))

(assert (= (and d!60341 c!41523) b!247911))

(assert (= (and d!60341 (not c!41523)) b!247904))

(assert (= (and d!60341 res!121464) b!247900))

(assert (= (and b!247900 res!121460) b!247918))

(assert (= (and b!247900 (not res!121459)) b!247898))

(assert (= (and b!247898 res!121458) b!247917))

(assert (= (and b!247900 res!121461) b!247905))

(assert (= (and b!247905 c!41521) b!247912))

(assert (= (and b!247905 (not c!41521)) b!247902))

(assert (= (and b!247912 res!121463) b!247899))

(assert (= (or b!247912 b!247902) bm!23212))

(assert (= (and b!247905 res!121465) b!247915))

(assert (= (and b!247915 c!41524) b!247906))

(assert (= (and b!247915 (not c!41524)) b!247908))

(assert (= (and b!247906 res!121466) b!247913))

(assert (= (or b!247906 b!247908) bm!23210))

(declare-fun b_lambda!8033 () Bool)

(assert (=> (not b_lambda!8033) (not b!247917)))

(declare-fun t!8703 () Bool)

(declare-fun tb!2975 () Bool)

(assert (=> (and b!247662 (= (defaultEntry!4584 thiss!1504) (defaultEntry!4584 thiss!1504)) t!8703) tb!2975))

(declare-fun result!5263 () Bool)

(assert (=> tb!2975 (= result!5263 tp_is_empty!6457)))

(assert (=> b!247917 t!8703))

(declare-fun b_and!13577 () Bool)

(assert (= b_and!13571 (and (=> t!8703 result!5263) b_and!13577)))

(declare-fun m!264307 () Bool)

(assert (=> bm!23207 m!264307))

(declare-fun m!264309 () Bool)

(assert (=> b!247911 m!264309))

(declare-fun m!264311 () Bool)

(assert (=> b!247911 m!264311))

(declare-fun m!264313 () Bool)

(assert (=> b!247911 m!264313))

(declare-fun m!264315 () Bool)

(assert (=> b!247911 m!264315))

(declare-fun m!264317 () Bool)

(assert (=> b!247911 m!264317))

(declare-fun m!264319 () Bool)

(assert (=> b!247911 m!264319))

(assert (=> b!247911 m!264307))

(declare-fun m!264321 () Bool)

(assert (=> b!247911 m!264321))

(assert (=> b!247911 m!264309))

(declare-fun m!264323 () Bool)

(assert (=> b!247911 m!264323))

(declare-fun m!264325 () Bool)

(assert (=> b!247911 m!264325))

(declare-fun m!264327 () Bool)

(assert (=> b!247911 m!264327))

(declare-fun m!264329 () Bool)

(assert (=> b!247911 m!264329))

(declare-fun m!264331 () Bool)

(assert (=> b!247911 m!264331))

(assert (=> b!247911 m!264327))

(declare-fun m!264333 () Bool)

(assert (=> b!247911 m!264333))

(declare-fun m!264335 () Bool)

(assert (=> b!247911 m!264335))

(assert (=> b!247911 m!264315))

(assert (=> b!247911 m!264321))

(declare-fun m!264337 () Bool)

(assert (=> b!247911 m!264337))

(declare-fun m!264339 () Bool)

(assert (=> b!247911 m!264339))

(declare-fun m!264341 () Bool)

(assert (=> b!247913 m!264341))

(declare-fun m!264343 () Bool)

(assert (=> b!247917 m!264343))

(assert (=> b!247917 m!264319))

(declare-fun m!264345 () Bool)

(assert (=> b!247917 m!264345))

(assert (=> b!247917 m!264343))

(declare-fun m!264347 () Bool)

(assert (=> b!247917 m!264347))

(assert (=> b!247917 m!264345))

(assert (=> b!247917 m!264319))

(declare-fun m!264349 () Bool)

(assert (=> b!247917 m!264349))

(assert (=> b!247910 m!264319))

(assert (=> b!247910 m!264319))

(declare-fun m!264351 () Bool)

(assert (=> b!247910 m!264351))

(assert (=> b!247898 m!264319))

(assert (=> b!247898 m!264319))

(declare-fun m!264353 () Bool)

(assert (=> b!247898 m!264353))

(declare-fun m!264355 () Bool)

(assert (=> bm!23210 m!264355))

(declare-fun m!264357 () Bool)

(assert (=> b!247907 m!264357))

(declare-fun m!264359 () Bool)

(assert (=> bm!23212 m!264359))

(assert (=> b!247918 m!264319))

(assert (=> b!247918 m!264319))

(assert (=> b!247918 m!264351))

(declare-fun m!264361 () Bool)

(assert (=> bm!23209 m!264361))

(declare-fun m!264363 () Bool)

(assert (=> b!247899 m!264363))

(assert (=> d!60341 m!264173))

(assert (=> b!247661 d!60341))

(declare-fun d!60343 () Bool)

(assert (=> d!60343 (= (array_inv!3823 (_keys!6705 thiss!1504)) (bvsge (size!6138 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247662 d!60343))

(declare-fun d!60345 () Bool)

(assert (=> d!60345 (= (array_inv!3824 (_values!4567 thiss!1504)) (bvsge (size!6137 (_values!4567 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247662 d!60345))

(declare-fun d!60347 () Bool)

(assert (=> d!60347 (contains!1778 (getCurrentListMap!1368 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) key!932)))

(declare-fun lt!124070 () Unit!7658)

(declare-fun choose!1171 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) (_ BitVec 32) Int) Unit!7658)

(assert (=> d!60347 (= lt!124070 (choose!1171 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(assert (=> d!60347 (validMask!0 (mask!10725 thiss!1504))))

(assert (=> d!60347 (= (lemmaArrayContainsKeyThenInListMap!199 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) lt!124070)))

(declare-fun bs!8906 () Bool)

(assert (= bs!8906 d!60347))

(assert (=> bs!8906 m!264169))

(assert (=> bs!8906 m!264169))

(assert (=> bs!8906 m!264171))

(declare-fun m!264365 () Bool)

(assert (=> bs!8906 m!264365))

(assert (=> bs!8906 m!264173))

(assert (=> b!247680 d!60347))

(declare-fun d!60349 () Bool)

(assert (=> d!60349 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247670 d!60349))

(declare-fun d!60351 () Bool)

(declare-fun res!121471 () Bool)

(declare-fun e!160821 () Bool)

(assert (=> d!60351 (=> res!121471 e!160821)))

(assert (=> d!60351 (= res!121471 (= (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60351 (= (arrayContainsKey!0 (_keys!6705 thiss!1504) key!932 #b00000000000000000000000000000000) e!160821)))

(declare-fun b!247925 () Bool)

(declare-fun e!160822 () Bool)

(assert (=> b!247925 (= e!160821 e!160822)))

(declare-fun res!121472 () Bool)

(assert (=> b!247925 (=> (not res!121472) (not e!160822))))

(assert (=> b!247925 (= res!121472 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun b!247926 () Bool)

(assert (=> b!247926 (= e!160822 (arrayContainsKey!0 (_keys!6705 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60351 (not res!121471)) b!247925))

(assert (= (and b!247925 res!121472) b!247926))

(assert (=> d!60351 m!264319))

(declare-fun m!264367 () Bool)

(assert (=> b!247926 m!264367))

(assert (=> bm!23179 d!60351))

(declare-fun d!60353 () Bool)

(declare-fun res!121479 () Bool)

(declare-fun e!160825 () Bool)

(assert (=> d!60353 (=> (not res!121479) (not e!160825))))

(declare-fun simpleValid!258 (LongMapFixedSize!3670) Bool)

(assert (=> d!60353 (= res!121479 (simpleValid!258 thiss!1504))))

(assert (=> d!60353 (= (valid!1443 thiss!1504) e!160825)))

(declare-fun b!247933 () Bool)

(declare-fun res!121480 () Bool)

(assert (=> b!247933 (=> (not res!121480) (not e!160825))))

(assert (=> b!247933 (= res!121480 (= (arrayCountValidKeys!0 (_keys!6705 thiss!1504) #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) (_size!1884 thiss!1504)))))

(declare-fun b!247934 () Bool)

(declare-fun res!121481 () Bool)

(assert (=> b!247934 (=> (not res!121481) (not e!160825))))

(assert (=> b!247934 (= res!121481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun b!247935 () Bool)

(assert (=> b!247935 (= e!160825 (arrayNoDuplicates!0 (_keys!6705 thiss!1504) #b00000000000000000000000000000000 Nil!3684))))

(assert (= (and d!60353 res!121479) b!247933))

(assert (= (and b!247933 res!121480) b!247934))

(assert (= (and b!247934 res!121481) b!247935))

(declare-fun m!264369 () Bool)

(assert (=> d!60353 m!264369))

(assert (=> b!247933 m!264181))

(assert (=> b!247934 m!264153))

(declare-fun m!264371 () Bool)

(assert (=> b!247935 m!264371))

(assert (=> start!23580 d!60353))

(declare-fun b!247952 () Bool)

(declare-fun lt!124076 () SeekEntryResult!1105)

(assert (=> b!247952 (and (bvsge (index!6590 lt!124076) #b00000000000000000000000000000000) (bvslt (index!6590 lt!124076) (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun res!121492 () Bool)

(assert (=> b!247952 (= res!121492 (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6590 lt!124076)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160834 () Bool)

(assert (=> b!247952 (=> (not res!121492) (not e!160834))))

(declare-fun b!247953 () Bool)

(declare-fun res!121493 () Bool)

(declare-fun e!160837 () Bool)

(assert (=> b!247953 (=> (not res!121493) (not e!160837))))

(assert (=> b!247953 (= res!121493 (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6593 lt!124076)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247953 (and (bvsge (index!6593 lt!124076) #b00000000000000000000000000000000) (bvslt (index!6593 lt!124076) (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun b!247954 () Bool)

(declare-fun e!160835 () Bool)

(assert (=> b!247954 (= e!160835 e!160834)))

(declare-fun res!121490 () Bool)

(declare-fun call!23221 () Bool)

(assert (=> b!247954 (= res!121490 call!23221)))

(assert (=> b!247954 (=> (not res!121490) (not e!160834))))

(declare-fun bm!23218 () Bool)

(declare-fun c!41532 () Bool)

(assert (=> bm!23218 (= call!23221 (inRange!0 (ite c!41532 (index!6590 lt!124076) (index!6593 lt!124076)) (mask!10725 thiss!1504)))))

(declare-fun b!247955 () Bool)

(declare-fun e!160836 () Bool)

(assert (=> b!247955 (= e!160835 e!160836)))

(declare-fun c!41531 () Bool)

(assert (=> b!247955 (= c!41531 ((_ is MissingVacant!1105) lt!124076))))

(declare-fun b!247956 () Bool)

(declare-fun res!121491 () Bool)

(assert (=> b!247956 (=> (not res!121491) (not e!160837))))

(assert (=> b!247956 (= res!121491 call!23221)))

(assert (=> b!247956 (= e!160836 e!160837)))

(declare-fun b!247957 () Bool)

(declare-fun call!23222 () Bool)

(assert (=> b!247957 (= e!160837 (not call!23222))))

(declare-fun bm!23219 () Bool)

(assert (=> bm!23219 (= call!23222 (arrayContainsKey!0 (_keys!6705 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247959 () Bool)

(assert (=> b!247959 (= e!160834 (not call!23222))))

(declare-fun b!247958 () Bool)

(assert (=> b!247958 (= e!160836 ((_ is Undefined!1105) lt!124076))))

(declare-fun d!60355 () Bool)

(assert (=> d!60355 e!160835))

(assert (=> d!60355 (= c!41532 ((_ is MissingZero!1105) lt!124076))))

(assert (=> d!60355 (= lt!124076 (seekEntryOrOpen!0 key!932 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun lt!124075 () Unit!7658)

(declare-fun choose!1172 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7658)

(assert (=> d!60355 (= lt!124075 (choose!1172 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> d!60355 (validMask!0 (mask!10725 thiss!1504))))

(assert (=> d!60355 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!387 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)) lt!124075)))

(assert (= (and d!60355 c!41532) b!247954))

(assert (= (and d!60355 (not c!41532)) b!247955))

(assert (= (and b!247954 res!121490) b!247952))

(assert (= (and b!247952 res!121492) b!247959))

(assert (= (and b!247955 c!41531) b!247956))

(assert (= (and b!247955 (not c!41531)) b!247958))

(assert (= (and b!247956 res!121491) b!247953))

(assert (= (and b!247953 res!121493) b!247957))

(assert (= (or b!247954 b!247956) bm!23218))

(assert (= (or b!247959 b!247957) bm!23219))

(assert (=> d!60355 m!264163))

(declare-fun m!264373 () Bool)

(assert (=> d!60355 m!264373))

(assert (=> d!60355 m!264173))

(assert (=> bm!23219 m!264155))

(declare-fun m!264375 () Bool)

(assert (=> b!247952 m!264375))

(declare-fun m!264377 () Bool)

(assert (=> bm!23218 m!264377))

(declare-fun m!264379 () Bool)

(assert (=> b!247953 m!264379))

(assert (=> b!247673 d!60355))

(declare-fun d!60357 () Bool)

(assert (=> d!60357 (= (inRange!0 (ite c!41472 (index!6590 lt!123919) (index!6593 lt!123919)) (mask!10725 thiss!1504)) (and (bvsge (ite c!41472 (index!6590 lt!123919) (index!6593 lt!123919)) #b00000000000000000000000000000000) (bvslt (ite c!41472 (index!6590 lt!123919) (index!6593 lt!123919)) (bvadd (mask!10725 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23180 d!60357))

(declare-fun b!247971 () Bool)

(declare-fun e!160842 () Bool)

(assert (=> b!247971 (= e!160842 (= (arrayCountValidKeys!0 (array!12216 (store (arr!5794 (_keys!6705 thiss!1504)) index!297 key!932) (size!6138 (_keys!6705 thiss!1504))) #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6705 thiss!1504) #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!247969 () Bool)

(declare-fun res!121504 () Bool)

(declare-fun e!160843 () Bool)

(assert (=> b!247969 (=> (not res!121504) (not e!160843))))

(assert (=> b!247969 (= res!121504 (validKeyInArray!0 key!932))))

(declare-fun d!60359 () Bool)

(assert (=> d!60359 e!160842))

(declare-fun res!121505 () Bool)

(assert (=> d!60359 (=> (not res!121505) (not e!160842))))

(assert (=> d!60359 (= res!121505 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6138 (_keys!6705 thiss!1504)))))))

(declare-fun lt!124079 () Unit!7658)

(declare-fun choose!1 (array!12215 (_ BitVec 32) (_ BitVec 64)) Unit!7658)

(assert (=> d!60359 (= lt!124079 (choose!1 (_keys!6705 thiss!1504) index!297 key!932))))

(assert (=> d!60359 e!160843))

(declare-fun res!121503 () Bool)

(assert (=> d!60359 (=> (not res!121503) (not e!160843))))

(assert (=> d!60359 (= res!121503 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6138 (_keys!6705 thiss!1504)))))))

(assert (=> d!60359 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6705 thiss!1504) index!297 key!932) lt!124079)))

(declare-fun b!247968 () Bool)

(declare-fun res!121502 () Bool)

(assert (=> b!247968 (=> (not res!121502) (not e!160843))))

(assert (=> b!247968 (= res!121502 (not (validKeyInArray!0 (select (arr!5794 (_keys!6705 thiss!1504)) index!297))))))

(declare-fun b!247970 () Bool)

(assert (=> b!247970 (= e!160843 (bvslt (size!6138 (_keys!6705 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60359 res!121503) b!247968))

(assert (= (and b!247968 res!121502) b!247969))

(assert (= (and b!247969 res!121504) b!247970))

(assert (= (and d!60359 res!121505) b!247971))

(assert (=> b!247971 m!264179))

(declare-fun m!264381 () Bool)

(assert (=> b!247971 m!264381))

(assert (=> b!247971 m!264181))

(assert (=> b!247969 m!264149))

(declare-fun m!264383 () Bool)

(assert (=> d!60359 m!264383))

(declare-fun m!264385 () Bool)

(assert (=> b!247968 m!264385))

(assert (=> b!247968 m!264385))

(declare-fun m!264387 () Bool)

(assert (=> b!247968 m!264387))

(assert (=> b!247675 d!60359))

(declare-fun b!247980 () Bool)

(declare-fun e!160848 () (_ BitVec 32))

(assert (=> b!247980 (= e!160848 #b00000000000000000000000000000000)))

(declare-fun bm!23222 () Bool)

(declare-fun call!23225 () (_ BitVec 32))

(assert (=> bm!23222 (= call!23225 (arrayCountValidKeys!0 (_keys!6705 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun b!247981 () Bool)

(declare-fun e!160849 () (_ BitVec 32))

(assert (=> b!247981 (= e!160849 (bvadd #b00000000000000000000000000000001 call!23225))))

(declare-fun b!247983 () Bool)

(assert (=> b!247983 (= e!160849 call!23225)))

(declare-fun d!60361 () Bool)

(declare-fun lt!124082 () (_ BitVec 32))

(assert (=> d!60361 (and (bvsge lt!124082 #b00000000000000000000000000000000) (bvsle lt!124082 (bvsub (size!6138 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60361 (= lt!124082 e!160848)))

(declare-fun c!41538 () Bool)

(assert (=> d!60361 (= c!41538 (bvsge #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(assert (=> d!60361 (and (bvsle #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6138 (_keys!6705 thiss!1504)) (size!6138 (_keys!6705 thiss!1504))))))

(assert (=> d!60361 (= (arrayCountValidKeys!0 (_keys!6705 thiss!1504) #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) lt!124082)))

(declare-fun b!247982 () Bool)

(assert (=> b!247982 (= e!160848 e!160849)))

(declare-fun c!41537 () Bool)

(assert (=> b!247982 (= c!41537 (validKeyInArray!0 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60361 c!41538) b!247980))

(assert (= (and d!60361 (not c!41538)) b!247982))

(assert (= (and b!247982 c!41537) b!247981))

(assert (= (and b!247982 (not c!41537)) b!247983))

(assert (= (or b!247981 b!247983) bm!23222))

(declare-fun m!264389 () Bool)

(assert (=> bm!23222 m!264389))

(assert (=> b!247982 m!264319))

(assert (=> b!247982 m!264319))

(assert (=> b!247982 m!264351))

(assert (=> b!247675 d!60361))

(declare-fun d!60363 () Bool)

(assert (=> d!60363 (= (validMask!0 (mask!10725 thiss!1504)) (and (or (= (mask!10725 thiss!1504) #b00000000000000000000000000000111) (= (mask!10725 thiss!1504) #b00000000000000000000000000001111) (= (mask!10725 thiss!1504) #b00000000000000000000000000011111) (= (mask!10725 thiss!1504) #b00000000000000000000000000111111) (= (mask!10725 thiss!1504) #b00000000000000000000000001111111) (= (mask!10725 thiss!1504) #b00000000000000000000000011111111) (= (mask!10725 thiss!1504) #b00000000000000000000000111111111) (= (mask!10725 thiss!1504) #b00000000000000000000001111111111) (= (mask!10725 thiss!1504) #b00000000000000000000011111111111) (= (mask!10725 thiss!1504) #b00000000000000000000111111111111) (= (mask!10725 thiss!1504) #b00000000000000000001111111111111) (= (mask!10725 thiss!1504) #b00000000000000000011111111111111) (= (mask!10725 thiss!1504) #b00000000000000000111111111111111) (= (mask!10725 thiss!1504) #b00000000000000001111111111111111) (= (mask!10725 thiss!1504) #b00000000000000011111111111111111) (= (mask!10725 thiss!1504) #b00000000000000111111111111111111) (= (mask!10725 thiss!1504) #b00000000000001111111111111111111) (= (mask!10725 thiss!1504) #b00000000000011111111111111111111) (= (mask!10725 thiss!1504) #b00000000000111111111111111111111) (= (mask!10725 thiss!1504) #b00000000001111111111111111111111) (= (mask!10725 thiss!1504) #b00000000011111111111111111111111) (= (mask!10725 thiss!1504) #b00000000111111111111111111111111) (= (mask!10725 thiss!1504) #b00000001111111111111111111111111) (= (mask!10725 thiss!1504) #b00000011111111111111111111111111) (= (mask!10725 thiss!1504) #b00000111111111111111111111111111) (= (mask!10725 thiss!1504) #b00001111111111111111111111111111) (= (mask!10725 thiss!1504) #b00011111111111111111111111111111) (= (mask!10725 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10725 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!247675 d!60363))

(declare-fun d!60365 () Bool)

(declare-fun res!121514 () Bool)

(declare-fun e!160860 () Bool)

(assert (=> d!60365 (=> res!121514 e!160860)))

(assert (=> d!60365 (= res!121514 (bvsge #b00000000000000000000000000000000 (size!6138 lt!123913)))))

(assert (=> d!60365 (= (arrayNoDuplicates!0 lt!123913 #b00000000000000000000000000000000 Nil!3684) e!160860)))

(declare-fun b!247994 () Bool)

(declare-fun e!160861 () Bool)

(declare-fun contains!1779 (List!3687 (_ BitVec 64)) Bool)

(assert (=> b!247994 (= e!160861 (contains!1779 Nil!3684 (select (arr!5794 lt!123913) #b00000000000000000000000000000000)))))

(declare-fun b!247995 () Bool)

(declare-fun e!160859 () Bool)

(assert (=> b!247995 (= e!160860 e!160859)))

(declare-fun res!121512 () Bool)

(assert (=> b!247995 (=> (not res!121512) (not e!160859))))

(assert (=> b!247995 (= res!121512 (not e!160861))))

(declare-fun res!121513 () Bool)

(assert (=> b!247995 (=> (not res!121513) (not e!160861))))

(assert (=> b!247995 (= res!121513 (validKeyInArray!0 (select (arr!5794 lt!123913) #b00000000000000000000000000000000)))))

(declare-fun b!247996 () Bool)

(declare-fun e!160858 () Bool)

(declare-fun call!23228 () Bool)

(assert (=> b!247996 (= e!160858 call!23228)))

(declare-fun b!247997 () Bool)

(assert (=> b!247997 (= e!160859 e!160858)))

(declare-fun c!41541 () Bool)

(assert (=> b!247997 (= c!41541 (validKeyInArray!0 (select (arr!5794 lt!123913) #b00000000000000000000000000000000)))))

(declare-fun bm!23225 () Bool)

(assert (=> bm!23225 (= call!23228 (arrayNoDuplicates!0 lt!123913 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41541 (Cons!3683 (select (arr!5794 lt!123913) #b00000000000000000000000000000000) Nil!3684) Nil!3684)))))

(declare-fun b!247998 () Bool)

(assert (=> b!247998 (= e!160858 call!23228)))

(assert (= (and d!60365 (not res!121514)) b!247995))

(assert (= (and b!247995 res!121513) b!247994))

(assert (= (and b!247995 res!121512) b!247997))

(assert (= (and b!247997 c!41541) b!247996))

(assert (= (and b!247997 (not c!41541)) b!247998))

(assert (= (or b!247996 b!247998) bm!23225))

(declare-fun m!264391 () Bool)

(assert (=> b!247994 m!264391))

(assert (=> b!247994 m!264391))

(declare-fun m!264393 () Bool)

(assert (=> b!247994 m!264393))

(assert (=> b!247995 m!264391))

(assert (=> b!247995 m!264391))

(declare-fun m!264395 () Bool)

(assert (=> b!247995 m!264395))

(assert (=> b!247997 m!264391))

(assert (=> b!247997 m!264391))

(assert (=> b!247997 m!264395))

(assert (=> bm!23225 m!264391))

(declare-fun m!264397 () Bool)

(assert (=> bm!23225 m!264397))

(assert (=> b!247675 d!60365))

(declare-fun d!60367 () Bool)

(declare-fun e!160864 () Bool)

(assert (=> d!60367 e!160864))

(declare-fun res!121517 () Bool)

(assert (=> d!60367 (=> (not res!121517) (not e!160864))))

(assert (=> d!60367 (= res!121517 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6138 (_keys!6705 thiss!1504)))))))

(declare-fun lt!124085 () Unit!7658)

(declare-fun choose!41 (array!12215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3687) Unit!7658)

(assert (=> d!60367 (= lt!124085 (choose!41 (_keys!6705 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3684))))

(assert (=> d!60367 (bvslt (size!6138 (_keys!6705 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60367 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6705 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3684) lt!124085)))

(declare-fun b!248001 () Bool)

(assert (=> b!248001 (= e!160864 (arrayNoDuplicates!0 (array!12216 (store (arr!5794 (_keys!6705 thiss!1504)) index!297 key!932) (size!6138 (_keys!6705 thiss!1504))) #b00000000000000000000000000000000 Nil!3684))))

(assert (= (and d!60367 res!121517) b!248001))

(declare-fun m!264399 () Bool)

(assert (=> d!60367 m!264399))

(assert (=> b!248001 m!264179))

(declare-fun m!264401 () Bool)

(assert (=> b!248001 m!264401))

(assert (=> b!247675 d!60367))

(declare-fun b!248002 () Bool)

(declare-fun e!160865 () (_ BitVec 32))

(assert (=> b!248002 (= e!160865 #b00000000000000000000000000000000)))

(declare-fun bm!23226 () Bool)

(declare-fun call!23229 () (_ BitVec 32))

(assert (=> bm!23226 (= call!23229 (arrayCountValidKeys!0 lt!123913 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6138 (_keys!6705 thiss!1504))))))

(declare-fun b!248003 () Bool)

(declare-fun e!160866 () (_ BitVec 32))

(assert (=> b!248003 (= e!160866 (bvadd #b00000000000000000000000000000001 call!23229))))

(declare-fun b!248005 () Bool)

(assert (=> b!248005 (= e!160866 call!23229)))

(declare-fun d!60369 () Bool)

(declare-fun lt!124086 () (_ BitVec 32))

(assert (=> d!60369 (and (bvsge lt!124086 #b00000000000000000000000000000000) (bvsle lt!124086 (bvsub (size!6138 lt!123913) #b00000000000000000000000000000000)))))

(assert (=> d!60369 (= lt!124086 e!160865)))

(declare-fun c!41543 () Bool)

(assert (=> d!60369 (= c!41543 (bvsge #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(assert (=> d!60369 (and (bvsle #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6138 (_keys!6705 thiss!1504)) (size!6138 lt!123913)))))

(assert (=> d!60369 (= (arrayCountValidKeys!0 lt!123913 #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))) lt!124086)))

(declare-fun b!248004 () Bool)

(assert (=> b!248004 (= e!160865 e!160866)))

(declare-fun c!41542 () Bool)

(assert (=> b!248004 (= c!41542 (validKeyInArray!0 (select (arr!5794 lt!123913) #b00000000000000000000000000000000)))))

(assert (= (and d!60369 c!41543) b!248002))

(assert (= (and d!60369 (not c!41543)) b!248004))

(assert (= (and b!248004 c!41542) b!248003))

(assert (= (and b!248004 (not c!41542)) b!248005))

(assert (= (or b!248003 b!248005) bm!23226))

(declare-fun m!264403 () Bool)

(assert (=> bm!23226 m!264403))

(assert (=> b!248004 m!264391))

(assert (=> b!248004 m!264391))

(assert (=> b!248004 m!264395))

(assert (=> b!247675 d!60369))

(assert (=> b!247675 d!60351))

(declare-fun d!60371 () Bool)

(declare-fun e!160869 () Bool)

(assert (=> d!60371 e!160869))

(declare-fun res!121523 () Bool)

(assert (=> d!60371 (=> (not res!121523) (not e!160869))))

(declare-fun lt!124091 () SeekEntryResult!1105)

(assert (=> d!60371 (= res!121523 ((_ is Found!1105) lt!124091))))

(assert (=> d!60371 (= lt!124091 (seekEntryOrOpen!0 key!932 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun lt!124092 () Unit!7658)

(declare-fun choose!1173 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7658)

(assert (=> d!60371 (= lt!124092 (choose!1173 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> d!60371 (validMask!0 (mask!10725 thiss!1504))))

(assert (=> d!60371 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!390 (_keys!6705 thiss!1504) (_values!4567 thiss!1504) (mask!10725 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)) lt!124092)))

(declare-fun b!248010 () Bool)

(declare-fun res!121522 () Bool)

(assert (=> b!248010 (=> (not res!121522) (not e!160869))))

(assert (=> b!248010 (= res!121522 (inRange!0 (index!6591 lt!124091) (mask!10725 thiss!1504)))))

(declare-fun b!248011 () Bool)

(assert (=> b!248011 (= e!160869 (= (select (arr!5794 (_keys!6705 thiss!1504)) (index!6591 lt!124091)) key!932))))

(assert (=> b!248011 (and (bvsge (index!6591 lt!124091) #b00000000000000000000000000000000) (bvslt (index!6591 lt!124091) (size!6138 (_keys!6705 thiss!1504))))))

(assert (= (and d!60371 res!121523) b!248010))

(assert (= (and b!248010 res!121522) b!248011))

(assert (=> d!60371 m!264163))

(declare-fun m!264405 () Bool)

(assert (=> d!60371 m!264405))

(assert (=> d!60371 m!264173))

(declare-fun m!264407 () Bool)

(assert (=> b!248010 m!264407))

(declare-fun m!264409 () Bool)

(assert (=> b!248011 m!264409))

(assert (=> b!247668 d!60371))

(declare-fun b!248020 () Bool)

(declare-fun e!160878 () Bool)

(declare-fun e!160876 () Bool)

(assert (=> b!248020 (= e!160878 e!160876)))

(declare-fun c!41546 () Bool)

(assert (=> b!248020 (= c!41546 (validKeyInArray!0 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248021 () Bool)

(declare-fun call!23232 () Bool)

(assert (=> b!248021 (= e!160876 call!23232)))

(declare-fun bm!23229 () Bool)

(assert (=> bm!23229 (= call!23232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6705 thiss!1504) (mask!10725 thiss!1504)))))

(declare-fun d!60373 () Bool)

(declare-fun res!121528 () Bool)

(assert (=> d!60373 (=> res!121528 e!160878)))

(assert (=> d!60373 (= res!121528 (bvsge #b00000000000000000000000000000000 (size!6138 (_keys!6705 thiss!1504))))))

(assert (=> d!60373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6705 thiss!1504) (mask!10725 thiss!1504)) e!160878)))

(declare-fun b!248022 () Bool)

(declare-fun e!160877 () Bool)

(assert (=> b!248022 (= e!160877 call!23232)))

(declare-fun b!248023 () Bool)

(assert (=> b!248023 (= e!160876 e!160877)))

(declare-fun lt!124099 () (_ BitVec 64))

(assert (=> b!248023 (= lt!124099 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124100 () Unit!7658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12215 (_ BitVec 64) (_ BitVec 32)) Unit!7658)

(assert (=> b!248023 (= lt!124100 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6705 thiss!1504) lt!124099 #b00000000000000000000000000000000))))

(assert (=> b!248023 (arrayContainsKey!0 (_keys!6705 thiss!1504) lt!124099 #b00000000000000000000000000000000)))

(declare-fun lt!124101 () Unit!7658)

(assert (=> b!248023 (= lt!124101 lt!124100)))

(declare-fun res!121529 () Bool)

(assert (=> b!248023 (= res!121529 (= (seekEntryOrOpen!0 (select (arr!5794 (_keys!6705 thiss!1504)) #b00000000000000000000000000000000) (_keys!6705 thiss!1504) (mask!10725 thiss!1504)) (Found!1105 #b00000000000000000000000000000000)))))

(assert (=> b!248023 (=> (not res!121529) (not e!160877))))

(assert (= (and d!60373 (not res!121528)) b!248020))

(assert (= (and b!248020 c!41546) b!248023))

(assert (= (and b!248020 (not c!41546)) b!248021))

(assert (= (and b!248023 res!121529) b!248022))

(assert (= (or b!248022 b!248021) bm!23229))

(assert (=> b!248020 m!264319))

(assert (=> b!248020 m!264319))

(assert (=> b!248020 m!264351))

(declare-fun m!264411 () Bool)

(assert (=> bm!23229 m!264411))

(assert (=> b!248023 m!264319))

(declare-fun m!264413 () Bool)

(assert (=> b!248023 m!264413))

(declare-fun m!264415 () Bool)

(assert (=> b!248023 m!264415))

(assert (=> b!248023 m!264319))

(declare-fun m!264417 () Bool)

(assert (=> b!248023 m!264417))

(assert (=> b!247669 d!60373))

(declare-fun mapNonEmpty!10970 () Bool)

(declare-fun mapRes!10970 () Bool)

(declare-fun tp!23048 () Bool)

(declare-fun e!160884 () Bool)

(assert (=> mapNonEmpty!10970 (= mapRes!10970 (and tp!23048 e!160884))))

(declare-fun mapKey!10970 () (_ BitVec 32))

(declare-fun mapValue!10970 () ValueCell!2885)

(declare-fun mapRest!10970 () (Array (_ BitVec 32) ValueCell!2885))

(assert (=> mapNonEmpty!10970 (= mapRest!10961 (store mapRest!10970 mapKey!10970 mapValue!10970))))

(declare-fun b!248031 () Bool)

(declare-fun e!160883 () Bool)

(assert (=> b!248031 (= e!160883 tp_is_empty!6457)))

(declare-fun condMapEmpty!10970 () Bool)

(declare-fun mapDefault!10970 () ValueCell!2885)

(assert (=> mapNonEmpty!10961 (= condMapEmpty!10970 (= mapRest!10961 ((as const (Array (_ BitVec 32) ValueCell!2885)) mapDefault!10970)))))

(assert (=> mapNonEmpty!10961 (= tp!23032 (and e!160883 mapRes!10970))))

(declare-fun mapIsEmpty!10970 () Bool)

(assert (=> mapIsEmpty!10970 mapRes!10970))

(declare-fun b!248030 () Bool)

(assert (=> b!248030 (= e!160884 tp_is_empty!6457)))

(assert (= (and mapNonEmpty!10961 condMapEmpty!10970) mapIsEmpty!10970))

(assert (= (and mapNonEmpty!10961 (not condMapEmpty!10970)) mapNonEmpty!10970))

(assert (= (and mapNonEmpty!10970 ((_ is ValueCellFull!2885) mapValue!10970)) b!248030))

(assert (= (and mapNonEmpty!10961 ((_ is ValueCellFull!2885) mapDefault!10970)) b!248031))

(declare-fun m!264419 () Bool)

(assert (=> mapNonEmpty!10970 m!264419))

(declare-fun b_lambda!8035 () Bool)

(assert (= b_lambda!8033 (or (and b!247662 b_free!6595) b_lambda!8035)))

(check-sat (not b!247913) (not b!247994) (not b!247910) (not bm!23209) (not b!247995) (not b_lambda!8035) (not b!248010) (not b!247982) (not b!247969) (not bm!23212) (not d!60371) (not d!60353) (not b!247855) (not b!247934) (not d!60367) (not b!248004) (not bm!23207) (not b!248023) (not b!247911) (not d!60341) (not bm!23210) (not b!247907) (not b!247918) (not bm!23229) (not b!247853) (not b!247971) (not b!247997) (not d!60347) (not b!247933) (not bm!23226) (not b!247846) (not b!247917) (not b!248020) (not b!247899) (not bm!23218) (not bm!23222) (not d!60355) b_and!13577 (not b!247926) (not b!248001) (not b!247898) (not b_next!6595) (not bm!23219) (not mapNonEmpty!10970) (not bm!23225) (not b!247935) (not d!60335) tp_is_empty!6457 (not b!247968) (not d!60359) (not d!60339))
(check-sat b_and!13577 (not b_next!6595))
