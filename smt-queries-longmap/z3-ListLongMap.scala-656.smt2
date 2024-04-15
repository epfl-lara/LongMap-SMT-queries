; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16288 () Bool)

(assert start!16288)

(declare-fun b!162317 () Bool)

(declare-fun b_free!3745 () Bool)

(declare-fun b_next!3745 () Bool)

(assert (=> b!162317 (= b_free!3745 (not b_next!3745))))

(declare-fun tp!13804 () Bool)

(declare-fun b_and!10133 () Bool)

(assert (=> b!162317 (= tp!13804 b_and!10133)))

(declare-fun b!162311 () Bool)

(declare-fun e!106376 () Bool)

(declare-fun e!106375 () Bool)

(assert (=> b!162311 (= e!106376 e!106375)))

(declare-fun res!76838 () Bool)

(assert (=> b!162311 (=> (not res!76838) (not e!106375))))

(declare-datatypes ((V!4377 0))(
  ( (V!4378 (val!1818 Int)) )
))
(declare-datatypes ((ValueCell!1430 0))(
  ( (ValueCellFull!1430 (v!3677 V!4377)) (EmptyCell!1430) )
))
(declare-datatypes ((array!6153 0))(
  ( (array!6154 (arr!2920 (Array (_ BitVec 32) (_ BitVec 64))) (size!3205 (_ BitVec 32))) )
))
(declare-datatypes ((array!6155 0))(
  ( (array!6156 (arr!2921 (Array (_ BitVec 32) ValueCell!1430)) (size!3206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1768 0))(
  ( (LongMapFixedSize!1769 (defaultEntry!3326 Int) (mask!7949 (_ BitVec 32)) (extraKeys!3067 (_ BitVec 32)) (zeroValue!3169 V!4377) (minValue!3169 V!4377) (_size!933 (_ BitVec 32)) (_keys!5126 array!6153) (_values!3309 array!6155) (_vacant!933 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2974 0))(
  ( (tuple2!2975 (_1!1498 Bool) (_2!1498 LongMapFixedSize!1768)) )
))
(declare-fun lt!82272 () tuple2!2974)

(declare-fun valid!801 (LongMapFixedSize!1768) Bool)

(assert (=> b!162311 (= res!76838 (valid!801 (_2!1498 lt!82272)))))

(declare-datatypes ((SeekEntryResult!392 0))(
  ( (MissingZero!392 (index!3736 (_ BitVec 32))) (Found!392 (index!3737 (_ BitVec 32))) (Intermediate!392 (undefined!1204 Bool) (index!3738 (_ BitVec 32)) (x!17983 (_ BitVec 32))) (Undefined!392) (MissingVacant!392 (index!3739 (_ BitVec 32))) )
))
(declare-fun lt!82271 () SeekEntryResult!392)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4377)

(declare-fun thiss!1248 () LongMapFixedSize!1768)

(declare-fun updateHelperNewKey!83 (LongMapFixedSize!1768 (_ BitVec 64) V!4377 (_ BitVec 32)) tuple2!2974)

(assert (=> b!162311 (= lt!82272 (updateHelperNewKey!83 thiss!1248 key!828 v!309 (index!3736 lt!82271)))))

(declare-fun res!76839 () Bool)

(declare-fun e!106377 () Bool)

(assert (=> start!16288 (=> (not res!76839) (not e!106377))))

(assert (=> start!16288 (= res!76839 (valid!801 thiss!1248))))

(assert (=> start!16288 e!106377))

(declare-fun e!106378 () Bool)

(assert (=> start!16288 e!106378))

(assert (=> start!16288 true))

(declare-fun tp_is_empty!3547 () Bool)

(assert (=> start!16288 tp_is_empty!3547))

(declare-fun mapIsEmpty!6008 () Bool)

(declare-fun mapRes!6008 () Bool)

(assert (=> mapIsEmpty!6008 mapRes!6008))

(declare-fun b!162312 () Bool)

(declare-fun e!106372 () Bool)

(assert (=> b!162312 (= e!106372 tp_is_empty!3547)))

(declare-fun b!162313 () Bool)

(assert (=> b!162313 (= e!106375 false)))

(declare-fun lt!82270 () Bool)

(declare-datatypes ((tuple2!2976 0))(
  ( (tuple2!2977 (_1!1499 (_ BitVec 64)) (_2!1499 V!4377)) )
))
(declare-datatypes ((List!1988 0))(
  ( (Nil!1985) (Cons!1984 (h!2597 tuple2!2976) (t!6781 List!1988)) )
))
(declare-datatypes ((ListLongMap!1937 0))(
  ( (ListLongMap!1938 (toList!984 List!1988)) )
))
(declare-fun contains!1023 (ListLongMap!1937 (_ BitVec 64)) Bool)

(declare-fun map!1671 (LongMapFixedSize!1768) ListLongMap!1937)

(assert (=> b!162313 (= lt!82270 (contains!1023 (map!1671 (_2!1498 lt!82272)) key!828))))

(declare-fun b!162314 () Bool)

(assert (=> b!162314 (= e!106377 e!106376)))

(declare-fun res!76836 () Bool)

(assert (=> b!162314 (=> (not res!76836) (not e!106376))))

(get-info :version)

(assert (=> b!162314 (= res!76836 (and (not ((_ is Undefined!392) lt!82271)) (not ((_ is MissingVacant!392) lt!82271)) ((_ is MissingZero!392) lt!82271)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6153 (_ BitVec 32)) SeekEntryResult!392)

(assert (=> b!162314 (= lt!82271 (seekEntryOrOpen!0 key!828 (_keys!5126 thiss!1248) (mask!7949 thiss!1248)))))

(declare-fun b!162315 () Bool)

(declare-fun e!106371 () Bool)

(declare-fun e!106373 () Bool)

(assert (=> b!162315 (= e!106371 (and e!106373 mapRes!6008))))

(declare-fun condMapEmpty!6008 () Bool)

(declare-fun mapDefault!6008 () ValueCell!1430)

(assert (=> b!162315 (= condMapEmpty!6008 (= (arr!2921 (_values!3309 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1430)) mapDefault!6008)))))

(declare-fun mapNonEmpty!6008 () Bool)

(declare-fun tp!13805 () Bool)

(assert (=> mapNonEmpty!6008 (= mapRes!6008 (and tp!13805 e!106372))))

(declare-fun mapValue!6008 () ValueCell!1430)

(declare-fun mapKey!6008 () (_ BitVec 32))

(declare-fun mapRest!6008 () (Array (_ BitVec 32) ValueCell!1430))

(assert (=> mapNonEmpty!6008 (= (arr!2921 (_values!3309 thiss!1248)) (store mapRest!6008 mapKey!6008 mapValue!6008))))

(declare-fun b!162316 () Bool)

(declare-fun res!76835 () Bool)

(assert (=> b!162316 (=> (not res!76835) (not e!106377))))

(assert (=> b!162316 (= res!76835 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1883 (array!6153) Bool)

(declare-fun array_inv!1884 (array!6155) Bool)

(assert (=> b!162317 (= e!106378 (and tp!13804 tp_is_empty!3547 (array_inv!1883 (_keys!5126 thiss!1248)) (array_inv!1884 (_values!3309 thiss!1248)) e!106371))))

(declare-fun b!162318 () Bool)

(declare-fun res!76837 () Bool)

(assert (=> b!162318 (=> (not res!76837) (not e!106375))))

(assert (=> b!162318 (= res!76837 (_1!1498 lt!82272))))

(declare-fun b!162319 () Bool)

(assert (=> b!162319 (= e!106373 tp_is_empty!3547)))

(assert (= (and start!16288 res!76839) b!162316))

(assert (= (and b!162316 res!76835) b!162314))

(assert (= (and b!162314 res!76836) b!162311))

(assert (= (and b!162311 res!76838) b!162318))

(assert (= (and b!162318 res!76837) b!162313))

(assert (= (and b!162315 condMapEmpty!6008) mapIsEmpty!6008))

(assert (= (and b!162315 (not condMapEmpty!6008)) mapNonEmpty!6008))

(assert (= (and mapNonEmpty!6008 ((_ is ValueCellFull!1430) mapValue!6008)) b!162312))

(assert (= (and b!162315 ((_ is ValueCellFull!1430) mapDefault!6008)) b!162319))

(assert (= b!162317 b!162315))

(assert (= start!16288 b!162317))

(declare-fun m!192943 () Bool)

(assert (=> start!16288 m!192943))

(declare-fun m!192945 () Bool)

(assert (=> b!162311 m!192945))

(declare-fun m!192947 () Bool)

(assert (=> b!162311 m!192947))

(declare-fun m!192949 () Bool)

(assert (=> mapNonEmpty!6008 m!192949))

(declare-fun m!192951 () Bool)

(assert (=> b!162313 m!192951))

(assert (=> b!162313 m!192951))

(declare-fun m!192953 () Bool)

(assert (=> b!162313 m!192953))

(declare-fun m!192955 () Bool)

(assert (=> b!162314 m!192955))

(declare-fun m!192957 () Bool)

(assert (=> b!162317 m!192957))

(declare-fun m!192959 () Bool)

(assert (=> b!162317 m!192959))

(check-sat (not b!162317) tp_is_empty!3547 (not b!162313) (not b!162314) (not b!162311) (not b_next!3745) (not start!16288) (not mapNonEmpty!6008) b_and!10133)
(check-sat b_and!10133 (not b_next!3745))
