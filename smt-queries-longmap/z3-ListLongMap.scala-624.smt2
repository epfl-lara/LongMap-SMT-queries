; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16094 () Bool)

(assert start!16094)

(declare-fun b!159965 () Bool)

(declare-fun b_free!3555 () Bool)

(declare-fun b_next!3555 () Bool)

(assert (=> b!159965 (= b_free!3555 (not b_next!3555))))

(declare-fun tp!13234 () Bool)

(declare-fun b_and!9969 () Bool)

(assert (=> b!159965 (= tp!13234 b_and!9969)))

(declare-fun mapIsEmpty!5723 () Bool)

(declare-fun mapRes!5723 () Bool)

(assert (=> mapIsEmpty!5723 mapRes!5723))

(declare-fun b!159957 () Bool)

(declare-fun res!75665 () Bool)

(declare-fun e!104641 () Bool)

(assert (=> b!159957 (=> (not res!75665) (not e!104641))))

(declare-datatypes ((V!4123 0))(
  ( (V!4124 (val!1723 Int)) )
))
(declare-datatypes ((ValueCell!1335 0))(
  ( (ValueCellFull!1335 (v!3588 V!4123)) (EmptyCell!1335) )
))
(declare-datatypes ((array!5793 0))(
  ( (array!5794 (arr!2741 (Array (_ BitVec 32) (_ BitVec 64))) (size!3025 (_ BitVec 32))) )
))
(declare-datatypes ((array!5795 0))(
  ( (array!5796 (arr!2742 (Array (_ BitVec 32) ValueCell!1335)) (size!3026 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1578 0))(
  ( (LongMapFixedSize!1579 (defaultEntry!3231 Int) (mask!7791 (_ BitVec 32)) (extraKeys!2972 (_ BitVec 32)) (zeroValue!3074 V!4123) (minValue!3074 V!4123) (_size!838 (_ BitVec 32)) (_keys!5032 array!5793) (_values!3214 array!5795) (_vacant!838 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1578)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159957 (= res!75665 (validMask!0 (mask!7791 thiss!1248)))))

(declare-fun res!75659 () Bool)

(assert (=> start!16094 (=> (not res!75659) (not e!104641))))

(declare-fun valid!735 (LongMapFixedSize!1578) Bool)

(assert (=> start!16094 (= res!75659 (valid!735 thiss!1248))))

(assert (=> start!16094 e!104641))

(declare-fun e!104642 () Bool)

(assert (=> start!16094 e!104642))

(assert (=> start!16094 true))

(declare-fun b!159958 () Bool)

(declare-fun res!75661 () Bool)

(assert (=> b!159958 (=> (not res!75661) (not e!104641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5793 (_ BitVec 32)) Bool)

(assert (=> b!159958 (= res!75661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5032 thiss!1248) (mask!7791 thiss!1248)))))

(declare-fun b!159959 () Bool)

(declare-fun e!104645 () Bool)

(declare-fun e!104644 () Bool)

(assert (=> b!159959 (= e!104645 (and e!104644 mapRes!5723))))

(declare-fun condMapEmpty!5723 () Bool)

(declare-fun mapDefault!5723 () ValueCell!1335)

(assert (=> b!159959 (= condMapEmpty!5723 (= (arr!2742 (_values!3214 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1335)) mapDefault!5723)))))

(declare-fun b!159960 () Bool)

(declare-fun e!104646 () Bool)

(declare-fun tp_is_empty!3357 () Bool)

(assert (=> b!159960 (= e!104646 tp_is_empty!3357)))

(declare-fun b!159961 () Bool)

(assert (=> b!159961 (= e!104641 false)))

(declare-fun lt!82045 () Bool)

(declare-datatypes ((List!1924 0))(
  ( (Nil!1921) (Cons!1920 (h!2533 (_ BitVec 64)) (t!6726 List!1924)) )
))
(declare-fun arrayNoDuplicates!0 (array!5793 (_ BitVec 32) List!1924) Bool)

(assert (=> b!159961 (= lt!82045 (arrayNoDuplicates!0 (_keys!5032 thiss!1248) #b00000000000000000000000000000000 Nil!1921))))

(declare-fun b!159962 () Bool)

(declare-fun res!75662 () Bool)

(assert (=> b!159962 (=> (not res!75662) (not e!104641))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2902 0))(
  ( (tuple2!2903 (_1!1462 (_ BitVec 64)) (_2!1462 V!4123)) )
))
(declare-datatypes ((List!1925 0))(
  ( (Nil!1922) (Cons!1921 (h!2534 tuple2!2902) (t!6727 List!1925)) )
))
(declare-datatypes ((ListLongMap!1889 0))(
  ( (ListLongMap!1890 (toList!960 List!1925)) )
))
(declare-fun contains!996 (ListLongMap!1889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!624 (array!5793 array!5795 (_ BitVec 32) (_ BitVec 32) V!4123 V!4123 (_ BitVec 32) Int) ListLongMap!1889)

(assert (=> b!159962 (= res!75662 (contains!996 (getCurrentListMap!624 (_keys!5032 thiss!1248) (_values!3214 thiss!1248) (mask!7791 thiss!1248) (extraKeys!2972 thiss!1248) (zeroValue!3074 thiss!1248) (minValue!3074 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3231 thiss!1248)) key!828))))

(declare-fun b!159963 () Bool)

(assert (=> b!159963 (= e!104644 tp_is_empty!3357)))

(declare-fun b!159964 () Bool)

(declare-fun res!75664 () Bool)

(assert (=> b!159964 (=> (not res!75664) (not e!104641))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!321 0))(
  ( (MissingZero!321 (index!3452 (_ BitVec 32))) (Found!321 (index!3453 (_ BitVec 32))) (Intermediate!321 (undefined!1133 Bool) (index!3454 (_ BitVec 32)) (x!17657 (_ BitVec 32))) (Undefined!321) (MissingVacant!321 (index!3455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5793 (_ BitVec 32)) SeekEntryResult!321)

(assert (=> b!159964 (= res!75664 ((_ is Undefined!321) (seekEntryOrOpen!0 key!828 (_keys!5032 thiss!1248) (mask!7791 thiss!1248))))))

(declare-fun array_inv!1745 (array!5793) Bool)

(declare-fun array_inv!1746 (array!5795) Bool)

(assert (=> b!159965 (= e!104642 (and tp!13234 tp_is_empty!3357 (array_inv!1745 (_keys!5032 thiss!1248)) (array_inv!1746 (_values!3214 thiss!1248)) e!104645))))

(declare-fun mapNonEmpty!5723 () Bool)

(declare-fun tp!13235 () Bool)

(assert (=> mapNonEmpty!5723 (= mapRes!5723 (and tp!13235 e!104646))))

(declare-fun mapRest!5723 () (Array (_ BitVec 32) ValueCell!1335))

(declare-fun mapKey!5723 () (_ BitVec 32))

(declare-fun mapValue!5723 () ValueCell!1335)

(assert (=> mapNonEmpty!5723 (= (arr!2742 (_values!3214 thiss!1248)) (store mapRest!5723 mapKey!5723 mapValue!5723))))

(declare-fun b!159966 () Bool)

(declare-fun res!75660 () Bool)

(assert (=> b!159966 (=> (not res!75660) (not e!104641))))

(assert (=> b!159966 (= res!75660 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159967 () Bool)

(declare-fun res!75663 () Bool)

(assert (=> b!159967 (=> (not res!75663) (not e!104641))))

(assert (=> b!159967 (= res!75663 (and (= (size!3026 (_values!3214 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7791 thiss!1248))) (= (size!3025 (_keys!5032 thiss!1248)) (size!3026 (_values!3214 thiss!1248))) (bvsge (mask!7791 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2972 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2972 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16094 res!75659) b!159966))

(assert (= (and b!159966 res!75660) b!159964))

(assert (= (and b!159964 res!75664) b!159962))

(assert (= (and b!159962 res!75662) b!159957))

(assert (= (and b!159957 res!75665) b!159967))

(assert (= (and b!159967 res!75663) b!159958))

(assert (= (and b!159958 res!75661) b!159961))

(assert (= (and b!159959 condMapEmpty!5723) mapIsEmpty!5723))

(assert (= (and b!159959 (not condMapEmpty!5723)) mapNonEmpty!5723))

(assert (= (and mapNonEmpty!5723 ((_ is ValueCellFull!1335) mapValue!5723)) b!159960))

(assert (= (and b!159959 ((_ is ValueCellFull!1335) mapDefault!5723)) b!159963))

(assert (= b!159965 b!159959))

(assert (= start!16094 b!159965))

(declare-fun m!192017 () Bool)

(assert (=> b!159962 m!192017))

(assert (=> b!159962 m!192017))

(declare-fun m!192019 () Bool)

(assert (=> b!159962 m!192019))

(declare-fun m!192021 () Bool)

(assert (=> b!159964 m!192021))

(declare-fun m!192023 () Bool)

(assert (=> b!159965 m!192023))

(declare-fun m!192025 () Bool)

(assert (=> b!159965 m!192025))

(declare-fun m!192027 () Bool)

(assert (=> start!16094 m!192027))

(declare-fun m!192029 () Bool)

(assert (=> mapNonEmpty!5723 m!192029))

(declare-fun m!192031 () Bool)

(assert (=> b!159961 m!192031))

(declare-fun m!192033 () Bool)

(assert (=> b!159958 m!192033))

(declare-fun m!192035 () Bool)

(assert (=> b!159957 m!192035))

(check-sat b_and!9969 (not start!16094) tp_is_empty!3357 (not b_next!3555) (not b!159965) (not b!159958) (not b!159962) (not mapNonEmpty!5723) (not b!159957) (not b!159961) (not b!159964))
(check-sat b_and!9969 (not b_next!3555))
