; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16612 () Bool)

(assert start!16612)

(declare-fun b!165558 () Bool)

(declare-fun b_free!3913 () Bool)

(declare-fun b_next!3913 () Bool)

(assert (=> b!165558 (= b_free!3913 (not b_next!3913))))

(declare-fun tp!14340 () Bool)

(declare-fun b_and!10301 () Bool)

(assert (=> b!165558 (= tp!14340 b_and!10301)))

(declare-fun mapNonEmpty!6291 () Bool)

(declare-fun mapRes!6291 () Bool)

(declare-fun tp!14339 () Bool)

(declare-fun e!108594 () Bool)

(assert (=> mapNonEmpty!6291 (= mapRes!6291 (and tp!14339 e!108594))))

(declare-datatypes ((V!4601 0))(
  ( (V!4602 (val!1902 Int)) )
))
(declare-datatypes ((ValueCell!1514 0))(
  ( (ValueCellFull!1514 (v!3761 V!4601)) (EmptyCell!1514) )
))
(declare-fun mapRest!6291 () (Array (_ BitVec 32) ValueCell!1514))

(declare-fun mapValue!6291 () ValueCell!1514)

(declare-datatypes ((array!6507 0))(
  ( (array!6508 (arr!3088 (Array (_ BitVec 32) (_ BitVec 64))) (size!3377 (_ BitVec 32))) )
))
(declare-datatypes ((array!6509 0))(
  ( (array!6510 (arr!3089 (Array (_ BitVec 32) ValueCell!1514)) (size!3378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1936 0))(
  ( (LongMapFixedSize!1937 (defaultEntry!3410 Int) (mask!8126 (_ BitVec 32)) (extraKeys!3151 (_ BitVec 32)) (zeroValue!3253 V!4601) (minValue!3253 V!4601) (_size!1017 (_ BitVec 32)) (_keys!5234 array!6507) (_values!3393 array!6509) (_vacant!1017 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1936)

(declare-fun mapKey!6291 () (_ BitVec 32))

(assert (=> mapNonEmpty!6291 (= (arr!3089 (_values!3393 thiss!1248)) (store mapRest!6291 mapKey!6291 mapValue!6291))))

(declare-fun b!165554 () Bool)

(declare-fun res!78568 () Bool)

(declare-fun e!108593 () Bool)

(assert (=> b!165554 (=> (not res!78568) (not e!108593))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165554 (= res!78568 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165555 () Bool)

(declare-fun e!108588 () Bool)

(declare-fun tp_is_empty!3715 () Bool)

(assert (=> b!165555 (= e!108588 tp_is_empty!3715)))

(declare-fun b!165556 () Bool)

(declare-fun e!108591 () Bool)

(assert (=> b!165556 (= e!108591 false)))

(declare-fun lt!82937 () Bool)

(declare-datatypes ((List!2064 0))(
  ( (Nil!2061) (Cons!2060 (h!2677 (_ BitVec 64)) (t!6857 List!2064)) )
))
(declare-fun arrayNoDuplicates!0 (array!6507 (_ BitVec 32) List!2064) Bool)

(assert (=> b!165556 (= lt!82937 (arrayNoDuplicates!0 (_keys!5234 thiss!1248) #b00000000000000000000000000000000 Nil!2061))))

(declare-fun b!165557 () Bool)

(declare-fun e!108592 () Bool)

(assert (=> b!165557 (= e!108592 (and e!108588 mapRes!6291))))

(declare-fun condMapEmpty!6291 () Bool)

(declare-fun mapDefault!6291 () ValueCell!1514)

(assert (=> b!165557 (= condMapEmpty!6291 (= (arr!3089 (_values!3393 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1514)) mapDefault!6291)))))

(declare-fun e!108590 () Bool)

(declare-fun array_inv!1985 (array!6507) Bool)

(declare-fun array_inv!1986 (array!6509) Bool)

(assert (=> b!165558 (= e!108590 (and tp!14340 tp_is_empty!3715 (array_inv!1985 (_keys!5234 thiss!1248)) (array_inv!1986 (_values!3393 thiss!1248)) e!108592))))

(declare-fun b!165559 () Bool)

(declare-fun res!78563 () Bool)

(assert (=> b!165559 (=> (not res!78563) (not e!108591))))

(declare-datatypes ((tuple2!3062 0))(
  ( (tuple2!3063 (_1!1542 (_ BitVec 64)) (_2!1542 V!4601)) )
))
(declare-datatypes ((List!2065 0))(
  ( (Nil!2062) (Cons!2061 (h!2678 tuple2!3062) (t!6858 List!2065)) )
))
(declare-datatypes ((ListLongMap!2005 0))(
  ( (ListLongMap!2006 (toList!1018 List!2065)) )
))
(declare-fun contains!1063 (ListLongMap!2005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!660 (array!6507 array!6509 (_ BitVec 32) (_ BitVec 32) V!4601 V!4601 (_ BitVec 32) Int) ListLongMap!2005)

(assert (=> b!165559 (= res!78563 (not (contains!1063 (getCurrentListMap!660 (_keys!5234 thiss!1248) (_values!3393 thiss!1248) (mask!8126 thiss!1248) (extraKeys!3151 thiss!1248) (zeroValue!3253 thiss!1248) (minValue!3253 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3410 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!6291 () Bool)

(assert (=> mapIsEmpty!6291 mapRes!6291))

(declare-fun b!165561 () Bool)

(assert (=> b!165561 (= e!108594 tp_is_empty!3715)))

(declare-fun b!165562 () Bool)

(assert (=> b!165562 (= e!108593 e!108591)))

(declare-fun res!78564 () Bool)

(assert (=> b!165562 (=> (not res!78564) (not e!108591))))

(declare-datatypes ((SeekEntryResult!451 0))(
  ( (MissingZero!451 (index!3972 (_ BitVec 32))) (Found!451 (index!3973 (_ BitVec 32))) (Intermediate!451 (undefined!1263 Bool) (index!3974 (_ BitVec 32)) (x!18374 (_ BitVec 32))) (Undefined!451) (MissingVacant!451 (index!3975 (_ BitVec 32))) )
))
(declare-fun lt!82938 () SeekEntryResult!451)

(get-info :version)

(assert (=> b!165562 (= res!78564 (and (not ((_ is Undefined!451) lt!82938)) (not ((_ is MissingVacant!451) lt!82938)) (not ((_ is MissingZero!451) lt!82938)) ((_ is Found!451) lt!82938)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6507 (_ BitVec 32)) SeekEntryResult!451)

(assert (=> b!165562 (= lt!82938 (seekEntryOrOpen!0 key!828 (_keys!5234 thiss!1248) (mask!8126 thiss!1248)))))

(declare-fun b!165563 () Bool)

(declare-fun res!78567 () Bool)

(assert (=> b!165563 (=> (not res!78567) (not e!108591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165563 (= res!78567 (validMask!0 (mask!8126 thiss!1248)))))

(declare-fun b!165564 () Bool)

(declare-fun res!78566 () Bool)

(assert (=> b!165564 (=> (not res!78566) (not e!108591))))

(assert (=> b!165564 (= res!78566 (and (= (size!3378 (_values!3393 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8126 thiss!1248))) (= (size!3377 (_keys!5234 thiss!1248)) (size!3378 (_values!3393 thiss!1248))) (bvsge (mask!8126 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3151 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3151 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165560 () Bool)

(declare-fun res!78565 () Bool)

(assert (=> b!165560 (=> (not res!78565) (not e!108591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6507 (_ BitVec 32)) Bool)

(assert (=> b!165560 (= res!78565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5234 thiss!1248) (mask!8126 thiss!1248)))))

(declare-fun res!78562 () Bool)

(assert (=> start!16612 (=> (not res!78562) (not e!108593))))

(declare-fun valid!860 (LongMapFixedSize!1936) Bool)

(assert (=> start!16612 (= res!78562 (valid!860 thiss!1248))))

(assert (=> start!16612 e!108593))

(assert (=> start!16612 e!108590))

(assert (=> start!16612 true))

(assert (= (and start!16612 res!78562) b!165554))

(assert (= (and b!165554 res!78568) b!165562))

(assert (= (and b!165562 res!78564) b!165559))

(assert (= (and b!165559 res!78563) b!165563))

(assert (= (and b!165563 res!78567) b!165564))

(assert (= (and b!165564 res!78566) b!165560))

(assert (= (and b!165560 res!78565) b!165556))

(assert (= (and b!165557 condMapEmpty!6291) mapIsEmpty!6291))

(assert (= (and b!165557 (not condMapEmpty!6291)) mapNonEmpty!6291))

(assert (= (and mapNonEmpty!6291 ((_ is ValueCellFull!1514) mapValue!6291)) b!165561))

(assert (= (and b!165557 ((_ is ValueCellFull!1514) mapDefault!6291)) b!165555))

(assert (= b!165558 b!165557))

(assert (= start!16612 b!165558))

(declare-fun m!194791 () Bool)

(assert (=> b!165560 m!194791))

(declare-fun m!194793 () Bool)

(assert (=> b!165559 m!194793))

(assert (=> b!165559 m!194793))

(declare-fun m!194795 () Bool)

(assert (=> b!165559 m!194795))

(declare-fun m!194797 () Bool)

(assert (=> start!16612 m!194797))

(declare-fun m!194799 () Bool)

(assert (=> mapNonEmpty!6291 m!194799))

(declare-fun m!194801 () Bool)

(assert (=> b!165562 m!194801))

(declare-fun m!194803 () Bool)

(assert (=> b!165556 m!194803))

(declare-fun m!194805 () Bool)

(assert (=> b!165563 m!194805))

(declare-fun m!194807 () Bool)

(assert (=> b!165558 m!194807))

(declare-fun m!194809 () Bool)

(assert (=> b!165558 m!194809))

(check-sat (not b_next!3913) (not b!165556) (not mapNonEmpty!6291) b_and!10301 (not start!16612) (not b!165559) (not b!165562) (not b!165558) (not b!165560) (not b!165563) tp_is_empty!3715)
(check-sat b_and!10301 (not b_next!3913))
