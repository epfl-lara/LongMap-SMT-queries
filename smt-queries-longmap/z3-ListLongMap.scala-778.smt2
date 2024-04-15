; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18434 () Bool)

(assert start!18434)

(declare-fun b!182645 () Bool)

(declare-fun b_free!4507 () Bool)

(declare-fun b_next!4507 () Bool)

(assert (=> b!182645 (= b_free!4507 (not b_next!4507))))

(declare-fun tp!16285 () Bool)

(declare-fun b_and!11047 () Bool)

(assert (=> b!182645 (= tp!16285 b_and!11047)))

(declare-fun mapNonEmpty!7346 () Bool)

(declare-fun mapRes!7346 () Bool)

(declare-fun tp!16286 () Bool)

(declare-fun e!120252 () Bool)

(assert (=> mapNonEmpty!7346 (= mapRes!7346 (and tp!16286 e!120252))))

(declare-datatypes ((V!5353 0))(
  ( (V!5354 (val!2184 Int)) )
))
(declare-datatypes ((ValueCell!1796 0))(
  ( (ValueCellFull!1796 (v!4079 V!5353)) (EmptyCell!1796) )
))
(declare-fun mapRest!7346 () (Array (_ BitVec 32) ValueCell!1796))

(declare-fun mapValue!7346 () ValueCell!1796)

