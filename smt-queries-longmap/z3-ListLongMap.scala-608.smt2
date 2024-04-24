; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15844 () Bool)

(assert start!15844)

(declare-fun b!157807 () Bool)

(declare-fun b_free!3457 () Bool)

(declare-fun b_next!3457 () Bool)

(assert (=> b!157807 (= b_free!3457 (not b_next!3457))))

(declare-fun tp!12910 () Bool)

(declare-fun b_and!9885 () Bool)

(assert (=> b!157807 (= tp!12910 b_and!9885)))

(declare-fun b!157804 () Bool)

(declare-fun e!103346 () Bool)

(declare-fun tp_is_empty!3259 () Bool)

(assert (=> b!157804 (= e!103346 tp_is_empty!3259)))

(declare-fun b!157806 () Bool)

(declare-fun e!103350 () Bool)

(declare-fun e!103351 () Bool)

(declare-fun mapRes!5545 () Bool)

(assert (=> b!157806 (= e!103350 (and e!103351 mapRes!5545))))

(declare-fun condMapEmpty!5545 () Bool)

(declare-datatypes ((V!3993 0))(
  ( (V!3994 (val!1674 Int)) )
))
(declare-datatypes ((ValueCell!1286 0))(
  ( (ValueCellFull!1286 (v!3540 V!3993)) (EmptyCell!1286) )
))
(declare-datatypes ((array!5565 0))(
  ( (array!5566 (arr!2636 (Array (_ BitVec 32) (_ BitVec 64))) (size!2916 (_ BitVec 32))) )
))
(declare-datatypes ((array!5567 0))(
  ( (array!5568 (arr!2637 (Array (_ BitVec 32) ValueCell!1286)) (size!2917 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1480 0))(
  ( (LongMapFixedSize!1481 (defaultEntry!3182 Int) (mask!7673 (_ BitVec 32)) (extraKeys!2923 (_ BitVec 32)) (zeroValue!3025 V!3993) (minValue!3025 V!3993) (_size!789 (_ BitVec 32)) (_keys!4959 array!5565) (_values!3165 array!5567) (_vacant!789 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1480)

(declare-fun mapDefault!5545 () ValueCell!1286)

(assert (=> b!157806 (= condMapEmpty!5545 (= (arr!2637 (_values!3165 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1286)) mapDefault!5545)))))

(declare-fun mapNonEmpty!5545 () Bool)

(declare-fun tp!12909 () Bool)

(assert (=> mapNonEmpty!5545 (= mapRes!5545 (and tp!12909 e!103346))))

(declare-fun mapRest!5545 () (Array (_ BitVec 32) ValueCell!1286))

(declare-fun mapValue!5545 () ValueCell!1286)

(declare-fun mapKey!5545 () (_ BitVec 32))

(assert (=> mapNonEmpty!5545 (= (arr!2637 (_values!3165 thiss!1248)) (store mapRest!5545 mapKey!5545 mapValue!5545))))

(declare-fun e!103349 () Bool)

(declare-fun array_inv!1681 (array!5565) Bool)

(declare-fun array_inv!1682 (array!5567) Bool)

(assert (=> b!157807 (= e!103349 (and tp!12910 tp_is_empty!3259 (array_inv!1681 (_keys!4959 thiss!1248)) (array_inv!1682 (_values!3165 thiss!1248)) e!103350))))

(declare-fun b!157808 () Bool)

(declare-fun res!74577 () Bool)

(declare-fun e!103347 () Bool)

(assert (=> b!157808 (=> (not res!74577) (not e!103347))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157808 (= res!74577 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157809 () Bool)

(declare-fun res!74578 () Bool)

(assert (=> b!157809 (=> (not res!74578) (not e!103347))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!283 0))(
  ( (MissingZero!283 (index!3300 (_ BitVec 32))) (Found!283 (index!3301 (_ BitVec 32))) (Intermediate!283 (undefined!1095 Bool) (index!3302 (_ BitVec 32)) (x!17383 (_ BitVec 32))) (Undefined!283) (MissingVacant!283 (index!3303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5565 (_ BitVec 32)) SeekEntryResult!283)

(assert (=> b!157809 (= res!74578 ((_ is Undefined!283) (seekEntryOrOpen!0 key!828 (_keys!4959 thiss!1248) (mask!7673 thiss!1248))))))

(declare-fun res!74576 () Bool)

(assert (=> start!15844 (=> (not res!74576) (not e!103347))))

(declare-fun valid!720 (LongMapFixedSize!1480) Bool)

(assert (=> start!15844 (= res!74576 (valid!720 thiss!1248))))

(assert (=> start!15844 e!103347))

(assert (=> start!15844 e!103349))

(assert (=> start!15844 true))

(declare-fun b!157805 () Bool)

(assert (=> b!157805 (= e!103351 tp_is_empty!3259)))

(declare-fun mapIsEmpty!5545 () Bool)

(assert (=> mapIsEmpty!5545 mapRes!5545))

(declare-fun b!157810 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157810 (= e!103347 (not (validMask!0 (mask!7673 thiss!1248))))))

(assert (= (and start!15844 res!74576) b!157808))

(assert (= (and b!157808 res!74577) b!157809))

(assert (= (and b!157809 res!74578) b!157810))

(assert (= (and b!157806 condMapEmpty!5545) mapIsEmpty!5545))

(assert (= (and b!157806 (not condMapEmpty!5545)) mapNonEmpty!5545))

(assert (= (and mapNonEmpty!5545 ((_ is ValueCellFull!1286) mapValue!5545)) b!157804))

(assert (= (and b!157806 ((_ is ValueCellFull!1286) mapDefault!5545)) b!157805))

(assert (= b!157807 b!157806))

(assert (= start!15844 b!157807))

(declare-fun m!191003 () Bool)

(assert (=> mapNonEmpty!5545 m!191003))

(declare-fun m!191005 () Bool)

(assert (=> start!15844 m!191005))

(declare-fun m!191007 () Bool)

(assert (=> b!157810 m!191007))

(declare-fun m!191009 () Bool)

(assert (=> b!157807 m!191009))

(declare-fun m!191011 () Bool)

(assert (=> b!157807 m!191011))

(declare-fun m!191013 () Bool)

(assert (=> b!157809 m!191013))

(check-sat (not start!15844) (not b!157809) (not b_next!3457) (not b!157807) (not b!157810) b_and!9885 (not mapNonEmpty!5545) tp_is_empty!3259)
(check-sat b_and!9885 (not b_next!3457))
(get-model)

(declare-fun d!51171 () Bool)

(declare-fun res!74603 () Bool)

(declare-fun e!103390 () Bool)

(assert (=> d!51171 (=> (not res!74603) (not e!103390))))

(declare-fun simpleValid!109 (LongMapFixedSize!1480) Bool)

(assert (=> d!51171 (= res!74603 (simpleValid!109 thiss!1248))))

(assert (=> d!51171 (= (valid!720 thiss!1248) e!103390)))

(declare-fun b!157859 () Bool)

(declare-fun res!74604 () Bool)

(assert (=> b!157859 (=> (not res!74604) (not e!103390))))

(declare-fun arrayCountValidKeys!0 (array!5565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157859 (= res!74604 (= (arrayCountValidKeys!0 (_keys!4959 thiss!1248) #b00000000000000000000000000000000 (size!2916 (_keys!4959 thiss!1248))) (_size!789 thiss!1248)))))

(declare-fun b!157860 () Bool)

(declare-fun res!74605 () Bool)

(assert (=> b!157860 (=> (not res!74605) (not e!103390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5565 (_ BitVec 32)) Bool)

(assert (=> b!157860 (= res!74605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4959 thiss!1248) (mask!7673 thiss!1248)))))

(declare-fun b!157861 () Bool)

(declare-datatypes ((List!1870 0))(
  ( (Nil!1867) (Cons!1866 (h!2475 (_ BitVec 64)) (t!6664 List!1870)) )
))
(declare-fun arrayNoDuplicates!0 (array!5565 (_ BitVec 32) List!1870) Bool)

(assert (=> b!157861 (= e!103390 (arrayNoDuplicates!0 (_keys!4959 thiss!1248) #b00000000000000000000000000000000 Nil!1867))))

(assert (= (and d!51171 res!74603) b!157859))

(assert (= (and b!157859 res!74604) b!157860))

(assert (= (and b!157860 res!74605) b!157861))

(declare-fun m!191039 () Bool)

(assert (=> d!51171 m!191039))

(declare-fun m!191041 () Bool)

(assert (=> b!157859 m!191041))

(declare-fun m!191043 () Bool)

(assert (=> b!157860 m!191043))

(declare-fun m!191045 () Bool)

(assert (=> b!157861 m!191045))

(assert (=> start!15844 d!51171))

(declare-fun d!51173 () Bool)

(assert (=> d!51173 (= (validMask!0 (mask!7673 thiss!1248)) (and (or (= (mask!7673 thiss!1248) #b00000000000000000000000000000111) (= (mask!7673 thiss!1248) #b00000000000000000000000000001111) (= (mask!7673 thiss!1248) #b00000000000000000000000000011111) (= (mask!7673 thiss!1248) #b00000000000000000000000000111111) (= (mask!7673 thiss!1248) #b00000000000000000000000001111111) (= (mask!7673 thiss!1248) #b00000000000000000000000011111111) (= (mask!7673 thiss!1248) #b00000000000000000000000111111111) (= (mask!7673 thiss!1248) #b00000000000000000000001111111111) (= (mask!7673 thiss!1248) #b00000000000000000000011111111111) (= (mask!7673 thiss!1248) #b00000000000000000000111111111111) (= (mask!7673 thiss!1248) #b00000000000000000001111111111111) (= (mask!7673 thiss!1248) #b00000000000000000011111111111111) (= (mask!7673 thiss!1248) #b00000000000000000111111111111111) (= (mask!7673 thiss!1248) #b00000000000000001111111111111111) (= (mask!7673 thiss!1248) #b00000000000000011111111111111111) (= (mask!7673 thiss!1248) #b00000000000000111111111111111111) (= (mask!7673 thiss!1248) #b00000000000001111111111111111111) (= (mask!7673 thiss!1248) #b00000000000011111111111111111111) (= (mask!7673 thiss!1248) #b00000000000111111111111111111111) (= (mask!7673 thiss!1248) #b00000000001111111111111111111111) (= (mask!7673 thiss!1248) #b00000000011111111111111111111111) (= (mask!7673 thiss!1248) #b00000000111111111111111111111111) (= (mask!7673 thiss!1248) #b00000001111111111111111111111111) (= (mask!7673 thiss!1248) #b00000011111111111111111111111111) (= (mask!7673 thiss!1248) #b00000111111111111111111111111111) (= (mask!7673 thiss!1248) #b00001111111111111111111111111111) (= (mask!7673 thiss!1248) #b00011111111111111111111111111111) (= (mask!7673 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7673 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157810 d!51173))

(declare-fun b!157874 () Bool)

(declare-fun e!103399 () SeekEntryResult!283)

(declare-fun lt!81816 () SeekEntryResult!283)

(assert (=> b!157874 (= e!103399 (MissingZero!283 (index!3302 lt!81816)))))

(declare-fun d!51175 () Bool)

(declare-fun lt!81814 () SeekEntryResult!283)

(assert (=> d!51175 (and (or ((_ is Undefined!283) lt!81814) (not ((_ is Found!283) lt!81814)) (and (bvsge (index!3301 lt!81814) #b00000000000000000000000000000000) (bvslt (index!3301 lt!81814) (size!2916 (_keys!4959 thiss!1248))))) (or ((_ is Undefined!283) lt!81814) ((_ is Found!283) lt!81814) (not ((_ is MissingZero!283) lt!81814)) (and (bvsge (index!3300 lt!81814) #b00000000000000000000000000000000) (bvslt (index!3300 lt!81814) (size!2916 (_keys!4959 thiss!1248))))) (or ((_ is Undefined!283) lt!81814) ((_ is Found!283) lt!81814) ((_ is MissingZero!283) lt!81814) (not ((_ is MissingVacant!283) lt!81814)) (and (bvsge (index!3303 lt!81814) #b00000000000000000000000000000000) (bvslt (index!3303 lt!81814) (size!2916 (_keys!4959 thiss!1248))))) (or ((_ is Undefined!283) lt!81814) (ite ((_ is Found!283) lt!81814) (= (select (arr!2636 (_keys!4959 thiss!1248)) (index!3301 lt!81814)) key!828) (ite ((_ is MissingZero!283) lt!81814) (= (select (arr!2636 (_keys!4959 thiss!1248)) (index!3300 lt!81814)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!283) lt!81814) (= (select (arr!2636 (_keys!4959 thiss!1248)) (index!3303 lt!81814)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103398 () SeekEntryResult!283)

(assert (=> d!51175 (= lt!81814 e!103398)))

(declare-fun c!29736 () Bool)

(assert (=> d!51175 (= c!29736 (and ((_ is Intermediate!283) lt!81816) (undefined!1095 lt!81816)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5565 (_ BitVec 32)) SeekEntryResult!283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51175 (= lt!81816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7673 thiss!1248)) key!828 (_keys!4959 thiss!1248) (mask!7673 thiss!1248)))))

(assert (=> d!51175 (validMask!0 (mask!7673 thiss!1248))))

(assert (=> d!51175 (= (seekEntryOrOpen!0 key!828 (_keys!4959 thiss!1248) (mask!7673 thiss!1248)) lt!81814)))

(declare-fun b!157875 () Bool)

(declare-fun c!29738 () Bool)

(declare-fun lt!81815 () (_ BitVec 64))

(assert (=> b!157875 (= c!29738 (= lt!81815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103397 () SeekEntryResult!283)

(assert (=> b!157875 (= e!103397 e!103399)))

(declare-fun b!157876 () Bool)

(assert (=> b!157876 (= e!103397 (Found!283 (index!3302 lt!81816)))))

(declare-fun b!157877 () Bool)

(assert (=> b!157877 (= e!103398 e!103397)))

(assert (=> b!157877 (= lt!81815 (select (arr!2636 (_keys!4959 thiss!1248)) (index!3302 lt!81816)))))

(declare-fun c!29737 () Bool)

(assert (=> b!157877 (= c!29737 (= lt!81815 key!828))))

(declare-fun b!157878 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5565 (_ BitVec 32)) SeekEntryResult!283)

(assert (=> b!157878 (= e!103399 (seekKeyOrZeroReturnVacant!0 (x!17383 lt!81816) (index!3302 lt!81816) (index!3302 lt!81816) key!828 (_keys!4959 thiss!1248) (mask!7673 thiss!1248)))))

(declare-fun b!157879 () Bool)

(assert (=> b!157879 (= e!103398 Undefined!283)))

(assert (= (and d!51175 c!29736) b!157879))

(assert (= (and d!51175 (not c!29736)) b!157877))

(assert (= (and b!157877 c!29737) b!157876))

(assert (= (and b!157877 (not c!29737)) b!157875))

(assert (= (and b!157875 c!29738) b!157874))

(assert (= (and b!157875 (not c!29738)) b!157878))

(declare-fun m!191047 () Bool)

(assert (=> d!51175 m!191047))

(declare-fun m!191049 () Bool)

(assert (=> d!51175 m!191049))

(assert (=> d!51175 m!191047))

(declare-fun m!191051 () Bool)

(assert (=> d!51175 m!191051))

(assert (=> d!51175 m!191007))

(declare-fun m!191053 () Bool)

(assert (=> d!51175 m!191053))

(declare-fun m!191055 () Bool)

(assert (=> d!51175 m!191055))

(declare-fun m!191057 () Bool)

(assert (=> b!157877 m!191057))

(declare-fun m!191059 () Bool)

(assert (=> b!157878 m!191059))

(assert (=> b!157809 d!51175))

(declare-fun d!51177 () Bool)

(assert (=> d!51177 (= (array_inv!1681 (_keys!4959 thiss!1248)) (bvsge (size!2916 (_keys!4959 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157807 d!51177))

(declare-fun d!51179 () Bool)

(assert (=> d!51179 (= (array_inv!1682 (_values!3165 thiss!1248)) (bvsge (size!2917 (_values!3165 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157807 d!51179))

(declare-fun b!157887 () Bool)

(declare-fun e!103405 () Bool)

(assert (=> b!157887 (= e!103405 tp_is_empty!3259)))

(declare-fun condMapEmpty!5554 () Bool)

(declare-fun mapDefault!5554 () ValueCell!1286)

(assert (=> mapNonEmpty!5545 (= condMapEmpty!5554 (= mapRest!5545 ((as const (Array (_ BitVec 32) ValueCell!1286)) mapDefault!5554)))))

(declare-fun mapRes!5554 () Bool)

(assert (=> mapNonEmpty!5545 (= tp!12909 (and e!103405 mapRes!5554))))

(declare-fun mapIsEmpty!5554 () Bool)

(assert (=> mapIsEmpty!5554 mapRes!5554))

(declare-fun mapNonEmpty!5554 () Bool)

(declare-fun tp!12925 () Bool)

(declare-fun e!103404 () Bool)

(assert (=> mapNonEmpty!5554 (= mapRes!5554 (and tp!12925 e!103404))))

(declare-fun mapKey!5554 () (_ BitVec 32))

(declare-fun mapRest!5554 () (Array (_ BitVec 32) ValueCell!1286))

(declare-fun mapValue!5554 () ValueCell!1286)

(assert (=> mapNonEmpty!5554 (= mapRest!5545 (store mapRest!5554 mapKey!5554 mapValue!5554))))

(declare-fun b!157886 () Bool)

(assert (=> b!157886 (= e!103404 tp_is_empty!3259)))

(assert (= (and mapNonEmpty!5545 condMapEmpty!5554) mapIsEmpty!5554))

(assert (= (and mapNonEmpty!5545 (not condMapEmpty!5554)) mapNonEmpty!5554))

(assert (= (and mapNonEmpty!5554 ((_ is ValueCellFull!1286) mapValue!5554)) b!157886))

(assert (= (and mapNonEmpty!5545 ((_ is ValueCellFull!1286) mapDefault!5554)) b!157887))

(declare-fun m!191061 () Bool)

(assert (=> mapNonEmpty!5554 m!191061))

(check-sat (not d!51171) b_and!9885 (not b!157859) (not mapNonEmpty!5554) tp_is_empty!3259 (not b!157860) (not b_next!3457) (not b!157861) (not d!51175) (not b!157878))
(check-sat b_and!9885 (not b_next!3457))
