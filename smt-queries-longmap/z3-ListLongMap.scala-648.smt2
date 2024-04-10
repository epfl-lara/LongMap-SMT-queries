; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16238 () Bool)

(assert start!16238)

(declare-fun b!162004 () Bool)

(declare-fun b_free!3699 () Bool)

(declare-fun b_next!3699 () Bool)

(assert (=> b!162004 (= b_free!3699 (not b_next!3699))))

(declare-fun tp!13667 () Bool)

(declare-fun b_and!10113 () Bool)

(assert (=> b!162004 (= tp!13667 b_and!10113)))

(declare-fun b!161999 () Bool)

(declare-fun e!106021 () Bool)

(declare-fun e!106023 () Bool)

(declare-fun mapRes!5939 () Bool)

(assert (=> b!161999 (= e!106021 (and e!106023 mapRes!5939))))

(declare-fun condMapEmpty!5939 () Bool)

(declare-datatypes ((V!4315 0))(
  ( (V!4316 (val!1795 Int)) )
))
(declare-datatypes ((ValueCell!1407 0))(
  ( (ValueCellFull!1407 (v!3660 V!4315)) (EmptyCell!1407) )
))
(declare-datatypes ((array!6081 0))(
  ( (array!6082 (arr!2885 (Array (_ BitVec 32) (_ BitVec 64))) (size!3169 (_ BitVec 32))) )
))
(declare-datatypes ((array!6083 0))(
  ( (array!6084 (arr!2886 (Array (_ BitVec 32) ValueCell!1407)) (size!3170 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1722 0))(
  ( (LongMapFixedSize!1723 (defaultEntry!3303 Int) (mask!7911 (_ BitVec 32)) (extraKeys!3044 (_ BitVec 32)) (zeroValue!3146 V!4315) (minValue!3146 V!4315) (_size!910 (_ BitVec 32)) (_keys!5104 array!6081) (_values!3286 array!6083) (_vacant!910 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1722)

(declare-fun mapDefault!5939 () ValueCell!1407)

(assert (=> b!161999 (= condMapEmpty!5939 (= (arr!2886 (_values!3286 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1407)) mapDefault!5939)))))

(declare-fun b!162000 () Bool)

(declare-fun e!106022 () Bool)

(assert (=> b!162000 (= e!106022 false)))

(declare-fun lt!82344 () Bool)

(declare-datatypes ((tuple2!2982 0))(
  ( (tuple2!2983 (_1!1502 Bool) (_2!1502 LongMapFixedSize!1722)) )
))
(declare-fun lt!82343 () tuple2!2982)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2984 0))(
  ( (tuple2!2985 (_1!1503 (_ BitVec 64)) (_2!1503 V!4315)) )
))
(declare-datatypes ((List!1983 0))(
  ( (Nil!1980) (Cons!1979 (h!2592 tuple2!2984) (t!6785 List!1983)) )
))
(declare-datatypes ((ListLongMap!1961 0))(
  ( (ListLongMap!1962 (toList!996 List!1983)) )
))
(declare-fun contains!1032 (ListLongMap!1961 (_ BitVec 64)) Bool)

(declare-fun map!1670 (LongMapFixedSize!1722) ListLongMap!1961)

(assert (=> b!162000 (= lt!82344 (contains!1032 (map!1670 (_2!1502 lt!82343)) key!828))))

(declare-fun res!76747 () Bool)

(declare-fun e!106025 () Bool)

(assert (=> start!16238 (=> (not res!76747) (not e!106025))))

(declare-fun valid!783 (LongMapFixedSize!1722) Bool)

(assert (=> start!16238 (= res!76747 (valid!783 thiss!1248))))

(assert (=> start!16238 e!106025))

(declare-fun e!106020 () Bool)

(assert (=> start!16238 e!106020))

(assert (=> start!16238 true))

(declare-fun tp_is_empty!3501 () Bool)

(assert (=> start!16238 tp_is_empty!3501))

(declare-fun b!162001 () Bool)

(declare-fun e!106026 () Bool)

(assert (=> b!162001 (= e!106025 e!106026)))

(declare-fun res!76751 () Bool)

(assert (=> b!162001 (=> (not res!76751) (not e!106026))))

(declare-datatypes ((SeekEntryResult!367 0))(
  ( (MissingZero!367 (index!3636 (_ BitVec 32))) (Found!367 (index!3637 (_ BitVec 32))) (Intermediate!367 (undefined!1179 Bool) (index!3638 (_ BitVec 32)) (x!17895 (_ BitVec 32))) (Undefined!367) (MissingVacant!367 (index!3639 (_ BitVec 32))) )
))
(declare-fun lt!82345 () SeekEntryResult!367)

(get-info :version)

(assert (=> b!162001 (= res!76751 (and (not ((_ is Undefined!367) lt!82345)) ((_ is MissingVacant!367) lt!82345)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6081 (_ BitVec 32)) SeekEntryResult!367)

(assert (=> b!162001 (= lt!82345 (seekEntryOrOpen!0 key!828 (_keys!5104 thiss!1248) (mask!7911 thiss!1248)))))

(declare-fun b!162002 () Bool)

(declare-fun res!76748 () Bool)

(assert (=> b!162002 (=> (not res!76748) (not e!106022))))

(assert (=> b!162002 (= res!76748 (_1!1502 lt!82343))))

(declare-fun b!162003 () Bool)

(assert (=> b!162003 (= e!106023 tp_is_empty!3501)))

(declare-fun array_inv!1845 (array!6081) Bool)

(declare-fun array_inv!1846 (array!6083) Bool)

(assert (=> b!162004 (= e!106020 (and tp!13667 tp_is_empty!3501 (array_inv!1845 (_keys!5104 thiss!1248)) (array_inv!1846 (_values!3286 thiss!1248)) e!106021))))

(declare-fun b!162005 () Bool)

(declare-fun res!76750 () Bool)

(assert (=> b!162005 (=> (not res!76750) (not e!106025))))

(assert (=> b!162005 (= res!76750 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5939 () Bool)

(assert (=> mapIsEmpty!5939 mapRes!5939))

(declare-fun mapNonEmpty!5939 () Bool)

(declare-fun tp!13666 () Bool)

(declare-fun e!106024 () Bool)

(assert (=> mapNonEmpty!5939 (= mapRes!5939 (and tp!13666 e!106024))))

(declare-fun mapRest!5939 () (Array (_ BitVec 32) ValueCell!1407))

(declare-fun mapValue!5939 () ValueCell!1407)

(declare-fun mapKey!5939 () (_ BitVec 32))

(assert (=> mapNonEmpty!5939 (= (arr!2886 (_values!3286 thiss!1248)) (store mapRest!5939 mapKey!5939 mapValue!5939))))

(declare-fun b!162006 () Bool)

(assert (=> b!162006 (= e!106026 e!106022)))

(declare-fun res!76749 () Bool)

(assert (=> b!162006 (=> (not res!76749) (not e!106022))))

(assert (=> b!162006 (= res!76749 (valid!783 (_2!1502 lt!82343)))))

(declare-fun v!309 () V!4315)

(declare-fun updateHelperNewKey!75 (LongMapFixedSize!1722 (_ BitVec 64) V!4315 (_ BitVec 32)) tuple2!2982)

(assert (=> b!162006 (= lt!82343 (updateHelperNewKey!75 thiss!1248 key!828 v!309 (index!3639 lt!82345)))))

(declare-fun b!162007 () Bool)

(assert (=> b!162007 (= e!106024 tp_is_empty!3501)))

(assert (= (and start!16238 res!76747) b!162005))

(assert (= (and b!162005 res!76750) b!162001))

(assert (= (and b!162001 res!76751) b!162006))

(assert (= (and b!162006 res!76749) b!162002))

(assert (= (and b!162002 res!76748) b!162000))

(assert (= (and b!161999 condMapEmpty!5939) mapIsEmpty!5939))

(assert (= (and b!161999 (not condMapEmpty!5939)) mapNonEmpty!5939))

(assert (= (and mapNonEmpty!5939 ((_ is ValueCellFull!1407) mapValue!5939)) b!162007))

(assert (= (and b!161999 ((_ is ValueCellFull!1407) mapDefault!5939)) b!162003))

(assert (= b!162004 b!161999))

(assert (= start!16238 b!162004))

(declare-fun m!193281 () Bool)

(assert (=> b!162004 m!193281))

(declare-fun m!193283 () Bool)

(assert (=> b!162004 m!193283))

(declare-fun m!193285 () Bool)

(assert (=> start!16238 m!193285))

(declare-fun m!193287 () Bool)

(assert (=> b!162001 m!193287))

(declare-fun m!193289 () Bool)

(assert (=> b!162000 m!193289))

(assert (=> b!162000 m!193289))

(declare-fun m!193291 () Bool)

(assert (=> b!162000 m!193291))

(declare-fun m!193293 () Bool)

(assert (=> b!162006 m!193293))

(declare-fun m!193295 () Bool)

(assert (=> b!162006 m!193295))

(declare-fun m!193297 () Bool)

(assert (=> mapNonEmpty!5939 m!193297))

(check-sat b_and!10113 (not b!162000) (not b!162001) (not b!162006) (not start!16238) (not b!162004) (not mapNonEmpty!5939) (not b_next!3699) tp_is_empty!3501)
(check-sat b_and!10113 (not b_next!3699))
