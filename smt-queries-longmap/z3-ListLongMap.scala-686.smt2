; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16622 () Bool)

(assert start!16622)

(declare-fun b!165933 () Bool)

(declare-fun b_free!3927 () Bool)

(declare-fun b_next!3927 () Bool)

(assert (=> b!165933 (= b_free!3927 (not b_next!3927))))

(declare-fun tp!14382 () Bool)

(declare-fun b_and!10341 () Bool)

(assert (=> b!165933 (= tp!14382 b_and!10341)))

(declare-fun b!165932 () Bool)

(declare-fun res!78804 () Bool)

(declare-fun e!108836 () Bool)

(assert (=> b!165932 (=> (not res!78804) (not e!108836))))

(declare-datatypes ((V!4619 0))(
  ( (V!4620 (val!1909 Int)) )
))
(declare-datatypes ((ValueCell!1521 0))(
  ( (ValueCellFull!1521 (v!3774 V!4619)) (EmptyCell!1521) )
))
(declare-datatypes ((array!6555 0))(
  ( (array!6556 (arr!3113 (Array (_ BitVec 32) (_ BitVec 64))) (size!3401 (_ BitVec 32))) )
))
(declare-datatypes ((array!6557 0))(
  ( (array!6558 (arr!3114 (Array (_ BitVec 32) ValueCell!1521)) (size!3402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1950 0))(
  ( (LongMapFixedSize!1951 (defaultEntry!3417 Int) (mask!8138 (_ BitVec 32)) (extraKeys!3158 (_ BitVec 32)) (zeroValue!3260 V!4619) (minValue!3260 V!4619) (_size!1024 (_ BitVec 32)) (_keys!5242 array!6555) (_values!3400 array!6557) (_vacant!1024 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1950)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165932 (= res!78804 (validMask!0 (mask!8138 thiss!1248)))))

(declare-fun tp_is_empty!3729 () Bool)

(declare-fun e!108840 () Bool)

(declare-fun e!108841 () Bool)

(declare-fun array_inv!1999 (array!6555) Bool)

(declare-fun array_inv!2000 (array!6557) Bool)

(assert (=> b!165933 (= e!108840 (and tp!14382 tp_is_empty!3729 (array_inv!1999 (_keys!5242 thiss!1248)) (array_inv!2000 (_values!3400 thiss!1248)) e!108841))))

(declare-fun b!165934 () Bool)

(declare-fun e!108838 () Bool)

(assert (=> b!165934 (= e!108838 tp_is_empty!3729)))

(declare-fun b!165935 () Bool)

(declare-fun e!108842 () Bool)

(assert (=> b!165935 (= e!108842 e!108836)))

(declare-fun res!78810 () Bool)

(assert (=> b!165935 (=> (not res!78810) (not e!108836))))

(declare-datatypes ((SeekEntryResult!446 0))(
  ( (MissingZero!446 (index!3952 (_ BitVec 32))) (Found!446 (index!3953 (_ BitVec 32))) (Intermediate!446 (undefined!1258 Bool) (index!3954 (_ BitVec 32)) (x!18386 (_ BitVec 32))) (Undefined!446) (MissingVacant!446 (index!3955 (_ BitVec 32))) )
))
(declare-fun lt!83161 () SeekEntryResult!446)

(get-info :version)

(assert (=> b!165935 (= res!78810 (and (not ((_ is Undefined!446) lt!83161)) (not ((_ is MissingVacant!446) lt!83161)) (not ((_ is MissingZero!446) lt!83161)) ((_ is Found!446) lt!83161)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6555 (_ BitVec 32)) SeekEntryResult!446)

(assert (=> b!165935 (= lt!83161 (seekEntryOrOpen!0 key!828 (_keys!5242 thiss!1248) (mask!8138 thiss!1248)))))

(declare-fun b!165936 () Bool)

(declare-fun e!108839 () Bool)

(assert (=> b!165936 (= e!108839 tp_is_empty!3729)))

(declare-fun mapIsEmpty!6312 () Bool)

(declare-fun mapRes!6312 () Bool)

(assert (=> mapIsEmpty!6312 mapRes!6312))

(declare-fun b!165937 () Bool)

(declare-fun res!78807 () Bool)

(assert (=> b!165937 (=> (not res!78807) (not e!108836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6555 (_ BitVec 32)) Bool)

(assert (=> b!165937 (= res!78807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5242 thiss!1248) (mask!8138 thiss!1248)))))

(declare-fun b!165938 () Bool)

(assert (=> b!165938 (= e!108836 false)))

(declare-fun lt!83160 () Bool)

(declare-datatypes ((List!2074 0))(
  ( (Nil!2071) (Cons!2070 (h!2687 (_ BitVec 64)) (t!6876 List!2074)) )
))
(declare-fun arrayNoDuplicates!0 (array!6555 (_ BitVec 32) List!2074) Bool)

(assert (=> b!165938 (= lt!83160 (arrayNoDuplicates!0 (_keys!5242 thiss!1248) #b00000000000000000000000000000000 Nil!2071))))

(declare-fun b!165939 () Bool)

(declare-fun res!78805 () Bool)

(assert (=> b!165939 (=> (not res!78805) (not e!108836))))

(assert (=> b!165939 (= res!78805 (and (= (size!3402 (_values!3400 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8138 thiss!1248))) (= (size!3401 (_keys!5242 thiss!1248)) (size!3402 (_values!3400 thiss!1248))) (bvsge (mask!8138 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3158 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3158 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!78806 () Bool)

(assert (=> start!16622 (=> (not res!78806) (not e!108842))))

(declare-fun valid!861 (LongMapFixedSize!1950) Bool)

(assert (=> start!16622 (= res!78806 (valid!861 thiss!1248))))

(assert (=> start!16622 e!108842))

(assert (=> start!16622 e!108840))

(assert (=> start!16622 true))

(declare-fun b!165940 () Bool)

(declare-fun res!78808 () Bool)

(assert (=> b!165940 (=> (not res!78808) (not e!108836))))

(declare-datatypes ((tuple2!3090 0))(
  ( (tuple2!3091 (_1!1556 (_ BitVec 64)) (_2!1556 V!4619)) )
))
(declare-datatypes ((List!2075 0))(
  ( (Nil!2072) (Cons!2071 (h!2688 tuple2!3090) (t!6877 List!2075)) )
))
(declare-datatypes ((ListLongMap!2045 0))(
  ( (ListLongMap!2046 (toList!1038 List!2075)) )
))
(declare-fun contains!1080 (ListLongMap!2045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!696 (array!6555 array!6557 (_ BitVec 32) (_ BitVec 32) V!4619 V!4619 (_ BitVec 32) Int) ListLongMap!2045)

(assert (=> b!165940 (= res!78808 (not (contains!1080 (getCurrentListMap!696 (_keys!5242 thiss!1248) (_values!3400 thiss!1248) (mask!8138 thiss!1248) (extraKeys!3158 thiss!1248) (zeroValue!3260 thiss!1248) (minValue!3260 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3417 thiss!1248)) key!828)))))

(declare-fun b!165941 () Bool)

(declare-fun res!78809 () Bool)

(assert (=> b!165941 (=> (not res!78809) (not e!108842))))

(assert (=> b!165941 (= res!78809 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6312 () Bool)

(declare-fun tp!14381 () Bool)

(assert (=> mapNonEmpty!6312 (= mapRes!6312 (and tp!14381 e!108839))))

(declare-fun mapRest!6312 () (Array (_ BitVec 32) ValueCell!1521))

(declare-fun mapKey!6312 () (_ BitVec 32))

(declare-fun mapValue!6312 () ValueCell!1521)

(assert (=> mapNonEmpty!6312 (= (arr!3114 (_values!3400 thiss!1248)) (store mapRest!6312 mapKey!6312 mapValue!6312))))

(declare-fun b!165942 () Bool)

(assert (=> b!165942 (= e!108841 (and e!108838 mapRes!6312))))

(declare-fun condMapEmpty!6312 () Bool)

(declare-fun mapDefault!6312 () ValueCell!1521)

(assert (=> b!165942 (= condMapEmpty!6312 (= (arr!3114 (_values!3400 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1521)) mapDefault!6312)))))

(assert (= (and start!16622 res!78806) b!165941))

(assert (= (and b!165941 res!78809) b!165935))

(assert (= (and b!165935 res!78810) b!165940))

(assert (= (and b!165940 res!78808) b!165932))

(assert (= (and b!165932 res!78804) b!165939))

(assert (= (and b!165939 res!78805) b!165937))

(assert (= (and b!165937 res!78807) b!165938))

(assert (= (and b!165942 condMapEmpty!6312) mapIsEmpty!6312))

(assert (= (and b!165942 (not condMapEmpty!6312)) mapNonEmpty!6312))

(assert (= (and mapNonEmpty!6312 ((_ is ValueCellFull!1521) mapValue!6312)) b!165936))

(assert (= (and b!165942 ((_ is ValueCellFull!1521) mapDefault!6312)) b!165934))

(assert (= b!165933 b!165942))

(assert (= start!16622 b!165933))

(declare-fun m!195551 () Bool)

(assert (=> b!165940 m!195551))

(assert (=> b!165940 m!195551))

(declare-fun m!195553 () Bool)

(assert (=> b!165940 m!195553))

(declare-fun m!195555 () Bool)

(assert (=> b!165935 m!195555))

(declare-fun m!195557 () Bool)

(assert (=> mapNonEmpty!6312 m!195557))

(declare-fun m!195559 () Bool)

(assert (=> b!165938 m!195559))

(declare-fun m!195561 () Bool)

(assert (=> b!165937 m!195561))

(declare-fun m!195563 () Bool)

(assert (=> start!16622 m!195563))

(declare-fun m!195565 () Bool)

(assert (=> b!165933 m!195565))

(declare-fun m!195567 () Bool)

(assert (=> b!165933 m!195567))

(declare-fun m!195569 () Bool)

(assert (=> b!165932 m!195569))

(check-sat (not b!165932) (not b_next!3927) (not mapNonEmpty!6312) b_and!10341 tp_is_empty!3729 (not b!165937) (not b!165938) (not b!165940) (not start!16622) (not b!165933) (not b!165935))
(check-sat b_and!10341 (not b_next!3927))
