; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16760 () Bool)

(assert start!16760)

(declare-fun b!168581 () Bool)

(declare-fun b_free!4065 () Bool)

(declare-fun b_next!4065 () Bool)

(assert (=> b!168581 (= b_free!4065 (not b_next!4065))))

(declare-fun tp!14796 () Bool)

(declare-fun b_and!10479 () Bool)

(assert (=> b!168581 (= tp!14796 b_and!10479)))

(declare-fun res!80259 () Bool)

(declare-fun e!110841 () Bool)

(assert (=> start!16760 (=> (not res!80259) (not e!110841))))

(declare-datatypes ((V!4803 0))(
  ( (V!4804 (val!1978 Int)) )
))
(declare-datatypes ((ValueCell!1590 0))(
  ( (ValueCellFull!1590 (v!3843 V!4803)) (EmptyCell!1590) )
))
(declare-datatypes ((array!6831 0))(
  ( (array!6832 (arr!3251 (Array (_ BitVec 32) (_ BitVec 64))) (size!3539 (_ BitVec 32))) )
))
(declare-datatypes ((array!6833 0))(
  ( (array!6834 (arr!3252 (Array (_ BitVec 32) ValueCell!1590)) (size!3540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2088 0))(
  ( (LongMapFixedSize!2089 (defaultEntry!3486 Int) (mask!8253 (_ BitVec 32)) (extraKeys!3227 (_ BitVec 32)) (zeroValue!3329 V!4803) (minValue!3329 V!4803) (_size!1093 (_ BitVec 32)) (_keys!5311 array!6831) (_values!3469 array!6833) (_vacant!1093 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2088)

(declare-fun valid!904 (LongMapFixedSize!2088) Bool)

(assert (=> start!16760 (= res!80259 (valid!904 thiss!1248))))

(assert (=> start!16760 e!110841))

(declare-fun e!110846 () Bool)

(assert (=> start!16760 e!110846))

(assert (=> start!16760 true))

(declare-fun tp_is_empty!3867 () Bool)

(assert (=> start!16760 tp_is_empty!3867))

(declare-fun b!168579 () Bool)

(declare-fun e!110849 () Bool)

(assert (=> b!168579 (= e!110849 tp_is_empty!3867)))

(declare-fun b!168580 () Bool)

(declare-datatypes ((Unit!5194 0))(
  ( (Unit!5195) )
))
(declare-fun e!110845 () Unit!5194)

(declare-fun lt!84303 () Unit!5194)

(assert (=> b!168580 (= e!110845 lt!84303)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!124 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4803 V!4803 (_ BitVec 64) Int) Unit!5194)

(assert (=> b!168580 (= lt!84303 (lemmaInListMapThenSeekEntryOrOpenFindsIt!124 (_keys!5311 thiss!1248) (_values!3469 thiss!1248) (mask!8253 thiss!1248) (extraKeys!3227 thiss!1248) (zeroValue!3329 thiss!1248) (minValue!3329 thiss!1248) key!828 (defaultEntry!3486 thiss!1248)))))

(declare-fun res!80253 () Bool)

(declare-datatypes ((SeekEntryResult!504 0))(
  ( (MissingZero!504 (index!4184 (_ BitVec 32))) (Found!504 (index!4185 (_ BitVec 32))) (Intermediate!504 (undefined!1316 Bool) (index!4186 (_ BitVec 32)) (x!18628 (_ BitVec 32))) (Undefined!504) (MissingVacant!504 (index!4187 (_ BitVec 32))) )
))
(declare-fun lt!84307 () SeekEntryResult!504)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168580 (= res!80253 (inRange!0 (index!4185 lt!84307) (mask!8253 thiss!1248)))))

(declare-fun e!110842 () Bool)

(assert (=> b!168580 (=> (not res!80253) (not e!110842))))

(assert (=> b!168580 e!110842))

(declare-fun e!110847 () Bool)

(declare-fun array_inv!2093 (array!6831) Bool)

(declare-fun array_inv!2094 (array!6833) Bool)

(assert (=> b!168581 (= e!110846 (and tp!14796 tp_is_empty!3867 (array_inv!2093 (_keys!5311 thiss!1248)) (array_inv!2094 (_values!3469 thiss!1248)) e!110847))))

(declare-fun b!168582 () Bool)

(declare-fun Unit!5196 () Unit!5194)

(assert (=> b!168582 (= e!110845 Unit!5196)))

(declare-fun lt!84304 () Unit!5194)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!127 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4803 V!4803 (_ BitVec 64) Int) Unit!5194)

(assert (=> b!168582 (= lt!84304 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!127 (_keys!5311 thiss!1248) (_values!3469 thiss!1248) (mask!8253 thiss!1248) (extraKeys!3227 thiss!1248) (zeroValue!3329 thiss!1248) (minValue!3329 thiss!1248) key!828 (defaultEntry!3486 thiss!1248)))))

(assert (=> b!168582 false))

(declare-fun b!168583 () Bool)

(declare-fun e!110843 () Bool)

(declare-fun e!110844 () Bool)

(assert (=> b!168583 (= e!110843 (not e!110844))))

(declare-fun res!80257 () Bool)

(assert (=> b!168583 (=> res!80257 e!110844)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168583 (= res!80257 (not (validMask!0 (mask!8253 thiss!1248))))))

(declare-datatypes ((tuple2!3172 0))(
  ( (tuple2!3173 (_1!1597 (_ BitVec 64)) (_2!1597 V!4803)) )
))
(declare-datatypes ((List!2165 0))(
  ( (Nil!2162) (Cons!2161 (h!2778 tuple2!3172) (t!6967 List!2165)) )
))
(declare-datatypes ((ListLongMap!2127 0))(
  ( (ListLongMap!2128 (toList!1079 List!2165)) )
))
(declare-fun lt!84306 () ListLongMap!2127)

(declare-fun v!309 () V!4803)

(declare-fun +!231 (ListLongMap!2127 tuple2!3172) ListLongMap!2127)

(declare-fun getCurrentListMap!737 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4803 V!4803 (_ BitVec 32) Int) ListLongMap!2127)

