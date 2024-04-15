; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16132 () Bool)

(assert start!16132)

(declare-fun b!160380 () Bool)

(declare-fun b_free!3589 () Bool)

(declare-fun b_next!3589 () Bool)

(assert (=> b!160380 (= b_free!3589 (not b_next!3589))))

(declare-fun tp!13337 () Bool)

(declare-fun b_and!9977 () Bool)

(assert (=> b!160380 (= tp!13337 b_and!9977)))

(declare-fun b!160371 () Bool)

(declare-fun e!104851 () Bool)

(declare-fun e!104846 () Bool)

(declare-fun mapRes!5774 () Bool)

(assert (=> b!160371 (= e!104851 (and e!104846 mapRes!5774))))

(declare-fun condMapEmpty!5774 () Bool)

(declare-datatypes ((V!4169 0))(
  ( (V!4170 (val!1740 Int)) )
))
(declare-datatypes ((ValueCell!1352 0))(
  ( (ValueCellFull!1352 (v!3599 V!4169)) (EmptyCell!1352) )
))
(declare-datatypes ((array!5841 0))(
  ( (array!5842 (arr!2764 (Array (_ BitVec 32) (_ BitVec 64))) (size!3049 (_ BitVec 32))) )
))
(declare-datatypes ((array!5843 0))(
  ( (array!5844 (arr!2765 (Array (_ BitVec 32) ValueCell!1352)) (size!3050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1612 0))(
  ( (LongMapFixedSize!1613 (defaultEntry!3248 Int) (mask!7819 (_ BitVec 32)) (extraKeys!2989 (_ BitVec 32)) (zeroValue!3091 V!4169) (minValue!3091 V!4169) (_size!855 (_ BitVec 32)) (_keys!5048 array!5841) (_values!3231 array!5843) (_vacant!855 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1612)

(declare-fun mapDefault!5774 () ValueCell!1352)

(assert (=> b!160371 (= condMapEmpty!5774 (= (arr!2765 (_values!3231 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1352)) mapDefault!5774)))))

(declare-fun b!160372 () Bool)

(declare-fun res!75924 () Bool)

(declare-fun e!104849 () Bool)

(assert (=> b!160372 (=> (not res!75924) (not e!104849))))

(assert (=> b!160372 (= res!75924 (and (= (size!3050 (_values!3231 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7819 thiss!1248))) (= (size!3049 (_keys!5048 thiss!1248)) (size!3050 (_values!3231 thiss!1248))) (bvsge (mask!7819 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2989 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2989 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5774 () Bool)

(assert (=> mapIsEmpty!5774 mapRes!5774))

(declare-fun mapNonEmpty!5774 () Bool)

(declare-fun tp!13336 () Bool)

(declare-fun e!104847 () Bool)

(assert (=> mapNonEmpty!5774 (= mapRes!5774 (and tp!13336 e!104847))))

(declare-fun mapRest!5774 () (Array (_ BitVec 32) ValueCell!1352))

(declare-fun mapKey!5774 () (_ BitVec 32))

(declare-fun mapValue!5774 () ValueCell!1352)

(assert (=> mapNonEmpty!5774 (= (arr!2765 (_values!3231 thiss!1248)) (store mapRest!5774 mapKey!5774 mapValue!5774))))

(declare-fun b!160373 () Bool)

(declare-fun res!75921 () Bool)

(assert (=> b!160373 (=> (not res!75921) (not e!104849))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160373 (= res!75921 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160374 () Bool)

(declare-fun res!75927 () Bool)

(assert (=> b!160374 (=> (not res!75927) (not e!104849))))

(declare-datatypes ((tuple2!2894 0))(
  ( (tuple2!2895 (_1!1458 (_ BitVec 64)) (_2!1458 V!4169)) )
))
(declare-datatypes ((List!1945 0))(
  ( (Nil!1942) (Cons!1941 (h!2554 tuple2!2894) (t!6738 List!1945)) )
))
(declare-datatypes ((ListLongMap!1881 0))(
  ( (ListLongMap!1882 (toList!956 List!1945)) )
))
(declare-fun contains!995 (ListLongMap!1881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!606 (array!5841 array!5843 (_ BitVec 32) (_ BitVec 32) V!4169 V!4169 (_ BitVec 32) Int) ListLongMap!1881)

(assert (=> b!160374 (= res!75927 (not (contains!995 (getCurrentListMap!606 (_keys!5048 thiss!1248) (_values!3231 thiss!1248) (mask!7819 thiss!1248) (extraKeys!2989 thiss!1248) (zeroValue!3091 thiss!1248) (minValue!3091 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3248 thiss!1248)) key!828)))))

(declare-fun b!160375 () Bool)

(declare-fun tp_is_empty!3391 () Bool)

(assert (=> b!160375 (= e!104847 tp_is_empty!3391)))

(declare-fun b!160376 () Bool)

(assert (=> b!160376 (= e!104846 tp_is_empty!3391)))

(declare-fun b!160377 () Bool)

(assert (=> b!160377 (= e!104849 false)))

(declare-fun lt!81915 () Bool)

(declare-datatypes ((List!1946 0))(
  ( (Nil!1943) (Cons!1942 (h!2555 (_ BitVec 64)) (t!6739 List!1946)) )
))
(declare-fun arrayNoDuplicates!0 (array!5841 (_ BitVec 32) List!1946) Bool)

(assert (=> b!160377 (= lt!81915 (arrayNoDuplicates!0 (_keys!5048 thiss!1248) #b00000000000000000000000000000000 Nil!1943))))

(declare-fun b!160378 () Bool)

(declare-fun res!75925 () Bool)

(assert (=> b!160378 (=> (not res!75925) (not e!104849))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!340 0))(
  ( (MissingZero!340 (index!3528 (_ BitVec 32))) (Found!340 (index!3529 (_ BitVec 32))) (Intermediate!340 (undefined!1152 Bool) (index!3530 (_ BitVec 32)) (x!17723 (_ BitVec 32))) (Undefined!340) (MissingVacant!340 (index!3531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5841 (_ BitVec 32)) SeekEntryResult!340)

(assert (=> b!160378 (= res!75925 ((_ is Undefined!340) (seekEntryOrOpen!0 key!828 (_keys!5048 thiss!1248) (mask!7819 thiss!1248))))))

(declare-fun res!75926 () Bool)

(assert (=> start!16132 (=> (not res!75926) (not e!104849))))

(declare-fun valid!746 (LongMapFixedSize!1612) Bool)

(assert (=> start!16132 (= res!75926 (valid!746 thiss!1248))))

(assert (=> start!16132 e!104849))

(declare-fun e!104848 () Bool)

(assert (=> start!16132 e!104848))

(assert (=> start!16132 true))

(declare-fun b!160379 () Bool)

(declare-fun res!75923 () Bool)

(assert (=> b!160379 (=> (not res!75923) (not e!104849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5841 (_ BitVec 32)) Bool)

(assert (=> b!160379 (= res!75923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5048 thiss!1248) (mask!7819 thiss!1248)))))

(declare-fun array_inv!1775 (array!5841) Bool)

(declare-fun array_inv!1776 (array!5843) Bool)

(assert (=> b!160380 (= e!104848 (and tp!13337 tp_is_empty!3391 (array_inv!1775 (_keys!5048 thiss!1248)) (array_inv!1776 (_values!3231 thiss!1248)) e!104851))))

(declare-fun b!160381 () Bool)

(declare-fun res!75922 () Bool)

(assert (=> b!160381 (=> (not res!75922) (not e!104849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160381 (= res!75922 (validMask!0 (mask!7819 thiss!1248)))))

(assert (= (and start!16132 res!75926) b!160373))

(assert (= (and b!160373 res!75921) b!160378))

(assert (= (and b!160378 res!75925) b!160374))

(assert (= (and b!160374 res!75927) b!160381))

(assert (= (and b!160381 res!75922) b!160372))

(assert (= (and b!160372 res!75924) b!160379))

(assert (= (and b!160379 res!75923) b!160377))

(assert (= (and b!160371 condMapEmpty!5774) mapIsEmpty!5774))

(assert (= (and b!160371 (not condMapEmpty!5774)) mapNonEmpty!5774))

(assert (= (and mapNonEmpty!5774 ((_ is ValueCellFull!1352) mapValue!5774)) b!160375))

(assert (= (and b!160371 ((_ is ValueCellFull!1352) mapDefault!5774)) b!160376))

(assert (= b!160380 b!160371))

(assert (= start!16132 b!160380))

(declare-fun m!191737 () Bool)

(assert (=> start!16132 m!191737))

(declare-fun m!191739 () Bool)

(assert (=> b!160379 m!191739))

(declare-fun m!191741 () Bool)

(assert (=> b!160378 m!191741))

(declare-fun m!191743 () Bool)

(assert (=> b!160377 m!191743))

(declare-fun m!191745 () Bool)

(assert (=> b!160374 m!191745))

(assert (=> b!160374 m!191745))

(declare-fun m!191747 () Bool)

(assert (=> b!160374 m!191747))

(declare-fun m!191749 () Bool)

(assert (=> b!160381 m!191749))

(declare-fun m!191751 () Bool)

(assert (=> mapNonEmpty!5774 m!191751))

(declare-fun m!191753 () Bool)

(assert (=> b!160380 m!191753))

(declare-fun m!191755 () Bool)

(assert (=> b!160380 m!191755))

(check-sat (not b!160378) (not b!160374) (not start!16132) (not b!160379) (not b!160381) (not b!160377) tp_is_empty!3391 (not mapNonEmpty!5774) b_and!9977 (not b!160380) (not b_next!3589))
(check-sat b_and!9977 (not b_next!3589))
