; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16598 () Bool)

(assert start!16598)

(declare-fun b!165536 () Bool)

(declare-fun b_free!3903 () Bool)

(declare-fun b_next!3903 () Bool)

(assert (=> b!165536 (= b_free!3903 (not b_next!3903))))

(declare-fun tp!14309 () Bool)

(declare-fun b_and!10317 () Bool)

(assert (=> b!165536 (= tp!14309 b_and!10317)))

(declare-fun res!78552 () Bool)

(declare-fun e!108587 () Bool)

(assert (=> start!16598 (=> (not res!78552) (not e!108587))))

(declare-datatypes ((V!4587 0))(
  ( (V!4588 (val!1897 Int)) )
))
(declare-datatypes ((ValueCell!1509 0))(
  ( (ValueCellFull!1509 (v!3762 V!4587)) (EmptyCell!1509) )
))
(declare-datatypes ((array!6507 0))(
  ( (array!6508 (arr!3089 (Array (_ BitVec 32) (_ BitVec 64))) (size!3377 (_ BitVec 32))) )
))
(declare-datatypes ((array!6509 0))(
  ( (array!6510 (arr!3090 (Array (_ BitVec 32) ValueCell!1509)) (size!3378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1926 0))(
  ( (LongMapFixedSize!1927 (defaultEntry!3405 Int) (mask!8118 (_ BitVec 32)) (extraKeys!3146 (_ BitVec 32)) (zeroValue!3248 V!4587) (minValue!3248 V!4587) (_size!1012 (_ BitVec 32)) (_keys!5230 array!6507) (_values!3388 array!6509) (_vacant!1012 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1926)

(declare-fun valid!852 (LongMapFixedSize!1926) Bool)

(assert (=> start!16598 (= res!78552 (valid!852 thiss!1248))))

(assert (=> start!16598 e!108587))

(declare-fun e!108588 () Bool)

(assert (=> start!16598 e!108588))

(assert (=> start!16598 true))

(declare-fun tp_is_empty!3705 () Bool)

(declare-fun e!108584 () Bool)

(declare-fun array_inv!1985 (array!6507) Bool)

(declare-fun array_inv!1986 (array!6509) Bool)

(assert (=> b!165536 (= e!108588 (and tp!14309 tp_is_empty!3705 (array_inv!1985 (_keys!5230 thiss!1248)) (array_inv!1986 (_values!3388 thiss!1248)) e!108584))))

(declare-fun b!165537 () Bool)

(declare-fun e!108589 () Bool)

(declare-fun mapRes!6276 () Bool)

(assert (=> b!165537 (= e!108584 (and e!108589 mapRes!6276))))

(declare-fun condMapEmpty!6276 () Bool)

(declare-fun mapDefault!6276 () ValueCell!1509)

(assert (=> b!165537 (= condMapEmpty!6276 (= (arr!3090 (_values!3388 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1509)) mapDefault!6276)))))

(declare-fun b!165538 () Bool)

(declare-fun e!108585 () Bool)

(assert (=> b!165538 (= e!108585 false)))

(declare-fun lt!83088 () Bool)

(declare-datatypes ((List!2058 0))(
  ( (Nil!2055) (Cons!2054 (h!2671 (_ BitVec 64)) (t!6860 List!2058)) )
))
(declare-fun arrayNoDuplicates!0 (array!6507 (_ BitVec 32) List!2058) Bool)

(assert (=> b!165538 (= lt!83088 (arrayNoDuplicates!0 (_keys!5230 thiss!1248) #b00000000000000000000000000000000 Nil!2055))))

(declare-fun b!165539 () Bool)

(assert (=> b!165539 (= e!108587 e!108585)))

(declare-fun res!78557 () Bool)

(assert (=> b!165539 (=> (not res!78557) (not e!108585))))

(declare-datatypes ((SeekEntryResult!438 0))(
  ( (MissingZero!438 (index!3920 (_ BitVec 32))) (Found!438 (index!3921 (_ BitVec 32))) (Intermediate!438 (undefined!1250 Bool) (index!3922 (_ BitVec 32)) (x!18346 (_ BitVec 32))) (Undefined!438) (MissingVacant!438 (index!3923 (_ BitVec 32))) )
))
(declare-fun lt!83089 () SeekEntryResult!438)

(get-info :version)

(assert (=> b!165539 (= res!78557 (and (not ((_ is Undefined!438) lt!83089)) (not ((_ is MissingVacant!438) lt!83089)) (not ((_ is MissingZero!438) lt!83089)) ((_ is Found!438) lt!83089)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6507 (_ BitVec 32)) SeekEntryResult!438)

(assert (=> b!165539 (= lt!83089 (seekEntryOrOpen!0 key!828 (_keys!5230 thiss!1248) (mask!8118 thiss!1248)))))

(declare-fun b!165540 () Bool)

(declare-fun res!78554 () Bool)

(assert (=> b!165540 (=> (not res!78554) (not e!108585))))

(declare-datatypes ((tuple2!3074 0))(
  ( (tuple2!3075 (_1!1548 (_ BitVec 64)) (_2!1548 V!4587)) )
))
(declare-datatypes ((List!2059 0))(
  ( (Nil!2056) (Cons!2055 (h!2672 tuple2!3074) (t!6861 List!2059)) )
))
(declare-datatypes ((ListLongMap!2029 0))(
  ( (ListLongMap!2030 (toList!1030 List!2059)) )
))
(declare-fun contains!1072 (ListLongMap!2029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!688 (array!6507 array!6509 (_ BitVec 32) (_ BitVec 32) V!4587 V!4587 (_ BitVec 32) Int) ListLongMap!2029)

(assert (=> b!165540 (= res!78554 (not (contains!1072 (getCurrentListMap!688 (_keys!5230 thiss!1248) (_values!3388 thiss!1248) (mask!8118 thiss!1248) (extraKeys!3146 thiss!1248) (zeroValue!3248 thiss!1248) (minValue!3248 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3405 thiss!1248)) key!828)))))

(declare-fun b!165541 () Bool)

(declare-fun res!78556 () Bool)

(assert (=> b!165541 (=> (not res!78556) (not e!108587))))

(assert (=> b!165541 (= res!78556 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165542 () Bool)

(declare-fun res!78558 () Bool)

(assert (=> b!165542 (=> (not res!78558) (not e!108585))))

(assert (=> b!165542 (= res!78558 (and (= (size!3378 (_values!3388 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8118 thiss!1248))) (= (size!3377 (_keys!5230 thiss!1248)) (size!3378 (_values!3388 thiss!1248))) (bvsge (mask!8118 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3146 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3146 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165543 () Bool)

(declare-fun res!78553 () Bool)

(assert (=> b!165543 (=> (not res!78553) (not e!108585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165543 (= res!78553 (validMask!0 (mask!8118 thiss!1248)))))

(declare-fun b!165544 () Bool)

(declare-fun e!108586 () Bool)

(assert (=> b!165544 (= e!108586 tp_is_empty!3705)))

(declare-fun mapNonEmpty!6276 () Bool)

(declare-fun tp!14310 () Bool)

(assert (=> mapNonEmpty!6276 (= mapRes!6276 (and tp!14310 e!108586))))

(declare-fun mapKey!6276 () (_ BitVec 32))

(declare-fun mapRest!6276 () (Array (_ BitVec 32) ValueCell!1509))

(declare-fun mapValue!6276 () ValueCell!1509)

(assert (=> mapNonEmpty!6276 (= (arr!3090 (_values!3388 thiss!1248)) (store mapRest!6276 mapKey!6276 mapValue!6276))))

(declare-fun b!165545 () Bool)

(assert (=> b!165545 (= e!108589 tp_is_empty!3705)))

(declare-fun mapIsEmpty!6276 () Bool)

(assert (=> mapIsEmpty!6276 mapRes!6276))

(declare-fun b!165546 () Bool)

(declare-fun res!78555 () Bool)

(assert (=> b!165546 (=> (not res!78555) (not e!108585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6507 (_ BitVec 32)) Bool)

(assert (=> b!165546 (= res!78555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5230 thiss!1248) (mask!8118 thiss!1248)))))

(assert (= (and start!16598 res!78552) b!165541))

(assert (= (and b!165541 res!78556) b!165539))

(assert (= (and b!165539 res!78557) b!165540))

(assert (= (and b!165540 res!78554) b!165543))

(assert (= (and b!165543 res!78553) b!165542))

(assert (= (and b!165542 res!78558) b!165546))

(assert (= (and b!165546 res!78555) b!165538))

(assert (= (and b!165537 condMapEmpty!6276) mapIsEmpty!6276))

(assert (= (and b!165537 (not condMapEmpty!6276)) mapNonEmpty!6276))

(assert (= (and mapNonEmpty!6276 ((_ is ValueCellFull!1509) mapValue!6276)) b!165544))

(assert (= (and b!165537 ((_ is ValueCellFull!1509) mapDefault!6276)) b!165545))

(assert (= b!165536 b!165537))

(assert (= start!16598 b!165536))

(declare-fun m!195311 () Bool)

(assert (=> mapNonEmpty!6276 m!195311))

(declare-fun m!195313 () Bool)

(assert (=> b!165536 m!195313))

(declare-fun m!195315 () Bool)

(assert (=> b!165536 m!195315))

(declare-fun m!195317 () Bool)

(assert (=> b!165540 m!195317))

(assert (=> b!165540 m!195317))

(declare-fun m!195319 () Bool)

(assert (=> b!165540 m!195319))

(declare-fun m!195321 () Bool)

(assert (=> b!165543 m!195321))

(declare-fun m!195323 () Bool)

(assert (=> start!16598 m!195323))

(declare-fun m!195325 () Bool)

(assert (=> b!165546 m!195325))

(declare-fun m!195327 () Bool)

(assert (=> b!165538 m!195327))

(declare-fun m!195329 () Bool)

(assert (=> b!165539 m!195329))

(check-sat (not b!165538) (not mapNonEmpty!6276) tp_is_empty!3705 (not start!16598) (not b!165546) (not b!165543) (not b!165539) b_and!10317 (not b!165536) (not b!165540) (not b_next!3903))
(check-sat b_and!10317 (not b_next!3903))
