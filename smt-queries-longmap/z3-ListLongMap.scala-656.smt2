; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16288 () Bool)

(assert start!16288)

(declare-fun b!162510 () Bool)

(declare-fun b_free!3745 () Bool)

(declare-fun b_next!3745 () Bool)

(assert (=> b!162510 (= b_free!3745 (not b_next!3745))))

(declare-fun tp!13805 () Bool)

(declare-fun b_and!10173 () Bool)

(assert (=> b!162510 (= tp!13805 b_and!10173)))

(declare-fun mapIsEmpty!6008 () Bool)

(declare-fun mapRes!6008 () Bool)

(assert (=> mapIsEmpty!6008 mapRes!6008))

(declare-fun b!162505 () Bool)

(declare-fun res!76955 () Bool)

(declare-fun e!106500 () Bool)

(assert (=> b!162505 (=> (not res!76955) (not e!106500))))

(declare-datatypes ((V!4377 0))(
  ( (V!4378 (val!1818 Int)) )
))
(declare-datatypes ((ValueCell!1430 0))(
  ( (ValueCellFull!1430 (v!3684 V!4377)) (EmptyCell!1430) )
))
(declare-datatypes ((array!6159 0))(
  ( (array!6160 (arr!2924 (Array (_ BitVec 32) (_ BitVec 64))) (size!3208 (_ BitVec 32))) )
))
(declare-datatypes ((array!6161 0))(
  ( (array!6162 (arr!2925 (Array (_ BitVec 32) ValueCell!1430)) (size!3209 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1768 0))(
  ( (LongMapFixedSize!1769 (defaultEntry!3326 Int) (mask!7950 (_ BitVec 32)) (extraKeys!3067 (_ BitVec 32)) (zeroValue!3169 V!4377) (minValue!3169 V!4377) (_size!933 (_ BitVec 32)) (_keys!5127 array!6159) (_values!3309 array!6161) (_vacant!933 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2952 0))(
  ( (tuple2!2953 (_1!1487 Bool) (_2!1487 LongMapFixedSize!1768)) )
))
(declare-fun lt!82512 () tuple2!2952)

(assert (=> b!162505 (= res!76955 (_1!1487 lt!82512))))

(declare-fun mapNonEmpty!6008 () Bool)

(declare-fun tp!13804 () Bool)

(declare-fun e!106501 () Bool)

(assert (=> mapNonEmpty!6008 (= mapRes!6008 (and tp!13804 e!106501))))

(declare-fun mapValue!6008 () ValueCell!1430)

(declare-fun thiss!1248 () LongMapFixedSize!1768)

(declare-fun mapKey!6008 () (_ BitVec 32))

(declare-fun mapRest!6008 () (Array (_ BitVec 32) ValueCell!1430))

(assert (=> mapNonEmpty!6008 (= (arr!2925 (_values!3309 thiss!1248)) (store mapRest!6008 mapKey!6008 mapValue!6008))))

(declare-fun b!162506 () Bool)

(declare-fun e!106497 () Bool)

(assert (=> b!162506 (= e!106497 e!106500)))

(declare-fun res!76953 () Bool)

(assert (=> b!162506 (=> (not res!76953) (not e!106500))))

(declare-fun valid!821 (LongMapFixedSize!1768) Bool)

(assert (=> b!162506 (= res!76953 (valid!821 (_2!1487 lt!82512)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4377)

(declare-datatypes ((SeekEntryResult!383 0))(
  ( (MissingZero!383 (index!3700 (_ BitVec 32))) (Found!383 (index!3701 (_ BitVec 32))) (Intermediate!383 (undefined!1195 Bool) (index!3702 (_ BitVec 32)) (x!17975 (_ BitVec 32))) (Undefined!383) (MissingVacant!383 (index!3703 (_ BitVec 32))) )
))
(declare-fun lt!82510 () SeekEntryResult!383)

(declare-fun updateHelperNewKey!84 (LongMapFixedSize!1768 (_ BitVec 64) V!4377 (_ BitVec 32)) tuple2!2952)

(assert (=> b!162506 (= lt!82512 (updateHelperNewKey!84 thiss!1248 key!828 v!309 (index!3700 lt!82510)))))

(declare-fun b!162507 () Bool)

(declare-fun res!76952 () Bool)

(declare-fun e!106503 () Bool)

(assert (=> b!162507 (=> (not res!76952) (not e!106503))))

(assert (=> b!162507 (= res!76952 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76951 () Bool)

(assert (=> start!16288 (=> (not res!76951) (not e!106503))))

(assert (=> start!16288 (= res!76951 (valid!821 thiss!1248))))

(assert (=> start!16288 e!106503))

(declare-fun e!106496 () Bool)

(assert (=> start!16288 e!106496))

(assert (=> start!16288 true))

(declare-fun tp_is_empty!3547 () Bool)

(assert (=> start!16288 tp_is_empty!3547))

(declare-fun b!162508 () Bool)

(declare-fun e!106498 () Bool)

(assert (=> b!162508 (= e!106498 tp_is_empty!3547)))

(declare-fun b!162509 () Bool)

(declare-fun e!106502 () Bool)

(assert (=> b!162509 (= e!106502 (and e!106498 mapRes!6008))))

(declare-fun condMapEmpty!6008 () Bool)

(declare-fun mapDefault!6008 () ValueCell!1430)

(assert (=> b!162509 (= condMapEmpty!6008 (= (arr!2925 (_values!3309 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1430)) mapDefault!6008)))))

(declare-fun array_inv!1877 (array!6159) Bool)

(declare-fun array_inv!1878 (array!6161) Bool)

(assert (=> b!162510 (= e!106496 (and tp!13805 tp_is_empty!3547 (array_inv!1877 (_keys!5127 thiss!1248)) (array_inv!1878 (_values!3309 thiss!1248)) e!106502))))

(declare-fun b!162511 () Bool)

(assert (=> b!162511 (= e!106503 e!106497)))

(declare-fun res!76954 () Bool)

(assert (=> b!162511 (=> (not res!76954) (not e!106497))))

(get-info :version)

(assert (=> b!162511 (= res!76954 (and (not ((_ is Undefined!383) lt!82510)) (not ((_ is MissingVacant!383) lt!82510)) ((_ is MissingZero!383) lt!82510)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6159 (_ BitVec 32)) SeekEntryResult!383)

(assert (=> b!162511 (= lt!82510 (seekEntryOrOpen!0 key!828 (_keys!5127 thiss!1248) (mask!7950 thiss!1248)))))

(declare-fun b!162512 () Bool)

(assert (=> b!162512 (= e!106500 false)))

(declare-fun lt!82511 () Bool)

(declare-datatypes ((tuple2!2954 0))(
  ( (tuple2!2955 (_1!1488 (_ BitVec 64)) (_2!1488 V!4377)) )
))
(declare-datatypes ((List!1980 0))(
  ( (Nil!1977) (Cons!1976 (h!2589 tuple2!2954) (t!6774 List!1980)) )
))
(declare-datatypes ((ListLongMap!1927 0))(
  ( (ListLongMap!1928 (toList!979 List!1980)) )
))
(declare-fun contains!1025 (ListLongMap!1927 (_ BitVec 64)) Bool)

(declare-fun map!1683 (LongMapFixedSize!1768) ListLongMap!1927)

(assert (=> b!162512 (= lt!82511 (contains!1025 (map!1683 (_2!1487 lt!82512)) key!828))))

(declare-fun b!162513 () Bool)

(assert (=> b!162513 (= e!106501 tp_is_empty!3547)))

(assert (= (and start!16288 res!76951) b!162507))

(assert (= (and b!162507 res!76952) b!162511))

(assert (= (and b!162511 res!76954) b!162506))

(assert (= (and b!162506 res!76953) b!162505))

(assert (= (and b!162505 res!76955) b!162512))

(assert (= (and b!162509 condMapEmpty!6008) mapIsEmpty!6008))

(assert (= (and b!162509 (not condMapEmpty!6008)) mapNonEmpty!6008))

(assert (= (and mapNonEmpty!6008 ((_ is ValueCellFull!1430) mapValue!6008)) b!162513))

(assert (= (and b!162509 ((_ is ValueCellFull!1430) mapDefault!6008)) b!162508))

(assert (= b!162510 b!162509))

(assert (= start!16288 b!162510))

(declare-fun m!193745 () Bool)

(assert (=> mapNonEmpty!6008 m!193745))

(declare-fun m!193747 () Bool)

(assert (=> start!16288 m!193747))

(declare-fun m!193749 () Bool)

(assert (=> b!162511 m!193749))

(declare-fun m!193751 () Bool)

(assert (=> b!162506 m!193751))

(declare-fun m!193753 () Bool)

(assert (=> b!162506 m!193753))

(declare-fun m!193755 () Bool)

(assert (=> b!162512 m!193755))

(assert (=> b!162512 m!193755))

(declare-fun m!193757 () Bool)

(assert (=> b!162512 m!193757))

(declare-fun m!193759 () Bool)

(assert (=> b!162510 m!193759))

(declare-fun m!193761 () Bool)

(assert (=> b!162510 m!193761))

(check-sat (not b!162506) (not mapNonEmpty!6008) (not b!162511) (not b!162510) (not b!162512) (not b_next!3745) (not start!16288) b_and!10173 tp_is_empty!3547)
(check-sat b_and!10173 (not b_next!3745))
