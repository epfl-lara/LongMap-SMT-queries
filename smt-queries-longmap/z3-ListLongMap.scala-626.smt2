; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16108 () Bool)

(assert start!16108)

(declare-fun b!160176 () Bool)

(declare-fun b_free!3565 () Bool)

(declare-fun b_next!3565 () Bool)

(assert (=> b!160176 (= b_free!3565 (not b_next!3565))))

(declare-fun tp!13264 () Bool)

(declare-fun b_and!9993 () Bool)

(assert (=> b!160176 (= tp!13264 b_and!9993)))

(declare-fun b!160169 () Bool)

(declare-fun res!75787 () Bool)

(declare-fun e!104759 () Bool)

(assert (=> b!160169 (=> (not res!75787) (not e!104759))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160169 (= res!75787 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160170 () Bool)

(declare-fun res!75790 () Bool)

(assert (=> b!160170 (=> (not res!75790) (not e!104759))))

(declare-datatypes ((V!4137 0))(
  ( (V!4138 (val!1728 Int)) )
))
(declare-datatypes ((ValueCell!1340 0))(
  ( (ValueCellFull!1340 (v!3594 V!4137)) (EmptyCell!1340) )
))
(declare-datatypes ((array!5799 0))(
  ( (array!5800 (arr!2744 (Array (_ BitVec 32) (_ BitVec 64))) (size!3028 (_ BitVec 32))) )
))
(declare-datatypes ((array!5801 0))(
  ( (array!5802 (arr!2745 (Array (_ BitVec 32) ValueCell!1340)) (size!3029 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1588 0))(
  ( (LongMapFixedSize!1589 (defaultEntry!3236 Int) (mask!7800 (_ BitVec 32)) (extraKeys!2977 (_ BitVec 32)) (zeroValue!3079 V!4137) (minValue!3079 V!4137) (_size!843 (_ BitVec 32)) (_keys!5037 array!5799) (_values!3219 array!5801) (_vacant!843 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1588)

(get-info :version)

(declare-datatypes ((SeekEntryResult!319 0))(
  ( (MissingZero!319 (index!3444 (_ BitVec 32))) (Found!319 (index!3445 (_ BitVec 32))) (Intermediate!319 (undefined!1131 Bool) (index!3446 (_ BitVec 32)) (x!17671 (_ BitVec 32))) (Undefined!319) (MissingVacant!319 (index!3447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5799 (_ BitVec 32)) SeekEntryResult!319)

(assert (=> b!160170 (= res!75790 ((_ is Undefined!319) (seekEntryOrOpen!0 key!828 (_keys!5037 thiss!1248) (mask!7800 thiss!1248))))))

(declare-fun b!160171 () Bool)

(declare-fun e!104755 () Bool)

(declare-fun e!104757 () Bool)

(declare-fun mapRes!5738 () Bool)

(assert (=> b!160171 (= e!104755 (and e!104757 mapRes!5738))))

(declare-fun condMapEmpty!5738 () Bool)

(declare-fun mapDefault!5738 () ValueCell!1340)

(assert (=> b!160171 (= condMapEmpty!5738 (= (arr!2745 (_values!3219 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1340)) mapDefault!5738)))))

(declare-fun mapNonEmpty!5738 () Bool)

(declare-fun tp!13265 () Bool)

(declare-fun e!104760 () Bool)

(assert (=> mapNonEmpty!5738 (= mapRes!5738 (and tp!13265 e!104760))))

(declare-fun mapKey!5738 () (_ BitVec 32))

(declare-fun mapRest!5738 () (Array (_ BitVec 32) ValueCell!1340))

(declare-fun mapValue!5738 () ValueCell!1340)

(assert (=> mapNonEmpty!5738 (= (arr!2745 (_values!3219 thiss!1248)) (store mapRest!5738 mapKey!5738 mapValue!5738))))

(declare-fun b!160172 () Bool)

(declare-fun res!75789 () Bool)

(assert (=> b!160172 (=> (not res!75789) (not e!104759))))

(assert (=> b!160172 (= res!75789 (and (= (size!3029 (_values!3219 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7800 thiss!1248))) (= (size!3028 (_keys!5037 thiss!1248)) (size!3029 (_values!3219 thiss!1248))) (bvsge (mask!7800 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2977 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2977 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75785 () Bool)

(assert (=> start!16108 (=> (not res!75785) (not e!104759))))

(declare-fun valid!757 (LongMapFixedSize!1588) Bool)

(assert (=> start!16108 (= res!75785 (valid!757 thiss!1248))))

(assert (=> start!16108 e!104759))

(declare-fun e!104756 () Bool)

(assert (=> start!16108 e!104756))

(assert (=> start!16108 true))

(declare-fun b!160173 () Bool)

(assert (=> b!160173 (= e!104759 false)))

(declare-fun lt!82119 () Bool)

(declare-datatypes ((List!1918 0))(
  ( (Nil!1915) (Cons!1914 (h!2527 (_ BitVec 64)) (t!6712 List!1918)) )
))
(declare-fun arrayNoDuplicates!0 (array!5799 (_ BitVec 32) List!1918) Bool)

(assert (=> b!160173 (= lt!82119 (arrayNoDuplicates!0 (_keys!5037 thiss!1248) #b00000000000000000000000000000000 Nil!1915))))

(declare-fun b!160174 () Bool)

(declare-fun tp_is_empty!3367 () Bool)

(assert (=> b!160174 (= e!104757 tp_is_empty!3367)))

(declare-fun b!160175 () Bool)

(assert (=> b!160175 (= e!104760 tp_is_empty!3367)))

(declare-fun mapIsEmpty!5738 () Bool)

(assert (=> mapIsEmpty!5738 mapRes!5738))

(declare-fun array_inv!1755 (array!5799) Bool)

(declare-fun array_inv!1756 (array!5801) Bool)

(assert (=> b!160176 (= e!104756 (and tp!13264 tp_is_empty!3367 (array_inv!1755 (_keys!5037 thiss!1248)) (array_inv!1756 (_values!3219 thiss!1248)) e!104755))))

(declare-fun b!160177 () Bool)

(declare-fun res!75788 () Bool)

(assert (=> b!160177 (=> (not res!75788) (not e!104759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5799 (_ BitVec 32)) Bool)

(assert (=> b!160177 (= res!75788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5037 thiss!1248) (mask!7800 thiss!1248)))))

(declare-fun b!160178 () Bool)

(declare-fun res!75791 () Bool)

(assert (=> b!160178 (=> (not res!75791) (not e!104759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160178 (= res!75791 (validMask!0 (mask!7800 thiss!1248)))))

(declare-fun b!160179 () Bool)

(declare-fun res!75786 () Bool)

(assert (=> b!160179 (=> (not res!75786) (not e!104759))))

(declare-datatypes ((tuple2!2852 0))(
  ( (tuple2!2853 (_1!1437 (_ BitVec 64)) (_2!1437 V!4137)) )
))
(declare-datatypes ((List!1919 0))(
  ( (Nil!1916) (Cons!1915 (h!2528 tuple2!2852) (t!6713 List!1919)) )
))
(declare-datatypes ((ListLongMap!1851 0))(
  ( (ListLongMap!1852 (toList!941 List!1919)) )
))
(declare-fun contains!987 (ListLongMap!1851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!608 (array!5799 array!5801 (_ BitVec 32) (_ BitVec 32) V!4137 V!4137 (_ BitVec 32) Int) ListLongMap!1851)

(assert (=> b!160179 (= res!75786 (contains!987 (getCurrentListMap!608 (_keys!5037 thiss!1248) (_values!3219 thiss!1248) (mask!7800 thiss!1248) (extraKeys!2977 thiss!1248) (zeroValue!3079 thiss!1248) (minValue!3079 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3236 thiss!1248)) key!828))))

(assert (= (and start!16108 res!75785) b!160169))

(assert (= (and b!160169 res!75787) b!160170))

(assert (= (and b!160170 res!75790) b!160179))

(assert (= (and b!160179 res!75786) b!160178))

(assert (= (and b!160178 res!75791) b!160172))

(assert (= (and b!160172 res!75789) b!160177))

(assert (= (and b!160177 res!75788) b!160173))

(assert (= (and b!160171 condMapEmpty!5738) mapIsEmpty!5738))

(assert (= (and b!160171 (not condMapEmpty!5738)) mapNonEmpty!5738))

(assert (= (and mapNonEmpty!5738 ((_ is ValueCellFull!1340) mapValue!5738)) b!160175))

(assert (= (and b!160171 ((_ is ValueCellFull!1340) mapDefault!5738)) b!160174))

(assert (= b!160176 b!160171))

(assert (= start!16108 b!160176))

(declare-fun m!192299 () Bool)

(assert (=> b!160173 m!192299))

(declare-fun m!192301 () Bool)

(assert (=> mapNonEmpty!5738 m!192301))

(declare-fun m!192303 () Bool)

(assert (=> b!160179 m!192303))

(assert (=> b!160179 m!192303))

(declare-fun m!192305 () Bool)

(assert (=> b!160179 m!192305))

(declare-fun m!192307 () Bool)

(assert (=> b!160178 m!192307))

(declare-fun m!192309 () Bool)

(assert (=> start!16108 m!192309))

(declare-fun m!192311 () Bool)

(assert (=> b!160176 m!192311))

(declare-fun m!192313 () Bool)

(assert (=> b!160176 m!192313))

(declare-fun m!192315 () Bool)

(assert (=> b!160170 m!192315))

(declare-fun m!192317 () Bool)

(assert (=> b!160177 m!192317))

(check-sat (not b!160173) (not start!16108) b_and!9993 (not b_next!3565) (not b!160177) tp_is_empty!3367 (not b!160176) (not b!160170) (not b!160178) (not b!160179) (not mapNonEmpty!5738))
(check-sat b_and!9993 (not b_next!3565))
