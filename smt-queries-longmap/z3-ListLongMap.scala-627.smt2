; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16114 () Bool)

(assert start!16114)

(declare-fun b!160076 () Bool)

(declare-fun b_free!3571 () Bool)

(declare-fun b_next!3571 () Bool)

(assert (=> b!160076 (= b_free!3571 (not b_next!3571))))

(declare-fun tp!13282 () Bool)

(declare-fun b_and!9959 () Bool)

(assert (=> b!160076 (= tp!13282 b_and!9959)))

(declare-fun b!160074 () Bool)

(declare-fun e!104687 () Bool)

(assert (=> b!160074 (= e!104687 false)))

(declare-fun lt!81888 () Bool)

(declare-datatypes ((V!4145 0))(
  ( (V!4146 (val!1731 Int)) )
))
(declare-datatypes ((ValueCell!1343 0))(
  ( (ValueCellFull!1343 (v!3590 V!4145)) (EmptyCell!1343) )
))
(declare-datatypes ((array!5805 0))(
  ( (array!5806 (arr!2746 (Array (_ BitVec 32) (_ BitVec 64))) (size!3031 (_ BitVec 32))) )
))
(declare-datatypes ((array!5807 0))(
  ( (array!5808 (arr!2747 (Array (_ BitVec 32) ValueCell!1343)) (size!3032 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1594 0))(
  ( (LongMapFixedSize!1595 (defaultEntry!3239 Int) (mask!7804 (_ BitVec 32)) (extraKeys!2980 (_ BitVec 32)) (zeroValue!3082 V!4145) (minValue!3082 V!4145) (_size!846 (_ BitVec 32)) (_keys!5039 array!5805) (_values!3222 array!5807) (_vacant!846 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1594)

(declare-datatypes ((List!1929 0))(
  ( (Nil!1926) (Cons!1925 (h!2538 (_ BitVec 64)) (t!6722 List!1929)) )
))
(declare-fun arrayNoDuplicates!0 (array!5805 (_ BitVec 32) List!1929) Bool)

(assert (=> b!160074 (= lt!81888 (arrayNoDuplicates!0 (_keys!5039 thiss!1248) #b00000000000000000000000000000000 Nil!1926))))

(declare-fun res!75732 () Bool)

(assert (=> start!16114 (=> (not res!75732) (not e!104687))))

(declare-fun valid!741 (LongMapFixedSize!1594) Bool)

(assert (=> start!16114 (= res!75732 (valid!741 thiss!1248))))

(assert (=> start!16114 e!104687))

(declare-fun e!104689 () Bool)

(assert (=> start!16114 e!104689))

(assert (=> start!16114 true))

(declare-fun b!160075 () Bool)

(declare-fun res!75738 () Bool)

(assert (=> b!160075 (=> (not res!75738) (not e!104687))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2878 0))(
  ( (tuple2!2879 (_1!1450 (_ BitVec 64)) (_2!1450 V!4145)) )
))
(declare-datatypes ((List!1930 0))(
  ( (Nil!1927) (Cons!1926 (h!2539 tuple2!2878) (t!6723 List!1930)) )
))
(declare-datatypes ((ListLongMap!1865 0))(
  ( (ListLongMap!1866 (toList!948 List!1930)) )
))
(declare-fun contains!987 (ListLongMap!1865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!598 (array!5805 array!5807 (_ BitVec 32) (_ BitVec 32) V!4145 V!4145 (_ BitVec 32) Int) ListLongMap!1865)

(assert (=> b!160075 (= res!75738 (not (contains!987 (getCurrentListMap!598 (_keys!5039 thiss!1248) (_values!3222 thiss!1248) (mask!7804 thiss!1248) (extraKeys!2980 thiss!1248) (zeroValue!3082 thiss!1248) (minValue!3082 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3239 thiss!1248)) key!828)))))

(declare-fun e!104684 () Bool)

(declare-fun tp_is_empty!3373 () Bool)

(declare-fun array_inv!1759 (array!5805) Bool)

(declare-fun array_inv!1760 (array!5807) Bool)

(assert (=> b!160076 (= e!104689 (and tp!13282 tp_is_empty!3373 (array_inv!1759 (_keys!5039 thiss!1248)) (array_inv!1760 (_values!3222 thiss!1248)) e!104684))))

(declare-fun b!160077 () Bool)

(declare-fun e!104685 () Bool)

(assert (=> b!160077 (= e!104685 tp_is_empty!3373)))

(declare-fun mapNonEmpty!5747 () Bool)

(declare-fun mapRes!5747 () Bool)

(declare-fun tp!13283 () Bool)

(assert (=> mapNonEmpty!5747 (= mapRes!5747 (and tp!13283 e!104685))))

(declare-fun mapKey!5747 () (_ BitVec 32))

(declare-fun mapValue!5747 () ValueCell!1343)

(declare-fun mapRest!5747 () (Array (_ BitVec 32) ValueCell!1343))

(assert (=> mapNonEmpty!5747 (= (arr!2747 (_values!3222 thiss!1248)) (store mapRest!5747 mapKey!5747 mapValue!5747))))

(declare-fun mapIsEmpty!5747 () Bool)

(assert (=> mapIsEmpty!5747 mapRes!5747))

(declare-fun b!160078 () Bool)

(declare-fun res!75733 () Bool)

(assert (=> b!160078 (=> (not res!75733) (not e!104687))))

(assert (=> b!160078 (= res!75733 (and (= (size!3032 (_values!3222 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7804 thiss!1248))) (= (size!3031 (_keys!5039 thiss!1248)) (size!3032 (_values!3222 thiss!1248))) (bvsge (mask!7804 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2980 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2980 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160079 () Bool)

(declare-fun res!75737 () Bool)

(assert (=> b!160079 (=> (not res!75737) (not e!104687))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!332 0))(
  ( (MissingZero!332 (index!3496 (_ BitVec 32))) (Found!332 (index!3497 (_ BitVec 32))) (Intermediate!332 (undefined!1144 Bool) (index!3498 (_ BitVec 32)) (x!17691 (_ BitVec 32))) (Undefined!332) (MissingVacant!332 (index!3499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5805 (_ BitVec 32)) SeekEntryResult!332)

(assert (=> b!160079 (= res!75737 ((_ is Undefined!332) (seekEntryOrOpen!0 key!828 (_keys!5039 thiss!1248) (mask!7804 thiss!1248))))))

(declare-fun b!160080 () Bool)

(declare-fun e!104686 () Bool)

(assert (=> b!160080 (= e!104684 (and e!104686 mapRes!5747))))

(declare-fun condMapEmpty!5747 () Bool)

(declare-fun mapDefault!5747 () ValueCell!1343)

(assert (=> b!160080 (= condMapEmpty!5747 (= (arr!2747 (_values!3222 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1343)) mapDefault!5747)))))

(declare-fun b!160081 () Bool)

(declare-fun res!75735 () Bool)

(assert (=> b!160081 (=> (not res!75735) (not e!104687))))

(assert (=> b!160081 (= res!75735 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160082 () Bool)

(assert (=> b!160082 (= e!104686 tp_is_empty!3373)))

(declare-fun b!160083 () Bool)

(declare-fun res!75734 () Bool)

(assert (=> b!160083 (=> (not res!75734) (not e!104687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160083 (= res!75734 (validMask!0 (mask!7804 thiss!1248)))))

(declare-fun b!160084 () Bool)

(declare-fun res!75736 () Bool)

(assert (=> b!160084 (=> (not res!75736) (not e!104687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5805 (_ BitVec 32)) Bool)

(assert (=> b!160084 (= res!75736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5039 thiss!1248) (mask!7804 thiss!1248)))))

(assert (= (and start!16114 res!75732) b!160081))

(assert (= (and b!160081 res!75735) b!160079))

(assert (= (and b!160079 res!75737) b!160075))

(assert (= (and b!160075 res!75738) b!160083))

(assert (= (and b!160083 res!75734) b!160078))

(assert (= (and b!160078 res!75733) b!160084))

(assert (= (and b!160084 res!75736) b!160074))

(assert (= (and b!160080 condMapEmpty!5747) mapIsEmpty!5747))

(assert (= (and b!160080 (not condMapEmpty!5747)) mapNonEmpty!5747))

(assert (= (and mapNonEmpty!5747 ((_ is ValueCellFull!1343) mapValue!5747)) b!160077))

(assert (= (and b!160080 ((_ is ValueCellFull!1343) mapDefault!5747)) b!160082))

(assert (= b!160076 b!160080))

(assert (= start!16114 b!160076))

(declare-fun m!191557 () Bool)

(assert (=> start!16114 m!191557))

(declare-fun m!191559 () Bool)

(assert (=> b!160076 m!191559))

(declare-fun m!191561 () Bool)

(assert (=> b!160076 m!191561))

(declare-fun m!191563 () Bool)

(assert (=> b!160084 m!191563))

(declare-fun m!191565 () Bool)

(assert (=> b!160079 m!191565))

(declare-fun m!191567 () Bool)

(assert (=> b!160075 m!191567))

(assert (=> b!160075 m!191567))

(declare-fun m!191569 () Bool)

(assert (=> b!160075 m!191569))

(declare-fun m!191571 () Bool)

(assert (=> b!160074 m!191571))

(declare-fun m!191573 () Bool)

(assert (=> b!160083 m!191573))

(declare-fun m!191575 () Bool)

(assert (=> mapNonEmpty!5747 m!191575))

(check-sat (not b!160079) (not b!160075) tp_is_empty!3373 (not b!160076) (not start!16114) (not b!160074) (not mapNonEmpty!5747) b_and!9959 (not b!160083) (not b!160084) (not b_next!3571))
(check-sat b_and!9959 (not b_next!3571))
