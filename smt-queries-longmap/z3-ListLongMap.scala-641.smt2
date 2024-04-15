; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16198 () Bool)

(assert start!16198)

(declare-fun b!161387 () Bool)

(declare-fun b_free!3655 () Bool)

(declare-fun b_next!3655 () Bool)

(assert (=> b!161387 (= b_free!3655 (not b_next!3655))))

(declare-fun tp!13535 () Bool)

(declare-fun b_and!10043 () Bool)

(assert (=> b!161387 (= tp!13535 b_and!10043)))

(declare-fun mapNonEmpty!5873 () Bool)

(declare-fun mapRes!5873 () Bool)

(declare-fun tp!13534 () Bool)

(declare-fun e!105478 () Bool)

(assert (=> mapNonEmpty!5873 (= mapRes!5873 (and tp!13534 e!105478))))

(declare-datatypes ((V!4257 0))(
  ( (V!4258 (val!1773 Int)) )
))
(declare-datatypes ((ValueCell!1385 0))(
  ( (ValueCellFull!1385 (v!3632 V!4257)) (EmptyCell!1385) )
))
(declare-fun mapRest!5873 () (Array (_ BitVec 32) ValueCell!1385))

(declare-fun mapKey!5873 () (_ BitVec 32))

(declare-datatypes ((array!5973 0))(
  ( (array!5974 (arr!2830 (Array (_ BitVec 32) (_ BitVec 64))) (size!3115 (_ BitVec 32))) )
))
(declare-datatypes ((array!5975 0))(
  ( (array!5976 (arr!2831 (Array (_ BitVec 32) ValueCell!1385)) (size!3116 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1678 0))(
  ( (LongMapFixedSize!1679 (defaultEntry!3281 Int) (mask!7874 (_ BitVec 32)) (extraKeys!3022 (_ BitVec 32)) (zeroValue!3124 V!4257) (minValue!3124 V!4257) (_size!888 (_ BitVec 32)) (_keys!5081 array!5973) (_values!3264 array!5975) (_vacant!888 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1678)

(declare-fun mapValue!5873 () ValueCell!1385)

(assert (=> mapNonEmpty!5873 (= (arr!2831 (_values!3264 thiss!1248)) (store mapRest!5873 mapKey!5873 mapValue!5873))))

(declare-fun b!161384 () Bool)

(declare-datatypes ((Unit!4999 0))(
  ( (Unit!5000) )
))
(declare-fun e!105484 () Unit!4999)

(declare-fun Unit!5001 () Unit!4999)

(assert (=> b!161384 (= e!105484 Unit!5001)))

(declare-fun lt!82052 () Unit!4999)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!79 (array!5973 array!5975 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 64) Int) Unit!4999)

(assert (=> b!161384 (= lt!82052 (lemmaInListMapThenSeekEntryOrOpenFindsIt!79 (_keys!5081 thiss!1248) (_values!3264 thiss!1248) (mask!7874 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) key!828 (defaultEntry!3281 thiss!1248)))))

(assert (=> b!161384 false))

(declare-fun b!161385 () Bool)

(declare-fun e!105483 () Bool)

(assert (=> b!161385 (= e!105483 false)))

(declare-fun lt!82053 () Unit!4999)

(assert (=> b!161385 (= lt!82053 e!105484)))

(declare-fun c!29945 () Bool)

(declare-datatypes ((tuple2!2940 0))(
  ( (tuple2!2941 (_1!1481 (_ BitVec 64)) (_2!1481 V!4257)) )
))
(declare-datatypes ((List!1983 0))(
  ( (Nil!1980) (Cons!1979 (h!2592 tuple2!2940) (t!6776 List!1983)) )
))
(declare-datatypes ((ListLongMap!1927 0))(
  ( (ListLongMap!1928 (toList!979 List!1983)) )
))
(declare-fun contains!1018 (ListLongMap!1927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!629 (array!5973 array!5975 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 32) Int) ListLongMap!1927)

(assert (=> b!161385 (= c!29945 (contains!1018 (getCurrentListMap!629 (_keys!5081 thiss!1248) (_values!3264 thiss!1248) (mask!7874 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3281 thiss!1248)) key!828))))

(declare-fun b!161386 () Bool)

(declare-fun res!76463 () Bool)

(assert (=> b!161386 (=> (not res!76463) (not e!105483))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!361 0))(
  ( (MissingZero!361 (index!3612 (_ BitVec 32))) (Found!361 (index!3613 (_ BitVec 32))) (Intermediate!361 (undefined!1173 Bool) (index!3614 (_ BitVec 32)) (x!17832 (_ BitVec 32))) (Undefined!361) (MissingVacant!361 (index!3615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5973 (_ BitVec 32)) SeekEntryResult!361)

(assert (=> b!161386 (= res!76463 ((_ is Undefined!361) (seekEntryOrOpen!0 key!828 (_keys!5081 thiss!1248) (mask!7874 thiss!1248))))))

(declare-fun e!105479 () Bool)

(declare-fun e!105480 () Bool)

(declare-fun tp_is_empty!3457 () Bool)

(declare-fun array_inv!1827 (array!5973) Bool)

(declare-fun array_inv!1828 (array!5975) Bool)

(assert (=> b!161387 (= e!105479 (and tp!13535 tp_is_empty!3457 (array_inv!1827 (_keys!5081 thiss!1248)) (array_inv!1828 (_values!3264 thiss!1248)) e!105480))))

(declare-fun b!161388 () Bool)

(assert (=> b!161388 (= e!105478 tp_is_empty!3457)))

(declare-fun mapIsEmpty!5873 () Bool)

(assert (=> mapIsEmpty!5873 mapRes!5873))

(declare-fun b!161389 () Bool)

(declare-fun e!105481 () Bool)

(assert (=> b!161389 (= e!105480 (and e!105481 mapRes!5873))))

(declare-fun condMapEmpty!5873 () Bool)

(declare-fun mapDefault!5873 () ValueCell!1385)

(assert (=> b!161389 (= condMapEmpty!5873 (= (arr!2831 (_values!3264 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1385)) mapDefault!5873)))))

(declare-fun b!161390 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!77 (array!5973 array!5975 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 64) Int) Unit!4999)

(assert (=> b!161390 (= e!105484 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!77 (_keys!5081 thiss!1248) (_values!3264 thiss!1248) (mask!7874 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) key!828 (defaultEntry!3281 thiss!1248)))))

(declare-fun b!161391 () Bool)

(assert (=> b!161391 (= e!105481 tp_is_empty!3457)))

(declare-fun b!161392 () Bool)

(declare-fun res!76462 () Bool)

(assert (=> b!161392 (=> (not res!76462) (not e!105483))))

(assert (=> b!161392 (= res!76462 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76464 () Bool)

(assert (=> start!16198 (=> (not res!76464) (not e!105483))))

(declare-fun valid!769 (LongMapFixedSize!1678) Bool)

(assert (=> start!16198 (= res!76464 (valid!769 thiss!1248))))

(assert (=> start!16198 e!105483))

(assert (=> start!16198 e!105479))

(assert (=> start!16198 true))

(assert (= (and start!16198 res!76464) b!161392))

(assert (= (and b!161392 res!76462) b!161386))

(assert (= (and b!161386 res!76463) b!161385))

(assert (= (and b!161385 c!29945) b!161384))

(assert (= (and b!161385 (not c!29945)) b!161390))

(assert (= (and b!161389 condMapEmpty!5873) mapIsEmpty!5873))

(assert (= (and b!161389 (not condMapEmpty!5873)) mapNonEmpty!5873))

(assert (= (and mapNonEmpty!5873 ((_ is ValueCellFull!1385) mapValue!5873)) b!161388))

(assert (= (and b!161389 ((_ is ValueCellFull!1385) mapDefault!5873)) b!161391))

(assert (= b!161387 b!161389))

(assert (= start!16198 b!161387))

(declare-fun m!192373 () Bool)

(assert (=> b!161386 m!192373))

(declare-fun m!192375 () Bool)

(assert (=> b!161390 m!192375))

(declare-fun m!192377 () Bool)

(assert (=> mapNonEmpty!5873 m!192377))

(declare-fun m!192379 () Bool)

(assert (=> b!161387 m!192379))

(declare-fun m!192381 () Bool)

(assert (=> b!161387 m!192381))

(declare-fun m!192383 () Bool)

(assert (=> b!161385 m!192383))

(assert (=> b!161385 m!192383))

(declare-fun m!192385 () Bool)

(assert (=> b!161385 m!192385))

(declare-fun m!192387 () Bool)

(assert (=> b!161384 m!192387))

(declare-fun m!192389 () Bool)

(assert (=> start!16198 m!192389))

(check-sat (not b!161387) (not b!161390) (not b_next!3655) (not b!161386) (not b!161385) b_and!10043 tp_is_empty!3457 (not mapNonEmpty!5873) (not b!161384) (not start!16198))
(check-sat b_and!10043 (not b_next!3655))