(assert (=> b!168583 (= (+!231 lt!84306 (tuple2!3173 key!828 v!309)) (getCurrentListMap!737 (_keys!5311 thiss!1248) (array!6834 (store (arr!3252 (_values!3469 thiss!1248)) (index!4185 lt!84307) (ValueCellFull!1590 v!309)) (size!3540 (_values!3469 thiss!1248))) (mask!8253 thiss!1248) (extraKeys!3227 thiss!1248) (zeroValue!3329 thiss!1248) (minValue!3329 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3486 thiss!1248)))))

(declare-fun lt!84305 () Unit!5194)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!86 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4803 V!4803 (_ BitVec 32) (_ BitVec 64) V!4803 Int) Unit!5194)

(assert (=> b!168583 (= lt!84305 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!86 (_keys!5311 thiss!1248) (_values!3469 thiss!1248) (mask!8253 thiss!1248) (extraKeys!3227 thiss!1248) (zeroValue!3329 thiss!1248) (minValue!3329 thiss!1248) (index!4185 lt!84307) key!828 v!309 (defaultEntry!3486 thiss!1248)))))

(declare-fun lt!84301 () Unit!5194)

(assert (=> b!168583 (= lt!84301 e!110845)))

(declare-fun c!30379 () Bool)

(declare-fun contains!1121 (ListLongMap!2127 (_ BitVec 64)) Bool)

(assert (=> b!168583 (= c!30379 (contains!1121 lt!84306 key!828))))

(assert (=> b!168583 (= lt!84306 (getCurrentListMap!737 (_keys!5311 thiss!1248) (_values!3469 thiss!1248) (mask!8253 thiss!1248) (extraKeys!3227 thiss!1248) (zeroValue!3329 thiss!1248) (minValue!3329 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3486 thiss!1248)))))

(declare-fun mapIsEmpty!6519 () Bool)

(declare-fun mapRes!6519 () Bool)

(assert (=> mapIsEmpty!6519 mapRes!6519))

(declare-fun mapNonEmpty!6519 () Bool)

(declare-fun tp!14795 () Bool)

(declare-fun e!110840 () Bool)

(assert (=> mapNonEmpty!6519 (= mapRes!6519 (and tp!14795 e!110840))))

(declare-fun mapValue!6519 () ValueCell!1590)

(declare-fun mapKey!6519 () (_ BitVec 32))

(declare-fun mapRest!6519 () (Array (_ BitVec 32) ValueCell!1590))

(assert (=> mapNonEmpty!6519 (= (arr!3252 (_values!3469 thiss!1248)) (store mapRest!6519 mapKey!6519 mapValue!6519))))

(declare-fun b!168584 () Bool)

(assert (=> b!168584 (= e!110840 tp_is_empty!3867)))

(declare-fun b!168585 () Bool)

(assert (=> b!168585 (= e!110842 (= (select (arr!3251 (_keys!5311 thiss!1248)) (index!4185 lt!84307)) key!828))))

(declare-fun b!168586 () Bool)

(declare-fun res!80255 () Bool)

(assert (=> b!168586 (=> res!80255 e!110844)))