(declare-datatypes ((array!7727 0))(
  ( (array!7728 (arr!3652 (Array (_ BitVec 32) (_ BitVec 64))) (size!3965 (_ BitVec 32))) )
))
(declare-datatypes ((array!7729 0))(
  ( (array!7730 (arr!3653 (Array (_ BitVec 32) ValueCell!1796)) (size!3966 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2500 0))(
  ( (LongMapFixedSize!2501 (defaultEntry!3738 Int) (mask!8788 (_ BitVec 32)) (extraKeys!3475 (_ BitVec 32)) (zeroValue!3579 V!5353) (minValue!3579 V!5353) (_size!1299 (_ BitVec 32)) (_keys!5652 array!7727) (_values!3721 array!7729) (_vacant!1299 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2500)

(declare-fun mapKey!7346 () (_ BitVec 32))

(assert (=> mapNonEmpty!7346 (= (arr!3653 (_values!3721 thiss!1248)) (store mapRest!7346 mapKey!7346 mapValue!7346))))

(declare-fun b!182643 () Bool)

(declare-fun e!120253 () Bool)

(declare-fun e!120250 () Bool)

(assert (=> b!182643 (= e!120253 e!120250)))

(declare-fun res!86416 () Bool)

(assert (=> b!182643 (=> (not res!86416) (not e!120250))))

(declare-datatypes ((SeekEntryResult!618 0))(
  ( (MissingZero!618 (index!4642 (_ BitVec 32))) (Found!618 (index!4643 (_ BitVec 32))) (Intermediate!618 (undefined!1430 Bool) (index!4644 (_ BitVec 32)) (x!19927 (_ BitVec 32))) (Undefined!618) (MissingVacant!618 (index!4645 (_ BitVec 32))) )
))
(declare-fun lt!90222 () SeekEntryResult!618)

(get-info :version)

(assert (=> b!182643 (= res!86416 (and (not ((_ is Undefined!618) lt!90222)) (not ((_ is MissingVacant!618) lt!90222)) (not ((_ is MissingZero!618) lt!90222)) ((_ is Found!618) lt!90222)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7727 (_ BitVec 32)) SeekEntryResult!618)

(assert (=> b!182643 (= lt!90222 (seekEntryOrOpen!0 key!828 (_keys!5652 thiss!1248) (mask!8788 thiss!1248)))))

(declare-fun b!182644 () Bool)

(declare-fun res!86419 () Bool)

(assert (=> b!182644 (=> (not res!86419) (not e!120250))))

(assert (=> b!182644 (= res!86419 (and (= (size!3966 (_values!3721 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8788 thiss!1248))) (= (size!3965 (_keys!5652 thiss!1248)) (size!3966 (_values!3721 thiss!1248))) (bvsge (mask!8788 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3475 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3475 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!120249 () Bool)

(declare-fun e!120254 () Bool)

(declare-fun tp_is_empty!4279 () Bool)

(declare-fun array_inv!2361 (array!7727) Bool)

(declare-fun array_inv!2362 (array!7729) Bool)

(assert (=> b!182645 (= e!120249 (and tp!16285 tp_is_empty!4279 (array_inv!2361 (_keys!5652 thiss!1248)) (array_inv!2362 (_values!3721 thiss!1248)) e!120254))))

(declare-fun b!182646 () Bool)

(assert (=> b!182646 (= e!120250 false)))

(declare-fun lt!90221 () Bool)

(declare-datatypes ((List!2319 0))(
  ( (Nil!2316) (Cons!2315 (h!2944 (_ BitVec 64)) (t!7174 List!2319)) )
))
(declare-fun arrayNoDuplicates!0 (array!7727 (_ BitVec 32) List!2319) Bool)

(assert (=> b!182646 (= lt!90221 (arrayNoDuplicates!0 (_keys!5652 thiss!1248) #b00000000000000000000000000000000 Nil!2316))))

(declare-fun b!182647 () Bool)

(declare-fun e!120251 () Bool)

(assert (=> b!182647 (= e!120254 (and e!120251 mapRes!7346))))

(declare-fun condMapEmpty!7346 () Bool)

(declare-fun mapDefault!7346 () ValueCell!1796)

(assert (=> b!182647 (= condMapEmpty!7346 (= (arr!3653 (_values!3721 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1796)) mapDefault!7346)))))

(declare-fun b!182648 () Bool)

(assert (=> b!182648 (= e!120251 tp_is_empty!4279)))

(declare-fun b!182649 () Bool)

(declare-fun res!86418 () Bool)

(assert (=> b!182649 (=> (not res!86418) (not e!120250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7727 (_ BitVec 32)) Bool)

(assert (=> b!182649 (= res!86418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5652 thiss!1248) (mask!8788 thiss!1248)))))

(declare-fun b!182650 () Bool)

(assert (=> b!182650 (= e!120252 tp_is_empty!4279)))

(declare-fun b!182652 () Bool)

(declare-fun res!86414 () Bool)

(assert (=> b!182652 (=> (not res!86414) (not e!120250))))

(declare-datatypes ((tuple2!3378 0))(
  ( (tuple2!3379 (_1!1700 (_ BitVec 64)) (_2!1700 V!5353)) )
))
(declare-datatypes ((List!2320 0))(
  ( (Nil!2317) (Cons!2316 (h!2945 tuple2!3378) (t!7175 List!2320)) )
))
(declare-datatypes ((ListLongMap!2287 0))(
  ( (ListLongMap!2288 (toList!1159 List!2320)) )
))
(declare-fun contains!1250 (ListLongMap!2287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!792 (array!7727 array!7729 (_ BitVec 32) (_ BitVec 32) V!5353 V!5353 (_ BitVec 32) Int) ListLongMap!2287)

(assert (=> b!182652 (= res!86414 (contains!1250 (getCurrentListMap!792 (_keys!5652 thiss!1248) (_values!3721 thiss!1248) (mask!8788 thiss!1248) (extraKeys!3475 thiss!1248) (zeroValue!3579 thiss!1248) (minValue!3579 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3738 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7346 () Bool)

(assert (=> mapIsEmpty!7346 mapRes!7346))

(declare-fun b!182653 () Bool)

(declare-fun res!86417 () Bool)

(assert (=> b!182653 (=> (not res!86417) (not e!120253))))

(assert (=> b!182653 (= res!86417 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182651 () Bool)

(declare-fun res!86413 () Bool)

(assert (=> b!182651 (=> (not res!86413) (not e!120250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182651 (= res!86413 (validMask!0 (mask!8788 thiss!1248)))))

(declare-fun res!86415 () Bool)

(assert (=> start!18434 (=> (not res!86415) (not e!120253))))

(declare-fun valid!1054 (LongMapFixedSize!2500) Bool)

(assert (=> start!18434 (= res!86415 (valid!1054 thiss!1248))))

(assert (=> start!18434 e!120253))

(assert (=> start!18434 e!120249))

(assert (=> start!18434 true))

(assert (= (and start!18434 res!86415) b!182653))

(assert (= (and b!182653 res!86417) b!182643))

(assert (= (and b!182643 res!86416) b!182652))

(assert (= (and b!182652 res!86414) b!182651))

(assert (= (and b!182651 res!86413) b!182644))

(assert (= (and b!182644 res!86419) b!182649))

(assert (= (and b!182649 res!86418) b!182646))

(assert (= (and b!182647 condMapEmpty!7346) mapIsEmpty!7346))

(assert (= (and b!182647 (not condMapEmpty!7346)) mapNonEmpty!7346))

(assert (= (and mapNonEmpty!7346 ((_ is ValueCellFull!1796) mapValue!7346)) b!182650))

(assert (= (and b!182647 ((_ is ValueCellFull!1796) mapDefault!7346)) b!182648))

(assert (= b!182645 b!182647))

(assert (= start!18434 b!182645))

(declare-fun m!209853 () Bool)

(assert (=> b!182652 m!209853))

(assert (=> b!182652 m!209853))

(declare-fun m!209855 () Bool)

(assert (=> b!182652 m!209855))

(declare-fun m!209857 () Bool)

(assert (=> b!182645 m!209857))

(declare-fun m!209859 () Bool)

(assert (=> b!182645 m!209859))

(declare-fun m!209861 () Bool)

(assert (=> b!182643 m!209861))

(declare-fun m!209863 () Bool)

(assert (=> b!182646 m!209863))

(declare-fun m!209865 () Bool)

(assert (=> b!182649 m!209865))

(declare-fun m!209867 () Bool)

(assert (=> mapNonEmpty!7346 m!209867))

(declare-fun m!209869 () Bool)

(assert (=> b!182651 m!209869))

(declare-fun m!209871 () Bool)

(assert (=> start!18434 m!209871))

(check-sat (not b!182651) (not b_next!4507) (not b!182643) (not b!182652) tp_is_empty!4279 (not start!18434) (not mapNonEmpty!7346) (not b!182646) (not b!182645) (not b!182649) b_and!11047)
(check-sat b_and!11047 (not b_next!4507))
