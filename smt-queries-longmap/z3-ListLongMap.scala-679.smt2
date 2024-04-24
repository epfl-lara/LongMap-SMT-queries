; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16582 () Bool)

(assert start!16582)

(declare-fun b!165258 () Bool)

(declare-fun b_free!3883 () Bool)

(declare-fun b_next!3883 () Bool)

(assert (=> b!165258 (= b_free!3883 (not b_next!3883))))

(declare-fun tp!14249 () Bool)

(declare-fun b_and!10311 () Bool)

(assert (=> b!165258 (= tp!14249 b_and!10311)))

(declare-fun res!78366 () Bool)

(declare-fun e!108401 () Bool)

(assert (=> start!16582 (=> (not res!78366) (not e!108401))))

(declare-datatypes ((V!4561 0))(
  ( (V!4562 (val!1887 Int)) )
))
(declare-datatypes ((ValueCell!1499 0))(
  ( (ValueCellFull!1499 (v!3753 V!4561)) (EmptyCell!1499) )
))
(declare-datatypes ((array!6453 0))(
  ( (array!6454 (arr!3062 (Array (_ BitVec 32) (_ BitVec 64))) (size!3350 (_ BitVec 32))) )
))
(declare-datatypes ((array!6455 0))(
  ( (array!6456 (arr!3063 (Array (_ BitVec 32) ValueCell!1499)) (size!3351 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1906 0))(
  ( (LongMapFixedSize!1907 (defaultEntry!3395 Int) (mask!8102 (_ BitVec 32)) (extraKeys!3136 (_ BitVec 32)) (zeroValue!3238 V!4561) (minValue!3238 V!4561) (_size!1002 (_ BitVec 32)) (_keys!5220 array!6453) (_values!3378 array!6455) (_vacant!1002 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1906)

(declare-fun valid!860 (LongMapFixedSize!1906) Bool)

(assert (=> start!16582 (= res!78366 (valid!860 thiss!1248))))

(assert (=> start!16582 e!108401))

(declare-fun e!108402 () Bool)

(assert (=> start!16582 e!108402))

(assert (=> start!16582 true))

(declare-fun b!165253 () Bool)

(declare-fun res!78367 () Bool)

(assert (=> b!165253 (=> (not res!78367) (not e!108401))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165253 (= res!78367 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165254 () Bool)

(declare-fun e!108403 () Bool)

(declare-fun tp_is_empty!3685 () Bool)

(assert (=> b!165254 (= e!108403 tp_is_empty!3685)))

(declare-fun b!165255 () Bool)

(declare-fun e!108399 () Bool)

(assert (=> b!165255 (= e!108399 false)))

(declare-fun lt!83088 () Bool)

(declare-datatypes ((List!2032 0))(
  ( (Nil!2029) (Cons!2028 (h!2645 (_ BitVec 64)) (t!6826 List!2032)) )
))
(declare-fun arrayNoDuplicates!0 (array!6453 (_ BitVec 32) List!2032) Bool)

(assert (=> b!165255 (= lt!83088 (arrayNoDuplicates!0 (_keys!5220 thiss!1248) #b00000000000000000000000000000000 Nil!2029))))

(declare-fun mapNonEmpty!6246 () Bool)

(declare-fun mapRes!6246 () Bool)

(declare-fun tp!14250 () Bool)

(assert (=> mapNonEmpty!6246 (= mapRes!6246 (and tp!14250 e!108403))))

(declare-fun mapValue!6246 () ValueCell!1499)

(declare-fun mapRest!6246 () (Array (_ BitVec 32) ValueCell!1499))

(declare-fun mapKey!6246 () (_ BitVec 32))

(assert (=> mapNonEmpty!6246 (= (arr!3063 (_values!3378 thiss!1248)) (store mapRest!6246 mapKey!6246 mapValue!6246))))

(declare-fun b!165256 () Bool)

(declare-fun e!108404 () Bool)

(declare-fun e!108398 () Bool)

(assert (=> b!165256 (= e!108404 (and e!108398 mapRes!6246))))

(declare-fun condMapEmpty!6246 () Bool)

(declare-fun mapDefault!6246 () ValueCell!1499)

(assert (=> b!165256 (= condMapEmpty!6246 (= (arr!3063 (_values!3378 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1499)) mapDefault!6246)))))

(declare-fun b!165257 () Bool)

(declare-fun res!78368 () Bool)

(assert (=> b!165257 (=> (not res!78368) (not e!108399))))

(declare-datatypes ((tuple2!3012 0))(
  ( (tuple2!3013 (_1!1517 (_ BitVec 64)) (_2!1517 V!4561)) )
))
(declare-datatypes ((List!2033 0))(
  ( (Nil!2030) (Cons!2029 (h!2646 tuple2!3012) (t!6827 List!2033)) )
))
(declare-datatypes ((ListLongMap!1973 0))(
  ( (ListLongMap!1974 (toList!1002 List!2033)) )
))
(declare-fun contains!1054 (ListLongMap!1973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!664 (array!6453 array!6455 (_ BitVec 32) (_ BitVec 32) V!4561 V!4561 (_ BitVec 32) Int) ListLongMap!1973)

(assert (=> b!165257 (= res!78368 (not (contains!1054 (getCurrentListMap!664 (_keys!5220 thiss!1248) (_values!3378 thiss!1248) (mask!8102 thiss!1248) (extraKeys!3136 thiss!1248) (zeroValue!3238 thiss!1248) (minValue!3238 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3395 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!6246 () Bool)

(assert (=> mapIsEmpty!6246 mapRes!6246))

(declare-fun array_inv!1965 (array!6453) Bool)

(declare-fun array_inv!1966 (array!6455) Bool)

(assert (=> b!165258 (= e!108402 (and tp!14249 tp_is_empty!3685 (array_inv!1965 (_keys!5220 thiss!1248)) (array_inv!1966 (_values!3378 thiss!1248)) e!108404))))

(declare-fun b!165259 () Bool)

(declare-fun res!78364 () Bool)

(assert (=> b!165259 (=> (not res!78364) (not e!108399))))

(assert (=> b!165259 (= res!78364 (and (= (size!3351 (_values!3378 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8102 thiss!1248))) (= (size!3350 (_keys!5220 thiss!1248)) (size!3351 (_values!3378 thiss!1248))) (bvsge (mask!8102 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3136 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3136 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165260 () Bool)

(assert (=> b!165260 (= e!108401 e!108399)))

(declare-fun res!78369 () Bool)

(assert (=> b!165260 (=> (not res!78369) (not e!108399))))

(declare-datatypes ((SeekEntryResult!427 0))(
  ( (MissingZero!427 (index!3876 (_ BitVec 32))) (Found!427 (index!3877 (_ BitVec 32))) (Intermediate!427 (undefined!1239 Bool) (index!3878 (_ BitVec 32)) (x!18311 (_ BitVec 32))) (Undefined!427) (MissingVacant!427 (index!3879 (_ BitVec 32))) )
))
(declare-fun lt!83087 () SeekEntryResult!427)

(get-info :version)

(assert (=> b!165260 (= res!78369 (and (not ((_ is Undefined!427) lt!83087)) (not ((_ is MissingVacant!427) lt!83087)) (not ((_ is MissingZero!427) lt!83087)) ((_ is Found!427) lt!83087)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6453 (_ BitVec 32)) SeekEntryResult!427)

(assert (=> b!165260 (= lt!83087 (seekEntryOrOpen!0 key!828 (_keys!5220 thiss!1248) (mask!8102 thiss!1248)))))

(declare-fun b!165261 () Bool)

(declare-fun res!78365 () Bool)

(assert (=> b!165261 (=> (not res!78365) (not e!108399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6453 (_ BitVec 32)) Bool)

(assert (=> b!165261 (= res!78365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5220 thiss!1248) (mask!8102 thiss!1248)))))

(declare-fun b!165262 () Bool)

(declare-fun res!78363 () Bool)

(assert (=> b!165262 (=> (not res!78363) (not e!108399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165262 (= res!78363 (validMask!0 (mask!8102 thiss!1248)))))

(declare-fun b!165263 () Bool)

(assert (=> b!165263 (= e!108398 tp_is_empty!3685)))

(assert (= (and start!16582 res!78366) b!165253))

(assert (= (and b!165253 res!78367) b!165260))

(assert (= (and b!165260 res!78369) b!165257))

(assert (= (and b!165257 res!78368) b!165262))

(assert (= (and b!165262 res!78363) b!165259))

(assert (= (and b!165259 res!78364) b!165261))

(assert (= (and b!165261 res!78365) b!165255))

(assert (= (and b!165256 condMapEmpty!6246) mapIsEmpty!6246))

(assert (= (and b!165256 (not condMapEmpty!6246)) mapNonEmpty!6246))

(assert (= (and mapNonEmpty!6246 ((_ is ValueCellFull!1499) mapValue!6246)) b!165254))

(assert (= (and b!165256 ((_ is ValueCellFull!1499) mapDefault!6246)) b!165263))

(assert (= b!165258 b!165256))

(assert (= start!16582 b!165258))

(declare-fun m!195293 () Bool)

(assert (=> b!165257 m!195293))

(assert (=> b!165257 m!195293))

(declare-fun m!195295 () Bool)

(assert (=> b!165257 m!195295))

(declare-fun m!195297 () Bool)

(assert (=> b!165262 m!195297))

(declare-fun m!195299 () Bool)

(assert (=> b!165258 m!195299))

(declare-fun m!195301 () Bool)

(assert (=> b!165258 m!195301))

(declare-fun m!195303 () Bool)

(assert (=> b!165260 m!195303))

(declare-fun m!195305 () Bool)

(assert (=> start!16582 m!195305))

(declare-fun m!195307 () Bool)

(assert (=> b!165261 m!195307))

(declare-fun m!195309 () Bool)

(assert (=> b!165255 m!195309))

(declare-fun m!195311 () Bool)

(assert (=> mapNonEmpty!6246 m!195311))

(check-sat (not b!165261) (not start!16582) (not b!165257) tp_is_empty!3685 b_and!10311 (not b_next!3883) (not mapNonEmpty!6246) (not b!165262) (not b!165260) (not b!165255) (not b!165258))
(check-sat b_and!10311 (not b_next!3883))
