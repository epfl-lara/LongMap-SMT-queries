; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16612 () Bool)

(assert start!16612)

(declare-fun b!165752 () Bool)

(declare-fun b_free!3913 () Bool)

(declare-fun b_next!3913 () Bool)

(assert (=> b!165752 (= b_free!3913 (not b_next!3913))))

(declare-fun tp!14339 () Bool)

(declare-fun b_and!10341 () Bool)

(assert (=> b!165752 (= tp!14339 b_and!10341)))

(declare-fun b!165748 () Bool)

(declare-fun res!78678 () Bool)

(declare-fun e!108713 () Bool)

(assert (=> b!165748 (=> (not res!78678) (not e!108713))))

(declare-datatypes ((V!4601 0))(
  ( (V!4602 (val!1902 Int)) )
))
(declare-datatypes ((ValueCell!1514 0))(
  ( (ValueCellFull!1514 (v!3768 V!4601)) (EmptyCell!1514) )
))
(declare-datatypes ((array!6513 0))(
  ( (array!6514 (arr!3092 (Array (_ BitVec 32) (_ BitVec 64))) (size!3380 (_ BitVec 32))) )
))
(declare-datatypes ((array!6515 0))(
  ( (array!6516 (arr!3093 (Array (_ BitVec 32) ValueCell!1514)) (size!3381 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1936 0))(
  ( (LongMapFixedSize!1937 (defaultEntry!3410 Int) (mask!8127 (_ BitVec 32)) (extraKeys!3151 (_ BitVec 32)) (zeroValue!3253 V!4601) (minValue!3253 V!4601) (_size!1017 (_ BitVec 32)) (_keys!5235 array!6513) (_values!3393 array!6515) (_vacant!1017 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1936)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165748 (= res!78678 (validMask!0 (mask!8127 thiss!1248)))))

(declare-fun b!165749 () Bool)

(declare-fun e!108717 () Bool)

(declare-fun e!108716 () Bool)

(declare-fun mapRes!6291 () Bool)

(assert (=> b!165749 (= e!108717 (and e!108716 mapRes!6291))))

(declare-fun condMapEmpty!6291 () Bool)

(declare-fun mapDefault!6291 () ValueCell!1514)

(assert (=> b!165749 (= condMapEmpty!6291 (= (arr!3093 (_values!3393 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1514)) mapDefault!6291)))))

(declare-fun b!165750 () Bool)

(declare-fun res!78681 () Bool)

(declare-fun e!108719 () Bool)

(assert (=> b!165750 (=> (not res!78681) (not e!108719))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165750 (= res!78681 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6291 () Bool)

(declare-fun tp!14340 () Bool)

(declare-fun e!108715 () Bool)

(assert (=> mapNonEmpty!6291 (= mapRes!6291 (and tp!14340 e!108715))))

(declare-fun mapRest!6291 () (Array (_ BitVec 32) ValueCell!1514))

(declare-fun mapKey!6291 () (_ BitVec 32))

(declare-fun mapValue!6291 () ValueCell!1514)

(assert (=> mapNonEmpty!6291 (= (arr!3093 (_values!3393 thiss!1248)) (store mapRest!6291 mapKey!6291 mapValue!6291))))

(declare-fun b!165751 () Bool)

(declare-fun res!78682 () Bool)

(assert (=> b!165751 (=> (not res!78682) (not e!108713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6513 (_ BitVec 32)) Bool)

(assert (=> b!165751 (= res!78682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5235 thiss!1248) (mask!8127 thiss!1248)))))

(declare-fun tp_is_empty!3715 () Bool)

(declare-fun e!108714 () Bool)

(declare-fun array_inv!1985 (array!6513) Bool)

(declare-fun array_inv!1986 (array!6515) Bool)

(assert (=> b!165752 (= e!108714 (and tp!14339 tp_is_empty!3715 (array_inv!1985 (_keys!5235 thiss!1248)) (array_inv!1986 (_values!3393 thiss!1248)) e!108717))))

(declare-fun b!165753 () Bool)

(assert (=> b!165753 (= e!108713 false)))

(declare-fun lt!83177 () Bool)

(declare-datatypes ((List!2052 0))(
  ( (Nil!2049) (Cons!2048 (h!2665 (_ BitVec 64)) (t!6846 List!2052)) )
))
(declare-fun arrayNoDuplicates!0 (array!6513 (_ BitVec 32) List!2052) Bool)

(assert (=> b!165753 (= lt!83177 (arrayNoDuplicates!0 (_keys!5235 thiss!1248) #b00000000000000000000000000000000 Nil!2049))))

(declare-fun b!165755 () Bool)

(declare-fun res!78680 () Bool)

(assert (=> b!165755 (=> (not res!78680) (not e!108713))))

(assert (=> b!165755 (= res!78680 (and (= (size!3381 (_values!3393 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8127 thiss!1248))) (= (size!3380 (_keys!5235 thiss!1248)) (size!3381 (_values!3393 thiss!1248))) (bvsge (mask!8127 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3151 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3151 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165756 () Bool)

(assert (=> b!165756 (= e!108715 tp_is_empty!3715)))

(declare-fun mapIsEmpty!6291 () Bool)

(assert (=> mapIsEmpty!6291 mapRes!6291))

(declare-fun res!78683 () Bool)

(assert (=> start!16612 (=> (not res!78683) (not e!108719))))

(declare-fun valid!869 (LongMapFixedSize!1936) Bool)

(assert (=> start!16612 (= res!78683 (valid!869 thiss!1248))))

(assert (=> start!16612 e!108719))

(assert (=> start!16612 e!108714))

(assert (=> start!16612 true))

(declare-fun b!165754 () Bool)

(declare-fun res!78679 () Bool)

(assert (=> b!165754 (=> (not res!78679) (not e!108713))))

(declare-datatypes ((tuple2!3032 0))(
  ( (tuple2!3033 (_1!1527 (_ BitVec 64)) (_2!1527 V!4601)) )
))
(declare-datatypes ((List!2053 0))(
  ( (Nil!2050) (Cons!2049 (h!2666 tuple2!3032) (t!6847 List!2053)) )
))
(declare-datatypes ((ListLongMap!1993 0))(
  ( (ListLongMap!1994 (toList!1012 List!2053)) )
))
(declare-fun contains!1064 (ListLongMap!1993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!674 (array!6513 array!6515 (_ BitVec 32) (_ BitVec 32) V!4601 V!4601 (_ BitVec 32) Int) ListLongMap!1993)

(assert (=> b!165754 (= res!78679 (not (contains!1064 (getCurrentListMap!674 (_keys!5235 thiss!1248) (_values!3393 thiss!1248) (mask!8127 thiss!1248) (extraKeys!3151 thiss!1248) (zeroValue!3253 thiss!1248) (minValue!3253 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3410 thiss!1248)) key!828)))))

(declare-fun b!165757 () Bool)

(assert (=> b!165757 (= e!108716 tp_is_empty!3715)))

(declare-fun b!165758 () Bool)

(assert (=> b!165758 (= e!108719 e!108713)))

(declare-fun res!78684 () Bool)

(assert (=> b!165758 (=> (not res!78684) (not e!108713))))

(declare-datatypes ((SeekEntryResult!438 0))(
  ( (MissingZero!438 (index!3920 (_ BitVec 32))) (Found!438 (index!3921 (_ BitVec 32))) (Intermediate!438 (undefined!1250 Bool) (index!3922 (_ BitVec 32)) (x!18362 (_ BitVec 32))) (Undefined!438) (MissingVacant!438 (index!3923 (_ BitVec 32))) )
))
(declare-fun lt!83178 () SeekEntryResult!438)

(get-info :version)

(assert (=> b!165758 (= res!78684 (and (not ((_ is Undefined!438) lt!83178)) (not ((_ is MissingVacant!438) lt!83178)) (not ((_ is MissingZero!438) lt!83178)) ((_ is Found!438) lt!83178)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6513 (_ BitVec 32)) SeekEntryResult!438)

(assert (=> b!165758 (= lt!83178 (seekEntryOrOpen!0 key!828 (_keys!5235 thiss!1248) (mask!8127 thiss!1248)))))

(assert (= (and start!16612 res!78683) b!165750))

(assert (= (and b!165750 res!78681) b!165758))

(assert (= (and b!165758 res!78684) b!165754))

(assert (= (and b!165754 res!78679) b!165748))

(assert (= (and b!165748 res!78678) b!165755))

(assert (= (and b!165755 res!78680) b!165751))

(assert (= (and b!165751 res!78682) b!165753))

(assert (= (and b!165749 condMapEmpty!6291) mapIsEmpty!6291))

(assert (= (and b!165749 (not condMapEmpty!6291)) mapNonEmpty!6291))

(assert (= (and mapNonEmpty!6291 ((_ is ValueCellFull!1514) mapValue!6291)) b!165756))

(assert (= (and b!165749 ((_ is ValueCellFull!1514) mapDefault!6291)) b!165757))

(assert (= b!165752 b!165749))

(assert (= start!16612 b!165752))

(declare-fun m!195593 () Bool)

(assert (=> b!165758 m!195593))

(declare-fun m!195595 () Bool)

(assert (=> start!16612 m!195595))

(declare-fun m!195597 () Bool)

(assert (=> b!165751 m!195597))

(declare-fun m!195599 () Bool)

(assert (=> b!165753 m!195599))

(declare-fun m!195601 () Bool)

(assert (=> b!165754 m!195601))

(assert (=> b!165754 m!195601))

(declare-fun m!195603 () Bool)

(assert (=> b!165754 m!195603))

(declare-fun m!195605 () Bool)

(assert (=> b!165748 m!195605))

(declare-fun m!195607 () Bool)

(assert (=> mapNonEmpty!6291 m!195607))

(declare-fun m!195609 () Bool)

(assert (=> b!165752 m!195609))

(declare-fun m!195611 () Bool)

(assert (=> b!165752 m!195611))

(check-sat (not b!165752) tp_is_empty!3715 (not b!165751) (not b_next!3913) (not b!165754) (not b!165748) (not b!165758) (not b!165753) (not start!16612) b_and!10341 (not mapNonEmpty!6291))
(check-sat b_and!10341 (not b_next!3913))
