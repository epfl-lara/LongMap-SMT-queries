; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17726 () Bool)

(assert start!17726)

(declare-fun b!177016 () Bool)

(declare-fun b_free!4375 () Bool)

(declare-fun b_next!4375 () Bool)

(assert (=> b!177016 (= b_free!4375 (not b_next!4375))))

(declare-fun tp!15824 () Bool)

(declare-fun b_and!10849 () Bool)

(assert (=> b!177016 (= tp!15824 b_and!10849)))

(declare-fun mapNonEmpty!7083 () Bool)

(declare-fun mapRes!7083 () Bool)

(declare-fun tp!15825 () Bool)

(declare-fun e!116722 () Bool)

(assert (=> mapNonEmpty!7083 (= mapRes!7083 (and tp!15825 e!116722))))

(declare-datatypes ((V!5177 0))(
  ( (V!5178 (val!2118 Int)) )
))
(declare-datatypes ((ValueCell!1730 0))(
  ( (ValueCellFull!1730 (v!3992 V!5177)) (EmptyCell!1730) )
))
(declare-fun mapValue!7083 () ValueCell!1730)

(declare-fun mapKey!7083 () (_ BitVec 32))

(declare-datatypes ((array!7425 0))(
  ( (array!7426 (arr!3520 (Array (_ BitVec 32) (_ BitVec 64))) (size!3825 (_ BitVec 32))) )
))
(declare-datatypes ((array!7427 0))(
  ( (array!7428 (arr!3521 (Array (_ BitVec 32) ValueCell!1730)) (size!3826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2368 0))(
  ( (LongMapFixedSize!2369 (defaultEntry!3647 Int) (mask!8580 (_ BitVec 32)) (extraKeys!3384 (_ BitVec 32)) (zeroValue!3488 V!5177) (minValue!3488 V!5177) (_size!1233 (_ BitVec 32)) (_keys!5513 array!7425) (_values!3630 array!7427) (_vacant!1233 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2368)

(declare-fun mapRest!7083 () (Array (_ BitVec 32) ValueCell!1730))

(assert (=> mapNonEmpty!7083 (= (arr!3521 (_values!3630 thiss!1248)) (store mapRest!7083 mapKey!7083 mapValue!7083))))

(declare-fun mapIsEmpty!7083 () Bool)

(assert (=> mapIsEmpty!7083 mapRes!7083))

(declare-fun b!177013 () Bool)

(declare-fun e!116725 () Bool)

(declare-fun e!116726 () Bool)

(assert (=> b!177013 (= e!116725 (and e!116726 mapRes!7083))))

(declare-fun condMapEmpty!7083 () Bool)

(declare-fun mapDefault!7083 () ValueCell!1730)

(assert (=> b!177013 (= condMapEmpty!7083 (= (arr!3521 (_values!3630 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1730)) mapDefault!7083)))))

(declare-fun res!83884 () Bool)

(declare-fun e!116723 () Bool)

(assert (=> start!17726 (=> (not res!83884) (not e!116723))))

(declare-fun valid!1012 (LongMapFixedSize!2368) Bool)

(assert (=> start!17726 (= res!83884 (valid!1012 thiss!1248))))

(assert (=> start!17726 e!116723))

(declare-fun e!116727 () Bool)

(assert (=> start!17726 e!116727))

(assert (=> start!17726 true))

(declare-fun b!177014 () Bool)

(declare-fun tp_is_empty!4147 () Bool)

(assert (=> b!177014 (= e!116726 tp_is_empty!4147)))

(declare-fun b!177015 () Bool)

(declare-fun res!83886 () Bool)

(assert (=> b!177015 (=> (not res!83886) (not e!116723))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3284 0))(
  ( (tuple2!3285 (_1!1653 (_ BitVec 64)) (_2!1653 V!5177)) )
))
(declare-datatypes ((List!2253 0))(
  ( (Nil!2250) (Cons!2249 (h!2870 tuple2!3284) (t!7074 List!2253)) )
))
(declare-datatypes ((ListLongMap!2203 0))(
  ( (ListLongMap!2204 (toList!1117 List!2253)) )
))
(declare-fun contains!1188 (ListLongMap!2203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!753 (array!7425 array!7427 (_ BitVec 32) (_ BitVec 32) V!5177 V!5177 (_ BitVec 32) Int) ListLongMap!2203)

(assert (=> b!177015 (= res!83886 (contains!1188 (getCurrentListMap!753 (_keys!5513 thiss!1248) (_values!3630 thiss!1248) (mask!8580 thiss!1248) (extraKeys!3384 thiss!1248) (zeroValue!3488 thiss!1248) (minValue!3488 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3647 thiss!1248)) key!828))))

(declare-fun array_inv!2275 (array!7425) Bool)

(declare-fun array_inv!2276 (array!7427) Bool)

(assert (=> b!177016 (= e!116727 (and tp!15824 tp_is_empty!4147 (array_inv!2275 (_keys!5513 thiss!1248)) (array_inv!2276 (_values!3630 thiss!1248)) e!116725))))

(declare-fun b!177017 () Bool)

(declare-fun res!83885 () Bool)

(assert (=> b!177017 (=> (not res!83885) (not e!116723))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!576 0))(
  ( (MissingZero!576 (index!4472 (_ BitVec 32))) (Found!576 (index!4473 (_ BitVec 32))) (Intermediate!576 (undefined!1388 Bool) (index!4474 (_ BitVec 32)) (x!19447 (_ BitVec 32))) (Undefined!576) (MissingVacant!576 (index!4475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7425 (_ BitVec 32)) SeekEntryResult!576)

(assert (=> b!177017 (= res!83885 ((_ is Undefined!576) (seekEntryOrOpen!0 key!828 (_keys!5513 thiss!1248) (mask!8580 thiss!1248))))))

(declare-fun b!177018 () Bool)

(declare-fun res!83883 () Bool)

(assert (=> b!177018 (=> (not res!83883) (not e!116723))))

(assert (=> b!177018 (= res!83883 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177019 () Bool)

(assert (=> b!177019 (= e!116722 tp_is_empty!4147)))

(declare-fun b!177020 () Bool)

(assert (=> b!177020 (= e!116723 (not true))))

(assert (=> b!177020 false))

(declare-datatypes ((Unit!5391 0))(
  ( (Unit!5392) )
))
(declare-fun lt!87398 () Unit!5391)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!137 (array!7425 array!7427 (_ BitVec 32) (_ BitVec 32) V!5177 V!5177 (_ BitVec 64) Int) Unit!5391)

(assert (=> b!177020 (= lt!87398 (lemmaInListMapThenSeekEntryOrOpenFindsIt!137 (_keys!5513 thiss!1248) (_values!3630 thiss!1248) (mask!8580 thiss!1248) (extraKeys!3384 thiss!1248) (zeroValue!3488 thiss!1248) (minValue!3488 thiss!1248) key!828 (defaultEntry!3647 thiss!1248)))))

(assert (= (and start!17726 res!83884) b!177018))

(assert (= (and b!177018 res!83883) b!177017))

(assert (= (and b!177017 res!83885) b!177015))

(assert (= (and b!177015 res!83886) b!177020))

(assert (= (and b!177013 condMapEmpty!7083) mapIsEmpty!7083))

(assert (= (and b!177013 (not condMapEmpty!7083)) mapNonEmpty!7083))

(assert (= (and mapNonEmpty!7083 ((_ is ValueCellFull!1730) mapValue!7083)) b!177019))

(assert (= (and b!177013 ((_ is ValueCellFull!1730) mapDefault!7083)) b!177014))

(assert (= b!177016 b!177013))

(assert (= start!17726 b!177016))

(declare-fun m!205125 () Bool)

(assert (=> mapNonEmpty!7083 m!205125))

(declare-fun m!205127 () Bool)

(assert (=> b!177020 m!205127))

(declare-fun m!205129 () Bool)

(assert (=> b!177015 m!205129))

(assert (=> b!177015 m!205129))

(declare-fun m!205131 () Bool)

(assert (=> b!177015 m!205131))

(declare-fun m!205133 () Bool)

(assert (=> b!177016 m!205133))

(declare-fun m!205135 () Bool)

(assert (=> b!177016 m!205135))

(declare-fun m!205137 () Bool)

(assert (=> b!177017 m!205137))

(declare-fun m!205139 () Bool)

(assert (=> start!17726 m!205139))

(check-sat (not b!177017) tp_is_empty!4147 (not start!17726) (not b_next!4375) b_and!10849 (not mapNonEmpty!7083) (not b!177016) (not b!177020) (not b!177015))
(check-sat b_and!10849 (not b_next!4375))
