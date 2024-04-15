; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16624 () Bool)

(assert start!16624)

(declare-fun b!165759 () Bool)

(declare-fun b_free!3925 () Bool)

(declare-fun b_next!3925 () Bool)

(assert (=> b!165759 (= b_free!3925 (not b_next!3925))))

(declare-fun tp!14375 () Bool)

(declare-fun b_and!10313 () Bool)

(assert (=> b!165759 (= tp!14375 b_and!10313)))

(declare-fun b!165752 () Bool)

(declare-fun e!108717 () Bool)

(assert (=> b!165752 (= e!108717 false)))

(declare-fun lt!82973 () Bool)

(declare-datatypes ((V!4617 0))(
  ( (V!4618 (val!1908 Int)) )
))
(declare-datatypes ((ValueCell!1520 0))(
  ( (ValueCellFull!1520 (v!3767 V!4617)) (EmptyCell!1520) )
))
(declare-datatypes ((array!6531 0))(
  ( (array!6532 (arr!3100 (Array (_ BitVec 32) (_ BitVec 64))) (size!3389 (_ BitVec 32))) )
))
(declare-datatypes ((array!6533 0))(
  ( (array!6534 (arr!3101 (Array (_ BitVec 32) ValueCell!1520)) (size!3390 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1948 0))(
  ( (LongMapFixedSize!1949 (defaultEntry!3416 Int) (mask!8136 (_ BitVec 32)) (extraKeys!3157 (_ BitVec 32)) (zeroValue!3259 V!4617) (minValue!3259 V!4617) (_size!1023 (_ BitVec 32)) (_keys!5240 array!6531) (_values!3399 array!6533) (_vacant!1023 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1948)

(declare-datatypes ((List!2075 0))(
  ( (Nil!2072) (Cons!2071 (h!2688 (_ BitVec 64)) (t!6868 List!2075)) )
))
(declare-fun arrayNoDuplicates!0 (array!6531 (_ BitVec 32) List!2075) Bool)

(assert (=> b!165752 (= lt!82973 (arrayNoDuplicates!0 (_keys!5240 thiss!1248) #b00000000000000000000000000000000 Nil!2072))))

(declare-fun b!165753 () Bool)

(declare-fun e!108716 () Bool)

(declare-fun tp_is_empty!3727 () Bool)

(assert (=> b!165753 (= e!108716 tp_is_empty!3727)))

(declare-fun res!78688 () Bool)

(declare-fun e!108719 () Bool)

(assert (=> start!16624 (=> (not res!78688) (not e!108719))))

(declare-fun valid!865 (LongMapFixedSize!1948) Bool)

(assert (=> start!16624 (= res!78688 (valid!865 thiss!1248))))

(assert (=> start!16624 e!108719))

(declare-fun e!108718 () Bool)

(assert (=> start!16624 e!108718))

(assert (=> start!16624 true))

(declare-fun b!165754 () Bool)

(declare-fun res!78690 () Bool)

(assert (=> b!165754 (=> (not res!78690) (not e!108717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6531 (_ BitVec 32)) Bool)

(assert (=> b!165754 (= res!78690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5240 thiss!1248) (mask!8136 thiss!1248)))))

(declare-fun b!165755 () Bool)

(assert (=> b!165755 (= e!108719 e!108717)))

(declare-fun res!78689 () Bool)

(assert (=> b!165755 (=> (not res!78689) (not e!108717))))

(declare-datatypes ((SeekEntryResult!457 0))(
  ( (MissingZero!457 (index!3996 (_ BitVec 32))) (Found!457 (index!3997 (_ BitVec 32))) (Intermediate!457 (undefined!1269 Bool) (index!3998 (_ BitVec 32)) (x!18396 (_ BitVec 32))) (Undefined!457) (MissingVacant!457 (index!3999 (_ BitVec 32))) )
))
(declare-fun lt!82974 () SeekEntryResult!457)

(get-info :version)

(assert (=> b!165755 (= res!78689 (and (not ((_ is Undefined!457) lt!82974)) (not ((_ is MissingVacant!457) lt!82974)) (not ((_ is MissingZero!457) lt!82974)) ((_ is Found!457) lt!82974)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6531 (_ BitVec 32)) SeekEntryResult!457)

(assert (=> b!165755 (= lt!82974 (seekEntryOrOpen!0 key!828 (_keys!5240 thiss!1248) (mask!8136 thiss!1248)))))

(declare-fun mapIsEmpty!6309 () Bool)

(declare-fun mapRes!6309 () Bool)

(assert (=> mapIsEmpty!6309 mapRes!6309))

(declare-fun b!165756 () Bool)

(declare-fun res!78694 () Bool)

(assert (=> b!165756 (=> (not res!78694) (not e!108717))))

(declare-datatypes ((tuple2!3072 0))(
  ( (tuple2!3073 (_1!1547 (_ BitVec 64)) (_2!1547 V!4617)) )
))
(declare-datatypes ((List!2076 0))(
  ( (Nil!2073) (Cons!2072 (h!2689 tuple2!3072) (t!6869 List!2076)) )
))
(declare-datatypes ((ListLongMap!2015 0))(
  ( (ListLongMap!2016 (toList!1023 List!2076)) )
))
(declare-fun contains!1068 (ListLongMap!2015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!665 (array!6531 array!6533 (_ BitVec 32) (_ BitVec 32) V!4617 V!4617 (_ BitVec 32) Int) ListLongMap!2015)

(assert (=> b!165756 (= res!78694 (not (contains!1068 (getCurrentListMap!665 (_keys!5240 thiss!1248) (_values!3399 thiss!1248) (mask!8136 thiss!1248) (extraKeys!3157 thiss!1248) (zeroValue!3259 thiss!1248) (minValue!3259 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3416 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6309 () Bool)

(declare-fun tp!14376 () Bool)

(assert (=> mapNonEmpty!6309 (= mapRes!6309 (and tp!14376 e!108716))))

(declare-fun mapRest!6309 () (Array (_ BitVec 32) ValueCell!1520))

(declare-fun mapKey!6309 () (_ BitVec 32))

(declare-fun mapValue!6309 () ValueCell!1520)

(assert (=> mapNonEmpty!6309 (= (arr!3101 (_values!3399 thiss!1248)) (store mapRest!6309 mapKey!6309 mapValue!6309))))

(declare-fun b!165757 () Bool)

(declare-fun e!108714 () Bool)

(declare-fun e!108720 () Bool)

(assert (=> b!165757 (= e!108714 (and e!108720 mapRes!6309))))

(declare-fun condMapEmpty!6309 () Bool)

(declare-fun mapDefault!6309 () ValueCell!1520)

(assert (=> b!165757 (= condMapEmpty!6309 (= (arr!3101 (_values!3399 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1520)) mapDefault!6309)))))

(declare-fun b!165758 () Bool)

(assert (=> b!165758 (= e!108720 tp_is_empty!3727)))

(declare-fun array_inv!1995 (array!6531) Bool)

(declare-fun array_inv!1996 (array!6533) Bool)

(assert (=> b!165759 (= e!108718 (and tp!14375 tp_is_empty!3727 (array_inv!1995 (_keys!5240 thiss!1248)) (array_inv!1996 (_values!3399 thiss!1248)) e!108714))))

(declare-fun b!165760 () Bool)

(declare-fun res!78691 () Bool)

(assert (=> b!165760 (=> (not res!78691) (not e!108717))))

(assert (=> b!165760 (= res!78691 (and (= (size!3390 (_values!3399 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8136 thiss!1248))) (= (size!3389 (_keys!5240 thiss!1248)) (size!3390 (_values!3399 thiss!1248))) (bvsge (mask!8136 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3157 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3157 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165761 () Bool)

(declare-fun res!78692 () Bool)

(assert (=> b!165761 (=> (not res!78692) (not e!108717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165761 (= res!78692 (validMask!0 (mask!8136 thiss!1248)))))

(declare-fun b!165762 () Bool)

(declare-fun res!78693 () Bool)

(assert (=> b!165762 (=> (not res!78693) (not e!108719))))

(assert (=> b!165762 (= res!78693 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16624 res!78688) b!165762))

(assert (= (and b!165762 res!78693) b!165755))

(assert (= (and b!165755 res!78689) b!165756))

(assert (= (and b!165756 res!78694) b!165761))

(assert (= (and b!165761 res!78692) b!165760))

(assert (= (and b!165760 res!78691) b!165754))

(assert (= (and b!165754 res!78690) b!165752))

(assert (= (and b!165757 condMapEmpty!6309) mapIsEmpty!6309))

(assert (= (and b!165757 (not condMapEmpty!6309)) mapNonEmpty!6309))

(assert (= (and mapNonEmpty!6309 ((_ is ValueCellFull!1520) mapValue!6309)) b!165753))

(assert (= (and b!165757 ((_ is ValueCellFull!1520) mapDefault!6309)) b!165758))

(assert (= b!165759 b!165757))

(assert (= start!16624 b!165759))

(declare-fun m!194911 () Bool)

(assert (=> b!165754 m!194911))

(declare-fun m!194913 () Bool)

(assert (=> mapNonEmpty!6309 m!194913))

(declare-fun m!194915 () Bool)

(assert (=> b!165756 m!194915))

(assert (=> b!165756 m!194915))

(declare-fun m!194917 () Bool)

(assert (=> b!165756 m!194917))

(declare-fun m!194919 () Bool)

(assert (=> start!16624 m!194919))

(declare-fun m!194921 () Bool)

(assert (=> b!165759 m!194921))

(declare-fun m!194923 () Bool)

(assert (=> b!165759 m!194923))

(declare-fun m!194925 () Bool)

(assert (=> b!165755 m!194925))

(declare-fun m!194927 () Bool)

(assert (=> b!165752 m!194927))

(declare-fun m!194929 () Bool)

(assert (=> b!165761 m!194929))

(check-sat (not b!165759) (not mapNonEmpty!6309) (not b!165754) (not b!165761) (not start!16624) b_and!10313 (not b_next!3925) (not b!165756) (not b!165755) (not b!165752) tp_is_empty!3727)
(check-sat b_and!10313 (not b_next!3925))
