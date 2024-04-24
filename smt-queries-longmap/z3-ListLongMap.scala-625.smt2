; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16102 () Bool)

(assert start!16102)

(declare-fun b!160075 () Bool)

(declare-fun b_free!3559 () Bool)

(declare-fun b_next!3559 () Bool)

(assert (=> b!160075 (= b_free!3559 (not b_next!3559))))

(declare-fun tp!13246 () Bool)

(declare-fun b_and!9987 () Bool)

(assert (=> b!160075 (= tp!13246 b_and!9987)))

(declare-fun mapIsEmpty!5729 () Bool)

(declare-fun mapRes!5729 () Bool)

(assert (=> mapIsEmpty!5729 mapRes!5729))

(declare-fun b!160070 () Bool)

(declare-fun e!104703 () Bool)

(declare-fun tp_is_empty!3361 () Bool)

(assert (=> b!160070 (= e!104703 tp_is_empty!3361)))

(declare-fun b!160071 () Bool)

(declare-fun res!75724 () Bool)

(declare-fun e!104705 () Bool)

(assert (=> b!160071 (=> (not res!75724) (not e!104705))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160071 (= res!75724 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160072 () Bool)

(declare-fun res!75722 () Bool)

(assert (=> b!160072 (=> (not res!75722) (not e!104705))))

(declare-datatypes ((V!4129 0))(
  ( (V!4130 (val!1725 Int)) )
))
(declare-datatypes ((ValueCell!1337 0))(
  ( (ValueCellFull!1337 (v!3591 V!4129)) (EmptyCell!1337) )
))
(declare-datatypes ((array!5787 0))(
  ( (array!5788 (arr!2738 (Array (_ BitVec 32) (_ BitVec 64))) (size!3022 (_ BitVec 32))) )
))
(declare-datatypes ((array!5789 0))(
  ( (array!5790 (arr!2739 (Array (_ BitVec 32) ValueCell!1337)) (size!3023 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1582 0))(
  ( (LongMapFixedSize!1583 (defaultEntry!3233 Int) (mask!7795 (_ BitVec 32)) (extraKeys!2974 (_ BitVec 32)) (zeroValue!3076 V!4129) (minValue!3076 V!4129) (_size!840 (_ BitVec 32)) (_keys!5034 array!5787) (_values!3216 array!5789) (_vacant!840 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1582)

(declare-datatypes ((tuple2!2848 0))(
  ( (tuple2!2849 (_1!1435 (_ BitVec 64)) (_2!1435 V!4129)) )
))
(declare-datatypes ((List!1914 0))(
  ( (Nil!1911) (Cons!1910 (h!2523 tuple2!2848) (t!6708 List!1914)) )
))
(declare-datatypes ((ListLongMap!1847 0))(
  ( (ListLongMap!1848 (toList!939 List!1914)) )
))
(declare-fun contains!985 (ListLongMap!1847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!606 (array!5787 array!5789 (_ BitVec 32) (_ BitVec 32) V!4129 V!4129 (_ BitVec 32) Int) ListLongMap!1847)

(assert (=> b!160072 (= res!75722 (contains!985 (getCurrentListMap!606 (_keys!5034 thiss!1248) (_values!3216 thiss!1248) (mask!7795 thiss!1248) (extraKeys!2974 thiss!1248) (zeroValue!3076 thiss!1248) (minValue!3076 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3233 thiss!1248)) key!828))))

(declare-fun b!160073 () Bool)

(declare-fun res!75723 () Bool)

(assert (=> b!160073 (=> (not res!75723) (not e!104705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5787 (_ BitVec 32)) Bool)

(assert (=> b!160073 (= res!75723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5034 thiss!1248) (mask!7795 thiss!1248)))))

(declare-fun b!160074 () Bool)

(declare-fun res!75728 () Bool)

(assert (=> b!160074 (=> (not res!75728) (not e!104705))))

(assert (=> b!160074 (= res!75728 (and (= (size!3023 (_values!3216 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7795 thiss!1248))) (= (size!3022 (_keys!5034 thiss!1248)) (size!3023 (_values!3216 thiss!1248))) (bvsge (mask!7795 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2974 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2974 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75726 () Bool)

(assert (=> start!16102 (=> (not res!75726) (not e!104705))))

(declare-fun valid!754 (LongMapFixedSize!1582) Bool)

(assert (=> start!16102 (= res!75726 (valid!754 thiss!1248))))

(assert (=> start!16102 e!104705))

(declare-fun e!104704 () Bool)

(assert (=> start!16102 e!104704))

(assert (=> start!16102 true))

(declare-fun e!104701 () Bool)

(declare-fun array_inv!1751 (array!5787) Bool)

(declare-fun array_inv!1752 (array!5789) Bool)

(assert (=> b!160075 (= e!104704 (and tp!13246 tp_is_empty!3361 (array_inv!1751 (_keys!5034 thiss!1248)) (array_inv!1752 (_values!3216 thiss!1248)) e!104701))))

(declare-fun b!160076 () Bool)

(assert (=> b!160076 (= e!104701 (and e!104703 mapRes!5729))))

(declare-fun condMapEmpty!5729 () Bool)

(declare-fun mapDefault!5729 () ValueCell!1337)

(assert (=> b!160076 (= condMapEmpty!5729 (= (arr!2739 (_values!3216 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1337)) mapDefault!5729)))))

(declare-fun b!160077 () Bool)

(declare-fun res!75725 () Bool)

(assert (=> b!160077 (=> (not res!75725) (not e!104705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160077 (= res!75725 (validMask!0 (mask!7795 thiss!1248)))))

(declare-fun mapNonEmpty!5729 () Bool)

(declare-fun tp!13247 () Bool)

(declare-fun e!104706 () Bool)

(assert (=> mapNonEmpty!5729 (= mapRes!5729 (and tp!13247 e!104706))))

(declare-fun mapKey!5729 () (_ BitVec 32))

(declare-fun mapRest!5729 () (Array (_ BitVec 32) ValueCell!1337))

(declare-fun mapValue!5729 () ValueCell!1337)

(assert (=> mapNonEmpty!5729 (= (arr!2739 (_values!3216 thiss!1248)) (store mapRest!5729 mapKey!5729 mapValue!5729))))

(declare-fun b!160078 () Bool)

(assert (=> b!160078 (= e!104706 tp_is_empty!3361)))

(declare-fun b!160079 () Bool)

(declare-fun res!75727 () Bool)

(assert (=> b!160079 (=> (not res!75727) (not e!104705))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!318 0))(
  ( (MissingZero!318 (index!3440 (_ BitVec 32))) (Found!318 (index!3441 (_ BitVec 32))) (Intermediate!318 (undefined!1130 Bool) (index!3442 (_ BitVec 32)) (x!17662 (_ BitVec 32))) (Undefined!318) (MissingVacant!318 (index!3443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5787 (_ BitVec 32)) SeekEntryResult!318)

(assert (=> b!160079 (= res!75727 ((_ is Undefined!318) (seekEntryOrOpen!0 key!828 (_keys!5034 thiss!1248) (mask!7795 thiss!1248))))))

(declare-fun b!160080 () Bool)

(assert (=> b!160080 (= e!104705 false)))

(declare-fun lt!82110 () Bool)

(declare-datatypes ((List!1915 0))(
  ( (Nil!1912) (Cons!1911 (h!2524 (_ BitVec 64)) (t!6709 List!1915)) )
))
(declare-fun arrayNoDuplicates!0 (array!5787 (_ BitVec 32) List!1915) Bool)

(assert (=> b!160080 (= lt!82110 (arrayNoDuplicates!0 (_keys!5034 thiss!1248) #b00000000000000000000000000000000 Nil!1912))))

(assert (= (and start!16102 res!75726) b!160071))

(assert (= (and b!160071 res!75724) b!160079))

(assert (= (and b!160079 res!75727) b!160072))

(assert (= (and b!160072 res!75722) b!160077))

(assert (= (and b!160077 res!75725) b!160074))

(assert (= (and b!160074 res!75728) b!160073))

(assert (= (and b!160073 res!75723) b!160080))

(assert (= (and b!160076 condMapEmpty!5729) mapIsEmpty!5729))

(assert (= (and b!160076 (not condMapEmpty!5729)) mapNonEmpty!5729))

(assert (= (and mapNonEmpty!5729 ((_ is ValueCellFull!1337) mapValue!5729)) b!160078))

(assert (= (and b!160076 ((_ is ValueCellFull!1337) mapDefault!5729)) b!160070))

(assert (= b!160075 b!160076))

(assert (= start!16102 b!160075))

(declare-fun m!192239 () Bool)

(assert (=> b!160077 m!192239))

(declare-fun m!192241 () Bool)

(assert (=> b!160079 m!192241))

(declare-fun m!192243 () Bool)

(assert (=> b!160075 m!192243))

(declare-fun m!192245 () Bool)

(assert (=> b!160075 m!192245))

(declare-fun m!192247 () Bool)

(assert (=> b!160080 m!192247))

(declare-fun m!192249 () Bool)

(assert (=> start!16102 m!192249))

(declare-fun m!192251 () Bool)

(assert (=> b!160073 m!192251))

(declare-fun m!192253 () Bool)

(assert (=> mapNonEmpty!5729 m!192253))

(declare-fun m!192255 () Bool)

(assert (=> b!160072 m!192255))

(assert (=> b!160072 m!192255))

(declare-fun m!192257 () Bool)

(assert (=> b!160072 m!192257))

(check-sat (not b_next!3559) (not b!160080) (not mapNonEmpty!5729) (not b!160077) (not start!16102) b_and!9987 tp_is_empty!3361 (not b!160073) (not b!160075) (not b!160072) (not b!160079))
(check-sat b_and!9987 (not b_next!3559))
