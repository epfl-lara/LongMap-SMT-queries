; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16082 () Bool)

(assert start!16082)

(declare-fun b!159763 () Bool)

(declare-fun b_free!3543 () Bool)

(declare-fun b_next!3543 () Bool)

(assert (=> b!159763 (= b_free!3543 (not b_next!3543))))

(declare-fun tp!13198 () Bool)

(declare-fun b_and!9957 () Bool)

(assert (=> b!159763 (= tp!13198 b_and!9957)))

(declare-fun mapIsEmpty!5705 () Bool)

(declare-fun mapRes!5705 () Bool)

(assert (=> mapIsEmpty!5705 mapRes!5705))

(declare-fun b!159759 () Bool)

(declare-fun res!75538 () Bool)

(declare-fun e!104535 () Bool)

(assert (=> b!159759 (=> (not res!75538) (not e!104535))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4107 0))(
  ( (V!4108 (val!1717 Int)) )
))
(declare-datatypes ((ValueCell!1329 0))(
  ( (ValueCellFull!1329 (v!3582 V!4107)) (EmptyCell!1329) )
))
(declare-datatypes ((array!5769 0))(
  ( (array!5770 (arr!2729 (Array (_ BitVec 32) (_ BitVec 64))) (size!3013 (_ BitVec 32))) )
))
(declare-datatypes ((array!5771 0))(
  ( (array!5772 (arr!2730 (Array (_ BitVec 32) ValueCell!1329)) (size!3014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1566 0))(
  ( (LongMapFixedSize!1567 (defaultEntry!3225 Int) (mask!7781 (_ BitVec 32)) (extraKeys!2966 (_ BitVec 32)) (zeroValue!3068 V!4107) (minValue!3068 V!4107) (_size!832 (_ BitVec 32)) (_keys!5026 array!5769) (_values!3208 array!5771) (_vacant!832 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1566)

(get-info :version)

(declare-datatypes ((SeekEntryResult!317 0))(
  ( (MissingZero!317 (index!3436 (_ BitVec 32))) (Found!317 (index!3437 (_ BitVec 32))) (Intermediate!317 (undefined!1129 Bool) (index!3438 (_ BitVec 32)) (x!17637 (_ BitVec 32))) (Undefined!317) (MissingVacant!317 (index!3439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5769 (_ BitVec 32)) SeekEntryResult!317)

(assert (=> b!159759 (= res!75538 ((_ is Undefined!317) (seekEntryOrOpen!0 key!828 (_keys!5026 thiss!1248) (mask!7781 thiss!1248))))))

(declare-fun b!159760 () Bool)

(assert (=> b!159760 (= e!104535 false)))

(declare-fun lt!82027 () Bool)

(declare-datatypes ((List!1918 0))(
  ( (Nil!1915) (Cons!1914 (h!2527 (_ BitVec 64)) (t!6720 List!1918)) )
))
(declare-fun arrayNoDuplicates!0 (array!5769 (_ BitVec 32) List!1918) Bool)

(assert (=> b!159760 (= lt!82027 (arrayNoDuplicates!0 (_keys!5026 thiss!1248) #b00000000000000000000000000000000 Nil!1915))))

(declare-fun b!159761 () Bool)

(declare-fun e!104537 () Bool)

(declare-fun e!104538 () Bool)

(assert (=> b!159761 (= e!104537 (and e!104538 mapRes!5705))))

(declare-fun condMapEmpty!5705 () Bool)

(declare-fun mapDefault!5705 () ValueCell!1329)

(assert (=> b!159761 (= condMapEmpty!5705 (= (arr!2730 (_values!3208 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1329)) mapDefault!5705)))))

(declare-fun res!75533 () Bool)

(assert (=> start!16082 (=> (not res!75533) (not e!104535))))

(declare-fun valid!730 (LongMapFixedSize!1566) Bool)

(assert (=> start!16082 (= res!75533 (valid!730 thiss!1248))))

(assert (=> start!16082 e!104535))

(declare-fun e!104534 () Bool)

(assert (=> start!16082 e!104534))

(assert (=> start!16082 true))

(declare-fun mapNonEmpty!5705 () Bool)

(declare-fun tp!13199 () Bool)

(declare-fun e!104533 () Bool)

(assert (=> mapNonEmpty!5705 (= mapRes!5705 (and tp!13199 e!104533))))

(declare-fun mapRest!5705 () (Array (_ BitVec 32) ValueCell!1329))

(declare-fun mapKey!5705 () (_ BitVec 32))

(declare-fun mapValue!5705 () ValueCell!1329)

(assert (=> mapNonEmpty!5705 (= (arr!2730 (_values!3208 thiss!1248)) (store mapRest!5705 mapKey!5705 mapValue!5705))))

(declare-fun b!159762 () Bool)

(declare-fun tp_is_empty!3345 () Bool)

(assert (=> b!159762 (= e!104538 tp_is_empty!3345)))

(declare-fun array_inv!1735 (array!5769) Bool)

(declare-fun array_inv!1736 (array!5771) Bool)

(assert (=> b!159763 (= e!104534 (and tp!13198 tp_is_empty!3345 (array_inv!1735 (_keys!5026 thiss!1248)) (array_inv!1736 (_values!3208 thiss!1248)) e!104537))))

(declare-fun b!159764 () Bool)

(declare-fun res!75535 () Bool)

(assert (=> b!159764 (=> (not res!75535) (not e!104535))))

(assert (=> b!159764 (= res!75535 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159765 () Bool)

(declare-fun res!75534 () Bool)

(assert (=> b!159765 (=> (not res!75534) (not e!104535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5769 (_ BitVec 32)) Bool)

(assert (=> b!159765 (= res!75534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5026 thiss!1248) (mask!7781 thiss!1248)))))

(declare-fun b!159766 () Bool)

(declare-fun res!75536 () Bool)

(assert (=> b!159766 (=> (not res!75536) (not e!104535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159766 (= res!75536 (validMask!0 (mask!7781 thiss!1248)))))

(declare-fun b!159767 () Bool)

(declare-fun res!75539 () Bool)

(assert (=> b!159767 (=> (not res!75539) (not e!104535))))

(assert (=> b!159767 (= res!75539 (and (= (size!3014 (_values!3208 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7781 thiss!1248))) (= (size!3013 (_keys!5026 thiss!1248)) (size!3014 (_values!3208 thiss!1248))) (bvsge (mask!7781 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2966 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2966 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159768 () Bool)

(declare-fun res!75537 () Bool)

(assert (=> b!159768 (=> (not res!75537) (not e!104535))))

(declare-datatypes ((tuple2!2896 0))(
  ( (tuple2!2897 (_1!1459 (_ BitVec 64)) (_2!1459 V!4107)) )
))
(declare-datatypes ((List!1919 0))(
  ( (Nil!1916) (Cons!1915 (h!2528 tuple2!2896) (t!6721 List!1919)) )
))
(declare-datatypes ((ListLongMap!1883 0))(
  ( (ListLongMap!1884 (toList!957 List!1919)) )
))
(declare-fun contains!993 (ListLongMap!1883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!621 (array!5769 array!5771 (_ BitVec 32) (_ BitVec 32) V!4107 V!4107 (_ BitVec 32) Int) ListLongMap!1883)

(assert (=> b!159768 (= res!75537 (contains!993 (getCurrentListMap!621 (_keys!5026 thiss!1248) (_values!3208 thiss!1248) (mask!7781 thiss!1248) (extraKeys!2966 thiss!1248) (zeroValue!3068 thiss!1248) (minValue!3068 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3225 thiss!1248)) key!828))))

(declare-fun b!159769 () Bool)

(assert (=> b!159769 (= e!104533 tp_is_empty!3345)))

(assert (= (and start!16082 res!75533) b!159764))

(assert (= (and b!159764 res!75535) b!159759))

(assert (= (and b!159759 res!75538) b!159768))

(assert (= (and b!159768 res!75537) b!159766))

(assert (= (and b!159766 res!75536) b!159767))

(assert (= (and b!159767 res!75539) b!159765))

(assert (= (and b!159765 res!75534) b!159760))

(assert (= (and b!159761 condMapEmpty!5705) mapIsEmpty!5705))

(assert (= (and b!159761 (not condMapEmpty!5705)) mapNonEmpty!5705))

(assert (= (and mapNonEmpty!5705 ((_ is ValueCellFull!1329) mapValue!5705)) b!159769))

(assert (= (and b!159761 ((_ is ValueCellFull!1329) mapDefault!5705)) b!159762))

(assert (= b!159763 b!159761))

(assert (= start!16082 b!159763))

(declare-fun m!191897 () Bool)

(assert (=> b!159766 m!191897))

(declare-fun m!191899 () Bool)

(assert (=> b!159765 m!191899))

(declare-fun m!191901 () Bool)

(assert (=> mapNonEmpty!5705 m!191901))

(declare-fun m!191903 () Bool)

(assert (=> b!159763 m!191903))

(declare-fun m!191905 () Bool)

(assert (=> b!159763 m!191905))

(declare-fun m!191907 () Bool)

(assert (=> b!159759 m!191907))

(declare-fun m!191909 () Bool)

(assert (=> b!159768 m!191909))

(assert (=> b!159768 m!191909))

(declare-fun m!191911 () Bool)

(assert (=> b!159768 m!191911))

(declare-fun m!191913 () Bool)

(assert (=> b!159760 m!191913))

(declare-fun m!191915 () Bool)

(assert (=> start!16082 m!191915))

(check-sat (not b!159765) tp_is_empty!3345 (not b!159766) (not mapNonEmpty!5705) (not b!159768) (not start!16082) b_and!9957 (not b_next!3543) (not b!159759) (not b!159763) (not b!159760))
(check-sat b_and!9957 (not b_next!3543))
