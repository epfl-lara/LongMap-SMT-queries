; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17726 () Bool)

(assert start!17726)

(declare-fun b!177212 () Bool)

(declare-fun b_free!4375 () Bool)

(declare-fun b_next!4375 () Bool)

(assert (=> b!177212 (= b_free!4375 (not b_next!4375))))

(declare-fun tp!15825 () Bool)

(declare-fun b_and!10889 () Bool)

(assert (=> b!177212 (= tp!15825 b_and!10889)))

(declare-fun mapIsEmpty!7083 () Bool)

(declare-fun mapRes!7083 () Bool)

(assert (=> mapIsEmpty!7083 mapRes!7083))

(declare-fun b!177207 () Bool)

(declare-fun res!84000 () Bool)

(declare-fun e!116850 () Bool)

(assert (=> b!177207 (=> (not res!84000) (not e!116850))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5177 0))(
  ( (V!5178 (val!2118 Int)) )
))
(declare-datatypes ((ValueCell!1730 0))(
  ( (ValueCellFull!1730 (v!3999 V!5177)) (EmptyCell!1730) )
))
(declare-datatypes ((array!7431 0))(
  ( (array!7432 (arr!3524 (Array (_ BitVec 32) (_ BitVec 64))) (size!3828 (_ BitVec 32))) )
))
(declare-datatypes ((array!7433 0))(
  ( (array!7434 (arr!3525 (Array (_ BitVec 32) ValueCell!1730)) (size!3829 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2368 0))(
  ( (LongMapFixedSize!2369 (defaultEntry!3647 Int) (mask!8581 (_ BitVec 32)) (extraKeys!3384 (_ BitVec 32)) (zeroValue!3488 V!5177) (minValue!3488 V!5177) (_size!1233 (_ BitVec 32)) (_keys!5514 array!7431) (_values!3630 array!7433) (_vacant!1233 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2368)

(get-info :version)

(declare-datatypes ((SeekEntryResult!560 0))(
  ( (MissingZero!560 (index!4408 (_ BitVec 32))) (Found!560 (index!4409 (_ BitVec 32))) (Intermediate!560 (undefined!1372 Bool) (index!4410 (_ BitVec 32)) (x!19432 (_ BitVec 32))) (Undefined!560) (MissingVacant!560 (index!4411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7431 (_ BitVec 32)) SeekEntryResult!560)

(assert (=> b!177207 (= res!84000 ((_ is Undefined!560) (seekEntryOrOpen!0 key!828 (_keys!5514 thiss!1248) (mask!8581 thiss!1248))))))

(declare-fun b!177208 () Bool)

(assert (=> b!177208 (= e!116850 (not true))))

(assert (=> b!177208 false))

(declare-datatypes ((Unit!5417 0))(
  ( (Unit!5418) )
))
(declare-fun lt!87638 () Unit!5417)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!139 (array!7431 array!7433 (_ BitVec 32) (_ BitVec 32) V!5177 V!5177 (_ BitVec 64) Int) Unit!5417)

(assert (=> b!177208 (= lt!87638 (lemmaInListMapThenSeekEntryOrOpenFindsIt!139 (_keys!5514 thiss!1248) (_values!3630 thiss!1248) (mask!8581 thiss!1248) (extraKeys!3384 thiss!1248) (zeroValue!3488 thiss!1248) (minValue!3488 thiss!1248) key!828 (defaultEntry!3647 thiss!1248)))))

(declare-fun b!177209 () Bool)

(declare-fun e!116847 () Bool)

(declare-fun tp_is_empty!4147 () Bool)

(assert (=> b!177209 (= e!116847 tp_is_empty!4147)))

(declare-fun b!177210 () Bool)

(declare-fun e!116851 () Bool)

(assert (=> b!177210 (= e!116851 tp_is_empty!4147)))

(declare-fun b!177211 () Bool)

(declare-fun res!84001 () Bool)

(assert (=> b!177211 (=> (not res!84001) (not e!116850))))

(assert (=> b!177211 (= res!84001 (not (= key!828 (bvneg key!828))))))

(declare-fun res!83999 () Bool)

(assert (=> start!17726 (=> (not res!83999) (not e!116850))))

(declare-fun valid!1013 (LongMapFixedSize!2368) Bool)

(assert (=> start!17726 (= res!83999 (valid!1013 thiss!1248))))

(assert (=> start!17726 e!116850))

(declare-fun e!116852 () Bool)

(assert (=> start!17726 e!116852))

(assert (=> start!17726 true))

(declare-fun e!116848 () Bool)

(declare-fun array_inv!2275 (array!7431) Bool)

(declare-fun array_inv!2276 (array!7433) Bool)

(assert (=> b!177212 (= e!116852 (and tp!15825 tp_is_empty!4147 (array_inv!2275 (_keys!5514 thiss!1248)) (array_inv!2276 (_values!3630 thiss!1248)) e!116848))))

(declare-fun mapNonEmpty!7083 () Bool)

(declare-fun tp!15824 () Bool)

(assert (=> mapNonEmpty!7083 (= mapRes!7083 (and tp!15824 e!116847))))

(declare-fun mapKey!7083 () (_ BitVec 32))

(declare-fun mapRest!7083 () (Array (_ BitVec 32) ValueCell!1730))

(declare-fun mapValue!7083 () ValueCell!1730)

(assert (=> mapNonEmpty!7083 (= (arr!3525 (_values!3630 thiss!1248)) (store mapRest!7083 mapKey!7083 mapValue!7083))))

(declare-fun b!177213 () Bool)

(assert (=> b!177213 (= e!116848 (and e!116851 mapRes!7083))))

(declare-fun condMapEmpty!7083 () Bool)

(declare-fun mapDefault!7083 () ValueCell!1730)

(assert (=> b!177213 (= condMapEmpty!7083 (= (arr!3525 (_values!3630 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1730)) mapDefault!7083)))))

(declare-fun b!177214 () Bool)

(declare-fun res!84002 () Bool)

(assert (=> b!177214 (=> (not res!84002) (not e!116850))))

(declare-datatypes ((tuple2!3248 0))(
  ( (tuple2!3249 (_1!1635 (_ BitVec 64)) (_2!1635 V!5177)) )
))
(declare-datatypes ((List!2223 0))(
  ( (Nil!2220) (Cons!2219 (h!2840 tuple2!3248) (t!7045 List!2223)) )
))
(declare-datatypes ((ListLongMap!2181 0))(
  ( (ListLongMap!2182 (toList!1106 List!2223)) )
))
(declare-fun contains!1183 (ListLongMap!2181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!761 (array!7431 array!7433 (_ BitVec 32) (_ BitVec 32) V!5177 V!5177 (_ BitVec 32) Int) ListLongMap!2181)

(assert (=> b!177214 (= res!84002 (contains!1183 (getCurrentListMap!761 (_keys!5514 thiss!1248) (_values!3630 thiss!1248) (mask!8581 thiss!1248) (extraKeys!3384 thiss!1248) (zeroValue!3488 thiss!1248) (minValue!3488 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3647 thiss!1248)) key!828))))

(assert (= (and start!17726 res!83999) b!177211))

(assert (= (and b!177211 res!84001) b!177207))

(assert (= (and b!177207 res!84000) b!177214))

(assert (= (and b!177214 res!84002) b!177208))

(assert (= (and b!177213 condMapEmpty!7083) mapIsEmpty!7083))

(assert (= (and b!177213 (not condMapEmpty!7083)) mapNonEmpty!7083))

(assert (= (and mapNonEmpty!7083 ((_ is ValueCellFull!1730) mapValue!7083)) b!177209))

(assert (= (and b!177213 ((_ is ValueCellFull!1730) mapDefault!7083)) b!177210))

(assert (= b!177212 b!177213))

(assert (= start!17726 b!177212))

(declare-fun m!205927 () Bool)

(assert (=> mapNonEmpty!7083 m!205927))

(declare-fun m!205929 () Bool)

(assert (=> b!177208 m!205929))

(declare-fun m!205931 () Bool)

(assert (=> b!177214 m!205931))

(assert (=> b!177214 m!205931))

(declare-fun m!205933 () Bool)

(assert (=> b!177214 m!205933))

(declare-fun m!205935 () Bool)

(assert (=> b!177207 m!205935))

(declare-fun m!205937 () Bool)

(assert (=> start!17726 m!205937))

(declare-fun m!205939 () Bool)

(assert (=> b!177212 m!205939))

(declare-fun m!205941 () Bool)

(assert (=> b!177212 m!205941))

(check-sat (not b!177212) (not b!177214) (not mapNonEmpty!7083) tp_is_empty!4147 (not b!177208) (not b_next!4375) b_and!10889 (not start!17726) (not b!177207))
(check-sat b_and!10889 (not b_next!4375))
