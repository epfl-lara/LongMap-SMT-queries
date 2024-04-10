; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17692 () Bool)

(assert start!17692)

(declare-fun b!176862 () Bool)

(declare-fun b_free!4365 () Bool)

(declare-fun b_next!4365 () Bool)

(assert (=> b!176862 (= b_free!4365 (not b_next!4365))))

(declare-fun tp!15792 () Bool)

(declare-fun b_and!10863 () Bool)

(assert (=> b!176862 (= tp!15792 b_and!10863)))

(declare-fun b!176856 () Bool)

(declare-fun res!83820 () Bool)

(declare-fun e!116651 () Bool)

(assert (=> b!176856 (=> (not res!83820) (not e!116651))))

(declare-datatypes ((V!5163 0))(
  ( (V!5164 (val!2113 Int)) )
))
(declare-datatypes ((ValueCell!1725 0))(
  ( (ValueCellFull!1725 (v!3992 V!5163)) (EmptyCell!1725) )
))
(declare-datatypes ((array!7423 0))(
  ( (array!7424 (arr!3521 (Array (_ BitVec 32) (_ BitVec 64))) (size!3825 (_ BitVec 32))) )
))
(declare-datatypes ((array!7425 0))(
  ( (array!7426 (arr!3522 (Array (_ BitVec 32) ValueCell!1725)) (size!3826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2358 0))(
  ( (LongMapFixedSize!2359 (defaultEntry!3641 Int) (mask!8568 (_ BitVec 32)) (extraKeys!3378 (_ BitVec 32)) (zeroValue!3482 V!5163) (minValue!3482 V!5163) (_size!1228 (_ BitVec 32)) (_keys!5506 array!7423) (_values!3624 array!7425) (_vacant!1228 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2358)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7423 (_ BitVec 32)) Bool)

(assert (=> b!176856 (= res!83820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5506 thiss!1248) (mask!8568 thiss!1248)))))

(declare-fun b!176857 () Bool)

(declare-fun res!83817 () Bool)

(assert (=> b!176857 (=> (not res!83817) (not e!116651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176857 (= res!83817 (validMask!0 (mask!8568 thiss!1248)))))

(declare-fun res!83821 () Bool)

(assert (=> start!17692 (=> (not res!83821) (not e!116651))))

(declare-fun valid!990 (LongMapFixedSize!2358) Bool)

(assert (=> start!17692 (= res!83821 (valid!990 thiss!1248))))

(assert (=> start!17692 e!116651))

(declare-fun e!116650 () Bool)

(assert (=> start!17692 e!116650))

(assert (=> start!17692 true))

(declare-fun mapIsEmpty!7065 () Bool)

(declare-fun mapRes!7065 () Bool)

(assert (=> mapIsEmpty!7065 mapRes!7065))

(declare-fun b!176858 () Bool)

(declare-fun res!83816 () Bool)

(assert (=> b!176858 (=> (not res!83816) (not e!116651))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3290 0))(
  ( (tuple2!3291 (_1!1656 (_ BitVec 64)) (_2!1656 V!5163)) )
))
(declare-datatypes ((List!2242 0))(
  ( (Nil!2239) (Cons!2238 (h!2859 tuple2!3290) (t!7070 List!2242)) )
))
(declare-datatypes ((ListLongMap!2217 0))(
  ( (ListLongMap!2218 (toList!1124 List!2242)) )
))
(declare-fun contains!1189 (ListLongMap!2217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!776 (array!7423 array!7425 (_ BitVec 32) (_ BitVec 32) V!5163 V!5163 (_ BitVec 32) Int) ListLongMap!2217)

(assert (=> b!176858 (= res!83816 (contains!1189 (getCurrentListMap!776 (_keys!5506 thiss!1248) (_values!3624 thiss!1248) (mask!8568 thiss!1248) (extraKeys!3378 thiss!1248) (zeroValue!3482 thiss!1248) (minValue!3482 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3641 thiss!1248)) key!828))))

(declare-fun b!176859 () Bool)

(declare-fun e!116653 () Bool)

(declare-fun tp_is_empty!4137 () Bool)

(assert (=> b!176859 (= e!116653 tp_is_empty!4137)))

(declare-fun b!176860 () Bool)

(assert (=> b!176860 (= e!116651 false)))

(declare-fun lt!87477 () Bool)

(declare-datatypes ((List!2243 0))(
  ( (Nil!2240) (Cons!2239 (h!2860 (_ BitVec 64)) (t!7071 List!2243)) )
))
(declare-fun arrayNoDuplicates!0 (array!7423 (_ BitVec 32) List!2243) Bool)

(assert (=> b!176860 (= lt!87477 (arrayNoDuplicates!0 (_keys!5506 thiss!1248) #b00000000000000000000000000000000 Nil!2240))))

(declare-fun b!176861 () Bool)

(declare-fun res!83818 () Bool)

(assert (=> b!176861 (=> (not res!83818) (not e!116651))))

(assert (=> b!176861 (= res!83818 (and (= (size!3826 (_values!3624 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8568 thiss!1248))) (= (size!3825 (_keys!5506 thiss!1248)) (size!3826 (_values!3624 thiss!1248))) (bvsge (mask!8568 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3378 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3378 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!116654 () Bool)

(declare-fun array_inv!2255 (array!7423) Bool)

(declare-fun array_inv!2256 (array!7425) Bool)

(assert (=> b!176862 (= e!116650 (and tp!15792 tp_is_empty!4137 (array_inv!2255 (_keys!5506 thiss!1248)) (array_inv!2256 (_values!3624 thiss!1248)) e!116654))))

(declare-fun b!176863 () Bool)

(assert (=> b!176863 (= e!116654 (and e!116653 mapRes!7065))))

(declare-fun condMapEmpty!7065 () Bool)

(declare-fun mapDefault!7065 () ValueCell!1725)

(assert (=> b!176863 (= condMapEmpty!7065 (= (arr!3522 (_values!3624 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1725)) mapDefault!7065)))))

(declare-fun mapNonEmpty!7065 () Bool)

(declare-fun tp!15791 () Bool)

(declare-fun e!116652 () Bool)

(assert (=> mapNonEmpty!7065 (= mapRes!7065 (and tp!15791 e!116652))))

(declare-fun mapKey!7065 () (_ BitVec 32))

(declare-fun mapValue!7065 () ValueCell!1725)

(declare-fun mapRest!7065 () (Array (_ BitVec 32) ValueCell!1725))

(assert (=> mapNonEmpty!7065 (= (arr!3522 (_values!3624 thiss!1248)) (store mapRest!7065 mapKey!7065 mapValue!7065))))

(declare-fun b!176864 () Bool)

(declare-fun res!83822 () Bool)

(assert (=> b!176864 (=> (not res!83822) (not e!116651))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!559 0))(
  ( (MissingZero!559 (index!4404 (_ BitVec 32))) (Found!559 (index!4405 (_ BitVec 32))) (Intermediate!559 (undefined!1371 Bool) (index!4406 (_ BitVec 32)) (x!19405 (_ BitVec 32))) (Undefined!559) (MissingVacant!559 (index!4407 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7423 (_ BitVec 32)) SeekEntryResult!559)

(assert (=> b!176864 (= res!83822 ((_ is Undefined!559) (seekEntryOrOpen!0 key!828 (_keys!5506 thiss!1248) (mask!8568 thiss!1248))))))

(declare-fun b!176865 () Bool)

(declare-fun res!83819 () Bool)

(assert (=> b!176865 (=> (not res!83819) (not e!116651))))

(assert (=> b!176865 (= res!83819 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176866 () Bool)

(assert (=> b!176866 (= e!116652 tp_is_empty!4137)))

(assert (= (and start!17692 res!83821) b!176865))

(assert (= (and b!176865 res!83819) b!176864))

(assert (= (and b!176864 res!83822) b!176858))

(assert (= (and b!176858 res!83816) b!176857))

(assert (= (and b!176857 res!83817) b!176861))

(assert (= (and b!176861 res!83818) b!176856))

(assert (= (and b!176856 res!83820) b!176860))

(assert (= (and b!176863 condMapEmpty!7065) mapIsEmpty!7065))

(assert (= (and b!176863 (not condMapEmpty!7065)) mapNonEmpty!7065))

(assert (= (and mapNonEmpty!7065 ((_ is ValueCellFull!1725) mapValue!7065)) b!176866))

(assert (= (and b!176863 ((_ is ValueCellFull!1725) mapDefault!7065)) b!176859))

(assert (= b!176862 b!176863))

(assert (= start!17692 b!176862))

(declare-fun m!205541 () Bool)

(assert (=> start!17692 m!205541))

(declare-fun m!205543 () Bool)

(assert (=> b!176862 m!205543))

(declare-fun m!205545 () Bool)

(assert (=> b!176862 m!205545))

(declare-fun m!205547 () Bool)

(assert (=> b!176858 m!205547))

(assert (=> b!176858 m!205547))

(declare-fun m!205549 () Bool)

(assert (=> b!176858 m!205549))

(declare-fun m!205551 () Bool)

(assert (=> b!176860 m!205551))

(declare-fun m!205553 () Bool)

(assert (=> b!176856 m!205553))

(declare-fun m!205555 () Bool)

(assert (=> mapNonEmpty!7065 m!205555))

(declare-fun m!205557 () Bool)

(assert (=> b!176857 m!205557))

(declare-fun m!205559 () Bool)

(assert (=> b!176864 m!205559))

(check-sat (not start!17692) (not b!176864) (not b_next!4365) (not b!176862) (not b!176860) (not mapNonEmpty!7065) tp_is_empty!4137 (not b!176858) b_and!10863 (not b!176857) (not b!176856))
(check-sat b_and!10863 (not b_next!4365))