(assert (=> b!168586 (= res!80255 (or (not (= (size!3540 (_values!3469 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8253 thiss!1248)))) (not (= (size!3539 (_keys!5311 thiss!1248)) (size!3540 (_values!3469 thiss!1248)))) (bvslt (mask!8253 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3227 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3227 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168587 () Bool)

(assert (=> b!168587 (= e!110847 (and e!110849 mapRes!6519))))

(declare-fun condMapEmpty!6519 () Bool)

(declare-fun mapDefault!6519 () ValueCell!1590)

(assert (=> b!168587 (= condMapEmpty!6519 (= (arr!3252 (_values!3469 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1590)) mapDefault!6519)))))

(declare-fun b!168588 () Bool)

(declare-fun res!80254 () Bool)

(assert (=> b!168588 (=> res!80254 e!110844)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6831 (_ BitVec 32)) Bool)

(assert (=> b!168588 (= res!80254 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5311 thiss!1248) (mask!8253 thiss!1248))))))

(declare-fun b!168589 () Bool)

(assert (=> b!168589 (= e!110844 true)))

(declare-fun lt!84302 () Bool)

(declare-datatypes ((List!2166 0))(
  ( (Nil!2163) (Cons!2162 (h!2779 (_ BitVec 64)) (t!6968 List!2166)) )
))
(declare-fun arrayNoDuplicates!0 (array!6831 (_ BitVec 32) List!2166) Bool)

(assert (=> b!168589 (= lt!84302 (arrayNoDuplicates!0 (_keys!5311 thiss!1248) #b00000000000000000000000000000000 Nil!2163))))

(declare-fun b!168590 () Bool)

(assert (=> b!168590 (= e!110841 e!110843)))

(declare-fun res!80258 () Bool)

(assert (=> b!168590 (=> (not res!80258) (not e!110843))))

(get-info :version)

(assert (=> b!168590 (= res!80258 (and (not ((_ is Undefined!504) lt!84307)) (not ((_ is MissingVacant!504) lt!84307)) (not ((_ is MissingZero!504) lt!84307)) ((_ is Found!504) lt!84307)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6831 (_ BitVec 32)) SeekEntryResult!504)

(assert (=> b!168590 (= lt!84307 (seekEntryOrOpen!0 key!828 (_keys!5311 thiss!1248) (mask!8253 thiss!1248)))))

(declare-fun b!168591 () Bool)

(declare-fun res!80256 () Bool)

(assert (=> b!168591 (=> (not res!80256) (not e!110841))))

(assert (=> b!168591 (= res!80256 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16760 res!80259) b!168591))

(assert (= (and b!168591 res!80256) b!168590))

(assert (= (and b!168590 res!80258) b!168583))

(assert (= (and b!168583 c!30379) b!168580))

(assert (= (and b!168583 (not c!30379)) b!168582))

(assert (= (and b!168580 res!80253) b!168585))

(assert (= (and b!168583 (not res!80257)) b!168586))

(assert (= (and b!168586 (not res!80255)) b!168588))

(assert (= (and b!168588 (not res!80254)) b!168589))

(assert (= (and b!168587 condMapEmpty!6519) mapIsEmpty!6519))

(assert (= (and b!168587 (not condMapEmpty!6519)) mapNonEmpty!6519))

(assert (= (and mapNonEmpty!6519 ((_ is ValueCellFull!1590) mapValue!6519)) b!168584))

(assert (= (and b!168587 ((_ is ValueCellFull!1590) mapDefault!6519)) b!168579))

(assert (= b!168581 b!168587))

(assert (= start!16760 b!168581))

(declare-fun m!197643 () Bool)

(assert (=> start!16760 m!197643))

(declare-fun m!197645 () Bool)

(assert (=> b!168588 m!197645))

(declare-fun m!197647 () Bool)

(assert (=> mapNonEmpty!6519 m!197647))

(declare-fun m!197649 () Bool)

(assert (=> b!168580 m!197649))

(declare-fun m!197651 () Bool)

(assert (=> b!168580 m!197651))

(declare-fun m!197653 () Bool)

(assert (=> b!168583 m!197653))

(declare-fun m!197655 () Bool)

(assert (=> b!168583 m!197655))

(declare-fun m!197657 () Bool)

(assert (=> b!168583 m!197657))

(declare-fun m!197659 () Bool)

(assert (=> b!168583 m!197659))

(declare-fun m!197661 () Bool)

(assert (=> b!168583 m!197661))

(declare-fun m!197663 () Bool)

(assert (=> b!168583 m!197663))

(declare-fun m!197665 () Bool)

(assert (=> b!168583 m!197665))

(declare-fun m!197667 () Bool)

(assert (=> b!168581 m!197667))

(declare-fun m!197669 () Bool)

(assert (=> b!168581 m!197669))

(declare-fun m!197671 () Bool)

(assert (=> b!168589 m!197671))

(declare-fun m!197673 () Bool)

(assert (=> b!168590 m!197673))

(declare-fun m!197675 () Bool)

(assert (=> b!168585 m!197675))

(declare-fun m!197677 () Bool)

(assert (=> b!168582 m!197677))

(check-sat (not b!168582) (not b!168589) (not b_next!4065) (not b!168583) tp_is_empty!3867 b_and!10479 (not mapNonEmpty!6519) (not b!168590) (not b!168581) (not b!168580) (not b!168588) (not start!16760))
(check-sat b_and!10479 (not b_next!4065))
