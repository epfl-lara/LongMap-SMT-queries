; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16618 () Bool)

(assert start!16618)

(declare-fun b!165654 () Bool)

(declare-fun b_free!3919 () Bool)

(declare-fun b_next!3919 () Bool)

(assert (=> b!165654 (= b_free!3919 (not b_next!3919))))

(declare-fun tp!14358 () Bool)

(declare-fun b_and!10307 () Bool)

(assert (=> b!165654 (= tp!14358 b_and!10307)))

(declare-fun res!78626 () Bool)

(declare-fun e!108655 () Bool)

(assert (=> start!16618 (=> (not res!78626) (not e!108655))))

(declare-datatypes ((V!4609 0))(
  ( (V!4610 (val!1905 Int)) )
))
(declare-datatypes ((ValueCell!1517 0))(
  ( (ValueCellFull!1517 (v!3764 V!4609)) (EmptyCell!1517) )
))
(declare-datatypes ((array!6519 0))(
  ( (array!6520 (arr!3094 (Array (_ BitVec 32) (_ BitVec 64))) (size!3383 (_ BitVec 32))) )
))
(declare-datatypes ((array!6521 0))(
  ( (array!6522 (arr!3095 (Array (_ BitVec 32) ValueCell!1517)) (size!3384 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1942 0))(
  ( (LongMapFixedSize!1943 (defaultEntry!3413 Int) (mask!8131 (_ BitVec 32)) (extraKeys!3154 (_ BitVec 32)) (zeroValue!3256 V!4609) (minValue!3256 V!4609) (_size!1020 (_ BitVec 32)) (_keys!5237 array!6519) (_values!3396 array!6521) (_vacant!1020 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1942)

(declare-fun valid!862 (LongMapFixedSize!1942) Bool)

(assert (=> start!16618 (= res!78626 (valid!862 thiss!1248))))

(assert (=> start!16618 e!108655))

(declare-fun e!108651 () Bool)

(assert (=> start!16618 e!108651))

(assert (=> start!16618 true))

(declare-fun b!165653 () Bool)

(declare-fun res!78629 () Bool)

(declare-fun e!108652 () Bool)

(assert (=> b!165653 (=> (not res!78629) (not e!108652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165653 (= res!78629 (validMask!0 (mask!8131 thiss!1248)))))

(declare-fun e!108653 () Bool)

(declare-fun tp_is_empty!3721 () Bool)

(declare-fun array_inv!1989 (array!6519) Bool)

(declare-fun array_inv!1990 (array!6521) Bool)

(assert (=> b!165654 (= e!108651 (and tp!14358 tp_is_empty!3721 (array_inv!1989 (_keys!5237 thiss!1248)) (array_inv!1990 (_values!3396 thiss!1248)) e!108653))))

(declare-fun mapIsEmpty!6300 () Bool)

(declare-fun mapRes!6300 () Bool)

(assert (=> mapIsEmpty!6300 mapRes!6300))

(declare-fun b!165655 () Bool)

(declare-fun res!78625 () Bool)

(assert (=> b!165655 (=> (not res!78625) (not e!108652))))

(assert (=> b!165655 (= res!78625 (and (= (size!3384 (_values!3396 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8131 thiss!1248))) (= (size!3383 (_keys!5237 thiss!1248)) (size!3384 (_values!3396 thiss!1248))) (bvsge (mask!8131 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3154 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3154 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165656 () Bool)

(declare-fun res!78631 () Bool)

(assert (=> b!165656 (=> (not res!78631) (not e!108655))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165656 (= res!78631 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165657 () Bool)

(assert (=> b!165657 (= e!108652 false)))

(declare-fun lt!82955 () Bool)

(declare-datatypes ((List!2070 0))(
  ( (Nil!2067) (Cons!2066 (h!2683 (_ BitVec 64)) (t!6863 List!2070)) )
))
(declare-fun arrayNoDuplicates!0 (array!6519 (_ BitVec 32) List!2070) Bool)

(assert (=> b!165657 (= lt!82955 (arrayNoDuplicates!0 (_keys!5237 thiss!1248) #b00000000000000000000000000000000 Nil!2067))))

(declare-fun b!165658 () Bool)

(assert (=> b!165658 (= e!108655 e!108652)))

(declare-fun res!78630 () Bool)

(assert (=> b!165658 (=> (not res!78630) (not e!108652))))

(declare-datatypes ((SeekEntryResult!454 0))(
  ( (MissingZero!454 (index!3984 (_ BitVec 32))) (Found!454 (index!3985 (_ BitVec 32))) (Intermediate!454 (undefined!1266 Bool) (index!3986 (_ BitVec 32)) (x!18385 (_ BitVec 32))) (Undefined!454) (MissingVacant!454 (index!3987 (_ BitVec 32))) )
))
(declare-fun lt!82956 () SeekEntryResult!454)

(get-info :version)

(assert (=> b!165658 (= res!78630 (and (not ((_ is Undefined!454) lt!82956)) (not ((_ is MissingVacant!454) lt!82956)) (not ((_ is MissingZero!454) lt!82956)) ((_ is Found!454) lt!82956)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6519 (_ BitVec 32)) SeekEntryResult!454)

(assert (=> b!165658 (= lt!82956 (seekEntryOrOpen!0 key!828 (_keys!5237 thiss!1248) (mask!8131 thiss!1248)))))

(declare-fun b!165659 () Bool)

(declare-fun res!78627 () Bool)

(assert (=> b!165659 (=> (not res!78627) (not e!108652))))

(declare-datatypes ((tuple2!3068 0))(
  ( (tuple2!3069 (_1!1545 (_ BitVec 64)) (_2!1545 V!4609)) )
))
(declare-datatypes ((List!2071 0))(
  ( (Nil!2068) (Cons!2067 (h!2684 tuple2!3068) (t!6864 List!2071)) )
))
(declare-datatypes ((ListLongMap!2011 0))(
  ( (ListLongMap!2012 (toList!1021 List!2071)) )
))
(declare-fun contains!1066 (ListLongMap!2011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!663 (array!6519 array!6521 (_ BitVec 32) (_ BitVec 32) V!4609 V!4609 (_ BitVec 32) Int) ListLongMap!2011)

(assert (=> b!165659 (= res!78627 (not (contains!1066 (getCurrentListMap!663 (_keys!5237 thiss!1248) (_values!3396 thiss!1248) (mask!8131 thiss!1248) (extraKeys!3154 thiss!1248) (zeroValue!3256 thiss!1248) (minValue!3256 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3413 thiss!1248)) key!828)))))

(declare-fun b!165660 () Bool)

(declare-fun res!78628 () Bool)

(assert (=> b!165660 (=> (not res!78628) (not e!108652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6519 (_ BitVec 32)) Bool)

(assert (=> b!165660 (= res!78628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5237 thiss!1248) (mask!8131 thiss!1248)))))

(declare-fun mapNonEmpty!6300 () Bool)

(declare-fun tp!14357 () Bool)

(declare-fun e!108656 () Bool)

(assert (=> mapNonEmpty!6300 (= mapRes!6300 (and tp!14357 e!108656))))

(declare-fun mapKey!6300 () (_ BitVec 32))

(declare-fun mapValue!6300 () ValueCell!1517)

(declare-fun mapRest!6300 () (Array (_ BitVec 32) ValueCell!1517))

(assert (=> mapNonEmpty!6300 (= (arr!3095 (_values!3396 thiss!1248)) (store mapRest!6300 mapKey!6300 mapValue!6300))))

(declare-fun b!165661 () Bool)

(declare-fun e!108654 () Bool)

(assert (=> b!165661 (= e!108654 tp_is_empty!3721)))

(declare-fun b!165662 () Bool)

(assert (=> b!165662 (= e!108653 (and e!108654 mapRes!6300))))

(declare-fun condMapEmpty!6300 () Bool)

(declare-fun mapDefault!6300 () ValueCell!1517)

(assert (=> b!165662 (= condMapEmpty!6300 (= (arr!3095 (_values!3396 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1517)) mapDefault!6300)))))

(declare-fun b!165663 () Bool)

(assert (=> b!165663 (= e!108656 tp_is_empty!3721)))

(assert (= (and start!16618 res!78626) b!165656))

(assert (= (and b!165656 res!78631) b!165658))

(assert (= (and b!165658 res!78630) b!165659))

(assert (= (and b!165659 res!78627) b!165653))

(assert (= (and b!165653 res!78629) b!165655))

(assert (= (and b!165655 res!78625) b!165660))

(assert (= (and b!165660 res!78628) b!165657))

(assert (= (and b!165662 condMapEmpty!6300) mapIsEmpty!6300))

(assert (= (and b!165662 (not condMapEmpty!6300)) mapNonEmpty!6300))

(assert (= (and mapNonEmpty!6300 ((_ is ValueCellFull!1517) mapValue!6300)) b!165663))

(assert (= (and b!165662 ((_ is ValueCellFull!1517) mapDefault!6300)) b!165661))

(assert (= b!165654 b!165662))

(assert (= start!16618 b!165654))

(declare-fun m!194851 () Bool)

(assert (=> b!165653 m!194851))

(declare-fun m!194853 () Bool)

(assert (=> b!165654 m!194853))

(declare-fun m!194855 () Bool)

(assert (=> b!165654 m!194855))

(declare-fun m!194857 () Bool)

(assert (=> b!165657 m!194857))

(declare-fun m!194859 () Bool)

(assert (=> mapNonEmpty!6300 m!194859))

(declare-fun m!194861 () Bool)

(assert (=> b!165658 m!194861))

(declare-fun m!194863 () Bool)

(assert (=> start!16618 m!194863))

(declare-fun m!194865 () Bool)

(assert (=> b!165660 m!194865))

(declare-fun m!194867 () Bool)

(assert (=> b!165659 m!194867))

(assert (=> b!165659 m!194867))

(declare-fun m!194869 () Bool)

(assert (=> b!165659 m!194869))

(check-sat (not b!165654) (not mapNonEmpty!6300) (not b!165657) (not b!165653) (not b!165658) tp_is_empty!3721 (not b!165660) (not start!16618) (not b!165659) b_and!10307 (not b_next!3919))
(check-sat b_and!10307 (not b_next!3919))
